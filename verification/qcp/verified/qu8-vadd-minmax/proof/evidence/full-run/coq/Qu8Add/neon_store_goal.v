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
Require Import Qu8Add.Model.
Require Import Qu8Add.Types.
Require Import Qu8Add.MemoryModel.
Require Import Qu8Add.NeonStoreModel.
Local Open Scope sac.
From Qu8Add Require Import u8_arrays_strategy_goal.
From Qu8Add Require Import u8_arrays_strategy_proof.

(*----- Function qcp_u8_store8 -----*)

Definition qcp_u8_store8_safety_wit_1 := 
forall (a_pre: Z) (p_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s7")) # UChar  |-> x7)
  **  (((p_pre + (0 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (1 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (2 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (3 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (4 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (5 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (6 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (7 * sizeof(UCHAR)))) # UChar  |->_)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qcp_u8_store8_safety_wit_2 := 
forall (a_pre: Z) (p_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s7")) # UChar  |-> x7)
  **  (((p_pre + (0 * sizeof(UCHAR)))) # UChar  |-> x0)
  **  (((p_pre + (1 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (2 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (3 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (4 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (5 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (6 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (7 * sizeof(UCHAR)))) # UChar  |->_)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition qcp_u8_store8_safety_wit_3 := 
forall (a_pre: Z) (p_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s7")) # UChar  |-> x7)
  **  (((p_pre + (0 * sizeof(UCHAR)))) # UChar  |-> x0)
  **  (((p_pre + (1 * sizeof(UCHAR)))) # UChar  |-> x1)
  **  (((p_pre + (2 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (3 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (4 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (5 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (6 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (7 * sizeof(UCHAR)))) # UChar  |->_)
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition qcp_u8_store8_safety_wit_4 := 
forall (a_pre: Z) (p_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s7")) # UChar  |-> x7)
  **  (((p_pre + (0 * sizeof(UCHAR)))) # UChar  |-> x0)
  **  (((p_pre + (1 * sizeof(UCHAR)))) # UChar  |-> x1)
  **  (((p_pre + (2 * sizeof(UCHAR)))) # UChar  |-> x2)
  **  (((p_pre + (3 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (4 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (5 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (6 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (7 * sizeof(UCHAR)))) # UChar  |->_)
|--
  “ (3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 3) ”
.

Definition qcp_u8_store8_safety_wit_5 := 
forall (a_pre: Z) (p_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s7")) # UChar  |-> x7)
  **  (((p_pre + (0 * sizeof(UCHAR)))) # UChar  |-> x0)
  **  (((p_pre + (1 * sizeof(UCHAR)))) # UChar  |-> x1)
  **  (((p_pre + (2 * sizeof(UCHAR)))) # UChar  |-> x2)
  **  (((p_pre + (3 * sizeof(UCHAR)))) # UChar  |-> x3)
  **  (((p_pre + (4 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (5 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (6 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (7 * sizeof(UCHAR)))) # UChar  |->_)
|--
  “ (4 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 4) ”
.

Definition qcp_u8_store8_safety_wit_6 := 
forall (a_pre: Z) (p_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s7")) # UChar  |-> x7)
  **  (((p_pre + (0 * sizeof(UCHAR)))) # UChar  |-> x0)
  **  (((p_pre + (1 * sizeof(UCHAR)))) # UChar  |-> x1)
  **  (((p_pre + (2 * sizeof(UCHAR)))) # UChar  |-> x2)
  **  (((p_pre + (3 * sizeof(UCHAR)))) # UChar  |-> x3)
  **  (((p_pre + (4 * sizeof(UCHAR)))) # UChar  |-> x4)
  **  (((p_pre + (5 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (6 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (7 * sizeof(UCHAR)))) # UChar  |->_)
|--
  “ (5 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 5) ”
.

Definition qcp_u8_store8_safety_wit_7 := 
forall (a_pre: Z) (p_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s7")) # UChar  |-> x7)
  **  (((p_pre + (0 * sizeof(UCHAR)))) # UChar  |-> x0)
  **  (((p_pre + (1 * sizeof(UCHAR)))) # UChar  |-> x1)
  **  (((p_pre + (2 * sizeof(UCHAR)))) # UChar  |-> x2)
  **  (((p_pre + (3 * sizeof(UCHAR)))) # UChar  |-> x3)
  **  (((p_pre + (4 * sizeof(UCHAR)))) # UChar  |-> x4)
  **  (((p_pre + (5 * sizeof(UCHAR)))) # UChar  |-> x5)
  **  (((p_pre + (6 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (7 * sizeof(UCHAR)))) # UChar  |->_)
|--
  “ (6 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 6) ”
.

Definition qcp_u8_store8_safety_wit_8 := 
forall (a_pre: Z) (p_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s7")) # UChar  |-> x7)
  **  (((p_pre + (0 * sizeof(UCHAR)))) # UChar  |-> x0)
  **  (((p_pre + (1 * sizeof(UCHAR)))) # UChar  |-> x1)
  **  (((p_pre + (2 * sizeof(UCHAR)))) # UChar  |-> x2)
  **  (((p_pre + (3 * sizeof(UCHAR)))) # UChar  |-> x3)
  **  (((p_pre + (4 * sizeof(UCHAR)))) # UChar  |-> x4)
  **  (((p_pre + (5 * sizeof(UCHAR)))) # UChar  |-> x5)
  **  (((p_pre + (6 * sizeof(UCHAR)))) # UChar  |-> x6)
  **  (((p_pre + (7 * sizeof(UCHAR)))) # UChar  |->_)
|--
  “ (7 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 7) ”
.

Definition qcp_u8_store8_entail_wit_1 := 
(
forall (a_pre: Z) (p_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  (UCharArray.undef_full p_pre 8 )
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s7")) # UChar  |-> x7)
|--
  ((&((a_pre)  # "uint8x8_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s7")) # UChar  |-> x7)
  **  (((p_pre + (0 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (1 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (2 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (3 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (4 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (5 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (6 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (7 * sizeof(UCHAR)))) # UChar  |->_)
) \/
(
forall (p_pre: Z) ,
  (UCharArray.undef_missing_i p_pre 2 (1 + 1 ) 8 )
|--
  EX (x_5: Z)  (x_4: Z)  (x_3: Z)  (x_2: Z)  (x: Z) ,
  (((p_pre + (7 * sizeof(UCHAR)))) # UChar  |-> x_5)
  **  (((p_pre + (6 * sizeof(UCHAR)))) # UChar  |-> x_4)
  **  (((p_pre + (5 * sizeof(UCHAR)))) # UChar  |-> x_3)
  **  (((p_pre + (4 * sizeof(UCHAR)))) # UChar  |-> x_2)
  **  (((p_pre + (3 * sizeof(UCHAR)))) # UChar  |-> x)
).

Definition qcp_u8_store8_return_wit_1 := 
(
forall (a_pre: Z) (p_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((&((a_pre)  # "uint8x8_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s7")) # UChar  |-> x7)
  **  (((p_pre + (0 * sizeof(UCHAR)))) # UChar  |-> x0)
  **  (((p_pre + (1 * sizeof(UCHAR)))) # UChar  |-> x1)
  **  (((p_pre + (2 * sizeof(UCHAR)))) # UChar  |-> x2)
  **  (((p_pre + (3 * sizeof(UCHAR)))) # UChar  |-> x3)
  **  (((p_pre + (4 * sizeof(UCHAR)))) # UChar  |-> x4)
  **  (((p_pre + (5 * sizeof(UCHAR)))) # UChar  |-> x5)
  **  (((p_pre + (6 * sizeof(UCHAR)))) # UChar  |-> x6)
  **  (((p_pre + (7 * sizeof(UCHAR)))) # UChar  |-> x7)
|--
  (UCharArray.full p_pre 8 (u8_pack8 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7)) )
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s7")) # UChar  |-> x7)
) \/
(
forall (p_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  (((p_pre + (0 * sizeof(UCHAR)))) # UChar  |-> x0)
  **  (((p_pre + (1 * sizeof(UCHAR)))) # UChar  |-> x1)
  **  (((p_pre + (2 * sizeof(UCHAR)))) # UChar  |-> x2)
  **  (((p_pre + (3 * sizeof(UCHAR)))) # UChar  |-> x3)
  **  (((p_pre + (4 * sizeof(UCHAR)))) # UChar  |-> x4)
  **  (((p_pre + (5 * sizeof(UCHAR)))) # UChar  |-> x5)
  **  (((p_pre + (6 * sizeof(UCHAR)))) # UChar  |-> x6)
  **  (((p_pre + (7 * sizeof(UCHAR)))) # UChar  |-> x7)
|--
  (UCharArray.full p_pre 8 (u8_pack8 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7)) )
).

Definition qcp_u8_store8_return_wit_1_split_goal_spatial := 
forall (p_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  (((p_pre + (0 * sizeof(UCHAR)))) # UChar  |-> x0)
  **  (((p_pre + (1 * sizeof(UCHAR)))) # UChar  |-> x1)
  **  (((p_pre + (2 * sizeof(UCHAR)))) # UChar  |-> x2)
  **  (((p_pre + (3 * sizeof(UCHAR)))) # UChar  |-> x3)
  **  (((p_pre + (4 * sizeof(UCHAR)))) # UChar  |-> x4)
  **  (((p_pre + (5 * sizeof(UCHAR)))) # UChar  |-> x5)
  **  (((p_pre + (6 * sizeof(UCHAR)))) # UChar  |-> x6)
  **  (((p_pre + (7 * sizeof(UCHAR)))) # UChar  |-> x7)
|--
  (UCharArray.full p_pre 8 (u8_pack8 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7)) )
.

(*----- Function qcp_u8_store16 -----*)

Definition qcp_u8_store16_safety_wit_1 := 
forall (a_pre: Z) (p_pre: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s15")) # UChar  |-> x15)
  **  (((p_pre + (0 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (1 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (2 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (3 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (4 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (5 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (6 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (7 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (8 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (9 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (10 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (11 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (12 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (13 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (14 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (15 * sizeof(UCHAR)))) # UChar  |->_)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qcp_u8_store16_safety_wit_2 := 
forall (a_pre: Z) (p_pre: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s15")) # UChar  |-> x15)
  **  (((p_pre + (0 * sizeof(UCHAR)))) # UChar  |-> x0)
  **  (((p_pre + (1 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (2 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (3 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (4 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (5 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (6 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (7 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (8 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (9 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (10 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (11 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (12 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (13 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (14 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (15 * sizeof(UCHAR)))) # UChar  |->_)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition qcp_u8_store16_safety_wit_3 := 
forall (a_pre: Z) (p_pre: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s15")) # UChar  |-> x15)
  **  (((p_pre + (0 * sizeof(UCHAR)))) # UChar  |-> x0)
  **  (((p_pre + (1 * sizeof(UCHAR)))) # UChar  |-> x1)
  **  (((p_pre + (2 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (3 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (4 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (5 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (6 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (7 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (8 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (9 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (10 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (11 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (12 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (13 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (14 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (15 * sizeof(UCHAR)))) # UChar  |->_)
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition qcp_u8_store16_safety_wit_4 := 
forall (a_pre: Z) (p_pre: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s15")) # UChar  |-> x15)
  **  (((p_pre + (0 * sizeof(UCHAR)))) # UChar  |-> x0)
  **  (((p_pre + (1 * sizeof(UCHAR)))) # UChar  |-> x1)
  **  (((p_pre + (2 * sizeof(UCHAR)))) # UChar  |-> x2)
  **  (((p_pre + (3 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (4 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (5 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (6 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (7 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (8 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (9 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (10 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (11 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (12 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (13 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (14 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (15 * sizeof(UCHAR)))) # UChar  |->_)
|--
  “ (3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 3) ”
.

Definition qcp_u8_store16_safety_wit_5 := 
forall (a_pre: Z) (p_pre: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s15")) # UChar  |-> x15)
  **  (((p_pre + (0 * sizeof(UCHAR)))) # UChar  |-> x0)
  **  (((p_pre + (1 * sizeof(UCHAR)))) # UChar  |-> x1)
  **  (((p_pre + (2 * sizeof(UCHAR)))) # UChar  |-> x2)
  **  (((p_pre + (3 * sizeof(UCHAR)))) # UChar  |-> x3)
  **  (((p_pre + (4 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (5 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (6 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (7 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (8 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (9 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (10 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (11 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (12 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (13 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (14 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (15 * sizeof(UCHAR)))) # UChar  |->_)
|--
  “ (4 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 4) ”
.

Definition qcp_u8_store16_safety_wit_6 := 
forall (a_pre: Z) (p_pre: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s15")) # UChar  |-> x15)
  **  (((p_pre + (0 * sizeof(UCHAR)))) # UChar  |-> x0)
  **  (((p_pre + (1 * sizeof(UCHAR)))) # UChar  |-> x1)
  **  (((p_pre + (2 * sizeof(UCHAR)))) # UChar  |-> x2)
  **  (((p_pre + (3 * sizeof(UCHAR)))) # UChar  |-> x3)
  **  (((p_pre + (4 * sizeof(UCHAR)))) # UChar  |-> x4)
  **  (((p_pre + (5 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (6 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (7 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (8 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (9 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (10 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (11 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (12 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (13 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (14 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (15 * sizeof(UCHAR)))) # UChar  |->_)
|--
  “ (5 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 5) ”
.

Definition qcp_u8_store16_safety_wit_7 := 
forall (a_pre: Z) (p_pre: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s15")) # UChar  |-> x15)
  **  (((p_pre + (0 * sizeof(UCHAR)))) # UChar  |-> x0)
  **  (((p_pre + (1 * sizeof(UCHAR)))) # UChar  |-> x1)
  **  (((p_pre + (2 * sizeof(UCHAR)))) # UChar  |-> x2)
  **  (((p_pre + (3 * sizeof(UCHAR)))) # UChar  |-> x3)
  **  (((p_pre + (4 * sizeof(UCHAR)))) # UChar  |-> x4)
  **  (((p_pre + (5 * sizeof(UCHAR)))) # UChar  |-> x5)
  **  (((p_pre + (6 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (7 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (8 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (9 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (10 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (11 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (12 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (13 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (14 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (15 * sizeof(UCHAR)))) # UChar  |->_)
|--
  “ (6 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 6) ”
.

Definition qcp_u8_store16_safety_wit_8 := 
forall (a_pre: Z) (p_pre: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s15")) # UChar  |-> x15)
  **  (((p_pre + (0 * sizeof(UCHAR)))) # UChar  |-> x0)
  **  (((p_pre + (1 * sizeof(UCHAR)))) # UChar  |-> x1)
  **  (((p_pre + (2 * sizeof(UCHAR)))) # UChar  |-> x2)
  **  (((p_pre + (3 * sizeof(UCHAR)))) # UChar  |-> x3)
  **  (((p_pre + (4 * sizeof(UCHAR)))) # UChar  |-> x4)
  **  (((p_pre + (5 * sizeof(UCHAR)))) # UChar  |-> x5)
  **  (((p_pre + (6 * sizeof(UCHAR)))) # UChar  |-> x6)
  **  (((p_pre + (7 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (8 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (9 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (10 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (11 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (12 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (13 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (14 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (15 * sizeof(UCHAR)))) # UChar  |->_)
|--
  “ (7 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 7) ”
.

Definition qcp_u8_store16_safety_wit_9 := 
forall (a_pre: Z) (p_pre: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s15")) # UChar  |-> x15)
  **  (((p_pre + (0 * sizeof(UCHAR)))) # UChar  |-> x0)
  **  (((p_pre + (1 * sizeof(UCHAR)))) # UChar  |-> x1)
  **  (((p_pre + (2 * sizeof(UCHAR)))) # UChar  |-> x2)
  **  (((p_pre + (3 * sizeof(UCHAR)))) # UChar  |-> x3)
  **  (((p_pre + (4 * sizeof(UCHAR)))) # UChar  |-> x4)
  **  (((p_pre + (5 * sizeof(UCHAR)))) # UChar  |-> x5)
  **  (((p_pre + (6 * sizeof(UCHAR)))) # UChar  |-> x6)
  **  (((p_pre + (7 * sizeof(UCHAR)))) # UChar  |-> x7)
  **  (((p_pre + (8 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (9 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (10 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (11 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (12 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (13 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (14 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (15 * sizeof(UCHAR)))) # UChar  |->_)
|--
  “ (8 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 8) ”
.

Definition qcp_u8_store16_safety_wit_10 := 
forall (a_pre: Z) (p_pre: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s15")) # UChar  |-> x15)
  **  (((p_pre + (0 * sizeof(UCHAR)))) # UChar  |-> x0)
  **  (((p_pre + (1 * sizeof(UCHAR)))) # UChar  |-> x1)
  **  (((p_pre + (2 * sizeof(UCHAR)))) # UChar  |-> x2)
  **  (((p_pre + (3 * sizeof(UCHAR)))) # UChar  |-> x3)
  **  (((p_pre + (4 * sizeof(UCHAR)))) # UChar  |-> x4)
  **  (((p_pre + (5 * sizeof(UCHAR)))) # UChar  |-> x5)
  **  (((p_pre + (6 * sizeof(UCHAR)))) # UChar  |-> x6)
  **  (((p_pre + (7 * sizeof(UCHAR)))) # UChar  |-> x7)
  **  (((p_pre + (8 * sizeof(UCHAR)))) # UChar  |-> x8)
  **  (((p_pre + (9 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (10 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (11 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (12 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (13 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (14 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (15 * sizeof(UCHAR)))) # UChar  |->_)
|--
  “ (9 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 9) ”
.

Definition qcp_u8_store16_safety_wit_11 := 
forall (a_pre: Z) (p_pre: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s15")) # UChar  |-> x15)
  **  (((p_pre + (0 * sizeof(UCHAR)))) # UChar  |-> x0)
  **  (((p_pre + (1 * sizeof(UCHAR)))) # UChar  |-> x1)
  **  (((p_pre + (2 * sizeof(UCHAR)))) # UChar  |-> x2)
  **  (((p_pre + (3 * sizeof(UCHAR)))) # UChar  |-> x3)
  **  (((p_pre + (4 * sizeof(UCHAR)))) # UChar  |-> x4)
  **  (((p_pre + (5 * sizeof(UCHAR)))) # UChar  |-> x5)
  **  (((p_pre + (6 * sizeof(UCHAR)))) # UChar  |-> x6)
  **  (((p_pre + (7 * sizeof(UCHAR)))) # UChar  |-> x7)
  **  (((p_pre + (8 * sizeof(UCHAR)))) # UChar  |-> x8)
  **  (((p_pre + (9 * sizeof(UCHAR)))) # UChar  |-> x9)
  **  (((p_pre + (10 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (11 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (12 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (13 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (14 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (15 * sizeof(UCHAR)))) # UChar  |->_)
|--
  “ (10 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 10) ”
.

Definition qcp_u8_store16_safety_wit_12 := 
forall (a_pre: Z) (p_pre: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s15")) # UChar  |-> x15)
  **  (((p_pre + (0 * sizeof(UCHAR)))) # UChar  |-> x0)
  **  (((p_pre + (1 * sizeof(UCHAR)))) # UChar  |-> x1)
  **  (((p_pre + (2 * sizeof(UCHAR)))) # UChar  |-> x2)
  **  (((p_pre + (3 * sizeof(UCHAR)))) # UChar  |-> x3)
  **  (((p_pre + (4 * sizeof(UCHAR)))) # UChar  |-> x4)
  **  (((p_pre + (5 * sizeof(UCHAR)))) # UChar  |-> x5)
  **  (((p_pre + (6 * sizeof(UCHAR)))) # UChar  |-> x6)
  **  (((p_pre + (7 * sizeof(UCHAR)))) # UChar  |-> x7)
  **  (((p_pre + (8 * sizeof(UCHAR)))) # UChar  |-> x8)
  **  (((p_pre + (9 * sizeof(UCHAR)))) # UChar  |-> x9)
  **  (((p_pre + (10 * sizeof(UCHAR)))) # UChar  |-> x10)
  **  (((p_pre + (11 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (12 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (13 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (14 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (15 * sizeof(UCHAR)))) # UChar  |->_)
|--
  “ (11 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 11) ”
.

Definition qcp_u8_store16_safety_wit_13 := 
forall (a_pre: Z) (p_pre: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s15")) # UChar  |-> x15)
  **  (((p_pre + (0 * sizeof(UCHAR)))) # UChar  |-> x0)
  **  (((p_pre + (1 * sizeof(UCHAR)))) # UChar  |-> x1)
  **  (((p_pre + (2 * sizeof(UCHAR)))) # UChar  |-> x2)
  **  (((p_pre + (3 * sizeof(UCHAR)))) # UChar  |-> x3)
  **  (((p_pre + (4 * sizeof(UCHAR)))) # UChar  |-> x4)
  **  (((p_pre + (5 * sizeof(UCHAR)))) # UChar  |-> x5)
  **  (((p_pre + (6 * sizeof(UCHAR)))) # UChar  |-> x6)
  **  (((p_pre + (7 * sizeof(UCHAR)))) # UChar  |-> x7)
  **  (((p_pre + (8 * sizeof(UCHAR)))) # UChar  |-> x8)
  **  (((p_pre + (9 * sizeof(UCHAR)))) # UChar  |-> x9)
  **  (((p_pre + (10 * sizeof(UCHAR)))) # UChar  |-> x10)
  **  (((p_pre + (11 * sizeof(UCHAR)))) # UChar  |-> x11)
  **  (((p_pre + (12 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (13 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (14 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (15 * sizeof(UCHAR)))) # UChar  |->_)
|--
  “ (12 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 12) ”
.

Definition qcp_u8_store16_safety_wit_14 := 
forall (a_pre: Z) (p_pre: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s15")) # UChar  |-> x15)
  **  (((p_pre + (0 * sizeof(UCHAR)))) # UChar  |-> x0)
  **  (((p_pre + (1 * sizeof(UCHAR)))) # UChar  |-> x1)
  **  (((p_pre + (2 * sizeof(UCHAR)))) # UChar  |-> x2)
  **  (((p_pre + (3 * sizeof(UCHAR)))) # UChar  |-> x3)
  **  (((p_pre + (4 * sizeof(UCHAR)))) # UChar  |-> x4)
  **  (((p_pre + (5 * sizeof(UCHAR)))) # UChar  |-> x5)
  **  (((p_pre + (6 * sizeof(UCHAR)))) # UChar  |-> x6)
  **  (((p_pre + (7 * sizeof(UCHAR)))) # UChar  |-> x7)
  **  (((p_pre + (8 * sizeof(UCHAR)))) # UChar  |-> x8)
  **  (((p_pre + (9 * sizeof(UCHAR)))) # UChar  |-> x9)
  **  (((p_pre + (10 * sizeof(UCHAR)))) # UChar  |-> x10)
  **  (((p_pre + (11 * sizeof(UCHAR)))) # UChar  |-> x11)
  **  (((p_pre + (12 * sizeof(UCHAR)))) # UChar  |-> x12)
  **  (((p_pre + (13 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (14 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (15 * sizeof(UCHAR)))) # UChar  |->_)
|--
  “ (13 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 13) ”
.

Definition qcp_u8_store16_safety_wit_15 := 
forall (a_pre: Z) (p_pre: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s15")) # UChar  |-> x15)
  **  (((p_pre + (0 * sizeof(UCHAR)))) # UChar  |-> x0)
  **  (((p_pre + (1 * sizeof(UCHAR)))) # UChar  |-> x1)
  **  (((p_pre + (2 * sizeof(UCHAR)))) # UChar  |-> x2)
  **  (((p_pre + (3 * sizeof(UCHAR)))) # UChar  |-> x3)
  **  (((p_pre + (4 * sizeof(UCHAR)))) # UChar  |-> x4)
  **  (((p_pre + (5 * sizeof(UCHAR)))) # UChar  |-> x5)
  **  (((p_pre + (6 * sizeof(UCHAR)))) # UChar  |-> x6)
  **  (((p_pre + (7 * sizeof(UCHAR)))) # UChar  |-> x7)
  **  (((p_pre + (8 * sizeof(UCHAR)))) # UChar  |-> x8)
  **  (((p_pre + (9 * sizeof(UCHAR)))) # UChar  |-> x9)
  **  (((p_pre + (10 * sizeof(UCHAR)))) # UChar  |-> x10)
  **  (((p_pre + (11 * sizeof(UCHAR)))) # UChar  |-> x11)
  **  (((p_pre + (12 * sizeof(UCHAR)))) # UChar  |-> x12)
  **  (((p_pre + (13 * sizeof(UCHAR)))) # UChar  |-> x13)
  **  (((p_pre + (14 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (15 * sizeof(UCHAR)))) # UChar  |->_)
|--
  “ (14 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 14) ”
.

Definition qcp_u8_store16_safety_wit_16 := 
forall (a_pre: Z) (p_pre: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s15")) # UChar  |-> x15)
  **  (((p_pre + (0 * sizeof(UCHAR)))) # UChar  |-> x0)
  **  (((p_pre + (1 * sizeof(UCHAR)))) # UChar  |-> x1)
  **  (((p_pre + (2 * sizeof(UCHAR)))) # UChar  |-> x2)
  **  (((p_pre + (3 * sizeof(UCHAR)))) # UChar  |-> x3)
  **  (((p_pre + (4 * sizeof(UCHAR)))) # UChar  |-> x4)
  **  (((p_pre + (5 * sizeof(UCHAR)))) # UChar  |-> x5)
  **  (((p_pre + (6 * sizeof(UCHAR)))) # UChar  |-> x6)
  **  (((p_pre + (7 * sizeof(UCHAR)))) # UChar  |-> x7)
  **  (((p_pre + (8 * sizeof(UCHAR)))) # UChar  |-> x8)
  **  (((p_pre + (9 * sizeof(UCHAR)))) # UChar  |-> x9)
  **  (((p_pre + (10 * sizeof(UCHAR)))) # UChar  |-> x10)
  **  (((p_pre + (11 * sizeof(UCHAR)))) # UChar  |-> x11)
  **  (((p_pre + (12 * sizeof(UCHAR)))) # UChar  |-> x12)
  **  (((p_pre + (13 * sizeof(UCHAR)))) # UChar  |-> x13)
  **  (((p_pre + (14 * sizeof(UCHAR)))) # UChar  |-> x14)
  **  (((p_pre + (15 * sizeof(UCHAR)))) # UChar  |->_)
|--
  “ (15 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 15) ”
.

Definition qcp_u8_store16_entail_wit_1 := 
(
forall (a_pre: Z) (p_pre: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  (UCharArray.undef_full p_pre 16 )
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s15")) # UChar  |-> x15)
|--
  ((&((a_pre)  # "uint8x16_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s15")) # UChar  |-> x15)
  **  (((p_pre + (0 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (1 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (2 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (3 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (4 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (5 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (6 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (7 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (8 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (9 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (10 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (11 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (12 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (13 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (14 * sizeof(UCHAR)))) # UChar  |->_)
  **  (((p_pre + (15 * sizeof(UCHAR)))) # UChar  |->_)
) \/
(
forall (p_pre: Z) ,
  (UCharArray.undef_missing_i p_pre 2 (1 + 1 ) 16 )
|--
  EX (x_13: Z)  (x_12: Z)  (x_11: Z)  (x_10: Z)  (x_9: Z)  (x_8: Z)  (x_7: Z)  (x_6: Z)  (x_5: Z)  (x_4: Z)  (x_3: Z)  (x_2: Z)  (x: Z) ,
  (((p_pre + (15 * sizeof(UCHAR)))) # UChar  |-> x_13)
  **  (((p_pre + (14 * sizeof(UCHAR)))) # UChar  |-> x_12)
  **  (((p_pre + (13 * sizeof(UCHAR)))) # UChar  |-> x_11)
  **  (((p_pre + (12 * sizeof(UCHAR)))) # UChar  |-> x_10)
  **  (((p_pre + (11 * sizeof(UCHAR)))) # UChar  |-> x_9)
  **  (((p_pre + (10 * sizeof(UCHAR)))) # UChar  |-> x_8)
  **  (((p_pre + (9 * sizeof(UCHAR)))) # UChar  |-> x_7)
  **  (((p_pre + (8 * sizeof(UCHAR)))) # UChar  |-> x_6)
  **  (((p_pre + (7 * sizeof(UCHAR)))) # UChar  |-> x_5)
  **  (((p_pre + (6 * sizeof(UCHAR)))) # UChar  |-> x_4)
  **  (((p_pre + (5 * sizeof(UCHAR)))) # UChar  |-> x_3)
  **  (((p_pre + (4 * sizeof(UCHAR)))) # UChar  |-> x_2)
  **  (((p_pre + (3 * sizeof(UCHAR)))) # UChar  |-> x)
).

Definition qcp_u8_store16_return_wit_1 := 
(
forall (a_pre: Z) (p_pre: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((&((a_pre)  # "uint8x16_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s15")) # UChar  |-> x15)
  **  (((p_pre + (0 * sizeof(UCHAR)))) # UChar  |-> x0)
  **  (((p_pre + (1 * sizeof(UCHAR)))) # UChar  |-> x1)
  **  (((p_pre + (2 * sizeof(UCHAR)))) # UChar  |-> x2)
  **  (((p_pre + (3 * sizeof(UCHAR)))) # UChar  |-> x3)
  **  (((p_pre + (4 * sizeof(UCHAR)))) # UChar  |-> x4)
  **  (((p_pre + (5 * sizeof(UCHAR)))) # UChar  |-> x5)
  **  (((p_pre + (6 * sizeof(UCHAR)))) # UChar  |-> x6)
  **  (((p_pre + (7 * sizeof(UCHAR)))) # UChar  |-> x7)
  **  (((p_pre + (8 * sizeof(UCHAR)))) # UChar  |-> x8)
  **  (((p_pre + (9 * sizeof(UCHAR)))) # UChar  |-> x9)
  **  (((p_pre + (10 * sizeof(UCHAR)))) # UChar  |-> x10)
  **  (((p_pre + (11 * sizeof(UCHAR)))) # UChar  |-> x11)
  **  (((p_pre + (12 * sizeof(UCHAR)))) # UChar  |-> x12)
  **  (((p_pre + (13 * sizeof(UCHAR)))) # UChar  |-> x13)
  **  (((p_pre + (14 * sizeof(UCHAR)))) # UChar  |-> x14)
  **  (((p_pre + (15 * sizeof(UCHAR)))) # UChar  |-> x15)
|--
  (UCharArray.full p_pre 16 (u8_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)) )
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s7")) # UChar  |-> x7)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s8")) # UChar  |-> x8)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s9")) # UChar  |-> x9)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s10")) # UChar  |-> x10)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s11")) # UChar  |-> x11)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s12")) # UChar  |-> x12)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s13")) # UChar  |-> x13)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s14")) # UChar  |-> x14)
  **  ((&((a_pre)  # "uint8x16_t" ->ₛ "s15")) # UChar  |-> x15)
) \/
(
forall (p_pre: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  (((p_pre + (0 * sizeof(UCHAR)))) # UChar  |-> x0)
  **  (((p_pre + (1 * sizeof(UCHAR)))) # UChar  |-> x1)
  **  (((p_pre + (2 * sizeof(UCHAR)))) # UChar  |-> x2)
  **  (((p_pre + (3 * sizeof(UCHAR)))) # UChar  |-> x3)
  **  (((p_pre + (4 * sizeof(UCHAR)))) # UChar  |-> x4)
  **  (((p_pre + (5 * sizeof(UCHAR)))) # UChar  |-> x5)
  **  (((p_pre + (6 * sizeof(UCHAR)))) # UChar  |-> x6)
  **  (((p_pre + (7 * sizeof(UCHAR)))) # UChar  |-> x7)
  **  (((p_pre + (8 * sizeof(UCHAR)))) # UChar  |-> x8)
  **  (((p_pre + (9 * sizeof(UCHAR)))) # UChar  |-> x9)
  **  (((p_pre + (10 * sizeof(UCHAR)))) # UChar  |-> x10)
  **  (((p_pre + (11 * sizeof(UCHAR)))) # UChar  |-> x11)
  **  (((p_pre + (12 * sizeof(UCHAR)))) # UChar  |-> x12)
  **  (((p_pre + (13 * sizeof(UCHAR)))) # UChar  |-> x13)
  **  (((p_pre + (14 * sizeof(UCHAR)))) # UChar  |-> x14)
  **  (((p_pre + (15 * sizeof(UCHAR)))) # UChar  |-> x15)
|--
  (UCharArray.full p_pre 16 (u8_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)) )
).

Definition qcp_u8_store16_return_wit_1_split_goal_spatial := 
forall (p_pre: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  (((p_pre + (0 * sizeof(UCHAR)))) # UChar  |-> x0)
  **  (((p_pre + (1 * sizeof(UCHAR)))) # UChar  |-> x1)
  **  (((p_pre + (2 * sizeof(UCHAR)))) # UChar  |-> x2)
  **  (((p_pre + (3 * sizeof(UCHAR)))) # UChar  |-> x3)
  **  (((p_pre + (4 * sizeof(UCHAR)))) # UChar  |-> x4)
  **  (((p_pre + (5 * sizeof(UCHAR)))) # UChar  |-> x5)
  **  (((p_pre + (6 * sizeof(UCHAR)))) # UChar  |-> x6)
  **  (((p_pre + (7 * sizeof(UCHAR)))) # UChar  |-> x7)
  **  (((p_pre + (8 * sizeof(UCHAR)))) # UChar  |-> x8)
  **  (((p_pre + (9 * sizeof(UCHAR)))) # UChar  |-> x9)
  **  (((p_pre + (10 * sizeof(UCHAR)))) # UChar  |-> x10)
  **  (((p_pre + (11 * sizeof(UCHAR)))) # UChar  |-> x11)
  **  (((p_pre + (12 * sizeof(UCHAR)))) # UChar  |-> x12)
  **  (((p_pre + (13 * sizeof(UCHAR)))) # UChar  |-> x13)
  **  (((p_pre + (14 * sizeof(UCHAR)))) # UChar  |-> x14)
  **  (((p_pre + (15 * sizeof(UCHAR)))) # UChar  |-> x15)
|--
  (UCharArray.full p_pre 16 (u8_pack16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)) )
.

(*----- Function qcp_u8_store_lane0 -----*)

Definition qcp_u8_store_lane0_return_wit_1 := 
forall (a_pre: Z) (p_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((p_pre) # UChar  |-> x0)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s7")) # UChar  |-> x7)
|--
  ((p_pre) # UChar  |-> x0)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s0")) # UChar  |-> x0)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s1")) # UChar  |-> x1)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s2")) # UChar  |-> x2)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s3")) # UChar  |-> x3)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s4")) # UChar  |-> x4)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s5")) # UChar  |-> x5)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s6")) # UChar  |-> x6)
  **  ((&((a_pre)  # "uint8x8_t" ->ₛ "s7")) # UChar  |-> x7)
.

Module Type VC_Correct.

Include u8_arrays_Strategy_Correct.

Axiom proof_of_qcp_u8_store8_safety_wit_1 : qcp_u8_store8_safety_wit_1.
Axiom proof_of_qcp_u8_store8_safety_wit_2 : qcp_u8_store8_safety_wit_2.
Axiom proof_of_qcp_u8_store8_safety_wit_3 : qcp_u8_store8_safety_wit_3.
Axiom proof_of_qcp_u8_store8_safety_wit_4 : qcp_u8_store8_safety_wit_4.
Axiom proof_of_qcp_u8_store8_safety_wit_5 : qcp_u8_store8_safety_wit_5.
Axiom proof_of_qcp_u8_store8_safety_wit_6 : qcp_u8_store8_safety_wit_6.
Axiom proof_of_qcp_u8_store8_safety_wit_7 : qcp_u8_store8_safety_wit_7.
Axiom proof_of_qcp_u8_store8_safety_wit_8 : qcp_u8_store8_safety_wit_8.
Axiom proof_of_qcp_u8_store8_entail_wit_1 : qcp_u8_store8_entail_wit_1.
Axiom proof_of_qcp_u8_store8_return_wit_1 : qcp_u8_store8_return_wit_1.
Axiom proof_of_qcp_u8_store16_safety_wit_1 : qcp_u8_store16_safety_wit_1.
Axiom proof_of_qcp_u8_store16_safety_wit_2 : qcp_u8_store16_safety_wit_2.
Axiom proof_of_qcp_u8_store16_safety_wit_3 : qcp_u8_store16_safety_wit_3.
Axiom proof_of_qcp_u8_store16_safety_wit_4 : qcp_u8_store16_safety_wit_4.
Axiom proof_of_qcp_u8_store16_safety_wit_5 : qcp_u8_store16_safety_wit_5.
Axiom proof_of_qcp_u8_store16_safety_wit_6 : qcp_u8_store16_safety_wit_6.
Axiom proof_of_qcp_u8_store16_safety_wit_7 : qcp_u8_store16_safety_wit_7.
Axiom proof_of_qcp_u8_store16_safety_wit_8 : qcp_u8_store16_safety_wit_8.
Axiom proof_of_qcp_u8_store16_safety_wit_9 : qcp_u8_store16_safety_wit_9.
Axiom proof_of_qcp_u8_store16_safety_wit_10 : qcp_u8_store16_safety_wit_10.
Axiom proof_of_qcp_u8_store16_safety_wit_11 : qcp_u8_store16_safety_wit_11.
Axiom proof_of_qcp_u8_store16_safety_wit_12 : qcp_u8_store16_safety_wit_12.
Axiom proof_of_qcp_u8_store16_safety_wit_13 : qcp_u8_store16_safety_wit_13.
Axiom proof_of_qcp_u8_store16_safety_wit_14 : qcp_u8_store16_safety_wit_14.
Axiom proof_of_qcp_u8_store16_safety_wit_15 : qcp_u8_store16_safety_wit_15.
Axiom proof_of_qcp_u8_store16_safety_wit_16 : qcp_u8_store16_safety_wit_16.
Axiom proof_of_qcp_u8_store16_entail_wit_1 : qcp_u8_store16_entail_wit_1.
Axiom proof_of_qcp_u8_store16_return_wit_1 : qcp_u8_store16_return_wit_1.
Axiom proof_of_qcp_u8_store_lane0_return_wit_1 : qcp_u8_store_lane0_return_wit_1.

End VC_Correct.
