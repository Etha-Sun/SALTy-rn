From Qu8Cvt Require Import RvvKernelBounds rvv_unit_goal.
From Coq Require Import ZArith Lia List.
From QcpVadd Require Import VaddBits.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma proof_of_test_rvv_partial_solve_wit_7 : Qu8Cvt.rvv_unit_goal.test_rvv_partial_solve_wit_7.
Proof. unfold Qu8Cvt.rvv_unit_goal.test_rvv_partial_solve_wit_7;try left;cvt_unsigned_complete. Qed.
Print Assumptions proof_of_test_rvv_partial_solve_wit_7.
