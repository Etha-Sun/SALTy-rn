#include "vector_primitives.h"
int16x8_t qcp_probe_neon_seed(const struct xnn_qu8_f32_cvt_params *params)
/*@ With (z:Z)(scale:fp32) Require -2147483648<=z && z<=2147483647 && store(&(params->scalar.zero_point),int,z) * store(&(params->scalar.scale),float,scale) Ensure store(&(params->scalar.zero_point),int,z) * store(&(params->scalar.scale),float,scale) * store(&(__return.s0),short,cvt_seed(z)) * store(&(__return.s1),short,cvt_seed(z)) * store(&(__return.s2),short,cvt_seed(z)) * store(&(__return.s3),short,cvt_seed(z)) * store(&(__return.s4),short,cvt_seed(z)) * store(&(__return.s5),short,cvt_seed(z)) * store(&(__return.s6),short,cvt_seed(z)) * store(&(__return.s7),short,cvt_seed(z)) */
{
  const int16x8_t vminus_zero_point = vdupq_n_s16((int16_t)(0U - (uint32_t)params->scalar.zero_point));
 return vminus_zero_point;
}
