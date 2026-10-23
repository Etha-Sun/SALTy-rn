From Coq Require Import ZArith Lia.
From FullU8 Require Import U8Logic.
Local Open Scope Z_scope.

(* Mathematical transcription of RVV V1.0 section 6.3; not a Sail theorem. *)
Definition legal_vl (capacity avl vl : Z) : Prop :=
  (0 <= avl <= capacity -> vl = avl) /\
  (capacity < avl < 2 * capacity -> (avl + 1) / 2 <= vl <= capacity) /\
  (2 * capacity <= avl -> vl = capacity).
Definition capped_avl (remaining : Z) := Z.min remaining 128.

Lemma capped_avl_bounds : forall remaining,
  0 < remaining -> 0 < capped_avl remaining <= 128 /\ capped_avl remaining <= remaining.
Proof.
  intros remaining H; unfold capped_avl.
  destruct (Z_le_gt_dec remaining 128).
  - rewrite Z.min_l by lia; lia.
  - rewrite Z.min_r by lia; lia.
Qed.

Theorem capped_request_forces_exact_vl : forall capacity remaining vl,
  128 <= capacity -> 0 < remaining ->
  legal_vl capacity (capped_avl remaining) vl -> vl = capped_avl remaining.
Proof.
  intros capacity remaining vl HC HR [Hexact _].
  pose proof (capped_avl_bounds remaining HR) as [[HP HU] HL].
  apply Hexact; lia.
Qed.

Theorem capped_request_matches_checked_model : forall remaining vl,
  0 < remaining -> legal_vl 128 (capped_avl remaining) vl -> vl = u8_vl remaining.
Proof.
  intros remaining vl HR HV.
  exact (capped_request_forces_exact_vl 128 remaining vl ltac:(lia) HR HV).
Qed.

Theorem cap_does_not_change_checked_policy : forall remaining,
  u8_vl (capped_avl remaining) = u8_vl remaining.
Proof. intro remaining; unfold u8_vl, capped_avl; rewrite <- Z.min_assoc; rewrite Z.min_id; reflexivity. Qed.

Theorem capped_loop_measure_decreases : forall capacity remaining vl,
  128 <= capacity -> 0 < remaining ->
  legal_vl capacity (capped_avl remaining) vl -> 0 <= remaining - vl < remaining.
Proof.
  intros capacity remaining vl HC HR HV.
  rewrite (capped_request_forces_exact_vl capacity remaining vl HC HR HV).
  pose proof (capped_avl_bounds remaining HR); lia.
Qed.

(* Witness of old policy latitude, not an output-correctness counterexample. *)
Theorem original_192_request_can_return_96 : legal_vl 128 192 96 /\ 96 <> u8_vl 192.
Proof.
  split.
  - unfold legal_vl; split; [lia|split].
    + intro H; change (96 <= 96 <= 128); lia.
    + lia.
  - change (96 <> 128); lia.
Qed.

Print Assumptions capped_avl_bounds.
Print Assumptions capped_request_forces_exact_vl.
Print Assumptions capped_request_matches_checked_model.
Print Assumptions cap_does_not_change_checked_policy.
Print Assumptions capped_loop_measure_decreases.
Print Assumptions original_192_request_can_return_96.
