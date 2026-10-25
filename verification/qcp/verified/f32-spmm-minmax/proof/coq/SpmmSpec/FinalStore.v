From Coq Require Import ZArith List Lia.
From SpmmSpec Require Export MemoryStore GeometryFacts ActiveClamp.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma spmm_close_stored_column : forall out rows columns stride row column width start nnz ds input weights lo hi,
 0<out -> 0<=stride -> out+stride*(columns-1)+4*rows<modulus64 ->
 0<=column<columns -> 0<=row -> 0<width -> row+width<=rows ->
 spmm_output_hole out rows columns stride row column width start nnz ds input weights lo hi **
 FloatArray.full(spmm_output_cursor out row stride column)width
 (spmm_column_block row width column start nnz ds input weights lo hi) |--
 spmm_output out rows columns stride row(column+1)width start nnz ds input weights lo hi.
Proof.
 intros;rewrite(spmm_output_cursor_bound out rows columns stride row column width)by assumption.
 apply spmm_output_close;lia.
Qed.
Print Assumptions spmm_close_stored_column.
