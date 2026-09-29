Require Import isla.riscv64.riscv64 RvvReadByteFast RvvLoadSharedDefs.
From iris.proofmode Require Import environments.
Ltac readInputByteSelected p f range := 
 lazymatch goal with
 | |- envs_entails _ (WPasm (ReadMem (RVal_Bits (bv_to_bvn ?v)) ?kind (RVal_Bits (bv_to_bvn ?a)) 1 ?tag ?ann :t: ?es)) =>
  let raw := lazymatch a with bv_add _ _ => a | _ => let raw := eval cbv delta [a] in a in raw end in
  let base := lazymatch raw with bv_add ?base _ => base | _ => raw end in
  let off := lazymatch raw with bv_add _ ?off => off | _ => constr:(BV 64 0) end in
  unify base p;
  let kZ := eval vm_compute in (bv_unsigned off) in
  let k := eval vm_compute in (Z.to_nat kZ) in
  let hi := fresh "MEM_INDEX" in assert (hi : (k < 8)%nat) by lia;
  let ha := fresh "MEM_ADDRESS" in
  assert (ha : bv_unsigned a = (bv_unsigned p + Z.of_nat k)%Z) by
    (first [clear -range a | clear -range]; try unfold a; bv_solve);
  notypeclasses refine (tac_fast_apply (read_input8_fast p a f v k es ann kind tag hi ha) _);
  liSimpl;
  iSelect (_ ↦ₘ∗ _)%I ltac:(fun Hbuf => iSplitL Hbuf; [iExact Hbuf | idtac]);
  let hv := fresh "MEM_VALUE" in iIntros (hv) "?";
  try subst v; liSimpl;
  idtac "direct byte read" k
 end.
