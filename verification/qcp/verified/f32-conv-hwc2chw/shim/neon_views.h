#ifndef HWC_NEON_VIEWS_H
#define HWC_NEON_VIEWS_H
#include "store_views.h"
#include "maps_model.h"
/*@ Import Coq Require Import HwcConv.NeonViewsModel */
/*@ Extern Coq (hc_window:HwcROMap->Z->Z->Prop) (hc_neon_load4:Recordfloat32x4_t->HwcROMap->Z->Prop) (hc_neon_dup4:Recordfloat32x4_t->fp32->Prop) (hc_neon_lane_load:Recordfloat32x4_t->Recordfloat32x4_t->HwcROMap->Z->Z->Prop) (hc_neon_min4:Recordfloat32x4_t->Recordfloat32x4_t->Recordfloat32x4_t->Prop) (hc_neon_max4:Recordfloat32x4_t->Recordfloat32x4_t->Recordfloat32x4_t->Prop) (hc_neon_zip1:Recordfloat32x4_t->Recordfloat32x4_t->Recordfloat32x4_t->Prop) (hc_neon_zip2:Recordfloat32x4_t->Recordfloat32x4_t->Recordfloat32x4_t->Prop) (hc_neon_store_lane:HwcOutput->Z->Recordfloat32x4_t->Z->HwcOutput) */
float32x4_t hc_isa_load4(const float *p)
/*@ With (F:HwcROMap) Require hc_window(F,p,4) && hc_data(F) Ensure exists(R:Recordfloat32x4_t),hc_neon_load4(R,F,p) && (hc_data(F)*StructPredfloat32x4_t(&__return,R)) */;
float32x4_t hc_isa_dup_load4(const float *p)
/*@ With (F:HwcROMap) Require hc_present(F,p) && hc_data(F) Ensure exists(R:Recordfloat32x4_t),hc_neon_dup4(R,hc_get(F,p)) && (hc_data(F)*StructPredfloat32x4_t(&__return,R)) */;
float32x4_t hc_isa_dup4(float x)
/*@ Require emp Ensure exists(R:Recordfloat32x4_t),hc_neon_dup4(R,x) && StructPredfloat32x4_t(&__return,R) */;
float32x4_t hc_isa_neon_min(const float32x4_t *pa,const float32x4_t *pb)
/*@ With (A:Recordfloat32x4_t) (B:Recordfloat32x4_t) Require StructPredfloat32x4_t(pa,A)*StructPredfloat32x4_t(pb,B) Ensure exists(R:Recordfloat32x4_t),hc_neon_min4(R,A,B) && (StructPredfloat32x4_t(pa,A)*StructPredfloat32x4_t(pb,B)*StructPredfloat32x4_t(&__return,R)) */;
float32x4_t hc_isa_neon_max(const float32x4_t *pa,const float32x4_t *pb)
/*@ With (A:Recordfloat32x4_t) (B:Recordfloat32x4_t) Require StructPredfloat32x4_t(pa,A)*StructPredfloat32x4_t(pb,B) Ensure exists(R:Recordfloat32x4_t),hc_neon_max4(R,A,B) && (StructPredfloat32x4_t(pa,A)*StructPredfloat32x4_t(pb,B)*StructPredfloat32x4_t(&__return,R)) */;
float32x4_t hc_isa_neon_zip1(const float32x4_t *pa,const float32x4_t *pb)
/*@ With (A:Recordfloat32x4_t) (B:Recordfloat32x4_t) Require StructPredfloat32x4_t(pa,A)*StructPredfloat32x4_t(pb,B) Ensure exists(R:Recordfloat32x4_t),hc_neon_zip1(R,A,B) && (StructPredfloat32x4_t(pa,A)*StructPredfloat32x4_t(pb,B)*StructPredfloat32x4_t(&__return,R)) */;
float32x4_t hc_isa_neon_zip2(const float32x4_t *pa,const float32x4_t *pb)
/*@ With (A:Recordfloat32x4_t) (B:Recordfloat32x4_t) Require StructPredfloat32x4_t(pa,A)*StructPredfloat32x4_t(pb,B) Ensure exists(R:Recordfloat32x4_t),hc_neon_zip2(R,A,B) && (StructPredfloat32x4_t(pa,A)*StructPredfloat32x4_t(pb,B)*StructPredfloat32x4_t(&__return,R)) */;
float32x4_t hc_isa_load_lane4(const float *p,const float32x4_t *pa,int k)
/*@ With (F:HwcROMap) (A:Recordfloat32x4_t) Require 0<=k && k<4 && hc_present(F,p) && (hc_data(F)*StructPredfloat32x4_t(pa,A)) Ensure exists(R:Recordfloat32x4_t),hc_neon_lane_load(R,A,F,p,k) && (hc_data(F)*StructPredfloat32x4_t(pa,A)*StructPredfloat32x4_t(&__return,R)) */;
void hc_isa_store_lane4(float *p,const float32x4_t *pa,int k)
/*@ With (W:list Z) (O:HwcOutput) (A:Recordfloat32x4_t) Require 0<=k && k<4 && hc_write_window(W,p,1) && (hc_output(W,O)*StructPredfloat32x4_t(pa,A)) Ensure hc_output(W,hc_neon_store_lane(O,p,A,k))*StructPredfloat32x4_t(pa,A) */;
#define vld1q_f32(p) hc_isa_load4(p)
#define vld1q_dup_f32(p) hc_isa_dup_load4(p)
#define vmovq_n_f32(x) hc_isa_dup4(x)
#define vld1q_lane_f32(p,a,k) hc_isa_load_lane4((p),&(a),(k))
#define vst1q_lane_f32(p,a,k) hc_isa_store_lane4((p),&(a),(k))
#define vminq_f32(a,b) hc_isa_neon_min(&(a),&(b))
#define vmaxq_f32(a,b) hc_isa_neon_max(&(a),&(b))
#define vzip1q_f32(a,b) hc_isa_neon_zip1(&(a),&(b))
#define vzip2q_f32(a,b) hc_isa_neon_zip2(&(a),&(b))
#endif
