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
Require Import QcpRvv32.RvvLogic.
Require Import QcpRvv32.RvvStoreModel.
Require Import QcpRvv32.RvvLoopModel.
Local Open Scope sac.

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


Axiom proof_of___riscv_vsetvl_e32m8_safety_wit_1 : __riscv_vsetvl_e32m8_safety_wit_1.
Axiom proof_of___riscv_vsetvl_e32m8_safety_wit_2 : __riscv_vsetvl_e32m8_safety_wit_2.
Axiom proof_of___riscv_vsetvl_e32m8_return_wit_1 : __riscv_vsetvl_e32m8_return_wit_1.
Axiom proof_of___riscv_vsetvl_e32m8_return_wit_2 : __riscv_vsetvl_e32m8_return_wit_2.

End VC_Correct.
