#include "neon_arithmetic.h"
#include "scalar_primitives.h"
float32x2_t vget_low_f32(float32x4_t a)
/*@ With (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32) Require store(&(a.s0),float,a0) * store(&(a.s1),float,a1) * store(&(a.s2),float,a2) * store(&(a.s3),float,a3) Ensure store(&(__return.s0),float,a0) * store(&(__return.s1),float,a1) */
{ float32x2_t r;
 r.s0=a.s0;
 r.s1=a.s1;
 return r;
}
