From Coq Require Import ZArith Lia List.
From Qu8Rdsum Require Import Model ProgramModel RvvModel RvvFacts StoreModel StoreFacts InitialRange RvvBounds OutputModel IntegerFacts.
Local Open Scope Z_scope.

Definition rd_rvv_final_lane (M:RDMap)
 (base rows channels stride k i vl:Z) (Init:list Z):Z :=
 rd_active_wadd32
   (rd_out_lane (rd_partial M base rows channels stride k Init) k i vl)
   (rd_acc32 M base stride k rows i vl) i vl.

Lemma rd_rvv_final_lane_active : forall M base rows channels stride k i vl Init,
 0<=k -> 0<=i<vl -> k+vl<=channels -> Zlength Init=channels ->
 rd_init_range Init ->
 rd_rvv_final_lane M base rows channels stride k i vl Init =
 rd_result_lane M base rows stride (k+i) Init.
Proof.
 intros M base rows channels stride k i vl Init Hk Hi Hb Hlen Hrange.
 unfold rd_rvv_final_lane, rd_active_wadd32, rd_out_lane, rd_acc32.
 destruct (Z.ltb_spec i vl); [|lia].
 rewrite rd_partial_unwritten_lane by lia.
 rewrite rs_add_u32_wrap.
 - rewrite rs_u32_add_r; reflexivity.
 - apply Hrange; lia.
 - apply rs_u32_bound.
Qed.

Lemma rd_rvv_final_lane_inactive : forall M base rows channels stride k i vl Init,
 vl<=i -> rd_rvv_final_lane M base rows channels stride k i vl Init=0.
Proof.
 intros; unfold rd_rvv_final_lane, rd_active_wadd32.
 destruct (Z.ltb_spec i vl); [lia|reflexivity].
Qed.

Definition rd_rvv_write_i (M:RDMap)
 (base rows channels stride k i vl:Z) (Init Out:list Z):list Z :=
 rd_store_lane Out k i
   (rd_rvv_final_lane M base rows channels stride k i vl Init) vl.

Lemma rd_rvv_write_step : forall M base rows channels stride k i vl Init,
 0<=k -> 0<=i -> 0<=vl -> k+vl<=channels ->
 Zlength Init=channels -> rd_init_range Init ->
 rd_rvv_write_i M base rows channels stride k i vl Init
   (rd_partial M base rows channels stride (k+Z.min i vl) Init) =
 rd_partial M base rows channels stride (k+Z.min (i+1) vl) Init.
Proof.
 intros M base rows channels stride k i vl Init Hk Hi Hvl Hb Hlen Hrange.
 unfold rd_rvv_write_i, rd_store_lane.
 destruct (Z.ltb_spec i vl).
 - rewrite !Z.min_l by lia.
   rewrite rd_rvv_final_lane_active by (try assumption; lia).
   replace (k+(i+1)) with (k+i+1) by lia.
   apply rd_partial_store_step; lia.
 - rewrite !Z.min_r by lia; reflexivity.
Qed.

(* This is a mathematical encoding of the actual32 successive stores, not a
   replacement C body.  Each value still uses the original loaded output. *)
Fixpoint rd_rvv_store_sequence (count:nat) (i:Z) (M:RDMap)
 (base rows channels stride k vl:Z) (Init Out:list Z):list Z :=
 match count with
 | O=>Out
 | S rest=>rd_rvv_store_sequence rest (i+1) M base rows channels stride k vl Init
     (rd_rvv_write_i M base rows channels stride k i vl Init Out)
 end.

Lemma rd_rvv_store_sequence_partial :
 forall count i M base rows channels stride k vl Init,
 0<=i -> 0<=k -> 0<=vl -> k+vl<=channels ->
 Zlength Init=channels -> rd_init_range Init ->
 rd_rvv_store_sequence count i M base rows channels stride k vl Init
   (rd_partial M base rows channels stride (k+Z.min i vl) Init) =
 rd_partial M base rows channels stride (k+Z.min (i+Z.of_nat count) vl) Init.
Proof.
 induction count as [|count IH]; intros i M base rows channels stride k vl Init Hi Hk Hvl Hb Hlen Hrange.
 - cbn [rd_rvv_store_sequence]; rewrite Z.add_0_r; reflexivity.
 - cbn [rd_rvv_store_sequence].
   rewrite rd_rvv_write_step by assumption.
   rewrite IH by (try assumption; lia).
   replace (i+1+Z.of_nat count) with (i+Z.of_nat(S count)) by lia.
   reflexivity.
Qed.

Lemma rd_rvv_store_finish : forall M base rows channels stride k vl Init,
 0<=k -> 0<=vl<=32 -> k+vl<=channels ->
 Zlength Init=channels -> rd_init_range Init ->
 rd_rvv_store_sequence 32 0 M base rows channels stride k vl Init
   (rd_partial M base rows channels stride k Init) =
 rd_partial M base rows channels stride (k+vl) Init.
Proof.
 intros M base rows channels stride k vl Init Hk Hvl Hb Hlen Hrange.
 pose proof (rd_rvv_store_sequence_partial 32 0 M base rows channels stride k vl Init
   ltac:(lia) Hk ltac:(lia) Hb Hlen Hrange) as H.
 assert (H0:Z.min 0 vl=0) by (apply Z.min_l; lia).
 assert (H32:Z.min (0+Z.of_nat 32) vl=vl) by (apply Z.min_r; lia).
 rewrite H0,H32,Z.add_0_r in H; exact H.
Qed.

Print Assumptions rd_rvv_final_lane_active.
Print Assumptions rd_rvv_final_lane_inactive.
Print Assumptions rd_rvv_write_step.
Print Assumptions rd_rvv_store_sequence_partial.
Print Assumptions rd_rvv_store_finish.

Lemma rd_rvv_final_lane_splat : forall M base rows channels stride k i vl Init,
 0<=k -> 0<=i -> k+vl<=channels -> Zlength Init=channels ->
 rd_init_range Init ->
 rd_rvv_final_lane M base rows channels stride k i vl Init =
 rd_splat (rd_result_lane M base rows stride (k+i) Init) i vl.
Proof.
 intros;unfold rd_splat;destruct (Z.ltb_spec i vl).
 - apply rd_rvv_final_lane_active;try assumption;lia.
 - apply rd_rvv_final_lane_inactive;lia.
Qed.
Print Assumptions rd_rvv_final_lane_splat.
