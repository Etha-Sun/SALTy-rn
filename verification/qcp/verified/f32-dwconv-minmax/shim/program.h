#ifndef DWCONV_PROGRAM_H
#define DWCONV_PROGRAM_H
#include "types.h"
#include "intrinsics.h"
#include "maps.h"
#include "control.h"
/*@ Import Coq Require Import Dwconv.ProgramInterface */
/*@ Extern Coq (DwProgram :: *) */
/*@ Extern Coq
 (dw_channels:DwProgram->Z)
 (dw_width:DwProgram->Z)
 (dw_input:DwProgram->Z)
 (dw_weights:DwProgram->Z)
 (dw_out:DwProgram->Z)
 (dw_input_stride:DwProgram->Z)
 (dw_out_increment:DwProgram->Z)
 (dw_offset:DwProgram->Z)
 (dw_pixel_stride:DwProgram->Z)
 (dw_zero_ptr:DwProgram->Z)
 (dw_table:DwProgram->Z->Z)
 (dw_offset_at:DwProgram->Z->Z)
 (dw_output_at:DwProgram->Z->Z)
 (dw_aligned_cursor:Z->Z->Prop) (dw_word:Z->Z) (dw_take:Z->Z)
 (dw_valid:DwROMap->DwPtrMap->list Z->DwProgram->Prop)
 (dw_input_row:DwPtrMap->DwProgram->Z->Z->Z)
 (dw_neon_progress:DwROMap->DwPtrMap->DwProgram->Z->Z->fp32->fp32->DwOutput->DwOutput)
 (dw_neon_result:DwROMap->DwPtrMap->DwProgram->fp32->fp32->DwOutput->DwOutput)
 (dw_rvv_progress:DwROMap->DwPtrMap->DwProgram->Z->Z->fp32->fp32->DwOutput->DwOutput)
 (dw_rvv_result:DwROMap->DwPtrMap->DwProgram->fp32->fp32->DwOutput->DwOutput)
 */
#endif
