From Coq Require Import ZArith Lia List.
From AUXLib Require Import ListLib.
Import ListNotations.
From FMin Require Import Bits Types ProgramModel VectorFastFrame NeonSupport neon_unit_goal.
From QcpVadd Require Import VaddBits.
From QcpNeon Require Import NeonBridge.
From QcpNeonLoop Require Import LoopMemory TailMemory InvariantFacts NeonLoopBridge.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac neon_frame :=
 unfold FMin.Types.UndefStructPredfloat32x4_t, QcpNeon.NeonBridge.UndefStructPredfloat32x4_t,
 FMin.Types.UndefStructPredfloat32x2_t, QcpNeon.NeonBridge.UndefStructPredfloat32x2_t;
 rewrite ?local_field_address;
 repeat progress rewrite <- logic_equiv_andp_assoc;
 first [apply _derivable1_andp_intros;
 [unfold derivable1,andp,coq_prop; intros; repeat first[assumption|split|reflexivity];lia
 |opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel].
Ltac neon_simple :=
 first [solve[intros;cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;
 unfold same_bits,fp32_bits_equal in *;subst;
 unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]
 |solve[pre_process;subst;try csimpl;entailer!]
 |solve[intros;unfold same_bits,fp32_bits_equal in *;subst;neon_frame]
 |solve[intros;try csimpl;entailer!]].
Ltac choose_initial_case :=
 first [solve [Exists 0;
    unfold FloatArray.full, store_array;
    cbn [store_array_rec]; entailer!;
    cbn [mm_arm_values List.firstn Z.to_nat store_array_rec]; try entailer!;
    subst; try reflexivity; try lia]
 | rewrite <- derivable1_orp_intros1; choose_initial_case
 | rewrite <- derivable1_orp_intros2; choose_initial_case].

Ltac choose_step_case k :=
 first [solve [Exists (k+4); entailer!; lia]
 | rewrite <- derivable1_orp_intros1; choose_step_case k
 | rewrite <- derivable1_orp_intros2; choose_step_case k].

Module CheckedNeonReturns.
Lemma proof_of_test_neon_return_wit_1 : FMin.neon_unit_goal.test_neon_return_wit_1.
Proof.
 unfold FMin.neon_unit_goal.test_neon_return_wit_1; left; intros.
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
 pose proof (float_prefix_append3 output_pre k (mm_arm_values k A B) (mm_arm (Znth 0 (fp32_slice k (batch_pre ÷ 4+3) A) __default_fp32) (Znth 0 (fp32_slice k (batch_pre ÷ 4+3) B) __default_fp32)) (mm_arm (Znth 1 (fp32_slice k (batch_pre ÷ 4+3) A) __default_fp32) (Znth 1 (fp32_slice k (batch_pre ÷ 4+3) B) __default_fp32)) (mm_arm (Znth 2 (fp32_slice k (batch_pre ÷ 4+3) A) __default_fp32) (Znth 2 (fp32_slice k (batch_pre ÷ 4+3) B) __default_fp32)) ltac:(lia)) as HO.
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in HO.
 repeat rewrite logic_equiv_sepcon_assoc in HO.
 replace (output_pre+k*4+0*4) with (output_pre+k*4) in * by lia.
 sep_apply HO.
 pose proof (mm_arm_tail_four k 3 A B __default_fp32 ltac:(lia) ltac:(lia) ltac:(lia) ltac:(lia)) as HM.
 rewrite PreH3, PreH4 in HM.
 replace (Z.to_nat 3) with 3%nat in HM by reflexivity. cbn [firstn] in HM.
 rewrite <- HM.
 rewrite Htot.
 replace (batch ÷ 4) with 3 by lia.
 replace (2+1) with 3 by lia. rewrite FloatArray.undef_seg_empty.
 entailer!.
Qed.
Lemma proof_of_test_neon_return_wit_2 : FMin.neon_unit_goal.test_neon_return_wit_2.
Proof.
 unfold FMin.neon_unit_goal.test_neon_return_wit_2; left; intros.
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
 pose proof (float_prefix_append1 output_pre k (mm_arm_values k A B) (mm_arm (Znth 0 (fp32_slice k (batch_pre ÷ 4+3) A) __default_fp32) (Znth 0 (fp32_slice k (batch_pre ÷ 4+3) B) __default_fp32)) ltac:(lia)) as HO.
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in HO.
 repeat rewrite logic_equiv_sepcon_assoc in HO.
 replace (output_pre+k*4+0*4) with (output_pre+k*4) in * by lia.
 sep_apply HO.
 pose proof (mm_arm_tail_four k 1 A B __default_fp32 ltac:(lia) ltac:(lia) ltac:(lia) ltac:(lia)) as HM.
 rewrite PreH3, PreH4 in HM.
 replace (Z.to_nat 1) with 1%nat in HM by reflexivity. cbn [firstn] in HM.
 rewrite <- HM.
 rewrite Htot.
 replace (batch ÷ 4) with 1 by lia.
 replace (2+1) with 3 by lia. rewrite FloatArray.undef_seg_empty.
 entailer!.
Qed.
Lemma proof_of_test_neon_return_wit_3 : FMin.neon_unit_goal.test_neon_return_wit_3.
Proof.
 unfold FMin.neon_unit_goal.test_neon_return_wit_3; left; intros.
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
 pose proof (float_prefix_append2 output_pre k (mm_arm_values k A B) (mm_arm (Znth 0 (fp32_slice k (batch_pre ÷ 4+3) A) __default_fp32) (Znth 0 (fp32_slice k (batch_pre ÷ 4+3) B) __default_fp32)) (mm_arm (Znth 1 (fp32_slice k (batch_pre ÷ 4+3) A) __default_fp32) (Znth 1 (fp32_slice k (batch_pre ÷ 4+3) B) __default_fp32)) ltac:(lia)) as HO.
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in HO.
 repeat rewrite logic_equiv_sepcon_assoc in HO.
 replace (output_pre+k*4+0*4) with (output_pre+k*4) in * by lia.
 sep_apply HO.
 pose proof (mm_arm_tail_four k 2 A B __default_fp32 ltac:(lia) ltac:(lia) ltac:(lia) ltac:(lia)) as HM.
 rewrite PreH3, PreH4 in HM.
 replace (Z.to_nat 2) with 2%nat in HM by reflexivity. cbn [firstn] in HM.
 rewrite <- HM.
 rewrite Htot.
 replace (batch ÷ 4) with 2 by lia.
 replace (2+1) with 3 by lia. rewrite FloatArray.undef_seg_empty.
 entailer!.
Qed.
Lemma proof_of_test_neon_return_wit_4 : FMin.neon_unit_goal.test_neon_return_wit_4.
Proof.
 unfold FMin.neon_unit_goal.test_neon_return_wit_4; left; intros.
 unfold fp32_length in *.
 subst batch input_a input_b output.
 assert (Htotal: batch_pre ÷ 4 = k).
 { replace batch_pre with (k*4) by lia. rewrite Z.quot_mul by lia. reflexivity. }
 rewrite Htotal in *.
 replace (0 ÷ 4) with 0 by reflexivity.
 replace (0+3) with 3 by reflexivity.
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *.
 pose proof (float_input_merge input_a_pre k (k+3) A ltac:(lia) ltac:(lia)) as HA.
 pose proof (float_input_merge input_b_pre k (k+3) B ltac:(lia) ltac:(lia)) as HB.
 replace (k+3-k) with 3 in HA,HB by lia.
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in HA,HB.
 sep_apply HA. sep_apply HB.
 unfold FloatArray.undef_full, store_undef_array.
 cbn [Z.to_nat store_undef_array_rec]. entailer!.
Qed.
End CheckedNeonReturns.
