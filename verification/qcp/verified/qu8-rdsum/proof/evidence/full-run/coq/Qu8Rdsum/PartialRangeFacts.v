From Coq Require Import ZArith Lia.
From Qu8Rdsum Require Export ProgramModel StoreModel StoreFacts InitialRange IntegerFacts.
Local Open Scope Z_scope.
Lemma rd_partial_init_range : forall Map base rows channels stride k Init,
 0<=k<=channels ->Zlength Init=channels ->rd_init_range Init ->
 rd_init_range(rd_partial Map base rows channels stride k Init).
Proof.
 intros Map base rows channels stride k Init Hk Hlen Hrange i Hi.
 rewrite rd_partial_length in Hi by assumption.
 destruct(Z_lt_ge_dec i k)as[Hprefix|Hsuffix].
 - rewrite rd_partial_prefix by lia;unfold rd_result_lane;apply rs_u32_bound.
 - rewrite rd_partial_suffix by lia;apply Hrange;lia.
Qed.
Print Assumptions rd_partial_init_range.
