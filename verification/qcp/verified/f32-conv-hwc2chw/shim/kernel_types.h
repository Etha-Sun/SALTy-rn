#ifndef HWC_KERNEL_TYPES_H
#define HWC_KERNEL_TYPES_H
#include "vector_types.h"
typedef unsigned int uint32_t;
typedef int int32_t;
struct xnn_f32_minmax_scalar {float min;float max;};
struct xnn_f32_minmax_params {struct xnn_f32_minmax_scalar scalar;};
#define restrict
#define XNN_OOB_READS
#define XNN_UNPREDICTABLE(x) (x)
#define XNN_UNLIKELY(x) (x)
#define XNN_LIKELY(x) (x)
#endif
