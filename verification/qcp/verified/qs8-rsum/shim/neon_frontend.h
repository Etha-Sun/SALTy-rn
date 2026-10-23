#include "vector_primitives.h"
#include "load.h"
#include "control.h"
#include "neon_program_model.h"
#define NULL 0
#define XNN_OOB_READS
#define XNN_ALIGN(x)
#define XNN_ARCH_ARM64 1
#define XNN_UNLIKELY(x) (x)
#define assert(c) qcp_assert(c)
