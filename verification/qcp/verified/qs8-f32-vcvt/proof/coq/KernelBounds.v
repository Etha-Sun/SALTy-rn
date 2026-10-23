From Coq Require Export ZArith Lia List.
From Qs8Cvt Require Export KernelCallsSupport.
From QcpVadd Require Export VaddBits.
Export Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma cvt_pull_left_tree : forall P A q R : Assertion,
 (P |-- q ** R) -> (P ** A |-- q ** (R ** A)).
Proof. intros P A q R H;eapply derivable1_trans.
 apply derivable1_sepcon_mono;[exact H|apply derivable1_refl].
 rewrite logic_equiv_sepcon_assoc;apply derivable1_refl. Qed.
Ltac cvt_pull_tree q :=
 lazymatch goal with
 | |- q ** ?R |-- _ => apply derivable1_refl
 | |- q |-- q ** ?R => unify R emp;rewrite logic_equiv_sepcon_emp;apply derivable1_refl
 | |- ?A ** ?B |-- _ => first[eapply cvt_pull_left_tree;cvt_pull_tree q|eapply rvv_pull_through;cvt_pull_tree q]
 end.
Lemma cvt_char_range_frame : forall p v (R:Assertion),
 (p # Char |-> v ** R) |-- “ -128<=v ” && “ v<=127 ”.
Proof.
 intros p v R;eapply derivable1_trans.
 apply derivable1_sepcon_mono;[apply store_char_range|apply derivable1_refl].
 change Byte.min_signed with(-128);change Byte.max_signed with 127.
 entailer!. Qed.
Ltac cvt_char_bounds p v :=
 eapply(derivable1_trans _ (p # Char |-> v ** _));
 [cvt_pull_tree(p # Char |-> v)
 |eapply(derivable1_trans _ (“ -128<=v ” && “ v<=127 ”));
 [apply cvt_char_range_frame|unfold derivable1,andp,coq_prop;intros m(Hlo&Hhi);lia]].
Lemma cvt_short_range_frame : forall p v (R:Assertion),
 (p # Short |-> v ** R) |-- “ -32768<=v ” && “ v<=32767 ”.
Proof.
 intros p v R;eapply derivable1_trans.
 apply derivable1_sepcon_mono;[apply store_short_range|apply derivable1_refl].
 entailer!. Qed.
Ltac cvt_short_bounds p v :=
 eapply(derivable1_trans _ (p # Short |-> v ** _));
 [cvt_pull_tree(p # Short |-> v)
 |eapply(derivable1_trans _ (“ -32768<=v ” && “ v<=32767 ”));
 [apply cvt_short_range_frame|unfold derivable1,andp,coq_prop;intros m(Hlo&Hhi);lia]].
Lemma cvt_int_range_frame : forall p v (R:Assertion),
 (p # Int |-> v ** R) |-- “ -2147483648<=v ” && “ v<=2147483647 ”.
Proof.
 intros p v R;eapply derivable1_trans.
 apply derivable1_sepcon_mono;[apply store_int_range|apply derivable1_refl].
 change Int.min_signed with(-2147483648);change Int.max_signed with 2147483647.
 entailer!. Qed.
Ltac cvt_int_bounds p v :=
 eapply(derivable1_trans _ (p # Int |-> v ** _));
 [cvt_pull_tree(p # Int |-> v)
 |eapply(derivable1_trans _ (“ -2147483648<=v ” && “ v<=2147483647 ”));
 [apply cvt_int_range_frame|unfold derivable1,andp,coq_prop;intros m(Hlo&Hhi);lia]].
Ltac cvt_lookup_bounds P v :=
 first[let p:=lazymatch P with context[?p # Char |-> v]=>constr:(p)end in cvt_char_bounds p v
 |let p:=lazymatch P with context[?p # Short |-> v]=>constr:(p)end in cvt_short_bounds p v
 |let p:=lazymatch P with context[?p # Int |-> v]=>constr:(p)end in cvt_int_bounds p v].
Ltac cvt_atom_bound :=
 first[match goal with |-?P|-- “ ?lo <= ?v ”=>cvt_lookup_bounds P v end
 |match goal with |-?P|-- “ ?v <= ?hi ”=>cvt_lookup_bounds P v end
 |match goal with |-_|-- “ ?lo <= cvt_seed ?z ”=>
 unfold derivable1,coq_prop;intros;pose proof(cvt_seed_range z);lia end
 |match goal with |-_|-- “ cvt_seed ?z <= ?hi ”=>
 unfold derivable1,coq_prop;intros;pose proof(cvt_seed_range z);lia end
 |match goal with |-_|-- “ ?lo <= cvt_addw ?a ?b ”=>
 unfold derivable1,coq_prop;intros;pose proof(cvt_addw_range a b);lia end
 |match goal with |-_|-- “ cvt_addw ?a ?b <= ?hi ”=>
 unfold derivable1,coq_prop;intros;pose proof(cvt_addw_range a b);lia end].
Ltac cvt_bounds := first[solve[cvt_pure]|apply _derivable1_andp_intros;[cvt_bounds|cvt_bounds]|cvt_atom_bound].
Ltac cvt_complete_frame :=
 first[solve[cvt_bounds]
 |apply _derivable1_andp_intros;[cvt_bounds|cvt_complete_frame]
 |opaque_leaves;sepcon_assoc_change;fast_cancel].
Ltac cvt_complete :=
 first[solve[intros;unfold cvt_same,fp32_bits_equal in *;subst;
 rewrite ?sizeof_char,?sizeof_float in *;cvt_unroll;
 repeat progress rewrite <-logic_equiv_andp_assoc;cvt_complete_frame]
 |solve[cvt_simple]].
