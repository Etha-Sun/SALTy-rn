#ifndef DWCONV_TYPES_H
#define DWCONV_TYPES_H
#ifndef DWCONV_NATIVE
typedef unsigned long long size_t;
typedef unsigned long long uintptr_t;
typedef long long intptr_t;
#endif
#ifndef NULL
#define NULL ((void*)0)
#endif
#define XNN_OOB_READS
#define XNN_UNPREDICTABLE(x) (x)
#define XNN_UNLIKELY(x) (x)
struct scalar_bounds {float min;float max;};
struct xnn_f32_minmax_params {struct scalar_bounds scalar;};
typedef struct float32x4_t {float s0; float s1; float s2; float s3;} float32x4_t;
typedef struct float32x2_t {float s0; float s1;} float32x2_t;
typedef struct vfloat32m4_t {float s0; float s1; float s2; float s3; float s4; float s5; float s6; float s7; float s8; float s9; float s10; float s11; float s12; float s13; float s14; float s15;} vfloat32m4_t;
typedef struct vbool8_t {int s0; int s1; int s2; int s3; int s4; int s5; int s6; int s7; int s8; int s9; int s10; int s11; int s12; int s13; int s14; int s15;} vbool8_t;
#endif
