#include "vector_ops.h"
float32x4_t vabsq_f32(float32x4_t a)
/*@ With (x0:fp32) (x1:fp32) (x2:fp32) (x3:fp32)
 Require store(&(a.s0),float,x0) * store(&(a.s1),float,x1) * store(&(a.s2),float,x2) * store(&(a.s3),float,x3)
 Ensure store(&(__return.s0),float,f16_abs(x0)) * store(&(__return.s1),float,f16_abs(x1)) * store(&(__return.s2),float,f16_abs(x2)) * store(&(__return.s3),float,f16_abs(x3)) */
{
 float32x4_t r;
 r.s0=qcp_f16_abs(a.s0);
 r.s1=qcp_f16_abs(a.s1);
 r.s2=qcp_f16_abs(a.s2);
 r.s3=qcp_f16_abs(a.s3);
 return r;
}
