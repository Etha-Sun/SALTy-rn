From Coq Require Import ZArith Lia String List.
From S8Clamp Require Import RvvKernelSupport rvv_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Local Opaque store_char undef_store_char store_ptr undef_store_ptr store_uint64 undef_store_uint64 store_int undef_store_int s8_read_lane s8_rvv_min_lane s8_rvv_max_lane s8_min s8_max s8_rvv_progress.
Ltac kp := intros; rewrite ?sizeof_char in *; unfold derivable1,andp,coq_prop; intros; repeat first[assumption|split|reflexivity];lia.
Ltac kframe := rewrite ?sizeof_char in *; rvv_frame.
Module CheckedRvvKernelPart13.
Lemma proof_of_test_rvv_safety_wit_14 : S8Clamp.rvv_unit_goal.test_rvv_safety_wit_14.
Proof. unfold S8Clamp.rvv_unit_goal.test_rvv_safety_wit_14;kp. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_1_pure : S8Clamp.rvv_unit_goal.test_rvv_partial_solve_wit_1_pure.
Proof. unfold S8Clamp.rvv_unit_goal.test_rvv_partial_solve_wit_1_pure;kp. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_10_pure : S8Clamp.rvv_unit_goal.test_rvv_partial_solve_wit_10_pure.
Proof. unfold S8Clamp.rvv_unit_goal.test_rvv_partial_solve_wit_10_pure;kp. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_20_pure : S8Clamp.rvv_unit_goal.test_rvv_partial_solve_wit_20_pure.
Proof. unfold S8Clamp.rvv_unit_goal.test_rvv_partial_solve_wit_20_pure;kp. Qed.
Local Transparent s8_rvv_progress.
Lemma proof_of_test_rvv_entail_wit_7_1 : S8Clamp.rvv_unit_goal.test_rvv_entail_wit_7_1.
Proof. unfold S8Clamp.rvv_unit_goal.test_rvv_entail_wit_7_1. left;intros;kframe. Qed.
Local Opaque s8_rvv_progress.
Local Transparent s8_rvv_progress.
Lemma proof_of_test_rvv_return_wit_1 : S8Clamp.rvv_unit_goal.test_rvv_return_wit_1.
Proof. unfold S8Clamp.rvv_unit_goal.test_rvv_return_wit_1. right;intros. assert(batch=0)by lia. subst batch. replace(batch_pre-0)with batch_pre by lia. rewrite s8_rvv_progress_full by lia. rewrite CharArray.undef_full_empty,logic_equiv_sepcon_emp. apply derivable1_refl. Qed.
Local Opaque s8_rvv_progress.
End CheckedRvvKernelPart13.
