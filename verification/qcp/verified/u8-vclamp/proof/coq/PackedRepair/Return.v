From Coq Require Import ZArith Lia List String.
From SimpleC.SL Require Import Mem SeparationLogic.
From LeaderAutomation Require Import FastFrame.
From FullU8 Require Import Packed32Layout Packed32Model U8Logic U8KernelLogic.
From U8PackedKernel Require Import Prelude unit_goal.
From PackedRepair Require Import MemoryFacts.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma proof_of_test_rvv_return_wit_1 : U8PackedKernel.unit_goal.test_rvv_return_wit_1.
Proof.
 unfold test_rvv_return_wit_1;left;intros.
 assert(batch_2=0)by lia;subst batch_2.
 rewrite ?sizeof_uchar,?Z.sub_0_r,?Z.mul_1_r,?Z.add_0_l in *.
 assert(input_2=input_pre+batch_pre)by lia;subst input_2.
 pose proof(u8_input_restore input_pre batch_pre batch_pre A ltac:(lia) ltac:(lia))as Hrestore.
 unfold u8_input_view in Hrestore.
 replace(batch_pre+7-batch_pre)with 7 in Hrestore by lia.
 sep_apply_l_atomic Hrestore.
 rewrite UCharArray.undef_full_empty.
 unfold u8_phase_all.
 sep_apply_l_atomic(UCharArray.seg_to_full output_pre 0 batch_pre
 (u8_prefix_list(u8_bound lo)(u8_bound hi)(sublist 0(u8_prefix_n batch_pre)A)++
  u8_suffix_list(u8_bound lo)(u8_bound hi)(sublist(u8_prefix_n batch_pre)batch_pre A))).
 rewrite ?Z.mul_0_l,?Z.add_0_r,?Z.sub_0_r.
 entailer!.
Qed.
Print Assumptions proof_of_test_rvv_return_wit_1.
