#include "rvv_arithmetic.h"
#include "rvv_active.h"
vfloat32m8_t __riscv_vfmul_vf_f32m8(vfloat32m8_t a,float b,size_t vl)
/*@ With (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32) (a4:fp32) (a5:fp32) (a6:fp32) (a7:fp32) (a8:fp32) (a9:fp32) (a10:fp32) (a11:fp32) (a12:fp32) (a13:fp32) (a14:fp32) (a15:fp32) (a16:fp32) (a17:fp32) (a18:fp32) (a19:fp32) (a20:fp32) (a21:fp32) (a22:fp32) (a23:fp32) (a24:fp32) (a25:fp32) (a26:fp32) (a27:fp32) (a28:fp32) (a29:fp32) (a30:fp32) (a31:fp32) Require 0<=vl && vl<=32 && store(&(a.s0),float,a0) * store(&(a.s1),float,a1) * store(&(a.s2),float,a2) * store(&(a.s3),float,a3) * store(&(a.s4),float,a4) * store(&(a.s5),float,a5) * store(&(a.s6),float,a6) * store(&(a.s7),float,a7) * store(&(a.s8),float,a8) * store(&(a.s9),float,a9) * store(&(a.s10),float,a10) * store(&(a.s11),float,a11) * store(&(a.s12),float,a12) * store(&(a.s13),float,a13) * store(&(a.s14),float,a14) * store(&(a.s15),float,a15) * store(&(a.s16),float,a16) * store(&(a.s17),float,a17) * store(&(a.s18),float,a18) * store(&(a.s19),float,a19) * store(&(a.s20),float,a20) * store(&(a.s21),float,a21) * store(&(a.s22),float,a22) * store(&(a.s23),float,a23) * store(&(a.s24),float,a24) * store(&(a.s25),float,a25) * store(&(a.s26),float,a26) * store(&(a.s27),float,a27) * store(&(a.s28),float,a28) * store(&(a.s29),float,a29) * store(&(a.s30),float,a30) * store(&(a.s31),float,a31) Ensure store(&(__return.s0),float,cvt_active_mul(0,vl,a0,b)) * store(&(__return.s1),float,cvt_active_mul(1,vl,a1,b)) * store(&(__return.s2),float,cvt_active_mul(2,vl,a2,b)) * store(&(__return.s3),float,cvt_active_mul(3,vl,a3,b)) * store(&(__return.s4),float,cvt_active_mul(4,vl,a4,b)) * store(&(__return.s5),float,cvt_active_mul(5,vl,a5,b)) * store(&(__return.s6),float,cvt_active_mul(6,vl,a6,b)) * store(&(__return.s7),float,cvt_active_mul(7,vl,a7,b)) * store(&(__return.s8),float,cvt_active_mul(8,vl,a8,b)) * store(&(__return.s9),float,cvt_active_mul(9,vl,a9,b)) * store(&(__return.s10),float,cvt_active_mul(10,vl,a10,b)) * store(&(__return.s11),float,cvt_active_mul(11,vl,a11,b)) * store(&(__return.s12),float,cvt_active_mul(12,vl,a12,b)) * store(&(__return.s13),float,cvt_active_mul(13,vl,a13,b)) * store(&(__return.s14),float,cvt_active_mul(14,vl,a14,b)) * store(&(__return.s15),float,cvt_active_mul(15,vl,a15,b)) * store(&(__return.s16),float,cvt_active_mul(16,vl,a16,b)) * store(&(__return.s17),float,cvt_active_mul(17,vl,a17,b)) * store(&(__return.s18),float,cvt_active_mul(18,vl,a18,b)) * store(&(__return.s19),float,cvt_active_mul(19,vl,a19,b)) * store(&(__return.s20),float,cvt_active_mul(20,vl,a20,b)) * store(&(__return.s21),float,cvt_active_mul(21,vl,a21,b)) * store(&(__return.s22),float,cvt_active_mul(22,vl,a22,b)) * store(&(__return.s23),float,cvt_active_mul(23,vl,a23,b)) * store(&(__return.s24),float,cvt_active_mul(24,vl,a24,b)) * store(&(__return.s25),float,cvt_active_mul(25,vl,a25,b)) * store(&(__return.s26),float,cvt_active_mul(26,vl,a26,b)) * store(&(__return.s27),float,cvt_active_mul(27,vl,a27,b)) * store(&(__return.s28),float,cvt_active_mul(28,vl,a28,b)) * store(&(__return.s29),float,cvt_active_mul(29,vl,a29,b)) * store(&(__return.s30),float,cvt_active_mul(30,vl,a30,b)) * store(&(__return.s31),float,cvt_active_mul(31,vl,a31,b)) */
{ vfloat32m8_t r;
 r.s0=qcp_cvt_active_mul(a.s0,b,0,vl);
 r.s1=qcp_cvt_active_mul(a.s1,b,1,vl);
 r.s2=qcp_cvt_active_mul(a.s2,b,2,vl);
 r.s3=qcp_cvt_active_mul(a.s3,b,3,vl);
 r.s4=qcp_cvt_active_mul(a.s4,b,4,vl);
 r.s5=qcp_cvt_active_mul(a.s5,b,5,vl);
 r.s6=qcp_cvt_active_mul(a.s6,b,6,vl);
 r.s7=qcp_cvt_active_mul(a.s7,b,7,vl);
 r.s8=qcp_cvt_active_mul(a.s8,b,8,vl);
 r.s9=qcp_cvt_active_mul(a.s9,b,9,vl);
 r.s10=qcp_cvt_active_mul(a.s10,b,10,vl);
 r.s11=qcp_cvt_active_mul(a.s11,b,11,vl);
 r.s12=qcp_cvt_active_mul(a.s12,b,12,vl);
 r.s13=qcp_cvt_active_mul(a.s13,b,13,vl);
 r.s14=qcp_cvt_active_mul(a.s14,b,14,vl);
 r.s15=qcp_cvt_active_mul(a.s15,b,15,vl);
 r.s16=qcp_cvt_active_mul(a.s16,b,16,vl);
 r.s17=qcp_cvt_active_mul(a.s17,b,17,vl);
 r.s18=qcp_cvt_active_mul(a.s18,b,18,vl);
 r.s19=qcp_cvt_active_mul(a.s19,b,19,vl);
 r.s20=qcp_cvt_active_mul(a.s20,b,20,vl);
 r.s21=qcp_cvt_active_mul(a.s21,b,21,vl);
 r.s22=qcp_cvt_active_mul(a.s22,b,22,vl);
 r.s23=qcp_cvt_active_mul(a.s23,b,23,vl);
 r.s24=qcp_cvt_active_mul(a.s24,b,24,vl);
 r.s25=qcp_cvt_active_mul(a.s25,b,25,vl);
 r.s26=qcp_cvt_active_mul(a.s26,b,26,vl);
 r.s27=qcp_cvt_active_mul(a.s27,b,27,vl);
 r.s28=qcp_cvt_active_mul(a.s28,b,28,vl);
 r.s29=qcp_cvt_active_mul(a.s29,b,29,vl);
 r.s30=qcp_cvt_active_mul(a.s30,b,30,vl);
 r.s31=qcp_cvt_active_mul(a.s31,b,31,vl);
 return r;
}
