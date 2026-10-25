From MaxPool Require Export RvvAutomation.
Import Snaive_C_Rules64. Local Open Scope sac.
Lemma mp_tree_pull_left:forall A B q R,
 (A |-- q ** R)->(A ** B |-- q ** (R ** B)).
Proof. intros; eapply derivable1_trans.
 - apply derivable1_sepcon_mono;[exact H|apply derivable1_refl].
 - rewrite (logic_equiv_sepcon_assoc q R B);apply derivable1_refl.
Qed.
Lemma mp_tree_cancel_right:forall P q R Q,
 (P |-- q ** R)->(R |-- Q)->(P |-- Q ** q).
Proof. intros; eapply derivable1_trans;[exact H|].
 eapply derivable1_trans.
 - apply derivable1_sepcon_mono;[apply derivable1_refl|exact H0].
 - apply derivable1_sepcon_comm.
Qed.
Lemma mp_tree_rhs_assoc:forall P A B C,
 (P |-- (A ** B) ** C)->(P |-- A ** (B ** C)).
Proof. intros;rewrite (logic_equiv_sepcon_assoc A B C);exact H. Qed.
Ltac mp_tree_pull q :=
 lazymatch goal with
 | |- q ** ?R |-- q ** ?S => apply derivable1_refl
 | |- ?L ** q |-- q ** ?S => apply derivable1_sepcon_comm
 | |- ?A ** ?B |-- q ** ?S =>
   first[eapply mp_tree_pull_left;mp_tree_pull q
        |eapply mp_pull_through;mp_tree_pull q]
 end.
Ltac mp_tree_cancel :=
 lazymatch goal with
 | |- ?P |-- ?P => apply derivable1_refl
 | |- ?P |-- ?A ** (?B ** ?C) => apply mp_tree_rhs_assoc;mp_tree_cancel
 | |- ?P |-- ?A ** ?q => eapply mp_tree_cancel_right;[mp_tree_pull q|mp_tree_cancel]
 end.
