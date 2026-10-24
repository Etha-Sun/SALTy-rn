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
