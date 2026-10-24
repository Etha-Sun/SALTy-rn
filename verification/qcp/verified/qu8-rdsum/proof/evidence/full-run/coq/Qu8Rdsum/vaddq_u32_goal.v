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
Require Import Qu8Rdsum.Model.
Require Import Qu8Rdsum.Types.
Require Import Qu8Rdsum.VectorModel.
Local Open Scope sac.

(*----- Function vaddq_u32 -----*)

Definition vaddq_u32_return_wit_1 := 
forall (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (record_return: Z) (PreH1 : (retval_4 = (rs_add_u32 (a3) (b3)))) (PreH2 : (0 <= retval_4)) (PreH3 : (retval_4 <= UINT_MAX)) (PreH4 : (retval_3 = (rs_add_u32 (a2) (b2)))) (PreH5 : (0 <= retval_3)) (PreH6 : (retval_3 <= UINT_MAX)) (PreH7 : (retval_2 = (rs_add_u32 (a1) (b1)))) (PreH8 : (0 <= retval_2)) (PreH9 : (retval_2 <= UINT_MAX)) (PreH10 : (retval = (rs_add_u32 (a0) (b0)))) (PreH11 : (0 <= retval)) (PreH12 : (retval <= UINT_MAX)) (PreH13 : (0 <= a0)) (PreH14 : (a0 <= UINT_MAX)) (PreH15 : (0 <= a1)) (PreH16 : (a1 <= UINT_MAX)) (PreH17 : (0 <= a2)) (PreH18 : (a2 <= UINT_MAX)) (PreH19 : (0 <= a3)) (PreH20 : (a3 <= UINT_MAX)) (PreH21 : (0 <= b0)) (PreH22 : (b0 <= UINT_MAX)) (PreH23 : (0 <= b1)) (PreH24 : (b1 <= UINT_MAX)) (PreH25 : (0 <= b2)) (PreH26 : (b2 <= UINT_MAX)) (PreH27 : (0 <= b3)) (PreH28 : (b3 <= UINT_MAX)) ,
  ((&((record_return)  # "uint32x4_t" ->ₛ "s3")) # UInt  |-> retval_4)
  **  ((&((record_return)  # "uint32x4_t" ->ₛ "s2")) # UInt  |-> retval_3)
  **  ((&((record_return)  # "uint32x4_t" ->ₛ "s1")) # UInt  |-> retval_2)
  **  ((&((record_return)  # "uint32x4_t" ->ₛ "s0")) # UInt  |-> retval)
|--
  ((&((record_return)  # "uint32x4_t" ->ₛ "s0")) # UInt  |-> (rs_add_u32 (a0) (b0)))
  **  ((&((record_return)  # "uint32x4_t" ->ₛ "s1")) # UInt  |-> (rs_add_u32 (a1) (b1)))
  **  ((&((record_return)  # "uint32x4_t" ->ₛ "s2")) # UInt  |-> (rs_add_u32 (a2) (b2)))
  **  ((&((record_return)  # "uint32x4_t" ->ₛ "s3")) # UInt  |-> (rs_add_u32 (a3) (b3)))
.

Definition vaddq_u32_partial_solve_wit_1_pure := 
forall (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (PreH1 : (0 <= a0)) (PreH2 : (a0 <= UINT_MAX)) (PreH3 : (0 <= a1)) (PreH4 : (a1 <= UINT_MAX)) (PreH5 : (0 <= a2)) (PreH6 : (a2 <= UINT_MAX)) (PreH7 : (0 <= a3)) (PreH8 : (a3 <= UINT_MAX)) (PreH9 : (0 <= b0)) (PreH10 : (b0 <= UINT_MAX)) (PreH11 : (0 <= b1)) (PreH12 : (b1 <= UINT_MAX)) (PreH13 : (0 <= b2)) (PreH14 : (b2 <= UINT_MAX)) (PreH15 : (0 <= b3)) (PreH16 : (b3 <= UINT_MAX)) ,
  (UndefStructPreduint32x4_t ( &( "r" ) ) )
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # UInt  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UInt  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UInt  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UInt  |-> a3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UInt  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UInt  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UInt  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UInt  |-> b3)
|--
  “ (0 <= a0) ” 
  &&  “ (a0 <= UINT_MAX) ” 
  &&  “ (0 <= b0) ” 
  &&  “ (b0 <= UINT_MAX) ”
.

Definition vaddq_u32_partial_solve_wit_1_aux := 
forall (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (PreH1 : (0 <= a0)) (PreH2 : (a0 <= UINT_MAX)) (PreH3 : (0 <= a1)) (PreH4 : (a1 <= UINT_MAX)) (PreH5 : (0 <= a2)) (PreH6 : (a2 <= UINT_MAX)) (PreH7 : (0 <= a3)) (PreH8 : (a3 <= UINT_MAX)) (PreH9 : (0 <= b0)) (PreH10 : (b0 <= UINT_MAX)) (PreH11 : (0 <= b1)) (PreH12 : (b1 <= UINT_MAX)) (PreH13 : (0 <= b2)) (PreH14 : (b2 <= UINT_MAX)) (PreH15 : (0 <= b3)) (PreH16 : (b3 <= UINT_MAX)) ,
  (UndefStructPreduint32x4_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # UInt  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UInt  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UInt  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UInt  |-> a3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UInt  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UInt  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UInt  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UInt  |-> b3)
|--
  “ (0 <= a0) ” 
  &&  “ (a0 <= UINT_MAX) ” 
  &&  “ (0 <= b0) ” 
  &&  “ (b0 <= UINT_MAX) ” 
  &&  “ (0 <= a0) ” 
  &&  “ (a0 <= UINT_MAX) ” 
  &&  “ (0 <= a1) ” 
  &&  “ (a1 <= UINT_MAX) ” 
  &&  “ (0 <= a2) ” 
  &&  “ (a2 <= UINT_MAX) ” 
  &&  “ (0 <= a3) ” 
  &&  “ (a3 <= UINT_MAX) ” 
  &&  “ (0 <= b0) ” 
  &&  “ (b0 <= UINT_MAX) ” 
  &&  “ (0 <= b1) ” 
  &&  “ (b1 <= UINT_MAX) ” 
  &&  “ (0 <= b2) ” 
  &&  “ (b2 <= UINT_MAX) ” 
  &&  “ (0 <= b3) ” 
  &&  “ (b3 <= UINT_MAX) ”
  &&  (UndefStructPreduint32x4_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # UInt  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UInt  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UInt  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UInt  |-> a3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UInt  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UInt  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UInt  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UInt  |-> b3)
.

Definition vaddq_u32_partial_solve_wit_1 := vaddq_u32_partial_solve_wit_1_pure -> vaddq_u32_partial_solve_wit_1_aux.

Definition vaddq_u32_partial_solve_wit_2_pure := 
forall (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (PreH1 : (retval = (rs_add_u32 (a0) (b0)))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= UINT_MAX)) (PreH4 : (0 <= a0)) (PreH5 : (a0 <= UINT_MAX)) (PreH6 : (0 <= a1)) (PreH7 : (a1 <= UINT_MAX)) (PreH8 : (0 <= a2)) (PreH9 : (a2 <= UINT_MAX)) (PreH10 : (0 <= a3)) (PreH11 : (a3 <= UINT_MAX)) (PreH12 : (0 <= b0)) (PreH13 : (b0 <= UINT_MAX)) (PreH14 : (0 <= b1)) (PreH15 : (b1 <= UINT_MAX)) (PreH16 : (0 <= b2)) (PreH17 : (b2 <= UINT_MAX)) (PreH18 : (0 <= b3)) (PreH19 : (b3 <= UINT_MAX)) ,
  ((&(( &( "r" ) )->ₛ "s3")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UInt  |-> retval)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # UInt  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UInt  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UInt  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UInt  |-> a3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UInt  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UInt  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UInt  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UInt  |-> b3)
|--
  “ (0 <= a1) ” 
  &&  “ (a1 <= UINT_MAX) ” 
  &&  “ (0 <= b1) ” 
  &&  “ (b1 <= UINT_MAX) ”
.

Definition vaddq_u32_partial_solve_wit_2_aux := 
forall (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (PreH1 : (retval = (rs_add_u32 (a0) (b0)))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= UINT_MAX)) (PreH4 : (0 <= a0)) (PreH5 : (a0 <= UINT_MAX)) (PreH6 : (0 <= a1)) (PreH7 : (a1 <= UINT_MAX)) (PreH8 : (0 <= a2)) (PreH9 : (a2 <= UINT_MAX)) (PreH10 : (0 <= a3)) (PreH11 : (a3 <= UINT_MAX)) (PreH12 : (0 <= b0)) (PreH13 : (b0 <= UINT_MAX)) (PreH14 : (0 <= b1)) (PreH15 : (b1 <= UINT_MAX)) (PreH16 : (0 <= b2)) (PreH17 : (b2 <= UINT_MAX)) (PreH18 : (0 <= b3)) (PreH19 : (b3 <= UINT_MAX)) ,
  ((&(( &( "r" ) )->ₛ "s3")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UInt  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UInt  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UInt  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UInt  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UInt  |-> a3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UInt  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UInt  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UInt  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UInt  |-> b3)
|--
  “ (0 <= a1) ” 
  &&  “ (a1 <= UINT_MAX) ” 
  &&  “ (0 <= b1) ” 
  &&  “ (b1 <= UINT_MAX) ” 
  &&  “ (retval = (rs_add_u32 (a0) (b0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= UINT_MAX) ” 
  &&  “ (0 <= a0) ” 
  &&  “ (a0 <= UINT_MAX) ” 
  &&  “ (0 <= a1) ” 
  &&  “ (a1 <= UINT_MAX) ” 
  &&  “ (0 <= a2) ” 
  &&  “ (a2 <= UINT_MAX) ” 
  &&  “ (0 <= a3) ” 
  &&  “ (a3 <= UINT_MAX) ” 
  &&  “ (0 <= b0) ” 
  &&  “ (b0 <= UINT_MAX) ” 
  &&  “ (0 <= b1) ” 
  &&  “ (b1 <= UINT_MAX) ” 
  &&  “ (0 <= b2) ” 
  &&  “ (b2 <= UINT_MAX) ” 
  &&  “ (0 <= b3) ” 
  &&  “ (b3 <= UINT_MAX) ”
  &&  ((&(( &( "r" ) )->ₛ "s3")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UInt  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UInt  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UInt  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UInt  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UInt  |-> a3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UInt  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UInt  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UInt  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UInt  |-> b3)
.

Definition vaddq_u32_partial_solve_wit_2 := vaddq_u32_partial_solve_wit_2_pure -> vaddq_u32_partial_solve_wit_2_aux.

Definition vaddq_u32_partial_solve_wit_3_pure := 
forall (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (rs_add_u32 (a1) (b1)))) (PreH2 : (0 <= retval_2)) (PreH3 : (retval_2 <= UINT_MAX)) (PreH4 : (retval = (rs_add_u32 (a0) (b0)))) (PreH5 : (0 <= retval)) (PreH6 : (retval <= UINT_MAX)) (PreH7 : (0 <= a0)) (PreH8 : (a0 <= UINT_MAX)) (PreH9 : (0 <= a1)) (PreH10 : (a1 <= UINT_MAX)) (PreH11 : (0 <= a2)) (PreH12 : (a2 <= UINT_MAX)) (PreH13 : (0 <= a3)) (PreH14 : (a3 <= UINT_MAX)) (PreH15 : (0 <= b0)) (PreH16 : (b0 <= UINT_MAX)) (PreH17 : (0 <= b1)) (PreH18 : (b1 <= UINT_MAX)) (PreH19 : (0 <= b2)) (PreH20 : (b2 <= UINT_MAX)) (PreH21 : (0 <= b3)) (PreH22 : (b3 <= UINT_MAX)) ,
  ((&(( &( "r" ) )->ₛ "s3")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UInt  |-> retval)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # UInt  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UInt  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UInt  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UInt  |-> a3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UInt  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UInt  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UInt  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UInt  |-> b3)
|--
  “ (0 <= a2) ” 
  &&  “ (a2 <= UINT_MAX) ” 
  &&  “ (0 <= b2) ” 
  &&  “ (b2 <= UINT_MAX) ”
.

Definition vaddq_u32_partial_solve_wit_3_aux := 
forall (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (rs_add_u32 (a1) (b1)))) (PreH2 : (0 <= retval_2)) (PreH3 : (retval_2 <= UINT_MAX)) (PreH4 : (retval = (rs_add_u32 (a0) (b0)))) (PreH5 : (0 <= retval)) (PreH6 : (retval <= UINT_MAX)) (PreH7 : (0 <= a0)) (PreH8 : (a0 <= UINT_MAX)) (PreH9 : (0 <= a1)) (PreH10 : (a1 <= UINT_MAX)) (PreH11 : (0 <= a2)) (PreH12 : (a2 <= UINT_MAX)) (PreH13 : (0 <= a3)) (PreH14 : (a3 <= UINT_MAX)) (PreH15 : (0 <= b0)) (PreH16 : (b0 <= UINT_MAX)) (PreH17 : (0 <= b1)) (PreH18 : (b1 <= UINT_MAX)) (PreH19 : (0 <= b2)) (PreH20 : (b2 <= UINT_MAX)) (PreH21 : (0 <= b3)) (PreH22 : (b3 <= UINT_MAX)) ,
  ((&(( &( "r" ) )->ₛ "s3")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UInt  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UInt  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UInt  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UInt  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UInt  |-> a3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UInt  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UInt  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UInt  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UInt  |-> b3)
|--
  “ (0 <= a2) ” 
  &&  “ (a2 <= UINT_MAX) ” 
  &&  “ (0 <= b2) ” 
  &&  “ (b2 <= UINT_MAX) ” 
  &&  “ (retval_2 = (rs_add_u32 (a1) (b1))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= UINT_MAX) ” 
  &&  “ (retval = (rs_add_u32 (a0) (b0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= UINT_MAX) ” 
  &&  “ (0 <= a0) ” 
  &&  “ (a0 <= UINT_MAX) ” 
  &&  “ (0 <= a1) ” 
  &&  “ (a1 <= UINT_MAX) ” 
  &&  “ (0 <= a2) ” 
  &&  “ (a2 <= UINT_MAX) ” 
  &&  “ (0 <= a3) ” 
  &&  “ (a3 <= UINT_MAX) ” 
  &&  “ (0 <= b0) ” 
  &&  “ (b0 <= UINT_MAX) ” 
  &&  “ (0 <= b1) ” 
  &&  “ (b1 <= UINT_MAX) ” 
  &&  “ (0 <= b2) ” 
  &&  “ (b2 <= UINT_MAX) ” 
  &&  “ (0 <= b3) ” 
  &&  “ (b3 <= UINT_MAX) ”
  &&  ((&(( &( "r" ) )->ₛ "s3")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UInt  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UInt  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UInt  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UInt  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UInt  |-> a3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UInt  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UInt  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UInt  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UInt  |-> b3)
.

Definition vaddq_u32_partial_solve_wit_3 := vaddq_u32_partial_solve_wit_3_pure -> vaddq_u32_partial_solve_wit_3_aux.

Definition vaddq_u32_partial_solve_wit_4_pure := 
forall (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = (rs_add_u32 (a2) (b2)))) (PreH2 : (0 <= retval_3)) (PreH3 : (retval_3 <= UINT_MAX)) (PreH4 : (retval_2 = (rs_add_u32 (a1) (b1)))) (PreH5 : (0 <= retval_2)) (PreH6 : (retval_2 <= UINT_MAX)) (PreH7 : (retval = (rs_add_u32 (a0) (b0)))) (PreH8 : (0 <= retval)) (PreH9 : (retval <= UINT_MAX)) (PreH10 : (0 <= a0)) (PreH11 : (a0 <= UINT_MAX)) (PreH12 : (0 <= a1)) (PreH13 : (a1 <= UINT_MAX)) (PreH14 : (0 <= a2)) (PreH15 : (a2 <= UINT_MAX)) (PreH16 : (0 <= a3)) (PreH17 : (a3 <= UINT_MAX)) (PreH18 : (0 <= b0)) (PreH19 : (b0 <= UINT_MAX)) (PreH20 : (0 <= b1)) (PreH21 : (b1 <= UINT_MAX)) (PreH22 : (0 <= b2)) (PreH23 : (b2 <= UINT_MAX)) (PreH24 : (0 <= b3)) (PreH25 : (b3 <= UINT_MAX)) ,
  ((&(( &( "r" ) )->ₛ "s3")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UInt  |-> retval)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # UInt  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UInt  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UInt  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UInt  |-> a3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UInt  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UInt  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UInt  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UInt  |-> b3)
|--
  “ (0 <= a3) ” 
  &&  “ (a3 <= UINT_MAX) ” 
  &&  “ (0 <= b3) ” 
  &&  “ (b3 <= UINT_MAX) ”
.

Definition vaddq_u32_partial_solve_wit_4_aux := 
forall (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = (rs_add_u32 (a2) (b2)))) (PreH2 : (0 <= retval_3)) (PreH3 : (retval_3 <= UINT_MAX)) (PreH4 : (retval_2 = (rs_add_u32 (a1) (b1)))) (PreH5 : (0 <= retval_2)) (PreH6 : (retval_2 <= UINT_MAX)) (PreH7 : (retval = (rs_add_u32 (a0) (b0)))) (PreH8 : (0 <= retval)) (PreH9 : (retval <= UINT_MAX)) (PreH10 : (0 <= a0)) (PreH11 : (a0 <= UINT_MAX)) (PreH12 : (0 <= a1)) (PreH13 : (a1 <= UINT_MAX)) (PreH14 : (0 <= a2)) (PreH15 : (a2 <= UINT_MAX)) (PreH16 : (0 <= a3)) (PreH17 : (a3 <= UINT_MAX)) (PreH18 : (0 <= b0)) (PreH19 : (b0 <= UINT_MAX)) (PreH20 : (0 <= b1)) (PreH21 : (b1 <= UINT_MAX)) (PreH22 : (0 <= b2)) (PreH23 : (b2 <= UINT_MAX)) (PreH24 : (0 <= b3)) (PreH25 : (b3 <= UINT_MAX)) ,
  ((&(( &( "r" ) )->ₛ "s3")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UInt  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UInt  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UInt  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UInt  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UInt  |-> a3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UInt  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UInt  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UInt  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UInt  |-> b3)
|--
  “ (0 <= a3) ” 
  &&  “ (a3 <= UINT_MAX) ” 
  &&  “ (0 <= b3) ” 
  &&  “ (b3 <= UINT_MAX) ” 
  &&  “ (retval_3 = (rs_add_u32 (a2) (b2))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= UINT_MAX) ” 
  &&  “ (retval_2 = (rs_add_u32 (a1) (b1))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= UINT_MAX) ” 
  &&  “ (retval = (rs_add_u32 (a0) (b0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= UINT_MAX) ” 
  &&  “ (0 <= a0) ” 
  &&  “ (a0 <= UINT_MAX) ” 
  &&  “ (0 <= a1) ” 
  &&  “ (a1 <= UINT_MAX) ” 
  &&  “ (0 <= a2) ” 
  &&  “ (a2 <= UINT_MAX) ” 
  &&  “ (0 <= a3) ” 
  &&  “ (a3 <= UINT_MAX) ” 
  &&  “ (0 <= b0) ” 
  &&  “ (b0 <= UINT_MAX) ” 
  &&  “ (0 <= b1) ” 
  &&  “ (b1 <= UINT_MAX) ” 
  &&  “ (0 <= b2) ” 
  &&  “ (b2 <= UINT_MAX) ” 
  &&  “ (0 <= b3) ” 
  &&  “ (b3 <= UINT_MAX) ”
  &&  ((&(( &( "r" ) )->ₛ "s3")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UInt  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UInt  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UInt  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UInt  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UInt  |-> a3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UInt  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UInt  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UInt  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UInt  |-> b3)
.

Definition vaddq_u32_partial_solve_wit_4 := vaddq_u32_partial_solve_wit_4_pure -> vaddq_u32_partial_solve_wit_4_aux.

Definition vaddq_u32_partial_solve_wit_5 := 
forall (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (record_return: Z) (PreH1 : (retval_4 = (rs_add_u32 (a3) (b3)))) (PreH2 : (0 <= retval_4)) (PreH3 : (retval_4 <= UINT_MAX)) (PreH4 : (retval_3 = (rs_add_u32 (a2) (b2)))) (PreH5 : (0 <= retval_3)) (PreH6 : (retval_3 <= UINT_MAX)) (PreH7 : (retval_2 = (rs_add_u32 (a1) (b1)))) (PreH8 : (0 <= retval_2)) (PreH9 : (retval_2 <= UINT_MAX)) (PreH10 : (retval = (rs_add_u32 (a0) (b0)))) (PreH11 : (0 <= retval)) (PreH12 : (retval <= UINT_MAX)) (PreH13 : (0 <= a0)) (PreH14 : (a0 <= UINT_MAX)) (PreH15 : (0 <= a1)) (PreH16 : (a1 <= UINT_MAX)) (PreH17 : (0 <= a2)) (PreH18 : (a2 <= UINT_MAX)) (PreH19 : (0 <= a3)) (PreH20 : (a3 <= UINT_MAX)) (PreH21 : (0 <= b0)) (PreH22 : (b0 <= UINT_MAX)) (PreH23 : (0 <= b1)) (PreH24 : (b1 <= UINT_MAX)) (PreH25 : (0 <= b2)) (PreH26 : (b2 <= UINT_MAX)) (PreH27 : (0 <= b3)) (PreH28 : (b3 <= UINT_MAX)) ,
  (UndefStructPreduint32x4_t record_return )
  **  ((&(( &( "r" ) )->ₛ "s3")) # UInt  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UInt  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UInt  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UInt  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UInt  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UInt  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UInt  |-> a3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UInt  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UInt  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UInt  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UInt  |-> b3)
|--
  “ (retval_4 = (rs_add_u32 (a3) (b3))) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= UINT_MAX) ” 
  &&  “ (retval_3 = (rs_add_u32 (a2) (b2))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= UINT_MAX) ” 
  &&  “ (retval_2 = (rs_add_u32 (a1) (b1))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= UINT_MAX) ” 
  &&  “ (retval = (rs_add_u32 (a0) (b0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= UINT_MAX) ” 
  &&  “ (0 <= a0) ” 
  &&  “ (a0 <= UINT_MAX) ” 
  &&  “ (0 <= a1) ” 
  &&  “ (a1 <= UINT_MAX) ” 
  &&  “ (0 <= a2) ” 
  &&  “ (a2 <= UINT_MAX) ” 
  &&  “ (0 <= a3) ” 
  &&  “ (a3 <= UINT_MAX) ” 
  &&  “ (0 <= b0) ” 
  &&  “ (b0 <= UINT_MAX) ” 
  &&  “ (0 <= b1) ” 
  &&  “ (b1 <= UINT_MAX) ” 
  &&  “ (0 <= b2) ” 
  &&  “ (b2 <= UINT_MAX) ” 
  &&  “ (0 <= b3) ” 
  &&  “ (b3 <= UINT_MAX) ”
  &&  ((&((record_return)  # "uint32x4_t" ->ₛ "s3")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # UInt  |-> retval_4)
  **  ((&((record_return)  # "uint32x4_t" ->ₛ "s2")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # UInt  |-> retval_3)
  **  ((&((record_return)  # "uint32x4_t" ->ₛ "s1")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UInt  |-> retval_2)
  **  ((&((record_return)  # "uint32x4_t" ->ₛ "s0")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UInt  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UInt  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UInt  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # UInt  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # UInt  |-> a3)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UInt  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UInt  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UInt  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UInt  |-> b3)
.

Module Type VC_Correct.


Axiom proof_of_vaddq_u32_return_wit_1 : vaddq_u32_return_wit_1.
Axiom proof_of_vaddq_u32_partial_solve_wit_1_pure : vaddq_u32_partial_solve_wit_1_pure.
Axiom proof_of_vaddq_u32_partial_solve_wit_1 : vaddq_u32_partial_solve_wit_1.
Axiom proof_of_vaddq_u32_partial_solve_wit_2_pure : vaddq_u32_partial_solve_wit_2_pure.
Axiom proof_of_vaddq_u32_partial_solve_wit_2 : vaddq_u32_partial_solve_wit_2.
Axiom proof_of_vaddq_u32_partial_solve_wit_3_pure : vaddq_u32_partial_solve_wit_3_pure.
Axiom proof_of_vaddq_u32_partial_solve_wit_3 : vaddq_u32_partial_solve_wit_3.
Axiom proof_of_vaddq_u32_partial_solve_wit_4_pure : vaddq_u32_partial_solve_wit_4_pure.
Axiom proof_of_vaddq_u32_partial_solve_wit_4 : vaddq_u32_partial_solve_wit_4.
Axiom proof_of_vaddq_u32_partial_solve_wit_5 : vaddq_u32_partial_solve_wit_5.

End VC_Correct.
