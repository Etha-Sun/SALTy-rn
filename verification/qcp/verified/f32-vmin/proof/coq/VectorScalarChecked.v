From Coq Require Import ZArith Lia.
From FMin Require Import Bits Model Types VectorModel VectorFastFrame vector_primitives_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac vector_frame :=
 unfold UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t,
  UndefStructPredvfloat32m8_t, UndefStructPredvbool4_t;
 rewrite ?local_field_address;
 repeat progress rewrite <- logic_equiv_andp_assoc;
 first [apply _derivable1_andp_intros;
 [unfold derivable1,andp,coq_prop; intros;
  repeat first [assumption|split|reflexivity];lia
 |opaque_leaves; sepcon_assoc_change; fast_cancel]
 |opaque_leaves; sepcon_assoc_change; fast_cancel].
Module CheckedVectorScalar.
Lemma proof_of_qcp_fmin_active_min_return_wit_1 : qcp_fmin_active_min_return_wit_1.
Proof. unfold qcp_fmin_active_min_return_wit_1; try left; intros; unfold same_bits in *; subst;
 unfold mm_active_min;
 repeat match goal with
 | |- context[Z.ltb ?a ?b] => destruct (Z.ltb_spec a b)
 | |- context[Z.eqb ?a ?b] => destruct (Z.eqb_spec a b)
 end;
 unfold fp32_zero; entailer!; try lia. Qed.
Lemma proof_of_qcp_fmin_active_min_return_wit_2 : qcp_fmin_active_min_return_wit_2.
Proof. unfold qcp_fmin_active_min_return_wit_2; try left; intros; unfold same_bits in *; subst;
 unfold mm_active_min;
 repeat match goal with
 | |- context[Z.ltb ?a ?b] => destruct (Z.ltb_spec a b)
 | |- context[Z.eqb ?a ?b] => destruct (Z.eqb_spec a b)
 end;
 unfold fp32_zero; entailer!; try lia. Qed.
Lemma proof_of_qcp_fmin_active_min_partial_solve_wit_1 : qcp_fmin_active_min_partial_solve_wit_1.
Proof. unfold qcp_fmin_active_min_partial_solve_wit_1; try left; intros; unfold same_bits in *; subst;
 unfold mm_active_min;
 repeat match goal with
 | |- context[Z.ltb ?a ?b] => destruct (Z.ltb_spec a b)
 | |- context[Z.eqb ?a ?b] => destruct (Z.eqb_spec a b)
 end;
 unfold fp32_zero; entailer!; try lia. Qed.
Lemma proof_of_qcp_fmin_active_min_partial_solve_wit_2 : qcp_fmin_active_min_partial_solve_wit_2.
Proof. unfold qcp_fmin_active_min_partial_solve_wit_2; try left; intros; unfold same_bits in *; subst;
 unfold mm_active_min;
 repeat match goal with
 | |- context[Z.ltb ?a ?b] => destruct (Z.ltb_spec a b)
 | |- context[Z.eqb ?a ?b] => destruct (Z.eqb_spec a b)
 end;
 unfold fp32_zero; entailer!; try lia. Qed.
Lemma proof_of_qcp_fmin_active_add_return_wit_1 : qcp_fmin_active_add_return_wit_1.
Proof. unfold qcp_fmin_active_add_return_wit_1; try left; intros; unfold same_bits in *; subst;
 unfold mm_active_add;
 repeat match goal with
 | |- context[Z.ltb ?a ?b] => destruct (Z.ltb_spec a b)
 | |- context[Z.eqb ?a ?b] => destruct (Z.eqb_spec a b)
 end;
 unfold fp32_zero; entailer!; try lia. Qed.
Lemma proof_of_qcp_fmin_active_add_return_wit_2 : qcp_fmin_active_add_return_wit_2.
Proof. unfold qcp_fmin_active_add_return_wit_2; try left; intros; unfold same_bits in *; subst;
 unfold mm_active_add;
 repeat match goal with
 | |- context[Z.ltb ?a ?b] => destruct (Z.ltb_spec a b)
 | |- context[Z.eqb ?a ?b] => destruct (Z.eqb_spec a b)
 end;
 unfold fp32_zero; entailer!; try lia. Qed.
Lemma proof_of_qcp_fmin_active_add_partial_solve_wit_1 : qcp_fmin_active_add_partial_solve_wit_1.
Proof. unfold qcp_fmin_active_add_partial_solve_wit_1; try left; intros; unfold same_bits in *; subst;
 unfold mm_active_add;
 repeat match goal with
 | |- context[Z.ltb ?a ?b] => destruct (Z.ltb_spec a b)
 | |- context[Z.eqb ?a ?b] => destruct (Z.eqb_spec a b)
 end;
 unfold fp32_zero; entailer!; try lia. Qed.
Lemma proof_of_qcp_fmin_active_add_partial_solve_wit_2 : qcp_fmin_active_add_partial_solve_wit_2.
Proof. unfold qcp_fmin_active_add_partial_solve_wit_2; try left; intros; unfold same_bits in *; subst;
 unfold mm_active_add;
 repeat match goal with
 | |- context[Z.ltb ?a ?b] => destruct (Z.ltb_spec a b)
 | |- context[Z.eqb ?a ?b] => destruct (Z.eqb_spec a b)
 end;
 unfold fp32_zero; entailer!; try lia. Qed.
Lemma proof_of_qcp_fmin_active_ne_safety_wit_1 : qcp_fmin_active_ne_safety_wit_1.
Proof. unfold qcp_fmin_active_ne_safety_wit_1; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 try change Int64.max_unsigned with 18446744073709551615 in *;
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *;
 unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of_qcp_fmin_active_ne_return_wit_1 : qcp_fmin_active_ne_return_wit_1.
Proof. unfold qcp_fmin_active_ne_return_wit_1; try left; intros; unfold same_bits in *; subst;
 unfold mm_active_ne;
 repeat match goal with
 | |- context[Z.ltb ?a ?b] => destruct (Z.ltb_spec a b)
 | |- context[Z.eqb ?a ?b] => destruct (Z.eqb_spec a b)
 end;
 unfold fp32_zero; entailer!; try lia. Qed.
Lemma proof_of_qcp_fmin_active_ne_return_wit_2 : qcp_fmin_active_ne_return_wit_2.
Proof. unfold qcp_fmin_active_ne_return_wit_2; try left; intros; unfold same_bits in *; subst;
 unfold mm_active_ne;
 repeat match goal with
 | |- context[Z.ltb ?a ?b] => destruct (Z.ltb_spec a b)
 | |- context[Z.eqb ?a ?b] => destruct (Z.eqb_spec a b)
 end;
 unfold fp32_zero; entailer!; try lia. Qed.
Lemma proof_of_qcp_fmin_active_ne_partial_solve_wit_1 : qcp_fmin_active_ne_partial_solve_wit_1.
Proof. unfold qcp_fmin_active_ne_partial_solve_wit_1; try left; intros; unfold same_bits in *; subst;
 unfold mm_active_ne;
 repeat match goal with
 | |- context[Z.ltb ?a ?b] => destruct (Z.ltb_spec a b)
 | |- context[Z.eqb ?a ?b] => destruct (Z.eqb_spec a b)
 end;
 unfold fp32_zero; entailer!; try lia. Qed.
Lemma proof_of_qcp_fmin_active_merge_safety_wit_1 : qcp_fmin_active_merge_safety_wit_1.
Proof. unfold qcp_fmin_active_merge_safety_wit_1; try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 try change Int64.max_unsigned with 18446744073709551615 in *;
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *;
 unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia. Qed.
Lemma proof_of_qcp_fmin_active_merge_return_wit_1 : qcp_fmin_active_merge_return_wit_1.
Proof. unfold qcp_fmin_active_merge_return_wit_1; try left; intros; unfold same_bits in *; subst;
 unfold mm_active_merge;
 repeat match goal with
 | |- context[Z.ltb ?a ?b] => destruct (Z.ltb_spec a b)
 | |- context[Z.eqb ?a ?b] => destruct (Z.eqb_spec a b)
 end;
 unfold fp32_zero; entailer!; try lia. Qed.
Lemma proof_of_qcp_fmin_active_merge_return_wit_2 : qcp_fmin_active_merge_return_wit_2.
Proof. unfold qcp_fmin_active_merge_return_wit_2; try left; intros; unfold same_bits in *; subst;
 unfold mm_active_merge;
 repeat match goal with
 | |- context[Z.ltb ?a ?b] => destruct (Z.ltb_spec a b)
 | |- context[Z.eqb ?a ?b] => destruct (Z.eqb_spec a b)
 end;
 unfold fp32_zero; entailer!; try lia. Qed.
Lemma proof_of_qcp_fmin_active_merge_return_wit_3 : qcp_fmin_active_merge_return_wit_3.
Proof. unfold qcp_fmin_active_merge_return_wit_3; try left; intros; unfold same_bits in *; subst;
 unfold mm_active_merge;
 repeat match goal with
 | |- context[Z.ltb ?a ?b] => destruct (Z.ltb_spec a b)
 | |- context[Z.eqb ?a ?b] => destruct (Z.eqb_spec a b)
 end;
 unfold fp32_zero; entailer!; try lia. Qed.
Lemma proof_of_qcp_fmin_active_merge_partial_solve_wit_1 : qcp_fmin_active_merge_partial_solve_wit_1.
Proof. unfold qcp_fmin_active_merge_partial_solve_wit_1; try left; intros; unfold same_bits in *; subst;
 unfold mm_active_merge;
 repeat match goal with
 | |- context[Z.ltb ?a ?b] => destruct (Z.ltb_spec a b)
 | |- context[Z.eqb ?a ?b] => destruct (Z.eqb_spec a b)
 end;
 unfold fp32_zero; entailer!; try lia. Qed.
End CheckedVectorScalar.
