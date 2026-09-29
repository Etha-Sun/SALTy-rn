Require Import isla.riscv64.riscv64.
Require Import StructAssume RvvArithmetic RvvSharedDefs RvvLoadSharedDefs RvvCompactLoad.
Require Import Simple.rvv.a800001ca.
Ltac loadAStep mask old f := first [
  solve [exfalso; try clear dependent mask; try clear dependent old; try clear dependent f; bv_solve]
  | kernelAStep].
Lemma rvv_load_shared_case_8 `{!islaG Σ} `{!threadG} pc
    (p : bv 64) (mask old : bv 65536) (f : N -> bv 8) :
  (0x80000000 <= bv_unsigned p <= 0x83fffff8)%Z ->
  instr pc (Some a800001ca) ⊢ instr_body pc (
    rvv_memory_env ∗ "vl" ↦ᵣ RVal_Bits (BV 64 8) ∗ "x11" ↦ᵣ RVal_Bits p ∗
    "vr0" ↦ᵣ RVal_Bits mask ∗ "vr2" ↦ᵣ RVal_Bits old ∗
    bv_unsigned p ↦ₘ∗ input8 f ∗
    instr_pre (pc+4) (
      rvv_memory_env ∗ "vl" ↦ᵣ RVal_Bits (BV 64 8) ∗ "x11" ↦ᵣ RVal_Bits p ∗
      "vr0" ↦ᵣ RVal_Bits mask ∗ "vr2" ↦ᵣ RVal_Bits (loaded8 (BV 64 8) old f) ∗
      bv_unsigned p ↦ₘ∗ input8 f)).
Proof.
  intros Hrange. rewrite <- a800001ca_shared_exact. iStartProof. repeat (loadAStep mask old f); liShow.
  Unshelve. all: prepare_sidecond. all: try bv_solve.
  Unshelve. all: try done.
  all: unfold loaded8, pack32bytes; cbn [N.mul Z.of_N].
  all: repeat case_decide; try bv_solve.
  all: try iFrame.
  Show.
Qed.
Print Assumptions rvv_load_shared_case_8.
