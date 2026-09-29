(* Pending assembly of all nine accepted load cases; not a checked result yet. *)
Require Import isla.riscv64.riscv64.
Require Import StructAssume RvvArithmetic RvvSharedDefs RvvLoadSharedDefs RvvCompactLoad RvvCachedSteps RvvUpdateExpressions RvvUpdateMath RvvFreshGuard.
Require Import Simple.rvv.a800001ca.
Local Opaque load_update_value_0 load_update_value_1 load_update_value_2 load_update_value_3 load_update_value_4 load_update_value_5 load_update_value_6 load_update_value_7 load_update_value_8 load_update_value_9 load_update_value_10 load_update_value_11 load_update_value_12 load_update_value_13 load_update_value_14 load_update_value_15 load_update_value_16 load_update_value_17 load_update_value_18 load_update_value_19 load_update_value_20 load_update_value_21 load_update_value_22 load_update_value_23 load_update_value_24 load_update_value_25 load_update_value_26 load_update_value_27 load_update_value_28 load_update_value_29 load_update_value_30 load_update_value_31.
Require Import RvvLoadInlineCase0 RvvLoadDeferredCase1 RvvLoadFastSideCase2 RvvLoadFastSideCase3 RvvLoadFastSideCase4 RvvLoadFastSideCase5 RvvLoadFastSideCase6 RvvLoadFastSideCase7 RvvLoadFastSideCase8.
Lemma rvv_load_active_bytes_checked `{!islaG Σ} `{!threadG} pc
    (vl p : bv 64) (mask old : bv 65536) (f : N -> bv 8) :
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
Proof.
  intros Hvl Hrange.
  pose proof (bv_unsigned_in_range 64 vl).
  assert (bv_unsigned vl = 0 \/ bv_unsigned vl = 1 \/ bv_unsigned vl = 2 \/ bv_unsigned vl = 3 \/ bv_unsigned vl = 4 \/ bv_unsigned vl = 5 \/ bv_unsigned vl = 6 \/ bv_unsigned vl = 7 \/ bv_unsigned vl = 8)%Z as Hcases by lia.
  destruct Hcases as [E|[E|[E|[E|[E|[E|[E|[E|E]]]]]]]].
  - assert (Ev : vl = BV 64 0) by (apply bv_eq; exact E).
    rewrite Ev. apply rvv_load_inline_case_0. exact Hrange.
  - assert (Ev : vl = BV 64 1) by (apply bv_eq; exact E).
    rewrite Ev. apply rvv_load_deferred_case_1. exact Hrange.
  - assert (Ev : vl = BV 64 2) by (apply bv_eq; exact E).
    rewrite Ev. apply rvv_load_fast_side_case_2. exact Hrange.
  - assert (Ev : vl = BV 64 3) by (apply bv_eq; exact E).
    rewrite Ev. apply rvv_load_fast_side_case_3. exact Hrange.
  - assert (Ev : vl = BV 64 4) by (apply bv_eq; exact E).
    rewrite Ev. apply rvv_load_fast_side_case_4. exact Hrange.
  - assert (Ev : vl = BV 64 5) by (apply bv_eq; exact E).
    rewrite Ev. apply rvv_load_fast_side_case_5. exact Hrange.
  - assert (Ev : vl = BV 64 6) by (apply bv_eq; exact E).
    rewrite Ev. apply rvv_load_fast_side_case_6. exact Hrange.
  - assert (Ev : vl = BV 64 7) by (apply bv_eq; exact E).
    rewrite Ev. apply rvv_load_fast_side_case_7. exact Hrange.
  - assert (Ev : vl = BV 64 8) by (apply bv_eq; exact E).
    rewrite Ev. apply rvv_load_fast_side_case_8. exact Hrange.
Qed.
Print Assumptions rvv_load_active_bytes_checked.
