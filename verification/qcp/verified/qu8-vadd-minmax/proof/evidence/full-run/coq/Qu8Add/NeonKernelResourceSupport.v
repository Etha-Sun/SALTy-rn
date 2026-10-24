From Qu8Add Require Export NeonKernelCallAutomation.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma qu_pull_left_tree : forall P A q R : Assertion,
 (P |-- q ** R) -> (P ** A |-- q ** (R ** A)).
Proof.
 intros P A q R H. eapply derivable1_trans.
 - apply derivable1_sepcon_mono;[exact H|apply derivable1_refl].
 - rewrite logic_equiv_sepcon_assoc;apply derivable1_refl.
Qed.
Ltac qu_pull_tree q :=
 lazymatch goal with
 | |- q ** ?R |-- _ => apply derivable1_refl
 | |- q |-- q ** ?R => unify R emp;rewrite logic_equiv_sepcon_emp;apply derivable1_refl
 | |- ?A ** ?B |-- _ => first[eapply qu_pull_left_tree;qu_pull_tree q|eapply rvv_pull_through;qu_pull_tree q]
 end.
Ltac qu_split_undef_prefix k :=
 lazymatch goal with |- ?P |-- ?Q =>
  lazymatch P with context[UCharArray.undef_full ?p ?n] =>
   eapply(derivable1_trans P(UCharArray.undef_full p n ** _)Q);
   [qu_pull_tree(UCharArray.undef_full p n)|
    eapply derivable1_trans;
    [apply derivable1_sepcon_mono;
     [apply(UCharArray.undef_full_split_to_undef_full p k n);lia|apply derivable1_refl]
    |]]
  end
 end.
