From Coq Require Import ZArith Lia Bool.
From FMax Require Import Bits Model scalar_primitives_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac scalar_cases :=
 repeat match goal with
 | |- context[Z.eqb ?a ?b] => destruct (Z.eqb_spec a b); cbn [andb orb]; try contradiction
 | |- context[Z.ltb ?a ?b] => destruct (Z.ltb_spec a b); cbn [andb orb]; try contradiction
 end.
Ltac scalar_finish :=
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 try change Int.max_unsigned with 4294967295 in *;
 entailer!; try congruence; try lia.
Module CheckedScalar : scalar_primitives_goal.VC_Correct.
Lemma proof_of_qcp_fmax_abs_bits_return_wit_1 : qcp_fmax_abs_bits_return_wit_1.
Proof. unfold qcp_fmax_abs_bits_return_wit_1; try left; intros; unfold same_bits in *; subst; unfold mm_abs_bits; scalar_cases; scalar_finish. Qed.
Lemma proof_of_qcp_fmax_nan_bits_safety_wit_1 : qcp_fmax_nan_bits_safety_wit_1.
Proof. unfold qcp_fmax_nan_bits_safety_wit_1; try left; intros; unfold same_bits in *; subst; unfold mm_nan_bits; scalar_cases; scalar_finish. Qed.
Lemma proof_of_qcp_fmax_nan_bits_safety_wit_2 : qcp_fmax_nan_bits_safety_wit_2.
Proof. unfold qcp_fmax_nan_bits_safety_wit_2; try left; intros; unfold same_bits in *; subst; unfold mm_nan_bits; scalar_cases; scalar_finish. Qed.
Lemma proof_of_qcp_fmax_nan_bits_return_wit_1 : qcp_fmax_nan_bits_return_wit_1.
Proof. unfold qcp_fmax_nan_bits_return_wit_1; try left; intros; unfold same_bits in *; subst; unfold mm_nan_bits; scalar_cases; scalar_finish. Qed.
Lemma proof_of_qcp_fmax_nan_bits_return_wit_2 : qcp_fmax_nan_bits_return_wit_2.
Proof. unfold qcp_fmax_nan_bits_return_wit_2; try left; intros; unfold same_bits in *; subst; unfold mm_nan_bits; scalar_cases; scalar_finish. Qed.
Lemma proof_of_qcp_fmax_nan_bits_partial_solve_wit_1 : qcp_fmax_nan_bits_partial_solve_wit_1.
Proof. unfold qcp_fmax_nan_bits_partial_solve_wit_1; try left; intros; unfold same_bits in *; subst; unfold mm_nan_bits; scalar_cases; scalar_finish. Qed.
Lemma proof_of_qcp_fmax_snan_bits_safety_wit_1 : qcp_fmax_snan_bits_safety_wit_1.
Proof. unfold qcp_fmax_snan_bits_safety_wit_1; try left; intros; unfold same_bits in *; subst; unfold mm_snan_bits; scalar_cases; scalar_finish. Qed.
Lemma proof_of_qcp_fmax_snan_bits_safety_wit_2 : qcp_fmax_snan_bits_safety_wit_2.
Proof. unfold qcp_fmax_snan_bits_safety_wit_2; try left; intros; unfold same_bits in *; subst; unfold mm_snan_bits; scalar_cases; scalar_finish. Qed.
Lemma proof_of_qcp_fmax_snan_bits_safety_wit_3 : qcp_fmax_snan_bits_safety_wit_3.
Proof. unfold qcp_fmax_snan_bits_safety_wit_3; try left; intros; unfold same_bits in *; subst; unfold mm_snan_bits; scalar_cases; scalar_finish. Qed.
Lemma proof_of_qcp_fmax_snan_bits_safety_wit_4 : qcp_fmax_snan_bits_safety_wit_4.
Proof. unfold qcp_fmax_snan_bits_safety_wit_4; try left; intros; unfold same_bits in *; subst; unfold mm_snan_bits; scalar_cases; scalar_finish. Qed.
Lemma proof_of_qcp_fmax_snan_bits_safety_wit_5 : qcp_fmax_snan_bits_safety_wit_5.
Proof. unfold qcp_fmax_snan_bits_safety_wit_5; try left; intros; unfold same_bits in *; subst; unfold mm_snan_bits; scalar_cases; scalar_finish. Qed.
Lemma proof_of_qcp_fmax_snan_bits_return_wit_1 : qcp_fmax_snan_bits_return_wit_1.
Proof. unfold qcp_fmax_snan_bits_return_wit_1; try left; intros; unfold same_bits in *; subst; unfold mm_snan_bits; scalar_cases; scalar_finish. Qed.
Lemma proof_of_qcp_fmax_snan_bits_return_wit_2 : qcp_fmax_snan_bits_return_wit_2.
Proof. unfold qcp_fmax_snan_bits_return_wit_2; try left; intros; unfold same_bits in *; subst; unfold mm_snan_bits; scalar_cases; scalar_finish. Qed.
Lemma proof_of_qcp_fmax_snan_bits_return_wit_3 : qcp_fmax_snan_bits_return_wit_3.
Proof. unfold qcp_fmax_snan_bits_return_wit_3; try left; intros; unfold same_bits in *; subst; unfold mm_snan_bits; scalar_cases; scalar_finish. Qed.
Lemma proof_of_qcp_fmax_snan_bits_partial_solve_wit_1 : qcp_fmax_snan_bits_partial_solve_wit_1.
Proof. unfold qcp_fmax_snan_bits_partial_solve_wit_1; try left; intros; unfold same_bits in *; subst; unfold mm_snan_bits; scalar_cases; scalar_finish. Qed.
Lemma proof_of_qcp_fmax_order_key_safety_wit_1 : qcp_fmax_order_key_safety_wit_1.
Proof. unfold qcp_fmax_order_key_safety_wit_1; try left; intros; unfold same_bits in *; subst; unfold mm_order_key; scalar_cases; scalar_finish. Qed.
Lemma proof_of_qcp_fmax_order_key_return_wit_1 : qcp_fmax_order_key_return_wit_1.
Proof. unfold qcp_fmax_order_key_return_wit_1; try left; intros; unfold same_bits in *; subst; unfold mm_order_key; scalar_cases; scalar_finish. Qed.
Lemma proof_of_qcp_fmax_order_key_return_wit_2 : qcp_fmax_order_key_return_wit_2.
Proof. unfold qcp_fmax_order_key_return_wit_2; try left; intros; unfold same_bits in *; subst; unfold mm_order_key; scalar_cases; scalar_finish. Qed.
Lemma proof_of_qcp_fmax_ordered_bits_safety_wit_1 : qcp_fmax_ordered_bits_safety_wit_1.
Proof. unfold qcp_fmax_ordered_bits_safety_wit_1; try left; intros; unfold same_bits in *; subst; unfold mm_ordered_bits; scalar_cases; scalar_finish. Qed.
Lemma proof_of_qcp_fmax_ordered_bits_safety_wit_2 : qcp_fmax_ordered_bits_safety_wit_2.
Proof. unfold qcp_fmax_ordered_bits_safety_wit_2; try left; intros; unfold same_bits in *; subst; unfold mm_ordered_bits; scalar_cases; scalar_finish. Qed.
Lemma proof_of_qcp_fmax_ordered_bits_return_wit_1 : qcp_fmax_ordered_bits_return_wit_1.
Proof. unfold qcp_fmax_ordered_bits_return_wit_1; try left; intros; unfold same_bits in *; subst; unfold mm_ordered_bits; scalar_cases; scalar_finish. Qed.
Lemma proof_of_qcp_fmax_ordered_bits_return_wit_2 : qcp_fmax_ordered_bits_return_wit_2.
Proof. unfold qcp_fmax_ordered_bits_return_wit_2; try left; intros; unfold same_bits in *; subst; unfold mm_ordered_bits; scalar_cases; scalar_finish. Qed.
Lemma proof_of_qcp_fmax_ordered_bits_return_wit_3 : qcp_fmax_ordered_bits_return_wit_3.
Proof. unfold qcp_fmax_ordered_bits_return_wit_3; try left; intros; unfold same_bits in *; subst; unfold mm_ordered_bits; scalar_cases; scalar_finish. Qed.
Lemma proof_of_qcp_fmax_ordered_bits_return_wit_4 : qcp_fmax_ordered_bits_return_wit_4.
Proof. unfold qcp_fmax_ordered_bits_return_wit_4; try left; intros; unfold same_bits in *; subst; unfold mm_ordered_bits; scalar_cases; scalar_finish. Qed.
Lemma proof_of_qcp_fmax_ordered_bits_return_wit_5 : qcp_fmax_ordered_bits_return_wit_5.
Proof. unfold qcp_fmax_ordered_bits_return_wit_5; try left; intros; unfold same_bits in *; subst; unfold mm_ordered_bits; scalar_cases; scalar_finish. Qed.
Lemma proof_of_qcp_fmax_ordered_bits_partial_solve_wit_1 : qcp_fmax_ordered_bits_partial_solve_wit_1.
Proof. unfold qcp_fmax_ordered_bits_partial_solve_wit_1; try left; intros; unfold same_bits in *; subst; unfold mm_ordered_bits; scalar_cases; scalar_finish. Qed.
Lemma proof_of_qcp_fmax_ordered_bits_partial_solve_wit_2 : qcp_fmax_ordered_bits_partial_solve_wit_2.
Proof. unfold qcp_fmax_ordered_bits_partial_solve_wit_2; try left; intros; unfold same_bits in *; subst; unfold mm_ordered_bits; scalar_cases; scalar_finish. Qed.
Lemma proof_of_qcp_fmax_ordered_bits_partial_solve_wit_3 : qcp_fmax_ordered_bits_partial_solve_wit_3.
Proof. unfold qcp_fmax_ordered_bits_partial_solve_wit_3; try left; intros; unfold same_bits in *; subst; unfold mm_ordered_bits; scalar_cases; scalar_finish. Qed.
Lemma proof_of_qcp_fmax_ordered_bits_partial_solve_wit_4 : qcp_fmax_ordered_bits_partial_solve_wit_4.
Proof. unfold qcp_fmax_ordered_bits_partial_solve_wit_4; try left; intros; unfold same_bits in *; subst; unfold mm_ordered_bits; scalar_cases; scalar_finish. Qed.
Lemma proof_of_qcp_fmax_ordered_bits_partial_solve_wit_5 : qcp_fmax_ordered_bits_partial_solve_wit_5.
Proof. unfold qcp_fmax_ordered_bits_partial_solve_wit_5; try left; intros; unfold same_bits in *; subst; unfold mm_ordered_bits; scalar_cases; scalar_finish. Qed.
Lemma proof_of_qcp_fmax_ordered_bits_partial_solve_wit_6 : qcp_fmax_ordered_bits_partial_solve_wit_6.
Proof. unfold qcp_fmax_ordered_bits_partial_solve_wit_6; try left; intros; unfold same_bits in *; subst; unfold mm_ordered_bits; scalar_cases; scalar_finish. Qed.
Lemma proof_of_qcp_fmax_arm_bits_safety_wit_1 : qcp_fmax_arm_bits_safety_wit_1.
Proof. unfold qcp_fmax_arm_bits_safety_wit_1; try left; intros; unfold same_bits in *; subst; unfold mm_arm_bits; scalar_cases; scalar_finish. Qed.
Lemma proof_of_qcp_fmax_arm_bits_safety_wit_2 : qcp_fmax_arm_bits_safety_wit_2.
Proof. unfold qcp_fmax_arm_bits_safety_wit_2; try left; intros; unfold same_bits in *; subst; unfold mm_arm_bits; scalar_cases; scalar_finish. Qed.
Lemma proof_of_qcp_fmax_arm_bits_safety_wit_3 : qcp_fmax_arm_bits_safety_wit_3.
Proof. unfold qcp_fmax_arm_bits_safety_wit_3; try left; intros; unfold same_bits in *; subst; unfold mm_arm_bits; scalar_cases; scalar_finish. Qed.
Lemma proof_of_qcp_fmax_arm_bits_safety_wit_4 : qcp_fmax_arm_bits_safety_wit_4.
Proof. unfold qcp_fmax_arm_bits_safety_wit_4; try left; intros; unfold same_bits in *; subst; unfold mm_arm_bits; scalar_cases; scalar_finish. Qed.
Lemma proof_of_qcp_fmax_arm_bits_return_wit_1 : qcp_fmax_arm_bits_return_wit_1.
Proof. unfold qcp_fmax_arm_bits_return_wit_1; try left; intros; unfold same_bits in *; subst; unfold mm_arm_bits; scalar_cases; scalar_finish. Qed.
Lemma proof_of_qcp_fmax_arm_bits_return_wit_2 : qcp_fmax_arm_bits_return_wit_2.
Proof. unfold qcp_fmax_arm_bits_return_wit_2; try left; intros; unfold same_bits in *; subst; unfold mm_arm_bits; scalar_cases; scalar_finish. Qed.
Lemma proof_of_qcp_fmax_arm_bits_return_wit_3 : qcp_fmax_arm_bits_return_wit_3.
Proof. unfold qcp_fmax_arm_bits_return_wit_3; try left; intros; unfold same_bits in *; subst; unfold mm_arm_bits; scalar_cases; scalar_finish. Qed.
Lemma proof_of_qcp_fmax_arm_bits_return_wit_4 : qcp_fmax_arm_bits_return_wit_4.
Proof. unfold qcp_fmax_arm_bits_return_wit_4; try left; intros; unfold same_bits in *; subst; unfold mm_arm_bits; scalar_cases; scalar_finish. Qed.
Lemma proof_of_qcp_fmax_arm_bits_return_wit_5 : qcp_fmax_arm_bits_return_wit_5.
Proof. unfold qcp_fmax_arm_bits_return_wit_5; try left; intros; unfold same_bits in *; subst; unfold mm_arm_bits; scalar_cases; scalar_finish. Qed.
Lemma proof_of_qcp_fmax_arm_bits_partial_solve_wit_1 : qcp_fmax_arm_bits_partial_solve_wit_1.
Proof. unfold qcp_fmax_arm_bits_partial_solve_wit_1; try left; intros; unfold same_bits in *; subst; unfold mm_arm_bits; scalar_cases; scalar_finish. Qed.
Lemma proof_of_qcp_fmax_arm_bits_partial_solve_wit_2 : qcp_fmax_arm_bits_partial_solve_wit_2.
Proof. unfold qcp_fmax_arm_bits_partial_solve_wit_2; try left; intros; unfold same_bits in *; subst; unfold mm_arm_bits; scalar_cases; scalar_finish. Qed.
Lemma proof_of_qcp_fmax_arm_bits_partial_solve_wit_3 : qcp_fmax_arm_bits_partial_solve_wit_3.
Proof. unfold qcp_fmax_arm_bits_partial_solve_wit_3; try left; intros; unfold same_bits in *; subst; unfold mm_arm_bits; scalar_cases; scalar_finish. Qed.
Lemma proof_of_qcp_fmax_arm_bits_partial_solve_wit_4 : qcp_fmax_arm_bits_partial_solve_wit_4.
Proof. unfold qcp_fmax_arm_bits_partial_solve_wit_4; try left; intros; unfold same_bits in *; subst; unfold mm_arm_bits; scalar_cases; scalar_finish. Qed.
Lemma proof_of_qcp_fmax_arm_bits_partial_solve_wit_5 : qcp_fmax_arm_bits_partial_solve_wit_5.
Proof. unfold qcp_fmax_arm_bits_partial_solve_wit_5; try left; intros; unfold same_bits in *; subst; unfold mm_arm_bits; scalar_cases; scalar_finish. Qed.
Lemma proof_of_qcp_fmax_rvv_bits_safety_wit_1 : qcp_fmax_rvv_bits_safety_wit_1.
Proof. unfold qcp_fmax_rvv_bits_safety_wit_1; try left; intros; unfold same_bits in *; subst; unfold mm_rvv_bits; scalar_cases; scalar_finish. Qed.
Lemma proof_of_qcp_fmax_rvv_bits_safety_wit_2 : qcp_fmax_rvv_bits_safety_wit_2.
Proof. unfold qcp_fmax_rvv_bits_safety_wit_2; try left; intros; unfold same_bits in *; subst; unfold mm_rvv_bits; scalar_cases; scalar_finish. Qed.
Lemma proof_of_qcp_fmax_rvv_bits_safety_wit_3 : qcp_fmax_rvv_bits_safety_wit_3.
Proof. unfold qcp_fmax_rvv_bits_safety_wit_3; try left; intros; unfold same_bits in *; subst; unfold mm_rvv_bits; scalar_cases; scalar_finish. Qed.
Lemma proof_of_qcp_fmax_rvv_bits_return_wit_1 : qcp_fmax_rvv_bits_return_wit_1.
Proof. unfold qcp_fmax_rvv_bits_return_wit_1; try left; intros; unfold same_bits in *; subst; unfold mm_rvv_bits; scalar_cases; scalar_finish. Qed.
Lemma proof_of_qcp_fmax_rvv_bits_return_wit_2 : qcp_fmax_rvv_bits_return_wit_2.
Proof. unfold qcp_fmax_rvv_bits_return_wit_2; try left; intros; unfold same_bits in *; subst; unfold mm_rvv_bits; scalar_cases; scalar_finish. Qed.
Lemma proof_of_qcp_fmax_rvv_bits_return_wit_3 : qcp_fmax_rvv_bits_return_wit_3.
Proof. unfold qcp_fmax_rvv_bits_return_wit_3; try left; intros; unfold same_bits in *; subst; unfold mm_rvv_bits; scalar_cases; scalar_finish. Qed.
Lemma proof_of_qcp_fmax_rvv_bits_return_wit_4 : qcp_fmax_rvv_bits_return_wit_4.
Proof. unfold qcp_fmax_rvv_bits_return_wit_4; try left; intros; unfold same_bits in *; subst; unfold mm_rvv_bits; scalar_cases; scalar_finish. Qed.
Lemma proof_of_qcp_fmax_rvv_bits_partial_solve_wit_1 : qcp_fmax_rvv_bits_partial_solve_wit_1.
Proof. unfold qcp_fmax_rvv_bits_partial_solve_wit_1; try left; intros; unfold same_bits in *; subst; unfold mm_rvv_bits; scalar_cases; scalar_finish. Qed.
Lemma proof_of_qcp_fmax_rvv_bits_partial_solve_wit_2 : qcp_fmax_rvv_bits_partial_solve_wit_2.
Proof. unfold qcp_fmax_rvv_bits_partial_solve_wit_2; try left; intros; unfold same_bits in *; subst; unfold mm_rvv_bits; scalar_cases; scalar_finish. Qed.
Lemma proof_of_qcp_fmax_rvv_bits_partial_solve_wit_3 : qcp_fmax_rvv_bits_partial_solve_wit_3.
Proof. unfold qcp_fmax_rvv_bits_partial_solve_wit_3; try left; intros; unfold same_bits in *; subst; unfold mm_rvv_bits; scalar_cases; scalar_finish. Qed.
Lemma proof_of_qcp_fmax_rvv_bits_partial_solve_wit_4 : qcp_fmax_rvv_bits_partial_solve_wit_4.
Proof. unfold qcp_fmax_rvv_bits_partial_solve_wit_4; try left; intros; unfold same_bits in *; subst; unfold mm_rvv_bits; scalar_cases; scalar_finish. Qed.
Lemma proof_of_qcp_fmax_arm_return_wit_1 : qcp_fmax_arm_return_wit_1.
Proof. unfold qcp_fmax_arm_return_wit_1; try left; intros; unfold same_bits in *; subst; unfold mm_arm; scalar_cases; scalar_finish. Qed.
Lemma proof_of_qcp_fmax_arm_partial_solve_wit_1 : qcp_fmax_arm_partial_solve_wit_1.
Proof. unfold qcp_fmax_arm_partial_solve_wit_1; try left; intros; unfold same_bits in *; subst; unfold mm_arm; scalar_cases; scalar_finish. Qed.
Lemma proof_of_qcp_fmax_arm_partial_solve_wit_2 : qcp_fmax_arm_partial_solve_wit_2.
Proof. unfold qcp_fmax_arm_partial_solve_wit_2; try left; intros; unfold same_bits in *; subst; unfold mm_arm; scalar_cases; scalar_finish. Qed.
Lemma proof_of_qcp_fmax_arm_partial_solve_wit_3 : qcp_fmax_arm_partial_solve_wit_3.
Proof. unfold qcp_fmax_arm_partial_solve_wit_3; try left; intros; unfold same_bits in *; subst; unfold mm_arm; scalar_cases; scalar_finish. Qed.
Lemma proof_of_qcp_fmax_arm_partial_solve_wit_4 : qcp_fmax_arm_partial_solve_wit_4.
Proof. unfold qcp_fmax_arm_partial_solve_wit_4; try left; intros; unfold same_bits in *; subst; unfold mm_arm; scalar_cases; scalar_finish. Qed.
Lemma proof_of_qcp_fmax_rvv_return_wit_1 : qcp_fmax_rvv_return_wit_1.
Proof. unfold qcp_fmax_rvv_return_wit_1; try left; intros; unfold same_bits in *; subst; unfold mm_rvv; scalar_cases; scalar_finish. Qed.
Lemma proof_of_qcp_fmax_rvv_partial_solve_wit_1 : qcp_fmax_rvv_partial_solve_wit_1.
Proof. unfold qcp_fmax_rvv_partial_solve_wit_1; try left; intros; unfold same_bits in *; subst; unfold mm_rvv; scalar_cases; scalar_finish. Qed.
Lemma proof_of_qcp_fmax_rvv_partial_solve_wit_2 : qcp_fmax_rvv_partial_solve_wit_2.
Proof. unfold qcp_fmax_rvv_partial_solve_wit_2; try left; intros; unfold same_bits in *; subst; unfold mm_rvv; scalar_cases; scalar_finish. Qed.
Lemma proof_of_qcp_fmax_rvv_partial_solve_wit_3 : qcp_fmax_rvv_partial_solve_wit_3.
Proof. unfold qcp_fmax_rvv_partial_solve_wit_3; try left; intros; unfold same_bits in *; subst; unfold mm_rvv; scalar_cases; scalar_finish. Qed.
Lemma proof_of_qcp_fmax_rvv_partial_solve_wit_4 : qcp_fmax_rvv_partial_solve_wit_4.
Proof. unfold qcp_fmax_rvv_partial_solve_wit_4; try left; intros; unfold same_bits in *; subst; unfold mm_rvv; scalar_cases; scalar_finish. Qed.
Lemma proof_of_qcp_fmax_rvv_add_safety_wit_1 : qcp_fmax_rvv_add_safety_wit_1.
Proof. unfold qcp_fmax_rvv_add_safety_wit_1; try left; intros; unfold same_bits in *; subst; unfold mm_rvv_add, mm_canonical_nan; scalar_cases; scalar_finish. Qed.
Lemma proof_of_qcp_fmax_rvv_add_safety_wit_2 : qcp_fmax_rvv_add_safety_wit_2.
Proof. unfold qcp_fmax_rvv_add_safety_wit_2; try left; intros; unfold same_bits in *; subst; unfold mm_rvv_add, mm_canonical_nan; scalar_cases; scalar_finish. Qed.
Lemma proof_of_qcp_fmax_rvv_add_safety_wit_3 : qcp_fmax_rvv_add_safety_wit_3.
Proof. unfold qcp_fmax_rvv_add_safety_wit_3; try left; intros; unfold same_bits in *; subst; unfold mm_rvv_add, mm_canonical_nan; scalar_cases; scalar_finish. Qed.
Lemma proof_of_qcp_fmax_rvv_add_return_wit_1 : qcp_fmax_rvv_add_return_wit_1.
Proof. unfold qcp_fmax_rvv_add_return_wit_1; try left; intros; unfold same_bits in *; subst; unfold mm_rvv_add, mm_canonical_nan; scalar_cases; scalar_finish. Qed.
Lemma proof_of_qcp_fmax_rvv_add_return_wit_2 : qcp_fmax_rvv_add_return_wit_2.
Proof. unfold qcp_fmax_rvv_add_return_wit_2; try left; intros; unfold same_bits in *; subst; unfold mm_rvv_add, mm_canonical_nan; scalar_cases; scalar_finish. Qed.
Lemma proof_of_qcp_fmax_rvv_add_return_wit_3 : qcp_fmax_rvv_add_return_wit_3.
Proof. unfold qcp_fmax_rvv_add_return_wit_3; try left; intros; unfold same_bits in *; subst; unfold mm_rvv_add, mm_canonical_nan; scalar_cases; scalar_finish. Qed.
Lemma proof_of_qcp_fmax_rvv_add_return_wit_4 : qcp_fmax_rvv_add_return_wit_4.
Proof. unfold qcp_fmax_rvv_add_return_wit_4; try left; intros; unfold same_bits in *; subst; unfold mm_rvv_add, mm_canonical_nan; scalar_cases; scalar_finish. Qed.
Lemma proof_of_qcp_fmax_rvv_add_partial_solve_wit_1 : qcp_fmax_rvv_add_partial_solve_wit_1.
Proof. unfold qcp_fmax_rvv_add_partial_solve_wit_1; try left; intros; unfold same_bits in *; subst; unfold mm_rvv_add, mm_canonical_nan; scalar_cases; scalar_finish. Qed.
Lemma proof_of_qcp_fmax_rvv_add_partial_solve_wit_2 : qcp_fmax_rvv_add_partial_solve_wit_2.
Proof. unfold qcp_fmax_rvv_add_partial_solve_wit_2; try left; intros; unfold same_bits in *; subst; unfold mm_rvv_add, mm_canonical_nan; scalar_cases; scalar_finish. Qed.
Lemma proof_of_qcp_fmax_rvv_add_partial_solve_wit_3 : qcp_fmax_rvv_add_partial_solve_wit_3.
Proof. unfold qcp_fmax_rvv_add_partial_solve_wit_3; try left; intros; unfold same_bits in *; subst; unfold mm_rvv_add, mm_canonical_nan; scalar_cases; scalar_finish. Qed.
Lemma proof_of_qcp_fmax_rvv_add_partial_solve_wit_4 : qcp_fmax_rvv_add_partial_solve_wit_4.
Proof. unfold qcp_fmax_rvv_add_partial_solve_wit_4; try left; intros; unfold same_bits in *; subst; unfold mm_rvv_add, mm_canonical_nan; scalar_cases; scalar_finish. Qed.
Lemma proof_of_qcp_fmax_rvv_add_partial_solve_wit_5 : qcp_fmax_rvv_add_partial_solve_wit_5.
Proof. unfold qcp_fmax_rvv_add_partial_solve_wit_5; try left; intros; unfold same_bits in *; subst; unfold mm_rvv_add, mm_canonical_nan; scalar_cases; scalar_finish. Qed.
Lemma proof_of_qcp_fmax_rvv_add_partial_solve_wit_6 : qcp_fmax_rvv_add_partial_solve_wit_6.
Proof. unfold qcp_fmax_rvv_add_partial_solve_wit_6; try left; intros; unfold same_bits in *; subst; unfold mm_rvv_add, mm_canonical_nan; scalar_cases; scalar_finish. Qed.
Lemma proof_of_qcp_fmax_rvv_add_partial_solve_wit_7 : qcp_fmax_rvv_add_partial_solve_wit_7.
Proof. unfold qcp_fmax_rvv_add_partial_solve_wit_7; try left; intros; unfold same_bits in *; subst; unfold mm_rvv_add, mm_canonical_nan; scalar_cases; scalar_finish. Qed.
Lemma proof_of_qcp_fmax_rvv_add_partial_solve_wit_8 : qcp_fmax_rvv_add_partial_solve_wit_8.
Proof. unfold qcp_fmax_rvv_add_partial_solve_wit_8; try left; intros; unfold same_bits in *; subst; unfold mm_rvv_add, mm_canonical_nan; scalar_cases; scalar_finish. Qed.
Lemma proof_of_qcp_fmax_rvv_add_partial_solve_wit_9 : qcp_fmax_rvv_add_partial_solve_wit_9.
Proof. unfold qcp_fmax_rvv_add_partial_solve_wit_9; try left; intros; unfold same_bits in *; subst; unfold mm_rvv_add, mm_canonical_nan; scalar_cases; scalar_finish. Qed.
Lemma proof_of_qcp_fmax_rvv_ne_safety_wit_1 : qcp_fmax_rvv_ne_safety_wit_1.
Proof. unfold qcp_fmax_rvv_ne_safety_wit_1; try left; intros; unfold same_bits in *; subst; unfold mm_rvv_ne; scalar_cases; scalar_finish. Qed.
Lemma proof_of_qcp_fmax_rvv_ne_safety_wit_2 : qcp_fmax_rvv_ne_safety_wit_2.
Proof. unfold qcp_fmax_rvv_ne_safety_wit_2; try left; intros; unfold same_bits in *; subst; unfold mm_rvv_ne; scalar_cases; scalar_finish. Qed.
Lemma proof_of_qcp_fmax_rvv_ne_safety_wit_3 : qcp_fmax_rvv_ne_safety_wit_3.
Proof. unfold qcp_fmax_rvv_ne_safety_wit_3; try left; intros; unfold same_bits in *; subst; unfold mm_rvv_ne; scalar_cases; scalar_finish. Qed.
Lemma proof_of_qcp_fmax_rvv_ne_safety_wit_4 : qcp_fmax_rvv_ne_safety_wit_4.
Proof. unfold qcp_fmax_rvv_ne_safety_wit_4; try left; intros; unfold same_bits in *; subst; unfold mm_rvv_ne; scalar_cases; scalar_finish. Qed.
Lemma proof_of_qcp_fmax_rvv_ne_safety_wit_5 : qcp_fmax_rvv_ne_safety_wit_5.
Proof. unfold qcp_fmax_rvv_ne_safety_wit_5; try left; intros; unfold same_bits in *; subst; unfold mm_rvv_ne; scalar_cases; scalar_finish. Qed.
Lemma proof_of_qcp_fmax_rvv_ne_safety_wit_6 : qcp_fmax_rvv_ne_safety_wit_6.
Proof. unfold qcp_fmax_rvv_ne_safety_wit_6; try left; intros; unfold same_bits in *; subst; unfold mm_rvv_ne; scalar_cases; scalar_finish. Qed.
Lemma proof_of_qcp_fmax_rvv_ne_safety_wit_7 : qcp_fmax_rvv_ne_safety_wit_7.
Proof. unfold qcp_fmax_rvv_ne_safety_wit_7; try left; intros; unfold same_bits in *; subst; unfold mm_rvv_ne; scalar_cases; scalar_finish. Qed.
Lemma proof_of_qcp_fmax_rvv_ne_safety_wit_8 : qcp_fmax_rvv_ne_safety_wit_8.
Proof. unfold qcp_fmax_rvv_ne_safety_wit_8; try left; intros; unfold same_bits in *; subst; unfold mm_rvv_ne; scalar_cases; scalar_finish. Qed.
Lemma proof_of_qcp_fmax_rvv_ne_safety_wit_9 : qcp_fmax_rvv_ne_safety_wit_9.
Proof. unfold qcp_fmax_rvv_ne_safety_wit_9; try left; intros; unfold same_bits in *; subst; unfold mm_rvv_ne; scalar_cases; scalar_finish. Qed.
Lemma proof_of_qcp_fmax_rvv_ne_safety_wit_10 : qcp_fmax_rvv_ne_safety_wit_10.
Proof. unfold qcp_fmax_rvv_ne_safety_wit_10; try left; intros; unfold same_bits in *; subst; unfold mm_rvv_ne; scalar_cases; scalar_finish. Qed.
Lemma proof_of_qcp_fmax_rvv_ne_safety_wit_11 : qcp_fmax_rvv_ne_safety_wit_11.
Proof. unfold qcp_fmax_rvv_ne_safety_wit_11; try left; intros; unfold same_bits in *; subst; unfold mm_rvv_ne; scalar_cases; scalar_finish. Qed.
Lemma proof_of_qcp_fmax_rvv_ne_return_wit_1 : qcp_fmax_rvv_ne_return_wit_1.
Proof. unfold qcp_fmax_rvv_ne_return_wit_1; try left; intros; unfold same_bits in *; subst; unfold mm_rvv_ne; scalar_cases; scalar_finish. Qed.
Lemma proof_of_qcp_fmax_rvv_ne_return_wit_2 : qcp_fmax_rvv_ne_return_wit_2.
Proof. unfold qcp_fmax_rvv_ne_return_wit_2; try left; intros; unfold same_bits in *; subst; unfold mm_rvv_ne; scalar_cases; scalar_finish. Qed.
Lemma proof_of_qcp_fmax_rvv_ne_return_wit_3 : qcp_fmax_rvv_ne_return_wit_3.
Proof. unfold qcp_fmax_rvv_ne_return_wit_3; try left; intros; unfold same_bits in *; subst; unfold mm_rvv_ne; scalar_cases; scalar_finish. Qed.
Lemma proof_of_qcp_fmax_rvv_ne_return_wit_4 : qcp_fmax_rvv_ne_return_wit_4.
Proof. unfold qcp_fmax_rvv_ne_return_wit_4; try left; intros; unfold same_bits in *; subst; unfold mm_rvv_ne; scalar_cases; scalar_finish. Qed.
Lemma proof_of_qcp_fmax_rvv_ne_return_wit_5 : qcp_fmax_rvv_ne_return_wit_5.
Proof. unfold qcp_fmax_rvv_ne_return_wit_5; try left; intros; unfold same_bits in *; subst; unfold mm_rvv_ne; scalar_cases; scalar_finish. Qed.
Lemma proof_of_qcp_fmax_rvv_ne_return_wit_6 : qcp_fmax_rvv_ne_return_wit_6.
Proof. unfold qcp_fmax_rvv_ne_return_wit_6; try left; intros; unfold same_bits in *; subst; unfold mm_rvv_ne; scalar_cases; scalar_finish. Qed.
Lemma proof_of_qcp_fmax_rvv_ne_partial_solve_wit_1 : qcp_fmax_rvv_ne_partial_solve_wit_1.
Proof. unfold qcp_fmax_rvv_ne_partial_solve_wit_1; try left; intros; unfold same_bits in *; subst; unfold mm_rvv_ne; scalar_cases; scalar_finish. Qed.
Lemma proof_of_qcp_fmax_rvv_ne_partial_solve_wit_2 : qcp_fmax_rvv_ne_partial_solve_wit_2.
Proof. unfold qcp_fmax_rvv_ne_partial_solve_wit_2; try left; intros; unfold same_bits in *; subst; unfold mm_rvv_ne; scalar_cases; scalar_finish. Qed.
Lemma proof_of_qcp_fmax_rvv_ne_partial_solve_wit_3 : qcp_fmax_rvv_ne_partial_solve_wit_3.
Proof. unfold qcp_fmax_rvv_ne_partial_solve_wit_3; try left; intros; unfold same_bits in *; subst; unfold mm_rvv_ne; scalar_cases; scalar_finish. Qed.
Lemma proof_of_qcp_fmax_rvv_ne_partial_solve_wit_4 : qcp_fmax_rvv_ne_partial_solve_wit_4.
Proof. unfold qcp_fmax_rvv_ne_partial_solve_wit_4; try left; intros; unfold same_bits in *; subst; unfold mm_rvv_ne; scalar_cases; scalar_finish. Qed.
Lemma proof_of_qcp_fmax_rvv_ne_partial_solve_wit_5 : qcp_fmax_rvv_ne_partial_solve_wit_5.
Proof. unfold qcp_fmax_rvv_ne_partial_solve_wit_5; try left; intros; unfold same_bits in *; subst; unfold mm_rvv_ne; scalar_cases; scalar_finish. Qed.
Lemma proof_of_qcp_fmax_rvv_ne_partial_solve_wit_6 : qcp_fmax_rvv_ne_partial_solve_wit_6.
Proof. unfold qcp_fmax_rvv_ne_partial_solve_wit_6; try left; intros; unfold same_bits in *; subst; unfold mm_rvv_ne; scalar_cases; scalar_finish. Qed.
End CheckedScalar.
