#include "rvv_arithmetic.h"
vuint16m4_t __riscv_vreinterpret_v_i16m4_u16m4(vint16m4_t a)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) (a8:Z) (a9:Z) (a10:Z) (a11:Z) (a12:Z) (a13:Z) (a14:Z) (a15:Z) (a16:Z) (a17:Z) (a18:Z) (a19:Z) (a20:Z) (a21:Z) (a22:Z) (a23:Z) (a24:Z) (a25:Z) (a26:Z) (a27:Z) (a28:Z) (a29:Z) (a30:Z) (a31:Z)
 Require -32768<=a0 && a0<=32767 && -32768<=a1 && a1<=32767 && -32768<=a2 && a2<=32767 && -32768<=a3 && a3<=32767 && -32768<=a4 && a4<=32767 && -32768<=a5 && a5<=32767 && -32768<=a6 && a6<=32767 && -32768<=a7 && a7<=32767 && -32768<=a8 && a8<=32767 && -32768<=a9 && a9<=32767 && -32768<=a10 && a10<=32767 && -32768<=a11 && a11<=32767 && -32768<=a12 && a12<=32767 && -32768<=a13 && a13<=32767 && -32768<=a14 && a14<=32767 && -32768<=a15 && a15<=32767 && -32768<=a16 && a16<=32767 && -32768<=a17 && a17<=32767 && -32768<=a18 && a18<=32767 && -32768<=a19 && a19<=32767 && -32768<=a20 && a20<=32767 && -32768<=a21 && a21<=32767 && -32768<=a22 && a22<=32767 && -32768<=a23 && a23<=32767 && -32768<=a24 && a24<=32767 && -32768<=a25 && a25<=32767 && -32768<=a26 && a26<=32767 && -32768<=a27 && a27<=32767 && -32768<=a28 && a28<=32767 && -32768<=a29 && a29<=32767 && -32768<=a30 && a30<=32767 && -32768<=a31 && a31<=32767 && store(&(a.s0),short,a0) * store(&(a.s1),short,a1) * store(&(a.s2),short,a2) * store(&(a.s3),short,a3) * store(&(a.s4),short,a4) * store(&(a.s5),short,a5) * store(&(a.s6),short,a6) * store(&(a.s7),short,a7) * store(&(a.s8),short,a8) * store(&(a.s9),short,a9) * store(&(a.s10),short,a10) * store(&(a.s11),short,a11) * store(&(a.s12),short,a12) * store(&(a.s13),short,a13) * store(&(a.s14),short,a14) * store(&(a.s15),short,a15) * store(&(a.s16),short,a16) * store(&(a.s17),short,a17) * store(&(a.s18),short,a18) * store(&(a.s19),short,a19) * store(&(a.s20),short,a20) * store(&(a.s21),short,a21) * store(&(a.s22),short,a22) * store(&(a.s23),short,a23) * store(&(a.s24),short,a24) * store(&(a.s25),short,a25) * store(&(a.s26),short,a26) * store(&(a.s27),short,a27) * store(&(a.s28),short,a28) * store(&(a.s29),short,a29) * store(&(a.s30),short,a30) * store(&(a.s31),short,a31)
 Ensure store(&(__return.s0),unsigned short,qu_u16(a0)) * store(&(__return.s1),unsigned short,qu_u16(a1)) * store(&(__return.s2),unsigned short,qu_u16(a2)) * store(&(__return.s3),unsigned short,qu_u16(a3)) * store(&(__return.s4),unsigned short,qu_u16(a4)) * store(&(__return.s5),unsigned short,qu_u16(a5)) * store(&(__return.s6),unsigned short,qu_u16(a6)) * store(&(__return.s7),unsigned short,qu_u16(a7)) * store(&(__return.s8),unsigned short,qu_u16(a8)) * store(&(__return.s9),unsigned short,qu_u16(a9)) * store(&(__return.s10),unsigned short,qu_u16(a10)) * store(&(__return.s11),unsigned short,qu_u16(a11)) * store(&(__return.s12),unsigned short,qu_u16(a12)) * store(&(__return.s13),unsigned short,qu_u16(a13)) * store(&(__return.s14),unsigned short,qu_u16(a14)) * store(&(__return.s15),unsigned short,qu_u16(a15)) * store(&(__return.s16),unsigned short,qu_u16(a16)) * store(&(__return.s17),unsigned short,qu_u16(a17)) * store(&(__return.s18),unsigned short,qu_u16(a18)) * store(&(__return.s19),unsigned short,qu_u16(a19)) * store(&(__return.s20),unsigned short,qu_u16(a20)) * store(&(__return.s21),unsigned short,qu_u16(a21)) * store(&(__return.s22),unsigned short,qu_u16(a22)) * store(&(__return.s23),unsigned short,qu_u16(a23)) * store(&(__return.s24),unsigned short,qu_u16(a24)) * store(&(__return.s25),unsigned short,qu_u16(a25)) * store(&(__return.s26),unsigned short,qu_u16(a26)) * store(&(__return.s27),unsigned short,qu_u16(a27)) * store(&(__return.s28),unsigned short,qu_u16(a28)) * store(&(__return.s29),unsigned short,qu_u16(a29)) * store(&(__return.s30),unsigned short,qu_u16(a30)) * store(&(__return.s31),unsigned short,qu_u16(a31)) */
{
 vuint16m4_t r;
 r.s0=qcp_qu_u16(a.s0);
 r.s1=qcp_qu_u16(a.s1);
 r.s2=qcp_qu_u16(a.s2);
 r.s3=qcp_qu_u16(a.s3);
 r.s4=qcp_qu_u16(a.s4);
 r.s5=qcp_qu_u16(a.s5);
 r.s6=qcp_qu_u16(a.s6);
 r.s7=qcp_qu_u16(a.s7);
 r.s8=qcp_qu_u16(a.s8);
 r.s9=qcp_qu_u16(a.s9);
 r.s10=qcp_qu_u16(a.s10);
 r.s11=qcp_qu_u16(a.s11);
 r.s12=qcp_qu_u16(a.s12);
 r.s13=qcp_qu_u16(a.s13);
 r.s14=qcp_qu_u16(a.s14);
 r.s15=qcp_qu_u16(a.s15);
 r.s16=qcp_qu_u16(a.s16);
 r.s17=qcp_qu_u16(a.s17);
 r.s18=qcp_qu_u16(a.s18);
 r.s19=qcp_qu_u16(a.s19);
 r.s20=qcp_qu_u16(a.s20);
 r.s21=qcp_qu_u16(a.s21);
 r.s22=qcp_qu_u16(a.s22);
 r.s23=qcp_qu_u16(a.s23);
 r.s24=qcp_qu_u16(a.s24);
 r.s25=qcp_qu_u16(a.s25);
 r.s26=qcp_qu_u16(a.s26);
 r.s27=qcp_qu_u16(a.s27);
 r.s28=qcp_qu_u16(a.s28);
 r.s29=qcp_qu_u16(a.s29);
 r.s30=qcp_qu_u16(a.s30);
 r.s31=qcp_qu_u16(a.s31);
 return r;
}
