Require Import Coq.ZArith.ZArith.
Require Import Coq.Bool.Bool.
Require Import Coq.Strings.String.
Require Import Coq.Strings.Ascii.
Require Import Coq.Lists.List.
Require Import Coq.Classes.RelationClasses.
Require Import Coq.Classes.Morphisms.
Require Import Coq.micromega.Psatz.
Require Import Coq.Sorting.Permutation.
From AUXLib Require Import int_auto Axioms Feq Idents ListLib VMap.
Require Import SetsClass.SetsClass. Import SetsNotation.
From SimpleC.SL Require Import Mem SeparationLogic.
Require Import Logic.LogicGenerator.demo932.Interface.
Local Open Scope Z_scope.
Local Open Scope sets.
Local Open Scope string_scope.
Local Open Scope list.
Import Snaive_C_Rules64.
Require Import Rndne.Types.
Require Import QcpVadd.VaddBits.
Require Import QcpNeonLoop.InvariantFacts.
Require Import QcpNeon.NeonBridge.
Require Import QcpNeonLoop.NeonLoopBridge.
Require Import QcpRvv32.RvvLogic.
Require Import QcpRvv32.RvvStoreModel.
Require Import QcpRvv32.RvvLoopModel.
Require Import Rndne.ProgramModel.
Require Import QcpVadd.VaddBits.
Require Import QcpRvv32.RvvLogic.
Require Import QcpRvv32.RvvStoreModel.
Require Import QcpRvv32.RvvLoopModel.
Local Open Scope sac.
From QcpVadd Require Import float_array_strategy_goal.
From QcpVadd Require Import float_array_strategy_proof.
From QcpNeon Require Import neon_bridge_strategy_goal.
From QcpNeon Require Import neon_bridge_strategy_proof.
From QcpNeonLoop Require Import neon_tail_strategy_goal.
From QcpNeonLoop Require Import neon_tail_strategy_proof.
From QcpRvv32 Require Import rvv_arrays_strategy_goal.
From QcpRvv32 Require Import rvv_arrays_strategy_proof.
From QcpRvv32 Require Import rvv_store_strategy_goal.
From QcpRvv32 Require Import rvv_store_strategy_proof.
From QcpRvv32 Require Import rvv_loop_strategy_goal.
From QcpRvv32 Require Import rvv_loop_strategy_proof.
From Rndne Require Import rndne_memory_strategy_goal.
From Rndne Require Import rndne_memory_strategy_proof.

(*----- Function __riscv_vsetvl_e32m8 -----*)

Definition __riscv_vsetvl_e32m8_safety_wit_1 := 
forall (n_pre: Z) ,
  ((( &( "n" ) )) # UInt64  |-> n_pre)
|--
  “ (32 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 32) ”
.

Definition __riscv_vsetvl_e32m8_safety_wit_2 := 
forall (n_pre: Z) (PreH1 : (n_pre >= 32)) ,
  ((( &( "n" ) )) # UInt64  |-> n_pre)
|--
  “ (32 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 32) ”
.

Definition __riscv_vsetvl_e32m8_return_wit_1 := 
(
forall (n_pre: Z) (PreH1 : (n_pre < 32)) ,
  TT && emp 
|--
  “ (n_pre = (vadd_vl (n_pre))) ”
  &&  emp
) \/
(
forall (n_pre: Z) (PreH1 : (n_pre < 32)) ,
  TT && emp 
|--
  “ (n_pre = (vadd_vl (n_pre))) ”
  &&  emp
).

Definition __riscv_vsetvl_e32m8_return_wit_1_split_goal_1 := 
forall (n_pre: Z) (PreH1 : (n_pre < 32)) ,
  (n_pre = (vadd_vl (n_pre)))
.

Definition __riscv_vsetvl_e32m8_return_wit_2 := 
(
forall (n_pre: Z) (PreH1 : (n_pre >= 32)) ,
  TT && emp 
|--
  “ (32 = (vadd_vl (n_pre))) ”
  &&  emp
) \/
(
forall (n_pre: Z) (PreH1 : (n_pre >= 32)) ,
  TT && emp 
|--
  “ (32 = (vadd_vl (n_pre))) ”
  &&  emp
).

Definition __riscv_vsetvl_e32m8_return_wit_2_split_goal_1 := 
forall (n_pre: Z) (PreH1 : (n_pre >= 32)) ,
  (32 = (vadd_vl (n_pre)))
.

Module Type VC_Correct.

Include float_array_Strategy_Correct.
Include neon_bridge_Strategy_Correct.
Include neon_tail_Strategy_Correct.
Include rvv_arrays_Strategy_Correct.
Include rvv_store_Strategy_Correct.
Include rvv_loop_Strategy_Correct.
Include rndne_memory_Strategy_Correct.

Axiom proof_of___riscv_vsetvl_e32m8_safety_wit_1 : __riscv_vsetvl_e32m8_safety_wit_1.
Axiom proof_of___riscv_vsetvl_e32m8_safety_wit_2 : __riscv_vsetvl_e32m8_safety_wit_2.
Axiom proof_of___riscv_vsetvl_e32m8_return_wit_1 : __riscv_vsetvl_e32m8_return_wit_1.
Axiom proof_of___riscv_vsetvl_e32m8_return_wit_2 : __riscv_vsetvl_e32m8_return_wit_2.

End VC_Correct.
