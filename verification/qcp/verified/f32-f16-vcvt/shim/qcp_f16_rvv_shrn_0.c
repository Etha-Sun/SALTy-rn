#include "vector_ops.h"
vuint16m4_t qcp_f16_rvv_shrn_0(vuint32m8_t a,size_t vl)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z) (x8:Z) (x9:Z) (x10:Z) (x11:Z) (x12:Z) (x13:Z) (x14:Z) (x15:Z) (x16:Z) (x17:Z) (x18:Z) (x19:Z) (x20:Z) (x21:Z) (x22:Z) (x23:Z) (x24:Z) (x25:Z) (x26:Z) (x27:Z) (x28:Z) (x29:Z) (x30:Z) (x31:Z)
 Require 0 <= vl && vl <= 32 && store(&(a.s0),unsigned int,x0) * store(&(a.s1),unsigned int,x1) * store(&(a.s2),unsigned int,x2) * store(&(a.s3),unsigned int,x3) * store(&(a.s4),unsigned int,x4) * store(&(a.s5),unsigned int,x5) * store(&(a.s6),unsigned int,x6) * store(&(a.s7),unsigned int,x7) * store(&(a.s8),unsigned int,x8) * store(&(a.s9),unsigned int,x9) * store(&(a.s10),unsigned int,x10) * store(&(a.s11),unsigned int,x11) * store(&(a.s12),unsigned int,x12) * store(&(a.s13),unsigned int,x13) * store(&(a.s14),unsigned int,x14) * store(&(a.s15),unsigned int,x15) * store(&(a.s16),unsigned int,x16) * store(&(a.s17),unsigned int,x17) * store(&(a.s18),unsigned int,x18) * store(&(a.s19),unsigned int,x19) * store(&(a.s20),unsigned int,x20) * store(&(a.s21),unsigned int,x21) * store(&(a.s22),unsigned int,x22) * store(&(a.s23),unsigned int,x23) * store(&(a.s24),unsigned int,x24) * store(&(a.s25),unsigned int,x25) * store(&(a.s26),unsigned int,x26) * store(&(a.s27),unsigned int,x27) * store(&(a.s28),unsigned int,x28) * store(&(a.s29),unsigned int,x29) * store(&(a.s30),unsigned int,x30) * store(&(a.s31),unsigned int,x31)
 Ensure store(&(__return.s0),unsigned short,f16_active_qcp_f16_rvv_shrn_0(0,vl,x0)) * store(&(__return.s1),unsigned short,f16_active_qcp_f16_rvv_shrn_0(1,vl,x1)) * store(&(__return.s2),unsigned short,f16_active_qcp_f16_rvv_shrn_0(2,vl,x2)) * store(&(__return.s3),unsigned short,f16_active_qcp_f16_rvv_shrn_0(3,vl,x3)) * store(&(__return.s4),unsigned short,f16_active_qcp_f16_rvv_shrn_0(4,vl,x4)) * store(&(__return.s5),unsigned short,f16_active_qcp_f16_rvv_shrn_0(5,vl,x5)) * store(&(__return.s6),unsigned short,f16_active_qcp_f16_rvv_shrn_0(6,vl,x6)) * store(&(__return.s7),unsigned short,f16_active_qcp_f16_rvv_shrn_0(7,vl,x7)) * store(&(__return.s8),unsigned short,f16_active_qcp_f16_rvv_shrn_0(8,vl,x8)) * store(&(__return.s9),unsigned short,f16_active_qcp_f16_rvv_shrn_0(9,vl,x9)) * store(&(__return.s10),unsigned short,f16_active_qcp_f16_rvv_shrn_0(10,vl,x10)) * store(&(__return.s11),unsigned short,f16_active_qcp_f16_rvv_shrn_0(11,vl,x11)) * store(&(__return.s12),unsigned short,f16_active_qcp_f16_rvv_shrn_0(12,vl,x12)) * store(&(__return.s13),unsigned short,f16_active_qcp_f16_rvv_shrn_0(13,vl,x13)) * store(&(__return.s14),unsigned short,f16_active_qcp_f16_rvv_shrn_0(14,vl,x14)) * store(&(__return.s15),unsigned short,f16_active_qcp_f16_rvv_shrn_0(15,vl,x15)) * store(&(__return.s16),unsigned short,f16_active_qcp_f16_rvv_shrn_0(16,vl,x16)) * store(&(__return.s17),unsigned short,f16_active_qcp_f16_rvv_shrn_0(17,vl,x17)) * store(&(__return.s18),unsigned short,f16_active_qcp_f16_rvv_shrn_0(18,vl,x18)) * store(&(__return.s19),unsigned short,f16_active_qcp_f16_rvv_shrn_0(19,vl,x19)) * store(&(__return.s20),unsigned short,f16_active_qcp_f16_rvv_shrn_0(20,vl,x20)) * store(&(__return.s21),unsigned short,f16_active_qcp_f16_rvv_shrn_0(21,vl,x21)) * store(&(__return.s22),unsigned short,f16_active_qcp_f16_rvv_shrn_0(22,vl,x22)) * store(&(__return.s23),unsigned short,f16_active_qcp_f16_rvv_shrn_0(23,vl,x23)) * store(&(__return.s24),unsigned short,f16_active_qcp_f16_rvv_shrn_0(24,vl,x24)) * store(&(__return.s25),unsigned short,f16_active_qcp_f16_rvv_shrn_0(25,vl,x25)) * store(&(__return.s26),unsigned short,f16_active_qcp_f16_rvv_shrn_0(26,vl,x26)) * store(&(__return.s27),unsigned short,f16_active_qcp_f16_rvv_shrn_0(27,vl,x27)) * store(&(__return.s28),unsigned short,f16_active_qcp_f16_rvv_shrn_0(28,vl,x28)) * store(&(__return.s29),unsigned short,f16_active_qcp_f16_rvv_shrn_0(29,vl,x29)) * store(&(__return.s30),unsigned short,f16_active_qcp_f16_rvv_shrn_0(30,vl,x30)) * store(&(__return.s31),unsigned short,f16_active_qcp_f16_rvv_shrn_0(31,vl,x31)) */
{
 vuint16m4_t r;
 r.s0=qcp_f16_active_qcp_f16_rvv_shrn_0(a.s0,0,vl);
 r.s1=qcp_f16_active_qcp_f16_rvv_shrn_0(a.s1,1,vl);
 r.s2=qcp_f16_active_qcp_f16_rvv_shrn_0(a.s2,2,vl);
 r.s3=qcp_f16_active_qcp_f16_rvv_shrn_0(a.s3,3,vl);
 r.s4=qcp_f16_active_qcp_f16_rvv_shrn_0(a.s4,4,vl);
 r.s5=qcp_f16_active_qcp_f16_rvv_shrn_0(a.s5,5,vl);
 r.s6=qcp_f16_active_qcp_f16_rvv_shrn_0(a.s6,6,vl);
 r.s7=qcp_f16_active_qcp_f16_rvv_shrn_0(a.s7,7,vl);
 r.s8=qcp_f16_active_qcp_f16_rvv_shrn_0(a.s8,8,vl);
 r.s9=qcp_f16_active_qcp_f16_rvv_shrn_0(a.s9,9,vl);
 r.s10=qcp_f16_active_qcp_f16_rvv_shrn_0(a.s10,10,vl);
 r.s11=qcp_f16_active_qcp_f16_rvv_shrn_0(a.s11,11,vl);
 r.s12=qcp_f16_active_qcp_f16_rvv_shrn_0(a.s12,12,vl);
 r.s13=qcp_f16_active_qcp_f16_rvv_shrn_0(a.s13,13,vl);
 r.s14=qcp_f16_active_qcp_f16_rvv_shrn_0(a.s14,14,vl);
 r.s15=qcp_f16_active_qcp_f16_rvv_shrn_0(a.s15,15,vl);
 r.s16=qcp_f16_active_qcp_f16_rvv_shrn_0(a.s16,16,vl);
 r.s17=qcp_f16_active_qcp_f16_rvv_shrn_0(a.s17,17,vl);
 r.s18=qcp_f16_active_qcp_f16_rvv_shrn_0(a.s18,18,vl);
 r.s19=qcp_f16_active_qcp_f16_rvv_shrn_0(a.s19,19,vl);
 r.s20=qcp_f16_active_qcp_f16_rvv_shrn_0(a.s20,20,vl);
 r.s21=qcp_f16_active_qcp_f16_rvv_shrn_0(a.s21,21,vl);
 r.s22=qcp_f16_active_qcp_f16_rvv_shrn_0(a.s22,22,vl);
 r.s23=qcp_f16_active_qcp_f16_rvv_shrn_0(a.s23,23,vl);
 r.s24=qcp_f16_active_qcp_f16_rvv_shrn_0(a.s24,24,vl);
 r.s25=qcp_f16_active_qcp_f16_rvv_shrn_0(a.s25,25,vl);
 r.s26=qcp_f16_active_qcp_f16_rvv_shrn_0(a.s26,26,vl);
 r.s27=qcp_f16_active_qcp_f16_rvv_shrn_0(a.s27,27,vl);
 r.s28=qcp_f16_active_qcp_f16_rvv_shrn_0(a.s28,28,vl);
 r.s29=qcp_f16_active_qcp_f16_rvv_shrn_0(a.s29,29,vl);
 r.s30=qcp_f16_active_qcp_f16_rvv_shrn_0(a.s30,30,vl);
 r.s31=qcp_f16_active_qcp_f16_rvv_shrn_0(a.s31,31,vl);
 return r;
}
