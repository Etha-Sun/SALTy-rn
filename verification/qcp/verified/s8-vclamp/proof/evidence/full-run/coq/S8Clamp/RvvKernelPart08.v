From Coq Require Import ZArith Lia String List.
From S8Clamp Require Import RvvKernelSupport rvv_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Local Opaque store_char undef_store_char store_ptr undef_store_ptr store_uint64 undef_store_uint64 store_int undef_store_int s8_read_lane s8_rvv_min_lane s8_rvv_max_lane s8_min s8_max s8_rvv_progress.
Ltac kp := intros; rewrite ?sizeof_char in *; unfold derivable1,andp,coq_prop; intros; repeat first[assumption|split|reflexivity];lia.
Ltac kframe := rewrite ?sizeof_char in *; rvv_frame.
Module CheckedRvvKernelPart08.
Lemma proof_of_test_rvv_safety_wit_9 : S8Clamp.rvv_unit_goal.test_rvv_safety_wit_9.
Proof. unfold S8Clamp.rvv_unit_goal.test_rvv_safety_wit_9;kp. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_6 : S8Clamp.rvv_unit_goal.test_rvv_partial_solve_wit_6.
Proof. unfold S8Clamp.rvv_unit_goal.test_rvv_partial_solve_wit_6;intros _;unfold S8Clamp.rvv_unit_goal.test_rvv_partial_solve_wit_6_aux;intros; kframe. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_16 : S8Clamp.rvv_unit_goal.test_rvv_partial_solve_wit_16.
Proof. unfold S8Clamp.rvv_unit_goal.test_rvv_partial_solve_wit_16;intros _;unfold S8Clamp.rvv_unit_goal.test_rvv_partial_solve_wit_16_aux;intros; kframe. Qed.
Local Transparent s8_rvv_progress.
Lemma proof_of_test_rvv_entail_wit_6_2 : S8Clamp.rvv_unit_goal.test_rvv_entail_wit_6_2.
Proof. unfold S8Clamp.rvv_unit_goal.test_rvv_entail_wit_6_2. left;intros;kframe. Qed.
Local Opaque s8_rvv_progress.
End CheckedRvvKernelPart08.
