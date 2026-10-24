#!/usr/bin/env python3
"""Actual ushort stores and alias-safe tail view; fixed32 RVV lane storage."""
from pathlib import Path
H=Path(__file__).resolve().parent;C=H.parent

def main():
 h='#ifndef QCP_F32F16_MEMORY_NEON_H\n#define QCP_F32F16_MEMORY_NEON_H\n#include "types_def.h"\n';s='#include "memory_neon.h"\n'
 def add(decl,body):
  nonlocal h,s
  h+=decl+';\n';s+=decl+'\n{ '+body+' }\n'
 xs=' '.join('(x'+str(i)+':fp32)'for i in range(4));ins=' * '.join('store(pointer_offset(p,'+str(i)+',float),float,x'+str(i)+')'for i in range(4));ret=' * '.join('store(&(__return.s'+str(i)+'),float,x'+str(i)+')'for i in range(4));decl='float32x4_t vld1q_f32(const float* p)\n/*@ With '+xs+' Require '+ins+' Ensure '+ins+' * '+ret+' */';add(decl,'float32x4_t r; '+' '.join('r.s'+str(i)+'=p['+str(i)+'];'for i in range(4))+' return r;')
 for count,typ in [(8,'uint16x8_t'),(4,'uint16x4_t'),(2,'uint16x4_t'),(1,'uint16x4_t')]:
  n=8 if count==8 else 4
  pre=' * '.join('store(&(a->s'+str(i)+'),unsigned short,x'+str(i)+')'for i in range(n));undef=' * '.join('undef_data_at(pointer_offset(p,'+str(i)+',unsigned short),unsigned short)'for i in range(count));done=' * '.join('store(pointer_offset(p,'+str(i)+',unsigned short),unsigned short,x'+str(i)+')'for i in range(count));name='qcp_f16_store'+str(count)+('_0' if count<4 else '');pt='void*' if count==2 else 'uint16_t*';decl='void '+name+'('+pt+' p,const '+typ+'* a)\n/*@ With '+' '.join('(x'+str(i)+':Z)'for i in range(n))+' Require '+pre+' * '+undef+' Ensure '+pre+' * '+done+' */';body=('uint16_t* out=(uint16_t*)p; 'if count==2 else '')+' '.join(('out' if count==2 else 'p')+'['+str(i)+']=a->s'+str(i)+';'for i in range(count));add(decl,body)
 pre=' * '.join('store(&(a->s'+str(i)+'),unsigned short,x'+str(i)+')'for i in range(4));decl='const uint16x4_t* qcp_f16_u32_view(const uint16x4_t* a)\n/*@ With '+' '.join('(x'+str(i)+':Z)'for i in range(4))+' Require '+pre+' Ensure __return == a && '+pre+' */';add(decl,'return a;')
 add('void qcp_assert(int condition)\n/*@ Require condition != 0 && emp Ensure emp */','')
 h+='''#define vst1q_u16(p,a) qcp_f16_store8((p),&(a))
#define vst1_u16(p,a) qcp_f16_store4((p),&(a))
#define vst1_lane_u16(p,a,n) qcp_f16_store1_##n((p),&(a))
/* Supported composition only: local u16x4 -> unchanged8-byte borrowed view
 * -> lane0 four-byte store. Both actual helper bodies are checked. */
#ifdef vreinterpret_u32_u16
#undef vreinterpret_u32_u16
#endif
#define vreinterpret_u32_u16(a) qcp_f16_u32_view(&(a))
#define vst1_lane_u32(p,a,n) qcp_f16_store2_##n((p),(a))
#define assert(x) qcp_assert((x))
#endif
''';(C/'shim/memory_neon.h').write_text(h);(C/'shim/memory_neon.c').write_text(s)
 # Raw unsigned16 lane model uses bounded nth in the getter contract; a default
 # zero is never substituted without the actual0<=i<32 hypothesis.
 model='''From Coq Require Import ZArith Lia List.
From AUXLib Require Import ListLib.
From SimpleC.SL Require Export Mem SeparationLogic.
Import ListNotations.
Local Open Scope Z_scope.
Definition f16_u16_equal (a b:Z) : Prop := a=b.
Definition f16_pack32 '''+' '.join('(x'+str(i)+':Z)'for i in range(32))+''' : list Z := ['''+';'.join('x'+str(i)for i in range(32))+'''].
Definition f16_take (i:Z) (xs:list Z) := firstn (Z.to_nat i) xs.
Definition f16_get (i:Z) (xs:list Z) := Znth i xs 0.
Definition f16_snoc (xs:list Z) (x:Z) := xs ++ [x].
Definition f16_length (xs:list Z) := Zlength xs.
Lemma f16_take_step : forall (xs:list Z) i,
 0<=i<Zlength xs -> f16_snoc (f16_take i xs) (f16_get i xs)=f16_take (i+1) xs.
Proof.
 assert (Hnth:forall(n:nat)(l:list Z),(n<length l)%nat -> firstn n l++[nth n l 0]=firstn(S n)l).
 { induction n;destruct l;simpl;intros;try lia;try reflexivity;f_equal;apply IHn;lia. }
 intros xs i Hi;unfold f16_snoc,f16_take,f16_get,Znth.
 replace (Z.to_nat(i+1))with(S(Z.to_nat i))by lia;apply Hnth;rewrite Zlength_correct in Hi;lia.
Qed.
Print Assumptions f16_take_step.
''';(H/'coq/UShortStoreModel.v').write_text(model)
 hd='#ifndef QCP_F32F16_USHORT_ARRAY_DEF_H\n#define QCP_F32F16_USHORT_ARRAY_DEF_H\n/*@ Import Coq Require Import F32F16.UShortStoreModel */\n/*@ Extern Coq\n (UShortArray::full : Z -> Z -> list Z -> Assertion)\n (UShortArray::undef_full : Z -> Z -> Assertion)\n (UShortArray::seg : Z -> Z -> Z -> list Z -> Assertion)\n (UShortArray::undef_seg : Z -> Z -> Z -> Assertion)\n (f16_take : Z -> list Z -> list Z)\n (f16_get : Z -> list Z -> Z)\n (f16_snoc : list Z -> Z -> list Z)\n (f16_length : list Z -> Z)\n (f16_u16_equal : Z -> Z -> Prop)\n (f16_pack32 : '+'Z -> '*32+'list Z) */\n#endif\n';(C/'shim/ushort_array_def.h').write_text(hd)
 print('memory_neon actualfunctions7; ushort lane model/interface generated')
if __name__=='__main__':main()
