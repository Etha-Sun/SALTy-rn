From Qs8Lrelu Require Import ScalarAutomation.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedScalarPart15.
Lemma proof_of_qcp_qcv_asr16_safety_wit_4 : Qs8Lrelu.scalar_goal.qcp_qcv_asr16_safety_wit_4.
Proof.
unfold Qs8Lrelu.scalar_goal.qcp_qcv_asr16_safety_wit_4.
try left; intros.
entailer!; qcv_finish.
Qed.

Lemma proof_of_qcp_qcv_sat16_return_wit_3 : Qs8Lrelu.scalar_goal.qcp_qcv_sat16_return_wit_3.
Proof.
unfold Qs8Lrelu.scalar_goal.qcp_qcv_sat16_return_wit_3.
try left; intros.
unfold qcv_sat16;repeat match goal with |-context[Z.ltb ?a ?b]=>destruct(Z.ltb_spec a b) end;
entailer!; qcv_finish.
Qed.

Lemma proof_of_qcp_qcv_shl7_safety_wit_2 : Qs8Lrelu.scalar_goal.qcp_qcv_shl7_safety_wit_2.
Proof.
unfold Qs8Lrelu.scalar_goal.qcp_qcv_shl7_safety_wit_2.
try left; intros.
entailer!; qcv_finish.
Qed.

Lemma proof_of_qcp_qcv_rvv_clip15_return_wit_1 : Qs8Lrelu.scalar_goal.qcp_qcv_rvv_clip15_return_wit_1.
Proof.
unfold Qs8Lrelu.scalar_goal.qcp_qcv_rvv_clip15_return_wit_1.
try left; intros.
unfold qcv_rvv_clip15;rewrite qcv_rvv_round;rewrite qcv_asr15_div in *.
entailer!; qcv_finish.
Qed.

End CheckedScalarPart15.
