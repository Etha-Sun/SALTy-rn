#include "rvv_arithmetic.h"
vint8m2_t __riscv_vnclip_wx_i8m2(vint16m4_t a,unsigned int s,int mode,size_t vl)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) (a8:Z) (a9:Z) (a10:Z) (a11:Z) (a12:Z) (a13:Z) (a14:Z) (a15:Z) (a16:Z) (a17:Z) (a18:Z) (a19:Z) (a20:Z) (a21:Z) (a22:Z) (a23:Z) (a24:Z) (a25:Z) (a26:Z) (a27:Z) (a28:Z) (a29:Z) (a30:Z) (a31:Z)
 Require 0<=vl && vl<=32 && -32768<=a0 && a0<=32767 && -32768<=a1 && a1<=32767 && -32768<=a2 && a2<=32767 && -32768<=a3 && a3<=32767 && -32768<=a4 && a4<=32767 && -32768<=a5 && a5<=32767 && -32768<=a6 && a6<=32767 && -32768<=a7 && a7<=32767 && -32768<=a8 && a8<=32767 && -32768<=a9 && a9<=32767 && -32768<=a10 && a10<=32767 && -32768<=a11 && a11<=32767 && -32768<=a12 && a12<=32767 && -32768<=a13 && a13<=32767 && -32768<=a14 && a14<=32767 && -32768<=a15 && a15<=32767 && -32768<=a16 && a16<=32767 && -32768<=a17 && a17<=32767 && -32768<=a18 && a18<=32767 && -32768<=a19 && a19<=32767 && -32768<=a20 && a20<=32767 && -32768<=a21 && a21<=32767 && -32768<=a22 && a22<=32767 && -32768<=a23 && a23<=32767 && -32768<=a24 && a24<=32767 && -32768<=a25 && a25<=32767 && -32768<=a26 && a26<=32767 && -32768<=a27 && a27<=32767 && -32768<=a28 && a28<=32767 && -32768<=a29 && a29<=32767 && -32768<=a30 && a30<=32767 && -32768<=a31 && a31<=32767 && s==0 && mode==2 && store(&(a.s0),short,a0) * store(&(a.s1),short,a1) * store(&(a.s2),short,a2) * store(&(a.s3),short,a3) * store(&(a.s4),short,a4) * store(&(a.s5),short,a5) * store(&(a.s6),short,a6) * store(&(a.s7),short,a7) * store(&(a.s8),short,a8) * store(&(a.s9),short,a9) * store(&(a.s10),short,a10) * store(&(a.s11),short,a11) * store(&(a.s12),short,a12) * store(&(a.s13),short,a13) * store(&(a.s14),short,a14) * store(&(a.s15),short,a15) * store(&(a.s16),short,a16) * store(&(a.s17),short,a17) * store(&(a.s18),short,a18) * store(&(a.s19),short,a19) * store(&(a.s20),short,a20) * store(&(a.s21),short,a21) * store(&(a.s22),short,a22) * store(&(a.s23),short,a23) * store(&(a.s24),short,a24) * store(&(a.s25),short,a25) * store(&(a.s26),short,a26) * store(&(a.s27),short,a27) * store(&(a.s28),short,a28) * store(&(a.s29),short,a29) * store(&(a.s30),short,a30) * store(&(a.s31),short,a31)
 Ensure store(&(__return.s0),char,qcv_active_clip8(0,vl,a0)) * store(&(__return.s1),char,qcv_active_clip8(1,vl,a1)) * store(&(__return.s2),char,qcv_active_clip8(2,vl,a2)) * store(&(__return.s3),char,qcv_active_clip8(3,vl,a3)) * store(&(__return.s4),char,qcv_active_clip8(4,vl,a4)) * store(&(__return.s5),char,qcv_active_clip8(5,vl,a5)) * store(&(__return.s6),char,qcv_active_clip8(6,vl,a6)) * store(&(__return.s7),char,qcv_active_clip8(7,vl,a7)) * store(&(__return.s8),char,qcv_active_clip8(8,vl,a8)) * store(&(__return.s9),char,qcv_active_clip8(9,vl,a9)) * store(&(__return.s10),char,qcv_active_clip8(10,vl,a10)) * store(&(__return.s11),char,qcv_active_clip8(11,vl,a11)) * store(&(__return.s12),char,qcv_active_clip8(12,vl,a12)) * store(&(__return.s13),char,qcv_active_clip8(13,vl,a13)) * store(&(__return.s14),char,qcv_active_clip8(14,vl,a14)) * store(&(__return.s15),char,qcv_active_clip8(15,vl,a15)) * store(&(__return.s16),char,qcv_active_clip8(16,vl,a16)) * store(&(__return.s17),char,qcv_active_clip8(17,vl,a17)) * store(&(__return.s18),char,qcv_active_clip8(18,vl,a18)) * store(&(__return.s19),char,qcv_active_clip8(19,vl,a19)) * store(&(__return.s20),char,qcv_active_clip8(20,vl,a20)) * store(&(__return.s21),char,qcv_active_clip8(21,vl,a21)) * store(&(__return.s22),char,qcv_active_clip8(22,vl,a22)) * store(&(__return.s23),char,qcv_active_clip8(23,vl,a23)) * store(&(__return.s24),char,qcv_active_clip8(24,vl,a24)) * store(&(__return.s25),char,qcv_active_clip8(25,vl,a25)) * store(&(__return.s26),char,qcv_active_clip8(26,vl,a26)) * store(&(__return.s27),char,qcv_active_clip8(27,vl,a27)) * store(&(__return.s28),char,qcv_active_clip8(28,vl,a28)) * store(&(__return.s29),char,qcv_active_clip8(29,vl,a29)) * store(&(__return.s30),char,qcv_active_clip8(30,vl,a30)) * store(&(__return.s31),char,qcv_active_clip8(31,vl,a31)) */
{
 vint8m2_t r;
 r.s0=qcp_qcv_active_clip8(a.s0,0,vl);
 r.s1=qcp_qcv_active_clip8(a.s1,1,vl);
 r.s2=qcp_qcv_active_clip8(a.s2,2,vl);
 r.s3=qcp_qcv_active_clip8(a.s3,3,vl);
 r.s4=qcp_qcv_active_clip8(a.s4,4,vl);
 r.s5=qcp_qcv_active_clip8(a.s5,5,vl);
 r.s6=qcp_qcv_active_clip8(a.s6,6,vl);
 r.s7=qcp_qcv_active_clip8(a.s7,7,vl);
 r.s8=qcp_qcv_active_clip8(a.s8,8,vl);
 r.s9=qcp_qcv_active_clip8(a.s9,9,vl);
 r.s10=qcp_qcv_active_clip8(a.s10,10,vl);
 r.s11=qcp_qcv_active_clip8(a.s11,11,vl);
 r.s12=qcp_qcv_active_clip8(a.s12,12,vl);
 r.s13=qcp_qcv_active_clip8(a.s13,13,vl);
 r.s14=qcp_qcv_active_clip8(a.s14,14,vl);
 r.s15=qcp_qcv_active_clip8(a.s15,15,vl);
 r.s16=qcp_qcv_active_clip8(a.s16,16,vl);
 r.s17=qcp_qcv_active_clip8(a.s17,17,vl);
 r.s18=qcp_qcv_active_clip8(a.s18,18,vl);
 r.s19=qcp_qcv_active_clip8(a.s19,19,vl);
 r.s20=qcp_qcv_active_clip8(a.s20,20,vl);
 r.s21=qcp_qcv_active_clip8(a.s21,21,vl);
 r.s22=qcp_qcv_active_clip8(a.s22,22,vl);
 r.s23=qcp_qcv_active_clip8(a.s23,23,vl);
 r.s24=qcp_qcv_active_clip8(a.s24,24,vl);
 r.s25=qcp_qcv_active_clip8(a.s25,25,vl);
 r.s26=qcp_qcv_active_clip8(a.s26,26,vl);
 r.s27=qcp_qcv_active_clip8(a.s27,27,vl);
 r.s28=qcp_qcv_active_clip8(a.s28,28,vl);
 r.s29=qcp_qcv_active_clip8(a.s29,29,vl);
 r.s30=qcp_qcv_active_clip8(a.s30,30,vl);
 r.s31=qcp_qcv_active_clip8(a.s31,31,vl);
 return r;
}
