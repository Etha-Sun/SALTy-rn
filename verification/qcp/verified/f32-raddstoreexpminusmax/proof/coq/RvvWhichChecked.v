From Coq Require Import ZArith Lia.
From ExpMinusMax Require Import rvv_unit_goal RvvTactics RvvTailDomainFacts.
Import Snaive_C_Rules64. Local Open Scope sac. Local Open Scope Z_scope.
Module CheckedRvvWhich.
Lemma proof_of_test_rvv_which_implies_wit_1:ExpMinusMax.rvv_unit_goal.test_rvv_which_implies_wit_1.
Proof.
 unfold ExpMinusMax.rvv_unit_goal.test_rvv_which_implies_wit_1;right;intros S Q maximum P N W F Hvalid.
 apply (proj1(em_data_pop F maximum ltac:(eapply em_valid_maximum;eassumption))).
Qed.
Lemma proof_of_test_rvv_which_implies_wit_2:ExpMinusMax.rvv_unit_goal.test_rvv_which_implies_wit_2.
Proof.
 unfold ExpMinusMax.rvv_unit_goal.test_rvv_which_implies_wit_2;right;intros S Q maximum P N W F Hvalid.
 apply (proj2(em_data_pop F maximum ltac:(eapply em_valid_maximum;eassumption))).
Qed.
Lemma proof_of_test_rvv_which_implies_wit_3:ExpMinusMax.rvv_unit_goal.test_rvv_which_implies_wit_3.
Proof.
 unfold ExpMinusMax.rvv_unit_goal.test_rvv_which_implies_wit_3;left;intros S Q maximum P N W F Hvalid Hnonneg Hlt.
 destruct(em_rvv_tail_domains F W P maximum Q S N Hvalid Hnonneg)as[HR HW].
 entailer!.
Qed.
End CheckedRvvWhich.
Print Assumptions CheckedRvvWhich.proof_of_test_rvv_which_implies_wit_1.
Print Assumptions CheckedRvvWhich.proof_of_test_rvv_which_implies_wit_2.
Print Assumptions CheckedRvvWhich.proof_of_test_rvv_which_implies_wit_3.
