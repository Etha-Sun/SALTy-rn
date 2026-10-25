#ifndef DWCHW_FORMAL_TYPES_H
#define DWCHW_FORMAL_TYPES_H
typedef signed char int8_t;
typedef unsigned char uint8_t;
typedef int int32_t;
typedef unsigned int uint32_t;
typedef unsigned long long size_t;
typedef unsigned long long uintptr_t;
typedef uint8_t vbool16_t;
#define NULL ((void*)0)
#define XNN_OOB_READS
#define XNN_UNPREDICTABLE(x) (x)
#define XNN_UNLIKELY(x) (x)
#define XNN_LIKELY(x) (x)
struct xnn_f32_minmax_params {struct {float min,max;}scalar;};
typedef struct float32x2_t {
 float s0;
 float s1;
} float32x2_t;
typedef struct float32x4_t {
 float s0;
 float s1;
 float s2;
 float s3;
} float32x4_t;
typedef struct uint32x4_t {
 uint32_t s0;
 uint32_t s1;
 uint32_t s2;
 uint32_t s3;
} uint32x4_t;
typedef struct vfloat32m2_t {
 float s0;
 float s1;
 float s2;
 float s3;
 float s4;
 float s5;
 float s6;
 float s7;
} vfloat32m2_t;
#endif
