From Coq Require Import ZArith Lia List.
From Sqrt Require Import RvvKernelMemorySupport rvv_unit_goal.
From QcpRvv32 Require Import RvvStoreModel.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque sqrt_arm sqrt_rvv sqrt_core.
Module CheckedRvvKernelMemory.
Lemma proof_of_test_rvv_entail_wit_1 : Sqrt.rvv_unit_goal.test_rvv_entail_wit_1.
Proof. unfold Sqrt.rvv_unit_goal.test_rvv_entail_wit_1.
left;sqrt_prepare;
 pose proof(Z.quot_rem batch_pre 4 ltac:(lia));entailer!.
Qed.
Lemma proof_of_test_rvv_entail_wit_2 : Sqrt.rvv_unit_goal.test_rvv_entail_wit_2.
Proof. unfold Sqrt.rvv_unit_goal.test_rvv_entail_wit_2.
left;sqrt_kernel_prepare.
 replace(batch_pre ÷ 4-batch_pre ÷ 4)with 0 by lia.
 cbn[sqrt_rvv_values Z.to_nat firstn].
 rewrite FloatArray.seg_empty,Z.sub_0_r;entailer!.
Qed.
Lemma proof_of_test_rvv_entail_wit_3_1 : Sqrt.rvv_unit_goal.test_rvv_entail_wit_3_1.
Proof. unfold Sqrt.rvv_unit_goal.test_rvv_entail_wit_3_1.
left;sqrt_prepare;subst input;subst output.
 prop_apply(FloatArray.full_Zlength input_pre(batch_pre ÷ 4+3)A).
 Intros_p HA.
 change rvv_take with sqrt_take;change rvv_pack32 with sqrt_pack32.
 rewrite sqrt_pack32_active_prefix by lia.
 replace(batch_pre ÷ 4-(n-retval))with(batch_pre ÷ 4-n+retval)by lia.
 pose proof(sqrt_rvv_prefix_chunk output_pre(batch_pre ÷ 4-n)retval A ltac:(lia)ltac:(lia)ltac:(lia))as Hmerge.
 cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in Hmerge.
 sep_apply Hmerge.
 replace(batch_pre ÷ 4-(batch_pre ÷ 4-n)-retval)with(batch_pre ÷ 4-(batch_pre ÷ 4-n+retval))by lia.
 sqrt_frame.
Qed.
Lemma proof_of_test_rvv_entail_wit_3_2 : Sqrt.rvv_unit_goal.test_rvv_entail_wit_3_2.
Proof. unfold Sqrt.rvv_unit_goal.test_rvv_entail_wit_3_2.
left;sqrt_prepare;subst input;subst output.
 prop_apply(FloatArray.full_Zlength input_pre(batch_pre ÷ 4+3)A).
 Intros_p HA.
 change rvv_take with sqrt_take;change rvv_pack32 with sqrt_pack32.
 rewrite sqrt_pack32_active_prefix by lia.
 replace(batch_pre ÷ 4-(n-retval))with(batch_pre ÷ 4-n+retval)by lia.
 pose proof(sqrt_rvv_prefix_chunk output_pre(batch_pre ÷ 4-n)retval A ltac:(lia)ltac:(lia)ltac:(lia))as Hmerge.
 cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in Hmerge.
 sep_apply Hmerge.
 replace(batch_pre ÷ 4-(batch_pre ÷ 4-n)-retval)with(batch_pre ÷ 4-(batch_pre ÷ 4-n+retval))by lia.
 sqrt_frame.
Qed.
Lemma proof_of_test_rvv_entail_wit_3_3 : Sqrt.rvv_unit_goal.test_rvv_entail_wit_3_3.
Proof. unfold Sqrt.rvv_unit_goal.test_rvv_entail_wit_3_3.
left;sqrt_prepare;subst input;subst output.
 prop_apply(FloatArray.full_Zlength input_pre(batch_pre ÷ 4+3)A).
 Intros_p HA.
 change rvv_take with sqrt_take;change rvv_pack32 with sqrt_pack32.
 rewrite sqrt_pack32_active_prefix by lia.
 replace(batch_pre ÷ 4-(n-retval))with(batch_pre ÷ 4-n+retval)by lia.
 pose proof(sqrt_rvv_prefix_chunk output_pre(batch_pre ÷ 4-n)retval A ltac:(lia)ltac:(lia)ltac:(lia))as Hmerge.
 cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in Hmerge.
 sep_apply Hmerge.
 replace(batch_pre ÷ 4-(batch_pre ÷ 4-n)-retval)with(batch_pre ÷ 4-(batch_pre ÷ 4-n+retval))by lia.
 sqrt_frame.
Qed.
Lemma proof_of_test_rvv_return_wit_1 : Sqrt.rvv_unit_goal.test_rvv_return_wit_1.
Proof. unfold Sqrt.rvv_unit_goal.test_rvv_return_wit_1.
left;sqrt_kernel_prepare.
 assert(n=0)by lia;subst n.
 replace(batch_pre ÷ 4-0)with(batch_pre ÷ 4)by lia.
 replace(batch_pre ÷ 4-batch_pre ÷ 4)with 0 by lia.
 rewrite FloatArray.undef_full_empty.
 sep_apply(sqrt_rvv_output_finish output_pre(batch_pre ÷ 4)A);entailer!.
Qed.
End CheckedRvvKernelMemory.
Print Assumptions CheckedRvvKernelMemory.proof_of_test_rvv_entail_wit_1.
Print Assumptions CheckedRvvKernelMemory.proof_of_test_rvv_entail_wit_2.
Print Assumptions CheckedRvvKernelMemory.proof_of_test_rvv_return_wit_1.
Print Assumptions CheckedRvvKernelMemory.proof_of_test_rvv_entail_wit_3_1.
Print Assumptions CheckedRvvKernelMemory.proof_of_test_rvv_entail_wit_3_2.
Print Assumptions CheckedRvvKernelMemory.proof_of_test_rvv_entail_wit_3_3.
