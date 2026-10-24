From Qs8Add Require Export NeonKernelCallAutomation.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma qa_neon_call_pull_left_tree : forall P A q R : Assertion,
 (P |-- q ** R) -> (P ** A |-- q ** (R ** A)).
Proof.
 intros P A q R H. eapply derivable1_trans.
 - apply derivable1_sepcon_mono;[exact H|apply derivable1_refl].
 - rewrite logic_equiv_sepcon_assoc;apply derivable1_refl.
Qed.
Ltac qa_neon_call_pull_tree q :=
 lazymatch goal with
 | |- q ** ?R |-- _ => apply derivable1_refl
 | |- q |-- q ** ?R => unify R emp;rewrite logic_equiv_sepcon_emp;apply derivable1_refl
 | |- ?A ** ?B |-- _ => first[eapply qa_neon_call_pull_left_tree;qa_neon_call_pull_tree q|eapply rvv_pull_through;qa_neon_call_pull_tree q]
 end.
Ltac qa_neon_split_undef_prefix k :=
 lazymatch goal with |- ?P |-- ?Q =>
  lazymatch P with context[CharArray.undef_full ?p ?n] =>
   eapply(derivable1_trans P(CharArray.undef_full p n ** _)Q);
   [qa_neon_call_pull_tree(CharArray.undef_full p n)|
    eapply derivable1_trans;
    [apply derivable1_sepcon_mono;
     [apply(CharArray.undef_full_split_to_undef_full p k n);lia|apply derivable1_refl]
    |]]
  end
 end.

Ltac qa_neon_clean_emp :=
 repeat first[
  match goal with |-context[emp ** ?P]=>rewrite(logic_equiv_sepcon_comm emp P),logic_equiv_sepcon_emp end
  |rewrite logic_equiv_sepcon_emp].
Ltac qa_neon_split_frame k := qa_neon_split_undef_prefix k;rewrite ?sizeof_char,?Z.mul_1_r;repeat rewrite Z.add_assoc;qa_neon_clean_emp;qa_kernel_call_frame.
