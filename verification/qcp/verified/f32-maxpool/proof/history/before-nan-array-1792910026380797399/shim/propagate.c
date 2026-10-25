#include "propagate.h"

/* Data observation matches Arm FPCR.DN=0,FZ=0,AH=0. Numeric min/max
   retain their RISC-V minimumNumber/maximumNumber definitions. Integer
   masks restore signaling-NaN priority, operand priority and quiet payload.
   These are ordinary C adapters and require their own actual-body proofs. */
vfloat32m8_t mp_propagate_nan(vfloat32m8_t a,vfloat32m8_t b,vfloat32m8_t numeric,size_t vl) {
  vuint32m8_t ua=__riscv_vreinterpret_v_f32m8_u32m8(a);
  vuint32m8_t ub=__riscv_vreinterpret_v_f32m8_u32m8(b);
  vuint32m8_t aa=__riscv_vand_vx_u32m8(ua,UINT32_C(0x7FFFFFFF),vl);
  vuint32m8_t ab=__riscv_vand_vx_u32m8(ub,UINT32_C(0x7FFFFFFF),vl);
  vbool4_t na=__riscv_vmsgtu_vx_u32m8_b4(aa,UINT32_C(0x7F800000),vl);
  vbool4_t nb=__riscv_vmsgtu_vx_u32m8_b4(ab,UINT32_C(0x7F800000),vl);
  vuint32m8_t ba=__riscv_vand_vx_u32m8(ua,UINT32_C(0x00400000),vl);
  vuint32m8_t bb=__riscv_vand_vx_u32m8(ub,UINT32_C(0x00400000),vl);
  vbool4_t za=__riscv_vmseq_vx_u32m8_b4(ba,0,vl);
  vbool4_t zb=__riscv_vmseq_vx_u32m8_b4(bb,0,vl);
  vbool4_t sa=__riscv_vmand_mm_b4(na,za,vl);
  vbool4_t sb=__riscv_vmand_mm_b4(nb,zb,vl);
  vuint32m8_t qa=__riscv_vor_vx_u32m8(ua,UINT32_C(0x00400000),vl);
  vuint32m8_t qb=__riscv_vor_vx_u32m8(ub,UINT32_C(0x00400000),vl);
  vfloat32m8_t fa=__riscv_vreinterpret_v_u32m8_f32m8(qa);
  vfloat32m8_t fb=__riscv_vreinterpret_v_u32m8_f32m8(qb);
  vfloat32m8_t r=__riscv_vmerge_vvm_f32m8(numeric,fb,nb,vl);
  r=__riscv_vmerge_vvm_f32m8(r,fa,na,vl);
  r=__riscv_vmerge_vvm_f32m8(r,fb,sb,vl);
  return __riscv_vmerge_vvm_f32m8(r,fa,sa,vl);
}
vfloat32m8_t mp_max_vv(vfloat32m8_t a,vfloat32m8_t b,size_t vl) {
  vfloat32m8_t numeric=__riscv_vfmax_vv_f32m8(a,b,vl);
  return mp_propagate_nan(a,b,numeric,vl);
}
vfloat32m8_t mp_min_vv(vfloat32m8_t a,vfloat32m8_t b,size_t vl) {
  vfloat32m8_t numeric=__riscv_vfmin_vv_f32m8(a,b,vl);
  return mp_propagate_nan(a,b,numeric,vl);
}
vfloat32m8_t mp_max_vf(vfloat32m8_t a,float b,size_t vl) {
  vfloat32m8_t vb=__riscv_vfmv_v_f_f32m8(b,vl);
  return mp_max_vv(a,vb,vl);
}
vfloat32m8_t mp_min_vf(vfloat32m8_t a,float b,size_t vl) {
  vfloat32m8_t vb=__riscv_vfmv_v_f_f32m8(b,vl);
  return mp_min_vv(a,vb,vl);
}
