#ifndef DWCHW_NEON_LANE_VIEW_H
#define DWCHW_NEON_LANE_VIEW_H
#include "neon_borrow.h"
/* One original VGETQ_LANE spec, faithful readonly four-cell pointer view.
   No ordinary compound helper is exempted; physical ISA/ABI review pending. */
float dw_isa_getq_lane_f32(const float32x4_t*p,int lane)
/*@ With (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32) Require 0<=lane && lane<4 && store(&(p->s0),float,a0) * store(&(p->s1),float,a1) * store(&(p->s2),float,a2) * store(&(p->s3),float,a3) Ensure dw_same(__return,dw_fp4(a0,a1,a2,a3,lane)) && store(&(p->s0),float,a0) * store(&(p->s1),float,a1) * store(&(p->s2),float,a2) * store(&(p->s3),float,a3) */;
#endif
