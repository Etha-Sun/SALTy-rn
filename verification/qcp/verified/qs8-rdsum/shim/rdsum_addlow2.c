#include "vector_primitives.h"
int32x2_t rdsum_addlow2(int32x2_t a,int32x4_t b)
/*@ With (a0:Z) (a1:Z) (b0:Z) (b1:Z) (b2:Z) (b3:Z) Require -2147483648<=a0 && a0<=2147483647 && -2147483648<=a1 && a1<=2147483647 && -2147483648<=b0 && b0<=2147483647 && -2147483648<=b1 && b1<=2147483647 && -2147483648<=b2 && b2<=2147483647 && -2147483648<=b3 && b3<=2147483647 && store(&(a.s0),int,a0) * store(&(a.s1),int,a1) * store(&(b.s0),int,b0) * store(&(b.s1),int,b1) * store(&(b.s2),int,b2) * store(&(b.s3),int,b3) Ensure store(&(__return.s0),int,rs_add_s32(a0,b0)) * store(&(__return.s1),int,rs_add_s32(a1,b1)) */
{
int32x2_t r;
r.s0=rsum_add_s32(a.s0,b.s0);
r.s1=rsum_add_s32(a.s1,b.s1);
return r;
}
