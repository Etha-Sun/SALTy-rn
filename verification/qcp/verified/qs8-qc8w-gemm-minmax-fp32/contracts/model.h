#ifndef QS8_MODEL_H
#define QS8_MODEL_H
#include "../shim/types.h"
/*@ Import Coq Require Import Qs8Gemm.Model Qs8Gemm.Layouts */
/*@ Extern Coq (panel_data :: *) */
/*@ Extern Coq

 (domain_shape:Z -> Z -> Z -> list panel_data -> Prop)
 (data_capacity:Z -> Z -> Z -> Z -> Z -> Prop)
 (packed_matrix:Z -> Z -> list panel_data -> Assertion)
 (a_read_extent:Z -> Z)
 (panel_bytes:Z -> Z)
 (panels:Z -> Z)
 (weights:panel_data -> list Z)
 (panel_at:list panel_data -> Z -> panel_data)
 (qs8_matrix_wf:Z -> list panel_data -> Prop)
 (qs8_bias:Z -> Z -> list panel_data -> Z)
 (qs8_scale:Z -> Z -> list panel_data -> fp32)
 (qs8_char:Z -> Z -> Z -> Z -> list Z -> list panel_data -> Z)
 (qs8_i8_address_ok:Z -> Z -> Z -> Z -> Z -> Z -> Z -> list panel_data -> Prop)
 (qs8_zget:Z -> list Z -> Z)
 (qs8_acc:Z -> Z -> Z -> list Z -> list panel_data -> Z)
 (qs8_output_prefix:Z -> Z -> Z -> Z -> list Z -> list panel_data -> fp32 -> Z -> Z -> Z -> Assertion)
 (qs8_output_ref:Z -> Z -> Z -> list Z -> list panel_data -> fp32 -> Z -> Z -> Z -> Assertion)
 (completed_values:Z -> Z -> list Z -> list panel_data -> fp32 -> Z -> Z -> Z -> list Z)
 (qs8_write_state:Z -> Z -> Z -> list Z -> Assertion)
 (qs8_append:list Z -> list Z -> list Z)
 (qs8_take:Z -> list Z -> list Z)
 (qs8_mac:Z -> Z -> Z -> Z)
 (qs8_lane4:Z -> Z -> Z -> Z -> Z -> Z)
 (qs8_ssub32:Z -> Z -> Z)
 (qs8_narrow16:Z -> Z)
 (qs8_narrow8:Z -> Z)
 (qs8_reinterpret:fp32 -> Z)
 (qs8_uninterpret:Z -> fp32)
 (qs8_or32:Z -> Z -> Z)
 (qs8_and32:Z -> Z -> Z)
 (qs8_merge:Z -> Z -> Z -> Z)
 (qs8_mask_and:Z -> Z -> Z)
 (qs8_gt:Z -> Z -> Z)
 (qs8_eq:Z -> Z -> Z)
 (qs8_nan:fp32 -> Z)
 (qs8_ext:Z -> Z -> list Z -> Z)
 (qs8_active_z:Z -> Z -> Z -> Z -> Prop)
 (qs8_active_f:Z -> Z -> fp32 -> fp32 -> Prop)
 (qs8_final:Z -> Z -> list Z -> list panel_data -> fp32 -> Z -> Z -> Z -> Z)
 (fp32_of_Z:Z -> fp32)
 (f16_arm_mul:fp32 -> fp32 -> fp32)
 (f16_arm_add:fp32 -> fp32 -> fp32)
 (f16_rvv_mul:fp32 -> fp32 -> fp32)
 (f16_rvv_add:fp32 -> fp32 -> fp32) */
/*@ Extern Coq (qs8_min:Z -> Z -> Z) (qs8_max:Z -> Z -> Z) */

/*@ Extern Coq (CharArray::full:Z -> Z -> list Z -> Assertion) (CharArray::undef_full:Z -> Z -> Assertion) (CharArray::missing_i:Z -> Z -> Z -> Z -> list Z -> Assertion) */

#endif
