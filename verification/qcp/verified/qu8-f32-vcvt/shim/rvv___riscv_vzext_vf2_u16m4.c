#include "rvv_unsigned.h"
vuint16m4_t __riscv_vzext_vf2_u16m4(vuint8m2_t a,size_t vl)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) (a8:Z) (a9:Z) (a10:Z) (a11:Z) (a12:Z) (a13:Z) (a14:Z) (a15:Z) (a16:Z) (a17:Z) (a18:Z) (a19:Z) (a20:Z) (a21:Z) (a22:Z) (a23:Z) (a24:Z) (a25:Z) (a26:Z) (a27:Z) (a28:Z) (a29:Z) (a30:Z) (a31:Z) Require 0<=vl && vl<=32 && 0<=a0 && a0<=255 && 0<=a1 && a1<=255 && 0<=a2 && a2<=255 && 0<=a3 && a3<=255 && 0<=a4 && a4<=255 && 0<=a5 && a5<=255 && 0<=a6 && a6<=255 && 0<=a7 && a7<=255 && 0<=a8 && a8<=255 && 0<=a9 && a9<=255 && 0<=a10 && a10<=255 && 0<=a11 && a11<=255 && 0<=a12 && a12<=255 && 0<=a13 && a13<=255 && 0<=a14 && a14<=255 && 0<=a15 && a15<=255 && 0<=a16 && a16<=255 && 0<=a17 && a17<=255 && 0<=a18 && a18<=255 && 0<=a19 && a19<=255 && 0<=a20 && a20<=255 && 0<=a21 && a21<=255 && 0<=a22 && a22<=255 && 0<=a23 && a23<=255 && 0<=a24 && a24<=255 && 0<=a25 && a25<=255 && 0<=a26 && a26<=255 && 0<=a27 && a27<=255 && 0<=a28 && a28<=255 && 0<=a29 && a29<=255 && 0<=a30 && a30<=255 && 0<=a31 && a31<=255 && store(&(a.s0),unsigned char,a0) * store(&(a.s1),unsigned char,a1) * store(&(a.s2),unsigned char,a2) * store(&(a.s3),unsigned char,a3) * store(&(a.s4),unsigned char,a4) * store(&(a.s5),unsigned char,a5) * store(&(a.s6),unsigned char,a6) * store(&(a.s7),unsigned char,a7) * store(&(a.s8),unsigned char,a8) * store(&(a.s9),unsigned char,a9) * store(&(a.s10),unsigned char,a10) * store(&(a.s11),unsigned char,a11) * store(&(a.s12),unsigned char,a12) * store(&(a.s13),unsigned char,a13) * store(&(a.s14),unsigned char,a14) * store(&(a.s15),unsigned char,a15) * store(&(a.s16),unsigned char,a16) * store(&(a.s17),unsigned char,a17) * store(&(a.s18),unsigned char,a18) * store(&(a.s19),unsigned char,a19) * store(&(a.s20),unsigned char,a20) * store(&(a.s21),unsigned char,a21) * store(&(a.s22),unsigned char,a22) * store(&(a.s23),unsigned char,a23) * store(&(a.s24),unsigned char,a24) * store(&(a.s25),unsigned char,a25) * store(&(a.s26),unsigned char,a26) * store(&(a.s27),unsigned char,a27) * store(&(a.s28),unsigned char,a28) * store(&(a.s29),unsigned char,a29) * store(&(a.s30),unsigned char,a30) * store(&(a.s31),unsigned char,a31) Ensure store(&(__return.s0),unsigned short,cvt_active_int(0,vl,a0)) * store(&(__return.s1),unsigned short,cvt_active_int(1,vl,a1)) * store(&(__return.s2),unsigned short,cvt_active_int(2,vl,a2)) * store(&(__return.s3),unsigned short,cvt_active_int(3,vl,a3)) * store(&(__return.s4),unsigned short,cvt_active_int(4,vl,a4)) * store(&(__return.s5),unsigned short,cvt_active_int(5,vl,a5)) * store(&(__return.s6),unsigned short,cvt_active_int(6,vl,a6)) * store(&(__return.s7),unsigned short,cvt_active_int(7,vl,a7)) * store(&(__return.s8),unsigned short,cvt_active_int(8,vl,a8)) * store(&(__return.s9),unsigned short,cvt_active_int(9,vl,a9)) * store(&(__return.s10),unsigned short,cvt_active_int(10,vl,a10)) * store(&(__return.s11),unsigned short,cvt_active_int(11,vl,a11)) * store(&(__return.s12),unsigned short,cvt_active_int(12,vl,a12)) * store(&(__return.s13),unsigned short,cvt_active_int(13,vl,a13)) * store(&(__return.s14),unsigned short,cvt_active_int(14,vl,a14)) * store(&(__return.s15),unsigned short,cvt_active_int(15,vl,a15)) * store(&(__return.s16),unsigned short,cvt_active_int(16,vl,a16)) * store(&(__return.s17),unsigned short,cvt_active_int(17,vl,a17)) * store(&(__return.s18),unsigned short,cvt_active_int(18,vl,a18)) * store(&(__return.s19),unsigned short,cvt_active_int(19,vl,a19)) * store(&(__return.s20),unsigned short,cvt_active_int(20,vl,a20)) * store(&(__return.s21),unsigned short,cvt_active_int(21,vl,a21)) * store(&(__return.s22),unsigned short,cvt_active_int(22,vl,a22)) * store(&(__return.s23),unsigned short,cvt_active_int(23,vl,a23)) * store(&(__return.s24),unsigned short,cvt_active_int(24,vl,a24)) * store(&(__return.s25),unsigned short,cvt_active_int(25,vl,a25)) * store(&(__return.s26),unsigned short,cvt_active_int(26,vl,a26)) * store(&(__return.s27),unsigned short,cvt_active_int(27,vl,a27)) * store(&(__return.s28),unsigned short,cvt_active_int(28,vl,a28)) * store(&(__return.s29),unsigned short,cvt_active_int(29,vl,a29)) * store(&(__return.s30),unsigned short,cvt_active_int(30,vl,a30)) * store(&(__return.s31),unsigned short,cvt_active_int(31,vl,a31)) */
{ vuint16m4_t r;
 r.s0=qcp_cvt_active_zext8(a.s0,0,vl);
 r.s1=qcp_cvt_active_zext8(a.s1,1,vl);
 r.s2=qcp_cvt_active_zext8(a.s2,2,vl);
 r.s3=qcp_cvt_active_zext8(a.s3,3,vl);
 r.s4=qcp_cvt_active_zext8(a.s4,4,vl);
 r.s5=qcp_cvt_active_zext8(a.s5,5,vl);
 r.s6=qcp_cvt_active_zext8(a.s6,6,vl);
 r.s7=qcp_cvt_active_zext8(a.s7,7,vl);
 r.s8=qcp_cvt_active_zext8(a.s8,8,vl);
 r.s9=qcp_cvt_active_zext8(a.s9,9,vl);
 r.s10=qcp_cvt_active_zext8(a.s10,10,vl);
 r.s11=qcp_cvt_active_zext8(a.s11,11,vl);
 r.s12=qcp_cvt_active_zext8(a.s12,12,vl);
 r.s13=qcp_cvt_active_zext8(a.s13,13,vl);
 r.s14=qcp_cvt_active_zext8(a.s14,14,vl);
 r.s15=qcp_cvt_active_zext8(a.s15,15,vl);
 r.s16=qcp_cvt_active_zext8(a.s16,16,vl);
 r.s17=qcp_cvt_active_zext8(a.s17,17,vl);
 r.s18=qcp_cvt_active_zext8(a.s18,18,vl);
 r.s19=qcp_cvt_active_zext8(a.s19,19,vl);
 r.s20=qcp_cvt_active_zext8(a.s20,20,vl);
 r.s21=qcp_cvt_active_zext8(a.s21,21,vl);
 r.s22=qcp_cvt_active_zext8(a.s22,22,vl);
 r.s23=qcp_cvt_active_zext8(a.s23,23,vl);
 r.s24=qcp_cvt_active_zext8(a.s24,24,vl);
 r.s25=qcp_cvt_active_zext8(a.s25,25,vl);
 r.s26=qcp_cvt_active_zext8(a.s26,26,vl);
 r.s27=qcp_cvt_active_zext8(a.s27,27,vl);
 r.s28=qcp_cvt_active_zext8(a.s28,28,vl);
 r.s29=qcp_cvt_active_zext8(a.s29,29,vl);
 r.s30=qcp_cvt_active_zext8(a.s30,30,vl);
 r.s31=qcp_cvt_active_zext8(a.s31,31,vl);
 return r;
}
