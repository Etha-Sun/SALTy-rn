From Coq Require Import ZArith List Lia Ring FunctionalExtensionality.
From X32Packw Require Export ProgramModel.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.
Lemma pw_put_commute:forall O p q a b,p<>q->
 pw_output_put(pw_output_put O p a)q b=pw_output_put(pw_output_put O q b)p a.
Proof.
 intros O p q a b Hneq;apply functional_extensionality;intro r.
 unfold pw_output_put,pw_put.
 destruct(Z.eqb_spec r p), (Z.eqb_spec r q);try reflexivity;congruence.
Qed.
Lemma pw_strided_put_away:forall count A p O q x,
 (forall i:nat,(i<count)%nat->q<>p+8*Z.of_nat i)->
 pw_strided_nat count A p(pw_output_put O q x)=
 pw_output_put(pw_strided_nat count A p O)q x.
Proof.
 induction count as[|count IH];intros A p O q x Haway;[reflexivity|].
 cbn[pw_strided_nat];rewrite IH by(intros;apply Haway;lia).
 apply pw_put_commute;intro E;apply(Haway count ltac:(lia));congruence.
Qed.
Lemma pw_two_strides_segmented:forall n A B p O,
 pw_strided_nat n B(p+4)(pw_strided_nat n A p O)=pw_segmented_nat n A B p O.
Proof.
 induction n as[|n IH];intros A B p O;[reflexivity|].
 cbn[pw_strided_nat pw_segmented_nat].
 rewrite pw_strided_put_away by(intros i Hi;lia).
 rewrite IH;unfold pw_write_pair;f_equal;ring.
Qed.
Lemma pw_two_strides_segmented_Z:forall n A B p O,
 pw_strided n B(p+4)(pw_strided n A p O)=pw_segmented n A B p O.
Proof. intros;apply pw_two_strides_segmented. Qed.
Print Assumptions pw_put_commute.
Print Assumptions pw_strided_put_away.
Print Assumptions pw_two_strides_segmented.
Print Assumptions pw_two_strides_segmented_Z.
