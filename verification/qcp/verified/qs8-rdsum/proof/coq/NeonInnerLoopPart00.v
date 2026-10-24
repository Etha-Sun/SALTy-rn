From Coq Require Import ZArith Lia List.
From Qs8Rdsum Require Import neon_unit_goal NeonInnerLoopPartSupport NeonMemoryPartSupport NeonLaneStep PointerCastsFacts.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque rd_partial rd_result_lane rd_column rd_acc32 rd_acc16 rd_read_lane rd_wadd16.
Module CheckedNeonInnerLoopPart00.
Lemma proof_of_test_neon_entail_wit_10 : Qs8Rdsum.neon_unit_goal.test_neon_entail_wit_10.
Proof. unfold Qs8Rdsum.neon_unit_goal.test_neon_entail_wit_10.
left;intros output_pre zero_pre input_stride_pre input_pre channels_pre rows_pre Init M channels input_increment input output r current_batch i0 i1 i2 i3 i4 i5 i6 PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9 PreH10 PreH11 PreH12 PreH13 PreH14 PreH15 PreH16 PreH17 PreH18 PreH19 PreH20 PreH21 PreH22 PreH23 PreH24 PreH25 PreH26 PreH27 PreH28 PreH29 PreH30 PreH31 PreH32.
rd_neon_memory_prepare.
rewrite ?Z.mul_1_r in *.
rd_inner_capture_addresses HA.
subst input;subst input_increment.
match goal with H:i0=_ |- _=>rewrite ?Z.add_0_r in H end.
subst i0 i1 i2 i3 i4 i5 i6.
pose proof(rd_selected_plain16_step M input_pre rows_pre channels_pre input_stride_pre
 (channels_pre-channels) r current_batch zero_pre 0 0
 HA ltac:(assumption) ltac:(assumption) ltac:(lia) ltac:(lia) ltac:(lia)
 ltac:(lia) ltac:(assumption) ltac:(assumption) ltac:(lia) ltac:(lia)
 ltac:(lia) ltac:(unfold rd_zero_size;lia))as HLane_0_0.
unfold rd_plain_chain16 in HLane_0_0.
rewrite HLane_0_0.
pose proof(rd_selected_plain16_step M input_pre rows_pre channels_pre input_stride_pre
 (channels_pre-channels) r current_batch zero_pre 0 1
 HA ltac:(assumption) ltac:(assumption) ltac:(lia) ltac:(lia) ltac:(lia)
 ltac:(lia) ltac:(assumption) ltac:(assumption) ltac:(lia) ltac:(lia)
 ltac:(lia) ltac:(unfold rd_zero_size;lia))as HLane_0_1.
unfold rd_plain_chain16 in HLane_0_1.
rewrite HLane_0_1.
pose proof(rd_selected_plain16_step M input_pre rows_pre channels_pre input_stride_pre
 (channels_pre-channels) r current_batch zero_pre 0 2
 HA ltac:(assumption) ltac:(assumption) ltac:(lia) ltac:(lia) ltac:(lia)
 ltac:(lia) ltac:(assumption) ltac:(assumption) ltac:(lia) ltac:(lia)
 ltac:(lia) ltac:(unfold rd_zero_size;lia))as HLane_0_2.
unfold rd_plain_chain16 in HLane_0_2.
rewrite HLane_0_2.
pose proof(rd_selected_plain16_step M input_pre rows_pre channels_pre input_stride_pre
 (channels_pre-channels) r current_batch zero_pre 0 3
 HA ltac:(assumption) ltac:(assumption) ltac:(lia) ltac:(lia) ltac:(lia)
 ltac:(lia) ltac:(assumption) ltac:(assumption) ltac:(lia) ltac:(lia)
 ltac:(lia) ltac:(unfold rd_zero_size;lia))as HLane_0_3.
unfold rd_plain_chain16 in HLane_0_3.
rewrite HLane_0_3.
pose proof(rd_selected_plain16_step M input_pre rows_pre channels_pre input_stride_pre
 (channels_pre-channels) r current_batch zero_pre 0 4
 HA ltac:(assumption) ltac:(assumption) ltac:(lia) ltac:(lia) ltac:(lia)
 ltac:(lia) ltac:(assumption) ltac:(assumption) ltac:(lia) ltac:(lia)
 ltac:(lia) ltac:(unfold rd_zero_size;lia))as HLane_0_4.
unfold rd_plain_chain16 in HLane_0_4.
rewrite HLane_0_4.
pose proof(rd_selected_plain16_step M input_pre rows_pre channels_pre input_stride_pre
 (channels_pre-channels) r current_batch zero_pre 0 5
 HA ltac:(assumption) ltac:(assumption) ltac:(lia) ltac:(lia) ltac:(lia)
 ltac:(lia) ltac:(assumption) ltac:(assumption) ltac:(lia) ltac:(lia)
 ltac:(lia) ltac:(unfold rd_zero_size;lia))as HLane_0_5.
unfold rd_plain_chain16 in HLane_0_5.
rewrite HLane_0_5.
pose proof(rd_selected_plain16_step M input_pre rows_pre channels_pre input_stride_pre
 (channels_pre-channels) r current_batch zero_pre 0 6
 HA ltac:(assumption) ltac:(assumption) ltac:(lia) ltac:(lia) ltac:(lia)
 ltac:(lia) ltac:(assumption) ltac:(assumption) ltac:(lia) ltac:(lia)
 ltac:(lia) ltac:(unfold rd_zero_size;lia))as HLane_0_6.
unfold rd_plain_chain16 in HLane_0_6.
rewrite HLane_0_6.
pose proof(rd_selected_plain16_step M input_pre rows_pre channels_pre input_stride_pre
 (channels_pre-channels) r current_batch zero_pre 0 7
 HA ltac:(assumption) ltac:(assumption) ltac:(lia) ltac:(lia) ltac:(lia)
 ltac:(lia) ltac:(assumption) ltac:(assumption) ltac:(lia) ltac:(lia)
 ltac:(lia) ltac:(unfold rd_zero_size;lia))as HLane_0_7.
unfold rd_plain_chain16 in HLane_0_7.
rewrite HLane_0_7.
pose proof(rd_selected_plain16_step M input_pre rows_pre channels_pre input_stride_pre
 (channels_pre-channels) r current_batch zero_pre 8 0
 HA ltac:(assumption) ltac:(assumption) ltac:(lia) ltac:(lia) ltac:(lia)
 ltac:(lia) ltac:(assumption) ltac:(assumption) ltac:(lia) ltac:(lia)
 ltac:(lia) ltac:(unfold rd_zero_size;lia))as HLane_8_0.
unfold rd_plain_chain16 in HLane_8_0.
rewrite HLane_8_0.
pose proof(rd_selected_plain16_step M input_pre rows_pre channels_pre input_stride_pre
 (channels_pre-channels) r current_batch zero_pre 8 1
 HA ltac:(assumption) ltac:(assumption) ltac:(lia) ltac:(lia) ltac:(lia)
 ltac:(lia) ltac:(assumption) ltac:(assumption) ltac:(lia) ltac:(lia)
 ltac:(lia) ltac:(unfold rd_zero_size;lia))as HLane_8_1.
unfold rd_plain_chain16 in HLane_8_1.
rewrite HLane_8_1.
pose proof(rd_selected_plain16_step M input_pre rows_pre channels_pre input_stride_pre
 (channels_pre-channels) r current_batch zero_pre 8 2
 HA ltac:(assumption) ltac:(assumption) ltac:(lia) ltac:(lia) ltac:(lia)
 ltac:(lia) ltac:(assumption) ltac:(assumption) ltac:(lia) ltac:(lia)
 ltac:(lia) ltac:(unfold rd_zero_size;lia))as HLane_8_2.
unfold rd_plain_chain16 in HLane_8_2.
rewrite HLane_8_2.
pose proof(rd_selected_plain16_step M input_pre rows_pre channels_pre input_stride_pre
 (channels_pre-channels) r current_batch zero_pre 8 3
 HA ltac:(assumption) ltac:(assumption) ltac:(lia) ltac:(lia) ltac:(lia)
 ltac:(lia) ltac:(assumption) ltac:(assumption) ltac:(lia) ltac:(lia)
 ltac:(lia) ltac:(unfold rd_zero_size;lia))as HLane_8_3.
unfold rd_plain_chain16 in HLane_8_3.
rewrite HLane_8_3.
pose proof(rd_selected_plain16_step M input_pre rows_pre channels_pre input_stride_pre
 (channels_pre-channels) r current_batch zero_pre 8 4
 HA ltac:(assumption) ltac:(assumption) ltac:(lia) ltac:(lia) ltac:(lia)
 ltac:(lia) ltac:(assumption) ltac:(assumption) ltac:(lia) ltac:(lia)
 ltac:(lia) ltac:(unfold rd_zero_size;lia))as HLane_8_4.
unfold rd_plain_chain16 in HLane_8_4.
rewrite HLane_8_4.
pose proof(rd_selected_plain16_step M input_pre rows_pre channels_pre input_stride_pre
 (channels_pre-channels) r current_batch zero_pre 8 5
 HA ltac:(assumption) ltac:(assumption) ltac:(lia) ltac:(lia) ltac:(lia)
 ltac:(lia) ltac:(assumption) ltac:(assumption) ltac:(lia) ltac:(lia)
 ltac:(lia) ltac:(unfold rd_zero_size;lia))as HLane_8_5.
unfold rd_plain_chain16 in HLane_8_5.
rewrite HLane_8_5.
pose proof(rd_selected_plain16_step M input_pre rows_pre channels_pre input_stride_pre
 (channels_pre-channels) r current_batch zero_pre 8 6
 HA ltac:(assumption) ltac:(assumption) ltac:(lia) ltac:(lia) ltac:(lia)
 ltac:(lia) ltac:(assumption) ltac:(assumption) ltac:(lia) ltac:(lia)
 ltac:(lia) ltac:(unfold rd_zero_size;lia))as HLane_8_6.
unfold rd_plain_chain16 in HLane_8_6.
rewrite HLane_8_6.
pose proof(rd_selected_plain16_step M input_pre rows_pre channels_pre input_stride_pre
 (channels_pre-channels) r current_batch zero_pre 8 7
 HA ltac:(assumption) ltac:(assumption) ltac:(lia) ltac:(lia) ltac:(lia)
 ltac:(lia) ltac:(assumption) ltac:(assumption) ltac:(lia) ltac:(lia)
 ltac:(lia) ltac:(unfold rd_zero_size;lia))as HLane_8_7.
unfold rd_plain_chain16 in HLane_8_7.
rewrite HLane_8_7.
rewrite ?Z.add_0_r in *.
pose proof(Z.quot_rem (rd_min252 r-current_batch)7 ltac:(lia))as Hquot.
assert(Hnext:Z.rem(rd_min252 r-(current_batch-7))7=0).
{ replace(rd_min252 r-(current_batch-7))with(((rd_min252 r-current_batch)÷7+1)*7)by lia.
  rewrite Z.rem_mul by lia;reflexivity. }
pose proof(rd_pointer_cast_group_step_flat_zero r current_batch input_pre
 (channels_pre-channels) rows_pre input_stride_pre ltac:(lia)ltac:(assumption))as HP0.
pose proof(rd_pointer_cast_group_step_flat r current_batch input_pre
 (channels_pre-channels) rows_pre input_stride_pre 1 zero_pre
 ltac:(lia)ltac:(assumption)ltac:(lia))as HP1.
pose proof(rd_pointer_cast_group_step_flat r current_batch input_pre
 (channels_pre-channels) rows_pre input_stride_pre 2 zero_pre
 ltac:(lia)ltac:(assumption)ltac:(lia))as HP2.
pose proof(rd_pointer_cast_group_step_flat r current_batch input_pre
 (channels_pre-channels) rows_pre input_stride_pre 3 zero_pre
 ltac:(lia)ltac:(assumption)ltac:(lia))as HP3.
pose proof(rd_pointer_cast_group_step_flat r current_batch input_pre
 (channels_pre-channels) rows_pre input_stride_pre 4 zero_pre
 ltac:(lia)ltac:(assumption)ltac:(lia))as HP4.
pose proof(rd_pointer_cast_group_step_flat r current_batch input_pre
 (channels_pre-channels) rows_pre input_stride_pre 5 zero_pre
 ltac:(lia)ltac:(assumption)ltac:(lia))as HP5.
pose proof(rd_pointer_cast_group_step_flat r current_batch input_pre
 (channels_pre-channels) rows_pre input_stride_pre 6 zero_pre
 ltac:(lia)ltac:(assumption)ltac:(lia))as HP6.
rd_neon_memory_frame.
Qed.
End CheckedNeonInnerLoopPart00.
