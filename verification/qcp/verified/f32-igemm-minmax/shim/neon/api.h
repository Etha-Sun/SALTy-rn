#include "../../contracts/model.h"
/*@ include strategies "copy.strategies" */
float32x4_t vld1q_f32(const float *p)
/*@ With (base:Z) (n:Z) (j:Z) (L:list fp32)
 Require p == pointer_offset(base,j,float) && 0<=j && j+4<=n && FloatArray::full(base,n,L)
 Ensure FloatArray::full(base,n,L) * store(&(__return.s0),float,gget(j+0,L)) * store(&(__return.s1),float,gget(j+1,L)) * store(&(__return.s2),float,gget(j+2,L)) * store(&(__return.s3),float,gget(j+3,L)) */;

float32x2_t vld1_f32(const float *p)
/*@ With (base:Z) (n:Z) (j:Z) (L:list fp32)
 Require p == pointer_offset(base,j,float) && 0<=j && j+2<=n && FloatArray::full(base,n,L)
 Ensure FloatArray::full(base,n,L) * store(&(__return.s0),float,gget(j+0,L)) * store(&(__return.s1),float,gget(j+1,L)) */;

float32x4_t vld1q_dup_f32(const float *p)
/*@ With (base:Z) (n:Z) (j:Z) (L:list fp32)
 Require p == pointer_offset(base,j,float) && 0<=j && j+1<=n && FloatArray::full(base,n,L)
 Ensure FloatArray::full(base,n,L) * store(&(__return.s0),float,gget(j+0,L)) * store(&(__return.s1),float,gget(j+0,L)) * store(&(__return.s2),float,gget(j+0,L)) * store(&(__return.s3),float,gget(j+0,L)) */;

float32x4_t vdupq_n_f32(float a)
/*@ Require emp
 Ensure store(&(__return.s0),float,a) * store(&(__return.s1),float,a) * store(&(__return.s2),float,a) * store(&(__return.s3),float,a) */;

float32x4_t vdupq_lane_f32(float32x2_t a,int lane)
/*@ With (x0:fp32) (x1:fp32)
 Require 0<=lane && lane<=1 && store(&(a.s0),float,x0) * store(&(a.s1),float,x1)
 Ensure store(&(__return.s0),float,glane(lane,x0,x1)) * store(&(__return.s1),float,glane(lane,x0,x1)) * store(&(__return.s2),float,glane(lane,x0,x1)) * store(&(__return.s3),float,glane(lane,x0,x1)) */;

float32x4_t vfmaq_f32(float32x4_t acc,float32x4_t a,float32x4_t b)
/*@ With (x0:fp32) (x1:fp32) (x2:fp32) (x3:fp32) (y0:fp32) (y1:fp32) (y2:fp32) (y3:fp32) (z0:fp32) (z1:fp32) (z2:fp32) (z3:fp32)
 Require store(&(acc.s0),float,z0) * store(&(acc.s1),float,z1) * store(&(acc.s2),float,z2) * store(&(acc.s3),float,z3) * store(&(a.s0),float,x0) * store(&(a.s1),float,x1) * store(&(a.s2),float,x2) * store(&(a.s3),float,x3) * store(&(b.s0),float,y0) * store(&(b.s1),float,y1) * store(&(b.s2),float,y2) * store(&(b.s3),float,y3)
 Ensure store(&(__return.s0),float,fma_rne(x0,y0,z0)) * store(&(__return.s1),float,fma_rne(x1,y1,z1)) * store(&(__return.s2),float,fma_rne(x2,y2,z2)) * store(&(__return.s3),float,fma_rne(x3,y3,z3)) */;

float32x4_t vminq_f32(float32x4_t a,float32x4_t b)
/*@ With (x0:fp32) (x1:fp32) (x2:fp32) (x3:fp32) (y0:fp32) (y1:fp32) (y2:fp32) (y3:fp32)
 Require store(&(a.s0),float,x0) * store(&(a.s1),float,x1) * store(&(a.s2),float,x2) * store(&(a.s3),float,x3) * store(&(b.s0),float,y0) * store(&(b.s1),float,y1) * store(&(b.s2),float,y2) * store(&(b.s3),float,y3)
 Ensure store(&(__return.s0),float,fp32_neon_min(x0,y0)) * store(&(__return.s1),float,fp32_neon_min(x1,y1)) * store(&(__return.s2),float,fp32_neon_min(x2,y2)) * store(&(__return.s3),float,fp32_neon_min(x3,y3)) */;

float32x4_t vmaxq_f32(float32x4_t a,float32x4_t b)
/*@ With (x0:fp32) (x1:fp32) (x2:fp32) (x3:fp32) (y0:fp32) (y1:fp32) (y2:fp32) (y3:fp32)
 Require store(&(a.s0),float,x0) * store(&(a.s1),float,x1) * store(&(a.s2),float,x2) * store(&(a.s3),float,x3) * store(&(b.s0),float,y0) * store(&(b.s1),float,y1) * store(&(b.s2),float,y2) * store(&(b.s3),float,y3)
 Ensure store(&(__return.s0),float,fp32_neon_max(x0,y0)) * store(&(__return.s1),float,fp32_neon_max(x1,y1)) * store(&(__return.s2),float,fp32_neon_max(x2,y2)) * store(&(__return.s3),float,fp32_neon_max(x3,y3)) */;

float32x2_t vget_low_f32(float32x4_t a)
/*@ With (x0:fp32) (x1:fp32) (x2:fp32) (x3:fp32)
 Require store(&(a.s0),float,x0) * store(&(a.s1),float,x1) * store(&(a.s2),float,x2) * store(&(a.s3),float,x3)
 Ensure store(&(__return.s0),float,x0) * store(&(__return.s1),float,x1) */;

float32x2_t vget_high_f32(float32x4_t a)
/*@ With (x0:fp32) (x1:fp32) (x2:fp32) (x3:fp32)
 Require store(&(a.s0),float,x0) * store(&(a.s1),float,x1) * store(&(a.s2),float,x2) * store(&(a.s3),float,x3)
 Ensure store(&(__return.s0),float,x2) * store(&(__return.s1),float,x3) */;

void qcp_vst1q_f32(float *p,const float32x4_t *a)
/*@ With (x0:fp32) (x1:fp32) (x2:fp32) (x3:fp32) (base:Z) (N:Z) (done:Z) (L:list fp32)
 Require 0<=done && done+4<=N && p==base+4*done && store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * store(&(a->s2),float,x2) * store(&(a->s3),float,x3) * ig_write_state(base,N,done,L)
 Ensure store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * store(&(a->s2),float,x2) * store(&(a->s3),float,x3) * ig_write_state(base,N,done+4,ig_fappend(L,cons(x0,cons(x1,cons(x2,cons(x3,nil)))))) */;
#define vst1q_f32(p,a) qcp_vst1q_f32((p),&(a))
void qcp_vst1_f32(float *p,const float32x2_t *a)
/*@ With (x0:fp32) (x1:fp32) (base:Z) (N:Z) (done:Z) (L:list fp32)
 Require 0<=done && done+2<=N && p==base+4*done && store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * ig_write_state(base,N,done,L)
 Ensure store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * ig_write_state(base,N,done+2,ig_fappend(L,cons(x0,cons(x1,nil)))) */;
#define vst1_f32(p,a) qcp_vst1_f32((p),&(a))
void qcp_vst1_lane_f32(float *p,const float32x2_t *a,int lane)
/*@ With (x0:fp32) (x1:fp32) (base:Z) (N:Z) (done:Z) (L:list fp32)
 Require lane==0 && 0<=done && done+1<=N && p==base+4*done && store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * ig_write_state(base,N,done,L)
 Ensure store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * ig_write_state(base,N,done+1,ig_fappend(L,cons(x0,nil))) */;
#define vst1_lane_f32(p,a,lane) qcp_vst1_lane_f32((p),&(a),(lane))
