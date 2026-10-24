From Coq Require Import ZArith.
From SimpleC.SL Require Import FloatLib.
From Flocq.IEEE754 Require Import Binary.
From GemmSpec Require Import IntrinsicModel.
From GemmRepair Require Import ClampRepair.

Definition numeric_or_both_nan (a b:fp32):Prop :=
 fp32_eq a b\/(fp32_isNaN a/\fp32_isNaN b).
Lemma repair_observed_implies_numeric_or_both_nan : forall a b,
 repair_observed a b ->numeric_or_both_nan a b.
Proof.
 intros a b [He|Hnan].
 - subst b;unfold numeric_or_both_nan.
   destruct(Binary.is_nan 24 128 a)eqn:HN.
   + right;split;exact HN.
   + left;unfold fp32_eq.
     pose proof(repair_une_self_is_nan a)as Hself;rewrite HN in Hself.
     unfold repair_une in Hself.
     destruct(fp32_compare a a)as[[| |]|]eqn:HC;try discriminate;reflexivity.
 - right;exact Hnan.
Qed.
Theorem repaired_clamp_numeric_observation : forall x lo hi,
 numeric_or_both_nan(repaired_clamp x lo hi)(neon_clamp x lo hi).
Proof.
 intros;apply repair_observed_implies_numeric_or_both_nan.
 left;apply repaired_clamp_matches_neon.
Qed.
Theorem repaired_clamp_any_nan_numeric_observation : forall replacement x lo hi,
 Binary.is_nan 24 128 replacement=true ->
 numeric_or_both_nan(repaired_clamp_using replacement x lo hi)(neon_clamp x lo hi).
Proof.
 intros;apply repair_observed_implies_numeric_or_both_nan.
 now apply repaired_clamp_any_nan_choice_observed.
Qed.
Print Assumptions repair_observed_implies_numeric_or_both_nan.
Print Assumptions repaired_clamp_numeric_observation.
Print Assumptions repaired_clamp_any_nan_numeric_observation.
