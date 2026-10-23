#include "lrelu_rvv_vectors.h"
vint16m4_t __riscv_vmv_v_x_i16m4(int16_t b,size_t vl)
/*@ Require 0<=vl && vl<=32 && -32768<=b && b<=32767 && emp
 Ensure store(&(__return.s0),short,qlr_active_splat(b,0,vl)) * store(&(__return.s1),short,qlr_active_splat(b,1,vl)) * store(&(__return.s2),short,qlr_active_splat(b,2,vl)) * store(&(__return.s3),short,qlr_active_splat(b,3,vl)) * store(&(__return.s4),short,qlr_active_splat(b,4,vl)) * store(&(__return.s5),short,qlr_active_splat(b,5,vl)) * store(&(__return.s6),short,qlr_active_splat(b,6,vl)) * store(&(__return.s7),short,qlr_active_splat(b,7,vl)) * store(&(__return.s8),short,qlr_active_splat(b,8,vl)) * store(&(__return.s9),short,qlr_active_splat(b,9,vl)) * store(&(__return.s10),short,qlr_active_splat(b,10,vl)) * store(&(__return.s11),short,qlr_active_splat(b,11,vl)) * store(&(__return.s12),short,qlr_active_splat(b,12,vl)) * store(&(__return.s13),short,qlr_active_splat(b,13,vl)) * store(&(__return.s14),short,qlr_active_splat(b,14,vl)) * store(&(__return.s15),short,qlr_active_splat(b,15,vl)) * store(&(__return.s16),short,qlr_active_splat(b,16,vl)) * store(&(__return.s17),short,qlr_active_splat(b,17,vl)) * store(&(__return.s18),short,qlr_active_splat(b,18,vl)) * store(&(__return.s19),short,qlr_active_splat(b,19,vl)) * store(&(__return.s20),short,qlr_active_splat(b,20,vl)) * store(&(__return.s21),short,qlr_active_splat(b,21,vl)) * store(&(__return.s22),short,qlr_active_splat(b,22,vl)) * store(&(__return.s23),short,qlr_active_splat(b,23,vl)) * store(&(__return.s24),short,qlr_active_splat(b,24,vl)) * store(&(__return.s25),short,qlr_active_splat(b,25,vl)) * store(&(__return.s26),short,qlr_active_splat(b,26,vl)) * store(&(__return.s27),short,qlr_active_splat(b,27,vl)) * store(&(__return.s28),short,qlr_active_splat(b,28,vl)) * store(&(__return.s29),short,qlr_active_splat(b,29,vl)) * store(&(__return.s30),short,qlr_active_splat(b,30,vl)) * store(&(__return.s31),short,qlr_active_splat(b,31,vl)) */
{
 vint16m4_t r;
 r.s0=qcp_qlr_active_splat(b,0,vl);
 r.s1=qcp_qlr_active_splat(b,1,vl);
 r.s2=qcp_qlr_active_splat(b,2,vl);
 r.s3=qcp_qlr_active_splat(b,3,vl);
 r.s4=qcp_qlr_active_splat(b,4,vl);
 r.s5=qcp_qlr_active_splat(b,5,vl);
 r.s6=qcp_qlr_active_splat(b,6,vl);
 r.s7=qcp_qlr_active_splat(b,7,vl);
 r.s8=qcp_qlr_active_splat(b,8,vl);
 r.s9=qcp_qlr_active_splat(b,9,vl);
 r.s10=qcp_qlr_active_splat(b,10,vl);
 r.s11=qcp_qlr_active_splat(b,11,vl);
 r.s12=qcp_qlr_active_splat(b,12,vl);
 r.s13=qcp_qlr_active_splat(b,13,vl);
 r.s14=qcp_qlr_active_splat(b,14,vl);
 r.s15=qcp_qlr_active_splat(b,15,vl);
 r.s16=qcp_qlr_active_splat(b,16,vl);
 r.s17=qcp_qlr_active_splat(b,17,vl);
 r.s18=qcp_qlr_active_splat(b,18,vl);
 r.s19=qcp_qlr_active_splat(b,19,vl);
 r.s20=qcp_qlr_active_splat(b,20,vl);
 r.s21=qcp_qlr_active_splat(b,21,vl);
 r.s22=qcp_qlr_active_splat(b,22,vl);
 r.s23=qcp_qlr_active_splat(b,23,vl);
 r.s24=qcp_qlr_active_splat(b,24,vl);
 r.s25=qcp_qlr_active_splat(b,25,vl);
 r.s26=qcp_qlr_active_splat(b,26,vl);
 r.s27=qcp_qlr_active_splat(b,27,vl);
 r.s28=qcp_qlr_active_splat(b,28,vl);
 r.s29=qcp_qlr_active_splat(b,29,vl);
 r.s30=qcp_qlr_active_splat(b,30,vl);
 r.s31=qcp_qlr_active_splat(b,31,vl);
 return r;
}
