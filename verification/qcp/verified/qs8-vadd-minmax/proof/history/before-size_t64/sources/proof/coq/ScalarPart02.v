From Qs8Add Require Import ScalarAutomation.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma proof_of_qcp_qa_s32_return_wit_1 : Qs8Add.scalar_goal.qcp_qa_s32_return_wit_1.
Proof. unfold Qs8Add.scalar_goal.qcp_qa_s32_return_wit_1;try left;intros;subst;pose proof(qa_s32_range x_pre);unfold qa_s32 in *;qa_core. Qed.

Lemma proof_of_qcp_qa_sat16_safety_wit_4 : Qs8Add.scalar_goal.qcp_qa_sat16_safety_wit_4.
Proof. unfold Qs8Add.scalar_goal.qcp_qa_sat16_safety_wit_4;try left;intros;subst;qa_core. Qed.

Lemma proof_of_qcp_qa_neon_mul_return_wit_1 : Qs8Add.scalar_goal.qcp_qa_neon_mul_return_wit_1.
Proof. unfold Qs8Add.scalar_goal.qcp_qa_neon_mul_return_wit_1;try left;intros;subst;pose proof(qa_mul_bound31 a_pre b_pre ltac:(lia)ltac:(lia));qa_core. Qed.

Lemma proof_of_qcp_qa_rvv_macc_return_wit_1 : Qs8Add.scalar_goal.qcp_qa_rvv_macc_return_wit_1.
Proof. unfold Qs8Add.scalar_goal.qcp_qa_rvv_macc_return_wit_1;try left;intros;subst;pose proof(qa_mul_bound31 b_pre c_pre ltac:(lia)ltac:(lia));qa_core. Qed.

Lemma proof_of_qcp_qa_neon_shift_return_wit_3 : Qs8Add.scalar_goal.qcp_qa_neon_shift_return_wit_3.
Proof. unfold Qs8Add.scalar_goal.qcp_qa_neon_shift_return_wit_3;try left;intros;subst;pose proof(qa_s8_range b_pre);qa_core. Qed.

Lemma proof_of_qcp_qa_rvv_rnu_partial_solve_wit_1_pure : Qs8Add.scalar_goal.qcp_qa_rvv_rnu_partial_solve_wit_1_pure.
Proof. unfold Qs8Add.scalar_goal.qcp_qa_rvv_rnu_partial_solve_wit_1_pure;try left;intros;subst;qa_core. Qed.

Lemma proof_of_qcp_qa_rvv_add16_partial_solve_wit_1_pure : Qs8Add.scalar_goal.qcp_qa_rvv_add16_partial_solve_wit_1_pure.
Proof. unfold Qs8Add.scalar_goal.qcp_qa_rvv_add16_partial_solve_wit_1_pure;try left;intros;subst;qa_core. Qed.
