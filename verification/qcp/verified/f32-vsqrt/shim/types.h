#ifndef QCP_SQRT_TYPES_H
#define QCP_SQRT_TYPES_H
#ifdef QCP_SQRT_NATIVE
#include <stddef.h>
#else
typedef unsigned long long size_t;
#endif
#ifndef NULL
#define NULL ((void*)0)
#endif
struct xnn_f32_default_params { char unused; };
typedef struct float32x4_t { float s0; float s1; float s2; float s3; } float32x4_t;
typedef struct float32x2_t { float s0; float s1; } float32x2_t;
typedef struct vfloat32m8_t { float s0; float s1; float s2; float s3; float s4; float s5; float s6; float s7; float s8; float s9; float s10; float s11; float s12; float s13; float s14; float s15; float s16; float s17; float s18; float s19; float s20; float s21; float s22; float s23; float s24; float s25; float s26; float s27; float s28; float s29; float s30; float s31; } vfloat32m8_t;
#endif
