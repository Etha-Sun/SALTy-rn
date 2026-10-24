From Qs8Add Require Import ScalarAutomation.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma proof_of_qcp_qa_pow2_return_wit_1 : Qs8Add.scalar_goal.qcp_qa_pow2_return_wit_1.
Proof. unfold Qs8Add.scalar_goal.qcp_qa_pow2_return_wit_1;try left;intros;subst;pose proof(qa_pow_bounds31 d_pre ltac:(lia));pose proof(qa_pow2_unsigned32 d_pre ltac:(lia))as HP;change(unsigned_last_nbits(Z.shiftl 1 d_pre)32=qa_pow2 d_pre)in HP;rewrite HP;qa_core. Qed.

Lemma proof_of_qcp_qa_sat16_safety_wit_6 : Qs8Add.scalar_goal.qcp_qa_sat16_safety_wit_6.
Proof. unfold Qs8Add.scalar_goal.qcp_qa_sat16_safety_wit_6;try left;intros;subst;qa_core. Qed.

Lemma proof_of_qcp_qa_neon_mul_partial_solve_wit_1 : Qs8Add.scalar_goal.qcp_qa_neon_mul_partial_solve_wit_1.
Proof. unfold Qs8Add.scalar_goal.qcp_qa_neon_mul_partial_solve_wit_1,Qs8Add.scalar_goal.qcp_qa_neon_mul_partial_solve_wit_1_aux;try left;intros;subst;pose proof(qa_mul_bound31 a_pre b_pre ltac:(lia)ltac:(lia));qa_core. Qed.

Lemma proof_of_qcp_qa_rvv_macc_partial_solve_wit_1 : Qs8Add.scalar_goal.qcp_qa_rvv_macc_partial_solve_wit_1.
Proof. unfold Qs8Add.scalar_goal.qcp_qa_rvv_macc_partial_solve_wit_1,Qs8Add.scalar_goal.qcp_qa_rvv_macc_partial_solve_wit_1_aux;try left;intros;subst;pose proof(qa_mul_bound31 b_pre c_pre ltac:(lia)ltac:(lia));qa_core. Qed.

Lemma proof_of_qcp_qa_neon_shift_partial_solve_wit_1_pure : Qs8Add.scalar_goal.qcp_qa_neon_shift_partial_solve_wit_1_pure.
Proof. unfold Qs8Add.scalar_goal.qcp_qa_neon_shift_partial_solve_wit_1_pure;try left;intros;subst;pose proof(qa_s8_range b_pre);qa_core. Qed.

Lemma proof_of_qcp_qa_rvv_rnu_partial_solve_wit_2_pure : Qs8Add.scalar_goal.qcp_qa_rvv_rnu_partial_solve_wit_2_pure.
Proof. unfold Qs8Add.scalar_goal.qcp_qa_rvv_rnu_partial_solve_wit_2_pure;try left;intros;subst;try qa_half;qa_core. Qed.

Lemma proof_of_qcp_qa_sub8_safety_wit_1 : Qs8Add.scalar_goal.qcp_qa_sub8_safety_wit_1.
Proof. unfold Qs8Add.scalar_goal.qcp_qa_sub8_safety_wit_1;try left;intros;subst;qa_core. Qed.
