From Qs8Lrelu Require Import ScalarAutomation.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedScalarPart05.
Lemma proof_of_qcp_qcv_asr15_safety_wit_5 : Qs8Lrelu.scalar_goal.qcp_qcv_asr15_safety_wit_5.
Proof.
unfold Qs8Lrelu.scalar_goal.qcp_qcv_asr15_safety_wit_5.
try left; intros.
entailer!; qcv_finish.
Qed.

Lemma proof_of_qcp_qcv_asr16_return_wit_1 : Qs8Lrelu.scalar_goal.qcp_qcv_asr16_return_wit_1.
Proof.
unfold Qs8Lrelu.scalar_goal.qcp_qcv_asr16_return_wit_1.
try left; intros.
pose proof(qcv_asr16_bounds x_pre ltac:(lia));rewrite qcv_asr16_div in *;repeat rewrite Z.quot_div_nonneg by lia;try rewrite qcv_floor_negative by lia.
entailer!; qcv_finish.
Qed.

Lemma proof_of_qcp_qcv_sat8_safety_wit_6 : Qs8Lrelu.scalar_goal.qcp_qcv_sat8_safety_wit_6.
Proof.
unfold Qs8Lrelu.scalar_goal.qcp_qcv_sat8_safety_wit_6.
try left; intros.
entailer!; qcv_finish.
Qed.

Lemma proof_of_qcp_qcv_neon_qrdmulh_safety_wit_5 : Qs8Lrelu.scalar_goal.qcp_qcv_neon_qrdmulh_safety_wit_5.
Proof.
unfold Qs8Lrelu.scalar_goal.qcp_qcv_neon_qrdmulh_safety_wit_5.
try left; intros.
pose proof (qcv_product16_bounds a_pre b_pre ltac:(lia) ltac:(lia)).
entailer!; qcv_finish.
Qed.

Lemma proof_of_qcp_qcv_neon_add_return_wit_1 : Qs8Lrelu.scalar_goal.qcp_qcv_neon_add_return_wit_1.
Proof.
unfold Qs8Lrelu.scalar_goal.qcp_qcv_neon_add_return_wit_1.
try left; intros.
unfold qcv_neon_add.
entailer!; qcv_finish.
Qed.

End CheckedScalarPart05.
