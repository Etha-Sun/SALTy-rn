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
Require Import Qs8Lrelu.Model.
Local Open Scope sac.

(*----- Function width_size_t -----*)

Definition width_size_t_return_wit_1 := 
  TT && emp 
|--
  “ (sizeof(UINT64) = 8) ”
  &&  emp
.

(*----- Function width_i8 -----*)

Definition width_i8_return_wit_1 := 
  TT && emp 
|--
  “ (sizeof(CHAR) = 1) ”
  &&  emp
.

(*----- Function width_i16 -----*)

Definition width_i16_return_wit_1 := 
  TT && emp 
|--
  “ (sizeof(SHORT) = 2) ”
  &&  emp
.

(*----- Function width_i32 -----*)

Definition width_i32_return_wit_1 := 
  TT && emp 
|--
  “ (sizeof(INT) = 4) ”
  &&  emp
.

(*----- Function width_i64 -----*)

Definition width_i64_return_wit_1 := 
  TT && emp 
|--
  “ (sizeof(INT64) = 8) ”
  &&  emp
.

(*----- Function width_u16 -----*)

Definition width_u16_return_wit_1 := 
  TT && emp 
|--
  “ (sizeof(USHORT) = 2) ”
  &&  emp
.

(*----- Function width_u32 -----*)

Definition width_u32_return_wit_1 := 
  TT && emp 
|--
  “ (sizeof(UINT) = 4) ”
  &&  emp
.

(*----- Function width_pointer -----*)

Definition width_pointer_return_wit_1 := 
  TT && emp 
|--
  “ (sizeof(PTR) = 8) ”
  &&  emp
.

Module Type VC_Correct.


Axiom proof_of_width_size_t_return_wit_1 : width_size_t_return_wit_1.
Axiom proof_of_width_i8_return_wit_1 : width_i8_return_wit_1.
Axiom proof_of_width_i16_return_wit_1 : width_i16_return_wit_1.
Axiom proof_of_width_i32_return_wit_1 : width_i32_return_wit_1.
Axiom proof_of_width_i64_return_wit_1 : width_i64_return_wit_1.
Axiom proof_of_width_u16_return_wit_1 : width_u16_return_wit_1.
Axiom proof_of_width_u32_return_wit_1 : width_u32_return_wit_1.
Axiom proof_of_width_pointer_return_wit_1 : width_pointer_return_wit_1.

End VC_Correct.
