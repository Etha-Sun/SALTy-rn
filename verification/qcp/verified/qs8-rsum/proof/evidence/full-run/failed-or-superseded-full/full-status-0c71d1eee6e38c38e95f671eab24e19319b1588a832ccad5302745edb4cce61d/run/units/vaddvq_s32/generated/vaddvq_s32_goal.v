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
Require Import Qs8Rsum.Model.
Require Import Qs8Rsum.Types.
Require Import Qs8Rsum.VectorModel.
Local Open Scope sac.

(*----- Function vaddvq_s32 -----*)

Definition vaddvq_s32_safety_wit_1 := 
forall (a3: Z) (a2: Z) (a1: Z) (a0: Z) (PreH1 : ((INT_MIN) <= a0)) (PreH2 : (a0 <= INT_MAX)) (PreH3 : ((INT_MIN) <= a1)) (PreH4 : (a1 <= INT_MAX)) (PreH5 : ((INT_MIN) <= a2)) (PreH6 : (a2 <= INT_MAX)) (PreH7 : ((INT_MIN) <= a3)) (PreH8 : (a3 <= INT_MAX)) ,
  ((( &( "r" ) )) # Int  |->_)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition vaddvq_s32_return_wit_1 := 
(
forall (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval: Z) (PreH1 : (retval = (rs_add_s32 (retval_4) (a3)))) (PreH2 : ((INT_MIN) <= retval)) (PreH3 : (retval <= INT_MAX)) (PreH4 : (retval_4 = (rs_add_s32 (retval_3) (a2)))) (PreH5 : ((INT_MIN) <= retval_4)) (PreH6 : (retval_4 <= INT_MAX)) (PreH7 : (retval_3 = (rs_add_s32 (retval_2) (a1)))) (PreH8 : ((INT_MIN) <= retval_3)) (PreH9 : (retval_3 <= INT_MAX)) (PreH10 : (retval_2 = (rs_add_s32 (0) (a0)))) (PreH11 : ((INT_MIN) <= retval_2)) (PreH12 : (retval_2 <= INT_MAX)) (PreH13 : ((INT_MIN) <= a0)) (PreH14 : (a0 <= INT_MAX)) (PreH15 : ((INT_MIN) <= a1)) (PreH16 : (a1 <= INT_MAX)) (PreH17 : ((INT_MIN) <= a2)) (PreH18 : (a2 <= INT_MAX)) (PreH19 : ((INT_MIN) <= a3)) (PreH20 : (a3 <= INT_MAX)) ,
  TT && emp 
|--
  “ (retval = (rs_add_s32 ((rs_add_s32 ((rs_add_s32 ((rs_add_s32 (0) (a0))) (a1))) (a2))) (a3))) ”
  &&  emp
) \/
(
forall (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval: Z) (PreH1 : (retval = (rs_add_s32 (retval_4) (a3)))) (PreH2 : ((INT_MIN) <= retval)) (PreH3 : (retval <= INT_MAX)) (PreH4 : (retval_4 = (rs_add_s32 (retval_3) (a2)))) (PreH5 : ((INT_MIN) <= retval_4)) (PreH6 : (retval_4 <= INT_MAX)) (PreH7 : (retval_3 = (rs_add_s32 (retval_2) (a1)))) (PreH8 : ((INT_MIN) <= retval_3)) (PreH9 : (retval_3 <= INT_MAX)) (PreH10 : (retval_2 = (rs_add_s32 (0) (a0)))) (PreH11 : ((INT_MIN) <= retval_2)) (PreH12 : (retval_2 <= INT_MAX)) (PreH13 : ((INT_MIN) <= a0)) (PreH14 : (a0 <= INT_MAX)) (PreH15 : ((INT_MIN) <= a1)) (PreH16 : (a1 <= INT_MAX)) (PreH17 : ((INT_MIN) <= a2)) (PreH18 : (a2 <= INT_MAX)) (PreH19 : ((INT_MIN) <= a3)) (PreH20 : (a3 <= INT_MAX)) ,
  TT && emp 
|--
  “ (retval = (rs_add_s32 ((rs_add_s32 ((rs_add_s32 (retval_2) (a1))) (a2))) (a3))) ”
  &&  emp
).

Definition vaddvq_s32_return_wit_1_split_goal_1 := 
forall (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval: Z) (PreH1 : (retval = (rs_add_s32 (retval_4) (a3)))) (PreH2 : ((INT_MIN) <= retval)) (PreH3 : (retval <= INT_MAX)) (PreH4 : (retval_4 = (rs_add_s32 (retval_3) (a2)))) (PreH5 : ((INT_MIN) <= retval_4)) (PreH6 : (retval_4 <= INT_MAX)) (PreH7 : (retval_3 = (rs_add_s32 (retval_2) (a1)))) (PreH8 : ((INT_MIN) <= retval_3)) (PreH9 : (retval_3 <= INT_MAX)) (PreH10 : (retval_2 = (rs_add_s32 (0) (a0)))) (PreH11 : ((INT_MIN) <= retval_2)) (PreH12 : (retval_2 <= INT_MAX)) (PreH13 : ((INT_MIN) <= a0)) (PreH14 : (a0 <= INT_MAX)) (PreH15 : ((INT_MIN) <= a1)) (PreH16 : (a1 <= INT_MAX)) (PreH17 : ((INT_MIN) <= a2)) (PreH18 : (a2 <= INT_MAX)) (PreH19 : ((INT_MIN) <= a3)) (PreH20 : (a3 <= INT_MAX)) ,
  (retval = (rs_add_s32 ((rs_add_s32 ((rs_add_s32 (retval_2) (a1))) (a2))) (a3)))
.

Definition vaddvq_s32_partial_solve_wit_1_pure := 
forall (a3: Z) (a2: Z) (a1: Z) (a0: Z) (PreH1 : ((INT_MIN) <= a0)) (PreH2 : (a0 <= INT_MAX)) (PreH3 : ((INT_MIN) <= a1)) (PreH4 : (a1 <= INT_MAX)) (PreH5 : ((INT_MIN) <= a2)) (PreH6 : (a2 <= INT_MAX)) (PreH7 : ((INT_MIN) <= a3)) (PreH8 : (a3 <= INT_MAX)) ,
  ((( &( "r" ) )) # Int  |-> 0)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
|--
  “ ((INT_MIN) <= 0) ” 
  &&  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a0) ” 
  &&  “ (a0 <= INT_MAX) ”
.

Definition vaddvq_s32_partial_solve_wit_1_aux := 
forall (a3: Z) (a2: Z) (a1: Z) (a0: Z) (PreH1 : ((INT_MIN) <= a0)) (PreH2 : (a0 <= INT_MAX)) (PreH3 : ((INT_MIN) <= a1)) (PreH4 : (a1 <= INT_MAX)) (PreH5 : ((INT_MIN) <= a2)) (PreH6 : (a2 <= INT_MAX)) (PreH7 : ((INT_MIN) <= a3)) (PreH8 : (a3 <= INT_MAX)) ,
  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
|--
  “ ((INT_MIN) <= 0) ” 
  &&  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a0) ” 
  &&  “ (a0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a0) ” 
  &&  “ (a0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a1) ” 
  &&  “ (a1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a2) ” 
  &&  “ (a2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a3) ” 
  &&  “ (a3 <= INT_MAX) ”
  &&  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
.

Definition vaddvq_s32_partial_solve_wit_1 := vaddvq_s32_partial_solve_wit_1_pure -> vaddvq_s32_partial_solve_wit_1_aux.

Definition vaddvq_s32_partial_solve_wit_2_pure := 
forall (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (PreH1 : (retval = (rs_add_s32 (0) (a0)))) (PreH2 : ((INT_MIN) <= retval)) (PreH3 : (retval <= INT_MAX)) (PreH4 : ((INT_MIN) <= a0)) (PreH5 : (a0 <= INT_MAX)) (PreH6 : ((INT_MIN) <= a1)) (PreH7 : (a1 <= INT_MAX)) (PreH8 : ((INT_MIN) <= a2)) (PreH9 : (a2 <= INT_MAX)) (PreH10 : ((INT_MIN) <= a3)) (PreH11 : (a3 <= INT_MAX)) ,
  ((( &( "r" ) )) # Int  |-> retval)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
|--
  “ ((INT_MIN) <= retval) ” 
  &&  “ (retval <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a1) ” 
  &&  “ (a1 <= INT_MAX) ”
.

Definition vaddvq_s32_partial_solve_wit_2_aux := 
forall (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval: Z) (PreH1 : (retval = (rs_add_s32 (0) (a0)))) (PreH2 : ((INT_MIN) <= retval)) (PreH3 : (retval <= INT_MAX)) (PreH4 : ((INT_MIN) <= a0)) (PreH5 : (a0 <= INT_MAX)) (PreH6 : ((INT_MIN) <= a1)) (PreH7 : (a1 <= INT_MAX)) (PreH8 : ((INT_MIN) <= a2)) (PreH9 : (a2 <= INT_MAX)) (PreH10 : ((INT_MIN) <= a3)) (PreH11 : (a3 <= INT_MAX)) ,
  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
|--
  “ ((INT_MIN) <= retval) ” 
  &&  “ (retval <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a1) ” 
  &&  “ (a1 <= INT_MAX) ” 
  &&  “ (retval = (rs_add_s32 (0) (a0))) ” 
  &&  “ ((INT_MIN) <= retval) ” 
  &&  “ (retval <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a0) ” 
  &&  “ (a0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a1) ” 
  &&  “ (a1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a2) ” 
  &&  “ (a2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a3) ” 
  &&  “ (a3 <= INT_MAX) ”
  &&  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
.

Definition vaddvq_s32_partial_solve_wit_2 := vaddvq_s32_partial_solve_wit_2_pure -> vaddvq_s32_partial_solve_wit_2_aux.

Definition vaddvq_s32_partial_solve_wit_3_pure := 
forall (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval_2: Z) (retval: Z) (PreH1 : (retval = (rs_add_s32 (retval_2) (a1)))) (PreH2 : ((INT_MIN) <= retval)) (PreH3 : (retval <= INT_MAX)) (PreH4 : (retval_2 = (rs_add_s32 (0) (a0)))) (PreH5 : ((INT_MIN) <= retval_2)) (PreH6 : (retval_2 <= INT_MAX)) (PreH7 : ((INT_MIN) <= a0)) (PreH8 : (a0 <= INT_MAX)) (PreH9 : ((INT_MIN) <= a1)) (PreH10 : (a1 <= INT_MAX)) (PreH11 : ((INT_MIN) <= a2)) (PreH12 : (a2 <= INT_MAX)) (PreH13 : ((INT_MIN) <= a3)) (PreH14 : (a3 <= INT_MAX)) ,
  ((( &( "r" ) )) # Int  |-> retval)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
|--
  “ ((INT_MIN) <= retval) ” 
  &&  “ (retval <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a2) ” 
  &&  “ (a2 <= INT_MAX) ”
.

Definition vaddvq_s32_partial_solve_wit_3_aux := 
forall (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval_2: Z) (retval: Z) (PreH1 : (retval = (rs_add_s32 (retval_2) (a1)))) (PreH2 : ((INT_MIN) <= retval)) (PreH3 : (retval <= INT_MAX)) (PreH4 : (retval_2 = (rs_add_s32 (0) (a0)))) (PreH5 : ((INT_MIN) <= retval_2)) (PreH6 : (retval_2 <= INT_MAX)) (PreH7 : ((INT_MIN) <= a0)) (PreH8 : (a0 <= INT_MAX)) (PreH9 : ((INT_MIN) <= a1)) (PreH10 : (a1 <= INT_MAX)) (PreH11 : ((INT_MIN) <= a2)) (PreH12 : (a2 <= INT_MAX)) (PreH13 : ((INT_MIN) <= a3)) (PreH14 : (a3 <= INT_MAX)) ,
  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
|--
  “ ((INT_MIN) <= retval) ” 
  &&  “ (retval <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a2) ” 
  &&  “ (a2 <= INT_MAX) ” 
  &&  “ (retval = (rs_add_s32 (retval_2) (a1))) ” 
  &&  “ ((INT_MIN) <= retval) ” 
  &&  “ (retval <= INT_MAX) ” 
  &&  “ (retval_2 = (rs_add_s32 (0) (a0))) ” 
  &&  “ ((INT_MIN) <= retval_2) ” 
  &&  “ (retval_2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a0) ” 
  &&  “ (a0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a1) ” 
  &&  “ (a1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a2) ” 
  &&  “ (a2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a3) ” 
  &&  “ (a3 <= INT_MAX) ”
  &&  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
.

Definition vaddvq_s32_partial_solve_wit_3 := vaddvq_s32_partial_solve_wit_3_pure -> vaddvq_s32_partial_solve_wit_3_aux.

Definition vaddvq_s32_partial_solve_wit_4_pure := 
forall (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval_2: Z) (retval_3: Z) (retval: Z) (PreH1 : (retval = (rs_add_s32 (retval_3) (a2)))) (PreH2 : ((INT_MIN) <= retval)) (PreH3 : (retval <= INT_MAX)) (PreH4 : (retval_3 = (rs_add_s32 (retval_2) (a1)))) (PreH5 : ((INT_MIN) <= retval_3)) (PreH6 : (retval_3 <= INT_MAX)) (PreH7 : (retval_2 = (rs_add_s32 (0) (a0)))) (PreH8 : ((INT_MIN) <= retval_2)) (PreH9 : (retval_2 <= INT_MAX)) (PreH10 : ((INT_MIN) <= a0)) (PreH11 : (a0 <= INT_MAX)) (PreH12 : ((INT_MIN) <= a1)) (PreH13 : (a1 <= INT_MAX)) (PreH14 : ((INT_MIN) <= a2)) (PreH15 : (a2 <= INT_MAX)) (PreH16 : ((INT_MIN) <= a3)) (PreH17 : (a3 <= INT_MAX)) ,
  ((( &( "r" ) )) # Int  |-> retval)
  **  ((( &( "a" ) )) # Ptr  |-> ( &( "a" ) ))
  **  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
|--
  “ ((INT_MIN) <= retval) ” 
  &&  “ (retval <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a3) ” 
  &&  “ (a3 <= INT_MAX) ”
.

Definition vaddvq_s32_partial_solve_wit_4_aux := 
forall (a3: Z) (a2: Z) (a1: Z) (a0: Z) (retval_2: Z) (retval_3: Z) (retval: Z) (PreH1 : (retval = (rs_add_s32 (retval_3) (a2)))) (PreH2 : ((INT_MIN) <= retval)) (PreH3 : (retval <= INT_MAX)) (PreH4 : (retval_3 = (rs_add_s32 (retval_2) (a1)))) (PreH5 : ((INT_MIN) <= retval_3)) (PreH6 : (retval_3 <= INT_MAX)) (PreH7 : (retval_2 = (rs_add_s32 (0) (a0)))) (PreH8 : ((INT_MIN) <= retval_2)) (PreH9 : (retval_2 <= INT_MAX)) (PreH10 : ((INT_MIN) <= a0)) (PreH11 : (a0 <= INT_MAX)) (PreH12 : ((INT_MIN) <= a1)) (PreH13 : (a1 <= INT_MAX)) (PreH14 : ((INT_MIN) <= a2)) (PreH15 : (a2 <= INT_MAX)) (PreH16 : ((INT_MIN) <= a3)) (PreH17 : (a3 <= INT_MAX)) ,
  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
|--
  “ ((INT_MIN) <= retval) ” 
  &&  “ (retval <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a3) ” 
  &&  “ (a3 <= INT_MAX) ” 
  &&  “ (retval = (rs_add_s32 (retval_3) (a2))) ” 
  &&  “ ((INT_MIN) <= retval) ” 
  &&  “ (retval <= INT_MAX) ” 
  &&  “ (retval_3 = (rs_add_s32 (retval_2) (a1))) ” 
  &&  “ ((INT_MIN) <= retval_3) ” 
  &&  “ (retval_3 <= INT_MAX) ” 
  &&  “ (retval_2 = (rs_add_s32 (0) (a0))) ” 
  &&  “ ((INT_MIN) <= retval_2) ” 
  &&  “ (retval_2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a0) ” 
  &&  “ (a0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a1) ” 
  &&  “ (a1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a2) ” 
  &&  “ (a2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= a3) ” 
  &&  “ (a3 <= INT_MAX) ”
  &&  ((&(( &( "a" ) )->ₛ "s0")) # Int  |-> a0)
  **  ((&(( &( "a" ) )->ₛ "s1")) # Int  |-> a1)
  **  ((&(( &( "a" ) )->ₛ "s2")) # Int  |-> a2)
  **  ((&(( &( "a" ) )->ₛ "s3")) # Int  |-> a3)
.

Definition vaddvq_s32_partial_solve_wit_4 := vaddvq_s32_partial_solve_wit_4_pure -> vaddvq_s32_partial_solve_wit_4_aux.

Module Type VC_Correct.


Axiom proof_of_vaddvq_s32_safety_wit_1 : vaddvq_s32_safety_wit_1.
Axiom proof_of_vaddvq_s32_return_wit_1 : vaddvq_s32_return_wit_1.
Axiom proof_of_vaddvq_s32_partial_solve_wit_1_pure : vaddvq_s32_partial_solve_wit_1_pure.
Axiom proof_of_vaddvq_s32_partial_solve_wit_1 : vaddvq_s32_partial_solve_wit_1.
Axiom proof_of_vaddvq_s32_partial_solve_wit_2_pure : vaddvq_s32_partial_solve_wit_2_pure.
Axiom proof_of_vaddvq_s32_partial_solve_wit_2 : vaddvq_s32_partial_solve_wit_2.
Axiom proof_of_vaddvq_s32_partial_solve_wit_3_pure : vaddvq_s32_partial_solve_wit_3_pure.
Axiom proof_of_vaddvq_s32_partial_solve_wit_3 : vaddvq_s32_partial_solve_wit_3.
Axiom proof_of_vaddvq_s32_partial_solve_wit_4_pure : vaddvq_s32_partial_solve_wit_4_pure.
Axiom proof_of_vaddvq_s32_partial_solve_wit_4 : vaddvq_s32_partial_solve_wit_4.

End VC_Correct.
