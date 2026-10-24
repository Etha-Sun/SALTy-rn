From Coq Require Import ZArith Lia List.
From F32F16 Require Import NeonKernelMemorySupport.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Module CheckedNeonKernelMemoryPart03.
Lemma proof_of_test_neon_entail_wit_1 : F32F16.neon_unit_goal.test_neon_entail_wit_1.
Proof. unfold F32F16.neon_unit_goal.test_neon_entail_wit_1.
intros output_pre input_pre batch_pre A PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9.
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *.
 rewrite ?f16_scale_hi_decimal, ?f16_scale_lo_decimal in *.
 f16_opaque_stack_frames.
 prop_apply (FloatArray.full_Zlength input_pre (batch_pre ÷ 4+3) A). Intros_p HA.
 unfold fp32_length in *.
 pose proof (Z.quot_rem batch_pre 4 ltac:(lia)) as Hqr.
 sep_apply (float_initial_split input_pre (batch_pre ÷ 4+3) A).
 destruct (Z_le_dec 32 batch_pre) as [Hbig|Hsmall].
 - rewrite <- derivable1_orp_intros1.
   Exists 0.
   cbn [f16_values firstn Z.to_nat].
   rewrite UShortArray.full_empty.
   cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size].
   f16_opaque_data_arrays; asrt_simpl; f16_memory_finish_frame.
 - rewrite <- derivable1_orp_intros2.
   Exists 0.
   cbn [f16_values firstn Z.to_nat].
   rewrite UShortArray.full_empty.
   cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size].
   f16_opaque_data_arrays; asrt_simpl; f16_memory_finish_frame.
Qed.
End CheckedNeonKernelMemoryPart03.
