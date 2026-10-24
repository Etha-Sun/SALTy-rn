#ifndef QCP_F32F16_PROGRAM_MODEL_H
#define QCP_F32F16_PROGRAM_MODEL_H
#include "types_def.h"
#include "ushort_array_def.h"
#include "../../../shared/c-shim/f32/QcpVadd/float_array_def.h"
#include "../../../shared/c-shim/f32/QcpNeonLoop/invariant_def.h"
#include "../../../shared/c-shim/f32/QcpNeonLoop/tail_def.h"
#include "../../../shared/c-shim/f32/QcpRvv32/rvv_array_def.h"
#include "../../../shared/c-shim/f32/QcpRvv32/rvv_store_def.h"
#include "../../../shared/c-shim/f32/QcpRvv32/rvv_loop_def.h"
/*@ Import Coq Require Import F32F16.ProgramModel */
/*@ Extern Coq (f16_values : Z -> list fp32 -> list Z)
 (f16_rvv_values : Z -> list fp32 -> list Z) */
#endif
