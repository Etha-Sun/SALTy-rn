From Qs8I8Cvt Require Import ScalarAutomation.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedScalarPart01.
Lemma proof_of_qcp_qcv_asr15_safety_wit_1 : Qs8I8Cvt.scalar_goal.qcp_qcv_asr15_safety_wit_1.
Proof.
unfold Qs8I8Cvt.scalar_goal.qcp_qcv_asr15_safety_wit_1.
try left; intros.
entailer!; qcv_finish.
Qed.

Lemma proof_of_qcp_qcv_asr16_safety_wit_6 : Qs8I8Cvt.scalar_goal.qcp_qcv_asr16_safety_wit_6.
Proof.
unfold Qs8I8Cvt.scalar_goal.qcp_qcv_asr16_safety_wit_6.
try left; intros.
entailer!; qcv_finish.
Qed.

Lemma proof_of_qcp_qcv_sat8_safety_wit_2 : Qs8I8Cvt.scalar_goal.qcp_qcv_sat8_safety_wit_2.
Proof.
unfold Qs8I8Cvt.scalar_goal.qcp_qcv_sat8_safety_wit_2.
try left; intros.
entailer!; qcv_finish.
Qed.

Lemma proof_of_qcp_qcv_neon_qrdmulh_safety_wit_1 : Qs8I8Cvt.scalar_goal.qcp_qcv_neon_qrdmulh_safety_wit_1.
Proof.
unfold Qs8I8Cvt.scalar_goal.qcp_qcv_neon_qrdmulh_safety_wit_1.
try left; intros.
pose proof (qcv_product16_bounds a_pre b_pre ltac:(lia) ltac:(lia)).
entailer!; qcv_finish.
Qed.

Lemma proof_of_qcp_qcv_rvv_clip15_partial_solve_wit_1 : Qs8I8Cvt.scalar_goal.qcp_qcv_rvv_clip15_partial_solve_wit_1.
Proof.
unfold Qs8I8Cvt.scalar_goal.qcp_qcv_rvv_clip15_partial_solve_wit_1.
unfold Qs8I8Cvt.scalar_goal.qcp_qcv_rvv_clip15_partial_solve_wit_1_aux.
try left; intros.
entailer!; qcv_finish.
Qed.

End CheckedScalarPart01.
