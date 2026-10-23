From Coq Require Import ZArith Lia List.
From FullU8 Require Import U8Logic U8KernelLogic full10_goal.
From OriginalU8Tail Require Import MemoryFacts.
From OriginalU8Prefix Require Import PrefixFacts.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope list_scope.
Local Open Scope sac.
Lemma proof_of_test_neon_entail_wit_4 : test_neon_entail_wit_4.
Proof.
 unfold test_neon_entail_wit_4;left;intros.
 rewrite sizeof_uchar in *. rewrite !Z.mul_1_r in *.
 subst input_2 output_2.
 set(off:=batch_pre-batch_2) in *.
 replace(batch_pre-(batch_2-8)) with(off+8) by (unfold off;lia).
 replace(input_pre+off+8) with(input_pre+(off+8)) by lia.
 replace(output_pre+off+8) with(output_pre+(off+8)) by lia.
 replace(batch_2+7-8) with(batch_pre+7-(off+8)) by (unfold off;lia).
 replace(batch_2-8+7) with(batch_pre+7-(off+8)) by (unfold off;lia).
 replace(batch_2-8) with(batch_pre-(off+8)) by (unfold off;lia).
 rewrite u8_suffix_pack8 by (rewrite Zlength_sublist by (unfold off;lia);unfold off;lia).
 rewrite !Zsublist_Zsublist by (unfold off;lia). rewrite ?Z.add_0_l.
 replace(8+off) with(off+8) by lia.
 replace(batch_2+7+off) with(batch_pre+7) by (unfold off;lia).
 sep_apply_l_atomic (UCharArray.full_to_seg (output_pre+off) 8 (u8_suffix_list (u8_bound lo) (u8_bound hi) (sublist off (off+8) A))).
 opaque_registers.
 pose proof(u8_seg_concat_at input_pre off 8 (sublist 0 off A) (sublist off (off+8) A) ltac:(unfold off;lia) ltac:(lia)) as HI.
 sep_apply_l_atomic HI.

 rewrite <- (sublist_split 0 (off+8) off A) by (unfold off;lia).
 pose proof(u8_seg_concat_at output_pre off 8
  (u8_prefix_list (u8_bound lo) (u8_bound hi) (sublist 0 (u8_prefix_n batch_pre) A) ++
   u8_suffix_list (u8_bound lo) (u8_bound hi) (sublist (u8_prefix_n batch_pre) off A))
  (u8_suffix_list (u8_bound lo) (u8_bound hi) (sublist off (off+8) A))
  ltac:(unfold off;lia) ltac:(lia)) as HO.
 sep_apply(u8_seg_concat_at output_pre off 8
  (u8_prefix_list (u8_bound lo) (u8_bound hi) (sublist 0 (u8_prefix_n batch_pre) A) ++
   u8_suffix_list (u8_bound lo) (u8_bound hi) (sublist (u8_prefix_n batch_pre) off A))
  (u8_suffix_list (u8_bound lo) (u8_bound hi) (sublist off (off+8) A))
  ltac:(unfold off;lia) ltac:(lia)).
 rewrite <- app_assoc.
 rewrite u8_suffix_append by (unfold off in *;lia).
 entailer!.
 all: match goal with |- ?G => idtac "REMAINING" G end.
Qed.
Print Assumptions proof_of_test_neon_entail_wit_4.
