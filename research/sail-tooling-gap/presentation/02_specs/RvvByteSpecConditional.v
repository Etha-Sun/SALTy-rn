Require Import isla.riscv64.riscv64.
Require Import RvvPrepare RvvReduce RvvReduceShared RvvPlatform RvvLoadSharedDefs
  RvvComposition RvvInitialize RvvEntry RvvLoopConditional RvvFinishShared RvvLaneMath.
From Simple.rvv Require Import a800001bc a800001c0 a800001c4 a800001c6 a800001ca a800001ce a800001d0 a800001d2 a800001d6 a800001da a800001dc a800001e0 a800001e4 a800001e8 a800001ea a800001ee a800001f2 a800001f4 a800001f6.
Require Import RvvKernelConditional RvvProgramConditional RvvSharedSpec KernelSpec Programs.
Local Existing Instance isla.riscv64.arch.riscv64_arch.
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
Lemma rvv_program_byte_spec_from_load_contract (xs padding : list (bv 8))
  (p out ret oldvl rd14 rd15 tmp13 : bv 64)
  (mask seed src old acc : bv 65536) (initial : bv 32) :
  length padding = 7%nat ->
  (0x80000000 <= bv_unsigned p /\ bv_unsigned p + Z.of_nat (length xs) + 7 <= 0x84000000)%Z ->
  (0x80000000 <= bv_unsigned out <= 0x83fffffc)%Z ->
  bv_and out (BV 64 3) = BV 64 0 ->
  bv_and ret (BV 64 0xfffffffffffffffe) = ret ->
  instr_table rvv_program ⊢
  instr_body 0x800001bc (
    rvv_final_env ∗ rvv_platform_env ∗ "vl" ↦ᵣ RVal_Bits oldvl ∗
    "x10" ↦ᵣ RVal_Bits (Z_to_bv 64 (Z.of_nat (length xs))) ∗ "x11" ↦ᵣ RVal_Bits p ∗
    "x12" ↦ᵣ RVal_Bits out ∗ "x1" ↦ᵣ RVal_Bits ret ∗
    "x13" ↦ᵣ RVal_Bits tmp13 ∗ "x14" ↦ᵣ RVal_Bits rd14 ∗ "x15" ↦ᵣ RVal_Bits rd15 ∗
    "vr0" ↦ᵣ RVal_Bits mask ∗ "vr1" ↦ᵣ RVal_Bits seed ∗
    "vr2" ↦ᵣ RVal_Bits src ∗ "vr16" ↦ᵣ RVal_Bits old ∗ "vr8" ↦ᵣ RVal_Bits acc ∗
    bv_unsigned p ↦ₘ∗ (xs ++ padding) ∗ bv_unsigned out ↦ₘ initial ∗
    instr_pre (bv_unsigned ret) (
      bv_unsigned out ↦ₘ byte_reduction_spec initial xs ∗
      bv_unsigned p ↦ₘ∗ (xs ++ padding))).
Proof using Type Hload.
  intros Hpad Hrange Hout Halign Hret. iIntros "#Htable".
  iPoseProof (rvv_program_from_load_contract Hload xs padding p out ret oldvl rd14 rd15 tmp13 mask seed src old acc initial Hpad Hrange Hout Halign Hret with "Htable") as "Hkernel".
  iApply (instr_pre_wand with "Hkernel"); [done|done|].
  iIntros "(Henv & Hplatform & Hvl & Hn & Hp & Hout & Hret & H13 & H14 & H15 & Hmask & Hseed & Hsrc & Hold & Hacc & Hinput & Houtput & Hexit)".
  iFrame "Henv Hplatform Hvl Hn Hp Hout Hret H13 H14 H15 Hmask Hseed Hsrc Hold Hacc Hinput Houtput".
  iApply (instr_pre_wand with "Hexit"); [done|done|].
  iIntros "[Hresult Hinput]". iFrame "Hinput".
  unfold rvv_kernel_result.
  iDestruct "Hresult" as (src' old' acc')
    "(Henv & Hplatform & Hvl & Hn & Hp & Hout & Hret & H13 & H14 & H15 & Hmask & Hseed & Hsrc & Hold & Hacc & Hsum & Houtput)".
  rewrite rvv_result_is_shared_spec. iExact "Houtput".
Qed.
End composition.
Print Assumptions rvv_program_byte_spec_from_load_contract.
