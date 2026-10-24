#ifndef QCP_QD8_FULL_TYPES_H
#define QCP_QD8_FULL_TYPES_H
typedef unsigned long long size_t;
typedef unsigned long long uintptr_t;
typedef signed char int8_t;
typedef short int16_t;
typedef int int32_t;
typedef unsigned int uint32_t;
#define XNN_OOB_READS
#define XNN_LIKELY(x) (x)
#define XNN_UNLIKELY(x) (x)
#define XNN_ARCH_ARM64 1
#define NULL ((void*)0)
struct qd8_scalar_bounds { float min; float max; };
struct xnn_f32_minmax_params { struct qd8_scalar_bounds scalar; };
struct xnn_qd8_quantization_params { int32_t zero_point; float inv_scale; };
/* Scalar fields are the candidate C representation, not an ISA ABI proof. */
struct int8x8_t { int8_t s0,s1,s2,s3,s4,s5,s6,s7; };
struct int16x8_t { int16_t s0,s1,s2,s3,s4,s5,s6,s7; };
struct int16x4_t { int16_t s0,s1,s2,s3; };
struct int32x4_t { int32_t s0,s1,s2,s3; };
struct float32x4_t { float s0,s1,s2,s3; };
struct float32x2_t { float s0,s1; };
struct vint8mf2_t { int8_t s0,s1,s2,s3,s4,s5,s6,s7; };
struct vint16m1_t { int16_t s0,s1,s2,s3,s4,s5,s6,s7; };
struct vint32m2_t { int32_t s0,s1,s2,s3,s4,s5,s6,s7; };
struct vfloat32m2_t { float s0,s1,s2,s3,s4,s5,s6,s7; };
struct vbool16_t { int s0,s1,s2,s3,s4,s5,s6,s7; };
typedef struct int8x8_t int8x8_t;
typedef struct int16x8_t int16x8_t;
typedef struct int16x4_t int16x4_t;
typedef struct int32x4_t int32x4_t;
typedef struct float32x4_t float32x4_t;
typedef struct float32x2_t float32x2_t;
typedef struct vint8mf2_t vint8mf2_t;
typedef struct vint16m1_t vint16m1_t;
typedef struct vint32m2_t vint32m2_t;
typedef struct vfloat32m2_t vfloat32m2_t;
typedef struct vbool16_t vbool16_t;
#endif

#ifndef UINTPTR_MAX
#define UINTPTR_MAX 18446744073709551615ULL
#endif
