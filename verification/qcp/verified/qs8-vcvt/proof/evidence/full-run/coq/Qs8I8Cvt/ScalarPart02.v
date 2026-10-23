From Qs8I8Cvt Require Import ScalarAutomation.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedScalarPart02.
Lemma proof_of_qcp_qcv_asr15_safety_wit_2 : Qs8I8Cvt.scalar_goal.qcp_qcv_asr15_safety_wit_2.
Proof.
unfold Qs8I8Cvt.scalar_goal.qcp_qcv_asr15_safety_wit_2.
try left; intros.
entailer!; qcv_finish.
Qed.

Lemma proof_of_qcp_qcv_asr16_safety_wit_7 : Qs8I8Cvt.scalar_goal.qcp_qcv_asr16_safety_wit_7.
Proof.
unfold Qs8I8Cvt.scalar_goal.qcp_qcv_asr16_safety_wit_7.
try left; intros.
entailer!; qcv_finish.
Qed.

Lemma proof_of_qcp_qcv_sat8_safety_wit_3 : Qs8I8Cvt.scalar_goal.qcp_qcv_sat8_safety_wit_3.
Proof.
unfold Qs8I8Cvt.scalar_goal.qcp_qcv_sat8_safety_wit_3.
try left; intros.
entailer!; qcv_finish.
Qed.

Lemma proof_of_qcp_qcv_neon_qrdmulh_safety_wit_2 : Qs8I8Cvt.scalar_goal.qcp_qcv_neon_qrdmulh_safety_wit_2.
Proof.
unfold Qs8I8Cvt.scalar_goal.qcp_qcv_neon_qrdmulh_safety_wit_2.
try left; intros.
pose proof (qcv_product16_bounds a_pre b_pre ltac:(lia) ltac:(lia)).
entailer!; qcv_finish.
Qed.

Lemma proof_of_qcp_qcv_rvv_clip15_partial_solve_wit_2_pure : Qs8I8Cvt.scalar_goal.qcp_qcv_rvv_clip15_partial_solve_wit_2_pure.
Proof.
unfold Qs8I8Cvt.scalar_goal.qcp_qcv_rvv_clip15_partial_solve_wit_2_pure.
try left; intros.
entailer!; qcv_finish.
Qed.

End CheckedScalarPart02.
