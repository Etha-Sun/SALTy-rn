From Coq Require Import ZArith Bool.
From SimpleC.SL Require Import FloatLib.
From Flocq.IEEE754 Require Import Binary.
From GemmSpec Require Import IntrinsicModel.
From GemmRepair Require Import ClampRepair Observation.

(* Matches this kernel's joint bound test and one pre-clamp mask. *)
Definition joint_clamp_using replacement x lo hi :=
 if orb (Binary.is_nan 24 128 hi) (Binary.is_nan 24 128 lo)
 then replacement
 else repair_merge (rvv_clamp x lo hi) replacement (repair_une x x).

Lemma min_number_not_nan : forall x hi,
 Binary.is_nan 24 128 x=false -> Binary.is_nan 24 128 hi=false ->
 Binary.is_nan 24 128 (fp32_min_number x hi)=false.
Proof.
 intros x hi Hx Hhi;unfold fp32_min_number;rewrite Hx,Hhi.
 destruct (andb (fp32_zero_test x) (fp32_zero_test hi)).
 - destruct (orb (Binary.Bsign 24 128 x) (Binary.Bsign 24 128 hi));reflexivity.
 - destruct (fp32_compare x hi) as [[| |]|];assumption.
Qed.
Lemma joint_clamp_matches_neon : forall x lo hi,
 joint_clamp_using canonical_qnan x lo hi=neon_clamp x lo hi.
Proof.
 intros;unfold joint_clamp_using,repair_merge;rewrite repair_une_self_is_nan.
 unfold neon_clamp,fp32_neon_min,fp32_neon_max.
 destruct (Binary.is_nan 24 128 x) eqn:Hx;
 destruct (Binary.is_nan 24 128 hi) eqn:Hhi;
 destruct (Binary.is_nan 24 128 lo) eqn:Hlo;cbn;
 try reflexivity.
 all: rewrite (min_number_not_nan x hi Hx Hhi);reflexivity.
Qed.
Theorem joint_clamp_any_nan_observed : forall replacement x lo hi,
 Binary.is_nan 24 128 replacement=true ->
 repair_observed (joint_clamp_using replacement x lo hi) (neon_clamp x lo hi).
Proof.
 intros replacement x lo hi Hr;rewrite <- joint_clamp_matches_neon.
 unfold joint_clamp_using,repair_merge;rewrite repair_une_self_is_nan.
 destruct (orb (Binary.is_nan 24 128 hi) (Binary.is_nan 24 128 lo));
 try destruct (Binary.is_nan 24 128 x);unfold repair_observed;
 auto using canonical_qnan_is_nan.
Qed.
Theorem joint_clamp_numeric_observation : forall replacement x lo hi,
 Binary.is_nan 24 128 replacement=true ->
 numeric_or_both_nan (joint_clamp_using replacement x lo hi) (neon_clamp x lo hi).
Proof.
 intros;apply repair_observed_implies_numeric_or_both_nan.
 now apply joint_clamp_any_nan_observed.
Qed.
Print Assumptions joint_clamp_matches_neon.
Print Assumptions joint_clamp_any_nan_observed.
Print Assumptions joint_clamp_numeric_observation.
