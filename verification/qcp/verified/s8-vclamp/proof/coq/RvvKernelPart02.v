From Coq Require Import ZArith Lia String List.
From S8Clamp Require Import RvvKernelSupport rvv_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Local Opaque store_char undef_store_char store_ptr undef_store_ptr store_uint64 undef_store_uint64 store_int undef_store_int s8_read_lane s8_rvv_min_lane s8_rvv_max_lane s8_min s8_max s8_rvv_progress.
Ltac kp := intros; rewrite ?sizeof_char in *; unfold derivable1,andp,coq_prop; intros; repeat first[assumption|split|reflexivity];lia.
Ltac kframe := rewrite ?sizeof_char in *; rvv_frame.
Module CheckedRvvKernelPart02.
Lemma proof_of_test_rvv_safety_wit_3 : S8Clamp.rvv_unit_goal.test_rvv_safety_wit_3.
Proof. unfold S8Clamp.rvv_unit_goal.test_rvv_safety_wit_3;kp. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_3 : S8Clamp.rvv_unit_goal.test_rvv_partial_solve_wit_3.
Proof. unfold S8Clamp.rvv_unit_goal.test_rvv_partial_solve_wit_3;intros _;unfold S8Clamp.rvv_unit_goal.test_rvv_partial_solve_wit_3_aux;intros; kframe. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_13_pure : S8Clamp.rvv_unit_goal.test_rvv_partial_solve_wit_13_pure.
Proof. unfold S8Clamp.rvv_unit_goal.test_rvv_partial_solve_wit_13_pure;kp. Qed.
Local Transparent s8_rvv_progress.
Lemma proof_of_test_rvv_entail_wit_2 : S8Clamp.rvv_unit_goal.test_rvv_entail_wit_2.
Proof. unfold S8Clamp.rvv_unit_goal.test_rvv_entail_wit_2. left;intros. rewrite s8_bulk_mask_unbounded. fold s8_narrow. pose proof(s8_narrow_range RawLo)as Hlo. pose proof(s8_narrow_range RawHi)as Hhi. unfold s8_narrow in Hlo,Hhi. pose proof(s8_bulk_count_bounds batch_pre ltac:(lia)). repeat rewrite <-logic_equiv_andp_assoc. apply _derivable1_andp_intros;[kp|apply derivable1_refl]. Qed.
Local Opaque s8_rvv_progress.
End CheckedRvvKernelPart02.
