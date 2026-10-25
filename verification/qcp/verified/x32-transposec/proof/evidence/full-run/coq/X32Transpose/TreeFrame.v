(* Source pattern verification/qcp/candidates/f32-maxpool/proof/coq/RvvTreeFrame.v SHA256 2e295df2714e9e6ae00272f07f27187c015e3737ad24d4b023fdb2ccc0ebce53. Freshly recompiled under X32Transpose; no transferred credit. *)
From X32Transpose Require Export FastFrame.
Import Snaive_C_Rules64. Local Open Scope sac.
Lemma xt_tree_pull_left:forall A B q R,
 (A |-- q ** R)->(A ** B |-- q ** (R ** B)).
Proof. intros; eapply derivable1_trans.
 - apply derivable1_sepcon_mono;[exact H|apply derivable1_refl].
 - rewrite (logic_equiv_sepcon_assoc q R B);apply derivable1_refl.
Qed.
Lemma xt_tree_cancel_right:forall P q R Q,
 (P |-- q ** R)->(R |-- Q)->(P |-- Q ** q).
Proof. intros; eapply derivable1_trans;[exact H|].
 eapply derivable1_trans.
 - apply derivable1_sepcon_mono;[apply derivable1_refl|exact H0].
 - apply derivable1_sepcon_comm.
Qed.
Lemma xt_tree_rhs_assoc:forall P A B C,
 (P |-- (A ** B) ** C)->(P |-- A ** (B ** C)).
Proof. intros;rewrite (logic_equiv_sepcon_assoc A B C);exact H. Qed.
Ltac xt_tree_pull q :=
 lazymatch goal with
 | |- q ** ?R |-- q ** ?S => apply derivable1_refl
 | |- ?L ** q |-- q ** ?S => apply derivable1_sepcon_comm
 | |- ?A ** ?B |-- q ** ?S =>
   first[eapply xt_tree_pull_left;xt_tree_pull q
        |eapply xt_pull_through;xt_tree_pull q]
 end.
Ltac xt_tree_cancel :=
 lazymatch goal with
 | |- ?P |-- ?P => apply derivable1_refl
 | |- ?P |-- ?A ** (?B ** ?C) => apply xt_tree_rhs_assoc;xt_tree_cancel
 | |- ?P |-- ?A ** ?q => eapply xt_tree_cancel_right;[xt_tree_pull q|xt_tree_cancel]
 end.
