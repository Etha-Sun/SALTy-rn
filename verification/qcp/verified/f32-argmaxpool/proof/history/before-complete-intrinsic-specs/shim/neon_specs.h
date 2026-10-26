#ifndef ARGMAXPOOL_NEON_SPECS_H
#define ARGMAXPOOL_NEON_SPECS_H
#include "formal_types.h"
/* Source-reviewed LD1 input-map view; no C body required by current policy. */
float32x4_t vld1q_f32(const float *p)
/*@ With (F:APMap) Require ap_window(F,p,4) && ap_data(F)
 Ensure ap_data(F) * store(&(__return.s0),float,ap_load_lane(F,p,0)) * store(&(__return.s1),float,ap_load_lane(F,p,1)) * store(&(__return.s2),float,ap_load_lane(F,p,2)) * store(&(__return.s3),float,ap_load_lane(F,p,3)) */;
#endif
