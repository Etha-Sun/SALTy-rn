From Qs8Add Require Import RvvActiveAutomation.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma proof_of_qcp_qa_active_macc_return_wit_1 : Qs8Add.rvv_active_goal.qcp_qa_active_macc_return_wit_1.
Proof. unfold Qs8Add.rvv_active_goal.qcp_qa_active_macc_return_wit_1;try left;intros;subst;qa_active_core. Qed.

Lemma proof_of_qcp_qa_active_sll_partial_solve_wit_1 : Qs8Add.rvv_active_goal.qcp_qa_active_sll_partial_solve_wit_1.
Proof. unfold Qs8Add.rvv_active_goal.qcp_qa_active_sll_partial_solve_wit_1,Qs8Add.rvv_active_goal.qcp_qa_active_sll_partial_solve_wit_1_aux;try left;intros;subst;qa_active_core. Qed.

Lemma proof_of_qcp_qa_active_max_safety_wit_1 : Qs8Add.rvv_active_goal.qcp_qa_active_max_safety_wit_1.
Proof. unfold Qs8Add.rvv_active_goal.qcp_qa_active_max_safety_wit_1;try left;intros;subst;qa_active_core. Qed.
