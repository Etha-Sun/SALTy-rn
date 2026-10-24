From Coq Require Import ZArith List.
From SimpleC.SL Require Export Mem SeparationLogic.
From Flocq Require Import Core.Raux.
Import ListNotations.
Open Scope Z_scope.

Definition same_value (a b : fp32) : Prop :=
  fp32_eq a b \/ (fp32_isNaN a /\ fp32_isNaN b).

Definition bit_same (x y : fp32) : Prop := x = y.
Definition returned_one (r : Z) : Prop := r = 1%Z.
Lemma nan_self_ne : forall x, fp32_isNaN x -> fp32_ne x x.
Proof.
  intros x H. destruct x; try discriminate H.
  unfold fp32_ne, fp32_compare. simpl. discriminate.
Qed.
Lemma same_ne_nan : forall x y,
  same_value x y -> fp32_ne x y -> fp32_isNaN x /\ fp32_isNaN y.
Proof.
  intros x y [Heq | Hnan] Hne; [contradiction | exact Hnan].
Qed.
Lemma same_ne_left_self_eq_false : forall x y,
  same_value x y -> fp32_ne x y -> fp32_eq x x -> False.
Proof.
  intros x y Hsame Hne Heq.
  apply (nan_self_ne x (proj1 (same_ne_nan x y Hsame Hne))). exact Heq.
Qed.
Lemma same_ne_right_self_eq_false : forall x y,
  same_value x y -> fp32_ne x y -> fp32_eq y y -> False.
Proof.
  intros x y Hsame Hne Heq.
  apply (nan_self_ne y (proj2 (same_ne_nan x y Hsame Hne))). exact Heq.
Qed.
Print Assumptions nan_self_ne.
Print Assumptions same_ne_left_self_eq_false.
Print Assumptions same_ne_right_self_eq_false.

Definition original_observation (x y : fp32) : Prop :=
  fp32_eq x y \/ (fp32_ne x x /\ fp32_ne y y).
Definition copied_observation (x y xc yc : fp32) : Prop :=
  fp32_eq x y \/ (fp32_ne x xc /\ fp32_ne y yc).

Lemma identity_comparison_preserves_observation : forall x y xc yc,
  bit_same xc x -> bit_same yc y ->
  (original_observation x y <-> copied_observation x y xc yc).
Proof. unfold bit_same; intros; subst; reflexivity. Qed.

Print Assumptions identity_comparison_preserves_observation.
