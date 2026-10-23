From FMax Require Import RvvCallsSupport.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedRvvCallsPart1.
Lemma proof_of_test_rvv_safety_wit_1 : FMax.rvv_unit_goal.test_rvv_safety_wit_1.
Proof. unfold FMax.rvv_unit_goal.test_rvv_safety_wit_1;try left;intros;cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;unfold same_bits,fp32_bits_equal in *;subst;unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia. Qed.
Lemma proof_of_test_rvv_safety_wit_6 : FMax.rvv_unit_goal.test_rvv_safety_wit_6.
Proof. unfold FMax.rvv_unit_goal.test_rvv_safety_wit_6;try left;intros;cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;unfold same_bits,fp32_bits_equal in *;subst;unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia. Qed.
Lemma proof_of_test_rvv_safety_wit_11 : FMax.rvv_unit_goal.test_rvv_safety_wit_11.
Proof. unfold FMax.rvv_unit_goal.test_rvv_safety_wit_11;try left;intros;cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;unfold same_bits,fp32_bits_equal in *;subst;unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_2_pure : FMax.rvv_unit_goal.test_rvv_partial_solve_wit_2_pure.
Proof. unfold FMax.rvv_unit_goal.test_rvv_partial_solve_wit_2_pure;try left;intros;cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;unfold same_bits,fp32_bits_equal in *;subst;unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_4 : FMax.rvv_unit_goal.test_rvv_partial_solve_wit_4.
Proof. unfold FMax.rvv_unit_goal.test_rvv_partial_solve_wit_4, FMax.rvv_unit_goal.test_rvv_partial_solve_wit_4_aux;try left;intros;unfold same_bits,fp32_bits_equal in *;subst;
 unfold UndefStructPredvfloat32m8_t,UndefStructPredvbool4_t;
 rewrite ?local_field_address;repeat progress rewrite <- logic_equiv_andp_assoc;
 first[apply _derivable1_andp_intros;
 [unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
 |opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel]. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_7 : FMax.rvv_unit_goal.test_rvv_partial_solve_wit_7.
Proof. unfold FMax.rvv_unit_goal.test_rvv_partial_solve_wit_7, FMax.rvv_unit_goal.test_rvv_partial_solve_wit_7_aux;try left;intros;unfold same_bits,fp32_bits_equal in *;subst;
 unfold UndefStructPredvfloat32m8_t,UndefStructPredvbool4_t;
 rewrite ?local_field_address;repeat progress rewrite <- logic_equiv_andp_assoc;
 first[apply _derivable1_andp_intros;
 [unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
 |opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel]. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_11_pure : FMax.rvv_unit_goal.test_rvv_partial_solve_wit_11_pure.
Proof. unfold FMax.rvv_unit_goal.test_rvv_partial_solve_wit_11_pure;try left;intros;cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;unfold same_bits,fp32_bits_equal in *;subst;unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_14 : FMax.rvv_unit_goal.test_rvv_partial_solve_wit_14.
Proof. unfold FMax.rvv_unit_goal.test_rvv_partial_solve_wit_14;try left;intros;unfold same_bits,fp32_bits_equal in *;subst;
 unfold UndefStructPredvfloat32m8_t,UndefStructPredvbool4_t;
 rewrite ?local_field_address;repeat progress rewrite <- logic_equiv_andp_assoc;
 first[apply _derivable1_andp_intros;
 [unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
 |opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel]. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_17 : FMax.rvv_unit_goal.test_rvv_partial_solve_wit_17.
Proof. unfold FMax.rvv_unit_goal.test_rvv_partial_solve_wit_17, FMax.rvv_unit_goal.test_rvv_partial_solve_wit_17_aux;try left;intros;unfold same_bits,fp32_bits_equal in *;subst;
 unfold UndefStructPredvfloat32m8_t,UndefStructPredvbool4_t;
 rewrite ?local_field_address;repeat progress rewrite <- logic_equiv_andp_assoc;
 first[apply _derivable1_andp_intros;
 [unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
 |opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel]. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_21_pure : FMax.rvv_unit_goal.test_rvv_partial_solve_wit_21_pure.
Proof. unfold FMax.rvv_unit_goal.test_rvv_partial_solve_wit_21_pure;try left;intros;cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;unfold same_bits,fp32_bits_equal in *;subst;unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia. Qed.
End CheckedRvvCallsPart1.
