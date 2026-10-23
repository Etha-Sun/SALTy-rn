#!/usr/bin/env python3
"""Generate a minimal broadcast-MUL candidate; never label it kernel-verified."""
from pathlib import Path
import hashlib,json,shutil
ROOT=Path(__file__).resolve().parents[3]
CASE=ROOT/'verification/qcp/candidates/f32-vmulc'
BASE=ROOT/'verification/qcp/verified/f32-vmul'
assert not CASE.exists(), 'Refusing to overwrite candidate'
for directory in ['impl','shim/runtime','proof/coq','proof/c']: (CASE/directory).mkdir(parents=True,exist_ok=True)
sha=lambda path:hashlib.sha256(path.read_bytes()).hexdigest()
originals=[]
for side,name in [('source','testNEON.c'),('target','testRVV.c')]:
 source=ROOT/'kernels'/side/'f32-vmulc.c';destination=CASE/'impl'/name;shutil.copyfile(source,destination)
 originals.append({'original':str(source.relative_to(ROOT)),'copy':'impl/'+name,'sha256':sha(source),'byte_identical':sha(source)==sha(destination)})
# Types retain the same NEON four-float and fixed RVV32 representations.
types='''/*@ Import Coq Require Import VMulc.Model */
/*@ Extern Coq (fp32_bits_equal : fp32 -> fp32 -> Prop)
 (vmulc_active_mul : Z -> Z -> fp32 -> fp32 -> fp32) */
'''
for typ,count in [('float32x4_t',4),('vfloat32m8_t',32)]:
 types+='typedef struct '+typ+' { '+' '.join(f'float s{i};' for i in range(count))+' } '+typ+';\n'
(CASE/'shim/types.h').write_text(types)
fields=lambda v,xs:' * '.join(f'store(&({v}.s{i}),float,{x})' for i,x in enumerate(xs))
xs=[f'x{i}' for i in range(32)]
source='#include "types.h"\n'
source+='''float32x4_t vld1q_dup_f32(const float *p)
/*@ With (c:fp32)
 Require store(p,float,c)
 Ensure store(p,float,c) * '''+fields('__return',['c']*4)+''' */
{
 float32x4_t r;
 r.s0 = *p; r.s1 = *p; r.s2 = *p; r.s3 = *p;
 return r;
}
float qcp_rvv_mulf_lane(float a,float b,unsigned long long i,unsigned long long vl)
/*@ Require 0 <= i && i < 32 && 0 <= vl && vl <= 32 && emp
 Ensure fp32_bits_equal(__return,vmulc_active_mul(i,vl,a,b)) && emp */
{
 if (i < vl) return a*b;
 return 0.0f;
}
vfloat32m8_t __riscv_vfmul_vf_f32m8(vfloat32m8_t a,float b,unsigned long long vl)
/*@ With '''+' '.join(f'({x}:fp32)' for x in xs)+'\n Require 0 <= vl && vl <= 32 && '+fields('a',xs)+'\n Ensure '+fields('__return',[f'vmulc_active_mul({i},vl,x{i},b)' for i in range(32)])+' */\n{\n vfloat32m8_t r;\n'
source+='\n'.join(f' r.s{i}=qcp_rvv_mulf_lane(a.s{i},b,{i},vl);' for i in range(32))+'\n return r;\n}\n'
(CASE/'shim/primitives.c').write_text(source)
model='''From Coq Require Import ZArith Reals Strings.String List Lia.
From SimpleC.SL Require Export Mem SeparationLogic.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope string_scope.
Local Open Scope sac.
Definition fp32_bits_equal (x y:fp32) : Prop := x=y.
Definition vmulc_active_mul (i vl:Z) (x c:fp32) : fp32 :=
 if Z.ltb i vl then fp32_mul x c else fp32_of_real (0.0%R).
Definition vmulc_values (n:Z) (a:list fp32) (c:fp32) : list fp32 :=
 List.firstn (Z.to_nat n) (List.map (fun x=>fp32_mul x c) a).
'''
for typ,count in [('float32x4_t',4),('vfloat32m8_t',32)]:
 model+='Definition UndefStructPred'+typ+' (p:Z) : Assertion :=\n'+' **\n'.join(f' (&(p # "{typ}" ->ₛ "s{i}")) # Float |->_' for i in range(count))+'.\n'
model+='''Lemma local_field_address : forall (v t f:string),
 eval_addr_expr (RE_addr_of (LE_arrow_field
  (RE_const (eval_addr_expr (RE_addr_of (LE_var v))) (FET_alias t)) f)) =
 eval_addr_expr (RE_addr_of (LE_arrow_field (RE_addr_of (LE_var v)) f)).
Proof.
 intros. apply eval_addr_expr_congr. apply RE_addr_of_congr.
 apply LE_arrow_field_congr; [apply eval_addr | reflexivity].
Qed.
'''
(CASE/'proof/coq/Model.v').write_text(model)
# Public contracts are the only kernel contracts; no copied annotated C body.
header='''/* VMULC candidate: pointwise fp32_mul(input_a[i], input_b[0]).
 * Input A needs n+3 readable floats; input_b needs ONE readable float.
 * All buffers disjoint; full binary32 including NaN/Inf/signed zero.
 * C-shim partial correctness only; full kernel proof remains open.
 */
/*@ Import Coq Require Import VMulc.Model */
/*@ Extern Coq (FloatArray::full : Z -> Z -> list fp32 -> Assertion)
 (FloatArray::undef_full : Z -> Z -> Assertion)
 (vmulc_values : Z -> list fp32 -> fp32 -> list fp32) */
#ifndef QCP_RUNTIME_SHIM_H
typedef unsigned long long size_t;
struct xnn_f32_default_params { char unused; };
#endif
'''
spec=header
for name in ['test_neon','test_rvv']:
 spec+=f'''void {name}(size_t batch,const float *input_a,const float *input_b,
 float *output,const struct xnn_f32_default_params *params)
/*@ With (A:list fp32) (c:fp32)
 Require 0 < batch && batch <= 18446744073709551603 && batch % 4 == 0 &&
 params != 0 && input_a != 0 && input_b != 0 && output != 0 &&
 FloatArray::full(input_a,batch/4+3,A) * store(input_b,float,c) * FloatArray::undef_full(output,batch/4)
 Ensure FloatArray::full(input_a,batch/4+3,A) * store(input_b,float,c) *
 FloatArray::full(output,batch/4,vmulc_values(batch/4,A,c)) */;
'''
spec+='''int equivalent(size_t n,const float *input_a,const float *input_b,float *left,float *right)
/*@ With (A:list fp32) (c:fp32)
 Require 0 < n && n <= 4611686018427387900 &&
 FloatArray::full(input_a,n+3,A) * store(input_b,float,c) *
 FloatArray::undef_full(left,n) * FloatArray::undef_full(right,n)
 Ensure __return == 1 && FloatArray::full(input_a,n+3,A) * store(input_b,float,c) *
 FloatArray::full(left,n,vmulc_values(n,A,c)) * FloatArray::full(right,n,vmulc_values(n,A,c)) */
{
 struct xnn_f32_default_params params;
 params.unused=0;
 test_neon(n*sizeof(float),input_a,input_b,left,&params);
 test_rvv(n*sizeof(float),input_a,input_b,right,&params);
 for(size_t i=0;i<n;++i)
  if(!(left[i]==right[i] || (left[i]!=left[i] && right[i]!=right[i]))) return 0;
 return 1;
}
'''
(CASE/'spec.c').write_text(spec)
# Native validation reuses the existing MUL runtime; new routines have C bodies.
for f in (BASE/'shim/runtime').glob('*'):
 if f.suffix in ['.c','.h']:shutil.copyfile(f,CASE/'shim/runtime'/f.name)
f=CASE/'shim/runtime/float_ops.h';f.write_text(f.read_text().replace('#endif','float32x4_t vld1q_dup_f32(const float *p);\nvfloat32m8_t __riscv_vfmul_vf_f32m8(vfloat32m8_t a,float b,size_t vl);\n#endif'))
f=CASE/'shim/runtime/float_ops.c';f.write_text(f.read_text()+'''
float32x4_t vld1q_dup_f32(const float *p) {
 float32x4_t r; for(size_t i=0;i<4;++i) r.lane[i]=*p; return r;
}
vfloat32m8_t __riscv_vfmul_vf_f32m8(vfloat32m8_t a,float b,size_t vl) {
 vfloat32m8_t r={{0}}; for(size_t i=0;i<vl;++i) r.lane[i]=f32_mul(a.lane[i],b); return r;
}
''')
(CASE/'candidate.json').write_text(json.dumps({'kernel':'f32-vmulc','whole_kernel_verified':False,'originals':originals,'model':'firstn n (map (fun x => fp32_mul x c) A)','scalar_readable_floats':1,'open':['NEON loop/tail VCs','RVV loop VCs','wrapper/comparator full-NaN proof','full C call-closure gate'],'generator_sha256':sha(Path(__file__))},indent=2)+'\n')
print(CASE)
