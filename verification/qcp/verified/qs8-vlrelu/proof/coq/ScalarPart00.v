From Qs8Lrelu Require Import ScalarAutomation.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedScalarPart00.
Lemma proof_of_qcp_qcv_narrow16_return_wit_1 : Qs8Lrelu.scalar_goal.qcp_qcv_narrow16_return_wit_1.
Proof.
unfold Qs8Lrelu.scalar_goal.qcp_qcv_narrow16_return_wit_1.
try left; intros.
pose proof(qcv_s16_range x_pre). unfold qcv_s16 in *.
entailer!; qcv_finish.
Qed.

Lemma proof_of_qcp_qcv_asr16_safety_wit_5 : Qs8Lrelu.scalar_goal.qcp_qcv_asr16_safety_wit_5.
Proof.
unfold Qs8Lrelu.scalar_goal.qcp_qcv_asr16_safety_wit_5.
try left; intros.
entailer!; qcv_finish.
Qed.

Lemma proof_of_qcp_qcv_sat8_safety_wit_1 : Qs8Lrelu.scalar_goal.qcp_qcv_sat8_safety_wit_1.
Proof.
unfold Qs8Lrelu.scalar_goal.qcp_qcv_sat8_safety_wit_1.
try left; intros.
entailer!; qcv_finish.
Qed.

Lemma proof_of_qcp_qcv_shl7_return_wit_1 : Qs8Lrelu.scalar_goal.qcp_qcv_shl7_return_wit_1.
Proof.
unfold Qs8Lrelu.scalar_goal.qcp_qcv_shl7_return_wit_1.
try left; intros.
rewrite qcv_shl7_unsigned;pose proof(qcv_s16_range(x_pre*128));unfold qcv_shl7,qcv_s16 in *.
entailer!; qcv_finish.
Qed.

Lemma proof_of_qcp_qcv_rvv_clip15_partial_solve_wit_1_pure : Qs8Lrelu.scalar_goal.qcp_qcv_rvv_clip15_partial_solve_wit_1_pure.
Proof.
unfold Qs8Lrelu.scalar_goal.qcp_qcv_rvv_clip15_partial_solve_wit_1_pure.
try left; intros.
entailer!; qcv_finish.
Qed.

End CheckedScalarPart00.
