#include "vector_ops.h"
vuint16m4_t __riscv_vadd_vv_u16m4(vuint16m4_t a,vuint16m4_t b,size_t vl)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z) (x8:Z) (x9:Z) (x10:Z) (x11:Z) (x12:Z) (x13:Z) (x14:Z) (x15:Z) (x16:Z) (x17:Z) (x18:Z) (x19:Z) (x20:Z) (x21:Z) (x22:Z) (x23:Z) (x24:Z) (x25:Z) (x26:Z) (x27:Z) (x28:Z) (x29:Z) (x30:Z) (x31:Z) (y0:Z) (y1:Z) (y2:Z) (y3:Z) (y4:Z) (y5:Z) (y6:Z) (y7:Z) (y8:Z) (y9:Z) (y10:Z) (y11:Z) (y12:Z) (y13:Z) (y14:Z) (y15:Z) (y16:Z) (y17:Z) (y18:Z) (y19:Z) (y20:Z) (y21:Z) (y22:Z) (y23:Z) (y24:Z) (y25:Z) (y26:Z) (y27:Z) (y28:Z) (y29:Z) (y30:Z) (y31:Z)
 Require 0 <= vl && vl <= 32 && store(&(a.s0),unsigned short,x0) * store(&(a.s1),unsigned short,x1) * store(&(a.s2),unsigned short,x2) * store(&(a.s3),unsigned short,x3) * store(&(a.s4),unsigned short,x4) * store(&(a.s5),unsigned short,x5) * store(&(a.s6),unsigned short,x6) * store(&(a.s7),unsigned short,x7) * store(&(a.s8),unsigned short,x8) * store(&(a.s9),unsigned short,x9) * store(&(a.s10),unsigned short,x10) * store(&(a.s11),unsigned short,x11) * store(&(a.s12),unsigned short,x12) * store(&(a.s13),unsigned short,x13) * store(&(a.s14),unsigned short,x14) * store(&(a.s15),unsigned short,x15) * store(&(a.s16),unsigned short,x16) * store(&(a.s17),unsigned short,x17) * store(&(a.s18),unsigned short,x18) * store(&(a.s19),unsigned short,x19) * store(&(a.s20),unsigned short,x20) * store(&(a.s21),unsigned short,x21) * store(&(a.s22),unsigned short,x22) * store(&(a.s23),unsigned short,x23) * store(&(a.s24),unsigned short,x24) * store(&(a.s25),unsigned short,x25) * store(&(a.s26),unsigned short,x26) * store(&(a.s27),unsigned short,x27) * store(&(a.s28),unsigned short,x28) * store(&(a.s29),unsigned short,x29) * store(&(a.s30),unsigned short,x30) * store(&(a.s31),unsigned short,x31) * store(&(b.s0),unsigned short,y0) * store(&(b.s1),unsigned short,y1) * store(&(b.s2),unsigned short,y2) * store(&(b.s3),unsigned short,y3) * store(&(b.s4),unsigned short,y4) * store(&(b.s5),unsigned short,y5) * store(&(b.s6),unsigned short,y6) * store(&(b.s7),unsigned short,y7) * store(&(b.s8),unsigned short,y8) * store(&(b.s9),unsigned short,y9) * store(&(b.s10),unsigned short,y10) * store(&(b.s11),unsigned short,y11) * store(&(b.s12),unsigned short,y12) * store(&(b.s13),unsigned short,y13) * store(&(b.s14),unsigned short,y14) * store(&(b.s15),unsigned short,y15) * store(&(b.s16),unsigned short,y16) * store(&(b.s17),unsigned short,y17) * store(&(b.s18),unsigned short,y18) * store(&(b.s19),unsigned short,y19) * store(&(b.s20),unsigned short,y20) * store(&(b.s21),unsigned short,y21) * store(&(b.s22),unsigned short,y22) * store(&(b.s23),unsigned short,y23) * store(&(b.s24),unsigned short,y24) * store(&(b.s25),unsigned short,y25) * store(&(b.s26),unsigned short,y26) * store(&(b.s27),unsigned short,y27) * store(&(b.s28),unsigned short,y28) * store(&(b.s29),unsigned short,y29) * store(&(b.s30),unsigned short,y30) * store(&(b.s31),unsigned short,y31)
 Ensure store(&(__return.s0),unsigned short,f16_active___riscv_vadd_vv_u16m4(0,vl,x0,y0)) * store(&(__return.s1),unsigned short,f16_active___riscv_vadd_vv_u16m4(1,vl,x1,y1)) * store(&(__return.s2),unsigned short,f16_active___riscv_vadd_vv_u16m4(2,vl,x2,y2)) * store(&(__return.s3),unsigned short,f16_active___riscv_vadd_vv_u16m4(3,vl,x3,y3)) * store(&(__return.s4),unsigned short,f16_active___riscv_vadd_vv_u16m4(4,vl,x4,y4)) * store(&(__return.s5),unsigned short,f16_active___riscv_vadd_vv_u16m4(5,vl,x5,y5)) * store(&(__return.s6),unsigned short,f16_active___riscv_vadd_vv_u16m4(6,vl,x6,y6)) * store(&(__return.s7),unsigned short,f16_active___riscv_vadd_vv_u16m4(7,vl,x7,y7)) * store(&(__return.s8),unsigned short,f16_active___riscv_vadd_vv_u16m4(8,vl,x8,y8)) * store(&(__return.s9),unsigned short,f16_active___riscv_vadd_vv_u16m4(9,vl,x9,y9)) * store(&(__return.s10),unsigned short,f16_active___riscv_vadd_vv_u16m4(10,vl,x10,y10)) * store(&(__return.s11),unsigned short,f16_active___riscv_vadd_vv_u16m4(11,vl,x11,y11)) * store(&(__return.s12),unsigned short,f16_active___riscv_vadd_vv_u16m4(12,vl,x12,y12)) * store(&(__return.s13),unsigned short,f16_active___riscv_vadd_vv_u16m4(13,vl,x13,y13)) * store(&(__return.s14),unsigned short,f16_active___riscv_vadd_vv_u16m4(14,vl,x14,y14)) * store(&(__return.s15),unsigned short,f16_active___riscv_vadd_vv_u16m4(15,vl,x15,y15)) * store(&(__return.s16),unsigned short,f16_active___riscv_vadd_vv_u16m4(16,vl,x16,y16)) * store(&(__return.s17),unsigned short,f16_active___riscv_vadd_vv_u16m4(17,vl,x17,y17)) * store(&(__return.s18),unsigned short,f16_active___riscv_vadd_vv_u16m4(18,vl,x18,y18)) * store(&(__return.s19),unsigned short,f16_active___riscv_vadd_vv_u16m4(19,vl,x19,y19)) * store(&(__return.s20),unsigned short,f16_active___riscv_vadd_vv_u16m4(20,vl,x20,y20)) * store(&(__return.s21),unsigned short,f16_active___riscv_vadd_vv_u16m4(21,vl,x21,y21)) * store(&(__return.s22),unsigned short,f16_active___riscv_vadd_vv_u16m4(22,vl,x22,y22)) * store(&(__return.s23),unsigned short,f16_active___riscv_vadd_vv_u16m4(23,vl,x23,y23)) * store(&(__return.s24),unsigned short,f16_active___riscv_vadd_vv_u16m4(24,vl,x24,y24)) * store(&(__return.s25),unsigned short,f16_active___riscv_vadd_vv_u16m4(25,vl,x25,y25)) * store(&(__return.s26),unsigned short,f16_active___riscv_vadd_vv_u16m4(26,vl,x26,y26)) * store(&(__return.s27),unsigned short,f16_active___riscv_vadd_vv_u16m4(27,vl,x27,y27)) * store(&(__return.s28),unsigned short,f16_active___riscv_vadd_vv_u16m4(28,vl,x28,y28)) * store(&(__return.s29),unsigned short,f16_active___riscv_vadd_vv_u16m4(29,vl,x29,y29)) * store(&(__return.s30),unsigned short,f16_active___riscv_vadd_vv_u16m4(30,vl,x30,y30)) * store(&(__return.s31),unsigned short,f16_active___riscv_vadd_vv_u16m4(31,vl,x31,y31)) */
{
 vuint16m4_t r;
 r.s0=qcp_f16_active___riscv_vadd_vv_u16m4(a.s0,b.s0,0,vl);
 r.s1=qcp_f16_active___riscv_vadd_vv_u16m4(a.s1,b.s1,1,vl);
 r.s2=qcp_f16_active___riscv_vadd_vv_u16m4(a.s2,b.s2,2,vl);
 r.s3=qcp_f16_active___riscv_vadd_vv_u16m4(a.s3,b.s3,3,vl);
 r.s4=qcp_f16_active___riscv_vadd_vv_u16m4(a.s4,b.s4,4,vl);
 r.s5=qcp_f16_active___riscv_vadd_vv_u16m4(a.s5,b.s5,5,vl);
 r.s6=qcp_f16_active___riscv_vadd_vv_u16m4(a.s6,b.s6,6,vl);
 r.s7=qcp_f16_active___riscv_vadd_vv_u16m4(a.s7,b.s7,7,vl);
 r.s8=qcp_f16_active___riscv_vadd_vv_u16m4(a.s8,b.s8,8,vl);
 r.s9=qcp_f16_active___riscv_vadd_vv_u16m4(a.s9,b.s9,9,vl);
 r.s10=qcp_f16_active___riscv_vadd_vv_u16m4(a.s10,b.s10,10,vl);
 r.s11=qcp_f16_active___riscv_vadd_vv_u16m4(a.s11,b.s11,11,vl);
 r.s12=qcp_f16_active___riscv_vadd_vv_u16m4(a.s12,b.s12,12,vl);
 r.s13=qcp_f16_active___riscv_vadd_vv_u16m4(a.s13,b.s13,13,vl);
 r.s14=qcp_f16_active___riscv_vadd_vv_u16m4(a.s14,b.s14,14,vl);
 r.s15=qcp_f16_active___riscv_vadd_vv_u16m4(a.s15,b.s15,15,vl);
 r.s16=qcp_f16_active___riscv_vadd_vv_u16m4(a.s16,b.s16,16,vl);
 r.s17=qcp_f16_active___riscv_vadd_vv_u16m4(a.s17,b.s17,17,vl);
 r.s18=qcp_f16_active___riscv_vadd_vv_u16m4(a.s18,b.s18,18,vl);
 r.s19=qcp_f16_active___riscv_vadd_vv_u16m4(a.s19,b.s19,19,vl);
 r.s20=qcp_f16_active___riscv_vadd_vv_u16m4(a.s20,b.s20,20,vl);
 r.s21=qcp_f16_active___riscv_vadd_vv_u16m4(a.s21,b.s21,21,vl);
 r.s22=qcp_f16_active___riscv_vadd_vv_u16m4(a.s22,b.s22,22,vl);
 r.s23=qcp_f16_active___riscv_vadd_vv_u16m4(a.s23,b.s23,23,vl);
 r.s24=qcp_f16_active___riscv_vadd_vv_u16m4(a.s24,b.s24,24,vl);
 r.s25=qcp_f16_active___riscv_vadd_vv_u16m4(a.s25,b.s25,25,vl);
 r.s26=qcp_f16_active___riscv_vadd_vv_u16m4(a.s26,b.s26,26,vl);
 r.s27=qcp_f16_active___riscv_vadd_vv_u16m4(a.s27,b.s27,27,vl);
 r.s28=qcp_f16_active___riscv_vadd_vv_u16m4(a.s28,b.s28,28,vl);
 r.s29=qcp_f16_active___riscv_vadd_vv_u16m4(a.s29,b.s29,29,vl);
 r.s30=qcp_f16_active___riscv_vadd_vv_u16m4(a.s30,b.s30,30,vl);
 r.s31=qcp_f16_active___riscv_vadd_vv_u16m4(a.s31,b.s31,31,vl);
 return r;
}
