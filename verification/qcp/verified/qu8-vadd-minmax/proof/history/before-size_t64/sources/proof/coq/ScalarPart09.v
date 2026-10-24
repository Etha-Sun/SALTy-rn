From Qu8Add Require Import ScalarAutomation.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma proof_of_qcp_qu_floor_safety_wit_5 : Qu8Add.scalar_goal.qcp_qu_floor_safety_wit_5.
Proof. unfold Qu8Add.scalar_goal.qcp_qu_floor_safety_wit_5;try left;intros;subst;qu_core. Qed.

Lemma proof_of_qcp_qu_sat8_safety_wit_2 : Qu8Add.scalar_goal.qcp_qu_sat8_safety_wit_2.
Proof. unfold Qu8Add.scalar_goal.qcp_qu_sat8_safety_wit_2;try left;intros;subst;qu_core. Qed.

Lemma proof_of_qcp_qu_neon_mla_safety_wit_1 : Qu8Add.scalar_goal.qcp_qu_neon_mla_safety_wit_1.
Proof. unfold Qu8Add.scalar_goal.qcp_qu_neon_mla_safety_wit_1;try left;intros;subst;pose proof(qu_mul_bound31 b_pre c_pre ltac:(lia)ltac:(lia));qu_core. Qed.

Lemma proof_of_qcp_qu_neon_shift_safety_wit_5 : Qu8Add.scalar_goal.qcp_qu_neon_shift_safety_wit_5.
Proof. unfold Qu8Add.scalar_goal.qcp_qu_neon_shift_safety_wit_5;try left;intros;subst;pose proof(qu_s8_range b_pre);qu_core. Qed.

Lemma proof_of_qcp_qu_neon_shift_partial_solve_wit_3 : Qu8Add.scalar_goal.qcp_qu_neon_shift_partial_solve_wit_3.
Proof. unfold Qu8Add.scalar_goal.qcp_qu_neon_shift_partial_solve_wit_3,Qu8Add.scalar_goal.qcp_qu_neon_shift_partial_solve_wit_3_aux;try left;intros;subst;pose proof(qu_s8_range b_pre);try qu_half;qu_core. Qed.

Lemma proof_of_qcp_qu_rvv_sll_partial_solve_wit_1 : Qu8Add.scalar_goal.qcp_qu_rvv_sll_partial_solve_wit_1.
Proof. unfold Qu8Add.scalar_goal.qcp_qu_rvv_sll_partial_solve_wit_1,Qu8Add.scalar_goal.qcp_qu_rvv_sll_partial_solve_wit_1_aux;try left;intros;subst;qu_core. Qed.
