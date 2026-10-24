From Coq Require Import ZArith Lia List.
From F32F16 Require Import NeonKernelMemorySupport.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Module CheckedNeonKernelMemoryPart01.
Lemma proof_of_test_neon_entail_wit_4 : F32F16.neon_unit_goal.test_neon_entail_wit_4.
Proof. unfold F32F16.neon_unit_goal.test_neon_entail_wit_4.
intros output_pre input_pre batch_pre A o input k_2 batch __default_fp32 PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9 PreH10 PreH11 PreH12 PreH13 PreH14 PreH15 PreH16 PreH17.
f16_memory_prepare.
 f16_opaque_stack_frames.
 pose proof (Z.quot_rem batch 4 ltac:(lia)) as Hqr.
 pose proof (f16_byte_quot_total k_2 batch batch_pre ltac:(lia) ltac:(lia) ltac:(lia)) as Htot.
 pose proof (f16_byte_quot_sub batch 4 ltac:(lia) ltac:(lia)) as [Hnewq Hnewrem].
 prop_apply (float_address_nonnegative (input+0*4)
   (Znth 0 (fp32_slice k_2 (batch_pre ÷ 4+3) A) __default_fp32)). Intros_p HAaddr.
 match goal with |- ?P |-- ?Q => multimatch P with context[UShortArray.full ?p 4 ?payload] =>
 prop_apply (f16_ushort_full_nonnegative p 4 payload ltac:(lia)); Intros_p HOaddr
 end end.
 subst input o.
 pose proof (float_input_step_four input_pre k_2 (batch_pre ÷ 4+3) A __default_fp32
   ltac:(lia) ltac:(lia) ltac:(lia)) as HA.
 cbn zeta in HA.
 unfold float_cells4 in HA.
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in HA.
 replace (batch_pre ÷ 4+3-k_2) with (batch ÷ 4+3) in HA by lia.
 repeat rewrite logic_equiv_sepcon_assoc in HA.
 repeat rewrite ?Z.add_0_r in *.
 replace (4+4) with 8 in * by reflexivity.
 replace (4*4) with 16 in * by reflexivity.
 replace (4*2) with 8 in * by reflexivity.
 replace (2*4) with 8 in * by reflexivity.
 replace (2*8) with 16 in * by reflexivity.
 replace (8*2) with 16 in * by reflexivity.
 sep_apply HA.
 pose proof (f16_output_four output_pre k_2 A __default_fp32 ltac:(lia) ltac:(lia)) as HO.
 cbn zeta in HO.
 replace (Zlength A) with (batch_pre ÷ 4+3) in HO by lia.
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in HO.
 repeat rewrite logic_equiv_sepcon_assoc in HO.
 sep_apply HO.
 rewrite Hnewq.
 replace (batch_pre ÷ 4+3-(k_2+4)) with (batch ÷ 4-4+3) by lia.
 replace (input_pre+(k_2+4)*4) with (input_pre+k_2*4+16) by lia.
 replace (output_pre+(k_2+4)*2) with (output_pre+k_2*2+8) by lia.
 repeat rewrite ?Z.add_0_r in *.
 replace (4+4) with 8 in * by reflexivity.
 replace (4*4) with 16 in * by reflexivity.
 replace (4*2) with 8 in * by reflexivity.
 replace (2*4) with 8 in * by reflexivity.
 replace (2*8) with 16 in * by reflexivity.
 replace (8*2) with 16 in * by reflexivity.
 pose proof (f16_byte_tail_cases8 (batch-16) ltac:(lia) Hnewrem) as Hcases.
 destruct Hcases as [H0|[H4|[H8|[H12|[H16|[H20|[H24|[H28|Hbig]]]]]]]];try lia.
 all: f16_choose_step_case (k_2+4).
Qed.
End CheckedNeonKernelMemoryPart01.
