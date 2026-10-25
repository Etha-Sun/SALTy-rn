From Coq Require Import ZArith List Bool.
From Flocq.IEEE754 Require Import Binary BinarySingleNaN.
From GemmRepair Require Import ClampRepair Observation.
From F32Admission Require Import Boundary.
From SpmmSpec Require Import Model.
Import ListNotations.
Local Open Scope Z_scope.

(** Architecture-dependent NaN payload selection is observed only as NaN.
    The sparse order and single rounding at every depth are unchanged. *)
Fixpoint spmm_policy_acc_nat (policy:nan_policy) (swapped:bool) (depth:nat)
 (column row start:Z)(nnz deltas:list Z)(input weights:list fp32) : fp32 :=
 match depth with
 | O=>fp_at weights (bias_index nnz column)
 | S k=>
   let x:=fp_at input (input_index deltas start row (nnz_before nnz column+Z.of_nat k)) in
   let w:=fp_at weights (bias_index nnz column+1+Z.of_nat k) in
   let acc:=spmm_policy_acc_nat policy swapped k column row start nnz deltas input weights in
   if swapped then Binary.Bfma 24 128 eq_refl eq_refl policy mode_NE w x acc
   else Binary.Bfma 24 128 eq_refl eq_refl policy mode_NE x w acc
 end.

Theorem spmm_acc_nan_policy_independent : forall depth policy swapped column row start nnz deltas input weights,
 repair_observed
 (spmm_policy_acc_nat policy swapped depth column row start nnz deltas input weights)
 (spmm_acc_nat depth column row start nnz deltas input weights).
Proof.
 induction depth;intros;cbn [spmm_policy_acc_nat spmm_acc_nat];[apply observed_refl|].
 destruct swapped.
 - rewrite fma_multiplicands_swap;unfold fma_rne.
   apply fma_observation_congruent;auto using observed_refl.
 - unfold fma_rne;apply fma_observation_congruent;auto using observed_refl.
Qed.

Theorem spmm_cell_policy_observation : forall policy swapped column row start nnz deltas input weights lo hi replacement,
 Binary.is_nan 24 128 replacement=true ->
 numeric_or_both_nan
 (repaired_clamp_using replacement
   (spmm_policy_acc_nat policy swapped (Z.to_nat(z_at nnz column)) column row start nnz deltas input weights) lo hi)
 (spmm_cell column row start nnz deltas input weights lo hi).
Proof.
 intros;apply repair_observed_implies_numeric_or_both_nan.
 eapply observed_trans;[apply repaired_clamp_any_nan_choice_observed;exact H|].
 unfold spmm_cell,spmm_acc;apply neon_clamp_observation_congruent.
 apply spmm_acc_nan_policy_independent.
Qed.

Print Assumptions spmm_acc_nan_policy_independent.
Print Assumptions spmm_cell_policy_observation.
