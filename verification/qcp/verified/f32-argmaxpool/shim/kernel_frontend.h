#ifndef ARGMAXPOOL_KERNEL_FRONTEND_H
#define ARGMAXPOOL_KERNEL_FRONTEND_H
#include "program_model.h"
#include "kernel_control.h"
#include "rvv_specs.h"
/*@ Extern Coq
 (app_pixels:APProgram->Z) (app_rows:APProgram->Z) (app_channels:APProgram->Z)
 (app_input:APProgram->Z) (app_offset:APProgram->Z) (app_pixel_stride:APProgram->Z)
 (app_output_base:APProgram->Z) (app_index_base:APProgram->Z)
 (app_input_increment:APProgram->Z) (app_output_increment:APProgram->Z)
 (app_index_increment:APProgram->Z)
 (app_table:APProgram->Z->Z) (app_offset_at:APProgram->Z->Z)
 (app_output_at:APProgram->Z->Z) (app_index_at:APProgram->Z->Z)
 (app_groups:Z->Z) (app_remaining:Z->Z->Z) (app_group_cursor:APProgram->Z->Z)
 (app_consumed:Z->Z->Z) (app_index_base_at:Z->Z)
 (app_table_cursor:Z->Z->Z->Z) (app_output_cursor:Z->Z->Z)
 (app_previous_cursor:Z->Z->Z->Z) (app_read_cursor:Z->Z->Z->Z->Z)
 (app_row_pointer:APPtrMap->Z->Z->Z->Z->Z)
 (app_row_base:APPtrMap->Z->Z->Z->Z->Z->Z)
 (app_row_cursor:APPtrMap->Z->Z->Z->Z->Z->Z->Z)
 (app_rvv_partial_output:APMap->APPtrMap->APProgram->Z->Z->Z->APOutput->APIndex->APOutput)
 (app_rvv_partial_index:APMap->APPtrMap->APProgram->Z->Z->Z->APOutput->APIndex->APIndex)
 */
#endif
