Require Import isla.riscv64.riscv64.
Require Import RvvSharedDefs RvvLoadSharedDefs RvvPlatform RvvPrepare RvvProgress RvvSimpleVset
  RvvLoopControl RvvIterationConditional RvvStepMath.
From Simple.rvv Require Import a800001c6 a800001ca a800001ce a800001d0 a800001d2 a800001d6 a800001da.
Definition chosen_vl (n : bv 64) : bv 64 := Z_to_bv 64 (selected_vl8 (bv_unsigned n)).
Lemma chosen_vl_unsigned n : (0 < bv_unsigned n)%Z ->
  bv_unsigned (chosen_vl n) = selected_vl8 (bv_unsigned n).
Proof.
  intros Hn. pose proof (selected_vl8_progress (bv_unsigned n) Hn).
  unfold chosen_vl. bv_solve.
Qed.
Lemma chosen_vl_bound n : (0 < bv_unsigned n)%Z ->
  (0 < bv_unsigned (chosen_vl n) <= 8)%Z.
Proof.
  intros Hn. rewrite (chosen_vl_unsigned n Hn).
  pose proof (selected_vl8_progress (bv_unsigned n) Hn). lia.
Qed.
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
Lemma rvv_round_from_load_contract (n p oldvl oldrd oldtype : bv 64)
    (mask src old acc : bv 65536) (f : N -> bv 8) :
  (oldtype = BV 64 0x90 \/ oldtype = BV 64 0xd0) ->
  (0 < bv_unsigned n)%Z ->
  (0x80000000 <= bv_unsigned p <= 0x83fffff8)%Z ->
  instr 0x800001c6 (Some a800001c6) -∗ instr 0x800001ca (Some a800001ca) -∗
  instr 0x800001ce (Some a800001ce) -∗ instr 0x800001d0 (Some a800001d0) -∗
  instr 0x800001d2 (Some a800001d2) -∗ instr 0x800001d6 (Some a800001d6) -∗
  instr 0x800001da (Some a800001da) -∗
  instr_body 0x800001c6 (
    rvv_typed_env oldtype ∗ rvv_platform_env ∗ "vl" ↦ᵣ RVal_Bits oldvl ∗
    "x10" ↦ᵣ RVal_Bits n ∗ "x11" ↦ᵣ RVal_Bits p ∗ "x15" ↦ᵣ RVal_Bits oldrd ∗
    "vr0" ↦ᵣ RVal_Bits mask ∗ "vr2" ↦ᵣ RVal_Bits src ∗
    "vr16" ↦ᵣ RVal_Bits old ∗ "vr8" ↦ᵣ RVal_Bits acc ∗
    bv_unsigned p ↦ₘ∗ input8 f ∗
    instr_pre (if decide (bv_sub n (chosen_vl n) = BV 64 0) then 0x800001dc else 0x800001c6) (
      rvv_loop_env ∗ rvv_platform_env ∗ "vl" ↦ᵣ RVal_Bits (chosen_vl n) ∗
      "x10" ↦ᵣ RVal_Bits (bv_sub n (chosen_vl n)) ∗ "x11" ↦ᵣ RVal_Bits (bv_add p (chosen_vl n)) ∗
      "x15" ↦ᵣ RVal_Bits (chosen_vl n) ∗ "vr0" ↦ᵣ RVal_Bits mask ∗
      "vr2" ↦ᵣ RVal_Bits (loaded8 (chosen_vl n) src f) ∗
      "vr16" ↦ᵣ RVal_Bits (widened8 (chosen_vl n) old (loaded8 (chosen_vl n) src f)) ∗
      "vr8" ↦ᵣ RVal_Bits (step_words (chosen_vl n) acc old src f) ∗
      bv_unsigned p ↦ₘ∗ input8 f)).
Proof using Type Hload.
  intros Htype Hn Hrange. pose proof (chosen_vl_bound n Hn) as Hvl.
  iIntros "#Hc6 #Hca #Hce #Hd0 #Hd2 #Hd6 #Hda".
  iPoseProof (rvv_vset_loop_env n oldvl oldrd oldtype Htype with "Hc6") as "Hset".
  iPoseProof (rvv_iteration_from_load_contract Hload (chosen_vl n) n p mask src old acc f ltac:(lia) Hrange
    with "Hca Hce Hd0 Hd2 Hd6") as "Hbody".
  iPoseProof (rvv_backedge_env (bv_sub n (chosen_vl n)) with "Hda") as "Hbranch".
  iApply (instr_pre_wand with "Hset"); [done|done|].
  iIntros "(Henv & Hplatform & Hvl & Hn & Hp & Hrd & Hmask & Hsrc & Hold & Hacc & Hmem & Hexit)".
  iFrame "Henv Hvl Hn Hrd".
  iApply (instr_pre_wand with "Hbody"); [done|done|].
  iIntros "(Henv & Hvl & Hn & Hrd)".
  unfold rvv_memory_env. iFrame "Henv Hplatform Hvl Hn Hp Hrd Hmask Hsrc Hold Hacc Hmem".
  iApply (instr_pre_wand with "Hbranch"); [done|done|].
  iIntros "(Henv & Hvl & Hn & Hp & Hrd & Hmask & Hsrc & Hold & Hacc & Hmem)".
  iDestruct "Henv" as "[Henv Hplatform]". iFrame "Henv Hn".
  iApply (instr_pre_wand with "Hexit"); [done|done|].
  iIntros "[Henv Hn]". iFrame.
Qed.
End composition.
Print Assumptions rvv_round_from_load_contract.
