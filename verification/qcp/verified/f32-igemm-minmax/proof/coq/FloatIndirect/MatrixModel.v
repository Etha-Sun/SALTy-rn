From Coq Require Import ZArith List Lia.
From FloatIndirect Require Export InputMapping.
From GemmSpec Require Import FmaModel IntrinsicModel.
From FullDomainRvv Require Import FullModel.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.

(* Float-cell layout: one bias vector, followed by entry-major K vectors. *)
Definition packed_length N D := panel_count N*8*(D+1).
Definition allocation_bounds blocks := Forall (fun b =>
 0<block_base b /\ block_base b mod 4=0 /\
 block_base b+4*Zlength (block_contents b)<ptr_modulus) blocks.
Definition igemm_shape mr N K ks entries refs blocks zero offset (weights:list fp32) :=
 mr=1 /\ 0<N /\ 0<K /\ 0<Zlength refs /\ ks=8*Zlength refs /\
 Zlength weights=packed_length N (total_depth K refs) /\
 input_mapping K zero offset entries refs blocks.
Definition igemm_capacity N K table w c blocks refs :=
 0<table /\ table mod 8=0 /\ table+8*Zlength refs<ptr_modulus /\
 0<w /\ w mod 4=0 /\
 w+4*packed_length N (total_depth K refs)<ptr_modulus /\
 0<c /\ c mod 4=0 /\ c+4*N<ptr_modulus /\
 4*K<ptr_modulus /\ allocation_bounds blocks.
Definition igemm_inputs table w entries blocks weights : Assertion :=
 PtrArray.full table (Zlength entries) entries ** input_pool blocks **
 FloatArray.full w (Zlength weights) weights.

Fixpoint igemm_acc_nat (d:nat) (D col:Z) (inputs weights:list fp32) : fp32 :=
 match d with
 | O => Znth (packed_bias_index D col) weights fp32_zero
 | S t => fma_rne (Znth (Z.of_nat t) inputs fp32_zero)
   (Znth (packed_weight_index D col (Z.of_nat t)) weights fp32_zero)
   (igemm_acc_nat t D col inputs weights)
 end.
Definition igemm_acc d D col inputs weights :=
 igemm_acc_nat (Z.to_nat d) D col inputs weights.
Definition igemm_output N D inputs weights lo hi :=
 map (fun i => neon_clamp (igemm_acc D D (Z.of_nat i) inputs weights) lo hi)
 (seq 0 (Z.to_nat N)).

Lemma igemm_acc_zero : forall D col inputs weights,
 igemm_acc 0 D col inputs weights=Znth (packed_bias_index D col) weights fp32_zero.
Proof. reflexivity. Qed.
Lemma igemm_acc_step : forall d D col inputs weights, 0<=d ->
 igemm_acc (d+1) D col inputs weights =
 fma_rne (Znth d inputs fp32_zero)
 (Znth (packed_weight_index D col d) weights fp32_zero)
 (igemm_acc d D col inputs weights).
Proof.
 intros;unfold igemm_acc;rewrite Z2Nat.inj_add by lia.
 replace (Z.to_nat 1) with 1%nat by reflexivity;rewrite Nat.add_1_r.
 cbn [igemm_acc_nat];rewrite Z2Nat.id by lia;reflexivity.
Qed.
Lemma igemm_entry_step : forall K zero offset entries refs blocks entry k col weights,
 0<K -> input_mapping K zero offset entries refs blocks ->
 0<=entry<Zlength refs -> 0<=k<K ->
 igemm_acc (entry*K+k+1) (total_depth K refs) col (flat_inputs blocks refs K) weights =
 fma_rne (Znth k (input_window blocks refs K entry) fp32_zero)
 (Znth (packed_weight_index (total_depth K refs) col (entry*K+k)) weights fp32_zero)
 (igemm_acc (entry*K+k) (total_depth K refs) col (flat_inputs blocks refs K) weights).
Proof.
 intros;rewrite igemm_acc_step by nia.
 rewrite (flat_inputs_entry_float K zero offset entries refs blocks entry k) by assumption.
 reflexivity.
Qed.
Lemma igemm_entry_pair : forall K zero offset entries refs blocks entry k col weights,
 0<K -> input_mapping K zero offset entries refs blocks ->
 0<=entry<Zlength refs -> 0<=k -> k+1<K ->
 igemm_acc (entry*K+k+2) (total_depth K refs) col (flat_inputs blocks refs K) weights =
 fma_rne (Znth (k+1) (input_window blocks refs K entry) fp32_zero)
 (Znth (packed_weight_index (total_depth K refs) col (entry*K+k+1)) weights fp32_zero)
 (fma_rne (Znth k (input_window blocks refs K entry) fp32_zero)
 (Znth (packed_weight_index (total_depth K refs) col (entry*K+k)) weights fp32_zero)
 (igemm_acc (entry*K+k) (total_depth K refs) col (flat_inputs blocks refs K) weights)).
Proof.
 intros.
 replace (entry*K+k+2) with (entry*K+(k+1)+1) by ring.
 rewrite (igemm_entry_step K zero offset entries refs blocks entry (k+1)) by (assumption||lia).
 replace (entry*K+(k+1)) with (entry*K+k+1) by ring.
 rewrite (igemm_entry_step K zero offset entries refs blocks entry k) by (assumption||lia).
 reflexivity.
Qed.
Lemma igemm_entry_end : forall entry K D col inputs weights,
 igemm_acc (entry*K+K) D col inputs weights =
 igemm_acc ((entry+1)*K) D col inputs weights.
Proof. intros;f_equal;ring. Qed.
Lemma igemm_output_length : forall N D inputs weights lo hi, 0<=N ->
 Zlength (igemm_output N D inputs weights lo hi)=N.
Proof. intros;unfold igemm_output;rewrite Zlength_correct,map_length,seq_length,Z2Nat.id by lia;reflexivity. Qed.
Lemma igemm_entry_weight_bounds : forall N K entries entry k col,
 0<N -> 0<K -> 0<entries -> 0<=entry<entries -> 0<=k<K -> 0<=col<N ->
 0<=packed_weight_index (K*entries) col (entry*K+k)<packed_length N (K*entries).
Proof.
 intros;unfold packed_length.
 apply (proj2 (packed_bias_and_weight_bounds N (K*entries) col (entry*K+k)
 ltac:(lia) ltac:(nia) ltac:(lia) ltac:(nia))).
Qed.
Print Assumptions igemm_entry_step.
Print Assumptions igemm_entry_pair.
Print Assumptions igemm_entry_end.
Print Assumptions igemm_output_length.
Print Assumptions igemm_entry_weight_bounds.
