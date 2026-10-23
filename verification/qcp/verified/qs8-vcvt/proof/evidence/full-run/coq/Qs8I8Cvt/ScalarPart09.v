From Qs8I8Cvt Require Import ScalarAutomation.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedScalarPart09.
Lemma proof_of_qcp_qcv_asr15_safety_wit_9 : Qs8I8Cvt.scalar_goal.qcp_qcv_asr15_safety_wit_9.
Proof.
unfold Qs8I8Cvt.scalar_goal.qcp_qcv_asr15_safety_wit_9.
try left; intros.
entailer!; qcv_finish.
Qed.

Lemma proof_of_qcp_qcv_sat16_safety_wit_3 : Qs8I8Cvt.scalar_goal.qcp_qcv_sat16_safety_wit_3.
Proof.
unfold Qs8I8Cvt.scalar_goal.qcp_qcv_sat16_safety_wit_3.
try left; intros.
entailer!; qcv_finish.
Qed.

Lemma proof_of_qcp_qcv_seed_return_wit_1 : Qs8I8Cvt.scalar_goal.qcp_qcv_seed_return_wit_1.
Proof.
unfold Qs8I8Cvt.scalar_goal.qcp_qcv_seed_return_wit_1.
try left; intros.
unfold qcv_seed;rewrite signed_unsigned_revolutive_less by lia;pose proof(qcv_s16_range (0-unsigned_last_nbits x_pre 32));unfold qcv_s16 in *.
entailer!; qcv_finish.
Qed.

Lemma proof_of_qcp_qcv_neon_qrdmulh_partial_solve_wit_2_pure : Qs8I8Cvt.scalar_goal.qcp_qcv_neon_qrdmulh_partial_solve_wit_2_pure.
Proof.
unfold Qs8I8Cvt.scalar_goal.qcp_qcv_neon_qrdmulh_partial_solve_wit_2_pure.
try left; intros.
pose proof (qcv_product16_bounds a_pre b_pre ltac:(lia) ltac:(lia)).
entailer!; qcv_finish.
Qed.

Lemma proof_of_qcp_qcv_rvv_add_return_wit_1 : Qs8I8Cvt.scalar_goal.qcp_qcv_rvv_add_return_wit_1.
Proof.
unfold Qs8I8Cvt.scalar_goal.qcp_qcv_rvv_add_return_wit_1.
try left; intros.
unfold qcv_rvv_add.
entailer!; qcv_finish.
Qed.

End CheckedScalarPart09.
