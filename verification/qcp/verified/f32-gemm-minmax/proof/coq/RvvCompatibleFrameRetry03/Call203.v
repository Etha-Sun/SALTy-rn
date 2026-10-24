From Coq Require Import ZArith Lia.
From GemmRvv Require Import Model SLFacts.
From LeaderAutomation Require Import FastFrame.
From FullDomainRvv Require Import FullState ActiveVector RowValues.
From RvvOriginalVC03 Require Import unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Opaque fma_rne full_acc full_cell fp32_neon_min fp32_neon_max fp32_min_number fp32_max_number rvv_merge rvv_nanth active8 mask8 row_acc_values row_result_values output_state output_panel output_frame.
Ltac compatible_frame :=
 first [apply _derivable1_andp_intros;
 [unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
 |forget_rhs_fields;LeaderAutomation.FastFrame.opaque_leaves;sepcon_assoc_change;LeaderAutomation.FastFrame.fast_cancel]
 |forget_rhs_fields;LeaderAutomation.FastFrame.opaque_leaves;sepcon_assoc_change;LeaderAutomation.FastFrame.fast_cancel].
Module CheckedCall203.
Lemma proof_of_test_rvv_partial_solve_wit_203 : test_rvv_partial_solve_wit_203.
Proof. unfold test_rvv_partial_solve_wit_203;intros;subst;unfold UndefStructPredvfloat32m4_t,UndefStructPredvbool8_t;repeat rewrite typed_field_address in *;compatible_frame. Qed.
End CheckedCall203.
Print Assumptions CheckedCall203.proof_of_test_rvv_partial_solve_wit_203.
