From Coq Require Import ZArith Lia List.
From Qu8Rdsum Require Import StoreModel RvvFacts ListFacts IndexFacts.
Local Open Scope Z_scope.

Lemma rd_results_nth : forall M base rows channels stride Init i,
 0<=i<channels ->
 Znth i(rd_results M base rows channels stride Init)0=
 rd_result_lane M base rows stride i Init.
Proof.
 intros;unfold rd_results,Znth at 1;rewrite rd_map_seq_nth by lia.
 cbn[Nat.add];rewrite Z2Nat.id by lia;reflexivity.
Qed.

Lemma rd_partial_initial : forall M base rows channels stride Init,
 rd_partial M base rows channels stride 0 Init=Init.
Proof. intros;reflexivity. Qed.

Lemma rd_partial_full : forall M base rows channels stride Init,
 0<=channels -> Zlength Init=channels ->
 rd_partial M base rows channels stride channels Init=
 rd_results M base rows channels stride Init.
Proof.
 intros;unfold rd_partial;change(rd_mix Init(rd_results M base rows channels stride Init)channels=rd_results M base rows channels stride Init).
 apply rd_mix_full;try assumption;apply rd_results_length;assumption.
Qed.

Lemma rd_partial_suffix : forall M base rows channels stride Init k i,
 0<=k<=i -> i<channels -> Zlength Init=channels ->
 Znth i(rd_partial M base rows channels stride k Init)0=Znth i Init 0.
Proof.
 intros;unfold rd_partial;change(Znth i(rd_mix Init(rd_results M base rows channels stride Init)k)0=Znth i Init 0).
 apply rd_mix_suffix;try lia;rewrite rd_results_length by lia;lia.
Qed.

Lemma rd_partial_prefix : forall M base rows channels stride Init k i,
 0<=i<k -> k<=channels ->
 Znth i(rd_partial M base rows channels stride k Init)0=
 rd_result_lane M base rows stride i Init.
Proof.
 intros;unfold rd_partial;change(Znth i(rd_mix Init(rd_results M base rows channels stride Init)k)0=rd_result_lane M base rows stride i Init).
 rewrite rd_mix_prefix;[apply rd_results_nth;lia|assumption|rewrite rd_results_length by lia;lia].
Qed.

Lemma rd_partial_length : forall M base rows channels stride Init k,
 0<=k<=channels -> Zlength Init=channels ->
 Zlength(rd_partial M base rows channels stride k Init)=channels.
Proof.
 intros M base rows channels stride Init k Hk Hlen.
 pose proof(rd_results_length M base rows channels stride Init ltac:(lia))as Hr.
 unfold rd_partial;rewrite Zlength_correct,length_app,length_firstn,length_skipn.
 rewrite Nat.min_l by(rewrite Zlength_correct in Hr;lia).
 rewrite Zlength_correct in Hlen;lia.
Qed.

Lemma rd_partial_store_step : forall M base rows channels stride Init k,
 0<=k<channels -> Zlength Init=channels ->
 replace_Znth k(rd_result_lane M base rows stride k Init)
 (rd_partial M base rows channels stride k Init)=
 rd_partial M base rows channels stride(k+1)Init.
Proof.
 intros M base rows channels stride Init k Hk Hlen.
 rewrite <- (rd_results_nth M base rows channels stride Init k Hk).
 unfold rd_partial;change(replace_Znth k(Znth k(rd_results M base rows channels stride Init)0)
 (rd_mix Init(rd_results M base rows channels stride Init)k)=
 rd_mix Init(rd_results M base rows channels stride Init)(k+1)).
 apply rd_mix_step;try lia;rewrite rd_results_length by lia;lia.
Qed.

Lemma rd_partial_store_block : forall count M base rows channels stride Init k,
 0<=k -> k+Z.of_nat count<=channels -> Zlength Init=channels ->
 rd_store_block M base rows stride k count Init
 (rd_partial M base rows channels stride k Init)=
 rd_partial M base rows channels stride(k+Z.of_nat count)Init.
Proof.
 induction count as[|count IH];intros M base rows channels stride Init k Hk Hb Hlen.
 - cbn[rd_store_block];replace(k+Z.of_nat 0)with k by lia;reflexivity.
 - cbn[rd_store_block];rewrite rd_partial_store_step by lia.
   rewrite IH by lia;f_equal;lia.
Qed.

Lemma rd_partial_store_two : forall M base rows channels stride Init k,
 0<=k -> k+2<=channels -> Zlength Init=channels ->
 rd_store_block M base rows stride k 2 Init(rd_partial M base rows channels stride k Init)=
 rd_partial M base rows channels stride(k+2)Init.
Proof. intros;apply rd_partial_store_block;assumption. Qed.

Lemma rd_partial_store_four : forall M base rows channels stride Init k,
 0<=k -> k+4<=channels -> Zlength Init=channels ->
 rd_store_block M base rows stride k 4 Init(rd_partial M base rows channels stride k Init)=
 rd_partial M base rows channels stride(k+4)Init.
Proof. intros;apply rd_partial_store_block;assumption. Qed.

Lemma rd_partial_store_eight : forall M base rows channels stride Init k,
 0<=k -> k+8<=channels -> Zlength Init=channels ->
 rd_store_block M base rows stride k 8 Init(rd_partial M base rows channels stride k Init)=
 rd_partial M base rows channels stride(k+8)Init.
Proof. intros;apply rd_partial_store_block;assumption. Qed.

Lemma rd_partial_store_thirtytwo : forall M base rows channels stride Init k,
 0<=k -> k+32<=channels -> Zlength Init=channels ->
 rd_store_block M base rows stride k 32 Init(rd_partial M base rows channels stride k Init)=
 rd_partial M base rows channels stride(k+32)Init.
Proof. intros;apply rd_partial_store_block;assumption. Qed.

Print Assumptions rd_results_nth.
Print Assumptions rd_partial_initial.
Print Assumptions rd_partial_full.
Print Assumptions rd_partial_suffix.
Print Assumptions rd_partial_prefix.
Print Assumptions rd_partial_length.
Print Assumptions rd_partial_store_step.
Print Assumptions rd_partial_store_block.
Print Assumptions rd_partial_store_two.
Print Assumptions rd_partial_store_four.
Print Assumptions rd_partial_store_eight.
Print Assumptions rd_partial_store_thirtytwo.
