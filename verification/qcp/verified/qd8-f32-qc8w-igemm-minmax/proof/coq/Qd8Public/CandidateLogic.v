From Coq Require Import ZArith List Lia.
From SimpleC.SL Require Export Mem SeparationLogic.
From Qd8FullKernel Require Export FullModel.
From NanBridge Require Import BridgeLogic.
From VaddComparator Require Import ComparatorLogic.
From GemmRepair Require Import ClampRepair Observation.
Require Import MixedPacked.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.

Definition qd8_same_value := BridgeLogic.same_value.
Definition qd8_outputs_related := ComparatorLogic.outputs_related.
Definition qd8_bit_same (x y:fp32) : Prop := x=y.
Definition matches_reference := ClampRepair.repair_observed.
Definition qd8_output_ref (c K N zp:Z) (A:list Z) (Ps:list panel_data)
                          (inv lo hi:fp32) : Assertion :=
  EX (L:list fp32),
    “ (Forall2 matches_reference L (completed_values K N zp A Ps inv lo hi)) ” &&
    FloatArray.full c N L.

Lemma matches_reference_symmetric : forall x y,
  matches_reference x y -> matches_reference y x.
Proof. intros x y [H|[Hx Hy]];[left;congruence|right;auto]. Qed.
Lemma matches_reference_transitive : forall x y z,
  matches_reference x y -> matches_reference y z -> matches_reference x z.
Proof.
  intros x y z [Hxy|[Hx Hy]] [Hyz|[Hy' Hz]];
  unfold matches_reference,repair_observed in *;subst;auto.
Qed.
Lemma matches_reference_is_public : forall x y,
  matches_reference x y -> qd8_same_value x y.
Proof.
  intros. exact (repair_observed_implies_numeric_or_both_nan x y H).
Qed.
Lemma common_reference_outputs_related : forall L R V,
  Forall2 matches_reference L V -> Forall2 matches_reference R V ->
  qd8_outputs_related L R.
Proof.
  intros L R V HL. revert R. induction HL;intros R HR;inversion HR;subst;constructor.
  - apply matches_reference_is_public.
    eapply matches_reference_transitive;[exact H|].
    now apply matches_reference_symmetric.
  - eapply IHHL;eauto.
Qed.

Lemma two_output_states_related : forall left right K N zp A Ps inv lo hi,
  qd8_output_ref left K N zp A Ps inv lo hi **
  qd8_output_ref right K N zp A Ps inv lo hi |--
  EX (L:list fp32) (R:list fp32),
    “ qd8_outputs_related L R ” &&
    (FloatArray.full left N L ** FloatArray.full right N R).
Proof.
  intros. unfold qd8_output_ref. Intros L R. Exists L R.
  assert (Hrel:qd8_outputs_related L R).
  { eapply common_reference_outputs_related;eassumption. }
  entailer!.
Qed.

Lemma qd8_block_base_aligned : forall w K ks ws scales biases,
  qd8_block w K ks ws scales biases |-- “ aligned_4 w ”.
Proof.
  intros. unfold qd8_block.
  sep_apply (IntArray.full_split_to_missing_i w 0 8 ks 0);[|lia].
  unfold StoreIntAsElement.storeA. rewrite sizeof_int.
  replace (w+0*4) with w by lia.
  prop_apply (valid_store_int w (Znth 0 ks 0));Intros.
  unfold isvalidptr_int in *;entailer!.
Qed.

Lemma qd8_panel_address_aligned : forall w K p,
  aligned_4 w -> aligned_4 (w+p*panel_bytes K).
Proof.
  intros w K p H. unfold aligned_4 in *.
  apply Z.mod_divide in H;[|lia]. destruct H as [q Hq].
  apply Z.mod_divide;[lia|]. exists (q+p*(24+2*K)).
  unfold panel_bytes. nia.
Qed.

Print Assumptions common_reference_outputs_related.
Print Assumptions two_output_states_related.
Print Assumptions qd8_block_base_aligned.
Print Assumptions qd8_panel_address_aligned.
