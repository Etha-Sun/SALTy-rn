From Coq Require Import ZArith List Lia.
From AUXLib Require Import ListLib.
From SimpleC.SL Require Import Mem SeparationLogic.
From GemmRvv Require Import Model SLBounds ArrayFacts.
From FullDomainRvv Require Import FullState FullModel RowValues ActiveVector.
From FullDomainMemory Require Import InitialState ChunkState.
From FullDomainRvvStore Require Import StoreValues.
From FullRvvWhich Require Import WhichSupport.
From GemmFullRvvVC15 Require Import unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma proof_of_test_rvv_which_implies_wit_1: test_rvv_which_implies_wit_1.
Proof. unfold test_rvv_which_implies_wit_1;right;intros;repeat rewrite Z.rem_mod_nonneg in * by lia;apply initial_output_state;lia.
Qed.
Print Assumptions proof_of_test_rvv_which_implies_wit_1.
