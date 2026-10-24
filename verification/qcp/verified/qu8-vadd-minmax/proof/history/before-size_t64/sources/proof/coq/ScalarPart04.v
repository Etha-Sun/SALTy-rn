From Qu8Add Require Import ScalarAutomation.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma proof_of_qcp_qu_pow2_return_wit_1 : Qu8Add.scalar_goal.qcp_qu_pow2_return_wit_1.
Proof. unfold Qu8Add.scalar_goal.qcp_qu_pow2_return_wit_1;try left;intros;subst;pose proof(qu_pow_bounds31 d_pre ltac:(lia));pose proof(qu_pow2_unsigned32 d_pre ltac:(lia))as HP;change(unsigned_last_nbits(Z.shiftl 1 d_pre)32=qu_pow2 d_pre)in HP;rewrite HP;qu_core. Qed.

Lemma proof_of_qcp_qu_sat16_safety_wit_6 : Qu8Add.scalar_goal.qcp_qu_sat16_safety_wit_6.
Proof. unfold Qu8Add.scalar_goal.qcp_qu_sat16_safety_wit_6;try left;intros;subst;qu_core. Qed.

Lemma proof_of_qcp_qu_neon_mul_partial_solve_wit_1 : Qu8Add.scalar_goal.qcp_qu_neon_mul_partial_solve_wit_1.
Proof. unfold Qu8Add.scalar_goal.qcp_qu_neon_mul_partial_solve_wit_1,Qu8Add.scalar_goal.qcp_qu_neon_mul_partial_solve_wit_1_aux;try left;intros;subst;pose proof(qu_mul_bound31 a_pre b_pre ltac:(lia)ltac:(lia));qu_core. Qed.

Lemma proof_of_qcp_qu_rvv_macc_partial_solve_wit_1 : Qu8Add.scalar_goal.qcp_qu_rvv_macc_partial_solve_wit_1.
Proof. unfold Qu8Add.scalar_goal.qcp_qu_rvv_macc_partial_solve_wit_1,Qu8Add.scalar_goal.qcp_qu_rvv_macc_partial_solve_wit_1_aux;try left;intros;subst;pose proof(qu_mul_bound31 b_pre c_pre ltac:(lia)ltac:(lia));qu_core. Qed.

Lemma proof_of_qcp_qu_neon_shift_partial_solve_wit_1_pure : Qu8Add.scalar_goal.qcp_qu_neon_shift_partial_solve_wit_1_pure.
Proof. unfold Qu8Add.scalar_goal.qcp_qu_neon_shift_partial_solve_wit_1_pure;try left;intros;subst;pose proof(qu_s8_range b_pre);qu_core. Qed.

Lemma proof_of_qcp_qu_rvv_rnu_partial_solve_wit_2_pure : Qu8Add.scalar_goal.qcp_qu_rvv_rnu_partial_solve_wit_2_pure.
Proof. unfold Qu8Add.scalar_goal.qcp_qu_rvv_rnu_partial_solve_wit_2_pure;try left;intros;subst;try qu_half;qu_core. Qed.

Lemma proof_of_qcp_qu_sub8_safety_wit_1 : Qu8Add.scalar_goal.qcp_qu_sub8_safety_wit_1.
Proof. unfold Qu8Add.scalar_goal.qcp_qu_sub8_safety_wit_1;try left;intros;subst;qu_core. Qed.
