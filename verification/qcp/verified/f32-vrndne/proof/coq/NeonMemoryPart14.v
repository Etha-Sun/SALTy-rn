From Coq Require Import ZArith Lia List.
From Rndne Require Import NeonMemorySupport neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedNeonMemoryPart14.
Lemma proof_of_test_neon_return_wit_1 : Rndne.neon_unit_goal.test_neon_return_wit_1.
Proof.
 unfold Rndne.neon_unit_goal.test_neon_return_wit_1; left; intros. repeat rewrite rndne_neon_expression.
 unfold fp32_length in *.
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *.
 pose proof (Z.quot_rem batch 4 ltac:(lia)) as Hqr.
 assert (Htot: batch_pre ÷ 4 = k + 3).
 { replace batch_pre with ((k+3)*4) by lia. rewrite Z.quot_mul by lia. reflexivity. }
 subst input output.
 pose proof (float_input_restore input_pre k (batch_pre ÷ 4+3) A __default_fp32 ltac:(lia) ltac:(lia) ltac:(lia)) as HA.
 unfold LoopMemory.float_cells4 in HA.
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in HA.
 replace (batch_pre ÷ 4+3-k) with (batch ÷ 4+3) in HA by lia.
 repeat rewrite logic_equiv_sepcon_assoc in HA.
 sep_apply HA.
 pose proof (float_prefix_append3 output_pre k (rndne_values k A ) (rndne_neon (Znth 0 (fp32_slice k (batch_pre ÷ 4+3) A) __default_fp32) ) (rndne_neon (Znth 1 (fp32_slice k (batch_pre ÷ 4+3) A) __default_fp32) ) (rndne_neon (Znth 2 (fp32_slice k (batch_pre ÷ 4+3) A) __default_fp32) ) ltac:(lia)) as HO.
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in HO.
 repeat rewrite logic_equiv_sepcon_assoc in HO.
 replace (output_pre+k*4+0*4) with (output_pre+k*4) in * by lia.
 sep_apply HO.
 pose proof (rndne_tail_four k 3 A  __default_fp32 ltac:(lia) ltac:(lia) ltac:(lia)) as HM.
 replace (Zlength A) with (batch_pre ÷ 4+3) in HM by lia.
 replace (Z.to_nat 3) with 3%nat in HM by reflexivity. cbn [firstn] in HM.
 rewrite <- HM.
 rewrite Htot.
 replace (batch ÷ 4) with 3 by lia.
 replace (2+1) with 3 by lia. rewrite FloatArray.undef_seg_empty.
 entailer!.
Qed.
End CheckedNeonMemoryPart14.
