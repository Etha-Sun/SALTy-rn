From FMax Require Import RvvCallsSupport.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedRvvCallsPart3.
Lemma proof_of_test_rvv_safety_wit_3 : FMax.rvv_unit_goal.test_rvv_safety_wit_3.
Proof. unfold FMax.rvv_unit_goal.test_rvv_safety_wit_3;try left;intros;cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;unfold same_bits,fp32_bits_equal in *;subst;unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia. Qed.
Lemma proof_of_test_rvv_safety_wit_8 : FMax.rvv_unit_goal.test_rvv_safety_wit_8.
Proof. unfold FMax.rvv_unit_goal.test_rvv_safety_wit_8;try left;intros;cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;unfold same_bits,fp32_bits_equal in *;subst;unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia. Qed.
Lemma proof_of_test_rvv_safety_wit_13 : FMax.rvv_unit_goal.test_rvv_safety_wit_13.
Proof. unfold FMax.rvv_unit_goal.test_rvv_safety_wit_13;try left;intros;cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;unfold same_bits,fp32_bits_equal in *;subst;unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_3_pure : FMax.rvv_unit_goal.test_rvv_partial_solve_wit_3_pure.
Proof. unfold FMax.rvv_unit_goal.test_rvv_partial_solve_wit_3_pure;try left;intros;cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;unfold same_bits,fp32_bits_equal in *;subst;unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_5 : FMax.rvv_unit_goal.test_rvv_partial_solve_wit_5.
Proof. unfold FMax.rvv_unit_goal.test_rvv_partial_solve_wit_5, FMax.rvv_unit_goal.test_rvv_partial_solve_wit_5_aux;try left;intros;unfold same_bits,fp32_bits_equal in *;subst;
 unfold UndefStructPredvfloat32m8_t,UndefStructPredvbool4_t;
 rewrite ?local_field_address;repeat progress rewrite <- logic_equiv_andp_assoc;
 first[apply _derivable1_andp_intros;
 [unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
 |opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel]. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_9_pure : FMax.rvv_unit_goal.test_rvv_partial_solve_wit_9_pure.
Proof. unfold FMax.rvv_unit_goal.test_rvv_partial_solve_wit_9_pure;try left;intros;cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;unfold same_bits,fp32_bits_equal in *;subst;unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_12 : FMax.rvv_unit_goal.test_rvv_partial_solve_wit_12.
Proof. unfold FMax.rvv_unit_goal.test_rvv_partial_solve_wit_12;try left;intros;unfold same_bits,fp32_bits_equal in *;subst;
 unfold UndefStructPredvfloat32m8_t,UndefStructPredvbool4_t;
 rewrite ?local_field_address;repeat progress rewrite <- logic_equiv_andp_assoc;
 first[apply _derivable1_andp_intros;
 [unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
 |opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel]. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_15 : FMax.rvv_unit_goal.test_rvv_partial_solve_wit_15.
Proof. unfold FMax.rvv_unit_goal.test_rvv_partial_solve_wit_15, FMax.rvv_unit_goal.test_rvv_partial_solve_wit_15_aux;try left;intros;unfold same_bits,fp32_bits_equal in *;subst;
 unfold UndefStructPredvfloat32m8_t,UndefStructPredvbool4_t;
 rewrite ?local_field_address;repeat progress rewrite <- logic_equiv_andp_assoc;
 first[apply _derivable1_andp_intros;
 [unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
 |opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel]. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_19_pure : FMax.rvv_unit_goal.test_rvv_partial_solve_wit_19_pure.
Proof. unfold FMax.rvv_unit_goal.test_rvv_partial_solve_wit_19_pure;try left;intros;cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;unfold same_bits,fp32_bits_equal in *;subst;unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_22 : FMax.rvv_unit_goal.test_rvv_partial_solve_wit_22.
Proof. unfold FMax.rvv_unit_goal.test_rvv_partial_solve_wit_22;try left;intros;unfold same_bits,fp32_bits_equal in *;subst;
 unfold UndefStructPredvfloat32m8_t,UndefStructPredvbool4_t;
 rewrite ?local_field_address;repeat progress rewrite <- logic_equiv_andp_assoc;
 first[apply _derivable1_andp_intros;
 [unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
 |opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel]. Qed.
End CheckedRvvCallsPart3.
