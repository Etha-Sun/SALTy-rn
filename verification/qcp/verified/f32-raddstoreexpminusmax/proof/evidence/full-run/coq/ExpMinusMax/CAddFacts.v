From Coq Require Import ZArith Bool.
From ExpMinusMax Require Export Model Observation ExpressionModel ExpressionFacts.
Lemma em_rel_sym:forall a b,em_rel a b->em_rel b a.
Proof. intros a b [H|[H1 H2]];[left;congruence|right;tauto]. Qed.
Lemma em_rel_trans:forall a b c,em_rel a b->em_rel b c->em_rel a c.
Proof. intros a b c [->|[Na Nb]] [<-|[Nb' Nc]];unfold em_rel;auto. Qed.
Lemma em_canonicalize_related:forall x,em_rel(em_canonicalize x)x.
Proof.
 intros x;unfold em_canonicalize;destruct(em_nan x)eqn:E.
 - right;split;[exact em_qnan_nan|exact E].
 - left;reflexivity.
Qed.
Lemma em_rvv_cadd_same:forall a b,em_rel(em_rvv_add a b)(fp32_add a b).
Proof. intros;apply em_canonicalize_related. Qed.
Lemma em_arm_cadd_same:forall a b,em_rel(em_arm_add a b)(fp32_add a b).
Proof.
 intros;eapply em_rel_trans;[apply em_binary_same;exact em_add_nan|apply em_canonicalize_related].
Qed.
Lemma em_cadd_related:forall a a' b b',em_rel a a'->em_rel b b'->em_rel(fp32_add a b)(fp32_add a' b').
Proof.
 intros a a' b b' [->|[Na Na']] [->|[Nb Nb']];try(left;reflexivity).
 all:right;split;apply em_add_nan;tauto.
Qed.
Lemma em_arm_cadd_related:forall a a' b b',em_rel a a'->em_rel b b'->em_rel(em_arm_add a b)(fp32_add a' b').
Proof. intros;eapply em_rel_trans;[apply em_arm_cadd_same|apply em_cadd_related;assumption]. Qed.
Print Assumptions em_rel_trans.
Print Assumptions em_cadd_related.
Print Assumptions em_arm_cadd_related.
