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
Local Open Scope sac.

(*----- Function dw_width_size_t -----*)

Definition dw_width_size_t_safety_wit_1 := 
  TT && emp 
|--
  “ (1 <> (INT_MIN)) ”
.

Definition dw_width_size_t_safety_wit_2 := 
  TT && emp 
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition dw_width_size_t_return_wit_1 := 
  TT && emp 
|--
  “ ((unsigned_last_nbits ((-1)) (64)) = UINT64_MAX) ”
  &&  emp
.

(*----- Function dw_width_uintptr -----*)

Definition dw_width_uintptr_safety_wit_1 := 
  TT && emp 
|--
  “ (1 <> (INT_MIN)) ”
.

Definition dw_width_uintptr_safety_wit_2 := 
  TT && emp 
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition dw_width_uintptr_return_wit_1 := 
  TT && emp 
|--
  “ ((unsigned_last_nbits ((-1)) (64)) = UINT64_MAX) ”
  &&  emp
.

(*----- Function dw_width_uint32 -----*)

Definition dw_width_uint32_safety_wit_1 := 
  TT && emp 
|--
  “ (1 <> (INT_MIN)) ”
.

Definition dw_width_uint32_safety_wit_2 := 
  TT && emp 
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition dw_width_uint32_return_wit_1 := 
  TT && emp 
|--
  “ ((unsigned_last_nbits ((-1)) (32)) = UINT_MAX) ”
  &&  emp
.

Module Type VC_Correct.


Axiom proof_of_dw_width_size_t_safety_wit_1 : dw_width_size_t_safety_wit_1.
Axiom proof_of_dw_width_size_t_safety_wit_2 : dw_width_size_t_safety_wit_2.
Axiom proof_of_dw_width_size_t_return_wit_1 : dw_width_size_t_return_wit_1.
Axiom proof_of_dw_width_uintptr_safety_wit_1 : dw_width_uintptr_safety_wit_1.
Axiom proof_of_dw_width_uintptr_safety_wit_2 : dw_width_uintptr_safety_wit_2.
Axiom proof_of_dw_width_uintptr_return_wit_1 : dw_width_uintptr_return_wit_1.
Axiom proof_of_dw_width_uint32_safety_wit_1 : dw_width_uint32_safety_wit_1.
Axiom proof_of_dw_width_uint32_safety_wit_2 : dw_width_uint32_safety_wit_2.
Axiom proof_of_dw_width_uint32_return_wit_1 : dw_width_uint32_return_wit_1.

End VC_Correct.
