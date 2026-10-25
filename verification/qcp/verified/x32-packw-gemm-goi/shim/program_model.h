#ifndef X32_PACKW_PROGRAM_MODEL_H
#define X32_PACKW_PROGRAM_MODEL_H
#include "scalar_memory.h"
/*@ Import Coq Require Import X32Packw.MainModel */
/*@ Extern Coq (PWCall :: *) */
/*@ Extern Coq (pw_program_storage:PWMap->list Z->PWCall->Prop) (pw_program:PWMap->PWCall->PWOutput->PWOutput) */
/*@ Extern Coq (pw_groups:PWCall->Z) (pw_channels:PWCall->Z) (pw_depth:PWCall->Z) (pw_extra_bytes:PWCall->Z) (pw_weights:PWCall->Z) (pw_bias:PWCall->Z) (pw_output_base:PWCall->Z) (pw_tiles:PWCall->Z) */
/*@ Extern Coq (pw_group_weight:PWCall->Z->Z) (pw_bias_at:PWCall->Z->Z->Z) (pw_tile_weight:PWCall->Z->Z->Z) (pw_tile_output:PWCall->Z->Z->Z) (pw_group_state:PWMap->PWCall->PWOutput->Z->PWOutput) (pw_tile_state:PWMap->PWCall->PWOutput->Z->Z->PWOutput) */
void pw_assert(int ok) /*@ Require ok!=0 && emp Ensure emp */;
#define assert(x) pw_assert(x)
#ifndef NULL
#define NULL ((void*)0)
#endif
#define XNN_LIKELY(x) (x)
#define XNN_UNLIKELY(x) (x)
#endif
