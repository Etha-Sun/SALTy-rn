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

(*----- Function pw_tuple_first -----*)

Definition pw_tuple_first_safety_wit_1 := 
forall (p_pre: Z) (b1: Z) (b0: Z) (a1: Z) (a0: Z) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((&(((&((p_pre)  # "uint32x2x2_t" ->ₛ "val") + (0 * sizeof( "uint32x2_t" ))))  # "uint32x2_t" ->ₛ "s0")) # UInt  |-> a0)
  **  ((&(((&((p_pre)  # "uint32x2x2_t" ->ₛ "val") + (0 * sizeof( "uint32x2_t" ))))  # "uint32x2_t" ->ₛ "s1")) # UInt  |-> a1)
  **  ((&(((&((p_pre)  # "uint32x2x2_t" ->ₛ "val") + (1 * sizeof( "uint32x2_t" ))))  # "uint32x2_t" ->ₛ "s0")) # UInt  |-> b0)
  **  ((&(((&((p_pre)  # "uint32x2x2_t" ->ₛ "val") + (1 * sizeof( "uint32x2_t" ))))  # "uint32x2_t" ->ₛ "s1")) # UInt  |-> b1)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition pw_tuple_first_return_wit_1 := 
forall (p_pre: Z) (b1: Z) (b0: Z) (a1: Z) (a0: Z) ,
  ((&(((&((p_pre)  # "uint32x2x2_t" ->ₛ "val") + (0 * sizeof( "uint32x2_t" ))))  # "uint32x2_t" ->ₛ "s0")) # UInt  |-> a0)
  **  ((&(((&((p_pre)  # "uint32x2x2_t" ->ₛ "val") + (0 * sizeof( "uint32x2_t" ))))  # "uint32x2_t" ->ₛ "s1")) # UInt  |-> a1)
  **  ((&(((&((p_pre)  # "uint32x2x2_t" ->ₛ "val") + (1 * sizeof( "uint32x2_t" ))))  # "uint32x2_t" ->ₛ "s0")) # UInt  |-> b0)
  **  ((&(((&((p_pre)  # "uint32x2x2_t" ->ₛ "val") + (1 * sizeof( "uint32x2_t" ))))  # "uint32x2_t" ->ₛ "s1")) # UInt  |-> b1)
|--
  “ (a0 = a0) ”
  &&  ((&(((&((p_pre)  # "uint32x2x2_t" ->ₛ "val") + (0 * sizeof( "uint32x2_t" ))))  # "uint32x2_t" ->ₛ "s0")) # UInt  |-> a0)
  **  ((&(((&((p_pre)  # "uint32x2x2_t" ->ₛ "val") + (0 * sizeof( "uint32x2_t" ))))  # "uint32x2_t" ->ₛ "s1")) # UInt  |-> a1)
  **  ((&(((&((p_pre)  # "uint32x2x2_t" ->ₛ "val") + (1 * sizeof( "uint32x2_t" ))))  # "uint32x2_t" ->ₛ "s0")) # UInt  |-> b0)
  **  ((&(((&((p_pre)  # "uint32x2x2_t" ->ₛ "val") + (1 * sizeof( "uint32x2_t" ))))  # "uint32x2_t" ->ₛ "s1")) # UInt  |-> b1)
.

Module Type VC_Correct.


Axiom proof_of_pw_tuple_first_safety_wit_1 : pw_tuple_first_safety_wit_1.
Axiom proof_of_pw_tuple_first_return_wit_1 : pw_tuple_first_return_wit_1.

End VC_Correct.
