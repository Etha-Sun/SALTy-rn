#include "vector_ops.h"
uint32x4_t vdupq_n_u32(unsigned int b)
/*@ Require emp
 Ensure store(&(__return.s0),unsigned int,b) * store(&(__return.s1),unsigned int,b) * store(&(__return.s2),unsigned int,b) * store(&(__return.s3),unsigned int,b) */
{
 uint32x4_t r;
 r.s0=b;
 r.s1=b;
 r.s2=b;
 r.s3=b;
 return r;
}
