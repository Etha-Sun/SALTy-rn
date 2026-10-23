From Coq Require Import ZArith List Lia.
From QcpNeonLoop Require Import neon_loop_unit_goal TailMemory neon_tail_models neon_init_lemmas InvariantFacts.
From QcpNeon Require Import NeonBridge.
From QcpVadd Require Import VaddBits.
Import Snaive_C_Rules64.
Import ListNotations.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedNeonTailReturns.
Lemma proof_of_test_neon_return_wit_1 : test_neon_return_wit_1.
Proof.
 unfold test_neon_return_wit_1; left; intros.
 unfold fp32_length in *.
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *.
 pose proof (Z.quot_rem batch 4 ltac:(lia)) as Hqr.
 assert (Htot: batch_pre ÷ 4 = k + 3).
 { replace batch_pre with ((k+3)*4) by lia. rewrite Z.quot_mul by lia. reflexivity. }
 subst input_a input_b output.
 pose proof (float_input_restore input_a_pre k (batch_pre ÷ 4+3) A __default_fp32 ltac:(lia) ltac:(lia) ltac:(lia)) as HA.
 pose proof (float_input_restore input_b_pre k (batch_pre ÷ 4+3) B __default_fp32 ltac:(lia) ltac:(lia) ltac:(lia)) as HB.
 unfold LoopMemory.float_cells4 in HA,HB.
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in HA,HB.
 replace (batch_pre ÷ 4+3-k) with (batch ÷ 4+3) in HA,HB by lia.
 repeat rewrite logic_equiv_sepcon_assoc in HA,HB.
 sep_apply HA. sep_apply HB.
 pose proof (float_prefix_append3 output_pre k (vadd_values k A B) (fp32_mul (Znth 0 (fp32_slice k (batch_pre ÷ 4+3) A) __default_fp32) (Znth 0 (fp32_slice k (batch_pre ÷ 4+3) B) __default_fp32)) (fp32_mul (Znth 1 (fp32_slice k (batch_pre ÷ 4+3) A) __default_fp32) (Znth 1 (fp32_slice k (batch_pre ÷ 4+3) B) __default_fp32)) (fp32_mul (Znth 2 (fp32_slice k (batch_pre ÷ 4+3) A) __default_fp32) (Znth 2 (fp32_slice k (batch_pre ÷ 4+3) B) __default_fp32)) ltac:(lia)) as HO.
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in HO.
 repeat rewrite logic_equiv_sepcon_assoc in HO.
 replace (output_pre+k*4+0*4) with (output_pre+k*4) in * by lia.
 sep_apply HO.
 pose proof (vadd_tail_four k 3 A B __default_fp32 ltac:(lia) ltac:(lia) ltac:(lia) ltac:(lia)) as HM.
 rewrite PreH3, PreH4 in HM.
 replace (Z.to_nat 3) with 3%nat in HM by reflexivity. cbn [firstn] in HM.
 rewrite <- HM.
 rewrite Htot.
 replace (batch ÷ 4) with 3 by lia.
 replace (2+1) with 3 by lia. rewrite FloatArray.undef_seg_empty.
 entailer!.
Qed.
Lemma proof_of_test_neon_return_wit_2 : test_neon_return_wit_2.
Proof.
 unfold test_neon_return_wit_2; left; intros.
 unfold fp32_length in *.
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *.
 pose proof (Z.quot_rem batch 4 ltac:(lia)) as Hqr.
 assert (Htot: batch_pre ÷ 4 = k + 1).
 { replace batch_pre with ((k+1)*4) by lia. rewrite Z.quot_mul by lia. reflexivity. }
 subst input_a input_b output.
 pose proof (float_input_restore input_a_pre k (batch_pre ÷ 4+3) A __default_fp32 ltac:(lia) ltac:(lia) ltac:(lia)) as HA.
 pose proof (float_input_restore input_b_pre k (batch_pre ÷ 4+3) B __default_fp32 ltac:(lia) ltac:(lia) ltac:(lia)) as HB.
 unfold LoopMemory.float_cells4 in HA,HB.
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in HA,HB.
 replace (batch_pre ÷ 4+3-k) with (batch ÷ 4+3) in HA,HB by lia.
 repeat rewrite logic_equiv_sepcon_assoc in HA,HB.
 sep_apply HA. sep_apply HB.
 pose proof (float_prefix_append1 output_pre k (vadd_values k A B) (fp32_mul (Znth 0 (fp32_slice k (batch_pre ÷ 4+3) A) __default_fp32) (Znth 0 (fp32_slice k (batch_pre ÷ 4+3) B) __default_fp32)) ltac:(lia)) as HO.
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in HO.
 repeat rewrite logic_equiv_sepcon_assoc in HO.
 replace (output_pre+k*4+0*4) with (output_pre+k*4) in * by lia.
 sep_apply HO.
 pose proof (vadd_tail_four k 1 A B __default_fp32 ltac:(lia) ltac:(lia) ltac:(lia) ltac:(lia)) as HM.
 rewrite PreH3, PreH4 in HM.
 replace (Z.to_nat 1) with 1%nat in HM by reflexivity. cbn [firstn] in HM.
 rewrite <- HM.
 rewrite Htot.
 replace (batch ÷ 4) with 1 by lia.
 replace (2+1) with 3 by lia. rewrite FloatArray.undef_seg_empty.
 entailer!.
Qed.
Lemma proof_of_test_neon_return_wit_3 : test_neon_return_wit_3.
Proof.
 unfold test_neon_return_wit_3; left; intros.
 unfold fp32_length in *.
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *.
 pose proof (Z.quot_rem batch 4 ltac:(lia)) as Hqr.
 assert (Htot: batch_pre ÷ 4 = k + 2).
 { replace batch_pre with ((k+2)*4) by lia. rewrite Z.quot_mul by lia. reflexivity. }
 subst input_a input_b output.
 pose proof (float_input_restore input_a_pre k (batch_pre ÷ 4+3) A __default_fp32 ltac:(lia) ltac:(lia) ltac:(lia)) as HA.
 pose proof (float_input_restore input_b_pre k (batch_pre ÷ 4+3) B __default_fp32 ltac:(lia) ltac:(lia) ltac:(lia)) as HB.
 unfold LoopMemory.float_cells4 in HA,HB.
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in HA,HB.
 replace (batch_pre ÷ 4+3-k) with (batch ÷ 4+3) in HA,HB by lia.
 repeat rewrite logic_equiv_sepcon_assoc in HA,HB.
 sep_apply HA. sep_apply HB.
 pose proof (float_prefix_append2 output_pre k (vadd_values k A B) (fp32_mul (Znth 0 (fp32_slice k (batch_pre ÷ 4+3) A) __default_fp32) (Znth 0 (fp32_slice k (batch_pre ÷ 4+3) B) __default_fp32)) (fp32_mul (Znth 1 (fp32_slice k (batch_pre ÷ 4+3) A) __default_fp32) (Znth 1 (fp32_slice k (batch_pre ÷ 4+3) B) __default_fp32)) ltac:(lia)) as HO.
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in HO.
 repeat rewrite logic_equiv_sepcon_assoc in HO.
 replace (output_pre+k*4+0*4) with (output_pre+k*4) in * by lia.
 sep_apply HO.
 pose proof (vadd_tail_four k 2 A B __default_fp32 ltac:(lia) ltac:(lia) ltac:(lia) ltac:(lia)) as HM.
 rewrite PreH3, PreH4 in HM.
 replace (Z.to_nat 2) with 2%nat in HM by reflexivity. cbn [firstn] in HM.
 rewrite <- HM.
 rewrite Htot.
 replace (batch ÷ 4) with 2 by lia.
 replace (2+1) with 3 by lia. rewrite FloatArray.undef_seg_empty.
 entailer!.
Qed.
End CheckedNeonTailReturns.
