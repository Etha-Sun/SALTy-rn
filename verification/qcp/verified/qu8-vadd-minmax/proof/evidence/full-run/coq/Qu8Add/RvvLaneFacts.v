From Coq Require Import ZArith Lia List.
From Qu8Add Require Export ProgramFacts RvvActiveModel ControlFacts.
Import ListNotations.
Local Open Scope Z_scope.

(* The actual RVV helper order, including active masking at every stage.
   qu_active_macc takes its vector source before the scalar multiplier. *)
Definition qu_rvv_pipeline
 (i vl idx az bz ma mb raw oz lo hi:Z) (A B:list Z):Z :=
 let a := qu_s16(qu_active_subu i vl (u8_read_lane i vl idx A) az) in
 let b := qu_s16(qu_active_subu i vl (u8_read_lane i vl idx B) bz) in
 let aw := qu_active_sext i vl a in
 let bw := qu_active_sext i vl b in
 let mul := qu_active_mul i vl aw ma in
 let acc := qu_active_macc i vl mul bw mb in
 let d := qu_ctrl raw in
 let shifted :=
   if orb (d <=? -32) (32 <=? d) then qu_active_mov i vl 0
   else if d <? 0 then qu_active_rnu i vl acc (-d)
   else qu_active_sll i vl acc d in
 let clipped := qu_active_clip16 i vl shifted in
 let added := qu_active_add i vl clipped oz in
 let positive := qu_active_max16 i vl added in
 let reinterpreted := qu_u16 positive in
 let narrowed := qu_active_clipu8 i vl reinterpreted in
 let lower := qu_active_max i vl narrowed lo in
 qu_active_min i vl lower hi.

Lemma qu_rvv_pipeline_lane :
 forall i vl idx az bz ma mb raw oz lo hi A B,
 qu_rvv_pipeline i vl idx az bz ma mb raw oz lo hi A B =
 if i <? vl then qu_at az bz ma mb raw oz lo hi A B (idx+i) else 0.
Proof.
 intros.
 unfold qu_rvv_pipeline, qu_active_subu, qu_active_sext, qu_active_mul,
   qu_active_macc, qu_active_mov, qu_active_rnu, qu_active_sll,
   qu_active_clip16, qu_active_add, qu_active_max16, qu_active_clipu8, qu_active_max,
   qu_active_min, u8_read_lane.
 destruct (i <? vl) eqn:Hi; [|reflexivity].
 unfold qu_at; rewrite qu_lane_equiv.
 unfold qu_rvv_lane, qu_rvv_acc, qu_repaired_shift, qu_clamp, qu_umin, qu_umax, qu_rvv_unsigned_finish,qu_uclip8,qu_max16zero,qu_signed_difference.
 reflexivity.
Qed.

Lemma qu_rvv_pipeline_active :
 forall i vl idx az bz ma mb raw oz lo hi A B,
 i < vl ->
 qu_rvv_pipeline i vl idx az bz ma mb raw oz lo hi A B =
 qu_at az bz ma mb raw oz lo hi A B (idx+i).
Proof.
 intros; rewrite qu_rvv_pipeline_lane.
 destruct (Z.ltb_spec i vl); [reflexivity|lia].
Qed.

Lemma qu_rvv_pipeline_inactive :
 forall i vl idx az bz ma mb raw oz lo hi A B,
 vl <= i -> qu_rvv_pipeline i vl idx az bz ma mb raw oz lo hi A B = 0.
Proof.
 intros; rewrite qu_rvv_pipeline_lane.
 destruct (Z.ltb_spec i vl); [lia|reflexivity].
Qed.

Lemma qu_rvv_pipeline_prefix :
 forall vl idx az bz ma mb raw oz lo hi A B,
 0 <= idx -> 0 <= vl <= 32 ->
 idx+vl <= Zlength A -> idx+vl <= Zlength B ->
 u8_rvv_prefix vl
   (map (fun i:nat =>
      qu_rvv_pipeline (Z.of_nat i) vl idx az bz ma mb raw oz lo hi A B)
      (seq 0 32)) =
 qu_window idx vl az bz ma mb raw oz lo hi A B.
Proof.
 intros vl idx az bz ma mb raw oz lo hi A B Hidx Hvl HA HB.
 rewrite u8_rvv_prefix_map_seq by lia.
 apply List.nth_ext with (d:=0) (d':=0).
 - rewrite map_length, seq_length, qu_window_length by lia; reflexivity.
 - intros i Hi.
   rewrite map_length, seq_length in Hi.
   rewrite u8_rvv_map_seq_nth by exact Hi.
   replace (0+i)%nat with i by lia.
   rewrite qu_rvv_pipeline_active by lia.
   rewrite <- (Nat2Z.id i) at 2.
   change (qu_at az bz ma mb raw oz lo hi A B (idx+Z.of_nat i) =
     Znth (Z.of_nat i) (qu_window idx vl az bz ma mb raw oz lo hi A B) 0).
   rewrite qu_window_nth by lia; reflexivity.
Qed.

Lemma qu_rvv_pipeline_pack32 :
 forall vl idx az bz ma mb raw oz lo hi A B,
 0 <= idx -> 0 <= vl <= 32 ->
 idx+vl <= Zlength A -> idx+vl <= Zlength B ->
 let p := fun i => qu_rvv_pipeline i vl idx az bz ma mb raw oz lo hi A B in
 u8_rvv_prefix vl
   (u8_rvv_pack32
      (p 0) (p 1) (p 2) (p 3) (p 4) (p 5) (p 6) (p 7)
      (p 8) (p 9) (p 10) (p 11) (p 12) (p 13) (p 14) (p 15)
      (p 16) (p 17) (p 18) (p 19) (p 20) (p 21) (p 22) (p 23)
      (p 24) (p 25) (p 26) (p 27) (p 28) (p 29) (p 30) (p 31)) =
 qu_window idx vl az bz ma mb raw oz lo hi A B.
Proof.
 intros; cbn zeta.
 rewrite u8_rvv_pack32_seq; apply qu_rvv_pipeline_prefix; assumption.
Qed.

Print Assumptions qu_rvv_pipeline_lane.
Print Assumptions qu_rvv_pipeline_active.
Print Assumptions qu_rvv_pipeline_inactive.
Print Assumptions qu_rvv_pipeline_prefix.
Print Assumptions qu_rvv_pipeline_pack32.
