#ifndef MAXPOOL_KERNEL_STATE_H
#define MAXPOOL_KERNEL_STATE_H
#include "kernel_contracts.h"
/*@ Import Coq Require Import MaxPool.KernelState MaxPool.KernelTail */
/*@ Extern Coq
 (mp_row_cursor:MPPtrMap->Z->Z->Z->Z->Z->Z->Z)
 (mp_row_pointer:MPPtrMap->Z->Z->Z->Z->Z)
 (mp_table_read_cursor:Z->Z->Z->Z->Z)
 (mp_output_cursor:Z->Z->Z)
 (mp_table_cursor:Z->Z->Z->Z)
 (mp_k_after:Z->Z->Z)
 (mp_extra_groups:Z->Z)
 (mp_pixel_before:MPFloatMap->MPPtrMap->MPOutput->Z->Z->Z->Z->Z->Z->Z->Z->Z->fp32->fp32->MPOutput)
 (mp_pass_complete:MPFloatMap->MPPtrMap->MPOutput->Z->Z->Z->Z->Z->Z->fp32->fp32->MPOutput)
 (mp_pass_partial:MPFloatMap->MPPtrMap->MPOutput->Z->Z->Z->Z->Z->Z->Z->fp32->fp32->MPOutput)
 (mp_table_at:Z->Z->Z->Z) (mp_offset_at:Z->Z->Z->Z) (mp_output_at:Z->Z->Z->Z) */
/*@ Extern Coq (mp_tail_two:Z->Z) (mp_tail_low:Z->fp32->fp32->fp32)
 (mp_output_equal:MPOutput->MPOutput->Prop)
 (mp_tail_values:MPFloatMap->MPPtrMap->Z->Z->Z->Z->Z->Z->fp32->fp32->fp32->fp32->fp32->fp32->Prop) */
#endif
