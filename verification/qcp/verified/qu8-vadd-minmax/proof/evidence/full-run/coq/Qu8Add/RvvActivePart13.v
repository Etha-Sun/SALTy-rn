From Qu8Add Require Import RvvActiveAutomation.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma proof_of_qcp_qu_active_mul_return_wit_1 : Qu8Add.rvv_active_goal.qcp_qu_active_mul_return_wit_1.
Proof. unfold Qu8Add.rvv_active_goal.qcp_qu_active_mul_return_wit_1;try left;intros;subst;qu_active_core. Qed.
Lemma proof_of_qcp_qu_active_rnu_partial_solve_wit_1 : Qu8Add.rvv_active_goal.qcp_qu_active_rnu_partial_solve_wit_1.
Proof. unfold Qu8Add.rvv_active_goal.qcp_qu_active_rnu_partial_solve_wit_1,Qu8Add.rvv_active_goal.qcp_qu_active_rnu_partial_solve_wit_1_aux;try left;intros;subst;qu_active_core. Qed.
Lemma proof_of_qcp_qu_active_max16_safety_wit_1 : Qu8Add.rvv_active_goal.qcp_qu_active_max16_safety_wit_1.
Proof. unfold Qu8Add.rvv_active_goal.qcp_qu_active_max16_safety_wit_1;try left;intros;subst;qu_active_core. Qed.
Lemma proof_of_qcp_qu_active_min_return_wit_1 : Qu8Add.rvv_active_goal.qcp_qu_active_min_return_wit_1.
Proof. unfold Qu8Add.rvv_active_goal.qcp_qu_active_min_return_wit_1;try left;intros;subst;qu_active_core. Qed.
