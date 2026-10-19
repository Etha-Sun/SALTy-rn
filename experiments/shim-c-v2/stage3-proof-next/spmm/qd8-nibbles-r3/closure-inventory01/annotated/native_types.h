#ifndef COMPLEX_NATIVE_TYPES_H
#define COMPLEX_NATIVE_TYPES_H
#include <assert.h>
#include <stddef.h>
#include <stdint.h>
#include <math.h>
#include <float.h>
#include <limits.h>
_Static_assert(sizeof(size_t)==8 && sizeof(int)==4,"LP64 required");
_Static_assert(sizeof(float)==4 && FLT_RADIX==2 && FLT_MANT_DIG==24,"binary32 required");
#include <string.h>
#define XNN_UNPREDICTABLE(x) (x)
#define XNN_UNLIKELY(x) (x)
#define XNN_LIKELY(x) (x)
#define RVV_CAP 16
/* Mask capacity follows the corresponding f32m4 data vector. */
typedef struct { unsigned char lane[RVV_CAP]; } vbool8_t;
struct xnn_f32_minmax_params { struct { float min, max; } scalar; };
typedef struct { float lane[2]; } float32x2_t;
typedef struct { float lane[4]; } float32x4_t;
typedef struct { float lane[RVV_CAP]; } vfloat32m4_t;
/* Quiet NaN behavior is modeled; payload propagation and FP flags are not. */





























/* Native exploration library. New exact IEEE/bit/FMA bridges still need proof. */
#define XNN_OOB_READS
#define XNN_ARCH_ARM64 1
#define XNN_ALIGN(n) _Alignas(n)




typedef struct { float32x4_t val[2]; } float32x4x2_t;
typedef struct { float32x2_t val[2]; } float32x2x2_t;
typedef struct { uint32_t lane[4]; } uint32x4_t;
typedef struct { uint32_t lane[2]; } uint32x2_t;
typedef struct { int32_t lane[4]; } int32x4_t;


















































typedef struct { int32_t lane[16]; } vint32m4_t;



typedef struct { float lane[4]; } vfloat32m1_t;
typedef struct { unsigned char lane[4]; } vbool32_t;




















typedef struct { float lane[8]; } vfloat32m2_t;
typedef struct { unsigned char lane[8]; } vbool16_t;




















typedef struct { float lane[32]; } vfloat32m8_t;
typedef struct { unsigned char lane[32]; } vbool4_t;





















typedef struct { uint32_t lane[32]; } vuint32m8_t;




/* One legal reduction tree for unordered vfredusum; do not equate to all trees. */



typedef struct { uint32_t lane[4]; } vuint32m1_t;
typedef struct { int32_t lane[4]; } vint32m1_t;










struct xnn_qd8_quantization_params { int32_t zero_point;float inv_scale; };
struct xnn_f32_qc4w_minmax_params { struct { float min,max;int32_t kernel_zero_point; } scalar; };
typedef struct { int8_t lane[8]; } int8x8_t;
typedef struct { int16_t lane[8]; } int16x8_t;
typedef struct { int16_t lane[4]; } int16x4_t;
typedef struct { int8_t lane[32]; } vint8m2_t;
typedef struct { int16_t lane[32]; } vint16m4_t;
typedef struct { int32_t lane[32]; } vint32m8_t;


























#endif
