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
Require Import Qs8Rdsum.VectorModel.
Local Open Scope sac.

(*----- Function rdsum_wadd16 -----*)

Definition rdsum_wadd16_safety_wit_1 := 
forall (b_pre: Z) (a_pre: Z) (PreH1 : ((-32768) <= a_pre)) (PreH2 : (a_pre <= 32767)) (PreH3 : ((-128) <= b_pre)) (PreH4 : (b_pre <= 127)) ,
  ((( &( "sum" ) )) # Int  |->_)
  **  ((( &( "a" ) )) # Short  |-> a_pre)
  **  ((( &( "b" ) )) # Char  |-> b_pre)
|--
  “ ((a_pre + b_pre ) <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= (a_pre + b_pre )) ”
.

Definition rdsum_wadd16_return_wit_1 := 
(
forall (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (rs_s16 ((a_pre + b_pre ))))) (PreH2 : ((-32768) <= retval)) (PreH3 : (retval <= 32767)) (PreH4 : ((-32768) <= a_pre)) (PreH5 : (a_pre <= 32767)) (PreH6 : ((-128) <= b_pre)) (PreH7 : (b_pre <= 127)) ,
  TT && emp 
|--
  “ (retval = (rd_wadd16 (a_pre) (b_pre))) ” 
  &&  “ ((-32768) <= retval) ” 
  &&  “ (retval <= 32767) ”
  &&  emp
) \/
(
forall (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (rs_s16 ((a_pre + b_pre ))))) (PreH2 : ((-32768) <= retval)) (PreH3 : (retval <= 32767)) (PreH4 : ((-32768) <= a_pre)) (PreH5 : (a_pre <= 32767)) (PreH6 : ((-128) <= b_pre)) (PreH7 : (b_pre <= 127)) ,
  TT && emp 
|--
  “ (retval = (rd_wadd16 (a_pre) (b_pre))) ”
  &&  emp
).

Definition rdsum_wadd16_return_wit_1_split_goal_1 := 
forall (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (rs_s16 ((a_pre + b_pre ))))) (PreH2 : ((-32768) <= retval)) (PreH3 : (retval <= 32767)) (PreH4 : ((-32768) <= a_pre)) (PreH5 : (a_pre <= 32767)) (PreH6 : ((-128) <= b_pre)) (PreH7 : (b_pre <= 127)) ,
  (retval = (rd_wadd16 (a_pre) (b_pre)))
.

Definition rdsum_wadd16_partial_solve_wit_1_pure := 
forall (b_pre: Z) (a_pre: Z) (PreH1 : ((-32768) <= a_pre)) (PreH2 : (a_pre <= 32767)) (PreH3 : ((-128) <= b_pre)) (PreH4 : (b_pre <= 127)) ,
  ((( &( "sum" ) )) # Int  |-> (a_pre + b_pre ))
  **  ((( &( "a" ) )) # Short  |-> a_pre)
  **  ((( &( "b" ) )) # Char  |-> b_pre)
|--
  “ ((INT_MIN) <= (a_pre + b_pre )) ” 
  &&  “ ((a_pre + b_pre ) <= INT_MAX) ”
.

Definition rdsum_wadd16_partial_solve_wit_1_aux := 
forall (b_pre: Z) (a_pre: Z) (PreH1 : ((-32768) <= a_pre)) (PreH2 : (a_pre <= 32767)) (PreH3 : ((-128) <= b_pre)) (PreH4 : (b_pre <= 127)) ,
  TT && emp 
|--
  “ ((INT_MIN) <= (a_pre + b_pre )) ” 
  &&  “ ((a_pre + b_pre ) <= INT_MAX) ” 
  &&  “ ((-32768) <= a_pre) ” 
  &&  “ (a_pre <= 32767) ” 
  &&  “ ((-128) <= b_pre) ” 
  &&  “ (b_pre <= 127) ”
  &&  emp
.

Definition rdsum_wadd16_partial_solve_wit_1 := rdsum_wadd16_partial_solve_wit_1_pure -> rdsum_wadd16_partial_solve_wit_1_aux.

(*----- Function rdsum_active_wadd16 -----*)

Definition rdsum_active_wadd16_safety_wit_1 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : ((-32768) <= a_pre)) (PreH3 : (a_pre <= 32767)) (PreH4 : ((-128) <= b_pre)) (PreH5 : (b_pre <= 127)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre <= UINT64_MAX)) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= UINT64_MAX)) ,
  ((( &( "a" ) )) # Short  |-> a_pre)
  **  ((( &( "b" ) )) # Char  |-> b_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition rdsum_active_wadd16_return_wit_1 := 
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : ((-32768) <= a_pre)) (PreH3 : (a_pre <= 32767)) (PreH4 : ((-128) <= b_pre)) (PreH5 : (b_pre <= 127)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre <= UINT64_MAX)) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= UINT64_MAX)) ,
  TT && emp 
|--
  “ (0 = (rd_active_wadd16 (a_pre) (b_pre) (i_pre) (vl_pre))) ” 
  &&  “ ((-32768) <= 0) ” 
  &&  “ (0 <= 32767) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : ((-32768) <= a_pre)) (PreH3 : (a_pre <= 32767)) (PreH4 : ((-128) <= b_pre)) (PreH5 : (b_pre <= 127)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre <= UINT64_MAX)) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= UINT64_MAX)) ,
  TT && emp 
|--
  “ (0 = (rd_active_wadd16 (a_pre) (b_pre) (i_pre) (vl_pre))) ”
  &&  emp
).

Definition rdsum_active_wadd16_return_wit_1_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : ((-32768) <= a_pre)) (PreH3 : (a_pre <= 32767)) (PreH4 : ((-128) <= b_pre)) (PreH5 : (b_pre <= 127)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre <= UINT64_MAX)) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= UINT64_MAX)) ,
  (0 = (rd_active_wadd16 (a_pre) (b_pre) (i_pre) (vl_pre)))
.

Definition rdsum_active_wadd16_return_wit_2 := 
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (rd_wadd16 (a_pre) (b_pre)))) (PreH2 : ((-32768) <= retval)) (PreH3 : (retval <= 32767)) (PreH4 : (i_pre < vl_pre)) (PreH5 : ((-32768) <= a_pre)) (PreH6 : (a_pre <= 32767)) (PreH7 : ((-128) <= b_pre)) (PreH8 : (b_pre <= 127)) (PreH9 : (0 <= i_pre)) (PreH10 : (i_pre <= UINT64_MAX)) (PreH11 : (0 <= vl_pre)) (PreH12 : (vl_pre <= UINT64_MAX)) ,
  TT && emp 
|--
  “ (retval = (rd_active_wadd16 (a_pre) (b_pre) (i_pre) (vl_pre))) ” 
  &&  “ ((-32768) <= retval) ” 
  &&  “ (retval <= 32767) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (rd_wadd16 (a_pre) (b_pre)))) (PreH2 : ((-32768) <= retval)) (PreH3 : (retval <= 32767)) (PreH4 : (i_pre < vl_pre)) (PreH5 : ((-32768) <= a_pre)) (PreH6 : (a_pre <= 32767)) (PreH7 : ((-128) <= b_pre)) (PreH8 : (b_pre <= 127)) (PreH9 : (0 <= i_pre)) (PreH10 : (i_pre <= UINT64_MAX)) (PreH11 : (0 <= vl_pre)) (PreH12 : (vl_pre <= UINT64_MAX)) ,
  TT && emp 
|--
  “ (retval = (rd_active_wadd16 (a_pre) (b_pre) (i_pre) (vl_pre))) ”
  &&  emp
).

Definition rdsum_active_wadd16_return_wit_2_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (rd_wadd16 (a_pre) (b_pre)))) (PreH2 : ((-32768) <= retval)) (PreH3 : (retval <= 32767)) (PreH4 : (i_pre < vl_pre)) (PreH5 : ((-32768) <= a_pre)) (PreH6 : (a_pre <= 32767)) (PreH7 : ((-128) <= b_pre)) (PreH8 : (b_pre <= 127)) (PreH9 : (0 <= i_pre)) (PreH10 : (i_pre <= UINT64_MAX)) (PreH11 : (0 <= vl_pre)) (PreH12 : (vl_pre <= UINT64_MAX)) ,
  (retval = (rd_active_wadd16 (a_pre) (b_pre) (i_pre) (vl_pre)))
.

Definition rdsum_active_wadd16_partial_solve_wit_1_pure := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : ((-32768) <= a_pre)) (PreH3 : (a_pre <= 32767)) (PreH4 : ((-128) <= b_pre)) (PreH5 : (b_pre <= 127)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre <= UINT64_MAX)) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= UINT64_MAX)) ,
  ((( &( "a" ) )) # Short  |-> a_pre)
  **  ((( &( "b" ) )) # Char  |-> b_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ ((-32768) <= a_pre) ” 
  &&  “ (a_pre <= 32767) ” 
  &&  “ ((-128) <= b_pre) ” 
  &&  “ (b_pre <= 127) ”
.

Definition rdsum_active_wadd16_partial_solve_wit_1_aux := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : ((-32768) <= a_pre)) (PreH3 : (a_pre <= 32767)) (PreH4 : ((-128) <= b_pre)) (PreH5 : (b_pre <= 127)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre <= UINT64_MAX)) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= UINT64_MAX)) ,
  TT && emp 
|--
  “ ((-32768) <= a_pre) ” 
  &&  “ (a_pre <= 32767) ” 
  &&  “ ((-128) <= b_pre) ” 
  &&  “ (b_pre <= 127) ” 
  &&  “ (i_pre < vl_pre) ” 
  &&  “ ((-32768) <= a_pre) ” 
  &&  “ (a_pre <= 32767) ” 
  &&  “ ((-128) <= b_pre) ” 
  &&  “ (b_pre <= 127) ” 
  &&  “ (0 <= i_pre) ” 
  &&  “ (i_pre <= UINT64_MAX) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= UINT64_MAX) ”
  &&  emp
.

Definition rdsum_active_wadd16_partial_solve_wit_1 := rdsum_active_wadd16_partial_solve_wit_1_pure -> rdsum_active_wadd16_partial_solve_wit_1_aux.

(*----- Function rdsum_active_wadd32 -----*)

Definition rdsum_active_wadd32_safety_wit_1 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : ((INT_MIN) <= a_pre)) (PreH3 : (a_pre <= INT_MAX)) (PreH4 : ((-32768) <= b_pre)) (PreH5 : (b_pre <= 32767)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre <= UINT64_MAX)) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= UINT64_MAX)) ,
  ((( &( "a" ) )) # Int  |-> a_pre)
  **  ((( &( "b" ) )) # Short  |-> b_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition rdsum_active_wadd32_return_wit_1 := 
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : ((INT_MIN) <= a_pre)) (PreH3 : (a_pre <= INT_MAX)) (PreH4 : ((-32768) <= b_pre)) (PreH5 : (b_pre <= 32767)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre <= UINT64_MAX)) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= UINT64_MAX)) ,
  TT && emp 
|--
  “ (0 = (rd_active_wadd32 (a_pre) (b_pre) (i_pre) (vl_pre))) ” 
  &&  “ ((INT_MIN) <= 0) ” 
  &&  “ (0 <= INT_MAX) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : ((INT_MIN) <= a_pre)) (PreH3 : (a_pre <= INT_MAX)) (PreH4 : ((-32768) <= b_pre)) (PreH5 : (b_pre <= 32767)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre <= UINT64_MAX)) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= UINT64_MAX)) ,
  TT && emp 
|--
  “ (0 = (rd_active_wadd32 (a_pre) (b_pre) (i_pre) (vl_pre))) ”
  &&  emp
).

Definition rdsum_active_wadd32_return_wit_1_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : ((INT_MIN) <= a_pre)) (PreH3 : (a_pre <= INT_MAX)) (PreH4 : ((-32768) <= b_pre)) (PreH5 : (b_pre <= 32767)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre <= UINT64_MAX)) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= UINT64_MAX)) ,
  (0 = (rd_active_wadd32 (a_pre) (b_pre) (i_pre) (vl_pre)))
.

Definition rdsum_active_wadd32_return_wit_2 := 
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (rs_add_s32 (a_pre) (b_pre)))) (PreH2 : ((INT_MIN) <= retval)) (PreH3 : (retval <= INT_MAX)) (PreH4 : (i_pre < vl_pre)) (PreH5 : ((INT_MIN) <= a_pre)) (PreH6 : (a_pre <= INT_MAX)) (PreH7 : ((-32768) <= b_pre)) (PreH8 : (b_pre <= 32767)) (PreH9 : (0 <= i_pre)) (PreH10 : (i_pre <= UINT64_MAX)) (PreH11 : (0 <= vl_pre)) (PreH12 : (vl_pre <= UINT64_MAX)) ,
  TT && emp 
|--
  “ (retval = (rd_active_wadd32 (a_pre) (b_pre) (i_pre) (vl_pre))) ” 
  &&  “ ((INT_MIN) <= retval) ” 
  &&  “ (retval <= INT_MAX) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (rs_add_s32 (a_pre) (b_pre)))) (PreH2 : ((INT_MIN) <= retval)) (PreH3 : (retval <= INT_MAX)) (PreH4 : (i_pre < vl_pre)) (PreH5 : ((INT_MIN) <= a_pre)) (PreH6 : (a_pre <= INT_MAX)) (PreH7 : ((-32768) <= b_pre)) (PreH8 : (b_pre <= 32767)) (PreH9 : (0 <= i_pre)) (PreH10 : (i_pre <= UINT64_MAX)) (PreH11 : (0 <= vl_pre)) (PreH12 : (vl_pre <= UINT64_MAX)) ,
  TT && emp 
|--
  “ (retval = (rd_active_wadd32 (a_pre) (b_pre) (i_pre) (vl_pre))) ”
  &&  emp
).

Definition rdsum_active_wadd32_return_wit_2_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (rs_add_s32 (a_pre) (b_pre)))) (PreH2 : ((INT_MIN) <= retval)) (PreH3 : (retval <= INT_MAX)) (PreH4 : (i_pre < vl_pre)) (PreH5 : ((INT_MIN) <= a_pre)) (PreH6 : (a_pre <= INT_MAX)) (PreH7 : ((-32768) <= b_pre)) (PreH8 : (b_pre <= 32767)) (PreH9 : (0 <= i_pre)) (PreH10 : (i_pre <= UINT64_MAX)) (PreH11 : (0 <= vl_pre)) (PreH12 : (vl_pre <= UINT64_MAX)) ,
  (retval = (rd_active_wadd32 (a_pre) (b_pre) (i_pre) (vl_pre)))
.

Definition rdsum_active_wadd32_partial_solve_wit_1_pure := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : ((INT_MIN) <= a_pre)) (PreH3 : (a_pre <= INT_MAX)) (PreH4 : ((-32768) <= b_pre)) (PreH5 : (b_pre <= 32767)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre <= UINT64_MAX)) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= UINT64_MAX)) ,
  ((( &( "a" ) )) # Int  |-> a_pre)
  **  ((( &( "b" ) )) # Short  |-> b_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ ((INT_MIN) <= a_pre) ” 
  &&  “ (a_pre <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b_pre) ” 
  &&  “ (b_pre <= INT_MAX) ”
.

Definition rdsum_active_wadd32_partial_solve_wit_1_aux := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : ((INT_MIN) <= a_pre)) (PreH3 : (a_pre <= INT_MAX)) (PreH4 : ((-32768) <= b_pre)) (PreH5 : (b_pre <= 32767)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre <= UINT64_MAX)) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= UINT64_MAX)) ,
  TT && emp 
|--
  “ ((INT_MIN) <= a_pre) ” 
  &&  “ (a_pre <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= b_pre) ” 
  &&  “ (b_pre <= INT_MAX) ” 
  &&  “ (i_pre < vl_pre) ” 
  &&  “ ((INT_MIN) <= a_pre) ” 
  &&  “ (a_pre <= INT_MAX) ” 
  &&  “ ((-32768) <= b_pre) ” 
  &&  “ (b_pre <= 32767) ” 
  &&  “ (0 <= i_pre) ” 
  &&  “ (i_pre <= UINT64_MAX) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= UINT64_MAX) ”
  &&  emp
.

Definition rdsum_active_wadd32_partial_solve_wit_1 := rdsum_active_wadd32_partial_solve_wit_1_pure -> rdsum_active_wadd32_partial_solve_wit_1_aux.

(*----- Function rdsum_active_add32 -----*)

Definition rdsum_active_add32_safety_wit_1 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : ((INT_MIN) <= a_pre)) (PreH3 : (a_pre <= INT_MAX)) (PreH4 : ((INT_MIN) <= b_pre)) (PreH5 : (b_pre <= INT_MAX)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre <= UINT64_MAX)) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= UINT64_MAX)) ,
  ((( &( "a" ) )) # Int  |-> a_pre)
  **  ((( &( "b" ) )) # Int  |-> b_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition rdsum_active_add32_return_wit_1 := 
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : ((INT_MIN) <= a_pre)) (PreH3 : (a_pre <= INT_MAX)) (PreH4 : ((INT_MIN) <= b_pre)) (PreH5 : (b_pre <= INT_MAX)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre <= UINT64_MAX)) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= UINT64_MAX)) ,
  TT && emp 
|--
  “ (0 = (rd_active_wadd32 (a_pre) (b_pre) (i_pre) (vl_pre))) ” 
  &&  “ ((INT_MIN) <= 0) ” 
  &&  “ (0 <= INT_MAX) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : ((INT_MIN) <= a_pre)) (PreH3 : (a_pre <= INT_MAX)) (PreH4 : ((INT_MIN) <= b_pre)) (PreH5 : (b_pre <= INT_MAX)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre <= UINT64_MAX)) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= UINT64_MAX)) ,
  TT && emp 
|--
  “ (0 = (rd_active_wadd32 (a_pre) (b_pre) (i_pre) (vl_pre))) ”
  &&  emp
).

Definition rdsum_active_add32_return_wit_1_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : ((INT_MIN) <= a_pre)) (PreH3 : (a_pre <= INT_MAX)) (PreH4 : ((INT_MIN) <= b_pre)) (PreH5 : (b_pre <= INT_MAX)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre <= UINT64_MAX)) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= UINT64_MAX)) ,
  (0 = (rd_active_wadd32 (a_pre) (b_pre) (i_pre) (vl_pre)))
.

Definition rdsum_active_add32_return_wit_2 := 
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (rs_add_s32 (a_pre) (b_pre)))) (PreH2 : ((INT_MIN) <= retval)) (PreH3 : (retval <= INT_MAX)) (PreH4 : (i_pre < vl_pre)) (PreH5 : ((INT_MIN) <= a_pre)) (PreH6 : (a_pre <= INT_MAX)) (PreH7 : ((INT_MIN) <= b_pre)) (PreH8 : (b_pre <= INT_MAX)) (PreH9 : (0 <= i_pre)) (PreH10 : (i_pre <= UINT64_MAX)) (PreH11 : (0 <= vl_pre)) (PreH12 : (vl_pre <= UINT64_MAX)) ,
  TT && emp 
|--
  “ (retval = (rd_active_wadd32 (a_pre) (b_pre) (i_pre) (vl_pre))) ” 
  &&  “ ((INT_MIN) <= retval) ” 
  &&  “ (retval <= INT_MAX) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (rs_add_s32 (a_pre) (b_pre)))) (PreH2 : ((INT_MIN) <= retval)) (PreH3 : (retval <= INT_MAX)) (PreH4 : (i_pre < vl_pre)) (PreH5 : ((INT_MIN) <= a_pre)) (PreH6 : (a_pre <= INT_MAX)) (PreH7 : ((INT_MIN) <= b_pre)) (PreH8 : (b_pre <= INT_MAX)) (PreH9 : (0 <= i_pre)) (PreH10 : (i_pre <= UINT64_MAX)) (PreH11 : (0 <= vl_pre)) (PreH12 : (vl_pre <= UINT64_MAX)) ,
  TT && emp 
|--
  “ (retval = (rd_active_wadd32 (a_pre) (b_pre) (i_pre) (vl_pre))) ”
  &&  emp
).

Definition rdsum_active_add32_return_wit_2_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (rs_add_s32 (a_pre) (b_pre)))) (PreH2 : ((INT_MIN) <= retval)) (PreH3 : (retval <= INT_MAX)) (PreH4 : (i_pre < vl_pre)) (PreH5 : ((INT_MIN) <= a_pre)) (PreH6 : (a_pre <= INT_MAX)) (PreH7 : ((INT_MIN) <= b_pre)) (PreH8 : (b_pre <= INT_MAX)) (PreH9 : (0 <= i_pre)) (PreH10 : (i_pre <= UINT64_MAX)) (PreH11 : (0 <= vl_pre)) (PreH12 : (vl_pre <= UINT64_MAX)) ,
  (retval = (rd_active_wadd32 (a_pre) (b_pre) (i_pre) (vl_pre)))
.

Definition rdsum_active_add32_partial_solve_wit_1_pure := 
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

Definition rdsum_active_add32_partial_solve_wit_1_aux := 
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

Definition rdsum_active_add32_partial_solve_wit_1 := rdsum_active_add32_partial_solve_wit_1_pure -> rdsum_active_add32_partial_solve_wit_1_aux.

(*----- Function rdsum_splat16 -----*)

Definition rdsum_splat16_safety_wit_1 := 
forall (vl_pre: Z) (i_pre: Z) (x_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : ((-32768) <= x_pre)) (PreH3 : (x_pre <= 32767)) (PreH4 : (0 <= i_pre)) (PreH5 : (i_pre <= UINT64_MAX)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= UINT64_MAX)) ,
  ((( &( "x" ) )) # Short  |-> x_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition rdsum_splat16_return_wit_1 := 
(
forall (vl_pre: Z) (i_pre: Z) (x_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : ((-32768) <= x_pre)) (PreH3 : (x_pre <= 32767)) (PreH4 : (0 <= i_pre)) (PreH5 : (i_pre <= UINT64_MAX)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= UINT64_MAX)) ,
  TT && emp 
|--
  “ (0 = (rd_splat (x_pre) (i_pre) (vl_pre))) ” 
  &&  “ ((-32768) <= 0) ” 
  &&  “ (0 <= 32767) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (x_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : ((-32768) <= x_pre)) (PreH3 : (x_pre <= 32767)) (PreH4 : (0 <= i_pre)) (PreH5 : (i_pre <= UINT64_MAX)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= UINT64_MAX)) ,
  TT && emp 
|--
  “ (0 = (rd_splat (x_pre) (i_pre) (vl_pre))) ”
  &&  emp
).

Definition rdsum_splat16_return_wit_1_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (x_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : ((-32768) <= x_pre)) (PreH3 : (x_pre <= 32767)) (PreH4 : (0 <= i_pre)) (PreH5 : (i_pre <= UINT64_MAX)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= UINT64_MAX)) ,
  (0 = (rd_splat (x_pre) (i_pre) (vl_pre)))
.

Definition rdsum_splat16_return_wit_2 := 
(
forall (vl_pre: Z) (i_pre: Z) (x_pre: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : ((-32768) <= x_pre)) (PreH3 : (x_pre <= 32767)) (PreH4 : (0 <= i_pre)) (PreH5 : (i_pre <= UINT64_MAX)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= UINT64_MAX)) ,
  TT && emp 
|--
  “ (x_pre = (rd_splat (x_pre) (i_pre) (vl_pre))) ” 
  &&  “ ((-32768) <= x_pre) ” 
  &&  “ (x_pre <= 32767) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (x_pre: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : ((-32768) <= x_pre)) (PreH3 : (x_pre <= 32767)) (PreH4 : (0 <= i_pre)) (PreH5 : (i_pre <= UINT64_MAX)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= UINT64_MAX)) ,
  TT && emp 
|--
  “ (x_pre = (rd_splat (x_pre) (i_pre) (vl_pre))) ”
  &&  emp
).

Definition rdsum_splat16_return_wit_2_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (x_pre: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : ((-32768) <= x_pre)) (PreH3 : (x_pre <= 32767)) (PreH4 : (0 <= i_pre)) (PreH5 : (i_pre <= UINT64_MAX)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= UINT64_MAX)) ,
  (x_pre = (rd_splat (x_pre) (i_pre) (vl_pre)))
.

(*----- Function rdsum_splat32 -----*)

Definition rdsum_splat32_safety_wit_1 := 
forall (vl_pre: Z) (i_pre: Z) (x_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : ((INT_MIN) <= x_pre)) (PreH3 : (x_pre <= INT_MAX)) (PreH4 : (0 <= i_pre)) (PreH5 : (i_pre <= UINT64_MAX)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= UINT64_MAX)) ,
  ((( &( "x" ) )) # Int  |-> x_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition rdsum_splat32_return_wit_1 := 
(
forall (vl_pre: Z) (i_pre: Z) (x_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : ((INT_MIN) <= x_pre)) (PreH3 : (x_pre <= INT_MAX)) (PreH4 : (0 <= i_pre)) (PreH5 : (i_pre <= UINT64_MAX)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= UINT64_MAX)) ,
  TT && emp 
|--
  “ (0 = (rd_splat (x_pre) (i_pre) (vl_pre))) ” 
  &&  “ ((INT_MIN) <= 0) ” 
  &&  “ (0 <= INT_MAX) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (x_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : ((INT_MIN) <= x_pre)) (PreH3 : (x_pre <= INT_MAX)) (PreH4 : (0 <= i_pre)) (PreH5 : (i_pre <= UINT64_MAX)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= UINT64_MAX)) ,
  TT && emp 
|--
  “ (0 = (rd_splat (x_pre) (i_pre) (vl_pre))) ”
  &&  emp
).

Definition rdsum_splat32_return_wit_1_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (x_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : ((INT_MIN) <= x_pre)) (PreH3 : (x_pre <= INT_MAX)) (PreH4 : (0 <= i_pre)) (PreH5 : (i_pre <= UINT64_MAX)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= UINT64_MAX)) ,
  (0 = (rd_splat (x_pre) (i_pre) (vl_pre)))
.

Definition rdsum_splat32_return_wit_2 := 
(
forall (vl_pre: Z) (i_pre: Z) (x_pre: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : ((INT_MIN) <= x_pre)) (PreH3 : (x_pre <= INT_MAX)) (PreH4 : (0 <= i_pre)) (PreH5 : (i_pre <= UINT64_MAX)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= UINT64_MAX)) ,
  TT && emp 
|--
  “ (x_pre = (rd_splat (x_pre) (i_pre) (vl_pre))) ” 
  &&  “ ((INT_MIN) <= x_pre) ” 
  &&  “ (x_pre <= INT_MAX) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (x_pre: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : ((INT_MIN) <= x_pre)) (PreH3 : (x_pre <= INT_MAX)) (PreH4 : (0 <= i_pre)) (PreH5 : (i_pre <= UINT64_MAX)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= UINT64_MAX)) ,
  TT && emp 
|--
  “ (x_pre = (rd_splat (x_pre) (i_pre) (vl_pre))) ”
  &&  emp
).

Definition rdsum_splat32_return_wit_2_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (x_pre: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : ((INT_MIN) <= x_pre)) (PreH3 : (x_pre <= INT_MAX)) (PreH4 : (0 <= i_pre)) (PreH5 : (i_pre <= UINT64_MAX)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= UINT64_MAX)) ,
  (x_pre = (rd_splat (x_pre) (i_pre) (vl_pre)))
.

Module Type VC_Correct.


Axiom proof_of_rdsum_wadd16_safety_wit_1 : rdsum_wadd16_safety_wit_1.
Axiom proof_of_rdsum_wadd16_return_wit_1 : rdsum_wadd16_return_wit_1.
Axiom proof_of_rdsum_wadd16_partial_solve_wit_1_pure : rdsum_wadd16_partial_solve_wit_1_pure.
Axiom proof_of_rdsum_wadd16_partial_solve_wit_1 : rdsum_wadd16_partial_solve_wit_1.
Axiom proof_of_rdsum_active_wadd16_safety_wit_1 : rdsum_active_wadd16_safety_wit_1.
Axiom proof_of_rdsum_active_wadd16_return_wit_1 : rdsum_active_wadd16_return_wit_1.
Axiom proof_of_rdsum_active_wadd16_return_wit_2 : rdsum_active_wadd16_return_wit_2.
Axiom proof_of_rdsum_active_wadd16_partial_solve_wit_1_pure : rdsum_active_wadd16_partial_solve_wit_1_pure.
Axiom proof_of_rdsum_active_wadd16_partial_solve_wit_1 : rdsum_active_wadd16_partial_solve_wit_1.
Axiom proof_of_rdsum_active_wadd32_safety_wit_1 : rdsum_active_wadd32_safety_wit_1.
Axiom proof_of_rdsum_active_wadd32_return_wit_1 : rdsum_active_wadd32_return_wit_1.
Axiom proof_of_rdsum_active_wadd32_return_wit_2 : rdsum_active_wadd32_return_wit_2.
Axiom proof_of_rdsum_active_wadd32_partial_solve_wit_1_pure : rdsum_active_wadd32_partial_solve_wit_1_pure.
Axiom proof_of_rdsum_active_wadd32_partial_solve_wit_1 : rdsum_active_wadd32_partial_solve_wit_1.
Axiom proof_of_rdsum_active_add32_safety_wit_1 : rdsum_active_add32_safety_wit_1.
Axiom proof_of_rdsum_active_add32_return_wit_1 : rdsum_active_add32_return_wit_1.
Axiom proof_of_rdsum_active_add32_return_wit_2 : rdsum_active_add32_return_wit_2.
Axiom proof_of_rdsum_active_add32_partial_solve_wit_1_pure : rdsum_active_add32_partial_solve_wit_1_pure.
Axiom proof_of_rdsum_active_add32_partial_solve_wit_1 : rdsum_active_add32_partial_solve_wit_1.
Axiom proof_of_rdsum_splat16_safety_wit_1 : rdsum_splat16_safety_wit_1.
Axiom proof_of_rdsum_splat16_return_wit_1 : rdsum_splat16_return_wit_1.
Axiom proof_of_rdsum_splat16_return_wit_2 : rdsum_splat16_return_wit_2.
Axiom proof_of_rdsum_splat32_safety_wit_1 : rdsum_splat32_safety_wit_1.
Axiom proof_of_rdsum_splat32_return_wit_1 : rdsum_splat32_return_wit_1.
Axiom proof_of_rdsum_splat32_return_wit_2 : rdsum_splat32_return_wit_2.

End VC_Correct.
