#ifndef QCP_FMIN_MEMORY_NEON_H
#define QCP_FMIN_MEMORY_NEON_H
#include "formal_types.h"
float32x4_t vld1q_f32(const float *p)
/*@ With (x0:fp32) (x1:fp32) (x2:fp32) (x3:fp32)
 Require store(pointer_offset(p,0,float),float,x0) * store(pointer_offset(p,1,float),float,x1) * store(pointer_offset(p,2,float),float,x2) * store(pointer_offset(p,3,float),float,x3)
 Ensure store(pointer_offset(p,0,float),float,x0) * store(pointer_offset(p,1,float),float,x1) * store(pointer_offset(p,2,float),float,x2) * store(pointer_offset(p,3,float),float,x3) * store(&(__return.s0),float,x0) * store(&(__return.s1),float,x1) * store(&(__return.s2),float,x2) * store(&(__return.s3),float,x3) */;

void qcp_vst1q_f32(float *p, const float32x4_t *a)
/*@ With (x0:fp32) (x1:fp32) (x2:fp32) (x3:fp32)
 Require store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * store(&(a->s2),float,x2) * store(&(a->s3),float,x3) * undef_data_at(pointer_offset(p,0,float),float) * undef_data_at(pointer_offset(p,1,float),float) * undef_data_at(pointer_offset(p,2,float),float) * undef_data_at(pointer_offset(p,3,float),float)
 Ensure store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * store(&(a->s2),float,x2) * store(&(a->s3),float,x3) * store(pointer_offset(p,0,float),float,x0) * store(pointer_offset(p,1,float),float,x1) * store(pointer_offset(p,2,float),float,x2) * store(pointer_offset(p,3,float),float,x3) */;

void qcp_vst1_f32(float *p, const float32x2_t *a)
/*@ With (x0:fp32) (x1:fp32)
 Require store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * undef_data_at(pointer_offset(p,0,float),float) * undef_data_at(pointer_offset(p,1,float),float)
 Ensure store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * store(pointer_offset(p,0,float),float,x0) * store(pointer_offset(p,1,float),float,x1) */;

float32x2_t vget_low_f32(float32x4_t a)
/*@ With (x0:fp32) (x1:fp32) (x2:fp32) (x3:fp32)
 Require store(&(a.s0),float,x0) * store(&(a.s1),float,x1) * store(&(a.s2),float,x2) * store(&(a.s3),float,x3)
 Ensure store(&(__return.s0),float,x0) * store(&(__return.s1),float,x1) */;

float32x2_t vget_high_f32(float32x4_t a)
/*@ With (x0:fp32) (x1:fp32) (x2:fp32) (x3:fp32)
 Require store(&(a.s0),float,x0) * store(&(a.s1),float,x1) * store(&(a.s2),float,x2) * store(&(a.s3),float,x3)
 Ensure store(&(__return.s0),float,x2) * store(&(__return.s1),float,x3) */;

void qcp_vst1_lane_f32(float *p, const float32x2_t *a, int lane)
/*@ With (x0:fp32) (x1:fp32)
 Require lane == 0 && store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * undef_data_at(p,float)
 Ensure store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * store(p,float,x0) */;

void qcp_assert(int condition)
/*@ Require condition != 0 && emp Ensure emp */;
#define vst1q_f32(p,a) qcp_vst1q_f32((p),&(a))
#define vst1_f32(p,a) qcp_vst1_f32((p),&(a))
#define vst1_lane_f32(p,a,lane) qcp_vst1_lane_f32((p),&(a),(lane))
#define NULL ((void*)0)
#define assert(x) qcp_assert(x)
#define XNN_OOB_READS
#define XNN_UNLIKELY(x) (x)
#endif
