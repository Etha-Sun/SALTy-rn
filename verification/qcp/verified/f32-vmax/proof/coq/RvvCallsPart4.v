From FMax Require Import RvvCallsSupport.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedRvvCallsPart4.
Lemma proof_of_test_rvv_safety_wit_4 : FMax.rvv_unit_goal.test_rvv_safety_wit_4.
Proof. unfold FMax.rvv_unit_goal.test_rvv_safety_wit_4;try left;intros;cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;unfold same_bits,fp32_bits_equal in *;subst;unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia. Qed.
Lemma proof_of_test_rvv_safety_wit_9 : FMax.rvv_unit_goal.test_rvv_safety_wit_9.
Proof. unfold FMax.rvv_unit_goal.test_rvv_safety_wit_9;try left;intros;cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;unfold same_bits,fp32_bits_equal in *;subst;unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_1_pure : FMax.rvv_unit_goal.test_rvv_partial_solve_wit_1_pure.
Proof. unfold FMax.rvv_unit_goal.test_rvv_partial_solve_wit_1_pure;try left;intros;cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;unfold same_bits,fp32_bits_equal in *;subst;unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_3 : FMax.rvv_unit_goal.test_rvv_partial_solve_wit_3.
Proof. unfold FMax.rvv_unit_goal.test_rvv_partial_solve_wit_3, FMax.rvv_unit_goal.test_rvv_partial_solve_wit_3_aux;try left;intros;unfold same_bits,fp32_bits_equal in *;subst;
 unfold UndefStructPredvfloat32m8_t,UndefStructPredvbool4_t;
 rewrite ?local_field_address;repeat progress rewrite <- logic_equiv_andp_assoc;
 first[apply _derivable1_andp_intros;
 [unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
 |opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel]. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_6 : FMax.rvv_unit_goal.test_rvv_partial_solve_wit_6.
Proof. unfold FMax.rvv_unit_goal.test_rvv_partial_solve_wit_6;try left;intros;unfold same_bits,fp32_bits_equal in *;subst;
 unfold UndefStructPredvfloat32m8_t,UndefStructPredvbool4_t;
 rewrite ?local_field_address;repeat progress rewrite <- logic_equiv_andp_assoc;
 first[apply _derivable1_andp_intros;
 [unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
 |opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel]. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_9 : FMax.rvv_unit_goal.test_rvv_partial_solve_wit_9.
Proof. unfold FMax.rvv_unit_goal.test_rvv_partial_solve_wit_9, FMax.rvv_unit_goal.test_rvv_partial_solve_wit_9_aux;try left;intros;unfold same_bits,fp32_bits_equal in *;subst;
 unfold UndefStructPredvfloat32m8_t,UndefStructPredvbool4_t;
 rewrite ?local_field_address;repeat progress rewrite <- logic_equiv_andp_assoc;
 first[apply _derivable1_andp_intros;
 [unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
 |opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel]. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_13_pure : FMax.rvv_unit_goal.test_rvv_partial_solve_wit_13_pure.
Proof. unfold FMax.rvv_unit_goal.test_rvv_partial_solve_wit_13_pure;try left;intros;cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;unfold same_bits,fp32_bits_equal in *;subst;unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_16 : FMax.rvv_unit_goal.test_rvv_partial_solve_wit_16.
Proof. unfold FMax.rvv_unit_goal.test_rvv_partial_solve_wit_16;try left;intros;unfold same_bits,fp32_bits_equal in *;subst;
 unfold UndefStructPredvfloat32m8_t,UndefStructPredvbool4_t;
 rewrite ?local_field_address;repeat progress rewrite <- logic_equiv_andp_assoc;
 first[apply _derivable1_andp_intros;
 [unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
 |opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel]. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_19 : FMax.rvv_unit_goal.test_rvv_partial_solve_wit_19.
Proof. unfold FMax.rvv_unit_goal.test_rvv_partial_solve_wit_19, FMax.rvv_unit_goal.test_rvv_partial_solve_wit_19_aux;try left;intros;unfold same_bits,fp32_bits_equal in *;subst;
 unfold UndefStructPredvfloat32m8_t,UndefStructPredvbool4_t;
 rewrite ?local_field_address;repeat progress rewrite <- logic_equiv_andp_assoc;
 first[apply _derivable1_andp_intros;
 [unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
 |opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel]. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_23_pure : FMax.rvv_unit_goal.test_rvv_partial_solve_wit_23_pure.
Proof. unfold FMax.rvv_unit_goal.test_rvv_partial_solve_wit_23_pure;try left;intros;cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;unfold same_bits,fp32_bits_equal in *;subst;unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia. Qed.
End CheckedRvvCallsPart4.
