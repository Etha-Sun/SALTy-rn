#include "vector_primitives.h"
vint32m8_t __riscv_vmv_v_x_i32m8(int32_t x,size_t vl)
/*@ Require -2147483648<=x && x<=2147483647 && 0<=vl && vl<=32 && emp Ensure store(&(__return.s0),int,rd_splat(x,0,vl)) * store(&(__return.s1),int,rd_splat(x,1,vl)) * store(&(__return.s2),int,rd_splat(x,2,vl)) * store(&(__return.s3),int,rd_splat(x,3,vl)) * store(&(__return.s4),int,rd_splat(x,4,vl)) * store(&(__return.s5),int,rd_splat(x,5,vl)) * store(&(__return.s6),int,rd_splat(x,6,vl)) * store(&(__return.s7),int,rd_splat(x,7,vl)) * store(&(__return.s8),int,rd_splat(x,8,vl)) * store(&(__return.s9),int,rd_splat(x,9,vl)) * store(&(__return.s10),int,rd_splat(x,10,vl)) * store(&(__return.s11),int,rd_splat(x,11,vl)) * store(&(__return.s12),int,rd_splat(x,12,vl)) * store(&(__return.s13),int,rd_splat(x,13,vl)) * store(&(__return.s14),int,rd_splat(x,14,vl)) * store(&(__return.s15),int,rd_splat(x,15,vl)) * store(&(__return.s16),int,rd_splat(x,16,vl)) * store(&(__return.s17),int,rd_splat(x,17,vl)) * store(&(__return.s18),int,rd_splat(x,18,vl)) * store(&(__return.s19),int,rd_splat(x,19,vl)) * store(&(__return.s20),int,rd_splat(x,20,vl)) * store(&(__return.s21),int,rd_splat(x,21,vl)) * store(&(__return.s22),int,rd_splat(x,22,vl)) * store(&(__return.s23),int,rd_splat(x,23,vl)) * store(&(__return.s24),int,rd_splat(x,24,vl)) * store(&(__return.s25),int,rd_splat(x,25,vl)) * store(&(__return.s26),int,rd_splat(x,26,vl)) * store(&(__return.s27),int,rd_splat(x,27,vl)) * store(&(__return.s28),int,rd_splat(x,28,vl)) * store(&(__return.s29),int,rd_splat(x,29,vl)) * store(&(__return.s30),int,rd_splat(x,30,vl)) * store(&(__return.s31),int,rd_splat(x,31,vl)) */
{
vint32m8_t r;
r.s0=rdsum_splat32(x,0,vl);
r.s1=rdsum_splat32(x,1,vl);
r.s2=rdsum_splat32(x,2,vl);
r.s3=rdsum_splat32(x,3,vl);
r.s4=rdsum_splat32(x,4,vl);
r.s5=rdsum_splat32(x,5,vl);
r.s6=rdsum_splat32(x,6,vl);
r.s7=rdsum_splat32(x,7,vl);
r.s8=rdsum_splat32(x,8,vl);
r.s9=rdsum_splat32(x,9,vl);
r.s10=rdsum_splat32(x,10,vl);
r.s11=rdsum_splat32(x,11,vl);
r.s12=rdsum_splat32(x,12,vl);
r.s13=rdsum_splat32(x,13,vl);
r.s14=rdsum_splat32(x,14,vl);
r.s15=rdsum_splat32(x,15,vl);
r.s16=rdsum_splat32(x,16,vl);
r.s17=rdsum_splat32(x,17,vl);
r.s18=rdsum_splat32(x,18,vl);
r.s19=rdsum_splat32(x,19,vl);
r.s20=rdsum_splat32(x,20,vl);
r.s21=rdsum_splat32(x,21,vl);
r.s22=rdsum_splat32(x,22,vl);
r.s23=rdsum_splat32(x,23,vl);
r.s24=rdsum_splat32(x,24,vl);
r.s25=rdsum_splat32(x,25,vl);
r.s26=rdsum_splat32(x,26,vl);
r.s27=rdsum_splat32(x,27,vl);
r.s28=rdsum_splat32(x,28,vl);
r.s29=rdsum_splat32(x,29,vl);
r.s30=rdsum_splat32(x,30,vl);
r.s31=rdsum_splat32(x,31,vl);
return r;
}
