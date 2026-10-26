#ifndef EXP_RVV_SPECS_H
#define EXP_RVV_SPECS_H
#include "memory_specs.h"
/*@ Import Coq Require Import ExpMinusMax.RvvIntrinsicModel */
/*@ Extern Coq (em_legal_vl:Z->Z->Prop) (em_rvv_dup_p:fp32->Z->Recordvfloat32m4_t->Prop) (em_rvv_load_p:EMMap->Z->Z->Recordvfloat32m4_t->Prop) (em_rvv_sub_p:Recordvfloat32m4_t->fp32->Z->Recordvfloat32m4_t->Prop) (em_rvv_mac_vf_p:Recordvfloat32m4_t->fp32->Recordvfloat32m4_t->Z->Recordvfloat32m4_t->Prop) (em_rvv_mad_vf_p:Recordvfloat32m4_t->fp32->Recordvfloat32m4_t->Z->Recordvfloat32m4_t->Prop) (em_rvv_mac_vv_p:Recordvfloat32m4_t->Recordvfloat32m4_t->Recordvfloat32m4_t->Z->Recordvfloat32m4_t->Prop) (em_rvv_mul_p:Recordvfloat32m4_t->Recordvfloat32m4_t->Z->Recordvfloat32m4_t->Prop) (em_rvv_merge_p:Recordvfloat32m4_t->fp32->Recordvbool8_t->Z->Recordvfloat32m4_t->Prop) (em_rvv_slide_p:Recordvfloat32m4_t->Z->Z->Recordvfloat32m4_t->Prop) (em_rvv_mask_p:Recordvfloat32m4_t->fp32->Z->Recordvbool8_t->Prop) (em_rvv_reint_f_i:Recordvfloat32m4_t->Recordvint32m4_t) (em_rvv_reint_i_f:Recordvint32m4_t->Recordvfloat32m4_t) (em_rvv_shift_p:Recordvint32m4_t->Z->Z->Recordvint32m4_t->Prop) (em_rvv_add_tu:Recordvfloat32m4_t->Recordvfloat32m4_t->Z->Recordvfloat32m4_t) (em_get_vfloat32m4_t:Recordvfloat32m4_t->Z->fp32) (em_rvv_write:EMOutput->Z->Z->Recordvfloat32m4_t->EMOutput) */
size_t em_isa_vlmax(void)
/*@ Require emp
 Ensure __return==16&&emp */;
size_t em_isa_setvl(size_t avl)
/*@ Require emp
 Ensure em_legal_vl(avl,__return)&&emp */;
vfloat32m4_t em_isa_dup16(float x,size_t vl)
/*@ With (X:fp32)
 Require 0<=vl&&vl<=16&&em_same(x,X)&&emp
 Ensure exists (R:Recordvfloat32m4_t),em_rvv_dup_p(X,vl,R)&&StructPredvfloat32m4_t(&__return,R) */;
vfloat32m4_t em_isa_load16(const float*p,size_t vl)
/*@ With (F:EMMap)
 Require 0<=vl&&vl<=16&&(vl==0||em_window(F,p,vl))&&em_data(F)
 Ensure exists (R:Recordvfloat32m4_t),em_rvv_load_p(F,p,vl,R)&&em_data(F)*StructPredvfloat32m4_t(&__return,R) */;
vfloat32m4_t em_isa_sub16(const vfloat32m4_t*a,float x,size_t vl)
/*@ With (A:Recordvfloat32m4_t)(X:fp32)
 Require 0<=vl&&vl<=16&&em_same(x,X)&&StructPredvfloat32m4_t(a,A)
 Ensure exists (R:Recordvfloat32m4_t),em_rvv_sub_p(A,X,vl,R)&&StructPredvfloat32m4_t(a,A)*StructPredvfloat32m4_t(&__return,R) */;
vfloat32m4_t em_isa_macvf16(const vfloat32m4_t*a,float x,const vfloat32m4_t*b,size_t vl)
/*@ With (A:Recordvfloat32m4_t)(B:Recordvfloat32m4_t)(X:fp32)
 Require 0<=vl&&vl<=16&&em_same(x,X)&&StructPredvfloat32m4_t(a,A)*StructPredvfloat32m4_t(b,B)
 Ensure exists (R:Recordvfloat32m4_t),em_rvv_mac_vf_p(A,X,B,vl,R)&&StructPredvfloat32m4_t(a,A)*StructPredvfloat32m4_t(b,B)*StructPredvfloat32m4_t(&__return,R) */;
vfloat32m4_t em_isa_madvf16(const vfloat32m4_t*a,float x,const vfloat32m4_t*b,size_t vl)
/*@ With (A:Recordvfloat32m4_t)(B:Recordvfloat32m4_t)(X:fp32)
 Require 0<=vl&&vl<=16&&em_same(x,X)&&StructPredvfloat32m4_t(a,A)*StructPredvfloat32m4_t(b,B)
 Ensure exists (R:Recordvfloat32m4_t),em_rvv_mad_vf_p(A,X,B,vl,R)&&StructPredvfloat32m4_t(a,A)*StructPredvfloat32m4_t(b,B)*StructPredvfloat32m4_t(&__return,R) */;
vfloat32m4_t em_isa_macvv16(const vfloat32m4_t*a,const vfloat32m4_t*b,const vfloat32m4_t*c,size_t vl)
/*@ With (A:Recordvfloat32m4_t)(B:Recordvfloat32m4_t)(C:Recordvfloat32m4_t)
 Require 0<=vl&&vl<=16&&StructPredvfloat32m4_t(a,A)*StructPredvfloat32m4_t(b,B)*StructPredvfloat32m4_t(c,C)
 Ensure exists (R:Recordvfloat32m4_t),em_rvv_mac_vv_p(A,B,C,vl,R)&&StructPredvfloat32m4_t(a,A)*StructPredvfloat32m4_t(b,B)*StructPredvfloat32m4_t(c,C)*StructPredvfloat32m4_t(&__return,R) */;
vfloat32m4_t em_isa_mul16(const vfloat32m4_t*a,const vfloat32m4_t*b,size_t vl)
/*@ With (A:Recordvfloat32m4_t)(B:Recordvfloat32m4_t)
 Require 0<=vl&&vl<=16&&StructPredvfloat32m4_t(a,A)*StructPredvfloat32m4_t(b,B)
 Ensure exists (R:Recordvfloat32m4_t),em_rvv_mul_p(A,B,vl,R)&&StructPredvfloat32m4_t(a,A)*StructPredvfloat32m4_t(b,B)*StructPredvfloat32m4_t(&__return,R) */;
vfloat32m4_t em_isa_merge16(const vfloat32m4_t*a,float x,const vbool8_t*m,size_t vl)
/*@ With (A:Recordvfloat32m4_t)(M:Recordvbool8_t)(X:fp32)
 Require 0<=vl&&vl<=16&&em_same(x,X)&&StructPredvfloat32m4_t(a,A)*StructPredvbool8_t(m,M)
 Ensure exists (R:Recordvfloat32m4_t),em_rvv_merge_p(A,X,M,vl,R)&&StructPredvfloat32m4_t(a,A)*StructPredvbool8_t(m,M)*StructPredvfloat32m4_t(&__return,R) */;
vfloat32m4_t em_isa_slide16(const vfloat32m4_t*a,size_t offset,size_t vl)
/*@ With (A:Recordvfloat32m4_t)
 Require 0<=vl&&vl<=16&&StructPredvfloat32m4_t(a,A)
 Ensure exists (R:Recordvfloat32m4_t),em_rvv_slide_p(A,offset,vl,R)&&StructPredvfloat32m4_t(a,A)*StructPredvfloat32m4_t(&__return,R) */;
vbool8_t em_isa_mask16(const vfloat32m4_t*a,float x,size_t vl)
/*@ With (A:Recordvfloat32m4_t)(X:fp32)
 Require 0<=vl&&vl<=16&&em_same(x,X)&&StructPredvfloat32m4_t(a,A)
 Ensure exists (R:Recordvbool8_t),em_rvv_mask_p(A,X,vl,R)&&StructPredvfloat32m4_t(a,A)*StructPredvbool8_t(&__return,R) */;
vint32m4_t em_isa_reint_f_i16(const vfloat32m4_t*a)
/*@ With (A:Recordvfloat32m4_t)
 Require StructPredvfloat32m4_t(a,A)
 Ensure StructPredvfloat32m4_t(a,A)*StructPredvint32m4_t(&__return,em_rvv_reint_f_i(A)) */;
vfloat32m4_t em_isa_reint_i_f16(const vint32m4_t*a)
/*@ With (A:Recordvint32m4_t)
 Require StructPredvint32m4_t(a,A)
 Ensure StructPredvint32m4_t(a,A)*StructPredvfloat32m4_t(&__return,em_rvv_reint_i_f(A)) */;
vint32m4_t em_isa_shift16(const vint32m4_t*a,size_t offset,size_t vl)
/*@ With (A:Recordvint32m4_t)
 Require 0<=vl&&vl<=16&&StructPredvint32m4_t(a,A)
 Ensure exists (R:Recordvint32m4_t),em_rvv_shift_p(A,offset,vl,R)&&StructPredvint32m4_t(a,A)*StructPredvint32m4_t(&__return,R) */;
float em_isa_first16(const vfloat32m4_t*a)
/*@ With (A:Recordvfloat32m4_t)
 Require StructPredvfloat32m4_t(a,A)
 Ensure em_same(__return,em_get_vfloat32m4_t(A,0))&&StructPredvfloat32m4_t(a,A) */;
vfloat32m4_t em_isa_addtu16(const vfloat32m4_t*d,const vfloat32m4_t*a,const vfloat32m4_t*b,size_t vl)
/*@ With (A:Recordvfloat32m4_t)(B:Recordvfloat32m4_t)
 Require d==a&&0<=vl&&vl<=16&&StructPredvfloat32m4_t(a,A)*StructPredvfloat32m4_t(b,B)
 Ensure StructPredvfloat32m4_t(a,A)*StructPredvfloat32m4_t(b,B)*StructPredvfloat32m4_t(&__return,em_rvv_add_tu(A,B,vl)) */;
void em_isa_store16(float*p,const vfloat32m4_t*a,size_t vl)
/*@ With (W:list Z)(O:EMOutput)(A:Recordvfloat32m4_t)
 Require 0<=vl&&vl<=16&&(vl==0||em_write_window(W,p,vl))&&StructPredvfloat32m4_t(a,A)*em_output(W,O)
 Ensure StructPredvfloat32m4_t(a,A)*em_output(W,em_rvv_write(O,p,vl,A)) */;
#define __riscv_vsetvlmax_e32m4() em_isa_vlmax()
#define __riscv_vsetvl_e32m4(avl) em_isa_setvl(avl)
#define __riscv_vfmv_v_f_f32m4(x,vl) em_isa_dup16((x),(vl))
#define __riscv_vle32_v_f32m4(p,vl) em_isa_load16((p),(vl))
#define __riscv_vfsub_vf_f32m4(a,x,vl) em_isa_sub16(&(a),(x),(vl))
#define __riscv_vfmacc_vf_f32m4(a,x,b,vl) em_isa_macvf16(&(a),(x),&(b),(vl))
#define __riscv_vfmadd_vf_f32m4(a,x,b,vl) em_isa_madvf16(&(a),(x),&(b),(vl))
#define __riscv_vfmacc_vv_f32m4(a,b,c,vl) em_isa_macvv16(&(a),&(b),&(c),(vl))
#define __riscv_vfmul_vv_f32m4(a,b,vl) em_isa_mul16(&(a),&(b),(vl))
#define __riscv_vfmerge_vfm_f32m4(a,x,m,vl) em_isa_merge16(&(a),(x),&(m),(vl))
#define __riscv_vslidedown_vx_f32m4(a,offset,vl) em_isa_slide16(&(a),(offset),(vl))
#define __riscv_vmflt_vf_f32m4_b8(a,x,vl) em_isa_mask16(&(a),(x),(vl))
#define __riscv_vreinterpret_v_f32m4_i32m4(a) em_isa_reint_f_i16(&(a))
#define __riscv_vreinterpret_v_i32m4_f32m4(a) em_isa_reint_i_f16(&(a))
#define __riscv_vsll_vx_i32m4(a,offset,vl) em_isa_shift16(&(a),(offset),(vl))
#define __riscv_vfmv_f_s_f32m4_f32(a) em_isa_first16(&(a))
#define __riscv_vfadd_vv_f32m4_tu(d,a,b,vl) em_isa_addtu16(&(d),&(a),&(b),(vl))
#define __riscv_vse32_v_f32m4(p,a,vl) em_isa_store16((p),&(a),(vl))
#endif
