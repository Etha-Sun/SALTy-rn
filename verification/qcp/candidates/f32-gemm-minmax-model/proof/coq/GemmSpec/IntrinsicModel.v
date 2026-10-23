From Coq Require Import ZArith List.
From SimpleC.SL Require Import FloatLib.
From Flocq.IEEE754 Require Import Binary.
From GemmSpec Require Import FmaModel.
Local Open Scope Z_scope.
(* Exact chosen value model under RNE/no-flush; no finite-only domain.
   NaN payload/sign and exception flags are outside the output observation.
   These are semantic definitions, not C body or ISA correspondence proofs. *)
Definition canonical_qnan : fp32 := fp32_of_bits 2143289344.
Definition fp32_zero_test (a : fp32) : bool :=
  orb (Z.eqb (bits_of_fp32 a) 0) (Z.eqb (bits_of_fp32 a) 2147483648).
Definition fp32_min_number (a b : fp32) : fp32 :=
  if Binary.is_nan 24 128 a then
    if Binary.is_nan 24 128 b then canonical_qnan else b
  else if Binary.is_nan 24 128 b then a
  else if andb (fp32_zero_test a) (fp32_zero_test b) then
    if orb (Binary.Bsign 24 128 a) (Binary.Bsign 24 128 b)
    then fp32_neg_zero else fp32_zero
  else match fp32_compare a b with Some Lt => a | _ => b end.
Definition fp32_max_number (a b : fp32) : fp32 :=
  if Binary.is_nan 24 128 a then
    if Binary.is_nan 24 128 b then canonical_qnan else b
  else if Binary.is_nan 24 128 b then a
  else if andb (fp32_zero_test a) (fp32_zero_test b) then
    if andb (Binary.Bsign 24 128 a) (Binary.Bsign 24 128 b)
    then fp32_neg_zero else fp32_zero
  else match fp32_compare a b with Some Gt => a | _ => b end.
Definition fp32_neon_min (a b : fp32) : fp32 :=
  if orb (Binary.is_nan 24 128 a) (Binary.is_nan 24 128 b)
  then canonical_qnan else fp32_min_number a b.
Definition fp32_neon_max (a b : fp32) : fp32 :=
  if orb (Binary.is_nan 24 128 a) (Binary.is_nan 24 128 b)
  then canonical_qnan else fp32_max_number a b.


Definition neon_clamp x lo hi := fp32_neon_max (fp32_neon_min x hi) lo.
Definition rvv_clamp x lo hi := fp32_max_number (fp32_min_number x hi) lo.
Definition qnan_input := fp32_of_bits 2143289344.
Definition one := fp32_of_bits 1065353216.
Definition minus_one := fp32_of_bits 3212836864.
Definition zero := fp32_of_bits 0.
Lemma original_clamp_nan_difference :
 bits_of_fp32 (neon_clamp (fma_rne qnan_input one zero) minus_one one)=2143289344 /\
 bits_of_fp32 (rvv_clamp (fma_rne qnan_input one zero) minus_one one)=1065353216.
Proof. vm_compute; split; reflexivity. Qed.
Lemma original_clamp_bits_unequal :
 bits_of_fp32 (neon_clamp (fma_rne qnan_input one zero) minus_one one) <>
 bits_of_fp32 (rvv_clamp (fma_rne qnan_input one zero) minus_one one).
Proof. vm_compute; discriminate. Qed.
Lemma fma_two_depth_order_preserved : forall a0 b0 a1 b1 acc,
 pair_schedule acc ((a0,b0)::(a1,b1)::nil)=
 scalar_schedule acc ((a0,b0)::(a1,b1)::nil).
Proof. intros; apply pair_schedule_matches_scalar. Qed.
Print Assumptions original_clamp_nan_difference.
Print Assumptions original_clamp_bits_unequal.
Print Assumptions fma_two_depth_order_preserved.
