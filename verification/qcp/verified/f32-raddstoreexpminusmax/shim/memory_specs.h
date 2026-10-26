#ifndef EXP_MEMORY_SPECS_H
#define EXP_MEMORY_SPECS_H
#include "neon_specs.h"
/*@ Import Coq Require Import ExpMinusMax.BorrowedMemory */
/*@ Extern Coq (EMMap :: *) (EMOutput :: *) */
/*@ Extern Coq
 (em_load_record4:EMMap->Z->Recordfloat32x4_t)(em_write_record4:EMOutput->Z->Recordfloat32x4_t->EMOutput)(em_write_record2:EMOutput->Z->Recordfloat32x2_t->EMOutput)
 (em_data:EMMap->Assertion)(em_get:EMMap->Z->fp32)
 (em_present:EMMap->Z->Prop)(em_window:EMMap->Z->Z->Prop)
 (em_output:list Z->EMOutput->Assertion)(em_output_put:EMOutput->Z->fp32->EMOutput)
 (em_output_write:EMOutput->Z->Z->(Z->fp32)->EMOutput)
 (em_write_window:list Z->Z->Z->Prop)
 (em_make_float32x4_t:(Z->fp32)->Recordfloat32x4_t)
 (em_get_float32x4_t:Recordfloat32x4_t->Z->fp32)
 (em_get_float32x2_t:Recordfloat32x2_t->Z->fp32) */
float32x4_t em_isa_load4(const float*p)
/*@ With(F:EMMap)
 Require em_window(F,p,4)&&em_data(F)
 Ensure em_data(F)*StructPredfloat32x4_t(&__return,em_load_record4(F,p)) */;
float32x4_t em_isa_load_dup4(const float*p)
/*@ With(F:EMMap)
 Require em_present(F,p)&&p!=0&&em_data(F)
 Ensure em_data(F)*StructPredfloat32x4_t(&__return,em_neon_dup(em_get(F,p))) */;
void em_isa_store4(float*p,const float32x4_t*a)
/*@ With(W:list Z)(O:EMOutput)(A:Recordfloat32x4_t)
 Require em_write_window(W,p,4)&&StructPredfloat32x4_t(a,A)*em_output(W,O)
 Ensure StructPredfloat32x4_t(a,A)*em_output(W,em_write_record4(O,p,A)) */;
void em_isa_store2(float*p,const float32x2_t*a)
/*@ With(W:list Z)(O:EMOutput)(A:Recordfloat32x2_t)
 Require em_write_window(W,p,2)&&StructPredfloat32x2_t(a,A)*em_output(W,O)
 Ensure StructPredfloat32x2_t(a,A)*em_output(W,em_write_record2(O,p,A)) */;
void em_isa_store_lane0(float*p,const float32x2_t*a,int lane)
/*@ With(W:list Z)(O:EMOutput)(A:Recordfloat32x2_t)
 Require lane==0&&em_write_window(W,p,1)&&StructPredfloat32x2_t(a,A)*em_output(W,O)
 Ensure StructPredfloat32x2_t(a,A)*em_output(W,em_output_put(O,p,em_get_float32x2_t(A,0))) */;
#define vld1q_f32(p) em_isa_load4(p)
#define vld1q_dup_f32(p) em_isa_load_dup4(p)
#define vst1q_f32(p,a) em_isa_store4((p),&(a))
#define vst1_f32(p,a) em_isa_store2((p),&(a))
#define vst1_lane_f32(p,a,lane) em_isa_store_lane0((p),&(a),(lane))
#endif
