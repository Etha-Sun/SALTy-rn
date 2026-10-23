#include "memory_neon.h"
#include "vector_primitives.h"
#include "program_model.h"
#include "../../../shared/c-shim/f32/QcpNeonLoop/invariant_def.h"
#include "../../../shared/c-shim/f32/QcpVadd/float_array_def.h"
#include "../../../shared/c-shim/f32/QcpNeonLoop/tail_def.h"
/*@ include strategies "neon_bridge.strategies" */
/*@ include strategies "neon_tail.strategies" */
/*@ include strategies "float_array.strategies" */
