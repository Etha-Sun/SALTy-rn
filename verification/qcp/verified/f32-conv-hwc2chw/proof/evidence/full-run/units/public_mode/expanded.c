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
/*@ Import Coq Import HwcConv.HwcPublicObservationModel */
/*@ Extern Coq (hwp_state_observe:HwcOutput->HwcOutput->Prop) (hwp_unwritten_frame:HwcOutput->HwcOutput->Z->Z->Z->Z->Z->Z->Z->Prop) */
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
;
void test_rvv(
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
/*@ With (F:HwcROMap) (O:HwcOutput) (W:list Z) (H:Z) (N:Z) (Top:Z) (Start:Z) (End:Z) (Input:Z) (Zero:Z) (Weights:Z) (Output:Z) (Params:Z) (Cn:Z) (Hs:Z) (Cs:Z) (Lo:fp32) (Hi:fp32) Require (input_height==H) && (input_width==N) && (input_padding_top==Top) && (output_y_start==Start) && (output_y_end==End) && (input==Input) && (zero==Zero) && (weights==Weights) && (output==Output) && (params==Params) && (output_channels==Cn) && (output_height_stride==Hs) && (output_channel_stride==Cs) && (hc_input_domain(F,Input,Zero,Weights,Params,H,N,Top,Start,End,Cn)) && (hc_output_layout(Output,Hs,Cs,H,N,Cn,End)) && (hc_output_owned(W,Output,Hs,Cs,Cn,Start,End,(N+1)/2)) && (hc_present(F,&(params->scalar.min))) && (hc_present(F,&(params->scalar.max))) && (hc_same_bits(hc_get(F,&(params->scalar.min)),Lo)) && (hc_same_bits(hc_get(F,&(params->scalar.max)),Hi)) && (0<H) && (0<N) && (0<Cn) && (0<=Top) && (Top<=1) && (0<=Start) && (Start<End) && hc_data(F) * hc_output(W,O) Ensure hc_data(F)*hc_output(W,hc_final(hc_visible(hc_rvv_raw(F,Input,Zero,Weights,H,N,Top,Lo,Hi),Cn),O,Output,Hs,Cs,Cn,Start,End,(N+1)/2)) */
;
int hwc_public_mode(unsigned int use_rvv,
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
/*@ With (F:HwcROMap) (O:HwcOutput) (W:list Z) (H:Z) (N:Z) (Top:Z) (Start:Z) (End:Z) (Input:Z) (Zero:Z) (Weights:Z) (Output:Z) (Params:Z) (Cn:Z) (Hs:Z) (Cs:Z) (Lo:fp32) (Hi:fp32) Require (input_height==H) && (input_width==N) && (input_padding_top==Top) && (output_y_start==Start) && (output_y_end==End) && (input==Input) && (zero==Zero) && (weights==Weights) && (output==Output) && (params==Params) && (output_channels==Cn) && (output_height_stride==Hs) && (output_channel_stride==Cs) && (hc_input_domain(F,Input,Zero,Weights,Params,H,N,Top,Start,End,Cn)) && (hc_output_layout(Output,Hs,Cs,H,N,Cn,End)) && (hc_output_owned(W,Output,Hs,Cs,Cn,Start,End,(N+1)/2)) && (hc_present(F,&(params->scalar.min))) && (hc_present(F,&(params->scalar.max))) && (hc_same_bits(hc_get(F,&(params->scalar.min)),Lo)) && (hc_same_bits(hc_get(F,&(params->scalar.max)),Hi)) && (0<H) && (0<N) && (0<Cn) && (0<=Top) && (Top<=1) && (0<=Start) && (Start<End) && hc_data(F) * hc_output(W,O) Ensure exists (OA:HwcOutput), __return==1 && hwp_state_observe(hc_final(hc_visible(hc_neon_raw(F,Input,Zero,Weights,H,N,Top,Lo,Hi),Cn),O,Output,Hs,Cs,Cn,Start,End,(N+1)/2),OA) && hwp_unwritten_frame(O,OA,Output,Hs,Cs,Cn,Start,End,(N+1)/2) && hc_data(F)*hc_output(W,OA) */
{
 if(use_rvv==0){test_neon(input_height,input_width,output_y_start,output_y_end,input,zero,weights,output,input_padding_top,output_channels,output_height_stride,output_channel_stride,params) /*@ where F=F,W=W,O=O */;}
 else{test_rvv(input_height,input_width,output_y_start,output_y_end,input,zero,weights,output,input_padding_top,output_channels,output_height_stride,output_channel_stride,params) /*@ where F=F,W=W,O=O */;}
 return 1;
}
