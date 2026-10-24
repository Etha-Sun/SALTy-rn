From Qu8Add Require Import ScalarAutomation.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma proof_of_qcp_qu_s16_return_wit_1 : Qu8Add.scalar_goal.qcp_qu_s16_return_wit_1.
Proof. unfold Qu8Add.scalar_goal.qcp_qu_s16_return_wit_1;try left;intros;subst;pose proof(qu_s16_range x_pre);unfold qu_s16 in *;qu_core. Qed.

Lemma proof_of_qcp_qu_sat16_safety_wit_3 : Qu8Add.scalar_goal.qcp_qu_sat16_safety_wit_3.
Proof. unfold Qu8Add.scalar_goal.qcp_qu_sat16_safety_wit_3;try left;intros;subst;qu_core. Qed.

Lemma proof_of_qcp_qu_neon_mul_safety_wit_1 : Qu8Add.scalar_goal.qcp_qu_neon_mul_safety_wit_1.
Proof. unfold Qu8Add.scalar_goal.qcp_qu_neon_mul_safety_wit_1;try left;intros;subst;pose proof(qu_mul_bound31 a_pre b_pre ltac:(lia)ltac:(lia));qu_core. Qed.

Lemma proof_of_qcp_qu_rvv_macc_safety_wit_2 : Qu8Add.scalar_goal.qcp_qu_rvv_macc_safety_wit_2.
Proof. unfold Qu8Add.scalar_goal.qcp_qu_rvv_macc_safety_wit_2;try left;intros;subst;pose proof(qu_mul_bound31 b_pre c_pre ltac:(lia)ltac:(lia));qu_core. Qed.

Lemma proof_of_qcp_qu_neon_shift_return_wit_2 : Qu8Add.scalar_goal.qcp_qu_neon_shift_return_wit_2.
Proof. unfold Qu8Add.scalar_goal.qcp_qu_neon_shift_return_wit_2;try left;intros;subst;pose proof(qu_s8_range b_pre);try qu_half;qu_core. Qed.

Lemma proof_of_qcp_qu_rvv_rnu_return_wit_1 : Qu8Add.scalar_goal.qcp_qu_rvv_rnu_return_wit_1.
Proof. unfold Qu8Add.scalar_goal.qcp_qu_rvv_rnu_return_wit_1;try left;intros;subst;try qu_half;qu_core. Qed.

Lemma proof_of_qcp_qu_rvv_add16_return_wit_1 : Qu8Add.scalar_goal.qcp_qu_rvv_add16_return_wit_1.
Proof. unfold Qu8Add.scalar_goal.qcp_qu_rvv_add16_return_wit_1;try left;intros;subst;qu_core. Qed.
