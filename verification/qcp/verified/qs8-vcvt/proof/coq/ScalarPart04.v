From Qs8I8Cvt Require Import ScalarAutomation.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedScalarPart04.
Lemma proof_of_qcp_qcv_asr15_safety_wit_4 : Qs8I8Cvt.scalar_goal.qcp_qcv_asr15_safety_wit_4.
Proof.
unfold Qs8I8Cvt.scalar_goal.qcp_qcv_asr15_safety_wit_4.
try left; intros.
entailer!; qcv_finish.
Qed.

Lemma proof_of_qcp_qcv_asr16_safety_wit_9 : Qs8I8Cvt.scalar_goal.qcp_qcv_asr16_safety_wit_9.
Proof.
unfold Qs8I8Cvt.scalar_goal.qcp_qcv_asr16_safety_wit_9.
try left; intros.
entailer!; qcv_finish.
Qed.

Lemma proof_of_qcp_qcv_sat8_safety_wit_5 : Qs8I8Cvt.scalar_goal.qcp_qcv_sat8_safety_wit_5.
Proof.
unfold Qs8I8Cvt.scalar_goal.qcp_qcv_sat8_safety_wit_5.
try left; intros.
entailer!; qcv_finish.
Qed.

Lemma proof_of_qcp_qcv_neon_qrdmulh_safety_wit_4 : Qs8I8Cvt.scalar_goal.qcp_qcv_neon_qrdmulh_safety_wit_4.
Proof.
unfold Qs8I8Cvt.scalar_goal.qcp_qcv_neon_qrdmulh_safety_wit_4.
try left; intros.
pose proof (qcv_product16_bounds a_pre b_pre ltac:(lia) ltac:(lia)).
entailer!; qcv_finish.
Qed.

Lemma proof_of_qcp_qcv_neon_add_safety_wit_1 : Qs8I8Cvt.scalar_goal.qcp_qcv_neon_add_safety_wit_1.
Proof.
unfold Qs8I8Cvt.scalar_goal.qcp_qcv_neon_add_safety_wit_1.
try left; intros.
entailer!; qcv_finish.
Qed.

End CheckedScalarPart04.
