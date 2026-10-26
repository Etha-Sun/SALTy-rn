#ifndef ARGMAXPOOL_RVV_RECORD_MERGE_INTO_H
#define ARGMAXPOOL_RVV_RECORD_MERGE_INTO_H
#include "rvv_record_consumers.h"
void ap_record_rvv_merge_into32(vfloat32m8_t*pa,const vfloat32m8_t*pb,const vbool4_t*pm,size_t vl)
/*@ With (A:Recordvfloat32m8_t) (B:Recordvfloat32m8_t) (M:Recordvbool4_t)
 Require 0<=vl && vl<=32 && ap_record_mask32(M,vl) && StructPredvfloat32m8_t(pa,A)*StructPredvfloat32m8_t(pb,B)*StructPredvbool4_t(pm,M)
 Ensure exists(R:Recordvfloat32m8_t),ap_record_merge32(R,M,A,B,vl) && StructPredvfloat32m8_t(pa,R)*StructPredvfloat32m8_t(pb,B)*StructPredvbool4_t(pm,M) */;
#endif
