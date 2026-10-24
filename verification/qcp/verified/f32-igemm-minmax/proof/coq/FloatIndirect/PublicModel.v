From Coq Require Import ZArith List Lia.
From FloatIndirect Require Export MatrixModel ClampRepair.
From NanBridge Require Export BridgeLogic.
From VaddComparator Require Export ComparatorLogic.
From GemmRepair Require Import ClampRepair Observation.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Definition ig_same_value := BridgeLogic.same_value.
Definition ig_outputs_related := ComparatorLogic.outputs_related.
Definition ig_bit_same (x y:fp32) : Prop := x=y.
Definition matches_reference := ClampRepair.repair_observed.
Definition ig_output_ref (c D N:Z) (A W:list fp32) (lo hi:fp32) : Assertion :=
  EX (L:list fp32),
    “ (Forall2 matches_reference L (igemm_output N D A W lo hi)) ” &&
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
  matches_reference x y -> ig_same_value x y.
Proof.
  intros. exact (repair_observed_implies_numeric_or_both_nan x y H).
Qed.
Lemma common_reference_outputs_related : forall L R V,
  Forall2 matches_reference L V -> Forall2 matches_reference R V ->
  ig_outputs_related L R.
Proof.
  intros L R V HL. revert R. induction HL;intros R HR;inversion HR;subst;constructor.
  - apply matches_reference_is_public.
    eapply matches_reference_transitive;[exact H|].
    now apply matches_reference_symmetric.
  - eapply IHHL;eauto.
Qed.

Lemma two_output_states_related : forall left right D N A W lo hi,
  ig_output_ref left D N A W lo hi **
  ig_output_ref right D N A W lo hi |--
  EX (L:list fp32) (R:list fp32),
    “ ig_outputs_related L R ” &&
    (FloatArray.full left N L ** FloatArray.full right N R).
Proof.
  intros. unfold ig_output_ref. Intros L R. Exists L R.
  assert (Hrel:ig_outputs_related L R).
  { eapply common_reference_outputs_related;eassumption. }
  entailer!.
Qed.


Definition ig_ret_one (r:Z) := r=1.
Definition ig_write_state (c N done:Z) (L:list fp32) :=
 FloatArray.full c done L ** FloatArray.undef_seg c done N.
Definition ig_fappend (L R:list fp32) := List.app L R.
Definition ig_output_prefix c N done D A W lo hi :=
 ig_write_state c N done (igemm_output done D A W lo hi).
Print Assumptions common_reference_outputs_related.
Print Assumptions two_output_states_related.
