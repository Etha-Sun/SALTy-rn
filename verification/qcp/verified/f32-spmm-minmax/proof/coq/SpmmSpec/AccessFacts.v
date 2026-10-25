From Coq Require Import ZArith List Lia.
From SpmmSpec Require Export CursorFacts MemoryStore.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma spmm_remaining_cursor_range : forall rows columns start nnz ds input weights column remaining,
 spmm_shape rows columns start nnz ds input weights ->
 0<=column<columns -> 0<remaining<=Znth column nnz 0 ->
 0<=nnz_before nnz column+(Znth column nnz 0-remaining)<Zlength ds.
Proof.
 intros;unfold spmm_shape in H;decompose [and] H.
 pose proof(sparse_cursor_range nnz column (z_at nnz column-remaining) ltac:(assumption) ltac:(lia) ltac:(unfold z_at,Znth in *;lia)).
 unfold z_at,Znth in *;lia.
Qed.
Lemma spmm_remaining_weight_range : forall rows columns start nnz ds input weights column remaining,
 spmm_shape rows columns start nnz ds input weights ->
 0<=column<columns -> 0<remaining<=z_at nnz column ->
 0<=bias_index nnz column+1+(z_at nnz column-remaining)<Zlength weights.
Proof.
 intros;unfold spmm_shape in H;decompose [and] H.
 pose proof(weight_index_range nnz column (z_at nnz column-remaining) ltac:(assumption) ltac:(lia) ltac:(lia));lia.
Qed.
Lemma spmm_remaining_input_range : forall rows columns start nnz ds input weights column remaining row width,
 spmm_shape rows columns start nnz ds input weights ->
 0<=column<columns -> 0<remaining<=z_at nnz column ->
 0<=row -> 0<width -> row+width<=rows ->
 0<=input_index ds start row (nnz_before nnz column+(z_at nnz column-remaining)) /\
 input_index ds start row (nnz_before nnz column+(z_at nnz column-remaining))+width<=Zlength input.
Proof.
 intros;apply (input_active_range rows columns start nnz ds input weights row width);try assumption.
 pose proof(spmm_remaining_cursor_range rows columns start nnz ds input weights column remaining H H0 H1);unfold z_at,Znth in *;lia.
Qed.
Lemma spmm_output_open_at_cursor : forall out rows columns stride row column width start nnz ds input weights lo hi,
 0<out -> 0<=stride -> out+stride*(columns-1)+4*rows<modulus64 ->
 0<=column<columns -> 0<=row -> 0<width -> row+width<=rows ->
 spmm_output out rows columns stride row column width start nnz ds input weights lo hi |--
 spmm_output_hole out rows columns stride row column width start nnz ds input weights lo hi **
 FloatArray.undef_full (spmm_output_cursor out row stride column) width.
Proof.
 intros;rewrite(spmm_output_cursor_bound out rows columns stride row column width)by assumption.
 apply spmm_output_open;lia.
Qed.
Print Assumptions spmm_remaining_cursor_range.
Print Assumptions spmm_remaining_weight_range.
Print Assumptions spmm_remaining_input_range.
Print Assumptions spmm_output_open_at_cursor.
