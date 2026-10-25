#ifndef DWCHW_NEON_FRONTEND_H
#define DWCHW_NEON_FRONTEND_H
#include "neon_borrow.h"
#include "support.h"
#define vget_low_f32(a) dw_n_vget_low_f32(&(a))
#define vget_high_f32(a) dw_n_vget_high_f32(&(a))
#define vdupq_lane_f32(a,lane) dw_n_vdupq_lane_f32(&(a),(lane))
#define vextq_f32(a,b,k) dw_n_vextq_f32(&(a),&(b),(k))
#define vfmaq_lane_f32(c,a,b,lane) dw_n_vfmaq_lane_f32(&(c),&(a),&(b),(lane))
#define vmaxq_f32(a,b) dw_n_vmaxq_f32(&(a),&(b))
#define vminq_f32(a,b) dw_n_vminq_f32(&(a),&(b))
#define vandq_u32(a,b) dw_n_vandq_u32(&(a),&(b))
#define vreinterpretq_u32_f32(a) dw_n_vreinterpretq_u32_f32(&(a))
#define vreinterpretq_f32_u32(a) dw_n_vreinterpretq_f32_u32(&(a))
#define vst1q_f32(p,a) dw_n_vst1q_f32((p),&(a))
#define vst1_f32(p,a) dw_n_vst1_f32((p),&(a))
#define vst1_lane_f32(p,a,lane) dw_n_vst1_lane_f32((p),&(a),(lane))
#define vld1q_u32(p) dw_mask_words((const int32_t*)(p))
#define assert(b) dw_assert(b)
#define round_up_po2(n,q) dw_round_up_po2((n),(q))
#define doz(n,q) dw_doz((n),(q))
#endif
