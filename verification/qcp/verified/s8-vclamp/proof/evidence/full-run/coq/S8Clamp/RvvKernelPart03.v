From Coq Require Import ZArith Lia String List.
From S8Clamp Require Import RvvKernelSupport rvv_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Local Opaque store_char undef_store_char store_ptr undef_store_ptr store_uint64 undef_store_uint64 store_int undef_store_int s8_read_lane s8_rvv_min_lane s8_rvv_max_lane s8_min s8_max s8_rvv_progress.
Ltac kp := intros; rewrite ?sizeof_char in *; unfold derivable1,andp,coq_prop; intros; repeat first[assumption|split|reflexivity];lia.
Ltac kframe := rewrite ?sizeof_char in *; rvv_frame.
Module CheckedRvvKernelPart03.
Lemma proof_of_test_rvv_safety_wit_4 : S8Clamp.rvv_unit_goal.test_rvv_safety_wit_4.
Proof. unfold S8Clamp.rvv_unit_goal.test_rvv_safety_wit_4;kp. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_4_pure : S8Clamp.rvv_unit_goal.test_rvv_partial_solve_wit_4_pure.
Proof. unfold S8Clamp.rvv_unit_goal.test_rvv_partial_solve_wit_4_pure;kp. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_13 : S8Clamp.rvv_unit_goal.test_rvv_partial_solve_wit_13.
Proof. unfold S8Clamp.rvv_unit_goal.test_rvv_partial_solve_wit_13;intros _;unfold S8Clamp.rvv_unit_goal.test_rvv_partial_solve_wit_13_aux;intros; kframe. Qed.
Local Transparent s8_rvv_progress.
Lemma proof_of_test_rvv_entail_wit_3 : S8Clamp.rvv_unit_goal.test_rvv_entail_wit_3.
Proof. unfold S8Clamp.rvv_unit_goal.test_rvv_entail_wit_3. right;intros. replace(batch_pre-batch_pre)with 0 by lia. unfold s8_rvv_progress. rewrite s8_rvv_prefix_zero,CharArray.undef_full_empty. entailer!. Qed.
Local Opaque s8_rvv_progress.
End CheckedRvvKernelPart03.
