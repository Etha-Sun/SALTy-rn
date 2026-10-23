#include "rvv_store.h"
/*@ include strategies "vcmul_store.strategies" */
float qcp_vcmul_get16(const struct vfloat32m4_t *a,size_t i)
/*@ With (L:list fp32) (x0:fp32) (x1:fp32) (x2:fp32) (x3:fp32) (x4:fp32) (x5:fp32) (x6:fp32) (x7:fp32) (x8:fp32) (x9:fp32) (x10:fp32) (x11:fp32) (x12:fp32) (x13:fp32) (x14:fp32) (x15:fp32)
 Require 0<=i && i<16 && L==vcmul_pack16(x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15) && store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * store(&(a->s2),float,x2) * store(&(a->s3),float,x3) * store(&(a->s4),float,x4) * store(&(a->s5),float,x5) * store(&(a->s6),float,x6) * store(&(a->s7),float,x7) * store(&(a->s8),float,x8) * store(&(a->s9),float,x9) * store(&(a->s10),float,x10) * store(&(a->s11),float,x11) * store(&(a->s12),float,x12) * store(&(a->s13),float,x13) * store(&(a->s14),float,x14) * store(&(a->s15),float,x15)
 Ensure same_fp32(__return,rvv_get(i,L)) && store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * store(&(a->s2),float,x2) * store(&(a->s3),float,x3) * store(&(a->s4),float,x4) * store(&(a->s5),float,x5) * store(&(a->s6),float,x6) * store(&(a->s7),float,x7) * store(&(a->s8),float,x8) * store(&(a->s9),float,x9) * store(&(a->s10),float,x10) * store(&(a->s11),float,x11) * store(&(a->s12),float,x12) * store(&(a->s13),float,x13) * store(&(a->s14),float,x14) * store(&(a->s15),float,x15) */
{
 switch(i){
 case 0: return a->s0;
 case 1: return a->s1;
 case 2: return a->s2;
 case 3: return a->s3;
 case 4: return a->s4;
 case 5: return a->s5;
 case 6: return a->s6;
 case 7: return a->s7;
 case 8: return a->s8;
 case 9: return a->s9;
 case 10: return a->s10;
 case 11: return a->s11;
 case 12: return a->s12;
 case 13: return a->s13;
 case 14: return a->s14;
 case 15: return a->s15;
 default: return 0.0f;
 }
}
void qcp_vcmul_store_next(float *p,size_t vl,size_t i,float value)
/*@ With (P:list fp32)
 Require 0<=i && i<vl && vl<=16 && FloatArray::seg(p,0,i,P) * FloatArray::undef_seg(p,i,vl)
 Ensure FloatArray::seg(p,0,i+1,rvv_snoc(P,value)) * FloatArray::undef_seg(p,i+1,vl) */
{p[i]=value;}
void __riscv_vse32_v_f32m4(float *p,const struct vfloat32m4_t *a,size_t vl)
/*@ With (L:list fp32) (x0:fp32) (x1:fp32) (x2:fp32) (x3:fp32) (x4:fp32) (x5:fp32) (x6:fp32) (x7:fp32) (x8:fp32) (x9:fp32) (x10:fp32) (x11:fp32) (x12:fp32) (x13:fp32) (x14:fp32) (x15:fp32)
 Require 0<=vl && vl<=16 && L==vcmul_pack16(x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15) && store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * store(&(a->s2),float,x2) * store(&(a->s3),float,x3) * store(&(a->s4),float,x4) * store(&(a->s5),float,x5) * store(&(a->s6),float,x6) * store(&(a->s7),float,x7) * store(&(a->s8),float,x8) * store(&(a->s9),float,x9) * store(&(a->s10),float,x10) * store(&(a->s11),float,x11) * store(&(a->s12),float,x12) * store(&(a->s13),float,x13) * store(&(a->s14),float,x14) * store(&(a->s15),float,x15) * FloatArray::undef_full(p,vl)
 Ensure store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * store(&(a->s2),float,x2) * store(&(a->s3),float,x3) * store(&(a->s4),float,x4) * store(&(a->s5),float,x5) * store(&(a->s6),float,x6) * store(&(a->s7),float,x7) * store(&(a->s8),float,x8) * store(&(a->s9),float,x9) * store(&(a->s10),float,x10) * store(&(a->s11),float,x11) * store(&(a->s12),float,x12) * store(&(a->s13),float,x13) * store(&(a->s14),float,x14) * store(&(a->s15),float,x15) * FloatArray::full(p,vl,rvv_take(vl,L)) */
{
 size_t i=0;
/*@ Inv 0<=i && i<=vl && vl<=16 && p==p@pre && a==a@pre && vl==vl@pre && L==vcmul_pack16(x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15) && rvv_length(L)==16 &&
 store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * store(&(a->s2),float,x2) * store(&(a->s3),float,x3) * store(&(a->s4),float,x4) * store(&(a->s5),float,x5) * store(&(a->s6),float,x6) * store(&(a->s7),float,x7) * store(&(a->s8),float,x8) * store(&(a->s9),float,x9) * store(&(a->s10),float,x10) * store(&(a->s11),float,x11) * store(&(a->s12),float,x12) * store(&(a->s13),float,x13) * store(&(a->s14),float,x14) * store(&(a->s15),float,x15) * FloatArray::seg(p,0,i,rvv_take(i,L)) * FloatArray::undef_seg(p,i,vl) */
 for(;i<vl;++i){
  float value=qcp_vcmul_get16(a,i);
  qcp_vcmul_store_next(p,vl,i,value);
 }
}
