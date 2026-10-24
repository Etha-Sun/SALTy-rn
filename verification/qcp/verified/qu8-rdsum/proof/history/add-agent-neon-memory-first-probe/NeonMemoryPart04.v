From Coq Require Import ZArith Lia List.
From Qu8Rdsum Require Import neon_unit_goal NeonMemorySupportExtra.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque rd_partial rd_result_lane rd_column rd_acc32 rd_acc16.
Module CheckedNeonMemoryPart04.
Lemma proof_of_test_neon_entail_wit_16 : Qu8Rdsum.neon_unit_goal.test_neon_entail_wit_16.
Proof. unfold Qu8Rdsum.neon_unit_goal.test_neon_entail_wit_16.
left;intros.
rd_neon_memory_prepare.
rewrite ?Z.mul_1_r in *.
prop_apply(rd_mem_addresses M);Intros_p HM.
pose proof(rd_neon_input_address_pure M input_pre rows_pre channels_pre input_stride_pre
 (channels_pre-channels) ltac:(assumption) ltac:(lia) ltac:(lia) HM)as Hstart.
pose proof(rd_neon_input_address_pure M input_pre rows_pre channels_pre input_stride_pre
 (channels_pre-channels+32) ltac:(assumption) ltac:(lia) ltac:(lia) HM)as Hend.
rewrite rd_neon_u64_step by lia.
replace(channels_pre-channels+28+4)with(channels_pre-(channels-32))by lia.
rd_neon_memory_frame.
Qed.

End CheckedNeonMemoryPart04.

Print Assumptions CheckedNeonMemoryPart04.proof_of_test_neon_entail_wit_16.
