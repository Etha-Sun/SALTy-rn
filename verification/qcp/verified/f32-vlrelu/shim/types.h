#ifndef QCP_VLRELU_TYPES_H
#define QCP_VLRELU_TYPES_H
/* This case provides the identical public float vector field layouts. */
#define QCP_VADD_TYPES_H
/*@ Import Coq Require Import VLRelu.Model */
/*@ Extern Coq (fp32_bits_equal : fp32 -> fp32 -> Prop)
 (vlrelu_signed32 : Z -> Z)
 (vlrelu_compare_mask : Z -> Z -> Z)
 (vlrelu_bitselect : Z -> fp32 -> fp32 -> fp32)
 (vlrelu_scalar : fp32 -> fp32 -> fp32)
 (vlrelu_values : Z -> list fp32 -> fp32 -> list fp32)
 (vlrelu_active_mul : Z -> Z -> fp32 -> fp32 -> fp32) */
typedef unsigned long long size_t;
typedef unsigned int uint32_t;
typedef int int32_t;
struct xnn_f32_lrelu_params { struct { float slope; } scalar; };
typedef struct float32x4_t { float s0; float s1; float s2; float s3; } float32x4_t;
typedef struct float32x2_t { float s0; float s1; } float32x2_t;
typedef struct vfloat32m8_t { float s0; float s1; float s2; float s3; float s4; float s5; float s6; float s7; float s8; float s9; float s10; float s11; float s12; float s13; float s14; float s15; float s16; float s17; float s18; float s19; float s20; float s21; float s22; float s23; float s24; float s25; float s26; float s27; float s28; float s29; float s30; float s31; } vfloat32m8_t;
typedef struct int32x4_t { int s0; int s1; int s2; int s3; } int32x4_t;
typedef struct uint32x4_t { unsigned int s0; unsigned int s1; unsigned int s2; unsigned int s3; } uint32x4_t;
#endif
