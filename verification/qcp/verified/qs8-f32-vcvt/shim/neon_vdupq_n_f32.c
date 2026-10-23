#include "neon_arithmetic.h"
#include "scalar_primitives.h"
float32x4_t vdupq_n_f32(float x)
/*@ Require emp Ensure store(&(__return.s0),float,x) * store(&(__return.s1),float,x) * store(&(__return.s2),float,x) * store(&(__return.s3),float,x) */
{ float32x4_t r;
 r.s0=x;
 r.s1=x;
 r.s2=x;
 r.s3=x;
 return r;
}
