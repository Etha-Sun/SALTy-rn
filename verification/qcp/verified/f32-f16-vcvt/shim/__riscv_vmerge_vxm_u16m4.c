#include "vector_ops.h"
vuint16m4_t __riscv_vmerge_vxm_u16m4(vuint16m4_t a,unsigned short b,vbool4_t mask,size_t vl)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z) (x8:Z) (x9:Z) (x10:Z) (x11:Z) (x12:Z) (x13:Z) (x14:Z) (x15:Z) (x16:Z) (x17:Z) (x18:Z) (x19:Z) (x20:Z) (x21:Z) (x22:Z) (x23:Z) (x24:Z) (x25:Z) (x26:Z) (x27:Z) (x28:Z) (x29:Z) (x30:Z) (x31:Z) (m0:Z) (m1:Z) (m2:Z) (m3:Z) (m4:Z) (m5:Z) (m6:Z) (m7:Z) (m8:Z) (m9:Z) (m10:Z) (m11:Z) (m12:Z) (m13:Z) (m14:Z) (m15:Z) (m16:Z) (m17:Z) (m18:Z) (m19:Z) (m20:Z) (m21:Z) (m22:Z) (m23:Z) (m24:Z) (m25:Z) (m26:Z) (m27:Z) (m28:Z) (m29:Z) (m30:Z) (m31:Z)
 Require 0 <= vl && vl <= 32 && store(&(a.s0),unsigned short,x0) * store(&(a.s1),unsigned short,x1) * store(&(a.s2),unsigned short,x2) * store(&(a.s3),unsigned short,x3) * store(&(a.s4),unsigned short,x4) * store(&(a.s5),unsigned short,x5) * store(&(a.s6),unsigned short,x6) * store(&(a.s7),unsigned short,x7) * store(&(a.s8),unsigned short,x8) * store(&(a.s9),unsigned short,x9) * store(&(a.s10),unsigned short,x10) * store(&(a.s11),unsigned short,x11) * store(&(a.s12),unsigned short,x12) * store(&(a.s13),unsigned short,x13) * store(&(a.s14),unsigned short,x14) * store(&(a.s15),unsigned short,x15) * store(&(a.s16),unsigned short,x16) * store(&(a.s17),unsigned short,x17) * store(&(a.s18),unsigned short,x18) * store(&(a.s19),unsigned short,x19) * store(&(a.s20),unsigned short,x20) * store(&(a.s21),unsigned short,x21) * store(&(a.s22),unsigned short,x22) * store(&(a.s23),unsigned short,x23) * store(&(a.s24),unsigned short,x24) * store(&(a.s25),unsigned short,x25) * store(&(a.s26),unsigned short,x26) * store(&(a.s27),unsigned short,x27) * store(&(a.s28),unsigned short,x28) * store(&(a.s29),unsigned short,x29) * store(&(a.s30),unsigned short,x30) * store(&(a.s31),unsigned short,x31) * store(&(mask.s0),int,m0) * store(&(mask.s1),int,m1) * store(&(mask.s2),int,m2) * store(&(mask.s3),int,m3) * store(&(mask.s4),int,m4) * store(&(mask.s5),int,m5) * store(&(mask.s6),int,m6) * store(&(mask.s7),int,m7) * store(&(mask.s8),int,m8) * store(&(mask.s9),int,m9) * store(&(mask.s10),int,m10) * store(&(mask.s11),int,m11) * store(&(mask.s12),int,m12) * store(&(mask.s13),int,m13) * store(&(mask.s14),int,m14) * store(&(mask.s15),int,m15) * store(&(mask.s16),int,m16) * store(&(mask.s17),int,m17) * store(&(mask.s18),int,m18) * store(&(mask.s19),int,m19) * store(&(mask.s20),int,m20) * store(&(mask.s21),int,m21) * store(&(mask.s22),int,m22) * store(&(mask.s23),int,m23) * store(&(mask.s24),int,m24) * store(&(mask.s25),int,m25) * store(&(mask.s26),int,m26) * store(&(mask.s27),int,m27) * store(&(mask.s28),int,m28) * store(&(mask.s29),int,m29) * store(&(mask.s30),int,m30) * store(&(mask.s31),int,m31)
 Ensure store(&(__return.s0),unsigned short,f16_active___riscv_vmerge_vxm_u16m4(0,vl,x0,m0,b)) * store(&(__return.s1),unsigned short,f16_active___riscv_vmerge_vxm_u16m4(1,vl,x1,m1,b)) * store(&(__return.s2),unsigned short,f16_active___riscv_vmerge_vxm_u16m4(2,vl,x2,m2,b)) * store(&(__return.s3),unsigned short,f16_active___riscv_vmerge_vxm_u16m4(3,vl,x3,m3,b)) * store(&(__return.s4),unsigned short,f16_active___riscv_vmerge_vxm_u16m4(4,vl,x4,m4,b)) * store(&(__return.s5),unsigned short,f16_active___riscv_vmerge_vxm_u16m4(5,vl,x5,m5,b)) * store(&(__return.s6),unsigned short,f16_active___riscv_vmerge_vxm_u16m4(6,vl,x6,m6,b)) * store(&(__return.s7),unsigned short,f16_active___riscv_vmerge_vxm_u16m4(7,vl,x7,m7,b)) * store(&(__return.s8),unsigned short,f16_active___riscv_vmerge_vxm_u16m4(8,vl,x8,m8,b)) * store(&(__return.s9),unsigned short,f16_active___riscv_vmerge_vxm_u16m4(9,vl,x9,m9,b)) * store(&(__return.s10),unsigned short,f16_active___riscv_vmerge_vxm_u16m4(10,vl,x10,m10,b)) * store(&(__return.s11),unsigned short,f16_active___riscv_vmerge_vxm_u16m4(11,vl,x11,m11,b)) * store(&(__return.s12),unsigned short,f16_active___riscv_vmerge_vxm_u16m4(12,vl,x12,m12,b)) * store(&(__return.s13),unsigned short,f16_active___riscv_vmerge_vxm_u16m4(13,vl,x13,m13,b)) * store(&(__return.s14),unsigned short,f16_active___riscv_vmerge_vxm_u16m4(14,vl,x14,m14,b)) * store(&(__return.s15),unsigned short,f16_active___riscv_vmerge_vxm_u16m4(15,vl,x15,m15,b)) * store(&(__return.s16),unsigned short,f16_active___riscv_vmerge_vxm_u16m4(16,vl,x16,m16,b)) * store(&(__return.s17),unsigned short,f16_active___riscv_vmerge_vxm_u16m4(17,vl,x17,m17,b)) * store(&(__return.s18),unsigned short,f16_active___riscv_vmerge_vxm_u16m4(18,vl,x18,m18,b)) * store(&(__return.s19),unsigned short,f16_active___riscv_vmerge_vxm_u16m4(19,vl,x19,m19,b)) * store(&(__return.s20),unsigned short,f16_active___riscv_vmerge_vxm_u16m4(20,vl,x20,m20,b)) * store(&(__return.s21),unsigned short,f16_active___riscv_vmerge_vxm_u16m4(21,vl,x21,m21,b)) * store(&(__return.s22),unsigned short,f16_active___riscv_vmerge_vxm_u16m4(22,vl,x22,m22,b)) * store(&(__return.s23),unsigned short,f16_active___riscv_vmerge_vxm_u16m4(23,vl,x23,m23,b)) * store(&(__return.s24),unsigned short,f16_active___riscv_vmerge_vxm_u16m4(24,vl,x24,m24,b)) * store(&(__return.s25),unsigned short,f16_active___riscv_vmerge_vxm_u16m4(25,vl,x25,m25,b)) * store(&(__return.s26),unsigned short,f16_active___riscv_vmerge_vxm_u16m4(26,vl,x26,m26,b)) * store(&(__return.s27),unsigned short,f16_active___riscv_vmerge_vxm_u16m4(27,vl,x27,m27,b)) * store(&(__return.s28),unsigned short,f16_active___riscv_vmerge_vxm_u16m4(28,vl,x28,m28,b)) * store(&(__return.s29),unsigned short,f16_active___riscv_vmerge_vxm_u16m4(29,vl,x29,m29,b)) * store(&(__return.s30),unsigned short,f16_active___riscv_vmerge_vxm_u16m4(30,vl,x30,m30,b)) * store(&(__return.s31),unsigned short,f16_active___riscv_vmerge_vxm_u16m4(31,vl,x31,m31,b)) */
{
 vuint16m4_t r;
 r.s0=qcp_f16_active___riscv_vmerge_vxm_u16m4(a.s0,mask.s0,b,0,vl);
 r.s1=qcp_f16_active___riscv_vmerge_vxm_u16m4(a.s1,mask.s1,b,1,vl);
 r.s2=qcp_f16_active___riscv_vmerge_vxm_u16m4(a.s2,mask.s2,b,2,vl);
 r.s3=qcp_f16_active___riscv_vmerge_vxm_u16m4(a.s3,mask.s3,b,3,vl);
 r.s4=qcp_f16_active___riscv_vmerge_vxm_u16m4(a.s4,mask.s4,b,4,vl);
 r.s5=qcp_f16_active___riscv_vmerge_vxm_u16m4(a.s5,mask.s5,b,5,vl);
 r.s6=qcp_f16_active___riscv_vmerge_vxm_u16m4(a.s6,mask.s6,b,6,vl);
 r.s7=qcp_f16_active___riscv_vmerge_vxm_u16m4(a.s7,mask.s7,b,7,vl);
 r.s8=qcp_f16_active___riscv_vmerge_vxm_u16m4(a.s8,mask.s8,b,8,vl);
 r.s9=qcp_f16_active___riscv_vmerge_vxm_u16m4(a.s9,mask.s9,b,9,vl);
 r.s10=qcp_f16_active___riscv_vmerge_vxm_u16m4(a.s10,mask.s10,b,10,vl);
 r.s11=qcp_f16_active___riscv_vmerge_vxm_u16m4(a.s11,mask.s11,b,11,vl);
 r.s12=qcp_f16_active___riscv_vmerge_vxm_u16m4(a.s12,mask.s12,b,12,vl);
 r.s13=qcp_f16_active___riscv_vmerge_vxm_u16m4(a.s13,mask.s13,b,13,vl);
 r.s14=qcp_f16_active___riscv_vmerge_vxm_u16m4(a.s14,mask.s14,b,14,vl);
 r.s15=qcp_f16_active___riscv_vmerge_vxm_u16m4(a.s15,mask.s15,b,15,vl);
 r.s16=qcp_f16_active___riscv_vmerge_vxm_u16m4(a.s16,mask.s16,b,16,vl);
 r.s17=qcp_f16_active___riscv_vmerge_vxm_u16m4(a.s17,mask.s17,b,17,vl);
 r.s18=qcp_f16_active___riscv_vmerge_vxm_u16m4(a.s18,mask.s18,b,18,vl);
 r.s19=qcp_f16_active___riscv_vmerge_vxm_u16m4(a.s19,mask.s19,b,19,vl);
 r.s20=qcp_f16_active___riscv_vmerge_vxm_u16m4(a.s20,mask.s20,b,20,vl);
 r.s21=qcp_f16_active___riscv_vmerge_vxm_u16m4(a.s21,mask.s21,b,21,vl);
 r.s22=qcp_f16_active___riscv_vmerge_vxm_u16m4(a.s22,mask.s22,b,22,vl);
 r.s23=qcp_f16_active___riscv_vmerge_vxm_u16m4(a.s23,mask.s23,b,23,vl);
 r.s24=qcp_f16_active___riscv_vmerge_vxm_u16m4(a.s24,mask.s24,b,24,vl);
 r.s25=qcp_f16_active___riscv_vmerge_vxm_u16m4(a.s25,mask.s25,b,25,vl);
 r.s26=qcp_f16_active___riscv_vmerge_vxm_u16m4(a.s26,mask.s26,b,26,vl);
 r.s27=qcp_f16_active___riscv_vmerge_vxm_u16m4(a.s27,mask.s27,b,27,vl);
 r.s28=qcp_f16_active___riscv_vmerge_vxm_u16m4(a.s28,mask.s28,b,28,vl);
 r.s29=qcp_f16_active___riscv_vmerge_vxm_u16m4(a.s29,mask.s29,b,29,vl);
 r.s30=qcp_f16_active___riscv_vmerge_vxm_u16m4(a.s30,mask.s30,b,30,vl);
 r.s31=qcp_f16_active___riscv_vmerge_vxm_u16m4(a.s31,mask.s31,b,31,vl);
 return r;
}
