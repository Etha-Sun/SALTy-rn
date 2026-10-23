From Qs8Lrelu Require Import ScalarAutomation.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedScalarPart10.
Lemma proof_of_qcp_qcv_asr15_return_wit_1 : Qs8Lrelu.scalar_goal.qcp_qcv_asr15_return_wit_1.
Proof.
unfold Qs8Lrelu.scalar_goal.qcp_qcv_asr15_return_wit_1.
try left; intros.
pose proof(qcv_asr15_bounds x_pre ltac:(lia));rewrite qcv_asr15_div in *;repeat rewrite Z.quot_div_nonneg by lia;try rewrite qcv_floor_negative by lia.
entailer!; qcv_finish.
Qed.

Lemma proof_of_qcp_qcv_sat16_safety_wit_4 : Qs8Lrelu.scalar_goal.qcp_qcv_sat16_safety_wit_4.
Proof.
unfold Qs8Lrelu.scalar_goal.qcp_qcv_sat16_safety_wit_4.
try left; intros.
entailer!; qcv_finish.
Qed.

Lemma proof_of_qcp_qcv_subw_safety_wit_1 : Qs8Lrelu.scalar_goal.qcp_qcv_subw_safety_wit_1.
Proof.
unfold Qs8Lrelu.scalar_goal.qcp_qcv_subw_safety_wit_1.
try left; intros.
entailer!; qcv_finish.
Qed.

Lemma proof_of_qcp_qcv_neon_qrdmulh_partial_solve_wit_2 : Qs8Lrelu.scalar_goal.qcp_qcv_neon_qrdmulh_partial_solve_wit_2.
Proof.
unfold Qs8Lrelu.scalar_goal.qcp_qcv_neon_qrdmulh_partial_solve_wit_2.
unfold Qs8Lrelu.scalar_goal.qcp_qcv_neon_qrdmulh_partial_solve_wit_2_aux.
try left; intros.
pose proof (qcv_product16_bounds a_pre b_pre ltac:(lia) ltac:(lia)).
entailer!; qcv_finish.
Qed.

Lemma proof_of_qcp_qcv_rvv_add_partial_solve_wit_1_pure : Qs8Lrelu.scalar_goal.qcp_qcv_rvv_add_partial_solve_wit_1_pure.
Proof.
unfold Qs8Lrelu.scalar_goal.qcp_qcv_rvv_add_partial_solve_wit_1_pure.
try left; intros.
entailer!; qcv_finish.
Qed.

End CheckedScalarPart10.
