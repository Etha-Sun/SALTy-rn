From Coq Require Import ZArith Lia List.
From AUXLib Require Import ListLib.
Import ListNotations.
From FMax Require Import Bits Types ProgramModel VectorFastFrame NeonSupport neon_unit_goal.
From QcpVadd Require Import VaddBits.
From QcpNeon Require Import NeonBridge.
From QcpNeonLoop Require Import LoopMemory TailMemory InvariantFacts NeonLoopBridge.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac neon_frame :=
 unfold FMax.Types.UndefStructPredfloat32x4_t, QcpNeon.NeonBridge.UndefStructPredfloat32x4_t,
 FMax.Types.UndefStructPredfloat32x2_t, QcpNeon.NeonBridge.UndefStructPredfloat32x2_t;
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

Module CheckedNeonLoop.
Lemma proof_of_test_neon_entail_wit_1 : FMax.neon_unit_goal.test_neon_entail_wit_1.
Proof.
 unfold FMax.neon_unit_goal.test_neon_entail_wit_1; intros.
 prop_apply (FloatArray.full_Zlength input_a_pre (batch_pre ÷ 4 + 3) A). Intros_p HA.
 prop_apply (FloatArray.full_Zlength input_b_pre (batch_pre ÷ 4 + 3) B). Intros_p HB.
 unfold fp32_length.
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *.
 pose proof (Z.quot_rem batch_pre 4 ltac:(lia)) as Hqr.
 pose proof (byte_batch_tail_cases batch_pre ltac:(lia) PreH8) as Hcases.
 destruct Hcases as [H0|[H4|[H8|[H12|Hbig]]]]; try lia.
 all: sep_apply (float_initial_split input_a_pre (batch_pre ÷ 4 + 3) A).
 all: sep_apply (float_initial_split input_b_pre (batch_pre ÷ 4 + 3) B).
 all: choose_initial_case.
Qed.
Lemma proof_of_test_neon_entail_wit_2 : FMax.neon_unit_goal.test_neon_entail_wit_2.
Proof.
 unfold FMax.neon_unit_goal.test_neon_entail_wit_2; intros.
 unfold fp32_length in *.
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *.
 pose proof (Z.quot_rem batch 4 ltac:(lia)) as Hqr.
 assert (Htot: batch_pre ÷ 4 = k_2 + batch ÷ 4).
 { replace batch_pre with ((k_2 + batch ÷ 4)*4) by lia.
   rewrite Z.quot_mul by lia. reflexivity. }
 assert (Hnewq: (batch-16) ÷ 4 = batch ÷ 4-4).
 { replace (batch-16) with ((batch ÷ 4-4)*4) by lia.
   rewrite Z.quot_mul by lia. reflexivity. }
 assert (Hnewrem: (batch-16) % 4 = 0).
 { replace (batch-16) with ((batch ÷ 4-4)*4) by lia.
   rewrite Z.rem_mul by lia. reflexivity. }
 prop_apply (float_address_nonnegative (input_a+0*4)
   (Znth 0 (fp32_slice k_2 (batch_pre ÷ 4+3) A) __default_fp32)). Intros_p HAaddr.
 prop_apply (float_address_nonnegative (input_b+0*4)
   (Znth 0 (fp32_slice k_2 (batch_pre ÷ 4+3) B) __default_fp32)). Intros_p HBaddr.
 prop_apply (float_address_nonnegative (output+0*4)
   (mm_arm (Znth 0 (fp32_slice k_2 (batch_pre ÷ 4+3) A) __default_fp32)
             (Znth 0 (fp32_slice k_2 (batch_pre ÷ 4+3) B) __default_fp32))). Intros_p HOaddr.
 subst input_a input_b output.
 pose proof (float_input_step_four input_a_pre k_2 (batch_pre ÷ 4+3) A __default_fp32
   ltac:(lia) ltac:(lia) ltac:(lia)) as HstepA.
 pose proof (float_input_step_four input_b_pre k_2 (batch_pre ÷ 4+3) B __default_fp32
   ltac:(lia) ltac:(lia) ltac:(lia)) as HstepB.
 pose proof (float_output_step_four output_pre k_2 (batch_pre ÷ 4) (batch_pre ÷ 4+3) A B __default_fp32
   ltac:(lia) ltac:(lia) ltac:(lia) ltac:(lia) ltac:(lia)) as HstepO.
 unfold float_cells4 in HstepA,HstepB,HstepO.
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in HstepA,HstepB,HstepO.
 replace (batch_pre ÷ 4+3-k_2) with (batch ÷ 4+3) in HstepA,HstepB by lia.
 replace (batch_pre ÷ 4-k_2) with (batch ÷ 4) in HstepO by lia.
 repeat rewrite logic_equiv_sepcon_assoc in HstepA, HstepB, HstepO.
 sep_apply HstepA. sep_apply HstepB. sep_apply HstepO.
 replace (4*4) with 16 by lia.
 rewrite Hnewq.
 replace (batch_pre ÷ 4+3-(k_2+4)) with (batch ÷ 4-4+3) by lia.
 replace (batch_pre ÷ 4-(k_2+4)) with (batch ÷ 4-4) by lia.
 replace (input_a_pre+(k_2+4)*4) with (input_a_pre+k_2*4+16) by lia.
 replace (input_b_pre+(k_2+4)*4) with (input_b_pre+k_2*4+16) by lia.
 replace (output_pre+(k_2+4)*4) with (output_pre+k_2*4+16) by lia.
 pose proof (byte_batch_tail_cases (batch-16) ltac:(lia) Hnewrem) as Hcases.
 destruct Hcases as [H0|[H4|[H8|[H12|Hbig]]]].
 all: choose_step_case k_2.
Qed.
End CheckedNeonLoop.
