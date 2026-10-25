From Coq Require Import ZArith Lia.
From SimpleC.SL Require Import SeparationLogic.
From GemmSpec Require Import FmaModel.
From SpmmOrdinary Require Import unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module Checked <: VC_Correct.
Lemma proof_of_qcp_identity_return_wit_1 : qcp_identity_return_wit_1.
Proof. unfold qcp_identity_return_wit_1;left;intros;unfold bit_same;entailer!. Qed.
Lemma proof_of_qcp_assert_return_wit_1 : qcp_assert_return_wit_1.
Proof. unfold qcp_assert_return_wit_1;intros;entailer!. Qed.
Lemma proof_of_xnn_prefetch_to_l1_return_wit_1 : xnn_prefetch_to_l1_return_wit_1.
Proof. unfold xnn_prefetch_to_l1_return_wit_1;entailer!. Qed.
Lemma proof_of_xnn_prefetch_to_l1_partial_solve_wit_1 : xnn_prefetch_to_l1_partial_solve_wit_1.
Proof. unfold xnn_prefetch_to_l1_partial_solve_wit_1;entailer!. Qed.
End Checked.
Print Assumptions Checked.proof_of_qcp_identity_return_wit_1.
Print Assumptions Checked.proof_of_qcp_assert_return_wit_1.
Print Assumptions Checked.proof_of_xnn_prefetch_to_l1_return_wit_1.
Print Assumptions Checked.proof_of_xnn_prefetch_to_l1_partial_solve_wit_1.
