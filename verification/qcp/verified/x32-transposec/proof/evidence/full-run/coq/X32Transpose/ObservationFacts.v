From X32Transpose Require Export ObservationModel.
From Coq Require Import ZArith Lia List.
Local Open Scope Z_scope.
Lemma xt_observation_access:forall F W G row column,
 xt_valid F W G->0<=row<xt_height G->0<=column<xt_cols G->
 NoDup W /\ 0<xt_observation_address(xt_output_base G)(xt_output_stride G)row column /\
 In(xt_observation_address(xt_output_base G)(xt_output_stride G)row column)W.
Proof.
 intros F W G row column Hv Hr Hc.
 rewrite(xt_observation_address_exact F W G row column Hv Hr Hc).
 pose proof(xt_output_address_bounds F W G row column Hv Hr Hc)as Hbound.
 destruct Hv as[He[Hf Hs]];specialize(Hs ltac:(lia));unfold xt_storage in Hs.
 destruct Hs as[_[_[_[_[_[_[_[_[_[Hnd[_ Howned]]]]]]]]]]].
 split;[exact Hnd|].
 split;[lia|apply Howned;assumption].
Qed.
Print Assumptions xt_observation_access.
