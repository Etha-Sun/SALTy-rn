Require Import isla.riscv64.riscv64.
Require Import StructAssume RvvArithmetic RvvSharedDefs RvvLoadSharedDefs RvvCompactLoad RvvCachedSteps RvvUpdateExpressions RvvUpdateMath.
Require Import Simple.rvv.a800001ca.
Ltac cachedCaseStep := first [
  solve [exfalso; repeat match goal with v : bv 65536 |- _ => clear dependent v end; bv_solve]
  | directCachedAStep].
Local Opaque load_update_value_0 load_update_value_1 load_update_value_2 load_update_value_3 load_update_value_4 load_update_value_5 load_update_value_6 load_update_value_7 load_update_value_8 load_update_value_9 load_update_value_10 load_update_value_11 load_update_value_12 load_update_value_13 load_update_value_14 load_update_value_15 load_update_value_16 load_update_value_17 load_update_value_18 load_update_value_19 load_update_value_20 load_update_value_21 load_update_value_22 load_update_value_23 load_update_value_24 load_update_value_25 load_update_value_26 load_update_value_27 load_update_value_28 load_update_value_29 load_update_value_30 load_update_value_31.
Lemma rvv_load_cached_case_2 `{!islaG Σ} `{!threadG} pc
    (p : bv 64) (mask old : bv 65536) (f : N -> bv 8) :
  (0x80000000 <= bv_unsigned p <= 0x83fffff8)%Z ->
  instr pc (Some a800001ca) ⊢ instr_body pc (
    rvv_memory_env ∗ "vl" ↦ᵣ RVal_Bits (BV 64 2) ∗ "x11" ↦ᵣ RVal_Bits p ∗
    "vr0" ↦ᵣ RVal_Bits mask ∗ "vr2" ↦ᵣ RVal_Bits old ∗
    bv_unsigned p ↦ₘ∗ input8 f ∗
    instr_pre (pc+4) (
      rvv_memory_env ∗ "vl" ↦ᵣ RVal_Bits (BV 64 2) ∗ "x11" ↦ᵣ RVal_Bits p ∗
      "vr0" ↦ᵣ RVal_Bits mask ∗ "vr2" ↦ᵣ RVal_Bits (loaded8 (BV 64 2) old f) ∗
      bv_unsigned p ↦ₘ∗ input8 f)).
Proof.
  intros Hrange. rewrite <- a800001ca_shared_exact. iStartProof. repeat cachedCaseStep.

Show.
Abort.
