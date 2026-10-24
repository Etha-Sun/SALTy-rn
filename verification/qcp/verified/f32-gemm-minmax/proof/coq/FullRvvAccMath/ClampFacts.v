From Coq Require Import ZArith Bool.
From GemmRvv Require Import Model.
From GemmRvvLoop Require Import ClampFacts.
From Flocq.IEEE754 Require Import Binary.
Local Open Scope Z_scope.

(* Typed reuse of the already checked, all-fp32 scalar clamp bridge.
   This file introduces no new floating-point semantic assumption. *)
Lemma fp32_self_eq_not_nan : forall x,
  fp32_eq x x -> Binary.is_nan 24 128 x = false.
Proof. exact GemmRvvLoop.ClampFacts.fp32_self_eq_not_nan. Qed.

Lemma fp32_self_ne_nan : forall x,
  fp32_ne x x -> Binary.is_nan 24 128 x = true.
Proof. exact GemmRvvLoop.ClampFacts.fp32_self_ne_nan. Qed.

Lemma rvv_merge_min_correct : forall x hi,
  Binary.is_nan 24 128 hi = false ->
  rvv_merge (fp32_min_number x hi) canonical_qnan (rvv_nanth x) = fp32_neon_min x hi.
Proof. exact GemmRvvLoop.ClampFacts.rvv_merge_min_correct. Qed.

Lemma rvv_merge_max_correct : forall x lo,
  Binary.is_nan 24 128 lo = false ->
  rvv_merge (fp32_max_number x lo) canonical_qnan (rvv_nanth x) = fp32_neon_max x lo.
Proof. exact GemmRvvLoop.ClampFacts.rvv_merge_max_correct. Qed.

Lemma neon_clamp_lower_nan : forall x lo hi,
  Binary.is_nan 24 128 lo = true -> neon_clamp x lo hi = canonical_qnan.
Proof. exact GemmRvvLoop.ClampFacts.neon_clamp_lower_nan. Qed.

Lemma neon_clamp_upper_nan : forall x lo hi,
  Binary.is_nan 24 128 hi = true -> neon_clamp x lo hi = canonical_qnan.
Proof. exact GemmRvvLoop.ClampFacts.neon_clamp_upper_nan. Qed.

Print Assumptions fp32_self_eq_not_nan.
Print Assumptions fp32_self_ne_nan.
Print Assumptions rvv_merge_min_correct.
Print Assumptions rvv_merge_max_correct.
Print Assumptions neon_clamp_lower_nan.
Print Assumptions neon_clamp_upper_nan.
