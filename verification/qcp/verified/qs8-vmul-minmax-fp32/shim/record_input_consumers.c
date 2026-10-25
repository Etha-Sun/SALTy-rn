#ifdef QS8MUL_FORMAL
#include "intrinsic_model.h"
/*@ Import Coq Require Import Qs8Mul.RecordInputViews */
/*@ Extern Coq (Recordvint8m2_t :: *) (Recordvint16m4_t :: *) */
/*@ Extern Coq (StructPredvint8m2_t:Z->Recordvint8m2_t->Assertion) (StructPredvint16m4_t:Z->Recordvint16m4_t->Assertion)
 (UndefStructPredvint8m2_t:Z->Assertion)
 (qm_record_load_allowed:RDMap->Z->Z->Prop) (qm_record_load_match:RDMap->Z->Z->Recordvint8m2_t->Prop)
 (qm_record_sext_sub_match:Z->Recordvint8m2_t->Recordvint16m4_t->Z->Prop)
 (qm_record_sext_match:Z->Recordvint8m2_t->Recordvint16m4_t->Prop)
 (qm_record_sub16_match:Z->Recordvint16m4_t->Recordvint16m4_t->Z->Prop) */
vint8m2_t qm_isa_record_load(const int8_t*p,size_t vl)
/*@ With(M:RDMap) Require 0<=vl && vl<=32 && qm_record_load_allowed(M,p,vl) && rd_mem(M)
 Ensure exists(R:Recordvint8m2_t),qm_record_load_match(M,p,vl,R) && rd_mem(M)*StructPredvint8m2_t(&__return,R) */;
vint16m4_t qm_isa_record_sext(vint8m2_t a,size_t vl)
/*@ With(A:Recordvint8m2_t) Require 0<=vl && vl<=32 && StructPredvint8m2_t(&a,A)
 Ensure exists(R:Recordvint16m4_t),qm_record_sext_match(vl,A,R) && StructPredvint16m4_t(&__return,R) */;
vint16m4_t qm_isa_record_sub16(vint16m4_t a,int16_t x,size_t vl)
/*@ With(A:Recordvint16m4_t) Require 0<=vl && vl<=32 && StructPredvint16m4_t(&a,A)
 Ensure exists(R:Recordvint16m4_t),qm_record_sub16_match(vl,A,R,x) && StructPredvint16m4_t(&__return,R) */;



#else
#include "record_compute.h"
#endif
void qm_record_load_into32(vint8m2_t*out,const int8_t*p,size_t vl)
/*@ With(M:RDMap) Require 0<=vl && vl<=32 && rd_window(M,p,vl) && rd_mem(M)*UndefStructPredvint8m2_t(out)
 Ensure exists(R:Recordvint8m2_t),qm_record_load_match(M,p,vl,R) && rd_mem(M)*StructPredvint8m2_t(out,R) */
{*out=qm_isa_record_load(p,vl) /*@ where M=M */;}

vint16m4_t qm_record_sext_sub(const vint8m2_t*p,int16_t x,size_t vl)
/*@ With(A:Recordvint8m2_t) Require 0<=vl && vl<=32 && StructPredvint8m2_t(p,A)
 Ensure exists(R:Recordvint16m4_t),qm_record_sext_sub_match(vl,A,R,x) && StructPredvint8m2_t(p,A)*StructPredvint16m4_t(&__return,R) */
{vint8m2_t a=*p;
 vint16m4_t t=qm_isa_record_sext(a,vl) /*@ where a=0 */;
 return qm_isa_record_sub16(t,x,vl) /*@ where a=0 */;}
