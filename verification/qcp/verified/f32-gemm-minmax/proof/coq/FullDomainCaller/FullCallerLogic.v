From Coq Require Import ZArith List Lia.
From SimpleC.SL Require Import SeparationLogic.
From VaddComparator Require Import ComparatorLogic.
Require Import ResultBridge.
From FullDomainMemory Require Import OutputFinish.
From FullDomainRvv Require Import FullState MachineDomain.
From AUXLib Require Import ListLib.
Import Snaive_C_Rules64.
Import ListNotations.
Local Open Scope Z_scope.
Local Open Scope sac.

Lemma completed_rows_length : forall rows a w k nc lo hi,
 length (concat (map (fun r => full_row_values a w k (Z.of_nat r) nc lo hi) rows))
 = (length rows * Z.to_nat nc)%nat.
Proof.
 induction rows as [|r rest IH]; intros; [reflexivity|].
 cbn [map concat]; rewrite length_app,IH.
 unfold full_row_values; rewrite length_map,length_seq; cbn; lia.
Qed.

Lemma completed_values_length : forall a w k mr nc lo hi,
 0<=mr -> 0<=nc ->
 Zlength (completed_values a w k mr nc lo hi)=mr*nc.
Proof.
 intros; rewrite Zlength_correct.
 unfold completed_values; rewrite completed_rows_length,length_seq.
 rewrite Nat2Z.inj_mul,!Z2Nat.id by lia; reflexivity.
Qed.

Lemma completed_values_are_related : forall a w k mr nc lo hi,
 outputs_related (completed_values a w k mr nc lo hi)
                 (completed_values a w k mr nc lo hi).
Proof. intros; apply identical_outputs_are_related. Qed.

(** The existing generic comparator's bound follows from the actual C4nc
    allocation. This adds no new fixed matrix size or depth restriction. *)
Lemma complete_geometry_fits_comparator : forall mr nc,
 1<=mr<=4 -> 0<nc -> 16*nc<=18446744073709551615 ->
 0<mr*nc /\ mr*nc<=4611686018427387900.
Proof. intros; nia. Qed.

Lemma two_completed_output_states : forall left right mr nc k a w lo hi,
 1<=mr<=4 -> 0<=nc ->
 output_state left mr nc k nc a w lo hi **
 output_state right mr nc k nc a w lo hi |--
 “ (outputs_related (completed_values a w k mr nc lo hi)
                     (completed_values a w k mr nc lo hi)) ” &&
 (FloatArray.full left (mr*nc) (completed_values a w k mr nc lo hi) **
  FloatArray.undef_seg left (mr*nc) (4*nc) **
  FloatArray.full right (mr*nc) (completed_values a w k mr nc lo hi) **
  FloatArray.undef_seg right (mr*nc) (4*nc)).
Proof.
 intros left right mr nc k a w lo hi Hmr Hnc.
 sep_apply (completed_output_state left mr nc k a w lo hi Hmr Hnc).
 sep_apply (completed_output_state right mr nc k a w lo hi Hmr Hnc).
 pose proof (completed_values_are_related a w k mr nc lo hi).
 entailer!.
Qed.

Print Assumptions completed_values_length.
Print Assumptions completed_values_are_related.
Print Assumptions complete_geometry_fits_comparator.
Print Assumptions two_completed_output_states.
