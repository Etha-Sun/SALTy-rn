#include "types.h"
#include "rvv_store_def.h"
/*@ include strategies "rvv_store.strategies" */
float qcp_rvv_get32(const struct vfloat32m8_t *a,unsigned long long i)
/*@ With (L:list fp32) (x0:fp32) (x1:fp32) (x2:fp32) (x3:fp32) (x4:fp32) (x5:fp32) (x6:fp32) (x7:fp32) (x8:fp32) (x9:fp32) (x10:fp32) (x11:fp32) (x12:fp32) (x13:fp32) (x14:fp32) (x15:fp32) (x16:fp32) (x17:fp32) (x18:fp32) (x19:fp32) (x20:fp32) (x21:fp32) (x22:fp32) (x23:fp32) (x24:fp32) (x25:fp32) (x26:fp32) (x27:fp32) (x28:fp32) (x29:fp32) (x30:fp32) (x31:fp32)
 Require 0 <= i && i < 32 && L == rvv_pack32(x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15,x16,x17,x18,x19,x20,x21,x22,x23,x24,x25,x26,x27,x28,x29,x30,x31) && store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * store(&(a->s2),float,x2) * store(&(a->s3),float,x3) * store(&(a->s4),float,x4) * store(&(a->s5),float,x5) * store(&(a->s6),float,x6) * store(&(a->s7),float,x7) * store(&(a->s8),float,x8) * store(&(a->s9),float,x9) * store(&(a->s10),float,x10) * store(&(a->s11),float,x11) * store(&(a->s12),float,x12) * store(&(a->s13),float,x13) * store(&(a->s14),float,x14) * store(&(a->s15),float,x15) * store(&(a->s16),float,x16) * store(&(a->s17),float,x17) * store(&(a->s18),float,x18) * store(&(a->s19),float,x19) * store(&(a->s20),float,x20) * store(&(a->s21),float,x21) * store(&(a->s22),float,x22) * store(&(a->s23),float,x23) * store(&(a->s24),float,x24) * store(&(a->s25),float,x25) * store(&(a->s26),float,x26) * store(&(a->s27),float,x27) * store(&(a->s28),float,x28) * store(&(a->s29),float,x29) * store(&(a->s30),float,x30) * store(&(a->s31),float,x31)
 Ensure fp32_bits_equal(__return,rvv_get(i,L)) && store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * store(&(a->s2),float,x2) * store(&(a->s3),float,x3) * store(&(a->s4),float,x4) * store(&(a->s5),float,x5) * store(&(a->s6),float,x6) * store(&(a->s7),float,x7) * store(&(a->s8),float,x8) * store(&(a->s9),float,x9) * store(&(a->s10),float,x10) * store(&(a->s11),float,x11) * store(&(a->s12),float,x12) * store(&(a->s13),float,x13) * store(&(a->s14),float,x14) * store(&(a->s15),float,x15) * store(&(a->s16),float,x16) * store(&(a->s17),float,x17) * store(&(a->s18),float,x18) * store(&(a->s19),float,x19) * store(&(a->s20),float,x20) * store(&(a->s21),float,x21) * store(&(a->s22),float,x22) * store(&(a->s23),float,x23) * store(&(a->s24),float,x24) * store(&(a->s25),float,x25) * store(&(a->s26),float,x26) * store(&(a->s27),float,x27) * store(&(a->s28),float,x28) * store(&(a->s29),float,x29) * store(&(a->s30),float,x30) * store(&(a->s31),float,x31) */
{
 switch(i) {
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
 case 16: return a->s16;
 case 17: return a->s17;
 case 18: return a->s18;
 case 19: return a->s19;
 case 20: return a->s20;
 case 21: return a->s21;
 case 22: return a->s22;
 case 23: return a->s23;
 case 24: return a->s24;
 case 25: return a->s25;
 case 26: return a->s26;
 case 27: return a->s27;
 case 28: return a->s28;
 case 29: return a->s29;
 case 30: return a->s30;
 case 31: return a->s31;
 default: return 0.0f;
 }
}
void qcp_rvv_store_next(float *p,unsigned long long vl,unsigned long long i,float value)
/*@ With (P:list fp32)
 Require 0 <= i && i < vl && vl <= 32 &&
   FloatArray::seg(p,0,i,P) * FloatArray::undef_seg(p,i,vl)
 Ensure FloatArray::seg(p,0,i+1,rvv_snoc(P,value)) * FloatArray::undef_seg(p,i+1,vl) */
{ p[i] = value; }
void __riscv_vse32_v_f32m8(float *p,const struct vfloat32m8_t *a,unsigned long long vl)
/*@ With (L:list fp32) (x0:fp32) (x1:fp32) (x2:fp32) (x3:fp32) (x4:fp32) (x5:fp32) (x6:fp32) (x7:fp32) (x8:fp32) (x9:fp32) (x10:fp32) (x11:fp32) (x12:fp32) (x13:fp32) (x14:fp32) (x15:fp32) (x16:fp32) (x17:fp32) (x18:fp32) (x19:fp32) (x20:fp32) (x21:fp32) (x22:fp32) (x23:fp32) (x24:fp32) (x25:fp32) (x26:fp32) (x27:fp32) (x28:fp32) (x29:fp32) (x30:fp32) (x31:fp32)
 Require 0 <= vl && vl <= 32 && L == rvv_pack32(x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15,x16,x17,x18,x19,x20,x21,x22,x23,x24,x25,x26,x27,x28,x29,x30,x31) && store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * store(&(a->s2),float,x2) * store(&(a->s3),float,x3) * store(&(a->s4),float,x4) * store(&(a->s5),float,x5) * store(&(a->s6),float,x6) * store(&(a->s7),float,x7) * store(&(a->s8),float,x8) * store(&(a->s9),float,x9) * store(&(a->s10),float,x10) * store(&(a->s11),float,x11) * store(&(a->s12),float,x12) * store(&(a->s13),float,x13) * store(&(a->s14),float,x14) * store(&(a->s15),float,x15) * store(&(a->s16),float,x16) * store(&(a->s17),float,x17) * store(&(a->s18),float,x18) * store(&(a->s19),float,x19) * store(&(a->s20),float,x20) * store(&(a->s21),float,x21) * store(&(a->s22),float,x22) * store(&(a->s23),float,x23) * store(&(a->s24),float,x24) * store(&(a->s25),float,x25) * store(&(a->s26),float,x26) * store(&(a->s27),float,x27) * store(&(a->s28),float,x28) * store(&(a->s29),float,x29) * store(&(a->s30),float,x30) * store(&(a->s31),float,x31) * FloatArray::undef_full(p,vl)
 Ensure store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * store(&(a->s2),float,x2) * store(&(a->s3),float,x3) * store(&(a->s4),float,x4) * store(&(a->s5),float,x5) * store(&(a->s6),float,x6) * store(&(a->s7),float,x7) * store(&(a->s8),float,x8) * store(&(a->s9),float,x9) * store(&(a->s10),float,x10) * store(&(a->s11),float,x11) * store(&(a->s12),float,x12) * store(&(a->s13),float,x13) * store(&(a->s14),float,x14) * store(&(a->s15),float,x15) * store(&(a->s16),float,x16) * store(&(a->s17),float,x17) * store(&(a->s18),float,x18) * store(&(a->s19),float,x19) * store(&(a->s20),float,x20) * store(&(a->s21),float,x21) * store(&(a->s22),float,x22) * store(&(a->s23),float,x23) * store(&(a->s24),float,x24) * store(&(a->s25),float,x25) * store(&(a->s26),float,x26) * store(&(a->s27),float,x27) * store(&(a->s28),float,x28) * store(&(a->s29),float,x29) * store(&(a->s30),float,x30) * store(&(a->s31),float,x31) * FloatArray::full(p,vl,rvv_take(vl,L)) */
{
 unsigned long long i=0;
/*@ Inv 0 <= i && i <= vl && vl <= 32 && p == p@pre && a == a@pre && vl == vl@pre &&
 L == rvv_pack32(x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15,x16,x17,x18,x19,x20,x21,x22,x23,x24,x25,x26,x27,x28,x29,x30,x31) && rvv_length(L) == 32 &&
 store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * store(&(a->s2),float,x2) * store(&(a->s3),float,x3) * store(&(a->s4),float,x4) * store(&(a->s5),float,x5) * store(&(a->s6),float,x6) * store(&(a->s7),float,x7) * store(&(a->s8),float,x8) * store(&(a->s9),float,x9) * store(&(a->s10),float,x10) * store(&(a->s11),float,x11) * store(&(a->s12),float,x12) * store(&(a->s13),float,x13) * store(&(a->s14),float,x14) * store(&(a->s15),float,x15) * store(&(a->s16),float,x16) * store(&(a->s17),float,x17) * store(&(a->s18),float,x18) * store(&(a->s19),float,x19) * store(&(a->s20),float,x20) * store(&(a->s21),float,x21) * store(&(a->s22),float,x22) * store(&(a->s23),float,x23) * store(&(a->s24),float,x24) * store(&(a->s25),float,x25) * store(&(a->s26),float,x26) * store(&(a->s27),float,x27) * store(&(a->s28),float,x28) * store(&(a->s29),float,x29) * store(&(a->s30),float,x30) * store(&(a->s31),float,x31) * FloatArray::seg(p,0,i,rvv_take(i,L)) * FloatArray::undef_seg(p,i,vl) */
 for(; i<vl; ++i) {
  float value=qcp_rvv_get32(a,i);
  qcp_rvv_store_next(p,vl,i,value);
 }
}
