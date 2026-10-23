#include "vector_ops.h"
uint32x4_t vmovq_n_u32(unsigned int u)
/*@ Require emp
 Ensure store(&(__return.s0),unsigned int,u) * store(&(__return.s1),unsigned int,u) * store(&(__return.s2),unsigned int,u) * store(&(__return.s3),unsigned int,u) */
{
 uint32x4_t r;

 r.s0=u;
 r.s1=u;
 r.s2=u;
 r.s3=u;
 return r;
}
