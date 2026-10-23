From Coq Require Import ZArith Lia List.
From AUXLib Require Import ListLib.
From FullU8 Require Import Packed32Model CodecProof.
Local Open Scope Z_scope.
Lemma vec_byte_min_at : forall W W' y vl i,
 0<=y<=255 ->0<=i<128 ->
 (forall wi,0<=wi<32 ->Znth wi W' 0=word_min(Znth wi W 0)y vl wi) ->
 vec_byte W' i=active_min(vec_byte W i)y vl i.
Proof.
 intros W W' y vl i Hy Hi Hw;unfold vec_byte.
 assert(Hq:0<=i/4<32)by(split;[apply Z.div_pos;lia|apply Z.div_lt_upper_bound;lia]).
 rewrite Hw by exact Hq.
 rewrite word_min_byte by(try exact Hy;pose proof(Z.mod_pos_bound i 4 ltac:(lia));lia).
 replace(4*(i/4)+i mod 4)with i by(pose proof(Z.div_mod i 4 ltac:(lia));lia).
 reflexivity.
Qed.
Lemma vec_byte_max_at : forall W W' y vl i,
 0<=y<=255 ->0<=i<128 ->
 (forall wi,0<=wi<32 ->Znth wi W' 0=word_max(Znth wi W 0)y vl wi) ->
 vec_byte W' i=active_max(vec_byte W i)y vl i.
Proof.
 intros W W' y vl i Hy Hi Hw;unfold vec_byte.
 assert(Hq:0<=i/4<32)by(split;[apply Z.div_pos;lia|apply Z.div_lt_upper_bound;lia]).
 rewrite Hw by exact Hq.
 rewrite word_max_byte by(try exact Hy;pose proof(Z.mod_pos_bound i 4 ltac:(lia));lia).
 replace(4*(i/4)+i mod 4)with i by(pose proof(Z.div_mod i 4 ltac:(lia));lia).
 reflexivity.
Qed.
Lemma vec_bytes_min_at : forall W W' y vl i,
 0<=y<=255 ->0<=i<128 ->
 (forall wi,0<=wi<32 ->Znth wi W' 0=word_min(Znth wi W 0)y vl wi) ->
 Znth i(vec_bytes W')0=active_min(Znth i(vec_bytes W)0)y vl i.
Proof. intros;rewrite !vec_bytes_index by assumption;now apply vec_byte_min_at. Qed.
Lemma vec_bytes_max_at : forall W W' y vl i,
 0<=y<=255 ->0<=i<128 ->
 (forall wi,0<=wi<32 ->Znth wi W' 0=word_max(Znth wi W 0)y vl wi) ->
 Znth i(vec_bytes W')0=active_max(Znth i(vec_bytes W)0)y vl i.
Proof. intros;rewrite !vec_bytes_index by assumption;now apply vec_byte_max_at. Qed.
Print Assumptions vec_byte_min_at.
Print Assumptions vec_byte_max_at.
Print Assumptions vec_bytes_min_at.
Print Assumptions vec_bytes_max_at.
