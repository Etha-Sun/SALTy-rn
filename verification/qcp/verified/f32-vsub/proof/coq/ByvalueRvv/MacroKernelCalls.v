From Coq Require Import Lia.
From QcpRvv32 Require Import RvvLoopModel FastFrame rvv_loop_pure_checked.
From ByvalueRvv Require Import Layout macro_unit_goal.
Import Snaive_C_Rules64.
Module KernelCalls.
Lemma proof_of_qcp_assert_return_wit_1 : qcp_assert_return_wit_1.
Proof. unfold qcp_assert_return_wit_1; first [ exact CheckedRvvLoopPure.proof_of_qcp_assert_return_wit_1 | first [ exact CheckedRvvLoopPure.proof_of_qcp_assert_return_wit_1 | intros; unfold vadd_vl; entailer!; lia ] ]. Qed.
Lemma proof_of___riscv_vsetvl_e32m8_safety_wit_1 : __riscv_vsetvl_e32m8_safety_wit_1.
Proof. unfold __riscv_vsetvl_e32m8_safety_wit_1; first [ exact CheckedRvvLoopPure.proof_of___riscv_vsetvl_e32m8_safety_wit_1 | intros; unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split | reflexivity]; lia ]. Qed.
Lemma proof_of___riscv_vsetvl_e32m8_safety_wit_2 : __riscv_vsetvl_e32m8_safety_wit_2.
Proof. unfold __riscv_vsetvl_e32m8_safety_wit_2; first [ exact CheckedRvvLoopPure.proof_of___riscv_vsetvl_e32m8_safety_wit_2 | intros; unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split | reflexivity]; lia ]. Qed.
Lemma proof_of___riscv_vsetvl_e32m8_return_wit_1 : __riscv_vsetvl_e32m8_return_wit_1.
Proof. unfold __riscv_vsetvl_e32m8_return_wit_1; first [ exact CheckedRvvLoopPure.proof_of___riscv_vsetvl_e32m8_return_wit_1 | first [ exact CheckedRvvLoopPure.proof_of___riscv_vsetvl_e32m8_return_wit_1 | intros; unfold vadd_vl; entailer!; lia ] ]. Qed.
Lemma proof_of___riscv_vsetvl_e32m8_return_wit_2 : __riscv_vsetvl_e32m8_return_wit_2.
Proof. unfold __riscv_vsetvl_e32m8_return_wit_2; first [ exact CheckedRvvLoopPure.proof_of___riscv_vsetvl_e32m8_return_wit_2 | first [ exact CheckedRvvLoopPure.proof_of___riscv_vsetvl_e32m8_return_wit_2 | intros; unfold vadd_vl; entailer!; lia ] ]. Qed.
Lemma proof_of_test_rvv_safety_wit_1 : test_rvv_safety_wit_1.
Proof. unfold test_rvv_safety_wit_1; first [ exact CheckedRvvLoopPure.proof_of_test_rvv_safety_wit_1 | intros; unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split | reflexivity]; lia ]. Qed.
Lemma proof_of_test_rvv_safety_wit_2 : test_rvv_safety_wit_2.
Proof. unfold test_rvv_safety_wit_2; first [ exact CheckedRvvLoopPure.proof_of_test_rvv_safety_wit_2 | intros; unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split | reflexivity]; lia ]. Qed.
Lemma proof_of_test_rvv_safety_wit_3 : test_rvv_safety_wit_3.
Proof. unfold test_rvv_safety_wit_3; first [ exact CheckedRvvLoopPure.proof_of_test_rvv_safety_wit_3 | intros; unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split | reflexivity]; lia ]. Qed.
Lemma proof_of_test_rvv_safety_wit_4 : test_rvv_safety_wit_4.
Proof. unfold test_rvv_safety_wit_4; first [ exact CheckedRvvLoopPure.proof_of_test_rvv_safety_wit_4 | intros; unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split | reflexivity]; lia ]. Qed.
Lemma proof_of_test_rvv_safety_wit_5 : test_rvv_safety_wit_5.
Proof. unfold test_rvv_safety_wit_5; first [ exact CheckedRvvLoopPure.proof_of_test_rvv_safety_wit_5 | intros; unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split | reflexivity]; lia ]. Qed.
Lemma proof_of_test_rvv_safety_wit_6 : test_rvv_safety_wit_6.
Proof. unfold test_rvv_safety_wit_6; first [ exact CheckedRvvLoopPure.proof_of_test_rvv_safety_wit_6 | intros; unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split | reflexivity]; lia ]. Qed.
Lemma proof_of_test_rvv_safety_wit_7 : test_rvv_safety_wit_7.
Proof. unfold test_rvv_safety_wit_7; first [ exact CheckedRvvLoopPure.proof_of_test_rvv_safety_wit_7 | intros; unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split | reflexivity]; lia ]. Qed.
Lemma proof_of_test_rvv_safety_wit_8 : test_rvv_safety_wit_8.
Proof. unfold test_rvv_safety_wit_8; first [ exact CheckedRvvLoopPure.proof_of_test_rvv_safety_wit_8 | intros; unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split | reflexivity]; lia ]. Qed.
Lemma proof_of_test_rvv_safety_wit_9 : test_rvv_safety_wit_9.
Proof. unfold test_rvv_safety_wit_9; first [ exact CheckedRvvLoopPure.proof_of_test_rvv_safety_wit_9 | intros; unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split | reflexivity]; lia ]. Qed.
Lemma proof_of_test_rvv_safety_wit_10 : test_rvv_safety_wit_10.
Proof. unfold test_rvv_safety_wit_10; first [ exact CheckedRvvLoopPure.proof_of_test_rvv_safety_wit_10 | intros; unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split | reflexivity]; lia ]. Qed.
Lemma proof_of_test_rvv_safety_wit_11 : test_rvv_safety_wit_11.
Proof. unfold test_rvv_safety_wit_11; first [ exact CheckedRvvLoopPure.proof_of_test_rvv_safety_wit_11 | intros; unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split | reflexivity]; lia ]. Qed.
Lemma proof_of_test_rvv_safety_wit_12 : test_rvv_safety_wit_12.
Proof. unfold test_rvv_safety_wit_12; first [ exact CheckedRvvLoopPure.proof_of_test_rvv_safety_wit_12 | intros; unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split | reflexivity]; lia ]. Qed.
Lemma proof_of_test_rvv_safety_wit_13 : test_rvv_safety_wit_13.
Proof. unfold test_rvv_safety_wit_13; first [ exact CheckedRvvLoopPure.proof_of_test_rvv_safety_wit_13 | intros; unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split | reflexivity]; lia ]. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_1_pure : test_rvv_partial_solve_wit_1_pure.
Proof. unfold test_rvv_partial_solve_wit_1_pure; first [ exact CheckedRvvLoopPure.proof_of_test_rvv_partial_solve_wit_1_pure | intros; unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split | reflexivity]; lia ]. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_1 : test_rvv_partial_solve_wit_1.
Proof. unfold test_rvv_partial_solve_wit_1, test_rvv_partial_solve_wit_1_aux; intros; rewrite ?rvv_local_undef_fields; rewrite ?rvv_local_field_address; first [ apply _derivable1_andp_intros; [ unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split | reflexivity]; lia | opaque_leaves; sepcon_assoc_change; fast_cancel ] | opaque_leaves; sepcon_assoc_change; fast_cancel ]. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_2_pure : test_rvv_partial_solve_wit_2_pure.
Proof. unfold test_rvv_partial_solve_wit_2_pure; first [ exact CheckedRvvLoopPure.proof_of_test_rvv_partial_solve_wit_2_pure | intros; unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split | reflexivity]; lia ]. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_2 : test_rvv_partial_solve_wit_2.
Proof. unfold test_rvv_partial_solve_wit_2, test_rvv_partial_solve_wit_2_aux; intros; rewrite ?rvv_local_undef_fields; rewrite ?rvv_local_field_address; first [ apply _derivable1_andp_intros; [ unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split | reflexivity]; lia | opaque_leaves; sepcon_assoc_change; fast_cancel ] | opaque_leaves; sepcon_assoc_change; fast_cancel ]. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_3_pure : test_rvv_partial_solve_wit_3_pure.
Proof. unfold test_rvv_partial_solve_wit_3_pure; first [ exact CheckedRvvLoopPure.proof_of_test_rvv_partial_solve_wit_3_pure | intros; unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split | reflexivity]; lia ]. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_3 : test_rvv_partial_solve_wit_3.
Proof. unfold test_rvv_partial_solve_wit_3, test_rvv_partial_solve_wit_3_aux; intros; rewrite ?rvv_local_undef_fields; rewrite ?rvv_local_field_address; first [ apply _derivable1_andp_intros; [ unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split | reflexivity]; lia | opaque_leaves; sepcon_assoc_change; fast_cancel ] | opaque_leaves; sepcon_assoc_change; fast_cancel ]. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_4_pure : test_rvv_partial_solve_wit_4_pure.
Proof. unfold test_rvv_partial_solve_wit_4_pure; first [ exact CheckedRvvLoopPure.proof_of_test_rvv_partial_solve_wit_4_pure | intros; unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split | reflexivity]; lia ]. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_4 : test_rvv_partial_solve_wit_4.
Proof. unfold test_rvv_partial_solve_wit_4, test_rvv_partial_solve_wit_4_aux; intros; rewrite ?rvv_local_undef_fields; rewrite ?rvv_local_field_address; first [ apply _derivable1_andp_intros; [ unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split | reflexivity]; lia | opaque_leaves; sepcon_assoc_change; fast_cancel ] | opaque_leaves; sepcon_assoc_change; fast_cancel ]. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_5_pure : test_rvv_partial_solve_wit_5_pure.
Proof. unfold test_rvv_partial_solve_wit_5_pure; first [ exact CheckedRvvLoopPure.proof_of_test_rvv_partial_solve_wit_5_pure | intros; unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split | reflexivity]; lia ]. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_5 : test_rvv_partial_solve_wit_5.
Proof. unfold test_rvv_partial_solve_wit_5, test_rvv_partial_solve_wit_5_aux; intros; rewrite ?rvv_local_undef_fields; rewrite ?rvv_local_field_address; first [ apply _derivable1_andp_intros; [ unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split | reflexivity]; lia | opaque_leaves; sepcon_assoc_change; fast_cancel ] | opaque_leaves; sepcon_assoc_change; fast_cancel ]. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_6 : test_rvv_partial_solve_wit_6.
Proof. unfold test_rvv_partial_solve_wit_6; intros; rewrite ?rvv_local_undef_fields; rewrite ?rvv_local_field_address; first [ apply _derivable1_andp_intros; [ unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split | reflexivity]; lia | opaque_leaves; sepcon_assoc_change; fast_cancel ] | opaque_leaves; sepcon_assoc_change; fast_cancel ]. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_7_pure : test_rvv_partial_solve_wit_7_pure.
Proof. unfold test_rvv_partial_solve_wit_7_pure; first [ exact CheckedRvvLoopPure.proof_of_test_rvv_partial_solve_wit_7_pure | intros; unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split | reflexivity]; lia ]. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_7 : test_rvv_partial_solve_wit_7.
Proof. unfold test_rvv_partial_solve_wit_7, test_rvv_partial_solve_wit_7_aux; intros; rewrite ?rvv_local_undef_fields; rewrite ?rvv_local_field_address; first [ apply _derivable1_andp_intros; [ unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split | reflexivity]; lia | opaque_leaves; sepcon_assoc_change; fast_cancel ] | opaque_leaves; sepcon_assoc_change; fast_cancel ]. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_8 : test_rvv_partial_solve_wit_8.
Proof. unfold test_rvv_partial_solve_wit_8; intros; rewrite ?rvv_local_undef_fields; rewrite ?rvv_local_field_address; first [ apply _derivable1_andp_intros; [ unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split | reflexivity]; lia | opaque_leaves; sepcon_assoc_change; fast_cancel ] | opaque_leaves; sepcon_assoc_change; fast_cancel ]. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_9_pure : test_rvv_partial_solve_wit_9_pure.
Proof. unfold test_rvv_partial_solve_wit_9_pure; first [ exact CheckedRvvLoopPure.proof_of_test_rvv_partial_solve_wit_9_pure | intros; unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split | reflexivity]; lia ]. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_9 : test_rvv_partial_solve_wit_9.
Proof. unfold test_rvv_partial_solve_wit_9, test_rvv_partial_solve_wit_9_aux; intros; rewrite ?rvv_local_undef_fields; rewrite ?rvv_local_field_address; first [ apply _derivable1_andp_intros; [ unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split | reflexivity]; lia | opaque_leaves; sepcon_assoc_change; fast_cancel ] | opaque_leaves; sepcon_assoc_change; fast_cancel ]. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_10 : test_rvv_partial_solve_wit_10.
Proof. unfold test_rvv_partial_solve_wit_10; intros; rewrite ?rvv_local_undef_fields; rewrite ?rvv_local_field_address; first [ apply _derivable1_andp_intros; [ unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split | reflexivity]; lia | opaque_leaves; sepcon_assoc_change; fast_cancel ] | opaque_leaves; sepcon_assoc_change; fast_cancel ]. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_11_pure : test_rvv_partial_solve_wit_11_pure.
Proof. unfold test_rvv_partial_solve_wit_11_pure; intros; unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split | reflexivity]; lia. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_11 : test_rvv_partial_solve_wit_11.
Proof. unfold test_rvv_partial_solve_wit_11, test_rvv_partial_solve_wit_11_aux; intros; rewrite ?rvv_local_undef_fields; rewrite ?rvv_local_field_address; first [ apply _derivable1_andp_intros; [ unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split | reflexivity]; lia | opaque_leaves; sepcon_assoc_change; fast_cancel ] | opaque_leaves; sepcon_assoc_change; fast_cancel ]. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_12 : test_rvv_partial_solve_wit_12.
Proof. unfold test_rvv_partial_solve_wit_12; intros; rewrite ?rvv_local_undef_fields; rewrite ?rvv_local_field_address; first [ apply _derivable1_andp_intros; [ unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split | reflexivity]; lia | opaque_leaves; sepcon_assoc_change; fast_cancel ] | opaque_leaves; sepcon_assoc_change; fast_cancel ]. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_13_pure : test_rvv_partial_solve_wit_13_pure.
Proof. unfold test_rvv_partial_solve_wit_13_pure; intros; unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split | reflexivity]; lia. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_13 : test_rvv_partial_solve_wit_13.
Proof. unfold test_rvv_partial_solve_wit_13, test_rvv_partial_solve_wit_13_aux; intros; rewrite ?rvv_local_undef_fields; rewrite ?rvv_local_field_address; first [ apply _derivable1_andp_intros; [ unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split | reflexivity]; lia | opaque_leaves; sepcon_assoc_change; fast_cancel ] | opaque_leaves; sepcon_assoc_change; fast_cancel ]. Qed.
End KernelCalls.
