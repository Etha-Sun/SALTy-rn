Require Import isla.riscv64.riscv64.
Require Import StructAssume RvvArithmetic.
Require Import Simple.rvv.a800001d2.
Definition rvv_loop_env `{!islaG Σ} `{!threadG} : iProp Σ :=
    "elen" ↦ᵣ (RegVal_Base (Val_Bits (BV 1%N 0x1%Z))) ∗
    "vlen" ↦ᵣ (RegVal_Base (Val_Bits (BV 4%N 0x3%Z))) ∗
    "misa" ↦ᵣ (RegVal_Struct [("bits", RegVal_Base (Val_Bits (BV 64%N 0x8000000000200104%Z)))]) ∗
    "rv_enable_zfinx" ↦ᵣ (RegVal_Base (Val_Bool false)) ∗
    "rv_enable_vext" ↦ᵣ (RegVal_Base (Val_Bool true)) ∗
    "mstatus" ↦ᵣ (RegVal_Struct [("bits", RegVal_Base (Val_Bits (BV 64%N 0x8000000000000600%Z)))]) ∗
    "vstart" ↦ᵣ (RegVal_Base (Val_Bits (BV 16%N 0x0%Z))) ∗
    "vlenb" ↦ᵣ (RegVal_Base (Val_Bits (BV 64%N 0x20%Z))) ∗
    "vtype" ↦ᵣ (RegVal_Struct [("bits", RegVal_Base (Val_Bits (BV 64%N 0x90%Z)))]).
Arguments rvv_loop_env /.
Definition pack8 (f : N -> bv 32) : bv 65536 := bv_or (bv_shiftl (bv_or (bv_shiftl (bv_or (bv_shiftl (bv_or (bv_shiftl (bv_or (bv_shiftl (bv_or (bv_shiftl (bv_or (bv_shiftl (bv_zero_extend 65536 (f 7%N)) (BV 65536 32)) (bv_zero_extend 65536 (f 6%N))) (BV 65536 32)) (bv_zero_extend 65536 (f 5%N))) (BV 65536 32)) (bv_zero_extend 65536 (f 4%N))) (BV 65536 32)) (bv_zero_extend 65536 (f 3%N))) (BV 65536 32)) (bv_zero_extend 65536 (f 2%N))) (BV 65536 32)) (bv_zero_extend 65536 (f 1%N))) (BV 65536 32)) (bv_zero_extend 65536 (f 0%N)).
Definition widened8 (vl : bv 64) (old src : bv 65536) : bv 65536 :=
  pack8 (fun i => if decide (Z.of_N i < bv_unsigned vl)%Z
    then bv_zero_extend 32 (bv_extract (8*i) 8 src)
    else bv_extract (32*i) 32 old).
Lemma rvv_widen_all_active_lanes `{!islaG Σ} `{!threadG} pc
    (vl : bv 64) (mask old src : bv 65536) :
  (bv_unsigned vl <= 8)%Z ->
  instr pc (Some a800001d2) ⊢ instr_body pc (
    rvv_loop_env ∗ "vl" ↦ᵣ RVal_Bits vl ∗
    "vr0" ↦ᵣ RVal_Bits mask ∗ "vr2" ↦ᵣ RVal_Bits src ∗ "vr16" ↦ᵣ RVal_Bits old ∗
    instr_pre (pc+4) (
      rvv_loop_env ∗ "vl" ↦ᵣ RVal_Bits vl ∗
      "vr0" ↦ᵣ RVal_Bits mask ∗ "vr2" ↦ᵣ RVal_Bits src ∗
      "vr16" ↦ᵣ RVal_Bits (widened8 vl old src))).
Proof.
  intros Hvl.
  all: iStartProof.
  all: repeat kernelAStep; liShow.
  Unshelve. all: prepare_sidecond.
  all: try bv_solve.
  all: repeat match goal with Hx : context [bv_signed _] |- _ => progress bv_simplify Hx end.
  all: unfold widened8, pack8; cbn [N.mul N.of_nat Z.of_N].
  all: repeat case_decide; try bv_solve; try reflexivity.
  Unshelve. all: try done.
  all: pose proof (vl_minus_one vl Hvl) as Hminus.
  all: fold LET16 in Hminus.
  all: repeat match goal with Hx : context [bv_signed ?value] |- _ =>
    progress rewrite Hminus in Hx end.
  all: repeat match goal with Hx : context [bv_signed _] |- _ => progress bv_simplify Hx end.
  all: unfold widened8, pack8.
  all: repeat (case_decide; try (exfalso; lia)).
  all: cbn [Z.of_N N.mul]; iFrame.
Show. Abort.
