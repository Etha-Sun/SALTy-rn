#include "rvv_arithmetic.h"
vint32m8_t __riscv_vmacc_vx_i32m8(vint32m8_t a,int32_t b,vint32m8_t c,size_t vl)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) (a8:Z) (a9:Z) (a10:Z) (a11:Z) (a12:Z) (a13:Z) (a14:Z) (a15:Z) (a16:Z) (a17:Z) (a18:Z) (a19:Z) (a20:Z) (a21:Z) (a22:Z) (a23:Z) (a24:Z) (a25:Z) (a26:Z) (a27:Z) (a28:Z) (a29:Z) (a30:Z) (a31:Z) (c0:Z) (c1:Z) (c2:Z) (c3:Z) (c4:Z) (c5:Z) (c6:Z) (c7:Z) (c8:Z) (c9:Z) (c10:Z) (c11:Z) (c12:Z) (c13:Z) (c14:Z) (c15:Z) (c16:Z) (c17:Z) (c18:Z) (c19:Z) (c20:Z) (c21:Z) (c22:Z) (c23:Z) (c24:Z) (c25:Z) (c26:Z) (c27:Z) (c28:Z) (c29:Z) (c30:Z) (c31:Z)
 Require 0<=vl && vl<=32 && -2147483648<=a0 && a0<=2147483647 && -2147483648<=a1 && a1<=2147483647 && -2147483648<=a2 && a2<=2147483647 && -2147483648<=a3 && a3<=2147483647 && -2147483648<=a4 && a4<=2147483647 && -2147483648<=a5 && a5<=2147483647 && -2147483648<=a6 && a6<=2147483647 && -2147483648<=a7 && a7<=2147483647 && -2147483648<=a8 && a8<=2147483647 && -2147483648<=a9 && a9<=2147483647 && -2147483648<=a10 && a10<=2147483647 && -2147483648<=a11 && a11<=2147483647 && -2147483648<=a12 && a12<=2147483647 && -2147483648<=a13 && a13<=2147483647 && -2147483648<=a14 && a14<=2147483647 && -2147483648<=a15 && a15<=2147483647 && -2147483648<=a16 && a16<=2147483647 && -2147483648<=a17 && a17<=2147483647 && -2147483648<=a18 && a18<=2147483647 && -2147483648<=a19 && a19<=2147483647 && -2147483648<=a20 && a20<=2147483647 && -2147483648<=a21 && a21<=2147483647 && -2147483648<=a22 && a22<=2147483647 && -2147483648<=a23 && a23<=2147483647 && -2147483648<=a24 && a24<=2147483647 && -2147483648<=a25 && a25<=2147483647 && -2147483648<=a26 && a26<=2147483647 && -2147483648<=a27 && a27<=2147483647 && -2147483648<=a28 && a28<=2147483647 && -2147483648<=a29 && a29<=2147483647 && -2147483648<=a30 && a30<=2147483647 && -2147483648<=a31 && a31<=2147483647 && -2147483648<=b && b<=2147483647 && -2147483648<=c0 && c0<=2147483647 && -2147483648<=c1 && c1<=2147483647 && -2147483648<=c2 && c2<=2147483647 && -2147483648<=c3 && c3<=2147483647 && -2147483648<=c4 && c4<=2147483647 && -2147483648<=c5 && c5<=2147483647 && -2147483648<=c6 && c6<=2147483647 && -2147483648<=c7 && c7<=2147483647 && -2147483648<=c8 && c8<=2147483647 && -2147483648<=c9 && c9<=2147483647 && -2147483648<=c10 && c10<=2147483647 && -2147483648<=c11 && c11<=2147483647 && -2147483648<=c12 && c12<=2147483647 && -2147483648<=c13 && c13<=2147483647 && -2147483648<=c14 && c14<=2147483647 && -2147483648<=c15 && c15<=2147483647 && -2147483648<=c16 && c16<=2147483647 && -2147483648<=c17 && c17<=2147483647 && -2147483648<=c18 && c18<=2147483647 && -2147483648<=c19 && c19<=2147483647 && -2147483648<=c20 && c20<=2147483647 && -2147483648<=c21 && c21<=2147483647 && -2147483648<=c22 && c22<=2147483647 && -2147483648<=c23 && c23<=2147483647 && -2147483648<=c24 && c24<=2147483647 && -2147483648<=c25 && c25<=2147483647 && -2147483648<=c26 && c26<=2147483647 && -2147483648<=c27 && c27<=2147483647 && -2147483648<=c28 && c28<=2147483647 && -2147483648<=c29 && c29<=2147483647 && -2147483648<=c30 && c30<=2147483647 && -2147483648<=c31 && c31<=2147483647 && store(&(a.s0),int,a0) * store(&(a.s1),int,a1) * store(&(a.s2),int,a2) * store(&(a.s3),int,a3) * store(&(a.s4),int,a4) * store(&(a.s5),int,a5) * store(&(a.s6),int,a6) * store(&(a.s7),int,a7) * store(&(a.s8),int,a8) * store(&(a.s9),int,a9) * store(&(a.s10),int,a10) * store(&(a.s11),int,a11) * store(&(a.s12),int,a12) * store(&(a.s13),int,a13) * store(&(a.s14),int,a14) * store(&(a.s15),int,a15) * store(&(a.s16),int,a16) * store(&(a.s17),int,a17) * store(&(a.s18),int,a18) * store(&(a.s19),int,a19) * store(&(a.s20),int,a20) * store(&(a.s21),int,a21) * store(&(a.s22),int,a22) * store(&(a.s23),int,a23) * store(&(a.s24),int,a24) * store(&(a.s25),int,a25) * store(&(a.s26),int,a26) * store(&(a.s27),int,a27) * store(&(a.s28),int,a28) * store(&(a.s29),int,a29) * store(&(a.s30),int,a30) * store(&(a.s31),int,a31) * store(&(c.s0),int,c0) * store(&(c.s1),int,c1) * store(&(c.s2),int,c2) * store(&(c.s3),int,c3) * store(&(c.s4),int,c4) * store(&(c.s5),int,c5) * store(&(c.s6),int,c6) * store(&(c.s7),int,c7) * store(&(c.s8),int,c8) * store(&(c.s9),int,c9) * store(&(c.s10),int,c10) * store(&(c.s11),int,c11) * store(&(c.s12),int,c12) * store(&(c.s13),int,c13) * store(&(c.s14),int,c14) * store(&(c.s15),int,c15) * store(&(c.s16),int,c16) * store(&(c.s17),int,c17) * store(&(c.s18),int,c18) * store(&(c.s19),int,c19) * store(&(c.s20),int,c20) * store(&(c.s21),int,c21) * store(&(c.s22),int,c22) * store(&(c.s23),int,c23) * store(&(c.s24),int,c24) * store(&(c.s25),int,c25) * store(&(c.s26),int,c26) * store(&(c.s27),int,c27) * store(&(c.s28),int,c28) * store(&(c.s29),int,c29) * store(&(c.s30),int,c30) * store(&(c.s31),int,c31)
 Ensure store(&(__return.s0),int,qa_active_macc(0,vl,a0,c0,b)) * store(&(__return.s1),int,qa_active_macc(1,vl,a1,c1,b)) * store(&(__return.s2),int,qa_active_macc(2,vl,a2,c2,b)) * store(&(__return.s3),int,qa_active_macc(3,vl,a3,c3,b)) * store(&(__return.s4),int,qa_active_macc(4,vl,a4,c4,b)) * store(&(__return.s5),int,qa_active_macc(5,vl,a5,c5,b)) * store(&(__return.s6),int,qa_active_macc(6,vl,a6,c6,b)) * store(&(__return.s7),int,qa_active_macc(7,vl,a7,c7,b)) * store(&(__return.s8),int,qa_active_macc(8,vl,a8,c8,b)) * store(&(__return.s9),int,qa_active_macc(9,vl,a9,c9,b)) * store(&(__return.s10),int,qa_active_macc(10,vl,a10,c10,b)) * store(&(__return.s11),int,qa_active_macc(11,vl,a11,c11,b)) * store(&(__return.s12),int,qa_active_macc(12,vl,a12,c12,b)) * store(&(__return.s13),int,qa_active_macc(13,vl,a13,c13,b)) * store(&(__return.s14),int,qa_active_macc(14,vl,a14,c14,b)) * store(&(__return.s15),int,qa_active_macc(15,vl,a15,c15,b)) * store(&(__return.s16),int,qa_active_macc(16,vl,a16,c16,b)) * store(&(__return.s17),int,qa_active_macc(17,vl,a17,c17,b)) * store(&(__return.s18),int,qa_active_macc(18,vl,a18,c18,b)) * store(&(__return.s19),int,qa_active_macc(19,vl,a19,c19,b)) * store(&(__return.s20),int,qa_active_macc(20,vl,a20,c20,b)) * store(&(__return.s21),int,qa_active_macc(21,vl,a21,c21,b)) * store(&(__return.s22),int,qa_active_macc(22,vl,a22,c22,b)) * store(&(__return.s23),int,qa_active_macc(23,vl,a23,c23,b)) * store(&(__return.s24),int,qa_active_macc(24,vl,a24,c24,b)) * store(&(__return.s25),int,qa_active_macc(25,vl,a25,c25,b)) * store(&(__return.s26),int,qa_active_macc(26,vl,a26,c26,b)) * store(&(__return.s27),int,qa_active_macc(27,vl,a27,c27,b)) * store(&(__return.s28),int,qa_active_macc(28,vl,a28,c28,b)) * store(&(__return.s29),int,qa_active_macc(29,vl,a29,c29,b)) * store(&(__return.s30),int,qa_active_macc(30,vl,a30,c30,b)) * store(&(__return.s31),int,qa_active_macc(31,vl,a31,c31,b)) */
{
 vint32m8_t r;
 r.s0=qcp_qa_active_macc(a.s0,c.s0,b,0,vl);
 r.s1=qcp_qa_active_macc(a.s1,c.s1,b,1,vl);
 r.s2=qcp_qa_active_macc(a.s2,c.s2,b,2,vl);
 r.s3=qcp_qa_active_macc(a.s3,c.s3,b,3,vl);
 r.s4=qcp_qa_active_macc(a.s4,c.s4,b,4,vl);
 r.s5=qcp_qa_active_macc(a.s5,c.s5,b,5,vl);
 r.s6=qcp_qa_active_macc(a.s6,c.s6,b,6,vl);
 r.s7=qcp_qa_active_macc(a.s7,c.s7,b,7,vl);
 r.s8=qcp_qa_active_macc(a.s8,c.s8,b,8,vl);
 r.s9=qcp_qa_active_macc(a.s9,c.s9,b,9,vl);
 r.s10=qcp_qa_active_macc(a.s10,c.s10,b,10,vl);
 r.s11=qcp_qa_active_macc(a.s11,c.s11,b,11,vl);
 r.s12=qcp_qa_active_macc(a.s12,c.s12,b,12,vl);
 r.s13=qcp_qa_active_macc(a.s13,c.s13,b,13,vl);
 r.s14=qcp_qa_active_macc(a.s14,c.s14,b,14,vl);
 r.s15=qcp_qa_active_macc(a.s15,c.s15,b,15,vl);
 r.s16=qcp_qa_active_macc(a.s16,c.s16,b,16,vl);
 r.s17=qcp_qa_active_macc(a.s17,c.s17,b,17,vl);
 r.s18=qcp_qa_active_macc(a.s18,c.s18,b,18,vl);
 r.s19=qcp_qa_active_macc(a.s19,c.s19,b,19,vl);
 r.s20=qcp_qa_active_macc(a.s20,c.s20,b,20,vl);
 r.s21=qcp_qa_active_macc(a.s21,c.s21,b,21,vl);
 r.s22=qcp_qa_active_macc(a.s22,c.s22,b,22,vl);
 r.s23=qcp_qa_active_macc(a.s23,c.s23,b,23,vl);
 r.s24=qcp_qa_active_macc(a.s24,c.s24,b,24,vl);
 r.s25=qcp_qa_active_macc(a.s25,c.s25,b,25,vl);
 r.s26=qcp_qa_active_macc(a.s26,c.s26,b,26,vl);
 r.s27=qcp_qa_active_macc(a.s27,c.s27,b,27,vl);
 r.s28=qcp_qa_active_macc(a.s28,c.s28,b,28,vl);
 r.s29=qcp_qa_active_macc(a.s29,c.s29,b,29,vl);
 r.s30=qcp_qa_active_macc(a.s30,c.s30,b,30,vl);
 r.s31=qcp_qa_active_macc(a.s31,c.s31,b,31,vl);
 return r;
}
