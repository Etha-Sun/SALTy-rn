#include "rvv_arithmetic.h"
vint32m8_t __riscv_vssra_vx_i32m8(vint32m8_t a,size_t d,int rm,size_t vl)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) (a8:Z) (a9:Z) (a10:Z) (a11:Z) (a12:Z) (a13:Z) (a14:Z) (a15:Z) (a16:Z) (a17:Z) (a18:Z) (a19:Z) (a20:Z) (a21:Z) (a22:Z) (a23:Z) (a24:Z) (a25:Z) (a26:Z) (a27:Z) (a28:Z) (a29:Z) (a30:Z) (a31:Z)
 Require 0<=vl && vl<=32 && -2147483648<=a0 && a0<=2147483647 && -2147483648<=a1 && a1<=2147483647 && -2147483648<=a2 && a2<=2147483647 && -2147483648<=a3 && a3<=2147483647 && -2147483648<=a4 && a4<=2147483647 && -2147483648<=a5 && a5<=2147483647 && -2147483648<=a6 && a6<=2147483647 && -2147483648<=a7 && a7<=2147483647 && -2147483648<=a8 && a8<=2147483647 && -2147483648<=a9 && a9<=2147483647 && -2147483648<=a10 && a10<=2147483647 && -2147483648<=a11 && a11<=2147483647 && -2147483648<=a12 && a12<=2147483647 && -2147483648<=a13 && a13<=2147483647 && -2147483648<=a14 && a14<=2147483647 && -2147483648<=a15 && a15<=2147483647 && -2147483648<=a16 && a16<=2147483647 && -2147483648<=a17 && a17<=2147483647 && -2147483648<=a18 && a18<=2147483647 && -2147483648<=a19 && a19<=2147483647 && -2147483648<=a20 && a20<=2147483647 && -2147483648<=a21 && a21<=2147483647 && -2147483648<=a22 && a22<=2147483647 && -2147483648<=a23 && a23<=2147483647 && -2147483648<=a24 && a24<=2147483647 && -2147483648<=a25 && a25<=2147483647 && -2147483648<=a26 && a26<=2147483647 && -2147483648<=a27 && a27<=2147483647 && -2147483648<=a28 && a28<=2147483647 && -2147483648<=a29 && a29<=2147483647 && -2147483648<=a30 && a30<=2147483647 && -2147483648<=a31 && a31<=2147483647 && 0<=d && d<=31 && rm==0 && store(&(a.s0),int,a0) * store(&(a.s1),int,a1) * store(&(a.s2),int,a2) * store(&(a.s3),int,a3) * store(&(a.s4),int,a4) * store(&(a.s5),int,a5) * store(&(a.s6),int,a6) * store(&(a.s7),int,a7) * store(&(a.s8),int,a8) * store(&(a.s9),int,a9) * store(&(a.s10),int,a10) * store(&(a.s11),int,a11) * store(&(a.s12),int,a12) * store(&(a.s13),int,a13) * store(&(a.s14),int,a14) * store(&(a.s15),int,a15) * store(&(a.s16),int,a16) * store(&(a.s17),int,a17) * store(&(a.s18),int,a18) * store(&(a.s19),int,a19) * store(&(a.s20),int,a20) * store(&(a.s21),int,a21) * store(&(a.s22),int,a22) * store(&(a.s23),int,a23) * store(&(a.s24),int,a24) * store(&(a.s25),int,a25) * store(&(a.s26),int,a26) * store(&(a.s27),int,a27) * store(&(a.s28),int,a28) * store(&(a.s29),int,a29) * store(&(a.s30),int,a30) * store(&(a.s31),int,a31)
 Ensure store(&(__return.s0),int,qu_active_rnu(0,vl,a0,d)) * store(&(__return.s1),int,qu_active_rnu(1,vl,a1,d)) * store(&(__return.s2),int,qu_active_rnu(2,vl,a2,d)) * store(&(__return.s3),int,qu_active_rnu(3,vl,a3,d)) * store(&(__return.s4),int,qu_active_rnu(4,vl,a4,d)) * store(&(__return.s5),int,qu_active_rnu(5,vl,a5,d)) * store(&(__return.s6),int,qu_active_rnu(6,vl,a6,d)) * store(&(__return.s7),int,qu_active_rnu(7,vl,a7,d)) * store(&(__return.s8),int,qu_active_rnu(8,vl,a8,d)) * store(&(__return.s9),int,qu_active_rnu(9,vl,a9,d)) * store(&(__return.s10),int,qu_active_rnu(10,vl,a10,d)) * store(&(__return.s11),int,qu_active_rnu(11,vl,a11,d)) * store(&(__return.s12),int,qu_active_rnu(12,vl,a12,d)) * store(&(__return.s13),int,qu_active_rnu(13,vl,a13,d)) * store(&(__return.s14),int,qu_active_rnu(14,vl,a14,d)) * store(&(__return.s15),int,qu_active_rnu(15,vl,a15,d)) * store(&(__return.s16),int,qu_active_rnu(16,vl,a16,d)) * store(&(__return.s17),int,qu_active_rnu(17,vl,a17,d)) * store(&(__return.s18),int,qu_active_rnu(18,vl,a18,d)) * store(&(__return.s19),int,qu_active_rnu(19,vl,a19,d)) * store(&(__return.s20),int,qu_active_rnu(20,vl,a20,d)) * store(&(__return.s21),int,qu_active_rnu(21,vl,a21,d)) * store(&(__return.s22),int,qu_active_rnu(22,vl,a22,d)) * store(&(__return.s23),int,qu_active_rnu(23,vl,a23,d)) * store(&(__return.s24),int,qu_active_rnu(24,vl,a24,d)) * store(&(__return.s25),int,qu_active_rnu(25,vl,a25,d)) * store(&(__return.s26),int,qu_active_rnu(26,vl,a26,d)) * store(&(__return.s27),int,qu_active_rnu(27,vl,a27,d)) * store(&(__return.s28),int,qu_active_rnu(28,vl,a28,d)) * store(&(__return.s29),int,qu_active_rnu(29,vl,a29,d)) * store(&(__return.s30),int,qu_active_rnu(30,vl,a30,d)) * store(&(__return.s31),int,qu_active_rnu(31,vl,a31,d)) */
{
 vint32m8_t r;
 r.s0=qcp_qu_active_rnu(a.s0,d,0,vl);
 r.s1=qcp_qu_active_rnu(a.s1,d,1,vl);
 r.s2=qcp_qu_active_rnu(a.s2,d,2,vl);
 r.s3=qcp_qu_active_rnu(a.s3,d,3,vl);
 r.s4=qcp_qu_active_rnu(a.s4,d,4,vl);
 r.s5=qcp_qu_active_rnu(a.s5,d,5,vl);
 r.s6=qcp_qu_active_rnu(a.s6,d,6,vl);
 r.s7=qcp_qu_active_rnu(a.s7,d,7,vl);
 r.s8=qcp_qu_active_rnu(a.s8,d,8,vl);
 r.s9=qcp_qu_active_rnu(a.s9,d,9,vl);
 r.s10=qcp_qu_active_rnu(a.s10,d,10,vl);
 r.s11=qcp_qu_active_rnu(a.s11,d,11,vl);
 r.s12=qcp_qu_active_rnu(a.s12,d,12,vl);
 r.s13=qcp_qu_active_rnu(a.s13,d,13,vl);
 r.s14=qcp_qu_active_rnu(a.s14,d,14,vl);
 r.s15=qcp_qu_active_rnu(a.s15,d,15,vl);
 r.s16=qcp_qu_active_rnu(a.s16,d,16,vl);
 r.s17=qcp_qu_active_rnu(a.s17,d,17,vl);
 r.s18=qcp_qu_active_rnu(a.s18,d,18,vl);
 r.s19=qcp_qu_active_rnu(a.s19,d,19,vl);
 r.s20=qcp_qu_active_rnu(a.s20,d,20,vl);
 r.s21=qcp_qu_active_rnu(a.s21,d,21,vl);
 r.s22=qcp_qu_active_rnu(a.s22,d,22,vl);
 r.s23=qcp_qu_active_rnu(a.s23,d,23,vl);
 r.s24=qcp_qu_active_rnu(a.s24,d,24,vl);
 r.s25=qcp_qu_active_rnu(a.s25,d,25,vl);
 r.s26=qcp_qu_active_rnu(a.s26,d,26,vl);
 r.s27=qcp_qu_active_rnu(a.s27,d,27,vl);
 r.s28=qcp_qu_active_rnu(a.s28,d,28,vl);
 r.s29=qcp_qu_active_rnu(a.s29,d,29,vl);
 r.s30=qcp_qu_active_rnu(a.s30,d,30,vl);
 r.s31=qcp_qu_active_rnu(a.s31,d,31,vl);
 return r;
}
