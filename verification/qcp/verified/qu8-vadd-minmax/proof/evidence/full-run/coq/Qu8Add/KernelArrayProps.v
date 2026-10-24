From Qu8Add Require Export KernelBounds.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma qu_prop_sep_left : forall (P Q:Assertion)(F:Prop),
 (P |-- “ F ”) -> (P ** Q |-- “ F ”).
Proof. unfold derivable1,sepcon,coq_prop;firstorder. Qed.
Lemma qu_prop_sep_right : forall (P Q:Assertion)(F:Prop),
 (Q |-- “ F ”) -> (P ** Q |-- “ F ”).
Proof. unfold derivable1,sepcon,coq_prop;firstorder. Qed.
Lemma qu_prop_keep : forall (P:Assertion)(F:Prop),
 (P |-- “ F ”) -> (P |-- “ F ” && P).
Proof. unfold derivable1,andp,coq_prop;firstorder. Qed.
Ltac qu_extract_array_values q :=
 lazymatch goal with
 | |- q |-- _ => apply qu_full_values
 | |- ?P && ?Q |-- _ =>
   first[eapply derivable1_trans;[apply derivable1_andp_elim1|qu_extract_array_values q]
        |eapply derivable1_trans;[apply derivable1_andp_elim2|qu_extract_array_values q]]
 | |- ?P ** ?Q |-- _ =>
   first[eapply qu_prop_sep_left;qu_extract_array_values q
        |eapply qu_prop_sep_right;qu_extract_array_values q]
 end.
Ltac qu_array_values p n xs Hname :=
 eapply derivable1_trans;
 [eapply qu_prop_keep;qu_extract_array_values (UCharArray.full p n xs)|];
 Intros_p Hname.
