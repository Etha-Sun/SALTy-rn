From Coq Require Import ZArith Lia.
From DwChw Require Import PropagatingTactics ControlModel support_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Lemma dw_round_result_range:forall n,0<=n<=18446744073709551600 ->
 0<=((n+15)÷16)*16<18446744073709551616.
Proof.
 intros n H;rewrite Z.quot_div_nonneg by lia.
 pose proof(Z.mod_pos_bound(n+15)16 ltac:(lia)).
 pose proof(Z.div_mod(n+15)16 ltac:(lia));nia.
Qed.
Ltac dw_support_start:=try left;intros;subst;
 try unfold UndefStructPreduint32x4_t;rewrite ?qm_local_field_address;
 try rewrite Z.mul_0_l;try rewrite Z.add_0_r.
Ltac dw_support_pure:=unfold derivable1,andp,coq_prop;intros;
 repeat match goal with |- _/\_=>split end;
 first[assumption|reflexivity|solve[unfold dw_doz_model;rewrite Z.max_l by lia;lia]|solve[unfold dw_doz_model;rewrite Z.max_r by lia;lia]|solve[entailer!;lia]|solve[lia]].
Ltac dw_support_solve:=dw_support_start;
 first[solve[apply _derivable1_andp_intros;[dw_support_pure|opaque_leaves;sepcon_assoc_change;fast_cancel]]
 |solve[opaque_leaves;sepcon_assoc_change;fast_cancel]|solve[dw_support_pure]
 |solve[entailer!;lia]].
Lemma proof_of_dw_mask_words_safety_wit_1 : DwChw.support_unit_goal.dw_mask_words_safety_wit_1.
Proof. unfold DwChw.support_unit_goal.dw_mask_words_safety_wit_1;dw_support_solve.
Qed.
Print Assumptions proof_of_dw_mask_words_safety_wit_1.
Lemma proof_of_dw_mask_words_safety_wit_2 : DwChw.support_unit_goal.dw_mask_words_safety_wit_2.
Proof. unfold DwChw.support_unit_goal.dw_mask_words_safety_wit_2;dw_support_solve.
Qed.
Print Assumptions proof_of_dw_mask_words_safety_wit_2.
Lemma proof_of_dw_mask_words_safety_wit_3 : DwChw.support_unit_goal.dw_mask_words_safety_wit_3.
Proof. unfold DwChw.support_unit_goal.dw_mask_words_safety_wit_3;dw_support_solve.
Qed.
Print Assumptions proof_of_dw_mask_words_safety_wit_3.
Lemma proof_of_dw_mask_words_safety_wit_4 : DwChw.support_unit_goal.dw_mask_words_safety_wit_4.
Proof. unfold DwChw.support_unit_goal.dw_mask_words_safety_wit_4;dw_support_solve.
Qed.
Print Assumptions proof_of_dw_mask_words_safety_wit_4.
Lemma proof_of_dw_mask_words_return_wit_1 : DwChw.support_unit_goal.dw_mask_words_return_wit_1.
Proof. unfold DwChw.support_unit_goal.dw_mask_words_return_wit_1;dw_support_solve.
Qed.
Print Assumptions proof_of_dw_mask_words_return_wit_1.
Lemma proof_of_dw_mask_words_partial_solve_wit_1 : DwChw.support_unit_goal.dw_mask_words_partial_solve_wit_1.
Proof. unfold DwChw.support_unit_goal.dw_mask_words_partial_solve_wit_1;dw_support_solve.
Qed.
Print Assumptions proof_of_dw_mask_words_partial_solve_wit_1.
Lemma proof_of_dw_assert_return_wit_1 : DwChw.support_unit_goal.dw_assert_return_wit_1.
Proof. unfold DwChw.support_unit_goal.dw_assert_return_wit_1;dw_support_solve.
Qed.
Print Assumptions proof_of_dw_assert_return_wit_1.
Lemma proof_of_dw_round_up_po2_safety_wit_1 : DwChw.support_unit_goal.dw_round_up_po2_safety_wit_1.
Proof. unfold DwChw.support_unit_goal.dw_round_up_po2_safety_wit_1;dw_support_solve.
Qed.
Print Assumptions proof_of_dw_round_up_po2_safety_wit_1.
Lemma proof_of_dw_round_up_po2_safety_wit_2 : DwChw.support_unit_goal.dw_round_up_po2_safety_wit_2.
Proof. unfold DwChw.support_unit_goal.dw_round_up_po2_safety_wit_2;dw_support_solve.
Qed.
Print Assumptions proof_of_dw_round_up_po2_safety_wit_2.
Lemma proof_of_dw_round_up_po2_return_wit_1 : DwChw.support_unit_goal.dw_round_up_po2_return_wit_1.
Proof. unfold DwChw.support_unit_goal.dw_round_up_po2_return_wit_1;left;intros;subst.
 apply _derivable1_andp_intros;[|entailer!].
 unfold derivable1,andp,coq_prop;intros.
 replace(16-1)with 15 by lia.
 unfold unsigned_last_nbits;change(2^64)with 18446744073709551616.
 rewrite Z.mod_small;[reflexivity|apply dw_round_result_range;lia].
Qed.
Print Assumptions proof_of_dw_round_up_po2_return_wit_1.
Lemma proof_of_dw_doz_safety_wit_1 : DwChw.support_unit_goal.dw_doz_safety_wit_1.
Proof. unfold DwChw.support_unit_goal.dw_doz_safety_wit_1;dw_support_solve.
Qed.
Print Assumptions proof_of_dw_doz_safety_wit_1.
Lemma proof_of_dw_doz_return_wit_1 : DwChw.support_unit_goal.dw_doz_return_wit_1.
Proof. unfold DwChw.support_unit_goal.dw_doz_return_wit_1;dw_support_solve.
Qed.
Print Assumptions proof_of_dw_doz_return_wit_1.
Lemma proof_of_dw_doz_return_wit_2 : DwChw.support_unit_goal.dw_doz_return_wit_2.
Proof. unfold DwChw.support_unit_goal.dw_doz_return_wit_2;dw_support_solve.
Qed.
Print Assumptions proof_of_dw_doz_return_wit_2.
Module CheckedSupport : DwChw.support_unit_goal.VC_Correct.
Definition proof_of_dw_mask_words_safety_wit_1 : DwChw.support_unit_goal.dw_mask_words_safety_wit_1 := proof_of_dw_mask_words_safety_wit_1.
Definition proof_of_dw_mask_words_safety_wit_2 : DwChw.support_unit_goal.dw_mask_words_safety_wit_2 := proof_of_dw_mask_words_safety_wit_2.
Definition proof_of_dw_mask_words_safety_wit_3 : DwChw.support_unit_goal.dw_mask_words_safety_wit_3 := proof_of_dw_mask_words_safety_wit_3.
Definition proof_of_dw_mask_words_safety_wit_4 : DwChw.support_unit_goal.dw_mask_words_safety_wit_4 := proof_of_dw_mask_words_safety_wit_4.
Definition proof_of_dw_mask_words_return_wit_1 : DwChw.support_unit_goal.dw_mask_words_return_wit_1 := proof_of_dw_mask_words_return_wit_1.
Definition proof_of_dw_mask_words_partial_solve_wit_1 : DwChw.support_unit_goal.dw_mask_words_partial_solve_wit_1 := proof_of_dw_mask_words_partial_solve_wit_1.
Definition proof_of_dw_assert_return_wit_1 : DwChw.support_unit_goal.dw_assert_return_wit_1 := proof_of_dw_assert_return_wit_1.
Definition proof_of_dw_round_up_po2_safety_wit_1 : DwChw.support_unit_goal.dw_round_up_po2_safety_wit_1 := proof_of_dw_round_up_po2_safety_wit_1.
Definition proof_of_dw_round_up_po2_safety_wit_2 : DwChw.support_unit_goal.dw_round_up_po2_safety_wit_2 := proof_of_dw_round_up_po2_safety_wit_2.
Definition proof_of_dw_round_up_po2_return_wit_1 : DwChw.support_unit_goal.dw_round_up_po2_return_wit_1 := proof_of_dw_round_up_po2_return_wit_1.
Definition proof_of_dw_doz_safety_wit_1 : DwChw.support_unit_goal.dw_doz_safety_wit_1 := proof_of_dw_doz_safety_wit_1.
Definition proof_of_dw_doz_return_wit_1 : DwChw.support_unit_goal.dw_doz_return_wit_1 := proof_of_dw_doz_return_wit_1.
Definition proof_of_dw_doz_return_wit_2 : DwChw.support_unit_goal.dw_doz_return_wit_2 := proof_of_dw_doz_return_wit_2.
End CheckedSupport.
