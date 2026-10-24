From Coq Require Import ZArith Lia List.
From Qs8Rdsum Require Import neon_unit_goal NeonMemoryPartSupport.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque rd_partial rd_result_lane rd_column rd_acc32 rd_acc16.
Module CheckedNeonMemoryPart04.
Lemma proof_of_test_neon_entail_wit_16 : Qs8Rdsum.neon_unit_goal.test_neon_entail_wit_16.
Proof. unfold Qs8Rdsum.neon_unit_goal.test_neon_entail_wit_16.
left;intros output_pre zero_pre input_stride_pre input_pre channels_pre rows_pre Init M channels input_increment input output r PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9 PreH10 PreH11 PreH12 PreH13 PreH14 PreH15 PreH16 PreH17 PreH18 PreH19.
rd_neon_memory_prepare.
rewrite ?Z.mul_1_r in *.
prop_apply(rd_mem_addresses M);Intros_p HM.
pose proof(rd_neon_input_address_pure M input_pre rows_pre channels_pre input_stride_pre
 (channels_pre-channels) ltac:(assumption) ltac:(lia) ltac:(lia) HM)as Hstart.
pose proof(rd_neon_input_address_pure M input_pre rows_pre channels_pre input_stride_pre
 (channels_pre-channels+16) ltac:(assumption) ltac:(lia) ltac:(lia) HM)as Hend.
rewrite rd_neon_u64_step by lia.
replace(channels_pre-channels+12+4)with(channels_pre-(channels-16))by lia.
rd_neon_memory_frame.
Qed.

End CheckedNeonMemoryPart04.
