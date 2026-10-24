From Coq Require Import ZArith Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
From FullDomainRvv Require Import FullModel MachineDomain.
Require Import GemmFullRvvVC15.unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
From FullGemmPureRvvRetry03 Require Import Pure000.
From FullGemmPureRvvRetry03 Require Import Pure001.
Module CheckedPure.
Definition proof_of_test_rvv_partial_solve_wit_15_pure : test_rvv_partial_solve_wit_15_pure := Pure000.proof_of_test_rvv_partial_solve_wit_15_pure.
Definition proof_of_test_rvv_partial_solve_wit_16_pure : test_rvv_partial_solve_wit_16_pure := Pure001.proof_of_test_rvv_partial_solve_wit_16_pure.
End CheckedPure.
