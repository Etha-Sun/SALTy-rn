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
Require Import Qu8Rdsum.OutputModel.
Local Open Scope sac.

(*----- Function rdsum_output_lane -----*)

Definition rdsum_output_lane_safety_wit_1 := 
forall (vl_pre: Z) (i_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= idx)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) (PreH7 : ((idx + vl_pre ) <= count)) (PreH8 : (p_pre = (base + (idx * 4 ) ))) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  (UIntArray.full base count L )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition rdsum_output_lane_return_wit_1 := 
(
forall (vl_pre: Z) (i_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= idx)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) (PreH7 : ((idx + vl_pre ) <= count)) (PreH8 : (p_pre = (base + (idx * 4 ) ))) ,
  (UIntArray.full base count L )
|--
  “ (0 = (rd_out_lane (L) (idx) (i_pre) (vl_pre))) ” 
  &&  “ (0 <= 0) ” 
  &&  “ (0 <= UINT_MAX) ”
  &&  (UIntArray.full base count L )
) \/
(
forall (vl_pre: Z) (i_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= idx)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) (PreH7 : ((idx + vl_pre ) <= count)) (PreH8 : (p_pre = (base + (idx * 4 ) ))) ,
  TT && emp 
|--
  “ (0 = (rd_out_lane (L) (idx) (i_pre) (vl_pre))) ”
  &&  emp
).

Definition rdsum_output_lane_return_wit_1_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= idx)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) (PreH7 : ((idx + vl_pre ) <= count)) (PreH8 : (p_pre = (base + (idx * 4 ) ))) ,
  (0 = (rd_out_lane (L) (idx) (i_pre) (vl_pre)))
.

Definition rdsum_output_lane_return_wit_2 := 
(
forall (vl_pre: Z) (i_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (PreH1 : (retval = (Znth (idx + i_pre ) L 0))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= UINT_MAX)) (PreH4 : (i_pre < vl_pre)) (PreH5 : (0 <= idx)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= 32)) (PreH10 : ((idx + vl_pre ) <= count)) (PreH11 : (p_pre = (base + (idx * 4 ) ))) ,
  (UIntArray.full base count L )
|--
  “ (retval = (rd_out_lane (L) (idx) (i_pre) (vl_pre))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= UINT_MAX) ”
  &&  (UIntArray.full base count L )
) \/
(
forall (vl_pre: Z) (i_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (PreH1 : (retval = (Znth (idx + i_pre ) L 0))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= UINT_MAX)) (PreH4 : (i_pre < vl_pre)) (PreH5 : (0 <= idx)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= 32)) (PreH10 : ((idx + vl_pre ) <= count)) (PreH11 : (p_pre = (base + (idx * 4 ) ))) ,
  TT && emp 
|--
  “ (retval = (rd_out_lane (L) (idx) (i_pre) (vl_pre))) ”
  &&  emp
).

Definition rdsum_output_lane_return_wit_2_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (PreH1 : (retval = (Znth (idx + i_pre ) L 0))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= UINT_MAX)) (PreH4 : (i_pre < vl_pre)) (PreH5 : (0 <= idx)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= 32)) (PreH10 : ((idx + vl_pre ) <= count)) (PreH11 : (p_pre = (base + (idx * 4 ) ))) ,
  (retval = (rd_out_lane (L) (idx) (i_pre) (vl_pre)))
.

Definition rdsum_output_lane_partial_solve_wit_1_pure := 
forall (vl_pre: Z) (i_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : (0 <= idx)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) (PreH7 : ((idx + vl_pre ) <= count)) (PreH8 : (p_pre = (base + (idx * 4 ) ))) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  (UIntArray.full base count L )
|--
  “ (0 <= idx) ” 
  &&  “ (0 <= i_pre) ” 
  &&  “ ((idx + i_pre ) < count) ” 
  &&  “ (p_pre = (base + (idx * 4 ) )) ”
.

Definition rdsum_output_lane_partial_solve_wit_1_aux := 
forall (vl_pre: Z) (i_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : (0 <= idx)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) (PreH7 : ((idx + vl_pre ) <= count)) (PreH8 : (p_pre = (base + (idx * 4 ) ))) ,
  (UIntArray.full base count L )
|--
  “ (0 <= idx) ” 
  &&  “ (0 <= i_pre) ” 
  &&  “ ((idx + i_pre ) < count) ” 
  &&  “ (p_pre = (base + (idx * 4 ) )) ” 
  &&  “ (i_pre < vl_pre) ” 
  &&  “ (0 <= idx) ” 
  &&  “ (0 <= i_pre) ” 
  &&  “ (i_pre < 32) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + (idx * 4 ) )) ”
  &&  (UIntArray.full base count L )
.

Definition rdsum_output_lane_partial_solve_wit_1 := rdsum_output_lane_partial_solve_wit_1_pure -> rdsum_output_lane_partial_solve_wit_1_aux.

(*----- Function rdsum_store_lane -----*)

Definition rdsum_store_lane_return_wit_1 := 
(
forall (vl_pre: Z) (value_pre: Z) (i_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : (0 <= idx)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) (PreH7 : ((idx + vl_pre ) <= count)) (PreH8 : (p_pre = (base + (idx * 4 ) ))) (PreH9 : (0 <= value_pre)) (PreH10 : (value_pre <= UINT_MAX)) ,
  (UIntArray.full base count (replace_Znth ((idx + i_pre )) (value_pre) (L)) )
|--
  (UIntArray.full base count (rd_store_lane (L) (idx) (i_pre) (value_pre) (vl_pre)) )
) \/
(
forall (vl_pre: Z) (value_pre: Z) (i_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : (0 <= idx)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) (PreH7 : ((idx + vl_pre ) <= count)) (PreH8 : (p_pre = (base + (idx * 4 ) ))) (PreH9 : (0 <= value_pre)) (PreH10 : (value_pre <= UINT_MAX)) ,
  TT && emp 
|--
  “ ((replace_Znth ((idx + i_pre )) (value_pre) (L)) = (rd_store_lane (L) (idx) (i_pre) (value_pre) (vl_pre))) ”
  &&  emp
).

Definition rdsum_store_lane_return_wit_1_split_goal_1 := 
forall (vl_pre: Z) (value_pre: Z) (i_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : (0 <= idx)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) (PreH7 : ((idx + vl_pre ) <= count)) (PreH8 : (p_pre = (base + (idx * 4 ) ))) (PreH9 : (0 <= value_pre)) (PreH10 : (value_pre <= UINT_MAX)) ,
  ((replace_Znth ((idx + i_pre )) (value_pre) (L)) = (rd_store_lane (L) (idx) (i_pre) (value_pre) (vl_pre)))
.

Definition rdsum_store_lane_return_wit_2 := 
(
forall (vl_pre: Z) (value_pre: Z) (i_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= idx)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) (PreH7 : ((idx + vl_pre ) <= count)) (PreH8 : (p_pre = (base + (idx * 4 ) ))) (PreH9 : (0 <= value_pre)) (PreH10 : (value_pre <= UINT_MAX)) ,
  (UIntArray.full base count L )
|--
  (UIntArray.full base count (rd_store_lane (L) (idx) (i_pre) (value_pre) (vl_pre)) )
) \/
(
forall (vl_pre: Z) (value_pre: Z) (i_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= idx)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) (PreH7 : ((idx + vl_pre ) <= count)) (PreH8 : (p_pre = (base + (idx * 4 ) ))) (PreH9 : (0 <= value_pre)) (PreH10 : (value_pre <= UINT_MAX)) ,
  TT && emp 
|--
  “ (L = (rd_store_lane (L) (idx) (i_pre) (value_pre) (vl_pre))) ”
  &&  emp
).

Definition rdsum_store_lane_return_wit_2_split_goal_1 := 
forall (vl_pre: Z) (value_pre: Z) (i_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= idx)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) (PreH7 : ((idx + vl_pre ) <= count)) (PreH8 : (p_pre = (base + (idx * 4 ) ))) (PreH9 : (0 <= value_pre)) (PreH10 : (value_pre <= UINT_MAX)) ,
  (L = (rd_store_lane (L) (idx) (i_pre) (value_pre) (vl_pre)))
.

Definition rdsum_store_lane_partial_solve_wit_1_pure := 
forall (vl_pre: Z) (value_pre: Z) (i_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : (0 <= idx)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) (PreH7 : ((idx + vl_pre ) <= count)) (PreH8 : (p_pre = (base + (idx * 4 ) ))) (PreH9 : (0 <= value_pre)) (PreH10 : (value_pre <= UINT_MAX)) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((( &( "value" ) )) # UInt  |-> value_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  (UIntArray.full base count L )
|--
  “ (0 <= idx) ” 
  &&  “ (0 <= i_pre) ” 
  &&  “ ((idx + i_pre ) < count) ” 
  &&  “ (p_pre = (base + (idx * 4 ) )) ” 
  &&  “ (0 <= value_pre) ” 
  &&  “ (value_pre <= UINT_MAX) ”
.

Definition rdsum_store_lane_partial_solve_wit_1_aux := 
forall (vl_pre: Z) (value_pre: Z) (i_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : (0 <= idx)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) (PreH7 : ((idx + vl_pre ) <= count)) (PreH8 : (p_pre = (base + (idx * 4 ) ))) (PreH9 : (0 <= value_pre)) (PreH10 : (value_pre <= UINT_MAX)) ,
  (UIntArray.full base count L )
|--
  “ (0 <= idx) ” 
  &&  “ (0 <= i_pre) ” 
  &&  “ ((idx + i_pre ) < count) ” 
  &&  “ (p_pre = (base + (idx * 4 ) )) ” 
  &&  “ (0 <= value_pre) ” 
  &&  “ (value_pre <= UINT_MAX) ” 
  &&  “ (i_pre < vl_pre) ” 
  &&  “ (0 <= idx) ” 
  &&  “ (0 <= i_pre) ” 
  &&  “ (i_pre < 32) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + (idx * 4 ) )) ” 
  &&  “ (0 <= value_pre) ” 
  &&  “ (value_pre <= UINT_MAX) ”
  &&  (UIntArray.full base count L )
.

Definition rdsum_store_lane_partial_solve_wit_1 := rdsum_store_lane_partial_solve_wit_1_pure -> rdsum_store_lane_partial_solve_wit_1_aux.

Module Type VC_Correct.


Axiom proof_of_rdsum_output_lane_safety_wit_1 : rdsum_output_lane_safety_wit_1.
Axiom proof_of_rdsum_output_lane_return_wit_1 : rdsum_output_lane_return_wit_1.
Axiom proof_of_rdsum_output_lane_return_wit_2 : rdsum_output_lane_return_wit_2.
Axiom proof_of_rdsum_output_lane_partial_solve_wit_1_pure : rdsum_output_lane_partial_solve_wit_1_pure.
Axiom proof_of_rdsum_output_lane_partial_solve_wit_1 : rdsum_output_lane_partial_solve_wit_1.
Axiom proof_of_rdsum_store_lane_return_wit_1 : rdsum_store_lane_return_wit_1.
Axiom proof_of_rdsum_store_lane_return_wit_2 : rdsum_store_lane_return_wit_2.
Axiom proof_of_rdsum_store_lane_partial_solve_wit_1_pure : rdsum_store_lane_partial_solve_wit_1_pure.
Axiom proof_of_rdsum_store_lane_partial_solve_wit_1 : rdsum_store_lane_partial_solve_wit_1.

End VC_Correct.
