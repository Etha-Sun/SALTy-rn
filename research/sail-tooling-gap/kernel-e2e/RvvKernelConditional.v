Require Import isla.riscv64.riscv64.
Require Import RvvPrepare RvvReduce RvvReduceShared RvvPlatform RvvLoadSharedDefs
  RvvComposition RvvInitialize RvvEntry RvvLoopConditional RvvFinishShared RvvLaneMath.
From Simple.rvv Require Import a800001bc a800001c0 a800001c4 a800001c6 a800001ca a800001ce a800001d0 a800001d2 a800001d6 a800001da a800001dc a800001e0 a800001e4 a800001e8 a800001ea a800001ee a800001f2 a800001f4 a800001f6.
Lemma rvv_zero_sum : RvvReduce.rvv_sum8_seed (BV 65536 0) (BV 65536 0) = BV 32 0.
Proof. apply bv_eq. vm_compute. reflexivity. Qed.
Lemma rvv_shared_sum_same seed acc :
  RvvReduceShared.rvv_sum8_seed seed acc = RvvReduce.rvv_sum8_seed seed acc.
Proof. reflexivity. Qed.
Definition rvv_kernel_result `{!islaG Σ} `{!threadG} (p out ret : bv 64)
  (mask : bv 65536) (total initial : bv 32) : iProp Σ :=
  ∃ (src old acc : bv 65536),
    rvv_final_env ∗ rvv_platform_env ∗ "vl" ↦ᵣ RVal_Bits (BV 64 8) ∗
    "x10" ↦ᵣ RVal_Bits (BV 64 0) ∗ "x11" ↦ᵣ RVal_Bits p ∗
    "x12" ↦ᵣ RVal_Bits out ∗ "x1" ↦ᵣ RVal_Bits ret ∗
    "x13" ↦ᵣ RVal_Bits (bv_sign_extend 64 initial) ∗
    "x14" ↦ᵣ RVal_Bits (BV 64 8) ∗
    "x15" ↦ᵣ RVal_Bits (bv_sign_extend 64 (bv_add total initial)) ∗
    "vr0" ↦ᵣ RVal_Bits mask ∗ "vr1" ↦ᵣ RVal_Bits (BV 65536 0) ∗
    "vr2" ↦ᵣ RVal_Bits src ∗ "vr16" ↦ᵣ RVal_Bits old ∗
    "vr8" ↦ᵣ RVal_Bits (RvvReduceShared.rvv_reduced8 (BV 65536 0) acc) ∗
    ⌜RvvReduce.rvv_sum8_seed (BV 65536 0) acc = total⌝ ∗
    bv_unsigned out ↦ₘ bv_add total initial.
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
Lemma rvv_kernel_from_load_contract (xs padding : list (bv 8))
  (p out ret oldvl rd14 rd15 tmp13 : bv 64)
  (mask seed src old acc : bv 65536) (initial : bv 32) :
  length padding = 7%nat ->
  (0x80000000 <= bv_unsigned p /\ bv_unsigned p + Z.of_nat (length xs) + 7 <= 0x84000000)%Z ->
  (0x80000000 <= bv_unsigned out <= 0x83fffffc)%Z ->
  bv_and out (BV 64 3) = BV 64 0 ->
  bv_and ret (BV 64 0xfffffffffffffffe) = ret ->
  instr 0x800001bc (Some a800001bc) -∗
  instr 0x800001c0 (Some a800001c0) -∗
  instr 0x800001c4 (Some a800001c4) -∗
  instr 0x800001c6 (Some a800001c6) -∗
  instr 0x800001ca (Some a800001ca) -∗
  instr 0x800001ce (Some a800001ce) -∗
  instr 0x800001d0 (Some a800001d0) -∗
  instr 0x800001d2 (Some a800001d2) -∗
  instr 0x800001d6 (Some a800001d6) -∗
  instr 0x800001da (Some a800001da) -∗
  instr 0x800001dc (Some a800001dc) -∗
  instr 0x800001e0 (Some a800001e0) -∗
  instr 0x800001e4 (Some a800001e4) -∗
  instr 0x800001e8 (Some a800001e8) -∗
  instr 0x800001ea (Some a800001ea) -∗
  instr 0x800001ee (Some a800001ee) -∗
  instr 0x800001f2 (Some a800001f2) -∗
  instr 0x800001f4 (Some a800001f4) -∗
  instr 0x800001f6 (Some a800001f6) -∗
  instr_body 0x800001bc (
    rvv_final_env ∗ rvv_platform_env ∗ "vl" ↦ᵣ RVal_Bits oldvl ∗
    "x10" ↦ᵣ RVal_Bits (Z_to_bv 64 (Z.of_nat (length xs))) ∗ "x11" ↦ᵣ RVal_Bits p ∗
    "x12" ↦ᵣ RVal_Bits out ∗ "x1" ↦ᵣ RVal_Bits ret ∗
    "x13" ↦ᵣ RVal_Bits tmp13 ∗ "x14" ↦ᵣ RVal_Bits rd14 ∗ "x15" ↦ᵣ RVal_Bits rd15 ∗
    "vr0" ↦ᵣ RVal_Bits mask ∗ "vr1" ↦ᵣ RVal_Bits seed ∗
    "vr2" ↦ᵣ RVal_Bits src ∗ "vr16" ↦ᵣ RVal_Bits old ∗ "vr8" ↦ᵣ RVal_Bits acc ∗
    bv_unsigned p ↦ₘ∗ (xs ++ padding) ∗ bv_unsigned out ↦ₘ initial ∗
    instr_pre (bv_unsigned ret) (
      rvv_kernel_result (bv_add p (Z_to_bv 64 (Z.of_nat (length xs)))) out ret mask (byte_sum_list xs) initial ∗
      bv_unsigned p ↦ₘ∗ (xs ++ padding))).
Proof using Type Hload.
  intros Hpad Hrange Hout Halign Hret.
  pose (n := Z_to_bv 64 (Z.of_nat (length xs))).
  assert (Hn : bv_unsigned n = Z.of_nat (length xs)) by (unfold n; bv_solve).
  iIntros "#Hbc #Hc0 #Hc4 #Hc6 #Hca #Hce #Hd0 #Hd2 #Hd6 #Hda #Hdc #He0 #He4 #He8 #Hea #Hee #Hf2 #Hf4 #Hf6".
  iPoseProof (rvv_initialize oldvl rd14 mask acc with "Hbc Hc0") as "Hinit".
  iPoseProof (rvv_entry_env n with "Hc4") as "Hbranch".
  iApply (instr_pre_wand with "Hinit"); [done|done|].
  iIntros "(Henv & Hplatform & Hvl & Hn & Hp & Hout & Hret & H13 & H14 & H15 & Hmask & Hseed & Hsrc & Hold & Hacc & Hinput & Houtput & Hexit)".
  iFrame "Henv Hvl H14 Hmask Hacc".
  iApply (instr_pre_wand with "Hbranch"); [done|done|].
  iIntros "(Henv & Hvl & H14 & Hmask & Hacc)". iFrame "Henv Hn".
  destruct xs as [|x xs].
  - assert (Hz : n = BV 64 0) by (apply bv_eq; exact Hn).
    try rewrite (decide_True _ _ Hz).
    iPoseProof (rvv_finish_shared (BV 64 0xd0) (BV 64 8) (BV 64 8) rd15 tmp13 out ret mask seed (BV 65536 0) initial
      ltac:(right; reflexivity) Hout Halign Hret with "Hdc He0 He4 He8 Hea Hee Hf2 Hf4 Hf6") as "Hfinish".
    iApply (instr_pre_wand with "Hfinish"); [done|done|].
    iIntros "[Henv Hn]". iFrame "Henv Hplatform Hvl H14 H15 H13 Hout Hret Hmask Hseed Hacc Houtput".
    iApply (instr_pre_wand with "Hexit"); [done|done|].
    iIntros "(Henv & Hplatform & Hvl & H14 & H15 & H13 & Hout & Hret & Hmask & Hseed & Hacc & Houtput)".
    iEval (rewrite rvv_shared_sum_same) in "H15".
    iEval (rewrite rvv_shared_sum_same) in "Houtput".
    iFrame "Hinput". unfold rvv_kernel_result. iExists src,old,(BV 65536 0).
    iEval (rewrite rvv_zero_sum) in "H15".
    iEval (rewrite rvv_zero_sum) in "Houtput".
    rewrite rvv_zero_sum. cbn [byte_sum_list fold_right length]. rewrite Hz.
    rewrite (bv_add_0_r p (Z_to_bv 64 0) eq_refl).
    iFrame. done.
  - assert (Hnz : n <> BV 64 0) by (intro E; rewrite E in Hn; change (0 = Z.of_nat (S (length xs)))%Z in Hn; lia).
    try rewrite (decide_False _ _ Hnz).
    iPoseProof (rvv_loop_from_load_contract Hload (x::xs) padding p (BV 64 0xd0) (BV 64 8) rd15 mask src old (BV 65536 0)
      ltac:(discriminate) Hpad ltac:(right; reflexivity) Hrange with "Hc6 Hca Hce Hd0 Hd2 Hd6 Hda") as "Hloop".
    iApply (instr_pre_wand with "Hloop"); [done|done|].
    iIntros "[Henv Hn]". iFrame "Hinput". iSplitL "Henv Hplatform Hvl Hn Hp H15 Hmask Hsrc Hold Hacc".
    { unfold rvv_loop_registers. iFrame. }
    iApply instr_pre_consume.
    iIntros "[Hloopstate Hinput2]".
    iDestruct "Hloopstate" as (vl src' old' acc') "[Hs %Hsum]".
    try rewrite rvv_zero_sum in Hsum.
    assert (Hsum' : RvvReduce.rvv_sum8_seed (BV 65536 0) acc' = byte_sum_list (x::xs)) by (rewrite Hsum; bv_solve).
    iDestruct "Hs" as "(Henv & Hplatform & Hvl & Hn & Hp & H15 & Hmask & Hsrc & Hold & Hacc)".
    iPoseProof (rvv_finish_shared (BV 64 0x90) vl (BV 64 8) vl tmp13 out ret mask seed acc' initial
      ltac:(left; reflexivity) Hout Halign Hret with "Hdc He0 He4 He8 Hea Hee Hf2 Hf4 Hf6") as "Hfinish".
    iApply (instr_pre_wand with "Hfinish"); [done|done|].
    iIntros "_".
    iFrame "Henv Hplatform Hvl H14 H15 H13 Hout Hret Hmask Hseed Hacc Houtput".
    iApply (instr_pre_wand with "Hexit"); [done|done|].
    iIntros "(Henv & Hplatform & Hvl & H14 & H15 & H13 & Hout & Hret & Hmask & Hseed & Hacc & Houtput)".
    iEval (rewrite rvv_shared_sum_same) in "H15".
    iEval (rewrite rvv_shared_sum_same) in "Houtput".
    iFrame "Hinput2". unfold rvv_kernel_result. iExists src',old',acc'.
    iEval (rewrite Hsum') in "H15".
    iEval (rewrite Hsum') in "Houtput".
    rewrite Hsum'. iFrame. done.
Qed.
End composition.
Print Assumptions rvv_kernel_from_load_contract.
