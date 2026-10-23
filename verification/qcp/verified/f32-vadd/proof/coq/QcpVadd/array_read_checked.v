Require Import Coq.ZArith.ZArith Coq.micromega.Psatz.
From QcpVadd Require Import VaddBits float_array_strategy_goal float_array_strategy_proof array_read_goal.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedArrayRead : array_read_goal.VC_Correct.
Include CheckedFloatArray.
Lemma proof_of_qcp_vadd_read_return_wit_1 : qcp_vadd_read_return_wit_1.
Proof.
  unfold qcp_vadd_read_return_wit_1; right; intros i_pre n_pre p_pre contents __default_fp32 Hpos Hnonneg Hlt.
  unfold StoreFloatAsElement.storeA.
  sep_apply_l_atomic
    (FloatArray.missing_i_merge_to_seg p_pre 0 i_pre n_pre
      (Znth i_pre contents __default_fp32) contents).
  - dump_pre_spatial. lia.
  - replace (i_pre - 0) with i_pre by lia.
    rewrite replace_Znth_Znth. cancel.
Qed.
Lemma proof_of_qcp_vadd_read_partial_solve_wit_1 : qcp_vadd_read_partial_solve_wit_1.
Proof.
  unfold qcp_vadd_read_partial_solve_wit_1; intros i_pre n_pre out_pre p_pre contents __default_fp32 Hpos Hnonneg Hlt.
  sep_apply_l_atomic (FloatArray.full_split_to_missing_i p_pre i_pre n_pre contents __default_fp32).
  - dump_pre_spatial. lia.
  - unfold StoreFloatAsElement.storeA. entailer!.
Qed.
End CheckedArrayRead.
Print Assumptions CheckedArrayRead.proof_of_qcp_vadd_read_return_wit_1.
Print Assumptions CheckedArrayRead.proof_of_qcp_vadd_read_partial_solve_wit_1.
