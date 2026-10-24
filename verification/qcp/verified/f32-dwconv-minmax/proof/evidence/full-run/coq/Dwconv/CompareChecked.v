From Coq Require Import ZArith Lia.
From Dwconv Require Import CompareSupport public_compare_goal.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Module CheckedCompare : Dwconv.public_compare_goal.VC_Correct.
Lemma proof_of_compare_outputs_safety_wit_1 : Dwconv.public_compare_goal.compare_outputs_safety_wit_1.
Proof. unfold Dwconv.public_compare_goal.compare_outputs_safety_wit_1;dw_compare_finish. Qed.
Lemma proof_of_compare_outputs_safety_wit_2 : Dwconv.public_compare_goal.compare_outputs_safety_wit_2.
Proof. unfold Dwconv.public_compare_goal.compare_outputs_safety_wit_2;dw_compare_finish. Qed.
Lemma proof_of_compare_outputs_safety_wit_3 : Dwconv.public_compare_goal.compare_outputs_safety_wit_3.
Proof. unfold Dwconv.public_compare_goal.compare_outputs_safety_wit_3;dw_compare_finish. Qed.
Lemma proof_of_compare_outputs_safety_wit_4 : Dwconv.public_compare_goal.compare_outputs_safety_wit_4.
Proof. unfold Dwconv.public_compare_goal.compare_outputs_safety_wit_4;dw_compare_finish. Qed.
Lemma proof_of_compare_outputs_entail_wit_1 : Dwconv.public_compare_goal.compare_outputs_entail_wit_1.
Proof. unfold Dwconv.public_compare_goal.compare_outputs_entail_wit_1;left;dw_prepare.
rewrite ?Z.sub_diag;unfold dw_output_at;cbn[Z.eqb];dw_frame. Qed.
Lemma proof_of_compare_outputs_entail_wit_2 : Dwconv.public_compare_goal.compare_outputs_entail_wit_2.
Proof. unfold Dwconv.public_compare_goal.compare_outputs_entail_wit_2;dw_prepare;dw_address_units;dw_frame. Qed.
Lemma proof_of_compare_outputs_entail_wit_3 : Dwconv.public_compare_goal.compare_outputs_entail_wit_3.
Proof. unfold Dwconv.public_compare_goal.compare_outputs_entail_wit_3;left;dw_prepare.
assert(Hp:0<=dw_width D-pixels<dw_width D)by lia.
assert(Hi:0<=dw_channels D-remaining<dw_channels D)by lia.
assert(Hpair:dw_observed_pair O1 O2
 (dw_output_at D(dw_width D-pixels)+4*(dw_channels D-remaining))
 (dw_output_at(dw_rebase D out2)(dw_width D-pixels)+4*(dw_channels D-remaining))).
{ apply dw_pair_observed_at;assumption. }
pose proof(dw_observed_pair_ready _ _ _ _ Hpair)as[Hready1 Hready2].
pose proof(dw_domain_address_owned W1 D _ _ ltac:(assumption)Hp Hi)as Howned1.
pose proof(dw_domain_address_owned W2(dw_rebase D out2)_ _ ltac:(assumption)Hp Hi)as Howned2.
pose proof(dw_domain_address_positive W1 D _ _ ltac:(assumption)Hp Hi)as Hpositive1.
pose proof(dw_domain_address_positive W2(dw_rebase D out2)_ _ ltac:(assumption)Hp Hi)as Hpositive2.
unfold dw_owned;dw_frame. Qed.
Lemma proof_of_compare_outputs_entail_wit_4 : Dwconv.public_compare_goal.compare_outputs_entail_wit_4.
Proof. unfold Dwconv.public_compare_goal.compare_outputs_entail_wit_4;left;dw_prepare;dw_frame. Qed.
Lemma proof_of_compare_outputs_entail_wit_5 : Dwconv.public_compare_goal.compare_outputs_entail_wit_5.
Proof. unfold Dwconv.public_compare_goal.compare_outputs_entail_wit_5;left;dw_prepare.
rewrite ?Z.sub_0_r.
assert(Hword:forall x,unsigned_last_nbits x 64=dw_word x)by(intro;reflexivity).
rewrite ?Hword,?dw_word_add_l.
replace(dw_width D-(pixels-1))with(dw_width D-pixels+1)by ring.
rewrite <-(dw_output_step D(dw_width D-pixels)ltac:(lia)).
rewrite <-(dw_output_step(dw_rebase D out2)(dw_width D-pixels)ltac:(lia)).
dw_frame. Qed.
Lemma proof_of_compare_outputs_return_wit_1 : Dwconv.public_compare_goal.compare_outputs_return_wit_1.
Proof. unfold Dwconv.public_compare_goal.compare_outputs_return_wit_1;dw_compare_finish. Qed.
Lemma proof_of_compare_outputs_partial_solve_wit_1_pure : Dwconv.public_compare_goal.compare_outputs_partial_solve_wit_1_pure.
Proof. unfold Dwconv.public_compare_goal.compare_outputs_partial_solve_wit_1_pure;dw_compare_finish. Qed.
Lemma proof_of_compare_outputs_partial_solve_wit_1 : Dwconv.public_compare_goal.compare_outputs_partial_solve_wit_1.
Proof. unfold Dwconv.public_compare_goal.compare_outputs_partial_solve_wit_1,Dwconv.public_compare_goal.compare_outputs_partial_solve_wit_1_aux;dw_compare_finish. Qed.
Lemma proof_of_compare_outputs_partial_solve_wit_2_pure : Dwconv.public_compare_goal.compare_outputs_partial_solve_wit_2_pure.
Proof. unfold Dwconv.public_compare_goal.compare_outputs_partial_solve_wit_2_pure;dw_compare_finish. Qed.
Lemma proof_of_compare_outputs_partial_solve_wit_2 : Dwconv.public_compare_goal.compare_outputs_partial_solve_wit_2.
Proof. unfold Dwconv.public_compare_goal.compare_outputs_partial_solve_wit_2,Dwconv.public_compare_goal.compare_outputs_partial_solve_wit_2_aux;dw_compare_finish. Qed.
Lemma proof_of_compare_outputs_partial_solve_wit_3_pure : Dwconv.public_compare_goal.compare_outputs_partial_solve_wit_3_pure.
Proof. unfold Dwconv.public_compare_goal.compare_outputs_partial_solve_wit_3_pure;dw_compare_finish. Qed.
Lemma proof_of_compare_outputs_partial_solve_wit_3 : Dwconv.public_compare_goal.compare_outputs_partial_solve_wit_3.
Proof. unfold Dwconv.public_compare_goal.compare_outputs_partial_solve_wit_3,Dwconv.public_compare_goal.compare_outputs_partial_solve_wit_3_aux;dw_compare_finish. Qed.
End CheckedCompare.
Print Assumptions CheckedCompare.proof_of_compare_outputs_safety_wit_1.
Print Assumptions CheckedCompare.proof_of_compare_outputs_safety_wit_2.
Print Assumptions CheckedCompare.proof_of_compare_outputs_safety_wit_3.
Print Assumptions CheckedCompare.proof_of_compare_outputs_safety_wit_4.
Print Assumptions CheckedCompare.proof_of_compare_outputs_entail_wit_1.
Print Assumptions CheckedCompare.proof_of_compare_outputs_entail_wit_2.
Print Assumptions CheckedCompare.proof_of_compare_outputs_entail_wit_3.
Print Assumptions CheckedCompare.proof_of_compare_outputs_entail_wit_4.
Print Assumptions CheckedCompare.proof_of_compare_outputs_entail_wit_5.
Print Assumptions CheckedCompare.proof_of_compare_outputs_return_wit_1.
Print Assumptions CheckedCompare.proof_of_compare_outputs_partial_solve_wit_1_pure.
Print Assumptions CheckedCompare.proof_of_compare_outputs_partial_solve_wit_1.
Print Assumptions CheckedCompare.proof_of_compare_outputs_partial_solve_wit_2_pure.
Print Assumptions CheckedCompare.proof_of_compare_outputs_partial_solve_wit_2.
Print Assumptions CheckedCompare.proof_of_compare_outputs_partial_solve_wit_3_pure.
Print Assumptions CheckedCompare.proof_of_compare_outputs_partial_solve_wit_3.
