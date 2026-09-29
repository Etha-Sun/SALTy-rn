Require Import isla.riscv64.riscv64.
Require Import StructAssume RvvArithmetic RvvDefs.
Require Import Simple.rvv.a800001d6.
Definition added8 (vl : bv 64) (acc src : bv 65536) : bv 65536 :=
  pack8 (fun i => if decide (Z.of_N i < bv_unsigned vl)%Z
    then bv_add (bv_extract (32*i) 32 acc) (bv_extract (32*i) 32 src)
    else bv_extract (32*i) 32 acc).
Lemma rvv_add_case_8 `{!islaG Σ} `{!threadG} pc
    (mask acc src : bv 65536) :
  instr pc (Some a800001d6) ⊢ instr_body pc (
    rvv_loop_env ∗ "vl" ↦ᵣ RVal_Bits (BV 64 8) ∗
    "vr0" ↦ᵣ RVal_Bits mask ∗ "vr16" ↦ᵣ RVal_Bits src ∗ "vr8" ↦ᵣ RVal_Bits acc ∗
    instr_pre (pc+4) (
      rvv_loop_env ∗ "vl" ↦ᵣ RVal_Bits (BV 64 8) ∗
      "vr0" ↦ᵣ RVal_Bits mask ∗ "vr16" ↦ᵣ RVal_Bits src ∗
      "vr8" ↦ᵣ RVal_Bits (added8 (BV 64 8) acc src))).
Proof.
  iStartProof. repeat kernelAStep; liShow.
  Unshelve. all: prepare_sidecond. all: try bv_solve.
  Unshelve. all: try done.
  all: unfold added8, pack8.
  all: cbn [N.mul Z.of_N].
  all: repeat case_decide; try bv_solve.
  all: iFrame.
  Show.
Qed.
Print Assumptions rvv_add_case_8.
