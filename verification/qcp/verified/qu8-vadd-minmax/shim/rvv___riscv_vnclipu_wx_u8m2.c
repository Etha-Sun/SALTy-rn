#include "rvv_arithmetic.h"
vuint8m2_t __riscv_vnclipu_wx_u8m2(vuint16m4_t a,size_t d,int rm,size_t vl)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) (a8:Z) (a9:Z) (a10:Z) (a11:Z) (a12:Z) (a13:Z) (a14:Z) (a15:Z) (a16:Z) (a17:Z) (a18:Z) (a19:Z) (a20:Z) (a21:Z) (a22:Z) (a23:Z) (a24:Z) (a25:Z) (a26:Z) (a27:Z) (a28:Z) (a29:Z) (a30:Z) (a31:Z)
 Require 0<=vl && vl<=32 && 0<=a0 && a0<=65535 && 0<=a1 && a1<=65535 && 0<=a2 && a2<=65535 && 0<=a3 && a3<=65535 && 0<=a4 && a4<=65535 && 0<=a5 && a5<=65535 && 0<=a6 && a6<=65535 && 0<=a7 && a7<=65535 && 0<=a8 && a8<=65535 && 0<=a9 && a9<=65535 && 0<=a10 && a10<=65535 && 0<=a11 && a11<=65535 && 0<=a12 && a12<=65535 && 0<=a13 && a13<=65535 && 0<=a14 && a14<=65535 && 0<=a15 && a15<=65535 && 0<=a16 && a16<=65535 && 0<=a17 && a17<=65535 && 0<=a18 && a18<=65535 && 0<=a19 && a19<=65535 && 0<=a20 && a20<=65535 && 0<=a21 && a21<=65535 && 0<=a22 && a22<=65535 && 0<=a23 && a23<=65535 && 0<=a24 && a24<=65535 && 0<=a25 && a25<=65535 && 0<=a26 && a26<=65535 && 0<=a27 && a27<=65535 && 0<=a28 && a28<=65535 && 0<=a29 && a29<=65535 && 0<=a30 && a30<=65535 && 0<=a31 && a31<=65535 && d==0 && rm==2 && store(&(a.s0),unsigned short,a0) * store(&(a.s1),unsigned short,a1) * store(&(a.s2),unsigned short,a2) * store(&(a.s3),unsigned short,a3) * store(&(a.s4),unsigned short,a4) * store(&(a.s5),unsigned short,a5) * store(&(a.s6),unsigned short,a6) * store(&(a.s7),unsigned short,a7) * store(&(a.s8),unsigned short,a8) * store(&(a.s9),unsigned short,a9) * store(&(a.s10),unsigned short,a10) * store(&(a.s11),unsigned short,a11) * store(&(a.s12),unsigned short,a12) * store(&(a.s13),unsigned short,a13) * store(&(a.s14),unsigned short,a14) * store(&(a.s15),unsigned short,a15) * store(&(a.s16),unsigned short,a16) * store(&(a.s17),unsigned short,a17) * store(&(a.s18),unsigned short,a18) * store(&(a.s19),unsigned short,a19) * store(&(a.s20),unsigned short,a20) * store(&(a.s21),unsigned short,a21) * store(&(a.s22),unsigned short,a22) * store(&(a.s23),unsigned short,a23) * store(&(a.s24),unsigned short,a24) * store(&(a.s25),unsigned short,a25) * store(&(a.s26),unsigned short,a26) * store(&(a.s27),unsigned short,a27) * store(&(a.s28),unsigned short,a28) * store(&(a.s29),unsigned short,a29) * store(&(a.s30),unsigned short,a30) * store(&(a.s31),unsigned short,a31)
 Ensure store(&(__return.s0),unsigned char,qu_active_clipu8(0,vl,a0)) * store(&(__return.s1),unsigned char,qu_active_clipu8(1,vl,a1)) * store(&(__return.s2),unsigned char,qu_active_clipu8(2,vl,a2)) * store(&(__return.s3),unsigned char,qu_active_clipu8(3,vl,a3)) * store(&(__return.s4),unsigned char,qu_active_clipu8(4,vl,a4)) * store(&(__return.s5),unsigned char,qu_active_clipu8(5,vl,a5)) * store(&(__return.s6),unsigned char,qu_active_clipu8(6,vl,a6)) * store(&(__return.s7),unsigned char,qu_active_clipu8(7,vl,a7)) * store(&(__return.s8),unsigned char,qu_active_clipu8(8,vl,a8)) * store(&(__return.s9),unsigned char,qu_active_clipu8(9,vl,a9)) * store(&(__return.s10),unsigned char,qu_active_clipu8(10,vl,a10)) * store(&(__return.s11),unsigned char,qu_active_clipu8(11,vl,a11)) * store(&(__return.s12),unsigned char,qu_active_clipu8(12,vl,a12)) * store(&(__return.s13),unsigned char,qu_active_clipu8(13,vl,a13)) * store(&(__return.s14),unsigned char,qu_active_clipu8(14,vl,a14)) * store(&(__return.s15),unsigned char,qu_active_clipu8(15,vl,a15)) * store(&(__return.s16),unsigned char,qu_active_clipu8(16,vl,a16)) * store(&(__return.s17),unsigned char,qu_active_clipu8(17,vl,a17)) * store(&(__return.s18),unsigned char,qu_active_clipu8(18,vl,a18)) * store(&(__return.s19),unsigned char,qu_active_clipu8(19,vl,a19)) * store(&(__return.s20),unsigned char,qu_active_clipu8(20,vl,a20)) * store(&(__return.s21),unsigned char,qu_active_clipu8(21,vl,a21)) * store(&(__return.s22),unsigned char,qu_active_clipu8(22,vl,a22)) * store(&(__return.s23),unsigned char,qu_active_clipu8(23,vl,a23)) * store(&(__return.s24),unsigned char,qu_active_clipu8(24,vl,a24)) * store(&(__return.s25),unsigned char,qu_active_clipu8(25,vl,a25)) * store(&(__return.s26),unsigned char,qu_active_clipu8(26,vl,a26)) * store(&(__return.s27),unsigned char,qu_active_clipu8(27,vl,a27)) * store(&(__return.s28),unsigned char,qu_active_clipu8(28,vl,a28)) * store(&(__return.s29),unsigned char,qu_active_clipu8(29,vl,a29)) * store(&(__return.s30),unsigned char,qu_active_clipu8(30,vl,a30)) * store(&(__return.s31),unsigned char,qu_active_clipu8(31,vl,a31)) */
{
 vuint8m2_t r;
 r.s0=qcp_qu_active_clipu8(a.s0,0,vl);
 r.s1=qcp_qu_active_clipu8(a.s1,1,vl);
 r.s2=qcp_qu_active_clipu8(a.s2,2,vl);
 r.s3=qcp_qu_active_clipu8(a.s3,3,vl);
 r.s4=qcp_qu_active_clipu8(a.s4,4,vl);
 r.s5=qcp_qu_active_clipu8(a.s5,5,vl);
 r.s6=qcp_qu_active_clipu8(a.s6,6,vl);
 r.s7=qcp_qu_active_clipu8(a.s7,7,vl);
 r.s8=qcp_qu_active_clipu8(a.s8,8,vl);
 r.s9=qcp_qu_active_clipu8(a.s9,9,vl);
 r.s10=qcp_qu_active_clipu8(a.s10,10,vl);
 r.s11=qcp_qu_active_clipu8(a.s11,11,vl);
 r.s12=qcp_qu_active_clipu8(a.s12,12,vl);
 r.s13=qcp_qu_active_clipu8(a.s13,13,vl);
 r.s14=qcp_qu_active_clipu8(a.s14,14,vl);
 r.s15=qcp_qu_active_clipu8(a.s15,15,vl);
 r.s16=qcp_qu_active_clipu8(a.s16,16,vl);
 r.s17=qcp_qu_active_clipu8(a.s17,17,vl);
 r.s18=qcp_qu_active_clipu8(a.s18,18,vl);
 r.s19=qcp_qu_active_clipu8(a.s19,19,vl);
 r.s20=qcp_qu_active_clipu8(a.s20,20,vl);
 r.s21=qcp_qu_active_clipu8(a.s21,21,vl);
 r.s22=qcp_qu_active_clipu8(a.s22,22,vl);
 r.s23=qcp_qu_active_clipu8(a.s23,23,vl);
 r.s24=qcp_qu_active_clipu8(a.s24,24,vl);
 r.s25=qcp_qu_active_clipu8(a.s25,25,vl);
 r.s26=qcp_qu_active_clipu8(a.s26,26,vl);
 r.s27=qcp_qu_active_clipu8(a.s27,27,vl);
 r.s28=qcp_qu_active_clipu8(a.s28,28,vl);
 r.s29=qcp_qu_active_clipu8(a.s29,29,vl);
 r.s30=qcp_qu_active_clipu8(a.s30,30,vl);
 r.s31=qcp_qu_active_clipu8(a.s31,31,vl);
 return r;
}
