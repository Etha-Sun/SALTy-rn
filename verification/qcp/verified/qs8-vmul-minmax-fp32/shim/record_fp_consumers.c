#ifdef QS8MUL_FORMAL
#include "types_def.h"
/*@ Import Coq Require Import Qs8Mul.RecordStageViews */
/*@ Extern Coq (Recordvfloat32m8_t :: *) (Recordvint32m8_t :: *) */
/*@ Extern Coq (StructPredvfloat32m8_t:Z->Recordvfloat32m8_t->Assertion) (StructPredvint32m8_t:Z->Recordvint32m8_t->Assertion) (qm_record_fmul_match:Z->Recordvfloat32m8_t->Recordvfloat32m8_t->fp32->Prop) (qm_record_fadd_match:Z->Recordvfloat32m8_t->Recordvfloat32m8_t->fp32->Prop) (qm_record_sgnj_match:Z->Recordvfloat32m8_t->Recordvfloat32m8_t->fp32->Prop) (qm_record_reinterpret_match:Z->Recordvfloat32m8_t->Recordvint32m8_t->Prop) (qm_record_cvt_match:Z->Recordvint32m8_t->Recordvfloat32m8_t->Prop) */
vfloat32m8_t qm_isa_record_fmul(vfloat32m8_t a,float x,size_t vl)
/*@ With(A:Recordvfloat32m8_t) Require 0<=vl && vl<=32 && StructPredvfloat32m8_t(&a,A) Ensure exists(R:Recordvfloat32m8_t),qm_record_fmul_match(vl,A,R,x) && StructPredvfloat32m8_t(&__return,R) */;
vfloat32m8_t qm_isa_record_fadd(vfloat32m8_t a,float x,size_t vl)
/*@ With(A:Recordvfloat32m8_t) Require 0<=vl && vl<=32 && StructPredvfloat32m8_t(&a,A) Ensure exists(R:Recordvfloat32m8_t),qm_record_fadd_match(vl,A,R,x) && StructPredvfloat32m8_t(&__return,R) */;
vfloat32m8_t qm_isa_record_sgnj(vfloat32m8_t a,float x,size_t vl)
/*@ With(A:Recordvfloat32m8_t) Require 0<=vl && vl<=32 && StructPredvfloat32m8_t(&a,A) Ensure exists(R:Recordvfloat32m8_t),qm_record_sgnj_match(vl,A,R,x) && StructPredvfloat32m8_t(&__return,R) */;
vint32m8_t qm_isa_record_reinterpret(vfloat32m8_t a)
/*@ With(A:Recordvfloat32m8_t) Require StructPredvfloat32m8_t(&a,A) Ensure exists(R:Recordvint32m8_t),qm_record_reinterpret_match(32,A,R) && StructPredvint32m8_t(&__return,R) */;
vfloat32m8_t qm_isa_record_cvt(vint32m8_t a,size_t vl)
/*@ With(A:Recordvint32m8_t) Require 0<=vl && vl<=32 && StructPredvint32m8_t(&a,A) Ensure exists(R:Recordvfloat32m8_t),qm_record_cvt_match(vl,A,R) && StructPredvfloat32m8_t(&__return,R) */;





#else
#include "record_compute.h"
#endif
vfloat32m8_t qm_record_borrow_fmul(const vfloat32m8_t*p,float x,size_t vl)
/*@ With(A:Recordvfloat32m8_t) Require 0<=vl && vl<=32 && StructPredvfloat32m8_t(p,A) Ensure exists(R:Recordvfloat32m8_t),qm_record_fmul_match(vl,A,R,x) && StructPredvfloat32m8_t(p,A)*StructPredvfloat32m8_t(&__return,R) */
{vfloat32m8_t a=*p;return qm_isa_record_fmul(a,x,vl) /*@ where a=0 */;}

vfloat32m8_t qm_record_borrow_fadd(const vfloat32m8_t*p,float x,size_t vl)
/*@ With(A:Recordvfloat32m8_t) Require 0<=vl && vl<=32 && StructPredvfloat32m8_t(p,A) Ensure exists(R:Recordvfloat32m8_t),qm_record_fadd_match(vl,A,R,x) && StructPredvfloat32m8_t(p,A)*StructPredvfloat32m8_t(&__return,R) */
{vfloat32m8_t a=*p;return qm_isa_record_fadd(a,x,vl) /*@ where a=0 */;}

vfloat32m8_t qm_record_borrow_sgnj(const vfloat32m8_t*p,float x,size_t vl)
/*@ With(A:Recordvfloat32m8_t) Require 0<=vl && vl<=32 && StructPredvfloat32m8_t(p,A) Ensure exists(R:Recordvfloat32m8_t),qm_record_sgnj_match(vl,A,R,x) && StructPredvfloat32m8_t(p,A)*StructPredvfloat32m8_t(&__return,R) */
{vfloat32m8_t a=*p;return qm_isa_record_sgnj(a,x,vl) /*@ where a=0 */;}

vint32m8_t qm_record_borrow_reinterpret(const vfloat32m8_t*p)
/*@ With(A:Recordvfloat32m8_t) Require StructPredvfloat32m8_t(p,A) Ensure exists(R:Recordvint32m8_t),qm_record_reinterpret_match(32,A,R) && StructPredvfloat32m8_t(p,A)*StructPredvint32m8_t(&__return,R) */
{vfloat32m8_t a=*p;return qm_isa_record_reinterpret(a) /*@ where a=0 */;}
