From Coq Require Import ZArith.
Local Open Scope Z_scope.
From ExpMinusMax Require Export AccumulatorModel.
Lemma em_acc_zero_related:em_acc_related em_acc_zero em_acc_zero.
Proof. repeat split;apply em_rel_refl. Qed.
Lemma em_acc_step_related:forall a b v0 v0' v1 v1' v2 v2' v3 v3',
 em_acc_related a b->em_rel v0 v0'->em_rel v1 v1'->em_rel v2 v2'->em_rel v3 v3'->
 em_acc_related(em_arm_acc_step a v0 v1 v2 v3)(em_rvv_acc_step b v0' v1' v2' v3').
Proof. intros a b v0 v0' v1 v1' v2 v2' v3 v3' [H0[H1[H2 H3]]] V0 V1 V2 V3;unfold em_acc_related,em_arm_acc_step,em_rvv_acc_step;simpl;repeat split;apply em_add_related;assumption. Qed.
Lemma em_pair_sum_related:forall a b,em_acc_related a b->em_rel(em_arm_pair_sum a)(em_rvv_pair_sum b).
Proof. intros a b [H0[H1[H2 H3]]];unfold em_arm_pair_sum,em_rvv_pair_sum;apply em_arm_cadd_related;apply em_arm_cadd_related;assumption. Qed.
Lemma em_tail_related:forall s s' r v0 v0' v1 v1' v2 v2',
 em_rel s s'->em_rel v0 v0'->em_rel v1 v1'->em_rel v2 v2'->
 em_rel(em_arm_tail s r v0 v1 v2)(em_rvv_tail s' r v0' v1' v2').
Proof.
 intros s s' r v0 v0' v1 v1' v2 v2' Hs H0 H1 H2;unfold em_arm_tail,em_rvv_tail.
 destruct(Z.eqb r 3);[apply em_cadd_related;[apply em_cadd_related;[exact Hs|apply em_arm_cadd_related;assumption]|exact H2]|].
 destruct(Z.eqb r 2);[apply em_cadd_related;[exact Hs|apply em_arm_cadd_related;assumption]|].
 destruct(Z.eqb r 1);[apply em_cadd_related;assumption|exact Hs].
Qed.
Lemma em_accumulate_related:forall g get maximum a b k,
 em_acc_related a b->em_acc_related(em_arm_accumulate g get maximum a k)(em_rvv_accumulate g get maximum b k).
Proof.
 induction g;intros get maximum a b k H;[exact H|].
 cbn[em_arm_accumulate em_rvv_accumulate];apply IHg;apply em_acc_step_related;try exact H;apply em_value_related.
Qed.
Lemma em_sum_related:forall n get maximum,em_rel(em_arm_sum n get maximum)(em_rvv_sum n get maximum).
Proof.
 intros;unfold em_arm_sum,em_rvv_sum;apply em_tail_related;try apply em_value_related.
 apply em_pair_sum_related;apply em_accumulate_related;exact em_acc_zero_related.
Qed.
Lemma em_sum_observation:forall n get maximum,em_observe(em_arm_sum n get maximum)(em_rvv_sum n get maximum).
Proof. intros;apply em_related_observe;apply em_sum_related. Qed.
Print Assumptions em_acc_step_related.
Print Assumptions em_pair_sum_related.
Print Assumptions em_tail_related.
Print Assumptions em_accumulate_related.
Print Assumptions em_sum_related.
Print Assumptions em_sum_observation.
