typedef signed char int8_t;
typedef unsigned char uint8_t;
typedef int int32_t;
typedef unsigned int uint32_t;
typedef unsigned long long size_t;
typedef unsigned long long uintptr_t;
typedef uint8_t vbool16_t;
struct xnn_f32_minmax_params {struct {float min,max;}scalar;};
typedef struct float32x2_t {
 float s0;
 float s1;
} float32x2_t;
typedef struct float32x4_t {
 float s0;
 float s1;
 float s2;
 float s3;
} float32x4_t;
typedef struct uint32x4_t {
 uint32_t s0;
 uint32_t s1;
 uint32_t s2;
 uint32_t s3;
} uint32x4_t;
typedef struct vfloat32m2_t {
 float s0;
 float s1;
 float s2;
 float s3;
 float s4;
 float s5;
 float s6;
 float s7;
} vfloat32m2_t;
/*@ Import Coq Require Import DwChw.Types */
/*@ Import Coq Require Import DwChw.TerminalModel */
/*@ Extern Coq (DwROMap :: *) */
/*@ Extern Coq (dw_load:DwROMap->Z->Z->fp32) (dw_data:DwROMap->Assertion) (dw_get:DwROMap->Z->fp32) (dw_window:DwROMap->Z->Z->Prop)
 (dw_fp2:fp32->fp32->Z->fp32) (dw_fp4:fp32->fp32->fp32->fp32->Z->fp32) (dw_u4:Z->Z->Z->Z->Z->Z)
 (dw_arm_ext:(Z->fp32)->(Z->fp32)->Z->Z->fp32) (dw_arm_fma:fp32->fp32->fp32->fp32)
 (dw_arm_max:fp32->fp32->fp32) (dw_arm_min:fp32->fp32->fp32)
 (dw_arm_and:(Z->Z)->(Z->Z)->Z->Z) (bits_of_fp32:fp32->Z) (fp32_of_bits:Z->fp32) */
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
/*@ With (F:DwROMap) Require dw_window(F,p,2) && dw_data(F) Ensure dw_data(F) * store(&(__return.s0),float,dw_load(F,p,0)) * store(&(__return.s1),float,dw_load(F,p,1)) */;
float32x4_t vld1q_f32(const float *p)
/*@ With (F:DwROMap) Require dw_window(F,p,4) && dw_data(F) Ensure dw_data(F) * store(&(__return.s0),float,dw_load(F,p,0)) * store(&(__return.s1),float,dw_load(F,p,1)) * store(&(__return.s2),float,dw_load(F,p,2)) * store(&(__return.s3),float,dw_load(F,p,3)) */;
uint32x4_t vld1q_u32(const uint32_t *p)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) Require store(p+0,unsigned int,a0) * store(p+1,unsigned int,a1) * store(p+2,unsigned int,a2) * store(p+3,unsigned int,a3) Ensure store(p+0,unsigned int,a0) * store(p+1,unsigned int,a1) * store(p+2,unsigned int,a2) * store(p+3,unsigned int,a3) * store(&(__return.s0),unsigned int,a0) * store(&(__return.s1),unsigned int,a1) * store(&(__return.s2),unsigned int,a2) * store(&(__return.s3),unsigned int,a3) */;
void vst1q_f32(float *p,float32x4_t a)
/*@ With (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32) Require undef_data_at(p+0,float) * undef_data_at(p+1,float) * undef_data_at(p+2,float) * undef_data_at(p+3,float) * store(&(a.s0),float,a0) * store(&(a.s1),float,a1) * store(&(a.s2),float,a2) * store(&(a.s3),float,a3) Ensure store(p+0,float,a0) * store(p+1,float,a1) * store(p+2,float,a2) * store(p+3,float,a3) */;
void vst1_f32(float *p,float32x2_t a)
/*@ With (a0:fp32) (a1:fp32) Require undef_data_at(p+0,float) * undef_data_at(p+1,float) * store(&(a.s0),float,a0) * store(&(a.s1),float,a1) Ensure store(p+0,float,a0) * store(p+1,float,a1) */;
void vst1_lane_f32(float *p,float32x2_t a,int lane)
/*@ With (a0:fp32) (a1:fp32) Require lane==0 && undef_data_at(p+0,float) * store(&(a.s0),float,a0) * store(&(a.s1),float,a1) Ensure store(p+0,float,a0) */;
float32x2_t dw_n_vget_low_f32(const float32x4_t *p_a)
/*@ With (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32)
 Require store(&(p_a->s0),float,a0) * store(&(p_a->s1),float,a1) * store(&(p_a->s2),float,a2) * store(&(p_a->s3),float,a3)
 Ensure store(&(p_a->s0),float,a0) * store(&(p_a->s1),float,a1) * store(&(p_a->s2),float,a2) * store(&(p_a->s3),float,a3) * store(&(__return.s0),float,a0) * store(&(__return.s1),float,a1) */;
float32x2_t dw_n_vget_high_f32(const float32x4_t *p_a)
/*@ With (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32)
 Require store(&(p_a->s0),float,a0) * store(&(p_a->s1),float,a1) * store(&(p_a->s2),float,a2) * store(&(p_a->s3),float,a3)
 Ensure store(&(p_a->s0),float,a0) * store(&(p_a->s1),float,a1) * store(&(p_a->s2),float,a2) * store(&(p_a->s3),float,a3) * store(&(__return.s0),float,a2) * store(&(__return.s1),float,a3) */;
float32x4_t dw_n_vdupq_lane_f32(const float32x2_t *p_a,int lane)
/*@ With (a0:fp32) (a1:fp32)
 Require 0<=lane && lane<2 && store(&(p_a->s0),float,a0) * store(&(p_a->s1),float,a1)
 Ensure store(&(p_a->s0),float,a0) * store(&(p_a->s1),float,a1) * store(&(__return.s0),float,dw_fp2(a0,a1,lane)) * store(&(__return.s1),float,dw_fp2(a0,a1,lane)) * store(&(__return.s2),float,dw_fp2(a0,a1,lane)) * store(&(__return.s3),float,dw_fp2(a0,a1,lane)) */;
float32x4_t dw_n_vextq_f32(const float32x4_t *p_a,const float32x4_t *p_b,int k)
/*@ With (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32) (b0:fp32) (b1:fp32) (b2:fp32) (b3:fp32)
 Require 0<=k && k<4 && store(&(p_a->s0),float,a0) * store(&(p_a->s1),float,a1) * store(&(p_a->s2),float,a2) * store(&(p_a->s3),float,a3) * store(&(p_b->s0),float,b0) * store(&(p_b->s1),float,b1) * store(&(p_b->s2),float,b2) * store(&(p_b->s3),float,b3)
 Ensure store(&(p_a->s0),float,a0) * store(&(p_a->s1),float,a1) * store(&(p_a->s2),float,a2) * store(&(p_a->s3),float,a3) * store(&(p_b->s0),float,b0) * store(&(p_b->s1),float,b1) * store(&(p_b->s2),float,b2) * store(&(p_b->s3),float,b3) * store(&(__return.s0),float,dw_arm_ext(dw_fp4(a0,a1,a2,a3),dw_fp4(b0,b1,b2,b3),k,0)) * store(&(__return.s1),float,dw_arm_ext(dw_fp4(a0,a1,a2,a3),dw_fp4(b0,b1,b2,b3),k,1)) * store(&(__return.s2),float,dw_arm_ext(dw_fp4(a0,a1,a2,a3),dw_fp4(b0,b1,b2,b3),k,2)) * store(&(__return.s3),float,dw_arm_ext(dw_fp4(a0,a1,a2,a3),dw_fp4(b0,b1,b2,b3),k,3)) */;
float32x4_t dw_n_vfmaq_lane_f32(const float32x4_t *p_c,const float32x4_t *p_a,const float32x2_t *p_b,int lane)
/*@ With (c0:fp32) (c1:fp32) (c2:fp32) (c3:fp32) (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32) (b0:fp32) (b1:fp32)
 Require 0<=lane && lane<2 && store(&(p_c->s0),float,c0) * store(&(p_c->s1),float,c1) * store(&(p_c->s2),float,c2) * store(&(p_c->s3),float,c3) * store(&(p_a->s0),float,a0) * store(&(p_a->s1),float,a1) * store(&(p_a->s2),float,a2) * store(&(p_a->s3),float,a3) * store(&(p_b->s0),float,b0) * store(&(p_b->s1),float,b1)
 Ensure store(&(p_c->s0),float,c0) * store(&(p_c->s1),float,c1) * store(&(p_c->s2),float,c2) * store(&(p_c->s3),float,c3) * store(&(p_a->s0),float,a0) * store(&(p_a->s1),float,a1) * store(&(p_a->s2),float,a2) * store(&(p_a->s3),float,a3) * store(&(p_b->s0),float,b0) * store(&(p_b->s1),float,b1) * store(&(__return.s0),float,dw_arm_fma(c0,a0,dw_fp2(b0,b1,lane))) * store(&(__return.s1),float,dw_arm_fma(c1,a1,dw_fp2(b0,b1,lane))) * store(&(__return.s2),float,dw_arm_fma(c2,a2,dw_fp2(b0,b1,lane))) * store(&(__return.s3),float,dw_arm_fma(c3,a3,dw_fp2(b0,b1,lane))) */;
float32x4_t dw_n_vmaxq_f32(const float32x4_t *p_a,const float32x4_t *p_b)
/*@ With (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32) (b0:fp32) (b1:fp32) (b2:fp32) (b3:fp32)
 Require store(&(p_a->s0),float,a0) * store(&(p_a->s1),float,a1) * store(&(p_a->s2),float,a2) * store(&(p_a->s3),float,a3) * store(&(p_b->s0),float,b0) * store(&(p_b->s1),float,b1) * store(&(p_b->s2),float,b2) * store(&(p_b->s3),float,b3)
 Ensure store(&(p_a->s0),float,a0) * store(&(p_a->s1),float,a1) * store(&(p_a->s2),float,a2) * store(&(p_a->s3),float,a3) * store(&(p_b->s0),float,b0) * store(&(p_b->s1),float,b1) * store(&(p_b->s2),float,b2) * store(&(p_b->s3),float,b3) * store(&(__return.s0),float,dw_arm_max(a0,b0)) * store(&(__return.s1),float,dw_arm_max(a1,b1)) * store(&(__return.s2),float,dw_arm_max(a2,b2)) * store(&(__return.s3),float,dw_arm_max(a3,b3)) */;
float32x4_t dw_n_vminq_f32(const float32x4_t *p_a,const float32x4_t *p_b)
/*@ With (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32) (b0:fp32) (b1:fp32) (b2:fp32) (b3:fp32)
 Require store(&(p_a->s0),float,a0) * store(&(p_a->s1),float,a1) * store(&(p_a->s2),float,a2) * store(&(p_a->s3),float,a3) * store(&(p_b->s0),float,b0) * store(&(p_b->s1),float,b1) * store(&(p_b->s2),float,b2) * store(&(p_b->s3),float,b3)
 Ensure store(&(p_a->s0),float,a0) * store(&(p_a->s1),float,a1) * store(&(p_a->s2),float,a2) * store(&(p_a->s3),float,a3) * store(&(p_b->s0),float,b0) * store(&(p_b->s1),float,b1) * store(&(p_b->s2),float,b2) * store(&(p_b->s3),float,b3) * store(&(__return.s0),float,dw_arm_min(a0,b0)) * store(&(__return.s1),float,dw_arm_min(a1,b1)) * store(&(__return.s2),float,dw_arm_min(a2,b2)) * store(&(__return.s3),float,dw_arm_min(a3,b3)) */;
uint32x4_t dw_n_vandq_u32(const uint32x4_t *p_a,const uint32x4_t *p_b)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (b0:Z) (b1:Z) (b2:Z) (b3:Z)
 Require store(&(p_a->s0),unsigned int,a0) * store(&(p_a->s1),unsigned int,a1) * store(&(p_a->s2),unsigned int,a2) * store(&(p_a->s3),unsigned int,a3) * store(&(p_b->s0),unsigned int,b0) * store(&(p_b->s1),unsigned int,b1) * store(&(p_b->s2),unsigned int,b2) * store(&(p_b->s3),unsigned int,b3)
 Ensure store(&(p_a->s0),unsigned int,a0) * store(&(p_a->s1),unsigned int,a1) * store(&(p_a->s2),unsigned int,a2) * store(&(p_a->s3),unsigned int,a3) * store(&(p_b->s0),unsigned int,b0) * store(&(p_b->s1),unsigned int,b1) * store(&(p_b->s2),unsigned int,b2) * store(&(p_b->s3),unsigned int,b3) * store(&(__return.s0),unsigned int,dw_arm_and(dw_u4(a0,a1,a2,a3),dw_u4(b0,b1,b2,b3),0)) * store(&(__return.s1),unsigned int,dw_arm_and(dw_u4(a0,a1,a2,a3),dw_u4(b0,b1,b2,b3),1)) * store(&(__return.s2),unsigned int,dw_arm_and(dw_u4(a0,a1,a2,a3),dw_u4(b0,b1,b2,b3),2)) * store(&(__return.s3),unsigned int,dw_arm_and(dw_u4(a0,a1,a2,a3),dw_u4(b0,b1,b2,b3),3)) */;
uint32x4_t dw_n_vreinterpretq_u32_f32(const float32x4_t *p_a)
/*@ With (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32)
 Require store(&(p_a->s0),float,a0) * store(&(p_a->s1),float,a1) * store(&(p_a->s2),float,a2) * store(&(p_a->s3),float,a3)
 Ensure store(&(p_a->s0),float,a0) * store(&(p_a->s1),float,a1) * store(&(p_a->s2),float,a2) * store(&(p_a->s3),float,a3) * store(&(__return.s0),unsigned int,bits_of_fp32(a0)) * store(&(__return.s1),unsigned int,bits_of_fp32(a1)) * store(&(__return.s2),unsigned int,bits_of_fp32(a2)) * store(&(__return.s3),unsigned int,bits_of_fp32(a3)) */;
float32x4_t dw_n_vreinterpretq_f32_u32(const uint32x4_t *p_a)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z)
 Require store(&(p_a->s0),unsigned int,a0) * store(&(p_a->s1),unsigned int,a1) * store(&(p_a->s2),unsigned int,a2) * store(&(p_a->s3),unsigned int,a3)
 Ensure store(&(p_a->s0),unsigned int,a0) * store(&(p_a->s1),unsigned int,a1) * store(&(p_a->s2),unsigned int,a2) * store(&(p_a->s3),unsigned int,a3) * store(&(__return.s0),float,fp32_of_bits(a0)) * store(&(__return.s1),float,fp32_of_bits(a1)) * store(&(__return.s2),float,fp32_of_bits(a2)) * store(&(__return.s3),float,fp32_of_bits(a3)) */;
void dw_n_vst1q_f32(float *p,const float32x4_t *p_a)
/*@ With (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32) Require undef_data_at(p+0,float) * undef_data_at(p+1,float) * undef_data_at(p+2,float) * undef_data_at(p+3,float) * store(&(p_a->s0),float,a0) * store(&(p_a->s1),float,a1) * store(&(p_a->s2),float,a2) * store(&(p_a->s3),float,a3) Ensure store(p+0,float,a0) * store(p+1,float,a1) * store(p+2,float,a2) * store(p+3,float,a3) * store(&(p_a->s0),float,a0) * store(&(p_a->s1),float,a1) * store(&(p_a->s2),float,a2) * store(&(p_a->s3),float,a3) */;
void dw_n_vst1_f32(float *p,const float32x2_t *p_a)
/*@ With (a0:fp32) (a1:fp32) Require undef_data_at(p+0,float) * undef_data_at(p+1,float) * store(&(p_a->s0),float,a0) * store(&(p_a->s1),float,a1) Ensure store(p+0,float,a0) * store(p+1,float,a1) * store(&(p_a->s0),float,a0) * store(&(p_a->s1),float,a1) */;
void dw_n_vst1_lane_f32(float *p,const float32x2_t *p_a,int lane)
/*@ With (a0:fp32) (a1:fp32) Require lane==0 && undef_data_at(p+0,float) * store(&(p_a->s0),float,a0) * store(&(p_a->s1),float,a1) Ensure store(p+0,float,a0) * store(&(p_a->s0),float,a0) * store(&(p_a->s1),float,a1) */;
float32x2_t dw_n_vget_low_f32(const float32x4_t *p_a)
/*@ With (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32)
 Require store(&(p_a->s0),float,a0) * store(&(p_a->s1),float,a1) * store(&(p_a->s2),float,a2) * store(&(p_a->s3),float,a3)
 Ensure store(&(p_a->s0),float,a0) * store(&(p_a->s1),float,a1) * store(&(p_a->s2),float,a2) * store(&(p_a->s3),float,a3) * store(&(__return.s0),float,a0) * store(&(__return.s1),float,a1) */
{
 float32x4_t a=*p_a;
 return vget_low_f32(a) /*@ where a=&a,a0=a.s0,a1=a.s1,a2=a.s2,a3=a.s3 */;
}
float32x2_t dw_n_vget_high_f32(const float32x4_t *p_a)
/*@ With (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32)
 Require store(&(p_a->s0),float,a0) * store(&(p_a->s1),float,a1) * store(&(p_a->s2),float,a2) * store(&(p_a->s3),float,a3)
 Ensure store(&(p_a->s0),float,a0) * store(&(p_a->s1),float,a1) * store(&(p_a->s2),float,a2) * store(&(p_a->s3),float,a3) * store(&(__return.s0),float,a2) * store(&(__return.s1),float,a3) */
{
 float32x4_t a=*p_a;
 return vget_high_f32(a) /*@ where a=&a,a0=a.s0,a1=a.s1,a2=a.s2,a3=a.s3 */;
}
float32x4_t dw_n_vdupq_lane_f32(const float32x2_t *p_a,int lane)
/*@ With (a0:fp32) (a1:fp32)
 Require 0<=lane && lane<2 && store(&(p_a->s0),float,a0) * store(&(p_a->s1),float,a1)
 Ensure store(&(p_a->s0),float,a0) * store(&(p_a->s1),float,a1) * store(&(__return.s0),float,dw_fp2(a0,a1,lane)) * store(&(__return.s1),float,dw_fp2(a0,a1,lane)) * store(&(__return.s2),float,dw_fp2(a0,a1,lane)) * store(&(__return.s3),float,dw_fp2(a0,a1,lane)) */
{
 float32x2_t a=*p_a;
 return vdupq_lane_f32(a,lane) /*@ where a=&a,a0=a.s0,a1=a.s1 */;
}
float32x4_t dw_n_vextq_f32(const float32x4_t *p_a,const float32x4_t *p_b,int k)
/*@ With (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32) (b0:fp32) (b1:fp32) (b2:fp32) (b3:fp32)
 Require 0<=k && k<4 && store(&(p_a->s0),float,a0) * store(&(p_a->s1),float,a1) * store(&(p_a->s2),float,a2) * store(&(p_a->s3),float,a3) * store(&(p_b->s0),float,b0) * store(&(p_b->s1),float,b1) * store(&(p_b->s2),float,b2) * store(&(p_b->s3),float,b3)
 Ensure store(&(p_a->s0),float,a0) * store(&(p_a->s1),float,a1) * store(&(p_a->s2),float,a2) * store(&(p_a->s3),float,a3) * store(&(p_b->s0),float,b0) * store(&(p_b->s1),float,b1) * store(&(p_b->s2),float,b2) * store(&(p_b->s3),float,b3) * store(&(__return.s0),float,dw_arm_ext(dw_fp4(a0,a1,a2,a3),dw_fp4(b0,b1,b2,b3),k,0)) * store(&(__return.s1),float,dw_arm_ext(dw_fp4(a0,a1,a2,a3),dw_fp4(b0,b1,b2,b3),k,1)) * store(&(__return.s2),float,dw_arm_ext(dw_fp4(a0,a1,a2,a3),dw_fp4(b0,b1,b2,b3),k,2)) * store(&(__return.s3),float,dw_arm_ext(dw_fp4(a0,a1,a2,a3),dw_fp4(b0,b1,b2,b3),k,3)) */
{
 float32x4_t a=*p_a;
 float32x4_t b=*p_b;
 return vextq_f32(a,b,k) /*@ where a=&a,b=&b,a0=a.s0,a1=a.s1,a2=a.s2,a3=a.s3,b0=b.s0,b1=b.s1,b2=b.s2,b3=b.s3 */;
}
float32x4_t dw_n_vfmaq_lane_f32(const float32x4_t *p_c,const float32x4_t *p_a,const float32x2_t *p_b,int lane)
/*@ With (c0:fp32) (c1:fp32) (c2:fp32) (c3:fp32) (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32) (b0:fp32) (b1:fp32)
 Require 0<=lane && lane<2 && store(&(p_c->s0),float,c0) * store(&(p_c->s1),float,c1) * store(&(p_c->s2),float,c2) * store(&(p_c->s3),float,c3) * store(&(p_a->s0),float,a0) * store(&(p_a->s1),float,a1) * store(&(p_a->s2),float,a2) * store(&(p_a->s3),float,a3) * store(&(p_b->s0),float,b0) * store(&(p_b->s1),float,b1)
 Ensure store(&(p_c->s0),float,c0) * store(&(p_c->s1),float,c1) * store(&(p_c->s2),float,c2) * store(&(p_c->s3),float,c3) * store(&(p_a->s0),float,a0) * store(&(p_a->s1),float,a1) * store(&(p_a->s2),float,a2) * store(&(p_a->s3),float,a3) * store(&(p_b->s0),float,b0) * store(&(p_b->s1),float,b1) * store(&(__return.s0),float,dw_arm_fma(c0,a0,dw_fp2(b0,b1,lane))) * store(&(__return.s1),float,dw_arm_fma(c1,a1,dw_fp2(b0,b1,lane))) * store(&(__return.s2),float,dw_arm_fma(c2,a2,dw_fp2(b0,b1,lane))) * store(&(__return.s3),float,dw_arm_fma(c3,a3,dw_fp2(b0,b1,lane))) */
{
 float32x4_t c=*p_c;
 float32x4_t a=*p_a;
 float32x2_t b=*p_b;
 return vfmaq_lane_f32(c,a,b,lane) /*@ where c=&c,a=&a,b=&b,c0=c.s0,c1=c.s1,c2=c.s2,c3=c.s3,a0=a.s0,a1=a.s1,a2=a.s2,a3=a.s3,b0=b.s0,b1=b.s1 */;
}
float32x4_t dw_n_vmaxq_f32(const float32x4_t *p_a,const float32x4_t *p_b)
/*@ With (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32) (b0:fp32) (b1:fp32) (b2:fp32) (b3:fp32)
 Require store(&(p_a->s0),float,a0) * store(&(p_a->s1),float,a1) * store(&(p_a->s2),float,a2) * store(&(p_a->s3),float,a3) * store(&(p_b->s0),float,b0) * store(&(p_b->s1),float,b1) * store(&(p_b->s2),float,b2) * store(&(p_b->s3),float,b3)
 Ensure store(&(p_a->s0),float,a0) * store(&(p_a->s1),float,a1) * store(&(p_a->s2),float,a2) * store(&(p_a->s3),float,a3) * store(&(p_b->s0),float,b0) * store(&(p_b->s1),float,b1) * store(&(p_b->s2),float,b2) * store(&(p_b->s3),float,b3) * store(&(__return.s0),float,dw_arm_max(a0,b0)) * store(&(__return.s1),float,dw_arm_max(a1,b1)) * store(&(__return.s2),float,dw_arm_max(a2,b2)) * store(&(__return.s3),float,dw_arm_max(a3,b3)) */
{
 float32x4_t a=*p_a;
 float32x4_t b=*p_b;
 return vmaxq_f32(a,b) /*@ where a=&a,b=&b,a0=a.s0,a1=a.s1,a2=a.s2,a3=a.s3,b0=b.s0,b1=b.s1,b2=b.s2,b3=b.s3 */;
}
float32x4_t dw_n_vminq_f32(const float32x4_t *p_a,const float32x4_t *p_b)
/*@ With (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32) (b0:fp32) (b1:fp32) (b2:fp32) (b3:fp32)
 Require store(&(p_a->s0),float,a0) * store(&(p_a->s1),float,a1) * store(&(p_a->s2),float,a2) * store(&(p_a->s3),float,a3) * store(&(p_b->s0),float,b0) * store(&(p_b->s1),float,b1) * store(&(p_b->s2),float,b2) * store(&(p_b->s3),float,b3)
 Ensure store(&(p_a->s0),float,a0) * store(&(p_a->s1),float,a1) * store(&(p_a->s2),float,a2) * store(&(p_a->s3),float,a3) * store(&(p_b->s0),float,b0) * store(&(p_b->s1),float,b1) * store(&(p_b->s2),float,b2) * store(&(p_b->s3),float,b3) * store(&(__return.s0),float,dw_arm_min(a0,b0)) * store(&(__return.s1),float,dw_arm_min(a1,b1)) * store(&(__return.s2),float,dw_arm_min(a2,b2)) * store(&(__return.s3),float,dw_arm_min(a3,b3)) */
{
 float32x4_t a=*p_a;
 float32x4_t b=*p_b;
 return vminq_f32(a,b) /*@ where a=&a,b=&b,a0=a.s0,a1=a.s1,a2=a.s2,a3=a.s3,b0=b.s0,b1=b.s1,b2=b.s2,b3=b.s3 */;
}
uint32x4_t dw_n_vandq_u32(const uint32x4_t *p_a,const uint32x4_t *p_b)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (b0:Z) (b1:Z) (b2:Z) (b3:Z)
 Require store(&(p_a->s0),unsigned int,a0) * store(&(p_a->s1),unsigned int,a1) * store(&(p_a->s2),unsigned int,a2) * store(&(p_a->s3),unsigned int,a3) * store(&(p_b->s0),unsigned int,b0) * store(&(p_b->s1),unsigned int,b1) * store(&(p_b->s2),unsigned int,b2) * store(&(p_b->s3),unsigned int,b3)
 Ensure store(&(p_a->s0),unsigned int,a0) * store(&(p_a->s1),unsigned int,a1) * store(&(p_a->s2),unsigned int,a2) * store(&(p_a->s3),unsigned int,a3) * store(&(p_b->s0),unsigned int,b0) * store(&(p_b->s1),unsigned int,b1) * store(&(p_b->s2),unsigned int,b2) * store(&(p_b->s3),unsigned int,b3) * store(&(__return.s0),unsigned int,dw_arm_and(dw_u4(a0,a1,a2,a3),dw_u4(b0,b1,b2,b3),0)) * store(&(__return.s1),unsigned int,dw_arm_and(dw_u4(a0,a1,a2,a3),dw_u4(b0,b1,b2,b3),1)) * store(&(__return.s2),unsigned int,dw_arm_and(dw_u4(a0,a1,a2,a3),dw_u4(b0,b1,b2,b3),2)) * store(&(__return.s3),unsigned int,dw_arm_and(dw_u4(a0,a1,a2,a3),dw_u4(b0,b1,b2,b3),3)) */
{
 uint32x4_t a=*p_a;
 uint32x4_t b=*p_b;
 return vandq_u32(a,b) /*@ where a=&a,b=&b,a0=a.s0,a1=a.s1,a2=a.s2,a3=a.s3,b0=b.s0,b1=b.s1,b2=b.s2,b3=b.s3 */;
}
uint32x4_t dw_n_vreinterpretq_u32_f32(const float32x4_t *p_a)
/*@ With (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32)
 Require store(&(p_a->s0),float,a0) * store(&(p_a->s1),float,a1) * store(&(p_a->s2),float,a2) * store(&(p_a->s3),float,a3)
 Ensure store(&(p_a->s0),float,a0) * store(&(p_a->s1),float,a1) * store(&(p_a->s2),float,a2) * store(&(p_a->s3),float,a3) * store(&(__return.s0),unsigned int,bits_of_fp32(a0)) * store(&(__return.s1),unsigned int,bits_of_fp32(a1)) * store(&(__return.s2),unsigned int,bits_of_fp32(a2)) * store(&(__return.s3),unsigned int,bits_of_fp32(a3)) */
{
 float32x4_t a=*p_a;
 return vreinterpretq_u32_f32(a) /*@ where a=&a,a0=a.s0,a1=a.s1,a2=a.s2,a3=a.s3 */;
}
float32x4_t dw_n_vreinterpretq_f32_u32(const uint32x4_t *p_a)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z)
 Require store(&(p_a->s0),unsigned int,a0) * store(&(p_a->s1),unsigned int,a1) * store(&(p_a->s2),unsigned int,a2) * store(&(p_a->s3),unsigned int,a3)
 Ensure store(&(p_a->s0),unsigned int,a0) * store(&(p_a->s1),unsigned int,a1) * store(&(p_a->s2),unsigned int,a2) * store(&(p_a->s3),unsigned int,a3) * store(&(__return.s0),float,fp32_of_bits(a0)) * store(&(__return.s1),float,fp32_of_bits(a1)) * store(&(__return.s2),float,fp32_of_bits(a2)) * store(&(__return.s3),float,fp32_of_bits(a3)) */
{
 uint32x4_t a=*p_a;
 return vreinterpretq_f32_u32(a) /*@ where a=&a,a0=a.s0,a1=a.s1,a2=a.s2,a3=a.s3 */;
}
void dw_n_vst1q_f32(float *p,const float32x4_t *p_a)
/*@ With (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32) Require undef_data_at(p+0,float) * undef_data_at(p+1,float) * undef_data_at(p+2,float) * undef_data_at(p+3,float) * store(&(p_a->s0),float,a0) * store(&(p_a->s1),float,a1) * store(&(p_a->s2),float,a2) * store(&(p_a->s3),float,a3) Ensure store(p+0,float,a0) * store(p+1,float,a1) * store(p+2,float,a2) * store(p+3,float,a3) * store(&(p_a->s0),float,a0) * store(&(p_a->s1),float,a1) * store(&(p_a->s2),float,a2) * store(&(p_a->s3),float,a3) */
{ p[0]=p_a->s0; p[1]=p_a->s1; p[2]=p_a->s2; p[3]=p_a->s3; }
void dw_n_vst1_f32(float *p,const float32x2_t *p_a)
/*@ With (a0:fp32) (a1:fp32) Require undef_data_at(p+0,float) * undef_data_at(p+1,float) * store(&(p_a->s0),float,a0) * store(&(p_a->s1),float,a1) Ensure store(p+0,float,a0) * store(p+1,float,a1) * store(&(p_a->s0),float,a0) * store(&(p_a->s1),float,a1) */
{ p[0]=p_a->s0; p[1]=p_a->s1; }
void dw_n_vst1_lane_f32(float *p,const float32x2_t *p_a,int lane)
/*@ With (a0:fp32) (a1:fp32) Require lane==0 && undef_data_at(p+0,float) * store(&(p_a->s0),float,a0) * store(&(p_a->s1),float,a1) Ensure store(p+0,float,a0) * store(&(p_a->s0),float,a0) * store(&(p_a->s1),float,a1) */
{ p[0]=p_a->s0; }
