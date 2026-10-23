From Coq Require Import ZArith Lia.
From VLRelu Require Import Model RvvModel RvvFastFrame rvv_unit_goal.
From QcpRvv32 Require Import RvvLoopModel rvv_loop_pure_checked.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module KernelCalls.
Lemma proof_of_qcp_assert_return_wit_1 : qcp_assert_return_wit_1.
Proof. unfold qcp_assert_return_wit_1; exact CheckedRvvLoopPure.proof_of_qcp_assert_return_wit_1. Qed.
Lemma proof_of___riscv_vsetvl_e32m8_safety_wit_1 : __riscv_vsetvl_e32m8_safety_wit_1.
Proof. unfold __riscv_vsetvl_e32m8_safety_wit_1; exact CheckedRvvLoopPure.proof_of___riscv_vsetvl_e32m8_safety_wit_1. Qed.
Lemma proof_of___riscv_vsetvl_e32m8_safety_wit_2 : __riscv_vsetvl_e32m8_safety_wit_2.
Proof. unfold __riscv_vsetvl_e32m8_safety_wit_2; exact CheckedRvvLoopPure.proof_of___riscv_vsetvl_e32m8_safety_wit_2. Qed.
Lemma proof_of___riscv_vsetvl_e32m8_return_wit_1 : __riscv_vsetvl_e32m8_return_wit_1.
Proof. unfold __riscv_vsetvl_e32m8_return_wit_1; exact CheckedRvvLoopPure.proof_of___riscv_vsetvl_e32m8_return_wit_1. Qed.
Lemma proof_of___riscv_vsetvl_e32m8_return_wit_2 : __riscv_vsetvl_e32m8_return_wit_2.
Proof. unfold __riscv_vsetvl_e32m8_return_wit_2; exact CheckedRvvLoopPure.proof_of___riscv_vsetvl_e32m8_return_wit_2. Qed.
Lemma proof_of_test_rvv_safety_wit_1 : test_rvv_safety_wit_1.
Proof. unfold test_rvv_safety_wit_1; try left; intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; subst; unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split | reflexivity]; lia. Qed.
Lemma proof_of_test_rvv_safety_wit_2 : test_rvv_safety_wit_2.
Proof. unfold test_rvv_safety_wit_2; try left; intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; subst; unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split | reflexivity]; lia. Qed.
Lemma proof_of_test_rvv_safety_wit_3 : test_rvv_safety_wit_3.
Proof. unfold test_rvv_safety_wit_3; try left; intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; subst; unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split | reflexivity]; lia. Qed.
Lemma proof_of_test_rvv_safety_wit_4 : test_rvv_safety_wit_4.
Proof. unfold test_rvv_safety_wit_4; try left; intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; subst; unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split | reflexivity]; lia. Qed.
Lemma proof_of_test_rvv_safety_wit_5 : test_rvv_safety_wit_5.
Proof. unfold test_rvv_safety_wit_5; try left; intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; subst; unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split | reflexivity]; lia. Qed.
Lemma proof_of_test_rvv_safety_wit_6 : test_rvv_safety_wit_6.
Proof. unfold test_rvv_safety_wit_6; try left; intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; subst; unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split | reflexivity]; lia. Qed.
Lemma proof_of_test_rvv_safety_wit_7 : test_rvv_safety_wit_7.
Proof. unfold test_rvv_safety_wit_7; try left; intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; subst; unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split | reflexivity]; lia. Qed.
Lemma proof_of_test_rvv_safety_wit_8 : test_rvv_safety_wit_8.
Proof. unfold test_rvv_safety_wit_8; try left; intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; subst; unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split | reflexivity]; lia. Qed.
Lemma proof_of_test_rvv_safety_wit_9 : test_rvv_safety_wit_9.
Proof. unfold test_rvv_safety_wit_9; try left; intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; subst; unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split | reflexivity]; lia. Qed.
Lemma proof_of_test_rvv_safety_wit_10 : test_rvv_safety_wit_10.
Proof. unfold test_rvv_safety_wit_10; try left; intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; subst; unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split | reflexivity]; lia. Qed.
Lemma proof_of_test_rvv_safety_wit_11 : test_rvv_safety_wit_11.
Proof. unfold test_rvv_safety_wit_11; try left; intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; subst; unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split | reflexivity]; lia. Qed.
Lemma proof_of_test_rvv_safety_wit_12 : test_rvv_safety_wit_12.
Proof. unfold test_rvv_safety_wit_12; try left; intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; subst; unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split | reflexivity]; lia. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_1_pure : test_rvv_partial_solve_wit_1_pure.
Proof. unfold test_rvv_partial_solve_wit_1_pure; try left; intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; subst; unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split | reflexivity]; lia. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_1 : test_rvv_partial_solve_wit_1.
Proof. unfold test_rvv_partial_solve_wit_1, test_rvv_partial_solve_wit_1_aux; try left; intros; unfold fp32_bits_equal in *; subst; unfold UndefStructPredvfloat32m8_t, UndefStructPredvint32m8_t, UndefStructPredvbool4_t; rewrite ?local_field_address; repeat progress rewrite <- logic_equiv_andp_assoc; first [apply _derivable1_andp_intros; [unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split | reflexivity]; lia|opaque_leaves; sepcon_assoc_change; fast_cancel] | opaque_leaves; sepcon_assoc_change; fast_cancel]. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_2_pure : test_rvv_partial_solve_wit_2_pure.
Proof. unfold test_rvv_partial_solve_wit_2_pure; try left; intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; subst; unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split | reflexivity]; lia. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_2 : test_rvv_partial_solve_wit_2.
Proof. unfold test_rvv_partial_solve_wit_2, test_rvv_partial_solve_wit_2_aux; try left; intros; unfold fp32_bits_equal in *; subst; unfold UndefStructPredvfloat32m8_t, UndefStructPredvint32m8_t, UndefStructPredvbool4_t; rewrite ?local_field_address; repeat progress rewrite <- logic_equiv_andp_assoc; first [apply _derivable1_andp_intros; [unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split | reflexivity]; lia|opaque_leaves; sepcon_assoc_change; fast_cancel] | opaque_leaves; sepcon_assoc_change; fast_cancel]. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_3_pure : test_rvv_partial_solve_wit_3_pure.
Proof. unfold test_rvv_partial_solve_wit_3_pure; try left; intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; subst; unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split | reflexivity]; lia. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_3 : test_rvv_partial_solve_wit_3.
Proof. unfold test_rvv_partial_solve_wit_3, test_rvv_partial_solve_wit_3_aux; try left; intros; unfold fp32_bits_equal in *; subst; unfold UndefStructPredvfloat32m8_t, UndefStructPredvint32m8_t, UndefStructPredvbool4_t; rewrite ?local_field_address; repeat progress rewrite <- logic_equiv_andp_assoc; first [apply _derivable1_andp_intros; [unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split | reflexivity]; lia|opaque_leaves; sepcon_assoc_change; fast_cancel] | opaque_leaves; sepcon_assoc_change; fast_cancel]. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_4_pure : test_rvv_partial_solve_wit_4_pure.
Proof. unfold test_rvv_partial_solve_wit_4_pure; try left; intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; subst; unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split | reflexivity]; lia. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_4 : test_rvv_partial_solve_wit_4.
Proof. unfold test_rvv_partial_solve_wit_4, test_rvv_partial_solve_wit_4_aux; try left; intros; unfold fp32_bits_equal in *; subst; unfold UndefStructPredvfloat32m8_t, UndefStructPredvint32m8_t, UndefStructPredvbool4_t; rewrite ?local_field_address; repeat progress rewrite <- logic_equiv_andp_assoc; first [apply _derivable1_andp_intros; [unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split | reflexivity]; lia|opaque_leaves; sepcon_assoc_change; fast_cancel] | opaque_leaves; sepcon_assoc_change; fast_cancel]. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_5 : test_rvv_partial_solve_wit_5.
Proof. unfold test_rvv_partial_solve_wit_5; try left; intros; unfold fp32_bits_equal in *; subst; unfold UndefStructPredvfloat32m8_t, UndefStructPredvint32m8_t, UndefStructPredvbool4_t; rewrite ?local_field_address; repeat progress rewrite <- logic_equiv_andp_assoc; first [apply _derivable1_andp_intros; [unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split | reflexivity]; lia|opaque_leaves; sepcon_assoc_change; fast_cancel] | opaque_leaves; sepcon_assoc_change; fast_cancel]. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_6_pure : test_rvv_partial_solve_wit_6_pure.
Proof. unfold test_rvv_partial_solve_wit_6_pure; try left; intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; subst; unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split | reflexivity]; lia. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_6 : test_rvv_partial_solve_wit_6.
Proof. unfold test_rvv_partial_solve_wit_6, test_rvv_partial_solve_wit_6_aux; try left; intros; unfold fp32_bits_equal in *; subst; unfold UndefStructPredvfloat32m8_t, UndefStructPredvint32m8_t, UndefStructPredvbool4_t; rewrite ?local_field_address; repeat progress rewrite <- logic_equiv_andp_assoc; first [apply _derivable1_andp_intros; [unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split | reflexivity]; lia|opaque_leaves; sepcon_assoc_change; fast_cancel] | opaque_leaves; sepcon_assoc_change; fast_cancel]. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_7 : test_rvv_partial_solve_wit_7.
Proof. unfold test_rvv_partial_solve_wit_7; try left; intros; unfold fp32_bits_equal in *; subst; unfold UndefStructPredvfloat32m8_t, UndefStructPredvint32m8_t, UndefStructPredvbool4_t; rewrite ?local_field_address; repeat progress rewrite <- logic_equiv_andp_assoc; first [apply _derivable1_andp_intros; [unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split | reflexivity]; lia|opaque_leaves; sepcon_assoc_change; fast_cancel] | opaque_leaves; sepcon_assoc_change; fast_cancel]. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_8_pure : test_rvv_partial_solve_wit_8_pure.
Proof. unfold test_rvv_partial_solve_wit_8_pure; try left; intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; subst; unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split | reflexivity]; lia. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_8 : test_rvv_partial_solve_wit_8.
Proof. unfold test_rvv_partial_solve_wit_8, test_rvv_partial_solve_wit_8_aux; try left; intros; unfold fp32_bits_equal in *; subst; unfold UndefStructPredvfloat32m8_t, UndefStructPredvint32m8_t, UndefStructPredvbool4_t; rewrite ?local_field_address; repeat progress rewrite <- logic_equiv_andp_assoc; first [apply _derivable1_andp_intros; [unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split | reflexivity]; lia|opaque_leaves; sepcon_assoc_change; fast_cancel] | opaque_leaves; sepcon_assoc_change; fast_cancel]. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_9 : test_rvv_partial_solve_wit_9.
Proof. unfold test_rvv_partial_solve_wit_9; try left; intros; unfold fp32_bits_equal in *; subst; unfold UndefStructPredvfloat32m8_t, UndefStructPredvint32m8_t, UndefStructPredvbool4_t; rewrite ?local_field_address; repeat progress rewrite <- logic_equiv_andp_assoc; first [apply _derivable1_andp_intros; [unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split | reflexivity]; lia|opaque_leaves; sepcon_assoc_change; fast_cancel] | opaque_leaves; sepcon_assoc_change; fast_cancel]. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_10 : test_rvv_partial_solve_wit_10.
Proof. unfold test_rvv_partial_solve_wit_10; try left; intros; unfold fp32_bits_equal in *; subst; unfold UndefStructPredvfloat32m8_t, UndefStructPredvint32m8_t, UndefStructPredvbool4_t; rewrite ?local_field_address; repeat progress rewrite <- logic_equiv_andp_assoc; first [apply _derivable1_andp_intros; [unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split | reflexivity]; lia|opaque_leaves; sepcon_assoc_change; fast_cancel] | opaque_leaves; sepcon_assoc_change; fast_cancel]. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_11 : test_rvv_partial_solve_wit_11.
Proof. unfold test_rvv_partial_solve_wit_11; try left; intros; unfold fp32_bits_equal in *; subst; unfold UndefStructPredvfloat32m8_t, UndefStructPredvint32m8_t, UndefStructPredvbool4_t; rewrite ?local_field_address; repeat progress rewrite <- logic_equiv_andp_assoc; first [apply _derivable1_andp_intros; [unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split | reflexivity]; lia|opaque_leaves; sepcon_assoc_change; fast_cancel] | opaque_leaves; sepcon_assoc_change; fast_cancel]. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_12_pure : test_rvv_partial_solve_wit_12_pure.
Proof. unfold test_rvv_partial_solve_wit_12_pure; try left; intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; subst; unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split | reflexivity]; lia. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_12 : test_rvv_partial_solve_wit_12.
Proof. unfold test_rvv_partial_solve_wit_12, test_rvv_partial_solve_wit_12_aux; try left; intros; unfold fp32_bits_equal in *; subst; unfold UndefStructPredvfloat32m8_t, UndefStructPredvint32m8_t, UndefStructPredvbool4_t; rewrite ?local_field_address; repeat progress rewrite <- logic_equiv_andp_assoc; first [apply _derivable1_andp_intros; [unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split | reflexivity]; lia|opaque_leaves; sepcon_assoc_change; fast_cancel] | opaque_leaves; sepcon_assoc_change; fast_cancel]. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_13 : test_rvv_partial_solve_wit_13.
Proof. unfold test_rvv_partial_solve_wit_13; try left; intros; unfold fp32_bits_equal in *; subst; unfold UndefStructPredvfloat32m8_t, UndefStructPredvint32m8_t, UndefStructPredvbool4_t; rewrite ?local_field_address; repeat progress rewrite <- logic_equiv_andp_assoc; first [apply _derivable1_andp_intros; [unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split | reflexivity]; lia|opaque_leaves; sepcon_assoc_change; fast_cancel] | opaque_leaves; sepcon_assoc_change; fast_cancel]. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_14_pure : test_rvv_partial_solve_wit_14_pure.
Proof. unfold test_rvv_partial_solve_wit_14_pure; try left; intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; subst; unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split | reflexivity]; lia. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_14 : test_rvv_partial_solve_wit_14.
Proof. unfold test_rvv_partial_solve_wit_14, test_rvv_partial_solve_wit_14_aux; try left; intros; unfold fp32_bits_equal in *; subst; unfold UndefStructPredvfloat32m8_t, UndefStructPredvint32m8_t, UndefStructPredvbool4_t; rewrite ?local_field_address; repeat progress rewrite <- logic_equiv_andp_assoc; first [apply _derivable1_andp_intros; [unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split | reflexivity]; lia|opaque_leaves; sepcon_assoc_change; fast_cancel] | opaque_leaves; sepcon_assoc_change; fast_cancel]. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_15 : test_rvv_partial_solve_wit_15.
Proof. unfold test_rvv_partial_solve_wit_15; try left; intros; unfold fp32_bits_equal in *; subst; unfold UndefStructPredvfloat32m8_t, UndefStructPredvint32m8_t, UndefStructPredvbool4_t; rewrite ?local_field_address; repeat progress rewrite <- logic_equiv_andp_assoc; first [apply _derivable1_andp_intros; [unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split | reflexivity]; lia|opaque_leaves; sepcon_assoc_change; fast_cancel] | opaque_leaves; sepcon_assoc_change; fast_cancel]. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_16_pure : test_rvv_partial_solve_wit_16_pure.
Proof. unfold test_rvv_partial_solve_wit_16_pure; try left; intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; subst; unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split | reflexivity]; lia. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_16 : test_rvv_partial_solve_wit_16.
Proof. unfold test_rvv_partial_solve_wit_16, test_rvv_partial_solve_wit_16_aux; try left; intros; unfold fp32_bits_equal in *; subst; unfold UndefStructPredvfloat32m8_t, UndefStructPredvint32m8_t, UndefStructPredvbool4_t; rewrite ?local_field_address; repeat progress rewrite <- logic_equiv_andp_assoc; first [apply _derivable1_andp_intros; [unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split | reflexivity]; lia|opaque_leaves; sepcon_assoc_change; fast_cancel] | opaque_leaves; sepcon_assoc_change; fast_cancel]. Qed.
End KernelCalls.
