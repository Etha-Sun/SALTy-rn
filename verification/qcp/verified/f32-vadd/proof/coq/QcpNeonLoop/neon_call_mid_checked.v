Require Import Coq.ZArith.ZArith Coq.micromega.Psatz.
From QcpNeonLoop Require Import neon_loop_unit_goal NeonLoopBridge.
From QcpNeon Require Import NeonBridge.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedNeonMoreCalls.
Lemma proof_of_test_neon_partial_solve_wit_7 : test_neon_partial_solve_wit_7.
Proof. unfold test_neon_partial_solve_wit_7; intros; unfold UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t; csimpl; sep_apply_l_atomic (float_full_open4 input_b (Z.quot batch 4+3) (fp32_slice k (Z.quot batch_pre 4+3) B) __default_fp32); [dump_pre_spatial; lia|unfold fp32_slice; entailer!]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_8 : test_neon_partial_solve_wit_8.
Proof. unfold test_neon_partial_solve_wit_8; intros; unfold UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t; csimpl; entailer!. Qed.
Lemma proof_of_test_neon_partial_solve_wit_9 : test_neon_partial_solve_wit_9.
Proof. unfold test_neon_partial_solve_wit_9; intros; unfold UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t; csimpl; sep_apply_l_atomic (float_undef_open4 output (Z.quot batch 4)); [dump_pre_spatial; lia|replace (output+0*sizeof(FLOAT)) with output by lia; entailer!]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_13 : test_neon_partial_solve_wit_13.
Proof. unfold test_neon_partial_solve_wit_13; intros; unfold UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t; csimpl; sep_apply_l_atomic (float_full_open4 input_b (Z.quot batch 4+3) (fp32_slice k (Z.quot batch_pre 4+3) B) __default_fp32); [dump_pre_spatial; lia|unfold fp32_slice; entailer!]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_14 : test_neon_partial_solve_wit_14.
Proof. unfold test_neon_partial_solve_wit_14; intros; unfold UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t; csimpl; sep_apply_l_atomic (float_full_open4 input_b (Z.quot batch 4+3) (fp32_slice k (Z.quot batch_pre 4+3) B) __default_fp32); [dump_pre_spatial; lia|unfold fp32_slice; entailer!]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_15 : test_neon_partial_solve_wit_15.
Proof. unfold test_neon_partial_solve_wit_15; intros; unfold UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t; csimpl; sep_apply_l_atomic (float_full_open4 input_b (Z.quot batch 4+3) (fp32_slice k (Z.quot batch_pre 4+3) B) __default_fp32); [dump_pre_spatial; lia|unfold fp32_slice; entailer!]. Qed.
End CheckedNeonMoreCalls.
Print Assumptions CheckedNeonMoreCalls.proof_of_test_neon_partial_solve_wit_7.
Print Assumptions CheckedNeonMoreCalls.proof_of_test_neon_partial_solve_wit_8.
Print Assumptions CheckedNeonMoreCalls.proof_of_test_neon_partial_solve_wit_9.
Print Assumptions CheckedNeonMoreCalls.proof_of_test_neon_partial_solve_wit_13.
Print Assumptions CheckedNeonMoreCalls.proof_of_test_neon_partial_solve_wit_14.
Print Assumptions CheckedNeonMoreCalls.proof_of_test_neon_partial_solve_wit_15.
