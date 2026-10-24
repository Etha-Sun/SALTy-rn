From Coq Require Import ZArith Lia List.
From Qs8Add Require Import neon_unit_goal NeonKernelMemorySupport.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque qa_neon_lane qa_neon_mul qa_neon_mla qa_neon_shift qa_neon_add16 qa_s16 qa_sat16 qa_sat8 qa_min qa_max qa_ctrl qa_values qa_window.
Module CheckedNeonKernelMemoryPart05.
Lemma proof_of_test_neon_entail_wit_4 : Qs8Add.neon_unit_goal.test_neon_entail_wit_4.
Proof. unfold Qs8Add.neon_unit_goal.test_neon_entail_wit_4, Qs8Add.neon_unit_goal_chunk13.test_neon_entail_wit_4.
intros params_pre output_pre input_b_pre input_a_pre batch_pre Hi Lo Oz RawShift Mb Ma RawBias Bz Az B A right_shift output input_b input_a batch PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9 PreH10 PreH11 PreH12 PreH13 PreH14 PreH15 PreH16 PreH17 PreH18 PreH19 PreH20 PreH21 PreH22 PreH23 PreH24 PreH25 PreH26 PreH27 PreH28 PreH29 PreH30 PreH31 PreH32 PreH33 PreH34 PreH35 PreH36 PreH37 PreH38.
qa_kernel_memory_prepare.
opaque_leaves.
assert (Hcases: batch=1 \/ batch=2 \/ batch=3 \/ batch=4 \/ batch=5 \/ batch=6 \/ batch=7 \/ batch=8 \/ batch=9 \/ batch=10 \/ batch=11 \/ batch=12 \/ batch=13 \/ batch=14 \/ batch=15) by lia.
destruct Hcases as [Hcase|[Hcase|[Hcase|[Hcase|[Hcase|[Hcase|[Hcase|[Hcase|[Hcase|[Hcase|[Hcase|[Hcase|[Hcase|[Hcase|Hcase]]]]]]]]]]]]]];subst batch.
 - do 14 rewrite <-derivable1_orp_intros1. cbn [Z.land]. qa_kernel_frame.
 - do 13 rewrite <-derivable1_orp_intros1. rewrite <-derivable1_orp_intros2. cbn [Z.land]. qa_kernel_frame.
 - do 12 rewrite <-derivable1_orp_intros1. rewrite <-derivable1_orp_intros2. cbn [Z.land]. qa_kernel_frame.
 - do 11 rewrite <-derivable1_orp_intros1. rewrite <-derivable1_orp_intros2. cbn [Z.land]. qa_kernel_frame.
 - do 10 rewrite <-derivable1_orp_intros1. rewrite <-derivable1_orp_intros2. cbn [Z.land]. qa_kernel_frame.
 - do 9 rewrite <-derivable1_orp_intros1. rewrite <-derivable1_orp_intros2. cbn [Z.land]. qa_kernel_frame.
 - do 8 rewrite <-derivable1_orp_intros1. rewrite <-derivable1_orp_intros2. cbn [Z.land]. qa_kernel_frame.
 - do 7 rewrite <-derivable1_orp_intros1. rewrite <-derivable1_orp_intros2. cbn [Z.land]. qa_kernel_frame.
 - do 6 rewrite <-derivable1_orp_intros1. rewrite <-derivable1_orp_intros2. cbn [Z.land]. qa_kernel_frame.
 - do 5 rewrite <-derivable1_orp_intros1. rewrite <-derivable1_orp_intros2. cbn [Z.land]. qa_kernel_frame.
 - do 4 rewrite <-derivable1_orp_intros1. rewrite <-derivable1_orp_intros2. cbn [Z.land]. qa_kernel_frame.
 - do 3 rewrite <-derivable1_orp_intros1. rewrite <-derivable1_orp_intros2. cbn [Z.land]. qa_kernel_frame.
 - do 2 rewrite <-derivable1_orp_intros1. rewrite <-derivable1_orp_intros2. cbn [Z.land]. qa_kernel_frame.
 - do 1 rewrite <-derivable1_orp_intros1. rewrite <-derivable1_orp_intros2. cbn [Z.land]. qa_kernel_frame.
 - rewrite <-derivable1_orp_intros2. cbn [Z.land]. qa_kernel_frame.

Qed.

Lemma proof_of_test_neon_entail_wit_7_2 : Qs8Add.neon_unit_goal.test_neon_entail_wit_7_2.
Proof. unfold Qs8Add.neon_unit_goal.test_neon_entail_wit_7_2, Qs8Add.neon_unit_goal_chunk04.test_neon_entail_wit_7_2.
intros params_pre output_pre input_b_pre input_a_pre batch_pre Hi Lo Oz RawShift Mb Ma RawBias Bz Az B A batch input_a_4 input_b_4 output_4 right_shift PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9 PreH10 PreH11 PreH12 PreH13 PreH14 PreH15 PreH16 PreH17 PreH18 PreH19 PreH20 PreH21 PreH22 PreH23 PreH24 PreH25 PreH26 PreH27 PreH28 PreH29 PreH30 PreH31 PreH32 PreH33 PreH34 PreH35 PreH36 PreH37 PreH38 PreH39 PreH40 PreH41 PreH42 PreH43 PreH44.
qa_kernel_memory_frame.
Qed.

Lemma proof_of_test_neon_entail_wit_9_4 : Qs8Add.neon_unit_goal.test_neon_entail_wit_9_4.
Proof. unfold Qs8Add.neon_unit_goal.test_neon_entail_wit_9_4, Qs8Add.neon_unit_goal_chunk13.test_neon_entail_wit_9_4.
intros params_pre output_pre input_b_pre input_a_pre batch_pre Hi Lo Oz RawShift Mb Ma RawBias Bz Az B A batch input_a_4 input_b_4 output_4 right_shift PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9 PreH10 PreH11 PreH12 PreH13 PreH14 PreH15 PreH16 PreH17 PreH18 PreH19 PreH20 PreH21 PreH22 PreH23 PreH24 PreH25 PreH26 PreH27 PreH28 PreH29 PreH30 PreH31 PreH32 PreH33 PreH34 PreH35 PreH36 PreH37 PreH38 PreH39 PreH40 PreH41 PreH42 PreH43 PreH44 PreH45.
qa_kernel_memory_frame.
Qed.

Lemma proof_of_test_neon_entail_wit_11_6 : Qs8Add.neon_unit_goal.test_neon_entail_wit_11_6.
Proof. unfold Qs8Add.neon_unit_goal.test_neon_entail_wit_11_6, Qs8Add.neon_unit_goal_chunk07.test_neon_entail_wit_11_6.
right;intros params_pre output_pre input_b_pre input_a_pre batch_pre Hi Lo Oz RawShift Mb Ma RawBias Bz Az B A right_shift output input_b input_a batch PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9 PreH10 PreH11 PreH12 PreH13 PreH14 PreH15 PreH16 PreH17 PreH18 PreH19 PreH20 PreH21 PreH22 PreH23 PreH24 PreH25 PreH26 PreH27 PreH28 PreH29 PreH30 PreH31 PreH32 PreH33 PreH34 PreH35 PreH36 PreH37 PreH38 PreH39 PreH40 PreH41 PreH42 PreH43 PreH44 PreH45 PreH46 PreH47.
qa_kernel_memory_prepare.
assert (Hcase:batch=6) by lia;subst batch.
rewrite !qa_kernel_lane_expression.
fold (qa_at Az Bz Ma Mb RawShift Oz Lo Hi A B ((batch_pre-6)+0)).
fold (qa_at Az Bz Ma Mb RawShift Oz Lo Hi A B ((batch_pre-6)+1)).
fold (qa_at Az Bz Ma Mb RawShift Oz Lo Hi A B ((batch_pre-6)+2)).
fold (qa_at Az Bz Ma Mb RawShift Oz Lo Hi A B ((batch_pre-6)+3)).
fold (qa_at Az Bz Ma Mb RawShift Oz Lo Hi A B ((batch_pre-6)+4)).
fold (qa_at Az Bz Ma Mb RawShift Oz Lo Hi A B ((batch_pre-6)+5)).
fold (qa_at Az Bz Ma Mb RawShift Oz Lo Hi A B ((batch_pre-6)+6)).
fold (qa_at Az Bz Ma Mb RawShift Oz Lo Hi A B ((batch_pre-6)+7)).
replace output with (output_pre+(batch_pre-6)) by lia.
rewrite ?Z.mul_1_r in *.
pose proof (qa_kernel_output_4 output_pre (batch_pre-6) Az Bz Ma Mb RawShift Oz Lo Hi A B ltac:(lia) ltac:(lia) ltac:(lia)) as Hmerge0.
qa_memory_apply_pair Hmerge0.
replace ((batch_pre-6)+4) with ((batch_pre-6)+4) by lia.
replace (output_pre+(batch_pre-6)+4) with (output_pre+((batch_pre-6)+4)) by lia.
pose proof (qa_kernel_output_2 output_pre ((batch_pre-6)+4) Az Bz Ma Mb RawShift Oz Lo Hi A B ltac:(lia) ltac:(lia) ltac:(lia)) as Hmerge4.
replace (((batch_pre-6)+4)+0) with ((batch_pre-6)+4) in Hmerge4 by lia.
replace (((batch_pre-6)+4)+1) with ((batch_pre-6)+5) in Hmerge4 by lia.
qa_memory_apply_pair Hmerge4.
replace (((batch_pre-6)+4)+2) with ((batch_pre-6)+6) by lia.
replace ((batch_pre-6)+6) with batch_pre by lia.
rewrite ?Z.sub_0_r.
repeat match goal with |-context[CharArray.undef_full ?p ?z]=>replace z with 0 by lia;rewrite CharArray.undef_full_empty end.
qa_memory_clean_emp;qa_kernel_frame.
Qed.

Lemma proof_of_test_neon_entail_wit_12_15 : Qs8Add.neon_unit_goal.test_neon_entail_wit_12_15.
Proof. unfold Qs8Add.neon_unit_goal.test_neon_entail_wit_12_15, Qs8Add.neon_unit_goal_chunk07.test_neon_entail_wit_12_15.
right;intros params_pre output_pre input_b_pre input_a_pre batch_pre Hi Lo Oz RawShift Mb Ma RawBias Bz Az B A batch input_a input_b output right_shift PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9 PreH10 PreH11 PreH12 PreH13 PreH14 PreH15 PreH16 PreH17 PreH18 PreH19 PreH20 PreH21 PreH22 PreH23 PreH24 PreH25 PreH26 PreH27 PreH28 PreH29 PreH30 PreH31 PreH32 PreH33 PreH34 PreH35 PreH36 PreH37 PreH38 PreH39 PreH40 PreH41 PreH42 PreH43 PreH44 PreH45.
qa_kernel_memory_prepare.
assert (Hcase:batch=4) by lia;subst batch.
rewrite !qa_kernel_lane_expression.
fold (qa_at Az Bz Ma Mb RawShift Oz Lo Hi A B ((batch_pre-4)+0)).
fold (qa_at Az Bz Ma Mb RawShift Oz Lo Hi A B ((batch_pre-4)+1)).
fold (qa_at Az Bz Ma Mb RawShift Oz Lo Hi A B ((batch_pre-4)+2)).
fold (qa_at Az Bz Ma Mb RawShift Oz Lo Hi A B ((batch_pre-4)+3)).
fold (qa_at Az Bz Ma Mb RawShift Oz Lo Hi A B ((batch_pre-4)+4)).
fold (qa_at Az Bz Ma Mb RawShift Oz Lo Hi A B ((batch_pre-4)+5)).
fold (qa_at Az Bz Ma Mb RawShift Oz Lo Hi A B ((batch_pre-4)+6)).
fold (qa_at Az Bz Ma Mb RawShift Oz Lo Hi A B ((batch_pre-4)+7)).
replace output with (output_pre+(batch_pre-4)) by lia.
rewrite ?Z.mul_1_r in *.
pose proof (qa_kernel_output_4 output_pre (batch_pre-4) Az Bz Ma Mb RawShift Oz Lo Hi A B ltac:(lia) ltac:(lia) ltac:(lia)) as Hmerge0.
qa_memory_apply_pair Hmerge0.
replace ((batch_pre-4)+4) with ((batch_pre-4)+4) by lia.
replace ((batch_pre-4)+4) with batch_pre by lia.
rewrite ?Z.sub_0_r.
repeat match goal with |-context[CharArray.undef_full ?p ?z]=>replace z with 0 by lia;rewrite CharArray.undef_full_empty end.
qa_memory_clean_emp;qa_kernel_frame.
Qed.

Lemma proof_of_test_neon_entail_wit_15_2 : Qs8Add.neon_unit_goal.test_neon_entail_wit_15_2.
Proof. unfold Qs8Add.neon_unit_goal.test_neon_entail_wit_15_2, Qs8Add.neon_unit_goal_chunk00.test_neon_entail_wit_15_2.
right;intros params_pre output_pre input_b_pre input_a_pre batch_pre Hi Lo Oz RawShift Mb Ma RawBias Bz Az B A right_shift output_2 input_b_2 input_a_2 batch PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9 PreH10 PreH11 PreH12 PreH13 PreH14 PreH15 PreH16 PreH17 PreH18 PreH19 PreH20 PreH21 PreH22 PreH23 PreH24 PreH25 PreH26 PreH27 PreH28 PreH29 PreH30 PreH31 PreH32 PreH33 PreH34 PreH35 PreH36 PreH37 PreH38 PreH39 PreH40 PreH41 PreH42 PreH43 PreH44 PreH45 PreH46.
qa_kernel_memory_prepare.
repeat match goal with |-context[CharArray.undef_full ?p ?z]=>replace z with 0 by lia;rewrite CharArray.undef_full_empty end.
entailer!.
Qed.

Lemma proof_of_test_neon_entail_wit_17_4 : Qs8Add.neon_unit_goal.test_neon_entail_wit_17_4.
Proof. unfold Qs8Add.neon_unit_goal.test_neon_entail_wit_17_4, Qs8Add.neon_unit_goal_chunk07.test_neon_entail_wit_17_4.
right;intros params_pre output_pre input_b_pre input_a_pre batch_pre Hi Lo Oz RawShift Mb Ma RawBias Bz Az B A right_shift output_2 input_b_2 input_a_2 batch PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9 PreH10 PreH11 PreH12 PreH13 PreH14 PreH15 PreH16 PreH17 PreH18 PreH19 PreH20 PreH21 PreH22 PreH23 PreH24 PreH25 PreH26 PreH27 PreH28 PreH29 PreH30 PreH31 PreH32 PreH33 PreH34 PreH35 PreH36 PreH37 PreH38 PreH39 PreH40 PreH41 PreH42 PreH43 PreH44 PreH45 PreH46 PreH47.
qa_kernel_memory_prepare.
repeat match goal with |-context[CharArray.undef_full ?p ?z]=>replace z with 0 by lia;rewrite CharArray.undef_full_empty end.
entailer!.
Qed.

End CheckedNeonKernelMemoryPart05.
