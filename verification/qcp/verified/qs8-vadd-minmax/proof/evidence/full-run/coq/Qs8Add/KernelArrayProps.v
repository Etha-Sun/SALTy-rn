From Qs8Add Require Export KernelBounds.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma qa_prop_sep_left : forall (P Q:Assertion)(F:Prop),
 (P |-- “ F ”) -> (P ** Q |-- “ F ”).
Proof. unfold derivable1,sepcon,coq_prop;firstorder. Qed.
Lemma qa_prop_sep_right : forall (P Q:Assertion)(F:Prop),
 (Q |-- “ F ”) -> (P ** Q |-- “ F ”).
Proof. unfold derivable1,sepcon,coq_prop;firstorder. Qed.
Lemma qa_prop_keep : forall (P:Assertion)(F:Prop),
 (P |-- “ F ”) -> (P |-- “ F ” && P).
Proof. unfold derivable1,andp,coq_prop;firstorder. Qed.
Ltac qa_extract_array_values q :=
 lazymatch goal with
 | |- q |-- _ => apply qa_full_values
 | |- ?P && ?Q |-- _ =>
   first[eapply derivable1_trans;[apply derivable1_andp_elim1|qa_extract_array_values q]
        |eapply derivable1_trans;[apply derivable1_andp_elim2|qa_extract_array_values q]]
 | |- ?P ** ?Q |-- _ =>
   first[eapply qa_prop_sep_left;qa_extract_array_values q
        |eapply qa_prop_sep_right;qa_extract_array_values q]
 end.
Ltac qa_array_values p n xs Hname :=
 eapply derivable1_trans;
 [eapply qa_prop_keep;qa_extract_array_values (CharArray.full p n xs)|];
 Intros_p Hname.
