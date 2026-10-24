typedef unsigned long long size_t;
struct xnn_f32_default_params { char unused; };
typedef struct float32x4_t { float s0; float s1; float s2; float s3; } float32x4_t;
typedef struct float32x2_t { float s0; float s1; } float32x2_t;
typedef struct vfloat32m8_t { float s0; float s1; float s2; float s3; float s4; float s5; float s6; float s7; float s8; float s9; float s10; float s11; float s12; float s13; float s14; float s15; float s16; float s17; float s18; float s19; float s20; float s21; float s22; float s23; float s24; float s25; float s26; float s27; float s28; float s29; float s30; float s31; } vfloat32m8_t;
/*@ Import Coq Require Import QcpRvv32.RvvStoreModel */
/*@ Extern Coq
 (FloatArray::full : Z -> Z -> list fp32 -> Assertion)
 (FloatArray::undef_full : Z -> Z -> Assertion)
 (FloatArray::seg : Z -> Z -> Z -> list fp32 -> Assertion)
 (FloatArray::undef_seg : Z -> Z -> Z -> Assertion)
 (rvv_take : Z -> list fp32 -> list fp32)
 (rvv_get : Z -> list fp32 -> fp32)
 (rvv_snoc : list fp32 -> fp32 -> list fp32)
 (rvv_length : list fp32 -> Z)
 (rvv_pack32 : fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> list fp32) */
/*@ Import Coq Require Import QcpVadd.VaddBits */
/*@ Extern Coq (FloatArray::full : Z -> Z -> list fp32 -> Assertion)
               (FloatArray::seg : Z -> Z -> Z -> list fp32 -> Assertion)
               (FloatArray::missing_i : Z -> Z -> Z -> Z -> list fp32 -> Assertion)
               (fp32_bits_equal : fp32 -> fp32 -> Prop) */
/*@ Import Coq Require Import Sqrt.Types Sqrt.Pack Sqrt.Borrowed */
/*@ Extern Coq (FloatArray::undef_full : Z -> Z -> Assertion) (FloatArray::undef_seg : Z -> Z -> Z -> Assertion) (UndefStructPredfloat32x4_t : Z -> Assertion) (UndefStructPredfloat32x2_t : Z -> Assertion) (UndefStructPredvfloat32m8_t : Z -> Assertion) (sqrt_arm : fp32 -> fp32) (sqrt_rvv : fp32 -> fp32) (sqrt_vl : Z -> Z) (sqrt_vl_allowed : Z -> Z -> Prop) (sqrt_take : Z -> list fp32 -> list fp32) (sqrt_lane : Z -> list fp32 -> fp32) (sqrt_active : Z -> Z -> fp32 -> fp32 -> fp32) (sqrt_read_at : Z -> Z -> Z -> list fp32 -> fp32 -> fp32) (sqrt_read_active : Z -> Z -> list fp32 -> fp32 -> fp32) (sqrt_arm_values : Z -> list fp32 -> list fp32) (sqrt_rvv_values : Z -> list fp32 -> list fp32) (sqrt_outputs_related : list fp32 -> list fp32 -> Prop) (sqrt_pack1 : fp32 -> list fp32) (sqrt_pack2 : fp32 -> fp32 -> list fp32) (sqrt_pack4 : fp32 -> fp32 -> fp32 -> fp32 -> list fp32) (sqrt_pack32 : fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> list fp32) */
/*@ include strategies "float_array.strategies" */
void qcp_vadd_read(const float *p, float *out, size_t n, size_t i)
/*@ With (L: list fp32)
    Require 0 < n && 0 <= i && i < n && FloatArray::full(p,n,L) * undef_data_at(out,float)
    Ensure FloatArray::seg(p,0,n,L) * store(out,float,L[i]) */
{ *out = p[i]; }
