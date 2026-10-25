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
Require Import X32Packw.ScalarMemory.
Require Import X32Packw.Types.
Require Import X32Packw.StrideAccessModel.
Require Import X32Packw.TileAccessModel.
Local Open Scope sac.

(*----- Function pw_rvv_header -----*)

Definition pw_rvv_header_safety_wit_1 := 
forall (count_pre: Z) (p_pre: Z) (b_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (PreH1 : (pw_header_pre F W b_pre p_pre count_pre )) ,
  ((( &( "b" ) )) # Ptr  |-> b_pre)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "count" ) )) # UInt64  |-> count_pre)
  **  (pw_data F )
  **  (pw_output W O )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition pw_rvv_header_safety_wit_2 := 
forall (count_pre: Z) (p_pre: Z) (b_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (PreH1 : (b_pre <> 0)) (PreH2 : (pw_header_pre F W b_pre p_pre count_pre )) ,
  ((( &( "b" ) )) # Ptr  |-> b_pre)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "count" ) )) # UInt64  |-> count_pre)
  **  (pw_data F )
  **  (pw_output W O )
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition pw_rvv_header_safety_wit_3 := 
forall (count_pre: Z) (p_pre: Z) (b_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (PreH1 : (count_pre = 2)) (PreH2 : (b_pre <> 0)) (PreH3 : (pw_header_pre F W b_pre p_pre count_pre )) ,
  (UndefStructPredvuint32m1_t ( &( "v" ) ) )
  **  ((( &( "b" ) )) # Ptr  |-> b_pre)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "count" ) )) # UInt64  |-> count_pre)
  **  (pw_data F )
  **  (pw_output W O )
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition pw_rvv_header_safety_wit_4 := 
forall (count_pre: Z) (p_pre: Z) (b_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (x3: Z) (x2: Z) (PreH1 : (count_pre = 2)) (PreH2 : (b_pre <> 0)) (PreH3 : (pw_header_pre F W b_pre p_pre count_pre )) ,
  ((&(( &( "v" ) )->ₛ "s3")) # UInt  |-> x3)
  **  ((&(( &( "v" ) )->ₛ "s2")) # UInt  |-> x2)
  **  ((&(( &( "v" ) )->ₛ "s1")) # UInt  |-> (pw_load_lane (F) (b_pre) (1)))
  **  ((&(( &( "v" ) )->ₛ "s0")) # UInt  |-> (pw_load_lane (F) (b_pre) (0)))
  **  (pw_data F )
  **  ((( &( "b" ) )) # Ptr  |-> b_pre)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "count" ) )) # UInt64  |-> count_pre)
  **  (pw_output W O )
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition pw_rvv_header_safety_wit_5 := 
forall (count_pre: Z) (p_pre: Z) (b_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (PreH1 : (b_pre = 0)) (PreH2 : (pw_header_pre F W b_pre p_pre count_pre )) ,
  (UndefStructPredvuint32m1_t ( &( "z" ) ) )
  **  ((( &( "b" ) )) # Ptr  |-> b_pre)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "count" ) )) # UInt64  |-> count_pre)
  **  (pw_data F )
  **  (pw_output W O )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition pw_rvv_header_safety_wit_6 := 
forall (count_pre: Z) (p_pre: Z) (b_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (PreH1 : (b_pre = 0)) (PreH2 : (pw_header_pre F W b_pre p_pre count_pre )) ,
  (UndefStructPredvuint32m1_t ( &( "z" ) ) )
  **  ((( &( "b" ) )) # Ptr  |-> b_pre)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "count" ) )) # UInt64  |-> count_pre)
  **  (pw_data F )
  **  (pw_output W O )
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition pw_rvv_header_safety_wit_7 := 
forall (count_pre: Z) (p_pre: Z) (b_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (x3: Z) (x2: Z) (PreH1 : (b_pre = 0)) (PreH2 : (pw_header_pre F W b_pre p_pre count_pre )) ,
  ((&(( &( "z" ) )->ₛ "s3")) # UInt  |-> x3)
  **  ((&(( &( "z" ) )->ₛ "s2")) # UInt  |-> x2)
  **  ((&(( &( "z" ) )->ₛ "s1")) # UInt  |-> 0)
  **  ((&(( &( "z" ) )->ₛ "s0")) # UInt  |-> 0)
  **  ((( &( "b" ) )) # Ptr  |-> b_pre)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "count" ) )) # UInt64  |-> count_pre)
  **  (pw_data F )
  **  (pw_output W O )
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition pw_rvv_header_return_wit_1 := 
(
forall (count_pre: Z) (p_pre: Z) (b_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (PreH1 : (count_pre = 2)) (PreH2 : (b_pre <> 0)) (PreH3 : (pw_header_pre F W b_pre p_pre count_pre )) ,
  (pw_output W (pw_write_pair (O) (p_pre) ((pw_load_lane (F) (b_pre) (0))) ((pw_load_lane (F) (b_pre) (1)))) )
  **  (pw_data F )
|--
  (pw_data F )
  **  (pw_output W (pw_header_run (F) (b_pre) (p_pre) (count_pre) (O)) )
) \/
(
forall (count_pre: Z) (p_pre: Z) (b_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (PreH1 : (count_pre = 2)) (PreH2 : (b_pre <> 0)) (PreH3 : (pw_header_pre F W b_pre p_pre count_pre )) ,
  (pw_output W (pw_write_pair (O) (p_pre) ((pw_load_lane (F) (b_pre) (0))) ((pw_load_lane (F) (b_pre) (1)))) )
  **  (pw_data F )
|--
  (pw_data F )
  **  (pw_output W (pw_header_run (F) (b_pre) (p_pre) (count_pre) (O)) )
).

Definition pw_rvv_header_return_wit_1_split_goal_spatial := 
forall (count_pre: Z) (p_pre: Z) (b_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (PreH1 : (count_pre = 2)) (PreH2 : (b_pre <> 0)) (PreH3 : (pw_header_pre F W b_pre p_pre count_pre )) ,
  (pw_output W (pw_write_pair (O) (p_pre) ((pw_load_lane (F) (b_pre) (0))) ((pw_load_lane (F) (b_pre) (1)))) )
  **  (pw_data F )
|--
  (pw_data F )
  **  (pw_output W (pw_header_run (F) (b_pre) (p_pre) (count_pre) (O)) )
.

Definition pw_rvv_header_return_wit_2 := 
(
forall (count_pre: Z) (p_pre: Z) (b_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (retval: Z) (PreH1 : (retval = (pw_get (F) (b_pre)))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= UINT_MAX)) (PreH4 : (count_pre <> 2)) (PreH5 : (b_pre <> 0)) (PreH6 : (pw_header_pre F W b_pre p_pre count_pre )) ,
  (pw_output W (pw_output_put (O) (p_pre) (retval)) )
  **  (pw_data F )
|--
  (pw_data F )
  **  (pw_output W (pw_header_run (F) (b_pre) (p_pre) (count_pre) (O)) )
) \/
(
forall (count_pre: Z) (p_pre: Z) (b_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (retval: Z) (PreH1 : (retval = (pw_get (F) (b_pre)))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= UINT_MAX)) (PreH4 : (count_pre <> 2)) (PreH5 : (b_pre <> 0)) (PreH6 : (pw_header_pre F W b_pre p_pre count_pre )) ,
  (pw_output W (pw_output_put (O) (p_pre) (retval)) )
  **  (pw_data F )
|--
  (pw_data F )
  **  (pw_output W (pw_header_run (F) (b_pre) (p_pre) (count_pre) (O)) )
).

Definition pw_rvv_header_return_wit_2_split_goal_spatial := 
forall (count_pre: Z) (p_pre: Z) (b_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (retval: Z) (PreH1 : (retval = (pw_get (F) (b_pre)))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= UINT_MAX)) (PreH4 : (count_pre <> 2)) (PreH5 : (b_pre <> 0)) (PreH6 : (pw_header_pre F W b_pre p_pre count_pre )) ,
  (pw_output W (pw_output_put (O) (p_pre) (retval)) )
  **  (pw_data F )
|--
  (pw_data F )
  **  (pw_output W (pw_header_run (F) (b_pre) (p_pre) (count_pre) (O)) )
.

Definition pw_rvv_header_return_wit_3 := 
(
forall (count_pre: Z) (p_pre: Z) (b_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (PreH1 : (b_pre = 0)) (PreH2 : (pw_header_pre F W b_pre p_pre count_pre )) ,
  (pw_output W (pw_write_pair (O) (p_pre) (0) (0)) )
  **  (pw_data F )
|--
  (pw_data F )
  **  (pw_output W (pw_header_run (F) (b_pre) (p_pre) (count_pre) (O)) )
) \/
(
forall (count_pre: Z) (p_pre: Z) (b_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (PreH1 : (b_pre = 0)) (PreH2 : (pw_header_pre F W b_pre p_pre count_pre )) ,
  (pw_output W (pw_write_pair (O) (p_pre) (0) (0)) )
  **  (pw_data F )
|--
  (pw_data F )
  **  (pw_output W (pw_header_run (F) (b_pre) (p_pre) (count_pre) (O)) )
).

Definition pw_rvv_header_return_wit_3_split_goal_spatial := 
forall (count_pre: Z) (p_pre: Z) (b_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (PreH1 : (b_pre = 0)) (PreH2 : (pw_header_pre F W b_pre p_pre count_pre )) ,
  (pw_output W (pw_write_pair (O) (p_pre) (0) (0)) )
  **  (pw_data F )
|--
  (pw_data F )
  **  (pw_output W (pw_header_run (F) (b_pre) (p_pre) (count_pre) (O)) )
.

Definition pw_rvv_header_partial_solve_wit_1_pure := 
(
forall (count_pre: Z) (p_pre: Z) (b_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (PreH1 : (count_pre = 2)) (PreH2 : (b_pre <> 0)) (PreH3 : (pw_header_pre F W b_pre p_pre count_pre )) ,
  (UndefStructPredvuint32m1_t ( &( "v" ) ) )
  **  ((( &( "b" ) )) # Ptr  |-> b_pre)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "count" ) )) # UInt64  |-> count_pre)
  **  (pw_data F )
  **  (pw_output W O )
|--
  “ (2 = 2) ” 
  &&  “ (pw_window F b_pre 2 ) ”
) \/
(
forall (count_pre: Z) (p_pre: Z) (b_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (PreH1 : (count_pre <= UINT64_MAX)) (PreH2 : (count_pre >= 0)) (PreH3 : (count_pre = 2)) (PreH4 : (b_pre <> 0)) (PreH5 : (pw_header_pre F W b_pre p_pre count_pre )) ,
  (UndefStructPredvuint32m1_t ( &( "v" ) ) )
  **  ((( &( "b" ) )) # Ptr  |-> b_pre)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "count" ) )) # UInt64  |-> count_pre)
  **  (pw_data F )
  **  (pw_output W O )
|--
  “ (pw_window F b_pre 2 ) ”
).

Definition pw_rvv_header_partial_solve_wit_1_pure_split_goal_1 := 
forall (count_pre: Z) (p_pre: Z) (b_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (PreH1 : (count_pre <= UINT64_MAX)) (PreH2 : (count_pre >= 0)) (PreH3 : (count_pre = 2)) (PreH4 : (b_pre <> 0)) (PreH5 : (pw_header_pre F W b_pre p_pre count_pre )) ,
  (UndefStructPredvuint32m1_t ( &( "v" ) ) )
  **  ((( &( "b" ) )) # Ptr  |-> b_pre)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "count" ) )) # UInt64  |-> count_pre)
  **  (pw_data F )
  **  (pw_output W O )
|--
  “ (pw_window F b_pre 2 ) ”
.

Definition pw_rvv_header_partial_solve_wit_1_aux := 
forall (count_pre: Z) (p_pre: Z) (b_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (PreH1 : (count_pre = 2)) (PreH2 : (b_pre <> 0)) (PreH3 : (pw_header_pre F W b_pre p_pre count_pre )) ,
  (UndefStructPredvuint32m1_t ( &( "v" ) ) )
  **  (pw_data F )
  **  (pw_output W O )
|--
  “ (2 = 2) ” 
  &&  “ (pw_window F b_pre 2 ) ” 
  &&  “ (count_pre = 2) ” 
  &&  “ (b_pre <> 0) ” 
  &&  “ (pw_header_pre F W b_pre p_pre count_pre ) ”
  &&  (pw_data F )
  **  (UndefStructPredvuint32m1_t ( &( "v" ) ) )
  **  (pw_output W O )
.

Definition pw_rvv_header_partial_solve_wit_1 := pw_rvv_header_partial_solve_wit_1_pure -> pw_rvv_header_partial_solve_wit_1_aux.

Definition pw_rvv_header_partial_solve_wit_2 := 
forall (count_pre: Z) (p_pre: Z) (b_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (x3: Z) (x2: Z) (retval: Z) (PreH1 : (count_pre = 2)) (PreH2 : (b_pre <> 0)) (PreH3 : (pw_header_pre F W b_pre p_pre count_pre )) ,
  (pw_data F )
  **  ((&((retval)  # "vuint32m1_t" ->ₛ "s0")) # UInt  |-> (pw_load_lane (F) (b_pre) (0)))
  **  ((&((retval)  # "vuint32m1_t" ->ₛ "s1")) # UInt  |-> (pw_load_lane (F) (b_pre) (1)))
  **  ((&((retval)  # "vuint32m1_t" ->ₛ "s2")) # UInt  |-> x2)
  **  ((&((retval)  # "vuint32m1_t" ->ₛ "s3")) # UInt  |-> x3)
  **  (UndefStructPredvuint32m1_t ( &( "v" ) ) )
  **  (pw_output W O )
|--
  “ (count_pre = 2) ” 
  &&  “ (b_pre <> 0) ” 
  &&  “ (pw_header_pre F W b_pre p_pre count_pre ) ”
  &&  ((&(( &( "v" ) )->ₛ "s3")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m1_t" ->ₛ "s3")) # UInt  |-> x3)
  **  ((&(( &( "v" ) )->ₛ "s2")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m1_t" ->ₛ "s2")) # UInt  |-> x2)
  **  ((&(( &( "v" ) )->ₛ "s1")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m1_t" ->ₛ "s1")) # UInt  |-> (pw_load_lane (F) (b_pre) (1)))
  **  ((&(( &( "v" ) )->ₛ "s0")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m1_t" ->ₛ "s0")) # UInt  |-> (pw_load_lane (F) (b_pre) (0)))
  **  (pw_data F )
  **  (pw_output W O )
.

Definition pw_rvv_header_partial_solve_wit_3_pure := 
(
forall (count_pre: Z) (p_pre: Z) (b_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (x3: Z) (x2: Z) (PreH1 : (count_pre = 2)) (PreH2 : (b_pre <> 0)) (PreH3 : (pw_header_pre F W b_pre p_pre count_pre )) ,
  ((&(( &( "v" ) )->ₛ "s3")) # UInt  |-> x3)
  **  ((&(( &( "v" ) )->ₛ "s2")) # UInt  |-> x2)
  **  ((&(( &( "v" ) )->ₛ "s1")) # UInt  |-> (pw_load_lane (F) (b_pre) (1)))
  **  ((&(( &( "v" ) )->ₛ "s0")) # UInt  |-> (pw_load_lane (F) (b_pre) (0)))
  **  (pw_data F )
  **  ((( &( "b" ) )) # Ptr  |-> b_pre)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "count" ) )) # UInt64  |-> count_pre)
  **  (pw_output W O )
|--
  “ (2 = 2) ” 
  &&  “ (pw_write_window W p_pre 2 ) ”
) \/
(
forall (count_pre: Z) (p_pre: Z) (b_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (x3: Z) (x2: Z) (PreH1 : (count_pre <= UINT64_MAX)) (PreH2 : (count_pre >= 0)) (PreH3 : ((pw_load_lane (F) (b_pre) (0)) <= UINT_MAX)) (PreH4 : ((pw_load_lane (F) (b_pre) (1)) <= UINT_MAX)) (PreH5 : (x2 <= UINT_MAX)) (PreH6 : (x3 <= UINT_MAX)) (PreH7 : ((pw_load_lane (F) (b_pre) (0)) >= 0)) (PreH8 : ((pw_load_lane (F) (b_pre) (1)) >= 0)) (PreH9 : (x2 >= 0)) (PreH10 : (x3 >= 0)) (PreH11 : (count_pre = 2)) (PreH12 : (b_pre <> 0)) (PreH13 : (pw_header_pre F W b_pre p_pre count_pre )) ,
  ((&(( &( "v" ) )->ₛ "s3")) # UInt  |-> x3)
  **  ((&(( &( "v" ) )->ₛ "s2")) # UInt  |-> x2)
  **  ((&(( &( "v" ) )->ₛ "s1")) # UInt  |-> (pw_load_lane (F) (b_pre) (1)))
  **  ((&(( &( "v" ) )->ₛ "s0")) # UInt  |-> (pw_load_lane (F) (b_pre) (0)))
  **  (pw_data F )
  **  ((( &( "b" ) )) # Ptr  |-> b_pre)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "count" ) )) # UInt64  |-> count_pre)
  **  (pw_output W O )
|--
  “ (pw_write_window W p_pre 2 ) ”
).

Definition pw_rvv_header_partial_solve_wit_3_pure_split_goal_1 := 
forall (count_pre: Z) (p_pre: Z) (b_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (x3: Z) (x2: Z) (PreH1 : (count_pre <= UINT64_MAX)) (PreH2 : (count_pre >= 0)) (PreH3 : ((pw_load_lane (F) (b_pre) (0)) <= UINT_MAX)) (PreH4 : ((pw_load_lane (F) (b_pre) (1)) <= UINT_MAX)) (PreH5 : (x2 <= UINT_MAX)) (PreH6 : (x3 <= UINT_MAX)) (PreH7 : ((pw_load_lane (F) (b_pre) (0)) >= 0)) (PreH8 : ((pw_load_lane (F) (b_pre) (1)) >= 0)) (PreH9 : (x2 >= 0)) (PreH10 : (x3 >= 0)) (PreH11 : (count_pre = 2)) (PreH12 : (b_pre <> 0)) (PreH13 : (pw_header_pre F W b_pre p_pre count_pre )) ,
  ((&(( &( "v" ) )->ₛ "s3")) # UInt  |-> x3)
  **  ((&(( &( "v" ) )->ₛ "s2")) # UInt  |-> x2)
  **  ((&(( &( "v" ) )->ₛ "s1")) # UInt  |-> (pw_load_lane (F) (b_pre) (1)))
  **  ((&(( &( "v" ) )->ₛ "s0")) # UInt  |-> (pw_load_lane (F) (b_pre) (0)))
  **  (pw_data F )
  **  ((( &( "b" ) )) # Ptr  |-> b_pre)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "count" ) )) # UInt64  |-> count_pre)
  **  (pw_output W O )
|--
  “ (pw_write_window W p_pre 2 ) ”
.

Definition pw_rvv_header_partial_solve_wit_3_aux := 
forall (count_pre: Z) (p_pre: Z) (b_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (x3: Z) (x2: Z) (PreH1 : (count_pre = 2)) (PreH2 : (b_pre <> 0)) (PreH3 : (pw_header_pre F W b_pre p_pre count_pre )) ,
  ((&(( &( "v" ) )->ₛ "s3")) # UInt  |-> x3)
  **  ((&(( &( "v" ) )->ₛ "s2")) # UInt  |-> x2)
  **  ((&(( &( "v" ) )->ₛ "s1")) # UInt  |-> (pw_load_lane (F) (b_pre) (1)))
  **  ((&(( &( "v" ) )->ₛ "s0")) # UInt  |-> (pw_load_lane (F) (b_pre) (0)))
  **  (pw_data F )
  **  (pw_output W O )
|--
  “ (2 = 2) ” 
  &&  “ (pw_write_window W p_pre 2 ) ” 
  &&  “ (count_pre = 2) ” 
  &&  “ (b_pre <> 0) ” 
  &&  “ (pw_header_pre F W b_pre p_pre count_pre ) ”
  &&  (pw_output W O )
  **  ((&(( &( "v" ) )->ₛ "s0")) # UInt  |-> (pw_load_lane (F) (b_pre) (0)))
  **  ((&(( &( "v" ) )->ₛ "s1")) # UInt  |-> (pw_load_lane (F) (b_pre) (1)))
  **  ((&(( &( "v" ) )->ₛ "s2")) # UInt  |-> x2)
  **  ((&(( &( "v" ) )->ₛ "s3")) # UInt  |-> x3)
  **  (pw_data F )
.

Definition pw_rvv_header_partial_solve_wit_3 := pw_rvv_header_partial_solve_wit_3_pure -> pw_rvv_header_partial_solve_wit_3_aux.

Definition pw_rvv_header_partial_solve_wit_4_pure := 
(
forall (count_pre: Z) (p_pre: Z) (b_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (PreH1 : (count_pre <> 2)) (PreH2 : (b_pre <> 0)) (PreH3 : (pw_header_pre F W b_pre p_pre count_pre )) ,
  ((( &( "x" ) )) # UInt  |->_)
  **  ((( &( "b" ) )) # Ptr  |-> b_pre)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "count" ) )) # UInt64  |-> count_pre)
  **  (pw_data F )
  **  (pw_output W O )
|--
  “ (pw_present F b_pre ) ” 
  &&  “ (pw_map_nodup F ) ” 
  &&  “ (b_pre > 0) ”
) \/
(
forall (count_pre: Z) (p_pre: Z) (b_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (PreH1 : (count_pre <= UINT64_MAX)) (PreH2 : (count_pre >= 0)) (PreH3 : (count_pre <> 2)) (PreH4 : (b_pre <> 0)) (PreH5 : (pw_header_pre F W b_pre p_pre count_pre )) ,
  ((( &( "x" ) )) # UInt  |->_)
  **  ((( &( "b" ) )) # Ptr  |-> b_pre)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "count" ) )) # UInt64  |-> count_pre)
  **  (pw_data F )
  **  (pw_output W O )
|--
  “ (b_pre > 0) ” 
  &&  “ (pw_map_nodup F ) ” 
  &&  “ (pw_present F b_pre ) ”
).

Definition pw_rvv_header_partial_solve_wit_4_pure_split_goal_1 := 
forall (count_pre: Z) (p_pre: Z) (b_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (PreH1 : (count_pre <= UINT64_MAX)) (PreH2 : (count_pre >= 0)) (PreH3 : (count_pre <> 2)) (PreH4 : (b_pre <> 0)) (PreH5 : (pw_header_pre F W b_pre p_pre count_pre )) ,
  ((( &( "x" ) )) # UInt  |->_)
  **  ((( &( "b" ) )) # Ptr  |-> b_pre)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "count" ) )) # UInt64  |-> count_pre)
  **  (pw_data F )
  **  (pw_output W O )
|--
  “ (b_pre > 0) ”
.

Definition pw_rvv_header_partial_solve_wit_4_pure_split_goal_2 := 
forall (count_pre: Z) (p_pre: Z) (b_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (PreH1 : (count_pre <= UINT64_MAX)) (PreH2 : (count_pre >= 0)) (PreH3 : (count_pre <> 2)) (PreH4 : (b_pre <> 0)) (PreH5 : (pw_header_pre F W b_pre p_pre count_pre )) ,
  ((( &( "x" ) )) # UInt  |->_)
  **  ((( &( "b" ) )) # Ptr  |-> b_pre)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "count" ) )) # UInt64  |-> count_pre)
  **  (pw_data F )
  **  (pw_output W O )
|--
  “ (pw_map_nodup F ) ”
.

Definition pw_rvv_header_partial_solve_wit_4_pure_split_goal_3 := 
forall (count_pre: Z) (p_pre: Z) (b_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (PreH1 : (count_pre <= UINT64_MAX)) (PreH2 : (count_pre >= 0)) (PreH3 : (count_pre <> 2)) (PreH4 : (b_pre <> 0)) (PreH5 : (pw_header_pre F W b_pre p_pre count_pre )) ,
  ((( &( "x" ) )) # UInt  |->_)
  **  ((( &( "b" ) )) # Ptr  |-> b_pre)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "count" ) )) # UInt64  |-> count_pre)
  **  (pw_data F )
  **  (pw_output W O )
|--
  “ (pw_present F b_pre ) ”
.

Definition pw_rvv_header_partial_solve_wit_4_aux := 
forall (count_pre: Z) (p_pre: Z) (b_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (PreH1 : (count_pre <> 2)) (PreH2 : (b_pre <> 0)) (PreH3 : (pw_header_pre F W b_pre p_pre count_pre )) ,
  (pw_data F )
  **  (pw_output W O )
|--
  “ (pw_present F b_pre ) ” 
  &&  “ (pw_map_nodup F ) ” 
  &&  “ (b_pre > 0) ” 
  &&  “ (count_pre <> 2) ” 
  &&  “ (b_pre <> 0) ” 
  &&  “ (pw_header_pre F W b_pre p_pre count_pre ) ”
  &&  (pw_data F )
  **  (pw_output W O )
.

Definition pw_rvv_header_partial_solve_wit_4 := pw_rvv_header_partial_solve_wit_4_pure -> pw_rvv_header_partial_solve_wit_4_aux.

Definition pw_rvv_header_partial_solve_wit_5_pure := 
(
forall (count_pre: Z) (p_pre: Z) (b_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (retval: Z) (PreH1 : (retval = (pw_get (F) (b_pre)))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= UINT_MAX)) (PreH4 : (count_pre <> 2)) (PreH5 : (b_pre <> 0)) (PreH6 : (pw_header_pre F W b_pre p_pre count_pre )) ,
  (pw_data F )
  **  ((( &( "x" ) )) # UInt  |-> retval)
  **  ((( &( "b" ) )) # Ptr  |-> b_pre)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "count" ) )) # UInt64  |-> count_pre)
  **  (pw_output W O )
|--
  “ (In p_pre W ) ” 
  &&  “ (NoDup W ) ” 
  &&  “ (p_pre > 0) ”
) \/
(
forall (count_pre: Z) (p_pre: Z) (b_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (retval: Z) (PreH1 : (count_pre <= UINT64_MAX)) (PreH2 : (count_pre >= 0)) (PreH3 : (retval <= UINT_MAX)) (PreH4 : (retval >= 0)) (PreH5 : (retval = (pw_get (F) (b_pre)))) (PreH6 : (0 <= retval)) (PreH7 : (retval <= UINT_MAX)) (PreH8 : (count_pre <> 2)) (PreH9 : (b_pre <> 0)) (PreH10 : (pw_header_pre F W b_pre p_pre count_pre )) ,
  (pw_data F )
  **  ((( &( "x" ) )) # UInt  |-> retval)
  **  ((( &( "b" ) )) # Ptr  |-> b_pre)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "count" ) )) # UInt64  |-> count_pre)
  **  (pw_output W O )
|--
  “ (p_pre > 0) ” 
  &&  “ (NoDup W ) ” 
  &&  “ (In p_pre W ) ”
).

Definition pw_rvv_header_partial_solve_wit_5_pure_split_goal_1 := 
forall (count_pre: Z) (p_pre: Z) (b_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (retval: Z) (PreH1 : (count_pre <= UINT64_MAX)) (PreH2 : (count_pre >= 0)) (PreH3 : (retval <= UINT_MAX)) (PreH4 : (retval >= 0)) (PreH5 : (retval = (pw_get (F) (b_pre)))) (PreH6 : (0 <= retval)) (PreH7 : (retval <= UINT_MAX)) (PreH8 : (count_pre <> 2)) (PreH9 : (b_pre <> 0)) (PreH10 : (pw_header_pre F W b_pre p_pre count_pre )) ,
  (pw_data F )
  **  ((( &( "x" ) )) # UInt  |-> retval)
  **  ((( &( "b" ) )) # Ptr  |-> b_pre)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "count" ) )) # UInt64  |-> count_pre)
  **  (pw_output W O )
|--
  “ (p_pre > 0) ”
.

Definition pw_rvv_header_partial_solve_wit_5_pure_split_goal_2 := 
forall (count_pre: Z) (p_pre: Z) (b_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (retval: Z) (PreH1 : (count_pre <= UINT64_MAX)) (PreH2 : (count_pre >= 0)) (PreH3 : (retval <= UINT_MAX)) (PreH4 : (retval >= 0)) (PreH5 : (retval = (pw_get (F) (b_pre)))) (PreH6 : (0 <= retval)) (PreH7 : (retval <= UINT_MAX)) (PreH8 : (count_pre <> 2)) (PreH9 : (b_pre <> 0)) (PreH10 : (pw_header_pre F W b_pre p_pre count_pre )) ,
  (pw_data F )
  **  ((( &( "x" ) )) # UInt  |-> retval)
  **  ((( &( "b" ) )) # Ptr  |-> b_pre)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "count" ) )) # UInt64  |-> count_pre)
  **  (pw_output W O )
|--
  “ (NoDup W ) ”
.

Definition pw_rvv_header_partial_solve_wit_5_pure_split_goal_3 := 
forall (count_pre: Z) (p_pre: Z) (b_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (retval: Z) (PreH1 : (count_pre <= UINT64_MAX)) (PreH2 : (count_pre >= 0)) (PreH3 : (retval <= UINT_MAX)) (PreH4 : (retval >= 0)) (PreH5 : (retval = (pw_get (F) (b_pre)))) (PreH6 : (0 <= retval)) (PreH7 : (retval <= UINT_MAX)) (PreH8 : (count_pre <> 2)) (PreH9 : (b_pre <> 0)) (PreH10 : (pw_header_pre F W b_pre p_pre count_pre )) ,
  (pw_data F )
  **  ((( &( "x" ) )) # UInt  |-> retval)
  **  ((( &( "b" ) )) # Ptr  |-> b_pre)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "count" ) )) # UInt64  |-> count_pre)
  **  (pw_output W O )
|--
  “ (In p_pre W ) ”
.

Definition pw_rvv_header_partial_solve_wit_5_aux := 
forall (count_pre: Z) (p_pre: Z) (b_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (retval: Z) (PreH1 : (retval = (pw_get (F) (b_pre)))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= UINT_MAX)) (PreH4 : (count_pre <> 2)) (PreH5 : (b_pre <> 0)) (PreH6 : (pw_header_pre F W b_pre p_pre count_pre )) ,
  (pw_data F )
  **  (pw_output W O )
|--
  “ (In p_pre W ) ” 
  &&  “ (NoDup W ) ” 
  &&  “ (p_pre > 0) ” 
  &&  “ (retval = (pw_get (F) (b_pre))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= UINT_MAX) ” 
  &&  “ (count_pre <> 2) ” 
  &&  “ (b_pre <> 0) ” 
  &&  “ (pw_header_pre F W b_pre p_pre count_pre ) ”
  &&  (pw_output W O )
  **  (pw_data F )
.

Definition pw_rvv_header_partial_solve_wit_5 := pw_rvv_header_partial_solve_wit_5_pure -> pw_rvv_header_partial_solve_wit_5_aux.

Definition pw_rvv_header_partial_solve_wit_6_pure := 
forall (count_pre: Z) (p_pre: Z) (b_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (PreH1 : (b_pre = 0)) (PreH2 : (pw_header_pre F W b_pre p_pre count_pre )) ,
  (UndefStructPredvuint32m1_t ( &( "z" ) ) )
  **  ((( &( "b" ) )) # Ptr  |-> b_pre)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "count" ) )) # UInt64  |-> count_pre)
  **  (pw_data F )
  **  (pw_output W O )
|--
  “ (2 = 2) ”
.

Definition pw_rvv_header_partial_solve_wit_6_aux := 
forall (count_pre: Z) (p_pre: Z) (b_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (PreH1 : (b_pre = 0)) (PreH2 : (pw_header_pre F W b_pre p_pre count_pre )) ,
  (UndefStructPredvuint32m1_t ( &( "z" ) ) )
  **  (pw_data F )
  **  (pw_output W O )
|--
  “ (2 = 2) ” 
  &&  “ (b_pre = 0) ” 
  &&  “ (pw_header_pre F W b_pre p_pre count_pre ) ”
  &&  (UndefStructPredvuint32m1_t ( &( "z" ) ) )
  **  (pw_data F )
  **  (pw_output W O )
.

Definition pw_rvv_header_partial_solve_wit_6 := pw_rvv_header_partial_solve_wit_6_pure -> pw_rvv_header_partial_solve_wit_6_aux.

Definition pw_rvv_header_partial_solve_wit_7 := 
forall (count_pre: Z) (p_pre: Z) (b_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (x3: Z) (x2: Z) (retval: Z) (PreH1 : (b_pre = 0)) (PreH2 : (pw_header_pre F W b_pre p_pre count_pre )) ,
  ((&((retval)  # "vuint32m1_t" ->ₛ "s0")) # UInt  |-> 0)
  **  ((&((retval)  # "vuint32m1_t" ->ₛ "s1")) # UInt  |-> 0)
  **  ((&((retval)  # "vuint32m1_t" ->ₛ "s2")) # UInt  |-> x2)
  **  ((&((retval)  # "vuint32m1_t" ->ₛ "s3")) # UInt  |-> x3)
  **  (UndefStructPredvuint32m1_t ( &( "z" ) ) )
  **  (pw_data F )
  **  (pw_output W O )
|--
  “ (b_pre = 0) ” 
  &&  “ (pw_header_pre F W b_pre p_pre count_pre ) ”
  &&  ((&(( &( "z" ) )->ₛ "s3")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m1_t" ->ₛ "s3")) # UInt  |-> x3)
  **  ((&(( &( "z" ) )->ₛ "s2")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m1_t" ->ₛ "s2")) # UInt  |-> x2)
  **  ((&(( &( "z" ) )->ₛ "s1")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m1_t" ->ₛ "s1")) # UInt  |-> 0)
  **  ((&(( &( "z" ) )->ₛ "s0")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m1_t" ->ₛ "s0")) # UInt  |-> 0)
  **  (pw_data F )
  **  (pw_output W O )
.

Definition pw_rvv_header_partial_solve_wit_8_pure := 
(
forall (count_pre: Z) (p_pre: Z) (b_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (x3: Z) (x2: Z) (PreH1 : (b_pre = 0)) (PreH2 : (pw_header_pre F W b_pre p_pre count_pre )) ,
  ((&(( &( "z" ) )->ₛ "s3")) # UInt  |-> x3)
  **  ((&(( &( "z" ) )->ₛ "s2")) # UInt  |-> x2)
  **  ((&(( &( "z" ) )->ₛ "s1")) # UInt  |-> 0)
  **  ((&(( &( "z" ) )->ₛ "s0")) # UInt  |-> 0)
  **  ((( &( "b" ) )) # Ptr  |-> b_pre)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "count" ) )) # UInt64  |-> count_pre)
  **  (pw_data F )
  **  (pw_output W O )
|--
  “ (2 = 2) ” 
  &&  “ (pw_write_window W p_pre 2 ) ”
) \/
(
forall (count_pre: Z) (p_pre: Z) (b_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (x3: Z) (x2: Z) (PreH1 : (count_pre <= UINT64_MAX)) (PreH2 : (count_pre >= 0)) (PreH3 : (0 <= UINT_MAX)) (PreH4 : (x2 <= UINT_MAX)) (PreH5 : (x3 <= UINT_MAX)) (PreH6 : (0 >= 0)) (PreH7 : (x2 >= 0)) (PreH8 : (x3 >= 0)) (PreH9 : (b_pre = 0)) (PreH10 : (pw_header_pre F W b_pre p_pre count_pre )) ,
  ((&(( &( "z" ) )->ₛ "s3")) # UInt  |-> x3)
  **  ((&(( &( "z" ) )->ₛ "s2")) # UInt  |-> x2)
  **  ((&(( &( "z" ) )->ₛ "s1")) # UInt  |-> 0)
  **  ((&(( &( "z" ) )->ₛ "s0")) # UInt  |-> 0)
  **  ((( &( "b" ) )) # Ptr  |-> b_pre)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "count" ) )) # UInt64  |-> count_pre)
  **  (pw_data F )
  **  (pw_output W O )
|--
  “ (pw_write_window W p_pre 2 ) ”
).

Definition pw_rvv_header_partial_solve_wit_8_pure_split_goal_1 := 
forall (count_pre: Z) (p_pre: Z) (b_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (x3: Z) (x2: Z) (PreH1 : (count_pre <= UINT64_MAX)) (PreH2 : (count_pre >= 0)) (PreH3 : (0 <= UINT_MAX)) (PreH4 : (x2 <= UINT_MAX)) (PreH5 : (x3 <= UINT_MAX)) (PreH6 : (0 >= 0)) (PreH7 : (x2 >= 0)) (PreH8 : (x3 >= 0)) (PreH9 : (b_pre = 0)) (PreH10 : (pw_header_pre F W b_pre p_pre count_pre )) ,
  ((&(( &( "z" ) )->ₛ "s3")) # UInt  |-> x3)
  **  ((&(( &( "z" ) )->ₛ "s2")) # UInt  |-> x2)
  **  ((&(( &( "z" ) )->ₛ "s1")) # UInt  |-> 0)
  **  ((&(( &( "z" ) )->ₛ "s0")) # UInt  |-> 0)
  **  ((( &( "b" ) )) # Ptr  |-> b_pre)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "count" ) )) # UInt64  |-> count_pre)
  **  (pw_data F )
  **  (pw_output W O )
|--
  “ (pw_write_window W p_pre 2 ) ”
.

Definition pw_rvv_header_partial_solve_wit_8_aux := 
forall (count_pre: Z) (p_pre: Z) (b_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (x3: Z) (x2: Z) (PreH1 : (b_pre = 0)) (PreH2 : (pw_header_pre F W b_pre p_pre count_pre )) ,
  ((&(( &( "z" ) )->ₛ "s3")) # UInt  |-> x3)
  **  ((&(( &( "z" ) )->ₛ "s2")) # UInt  |-> x2)
  **  ((&(( &( "z" ) )->ₛ "s1")) # UInt  |-> 0)
  **  ((&(( &( "z" ) )->ₛ "s0")) # UInt  |-> 0)
  **  (pw_data F )
  **  (pw_output W O )
|--
  “ (2 = 2) ” 
  &&  “ (pw_write_window W p_pre 2 ) ” 
  &&  “ (b_pre = 0) ” 
  &&  “ (pw_header_pre F W b_pre p_pre count_pre ) ”
  &&  (pw_output W O )
  **  ((&(( &( "z" ) )->ₛ "s0")) # UInt  |-> 0)
  **  ((&(( &( "z" ) )->ₛ "s1")) # UInt  |-> 0)
  **  ((&(( &( "z" ) )->ₛ "s2")) # UInt  |-> x2)
  **  ((&(( &( "z" ) )->ₛ "s3")) # UInt  |-> x3)
  **  (pw_data F )
.

Definition pw_rvv_header_partial_solve_wit_8 := pw_rvv_header_partial_solve_wit_8_pure -> pw_rvv_header_partial_solve_wit_8_aux.

Module Type VC_Correct.


Axiom proof_of_pw_rvv_header_safety_wit_1 : pw_rvv_header_safety_wit_1.
Axiom proof_of_pw_rvv_header_safety_wit_2 : pw_rvv_header_safety_wit_2.
Axiom proof_of_pw_rvv_header_safety_wit_3 : pw_rvv_header_safety_wit_3.
Axiom proof_of_pw_rvv_header_safety_wit_4 : pw_rvv_header_safety_wit_4.
Axiom proof_of_pw_rvv_header_safety_wit_5 : pw_rvv_header_safety_wit_5.
Axiom proof_of_pw_rvv_header_safety_wit_6 : pw_rvv_header_safety_wit_6.
Axiom proof_of_pw_rvv_header_safety_wit_7 : pw_rvv_header_safety_wit_7.
Axiom proof_of_pw_rvv_header_return_wit_1 : pw_rvv_header_return_wit_1.
Axiom proof_of_pw_rvv_header_return_wit_2 : pw_rvv_header_return_wit_2.
Axiom proof_of_pw_rvv_header_return_wit_3 : pw_rvv_header_return_wit_3.
Axiom proof_of_pw_rvv_header_partial_solve_wit_1_pure : pw_rvv_header_partial_solve_wit_1_pure.
Axiom proof_of_pw_rvv_header_partial_solve_wit_1 : pw_rvv_header_partial_solve_wit_1.
Axiom proof_of_pw_rvv_header_partial_solve_wit_2 : pw_rvv_header_partial_solve_wit_2.
Axiom proof_of_pw_rvv_header_partial_solve_wit_3_pure : pw_rvv_header_partial_solve_wit_3_pure.
Axiom proof_of_pw_rvv_header_partial_solve_wit_3 : pw_rvv_header_partial_solve_wit_3.
Axiom proof_of_pw_rvv_header_partial_solve_wit_4_pure : pw_rvv_header_partial_solve_wit_4_pure.
Axiom proof_of_pw_rvv_header_partial_solve_wit_4 : pw_rvv_header_partial_solve_wit_4.
Axiom proof_of_pw_rvv_header_partial_solve_wit_5_pure : pw_rvv_header_partial_solve_wit_5_pure.
Axiom proof_of_pw_rvv_header_partial_solve_wit_5 : pw_rvv_header_partial_solve_wit_5.
Axiom proof_of_pw_rvv_header_partial_solve_wit_6_pure : pw_rvv_header_partial_solve_wit_6_pure.
Axiom proof_of_pw_rvv_header_partial_solve_wit_6 : pw_rvv_header_partial_solve_wit_6.
Axiom proof_of_pw_rvv_header_partial_solve_wit_7 : pw_rvv_header_partial_solve_wit_7.
Axiom proof_of_pw_rvv_header_partial_solve_wit_8_pure : pw_rvv_header_partial_solve_wit_8_pure.
Axiom proof_of_pw_rvv_header_partial_solve_wit_8 : pw_rvv_header_partial_solve_wit_8.

End VC_Correct.
