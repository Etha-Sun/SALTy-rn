#ifndef RDSUM_FORMAL_TYPES_H
#define RDSUM_FORMAL_TYPES_H
#include "formal_model.h"
/*@ Import Coq Require Import Qs8Rdsum.Types */
typedef struct int8x8_t { int8_t s0;int8_t s1;int8_t s2;int8_t s3;int8_t s4;int8_t s5;int8_t s6;int8_t s7; } int8x8_t;
/*@ Extern Coq (UndefStructPredint8x8_t : Z -> Assertion) */
typedef struct int16x8_t { int16_t s0;int16_t s1;int16_t s2;int16_t s3;int16_t s4;int16_t s5;int16_t s6;int16_t s7; } int16x8_t;
/*@ Extern Coq (UndefStructPredint16x8_t : Z -> Assertion) */
typedef struct int32x2_t { int32_t s0;int32_t s1; } int32x2_t;
/*@ Extern Coq (UndefStructPredint32x2_t : Z -> Assertion) */
typedef struct int32x4_t { int32_t s0;int32_t s1;int32_t s2;int32_t s3; } int32x4_t;
/*@ Extern Coq (UndefStructPredint32x4_t : Z -> Assertion) */
typedef struct vint8m2_t { int8_t s0;int8_t s1;int8_t s2;int8_t s3;int8_t s4;int8_t s5;int8_t s6;int8_t s7;int8_t s8;int8_t s9;int8_t s10;int8_t s11;int8_t s12;int8_t s13;int8_t s14;int8_t s15;int8_t s16;int8_t s17;int8_t s18;int8_t s19;int8_t s20;int8_t s21;int8_t s22;int8_t s23;int8_t s24;int8_t s25;int8_t s26;int8_t s27;int8_t s28;int8_t s29;int8_t s30;int8_t s31; } vint8m2_t;
/*@ Extern Coq (UndefStructPredvint8m2_t : Z -> Assertion) */
typedef struct vint16m4_t { int16_t s0;int16_t s1;int16_t s2;int16_t s3;int16_t s4;int16_t s5;int16_t s6;int16_t s7;int16_t s8;int16_t s9;int16_t s10;int16_t s11;int16_t s12;int16_t s13;int16_t s14;int16_t s15;int16_t s16;int16_t s17;int16_t s18;int16_t s19;int16_t s20;int16_t s21;int16_t s22;int16_t s23;int16_t s24;int16_t s25;int16_t s26;int16_t s27;int16_t s28;int16_t s29;int16_t s30;int16_t s31; } vint16m4_t;
/*@ Extern Coq (UndefStructPredvint16m4_t : Z -> Assertion) */
typedef struct vint32m8_t { int32_t s0;int32_t s1;int32_t s2;int32_t s3;int32_t s4;int32_t s5;int32_t s6;int32_t s7;int32_t s8;int32_t s9;int32_t s10;int32_t s11;int32_t s12;int32_t s13;int32_t s14;int32_t s15;int32_t s16;int32_t s17;int32_t s18;int32_t s19;int32_t s20;int32_t s21;int32_t s22;int32_t s23;int32_t s24;int32_t s25;int32_t s26;int32_t s27;int32_t s28;int32_t s29;int32_t s30;int32_t s31; } vint32m8_t;
/*@ Extern Coq (UndefStructPredvint32m8_t : Z -> Assertion) */
struct xnn_qs8_rsum_params { char _; };
#endif
