#ifndef SHARED_SHIM_H
#define SHARED_SHIM_H
#include <stdint.h>
#include <stddef.h>
#include <assert.h>
#include <limits.h>
#include <float.h>

/* One fixed environment for all cases: LP64, little endian, VLEN=128. */
_Static_assert(sizeof(size_t)==8 && sizeof(int)==4, "LP64 required");
_Static_assert(sizeof(float)==4 && FLT_RADIX==2 && FLT_MANT_DIG==24,
               "binary32 required");
#define XNN_OOB_READS
#define XNN_UNLIKELY(x) (x)
#define XNN_ALIGN(n) _Alignas(n)
#define XNN_ARCH_ARM64 1
#define RVV_CAP 32
#define RVV_M1_CAP 4
#define RVV_I8M8_CAP 128
struct xnn_qs8_rsum_params { char unused; };
struct xnn_s8_minmax_params { struct { int32_t min, max; } scalar; };
struct xnn_f32_default_params { char unused; };
typedef struct { uint8_t lane[16]; } uint8x16_t;
typedef struct { uint16_t lane[8]; } uint16x8_t;
typedef struct { uint32_t lane[4]; } uint32x4_t;
typedef struct { uint8_t lane[RVV_CAP]; } vuint8m2_t;
typedef struct { uint32_t lane[RVV_CAP]; } vuint32m8_t;
typedef struct { uint32_t lane[RVV_M1_CAP]; } vuint32m1_t;
typedef struct { int8_t lane[16]; } int8x16_t;
typedef struct { int8_t lane[8]; } int8x8_t;
typedef struct { int8_t lane[RVV_I8M8_CAP]; } vint8m8_t;
/* Raw bytes suffice for reinterpret + lane store; no scalar arithmetic API. */
typedef struct { int8_t byte[8]; } uint16x4_t;
typedef struct { int8_t byte[8]; } uint32x2_t;
typedef struct { float lane[4]; } float32x4_t;
typedef struct { float lane[2]; } float32x2_t;
typedef struct { float lane[RVV_CAP]; } vfloat32m8_t;
#include "base.h"
#include "rsum.h"
#include "clamp.h"
#include "float_ops.h"
#endif
