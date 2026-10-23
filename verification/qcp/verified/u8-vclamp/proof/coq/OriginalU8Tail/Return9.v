From Coq Require Import ZArith Lia.
From FullU8 Require Import U8Logic U8KernelLogic full10_goal.
From OriginalU8Tail Require Import MemoryFacts.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma proof_of_test_neon_return_wit_9 : test_neon_return_wit_9.
Proof.
 unfold test_neon_return_wit_9;left;intros.
 assert(batch_2=0) by lia;subst batch_2.
 rewrite !Z.sub_0_r,!Z.add_0_l in *.
 rewrite sizeof_uchar in *.
 rewrite !Z.mul_1_r in *.
 subst input_2 output_2.
 rewrite UCharArray.undef_full_empty.
 pose proof(u8_input_restore input_pre batch_pre batch_pre A ltac:(lia) ltac:(lia)) as HR.
 unfold u8_input_view in HR.
 replace(batch_pre+7-batch_pre) with 7 in HR by lia.
 sep_apply_l_atomic HR.
 unfold u8_phase_all.
 sep_apply_l_atomic(UCharArray.seg_to_full output_pre 0 batch_pre
  (u8_prefix_list (u8_bound lo) (u8_bound hi) (sublist 0 (u8_prefix_n batch_pre) A) ++
   u8_suffix_list (u8_bound lo) (u8_bound hi) (sublist (u8_prefix_n batch_pre) batch_pre A))).
 rewrite Z.mul_0_l,Z.add_0_r,Z.sub_0_r;entailer!.
Qed.
Print Assumptions proof_of_test_neon_return_wit_9.
