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
Require Import F32F16.Types.
Local Open Scope sac.

(*----- Function vld1q_f32 -----*)

Definition vld1q_f32_safety_wit_1 := 
forall (p_pre: Z) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) ,
  (UndefStructPredfloat32x4_t ( &( "r" ) ) )
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  (((p_pre + (0 * sizeof(FLOAT)))) # Float  |-> x0)
  **  (((p_pre + (1 * sizeof(FLOAT)))) # Float  |-> x1)
  **  (((p_pre + (2 * sizeof(FLOAT)))) # Float  |-> x2)
  **  (((p_pre + (3 * sizeof(FLOAT)))) # Float  |-> x3)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition vld1q_f32_safety_wit_2 := 
forall (p_pre: Z) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) ,
  ((&(( &( "r" ) )->ₛ "s3")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> x0)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  (((p_pre + (0 * sizeof(FLOAT)))) # Float  |-> x0)
  **  (((p_pre + (1 * sizeof(FLOAT)))) # Float  |-> x1)
  **  (((p_pre + (2 * sizeof(FLOAT)))) # Float  |-> x2)
  **  (((p_pre + (3 * sizeof(FLOAT)))) # Float  |-> x3)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition vld1q_f32_safety_wit_3 := 
forall (p_pre: Z) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) ,
  ((&(( &( "r" ) )->ₛ "s3")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> x1)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> x0)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  (((p_pre + (0 * sizeof(FLOAT)))) # Float  |-> x0)
  **  (((p_pre + (1 * sizeof(FLOAT)))) # Float  |-> x1)
  **  (((p_pre + (2 * sizeof(FLOAT)))) # Float  |-> x2)
  **  (((p_pre + (3 * sizeof(FLOAT)))) # Float  |-> x3)
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition vld1q_f32_safety_wit_4 := 
forall (p_pre: Z) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) ,
  ((&(( &( "r" ) )->ₛ "s3")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> x2)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> x1)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> x0)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  (((p_pre + (0 * sizeof(FLOAT)))) # Float  |-> x0)
  **  (((p_pre + (1 * sizeof(FLOAT)))) # Float  |-> x1)
  **  (((p_pre + (2 * sizeof(FLOAT)))) # Float  |-> x2)
  **  (((p_pre + (3 * sizeof(FLOAT)))) # Float  |-> x3)
|--
  “ (3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 3) ”
.

Definition vld1q_f32_return_wit_1 := 
forall (p_pre: Z) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (record_return: Z) ,
  ((&((record_return)  # "float32x4_t" ->ₛ "s3")) # Float  |-> x3)
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s0")) # Float  |-> x0)
  **  (((p_pre + (0 * sizeof(FLOAT)))) # Float  |-> x0)
  **  (((p_pre + (1 * sizeof(FLOAT)))) # Float  |-> x1)
  **  (((p_pre + (2 * sizeof(FLOAT)))) # Float  |-> x2)
  **  (((p_pre + (3 * sizeof(FLOAT)))) # Float  |-> x3)
|--
  (((p_pre + (0 * sizeof(FLOAT)))) # Float  |-> x0)
  **  (((p_pre + (1 * sizeof(FLOAT)))) # Float  |-> x1)
  **  (((p_pre + (2 * sizeof(FLOAT)))) # Float  |-> x2)
  **  (((p_pre + (3 * sizeof(FLOAT)))) # Float  |-> x3)
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s0")) # Float  |-> x0)
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s1")) # Float  |-> x1)
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s2")) # Float  |-> x2)
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s3")) # Float  |-> x3)
.

Definition vld1q_f32_partial_solve_wit_1 := 
forall (p_pre: Z) (x3: fp32) (x2: fp32) (x1: fp32) (x0: fp32) (record_return: Z) ,
  (UndefStructPredfloat32x4_t record_return )
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> x3)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> x2)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> x1)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> x0)
  **  (((p_pre + (0 * sizeof(FLOAT)))) # Float  |-> x0)
  **  (((p_pre + (1 * sizeof(FLOAT)))) # Float  |-> x1)
  **  (((p_pre + (2 * sizeof(FLOAT)))) # Float  |-> x2)
  **  (((p_pre + (3 * sizeof(FLOAT)))) # Float  |-> x3)
|--
  ((&((record_return)  # "float32x4_t" ->ₛ "s3")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Float  |-> x3)
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s2")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Float  |-> x2)
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s1")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Float  |-> x1)
  **  ((&((record_return)  # "float32x4_t" ->ₛ "s0")) # Float  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Float  |-> x0)
  **  (((p_pre + (0 * sizeof(FLOAT)))) # Float  |-> x0)
  **  (((p_pre + (1 * sizeof(FLOAT)))) # Float  |-> x1)
  **  (((p_pre + (2 * sizeof(FLOAT)))) # Float  |-> x2)
  **  (((p_pre + (3 * sizeof(FLOAT)))) # Float  |-> x3)
.

(*----- Function qcp_f16_store8 -----*)

Definition qcp_f16_store8_safety_wit_1 := 
forall (a_pre: Z) (p_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s7")) # UShort  |-> x7)
  **  (((p_pre + (0 * sizeof(USHORT)))) # UShort  |->_)
  **  (((p_pre + (1 * sizeof(USHORT)))) # UShort  |->_)
  **  (((p_pre + (2 * sizeof(USHORT)))) # UShort  |->_)
  **  (((p_pre + (3 * sizeof(USHORT)))) # UShort  |->_)
  **  (((p_pre + (4 * sizeof(USHORT)))) # UShort  |->_)
  **  (((p_pre + (5 * sizeof(USHORT)))) # UShort  |->_)
  **  (((p_pre + (6 * sizeof(USHORT)))) # UShort  |->_)
  **  (((p_pre + (7 * sizeof(USHORT)))) # UShort  |->_)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qcp_f16_store8_safety_wit_2 := 
forall (a_pre: Z) (p_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s7")) # UShort  |-> x7)
  **  (((p_pre + (0 * sizeof(USHORT)))) # UShort  |-> x0)
  **  (((p_pre + (1 * sizeof(USHORT)))) # UShort  |->_)
  **  (((p_pre + (2 * sizeof(USHORT)))) # UShort  |->_)
  **  (((p_pre + (3 * sizeof(USHORT)))) # UShort  |->_)
  **  (((p_pre + (4 * sizeof(USHORT)))) # UShort  |->_)
  **  (((p_pre + (5 * sizeof(USHORT)))) # UShort  |->_)
  **  (((p_pre + (6 * sizeof(USHORT)))) # UShort  |->_)
  **  (((p_pre + (7 * sizeof(USHORT)))) # UShort  |->_)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition qcp_f16_store8_safety_wit_3 := 
forall (a_pre: Z) (p_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s7")) # UShort  |-> x7)
  **  (((p_pre + (0 * sizeof(USHORT)))) # UShort  |-> x0)
  **  (((p_pre + (1 * sizeof(USHORT)))) # UShort  |-> x1)
  **  (((p_pre + (2 * sizeof(USHORT)))) # UShort  |->_)
  **  (((p_pre + (3 * sizeof(USHORT)))) # UShort  |->_)
  **  (((p_pre + (4 * sizeof(USHORT)))) # UShort  |->_)
  **  (((p_pre + (5 * sizeof(USHORT)))) # UShort  |->_)
  **  (((p_pre + (6 * sizeof(USHORT)))) # UShort  |->_)
  **  (((p_pre + (7 * sizeof(USHORT)))) # UShort  |->_)
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition qcp_f16_store8_safety_wit_4 := 
forall (a_pre: Z) (p_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s7")) # UShort  |-> x7)
  **  (((p_pre + (0 * sizeof(USHORT)))) # UShort  |-> x0)
  **  (((p_pre + (1 * sizeof(USHORT)))) # UShort  |-> x1)
  **  (((p_pre + (2 * sizeof(USHORT)))) # UShort  |-> x2)
  **  (((p_pre + (3 * sizeof(USHORT)))) # UShort  |->_)
  **  (((p_pre + (4 * sizeof(USHORT)))) # UShort  |->_)
  **  (((p_pre + (5 * sizeof(USHORT)))) # UShort  |->_)
  **  (((p_pre + (6 * sizeof(USHORT)))) # UShort  |->_)
  **  (((p_pre + (7 * sizeof(USHORT)))) # UShort  |->_)
|--
  “ (3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 3) ”
.

Definition qcp_f16_store8_safety_wit_5 := 
forall (a_pre: Z) (p_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s7")) # UShort  |-> x7)
  **  (((p_pre + (0 * sizeof(USHORT)))) # UShort  |-> x0)
  **  (((p_pre + (1 * sizeof(USHORT)))) # UShort  |-> x1)
  **  (((p_pre + (2 * sizeof(USHORT)))) # UShort  |-> x2)
  **  (((p_pre + (3 * sizeof(USHORT)))) # UShort  |-> x3)
  **  (((p_pre + (4 * sizeof(USHORT)))) # UShort  |->_)
  **  (((p_pre + (5 * sizeof(USHORT)))) # UShort  |->_)
  **  (((p_pre + (6 * sizeof(USHORT)))) # UShort  |->_)
  **  (((p_pre + (7 * sizeof(USHORT)))) # UShort  |->_)
|--
  “ (4 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 4) ”
.

Definition qcp_f16_store8_safety_wit_6 := 
forall (a_pre: Z) (p_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s7")) # UShort  |-> x7)
  **  (((p_pre + (0 * sizeof(USHORT)))) # UShort  |-> x0)
  **  (((p_pre + (1 * sizeof(USHORT)))) # UShort  |-> x1)
  **  (((p_pre + (2 * sizeof(USHORT)))) # UShort  |-> x2)
  **  (((p_pre + (3 * sizeof(USHORT)))) # UShort  |-> x3)
  **  (((p_pre + (4 * sizeof(USHORT)))) # UShort  |-> x4)
  **  (((p_pre + (5 * sizeof(USHORT)))) # UShort  |->_)
  **  (((p_pre + (6 * sizeof(USHORT)))) # UShort  |->_)
  **  (((p_pre + (7 * sizeof(USHORT)))) # UShort  |->_)
|--
  “ (5 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 5) ”
.

Definition qcp_f16_store8_safety_wit_7 := 
forall (a_pre: Z) (p_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s7")) # UShort  |-> x7)
  **  (((p_pre + (0 * sizeof(USHORT)))) # UShort  |-> x0)
  **  (((p_pre + (1 * sizeof(USHORT)))) # UShort  |-> x1)
  **  (((p_pre + (2 * sizeof(USHORT)))) # UShort  |-> x2)
  **  (((p_pre + (3 * sizeof(USHORT)))) # UShort  |-> x3)
  **  (((p_pre + (4 * sizeof(USHORT)))) # UShort  |-> x4)
  **  (((p_pre + (5 * sizeof(USHORT)))) # UShort  |-> x5)
  **  (((p_pre + (6 * sizeof(USHORT)))) # UShort  |->_)
  **  (((p_pre + (7 * sizeof(USHORT)))) # UShort  |->_)
|--
  “ (6 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 6) ”
.

Definition qcp_f16_store8_safety_wit_8 := 
forall (a_pre: Z) (p_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s7")) # UShort  |-> x7)
  **  (((p_pre + (0 * sizeof(USHORT)))) # UShort  |-> x0)
  **  (((p_pre + (1 * sizeof(USHORT)))) # UShort  |-> x1)
  **  (((p_pre + (2 * sizeof(USHORT)))) # UShort  |-> x2)
  **  (((p_pre + (3 * sizeof(USHORT)))) # UShort  |-> x3)
  **  (((p_pre + (4 * sizeof(USHORT)))) # UShort  |-> x4)
  **  (((p_pre + (5 * sizeof(USHORT)))) # UShort  |-> x5)
  **  (((p_pre + (6 * sizeof(USHORT)))) # UShort  |-> x6)
  **  (((p_pre + (7 * sizeof(USHORT)))) # UShort  |->_)
|--
  “ (7 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 7) ”
.

Definition qcp_f16_store8_return_wit_1 := 
forall (a_pre: Z) (p_pre: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((&((a_pre)  # "uint16x8_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s7")) # UShort  |-> x7)
  **  (((p_pre + (0 * sizeof(USHORT)))) # UShort  |-> x0)
  **  (((p_pre + (1 * sizeof(USHORT)))) # UShort  |-> x1)
  **  (((p_pre + (2 * sizeof(USHORT)))) # UShort  |-> x2)
  **  (((p_pre + (3 * sizeof(USHORT)))) # UShort  |-> x3)
  **  (((p_pre + (4 * sizeof(USHORT)))) # UShort  |-> x4)
  **  (((p_pre + (5 * sizeof(USHORT)))) # UShort  |-> x5)
  **  (((p_pre + (6 * sizeof(USHORT)))) # UShort  |-> x6)
  **  (((p_pre + (7 * sizeof(USHORT)))) # UShort  |-> x7)
|--
  ((&((a_pre)  # "uint16x8_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "uint16x8_t" ->ₛ "s7")) # UShort  |-> x7)
  **  (((p_pre + (0 * sizeof(USHORT)))) # UShort  |-> x0)
  **  (((p_pre + (1 * sizeof(USHORT)))) # UShort  |-> x1)
  **  (((p_pre + (2 * sizeof(USHORT)))) # UShort  |-> x2)
  **  (((p_pre + (3 * sizeof(USHORT)))) # UShort  |-> x3)
  **  (((p_pre + (4 * sizeof(USHORT)))) # UShort  |-> x4)
  **  (((p_pre + (5 * sizeof(USHORT)))) # UShort  |-> x5)
  **  (((p_pre + (6 * sizeof(USHORT)))) # UShort  |-> x6)
  **  (((p_pre + (7 * sizeof(USHORT)))) # UShort  |-> x7)
.

(*----- Function qcp_f16_store4 -----*)

Definition qcp_f16_store4_safety_wit_1 := 
forall (a_pre: Z) (p_pre: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  (((p_pre + (0 * sizeof(USHORT)))) # UShort  |->_)
  **  (((p_pre + (1 * sizeof(USHORT)))) # UShort  |->_)
  **  (((p_pre + (2 * sizeof(USHORT)))) # UShort  |->_)
  **  (((p_pre + (3 * sizeof(USHORT)))) # UShort  |->_)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qcp_f16_store4_safety_wit_2 := 
forall (a_pre: Z) (p_pre: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  (((p_pre + (0 * sizeof(USHORT)))) # UShort  |-> x0)
  **  (((p_pre + (1 * sizeof(USHORT)))) # UShort  |->_)
  **  (((p_pre + (2 * sizeof(USHORT)))) # UShort  |->_)
  **  (((p_pre + (3 * sizeof(USHORT)))) # UShort  |->_)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition qcp_f16_store4_safety_wit_3 := 
forall (a_pre: Z) (p_pre: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  (((p_pre + (0 * sizeof(USHORT)))) # UShort  |-> x0)
  **  (((p_pre + (1 * sizeof(USHORT)))) # UShort  |-> x1)
  **  (((p_pre + (2 * sizeof(USHORT)))) # UShort  |->_)
  **  (((p_pre + (3 * sizeof(USHORT)))) # UShort  |->_)
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition qcp_f16_store4_safety_wit_4 := 
forall (a_pre: Z) (p_pre: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  (((p_pre + (0 * sizeof(USHORT)))) # UShort  |-> x0)
  **  (((p_pre + (1 * sizeof(USHORT)))) # UShort  |-> x1)
  **  (((p_pre + (2 * sizeof(USHORT)))) # UShort  |-> x2)
  **  (((p_pre + (3 * sizeof(USHORT)))) # UShort  |->_)
|--
  “ (3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 3) ”
.

Definition qcp_f16_store4_return_wit_1 := 
forall (a_pre: Z) (p_pre: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((&((a_pre)  # "uint16x4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  (((p_pre + (0 * sizeof(USHORT)))) # UShort  |-> x0)
  **  (((p_pre + (1 * sizeof(USHORT)))) # UShort  |-> x1)
  **  (((p_pre + (2 * sizeof(USHORT)))) # UShort  |-> x2)
  **  (((p_pre + (3 * sizeof(USHORT)))) # UShort  |-> x3)
|--
  ((&((a_pre)  # "uint16x4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  (((p_pre + (0 * sizeof(USHORT)))) # UShort  |-> x0)
  **  (((p_pre + (1 * sizeof(USHORT)))) # UShort  |-> x1)
  **  (((p_pre + (2 * sizeof(USHORT)))) # UShort  |-> x2)
  **  (((p_pre + (3 * sizeof(USHORT)))) # UShort  |-> x3)
.

(*----- Function qcp_f16_store2_0 -----*)

Definition qcp_f16_store2_0_safety_wit_1 := 
forall (a_pre: Z) (p_pre: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((( &( "out" ) )) # Ptr  |-> p_pre)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  (((p_pre + (0 * sizeof(USHORT)))) # UShort  |->_)
  **  (((p_pre + (1 * sizeof(USHORT)))) # UShort  |->_)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qcp_f16_store2_0_safety_wit_2 := 
forall (a_pre: Z) (p_pre: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((( &( "out" ) )) # Ptr  |-> p_pre)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  (((p_pre + (0 * sizeof(USHORT)))) # UShort  |-> x0)
  **  (((p_pre + (1 * sizeof(USHORT)))) # UShort  |->_)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition qcp_f16_store2_0_return_wit_1 := 
forall (a_pre: Z) (p_pre: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((&((a_pre)  # "uint16x4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  (((p_pre + (0 * sizeof(USHORT)))) # UShort  |-> x0)
  **  (((p_pre + (1 * sizeof(USHORT)))) # UShort  |-> x1)
|--
  ((&((a_pre)  # "uint16x4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  (((p_pre + (0 * sizeof(USHORT)))) # UShort  |-> x0)
  **  (((p_pre + (1 * sizeof(USHORT)))) # UShort  |-> x1)
.

(*----- Function qcp_f16_store1_0 -----*)

Definition qcp_f16_store1_0_safety_wit_1 := 
forall (a_pre: Z) (p_pre: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  (((p_pre + (0 * sizeof(USHORT)))) # UShort  |->_)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qcp_f16_store1_0_return_wit_1 := 
forall (a_pre: Z) (p_pre: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((&((a_pre)  # "uint16x4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  (((p_pre + (0 * sizeof(USHORT)))) # UShort  |-> x0)
|--
  ((&((a_pre)  # "uint16x4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  (((p_pre + (0 * sizeof(USHORT)))) # UShort  |-> x0)
.

(*----- Function qcp_f16_u32_view -----*)

Definition qcp_f16_u32_view_return_wit_1 := 
forall (a_pre: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) ,
  ((&((a_pre)  # "uint16x4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s3")) # UShort  |-> x3)
|--
  “ (a_pre = a_pre) ”
  &&  ((&((a_pre)  # "uint16x4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "uint16x4_t" ->ₛ "s3")) # UShort  |-> x3)
.

(*----- Function qcp_assert -----*)

Definition qcp_assert_return_wit_1 := 
forall (condition_pre: Z) (PreH1 : (condition_pre <> 0)) ,
  TT && emp 
|--
  TT && emp 
.

Module Type VC_Correct.


Axiom proof_of_vld1q_f32_safety_wit_1 : vld1q_f32_safety_wit_1.
Axiom proof_of_vld1q_f32_safety_wit_2 : vld1q_f32_safety_wit_2.
Axiom proof_of_vld1q_f32_safety_wit_3 : vld1q_f32_safety_wit_3.
Axiom proof_of_vld1q_f32_safety_wit_4 : vld1q_f32_safety_wit_4.
Axiom proof_of_vld1q_f32_return_wit_1 : vld1q_f32_return_wit_1.
Axiom proof_of_vld1q_f32_partial_solve_wit_1 : vld1q_f32_partial_solve_wit_1.
Axiom proof_of_qcp_f16_store8_safety_wit_1 : qcp_f16_store8_safety_wit_1.
Axiom proof_of_qcp_f16_store8_safety_wit_2 : qcp_f16_store8_safety_wit_2.
Axiom proof_of_qcp_f16_store8_safety_wit_3 : qcp_f16_store8_safety_wit_3.
Axiom proof_of_qcp_f16_store8_safety_wit_4 : qcp_f16_store8_safety_wit_4.
Axiom proof_of_qcp_f16_store8_safety_wit_5 : qcp_f16_store8_safety_wit_5.
Axiom proof_of_qcp_f16_store8_safety_wit_6 : qcp_f16_store8_safety_wit_6.
Axiom proof_of_qcp_f16_store8_safety_wit_7 : qcp_f16_store8_safety_wit_7.
Axiom proof_of_qcp_f16_store8_safety_wit_8 : qcp_f16_store8_safety_wit_8.
Axiom proof_of_qcp_f16_store8_return_wit_1 : qcp_f16_store8_return_wit_1.
Axiom proof_of_qcp_f16_store4_safety_wit_1 : qcp_f16_store4_safety_wit_1.
Axiom proof_of_qcp_f16_store4_safety_wit_2 : qcp_f16_store4_safety_wit_2.
Axiom proof_of_qcp_f16_store4_safety_wit_3 : qcp_f16_store4_safety_wit_3.
Axiom proof_of_qcp_f16_store4_safety_wit_4 : qcp_f16_store4_safety_wit_4.
Axiom proof_of_qcp_f16_store4_return_wit_1 : qcp_f16_store4_return_wit_1.
Axiom proof_of_qcp_f16_store2_0_safety_wit_1 : qcp_f16_store2_0_safety_wit_1.
Axiom proof_of_qcp_f16_store2_0_safety_wit_2 : qcp_f16_store2_0_safety_wit_2.
Axiom proof_of_qcp_f16_store2_0_return_wit_1 : qcp_f16_store2_0_return_wit_1.
Axiom proof_of_qcp_f16_store1_0_safety_wit_1 : qcp_f16_store1_0_safety_wit_1.
Axiom proof_of_qcp_f16_store1_0_return_wit_1 : qcp_f16_store1_0_return_wit_1.
Axiom proof_of_qcp_f16_u32_view_return_wit_1 : qcp_f16_u32_view_return_wit_1.
Axiom proof_of_qcp_assert_return_wit_1 : qcp_assert_return_wit_1.

End VC_Correct.
