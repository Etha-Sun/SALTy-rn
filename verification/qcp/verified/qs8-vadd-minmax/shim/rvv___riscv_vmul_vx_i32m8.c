#include "rvv_arithmetic.h"
vint32m8_t __riscv_vmul_vx_i32m8(vint32m8_t a,int32_t b,size_t vl)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) (a8:Z) (a9:Z) (a10:Z) (a11:Z) (a12:Z) (a13:Z) (a14:Z) (a15:Z) (a16:Z) (a17:Z) (a18:Z) (a19:Z) (a20:Z) (a21:Z) (a22:Z) (a23:Z) (a24:Z) (a25:Z) (a26:Z) (a27:Z) (a28:Z) (a29:Z) (a30:Z) (a31:Z)
 Require 0<=vl && vl<=32 && -2147483648<=a0 && a0<=2147483647 && -2147483648<=a1 && a1<=2147483647 && -2147483648<=a2 && a2<=2147483647 && -2147483648<=a3 && a3<=2147483647 && -2147483648<=a4 && a4<=2147483647 && -2147483648<=a5 && a5<=2147483647 && -2147483648<=a6 && a6<=2147483647 && -2147483648<=a7 && a7<=2147483647 && -2147483648<=a8 && a8<=2147483647 && -2147483648<=a9 && a9<=2147483647 && -2147483648<=a10 && a10<=2147483647 && -2147483648<=a11 && a11<=2147483647 && -2147483648<=a12 && a12<=2147483647 && -2147483648<=a13 && a13<=2147483647 && -2147483648<=a14 && a14<=2147483647 && -2147483648<=a15 && a15<=2147483647 && -2147483648<=a16 && a16<=2147483647 && -2147483648<=a17 && a17<=2147483647 && -2147483648<=a18 && a18<=2147483647 && -2147483648<=a19 && a19<=2147483647 && -2147483648<=a20 && a20<=2147483647 && -2147483648<=a21 && a21<=2147483647 && -2147483648<=a22 && a22<=2147483647 && -2147483648<=a23 && a23<=2147483647 && -2147483648<=a24 && a24<=2147483647 && -2147483648<=a25 && a25<=2147483647 && -2147483648<=a26 && a26<=2147483647 && -2147483648<=a27 && a27<=2147483647 && -2147483648<=a28 && a28<=2147483647 && -2147483648<=a29 && a29<=2147483647 && -2147483648<=a30 && a30<=2147483647 && -2147483648<=a31 && a31<=2147483647 && -2147483648<=b && b<=2147483647 && store(&(a.s0),int,a0) * store(&(a.s1),int,a1) * store(&(a.s2),int,a2) * store(&(a.s3),int,a3) * store(&(a.s4),int,a4) * store(&(a.s5),int,a5) * store(&(a.s6),int,a6) * store(&(a.s7),int,a7) * store(&(a.s8),int,a8) * store(&(a.s9),int,a9) * store(&(a.s10),int,a10) * store(&(a.s11),int,a11) * store(&(a.s12),int,a12) * store(&(a.s13),int,a13) * store(&(a.s14),int,a14) * store(&(a.s15),int,a15) * store(&(a.s16),int,a16) * store(&(a.s17),int,a17) * store(&(a.s18),int,a18) * store(&(a.s19),int,a19) * store(&(a.s20),int,a20) * store(&(a.s21),int,a21) * store(&(a.s22),int,a22) * store(&(a.s23),int,a23) * store(&(a.s24),int,a24) * store(&(a.s25),int,a25) * store(&(a.s26),int,a26) * store(&(a.s27),int,a27) * store(&(a.s28),int,a28) * store(&(a.s29),int,a29) * store(&(a.s30),int,a30) * store(&(a.s31),int,a31)
 Ensure store(&(__return.s0),int,qa_active_mul(0,vl,a0,b)) * store(&(__return.s1),int,qa_active_mul(1,vl,a1,b)) * store(&(__return.s2),int,qa_active_mul(2,vl,a2,b)) * store(&(__return.s3),int,qa_active_mul(3,vl,a3,b)) * store(&(__return.s4),int,qa_active_mul(4,vl,a4,b)) * store(&(__return.s5),int,qa_active_mul(5,vl,a5,b)) * store(&(__return.s6),int,qa_active_mul(6,vl,a6,b)) * store(&(__return.s7),int,qa_active_mul(7,vl,a7,b)) * store(&(__return.s8),int,qa_active_mul(8,vl,a8,b)) * store(&(__return.s9),int,qa_active_mul(9,vl,a9,b)) * store(&(__return.s10),int,qa_active_mul(10,vl,a10,b)) * store(&(__return.s11),int,qa_active_mul(11,vl,a11,b)) * store(&(__return.s12),int,qa_active_mul(12,vl,a12,b)) * store(&(__return.s13),int,qa_active_mul(13,vl,a13,b)) * store(&(__return.s14),int,qa_active_mul(14,vl,a14,b)) * store(&(__return.s15),int,qa_active_mul(15,vl,a15,b)) * store(&(__return.s16),int,qa_active_mul(16,vl,a16,b)) * store(&(__return.s17),int,qa_active_mul(17,vl,a17,b)) * store(&(__return.s18),int,qa_active_mul(18,vl,a18,b)) * store(&(__return.s19),int,qa_active_mul(19,vl,a19,b)) * store(&(__return.s20),int,qa_active_mul(20,vl,a20,b)) * store(&(__return.s21),int,qa_active_mul(21,vl,a21,b)) * store(&(__return.s22),int,qa_active_mul(22,vl,a22,b)) * store(&(__return.s23),int,qa_active_mul(23,vl,a23,b)) * store(&(__return.s24),int,qa_active_mul(24,vl,a24,b)) * store(&(__return.s25),int,qa_active_mul(25,vl,a25,b)) * store(&(__return.s26),int,qa_active_mul(26,vl,a26,b)) * store(&(__return.s27),int,qa_active_mul(27,vl,a27,b)) * store(&(__return.s28),int,qa_active_mul(28,vl,a28,b)) * store(&(__return.s29),int,qa_active_mul(29,vl,a29,b)) * store(&(__return.s30),int,qa_active_mul(30,vl,a30,b)) * store(&(__return.s31),int,qa_active_mul(31,vl,a31,b)) */
{
 vint32m8_t r;
 r.s0=qcp_qa_active_mul(a.s0,b,0,vl);
 r.s1=qcp_qa_active_mul(a.s1,b,1,vl);
 r.s2=qcp_qa_active_mul(a.s2,b,2,vl);
 r.s3=qcp_qa_active_mul(a.s3,b,3,vl);
 r.s4=qcp_qa_active_mul(a.s4,b,4,vl);
 r.s5=qcp_qa_active_mul(a.s5,b,5,vl);
 r.s6=qcp_qa_active_mul(a.s6,b,6,vl);
 r.s7=qcp_qa_active_mul(a.s7,b,7,vl);
 r.s8=qcp_qa_active_mul(a.s8,b,8,vl);
 r.s9=qcp_qa_active_mul(a.s9,b,9,vl);
 r.s10=qcp_qa_active_mul(a.s10,b,10,vl);
 r.s11=qcp_qa_active_mul(a.s11,b,11,vl);
 r.s12=qcp_qa_active_mul(a.s12,b,12,vl);
 r.s13=qcp_qa_active_mul(a.s13,b,13,vl);
 r.s14=qcp_qa_active_mul(a.s14,b,14,vl);
 r.s15=qcp_qa_active_mul(a.s15,b,15,vl);
 r.s16=qcp_qa_active_mul(a.s16,b,16,vl);
 r.s17=qcp_qa_active_mul(a.s17,b,17,vl);
 r.s18=qcp_qa_active_mul(a.s18,b,18,vl);
 r.s19=qcp_qa_active_mul(a.s19,b,19,vl);
 r.s20=qcp_qa_active_mul(a.s20,b,20,vl);
 r.s21=qcp_qa_active_mul(a.s21,b,21,vl);
 r.s22=qcp_qa_active_mul(a.s22,b,22,vl);
 r.s23=qcp_qa_active_mul(a.s23,b,23,vl);
 r.s24=qcp_qa_active_mul(a.s24,b,24,vl);
 r.s25=qcp_qa_active_mul(a.s25,b,25,vl);
 r.s26=qcp_qa_active_mul(a.s26,b,26,vl);
 r.s27=qcp_qa_active_mul(a.s27,b,27,vl);
 r.s28=qcp_qa_active_mul(a.s28,b,28,vl);
 r.s29=qcp_qa_active_mul(a.s29,b,29,vl);
 r.s30=qcp_qa_active_mul(a.s30,b,30,vl);
 r.s31=qcp_qa_active_mul(a.s31,b,31,vl);
 return r;
}
