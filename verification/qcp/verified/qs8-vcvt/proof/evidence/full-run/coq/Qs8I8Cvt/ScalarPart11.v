From Qs8I8Cvt Require Import ScalarAutomation.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedScalarPart11.
Lemma proof_of_qcp_qcv_asr15_return_wit_2 : Qs8I8Cvt.scalar_goal.qcp_qcv_asr15_return_wit_2.
Proof.
unfold Qs8I8Cvt.scalar_goal.qcp_qcv_asr15_return_wit_2.
try left; intros.
pose proof(qcv_asr15_bounds x_pre ltac:(lia));rewrite qcv_asr15_div in *;repeat rewrite Z.quot_div_nonneg by lia;try rewrite qcv_floor_negative by lia.
entailer!; qcv_finish.
Qed.

Lemma proof_of_qcp_qcv_sat16_safety_wit_5 : Qs8I8Cvt.scalar_goal.qcp_qcv_sat16_safety_wit_5.
Proof.
unfold Qs8I8Cvt.scalar_goal.qcp_qcv_sat16_safety_wit_5.
try left; intros.
entailer!; qcv_finish.
Qed.

Lemma proof_of_qcp_qcv_subw_return_wit_1 : Qs8I8Cvt.scalar_goal.qcp_qcv_subw_return_wit_1.
Proof.
unfold Qs8I8Cvt.scalar_goal.qcp_qcv_subw_return_wit_1.
try left; intros.
unfold qcv_subw.
entailer!; qcv_finish.
Qed.

Lemma proof_of_qcp_qcv_rvv_mul_safety_wit_1 : Qs8I8Cvt.scalar_goal.qcp_qcv_rvv_mul_safety_wit_1.
Proof.
unfold Qs8I8Cvt.scalar_goal.qcp_qcv_rvv_mul_safety_wit_1.
try left; intros.
pose proof (qcv_product16_bounds a_pre b_pre ltac:(lia) ltac:(lia)).
entailer!; qcv_finish.
Qed.

Lemma proof_of_qcp_qcv_rvv_add_partial_solve_wit_1 : Qs8I8Cvt.scalar_goal.qcp_qcv_rvv_add_partial_solve_wit_1.
Proof.
unfold Qs8I8Cvt.scalar_goal.qcp_qcv_rvv_add_partial_solve_wit_1.
unfold Qs8I8Cvt.scalar_goal.qcp_qcv_rvv_add_partial_solve_wit_1_aux.
try left; intros.
entailer!; qcv_finish.
Qed.

End CheckedScalarPart11.
