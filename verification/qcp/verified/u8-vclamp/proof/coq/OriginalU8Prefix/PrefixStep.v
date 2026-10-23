From Coq Require Import ZArith Lia List.
From FullU8 Require Import U8Logic U8KernelLogic full10_goal.
From OriginalU8Prefix Require Import PrefixFacts.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma proof_of_test_neon_entail_wit_2 : test_neon_entail_wit_2.
Proof.
 unfold test_neon_entail_wit_2;left;intros.
 rewrite sizeof_uchar in *;rewrite !Z.mul_1_r in *.
 subst input output.
 set(off:=batch_pre-batch) in *.
 pose proof(u8_next64_prefix batch_pre off ltac:(unfold off;lia) ltac:(unfold off;lia) PreH8) as [Hnext Hrem].
 change (16+16) with 32 in *;change (32+16) with 48 in *;change (48+16) with 64 in *.
 rewrite ?Z.sub_0_r in *.
 repeat rewrite Zsublist_Zsublist by (unfold off;lia).
 rewrite ?Z.add_0_l in *.
 replace(16+off) with(off+16) in * by lia.
 replace(32+off) with(off+32) in * by lia.
 replace(48+off) with(off+48) in * by lia.
 replace(64+off) with(off+64) in * by lia.
 rewrite !u8_prefix_pack16 by (rewrite Zlength_sublist by (unfold off;lia);unfold off;lia).
 repeat rewrite Zsublist_Zsublist by (unfold off;lia).
 replace(16+16+off) with(off+32) in * by lia.
 replace(16+16+16+off) with(off+48) in * by lia.
 replace(16+16+16+16+off) with(off+64) in * by lia.
 replace(batch+7-48+16+16+16+off) with(batch_pre+7) in * by (unfold off;lia).

 rewrite ?Z.add_0_l in *.
 replace (16+off) with (off+16) in * by lia.
 replace (16+(off+16)) with (off+32) in * by lia.
 replace (16+(off+32)) with (off+48) in * by lia.
 replace (16+(off+48)) with (off+64) in * by lia.
 replace (batch+7-48+(off+48)) with (batch_pre+7) in * by (unfold off;lia).
 opaque_registers.
 sep_apply_l_atomic (UCharArray.full_to_seg (output_pre+off) 16 (u8_prefix_list (u8_bound lo) (u8_bound hi) (sublist off (off+16) A))).
 sep_apply_l_atomic (UCharArray.full_to_seg (output_pre+off+16) 16 (u8_prefix_list (u8_bound lo) (u8_bound hi) (sublist (off+16) (off+32) A))).
 sep_apply_l_atomic (UCharArray.full_to_seg (output_pre+off+32) 16 (u8_prefix_list (u8_bound lo) (u8_bound hi) (sublist (off+32) (off+48) A))).
 sep_apply_l_atomic (UCharArray.full_to_seg (output_pre+off+48) 16 (u8_prefix_list (u8_bound lo) (u8_bound hi) (sublist (off+48) (off+64) A))).
 sep_apply_l_atomic(u8_seg_concat_at (input_pre+off) 16 16 (sublist off (off+16) A) (sublist (off+16) (off+32) A) ltac:(lia) ltac:(lia)).
 sep_apply_l_atomic(u8_seg_concat_at (input_pre+off) 32 16 ((sublist off (off+16) A)++(sublist (off+16) (off+32) A)) (sublist (off+32) (off+48) A) ltac:(lia) ltac:(lia)).
 sep_apply_l_atomic(u8_seg_concat_at (input_pre+off) 48 16 (((sublist off (off+16) A)++(sublist (off+16) (off+32) A))++(sublist (off+32) (off+48) A)) (sublist (off+48) (off+64) A) ltac:(lia) ltac:(lia)).
 sep_apply_l_atomic(u8_seg_concat_at (output_pre+off) 16 16 (u8_prefix_list (u8_bound lo) (u8_bound hi) (sublist off (off+16) A)) (u8_prefix_list (u8_bound lo) (u8_bound hi) (sublist (off+16) (off+32) A)) ltac:(lia) ltac:(lia)).
 sep_apply_l_atomic(u8_seg_concat_at (output_pre+off) 32 16 ((u8_prefix_list (u8_bound lo) (u8_bound hi) (sublist off (off+16) A))++(u8_prefix_list (u8_bound lo) (u8_bound hi) (sublist (off+16) (off+32) A))) (u8_prefix_list (u8_bound lo) (u8_bound hi) (sublist (off+32) (off+48) A)) ltac:(lia) ltac:(lia)).
 sep_apply_l_atomic(u8_seg_concat_at (output_pre+off) 48 16 (((u8_prefix_list (u8_bound lo) (u8_bound hi) (sublist off (off+16) A))++(u8_prefix_list (u8_bound lo) (u8_bound hi) (sublist (off+16) (off+32) A)))++(u8_prefix_list (u8_bound lo) (u8_bound hi) (sublist (off+32) (off+48) A))) (u8_prefix_list (u8_bound lo) (u8_bound hi) (sublist (off+48) (off+64) A)) ltac:(lia) ltac:(lia)).
 unfold u8_prefix_list in *.
 repeat rewrite <- map_app.
 repeat rewrite <- sublist_split by (unfold off;lia).
 change (48+16) with 64 in *.
 sep_apply_l_atomic(u8_seg_concat_at input_pre off 64
   (sublist 0 off A) (sublist off (off+64) A) ltac:(unfold off;lia) ltac:(lia)).
 sep_apply_l_atomic(u8_seg_concat_at output_pre off 64
   (map (fun x=>u8_prefix x (u8_bound lo) (u8_bound hi)) (sublist 0 off A))
   (map (fun x=>u8_prefix x (u8_bound lo) (u8_bound hi)) (sublist off (off+64) A))
   ltac:(unfold off;lia) ltac:(lia)).
 repeat rewrite <- map_app.
 repeat rewrite <- sublist_split by (unfold off;lia).
 replace(batch_pre-(batch-64)) with(off+64) by (unfold off;lia).
 replace(input_pre+off+48+16) with(input_pre+off+64) by lia.
 replace(output_pre+off+48+16) with(output_pre+off+64) by lia.
 replace(batch+7-48-16) with(batch-64+7) by lia.
 replace(batch-48-16) with(batch-64) by lia.
 replace (batch-16-16-16-16) with (batch-64) in * by lia.
 entailer!.
 all: match goal with |- ?G => idtac "REMAINING" G end.
Qed.
Print Assumptions proof_of_test_neon_entail_wit_2.
