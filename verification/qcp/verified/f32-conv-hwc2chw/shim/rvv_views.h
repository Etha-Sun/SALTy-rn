#ifndef HWC_RVV_VIEWS_H
#define HWC_RVV_VIEWS_H
#include "clamp_views.h"
#include "maps_model.h"
#include "store_views.h"
/*@ Import Coq Require Import HwcConv.RvvViewsModel */
/*@ Extern Coq (hc_rvv_vl:Z->Z->Prop) (hc_rvv_splat:Recordvfloat32m1_t->fp32->Z->Prop) (hc_rvv_id:Recordvuint32m1_t->Z->Prop) (hc_mask_ge:Recordvbool32_t->Recordvuint32m1_t->Z->Z->Prop) (hc_mask_lt:Recordvbool32_t->Recordvuint32m1_t->Z->Z->Prop) (hc_mask_and:Recordvbool32_t->Recordvbool32_t->Recordvbool32_t->Z->Prop) (hc_masked_window:HwcROMap->Z->Z->Recordvbool32_t->Z->Prop) (hc_masked_load:Recordvfloat32m1_t->HwcROMap->Z->Z->Recordvbool32_t->Z->Prop) (hc_rvv_fma:Recordvfloat32m1_t->Recordvfloat32m1_t->Recordvfloat32m1_t->fp32->Z->Prop) (hc_rvv_fma_mu:Recordvfloat32m1_t->Recordvfloat32m1_t->Recordvfloat32m1_t->fp32->Recordvbool32_t->Z->Prop) (hc_store_rvv:HwcOutput->Z->Recordvfloat32m1_t->Z->HwcOutput) */
size_t hc_isa_vsetvl(size_t avl)
/*@ Require emp Ensure hc_rvv_vl(avl,__return) && emp */;
vfloat32m1_t hc_isa_rvv_splat(float x,size_t vl)
/*@ Require 0<=vl && vl<=4 && emp Ensure exists(R:Recordvfloat32m1_t),hc_rvv_splat(R,x,vl) && (StructPredvfloat32m1_t(&__return,R)) */;
vuint32m1_t hc_isa_rvv_id(size_t vl)
/*@ Require 0<=vl && vl<=4 && emp Ensure exists(R:Recordvuint32m1_t),hc_rvv_id(R,vl) && (StructPredvuint32m1_t(&__return,R)) */;
vbool32_t hc_isa_mask_ge(const vuint32m1_t *pa,unsigned int x,size_t vl)
/*@ With (A:Recordvuint32m1_t) Require 0<=vl && vl<=4 && StructPredvuint32m1_t(pa,A) Ensure exists(R:Recordvbool32_t),hc_mask_ge(R,A,x,vl) && hc_legal_mask(R,vl) && (StructPredvuint32m1_t(pa,A)*StructPredvbool32_t(&__return,R)) */;
vbool32_t hc_isa_mask_lt(const vuint32m1_t *pa,unsigned int x,size_t vl)
/*@ With (A:Recordvuint32m1_t) Require 0<=vl && vl<=4 && StructPredvuint32m1_t(pa,A) Ensure exists(R:Recordvbool32_t),hc_mask_lt(R,A,x,vl) && hc_legal_mask(R,vl) && (StructPredvuint32m1_t(pa,A)*StructPredvbool32_t(&__return,R)) */;
vbool32_t hc_isa_mask_and(const vbool32_t *pa,const vbool32_t *pb,size_t vl)
/*@ With (A:Recordvbool32_t) (B:Recordvbool32_t) Require 0<=vl && vl<=4 && hc_legal_mask(A,vl) && hc_legal_mask(B,vl) && (StructPredvbool32_t(pa,A)*StructPredvbool32_t(pb,B)) Ensure exists(R:Recordvbool32_t),hc_mask_and(R,A,B,vl) && hc_legal_mask(R,vl) && (StructPredvbool32_t(pa,A)*StructPredvbool32_t(pb,B)*StructPredvbool32_t(&__return,R)) */;
vfloat32m1_t hc_isa_masked_strided_load(const vbool32_t *pm,const float *p,ptrdiff_t stride,size_t vl)
/*@ With (F:HwcROMap) (M:Recordvbool32_t) Require 0<=vl && vl<=4 && hc_legal_mask(M,vl) && hc_masked_window(F,p,stride,M,vl) && (hc_data(F)*StructPredvbool32_t(pm,M)) Ensure exists(R:Recordvfloat32m1_t),hc_masked_load(R,F,p,stride,M,vl) && (hc_data(F)*StructPredvbool32_t(pm,M)*StructPredvfloat32m1_t(&__return,R)) */;
vfloat32m1_t hc_isa_rvv_fma(const vfloat32m1_t *pa,float w,const vfloat32m1_t *px,size_t vl)
/*@ With (A:Recordvfloat32m1_t) (X:Recordvfloat32m1_t) Require 0<=vl && vl<=4 && (StructPredvfloat32m1_t(pa,A)*StructPredvfloat32m1_t(px,X)) Ensure exists(R:Recordvfloat32m1_t),hc_rvv_fma(R,A,X,w,vl) && (StructPredvfloat32m1_t(pa,A)*StructPredvfloat32m1_t(px,X)*StructPredvfloat32m1_t(&__return,R)) */;
vfloat32m1_t hc_isa_rvv_fma_mu(const vbool32_t *pm,const vfloat32m1_t *pa,float w,const vfloat32m1_t *px,size_t vl)
/*@ With (M:Recordvbool32_t) (A:Recordvfloat32m1_t) (X:Recordvfloat32m1_t) Require 0<=vl && vl<=4 && hc_legal_mask(M,vl) && (StructPredvbool32_t(pm,M)*StructPredvfloat32m1_t(pa,A)*StructPredvfloat32m1_t(px,X)) Ensure exists(R:Recordvfloat32m1_t),hc_rvv_fma_mu(R,A,X,w,M,vl) && (StructPredvbool32_t(pm,M)*StructPredvfloat32m1_t(pa,A)*StructPredvfloat32m1_t(px,X)*StructPredvfloat32m1_t(&__return,R)) */;
void hc_isa_rvv_store(float *p,const vfloat32m1_t *pa,size_t vl)
/*@ With (W:list Z) (O:HwcOutput) (A:Recordvfloat32m1_t) Require 0<=vl && vl<=4 && hc_write_window(W,p,vl) && (hc_output(W,O)*StructPredvfloat32m1_t(pa,A)) Ensure hc_output(W,hc_store_rvv(O,p,A,vl))*StructPredvfloat32m1_t(pa,A) */;
#define __riscv_vsetvl_e32m1(avl) hc_isa_vsetvl(avl)
#define __riscv_vfmv_v_f_f32m1(x,vl) hc_isa_rvv_splat((x),(vl))
#define __riscv_vid_v_u32m1(vl) hc_isa_rvv_id(vl)
#define __riscv_vmsgeu_vx_u32m1_b32(a,x,vl) hc_isa_mask_ge(&(a),(x),(vl))
#define __riscv_vmsltu_vx_u32m1_b32(a,x,vl) hc_isa_mask_lt(&(a),(x),(vl))
#define __riscv_vmand_mm_b32(a,b,vl) hc_isa_mask_and(&(a),&(b),(vl))
#define __riscv_vlse32_v_f32m1_m(m,p,s,vl) hc_isa_masked_strided_load(&(m),(p),(s),(vl))
#define __riscv_vfmacc_vf_f32m1(a,w,x,vl) hc_isa_rvv_fma(&(a),(w),&(x),(vl))
#define __riscv_vfmacc_vf_f32m1_mu(m,a,w,x,vl) hc_isa_rvv_fma_mu(&(m),&(a),(w),&(x),(vl))
#define __riscv_vse32_v_f32m1(p,a,vl) hc_isa_rvv_store((p),&(a),(vl))
#endif
