From Coq Require Import ZArith Lia List.
From Qs8Mul Require Export ProgramModel.
Import ListNotations.
Local Open Scope Z_scope.

(* Index facts are pure. rd_get is total in this model; these lemmas never
   grant a C memory-read permission outside the caller's rd_window. *)
Lemma qm_map_seq_nth : forall (f:nat->Z) start len i d,
 (i<len)%nat -> nth i (map f (seq start len)) d=f (start+i)%nat.
Proof.
 intros f start len i d Hi.
 rewrite (@List.nth_indep Z _ i d (f 0%nat)) by (rewrite map_length,seq_length;exact Hi).
 rewrite map_nth,seq_nth by exact Hi. reflexivity.
Qed.
Lemma qm_zmap_seq_shift : forall (f:Z->Z) start len,
 map (fun i=>f(Z.of_nat i)) (seq start len)=
 map (fun i=>f(Z.of_nat start+Z.of_nat i)) (seq 0 len).
Proof.
 intros f start len;apply (@List.nth_ext Z _ _ 0 0).
 - now rewrite !map_length,!seq_length.
 - intros i Hi;rewrite map_length,seq_length in Hi.
   rewrite !qm_map_seq_nth by exact Hi.
   rewrite Nat.add_0_l,Nat2Z.inj_add;reflexivity.
Qed.
Lemma qm_values_nth : forall n M pa pb az bz scale oz lo hi i d,
 0<=i<n ->
 nth (Z.to_nat i) (qm_values n M pa pb az bz scale oz lo hi) d=
 qm_lane M pa pb az bz scale oz lo hi i.
Proof.
 intros n M pa pb az bz scale oz lo hi i d Hi;unfold qm_values.
 rewrite qm_map_seq_nth by (apply Z2Nat.inj_lt;lia).
 rewrite Nat.add_0_l,Z2Nat.id by lia;reflexivity.
Qed.
Lemma qm_rvv_values_nth : forall n M pa pb az bz scale oz lo hi i d,
 0<=i<n ->
 nth (Z.to_nat i) (qm_rvv_values n M pa pb az bz scale oz lo hi) d=
 qm_rvv_at M pa pb az bz scale oz lo hi i.
Proof.
 intros n M pa pb az bz scale oz lo hi i d Hi;unfold qm_rvv_values.
 rewrite qm_map_seq_nth by (apply Z2Nat.inj_lt;lia).
 rewrite Nat.add_0_l,Z2Nat.id by lia;reflexivity.
Qed.
Lemma qm_lane_shift : forall M pa pb az bz scale oz lo hi k i,
 qm_lane M (pa+k) (pb+k) az bz scale oz lo hi i=
 qm_lane M pa pb az bz scale oz lo hi (k+i).
Proof.
 intros;unfold qm_lane;replace (pa+k+i) with (pa+(k+i)) by lia;
 replace (pb+k+i) with (pb+(k+i)) by lia;reflexivity.
Qed.
Lemma qm_rvv_at_shift : forall M pa pb az bz scale oz lo hi k i,
 qm_rvv_at M (pa+k) (pb+k) az bz scale oz lo hi i=
 qm_rvv_at M pa pb az bz scale oz lo hi (k+i).
Proof.
 intros;unfold qm_rvv_at;replace (pa+k+i) with (pa+(k+i)) by lia;
 replace (pb+k+i) with (pb+(k+i)) by lia;reflexivity.
Qed.
Lemma qm_values_append : forall k r M pa pb az bz scale oz lo hi,
 0<=k -> 0<=r ->
 qm_values (k+r) M pa pb az bz scale oz lo hi=
 qm_values k M pa pb az bz scale oz lo hi ++
 qm_values r M (pa+k) (pb+k) az bz scale oz lo hi.
Proof.
 intros k r M pa pb az bz scale oz lo hi Hk Hr;unfold qm_values.
 rewrite Z2Nat.inj_add by lia;rewrite seq_app,map_app;f_equal.
 rewrite Nat.add_0_l,qm_zmap_seq_shift,Z2Nat.id by lia.
 apply map_ext;intro i;symmetry;apply qm_lane_shift.
Qed.
Lemma qm_rvv_values_append : forall k r M pa pb az bz scale oz lo hi,
 0<=k -> 0<=r ->
 qm_rvv_values (k+r) M pa pb az bz scale oz lo hi=
 qm_rvv_values k M pa pb az bz scale oz lo hi ++
 qm_rvv_values r M (pa+k) (pb+k) az bz scale oz lo hi.
Proof.
 intros k r M pa pb az bz scale oz lo hi Hk Hr;unfold qm_rvv_values.
 rewrite Z2Nat.inj_add by lia;rewrite seq_app,map_app;f_equal.
 rewrite Nat.add_0_l,qm_zmap_seq_shift,Z2Nat.id by lia.
 apply map_ext;intro i;symmetry;apply qm_rvv_at_shift.
Qed.
Lemma qm_input_window_shift : forall M p n k r,
 rd_window M p n -> 0<=k -> 0<=r -> k+r<=n ->
 rd_window M (p+k) r.
Proof.
 unfold rd_window;intros M p n k r H Hk Hr Hn i Hi.
 replace(p+k+i)with(p+(k+i))by lia;apply H;lia.
Qed.
Print Assumptions qm_map_seq_nth.
Print Assumptions qm_zmap_seq_shift.
Print Assumptions qm_values_nth.
Print Assumptions qm_rvv_values_nth.
Print Assumptions qm_lane_shift.
Print Assumptions qm_rvv_at_shift.
Print Assumptions qm_values_append.
Print Assumptions qm_rvv_values_append.
Print Assumptions qm_input_window_shift.
