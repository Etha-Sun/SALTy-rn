#ifndef HWC_KERNEL_PROGRAM_H
#define HWC_KERNEL_PROGRAM_H
#include "kernel_types.h"
#include "rvv_views.h"
#include "read_api.h"
#include "support.h"
#include "assert_api.h"
/*@ include strategies "hc_maps.strategies" */
/*@ Import Coq Require Import HwcConv.KernelPointers HwcConv.RvvMaskBounds */
/*@ Extern Coq (hc_zero:fp32) (hc_mask_start:Z->Z->Z) (hc_mask_end:Z->Z->Z->Z->Z) */
/*@ Extern Coq (HwcRawPixels :: *) (HwcPixels :: *) */
/*@ Extern Coq
 (hc_input_domain:HwcROMap->Z->Z->Z->Z->Z->Z->Z->Z->Z->Z->Prop)
 (hc_output_layout:Z->Z->Z->Z->Z->Z->Z->Prop)
 (hc_output_owned:list Z->Z->Z->Z->Z->Z->Z->Z->Prop)
 (hc_row_base:Z->Z->Z->Z->Z->Z)
 (hc_addr64:Z->Z)
 (hc_store_row:Z->Z->Z->Z)
 (hc_store_channel:Z->Z->Z->Z)
 (hc_rows_pending:Z->Z->Z->Z->Z->Z->Z->Z->Z->Z->Z->Z->Prop)
 (hc_outer_input:Z->Z->Z->Z->Z->Z->Z->Z->Z->Z->Z->Prop)
 (hc_pending_outputs:Z->Z->Z->Z->Z->Z->Prop)
 (hc_channel_pending:Z->Z->Z->Z->Z->Z->Z->Z->Z->Z->Z->Z->Z->Z->Z->Prop)
 (hc_channel_output:Z->Z->Z->Z->Z->Z->Z->Z->Z->Z->Z->Z->Z->Z->Z->Prop)
 (hc_rvv_raw:HwcROMap->Z->Z->Z->Z->Z->Z->fp32->fp32->HwcRawPixels)
 (hc_visible:HwcRawPixels->Z->HwcPixels)
 (hc_progress:HwcPixels->HwcOutput->Z->Z->Z->Z->Z->Z->Z->Z->Z->Z->HwcOutput)
 (hc_final:HwcPixels->HwcOutput->Z->Z->Z->Z->Z->Z->Z->HwcOutput)
 (hc_acc_prefix:Recordvfloat32m1_t->HwcROMap->Z->Z->Z->Z->Z->Z->Z->Z->Z->Z->Z->Z->Prop)
 (hc_source_mask:Recordvbool32_t->Z->Z->Z->Z->Prop)
 (hc_source_input:Recordvfloat32m1_t->HwcROMap->Z->Z->Z->Z->Z->Z->Z->Z->Z->Z->Z->Prop)
 (make_record_vfloat32m1_t:fp32->fp32->fp32->fp32->Recordvfloat32m1_t)
 (make_record_vuint32m1_t:Z->Z->Z->Z->Recordvuint32m1_t)
 (make_record_vbool32_t:Z->Z->Z->Z->Recordvbool32_t)
 */
#endif
