From Qu8Add Require Import ScalarAutomation.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma proof_of_qcp_qu_sat16_safety_wit_1 : Qu8Add.scalar_goal.qcp_qu_sat16_safety_wit_1.
Proof. unfold Qu8Add.scalar_goal.qcp_qu_sat16_safety_wit_1;try left;intros;subst;qu_core. Qed.

Lemma proof_of_qcp_qu_sat8_return_wit_2 : Qu8Add.scalar_goal.qcp_qu_sat8_return_wit_2.
Proof. unfold Qu8Add.scalar_goal.qcp_qu_sat8_return_wit_2;try left;intros;subst;qu_core. Qed.

Lemma proof_of_qcp_qu_neon_mla_partial_solve_wit_2 : Qu8Add.scalar_goal.qcp_qu_neon_mla_partial_solve_wit_2.
Proof. unfold Qu8Add.scalar_goal.qcp_qu_neon_mla_partial_solve_wit_2,Qu8Add.scalar_goal.qcp_qu_neon_mla_partial_solve_wit_2_aux;try left;intros;subst;pose proof(qu_mul_bound31 b_pre c_pre ltac:(lia)ltac:(lia));qu_core. Qed.

Lemma proof_of_qcp_qu_neon_shift_safety_wit_11 : Qu8Add.scalar_goal.qcp_qu_neon_shift_safety_wit_11.
Proof. unfold Qu8Add.scalar_goal.qcp_qu_neon_shift_safety_wit_11;try left;intros;subst;pose proof(qu_s8_range b_pre);qu_core. Qed.

Lemma proof_of_qcp_qu_rvv_rnu_safety_wit_2 : Qu8Add.scalar_goal.qcp_qu_rvv_rnu_safety_wit_2.
Proof. unfold Qu8Add.scalar_goal.qcp_qu_rvv_rnu_safety_wit_2;try left;intros;subst;qu_core. Qed.

Lemma proof_of_qcp_qu_neon_add16_partial_solve_wit_1 : Qu8Add.scalar_goal.qcp_qu_neon_add16_partial_solve_wit_1.
Proof. unfold Qu8Add.scalar_goal.qcp_qu_neon_add16_partial_solve_wit_1,Qu8Add.scalar_goal.qcp_qu_neon_add16_partial_solve_wit_1_aux;try left;intros;subst;qu_core. Qed.
