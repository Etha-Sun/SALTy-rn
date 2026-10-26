#ifndef ARGMAXPOOL_NEON_RECORD_COMPARE_H
#define ARGMAXPOOL_NEON_RECORD_COMPARE_H
#include "record_consumers.h"
/*@ Import Coq Require Import ArgmaxPool.NeonRecordCompareModel */
/*@ Extern Coq (ap_record_gt4:Recordfloat32x4_t->Recordfloat32x4_t->Recorduint32x4_t)
 (ap_record_same_u4:Recorduint32x4_t->Recorduint32x4_t->Prop) */
uint32x4_t ap_record_neon_gt4(const float32x4_t*pa,const float32x4_t*pb)
/*@ With (A:Recordfloat32x4_t) (B:Recordfloat32x4_t)
 Require StructPredfloat32x4_t(pa,A)*StructPredfloat32x4_t(pb,B)
 Ensure exists(R:Recorduint32x4_t),ap_record_same_u4(R,ap_record_gt4(A,B)) && ap_record_mask4(R) && StructPredfloat32x4_t(pa,A)*StructPredfloat32x4_t(pb,B)*StructPreduint32x4_t(&__return,R) */;
#endif
