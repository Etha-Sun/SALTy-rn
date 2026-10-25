From Coq Require Import ZArith List Lia Strings.String.
From Qs8Rvv Require Import rvv_goal.
From Qs8Gemm Require Import KernelFrame NaNRepair.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module Checked.
Lemma proof_of_test_rvv_partial_solve_wit_75:rvv_goal.test_rvv_partial_solve_wit_75.
Proof.
 unfold test_rvv_partial_solve_wit_75;try left;intros;qs8_normalize2;qs8_domain_facts.
 timeout 90 (solve [qs8_kernel_frame | qs8_pure2 | qs8_frame2 | qs8_read_frame |
 unfold UndefStructPredvint32m2_t,UndefStructPredvint16m1_t,UndefStructPredvint8mf2_t,
 UndefStructPredvfloat32m2_t,UndefStructPredvbool16_t;qs8_frame2 | entailer!]).
 all: try lia.
Qed.
End Checked.
Print Assumptions Checked.proof_of_test_rvv_partial_solve_wit_75.
