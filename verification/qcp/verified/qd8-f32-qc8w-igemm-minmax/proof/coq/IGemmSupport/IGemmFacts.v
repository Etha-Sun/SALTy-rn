From Coq Require Import ZArith List Lia.
From Qd8IGemm Require Export IGemmModel.
From Qd8RvvArith Require Import RvvArithmetic.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.

Lemma igemm_shape_facts : forall mr N K ks entries refs blocks zero zero_data offset Ps,
 igemm_shape mr N K ks entries refs blocks zero zero_data offset Ps ->
 0 < total_depth K refs /\ Z.quot ks 8=Zlength refs /\
 Zlength entries=Zlength refs /\ 0<Zlength Ps /\
 qd8_matrix_wf (total_depth K refs) Ps.
Proof.
 intros mr N K ks entries refs blocks zero zero_data offset Ps H.
 destruct H as [Hm [HN [HK [HR [HS [HP [HW HM]]]]]]].
 destruct HM as [HE HM].
 assert (Hks:0<=ks) by nia.
 rewrite Z.quot_div_nonneg by lia.
 assert (Hdiv:ks/8=Zlength refs).
 { rewrite HS,Z.mul_comm,Z.div_mul by lia;reflexivity. }
 unfold total_depth,qd8_matrix_wf;repeat split;auto;try nia.
 rewrite HP;apply rvv_panels_positive;assumption.
Qed.

Lemma reference_values_prefix_byte : forall blocks r small big k,
 reference_valid blocks r big -> 0<=small<=big -> 0<=k<small ->
 Znth k (reference_values blocks r small) 0 =
 Znth k (reference_values blocks r big) 0.
Proof.
 intros blocks r small big k [_ [Ho [Hb He]]] Hs Hk.
 unfold reference_values;rewrite !Znth_sublist by lia;reflexivity.
Qed.

Lemma flat_inputs_window_byte : forall K zero zero_data offset entries refs blocks j k,
 0<K -> input_mapping K zero zero_data offset entries refs blocks ->
 0<=j<Zlength refs -> 0<=k<K ->
 Znth (j*K+k) (flat_inputs blocks refs K) 0 =
 Znth k (input_window blocks refs K j) 0.
Proof.
 intros K zero zero_data offset entries refs blocks j k HK HM Hj Hk.
 rewrite (flat_inputs_entry_byte K zero zero_data offset entries refs blocks j k HK HM Hj Hk).
 unfold input_window;apply reference_values_prefix_byte;auto.
 - destruct HM as [_ HM];specialize(HM j Hj);exact (proj1 (proj2 HM)).
 - pose proof (padded_read_extent_covers_K K ltac:(lia));lia.
Qed.

Lemma input_window_length : forall K zero zero_data offset entries refs blocks j,
 input_mapping K zero zero_data offset entries refs blocks ->
 0<=j<Zlength refs ->
 Zlength (input_window blocks refs K j)=a_read_extent K.
Proof.
 intros;unfold input_window;apply reference_values_length.
 destruct H as [_ H];specialize(H j H0);exact (proj1 (proj2 H)).
Qed.

Lemma reference_address_bounds : forall blocks r count,
 allocation_bounds blocks -> reference_valid blocks r count ->
 0<reference_address blocks r /\
 reference_address blocks r+count<=18446744073709551615.
Proof.
 intros blocks r count HB [Hi [Ho [Hc He]]].
 unfold allocation_bounds in HB;rewrite Forall_forall in HB.
 assert (Hin:In (reference_block blocks r) blocks).
 { unfold reference_block,selected_block,Znth.
   apply nth_In;rewrite Zlength_correct in Hi;lia. }
 specialize(HB _ Hin);unfold reference_address;lia.
Qed.

Lemma mapped_window_bounds : forall K zero zero_data offset entries refs blocks j,
 allocation_bounds blocks ->
 input_mapping K zero zero_data offset entries refs blocks ->
 0<=j<Zlength refs ->
 0<input_address blocks refs j /\
 input_address blocks refs j+a_read_extent K<=18446744073709551615.
Proof.
 intros;apply reference_address_bounds;auto.
 destruct H0 as [_ H0];specialize(H0 j H1);exact (proj1 (proj2 H0)).
Qed.

Print Assumptions igemm_shape_facts.
Print Assumptions flat_inputs_window_byte.
Print Assumptions input_window_length.
Print Assumptions mapped_window_bounds.
