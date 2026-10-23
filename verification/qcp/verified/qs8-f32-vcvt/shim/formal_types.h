#ifndef QS8_F32_FORMAL_TYPES_H
#define QS8_F32_FORMAL_TYPES_H
#include "formal_model.h"
/* Fixed VLEN128: e8m2/e16m4/e32m8 each VLMAX32. Scalar-field C-shim, no physical vector ABI claim. */
/*@ Import Coq Require Import Qs8Cvt.Types */
typedef unsigned long long size_t;
struct qcp_qs8_cvt_scalar_params {int32_t zero_point;float scale;};
struct xnn_qs8_f32_cvt_params {struct qcp_qs8_cvt_scalar_params scalar;};
typedef struct int8x8_t {int8_t s0; int8_t s1; int8_t s2; int8_t s3; int8_t s4; int8_t s5; int8_t s6; int8_t s7;} int8x8_t;
typedef struct int16x8_t {int16_t s0; int16_t s1; int16_t s2; int16_t s3; int16_t s4; int16_t s5; int16_t s6; int16_t s7;} int16x8_t;
typedef struct int16x4_t {int16_t s0; int16_t s1; int16_t s2; int16_t s3;} int16x4_t;
typedef struct int32x4_t {int32_t s0; int32_t s1; int32_t s2; int32_t s3;} int32x4_t;
typedef struct float32x4_t {float s0; float s1; float s2; float s3;} float32x4_t;
typedef struct float32x2_t {float s0; float s1;} float32x2_t;
typedef struct vint8m2_t {int8_t s0; int8_t s1; int8_t s2; int8_t s3; int8_t s4; int8_t s5; int8_t s6; int8_t s7; int8_t s8; int8_t s9; int8_t s10; int8_t s11; int8_t s12; int8_t s13; int8_t s14; int8_t s15; int8_t s16; int8_t s17; int8_t s18; int8_t s19; int8_t s20; int8_t s21; int8_t s22; int8_t s23; int8_t s24; int8_t s25; int8_t s26; int8_t s27; int8_t s28; int8_t s29; int8_t s30; int8_t s31;} vint8m2_t;
typedef struct vint16m4_t {int16_t s0; int16_t s1; int16_t s2; int16_t s3; int16_t s4; int16_t s5; int16_t s6; int16_t s7; int16_t s8; int16_t s9; int16_t s10; int16_t s11; int16_t s12; int16_t s13; int16_t s14; int16_t s15; int16_t s16; int16_t s17; int16_t s18; int16_t s19; int16_t s20; int16_t s21; int16_t s22; int16_t s23; int16_t s24; int16_t s25; int16_t s26; int16_t s27; int16_t s28; int16_t s29; int16_t s30; int16_t s31;} vint16m4_t;
typedef struct vint32m8_t {int32_t s0; int32_t s1; int32_t s2; int32_t s3; int32_t s4; int32_t s5; int32_t s6; int32_t s7; int32_t s8; int32_t s9; int32_t s10; int32_t s11; int32_t s12; int32_t s13; int32_t s14; int32_t s15; int32_t s16; int32_t s17; int32_t s18; int32_t s19; int32_t s20; int32_t s21; int32_t s22; int32_t s23; int32_t s24; int32_t s25; int32_t s26; int32_t s27; int32_t s28; int32_t s29; int32_t s30; int32_t s31;} vint32m8_t;
typedef struct vfloat32m8_t {float s0; float s1; float s2; float s3; float s4; float s5; float s6; float s7; float s8; float s9; float s10; float s11; float s12; float s13; float s14; float s15; float s16; float s17; float s18; float s19; float s20; float s21; float s22; float s23; float s24; float s25; float s26; float s27; float s28; float s29; float s30; float s31;} vfloat32m8_t;
#endif
