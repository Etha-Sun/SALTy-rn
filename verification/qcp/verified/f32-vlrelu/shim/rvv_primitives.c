#include "rvv_types.h"
unsigned int qcp_float_bits(float x)
/*@ Require emp Ensure __return == bits_of_fp32(x) && emp */;
int qcp_rvv_signed_bits(float x)
/*@ Require emp Ensure __return == rvv_signed_bits(x) && emp */
{
 unsigned int bits=qcp_float_bits(x);
 if (bits < 2147483648U) return (int)bits;
 return (int)(bits-2147483648U) - 2147483647 - 1;
}
int qcp_rvv_mask_lane(int x,int b,unsigned long long i,unsigned long long vl)
/*@ Require 0 <= i && i < 32 && 0 <= vl && vl <= 32 && emp
 Ensure __return == rvv_mask(i,vl,x,b) && emp */
{ if (i < vl) { if (x < b) return 1; return 0; } return 0; }
float qcp_rvv_merge_lane(float a,float b,int m,unsigned long long i,unsigned long long vl)
/*@ Require 0 <= i && i < 32 && 0 <= vl && vl <= 32 && emp
 Ensure fp32_bits_equal(__return,rvv_merge(i,vl,a,b,m)) && emp */
{ if (i < vl) { if (m == 0) return a; return b; } return 0.0f; }
float qcp_rvv_mulf_lane(float a,float b,unsigned long long i,unsigned long long vl)
/*@ Require 0 <= i && i < 32 && 0 <= vl && vl <= 32 && emp
 Ensure fp32_bits_equal(__return,vlrelu_active_mul(i,vl,a,b)) && emp */
{
 if (i < vl) return a*b;
 return 0.0f;
}
vfloat32m8_t __riscv_vfmul_vf_f32m8(vfloat32m8_t a,float b,unsigned long long vl)
/*@ With (x0:fp32) (x1:fp32) (x2:fp32) (x3:fp32) (x4:fp32) (x5:fp32) (x6:fp32) (x7:fp32) (x8:fp32) (x9:fp32) (x10:fp32) (x11:fp32) (x12:fp32) (x13:fp32) (x14:fp32) (x15:fp32) (x16:fp32) (x17:fp32) (x18:fp32) (x19:fp32) (x20:fp32) (x21:fp32) (x22:fp32) (x23:fp32) (x24:fp32) (x25:fp32) (x26:fp32) (x27:fp32) (x28:fp32) (x29:fp32) (x30:fp32) (x31:fp32)
 Require 0 <= vl && vl <= 32 && store(&(a.s0),float,x0) * store(&(a.s1),float,x1) * store(&(a.s2),float,x2) * store(&(a.s3),float,x3) * store(&(a.s4),float,x4) * store(&(a.s5),float,x5) * store(&(a.s6),float,x6) * store(&(a.s7),float,x7) * store(&(a.s8),float,x8) * store(&(a.s9),float,x9) * store(&(a.s10),float,x10) * store(&(a.s11),float,x11) * store(&(a.s12),float,x12) * store(&(a.s13),float,x13) * store(&(a.s14),float,x14) * store(&(a.s15),float,x15) * store(&(a.s16),float,x16) * store(&(a.s17),float,x17) * store(&(a.s18),float,x18) * store(&(a.s19),float,x19) * store(&(a.s20),float,x20) * store(&(a.s21),float,x21) * store(&(a.s22),float,x22) * store(&(a.s23),float,x23) * store(&(a.s24),float,x24) * store(&(a.s25),float,x25) * store(&(a.s26),float,x26) * store(&(a.s27),float,x27) * store(&(a.s28),float,x28) * store(&(a.s29),float,x29) * store(&(a.s30),float,x30) * store(&(a.s31),float,x31)
 Ensure store(&(__return.s0),float,vlrelu_active_mul(0,vl,x0,b)) * store(&(__return.s1),float,vlrelu_active_mul(1,vl,x1,b)) * store(&(__return.s2),float,vlrelu_active_mul(2,vl,x2,b)) * store(&(__return.s3),float,vlrelu_active_mul(3,vl,x3,b)) * store(&(__return.s4),float,vlrelu_active_mul(4,vl,x4,b)) * store(&(__return.s5),float,vlrelu_active_mul(5,vl,x5,b)) * store(&(__return.s6),float,vlrelu_active_mul(6,vl,x6,b)) * store(&(__return.s7),float,vlrelu_active_mul(7,vl,x7,b)) * store(&(__return.s8),float,vlrelu_active_mul(8,vl,x8,b)) * store(&(__return.s9),float,vlrelu_active_mul(9,vl,x9,b)) * store(&(__return.s10),float,vlrelu_active_mul(10,vl,x10,b)) * store(&(__return.s11),float,vlrelu_active_mul(11,vl,x11,b)) * store(&(__return.s12),float,vlrelu_active_mul(12,vl,x12,b)) * store(&(__return.s13),float,vlrelu_active_mul(13,vl,x13,b)) * store(&(__return.s14),float,vlrelu_active_mul(14,vl,x14,b)) * store(&(__return.s15),float,vlrelu_active_mul(15,vl,x15,b)) * store(&(__return.s16),float,vlrelu_active_mul(16,vl,x16,b)) * store(&(__return.s17),float,vlrelu_active_mul(17,vl,x17,b)) * store(&(__return.s18),float,vlrelu_active_mul(18,vl,x18,b)) * store(&(__return.s19),float,vlrelu_active_mul(19,vl,x19,b)) * store(&(__return.s20),float,vlrelu_active_mul(20,vl,x20,b)) * store(&(__return.s21),float,vlrelu_active_mul(21,vl,x21,b)) * store(&(__return.s22),float,vlrelu_active_mul(22,vl,x22,b)) * store(&(__return.s23),float,vlrelu_active_mul(23,vl,x23,b)) * store(&(__return.s24),float,vlrelu_active_mul(24,vl,x24,b)) * store(&(__return.s25),float,vlrelu_active_mul(25,vl,x25,b)) * store(&(__return.s26),float,vlrelu_active_mul(26,vl,x26,b)) * store(&(__return.s27),float,vlrelu_active_mul(27,vl,x27,b)) * store(&(__return.s28),float,vlrelu_active_mul(28,vl,x28,b)) * store(&(__return.s29),float,vlrelu_active_mul(29,vl,x29,b)) * store(&(__return.s30),float,vlrelu_active_mul(30,vl,x30,b)) * store(&(__return.s31),float,vlrelu_active_mul(31,vl,x31,b)) */
{
 vfloat32m8_t r;
 r.s0=qcp_rvv_mulf_lane(a.s0,b,0,vl);
 r.s1=qcp_rvv_mulf_lane(a.s1,b,1,vl);
 r.s2=qcp_rvv_mulf_lane(a.s2,b,2,vl);
 r.s3=qcp_rvv_mulf_lane(a.s3,b,3,vl);
 r.s4=qcp_rvv_mulf_lane(a.s4,b,4,vl);
 r.s5=qcp_rvv_mulf_lane(a.s5,b,5,vl);
 r.s6=qcp_rvv_mulf_lane(a.s6,b,6,vl);
 r.s7=qcp_rvv_mulf_lane(a.s7,b,7,vl);
 r.s8=qcp_rvv_mulf_lane(a.s8,b,8,vl);
 r.s9=qcp_rvv_mulf_lane(a.s9,b,9,vl);
 r.s10=qcp_rvv_mulf_lane(a.s10,b,10,vl);
 r.s11=qcp_rvv_mulf_lane(a.s11,b,11,vl);
 r.s12=qcp_rvv_mulf_lane(a.s12,b,12,vl);
 r.s13=qcp_rvv_mulf_lane(a.s13,b,13,vl);
 r.s14=qcp_rvv_mulf_lane(a.s14,b,14,vl);
 r.s15=qcp_rvv_mulf_lane(a.s15,b,15,vl);
 r.s16=qcp_rvv_mulf_lane(a.s16,b,16,vl);
 r.s17=qcp_rvv_mulf_lane(a.s17,b,17,vl);
 r.s18=qcp_rvv_mulf_lane(a.s18,b,18,vl);
 r.s19=qcp_rvv_mulf_lane(a.s19,b,19,vl);
 r.s20=qcp_rvv_mulf_lane(a.s20,b,20,vl);
 r.s21=qcp_rvv_mulf_lane(a.s21,b,21,vl);
 r.s22=qcp_rvv_mulf_lane(a.s22,b,22,vl);
 r.s23=qcp_rvv_mulf_lane(a.s23,b,23,vl);
 r.s24=qcp_rvv_mulf_lane(a.s24,b,24,vl);
 r.s25=qcp_rvv_mulf_lane(a.s25,b,25,vl);
 r.s26=qcp_rvv_mulf_lane(a.s26,b,26,vl);
 r.s27=qcp_rvv_mulf_lane(a.s27,b,27,vl);
 r.s28=qcp_rvv_mulf_lane(a.s28,b,28,vl);
 r.s29=qcp_rvv_mulf_lane(a.s29,b,29,vl);
 r.s30=qcp_rvv_mulf_lane(a.s30,b,30,vl);
 r.s31=qcp_rvv_mulf_lane(a.s31,b,31,vl);
 return r;
}
vint32m8_t __riscv_vreinterpret_v_f32m8_i32m8(vfloat32m8_t a)
/*@ With (x0:fp32) (x1:fp32) (x2:fp32) (x3:fp32) (x4:fp32) (x5:fp32) (x6:fp32) (x7:fp32) (x8:fp32) (x9:fp32) (x10:fp32) (x11:fp32) (x12:fp32) (x13:fp32) (x14:fp32) (x15:fp32) (x16:fp32) (x17:fp32) (x18:fp32) (x19:fp32) (x20:fp32) (x21:fp32) (x22:fp32) (x23:fp32) (x24:fp32) (x25:fp32) (x26:fp32) (x27:fp32) (x28:fp32) (x29:fp32) (x30:fp32) (x31:fp32)
 Require store(&(a.s0),float,x0) * store(&(a.s1),float,x1) * store(&(a.s2),float,x2) * store(&(a.s3),float,x3) * store(&(a.s4),float,x4) * store(&(a.s5),float,x5) * store(&(a.s6),float,x6) * store(&(a.s7),float,x7) * store(&(a.s8),float,x8) * store(&(a.s9),float,x9) * store(&(a.s10),float,x10) * store(&(a.s11),float,x11) * store(&(a.s12),float,x12) * store(&(a.s13),float,x13) * store(&(a.s14),float,x14) * store(&(a.s15),float,x15) * store(&(a.s16),float,x16) * store(&(a.s17),float,x17) * store(&(a.s18),float,x18) * store(&(a.s19),float,x19) * store(&(a.s20),float,x20) * store(&(a.s21),float,x21) * store(&(a.s22),float,x22) * store(&(a.s23),float,x23) * store(&(a.s24),float,x24) * store(&(a.s25),float,x25) * store(&(a.s26),float,x26) * store(&(a.s27),float,x27) * store(&(a.s28),float,x28) * store(&(a.s29),float,x29) * store(&(a.s30),float,x30) * store(&(a.s31),float,x31)
 Ensure store(&(__return.s0),int,rvv_signed_bits(x0)) * store(&(__return.s1),int,rvv_signed_bits(x1)) * store(&(__return.s2),int,rvv_signed_bits(x2)) * store(&(__return.s3),int,rvv_signed_bits(x3)) * store(&(__return.s4),int,rvv_signed_bits(x4)) * store(&(__return.s5),int,rvv_signed_bits(x5)) * store(&(__return.s6),int,rvv_signed_bits(x6)) * store(&(__return.s7),int,rvv_signed_bits(x7)) * store(&(__return.s8),int,rvv_signed_bits(x8)) * store(&(__return.s9),int,rvv_signed_bits(x9)) * store(&(__return.s10),int,rvv_signed_bits(x10)) * store(&(__return.s11),int,rvv_signed_bits(x11)) * store(&(__return.s12),int,rvv_signed_bits(x12)) * store(&(__return.s13),int,rvv_signed_bits(x13)) * store(&(__return.s14),int,rvv_signed_bits(x14)) * store(&(__return.s15),int,rvv_signed_bits(x15)) * store(&(__return.s16),int,rvv_signed_bits(x16)) * store(&(__return.s17),int,rvv_signed_bits(x17)) * store(&(__return.s18),int,rvv_signed_bits(x18)) * store(&(__return.s19),int,rvv_signed_bits(x19)) * store(&(__return.s20),int,rvv_signed_bits(x20)) * store(&(__return.s21),int,rvv_signed_bits(x21)) * store(&(__return.s22),int,rvv_signed_bits(x22)) * store(&(__return.s23),int,rvv_signed_bits(x23)) * store(&(__return.s24),int,rvv_signed_bits(x24)) * store(&(__return.s25),int,rvv_signed_bits(x25)) * store(&(__return.s26),int,rvv_signed_bits(x26)) * store(&(__return.s27),int,rvv_signed_bits(x27)) * store(&(__return.s28),int,rvv_signed_bits(x28)) * store(&(__return.s29),int,rvv_signed_bits(x29)) * store(&(__return.s30),int,rvv_signed_bits(x30)) * store(&(__return.s31),int,rvv_signed_bits(x31)) */
{
 vint32m8_t r;
 r.s0=qcp_rvv_signed_bits(a.s0);
 r.s1=qcp_rvv_signed_bits(a.s1);
 r.s2=qcp_rvv_signed_bits(a.s2);
 r.s3=qcp_rvv_signed_bits(a.s3);
 r.s4=qcp_rvv_signed_bits(a.s4);
 r.s5=qcp_rvv_signed_bits(a.s5);
 r.s6=qcp_rvv_signed_bits(a.s6);
 r.s7=qcp_rvv_signed_bits(a.s7);
 r.s8=qcp_rvv_signed_bits(a.s8);
 r.s9=qcp_rvv_signed_bits(a.s9);
 r.s10=qcp_rvv_signed_bits(a.s10);
 r.s11=qcp_rvv_signed_bits(a.s11);
 r.s12=qcp_rvv_signed_bits(a.s12);
 r.s13=qcp_rvv_signed_bits(a.s13);
 r.s14=qcp_rvv_signed_bits(a.s14);
 r.s15=qcp_rvv_signed_bits(a.s15);
 r.s16=qcp_rvv_signed_bits(a.s16);
 r.s17=qcp_rvv_signed_bits(a.s17);
 r.s18=qcp_rvv_signed_bits(a.s18);
 r.s19=qcp_rvv_signed_bits(a.s19);
 r.s20=qcp_rvv_signed_bits(a.s20);
 r.s21=qcp_rvv_signed_bits(a.s21);
 r.s22=qcp_rvv_signed_bits(a.s22);
 r.s23=qcp_rvv_signed_bits(a.s23);
 r.s24=qcp_rvv_signed_bits(a.s24);
 r.s25=qcp_rvv_signed_bits(a.s25);
 r.s26=qcp_rvv_signed_bits(a.s26);
 r.s27=qcp_rvv_signed_bits(a.s27);
 r.s28=qcp_rvv_signed_bits(a.s28);
 r.s29=qcp_rvv_signed_bits(a.s29);
 r.s30=qcp_rvv_signed_bits(a.s30);
 r.s31=qcp_rvv_signed_bits(a.s31);
 return r;
}
vbool4_t __riscv_vmslt_vx_i32m8_b4(vint32m8_t a,int b,unsigned long long vl)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z) (x8:Z) (x9:Z) (x10:Z) (x11:Z) (x12:Z) (x13:Z) (x14:Z) (x15:Z) (x16:Z) (x17:Z) (x18:Z) (x19:Z) (x20:Z) (x21:Z) (x22:Z) (x23:Z) (x24:Z) (x25:Z) (x26:Z) (x27:Z) (x28:Z) (x29:Z) (x30:Z) (x31:Z)
 Require 0 <= vl && vl <= 32 && store(&(a.s0),int,x0) * store(&(a.s1),int,x1) * store(&(a.s2),int,x2) * store(&(a.s3),int,x3) * store(&(a.s4),int,x4) * store(&(a.s5),int,x5) * store(&(a.s6),int,x6) * store(&(a.s7),int,x7) * store(&(a.s8),int,x8) * store(&(a.s9),int,x9) * store(&(a.s10),int,x10) * store(&(a.s11),int,x11) * store(&(a.s12),int,x12) * store(&(a.s13),int,x13) * store(&(a.s14),int,x14) * store(&(a.s15),int,x15) * store(&(a.s16),int,x16) * store(&(a.s17),int,x17) * store(&(a.s18),int,x18) * store(&(a.s19),int,x19) * store(&(a.s20),int,x20) * store(&(a.s21),int,x21) * store(&(a.s22),int,x22) * store(&(a.s23),int,x23) * store(&(a.s24),int,x24) * store(&(a.s25),int,x25) * store(&(a.s26),int,x26) * store(&(a.s27),int,x27) * store(&(a.s28),int,x28) * store(&(a.s29),int,x29) * store(&(a.s30),int,x30) * store(&(a.s31),int,x31)
 Ensure store(&(__return.s0),int,rvv_mask(0,vl,x0,b)) * store(&(__return.s1),int,rvv_mask(1,vl,x1,b)) * store(&(__return.s2),int,rvv_mask(2,vl,x2,b)) * store(&(__return.s3),int,rvv_mask(3,vl,x3,b)) * store(&(__return.s4),int,rvv_mask(4,vl,x4,b)) * store(&(__return.s5),int,rvv_mask(5,vl,x5,b)) * store(&(__return.s6),int,rvv_mask(6,vl,x6,b)) * store(&(__return.s7),int,rvv_mask(7,vl,x7,b)) * store(&(__return.s8),int,rvv_mask(8,vl,x8,b)) * store(&(__return.s9),int,rvv_mask(9,vl,x9,b)) * store(&(__return.s10),int,rvv_mask(10,vl,x10,b)) * store(&(__return.s11),int,rvv_mask(11,vl,x11,b)) * store(&(__return.s12),int,rvv_mask(12,vl,x12,b)) * store(&(__return.s13),int,rvv_mask(13,vl,x13,b)) * store(&(__return.s14),int,rvv_mask(14,vl,x14,b)) * store(&(__return.s15),int,rvv_mask(15,vl,x15,b)) * store(&(__return.s16),int,rvv_mask(16,vl,x16,b)) * store(&(__return.s17),int,rvv_mask(17,vl,x17,b)) * store(&(__return.s18),int,rvv_mask(18,vl,x18,b)) * store(&(__return.s19),int,rvv_mask(19,vl,x19,b)) * store(&(__return.s20),int,rvv_mask(20,vl,x20,b)) * store(&(__return.s21),int,rvv_mask(21,vl,x21,b)) * store(&(__return.s22),int,rvv_mask(22,vl,x22,b)) * store(&(__return.s23),int,rvv_mask(23,vl,x23,b)) * store(&(__return.s24),int,rvv_mask(24,vl,x24,b)) * store(&(__return.s25),int,rvv_mask(25,vl,x25,b)) * store(&(__return.s26),int,rvv_mask(26,vl,x26,b)) * store(&(__return.s27),int,rvv_mask(27,vl,x27,b)) * store(&(__return.s28),int,rvv_mask(28,vl,x28,b)) * store(&(__return.s29),int,rvv_mask(29,vl,x29,b)) * store(&(__return.s30),int,rvv_mask(30,vl,x30,b)) * store(&(__return.s31),int,rvv_mask(31,vl,x31,b)) */
{
 vbool4_t r;
 r.s0=qcp_rvv_mask_lane(a.s0,b,0,vl);
 r.s1=qcp_rvv_mask_lane(a.s1,b,1,vl);
 r.s2=qcp_rvv_mask_lane(a.s2,b,2,vl);
 r.s3=qcp_rvv_mask_lane(a.s3,b,3,vl);
 r.s4=qcp_rvv_mask_lane(a.s4,b,4,vl);
 r.s5=qcp_rvv_mask_lane(a.s5,b,5,vl);
 r.s6=qcp_rvv_mask_lane(a.s6,b,6,vl);
 r.s7=qcp_rvv_mask_lane(a.s7,b,7,vl);
 r.s8=qcp_rvv_mask_lane(a.s8,b,8,vl);
 r.s9=qcp_rvv_mask_lane(a.s9,b,9,vl);
 r.s10=qcp_rvv_mask_lane(a.s10,b,10,vl);
 r.s11=qcp_rvv_mask_lane(a.s11,b,11,vl);
 r.s12=qcp_rvv_mask_lane(a.s12,b,12,vl);
 r.s13=qcp_rvv_mask_lane(a.s13,b,13,vl);
 r.s14=qcp_rvv_mask_lane(a.s14,b,14,vl);
 r.s15=qcp_rvv_mask_lane(a.s15,b,15,vl);
 r.s16=qcp_rvv_mask_lane(a.s16,b,16,vl);
 r.s17=qcp_rvv_mask_lane(a.s17,b,17,vl);
 r.s18=qcp_rvv_mask_lane(a.s18,b,18,vl);
 r.s19=qcp_rvv_mask_lane(a.s19,b,19,vl);
 r.s20=qcp_rvv_mask_lane(a.s20,b,20,vl);
 r.s21=qcp_rvv_mask_lane(a.s21,b,21,vl);
 r.s22=qcp_rvv_mask_lane(a.s22,b,22,vl);
 r.s23=qcp_rvv_mask_lane(a.s23,b,23,vl);
 r.s24=qcp_rvv_mask_lane(a.s24,b,24,vl);
 r.s25=qcp_rvv_mask_lane(a.s25,b,25,vl);
 r.s26=qcp_rvv_mask_lane(a.s26,b,26,vl);
 r.s27=qcp_rvv_mask_lane(a.s27,b,27,vl);
 r.s28=qcp_rvv_mask_lane(a.s28,b,28,vl);
 r.s29=qcp_rvv_mask_lane(a.s29,b,29,vl);
 r.s30=qcp_rvv_mask_lane(a.s30,b,30,vl);
 r.s31=qcp_rvv_mask_lane(a.s31,b,31,vl);
 return r;
}
vfloat32m8_t __riscv_vmerge_vvm_f32m8(vfloat32m8_t a,vfloat32m8_t b,vbool4_t m,unsigned long long vl)
/*@ With (x0:fp32) (x1:fp32) (x2:fp32) (x3:fp32) (x4:fp32) (x5:fp32) (x6:fp32) (x7:fp32) (x8:fp32) (x9:fp32) (x10:fp32) (x11:fp32) (x12:fp32) (x13:fp32) (x14:fp32) (x15:fp32) (x16:fp32) (x17:fp32) (x18:fp32) (x19:fp32) (x20:fp32) (x21:fp32) (x22:fp32) (x23:fp32) (x24:fp32) (x25:fp32) (x26:fp32) (x27:fp32) (x28:fp32) (x29:fp32) (x30:fp32) (x31:fp32) (y0:fp32) (y1:fp32) (y2:fp32) (y3:fp32) (y4:fp32) (y5:fp32) (y6:fp32) (y7:fp32) (y8:fp32) (y9:fp32) (y10:fp32) (y11:fp32) (y12:fp32) (y13:fp32) (y14:fp32) (y15:fp32) (y16:fp32) (y17:fp32) (y18:fp32) (y19:fp32) (y20:fp32) (y21:fp32) (y22:fp32) (y23:fp32) (y24:fp32) (y25:fp32) (y26:fp32) (y27:fp32) (y28:fp32) (y29:fp32) (y30:fp32) (y31:fp32) (m0:Z) (m1:Z) (m2:Z) (m3:Z) (m4:Z) (m5:Z) (m6:Z) (m7:Z) (m8:Z) (m9:Z) (m10:Z) (m11:Z) (m12:Z) (m13:Z) (m14:Z) (m15:Z) (m16:Z) (m17:Z) (m18:Z) (m19:Z) (m20:Z) (m21:Z) (m22:Z) (m23:Z) (m24:Z) (m25:Z) (m26:Z) (m27:Z) (m28:Z) (m29:Z) (m30:Z) (m31:Z)
 Require 0 <= vl && vl <= 32 && store(&(a.s0),float,x0) * store(&(a.s1),float,x1) * store(&(a.s2),float,x2) * store(&(a.s3),float,x3) * store(&(a.s4),float,x4) * store(&(a.s5),float,x5) * store(&(a.s6),float,x6) * store(&(a.s7),float,x7) * store(&(a.s8),float,x8) * store(&(a.s9),float,x9) * store(&(a.s10),float,x10) * store(&(a.s11),float,x11) * store(&(a.s12),float,x12) * store(&(a.s13),float,x13) * store(&(a.s14),float,x14) * store(&(a.s15),float,x15) * store(&(a.s16),float,x16) * store(&(a.s17),float,x17) * store(&(a.s18),float,x18) * store(&(a.s19),float,x19) * store(&(a.s20),float,x20) * store(&(a.s21),float,x21) * store(&(a.s22),float,x22) * store(&(a.s23),float,x23) * store(&(a.s24),float,x24) * store(&(a.s25),float,x25) * store(&(a.s26),float,x26) * store(&(a.s27),float,x27) * store(&(a.s28),float,x28) * store(&(a.s29),float,x29) * store(&(a.s30),float,x30) * store(&(a.s31),float,x31) * store(&(b.s0),float,y0) * store(&(b.s1),float,y1) * store(&(b.s2),float,y2) * store(&(b.s3),float,y3) * store(&(b.s4),float,y4) * store(&(b.s5),float,y5) * store(&(b.s6),float,y6) * store(&(b.s7),float,y7) * store(&(b.s8),float,y8) * store(&(b.s9),float,y9) * store(&(b.s10),float,y10) * store(&(b.s11),float,y11) * store(&(b.s12),float,y12) * store(&(b.s13),float,y13) * store(&(b.s14),float,y14) * store(&(b.s15),float,y15) * store(&(b.s16),float,y16) * store(&(b.s17),float,y17) * store(&(b.s18),float,y18) * store(&(b.s19),float,y19) * store(&(b.s20),float,y20) * store(&(b.s21),float,y21) * store(&(b.s22),float,y22) * store(&(b.s23),float,y23) * store(&(b.s24),float,y24) * store(&(b.s25),float,y25) * store(&(b.s26),float,y26) * store(&(b.s27),float,y27) * store(&(b.s28),float,y28) * store(&(b.s29),float,y29) * store(&(b.s30),float,y30) * store(&(b.s31),float,y31) * store(&(m.s0),int,m0) * store(&(m.s1),int,m1) * store(&(m.s2),int,m2) * store(&(m.s3),int,m3) * store(&(m.s4),int,m4) * store(&(m.s5),int,m5) * store(&(m.s6),int,m6) * store(&(m.s7),int,m7) * store(&(m.s8),int,m8) * store(&(m.s9),int,m9) * store(&(m.s10),int,m10) * store(&(m.s11),int,m11) * store(&(m.s12),int,m12) * store(&(m.s13),int,m13) * store(&(m.s14),int,m14) * store(&(m.s15),int,m15) * store(&(m.s16),int,m16) * store(&(m.s17),int,m17) * store(&(m.s18),int,m18) * store(&(m.s19),int,m19) * store(&(m.s20),int,m20) * store(&(m.s21),int,m21) * store(&(m.s22),int,m22) * store(&(m.s23),int,m23) * store(&(m.s24),int,m24) * store(&(m.s25),int,m25) * store(&(m.s26),int,m26) * store(&(m.s27),int,m27) * store(&(m.s28),int,m28) * store(&(m.s29),int,m29) * store(&(m.s30),int,m30) * store(&(m.s31),int,m31)
 Ensure store(&(__return.s0),float,rvv_merge(0,vl,x0,y0,m0)) * store(&(__return.s1),float,rvv_merge(1,vl,x1,y1,m1)) * store(&(__return.s2),float,rvv_merge(2,vl,x2,y2,m2)) * store(&(__return.s3),float,rvv_merge(3,vl,x3,y3,m3)) * store(&(__return.s4),float,rvv_merge(4,vl,x4,y4,m4)) * store(&(__return.s5),float,rvv_merge(5,vl,x5,y5,m5)) * store(&(__return.s6),float,rvv_merge(6,vl,x6,y6,m6)) * store(&(__return.s7),float,rvv_merge(7,vl,x7,y7,m7)) * store(&(__return.s8),float,rvv_merge(8,vl,x8,y8,m8)) * store(&(__return.s9),float,rvv_merge(9,vl,x9,y9,m9)) * store(&(__return.s10),float,rvv_merge(10,vl,x10,y10,m10)) * store(&(__return.s11),float,rvv_merge(11,vl,x11,y11,m11)) * store(&(__return.s12),float,rvv_merge(12,vl,x12,y12,m12)) * store(&(__return.s13),float,rvv_merge(13,vl,x13,y13,m13)) * store(&(__return.s14),float,rvv_merge(14,vl,x14,y14,m14)) * store(&(__return.s15),float,rvv_merge(15,vl,x15,y15,m15)) * store(&(__return.s16),float,rvv_merge(16,vl,x16,y16,m16)) * store(&(__return.s17),float,rvv_merge(17,vl,x17,y17,m17)) * store(&(__return.s18),float,rvv_merge(18,vl,x18,y18,m18)) * store(&(__return.s19),float,rvv_merge(19,vl,x19,y19,m19)) * store(&(__return.s20),float,rvv_merge(20,vl,x20,y20,m20)) * store(&(__return.s21),float,rvv_merge(21,vl,x21,y21,m21)) * store(&(__return.s22),float,rvv_merge(22,vl,x22,y22,m22)) * store(&(__return.s23),float,rvv_merge(23,vl,x23,y23,m23)) * store(&(__return.s24),float,rvv_merge(24,vl,x24,y24,m24)) * store(&(__return.s25),float,rvv_merge(25,vl,x25,y25,m25)) * store(&(__return.s26),float,rvv_merge(26,vl,x26,y26,m26)) * store(&(__return.s27),float,rvv_merge(27,vl,x27,y27,m27)) * store(&(__return.s28),float,rvv_merge(28,vl,x28,y28,m28)) * store(&(__return.s29),float,rvv_merge(29,vl,x29,y29,m29)) * store(&(__return.s30),float,rvv_merge(30,vl,x30,y30,m30)) * store(&(__return.s31),float,rvv_merge(31,vl,x31,y31,m31)) */
{
 vfloat32m8_t r;
 r.s0=qcp_rvv_merge_lane(a.s0,b.s0,m.s0,0,vl);
 r.s1=qcp_rvv_merge_lane(a.s1,b.s1,m.s1,1,vl);
 r.s2=qcp_rvv_merge_lane(a.s2,b.s2,m.s2,2,vl);
 r.s3=qcp_rvv_merge_lane(a.s3,b.s3,m.s3,3,vl);
 r.s4=qcp_rvv_merge_lane(a.s4,b.s4,m.s4,4,vl);
 r.s5=qcp_rvv_merge_lane(a.s5,b.s5,m.s5,5,vl);
 r.s6=qcp_rvv_merge_lane(a.s6,b.s6,m.s6,6,vl);
 r.s7=qcp_rvv_merge_lane(a.s7,b.s7,m.s7,7,vl);
 r.s8=qcp_rvv_merge_lane(a.s8,b.s8,m.s8,8,vl);
 r.s9=qcp_rvv_merge_lane(a.s9,b.s9,m.s9,9,vl);
 r.s10=qcp_rvv_merge_lane(a.s10,b.s10,m.s10,10,vl);
 r.s11=qcp_rvv_merge_lane(a.s11,b.s11,m.s11,11,vl);
 r.s12=qcp_rvv_merge_lane(a.s12,b.s12,m.s12,12,vl);
 r.s13=qcp_rvv_merge_lane(a.s13,b.s13,m.s13,13,vl);
 r.s14=qcp_rvv_merge_lane(a.s14,b.s14,m.s14,14,vl);
 r.s15=qcp_rvv_merge_lane(a.s15,b.s15,m.s15,15,vl);
 r.s16=qcp_rvv_merge_lane(a.s16,b.s16,m.s16,16,vl);
 r.s17=qcp_rvv_merge_lane(a.s17,b.s17,m.s17,17,vl);
 r.s18=qcp_rvv_merge_lane(a.s18,b.s18,m.s18,18,vl);
 r.s19=qcp_rvv_merge_lane(a.s19,b.s19,m.s19,19,vl);
 r.s20=qcp_rvv_merge_lane(a.s20,b.s20,m.s20,20,vl);
 r.s21=qcp_rvv_merge_lane(a.s21,b.s21,m.s21,21,vl);
 r.s22=qcp_rvv_merge_lane(a.s22,b.s22,m.s22,22,vl);
 r.s23=qcp_rvv_merge_lane(a.s23,b.s23,m.s23,23,vl);
 r.s24=qcp_rvv_merge_lane(a.s24,b.s24,m.s24,24,vl);
 r.s25=qcp_rvv_merge_lane(a.s25,b.s25,m.s25,25,vl);
 r.s26=qcp_rvv_merge_lane(a.s26,b.s26,m.s26,26,vl);
 r.s27=qcp_rvv_merge_lane(a.s27,b.s27,m.s27,27,vl);
 r.s28=qcp_rvv_merge_lane(a.s28,b.s28,m.s28,28,vl);
 r.s29=qcp_rvv_merge_lane(a.s29,b.s29,m.s29,29,vl);
 r.s30=qcp_rvv_merge_lane(a.s30,b.s30,m.s30,30,vl);
 r.s31=qcp_rvv_merge_lane(a.s31,b.s31,m.s31,31,vl);
 return r;
}
