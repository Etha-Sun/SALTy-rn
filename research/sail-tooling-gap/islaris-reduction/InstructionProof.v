(* A proof attempt about the actual Islaris-generated vredsum.vs trace.
   This is a single instruction, not the arbitrary-length kernel theorem. *)
Require Import isla.riscv64.riscv64.
Require Import WholeStruct.
Require Import BitsProof.
Require Import ReductionDemo.a800001ea.

Definition lanes8 (v : bv 65536) : list (bv 32) :=
  [bv_extract 0 32 v; bv_extract 32 32 v;
   bv_extract 64 32 v; bv_extract 96 32 v;
   bv_extract 128 32 v; bv_extract 160 32 v;
   bv_extract 192 32 v; bv_extract 224 32 v].

Definition sum64 (seed r8 r9 r10 r11 r12 r13 r14 r15 : bv 65536) : bv 32 :=
  fold_left bv_add
    (lanes8 r8 ++ lanes8 r9 ++ lanes8 r10 ++ lanes8 r11 ++
     lanes8 r12 ++ lanes8 r13 ++ lanes8 r14 ++ lanes8 r15)
    (bv_extract 0 32 seed).

Lemma vredsum_full64 `{!islaG Σ} `{!threadG} pc
    (r0 seed r8 r9 r10 r11 r12 r13 r14 r15 : bv 65536) :
  instr pc (Some a800001ea) ⊢ instr_body pc (
    "vlen" ↦ᵣ RVal_Bits (BV 4 3) ∗
    "misa" ↦ᵣ RegVal_Struct [("bits", RVal_Bits (BV 64 0x8000000000200100))] ∗
    "rv_enable_zfinx" ↦ᵣ RVal_Bool false ∗
    "rv_enable_vext" ↦ᵣ RVal_Bool true ∗
    "mstatus" ↦ᵣ RegVal_Struct [("bits", RVal_Bits (BV 64 0x8000000000000600))] ∗
    "vstart" ↦ᵣ RVal_Bits (BV 16 0) ∗
    "vl" ↦ᵣ RVal_Bits (BV 64 64) ∗
    "vlenb" ↦ᵣ RVal_Bits (BV 64 32) ∗
    "vtype" ↦ᵣ RegVal_Struct [("bits", RVal_Bits (BV 64 0xd3))] ∗
    "vr0" ↦ᵣ RVal_Bits r0 ∗ "vr1" ↦ᵣ RVal_Bits seed ∗
    "vr8" ↦ᵣ RVal_Bits r8 ∗ "vr9" ↦ᵣ RVal_Bits r9 ∗
    "vr10" ↦ᵣ RVal_Bits r10 ∗ "vr11" ↦ᵣ RVal_Bits r11 ∗
    "vr12" ↦ᵣ RVal_Bits r12 ∗ "vr13" ↦ᵣ RVal_Bits r13 ∗
    "vr14" ↦ᵣ RVal_Bits r14 ∗ "vr15" ↦ᵣ RVal_Bits r15 ∗
    instr_pre (pc+4) (
      ∃ result : bv 65536,
        "vr8" ↦ᵣ RVal_Bits result ∗
        ⌜bv_extract 0 32 result = sum64 seed r8 r9 r10 r11 r12 r13 r14 r15⌝ ∗
        True)).
Proof.
  iStartProof.
  repeat demoAStep; liShow.
  Unshelve. all: prepare_sidecond.
  rewrite extract_packed_low32.
  reflexivity.
  Unshelve.
  all: try done.
Qed.

Print Assumptions vredsum_full64.
