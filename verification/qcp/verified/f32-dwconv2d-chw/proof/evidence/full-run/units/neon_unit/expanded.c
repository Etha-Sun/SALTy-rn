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
/*@ Import Coq Require Import DwChw.Types */
/*@ Import Coq Require Import DwChw.VectorModel */
/*@ Extern Coq (dw_fp_match:Z -> Z -> fp32 -> fp32 -> Prop) (dw_fp8:fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> Z -> fp32) (dw_mask_bit:Z -> Z -> Z) (dw_ne_value:fp32 -> fp32 -> Z) (dw_mask_matches:Z -> Z -> (Z -> fp32) -> (Z -> fp32) -> Prop) (fp32_max_number:fp32 -> fp32 -> fp32) (fp32_min_number:fp32 -> fp32 -> fp32) (dw_rvv_merge:fp32 -> fp32 -> Z -> fp32) (dw_repaired_max:fp32 -> fp32 -> fp32) (dw_repaired_min:fp32 -> fp32 -> fp32) (dw_vl_allowed:Z -> Z -> Prop) */
/*@ Import Coq Require Import DwChw.Store8Model */
/*@ Extern Coq (dw_same:fp32->fp32->Prop)
 (dw_values8:fp32->fp32->fp32->fp32->fp32->fp32->fp32->fp32->Z->list fp32)
 (FloatArray::full:Z->Z->list fp32->Assertion)
 (FloatArray::undef_full:Z->Z->Assertion)
 (FloatArray::undef_seg:Z->Z->Z->Assertion) */
/*@ Import Coq Require Import DwChw.MemoryViewFacts */
/*@ Extern Coq (dw_load_allowed:DwROMap->Z->Z->Prop) (dw_store_allowed:list Z->Z->Z->Prop) */
/* Original-ISA store boundary, source-reviewed for final human approval.
 * Pointer arguments are semantic vector views, not a claimed physical ABI.
 * These declarations have no C helper implementation or body-proof credit.
 * Each active store lane updates one shared owner; no output alias is excluded. */
void dw_isa_store4(float *p,const float32x4_t *v)
/*@ With (W:list Z) (O:DwOutput) (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32)
 Require dw_distinct(W) && dw_write_window(W,p,4) && store(&(v->s0),float,a0) * store(&(v->s1),float,a1) * store(&(v->s2),float,a2) * store(&(v->s3),float,a3) * dw_output(W,O)
 Ensure store(&(v->s0),float,a0) * store(&(v->s1),float,a1) * store(&(v->s2),float,a2) * store(&(v->s3),float,a3) * dw_output(W,dw_write_values(O,p,dw_pack4(a0,a1,a2,a3))) */;
void dw_isa_store2(float *p,const float32x2_t *v)
/*@ With (W:list Z) (O:DwOutput) (a0:fp32) (a1:fp32)
 Require dw_distinct(W) && dw_write_window(W,p,2) && store(&(v->s0),float,a0) * store(&(v->s1),float,a1) * dw_output(W,O)
 Ensure store(&(v->s0),float,a0) * store(&(v->s1),float,a1) * dw_output(W,dw_write_values(O,p,dw_pack2(a0,a1))) */;
void dw_isa_store1(float *p,const float32x2_t *v,int lane)
/*@ With (W:list Z) (O:DwOutput) (a0:fp32) (a1:fp32)
 Require 0<=lane && lane<2 && dw_distinct(W) && dw_write_window(W,p,1) && store(&(v->s0),float,a0) * store(&(v->s1),float,a1) * dw_output(W,O)
 Ensure store(&(v->s0),float,a0) * store(&(v->s1),float,a1) * dw_output(W,dw_output_put(O,p,dw_fp2(a0,a1,lane))) */;
void dw_isa_storervv(float *p,const vfloat32m2_t *v,size_t vl)
/*@ With (W:list Z) (O:DwOutput) (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32) (a4:fp32) (a5:fp32) (a6:fp32) (a7:fp32)
 Require 0<=vl && vl<=8 && dw_distinct(W) && dw_store_allowed(W,p,vl) && store(&(v->s0),float,a0) * store(&(v->s1),float,a1) * store(&(v->s2),float,a2) * store(&(v->s3),float,a3) * store(&(v->s4),float,a4) * store(&(v->s5),float,a5) * store(&(v->s6),float,a6) * store(&(v->s7),float,a7) * dw_output(W,O)
 Ensure store(&(v->s0),float,a0) * store(&(v->s1),float,a1) * store(&(v->s2),float,a2) * store(&(v->s3),float,a3) * store(&(v->s4),float,a4) * store(&(v->s5),float,a5) * store(&(v->s6),float,a6) * store(&(v->s7),float,a7) * dw_output(W,dw_write_values(O,p,dw_values8(a0,a1,a2,a3,a4,a5,a6,a7,vl))) */;
/*@ Import Coq Require Import DwChw.Types */
/*@ Import Coq Require Import DwChw.Mask7Model */
/*@ Extern Coq (dw_mask7_word:Z->Z->Z) */
/* Context-specialized original vld1q_u32 boundary: the unescaped seven-int32
 * table remains singly owned; four32-bit unsigned load words are observed.
 * Signed -1 has all32 bits set under the explicit int32 representation.
 * No C body or formal physical-ISA/ABI refinement credit is claimed. */
uint32x4_t dw_isa_mask7(const uint32_t *p)
/*@ With (base:Z) (index:Z) Require 0<=index && index<=3 && p==pointer_offset(base,index,int) && store(pointer_offset(base,0,int),int,-1) * store(pointer_offset(base,1,int),int,-1) * store(pointer_offset(base,2,int),int,-1) * store(pointer_offset(base,3,int),int,-1) * store(pointer_offset(base,4,int),int,0) * store(pointer_offset(base,5,int),int,0) * store(pointer_offset(base,6,int),int,0) Ensure store(pointer_offset(base,0,int),int,-1) * store(pointer_offset(base,1,int),int,-1) * store(pointer_offset(base,2,int),int,-1) * store(pointer_offset(base,3,int),int,-1) * store(pointer_offset(base,4,int),int,0) * store(pointer_offset(base,5,int),int,0) * store(pointer_offset(base,6,int),int,0) * store(&(__return.s0),unsigned int,dw_mask7_word(index,0)) * store(&(__return.s1),unsigned int,dw_mask7_word(index,1)) * store(&(__return.s2),unsigned int,dw_mask7_word(index,2)) * store(&(__return.s3),unsigned int,dw_mask7_word(index,3)) */;
/* Array-owner presentation of the same original four-word read. L is the
   unchanged seven-cell signed table, not a second resource or a new domain. */
/*@ Extern Coq (dw_mask7_values:list Z) */
uint32x4_t dw_isa_mask7_array(const uint32_t *p)
/*@ With (base:Z) (index:Z) (L:list Z)
 Require 0<=index && index<=3 && L==dw_mask7_values && p==pointer_offset(base,index,int) && IntArray::full(base,7,L)
 Ensure IntArray::full(base,7,L) * store(&(__return.s0),unsigned int,dw_mask7_word(index,0)) * store(&(__return.s1),unsigned int,dw_mask7_word(index,1)) * store(&(__return.s2),unsigned int,dw_mask7_word(index,2)) * store(&(__return.s3),unsigned int,dw_mask7_word(index,3)) */;
/* One original VGETQ_LANE spec, faithful readonly four-cell pointer view.
   No ordinary compound helper is exempted; physical ISA/ABI review pending. */
float dw_isa_getq_lane_f32(const float32x4_t*p,int lane)
/*@ With (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32) Require 0<=lane && lane<4 && store(&(p->s0),float,a0) * store(&(p->s1),float,a1) * store(&(p->s2),float,a2) * store(&(p->s3),float,a3) Ensure dw_same(__return,dw_fp4(a0,a1,a2,a3,lane)) && store(&(p->s0),float,a0) * store(&(p->s1),float,a1) * store(&(p->s2),float,a2) * store(&(p->s3),float,a3) */;
/*@ Import Coq Require Import DwChw.ProgressModel */
/*@ Extern Coq (dw_inputs:DwROMap->Z->Z->Z->Z->Z->Z->Prop)
 (dw_footprint:Z->Z->Prop) (dw_addresses:Z->Z->Z->list Z)
 (dw_row_base:Z->Z->Z->Z->Z->Z) (dw_store_row:Z->Z->Z->Z)
 (dw_prev:DwROMap->Z->Z->fp32)
 (dw_neon_results:DwROMap->Z->Z->Z->Z->Z->fp32->fp32->Z->fp32)
 (dw_rvv_results:DwROMap->Z->Z->Z->Z->Z->fp32->fp32->Z->fp32)
 (dw_progress:(Z->fp32)->DwOutput->Z->Z->Z->Z->Z->DwOutput)
 (dw_outer_pointers:Z->Z->Z->Z->Z->Z->Z->Z->Z->Z->Z->Z->Z->Z->Prop) */
/*@ Import Coq Require Import DwChw.NeonProgressModel */
/*@ Extern Coq (dw_mask_index:Z->Z) (dw_previous4:DwROMap->Z->Z->Z->fp32) */
float dw_read_scalar(const float *p)
/*@ With (F:DwROMap) Require dw_present(F,p) && dw_data(F)
 Ensure dw_same(__return,dw_get(F,p)) && dw_data(F) */;
/*@ Import Coq Require Import DwChw.NeonVectorPixelModel */
/*@ Extern Coq (dw_neon_vector_pixel:DwROMap->Z->(Z->fp32)->(Z->fp32)->(Z->fp32)->fp32->fp32->fp32->fp32->fp32->fp32->fp32->fp32->Z->fp32) (dw_neon_vector_match4:fp32->fp32->fp32->fp32->(Z->fp32)->Prop) */
float32x4_t dw_neon_pixel_compute(const float32x4_t*p0,const float32x4_t*p1,const float32x4_t*p2,const float*weights,float prev0,float prev1,float prev2,float next0,float next1,float next2,float lo,float hi)
/*@ With(F:DwROMap) (a00:fp32) (a01:fp32) (a02:fp32) (a03:fp32) (a10:fp32) (a11:fp32) (a12:fp32) (a13:fp32) (a20:fp32) (a21:fp32) (a22:fp32) (a23:fp32) Require dw_window(F,weights,10) && dw_data(F) * store(&(p0->s0),float,a00) * store(&(p0->s1),float,a01) * store(&(p0->s2),float,a02) * store(&(p0->s3),float,a03) * store(&(p1->s0),float,a10) * store(&(p1->s1),float,a11) * store(&(p1->s2),float,a12) * store(&(p1->s3),float,a13) * store(&(p2->s0),float,a20) * store(&(p2->s1),float,a21) * store(&(p2->s2),float,a22) * store(&(p2->s3),float,a23) Ensure exists (r0:fp32) (r1:fp32) (r2:fp32) (r3:fp32),dw_neon_vector_match4(r0,r1,r2,r3,dw_neon_vector_pixel(F,weights,dw_fp4(a00,a01,a02,a03),dw_fp4(a10,a11,a12,a13),dw_fp4(a20,a21,a22,a23),prev0,prev1,prev2,next0,next1,next2,lo,hi)) && dw_data(F) * store(&(p0->s0),float,a00) * store(&(p0->s1),float,a01) * store(&(p0->s2),float,a02) * store(&(p0->s3),float,a03) * store(&(p1->s0),float,a10) * store(&(p1->s1),float,a11) * store(&(p1->s2),float,a12) * store(&(p1->s3),float,a13) * store(&(p2->s0),float,a20) * store(&(p2->s1),float,a21) * store(&(p2->s2),float,a22) * store(&(p2->s3),float,a23) * store(&(__return.s0),float,r0) * store(&(__return.s1),float,r1) * store(&(__return.s2),float,r2) * store(&(__return.s3),float,r3) */;
/*
struct xnn_f32_minmax_params {
  struct {
    float min;
    float max;
  } scalar;
};
*/
void test_neon(
    size_t input_height,
    size_t input_width,
    const float* input,
    const float* weights,
    const float* zero,
    float* output,
    uint32_t padding_top,
    const struct xnn_f32_minmax_params* restrict params)
/*@ With (F:DwROMap) (O:DwOutput) (W:list Z) (H:Z) (N:Z) (Input:Z) (Zero:Z) (Weights:Z) (Output:Z) (Params:Z) (Lo:fp32) (Hi:fp32) Require 0<H && 0<N && H<=18446744073709551615 && 4*N<=18446744073709551615 && input_width%4==0 && input_height==H && input_width==4*N && input==Input && zero==Zero && weights==Weights && output==Output && params==Params && padding_top==1 && dw_inputs(F,Input,Zero,Weights,Params,H,N) && dw_present(F,&(params->scalar.min)) && dw_present(F,&(params->scalar.max)) && dw_same(dw_get(F,&(params->scalar.min)),Lo) && dw_same(dw_get(F,&(params->scalar.max)),Hi) && W==dw_addresses(Output,H,N) && dw_distinct(W) && dw_footprint(Output,H*N) && dw_data(F) * dw_output(W,O) Ensure dw_data(F) * dw_output(W,dw_progress(dw_neon_results(F,Input,Zero,Weights,H,N,Lo,Hi),O,Output,H,N,H,0)) */
{
  dw_assert(input_height != 0);
  dw_assert(input_width != 0);
  dw_assert(input_width % sizeof(float) == 0);
  dw_assert(padding_top == 1);
  const float32x4_t vmax = vdupq_n_f32(dw_read_scalar(&(params->scalar.max)) /*@ where F=F */);
  const float32x4_t vmin = vdupq_n_f32(dw_read_scalar(&(params->scalar.min)) /*@ where F=F */);
  const int32_t mask_table[7] = {-1, -1, -1, -1, 0, 0, 0};
  const uint32x4_t vmask = dw_isa_mask7_array(((const uint32_t*) &mask_table[3 - (((input_width >> 2) - 1) & 3)])) /*@ where base=mask_table,index=unsigned_last_nbits(3 - (((input_width >> 2) - 1) & 3),64) */;
  const float32x4_t vw0123 = vld1q_f32(weights) /*@ where F=F */;
  const float32x4_t vw4567 = vld1q_f32(weights + 4) /*@ where F=F */;
  const float32x2_t vw89 = vld1_f32(weights + 8) /*@ where F=F */;
  const size_t input_decrement = dw_round_up_po2((input_width),(4 * sizeof(float)));
  const float* i0 = zero;
  const float* i1 = input;
  const float* i2 = (const float*) ((uintptr_t) i1 + input_width);
  const float* i3 = (const float*) ((uintptr_t) i2 + input_width);
  const float* i4 = (const float*) ((uintptr_t) i3 + input_width);
  float* o0 = output;
  float* o1 = (float*) ((uintptr_t) o0 + input_width);
  float* o2 = (float*) ((uintptr_t) o1 + input_width);
  size_t output_height = input_height;
  do {
    if (output_height < 2) {
      i2 = zero;
      o1 = o0;
    }
    if (output_height < 3) {
      i3 = zero;
      o2 = o1;
    }
    if (output_height < 4) {
      i4 = zero;
    }
    float32x4_t vi0x0123 = vmovq_n_f32(0.0f);
    float32x4_t vi1x0123 = vmovq_n_f32(0.0f);
    float32x4_t vi2x0123 = vmovq_n_f32(0.0f);
    float32x4_t vi3x0123 = vmovq_n_f32(0.0f);
    float32x4_t vi4x0123 = vmovq_n_f32(0.0f);
    float32x4_t vi0x4567 = vld1q_f32(i0) /*@ where F=F */; i0 += 4;
    float32x4_t vi1x4567 = vld1q_f32(i1) /*@ where F=F */; i1 += 4;
    float32x4_t vi2x4567 = vld1q_f32(i2) /*@ where F=F */; i2 += 4;
    float32x4_t vi3x4567 = vld1q_f32(i3) /*@ where F=F */; i3 += 4;
    float32x4_t vi4x4567 = vld1q_f32(i4) /*@ where F=F */; i4 += 4;
    size_t w = input_width;
    /*@ Inv Assert 0<H && 0<N && H<=18446744073709551615 && 4*N<=18446744073709551615 && input_width%4==0 && input_height==H && input_width==4*N && input==Input && zero==Zero && weights==Weights && output==Output && params==Params && padding_top==1 && dw_inputs(F,Input,Zero,Weights,Params,H,N) && dw_present(F,&(params->scalar.min)) && dw_present(F,&(params->scalar.max)) && dw_same(dw_get(F,&(params->scalar.min)),Lo) && dw_same(dw_get(F,&(params->scalar.max)),Hi) && W==dw_addresses(Output,H,N) && dw_distinct(W) && dw_footprint(Output,H*N) && input_decrement==((4*N+15)/16)*16 && 0<output_height && output_height<=H && 4<=w && w<=input_width && w%4==0 && ((input_width-w)/4)%4==0 && i0==dw_row_base(Input,Zero,H,N,H-output_height-1)+4*((input_width-w)/4+4) && i1==dw_row_base(Input,Zero,H,N,H-output_height+0)+4*((input_width-w)/4+4) && i2==dw_row_base(Input,Zero,H,N,H-output_height+1)+4*((input_width-w)/4+4) && i3==dw_row_base(Input,Zero,H,N,H-output_height+2)+4*((input_width-w)/4+4) && i4==dw_row_base(Input,Zero,H,N,H-output_height+3)+4*((input_width-w)/4+4) && o0==Output+4*(dw_store_row(H,H-output_height,0)*N+(input_width-w)/4) && o1==Output+4*(dw_store_row(H,H-output_height,1)*N+(input_width-w)/4) && o2==Output+4*(dw_store_row(H,H-output_height,2)*N+(input_width-w)/4) && dw_data(F) * dw_output(W,dw_progress(dw_neon_results(F,Input,Zero,Weights,H,N,Lo,Hi),O,Output,H,N,H-output_height,(input_width-w)/4)) * store(&(vmax.s0),float,Hi) * store(&(vmax.s1),float,Hi) * store(&(vmax.s2),float,Hi) * store(&(vmax.s3),float,Hi) * store(&(vmin.s0),float,Lo) * store(&(vmin.s1),float,Lo) * store(&(vmin.s2),float,Lo) * store(&(vmin.s3),float,Lo) * store(&(vw0123.s0),float,dw_get(F,Weights+4*0)) * store(&(vw0123.s1),float,dw_get(F,Weights+4*1)) * store(&(vw0123.s2),float,dw_get(F,Weights+4*2)) * store(&(vw0123.s3),float,dw_get(F,Weights+4*3)) * store(&(vw4567.s0),float,dw_get(F,Weights+4*4)) * store(&(vw4567.s1),float,dw_get(F,Weights+4*5)) * store(&(vw4567.s2),float,dw_get(F,Weights+4*6)) * store(&(vw4567.s3),float,dw_get(F,Weights+4*7)) * store(&(vw89.s0),float,dw_get(F,Weights+4*8)) * store(&(vw89.s1),float,dw_get(F,Weights+4*9)) * store(&(vmask.s0),unsigned int,dw_mask7_word(dw_mask_index(N),0)) * store(&(vmask.s1),unsigned int,dw_mask7_word(dw_mask_index(N),1)) * store(&(vmask.s2),unsigned int,dw_mask7_word(dw_mask_index(N),2)) * store(&(vmask.s3),unsigned int,dw_mask7_word(dw_mask_index(N),3)) * IntArray::full(mask_table,7,dw_mask7_values) * store(&(vi0x0123.s0),float,dw_previous4(F,dw_row_base(Input,Zero,H,N,H-output_height-1),(input_width-w)/4,0)) * store(&(vi0x0123.s1),float,dw_previous4(F,dw_row_base(Input,Zero,H,N,H-output_height-1),(input_width-w)/4,1)) * store(&(vi0x0123.s2),float,dw_previous4(F,dw_row_base(Input,Zero,H,N,H-output_height-1),(input_width-w)/4,2)) * store(&(vi0x0123.s3),float,dw_previous4(F,dw_row_base(Input,Zero,H,N,H-output_height-1),(input_width-w)/4,3)) * store(&(vi0x4567.s0),float,dw_get(F,dw_row_base(Input,Zero,H,N,H-output_height-1)+4*((input_width-w)/4+0))) * store(&(vi0x4567.s1),float,dw_get(F,dw_row_base(Input,Zero,H,N,H-output_height-1)+4*((input_width-w)/4+1))) * store(&(vi0x4567.s2),float,dw_get(F,dw_row_base(Input,Zero,H,N,H-output_height-1)+4*((input_width-w)/4+2))) * store(&(vi0x4567.s3),float,dw_get(F,dw_row_base(Input,Zero,H,N,H-output_height-1)+4*((input_width-w)/4+3))) * store(&(vi1x0123.s0),float,dw_previous4(F,dw_row_base(Input,Zero,H,N,H-output_height+0),(input_width-w)/4,0)) * store(&(vi1x0123.s1),float,dw_previous4(F,dw_row_base(Input,Zero,H,N,H-output_height+0),(input_width-w)/4,1)) * store(&(vi1x0123.s2),float,dw_previous4(F,dw_row_base(Input,Zero,H,N,H-output_height+0),(input_width-w)/4,2)) * store(&(vi1x0123.s3),float,dw_previous4(F,dw_row_base(Input,Zero,H,N,H-output_height+0),(input_width-w)/4,3)) * store(&(vi1x4567.s0),float,dw_get(F,dw_row_base(Input,Zero,H,N,H-output_height+0)+4*((input_width-w)/4+0))) * store(&(vi1x4567.s1),float,dw_get(F,dw_row_base(Input,Zero,H,N,H-output_height+0)+4*((input_width-w)/4+1))) * store(&(vi1x4567.s2),float,dw_get(F,dw_row_base(Input,Zero,H,N,H-output_height+0)+4*((input_width-w)/4+2))) * store(&(vi1x4567.s3),float,dw_get(F,dw_row_base(Input,Zero,H,N,H-output_height+0)+4*((input_width-w)/4+3))) * store(&(vi2x0123.s0),float,dw_previous4(F,dw_row_base(Input,Zero,H,N,H-output_height+1),(input_width-w)/4,0)) * store(&(vi2x0123.s1),float,dw_previous4(F,dw_row_base(Input,Zero,H,N,H-output_height+1),(input_width-w)/4,1)) * store(&(vi2x0123.s2),float,dw_previous4(F,dw_row_base(Input,Zero,H,N,H-output_height+1),(input_width-w)/4,2)) * store(&(vi2x0123.s3),float,dw_previous4(F,dw_row_base(Input,Zero,H,N,H-output_height+1),(input_width-w)/4,3)) * store(&(vi2x4567.s0),float,dw_get(F,dw_row_base(Input,Zero,H,N,H-output_height+1)+4*((input_width-w)/4+0))) * store(&(vi2x4567.s1),float,dw_get(F,dw_row_base(Input,Zero,H,N,H-output_height+1)+4*((input_width-w)/4+1))) * store(&(vi2x4567.s2),float,dw_get(F,dw_row_base(Input,Zero,H,N,H-output_height+1)+4*((input_width-w)/4+2))) * store(&(vi2x4567.s3),float,dw_get(F,dw_row_base(Input,Zero,H,N,H-output_height+1)+4*((input_width-w)/4+3))) * store(&(vi3x0123.s0),float,dw_previous4(F,dw_row_base(Input,Zero,H,N,H-output_height+2),(input_width-w)/4,0)) * store(&(vi3x0123.s1),float,dw_previous4(F,dw_row_base(Input,Zero,H,N,H-output_height+2),(input_width-w)/4,1)) * store(&(vi3x0123.s2),float,dw_previous4(F,dw_row_base(Input,Zero,H,N,H-output_height+2),(input_width-w)/4,2)) * store(&(vi3x0123.s3),float,dw_previous4(F,dw_row_base(Input,Zero,H,N,H-output_height+2),(input_width-w)/4,3)) * store(&(vi3x4567.s0),float,dw_get(F,dw_row_base(Input,Zero,H,N,H-output_height+2)+4*((input_width-w)/4+0))) * store(&(vi3x4567.s1),float,dw_get(F,dw_row_base(Input,Zero,H,N,H-output_height+2)+4*((input_width-w)/4+1))) * store(&(vi3x4567.s2),float,dw_get(F,dw_row_base(Input,Zero,H,N,H-output_height+2)+4*((input_width-w)/4+2))) * store(&(vi3x4567.s3),float,dw_get(F,dw_row_base(Input,Zero,H,N,H-output_height+2)+4*((input_width-w)/4+3))) * store(&(vi4x0123.s0),float,dw_previous4(F,dw_row_base(Input,Zero,H,N,H-output_height+3),(input_width-w)/4,0)) * store(&(vi4x0123.s1),float,dw_previous4(F,dw_row_base(Input,Zero,H,N,H-output_height+3),(input_width-w)/4,1)) * store(&(vi4x0123.s2),float,dw_previous4(F,dw_row_base(Input,Zero,H,N,H-output_height+3),(input_width-w)/4,2)) * store(&(vi4x0123.s3),float,dw_previous4(F,dw_row_base(Input,Zero,H,N,H-output_height+3),(input_width-w)/4,3)) * store(&(vi4x4567.s0),float,dw_get(F,dw_row_base(Input,Zero,H,N,H-output_height+3)+4*((input_width-w)/4+0))) * store(&(vi4x4567.s1),float,dw_get(F,dw_row_base(Input,Zero,H,N,H-output_height+3)+4*((input_width-w)/4+1))) * store(&(vi4x4567.s2),float,dw_get(F,dw_row_base(Input,Zero,H,N,H-output_height+3)+4*((input_width-w)/4+2))) * store(&(vi4x4567.s3),float,dw_get(F,dw_row_base(Input,Zero,H,N,H-output_height+3)+4*((input_width-w)/4+3))) */
    for (; w > 4 * sizeof(float); w -= 4 * sizeof(float)) {
      const float32x4_t vi0x89AB = vld1q_f32(i0) /*@ where F=F */; i0 += 4;
      const float32x4_t vi1x89AB = vld1q_f32(i1) /*@ where F=F */; i1 += 4;
      const float32x4_t vi2x89AB = vld1q_f32(i2) /*@ where F=F */; i2 += 4;
      const float32x4_t vi3x89AB = vld1q_f32(i3) /*@ where F=F */; i3 += 4;
      const float32x4_t vi4x89AB = vld1q_f32(i4) /*@ where F=F */; i4 += 4;
      /* Ordinary checked9FMA helper per output row; extract original neighbour lanes. */
      const float dw_prev0 = dw_isa_getq_lane_f32(&(vi0x0123),(3)) /*@ where a0=vi0x0123.s0,a1=vi0x0123.s1,a2=vi0x0123.s2,a3=vi0x0123.s3 */;
      const float dw_prev1 = dw_isa_getq_lane_f32(&(vi1x0123),(3)) /*@ where a0=vi1x0123.s0,a1=vi1x0123.s1,a2=vi1x0123.s2,a3=vi1x0123.s3 */;
      const float dw_prev2 = dw_isa_getq_lane_f32(&(vi2x0123),(3)) /*@ where a0=vi2x0123.s0,a1=vi2x0123.s1,a2=vi2x0123.s2,a3=vi2x0123.s3 */;
      const float dw_prev3 = dw_isa_getq_lane_f32(&(vi3x0123),(3)) /*@ where a0=vi3x0123.s0,a1=vi3x0123.s1,a2=vi3x0123.s2,a3=vi3x0123.s3 */;
      const float dw_prev4 = dw_isa_getq_lane_f32(&(vi4x0123),(3)) /*@ where a0=vi4x0123.s0,a1=vi4x0123.s1,a2=vi4x0123.s2,a3=vi4x0123.s3 */;
      const float dw_next0 = dw_isa_getq_lane_f32(&(vi0x89AB),(0)) /*@ where a0=vi0x89AB.s0,a1=vi0x89AB.s1,a2=vi0x89AB.s2,a3=vi0x89AB.s3 */;
      const float dw_next1 = dw_isa_getq_lane_f32(&(vi1x89AB),(0)) /*@ where a0=vi1x89AB.s0,a1=vi1x89AB.s1,a2=vi1x89AB.s2,a3=vi1x89AB.s3 */;
      const float dw_next2 = dw_isa_getq_lane_f32(&(vi2x89AB),(0)) /*@ where a0=vi2x89AB.s0,a1=vi2x89AB.s1,a2=vi2x89AB.s2,a3=vi2x89AB.s3 */;
      const float dw_next3 = dw_isa_getq_lane_f32(&(vi3x89AB),(0)) /*@ where a0=vi3x89AB.s0,a1=vi3x89AB.s1,a2=vi3x89AB.s2,a3=vi3x89AB.s3 */;
      const float dw_next4 = dw_isa_getq_lane_f32(&(vi4x89AB),(0)) /*@ where a0=vi4x89AB.s0,a1=vi4x89AB.s1,a2=vi4x89AB.s2,a3=vi4x89AB.s3 */;
      const float dw_lo = dw_isa_getq_lane_f32(&(vmin),(0)) /*@ where a0=vmin.s0,a1=vmin.s1,a2=vmin.s2,a3=vmin.s3 */;
      const float dw_hi = dw_isa_getq_lane_f32(&(vmax),(0)) /*@ where a0=vmax.s0,a1=vmax.s1,a2=vmax.s2,a3=vmax.s3 */;
      float32x4_t vo0 = dw_neon_pixel_compute(&vi0x4567, &vi1x4567, &vi2x4567, weights, dw_prev0, dw_prev1, dw_prev2, dw_next0, dw_next1, dw_next2, dw_lo, dw_hi) /*@ where F=F,a00=vi0x4567.s0,a01=vi0x4567.s1,a02=vi0x4567.s2,a03=vi0x4567.s3,a10=vi1x4567.s0,a11=vi1x4567.s1,a12=vi1x4567.s2,a13=vi1x4567.s3,a20=vi2x4567.s0,a21=vi2x4567.s1,a22=vi2x4567.s2,a23=vi2x4567.s3 */;
      float32x4_t vo1 = dw_neon_pixel_compute(&vi1x4567, &vi2x4567, &vi3x4567, weights, dw_prev1, dw_prev2, dw_prev3, dw_next1, dw_next2, dw_next3, dw_lo, dw_hi) /*@ where F=F,a00=vi1x4567.s0,a01=vi1x4567.s1,a02=vi1x4567.s2,a03=vi1x4567.s3,a10=vi2x4567.s0,a11=vi2x4567.s1,a12=vi2x4567.s2,a13=vi2x4567.s3,a20=vi3x4567.s0,a21=vi3x4567.s1,a22=vi3x4567.s2,a23=vi3x4567.s3 */;
      float32x4_t vo2 = dw_neon_pixel_compute(&vi2x4567, &vi3x4567, &vi4x4567, weights, dw_prev2, dw_prev3, dw_prev4, dw_next2, dw_next3, dw_next4, dw_lo, dw_hi) /*@ where F=F,a00=vi2x4567.s0,a01=vi2x4567.s1,a02=vi2x4567.s2,a03=vi2x4567.s3,a10=vi3x4567.s0,a11=vi3x4567.s1,a12=vi3x4567.s2,a13=vi3x4567.s3,a20=vi4x4567.s0,a21=vi4x4567.s1,a22=vi4x4567.s2,a23=vi4x4567.s3 */;
      vi0x0123 = vi0x4567;
      vi1x0123 = vi1x4567;
      vi2x0123 = vi2x4567;
      vi3x0123 = vi3x4567;
      vi4x0123 = vi4x4567;
      vi0x4567 = vi0x89AB;
      vi1x4567 = vi1x89AB;
      vi2x4567 = vi2x89AB;
      vi3x4567 = vi3x89AB;
      vi4x4567 = vi4x89AB;
      dw_isa_store4((o2),&(vo2)) /*@ where W=W,v=&vo2,a0=vo2.s0,a1=vo2.s1,a2=vo2.s2,a3=vo2.s3 */; o2 += 4;
      dw_isa_store4((o1),&(vo1)) /*@ where W=W,v=&vo1,a0=vo1.s0,a1=vo1.s1,a2=vo1.s2,a3=vo1.s3 */; o1 += 4;
      dw_isa_store4((o0),&(vo0)) /*@ where W=W,v=&vo0,a0=vo0.s0,a1=vo0.s1,a2=vo0.s2,a3=vo0.s3 */; o0 += 4;
    }
    // Always process the last block of 1..4 pixels.
    dw_assert(w >= 1 * sizeof(float));
    dw_assert(w <= 4 * sizeof(float));
    {
      { /* Short-lived nonescaping vector temporaries; operations remain in source order. */
        const uint32x4_t dw_nested_27 = dw_n_vreinterpretq_u32_f32(&(vi0x4567)) /*@ where p_a=&vi0x4567,a0=vi0x4567.s0,a1=vi0x4567.s1,a2=vi0x4567.s2,a3=vi0x4567.s3 */;
        const uint32x4_t dw_nested_28 = dw_n_vandq_u32(&(vmask),&(dw_nested_27)) /*@ where p_a=&vmask,a0=vmask.s0,a1=vmask.s1,a2=vmask.s2,a3=vmask.s3,p_b=&dw_nested_27,b0=dw_nested_27.s0,b1=dw_nested_27.s1,b2=dw_nested_27.s2,b3=dw_nested_27.s3 */;
        vi0x4567 = dw_n_vreinterpretq_f32_u32(&(dw_nested_28)) /*@ where p_a=&dw_nested_28,a0=dw_nested_28.s0,a1=dw_nested_28.s1,a2=dw_nested_28.s2,a3=dw_nested_28.s3 */;
      }
      { /* Short-lived nonescaping vector temporaries; operations remain in source order. */
        const uint32x4_t dw_nested_29 = dw_n_vreinterpretq_u32_f32(&(vi1x4567)) /*@ where p_a=&vi1x4567,a0=vi1x4567.s0,a1=vi1x4567.s1,a2=vi1x4567.s2,a3=vi1x4567.s3 */;
        const uint32x4_t dw_nested_30 = dw_n_vandq_u32(&(vmask),&(dw_nested_29)) /*@ where p_a=&vmask,a0=vmask.s0,a1=vmask.s1,a2=vmask.s2,a3=vmask.s3,p_b=&dw_nested_29,b0=dw_nested_29.s0,b1=dw_nested_29.s1,b2=dw_nested_29.s2,b3=dw_nested_29.s3 */;
        vi1x4567 = dw_n_vreinterpretq_f32_u32(&(dw_nested_30)) /*@ where p_a=&dw_nested_30,a0=dw_nested_30.s0,a1=dw_nested_30.s1,a2=dw_nested_30.s2,a3=dw_nested_30.s3 */;
      }
      { /* Short-lived nonescaping vector temporaries; operations remain in source order. */
        const uint32x4_t dw_nested_31 = dw_n_vreinterpretq_u32_f32(&(vi2x4567)) /*@ where p_a=&vi2x4567,a0=vi2x4567.s0,a1=vi2x4567.s1,a2=vi2x4567.s2,a3=vi2x4567.s3 */;
        const uint32x4_t dw_nested_32 = dw_n_vandq_u32(&(vmask),&(dw_nested_31)) /*@ where p_a=&vmask,a0=vmask.s0,a1=vmask.s1,a2=vmask.s2,a3=vmask.s3,p_b=&dw_nested_31,b0=dw_nested_31.s0,b1=dw_nested_31.s1,b2=dw_nested_31.s2,b3=dw_nested_31.s3 */;
        vi2x4567 = dw_n_vreinterpretq_f32_u32(&(dw_nested_32)) /*@ where p_a=&dw_nested_32,a0=dw_nested_32.s0,a1=dw_nested_32.s1,a2=dw_nested_32.s2,a3=dw_nested_32.s3 */;
      }
      { /* Short-lived nonescaping vector temporaries; operations remain in source order. */
        const uint32x4_t dw_nested_33 = dw_n_vreinterpretq_u32_f32(&(vi3x4567)) /*@ where p_a=&vi3x4567,a0=vi3x4567.s0,a1=vi3x4567.s1,a2=vi3x4567.s2,a3=vi3x4567.s3 */;
        const uint32x4_t dw_nested_34 = dw_n_vandq_u32(&(vmask),&(dw_nested_33)) /*@ where p_a=&vmask,a0=vmask.s0,a1=vmask.s1,a2=vmask.s2,a3=vmask.s3,p_b=&dw_nested_33,b0=dw_nested_33.s0,b1=dw_nested_33.s1,b2=dw_nested_33.s2,b3=dw_nested_33.s3 */;
        vi3x4567 = dw_n_vreinterpretq_f32_u32(&(dw_nested_34)) /*@ where p_a=&dw_nested_34,a0=dw_nested_34.s0,a1=dw_nested_34.s1,a2=dw_nested_34.s2,a3=dw_nested_34.s3 */;
      }
      { /* Short-lived nonescaping vector temporaries; operations remain in source order. */
        const uint32x4_t dw_nested_35 = dw_n_vreinterpretq_u32_f32(&(vi4x4567)) /*@ where p_a=&vi4x4567,a0=vi4x4567.s0,a1=vi4x4567.s1,a2=vi4x4567.s2,a3=vi4x4567.s3 */;
        const uint32x4_t dw_nested_36 = dw_n_vandq_u32(&(vmask),&(dw_nested_35)) /*@ where p_a=&vmask,a0=vmask.s0,a1=vmask.s1,a2=vmask.s2,a3=vmask.s3,p_b=&dw_nested_35,b0=dw_nested_35.s0,b1=dw_nested_35.s1,b2=dw_nested_35.s2,b3=dw_nested_35.s3 */;
        vi4x4567 = dw_n_vreinterpretq_f32_u32(&(dw_nested_36)) /*@ where p_a=&dw_nested_36,a0=dw_nested_36.s0,a1=dw_nested_36.s1,a2=dw_nested_36.s2,a3=dw_nested_36.s3 */;
      }
      /* Ordinary checked9FMA helper per output row; extract original neighbour lanes. */
      const float dw_prev0 = dw_isa_getq_lane_f32(&(vi0x0123),(3)) /*@ where a0=vi0x0123.s0,a1=vi0x0123.s1,a2=vi0x0123.s2,a3=vi0x0123.s3 */;
      const float dw_prev1 = dw_isa_getq_lane_f32(&(vi1x0123),(3)) /*@ where a0=vi1x0123.s0,a1=vi1x0123.s1,a2=vi1x0123.s2,a3=vi1x0123.s3 */;
      const float dw_prev2 = dw_isa_getq_lane_f32(&(vi2x0123),(3)) /*@ where a0=vi2x0123.s0,a1=vi2x0123.s1,a2=vi2x0123.s2,a3=vi2x0123.s3 */;
      const float dw_prev3 = dw_isa_getq_lane_f32(&(vi3x0123),(3)) /*@ where a0=vi3x0123.s0,a1=vi3x0123.s1,a2=vi3x0123.s2,a3=vi3x0123.s3 */;
      const float dw_prev4 = dw_isa_getq_lane_f32(&(vi4x0123),(3)) /*@ where a0=vi4x0123.s0,a1=vi4x0123.s1,a2=vi4x0123.s2,a3=vi4x0123.s3 */;
      const float dw_lo = dw_isa_getq_lane_f32(&(vmin),(0)) /*@ where a0=vmin.s0,a1=vmin.s1,a2=vmin.s2,a3=vmin.s3 */;
      const float dw_hi = dw_isa_getq_lane_f32(&(vmax),(0)) /*@ where a0=vmax.s0,a1=vmax.s1,a2=vmax.s2,a3=vmax.s3 */;
      float32x4_t vo0 = dw_neon_pixel_compute(&vi0x4567, &vi1x4567, &vi2x4567, weights, dw_prev0, dw_prev1, dw_prev2, 0.0f, 0.0f, 0.0f, dw_lo, dw_hi) /*@ where F=F,a00=vi0x4567.s0,a01=vi0x4567.s1,a02=vi0x4567.s2,a03=vi0x4567.s3,a10=vi1x4567.s0,a11=vi1x4567.s1,a12=vi1x4567.s2,a13=vi1x4567.s3,a20=vi2x4567.s0,a21=vi2x4567.s1,a22=vi2x4567.s2,a23=vi2x4567.s3 */;
      float32x4_t vo1 = dw_neon_pixel_compute(&vi1x4567, &vi2x4567, &vi3x4567, weights, dw_prev1, dw_prev2, dw_prev3, 0.0f, 0.0f, 0.0f, dw_lo, dw_hi) /*@ where F=F,a00=vi1x4567.s0,a01=vi1x4567.s1,a02=vi1x4567.s2,a03=vi1x4567.s3,a10=vi2x4567.s0,a11=vi2x4567.s1,a12=vi2x4567.s2,a13=vi2x4567.s3,a20=vi3x4567.s0,a21=vi3x4567.s1,a22=vi3x4567.s2,a23=vi3x4567.s3 */;
      float32x4_t vo2 = dw_neon_pixel_compute(&vi2x4567, &vi3x4567, &vi4x4567, weights, dw_prev2, dw_prev3, dw_prev4, 0.0f, 0.0f, 0.0f, dw_lo, dw_hi) /*@ where F=F,a00=vi2x4567.s0,a01=vi2x4567.s1,a02=vi2x4567.s2,a03=vi2x4567.s3,a10=vi3x4567.s0,a11=vi3x4567.s1,a12=vi3x4567.s2,a13=vi3x4567.s3,a20=vi4x4567.s0,a21=vi4x4567.s1,a22=vi4x4567.s2,a23=vi4x4567.s3 */;
      if (w == 4 * sizeof(float)) {
        dw_isa_store4((o2),&(vo2)) /*@ where W=W,v=&vo2,a0=vo2.s0,a1=vo2.s1,a2=vo2.s2,a3=vo2.s3 */; o2 += 4;
        dw_isa_store4((o1),&(vo1)) /*@ where W=W,v=&vo1,a0=vo1.s0,a1=vo1.s1,a2=vo1.s2,a3=vo1.s3 */; o1 += 4;
        dw_isa_store4((o0),&(vo0)) /*@ where W=W,v=&vo0,a0=vo0.s0,a1=vo0.s1,a2=vo0.s2,a3=vo0.s3 */; o0 += 4;
      } else {
        float32x2_t vo0_lo = dw_n_vget_low_f32(&(vo0)) /*@ where p_a=&vo0,a0=vo0.s0,a1=vo0.s1,a2=vo0.s2,a3=vo0.s3 */;
        float32x2_t vo1_lo = dw_n_vget_low_f32(&(vo1)) /*@ where p_a=&vo1,a0=vo1.s0,a1=vo1.s1,a2=vo1.s2,a3=vo1.s3 */;
        float32x2_t vo2_lo = dw_n_vget_low_f32(&(vo2)) /*@ where p_a=&vo2,a0=vo2.s0,a1=vo2.s1,a2=vo2.s2,a3=vo2.s3 */;
        if (w & (2 * sizeof(float))) {
          dw_isa_store2((o2),&(vo2_lo)) /*@ where W=W,v=&vo2_lo,a0=vo2_lo.s0,a1=vo2_lo.s1 */; o2 += 2;
          dw_isa_store2((o1),&(vo1_lo)) /*@ where W=W,v=&vo1_lo,a0=vo1_lo.s0,a1=vo1_lo.s1 */; o1 += 2;
          dw_isa_store2((o0),&(vo0_lo)) /*@ where W=W,v=&vo0_lo,a0=vo0_lo.s0,a1=vo0_lo.s1 */; o0 += 2;
          vo0_lo = dw_n_vget_high_f32(&(vo0)) /*@ where p_a=&vo0,a0=vo0.s0,a1=vo0.s1,a2=vo0.s2,a3=vo0.s3 */;
          vo1_lo = dw_n_vget_high_f32(&(vo1)) /*@ where p_a=&vo1,a0=vo1.s0,a1=vo1.s1,a2=vo1.s2,a3=vo1.s3 */;
          vo2_lo = dw_n_vget_high_f32(&(vo2)) /*@ where p_a=&vo2,a0=vo2.s0,a1=vo2.s1,a2=vo2.s2,a3=vo2.s3 */;
        }
        if (w & (1 * sizeof(float))) {
          dw_isa_store1((o2),&(vo2_lo),(0)) /*@ where W=W,v=&vo2_lo,a0=vo2_lo.s0,a1=vo2_lo.s1 */; o2 += 1;
          dw_isa_store1((o1),&(vo1_lo),(0)) /*@ where W=W,v=&vo1_lo,a0=vo1_lo.s0,a1=vo1_lo.s1 */; o1 += 1;
          dw_isa_store1((o0),&(vo0_lo),(0)) /*@ where W=W,v=&vo0_lo,a0=vo0_lo.s0,a1=vo0_lo.s1 */; o0 += 1;
        }
      }
    }
    i0 = (const float*) ((uintptr_t) i3 - input_decrement);
    i1 = (const float*) ((uintptr_t) i4 - input_decrement);
    i2 = (const float*) ((uintptr_t) i1 + input_width);
    i3 = (const float*) ((uintptr_t) i2 + input_width);
    i4 = (const float*) ((uintptr_t) i3 + input_width);
    o0 = o2;
    o1 = (float*) ((uintptr_t) o0 + input_width);
    o2 = (float*) ((uintptr_t) o1 + input_width);
    output_height = dw_doz((output_height),(3));
  } /*@ Inv Assert 0<H && 0<N && H<=18446744073709551615 && 4*N<=18446744073709551615 && input_width%4==0 && input_height==H && input_width==4*N && input==Input && zero==Zero && weights==Weights && output==Output && params==Params && padding_top==1 && dw_inputs(F,Input,Zero,Weights,Params,H,N) && dw_present(F,&(params->scalar.min)) && dw_present(F,&(params->scalar.max)) && dw_same(dw_get(F,&(params->scalar.min)),Lo) && dw_same(dw_get(F,&(params->scalar.max)),Hi) && W==dw_addresses(Output,H,N) && dw_distinct(W) && dw_footprint(Output,H*N) && input_decrement==((4*N+15)/16)*16 && 0<=output_height && output_height<=H && dw_outer_pointers(Input,Zero,Output,H,N,output_height,i0,i1,i2,i3,i4,o0,o1,o2) && dw_data(F) * dw_output(W,dw_progress(dw_neon_results(F,Input,Zero,Weights,H,N,Lo,Hi),O,Output,H,N,H-output_height,0)) * store(&(vmax.s0),float,Hi) * store(&(vmax.s1),float,Hi) * store(&(vmax.s2),float,Hi) * store(&(vmax.s3),float,Hi) * store(&(vmin.s0),float,Lo) * store(&(vmin.s1),float,Lo) * store(&(vmin.s2),float,Lo) * store(&(vmin.s3),float,Lo) * store(&(vw0123.s0),float,dw_get(F,Weights+4*0)) * store(&(vw0123.s1),float,dw_get(F,Weights+4*1)) * store(&(vw0123.s2),float,dw_get(F,Weights+4*2)) * store(&(vw0123.s3),float,dw_get(F,Weights+4*3)) * store(&(vw4567.s0),float,dw_get(F,Weights+4*4)) * store(&(vw4567.s1),float,dw_get(F,Weights+4*5)) * store(&(vw4567.s2),float,dw_get(F,Weights+4*6)) * store(&(vw4567.s3),float,dw_get(F,Weights+4*7)) * store(&(vw89.s0),float,dw_get(F,Weights+4*8)) * store(&(vw89.s1),float,dw_get(F,Weights+4*9)) * store(&(vmask.s0),unsigned int,dw_mask7_word(dw_mask_index(N),0)) * store(&(vmask.s1),unsigned int,dw_mask7_word(dw_mask_index(N),1)) * store(&(vmask.s2),unsigned int,dw_mask7_word(dw_mask_index(N),2)) * store(&(vmask.s3),unsigned int,dw_mask7_word(dw_mask_index(N),3)) * IntArray::full(mask_table,7,dw_mask7_values) */ while (output_height != 0);
}
