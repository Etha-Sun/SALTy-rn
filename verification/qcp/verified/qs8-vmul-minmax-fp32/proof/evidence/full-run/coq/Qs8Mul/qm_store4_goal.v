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
Require Import Qs8Mul.Types.
Require Import Qs8Mul.IntrinsicModel.
Require Import Qs8Mul.ActiveModel.
Local Open Scope sac.

(*----- Function qm_store4 -----*)

Definition qm_store4_safety_wit_1 := 
forall (lane_pre: Z) (out_pre: Z) (a_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (lane_pre = 0)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "out" ) )) # Ptr  |-> out_pre)
  **  ((( &( "lane" ) )) # Int  |-> lane_pre)
  **  (((out_pre + (0 * sizeof(CHAR)))) # Char  |->_)
  **  (((out_pre + (1 * sizeof(CHAR)))) # Char  |->_)
  **  (((out_pre + (2 * sizeof(CHAR)))) # Char  |->_)
  **  (((out_pre + (3 * sizeof(CHAR)))) # Char  |->_)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s7")) # Char  |-> x7)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qm_store4_safety_wit_2 := 
forall (lane_pre: Z) (out_pre: Z) (a_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (lane_pre = 0)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "out" ) )) # Ptr  |-> out_pre)
  **  ((( &( "lane" ) )) # Int  |-> lane_pre)
  **  (((out_pre + (0 * sizeof(CHAR)))) # Char  |-> x0)
  **  (((out_pre + (1 * sizeof(CHAR)))) # Char  |->_)
  **  (((out_pre + (2 * sizeof(CHAR)))) # Char  |->_)
  **  (((out_pre + (3 * sizeof(CHAR)))) # Char  |->_)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s7")) # Char  |-> x7)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition qm_store4_safety_wit_3 := 
forall (lane_pre: Z) (out_pre: Z) (a_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (lane_pre = 0)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "out" ) )) # Ptr  |-> out_pre)
  **  ((( &( "lane" ) )) # Int  |-> lane_pre)
  **  (((out_pre + (0 * sizeof(CHAR)))) # Char  |-> x0)
  **  (((out_pre + (1 * sizeof(CHAR)))) # Char  |-> x1)
  **  (((out_pre + (2 * sizeof(CHAR)))) # Char  |->_)
  **  (((out_pre + (3 * sizeof(CHAR)))) # Char  |->_)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s7")) # Char  |-> x7)
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition qm_store4_safety_wit_4 := 
forall (lane_pre: Z) (out_pre: Z) (a_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (lane_pre = 0)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "out" ) )) # Ptr  |-> out_pre)
  **  ((( &( "lane" ) )) # Int  |-> lane_pre)
  **  (((out_pre + (0 * sizeof(CHAR)))) # Char  |-> x0)
  **  (((out_pre + (1 * sizeof(CHAR)))) # Char  |-> x1)
  **  (((out_pre + (2 * sizeof(CHAR)))) # Char  |-> x2)
  **  (((out_pre + (3 * sizeof(CHAR)))) # Char  |->_)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s7")) # Char  |-> x7)
|--
  “ (3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 3) ”
.

Definition qm_store4_return_wit_1 := 
forall (lane_pre: Z) (out_pre: Z) (a_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (lane_pre = 0)) ,
  (((out_pre + (0 * sizeof(CHAR)))) # Char  |-> x0)
  **  (((out_pre + (1 * sizeof(CHAR)))) # Char  |-> x1)
  **  (((out_pre + (2 * sizeof(CHAR)))) # Char  |-> x2)
  **  (((out_pre + (3 * sizeof(CHAR)))) # Char  |-> x3)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s7")) # Char  |-> x7)
|--
  (((out_pre + (0 * sizeof(CHAR)))) # Char  |-> x0)
  **  (((out_pre + (1 * sizeof(CHAR)))) # Char  |-> x1)
  **  (((out_pre + (2 * sizeof(CHAR)))) # Char  |-> x2)
  **  (((out_pre + (3 * sizeof(CHAR)))) # Char  |-> x3)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s7")) # Char  |-> x7)
.

Module Type VC_Correct.


Axiom proof_of_qm_store4_safety_wit_1 : qm_store4_safety_wit_1.
Axiom proof_of_qm_store4_safety_wit_2 : qm_store4_safety_wit_2.
Axiom proof_of_qm_store4_safety_wit_3 : qm_store4_safety_wit_3.
Axiom proof_of_qm_store4_safety_wit_4 : qm_store4_safety_wit_4.
Axiom proof_of_qm_store4_return_wit_1 : qm_store4_return_wit_1.

End VC_Correct.
