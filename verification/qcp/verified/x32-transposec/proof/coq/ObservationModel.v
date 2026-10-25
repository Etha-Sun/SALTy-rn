From X32Transpose Require Export AddressFacts TransposeObservation.
From Coq Require Import ZArith Lia List.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Definition xt_output_exact(O:XTOutput)(p x:Z):Prop:=O p=Some x.
Definition xt_output_rest(W:list Z)(O:XTOutput)(p:Z):Assertion:=xt_output(remove Z.eq_dec p W)O.
Definition xt_observation_address(p stride row column:Z):Z:=xt_mod64(p+column*stride+row*4).
Lemma xt_observation_address_exact:forall F W G row column,
 xt_valid F W G->0<=row<xt_height G->0<=column<xt_cols G->
 xt_observation_address(xt_output_base G)(xt_output_stride G)row column=xt_output_address G row column.
Proof.
 intros;pose proof(xt_output_address_bounds F W G row column H H0 H1).
 unfold xt_observation_address,xt_output_address,xt_mod64 in *.
 replace(row*4)with(4*row)by ring;apply Z.mod_small;lia.
Qed.
Lemma xt_result_observation:forall F W G old current row column,
 xt_valid F W G->0<=row<xt_height G->0<=column<xt_cols G->xt_result F G old current->
 xt_output_exact current(xt_observation_address(xt_output_base G)(xt_output_stride G)row column)(xt_get F(xt_input_address G row column)).
Proof.
 intros F W G old current row column Hv Hr Hc[Hvalues Hframe].
 unfold xt_output_exact;rewrite(xt_observation_address_exact F W G row column Hv Hr Hc);apply Hvalues;assumption.
Qed.
Lemma xt_result_chain:forall F G old middle current,
 xt_result F G old middle->xt_result F G middle current->xt_result F G old current.
Proof.
 intros F G old middle current[Hfirst Hframe1][Hsecond Hframe2];split;[exact Hsecond|].
 intros q Hq;rewrite Hframe2,Hframe1 by exact Hq;reflexivity.
Qed.
Print Assumptions xt_observation_address_exact.
Print Assumptions xt_result_observation.
Print Assumptions xt_result_chain.
