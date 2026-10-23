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
Require Import Qs8Rsum.VectorModel.
Local Open Scope sac.

(*----- Function rsum_active_s32 -----*)

Definition rsum_active_s32_return_wit_1 := 
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : ((INT_MIN) <= a_pre)) (PreH3 : (a_pre <= INT_MAX)) (PreH4 : ((INT_MIN) <= b_pre)) (PreH5 : (b_pre <= INT_MAX)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre <= UINT64_MAX)) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= UINT64_MAX)) ,
  TT && emp 
|--
  “ (a_pre = (rs_active_s32 (a_pre) (b_pre) (i_pre) (vl_pre))) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : ((INT_MIN) <= a_pre)) (PreH3 : (a_pre <= INT_MAX)) (PreH4 : ((INT_MIN) <= b_pre)) (PreH5 : (b_pre <= INT_MAX)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre <= UINT64_MAX)) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= UINT64_MAX)) ,
  TT && emp 
|--
  “ (a_pre = (rs_active_s32 (a_pre) (b_pre) (i_pre) (vl_pre))) ”
  &&  emp
).

Definition rsum_active_s32_return_wit_1_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : ((INT_MIN) <= a_pre)) (PreH3 : (a_pre <= INT_MAX)) (PreH4 : ((INT_MIN) <= b_pre)) (PreH5 : (b_pre <= INT_MAX)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre <= UINT64_MAX)) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= UINT64_MAX)) ,
  (a_pre = (rs_active_s32 (a_pre) (b_pre) (i_pre) (vl_pre)))
.

Definition rsum_active_s32_return_wit_2 := 
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (rs_add_s32 (a_pre) (b_pre)))) (PreH2 : ((INT_MIN) <= retval)) (PreH3 : (retval <= INT_MAX)) (PreH4 : (i_pre < vl_pre)) (PreH5 : ((INT_MIN) <= a_pre)) (PreH6 : (a_pre <= INT_MAX)) (PreH7 : ((INT_MIN) <= b_pre)) (PreH8 : (b_pre <= INT_MAX)) (PreH9 : (0 <= i_pre)) (PreH10 : (i_pre <= UINT64_MAX)) (PreH11 : (0 <= vl_pre)) (PreH12 : (vl_pre <= UINT64_MAX)) ,
  TT && emp 
|--
  “ (retval = (rs_active_s32 (a_pre) (b_pre) (i_pre) (vl_pre))) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (rs_add_s32 (a_pre) (b_pre)))) (PreH2 : ((INT_MIN) <= retval)) (PreH3 : (retval <= INT_MAX)) (PreH4 : (i_pre < vl_pre)) (PreH5 : ((INT_MIN) <= a_pre)) (PreH6 : (a_pre <= INT_MAX)) (PreH7 : ((INT_MIN) <= b_pre)) (PreH8 : (b_pre <= INT_MAX)) (PreH9 : (0 <= i_pre)) (PreH10 : (i_pre <= UINT64_MAX)) (PreH11 : (0 <= vl_pre)) (PreH12 : (vl_pre <= UINT64_MAX)) ,
  TT && emp 
|--
  “ (retval = (rs_active_s32 (a_pre) (b_pre) (i_pre) (vl_pre))) ”
  &&  emp
).

Definition rsum_active_s32_return_wit_2_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (rs_add_s32 (a_pre) (b_pre)))) (PreH2 : ((INT_MIN) <= retval)) (PreH3 : (retval <= INT_MAX)) (PreH4 : (i_pre < vl_pre)) (PreH5 : ((INT_MIN) <= a_pre)) (PreH6 : (a_pre <= INT_MAX)) (PreH7 : ((INT_MIN) <= b_pre)) (PreH8 : (b_pre <= INT_MAX)) (PreH9 : (0 <= i_pre)) (PreH10 : (i_pre <= UINT64_MAX)) (PreH11 : (0 <= vl_pre)) (PreH12 : (vl_pre <= UINT64_MAX)) ,
  (retval = (rs_active_s32 (a_pre) (b_pre) (i_pre) (vl_pre)))
.

Definition rsum_active_s32_partial_solve_wit_1_pure := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : ((INT_MIN) <= a_pre)) (PreH3 : (a_pre <= INT_MAX)) (PreH4 : ((INT_MIN) <= b_pre)) (PreH5 : (b_pre <= INT_MAX)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre <= UINT64_MAX)) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= UINT64_MAX)) ,
  ((( &( "a" ) )) # Int  |-> a_pre)
  **  ((( &( "b" ) )) # Int  |-> b_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ ((INT_MIN) <= a_pre) ” 
  &&  “ (a_pre <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b_pre) ” 
  &&  “ (b_pre <= INT_MAX) ”
.

Definition rsum_active_s32_partial_solve_wit_1_aux := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : ((INT_MIN) <= a_pre)) (PreH3 : (a_pre <= INT_MAX)) (PreH4 : ((INT_MIN) <= b_pre)) (PreH5 : (b_pre <= INT_MAX)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre <= UINT64_MAX)) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= UINT64_MAX)) ,
  TT && emp 
|--
  “ ((INT_MIN) <= a_pre) ” 
  &&  “ (a_pre <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b_pre) ” 
  &&  “ (b_pre <= INT_MAX) ” 
  &&  “ (i_pre < vl_pre) ” 
  &&  “ ((INT_MIN) <= a_pre) ” 
  &&  “ (a_pre <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b_pre) ” 
  &&  “ (b_pre <= INT_MAX) ” 
  &&  “ (0 <= i_pre) ” 
  &&  “ (i_pre <= UINT64_MAX) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= UINT64_MAX) ”
  &&  emp
.

Definition rsum_active_s32_partial_solve_wit_1 := rsum_active_s32_partial_solve_wit_1_pure -> rsum_active_s32_partial_solve_wit_1_aux.

(*----- Function rsum_splat_s32 -----*)

Definition rsum_splat_s32_safety_wit_1 := 
forall (vl_pre: Z) (i_pre: Z) (x_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : ((INT_MIN) <= x_pre)) (PreH3 : (x_pre <= INT_MAX)) (PreH4 : (0 <= i_pre)) (PreH5 : (i_pre <= UINT64_MAX)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= UINT64_MAX)) ,
  ((( &( "x" ) )) # Int  |-> x_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition rsum_splat_s32_return_wit_1 := 
(
forall (vl_pre: Z) (i_pre: Z) (x_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : ((INT_MIN) <= x_pre)) (PreH3 : (x_pre <= INT_MAX)) (PreH4 : (0 <= i_pre)) (PreH5 : (i_pre <= UINT64_MAX)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= UINT64_MAX)) ,
  TT && emp 
|--
  “ (0 = (rs_splat_s32 (x_pre) (i_pre) (vl_pre))) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (x_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : ((INT_MIN) <= x_pre)) (PreH3 : (x_pre <= INT_MAX)) (PreH4 : (0 <= i_pre)) (PreH5 : (i_pre <= UINT64_MAX)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= UINT64_MAX)) ,
  TT && emp 
|--
  “ (0 = (rs_splat_s32 (x_pre) (i_pre) (vl_pre))) ”
  &&  emp
).

Definition rsum_splat_s32_return_wit_1_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (x_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : ((INT_MIN) <= x_pre)) (PreH3 : (x_pre <= INT_MAX)) (PreH4 : (0 <= i_pre)) (PreH5 : (i_pre <= UINT64_MAX)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= UINT64_MAX)) ,
  (0 = (rs_splat_s32 (x_pre) (i_pre) (vl_pre)))
.

Definition rsum_splat_s32_return_wit_2 := 
(
forall (vl_pre: Z) (i_pre: Z) (x_pre: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : ((INT_MIN) <= x_pre)) (PreH3 : (x_pre <= INT_MAX)) (PreH4 : (0 <= i_pre)) (PreH5 : (i_pre <= UINT64_MAX)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= UINT64_MAX)) ,
  TT && emp 
|--
  “ (x_pre = (rs_splat_s32 (x_pre) (i_pre) (vl_pre))) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (x_pre: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : ((INT_MIN) <= x_pre)) (PreH3 : (x_pre <= INT_MAX)) (PreH4 : (0 <= i_pre)) (PreH5 : (i_pre <= UINT64_MAX)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= UINT64_MAX)) ,
  TT && emp 
|--
  “ (x_pre = (rs_splat_s32 (x_pre) (i_pre) (vl_pre))) ”
  &&  emp
).

Definition rsum_splat_s32_return_wit_2_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (x_pre: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : ((INT_MIN) <= x_pre)) (PreH3 : (x_pre <= INT_MAX)) (PreH4 : (0 <= i_pre)) (PreH5 : (i_pre <= UINT64_MAX)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= UINT64_MAX)) ,
  (x_pre = (rs_splat_s32 (x_pre) (i_pre) (vl_pre)))
.

(*----- Function rsum_mul_s8 -----*)

Definition rsum_mul_s8_safety_wit_1 := 
forall (b_pre: Z) (a_pre: Z) (PreH1 : ((-128) <= a_pre)) (PreH2 : (a_pre <= 127)) (PreH3 : ((-128) <= b_pre)) (PreH4 : (b_pre <= 127)) ,
  ((( &( "p" ) )) # Int  |->_)
  **  ((( &( "a" ) )) # Char  |-> a_pre)
  **  ((( &( "b" ) )) # Char  |-> b_pre)
|--
  “ ((a_pre * b_pre ) <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= (a_pre * b_pre )) ”
.

Definition rsum_mul_s8_return_wit_1 := 
(
forall (b_pre: Z) (a_pre: Z) (PreH1 : ((-128) <= a_pre)) (PreH2 : (a_pre <= 127)) (PreH3 : ((-128) <= b_pre)) (PreH4 : (b_pre <= 127)) ,
  TT && emp 
|--
  “ ((signed_last_nbits ((a_pre * b_pre )) (8)) = (rs_mul_s8 (a_pre) (b_pre))) ”
  &&  emp
) \/
(
forall (b_pre: Z) (a_pre: Z) (PreH1 : ((-128) <= a_pre)) (PreH2 : (a_pre <= 127)) (PreH3 : ((-128) <= b_pre)) (PreH4 : (b_pre <= 127)) ,
  TT && emp 
|--
  “ ((signed_last_nbits ((a_pre * b_pre )) (8)) = (rs_mul_s8 (a_pre) (b_pre))) ”
  &&  emp
).

Definition rsum_mul_s8_return_wit_1_split_goal_1 := 
forall (b_pre: Z) (a_pre: Z) (PreH1 : ((-128) <= a_pre)) (PreH2 : (a_pre <= 127)) (PreH3 : ((-128) <= b_pre)) (PreH4 : (b_pre <= 127)) ,
  ((signed_last_nbits ((a_pre * b_pre )) (8)) = (rs_mul_s8 (a_pre) (b_pre)))
.

Module Type VC_Correct.


Axiom proof_of_rsum_active_s32_return_wit_1 : rsum_active_s32_return_wit_1.
Axiom proof_of_rsum_active_s32_return_wit_2 : rsum_active_s32_return_wit_2.
Axiom proof_of_rsum_active_s32_partial_solve_wit_1_pure : rsum_active_s32_partial_solve_wit_1_pure.
Axiom proof_of_rsum_active_s32_partial_solve_wit_1 : rsum_active_s32_partial_solve_wit_1.
Axiom proof_of_rsum_splat_s32_safety_wit_1 : rsum_splat_s32_safety_wit_1.
Axiom proof_of_rsum_splat_s32_return_wit_1 : rsum_splat_s32_return_wit_1.
Axiom proof_of_rsum_splat_s32_return_wit_2 : rsum_splat_s32_return_wit_2.
Axiom proof_of_rsum_mul_s8_safety_wit_1 : rsum_mul_s8_safety_wit_1.
Axiom proof_of_rsum_mul_s8_return_wit_1 : rsum_mul_s8_return_wit_1.

End VC_Correct.
