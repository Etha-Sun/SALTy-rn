From Qs8Lrelu Require Import ScalarAutomation.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedScalarPart12.
Lemma proof_of_qcp_qcv_asr16_safety_wit_1 : Qs8Lrelu.scalar_goal.qcp_qcv_asr16_safety_wit_1.
Proof.
unfold Qs8Lrelu.scalar_goal.qcp_qcv_asr16_safety_wit_1.
try left; intros.
entailer!; qcv_finish.
Qed.

Lemma proof_of_qcp_qcv_sat16_safety_wit_6 : Qs8Lrelu.scalar_goal.qcp_qcv_sat16_safety_wit_6.
Proof.
unfold Qs8Lrelu.scalar_goal.qcp_qcv_sat16_safety_wit_6.
try left; intros.
entailer!; qcv_finish.
Qed.

Lemma proof_of_qcp_qcv_subw_partial_solve_wit_1_pure : Qs8Lrelu.scalar_goal.qcp_qcv_subw_partial_solve_wit_1_pure.
Proof.
unfold Qs8Lrelu.scalar_goal.qcp_qcv_subw_partial_solve_wit_1_pure.
try left; intros.
entailer!; qcv_finish.
Qed.

Lemma proof_of_qcp_qcv_rvv_mul_return_wit_1 : Qs8Lrelu.scalar_goal.qcp_qcv_rvv_mul_return_wit_1.
Proof.
unfold Qs8Lrelu.scalar_goal.qcp_qcv_rvv_mul_return_wit_1.
try left; intros.
pose proof (qcv_product16_bounds a_pre b_pre ltac:(lia) ltac:(lia)).
unfold qcv_rvv_mul.
entailer!; qcv_finish.
Qed.

End CheckedScalarPart12.
