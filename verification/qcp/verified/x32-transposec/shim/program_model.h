#ifndef X32_PROGRAM_MODEL_H
#define X32_PROGRAM_MODEL_H
#include "formal_types.h"
/*@ Import Coq Require Import X32Transpose.ProgramModel */
/*@ Extern Coq (XTMap :: *) (XTOutput :: *) (XTLayout :: *) */
/*@ Extern Coq (unsigned_last_nbits:Z->Z->Z) */
/*@ Extern Coq (xt_valid:XTMap->list Z->XTLayout->Prop) (xt_data:XTMap->Assertion) (xt_output:list Z->XTOutput->Assertion) (xt_result:XTMap->XTLayout->XTOutput->XTOutput->Prop) (xt_progress:XTMap->XTLayout->XTOutput->XTOutput->Z->Z->Z->Prop) */
/*@ Extern Coq (xt_input:XTLayout->Z) (xt_output_base:XTLayout->Z) (xt_input_stride:XTLayout->Z) (xt_output_stride:XTLayout->Z) (xt_width:XTLayout->Z) (xt_height:XTLayout->Z) (xt_total:XTLayout->Z) (xt_current_input:XTLayout->Z->Z->Z) (xt_current_output:XTLayout->Z->Z->Z) */
void xt_assert(int ok) /*@ Require ok!=0 && emp Ensure emp */;
#define assert(e) xt_assert(e)
#define XNN_OOB_READS
#define XNN_UNPREDICTABLE(e) (e)
#endif
