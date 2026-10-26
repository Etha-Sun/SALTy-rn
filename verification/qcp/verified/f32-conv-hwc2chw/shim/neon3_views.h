#ifndef HWC_NEON3_VIEWS_H
#define HWC_NEON3_VIEWS_H
#include "vector_types.h"
/*@ Import Coq Require Import HwcConv.Neon3Model */
/*@ Extern Coq (hc_neon_fma4 : Recordfloat32x4_t -> Recordfloat32x4_t -> Recordfloat32x4_t -> Recordfloat32x4_t -> Z -> Prop) */
float32x4_t hc_isa_neon_fma0(const float32x4_t *pa,const float32x4_t *pw,const float32x4_t *px)
/*@ With (A:Recordfloat32x4_t) (W:Recordfloat32x4_t) (X:Recordfloat32x4_t) Require StructPredfloat32x4_t(pa,A)*StructPredfloat32x4_t(pw,W)*StructPredfloat32x4_t(px,X) Ensure exists(R:Recordfloat32x4_t), hc_neon_fma4(R,A,W,X,0) && (StructPredfloat32x4_t(pa,A)*StructPredfloat32x4_t(pw,W)*StructPredfloat32x4_t(px,X)*StructPredfloat32x4_t(&__return,R)) */;
float32x4_t hc_isa_neon_fma1(const float32x4_t *pa,const float32x4_t *pw,const float32x4_t *px)
/*@ With (A:Recordfloat32x4_t) (W:Recordfloat32x4_t) (X:Recordfloat32x4_t) Require StructPredfloat32x4_t(pa,A)*StructPredfloat32x4_t(pw,W)*StructPredfloat32x4_t(px,X) Ensure exists(R:Recordfloat32x4_t), hc_neon_fma4(R,A,W,X,1) && (StructPredfloat32x4_t(pa,A)*StructPredfloat32x4_t(pw,W)*StructPredfloat32x4_t(px,X)*StructPredfloat32x4_t(&__return,R)) */;
float32x4_t hc_isa_neon_fma2(const float32x4_t *pa,const float32x4_t *pw,const float32x4_t *px)
/*@ With (A:Recordfloat32x4_t) (W:Recordfloat32x4_t) (X:Recordfloat32x4_t) Require StructPredfloat32x4_t(pa,A)*StructPredfloat32x4_t(pw,W)*StructPredfloat32x4_t(px,X) Ensure exists(R:Recordfloat32x4_t), hc_neon_fma4(R,A,W,X,2) && (StructPredfloat32x4_t(pa,A)*StructPredfloat32x4_t(pw,W)*StructPredfloat32x4_t(px,X)*StructPredfloat32x4_t(&__return,R)) */;
float32x4_t hc_isa_neon_fma3(const float32x4_t *pa,const float32x4_t *pw,const float32x4_t *px)
/*@ With (A:Recordfloat32x4_t) (W:Recordfloat32x4_t) (X:Recordfloat32x4_t) Require StructPredfloat32x4_t(pa,A)*StructPredfloat32x4_t(pw,W)*StructPredfloat32x4_t(px,X) Ensure exists(R:Recordfloat32x4_t), hc_neon_fma4(R,A,W,X,3) && (StructPredfloat32x4_t(pa,A)*StructPredfloat32x4_t(pw,W)*StructPredfloat32x4_t(px,X)*StructPredfloat32x4_t(&__return,R)) */;
#define vfmaq_laneq_f32(a,w,x,k) hc_isa_neon_fma##k(&(a),&(w),&(x))
#endif
