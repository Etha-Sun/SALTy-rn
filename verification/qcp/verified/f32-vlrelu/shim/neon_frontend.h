#include "neon_base.h"
#include "neon_primitives.h"
#include "model_def.h"
/*@ include strategies "neon_vlrelu.strategies" */
#define NULL ((void*)0)
#define XNN_OOB_READS
#define XNN_UNLIKELY(x) (x)
#define assert(x) qcp_assert(x)
