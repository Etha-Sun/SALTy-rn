From Coq Require Import ZArith Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
From GemmSpec Require Import FmaModel IntrinsicModel.
From VLRelu Require Import Bits.
From Minmax Require Import ScalarFacts minmax_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac scalar :=
 unfold bit_same, same_bits in *; subst;
 rewrite ?c_zero in *;
 entailer!;
 try (apply min_zeros; assumption);
 try (apply max_zeros; assumption);
 unfold fp32_neon_min,fp32_neon_max,fp32_min_number,fp32_max_number;
 repeat match goal with
 | H:fp32_eq ?x ?x |- _ => let E:=fresh in pose proof (eq_self_not_nan x H) as E; clear H
 | H:fp32_ne ?x ?x |- _ => let E:=fresh in pose proof (ne_self_nan x H) as E; clear H
 end;
 repeat match goal with
 | H:Binary.is_nan 24 128 ?x = ?v |- _ => progress rewrite H
 | H:fp32_eq ?x fp32_zero |- _ => progress rewrite (zero_test_eq x H)
 | H:fp32_ne ?x fp32_zero |- _ => progress rewrite (zero_test_ne x H)
 end;
 rewrite ?Bool.andb_false_r; cbn [orb andb];
 try reflexivity;
 unfold fp32_lt,fp32_gt,fp32_ge,fp32_le in *;
 repeat match goal with |- context[fp32_compare ?x ?y] => destruct (fp32_compare x y) as [[| |]|] eqn:? end;
 simpl in *; try contradiction; congruence.
Module Checked <: minmax_goal.VC_Correct.
Lemma proof_of_qcp_minmax_identity_return_wit_1 : qcp_minmax_identity_return_wit_1.
Proof. unfold qcp_minmax_identity_return_wit_1; try left; intros; scalar. Qed.
Lemma proof_of_qcp_min_number_return_wit_1 : qcp_min_number_return_wit_1.
Proof. unfold qcp_min_number_return_wit_1; try left; intros; scalar. Qed.
Lemma proof_of_qcp_min_number_return_wit_2 : qcp_min_number_return_wit_2.
Proof. unfold qcp_min_number_return_wit_2; try left; intros; scalar. Qed.
Lemma proof_of_qcp_min_number_return_wit_3 : qcp_min_number_return_wit_3.
Proof. unfold qcp_min_number_return_wit_3; try left; intros; scalar. Qed.
Lemma proof_of_qcp_min_number_return_wit_4 : qcp_min_number_return_wit_4.
Proof. unfold qcp_min_number_return_wit_4; try left; intros; scalar. Qed.
Lemma proof_of_qcp_min_number_return_wit_5 : qcp_min_number_return_wit_5.
Proof. unfold qcp_min_number_return_wit_5; try left; intros; scalar. Qed.
Lemma proof_of_qcp_min_number_return_wit_6 : qcp_min_number_return_wit_6.
Proof. unfold qcp_min_number_return_wit_6; try left; intros; scalar. Qed.
Lemma proof_of_qcp_min_number_return_wit_7 : qcp_min_number_return_wit_7.
Proof. unfold qcp_min_number_return_wit_7; try left; intros; scalar. Qed.
Lemma proof_of_qcp_min_number_return_wit_8 : qcp_min_number_return_wit_8.
Proof. unfold qcp_min_number_return_wit_8; try left; intros; scalar. Qed.
Lemma proof_of_qcp_min_number_partial_solve_wit_1 : qcp_min_number_partial_solve_wit_1.
Proof. unfold qcp_min_number_partial_solve_wit_1; try left; intros; scalar. Qed.
Lemma proof_of_qcp_min_number_partial_solve_wit_2 : qcp_min_number_partial_solve_wit_2.
Proof. unfold qcp_min_number_partial_solve_wit_2; try left; intros; scalar. Qed.
Lemma proof_of_qcp_min_number_partial_solve_wit_3 : qcp_min_number_partial_solve_wit_3.
Proof. unfold qcp_min_number_partial_solve_wit_3; try left; intros; scalar. Qed.
Lemma proof_of_qcp_max_number_return_wit_1 : qcp_max_number_return_wit_1.
Proof. unfold qcp_max_number_return_wit_1; try left; intros; scalar. Qed.
Lemma proof_of_qcp_max_number_return_wit_2 : qcp_max_number_return_wit_2.
Proof. unfold qcp_max_number_return_wit_2; try left; intros; scalar. Qed.
Lemma proof_of_qcp_max_number_return_wit_3 : qcp_max_number_return_wit_3.
Proof. unfold qcp_max_number_return_wit_3; try left; intros; scalar. Qed.
Lemma proof_of_qcp_max_number_return_wit_4 : qcp_max_number_return_wit_4.
Proof. unfold qcp_max_number_return_wit_4; try left; intros; scalar. Qed.
Lemma proof_of_qcp_max_number_return_wit_5 : qcp_max_number_return_wit_5.
Proof. unfold qcp_max_number_return_wit_5; try left; intros; scalar. Qed.
Lemma proof_of_qcp_max_number_return_wit_6 : qcp_max_number_return_wit_6.
Proof. unfold qcp_max_number_return_wit_6; try left; intros; scalar. Qed.
Lemma proof_of_qcp_max_number_return_wit_7 : qcp_max_number_return_wit_7.
Proof. unfold qcp_max_number_return_wit_7; try left; intros; scalar. Qed.
Lemma proof_of_qcp_max_number_return_wit_8 : qcp_max_number_return_wit_8.
Proof. unfold qcp_max_number_return_wit_8; try left; intros; scalar. Qed.
Lemma proof_of_qcp_max_number_partial_solve_wit_1 : qcp_max_number_partial_solve_wit_1.
Proof. unfold qcp_max_number_partial_solve_wit_1; try left; intros; scalar. Qed.
Lemma proof_of_qcp_max_number_partial_solve_wit_2 : qcp_max_number_partial_solve_wit_2.
Proof. unfold qcp_max_number_partial_solve_wit_2; try left; intros; scalar. Qed.
Lemma proof_of_qcp_max_number_partial_solve_wit_3 : qcp_max_number_partial_solve_wit_3.
Proof. unfold qcp_max_number_partial_solve_wit_3; try left; intros; scalar. Qed.
Lemma proof_of_qcp_neon_min_return_wit_1 : qcp_neon_min_return_wit_1.
Proof. unfold qcp_neon_min_return_wit_1; try left; intros; scalar. Qed.
Lemma proof_of_qcp_neon_min_return_wit_2 : qcp_neon_min_return_wit_2.
Proof. unfold qcp_neon_min_return_wit_2; try left; intros; scalar. Qed.
Lemma proof_of_qcp_neon_min_return_wit_3 : qcp_neon_min_return_wit_3.
Proof. unfold qcp_neon_min_return_wit_3; try left; intros; scalar. Qed.
Lemma proof_of_qcp_neon_min_partial_solve_wit_1 : qcp_neon_min_partial_solve_wit_1.
Proof. unfold qcp_neon_min_partial_solve_wit_1; try left; intros; scalar. Qed.
Lemma proof_of_qcp_neon_min_partial_solve_wit_2 : qcp_neon_min_partial_solve_wit_2.
Proof. unfold qcp_neon_min_partial_solve_wit_2; try left; intros; scalar. Qed.
Lemma proof_of_qcp_neon_min_partial_solve_wit_3 : qcp_neon_min_partial_solve_wit_3.
Proof. unfold qcp_neon_min_partial_solve_wit_3; try left; intros; scalar. Qed.
Lemma proof_of_qcp_neon_min_partial_solve_wit_4 : qcp_neon_min_partial_solve_wit_4.
Proof. unfold qcp_neon_min_partial_solve_wit_4; try left; intros; scalar. Qed.
Lemma proof_of_qcp_neon_min_partial_solve_wit_5 : qcp_neon_min_partial_solve_wit_5.
Proof. unfold qcp_neon_min_partial_solve_wit_5; try left; intros; scalar. Qed.
Lemma proof_of_qcp_neon_max_return_wit_1 : qcp_neon_max_return_wit_1.
Proof. unfold qcp_neon_max_return_wit_1; try left; intros; scalar. Qed.
Lemma proof_of_qcp_neon_max_return_wit_2 : qcp_neon_max_return_wit_2.
Proof. unfold qcp_neon_max_return_wit_2; try left; intros; scalar. Qed.
Lemma proof_of_qcp_neon_max_return_wit_3 : qcp_neon_max_return_wit_3.
Proof. unfold qcp_neon_max_return_wit_3; try left; intros; scalar. Qed.
Lemma proof_of_qcp_neon_max_partial_solve_wit_1 : qcp_neon_max_partial_solve_wit_1.
Proof. unfold qcp_neon_max_partial_solve_wit_1; try left; intros; scalar. Qed.
Lemma proof_of_qcp_neon_max_partial_solve_wit_2 : qcp_neon_max_partial_solve_wit_2.
Proof. unfold qcp_neon_max_partial_solve_wit_2; try left; intros; scalar. Qed.
Lemma proof_of_qcp_neon_max_partial_solve_wit_3 : qcp_neon_max_partial_solve_wit_3.
Proof. unfold qcp_neon_max_partial_solve_wit_3; try left; intros; scalar. Qed.
Lemma proof_of_qcp_neon_max_partial_solve_wit_4 : qcp_neon_max_partial_solve_wit_4.
Proof. unfold qcp_neon_max_partial_solve_wit_4; try left; intros; scalar. Qed.
Lemma proof_of_qcp_neon_max_partial_solve_wit_5 : qcp_neon_max_partial_solve_wit_5.
Proof. unfold qcp_neon_max_partial_solve_wit_5; try left; intros; scalar. Qed.
End Checked.
Print Assumptions Checked.proof_of_qcp_minmax_identity_return_wit_1.
Print Assumptions Checked.proof_of_qcp_min_number_return_wit_1.
Print Assumptions Checked.proof_of_qcp_min_number_return_wit_2.
Print Assumptions Checked.proof_of_qcp_min_number_return_wit_3.
Print Assumptions Checked.proof_of_qcp_min_number_return_wit_4.
Print Assumptions Checked.proof_of_qcp_min_number_return_wit_5.
Print Assumptions Checked.proof_of_qcp_min_number_return_wit_6.
Print Assumptions Checked.proof_of_qcp_min_number_return_wit_7.
Print Assumptions Checked.proof_of_qcp_min_number_return_wit_8.
Print Assumptions Checked.proof_of_qcp_min_number_partial_solve_wit_1.
Print Assumptions Checked.proof_of_qcp_min_number_partial_solve_wit_2.
Print Assumptions Checked.proof_of_qcp_min_number_partial_solve_wit_3.
Print Assumptions Checked.proof_of_qcp_max_number_return_wit_1.
Print Assumptions Checked.proof_of_qcp_max_number_return_wit_2.
Print Assumptions Checked.proof_of_qcp_max_number_return_wit_3.
Print Assumptions Checked.proof_of_qcp_max_number_return_wit_4.
Print Assumptions Checked.proof_of_qcp_max_number_return_wit_5.
Print Assumptions Checked.proof_of_qcp_max_number_return_wit_6.
Print Assumptions Checked.proof_of_qcp_max_number_return_wit_7.
Print Assumptions Checked.proof_of_qcp_max_number_return_wit_8.
Print Assumptions Checked.proof_of_qcp_max_number_partial_solve_wit_1.
Print Assumptions Checked.proof_of_qcp_max_number_partial_solve_wit_2.
Print Assumptions Checked.proof_of_qcp_max_number_partial_solve_wit_3.
Print Assumptions Checked.proof_of_qcp_neon_min_return_wit_1.
Print Assumptions Checked.proof_of_qcp_neon_min_return_wit_2.
Print Assumptions Checked.proof_of_qcp_neon_min_return_wit_3.
Print Assumptions Checked.proof_of_qcp_neon_min_partial_solve_wit_1.
Print Assumptions Checked.proof_of_qcp_neon_min_partial_solve_wit_2.
Print Assumptions Checked.proof_of_qcp_neon_min_partial_solve_wit_3.
Print Assumptions Checked.proof_of_qcp_neon_min_partial_solve_wit_4.
Print Assumptions Checked.proof_of_qcp_neon_min_partial_solve_wit_5.
Print Assumptions Checked.proof_of_qcp_neon_max_return_wit_1.
Print Assumptions Checked.proof_of_qcp_neon_max_return_wit_2.
Print Assumptions Checked.proof_of_qcp_neon_max_return_wit_3.
Print Assumptions Checked.proof_of_qcp_neon_max_partial_solve_wit_1.
Print Assumptions Checked.proof_of_qcp_neon_max_partial_solve_wit_2.
Print Assumptions Checked.proof_of_qcp_neon_max_partial_solve_wit_3.
Print Assumptions Checked.proof_of_qcp_neon_max_partial_solve_wit_4.
Print Assumptions Checked.proof_of_qcp_neon_max_partial_solve_wit_5.
