#include "vector_primitives.h"
#include "scalar_primitives.h"
vint32m8_t __riscv_vmv_v_x_s32m8(int32_t x,size_t vl)
/*@ Require -2147483648<=x && x<=2147483647 && 0<=vl && vl<=32 && emp Ensure store(&(__return.s0),int,rs_splat_s32(x,0,vl)) * store(&(__return.s1),int,rs_splat_s32(x,1,vl)) * store(&(__return.s2),int,rs_splat_s32(x,2,vl)) * store(&(__return.s3),int,rs_splat_s32(x,3,vl)) * store(&(__return.s4),int,rs_splat_s32(x,4,vl)) * store(&(__return.s5),int,rs_splat_s32(x,5,vl)) * store(&(__return.s6),int,rs_splat_s32(x,6,vl)) * store(&(__return.s7),int,rs_splat_s32(x,7,vl)) * store(&(__return.s8),int,rs_splat_s32(x,8,vl)) * store(&(__return.s9),int,rs_splat_s32(x,9,vl)) * store(&(__return.s10),int,rs_splat_s32(x,10,vl)) * store(&(__return.s11),int,rs_splat_s32(x,11,vl)) * store(&(__return.s12),int,rs_splat_s32(x,12,vl)) * store(&(__return.s13),int,rs_splat_s32(x,13,vl)) * store(&(__return.s14),int,rs_splat_s32(x,14,vl)) * store(&(__return.s15),int,rs_splat_s32(x,15,vl)) * store(&(__return.s16),int,rs_splat_s32(x,16,vl)) * store(&(__return.s17),int,rs_splat_s32(x,17,vl)) * store(&(__return.s18),int,rs_splat_s32(x,18,vl)) * store(&(__return.s19),int,rs_splat_s32(x,19,vl)) * store(&(__return.s20),int,rs_splat_s32(x,20,vl)) * store(&(__return.s21),int,rs_splat_s32(x,21,vl)) * store(&(__return.s22),int,rs_splat_s32(x,22,vl)) * store(&(__return.s23),int,rs_splat_s32(x,23,vl)) * store(&(__return.s24),int,rs_splat_s32(x,24,vl)) * store(&(__return.s25),int,rs_splat_s32(x,25,vl)) * store(&(__return.s26),int,rs_splat_s32(x,26,vl)) * store(&(__return.s27),int,rs_splat_s32(x,27,vl)) * store(&(__return.s28),int,rs_splat_s32(x,28,vl)) * store(&(__return.s29),int,rs_splat_s32(x,29,vl)) * store(&(__return.s30),int,rs_splat_s32(x,30,vl)) * store(&(__return.s31),int,rs_splat_s32(x,31,vl)) */
{
vint32m8_t r;
r.s0=rsum_splat_s32(x,0,vl);
r.s1=rsum_splat_s32(x,1,vl);
r.s2=rsum_splat_s32(x,2,vl);
r.s3=rsum_splat_s32(x,3,vl);
r.s4=rsum_splat_s32(x,4,vl);
r.s5=rsum_splat_s32(x,5,vl);
r.s6=rsum_splat_s32(x,6,vl);
r.s7=rsum_splat_s32(x,7,vl);
r.s8=rsum_splat_s32(x,8,vl);
r.s9=rsum_splat_s32(x,9,vl);
r.s10=rsum_splat_s32(x,10,vl);
r.s11=rsum_splat_s32(x,11,vl);
r.s12=rsum_splat_s32(x,12,vl);
r.s13=rsum_splat_s32(x,13,vl);
r.s14=rsum_splat_s32(x,14,vl);
r.s15=rsum_splat_s32(x,15,vl);
r.s16=rsum_splat_s32(x,16,vl);
r.s17=rsum_splat_s32(x,17,vl);
r.s18=rsum_splat_s32(x,18,vl);
r.s19=rsum_splat_s32(x,19,vl);
r.s20=rsum_splat_s32(x,20,vl);
r.s21=rsum_splat_s32(x,21,vl);
r.s22=rsum_splat_s32(x,22,vl);
r.s23=rsum_splat_s32(x,23,vl);
r.s24=rsum_splat_s32(x,24,vl);
r.s25=rsum_splat_s32(x,25,vl);
r.s26=rsum_splat_s32(x,26,vl);
r.s27=rsum_splat_s32(x,27,vl);
r.s28=rsum_splat_s32(x,28,vl);
r.s29=rsum_splat_s32(x,29,vl);
r.s30=rsum_splat_s32(x,30,vl);
r.s31=rsum_splat_s32(x,31,vl);
return r;
}
