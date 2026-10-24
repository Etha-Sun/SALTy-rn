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

(*----- Function rdsum_addlow2 -----*)

Definition rdsum_addlow2_return_wit_1 := 
forall (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (record_return: Z) (PreH1 : (retval_2 = (rs_add_u32 (a1) (b1)))) (PreH2 : (0 <= retval_2)) (PreH3 : (retval_2 <= UINT_MAX)) (PreH4 : (retval = (rs_add_u32 (a0) (b0)))) (PreH5 : (0 <= retval)) (PreH6 : (retval <= UINT_MAX)) (PreH7 : (0 <= a0)) (PreH8 : (a0 <= UINT_MAX)) (PreH9 : (0 <= a1)) (PreH10 : (a1 <= UINT_MAX)) (PreH11 : (0 <= b0)) (PreH12 : (b0 <= UINT_MAX)) (PreH13 : (0 <= b1)) (PreH14 : (b1 <= UINT_MAX)) (PreH15 : (0 <= b2)) (PreH16 : (b2 <= UINT_MAX)) (PreH17 : (0 <= b3)) (PreH18 : (b3 <= UINT_MAX)) ,
  ((&((record_return)  # "uint32x2_t" ->ₛ "s1")) # UInt  |-> retval_2)
  **  ((&((record_return)  # "uint32x2_t" ->ₛ "s0")) # UInt  |-> retval)
|--
  ((&((record_return)  # "uint32x2_t" ->ₛ "s0")) # UInt  |-> (rs_add_u32 (a0) (b0)))
  **  ((&((record_return)  # "uint32x2_t" ->ₛ "s1")) # UInt  |-> (rs_add_u32 (a1) (b1)))
.

Definition rdsum_addlow2_partial_solve_wit_1_pure := 
forall (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a1: Z) (a0: Z) (PreH1 : (0 <= a0)) (PreH2 : (a0 <= UINT_MAX)) (PreH3 : (0 <= a1)) (PreH4 : (a1 <= UINT_MAX)) (PreH5 : (0 <= b0)) (PreH6 : (b0 <= UINT_MAX)) (PreH7 : (0 <= b1)) (PreH8 : (b1 <= UINT_MAX)) (PreH9 : (0 <= b2)) (PreH10 : (b2 <= UINT_MAX)) (PreH11 : (0 <= b3)) (PreH12 : (b3 <= UINT_MAX)) ,
  (UndefStructPreduint32x2_t ( &( "r" ) ) )
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # UInt  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UInt  |-> a1)
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

Definition rdsum_addlow2_partial_solve_wit_1_aux := 
forall (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a1: Z) (a0: Z) (PreH1 : (0 <= a0)) (PreH2 : (a0 <= UINT_MAX)) (PreH3 : (0 <= a1)) (PreH4 : (a1 <= UINT_MAX)) (PreH5 : (0 <= b0)) (PreH6 : (b0 <= UINT_MAX)) (PreH7 : (0 <= b1)) (PreH8 : (b1 <= UINT_MAX)) (PreH9 : (0 <= b2)) (PreH10 : (b2 <= UINT_MAX)) (PreH11 : (0 <= b3)) (PreH12 : (b3 <= UINT_MAX)) ,
  (UndefStructPreduint32x2_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # UInt  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UInt  |-> a1)
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
  &&  “ (0 <= b0) ” 
  &&  “ (b0 <= UINT_MAX) ” 
  &&  “ (0 <= b1) ” 
  &&  “ (b1 <= UINT_MAX) ” 
  &&  “ (0 <= b2) ” 
  &&  “ (b2 <= UINT_MAX) ” 
  &&  “ (0 <= b3) ” 
  &&  “ (b3 <= UINT_MAX) ”
  &&  (UndefStructPreduint32x2_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # UInt  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UInt  |-> a1)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UInt  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UInt  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UInt  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UInt  |-> b3)
.

Definition rdsum_addlow2_partial_solve_wit_1 := rdsum_addlow2_partial_solve_wit_1_pure -> rdsum_addlow2_partial_solve_wit_1_aux.

Definition rdsum_addlow2_partial_solve_wit_2_pure := 
forall (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a1: Z) (a0: Z) (retval: Z) (PreH1 : (retval = (rs_add_u32 (a0) (b0)))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= UINT_MAX)) (PreH4 : (0 <= a0)) (PreH5 : (a0 <= UINT_MAX)) (PreH6 : (0 <= a1)) (PreH7 : (a1 <= UINT_MAX)) (PreH8 : (0 <= b0)) (PreH9 : (b0 <= UINT_MAX)) (PreH10 : (0 <= b1)) (PreH11 : (b1 <= UINT_MAX)) (PreH12 : (0 <= b2)) (PreH13 : (b2 <= UINT_MAX)) (PreH14 : (0 <= b3)) (PreH15 : (b3 <= UINT_MAX)) ,
  ((&(( &( "r" ) )->ₛ "s1")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UInt  |-> retval)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # UInt  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UInt  |-> a1)
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

Definition rdsum_addlow2_partial_solve_wit_2_aux := 
forall (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a1: Z) (a0: Z) (retval: Z) (PreH1 : (retval = (rs_add_u32 (a0) (b0)))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= UINT_MAX)) (PreH4 : (0 <= a0)) (PreH5 : (a0 <= UINT_MAX)) (PreH6 : (0 <= a1)) (PreH7 : (a1 <= UINT_MAX)) (PreH8 : (0 <= b0)) (PreH9 : (b0 <= UINT_MAX)) (PreH10 : (0 <= b1)) (PreH11 : (b1 <= UINT_MAX)) (PreH12 : (0 <= b2)) (PreH13 : (b2 <= UINT_MAX)) (PreH14 : (0 <= b3)) (PreH15 : (b3 <= UINT_MAX)) ,
  ((&(( &( "r" ) )->ₛ "s1")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UInt  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UInt  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UInt  |-> a1)
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
  &&  “ (0 <= b0) ” 
  &&  “ (b0 <= UINT_MAX) ” 
  &&  “ (0 <= b1) ” 
  &&  “ (b1 <= UINT_MAX) ” 
  &&  “ (0 <= b2) ” 
  &&  “ (b2 <= UINT_MAX) ” 
  &&  “ (0 <= b3) ” 
  &&  “ (b3 <= UINT_MAX) ”
  &&  ((&(( &( "r" ) )->ₛ "s1")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UInt  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UInt  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UInt  |-> a1)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UInt  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UInt  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UInt  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UInt  |-> b3)
.

Definition rdsum_addlow2_partial_solve_wit_2 := rdsum_addlow2_partial_solve_wit_2_pure -> rdsum_addlow2_partial_solve_wit_2_aux.

Definition rdsum_addlow2_partial_solve_wit_3 := 
forall (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (record_return: Z) (PreH1 : (retval_2 = (rs_add_u32 (a1) (b1)))) (PreH2 : (0 <= retval_2)) (PreH3 : (retval_2 <= UINT_MAX)) (PreH4 : (retval = (rs_add_u32 (a0) (b0)))) (PreH5 : (0 <= retval)) (PreH6 : (retval <= UINT_MAX)) (PreH7 : (0 <= a0)) (PreH8 : (a0 <= UINT_MAX)) (PreH9 : (0 <= a1)) (PreH10 : (a1 <= UINT_MAX)) (PreH11 : (0 <= b0)) (PreH12 : (b0 <= UINT_MAX)) (PreH13 : (0 <= b1)) (PreH14 : (b1 <= UINT_MAX)) (PreH15 : (0 <= b2)) (PreH16 : (b2 <= UINT_MAX)) (PreH17 : (0 <= b3)) (PreH18 : (b3 <= UINT_MAX)) ,
  (UndefStructPreduint32x2_t record_return )
  **  ((&(( &( "r" ) )->ₛ "s1")) # UInt  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UInt  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UInt  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UInt  |-> a1)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UInt  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UInt  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UInt  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UInt  |-> b3)
|--
  “ (retval_2 = (rs_add_u32 (a1) (b1))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= UINT_MAX) ” 
  &&  “ (retval = (rs_add_u32 (a0) (b0))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= UINT_MAX) ” 
  &&  “ (0 <= a0) ” 
  &&  “ (a0 <= UINT_MAX) ” 
  &&  “ (0 <= a1) ” 
  &&  “ (a1 <= UINT_MAX) ” 
  &&  “ (0 <= b0) ” 
  &&  “ (b0 <= UINT_MAX) ” 
  &&  “ (0 <= b1) ” 
  &&  “ (b1 <= UINT_MAX) ” 
  &&  “ (0 <= b2) ” 
  &&  “ (b2 <= UINT_MAX) ” 
  &&  “ (0 <= b3) ” 
  &&  “ (b3 <= UINT_MAX) ”
  &&  ((&((record_return)  # "uint32x2_t" ->ₛ "s1")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # UInt  |-> retval_2)
  **  ((&((record_return)  # "uint32x2_t" ->ₛ "s0")) # UInt  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # UInt  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # UInt  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # UInt  |-> a1)
  **  ((&(( &( "b" ) )->ₛ "s0")) # UInt  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # UInt  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # UInt  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # UInt  |-> b3)
.

Module Type VC_Correct.


Axiom proof_of_rdsum_addlow2_return_wit_1 : rdsum_addlow2_return_wit_1.
Axiom proof_of_rdsum_addlow2_partial_solve_wit_1_pure : rdsum_addlow2_partial_solve_wit_1_pure.
Axiom proof_of_rdsum_addlow2_partial_solve_wit_1 : rdsum_addlow2_partial_solve_wit_1.
Axiom proof_of_rdsum_addlow2_partial_solve_wit_2_pure : rdsum_addlow2_partial_solve_wit_2_pure.
Axiom proof_of_rdsum_addlow2_partial_solve_wit_2 : rdsum_addlow2_partial_solve_wit_2.
Axiom proof_of_rdsum_addlow2_partial_solve_wit_3 : rdsum_addlow2_partial_solve_wit_3.

End VC_Correct.
