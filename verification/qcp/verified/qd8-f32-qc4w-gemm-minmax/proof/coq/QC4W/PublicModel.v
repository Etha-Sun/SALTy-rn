From Coq Require Import ZArith List Lia.
From SimpleC.SL Require Export Mem SeparationLogic.
From QC4W Require Export MatrixModel NibbleModel.
From NanBridge Require Import BridgeLogic.
From VaddComparator Require Import ComparatorLogic.
From GemmRepair Require Import ClampRepair Observation.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.

Definition qc4_same_value := BridgeLogic.same_value.
Definition qc4_outputs_related := ComparatorLogic.outputs_related.
Definition qc4_bit_same (x y:fp32) : Prop := x=y.
Definition matches_reference := ClampRepair.repair_observed.
Definition qc4_output_ref (c K N zp:Z) (A:list Z) (Ps:list qc4_panel)
                          (inv lo hi:fp32) : Assertion :=
  EX (L:list fp32),
    “ (Forall2 matches_reference L (qc4_values K N zp A Ps inv lo hi)) ” &&
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
  matches_reference x y -> qc4_same_value x y.
Proof.
  intros. exact (repair_observed_implies_numeric_or_both_nan x y H).
Qed.
Lemma common_reference_outputs_related : forall L R V,
  Forall2 matches_reference L V -> Forall2 matches_reference R V ->
  qc4_outputs_related L R.
Proof.
  intros L R V HL. revert R. induction HL;intros R HR;inversion HR;subst;constructor.
  - apply matches_reference_is_public.
    eapply matches_reference_transitive;[exact H|].
    now apply matches_reference_symmetric.
  - eapply IHHL;eauto.
Qed.

Lemma two_output_states_related : forall left right K N zp A Ps inv lo hi,
  qc4_output_ref left K N zp A Ps inv lo hi **
  qc4_output_ref right K N zp A Ps inv lo hi |--
  EX (L:list fp32) (R:list fp32),
    “ qc4_outputs_related L R ” &&
    (FloatArray.full left N L ** FloatArray.full right N R).
Proof.
  intros. unfold qc4_output_ref. Intros L R. Exists L R.
  assert (Hrel:qc4_outputs_related L R).
  { eapply common_reference_outputs_related;eassumption. }
  entailer!.
Qed.

Definition qc4_ret_one (r:Z):Prop := r=1.
Definition qc4_write_state (c N done:Z)(L:list fp32) :=
 FloatArray.full c done L ** FloatArray.undef_seg c done N.
Definition qc4_output_prefix c N done K zp A Ps inv lo hi :=
 qc4_write_state c N done (qc4_values K done zp A Ps inv lo hi).
Definition qc4_domain_shape mr N K (Ps:list qc4_panel) :=
 mr=1 /\ 0<N /\ 0<K /\ Zlength Ps=qc4_panels N /\ Forall (qc4_panel_wf K) Ps.
Definition qc4_data_capacity N K a w c :=
 0<a /\ 0<w /\ 0<c /\ w mod 4=0 /\
 a+qc4_a_extent K<=18446744073709551615 /\
 w+qc4_panels N*panel_bytes K<=18446744073709551615 /\
 c+4*N<=18446744073709551615.
Lemma qc4_values_length : forall K N zp A Ps inv lo hi,
 0<=N -> Zlength(qc4_values K N zp A Ps inv lo hi)=N.
Proof. intros;unfold qc4_values;rewrite Zlength_correct,map_length,seq_length,Z2Nat.id by lia;reflexivity. Qed.
Print Assumptions common_reference_outputs_related.
Print Assumptions two_output_states_related.
Print Assumptions qc4_values_length.
