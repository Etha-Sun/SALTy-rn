From SimpleC.SL Require Import Mem SeparationLogic.
From FullDomainNeonVC Require Import neon_full_goal.
From FullNeonWhich Require Import WhichSupport.
From FullDomainMemory Require Import InitialState ChunkState.
From FullDomainNeon Require Import NeonStoreState.
From FullNeonPhase Require Import NeonPhaseChecked.
From Coq Require Import ZArith Lia.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma proof_of_test_neon_which_implies_wit_1 : test_neon_which_implies_wit_1.
Proof. unfold test_neon_which_implies_wit_1;right;intros;apply initial_output_state;lia. Qed.
Print Assumptions proof_of_test_neon_which_implies_wit_1.
