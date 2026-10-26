#ifndef HWC_NAN_HELPERS_H
#define HWC_NAN_HELPERS_H
#ifdef HWC_FORMAL
#include "clamp_views.h"
/*@ Extern Coq (hc_clamp_min : Recordvfloat32m1_t -> Recordvfloat32m1_t -> fp32 -> Z -> Prop) (hc_clamp_max : Recordvfloat32m1_t -> Recordvfloat32m1_t -> fp32 -> Z -> Prop) */
#else
#include "copy_float.h"
#endif
vfloat32m1_t hc_min_f32m1(const vfloat32m1_t *pa,float b,size_t vl)
/*@ With (A:Recordvfloat32m1_t) Require 0<=vl && vl<=4 && StructPredvfloat32m1_t(pa,A) Ensure exists(R:Recordvfloat32m1_t),hc_clamp_min(R,A,b,vl) && (StructPredvfloat32m1_t(pa,A) * StructPredvfloat32m1_t(&__return,R)) */
;
vfloat32m1_t hc_max_f32m1(const vfloat32m1_t *pa,float b,size_t vl)
/*@ With (A:Recordvfloat32m1_t) Require 0<=vl && vl<=4 && StructPredvfloat32m1_t(pa,A) Ensure exists(R:Recordvfloat32m1_t),hc_clamp_max(R,A,b,vl) && (StructPredvfloat32m1_t(pa,A) * StructPredvfloat32m1_t(&__return,R)) */
;
#endif
