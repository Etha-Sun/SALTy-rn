From Coq Require Import ZArith Lia.
From Qs8Mul Require Export ActiveModel AddressFacts FastFrame.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Lemma qm_lane_match_active : forall i vl x y,
 i<vl -> qm_lane_match i vl x y -> x=y.
Proof. unfold qm_lane_match;intros;destruct H0;[lia|assumption]. Qed.
Lemma qm_fp_lane_match_active : forall i vl x y,
 i<vl -> qm_fp_lane_match i vl x y -> x=y.
Proof. unfold qm_fp_lane_match;intros;destruct H0;[lia|assumption]. Qed.
Ltac qm_pure_fact := first[assumption|reflexivity|lia
 |match goal with H:qm_lane_match ?i ?vl ?x ?y |- ?x = ?y =>eapply (qm_lane_match_active i vl x y);[lia|exact H]end].
Ltac qm_pure := unfold derivable1,andp,coq_prop;intros;
 repeat match goal with |- _ /\ _=>split end;qm_pure_fact.
Print Assumptions qm_lane_match_active.
Print Assumptions qm_fp_lane_match_active.
