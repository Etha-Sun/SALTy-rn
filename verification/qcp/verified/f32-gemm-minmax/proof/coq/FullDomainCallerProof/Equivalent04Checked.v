From Coq Require Import ZArith Lia.
From FullDomainCallerVC Require Import spec_goal.
From FullDomainCaller Require Import FullCallerLogic.
From FullDomainMemory Require Import OutputFinish.
From FullDomainRvv Require Import MachineDomain.
From VaddComparator Require Import ComparatorLogic.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedEquivalent04.
Lemma proof_of_equivalent_safety_wit_1 : spec_goal.equivalent_safety_wit_1.
Proof. unfold equivalent_safety_wit_1;intros;apply _derivable1_andp_intros;dump_pre_spatial;lia. Qed.
Lemma proof_of_equivalent_safety_wit_2 : spec_goal.equivalent_safety_wit_2.
Proof. unfold equivalent_safety_wit_2;intros;apply _derivable1_andp_intros;dump_pre_spatial;lia. Qed.
Lemma proof_of_equivalent_partial_solve_wit_1_pure : spec_goal.equivalent_partial_solve_wit_1_pure.
Proof. unfold equivalent_partial_solve_wit_1_pure;try left;intros;subst;entailer!. Qed.
Lemma proof_of_equivalent_partial_solve_wit_2_pure : spec_goal.equivalent_partial_solve_wit_2_pure.
Proof. unfold equivalent_partial_solve_wit_2_pure;try left;intros;subst;entailer!. Qed.
Lemma proof_of_equivalent_partial_solve_wit_3_pure : spec_goal.equivalent_partial_solve_wit_3_pure.
Proof. unfold equivalent_partial_solve_wit_3_pure;try left;intros;subst;entailer!. Qed.
Lemma proof_of_equivalent_partial_solve_wit_4_pure : spec_goal.equivalent_partial_solve_wit_4_pure.
Proof. unfold equivalent_partial_solve_wit_4_pure;try left;intros;subst;entailer!. Qed.
Lemma proof_of_equivalent_partial_solve_wit_5_pure : spec_goal.equivalent_partial_solve_wit_5_pure.
Proof. unfold equivalent_partial_solve_wit_5_pure;try left;intros;subst;entailer!;apply completed_values_are_related. Qed.
Lemma proof_of_equivalent_partial_solve_wit_1 : spec_goal.equivalent_partial_solve_wit_1.
Proof. unfold equivalent_partial_solve_wit_1, equivalent_partial_solve_wit_1_aux;intros H;intros;subst;entailer!. Qed.
Lemma proof_of_equivalent_partial_solve_wit_2 : spec_goal.equivalent_partial_solve_wit_2.
Proof. unfold equivalent_partial_solve_wit_2, equivalent_partial_solve_wit_2_aux;intros H;intros;subst;entailer!. Qed.
Lemma proof_of_equivalent_partial_solve_wit_3 : spec_goal.equivalent_partial_solve_wit_3.
Proof. unfold equivalent_partial_solve_wit_3, equivalent_partial_solve_wit_3_aux;intros H;intros;subst;entailer!. Qed.
Lemma proof_of_equivalent_partial_solve_wit_4 : spec_goal.equivalent_partial_solve_wit_4.
Proof. unfold equivalent_partial_solve_wit_4, equivalent_partial_solve_wit_4_aux;intros H;intros;subst;entailer!. Qed.
Lemma proof_of_equivalent_partial_solve_wit_5 : spec_goal.equivalent_partial_solve_wit_5.
Proof. unfold equivalent_partial_solve_wit_5, equivalent_partial_solve_wit_5_aux;intros H;intros;subst;entailer!;apply completed_values_are_related. Qed.
Lemma proof_of_equivalent_which_implies_wit_1 : spec_goal.equivalent_which_implies_wit_1.
Proof. unfold equivalent_which_implies_wit_1;right;intros;apply completed_output_state;lia. Qed.
Lemma proof_of_equivalent_which_implies_wit_2 : spec_goal.equivalent_which_implies_wit_2.
Proof. unfold equivalent_which_implies_wit_2;right;intros;apply completed_output_state;lia. Qed.
Lemma proof_of_equivalent_entail_wit_1 : spec_goal.equivalent_entail_wit_1.
Proof.
 unfold equivalent_entail_wit_1;left;intros.
 pose proof PreH11 as Hcapacity;unfold machine_capacity in Hcapacity.
 destruct Hcapacity as[Hkc [Hsize Hrest]].
 assert(Hnc:nc_pre<=1152921504606846975)by nia.
 assert(Hobs:0<mr_pre*nc_pre /\ mr_pre*nc_pre<=4611686018427387900)by(apply complete_geometry_fits_comparator;lia).
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size].
 rewrite !unsigned_last_nbits_eq by(replace (2^64) with 18446744073709551616 by reflexivity;nia).
 entailer!.
Qed.
Lemma proof_of_equivalent_return_wit_1 : spec_goal.equivalent_return_wit_1.
Proof.
 unfold equivalent_return_wit_1;left;intros;subst.
 Exists(completed_values A W(kc_pre ÷ 4)mr_pre nc_pre lo hi)
       (completed_values A W(kc_pre ÷ 4)mr_pre nc_pre lo hi).
 entailer!;apply completed_values_are_related.
Qed.
End CheckedEquivalent04.
Print Assumptions CheckedEquivalent04.proof_of_equivalent_safety_wit_1.
Print Assumptions CheckedEquivalent04.proof_of_equivalent_safety_wit_2.
Print Assumptions CheckedEquivalent04.proof_of_equivalent_partial_solve_wit_1_pure.
Print Assumptions CheckedEquivalent04.proof_of_equivalent_partial_solve_wit_2_pure.
Print Assumptions CheckedEquivalent04.proof_of_equivalent_partial_solve_wit_3_pure.
Print Assumptions CheckedEquivalent04.proof_of_equivalent_partial_solve_wit_4_pure.
Print Assumptions CheckedEquivalent04.proof_of_equivalent_partial_solve_wit_5_pure.
Print Assumptions CheckedEquivalent04.proof_of_equivalent_partial_solve_wit_1.
Print Assumptions CheckedEquivalent04.proof_of_equivalent_partial_solve_wit_2.
Print Assumptions CheckedEquivalent04.proof_of_equivalent_partial_solve_wit_3.
Print Assumptions CheckedEquivalent04.proof_of_equivalent_partial_solve_wit_4.
Print Assumptions CheckedEquivalent04.proof_of_equivalent_partial_solve_wit_5.
Print Assumptions CheckedEquivalent04.proof_of_equivalent_which_implies_wit_1.
Print Assumptions CheckedEquivalent04.proof_of_equivalent_which_implies_wit_2.

Print Assumptions CheckedEquivalent04.proof_of_equivalent_entail_wit_1.
Print Assumptions CheckedEquivalent04.proof_of_equivalent_return_wit_1.
