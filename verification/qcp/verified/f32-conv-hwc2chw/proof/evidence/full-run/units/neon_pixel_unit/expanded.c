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
/*@ Import Coq Require Import HwcConv.MemoryFacts HwcConv.FloatCopyModel */
/*@ Extern Coq (HwcROMap :: *) */
/*@ Extern Coq (hc_data:HwcROMap->Assertion) (hc_get:HwcROMap->Z->fp32)
 (hc_present:HwcROMap->Z->Prop) (hc_pop:HwcROMap->Z->HwcROMap)
 (hc_same_bits:fp32->fp32->Prop) */
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
float32x4_t hc_neon_rows_pixel27(const float *p0,const float *p1,const float *p2,const float *w,size_t width,size_t x)
/*@ With(F:HwcROMap) Require 0<width && 0<=x && x<(width+1)/2 && hc_footprint(p0,3*width+3) && hc_footprint(p1,3*width+3) && hc_footprint(p2,3*width+3) && hc_footprint(w,112) && hc_window(F,p0,3*width+3) && hc_window(F,p1,3*width+3) && hc_window(F,p2,3*width+3) && hc_window(F,w,112) && hc_data(F) Ensure exists(R:Recordfloat32x4_t),hc_neon_rows_acc(R,F,p0,p1,p2,w,width,x,9) && (hc_data(F)*StructPredfloat32x4_t(&__return,R)) */
{
 float32x4_t a=hc_isa_load4(w) /*@ where F=F */;
 /*@ Assert exists(A:Recordfloat32x4_t),p0==p0@pre && p1==p1@pre && p2==p2@pre && w==w@pre && width==width@pre && x==x@pre && 0<width && 0<=x && x<(width+1)/2 && hc_footprint(p0,3*width+3) && hc_footprint(p1,3*width+3) && hc_footprint(p2,3*width+3) && hc_footprint(w,112) && hc_window(F,p0,3*width+3) && hc_window(F,p1,3*width+3) && hc_window(F,p2,3*width+3) && hc_window(F,w,112) && hc_neon_rows_acc(A,F,p0,p1,p2,w,width,x,0) && hc_data(F)*StructPredfloat32x4_t(&a,A) */
 {
  const float32x4_t w0=hc_isa_load4(w+4) /*@ where F=F */;
  const float32x4_t w1=hc_isa_load4(w+8) /*@ where F=F */;
  const float32x4_t w2=hc_isa_load4(w+12) /*@ where F=F */;
  float32x4_t x0=hc_isa_dup4(0.0f);
  float32x4_t x1=hc_isa_dup4(0.0f);
  float32x4_t x2=hc_isa_dup4(0.0f);
  if (x!=0) {
  x0=hc_isa_dup_load4(p0+3*(2*x-1)+0) /*@ where F=F */;
  x1=hc_isa_dup_load4(p1+3*(2*x-1)+0) /*@ where F=F */;
  x2=hc_isa_dup_load4(p2+3*(2*x-1)+0) /*@ where F=F */;
  }
  a=hc_neon_fma3_lane0(&a,&w0,&w1,&w2,&x0,&x1,&x2);
 }
 /*@ Assert exists(A:Recordfloat32x4_t),p0==p0@pre && p1==p1@pre && p2==p2@pre && w==w@pre && width==width@pre && x==x@pre && 0<width && 0<=x && x<(width+1)/2 && hc_footprint(p0,3*width+3) && hc_footprint(p1,3*width+3) && hc_footprint(p2,3*width+3) && hc_footprint(w,112) && hc_window(F,p0,3*width+3) && hc_window(F,p1,3*width+3) && hc_window(F,p2,3*width+3) && hc_window(F,w,112) && hc_neon_rows_acc(A,F,p0,p1,p2,w,width,x,1) && hc_data(F)*StructPredfloat32x4_t(&a,A) */
 {
  const float32x4_t w0=hc_isa_load4(w+16) /*@ where F=F */;
  const float32x4_t w1=hc_isa_load4(w+20) /*@ where F=F */;
  const float32x4_t w2=hc_isa_load4(w+24) /*@ where F=F */;
  float32x4_t x0=hc_isa_dup4(0.0f);
  float32x4_t x1=hc_isa_dup4(0.0f);
  float32x4_t x2=hc_isa_dup4(0.0f);
  if (x!=0) {
  x0=hc_isa_dup_load4(p0+3*(2*x-1)+1) /*@ where F=F */;
  x1=hc_isa_dup_load4(p1+3*(2*x-1)+1) /*@ where F=F */;
  x2=hc_isa_dup_load4(p2+3*(2*x-1)+1) /*@ where F=F */;
  }
  a=hc_neon_fma3_lane0(&a,&w0,&w1,&w2,&x0,&x1,&x2);
 }
 /*@ Assert exists(A:Recordfloat32x4_t),p0==p0@pre && p1==p1@pre && p2==p2@pre && w==w@pre && width==width@pre && x==x@pre && 0<width && 0<=x && x<(width+1)/2 && hc_footprint(p0,3*width+3) && hc_footprint(p1,3*width+3) && hc_footprint(p2,3*width+3) && hc_footprint(w,112) && hc_window(F,p0,3*width+3) && hc_window(F,p1,3*width+3) && hc_window(F,p2,3*width+3) && hc_window(F,w,112) && hc_neon_rows_acc(A,F,p0,p1,p2,w,width,x,2) && hc_data(F)*StructPredfloat32x4_t(&a,A) */
 {
  const float32x4_t w0=hc_isa_load4(w+28) /*@ where F=F */;
  const float32x4_t w1=hc_isa_load4(w+32) /*@ where F=F */;
  const float32x4_t w2=hc_isa_load4(w+36) /*@ where F=F */;
  float32x4_t x0=hc_isa_dup4(0.0f);
  float32x4_t x1=hc_isa_dup4(0.0f);
  float32x4_t x2=hc_isa_dup4(0.0f);
  if (x!=0) {
  x0=hc_isa_dup_load4(p0+3*(2*x-1)+2) /*@ where F=F */;
  x1=hc_isa_dup_load4(p1+3*(2*x-1)+2) /*@ where F=F */;
  x2=hc_isa_dup_load4(p2+3*(2*x-1)+2) /*@ where F=F */;
  }
  a=hc_neon_fma3_lane0(&a,&w0,&w1,&w2,&x0,&x1,&x2);
 }
 /*@ Assert exists(A:Recordfloat32x4_t),p0==p0@pre && p1==p1@pre && p2==p2@pre && w==w@pre && width==width@pre && x==x@pre && 0<width && 0<=x && x<(width+1)/2 && hc_footprint(p0,3*width+3) && hc_footprint(p1,3*width+3) && hc_footprint(p2,3*width+3) && hc_footprint(w,112) && hc_window(F,p0,3*width+3) && hc_window(F,p1,3*width+3) && hc_window(F,p2,3*width+3) && hc_window(F,w,112) && hc_neon_rows_acc(A,F,p0,p1,p2,w,width,x,3) && hc_data(F)*StructPredfloat32x4_t(&a,A) */
 {
  const float32x4_t w0=hc_isa_load4(w+40) /*@ where F=F */;
  const float32x4_t w1=hc_isa_load4(w+44) /*@ where F=F */;
  const float32x4_t w2=hc_isa_load4(w+48) /*@ where F=F */;
  float32x4_t x0=hc_isa_dup4(0.0f);
  float32x4_t x1=hc_isa_dup4(0.0f);
  float32x4_t x2=hc_isa_dup4(0.0f);
  x0=hc_isa_dup_load4(p0+3*(2*x)+0) /*@ where F=F */;
  x1=hc_isa_dup_load4(p1+3*(2*x)+0) /*@ where F=F */;
  x2=hc_isa_dup_load4(p2+3*(2*x)+0) /*@ where F=F */;
  a=hc_neon_fma3_lane0(&a,&w0,&w1,&w2,&x0,&x1,&x2);
 }
 /*@ Assert exists(A:Recordfloat32x4_t),p0==p0@pre && p1==p1@pre && p2==p2@pre && w==w@pre && width==width@pre && x==x@pre && 0<width && 0<=x && x<(width+1)/2 && hc_footprint(p0,3*width+3) && hc_footprint(p1,3*width+3) && hc_footprint(p2,3*width+3) && hc_footprint(w,112) && hc_window(F,p0,3*width+3) && hc_window(F,p1,3*width+3) && hc_window(F,p2,3*width+3) && hc_window(F,w,112) && hc_neon_rows_acc(A,F,p0,p1,p2,w,width,x,4) && hc_data(F)*StructPredfloat32x4_t(&a,A) */
 {
  const float32x4_t w0=hc_isa_load4(w+52) /*@ where F=F */;
  const float32x4_t w1=hc_isa_load4(w+56) /*@ where F=F */;
  const float32x4_t w2=hc_isa_load4(w+60) /*@ where F=F */;
  float32x4_t x0=hc_isa_dup4(0.0f);
  float32x4_t x1=hc_isa_dup4(0.0f);
  float32x4_t x2=hc_isa_dup4(0.0f);
  x0=hc_isa_dup_load4(p0+3*(2*x)+1) /*@ where F=F */;
  x1=hc_isa_dup_load4(p1+3*(2*x)+1) /*@ where F=F */;
  x2=hc_isa_dup_load4(p2+3*(2*x)+1) /*@ where F=F */;
  a=hc_neon_fma3_lane0(&a,&w0,&w1,&w2,&x0,&x1,&x2);
 }
 /*@ Assert exists(A:Recordfloat32x4_t),p0==p0@pre && p1==p1@pre && p2==p2@pre && w==w@pre && width==width@pre && x==x@pre && 0<width && 0<=x && x<(width+1)/2 && hc_footprint(p0,3*width+3) && hc_footprint(p1,3*width+3) && hc_footprint(p2,3*width+3) && hc_footprint(w,112) && hc_window(F,p0,3*width+3) && hc_window(F,p1,3*width+3) && hc_window(F,p2,3*width+3) && hc_window(F,w,112) && hc_neon_rows_acc(A,F,p0,p1,p2,w,width,x,5) && hc_data(F)*StructPredfloat32x4_t(&a,A) */
 {
  const float32x4_t w0=hc_isa_load4(w+64) /*@ where F=F */;
  const float32x4_t w1=hc_isa_load4(w+68) /*@ where F=F */;
  const float32x4_t w2=hc_isa_load4(w+72) /*@ where F=F */;
  float32x4_t x0=hc_isa_dup4(0.0f);
  float32x4_t x1=hc_isa_dup4(0.0f);
  float32x4_t x2=hc_isa_dup4(0.0f);
  x0=hc_isa_dup_load4(p0+3*(2*x)+2) /*@ where F=F */;
  x1=hc_isa_dup_load4(p1+3*(2*x)+2) /*@ where F=F */;
  x2=hc_isa_dup_load4(p2+3*(2*x)+2) /*@ where F=F */;
  a=hc_neon_fma3_lane0(&a,&w0,&w1,&w2,&x0,&x1,&x2);
 }
 /*@ Assert exists(A:Recordfloat32x4_t),p0==p0@pre && p1==p1@pre && p2==p2@pre && w==w@pre && width==width@pre && x==x@pre && 0<width && 0<=x && x<(width+1)/2 && hc_footprint(p0,3*width+3) && hc_footprint(p1,3*width+3) && hc_footprint(p2,3*width+3) && hc_footprint(w,112) && hc_window(F,p0,3*width+3) && hc_window(F,p1,3*width+3) && hc_window(F,p2,3*width+3) && hc_window(F,w,112) && hc_neon_rows_acc(A,F,p0,p1,p2,w,width,x,6) && hc_data(F)*StructPredfloat32x4_t(&a,A) */
 {
  if (2*x+1<width) {
  const float32x4_t w0=hc_isa_load4(w+76) /*@ where F=F */;
  const float32x4_t w1=hc_isa_load4(w+80) /*@ where F=F */;
  const float32x4_t w2=hc_isa_load4(w+84) /*@ where F=F */;
  float32x4_t x0=hc_isa_dup4(0.0f);
  float32x4_t x1=hc_isa_dup4(0.0f);
  float32x4_t x2=hc_isa_dup4(0.0f);
  x0=hc_isa_dup_load4(p0+3*(2*x+1)+0) /*@ where F=F */;
  x1=hc_isa_dup_load4(p1+3*(2*x+1)+0) /*@ where F=F */;
  x2=hc_isa_dup_load4(p2+3*(2*x+1)+0) /*@ where F=F */;
  a=hc_neon_fma3_lane0(&a,&w0,&w1,&w2,&x0,&x1,&x2);
  }
 }
 /*@ Assert exists(A:Recordfloat32x4_t),p0==p0@pre && p1==p1@pre && p2==p2@pre && w==w@pre && width==width@pre && x==x@pre && 0<width && 0<=x && x<(width+1)/2 && hc_footprint(p0,3*width+3) && hc_footprint(p1,3*width+3) && hc_footprint(p2,3*width+3) && hc_footprint(w,112) && hc_window(F,p0,3*width+3) && hc_window(F,p1,3*width+3) && hc_window(F,p2,3*width+3) && hc_window(F,w,112) && hc_neon_rows_acc(A,F,p0,p1,p2,w,width,x,7) && hc_data(F)*StructPredfloat32x4_t(&a,A) */
 {
  if (2*x+1<width) {
  const float32x4_t w0=hc_isa_load4(w+88) /*@ where F=F */;
  const float32x4_t w1=hc_isa_load4(w+92) /*@ where F=F */;
  const float32x4_t w2=hc_isa_load4(w+96) /*@ where F=F */;
  float32x4_t x0=hc_isa_dup4(0.0f);
  float32x4_t x1=hc_isa_dup4(0.0f);
  float32x4_t x2=hc_isa_dup4(0.0f);
  x0=hc_isa_dup_load4(p0+3*(2*x+1)+1) /*@ where F=F */;
  x1=hc_isa_dup_load4(p1+3*(2*x+1)+1) /*@ where F=F */;
  x2=hc_isa_dup_load4(p2+3*(2*x+1)+1) /*@ where F=F */;
  a=hc_neon_fma3_lane0(&a,&w0,&w1,&w2,&x0,&x1,&x2);
  }
 }
 /*@ Assert exists(A:Recordfloat32x4_t),p0==p0@pre && p1==p1@pre && p2==p2@pre && w==w@pre && width==width@pre && x==x@pre && 0<width && 0<=x && x<(width+1)/2 && hc_footprint(p0,3*width+3) && hc_footprint(p1,3*width+3) && hc_footprint(p2,3*width+3) && hc_footprint(w,112) && hc_window(F,p0,3*width+3) && hc_window(F,p1,3*width+3) && hc_window(F,p2,3*width+3) && hc_window(F,w,112) && hc_neon_rows_acc(A,F,p0,p1,p2,w,width,x,8) && hc_data(F)*StructPredfloat32x4_t(&a,A) */
 {
  if (2*x+1<width) {
  const float32x4_t w0=hc_isa_load4(w+100) /*@ where F=F */;
  const float32x4_t w1=hc_isa_load4(w+104) /*@ where F=F */;
  const float32x4_t w2=hc_isa_load4(w+108) /*@ where F=F */;
  float32x4_t x0=hc_isa_dup4(0.0f);
  float32x4_t x1=hc_isa_dup4(0.0f);
  float32x4_t x2=hc_isa_dup4(0.0f);
  x0=hc_isa_dup_load4(p0+3*(2*x+1)+2) /*@ where F=F */;
  x1=hc_isa_dup_load4(p1+3*(2*x+1)+2) /*@ where F=F */;
  x2=hc_isa_dup_load4(p2+3*(2*x+1)+2) /*@ where F=F */;
  a=hc_neon_fma3_lane0(&a,&w0,&w1,&w2,&x0,&x1,&x2);
  }
 }
 /*@ Assert exists(A:Recordfloat32x4_t),p0==p0@pre && p1==p1@pre && p2==p2@pre && w==w@pre && width==width@pre && x==x@pre && 0<width && 0<=x && x<(width+1)/2 && hc_footprint(p0,3*width+3) && hc_footprint(p1,3*width+3) && hc_footprint(p2,3*width+3) && hc_footprint(w,112) && hc_window(F,p0,3*width+3) && hc_window(F,p1,3*width+3) && hc_window(F,p2,3*width+3) && hc_window(F,w,112) && hc_neon_rows_acc(A,F,p0,p1,p2,w,width,x,9) && hc_data(F)*StructPredfloat32x4_t(&a,A) */
 return a;
}
