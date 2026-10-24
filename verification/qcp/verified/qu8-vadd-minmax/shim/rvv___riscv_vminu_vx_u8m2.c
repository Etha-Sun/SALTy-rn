#include "rvv_arithmetic.h"
vuint8m2_t __riscv_vminu_vx_u8m2(vuint8m2_t a,uint8_t b,size_t vl)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) (a8:Z) (a9:Z) (a10:Z) (a11:Z) (a12:Z) (a13:Z) (a14:Z) (a15:Z) (a16:Z) (a17:Z) (a18:Z) (a19:Z) (a20:Z) (a21:Z) (a22:Z) (a23:Z) (a24:Z) (a25:Z) (a26:Z) (a27:Z) (a28:Z) (a29:Z) (a30:Z) (a31:Z)
 Require 0<=vl && vl<=32 && 0<=a0 && a0<=255 && 0<=a1 && a1<=255 && 0<=a2 && a2<=255 && 0<=a3 && a3<=255 && 0<=a4 && a4<=255 && 0<=a5 && a5<=255 && 0<=a6 && a6<=255 && 0<=a7 && a7<=255 && 0<=a8 && a8<=255 && 0<=a9 && a9<=255 && 0<=a10 && a10<=255 && 0<=a11 && a11<=255 && 0<=a12 && a12<=255 && 0<=a13 && a13<=255 && 0<=a14 && a14<=255 && 0<=a15 && a15<=255 && 0<=a16 && a16<=255 && 0<=a17 && a17<=255 && 0<=a18 && a18<=255 && 0<=a19 && a19<=255 && 0<=a20 && a20<=255 && 0<=a21 && a21<=255 && 0<=a22 && a22<=255 && 0<=a23 && a23<=255 && 0<=a24 && a24<=255 && 0<=a25 && a25<=255 && 0<=a26 && a26<=255 && 0<=a27 && a27<=255 && 0<=a28 && a28<=255 && 0<=a29 && a29<=255 && 0<=a30 && a30<=255 && 0<=a31 && a31<=255 && 0<=b && b<=255 && store(&(a.s0),unsigned char,a0) * store(&(a.s1),unsigned char,a1) * store(&(a.s2),unsigned char,a2) * store(&(a.s3),unsigned char,a3) * store(&(a.s4),unsigned char,a4) * store(&(a.s5),unsigned char,a5) * store(&(a.s6),unsigned char,a6) * store(&(a.s7),unsigned char,a7) * store(&(a.s8),unsigned char,a8) * store(&(a.s9),unsigned char,a9) * store(&(a.s10),unsigned char,a10) * store(&(a.s11),unsigned char,a11) * store(&(a.s12),unsigned char,a12) * store(&(a.s13),unsigned char,a13) * store(&(a.s14),unsigned char,a14) * store(&(a.s15),unsigned char,a15) * store(&(a.s16),unsigned char,a16) * store(&(a.s17),unsigned char,a17) * store(&(a.s18),unsigned char,a18) * store(&(a.s19),unsigned char,a19) * store(&(a.s20),unsigned char,a20) * store(&(a.s21),unsigned char,a21) * store(&(a.s22),unsigned char,a22) * store(&(a.s23),unsigned char,a23) * store(&(a.s24),unsigned char,a24) * store(&(a.s25),unsigned char,a25) * store(&(a.s26),unsigned char,a26) * store(&(a.s27),unsigned char,a27) * store(&(a.s28),unsigned char,a28) * store(&(a.s29),unsigned char,a29) * store(&(a.s30),unsigned char,a30) * store(&(a.s31),unsigned char,a31)
 Ensure store(&(__return.s0),unsigned char,qu_active_min(0,vl,a0,b)) * store(&(__return.s1),unsigned char,qu_active_min(1,vl,a1,b)) * store(&(__return.s2),unsigned char,qu_active_min(2,vl,a2,b)) * store(&(__return.s3),unsigned char,qu_active_min(3,vl,a3,b)) * store(&(__return.s4),unsigned char,qu_active_min(4,vl,a4,b)) * store(&(__return.s5),unsigned char,qu_active_min(5,vl,a5,b)) * store(&(__return.s6),unsigned char,qu_active_min(6,vl,a6,b)) * store(&(__return.s7),unsigned char,qu_active_min(7,vl,a7,b)) * store(&(__return.s8),unsigned char,qu_active_min(8,vl,a8,b)) * store(&(__return.s9),unsigned char,qu_active_min(9,vl,a9,b)) * store(&(__return.s10),unsigned char,qu_active_min(10,vl,a10,b)) * store(&(__return.s11),unsigned char,qu_active_min(11,vl,a11,b)) * store(&(__return.s12),unsigned char,qu_active_min(12,vl,a12,b)) * store(&(__return.s13),unsigned char,qu_active_min(13,vl,a13,b)) * store(&(__return.s14),unsigned char,qu_active_min(14,vl,a14,b)) * store(&(__return.s15),unsigned char,qu_active_min(15,vl,a15,b)) * store(&(__return.s16),unsigned char,qu_active_min(16,vl,a16,b)) * store(&(__return.s17),unsigned char,qu_active_min(17,vl,a17,b)) * store(&(__return.s18),unsigned char,qu_active_min(18,vl,a18,b)) * store(&(__return.s19),unsigned char,qu_active_min(19,vl,a19,b)) * store(&(__return.s20),unsigned char,qu_active_min(20,vl,a20,b)) * store(&(__return.s21),unsigned char,qu_active_min(21,vl,a21,b)) * store(&(__return.s22),unsigned char,qu_active_min(22,vl,a22,b)) * store(&(__return.s23),unsigned char,qu_active_min(23,vl,a23,b)) * store(&(__return.s24),unsigned char,qu_active_min(24,vl,a24,b)) * store(&(__return.s25),unsigned char,qu_active_min(25,vl,a25,b)) * store(&(__return.s26),unsigned char,qu_active_min(26,vl,a26,b)) * store(&(__return.s27),unsigned char,qu_active_min(27,vl,a27,b)) * store(&(__return.s28),unsigned char,qu_active_min(28,vl,a28,b)) * store(&(__return.s29),unsigned char,qu_active_min(29,vl,a29,b)) * store(&(__return.s30),unsigned char,qu_active_min(30,vl,a30,b)) * store(&(__return.s31),unsigned char,qu_active_min(31,vl,a31,b)) */
{
 vuint8m2_t r;
 r.s0=qcp_qu_active_min(a.s0,b,0,vl);
 r.s1=qcp_qu_active_min(a.s1,b,1,vl);
 r.s2=qcp_qu_active_min(a.s2,b,2,vl);
 r.s3=qcp_qu_active_min(a.s3,b,3,vl);
 r.s4=qcp_qu_active_min(a.s4,b,4,vl);
 r.s5=qcp_qu_active_min(a.s5,b,5,vl);
 r.s6=qcp_qu_active_min(a.s6,b,6,vl);
 r.s7=qcp_qu_active_min(a.s7,b,7,vl);
 r.s8=qcp_qu_active_min(a.s8,b,8,vl);
 r.s9=qcp_qu_active_min(a.s9,b,9,vl);
 r.s10=qcp_qu_active_min(a.s10,b,10,vl);
 r.s11=qcp_qu_active_min(a.s11,b,11,vl);
 r.s12=qcp_qu_active_min(a.s12,b,12,vl);
 r.s13=qcp_qu_active_min(a.s13,b,13,vl);
 r.s14=qcp_qu_active_min(a.s14,b,14,vl);
 r.s15=qcp_qu_active_min(a.s15,b,15,vl);
 r.s16=qcp_qu_active_min(a.s16,b,16,vl);
 r.s17=qcp_qu_active_min(a.s17,b,17,vl);
 r.s18=qcp_qu_active_min(a.s18,b,18,vl);
 r.s19=qcp_qu_active_min(a.s19,b,19,vl);
 r.s20=qcp_qu_active_min(a.s20,b,20,vl);
 r.s21=qcp_qu_active_min(a.s21,b,21,vl);
 r.s22=qcp_qu_active_min(a.s22,b,22,vl);
 r.s23=qcp_qu_active_min(a.s23,b,23,vl);
 r.s24=qcp_qu_active_min(a.s24,b,24,vl);
 r.s25=qcp_qu_active_min(a.s25,b,25,vl);
 r.s26=qcp_qu_active_min(a.s26,b,26,vl);
 r.s27=qcp_qu_active_min(a.s27,b,27,vl);
 r.s28=qcp_qu_active_min(a.s28,b,28,vl);
 r.s29=qcp_qu_active_min(a.s29,b,29,vl);
 r.s30=qcp_qu_active_min(a.s30,b,30,vl);
 r.s31=qcp_qu_active_min(a.s31,b,31,vl);
 return r;
}
