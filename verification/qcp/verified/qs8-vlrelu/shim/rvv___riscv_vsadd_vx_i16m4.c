#include "rvv_arithmetic.h"
vint16m4_t __riscv_vsadd_vx_i16m4(vint16m4_t a,int16_t b,size_t vl)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) (a8:Z) (a9:Z) (a10:Z) (a11:Z) (a12:Z) (a13:Z) (a14:Z) (a15:Z) (a16:Z) (a17:Z) (a18:Z) (a19:Z) (a20:Z) (a21:Z) (a22:Z) (a23:Z) (a24:Z) (a25:Z) (a26:Z) (a27:Z) (a28:Z) (a29:Z) (a30:Z) (a31:Z)
 Require 0<=vl && vl<=32 && -32768<=a0 && a0<=32767 && -32768<=a1 && a1<=32767 && -32768<=a2 && a2<=32767 && -32768<=a3 && a3<=32767 && -32768<=a4 && a4<=32767 && -32768<=a5 && a5<=32767 && -32768<=a6 && a6<=32767 && -32768<=a7 && a7<=32767 && -32768<=a8 && a8<=32767 && -32768<=a9 && a9<=32767 && -32768<=a10 && a10<=32767 && -32768<=a11 && a11<=32767 && -32768<=a12 && a12<=32767 && -32768<=a13 && a13<=32767 && -32768<=a14 && a14<=32767 && -32768<=a15 && a15<=32767 && -32768<=a16 && a16<=32767 && -32768<=a17 && a17<=32767 && -32768<=a18 && a18<=32767 && -32768<=a19 && a19<=32767 && -32768<=a20 && a20<=32767 && -32768<=a21 && a21<=32767 && -32768<=a22 && a22<=32767 && -32768<=a23 && a23<=32767 && -32768<=a24 && a24<=32767 && -32768<=a25 && a25<=32767 && -32768<=a26 && a26<=32767 && -32768<=a27 && a27<=32767 && -32768<=a28 && a28<=32767 && -32768<=a29 && a29<=32767 && -32768<=a30 && a30<=32767 && -32768<=a31 && a31<=32767 && -32768<=b && b<=32767 && store(&(a.s0),short,a0) * store(&(a.s1),short,a1) * store(&(a.s2),short,a2) * store(&(a.s3),short,a3) * store(&(a.s4),short,a4) * store(&(a.s5),short,a5) * store(&(a.s6),short,a6) * store(&(a.s7),short,a7) * store(&(a.s8),short,a8) * store(&(a.s9),short,a9) * store(&(a.s10),short,a10) * store(&(a.s11),short,a11) * store(&(a.s12),short,a12) * store(&(a.s13),short,a13) * store(&(a.s14),short,a14) * store(&(a.s15),short,a15) * store(&(a.s16),short,a16) * store(&(a.s17),short,a17) * store(&(a.s18),short,a18) * store(&(a.s19),short,a19) * store(&(a.s20),short,a20) * store(&(a.s21),short,a21) * store(&(a.s22),short,a22) * store(&(a.s23),short,a23) * store(&(a.s24),short,a24) * store(&(a.s25),short,a25) * store(&(a.s26),short,a26) * store(&(a.s27),short,a27) * store(&(a.s28),short,a28) * store(&(a.s29),short,a29) * store(&(a.s30),short,a30) * store(&(a.s31),short,a31)
 Ensure store(&(__return.s0),short,qcv_active_add(0,vl,a0,b)) * store(&(__return.s1),short,qcv_active_add(1,vl,a1,b)) * store(&(__return.s2),short,qcv_active_add(2,vl,a2,b)) * store(&(__return.s3),short,qcv_active_add(3,vl,a3,b)) * store(&(__return.s4),short,qcv_active_add(4,vl,a4,b)) * store(&(__return.s5),short,qcv_active_add(5,vl,a5,b)) * store(&(__return.s6),short,qcv_active_add(6,vl,a6,b)) * store(&(__return.s7),short,qcv_active_add(7,vl,a7,b)) * store(&(__return.s8),short,qcv_active_add(8,vl,a8,b)) * store(&(__return.s9),short,qcv_active_add(9,vl,a9,b)) * store(&(__return.s10),short,qcv_active_add(10,vl,a10,b)) * store(&(__return.s11),short,qcv_active_add(11,vl,a11,b)) * store(&(__return.s12),short,qcv_active_add(12,vl,a12,b)) * store(&(__return.s13),short,qcv_active_add(13,vl,a13,b)) * store(&(__return.s14),short,qcv_active_add(14,vl,a14,b)) * store(&(__return.s15),short,qcv_active_add(15,vl,a15,b)) * store(&(__return.s16),short,qcv_active_add(16,vl,a16,b)) * store(&(__return.s17),short,qcv_active_add(17,vl,a17,b)) * store(&(__return.s18),short,qcv_active_add(18,vl,a18,b)) * store(&(__return.s19),short,qcv_active_add(19,vl,a19,b)) * store(&(__return.s20),short,qcv_active_add(20,vl,a20,b)) * store(&(__return.s21),short,qcv_active_add(21,vl,a21,b)) * store(&(__return.s22),short,qcv_active_add(22,vl,a22,b)) * store(&(__return.s23),short,qcv_active_add(23,vl,a23,b)) * store(&(__return.s24),short,qcv_active_add(24,vl,a24,b)) * store(&(__return.s25),short,qcv_active_add(25,vl,a25,b)) * store(&(__return.s26),short,qcv_active_add(26,vl,a26,b)) * store(&(__return.s27),short,qcv_active_add(27,vl,a27,b)) * store(&(__return.s28),short,qcv_active_add(28,vl,a28,b)) * store(&(__return.s29),short,qcv_active_add(29,vl,a29,b)) * store(&(__return.s30),short,qcv_active_add(30,vl,a30,b)) * store(&(__return.s31),short,qcv_active_add(31,vl,a31,b)) */
{
 vint16m4_t r;
 r.s0=qcp_qcv_active_add(a.s0,b,0,vl);
 r.s1=qcp_qcv_active_add(a.s1,b,1,vl);
 r.s2=qcp_qcv_active_add(a.s2,b,2,vl);
 r.s3=qcp_qcv_active_add(a.s3,b,3,vl);
 r.s4=qcp_qcv_active_add(a.s4,b,4,vl);
 r.s5=qcp_qcv_active_add(a.s5,b,5,vl);
 r.s6=qcp_qcv_active_add(a.s6,b,6,vl);
 r.s7=qcp_qcv_active_add(a.s7,b,7,vl);
 r.s8=qcp_qcv_active_add(a.s8,b,8,vl);
 r.s9=qcp_qcv_active_add(a.s9,b,9,vl);
 r.s10=qcp_qcv_active_add(a.s10,b,10,vl);
 r.s11=qcp_qcv_active_add(a.s11,b,11,vl);
 r.s12=qcp_qcv_active_add(a.s12,b,12,vl);
 r.s13=qcp_qcv_active_add(a.s13,b,13,vl);
 r.s14=qcp_qcv_active_add(a.s14,b,14,vl);
 r.s15=qcp_qcv_active_add(a.s15,b,15,vl);
 r.s16=qcp_qcv_active_add(a.s16,b,16,vl);
 r.s17=qcp_qcv_active_add(a.s17,b,17,vl);
 r.s18=qcp_qcv_active_add(a.s18,b,18,vl);
 r.s19=qcp_qcv_active_add(a.s19,b,19,vl);
 r.s20=qcp_qcv_active_add(a.s20,b,20,vl);
 r.s21=qcp_qcv_active_add(a.s21,b,21,vl);
 r.s22=qcp_qcv_active_add(a.s22,b,22,vl);
 r.s23=qcp_qcv_active_add(a.s23,b,23,vl);
 r.s24=qcp_qcv_active_add(a.s24,b,24,vl);
 r.s25=qcp_qcv_active_add(a.s25,b,25,vl);
 r.s26=qcp_qcv_active_add(a.s26,b,26,vl);
 r.s27=qcp_qcv_active_add(a.s27,b,27,vl);
 r.s28=qcp_qcv_active_add(a.s28,b,28,vl);
 r.s29=qcp_qcv_active_add(a.s29,b,29,vl);
 r.s30=qcp_qcv_active_add(a.s30,b,30,vl);
 r.s31=qcp_qcv_active_add(a.s31,b,31,vl);
 return r;
}
