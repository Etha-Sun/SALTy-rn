From Coq Require Import ZArith Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
Require Import GemmFullRvvVC15.unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
From FullGemmPureRvvRetry02 Require Import Pure000.
Module CheckedPure.
Definition proof_of_test_rvv_safety_wit_31 : test_rvv_safety_wit_31 := Pure000.proof_of_test_rvv_safety_wit_31.
End CheckedPure.
