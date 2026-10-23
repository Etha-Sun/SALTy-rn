From Coq Require Import ZArith Lia List.
From FullU8 Require Import U8Logic U8KernelLogic full10_goal.
From OriginalU8Tail Require Import MemoryFacts.
From OriginalU8Prefix Require Import PrefixFacts.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64 ListNotations.
Local Open Scope Z_scope.
Local Open Scope sac.
From OriginalU8TailFinal Require Import TailFacts.
Lemma proof_of_test_neon_return_wit_3 : full10_goal.test_neon_return_wit_3.
Proof.
 unfold full10_goal.test_neon_return_wit_3; left; intros.
 tail_case batch_2 3; subst batch_2.
 rewrite sizeof_uchar in *; rewrite !Z.mul_1_r in *.
 subst input_2 output_2.
 rewrite UCharArray.undef_full_empty.
 sep_apply (u8_tail_input_restore input_pre batch_pre 3 A ltac:(lia) ltac:(lia) ltac:(lia)).
 rewrite u8_tail_pack_0_2 by (rewrite Zlength_sublist by lia;lia).
 rewrite u8_tail_pack_2_1 by (rewrite Zlength_sublist by lia;lia).
 set (B:=u8_max_list (u8_bound lo) (u8_min_list (u8_bound hi)
   (sublist 0 8 (sublist (batch_pre-3) (batch_pre+7) A)))) in *.
 set (p:=output_pre+(batch_pre-3)) in *.
 assert (Hwin: Zlength (sublist (batch_pre-3) (batch_pre+7) A)=3+7)
   by (rewrite Zlength_sublist by lia;lia).
 assert (HB: Zlength B=8).
 { unfold B,u8_max_list,u8_min_list; rewrite !u8_map_Zlength;
    rewrite Zlength_sublist by lia;lia. }
 replace (p+4+2) with (p+6) in * by lia.
 sep_apply_l_atomic (UCharArray.full_to_seg p 2 (sublist 0 2 B)).
 sep_apply_l_atomic (UCharArray.full_to_seg (p+2) 1 (sublist 2 3 B)).
 sep_apply (u8_seg_concat_at p 2 1 (sublist 0 2 B) (sublist 2 3 B) ltac:(lia) ltac:(lia)).
 replace (2+1) with 3 by lia.
 rewrite <- (sublist_split 0 3 2 B) by lia.
 unfold p,B.
 sep_apply (u8_tail_output_finish output_pre batch_pre 3 (u8_bound lo) (u8_bound hi) A
   ltac:(lia) ltac:(lia) ltac:(lia) ltac:(lia)).
 entailer!.
 all: match goal with |- ?G => idtac "REMAINING" G end.
Qed.
Print Assumptions proof_of_test_neon_return_wit_3.
