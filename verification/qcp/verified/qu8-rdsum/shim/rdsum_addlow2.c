#include "vector_primitives.h"
uint32x2_t rdsum_addlow2(uint32x2_t a,uint32x4_t b)
/*@ With (a0:Z) (a1:Z) (b0:Z) (b1:Z) (b2:Z) (b3:Z) Require 0<=a0 && a0<=4294967295 && 0<=a1 && a1<=4294967295 && 0<=b0 && b0<=4294967295 && 0<=b1 && b1<=4294967295 && 0<=b2 && b2<=4294967295 && 0<=b3 && b3<=4294967295 && store(&(a.s0),unsigned int,a0) * store(&(a.s1),unsigned int,a1) * store(&(b.s0),unsigned int,b0) * store(&(b.s1),unsigned int,b1) * store(&(b.s2),unsigned int,b2) * store(&(b.s3),unsigned int,b3) Ensure store(&(__return.s0),unsigned int,rs_add_u32(a0,b0)) * store(&(__return.s1),unsigned int,rs_add_u32(a1,b1)) */
{
uint32x2_t r;
r.s0=rsum_add_u32(a.s0,b.s0);
r.s1=rsum_add_u32(a.s1,b.s1);
return r;
}
