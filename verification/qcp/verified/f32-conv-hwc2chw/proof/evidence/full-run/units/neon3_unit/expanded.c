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
float32x4_t hc_neon_fma3_lane0(const float32x4_t *pa,const float32x4_t *pw0,const float32x4_t *pw1,const float32x4_t *pw2,const float32x4_t *px0,const float32x4_t *px1,const float32x4_t *px2)
/*@ With (A:Recordfloat32x4_t) (W0:Recordfloat32x4_t) (W1:Recordfloat32x4_t) (W2:Recordfloat32x4_t) (X0:Recordfloat32x4_t) (X1:Recordfloat32x4_t) (X2:Recordfloat32x4_t) Require StructPredfloat32x4_t(pa,A) * StructPredfloat32x4_t(pw0,W0) * StructPredfloat32x4_t(pw1,W1) * StructPredfloat32x4_t(pw2,W2) * StructPredfloat32x4_t(px0,X0) * StructPredfloat32x4_t(px1,X1) * StructPredfloat32x4_t(px2,X2) Ensure exists(R:Recordfloat32x4_t), hc_neon3(R,A,W0,W1,W2,X0,X1,X2,0) && (StructPredfloat32x4_t(pa,A) * StructPredfloat32x4_t(pw0,W0) * StructPredfloat32x4_t(pw1,W1) * StructPredfloat32x4_t(pw2,W2) * StructPredfloat32x4_t(px0,X0) * StructPredfloat32x4_t(px1,X1) * StructPredfloat32x4_t(px2,X2) * StructPredfloat32x4_t(&__return,R)) */
{
 float32x4_t a=*pa;
 float32x4_t w0=*pw0;
 float32x4_t w1=*pw1;
 float32x4_t w2=*pw2;
 float32x4_t x0=*px0;
 float32x4_t x1=*px1;
 float32x4_t x2=*px2;
 a=hc_isa_neon_fma0(&(a),&(w0),&(x0));
 a=hc_isa_neon_fma0(&(a),&(w1),&(x1));
 a=hc_isa_neon_fma0(&(a),&(w2),&(x2));
 return a;
}
float32x4_t hc_neon_fma3_lane1(const float32x4_t *pa,const float32x4_t *pw0,const float32x4_t *pw1,const float32x4_t *pw2,const float32x4_t *px0,const float32x4_t *px1,const float32x4_t *px2)
/*@ With (A:Recordfloat32x4_t) (W0:Recordfloat32x4_t) (W1:Recordfloat32x4_t) (W2:Recordfloat32x4_t) (X0:Recordfloat32x4_t) (X1:Recordfloat32x4_t) (X2:Recordfloat32x4_t) Require StructPredfloat32x4_t(pa,A) * StructPredfloat32x4_t(pw0,W0) * StructPredfloat32x4_t(pw1,W1) * StructPredfloat32x4_t(pw2,W2) * StructPredfloat32x4_t(px0,X0) * StructPredfloat32x4_t(px1,X1) * StructPredfloat32x4_t(px2,X2) Ensure exists(R:Recordfloat32x4_t), hc_neon3(R,A,W0,W1,W2,X0,X1,X2,1) && (StructPredfloat32x4_t(pa,A) * StructPredfloat32x4_t(pw0,W0) * StructPredfloat32x4_t(pw1,W1) * StructPredfloat32x4_t(pw2,W2) * StructPredfloat32x4_t(px0,X0) * StructPredfloat32x4_t(px1,X1) * StructPredfloat32x4_t(px2,X2) * StructPredfloat32x4_t(&__return,R)) */
{
 float32x4_t a=*pa;
 float32x4_t w0=*pw0;
 float32x4_t w1=*pw1;
 float32x4_t w2=*pw2;
 float32x4_t x0=*px0;
 float32x4_t x1=*px1;
 float32x4_t x2=*px2;
 a=hc_isa_neon_fma1(&(a),&(w0),&(x0));
 a=hc_isa_neon_fma1(&(a),&(w1),&(x1));
 a=hc_isa_neon_fma1(&(a),&(w2),&(x2));
 return a;
}
float32x4_t hc_neon_fma3_lane2(const float32x4_t *pa,const float32x4_t *pw0,const float32x4_t *pw1,const float32x4_t *pw2,const float32x4_t *px0,const float32x4_t *px1,const float32x4_t *px2)
/*@ With (A:Recordfloat32x4_t) (W0:Recordfloat32x4_t) (W1:Recordfloat32x4_t) (W2:Recordfloat32x4_t) (X0:Recordfloat32x4_t) (X1:Recordfloat32x4_t) (X2:Recordfloat32x4_t) Require StructPredfloat32x4_t(pa,A) * StructPredfloat32x4_t(pw0,W0) * StructPredfloat32x4_t(pw1,W1) * StructPredfloat32x4_t(pw2,W2) * StructPredfloat32x4_t(px0,X0) * StructPredfloat32x4_t(px1,X1) * StructPredfloat32x4_t(px2,X2) Ensure exists(R:Recordfloat32x4_t), hc_neon3(R,A,W0,W1,W2,X0,X1,X2,2) && (StructPredfloat32x4_t(pa,A) * StructPredfloat32x4_t(pw0,W0) * StructPredfloat32x4_t(pw1,W1) * StructPredfloat32x4_t(pw2,W2) * StructPredfloat32x4_t(px0,X0) * StructPredfloat32x4_t(px1,X1) * StructPredfloat32x4_t(px2,X2) * StructPredfloat32x4_t(&__return,R)) */
{
 float32x4_t a=*pa;
 float32x4_t w0=*pw0;
 float32x4_t w1=*pw1;
 float32x4_t w2=*pw2;
 float32x4_t x0=*px0;
 float32x4_t x1=*px1;
 float32x4_t x2=*px2;
 a=hc_isa_neon_fma2(&(a),&(w0),&(x0));
 a=hc_isa_neon_fma2(&(a),&(w1),&(x1));
 a=hc_isa_neon_fma2(&(a),&(w2),&(x2));
 return a;
}
float32x4_t hc_neon_fma3_lane3(const float32x4_t *pa,const float32x4_t *pw0,const float32x4_t *pw1,const float32x4_t *pw2,const float32x4_t *px0,const float32x4_t *px1,const float32x4_t *px2)
/*@ With (A:Recordfloat32x4_t) (W0:Recordfloat32x4_t) (W1:Recordfloat32x4_t) (W2:Recordfloat32x4_t) (X0:Recordfloat32x4_t) (X1:Recordfloat32x4_t) (X2:Recordfloat32x4_t) Require StructPredfloat32x4_t(pa,A) * StructPredfloat32x4_t(pw0,W0) * StructPredfloat32x4_t(pw1,W1) * StructPredfloat32x4_t(pw2,W2) * StructPredfloat32x4_t(px0,X0) * StructPredfloat32x4_t(px1,X1) * StructPredfloat32x4_t(px2,X2) Ensure exists(R:Recordfloat32x4_t), hc_neon3(R,A,W0,W1,W2,X0,X1,X2,3) && (StructPredfloat32x4_t(pa,A) * StructPredfloat32x4_t(pw0,W0) * StructPredfloat32x4_t(pw1,W1) * StructPredfloat32x4_t(pw2,W2) * StructPredfloat32x4_t(px0,X0) * StructPredfloat32x4_t(px1,X1) * StructPredfloat32x4_t(px2,X2) * StructPredfloat32x4_t(&__return,R)) */
{
 float32x4_t a=*pa;
 float32x4_t w0=*pw0;
 float32x4_t w1=*pw1;
 float32x4_t w2=*pw2;
 float32x4_t x0=*px0;
 float32x4_t x1=*px1;
 float32x4_t x2=*px2;
 a=hc_isa_neon_fma3(&(a),&(w0),&(x0));
 a=hc_isa_neon_fma3(&(a),&(w1),&(x1));
 a=hc_isa_neon_fma3(&(a),&(w2),&(x2));
 return a;
}
