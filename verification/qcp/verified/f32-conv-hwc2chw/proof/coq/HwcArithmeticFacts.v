From Coq Require Import List.
From HwcConv Require Export HwcArithmeticModel Observation FmaSwap.
Lemma hwc_fold_related:forall terms arm rvv,
 dw_rel arm rvv->dw_rel(hwc_arm_fold terms arm)(hwc_rvv_fold terms rvv).
Proof.
 intros terms;induction terms as[|tap terms IH];intros arm rvv HR.
 - exact HR.
 - destruct tap as[[input weight]|].
   + change(dw_rel(hwc_arm_fold terms(dw_arm_fma arm input weight))
       (hwc_rvv_fold terms(dw_rvv_fma rvv weight input))).
     apply IH;rewrite(dw_rvv_fma_swap rvv weight input).
     apply dw_fma_related;[exact HR|apply dw_rel_refl|apply dw_rel_refl].
   + exact(IH arm rvv HR).
Qed.
Theorem hwc_pixel_related:forall terms bias lo hi,
 dw_rel(hwc_neon_pixel terms bias lo hi)(hwc_repaired_rvv_pixel terms bias lo hi).
Proof.
 intros;unfold hwc_neon_pixel,hwc_repaired_rvv_pixel.
 apply dw_min_related;[|apply dw_rel_refl].
 apply dw_max_related;[|apply dw_rel_refl].
 apply hwc_fold_related;apply dw_rel_refl.
Qed.
Theorem hwc_pixel_observation:forall terms bias lo hi,
 dw_observe(hwc_neon_pixel terms bias lo hi)(hwc_repaired_rvv_pixel terms bias lo hi).
Proof. intros;apply dw_related_observe;apply hwc_pixel_related. Qed.
Print Assumptions hwc_fold_related.
Print Assumptions hwc_pixel_related.
Print Assumptions hwc_pixel_observation.
