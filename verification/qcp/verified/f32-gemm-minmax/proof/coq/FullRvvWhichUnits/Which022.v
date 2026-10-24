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
Lemma proof_of_test_rvv_which_implies_wit_22: test_rvv_which_implies_wit_22.
Proof. unfold test_rvv_which_implies_wit_22;right;intros;repeat rewrite Z.rem_mod_nonneg in * by lia;subst vl.
pose proof(current_panel nc_pre nc ltac:(lia) ltac:(assumption))as[Htotal[Hpanel Hbase]].
rewrite output_panel_four,(panel_done_add_width nc_pre ((nc_pre-nc)÷8) Htotal Hpanel),Hbase;apply derivable1_refl.
Qed.
Print Assumptions proof_of_test_rvv_which_implies_wit_22.
