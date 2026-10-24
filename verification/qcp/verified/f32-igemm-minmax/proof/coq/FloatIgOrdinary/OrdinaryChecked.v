From FloatIgOrdinary Require Import ordinary_goal.
From FloatAutomation Require Import Frame.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module Checked <: ordinary_goal.VC_Correct.
Lemma proof_of_qcp_assert_return_wit_1 : qcp_assert_return_wit_1.
Proof. unfold qcp_assert_return_wit_1;intros;apply derivable1_refl. Qed.
Lemma proof_of_qcp_identity_return_wit_1 : qcp_identity_return_wit_1.
Proof. unfold qcp_identity_return_wit_1;left;intros;unfold bit_same;entailer!. Qed.
Lemma proof_of_qcp_isnan_safety_wit_1 : qcp_isnan_safety_wit_1.
Proof. unfold qcp_isnan_safety_wit_1;intros;entailer!. Qed.
Lemma proof_of_qcp_isnan_safety_wit_2 : qcp_isnan_safety_wit_2.
Proof. unfold qcp_isnan_safety_wit_2;intros;entailer!. Qed.
Lemma proof_of_qcp_isnan_return_wit_1 : qcp_isnan_return_wit_1.
Proof.
 unfold qcp_isnan_return_wit_1;left;intros.
 unfold bit_same in *;subst retval.
 unfold rvv_nanth;rewrite (ig_self_eq_nan_false x_pre PreH1);entailer!.
Qed.
Lemma proof_of_qcp_isnan_return_wit_2 : qcp_isnan_return_wit_2.
Proof.
 unfold qcp_isnan_return_wit_2;left;intros.
 unfold bit_same in *;subst retval.
 unfold rvv_nanth;rewrite (ig_self_ne_nan_true x_pre PreH1);entailer!.
Qed.
Lemma proof_of_qcp_isnan_partial_solve_wit_1 : qcp_isnan_partial_solve_wit_1.
Proof. unfold qcp_isnan_partial_solve_wit_1;apply derivable1_refl. Qed.
End Checked.
Print Assumptions Checked.proof_of_qcp_assert_return_wit_1.
Print Assumptions Checked.proof_of_qcp_identity_return_wit_1.
Print Assumptions Checked.proof_of_qcp_isnan_safety_wit_1.
Print Assumptions Checked.proof_of_qcp_isnan_safety_wit_2.
Print Assumptions Checked.proof_of_qcp_isnan_return_wit_1.
Print Assumptions Checked.proof_of_qcp_isnan_return_wit_2.
Print Assumptions Checked.proof_of_qcp_isnan_partial_solve_wit_1.
