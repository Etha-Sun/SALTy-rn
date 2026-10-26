#ifndef ARGMAXPOOL_NEON_SPECS_H
#define ARGMAXPOOL_NEON_SPECS_H
#include "formal_types.h"
#include "read_table.h"
/*@ Import Coq Require Import ArgmaxPool.PackModel ArgmaxPool.ReadWindows */
/*@ Extern Coq (APOutput :: *) (APIndex :: *) */
/*@ Extern Coq (ap_output:list Z->APOutput->Assertion) (ap_index:list Z->APIndex->Assertion)
 (ap_write_window:list Z->Z->Z->Prop)
 (ap_output_readable:APOutput->Z->Z->Prop) (ap_index_readable:APIndex->Z->Z->Prop)
 (ap_output_loaded_lane:APOutput->Z->Z->fp32->Prop) (ap_index_loaded_lane:APIndex->Z->Z->Z->Prop)
 (ap_output_write:APOutput->Z->Z->(Z->fp32)->APOutput) (ap_index_write:APIndex->Z->Z->(Z->Z)->APIndex)
 (ap_fpack2:fp32->fp32->Z->fp32) (ap_fpack4:fp32->fp32->fp32->fp32->Z->fp32)
 (ap_ipack2:Z->Z->Z->Z) (ap_ipack4:Z->Z->Z->Z->Z->Z) */
float32x4_t vld1q_f32(const float*p)
/*@ readonly_map With (F:APMap) Require ap_window(F,p,4) && ap_data(F)
 Ensure ap_data(F) * store(&(__return.s0),float,ap_load_lane(F,p,0)) * store(&(__return.s1),float,ap_load_lane(F,p,1)) * store(&(__return.s2),float,ap_load_lane(F,p,2)) * store(&(__return.s3),float,ap_load_lane(F,p,3)) */;
float32x4_t vld1q_f32(const float*p)
/*@ output_map With (W:list Z) (O:APOutput) Require ap_write_window(W,p,4) && ap_output_readable(O,p,4) && ap_output(W,O)
 Ensure exists (r0:fp32) (r1:fp32) (r2:fp32) (r3:fp32), ap_output_loaded_lane(O,p,0,r0) && ap_output_loaded_lane(O,p,1,r1) && ap_output_loaded_lane(O,p,2,r2) && ap_output_loaded_lane(O,p,3,r3) && ap_output(W,O) * store(&(__return.s0),float,r0) * store(&(__return.s1),float,r1) * store(&(__return.s2),float,r2) * store(&(__return.s3),float,r3) */;
uint32x4_t vld1q_u32(const uint32_t*p)
/*@ output_map With (W:list Z) (O:APIndex) Require ap_write_window(W,p,4) && ap_index_readable(O,p,4) && ap_index(W,O)
 Ensure exists (r0:Z) (r1:Z) (r2:Z) (r3:Z), ap_index_loaded_lane(O,p,0,r0) && ap_index_loaded_lane(O,p,1,r1) && ap_index_loaded_lane(O,p,2,r2) && ap_index_loaded_lane(O,p,3,r3) && ap_index(W,O) * store(&(__return.s0),unsigned int,r0) * store(&(__return.s1),unsigned int,r1) * store(&(__return.s2),unsigned int,r2) * store(&(__return.s3),unsigned int,r3) */;
uint32x4_t vdupq_n_u32(uint32_t x)
/*@ Require emp
 Ensure store(&(__return.s0),unsigned int,x) * store(&(__return.s1),unsigned int,x) * store(&(__return.s2),unsigned int,x) * store(&(__return.s3),unsigned int,x) */;
uint32x4_t vaddq_u32(uint32x4_t a,uint32x4_t b)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (b0:Z) (b1:Z) (b2:Z) (b3:Z) Require store(&(a.s0),unsigned int,a0) * store(&(a.s1),unsigned int,a1) * store(&(a.s2),unsigned int,a2) * store(&(a.s3),unsigned int,a3) * store(&(b.s0),unsigned int,b0) * store(&(b.s1),unsigned int,b1) * store(&(b.s2),unsigned int,b2) * store(&(b.s3),unsigned int,b3)
 Ensure store(&(__return.s0),unsigned int,ap_add_u32(a0,b0)) * store(&(__return.s1),unsigned int,ap_add_u32(a1,b1)) * store(&(__return.s2),unsigned int,ap_add_u32(a2,b2)) * store(&(__return.s3),unsigned int,ap_add_u32(a3,b3)) */;
uint32x4_t vcgtq_f32(float32x4_t a,float32x4_t b)
/*@ With (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32) (b0:fp32) (b1:fp32) (b2:fp32) (b3:fp32) Require store(&(a.s0),float,a0) * store(&(a.s1),float,a1) * store(&(a.s2),float,a2) * store(&(a.s3),float,a3) * store(&(b.s0),float,b0) * store(&(b.s1),float,b1) * store(&(b.s2),float,b2) * store(&(b.s3),float,b3)
 Ensure store(&(__return.s0),unsigned int,ap_gt_mask(a0,b0)) * store(&(__return.s1),unsigned int,ap_gt_mask(a1,b1)) * store(&(__return.s2),unsigned int,ap_gt_mask(a2,b2)) * store(&(__return.s3),unsigned int,ap_gt_mask(a3,b3)) */;
float32x4_t vbslq_f32(uint32x4_t m,float32x4_t a,float32x4_t b)
/*@ With (m0:Z) (m1:Z) (m2:Z) (m3:Z) (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32) (b0:fp32) (b1:fp32) (b2:fp32) (b3:fp32) Require ap_bool_mask(m0) && ap_bool_mask(m1) && ap_bool_mask(m2) && ap_bool_mask(m3) && store(&(m.s0),unsigned int,m0) * store(&(m.s1),unsigned int,m1) * store(&(m.s2),unsigned int,m2) * store(&(m.s3),unsigned int,m3) * store(&(a.s0),float,a0) * store(&(a.s1),float,a1) * store(&(a.s2),float,a2) * store(&(a.s3),float,a3) * store(&(b.s0),float,b0) * store(&(b.s1),float,b1) * store(&(b.s2),float,b2) * store(&(b.s3),float,b3)
 Ensure store(&(__return.s0),float,ap_select_f32(m0,a0,b0)) * store(&(__return.s1),float,ap_select_f32(m1,a1,b1)) * store(&(__return.s2),float,ap_select_f32(m2,a2,b2)) * store(&(__return.s3),float,ap_select_f32(m3,a3,b3)) */;
uint32x4_t vbslq_u32(uint32x4_t m,uint32x4_t a,uint32x4_t b)
/*@ With (m0:Z) (m1:Z) (m2:Z) (m3:Z) (a0:Z) (a1:Z) (a2:Z) (a3:Z) (b0:Z) (b1:Z) (b2:Z) (b3:Z) Require ap_bool_mask(m0) && ap_bool_mask(m1) && ap_bool_mask(m2) && ap_bool_mask(m3) && store(&(m.s0),unsigned int,m0) * store(&(m.s1),unsigned int,m1) * store(&(m.s2),unsigned int,m2) * store(&(m.s3),unsigned int,m3) * store(&(a.s0),unsigned int,a0) * store(&(a.s1),unsigned int,a1) * store(&(a.s2),unsigned int,a2) * store(&(a.s3),unsigned int,a3) * store(&(b.s0),unsigned int,b0) * store(&(b.s1),unsigned int,b1) * store(&(b.s2),unsigned int,b2) * store(&(b.s3),unsigned int,b3)
 Ensure store(&(__return.s0),unsigned int,ap_select_u32(m0,a0,b0)) * store(&(__return.s1),unsigned int,ap_select_u32(m1,a1,b1)) * store(&(__return.s2),unsigned int,ap_select_u32(m2,a2,b2)) * store(&(__return.s3),unsigned int,ap_select_u32(m3,a3,b3)) */;
float32x2_t vget_low_f32(float32x4_t a)
/*@ With (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32) Require store(&(a.s0),float,a0) * store(&(a.s1),float,a1) * store(&(a.s2),float,a2) * store(&(a.s3),float,a3)
 Ensure store(&(__return.s0),float,a0) * store(&(__return.s1),float,a1) */;
float32x2_t vget_high_f32(float32x4_t a)
/*@ With (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32) Require store(&(a.s0),float,a0) * store(&(a.s1),float,a1) * store(&(a.s2),float,a2) * store(&(a.s3),float,a3)
 Ensure store(&(__return.s0),float,a2) * store(&(__return.s1),float,a3) */;
uint32x2_t vget_low_u32(uint32x4_t a)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) Require store(&(a.s0),unsigned int,a0) * store(&(a.s1),unsigned int,a1) * store(&(a.s2),unsigned int,a2) * store(&(a.s3),unsigned int,a3)
 Ensure store(&(__return.s0),unsigned int,a0) * store(&(__return.s1),unsigned int,a1) */;
uint32x2_t vget_high_u32(uint32x4_t a)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) Require store(&(a.s0),unsigned int,a0) * store(&(a.s1),unsigned int,a1) * store(&(a.s2),unsigned int,a2) * store(&(a.s3),unsigned int,a3)
 Ensure store(&(__return.s0),unsigned int,a2) * store(&(__return.s1),unsigned int,a3) */;
void ap_vst1q_f32_view(float*p,const float32x4_t*a)
/*@ With (W:list Z) (O:APOutput) (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32) Require ap_write_window(W,p,4) && ap_output(W,O) * store(&(a->s0),float,a0) * store(&(a->s1),float,a1) * store(&(a->s2),float,a2) * store(&(a->s3),float,a3)
 Ensure ap_output(W,ap_output_write(O,p,4,ap_fpack4(a0,a1,a2,a3))) * store(&(a->s0),float,a0) * store(&(a->s1),float,a1) * store(&(a->s2),float,a2) * store(&(a->s3),float,a3) */;
#define vst1q_f32(p,a) ap_vst1q_f32_view((p),&(a))
void ap_vst1_f32_view(float*p,const float32x2_t*a)
/*@ With (W:list Z) (O:APOutput) (a0:fp32) (a1:fp32) Require ap_write_window(W,p,2) && ap_output(W,O) * store(&(a->s0),float,a0) * store(&(a->s1),float,a1)
 Ensure ap_output(W,ap_output_write(O,p,2,ap_fpack2(a0,a1))) * store(&(a->s0),float,a0) * store(&(a->s1),float,a1) */;
#define vst1_f32(p,a) ap_vst1_f32_view((p),&(a))
void ap_vst1_lane_f32_view(float*p,const float32x2_t*a,int lane)
/*@ With (W:list Z) (O:APOutput) (a0:fp32) (a1:fp32) Require lane==0 && ap_write_window(W,p,1) && ap_output(W,O) * store(&(a->s0),float,a0) * store(&(a->s1),float,a1)
 Ensure ap_output(W,ap_output_write(O,p,1,ap_fpack2(a0,a1))) * store(&(a->s0),float,a0) * store(&(a->s1),float,a1) */;
#define vst1_lane_f32(p,a,lane) ap_vst1_lane_f32_view((p),&(a),(lane))
void ap_vst1q_u32_view(uint32_t*p,const uint32x4_t*a)
/*@ With (W:list Z) (O:APIndex) (a0:Z) (a1:Z) (a2:Z) (a3:Z) Require ap_write_window(W,p,4) && ap_index(W,O) * store(&(a->s0),unsigned int,a0) * store(&(a->s1),unsigned int,a1) * store(&(a->s2),unsigned int,a2) * store(&(a->s3),unsigned int,a3)
 Ensure ap_index(W,ap_index_write(O,p,4,ap_ipack4(a0,a1,a2,a3))) * store(&(a->s0),unsigned int,a0) * store(&(a->s1),unsigned int,a1) * store(&(a->s2),unsigned int,a2) * store(&(a->s3),unsigned int,a3) */;
#define vst1q_u32(p,a) ap_vst1q_u32_view((p),&(a))
void ap_vst1_u32_view(uint32_t*p,const uint32x2_t*a)
/*@ With (W:list Z) (O:APIndex) (a0:Z) (a1:Z) Require ap_write_window(W,p,2) && ap_index(W,O) * store(&(a->s0),unsigned int,a0) * store(&(a->s1),unsigned int,a1)
 Ensure ap_index(W,ap_index_write(O,p,2,ap_ipack2(a0,a1))) * store(&(a->s0),unsigned int,a0) * store(&(a->s1),unsigned int,a1) */;
#define vst1_u32(p,a) ap_vst1_u32_view((p),&(a))
void ap_vst1_lane_u32_view(uint32_t*p,const uint32x2_t*a,int lane)
/*@ With (W:list Z) (O:APIndex) (a0:Z) (a1:Z) Require lane==0 && ap_write_window(W,p,1) && ap_index(W,O) * store(&(a->s0),unsigned int,a0) * store(&(a->s1),unsigned int,a1)
 Ensure ap_index(W,ap_index_write(O,p,1,ap_ipack2(a0,a1))) * store(&(a->s0),unsigned int,a0) * store(&(a->s1),unsigned int,a1) */;
#define vst1_lane_u32(p,a,lane) ap_vst1_lane_u32_view((p),&(a),(lane))
#endif
