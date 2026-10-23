From Coq Require Import ZArith Lia.
From FMin Require Import Bits Types ProgramModel VectorFastFrame rvv_unit_goal.
From QcpVadd Require Import VaddBits.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedRvvCalls.
Lemma proof_of_test_rvv_safety_wit_1 : FMin.rvv_unit_goal.test_rvv_safety_wit_1.
Proof. unfold FMin.rvv_unit_goal.test_rvv_safety_wit_1;try left;intros;cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;unfold same_bits,fp32_bits_equal in *;subst;unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia. Qed.
Lemma proof_of_test_rvv_safety_wit_2 : FMin.rvv_unit_goal.test_rvv_safety_wit_2.
Proof. unfold FMin.rvv_unit_goal.test_rvv_safety_wit_2;try left;intros;cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;unfold same_bits,fp32_bits_equal in *;subst;unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia. Qed.
Lemma proof_of_test_rvv_safety_wit_3 : FMin.rvv_unit_goal.test_rvv_safety_wit_3.
Proof. unfold FMin.rvv_unit_goal.test_rvv_safety_wit_3;try left;intros;cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;unfold same_bits,fp32_bits_equal in *;subst;unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia. Qed.
Lemma proof_of_test_rvv_safety_wit_4 : FMin.rvv_unit_goal.test_rvv_safety_wit_4.
Proof. unfold FMin.rvv_unit_goal.test_rvv_safety_wit_4;try left;intros;cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;unfold same_bits,fp32_bits_equal in *;subst;unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia. Qed.
Lemma proof_of_test_rvv_safety_wit_5 : FMin.rvv_unit_goal.test_rvv_safety_wit_5.
Proof. unfold FMin.rvv_unit_goal.test_rvv_safety_wit_5;try left;intros;cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;unfold same_bits,fp32_bits_equal in *;subst;unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia. Qed.
Lemma proof_of_test_rvv_safety_wit_6 : FMin.rvv_unit_goal.test_rvv_safety_wit_6.
Proof. unfold FMin.rvv_unit_goal.test_rvv_safety_wit_6;try left;intros;cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;unfold same_bits,fp32_bits_equal in *;subst;unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia. Qed.
Lemma proof_of_test_rvv_safety_wit_7 : FMin.rvv_unit_goal.test_rvv_safety_wit_7.
Proof. unfold FMin.rvv_unit_goal.test_rvv_safety_wit_7;try left;intros;cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;unfold same_bits,fp32_bits_equal in *;subst;unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia. Qed.
Lemma proof_of_test_rvv_safety_wit_8 : FMin.rvv_unit_goal.test_rvv_safety_wit_8.
Proof. unfold FMin.rvv_unit_goal.test_rvv_safety_wit_8;try left;intros;cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;unfold same_bits,fp32_bits_equal in *;subst;unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia. Qed.
Lemma proof_of_test_rvv_safety_wit_9 : FMin.rvv_unit_goal.test_rvv_safety_wit_9.
Proof. unfold FMin.rvv_unit_goal.test_rvv_safety_wit_9;try left;intros;cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;unfold same_bits,fp32_bits_equal in *;subst;unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia. Qed.
Lemma proof_of_test_rvv_safety_wit_10 : FMin.rvv_unit_goal.test_rvv_safety_wit_10.
Proof. unfold FMin.rvv_unit_goal.test_rvv_safety_wit_10;try left;intros;cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;unfold same_bits,fp32_bits_equal in *;subst;unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia. Qed.
Lemma proof_of_test_rvv_safety_wit_11 : FMin.rvv_unit_goal.test_rvv_safety_wit_11.
Proof. unfold FMin.rvv_unit_goal.test_rvv_safety_wit_11;try left;intros;cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;unfold same_bits,fp32_bits_equal in *;subst;unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia. Qed.
Lemma proof_of_test_rvv_safety_wit_12 : FMin.rvv_unit_goal.test_rvv_safety_wit_12.
Proof. unfold FMin.rvv_unit_goal.test_rvv_safety_wit_12;try left;intros;cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;unfold same_bits,fp32_bits_equal in *;subst;unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia. Qed.
Lemma proof_of_test_rvv_safety_wit_13 : FMin.rvv_unit_goal.test_rvv_safety_wit_13.
Proof. unfold FMin.rvv_unit_goal.test_rvv_safety_wit_13;try left;intros;cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;unfold same_bits,fp32_bits_equal in *;subst;unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_1_pure : FMin.rvv_unit_goal.test_rvv_partial_solve_wit_1_pure.
Proof. unfold FMin.rvv_unit_goal.test_rvv_partial_solve_wit_1_pure;try left;intros;cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;unfold same_bits,fp32_bits_equal in *;subst;unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_1 : FMin.rvv_unit_goal.test_rvv_partial_solve_wit_1.
Proof. unfold FMin.rvv_unit_goal.test_rvv_partial_solve_wit_1, FMin.rvv_unit_goal.test_rvv_partial_solve_wit_1_aux;try left;intros;unfold same_bits,fp32_bits_equal in *;subst;
 unfold UndefStructPredvfloat32m8_t,UndefStructPredvbool4_t;
 rewrite ?local_field_address;repeat progress rewrite <- logic_equiv_andp_assoc;
 first[apply _derivable1_andp_intros;
 [unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
 |opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel]. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_2_pure : FMin.rvv_unit_goal.test_rvv_partial_solve_wit_2_pure.
Proof. unfold FMin.rvv_unit_goal.test_rvv_partial_solve_wit_2_pure;try left;intros;cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;unfold same_bits,fp32_bits_equal in *;subst;unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_2 : FMin.rvv_unit_goal.test_rvv_partial_solve_wit_2.
Proof. unfold FMin.rvv_unit_goal.test_rvv_partial_solve_wit_2, FMin.rvv_unit_goal.test_rvv_partial_solve_wit_2_aux;try left;intros;unfold same_bits,fp32_bits_equal in *;subst;
 unfold UndefStructPredvfloat32m8_t,UndefStructPredvbool4_t;
 rewrite ?local_field_address;repeat progress rewrite <- logic_equiv_andp_assoc;
 first[apply _derivable1_andp_intros;
 [unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
 |opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel]. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_3_pure : FMin.rvv_unit_goal.test_rvv_partial_solve_wit_3_pure.
Proof. unfold FMin.rvv_unit_goal.test_rvv_partial_solve_wit_3_pure;try left;intros;cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;unfold same_bits,fp32_bits_equal in *;subst;unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_3 : FMin.rvv_unit_goal.test_rvv_partial_solve_wit_3.
Proof. unfold FMin.rvv_unit_goal.test_rvv_partial_solve_wit_3, FMin.rvv_unit_goal.test_rvv_partial_solve_wit_3_aux;try left;intros;unfold same_bits,fp32_bits_equal in *;subst;
 unfold UndefStructPredvfloat32m8_t,UndefStructPredvbool4_t;
 rewrite ?local_field_address;repeat progress rewrite <- logic_equiv_andp_assoc;
 first[apply _derivable1_andp_intros;
 [unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
 |opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel]. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_4_pure : FMin.rvv_unit_goal.test_rvv_partial_solve_wit_4_pure.
Proof. unfold FMin.rvv_unit_goal.test_rvv_partial_solve_wit_4_pure;try left;intros;cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;unfold same_bits,fp32_bits_equal in *;subst;unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_4 : FMin.rvv_unit_goal.test_rvv_partial_solve_wit_4.
Proof. unfold FMin.rvv_unit_goal.test_rvv_partial_solve_wit_4, FMin.rvv_unit_goal.test_rvv_partial_solve_wit_4_aux;try left;intros;unfold same_bits,fp32_bits_equal in *;subst;
 unfold UndefStructPredvfloat32m8_t,UndefStructPredvbool4_t;
 rewrite ?local_field_address;repeat progress rewrite <- logic_equiv_andp_assoc;
 first[apply _derivable1_andp_intros;
 [unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
 |opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel]. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_5_pure : FMin.rvv_unit_goal.test_rvv_partial_solve_wit_5_pure.
Proof. unfold FMin.rvv_unit_goal.test_rvv_partial_solve_wit_5_pure;try left;intros;cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;unfold same_bits,fp32_bits_equal in *;subst;unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_5 : FMin.rvv_unit_goal.test_rvv_partial_solve_wit_5.
Proof. unfold FMin.rvv_unit_goal.test_rvv_partial_solve_wit_5, FMin.rvv_unit_goal.test_rvv_partial_solve_wit_5_aux;try left;intros;unfold same_bits,fp32_bits_equal in *;subst;
 unfold UndefStructPredvfloat32m8_t,UndefStructPredvbool4_t;
 rewrite ?local_field_address;repeat progress rewrite <- logic_equiv_andp_assoc;
 first[apply _derivable1_andp_intros;
 [unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
 |opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel]. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_6 : FMin.rvv_unit_goal.test_rvv_partial_solve_wit_6.
Proof. unfold FMin.rvv_unit_goal.test_rvv_partial_solve_wit_6;try left;intros;unfold same_bits,fp32_bits_equal in *;subst;
 unfold UndefStructPredvfloat32m8_t,UndefStructPredvbool4_t;
 rewrite ?local_field_address;repeat progress rewrite <- logic_equiv_andp_assoc;
 first[apply _derivable1_andp_intros;
 [unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
 |opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel]. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_7_pure : FMin.rvv_unit_goal.test_rvv_partial_solve_wit_7_pure.
Proof. unfold FMin.rvv_unit_goal.test_rvv_partial_solve_wit_7_pure;try left;intros;cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;unfold same_bits,fp32_bits_equal in *;subst;unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_7 : FMin.rvv_unit_goal.test_rvv_partial_solve_wit_7.
Proof. unfold FMin.rvv_unit_goal.test_rvv_partial_solve_wit_7, FMin.rvv_unit_goal.test_rvv_partial_solve_wit_7_aux;try left;intros;unfold same_bits,fp32_bits_equal in *;subst;
 unfold UndefStructPredvfloat32m8_t,UndefStructPredvbool4_t;
 rewrite ?local_field_address;repeat progress rewrite <- logic_equiv_andp_assoc;
 first[apply _derivable1_andp_intros;
 [unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
 |opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel]. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_8 : FMin.rvv_unit_goal.test_rvv_partial_solve_wit_8.
Proof. unfold FMin.rvv_unit_goal.test_rvv_partial_solve_wit_8;try left;intros;unfold same_bits,fp32_bits_equal in *;subst;
 unfold UndefStructPredvfloat32m8_t,UndefStructPredvbool4_t;
 rewrite ?local_field_address;repeat progress rewrite <- logic_equiv_andp_assoc;
 first[apply _derivable1_andp_intros;
 [unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
 |opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel]. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_9_pure : FMin.rvv_unit_goal.test_rvv_partial_solve_wit_9_pure.
Proof. unfold FMin.rvv_unit_goal.test_rvv_partial_solve_wit_9_pure;try left;intros;cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;unfold same_bits,fp32_bits_equal in *;subst;unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_9 : FMin.rvv_unit_goal.test_rvv_partial_solve_wit_9.
Proof. unfold FMin.rvv_unit_goal.test_rvv_partial_solve_wit_9, FMin.rvv_unit_goal.test_rvv_partial_solve_wit_9_aux;try left;intros;unfold same_bits,fp32_bits_equal in *;subst;
 unfold UndefStructPredvfloat32m8_t,UndefStructPredvbool4_t;
 rewrite ?local_field_address;repeat progress rewrite <- logic_equiv_andp_assoc;
 first[apply _derivable1_andp_intros;
 [unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
 |opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel]. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_10 : FMin.rvv_unit_goal.test_rvv_partial_solve_wit_10.
Proof. unfold FMin.rvv_unit_goal.test_rvv_partial_solve_wit_10;try left;intros;unfold same_bits,fp32_bits_equal in *;subst;
 unfold UndefStructPredvfloat32m8_t,UndefStructPredvbool4_t;
 rewrite ?local_field_address;repeat progress rewrite <- logic_equiv_andp_assoc;
 first[apply _derivable1_andp_intros;
 [unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
 |opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel]. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_11_pure : FMin.rvv_unit_goal.test_rvv_partial_solve_wit_11_pure.
Proof. unfold FMin.rvv_unit_goal.test_rvv_partial_solve_wit_11_pure;try left;intros;cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;unfold same_bits,fp32_bits_equal in *;subst;unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_11 : FMin.rvv_unit_goal.test_rvv_partial_solve_wit_11.
Proof. unfold FMin.rvv_unit_goal.test_rvv_partial_solve_wit_11, FMin.rvv_unit_goal.test_rvv_partial_solve_wit_11_aux;try left;intros;unfold same_bits,fp32_bits_equal in *;subst;
 unfold UndefStructPredvfloat32m8_t,UndefStructPredvbool4_t;
 rewrite ?local_field_address;repeat progress rewrite <- logic_equiv_andp_assoc;
 first[apply _derivable1_andp_intros;
 [unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
 |opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel]. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_12 : FMin.rvv_unit_goal.test_rvv_partial_solve_wit_12.
Proof. unfold FMin.rvv_unit_goal.test_rvv_partial_solve_wit_12;try left;intros;unfold same_bits,fp32_bits_equal in *;subst;
 unfold UndefStructPredvfloat32m8_t,UndefStructPredvbool4_t;
 rewrite ?local_field_address;repeat progress rewrite <- logic_equiv_andp_assoc;
 first[apply _derivable1_andp_intros;
 [unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
 |opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel]. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_13_pure : FMin.rvv_unit_goal.test_rvv_partial_solve_wit_13_pure.
Proof. unfold FMin.rvv_unit_goal.test_rvv_partial_solve_wit_13_pure;try left;intros;cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;unfold same_bits,fp32_bits_equal in *;subst;unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_13 : FMin.rvv_unit_goal.test_rvv_partial_solve_wit_13.
Proof. unfold FMin.rvv_unit_goal.test_rvv_partial_solve_wit_13, FMin.rvv_unit_goal.test_rvv_partial_solve_wit_13_aux;try left;intros;unfold same_bits,fp32_bits_equal in *;subst;
 unfold UndefStructPredvfloat32m8_t,UndefStructPredvbool4_t;
 rewrite ?local_field_address;repeat progress rewrite <- logic_equiv_andp_assoc;
 first[apply _derivable1_andp_intros;
 [unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
 |opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel]. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_14 : FMin.rvv_unit_goal.test_rvv_partial_solve_wit_14.
Proof. unfold FMin.rvv_unit_goal.test_rvv_partial_solve_wit_14;try left;intros;unfold same_bits,fp32_bits_equal in *;subst;
 unfold UndefStructPredvfloat32m8_t,UndefStructPredvbool4_t;
 rewrite ?local_field_address;repeat progress rewrite <- logic_equiv_andp_assoc;
 first[apply _derivable1_andp_intros;
 [unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
 |opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel]. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_15_pure : FMin.rvv_unit_goal.test_rvv_partial_solve_wit_15_pure.
Proof. unfold FMin.rvv_unit_goal.test_rvv_partial_solve_wit_15_pure;try left;intros;cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;unfold same_bits,fp32_bits_equal in *;subst;unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_15 : FMin.rvv_unit_goal.test_rvv_partial_solve_wit_15.
Proof. unfold FMin.rvv_unit_goal.test_rvv_partial_solve_wit_15, FMin.rvv_unit_goal.test_rvv_partial_solve_wit_15_aux;try left;intros;unfold same_bits,fp32_bits_equal in *;subst;
 unfold UndefStructPredvfloat32m8_t,UndefStructPredvbool4_t;
 rewrite ?local_field_address;repeat progress rewrite <- logic_equiv_andp_assoc;
 first[apply _derivable1_andp_intros;
 [unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
 |opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel]. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_16 : FMin.rvv_unit_goal.test_rvv_partial_solve_wit_16.
Proof. unfold FMin.rvv_unit_goal.test_rvv_partial_solve_wit_16;try left;intros;unfold same_bits,fp32_bits_equal in *;subst;
 unfold UndefStructPredvfloat32m8_t,UndefStructPredvbool4_t;
 rewrite ?local_field_address;repeat progress rewrite <- logic_equiv_andp_assoc;
 first[apply _derivable1_andp_intros;
 [unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
 |opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel]. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_17_pure : FMin.rvv_unit_goal.test_rvv_partial_solve_wit_17_pure.
Proof. unfold FMin.rvv_unit_goal.test_rvv_partial_solve_wit_17_pure;try left;intros;cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;unfold same_bits,fp32_bits_equal in *;subst;unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_17 : FMin.rvv_unit_goal.test_rvv_partial_solve_wit_17.
Proof. unfold FMin.rvv_unit_goal.test_rvv_partial_solve_wit_17, FMin.rvv_unit_goal.test_rvv_partial_solve_wit_17_aux;try left;intros;unfold same_bits,fp32_bits_equal in *;subst;
 unfold UndefStructPredvfloat32m8_t,UndefStructPredvbool4_t;
 rewrite ?local_field_address;repeat progress rewrite <- logic_equiv_andp_assoc;
 first[apply _derivable1_andp_intros;
 [unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
 |opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel]. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_18 : FMin.rvv_unit_goal.test_rvv_partial_solve_wit_18.
Proof. unfold FMin.rvv_unit_goal.test_rvv_partial_solve_wit_18;try left;intros;unfold same_bits,fp32_bits_equal in *;subst;
 unfold UndefStructPredvfloat32m8_t,UndefStructPredvbool4_t;
 rewrite ?local_field_address;repeat progress rewrite <- logic_equiv_andp_assoc;
 first[apply _derivable1_andp_intros;
 [unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
 |opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel]. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_19_pure : FMin.rvv_unit_goal.test_rvv_partial_solve_wit_19_pure.
Proof. unfold FMin.rvv_unit_goal.test_rvv_partial_solve_wit_19_pure;try left;intros;cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;unfold same_bits,fp32_bits_equal in *;subst;unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_19 : FMin.rvv_unit_goal.test_rvv_partial_solve_wit_19.
Proof. unfold FMin.rvv_unit_goal.test_rvv_partial_solve_wit_19, FMin.rvv_unit_goal.test_rvv_partial_solve_wit_19_aux;try left;intros;unfold same_bits,fp32_bits_equal in *;subst;
 unfold UndefStructPredvfloat32m8_t,UndefStructPredvbool4_t;
 rewrite ?local_field_address;repeat progress rewrite <- logic_equiv_andp_assoc;
 first[apply _derivable1_andp_intros;
 [unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
 |opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel]. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_20 : FMin.rvv_unit_goal.test_rvv_partial_solve_wit_20.
Proof. unfold FMin.rvv_unit_goal.test_rvv_partial_solve_wit_20;try left;intros;unfold same_bits,fp32_bits_equal in *;subst;
 unfold UndefStructPredvfloat32m8_t,UndefStructPredvbool4_t;
 rewrite ?local_field_address;repeat progress rewrite <- logic_equiv_andp_assoc;
 first[apply _derivable1_andp_intros;
 [unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
 |opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel]. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_21_pure : FMin.rvv_unit_goal.test_rvv_partial_solve_wit_21_pure.
Proof. unfold FMin.rvv_unit_goal.test_rvv_partial_solve_wit_21_pure;try left;intros;cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;unfold same_bits,fp32_bits_equal in *;subst;unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_21 : FMin.rvv_unit_goal.test_rvv_partial_solve_wit_21.
Proof. unfold FMin.rvv_unit_goal.test_rvv_partial_solve_wit_21, FMin.rvv_unit_goal.test_rvv_partial_solve_wit_21_aux;try left;intros;unfold same_bits,fp32_bits_equal in *;subst;
 unfold UndefStructPredvfloat32m8_t,UndefStructPredvbool4_t;
 rewrite ?local_field_address;repeat progress rewrite <- logic_equiv_andp_assoc;
 first[apply _derivable1_andp_intros;
 [unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
 |opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel]. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_22 : FMin.rvv_unit_goal.test_rvv_partial_solve_wit_22.
Proof. unfold FMin.rvv_unit_goal.test_rvv_partial_solve_wit_22;try left;intros;unfold same_bits,fp32_bits_equal in *;subst;
 unfold UndefStructPredvfloat32m8_t,UndefStructPredvbool4_t;
 rewrite ?local_field_address;repeat progress rewrite <- logic_equiv_andp_assoc;
 first[apply _derivable1_andp_intros;
 [unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
 |opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel]. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_23_pure : FMin.rvv_unit_goal.test_rvv_partial_solve_wit_23_pure.
Proof. unfold FMin.rvv_unit_goal.test_rvv_partial_solve_wit_23_pure;try left;intros;cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;unfold same_bits,fp32_bits_equal in *;subst;unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_23 : FMin.rvv_unit_goal.test_rvv_partial_solve_wit_23.
Proof. unfold FMin.rvv_unit_goal.test_rvv_partial_solve_wit_23, FMin.rvv_unit_goal.test_rvv_partial_solve_wit_23_aux;try left;intros;unfold same_bits,fp32_bits_equal in *;subst;
 unfold UndefStructPredvfloat32m8_t,UndefStructPredvbool4_t;
 rewrite ?local_field_address;repeat progress rewrite <- logic_equiv_andp_assoc;
 first[apply _derivable1_andp_intros;
 [unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
 |opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel]. Qed.
End CheckedRvvCalls.
