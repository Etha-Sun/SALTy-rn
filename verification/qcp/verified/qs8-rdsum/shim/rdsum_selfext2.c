#include "vector_primitives.h"
int32x4_t rdsum_selfext2(int32x4_t a)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) Require -2147483648<=a0 && a0<=2147483647 && -2147483648<=a1 && a1<=2147483647 && -2147483648<=a2 && a2<=2147483647 && -2147483648<=a3 && a3<=2147483647 && store(&(a.s0),int,a0) * store(&(a.s1),int,a1) * store(&(a.s2),int,a2) * store(&(a.s3),int,a3) Ensure store(&(__return.s0),int,a2) * store(&(__return.s1),int,a3) * store(&(__return.s2),int,a0) * store(&(__return.s3),int,a1) */
{
int32x4_t r;
r.s0=a.s2;
r.s1=a.s3;
r.s2=a.s0;
r.s3=a.s1;
return r;
}
