Require Import Coq.ZArith.ZArith Coq.micromega.Psatz.
From QcpNeonLoop Require Import neon_loop_unit_goal NeonLoopBridge.
From QcpNeon Require Import NeonBridge.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedNeonMoreCalls.
Lemma proof_of_test_neon_partial_solve_wit_22 : test_neon_partial_solve_wit_22.
Proof. unfold test_neon_partial_solve_wit_22; intros; unfold UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t; csimpl; sep_apply_l_atomic (float_undef_open2 output (Z.quot batch 4)); [dump_pre_spatial; lia|replace (output+0*sizeof(FLOAT)) with output by lia; entailer!]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_23 : test_neon_partial_solve_wit_23.
Proof. unfold test_neon_partial_solve_wit_23; intros; unfold UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t; csimpl; sep_apply_l_atomic (float_undef_open2 output (Z.quot batch 4)); [dump_pre_spatial; lia|replace (output+0*sizeof(FLOAT)) with output by lia; entailer!]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_26 : test_neon_partial_solve_wit_26.
Proof. unfold test_neon_partial_solve_wit_26; intros _; unfold test_neon_partial_solve_wit_26_aux; intros; unfold UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t; csimpl; sep_apply_l_atomic (FloatArray.undef_seg_unfold output 2 (Z.quot batch 4)); [dump_pre_spatial; lia|unfold StoreFloatAsElement.undefstoreA; entailer!]. Qed.
Lemma proof_of_test_neon_partial_solve_wit_27 : test_neon_partial_solve_wit_27.
Proof. unfold test_neon_partial_solve_wit_27; intros _; unfold test_neon_partial_solve_wit_27_aux; intros; unfold UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t; csimpl; sep_apply_l_atomic (float_undef_open1 output (Z.quot batch 4)); [dump_pre_spatial; lia|replace (output+0*sizeof(FLOAT)) with output by lia; entailer!]. Qed.
End CheckedNeonMoreCalls.
Print Assumptions CheckedNeonMoreCalls.proof_of_test_neon_partial_solve_wit_22.
Print Assumptions CheckedNeonMoreCalls.proof_of_test_neon_partial_solve_wit_23.
Print Assumptions CheckedNeonMoreCalls.proof_of_test_neon_partial_solve_wit_26.
Print Assumptions CheckedNeonMoreCalls.proof_of_test_neon_partial_solve_wit_27.
