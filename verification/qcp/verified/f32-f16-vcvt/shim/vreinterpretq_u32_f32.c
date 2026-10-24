#include "vector_ops.h"
uint32x4_t vreinterpretq_u32_f32(float32x4_t a)
/*@ With (x0:fp32) (x1:fp32) (x2:fp32) (x3:fp32)
 Require store(&(a.s0),float,x0) * store(&(a.s1),float,x1) * store(&(a.s2),float,x2) * store(&(a.s3),float,x3)
 Ensure store(&(__return.s0),unsigned int,bits_of_fp32(x0)) * store(&(__return.s1),unsigned int,bits_of_fp32(x1)) * store(&(__return.s2),unsigned int,bits_of_fp32(x2)) * store(&(__return.s3),unsigned int,bits_of_fp32(x3)) */
{
 uint32x4_t r;
 r.s0=qcp_float_bits(a.s0);
 r.s1=qcp_float_bits(a.s1);
 r.s2=qcp_float_bits(a.s2);
 r.s3=qcp_float_bits(a.s3);
 return r;
}
