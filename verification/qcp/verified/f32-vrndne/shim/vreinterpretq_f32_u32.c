#include "vector_ops.h"
float32x4_t vreinterpretq_f32_u32(uint32x4_t a)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z)
 Require store(&(a.s0),unsigned int,x0) * store(&(a.s1),unsigned int,x1) * store(&(a.s2),unsigned int,x2) * store(&(a.s3),unsigned int,x3)
 Ensure store(&(__return.s0),float,fp32_of_bits(x0)) * store(&(__return.s1),float,fp32_of_bits(x1)) * store(&(__return.s2),float,fp32_of_bits(x2)) * store(&(__return.s3),float,fp32_of_bits(x3)) */
{
 float32x4_t r;

 r.s0=qcp_float_from_bits(a.s0);
 r.s1=qcp_float_from_bits(a.s1);
 r.s2=qcp_float_from_bits(a.s2);
 r.s3=qcp_float_from_bits(a.s3);
 return r;
}
