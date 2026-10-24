From Coq Require Import ZArith Lia List.
From F32F16 Require Import NeonKernelMemorySupport.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Module CheckedNeonKernelMemoryPart12.
Lemma proof_of_test_neon_entail_wit_7_2 : F32F16.neon_unit_goal.test_neon_entail_wit_7_2.
Proof. unfold F32F16.neon_unit_goal.test_neon_entail_wit_7_2.
f16_kernel_finish.
Qed.
Lemma proof_of_test_neon_return_wit_4 : F32F16.neon_unit_goal.test_neon_return_wit_4.
Proof. unfold F32F16.neon_unit_goal.test_neon_return_wit_4.
left; intros output_pre input_pre batch_pre A o input k batch PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9 PreH10 PreH11 PreH12 PreH13 PreH14 PreH15 PreH16 PreH17.
f16_memory_prepare.
 subst batch input o.
 assert (Htotal:batch_pre ÷ 4=k).
 { replace batch_pre with(k*4)by lia;rewrite Z.quot_mul by lia;reflexivity. }
 rewrite Htotal in *.
 replace (0 ÷ 4)with 0 by reflexivity.
 replace (0+3)with 3 by lia.
 pose proof (float_input_merge input_pre k (k+3) A ltac:(lia) ltac:(lia))as HA.
 replace (k+3-k)with 3 in HA by lia.
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in HA.
 sep_apply HA.
 unfold UShortArray.undef_full,store_undef_array.
 cbn [Z.to_nat store_undef_array_rec];entailer!.
Qed.
End CheckedNeonKernelMemoryPart12.
