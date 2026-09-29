Require Import isla.riscv64.riscv64 RvvReadByteFast RvvLoadSharedDefs.
Lemma read_byte_fast_probe `{!islaG Σ} `{!threadG} (p : bv 64)
 (f : N -> bv 8) (v : bv 8) (tail : bv 8 -> isla_trace) :
 (0x80000000 <= bv_unsigned p <= 0x83fffff8)%Z ->
 (bv_unsigned p ↦ₘ∗ input8 f ∗ (bv_unsigned p ↦ₘ∗ input8 f -∗ WPasm (tail (f 7%N)))) ⊢
 WPasm (ReadMem (RVal_Bits (bv_to_bvn v)) RegVal_Poison
 (RVal_Bits (bv_to_bvn (bv_add p (BV 64 7)))) 1 None Mk_annot :t: tail v).
Proof.
 intros Hrange. iIntros "[Hmem Hpost]".
 pose (a := bv_add p (BV 64 7)). fold a.
 readInputByte p f Hrange.
 iApply ("Hpost" with "Hmem").
Qed.
Print Assumptions read_byte_fast_probe.
