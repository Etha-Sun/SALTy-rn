#include "primitive_contracts.h"
/*@ Import Coq Require Import QcpRvv32.RvvResultBridge */
/*@ Extern Coq (vadd_values : Z -> list fp32 -> list fp32 -> list fp32) */
/*@ include strategies "rvv_arrays.strategies" */
/*@ include strategies "rvv_store.strategies" */
void rvv_chunk(const float *a,const float *b,float *out,unsigned long long vl)
/*@ With (A:list fp32) (B:list fp32)
 Require 0 <= vl && vl <= 32 && FloatArray::full(a,vl,A) * FloatArray::full(b,vl,B) * FloatArray::undef_full(out,vl)
 Ensure FloatArray::full(a,vl,A) * FloatArray::full(b,vl,B) * FloatArray::full(out,vl,vadd_values(vl,A,B)) */
{
 struct vfloat32m8_t va; __riscv_vle32_v_f32m8(&va,a,vl);
 struct vfloat32m8_t vb; __riscv_vle32_v_f32m8(&vb,b,vl);
 struct vfloat32m8_t vacc; __riscv_vfadd_vv_f32m8(&vacc,&va,&vb,vl);
 __riscv_vse32_v_f32m8(out,&vacc,vl);
}
