From Coq Require Import ZArith List Lia.
From Qd8IGemm Require Export ReadOnlyPool.
From Qd8Indirect Require Import IndirectionModel.
From Qd8Public Require Export CandidateLogic.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.

Definition empty_reference := {| allocation_index:=0; byte_offset:=0 |}.
Definition reference_at (refs:list input_reference) j := Znth j refs empty_reference.
Definition total_depth K (refs:list input_reference) := K*Zlength refs.
Definition flat_inputs blocks refs K := concat (map (fun r => reference_values blocks r K) refs).
Definition input_mapping K zero zero_data offset (entries:list Z)
 (refs:list input_reference) (blocks:list input_block) : Prop :=
 Zlength entries=Zlength refs /\ forall j, 0<=j<Zlength refs ->
 let entry:=Znth j entries 0 in let r:=reference_at refs j in
 select_domain entry zero offset /\ reference_valid blocks r (a_read_extent K) /\
 selected_address entry zero zero_data offset=reference_address blocks r.
Definition allocation_bounds blocks := Forall (fun b =>
 0<block_base b /\ block_base b+Zlength (block_contents b)<=18446744073709551615) blocks.
Definition igemm_shape mr N K ks entries refs blocks zero zero_data offset Ps :=
 mr=1 /\ 0<N /\ 0<K /\ 0<Zlength refs /\ ks=8*Zlength refs /\
 Zlength Ps=panels N /\ Forall (panel_wf (total_depth K refs)) Ps /\
 input_mapping K zero zero_data offset entries refs blocks.
Definition igemm_capacity N K table w c blocks refs :=
 0<table /\ table+8*Zlength refs<=18446744073709551615 /\
 0<w /\ w mod 4=0 /\
 w+panels N*FullModel.panel_bytes (total_depth K refs)<=18446744073709551615 /\
 0<c /\ c+4*N<=18446744073709551615 /\ allocation_bounds blocks.
Definition igemm_inputs K table w entries refs blocks Ps : Assertion :=
 PtrArray.full table (Zlength entries) entries ** input_pool blocks **
 packed_matrix (total_depth K refs) w Ps.

Lemma padded_read_extent_covers_K : forall K, 0<=K -> K<=a_read_extent K.
Proof.
 intros;unfold a_read_extent.
 pose proof (Z.div_mod (K+7) 8 ltac:(lia)).
 pose proof (Z.mod_pos_bound (K+7) 8 ltac:(lia));lia.
Qed.
Lemma valid_reference_shorten : forall blocks r big small,
 reference_valid blocks r big -> 0<=small<=big -> reference_valid blocks r small.
Proof. unfold reference_valid;intros;tauto || lia. Qed.
Lemma mapping_reference_valid : forall K zero zero_data offset entries refs blocks j,
 0<K -> input_mapping K zero zero_data offset entries refs blocks ->
 0<=j<Zlength refs -> reference_valid blocks (reference_at refs j) K.
Proof.
 intros K zero zero_data offset entries refs blocks j HK [_ HM] Hj.
 specialize (HM j Hj);cbn zeta in HM;destruct HM as [_ [HR _]].
 eapply valid_reference_shorten;[exact HR|].
 pose proof (padded_read_extent_covers_K K ltac:(lia));lia.
Qed.

Lemma fixed_concat_length : forall (rows:list (list Z)) K,
 Forall (fun row => length row=K) rows ->
 length (concat rows)=(length rows*K)%nat.
Proof. intros rows K H;induction H;cbn;[reflexivity|rewrite app_length,H,IHForall;lia]. Qed.
Lemma fixed_concat_nth : forall (rows:list (list Z)) K j k,
 Forall (fun row => length row=K) rows ->
 (j<length rows)%nat -> (k<K)%nat ->
 nth (j*K+k)%nat (concat rows) 0 = nth k (nth j rows []) 0.
Proof.
 intros rows K j k H;revert j;induction H;intros j Hj Hk;[cbn in Hj;lia|].
 destruct j;cbn.
 - rewrite app_nth1;[reflexivity|lia].
 - rewrite app_nth2 by lia;rewrite H.
   replace (K+j*K+k-K)%nat with (j*K+k)%nat by lia.
   apply IHForall;cbn in Hj;lia.
Qed.

Lemma mapped_rows_length : forall K zero zero_data offset entries refs blocks,
 0<K -> input_mapping K zero zero_data offset entries refs blocks ->
 Forall (fun row => length row=Z.to_nat K)
  (map (fun r => reference_values blocks r K) refs).
Proof.
 intros K zero zero_data offset entries refs blocks HK HM.
 apply Forall_forall;intros row Hin;apply in_map_iff in Hin.
 destruct Hin as [r [<- Hin]].
 apply In_nth with (d:=empty_reference) in Hin;destruct Hin as [j [Hj Hr]].
 assert (HZ:0<=Z.of_nat j<Zlength refs) by (rewrite Zlength_correct;lia).
 pose proof (mapping_reference_valid K zero zero_data offset entries refs blocks (Z.of_nat j) HK HM HZ) as HR.
 unfold reference_at,Znth in HR;rewrite Nat2Z.id,Hr in HR.
 pose proof (reference_values_length blocks r K HR) as HL.
 rewrite Zlength_correct in HL;lia.
Qed.
Theorem flat_inputs_length : forall K zero zero_data offset entries refs blocks,
 0<K -> input_mapping K zero zero_data offset entries refs blocks ->
 Zlength (flat_inputs blocks refs K)=total_depth K refs.
Proof.
 intros;unfold flat_inputs,total_depth.
 rewrite Zlength_correct,fixed_concat_length with (K:=Z.to_nat K).
 - rewrite map_length,Zlength_correct,Nat2Z.inj_mul,Z2Nat.id by lia;ring.
 - eapply mapped_rows_length;eauto.
Qed.
Theorem flat_inputs_entry_byte : forall K zero zero_data offset entries refs blocks j k,
 0<K -> input_mapping K zero zero_data offset entries refs blocks ->
 0<=j<Zlength refs -> 0<=k<K ->
 Znth (j*K+k) (flat_inputs blocks refs K) 0 =
 Znth k (reference_values blocks (reference_at refs j) K) 0.
Proof.
 intros K zero zero_data offset entries refs blocks j k HK HM Hj Hk.
 unfold flat_inputs,reference_at,Znth.
 rewrite Z2Nat.inj_add,Z2Nat.inj_mul by nia.
 rewrite fixed_concat_nth with (K:=Z.to_nat K).
 - rewrite (@List.nth_indep (list Z) (map (fun r => reference_values blocks r K) refs) (Z.to_nat j) []
      (reference_values blocks empty_reference K)).
   + rewrite (@List.map_nth input_reference (list Z)
       (fun r => reference_values blocks r K) refs empty_reference (Z.to_nat j));reflexivity.
   + rewrite map_length,Zlength_correct in *;lia.
 - eapply mapped_rows_length;eauto.
 - rewrite map_length,Zlength_correct in *;lia.
 - lia.
Qed.
Print Assumptions flat_inputs_length.
Print Assumptions flat_inputs_entry_byte.

Definition input_window blocks refs K entry :=
 reference_values blocks (reference_at refs entry) (a_read_extent K).
Definition input_address blocks refs entry :=
 reference_address blocks (reference_at refs entry).
Definition input_window_frame blocks refs K entry :=
 reference_frame blocks (reference_at refs entry) (a_read_extent K).
Theorem open_mapped_input : forall K zero zero_data offset entries refs blocks entry,
 input_mapping K zero zero_data offset entries refs blocks ->
 0<=entry<Zlength refs ->
 input_pool blocks |--
 CharArray.full (input_address blocks refs entry) (a_read_extent K) (input_window blocks refs K entry) **
 input_window_frame blocks refs K entry.
Proof. intros;destruct H as [_ H];specialize(H entry H0);apply open_reference_window;exact (proj1 (proj2 H)). Qed.
Theorem close_mapped_input : forall K zero zero_data offset entries refs blocks entry,
 input_mapping K zero zero_data offset entries refs blocks ->
 0<=entry<Zlength refs ->
 CharArray.full (input_address blocks refs entry) (a_read_extent K) (input_window blocks refs K entry) **
 input_window_frame blocks refs K entry |-- input_pool blocks.
Proof. intros;destruct H as [_ H];specialize(H entry H0);apply close_reference_window;exact (proj1 (proj2 H)). Qed.
Theorem mapped_input_address : forall K zero zero_data offset entries refs blocks entry,
 input_mapping K zero zero_data offset entries refs blocks ->
 0<=entry<Zlength refs ->
 selected_address (Znth entry entries 0) zero zero_data offset=input_address blocks refs entry.
Proof. intros;destruct H as [_ H];specialize(H entry H0);exact (proj2 (proj2 H)). Qed.
Print Assumptions open_mapped_input.
Print Assumptions close_mapped_input.
