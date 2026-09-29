(* Diagnostic only: ends in Abort; never a correctness result. *)
Require Import isla.riscv64.riscv64 RvvReadByteFast RvvReadByteFlexible.
From iris.proofmode Require Import environments.
Require Import RvvFastUnfold RvvActiveCache RvvCachedSteps StructAssume.
Require Import StructAssume RvvArithmetic RvvSharedDefs RvvLoadSharedDefs RvvCompactLoad RvvCachedSteps RvvUpdateExpressions RvvUpdateMath RvvFreshGuard RvvTaggedResume RvvGuardFix RvvActiveCache RvvDirectAssert RvvAssertNormalize.
Require Import Simple.rvv.a800001ca.
Local Opaque load_update_value_0 load_update_value_1 load_update_value_2 load_update_value_3 load_update_value_4 load_update_value_5 load_update_value_6 load_update_value_7 load_update_value_8 load_update_value_9 load_update_value_10 load_update_value_11 load_update_value_12 load_update_value_13 load_update_value_14 load_update_value_15 load_update_value_16 load_update_value_17 load_update_value_18 load_update_value_19 load_update_value_20 load_update_value_21 load_update_value_22 load_update_value_23 load_update_value_24 load_update_value_25 load_update_value_26 load_update_value_27 load_update_value_28 load_update_value_29 load_update_value_30 load_update_value_31.
Local Opaque RvvLoadSharedDefs.loaded8 RvvLoadSharedDefs.pack32bytes.
Ltac lightGuard := first [
  progress normalizePathGuards
 | solve [exfalso; match goal with H : false = true |- _ => discriminate H end]
 | solve [exfalso; match goal with H : True -> False |- _ => apply H; exact I end]
 | match goal with H : context[bv_signed _] |- _ =>
   let P := type of H in
   lazymatch P with guard_seen _ => fail | _ =>
    tryif (match goal with _ : guard_seen P |- _ => idtac end) then fail else
    first [solve [exfalso; clear -H; let assertion := type of H in is_closed_term assertion; timeout 1 (vm_compute in H; first [discriminate H | apply H; reflexivity])]
    | let marker := fresh "LIGHT_GUARD" in pose proof (guard_seen_intro P) as marker]
   end end
 ].
Ltac readInputByteDebug p f range := 
 lazymatch goal with |- envs_entails _ (WPasm (ReadMem ?rv ?kind ?ra ?len ?tag ?ann :t: _)) => idtac "READ_RAW" rv ra len end;
 lazymatch goal with
 | |- envs_entails _ (WPasm (ReadMem (RVal_Bits (bv_to_bvn ?v)) ?kind (RVal_Bits (bv_to_bvn ?a)) 1 ?tag ?ann :t: ?es)) =>
  idtac "READ_MATCHED" a v;
  let raw := lazymatch a with bv_add _ _ => a | _ => let raw := eval cbv delta [a] in a in raw end in
  let base := lazymatch raw with bv_add ?base _ => base | _ => raw end in
  let off := lazymatch raw with bv_add _ ?off => off | _ => constr:(BV 64 0) end in
  idtac "READ_BASE" base p; unify base p; idtac "READ_BASE_OK";
  let kZ := eval vm_compute in (bv_unsigned off) in
  let k := eval vm_compute in (Z.to_nat kZ) in
  let hi := fresh "MEM_INDEX" in assert (hi : (k < 8)%nat) by lia;
  let ha := fresh "MEM_ADDRESS" in
  assert (ha : bv_unsigned a = (bv_unsigned p + Z.of_nat k)%Z) by
    (first [clear -range a | clear -range]; try unfold a; bv_solve);
  idtac "READ_ADDRESS_OK";
  notypeclasses refine (tac_fast_apply (read_input8_fast p a f v k es ann kind tag hi ha) _);
  idtac "READ_APPLIED";
  iFrame; idtac "READ_FRAMED";
  let hv := fresh "MEM_VALUE" in iIntros (hv) "Hmem";
  idtac "READ_INTROS"; try subst v; liSimpl;
  idtac "direct byte read" k
 end.

Ltac memoryStep p f range :=
 lazymatch goal with
 | |- environments.envs_entails _ (WPasm tnil) => fail
 | _ => try liAIntroduceLetInGoal; first [lightGuard | fastTraceUnfold | readInputByteDebug p f range | directActiveCachedVector | directCachedVector | kernelAStep]
 end.
Lemma rvv_load_read_probe_case_1 `{!islaG Σ} `{!threadG} pc
    (p : bv 64) (mask old : bv 65536) (f : N -> bv 8) :
  (0x80000000 <= bv_unsigned p <= 0x83fffff8)%Z ->
  instr pc (Some a800001ca) ⊢ instr_body pc (
    rvv_memory_env ∗ "vl" ↦ᵣ RVal_Bits (BV 64 1) ∗ "x11" ↦ᵣ RVal_Bits p ∗
    "vr0" ↦ᵣ RVal_Bits mask ∗ "vr2" ↦ᵣ RVal_Bits old ∗
    bv_unsigned p ↦ₘ∗ input8 f ∗
    instr_pre (pc+4) (
      rvv_memory_env ∗ "vl" ↦ᵣ RVal_Bits (BV 64 1) ∗ "x11" ↦ᵣ RVal_Bits p ∗
      "vr0" ↦ᵣ RVal_Bits mask ∗ "vr2" ↦ᵣ RVal_Bits (loaded8 (BV 64 1) old f) ∗
      bv_unsigned p ↦ₘ∗ input8 f)).
Proof.
  intros Hrange. rewrite <- a800001ca_shared_exact. iStartProof. repeat (memoryStep p f Hrange).

Show.
Abort.
