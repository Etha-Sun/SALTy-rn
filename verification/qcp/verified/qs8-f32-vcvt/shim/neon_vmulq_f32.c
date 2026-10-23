#include "neon_arithmetic.h"
#include "scalar_primitives.h"
float32x4_t vmulq_f32(float32x4_t a,float32x4_t b)
/*@ With (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32) (b0:fp32) (b1:fp32) (b2:fp32) (b3:fp32) Require store(&(a.s0),float,a0) * store(&(a.s1),float,a1) * store(&(a.s2),float,a2) * store(&(a.s3),float,a3) * store(&(b.s0),float,b0) * store(&(b.s1),float,b1) * store(&(b.s2),float,b2) * store(&(b.s3),float,b3) Ensure store(&(__return.s0),float,fp32_mul(a0,b0)) * store(&(__return.s1),float,fp32_mul(a1,b1)) * store(&(__return.s2),float,fp32_mul(a2,b2)) * store(&(__return.s3),float,fp32_mul(a3,b3)) */
{ float32x4_t r;
 r.s0=qcp_cvt_mul(a.s0,b.s0);
 r.s1=qcp_cvt_mul(a.s1,b.s1);
 r.s2=qcp_cvt_mul(a.s2,b.s2);
 r.s3=qcp_cvt_mul(a.s3,b.s3);
 return r;
}
