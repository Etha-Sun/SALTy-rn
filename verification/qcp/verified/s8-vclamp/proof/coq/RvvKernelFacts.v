From Coq Require Import ZArith Lia List.
From S8Clamp Require Export RvvKernelModel NeonFacts.
Import ListNotations.
Local Open Scope Z_scope.

Lemma s8_values_nth_bulk : forall n lo hi A i,
 0<=n<=Zlength A -> 0<=i<s8_bulk_count n ->
 Znth i(s8_values n lo hi A)0=s8_bulk_lane(Znth i A 0)lo hi.
Proof.
 intros. rewrite <-s8_tail_prefix_full.
 apply s8_tail_prefix_nth_bulk;unfold s8_bulk_count in *;
 pose proof(Z.mod_pos_bound n 64 ltac:(lia));lia.
Qed.
Lemma s8_values_nth_tail : forall n lo hi A i,
 0<=n<=Zlength A -> s8_bulk_count n<=i<n ->
 Znth i(s8_values n lo hi A)0=s8_tail_lane(Znth i A 0)lo hi.
Proof.
 intros. rewrite <-s8_tail_prefix_full.
 apply s8_tail_prefix_nth_tail;unfold s8_bulk_count in *;
 pose proof(Z.mod_pos_bound n 64 ltac:(lia));lia.
Qed.
Lemma s8_window_seq : forall k r A,
 0<=k -> 0<=r -> k+r<=Zlength A ->
 s8_window k r A=map(fun i=>Znth(k+Z.of_nat i)A 0)(seq 0(Z.to_nat r)).
Proof.
 intros k r A Hk Hr Hb. apply List.nth_ext with(d:=0)(d':=0).
 - rewrite s8_window_length,map_length,seq_length by assumption;reflexivity.
 - intros i Hi. rewrite s8_window_length in Hi by assumption.
   rewrite <-(Nat2Z.id i) at 1.
   change(Znth(Z.of_nat i)(s8_window k r A)0=
    nth i(map(fun j=>Znth(k+Z.of_nat j)A 0)(seq 0(Z.to_nat r)))0).
   rewrite s8_window_nth by lia. rewrite s8_rvv_map_seq_nth by assumption.
   reflexivity.
Qed.
Lemma s8_rvv_progress_length : forall k n lo hi A,
 0<=k<=n -> 0<=n<=Zlength A -> Zlength(s8_rvv_progress k n lo hi A)=k.
Proof. intros;unfold s8_rvv_progress;apply s8_rvv_prefix_length;rewrite s8_values_length by assumption;lia. Qed.
Lemma s8_rvv_progress_full : forall n lo hi A,
 0<=n<=Zlength A -> s8_rvv_progress n n lo hi A=s8_values n lo hi A.
Proof.
 intros. unfold s8_rvv_progress,s8_rvv_prefix. apply firstn_all2.
 pose proof(s8_values_length n lo hi A H). rewrite Zlength_correct in H0;lia.
Qed.
Lemma s8_rvv_progress_append : forall k r n lo hi A,
 0<=k -> 0<=r -> k+r<=n -> 0<=n<=Zlength A ->
 s8_rvv_progress(k+r)n lo hi A=s8_rvv_progress k n lo hi A++
 map(fun i=>Znth(k+Z.of_nat i)(s8_values n lo hi A)0)(seq 0(Z.to_nat r)).
Proof.
 intros. unfold s8_rvv_progress,s8_rvv_prefix.
 rewrite Z2Nat.inj_add by lia. rewrite s8_firstn_add.
 f_equal. change(s8_window k r(s8_values n lo hi A)=
  map(fun i=>Znth(k+Z.of_nat i)(s8_values n lo hi A)0)(seq 0(Z.to_nat r))).
 apply s8_window_seq;try lia. rewrite s8_values_length by assumption;lia.
Qed.
Lemma s8_rvv_bulk_seq : forall k r n lo hi A,
 0<=k -> 0<=r<=128 -> k+r<=s8_bulk_count n -> 0<=n<=Zlength A ->
 s8_rvv_prefix r(map(fun i=>s8_rvv_min_lane
  (s8_rvv_max_lane(s8_read_lane(Z.of_nat i)r k A)lo(Z.of_nat i)r)
  hi(Z.of_nat i)r)(seq 0 128))=
 map(fun i=>Znth(k+Z.of_nat i)(s8_values n lo hi A)0)(seq 0(Z.to_nat r)).
Proof.
 intros k r n lo hi A Hk Hr Hb Hn. rewrite s8_rvv_prefix_map_seq by assumption.
 apply map_ext_in. intros i Hi. apply in_seq in Hi.
 rewrite s8_rvv_min_lane_active,s8_rvv_max_lane_active,s8_rvv_read_lane_active by lia.
 rewrite s8_values_nth_bulk by lia. reflexivity.
Qed.
Lemma s8_rvv_tail_seq : forall k r n lo hi A,
 s8_bulk_count n<=k -> 0<=r<=128 -> k+r<=n -> 0<=n<=Zlength A ->
 s8_rvv_prefix r(map(fun i=>s8_rvv_max_lane
  (s8_rvv_min_lane(s8_read_lane(Z.of_nat i)r k A)hi(Z.of_nat i)r)
  lo(Z.of_nat i)r)(seq 0 128))=
 map(fun i=>Znth(k+Z.of_nat i)(s8_values n lo hi A)0)(seq 0(Z.to_nat r)).
Proof.
 intros k r n lo hi A Hk Hr Hb Hn. rewrite s8_rvv_prefix_map_seq by assumption.
 apply map_ext_in. intros i Hi. apply in_seq in Hi.
 rewrite s8_rvv_max_lane_active,s8_rvv_min_lane_active,s8_rvv_read_lane_active by lia.
 rewrite s8_values_nth_tail by lia. reflexivity.
Qed.

Print Assumptions s8_values_nth_bulk.
Print Assumptions s8_values_nth_tail.
Print Assumptions s8_window_seq.
Print Assumptions s8_rvv_progress_length.
Print Assumptions s8_rvv_progress_full.
Print Assumptions s8_rvv_progress_append.
Print Assumptions s8_rvv_bulk_seq.
Print Assumptions s8_rvv_tail_seq.

Lemma s8_bulk_mask_unbounded : forall n,
 Z.land n(Z.lnot 63)=s8_bulk_count n.
Proof.
 intros. rewrite <-Z.sub_land_same_l.
 replace 63 with(Z.ones 6)by reflexivity.
 rewrite Z.land_ones by lia. reflexivity.
Qed.
Lemma s8_bulk_mask_uint64 : forall n,
 0<=n<18446744073709551616 ->
 Z.land n 18446744073709551552=s8_bulk_count n.
Proof.
 intros n Hn.
 replace 18446744073709551552 with(Z.land(Z.ones 64)(Z.lnot 63))by reflexivity.
 rewrite Z.land_assoc,Z.land_ones by lia.
 replace(2^64)with 18446744073709551616 by reflexivity.
 rewrite Z.mod_small by assumption. apply s8_bulk_mask_unbounded.
Qed.
Print Assumptions s8_bulk_mask_unbounded.
Print Assumptions s8_bulk_mask_uint64.
