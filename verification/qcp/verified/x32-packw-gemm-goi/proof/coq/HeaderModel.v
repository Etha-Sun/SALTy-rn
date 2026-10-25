From Coq Require Import ZArith Lia List.
From X32Packw Require Import PackwModel.
From AUXLib Require Import ListLib.
Import ListNotations.
Open Scope Z_scope.
Definition pw_zero2 : list Z := [0;0].
Lemma pw_fill2_zero : forall OLD:list Z, Zlength OLD=2 ->
 replace_Znth 1 0 (replace_Znth 0 0 OLD)=pw_zero2.
Proof.
 intros OLD H;destruct OLD as [|a OLD];[rewrite Zlength_nil in H;lia|].
 rewrite Zlength_cons in H;destruct OLD as [|b OLD];[rewrite Zlength_nil in H;lia|].
 rewrite Zlength_cons in H;assert(OLD=[]) by (apply Zlength_nil_inv;lia);subst OLD;reflexivity.
Qed.
Lemma pw_header_copy1 : forall B OLD,
 pw_copy_prefix 1 B OLD=replace_Znth 0 (Znth 0 B 0) OLD.
Proof. reflexivity. Qed.
Lemma pw_header_copy2 : forall B OLD,
 pw_copy_prefix 2 B OLD=replace_Znth 1 (Znth 1 B 0) (replace_Znth 0 (Znth 0 B 0) OLD).
Proof. reflexivity. Qed.
Print Assumptions pw_fill2_zero.
Print Assumptions pw_header_copy1.
Print Assumptions pw_header_copy2.
