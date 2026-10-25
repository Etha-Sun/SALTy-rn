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
Require Import X32Transpose.VectorModel.
Require Import X32Transpose.ProgramModel.
Local Open Scope sac.

(*----- Function xt_sizeof_size_t -----*)

Definition xt_sizeof_size_t_return_wit_1 := 
  TT && emp 
|--
  “ (sizeof(UINT64) = 8) ”
  &&  emp
.

(*----- Function xt_sizeof_uintptr_t -----*)

Definition xt_sizeof_uintptr_t_return_wit_1 := 
  TT && emp 
|--
  “ (sizeof(UINT64) = 8) ”
  &&  emp
.

(*----- Function xt_sizeof_uint32_t -----*)

Definition xt_sizeof_uint32_t_return_wit_1 := 
  TT && emp 
|--
  “ (sizeof(UINT) = 4) ”
  &&  emp
.

(*----- Function xt_size_t_is_unsigned -----*)

Definition xt_size_t_is_unsigned_safety_wit_1 := 
  TT && emp 
|--
  “ (1 <> (INT_MIN)) ”
.

Definition xt_size_t_is_unsigned_safety_wit_2 := 
  TT && emp 
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition xt_size_t_is_unsigned_safety_wit_3 := 
  TT && emp 
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition xt_size_t_is_unsigned_safety_wit_4 := 
forall (PreH1 : ((unsigned_last_nbits ((-1)) (64)) <= 0)) ,
  TT && emp 
|--
  “ False ”
.

Definition xt_size_t_is_unsigned_return_wit_1 := 
forall (PreH1 : ((unsigned_last_nbits ((-1)) (64)) > 0)) ,
  TT && emp 
|--
  “ (1 = 1) ”
  &&  emp
.

Module Type VC_Correct.


Axiom proof_of_xt_sizeof_size_t_return_wit_1 : xt_sizeof_size_t_return_wit_1.
Axiom proof_of_xt_sizeof_uintptr_t_return_wit_1 : xt_sizeof_uintptr_t_return_wit_1.
Axiom proof_of_xt_sizeof_uint32_t_return_wit_1 : xt_sizeof_uint32_t_return_wit_1.
Axiom proof_of_xt_size_t_is_unsigned_safety_wit_1 : xt_size_t_is_unsigned_safety_wit_1.
Axiom proof_of_xt_size_t_is_unsigned_safety_wit_2 : xt_size_t_is_unsigned_safety_wit_2.
Axiom proof_of_xt_size_t_is_unsigned_safety_wit_3 : xt_size_t_is_unsigned_safety_wit_3.
Axiom proof_of_xt_size_t_is_unsigned_safety_wit_4 : xt_size_t_is_unsigned_safety_wit_4.
Axiom proof_of_xt_size_t_is_unsigned_return_wit_1 : xt_size_t_is_unsigned_return_wit_1.

End VC_Correct.
