#ifndef ARGMAXPOOL_NEON_KERNEL_FRONTEND_H
#define ARGMAXPOOL_NEON_KERNEL_FRONTEND_H
#include "kernel_frontend.h"
#include "neon_specs.h"
/*@ Import Coq Require Import ArgmaxPool.NeonKernelModel */
/*@ Extern Coq
 (app_neon_partial_output:APMap->APPtrMap->APProgram->Z->Z->Z->APOutput->APIndex->APOutput)
 (app_neon_partial_index:APMap->APPtrMap->APProgram->Z->Z->Z->APOutput->APIndex->APIndex)
 (UndefStructPreduint32x4_t:Z->Assertion)
 (app_previous_float_value:APMap->APPtrMap->APProgram->Z->Z->Z->fp32)
 (app_previous_index_value:APMap->APPtrMap->APProgram->Z->Z->Z->Z)
 */
#endif
