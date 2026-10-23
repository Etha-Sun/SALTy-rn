From Coq Require Import ZArith Reals List.
From SimpleC.SL Require Export FloatLib.
From Flocq.IEEE754 Require Import Binary.
Local Open Scope Z_scope.

(** Total mathematical single-rounding model. No libc fmaf C implementation
    or QCP builtin correspondence is established by this definition. *)
Definition fma_rne : fp32 -> fp32 -> fp32 -> fp32 :=
 Binary.Bfma 24 128 eq_refl eq_refl
   (fun x _ _ => fp32_unary_nan x) BinarySingleNaN.mode_NE.
Definition bit_same (x y : fp32) : Prop := x=y.

Lemma nan_left : forall a b c,
 fp32_isNaN a -> fp32_isNaN (fma_rne a b c).
Proof. intros a b c H; destruct a; try discriminate H; destruct b; destruct c; reflexivity. Qed.
Lemma nan_right : forall a b c,
 fp32_isNaN b -> fp32_isNaN (fma_rne a b c).
Proof. intros a b c H; destruct b; try discriminate H; destruct a; destruct c; reflexivity. Qed.
Lemma nan_accumulator : forall a b c,
 fp32_isNaN c -> fp32_isNaN (fma_rne a b c).
Proof. intros a b c H; destruct c; try discriminate H; destruct a; destruct b; reflexivity. Qed.
Lemma infinity_times_zero : forall c,
 fp32_isNaN (fma_rne (fp32_of_bits 2139095040) (fp32_of_bits 0) c).
Proof. intros c; destruct c; reflexivity. Qed.
Lemma opposite_infinities :
 fp32_isNaN (fma_rne (fp32_of_bits 2139095040) (fp32_of_bits 1065353216) (fp32_of_bits 4286578688)).
Proof. vm_compute; reflexivity. Qed.
Lemma negative_zero_preserved :
 bits_of_fp32 (fma_rne (fp32_of_bits 2147483648) (fp32_of_bits 1065353216) (fp32_of_bits 2147483648))=2147483648.
Proof. vm_compute; reflexivity. Qed.
Lemma overflow_to_positive_infinity :
 bits_of_fp32 (fma_rne (fp32_of_bits 2139095039) (fp32_of_bits 2139095039) (fp32_of_bits 0))=2139095040.
Proof. vm_compute; reflexivity. Qed.
Lemma underflow_tie_to_even_zero :
 bits_of_fp32 (fma_rne (fp32_of_bits 1) (fp32_of_bits 1056964608) (fp32_of_bits 0))=0.
Proof. vm_compute; reflexivity. Qed.
Lemma fused_rounding_witness :
 bits_of_fp32 (fma_rne (fp32_of_bits 1065353217) (fp32_of_bits 1065353214) (fp32_of_bits 3212836864))=2826960896.
Proof. vm_compute; reflexivity. Qed.
Lemma split_rounding_witness :
 bits_of_fp32 (fp32_add (fp32_mul (fp32_of_bits 1065353217) (fp32_of_bits 1065353214)) (fp32_of_bits 3212836864))=0.
Proof. vm_compute; reflexivity. Qed.

Fixpoint scalar_schedule (acc : fp32) (xs : list (fp32*fp32)) : fp32 :=
 match xs with nil => acc | (a,b)::rest => scalar_schedule (fma_rne a b acc) rest end.
Fixpoint pair_schedule (acc : fp32) (xs : list (fp32*fp32)) : fp32 :=
 match xs with
 | nil => acc
 | (a,b)::nil => fma_rne a b acc
 | (a0,b0)::(a1,b1)::rest => pair_schedule (fma_rne a1 b1 (fma_rne a0 b0 acc)) rest
 end.
Theorem pair_schedule_matches_scalar : forall xs acc,
 pair_schedule acc xs=scalar_schedule acc xs.
Proof. fix IH 1; intros [|[a0 b0] [|[a1 b1] rest]] acc; simpl; try reflexivity; apply IH. Qed.

(** A double intermediate is also insufficient: it can turn an exact value
    just below an fp32 midpoint into the midpoint before the final cast. *)
Definition via_double (a b c : fp32) : fp32 :=
 fp64_to_fp32 (fp64_add (fp64_mul (fp32_to_fp64 a) (fp32_to_fp64 b)) (fp32_to_fp64 c)).
Lemma double_rounding_fused_witness :
 bits_of_fp32 (fma_rne (fp32_of_bits 1065353217) (fp32_of_bits 864026622) (fp32_of_bits 1065353217))=1065353217.
Proof. vm_compute; reflexivity. Qed.
Lemma double_rounding_intermediate_witness :
 bits_of_fp32 (via_double (fp32_of_bits 1065353217) (fp32_of_bits 864026622) (fp32_of_bits 1065353217))=1065353218.
Proof. vm_compute; reflexivity. Qed.

Print Assumptions nan_left.
Print Assumptions nan_right.
Print Assumptions nan_accumulator.
Print Assumptions infinity_times_zero.
Print Assumptions opposite_infinities.
Print Assumptions negative_zero_preserved.
Print Assumptions overflow_to_positive_infinity.
Print Assumptions underflow_tie_to_even_zero.
Print Assumptions fused_rounding_witness.
Print Assumptions split_rounding_witness.
Print Assumptions pair_schedule_matches_scalar.
Print Assumptions double_rounding_fused_witness.
Print Assumptions double_rounding_intermediate_witness.
