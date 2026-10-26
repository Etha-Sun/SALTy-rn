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
/*@ Extern Coq (hc_clamp_min : Recordvfloat32m1_t -> Recordvfloat32m1_t -> fp32 -> Z -> Prop) (hc_clamp_max : Recordvfloat32m1_t -> Recordvfloat32m1_t -> fp32 -> Z -> Prop) */
vfloat32m1_t hc_min_f32m1(const vfloat32m1_t *pa,float b,size_t vl)
/*@ With (A:Recordvfloat32m1_t) Require 0<=vl && vl<=4 && StructPredvfloat32m1_t(pa,A) Ensure exists(R:Recordvfloat32m1_t),hc_clamp_min(R,A,b,vl) && (StructPredvfloat32m1_t(pa,A) * StructPredvfloat32m1_t(&__return,R)) */
;
vfloat32m1_t hc_max_f32m1(const vfloat32m1_t *pa,float b,size_t vl)
/*@ With (A:Recordvfloat32m1_t) Require 0<=vl && vl<=4 && StructPredvfloat32m1_t(pa,A) Ensure exists(R:Recordvfloat32m1_t),hc_clamp_max(R,A,b,vl) && (StructPredvfloat32m1_t(pa,A) * StructPredvfloat32m1_t(&__return,R)) */
;
vfloat32m1_t hc_min_f32m1(const vfloat32m1_t *pa,float b,size_t vl)
/*@ With (A:Recordvfloat32m1_t) Require 0<=vl && vl<=4 && StructPredvfloat32m1_t(pa,A) Ensure exists(R:Recordvfloat32m1_t),hc_clamp_min(R,A,b,vl) && (StructPredvfloat32m1_t(pa,A) * StructPredvfloat32m1_t(&__return,R)) */
{
  vfloat32m1_t a=*pa;
  vuint32m1_t qbits=hc_isa_splat_u32(0x7FC00000u,vl);
  vfloat32m1_t qnan=hc_isa_bits_to_float(&(qbits));
  float bc=hc_copy_float(b);
  if (b!=bc) return qnan;
  vbool32_t nan=hc_isa_self_ne(&(a),vl);
  vfloat32m1_t r=hc_isa_min_view(&(a),b,vl);
  return hc_isa_merge_view(&(r),&(qnan),&(nan),vl);
}
vfloat32m1_t hc_max_f32m1(const vfloat32m1_t *pa,float b,size_t vl)
/*@ With (A:Recordvfloat32m1_t) Require 0<=vl && vl<=4 && StructPredvfloat32m1_t(pa,A) Ensure exists(R:Recordvfloat32m1_t),hc_clamp_max(R,A,b,vl) && (StructPredvfloat32m1_t(pa,A) * StructPredvfloat32m1_t(&__return,R)) */
{
  vfloat32m1_t a=*pa;
  vuint32m1_t qbits=hc_isa_splat_u32(0x7FC00000u,vl);
  vfloat32m1_t qnan=hc_isa_bits_to_float(&(qbits));
  float bc=hc_copy_float(b);
  if (b!=bc) return qnan;
  vbool32_t nan=hc_isa_self_ne(&(a),vl);
  vfloat32m1_t r=hc_isa_max_view(&(a),b,vl);
  return hc_isa_merge_view(&(r),&(qnan),&(nan),vl);
}
