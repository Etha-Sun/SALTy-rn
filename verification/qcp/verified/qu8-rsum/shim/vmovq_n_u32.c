#include "vector_primitives.h"
#include "scalar_primitives.h"
uint32x4_t vmovq_n_u32(uint32_t x)
/*@ Require 0<=x && x<=4294967295 && emp Ensure store(&(__return.s0),unsigned int,x) * store(&(__return.s1),unsigned int,x) * store(&(__return.s2),unsigned int,x) * store(&(__return.s3),unsigned int,x) */
{
uint32x4_t r;
r.s0=x;
r.s1=x;
r.s2=x;
r.s3=x;
return r;
}
