From Qu8Add Require Import ScalarAutomation.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma proof_of_qcp_qu_floor_safety_wit_2 : Qu8Add.scalar_goal.qcp_qu_floor_safety_wit_2.
Proof. unfold Qu8Add.scalar_goal.qcp_qu_floor_safety_wit_2;try left;intros;subst;assert(0<=(-x_pre+p_pre-1)/p_pre)by(apply Z.div_pos;lia);qu_core. Qed.

Lemma proof_of_qcp_qu_sat16_return_wit_2 : Qu8Add.scalar_goal.qcp_qu_sat16_return_wit_2.
Proof. unfold Qu8Add.scalar_goal.qcp_qu_sat16_return_wit_2;try left;intros;subst;qu_core. Qed.

Lemma proof_of_qcp_qu_rvv_mul_return_wit_1 : Qu8Add.scalar_goal.qcp_qu_rvv_mul_return_wit_1.
Proof. unfold Qu8Add.scalar_goal.qcp_qu_rvv_mul_return_wit_1;try left;intros;subst;pose proof(qu_mul_bound31 a_pre b_pre ltac:(lia)ltac:(lia));qu_core. Qed.

Lemma proof_of_qcp_qu_neon_shift_safety_wit_2 : Qu8Add.scalar_goal.qcp_qu_neon_shift_safety_wit_2.
Proof. unfold Qu8Add.scalar_goal.qcp_qu_neon_shift_safety_wit_2;try left;intros;subst;pose proof(qu_s8_range b_pre);qu_core. Qed.

Lemma proof_of_qcp_qu_neon_shift_partial_solve_wit_2_pure : Qu8Add.scalar_goal.qcp_qu_neon_shift_partial_solve_wit_2_pure.
Proof. unfold Qu8Add.scalar_goal.qcp_qu_neon_shift_partial_solve_wit_2_pure;try left;intros;subst;pose proof(qu_s8_range b_pre);qu_core. Qed.

Lemma proof_of_qcp_qu_rvv_sll_safety_wit_1 : Qu8Add.scalar_goal.qcp_qu_rvv_sll_safety_wit_1.
Proof. unfold Qu8Add.scalar_goal.qcp_qu_rvv_sll_safety_wit_1;try left;intros;subst;qu_core. Qed.

Lemma proof_of_qcp_qu_sub8_partial_solve_wit_1_pure : Qu8Add.scalar_goal.qcp_qu_sub8_partial_solve_wit_1_pure.
Proof. unfold Qu8Add.scalar_goal.qcp_qu_sub8_partial_solve_wit_1_pure;try left;intros;subst;qu_core. Qed.
