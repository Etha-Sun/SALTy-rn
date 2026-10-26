#include "rvv_record_consumers.h"
vbool4_t ap_record_rvv_gt32(const vfloat32m8_t*pa,const vfloat32m8_t*pb,size_t vl)
/*@ With (A:Recordvfloat32m8_t) (B:Recordvfloat32m8_t) Require 0<=vl && vl<=32 && StructPredvfloat32m8_t(pa,A)*StructPredvfloat32m8_t(pb,B)
 Ensure exists(R:Recordvbool4_t),ap_record_gt32(R,A,B,vl) && ap_record_mask32(R,vl) && StructPredvfloat32m8_t(pa,A)*StructPredvfloat32m8_t(pb,B)*StructPredvbool4_t(&__return,R) */
{vfloat32m8_t a=*pa;vfloat32m8_t b=*pb;return __riscv_vmfgt_vv_f32m8_b4(a,b,vl) /*@ where a=0,b=0 */;}
vfloat32m8_t ap_record_rvv_merge32(const vfloat32m8_t*pa,const vfloat32m8_t*pb,const vbool4_t*pm,size_t vl)
/*@ With (A:Recordvfloat32m8_t) (B:Recordvfloat32m8_t) (M:Recordvbool4_t) Require 0<=vl && vl<=32 && ap_record_mask32(M,vl) && StructPredvfloat32m8_t(pa,A)*StructPredvfloat32m8_t(pb,B)*StructPredvbool4_t(pm,M)
 Ensure exists(R:Recordvfloat32m8_t),ap_record_merge32(R,M,A,B,vl) && StructPredvfloat32m8_t(pa,A)*StructPredvfloat32m8_t(pb,B)*StructPredvbool4_t(pm,M)*StructPredvfloat32m8_t(&__return,R) */
{vfloat32m8_t a=*pa;vfloat32m8_t b=*pb;vbool4_t m=*pm;return __riscv_vmerge_vvm_f32m8(a,b,m,vl) /*@ where a=0,b=0,m=0 */;}
