#ifndef U8_SHARED_SHIM_H
#define U8_SHARED_SHIM_H
#include <stdint.h>
#include <stddef.h>
#include <assert.h>
#include <limits.h>
_Static_assert(sizeof(size_t)==8 && sizeof(int)==4, "LP64 required");
#define XNN_OOB_READS
#define XNN_UNLIKELY(x) (x)
#define RVV_CAP 32
#define RVV_M1_CAP 4
#define RVV_I8M8_CAP 128
struct xnn_u8_minmax_params { struct { uint32_t min,max; } scalar; };
typedef struct { uint8_t lane[16]; } uint8x16_t;
typedef struct { uint8_t lane[8]; } uint8x8_t;
typedef struct { uint8_t lane[RVV_I8M8_CAP]; } vuint8m8_t;
typedef struct { uint8_t byte[8]; } uint16x4_t;
typedef struct { uint8_t byte[8]; } uint32x2_t;
#include "base.h"
#include "clamp.h"
#endif
