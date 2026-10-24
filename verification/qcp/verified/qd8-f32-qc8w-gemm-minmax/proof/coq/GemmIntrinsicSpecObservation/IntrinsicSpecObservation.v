From Coq Require Import ZArith.
From Flocq.IEEE754 Require Import Binary BinarySingleNaN.
From SimpleC.SL Require Import FloatLib.
Local Open Scope Z_scope.

(* Observation lemma for mathematical intrinsic specifications. No software
   implementation is assumed. ISA-to-spec correspondence remains separate. *)
Definition gemm_spec_fp_observation (x y:fp32):Prop :=
 x=y \/ (Binary.is_nan 24 128 x=true /\ Binary.is_nan 24 128 y=true).
Definition gemm_spec_nan_policy :=
 fp32 -> fp32 -> fp32 -> {x:fp32 | Binary.is_nan 24 128 x=true}.

Theorem gemm_fma_nan_policy_observation : forall
 (p q:gemm_spec_nan_policy) x y z,
 gemm_spec_fp_observation
  (Binary.Bfma 24 128 eq_refl eq_refl p mode_NE x y z)
  (Binary.Bfma 24 128 eq_refl eq_refl q mode_NE x y z).
Proof.
 intros p q x y z;unfold Binary.Bfma,gemm_spec_fp_observation.
 destruct(@BinarySingleNaN.Bfma 24 128 eq_refl eq_refl mode_NE
  (Binary.B2BSN 24 128 x)(Binary.B2BSN 24 128 y)(Binary.B2BSN 24 128 z));
 try(left;reflexivity).
 right;destruct(p x y z)as[a Ha],(q x y z)as[b Hb];cbn;auto.
Qed.

Theorem gemm_fma_non_nan_policy_exact : forall
 (p q:gemm_spec_nan_policy) x y z,
 Binary.is_nan 24 128(Binary.Bfma 24 128 eq_refl eq_refl p mode_NE x y z)=false ->
 Binary.Bfma 24 128 eq_refl eq_refl p mode_NE x y z=
 Binary.Bfma 24 128 eq_refl eq_refl q mode_NE x y z.
Proof.
 intros p q x y z Hnot.
 destruct(gemm_fma_nan_policy_observation p q x y z)as[H|[H _]];
 [exact H|congruence].
Qed.

Print Assumptions gemm_fma_nan_policy_observation.
Print Assumptions gemm_fma_non_nan_policy_exact.
