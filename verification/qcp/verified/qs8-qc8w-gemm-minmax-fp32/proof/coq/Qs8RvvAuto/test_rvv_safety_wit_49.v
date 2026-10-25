From Coq Require Import ZArith List Lia Strings.String.
From Qs8Rvv Require Import rvv_goal.
From Qs8Gemm Require Import ProofSupport NaNRepair.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module Checked.
Lemma proof_of_test_rvv_safety_wit_49:rvv_goal.test_rvv_safety_wit_49.
Proof.
 unfold test_rvv_safety_wit_49;try left;intros;qs8_normalize.
 timeout 90 (solve [qs8_pure | qs8_frame |
 unfold UndefStructPredvint32m2_t,UndefStructPredvint16m1_t,UndefStructPredvint8mf2_t,
 UndefStructPredvfloat32m2_t,UndefStructPredvbool16_t;qs8_frame | entailer!]).
Qed.
End Checked.
Print Assumptions Checked.proof_of_test_rvv_safety_wit_49.
