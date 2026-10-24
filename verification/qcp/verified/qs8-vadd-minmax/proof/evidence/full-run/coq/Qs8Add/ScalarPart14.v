From Qs8Add Require Import ScalarAutomation.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma proof_of_qcp_qa_floor_return_wit_2 : Qs8Add.scalar_goal.qcp_qa_floor_return_wit_2.
Proof. unfold Qs8Add.scalar_goal.qcp_qa_floor_return_wit_2;try left;intros;subst;qa_core. Qed.

Lemma proof_of_qcp_qa_sat8_return_wit_1 : Qs8Add.scalar_goal.qcp_qa_sat8_return_wit_1.
Proof. unfold Qs8Add.scalar_goal.qcp_qa_sat8_return_wit_1;try left;intros;subst;qa_core. Qed.

Lemma proof_of_qcp_qa_neon_mla_partial_solve_wit_2_pure : Qs8Add.scalar_goal.qcp_qa_neon_mla_partial_solve_wit_2_pure.
Proof. unfold Qs8Add.scalar_goal.qcp_qa_neon_mla_partial_solve_wit_2_pure;try left;intros;subst;pose proof(qa_mul_bound31 b_pre c_pre ltac:(lia)ltac:(lia));qa_core. Qed.

Lemma proof_of_qcp_qa_neon_shift_safety_wit_10 : Qs8Add.scalar_goal.qcp_qa_neon_shift_safety_wit_10.
Proof. unfold Qs8Add.scalar_goal.qcp_qa_neon_shift_safety_wit_10;try left;intros;subst;pose proof(qa_s8_range b_pre);qa_core. Qed.

Lemma proof_of_qcp_qa_rvv_rnu_safety_wit_1 : Qs8Add.scalar_goal.qcp_qa_rvv_rnu_safety_wit_1.
Proof. unfold Qs8Add.scalar_goal.qcp_qa_rvv_rnu_safety_wit_1;try left;intros;subst;try qa_half;qa_core. Qed.

Lemma proof_of_qcp_qa_neon_add16_partial_solve_wit_1_pure : Qs8Add.scalar_goal.qcp_qa_neon_add16_partial_solve_wit_1_pure.
Proof. unfold Qs8Add.scalar_goal.qcp_qa_neon_add16_partial_solve_wit_1_pure;try left;intros;subst;qa_core. Qed.
