From X32Transpose Require Export NeonAccessFacts ProgressFacts VectorModel.
From Coq Require Import ZArith Lia FunctionalExtensionality.
Local Open Scope Z_scope.
Lemma xt_output_put_swap:forall O p q a b,p<>q->
 xt_output_put(xt_output_put O p a)q b=xt_output_put(xt_output_put O q b)p a.
Proof.
 intros;apply functional_extensionality;intro x;unfold xt_output_put,xt_put.
 destruct(Z.eqb_spec x p);destruct(Z.eqb_spec x q);subst;try congruence;reflexivity.
Qed.
Lemma xt_output_put_override:forall O p a b,
 xt_output_put(xt_output_put O p a)p b=xt_output_put O p b.
Proof.
 intros;apply functional_extensionality;intro x;unfold xt_output_put,xt_put.
 destruct(Z.eqb_spec x p);reflexivity.
Qed.
Lemma xt_write_pair_override:forall O p a b c d,
 xt_write_pair(xt_write_pair O p a b)p c d=xt_write_pair O p c d.
Proof.
 intros;unfold xt_write_pair.
 rewrite(xt_output_put_swap(xt_output_put O p a)(p+4)p b c)by lia.
 rewrite !xt_output_put_override;reflexivity.
Qed.
Lemma xt_progress_two_columns_step:forall F G O R k row,
 xt_injective G->0<=k->k+2<=xt_cols G->0<=row<xt_height G->
 xt_progress F G O R k 2 row->
 xt_progress F G O
 (xt_output_put(xt_output_put R(xt_output_address G row(k+1))(xt_get F(xt_input_address G row(k+1))))
  (xt_output_address G row k)(xt_get F(xt_input_address G row k)))k 2(row+1).
Proof.
 intros F G O R k row Hi Hk Hend Hr H;unfold xt_progress in *.
 eapply xt_done_ext;[|eapply xt_done_put;[exact Hi|unfold xt_matrix;split;lia|];eapply xt_done_put;[exact Hi|unfold xt_matrix;split;lia|exact H]].
 intros r c [[Hr1 Hr2][Hc1 Hc2]];unfold xt_region;lia.
Qed.
Lemma xt_neon_bulk_two_columns:forall F G O R k row,
 xt_injective G->0<=k->k+2<=xt_cols G->0<=row->row+2<=xt_height G->
 xt_progress F G O R k 2 row->
 xt_progress F G O
 (xt_write_pair
   (xt_write_pair R(xt_output_address G row(k+1))
     (xt_get F(xt_input_address G row(k+1)))(xt_get F(xt_input_address G(row+1)(k+1))))
   (xt_output_address G row k)
   (xt_get F(xt_input_address G row k))(xt_get F(xt_input_address G(row+1)k)))k 2(row+2).
Proof.
 intros F G O R k row Hi Hk Hcols Hr Hend Hprog.
 unfold xt_write_pair.
 replace(xt_output_address G row(k+1)+4)with(xt_output_address G(row+1)(k+1))by(unfold xt_output_address;ring).
 replace(xt_output_address G row k+4)with(xt_output_address G(row+1)k)by(unfold xt_output_address;ring).
 assert(Hdiff:xt_output_address G(row+1)(k+1)<>xt_output_address G row k).
 { intro E;destruct(Hi(row+1)(k+1)row k ltac:(unfold xt_matrix;split;lia)ltac:(unfold xt_matrix;split;lia)E);lia. }
 rewrite xt_output_put_swap with(p:=xt_output_address G(row+1)(k+1))(q:=xt_output_address G row k)by exact Hdiff.
 replace(row+2)with((row+1)+1)by ring.
 apply xt_progress_two_columns_step;try lia;[exact Hi|].
 apply xt_progress_two_columns_step;try lia;assumption.
Qed.
Lemma xt_neon_bulk_one_column:forall F G O R k row bad0 bad1,
 xt_injective G->0<=k<xt_cols G->0<=row->row+2<=xt_height G->
 xt_progress F G O R k 1 row->
 xt_progress F G O
 (xt_write_pair(xt_write_pair R(xt_output_address G row k)bad0 bad1)
  (xt_output_address G row k)(xt_get F(xt_input_address G row k))(xt_get F(xt_input_address G(row+1)k)))k 1(row+2).
Proof.
 intros F G O R k row bad0 bad1 Hi Hk Hr Hend Hprog.
 rewrite xt_write_pair_override;unfold xt_write_pair.
 replace(xt_output_address G row k+4)with(xt_output_address G(row+1)k)by(unfold xt_output_address;ring).
 replace(row+2)with((row+1)+1)by ring.
 apply xt_progress_single_step;try lia;[exact Hi|].
 apply xt_progress_single_step;try lia;assumption.
Qed.
Print Assumptions xt_output_put_swap.
Print Assumptions xt_output_put_override.
Print Assumptions xt_write_pair_override.
Print Assumptions xt_progress_two_columns_step.
Print Assumptions xt_neon_bulk_two_columns.
Print Assumptions xt_neon_bulk_one_column.
