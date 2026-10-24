From Coq Require Import ZArith Lia List.
From Qu8Rdsum Require Import neon_unit_goal NeonMemorySupportExtra.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque rd_partial rd_result_lane rd_column rd_acc32 rd_acc16.
Module CheckedNeonMemoryPart11.
Lemma proof_of_test_neon_entail_wit_36 : Qu8Rdsum.neon_unit_goal.test_neon_entail_wit_36.
Proof. unfold Qu8Rdsum.neon_unit_goal.test_neon_entail_wit_36.
left;intros.
rd_neon_memory_prepare.
sep_apply(UIntArray.full_split_to_missing_i output_pre (channels_pre-channels+rd_bit4 channels+rd_bit2 channels) channels_pre
 (rd_partial M input_pre rows_pre channels_pre input_stride_pre (channels_pre-channels+rd_bit4 channels+rd_bit2 channels) Init)0 ltac:(lia)).
unfold StoreUIntAsElement.storeA.
cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size].
replace (output_pre+(channels_pre-channels+rd_bit4 channels+rd_bit2 channels)*4) with output by lia.
rd_neon_memory_frame.
Qed.

End CheckedNeonMemoryPart11.

Print Assumptions CheckedNeonMemoryPart11.proof_of_test_neon_entail_wit_36.
