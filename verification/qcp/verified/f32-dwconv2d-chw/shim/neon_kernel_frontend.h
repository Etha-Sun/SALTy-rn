#ifndef DWCHW_NEON_KERNEL_FRONTEND_H
#define DWCHW_NEON_KERNEL_FRONTEND_H
#include "neon_frontend.h"
#include "intrinsic_store_views.h"
#include "intrinsic_mask_view.h"
#include "neon_lane_view.h"
#define vgetq_lane_f32(a,lane) dw_isa_getq_lane_f32(&(a),(lane))
#undef vld1q_u32
#define vld1q_u32(p) dw_isa_mask7_array((p))
#undef vst1q_f32
#undef vst1_f32
#undef vst1_lane_f32
#define vst1q_f32(p,a) dw_isa_store4((p),&(a))
#define vst1_f32(p,a) dw_isa_store2((p),&(a))
#define vst1_lane_f32(p,a,lane) dw_isa_store1((p),&(a),(lane))
#endif
