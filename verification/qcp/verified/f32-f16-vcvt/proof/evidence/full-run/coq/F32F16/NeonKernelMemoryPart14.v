From Coq Require Import ZArith Lia List.
From F32F16 Require Import NeonKernelMemorySupport.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Module CheckedNeonKernelMemoryPart14.
Lemma proof_of_test_neon_entail_wit_8_3 : F32F16.neon_unit_goal.test_neon_entail_wit_8_3.
Proof. unfold F32F16.neon_unit_goal.test_neon_entail_wit_8_3.
f16_kernel_finish.
Qed.
Lemma proof_of_test_neon_return_wit_1 : F32F16.neon_unit_goal.test_neon_return_wit_1.
Proof. unfold F32F16.neon_unit_goal.test_neon_return_wit_1.
left; intros output_pre input_pre batch_pre A o input k batch retval __default_fp32 PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9 PreH10 PreH11 PreH12 PreH13 PreH14 PreH15 PreH16 PreH17 PreH18 PreH19 PreH20 PreH21 PreH22 PreH23 PreH24.
f16_memory_prepare.
 pose proof (f16_byte_quot_total k batch batch_pre ltac:(lia) ltac:(lia) ltac:(lia)) as Htotal.
 assert (Hbatch:batch=12) by lia.
 replace (k*4+batch) with batch_pre in * by lia.
 subst batch input o.
 replace (12 ÷ 4) with 3 in * by reflexivity.
 assert (Htot:batch_pre ÷ 4=k+3) by (change (batch_pre ÷ 4=k+3) in Htotal;exact Htotal).
 assert (Hslice:(k*4+12) ÷ 4=batch_pre ÷ 4).
 { replace (k*4+12) with ((k+3)*4) by ring; rewrite Z.quot_mul by lia; lia. }
 rewrite Hslice.
 replace (output_pre+k*2+2*2) with (output_pre+k*2+4) by ring.
 pose proof (float_input_restore input_pre k (batch_pre ÷ 4+3) A __default_fp32
   ltac:(lia) ltac:(lia) ltac:(lia)) as HA.
 unfold float_cells4 in HA.
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in HA.
 replace (batch_pre ÷ 4+3-k) with (3+3) in HA by lia.
 repeat rewrite logic_equiv_sepcon_assoc in HA.
 sep_apply HA.
 rewrite UShortArray.undef_full_empty.
 unfold f16_pack1, f16_pack2.
 pose proof (f16_output_two_one output_pre k A __default_fp32 ltac:(lia) ltac:(lia)) as HO.
 cbn zeta in HO.
 replace (Zlength A) with (batch_pre ÷ 4+3) in HO by lia.
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size Z.to_nat firstn] in HO.
 replace (output_pre+2*k+4) with (output_pre+k*2+4) in HO by ring.
 replace (output_pre+2*k) with (output_pre+k*2) in HO by ring.
 unfold f16_pack1, f16_pack2 in HO.
 repeat rewrite logic_equiv_sepcon_assoc in HO.
 sep_apply HO.
 rewrite Htot.
 unfold UShortArray.undef_full,store_undef_array.
 cbn [Z.to_nat store_undef_array_rec]; entailer!.
Qed.
End CheckedNeonKernelMemoryPart14.
