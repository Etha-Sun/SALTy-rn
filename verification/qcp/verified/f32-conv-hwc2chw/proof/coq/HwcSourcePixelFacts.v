From Coq Require Import List Bool.
From HwcConv Require Export HwcSourcePixelModel HwcArithmeticFacts.

Lemma hc_rvv_source_fold_generic : forall terms bias,
 hc_rvv_source_fold terms bias = hwc_rvv_fold terms bias.
Proof.
 intros terms;induction terms as [|tap terms IH];intro bias.
 - reflexivity.
 - destruct tap as [[a b]|].
   + change (hc_rvv_source_fold terms (dw_rvv_fma bias a b) =
             hwc_rvv_fold terms (dw_rvv_fma bias b a)).
     rewrite (dw_rvv_fma_swap bias a b);apply IH.
   + exact (IH bias).
Qed.

Lemma hc_canonical_max_same : forall a b,
 dw_rel (dw_arm_max a b) (hc_canonical_max a b).
Proof.
 intros a b;unfold dw_arm_max,hc_canonical_max.
 destruct (orb (dw_nan a) (dw_nan b)) eqn:E.
 - right;split.
   + apply dw_arm_nan2_nan;now apply (proj1 (dw_nan_or2 a b)).
   + exact dw_qnan_nan.
 - left;reflexivity.
Qed.
Lemma hc_canonical_min_same : forall a b,
 dw_rel (dw_arm_min a b) (hc_canonical_min a b).
Proof.
 intros a b;unfold dw_arm_min,hc_canonical_min.
 destruct (orb (dw_nan a) (dw_nan b)) eqn:E.
 - right;split.
   + apply dw_arm_nan2_nan;now apply (proj1 (dw_nan_or2 a b)).
   + exact dw_qnan_nan.
 - left;reflexivity.
Qed.
Lemma hc_canonical_max_nan : forall a b,
 fp32_isNaN a \/ fp32_isNaN b -> fp32_isNaN (hc_canonical_max a b).
Proof.
 intros a b H;unfold hc_canonical_max.
 rewrite (proj2 (dw_nan_or2 a b) H);exact dw_qnan_nan.
Qed.
Lemma hc_canonical_min_nan : forall a b,
 fp32_isNaN a \/ fp32_isNaN b -> fp32_isNaN (hc_canonical_min a b).
Proof.
 intros a b H;unfold hc_canonical_min.
 rewrite (proj2 (dw_nan_or2 a b) H);exact dw_qnan_nan.
Qed.
Lemma hc_canonical_max_related : forall a a' b b',
 dw_rel a a' -> dw_rel b b' ->
 dw_rel (dw_arm_max a b) (hc_canonical_max a' b').
Proof.
 apply dw_binary_related.
 - exact hc_canonical_max_same.
 - intros;apply dw_arm_clamp_nan;assumption.
 - exact hc_canonical_max_nan.
Qed.
Lemma hc_canonical_min_related : forall a a' b b',
 dw_rel a a' -> dw_rel b b' ->
 dw_rel (dw_arm_min a b) (hc_canonical_min a' b').
Proof.
 apply dw_binary_related.
 - exact hc_canonical_min_same.
 - intros;apply dw_arm_clamp_nan;assumption.
 - exact hc_canonical_min_nan.
Qed.
Theorem hc_rvv_source_result_related : forall terms bias lo hi,
 dw_rel (hwc_neon_pixel terms bias lo hi)
        (hc_rvv_source_result terms bias lo hi).
Proof.
 intros terms bias lo hi;unfold hwc_neon_pixel,hc_rvv_source_result.
 apply hc_canonical_min_related;[|apply dw_rel_refl].
 apply hc_canonical_max_related;[|apply dw_rel_refl].
 rewrite hc_rvv_source_fold_generic;apply hwc_fold_related;apply dw_rel_refl.
Qed.
Theorem hc_rvv_source_result_observation : forall terms bias lo hi,
 dw_observe (hwc_neon_pixel terms bias lo hi)
            (hc_rvv_source_result terms bias lo hi).
Proof. intros;apply dw_related_observe;apply hc_rvv_source_result_related. Qed.

Print Assumptions hc_rvv_source_fold_generic.
Print Assumptions hc_canonical_max_same.
Print Assumptions hc_canonical_min_same.
Print Assumptions hc_canonical_max_nan.
Print Assumptions hc_canonical_min_nan.
Print Assumptions hc_canonical_max_related.
Print Assumptions hc_canonical_min_related.
Print Assumptions hc_rvv_source_result_related.
Print Assumptions hc_rvv_source_result_observation.
