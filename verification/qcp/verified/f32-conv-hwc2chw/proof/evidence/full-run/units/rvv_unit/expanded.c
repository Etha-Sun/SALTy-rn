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
/*@ Extern Coq (hc_output_address:Z->Z->Z->Z->Z->Z->Z) */
/*@ Import Coq Require Import HwcConv.RvvRowsFma3Model */
/*@ Extern Coq (hc_footprint:Z->Z->Prop) (hc_window:HwcROMap->Z->Z->Prop)
 (hc_rvv_rows_group:Recordvfloat32m1_t->Recordvfloat32m1_t->HwcROMap->Z->Z->Z->Z->Z->Z->Z->Z->Z->Z->Prop) */
vfloat32m1_t hc_rvv_rows_fma3(const vfloat32m1_t *pa,const float *p0,const float *p1,const float *p2,const float *w,size_t width,size_t x,unsigned int dx,unsigned int ci,unsigned int lane,size_t vl)
/*@ With(F:HwcROMap) (A:Recordvfloat32m1_t) Require 0<width && 0<=x && x<(width+1)/2 && 0<=dx && dx<3 && 0<=ci && ci<3 && 0<=lane && lane<4 && 0<=vl && vl<=4 && vl<=(width+1)/2-x && hc_footprint(p0,3*width+3) && hc_footprint(p1,3*width+3) && hc_footprint(p2,3*width+3) && hc_footprint(w,112) && hc_window(F,p0,3*width+3) && hc_window(F,p1,3*width+3) && hc_window(F,p2,3*width+3) && hc_window(F,w,112) && (hc_data(F)*StructPredvfloat32m1_t(pa,A)) Ensure exists(R:Recordvfloat32m1_t),hc_rvv_rows_group(R,A,F,p0,p1,p2,w,width,x,dx,ci,lane,vl) && (hc_data(F)*StructPredvfloat32m1_t(pa,A)*StructPredvfloat32m1_t(&__return,R)) */;
/*@ Import Coq Require Import HwcConv.HwcRvvPixel9Model */
/*@ Extern Coq (hc_rvv_pixel9_bias:HwcROMap->Z->Z->fp32)
 (hc_rvv_pixel9_prefix:Recordvfloat32m1_t->HwcROMap->Z->Z->Z->Z->Z->Z->Z->Z->Z->Prop) */
vfloat32m1_t hc_rvv_pixel9_raw(const float *p0,const float *p1,const float *p2,const float *w,size_t width,size_t x,unsigned int lane,size_t vl)
/*@ With(F:HwcROMap) Require 0<width && 0<=x && x<(width+1)/2 && 0<=lane && lane<4 && 0<=vl && vl<=4 && vl<=(width+1)/2-x && hc_footprint(p0,3*width+3) && hc_footprint(p1,3*width+3) && hc_footprint(p2,3*width+3) && hc_footprint(w,112) && hc_window(F,p0,3*width+3) && hc_window(F,p1,3*width+3) && hc_window(F,p2,3*width+3) && hc_window(F,w,112) && hc_data(F) Ensure exists(R:Recordvfloat32m1_t),hc_rvv_pixel9_prefix(R,F,p0,p1,p2,w,width,x,lane,9,vl) && (hc_data(F)*StructPredvfloat32m1_t(&__return,R)) */;
/*@ Extern Coq (hc_clamp_min : Recordvfloat32m1_t -> Recordvfloat32m1_t -> fp32 -> Z -> Prop) (hc_clamp_max : Recordvfloat32m1_t -> Recordvfloat32m1_t -> fp32 -> Z -> Prop) */
vfloat32m1_t hc_min_f32m1(const vfloat32m1_t *pa,float b,size_t vl)
/*@ With (A:Recordvfloat32m1_t) Require 0<=vl && vl<=4 && StructPredvfloat32m1_t(pa,A) Ensure exists(R:Recordvfloat32m1_t),hc_clamp_min(R,A,b,vl) && (StructPredvfloat32m1_t(pa,A) * StructPredvfloat32m1_t(&__return,R)) */
;
vfloat32m1_t hc_max_f32m1(const vfloat32m1_t *pa,float b,size_t vl)
/*@ With (A:Recordvfloat32m1_t) Require 0<=vl && vl<=4 && StructPredvfloat32m1_t(pa,A) Ensure exists(R:Recordvfloat32m1_t),hc_clamp_max(R,A,b,vl) && (StructPredvfloat32m1_t(pa,A) * StructPredvfloat32m1_t(&__return,R)) */
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
{
  hc_assert(input_width != 0);
  hc_assert(output_y_end > output_y_start);
  hc_assert(input_padding_top <= 1);
  hc_assert(output_channels != 0);
  const size_t input_height_stride = input_width * 3 /* channels */ * sizeof(float);
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
  /*@ Inv Assert (input_height==H) && (input_width==N) && (input_padding_top==Top) && (output_y_start==Start) && (output_y_end==End) && (input==Input) && (zero==Zero) && (weights==Weights) && (output==Output) && (params==Params) && (output_channels==Cn) && (output_height_stride==Hs) && (output_channel_stride==Cs) && (hc_input_domain(F,Input,Zero,Weights,Params,H,N,Top,Start,End,Cn)) && (hc_output_layout(Output,Hs,Cs,H,N,Cn,End)) && (hc_output_owned(W,Output,Hs,Cs,Cn,Start,End,(N+1)/2)) && (hc_present(F,&(params->scalar.min))) && (hc_present(F,&(params->scalar.max))) && (hc_same_bits(hc_get(F,&(params->scalar.min)),Lo)) && (hc_same_bits(hc_get(F,&(params->scalar.max)),Hi)) && (0<H) && (0<N) && (0<Cn) && (0<=Top) && (Top<=1) && (0<=Start) && (Start<End) && (input_height_stride==12*N) && (output_width==(N+1)/2) && (output_channel_increment==hc_addr64(4*Cs-4*((N+1)/2))) && (Start<=output_y) && (output_y<=End+1) && (hc_rows_pending(Input,Zero,H,N,Top,output_y,End,i0,i1,i2,i3,i4)) && (hc_pending_outputs(Output,Hs,output_y,End,output0,output1)) && hc_data(F) * hc_output(W,hc_progress(hc_visible(hc_rvv_raw(F,Input,Zero,Weights,H,N,Top,Lo,Hi),Cn),O,Output,Hs,Cs,Cn,Start,End,(N+1)/2,output_y,0,0)) */
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
      size_t ow = output_width;
      size_t ow_done = 0;
      float* current_o0c0 = o0c0;
      float* current_o0c1 = o0c1;
      float* current_o0c2 = o0c2;
      float* current_o0c3 = o0c3;
      float* current_o1c0 = o1c0;
      float* current_o1c1 = o1c1;
      float* current_o1c2 = o1c2;
      float* current_o1c3 = o1c3;
      /*@ Inv Assert (input_height==H) && (input_width==N) && (input_padding_top==Top) && (output_y_start==Start) && (output_y_end==End) && (input==Input) && (zero==Zero) && (weights==Weights) && (output==Output) && (params==Params) && (output_channels==Cn) && (output_height_stride==Hs) && (output_channel_stride==Cs) && (hc_input_domain(F,Input,Zero,Weights,Params,H,N,Top,Start,End,Cn)) && (hc_output_layout(Output,Hs,Cs,H,N,Cn,End)) && (hc_output_owned(W,Output,Hs,Cs,Cn,Start,End,(N+1)/2)) && (hc_present(F,&(params->scalar.min))) && (hc_present(F,&(params->scalar.max))) && (hc_same_bits(hc_get(F,&(params->scalar.min)),Lo)) && (hc_same_bits(hc_get(F,&(params->scalar.max)),Hi)) && (0<H) && (0<N) && (0<Cn) && (0<=Top) && (Top<=1) && (0<=Start) && (Start<End) && (input_height_stride==12*N) && (output_width==(N+1)/2) && (output_channel_increment==hc_addr64(4*Cs-4*((N+1)/2))) && (input_y2==hc_addr64(2*output_y+2-Top)) && (input_y4==hc_addr64(2*output_y+4-Top)) && (output0==hc_addr64(Output+Hs*output_y)) && (output1==hc_addr64(Output+Hs*hc_store_row(End,output_y,1))) && (Start<=output_y) && (output_y<End) && (0<c) && (c<=Cn) && ((Cn-c)%4==0) && (hc_outer_input(Input,Zero,H,N,Top,output_y,i0,i1,i2,i3,i4)) && (w==hc_addr64(Weights+448*((Cn-c)/4))) && (0<=ow_done) && (ow_done<=(N+1)/2) && (ow==(N+1)/2-ow_done) && (hc_channel_output(Output,Hs,Cs,Cn,End,output_y,Cn-c,o0c0,o0c1,o0c2,o0c3,o1c0,o1c1,o1c2,o1c3)) && (current_o0c0==hc_output_address(Output,Hs,Cs,hc_store_channel(Cn,Cn-c,0),hc_store_row(End,output_y,0),ow_done)) && (current_o0c1==hc_output_address(Output,Hs,Cs,hc_store_channel(Cn,Cn-c,1),hc_store_row(End,output_y,0),ow_done)) && (current_o0c2==hc_output_address(Output,Hs,Cs,hc_store_channel(Cn,Cn-c,2),hc_store_row(End,output_y,0),ow_done)) && (current_o0c3==hc_output_address(Output,Hs,Cs,hc_store_channel(Cn,Cn-c,3),hc_store_row(End,output_y,0),ow_done)) && (current_o1c0==hc_output_address(Output,Hs,Cs,hc_store_channel(Cn,Cn-c,0),hc_store_row(End,output_y,1),ow_done)) && (current_o1c1==hc_output_address(Output,Hs,Cs,hc_store_channel(Cn,Cn-c,1),hc_store_row(End,output_y,1),ow_done)) && (current_o1c2==hc_output_address(Output,Hs,Cs,hc_store_channel(Cn,Cn-c,2),hc_store_row(End,output_y,1),ow_done)) && (current_o1c3==hc_output_address(Output,Hs,Cs,hc_store_channel(Cn,Cn-c,3),hc_store_row(End,output_y,1),ow_done)) && (hc_footprint(i0,3*N+3)) && (hc_window(F,i0,3*N+3)) && (hc_footprint(i1,3*N+3)) && (hc_window(F,i1,3*N+3)) && (hc_footprint(i2,3*N+3)) && (hc_window(F,i2,3*N+3)) && (hc_footprint(i3,3*N+3)) && (hc_window(F,i3,3*N+3)) && (hc_footprint(i4,3*N+3)) && (hc_window(F,i4,3*N+3)) && (w==Weights+448*((Cn-c)/4)) && (hc_footprint(w,112)) && (hc_window(F,w,112)) && hc_data(F) * hc_output(W,hc_progress(hc_visible(hc_rvv_raw(F,Input,Zero,Weights,H,N,Top,Lo,Hi),Cn),O,Output,Hs,Cs,Cn,Start,End,(N+1)/2,output_y,Cn-c,ow_done)) */
while (ow > 0) {
        size_t vl = hc_isa_vsetvl(ow);
        vfloat32m1_t v_o0c0 = hc_rvv_pixel9_raw(i0,i1,i2,w,input_width,ow_done,0u,vl) /*@ where F=F */;
        vfloat32m1_t v_o0c1 = hc_rvv_pixel9_raw(i0,i1,i2,w,input_width,ow_done,1u,vl) /*@ where F=F */;
        vfloat32m1_t v_o0c2 = hc_rvv_pixel9_raw(i0,i1,i2,w,input_width,ow_done,2u,vl) /*@ where F=F */;
        vfloat32m1_t v_o0c3 = hc_rvv_pixel9_raw(i0,i1,i2,w,input_width,ow_done,3u,vl) /*@ where F=F */;
        vfloat32m1_t v_o1c0 = hc_rvv_pixel9_raw(i2,i3,i4,w,input_width,ow_done,0u,vl) /*@ where F=F */;
        vfloat32m1_t v_o1c1 = hc_rvv_pixel9_raw(i2,i3,i4,w,input_width,ow_done,1u,vl) /*@ where F=F */;
        vfloat32m1_t v_o1c2 = hc_rvv_pixel9_raw(i2,i3,i4,w,input_width,ow_done,2u,vl) /*@ where F=F */;
        vfloat32m1_t v_o1c3 = hc_rvv_pixel9_raw(i2,i3,i4,w,input_width,ow_done,3u,vl) /*@ where F=F */;
/*@ Assert exists (A00:Recordvfloat32m1_t) (A01:Recordvfloat32m1_t) (A02:Recordvfloat32m1_t) (A03:Recordvfloat32m1_t) (A10:Recordvfloat32m1_t) (A11:Recordvfloat32m1_t) (A12:Recordvfloat32m1_t) (A13:Recordvfloat32m1_t) ,(input_height==H) && (input_width==N) && (input_padding_top==Top) && (output_y_start==Start) && (output_y_end==End) && (input==Input) && (zero==Zero) && (weights==Weights) && (output==Output) && (params==Params) && (output_channels==Cn) && (output_height_stride==Hs) && (output_channel_stride==Cs) && (hc_input_domain(F,Input,Zero,Weights,Params,H,N,Top,Start,End,Cn)) && (hc_output_layout(Output,Hs,Cs,H,N,Cn,End)) && (hc_output_owned(W,Output,Hs,Cs,Cn,Start,End,(N+1)/2)) && (hc_present(F,&(params->scalar.min))) && (hc_present(F,&(params->scalar.max))) && (hc_same_bits(hc_get(F,&(params->scalar.min)),Lo)) && (hc_same_bits(hc_get(F,&(params->scalar.max)),Hi)) && (0<H) && (0<N) && (0<Cn) && (0<=Top) && (Top<=1) && (0<=Start) && (Start<End) && (input_height_stride==12*N) && (output_width==(N+1)/2) && (output_channel_increment==hc_addr64(4*Cs-4*((N+1)/2))) && (input_y2==hc_addr64(2*output_y+2-Top)) && (input_y4==hc_addr64(2*output_y+4-Top)) && (output0==hc_addr64(Output+Hs*output_y)) && (output1==hc_addr64(Output+Hs*hc_store_row(End,output_y,1))) && (Start<=output_y) && (output_y<End) && (0<c) && (c<=Cn) && ((Cn-c)%4==0) && (hc_outer_input(Input,Zero,H,N,Top,output_y,i0,i1,i2,i3,i4)) && (w==hc_addr64(Weights+448*((Cn-c)/4))) && (0<=ow_done) && (ow_done<=(N+1)/2) && (ow==(N+1)/2-ow_done) && (hc_channel_output(Output,Hs,Cs,Cn,End,output_y,Cn-c,o0c0,o0c1,o0c2,o0c3,o1c0,o1c1,o1c2,o1c3)) && (current_o0c0==hc_output_address(Output,Hs,Cs,hc_store_channel(Cn,Cn-c,0),hc_store_row(End,output_y,0),ow_done)) && (current_o0c1==hc_output_address(Output,Hs,Cs,hc_store_channel(Cn,Cn-c,1),hc_store_row(End,output_y,0),ow_done)) && (current_o0c2==hc_output_address(Output,Hs,Cs,hc_store_channel(Cn,Cn-c,2),hc_store_row(End,output_y,0),ow_done)) && (current_o0c3==hc_output_address(Output,Hs,Cs,hc_store_channel(Cn,Cn-c,3),hc_store_row(End,output_y,0),ow_done)) && (current_o1c0==hc_output_address(Output,Hs,Cs,hc_store_channel(Cn,Cn-c,0),hc_store_row(End,output_y,1),ow_done)) && (current_o1c1==hc_output_address(Output,Hs,Cs,hc_store_channel(Cn,Cn-c,1),hc_store_row(End,output_y,1),ow_done)) && (current_o1c2==hc_output_address(Output,Hs,Cs,hc_store_channel(Cn,Cn-c,2),hc_store_row(End,output_y,1),ow_done)) && (current_o1c3==hc_output_address(Output,Hs,Cs,hc_store_channel(Cn,Cn-c,3),hc_store_row(End,output_y,1),ow_done)) && (hc_footprint(i0,3*N+3)) && (hc_window(F,i0,3*N+3)) && (hc_footprint(i1,3*N+3)) && (hc_window(F,i1,3*N+3)) && (hc_footprint(i2,3*N+3)) && (hc_window(F,i2,3*N+3)) && (hc_footprint(i3,3*N+3)) && (hc_window(F,i3,3*N+3)) && (hc_footprint(i4,3*N+3)) && (hc_window(F,i4,3*N+3)) && (w==Weights+448*((Cn-c)/4)) && (hc_footprint(w,112)) && (hc_window(F,w,112)) && (0<ow) && (hc_rvv_vl(ow,vl)) && (0<vl) && (vl<=ow) && (hc_acc_prefix(A00,F,Input,Zero,Weights,H,N,Top,output_y+0,ow_done,Cn-c,0,27,vl)) && (hc_acc_prefix(A01,F,Input,Zero,Weights,H,N,Top,output_y+0,ow_done,Cn-c,1,27,vl)) && (hc_acc_prefix(A02,F,Input,Zero,Weights,H,N,Top,output_y+0,ow_done,Cn-c,2,27,vl)) && (hc_acc_prefix(A03,F,Input,Zero,Weights,H,N,Top,output_y+0,ow_done,Cn-c,3,27,vl)) && (hc_acc_prefix(A10,F,Input,Zero,Weights,H,N,Top,output_y+1,ow_done,Cn-c,0,27,vl)) && (hc_acc_prefix(A11,F,Input,Zero,Weights,H,N,Top,output_y+1,ow_done,Cn-c,1,27,vl)) && (hc_acc_prefix(A12,F,Input,Zero,Weights,H,N,Top,output_y+1,ow_done,Cn-c,2,27,vl)) && (hc_acc_prefix(A13,F,Input,Zero,Weights,H,N,Top,output_y+1,ow_done,Cn-c,3,27,vl)) && hc_data(F) * hc_output(W,hc_progress(hc_visible(hc_rvv_raw(F,Input,Zero,Weights,H,N,Top,Lo,Hi),Cn),O,Output,Hs,Cs,Cn,Start,End,(N+1)/2,output_y,Cn-c,ow_done)) * StructPredvfloat32m1_t(&v_o0c0,A00) * StructPredvfloat32m1_t(&v_o0c1,A01) * StructPredvfloat32m1_t(&v_o0c2,A02) * StructPredvfloat32m1_t(&v_o0c3,A03) * StructPredvfloat32m1_t(&v_o1c0,A10) * StructPredvfloat32m1_t(&v_o1c1,A11) * StructPredvfloat32m1_t(&v_o1c2,A12) * StructPredvfloat32m1_t(&v_o1c3,A13) */
        v_o0c0 = hc_max_f32m1(&v_o0c0, hc_read_scalar(&(params->scalar.min)) /*@ where F=F */, vl);
        v_o0c1 = hc_max_f32m1(&v_o0c1, hc_read_scalar(&(params->scalar.min)) /*@ where F=F */, vl);
        v_o0c2 = hc_max_f32m1(&v_o0c2, hc_read_scalar(&(params->scalar.min)) /*@ where F=F */, vl);
        v_o0c3 = hc_max_f32m1(&v_o0c3, hc_read_scalar(&(params->scalar.min)) /*@ where F=F */, vl);
        v_o1c0 = hc_max_f32m1(&v_o1c0, hc_read_scalar(&(params->scalar.min)) /*@ where F=F */, vl);
        v_o1c1 = hc_max_f32m1(&v_o1c1, hc_read_scalar(&(params->scalar.min)) /*@ where F=F */, vl);
        v_o1c2 = hc_max_f32m1(&v_o1c2, hc_read_scalar(&(params->scalar.min)) /*@ where F=F */, vl);
        v_o1c3 = hc_max_f32m1(&v_o1c3, hc_read_scalar(&(params->scalar.min)) /*@ where F=F */, vl);
        v_o0c0 = hc_min_f32m1(&v_o0c0, hc_read_scalar(&(params->scalar.max)) /*@ where F=F */, vl);
        v_o0c1 = hc_min_f32m1(&v_o0c1, hc_read_scalar(&(params->scalar.max)) /*@ where F=F */, vl);
        v_o0c2 = hc_min_f32m1(&v_o0c2, hc_read_scalar(&(params->scalar.max)) /*@ where F=F */, vl);
        v_o0c3 = hc_min_f32m1(&v_o0c3, hc_read_scalar(&(params->scalar.max)) /*@ where F=F */, vl);
        v_o1c0 = hc_min_f32m1(&v_o1c0, hc_read_scalar(&(params->scalar.max)) /*@ where F=F */, vl);
        v_o1c1 = hc_min_f32m1(&v_o1c1, hc_read_scalar(&(params->scalar.max)) /*@ where F=F */, vl);
        v_o1c2 = hc_min_f32m1(&v_o1c2, hc_read_scalar(&(params->scalar.max)) /*@ where F=F */, vl);
        v_o1c3 = hc_min_f32m1(&v_o1c3, hc_read_scalar(&(params->scalar.max)) /*@ where F=F */, vl);
        // Store row 1 BEFORE row 0: when there is a single output row the caller
        // aliases output1==output0, so the LAST store must be the valid row 0
        // (matches the NEON gold; storing o0 last fixes the row-1-overwrites-row-0 bug).
        hc_isa_rvv_store((current_o1c0),&(v_o1c0),(vl)) /*@ where W=W */; current_o1c0 += vl;
        hc_isa_rvv_store((current_o1c1),&(v_o1c1),(vl)) /*@ where W=W */; current_o1c1 += vl;
        hc_isa_rvv_store((current_o1c2),&(v_o1c2),(vl)) /*@ where W=W */; current_o1c2 += vl;
        hc_isa_rvv_store((current_o1c3),&(v_o1c3),(vl)) /*@ where W=W */; current_o1c3 += vl;
        hc_isa_rvv_store((current_o0c0),&(v_o0c0),(vl)) /*@ where W=W */; current_o0c0 += vl;
        hc_isa_rvv_store((current_o0c1),&(v_o0c1),(vl)) /*@ where W=W */; current_o0c1 += vl;
        hc_isa_rvv_store((current_o0c2),&(v_o0c2),(vl)) /*@ where W=W */; current_o0c2 += vl;
        hc_isa_rvv_store((current_o0c3),&(v_o0c3),(vl)) /*@ where W=W */; current_o0c3 += vl;
        ow -= vl;
        ow_done += vl;
      }
      o0c0 = (float*) ((uintptr_t) current_o0c0 + output_channel_increment);
      o0c1 = (float*) ((uintptr_t) current_o0c1 + output_channel_increment);
      o0c2 = (float*) ((uintptr_t) current_o0c2 + output_channel_increment);
      o0c3 = (float*) ((uintptr_t) current_o0c3 + output_channel_increment);
      o1c0 = (float*) ((uintptr_t) current_o1c0 + output_channel_increment);
      o1c1 = (float*) ((uintptr_t) current_o1c1 + output_channel_increment);
      o1c2 = (float*) ((uintptr_t) current_o1c2 + output_channel_increment);
      o1c3 = (float*) ((uintptr_t) current_o1c3 + output_channel_increment);
      w += 112;
      c = (c > 4) ? c - 4 : 0;
    } /*@ Inv Assert exists (WLocal:Z) ,(input_height==H) && (input_width==N) && (input_padding_top==Top) && (output_y_start==Start) && (output_y_end==End) && (input==Input) && (zero==Zero) && (weights==Weights) && (output==Output) && (params==Params) && (output_channels==Cn) && (output_height_stride==Hs) && (output_channel_stride==Cs) && (hc_input_domain(F,Input,Zero,Weights,Params,H,N,Top,Start,End,Cn)) && (hc_output_layout(Output,Hs,Cs,H,N,Cn,End)) && (hc_output_owned(W,Output,Hs,Cs,Cn,Start,End,(N+1)/2)) && (hc_present(F,&(params->scalar.min))) && (hc_present(F,&(params->scalar.max))) && (hc_same_bits(hc_get(F,&(params->scalar.min)),Lo)) && (hc_same_bits(hc_get(F,&(params->scalar.max)),Hi)) && (0<H) && (0<N) && (0<Cn) && (0<=Top) && (Top<=1) && (0<=Start) && (Start<End) && (input_height_stride==12*N) && (output_width==(N+1)/2) && (output_channel_increment==hc_addr64(4*Cs-4*((N+1)/2))) && (input_y2==hc_addr64(2*output_y+2-Top)) && (input_y4==hc_addr64(2*output_y+4-Top)) && (output0==hc_addr64(Output+Hs*output_y)) && (output1==hc_addr64(Output+Hs*hc_store_row(End,output_y,1))) && (Start<=output_y) && (output_y<End) && (0<=c) && (c<=Cn) && (c==0 || (Cn-c)%4==0) && (hc_outer_input(Input,Zero,H,N,Top,output_y,i0,i1,i2,i3,i4)) && (c==0 || w==hc_addr64(Weights+448*((Cn-c)/4))) && (hc_channel_pending(Output,Hs,Cs,Cn,End,output_y,Cn-c,o0c0,o0c1,o0c2,o0c3,o1c0,o1c1,o1c2,o1c3)) && (w==WLocal) && hc_data(F) * hc_output(W,hc_progress(hc_visible(hc_rvv_raw(F,Input,Zero,Weights,H,N,Top,Lo,Hi),Cn),O,Output,Hs,Cs,Cn,Start,End,(N+1)/2,output_y,Cn-c,0)) */
while (c != 0);
    output0 = (float*) ((uintptr_t) output1 + output_height_stride);
    output1 = (float*) ((uintptr_t) output0 + output_height_stride);
    i0 = i4;
    i1 = (const float*) ((uintptr_t) i0 + input_height_stride);
    i2 = (const float*) ((uintptr_t) i1 + input_height_stride);
    i3 = (const float*) ((uintptr_t) i2 + input_height_stride);
    i4 = (const float*) ((uintptr_t) i3 + input_height_stride);
  }
}
