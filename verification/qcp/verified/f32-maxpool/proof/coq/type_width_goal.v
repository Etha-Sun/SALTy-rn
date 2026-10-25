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
Require Import MaxPool.Model.
Local Open Scope sac.

(*----- Function mp_width_size_t -----*)

Definition mp_width_size_t_return_wit_1 := 
  TT && emp 
|--
  “ (sizeof(UINT64) = 8) ”
  &&  emp
.

(*----- Function mp_width_uintptr -----*)

Definition mp_width_uintptr_return_wit_1 := 
  TT && emp 
|--
  “ (sizeof(UINT64) = 8) ”
  &&  emp
.

(*----- Function mp_width_u32 -----*)

Definition mp_width_u32_return_wit_1 := 
  TT && emp 
|--
  “ (sizeof(UINT) = 4) ”
  &&  emp
.

(*----- Function mp_width_float -----*)

Definition mp_width_float_return_wit_1 := 
  TT && emp 
|--
  “ (sizeof(FLOAT) = 4) ”
  &&  emp
.

(*----- Function mp_width_pointer -----*)

Definition mp_width_pointer_return_wit_1 := 
  TT && emp 
|--
  “ (sizeof(PTR) = 8) ”
  &&  emp
.

(*----- Function mp_width_i32 -----*)

Definition mp_width_i32_return_wit_1 := 
  TT && emp 
|--
  “ (sizeof(INT) = 4) ”
  &&  emp
.

(*----- Function mp_width_i64 -----*)

Definition mp_width_i64_return_wit_1 := 
  TT && emp 
|--
  “ (sizeof(INT64) = 8) ”
  &&  emp
.

(*----- Function mp_width_u64 -----*)

Definition mp_width_u64_return_wit_1 := 
  TT && emp 
|--
  “ (sizeof(UINT64) = 8) ”
  &&  emp
.

Module Type VC_Correct.


Axiom proof_of_mp_width_size_t_return_wit_1 : mp_width_size_t_return_wit_1.
Axiom proof_of_mp_width_uintptr_return_wit_1 : mp_width_uintptr_return_wit_1.
Axiom proof_of_mp_width_u32_return_wit_1 : mp_width_u32_return_wit_1.
Axiom proof_of_mp_width_float_return_wit_1 : mp_width_float_return_wit_1.
Axiom proof_of_mp_width_pointer_return_wit_1 : mp_width_pointer_return_wit_1.
Axiom proof_of_mp_width_i32_return_wit_1 : mp_width_i32_return_wit_1.
Axiom proof_of_mp_width_i64_return_wit_1 : mp_width_i64_return_wit_1.
Axiom proof_of_mp_width_u64_return_wit_1 : mp_width_u64_return_wit_1.

End VC_Correct.
