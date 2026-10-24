#include "vector_primitives.h"
int32x4_t rdsum_wadd16_low(int32x4_t a,int16x8_t b)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (b0:Z) (b1:Z) (b2:Z) (b3:Z) (b4:Z) (b5:Z) (b6:Z) (b7:Z) Require -2147483648<=a0 && a0<=2147483647 && -2147483648<=a1 && a1<=2147483647 && -2147483648<=a2 && a2<=2147483647 && -2147483648<=a3 && a3<=2147483647 && -32768<=b0 && b0<=32767 && -32768<=b1 && b1<=32767 && -32768<=b2 && b2<=32767 && -32768<=b3 && b3<=32767 && -32768<=b4 && b4<=32767 && -32768<=b5 && b5<=32767 && -32768<=b6 && b6<=32767 && -32768<=b7 && b7<=32767 && store(&(a.s0),int,a0) * store(&(a.s1),int,a1) * store(&(a.s2),int,a2) * store(&(a.s3),int,a3) * store(&(b.s0),short,b0) * store(&(b.s1),short,b1) * store(&(b.s2),short,b2) * store(&(b.s3),short,b3) * store(&(b.s4),short,b4) * store(&(b.s5),short,b5) * store(&(b.s6),short,b6) * store(&(b.s7),short,b7) Ensure store(&(__return.s0),int,rs_add_s32(a0,b0)) * store(&(__return.s1),int,rs_add_s32(a1,b1)) * store(&(__return.s2),int,rs_add_s32(a2,b2)) * store(&(__return.s3),int,rs_add_s32(a3,b3)) */
{
int32x4_t r;
r.s0=rsum_add_s32(a.s0,b.s0);
r.s1=rsum_add_s32(a.s1,b.s1);
r.s2=rsum_add_s32(a.s2,b.s2);
r.s3=rsum_add_s32(a.s3,b.s3);
return r;
}
