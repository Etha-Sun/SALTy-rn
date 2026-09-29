Require Import isla.riscv64.riscv64.
Require Import StructAssume RvvArithmetic RvvDefs.
Require Import Simple.rvv.a800001d2.
Lemma rvv_widen_case_8 `{!islaG Σ} `{!threadG} pc
    (mask old src : bv 65536) :
  instr pc (Some a800001d2) ⊢ instr_body pc (
    rvv_loop_env ∗ "vl" ↦ᵣ RVal_Bits (BV 64 8) ∗
    "vr0" ↦ᵣ RVal_Bits mask ∗ "vr2" ↦ᵣ RVal_Bits src ∗ "vr16" ↦ᵣ RVal_Bits old ∗
    instr_pre (pc+4) (
      rvv_loop_env ∗ "vl" ↦ᵣ RVal_Bits (BV 64 8) ∗
      "vr0" ↦ᵣ RVal_Bits mask ∗ "vr2" ↦ᵣ RVal_Bits src ∗
      "vr16" ↦ᵣ RVal_Bits (widened8 (BV 64 8) old src))).
Proof.
  iStartProof. repeat kernelAStep; liShow.
  Unshelve. all: prepare_sidecond. all: try bv_solve.
  Unshelve. all: try done.
  all: unfold widened8, pack8.
  all: cbn [N.mul Z.of_N].
  all: repeat case_decide; try bv_solve.
  all: iFrame.
  Show.
Qed.
Print Assumptions rvv_widen_case_8.
