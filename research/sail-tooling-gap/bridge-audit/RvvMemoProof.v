Require Import isla.riscv64.riscv64.
Require Import WholeStruct BitsProof.
Require Import Bridge.rvv_widen.a800001d2.

Declare ML Module "evar_probe.plugin".

Lemma rvv_widen_first_lane_memo `{!islaG Σ} `{!threadG} pc (q : nat -> bv 65536) :
  instr pc (Some a800001d2) ⊢ instr_body pc (
    "elen" ↦ᵣ (RegVal_Base (Val_Bits (BV 1%N 0x1%Z))) ∗
    "vlen" ↦ᵣ (RegVal_Base (Val_Bits (BV 4%N 0x3%Z))) ∗
    "misa" ↦ᵣ (RegVal_Struct [("bits", RegVal_Base (Val_Bits (BV 64%N 0x8000000000200100%Z)))]) ∗
    "rv_enable_zfinx" ↦ᵣ (RegVal_Base (Val_Bool false)) ∗
    "rv_enable_vext" ↦ᵣ (RegVal_Base (Val_Bool true)) ∗
    "mstatus" ↦ᵣ (RegVal_Struct [("bits", RegVal_Base (Val_Bits (BV 64%N 0x8000000000000600%Z)))]) ∗
    "vstart" ↦ᵣ (RegVal_Base (Val_Bits (BV 16%N 0x0%Z))) ∗
    "vl" ↦ᵣ (RegVal_Base (Val_Bits (BV 64%N 0x10%Z))) ∗
    "vlenb" ↦ᵣ (RegVal_Base (Val_Bits (BV 64%N 0x20%Z))) ∗
    "vtype" ↦ᵣ (RegVal_Struct [("bits", RegVal_Base (Val_Bits (BV 64%N 0x93%Z)))]) ∗
    "vr0" ↦ᵣ RVal_Bits (q 0%nat) ∗
    "vr16" ↦ᵣ RVal_Bits (BV 65536 0) ∗
    "vr17" ↦ᵣ RVal_Bits (BV 65536 0) ∗
    "vr18" ↦ᵣ RVal_Bits (BV 65536 0) ∗
    "vr19" ↦ᵣ RVal_Bits (BV 65536 0) ∗
    "vr20" ↦ᵣ RVal_Bits (BV 65536 0) ∗
    "vr21" ↦ᵣ RVal_Bits (BV 65536 0) ∗
    "vr22" ↦ᵣ RVal_Bits (BV 65536 0) ∗
    "vr23" ↦ᵣ RVal_Bits (BV 65536 0) ∗
    "vr2" ↦ᵣ RVal_Bits (q 2%nat) ∗
    "vr3" ↦ᵣ RVal_Bits (q 3%nat) ∗
    instr_pre (pc+4) (∃ result : bv 65536,
      "vr16" ↦ᵣ RVal_Bits result ∗
      ⌜bv_extract 0 32 result = bv_zero_extend 32 (bv_extract 0 8 (q 2%nat))⌝ ∗ True)).
Proof.
  Time iStartProof. Time (repeat demoAStep; liShow).
  Unshelve. all: prepare_sidecond.
  rewrite extract_packed_low32.
  Time memo_evar_bodies.
  reflexivity.
  Unshelve. all: try done.
Time Qed.
Print Assumptions rvv_widen_first_lane_memo.
