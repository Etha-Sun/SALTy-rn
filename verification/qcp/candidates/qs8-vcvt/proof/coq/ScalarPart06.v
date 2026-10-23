From Qs8I8Cvt Require Import ScalarAutomation.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedScalarPart06.
Lemma proof_of_qcp_qcv_asr15_safety_wit_6 : Qs8I8Cvt.scalar_goal.qcp_qcv_asr15_safety_wit_6.
Proof.
unfold Qs8I8Cvt.scalar_goal.qcp_qcv_asr15_safety_wit_6.
try left; intros.
entailer!; qcv_finish.
Qed.

Lemma proof_of_qcp_qcv_asr16_return_wit_2 : Qs8I8Cvt.scalar_goal.qcp_qcv_asr16_return_wit_2.
Proof.
unfold Qs8I8Cvt.scalar_goal.qcp_qcv_asr16_return_wit_2.
try left; intros.
pose proof(qcv_asr16_bounds x_pre ltac:(lia));rewrite qcv_asr16_div in *;repeat rewrite Z.quot_div_nonneg by lia;try rewrite qcv_floor_negative by lia.
entailer!; qcv_finish.
Qed.

Lemma proof_of_qcp_qcv_sat8_return_wit_1 : Qs8I8Cvt.scalar_goal.qcp_qcv_sat8_return_wit_1.
Proof.
unfold Qs8I8Cvt.scalar_goal.qcp_qcv_sat8_return_wit_1.
try left; intros.
unfold qcv_sat8;repeat match goal with |-context[Z.ltb ?a ?b]=>destruct(Z.ltb_spec a b) end;
entailer!; qcv_finish.
Qed.

Lemma proof_of_qcp_qcv_neon_qrdmulh_return_wit_1 : Qs8I8Cvt.scalar_goal.qcp_qcv_neon_qrdmulh_return_wit_1.
Proof.
unfold Qs8I8Cvt.scalar_goal.qcp_qcv_neon_qrdmulh_return_wit_1.
try left; intros.
pose proof (qcv_product16_bounds a_pre b_pre ltac:(lia) ltac:(lia)).
unfold qcv_neon_qrdmulh,qcv_asr16 in *;replace (2*a_pre*b_pre+32768) with (2*(a_pre*b_pre)+32768) by ring.
entailer!; qcv_finish.
Qed.

Lemma proof_of_qcp_qcv_neon_add_partial_solve_wit_1_pure : Qs8I8Cvt.scalar_goal.qcp_qcv_neon_add_partial_solve_wit_1_pure.
Proof.
unfold Qs8I8Cvt.scalar_goal.qcp_qcv_neon_add_partial_solve_wit_1_pure.
try left; intros.
entailer!; qcv_finish.
Qed.

End CheckedScalarPart06.
