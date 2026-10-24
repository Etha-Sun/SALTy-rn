From Coq Require Import ZArith List Bool Lia.
From GemmRvv Require Import Model.
From GemmRvvLoop Require Import ClampRepair.
From Flocq.IEEE754 Require Import Binary.
Local Open Scope Z_scope.

Lemma fp32_self_eq_not_nan : forall x,
 fp32_eq x x -> Binary.is_nan 24 128 x=false.
Proof.
 intros x H; rewrite <- repair_une_self_is_nan; unfold repair_une.
 unfold fp32_eq in H; rewrite H; reflexivity.
Qed.
Lemma fp32_self_ne_nan : forall x,
 fp32_ne x x -> Binary.is_nan 24 128 x=true.
Proof.
 intros x H; rewrite <- repair_une_self_is_nan; unfold repair_une.
 unfold fp32_ne in H.
 destruct (fp32_compare x x) as [c|] eqn:E; [destruct c|]; try reflexivity.
 exfalso; apply H; reflexivity.
Qed.
Lemma rvv_merge_min_correct : forall x hi,
 Binary.is_nan 24 128 hi=false ->
 rvv_merge (fp32_min_number x hi) canonical_qnan (rvv_nanth x)=fp32_neon_min x hi.
Proof.
 intros; unfold rvv_merge,rvv_nanth,fp32_neon_min; rewrite H.
 destruct (Binary.is_nan 24 128 x); reflexivity.
Qed.
Lemma rvv_merge_max_correct : forall x lo,
 Binary.is_nan 24 128 lo=false ->
 rvv_merge (fp32_max_number x lo) canonical_qnan (rvv_nanth x)=fp32_neon_max x lo.
Proof.
 intros; unfold rvv_merge,rvv_nanth,fp32_neon_max; rewrite H.
 destruct (Binary.is_nan 24 128 x); reflexivity.
Qed.
Lemma rvv_merge_clamp_correct : forall x lo hi,
 Binary.is_nan 24 128 lo=false -> Binary.is_nan 24 128 hi=false ->
 rvv_merge (fp32_max_number
  (rvv_merge (fp32_min_number x hi) canonical_qnan (rvv_nanth x)) lo)
 canonical_qnan (rvv_nanth (rvv_merge (fp32_min_number x hi) canonical_qnan (rvv_nanth x)))=
 neon_clamp x lo hi.
Proof. intros; rewrite rvv_merge_min_correct by assumption; rewrite rvv_merge_max_correct by assumption; reflexivity. Qed.
Lemma neon_clamp_lower_nan : forall x lo hi,
 Binary.is_nan 24 128 lo=true -> neon_clamp x lo hi=canonical_qnan.
Proof. intros; unfold neon_clamp,fp32_neon_max; rewrite H, Bool.orb_true_r; reflexivity. Qed.
Lemma neon_clamp_upper_nan : forall x lo hi,
 Binary.is_nan 24 128 hi=true -> neon_clamp x lo hi=canonical_qnan.
Proof.
 intros; unfold neon_clamp,fp32_neon_min; rewrite H, Bool.orb_true_r.
 unfold fp32_neon_max; rewrite canonical_qnan_is_nan; reflexivity.
Qed.
Lemma rvv_merge_canonical_nan : forall lo,
 rvv_merge (fp32_max_number canonical_qnan lo) canonical_qnan (rvv_nanth canonical_qnan)=canonical_qnan.
Proof. reflexivity. Qed.
Print Assumptions fp32_self_eq_not_nan.
Print Assumptions fp32_self_ne_nan.
Print Assumptions rvv_merge_min_correct.
Print Assumptions rvv_merge_max_correct.
Print Assumptions rvv_merge_clamp_correct.
Print Assumptions neon_clamp_lower_nan.
Print Assumptions neon_clamp_upper_nan.
Print Assumptions rvv_merge_canonical_nan.
