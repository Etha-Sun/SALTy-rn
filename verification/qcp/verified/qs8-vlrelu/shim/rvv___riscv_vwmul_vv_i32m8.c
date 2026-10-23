#include "lrelu_rvv_vectors.h"
vint32m8_t __riscv_vwmul_vv_i32m8(vint16m4_t a,vint16m4_t b,size_t vl)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) (a8:Z) (a9:Z) (a10:Z) (a11:Z) (a12:Z) (a13:Z) (a14:Z) (a15:Z) (a16:Z) (a17:Z) (a18:Z) (a19:Z) (a20:Z) (a21:Z) (a22:Z) (a23:Z) (a24:Z) (a25:Z) (a26:Z) (a27:Z) (a28:Z) (a29:Z) (a30:Z) (a31:Z) (b0:Z) (b1:Z) (b2:Z) (b3:Z) (b4:Z) (b5:Z) (b6:Z) (b7:Z) (b8:Z) (b9:Z) (b10:Z) (b11:Z) (b12:Z) (b13:Z) (b14:Z) (b15:Z) (b16:Z) (b17:Z) (b18:Z) (b19:Z) (b20:Z) (b21:Z) (b22:Z) (b23:Z) (b24:Z) (b25:Z) (b26:Z) (b27:Z) (b28:Z) (b29:Z) (b30:Z) (b31:Z)
 Require 0<=vl && vl<=32 && -32768<=a0 && a0<=32767 && -32768<=a1 && a1<=32767 && -32768<=a2 && a2<=32767 && -32768<=a3 && a3<=32767 && -32768<=a4 && a4<=32767 && -32768<=a5 && a5<=32767 && -32768<=a6 && a6<=32767 && -32768<=a7 && a7<=32767 && -32768<=a8 && a8<=32767 && -32768<=a9 && a9<=32767 && -32768<=a10 && a10<=32767 && -32768<=a11 && a11<=32767 && -32768<=a12 && a12<=32767 && -32768<=a13 && a13<=32767 && -32768<=a14 && a14<=32767 && -32768<=a15 && a15<=32767 && -32768<=a16 && a16<=32767 && -32768<=a17 && a17<=32767 && -32768<=a18 && a18<=32767 && -32768<=a19 && a19<=32767 && -32768<=a20 && a20<=32767 && -32768<=a21 && a21<=32767 && -32768<=a22 && a22<=32767 && -32768<=a23 && a23<=32767 && -32768<=a24 && a24<=32767 && -32768<=a25 && a25<=32767 && -32768<=a26 && a26<=32767 && -32768<=a27 && a27<=32767 && -32768<=a28 && a28<=32767 && -32768<=a29 && a29<=32767 && -32768<=a30 && a30<=32767 && -32768<=a31 && a31<=32767 && -32768<=b0 && b0<=32767 && -32768<=b1 && b1<=32767 && -32768<=b2 && b2<=32767 && -32768<=b3 && b3<=32767 && -32768<=b4 && b4<=32767 && -32768<=b5 && b5<=32767 && -32768<=b6 && b6<=32767 && -32768<=b7 && b7<=32767 && -32768<=b8 && b8<=32767 && -32768<=b9 && b9<=32767 && -32768<=b10 && b10<=32767 && -32768<=b11 && b11<=32767 && -32768<=b12 && b12<=32767 && -32768<=b13 && b13<=32767 && -32768<=b14 && b14<=32767 && -32768<=b15 && b15<=32767 && -32768<=b16 && b16<=32767 && -32768<=b17 && b17<=32767 && -32768<=b18 && b18<=32767 && -32768<=b19 && b19<=32767 && -32768<=b20 && b20<=32767 && -32768<=b21 && b21<=32767 && -32768<=b22 && b22<=32767 && -32768<=b23 && b23<=32767 && -32768<=b24 && b24<=32767 && -32768<=b25 && b25<=32767 && -32768<=b26 && b26<=32767 && -32768<=b27 && b27<=32767 && -32768<=b28 && b28<=32767 && -32768<=b29 && b29<=32767 && -32768<=b30 && b30<=32767 && -32768<=b31 && b31<=32767 && store(&(a.s0),short,a0) * store(&(a.s1),short,a1) * store(&(a.s2),short,a2) * store(&(a.s3),short,a3) * store(&(a.s4),short,a4) * store(&(a.s5),short,a5) * store(&(a.s6),short,a6) * store(&(a.s7),short,a7) * store(&(a.s8),short,a8) * store(&(a.s9),short,a9) * store(&(a.s10),short,a10) * store(&(a.s11),short,a11) * store(&(a.s12),short,a12) * store(&(a.s13),short,a13) * store(&(a.s14),short,a14) * store(&(a.s15),short,a15) * store(&(a.s16),short,a16) * store(&(a.s17),short,a17) * store(&(a.s18),short,a18) * store(&(a.s19),short,a19) * store(&(a.s20),short,a20) * store(&(a.s21),short,a21) * store(&(a.s22),short,a22) * store(&(a.s23),short,a23) * store(&(a.s24),short,a24) * store(&(a.s25),short,a25) * store(&(a.s26),short,a26) * store(&(a.s27),short,a27) * store(&(a.s28),short,a28) * store(&(a.s29),short,a29) * store(&(a.s30),short,a30) * store(&(a.s31),short,a31) * store(&(b.s0),short,b0) * store(&(b.s1),short,b1) * store(&(b.s2),short,b2) * store(&(b.s3),short,b3) * store(&(b.s4),short,b4) * store(&(b.s5),short,b5) * store(&(b.s6),short,b6) * store(&(b.s7),short,b7) * store(&(b.s8),short,b8) * store(&(b.s9),short,b9) * store(&(b.s10),short,b10) * store(&(b.s11),short,b11) * store(&(b.s12),short,b12) * store(&(b.s13),short,b13) * store(&(b.s14),short,b14) * store(&(b.s15),short,b15) * store(&(b.s16),short,b16) * store(&(b.s17),short,b17) * store(&(b.s18),short,b18) * store(&(b.s19),short,b19) * store(&(b.s20),short,b20) * store(&(b.s21),short,b21) * store(&(b.s22),short,b22) * store(&(b.s23),short,b23) * store(&(b.s24),short,b24) * store(&(b.s25),short,b25) * store(&(b.s26),short,b26) * store(&(b.s27),short,b27) * store(&(b.s28),short,b28) * store(&(b.s29),short,b29) * store(&(b.s30),short,b30) * store(&(b.s31),short,b31)
 Ensure store(&(__return.s0),int,qcv_active_mul(0,vl,a0,b0)) * store(&(__return.s1),int,qcv_active_mul(1,vl,a1,b1)) * store(&(__return.s2),int,qcv_active_mul(2,vl,a2,b2)) * store(&(__return.s3),int,qcv_active_mul(3,vl,a3,b3)) * store(&(__return.s4),int,qcv_active_mul(4,vl,a4,b4)) * store(&(__return.s5),int,qcv_active_mul(5,vl,a5,b5)) * store(&(__return.s6),int,qcv_active_mul(6,vl,a6,b6)) * store(&(__return.s7),int,qcv_active_mul(7,vl,a7,b7)) * store(&(__return.s8),int,qcv_active_mul(8,vl,a8,b8)) * store(&(__return.s9),int,qcv_active_mul(9,vl,a9,b9)) * store(&(__return.s10),int,qcv_active_mul(10,vl,a10,b10)) * store(&(__return.s11),int,qcv_active_mul(11,vl,a11,b11)) * store(&(__return.s12),int,qcv_active_mul(12,vl,a12,b12)) * store(&(__return.s13),int,qcv_active_mul(13,vl,a13,b13)) * store(&(__return.s14),int,qcv_active_mul(14,vl,a14,b14)) * store(&(__return.s15),int,qcv_active_mul(15,vl,a15,b15)) * store(&(__return.s16),int,qcv_active_mul(16,vl,a16,b16)) * store(&(__return.s17),int,qcv_active_mul(17,vl,a17,b17)) * store(&(__return.s18),int,qcv_active_mul(18,vl,a18,b18)) * store(&(__return.s19),int,qcv_active_mul(19,vl,a19,b19)) * store(&(__return.s20),int,qcv_active_mul(20,vl,a20,b20)) * store(&(__return.s21),int,qcv_active_mul(21,vl,a21,b21)) * store(&(__return.s22),int,qcv_active_mul(22,vl,a22,b22)) * store(&(__return.s23),int,qcv_active_mul(23,vl,a23,b23)) * store(&(__return.s24),int,qcv_active_mul(24,vl,a24,b24)) * store(&(__return.s25),int,qcv_active_mul(25,vl,a25,b25)) * store(&(__return.s26),int,qcv_active_mul(26,vl,a26,b26)) * store(&(__return.s27),int,qcv_active_mul(27,vl,a27,b27)) * store(&(__return.s28),int,qcv_active_mul(28,vl,a28,b28)) * store(&(__return.s29),int,qcv_active_mul(29,vl,a29,b29)) * store(&(__return.s30),int,qcv_active_mul(30,vl,a30,b30)) * store(&(__return.s31),int,qcv_active_mul(31,vl,a31,b31)) */
{
 vint32m8_t r;
 r.s0=qcp_qcv_active_mul(a.s0,b.s0,0,vl);
 r.s1=qcp_qcv_active_mul(a.s1,b.s1,1,vl);
 r.s2=qcp_qcv_active_mul(a.s2,b.s2,2,vl);
 r.s3=qcp_qcv_active_mul(a.s3,b.s3,3,vl);
 r.s4=qcp_qcv_active_mul(a.s4,b.s4,4,vl);
 r.s5=qcp_qcv_active_mul(a.s5,b.s5,5,vl);
 r.s6=qcp_qcv_active_mul(a.s6,b.s6,6,vl);
 r.s7=qcp_qcv_active_mul(a.s7,b.s7,7,vl);
 r.s8=qcp_qcv_active_mul(a.s8,b.s8,8,vl);
 r.s9=qcp_qcv_active_mul(a.s9,b.s9,9,vl);
 r.s10=qcp_qcv_active_mul(a.s10,b.s10,10,vl);
 r.s11=qcp_qcv_active_mul(a.s11,b.s11,11,vl);
 r.s12=qcp_qcv_active_mul(a.s12,b.s12,12,vl);
 r.s13=qcp_qcv_active_mul(a.s13,b.s13,13,vl);
 r.s14=qcp_qcv_active_mul(a.s14,b.s14,14,vl);
 r.s15=qcp_qcv_active_mul(a.s15,b.s15,15,vl);
 r.s16=qcp_qcv_active_mul(a.s16,b.s16,16,vl);
 r.s17=qcp_qcv_active_mul(a.s17,b.s17,17,vl);
 r.s18=qcp_qcv_active_mul(a.s18,b.s18,18,vl);
 r.s19=qcp_qcv_active_mul(a.s19,b.s19,19,vl);
 r.s20=qcp_qcv_active_mul(a.s20,b.s20,20,vl);
 r.s21=qcp_qcv_active_mul(a.s21,b.s21,21,vl);
 r.s22=qcp_qcv_active_mul(a.s22,b.s22,22,vl);
 r.s23=qcp_qcv_active_mul(a.s23,b.s23,23,vl);
 r.s24=qcp_qcv_active_mul(a.s24,b.s24,24,vl);
 r.s25=qcp_qcv_active_mul(a.s25,b.s25,25,vl);
 r.s26=qcp_qcv_active_mul(a.s26,b.s26,26,vl);
 r.s27=qcp_qcv_active_mul(a.s27,b.s27,27,vl);
 r.s28=qcp_qcv_active_mul(a.s28,b.s28,28,vl);
 r.s29=qcp_qcv_active_mul(a.s29,b.s29,29,vl);
 r.s30=qcp_qcv_active_mul(a.s30,b.s30,30,vl);
 r.s31=qcp_qcv_active_mul(a.s31,b.s31,31,vl);
 return r;
}
