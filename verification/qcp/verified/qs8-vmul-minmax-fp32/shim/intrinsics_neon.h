#ifndef QS8MUL_NEON_INTRINSICS_H
#define QS8MUL_NEON_INTRINSICS_H
#include "intrinsic_model.h"
int8x8_t vdup_n_s8(int8_t x)
/*@ Require emp
 Ensure store(&(__return.s0),char,x) * store(&(__return.s1),char,x) * store(&(__return.s2),char,x) * store(&(__return.s3),char,x) * store(&(__return.s4),char,x) * store(&(__return.s5),char,x) * store(&(__return.s6),char,x) * store(&(__return.s7),char,x) */;
int32x4_t vdupq_n_s32(int32_t x)
/*@ Require emp
 Ensure store(&(__return.s0),int,x) * store(&(__return.s1),int,x) * store(&(__return.s2),int,x) * store(&(__return.s3),int,x) */;
float32x4_t vdupq_n_f32(float x)
/*@ Require emp
 Ensure store(&(__return.s0),float,x) * store(&(__return.s1),float,x) * store(&(__return.s2),float,x) * store(&(__return.s3),float,x) */;
int16x8_t vsubl_s8(int8x8_t a,int8x8_t b)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) (b0:Z) (b1:Z) (b2:Z) (b3:Z) (b4:Z) (b5:Z) (b6:Z) (b7:Z)
 Require store(&(a.s0),char,a0) * store(&(a.s1),char,a1) * store(&(a.s2),char,a2) * store(&(a.s3),char,a3) * store(&(a.s4),char,a4) * store(&(a.s5),char,a5) * store(&(a.s6),char,a6) * store(&(a.s7),char,a7) * store(&(b.s0),char,b0) * store(&(b.s1),char,b1) * store(&(b.s2),char,b2) * store(&(b.s3),char,b3) * store(&(b.s4),char,b4) * store(&(b.s5),char,b5) * store(&(b.s6),char,b6) * store(&(b.s7),char,b7)
 Ensure store(&(__return.s0),short,a0-b0) * store(&(__return.s1),short,a1-b1) * store(&(__return.s2),short,a2-b2) * store(&(__return.s3),short,a3-b3) * store(&(__return.s4),short,a4-b4) * store(&(__return.s5),short,a5-b5) * store(&(__return.s6),short,a6-b6) * store(&(__return.s7),short,a7-b7) */;
int16x4_t vget_low_s16(int16x8_t a)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z)
 Require store(&(a.s0),short,a0) * store(&(a.s1),short,a1) * store(&(a.s2),short,a2) * store(&(a.s3),short,a3) * store(&(a.s4),short,a4) * store(&(a.s5),short,a5) * store(&(a.s6),short,a6) * store(&(a.s7),short,a7)
 Ensure store(&(__return.s0),short,a0) * store(&(__return.s1),short,a1) * store(&(__return.s2),short,a2) * store(&(__return.s3),short,a3) */;
int16x4_t vget_high_s16(int16x8_t a)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z)
 Require store(&(a.s0),short,a0) * store(&(a.s1),short,a1) * store(&(a.s2),short,a2) * store(&(a.s3),short,a3) * store(&(a.s4),short,a4) * store(&(a.s5),short,a5) * store(&(a.s6),short,a6) * store(&(a.s7),short,a7)
 Ensure store(&(__return.s0),short,a4) * store(&(__return.s1),short,a5) * store(&(__return.s2),short,a6) * store(&(__return.s3),short,a7) */;
int32x4_t vmull_s16(int16x4_t a,int16x4_t b)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (b0:Z) (b1:Z) (b2:Z) (b3:Z)
 Require store(&(a.s0),short,a0) * store(&(a.s1),short,a1) * store(&(a.s2),short,a2) * store(&(a.s3),short,a3) * store(&(b.s0),short,b0) * store(&(b.s1),short,b1) * store(&(b.s2),short,b2) * store(&(b.s3),short,b3)
 Ensure store(&(__return.s0),int,a0*b0) * store(&(__return.s1),int,a1*b1) * store(&(__return.s2),int,a2*b2) * store(&(__return.s3),int,a3*b3) */;
float32x4_t vcvtq_f32_s32(int32x4_t a)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z)
 Require store(&(a.s0),int,a0) * store(&(a.s1),int,a1) * store(&(a.s2),int,a2) * store(&(a.s3),int,a3)
 Ensure store(&(__return.s0),float,qm_of_int(a0)) * store(&(__return.s1),float,qm_of_int(a1)) * store(&(__return.s2),float,qm_of_int(a2)) * store(&(__return.s3),float,qm_of_int(a3)) */;
float32x4_t vmulq_f32(float32x4_t a,float32x4_t b)
/*@ With (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32) (b0:fp32) (b1:fp32) (b2:fp32) (b3:fp32)
 Require store(&(a.s0),float,a0) * store(&(a.s1),float,a1) * store(&(a.s2),float,a2) * store(&(a.s3),float,a3) * store(&(b.s0),float,b0) * store(&(b.s1),float,b1) * store(&(b.s2),float,b2) * store(&(b.s3),float,b3)
 Ensure store(&(__return.s0),float,qm_arm_mul(a0,b0)) * store(&(__return.s1),float,qm_arm_mul(a1,b1)) * store(&(__return.s2),float,qm_arm_mul(a2,b2)) * store(&(__return.s3),float,qm_arm_mul(a3,b3)) */;
float32x4_t vaddq_f32(float32x4_t a,float32x4_t b)
/*@ With (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32) (b0:fp32) (b1:fp32) (b2:fp32) (b3:fp32)
 Require store(&(a.s0),float,a0) * store(&(a.s1),float,a1) * store(&(a.s2),float,a2) * store(&(a.s3),float,a3) * store(&(b.s0),float,b0) * store(&(b.s1),float,b1) * store(&(b.s2),float,b2) * store(&(b.s3),float,b3)
 Ensure store(&(__return.s0),float,qm_arm_add(a0,b0)) * store(&(__return.s1),float,qm_arm_add(a1,b1)) * store(&(__return.s2),float,qm_arm_add(a2,b2)) * store(&(__return.s3),float,qm_arm_add(a3,b3)) */;
int32x4_t vreinterpretq_s32_f32(float32x4_t a)
/*@ With (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32)
 Require store(&(a.s0),float,a0) * store(&(a.s1),float,a1) * store(&(a.s2),float,a2) * store(&(a.s3),float,a3)
 Ensure store(&(__return.s0),int,qm_signed_bits(bits_of_fp32(a0))) * store(&(__return.s1),int,qm_signed_bits(bits_of_fp32(a1))) * store(&(__return.s2),int,qm_signed_bits(bits_of_fp32(a2))) * store(&(__return.s3),int,qm_signed_bits(bits_of_fp32(a3))) */;
int32x4_t vqsubq_s32(int32x4_t a,int32x4_t b)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (b0:Z) (b1:Z) (b2:Z) (b3:Z)
 Require store(&(a.s0),int,a0) * store(&(a.s1),int,a1) * store(&(a.s2),int,a2) * store(&(a.s3),int,a3) * store(&(b.s0),int,b0) * store(&(b.s1),int,b1) * store(&(b.s2),int,b2) * store(&(b.s3),int,b3)
 Ensure store(&(__return.s0),int,qm_sat32(a0-b0)) * store(&(__return.s1),int,qm_sat32(a1-b1)) * store(&(__return.s2),int,qm_sat32(a2-b2)) * store(&(__return.s3),int,qm_sat32(a3-b3)) */;
int16x4_t vqmovn_s32(int32x4_t a)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z)
 Require store(&(a.s0),int,a0) * store(&(a.s1),int,a1) * store(&(a.s2),int,a2) * store(&(a.s3),int,a3)
 Ensure store(&(__return.s0),short,qm_sat16(a0)) * store(&(__return.s1),short,qm_sat16(a1)) * store(&(__return.s2),short,qm_sat16(a2)) * store(&(__return.s3),short,qm_sat16(a3)) */;
int16x8_t vqmovn_high_s32(int16x4_t a,int32x4_t b)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (b0:Z) (b1:Z) (b2:Z) (b3:Z)
 Require store(&(a.s0),short,a0) * store(&(a.s1),short,a1) * store(&(a.s2),short,a2) * store(&(a.s3),short,a3) * store(&(b.s0),int,b0) * store(&(b.s1),int,b1) * store(&(b.s2),int,b2) * store(&(b.s3),int,b3)
 Ensure store(&(__return.s0),short,a0) * store(&(__return.s1),short,a1) * store(&(__return.s2),short,a2) * store(&(__return.s3),short,a3) * store(&(__return.s4),short,qm_sat16(b0)) * store(&(__return.s5),short,qm_sat16(b1)) * store(&(__return.s6),short,qm_sat16(b2)) * store(&(__return.s7),short,qm_sat16(b3)) */;
int16x8_t vcombine_s16(int16x4_t a,int16x4_t b)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (b0:Z) (b1:Z) (b2:Z) (b3:Z)
 Require store(&(a.s0),short,a0) * store(&(a.s1),short,a1) * store(&(a.s2),short,a2) * store(&(a.s3),short,a3) * store(&(b.s0),short,b0) * store(&(b.s1),short,b1) * store(&(b.s2),short,b2) * store(&(b.s3),short,b3)
 Ensure store(&(__return.s0),short,a0) * store(&(__return.s1),short,a1) * store(&(__return.s2),short,a2) * store(&(__return.s3),short,a3) * store(&(__return.s4),short,b0) * store(&(__return.s5),short,b1) * store(&(__return.s6),short,b2) * store(&(__return.s7),short,b3) */;
int8x8_t vqmovn_s16(int16x8_t a)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z)
 Require store(&(a.s0),short,a0) * store(&(a.s1),short,a1) * store(&(a.s2),short,a2) * store(&(a.s3),short,a3) * store(&(a.s4),short,a4) * store(&(a.s5),short,a5) * store(&(a.s6),short,a6) * store(&(a.s7),short,a7)
 Ensure store(&(__return.s0),char,qm_sat8(a0)) * store(&(__return.s1),char,qm_sat8(a1)) * store(&(__return.s2),char,qm_sat8(a2)) * store(&(__return.s3),char,qm_sat8(a3)) * store(&(__return.s4),char,qm_sat8(a4)) * store(&(__return.s5),char,qm_sat8(a5)) * store(&(__return.s6),char,qm_sat8(a6)) * store(&(__return.s7),char,qm_sat8(a7)) */;
int8x8_t vmin_s8(int8x8_t a,int8x8_t b)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) (b0:Z) (b1:Z) (b2:Z) (b3:Z) (b4:Z) (b5:Z) (b6:Z) (b7:Z)
 Require store(&(a.s0),char,a0) * store(&(a.s1),char,a1) * store(&(a.s2),char,a2) * store(&(a.s3),char,a3) * store(&(a.s4),char,a4) * store(&(a.s5),char,a5) * store(&(a.s6),char,a6) * store(&(a.s7),char,a7) * store(&(b.s0),char,b0) * store(&(b.s1),char,b1) * store(&(b.s2),char,b2) * store(&(b.s3),char,b3) * store(&(b.s4),char,b4) * store(&(b.s5),char,b5) * store(&(b.s6),char,b6) * store(&(b.s7),char,b7)
 Ensure store(&(__return.s0),char,qm_min(a0,b0)) * store(&(__return.s1),char,qm_min(a1,b1)) * store(&(__return.s2),char,qm_min(a2,b2)) * store(&(__return.s3),char,qm_min(a3,b3)) * store(&(__return.s4),char,qm_min(a4,b4)) * store(&(__return.s5),char,qm_min(a5,b5)) * store(&(__return.s6),char,qm_min(a6,b6)) * store(&(__return.s7),char,qm_min(a7,b7)) */;
int8x8_t vmax_s8(int8x8_t a,int8x8_t b)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) (b0:Z) (b1:Z) (b2:Z) (b3:Z) (b4:Z) (b5:Z) (b6:Z) (b7:Z)
 Require store(&(a.s0),char,a0) * store(&(a.s1),char,a1) * store(&(a.s2),char,a2) * store(&(a.s3),char,a3) * store(&(a.s4),char,a4) * store(&(a.s5),char,a5) * store(&(a.s6),char,a6) * store(&(a.s7),char,a7) * store(&(b.s0),char,b0) * store(&(b.s1),char,b1) * store(&(b.s2),char,b2) * store(&(b.s3),char,b3) * store(&(b.s4),char,b4) * store(&(b.s5),char,b5) * store(&(b.s6),char,b6) * store(&(b.s7),char,b7)
 Ensure store(&(__return.s0),char,qm_max(a0,b0)) * store(&(__return.s1),char,qm_max(a1,b1)) * store(&(__return.s2),char,qm_max(a2,b2)) * store(&(__return.s3),char,qm_max(a3,b3)) * store(&(__return.s4),char,qm_max(a4,b4)) * store(&(__return.s5),char,qm_max(a5,b5)) * store(&(__return.s6),char,qm_max(a6,b6)) * store(&(__return.s7),char,qm_max(a7,b7)) */;
uint32x2_t vreinterpret_u32_s8(int8x8_t a)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z)
 Require store(&(a.s0),char,a0) * store(&(a.s1),char,a1) * store(&(a.s2),char,a2) * store(&(a.s3),char,a3) * store(&(a.s4),char,a4) * store(&(a.s5),char,a5) * store(&(a.s6),char,a6) * store(&(a.s7),char,a7)
 Ensure store(&(__return.s0),unsigned int,qm_pack32(a0,a1,a2,a3)) * store(&(__return.s1),unsigned int,qm_pack32(a4,a5,a6,a7)) */;
uint16x4_t vreinterpret_u16_s8(int8x8_t a)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z)
 Require store(&(a.s0),char,a0) * store(&(a.s1),char,a1) * store(&(a.s2),char,a2) * store(&(a.s3),char,a3) * store(&(a.s4),char,a4) * store(&(a.s5),char,a5) * store(&(a.s6),char,a6) * store(&(a.s7),char,a7)
 Ensure store(&(__return.s0),unsigned short,qm_pack16(a0,a1)) * store(&(__return.s1),unsigned short,qm_pack16(a2,a3)) * store(&(__return.s2),unsigned short,qm_pack16(a4,a5)) * store(&(__return.s3),unsigned short,qm_pack16(a6,a7)) */;
int8x8_t vext_s8(int8x8_t a,int8x8_t b,int k)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) (b0:Z) (b1:Z) (b2:Z) (b3:Z) (b4:Z) (b5:Z) (b6:Z) (b7:Z)
 Require 0<=k && k<=7 && store(&(a.s0),char,a0) * store(&(a.s1),char,a1) * store(&(a.s2),char,a2) * store(&(a.s3),char,a3) * store(&(a.s4),char,a4) * store(&(a.s5),char,a5) * store(&(a.s6),char,a6) * store(&(a.s7),char,a7) * store(&(b.s0),char,b0) * store(&(b.s1),char,b1) * store(&(b.s2),char,b2) * store(&(b.s3),char,b3) * store(&(b.s4),char,b4) * store(&(b.s5),char,b5) * store(&(b.s6),char,b6) * store(&(b.s7),char,b7)
 Ensure store(&(__return.s0),char,qm_ext_pair(a0,a1,a2,a3,a4,a5,a6,a7,b0,b1,b2,b3,b4,b5,b6,b7,k,0)) * store(&(__return.s1),char,qm_ext_pair(a0,a1,a2,a3,a4,a5,a6,a7,b0,b1,b2,b3,b4,b5,b6,b7,k,1)) * store(&(__return.s2),char,qm_ext_pair(a0,a1,a2,a3,a4,a5,a6,a7,b0,b1,b2,b3,b4,b5,b6,b7,k,2)) * store(&(__return.s3),char,qm_ext_pair(a0,a1,a2,a3,a4,a5,a6,a7,b0,b1,b2,b3,b4,b5,b6,b7,k,3)) * store(&(__return.s4),char,qm_ext_pair(a0,a1,a2,a3,a4,a5,a6,a7,b0,b1,b2,b3,b4,b5,b6,b7,k,4)) * store(&(__return.s5),char,qm_ext_pair(a0,a1,a2,a3,a4,a5,a6,a7,b0,b1,b2,b3,b4,b5,b6,b7,k,5)) * store(&(__return.s6),char,qm_ext_pair(a0,a1,a2,a3,a4,a5,a6,a7,b0,b1,b2,b3,b4,b5,b6,b7,k,6)) * store(&(__return.s7),char,qm_ext_pair(a0,a1,a2,a3,a4,a5,a6,a7,b0,b1,b2,b3,b4,b5,b6,b7,k,7)) */;
int8x8_t vld1_s8(const int8_t *p)
/*@ With (M:RDMap)
 Require rd_window(M,p,8) && rd_mem(M)
 Ensure rd_mem(M) * store(&(__return.s0),char,rd_get(M,p+0)) * store(&(__return.s1),char,rd_get(M,p+1)) * store(&(__return.s2),char,rd_get(M,p+2)) * store(&(__return.s3),char,rd_get(M,p+3)) * store(&(__return.s4),char,rd_get(M,p+4)) * store(&(__return.s5),char,rd_get(M,p+5)) * store(&(__return.s6),char,rd_get(M,p+6)) * store(&(__return.s7),char,rd_get(M,p+7)) */;
#endif
