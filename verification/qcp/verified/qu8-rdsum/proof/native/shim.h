#ifndef RDSUM_NATIVE_ARRAY_SHIM_H
#define RDSUM_NATIVE_ARRAY_SHIM_H
#include <stdint.h>
#include <stddef.h>
#include <assert.h>
#include <limits.h>
#include <math.h>
#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#define XNN_OOB_READS
#define XNN_UNPREDICTABLE(x) (x)
#define XNN_LIKELY(x) (x)
#define min(a,b) ((a)<(b)?(a):(b))
#define doz(a,b) ((a)>(b)?(a)-(b):0)
typedef struct { int8_t lane[8]; } int8x8_t;
typedef struct { int8_t lane[16]; } int8x16_t;
typedef struct { int16_t lane[4]; } int16x4_t;
typedef struct { int16_t lane[8]; } int16x8_t;
typedef struct { int32_t lane[2]; } int32x2_t;
typedef struct { int32_t lane[4]; } int32x4_t;
typedef struct { int8_t lane[32]; } vint8m2_t;
typedef struct { int16_t lane[32]; } vint16m4_t;
typedef struct { int32_t lane[32]; } vint32m8_t;
typedef struct { uint8_t lane[8]; } uint8x8_t;
typedef struct { uint8_t lane[16]; } uint8x16_t;
typedef struct { uint16_t lane[4]; } uint16x4_t;
typedef struct { uint16_t lane[8]; } uint16x8_t;
typedef struct { uint32_t lane[2]; } uint32x2_t;
typedef struct { uint32_t lane[4]; } uint32x4_t;
typedef struct { uint8_t lane[32]; } vuint8m2_t;
typedef struct { uint16_t lane[32]; } vuint16m4_t;
typedef struct { uint32_t lane[32]; } vuint32m8_t;
struct xnn_qs8_rsum_params { char _; };
#endif
