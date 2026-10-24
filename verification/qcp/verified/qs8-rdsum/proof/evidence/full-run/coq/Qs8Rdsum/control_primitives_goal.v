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
Require Import Qs8Rdsum.ControlModel.
Local Open Scope sac.

(*----- Function rdsum_min252 -----*)

Definition rdsum_min252_safety_wit_1 := 
forall (r_pre: Z) (PreH1 : (0 <= r_pre)) (PreH2 : (r_pre <= UINT64_MAX)) ,
  ((( &( "r" ) )) # UInt64  |-> r_pre)
|--
  “ (252 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 252) ”
.

Definition rdsum_min252_safety_wit_2 := 
forall (r_pre: Z) (PreH1 : (r_pre >= 252)) (PreH2 : (0 <= r_pre)) (PreH3 : (r_pre <= UINT64_MAX)) ,
  ((( &( "r" ) )) # UInt64  |-> r_pre)
|--
  “ (252 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 252) ”
.

Definition rdsum_min252_return_wit_1 := 
(
forall (r_pre: Z) (PreH1 : (r_pre >= 252)) (PreH2 : (0 <= r_pre)) (PreH3 : (r_pre <= UINT64_MAX)) ,
  TT && emp 
|--
  “ (252 = (rd_min252 (r_pre))) ” 
  &&  “ (0 <= 252) ” 
  &&  “ (252 <= 252) ”
  &&  emp
) \/
(
forall (r_pre: Z) (PreH1 : (r_pre >= 252)) (PreH2 : (0 <= r_pre)) (PreH3 : (r_pre <= UINT64_MAX)) ,
  TT && emp 
|--
  “ (252 = (rd_min252 (r_pre))) ”
  &&  emp
).

Definition rdsum_min252_return_wit_1_split_goal_1 := 
forall (r_pre: Z) (PreH1 : (r_pre >= 252)) (PreH2 : (0 <= r_pre)) (PreH3 : (r_pre <= UINT64_MAX)) ,
  (252 = (rd_min252 (r_pre)))
.

Definition rdsum_min252_return_wit_2 := 
(
forall (r_pre: Z) (PreH1 : (r_pre < 252)) (PreH2 : (0 <= r_pre)) (PreH3 : (r_pre <= UINT64_MAX)) ,
  TT && emp 
|--
  “ (r_pre = (rd_min252 (r_pre))) ” 
  &&  “ (0 <= r_pre) ” 
  &&  “ (r_pre <= 252) ”
  &&  emp
) \/
(
forall (r_pre: Z) (PreH1 : (r_pre < 252)) (PreH2 : (0 <= r_pre)) (PreH3 : (r_pre <= UINT64_MAX)) ,
  TT && emp 
|--
  “ (r_pre = (rd_min252 (r_pre))) ”
  &&  emp
).

Definition rdsum_min252_return_wit_2_split_goal_1 := 
forall (r_pre: Z) (PreH1 : (r_pre < 252)) (PreH2 : (0 <= r_pre)) (PreH3 : (r_pre <= UINT64_MAX)) ,
  (r_pre = (rd_min252 (r_pre)))
.

(*----- Function rdsum_ceil252 -----*)

Definition rdsum_ceil252_safety_wit_1 := 
forall (r_pre: Z) (PreH1 : (0 <= r_pre)) (PreH2 : (r_pre <= UINT64_MAX)) ,
  ((( &( "q" ) )) # UInt64  |->_)
  **  ((( &( "r" ) )) # UInt64  |-> r_pre)
|--
  “ (252 <> 0) ”
.

Definition rdsum_ceil252_safety_wit_2 := 
forall (r_pre: Z) (PreH1 : (0 <= r_pre)) (PreH2 : (r_pre <= UINT64_MAX)) ,
  ((( &( "q" ) )) # UInt64  |->_)
  **  ((( &( "r" ) )) # UInt64  |-> r_pre)
|--
  “ (252 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 252) ”
.

Definition rdsum_ceil252_safety_wit_3 := 
forall (r_pre: Z) (PreH1 : (0 <= r_pre)) (PreH2 : (r_pre <= UINT64_MAX)) ,
  ((( &( "q" ) )) # UInt64  |-> (r_pre ÷ 252 ))
  **  ((( &( "r" ) )) # UInt64  |-> r_pre)
|--
  “ (252 <> 0) ”
.

Definition rdsum_ceil252_safety_wit_4 := 
forall (r_pre: Z) (PreH1 : (0 <= r_pre)) (PreH2 : (r_pre <= UINT64_MAX)) ,
  ((( &( "q" ) )) # UInt64  |-> (r_pre ÷ 252 ))
  **  ((( &( "r" ) )) # UInt64  |-> r_pre)
|--
  “ (252 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 252) ”
.

Definition rdsum_ceil252_safety_wit_5 := 
forall (r_pre: Z) (PreH1 : (0 <= r_pre)) (PreH2 : (r_pre <= UINT64_MAX)) ,
  ((( &( "q" ) )) # UInt64  |-> (r_pre ÷ 252 ))
  **  ((( &( "r" ) )) # UInt64  |-> r_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition rdsum_ceil252_safety_wit_6 := 
forall (r_pre: Z) (PreH1 : ((r_pre % ( 252 ) ) <> 0)) (PreH2 : (0 <= r_pre)) (PreH3 : (r_pre <= UINT64_MAX)) ,
  ((( &( "q" ) )) # UInt64  |-> (r_pre ÷ 252 ))
  **  ((( &( "r" ) )) # UInt64  |-> r_pre)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition rdsum_ceil252_return_wit_1 := 
(
forall (r_pre: Z) (PreH1 : ((r_pre % ( 252 ) ) <> 0)) (PreH2 : (0 <= r_pre)) (PreH3 : (r_pre <= UINT64_MAX)) ,
  TT && emp 
|--
  “ ((unsigned_last_nbits (((r_pre ÷ 252 ) + 1 )) (64)) = (rd_ceil252 (r_pre))) ” 
  &&  “ (0 <= (unsigned_last_nbits (((r_pre ÷ 252 ) + 1 )) (64))) ” 
  &&  “ ((unsigned_last_nbits (((r_pre ÷ 252 ) + 1 )) (64)) <= r_pre) ”
  &&  emp
) \/
(
forall (r_pre: Z) (PreH1 : ((r_pre % ( 252 ) ) <> 0)) (PreH2 : (0 <= r_pre)) (PreH3 : (r_pre <= UINT64_MAX)) ,
  TT && emp 
|--
  “ ((unsigned_last_nbits (((r_pre ÷ 252 ) + 1 )) (64)) <= r_pre) ” 
  &&  “ (0 <= (unsigned_last_nbits (((r_pre ÷ 252 ) + 1 )) (64))) ” 
  &&  “ ((unsigned_last_nbits (((r_pre ÷ 252 ) + 1 )) (64)) = (rd_ceil252 (r_pre))) ”
  &&  emp
).

Definition rdsum_ceil252_return_wit_1_split_goal_1 := 
forall (r_pre: Z) (PreH1 : ((r_pre % ( 252 ) ) <> 0)) (PreH2 : (0 <= r_pre)) (PreH3 : (r_pre <= UINT64_MAX)) ,
  ((unsigned_last_nbits (((r_pre ÷ 252 ) + 1 )) (64)) <= r_pre)
.

Definition rdsum_ceil252_return_wit_1_split_goal_2 := 
forall (r_pre: Z) (PreH1 : ((r_pre % ( 252 ) ) <> 0)) (PreH2 : (0 <= r_pre)) (PreH3 : (r_pre <= UINT64_MAX)) ,
  (0 <= (unsigned_last_nbits (((r_pre ÷ 252 ) + 1 )) (64)))
.

Definition rdsum_ceil252_return_wit_1_split_goal_3 := 
forall (r_pre: Z) (PreH1 : ((r_pre % ( 252 ) ) <> 0)) (PreH2 : (0 <= r_pre)) (PreH3 : (r_pre <= UINT64_MAX)) ,
  ((unsigned_last_nbits (((r_pre ÷ 252 ) + 1 )) (64)) = (rd_ceil252 (r_pre)))
.

Definition rdsum_ceil252_return_wit_2 := 
(
forall (r_pre: Z) (PreH1 : ((r_pre % ( 252 ) ) = 0)) (PreH2 : (0 <= r_pre)) (PreH3 : (r_pre <= UINT64_MAX)) ,
  TT && emp 
|--
  “ ((r_pre ÷ 252 ) = (rd_ceil252 (r_pre))) ” 
  &&  “ (0 <= (r_pre ÷ 252 )) ” 
  &&  “ ((r_pre ÷ 252 ) <= r_pre) ”
  &&  emp
) \/
(
forall (r_pre: Z) (PreH1 : ((r_pre % ( 252 ) ) = 0)) (PreH2 : (0 <= r_pre)) (PreH3 : (r_pre <= UINT64_MAX)) ,
  TT && emp 
|--
  “ ((r_pre ÷ 252 ) <= r_pre) ” 
  &&  “ (0 <= (r_pre ÷ 252 )) ” 
  &&  “ ((r_pre ÷ 252 ) = (rd_ceil252 (r_pre))) ”
  &&  emp
).

Definition rdsum_ceil252_return_wit_2_split_goal_1 := 
forall (r_pre: Z) (PreH1 : ((r_pre % ( 252 ) ) = 0)) (PreH2 : (0 <= r_pre)) (PreH3 : (r_pre <= UINT64_MAX)) ,
  ((r_pre ÷ 252 ) <= r_pre)
.

Definition rdsum_ceil252_return_wit_2_split_goal_2 := 
forall (r_pre: Z) (PreH1 : ((r_pre % ( 252 ) ) = 0)) (PreH2 : (0 <= r_pre)) (PreH3 : (r_pre <= UINT64_MAX)) ,
  (0 <= (r_pre ÷ 252 ))
.

Definition rdsum_ceil252_return_wit_2_split_goal_3 := 
forall (r_pre: Z) (PreH1 : ((r_pre % ( 252 ) ) = 0)) (PreH2 : (0 <= r_pre)) (PreH3 : (r_pre <= UINT64_MAX)) ,
  ((r_pre ÷ 252 ) = (rd_ceil252 (r_pre)))
.

Module Type VC_Correct.


Axiom proof_of_rdsum_min252_safety_wit_1 : rdsum_min252_safety_wit_1.
Axiom proof_of_rdsum_min252_safety_wit_2 : rdsum_min252_safety_wit_2.
Axiom proof_of_rdsum_min252_return_wit_1 : rdsum_min252_return_wit_1.
Axiom proof_of_rdsum_min252_return_wit_2 : rdsum_min252_return_wit_2.
Axiom proof_of_rdsum_ceil252_safety_wit_1 : rdsum_ceil252_safety_wit_1.
Axiom proof_of_rdsum_ceil252_safety_wit_2 : rdsum_ceil252_safety_wit_2.
Axiom proof_of_rdsum_ceil252_safety_wit_3 : rdsum_ceil252_safety_wit_3.
Axiom proof_of_rdsum_ceil252_safety_wit_4 : rdsum_ceil252_safety_wit_4.
Axiom proof_of_rdsum_ceil252_safety_wit_5 : rdsum_ceil252_safety_wit_5.
Axiom proof_of_rdsum_ceil252_safety_wit_6 : rdsum_ceil252_safety_wit_6.
Axiom proof_of_rdsum_ceil252_return_wit_1 : rdsum_ceil252_return_wit_1.
Axiom proof_of_rdsum_ceil252_return_wit_2 : rdsum_ceil252_return_wit_2.

End VC_Correct.
