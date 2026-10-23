From Coq Require Import ZArith List Lia.
From QcpRvv32 Require Import rvv_loop_unit_goal RvvLoopModel.
From QcpVadd Require Import VaddBits.
From SimpleC.SL Require Import Mem SeparationLogic.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedRvvLoopPure.
Lemma proof_of_qcp_assert_return_wit_1 : qcp_assert_return_wit_1.
Proof. unfold qcp_assert_return_wit_1; repeat rewrite sizeof_float; pre_process; subst; entailer!. Qed.
Lemma proof_of___riscv_vsetvl_e32m8_safety_wit_1 : __riscv_vsetvl_e32m8_safety_wit_1.
Proof. unfold __riscv_vsetvl_e32m8_safety_wit_1; repeat rewrite sizeof_float; pre_process; subst; entailer!. Qed.
Lemma proof_of___riscv_vsetvl_e32m8_safety_wit_2 : __riscv_vsetvl_e32m8_safety_wit_2.
Proof. unfold __riscv_vsetvl_e32m8_safety_wit_2; repeat rewrite sizeof_float; pre_process; subst; entailer!. Qed.
Lemma proof_of_test_rvv_safety_wit_1 : test_rvv_safety_wit_1.
Proof. unfold test_rvv_safety_wit_1; repeat rewrite sizeof_float; pre_process; subst; entailer!. Qed.
Lemma proof_of_test_rvv_safety_wit_2 : test_rvv_safety_wit_2.
Proof. unfold test_rvv_safety_wit_2; repeat rewrite sizeof_float; pre_process; subst; entailer!. Qed.
Lemma proof_of_test_rvv_safety_wit_3 : test_rvv_safety_wit_3.
Proof. unfold test_rvv_safety_wit_3; repeat rewrite sizeof_float; pre_process; subst; entailer!. Qed.
Lemma proof_of_test_rvv_safety_wit_4 : test_rvv_safety_wit_4.
Proof. unfold test_rvv_safety_wit_4; repeat rewrite sizeof_float; pre_process; subst; entailer!. Qed.
Lemma proof_of_test_rvv_safety_wit_5 : test_rvv_safety_wit_5.
Proof. unfold test_rvv_safety_wit_5; repeat rewrite sizeof_float; pre_process; subst; entailer!. Qed.
Lemma proof_of_test_rvv_safety_wit_6 : test_rvv_safety_wit_6.
Proof. unfold test_rvv_safety_wit_6; repeat rewrite sizeof_float; pre_process; subst; entailer!. Qed.
Lemma proof_of_test_rvv_safety_wit_7 : test_rvv_safety_wit_7.
Proof. unfold test_rvv_safety_wit_7; repeat rewrite sizeof_float; pre_process; subst; entailer!. Qed.
Lemma proof_of_test_rvv_safety_wit_8 : test_rvv_safety_wit_8.
Proof. unfold test_rvv_safety_wit_8; repeat rewrite sizeof_float; pre_process; subst; entailer!. Qed.
Lemma proof_of_test_rvv_safety_wit_9 : test_rvv_safety_wit_9.
Proof. unfold test_rvv_safety_wit_9; repeat rewrite sizeof_float; pre_process; subst; entailer!. Qed.
Lemma proof_of_test_rvv_safety_wit_10 : test_rvv_safety_wit_10.
Proof. unfold test_rvv_safety_wit_10; repeat rewrite sizeof_float; pre_process; subst; entailer!. Qed.
Lemma proof_of_test_rvv_safety_wit_11 : test_rvv_safety_wit_11.
Proof. unfold test_rvv_safety_wit_11; repeat rewrite sizeof_float; pre_process; subst; entailer!. Qed.
Lemma proof_of_test_rvv_safety_wit_12 : test_rvv_safety_wit_12.
Proof. unfold test_rvv_safety_wit_12; repeat rewrite sizeof_float; pre_process; subst; entailer!. Qed.
Lemma proof_of_test_rvv_safety_wit_13 : test_rvv_safety_wit_13.
Proof. unfold test_rvv_safety_wit_13; repeat rewrite sizeof_float; pre_process; subst; entailer!. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_1_pure : test_rvv_partial_solve_wit_1_pure.
Proof. unfold test_rvv_partial_solve_wit_1_pure; repeat rewrite sizeof_float; pre_process; subst; entailer!. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_2_pure : test_rvv_partial_solve_wit_2_pure.
Proof. unfold test_rvv_partial_solve_wit_2_pure; repeat rewrite sizeof_float; pre_process; subst; entailer!. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_3_pure : test_rvv_partial_solve_wit_3_pure.
Proof. unfold test_rvv_partial_solve_wit_3_pure; repeat rewrite sizeof_float; pre_process; subst; entailer!. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_4_pure : test_rvv_partial_solve_wit_4_pure.
Proof. unfold test_rvv_partial_solve_wit_4_pure; repeat rewrite sizeof_float; pre_process; subst; entailer!. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_5_pure : test_rvv_partial_solve_wit_5_pure.
Proof. unfold test_rvv_partial_solve_wit_5_pure; repeat rewrite sizeof_float; pre_process; subst; entailer!. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_7_pure : test_rvv_partial_solve_wit_7_pure.
Proof. unfold test_rvv_partial_solve_wit_7_pure; repeat rewrite sizeof_float; pre_process; subst; entailer!. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_8_pure : test_rvv_partial_solve_wit_8_pure.
Proof. unfold test_rvv_partial_solve_wit_8_pure; repeat rewrite sizeof_float; pre_process; subst; entailer!. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_9_pure : test_rvv_partial_solve_wit_9_pure.
Proof. unfold test_rvv_partial_solve_wit_9_pure; repeat rewrite sizeof_float; pre_process; subst; entailer!. Qed.
Lemma proof_of_test_rvv_partial_solve_wit_10_pure : test_rvv_partial_solve_wit_10_pure.
Proof. unfold test_rvv_partial_solve_wit_10_pure; repeat rewrite sizeof_float; pre_process; subst; entailer!. Qed.
Lemma proof_of___riscv_vsetvl_e32m8_return_wit_1 : __riscv_vsetvl_e32m8_return_wit_1.
Proof. unfold __riscv_vsetvl_e32m8_return_wit_1; left; intros. unfold vadd_vl. rewrite Z.min_l by lia. entailer!. Qed.
Lemma proof_of___riscv_vsetvl_e32m8_return_wit_2 : __riscv_vsetvl_e32m8_return_wit_2.
Proof. unfold __riscv_vsetvl_e32m8_return_wit_2; left; intros. unfold vadd_vl. rewrite Z.min_r by lia. entailer!. Qed.
End CheckedRvvLoopPure.
Print Assumptions CheckedRvvLoopPure.proof_of_qcp_assert_return_wit_1.
Print Assumptions CheckedRvvLoopPure.proof_of___riscv_vsetvl_e32m8_safety_wit_1.
Print Assumptions CheckedRvvLoopPure.proof_of___riscv_vsetvl_e32m8_safety_wit_2.
Print Assumptions CheckedRvvLoopPure.proof_of_test_rvv_safety_wit_1.
Print Assumptions CheckedRvvLoopPure.proof_of_test_rvv_safety_wit_2.
Print Assumptions CheckedRvvLoopPure.proof_of_test_rvv_safety_wit_3.
Print Assumptions CheckedRvvLoopPure.proof_of_test_rvv_safety_wit_4.
Print Assumptions CheckedRvvLoopPure.proof_of_test_rvv_safety_wit_5.
Print Assumptions CheckedRvvLoopPure.proof_of_test_rvv_safety_wit_6.
Print Assumptions CheckedRvvLoopPure.proof_of_test_rvv_safety_wit_7.
Print Assumptions CheckedRvvLoopPure.proof_of_test_rvv_safety_wit_8.
Print Assumptions CheckedRvvLoopPure.proof_of_test_rvv_safety_wit_9.
Print Assumptions CheckedRvvLoopPure.proof_of_test_rvv_safety_wit_10.
Print Assumptions CheckedRvvLoopPure.proof_of_test_rvv_safety_wit_11.
Print Assumptions CheckedRvvLoopPure.proof_of_test_rvv_safety_wit_12.
Print Assumptions CheckedRvvLoopPure.proof_of_test_rvv_safety_wit_13.
Print Assumptions CheckedRvvLoopPure.proof_of_test_rvv_partial_solve_wit_1_pure.
Print Assumptions CheckedRvvLoopPure.proof_of_test_rvv_partial_solve_wit_2_pure.
Print Assumptions CheckedRvvLoopPure.proof_of_test_rvv_partial_solve_wit_3_pure.
Print Assumptions CheckedRvvLoopPure.proof_of_test_rvv_partial_solve_wit_4_pure.
Print Assumptions CheckedRvvLoopPure.proof_of_test_rvv_partial_solve_wit_5_pure.
Print Assumptions CheckedRvvLoopPure.proof_of_test_rvv_partial_solve_wit_7_pure.
Print Assumptions CheckedRvvLoopPure.proof_of_test_rvv_partial_solve_wit_8_pure.
Print Assumptions CheckedRvvLoopPure.proof_of_test_rvv_partial_solve_wit_9_pure.
Print Assumptions CheckedRvvLoopPure.proof_of_test_rvv_partial_solve_wit_10_pure.
Print Assumptions CheckedRvvLoopPure.proof_of___riscv_vsetvl_e32m8_return_wit_1.
Print Assumptions CheckedRvvLoopPure.proof_of___riscv_vsetvl_e32m8_return_wit_2.
