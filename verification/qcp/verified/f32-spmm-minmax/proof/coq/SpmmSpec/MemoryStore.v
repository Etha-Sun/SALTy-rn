From Coq Require Import ZArith List Lia.
From SpmmSpec Require Export Memory.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.

Definition spmm_column_block row width column start nnz deltas input weights lo hi :=
 map (fun r => spmm_cell column (Z.of_nat r) start nnz deltas input weights lo hi)
     (seq (Z.to_nat row) (Z.to_nat width)).

Lemma spmm_prefix_block : forall row width column start nnz deltas input weights lo hi,
 0<=row -> 0<=width ->
 spmm_column_prefix (row+width) column start nnz deltas input weights lo hi =
 spmm_column_prefix row column start nnz deltas input weights lo hi ++
 spmm_column_block row width column start nnz deltas input weights lo hi.
Proof.
 intros;unfold spmm_column_prefix,spmm_column_block.
 rewrite Z2Nat.inj_add by lia;rewrite seq_app,map_app;reflexivity.
Qed.

Lemma spmm_column_open : forall base rows row width column start nnz deltas input weights lo hi,
 0<=row -> 0<=width -> row+width<=rows ->
 spmm_column_memory base rows 0 row column start nnz deltas input weights lo hi |--
 (FloatArray.seg base 0 row (spmm_column_prefix row column start nnz deltas input weights lo hi) **
  FloatArray.undef_seg base (row+width) rows) ** FloatArray.undef_full (base+4*row) width.
Proof.
 intros;unfold spmm_column_memory;replace (base+0*column) with base by lia.
 sep_apply (FloatArray.undef_seg_split_to_undef_seg base row (row+width) rows);try lia.
 sep_apply (FloatArray.undef_seg_to_undef_full base row (row+width)).
 replace (row+width-row) with width by lia.
 rewrite sizeof_float.
 replace (base+row*4) with (base+4*row) by lia;cancel.
Qed.

Lemma spmm_column_close : forall base rows row width column start nnz deltas input weights lo hi,
 0<=row -> 0<=width -> row+width<=rows ->
 (FloatArray.seg base 0 row (spmm_column_prefix row column start nnz deltas input weights lo hi) **
  FloatArray.undef_seg base (row+width) rows) **
 FloatArray.full (base+4*row) width
   (spmm_column_block row width column start nnz deltas input weights lo hi) |--
 spmm_column_memory base rows 0 (row+width) column start nnz deltas input weights lo hi.
Proof.
 intros;unfold spmm_column_memory;replace (base+0*column) with base by lia.
 rewrite spmm_prefix_block by lia.
 change (FloatArray.full (base+4*row) width (spmm_column_block row width column start nnz deltas input weights lo hi)) with (FloatArray.seg (base+4*row) 0 width (spmm_column_block row width column start nnz deltas input weights lo hi)).
 pose proof (FloatArray.seg_0_shift base row (row+width)
  (spmm_column_block row width column start nnz deltas input weights lo hi)) as E.
 rewrite sizeof_float in E.
 replace (row+width-row) with width in E by lia.
 replace (base+row*4) with (base+4*row) in E by lia.
 rewrite <-E.
 sep_apply (FloatArray.seg_merge_to_seg base 0 row (row+width));try lia;cancel.
Qed.

Lemma spmm_hole_above : forall count j out rows stride row column width start nnz deltas input weights lo hi,
 column<j ->
 spmm_columns_hole count j out rows stride row column width start nnz deltas input weights lo hi --||--
 spmm_columns_memory count j out rows stride row column width start nnz deltas input weights lo hi.
Proof.
 induction count;intros;cbn [spmm_columns_hole spmm_columns_memory];[reflexivity|].
 destruct (Z.eqb_spec j column);try lia.
 rewrite IHcount by lia;reflexivity.
Qed.

Lemma spmm_columns_same_above : forall count j out rows stride row column width start nnz deltas input weights lo hi,
 column<j ->
 spmm_columns_memory count j out rows stride row column width start nnz deltas input weights lo hi --||--
 spmm_columns_memory count j out rows stride row (column+1) width start nnz deltas input weights lo hi.
Proof.
 induction count;intros;cbn [spmm_columns_memory];[reflexivity|].
 unfold spmm_column_done at 1 2.
 destruct (Z.ltb_spec j column);try lia.
 destruct (Z.ltb_spec j (column+1));try lia.
 rewrite IHcount by lia;reflexivity.
Qed.

Lemma spmm_columns_open : forall count j out rows stride row column width start nnz deltas input weights lo hi,
 j<=column<j+Z.of_nat count -> 0<=row -> 0<=width -> row+width<=rows ->
 spmm_columns_memory count j out rows stride row column width start nnz deltas input weights lo hi |--
 spmm_columns_hole count j out rows stride row column width start nnz deltas input weights lo hi **
 FloatArray.undef_full (out+stride*column+4*row) width.
Proof.
 induction count;intros;[cbn in H;lia|].
 cbn [spmm_columns_memory spmm_columns_hole].
 destruct (Z.eqb_spec j column).
 - subst j;unfold spmm_column_done at 1;rewrite Z.ltb_irrefl.
   rewrite spmm_hole_above by lia.
   unfold spmm_column_memory at 1.
   sep_apply (FloatArray.undef_seg_split_to_undef_seg (out+stride*column) row (row+width) rows);try lia.
   sep_apply (FloatArray.undef_seg_to_undef_full (out+stride*column) row (row+width)).
   replace (row+width-row) with width by lia.
   rewrite sizeof_float.
   replace (out+stride*column+row*4) with (out+stride*column+4*row) by lia;cancel.
 - sep_apply (IHcount (j+1) out rows stride row column width start nnz deltas input weights lo hi);try lia;cancel.
Qed.

Lemma spmm_columns_close : forall count j out rows stride row column width start nnz deltas input weights lo hi,
 j<=column<j+Z.of_nat count -> 0<=row -> 0<=width -> row+width<=rows ->
 spmm_columns_hole count j out rows stride row column width start nnz deltas input weights lo hi **
 FloatArray.full (out+stride*column+4*row) width
   (spmm_column_block row width column start nnz deltas input weights lo hi) |--
 spmm_columns_memory count j out rows stride row (column+1) width start nnz deltas input weights lo hi.
Proof.
 induction count;intros;[cbn in H;lia|].
 cbn [spmm_columns_memory spmm_columns_hole].
 destruct (Z.eqb_spec j column).
 - subst j;unfold spmm_column_done at 1.
   destruct (Z.ltb_spec column (column+1));[|lia].
   rewrite spmm_hole_above by lia.
   rewrite spmm_columns_same_above by lia.
   pose proof (spmm_column_close (out+stride*column) rows row width column start nnz deltas input weights lo hi H0 H1 H2) as Hclose.
   unfold spmm_column_memory in Hclose |- *.
   replace (out+stride*column+0*column) with (out+stride*column) in Hclose by lia.
   eapply derivable1_trans.
   2:{ apply derivable1_sepcon_mono;[exact Hclose|reflexivity]. }
   sepcon_assoc_change;cancel.

 - unfold spmm_column_done at 1 2.
   destruct (Z.ltb_spec j column);[|lia].
   destruct (Z.ltb_spec j (column+1));[|lia].
   sep_apply (IHcount (j+1) out rows stride row column width start nnz deltas input weights lo hi);try lia;cancel.
Qed.

Print Assumptions spmm_prefix_block.
Print Assumptions spmm_column_open.
Print Assumptions spmm_column_close.
Print Assumptions spmm_columns_open.
Print Assumptions spmm_columns_close.

Lemma spmm_output_open : forall out rows columns stride row column width start nnz deltas input weights lo hi,
 0<=column<columns -> 0<=row -> 0<=width -> row+width<=rows ->
 spmm_output out rows columns stride row column width start nnz deltas input weights lo hi |--
 spmm_output_hole out rows columns stride row column width start nnz deltas input weights lo hi **
 FloatArray.undef_full (out+stride*column+4*row) width.
Proof.
 intros;unfold spmm_output,spmm_output_hole;apply spmm_columns_open;try lia.
Qed.

Lemma spmm_output_close : forall out rows columns stride row column width start nnz deltas input weights lo hi,
 0<=column<columns -> 0<=row -> 0<=width -> row+width<=rows ->
 spmm_output_hole out rows columns stride row column width start nnz deltas input weights lo hi **
 FloatArray.full (out+stride*column+4*row) width
   (spmm_column_block row width column start nnz deltas input weights lo hi) |--
 spmm_output out rows columns stride row (column+1) width start nnz deltas input weights lo hi.
Proof.
 intros;unfold spmm_output,spmm_output_hole;apply spmm_columns_close;try lia.
Qed.

Lemma spmm_output_cursor_bound : forall out rows columns stride row column width,
 0<out -> 0<=stride -> out+stride*(columns-1)+4*rows<modulus64 ->
 0<=column<columns -> 0<=row -> 0<width -> row+width<=rows ->
 spmm_output_cursor out row stride column=out+stride*column+4*row.
Proof.
 intros;unfold spmm_output_cursor,word64.
 rewrite Z.mod_small by nia;ring.
Qed.

Lemma spmm_block_length : forall row width column start nnz deltas input weights lo hi,
 0<=width ->
 Zlength (spmm_column_block row width column start nnz deltas input weights lo hi)=width.
Proof.
 intros;unfold spmm_column_block;rewrite Zlength_correct,map_length,seq_length,Z2Nat.id by lia;reflexivity.
Qed.

Lemma spmm_block_nth : forall row width column start nnz deltas input weights lo hi i,
 0<=row -> 0<=i<width ->
 fp_at (spmm_column_block row width column start nnz deltas input weights lo hi) i =
 spmm_cell column (row+i) start nnz deltas input weights lo hi.
Proof.
 intros;unfold fp_at,spmm_column_block.
 rewrite nth_indep with (d':=spmm_cell column 0 start nnz deltas input weights lo hi)
   by (rewrite map_length,seq_length;lia).
 change (spmm_cell column 0 start nnz deltas input weights lo hi)
  with ((fun r=>spmm_cell column (Z.of_nat r) start nnz deltas input weights lo hi) 0%nat).
 rewrite map_nth,seq_nth by lia.
 rewrite Nat2Z.inj_add,!Z2Nat.id by lia;reflexivity.
Qed.

Print Assumptions spmm_output_open.
Print Assumptions spmm_output_close.
Print Assumptions spmm_output_cursor_bound.
Print Assumptions spmm_block_length.
Print Assumptions spmm_block_nth.
