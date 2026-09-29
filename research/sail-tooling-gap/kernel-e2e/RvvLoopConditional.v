Require Import isla.riscv64.riscv64.
From Coq Require Import Arith.Wf_nat.
Require Import RvvSharedDefs RvvLoadSharedDefs RvvPlatform RvvPrepare RvvProgress RvvSimpleVset
  RvvRoundConditional RvvStepMath RvvLaneMath RvvReduce RvvMemory RvvWindow.
From Simple.rvv Require Import a800001c6 a800001ca a800001ce a800001d0 a800001d2 a800001d6 a800001da.
Definition rvv_loop_registers `{!islaG Σ} `{!threadG}
    (ty vl rd n p : bv 64) (mask src old acc : bv 65536) : iProp Σ :=
  rvv_typed_env ty ∗ rvv_platform_env ∗ "vl" ↦ᵣ RVal_Bits vl ∗
  "x10" ↦ᵣ RVal_Bits n ∗ "x11" ↦ᵣ RVal_Bits p ∗ "x15" ↦ᵣ RVal_Bits rd ∗
  "vr0" ↦ᵣ RVal_Bits mask ∗ "vr2" ↦ᵣ RVal_Bits src ∗
  "vr16" ↦ᵣ RVal_Bits old ∗ "vr8" ↦ᵣ RVal_Bits acc.
Definition rvv_loop_result `{!islaG Σ} `{!threadG}
    (p : bv 64) (mask : bv 65536) (total : bv 32) : iProp Σ :=
  ∃ (vl : bv 64) (src old acc : bv 65536),
    rvv_loop_registers (BV 64 0x90) vl vl (BV 64 0) p mask src old acc ∗
    ⌜rvv_sum8_seed (BV 65536 0) acc = total⌝.
Section composition.
Context `{!islaG Σ} `{!threadG}.
Hypothesis Hload : forall pc
    (vl p : bv 64) (mask old : bv 65536) (f : N -> bv 8),
  (bv_unsigned vl <= 8)%Z ->
  (0x80000000 <= bv_unsigned p <= 0x83fffff8)%Z ->
  instr pc (Some a800001ca) ⊢ instr_body pc (
    rvv_memory_env ∗ "vl" ↦ᵣ RVal_Bits vl ∗ "x11" ↦ᵣ RVal_Bits p ∗
    "vr0" ↦ᵣ RVal_Bits mask ∗ "vr2" ↦ᵣ RVal_Bits old ∗
    bv_unsigned p ↦ₘ∗ input8 f ∗
    instr_pre (pc+4) (
      rvv_memory_env ∗ "vl" ↦ᵣ RVal_Bits vl ∗ "x11" ↦ᵣ RVal_Bits p ∗
      "vr0" ↦ᵣ RVal_Bits mask ∗ "vr2" ↦ᵣ RVal_Bits (loaded8 vl old f) ∗
      bv_unsigned p ↦ₘ∗ input8 f)).
Lemma rvv_loop_from_load_contract (xs padding : list (bv 8))
    (p oldtype oldvl oldrd : bv 64) (mask src old acc : bv 65536) :
  xs <> [] -> length padding = 7%nat ->
  (oldtype = BV 64 0x90 \/ oldtype = BV 64 0xd0) ->
  (0x80000000 <= bv_unsigned p /\
    bv_unsigned p + Z.of_nat (length xs) + 7 <= 0x84000000)%Z ->
  instr 0x800001c6 (Some a800001c6) -∗ instr 0x800001ca (Some a800001ca) -∗
  instr 0x800001ce (Some a800001ce) -∗ instr 0x800001d0 (Some a800001d0) -∗
  instr 0x800001d2 (Some a800001d2) -∗ instr 0x800001d6 (Some a800001d6) -∗
  instr 0x800001da (Some a800001da) -∗
  instr_body 0x800001c6 (
    rvv_loop_registers oldtype oldvl oldrd (Z_to_bv 64 (Z.of_nat (length xs))) p mask src old acc ∗
    bv_unsigned p ↦ₘ∗ (xs ++ padding) ∗
    instr_pre 0x800001dc (
      rvv_loop_result (bv_add p (Z_to_bv 64 (Z.of_nat (length xs)))) mask
        (bv_add (rvv_sum8_seed (BV 65536 0) acc) (byte_sum_list xs)) ∗
      bv_unsigned p ↦ₘ∗ (xs ++ padding))).
Proof using Type Hload.
  revert padding p oldtype oldvl oldrd mask src old acc.
  induction xs as [xs IH] using (well_founded_induction (well_founded_ltof _ (@length (bv 8)))).
  intros padding p oldtype oldvl oldrd mask src old acc Hne Hpad Htype Hrange.
  assert (Hlenpos : (0 < length xs)%nat) by (destruct xs; cbn in *; congruence || lia).
  pose (n := Z_to_bv 64 (Z.of_nat (length xs))).
  assert (Hn : bv_unsigned n = Z.of_nat (length xs)) by (unfold n; bv_solve).
  assert (Hnpos : (0 < bv_unsigned n)%Z) by lia.
  pose (vl := chosen_vl n).
  pose (k := Z.to_nat (bv_unsigned vl)).
  assert (Hvl : bv_unsigned vl = Z.of_nat k).
  { unfold k. pose proof (bv_unsigned_in_range 64 vl). lia. }
  assert (Hk : (0 < k /\ k <= 8 /\ k <= length xs)%nat).
  { pose proof (chosen_vl_bound n Hnpos).
    pose proof (selected_vl8_progress (bv_unsigned n) Hnpos).
    unfold vl in Hvl. rewrite (chosen_vl_unsigned n Hnpos) in Hvl. lia. }
  pose (p' := bv_add p vl).
  assert (Hp' : bv_unsigned p' = (bv_unsigned p + Z.of_nat k)%Z) by (unfold p'; bv_solve).
  assert (Hloadrange : (0x80000000 <= bv_unsigned p <= 0x83fffff8)%Z) by lia.
  assert (Hrestlen : (length (drop k xs) < length xs)%nat) by (rewrite length_drop; lia).
  assert (Hrange' : (0x80000000 <= bv_unsigned p' /\
    bv_unsigned p' + Z.of_nat (length (drop k xs)) + 7 <= 0x84000000)%Z).
  { rewrite Hp' length_drop. lia. }
  assert (Hremain : bv_sub n vl = Z_to_bv 64 (Z.of_nat (length (drop k xs)))).
  { rewrite length_drop. bv_solve. }
  assert (Hptr : bv_add p' (Z_to_bv 64 (Z.of_nat (length (drop k xs)))) =
    bv_add p (Z_to_bv 64 (Z.of_nat (length xs)))).
  { unfold p'. rewrite length_drop. bv_solve. }
  assert (Hwindowlen : (8 <= length (xs ++ padding))%nat) by (rewrite length_app Hpad; lia).
  assert (Hfullk : (k <= length (xs ++ padding))%nat) by (rewrite length_app; lia).
  pose (f := window_bytes (xs ++ padding)).
  pose (src' := loaded8 vl src f).
  pose (old' := widened8 vl old src').
  pose (acc' := step_words vl acc old src f).
  assert (Hsum : rvv_sum8_seed (BV 65536 0) acc' =
    bv_add (rvv_sum8_seed (BV 65536 0) acc) (byte_sum_list (take k xs))).
  { unfold acc'. rewrite (step_words_sum k vl acc old src f ltac:(lia) Hvl).
    unfold f. rewrite (window_prefix xs padding k ltac:(lia) ltac:(lia) Hwindowlen). reflexivity. }
  iIntros "#Hc6 #Hca #Hce #Hd0 #Hd2 #Hd6 #Hda".
  iPoseProof (rvv_round_from_load_contract Hload n p oldvl oldrd oldtype mask src old acc f Htype Hnpos Hloadrange
    with "Hc6 Hca Hce Hd0 Hd2 Hd6 Hda") as "Hround".
  iApply (instr_pre_wand with "Hround"); [done|done|].
  iIntros "(Hs & Hmem & Hexit)".
  iDestruct "Hs" as "(Henv & Hplatform & Hvl & Hn & Hp & Hrd & Hmask & Hsrc & Hold & Hacc)".
  iEval (rewrite (byte_array_take_drop _ _ 8 Hwindowlen)) in "Hmem".
  iDestruct "Hmem" as "[Hwindow Hrest]".
  iEval (rewrite <- (input8_window _ Hwindowlen)) in "Hwindow".
  iFrame "Henv Hplatform Hvl Hn Hp Hrd Hmask Hsrc Hold Hacc Hwindow".
  destruct (drop k xs) as [|x rest] eqn:Hrestxs.
  - assert (Hzero : bv_sub n (chosen_vl n) = BV 64 0) by (rewrite Hremain; apply bv_eq; reflexivity).
    rewrite decide_True; [|exact Hzero].
    iApply (instr_pre_wand with "Hexit"); [done|done|].
    iIntros "(Henv & Hplatform & Hvl & Hn & Hp & Hrd & Hmask & Hsrc & Hold & Hacc & Hwindow)".
    iSplitL "Henv Hplatform Hvl Hn Hp Hrd Hmask Hsrc Hold Hacc".
    + iExists vl, src', old', acc'. iSplitL.
      * unfold rvv_loop_registers. rewrite <- Hzero.
        assert (Hend : p' = bv_add p (Z_to_bv 64 (Z.of_nat (length xs)))) by (rewrite <- Hptr; bv_solve).
        rewrite <- Hend. iFrame.
      * iPureIntro. rewrite Hsum (byte_sum_list_split k xs) Hrestxs.
        cbn [byte_sum_list fold_right]. rewrite (bv_add_0_r _ (BV 32 0) eq_refl). reflexivity.
    + iEval (rewrite (input8_window _ Hwindowlen)) in "Hwindow".
      rewrite (byte_array_take_drop _ _ 8 Hwindowlen). iFrame.
  - assert (Hnz : bv_sub n (chosen_vl n) <> BV 64 0).
    { rewrite Hremain. intros Heq. apply (f_equal bv_unsigned) in Heq.
      assert (Hbound : (0 < Z.of_nat (length (x::rest)) < 2^64)%Z).
      { cbn [length] in *. pose proof (bv_unsigned_in_range 64 p'). lia. }
      bv_simplify Heq. rewrite (bv_wrap_small 64 (Z.of_nat (length (x::rest))) ltac:(change (0 <= Z.of_nat (length (x::rest)) < 2^64)%Z; lia)) in Heq.
      lia. }
    rewrite decide_False; [|exact Hnz].
    iPoseProof (IH (x::rest) ltac:(unfold ltof; exact Hrestlen)
      padding p' (BV 64 0x90) vl vl mask src' old' acc' ltac:(discriminate) Hpad (or_introl eq_refl)
      Hrange' with "Hc6 Hca Hce Hd0 Hd2 Hd6 Hda") as "Hloop".
    iApply (instr_pre_wand with "Hloop"); [done|done|].
    iIntros "(Henv & Hplatform & Hvl & Hn & Hp & Hrd & Hmask & Hsrc & Hold & Hacc & Hwindow)".
    iAssert (bv_unsigned p ↦ₘ∗ (xs ++ padding))%I with "[Hwindow Hrest]" as "Hmem".
    { iEval (rewrite (input8_window _ Hwindowlen)) in "Hwindow".
      rewrite (byte_array_take_drop _ _ 8 Hwindowlen). iFrame. }
    iEval (rewrite (byte_array_take_drop (bv_unsigned p) (xs ++ padding) k Hfullk)) in "Hmem".
    iDestruct "Hmem" as "[Hconsumed Hremaining]".
    iSplitL "Henv Hplatform Hvl Hn Hp Hrd Hmask Hsrc Hold Hacc".
    { unfold rvv_loop_registers. rewrite <- Hremain. iFrame. }
    iSplitL "Hremaining".
    { rewrite Hp'. iEval (rewrite drop_app_le; [|lia]) in "Hremaining".
      iEval (rewrite Hrestxs) in "Hremaining". iExact "Hremaining". }
    iApply (instr_pre_wand with "Hexit"); [done|done|].
    iIntros "[Hs Hremaining]".
    iSplitL "Hs".
    + rewrite <- Hptr. unfold rvv_loop_result.
      iDestruct "Hs" as (lastvl lastsrc lastold lastacc) "[Hs %Htotal]".
      iExists lastvl, lastsrc, lastold, lastacc. iFrame. iPureIntro.
      rewrite Htotal Hsum (byte_sum_list_split k xs) Hrestxs. rewrite bv_add_assoc. reflexivity.
    + rewrite (byte_array_take_drop (bv_unsigned p) (xs ++ padding) k Hfullk). iFrame "Hconsumed".
      rewrite Hp'. iEval (rewrite <- Hrestxs) in "Hremaining".
      rewrite drop_app_le; [|lia]. iExact "Hremaining".
Qed.
End composition.
Print Assumptions rvv_loop_from_load_contract.
