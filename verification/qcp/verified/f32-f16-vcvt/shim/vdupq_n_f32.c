#include "vector_ops.h"
float32x4_t vdupq_n_f32(float b)
/*@ Require emp
 Ensure store(&(__return.s0),float,b) * store(&(__return.s1),float,b) * store(&(__return.s2),float,b) * store(&(__return.s3),float,b) */
{
 float32x4_t r;
 r.s0=b;
 r.s1=b;
 r.s2=b;
 r.s3=b;
 return r;
}
