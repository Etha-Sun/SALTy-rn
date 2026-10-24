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
Lemma proof_of_test_rvv_which_implies_wit_20: test_rvv_which_implies_wit_20.
Proof. unfold test_rvv_which_implies_wit_20;right;intros;repeat rewrite Z.rem_mod_nonneg in * by lia;subst c3;subst vl.
pose proof(current_panel nc_pre nc ltac:(lia) ltac:(assumption))as[Htotal[Hpanel Hbase]].
remember((nc_pre-nc)÷8)as b eqn:Hb in *;clear Hb.
replace(nc_pre-nc)with(8*b)by lia.
apply output_panel_prepare;lia.
Qed.
Print Assumptions proof_of_test_rvv_which_implies_wit_20.
