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
Require Import Qs8Rdsum.Model.
Require Import Qs8Rdsum.Types.
Require Import Qs8Rdsum.VectorModel.
Local Open Scope sac.

(*----- Function rdsum_addlow2 -----*)

Definition rdsum_addlow2_return_wit_1 := 
forall (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (record_return: Z) (PreH1 : (retval_2 = (rs_add_s32 (a1) (b1)))) (PreH2 : ((INT_MIN) <= retval_2)) (PreH3 : (retval_2 <= INT_MAX)) (PreH4 : (retval = (rs_add_s32 (a0) (b0)))) (PreH5 : ((INT_MIN) <= retval)) (PreH6 : (retval <= INT_MAX)) (PreH7 : ((INT_MIN) <= a0)) (PreH8 : (a0 <= INT_MAX)) (PreH9 : ((INT_MIN) <= a1)) (PreH10 : (a1 <= INT_MAX)) (PreH11 : ((INT_MIN) <= b0)) (PreH12 : (b0 <= INT_MAX)) (PreH13 : ((INT_MIN) <= b1)) (PreH14 : (b1 <= INT_MAX)) (PreH15 : ((INT_MIN) <= b2)) (PreH16 : (b2 <= INT_MAX)) (PreH17 : ((INT_MIN) <= b3)) (PreH18 : (b3 <= INT_MAX)) ,
  ((&((record_return)  # "int32x2_t" ->ₛ "s1")) # Int  |-> retval_2)
  **  ((&((record_return)  # "int32x2_t" ->ₛ "s0")) # Int  |-> retval)
|--
  ((&((record_return)  # "int32x2_t" ->ₛ "s0")) # Int  |-> (rs_add_s32 (a0) (b0)))
  **  ((&((record_return)  # "int32x2_t" ->ₛ "s1")) # Int  |-> (rs_add_s32 (a1) (b1)))
.

Definition rdsum_addlow2_partial_solve_wit_1_pure := 
forall (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a1: Z) (a0: Z) (PreH1 : ((INT_MIN) <= a0)) (PreH2 : (a0 <= INT_MAX)) (PreH3 : ((INT_MIN) <= a1)) (PreH4 : (a1 <= INT_MAX)) (PreH5 : ((INT_MIN) <= b0)) (PreH6 : (b0 <= INT_MAX)) (PreH7 : ((INT_MIN) <= b1)) (PreH8 : (b1 <= INT_MAX)) (PreH9 : ((INT_MIN) <= b2)) (PreH10 : (b2 <= INT_MAX)) (PreH11 : ((INT_MIN) <= b3)) (PreH12 : (b3 <= INT_MAX)) ,
  (UndefStructPredint32x2_t ( &( "r" ) ) )
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Int  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Int  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Int  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Int  |-> b3)
|--
  “ ((INT_MIN) <= a0) ” 
  &&  “ (a0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b0) ” 
  &&  “ (b0 <= INT_MAX) ”
.

Definition rdsum_addlow2_partial_solve_wit_1_aux := 
forall (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a1: Z) (a0: Z) (PreH1 : ((INT_MIN) <= a0)) (PreH2 : (a0 <= INT_MAX)) (PreH3 : ((INT_MIN) <= a1)) (PreH4 : (a1 <= INT_MAX)) (PreH5 : ((INT_MIN) <= b0)) (PreH6 : (b0 <= INT_MAX)) (PreH7 : ((INT_MIN) <= b1)) (PreH8 : (b1 <= INT_MAX)) (PreH9 : ((INT_MIN) <= b2)) (PreH10 : (b2 <= INT_MAX)) (PreH11 : ((INT_MIN) <= b3)) (PreH12 : (b3 <= INT_MAX)) ,
  (UndefStructPredint32x2_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Int  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Int  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Int  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Int  |-> b3)
|--
  “ ((INT_MIN) <= a0) ” 
  &&  “ (a0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b0) ” 
  &&  “ (b0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a0) ” 
  &&  “ (a0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a1) ” 
  &&  “ (a1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b0) ” 
  &&  “ (b0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b1) ” 
  &&  “ (b1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b2) ” 
  &&  “ (b2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b3) ” 
  &&  “ (b3 <= INT_MAX) ”
  &&  (UndefStructPredint32x2_t ( &( "r" ) ) )
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Int  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Int  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Int  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Int  |-> b3)
.

Definition rdsum_addlow2_partial_solve_wit_1 := rdsum_addlow2_partial_solve_wit_1_pure -> rdsum_addlow2_partial_solve_wit_1_aux.

Definition rdsum_addlow2_partial_solve_wit_2_pure := 
forall (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a1: Z) (a0: Z) (retval: Z) (PreH1 : (retval = (rs_add_s32 (a0) (b0)))) (PreH2 : ((INT_MIN) <= retval)) (PreH3 : (retval <= INT_MAX)) (PreH4 : ((INT_MIN) <= a0)) (PreH5 : (a0 <= INT_MAX)) (PreH6 : ((INT_MIN) <= a1)) (PreH7 : (a1 <= INT_MAX)) (PreH8 : ((INT_MIN) <= b0)) (PreH9 : (b0 <= INT_MAX)) (PreH10 : ((INT_MIN) <= b1)) (PreH11 : (b1 <= INT_MAX)) (PreH12 : ((INT_MIN) <= b2)) (PreH13 : (b2 <= INT_MAX)) (PreH14 : ((INT_MIN) <= b3)) (PreH15 : (b3 <= INT_MAX)) ,
  ((&(( &( "r" ) )->ₛ "s1")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Int  |-> retval)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((( &( "b" ) )) # Ptr  |-> ( &( "b" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Int  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Int  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Int  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Int  |-> b3)
|--
  “ ((INT_MIN) <= a1) ” 
  &&  “ (a1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b1) ” 
  &&  “ (b1 <= INT_MAX) ”
.

Definition rdsum_addlow2_partial_solve_wit_2_aux := 
forall (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a1: Z) (a0: Z) (retval: Z) (PreH1 : (retval = (rs_add_s32 (a0) (b0)))) (PreH2 : ((INT_MIN) <= retval)) (PreH3 : (retval <= INT_MAX)) (PreH4 : ((INT_MIN) <= a0)) (PreH5 : (a0 <= INT_MAX)) (PreH6 : ((INT_MIN) <= a1)) (PreH7 : (a1 <= INT_MAX)) (PreH8 : ((INT_MIN) <= b0)) (PreH9 : (b0 <= INT_MAX)) (PreH10 : ((INT_MIN) <= b1)) (PreH11 : (b1 <= INT_MAX)) (PreH12 : ((INT_MIN) <= b2)) (PreH13 : (b2 <= INT_MAX)) (PreH14 : ((INT_MIN) <= b3)) (PreH15 : (b3 <= INT_MAX)) ,
  ((&(( &( "r" ) )->ₛ "s1")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Int  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Int  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Int  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Int  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Int  |-> b3)
|--
  “ ((INT_MIN) <= a1) ” 
  &&  “ (a1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b1) ” 
  &&  “ (b1 <= INT_MAX) ” 
  &&  “ (retval = (rs_add_s32 (a0) (b0))) ” 
  &&  “ ((INT_MIN) <= retval) ” 
  &&  “ (retval <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a0) ” 
  &&  “ (a0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a1) ” 
  &&  “ (a1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b0) ” 
  &&  “ (b0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b1) ” 
  &&  “ (b1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b2) ” 
  &&  “ (b2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b3) ” 
  &&  “ (b3 <= INT_MAX) ”
  &&  ((&(( &( "r" ) )->ₛ "s1")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Int  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Int  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Int  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Int  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Int  |-> b3)
.

Definition rdsum_addlow2_partial_solve_wit_2 := rdsum_addlow2_partial_solve_wit_2_pure -> rdsum_addlow2_partial_solve_wit_2_aux.

Definition rdsum_addlow2_partial_solve_wit_3 := 
forall (b3: Z) (b2: Z) (b1: Z) (b0: Z) (a1: Z) (a0: Z) (retval: Z) (retval_2: Z) (record_return: Z) (PreH1 : (retval_2 = (rs_add_s32 (a1) (b1)))) (PreH2 : ((INT_MIN) <= retval_2)) (PreH3 : (retval_2 <= INT_MAX)) (PreH4 : (retval = (rs_add_s32 (a0) (b0)))) (PreH5 : ((INT_MIN) <= retval)) (PreH6 : (retval <= INT_MAX)) (PreH7 : ((INT_MIN) <= a0)) (PreH8 : (a0 <= INT_MAX)) (PreH9 : ((INT_MIN) <= a1)) (PreH10 : (a1 <= INT_MAX)) (PreH11 : ((INT_MIN) <= b0)) (PreH12 : (b0 <= INT_MAX)) (PreH13 : ((INT_MIN) <= b1)) (PreH14 : (b1 <= INT_MAX)) (PreH15 : ((INT_MIN) <= b2)) (PreH16 : (b2 <= INT_MAX)) (PreH17 : ((INT_MIN) <= b3)) (PreH18 : (b3 <= INT_MAX)) ,
  (UndefStructPredint32x2_t record_return )
  **  ((&(( &( "r" ) )->ₛ "s1")) # Int  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Int  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Int  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Int  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Int  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Int  |-> b3)
|--
  “ (retval_2 = (rs_add_s32 (a1) (b1))) ” 
  &&  “ ((INT_MIN) <= retval_2) ” 
  &&  “ (retval_2 <= INT_MAX) ” 
  &&  “ (retval = (rs_add_s32 (a0) (b0))) ” 
  &&  “ ((INT_MIN) <= retval) ” 
  &&  “ (retval <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a0) ” 
  &&  “ (a0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a1) ” 
  &&  “ (a1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b0) ” 
  &&  “ (b0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b1) ” 
  &&  “ (b1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b2) ” 
  &&  “ (b2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b3) ” 
  &&  “ (b3 <= INT_MAX) ”
  &&  ((&((record_return)  # "int32x2_t" ->ₛ "s1")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Int  |-> retval_2)
  **  ((&((record_return)  # "int32x2_t" ->ₛ "s0")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Int  |-> retval)
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "b" ) )->ₛ "s0")) # Int  |-> b0)
  **  ((&(( &( "b" ) )->ₛ "s1")) # Int  |-> b1)
  **  ((&(( &( "b" ) )->ₛ "s2")) # Int  |-> b2)
  **  ((&(( &( "b" ) )->ₛ "s3")) # Int  |-> b3)
.

Module Type VC_Correct.


Axiom proof_of_rdsum_addlow2_return_wit_1 : rdsum_addlow2_return_wit_1.
Axiom proof_of_rdsum_addlow2_partial_solve_wit_1_pure : rdsum_addlow2_partial_solve_wit_1_pure.
Axiom proof_of_rdsum_addlow2_partial_solve_wit_1 : rdsum_addlow2_partial_solve_wit_1.
Axiom proof_of_rdsum_addlow2_partial_solve_wit_2_pure : rdsum_addlow2_partial_solve_wit_2_pure.
Axiom proof_of_rdsum_addlow2_partial_solve_wit_2 : rdsum_addlow2_partial_solve_wit_2.
Axiom proof_of_rdsum_addlow2_partial_solve_wit_3 : rdsum_addlow2_partial_solve_wit_3.

End VC_Correct.
