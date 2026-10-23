Require Import Coq.ZArith.ZArith Coq.micromega.Psatz.
From QcpNeonLoop Require Import neon_loop_unit_goal NeonLoopBridge.
From QcpNeon Require Import NeonBridge.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedNeonMoreCalls.
Lemma proof_of_test_neon_partial_solve_wit_16 : test_neon_partial_solve_wit_16.
Proof. unfold test_neon_partial_solve_wit_16; intros; unfold UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t; csimpl; entailer!. Qed.
Lemma proof_of_test_neon_partial_solve_wit_17 : test_neon_partial_solve_wit_17.
Proof. unfold test_neon_partial_solve_wit_17; intros; unfold UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t; csimpl; entailer!. Qed.
Lemma proof_of_test_neon_partial_solve_wit_18 : test_neon_partial_solve_wit_18.
Proof. unfold test_neon_partial_solve_wit_18; intros; unfold UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t; csimpl; entailer!. Qed.
Lemma proof_of_test_neon_partial_solve_wit_19 : test_neon_partial_solve_wit_19.
Proof. unfold test_neon_partial_solve_wit_19; intros; unfold UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t; csimpl; entailer!. Qed.
Lemma proof_of_test_neon_partial_solve_wit_20 : test_neon_partial_solve_wit_20.
Proof. unfold test_neon_partial_solve_wit_20; intros; unfold UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t; csimpl; entailer!. Qed.
Lemma proof_of_test_neon_partial_solve_wit_21 : test_neon_partial_solve_wit_21.
Proof. unfold test_neon_partial_solve_wit_21; intros; unfold UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t; csimpl; entailer!. Qed.
End CheckedNeonMoreCalls.
Print Assumptions CheckedNeonMoreCalls.proof_of_test_neon_partial_solve_wit_16.
Print Assumptions CheckedNeonMoreCalls.proof_of_test_neon_partial_solve_wit_17.
Print Assumptions CheckedNeonMoreCalls.proof_of_test_neon_partial_solve_wit_18.
Print Assumptions CheckedNeonMoreCalls.proof_of_test_neon_partial_solve_wit_19.
Print Assumptions CheckedNeonMoreCalls.proof_of_test_neon_partial_solve_wit_20.
Print Assumptions CheckedNeonMoreCalls.proof_of_test_neon_partial_solve_wit_21.
