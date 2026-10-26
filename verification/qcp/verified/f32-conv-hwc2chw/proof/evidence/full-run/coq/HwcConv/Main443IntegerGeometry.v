From HwcConv Require Import CachedRowsBridgeCandidate RvvKernelModel.
From Coq Require Import ZArith Lia.
Local Open Scope Z_scope.
Lemma hcm_quot_rem_columns : forall N iw,
 0<N -> 0<=iw<=N -> Z.rem(N-iw)4=0 ->
 (4<=iw -> 0<=Z.quot(N-iw)2 /\ Z.quot(N-iw)2+1<Z.quot(N+1)2) /\
 (0<iw<4 -> 0<=Z.quot(N-iw)2<Z.quot(N+1)2) /\
 (iw=3 -> Z.quot(N-iw)2+1<Z.quot(N+1)2).
Proof.
 intros N iw HN HI HR.
 rewrite Z.rem_mod_nonneg in HR by lia.
 repeat rewrite Z.quot_div_nonneg by lia.
 exact(hc_cached_columns N iw HN HI HR).
Qed.
Lemma hcm_word_quot_index : forall N iw,
 0<N<18446744073709551616 -> 0<iw<=N ->
 unsigned_last_nbits(Z.quot(N-iw)2)64=Z.quot(N-iw)2 /\
 unsigned_last_nbits(Z.quot(N-iw)2+1)64=Z.quot(N-iw)2+1.
Proof.
 intros N iw HN HI;rewrite Z.quot_div_nonneg by lia.
 pose proof(Z.div_mod(N-iw)2 ltac:(lia)).
 pose proof(Z.mod_pos_bound(N-iw)2 ltac:(lia)).
 split.
 - apply unsigned_last_nbits_eq;change(0<=(N-iw)/2<18446744073709551616);lia.
 - apply unsigned_last_nbits_eq;change(0<=(N-iw)/2+1<18446744073709551616);lia.
Qed.
Lemma hcm_footprint_width_range : forall input H N,
 0<H -> 0<N -> hc_footprint input(3*H*N+3) ->0<N<18446744073709551616.
Proof.
 intros input H N HH HN HF;unfold hc_footprint,hc_u64_limit in HF.
 destruct HF as[HP[HC HB]];nia.
Qed.
Definition second_columns : forall N iw,0<N->0<=iw<=N->Z.rem(N-iw)4=0->
 (4<=iw->0<=Z.quot(N-iw)2 /\ Z.quot(N-iw)2+1<Z.quot(N+1)2)/\
 (0<iw<4->0<=Z.quot(N-iw)2<Z.quot(N+1)2)/\
 (iw=3->Z.quot(N-iw)2+1<Z.quot(N+1)2) := hcm_quot_rem_columns.
Print Assumptions hcm_quot_rem_columns.
Print Assumptions hcm_word_quot_index.
Print Assumptions hcm_footprint_width_range.
Print Assumptions second_columns.
