From FMax Require Import RvvCallsSupport.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedRvvCallsPart5.
Lemma proof_of_test_rvv_safety_wit_5 : FMax.rvv_unit_goal.test_rvv_safety_wit_5.
Proof. unfold FMax.rvv_unit_goal.test_rvv_safety_wit_5;try left;intros;cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;unfold same_bits,fp32_bits_equal in *;subst;unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia. Qed.
Lemma proof_of_test_rvv_safety_wit_10 : FMax.rvv_unit_goal.test_rvv_safety_wit_10.
Proof. unfold FMax.rvv_unit_goal.test_rvv_safety_wit_10;try left;intros;cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;unfold same_bits,fp32_bits_equal in *;subst;unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_1 : FMax.rvv_unit_goal.test_rvv_partial_solve_wit_1.
Proof. unfold FMax.rvv_unit_goal.test_rvv_partial_solve_wit_1, FMax.rvv_unit_goal.test_rvv_partial_solve_wit_1_aux;try left;intros;unfold same_bits,fp32_bits_equal in *;subst;
 unfold UndefStructPredvfloat32m8_t,UndefStructPredvbool4_t;
 rewrite ?local_field_address;repeat progress rewrite <- logic_equiv_andp_assoc;
 first[apply _derivable1_andp_intros;
 [unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
 |opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel]. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_4_pure : FMax.rvv_unit_goal.test_rvv_partial_solve_wit_4_pure.
Proof. unfold FMax.rvv_unit_goal.test_rvv_partial_solve_wit_4_pure;try left;intros;cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;unfold same_bits,fp32_bits_equal in *;subst;unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_7_pure : FMax.rvv_unit_goal.test_rvv_partial_solve_wit_7_pure.
Proof. unfold FMax.rvv_unit_goal.test_rvv_partial_solve_wit_7_pure;try left;intros;cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;unfold same_bits,fp32_bits_equal in *;subst;unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_10 : FMax.rvv_unit_goal.test_rvv_partial_solve_wit_10.
Proof. unfold FMax.rvv_unit_goal.test_rvv_partial_solve_wit_10;try left;intros;unfold same_bits,fp32_bits_equal in *;subst;
 unfold UndefStructPredvfloat32m8_t,UndefStructPredvbool4_t;
 rewrite ?local_field_address;repeat progress rewrite <- logic_equiv_andp_assoc;
 first[apply _derivable1_andp_intros;
 [unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
 |opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel]. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_13 : FMax.rvv_unit_goal.test_rvv_partial_solve_wit_13.
Proof. unfold FMax.rvv_unit_goal.test_rvv_partial_solve_wit_13, FMax.rvv_unit_goal.test_rvv_partial_solve_wit_13_aux;try left;intros;unfold same_bits,fp32_bits_equal in *;subst;
 unfold UndefStructPredvfloat32m8_t,UndefStructPredvbool4_t;
 rewrite ?local_field_address;repeat progress rewrite <- logic_equiv_andp_assoc;
 first[apply _derivable1_andp_intros;
 [unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
 |opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel]. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_17_pure : FMax.rvv_unit_goal.test_rvv_partial_solve_wit_17_pure.
Proof. unfold FMax.rvv_unit_goal.test_rvv_partial_solve_wit_17_pure;try left;intros;cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;unfold same_bits,fp32_bits_equal in *;subst;unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_20 : FMax.rvv_unit_goal.test_rvv_partial_solve_wit_20.
Proof. unfold FMax.rvv_unit_goal.test_rvv_partial_solve_wit_20;try left;intros;unfold same_bits,fp32_bits_equal in *;subst;
 unfold UndefStructPredvfloat32m8_t,UndefStructPredvbool4_t;
 rewrite ?local_field_address;repeat progress rewrite <- logic_equiv_andp_assoc;
 first[apply _derivable1_andp_intros;
 [unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
 |opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel]. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_23 : FMax.rvv_unit_goal.test_rvv_partial_solve_wit_23.
Proof. unfold FMax.rvv_unit_goal.test_rvv_partial_solve_wit_23, FMax.rvv_unit_goal.test_rvv_partial_solve_wit_23_aux;try left;intros;unfold same_bits,fp32_bits_equal in *;subst;
 unfold UndefStructPredvfloat32m8_t,UndefStructPredvbool4_t;
 rewrite ?local_field_address;repeat progress rewrite <- logic_equiv_andp_assoc;
 first[apply _derivable1_andp_intros;
 [unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
 |opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel]. Qed.
End CheckedRvvCallsPart5.
