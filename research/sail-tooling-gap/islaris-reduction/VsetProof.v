Require Import isla.riscv64.riscv64.
Require Import WholeStruct.
Require Import ReductionDemoVset.a800001c6.

(* This official snapshot chooses a balanced last two chunks. In particular,
   AVL=65 gives VL=33, not 64. The theorem follows the extracted semantics. *)
Definition selected_vl (n : Z) : Z :=
  if decide (n <= 64) then n else
  if decide (n < 128) then (n+1) `quot` 2 else 64.

Lemma signed_zext64 (x : bv 64) :
  bv_signed (bv_zero_extend 128 x) = bv_unsigned x.
Proof.
  rewrite bv_zero_extend_signed. apply bv_swrap_small.
  pose proof (bv_unsigned_in_range 64 x) as Hx.
  change (0 <= bv_unsigned x < 18446744073709551616) in Hx.
  change (-170141183460469231731687303715884105728 <= bv_unsigned x <
          170141183460469231731687303715884105728).
  lia.
Qed.

Lemma vsetvl_arbitrary_remaining `{!islaG Σ} `{!threadG} pc
    (remaining oldvl oldrd : bv 64) (oldstart : bv 16) :
  instr pc (Some a800001c6) ⊢ instr_body pc (
    "elen" ↦ᵣ RVal_Bits (BV 1 1) ∗
    "vlen" ↦ᵣ RVal_Bits (BV 4 3) ∗
    "misa" ↦ᵣ RegVal_Struct [("bits", RVal_Bits (BV 64 0x8000000000200100))] ∗
    "rv_enable_zfinx" ↦ᵣ RVal_Bool false ∗
    "mstatus" ↦ᵣ RegVal_Struct [("bits", RVal_Bits (BV 64 0x8000000000000600))] ∗
    "vtype" ↦ᵣ RegVal_Struct [("bits", RVal_Bits (BV 64 0xd3))] ∗
    "vstart" ↦ᵣ RVal_Bits oldstart ∗
    "vl" ↦ᵣ RVal_Bits oldvl ∗
    "x10" ↦ᵣ RVal_Bits remaining ∗ "x15" ↦ᵣ RVal_Bits oldrd ∗
    instr_pre (pc+4) (
      "vl" ↦ᵣ RVal_Bits (Z_to_bv 64 (selected_vl (bv_unsigned remaining))) ∗
      "x15" ↦ᵣ RVal_Bits (Z_to_bv 64 (selected_vl (bv_unsigned remaining))) ∗
      "vtype" ↦ᵣ RegVal_Struct [("bits", RVal_Bits (BV 64 0x93))] ∗
      "vstart" ↦ᵣ RVal_Bits (BV 16 0) ∗ True)).
Proof.
  iStartProof.
  repeat demoAStep; liShow.
  Unshelve. all: prepare_sidecond.
  all: repeat match goal with
       | Hx : context [bv_signed (bv_zero_extend 128 _)] |- _ =>
           rewrite signed_zext64 in Hx
       end.
  all: try bv_simplify H0; try bv_simplify H1.
  all: unfold selected_vl; repeat case_decide; try bv_solve.
  all: bv_simplify.
  Unshelve. all: try done.
Qed.

Print Assumptions vsetvl_arbitrary_remaining.
