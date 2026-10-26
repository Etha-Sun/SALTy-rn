#ifndef ARGMAXPOOL_RVV_UPDATE_INTO_H
#define ARGMAXPOOL_RVV_UPDATE_INTO_H
#include "rvv_record_consumers.h"
/*@ Import Coq Require Import ArgmaxPool.RvvUpdateIntoModel */
/*@ Extern Coq (Recordvuint32m8_t :: *) */
/*@ Extern Coq (StructPredvuint32m8_t:Z->Recordvuint32m8_t->Assertion)
 (ap_rvv_update32:Recordvfloat32m8_t->Recordvuint32m8_t->Recordvfloat32m8_t->Recordvuint32m8_t->Recordvfloat32m8_t->Z->Z->Prop) */
void ap_rvv_update_into32(vfloat32m8_t*pa,vuint32m8_t*pi,const vfloat32m8_t*pb,uint32_t index,size_t vl)
/*@ With (A:Recordvfloat32m8_t) (I:Recordvuint32m8_t) (B:Recordvfloat32m8_t)
 Require 0<=vl && vl<=32 && StructPredvfloat32m8_t(pa,A)*StructPredvuint32m8_t(pi,I)*StructPredvfloat32m8_t(pb,B)
 Ensure exists(R:Recordvfloat32m8_t)(J:Recordvuint32m8_t),ap_rvv_update32(R,J,A,I,B,index,vl) && StructPredvfloat32m8_t(pa,R)*StructPredvuint32m8_t(pi,J)*StructPredvfloat32m8_t(pb,B) */;
#endif
