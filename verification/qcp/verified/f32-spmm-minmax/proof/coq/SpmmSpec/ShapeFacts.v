From Coq Require Import ZArith List Lia.
From SpmmSpec Require Export Model.
Import ListNotations.
Local Open Scope Z_scope.

Lemma delta_sum_nonnegative : forall xs,
 Forall (fun n=>0<=n) xs -> 0<=delta_sum xs.
Proof. intros xs H;induction H;cbn;lia. Qed.
Lemma prefix_sum_nat_range : forall count xs,
 Forall (fun n => 0<=n) xs ->
 0<=prefix_sum_nat count xs<=delta_sum xs.
Proof.
 induction count;intros xs H.
 - cbn [prefix_sum_nat];pose proof(delta_sum_nonnegative xs H);lia.
 - destruct xs as[|x xs];cbn [prefix_sum_nat delta_sum];[lia|].
   inversion H as[|x' xs' Hx Hxs];subst;specialize(IHcount xs Hxs);lia.
Qed.
Lemma nnz_prefix_range : forall nnz column,
 Forall (fun n=>0<=n<=4294967295) nnz ->
 0<=nnz_before nnz column<=delta_sum nnz.
Proof.
 intros;unfold nnz_before,prefix_sum;apply prefix_sum_nat_range.
 rewrite Forall_forall in *;intros x Hin;specialize(H x Hin);lia.
Qed.
Lemma z_at_nnz_range : forall nnz column,
 Forall (fun n=>0<=n<=4294967295) nnz ->
 0<=column<Zlength nnz -> 0<=z_at nnz column<=4294967295.
Proof.
 intros nnz column H Hc;unfold z_at.
 rewrite Forall_forall in H;apply H;apply nth_In.
 rewrite Zlength_correct in Hc;lia.
Qed.
Lemma nnz_prefix_next_bound : forall nnz column,
 Forall (fun n=>0<=n<=4294967295) nnz ->
 0<=column<Zlength nnz ->
 nnz_before nnz column+z_at nnz column<=delta_sum nnz.
Proof.
 intros;unfold nnz_before;rewrite <-prefix_sum_step by assumption.
 apply (proj2 (nnz_prefix_range nnz (column+1) H)).
Qed.
Lemma bias_index_range : forall nnz column,
 Forall (fun n=>0<=n<=4294967295) nnz ->
 0<=column<Zlength nnz ->
 0<=bias_index nnz column<Zlength nnz+delta_sum nnz.
Proof. intros;pose proof(nnz_prefix_range nnz column H);unfold bias_index;lia. Qed.
Lemma sparse_cursor_range : forall nnz column depth,
 Forall (fun n=>0<=n<=4294967295) nnz ->
 0<=column<Zlength nnz -> 0<=depth<z_at nnz column ->
 0<=nnz_before nnz column+depth<delta_sum nnz.
Proof.
 intros;pose proof(nnz_prefix_range nnz column H).
 pose proof(nnz_prefix_next_bound nnz column H H0);lia.
Qed.
Lemma weight_index_range : forall nnz column depth,
 Forall (fun n=>0<=n<=4294967295) nnz ->
 0<=column<Zlength nnz -> 0<=depth<z_at nnz column ->
 0<=bias_index nnz column+1+depth<Zlength nnz+delta_sum nnz.
Proof.
 intros;pose proof(nnz_prefix_range nnz column H).
 pose proof(nnz_prefix_next_bound nnz column H H0);unfold bias_index;lia.
Qed.
Lemma input_active_range : forall rows columns start nnz deltas input weights row width cursor,
 spmm_shape rows columns start nnz deltas input weights ->
 0<=row -> 0<width -> row+width<=rows -> 0<=cursor<=Zlength deltas ->
 0<=input_index deltas start row cursor /\
 input_index deltas start row cursor+width<=Zlength input.
Proof.
 intros rows columns start nnz deltas input weights row width cursor H Hr Hw Hrw Hc.
 unfold spmm_shape in H;repeat match type of H with _ /\ _=>destruct H as [? H]end.
 specialize(H cursor Hc);unfold input_index;lia.
Qed.
Print Assumptions nnz_prefix_range.
Print Assumptions z_at_nnz_range.
Print Assumptions nnz_prefix_next_bound.
Print Assumptions bias_index_range.
Print Assumptions sparse_cursor_range.
Print Assumptions weight_index_range.
Print Assumptions input_active_range.
