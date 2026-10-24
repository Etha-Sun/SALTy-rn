From Coq Require Import ZArith Lia List.
From Qs8Add Require Import rvv_unit_goal RvvKernelMemorySupport RvvKernelResourceFrame.
Import Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque qa_neon_lane qa_neon_mul qa_neon_mla qa_neon_shift qa_neon_add16 qa_s16 qa_sat16 qa_sat8 qa_min qa_max qa_ctrl qa_values qa_window.
Module CheckedRvvKernelMemoryPart00.
Lemma proof_of_test_rvv_entail_wit_1 : Qs8Add.rvv_unit_goal.test_rvv_entail_wit_1.
Proof. unfold Qs8Add.rvv_unit_goal.test_rvv_entail_wit_1, Qs8Add.rvv_unit_goal_chunk06.test_rvv_entail_wit_1.
left;intros params_pre output_pre input_b_pre input_a_pre batch_pre Hi Lo Oz RawShift Mb Ma RawBias Bz Az B A PreH1 PreH2 PreH3 PreH4 PreH5 PreH6 PreH7 PreH8 PreH9 PreH10 PreH11 PreH12 PreH13 PreH14 PreH15 PreH16 PreH17 PreH18 PreH19 PreH20 PreH21 PreH22 PreH23 PreH24.
prop_apply(CharArray.full_Zlength input_a_pre(batch_pre+7)A);Intros_p HA.
 prop_apply(CharArray.full_Zlength input_b_pre(batch_pre+7)B);Intros_p HB.
 rewrite ?sizeof_char,?Z.rem_1_r,?Z.mod_1_r;qa_rvv_resource_frame.
Qed.
End CheckedRvvKernelMemoryPart00.
