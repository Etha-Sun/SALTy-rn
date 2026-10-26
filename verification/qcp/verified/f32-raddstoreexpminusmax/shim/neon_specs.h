#ifndef EXP_NEON_SPECS_H
#define EXP_NEON_SPECS_H
#include "types_def.h"
/*@ Import Coq Require Import ExpMinusMax.IntrinsicModel */
/*@ Extern Coq (em_same:fp32->fp32->Prop) (em_neon_add:Recordfloat32x4_t->Recordfloat32x4_t->Recordfloat32x4_t) (em_neon_sub:Recordfloat32x4_t->Recordfloat32x4_t->Recordfloat32x4_t) (em_neon_mul:Recordfloat32x4_t->Recordfloat32x4_t->Recordfloat32x4_t) (em_neon_reint_f_i:Recordfloat32x4_t->Recordint32x4_t) (em_neon_reint_i_f:Recordint32x4_t->Recordfloat32x4_t) (em_neon_reint_f_u:Recordfloat32x4_t->Recorduint32x4_t) (em_neon_reint_u_f:Recorduint32x4_t->Recordfloat32x4_t) (em_neon_low:Recordfloat32x4_t->Recordfloat32x2_t) (em_neon_high:Recordfloat32x4_t->Recordfloat32x2_t) (em_neon_dup:fp32->Recordfloat32x4_t) (em_neon_fma:Recordfloat32x4_t->Recordfloat32x4_t->Recordfloat32x4_t->Recordfloat32x4_t) (em_neon_slli:Recordint32x4_t->Z->Recordint32x4_t) (em_neon_clt:Recordfloat32x4_t->Recordfloat32x4_t->Recorduint32x4_t) (em_neon_bic:Recorduint32x4_t->Recorduint32x4_t->Recorduint32x4_t) (em_neon_reduce4:Recordfloat32x4_t->fp32) (em_neon_reduce2:Recordfloat32x2_t->fp32) (em_get_float32x2_t:Recordfloat32x2_t->Z->fp32) */
float32x4_t em_isa_add4(const float32x4_t*a,const float32x4_t*b)
/*@ With (A:Recordfloat32x4_t)(B:Recordfloat32x4_t)
 Require StructPredfloat32x4_t(a,A)*StructPredfloat32x4_t(b,B)
 Ensure StructPredfloat32x4_t(a,A)*StructPredfloat32x4_t(b,B)*StructPredfloat32x4_t(&__return,em_neon_add(A,B)) */;
float32x4_t em_isa_sub4(const float32x4_t*a,const float32x4_t*b)
/*@ With (A:Recordfloat32x4_t)(B:Recordfloat32x4_t)
 Require StructPredfloat32x4_t(a,A)*StructPredfloat32x4_t(b,B)
 Ensure StructPredfloat32x4_t(a,A)*StructPredfloat32x4_t(b,B)*StructPredfloat32x4_t(&__return,em_neon_sub(A,B)) */;
float32x4_t em_isa_mul4(const float32x4_t*a,const float32x4_t*b)
/*@ With (A:Recordfloat32x4_t)(B:Recordfloat32x4_t)
 Require StructPredfloat32x4_t(a,A)*StructPredfloat32x4_t(b,B)
 Ensure StructPredfloat32x4_t(a,A)*StructPredfloat32x4_t(b,B)*StructPredfloat32x4_t(&__return,em_neon_mul(A,B)) */;
int32x4_t em_isa_reint_f_i(const float32x4_t*a)
/*@ With (A:Recordfloat32x4_t)
 Require StructPredfloat32x4_t(a,A)
 Ensure StructPredfloat32x4_t(a,A)*StructPredint32x4_t(&__return,em_neon_reint_f_i(A)) */;
float32x4_t em_isa_reint_i_f(const int32x4_t*a)
/*@ With (A:Recordint32x4_t)
 Require StructPredint32x4_t(a,A)
 Ensure StructPredint32x4_t(a,A)*StructPredfloat32x4_t(&__return,em_neon_reint_i_f(A)) */;
uint32x4_t em_isa_reint_f_u(const float32x4_t*a)
/*@ With (A:Recordfloat32x4_t)
 Require StructPredfloat32x4_t(a,A)
 Ensure StructPredfloat32x4_t(a,A)*StructPreduint32x4_t(&__return,em_neon_reint_f_u(A)) */;
float32x4_t em_isa_reint_u_f(const uint32x4_t*a)
/*@ With (A:Recorduint32x4_t)
 Require StructPreduint32x4_t(a,A)
 Ensure StructPreduint32x4_t(a,A)*StructPredfloat32x4_t(&__return,em_neon_reint_u_f(A)) */;
float32x2_t em_isa_low(const float32x4_t*a)
/*@ With (A:Recordfloat32x4_t)
 Require StructPredfloat32x4_t(a,A)
 Ensure StructPredfloat32x4_t(a,A)*StructPredfloat32x2_t(&__return,em_neon_low(A)) */;
float32x2_t em_isa_high(const float32x4_t*a)
/*@ With (A:Recordfloat32x4_t)
 Require StructPredfloat32x4_t(a,A)
 Ensure StructPredfloat32x4_t(a,A)*StructPredfloat32x2_t(&__return,em_neon_high(A)) */;
float32x4_t em_isa_dup4(float x)
/*@ With (X:fp32)
 Require em_same(x,X)&&emp
 Ensure StructPredfloat32x4_t(&__return,em_neon_dup(X)) */;
float32x4_t em_isa_fma4(const float32x4_t*a,const float32x4_t*b,const float32x4_t*c)
/*@ With (A:Recordfloat32x4_t)(B:Recordfloat32x4_t)(C:Recordfloat32x4_t)
 Require StructPredfloat32x4_t(a,A)*StructPredfloat32x4_t(b,B)*StructPredfloat32x4_t(c,C)
 Ensure StructPredfloat32x4_t(a,A)*StructPredfloat32x4_t(b,B)*StructPredfloat32x4_t(c,C)*StructPredfloat32x4_t(&__return,em_neon_fma(A,B,C)) */;
int32x4_t em_isa_slli4(const int32x4_t*a,int n)
/*@ With (A:Recordint32x4_t)
 Require 0<=n&&n<32&&StructPredint32x4_t(a,A)
 Ensure StructPredint32x4_t(a,A)*StructPredint32x4_t(&__return,em_neon_slli(A,n)) */;
uint32x4_t em_isa_clt4(const float32x4_t*a,const float32x4_t*b)
/*@ With (A:Recordfloat32x4_t)(B:Recordfloat32x4_t)
 Require StructPredfloat32x4_t(a,A)*StructPredfloat32x4_t(b,B)
 Ensure StructPredfloat32x4_t(a,A)*StructPredfloat32x4_t(b,B)*StructPreduint32x4_t(&__return,em_neon_clt(A,B)) */;
uint32x4_t em_isa_bic4(const uint32x4_t*a,const uint32x4_t*b)
/*@ With (A:Recorduint32x4_t)(B:Recorduint32x4_t)
 Require StructPreduint32x4_t(a,A)*StructPreduint32x4_t(b,B)
 Ensure StructPreduint32x4_t(a,A)*StructPreduint32x4_t(b,B)*StructPreduint32x4_t(&__return,em_neon_bic(A,B)) */;
float em_isa_reduce4(const float32x4_t*a)
/*@ With (A:Recordfloat32x4_t)
 Require StructPredfloat32x4_t(a,A)
 Ensure em_same(__return,em_neon_reduce4(A))&&StructPredfloat32x4_t(a,A) */;
float em_isa_reduce2(const float32x2_t*a)
/*@ With (A:Recordfloat32x2_t)
 Require StructPredfloat32x2_t(a,A)
 Ensure em_same(__return,em_neon_reduce2(A))&&StructPredfloat32x2_t(a,A) */;
float em_isa_lane2(const float32x2_t*a,int lane)
/*@ With (A:Recordfloat32x2_t)
 Require 0<=lane&&lane<2&&StructPredfloat32x2_t(a,A)
 Ensure em_same(__return,em_get_float32x2_t(A,lane))&&StructPredfloat32x2_t(a,A) */;
#define vaddq_f32(a,b) em_isa_add4(&(a),&(b))
#define vsubq_f32(a,b) em_isa_sub4(&(a),&(b))
#define vmulq_f32(a,b) em_isa_mul4(&(a),&(b))
#define vreinterpretq_s32_f32(a) em_isa_reint_f_i(&(a))
#define vreinterpretq_f32_s32(a) em_isa_reint_i_f(&(a))
#define vreinterpretq_u32_f32(a) em_isa_reint_f_u(&(a))
#define vreinterpretq_f32_u32(a) em_isa_reint_u_f(&(a))
#define vget_low_f32(a) em_isa_low(&(a))
#define vget_high_f32(a) em_isa_high(&(a))
#define vmovq_n_f32(x) em_isa_dup4(x)
#define vfmaq_f32(a,b,c) em_isa_fma4(&(a),&(b),&(c))
#define vshlq_n_s32(a,n) em_isa_slli4(&(a),(n))
#define vcltq_f32(a,b) em_isa_clt4(&(a),&(b))
#define vbicq_u32(a,b) em_isa_bic4(&(a),&(b))
#define vaddvq_f32(a) em_isa_reduce4(&(a))
#define vaddv_f32(a) em_isa_reduce2(&(a))
#define vget_lane_f32(a,lane) em_isa_lane2(&(a),(lane))
#endif
