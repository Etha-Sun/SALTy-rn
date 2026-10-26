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
typedef unsigned int uint32_t;
typedef int int32_t;
struct xnn_f32_minmax_scalar {float min;float max;};
struct xnn_f32_minmax_params {struct xnn_f32_minmax_scalar scalar;};
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
/*@ Import Coq Require Import HwcConv.SupportModel */
/*@ Extern Coq (hc_doz_model : Z -> Z -> Z) (hc_round_model : Z -> Z) */
size_t hc_round_down4(size_t n)
/*@ Require emp Ensure __return == hc_round_model(n) && emp */
;
size_t hc_doz(size_t a,size_t b)
/*@ Require emp Ensure __return == hc_doz_model(a,b) && emp */
;
void hc_assert(int c)
/*@ Require c!=0 && emp Ensure emp */;
/*@ include strategies "hc_maps.strategies" */
/*@ Import Coq Require Import HwcConv.KernelPointers HwcConv.RvvMaskBounds */
/*@ Extern Coq (hc_zero:fp32) (hc_mask_start:Z->Z->Z) (hc_mask_end:Z->Z->Z->Z->Z) */
/*@ Extern Coq (HwcRawPixels :: *) (HwcPixels :: *) */
/*@ Extern Coq
 (hc_input_domain:HwcROMap->Z->Z->Z->Z->Z->Z->Z->Z->Z->Z->Prop)
 (hc_output_layout:Z->Z->Z->Z->Z->Z->Z->Prop)
 (hc_output_owned:list Z->Z->Z->Z->Z->Z->Z->Z->Prop)
 (hc_row_base:Z->Z->Z->Z->Z->Z)
 (hc_addr64:Z->Z)
 (hc_store_row:Z->Z->Z->Z)
 (hc_store_channel:Z->Z->Z->Z)
 (hc_rows_pending:Z->Z->Z->Z->Z->Z->Z->Z->Z->Z->Z->Z->Prop)
 (hc_outer_input:Z->Z->Z->Z->Z->Z->Z->Z->Z->Z->Z->Prop)
 (hc_pending_outputs:Z->Z->Z->Z->Z->Z->Prop)
 (hc_channel_pending:Z->Z->Z->Z->Z->Z->Z->Z->Z->Z->Z->Z->Z->Z->Z->Prop)
 (hc_channel_output:Z->Z->Z->Z->Z->Z->Z->Z->Z->Z->Z->Z->Z->Z->Z->Prop)
 (hc_rvv_raw:HwcROMap->Z->Z->Z->Z->Z->Z->fp32->fp32->HwcRawPixels)
 (hc_visible:HwcRawPixels->Z->HwcPixels)
 (hc_progress:HwcPixels->HwcOutput->Z->Z->Z->Z->Z->Z->Z->Z->Z->Z->HwcOutput)
 (hc_final:HwcPixels->HwcOutput->Z->Z->Z->Z->Z->Z->Z->HwcOutput)
 (hc_acc_prefix:Recordvfloat32m1_t->HwcROMap->Z->Z->Z->Z->Z->Z->Z->Z->Z->Z->Z->Z->Prop)
 (hc_source_mask:Recordvbool32_t->Z->Z->Z->Z->Prop)
 (hc_source_input:Recordvfloat32m1_t->HwcROMap->Z->Z->Z->Z->Z->Z->Z->Z->Z->Z->Z->Prop)
 (make_record_vfloat32m1_t:fp32->fp32->fp32->fp32->Recordvfloat32m1_t)
 (make_record_vuint32m1_t:Z->Z->Z->Z->Recordvuint32m1_t)
 (make_record_vbool32_t:Z->Z->Z->Z->Recordvbool32_t)
 */
/*@ Import Coq Require Import HwcConv.NeonViewsModel */
/*@ Extern Coq (hc_window:HwcROMap->Z->Z->Prop) (hc_neon_load4:Recordfloat32x4_t->HwcROMap->Z->Prop) (hc_neon_dup4:Recordfloat32x4_t->fp32->Prop) (hc_neon_lane_load:Recordfloat32x4_t->Recordfloat32x4_t->HwcROMap->Z->Z->Prop) (hc_neon_min4:Recordfloat32x4_t->Recordfloat32x4_t->Recordfloat32x4_t->Prop) (hc_neon_max4:Recordfloat32x4_t->Recordfloat32x4_t->Recordfloat32x4_t->Prop) (hc_neon_zip1:Recordfloat32x4_t->Recordfloat32x4_t->Recordfloat32x4_t->Prop) (hc_neon_zip2:Recordfloat32x4_t->Recordfloat32x4_t->Recordfloat32x4_t->Prop) (hc_neon_store_lane:HwcOutput->Z->Recordfloat32x4_t->Z->HwcOutput) */
float32x4_t hc_isa_load4(const float *p)
/*@ With (F:HwcROMap) Require hc_window(F,p,4) && hc_data(F) Ensure exists(R:Recordfloat32x4_t),hc_neon_load4(R,F,p) && (hc_data(F)*StructPredfloat32x4_t(&__return,R)) */;
float32x4_t hc_isa_dup_load4(const float *p)
/*@ With (F:HwcROMap) Require hc_present(F,p) && hc_data(F) Ensure exists(R:Recordfloat32x4_t),hc_neon_dup4(R,hc_get(F,p)) && (hc_data(F)*StructPredfloat32x4_t(&__return,R)) */;
float32x4_t hc_isa_dup4(float x)
/*@ Require emp Ensure exists(R:Recordfloat32x4_t),hc_neon_dup4(R,x) && StructPredfloat32x4_t(&__return,R) */;
float32x4_t hc_isa_neon_min(const float32x4_t *pa,const float32x4_t *pb)
/*@ With (A:Recordfloat32x4_t) (B:Recordfloat32x4_t) Require StructPredfloat32x4_t(pa,A)*StructPredfloat32x4_t(pb,B) Ensure exists(R:Recordfloat32x4_t),hc_neon_min4(R,A,B) && (StructPredfloat32x4_t(pa,A)*StructPredfloat32x4_t(pb,B)*StructPredfloat32x4_t(&__return,R)) */;
float32x4_t hc_isa_neon_max(const float32x4_t *pa,const float32x4_t *pb)
/*@ With (A:Recordfloat32x4_t) (B:Recordfloat32x4_t) Require StructPredfloat32x4_t(pa,A)*StructPredfloat32x4_t(pb,B) Ensure exists(R:Recordfloat32x4_t),hc_neon_max4(R,A,B) && (StructPredfloat32x4_t(pa,A)*StructPredfloat32x4_t(pb,B)*StructPredfloat32x4_t(&__return,R)) */;
float32x4_t hc_isa_neon_zip1(const float32x4_t *pa,const float32x4_t *pb)
/*@ With (A:Recordfloat32x4_t) (B:Recordfloat32x4_t) Require StructPredfloat32x4_t(pa,A)*StructPredfloat32x4_t(pb,B) Ensure exists(R:Recordfloat32x4_t),hc_neon_zip1(R,A,B) && (StructPredfloat32x4_t(pa,A)*StructPredfloat32x4_t(pb,B)*StructPredfloat32x4_t(&__return,R)) */;
float32x4_t hc_isa_neon_zip2(const float32x4_t *pa,const float32x4_t *pb)
/*@ With (A:Recordfloat32x4_t) (B:Recordfloat32x4_t) Require StructPredfloat32x4_t(pa,A)*StructPredfloat32x4_t(pb,B) Ensure exists(R:Recordfloat32x4_t),hc_neon_zip2(R,A,B) && (StructPredfloat32x4_t(pa,A)*StructPredfloat32x4_t(pb,B)*StructPredfloat32x4_t(&__return,R)) */;
float32x4_t hc_isa_load_lane4(const float *p,const float32x4_t *pa,int k)
/*@ With (F:HwcROMap) (A:Recordfloat32x4_t) Require 0<=k && k<4 && hc_present(F,p) && (hc_data(F)*StructPredfloat32x4_t(pa,A)) Ensure exists(R:Recordfloat32x4_t),hc_neon_lane_load(R,A,F,p,k) && (hc_data(F)*StructPredfloat32x4_t(pa,A)*StructPredfloat32x4_t(&__return,R)) */;
void hc_isa_store_lane4(float *p,const float32x4_t *pa,int k)
/*@ With (W:list Z) (O:HwcOutput) (A:Recordfloat32x4_t) Require 0<=k && k<4 && hc_write_window(W,p,1) && (hc_output(W,O)*StructPredfloat32x4_t(pa,A)) Ensure hc_output(W,hc_neon_store_lane(O,p,A,k))*StructPredfloat32x4_t(pa,A) */;
void hc_store_low_half(float *p,const float32x4_t *pa)
/*@ With (A:Recordfloat32x4_t) (O:HwcOutput) (W:list Z)
 Require hc_write_window(W,p,2) && hc_output(W,O)*StructPredfloat32x4_t(pa,A)
 Ensure hc_output(W,hc_store_low2(O,p,A))*StructPredfloat32x4_t(pa,A) */;
void hc_store_high_half(float *p,const float32x4_t *pa)
/*@ With (A:Recordfloat32x4_t) (O:HwcOutput) (W:list Z)
 Require hc_write_window(W,p,2) && hc_output(W,O)*StructPredfloat32x4_t(pa,A)
 Ensure hc_output(W,hc_store_high2(O,p,A))*StructPredfloat32x4_t(pa,A) */;
/*@ Import Coq Require Import HwcConv.NeonKernelModel */
/*@ Extern Coq
 (hc_neon_raw:HwcROMap->Z->Z->Z->Z->Z->Z->fp32->fp32->HwcRawPixels)
 (hc_neon_previous:Recordfloat32x4_t->HwcROMap->Z->Z->Z->Z->Z->Z->Z->Z->Prop)
 */
/* Formal domain guards each actual source call q is the literal4. */
/*@ Import Coq Require Import HwcConv.Neon3Model */
/*@ Extern Coq (hc_neon_fma4 : Recordfloat32x4_t -> Recordfloat32x4_t -> Recordfloat32x4_t -> Recordfloat32x4_t -> Z -> Prop) */
float32x4_t hc_isa_neon_fma0(const float32x4_t *pa,const float32x4_t *pw,const float32x4_t *px)
/*@ With (A:Recordfloat32x4_t) (W:Recordfloat32x4_t) (X:Recordfloat32x4_t) Require StructPredfloat32x4_t(pa,A)*StructPredfloat32x4_t(pw,W)*StructPredfloat32x4_t(px,X) Ensure exists(R:Recordfloat32x4_t), hc_neon_fma4(R,A,W,X,0) && (StructPredfloat32x4_t(pa,A)*StructPredfloat32x4_t(pw,W)*StructPredfloat32x4_t(px,X)*StructPredfloat32x4_t(&__return,R)) */;
float32x4_t hc_isa_neon_fma1(const float32x4_t *pa,const float32x4_t *pw,const float32x4_t *px)
/*@ With (A:Recordfloat32x4_t) (W:Recordfloat32x4_t) (X:Recordfloat32x4_t) Require StructPredfloat32x4_t(pa,A)*StructPredfloat32x4_t(pw,W)*StructPredfloat32x4_t(px,X) Ensure exists(R:Recordfloat32x4_t), hc_neon_fma4(R,A,W,X,1) && (StructPredfloat32x4_t(pa,A)*StructPredfloat32x4_t(pw,W)*StructPredfloat32x4_t(px,X)*StructPredfloat32x4_t(&__return,R)) */;
float32x4_t hc_isa_neon_fma2(const float32x4_t *pa,const float32x4_t *pw,const float32x4_t *px)
/*@ With (A:Recordfloat32x4_t) (W:Recordfloat32x4_t) (X:Recordfloat32x4_t) Require StructPredfloat32x4_t(pa,A)*StructPredfloat32x4_t(pw,W)*StructPredfloat32x4_t(px,X) Ensure exists(R:Recordfloat32x4_t), hc_neon_fma4(R,A,W,X,2) && (StructPredfloat32x4_t(pa,A)*StructPredfloat32x4_t(pw,W)*StructPredfloat32x4_t(px,X)*StructPredfloat32x4_t(&__return,R)) */;
float32x4_t hc_isa_neon_fma3(const float32x4_t *pa,const float32x4_t *pw,const float32x4_t *px)
/*@ With (A:Recordfloat32x4_t) (W:Recordfloat32x4_t) (X:Recordfloat32x4_t) Require StructPredfloat32x4_t(pa,A)*StructPredfloat32x4_t(pw,W)*StructPredfloat32x4_t(px,X) Ensure exists(R:Recordfloat32x4_t), hc_neon_fma4(R,A,W,X,3) && (StructPredfloat32x4_t(pa,A)*StructPredfloat32x4_t(pw,W)*StructPredfloat32x4_t(px,X)*StructPredfloat32x4_t(&__return,R)) */;
/*@ Extern Coq (hc_neon3 : Recordfloat32x4_t -> Recordfloat32x4_t -> Recordfloat32x4_t -> Recordfloat32x4_t -> Recordfloat32x4_t -> Recordfloat32x4_t -> Recordfloat32x4_t -> Recordfloat32x4_t -> Z -> Prop) */
float32x4_t hc_neon_fma3_lane0(const float32x4_t *pa,const float32x4_t *pw0,const float32x4_t *pw1,const float32x4_t *pw2,const float32x4_t *px0,const float32x4_t *px1,const float32x4_t *px2)
/*@ With (A:Recordfloat32x4_t) (W0:Recordfloat32x4_t) (W1:Recordfloat32x4_t) (W2:Recordfloat32x4_t) (X0:Recordfloat32x4_t) (X1:Recordfloat32x4_t) (X2:Recordfloat32x4_t) Require StructPredfloat32x4_t(pa,A) * StructPredfloat32x4_t(pw0,W0) * StructPredfloat32x4_t(pw1,W1) * StructPredfloat32x4_t(pw2,W2) * StructPredfloat32x4_t(px0,X0) * StructPredfloat32x4_t(px1,X1) * StructPredfloat32x4_t(px2,X2) Ensure exists(R:Recordfloat32x4_t), hc_neon3(R,A,W0,W1,W2,X0,X1,X2,0) && (StructPredfloat32x4_t(pa,A) * StructPredfloat32x4_t(pw0,W0) * StructPredfloat32x4_t(pw1,W1) * StructPredfloat32x4_t(pw2,W2) * StructPredfloat32x4_t(px0,X0) * StructPredfloat32x4_t(px1,X1) * StructPredfloat32x4_t(px2,X2) * StructPredfloat32x4_t(&__return,R)) */
;
float32x4_t hc_neon_fma3_lane1(const float32x4_t *pa,const float32x4_t *pw0,const float32x4_t *pw1,const float32x4_t *pw2,const float32x4_t *px0,const float32x4_t *px1,const float32x4_t *px2)
/*@ With (A:Recordfloat32x4_t) (W0:Recordfloat32x4_t) (W1:Recordfloat32x4_t) (W2:Recordfloat32x4_t) (X0:Recordfloat32x4_t) (X1:Recordfloat32x4_t) (X2:Recordfloat32x4_t) Require StructPredfloat32x4_t(pa,A) * StructPredfloat32x4_t(pw0,W0) * StructPredfloat32x4_t(pw1,W1) * StructPredfloat32x4_t(pw2,W2) * StructPredfloat32x4_t(px0,X0) * StructPredfloat32x4_t(px1,X1) * StructPredfloat32x4_t(px2,X2) Ensure exists(R:Recordfloat32x4_t), hc_neon3(R,A,W0,W1,W2,X0,X1,X2,1) && (StructPredfloat32x4_t(pa,A) * StructPredfloat32x4_t(pw0,W0) * StructPredfloat32x4_t(pw1,W1) * StructPredfloat32x4_t(pw2,W2) * StructPredfloat32x4_t(px0,X0) * StructPredfloat32x4_t(px1,X1) * StructPredfloat32x4_t(px2,X2) * StructPredfloat32x4_t(&__return,R)) */
;
float32x4_t hc_neon_fma3_lane2(const float32x4_t *pa,const float32x4_t *pw0,const float32x4_t *pw1,const float32x4_t *pw2,const float32x4_t *px0,const float32x4_t *px1,const float32x4_t *px2)
/*@ With (A:Recordfloat32x4_t) (W0:Recordfloat32x4_t) (W1:Recordfloat32x4_t) (W2:Recordfloat32x4_t) (X0:Recordfloat32x4_t) (X1:Recordfloat32x4_t) (X2:Recordfloat32x4_t) Require StructPredfloat32x4_t(pa,A) * StructPredfloat32x4_t(pw0,W0) * StructPredfloat32x4_t(pw1,W1) * StructPredfloat32x4_t(pw2,W2) * StructPredfloat32x4_t(px0,X0) * StructPredfloat32x4_t(px1,X1) * StructPredfloat32x4_t(px2,X2) Ensure exists(R:Recordfloat32x4_t), hc_neon3(R,A,W0,W1,W2,X0,X1,X2,2) && (StructPredfloat32x4_t(pa,A) * StructPredfloat32x4_t(pw0,W0) * StructPredfloat32x4_t(pw1,W1) * StructPredfloat32x4_t(pw2,W2) * StructPredfloat32x4_t(px0,X0) * StructPredfloat32x4_t(px1,X1) * StructPredfloat32x4_t(px2,X2) * StructPredfloat32x4_t(&__return,R)) */
;
float32x4_t hc_neon_fma3_lane3(const float32x4_t *pa,const float32x4_t *pw0,const float32x4_t *pw1,const float32x4_t *pw2,const float32x4_t *px0,const float32x4_t *px1,const float32x4_t *px2)
/*@ With (A:Recordfloat32x4_t) (W0:Recordfloat32x4_t) (W1:Recordfloat32x4_t) (W2:Recordfloat32x4_t) (X0:Recordfloat32x4_t) (X1:Recordfloat32x4_t) (X2:Recordfloat32x4_t) Require StructPredfloat32x4_t(pa,A) * StructPredfloat32x4_t(pw0,W0) * StructPredfloat32x4_t(pw1,W1) * StructPredfloat32x4_t(pw2,W2) * StructPredfloat32x4_t(px0,X0) * StructPredfloat32x4_t(px1,X1) * StructPredfloat32x4_t(px2,X2) Ensure exists(R:Recordfloat32x4_t), hc_neon3(R,A,W0,W1,W2,X0,X1,X2,3) && (StructPredfloat32x4_t(pa,A) * StructPredfloat32x4_t(pw0,W0) * StructPredfloat32x4_t(pw1,W1) * StructPredfloat32x4_t(pw2,W2) * StructPredfloat32x4_t(px0,X0) * StructPredfloat32x4_t(px1,X1) * StructPredfloat32x4_t(px2,X2) * StructPredfloat32x4_t(&__return,R)) */
;
/*@ Import Coq Require Import HwcConv.NeonRowsPixelModel */
/*@ Extern Coq (hc_footprint:Z->Z->Prop) (hc_neon_rows_acc:Recordfloat32x4_t->HwcROMap->Z->Z->Z->Z->Z->Z->Z->Prop) */
float32x4_t hc_neon_rows_pixel27(const float *p0,const float *p1,const float *p2,const float *w,size_t width,size_t x)
/*@ With(F:HwcROMap) Require 0<width && 0<=x && x<(width+1)/2 && hc_footprint(p0,3*width+3) && hc_footprint(p1,3*width+3) && hc_footprint(p2,3*width+3) && hc_footprint(w,112) && hc_window(F,p0,3*width+3) && hc_window(F,p1,3*width+3) && hc_window(F,p2,3*width+3) && hc_window(F,w,112) && hc_data(F) Ensure exists(R:Recordfloat32x4_t),hc_neon_rows_acc(R,F,p0,p1,p2,w,width,x,9) && (hc_data(F)*StructPredfloat32x4_t(&__return,R)) */;
/*
struct xnn_f32_minmax_params {
  struct {
    float min;
    float max;
  } scalar;
};
*/
void test_neon(
    size_t input_height,
    size_t input_width,
    size_t output_y_start,
    size_t output_y_end,
    const float* input,
    const float* zero,
    const float* weights,
    float* output,
    size_t input_padding_top,
    size_t output_channels,
    size_t output_height_stride,
    size_t output_channel_stride,
    const struct xnn_f32_minmax_params* params)
/*@ With (F:HwcROMap) (O:HwcOutput) (W:list Z) (H:Z) (N:Z) (Top:Z) (Start:Z) (End:Z) (Input:Z) (Zero:Z) (Weights:Z) (Output:Z) (Params:Z) (Cn:Z) (Hs:Z) (Cs:Z) (Lo:fp32) (Hi:fp32) Require (input_height==H) && (input_width==N) && (input_padding_top==Top) && (output_y_start==Start) && (output_y_end==End) && (input==Input) && (zero==Zero) && (weights==Weights) && (output==Output) && (params==Params) && (output_channels==Cn) && (output_height_stride==Hs) && (output_channel_stride==Cs) && (hc_input_domain(F,Input,Zero,Weights,Params,H,N,Top,Start,End,Cn)) && (hc_output_layout(Output,Hs,Cs,H,N,Cn,End)) && (hc_output_owned(W,Output,Hs,Cs,Cn,Start,End,(N+1)/2)) && (hc_present(F,&(params->scalar.min))) && (hc_present(F,&(params->scalar.max))) && (hc_same_bits(hc_get(F,&(params->scalar.min)),Lo)) && (hc_same_bits(hc_get(F,&(params->scalar.max)),Hi)) && (0<H) && (0<N) && (0<Cn) && (0<=Top) && (Top<=1) && (0<=Start) && (Start<End) && hc_data(F) * hc_output(W,O) Ensure hc_data(F)*hc_output(W,hc_final(hc_visible(hc_neon_raw(F,Input,Zero,Weights,H,N,Top,Lo,Hi),Cn),O,Output,Hs,Cs,Cn,Start,End,(N+1)/2)) */
{
  hc_assert(input_width != 0);
  hc_assert(output_y_end > output_y_start);
  hc_assert(input_padding_top <= 1);
  hc_assert(output_channels != 0);
  const size_t input_height_stride = input_width * 3 /* channels */ * sizeof(float);
  const size_t input_width_increment = hc_round_down4(input_width) * 3 /* channels */ * sizeof(float);
  const size_t output_width = (input_width + 1) / 2;
  const size_t output_channel_increment = output_channel_stride * 4 - output_width * sizeof(float);
  // Adjustment for padding processed below
  const float* i0 = (const float*) ((uintptr_t) input + input_height_stride * (output_y_start * 2 - input_padding_top));
  const float* i1 = (const float*) ((uintptr_t) i0 + input_height_stride);
  const float* i2 = (const float*) ((uintptr_t) i1 + input_height_stride);
  const float* i3 = (const float*) ((uintptr_t) i2 + input_height_stride);
  const float* i4 = (const float*) ((uintptr_t) i3 + input_height_stride);
  float* output0 = (float*) ((uintptr_t) output + output_height_stride * output_y_start);
  float* output1 = (float*) ((uintptr_t) output0 + output_height_stride);
  if (output_y_start < input_padding_top) {
    i0 = zero;
  }
  const float32x4_t vmin = hc_isa_dup_load4(&params->scalar.min) /*@ where F=F */;
  const float32x4_t vmax = hc_isa_dup_load4(&params->scalar.max) /*@ where F=F */;
  /*@ Inv Assert exists (LMin:Recordfloat32x4_t) (LMax:Recordfloat32x4_t) ,(input_height==H) && (input_width==N) && (input_padding_top==Top) && (output_y_start==Start) && (output_y_end==End) && (input==Input) && (zero==Zero) && (weights==Weights) && (output==Output) && (params==Params) && (output_channels==Cn) && (output_height_stride==Hs) && (output_channel_stride==Cs) && (hc_input_domain(F,Input,Zero,Weights,Params,H,N,Top,Start,End,Cn)) && (hc_output_layout(Output,Hs,Cs,H,N,Cn,End)) && (hc_output_owned(W,Output,Hs,Cs,Cn,Start,End,(N+1)/2)) && (hc_present(F,&(params->scalar.min))) && (hc_present(F,&(params->scalar.max))) && (hc_same_bits(hc_get(F,&(params->scalar.min)),Lo)) && (hc_same_bits(hc_get(F,&(params->scalar.max)),Hi)) && (0<H) && (0<N) && (0<Cn) && (0<=Top) && (Top<=1) && (0<=Start) && (Start<End) && (input_height_stride==12*N) && (input_width_increment==12*hc_round_model(N)) && (output_width==(N+1)/2) && (output_channel_increment==hc_addr64(4*Cs-4*((N+1)/2))) && (Start<=output_y) && (output_y<=End+1) && (hc_rows_pending(Input,Zero,H,N,Top,output_y,End,i0,i1,i2,i3,i4)) && (hc_pending_outputs(Output,Hs,output_y,End,output0,output1)) && (hc_neon_dup4(LMin,Lo)) && (hc_neon_dup4(LMax,Hi)) && hc_data(F) * hc_output(W,hc_progress(hc_visible(hc_neon_raw(F,Input,Zero,Weights,H,N,Top,Lo,Hi),Cn),O,Output,Hs,Cs,Cn,Start,End,(N+1)/2,output_y,0,0)) * StructPredfloat32x4_t(&vmin,LMin) * StructPredfloat32x4_t(&vmax,LMax) */
for (size_t output_y = output_y_start; output_y < output_y_end; output_y += 2) {
    const size_t input_y2 = output_y * 2 + 2 - input_padding_top;
    const size_t input_y4 = input_y2 + 2;
    if (input_y2 >= input_height) {
      i2 = zero;
    }
    if (input_y4 > input_height) {
      i3 = zero;
    }
    if (input_y4 >= input_height) {
      i4 = zero;
    }
    if (output_y + 2 > output_y_end) {
      output1 = output0;
    }
    const float* w = weights;
    size_t c = output_channels;
    float* o0c0 = output0;
    float* o1c0 = output1;
    float* o0c1 = (float*) ((uintptr_t) o0c0 + output_channel_stride);
    float* o1c1 = (float*) ((uintptr_t) o1c0 + output_channel_stride);
    float* o0c2 = (float*) ((uintptr_t) o0c1 + output_channel_stride);
    float* o1c2 = (float*) ((uintptr_t) o1c1 + output_channel_stride);
    float* o0c3 = (float*) ((uintptr_t) o0c2 + output_channel_stride);
    float* o1c3 = (float*) ((uintptr_t) o1c2 + output_channel_stride);
    do {
      if (c < 2) {
        o0c1 = o0c0;
        o1c1 = o1c0;
      }
      if (c <= 2) {
        o0c2 = o0c1;
        o1c2 = o1c1;
      }
      if (c < 4) {
        o0c3 = o0c2;
        o1c3 = o1c2;
      }
      // viMx0 = ( iM0c2, iM0c1, iM0c0, --- )
      const float *hc_row0=i0;
      const float *hc_row1=i1;
      const float *hc_row2=i2;
      const float *hc_row3=i3;
      const float *hc_row4=i4;
      size_t iw = input_width;
      /*@ Inv Assert exists (LMin:Recordfloat32x4_t) (LMax:Recordfloat32x4_t) ,(input_height==H) && (input_width==N) && (input_padding_top==Top) && (output_y_start==Start) && (output_y_end==End) && (input==Input) && (zero==Zero) && (weights==Weights) && (output==Output) && (params==Params) && (output_channels==Cn) && (output_height_stride==Hs) && (output_channel_stride==Cs) && (hc_input_domain(F,Input,Zero,Weights,Params,H,N,Top,Start,End,Cn)) && (hc_output_layout(Output,Hs,Cs,H,N,Cn,End)) && (hc_output_owned(W,Output,Hs,Cs,Cn,Start,End,(N+1)/2)) && (hc_present(F,&(params->scalar.min))) && (hc_present(F,&(params->scalar.max))) && (hc_same_bits(hc_get(F,&(params->scalar.min)),Lo)) && (hc_same_bits(hc_get(F,&(params->scalar.max)),Hi)) && (0<H) && (0<N) && (0<Cn) && (0<=Top) && (Top<=1) && (0<=Start) && (Start<End) && (input_height_stride==12*N) && (input_width_increment==12*hc_round_model(N)) && (output_width==(N+1)/2) && (output_channel_increment==hc_addr64(4*Cs-4*((N+1)/2))) && (input_y2==hc_addr64(2*output_y+2-Top)) && (input_y4==hc_addr64(2*output_y+4-Top)) && (output0==hc_addr64(Output+Hs*output_y)) && (output1==hc_addr64(Output+Hs*hc_store_row(End,output_y,1))) && (Start<=output_y) && (output_y<End) && (0<c) && (c<=Cn) && ((Cn-c)%4==0) && (w==hc_addr64(Weights+448*((Cn-c)/4))) && (0<=iw) && (iw<=N) && ((N-iw)%4==0) && (hc_row0==hc_row_base(Input,Zero,H,N,2*output_y-Top+0)) && (i0==hc_addr64(hc_row_base(Input,Zero,H,N,2*output_y-Top+0)+12*(N-iw))) && (hc_footprint(hc_row0,3*N+3)) && (hc_window(F,hc_row0,3*N+3)) && (hc_row1==hc_row_base(Input,Zero,H,N,2*output_y-Top+1)) && (i1==hc_addr64(hc_row_base(Input,Zero,H,N,2*output_y-Top+1)+12*(N-iw))) && (hc_footprint(hc_row1,3*N+3)) && (hc_window(F,hc_row1,3*N+3)) && (hc_row2==hc_row_base(Input,Zero,H,N,2*output_y-Top+2)) && (i2==hc_addr64(hc_row_base(Input,Zero,H,N,2*output_y-Top+2)+12*(N-iw))) && (hc_footprint(hc_row2,3*N+3)) && (hc_window(F,hc_row2,3*N+3)) && (hc_row3==hc_row_base(Input,Zero,H,N,2*output_y-Top+3)) && (i3==hc_addr64(hc_row_base(Input,Zero,H,N,2*output_y-Top+3)+12*(N-iw))) && (hc_footprint(hc_row3,3*N+3)) && (hc_window(F,hc_row3,3*N+3)) && (hc_row4==hc_row_base(Input,Zero,H,N,2*output_y-Top+4)) && (i4==hc_addr64(hc_row_base(Input,Zero,H,N,2*output_y-Top+4)+12*(N-iw))) && (hc_footprint(hc_row4,3*N+3)) && (hc_window(F,hc_row4,3*N+3)) && (w==Weights+448*((Cn-c)/4)) && (hc_footprint(w,112)) && (hc_window(F,w,112)) && (o0c0==(Output+Cs*hc_store_channel(Cn,Cn-c,0)+Hs*hc_store_row(End,output_y,0)+4*((N-iw)/2))) && (o0c1==(Output+Cs*hc_store_channel(Cn,Cn-c,1)+Hs*hc_store_row(End,output_y,0)+4*((N-iw)/2))) && (o0c2==(Output+Cs*hc_store_channel(Cn,Cn-c,2)+Hs*hc_store_row(End,output_y,0)+4*((N-iw)/2))) && (o0c3==(Output+Cs*hc_store_channel(Cn,Cn-c,3)+Hs*hc_store_row(End,output_y,0)+4*((N-iw)/2))) && (o1c0==(Output+Cs*hc_store_channel(Cn,Cn-c,0)+Hs*hc_store_row(End,output_y,1)+4*((N-iw)/2))) && (o1c1==(Output+Cs*hc_store_channel(Cn,Cn-c,1)+Hs*hc_store_row(End,output_y,1)+4*((N-iw)/2))) && (o1c2==(Output+Cs*hc_store_channel(Cn,Cn-c,2)+Hs*hc_store_row(End,output_y,1)+4*((N-iw)/2))) && (o1c3==(Output+Cs*hc_store_channel(Cn,Cn-c,3)+Hs*hc_store_row(End,output_y,1)+4*((N-iw)/2))) && (hc_neon_dup4(LMin,Lo)) && (hc_neon_dup4(LMax,Hi)) && hc_data(F) * hc_output(W,hc_progress(hc_visible(hc_neon_raw(F,Input,Zero,Weights,H,N,Top,Lo,Hi),Cn),O,Output,Hs,Cs,Cn,Start,End,(N+1)/2,output_y,Cn-c,(N-iw)/2)) * StructPredfloat32x4_t(&vmin,LMin) * StructPredfloat32x4_t(&vmax,LMax) */
for (; iw >= 4; iw -= 4) {
        const size_t hc_x=(input_width-iw)/2;
        float32x4_t vo0x0=hc_neon_rows_pixel27(hc_row0,hc_row1,hc_row2,w,input_width,hc_x) /*@ where F=F */;
        float32x4_t vo1x0=hc_neon_rows_pixel27(hc_row2,hc_row3,hc_row4,w,input_width,hc_x) /*@ where F=F */;
        float32x4_t vo0x1=hc_neon_rows_pixel27(hc_row0,hc_row1,hc_row2,w,input_width,hc_x+1) /*@ where F=F */;
        float32x4_t vo1x1=hc_neon_rows_pixel27(hc_row2,hc_row3,hc_row4,w,input_width,hc_x+1) /*@ where F=F */;
        i0+=12;
        i1+=12;
        i2+=12;
        i3+=12;
        i4+=12;
        vo0x0 = hc_isa_neon_max(&(vo0x0),&(vmin));
        vo1x0 = hc_isa_neon_max(&(vo1x0),&(vmin));
        vo0x1 = hc_isa_neon_max(&(vo0x1),&(vmin));
        vo1x1 = hc_isa_neon_max(&(vo1x1),&(vmin));
        vo0x0 = hc_isa_neon_min(&(vo0x0),&(vmax));
        vo1x0 = hc_isa_neon_min(&(vo1x0),&(vmax));
        vo0x1 = hc_isa_neon_min(&(vo0x1),&(vmax));
        vo1x1 = hc_isa_neon_min(&(vo1x1),&(vmax));
        const float32x4_t vo0c01 = hc_isa_neon_zip1(&(vo0x0),&(vo0x1));
        const float32x4_t vo0c23 = hc_isa_neon_zip2(&(vo0x0),&(vo0x1));
        const float32x4_t vo1c01 = hc_isa_neon_zip1(&(vo1x0),&(vo1x1));
        const float32x4_t vo1c23 = hc_isa_neon_zip2(&(vo1x0),&(vo1x1));
        // Always 2+ output width elements remaining
        hc_store_low_half(o1c0,&vo1c01) /*@ where W=W */; o1c0 += 2;
        hc_store_high_half(o1c1,&vo1c01) /*@ where W=W */; o1c1 += 2;
        hc_store_low_half(o1c2,&vo1c23) /*@ where W=W */; o1c2 += 2;
        hc_store_high_half(o1c3,&vo1c23) /*@ where W=W */; o1c3 += 2;
        hc_store_low_half(o0c0,&vo0c01) /*@ where W=W */; o0c0 += 2;
        hc_store_high_half(o0c1,&vo0c01) /*@ where W=W */; o0c1 += 2;
        hc_store_low_half(o0c2,&vo0c23) /*@ where W=W */; o0c2 += 2;
        hc_store_high_half(o0c3,&vo0c23) /*@ where W=W */; o0c3 += 2;
      }
      hc_assert(iw < 4);
      if (iw != 0) {
        const size_t hc_x=(input_width-iw)/2;
        float32x4_t vo0x0=hc_neon_rows_pixel27(hc_row0,hc_row1,hc_row2,w,input_width,hc_x) /*@ where F=F */;
        float32x4_t vo1x0=hc_neon_rows_pixel27(hc_row2,hc_row3,hc_row4,w,input_width,hc_x) /*@ where F=F */;
        float32x4_t vo0x1=hc_isa_dup4(0.0f);
        float32x4_t vo1x1=hc_isa_dup4(0.0f);
        if(iw==3){
          vo0x1=hc_neon_rows_pixel27(hc_row0,hc_row1,hc_row2,w,input_width,hc_x+1) /*@ where F=F */;
          vo1x1=hc_neon_rows_pixel27(hc_row2,hc_row3,hc_row4,w,input_width,hc_x+1) /*@ where F=F */;
        }
        vo0x0 = hc_isa_neon_max(&(vo0x0),&(vmin));
        vo1x0 = hc_isa_neon_max(&(vo1x0),&(vmin));
        vo0x1 = hc_isa_neon_max(&(vo0x1),&(vmin));
        vo1x1 = hc_isa_neon_max(&(vo1x1),&(vmin));
        vo0x0 = hc_isa_neon_min(&(vo0x0),&(vmax));
        vo1x0 = hc_isa_neon_min(&(vo1x0),&(vmax));
        vo0x1 = hc_isa_neon_min(&(vo0x1),&(vmax));
        vo1x1 = hc_isa_neon_min(&(vo1x1),&(vmax));
        if (iw == 3) {
          // Exactly 2 output width elements remaining
          const float32x4_t vo0c01 = hc_isa_neon_zip1(&(vo0x0),&(vo0x1));
          const float32x4_t vo0c23 = hc_isa_neon_zip2(&(vo0x0),&(vo0x1));
          const float32x4_t vo1c01 = hc_isa_neon_zip1(&(vo1x0),&(vo1x1));
          const float32x4_t vo1c23 = hc_isa_neon_zip2(&(vo1x0),&(vo1x1));
          hc_store_low_half(o1c0,&vo1c01) /*@ where W=W */; o1c0 += 2;
          hc_store_high_half(o1c1,&vo1c01) /*@ where W=W */; o1c1 += 2;
          hc_store_low_half(o1c2,&vo1c23) /*@ where W=W */; o1c2 += 2;
          hc_store_high_half(o1c3,&vo1c23) /*@ where W=W */; o1c3 += 2;
          hc_store_low_half(o0c0,&vo0c01) /*@ where W=W */; o0c0 += 2;
          hc_store_high_half(o0c1,&vo0c01) /*@ where W=W */; o0c1 += 2;
          hc_store_low_half(o0c2,&vo0c23) /*@ where W=W */; o0c2 += 2;
          hc_store_high_half(o0c3,&vo0c23) /*@ where W=W */; o0c3 += 2;
        } else {
          // Exactly 1 output width element remaining
          hc_isa_store_lane4((o1c0),&(vo1x0),(0)) /*@ where W=W */; o1c0 += 1;
          hc_isa_store_lane4((o1c1),&(vo1x0),(1)) /*@ where W=W */; o1c1 += 1;
          hc_isa_store_lane4((o1c2),&(vo1x0),(2)) /*@ where W=W */; o1c2 += 1;
          hc_isa_store_lane4((o1c3),&(vo1x0),(3)) /*@ where W=W */; o1c3 += 1;
          hc_isa_store_lane4((o0c0),&(vo0x0),(0)) /*@ where W=W */; o0c0 += 1;
          hc_isa_store_lane4((o0c1),&(vo0x0),(1)) /*@ where W=W */; o0c1 += 1;
          hc_isa_store_lane4((o0c2),&(vo0x0),(2)) /*@ where W=W */; o0c2 += 1;
          hc_isa_store_lane4((o0c3),&(vo0x0),(3)) /*@ where W=W */; o0c3 += 1;
        }
      }
      // Move output pointers back to the position of the first pixel in a row,
      // and forward to the next block of output channels.
      o0c0 = (float*) ((uintptr_t) o0c0 + output_channel_increment);
      o0c1 = (float*) ((uintptr_t) o0c1 + output_channel_increment);
      o0c2 = (float*) ((uintptr_t) o0c2 + output_channel_increment);
      o0c3 = (float*) ((uintptr_t) o0c3 + output_channel_increment);
      o1c0 = (float*) ((uintptr_t) o1c0 + output_channel_increment);
      o1c1 = (float*) ((uintptr_t) o1c1 + output_channel_increment);
      o1c2 = (float*) ((uintptr_t) o1c2 + output_channel_increment);
      o1c3 = (float*) ((uintptr_t) o1c3 + output_channel_increment);
      // Revert input pointers to the position of the first pixel in a row
      i0 = (const float*) ((uintptr_t) i0 - input_width_increment);
      i1 = (const float*) ((uintptr_t) i1 - input_width_increment);
      i2 = (const float*) ((uintptr_t) i2 - input_width_increment);
      i3 = (const float*) ((uintptr_t) i3 - input_width_increment);
      i4 = (const float*) ((uintptr_t) i4 - input_width_increment);
      // Move to the block of weights for the next 4 output channels
      w += 112;
      c = hc_doz((c),(4));
    } /*@ Inv Assert exists (LMin:Recordfloat32x4_t) (LMax:Recordfloat32x4_t) (WLocal:Z) ,(input_height==H) && (input_width==N) && (input_padding_top==Top) && (output_y_start==Start) && (output_y_end==End) && (input==Input) && (zero==Zero) && (weights==Weights) && (output==Output) && (params==Params) && (output_channels==Cn) && (output_height_stride==Hs) && (output_channel_stride==Cs) && (hc_input_domain(F,Input,Zero,Weights,Params,H,N,Top,Start,End,Cn)) && (hc_output_layout(Output,Hs,Cs,H,N,Cn,End)) && (hc_output_owned(W,Output,Hs,Cs,Cn,Start,End,(N+1)/2)) && (hc_present(F,&(params->scalar.min))) && (hc_present(F,&(params->scalar.max))) && (hc_same_bits(hc_get(F,&(params->scalar.min)),Lo)) && (hc_same_bits(hc_get(F,&(params->scalar.max)),Hi)) && (0<H) && (0<N) && (0<Cn) && (0<=Top) && (Top<=1) && (0<=Start) && (Start<End) && (input_height_stride==12*N) && (input_width_increment==12*hc_round_model(N)) && (output_width==(N+1)/2) && (output_channel_increment==hc_addr64(4*Cs-4*((N+1)/2))) && (input_y2==hc_addr64(2*output_y+2-Top)) && (input_y4==hc_addr64(2*output_y+4-Top)) && (output0==hc_addr64(Output+Hs*output_y)) && (output1==hc_addr64(Output+Hs*hc_store_row(End,output_y,1))) && (Start<=output_y) && (output_y<End) && (0<=c) && (c<=Cn) && (c==0 || (Cn-c)%4==0) && (hc_outer_input(Input,Zero,H,N,Top,output_y,i0,i1,i2,i3,i4)) && (c==0 || w==hc_addr64(Weights+448*((Cn-c)/4))) && (hc_channel_pending(Output,Hs,Cs,Cn,End,output_y,Cn-c,o0c0,o0c1,o0c2,o0c3,o1c0,o1c1,o1c2,o1c3)) && (hc_neon_dup4(LMin,Lo)) && (hc_neon_dup4(LMax,Hi)) && (w==WLocal) && hc_data(F) * hc_output(W,hc_progress(hc_visible(hc_neon_raw(F,Input,Zero,Weights,H,N,Top,Lo,Hi),Cn),O,Output,Hs,Cs,Cn,Start,End,(N+1)/2,output_y,Cn-c,0)) * StructPredfloat32x4_t(&vmin,LMin) * StructPredfloat32x4_t(&vmax,LMax) */
while (c != 0);
    // Move output pointers forward to the next two rows
    output0 = (float*) ((uintptr_t) output1 + output_height_stride);
    output1 = (float*) ((uintptr_t) output0 + output_height_stride);
    // Move input pointers forward to the next four rows
    i0 = i4;
    i1 = (const float*) ((uintptr_t) i0 + input_height_stride);
    i2 = (const float*) ((uintptr_t) i1 + input_height_stride);
    i3 = (const float*) ((uintptr_t) i2 + input_height_stride);
    i4 = (const float*) ((uintptr_t) i3 + input_height_stride);
  }
}
