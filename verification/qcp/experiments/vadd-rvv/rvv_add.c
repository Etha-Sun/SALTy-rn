#include "types.h"
float f32_add(float a, float b)
/*@     Require emp
    Ensure fp32_bits_equal(__return,fp32_add(a,b)) */
{
  return a+b;
}
float qcp_rvv_add_lane32(float a, float b, unsigned long long i, unsigned long long vl)
/*@     Require 0 <= i && i < 32 && 0 <= vl && vl <= 32 && emp
    Ensure fp32_bits_equal(__return,vadd_active_add(i,vl,a,b)) && emp */
{
  if (i < vl) return f32_add(a,b);
  return 0.0f;
}
void __riscv_vfadd_vv_f32m8(struct vfloat32m8_t *r,const struct vfloat32m8_t *a,const struct vfloat32m8_t *b,unsigned long long vl)
/*@ With (x0:fp32) (y0:fp32) (x1:fp32) (y1:fp32) (x2:fp32) (y2:fp32) (x3:fp32) (y3:fp32) (x4:fp32) (y4:fp32) (x5:fp32) (y5:fp32) (x6:fp32) (y6:fp32) (x7:fp32) (y7:fp32) (x8:fp32) (y8:fp32) (x9:fp32) (y9:fp32) (x10:fp32) (y10:fp32) (x11:fp32) (y11:fp32) (x12:fp32) (y12:fp32) (x13:fp32) (y13:fp32) (x14:fp32) (y14:fp32) (x15:fp32) (y15:fp32) (x16:fp32) (y16:fp32) (x17:fp32) (y17:fp32) (x18:fp32) (y18:fp32) (x19:fp32) (y19:fp32) (x20:fp32) (y20:fp32) (x21:fp32) (y21:fp32) (x22:fp32) (y22:fp32) (x23:fp32) (y23:fp32) (x24:fp32) (y24:fp32) (x25:fp32) (y25:fp32) (x26:fp32) (y26:fp32) (x27:fp32) (y27:fp32) (x28:fp32) (y28:fp32) (x29:fp32) (y29:fp32) (x30:fp32) (y30:fp32) (x31:fp32) (y31:fp32)
 Require 0 <= vl && vl <= 32 && store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * store(&(a->s2),float,x2) * store(&(a->s3),float,x3) * store(&(a->s4),float,x4) * store(&(a->s5),float,x5) * store(&(a->s6),float,x6) * store(&(a->s7),float,x7) * store(&(a->s8),float,x8) * store(&(a->s9),float,x9) * store(&(a->s10),float,x10) * store(&(a->s11),float,x11) * store(&(a->s12),float,x12) * store(&(a->s13),float,x13) * store(&(a->s14),float,x14) * store(&(a->s15),float,x15) * store(&(a->s16),float,x16) * store(&(a->s17),float,x17) * store(&(a->s18),float,x18) * store(&(a->s19),float,x19) * store(&(a->s20),float,x20) * store(&(a->s21),float,x21) * store(&(a->s22),float,x22) * store(&(a->s23),float,x23) * store(&(a->s24),float,x24) * store(&(a->s25),float,x25) * store(&(a->s26),float,x26) * store(&(a->s27),float,x27) * store(&(a->s28),float,x28) * store(&(a->s29),float,x29) * store(&(a->s30),float,x30) * store(&(a->s31),float,x31) * store(&(b->s0),float,y0) * store(&(b->s1),float,y1) * store(&(b->s2),float,y2) * store(&(b->s3),float,y3) * store(&(b->s4),float,y4) * store(&(b->s5),float,y5) * store(&(b->s6),float,y6) * store(&(b->s7),float,y7) * store(&(b->s8),float,y8) * store(&(b->s9),float,y9) * store(&(b->s10),float,y10) * store(&(b->s11),float,y11) * store(&(b->s12),float,y12) * store(&(b->s13),float,y13) * store(&(b->s14),float,y14) * store(&(b->s15),float,y15) * store(&(b->s16),float,y16) * store(&(b->s17),float,y17) * store(&(b->s18),float,y18) * store(&(b->s19),float,y19) * store(&(b->s20),float,y20) * store(&(b->s21),float,y21) * store(&(b->s22),float,y22) * store(&(b->s23),float,y23) * store(&(b->s24),float,y24) * store(&(b->s25),float,y25) * store(&(b->s26),float,y26) * store(&(b->s27),float,y27) * store(&(b->s28),float,y28) * store(&(b->s29),float,y29) * store(&(b->s30),float,y30) * store(&(b->s31),float,y31) * undef_data_at(&(r->s0),float) * undef_data_at(&(r->s1),float) * undef_data_at(&(r->s2),float) * undef_data_at(&(r->s3),float) * undef_data_at(&(r->s4),float) * undef_data_at(&(r->s5),float) * undef_data_at(&(r->s6),float) * undef_data_at(&(r->s7),float) * undef_data_at(&(r->s8),float) * undef_data_at(&(r->s9),float) * undef_data_at(&(r->s10),float) * undef_data_at(&(r->s11),float) * undef_data_at(&(r->s12),float) * undef_data_at(&(r->s13),float) * undef_data_at(&(r->s14),float) * undef_data_at(&(r->s15),float) * undef_data_at(&(r->s16),float) * undef_data_at(&(r->s17),float) * undef_data_at(&(r->s18),float) * undef_data_at(&(r->s19),float) * undef_data_at(&(r->s20),float) * undef_data_at(&(r->s21),float) * undef_data_at(&(r->s22),float) * undef_data_at(&(r->s23),float) * undef_data_at(&(r->s24),float) * undef_data_at(&(r->s25),float) * undef_data_at(&(r->s26),float) * undef_data_at(&(r->s27),float) * undef_data_at(&(r->s28),float) * undef_data_at(&(r->s29),float) * undef_data_at(&(r->s30),float) * undef_data_at(&(r->s31),float)
 Ensure store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * store(&(a->s2),float,x2) * store(&(a->s3),float,x3) * store(&(a->s4),float,x4) * store(&(a->s5),float,x5) * store(&(a->s6),float,x6) * store(&(a->s7),float,x7) * store(&(a->s8),float,x8) * store(&(a->s9),float,x9) * store(&(a->s10),float,x10) * store(&(a->s11),float,x11) * store(&(a->s12),float,x12) * store(&(a->s13),float,x13) * store(&(a->s14),float,x14) * store(&(a->s15),float,x15) * store(&(a->s16),float,x16) * store(&(a->s17),float,x17) * store(&(a->s18),float,x18) * store(&(a->s19),float,x19) * store(&(a->s20),float,x20) * store(&(a->s21),float,x21) * store(&(a->s22),float,x22) * store(&(a->s23),float,x23) * store(&(a->s24),float,x24) * store(&(a->s25),float,x25) * store(&(a->s26),float,x26) * store(&(a->s27),float,x27) * store(&(a->s28),float,x28) * store(&(a->s29),float,x29) * store(&(a->s30),float,x30) * store(&(a->s31),float,x31) * store(&(b->s0),float,y0) * store(&(b->s1),float,y1) * store(&(b->s2),float,y2) * store(&(b->s3),float,y3) * store(&(b->s4),float,y4) * store(&(b->s5),float,y5) * store(&(b->s6),float,y6) * store(&(b->s7),float,y7) * store(&(b->s8),float,y8) * store(&(b->s9),float,y9) * store(&(b->s10),float,y10) * store(&(b->s11),float,y11) * store(&(b->s12),float,y12) * store(&(b->s13),float,y13) * store(&(b->s14),float,y14) * store(&(b->s15),float,y15) * store(&(b->s16),float,y16) * store(&(b->s17),float,y17) * store(&(b->s18),float,y18) * store(&(b->s19),float,y19) * store(&(b->s20),float,y20) * store(&(b->s21),float,y21) * store(&(b->s22),float,y22) * store(&(b->s23),float,y23) * store(&(b->s24),float,y24) * store(&(b->s25),float,y25) * store(&(b->s26),float,y26) * store(&(b->s27),float,y27) * store(&(b->s28),float,y28) * store(&(b->s29),float,y29) * store(&(b->s30),float,y30) * store(&(b->s31),float,y31) * store(&(r->s0),float,vadd_active_add(0,vl,x0,y0)) * store(&(r->s1),float,vadd_active_add(1,vl,x1,y1)) * store(&(r->s2),float,vadd_active_add(2,vl,x2,y2)) * store(&(r->s3),float,vadd_active_add(3,vl,x3,y3)) * store(&(r->s4),float,vadd_active_add(4,vl,x4,y4)) * store(&(r->s5),float,vadd_active_add(5,vl,x5,y5)) * store(&(r->s6),float,vadd_active_add(6,vl,x6,y6)) * store(&(r->s7),float,vadd_active_add(7,vl,x7,y7)) * store(&(r->s8),float,vadd_active_add(8,vl,x8,y8)) * store(&(r->s9),float,vadd_active_add(9,vl,x9,y9)) * store(&(r->s10),float,vadd_active_add(10,vl,x10,y10)) * store(&(r->s11),float,vadd_active_add(11,vl,x11,y11)) * store(&(r->s12),float,vadd_active_add(12,vl,x12,y12)) * store(&(r->s13),float,vadd_active_add(13,vl,x13,y13)) * store(&(r->s14),float,vadd_active_add(14,vl,x14,y14)) * store(&(r->s15),float,vadd_active_add(15,vl,x15,y15)) * store(&(r->s16),float,vadd_active_add(16,vl,x16,y16)) * store(&(r->s17),float,vadd_active_add(17,vl,x17,y17)) * store(&(r->s18),float,vadd_active_add(18,vl,x18,y18)) * store(&(r->s19),float,vadd_active_add(19,vl,x19,y19)) * store(&(r->s20),float,vadd_active_add(20,vl,x20,y20)) * store(&(r->s21),float,vadd_active_add(21,vl,x21,y21)) * store(&(r->s22),float,vadd_active_add(22,vl,x22,y22)) * store(&(r->s23),float,vadd_active_add(23,vl,x23,y23)) * store(&(r->s24),float,vadd_active_add(24,vl,x24,y24)) * store(&(r->s25),float,vadd_active_add(25,vl,x25,y25)) * store(&(r->s26),float,vadd_active_add(26,vl,x26,y26)) * store(&(r->s27),float,vadd_active_add(27,vl,x27,y27)) * store(&(r->s28),float,vadd_active_add(28,vl,x28,y28)) * store(&(r->s29),float,vadd_active_add(29,vl,x29,y29)) * store(&(r->s30),float,vadd_active_add(30,vl,x30,y30)) * store(&(r->s31),float,vadd_active_add(31,vl,x31,y31)) */
{
  r->s0=qcp_rvv_add_lane32(a->s0,b->s0,0,vl);
  r->s1=qcp_rvv_add_lane32(a->s1,b->s1,1,vl);
  r->s2=qcp_rvv_add_lane32(a->s2,b->s2,2,vl);
  r->s3=qcp_rvv_add_lane32(a->s3,b->s3,3,vl);
  r->s4=qcp_rvv_add_lane32(a->s4,b->s4,4,vl);
  r->s5=qcp_rvv_add_lane32(a->s5,b->s5,5,vl);
  r->s6=qcp_rvv_add_lane32(a->s6,b->s6,6,vl);
  r->s7=qcp_rvv_add_lane32(a->s7,b->s7,7,vl);
  r->s8=qcp_rvv_add_lane32(a->s8,b->s8,8,vl);
  r->s9=qcp_rvv_add_lane32(a->s9,b->s9,9,vl);
  r->s10=qcp_rvv_add_lane32(a->s10,b->s10,10,vl);
  r->s11=qcp_rvv_add_lane32(a->s11,b->s11,11,vl);
  r->s12=qcp_rvv_add_lane32(a->s12,b->s12,12,vl);
  r->s13=qcp_rvv_add_lane32(a->s13,b->s13,13,vl);
  r->s14=qcp_rvv_add_lane32(a->s14,b->s14,14,vl);
  r->s15=qcp_rvv_add_lane32(a->s15,b->s15,15,vl);
  r->s16=qcp_rvv_add_lane32(a->s16,b->s16,16,vl);
  r->s17=qcp_rvv_add_lane32(a->s17,b->s17,17,vl);
  r->s18=qcp_rvv_add_lane32(a->s18,b->s18,18,vl);
  r->s19=qcp_rvv_add_lane32(a->s19,b->s19,19,vl);
  r->s20=qcp_rvv_add_lane32(a->s20,b->s20,20,vl);
  r->s21=qcp_rvv_add_lane32(a->s21,b->s21,21,vl);
  r->s22=qcp_rvv_add_lane32(a->s22,b->s22,22,vl);
  r->s23=qcp_rvv_add_lane32(a->s23,b->s23,23,vl);
  r->s24=qcp_rvv_add_lane32(a->s24,b->s24,24,vl);
  r->s25=qcp_rvv_add_lane32(a->s25,b->s25,25,vl);
  r->s26=qcp_rvv_add_lane32(a->s26,b->s26,26,vl);
  r->s27=qcp_rvv_add_lane32(a->s27,b->s27,27,vl);
  r->s28=qcp_rvv_add_lane32(a->s28,b->s28,28,vl);
  r->s29=qcp_rvv_add_lane32(a->s29,b->s29,29,vl);
  r->s30=qcp_rvv_add_lane32(a->s30,b->s30,30,vl);
  r->s31=qcp_rvv_add_lane32(a->s31,b->s31,31,vl);
}
