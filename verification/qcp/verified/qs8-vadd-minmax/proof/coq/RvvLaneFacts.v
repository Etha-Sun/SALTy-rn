From Coq Require Import ZArith Lia List.
From Qs8Add Require Export ProgramFacts RvvActiveModel ControlFacts.
Import ListNotations.
Local Open Scope Z_scope.

(* The actual RVV helper order, including active masking at every stage.
   qa_active_macc takes its vector source before the scalar multiplier. *)
Definition qa_rvv_pipeline
 (i vl idx az bz ma mb raw oz lo hi:Z) (A B:list Z):Z :=
 let a := qa_active_sub i vl (s8_read_lane i vl idx A) az in
 let b := qa_active_sub i vl (s8_read_lane i vl idx B) bz in
 let aw := qa_active_sext i vl a in
 let bw := qa_active_sext i vl b in
 let mul := qa_active_mul i vl aw ma in
 let acc := qa_active_macc i vl mul bw mb in
 let d := qa_ctrl raw in
 let shifted :=
   if orb (d <=? -32) (32 <=? d) then qa_active_mov i vl 0
   else if d <? 0 then qa_active_rnu i vl acc (-d)
   else qa_active_sll i vl acc d in
 let clipped := qa_active_clip16 i vl shifted in
 let added := qa_active_add i vl clipped oz in
 let narrowed := qa_active_clip8 i vl added in
 let lower := qa_active_max i vl narrowed lo in
 qa_active_min i vl lower hi.

Lemma qa_rvv_pipeline_lane :
 forall i vl idx az bz ma mb raw oz lo hi A B,
 qa_rvv_pipeline i vl idx az bz ma mb raw oz lo hi A B =
 if i <? vl then qa_at az bz ma mb raw oz lo hi A B (idx+i) else 0.
Proof.
 intros.
 unfold qa_rvv_pipeline, qa_active_sub, qa_active_sext, qa_active_mul,
   qa_active_macc, qa_active_mov, qa_active_rnu, qa_active_sll,
   qa_active_clip16, qa_active_add, qa_active_clip8, qa_active_max,
   qa_active_min, s8_read_lane.
 destruct (i <? vl) eqn:Hi; [|reflexivity].
 unfold qa_at; rewrite qa_lane_equiv.
 unfold qa_rvv_lane, qa_rvv_acc, qa_repaired_shift, qa_clamp, qa_min, qa_max.
 reflexivity.
Qed.

Lemma qa_rvv_pipeline_active :
 forall i vl idx az bz ma mb raw oz lo hi A B,
 i < vl ->
 qa_rvv_pipeline i vl idx az bz ma mb raw oz lo hi A B =
 qa_at az bz ma mb raw oz lo hi A B (idx+i).
Proof.
 intros; rewrite qa_rvv_pipeline_lane.
 destruct (Z.ltb_spec i vl); [reflexivity|lia].
Qed.

Lemma qa_rvv_pipeline_inactive :
 forall i vl idx az bz ma mb raw oz lo hi A B,
 vl <= i -> qa_rvv_pipeline i vl idx az bz ma mb raw oz lo hi A B = 0.
Proof.
 intros; rewrite qa_rvv_pipeline_lane.
 destruct (Z.ltb_spec i vl); [lia|reflexivity].
Qed.

Lemma qa_rvv_pipeline_prefix :
 forall vl idx az bz ma mb raw oz lo hi A B,
 0 <= idx -> 0 <= vl <= 32 ->
 idx+vl <= Zlength A -> idx+vl <= Zlength B ->
 s8_rvv_prefix vl
   (map (fun i:nat =>
      qa_rvv_pipeline (Z.of_nat i) vl idx az bz ma mb raw oz lo hi A B)
      (seq 0 32)) =
 qa_window idx vl az bz ma mb raw oz lo hi A B.
Proof.
 intros vl idx az bz ma mb raw oz lo hi A B Hidx Hvl HA HB.
 rewrite s8_rvv_prefix_map_seq by lia.
 apply List.nth_ext with (d:=0) (d':=0).
 - rewrite map_length, seq_length, qa_window_length by lia; reflexivity.
 - intros i Hi.
   rewrite map_length, seq_length in Hi.
   rewrite s8_rvv_map_seq_nth by exact Hi.
   replace (0+i)%nat with i by lia.
   rewrite qa_rvv_pipeline_active by lia.
   rewrite <- (Nat2Z.id i) at 2.
   change (qa_at az bz ma mb raw oz lo hi A B (idx+Z.of_nat i) =
     Znth (Z.of_nat i) (qa_window idx vl az bz ma mb raw oz lo hi A B) 0).
   rewrite qa_window_nth by lia; reflexivity.
Qed.

Lemma qa_rvv_pipeline_pack32 :
 forall vl idx az bz ma mb raw oz lo hi A B,
 0 <= idx -> 0 <= vl <= 32 ->
 idx+vl <= Zlength A -> idx+vl <= Zlength B ->
 let p := fun i => qa_rvv_pipeline i vl idx az bz ma mb raw oz lo hi A B in
 s8_rvv_prefix vl
   (s8_rvv_pack32
      (p 0) (p 1) (p 2) (p 3) (p 4) (p 5) (p 6) (p 7)
      (p 8) (p 9) (p 10) (p 11) (p 12) (p 13) (p 14) (p 15)
      (p 16) (p 17) (p 18) (p 19) (p 20) (p 21) (p 22) (p 23)
      (p 24) (p 25) (p 26) (p 27) (p 28) (p 29) (p 30) (p 31)) =
 qa_window idx vl az bz ma mb raw oz lo hi A B.
Proof.
 intros; cbn zeta.
 rewrite s8_rvv_pack32_seq; apply qa_rvv_pipeline_prefix; assumption.
Qed.

Print Assumptions qa_rvv_pipeline_lane.
Print Assumptions qa_rvv_pipeline_active.
Print Assumptions qa_rvv_pipeline_inactive.
Print Assumptions qa_rvv_pipeline_prefix.
Print Assumptions qa_rvv_pipeline_pack32.
