#ifndef QCP_RUNTIME_SHIM_H
#define QCP_RUNTIME_SHIM_H
#include <assert.h>
#include <stddef.h>
#include <float.h>
_Static_assert(sizeof(size_t) == 8 && sizeof(float) == 4 && FLT_MANT_DIG == 24,
               "This initial runtime requires LP64 and binary32");
#define XNN_OOB_READS
#define XNN_UNLIKELY(x) (x)
#define RVV_CAP 32
struct xnn_f32_default_params { char unused; };
typedef struct { float lane[4]; } float32x4_t;
typedef struct { float lane[2]; } float32x2_t;
typedef struct { float lane[RVV_CAP]; } vfloat32m8_t;
size_t __riscv_vsetvl_e32m8(size_t n);
#include "float_ops.h"
#endif
