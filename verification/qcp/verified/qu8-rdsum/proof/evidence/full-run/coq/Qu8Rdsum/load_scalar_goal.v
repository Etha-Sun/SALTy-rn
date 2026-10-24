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
Require Import Qu8Rdsum.MemoryModel.
Require Import Qu8Rdsum.LoadModel.
Local Open Scope sac.

(*----- Function rdsum_read_lane -----*)

Definition rdsum_read_lane_safety_wit_1 := 
forall (vl_pre: Z) (i_pre: Z) (p_pre: Z) (M: RDMap) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 < p_pre)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) (PreH7 : ((p_pre + (vl_pre * sizeof(UCHAR))) <= (UINT64_MAX + 1 ))) (PreH8 : (rd_window M p_pre vl_pre )) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  (rd_mem M )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition rdsum_read_lane_return_wit_1 := 
(
forall (vl_pre: Z) (i_pre: Z) (p_pre: Z) (M: RDMap) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 < p_pre)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) (PreH7 : ((p_pre + (vl_pre * sizeof(UCHAR))) <= (UINT64_MAX + 1 ))) (PreH8 : (rd_window M p_pre vl_pre )) ,
  (rd_mem M )
|--
  “ (0 = (rd_read_lane (M) (p_pre) (i_pre) (vl_pre))) ” 
  &&  “ (0 <= 0) ” 
  &&  “ (0 <= 255) ”
  &&  (rd_mem M )
) \/
(
forall (vl_pre: Z) (i_pre: Z) (p_pre: Z) (M: RDMap) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 < p_pre)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) (PreH7 : ((p_pre + (vl_pre * sizeof(UCHAR))) <= (UINT64_MAX + 1 ))) (PreH8 : (rd_window M p_pre vl_pre )) ,
  TT && emp 
|--
  “ (0 = (rd_read_lane (M) (p_pre) (i_pre) (vl_pre))) ”
  &&  emp
).

Definition rdsum_read_lane_return_wit_1_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (p_pre: Z) (M: RDMap) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 < p_pre)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) (PreH7 : ((p_pre + (vl_pre * sizeof(UCHAR))) <= (UINT64_MAX + 1 ))) (PreH8 : (rd_window M p_pre vl_pre )) ,
  (0 = (rd_read_lane (M) (p_pre) (i_pre) (vl_pre)))
.

Definition rdsum_read_lane_return_wit_2 := 
(
forall (vl_pre: Z) (i_pre: Z) (p_pre: Z) (M: RDMap) (retval: Z) (PreH1 : (retval = (rd_get (M) ((p_pre + (i_pre * sizeof(UCHAR))))))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= 255)) (PreH4 : (i_pre < vl_pre)) (PreH5 : (0 < p_pre)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= 32)) (PreH10 : ((p_pre + (vl_pre * sizeof(UCHAR))) <= (UINT64_MAX + 1 ))) (PreH11 : (rd_window M p_pre vl_pre )) ,
  (rd_mem M )
|--
  “ (retval = (rd_read_lane (M) (p_pre) (i_pre) (vl_pre))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 255) ”
  &&  (rd_mem M )
) \/
(
forall (vl_pre: Z) (i_pre: Z) (p_pre: Z) (M: RDMap) (retval: Z) (PreH1 : (retval = (rd_get (M) ((p_pre + (i_pre * sizeof(UCHAR))))))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= 255)) (PreH4 : (i_pre < vl_pre)) (PreH5 : (0 < p_pre)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= 32)) (PreH10 : ((p_pre + (vl_pre * sizeof(UCHAR))) <= (UINT64_MAX + 1 ))) (PreH11 : (rd_window M p_pre vl_pre )) ,
  TT && emp 
|--
  “ (retval = (rd_read_lane (M) (p_pre) (i_pre) (vl_pre))) ”
  &&  emp
).

Definition rdsum_read_lane_return_wit_2_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (p_pre: Z) (M: RDMap) (retval: Z) (PreH1 : (retval = (rd_get (M) ((p_pre + (i_pre * sizeof(UCHAR))))))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= 255)) (PreH4 : (i_pre < vl_pre)) (PreH5 : (0 < p_pre)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= 32)) (PreH10 : ((p_pre + (vl_pre * sizeof(UCHAR))) <= (UINT64_MAX + 1 ))) (PreH11 : (rd_window M p_pre vl_pre )) ,
  (retval = (rd_read_lane (M) (p_pre) (i_pre) (vl_pre)))
.

Definition rdsum_read_lane_partial_solve_wit_1_pure := 
(
forall (vl_pre: Z) (i_pre: Z) (p_pre: Z) (M: RDMap) (PreH1 : (i_pre < vl_pre)) (PreH2 : (0 < p_pre)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) (PreH7 : ((p_pre + (vl_pre * sizeof(UCHAR))) <= (UINT64_MAX + 1 ))) (PreH8 : (rd_window M p_pre vl_pre )) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  (rd_mem M )
|--
  “ ((p_pre + (i_pre * sizeof(UCHAR))) <> 0) ” 
  &&  “ (rd_present M (p_pre + (i_pre * sizeof(UCHAR))) ) ”
) \/
(
forall (vl_pre: Z) (i_pre: Z) (p_pre: Z) (M: RDMap) (PreH1 : (vl_pre <= UINT64_MAX)) (PreH2 : (i_pre <= UINT64_MAX)) (PreH3 : (vl_pre >= 0)) (PreH4 : (i_pre >= 0)) (PreH5 : (i_pre < vl_pre)) (PreH6 : (0 < p_pre)) (PreH7 : (0 <= i_pre)) (PreH8 : (i_pre < 32)) (PreH9 : (0 <= vl_pre)) (PreH10 : (vl_pre <= 32)) (PreH11 : ((p_pre + (vl_pre * sizeof(UCHAR))) <= (UINT64_MAX + 1 ))) (PreH12 : (rd_window M p_pre vl_pre )) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  (rd_mem M )
|--
  “ (rd_present M (p_pre + (i_pre * sizeof(UCHAR))) ) ”
).

Definition rdsum_read_lane_partial_solve_wit_1_pure_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (p_pre: Z) (M: RDMap) (PreH1 : (vl_pre <= UINT64_MAX)) (PreH2 : (i_pre <= UINT64_MAX)) (PreH3 : (vl_pre >= 0)) (PreH4 : (i_pre >= 0)) (PreH5 : (i_pre < vl_pre)) (PreH6 : (0 < p_pre)) (PreH7 : (0 <= i_pre)) (PreH8 : (i_pre < 32)) (PreH9 : (0 <= vl_pre)) (PreH10 : (vl_pre <= 32)) (PreH11 : ((p_pre + (vl_pre * sizeof(UCHAR))) <= (UINT64_MAX + 1 ))) (PreH12 : (rd_window M p_pre vl_pre )) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  (rd_mem M )
|--
  “ (rd_present M (p_pre + (i_pre * sizeof(UCHAR))) ) ”
.

Definition rdsum_read_lane_partial_solve_wit_1_aux := 
forall (vl_pre: Z) (i_pre: Z) (p_pre: Z) (M: RDMap) (PreH1 : (i_pre < vl_pre)) (PreH2 : (0 < p_pre)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) (PreH7 : ((p_pre + (vl_pre * sizeof(UCHAR))) <= (UINT64_MAX + 1 ))) (PreH8 : (rd_window M p_pre vl_pre )) ,
  (rd_mem M )
|--
  “ ((p_pre + (i_pre * sizeof(UCHAR))) <> 0) ” 
  &&  “ (rd_present M (p_pre + (i_pre * sizeof(UCHAR))) ) ” 
  &&  “ (i_pre < vl_pre) ” 
  &&  “ (0 < p_pre) ” 
  &&  “ (0 <= i_pre) ” 
  &&  “ (i_pre < 32) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ ((p_pre + (vl_pre * sizeof(UCHAR))) <= (UINT64_MAX + 1 )) ” 
  &&  “ (rd_window M p_pre vl_pre ) ”
  &&  (rd_mem M )
.

Definition rdsum_read_lane_partial_solve_wit_1 := rdsum_read_lane_partial_solve_wit_1_pure -> rdsum_read_lane_partial_solve_wit_1_aux.

Module Type VC_Correct.


Axiom proof_of_rdsum_read_lane_safety_wit_1 : rdsum_read_lane_safety_wit_1.
Axiom proof_of_rdsum_read_lane_return_wit_1 : rdsum_read_lane_return_wit_1.
Axiom proof_of_rdsum_read_lane_return_wit_2 : rdsum_read_lane_return_wit_2.
Axiom proof_of_rdsum_read_lane_partial_solve_wit_1_pure : rdsum_read_lane_partial_solve_wit_1_pure.
Axiom proof_of_rdsum_read_lane_partial_solve_wit_1 : rdsum_read_lane_partial_solve_wit_1.

End VC_Correct.
