Require Import Coq.ZArith.ZArith Coq.micromega.Psatz.
From QcpNeonLoop Require Import neon_loop_unit_goal NeonLoopBridge.
From QcpNeon Require Import NeonBridge.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedNeonMoreCalls.
Lemma proof_of_test_neon_partial_solve_wit_6 : test_neon_partial_solve_wit_6.
Proof. unfold test_neon_partial_solve_wit_6; intros; unfold UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t; csimpl; sep_apply_l_atomic (float_full_open4 input_a (Z.quot batch 4+3) (fp32_slice k (Z.quot batch_pre 4+3) A) __default_fp32); [dump_pre_spatial; lia|unfold fp32_slice; entailer!]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_10 : test_neon_partial_solve_wit_10.
Proof. unfold test_neon_partial_solve_wit_10; intros; unfold UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t; csimpl; sep_apply_l_atomic (float_full_open4 input_a (Z.quot batch 4+3) (fp32_slice k (Z.quot batch_pre 4+3) A) __default_fp32); [dump_pre_spatial; lia|unfold fp32_slice; entailer!]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_11 : test_neon_partial_solve_wit_11.
Proof. unfold test_neon_partial_solve_wit_11; intros; unfold UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t; csimpl; sep_apply_l_atomic (float_full_open4 input_a (Z.quot batch 4+3) (fp32_slice k (Z.quot batch_pre 4+3) A) __default_fp32); [dump_pre_spatial; lia|unfold fp32_slice; entailer!]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_12 : test_neon_partial_solve_wit_12.
Proof. unfold test_neon_partial_solve_wit_12; intros; unfold UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t; csimpl; sep_apply_l_atomic (float_full_open4 input_a (Z.quot batch 4+3) (fp32_slice k (Z.quot batch_pre 4+3) A) __default_fp32); [dump_pre_spatial; lia|unfold fp32_slice; entailer!]. Qed.
End CheckedNeonMoreCalls.
Print Assumptions CheckedNeonMoreCalls.proof_of_test_neon_partial_solve_wit_6.
Print Assumptions CheckedNeonMoreCalls.proof_of_test_neon_partial_solve_wit_10.
Print Assumptions CheckedNeonMoreCalls.proof_of_test_neon_partial_solve_wit_11.
Print Assumptions CheckedNeonMoreCalls.proof_of_test_neon_partial_solve_wit_12.
