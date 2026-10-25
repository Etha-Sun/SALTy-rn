#ifndef SPMM_TYPES_H
#define SPMM_TYPES_H
#include "tuple/tuple.h"
#include "helpers.h"
typedef unsigned long long size_t;
typedef unsigned long long uintptr_t;
typedef long long intptr_t;
typedef int int32_t;
typedef unsigned int uint32_t;
struct scalar_bounds {float min;float max;};
struct xnn_f32_minmax_params {struct scalar_bounds scalar;};
struct float32x2_t {float s0;float s1;};
typedef struct float32x2_t float32x2_t;
#define assert(x) qcp_assert(x)
#define XNN_ARCH_ARM64 1
#define XNN_LIKELY(x) (x)
#define XNN_UNLIKELY(x) (x)
struct vfloat32m8_t {float s0;float s1;float s2;float s3;float s4;float s5;float s6;float s7;float s8;float s9;float s10;float s11;float s12;float s13;float s14;float s15;float s16;float s17;float s18;float s19;float s20;float s21;float s22;float s23;float s24;float s25;float s26;float s27;float s28;float s29;float s30;float s31;};
typedef struct vfloat32m8_t vfloat32m8_t;
struct vbool4_t {int s0;int s1;int s2;int s3;int s4;int s5;int s6;int s7;int s8;int s9;int s10;int s11;int s12;int s13;int s14;int s15;int s16;int s17;int s18;int s19;int s20;int s21;int s22;int s23;int s24;int s25;int s26;int s27;int s28;int s29;int s30;int s31;};
typedef struct vbool4_t vbool4_t;
/*@ Import Coq Require Import SpmmSpec.Model SpmmSpec.Vectors */
/*@ Extern Coq
 (FloatArray::full:Z -> Z -> list fp32 -> Assertion)
 (FloatArray::seg:Z -> Z -> Z -> list fp32 -> Assertion)
 (FloatArray::undef_full:Z -> Z -> Assertion)
 (spmm_get:Z -> list fp32 -> fp32)
 (bit_same:fp32 -> fp32 -> Prop)
 (fma_rne:fp32 -> fp32 -> fp32 -> fp32)
 (fp32_neon_min:fp32 -> fp32 -> fp32) (fp32_neon_max:fp32 -> fp32 -> fp32)
 (fp32_min_number:fp32 -> fp32 -> fp32) (fp32_max_number:fp32 -> fp32 -> fp32)
 (canonical_qnan:fp32) (spmm_nanth:fp32 -> Z) (spmm_merge:fp32 -> fp32 -> Z -> fp32)
 (spmm_vl_allowed:Z -> Z -> Prop)
 (UndefStructPredfloat32x2_t:Z -> Assertion)
 (UndefStructPredvfloat32m8_t:Z -> Assertion) (UndefStructPredvbool4_t:Z -> Assertion)
 (spmm_active32:Z -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> Prop)
 (spmm_mask32:Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Prop)
*/
/*@ include strategies "vectors.strategies" */
#endif
