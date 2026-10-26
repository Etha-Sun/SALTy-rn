typedef unsigned long long size_t;
typedef unsigned long long uintptr_t;
typedef unsigned int uint32_t;
/*@ Import Coq Require Import ArgmaxPool.Model ArgmaxPool.MemoryModel */
/*@ Extern Coq (APMap :: *) */
/*@ Extern Coq (ap_data:APMap->Assertion)
 (ap_get:APMap->Z->fp32) (ap_present:APMap->Z->Prop)
 (ap_window:APMap->Z->Z->Prop) (ap_load_lane:APMap->Z->Z->fp32)
 (ap_gt_mask:fp32->fp32->Z) (ap_bool_mask:Z->Prop)
 (ap_same_bits:fp32->fp32->Prop)
 (ap_u32:Z->Z) (ap_vl:Z->Z) (ap_add_u32:Z->Z->Z)
 (ap_select_f32:Z->fp32->fp32->fp32) (ap_select_u32:Z->Z->Z->Z)
 (PtrArray::full:Z->Z->list Z->Assertion)
 (FloatArray::full:Z->Z->list fp32->Assertion)
 (FloatArray::undef_full:Z->Z->Assertion)
 (UIntArray::full:Z->Z->list Z->Assertion)
 (UIntArray::undef_full:Z->Z->Assertion)
 (Znth:{A}->Z->list A->A->A) */
/*@ Import Coq Require Import ArgmaxPool.Types */
typedef struct float32x4_t{float s0; float s1; float s2; float s3;}float32x4_t;
typedef struct float32x2_t{float s0; float s1;}float32x2_t;
typedef struct uint32x4_t{uint32_t s0; uint32_t s1; uint32_t s2; uint32_t s3;}uint32x4_t;
typedef struct uint32x2_t{uint32_t s0; uint32_t s1;}uint32x2_t;
typedef struct vfloat32m8_t{float s0; float s1; float s2; float s3; float s4; float s5; float s6; float s7; float s8; float s9; float s10; float s11; float s12; float s13; float s14; float s15; float s16; float s17; float s18; float s19; float s20; float s21; float s22; float s23; float s24; float s25; float s26; float s27; float s28; float s29; float s30; float s31;}vfloat32m8_t;
typedef struct vuint32m8_t{uint32_t s0; uint32_t s1; uint32_t s2; uint32_t s3; uint32_t s4; uint32_t s5; uint32_t s6; uint32_t s7; uint32_t s8; uint32_t s9; uint32_t s10; uint32_t s11; uint32_t s12; uint32_t s13; uint32_t s14; uint32_t s15; uint32_t s16; uint32_t s17; uint32_t s18; uint32_t s19; uint32_t s20; uint32_t s21; uint32_t s22; uint32_t s23; uint32_t s24; uint32_t s25; uint32_t s26; uint32_t s27; uint32_t s28; uint32_t s29; uint32_t s30; uint32_t s31;}vuint32m8_t;
typedef struct vbool4_t{uint32_t s0; uint32_t s1; uint32_t s2; uint32_t s3; uint32_t s4; uint32_t s5; uint32_t s6; uint32_t s7; uint32_t s8; uint32_t s9; uint32_t s10; uint32_t s11; uint32_t s12; uint32_t s13; uint32_t s14; uint32_t s15; uint32_t s16; uint32_t s17; uint32_t s18; uint32_t s19; uint32_t s20; uint32_t s21; uint32_t s22; uint32_t s23; uint32_t s24; uint32_t s25; uint32_t s26; uint32_t s27; uint32_t s28; uint32_t s29; uint32_t s30; uint32_t s31;}vbool4_t;
/*@ Import Coq Require Import ArgmaxPool.ProgramModel ArgmaxPool.MemoryFacts */
/*@ Extern Coq (APPtrMap :: *) */
/*@ Extern Coq (ap_ptr_present:APPtrMap->Z->Prop) (ap_ptr_data:APPtrMap->Assertion) (ap_ptr_get:APPtrMap->Z->Z) (ap_ptr_pop:APPtrMap->Z->APPtrMap) */
const float* ap_read_table(const float** p)
/*@ With (P:APPtrMap) Require p!=0 && ap_ptr_present(P,p) && ap_ptr_data(P)
 Ensure __return==ap_ptr_get(P,p) && ap_ptr_data(P) */;
/*@ Import Coq Require Import ArgmaxPool.ReadPreviousModel */
/*@ Extern Coq (APOutput :: *) (APIndex :: *) */
/*@ Extern Coq (ap_distinct:list Z->Prop) (ap_owned:list Z->Z->Prop)
 (ap_removed:list Z->Z->list Z) (ap_output:list Z->APOutput->Assertion)
 (ap_index:list Z->APIndex->Assertion)
 (ap_float_initialized:APOutput->Z->fp32->Prop)
 (ap_uint_initialized:APIndex->Z->Z->Prop) */
float ap_read_previous_float(const float*p)
/*@ With (W:list Z) (O:APOutput) (v:fp32)
 Require p!=0 && ap_distinct(W) && ap_owned(W,p) && ap_float_initialized(O,p,v) && ap_output(W,O)
 Ensure ap_same_bits(__return,v) && ap_output(W,O) */;
uint32_t ap_read_previous_uint(const uint32_t*p)
/*@ With (W:list Z) (O:APIndex) (v:Z)
 Require p!=0 && ap_distinct(W) && ap_owned(W,p) && ap_uint_initialized(O,p,v) && ap_index(W,O)
 Ensure __return==v && ap_index(W,O) */;
/*@ Import Coq Require Import ArgmaxPool.PackModel ArgmaxPool.ReadWindows ArgmaxPool.LaneInsertModel */
/*@ Extern Coq (APOutput :: *) (APIndex :: *) */
/*@ Extern Coq (ap_output:list Z->APOutput->Assertion) (ap_index:list Z->APIndex->Assertion)
 (ap_write_window:list Z->Z->Z->Prop)
 (ap_output_readable:APOutput->Z->Z->Prop) (ap_index_readable:APIndex->Z->Z->Prop)
 (ap_output_loaded_lane:APOutput->Z->Z->fp32->Prop) (ap_index_loaded_lane:APIndex->Z->Z->Z->Prop)
 (ap_output_write:APOutput->Z->Z->(Z->fp32)->APOutput) (ap_index_write:APIndex->Z->Z->(Z->Z)->APIndex)
 (ap_fpack2:fp32->fp32->Z->fp32) (ap_fpack4:fp32->fp32->fp32->fp32->Z->fp32)
 (ap_insert_f32:fp32->fp32->fp32->fp32->fp32->Z->Z->fp32)
 (ap_insert_u32:Z->Z->Z->Z->Z->Z->Z->Z)
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
void ap_vst1_f32_view(float*p,const float32x2_t*a)
/*@ With (W:list Z) (O:APOutput) (a0:fp32) (a1:fp32) Require ap_write_window(W,p,2) && ap_output(W,O) * store(&(a->s0),float,a0) * store(&(a->s1),float,a1)
 Ensure ap_output(W,ap_output_write(O,p,2,ap_fpack2(a0,a1))) * store(&(a->s0),float,a0) * store(&(a->s1),float,a1) */;
void ap_vst1_lane_f32_view(float*p,const float32x2_t*a,int lane)
/*@ With (W:list Z) (O:APOutput) (a0:fp32) (a1:fp32) Require lane==0 && ap_write_window(W,p,1) && ap_output(W,O) * store(&(a->s0),float,a0) * store(&(a->s1),float,a1)
 Ensure ap_output(W,ap_output_write(O,p,1,ap_fpack2(a0,a1))) * store(&(a->s0),float,a0) * store(&(a->s1),float,a1) */;
void ap_vst1q_u32_view(uint32_t*p,const uint32x4_t*a)
/*@ With (W:list Z) (O:APIndex) (a0:Z) (a1:Z) (a2:Z) (a3:Z) Require ap_write_window(W,p,4) && ap_index(W,O) * store(&(a->s0),unsigned int,a0) * store(&(a->s1),unsigned int,a1) * store(&(a->s2),unsigned int,a2) * store(&(a->s3),unsigned int,a3)
 Ensure ap_index(W,ap_index_write(O,p,4,ap_ipack4(a0,a1,a2,a3))) * store(&(a->s0),unsigned int,a0) * store(&(a->s1),unsigned int,a1) * store(&(a->s2),unsigned int,a2) * store(&(a->s3),unsigned int,a3) */;
void ap_vst1_u32_view(uint32_t*p,const uint32x2_t*a)
/*@ With (W:list Z) (O:APIndex) (a0:Z) (a1:Z) Require ap_write_window(W,p,2) && ap_index(W,O) * store(&(a->s0),unsigned int,a0) * store(&(a->s1),unsigned int,a1)
 Ensure ap_index(W,ap_index_write(O,p,2,ap_ipack2(a0,a1))) * store(&(a->s0),unsigned int,a0) * store(&(a->s1),unsigned int,a1) */;
void ap_vst1_lane_u32_view(uint32_t*p,const uint32x2_t*a,int lane)
/*@ With (W:list Z) (O:APIndex) (a0:Z) (a1:Z) Require lane==0 && ap_write_window(W,p,1) && ap_index(W,O) * store(&(a->s0),unsigned int,a0) * store(&(a->s1),unsigned int,a1)
 Ensure ap_index(W,ap_index_write(O,p,1,ap_ipack2(a0,a1))) * store(&(a->s0),unsigned int,a0) * store(&(a->s1),unsigned int,a1) */;
float32x4_t vsetq_lane_f32(float value,float32x4_t a,int lane)
/*@ With (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32) Require 0<=lane && lane<4 && store(&(a.s0),float,a0) * store(&(a.s1),float,a1) * store(&(a.s2),float,a2) * store(&(a.s3),float,a3)
 Ensure store(&(__return.s0),float,ap_insert_f32(value,a0,a1,a2,a3,lane,0)) * store(&(__return.s1),float,ap_insert_f32(value,a0,a1,a2,a3,lane,1)) * store(&(__return.s2),float,ap_insert_f32(value,a0,a1,a2,a3,lane,2)) * store(&(__return.s3),float,ap_insert_f32(value,a0,a1,a2,a3,lane,3)) */;
uint32x4_t vsetq_lane_u32(uint32_t value,uint32x4_t a,int lane)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) Require 0<=lane && lane<4 && store(&(a.s0),unsigned int,a0) * store(&(a.s1),unsigned int,a1) * store(&(a.s2),unsigned int,a2) * store(&(a.s3),unsigned int,a3)
 Ensure store(&(__return.s0),unsigned int,ap_insert_u32(value,a0,a1,a2,a3,lane,0)) * store(&(__return.s1),unsigned int,ap_insert_u32(value,a0,a1,a2,a3,lane,1)) * store(&(__return.s2),unsigned int,ap_insert_u32(value,a0,a1,a2,a3,lane,2)) * store(&(__return.s3),unsigned int,ap_insert_u32(value,a0,a1,a2,a3,lane,3)) */;
void probe_insert_f32(float*p,float x0,float x1,float x2,float x3,float value,int lane)
/*@ With(W:list Z)(O:APOutput) Require 0<=lane && lane<4 && ap_write_window(W,p,4) && ap_output(W,O) Ensure ap_output(W,ap_output_write(O,p,4,ap_fpack4(ap_insert_f32(value,x0,x1,x2,x3,lane,0),ap_insert_f32(value,x0,x1,x2,x3,lane,1),ap_insert_f32(value,x0,x1,x2,x3,lane,2),ap_insert_f32(value,x0,x1,x2,x3,lane,3)))) */
{
 float32x4_t lanes;
 lanes.s0=x0;
 lanes.s1=x1;
 lanes.s2=x2;
 lanes.s3=x3;
 lanes=vsetq_lane_f32(value,lanes,lane) /*@ where a=0 */;
 ap_vst1q_f32_view((p),&(lanes));
}
void probe_insert_u32(uint32_t*p,uint32_t x0,uint32_t x1,uint32_t x2,uint32_t x3,uint32_t value,int lane)
/*@ With(W:list Z)(O:APIndex) Require 0<=lane && lane<4 && ap_write_window(W,p,4) && ap_index(W,O) Ensure ap_index(W,ap_index_write(O,p,4,ap_ipack4(ap_insert_u32(value,x0,x1,x2,x3,lane,0),ap_insert_u32(value,x0,x1,x2,x3,lane,1),ap_insert_u32(value,x0,x1,x2,x3,lane,2),ap_insert_u32(value,x0,x1,x2,x3,lane,3)))) */
{
 uint32x4_t lanes;
 lanes.s0=x0;
 lanes.s1=x1;
 lanes.s2=x2;
 lanes.s3=x3;
 lanes=vsetq_lane_u32(value,lanes,lane) /*@ where a=0 */;
 ap_vst1q_u32_view((p),&(lanes));
}
