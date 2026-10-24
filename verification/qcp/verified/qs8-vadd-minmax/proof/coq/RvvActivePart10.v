From Qs8Add Require Import RvvActiveAutomation.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma proof_of_qcp_qa_active_mul_return_wit_2 : Qs8Add.rvv_active_goal.qcp_qa_active_mul_return_wit_2.
Proof. unfold Qs8Add.rvv_active_goal.qcp_qa_active_mul_return_wit_2;try left;intros;subst;qa_active_core. Qed.

Lemma proof_of_qcp_qa_active_sll_safety_wit_1 : Qs8Add.rvv_active_goal.qcp_qa_active_sll_safety_wit_1.
Proof. unfold Qs8Add.rvv_active_goal.qcp_qa_active_sll_safety_wit_1;try left;intros;subst;qa_active_core. Qed.

Lemma proof_of_qcp_qa_active_clip8_return_wit_1 : Qs8Add.rvv_active_goal.qcp_qa_active_clip8_return_wit_1.
Proof. unfold Qs8Add.rvv_active_goal.qcp_qa_active_clip8_return_wit_1;try left;intros;subst;qa_active_core. Qed.
