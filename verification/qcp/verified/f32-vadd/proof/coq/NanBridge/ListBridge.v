From Coq Require Import List ZArith Lia.
From AUXLib Require Import ListLib.
Import ListNotations.
Open Scope Z_scope.

Lemma related_nth {A B : Type} (R : A -> B -> Prop) :
  forall xs ys, Forall2 R xs ys ->
  forall i da db, (i < length xs)%nat ->
  R (nth i xs da) (nth i ys db).
Proof.
  intros xs ys H. induction H; intros i da db Hi.
  - simpl in Hi. lia.
  - destruct i; simpl in *; auto. apply IHForall2. lia.
Qed.

Lemma related_nth_error {A B : Type} (R : A -> B -> Prop) :
  forall xs ys, Forall2 R xs ys ->
  forall i x y, nth_error xs i = Some x -> nth_error ys i = Some y -> R x y.
Proof.
  intros xs ys H. induction H; intros i x' y' Hx Hy.
  - destruct i; discriminate.
  - destruct i; simpl in *.
    + inversion Hx; inversion Hy; subst. assumption.
    + eapply IHForall2; eauto.
Qed.

Lemma related_Znth {A B : Type} (R : A -> B -> Prop) :
  forall xs ys, Forall2 R xs ys ->
  forall i da db, 0 <= i < Z.of_nat (length xs) ->
  R (Znth i xs da) (Znth i ys db).
Proof.
  intros xs ys H i da db Hi.
  unfold Znth. apply related_nth; [exact H | lia].
Qed.
Print Assumptions related_Znth.
Print Assumptions related_nth.
Print Assumptions related_nth_error.
