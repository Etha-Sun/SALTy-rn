From Coq Require Import ZArith List Lia.
From GemmSpec Require Import FmaModel IntrinsicModel.
From GemmNeon Require Import KernelModel.
From GemmKernelBridge Require Import ScheduleBridge.
From GemmRepair Require Import ClampRepair Observation.
Import ListNotations.
Local Open Scope Z_scope.

(** Parameterized mathematical outputs, not a theorem about either C body.
    Actual C loads, stores, aliasing, bounds and control flow remain separate
    obligations. No floating point value is excluded. *)
Definition depth_operands (k row col:Z) (a w:list fp32) :=
 map (fun t => (gget (row*k+Z.of_nat t) a,
                 gget (weight_index k col (Z.of_nat t)) w))
     (seq 0 (Z.to_nat k)).
Definition neon_cell (k row col:Z) (a w:list fp32) (lo hi:fp32) :=
 neon_clamp (pair_schedule (gget (bias_index k col) w)
                          (depth_operands k row col a w)) lo hi.
Definition repaired_rvv_cell_using (replacement:fp32)
 (k row col:Z) (a w:list fp32) (lo hi:fp32) :=
 repaired_clamp_using replacement
  (scalar_schedule (gget (bias_index k col) w)
                   (depth_operands k row col a w)) lo hi.

Theorem every_cell_canonical_matches : forall k row col a w lo hi,
 repaired_rvv_cell_using canonical_qnan k row col a w lo hi =
 neon_cell k row col a w lo hi.
Proof.
 intros; unfold repaired_rvv_cell_using,neon_cell.
 rewrite pair_schedule_matches_scalar.
 apply repaired_clamp_matches_neon.
Qed.

Theorem every_cell_any_nan_observed : forall replacement k row col a w lo hi,
 Binary.is_nan 24 128 replacement=true ->
 numeric_or_both_nan
  (repaired_rvv_cell_using replacement k row col a w lo hi)
  (neon_cell k row col a w lo hi).
Proof.
 intros; unfold repaired_rvv_cell_using,neon_cell.
 rewrite pair_schedule_matches_scalar.
 now apply repaired_clamp_any_nan_numeric_observation.
Qed.

Definition output_positions (mr nc:Z) : list (Z*Z) :=
 map (fun q => (Z.of_nat q / nc, Z.of_nat q mod nc))
     (seq 0 (Z.to_nat (mr*nc))).
Definition neon_matrix (mr nc k:Z) (a w:list fp32) (lo hi:fp32) :=
 map (fun rc => neon_cell k (fst rc) (snd rc) a w lo hi)
     (output_positions mr nc).
Definition repaired_rvv_matrix_using (replacement:fp32)
 (mr nc k:Z) (a w:list fp32) (lo hi:fp32) :=
 map (fun rc => repaired_rvv_cell_using replacement k (fst rc) (snd rc)
                                        a w lo hi)
     (output_positions mr nc).

Theorem full_domain_operand_indices_in_bounds :
 forall mr nc k row col depth,
 1<=mr<=4 -> 0<nc -> 0<k -> 0<=row<mr ->
 0<=col<nc -> 0<=depth<k ->
 0<=row*k+depth<4*k /\
 0<=bias_index k col<blocks nc*(k+1)*8 /\
 0<=weight_index k col depth<blocks nc*(k+1)*8.
Proof.
 intros mr nc k row col depth Hmr Hnc Hk Hr Hc Hd.
 split; [nia|now apply packed_indices_in_bounds].
Qed.

Theorem all_dimensions_canonical_models_match : forall mr nc k a w lo hi,
 repaired_rvv_matrix_using canonical_qnan mr nc k a w lo hi =
 neon_matrix mr nc k a w lo hi.
Proof.
 intros; unfold repaired_rvv_matrix_using,neon_matrix.
 apply map_ext; intros [row col]; apply every_cell_canonical_matches.
Qed.

Theorem all_dimensions_any_nan_models_observed :
 forall replacement mr nc k a w lo hi,
 Binary.is_nan 24 128 replacement=true ->
 Forall2 numeric_or_both_nan
  (repaired_rvv_matrix_using replacement mr nc k a w lo hi)
  (neon_matrix mr nc k a w lo hi).
Proof.
 intros; unfold repaired_rvv_matrix_using,neon_matrix.
 induction (output_positions mr nc) as [|[row col] rest IH]; cbn.
 - constructor.
 - constructor; [now apply every_cell_any_nan_observed|exact IH].
Qed.

Theorem matrix_output_length : forall mr nc k a w lo hi,
 length (neon_matrix mr nc k a w lo hi)=Z.to_nat (mr*nc).
Proof.
 intros; unfold neon_matrix,output_positions.
 now rewrite !length_map,length_seq.
Qed.

Print Assumptions every_cell_canonical_matches.
Print Assumptions every_cell_any_nan_observed.
Print Assumptions all_dimensions_canonical_models_match.
Print Assumptions all_dimensions_any_nan_models_observed.
Print Assumptions matrix_output_length.
Print Assumptions full_domain_operand_indices_in_bounds.
