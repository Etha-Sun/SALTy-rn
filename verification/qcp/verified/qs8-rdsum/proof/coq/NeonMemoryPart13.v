From Coq Require Import ZArith Lia List.
From Qs8Rdsum Require Import neon_unit_goal NeonMemoryPartSupport.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque rd_partial rd_result_lane rd_column rd_acc32 rd_acc16.
Module CheckedNeonMemoryPart13.
Lemma proof_of_test_neon_entail_wit_33_2 : Qs8Rdsum.neon_unit_goal.test_neon_entail_wit_33_2.
Proof. unfold Qs8Rdsum.neon_unit_goal.test_neon_entail_wit_33_2.
left;intros output_pre zero_pre input_stride_pre input_pre channels_pre rows_pre Init M channels input_increment input output r num_batches retval PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9 PreH10 PreH11 PreH12 PreH13 PreH14 PreH15 PreH16 PreH17 PreH18 PreH19 PreH20 PreH21 PreH22 PreH23 PreH24 PreH25 PreH26 PreH27 PreH28 PreH29 PreH30 PreH31 PreH32 PreH33.
rd_neon_memory_prepare.
subst retval.
rewrite rd_neon_unsigned_sum.
unfold rd_tail_lane;rewrite Z.add_0_l.
rewrite (Z.mod_small (rd_bit2 channels) 4) by lia.
rewrite rd_neon_modular_final_lane by lia.
replace output with (output_pre+(channels_pre-channels+rd_bit4 channels+rd_bit2 channels)*sizeof(INT)) by(cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;lia).
fold (StoreIntAsElement.storeA output_pre (channels_pre-channels+rd_bit4 channels+rd_bit2 channels) (rd_result_lane M input_pre rows_pre input_stride_pre (channels_pre-channels+rd_bit4 channels+rd_bit2 channels) Init)).
pose proof (IntArray.missing_i_merge_to_full output_pre (channels_pre-channels+rd_bit4 channels+rd_bit2 channels) channels_pre
 (rd_result_lane M input_pre rows_pre input_stride_pre (channels_pre-channels+rd_bit4 channels+rd_bit2 channels) Init)
 (rd_partial M input_pre rows_pre channels_pre input_stride_pre (channels_pre-channels+rd_bit4 channels+rd_bit2 channels) Init)ltac:(lia))as HH.
fold StoreIntAsElement.storeA in HH.
rd_neon_apply_pair HH.
rewrite rd_partial_store_step by lia.
replace ((channels_pre-channels+rd_bit4 channels+rd_bit2 channels)+1) with (channels_pre-0) by lia.
unfold rd_ptr_gate.
rd_neon_clean_emp;rd_neon_memory_frame.
Qed.

End CheckedNeonMemoryPart13.
