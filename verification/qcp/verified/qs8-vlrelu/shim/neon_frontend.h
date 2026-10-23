#include "lrelu_vectors.h"
#define vmovq_n_s16(x) vdupq_n_s16(x)
#include "neon_api.h"
#include "program_model.h"
#include "control.h"
/*@ include strategies "s8_neon_memory.strategies" */
#include "neon_composed.h"
