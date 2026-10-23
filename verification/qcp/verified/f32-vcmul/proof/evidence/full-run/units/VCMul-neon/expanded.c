/*@ Import Coq Require Import VCMul.Model */
/*@ Extern Coq (same_fp32 : fp32 -> fp32 -> Prop)
 (vcmul_mla : fp32 -> fp32 -> fp32 -> fp32)
 (vcmul_mls : fp32 -> fp32 -> fp32 -> fp32)
 (vcmul_active_mul : Z -> Z -> fp32 -> fp32 -> fp32)
 (vcmul_active_add : Z -> Z -> fp32 -> fp32 -> fp32)
 (vcmul_active_sub : Z -> Z -> fp32 -> fp32 -> fp32) */
typedef unsigned long long size_t;
typedef unsigned long long uintptr_t;
struct xnn_f32_default_params { char _; };
typedef struct float32x4_t { float s0; float s1; float s2; float s3; } float32x4_t;
typedef struct float32x2_t { float s0; float s1; } float32x2_t;
typedef struct vfloat32m4_t { float s0; float s1; float s2; float s3; float s4; float s5; float s6; float s7; float s8; float s9; float s10; float s11; float s12; float s13; float s14; float s15; } vfloat32m4_t;
/* Identical float4/float2 layouts are supplied by this case. */
/*@ Import Coq Require Import QcpNeonLoop.InvariantFacts */
/*@ Extern Coq (fp32_length : list fp32 -> Z) */
/*@ Import Coq Require Import QcpVadd.VaddBits */
/*@ Extern Coq (FloatArray::full : Z -> Z -> list fp32 -> Assertion)
               (FloatArray::seg : Z -> Z -> Z -> list fp32 -> Assertion)
               (FloatArray::missing_i : Z -> Z -> Z -> Z -> list fp32 -> Assertion)
               (fp32_bits_equal : fp32 -> fp32 -> Prop) */
/*@ Import Coq Require Import QcpNeon.NeonBridge */
/*@ Extern Coq (FloatArray::undef_full : Z -> Z -> Assertion)
               (FloatArray::undef_seg : Z -> Z -> Z -> Assertion)
               (fp32_slice : Z -> Z -> list fp32 -> list fp32)
               (FloatArray::full : Z -> Z -> list fp32 -> Assertion)
               (FloatArray::seg : Z -> Z -> Z -> list fp32 -> Assertion)
               (UndefStructPredfloat32x4_t : Z -> Assertion)
               (UndefStructPredfloat32x2_t : Z -> Assertion) */
/*@ Import Coq Require Import QcpNeonLoop.NeonLoopBridge */
/*@ include strategies "neon_bridge.strategies" */
/*@ include strategies "neon_tail.strategies" */
/*@ include strategies "float_array.strategies" */
/*@ Import Coq Require Import QcpVadd.VaddBits VCMul.Model */
/*@ Extern Coq (FloatArray::full : Z -> Z -> list fp32 -> Assertion)
 (FloatArray::missing_i : Z -> Z -> Z -> Z -> list fp32 -> Assertion) */
float32x4_t qcp_vcmul_load4(const float *p)
/*@ With (base:Z) (n:Z) (idx:Z) (L:list fp32)
 Require 0<=idx && idx+4<=n && p==base+4*idx && FloatArray::full(base,n,L)
 Ensure FloatArray::full(base,n,L) *
 store(&(__return.s0),float,L[idx]) * store(&(__return.s1),float,L[idx+1]) *
 store(&(__return.s2),float,L[idx+2]) * store(&(__return.s3),float,L[idx+3]) */;
void qcp_vst1q_f32(float *p, const float32x4_t *a)
/*@ With (x0:fp32) (x1:fp32) (x2:fp32) (x3:fp32)
 Require store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * store(&(a->s2),float,x2) * store(&(a->s3),float,x3) * undef_data_at(pointer_offset(p,0,float),float) * undef_data_at(pointer_offset(p,1,float),float) * undef_data_at(pointer_offset(p,2,float),float) * undef_data_at(pointer_offset(p,3,float),float)
 Ensure store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * store(&(a->s2),float,x2) * store(&(a->s3),float,x3) * store(pointer_offset(p,0,float),float,x0) * store(pointer_offset(p,1,float),float,x1) * store(pointer_offset(p,2,float),float,x2) * store(pointer_offset(p,3,float),float,x3) */;
void qcp_vst1_f32(float *p, const float32x2_t *a)
/*@ With (x0:fp32) (x1:fp32)
 Require store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * undef_data_at(pointer_offset(p,0,float),float) * undef_data_at(pointer_offset(p,1,float),float)
 Ensure store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * store(pointer_offset(p,0,float),float,x0) * store(pointer_offset(p,1,float),float,x1) */;
float32x2_t vget_low_f32(float32x4_t a)
/*@ With (x0:fp32) (x1:fp32) (x2:fp32) (x3:fp32)
 Require store(&(a.s0),float,x0) * store(&(a.s1),float,x1) * store(&(a.s2),float,x2) * store(&(a.s3),float,x3)
 Ensure store(&(__return.s0),float,x0) * store(&(__return.s1),float,x1) */;
float32x2_t vget_high_f32(float32x4_t a)
/*@ With (x0:fp32) (x1:fp32) (x2:fp32) (x3:fp32)
 Require store(&(a.s0),float,x0) * store(&(a.s1),float,x1) * store(&(a.s2),float,x2) * store(&(a.s3),float,x3)
 Ensure store(&(__return.s0),float,x2) * store(&(__return.s1),float,x3) */;
void qcp_vst1_lane_f32(float *p, const float32x2_t *a, int lane)
/*@ With (x0:fp32) (x1:fp32)
 Require lane == 0 && store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * undef_data_at(p,float)
 Ensure store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * store(p,float,x0) */;
void qcp_assert(int condition)
/*@ Require condition != 0 && emp Ensure emp */;
float qcp_vcmul_mul(float a,float b)
/*@ Require emp Ensure same_fp32(__return,fp32_mul(a,b)) && emp */;
float qcp_vcmul_add(float a,float b)
/*@ Require emp Ensure same_fp32(__return,fp32_add(a,b)) && emp */;
float qcp_vcmul_sub(float a,float b)
/*@ Require emp Ensure same_fp32(__return,fp32_sub(a,b)) && emp */;
float qcp_vcmul_mla(float a,float b,float c)
/*@ Require emp Ensure same_fp32(__return,vcmul_mla(a,b,c)) && emp */;
float qcp_vcmul_mls(float a,float b,float c)
/*@ Require emp Ensure same_fp32(__return,vcmul_mls(a,b,c)) && emp */;
float qcp_vcmul_active_mul(float a,float b,unsigned long long i,unsigned long long vl)
/*@ Require 0<=i && i<16 && 0<=vl && vl<=16 && emp Ensure same_fp32(__return,vcmul_active_mul(i,vl,a,b)) && emp */;
float qcp_vcmul_active_add(float a,float b,unsigned long long i,unsigned long long vl)
/*@ Require 0<=i && i<16 && 0<=vl && vl<=16 && emp Ensure same_fp32(__return,vcmul_active_add(i,vl,a,b)) && emp */;
float qcp_vcmul_active_sub(float a,float b,unsigned long long i,unsigned long long vl)
/*@ Require 0<=i && i<16 && 0<=vl && vl<=16 && emp Ensure same_fp32(__return,vcmul_active_sub(i,vl,a,b)) && emp */;
float32x4_t vmulq_f32(float32x4_t a,float32x4_t b)
/*@ With (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32) (b0:fp32) (b1:fp32) (b2:fp32) (b3:fp32)
 Require store(&(a.s0),float,a0) * store(&(a.s1),float,a1) * store(&(a.s2),float,a2) * store(&(a.s3),float,a3) * store(&(b.s0),float,b0) * store(&(b.s1),float,b1) * store(&(b.s2),float,b2) * store(&(b.s3),float,b3)
 Ensure store(&(__return.s0),float,fp32_mul(a0,b0)) * store(&(__return.s1),float,fp32_mul(a1,b1)) * store(&(__return.s2),float,fp32_mul(a2,b2)) * store(&(__return.s3),float,fp32_mul(a3,b3)) */;
float32x4_t vmlaq_f32(float32x4_t a,float32x4_t b,float32x4_t c)
/*@ With (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32) (b0:fp32) (b1:fp32) (b2:fp32) (b3:fp32) (c0:fp32) (c1:fp32) (c2:fp32) (c3:fp32)
 Require store(&(a.s0),float,a0) * store(&(a.s1),float,a1) * store(&(a.s2),float,a2) * store(&(a.s3),float,a3) * store(&(b.s0),float,b0) * store(&(b.s1),float,b1) * store(&(b.s2),float,b2) * store(&(b.s3),float,b3) * store(&(c.s0),float,c0) * store(&(c.s1),float,c1) * store(&(c.s2),float,c2) * store(&(c.s3),float,c3)
 Ensure store(&(__return.s0),float,vcmul_mla(a0,b0,c0)) * store(&(__return.s1),float,vcmul_mla(a1,b1,c1)) * store(&(__return.s2),float,vcmul_mla(a2,b2,c2)) * store(&(__return.s3),float,vcmul_mla(a3,b3,c3)) */;
float32x4_t vmlsq_f32(float32x4_t a,float32x4_t b,float32x4_t c)
/*@ With (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32) (b0:fp32) (b1:fp32) (b2:fp32) (b3:fp32) (c0:fp32) (c1:fp32) (c2:fp32) (c3:fp32)
 Require store(&(a.s0),float,a0) * store(&(a.s1),float,a1) * store(&(a.s2),float,a2) * store(&(a.s3),float,a3) * store(&(b.s0),float,b0) * store(&(b.s1),float,b1) * store(&(b.s2),float,b2) * store(&(b.s3),float,b3) * store(&(c.s0),float,c0) * store(&(c.s1),float,c1) * store(&(c.s2),float,c2) * store(&(c.s3),float,c3)
 Ensure store(&(__return.s0),float,vcmul_mls(a0,b0,c0)) * store(&(__return.s1),float,vcmul_mls(a1,b1,c1)) * store(&(__return.s2),float,vcmul_mls(a2,b2,c2)) * store(&(__return.s3),float,vcmul_mls(a3,b3,c3)) */;
vfloat32m4_t __riscv_vfmul_vv_f32m4(vfloat32m4_t a,vfloat32m4_t b,size_t vl)
/*@ With (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32) (a4:fp32) (a5:fp32) (a6:fp32) (a7:fp32) (a8:fp32) (a9:fp32) (a10:fp32) (a11:fp32) (a12:fp32) (a13:fp32) (a14:fp32) (a15:fp32) (b0:fp32) (b1:fp32) (b2:fp32) (b3:fp32) (b4:fp32) (b5:fp32) (b6:fp32) (b7:fp32) (b8:fp32) (b9:fp32) (b10:fp32) (b11:fp32) (b12:fp32) (b13:fp32) (b14:fp32) (b15:fp32)
 Require 0<=vl && vl<=16 && store(&(a.s0),float,a0) * store(&(a.s1),float,a1) * store(&(a.s2),float,a2) * store(&(a.s3),float,a3) * store(&(a.s4),float,a4) * store(&(a.s5),float,a5) * store(&(a.s6),float,a6) * store(&(a.s7),float,a7) * store(&(a.s8),float,a8) * store(&(a.s9),float,a9) * store(&(a.s10),float,a10) * store(&(a.s11),float,a11) * store(&(a.s12),float,a12) * store(&(a.s13),float,a13) * store(&(a.s14),float,a14) * store(&(a.s15),float,a15) * store(&(b.s0),float,b0) * store(&(b.s1),float,b1) * store(&(b.s2),float,b2) * store(&(b.s3),float,b3) * store(&(b.s4),float,b4) * store(&(b.s5),float,b5) * store(&(b.s6),float,b6) * store(&(b.s7),float,b7) * store(&(b.s8),float,b8) * store(&(b.s9),float,b9) * store(&(b.s10),float,b10) * store(&(b.s11),float,b11) * store(&(b.s12),float,b12) * store(&(b.s13),float,b13) * store(&(b.s14),float,b14) * store(&(b.s15),float,b15)
 Ensure store(&(__return.s0),float,vcmul_active_mul(0,vl,a0,b0)) * store(&(__return.s1),float,vcmul_active_mul(1,vl,a1,b1)) * store(&(__return.s2),float,vcmul_active_mul(2,vl,a2,b2)) * store(&(__return.s3),float,vcmul_active_mul(3,vl,a3,b3)) * store(&(__return.s4),float,vcmul_active_mul(4,vl,a4,b4)) * store(&(__return.s5),float,vcmul_active_mul(5,vl,a5,b5)) * store(&(__return.s6),float,vcmul_active_mul(6,vl,a6,b6)) * store(&(__return.s7),float,vcmul_active_mul(7,vl,a7,b7)) * store(&(__return.s8),float,vcmul_active_mul(8,vl,a8,b8)) * store(&(__return.s9),float,vcmul_active_mul(9,vl,a9,b9)) * store(&(__return.s10),float,vcmul_active_mul(10,vl,a10,b10)) * store(&(__return.s11),float,vcmul_active_mul(11,vl,a11,b11)) * store(&(__return.s12),float,vcmul_active_mul(12,vl,a12,b12)) * store(&(__return.s13),float,vcmul_active_mul(13,vl,a13,b13)) * store(&(__return.s14),float,vcmul_active_mul(14,vl,a14,b14)) * store(&(__return.s15),float,vcmul_active_mul(15,vl,a15,b15)) */;
vfloat32m4_t __riscv_vfadd_vv_f32m4(vfloat32m4_t a,vfloat32m4_t b,size_t vl)
/*@ With (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32) (a4:fp32) (a5:fp32) (a6:fp32) (a7:fp32) (a8:fp32) (a9:fp32) (a10:fp32) (a11:fp32) (a12:fp32) (a13:fp32) (a14:fp32) (a15:fp32) (b0:fp32) (b1:fp32) (b2:fp32) (b3:fp32) (b4:fp32) (b5:fp32) (b6:fp32) (b7:fp32) (b8:fp32) (b9:fp32) (b10:fp32) (b11:fp32) (b12:fp32) (b13:fp32) (b14:fp32) (b15:fp32)
 Require 0<=vl && vl<=16 && store(&(a.s0),float,a0) * store(&(a.s1),float,a1) * store(&(a.s2),float,a2) * store(&(a.s3),float,a3) * store(&(a.s4),float,a4) * store(&(a.s5),float,a5) * store(&(a.s6),float,a6) * store(&(a.s7),float,a7) * store(&(a.s8),float,a8) * store(&(a.s9),float,a9) * store(&(a.s10),float,a10) * store(&(a.s11),float,a11) * store(&(a.s12),float,a12) * store(&(a.s13),float,a13) * store(&(a.s14),float,a14) * store(&(a.s15),float,a15) * store(&(b.s0),float,b0) * store(&(b.s1),float,b1) * store(&(b.s2),float,b2) * store(&(b.s3),float,b3) * store(&(b.s4),float,b4) * store(&(b.s5),float,b5) * store(&(b.s6),float,b6) * store(&(b.s7),float,b7) * store(&(b.s8),float,b8) * store(&(b.s9),float,b9) * store(&(b.s10),float,b10) * store(&(b.s11),float,b11) * store(&(b.s12),float,b12) * store(&(b.s13),float,b13) * store(&(b.s14),float,b14) * store(&(b.s15),float,b15)
 Ensure store(&(__return.s0),float,vcmul_active_add(0,vl,a0,b0)) * store(&(__return.s1),float,vcmul_active_add(1,vl,a1,b1)) * store(&(__return.s2),float,vcmul_active_add(2,vl,a2,b2)) * store(&(__return.s3),float,vcmul_active_add(3,vl,a3,b3)) * store(&(__return.s4),float,vcmul_active_add(4,vl,a4,b4)) * store(&(__return.s5),float,vcmul_active_add(5,vl,a5,b5)) * store(&(__return.s6),float,vcmul_active_add(6,vl,a6,b6)) * store(&(__return.s7),float,vcmul_active_add(7,vl,a7,b7)) * store(&(__return.s8),float,vcmul_active_add(8,vl,a8,b8)) * store(&(__return.s9),float,vcmul_active_add(9,vl,a9,b9)) * store(&(__return.s10),float,vcmul_active_add(10,vl,a10,b10)) * store(&(__return.s11),float,vcmul_active_add(11,vl,a11,b11)) * store(&(__return.s12),float,vcmul_active_add(12,vl,a12,b12)) * store(&(__return.s13),float,vcmul_active_add(13,vl,a13,b13)) * store(&(__return.s14),float,vcmul_active_add(14,vl,a14,b14)) * store(&(__return.s15),float,vcmul_active_add(15,vl,a15,b15)) */;
vfloat32m4_t __riscv_vfsub_vv_f32m4(vfloat32m4_t a,vfloat32m4_t b,size_t vl)
/*@ With (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32) (a4:fp32) (a5:fp32) (a6:fp32) (a7:fp32) (a8:fp32) (a9:fp32) (a10:fp32) (a11:fp32) (a12:fp32) (a13:fp32) (a14:fp32) (a15:fp32) (b0:fp32) (b1:fp32) (b2:fp32) (b3:fp32) (b4:fp32) (b5:fp32) (b6:fp32) (b7:fp32) (b8:fp32) (b9:fp32) (b10:fp32) (b11:fp32) (b12:fp32) (b13:fp32) (b14:fp32) (b15:fp32)
 Require 0<=vl && vl<=16 && store(&(a.s0),float,a0) * store(&(a.s1),float,a1) * store(&(a.s2),float,a2) * store(&(a.s3),float,a3) * store(&(a.s4),float,a4) * store(&(a.s5),float,a5) * store(&(a.s6),float,a6) * store(&(a.s7),float,a7) * store(&(a.s8),float,a8) * store(&(a.s9),float,a9) * store(&(a.s10),float,a10) * store(&(a.s11),float,a11) * store(&(a.s12),float,a12) * store(&(a.s13),float,a13) * store(&(a.s14),float,a14) * store(&(a.s15),float,a15) * store(&(b.s0),float,b0) * store(&(b.s1),float,b1) * store(&(b.s2),float,b2) * store(&(b.s3),float,b3) * store(&(b.s4),float,b4) * store(&(b.s5),float,b5) * store(&(b.s6),float,b6) * store(&(b.s7),float,b7) * store(&(b.s8),float,b8) * store(&(b.s9),float,b9) * store(&(b.s10),float,b10) * store(&(b.s11),float,b11) * store(&(b.s12),float,b12) * store(&(b.s13),float,b13) * store(&(b.s14),float,b14) * store(&(b.s15),float,b15)
 Ensure store(&(__return.s0),float,vcmul_active_sub(0,vl,a0,b0)) * store(&(__return.s1),float,vcmul_active_sub(1,vl,a1,b1)) * store(&(__return.s2),float,vcmul_active_sub(2,vl,a2,b2)) * store(&(__return.s3),float,vcmul_active_sub(3,vl,a3,b3)) * store(&(__return.s4),float,vcmul_active_sub(4,vl,a4,b4)) * store(&(__return.s5),float,vcmul_active_sub(5,vl,a5,b5)) * store(&(__return.s6),float,vcmul_active_sub(6,vl,a6,b6)) * store(&(__return.s7),float,vcmul_active_sub(7,vl,a7,b7)) * store(&(__return.s8),float,vcmul_active_sub(8,vl,a8,b8)) * store(&(__return.s9),float,vcmul_active_sub(9,vl,a9,b9)) * store(&(__return.s10),float,vcmul_active_sub(10,vl,a10,b10)) * store(&(__return.s11),float,vcmul_active_sub(11,vl,a11,b11)) * store(&(__return.s12),float,vcmul_active_sub(12,vl,a12,b12)) * store(&(__return.s13),float,vcmul_active_sub(13,vl,a13,b13)) * store(&(__return.s14),float,vcmul_active_sub(14,vl,a14,b14)) * store(&(__return.s15),float,vcmul_active_sub(15,vl,a15,b15)) */;
/*@ Import Coq Require Import VCMul.ComplexModel */
/*@ Extern Coq (FloatArray::full : Z -> Z -> list fp32 -> Assertion)
 (FloatArray::seg : Z -> Z -> Z -> list fp32 -> Assertion)
 (FloatArray::undef_full : Z -> Z -> Assertion)
 (complex_real_prefix : Z -> Z -> list fp32 -> list fp32 -> list fp32)
 (complex_imag_prefix : Z -> Z -> list fp32 -> list fp32 -> list fp32)
 (vcmul_values : Z -> list fp32 -> list fp32 -> list fp32) */
/*@ include strategies "neon_vcmul.strategies" */
/*
struct xnn_f32_default_params {
  char _;  // Dummy member variable to comply with the C standard
};
*/
void test_neon(
    size_t batch,
    const float* input_a,
    const float* input_b,
    float* output,
    const struct xnn_f32_default_params* restrict params)
/*@ With (A:list fp32) (B:list fp32) (p:Z)
 Require 0<batch && batch<=9223372036854775788 && batch%4==0 &&
 input_a!=0 && input_b!=0 && output!=0 && params!=0 &&
 FloatArray::full(input_a,batch/2+3,A) * FloatArray::full(input_b,batch/2+3,B) *
 store(&(params->_),char,p) * FloatArray::undef_full(output,batch/2)
 Ensure FloatArray::full(input_a,batch/2+3,A) * FloatArray::full(input_b,batch/2+3,B) *
 store(&(params->_),char,p) * FloatArray::full(output,batch/2,vcmul_values(batch/4,A,B)) */
{
  qcp_assert(batch != 0);
  qcp_assert(batch % sizeof(float) == 0);
  qcp_assert(input_a != ((void *)0));
  qcp_assert(input_b != ((void *)0));
  qcp_assert(output != ((void *)0));
  const float* ar = input_a;
  const float* ai = (const float*) ((uintptr_t) input_a + batch);
  const float* br = input_b;
  const float* bi = (const float*) ((uintptr_t) input_b + batch);
  float* or = output;
  float* oi = (float*) ((uintptr_t) output + batch);
/*@ Inv Assert exists (k:Z),
fp32_length(A)==batch@pre/2+3 && fp32_length(B)==batch@pre/2+3 &&
0<batch@pre && batch@pre<=9223372036854775788 && batch@pre%4==0 &&
0<=k && k*4+batch==batch@pre && 0<=batch && batch<=batch@pre && batch%4==0 && k<=batch@pre/4 &&
batch@pre/4-k==batch/4 &&
(batch==0 || (batch==4 && batch/4==1) || (batch==8 && batch/4==2) ||
 (batch==12 && batch/4==3) || (16<=batch && 4<=batch/4)) &&
input_a==input_a@pre && input_b==input_b@pre && output==output@pre && params==params@pre &&
input_a!=0 && input_b!=0 && output!=0 && params!=0 &&
ar==input_a@pre+k && ai==input_a@pre+batch@pre/4+k &&
br==input_b@pre+k && bi==input_b@pre+batch@pre/4+k &&
or==output@pre+k && oi==output@pre+batch@pre/4+k &&
ar!=0 && ai!=0 && br!=0 && bi!=0 && or!=0 && oi!=0 &&
FloatArray::full(input_a@pre,batch@pre/2+3,A) *
FloatArray::full(input_b@pre,batch@pre/2+3,B) *
store(&(params->_),char,p) *
FloatArray::full(output@pre,k,complex_real_prefix(k,batch@pre/4,A,B)) *
FloatArray::undef_full(or,batch@pre/4-k) *
FloatArray::full(output@pre+batch@pre/4,k,complex_imag_prefix(k,batch@pre/4,A,B)) *
FloatArray::undef_full(oi,batch@pre/4-k) */
  for (; batch >= 4 * sizeof(float); batch -= 4 * sizeof(float)) {
    const float32x4_t var = qcp_vcmul_load4((ar)) /*@ where base=input_a,n=batch@pre/2+3,idx=(batch@pre-batch)/4,L=A */; ar += 4;
    const float32x4_t vai = qcp_vcmul_load4((ai)) /*@ where base=input_a,n=batch@pre/2+3,idx=batch@pre/4+(batch@pre-batch)/4,L=A */; ai += 4;
    const float32x4_t vbr = qcp_vcmul_load4((br)) /*@ where base=input_b,n=batch@pre/2+3,idx=(batch@pre-batch)/4,L=B */; br += 4;
    const float32x4_t vbi = qcp_vcmul_load4((bi)) /*@ where base=input_b,n=batch@pre/2+3,idx=batch@pre/4+(batch@pre-batch)/4,L=B */; bi += 4;
    float32x4_t vaccr = vmulq_f32(var, vbr) /*@ where a=&var,b=&vbr */;
    float32x4_t vacci = vmulq_f32(var, vbi) /*@ where a=&var,b=&vbi */;
    vaccr = vmlsq_f32(vaccr, vai, vbi) /*@ where a=&vaccr,b=&vai,c=&vbi */;
    vacci = vmlaq_f32(vacci, vai, vbr) /*@ where a=&vacci,b=&vai,c=&vbr */;
    qcp_vst1q_f32((or), &(vaccr)) /*@ where a=&vaccr */; or += 4;
    qcp_vst1q_f32((oi), &(vacci)) /*@ where a=&vacci */; oi += 4;
  }
  if (batch != 0) {
    const float32x4_t var = qcp_vcmul_load4((ar)) /*@ where base=input_a,n=batch@pre/2+3,idx=(batch@pre-batch)/4,L=A */; ar += 4;
    const float32x4_t vai = qcp_vcmul_load4((ai)) /*@ where base=input_a,n=batch@pre/2+3,idx=batch@pre/4+(batch@pre-batch)/4,L=A */; ai += 4;
    const float32x4_t vbr = qcp_vcmul_load4((br)) /*@ where base=input_b,n=batch@pre/2+3,idx=(batch@pre-batch)/4,L=B */; br += 4;
    const float32x4_t vbi = qcp_vcmul_load4((bi)) /*@ where base=input_b,n=batch@pre/2+3,idx=batch@pre/4+(batch@pre-batch)/4,L=B */; bi += 4;
    float32x4_t vaccr = vmulq_f32(var, vbr) /*@ where a=&var,b=&vbr */;
    float32x4_t vacci = vmulq_f32(var, vbi) /*@ where a=&var,b=&vbi */;
    vaccr = vmlsq_f32(vaccr, vai, vbi) /*@ where a=&vaccr,b=&vai,c=&vbi */;
    vacci = vmlaq_f32(vacci, vai, vbr) /*@ where a=&vacci,b=&vai,c=&vbr */;
    float32x2_t vaccr_lo = vget_low_f32(vaccr) /*@ where a=&vaccr */;
    float32x2_t vacci_lo = vget_low_f32(vacci) /*@ where a=&vacci */;
    if (batch & (2 * sizeof(float))) {
      qcp_vst1_f32((or), &(vaccr_lo)) /*@ where a=&vaccr_lo */; or += 2;
      qcp_vst1_f32((oi), &(vacci_lo)) /*@ where a=&vacci_lo */; oi += 2;
      vaccr_lo = vget_high_f32(vaccr) /*@ where a=&vaccr */;
      vacci_lo = vget_high_f32(vacci) /*@ where a=&vacci */;
    }
    if (batch & (1 * sizeof(float))) {
      qcp_vst1_lane_f32((or), &(vaccr_lo), (0)) /*@ where a=&vaccr_lo */;
      qcp_vst1_lane_f32((oi), &(vacci_lo), (0)) /*@ where a=&vacci_lo */;
    }
  }
}
