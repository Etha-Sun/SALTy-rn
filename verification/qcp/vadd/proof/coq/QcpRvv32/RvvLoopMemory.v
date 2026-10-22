From Coq Require Import ZArith List Lia.
From QcpRvv32 Require Import RvvLogic.
From AUXLib Require Import ListLib.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.

Lemma rvv_full_as_segment : forall p k vl (xs:list fp32),
  FloatArray.full (p+k*sizeof(FLOAT)) vl xs |-- FloatArray.seg p k (k+vl) xs.
Proof.
 intros. rewrite FloatArray.seg_0_shift.
 replace (k+vl-k) with vl by lia. apply FloatArray.full_to_seg.
Qed.

Lemma rvv_input_split : forall p k vl total (xs:list fp32),
  0 <= k -> 0 <= vl -> k+vl <= total ->
  FloatArray.full p total xs |--
  FloatArray.seg p 0 k (sublist 0 k xs) **
  FloatArray.full (p+k*sizeof(FLOAT)) vl (sublist k (k+vl) xs) **
  FloatArray.seg p (k+vl) total (sublist (k+vl) total xs).
Proof.
 intros p k vl total xs Hk Hv Ht.
 sep_apply (FloatArray.full_split_to_seg p k total xs ltac:(lia)).
 sep_apply (FloatArray.seg_split_to_seg p k (k+vl) total (sublist k total xs) ltac:(lia)).
 rewrite !Zsublist_Zsublist by lia.
 replace (0+k) with k by lia.
 replace (k+vl-k+k) with (k+vl) by lia.
 replace (total-k+k) with total by lia.
 sep_apply (FloatArray.seg_to_full p k (k+vl) (sublist k (k+vl) xs)).
 replace (k+vl-k) with vl by lia. entailer!.
Qed.

Lemma rvv_input_merge : forall p k vl total (xs:list fp32),
  0 <= k -> 0 <= vl -> k+vl <= total -> total = Zlength xs ->
  FloatArray.seg p 0 k (sublist 0 k xs) **
  FloatArray.full (p+k*sizeof(FLOAT)) vl (sublist k (k+vl) xs) **
  FloatArray.seg p (k+vl) total (sublist (k+vl) total xs)
  |-- FloatArray.full p total xs.
Proof.
 intros p k vl total xs Hk Hv Ht Hlen.
 sep_apply (rvv_full_as_segment p k vl (sublist k (k+vl) xs)).
 sep_apply (FloatArray.seg_merge_to_seg p 0 k (k+vl)
   (sublist 0 k xs) (sublist k (k+vl) xs) ltac:(lia)).
 rewrite <- sublist_split by lia.
 sep_apply (FloatArray.seg_merge_to_full p 0 (k+vl) total
   (sublist 0 (k+vl) xs) (sublist (k+vl) total xs) ltac:(lia)).
 rewrite <- sublist_split by lia. rewrite sublist_self by lia.
 replace (p+0*sizeof(FLOAT)) with p by lia.
 replace (total-0) with total by lia. entailer!.
Qed.

Lemma rvv_output_append : forall p k vl (prefix chunk:list fp32),
  0 <= k -> 0 <= vl ->
  FloatArray.seg p 0 k prefix ** FloatArray.full (p+k*sizeof(FLOAT)) vl chunk
  |-- FloatArray.seg p 0 (k+vl) (prefix++chunk).
Proof.
 intros p k vl prefix chunk Hk Hv.
 sep_apply (rvv_full_as_segment p k vl chunk).
 sep_apply (FloatArray.seg_merge_to_seg p 0 k (k+vl) prefix chunk ltac:(lia)). entailer!.
Qed.
Print Assumptions rvv_full_as_segment.
Print Assumptions rvv_input_split.
Print Assumptions rvv_input_merge.
Print Assumptions rvv_output_append.
