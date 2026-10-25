From Coq Require Import ZArith List String Lia.
From SpmmSpec Require Export Model Address.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope string_scope.
Local Open Scope sac.

(** Only the M written floats of each column are owned. Stride gaps remain
    in the caller's frame. A strip completes columns from left to right. *)
Definition spmm_column_done (row column width j:Z) :=
 if Z.ltb j column then row+width else row.
Definition spmm_column_memory (out rows stride done j start:Z)
 (nnz deltas:list Z)(input weights:list fp32)(lo hi:fp32) : Assertion :=
 FloatArray.seg (out+stride*j) 0 done
   (spmm_column_prefix done j start nnz deltas input weights lo hi) **
 FloatArray.undef_seg (out+stride*j) done rows.
Fixpoint spmm_columns_memory (count:nat) (j out rows stride row column width start:Z)
 (nnz deltas:list Z)(input weights:list fp32)(lo hi:fp32) : Assertion :=
 match count with
 | O => emp
 | S rest =>
   spmm_column_memory out rows stride (spmm_column_done row column width j)
     j start nnz deltas input weights lo hi **
   spmm_columns_memory rest (j+1) out rows stride row column width start
     nnz deltas input weights lo hi
 end.
Definition spmm_output (out rows columns stride row column width start:Z)
 (nnz deltas:list Z)(input weights:list fp32)(lo hi:fp32) : Assertion :=
 spmm_columns_memory (Z.to_nat columns) 0 out rows stride row column width start
   nnz deltas input weights lo hi.

(** Frame remaining while one contiguous active strip is lent to the
    intrinsic store. The missing cells must be restored by a checked VC. *)
Fixpoint spmm_columns_hole (count:nat) (j out rows stride row column width start:Z)
 (nnz deltas:list Z)(input weights:list fp32)(lo hi:fp32) : Assertion :=
 match count with
 | O => emp
 | S rest =>
   (if Z.eqb j column then
     FloatArray.seg (out+stride*j) 0 row
       (spmm_column_prefix row j start nnz deltas input weights lo hi) **
     FloatArray.undef_seg (out+stride*j) (row+width) rows
    else spmm_column_memory out rows stride (spmm_column_done row column width j)
       j start nnz deltas input weights lo hi) **
   spmm_columns_hole rest (j+1) out rows stride row column width start
       nnz deltas input weights lo hi
 end.
Definition spmm_output_hole (out rows columns stride row column width start:Z)
 (nnz deltas:list Z)(input weights:list fp32)(lo hi:fp32) : Assertion :=
 spmm_columns_hole (Z.to_nat columns) 0 out rows stride row column width start
   nnz deltas input weights lo hi.
(** Input arrays and parameter fields remain explicit in spec.c. *)

Lemma spmm_done_empty : forall row width j,
 0<=j -> spmm_column_done row 0 width j=row.
Proof. intros;unfold spmm_column_done;destruct (Z.ltb_spec j 0);[lia|reflexivity]. Qed.
Lemma spmm_done_complete : forall row columns width j,
 j<columns -> spmm_column_done row columns width j=row+width.
Proof. intros;unfold spmm_column_done;destruct (Z.ltb_spec j columns);[reflexivity|lia]. Qed.
Lemma spmm_columns_advance : forall count j out rows stride row width start nnz deltas input weights lo hi,
 0<=j ->
 spmm_columns_memory count j out rows stride row (j+Z.of_nat count) width start
   nnz deltas input weights lo hi --||--
 spmm_columns_memory count j out rows stride (row+width) 0 0 start
   nnz deltas input weights lo hi.
Proof.
 induction count;intros;cbn [spmm_columns_memory];[reflexivity|].
 rewrite spmm_done_complete by lia;rewrite spmm_done_empty by lia.
 replace (j+Z.of_nat(S count)) with ((j+1)+Z.of_nat count) by lia.
 rewrite IHcount by lia;reflexivity.
Qed.
Lemma spmm_output_advance : forall out rows columns stride row width start nnz deltas input weights lo hi,
 0<=columns ->
 spmm_output out rows columns stride row columns width start nnz deltas input weights lo hi --||--
 spmm_output out rows columns stride (row+width) 0 0 start nnz deltas input weights lo hi.
Proof.
 intros;unfold spmm_output.
 replace columns with (0+Z.of_nat(Z.to_nat columns)) at 2 by (rewrite Z2Nat.id by lia;lia).
 apply spmm_columns_advance;lia.
Qed.
Print Assumptions spmm_done_empty.
Print Assumptions spmm_done_complete.
Print Assumptions spmm_columns_advance.
Print Assumptions spmm_output_advance.
