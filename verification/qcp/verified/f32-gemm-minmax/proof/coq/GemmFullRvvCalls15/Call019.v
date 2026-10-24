From Coq Require Import ZArith Lia.
From GemmRvv Require Import SafeFrame SLFacts.
From FullDomainRvv Require Import FullState ActiveVector RowValues.
From GemmFullRvvVC15 Require Import unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Opaque fma_rne full_acc full_cell fp32_neon_min fp32_neon_max fp32_min_number fp32_max_number rvv_merge rvv_nanth active8 mask8 row_acc_values row_result_values output_state output_panel output_frame.
Module CheckedCall019.
Lemma proof_of_test_rvv_partial_solve_wit_19 : test_rvv_partial_solve_wit_19.
Proof. unfold test_rvv_partial_solve_wit_19,test_rvv_partial_solve_wit_19_aux;intros;subst;unfold UndefStructPredvfloat32m4_t,UndefStructPredvbool8_t;repeat rewrite typed_field_address in *;safe_frame. Qed.
End CheckedCall019.
Print Assumptions CheckedCall019.proof_of_test_rvv_partial_solve_wit_19.
