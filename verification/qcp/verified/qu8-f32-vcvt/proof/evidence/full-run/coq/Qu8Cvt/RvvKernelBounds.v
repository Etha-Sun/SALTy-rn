From Qu8Cvt Require Export KernelBounds RvvModel.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma cvt_ushort_range_frame : forall p v(R:Assertion),
 (p # UShort |-> v ** R)|-- “ 0<=v ” && “ v<=65535 ”.
Proof. intros;eapply derivable1_trans.
 apply derivable1_sepcon_mono;[apply store_ushort_range|apply derivable1_refl]. entailer!. Qed.
Ltac cvt_ushort_bounds p v :=
 eapply(derivable1_trans _ (p # UShort |-> v ** _));
 [cvt_pull_tree(p # UShort |-> v)
 |eapply(derivable1_trans _ (“ 0<=v ” && “ v<=65535 ”));
 [apply cvt_ushort_range_frame|unfold derivable1,andp,coq_prop;intros m(Hlo&Hhi);lia]].
Ltac cvt_unsigned_lookup P v :=
 first[let p:=lazymatch P with context[?p # UShort |-> v]=>constr:(p)end in cvt_ushort_bounds p v|cvt_lookup_bounds P v].
Ltac cvt_unsigned_atom :=
 first[match goal with |-?P|-- “ ?lo <= ?v ”=>cvt_unsigned_lookup P v end
 |match goal with |-?P|-- “ ?v <= ?hi ”=>cvt_unsigned_lookup P v end
 |match goal with |-_|-- “ ?lo <= cvt_s16 ?x ”=>unfold derivable1,coq_prop;intros;pose proof(cvt_s16_range x);lia end
 |match goal with |-_|-- “ cvt_s16 ?x <= ?hi ”=>unfold derivable1,coq_prop;intros;pose proof(cvt_s16_range x);lia end
 |cvt_atom_bound].
Ltac cvt_unsigned_bounds := first[solve[cvt_pure]|apply _derivable1_andp_intros;[cvt_unsigned_bounds|cvt_unsigned_bounds]|cvt_unsigned_atom].
Ltac cvt_unsigned_frame :=
 first[solve[cvt_unsigned_bounds]
 |apply _derivable1_andp_intros;[cvt_unsigned_bounds|cvt_unsigned_frame]
 |opaque_leaves;sepcon_assoc_change;fast_cancel].
Ltac cvt_unsigned_complete :=
 first[solve[intros;unfold cvt_same,fp32_bits_equal in *;subst;
 rewrite ?sizeof_uchar,?sizeof_float in *;
 unfold UndefStructPreduint16x8_t,UndefStructPredvuint16m4_t;cvt_unroll;
 repeat progress rewrite <-logic_equiv_andp_assoc;cvt_unsigned_frame]
 |solve[cvt_simple]].
