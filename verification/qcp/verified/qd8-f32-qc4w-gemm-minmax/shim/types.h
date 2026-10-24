#ifndef QCP_QC4W_TYPES_H
#define QCP_QC4W_TYPES_H
typedef unsigned long long size_t;
typedef unsigned long long uintptr_t;
typedef signed char int8_t;
typedef unsigned char uint8_t;
typedef short int16_t;
typedef int int32_t;
typedef unsigned int uint32_t;
#define XNN_OOB_READS
#define XNN_LIKELY(x) (x)
#define XNN_UNLIKELY(x) (x)
#define XNN_ARCH_ARM64 1
#define NULL ((void*)0)
struct qc4_scalar_bounds {float min;float max;int32_t kernel_zero_point;};
struct xnn_f32_qc4w_minmax_params {struct qc4_scalar_bounds scalar;};
struct xnn_qd8_quantization_params {int32_t zero_point;float inv_scale;};
struct int8x8_t { int8_t s0,s1,s2,s3,s4,s5,s6,s7; };
typedef struct int8x8_t int8x8_t;
struct int16x8_t { int16_t s0,s1,s2,s3,s4,s5,s6,s7; };
typedef struct int16x8_t int16x8_t;
struct int16x4_t { int16_t s0,s1,s2,s3; };
typedef struct int16x4_t int16x4_t;
struct int32x4_t { int32_t s0,s1,s2,s3; };
typedef struct int32x4_t int32x4_t;
struct float32x4_t { float s0,s1,s2,s3; };
typedef struct float32x4_t float32x4_t;
struct float32x2_t { float s0,s1; };
typedef struct float32x2_t float32x2_t;
struct vint8m2_t { int8_t s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15; };
typedef struct vint8m2_t vint8m2_t;
struct vint16m4_t { int16_t s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15; };
typedef struct vint16m4_t vint16m4_t;
struct vint32m8_t { int32_t s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15; };
typedef struct vint32m8_t vint32m8_t;
struct vfloat32m8_t { float s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15; };
typedef struct vfloat32m8_t vfloat32m8_t;
struct vbool4_t { int s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15; };
typedef struct vbool4_t vbool4_t;
#endif
