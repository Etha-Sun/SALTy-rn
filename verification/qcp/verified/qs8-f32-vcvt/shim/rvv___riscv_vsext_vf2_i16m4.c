#include "rvv_arithmetic.h"
#include "rvv_active.h"
vint16m4_t __riscv_vsext_vf2_i16m4(vint8m2_t a,size_t vl)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) (a8:Z) (a9:Z) (a10:Z) (a11:Z) (a12:Z) (a13:Z) (a14:Z) (a15:Z) (a16:Z) (a17:Z) (a18:Z) (a19:Z) (a20:Z) (a21:Z) (a22:Z) (a23:Z) (a24:Z) (a25:Z) (a26:Z) (a27:Z) (a28:Z) (a29:Z) (a30:Z) (a31:Z) Require 0<=vl && vl<=32 && -128<=a0 && a0<=127 && -128<=a1 && a1<=127 && -128<=a2 && a2<=127 && -128<=a3 && a3<=127 && -128<=a4 && a4<=127 && -128<=a5 && a5<=127 && -128<=a6 && a6<=127 && -128<=a7 && a7<=127 && -128<=a8 && a8<=127 && -128<=a9 && a9<=127 && -128<=a10 && a10<=127 && -128<=a11 && a11<=127 && -128<=a12 && a12<=127 && -128<=a13 && a13<=127 && -128<=a14 && a14<=127 && -128<=a15 && a15<=127 && -128<=a16 && a16<=127 && -128<=a17 && a17<=127 && -128<=a18 && a18<=127 && -128<=a19 && a19<=127 && -128<=a20 && a20<=127 && -128<=a21 && a21<=127 && -128<=a22 && a22<=127 && -128<=a23 && a23<=127 && -128<=a24 && a24<=127 && -128<=a25 && a25<=127 && -128<=a26 && a26<=127 && -128<=a27 && a27<=127 && -128<=a28 && a28<=127 && -128<=a29 && a29<=127 && -128<=a30 && a30<=127 && -128<=a31 && a31<=127 && store(&(a.s0),char,a0) * store(&(a.s1),char,a1) * store(&(a.s2),char,a2) * store(&(a.s3),char,a3) * store(&(a.s4),char,a4) * store(&(a.s5),char,a5) * store(&(a.s6),char,a6) * store(&(a.s7),char,a7) * store(&(a.s8),char,a8) * store(&(a.s9),char,a9) * store(&(a.s10),char,a10) * store(&(a.s11),char,a11) * store(&(a.s12),char,a12) * store(&(a.s13),char,a13) * store(&(a.s14),char,a14) * store(&(a.s15),char,a15) * store(&(a.s16),char,a16) * store(&(a.s17),char,a17) * store(&(a.s18),char,a18) * store(&(a.s19),char,a19) * store(&(a.s20),char,a20) * store(&(a.s21),char,a21) * store(&(a.s22),char,a22) * store(&(a.s23),char,a23) * store(&(a.s24),char,a24) * store(&(a.s25),char,a25) * store(&(a.s26),char,a26) * store(&(a.s27),char,a27) * store(&(a.s28),char,a28) * store(&(a.s29),char,a29) * store(&(a.s30),char,a30) * store(&(a.s31),char,a31) Ensure store(&(__return.s0),short,cvt_active_int(0,vl,a0)) * store(&(__return.s1),short,cvt_active_int(1,vl,a1)) * store(&(__return.s2),short,cvt_active_int(2,vl,a2)) * store(&(__return.s3),short,cvt_active_int(3,vl,a3)) * store(&(__return.s4),short,cvt_active_int(4,vl,a4)) * store(&(__return.s5),short,cvt_active_int(5,vl,a5)) * store(&(__return.s6),short,cvt_active_int(6,vl,a6)) * store(&(__return.s7),short,cvt_active_int(7,vl,a7)) * store(&(__return.s8),short,cvt_active_int(8,vl,a8)) * store(&(__return.s9),short,cvt_active_int(9,vl,a9)) * store(&(__return.s10),short,cvt_active_int(10,vl,a10)) * store(&(__return.s11),short,cvt_active_int(11,vl,a11)) * store(&(__return.s12),short,cvt_active_int(12,vl,a12)) * store(&(__return.s13),short,cvt_active_int(13,vl,a13)) * store(&(__return.s14),short,cvt_active_int(14,vl,a14)) * store(&(__return.s15),short,cvt_active_int(15,vl,a15)) * store(&(__return.s16),short,cvt_active_int(16,vl,a16)) * store(&(__return.s17),short,cvt_active_int(17,vl,a17)) * store(&(__return.s18),short,cvt_active_int(18,vl,a18)) * store(&(__return.s19),short,cvt_active_int(19,vl,a19)) * store(&(__return.s20),short,cvt_active_int(20,vl,a20)) * store(&(__return.s21),short,cvt_active_int(21,vl,a21)) * store(&(__return.s22),short,cvt_active_int(22,vl,a22)) * store(&(__return.s23),short,cvt_active_int(23,vl,a23)) * store(&(__return.s24),short,cvt_active_int(24,vl,a24)) * store(&(__return.s25),short,cvt_active_int(25,vl,a25)) * store(&(__return.s26),short,cvt_active_int(26,vl,a26)) * store(&(__return.s27),short,cvt_active_int(27,vl,a27)) * store(&(__return.s28),short,cvt_active_int(28,vl,a28)) * store(&(__return.s29),short,cvt_active_int(29,vl,a29)) * store(&(__return.s30),short,cvt_active_int(30,vl,a30)) * store(&(__return.s31),short,cvt_active_int(31,vl,a31)) */
{ vint16m4_t r;
 r.s0=qcp_cvt_active_sext8(a.s0,0,vl);
 r.s1=qcp_cvt_active_sext8(a.s1,1,vl);
 r.s2=qcp_cvt_active_sext8(a.s2,2,vl);
 r.s3=qcp_cvt_active_sext8(a.s3,3,vl);
 r.s4=qcp_cvt_active_sext8(a.s4,4,vl);
 r.s5=qcp_cvt_active_sext8(a.s5,5,vl);
 r.s6=qcp_cvt_active_sext8(a.s6,6,vl);
 r.s7=qcp_cvt_active_sext8(a.s7,7,vl);
 r.s8=qcp_cvt_active_sext8(a.s8,8,vl);
 r.s9=qcp_cvt_active_sext8(a.s9,9,vl);
 r.s10=qcp_cvt_active_sext8(a.s10,10,vl);
 r.s11=qcp_cvt_active_sext8(a.s11,11,vl);
 r.s12=qcp_cvt_active_sext8(a.s12,12,vl);
 r.s13=qcp_cvt_active_sext8(a.s13,13,vl);
 r.s14=qcp_cvt_active_sext8(a.s14,14,vl);
 r.s15=qcp_cvt_active_sext8(a.s15,15,vl);
 r.s16=qcp_cvt_active_sext8(a.s16,16,vl);
 r.s17=qcp_cvt_active_sext8(a.s17,17,vl);
 r.s18=qcp_cvt_active_sext8(a.s18,18,vl);
 r.s19=qcp_cvt_active_sext8(a.s19,19,vl);
 r.s20=qcp_cvt_active_sext8(a.s20,20,vl);
 r.s21=qcp_cvt_active_sext8(a.s21,21,vl);
 r.s22=qcp_cvt_active_sext8(a.s22,22,vl);
 r.s23=qcp_cvt_active_sext8(a.s23,23,vl);
 r.s24=qcp_cvt_active_sext8(a.s24,24,vl);
 r.s25=qcp_cvt_active_sext8(a.s25,25,vl);
 r.s26=qcp_cvt_active_sext8(a.s26,26,vl);
 r.s27=qcp_cvt_active_sext8(a.s27,27,vl);
 r.s28=qcp_cvt_active_sext8(a.s28,28,vl);
 r.s29=qcp_cvt_active_sext8(a.s29,29,vl);
 r.s30=qcp_cvt_active_sext8(a.s30,30,vl);
 r.s31=qcp_cvt_active_sext8(a.s31,31,vl);
 return r;
}
