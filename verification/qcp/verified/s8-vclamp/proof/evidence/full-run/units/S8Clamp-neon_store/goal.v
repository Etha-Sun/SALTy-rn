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
Require Import S8Clamp.Types.
Require Import S8Clamp.MemoryModel.
Require Import S8Clamp.NeonStoreModel.
Local Open Scope sac.
From S8Clamp Require Import s8_arrays_strategy_goal.
From S8Clamp Require Import s8_arrays_strategy_proof.

(*----- Function qcp_s8_store8 -----*)

Definition qcp_s8_store8_safety_wit_1 := 
forall (a_pre: Z) (p_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s7")) # Char  |-> x7)
  **  (((p_pre + (0 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (1 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (2 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (3 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (4 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (5 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (6 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (7 * sizeof(CHAR)))) # Char  |->_)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qcp_s8_store8_safety_wit_2 := 
forall (a_pre: Z) (p_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s7")) # Char  |-> x7)
  **  (((p_pre + (0 * sizeof(CHAR)))) # Char  |-> x0)
  **  (((p_pre + (1 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (2 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (3 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (4 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (5 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (6 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (7 * sizeof(CHAR)))) # Char  |->_)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition qcp_s8_store8_safety_wit_3 := 
forall (a_pre: Z) (p_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s7")) # Char  |-> x7)
  **  (((p_pre + (0 * sizeof(CHAR)))) # Char  |-> x0)
  **  (((p_pre + (1 * sizeof(CHAR)))) # Char  |-> x1)
  **  (((p_pre + (2 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (3 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (4 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (5 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (6 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (7 * sizeof(CHAR)))) # Char  |->_)
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition qcp_s8_store8_safety_wit_4 := 
forall (a_pre: Z) (p_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s7")) # Char  |-> x7)
  **  (((p_pre + (0 * sizeof(CHAR)))) # Char  |-> x0)
  **  (((p_pre + (1 * sizeof(CHAR)))) # Char  |-> x1)
  **  (((p_pre + (2 * sizeof(CHAR)))) # Char  |-> x2)
  **  (((p_pre + (3 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (4 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (5 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (6 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (7 * sizeof(CHAR)))) # Char  |->_)
|--
  “ (3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 3) ”
.

Definition qcp_s8_store8_safety_wit_5 := 
forall (a_pre: Z) (p_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s7")) # Char  |-> x7)
  **  (((p_pre + (0 * sizeof(CHAR)))) # Char  |-> x0)
  **  (((p_pre + (1 * sizeof(CHAR)))) # Char  |-> x1)
  **  (((p_pre + (2 * sizeof(CHAR)))) # Char  |-> x2)
  **  (((p_pre + (3 * sizeof(CHAR)))) # Char  |-> x3)
  **  (((p_pre + (4 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (5 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (6 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (7 * sizeof(CHAR)))) # Char  |->_)
|--
  “ (4 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 4) ”
.

Definition qcp_s8_store8_safety_wit_6 := 
forall (a_pre: Z) (p_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s7")) # Char  |-> x7)
  **  (((p_pre + (0 * sizeof(CHAR)))) # Char  |-> x0)
  **  (((p_pre + (1 * sizeof(CHAR)))) # Char  |-> x1)
  **  (((p_pre + (2 * sizeof(CHAR)))) # Char  |-> x2)
  **  (((p_pre + (3 * sizeof(CHAR)))) # Char  |-> x3)
  **  (((p_pre + (4 * sizeof(CHAR)))) # Char  |-> x4)
  **  (((p_pre + (5 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (6 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (7 * sizeof(CHAR)))) # Char  |->_)
|--
  “ (5 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 5) ”
.

Definition qcp_s8_store8_safety_wit_7 := 
forall (a_pre: Z) (p_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s7")) # Char  |-> x7)
  **  (((p_pre + (0 * sizeof(CHAR)))) # Char  |-> x0)
  **  (((p_pre + (1 * sizeof(CHAR)))) # Char  |-> x1)
  **  (((p_pre + (2 * sizeof(CHAR)))) # Char  |-> x2)
  **  (((p_pre + (3 * sizeof(CHAR)))) # Char  |-> x3)
  **  (((p_pre + (4 * sizeof(CHAR)))) # Char  |-> x4)
  **  (((p_pre + (5 * sizeof(CHAR)))) # Char  |-> x5)
  **  (((p_pre + (6 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (7 * sizeof(CHAR)))) # Char  |->_)
|--
  “ (6 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 6) ”
.

Definition qcp_s8_store8_safety_wit_8 := 
forall (a_pre: Z) (p_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s7")) # Char  |-> x7)
  **  (((p_pre + (0 * sizeof(CHAR)))) # Char  |-> x0)
  **  (((p_pre + (1 * sizeof(CHAR)))) # Char  |-> x1)
  **  (((p_pre + (2 * sizeof(CHAR)))) # Char  |-> x2)
  **  (((p_pre + (3 * sizeof(CHAR)))) # Char  |-> x3)
  **  (((p_pre + (4 * sizeof(CHAR)))) # Char  |-> x4)
  **  (((p_pre + (5 * sizeof(CHAR)))) # Char  |-> x5)
  **  (((p_pre + (6 * sizeof(CHAR)))) # Char  |-> x6)
  **  (((p_pre + (7 * sizeof(CHAR)))) # Char  |->_)
|--
  “ (7 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 7) ”
.

Definition qcp_s8_store8_entail_wit_1 := 
(
forall (a_pre: Z) (p_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  (CharArray.undef_full p_pre 8 )
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s7")) # Char  |-> x7)
|--
  ((&((a_pre)  # "int8x8_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s7")) # Char  |-> x7)
  **  (((p_pre + (0 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (1 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (2 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (3 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (4 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (5 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (6 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (7 * sizeof(CHAR)))) # Char  |->_)
) \/
(
forall (p_pre: Z) ,
  (CharArray.undef_missing_i p_pre 2 (1 + 1 ) 8 )
|--
  EX (x_5: Z)  (x_4: Z)  (x_3: Z)  (x_2: Z)  (x: Z) ,
  (((p_pre + (7 * sizeof(CHAR)))) # Char  |-> x_5)
  **  (((p_pre + (6 * sizeof(CHAR)))) # Char  |-> x_4)
  **  (((p_pre + (5 * sizeof(CHAR)))) # Char  |-> x_3)
  **  (((p_pre + (4 * sizeof(CHAR)))) # Char  |-> x_2)
  **  (((p_pre + (3 * sizeof(CHAR)))) # Char  |-> x)
).

Definition qcp_s8_store8_return_wit_1 := 
(
forall (a_pre: Z) (p_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((&((a_pre)  # "int8x8_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s7")) # Char  |-> x7)
  **  (((p_pre + (0 * sizeof(CHAR)))) # Char  |-> x0)
  **  (((p_pre + (1 * sizeof(CHAR)))) # Char  |-> x1)
  **  (((p_pre + (2 * sizeof(CHAR)))) # Char  |-> x2)
  **  (((p_pre + (3 * sizeof(CHAR)))) # Char  |-> x3)
  **  (((p_pre + (4 * sizeof(CHAR)))) # Char  |-> x4)
  **  (((p_pre + (5 * sizeof(CHAR)))) # Char  |-> x5)
  **  (((p_pre + (6 * sizeof(CHAR)))) # Char  |-> x6)
  **  (((p_pre + (7 * sizeof(CHAR)))) # Char  |-> x7)
|--
  (CharArray.full p_pre 8 (s8_pack8 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7)) )
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s7")) # Char  |-> x7)
) \/
(
forall (p_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  (((p_pre + (0 * sizeof(CHAR)))) # Char  |-> x0)
  **  (((p_pre + (1 * sizeof(CHAR)))) # Char  |-> x1)
  **  (((p_pre + (2 * sizeof(CHAR)))) # Char  |-> x2)
  **  (((p_pre + (3 * sizeof(CHAR)))) # Char  |-> x3)
  **  (((p_pre + (4 * sizeof(CHAR)))) # Char  |-> x4)
  **  (((p_pre + (5 * sizeof(CHAR)))) # Char  |-> x5)
  **  (((p_pre + (6 * sizeof(CHAR)))) # Char  |-> x6)
  **  (((p_pre + (7 * sizeof(CHAR)))) # Char  |-> x7)
|--
  (CharArray.full p_pre 8 (s8_pack8 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7)) )
).

Definition qcp_s8_store8_return_wit_1_split_goal_spatial := 
forall (p_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  (((p_pre + (0 * sizeof(CHAR)))) # Char  |-> x0)
  **  (((p_pre + (1 * sizeof(CHAR)))) # Char  |-> x1)
  **  (((p_pre + (2 * sizeof(CHAR)))) # Char  |-> x2)
  **  (((p_pre + (3 * sizeof(CHAR)))) # Char  |-> x3)
  **  (((p_pre + (4 * sizeof(CHAR)))) # Char  |-> x4)
  **  (((p_pre + (5 * sizeof(CHAR)))) # Char  |-> x5)
  **  (((p_pre + (6 * sizeof(CHAR)))) # Char  |-> x6)
  **  (((p_pre + (7 * sizeof(CHAR)))) # Char  |-> x7)
|--
  (CharArray.full p_pre 8 (s8_pack8 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7)) )
.

(*----- Function qcp_s8_store16 -----*)

Definition qcp_s8_store16_safety_wit_1 := 
forall (a_pre: Z) (p_pre: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s7")) # Char  |-> x7)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s8")) # Char  |-> x8)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s9")) # Char  |-> x9)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s10")) # Char  |-> x10)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s11")) # Char  |-> x11)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s12")) # Char  |-> x12)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s13")) # Char  |-> x13)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s14")) # Char  |-> x14)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s15")) # Char  |-> x15)
  **  (((p_pre + (0 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (1 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (2 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (3 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (4 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (5 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (6 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (7 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (8 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (9 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (10 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (11 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (12 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (13 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (14 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (15 * sizeof(CHAR)))) # Char  |->_)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qcp_s8_store16_safety_wit_2 := 
forall (a_pre: Z) (p_pre: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s7")) # Char  |-> x7)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s8")) # Char  |-> x8)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s9")) # Char  |-> x9)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s10")) # Char  |-> x10)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s11")) # Char  |-> x11)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s12")) # Char  |-> x12)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s13")) # Char  |-> x13)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s14")) # Char  |-> x14)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s15")) # Char  |-> x15)
  **  (((p_pre + (0 * sizeof(CHAR)))) # Char  |-> x0)
  **  (((p_pre + (1 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (2 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (3 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (4 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (5 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (6 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (7 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (8 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (9 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (10 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (11 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (12 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (13 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (14 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (15 * sizeof(CHAR)))) # Char  |->_)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition qcp_s8_store16_safety_wit_3 := 
forall (a_pre: Z) (p_pre: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s7")) # Char  |-> x7)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s8")) # Char  |-> x8)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s9")) # Char  |-> x9)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s10")) # Char  |-> x10)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s11")) # Char  |-> x11)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s12")) # Char  |-> x12)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s13")) # Char  |-> x13)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s14")) # Char  |-> x14)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s15")) # Char  |-> x15)
  **  (((p_pre + (0 * sizeof(CHAR)))) # Char  |-> x0)
  **  (((p_pre + (1 * sizeof(CHAR)))) # Char  |-> x1)
  **  (((p_pre + (2 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (3 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (4 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (5 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (6 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (7 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (8 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (9 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (10 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (11 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (12 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (13 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (14 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (15 * sizeof(CHAR)))) # Char  |->_)
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition qcp_s8_store16_safety_wit_4 := 
forall (a_pre: Z) (p_pre: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s7")) # Char  |-> x7)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s8")) # Char  |-> x8)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s9")) # Char  |-> x9)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s10")) # Char  |-> x10)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s11")) # Char  |-> x11)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s12")) # Char  |-> x12)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s13")) # Char  |-> x13)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s14")) # Char  |-> x14)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s15")) # Char  |-> x15)
  **  (((p_pre + (0 * sizeof(CHAR)))) # Char  |-> x0)
  **  (((p_pre + (1 * sizeof(CHAR)))) # Char  |-> x1)
  **  (((p_pre + (2 * sizeof(CHAR)))) # Char  |-> x2)
  **  (((p_pre + (3 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (4 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (5 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (6 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (7 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (8 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (9 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (10 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (11 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (12 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (13 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (14 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (15 * sizeof(CHAR)))) # Char  |->_)
|--
  “ (3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 3) ”
.

Definition qcp_s8_store16_safety_wit_5 := 
forall (a_pre: Z) (p_pre: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s7")) # Char  |-> x7)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s8")) # Char  |-> x8)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s9")) # Char  |-> x9)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s10")) # Char  |-> x10)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s11")) # Char  |-> x11)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s12")) # Char  |-> x12)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s13")) # Char  |-> x13)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s14")) # Char  |-> x14)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s15")) # Char  |-> x15)
  **  (((p_pre + (0 * sizeof(CHAR)))) # Char  |-> x0)
  **  (((p_pre + (1 * sizeof(CHAR)))) # Char  |-> x1)
  **  (((p_pre + (2 * sizeof(CHAR)))) # Char  |-> x2)
  **  (((p_pre + (3 * sizeof(CHAR)))) # Char  |-> x3)
  **  (((p_pre + (4 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (5 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (6 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (7 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (8 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (9 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (10 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (11 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (12 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (13 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (14 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (15 * sizeof(CHAR)))) # Char  |->_)
|--
  “ (4 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 4) ”
.

Definition qcp_s8_store16_safety_wit_6 := 
forall (a_pre: Z) (p_pre: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s7")) # Char  |-> x7)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s8")) # Char  |-> x8)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s9")) # Char  |-> x9)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s10")) # Char  |-> x10)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s11")) # Char  |-> x11)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s12")) # Char  |-> x12)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s13")) # Char  |-> x13)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s14")) # Char  |-> x14)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s15")) # Char  |-> x15)
  **  (((p_pre + (0 * sizeof(CHAR)))) # Char  |-> x0)
  **  (((p_pre + (1 * sizeof(CHAR)))) # Char  |-> x1)
  **  (((p_pre + (2 * sizeof(CHAR)))) # Char  |-> x2)
  **  (((p_pre + (3 * sizeof(CHAR)))) # Char  |-> x3)
  **  (((p_pre + (4 * sizeof(CHAR)))) # Char  |-> x4)
  **  (((p_pre + (5 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (6 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (7 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (8 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (9 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (10 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (11 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (12 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (13 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (14 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (15 * sizeof(CHAR)))) # Char  |->_)
|--
  “ (5 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 5) ”
.

Definition qcp_s8_store16_safety_wit_7 := 
forall (a_pre: Z) (p_pre: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s7")) # Char  |-> x7)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s8")) # Char  |-> x8)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s9")) # Char  |-> x9)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s10")) # Char  |-> x10)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s11")) # Char  |-> x11)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s12")) # Char  |-> x12)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s13")) # Char  |-> x13)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s14")) # Char  |-> x14)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s15")) # Char  |-> x15)
  **  (((p_pre + (0 * sizeof(CHAR)))) # Char  |-> x0)
  **  (((p_pre + (1 * sizeof(CHAR)))) # Char  |-> x1)
  **  (((p_pre + (2 * sizeof(CHAR)))) # Char  |-> x2)
  **  (((p_pre + (3 * sizeof(CHAR)))) # Char  |-> x3)
  **  (((p_pre + (4 * sizeof(CHAR)))) # Char  |-> x4)
  **  (((p_pre + (5 * sizeof(CHAR)))) # Char  |-> x5)
  **  (((p_pre + (6 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (7 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (8 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (9 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (10 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (11 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (12 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (13 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (14 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (15 * sizeof(CHAR)))) # Char  |->_)
|--
  “ (6 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 6) ”
.

Definition qcp_s8_store16_safety_wit_8 := 
forall (a_pre: Z) (p_pre: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s7")) # Char  |-> x7)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s8")) # Char  |-> x8)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s9")) # Char  |-> x9)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s10")) # Char  |-> x10)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s11")) # Char  |-> x11)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s12")) # Char  |-> x12)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s13")) # Char  |-> x13)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s14")) # Char  |-> x14)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s15")) # Char  |-> x15)
  **  (((p_pre + (0 * sizeof(CHAR)))) # Char  |-> x0)
  **  (((p_pre + (1 * sizeof(CHAR)))) # Char  |-> x1)
  **  (((p_pre + (2 * sizeof(CHAR)))) # Char  |-> x2)
  **  (((p_pre + (3 * sizeof(CHAR)))) # Char  |-> x3)
  **  (((p_pre + (4 * sizeof(CHAR)))) # Char  |-> x4)
  **  (((p_pre + (5 * sizeof(CHAR)))) # Char  |-> x5)
  **  (((p_pre + (6 * sizeof(CHAR)))) # Char  |-> x6)
  **  (((p_pre + (7 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (8 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (9 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (10 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (11 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (12 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (13 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (14 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (15 * sizeof(CHAR)))) # Char  |->_)
|--
  “ (7 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 7) ”
.

Definition qcp_s8_store16_safety_wit_9 := 
forall (a_pre: Z) (p_pre: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s7")) # Char  |-> x7)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s8")) # Char  |-> x8)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s9")) # Char  |-> x9)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s10")) # Char  |-> x10)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s11")) # Char  |-> x11)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s12")) # Char  |-> x12)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s13")) # Char  |-> x13)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s14")) # Char  |-> x14)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s15")) # Char  |-> x15)
  **  (((p_pre + (0 * sizeof(CHAR)))) # Char  |-> x0)
  **  (((p_pre + (1 * sizeof(CHAR)))) # Char  |-> x1)
  **  (((p_pre + (2 * sizeof(CHAR)))) # Char  |-> x2)
  **  (((p_pre + (3 * sizeof(CHAR)))) # Char  |-> x3)
  **  (((p_pre + (4 * sizeof(CHAR)))) # Char  |-> x4)
  **  (((p_pre + (5 * sizeof(CHAR)))) # Char  |-> x5)
  **  (((p_pre + (6 * sizeof(CHAR)))) # Char  |-> x6)
  **  (((p_pre + (7 * sizeof(CHAR)))) # Char  |-> x7)
  **  (((p_pre + (8 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (9 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (10 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (11 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (12 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (13 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (14 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (15 * sizeof(CHAR)))) # Char  |->_)
|--
  “ (8 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 8) ”
.

Definition qcp_s8_store16_safety_wit_10 := 
forall (a_pre: Z) (p_pre: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s7")) # Char  |-> x7)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s8")) # Char  |-> x8)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s9")) # Char  |-> x9)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s10")) # Char  |-> x10)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s11")) # Char  |-> x11)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s12")) # Char  |-> x12)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s13")) # Char  |-> x13)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s14")) # Char  |-> x14)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s15")) # Char  |-> x15)
  **  (((p_pre + (0 * sizeof(CHAR)))) # Char  |-> x0)
  **  (((p_pre + (1 * sizeof(CHAR)))) # Char  |-> x1)
  **  (((p_pre + (2 * sizeof(CHAR)))) # Char  |-> x2)
  **  (((p_pre + (3 * sizeof(CHAR)))) # Char  |-> x3)
  **  (((p_pre + (4 * sizeof(CHAR)))) # Char  |-> x4)
  **  (((p_pre + (5 * sizeof(CHAR)))) # Char  |-> x5)
  **  (((p_pre + (6 * sizeof(CHAR)))) # Char  |-> x6)
  **  (((p_pre + (7 * sizeof(CHAR)))) # Char  |-> x7)
  **  (((p_pre + (8 * sizeof(CHAR)))) # Char  |-> x8)
  **  (((p_pre + (9 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (10 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (11 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (12 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (13 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (14 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (15 * sizeof(CHAR)))) # Char  |->_)
|--
  “ (9 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 9) ”
.

Definition qcp_s8_store16_safety_wit_11 := 
forall (a_pre: Z) (p_pre: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s7")) # Char  |-> x7)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s8")) # Char  |-> x8)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s9")) # Char  |-> x9)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s10")) # Char  |-> x10)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s11")) # Char  |-> x11)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s12")) # Char  |-> x12)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s13")) # Char  |-> x13)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s14")) # Char  |-> x14)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s15")) # Char  |-> x15)
  **  (((p_pre + (0 * sizeof(CHAR)))) # Char  |-> x0)
  **  (((p_pre + (1 * sizeof(CHAR)))) # Char  |-> x1)
  **  (((p_pre + (2 * sizeof(CHAR)))) # Char  |-> x2)
  **  (((p_pre + (3 * sizeof(CHAR)))) # Char  |-> x3)
  **  (((p_pre + (4 * sizeof(CHAR)))) # Char  |-> x4)
  **  (((p_pre + (5 * sizeof(CHAR)))) # Char  |-> x5)
  **  (((p_pre + (6 * sizeof(CHAR)))) # Char  |-> x6)
  **  (((p_pre + (7 * sizeof(CHAR)))) # Char  |-> x7)
  **  (((p_pre + (8 * sizeof(CHAR)))) # Char  |-> x8)
  **  (((p_pre + (9 * sizeof(CHAR)))) # Char  |-> x9)
  **  (((p_pre + (10 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (11 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (12 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (13 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (14 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (15 * sizeof(CHAR)))) # Char  |->_)
|--
  “ (10 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 10) ”
.

Definition qcp_s8_store16_safety_wit_12 := 
forall (a_pre: Z) (p_pre: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s7")) # Char  |-> x7)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s8")) # Char  |-> x8)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s9")) # Char  |-> x9)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s10")) # Char  |-> x10)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s11")) # Char  |-> x11)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s12")) # Char  |-> x12)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s13")) # Char  |-> x13)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s14")) # Char  |-> x14)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s15")) # Char  |-> x15)
  **  (((p_pre + (0 * sizeof(CHAR)))) # Char  |-> x0)
  **  (((p_pre + (1 * sizeof(CHAR)))) # Char  |-> x1)
  **  (((p_pre + (2 * sizeof(CHAR)))) # Char  |-> x2)
  **  (((p_pre + (3 * sizeof(CHAR)))) # Char  |-> x3)
  **  (((p_pre + (4 * sizeof(CHAR)))) # Char  |-> x4)
  **  (((p_pre + (5 * sizeof(CHAR)))) # Char  |-> x5)
  **  (((p_pre + (6 * sizeof(CHAR)))) # Char  |-> x6)
  **  (((p_pre + (7 * sizeof(CHAR)))) # Char  |-> x7)
  **  (((p_pre + (8 * sizeof(CHAR)))) # Char  |-> x8)
  **  (((p_pre + (9 * sizeof(CHAR)))) # Char  |-> x9)
  **  (((p_pre + (10 * sizeof(CHAR)))) # Char  |-> x10)
  **  (((p_pre + (11 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (12 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (13 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (14 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (15 * sizeof(CHAR)))) # Char  |->_)
|--
  “ (11 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 11) ”
.

Definition qcp_s8_store16_safety_wit_13 := 
forall (a_pre: Z) (p_pre: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s7")) # Char  |-> x7)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s8")) # Char  |-> x8)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s9")) # Char  |-> x9)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s10")) # Char  |-> x10)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s11")) # Char  |-> x11)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s12")) # Char  |-> x12)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s13")) # Char  |-> x13)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s14")) # Char  |-> x14)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s15")) # Char  |-> x15)
  **  (((p_pre + (0 * sizeof(CHAR)))) # Char  |-> x0)
  **  (((p_pre + (1 * sizeof(CHAR)))) # Char  |-> x1)
  **  (((p_pre + (2 * sizeof(CHAR)))) # Char  |-> x2)
  **  (((p_pre + (3 * sizeof(CHAR)))) # Char  |-> x3)
  **  (((p_pre + (4 * sizeof(CHAR)))) # Char  |-> x4)
  **  (((p_pre + (5 * sizeof(CHAR)))) # Char  |-> x5)
  **  (((p_pre + (6 * sizeof(CHAR)))) # Char  |-> x6)
  **  (((p_pre + (7 * sizeof(CHAR)))) # Char  |-> x7)
  **  (((p_pre + (8 * sizeof(CHAR)))) # Char  |-> x8)
  **  (((p_pre + (9 * sizeof(CHAR)))) # Char  |-> x9)
  **  (((p_pre + (10 * sizeof(CHAR)))) # Char  |-> x10)
  **  (((p_pre + (11 * sizeof(CHAR)))) # Char  |-> x11)
  **  (((p_pre + (12 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (13 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (14 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (15 * sizeof(CHAR)))) # Char  |->_)
|--
  “ (12 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 12) ”
.

Definition qcp_s8_store16_safety_wit_14 := 
forall (a_pre: Z) (p_pre: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s7")) # Char  |-> x7)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s8")) # Char  |-> x8)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s9")) # Char  |-> x9)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s10")) # Char  |-> x10)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s11")) # Char  |-> x11)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s12")) # Char  |-> x12)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s13")) # Char  |-> x13)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s14")) # Char  |-> x14)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s15")) # Char  |-> x15)
  **  (((p_pre + (0 * sizeof(CHAR)))) # Char  |-> x0)
  **  (((p_pre + (1 * sizeof(CHAR)))) # Char  |-> x1)
  **  (((p_pre + (2 * sizeof(CHAR)))) # Char  |-> x2)
  **  (((p_pre + (3 * sizeof(CHAR)))) # Char  |-> x3)
  **  (((p_pre + (4 * sizeof(CHAR)))) # Char  |-> x4)
  **  (((p_pre + (5 * sizeof(CHAR)))) # Char  |-> x5)
  **  (((p_pre + (6 * sizeof(CHAR)))) # Char  |-> x6)
  **  (((p_pre + (7 * sizeof(CHAR)))) # Char  |-> x7)
  **  (((p_pre + (8 * sizeof(CHAR)))) # Char  |-> x8)
  **  (((p_pre + (9 * sizeof(CHAR)))) # Char  |-> x9)
  **  (((p_pre + (10 * sizeof(CHAR)))) # Char  |-> x10)
  **  (((p_pre + (11 * sizeof(CHAR)))) # Char  |-> x11)
  **  (((p_pre + (12 * sizeof(CHAR)))) # Char  |-> x12)
  **  (((p_pre + (13 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (14 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (15 * sizeof(CHAR)))) # Char  |->_)
|--
  “ (13 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 13) ”
.

Definition qcp_s8_store16_safety_wit_15 := 
forall (a_pre: Z) (p_pre: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s7")) # Char  |-> x7)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s8")) # Char  |-> x8)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s9")) # Char  |-> x9)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s10")) # Char  |-> x10)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s11")) # Char  |-> x11)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s12")) # Char  |-> x12)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s13")) # Char  |-> x13)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s14")) # Char  |-> x14)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s15")) # Char  |-> x15)
  **  (((p_pre + (0 * sizeof(CHAR)))) # Char  |-> x0)
  **  (((p_pre + (1 * sizeof(CHAR)))) # Char  |-> x1)
  **  (((p_pre + (2 * sizeof(CHAR)))) # Char  |-> x2)
  **  (((p_pre + (3 * sizeof(CHAR)))) # Char  |-> x3)
  **  (((p_pre + (4 * sizeof(CHAR)))) # Char  |-> x4)
  **  (((p_pre + (5 * sizeof(CHAR)))) # Char  |-> x5)
  **  (((p_pre + (6 * sizeof(CHAR)))) # Char  |-> x6)
  **  (((p_pre + (7 * sizeof(CHAR)))) # Char  |-> x7)
  **  (((p_pre + (8 * sizeof(CHAR)))) # Char  |-> x8)
  **  (((p_pre + (9 * sizeof(CHAR)))) # Char  |-> x9)
  **  (((p_pre + (10 * sizeof(CHAR)))) # Char  |-> x10)
  **  (((p_pre + (11 * sizeof(CHAR)))) # Char  |-> x11)
  **  (((p_pre + (12 * sizeof(CHAR)))) # Char  |-> x12)
  **  (((p_pre + (13 * sizeof(CHAR)))) # Char  |-> x13)
  **  (((p_pre + (14 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (15 * sizeof(CHAR)))) # Char  |->_)
|--
  “ (14 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 14) ”
.

Definition qcp_s8_store16_safety_wit_16 := 
forall (a_pre: Z) (p_pre: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s7")) # Char  |-> x7)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s8")) # Char  |-> x8)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s9")) # Char  |-> x9)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s10")) # Char  |-> x10)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s11")) # Char  |-> x11)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s12")) # Char  |-> x12)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s13")) # Char  |-> x13)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s14")) # Char  |-> x14)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s15")) # Char  |-> x15)
  **  (((p_pre + (0 * sizeof(CHAR)))) # Char  |-> x0)
  **  (((p_pre + (1 * sizeof(CHAR)))) # Char  |-> x1)
  **  (((p_pre + (2 * sizeof(CHAR)))) # Char  |-> x2)
  **  (((p_pre + (3 * sizeof(CHAR)))) # Char  |-> x3)
  **  (((p_pre + (4 * sizeof(CHAR)))) # Char  |-> x4)
  **  (((p_pre + (5 * sizeof(CHAR)))) # Char  |-> x5)
  **  (((p_pre + (6 * sizeof(CHAR)))) # Char  |-> x6)
  **  (((p_pre + (7 * sizeof(CHAR)))) # Char  |-> x7)
  **  (((p_pre + (8 * sizeof(CHAR)))) # Char  |-> x8)
  **  (((p_pre + (9 * sizeof(CHAR)))) # Char  |-> x9)
  **  (((p_pre + (10 * sizeof(CHAR)))) # Char  |-> x10)
  **  (((p_pre + (11 * sizeof(CHAR)))) # Char  |-> x11)
  **  (((p_pre + (12 * sizeof(CHAR)))) # Char  |-> x12)
  **  (((p_pre + (13 * sizeof(CHAR)))) # Char  |-> x13)
  **  (((p_pre + (14 * sizeof(CHAR)))) # Char  |-> x14)
  **  (((p_pre + (15 * sizeof(CHAR)))) # Char  |->_)
|--
  “ (15 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 15) ”
.

Definition qcp_s8_store16_entail_wit_1 := 
(
forall (a_pre: Z) (p_pre: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  (CharArray.undef_full p_pre 16 )
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s7")) # Char  |-> x7)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s8")) # Char  |-> x8)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s9")) # Char  |-> x9)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s10")) # Char  |-> x10)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s11")) # Char  |-> x11)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s12")) # Char  |-> x12)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s13")) # Char  |-> x13)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s14")) # Char  |-> x14)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s15")) # Char  |-> x15)
|--
  ((&((a_pre)  # "int8x16_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s7")) # Char  |-> x7)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s8")) # Char  |-> x8)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s9")) # Char  |-> x9)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s10")) # Char  |-> x10)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s11")) # Char  |-> x11)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s12")) # Char  |-> x12)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s13")) # Char  |-> x13)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s14")) # Char  |-> x14)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s15")) # Char  |-> x15)
  **  (((p_pre + (0 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (1 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (2 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (3 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (4 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (5 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (6 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (7 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (8 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (9 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (10 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (11 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (12 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (13 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (14 * sizeof(CHAR)))) # Char  |->_)
  **  (((p_pre + (15 * sizeof(CHAR)))) # Char  |->_)
) \/
(
forall (p_pre: Z) ,
  (CharArray.undef_missing_i p_pre 2 (1 + 1 ) 16 )
|--
  EX (x_13: Z)  (x_12: Z)  (x_11: Z)  (x_10: Z)  (x_9: Z)  (x_8: Z)  (x_7: Z)  (x_6: Z)  (x_5: Z)  (x_4: Z)  (x_3: Z)  (x_2: Z)  (x: Z) ,
  (((p_pre + (15 * sizeof(CHAR)))) # Char  |-> x_13)
  **  (((p_pre + (14 * sizeof(CHAR)))) # Char  |-> x_12)
  **  (((p_pre + (13 * sizeof(CHAR)))) # Char  |-> x_11)
  **  (((p_pre + (12 * sizeof(CHAR)))) # Char  |-> x_10)
  **  (((p_pre + (11 * sizeof(CHAR)))) # Char  |-> x_9)
  **  (((p_pre + (10 * sizeof(CHAR)))) # Char  |-> x_8)
  **  (((p_pre + (9 * sizeof(CHAR)))) # Char  |-> x_7)
  **  (((p_pre + (8 * sizeof(CHAR)))) # Char  |-> x_6)
  **  (((p_pre + (7 * sizeof(CHAR)))) # Char  |-> x_5)
  **  (((p_pre + (6 * sizeof(CHAR)))) # Char  |-> x_4)
  **  (((p_pre + (5 * sizeof(CHAR)))) # Char  |-> x_3)
  **  (((p_pre + (4 * sizeof(CHAR)))) # Char  |-> x_2)
  **  (((p_pre + (3 * sizeof(CHAR)))) # Char  |-> x)
).

Definition qcp_s8_store16_return_wit_1 := 
(
forall (a_pre: Z) (p_pre: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((&((a_pre)  # "int8x16_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s7")) # Char  |-> x7)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s8")) # Char  |-> x8)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s9")) # Char  |-> x9)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s10")) # Char  |-> x10)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s11")) # Char  |-> x11)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s12")) # Char  |-> x12)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s13")) # Char  |-> x13)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s14")) # Char  |-> x14)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s15")) # Char  |-> x15)
  **  (((p_pre + (0 * sizeof(CHAR)))) # Char  |-> x0)
  **  (((p_pre + (1 * sizeof(CHAR)))) # Char  |-> x1)
  **  (((p_pre + (2 * sizeof(CHAR)))) # Char  |-> x2)
  **  (((p_pre + (3 * sizeof(CHAR)))) # Char  |-> x3)
  **  (((p_pre + (4 * sizeof(CHAR)))) # Char  |-> x4)
  **  (((p_pre + (5 * sizeof(CHAR)))) # Char  |-> x5)
  **  (((p_pre + (6 * sizeof(CHAR)))) # Char  |-> x6)
  **  (((p_pre + (7 * sizeof(CHAR)))) # Char  |-> x7)
  **  (((p_pre + (8 * sizeof(CHAR)))) # Char  |-> x8)
  **  (((p_pre + (9 * sizeof(CHAR)))) # Char  |-> x9)
  **  (((p_pre + (10 * sizeof(CHAR)))) # Char  |-> x10)
  **  (((p_pre + (11 * sizeof(CHAR)))) # Char  |-> x11)
  **  (((p_pre + (12 * sizeof(CHAR)))) # Char  |-> x12)
  **  (((p_pre + (13 * sizeof(CHAR)))) # Char  |-> x13)
  **  (((p_pre + (14 * sizeof(CHAR)))) # Char  |-> x14)
  **  (((p_pre + (15 * sizeof(CHAR)))) # Char  |-> x15)
|--
  (CharArray.full p_pre 16 (s8_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)) )
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s7")) # Char  |-> x7)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s8")) # Char  |-> x8)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s9")) # Char  |-> x9)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s10")) # Char  |-> x10)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s11")) # Char  |-> x11)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s12")) # Char  |-> x12)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s13")) # Char  |-> x13)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s14")) # Char  |-> x14)
  **  ((&((a_pre)  # "int8x16_t" ->ₛ "s15")) # Char  |-> x15)
) \/
(
forall (p_pre: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  (((p_pre + (0 * sizeof(CHAR)))) # Char  |-> x0)
  **  (((p_pre + (1 * sizeof(CHAR)))) # Char  |-> x1)
  **  (((p_pre + (2 * sizeof(CHAR)))) # Char  |-> x2)
  **  (((p_pre + (3 * sizeof(CHAR)))) # Char  |-> x3)
  **  (((p_pre + (4 * sizeof(CHAR)))) # Char  |-> x4)
  **  (((p_pre + (5 * sizeof(CHAR)))) # Char  |-> x5)
  **  (((p_pre + (6 * sizeof(CHAR)))) # Char  |-> x6)
  **  (((p_pre + (7 * sizeof(CHAR)))) # Char  |-> x7)
  **  (((p_pre + (8 * sizeof(CHAR)))) # Char  |-> x8)
  **  (((p_pre + (9 * sizeof(CHAR)))) # Char  |-> x9)
  **  (((p_pre + (10 * sizeof(CHAR)))) # Char  |-> x10)
  **  (((p_pre + (11 * sizeof(CHAR)))) # Char  |-> x11)
  **  (((p_pre + (12 * sizeof(CHAR)))) # Char  |-> x12)
  **  (((p_pre + (13 * sizeof(CHAR)))) # Char  |-> x13)
  **  (((p_pre + (14 * sizeof(CHAR)))) # Char  |-> x14)
  **  (((p_pre + (15 * sizeof(CHAR)))) # Char  |-> x15)
|--
  (CharArray.full p_pre 16 (s8_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)) )
).

Definition qcp_s8_store16_return_wit_1_split_goal_spatial := 
forall (p_pre: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  (((p_pre + (0 * sizeof(CHAR)))) # Char  |-> x0)
  **  (((p_pre + (1 * sizeof(CHAR)))) # Char  |-> x1)
  **  (((p_pre + (2 * sizeof(CHAR)))) # Char  |-> x2)
  **  (((p_pre + (3 * sizeof(CHAR)))) # Char  |-> x3)
  **  (((p_pre + (4 * sizeof(CHAR)))) # Char  |-> x4)
  **  (((p_pre + (5 * sizeof(CHAR)))) # Char  |-> x5)
  **  (((p_pre + (6 * sizeof(CHAR)))) # Char  |-> x6)
  **  (((p_pre + (7 * sizeof(CHAR)))) # Char  |-> x7)
  **  (((p_pre + (8 * sizeof(CHAR)))) # Char  |-> x8)
  **  (((p_pre + (9 * sizeof(CHAR)))) # Char  |-> x9)
  **  (((p_pre + (10 * sizeof(CHAR)))) # Char  |-> x10)
  **  (((p_pre + (11 * sizeof(CHAR)))) # Char  |-> x11)
  **  (((p_pre + (12 * sizeof(CHAR)))) # Char  |-> x12)
  **  (((p_pre + (13 * sizeof(CHAR)))) # Char  |-> x13)
  **  (((p_pre + (14 * sizeof(CHAR)))) # Char  |-> x14)
  **  (((p_pre + (15 * sizeof(CHAR)))) # Char  |-> x15)
|--
  (CharArray.full p_pre 16 (s8_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)) )
.

(*----- Function qcp_s8_store_lane0 -----*)

Definition qcp_s8_store_lane0_return_wit_1 := 
forall (a_pre: Z) (p_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((p_pre) # Char  |-> x0)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s7")) # Char  |-> x7)
|--
  ((p_pre) # Char  |-> x0)
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

Include s8_arrays_Strategy_Correct.

Axiom proof_of_qcp_s8_store8_safety_wit_1 : qcp_s8_store8_safety_wit_1.
Axiom proof_of_qcp_s8_store8_safety_wit_2 : qcp_s8_store8_safety_wit_2.
Axiom proof_of_qcp_s8_store8_safety_wit_3 : qcp_s8_store8_safety_wit_3.
Axiom proof_of_qcp_s8_store8_safety_wit_4 : qcp_s8_store8_safety_wit_4.
Axiom proof_of_qcp_s8_store8_safety_wit_5 : qcp_s8_store8_safety_wit_5.
Axiom proof_of_qcp_s8_store8_safety_wit_6 : qcp_s8_store8_safety_wit_6.
Axiom proof_of_qcp_s8_store8_safety_wit_7 : qcp_s8_store8_safety_wit_7.
Axiom proof_of_qcp_s8_store8_safety_wit_8 : qcp_s8_store8_safety_wit_8.
Axiom proof_of_qcp_s8_store8_entail_wit_1 : qcp_s8_store8_entail_wit_1.
Axiom proof_of_qcp_s8_store8_return_wit_1 : qcp_s8_store8_return_wit_1.
Axiom proof_of_qcp_s8_store16_safety_wit_1 : qcp_s8_store16_safety_wit_1.
Axiom proof_of_qcp_s8_store16_safety_wit_2 : qcp_s8_store16_safety_wit_2.
Axiom proof_of_qcp_s8_store16_safety_wit_3 : qcp_s8_store16_safety_wit_3.
Axiom proof_of_qcp_s8_store16_safety_wit_4 : qcp_s8_store16_safety_wit_4.
Axiom proof_of_qcp_s8_store16_safety_wit_5 : qcp_s8_store16_safety_wit_5.
Axiom proof_of_qcp_s8_store16_safety_wit_6 : qcp_s8_store16_safety_wit_6.
Axiom proof_of_qcp_s8_store16_safety_wit_7 : qcp_s8_store16_safety_wit_7.
Axiom proof_of_qcp_s8_store16_safety_wit_8 : qcp_s8_store16_safety_wit_8.
Axiom proof_of_qcp_s8_store16_safety_wit_9 : qcp_s8_store16_safety_wit_9.
Axiom proof_of_qcp_s8_store16_safety_wit_10 : qcp_s8_store16_safety_wit_10.
Axiom proof_of_qcp_s8_store16_safety_wit_11 : qcp_s8_store16_safety_wit_11.
Axiom proof_of_qcp_s8_store16_safety_wit_12 : qcp_s8_store16_safety_wit_12.
Axiom proof_of_qcp_s8_store16_safety_wit_13 : qcp_s8_store16_safety_wit_13.
Axiom proof_of_qcp_s8_store16_safety_wit_14 : qcp_s8_store16_safety_wit_14.
Axiom proof_of_qcp_s8_store16_safety_wit_15 : qcp_s8_store16_safety_wit_15.
Axiom proof_of_qcp_s8_store16_safety_wit_16 : qcp_s8_store16_safety_wit_16.
Axiom proof_of_qcp_s8_store16_entail_wit_1 : qcp_s8_store16_entail_wit_1.
Axiom proof_of_qcp_s8_store16_return_wit_1 : qcp_s8_store16_return_wit_1.
Axiom proof_of_qcp_s8_store_lane0_return_wit_1 : qcp_s8_store_lane0_return_wit_1.

End VC_Correct.
