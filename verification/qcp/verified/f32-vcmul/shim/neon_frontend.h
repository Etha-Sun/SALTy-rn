#include "neon_base.h"
#include "primitives.h"
#include "model_def.h"
/*@ include strategies "neon_vcmul.strategies" */
#define NULL ((void *)0)
#define XNN_OOB_READS
#define XNN_UNLIKELY(x) (x)
#define assert(x) qcp_assert(x)

#define vld1q_f32(p) qcp_vcmul_load4((p))
