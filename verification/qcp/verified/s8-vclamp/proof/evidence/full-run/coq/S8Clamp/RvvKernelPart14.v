From Coq Require Import ZArith Lia String List.
From S8Clamp Require Import RvvKernelSupport rvv_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Local Opaque store_char undef_store_char store_ptr undef_store_ptr store_uint64 undef_store_uint64 store_int undef_store_int s8_read_lane s8_rvv_min_lane s8_rvv_max_lane s8_min s8_max s8_rvv_progress.
Ltac kp := intros; rewrite ?sizeof_char in *; unfold derivable1,andp,coq_prop; intros; repeat first[assumption|split|reflexivity];lia.
Ltac kframe := rewrite ?sizeof_char in *; rvv_frame.
Module CheckedRvvKernelPart14.
Lemma proof_of_test_rvv_safety_wit_15 : S8Clamp.rvv_unit_goal.test_rvv_safety_wit_15.
Proof. unfold S8Clamp.rvv_unit_goal.test_rvv_safety_wit_15;kp. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_1 : S8Clamp.rvv_unit_goal.test_rvv_partial_solve_wit_1.
Proof. unfold S8Clamp.rvv_unit_goal.test_rvv_partial_solve_wit_1;intros _;unfold S8Clamp.rvv_unit_goal.test_rvv_partial_solve_wit_1_aux;intros; kframe. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_10 : S8Clamp.rvv_unit_goal.test_rvv_partial_solve_wit_10.
Proof. unfold S8Clamp.rvv_unit_goal.test_rvv_partial_solve_wit_10;intros _;unfold S8Clamp.rvv_unit_goal.test_rvv_partial_solve_wit_10_aux;intros; kframe. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_20 : S8Clamp.rvv_unit_goal.test_rvv_partial_solve_wit_20.
Proof. unfold S8Clamp.rvv_unit_goal.test_rvv_partial_solve_wit_20;intros _;unfold S8Clamp.rvv_unit_goal.test_rvv_partial_solve_wit_20_aux;intros.
 rewrite sizeof_char in *.
 pose proof(CharArray.undef_full_split_to_undef_full output vl batch ltac:(lia))as HH.
 cbn[sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in HH.
 eapply(derivable1_trans _ (CharArray.undef_full output batch ** _)).
 { pull_cell(CharArray.undef_full output batch). }
 eapply(derivable1_trans _ ((CharArray.undef_full output vl ** CharArray.undef_full(output+vl*1)(batch-vl)) ** _)).
 {apply derivable1_sepcon_mono;[exact HH|apply derivable1_refl]. }
 kframe.
Qed.
End CheckedRvvKernelPart14.
