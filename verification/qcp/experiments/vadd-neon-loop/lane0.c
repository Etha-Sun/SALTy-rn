#include "../../shared/vadd/types.h"
void qcp_vst1_lane0_f32(float *p, const struct float32x2_t *a, int lane)
/*@ With (x0:fp32) (x1:fp32)
Require lane == 0 && store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * undef_data_at(p,float)
Ensure store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * store(p,float,x0) */
{
  if (lane == 0) *p = a->s0;
  if (lane == 1) *p = a->s1;
}
