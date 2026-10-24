From Qs8Add Require Export RvvKernelArithmeticAutomation3 RvvKernelResourceFrame.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma qa_call_pull_left_tree : forall P A q R : Assertion,
 (P |-- q ** R) -> (P ** A |-- q ** (R ** A)).
Proof.
 intros P A q R H;eapply derivable1_trans.
 - apply derivable1_sepcon_mono;[exact H|apply derivable1_refl].
 - rewrite logic_equiv_sepcon_assoc;apply derivable1_refl.
Qed.
Ltac qa_call_pull_tree q :=
 lazymatch goal with
 | |- q ** ?R |-- _ => apply derivable1_refl
 | |- q |-- q ** ?R => unify R emp;rewrite logic_equiv_sepcon_emp;apply derivable1_refl
 | |- ?A ** ?B |-- _ => first[eapply qa_call_pull_left_tree;qa_call_pull_tree q|eapply rvv_pull_through;qa_call_pull_tree q]
 end.
Lemma qa_undef_full_split_store : forall p k n,
 0<=k<=n -> CharArray.undef_full p n |--
 CharArray.undef_seg p 0 k ** CharArray.undef_full(p+k*sizeof(CHAR))(n-k).
Proof.
 intros p k n H;eapply derivable1_trans.
 - apply(CharArray.undef_full_split_to_undef_full p k n);exact H.
 - apply derivable1_sepcon_mono;[apply CharArray.undef_full_to_undef_seg|apply derivable1_refl].
Qed.
Ltac qa_call_split_store :=
 lazymatch goal with |-?P|--?Q =>
  lazymatch Q with context[CharArray.undef_seg ?p 0 ?k]=>
   lazymatch P with context[CharArray.undef_full p ?n]=>
    eapply(derivable1_trans P(CharArray.undef_full p n ** _)Q);
    [qa_call_pull_tree(CharArray.undef_full p n)|
     eapply derivable1_trans;
     [apply derivable1_sepcon_mono;[apply(qa_undef_full_split_store p k n);lia|apply derivable1_refl]|]]
   end
  end
 end.
Ltac qa_call_store_frame := qa_call_split_store;qa_clean_emp;qa_rvv_kernel_arith_frame.
