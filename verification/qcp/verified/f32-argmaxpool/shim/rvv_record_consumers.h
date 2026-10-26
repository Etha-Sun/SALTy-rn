#ifndef ARGMAXPOOL_RVV_RECORD_CONSUMERS_H
#define ARGMAXPOOL_RVV_RECORD_CONSUMERS_H
#include "rvv_specs.h"
/*@ Import Coq Require Import ArgmaxPool.RvvVectorRecords */
/*@ Extern Coq (Recordvfloat32m8_t :: *) (Recordvbool4_t :: *) */
/*@ Extern Coq (StructPredvfloat32m8_t:Z->Recordvfloat32m8_t->Assertion)
 (StructPredvbool4_t:Z->Recordvbool4_t->Assertion)
 (ap_record_mask32:Recordvbool4_t->Z->Prop)
 (ap_record_gt32:Recordvbool4_t->Recordvfloat32m8_t->Recordvfloat32m8_t->Z->Prop)
 (ap_record_merge32:Recordvfloat32m8_t->Recordvbool4_t->Recordvfloat32m8_t->Recordvfloat32m8_t->Z->Prop) */
vbool4_t ap_record_rvv_gt32(const vfloat32m8_t*pa,const vfloat32m8_t*pb,size_t vl)
/*@ With (A:Recordvfloat32m8_t) (B:Recordvfloat32m8_t) Require 0<=vl && vl<=32 && StructPredvfloat32m8_t(pa,A)*StructPredvfloat32m8_t(pb,B)
 Ensure exists(R:Recordvbool4_t),ap_record_gt32(R,A,B,vl) && ap_record_mask32(R,vl) && StructPredvfloat32m8_t(pa,A)*StructPredvfloat32m8_t(pb,B)*StructPredvbool4_t(&__return,R) */;
vfloat32m8_t ap_record_rvv_merge32(const vfloat32m8_t*pa,const vfloat32m8_t*pb,const vbool4_t*pm,size_t vl)
/*@ With (A:Recordvfloat32m8_t) (B:Recordvfloat32m8_t) (M:Recordvbool4_t) Require 0<=vl && vl<=32 && ap_record_mask32(M,vl) && StructPredvfloat32m8_t(pa,A)*StructPredvfloat32m8_t(pb,B)*StructPredvbool4_t(pm,M)
 Ensure exists(R:Recordvfloat32m8_t),ap_record_merge32(R,M,A,B,vl) && StructPredvfloat32m8_t(pa,A)*StructPredvfloat32m8_t(pb,B)*StructPredvbool4_t(pm,M)*StructPredvfloat32m8_t(&__return,R) */;
#endif
