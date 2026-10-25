From Coq Require Import List.
From DwChw Require Export PixelModel Observation FmaSwap.
Lemma dw_chw_fold_related:forall terms arm rvv,
 dw_rel arm rvv->
 dw_rel(dw_chw_arm_fold terms arm)(dw_chw_rvv_fold terms rvv).
Proof.
 intros terms;induction terms as[|[input weight]terms IH];intros arm rvv H.
 - exact H.
 - change(dw_rel
    (dw_chw_arm_fold terms(dw_arm_fma arm input weight))
    (dw_chw_rvv_fold terms(dw_rvv_fma rvv weight input))).
   apply IH;rewrite(dw_rvv_fma_swap rvv weight input).
   apply dw_fma_related;[exact H|apply dw_rel_refl|apply dw_rel_refl].
Qed.
Theorem dw_chw_pixel_related:forall
 bias c0 c1 c2 l0 l1 l2 r0 r1 r2 w1 w2 w3 w4 w5 w6 w7 w8 w9 lo hi,
 dw_rel
 (dw_chw_neon_pixel bias c0 c1 c2 l0 l1 l2 r0 r1 r2 w1 w2 w3 w4 w5 w6 w7 w8 w9 lo hi)
 (dw_chw_rvv_pixel bias c0 c1 c2 l0 l1 l2 r0 r1 r2 w1 w2 w3 w4 w5 w6 w7 w8 w9 lo hi).
Proof.
 intros;unfold dw_chw_neon_pixel,dw_chw_rvv_pixel.
 apply dw_min_related;[|apply dw_rel_refl].
 apply dw_max_related;[|apply dw_rel_refl].
 apply dw_chw_fold_related;apply dw_rel_refl.
Qed.
Theorem dw_chw_pixel_observation:forall
 bias c0 c1 c2 l0 l1 l2 r0 r1 r2 w1 w2 w3 w4 w5 w6 w7 w8 w9 lo hi,
 dw_observe
 (dw_chw_neon_pixel bias c0 c1 c2 l0 l1 l2 r0 r1 r2 w1 w2 w3 w4 w5 w6 w7 w8 w9 lo hi)
 (dw_chw_rvv_pixel bias c0 c1 c2 l0 l1 l2 r0 r1 r2 w1 w2 w3 w4 w5 w6 w7 w8 w9 lo hi).
Proof. intros;apply dw_related_observe;apply dw_chw_pixel_related. Qed.
Print Assumptions dw_chw_fold_related.
Print Assumptions dw_chw_pixel_related.
Print Assumptions dw_chw_pixel_observation.
