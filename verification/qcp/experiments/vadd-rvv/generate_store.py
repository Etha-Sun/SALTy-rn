#!/usr/bin/env python3
"""Generate the RVV32 getter and a VL-prefix store with an explicit loop invariant."""
from pathlib import Path
HERE = Path(__file__).resolve().parent
N = 32
xs = [f'x{i}' for i in range(N)]
pack = 'rvv_pack32(' + ','.join(xs) + ')'
fields = ' * '.join(f'store(&(a->s{i}),float,x{i})' for i in range(N))
binders = '(L:list fp32) ' + ' '.join(f'(x{i}:fp32)' for i in range(N))
model = '''From Coq Require Import ZArith Lia List.
From QcpRvv32 Require Export RvvLogic.
Import ListNotations.
Open Scope Z_scope.
Definition rvv_pack32 ''' + ' '.join(f'({x}:fp32)' for x in xs) + ' : list fp32 := [' + ';'.join(xs) + '''].
Definition rvv_take (i:Z) (xs:list fp32) := firstn (Z.to_nat i) xs.
Definition rvv_get (i:Z) (xs:list fp32) := Znth i xs fp32_zero.
Definition rvv_snoc (xs:list fp32) (x:fp32) := xs ++ [x].
Definition rvv_length (xs:list fp32) := Zlength xs.
Lemma take_step : forall (xs:list fp32) i,
  0 <= i < Zlength xs -> rvv_snoc (rvv_take i xs) (rvv_get i xs) = rvv_take (i+1) xs.
Proof.
  assert (Hnth : forall (n:nat) (l:list fp32), (n < length l)%nat ->
     firstn n l ++ [nth n l fp32_zero] = firstn (S n) l).
  { induction n; destruct l; simpl; intros; try lia; try reflexivity.
    f_equal. apply IHn. lia. }
  intros xs i Hi. unfold rvv_snoc, rvv_take, rvv_get, Znth.
  replace (Z.to_nat (i+1)) with (S (Z.to_nat i)) by lia.
  apply Hnth. rewrite Zlength_correct in Hi. lia.
Qed.
Print Assumptions take_step.
'''
(HERE / 'RvvStoreModel.v').write_text(model)
header = '''/*@ Import Coq Require Import QcpRvv32.RvvStoreModel */
/*@ Extern Coq
 (FloatArray::full : Z -> Z -> list fp32 -> Assertion)
 (FloatArray::undef_full : Z -> Z -> Assertion)
 (FloatArray::seg : Z -> Z -> Z -> list fp32 -> Assertion)
 (FloatArray::undef_seg : Z -> Z -> Z -> Assertion)
 (rvv_take : Z -> list fp32 -> list fp32)
 (rvv_get : Z -> list fp32 -> fp32)
 (rvv_snoc : list fp32 -> fp32 -> list fp32)
 (rvv_length : list fp32 -> Z)
 (rvv_pack32 : ''' + ' -> '.join(['fp32']*N+['list fp32']) + ''') */
'''
(HERE / 'rvv_store_def.h').write_text(header)
getter = 'float qcp_rvv_get32(const struct vfloat32m8_t *a,unsigned long long i)\n'
getter += f'/*@ With {binders}\n Require 0 <= i && i < 32 && L == {pack} && {fields}\n'
getter += f' Ensure fp32_bits_equal(__return,rvv_get(i,L)) && {fields} */\n'
getter += '{\n switch(i) {\n' + '\n'.join(f' case {i}: return a->s{i};' for i in range(N)) + '\n default: return 0.0f;\n }\n}\n'
writer = '''void qcp_rvv_store_next(float *p,unsigned long long vl,unsigned long long i,float value)
/*@ With (P:list fp32)
 Require 0 <= i && i < vl && vl <= 32 &&
   FloatArray::seg(p,0,i,P) * FloatArray::undef_seg(p,i,vl)
 Ensure FloatArray::seg(p,0,i+1,rvv_snoc(P,value)) * FloatArray::undef_seg(p,i+1,vl) */
{ p[i] = value; }
'''
store = 'void __riscv_vse32_v_f32m8(float *p,const struct vfloat32m8_t *a,unsigned long long vl)\n'
store += f'/*@ With {binders}\n Require 0 <= vl && vl <= 32 && L == {pack} && {fields} * FloatArray::undef_full(p,vl)\n'
store += f' Ensure {fields} * FloatArray::full(p,vl,rvv_take(vl,L)) */\n'
store += '{\n unsigned long long i=0;\n'
store += f'/*@ Inv 0 <= i && i <= vl && vl <= 32 && p == p@pre && a == a@pre && vl == vl@pre &&\n L == {pack} && rvv_length(L) == 32 &&\n {fields} * FloatArray::seg(p,0,i,rvv_take(i,L)) * FloatArray::undef_seg(p,i,vl) */\n'
store += ' for(; i<vl; ++i) {\n  float value=qcp_rvv_get32(a,i);\n  qcp_rvv_store_next(p,vl,i,value);\n }\n}\n'
(HERE / 'rvv_store.c').write_text('#include "types.h"\n#include "rvv_store_def.h"\n/*@ include strategies "rvv_store.strategies" */\n' + getter + writer + store)
(HERE / 'rvv_store.strategies').write_text('''#include "rvv_store_def.h"

id : 1
priority : core(1)
left : FloatArray::undef_seg(?p, ?lo, ?hi) at 0
right : undef_data_at(?q,float) at 1
check : infer(q == pointer_offset(p,lo,float));
        infer(lo < hi);
action : left_erase(0);
         right_erase(1);
         left_add(FloatArray::undef_seg(p,lo+1,hi));

id : 2
priority : core(1)
left : FloatArray::seg(?p, ?lo, ?hi, ?l) at 0
right : FloatArray::seg(?q, ?lo2, ?hi2, ?r) at 1
check : infer(p == q);
        infer(lo == lo2);
        infer(hi == hi2);
action : left_erase(0);
         right_erase(1);
         right_add(l == r);

id : 3
priority : core(1)
left : FloatArray::undef_seg(?p, ?lo, ?hi) at 0
right : FloatArray::undef_seg(?q, ?lo2, ?hi2) at 1
check : infer(p == q);
        infer(lo == lo2);
        infer(hi == hi2);
action : left_erase(0);
         right_erase(1);

id : 4
priority : core(0)
left : FloatArray::undef_full(?p, ?n) at 0
right : FloatArray::undef_seg(?q,0,?m) at 1
check : infer(p == q);
        infer(n == m);
action : left_erase(0);
         right_erase(1);

id : 5
priority : core(0)
right : FloatArray::seg(?p,0,0,rvv_take(0,?l)) at 0
action : right_erase(0);
''')
