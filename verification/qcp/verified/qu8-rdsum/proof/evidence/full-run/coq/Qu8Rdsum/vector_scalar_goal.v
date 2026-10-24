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
Require Import Qu8Rdsum.VectorModel.
Local Open Scope sac.

(*----- Function rdsum_wadd16 -----*)

Definition rdsum_wadd16_safety_wit_1 := 
forall (b_pre: Z) (a_pre: Z) (PreH1 : (0 <= a_pre)) (PreH2 : (a_pre <= 65535)) (PreH3 : (0 <= b_pre)) (PreH4 : (b_pre <= 255)) ,
  ((( &( "sum" ) )) # Int  |->_)
  **  ((( &( "a" ) )) # UShort  |-> a_pre)
  **  ((( &( "b" ) )) # UChar  |-> b_pre)
|--
  “ ((a_pre + b_pre ) <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= (a_pre + b_pre )) ”
.

Definition rdsum_wadd16_return_wit_1 := 
(
forall (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (rs_u16 ((a_pre + b_pre ))))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= 65535)) (PreH4 : (0 <= a_pre)) (PreH5 : (a_pre <= 65535)) (PreH6 : (0 <= b_pre)) (PreH7 : (b_pre <= 255)) ,
  TT && emp 
|--
  “ (retval = (rd_wadd16 (a_pre) (b_pre))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 65535) ”
  &&  emp
) \/
(
forall (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (rs_u16 ((a_pre + b_pre ))))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= 65535)) (PreH4 : (0 <= a_pre)) (PreH5 : (a_pre <= 65535)) (PreH6 : (0 <= b_pre)) (PreH7 : (b_pre <= 255)) ,
  TT && emp 
|--
  “ (retval = (rd_wadd16 (a_pre) (b_pre))) ”
  &&  emp
).

Definition rdsum_wadd16_return_wit_1_split_goal_1 := 
forall (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (rs_u16 ((a_pre + b_pre ))))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= 65535)) (PreH4 : (0 <= a_pre)) (PreH5 : (a_pre <= 65535)) (PreH6 : (0 <= b_pre)) (PreH7 : (b_pre <= 255)) ,
  (retval = (rd_wadd16 (a_pre) (b_pre)))
.

Definition rdsum_wadd16_partial_solve_wit_1_pure := 
forall (b_pre: Z) (a_pre: Z) (PreH1 : (0 <= a_pre)) (PreH2 : (a_pre <= 65535)) (PreH3 : (0 <= b_pre)) (PreH4 : (b_pre <= 255)) ,
  ((( &( "sum" ) )) # Int  |-> (a_pre + b_pre ))
  **  ((( &( "a" ) )) # UShort  |-> a_pre)
  **  ((( &( "b" ) )) # UChar  |-> b_pre)
|--
  “ ((INT_MIN) <= (a_pre + b_pre )) ” 
  &&  “ ((a_pre + b_pre ) <= INT_MAX) ”
.

Definition rdsum_wadd16_partial_solve_wit_1_aux := 
forall (b_pre: Z) (a_pre: Z) (PreH1 : (0 <= a_pre)) (PreH2 : (a_pre <= 65535)) (PreH3 : (0 <= b_pre)) (PreH4 : (b_pre <= 255)) ,
  TT && emp 
|--
  “ ((INT_MIN) <= (a_pre + b_pre )) ” 
  &&  “ ((a_pre + b_pre ) <= INT_MAX) ” 
  &&  “ (0 <= a_pre) ” 
  &&  “ (a_pre <= 65535) ” 
  &&  “ (0 <= b_pre) ” 
  &&  “ (b_pre <= 255) ”
  &&  emp
.

Definition rdsum_wadd16_partial_solve_wit_1 := rdsum_wadd16_partial_solve_wit_1_pure -> rdsum_wadd16_partial_solve_wit_1_aux.

(*----- Function rdsum_active_wadd16 -----*)

Definition rdsum_active_wadd16_safety_wit_1 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= a_pre)) (PreH3 : (a_pre <= 65535)) (PreH4 : (0 <= b_pre)) (PreH5 : (b_pre <= 255)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre <= UINT64_MAX)) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= UINT64_MAX)) ,
  ((( &( "a" ) )) # UShort  |-> a_pre)
  **  ((( &( "b" ) )) # UChar  |-> b_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition rdsum_active_wadd16_return_wit_1 := 
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= a_pre)) (PreH3 : (a_pre <= 65535)) (PreH4 : (0 <= b_pre)) (PreH5 : (b_pre <= 255)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre <= UINT64_MAX)) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= UINT64_MAX)) ,
  TT && emp 
|--
  “ (0 = (rd_active_wadd16 (a_pre) (b_pre) (i_pre) (vl_pre))) ” 
  &&  “ (0 <= 0) ” 
  &&  “ (0 <= 65535) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= a_pre)) (PreH3 : (a_pre <= 65535)) (PreH4 : (0 <= b_pre)) (PreH5 : (b_pre <= 255)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre <= UINT64_MAX)) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= UINT64_MAX)) ,
  TT && emp 
|--
  “ (0 = (rd_active_wadd16 (a_pre) (b_pre) (i_pre) (vl_pre))) ”
  &&  emp
).

Definition rdsum_active_wadd16_return_wit_1_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= a_pre)) (PreH3 : (a_pre <= 65535)) (PreH4 : (0 <= b_pre)) (PreH5 : (b_pre <= 255)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre <= UINT64_MAX)) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= UINT64_MAX)) ,
  (0 = (rd_active_wadd16 (a_pre) (b_pre) (i_pre) (vl_pre)))
.

Definition rdsum_active_wadd16_return_wit_2 := 
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (rd_wadd16 (a_pre) (b_pre)))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= 65535)) (PreH4 : (i_pre < vl_pre)) (PreH5 : (0 <= a_pre)) (PreH6 : (a_pre <= 65535)) (PreH7 : (0 <= b_pre)) (PreH8 : (b_pre <= 255)) (PreH9 : (0 <= i_pre)) (PreH10 : (i_pre <= UINT64_MAX)) (PreH11 : (0 <= vl_pre)) (PreH12 : (vl_pre <= UINT64_MAX)) ,
  TT && emp 
|--
  “ (retval = (rd_active_wadd16 (a_pre) (b_pre) (i_pre) (vl_pre))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 65535) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (rd_wadd16 (a_pre) (b_pre)))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= 65535)) (PreH4 : (i_pre < vl_pre)) (PreH5 : (0 <= a_pre)) (PreH6 : (a_pre <= 65535)) (PreH7 : (0 <= b_pre)) (PreH8 : (b_pre <= 255)) (PreH9 : (0 <= i_pre)) (PreH10 : (i_pre <= UINT64_MAX)) (PreH11 : (0 <= vl_pre)) (PreH12 : (vl_pre <= UINT64_MAX)) ,
  TT && emp 
|--
  “ (retval = (rd_active_wadd16 (a_pre) (b_pre) (i_pre) (vl_pre))) ”
  &&  emp
).

Definition rdsum_active_wadd16_return_wit_2_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (rd_wadd16 (a_pre) (b_pre)))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= 65535)) (PreH4 : (i_pre < vl_pre)) (PreH5 : (0 <= a_pre)) (PreH6 : (a_pre <= 65535)) (PreH7 : (0 <= b_pre)) (PreH8 : (b_pre <= 255)) (PreH9 : (0 <= i_pre)) (PreH10 : (i_pre <= UINT64_MAX)) (PreH11 : (0 <= vl_pre)) (PreH12 : (vl_pre <= UINT64_MAX)) ,
  (retval = (rd_active_wadd16 (a_pre) (b_pre) (i_pre) (vl_pre)))
.

Definition rdsum_active_wadd16_partial_solve_wit_1_pure := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : (0 <= a_pre)) (PreH3 : (a_pre <= 65535)) (PreH4 : (0 <= b_pre)) (PreH5 : (b_pre <= 255)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre <= UINT64_MAX)) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= UINT64_MAX)) ,
  ((( &( "a" ) )) # UShort  |-> a_pre)
  **  ((( &( "b" ) )) # UChar  |-> b_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= a_pre) ” 
  &&  “ (a_pre <= 65535) ” 
  &&  “ (0 <= b_pre) ” 
  &&  “ (b_pre <= 255) ”
.

Definition rdsum_active_wadd16_partial_solve_wit_1_aux := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : (0 <= a_pre)) (PreH3 : (a_pre <= 65535)) (PreH4 : (0 <= b_pre)) (PreH5 : (b_pre <= 255)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre <= UINT64_MAX)) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= UINT64_MAX)) ,
  TT && emp 
|--
  “ (0 <= a_pre) ” 
  &&  “ (a_pre <= 65535) ” 
  &&  “ (0 <= b_pre) ” 
  &&  “ (b_pre <= 255) ” 
  &&  “ (i_pre < vl_pre) ” 
  &&  “ (0 <= a_pre) ” 
  &&  “ (a_pre <= 65535) ” 
  &&  “ (0 <= b_pre) ” 
  &&  “ (b_pre <= 255) ” 
  &&  “ (0 <= i_pre) ” 
  &&  “ (i_pre <= UINT64_MAX) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= UINT64_MAX) ”
  &&  emp
.

Definition rdsum_active_wadd16_partial_solve_wit_1 := rdsum_active_wadd16_partial_solve_wit_1_pure -> rdsum_active_wadd16_partial_solve_wit_1_aux.

(*----- Function rdsum_active_wadd32 -----*)

Definition rdsum_active_wadd32_safety_wit_1 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= a_pre)) (PreH3 : (a_pre <= UINT_MAX)) (PreH4 : (0 <= b_pre)) (PreH5 : (b_pre <= 65535)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre <= UINT64_MAX)) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= UINT64_MAX)) ,
  ((( &( "a" ) )) # UInt  |-> a_pre)
  **  ((( &( "b" ) )) # UShort  |-> b_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition rdsum_active_wadd32_return_wit_1 := 
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= a_pre)) (PreH3 : (a_pre <= UINT_MAX)) (PreH4 : (0 <= b_pre)) (PreH5 : (b_pre <= 65535)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre <= UINT64_MAX)) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= UINT64_MAX)) ,
  TT && emp 
|--
  “ (0 = (rd_active_wadd32 (a_pre) (b_pre) (i_pre) (vl_pre))) ” 
  &&  “ (0 <= 0) ” 
  &&  “ (0 <= UINT_MAX) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= a_pre)) (PreH3 : (a_pre <= UINT_MAX)) (PreH4 : (0 <= b_pre)) (PreH5 : (b_pre <= 65535)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre <= UINT64_MAX)) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= UINT64_MAX)) ,
  TT && emp 
|--
  “ (0 = (rd_active_wadd32 (a_pre) (b_pre) (i_pre) (vl_pre))) ”
  &&  emp
).

Definition rdsum_active_wadd32_return_wit_1_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= a_pre)) (PreH3 : (a_pre <= UINT_MAX)) (PreH4 : (0 <= b_pre)) (PreH5 : (b_pre <= 65535)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre <= UINT64_MAX)) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= UINT64_MAX)) ,
  (0 = (rd_active_wadd32 (a_pre) (b_pre) (i_pre) (vl_pre)))
.

Definition rdsum_active_wadd32_return_wit_2 := 
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (rs_add_u32 (a_pre) (b_pre)))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= UINT_MAX)) (PreH4 : (i_pre < vl_pre)) (PreH5 : (0 <= a_pre)) (PreH6 : (a_pre <= UINT_MAX)) (PreH7 : (0 <= b_pre)) (PreH8 : (b_pre <= 65535)) (PreH9 : (0 <= i_pre)) (PreH10 : (i_pre <= UINT64_MAX)) (PreH11 : (0 <= vl_pre)) (PreH12 : (vl_pre <= UINT64_MAX)) ,
  TT && emp 
|--
  “ (retval = (rd_active_wadd32 (a_pre) (b_pre) (i_pre) (vl_pre))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= UINT_MAX) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (rs_add_u32 (a_pre) (b_pre)))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= UINT_MAX)) (PreH4 : (i_pre < vl_pre)) (PreH5 : (0 <= a_pre)) (PreH6 : (a_pre <= UINT_MAX)) (PreH7 : (0 <= b_pre)) (PreH8 : (b_pre <= 65535)) (PreH9 : (0 <= i_pre)) (PreH10 : (i_pre <= UINT64_MAX)) (PreH11 : (0 <= vl_pre)) (PreH12 : (vl_pre <= UINT64_MAX)) ,
  TT && emp 
|--
  “ (retval = (rd_active_wadd32 (a_pre) (b_pre) (i_pre) (vl_pre))) ”
  &&  emp
).

Definition rdsum_active_wadd32_return_wit_2_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (rs_add_u32 (a_pre) (b_pre)))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= UINT_MAX)) (PreH4 : (i_pre < vl_pre)) (PreH5 : (0 <= a_pre)) (PreH6 : (a_pre <= UINT_MAX)) (PreH7 : (0 <= b_pre)) (PreH8 : (b_pre <= 65535)) (PreH9 : (0 <= i_pre)) (PreH10 : (i_pre <= UINT64_MAX)) (PreH11 : (0 <= vl_pre)) (PreH12 : (vl_pre <= UINT64_MAX)) ,
  (retval = (rd_active_wadd32 (a_pre) (b_pre) (i_pre) (vl_pre)))
.

Definition rdsum_active_wadd32_partial_solve_wit_1_pure := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : (0 <= a_pre)) (PreH3 : (a_pre <= UINT_MAX)) (PreH4 : (0 <= b_pre)) (PreH5 : (b_pre <= 65535)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre <= UINT64_MAX)) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= UINT64_MAX)) ,
  ((( &( "a" ) )) # UInt  |-> a_pre)
  **  ((( &( "b" ) )) # UShort  |-> b_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= a_pre) ” 
  &&  “ (a_pre <= UINT_MAX) ” 
  &&  “ (0 <= b_pre) ” 
  &&  “ (b_pre <= UINT_MAX) ”
.

Definition rdsum_active_wadd32_partial_solve_wit_1_aux := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : (0 <= a_pre)) (PreH3 : (a_pre <= UINT_MAX)) (PreH4 : (0 <= b_pre)) (PreH5 : (b_pre <= 65535)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre <= UINT64_MAX)) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= UINT64_MAX)) ,
  TT && emp 
|--
  “ (0 <= a_pre) ” 
  &&  “ (a_pre <= UINT_MAX) ” 
  &&  “ (0 <= b_pre) ” 
  &&  “ (b_pre <= UINT_MAX) ” 
  &&  “ (i_pre < vl_pre) ” 
  &&  “ (0 <= a_pre) ” 
  &&  “ (a_pre <= UINT_MAX) ” 
  &&  “ (0 <= b_pre) ” 
  &&  “ (b_pre <= 65535) ” 
  &&  “ (0 <= i_pre) ” 
  &&  “ (i_pre <= UINT64_MAX) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= UINT64_MAX) ”
  &&  emp
.

Definition rdsum_active_wadd32_partial_solve_wit_1 := rdsum_active_wadd32_partial_solve_wit_1_pure -> rdsum_active_wadd32_partial_solve_wit_1_aux.

(*----- Function rdsum_active_add32 -----*)

Definition rdsum_active_add32_safety_wit_1 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= a_pre)) (PreH3 : (a_pre <= UINT_MAX)) (PreH4 : (0 <= b_pre)) (PreH5 : (b_pre <= UINT_MAX)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre <= UINT64_MAX)) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= UINT64_MAX)) ,
  ((( &( "a" ) )) # UInt  |-> a_pre)
  **  ((( &( "b" ) )) # UInt  |-> b_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition rdsum_active_add32_return_wit_1 := 
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= a_pre)) (PreH3 : (a_pre <= UINT_MAX)) (PreH4 : (0 <= b_pre)) (PreH5 : (b_pre <= UINT_MAX)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre <= UINT64_MAX)) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= UINT64_MAX)) ,
  TT && emp 
|--
  “ (0 = (rd_active_wadd32 (a_pre) (b_pre) (i_pre) (vl_pre))) ” 
  &&  “ (0 <= 0) ” 
  &&  “ (0 <= UINT_MAX) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= a_pre)) (PreH3 : (a_pre <= UINT_MAX)) (PreH4 : (0 <= b_pre)) (PreH5 : (b_pre <= UINT_MAX)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre <= UINT64_MAX)) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= UINT64_MAX)) ,
  TT && emp 
|--
  “ (0 = (rd_active_wadd32 (a_pre) (b_pre) (i_pre) (vl_pre))) ”
  &&  emp
).

Definition rdsum_active_add32_return_wit_1_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= a_pre)) (PreH3 : (a_pre <= UINT_MAX)) (PreH4 : (0 <= b_pre)) (PreH5 : (b_pre <= UINT_MAX)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre <= UINT64_MAX)) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= UINT64_MAX)) ,
  (0 = (rd_active_wadd32 (a_pre) (b_pre) (i_pre) (vl_pre)))
.

Definition rdsum_active_add32_return_wit_2 := 
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (rs_add_u32 (a_pre) (b_pre)))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= UINT_MAX)) (PreH4 : (i_pre < vl_pre)) (PreH5 : (0 <= a_pre)) (PreH6 : (a_pre <= UINT_MAX)) (PreH7 : (0 <= b_pre)) (PreH8 : (b_pre <= UINT_MAX)) (PreH9 : (0 <= i_pre)) (PreH10 : (i_pre <= UINT64_MAX)) (PreH11 : (0 <= vl_pre)) (PreH12 : (vl_pre <= UINT64_MAX)) ,
  TT && emp 
|--
  “ (retval = (rd_active_wadd32 (a_pre) (b_pre) (i_pre) (vl_pre))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= UINT_MAX) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (rs_add_u32 (a_pre) (b_pre)))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= UINT_MAX)) (PreH4 : (i_pre < vl_pre)) (PreH5 : (0 <= a_pre)) (PreH6 : (a_pre <= UINT_MAX)) (PreH7 : (0 <= b_pre)) (PreH8 : (b_pre <= UINT_MAX)) (PreH9 : (0 <= i_pre)) (PreH10 : (i_pre <= UINT64_MAX)) (PreH11 : (0 <= vl_pre)) (PreH12 : (vl_pre <= UINT64_MAX)) ,
  TT && emp 
|--
  “ (retval = (rd_active_wadd32 (a_pre) (b_pre) (i_pre) (vl_pre))) ”
  &&  emp
).

Definition rdsum_active_add32_return_wit_2_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (retval: Z) (PreH1 : (retval = (rs_add_u32 (a_pre) (b_pre)))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= UINT_MAX)) (PreH4 : (i_pre < vl_pre)) (PreH5 : (0 <= a_pre)) (PreH6 : (a_pre <= UINT_MAX)) (PreH7 : (0 <= b_pre)) (PreH8 : (b_pre <= UINT_MAX)) (PreH9 : (0 <= i_pre)) (PreH10 : (i_pre <= UINT64_MAX)) (PreH11 : (0 <= vl_pre)) (PreH12 : (vl_pre <= UINT64_MAX)) ,
  (retval = (rd_active_wadd32 (a_pre) (b_pre) (i_pre) (vl_pre)))
.

Definition rdsum_active_add32_partial_solve_wit_1_pure := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : (0 <= a_pre)) (PreH3 : (a_pre <= UINT_MAX)) (PreH4 : (0 <= b_pre)) (PreH5 : (b_pre <= UINT_MAX)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre <= UINT64_MAX)) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= UINT64_MAX)) ,
  ((( &( "a" ) )) # UInt  |-> a_pre)
  **  ((( &( "b" ) )) # UInt  |-> b_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= a_pre) ” 
  &&  “ (a_pre <= UINT_MAX) ” 
  &&  “ (0 <= b_pre) ” 
  &&  “ (b_pre <= UINT_MAX) ”
.

Definition rdsum_active_add32_partial_solve_wit_1_aux := 
forall (vl_pre: Z) (i_pre: Z) (b_pre: Z) (a_pre: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : (0 <= a_pre)) (PreH3 : (a_pre <= UINT_MAX)) (PreH4 : (0 <= b_pre)) (PreH5 : (b_pre <= UINT_MAX)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre <= UINT64_MAX)) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= UINT64_MAX)) ,
  TT && emp 
|--
  “ (0 <= a_pre) ” 
  &&  “ (a_pre <= UINT_MAX) ” 
  &&  “ (0 <= b_pre) ” 
  &&  “ (b_pre <= UINT_MAX) ” 
  &&  “ (i_pre < vl_pre) ” 
  &&  “ (0 <= a_pre) ” 
  &&  “ (a_pre <= UINT_MAX) ” 
  &&  “ (0 <= b_pre) ” 
  &&  “ (b_pre <= UINT_MAX) ” 
  &&  “ (0 <= i_pre) ” 
  &&  “ (i_pre <= UINT64_MAX) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= UINT64_MAX) ”
  &&  emp
.

Definition rdsum_active_add32_partial_solve_wit_1 := rdsum_active_add32_partial_solve_wit_1_pure -> rdsum_active_add32_partial_solve_wit_1_aux.

(*----- Function rdsum_splat16 -----*)

Definition rdsum_splat16_safety_wit_1 := 
forall (vl_pre: Z) (i_pre: Z) (x_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= x_pre)) (PreH3 : (x_pre <= 65535)) (PreH4 : (0 <= i_pre)) (PreH5 : (i_pre <= UINT64_MAX)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= UINT64_MAX)) ,
  ((( &( "x" ) )) # UShort  |-> x_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition rdsum_splat16_return_wit_1 := 
(
forall (vl_pre: Z) (i_pre: Z) (x_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= x_pre)) (PreH3 : (x_pre <= 65535)) (PreH4 : (0 <= i_pre)) (PreH5 : (i_pre <= UINT64_MAX)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= UINT64_MAX)) ,
  TT && emp 
|--
  “ (0 = (rd_splat (x_pre) (i_pre) (vl_pre))) ” 
  &&  “ (0 <= 0) ” 
  &&  “ (0 <= 65535) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (x_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= x_pre)) (PreH3 : (x_pre <= 65535)) (PreH4 : (0 <= i_pre)) (PreH5 : (i_pre <= UINT64_MAX)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= UINT64_MAX)) ,
  TT && emp 
|--
  “ (0 = (rd_splat (x_pre) (i_pre) (vl_pre))) ”
  &&  emp
).

Definition rdsum_splat16_return_wit_1_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (x_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= x_pre)) (PreH3 : (x_pre <= 65535)) (PreH4 : (0 <= i_pre)) (PreH5 : (i_pre <= UINT64_MAX)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= UINT64_MAX)) ,
  (0 = (rd_splat (x_pre) (i_pre) (vl_pre)))
.

Definition rdsum_splat16_return_wit_2 := 
(
forall (vl_pre: Z) (i_pre: Z) (x_pre: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : (0 <= x_pre)) (PreH3 : (x_pre <= 65535)) (PreH4 : (0 <= i_pre)) (PreH5 : (i_pre <= UINT64_MAX)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= UINT64_MAX)) ,
  TT && emp 
|--
  “ (x_pre = (rd_splat (x_pre) (i_pre) (vl_pre))) ” 
  &&  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= 65535) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (x_pre: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : (0 <= x_pre)) (PreH3 : (x_pre <= 65535)) (PreH4 : (0 <= i_pre)) (PreH5 : (i_pre <= UINT64_MAX)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= UINT64_MAX)) ,
  TT && emp 
|--
  “ (x_pre = (rd_splat (x_pre) (i_pre) (vl_pre))) ”
  &&  emp
).

Definition rdsum_splat16_return_wit_2_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (x_pre: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : (0 <= x_pre)) (PreH3 : (x_pre <= 65535)) (PreH4 : (0 <= i_pre)) (PreH5 : (i_pre <= UINT64_MAX)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= UINT64_MAX)) ,
  (x_pre = (rd_splat (x_pre) (i_pre) (vl_pre)))
.

(*----- Function rdsum_splat32 -----*)

Definition rdsum_splat32_safety_wit_1 := 
forall (vl_pre: Z) (i_pre: Z) (x_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= x_pre)) (PreH3 : (x_pre <= UINT_MAX)) (PreH4 : (0 <= i_pre)) (PreH5 : (i_pre <= UINT64_MAX)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= UINT64_MAX)) ,
  ((( &( "x" ) )) # UInt  |-> x_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition rdsum_splat32_return_wit_1 := 
(
forall (vl_pre: Z) (i_pre: Z) (x_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= x_pre)) (PreH3 : (x_pre <= UINT_MAX)) (PreH4 : (0 <= i_pre)) (PreH5 : (i_pre <= UINT64_MAX)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= UINT64_MAX)) ,
  TT && emp 
|--
  “ (0 = (rd_splat (x_pre) (i_pre) (vl_pre))) ” 
  &&  “ (0 <= 0) ” 
  &&  “ (0 <= UINT_MAX) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (x_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= x_pre)) (PreH3 : (x_pre <= UINT_MAX)) (PreH4 : (0 <= i_pre)) (PreH5 : (i_pre <= UINT64_MAX)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= UINT64_MAX)) ,
  TT && emp 
|--
  “ (0 = (rd_splat (x_pre) (i_pre) (vl_pre))) ”
  &&  emp
).

Definition rdsum_splat32_return_wit_1_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (x_pre: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= x_pre)) (PreH3 : (x_pre <= UINT_MAX)) (PreH4 : (0 <= i_pre)) (PreH5 : (i_pre <= UINT64_MAX)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= UINT64_MAX)) ,
  (0 = (rd_splat (x_pre) (i_pre) (vl_pre)))
.

Definition rdsum_splat32_return_wit_2 := 
(
forall (vl_pre: Z) (i_pre: Z) (x_pre: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : (0 <= x_pre)) (PreH3 : (x_pre <= UINT_MAX)) (PreH4 : (0 <= i_pre)) (PreH5 : (i_pre <= UINT64_MAX)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= UINT64_MAX)) ,
  TT && emp 
|--
  “ (x_pre = (rd_splat (x_pre) (i_pre) (vl_pre))) ” 
  &&  “ (0 <= x_pre) ” 
  &&  “ (x_pre <= UINT_MAX) ”
  &&  emp
) \/
(
forall (vl_pre: Z) (i_pre: Z) (x_pre: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : (0 <= x_pre)) (PreH3 : (x_pre <= UINT_MAX)) (PreH4 : (0 <= i_pre)) (PreH5 : (i_pre <= UINT64_MAX)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= UINT64_MAX)) ,
  TT && emp 
|--
  “ (x_pre = (rd_splat (x_pre) (i_pre) (vl_pre))) ”
  &&  emp
).

Definition rdsum_splat32_return_wit_2_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (x_pre: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : (0 <= x_pre)) (PreH3 : (x_pre <= UINT_MAX)) (PreH4 : (0 <= i_pre)) (PreH5 : (i_pre <= UINT64_MAX)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= UINT64_MAX)) ,
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
