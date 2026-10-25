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
/*@ Import Coq Require Import DwChw.Types */
/*@ Import Coq Require Import DwChw.ControlModel */
/*@ Extern Coq (dw_doz_model:Z -> Z -> Z) (unsigned_last_nbits:Z -> Z -> Z) */
uint32x4_t dw_mask_words(const int32_t *p)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z)
 Require store(p+0,int,a0) * store(p+1,int,a1) * store(p+2,int,a2) * store(p+3,int,a3)
 Ensure store(p+0,int,a0) * store(p+1,int,a1) * store(p+2,int,a2) * store(p+3,int,a3) * store(&(__return.s0),unsigned int,unsigned_last_nbits(a0,32)) * store(&(__return.s1),unsigned int,unsigned_last_nbits(a1,32)) * store(&(__return.s2),unsigned int,unsigned_last_nbits(a2,32)) * store(&(__return.s3),unsigned int,unsigned_last_nbits(a3,32)) */;
void dw_assert(int b)
/*@ Require b!=0 && emp Ensure emp */;
size_t dw_round_up_po2(size_t n,size_t q)
/*@ Require 0<=n && q==16 && n<=18446744073709551600 && emp
 Ensure __return==((n+15)/16)*16 && emp */;
size_t dw_doz(size_t n,size_t q)
/*@ Require 0<=n && n<=18446744073709551615 && q==3 && emp
 Ensure __return==dw_doz_model(n,q) && emp */;
/*@ Import Coq Require Import DwChw.Types */
/*@ Import Coq Require Import DwChw.MemoryFacts DwChw.OutputInterface */
/*@ Extern Coq (DwROMap :: *) (DwOutput :: *) */
/*@ Extern Coq (dw_data:DwROMap->Assertion) (dw_get:DwROMap->Z->fp32) (dw_present:DwROMap->Z->Prop) (dw_pop:DwROMap->Z->DwROMap)
 (dw_same:fp32->fp32->Prop) (dw_distinct:list Z->Prop)
 (dw_output:list Z->DwOutput->Assertion) (dw_write_window:list Z->Z->Z->Prop)
 (dw_output_put:DwOutput->Z->fp32->DwOutput) (dw_write_values:DwOutput->Z->list fp32->DwOutput)
 (dw_pack2:fp32->fp32->list fp32) (dw_pack4:fp32->fp32->fp32->fp32->list fp32) */
/*@ include strategies "../proof/c/dw_maps.strategies" */
/*@ include strategies "../proof/c/dw_output.strategies" */
float dw_read_scalar(const float *p)
/*@ With (F:DwROMap) Require dw_present(F,p) && dw_data(F)
 Ensure dw_same(__return,dw_get(F,p)) && dw_data(F) */;
/*@ Import Coq Require Import DwChw.NeonVectorPixelModel */
/*@ Extern Coq (dw_neon_vector_pixel:DwROMap->Z->(Z->fp32)->(Z->fp32)->(Z->fp32)->fp32->fp32->fp32->fp32->fp32->fp32->fp32->fp32->Z->fp32) (dw_neon_vector_match4:fp32->fp32->fp32->fp32->(Z->fp32)->Prop) */
float32x4_t dw_neon_pixel_compute(const float32x4_t*p0,const float32x4_t*p1,const float32x4_t*p2,const float*weights,float prev0,float prev1,float prev2,float next0,float next1,float next2,float lo,float hi)
/*@ With(F:DwROMap) (a00:fp32) (a01:fp32) (a02:fp32) (a03:fp32) (a10:fp32) (a11:fp32) (a12:fp32) (a13:fp32) (a20:fp32) (a21:fp32) (a22:fp32) (a23:fp32) Require dw_window(F,weights,10) && dw_data(F) * store(&(p0->s0),float,a00) * store(&(p0->s1),float,a01) * store(&(p0->s2),float,a02) * store(&(p0->s3),float,a03) * store(&(p1->s0),float,a10) * store(&(p1->s1),float,a11) * store(&(p1->s2),float,a12) * store(&(p1->s3),float,a13) * store(&(p2->s0),float,a20) * store(&(p2->s1),float,a21) * store(&(p2->s2),float,a22) * store(&(p2->s3),float,a23) Ensure exists (r0:fp32) (r1:fp32) (r2:fp32) (r3:fp32),dw_neon_vector_match4(r0,r1,r2,r3,dw_neon_vector_pixel(F,weights,dw_fp4(a00,a01,a02,a03),dw_fp4(a10,a11,a12,a13),dw_fp4(a20,a21,a22,a23),prev0,prev1,prev2,next0,next1,next2,lo,hi)) && dw_data(F) * store(&(p0->s0),float,a00) * store(&(p0->s1),float,a01) * store(&(p0->s2),float,a02) * store(&(p0->s3),float,a03) * store(&(p1->s0),float,a10) * store(&(p1->s1),float,a11) * store(&(p1->s2),float,a12) * store(&(p1->s3),float,a13) * store(&(p2->s0),float,a20) * store(&(p2->s1),float,a21) * store(&(p2->s2),float,a22) * store(&(p2->s3),float,a23) * store(&(__return.s0),float,r0) * store(&(__return.s1),float,r1) * store(&(__return.s2),float,r2) * store(&(__return.s3),float,r3) */
{
float32x4_t c0=*p0;float32x4_t c1=*p1;float32x4_t c2=*p2;
float32x4_t out=vdupq_n_f32(dw_read_scalar(&(weights[0])) /*@ where F=F */);
{const float32x4_t dw_w2dup=vdupq_n_f32(dw_read_scalar(&(weights[2])) /*@ where F=F */);
const float32x2_t dw_w2lane=dw_n_vget_low_f32(&(dw_w2dup)) /*@ where p_a=&dw_w2dup,a0=dw_w2dup.s0,a1=dw_w2dup.s1,a2=dw_w2dup.s2,a3=dw_w2dup.s3 */;
out=dw_n_vfmaq_lane_f32(&(out),&(c0),&(dw_w2lane),(0)) /*@ where p_c=&out,c0=out.s0,c1=out.s1,c2=out.s2,c3=out.s3,p_a=&c0,a0=c0.s0,a1=c0.s1,a2=c0.s2,a3=c0.s3,p_b=&dw_w2lane,b0=dw_w2lane.s0,b1=dw_w2lane.s1 */;}
{const float32x4_t dw_w5dup=vdupq_n_f32(dw_read_scalar(&(weights[5])) /*@ where F=F */);
const float32x2_t dw_w5lane=dw_n_vget_low_f32(&(dw_w5dup)) /*@ where p_a=&dw_w5dup,a0=dw_w5dup.s0,a1=dw_w5dup.s1,a2=dw_w5dup.s2,a3=dw_w5dup.s3 */;
out=dw_n_vfmaq_lane_f32(&(out),&(c1),&(dw_w5lane),(0)) /*@ where p_c=&out,c0=out.s0,c1=out.s1,c2=out.s2,c3=out.s3,p_a=&c1,a0=c1.s0,a1=c1.s1,a2=c1.s2,a3=c1.s3,p_b=&dw_w5lane,b0=dw_w5lane.s0,b1=dw_w5lane.s1 */;}
{const float32x4_t dw_w8dup=vdupq_n_f32(dw_read_scalar(&(weights[8])) /*@ where F=F */);
const float32x2_t dw_w8lane=dw_n_vget_low_f32(&(dw_w8dup)) /*@ where p_a=&dw_w8dup,a0=dw_w8dup.s0,a1=dw_w8dup.s1,a2=dw_w8dup.s2,a3=dw_w8dup.s3 */;
out=dw_n_vfmaq_lane_f32(&(out),&(c2),&(dw_w8lane),(0)) /*@ where p_c=&out,c0=out.s0,c1=out.s1,c2=out.s2,c3=out.s3,p_a=&c2,a0=c2.s0,a1=c2.s1,a2=c2.s2,a3=c2.s3,p_b=&dw_w8lane,b0=dw_w8lane.s0,b1=dw_w8lane.s1 */;}
{const float32x4_t dw_left0dup=vdupq_n_f32(prev0);
const float32x4_t dw_left0=dw_n_vextq_f32(&(dw_left0dup),&(c0),(3)) /*@ where p_a=&dw_left0dup,a0=dw_left0dup.s0,a1=dw_left0dup.s1,a2=dw_left0dup.s2,a3=dw_left0dup.s3,p_b=&c0,b0=c0.s0,b1=c0.s1,b2=c0.s2,b3=c0.s3 */;
{const float32x4_t dw_w1dup=vdupq_n_f32(dw_read_scalar(&(weights[1])) /*@ where F=F */);
const float32x2_t dw_w1lane=dw_n_vget_low_f32(&(dw_w1dup)) /*@ where p_a=&dw_w1dup,a0=dw_w1dup.s0,a1=dw_w1dup.s1,a2=dw_w1dup.s2,a3=dw_w1dup.s3 */;
out=dw_n_vfmaq_lane_f32(&(out),&(dw_left0),&(dw_w1lane),(0)) /*@ where p_c=&out,c0=out.s0,c1=out.s1,c2=out.s2,c3=out.s3,p_a=&dw_left0,a0=dw_left0.s0,a1=dw_left0.s1,a2=dw_left0.s2,a3=dw_left0.s3,p_b=&dw_w1lane,b0=dw_w1lane.s0,b1=dw_w1lane.s1 */;}
}
{const float32x4_t dw_left1dup=vdupq_n_f32(prev1);
const float32x4_t dw_left1=dw_n_vextq_f32(&(dw_left1dup),&(c1),(3)) /*@ where p_a=&dw_left1dup,a0=dw_left1dup.s0,a1=dw_left1dup.s1,a2=dw_left1dup.s2,a3=dw_left1dup.s3,p_b=&c1,b0=c1.s0,b1=c1.s1,b2=c1.s2,b3=c1.s3 */;
{const float32x4_t dw_w4dup=vdupq_n_f32(dw_read_scalar(&(weights[4])) /*@ where F=F */);
const float32x2_t dw_w4lane=dw_n_vget_low_f32(&(dw_w4dup)) /*@ where p_a=&dw_w4dup,a0=dw_w4dup.s0,a1=dw_w4dup.s1,a2=dw_w4dup.s2,a3=dw_w4dup.s3 */;
out=dw_n_vfmaq_lane_f32(&(out),&(dw_left1),&(dw_w4lane),(0)) /*@ where p_c=&out,c0=out.s0,c1=out.s1,c2=out.s2,c3=out.s3,p_a=&dw_left1,a0=dw_left1.s0,a1=dw_left1.s1,a2=dw_left1.s2,a3=dw_left1.s3,p_b=&dw_w4lane,b0=dw_w4lane.s0,b1=dw_w4lane.s1 */;}
}
{const float32x4_t dw_left2dup=vdupq_n_f32(prev2);
const float32x4_t dw_left2=dw_n_vextq_f32(&(dw_left2dup),&(c2),(3)) /*@ where p_a=&dw_left2dup,a0=dw_left2dup.s0,a1=dw_left2dup.s1,a2=dw_left2dup.s2,a3=dw_left2dup.s3,p_b=&c2,b0=c2.s0,b1=c2.s1,b2=c2.s2,b3=c2.s3 */;
{const float32x4_t dw_w7dup=vdupq_n_f32(dw_read_scalar(&(weights[7])) /*@ where F=F */);
const float32x2_t dw_w7lane=dw_n_vget_low_f32(&(dw_w7dup)) /*@ where p_a=&dw_w7dup,a0=dw_w7dup.s0,a1=dw_w7dup.s1,a2=dw_w7dup.s2,a3=dw_w7dup.s3 */;
out=dw_n_vfmaq_lane_f32(&(out),&(dw_left2),&(dw_w7lane),(0)) /*@ where p_c=&out,c0=out.s0,c1=out.s1,c2=out.s2,c3=out.s3,p_a=&dw_left2,a0=dw_left2.s0,a1=dw_left2.s1,a2=dw_left2.s2,a3=dw_left2.s3,p_b=&dw_w7lane,b0=dw_w7lane.s0,b1=dw_w7lane.s1 */;}
}
{const float32x4_t dw_right0dup=vdupq_n_f32(next0);
const float32x4_t dw_right0=dw_n_vextq_f32(&(c0),&(dw_right0dup),(1)) /*@ where p_a=&c0,a0=c0.s0,a1=c0.s1,a2=c0.s2,a3=c0.s3,p_b=&dw_right0dup,b0=dw_right0dup.s0,b1=dw_right0dup.s1,b2=dw_right0dup.s2,b3=dw_right0dup.s3 */;
{const float32x4_t dw_w3dup=vdupq_n_f32(dw_read_scalar(&(weights[3])) /*@ where F=F */);
const float32x2_t dw_w3lane=dw_n_vget_low_f32(&(dw_w3dup)) /*@ where p_a=&dw_w3dup,a0=dw_w3dup.s0,a1=dw_w3dup.s1,a2=dw_w3dup.s2,a3=dw_w3dup.s3 */;
out=dw_n_vfmaq_lane_f32(&(out),&(dw_right0),&(dw_w3lane),(0)) /*@ where p_c=&out,c0=out.s0,c1=out.s1,c2=out.s2,c3=out.s3,p_a=&dw_right0,a0=dw_right0.s0,a1=dw_right0.s1,a2=dw_right0.s2,a3=dw_right0.s3,p_b=&dw_w3lane,b0=dw_w3lane.s0,b1=dw_w3lane.s1 */;}
}
{const float32x4_t dw_right1dup=vdupq_n_f32(next1);
const float32x4_t dw_right1=dw_n_vextq_f32(&(c1),&(dw_right1dup),(1)) /*@ where p_a=&c1,a0=c1.s0,a1=c1.s1,a2=c1.s2,a3=c1.s3,p_b=&dw_right1dup,b0=dw_right1dup.s0,b1=dw_right1dup.s1,b2=dw_right1dup.s2,b3=dw_right1dup.s3 */;
{const float32x4_t dw_w6dup=vdupq_n_f32(dw_read_scalar(&(weights[6])) /*@ where F=F */);
const float32x2_t dw_w6lane=dw_n_vget_low_f32(&(dw_w6dup)) /*@ where p_a=&dw_w6dup,a0=dw_w6dup.s0,a1=dw_w6dup.s1,a2=dw_w6dup.s2,a3=dw_w6dup.s3 */;
out=dw_n_vfmaq_lane_f32(&(out),&(dw_right1),&(dw_w6lane),(0)) /*@ where p_c=&out,c0=out.s0,c1=out.s1,c2=out.s2,c3=out.s3,p_a=&dw_right1,a0=dw_right1.s0,a1=dw_right1.s1,a2=dw_right1.s2,a3=dw_right1.s3,p_b=&dw_w6lane,b0=dw_w6lane.s0,b1=dw_w6lane.s1 */;}
}
{const float32x4_t dw_right2dup=vdupq_n_f32(next2);
const float32x4_t dw_right2=dw_n_vextq_f32(&(c2),&(dw_right2dup),(1)) /*@ where p_a=&c2,a0=c2.s0,a1=c2.s1,a2=c2.s2,a3=c2.s3,p_b=&dw_right2dup,b0=dw_right2dup.s0,b1=dw_right2dup.s1,b2=dw_right2dup.s2,b3=dw_right2dup.s3 */;
{const float32x4_t dw_w9dup=vdupq_n_f32(dw_read_scalar(&(weights[9])) /*@ where F=F */);
const float32x2_t dw_w9lane=dw_n_vget_low_f32(&(dw_w9dup)) /*@ where p_a=&dw_w9dup,a0=dw_w9dup.s0,a1=dw_w9dup.s1,a2=dw_w9dup.s2,a3=dw_w9dup.s3 */;
out=dw_n_vfmaq_lane_f32(&(out),&(dw_right2),&(dw_w9lane),(0)) /*@ where p_c=&out,c0=out.s0,c1=out.s1,c2=out.s2,c3=out.s3,p_a=&dw_right2,a0=dw_right2.s0,a1=dw_right2.s1,a2=dw_right2.s2,a3=dw_right2.s3,p_b=&dw_w9lane,b0=dw_w9lane.s0,b1=dw_w9lane.s1 */;}
}
{const float32x4_t dw_lo=vdupq_n_f32(lo);out=dw_n_vmaxq_f32(&(out),&(dw_lo)) /*@ where p_a=&out,a0=out.s0,a1=out.s1,a2=out.s2,a3=out.s3,p_b=&dw_lo,b0=dw_lo.s0,b1=dw_lo.s1,b2=dw_lo.s2,b3=dw_lo.s3 */;}
{const float32x4_t dw_hi=vdupq_n_f32(hi);out=dw_n_vminq_f32(&(out),&(dw_hi)) /*@ where p_a=&out,a0=out.s0,a1=out.s1,a2=out.s2,a3=out.s3,p_b=&dw_hi,b0=dw_hi.s0,b1=dw_hi.s1,b2=dw_hi.s2,b3=dw_hi.s3 */;}
return out;
}
