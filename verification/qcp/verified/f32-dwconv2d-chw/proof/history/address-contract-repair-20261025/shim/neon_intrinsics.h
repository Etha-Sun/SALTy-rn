#ifndef DWCHW_NEON_INTRINSICS_H
#define DWCHW_NEON_INTRINSICS_H
#include "terminal_model.h"
float32x2_t vget_low_f32(float32x4_t a)
/*@ With (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32)
 Require store(&(a.s0),float,a0) * store(&(a.s1),float,a1) * store(&(a.s2),float,a2) * store(&(a.s3),float,a3)
 Ensure store(&(__return.s0),float,a0) * store(&(__return.s1),float,a1) */;
float32x2_t vget_high_f32(float32x4_t a)
/*@ With (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32)
 Require store(&(a.s0),float,a0) * store(&(a.s1),float,a1) * store(&(a.s2),float,a2) * store(&(a.s3),float,a3)
 Ensure store(&(__return.s0),float,a2) * store(&(__return.s1),float,a3) */;
float32x4_t vdupq_lane_f32(float32x2_t a,int lane)
/*@ With (a0:fp32) (a1:fp32)
 Require 0<=lane && lane<2 && store(&(a.s0),float,a0) * store(&(a.s1),float,a1)
 Ensure store(&(__return.s0),float,dw_fp2(a0,a1,lane)) * store(&(__return.s1),float,dw_fp2(a0,a1,lane)) * store(&(__return.s2),float,dw_fp2(a0,a1,lane)) * store(&(__return.s3),float,dw_fp2(a0,a1,lane)) */;
float32x4_t vextq_f32(float32x4_t a,float32x4_t b,int k)
/*@ With (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32) (b0:fp32) (b1:fp32) (b2:fp32) (b3:fp32)
 Require 0<=k && k<4 && store(&(a.s0),float,a0) * store(&(a.s1),float,a1) * store(&(a.s2),float,a2) * store(&(a.s3),float,a3) * store(&(b.s0),float,b0) * store(&(b.s1),float,b1) * store(&(b.s2),float,b2) * store(&(b.s3),float,b3)
 Ensure store(&(__return.s0),float,dw_arm_ext(dw_fp4(a0,a1,a2,a3),dw_fp4(b0,b1,b2,b3),k,0)) * store(&(__return.s1),float,dw_arm_ext(dw_fp4(a0,a1,a2,a3),dw_fp4(b0,b1,b2,b3),k,1)) * store(&(__return.s2),float,dw_arm_ext(dw_fp4(a0,a1,a2,a3),dw_fp4(b0,b1,b2,b3),k,2)) * store(&(__return.s3),float,dw_arm_ext(dw_fp4(a0,a1,a2,a3),dw_fp4(b0,b1,b2,b3),k,3)) */;
float32x4_t vfmaq_lane_f32(float32x4_t c,float32x4_t a,float32x2_t b,int lane)
/*@ With (c0:fp32) (c1:fp32) (c2:fp32) (c3:fp32) (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32) (b0:fp32) (b1:fp32)
 Require 0<=lane && lane<2 && store(&(c.s0),float,c0) * store(&(c.s1),float,c1) * store(&(c.s2),float,c2) * store(&(c.s3),float,c3) * store(&(a.s0),float,a0) * store(&(a.s1),float,a1) * store(&(a.s2),float,a2) * store(&(a.s3),float,a3) * store(&(b.s0),float,b0) * store(&(b.s1),float,b1)
 Ensure store(&(__return.s0),float,dw_arm_fma(c0,a0,dw_fp2(b0,b1,lane))) * store(&(__return.s1),float,dw_arm_fma(c1,a1,dw_fp2(b0,b1,lane))) * store(&(__return.s2),float,dw_arm_fma(c2,a2,dw_fp2(b0,b1,lane))) * store(&(__return.s3),float,dw_arm_fma(c3,a3,dw_fp2(b0,b1,lane))) */;
float32x4_t vmaxq_f32(float32x4_t a,float32x4_t b)
/*@ With (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32) (b0:fp32) (b1:fp32) (b2:fp32) (b3:fp32)
 Require store(&(a.s0),float,a0) * store(&(a.s1),float,a1) * store(&(a.s2),float,a2) * store(&(a.s3),float,a3) * store(&(b.s0),float,b0) * store(&(b.s1),float,b1) * store(&(b.s2),float,b2) * store(&(b.s3),float,b3)
 Ensure store(&(__return.s0),float,dw_arm_max(a0,b0)) * store(&(__return.s1),float,dw_arm_max(a1,b1)) * store(&(__return.s2),float,dw_arm_max(a2,b2)) * store(&(__return.s3),float,dw_arm_max(a3,b3)) */;
float32x4_t vminq_f32(float32x4_t a,float32x4_t b)
/*@ With (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32) (b0:fp32) (b1:fp32) (b2:fp32) (b3:fp32)
 Require store(&(a.s0),float,a0) * store(&(a.s1),float,a1) * store(&(a.s2),float,a2) * store(&(a.s3),float,a3) * store(&(b.s0),float,b0) * store(&(b.s1),float,b1) * store(&(b.s2),float,b2) * store(&(b.s3),float,b3)
 Ensure store(&(__return.s0),float,dw_arm_min(a0,b0)) * store(&(__return.s1),float,dw_arm_min(a1,b1)) * store(&(__return.s2),float,dw_arm_min(a2,b2)) * store(&(__return.s3),float,dw_arm_min(a3,b3)) */;
uint32x4_t vandq_u32(uint32x4_t a,uint32x4_t b)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (b0:Z) (b1:Z) (b2:Z) (b3:Z)
 Require store(&(a.s0),unsigned int,a0) * store(&(a.s1),unsigned int,a1) * store(&(a.s2),unsigned int,a2) * store(&(a.s3),unsigned int,a3) * store(&(b.s0),unsigned int,b0) * store(&(b.s1),unsigned int,b1) * store(&(b.s2),unsigned int,b2) * store(&(b.s3),unsigned int,b3)
 Ensure store(&(__return.s0),unsigned int,dw_arm_and(dw_u4(a0,a1,a2,a3),dw_u4(b0,b1,b2,b3),0)) * store(&(__return.s1),unsigned int,dw_arm_and(dw_u4(a0,a1,a2,a3),dw_u4(b0,b1,b2,b3),1)) * store(&(__return.s2),unsigned int,dw_arm_and(dw_u4(a0,a1,a2,a3),dw_u4(b0,b1,b2,b3),2)) * store(&(__return.s3),unsigned int,dw_arm_and(dw_u4(a0,a1,a2,a3),dw_u4(b0,b1,b2,b3),3)) */;
uint32x4_t vreinterpretq_u32_f32(float32x4_t a)
/*@ With (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32)
 Require store(&(a.s0),float,a0) * store(&(a.s1),float,a1) * store(&(a.s2),float,a2) * store(&(a.s3),float,a3)
 Ensure store(&(__return.s0),unsigned int,bits_of_fp32(a0)) * store(&(__return.s1),unsigned int,bits_of_fp32(a1)) * store(&(__return.s2),unsigned int,bits_of_fp32(a2)) * store(&(__return.s3),unsigned int,bits_of_fp32(a3)) */;
float32x4_t vreinterpretq_f32_u32(uint32x4_t a)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z)
 Require store(&(a.s0),unsigned int,a0) * store(&(a.s1),unsigned int,a1) * store(&(a.s2),unsigned int,a2) * store(&(a.s3),unsigned int,a3)
 Ensure store(&(__return.s0),float,fp32_of_bits(a0)) * store(&(__return.s1),float,fp32_of_bits(a1)) * store(&(__return.s2),float,fp32_of_bits(a2)) * store(&(__return.s3),float,fp32_of_bits(a3)) */;
float32x4_t vdupq_n_f32(float x)
/*@ Require emp Ensure store(&(__return.s0),float,x) * store(&(__return.s1),float,x) * store(&(__return.s2),float,x) * store(&(__return.s3),float,x) */;
float32x4_t vmovq_n_f32(float x)
/*@ Require emp Ensure store(&(__return.s0),float,x) * store(&(__return.s1),float,x) * store(&(__return.s2),float,x) * store(&(__return.s3),float,x) */;
float32x2_t vld1_f32(const float *p)
/*@ With (F:DwROMap) Require dw_window(F,p,2) && dw_data(F) Ensure dw_data(F) * store(&(__return.s0),float,dw_get(F,p+4*0)) * store(&(__return.s1),float,dw_get(F,p+4*1)) */;
float32x4_t vld1q_f32(const float *p)
/*@ With (F:DwROMap) Require dw_window(F,p,4) && dw_data(F) Ensure dw_data(F) * store(&(__return.s0),float,dw_get(F,p+4*0)) * store(&(__return.s1),float,dw_get(F,p+4*1)) * store(&(__return.s2),float,dw_get(F,p+4*2)) * store(&(__return.s3),float,dw_get(F,p+4*3)) */;
uint32x4_t vld1q_u32(const uint32_t *p)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) Require store(p+0,unsigned int,a0) * store(p+1,unsigned int,a1) * store(p+2,unsigned int,a2) * store(p+3,unsigned int,a3) Ensure store(p+0,unsigned int,a0) * store(p+1,unsigned int,a1) * store(p+2,unsigned int,a2) * store(p+3,unsigned int,a3) * store(&(__return.s0),unsigned int,a0) * store(&(__return.s1),unsigned int,a1) * store(&(__return.s2),unsigned int,a2) * store(&(__return.s3),unsigned int,a3) */;
void vst1q_f32(float *p,float32x4_t a)
/*@ With (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32) Require undef_data_at(p+0,float) * undef_data_at(p+1,float) * undef_data_at(p+2,float) * undef_data_at(p+3,float) * store(&(a.s0),float,a0) * store(&(a.s1),float,a1) * store(&(a.s2),float,a2) * store(&(a.s3),float,a3) Ensure store(p+0,float,a0) * store(p+1,float,a1) * store(p+2,float,a2) * store(p+3,float,a3) */;
void vst1_f32(float *p,float32x2_t a)
/*@ With (a0:fp32) (a1:fp32) Require undef_data_at(p+0,float) * undef_data_at(p+1,float) * store(&(a.s0),float,a0) * store(&(a.s1),float,a1) Ensure store(p+0,float,a0) * store(p+1,float,a1) */;
void vst1_lane_f32(float *p,float32x2_t a,int lane)
/*@ With (a0:fp32) (a1:fp32) Require lane==0 && undef_data_at(p+0,float) * store(&(a.s0),float,a0) * store(&(a.s1),float,a1) Ensure store(p+0,float,a0) */;
#endif
