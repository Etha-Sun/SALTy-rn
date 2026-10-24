From Coq Require Import ZArith Lia List.
From Qs8Add Require Import neon_unit_goal NeonKernelMemorySupport.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque qa_neon_lane qa_neon_mul qa_neon_mla qa_neon_shift qa_neon_add16 qa_s16 qa_sat16 qa_sat8 qa_min qa_max qa_ctrl qa_values qa_window.
Module CheckedNeonKernelMemoryPart01.
Lemma proof_of_test_neon_entail_wit_2_1 : Qs8Add.neon_unit_goal.test_neon_entail_wit_2_1.
Proof. unfold Qs8Add.neon_unit_goal.test_neon_entail_wit_2_1, Qs8Add.neon_unit_goal_chunk13.test_neon_entail_wit_2_1.
left;intros params_pre output_pre input_b_pre input_a_pre batch_pre Hi Lo Oz RawShift Mb Ma RawBias Bz Az B A PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9 PreH10 PreH11 PreH12 PreH13 PreH14 PreH15 PreH16 PreH17 PreH18 PreH19 PreH20 PreH21 PreH22 PreH23 PreH24 PreH25 PreH26 PreH27 PreH28 PreH29 PreH30 PreH31 PreH32 PreH33 PreH34 PreH35 PreH36 PreH37 PreH38.
qa_kernel_memory_prepare.
rewrite <- qa_control_decode_correct.
unfold qa_control_decode.
destruct (Z.ltb_spec 127 (-(Z.rem RawShift 256)));cbn zeta;
repeat match goal with |-context[Z.ltb ?x (-128)]=>destruct (Z.ltb_spec x (-128)) end;
try (exfalso;lia).
replace (batch_pre-batch_pre) with 0 by lia.
rewrite qa_values_zero,CharArray.full_empty.
rewrite ?Z.mul_0_l, ?Z.add_0_r.
remember (CharArray.full input_a_pre (batch_pre+7) A) as heapA eqn:HA;clear HA.
remember (CharArray.full input_b_pre (batch_pre+7) B) as heapB eqn:HB;clear HB.
remember (CharArray.undef_full output_pre batch_pre) as heapOut eqn:HO;clear HO.
rewrite qa_memory_true_emp.
qa_memory_clean_emp;qa_kernel_frame.
Qed.

Lemma proof_of_test_neon_entail_wit_6_5 : Qs8Add.neon_unit_goal.test_neon_entail_wit_6_5.
Proof. unfold Qs8Add.neon_unit_goal.test_neon_entail_wit_6_5, Qs8Add.neon_unit_goal_chunk13.test_neon_entail_wit_6_5.
right;intros params_pre output_pre input_b_pre input_a_pre batch_pre Hi Lo Oz RawShift Mb Ma RawBias Bz Az B A batch input_a_2 input_b_2 output right_shift PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9 PreH10 PreH11 PreH12 PreH13 PreH14 PreH15 PreH16 PreH17 PreH18 PreH19 PreH20 PreH21 PreH22 PreH23 PreH24 PreH25 PreH26 PreH27 PreH28 PreH29 PreH30 PreH31 PreH32 PreH33 PreH34 PreH35 PreH36 PreH37 PreH38 PreH39 PreH40 PreH41 PreH42 PreH43.
qa_kernel_memory_prepare.
repeat match goal with |-context[CharArray.undef_full ?p ?z]=>replace z with 0 by lia;rewrite CharArray.undef_full_empty end.
entailer!.
Qed.

Lemma proof_of_test_neon_entail_wit_8_7 : Qs8Add.neon_unit_goal.test_neon_entail_wit_8_7.
Proof. unfold Qs8Add.neon_unit_goal.test_neon_entail_wit_8_7, Qs8Add.neon_unit_goal_chunk06.test_neon_entail_wit_8_7.
right;intros params_pre output_pre input_b_pre input_a_pre batch_pre Hi Lo Oz RawShift Mb Ma RawBias Bz Az B A batch input_a_4 input_b_4 output_4 right_shift PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9 PreH10 PreH11 PreH12 PreH13 PreH14 PreH15 PreH16 PreH17 PreH18 PreH19 PreH20 PreH21 PreH22 PreH23 PreH24 PreH25 PreH26 PreH27 PreH28 PreH29 PreH30 PreH31 PreH32 PreH33 PreH34 PreH35 PreH36 PreH37 PreH38 PreH39 PreH40 PreH41 PreH42 PreH43 PreH44.
qa_kernel_memory_prepare.
repeat match goal with |-context[CharArray.undef_full ?p ?z]=>replace z with 0 by lia;rewrite CharArray.undef_full_empty end.
entailer!.
Qed.

Lemma proof_of_test_neon_entail_wit_11_2 : Qs8Add.neon_unit_goal.test_neon_entail_wit_11_2.
Proof. unfold Qs8Add.neon_unit_goal.test_neon_entail_wit_11_2, Qs8Add.neon_unit_goal_chunk15.test_neon_entail_wit_11_2.
right;intros params_pre output_pre input_b_pre input_a_pre batch_pre Hi Lo Oz RawShift Mb Ma RawBias Bz Az B A right_shift output input_b input_a batch PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9 PreH10 PreH11 PreH12 PreH13 PreH14 PreH15 PreH16 PreH17 PreH18 PreH19 PreH20 PreH21 PreH22 PreH23 PreH24 PreH25 PreH26 PreH27 PreH28 PreH29 PreH30 PreH31 PreH32 PreH33 PreH34 PreH35 PreH36 PreH37 PreH38 PreH39 PreH40 PreH41 PreH42 PreH43 PreH44 PreH45 PreH46 PreH47.
qa_kernel_memory_prepare.
assert (Hcase:batch=7) by lia;subst batch.
rewrite !qa_kernel_lane_expression.
fold (qa_at Az Bz Ma Mb RawShift Oz Lo Hi A B ((batch_pre-7)+0)).
fold (qa_at Az Bz Ma Mb RawShift Oz Lo Hi A B ((batch_pre-7)+1)).
fold (qa_at Az Bz Ma Mb RawShift Oz Lo Hi A B ((batch_pre-7)+2)).
fold (qa_at Az Bz Ma Mb RawShift Oz Lo Hi A B ((batch_pre-7)+3)).
fold (qa_at Az Bz Ma Mb RawShift Oz Lo Hi A B ((batch_pre-7)+4)).
fold (qa_at Az Bz Ma Mb RawShift Oz Lo Hi A B ((batch_pre-7)+5)).
fold (qa_at Az Bz Ma Mb RawShift Oz Lo Hi A B ((batch_pre-7)+6)).
fold (qa_at Az Bz Ma Mb RawShift Oz Lo Hi A B ((batch_pre-7)+7)).
replace output with (output_pre+(batch_pre-7)) by lia.
rewrite ?Z.mul_1_r in *.
pose proof (qa_kernel_output_4 output_pre (batch_pre-7) Az Bz Ma Mb RawShift Oz Lo Hi A B ltac:(lia) ltac:(lia) ltac:(lia)) as Hmerge0.
qa_memory_apply_pair Hmerge0.
replace ((batch_pre-7)+4) with ((batch_pre-7)+4) by lia.
replace (output_pre+(batch_pre-7)+4) with (output_pre+((batch_pre-7)+4)) by lia.
pose proof (qa_kernel_output_2 output_pre ((batch_pre-7)+4) Az Bz Ma Mb RawShift Oz Lo Hi A B ltac:(lia) ltac:(lia) ltac:(lia)) as Hmerge4.
replace (((batch_pre-7)+4)+0) with ((batch_pre-7)+4) in Hmerge4 by lia.
replace (((batch_pre-7)+4)+1) with ((batch_pre-7)+5) in Hmerge4 by lia.
qa_memory_apply_pair Hmerge4.
replace (((batch_pre-7)+4)+2) with ((batch_pre-7)+6) by lia.
replace (output_pre+(batch_pre-7)+6) with (output_pre+((batch_pre-7)+6)) by lia.
replace (output_pre+(batch_pre-7)+(4+2)) with (output_pre+((batch_pre-7)+6)) by lia.
pose proof (qa_kernel_output_1 output_pre ((batch_pre-7)+6) Az Bz Ma Mb RawShift Oz Lo Hi A B ltac:(lia) ltac:(lia) ltac:(lia)) as Hmerge6.
replace (((batch_pre-7)+6)+0) with ((batch_pre-7)+6) in Hmerge6 by lia.
qa_memory_apply_pair Hmerge6.
replace (((batch_pre-7)+6)+1) with ((batch_pre-7)+7) by lia.
replace ((batch_pre-7)+7) with batch_pre by lia.
rewrite ?Z.sub_0_r.
repeat match goal with |-context[CharArray.undef_full ?p ?z]=>replace z with 0 by lia;rewrite CharArray.undef_full_empty end.
qa_memory_clean_emp;qa_kernel_frame.
Qed.

Lemma proof_of_test_neon_entail_wit_12_11 : Qs8Add.neon_unit_goal.test_neon_entail_wit_12_11.
Proof. unfold Qs8Add.neon_unit_goal.test_neon_entail_wit_12_11, Qs8Add.neon_unit_goal_chunk15.test_neon_entail_wit_12_11.
right;intros params_pre output_pre input_b_pre input_a_pre batch_pre Hi Lo Oz RawShift Mb Ma RawBias Bz Az B A batch input_a input_b output right_shift PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9 PreH10 PreH11 PreH12 PreH13 PreH14 PreH15 PreH16 PreH17 PreH18 PreH19 PreH20 PreH21 PreH22 PreH23 PreH24 PreH25 PreH26 PreH27 PreH28 PreH29 PreH30 PreH31 PreH32 PreH33 PreH34 PreH35 PreH36 PreH37 PreH38 PreH39 PreH40 PreH41 PreH42 PreH43 PreH44 PreH45.
qa_kernel_memory_prepare.
assert (Hcase:batch=5) by lia;subst batch.
rewrite !qa_kernel_lane_expression.
fold (qa_at Az Bz Ma Mb RawShift Oz Lo Hi A B ((batch_pre-5)+0)).
fold (qa_at Az Bz Ma Mb RawShift Oz Lo Hi A B ((batch_pre-5)+1)).
fold (qa_at Az Bz Ma Mb RawShift Oz Lo Hi A B ((batch_pre-5)+2)).
fold (qa_at Az Bz Ma Mb RawShift Oz Lo Hi A B ((batch_pre-5)+3)).
fold (qa_at Az Bz Ma Mb RawShift Oz Lo Hi A B ((batch_pre-5)+4)).
fold (qa_at Az Bz Ma Mb RawShift Oz Lo Hi A B ((batch_pre-5)+5)).
fold (qa_at Az Bz Ma Mb RawShift Oz Lo Hi A B ((batch_pre-5)+6)).
fold (qa_at Az Bz Ma Mb RawShift Oz Lo Hi A B ((batch_pre-5)+7)).
replace output with (output_pre+(batch_pre-5)) by lia.
rewrite ?Z.mul_1_r in *.
pose proof (qa_kernel_output_4 output_pre (batch_pre-5) Az Bz Ma Mb RawShift Oz Lo Hi A B ltac:(lia) ltac:(lia) ltac:(lia)) as Hmerge0.
qa_memory_apply_pair Hmerge0.
replace ((batch_pre-5)+4) with ((batch_pre-5)+4) by lia.
replace (output_pre+(batch_pre-5)+4) with (output_pre+((batch_pre-5)+4)) by lia.
pose proof (qa_kernel_output_1 output_pre ((batch_pre-5)+4) Az Bz Ma Mb RawShift Oz Lo Hi A B ltac:(lia) ltac:(lia) ltac:(lia)) as Hmerge4.
replace (((batch_pre-5)+4)+0) with ((batch_pre-5)+4) in Hmerge4 by lia.
qa_memory_apply_pair Hmerge4.
replace (((batch_pre-5)+4)+1) with ((batch_pre-5)+5) by lia.
replace ((batch_pre-5)+5) with batch_pre by lia.
rewrite ?Z.sub_0_r.
repeat match goal with |-context[CharArray.undef_full ?p ?z]=>replace z with 0 by lia;rewrite CharArray.undef_full_empty end.
qa_memory_clean_emp;qa_kernel_frame.
Qed.

Lemma proof_of_test_neon_entail_wit_14_5 : Qs8Add.neon_unit_goal.test_neon_entail_wit_14_5.
Proof. unfold Qs8Add.neon_unit_goal.test_neon_entail_wit_14_5, Qs8Add.neon_unit_goal_chunk11.test_neon_entail_wit_14_5.
intros params_pre output_pre input_b_pre input_a_pre batch_pre Hi Lo Oz RawShift Mb Ma RawBias Bz Az B A right_shift output input_b_5 input_a_5 batch PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9 PreH10 PreH11 PreH12 PreH13 PreH14 PreH15 PreH16 PreH17 PreH18 PreH19 PreH20 PreH21 PreH22 PreH23 PreH24 PreH25 PreH26 PreH27 PreH28 PreH29 PreH30 PreH31 PreH32 PreH33 PreH34 PreH35 PreH36 PreH37 PreH38 PreH39 PreH40 PreH41 PreH42 PreH43 PreH44 PreH45.
qa_kernel_memory_frame.
Qed.

Lemma proof_of_test_neon_entail_wit_16_7 : Qs8Add.neon_unit_goal.test_neon_entail_wit_16_7.
Proof. unfold Qs8Add.neon_unit_goal.test_neon_entail_wit_16_7, Qs8Add.neon_unit_goal_chunk02.test_neon_entail_wit_16_7.
intros params_pre output_pre input_b_pre input_a_pre batch_pre Hi Lo Oz RawShift Mb Ma RawBias Bz Az B A right_shift output_5 input_b_5 input_a_5 batch PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9 PreH10 PreH11 PreH12 PreH13 PreH14 PreH15 PreH16 PreH17 PreH18 PreH19 PreH20 PreH21 PreH22 PreH23 PreH24 PreH25 PreH26 PreH27 PreH28 PreH29 PreH30 PreH31 PreH32 PreH33 PreH34 PreH35 PreH36 PreH37 PreH38 PreH39 PreH40 PreH41 PreH42 PreH43 PreH44 PreH45 PreH46.
qa_kernel_memory_frame.
Qed.

Lemma proof_of_test_neon_return_wit_2 : Qs8Add.neon_unit_goal.test_neon_return_wit_2.
Proof. unfold Qs8Add.neon_unit_goal.test_neon_return_wit_2, Qs8Add.neon_unit_goal_chunk10.test_neon_return_wit_2.
right;intros params_pre output_pre input_b_pre input_a_pre batch_pre Hi Lo Oz RawShift Mb Ma RawBias Bz Az B A output input_b input_a right_shift batch PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9 PreH10 PreH11 PreH12 PreH13 PreH14 PreH15 PreH16 PreH17 PreH18 PreH19 PreH20 PreH21 PreH22 PreH23 PreH24 PreH25 PreH26 PreH27 PreH28 PreH29 PreH30 PreH31 PreH32 PreH33 PreH34 PreH35.
qa_kernel_memory_prepare.
assert (Hz:batch=0) by lia;subst batch.
rewrite Z.sub_0_r,CharArray.undef_full_empty.
asrt_simpl;qa_kernel_frame.
Qed.

End CheckedNeonKernelMemoryPart01.
