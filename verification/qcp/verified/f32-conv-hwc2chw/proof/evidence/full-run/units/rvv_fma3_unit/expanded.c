/* Explicit formal LP64 frontend widths, audited with actual sizeof probes later. */
typedef unsigned long long size_t;
typedef unsigned long long uintptr_t;
typedef long long ptrdiff_t;
/*@ Import Coq Require Import HwcConv.Types */
/* Faithful explicit scalar-field frontend views; physical SIMD ABI mapping remains source-reviewed. */
typedef struct float32x2_t {float s0; float s1;} float32x2_t;
typedef struct float32x4_t {float s0; float s1; float s2; float s3;} float32x4_t;
typedef struct vfloat32m1_t {float s0; float s1; float s2; float s3;} vfloat32m1_t;
typedef struct uint32x4_t {unsigned int s0; unsigned int s1; unsigned int s2; unsigned int s3;} uint32x4_t;
typedef struct vuint32m1_t {unsigned int s0; unsigned int s1; unsigned int s2; unsigned int s3;} vuint32m1_t;
typedef struct vbool32_t {unsigned int s0; unsigned int s1; unsigned int s2; unsigned int s3;} vbool32_t;
/*@ Import Coq Require Import HwcConv.VectorRecords */
/*@ Extern Coq (Recordfloat32x2_t :: *) */
/*@ Extern Coq (StructPredfloat32x2_t : Z -> Recordfloat32x2_t -> Assertion) */
/*@ Extern Coq (Recordfloat32x4_t :: *) */
/*@ Extern Coq (StructPredfloat32x4_t : Z -> Recordfloat32x4_t -> Assertion) */
/*@ Extern Coq (Recordvfloat32m1_t :: *) */
/*@ Extern Coq (StructPredvfloat32m1_t : Z -> Recordvfloat32m1_t -> Assertion) */
/*@ Extern Coq (Recorduint32x4_t :: *) */
/*@ Extern Coq (StructPreduint32x4_t : Z -> Recorduint32x4_t -> Assertion) */
/*@ Extern Coq (Recordvuint32m1_t :: *) */
/*@ Extern Coq (StructPredvuint32m1_t : Z -> Recordvuint32m1_t -> Assertion) */
/*@ Extern Coq (Recordvbool32_t :: *) */
/*@ Extern Coq (StructPredvbool32_t : Z -> Recordvbool32_t -> Assertion) */
/*@ Import Coq Require Import HwcConv.FloatCopyModel */
/*@ Extern Coq (hc_same_bits : fp32 -> fp32 -> Prop) */
float hc_copy_float(float x)
/*@ Require emp Ensure hc_same_bits(__return,x) && emp */
;
/*@ Import Coq Require Import HwcConv.ClampModel HwcConv.MaskModel */
/*@ Extern Coq (hc_legal_mask : Recordvbool32_t -> Z -> Prop) (hc_uconstant : Recordvuint32m1_t -> Z -> Z -> Prop)
 (hc_reinterpret : Recordvfloat32m1_t -> Recordvuint32m1_t -> Prop)
 (hc_selfmask : Recordvbool32_t -> Recordvfloat32m1_t -> Z -> Prop)
 (hc_isa_min : Recordvfloat32m1_t -> Recordvfloat32m1_t -> fp32 -> Z -> Prop)
 (hc_isa_max : Recordvfloat32m1_t -> Recordvfloat32m1_t -> fp32 -> Z -> Prop)
 (hc_isa_merge : Recordvfloat32m1_t -> Recordvfloat32m1_t -> Recordvfloat32m1_t -> Recordvbool32_t -> Z -> Prop) */
vuint32m1_t hc_isa_splat_u32(unsigned int x,size_t vl)
/*@ Require 0<=vl && vl<=4 && emp Ensure exists(R:Recordvuint32m1_t), hc_uconstant(R,x,vl) && StructPredvuint32m1_t(&__return,R) */;
vfloat32m1_t hc_isa_bits_to_float(const vuint32m1_t *a)
/*@ With (A:Recordvuint32m1_t) Require StructPredvuint32m1_t(a,A) Ensure exists(R:Recordvfloat32m1_t),hc_reinterpret(R,A) && (StructPredvuint32m1_t(a,A) * StructPredvfloat32m1_t(&__return,R)) */;
vbool32_t hc_isa_self_ne(const vfloat32m1_t *a,size_t vl)
/*@ With (A:Recordvfloat32m1_t) Require 0<=vl && vl<=4 && StructPredvfloat32m1_t(a,A) Ensure exists(R:Recordvbool32_t),hc_selfmask(R,A,vl) && hc_legal_mask(R,vl) && (StructPredvfloat32m1_t(a,A) * StructPredvbool32_t(&__return,R)) */;
vfloat32m1_t hc_isa_min_view(const vfloat32m1_t *a,float b,size_t vl)
/*@ With (A:Recordvfloat32m1_t) Require 0<=vl && vl<=4 && StructPredvfloat32m1_t(a,A) Ensure exists(R:Recordvfloat32m1_t),hc_isa_min(R,A,b,vl) && (StructPredvfloat32m1_t(a,A) * StructPredvfloat32m1_t(&__return,R)) */;
vfloat32m1_t hc_isa_max_view(const vfloat32m1_t *a,float b,size_t vl)
/*@ With (A:Recordvfloat32m1_t) Require 0<=vl && vl<=4 && StructPredvfloat32m1_t(a,A) Ensure exists(R:Recordvfloat32m1_t),hc_isa_max(R,A,b,vl) && (StructPredvfloat32m1_t(a,A) * StructPredvfloat32m1_t(&__return,R)) */;
vfloat32m1_t hc_isa_merge_view(const vfloat32m1_t *a,const vfloat32m1_t *b,const vbool32_t *m,size_t vl)
/*@ With (A:Recordvfloat32m1_t) (B:Recordvfloat32m1_t) (Mask:Recordvbool32_t) Require 0<=vl && vl<=4 && hc_legal_mask(Mask,vl) && (StructPredvfloat32m1_t(a,A) * StructPredvfloat32m1_t(b,B) * StructPredvbool32_t(m,Mask)) Ensure exists(R:Recordvfloat32m1_t),hc_isa_merge(R,A,B,Mask,vl) && (StructPredvfloat32m1_t(a,A) * StructPredvfloat32m1_t(b,B) * StructPredvbool32_t(m,Mask) * StructPredvfloat32m1_t(&__return,R)) */;
/* Source-call guard: both operands must be the same side-effect-free local a. */
/*@ Import Coq Require Import HwcConv.MemoryFacts HwcConv.FloatCopyModel */
/*@ Extern Coq (HwcROMap :: *) */
/*@ Extern Coq (hc_data:HwcROMap->Assertion) (hc_get:HwcROMap->Z->fp32)
 (hc_present:HwcROMap->Z->Prop) (hc_pop:HwcROMap->Z->HwcROMap)
 (hc_same_bits:fp32->fp32->Prop) */
/*@ Import Coq Require Import HwcConv.StoreViewsModel */
/*@ Extern Coq (HwcOutput :: *) */
/*@ Extern Coq (hc_output: list Z -> HwcOutput -> Assertion)
 (hc_write_window: list Z -> Z -> Z -> Prop)
 (hc_low2:Recordfloat32x2_t->Recordfloat32x4_t->Prop)
 (hc_high2:Recordfloat32x2_t->Recordfloat32x4_t->Prop)
 (hc_store2:HwcOutput->Z->Recordfloat32x2_t->HwcOutput)
 (hc_store_low2:HwcOutput->Z->Recordfloat32x4_t->HwcOutput)
 (hc_store_high2:HwcOutput->Z->Recordfloat32x4_t->HwcOutput) */
float32x2_t hc_isa_get_low2(const float32x4_t *pa)
/*@ With (A:Recordfloat32x4_t) Require StructPredfloat32x4_t(pa,A)
 Ensure exists(R:Recordfloat32x2_t),hc_low2(R,A) &&
 (StructPredfloat32x4_t(pa,A)*StructPredfloat32x2_t(&__return,R)) */;
float32x2_t hc_isa_get_high2(const float32x4_t *pa)
/*@ With (A:Recordfloat32x4_t) Require StructPredfloat32x4_t(pa,A)
 Ensure exists(R:Recordfloat32x2_t),hc_high2(R,A) &&
 (StructPredfloat32x4_t(pa,A)*StructPredfloat32x2_t(&__return,R)) */;
void hc_isa_store2(float *p,const float32x2_t *pa)
/*@ With (A:Recordfloat32x2_t) (O:HwcOutput) (W:list Z)
 Require hc_write_window(W,p,2) && hc_output(W,O)*StructPredfloat32x2_t(pa,A)
 Ensure hc_output(W,hc_store2(O,p,A))*StructPredfloat32x2_t(pa,A) */;
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
/*@ include strategies "hc_maps.strategies" */
float hc_read_scalar(const float *p)
/*@ With (F:HwcROMap) Require hc_present(F,p) && hc_data(F)
 Ensure hc_same_bits(__return,hc_get(F,p)) && hc_data(F) */;
/*@ Import Coq Require Import HwcConv.RvvRowsFma3Model */
/*@ Extern Coq (hc_footprint:Z->Z->Prop) (hc_window:HwcROMap->Z->Z->Prop)
 (hc_rvv_rows_group:Recordvfloat32m1_t->Recordvfloat32m1_t->HwcROMap->Z->Z->Z->Z->Z->Z->Z->Z->Z->Z->Prop) */
vfloat32m1_t hc_rvv_rows_fma3(const vfloat32m1_t *pa,const float *p0,const float *p1,const float *p2,const float *w,size_t width,size_t x,unsigned int dx,unsigned int ci,unsigned int lane,size_t vl)
/*@ With(F:HwcROMap) (A:Recordvfloat32m1_t) Require 0<width && 0<=x && x<(width+1)/2 && 0<=dx && dx<3 && 0<=ci && ci<3 && 0<=lane && lane<4 && 0<=vl && vl<=4 && vl<=(width+1)/2-x && hc_footprint(p0,3*width+3) && hc_footprint(p1,3*width+3) && hc_footprint(p2,3*width+3) && hc_footprint(w,112) && hc_window(F,p0,3*width+3) && hc_window(F,p1,3*width+3) && hc_window(F,p2,3*width+3) && hc_window(F,w,112) && (hc_data(F)*StructPredvfloat32m1_t(pa,A)) Ensure exists(R:Recordvfloat32m1_t),hc_rvv_rows_group(R,A,F,p0,p1,p2,w,width,x,dx,ci,lane,vl) && (hc_data(F)*StructPredvfloat32m1_t(pa,A)*StructPredvfloat32m1_t(&__return,R)) */;
vfloat32m1_t hc_rvv_rows_fma3(const vfloat32m1_t *pa,const float *p0,const float *p1,const float *p2,const float *w,size_t width,size_t x,unsigned int dx,unsigned int ci,unsigned int lane,size_t vl)
/*@ With(F:HwcROMap) (A:Recordvfloat32m1_t) Require 0<width && 0<=x && x<(width+1)/2 && 0<=dx && dx<3 && 0<=ci && ci<3 && 0<=lane && lane<4 && 0<=vl && vl<=4 && vl<=(width+1)/2-x && hc_footprint(p0,3*width+3) && hc_footprint(p1,3*width+3) && hc_footprint(p2,3*width+3) && hc_footprint(w,112) && hc_window(F,p0,3*width+3) && hc_window(F,p1,3*width+3) && hc_window(F,p2,3*width+3) && hc_window(F,w,112) && (hc_data(F)*StructPredvfloat32m1_t(pa,A)) Ensure exists(R:Recordvfloat32m1_t),hc_rvv_rows_group(R,A,F,p0,p1,p2,w,width,x,dx,ci,lane,vl) && (hc_data(F)*StructPredvfloat32m1_t(pa,A)*StructPredvfloat32m1_t(&__return,R)) */
{
 vfloat32m1_t a=*pa;
 vfloat32m1_t z=hc_isa_rvv_splat((0.0f),(vl));
 vuint32m1_t id=hc_isa_rvv_id(vl);
 unsigned int start=(dx==0 && x==0)?1u:0u;
 unsigned int end=(unsigned int)vl;
 if(dx==2 && (width&1u)!=0 && (width+1)/2-x==vl)end-=1u;
 vbool32_t ge=hc_isa_mask_ge(&(id),(start),(vl));
 vbool32_t lt=hc_isa_mask_lt(&(id),(end),(vl));
 vbool32_t m=hc_isa_mask_and(&(ge),&(lt),(vl));
 uintptr_t off=x*24u+(dx*3u+ci)*4u;
 {
  vfloat32m1_t ld=hc_isa_masked_strided_load(&(m),((const float*)((uintptr_t)p0-12u+off)),(24),(vl)) /*@ where F=F */;
  vfloat32m1_t v=hc_isa_merge_view(&(z),&(ld),&(m),vl);
  float wk=hc_read_scalar(w+4u+(dx*9u+ci*3u+0u)*4u+lane) /*@ where F=F */;
  if(dx==2)a=hc_isa_rvv_fma_mu(&(m),&(a),(wk),&(v),(vl));
  else a=hc_isa_rvv_fma(&(a),(wk),&(v),(vl));
 }
 {
  vfloat32m1_t ld=hc_isa_masked_strided_load(&(m),((const float*)((uintptr_t)p1-12u+off)),(24),(vl)) /*@ where F=F */;
  vfloat32m1_t v=hc_isa_merge_view(&(z),&(ld),&(m),vl);
  float wk=hc_read_scalar(w+4u+(dx*9u+ci*3u+1u)*4u+lane) /*@ where F=F */;
  if(dx==2)a=hc_isa_rvv_fma_mu(&(m),&(a),(wk),&(v),(vl));
  else a=hc_isa_rvv_fma(&(a),(wk),&(v),(vl));
 }
 {
  vfloat32m1_t ld=hc_isa_masked_strided_load(&(m),((const float*)((uintptr_t)p2-12u+off)),(24),(vl)) /*@ where F=F */;
  vfloat32m1_t v=hc_isa_merge_view(&(z),&(ld),&(m),vl);
  float wk=hc_read_scalar(w+4u+(dx*9u+ci*3u+2u)*4u+lane) /*@ where F=F */;
  if(dx==2)a=hc_isa_rvv_fma_mu(&(m),&(a),(wk),&(v),(vl));
  else a=hc_isa_rvv_fma(&(a),(wk),&(v),(vl));
 }
 return a;
}
