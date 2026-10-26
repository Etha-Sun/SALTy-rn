#ifndef ARGMAXPOOL_RECORD_CONSUMERS_H
#define ARGMAXPOOL_RECORD_CONSUMERS_H
#include "neon_specs.h"
/*@ Import Coq Require Import ArgmaxPool.VectorRecords */
/*@ Extern Coq (Recordfloat32x4_t :: *) (Recorduint32x4_t :: *) */
/*@ Extern Coq (StructPredfloat32x4_t:Z->Recordfloat32x4_t->Assertion)
 (StructPreduint32x4_t:Z->Recorduint32x4_t->Assertion)
 (ap_record_mask4:Recorduint32x4_t->Prop)
 (ap_record_select4:Recorduint32x4_t->Recordfloat32x4_t->Recordfloat32x4_t->Recordfloat32x4_t)
 (ap_record_same4:Recordfloat32x4_t->Recordfloat32x4_t->Prop) */
float32x4_t ap_record_select4_borrow(const float32x4_t*pa,const float32x4_t*pb,const uint32x4_t*pm)
/*@ With (A:Recordfloat32x4_t) (B:Recordfloat32x4_t) (M:Recorduint32x4_t)
 Require ap_record_mask4(M) && StructPredfloat32x4_t(pa,A)*StructPredfloat32x4_t(pb,B)*StructPreduint32x4_t(pm,M)
 Ensure exists(R:Recordfloat32x4_t),ap_record_same4(R,ap_record_select4(M,A,B)) && StructPredfloat32x4_t(pa,A)*StructPredfloat32x4_t(pb,B)*StructPreduint32x4_t(pm,M)*StructPredfloat32x4_t(&__return,R) */;
#endif
