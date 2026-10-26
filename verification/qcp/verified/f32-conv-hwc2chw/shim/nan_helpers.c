#include "nan_helpers.h"
vfloat32m1_t hc_min_f32m1(const vfloat32m1_t *pa,float b,size_t vl)
/*@ With (A:Recordvfloat32m1_t) Require 0<=vl && vl<=4 && StructPredvfloat32m1_t(pa,A) Ensure exists(R:Recordvfloat32m1_t),hc_clamp_min(R,A,b,vl) && (StructPredvfloat32m1_t(pa,A) * StructPredvfloat32m1_t(&__return,R)) */
{
  vfloat32m1_t a=*pa;
  vuint32m1_t qbits=__riscv_vmv_v_x_u32m1(0x7FC00000u,vl);
  vfloat32m1_t qnan=__riscv_vreinterpret_v_u32m1_f32m1(qbits);
  float bc=hc_copy_float(b);
  if (b!=bc) return qnan;
  vbool32_t nan=__riscv_vmfne_vv_f32m1_b32(a,a,vl);
  vfloat32m1_t r=__riscv_vfmin_vf_f32m1(a,b,vl);
  return __riscv_vmerge_vvm_f32m1(r,qnan,nan,vl);
}
vfloat32m1_t hc_max_f32m1(const vfloat32m1_t *pa,float b,size_t vl)
/*@ With (A:Recordvfloat32m1_t) Require 0<=vl && vl<=4 && StructPredvfloat32m1_t(pa,A) Ensure exists(R:Recordvfloat32m1_t),hc_clamp_max(R,A,b,vl) && (StructPredvfloat32m1_t(pa,A) * StructPredvfloat32m1_t(&__return,R)) */
{
  vfloat32m1_t a=*pa;
  vuint32m1_t qbits=__riscv_vmv_v_x_u32m1(0x7FC00000u,vl);
  vfloat32m1_t qnan=__riscv_vreinterpret_v_u32m1_f32m1(qbits);
  float bc=hc_copy_float(b);
  if (b!=bc) return qnan;
  vbool32_t nan=__riscv_vmfne_vv_f32m1_b32(a,a,vl);
  vfloat32m1_t r=__riscv_vfmax_vf_f32m1(a,b,vl);
  return __riscv_vmerge_vvm_f32m1(r,qnan,nan,vl);
}
