#ifndef QCP_RNDNE_PROGRAM_MODEL_H
#define QCP_RNDNE_PROGRAM_MODEL_H
#include "types_def.h"
#include "../../../shared/c-shim/f32/QcpVadd/float_array_def.h"
#include "../../../shared/c-shim/f32/QcpNeonLoop/invariant_def.h"
#include "../../../shared/c-shim/f32/QcpNeonLoop/tail_def.h"
#include "../../../shared/c-shim/f32/QcpRvv32/rvv_array_def.h"
#include "../../../shared/c-shim/f32/QcpRvv32/rvv_store_def.h"
#include "../../../shared/c-shim/f32/QcpRvv32/rvv_loop_def.h"
/*@ Import Coq Require Import Rndne.ProgramModel */
/*@ Extern Coq (rndne_values : Z -> list fp32 -> list fp32)
 (rndne_rvv_values : Z -> list fp32 -> list fp32) */
/*@ include strategies "float_array.strategies" */
/*@ include strategies "neon_bridge.strategies" */
/*@ include strategies "neon_tail.strategies" */
/*@ include strategies "rvv_arrays.strategies" */
/*@ include strategies "rvv_store.strategies" */
/*@ include strategies "rvv_loop.strategies" */
/*@ include strategies "rndne_memory.strategies" */
#endif
