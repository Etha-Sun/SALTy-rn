#ifndef RDSUM_FRONTEND_COMMON_H
#define RDSUM_FRONTEND_COMMON_H
#include "formal_types.h"
#include "control_model.h"
#include "vector_primitives.h"
#include "load_primitives.h"
#include "vl_model.h"
#include "output_vector.h"
#include "program_model.h"
#define assert(c) qcp_assert(c)
#define XNN_OOB_READS
#define XNN_UNPREDICTABLE(x) (x)
#define XNN_LIKELY(x) (x)
#define NULL 0
#define min(a,b) ((a)<(b)?(a):(b))
#define doz(a,b) ((a)>(b)?(a)-(b):0)
#endif
