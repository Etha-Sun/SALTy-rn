From Coq Require Import ZArith Lia List.
From FullU8 Require Import U8Logic U8KernelLogic full10_goal.
From OriginalU8Tail Require Import MemoryFacts.
From OriginalU8Prefix Require Import PrefixFacts.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64 ListNotations.
Local Open Scope Z_scope.
Local Open Scope sac.
From OriginalU8TailFinal Require Import TailFacts.
Lemma proof_of_test_neon_return_wit_7 : full10_goal.test_neon_return_wit_7.
Proof.
 unfold full10_goal.test_neon_return_wit_7; left; intros.
 tail_case batch_2 4; subst batch_2.
 rewrite sizeof_uchar in *; rewrite !Z.mul_1_r in *.
 subst input_2 output_2.
 rewrite UCharArray.undef_full_empty.
 sep_apply (u8_tail_input_restore input_pre batch_pre 4 A ltac:(lia) ltac:(lia) ltac:(lia)).
 rewrite u8_tail_pack_0_4 by (rewrite Zlength_sublist by lia;lia).
 set (B:=u8_max_list (u8_bound lo) (u8_min_list (u8_bound hi)
   (sublist 0 8 (sublist (batch_pre-4) (batch_pre+7) A)))) in *.
 set (p:=output_pre+(batch_pre-4)) in *.
 assert (Hwin: Zlength (sublist (batch_pre-4) (batch_pre+7) A)=4+7)
   by (rewrite Zlength_sublist by lia;lia).
 assert (HB: Zlength B=8).
 { unfold B,u8_max_list,u8_min_list; rewrite !u8_map_Zlength;
    rewrite Zlength_sublist by lia;lia. }
 replace (p+4+2) with (p+6) in * by lia.
 sep_apply_l_atomic (UCharArray.full_to_seg p 4 (sublist 0 4 B)).
 unfold p,B.
 sep_apply (u8_tail_output_finish output_pre batch_pre 4 (u8_bound lo) (u8_bound hi) A
   ltac:(lia) ltac:(lia) ltac:(lia) ltac:(lia)).
 entailer!.
 all: match goal with |- ?G => idtac "REMAINING" G end.
Qed.
Print Assumptions proof_of_test_neon_return_wit_7.
