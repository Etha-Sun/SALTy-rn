#ifndef F32_IGEMM_TYPES_H
#define F32_IGEMM_TYPES_H
typedef unsigned long long size_t;
typedef unsigned long long uintptr_t;
#define NULL ((void*)0)
#define XNN_UNPREDICTABLE(x) (x)
#define XNN_UNLIKELY(x) (x)
#define XNN_LIKELY(x) (x)
#define assert(x) qcp_assert(x)
struct scalar_bounds {float min;float max;};
struct xnn_f32_minmax_params {struct scalar_bounds scalar;};
struct float32x4_t {float s0;float s1;float s2;float s3;};
struct float32x2_t {float s0;float s1;};
typedef struct float32x4_t float32x4_t;
typedef struct float32x2_t float32x2_t;
struct vfloat32m4_t {float s0;float s1;float s2;float s3;float s4;float s5;float s6;float s7;};
struct vbool8_t {int s0;int s1;int s2;int s3;int s4;int s5;int s6;int s7;};
typedef struct vfloat32m4_t vfloat32m4_t;
typedef struct vbool8_t vbool8_t;
#endif
