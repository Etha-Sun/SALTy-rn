#ifndef QCP_VLRELU_NEON_PRIMITIVES_H
#define QCP_VLRELU_NEON_PRIMITIVES_H
#include "types.h"
/*@ Extern Coq (bits_of_fp32 : fp32 -> Z) */
float32x4_t vdupq_n_f32(float value)
/*@ Require emp
 Ensure store(&(__return.s0),float,value) * store(&(__return.s1),float,value) * store(&(__return.s2),float,value) * store(&(__return.s3),float,value) */;
int32x4_t vmovq_n_s32(int value)
/*@ Require emp
 Ensure store(&(__return.s0),int,value) * store(&(__return.s1),int,value) * store(&(__return.s2),int,value) * store(&(__return.s3),int,value) */;
float32x4_t vmulq_f32(float32x4_t a,float32x4_t b)
/*@ With (x0:fp32) (x1:fp32) (x2:fp32) (x3:fp32) (y0:fp32) (y1:fp32) (y2:fp32) (y3:fp32)
 Require store(&(a.s0),float,x0) * store(&(a.s1),float,x1) * store(&(a.s2),float,x2) * store(&(a.s3),float,x3) * store(&(b.s0),float,y0) * store(&(b.s1),float,y1) * store(&(b.s2),float,y2) * store(&(b.s3),float,y3)
 Ensure store(&(__return.s0),float,fp32_mul(x0,y0)) * store(&(__return.s1),float,fp32_mul(x1,y1)) * store(&(__return.s2),float,fp32_mul(x2,y2)) * store(&(__return.s3),float,fp32_mul(x3,y3)) */;
int32x4_t vreinterpretq_s32_f32(float32x4_t a)
/*@ With (x0:fp32) (x1:fp32) (x2:fp32) (x3:fp32)
 Require store(&(a.s0),float,x0) * store(&(a.s1),float,x1) * store(&(a.s2),float,x2) * store(&(a.s3),float,x3)
 Ensure store(&(__return.s0),int,vlrelu_signed32(bits_of_fp32(x0))) * store(&(__return.s1),int,vlrelu_signed32(bits_of_fp32(x1))) * store(&(__return.s2),int,vlrelu_signed32(bits_of_fp32(x2))) * store(&(__return.s3),int,vlrelu_signed32(bits_of_fp32(x3))) */;
uint32x4_t vcltq_s32(int32x4_t a,int32x4_t b)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (y0:Z) (y1:Z) (y2:Z) (y3:Z)
 Require store(&(a.s0),int,x0) * store(&(a.s1),int,x1) * store(&(a.s2),int,x2) * store(&(a.s3),int,x3) * store(&(b.s0),int,y0) * store(&(b.s1),int,y1) * store(&(b.s2),int,y2) * store(&(b.s3),int,y3)
 Ensure store(&(__return.s0),unsigned int,vlrelu_compare_mask(x0,y0)) * store(&(__return.s1),unsigned int,vlrelu_compare_mask(x1,y1)) * store(&(__return.s2),unsigned int,vlrelu_compare_mask(x2,y2)) * store(&(__return.s3),unsigned int,vlrelu_compare_mask(x3,y3)) */;
float32x4_t vbslq_f32(uint32x4_t mask,float32x4_t a,float32x4_t b)
/*@ With (m0:Z) (m1:Z) (m2:Z) (m3:Z) (x0:fp32) (x1:fp32) (x2:fp32) (x3:fp32) (y0:fp32) (y1:fp32) (y2:fp32) (y3:fp32)
 Require store(&(mask.s0),unsigned int,m0) * store(&(mask.s1),unsigned int,m1) * store(&(mask.s2),unsigned int,m2) * store(&(mask.s3),unsigned int,m3) * store(&(a.s0),float,x0) * store(&(a.s1),float,x1) * store(&(a.s2),float,x2) * store(&(a.s3),float,x3) * store(&(b.s0),float,y0) * store(&(b.s1),float,y1) * store(&(b.s2),float,y2) * store(&(b.s3),float,y3)
 Ensure store(&(__return.s0),float,vlrelu_bitselect(m0,x0,y0)) * store(&(__return.s1),float,vlrelu_bitselect(m1,x1,y1)) * store(&(__return.s2),float,vlrelu_bitselect(m2,x2,y2)) * store(&(__return.s3),float,vlrelu_bitselect(m3,x3,y3)) */;
#endif
