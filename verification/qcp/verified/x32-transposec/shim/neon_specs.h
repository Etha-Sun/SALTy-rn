#ifndef X32_TRANSPOSE_NEON_SPECS_H
#define X32_TRANSPOSE_NEON_SPECS_H
#ifndef QCP_NATIVE
#include "formal_types.h"
/*@ Extern Coq (XTMap :: *) (XTOutput :: *) */
/*@ Extern Coq (xt_data:XTMap->Assertion) (xt_window:XTMap->Z->Z->Prop) (xt_load_lane:XTMap->Z->Z->Z) (xt_output:list Z->XTOutput->Assertion) (xt_write_window:list Z->Z->Z->Prop) (xt_write_pair:XTOutput->Z->Z->Z->XTOutput) (xt_output_put:XTOutput->Z->Z->XTOutput) */
uint32x2_t vld1_u32(const uint32_t*p)
/*@ With(F:XTMap) Require xt_window(F,p,2) && xt_data(F)
 Ensure xt_data(F) * store(&(__return.s0),unsigned int,xt_load_lane(F,p,0)) * store(&(__return.s1),unsigned int,xt_load_lane(F,p,1)) */;
uint32x2_t vmov_n_u32(uint32_t x)
/*@ Require emp Ensure store(&(__return.s0),unsigned int,x) * store(&(__return.s1),unsigned int,x) */;
uint32x2_t xt_intrinsic_zip1(const uint32x2_t*a,const uint32x2_t*b)
/*@ With(a0:Z)(a1:Z)(b0:Z)(b1:Z)
 Require store(&(a->s0),unsigned int,a0) * store(&(a->s1),unsigned int,a1) * store(&(b->s0),unsigned int,b0) * store(&(b->s1),unsigned int,b1)
 Ensure store(&(a->s0),unsigned int,a0) * store(&(a->s1),unsigned int,a1) * store(&(b->s0),unsigned int,b0) * store(&(b->s1),unsigned int,b1) * store(&(__return.s0),unsigned int,a0) * store(&(__return.s1),unsigned int,b0) */;
uint32x2_t xt_intrinsic_zip2(const uint32x2_t*a,const uint32x2_t*b)
/*@ With(a0:Z)(a1:Z)(b0:Z)(b1:Z)
 Require store(&(a->s0),unsigned int,a0) * store(&(a->s1),unsigned int,a1) * store(&(b->s0),unsigned int,b0) * store(&(b->s1),unsigned int,b1)
 Ensure store(&(a->s0),unsigned int,a0) * store(&(a->s1),unsigned int,a1) * store(&(b->s0),unsigned int,b0) * store(&(b->s1),unsigned int,b1) * store(&(__return.s0),unsigned int,a1) * store(&(__return.s1),unsigned int,b1) */;
void xt_intrinsic_store_lane_0(uint32_t*p,const uint32x2_t*v)
/*@ With(W:list Z)(O:XTOutput)(x0:Z)(x1:Z)
 Require xt_write_window(W,p,1) && xt_output(W,O) * store(&(v->s0),unsigned int,x0) * store(&(v->s1),unsigned int,x1)
 Ensure xt_output(W,xt_output_put(O,p,x0)) * store(&(v->s0),unsigned int,x0) * store(&(v->s1),unsigned int,x1) */;
void xt_intrinsic_store2(uint32_t*p,const uint32x2_t*v)
/*@ With(W:list Z)(O:XTOutput)(x0:Z)(x1:Z)
 Require xt_write_window(W,p,2) && xt_output(W,O) * store(&(v->s0),unsigned int,x0) * store(&(v->s1),unsigned int,x1)
 Ensure xt_output(W,xt_write_pair(O,p,x0,x1)) * store(&(v->s0),unsigned int,x0) * store(&(v->s1),unsigned int,x1) */;
#define vzip1_u32(a,b) xt_intrinsic_zip1(&(a),&(b))
#define vzip2_u32(a,b) xt_intrinsic_zip2(&(a),&(b))
#define vst1_u32(p,a) xt_intrinsic_store2(p,&(a))
#define vst1_lane_u32(p,a,lane) xt_intrinsic_store_lane_##lane(p,&(a))
#endif
#endif
