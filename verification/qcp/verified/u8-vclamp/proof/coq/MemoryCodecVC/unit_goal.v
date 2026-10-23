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
Require Import FullU8.U8Logic FullU8.U8KernelLogic.
Require Import FullU8.Packed32Model.
Local Open Scope sac.
From FullU8 Require Import arrays_strategy_goal.
From FullU8 Require Import arrays_strategy_proof.

(*----- Function qcp_load_lane -----*)

Definition qcp_load_lane_safety_wit_1 := 
forall (i_pre: Z) (vl_pre: Z) (p_pre: Z) (n: Z) (A: (@list Z)) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 < vl_pre)) (PreH3 : (vl_pre <= 128)) (PreH4 : (vl_pre <= n)) (PreH5 : (n <= UINT64_MAX)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 128)) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  (UCharArray.full p_pre n A )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qcp_load_lane_return_wit_1 := 
(
forall (i_pre: Z) (vl_pre: Z) (p_pre: Z) (n: Z) (A: (@list Z)) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 < vl_pre)) (PreH3 : (vl_pre <= 128)) (PreH4 : (vl_pre <= n)) (PreH5 : (n <= UINT64_MAX)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 128)) ,
  (UCharArray.full p_pre n A )
|--
  “ (0 = (lane_load (A) (vl_pre) (i_pre))) ” 
  &&  “ (0 <= 0) ” 
  &&  “ (0 <= 255) ”
  &&  (UCharArray.full p_pre n A )
) \/
(
forall (i_pre: Z) (vl_pre: Z) (n: Z) (A: (@list Z)) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 < vl_pre)) (PreH3 : (vl_pre <= 128)) (PreH4 : (vl_pre <= n)) (PreH5 : (n <= UINT64_MAX)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 128)) ,
  TT && emp 
|--
  “ (0 = (lane_load (A) (vl_pre) (i_pre))) ”
  &&  emp
).

Definition qcp_load_lane_return_wit_1_split_goal_1 := 
forall (i_pre: Z) (vl_pre: Z) (n: Z) (A: (@list Z)) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 < vl_pre)) (PreH3 : (vl_pre <= 128)) (PreH4 : (vl_pre <= n)) (PreH5 : (n <= UINT64_MAX)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 128)) ,
  (0 = (lane_load (A) (vl_pre) (i_pre)))
.

Definition qcp_load_lane_return_wit_2 := 
(
forall (i_pre: Z) (vl_pre: Z) (p_pre: Z) (n: Z) (A: (@list Z)) (PreH1 : (i_pre < vl_pre)) (PreH2 : (0 < vl_pre)) (PreH3 : (vl_pre <= 128)) (PreH4 : (vl_pre <= n)) (PreH5 : (n <= UINT64_MAX)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 128)) ,
  (UCharArray.full p_pre n A )
|--
  “ ((Znth i_pre A 0) = (lane_load (A) (vl_pre) (i_pre))) ” 
  &&  “ (0 <= (Znth i_pre A 0)) ” 
  &&  “ ((Znth i_pre A 0) <= 255) ”
  &&  (UCharArray.full p_pre n A )
) \/
(
forall (i_pre: Z) (vl_pre: Z) (n: Z) (A: (@list Z)) (PreH1 : (i_pre < vl_pre)) (PreH2 : (0 < vl_pre)) (PreH3 : (vl_pre <= 128)) (PreH4 : (vl_pre <= n)) (PreH5 : (n <= UINT64_MAX)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 128)) ,
  TT && emp 
|--
  “ ((Znth i_pre A 0) <= 255) ” 
  &&  “ (0 <= (Znth i_pre A 0)) ” 
  &&  “ ((Znth i_pre A 0) = (lane_load (A) (vl_pre) (i_pre))) ”
  &&  emp
).

Definition qcp_load_lane_return_wit_2_split_goal_1 := 
forall (i_pre: Z) (vl_pre: Z) (n: Z) (A: (@list Z)) (PreH1 : (i_pre < vl_pre)) (PreH2 : (0 < vl_pre)) (PreH3 : (vl_pre <= 128)) (PreH4 : (vl_pre <= n)) (PreH5 : (n <= UINT64_MAX)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 128)) ,
  ((Znth i_pre A 0) <= 255)
.

Definition qcp_load_lane_return_wit_2_split_goal_2 := 
forall (i_pre: Z) (vl_pre: Z) (n: Z) (A: (@list Z)) (PreH1 : (i_pre < vl_pre)) (PreH2 : (0 < vl_pre)) (PreH3 : (vl_pre <= 128)) (PreH4 : (vl_pre <= n)) (PreH5 : (n <= UINT64_MAX)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 128)) ,
  (0 <= (Znth i_pre A 0))
.

Definition qcp_load_lane_return_wit_2_split_goal_3 := 
forall (i_pre: Z) (vl_pre: Z) (n: Z) (A: (@list Z)) (PreH1 : (i_pre < vl_pre)) (PreH2 : (0 < vl_pre)) (PreH3 : (vl_pre <= 128)) (PreH4 : (vl_pre <= n)) (PreH5 : (n <= UINT64_MAX)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 128)) ,
  ((Znth i_pre A 0) = (lane_load (A) (vl_pre) (i_pre)))
.

Definition qcp_load_lane_partial_solve_wit_1 := 
forall (i_pre: Z) (vl_pre: Z) (p_pre: Z) (n: Z) (A: (@list Z)) (PreH1 : (i_pre < vl_pre)) (PreH2 : (0 < vl_pre)) (PreH3 : (vl_pre <= 128)) (PreH4 : (vl_pre <= n)) (PreH5 : (n <= UINT64_MAX)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 128)) ,
  (UCharArray.full p_pre n A )
|--
  “ (i_pre < vl_pre) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (vl_pre <= n) ” 
  &&  “ (n <= UINT64_MAX) ” 
  &&  “ (0 <= i_pre) ” 
  &&  “ (i_pre < 128) ”
  &&  (((p_pre + (i_pre * sizeof(UCHAR)))) # UChar  |-> (Znth i_pre A 0))
  **  (UCharArray.missing_i p_pre i_pre 0 n A )
.

(*----- Function qcp_load_word -----*)

Definition qcp_load_word_safety_wit_1 := 
forall (wi_pre: Z) (vl_pre: Z) (p_pre: Z) (n: Z) (A: (@list Z)) (PreH1 : (0 < vl_pre)) (PreH2 : (vl_pre <= 128)) (PreH3 : (vl_pre <= n)) (PreH4 : (n <= UINT64_MAX)) (PreH5 : (0 <= wi_pre)) (PreH6 : (wi_pre < 32)) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "wi" ) )) # UInt64  |-> wi_pre)
  **  (UCharArray.full p_pre n A )
|--
  “ (4 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 4) ”
.

Definition qcp_load_word_safety_wit_2 := 
forall (wi_pre: Z) (vl_pre: Z) (p_pre: Z) (n: Z) (A: (@list Z)) (retval: Z) (PreH1 : (retval = (lane_load (A) (vl_pre) ((4 * wi_pre ))))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= 255)) (PreH4 : (0 < vl_pre)) (PreH5 : (vl_pre <= 128)) (PreH6 : (vl_pre <= n)) (PreH7 : (n <= UINT64_MAX)) (PreH8 : (0 <= wi_pre)) (PreH9 : (wi_pre < 32)) ,
  (UCharArray.full p_pre n A )
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "wi" ) )) # UInt64  |-> wi_pre)
|--
  “ (4 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 4) ”
.

Definition qcp_load_word_safety_wit_3 := 
forall (wi_pre: Z) (vl_pre: Z) (p_pre: Z) (n: Z) (A: (@list Z)) (retval: Z) (PreH1 : (retval = (lane_load (A) (vl_pre) ((4 * wi_pre ))))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= 255)) (PreH4 : (0 < vl_pre)) (PreH5 : (vl_pre <= 128)) (PreH6 : (vl_pre <= n)) (PreH7 : (n <= UINT64_MAX)) (PreH8 : (0 <= wi_pre)) (PreH9 : (wi_pre < 32)) ,
  (UCharArray.full p_pre n A )
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "wi" ) )) # UInt64  |-> wi_pre)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition qcp_load_word_safety_wit_4 := 
forall (wi_pre: Z) (vl_pre: Z) (p_pre: Z) (n: Z) (A: (@list Z)) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (lane_load (A) (vl_pre) (((4 * wi_pre ) + 1 ))))) (PreH2 : (0 <= retval_2)) (PreH3 : (retval_2 <= 255)) (PreH4 : (retval = (lane_load (A) (vl_pre) ((4 * wi_pre ))))) (PreH5 : (0 <= retval)) (PreH6 : (retval <= 255)) (PreH7 : (0 < vl_pre)) (PreH8 : (vl_pre <= 128)) (PreH9 : (vl_pre <= n)) (PreH10 : (n <= UINT64_MAX)) (PreH11 : (0 <= wi_pre)) (PreH12 : (wi_pre < 32)) ,
  (UCharArray.full p_pre n A )
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "wi" ) )) # UInt64  |-> wi_pre)
|--
  “ (4 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 4) ”
.

Definition qcp_load_word_safety_wit_5 := 
forall (wi_pre: Z) (vl_pre: Z) (p_pre: Z) (n: Z) (A: (@list Z)) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (lane_load (A) (vl_pre) (((4 * wi_pre ) + 1 ))))) (PreH2 : (0 <= retval_2)) (PreH3 : (retval_2 <= 255)) (PreH4 : (retval = (lane_load (A) (vl_pre) ((4 * wi_pre ))))) (PreH5 : (0 <= retval)) (PreH6 : (retval <= 255)) (PreH7 : (0 < vl_pre)) (PreH8 : (vl_pre <= 128)) (PreH9 : (vl_pre <= n)) (PreH10 : (n <= UINT64_MAX)) (PreH11 : (0 <= wi_pre)) (PreH12 : (wi_pre < 32)) ,
  (UCharArray.full p_pre n A )
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "wi" ) )) # UInt64  |-> wi_pre)
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition qcp_load_word_safety_wit_6 := 
forall (wi_pre: Z) (vl_pre: Z) (p_pre: Z) (n: Z) (A: (@list Z)) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = (lane_load (A) (vl_pre) (((4 * wi_pre ) + 2 ))))) (PreH2 : (0 <= retval_3)) (PreH3 : (retval_3 <= 255)) (PreH4 : (retval_2 = (lane_load (A) (vl_pre) (((4 * wi_pre ) + 1 ))))) (PreH5 : (0 <= retval_2)) (PreH6 : (retval_2 <= 255)) (PreH7 : (retval = (lane_load (A) (vl_pre) ((4 * wi_pre ))))) (PreH8 : (0 <= retval)) (PreH9 : (retval <= 255)) (PreH10 : (0 < vl_pre)) (PreH11 : (vl_pre <= 128)) (PreH12 : (vl_pre <= n)) (PreH13 : (n <= UINT64_MAX)) (PreH14 : (0 <= wi_pre)) (PreH15 : (wi_pre < 32)) ,
  (UCharArray.full p_pre n A )
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "wi" ) )) # UInt64  |-> wi_pre)
|--
  “ (4 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 4) ”
.

Definition qcp_load_word_safety_wit_7 := 
forall (wi_pre: Z) (vl_pre: Z) (p_pre: Z) (n: Z) (A: (@list Z)) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = (lane_load (A) (vl_pre) (((4 * wi_pre ) + 2 ))))) (PreH2 : (0 <= retval_3)) (PreH3 : (retval_3 <= 255)) (PreH4 : (retval_2 = (lane_load (A) (vl_pre) (((4 * wi_pre ) + 1 ))))) (PreH5 : (0 <= retval_2)) (PreH6 : (retval_2 <= 255)) (PreH7 : (retval = (lane_load (A) (vl_pre) ((4 * wi_pre ))))) (PreH8 : (0 <= retval)) (PreH9 : (retval <= 255)) (PreH10 : (0 < vl_pre)) (PreH11 : (vl_pre <= 128)) (PreH12 : (vl_pre <= n)) (PreH13 : (n <= UINT64_MAX)) (PreH14 : (0 <= wi_pre)) (PreH15 : (wi_pre < 32)) ,
  (UCharArray.full p_pre n A )
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "wi" ) )) # UInt64  |-> wi_pre)
|--
  “ (3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 3) ”
.

Definition qcp_load_word_return_wit_1 := 
(
forall (wi_pre: Z) (vl_pre: Z) (p_pre: Z) (n: Z) (A: (@list Z)) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval: Z) (PreH1 : (retval = (pack4 (retval_2) (retval_3) (retval_4) (retval_5)))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= UINT_MAX)) (PreH4 : (retval_5 = (lane_load (A) (vl_pre) (((4 * wi_pre ) + 3 ))))) (PreH5 : (0 <= retval_5)) (PreH6 : (retval_5 <= 255)) (PreH7 : (retval_4 = (lane_load (A) (vl_pre) (((4 * wi_pre ) + 2 ))))) (PreH8 : (0 <= retval_4)) (PreH9 : (retval_4 <= 255)) (PreH10 : (retval_3 = (lane_load (A) (vl_pre) (((4 * wi_pre ) + 1 ))))) (PreH11 : (0 <= retval_3)) (PreH12 : (retval_3 <= 255)) (PreH13 : (retval_2 = (lane_load (A) (vl_pre) ((4 * wi_pre ))))) (PreH14 : (0 <= retval_2)) (PreH15 : (retval_2 <= 255)) (PreH16 : (0 < vl_pre)) (PreH17 : (vl_pre <= 128)) (PreH18 : (vl_pre <= n)) (PreH19 : (n <= UINT64_MAX)) (PreH20 : (0 <= wi_pre)) (PreH21 : (wi_pre < 32)) ,
  (UCharArray.full p_pre n A )
|--
  “ (retval = (word_load (A) (vl_pre) (wi_pre))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= UINT_MAX) ”
  &&  (UCharArray.full p_pre n A )
) \/
(
forall (wi_pre: Z) (vl_pre: Z) (n: Z) (A: (@list Z)) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval: Z) (PreH1 : (retval = (pack4 (retval_2) (retval_3) (retval_4) (retval_5)))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= UINT_MAX)) (PreH4 : (retval_5 = (lane_load (A) (vl_pre) (((4 * wi_pre ) + 3 ))))) (PreH5 : (0 <= retval_5)) (PreH6 : (retval_5 <= 255)) (PreH7 : (retval_4 = (lane_load (A) (vl_pre) (((4 * wi_pre ) + 2 ))))) (PreH8 : (0 <= retval_4)) (PreH9 : (retval_4 <= 255)) (PreH10 : (retval_3 = (lane_load (A) (vl_pre) (((4 * wi_pre ) + 1 ))))) (PreH11 : (0 <= retval_3)) (PreH12 : (retval_3 <= 255)) (PreH13 : (retval_2 = (lane_load (A) (vl_pre) ((4 * wi_pre ))))) (PreH14 : (0 <= retval_2)) (PreH15 : (retval_2 <= 255)) (PreH16 : (0 < vl_pre)) (PreH17 : (vl_pre <= 128)) (PreH18 : (vl_pre <= n)) (PreH19 : (n <= UINT64_MAX)) (PreH20 : (0 <= wi_pre)) (PreH21 : (wi_pre < 32)) ,
  TT && emp 
|--
  “ (retval = (word_load (A) (vl_pre) (wi_pre))) ”
  &&  emp
).

Definition qcp_load_word_return_wit_1_split_goal_1 := 
forall (wi_pre: Z) (vl_pre: Z) (n: Z) (A: (@list Z)) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval: Z) (PreH1 : (retval = (pack4 (retval_2) (retval_3) (retval_4) (retval_5)))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= UINT_MAX)) (PreH4 : (retval_5 = (lane_load (A) (vl_pre) (((4 * wi_pre ) + 3 ))))) (PreH5 : (0 <= retval_5)) (PreH6 : (retval_5 <= 255)) (PreH7 : (retval_4 = (lane_load (A) (vl_pre) (((4 * wi_pre ) + 2 ))))) (PreH8 : (0 <= retval_4)) (PreH9 : (retval_4 <= 255)) (PreH10 : (retval_3 = (lane_load (A) (vl_pre) (((4 * wi_pre ) + 1 ))))) (PreH11 : (0 <= retval_3)) (PreH12 : (retval_3 <= 255)) (PreH13 : (retval_2 = (lane_load (A) (vl_pre) ((4 * wi_pre ))))) (PreH14 : (0 <= retval_2)) (PreH15 : (retval_2 <= 255)) (PreH16 : (0 < vl_pre)) (PreH17 : (vl_pre <= 128)) (PreH18 : (vl_pre <= n)) (PreH19 : (n <= UINT64_MAX)) (PreH20 : (0 <= wi_pre)) (PreH21 : (wi_pre < 32)) ,
  (retval = (word_load (A) (vl_pre) (wi_pre)))
.

Definition qcp_load_word_partial_solve_wit_1_pure := 
forall (wi_pre: Z) (vl_pre: Z) (p_pre: Z) (n: Z) (A: (@list Z)) (PreH1 : (0 < vl_pre)) (PreH2 : (vl_pre <= 128)) (PreH3 : (vl_pre <= n)) (PreH4 : (n <= UINT64_MAX)) (PreH5 : (0 <= wi_pre)) (PreH6 : (wi_pre < 32)) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "wi" ) )) # UInt64  |-> wi_pre)
  **  (UCharArray.full p_pre n A )
|--
  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (vl_pre <= n) ” 
  &&  “ (n <= UINT64_MAX) ” 
  &&  “ (0 <= (4 * wi_pre )) ” 
  &&  “ ((4 * wi_pre ) < 128) ”
.

Definition qcp_load_word_partial_solve_wit_1_aux := 
forall (wi_pre: Z) (vl_pre: Z) (p_pre: Z) (n: Z) (A: (@list Z)) (PreH1 : (0 < vl_pre)) (PreH2 : (vl_pre <= 128)) (PreH3 : (vl_pre <= n)) (PreH4 : (n <= UINT64_MAX)) (PreH5 : (0 <= wi_pre)) (PreH6 : (wi_pre < 32)) ,
  (UCharArray.full p_pre n A )
|--
  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (vl_pre <= n) ” 
  &&  “ (n <= UINT64_MAX) ” 
  &&  “ (0 <= (4 * wi_pre )) ” 
  &&  “ ((4 * wi_pre ) < 128) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (vl_pre <= n) ” 
  &&  “ (n <= UINT64_MAX) ” 
  &&  “ (0 <= wi_pre) ” 
  &&  “ (wi_pre < 32) ”
  &&  (UCharArray.full p_pre n A )
.

Definition qcp_load_word_partial_solve_wit_1 := qcp_load_word_partial_solve_wit_1_pure -> qcp_load_word_partial_solve_wit_1_aux.

Definition qcp_load_word_partial_solve_wit_2_pure := 
forall (wi_pre: Z) (vl_pre: Z) (p_pre: Z) (n: Z) (A: (@list Z)) (retval: Z) (PreH1 : (retval = (lane_load (A) (vl_pre) ((4 * wi_pre ))))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= 255)) (PreH4 : (0 < vl_pre)) (PreH5 : (vl_pre <= 128)) (PreH6 : (vl_pre <= n)) (PreH7 : (n <= UINT64_MAX)) (PreH8 : (0 <= wi_pre)) (PreH9 : (wi_pre < 32)) ,
  (UCharArray.full p_pre n A )
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "wi" ) )) # UInt64  |-> wi_pre)
|--
  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (vl_pre <= n) ” 
  &&  “ (n <= UINT64_MAX) ” 
  &&  “ (0 <= ((4 * wi_pre ) + 1 )) ” 
  &&  “ (((4 * wi_pre ) + 1 ) < 128) ”
.

Definition qcp_load_word_partial_solve_wit_2_aux := 
forall (wi_pre: Z) (vl_pre: Z) (p_pre: Z) (n: Z) (A: (@list Z)) (retval: Z) (PreH1 : (retval = (lane_load (A) (vl_pre) ((4 * wi_pre ))))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= 255)) (PreH4 : (0 < vl_pre)) (PreH5 : (vl_pre <= 128)) (PreH6 : (vl_pre <= n)) (PreH7 : (n <= UINT64_MAX)) (PreH8 : (0 <= wi_pre)) (PreH9 : (wi_pre < 32)) ,
  (UCharArray.full p_pre n A )
|--
  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (vl_pre <= n) ” 
  &&  “ (n <= UINT64_MAX) ” 
  &&  “ (0 <= ((4 * wi_pre ) + 1 )) ” 
  &&  “ (((4 * wi_pre ) + 1 ) < 128) ” 
  &&  “ (retval = (lane_load (A) (vl_pre) ((4 * wi_pre )))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 255) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (vl_pre <= n) ” 
  &&  “ (n <= UINT64_MAX) ” 
  &&  “ (0 <= wi_pre) ” 
  &&  “ (wi_pre < 32) ”
  &&  (UCharArray.full p_pre n A )
.

Definition qcp_load_word_partial_solve_wit_2 := qcp_load_word_partial_solve_wit_2_pure -> qcp_load_word_partial_solve_wit_2_aux.

Definition qcp_load_word_partial_solve_wit_3_pure := 
forall (wi_pre: Z) (vl_pre: Z) (p_pre: Z) (n: Z) (A: (@list Z)) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (lane_load (A) (vl_pre) (((4 * wi_pre ) + 1 ))))) (PreH2 : (0 <= retval_2)) (PreH3 : (retval_2 <= 255)) (PreH4 : (retval = (lane_load (A) (vl_pre) ((4 * wi_pre ))))) (PreH5 : (0 <= retval)) (PreH6 : (retval <= 255)) (PreH7 : (0 < vl_pre)) (PreH8 : (vl_pre <= 128)) (PreH9 : (vl_pre <= n)) (PreH10 : (n <= UINT64_MAX)) (PreH11 : (0 <= wi_pre)) (PreH12 : (wi_pre < 32)) ,
  (UCharArray.full p_pre n A )
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "wi" ) )) # UInt64  |-> wi_pre)
|--
  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (vl_pre <= n) ” 
  &&  “ (n <= UINT64_MAX) ” 
  &&  “ (0 <= ((4 * wi_pre ) + 2 )) ” 
  &&  “ (((4 * wi_pre ) + 2 ) < 128) ”
.

Definition qcp_load_word_partial_solve_wit_3_aux := 
forall (wi_pre: Z) (vl_pre: Z) (p_pre: Z) (n: Z) (A: (@list Z)) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (lane_load (A) (vl_pre) (((4 * wi_pre ) + 1 ))))) (PreH2 : (0 <= retval_2)) (PreH3 : (retval_2 <= 255)) (PreH4 : (retval = (lane_load (A) (vl_pre) ((4 * wi_pre ))))) (PreH5 : (0 <= retval)) (PreH6 : (retval <= 255)) (PreH7 : (0 < vl_pre)) (PreH8 : (vl_pre <= 128)) (PreH9 : (vl_pre <= n)) (PreH10 : (n <= UINT64_MAX)) (PreH11 : (0 <= wi_pre)) (PreH12 : (wi_pre < 32)) ,
  (UCharArray.full p_pre n A )
|--
  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (vl_pre <= n) ” 
  &&  “ (n <= UINT64_MAX) ” 
  &&  “ (0 <= ((4 * wi_pre ) + 2 )) ” 
  &&  “ (((4 * wi_pre ) + 2 ) < 128) ” 
  &&  “ (retval_2 = (lane_load (A) (vl_pre) (((4 * wi_pre ) + 1 )))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= 255) ” 
  &&  “ (retval = (lane_load (A) (vl_pre) ((4 * wi_pre )))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 255) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (vl_pre <= n) ” 
  &&  “ (n <= UINT64_MAX) ” 
  &&  “ (0 <= wi_pre) ” 
  &&  “ (wi_pre < 32) ”
  &&  (UCharArray.full p_pre n A )
.

Definition qcp_load_word_partial_solve_wit_3 := qcp_load_word_partial_solve_wit_3_pure -> qcp_load_word_partial_solve_wit_3_aux.

Definition qcp_load_word_partial_solve_wit_4_pure := 
forall (wi_pre: Z) (vl_pre: Z) (p_pre: Z) (n: Z) (A: (@list Z)) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = (lane_load (A) (vl_pre) (((4 * wi_pre ) + 2 ))))) (PreH2 : (0 <= retval_3)) (PreH3 : (retval_3 <= 255)) (PreH4 : (retval_2 = (lane_load (A) (vl_pre) (((4 * wi_pre ) + 1 ))))) (PreH5 : (0 <= retval_2)) (PreH6 : (retval_2 <= 255)) (PreH7 : (retval = (lane_load (A) (vl_pre) ((4 * wi_pre ))))) (PreH8 : (0 <= retval)) (PreH9 : (retval <= 255)) (PreH10 : (0 < vl_pre)) (PreH11 : (vl_pre <= 128)) (PreH12 : (vl_pre <= n)) (PreH13 : (n <= UINT64_MAX)) (PreH14 : (0 <= wi_pre)) (PreH15 : (wi_pre < 32)) ,
  (UCharArray.full p_pre n A )
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "wi" ) )) # UInt64  |-> wi_pre)
|--
  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (vl_pre <= n) ” 
  &&  “ (n <= UINT64_MAX) ” 
  &&  “ (0 <= ((4 * wi_pre ) + 3 )) ” 
  &&  “ (((4 * wi_pre ) + 3 ) < 128) ”
.

Definition qcp_load_word_partial_solve_wit_4_aux := 
forall (wi_pre: Z) (vl_pre: Z) (p_pre: Z) (n: Z) (A: (@list Z)) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = (lane_load (A) (vl_pre) (((4 * wi_pre ) + 2 ))))) (PreH2 : (0 <= retval_3)) (PreH3 : (retval_3 <= 255)) (PreH4 : (retval_2 = (lane_load (A) (vl_pre) (((4 * wi_pre ) + 1 ))))) (PreH5 : (0 <= retval_2)) (PreH6 : (retval_2 <= 255)) (PreH7 : (retval = (lane_load (A) (vl_pre) ((4 * wi_pre ))))) (PreH8 : (0 <= retval)) (PreH9 : (retval <= 255)) (PreH10 : (0 < vl_pre)) (PreH11 : (vl_pre <= 128)) (PreH12 : (vl_pre <= n)) (PreH13 : (n <= UINT64_MAX)) (PreH14 : (0 <= wi_pre)) (PreH15 : (wi_pre < 32)) ,
  (UCharArray.full p_pre n A )
|--
  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (vl_pre <= n) ” 
  &&  “ (n <= UINT64_MAX) ” 
  &&  “ (0 <= ((4 * wi_pre ) + 3 )) ” 
  &&  “ (((4 * wi_pre ) + 3 ) < 128) ” 
  &&  “ (retval_3 = (lane_load (A) (vl_pre) (((4 * wi_pre ) + 2 )))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= 255) ” 
  &&  “ (retval_2 = (lane_load (A) (vl_pre) (((4 * wi_pre ) + 1 )))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= 255) ” 
  &&  “ (retval = (lane_load (A) (vl_pre) ((4 * wi_pre )))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 255) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (vl_pre <= n) ” 
  &&  “ (n <= UINT64_MAX) ” 
  &&  “ (0 <= wi_pre) ” 
  &&  “ (wi_pre < 32) ”
  &&  (UCharArray.full p_pre n A )
.

Definition qcp_load_word_partial_solve_wit_4 := qcp_load_word_partial_solve_wit_4_pure -> qcp_load_word_partial_solve_wit_4_aux.

Definition qcp_load_word_partial_solve_wit_5_pure := 
forall (wi_pre: Z) (vl_pre: Z) (p_pre: Z) (n: Z) (A: (@list Z)) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_4 = (lane_load (A) (vl_pre) (((4 * wi_pre ) + 3 ))))) (PreH2 : (0 <= retval_4)) (PreH3 : (retval_4 <= 255)) (PreH4 : (retval_3 = (lane_load (A) (vl_pre) (((4 * wi_pre ) + 2 ))))) (PreH5 : (0 <= retval_3)) (PreH6 : (retval_3 <= 255)) (PreH7 : (retval_2 = (lane_load (A) (vl_pre) (((4 * wi_pre ) + 1 ))))) (PreH8 : (0 <= retval_2)) (PreH9 : (retval_2 <= 255)) (PreH10 : (retval = (lane_load (A) (vl_pre) ((4 * wi_pre ))))) (PreH11 : (0 <= retval)) (PreH12 : (retval <= 255)) (PreH13 : (0 < vl_pre)) (PreH14 : (vl_pre <= 128)) (PreH15 : (vl_pre <= n)) (PreH16 : (n <= UINT64_MAX)) (PreH17 : (0 <= wi_pre)) (PreH18 : (wi_pre < 32)) ,
  (UCharArray.full p_pre n A )
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "wi" ) )) # UInt64  |-> wi_pre)
|--
  “ (0 <= retval) ” 
  &&  “ (retval <= 255) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= 255) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= 255) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= 255) ”
.

Definition qcp_load_word_partial_solve_wit_5_aux := 
forall (wi_pre: Z) (vl_pre: Z) (p_pre: Z) (n: Z) (A: (@list Z)) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_4 = (lane_load (A) (vl_pre) (((4 * wi_pre ) + 3 ))))) (PreH2 : (0 <= retval_4)) (PreH3 : (retval_4 <= 255)) (PreH4 : (retval_3 = (lane_load (A) (vl_pre) (((4 * wi_pre ) + 2 ))))) (PreH5 : (0 <= retval_3)) (PreH6 : (retval_3 <= 255)) (PreH7 : (retval_2 = (lane_load (A) (vl_pre) (((4 * wi_pre ) + 1 ))))) (PreH8 : (0 <= retval_2)) (PreH9 : (retval_2 <= 255)) (PreH10 : (retval = (lane_load (A) (vl_pre) ((4 * wi_pre ))))) (PreH11 : (0 <= retval)) (PreH12 : (retval <= 255)) (PreH13 : (0 < vl_pre)) (PreH14 : (vl_pre <= 128)) (PreH15 : (vl_pre <= n)) (PreH16 : (n <= UINT64_MAX)) (PreH17 : (0 <= wi_pre)) (PreH18 : (wi_pre < 32)) ,
  (UCharArray.full p_pre n A )
|--
  “ (0 <= retval) ” 
  &&  “ (retval <= 255) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= 255) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= 255) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= 255) ” 
  &&  “ (retval_4 = (lane_load (A) (vl_pre) (((4 * wi_pre ) + 3 )))) ” 
  &&  “ (0 <= retval_4) ” 
  &&  “ (retval_4 <= 255) ” 
  &&  “ (retval_3 = (lane_load (A) (vl_pre) (((4 * wi_pre ) + 2 )))) ” 
  &&  “ (0 <= retval_3) ” 
  &&  “ (retval_3 <= 255) ” 
  &&  “ (retval_2 = (lane_load (A) (vl_pre) (((4 * wi_pre ) + 1 )))) ” 
  &&  “ (0 <= retval_2) ” 
  &&  “ (retval_2 <= 255) ” 
  &&  “ (retval = (lane_load (A) (vl_pre) ((4 * wi_pre )))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 255) ” 
  &&  “ (0 < vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (vl_pre <= n) ” 
  &&  “ (n <= UINT64_MAX) ” 
  &&  “ (0 <= wi_pre) ” 
  &&  “ (wi_pre < 32) ”
  &&  (UCharArray.full p_pre n A )
.

Definition qcp_load_word_partial_solve_wit_5 := qcp_load_word_partial_solve_wit_5_pure -> qcp_load_word_partial_solve_wit_5_aux.

Module Type VC_Correct.

Include arrays_Strategy_Correct.

Axiom proof_of_qcp_load_lane_safety_wit_1 : qcp_load_lane_safety_wit_1.
Axiom proof_of_qcp_load_lane_return_wit_1 : qcp_load_lane_return_wit_1.
Axiom proof_of_qcp_load_lane_return_wit_2 : qcp_load_lane_return_wit_2.
Axiom proof_of_qcp_load_lane_partial_solve_wit_1 : qcp_load_lane_partial_solve_wit_1.
Axiom proof_of_qcp_load_word_safety_wit_1 : qcp_load_word_safety_wit_1.
Axiom proof_of_qcp_load_word_safety_wit_2 : qcp_load_word_safety_wit_2.
Axiom proof_of_qcp_load_word_safety_wit_3 : qcp_load_word_safety_wit_3.
Axiom proof_of_qcp_load_word_safety_wit_4 : qcp_load_word_safety_wit_4.
Axiom proof_of_qcp_load_word_safety_wit_5 : qcp_load_word_safety_wit_5.
Axiom proof_of_qcp_load_word_safety_wit_6 : qcp_load_word_safety_wit_6.
Axiom proof_of_qcp_load_word_safety_wit_7 : qcp_load_word_safety_wit_7.
Axiom proof_of_qcp_load_word_return_wit_1 : qcp_load_word_return_wit_1.
Axiom proof_of_qcp_load_word_partial_solve_wit_1_pure : qcp_load_word_partial_solve_wit_1_pure.
Axiom proof_of_qcp_load_word_partial_solve_wit_1 : qcp_load_word_partial_solve_wit_1.
Axiom proof_of_qcp_load_word_partial_solve_wit_2_pure : qcp_load_word_partial_solve_wit_2_pure.
Axiom proof_of_qcp_load_word_partial_solve_wit_2 : qcp_load_word_partial_solve_wit_2.
Axiom proof_of_qcp_load_word_partial_solve_wit_3_pure : qcp_load_word_partial_solve_wit_3_pure.
Axiom proof_of_qcp_load_word_partial_solve_wit_3 : qcp_load_word_partial_solve_wit_3.
Axiom proof_of_qcp_load_word_partial_solve_wit_4_pure : qcp_load_word_partial_solve_wit_4_pure.
Axiom proof_of_qcp_load_word_partial_solve_wit_4 : qcp_load_word_partial_solve_wit_4.
Axiom proof_of_qcp_load_word_partial_solve_wit_5_pure : qcp_load_word_partial_solve_wit_5_pure.
Axiom proof_of_qcp_load_word_partial_solve_wit_5 : qcp_load_word_partial_solve_wit_5.

End VC_Correct.
