From Coq Require Import ZArith Lia String List.
From S8Clamp Require Export RvvFrame RvvFacts rvv_arithmetic_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Ltac rvv_arith_pure := intros; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia.

Lemma rvv_char_range_frame : forall p v (R:Assertion),
 (p # Char |-> v ** R) |-- “ -128<=v ” && “ v<=127 ”.
Proof.
 intros p v R. eapply derivable1_trans.
 - apply derivable1_sepcon_mono; [apply store_char_range|apply derivable1_refl].
 - change Byte.min_signed with (-128); change Byte.max_signed with 127. entailer!.
Qed.

Lemma rvv_pull_left_tree : forall P A q R : Assertion,
 (P |-- q ** R) -> (P ** A |-- q ** (R ** A)).
Proof.
 intros P A q R H. eapply derivable1_trans.
 - apply derivable1_sepcon_mono; [exact H|apply derivable1_refl].
 - rewrite logic_equiv_sepcon_assoc. apply derivable1_refl.
Qed.
Ltac rvv_pull_tree q :=
 lazymatch goal with
 | |- q ** ?R |-- _ => apply derivable1_refl
 | |- q |-- q ** ?R => unify R emp; rewrite logic_equiv_sepcon_emp; apply derivable1_refl
 | |- ?A ** ?B |-- _ =>
   first [eapply rvv_pull_left_tree; rvv_pull_tree q
         |eapply rvv_pull_through; rvv_pull_tree q]
 end.

Ltac rvv_int_frame :=
 unfold UndefStructPredvint8m8_t;
 rewrite ?local_field_address;
 repeat progress rewrite <- logic_equiv_andp_assoc;
 first [apply _derivable1_andp_intros;
 [unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia
 |sepcon_assoc_change; fast_cancel]
 |sepcon_assoc_change; fast_cancel].

Ltac rvv_char_bounds p v :=
 eapply (derivable1_trans _ (p # Char |-> v ** _));
 [rvv_pull_tree (p # Char |-> v)
 |eapply (derivable1_trans _ (“ -128<=v ” && “ v<=127 ”));
  [apply rvv_char_range_frame
  |unfold derivable1,andp,coq_prop; intros m (Hlo&Hhi);
   repeat first [assumption|split|reflexivity];lia]].
