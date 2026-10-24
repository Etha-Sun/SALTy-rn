From GemmFullRvvVC15 Require Import unit_goal.
From GemmRvv Require Import copy_strategy_proof.
From FullCleanupV2 Require Import cleanup_v2_strategy_proof.
From GemmFullRvvProof15 Require Import AllCallsCheckedFinal AllRvvPure Identity15.
From FullRvvWhichAggregate Require Import AllWhichChecked.
From FullRvvLoopProof Require Import AllLoopChecked.
Module CheckedFullRvv15 <: GemmFullRvvVC15.unit_goal.VC_Correct.
Include GemmRvv.copy_strategy_proof.Checked.
Include FullCleanupV2.cleanup_v2_strategy_proof.Checked.
Include Identity15.CheckedIdentity.
Include AllCallsCheckedFinal.CheckedCalls.
Include AllRvvPure.AllRvvPure.
Include AllWhichChecked.CheckedFullRvvWhich.
Include AllLoopChecked.CheckedFullRvvLoop.
End CheckedFullRvv15.
