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
Require Import X32Packw.AccessModel.
Local Open Scope sac.

(*----- Function pw_neon_odd -----*)

Definition pw_neon_odd_safety_wit_1 := 
forall (p_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (p: Z) (k: Z) (a: Z) (PreH1 : (pw_map_nodup F )) (PreH2 : (pw_odd_pre F W a_pre p_pre kc_pre )) (PreH3 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH4 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH5 : (0 <= k)) (PreH6 : (k <= kc_pre)) ,
  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a)
  **  ((( &( "k" ) )) # UInt64  |-> k)
  **  ((( &( "p" ) )) # Ptr  |-> p)
  **  (pw_data F )
  **  (pw_output W (pw_odd_run ((kc_pre - k )) (F) (a_pre) (p_pre) (O)) )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition pw_neon_odd_safety_wit_2 := 
forall (p_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (p: Z) (k: Z) (a: Z) (retval: Z) (PreH1 : (retval = (pw_get (F) (a)))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= UINT_MAX)) (PreH4 : (k <> 0)) (PreH5 : (pw_map_nodup F )) (PreH6 : (pw_odd_pre F W a_pre p_pre kc_pre )) (PreH7 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH8 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH9 : (0 <= k)) (PreH10 : (k <= kc_pre)) ,
  (pw_data F )
  **  ((( &( "x" ) )) # UInt  |-> retval)
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a)
  **  ((( &( "k" ) )) # UInt64  |-> k)
  **  ((( &( "p" ) )) # Ptr  |-> p)
  **  (pw_output W (pw_odd_run ((kc_pre - k )) (F) (a_pre) (p_pre) (O)) )
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition pw_neon_odd_safety_wit_3 := 
forall (p_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (p: Z) (k: Z) (a: Z) (retval: Z) (PreH1 : (retval = (pw_get (F) (a)))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= UINT_MAX)) (PreH4 : (k <> 0)) (PreH5 : (pw_map_nodup F )) (PreH6 : (pw_odd_pre F W a_pre p_pre kc_pre )) (PreH7 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH8 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH9 : (0 <= k)) (PreH10 : (k <= kc_pre)) ,
  (pw_output W (pw_output_put ((pw_odd_run ((kc_pre - k )) (F) (a_pre) (p_pre) (O))) (p) (retval)) )
  **  (pw_data F )
  **  ((( &( "x" ) )) # UInt  |-> retval)
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "a" ) )) # Ptr  |-> (a + (1 * sizeof(UINT))))
  **  ((( &( "k" ) )) # UInt64  |-> k)
  **  ((( &( "p" ) )) # Ptr  |-> p)
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition pw_neon_odd_safety_wit_4 := 
forall (p_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (p: Z) (k: Z) (a: Z) (retval: Z) (PreH1 : (retval = (pw_get (F) (a)))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= UINT_MAX)) (PreH4 : (k <> 0)) (PreH5 : (pw_map_nodup F )) (PreH6 : (pw_odd_pre F W a_pre p_pre kc_pre )) (PreH7 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH8 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH9 : (0 <= k)) (PreH10 : (k <= kc_pre)) ,
  (pw_output W (pw_output_put ((pw_odd_run ((kc_pre - k )) (F) (a_pre) (p_pre) (O))) (p) (retval)) )
  **  (pw_data F )
  **  ((( &( "x" ) )) # UInt  |-> retval)
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "a" ) )) # Ptr  |-> (a + (1 * sizeof(UINT))))
  **  ((( &( "k" ) )) # UInt64  |-> k)
  **  ((( &( "p" ) )) # Ptr  |-> (p + (2 * sizeof(UINT))))
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition pw_neon_odd_entail_wit_1 := 
(
forall (p_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (PreH1 : (pw_map_nodup F )) (PreH2 : (pw_odd_pre F W a_pre p_pre kc_pre )) ,
  (pw_data F )
  **  (pw_output W O )
|--
  “ (pw_map_nodup F ) ” 
  &&  “ (pw_odd_pre F W a_pre p_pre kc_pre ) ” 
  &&  “ (a_pre = (pw_offset (a_pre) ((4 * (kc_pre - kc_pre ) )))) ” 
  &&  “ (p_pre = (pw_offset (p_pre) ((8 * (kc_pre - kc_pre ) )))) ” 
  &&  “ (0 <= kc_pre) ” 
  &&  “ (kc_pre <= kc_pre) ”
  &&  (pw_data F )
  **  (pw_output W (pw_odd_run ((kc_pre - kc_pre )) (F) (a_pre) (p_pre) (O)) )
) \/
(
forall (p_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (PreH1 : (pw_map_nodup F )) (PreH2 : (pw_odd_pre F W a_pre p_pre kc_pre )) ,
  (pw_data F )
  **  (pw_output W O )
|--
  “ (0 <= kc_pre) ” 
  &&  “ (p_pre = (pw_offset (p_pre) ((8 * (kc_pre - kc_pre ) )))) ” 
  &&  “ (a_pre = (pw_offset (a_pre) ((4 * (kc_pre - kc_pre ) )))) ”
  &&  (pw_data F )
  **  (pw_output W (pw_odd_run ((kc_pre - kc_pre )) (F) (a_pre) (p_pre) (O)) )
).

Definition pw_neon_odd_entail_wit_1_split_goal_1 := 
forall (p_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (PreH1 : (pw_map_nodup F )) (PreH2 : (pw_odd_pre F W a_pre p_pre kc_pre )) ,
  (pw_data F )
  **  (pw_output W O )
|--
  “ (0 <= kc_pre) ”
.

Definition pw_neon_odd_entail_wit_1_split_goal_2 := 
forall (p_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (PreH1 : (pw_map_nodup F )) (PreH2 : (pw_odd_pre F W a_pre p_pre kc_pre )) ,
  (pw_data F )
  **  (pw_output W O )
|--
  “ (p_pre = (pw_offset (p_pre) ((8 * (kc_pre - kc_pre ) )))) ”
.

Definition pw_neon_odd_entail_wit_1_split_goal_3 := 
forall (p_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (PreH1 : (pw_map_nodup F )) (PreH2 : (pw_odd_pre F W a_pre p_pre kc_pre )) ,
  (pw_data F )
  **  (pw_output W O )
|--
  “ (a_pre = (pw_offset (a_pre) ((4 * (kc_pre - kc_pre ) )))) ”
.

Definition pw_neon_odd_entail_wit_1_split_goal_spatial := 
forall (p_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (PreH1 : (pw_map_nodup F )) (PreH2 : (pw_odd_pre F W a_pre p_pre kc_pre )) ,
  (pw_data F )
  **  (pw_output W O )
|--
  (pw_data F )
  **  (pw_output W (pw_odd_run ((kc_pre - kc_pre )) (F) (a_pre) (p_pre) (O)) )
.

Definition pw_neon_odd_entail_wit_2 := 
(
forall (p_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (p: Z) (k: Z) (a: Z) (retval: Z) (PreH1 : (retval = (pw_get (F) (a)))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= UINT_MAX)) (PreH4 : (k <> 0)) (PreH5 : (pw_map_nodup F )) (PreH6 : (pw_odd_pre F W a_pre p_pre kc_pre )) (PreH7 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH8 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH9 : (0 <= k)) (PreH10 : (k <= kc_pre)) ,
  (pw_output W (pw_output_put ((pw_odd_run ((kc_pre - k )) (F) (a_pre) (p_pre) (O))) (p) (retval)) )
  **  (pw_data F )
|--
  “ (pw_map_nodup F ) ” 
  &&  “ (pw_odd_pre F W a_pre p_pre kc_pre ) ” 
  &&  “ ((a + (1 * sizeof(UINT))) = (pw_offset (a_pre) ((4 * (kc_pre - (k - 1 ) ) )))) ” 
  &&  “ ((p + (2 * sizeof(UINT))) = (pw_offset (p_pre) ((8 * (kc_pre - (k - 1 ) ) )))) ” 
  &&  “ (0 <= (k - 1 )) ” 
  &&  “ ((k - 1 ) <= kc_pre) ”
  &&  (pw_data F )
  **  (pw_output W (pw_odd_run ((kc_pre - (k - 1 ) )) (F) (a_pre) (p_pre) (O)) )
) \/
(
forall (p_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (p: Z) (k: Z) (a: Z) (retval: Z) (PreH1 : (retval = (pw_get (F) (a)))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= UINT_MAX)) (PreH4 : (k <> 0)) (PreH5 : (pw_map_nodup F )) (PreH6 : (pw_odd_pre F W a_pre p_pre kc_pre )) (PreH7 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH8 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH9 : (0 <= k)) (PreH10 : (k <= kc_pre)) ,
  (pw_output W (pw_output_put ((pw_odd_run ((kc_pre - k )) (F) (a_pre) (p_pre) (O))) (p) (retval)) )
  **  (pw_data F )
|--
  “ ((p + (2 * sizeof(UINT))) = (pw_offset (p_pre) ((8 * (kc_pre - (k - 1 ) ) )))) ” 
  &&  “ ((a + (1 * sizeof(UINT))) = (pw_offset (a_pre) ((4 * (kc_pre - (k - 1 ) ) )))) ”
  &&  (pw_data F )
  **  (pw_output W (pw_odd_run ((kc_pre - (k - 1 ) )) (F) (a_pre) (p_pre) (O)) )
).

Definition pw_neon_odd_entail_wit_2_split_goal_1 := 
forall (p_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (p: Z) (k: Z) (a: Z) (retval: Z) (PreH1 : (retval = (pw_get (F) (a)))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= UINT_MAX)) (PreH4 : (k <> 0)) (PreH5 : (pw_map_nodup F )) (PreH6 : (pw_odd_pre F W a_pre p_pre kc_pre )) (PreH7 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH8 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH9 : (0 <= k)) (PreH10 : (k <= kc_pre)) ,
  (pw_output W (pw_output_put ((pw_odd_run ((kc_pre - k )) (F) (a_pre) (p_pre) (O))) (p) (retval)) )
  **  (pw_data F )
|--
  “ ((p + (2 * sizeof(UINT))) = (pw_offset (p_pre) ((8 * (kc_pre - (k - 1 ) ) )))) ”
.

Definition pw_neon_odd_entail_wit_2_split_goal_2 := 
forall (p_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (p: Z) (k: Z) (a: Z) (retval: Z) (PreH1 : (retval = (pw_get (F) (a)))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= UINT_MAX)) (PreH4 : (k <> 0)) (PreH5 : (pw_map_nodup F )) (PreH6 : (pw_odd_pre F W a_pre p_pre kc_pre )) (PreH7 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH8 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH9 : (0 <= k)) (PreH10 : (k <= kc_pre)) ,
  (pw_output W (pw_output_put ((pw_odd_run ((kc_pre - k )) (F) (a_pre) (p_pre) (O))) (p) (retval)) )
  **  (pw_data F )
|--
  “ ((a + (1 * sizeof(UINT))) = (pw_offset (a_pre) ((4 * (kc_pre - (k - 1 ) ) )))) ”
.

Definition pw_neon_odd_entail_wit_2_split_goal_spatial := 
forall (p_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (p: Z) (k: Z) (a: Z) (retval: Z) (PreH1 : (retval = (pw_get (F) (a)))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= UINT_MAX)) (PreH4 : (k <> 0)) (PreH5 : (pw_map_nodup F )) (PreH6 : (pw_odd_pre F W a_pre p_pre kc_pre )) (PreH7 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH8 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH9 : (0 <= k)) (PreH10 : (k <= kc_pre)) ,
  (pw_output W (pw_output_put ((pw_odd_run ((kc_pre - k )) (F) (a_pre) (p_pre) (O))) (p) (retval)) )
  **  (pw_data F )
|--
  (pw_data F )
  **  (pw_output W (pw_odd_run ((kc_pre - (k - 1 ) )) (F) (a_pre) (p_pre) (O)) )
.

Definition pw_neon_odd_return_wit_1 := 
(
forall (p_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (p: Z) (k: Z) (a: Z) (PreH1 : (k = 0)) (PreH2 : (pw_map_nodup F )) (PreH3 : (pw_odd_pre F W a_pre p_pre kc_pre )) (PreH4 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH5 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH6 : (0 <= k)) (PreH7 : (k <= kc_pre)) ,
  (pw_data F )
  **  (pw_output W (pw_odd_run ((kc_pre - k )) (F) (a_pre) (p_pre) (O)) )
|--
  (pw_data F )
  **  (pw_output W (pw_odd_run (kc_pre) (F) (a_pre) (p_pre) (O)) )
) \/
(
forall (p_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (p: Z) (k: Z) (a: Z) (PreH1 : (k = 0)) (PreH2 : (pw_map_nodup F )) (PreH3 : (pw_odd_pre F W a_pre p_pre kc_pre )) (PreH4 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH5 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH6 : (0 <= k)) (PreH7 : (k <= kc_pre)) ,
  (pw_data F )
  **  (pw_output W (pw_odd_run ((kc_pre - k )) (F) (a_pre) (p_pre) (O)) )
|--
  (pw_data F )
  **  (pw_output W (pw_odd_run (kc_pre) (F) (a_pre) (p_pre) (O)) )
).

Definition pw_neon_odd_return_wit_1_split_goal_spatial := 
forall (p_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (p: Z) (k: Z) (a: Z) (PreH1 : (k = 0)) (PreH2 : (pw_map_nodup F )) (PreH3 : (pw_odd_pre F W a_pre p_pre kc_pre )) (PreH4 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH5 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH6 : (0 <= k)) (PreH7 : (k <= kc_pre)) ,
  (pw_data F )
  **  (pw_output W (pw_odd_run ((kc_pre - k )) (F) (a_pre) (p_pre) (O)) )
|--
  (pw_data F )
  **  (pw_output W (pw_odd_run (kc_pre) (F) (a_pre) (p_pre) (O)) )
.

Definition pw_neon_odd_partial_solve_wit_1_pure := 
(
forall (p_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (p: Z) (k: Z) (a: Z) (PreH1 : (k <> 0)) (PreH2 : (pw_map_nodup F )) (PreH3 : (pw_odd_pre F W a_pre p_pre kc_pre )) (PreH4 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH5 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH6 : (0 <= k)) (PreH7 : (k <= kc_pre)) ,
  ((( &( "x" ) )) # UInt  |->_)
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a)
  **  ((( &( "k" ) )) # UInt64  |-> k)
  **  ((( &( "p" ) )) # Ptr  |-> p)
  **  (pw_data F )
  **  (pw_output W (pw_odd_run ((kc_pre - k )) (F) (a_pre) (p_pre) (O)) )
|--
  “ (pw_map_nodup F ) ” 
  &&  “ (pw_present F a ) ” 
  &&  “ (a > 0) ”
) \/
(
forall (p_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (p: Z) (k: Z) (a: Z) (PreH1 : (k <= UINT64_MAX)) (PreH2 : (kc_pre <= UINT64_MAX)) (PreH3 : (k >= 0)) (PreH4 : (kc_pre >= 0)) (PreH5 : (k <> 0)) (PreH6 : (pw_map_nodup F )) (PreH7 : (pw_odd_pre F W a_pre p_pre kc_pre )) (PreH8 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH9 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH10 : (0 <= k)) (PreH11 : (k <= kc_pre)) ,
  ((( &( "x" ) )) # UInt  |->_)
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a)
  **  ((( &( "k" ) )) # UInt64  |-> k)
  **  ((( &( "p" ) )) # Ptr  |-> p)
  **  (pw_data F )
  **  (pw_output W (pw_odd_run ((kc_pre - k )) (F) (a_pre) (p_pre) (O)) )
|--
  “ (a > 0) ” 
  &&  “ (pw_present F a ) ”
).

Definition pw_neon_odd_partial_solve_wit_1_pure_split_goal_1 := 
forall (p_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (p: Z) (k: Z) (a: Z) (PreH1 : (k <= UINT64_MAX)) (PreH2 : (kc_pre <= UINT64_MAX)) (PreH3 : (k >= 0)) (PreH4 : (kc_pre >= 0)) (PreH5 : (k <> 0)) (PreH6 : (pw_map_nodup F )) (PreH7 : (pw_odd_pre F W a_pre p_pre kc_pre )) (PreH8 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH9 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH10 : (0 <= k)) (PreH11 : (k <= kc_pre)) ,
  ((( &( "x" ) )) # UInt  |->_)
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a)
  **  ((( &( "k" ) )) # UInt64  |-> k)
  **  ((( &( "p" ) )) # Ptr  |-> p)
  **  (pw_data F )
  **  (pw_output W (pw_odd_run ((kc_pre - k )) (F) (a_pre) (p_pre) (O)) )
|--
  “ (a > 0) ”
.

Definition pw_neon_odd_partial_solve_wit_1_pure_split_goal_2 := 
forall (p_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (p: Z) (k: Z) (a: Z) (PreH1 : (k <= UINT64_MAX)) (PreH2 : (kc_pre <= UINT64_MAX)) (PreH3 : (k >= 0)) (PreH4 : (kc_pre >= 0)) (PreH5 : (k <> 0)) (PreH6 : (pw_map_nodup F )) (PreH7 : (pw_odd_pre F W a_pre p_pre kc_pre )) (PreH8 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH9 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH10 : (0 <= k)) (PreH11 : (k <= kc_pre)) ,
  ((( &( "x" ) )) # UInt  |->_)
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a)
  **  ((( &( "k" ) )) # UInt64  |-> k)
  **  ((( &( "p" ) )) # Ptr  |-> p)
  **  (pw_data F )
  **  (pw_output W (pw_odd_run ((kc_pre - k )) (F) (a_pre) (p_pre) (O)) )
|--
  “ (pw_present F a ) ”
.

Definition pw_neon_odd_partial_solve_wit_1_aux := 
forall (p_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (p: Z) (k: Z) (a: Z) (PreH1 : (k <> 0)) (PreH2 : (pw_map_nodup F )) (PreH3 : (pw_odd_pre F W a_pre p_pre kc_pre )) (PreH4 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH5 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH6 : (0 <= k)) (PreH7 : (k <= kc_pre)) ,
  (pw_data F )
  **  (pw_output W (pw_odd_run ((kc_pre - k )) (F) (a_pre) (p_pre) (O)) )
|--
  “ (pw_map_nodup F ) ” 
  &&  “ (pw_present F a ) ” 
  &&  “ (a > 0) ” 
  &&  “ (k <> 0) ” 
  &&  “ (pw_map_nodup F ) ” 
  &&  “ (pw_odd_pre F W a_pre p_pre kc_pre ) ” 
  &&  “ (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) )))) ” 
  &&  “ (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) )))) ” 
  &&  “ (0 <= k) ” 
  &&  “ (k <= kc_pre) ”
  &&  (pw_data F )
  **  (pw_output W (pw_odd_run ((kc_pre - k )) (F) (a_pre) (p_pre) (O)) )
.

Definition pw_neon_odd_partial_solve_wit_1 := pw_neon_odd_partial_solve_wit_1_pure -> pw_neon_odd_partial_solve_wit_1_aux.

Definition pw_neon_odd_partial_solve_wit_2_pure := 
(
forall (p_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (p: Z) (k: Z) (a: Z) (retval: Z) (PreH1 : (retval = (pw_get (F) (a)))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= UINT_MAX)) (PreH4 : (k <> 0)) (PreH5 : (pw_map_nodup F )) (PreH6 : (pw_odd_pre F W a_pre p_pre kc_pre )) (PreH7 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH8 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH9 : (0 <= k)) (PreH10 : (k <= kc_pre)) ,
  (pw_data F )
  **  ((( &( "x" ) )) # UInt  |-> retval)
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "a" ) )) # Ptr  |-> (a + (1 * sizeof(UINT))))
  **  ((( &( "k" ) )) # UInt64  |-> k)
  **  ((( &( "p" ) )) # Ptr  |-> p)
  **  (pw_output W (pw_odd_run ((kc_pre - k )) (F) (a_pre) (p_pre) (O)) )
|--
  “ (In p W ) ” 
  &&  “ (NoDup W ) ” 
  &&  “ (p > 0) ”
) \/
(
forall (p_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (p: Z) (k: Z) (a: Z) (retval: Z) (PreH1 : (k <= UINT64_MAX)) (PreH2 : (kc_pre <= UINT64_MAX)) (PreH3 : (k >= 0)) (PreH4 : (kc_pre >= 0)) (PreH5 : (retval <= UINT_MAX)) (PreH6 : (retval >= 0)) (PreH7 : (retval = (pw_get (F) (a)))) (PreH8 : (0 <= retval)) (PreH9 : (retval <= UINT_MAX)) (PreH10 : (k <> 0)) (PreH11 : (pw_map_nodup F )) (PreH12 : (pw_odd_pre F W a_pre p_pre kc_pre )) (PreH13 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH14 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH15 : (0 <= k)) (PreH16 : (k <= kc_pre)) ,
  (pw_data F )
  **  ((( &( "x" ) )) # UInt  |-> retval)
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "a" ) )) # Ptr  |-> (a + (1 * sizeof(UINT))))
  **  ((( &( "k" ) )) # UInt64  |-> k)
  **  ((( &( "p" ) )) # Ptr  |-> p)
  **  (pw_output W (pw_odd_run ((kc_pre - k )) (F) (a_pre) (p_pre) (O)) )
|--
  “ (p > 0) ” 
  &&  “ (NoDup W ) ” 
  &&  “ (In p W ) ”
).

Definition pw_neon_odd_partial_solve_wit_2_pure_split_goal_1 := 
forall (p_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (p: Z) (k: Z) (a: Z) (retval: Z) (PreH1 : (k <= UINT64_MAX)) (PreH2 : (kc_pre <= UINT64_MAX)) (PreH3 : (k >= 0)) (PreH4 : (kc_pre >= 0)) (PreH5 : (retval <= UINT_MAX)) (PreH6 : (retval >= 0)) (PreH7 : (retval = (pw_get (F) (a)))) (PreH8 : (0 <= retval)) (PreH9 : (retval <= UINT_MAX)) (PreH10 : (k <> 0)) (PreH11 : (pw_map_nodup F )) (PreH12 : (pw_odd_pre F W a_pre p_pre kc_pre )) (PreH13 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH14 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH15 : (0 <= k)) (PreH16 : (k <= kc_pre)) ,
  (pw_data F )
  **  ((( &( "x" ) )) # UInt  |-> retval)
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "a" ) )) # Ptr  |-> (a + (1 * sizeof(UINT))))
  **  ((( &( "k" ) )) # UInt64  |-> k)
  **  ((( &( "p" ) )) # Ptr  |-> p)
  **  (pw_output W (pw_odd_run ((kc_pre - k )) (F) (a_pre) (p_pre) (O)) )
|--
  “ (p > 0) ”
.

Definition pw_neon_odd_partial_solve_wit_2_pure_split_goal_2 := 
forall (p_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (p: Z) (k: Z) (a: Z) (retval: Z) (PreH1 : (k <= UINT64_MAX)) (PreH2 : (kc_pre <= UINT64_MAX)) (PreH3 : (k >= 0)) (PreH4 : (kc_pre >= 0)) (PreH5 : (retval <= UINT_MAX)) (PreH6 : (retval >= 0)) (PreH7 : (retval = (pw_get (F) (a)))) (PreH8 : (0 <= retval)) (PreH9 : (retval <= UINT_MAX)) (PreH10 : (k <> 0)) (PreH11 : (pw_map_nodup F )) (PreH12 : (pw_odd_pre F W a_pre p_pre kc_pre )) (PreH13 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH14 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH15 : (0 <= k)) (PreH16 : (k <= kc_pre)) ,
  (pw_data F )
  **  ((( &( "x" ) )) # UInt  |-> retval)
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "a" ) )) # Ptr  |-> (a + (1 * sizeof(UINT))))
  **  ((( &( "k" ) )) # UInt64  |-> k)
  **  ((( &( "p" ) )) # Ptr  |-> p)
  **  (pw_output W (pw_odd_run ((kc_pre - k )) (F) (a_pre) (p_pre) (O)) )
|--
  “ (NoDup W ) ”
.

Definition pw_neon_odd_partial_solve_wit_2_pure_split_goal_3 := 
forall (p_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (p: Z) (k: Z) (a: Z) (retval: Z) (PreH1 : (k <= UINT64_MAX)) (PreH2 : (kc_pre <= UINT64_MAX)) (PreH3 : (k >= 0)) (PreH4 : (kc_pre >= 0)) (PreH5 : (retval <= UINT_MAX)) (PreH6 : (retval >= 0)) (PreH7 : (retval = (pw_get (F) (a)))) (PreH8 : (0 <= retval)) (PreH9 : (retval <= UINT_MAX)) (PreH10 : (k <> 0)) (PreH11 : (pw_map_nodup F )) (PreH12 : (pw_odd_pre F W a_pre p_pre kc_pre )) (PreH13 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH14 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH15 : (0 <= k)) (PreH16 : (k <= kc_pre)) ,
  (pw_data F )
  **  ((( &( "x" ) )) # UInt  |-> retval)
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "a" ) )) # Ptr  |-> (a + (1 * sizeof(UINT))))
  **  ((( &( "k" ) )) # UInt64  |-> k)
  **  ((( &( "p" ) )) # Ptr  |-> p)
  **  (pw_output W (pw_odd_run ((kc_pre - k )) (F) (a_pre) (p_pre) (O)) )
|--
  “ (In p W ) ”
.

Definition pw_neon_odd_partial_solve_wit_2_aux := 
forall (p_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (p: Z) (k: Z) (a: Z) (retval: Z) (PreH1 : (retval = (pw_get (F) (a)))) (PreH2 : (0 <= retval)) (PreH3 : (retval <= UINT_MAX)) (PreH4 : (k <> 0)) (PreH5 : (pw_map_nodup F )) (PreH6 : (pw_odd_pre F W a_pre p_pre kc_pre )) (PreH7 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH8 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH9 : (0 <= k)) (PreH10 : (k <= kc_pre)) ,
  (pw_data F )
  **  (pw_output W (pw_odd_run ((kc_pre - k )) (F) (a_pre) (p_pre) (O)) )
|--
  “ (In p W ) ” 
  &&  “ (NoDup W ) ” 
  &&  “ (p > 0) ” 
  &&  “ (retval = (pw_get (F) (a))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= UINT_MAX) ” 
  &&  “ (k <> 0) ” 
  &&  “ (pw_map_nodup F ) ” 
  &&  “ (pw_odd_pre F W a_pre p_pre kc_pre ) ” 
  &&  “ (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) )))) ” 
  &&  “ (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) )))) ” 
  &&  “ (0 <= k) ” 
  &&  “ (k <= kc_pre) ”
  &&  (pw_output W (pw_odd_run ((kc_pre - k )) (F) (a_pre) (p_pre) (O)) )
  **  (pw_data F )
.

Definition pw_neon_odd_partial_solve_wit_2 := pw_neon_odd_partial_solve_wit_2_pure -> pw_neon_odd_partial_solve_wit_2_aux.

Module Type VC_Correct.


Axiom proof_of_pw_neon_odd_safety_wit_1 : pw_neon_odd_safety_wit_1.
Axiom proof_of_pw_neon_odd_safety_wit_2 : pw_neon_odd_safety_wit_2.
Axiom proof_of_pw_neon_odd_safety_wit_3 : pw_neon_odd_safety_wit_3.
Axiom proof_of_pw_neon_odd_safety_wit_4 : pw_neon_odd_safety_wit_4.
Axiom proof_of_pw_neon_odd_entail_wit_1 : pw_neon_odd_entail_wit_1.
Axiom proof_of_pw_neon_odd_entail_wit_2 : pw_neon_odd_entail_wit_2.
Axiom proof_of_pw_neon_odd_return_wit_1 : pw_neon_odd_return_wit_1.
Axiom proof_of_pw_neon_odd_partial_solve_wit_1_pure : pw_neon_odd_partial_solve_wit_1_pure.
Axiom proof_of_pw_neon_odd_partial_solve_wit_1 : pw_neon_odd_partial_solve_wit_1.
Axiom proof_of_pw_neon_odd_partial_solve_wit_2_pure : pw_neon_odd_partial_solve_wit_2_pure.
Axiom proof_of_pw_neon_odd_partial_solve_wit_2 : pw_neon_odd_partial_solve_wit_2.

End VC_Correct.
