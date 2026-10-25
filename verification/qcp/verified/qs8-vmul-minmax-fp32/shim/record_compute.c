#ifdef QS8MUL_FORMAL
#include "scalar_nan.h"
#include "types_def.h"
/*@ Import Coq Require Import Qs8Mul.RecordViews */
/*@ Extern Coq (Recordvint16m4_t :: *) (Recordvint32m8_t :: *) */
/*@ Extern Coq (StructPredvint16m4_t:Z->Recordvint16m4_t->Assertion) (StructPredvint32m8_t:Z->Recordvint32m8_t->Assertion) (qm_record_wmul_match:Z->Recordvint32m8_t->Recordvint16m4_t->Recordvint16m4_t->Prop) */
/* This is one original RVV signed widening multiply spec view: no C body and
   no ordinary compound computation is exempted. Fixed VLEN128/SEW16/LMUL4,
   result SEW32/LMUL8, VLMAX32. Active exact signed16 product; inactive free. */
vint32m8_t qm_isa_wmul_record_view(vint16m4_t a,vint16m4_t b,size_t vl)
/*@ With(A:Recordvint16m4_t)(B:Recordvint16m4_t)
 Require 0<=vl && vl<=32 && StructPredvint16m4_t(&a,A)*StructPredvint16m4_t(&b,B)
 Ensure exists(R:Recordvint32m8_t),qm_record_wmul_match(vl,R,A,B) && StructPredvint32m8_t(&__return,R) */;
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
vfloat32m8_t qm_record_borrow_fmul(const vfloat32m8_t*p,float x,size_t vl)
/*@ With(A:Recordvfloat32m8_t) Require 0<=vl && vl<=32 && StructPredvfloat32m8_t(p,A) Ensure exists(R:Recordvfloat32m8_t),qm_record_fmul_match(vl,A,R,x) && StructPredvfloat32m8_t(p,A)*StructPredvfloat32m8_t(&__return,R) */;
vfloat32m8_t qm_record_borrow_fadd(const vfloat32m8_t*p,float x,size_t vl)
/*@ With(A:Recordvfloat32m8_t) Require 0<=vl && vl<=32 && StructPredvfloat32m8_t(p,A) Ensure exists(R:Recordvfloat32m8_t),qm_record_fadd_match(vl,A,R,x) && StructPredvfloat32m8_t(p,A)*StructPredvfloat32m8_t(&__return,R) */;
vfloat32m8_t qm_record_borrow_sgnj(const vfloat32m8_t*p,float x,size_t vl)
/*@ With(A:Recordvfloat32m8_t) Require 0<=vl && vl<=32 && StructPredvfloat32m8_t(p,A) Ensure exists(R:Recordvfloat32m8_t),qm_record_sgnj_match(vl,A,R,x) && StructPredvfloat32m8_t(p,A)*StructPredvfloat32m8_t(&__return,R) */;
vint32m8_t qm_record_borrow_reinterpret(const vfloat32m8_t*p)
/*@ With(A:Recordvfloat32m8_t) Require StructPredvfloat32m8_t(p,A) Ensure exists(R:Recordvint32m8_t),qm_record_reinterpret_match(32,A,R) && StructPredvfloat32m8_t(p,A)*StructPredvint32m8_t(&__return,R) */;
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
vint16m4_t qm_record_sext_sub(const vint8m2_t*p,int16_t x,size_t vl)
/*@ With(A:Recordvint8m2_t) Require 0<=vl && vl<=32 && StructPredvint8m2_t(p,A)
 Ensure exists(R:Recordvint16m4_t),qm_record_sext_sub_match(vl,A,R,x) && StructPredvint8m2_t(p,A)*StructPredvint16m4_t(&__return,R) */;

/*@ Import Coq Require Import Qs8Mul.RecordComputeModel */
/*@ Extern Coq (qm_record_compute_match:Z->Recordvint8m2_t->Recordvint8m2_t->Recordvint8m2_t->Z->Z->fp32->Z->Z->Z->Prop) */
/*@ Extern Coq (qm_record_ssub_match:Z->Recordvint32m8_t->Recordvint32m8_t->Z->Prop) */
vint32m8_t qm_isa_record_ssub(vint32m8_t a,int32_t x,size_t vl)
/*@ With(A:Recordvint32m8_t) Require 0<=vl && vl<=32 && StructPredvint32m8_t(&a,A) Ensure exists(R:Recordvint32m8_t),qm_record_ssub_match(vl,A,R,x) && StructPredvint32m8_t(&__return,R) */;
/*@ Extern Coq (qm_record_clip16_match:Z->Recordvint32m8_t->Recordvint16m4_t->Prop) */
vint16m4_t qm_isa_record_clip16(vint32m8_t a,size_t shift,unsigned int vxrm,size_t vl)
/*@ With(A:Recordvint32m8_t) Require shift==0 && vxrm==2 && 0<=vl && vl<=32 && StructPredvint32m8_t(&a,A) Ensure exists(R:Recordvint16m4_t),qm_record_clip16_match(vl,A,R) && StructPredvint16m4_t(&__return,R) */;
/*@ Extern Coq (qm_record_clip8_match:Z->Recordvint16m4_t->Recordvint8m2_t->Prop) */
vint8m2_t qm_isa_record_clip8(vint16m4_t a,size_t shift,unsigned int vxrm,size_t vl)
/*@ With(A:Recordvint16m4_t) Require shift==0 && vxrm==2 && 0<=vl && vl<=32 && StructPredvint16m4_t(&a,A) Ensure exists(R:Recordvint8m2_t),qm_record_clip8_match(vl,A,R) && StructPredvint8m2_t(&__return,R) */;
/*@ Extern Coq (qm_record_max8_match:Z->Recordvint8m2_t->Recordvint8m2_t->Z->Prop) */
vint8m2_t qm_isa_record_max8(vint8m2_t a,int8_t x,size_t vl)
/*@ With(A:Recordvint8m2_t) Require 0<=vl && vl<=32 && StructPredvint8m2_t(&a,A) Ensure exists(R:Recordvint8m2_t),qm_record_max8_match(vl,A,R,x) && StructPredvint8m2_t(&__return,R) */;
/*@ Extern Coq (qm_record_min8_match:Z->Recordvint8m2_t->Recordvint8m2_t->Z->Prop) */
vint8m2_t qm_isa_record_min8(vint8m2_t a,int8_t x,size_t vl)
/*@ With(A:Recordvint8m2_t) Require 0<=vl && vl<=32 && StructPredvint8m2_t(&a,A) Ensure exists(R:Recordvint8m2_t),qm_record_min8_match(vl,A,R,x) && StructPredvint8m2_t(&__return,R) */;


#else
#include "record_compute.h"
#endif
vint8m2_t qm_record_compute(const vint8m2_t*pa,const vint8m2_t*pb,int16_t az,int16_t bz,float scale,int16_t oz,int8_t lo,int8_t hi,size_t vl)
/*@ With(A:Recordvint8m2_t)(B:Recordvint8m2_t)
 Require 0<=vl && vl<=32 && StructPredvint8m2_t(pa,A)*StructPredvint8m2_t(pb,B)
 Ensure exists(R:Recordvint8m2_t),qm_record_compute_match(vl,A,B,R,az,bz,scale,oz,lo,hi) && StructPredvint8m2_t(pa,A)*StructPredvint8m2_t(pb,B)*StructPredvint8m2_t(&__return,R) */
{
 vint16m4_t vxa=qm_record_sext_sub(pa,az,vl);
 vint16m4_t vxb=qm_record_sext_sub(pb,bz,vl);
 vint32m8_t vacc=qm_isa_wmul_record_view(vxa,vxb,vl) /*@ where a=0,b=0 */;
 vfloat32m8_t vfpacc=qm_isa_record_cvt(vacc,vl) /*@ where a=0 */;
 vfpacc=qm_record_borrow_fmul(&vfpacc,scale,vl);
 vfpacc=qm_record_borrow_fadd(&vfpacc,12582912.0f,vl);
 if(qm_scale_is_nan(scale)){
  vfpacc=qm_record_borrow_sgnj(&vfpacc,scale,vl);
 }
 vacc=qm_record_borrow_reinterpret(&vfpacc);
 vacc=qm_isa_record_ssub(vacc,INT32_C(0x4B400000)-(int32_t)oz,vl) /*@ where a=0 */;
 vint16m4_t vout16=qm_isa_record_clip16(vacc,0,__RISCV_VXRM_RDN,vl) /*@ where a=0 */;
 vint8m2_t vout=qm_isa_record_clip8(vout16,0,__RISCV_VXRM_RDN,vl) /*@ where a=0 */;
 vout=qm_isa_record_max8(vout,lo,vl) /*@ where a=0 */;
 vout=qm_isa_record_min8(vout,hi,vl) /*@ where a=0 */;
 return vout;
}
