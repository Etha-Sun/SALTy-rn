#include "vector_primitives.h"
vint16m4_t __riscv_vmv_v_x_i16m4(int16_t x,size_t vl)
/*@ Require -32768<=x && x<=32767 && 0<=vl && vl<=32 && emp Ensure store(&(__return.s0),short,rd_splat(x,0,vl)) * store(&(__return.s1),short,rd_splat(x,1,vl)) * store(&(__return.s2),short,rd_splat(x,2,vl)) * store(&(__return.s3),short,rd_splat(x,3,vl)) * store(&(__return.s4),short,rd_splat(x,4,vl)) * store(&(__return.s5),short,rd_splat(x,5,vl)) * store(&(__return.s6),short,rd_splat(x,6,vl)) * store(&(__return.s7),short,rd_splat(x,7,vl)) * store(&(__return.s8),short,rd_splat(x,8,vl)) * store(&(__return.s9),short,rd_splat(x,9,vl)) * store(&(__return.s10),short,rd_splat(x,10,vl)) * store(&(__return.s11),short,rd_splat(x,11,vl)) * store(&(__return.s12),short,rd_splat(x,12,vl)) * store(&(__return.s13),short,rd_splat(x,13,vl)) * store(&(__return.s14),short,rd_splat(x,14,vl)) * store(&(__return.s15),short,rd_splat(x,15,vl)) * store(&(__return.s16),short,rd_splat(x,16,vl)) * store(&(__return.s17),short,rd_splat(x,17,vl)) * store(&(__return.s18),short,rd_splat(x,18,vl)) * store(&(__return.s19),short,rd_splat(x,19,vl)) * store(&(__return.s20),short,rd_splat(x,20,vl)) * store(&(__return.s21),short,rd_splat(x,21,vl)) * store(&(__return.s22),short,rd_splat(x,22,vl)) * store(&(__return.s23),short,rd_splat(x,23,vl)) * store(&(__return.s24),short,rd_splat(x,24,vl)) * store(&(__return.s25),short,rd_splat(x,25,vl)) * store(&(__return.s26),short,rd_splat(x,26,vl)) * store(&(__return.s27),short,rd_splat(x,27,vl)) * store(&(__return.s28),short,rd_splat(x,28,vl)) * store(&(__return.s29),short,rd_splat(x,29,vl)) * store(&(__return.s30),short,rd_splat(x,30,vl)) * store(&(__return.s31),short,rd_splat(x,31,vl)) */
{
vint16m4_t r;
r.s0=rdsum_splat16(x,0,vl);
r.s1=rdsum_splat16(x,1,vl);
r.s2=rdsum_splat16(x,2,vl);
r.s3=rdsum_splat16(x,3,vl);
r.s4=rdsum_splat16(x,4,vl);
r.s5=rdsum_splat16(x,5,vl);
r.s6=rdsum_splat16(x,6,vl);
r.s7=rdsum_splat16(x,7,vl);
r.s8=rdsum_splat16(x,8,vl);
r.s9=rdsum_splat16(x,9,vl);
r.s10=rdsum_splat16(x,10,vl);
r.s11=rdsum_splat16(x,11,vl);
r.s12=rdsum_splat16(x,12,vl);
r.s13=rdsum_splat16(x,13,vl);
r.s14=rdsum_splat16(x,14,vl);
r.s15=rdsum_splat16(x,15,vl);
r.s16=rdsum_splat16(x,16,vl);
r.s17=rdsum_splat16(x,17,vl);
r.s18=rdsum_splat16(x,18,vl);
r.s19=rdsum_splat16(x,19,vl);
r.s20=rdsum_splat16(x,20,vl);
r.s21=rdsum_splat16(x,21,vl);
r.s22=rdsum_splat16(x,22,vl);
r.s23=rdsum_splat16(x,23,vl);
r.s24=rdsum_splat16(x,24,vl);
r.s25=rdsum_splat16(x,25,vl);
r.s26=rdsum_splat16(x,26,vl);
r.s27=rdsum_splat16(x,27,vl);
r.s28=rdsum_splat16(x,28,vl);
r.s29=rdsum_splat16(x,29,vl);
r.s30=rdsum_splat16(x,30,vl);
r.s31=rdsum_splat16(x,31,vl);
return r;
}
