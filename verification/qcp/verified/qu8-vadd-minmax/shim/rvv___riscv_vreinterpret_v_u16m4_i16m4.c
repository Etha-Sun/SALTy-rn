#include "rvv_arithmetic.h"
vint16m4_t __riscv_vreinterpret_v_u16m4_i16m4(vuint16m4_t a)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) (a8:Z) (a9:Z) (a10:Z) (a11:Z) (a12:Z) (a13:Z) (a14:Z) (a15:Z) (a16:Z) (a17:Z) (a18:Z) (a19:Z) (a20:Z) (a21:Z) (a22:Z) (a23:Z) (a24:Z) (a25:Z) (a26:Z) (a27:Z) (a28:Z) (a29:Z) (a30:Z) (a31:Z)
 Require 0<=a0 && a0<=65535 && 0<=a1 && a1<=65535 && 0<=a2 && a2<=65535 && 0<=a3 && a3<=65535 && 0<=a4 && a4<=65535 && 0<=a5 && a5<=65535 && 0<=a6 && a6<=65535 && 0<=a7 && a7<=65535 && 0<=a8 && a8<=65535 && 0<=a9 && a9<=65535 && 0<=a10 && a10<=65535 && 0<=a11 && a11<=65535 && 0<=a12 && a12<=65535 && 0<=a13 && a13<=65535 && 0<=a14 && a14<=65535 && 0<=a15 && a15<=65535 && 0<=a16 && a16<=65535 && 0<=a17 && a17<=65535 && 0<=a18 && a18<=65535 && 0<=a19 && a19<=65535 && 0<=a20 && a20<=65535 && 0<=a21 && a21<=65535 && 0<=a22 && a22<=65535 && 0<=a23 && a23<=65535 && 0<=a24 && a24<=65535 && 0<=a25 && a25<=65535 && 0<=a26 && a26<=65535 && 0<=a27 && a27<=65535 && 0<=a28 && a28<=65535 && 0<=a29 && a29<=65535 && 0<=a30 && a30<=65535 && 0<=a31 && a31<=65535 && store(&(a.s0),unsigned short,a0) * store(&(a.s1),unsigned short,a1) * store(&(a.s2),unsigned short,a2) * store(&(a.s3),unsigned short,a3) * store(&(a.s4),unsigned short,a4) * store(&(a.s5),unsigned short,a5) * store(&(a.s6),unsigned short,a6) * store(&(a.s7),unsigned short,a7) * store(&(a.s8),unsigned short,a8) * store(&(a.s9),unsigned short,a9) * store(&(a.s10),unsigned short,a10) * store(&(a.s11),unsigned short,a11) * store(&(a.s12),unsigned short,a12) * store(&(a.s13),unsigned short,a13) * store(&(a.s14),unsigned short,a14) * store(&(a.s15),unsigned short,a15) * store(&(a.s16),unsigned short,a16) * store(&(a.s17),unsigned short,a17) * store(&(a.s18),unsigned short,a18) * store(&(a.s19),unsigned short,a19) * store(&(a.s20),unsigned short,a20) * store(&(a.s21),unsigned short,a21) * store(&(a.s22),unsigned short,a22) * store(&(a.s23),unsigned short,a23) * store(&(a.s24),unsigned short,a24) * store(&(a.s25),unsigned short,a25) * store(&(a.s26),unsigned short,a26) * store(&(a.s27),unsigned short,a27) * store(&(a.s28),unsigned short,a28) * store(&(a.s29),unsigned short,a29) * store(&(a.s30),unsigned short,a30) * store(&(a.s31),unsigned short,a31)
 Ensure store(&(__return.s0),short,qu_s16(a0)) * store(&(__return.s1),short,qu_s16(a1)) * store(&(__return.s2),short,qu_s16(a2)) * store(&(__return.s3),short,qu_s16(a3)) * store(&(__return.s4),short,qu_s16(a4)) * store(&(__return.s5),short,qu_s16(a5)) * store(&(__return.s6),short,qu_s16(a6)) * store(&(__return.s7),short,qu_s16(a7)) * store(&(__return.s8),short,qu_s16(a8)) * store(&(__return.s9),short,qu_s16(a9)) * store(&(__return.s10),short,qu_s16(a10)) * store(&(__return.s11),short,qu_s16(a11)) * store(&(__return.s12),short,qu_s16(a12)) * store(&(__return.s13),short,qu_s16(a13)) * store(&(__return.s14),short,qu_s16(a14)) * store(&(__return.s15),short,qu_s16(a15)) * store(&(__return.s16),short,qu_s16(a16)) * store(&(__return.s17),short,qu_s16(a17)) * store(&(__return.s18),short,qu_s16(a18)) * store(&(__return.s19),short,qu_s16(a19)) * store(&(__return.s20),short,qu_s16(a20)) * store(&(__return.s21),short,qu_s16(a21)) * store(&(__return.s22),short,qu_s16(a22)) * store(&(__return.s23),short,qu_s16(a23)) * store(&(__return.s24),short,qu_s16(a24)) * store(&(__return.s25),short,qu_s16(a25)) * store(&(__return.s26),short,qu_s16(a26)) * store(&(__return.s27),short,qu_s16(a27)) * store(&(__return.s28),short,qu_s16(a28)) * store(&(__return.s29),short,qu_s16(a29)) * store(&(__return.s30),short,qu_s16(a30)) * store(&(__return.s31),short,qu_s16(a31)) */
{
 vint16m4_t r;
 r.s0=qcp_qu_from_u16(a.s0);
 r.s1=qcp_qu_from_u16(a.s1);
 r.s2=qcp_qu_from_u16(a.s2);
 r.s3=qcp_qu_from_u16(a.s3);
 r.s4=qcp_qu_from_u16(a.s4);
 r.s5=qcp_qu_from_u16(a.s5);
 r.s6=qcp_qu_from_u16(a.s6);
 r.s7=qcp_qu_from_u16(a.s7);
 r.s8=qcp_qu_from_u16(a.s8);
 r.s9=qcp_qu_from_u16(a.s9);
 r.s10=qcp_qu_from_u16(a.s10);
 r.s11=qcp_qu_from_u16(a.s11);
 r.s12=qcp_qu_from_u16(a.s12);
 r.s13=qcp_qu_from_u16(a.s13);
 r.s14=qcp_qu_from_u16(a.s14);
 r.s15=qcp_qu_from_u16(a.s15);
 r.s16=qcp_qu_from_u16(a.s16);
 r.s17=qcp_qu_from_u16(a.s17);
 r.s18=qcp_qu_from_u16(a.s18);
 r.s19=qcp_qu_from_u16(a.s19);
 r.s20=qcp_qu_from_u16(a.s20);
 r.s21=qcp_qu_from_u16(a.s21);
 r.s22=qcp_qu_from_u16(a.s22);
 r.s23=qcp_qu_from_u16(a.s23);
 r.s24=qcp_qu_from_u16(a.s24);
 r.s25=qcp_qu_from_u16(a.s25);
 r.s26=qcp_qu_from_u16(a.s26);
 r.s27=qcp_qu_from_u16(a.s27);
 r.s28=qcp_qu_from_u16(a.s28);
 r.s29=qcp_qu_from_u16(a.s29);
 r.s30=qcp_qu_from_u16(a.s30);
 r.s31=qcp_qu_from_u16(a.s31);
 return r;
}
