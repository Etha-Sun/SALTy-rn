Require Import isla.riscv64.riscv64.
Require Import RvvSharedDefs RvvLoadShared RvvWidenAdd RvvControl RvvStepMath.
From Simple.rvv Require Import a800001ca a800001ce a800001d0 a800001d2 a800001d6.

(* This file depends on the completed load proof; it is not a conditional
   assumption about the instruction. Check only after RvvLoadShared.vo exists. *)
Lemma rvv_iteration_body `{!islaG Σ} `{!threadG}
    (vl n p : bv 64) (mask src old acc : bv 65536) (f : N -> bv 8) :
  (bv_unsigned vl <= 8)%Z ->
  (0x80000000 <= bv_unsigned p <= 0x83fffff8)%Z ->
  instr 0x800001ca (Some a800001ca) -∗ instr 0x800001ce (Some a800001ce) -∗
  instr 0x800001d0 (Some a800001d0) -∗ instr 0x800001d2 (Some a800001d2) -∗
  instr 0x800001d6 (Some a800001d6) -∗
  instr_body 0x800001ca (
    RvvLoadShared.rvv_memory_env ∗ "vl" ↦ᵣ RVal_Bits vl ∗
    "x10" ↦ᵣ RVal_Bits n ∗ "x11" ↦ᵣ RVal_Bits p ∗ "x15" ↦ᵣ RVal_Bits vl ∗
    "vr0" ↦ᵣ RVal_Bits mask ∗ "vr2" ↦ᵣ RVal_Bits src ∗
    "vr16" ↦ᵣ RVal_Bits old ∗ "vr8" ↦ᵣ RVal_Bits acc ∗
    bv_unsigned p ↦ₘ∗ RvvLoadShared.input8 f ∗
    instr_pre 0x800001da (
      RvvLoadShared.rvv_memory_env ∗ "vl" ↦ᵣ RVal_Bits vl ∗
      "x10" ↦ᵣ RVal_Bits (bv_sub n vl) ∗ "x11" ↦ᵣ RVal_Bits (bv_add p vl) ∗
      "x15" ↦ᵣ RVal_Bits vl ∗ "vr0" ↦ᵣ RVal_Bits mask ∗
      "vr2" ↦ᵣ RVal_Bits (RvvLoadShared.loaded8 vl src f) ∗
      "vr16" ↦ᵣ RVal_Bits (widened8 vl old (RvvLoadShared.loaded8 vl src f)) ∗
      "vr8" ↦ᵣ RVal_Bits (step_words vl acc old src f) ∗
      bv_unsigned p ↦ₘ∗ RvvLoadShared.input8 f)).
Proof.
  intros Hvl Hrange. iIntros "#Hca #Hce #Hd0 #Hd2 #Hd6".
  iPoseProof (rvv_load_active_bytes_shared 0x800001ca vl p mask src f Hvl Hrange with "Hca") as "Hload".
  iPoseProof (rvv_advance n p vl with "Hce Hd0") as "Hadvance".
  iPoseProof (rvv_widen_add vl mask old (RvvLoadShared.loaded8 vl src f) acc Hvl with "Hd2 Hd6") as "Hvector".
  iApply (instr_pre_wand with "Hload"); [done|done|].
  iIntros "(Henv & Hvl & Hn & Hp & Hrd & Hmask & Hsrc & Hold & Hacc & Hmem & Hexit)".
  iFrame "Henv Hvl Hp Hmask Hsrc Hmem".
  iApply (instr_pre_wand with "Hadvance"); [done|done|].
  iIntros "(Henv & Hvl & Hp & Hmask & Hsrc & Hmem)". iFrame "Hn Hp Hrd".
  iApply (instr_pre_wand with "Hvector"); [done|done|].
  iIntros "(Hn & Hp & Hrd)". iDestruct "Henv" as "[Henv Hplatform]".
  iFrame "Henv Hvl Hmask Hsrc Hold Hacc".
  iApply (instr_pre_wand with "Hexit"); [done|done|].
  iIntros "(Henv & Hvl & Hmask & Hsrc & Hold & Hacc)".
  unfold RvvLoadShared.rvv_memory_env, step_words. iFrame.
Qed.
Print Assumptions rvv_iteration_body.
