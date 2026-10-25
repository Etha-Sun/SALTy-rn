#ifndef MAXPOOL_NEON_SPECS_H
#define MAXPOOL_NEON_SPECS_H
#include "formal_types.h"
/*@ Import Coq Require Import MaxPool.MemoryModel MaxPool.PackModel */
/*@ Extern Coq (MPFloatMap :: *) (MPOutput :: *) */
/*@ Extern Coq (mp_data:MPFloatMap->Assertion) (mp_get:MPFloatMap->Z->fp32) (mp_window:MPFloatMap->Z->Z->Prop) (mp_out:list Z->MPOutput->Assertion) (mp_write_window:list Z->Z->Z->Prop) (mp_loaded:MPOutput->Z->fp32->Prop) (mp_write:MPOutput->Z->Z->(Z->fp32)->MPOutput) (mp_pack2:fp32->fp32->Z->fp32) (mp_pack4:fp32->fp32->fp32->fp32->Z->fp32) (mp_max:fp32->fp32->fp32) (mp_min:fp32->fp32->fp32) */
float32x4_t vld1q_f32(const float*p)
/*@ readonly_map With (F:MPFloatMap) Require mp_window(F,p,4) && mp_data(F)
 Ensure mp_data(F) * store(&(__return.s0),float,mp_get(F,p+0)) * store(&(__return.s1),float,mp_get(F,p+4)) * store(&(__return.s2),float,mp_get(F,p+8)) * store(&(__return.s3),float,mp_get(F,p+12)) */;
float32x4_t vld1q_f32(const float*p)
/*@ output_map With (W:list Z) (O:MPOutput) Require mp_write_window(W,p,4) && mp_out(W,O)
 Ensure exists (r0:fp32) (r1:fp32) (r2:fp32) (r3:fp32), mp_loaded(O,p+0,r0) && mp_loaded(O,p+4,r1) && mp_loaded(O,p+8,r2) && mp_loaded(O,p+12,r3) && mp_out(W,O) * store(&(__return.s0),float,r0) * store(&(__return.s1),float,r1) * store(&(__return.s2),float,r2) * store(&(__return.s3),float,r3) */;
float32x4_t vdupq_n_f32(float x)
/*@ Require emp Ensure store(&(__return.s0),float,x) * store(&(__return.s1),float,x) * store(&(__return.s2),float,x) * store(&(__return.s3),float,x) */;
float32x4_t vmaxq_f32(float32x4_t a,float32x4_t b)
/*@ With (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32) (b0:fp32) (b1:fp32) (b2:fp32) (b3:fp32)
 Require store(&(a.s0),float,a0) * store(&(a.s1),float,a1) * store(&(a.s2),float,a2) * store(&(a.s3),float,a3) * store(&(b.s0),float,b0) * store(&(b.s1),float,b1) * store(&(b.s2),float,b2) * store(&(b.s3),float,b3)
 Ensure store(&(__return.s0),float,mp_max(a0,b0)) * store(&(__return.s1),float,mp_max(a1,b1)) * store(&(__return.s2),float,mp_max(a2,b2)) * store(&(__return.s3),float,mp_max(a3,b3)) */;
float32x4_t vminq_f32(float32x4_t a,float32x4_t b)
/*@ With (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32) (b0:fp32) (b1:fp32) (b2:fp32) (b3:fp32)
 Require store(&(a.s0),float,a0) * store(&(a.s1),float,a1) * store(&(a.s2),float,a2) * store(&(a.s3),float,a3) * store(&(b.s0),float,b0) * store(&(b.s1),float,b1) * store(&(b.s2),float,b2) * store(&(b.s3),float,b3)
 Ensure store(&(__return.s0),float,mp_min(a0,b0)) * store(&(__return.s1),float,mp_min(a1,b1)) * store(&(__return.s2),float,mp_min(a2,b2)) * store(&(__return.s3),float,mp_min(a3,b3)) */;
float32x2_t vget_low_f32(float32x4_t a)
/*@ With (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32)
 Require store(&(a.s0),float,a0) * store(&(a.s1),float,a1) * store(&(a.s2),float,a2) * store(&(a.s3),float,a3)
 Ensure store(&(__return.s0),float,a0) * store(&(__return.s1),float,a1) */;
float32x2_t vget_high_f32(float32x4_t a)
/*@ With (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32)
 Require store(&(a.s0),float,a0) * store(&(a.s1),float,a1) * store(&(a.s2),float,a2) * store(&(a.s3),float,a3)
 Ensure store(&(__return.s0),float,a2) * store(&(__return.s1),float,a3) */;
void vst1q_f32(float*p,float32x4_t a)
/*@ With (W:list Z) (O:MPOutput) (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32)
 Require mp_write_window(W,p,4) && mp_out(W,O) * store(&(a.s0),float,a0) * store(&(a.s1),float,a1) * store(&(a.s2),float,a2) * store(&(a.s3),float,a3)
 Ensure mp_out(W,mp_write(O,p,4,mp_pack4(a0,a1,a2,a3))) */;
void vst1_f32(float*p,float32x2_t a)
/*@ With (W:list Z) (O:MPOutput) (a0:fp32) (a1:fp32)
 Require mp_write_window(W,p,2) && mp_out(W,O) * store(&(a.s0),float,a0) * store(&(a.s1),float,a1)
 Ensure mp_out(W,mp_write(O,p,2,mp_pack2(a0,a1))) */;
void vst1_lane_f32(float*p,float32x2_t a,int lane)
/*@ With (W:list Z) (O:MPOutput) (a0:fp32) (a1:fp32)
 Require lane==0 && mp_write_window(W,p,1) && mp_out(W,O) * store(&(a.s0),float,a0) * store(&(a.s1),float,a1)
 Ensure mp_out(W,mp_write(O,p,1,mp_pack2(a0,a1))) */;
#endif
