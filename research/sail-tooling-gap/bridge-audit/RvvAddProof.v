Require Import isla.riscv64.riscv64.
Require Import WholeStruct BitsProof.
Require Import Bridge.rvv_add.a800001d6.

Lemma rvv_add_first_lane `{!islaG Σ} `{!threadG} pc (q : nat -> bv 65536) :
  instr pc (Some a800001d6) ⊢ instr_body pc (
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
    "vr8" ↦ᵣ RVal_Bits (q 8%nat) ∗
    "vr9" ↦ᵣ RVal_Bits (q 9%nat) ∗
    "vr10" ↦ᵣ RVal_Bits (q 10%nat) ∗
    "vr11" ↦ᵣ RVal_Bits (q 11%nat) ∗
    "vr12" ↦ᵣ RVal_Bits (q 12%nat) ∗
    "vr13" ↦ᵣ RVal_Bits (q 13%nat) ∗
    "vr14" ↦ᵣ RVal_Bits (q 14%nat) ∗
    "vr15" ↦ᵣ RVal_Bits (q 15%nat) ∗
    "vr16" ↦ᵣ RVal_Bits (q 16%nat) ∗
    "vr17" ↦ᵣ RVal_Bits (q 17%nat) ∗
    "vr18" ↦ᵣ RVal_Bits (q 18%nat) ∗
    "vr19" ↦ᵣ RVal_Bits (q 19%nat) ∗
    "vr20" ↦ᵣ RVal_Bits (q 20%nat) ∗
    "vr21" ↦ᵣ RVal_Bits (q 21%nat) ∗
    "vr22" ↦ᵣ RVal_Bits (q 22%nat) ∗
    "vr23" ↦ᵣ RVal_Bits (q 23%nat) ∗
    instr_pre (pc+4) (∃ result : bv 65536,
      "vr8" ↦ᵣ RVal_Bits result ∗
      ⌜bv_extract 0 32 result =
         bv_add (bv_extract 0 32 (q 8%nat)) (bv_extract 0 32 (q 16%nat))⌝ ∗ True)).
Proof.
  Time iStartProof. Time (repeat demoAStep; liShow).
  Unshelve. all: prepare_sidecond.
  rewrite extract_packed_low32. reflexivity.
  Unshelve. all: try done.
Time Qed.
Print Assumptions rvv_add_first_lane.
