#include "vector_primitives.h"
int32x4_t vdupq_n_s32(int32_t x)
/*@ Require -2147483648<=x && x<=2147483647 && emp Ensure store(&(__return.s0),int,x) * store(&(__return.s1),int,x) * store(&(__return.s2),int,x) * store(&(__return.s3),int,x) */
{
int32x4_t r;
r.s0=x;
r.s1=x;
r.s2=x;
r.s3=x;
return r;
}
