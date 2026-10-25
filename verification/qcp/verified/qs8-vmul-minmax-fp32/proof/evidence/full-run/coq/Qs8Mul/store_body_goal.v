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
Local Open Scope sac.

(*----- Function qm_store8 -----*)

Definition qm_store8_safety_wit_1 := 
forall (a_pre: Z) (out_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((( &( "out" ) )) # Ptr  |-> out_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  (((out_pre + (0 * sizeof(CHAR)))) # Char  |->_)
  **  (((out_pre + (1 * sizeof(CHAR)))) # Char  |->_)
  **  (((out_pre + (2 * sizeof(CHAR)))) # Char  |->_)
  **  (((out_pre + (3 * sizeof(CHAR)))) # Char  |->_)
  **  (((out_pre + (4 * sizeof(CHAR)))) # Char  |->_)
  **  (((out_pre + (5 * sizeof(CHAR)))) # Char  |->_)
  **  (((out_pre + (6 * sizeof(CHAR)))) # Char  |->_)
  **  (((out_pre + (7 * sizeof(CHAR)))) # Char  |->_)
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

Definition qm_store8_safety_wit_2 := 
forall (a_pre: Z) (out_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((( &( "out" ) )) # Ptr  |-> out_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  (((out_pre + (0 * sizeof(CHAR)))) # Char  |-> x0)
  **  (((out_pre + (1 * sizeof(CHAR)))) # Char  |->_)
  **  (((out_pre + (2 * sizeof(CHAR)))) # Char  |->_)
  **  (((out_pre + (3 * sizeof(CHAR)))) # Char  |->_)
  **  (((out_pre + (4 * sizeof(CHAR)))) # Char  |->_)
  **  (((out_pre + (5 * sizeof(CHAR)))) # Char  |->_)
  **  (((out_pre + (6 * sizeof(CHAR)))) # Char  |->_)
  **  (((out_pre + (7 * sizeof(CHAR)))) # Char  |->_)
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

Definition qm_store8_safety_wit_3 := 
forall (a_pre: Z) (out_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((( &( "out" ) )) # Ptr  |-> out_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  (((out_pre + (0 * sizeof(CHAR)))) # Char  |-> x0)
  **  (((out_pre + (1 * sizeof(CHAR)))) # Char  |-> x1)
  **  (((out_pre + (2 * sizeof(CHAR)))) # Char  |->_)
  **  (((out_pre + (3 * sizeof(CHAR)))) # Char  |->_)
  **  (((out_pre + (4 * sizeof(CHAR)))) # Char  |->_)
  **  (((out_pre + (5 * sizeof(CHAR)))) # Char  |->_)
  **  (((out_pre + (6 * sizeof(CHAR)))) # Char  |->_)
  **  (((out_pre + (7 * sizeof(CHAR)))) # Char  |->_)
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

Definition qm_store8_safety_wit_4 := 
forall (a_pre: Z) (out_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((( &( "out" ) )) # Ptr  |-> out_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  (((out_pre + (0 * sizeof(CHAR)))) # Char  |-> x0)
  **  (((out_pre + (1 * sizeof(CHAR)))) # Char  |-> x1)
  **  (((out_pre + (2 * sizeof(CHAR)))) # Char  |-> x2)
  **  (((out_pre + (3 * sizeof(CHAR)))) # Char  |->_)
  **  (((out_pre + (4 * sizeof(CHAR)))) # Char  |->_)
  **  (((out_pre + (5 * sizeof(CHAR)))) # Char  |->_)
  **  (((out_pre + (6 * sizeof(CHAR)))) # Char  |->_)
  **  (((out_pre + (7 * sizeof(CHAR)))) # Char  |->_)
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

Definition qm_store8_safety_wit_5 := 
forall (a_pre: Z) (out_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((( &( "out" ) )) # Ptr  |-> out_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  (((out_pre + (0 * sizeof(CHAR)))) # Char  |-> x0)
  **  (((out_pre + (1 * sizeof(CHAR)))) # Char  |-> x1)
  **  (((out_pre + (2 * sizeof(CHAR)))) # Char  |-> x2)
  **  (((out_pre + (3 * sizeof(CHAR)))) # Char  |-> x3)
  **  (((out_pre + (4 * sizeof(CHAR)))) # Char  |->_)
  **  (((out_pre + (5 * sizeof(CHAR)))) # Char  |->_)
  **  (((out_pre + (6 * sizeof(CHAR)))) # Char  |->_)
  **  (((out_pre + (7 * sizeof(CHAR)))) # Char  |->_)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s7")) # Char  |-> x7)
|--
  “ (4 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 4) ”
.

Definition qm_store8_safety_wit_6 := 
forall (a_pre: Z) (out_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((( &( "out" ) )) # Ptr  |-> out_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  (((out_pre + (0 * sizeof(CHAR)))) # Char  |-> x0)
  **  (((out_pre + (1 * sizeof(CHAR)))) # Char  |-> x1)
  **  (((out_pre + (2 * sizeof(CHAR)))) # Char  |-> x2)
  **  (((out_pre + (3 * sizeof(CHAR)))) # Char  |-> x3)
  **  (((out_pre + (4 * sizeof(CHAR)))) # Char  |-> x4)
  **  (((out_pre + (5 * sizeof(CHAR)))) # Char  |->_)
  **  (((out_pre + (6 * sizeof(CHAR)))) # Char  |->_)
  **  (((out_pre + (7 * sizeof(CHAR)))) # Char  |->_)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s7")) # Char  |-> x7)
|--
  “ (5 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 5) ”
.

Definition qm_store8_safety_wit_7 := 
forall (a_pre: Z) (out_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((( &( "out" ) )) # Ptr  |-> out_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  (((out_pre + (0 * sizeof(CHAR)))) # Char  |-> x0)
  **  (((out_pre + (1 * sizeof(CHAR)))) # Char  |-> x1)
  **  (((out_pre + (2 * sizeof(CHAR)))) # Char  |-> x2)
  **  (((out_pre + (3 * sizeof(CHAR)))) # Char  |-> x3)
  **  (((out_pre + (4 * sizeof(CHAR)))) # Char  |-> x4)
  **  (((out_pre + (5 * sizeof(CHAR)))) # Char  |-> x5)
  **  (((out_pre + (6 * sizeof(CHAR)))) # Char  |->_)
  **  (((out_pre + (7 * sizeof(CHAR)))) # Char  |->_)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s7")) # Char  |-> x7)
|--
  “ (6 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 6) ”
.

Definition qm_store8_safety_wit_8 := 
forall (a_pre: Z) (out_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((( &( "out" ) )) # Ptr  |-> out_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  (((out_pre + (0 * sizeof(CHAR)))) # Char  |-> x0)
  **  (((out_pre + (1 * sizeof(CHAR)))) # Char  |-> x1)
  **  (((out_pre + (2 * sizeof(CHAR)))) # Char  |-> x2)
  **  (((out_pre + (3 * sizeof(CHAR)))) # Char  |-> x3)
  **  (((out_pre + (4 * sizeof(CHAR)))) # Char  |-> x4)
  **  (((out_pre + (5 * sizeof(CHAR)))) # Char  |-> x5)
  **  (((out_pre + (6 * sizeof(CHAR)))) # Char  |-> x6)
  **  (((out_pre + (7 * sizeof(CHAR)))) # Char  |->_)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((a_pre)  # "int8x8_t" ->ₛ "s7")) # Char  |-> x7)
|--
  “ (7 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 7) ”
.

Definition qm_store8_return_wit_1 := 
forall (a_pre: Z) (out_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  (((out_pre + (0 * sizeof(CHAR)))) # Char  |-> x0)
  **  (((out_pre + (1 * sizeof(CHAR)))) # Char  |-> x1)
  **  (((out_pre + (2 * sizeof(CHAR)))) # Char  |-> x2)
  **  (((out_pre + (3 * sizeof(CHAR)))) # Char  |-> x3)
  **  (((out_pre + (4 * sizeof(CHAR)))) # Char  |-> x4)
  **  (((out_pre + (5 * sizeof(CHAR)))) # Char  |-> x5)
  **  (((out_pre + (6 * sizeof(CHAR)))) # Char  |-> x6)
  **  (((out_pre + (7 * sizeof(CHAR)))) # Char  |-> x7)
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
  **  (((out_pre + (4 * sizeof(CHAR)))) # Char  |-> x4)
  **  (((out_pre + (5 * sizeof(CHAR)))) # Char  |-> x5)
  **  (((out_pre + (6 * sizeof(CHAR)))) # Char  |-> x6)
  **  (((out_pre + (7 * sizeof(CHAR)))) # Char  |-> x7)
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


Axiom proof_of_qm_store8_safety_wit_1 : qm_store8_safety_wit_1.
Axiom proof_of_qm_store8_safety_wit_2 : qm_store8_safety_wit_2.
Axiom proof_of_qm_store8_safety_wit_3 : qm_store8_safety_wit_3.
Axiom proof_of_qm_store8_safety_wit_4 : qm_store8_safety_wit_4.
Axiom proof_of_qm_store8_safety_wit_5 : qm_store8_safety_wit_5.
Axiom proof_of_qm_store8_safety_wit_6 : qm_store8_safety_wit_6.
Axiom proof_of_qm_store8_safety_wit_7 : qm_store8_safety_wit_7.
Axiom proof_of_qm_store8_safety_wit_8 : qm_store8_safety_wit_8.
Axiom proof_of_qm_store8_return_wit_1 : qm_store8_return_wit_1.

End VC_Correct.
