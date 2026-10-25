From Coq Require Import ZArith List Lia.
From SpmmSpec Require Export Vectors MemoryStore ShapeFacts.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.

Lemma spmm_columns_start_width : forall count j out rows stride row width start nnz deltas input weights lo hi,
 0<=j ->
 spmm_columns_memory count j out rows stride row 0 width start nnz deltas input weights lo hi =
 spmm_columns_memory count j out rows stride row 0 0 start nnz deltas input weights lo hi.
Proof.
 induction count;intros;cbn [spmm_columns_memory];[reflexivity|].
 rewrite !spmm_done_empty by lia;rewrite IHcount by lia;reflexivity.
Qed.
Lemma spmm_output_start_width : forall out rows columns stride row width start nnz deltas input weights lo hi,
 spmm_output out rows columns stride row 0 width start nnz deltas input weights lo hi =
 spmm_output out rows columns stride row 0 0 start nnz deltas input weights lo hi.
Proof. intros;unfold spmm_output;apply spmm_columns_start_width;lia. Qed.
Lemma spmm_mc_rem : forall rows, Z.rem (4*rows) 4=0.
Proof. intros;replace (4*rows)with(rows*4)by ring;apply Z.rem_mul;lia. Qed.
Lemma spmm_mc_quot : forall rows, Z.quot (4*rows) 4=rows.
Proof. intros;replace (4*rows)with(rows*4)by ring;apply Z.quot_mul;lia. Qed.
Lemma spmm_bias_zero : forall nnz,bias_index nnz 0=0.
Proof. reflexivity. Qed.
Lemma spmm_nnz_zero : forall nnz,nnz_before nnz 0=0.
Proof. reflexivity. Qed.
Lemma spmm_input_zero : forall deltas start row,input_index deltas start row 0=start+row.
Proof. intros;unfold input_index,prefix_sum;cbn;lia. Qed.
Lemma spmm_min_merge : forall x hi,
 Binary.is_nan 24 128 hi=false ->
 spmm_merge (fp32_min_number x hi) canonical_qnan (spmm_nanth x)=fp32_neon_min x hi.
Proof.
 intros;unfold spmm_merge,spmm_nanth,fp32_neon_min;rewrite H.
 destruct(Binary.is_nan 24 128 x);reflexivity.
Qed.
Lemma spmm_max_merge : forall x lo,
 Binary.is_nan 24 128 lo=false ->
 spmm_merge (fp32_max_number x lo) canonical_qnan (spmm_nanth x)=fp32_neon_max x lo.
Proof.
 intros;unfold spmm_merge,spmm_nanth,fp32_neon_max;rewrite H.
 destruct(Binary.is_nan 24 128 x);reflexivity.
Qed.
Lemma spmm_min_nan_bound : forall x hi,
 Binary.is_nan 24 128 hi=true -> fp32_neon_min x hi=canonical_qnan.
Proof. intros;unfold fp32_neon_min;rewrite H;destruct(Binary.is_nan 24 128 x);reflexivity. Qed.
Lemma spmm_max_nan_bound : forall x lo,
 Binary.is_nan 24 128 lo=true -> fp32_neon_max x lo=canonical_qnan.
Proof. intros;unfold fp32_neon_max;rewrite H;destruct(Binary.is_nan 24 128 x);reflexivity. Qed.
Print Assumptions spmm_output_start_width.
Print Assumptions spmm_mc_rem.
Print Assumptions spmm_mc_quot.
Print Assumptions spmm_input_zero.
Print Assumptions spmm_min_merge.
Print Assumptions spmm_max_merge.
Print Assumptions spmm_min_nan_bound.
Print Assumptions spmm_max_nan_bound.

Lemma spmm_z_get : forall xs i, Znth i xs 0=z_at xs i.
Proof. reflexivity. Qed.
Lemma spmm_fp_get : forall xs i, Znth i xs fp32_zero=fp_at xs i.
Proof. reflexivity. Qed.
Lemma spmm_shape_nnz_range : forall rows columns start nnz deltas input weights column,
 spmm_shape rows columns start nnz deltas input weights ->
 0<=column<columns -> 0<=z_at nnz column<=4294967295.
Proof. intros;unfold spmm_shape in H;decompose [and] H;apply z_at_nnz_range;auto;lia. Qed.
Print Assumptions spmm_shape_nnz_range.
