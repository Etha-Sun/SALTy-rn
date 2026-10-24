#include "vector_primitives.h"
uint32x4_t rdsum_selfext2(uint32x4_t a)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) Require 0<=a0 && a0<=4294967295 && 0<=a1 && a1<=4294967295 && 0<=a2 && a2<=4294967295 && 0<=a3 && a3<=4294967295 && store(&(a.s0),unsigned int,a0) * store(&(a.s1),unsigned int,a1) * store(&(a.s2),unsigned int,a2) * store(&(a.s3),unsigned int,a3) Ensure store(&(__return.s0),unsigned int,a2) * store(&(__return.s1),unsigned int,a3) * store(&(__return.s2),unsigned int,a0) * store(&(__return.s3),unsigned int,a1) */
{
uint32x4_t r;
r.s0=a.s2;
r.s1=a.s3;
r.s2=a.s0;
r.s3=a.s1;
return r;
}
