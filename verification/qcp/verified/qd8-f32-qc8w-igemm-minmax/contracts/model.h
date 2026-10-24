#ifndef QCP_QD8_FULL_MODEL_H
#define QCP_QD8_FULL_MODEL_H
#include "../shim/types.h"
#include "../shim/semantic-models.h"
/*@ Import Coq Require Import Qd8Public.CandidateLogic */
/*@ Extern Coq (panel_data :: *) */
/*@ Extern Coq
 (domain_shape : Z -> Z -> Z -> list panel_data -> Prop)
 (data_capacity : Z -> Z -> Z -> Z -> Z -> Prop)
 (a_read_extent : Z -> Z)
 (packed_matrix : Z -> Z -> list panel_data -> Assertion)
 (qd8_output_ref : Z -> Z -> Z -> Z -> list Z -> list panel_data -> fp32 -> fp32 -> fp32 -> Assertion)
 (qd8_same_value : fp32 -> fp32 -> Prop)
 (qd8_outputs_related : list fp32 -> list fp32 -> Prop)
 (qd8_bit_same : fp32 -> fp32 -> Prop)
 (CharArray::full : Z -> Z -> list Z -> Assertion)
 (FloatArray::full : Z -> Z -> list fp32 -> Assertion)
 (FloatArray::undef_full : Z -> Z -> Assertion) */
#endif

/*@ Import Coq Require Import Qd8IGemm.IGemmModel */
/*@ Extern Coq (input_block :: *) (input_reference :: *) */
/*@ Extern Coq
 (igemm_shape:Z -> Z -> Z -> Z -> list Z -> list input_reference -> list input_block -> Z -> Z -> Z -> list panel_data -> Prop)
 (igemm_capacity:Z -> Z -> Z -> Z -> Z -> list input_block -> list input_reference -> Prop)
 (input_pool:list input_block -> Assertion)
 (total_depth:Z -> list input_reference -> Z)
 (flat_inputs:list input_block -> list input_reference -> Z -> list Z)
 (PtrArray::full:Z -> Z -> list Z -> Assertion) */

/*@ Import Coq Require Import Qd8Indirect.IndirectionModel */
/*@ Extern Coq
 (input_mapping:Z -> Z -> Z -> Z -> list Z -> list input_reference -> list input_block -> Prop)
 (input_window:list input_block -> list input_reference -> Z -> Z -> list Z)
 (input_address:list input_block -> list input_reference -> Z -> Z)
 (input_window_frame:list input_block -> list input_reference -> Z -> Z -> Assertion)
 (selected_address:Z -> Z -> Z -> Z -> Z)
 (PtrArray::missing_i:Z -> Z -> Z -> Z -> list Z -> Assertion)
 (CharArray::missing_i:Z -> Z -> Z -> Z -> list Z -> Assertion) */
