#ifndef ARGMAXPOOL_PROGRAM_MODEL_H
#define ARGMAXPOOL_PROGRAM_MODEL_H
#include "formal_types.h"
#include "read_table.h"
/*@ Import Coq Require Import ArgmaxPool.APKernelModel */
/*@ Extern Coq (APProgram :: *) (APOutput :: *) (APIndex :: *) */
/*@ Extern Coq
 (app_arguments:APProgram->Z->Z->Z->Z->Z->Z->Z->Z->Z->Z->Z->Prop)
 (app_valid:APMap->APPtrMap->list Z->list Z->APProgram->Prop)
 (ap_output:list Z->APOutput->Assertion) (ap_index:list Z->APIndex->Assertion)
 (app_neon_output:APMap->APPtrMap->APProgram->APOutput->APIndex->APOutput)
 (app_neon_index:APMap->APPtrMap->APProgram->APOutput->APIndex->APIndex)
 (app_rvv_output:APMap->APPtrMap->APProgram->APOutput->APIndex->APOutput)
 (app_rvv_index:APMap->APPtrMap->APProgram->APOutput->APIndex->APIndex)
 */
#endif
