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
Require Import X32Packw.StrideAccessModel X32Packw.VectorModel.
Local Open Scope sac.

(*----- Function pw_rvv_odd -----*)

Definition pw_rvv_odd_safety_wit_1 := 
forall (p_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (p: Z) (k: Z) (a: Z) (PreH1 : (pw_odd_pre F W a_pre p_pre kc_pre )) (PreH2 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH3 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH4 : (0 <= k)) (PreH5 : (k <= kc_pre)) ,
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

Definition pw_rvv_odd_safety_wit_2 := 
forall (p_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (p: Z) (k: Z) (a: Z) (retval: Z) (x0: Z) (x1: Z) (x2: Z) (x3: Z) (x4: Z) (x5: Z) (x6: Z) (x7: Z) (x8: Z) (x9: Z) (x10: Z) (x11: Z) (x12: Z) (x13: Z) (x14: Z) (x15: Z) (PreH1 : (pw_rvv_lanes F a retval (pw_vec16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)) )) (PreH2 : (pw_legal_vl k retval )) (PreH3 : (k > 0)) (PreH4 : (pw_odd_pre F W a_pre p_pre kc_pre )) (PreH5 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH6 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH7 : (0 <= k)) (PreH8 : (k <= kc_pre)) ,
  ((&(( &( "va" ) )->ₛ "s15")) # UInt  |-> x15)
  **  ((&(( &( "va" ) )->ₛ "s14")) # UInt  |-> x14)
  **  ((&(( &( "va" ) )->ₛ "s13")) # UInt  |-> x13)
  **  ((&(( &( "va" ) )->ₛ "s12")) # UInt  |-> x12)
  **  ((&(( &( "va" ) )->ₛ "s11")) # UInt  |-> x11)
  **  ((&(( &( "va" ) )->ₛ "s10")) # UInt  |-> x10)
  **  ((&(( &( "va" ) )->ₛ "s9")) # UInt  |-> x9)
  **  ((&(( &( "va" ) )->ₛ "s8")) # UInt  |-> x8)
  **  ((&(( &( "va" ) )->ₛ "s7")) # UInt  |-> x7)
  **  ((&(( &( "va" ) )->ₛ "s6")) # UInt  |-> x6)
  **  ((&(( &( "va" ) )->ₛ "s5")) # UInt  |-> x5)
  **  ((&(( &( "va" ) )->ₛ "s4")) # UInt  |-> x4)
  **  ((&(( &( "va" ) )->ₛ "s3")) # UInt  |-> x3)
  **  ((&(( &( "va" ) )->ₛ "s2")) # UInt  |-> x2)
  **  ((&(( &( "va" ) )->ₛ "s1")) # UInt  |-> x1)
  **  ((&(( &( "va" ) )->ₛ "s0")) # UInt  |-> x0)
  **  (pw_data F )
  **  ((( &( "vl" ) )) # UInt64  |-> retval)
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a)
  **  ((( &( "k" ) )) # UInt64  |-> k)
  **  ((( &( "p" ) )) # Ptr  |-> p)
  **  (pw_output W (pw_odd_run ((kc_pre - k )) (F) (a_pre) (p_pre) (O)) )
|--
  “ (8 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 8) ”
.

Definition pw_rvv_odd_safety_wit_3 := 
forall (p_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (p: Z) (k: Z) (a: Z) (retval: Z) (x0: Z) (x1: Z) (x2: Z) (x3: Z) (x4: Z) (x5: Z) (x6: Z) (x7: Z) (x8: Z) (x9: Z) (x10: Z) (x11: Z) (x12: Z) (x13: Z) (x14: Z) (x15: Z) (PreH1 : (pw_rvv_lanes F a retval (pw_vec16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)) )) (PreH2 : (pw_legal_vl k retval )) (PreH3 : (k > 0)) (PreH4 : (pw_odd_pre F W a_pre p_pre kc_pre )) (PreH5 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH6 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH7 : (0 <= k)) (PreH8 : (k <= kc_pre)) ,
  (pw_output W (pw_strided (retval) ((pw_vec16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15))) (p) ((pw_odd_run ((kc_pre - k )) (F) (a_pre) (p_pre) (O)))) )
  **  ((&(( &( "va" ) )->ₛ "s0")) # UInt  |-> x0)
  **  ((&(( &( "va" ) )->ₛ "s1")) # UInt  |-> x1)
  **  ((&(( &( "va" ) )->ₛ "s2")) # UInt  |-> x2)
  **  ((&(( &( "va" ) )->ₛ "s3")) # UInt  |-> x3)
  **  ((&(( &( "va" ) )->ₛ "s4")) # UInt  |-> x4)
  **  ((&(( &( "va" ) )->ₛ "s5")) # UInt  |-> x5)
  **  ((&(( &( "va" ) )->ₛ "s6")) # UInt  |-> x6)
  **  ((&(( &( "va" ) )->ₛ "s7")) # UInt  |-> x7)
  **  ((&(( &( "va" ) )->ₛ "s8")) # UInt  |-> x8)
  **  ((&(( &( "va" ) )->ₛ "s9")) # UInt  |-> x9)
  **  ((&(( &( "va" ) )->ₛ "s10")) # UInt  |-> x10)
  **  ((&(( &( "va" ) )->ₛ "s11")) # UInt  |-> x11)
  **  ((&(( &( "va" ) )->ₛ "s12")) # UInt  |-> x12)
  **  ((&(( &( "va" ) )->ₛ "s13")) # UInt  |-> x13)
  **  ((&(( &( "va" ) )->ₛ "s14")) # UInt  |-> x14)
  **  ((&(( &( "va" ) )->ₛ "s15")) # UInt  |-> x15)
  **  (pw_data F )
  **  ((( &( "vl" ) )) # UInt64  |-> retval)
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "a" ) )) # Ptr  |-> (a + (retval * sizeof(UINT))))
  **  ((( &( "k" ) )) # UInt64  |-> k)
  **  ((( &( "p" ) )) # Ptr  |-> p)
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition pw_rvv_odd_entail_wit_1 := 
(
forall (p_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (PreH1 : (pw_odd_pre F W a_pre p_pre kc_pre )) ,
  (pw_data F )
  **  (pw_output W O )
|--
  “ (pw_odd_pre F W a_pre p_pre kc_pre ) ” 
  &&  “ (a_pre = (pw_offset (a_pre) ((4 * (kc_pre - kc_pre ) )))) ” 
  &&  “ (p_pre = (pw_offset (p_pre) ((8 * (kc_pre - kc_pre ) )))) ” 
  &&  “ (0 <= kc_pre) ” 
  &&  “ (kc_pre <= kc_pre) ”
  &&  (pw_data F )
  **  (pw_output W (pw_odd_run ((kc_pre - kc_pre )) (F) (a_pre) (p_pre) (O)) )
) \/
(
forall (p_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (PreH1 : (pw_odd_pre F W a_pre p_pre kc_pre )) ,
  (pw_data F )
  **  (pw_output W O )
|--
  “ (0 <= kc_pre) ” 
  &&  “ (p_pre = (pw_offset (p_pre) ((8 * (kc_pre - kc_pre ) )))) ” 
  &&  “ (a_pre = (pw_offset (a_pre) ((4 * (kc_pre - kc_pre ) )))) ”
  &&  (pw_data F )
  **  (pw_output W (pw_odd_run ((kc_pre - kc_pre )) (F) (a_pre) (p_pre) (O)) )
).

Definition pw_rvv_odd_entail_wit_1_split_goal_1 := 
forall (p_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (PreH1 : (pw_odd_pre F W a_pre p_pre kc_pre )) ,
  (pw_data F )
  **  (pw_output W O )
|--
  “ (0 <= kc_pre) ”
.

Definition pw_rvv_odd_entail_wit_1_split_goal_2 := 
forall (p_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (PreH1 : (pw_odd_pre F W a_pre p_pre kc_pre )) ,
  (pw_data F )
  **  (pw_output W O )
|--
  “ (p_pre = (pw_offset (p_pre) ((8 * (kc_pre - kc_pre ) )))) ”
.

Definition pw_rvv_odd_entail_wit_1_split_goal_3 := 
forall (p_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (PreH1 : (pw_odd_pre F W a_pre p_pre kc_pre )) ,
  (pw_data F )
  **  (pw_output W O )
|--
  “ (a_pre = (pw_offset (a_pre) ((4 * (kc_pre - kc_pre ) )))) ”
.

Definition pw_rvv_odd_entail_wit_1_split_goal_spatial := 
forall (p_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (PreH1 : (pw_odd_pre F W a_pre p_pre kc_pre )) ,
  (pw_data F )
  **  (pw_output W O )
|--
  (pw_data F )
  **  (pw_output W (pw_odd_run ((kc_pre - kc_pre )) (F) (a_pre) (p_pre) (O)) )
.

Definition pw_rvv_odd_entail_wit_2 := 
(
forall (p_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (p: Z) (k: Z) (a: Z) (retval: Z) (x0: Z) (x1: Z) (x2: Z) (x3: Z) (x4: Z) (x5: Z) (x6: Z) (x7: Z) (x8: Z) (x9: Z) (x10: Z) (x11: Z) (x12: Z) (x13: Z) (x14: Z) (x15: Z) (PreH1 : (pw_rvv_lanes F a retval (pw_vec16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)) )) (PreH2 : (pw_legal_vl k retval )) (PreH3 : (k > 0)) (PreH4 : (pw_odd_pre F W a_pre p_pre kc_pre )) (PreH5 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH6 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH7 : (0 <= k)) (PreH8 : (k <= kc_pre)) ,
  (pw_output W (pw_strided (retval) ((pw_vec16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15))) (p) ((pw_odd_run ((kc_pre - k )) (F) (a_pre) (p_pre) (O)))) )
  **  (pw_data F )
|--
  “ (pw_odd_pre F W a_pre p_pre kc_pre ) ” 
  &&  “ ((a + (retval * sizeof(UINT))) = (pw_offset (a_pre) ((4 * (kc_pre - (unsigned_last_nbits ((k - retval )) (64)) ) )))) ” 
  &&  “ ((p + ((unsigned_last_nbits ((2 * retval )) (64)) * sizeof(UINT))) = (pw_offset (p_pre) ((8 * (kc_pre - (unsigned_last_nbits ((k - retval )) (64)) ) )))) ” 
  &&  “ (0 <= (unsigned_last_nbits ((k - retval )) (64))) ” 
  &&  “ ((unsigned_last_nbits ((k - retval )) (64)) <= kc_pre) ”
  &&  (pw_data F )
  **  (pw_output W (pw_odd_run ((kc_pre - (unsigned_last_nbits ((k - retval )) (64)) )) (F) (a_pre) (p_pre) (O)) )
) \/
(
forall (p_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (p: Z) (k: Z) (a: Z) (retval: Z) (x0: Z) (x1: Z) (x2: Z) (x3: Z) (x4: Z) (x5: Z) (x6: Z) (x7: Z) (x8: Z) (x9: Z) (x10: Z) (x11: Z) (x12: Z) (x13: Z) (x14: Z) (x15: Z) (PreH1 : (pw_rvv_lanes F a retval (pw_vec16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)) )) (PreH2 : (pw_legal_vl k retval )) (PreH3 : (k > 0)) (PreH4 : (pw_odd_pre F W a_pre p_pre kc_pre )) (PreH5 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH6 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH7 : (0 <= k)) (PreH8 : (k <= kc_pre)) ,
  (pw_output W (pw_strided (retval) ((pw_vec16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15))) (p) ((pw_odd_run ((kc_pre - k )) (F) (a_pre) (p_pre) (O)))) )
  **  (pw_data F )
|--
  “ ((unsigned_last_nbits ((k - retval )) (64)) <= kc_pre) ” 
  &&  “ (0 <= (unsigned_last_nbits ((k - retval )) (64))) ” 
  &&  “ ((p + ((unsigned_last_nbits ((2 * retval )) (64)) * sizeof(UINT))) = (pw_offset (p_pre) ((8 * (kc_pre - (unsigned_last_nbits ((k - retval )) (64)) ) )))) ” 
  &&  “ ((a + (retval * sizeof(UINT))) = (pw_offset (a_pre) ((4 * (kc_pre - (unsigned_last_nbits ((k - retval )) (64)) ) )))) ”
  &&  (pw_data F )
  **  (pw_output W (pw_odd_run ((kc_pre - (unsigned_last_nbits ((k - retval )) (64)) )) (F) (a_pre) (p_pre) (O)) )
).

Definition pw_rvv_odd_entail_wit_2_split_goal_1 := 
forall (p_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (p: Z) (k: Z) (a: Z) (retval: Z) (x0: Z) (x1: Z) (x2: Z) (x3: Z) (x4: Z) (x5: Z) (x6: Z) (x7: Z) (x8: Z) (x9: Z) (x10: Z) (x11: Z) (x12: Z) (x13: Z) (x14: Z) (x15: Z) (PreH1 : (pw_rvv_lanes F a retval (pw_vec16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)) )) (PreH2 : (pw_legal_vl k retval )) (PreH3 : (k > 0)) (PreH4 : (pw_odd_pre F W a_pre p_pre kc_pre )) (PreH5 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH6 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH7 : (0 <= k)) (PreH8 : (k <= kc_pre)) ,
  (pw_output W (pw_strided (retval) ((pw_vec16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15))) (p) ((pw_odd_run ((kc_pre - k )) (F) (a_pre) (p_pre) (O)))) )
  **  (pw_data F )
|--
  “ ((unsigned_last_nbits ((k - retval )) (64)) <= kc_pre) ”
.

Definition pw_rvv_odd_entail_wit_2_split_goal_2 := 
forall (p_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (p: Z) (k: Z) (a: Z) (retval: Z) (x0: Z) (x1: Z) (x2: Z) (x3: Z) (x4: Z) (x5: Z) (x6: Z) (x7: Z) (x8: Z) (x9: Z) (x10: Z) (x11: Z) (x12: Z) (x13: Z) (x14: Z) (x15: Z) (PreH1 : (pw_rvv_lanes F a retval (pw_vec16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)) )) (PreH2 : (pw_legal_vl k retval )) (PreH3 : (k > 0)) (PreH4 : (pw_odd_pre F W a_pre p_pre kc_pre )) (PreH5 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH6 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH7 : (0 <= k)) (PreH8 : (k <= kc_pre)) ,
  (pw_output W (pw_strided (retval) ((pw_vec16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15))) (p) ((pw_odd_run ((kc_pre - k )) (F) (a_pre) (p_pre) (O)))) )
  **  (pw_data F )
|--
  “ (0 <= (unsigned_last_nbits ((k - retval )) (64))) ”
.

Definition pw_rvv_odd_entail_wit_2_split_goal_3 := 
forall (p_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (p: Z) (k: Z) (a: Z) (retval: Z) (x0: Z) (x1: Z) (x2: Z) (x3: Z) (x4: Z) (x5: Z) (x6: Z) (x7: Z) (x8: Z) (x9: Z) (x10: Z) (x11: Z) (x12: Z) (x13: Z) (x14: Z) (x15: Z) (PreH1 : (pw_rvv_lanes F a retval (pw_vec16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)) )) (PreH2 : (pw_legal_vl k retval )) (PreH3 : (k > 0)) (PreH4 : (pw_odd_pre F W a_pre p_pre kc_pre )) (PreH5 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH6 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH7 : (0 <= k)) (PreH8 : (k <= kc_pre)) ,
  (pw_output W (pw_strided (retval) ((pw_vec16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15))) (p) ((pw_odd_run ((kc_pre - k )) (F) (a_pre) (p_pre) (O)))) )
  **  (pw_data F )
|--
  “ ((p + ((unsigned_last_nbits ((2 * retval )) (64)) * sizeof(UINT))) = (pw_offset (p_pre) ((8 * (kc_pre - (unsigned_last_nbits ((k - retval )) (64)) ) )))) ”
.

Definition pw_rvv_odd_entail_wit_2_split_goal_4 := 
forall (p_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (p: Z) (k: Z) (a: Z) (retval: Z) (x0: Z) (x1: Z) (x2: Z) (x3: Z) (x4: Z) (x5: Z) (x6: Z) (x7: Z) (x8: Z) (x9: Z) (x10: Z) (x11: Z) (x12: Z) (x13: Z) (x14: Z) (x15: Z) (PreH1 : (pw_rvv_lanes F a retval (pw_vec16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)) )) (PreH2 : (pw_legal_vl k retval )) (PreH3 : (k > 0)) (PreH4 : (pw_odd_pre F W a_pre p_pre kc_pre )) (PreH5 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH6 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH7 : (0 <= k)) (PreH8 : (k <= kc_pre)) ,
  (pw_output W (pw_strided (retval) ((pw_vec16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15))) (p) ((pw_odd_run ((kc_pre - k )) (F) (a_pre) (p_pre) (O)))) )
  **  (pw_data F )
|--
  “ ((a + (retval * sizeof(UINT))) = (pw_offset (a_pre) ((4 * (kc_pre - (unsigned_last_nbits ((k - retval )) (64)) ) )))) ”
.

Definition pw_rvv_odd_entail_wit_2_split_goal_spatial := 
forall (p_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (p: Z) (k: Z) (a: Z) (retval: Z) (x0: Z) (x1: Z) (x2: Z) (x3: Z) (x4: Z) (x5: Z) (x6: Z) (x7: Z) (x8: Z) (x9: Z) (x10: Z) (x11: Z) (x12: Z) (x13: Z) (x14: Z) (x15: Z) (PreH1 : (pw_rvv_lanes F a retval (pw_vec16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)) )) (PreH2 : (pw_legal_vl k retval )) (PreH3 : (k > 0)) (PreH4 : (pw_odd_pre F W a_pre p_pre kc_pre )) (PreH5 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH6 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH7 : (0 <= k)) (PreH8 : (k <= kc_pre)) ,
  (pw_output W (pw_strided (retval) ((pw_vec16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15))) (p) ((pw_odd_run ((kc_pre - k )) (F) (a_pre) (p_pre) (O)))) )
  **  (pw_data F )
|--
  (pw_data F )
  **  (pw_output W (pw_odd_run ((kc_pre - (unsigned_last_nbits ((k - retval )) (64)) )) (F) (a_pre) (p_pre) (O)) )
.

Definition pw_rvv_odd_return_wit_1 := 
(
forall (p_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (p: Z) (k: Z) (a: Z) (PreH1 : (k <= 0)) (PreH2 : (pw_odd_pre F W a_pre p_pre kc_pre )) (PreH3 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH4 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH5 : (0 <= k)) (PreH6 : (k <= kc_pre)) ,
  (pw_data F )
  **  (pw_output W (pw_odd_run ((kc_pre - k )) (F) (a_pre) (p_pre) (O)) )
|--
  (pw_data F )
  **  (pw_output W (pw_odd_run (kc_pre) (F) (a_pre) (p_pre) (O)) )
) \/
(
forall (p_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (p: Z) (k: Z) (a: Z) (PreH1 : (k <= 0)) (PreH2 : (pw_odd_pre F W a_pre p_pre kc_pre )) (PreH3 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH4 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH5 : (0 <= k)) (PreH6 : (k <= kc_pre)) ,
  (pw_data F )
  **  (pw_output W (pw_odd_run ((kc_pre - k )) (F) (a_pre) (p_pre) (O)) )
|--
  (pw_data F )
  **  (pw_output W (pw_odd_run (kc_pre) (F) (a_pre) (p_pre) (O)) )
).

Definition pw_rvv_odd_return_wit_1_split_goal_spatial := 
forall (p_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (p: Z) (k: Z) (a: Z) (PreH1 : (k <= 0)) (PreH2 : (pw_odd_pre F W a_pre p_pre kc_pre )) (PreH3 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH4 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH5 : (0 <= k)) (PreH6 : (k <= kc_pre)) ,
  (pw_data F )
  **  (pw_output W (pw_odd_run ((kc_pre - k )) (F) (a_pre) (p_pre) (O)) )
|--
  (pw_data F )
  **  (pw_output W (pw_odd_run (kc_pre) (F) (a_pre) (p_pre) (O)) )
.

Definition pw_rvv_odd_partial_solve_wit_1 := 
forall (p_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (p: Z) (k: Z) (a: Z) (PreH1 : (k > 0)) (PreH2 : (pw_odd_pre F W a_pre p_pre kc_pre )) (PreH3 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH4 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH5 : (0 <= k)) (PreH6 : (k <= kc_pre)) ,
  (pw_data F )
  **  (pw_output W (pw_odd_run ((kc_pre - k )) (F) (a_pre) (p_pre) (O)) )
|--
  “ (k > 0) ” 
  &&  “ (pw_odd_pre F W a_pre p_pre kc_pre ) ” 
  &&  “ (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) )))) ” 
  &&  “ (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) )))) ” 
  &&  “ (0 <= k) ” 
  &&  “ (k <= kc_pre) ”
  &&  (pw_data F )
  **  (pw_output W (pw_odd_run ((kc_pre - k )) (F) (a_pre) (p_pre) (O)) )
.

Definition pw_rvv_odd_partial_solve_wit_2_pure := 
(
forall (p_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (p: Z) (k: Z) (a: Z) (retval: Z) (PreH1 : (pw_legal_vl k retval )) (PreH2 : (k > 0)) (PreH3 : (pw_odd_pre F W a_pre p_pre kc_pre )) (PreH4 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH5 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH6 : (0 <= k)) (PreH7 : (k <= kc_pre)) ,
  (UndefStructPredvuint32m4_t ( &( "va" ) ) )
  **  ((( &( "vl" ) )) # UInt64  |-> retval)
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a)
  **  ((( &( "k" ) )) # UInt64  |-> k)
  **  ((( &( "p" ) )) # Ptr  |-> p)
  **  (pw_data F )
  **  (pw_output W (pw_odd_run ((kc_pre - k )) (F) (a_pre) (p_pre) (O)) )
|--
  “ (pw_window F a retval ) ” 
  &&  “ (retval <= 16) ” 
  &&  “ (0 <= retval) ”
) \/
(
forall (p_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (p: Z) (k: Z) (a: Z) (retval: Z) (PreH1 : (k <= UINT64_MAX)) (PreH2 : (kc_pre <= UINT64_MAX)) (PreH3 : (retval <= UINT64_MAX)) (PreH4 : (k >= 0)) (PreH5 : (kc_pre >= 0)) (PreH6 : (retval >= 0)) (PreH7 : (pw_legal_vl k retval )) (PreH8 : (k > 0)) (PreH9 : (pw_odd_pre F W a_pre p_pre kc_pre )) (PreH10 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH11 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH12 : (0 <= k)) (PreH13 : (k <= kc_pre)) ,
  (UndefStructPredvuint32m4_t ( &( "va" ) ) )
  **  ((( &( "vl" ) )) # UInt64  |-> retval)
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a)
  **  ((( &( "k" ) )) # UInt64  |-> k)
  **  ((( &( "p" ) )) # Ptr  |-> p)
  **  (pw_data F )
  **  (pw_output W (pw_odd_run ((kc_pre - k )) (F) (a_pre) (p_pre) (O)) )
|--
  “ (retval <= 16) ” 
  &&  “ (pw_window F a retval ) ”
).

Definition pw_rvv_odd_partial_solve_wit_2_pure_split_goal_1 := 
forall (p_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (p: Z) (k: Z) (a: Z) (retval: Z) (PreH1 : (k <= UINT64_MAX)) (PreH2 : (kc_pre <= UINT64_MAX)) (PreH3 : (retval <= UINT64_MAX)) (PreH4 : (k >= 0)) (PreH5 : (kc_pre >= 0)) (PreH6 : (retval >= 0)) (PreH7 : (pw_legal_vl k retval )) (PreH8 : (k > 0)) (PreH9 : (pw_odd_pre F W a_pre p_pre kc_pre )) (PreH10 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH11 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH12 : (0 <= k)) (PreH13 : (k <= kc_pre)) ,
  (UndefStructPredvuint32m4_t ( &( "va" ) ) )
  **  ((( &( "vl" ) )) # UInt64  |-> retval)
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a)
  **  ((( &( "k" ) )) # UInt64  |-> k)
  **  ((( &( "p" ) )) # Ptr  |-> p)
  **  (pw_data F )
  **  (pw_output W (pw_odd_run ((kc_pre - k )) (F) (a_pre) (p_pre) (O)) )
|--
  “ (retval <= 16) ”
.

Definition pw_rvv_odd_partial_solve_wit_2_pure_split_goal_2 := 
forall (p_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (p: Z) (k: Z) (a: Z) (retval: Z) (PreH1 : (k <= UINT64_MAX)) (PreH2 : (kc_pre <= UINT64_MAX)) (PreH3 : (retval <= UINT64_MAX)) (PreH4 : (k >= 0)) (PreH5 : (kc_pre >= 0)) (PreH6 : (retval >= 0)) (PreH7 : (pw_legal_vl k retval )) (PreH8 : (k > 0)) (PreH9 : (pw_odd_pre F W a_pre p_pre kc_pre )) (PreH10 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH11 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH12 : (0 <= k)) (PreH13 : (k <= kc_pre)) ,
  (UndefStructPredvuint32m4_t ( &( "va" ) ) )
  **  ((( &( "vl" ) )) # UInt64  |-> retval)
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a)
  **  ((( &( "k" ) )) # UInt64  |-> k)
  **  ((( &( "p" ) )) # Ptr  |-> p)
  **  (pw_data F )
  **  (pw_output W (pw_odd_run ((kc_pre - k )) (F) (a_pre) (p_pre) (O)) )
|--
  “ (pw_window F a retval ) ”
.

Definition pw_rvv_odd_partial_solve_wit_2_aux := 
forall (p_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (p: Z) (k: Z) (a: Z) (retval: Z) (PreH1 : (pw_legal_vl k retval )) (PreH2 : (k > 0)) (PreH3 : (pw_odd_pre F W a_pre p_pre kc_pre )) (PreH4 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH5 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH6 : (0 <= k)) (PreH7 : (k <= kc_pre)) ,
  (UndefStructPredvuint32m4_t ( &( "va" ) ) )
  **  (pw_data F )
  **  (pw_output W (pw_odd_run ((kc_pre - k )) (F) (a_pre) (p_pre) (O)) )
|--
  “ (pw_window F a retval ) ” 
  &&  “ (retval <= 16) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (pw_legal_vl k retval ) ” 
  &&  “ (k > 0) ” 
  &&  “ (pw_odd_pre F W a_pre p_pre kc_pre ) ” 
  &&  “ (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) )))) ” 
  &&  “ (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) )))) ” 
  &&  “ (0 <= k) ” 
  &&  “ (k <= kc_pre) ”
  &&  (pw_data F )
  **  (UndefStructPredvuint32m4_t ( &( "va" ) ) )
  **  (pw_output W (pw_odd_run ((kc_pre - k )) (F) (a_pre) (p_pre) (O)) )
.

Definition pw_rvv_odd_partial_solve_wit_2 := pw_rvv_odd_partial_solve_wit_2_pure -> pw_rvv_odd_partial_solve_wit_2_aux.

Definition pw_rvv_odd_partial_solve_wit_3 := 
forall (p_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (p: Z) (k: Z) (a: Z) (retval: Z) (x0: Z) (x1: Z) (x2: Z) (x3: Z) (x4: Z) (x5: Z) (x6: Z) (x7: Z) (x8: Z) (x9: Z) (x10: Z) (x11: Z) (x12: Z) (x13: Z) (x14: Z) (x15: Z) (retval_2: Z) (PreH1 : (pw_rvv_lanes F a retval (pw_vec16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)) )) (PreH2 : (pw_legal_vl k retval )) (PreH3 : (k > 0)) (PreH4 : (pw_odd_pre F W a_pre p_pre kc_pre )) (PreH5 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH6 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH7 : (0 <= k)) (PreH8 : (k <= kc_pre)) ,
  (pw_data F )
  **  ((&((retval_2)  # "vuint32m4_t" ->ₛ "s0")) # UInt  |-> x0)
  **  ((&((retval_2)  # "vuint32m4_t" ->ₛ "s1")) # UInt  |-> x1)
  **  ((&((retval_2)  # "vuint32m4_t" ->ₛ "s2")) # UInt  |-> x2)
  **  ((&((retval_2)  # "vuint32m4_t" ->ₛ "s3")) # UInt  |-> x3)
  **  ((&((retval_2)  # "vuint32m4_t" ->ₛ "s4")) # UInt  |-> x4)
  **  ((&((retval_2)  # "vuint32m4_t" ->ₛ "s5")) # UInt  |-> x5)
  **  ((&((retval_2)  # "vuint32m4_t" ->ₛ "s6")) # UInt  |-> x6)
  **  ((&((retval_2)  # "vuint32m4_t" ->ₛ "s7")) # UInt  |-> x7)
  **  ((&((retval_2)  # "vuint32m4_t" ->ₛ "s8")) # UInt  |-> x8)
  **  ((&((retval_2)  # "vuint32m4_t" ->ₛ "s9")) # UInt  |-> x9)
  **  ((&((retval_2)  # "vuint32m4_t" ->ₛ "s10")) # UInt  |-> x10)
  **  ((&((retval_2)  # "vuint32m4_t" ->ₛ "s11")) # UInt  |-> x11)
  **  ((&((retval_2)  # "vuint32m4_t" ->ₛ "s12")) # UInt  |-> x12)
  **  ((&((retval_2)  # "vuint32m4_t" ->ₛ "s13")) # UInt  |-> x13)
  **  ((&((retval_2)  # "vuint32m4_t" ->ₛ "s14")) # UInt  |-> x14)
  **  ((&((retval_2)  # "vuint32m4_t" ->ₛ "s15")) # UInt  |-> x15)
  **  (UndefStructPredvuint32m4_t ( &( "va" ) ) )
  **  (pw_output W (pw_odd_run ((kc_pre - k )) (F) (a_pre) (p_pre) (O)) )
|--
  “ (pw_rvv_lanes F a retval (pw_vec16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)) ) ” 
  &&  “ (pw_legal_vl k retval ) ” 
  &&  “ (k > 0) ” 
  &&  “ (pw_odd_pre F W a_pre p_pre kc_pre ) ” 
  &&  “ (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) )))) ” 
  &&  “ (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) )))) ” 
  &&  “ (0 <= k) ” 
  &&  “ (k <= kc_pre) ”
  &&  ((&(( &( "va" ) )->ₛ "s15")) # UInt  |->_)
  **  ((&((retval_2)  # "vuint32m4_t" ->ₛ "s15")) # UInt  |-> x15)
  **  ((&(( &( "va" ) )->ₛ "s14")) # UInt  |->_)
  **  ((&((retval_2)  # "vuint32m4_t" ->ₛ "s14")) # UInt  |-> x14)
  **  ((&(( &( "va" ) )->ₛ "s13")) # UInt  |->_)
  **  ((&((retval_2)  # "vuint32m4_t" ->ₛ "s13")) # UInt  |-> x13)
  **  ((&(( &( "va" ) )->ₛ "s12")) # UInt  |->_)
  **  ((&((retval_2)  # "vuint32m4_t" ->ₛ "s12")) # UInt  |-> x12)
  **  ((&(( &( "va" ) )->ₛ "s11")) # UInt  |->_)
  **  ((&((retval_2)  # "vuint32m4_t" ->ₛ "s11")) # UInt  |-> x11)
  **  ((&(( &( "va" ) )->ₛ "s10")) # UInt  |->_)
  **  ((&((retval_2)  # "vuint32m4_t" ->ₛ "s10")) # UInt  |-> x10)
  **  ((&(( &( "va" ) )->ₛ "s9")) # UInt  |->_)
  **  ((&((retval_2)  # "vuint32m4_t" ->ₛ "s9")) # UInt  |-> x9)
  **  ((&(( &( "va" ) )->ₛ "s8")) # UInt  |->_)
  **  ((&((retval_2)  # "vuint32m4_t" ->ₛ "s8")) # UInt  |-> x8)
  **  ((&(( &( "va" ) )->ₛ "s7")) # UInt  |->_)
  **  ((&((retval_2)  # "vuint32m4_t" ->ₛ "s7")) # UInt  |-> x7)
  **  ((&(( &( "va" ) )->ₛ "s6")) # UInt  |->_)
  **  ((&((retval_2)  # "vuint32m4_t" ->ₛ "s6")) # UInt  |-> x6)
  **  ((&(( &( "va" ) )->ₛ "s5")) # UInt  |->_)
  **  ((&((retval_2)  # "vuint32m4_t" ->ₛ "s5")) # UInt  |-> x5)
  **  ((&(( &( "va" ) )->ₛ "s4")) # UInt  |->_)
  **  ((&((retval_2)  # "vuint32m4_t" ->ₛ "s4")) # UInt  |-> x4)
  **  ((&(( &( "va" ) )->ₛ "s3")) # UInt  |->_)
  **  ((&((retval_2)  # "vuint32m4_t" ->ₛ "s3")) # UInt  |-> x3)
  **  ((&(( &( "va" ) )->ₛ "s2")) # UInt  |->_)
  **  ((&((retval_2)  # "vuint32m4_t" ->ₛ "s2")) # UInt  |-> x2)
  **  ((&(( &( "va" ) )->ₛ "s1")) # UInt  |->_)
  **  ((&((retval_2)  # "vuint32m4_t" ->ₛ "s1")) # UInt  |-> x1)
  **  ((&(( &( "va" ) )->ₛ "s0")) # UInt  |->_)
  **  ((&((retval_2)  # "vuint32m4_t" ->ₛ "s0")) # UInt  |-> x0)
  **  (pw_data F )
  **  (pw_output W (pw_odd_run ((kc_pre - k )) (F) (a_pre) (p_pre) (O)) )
.

Definition pw_rvv_odd_partial_solve_wit_4_pure := 
(
forall (p_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (p: Z) (k: Z) (a: Z) (retval: Z) (x0: Z) (x1: Z) (x2: Z) (x3: Z) (x4: Z) (x5: Z) (x6: Z) (x7: Z) (x8: Z) (x9: Z) (x10: Z) (x11: Z) (x12: Z) (x13: Z) (x14: Z) (x15: Z) (PreH1 : (pw_rvv_lanes F a retval (pw_vec16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)) )) (PreH2 : (pw_legal_vl k retval )) (PreH3 : (k > 0)) (PreH4 : (pw_odd_pre F W a_pre p_pre kc_pre )) (PreH5 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH6 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH7 : (0 <= k)) (PreH8 : (k <= kc_pre)) ,
  ((&(( &( "va" ) )->ₛ "s15")) # UInt  |-> x15)
  **  ((&(( &( "va" ) )->ₛ "s14")) # UInt  |-> x14)
  **  ((&(( &( "va" ) )->ₛ "s13")) # UInt  |-> x13)
  **  ((&(( &( "va" ) )->ₛ "s12")) # UInt  |-> x12)
  **  ((&(( &( "va" ) )->ₛ "s11")) # UInt  |-> x11)
  **  ((&(( &( "va" ) )->ₛ "s10")) # UInt  |-> x10)
  **  ((&(( &( "va" ) )->ₛ "s9")) # UInt  |-> x9)
  **  ((&(( &( "va" ) )->ₛ "s8")) # UInt  |-> x8)
  **  ((&(( &( "va" ) )->ₛ "s7")) # UInt  |-> x7)
  **  ((&(( &( "va" ) )->ₛ "s6")) # UInt  |-> x6)
  **  ((&(( &( "va" ) )->ₛ "s5")) # UInt  |-> x5)
  **  ((&(( &( "va" ) )->ₛ "s4")) # UInt  |-> x4)
  **  ((&(( &( "va" ) )->ₛ "s3")) # UInt  |-> x3)
  **  ((&(( &( "va" ) )->ₛ "s2")) # UInt  |-> x2)
  **  ((&(( &( "va" ) )->ₛ "s1")) # UInt  |-> x1)
  **  ((&(( &( "va" ) )->ₛ "s0")) # UInt  |-> x0)
  **  (pw_data F )
  **  ((( &( "vl" ) )) # UInt64  |-> retval)
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a)
  **  ((( &( "k" ) )) # UInt64  |-> k)
  **  ((( &( "p" ) )) # Ptr  |-> p)
  **  (pw_output W (pw_odd_run ((kc_pre - k )) (F) (a_pre) (p_pre) (O)) )
|--
  “ (8 = 8) ” 
  &&  “ (pw_stride_window W p retval ) ”
) \/
(
forall (p_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (p: Z) (k: Z) (a: Z) (retval: Z) (x0: Z) (x1: Z) (x2: Z) (x3: Z) (x4: Z) (x5: Z) (x6: Z) (x7: Z) (x8: Z) (x9: Z) (x10: Z) (x11: Z) (x12: Z) (x13: Z) (x14: Z) (x15: Z) (PreH1 : (k <= UINT64_MAX)) (PreH2 : (kc_pre <= UINT64_MAX)) (PreH3 : (retval <= UINT64_MAX)) (PreH4 : (k >= 0)) (PreH5 : (kc_pre >= 0)) (PreH6 : (retval >= 0)) (PreH7 : (x0 <= UINT_MAX)) (PreH8 : (x1 <= UINT_MAX)) (PreH9 : (x2 <= UINT_MAX)) (PreH10 : (x3 <= UINT_MAX)) (PreH11 : (x4 <= UINT_MAX)) (PreH12 : (x5 <= UINT_MAX)) (PreH13 : (x6 <= UINT_MAX)) (PreH14 : (x7 <= UINT_MAX)) (PreH15 : (x8 <= UINT_MAX)) (PreH16 : (x9 <= UINT_MAX)) (PreH17 : (x10 <= UINT_MAX)) (PreH18 : (x11 <= UINT_MAX)) (PreH19 : (x12 <= UINT_MAX)) (PreH20 : (x13 <= UINT_MAX)) (PreH21 : (x14 <= UINT_MAX)) (PreH22 : (x15 <= UINT_MAX)) (PreH23 : (x0 >= 0)) (PreH24 : (x1 >= 0)) (PreH25 : (x2 >= 0)) (PreH26 : (x3 >= 0)) (PreH27 : (x4 >= 0)) (PreH28 : (x5 >= 0)) (PreH29 : (x6 >= 0)) (PreH30 : (x7 >= 0)) (PreH31 : (x8 >= 0)) (PreH32 : (x9 >= 0)) (PreH33 : (x10 >= 0)) (PreH34 : (x11 >= 0)) (PreH35 : (x12 >= 0)) (PreH36 : (x13 >= 0)) (PreH37 : (x14 >= 0)) (PreH38 : (x15 >= 0)) (PreH39 : (pw_rvv_lanes F a retval (pw_vec16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)) )) (PreH40 : (pw_legal_vl k retval )) (PreH41 : (k > 0)) (PreH42 : (pw_odd_pre F W a_pre p_pre kc_pre )) (PreH43 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH44 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH45 : (0 <= k)) (PreH46 : (k <= kc_pre)) ,
  ((&(( &( "va" ) )->ₛ "s15")) # UInt  |-> x15)
  **  ((&(( &( "va" ) )->ₛ "s14")) # UInt  |-> x14)
  **  ((&(( &( "va" ) )->ₛ "s13")) # UInt  |-> x13)
  **  ((&(( &( "va" ) )->ₛ "s12")) # UInt  |-> x12)
  **  ((&(( &( "va" ) )->ₛ "s11")) # UInt  |-> x11)
  **  ((&(( &( "va" ) )->ₛ "s10")) # UInt  |-> x10)
  **  ((&(( &( "va" ) )->ₛ "s9")) # UInt  |-> x9)
  **  ((&(( &( "va" ) )->ₛ "s8")) # UInt  |-> x8)
  **  ((&(( &( "va" ) )->ₛ "s7")) # UInt  |-> x7)
  **  ((&(( &( "va" ) )->ₛ "s6")) # UInt  |-> x6)
  **  ((&(( &( "va" ) )->ₛ "s5")) # UInt  |-> x5)
  **  ((&(( &( "va" ) )->ₛ "s4")) # UInt  |-> x4)
  **  ((&(( &( "va" ) )->ₛ "s3")) # UInt  |-> x3)
  **  ((&(( &( "va" ) )->ₛ "s2")) # UInt  |-> x2)
  **  ((&(( &( "va" ) )->ₛ "s1")) # UInt  |-> x1)
  **  ((&(( &( "va" ) )->ₛ "s0")) # UInt  |-> x0)
  **  (pw_data F )
  **  ((( &( "vl" ) )) # UInt64  |-> retval)
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a)
  **  ((( &( "k" ) )) # UInt64  |-> k)
  **  ((( &( "p" ) )) # Ptr  |-> p)
  **  (pw_output W (pw_odd_run ((kc_pre - k )) (F) (a_pre) (p_pre) (O)) )
|--
  “ (pw_stride_window W p retval ) ”
).

Definition pw_rvv_odd_partial_solve_wit_4_pure_split_goal_1 := 
forall (p_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (p: Z) (k: Z) (a: Z) (retval: Z) (x0: Z) (x1: Z) (x2: Z) (x3: Z) (x4: Z) (x5: Z) (x6: Z) (x7: Z) (x8: Z) (x9: Z) (x10: Z) (x11: Z) (x12: Z) (x13: Z) (x14: Z) (x15: Z) (PreH1 : (k <= UINT64_MAX)) (PreH2 : (kc_pre <= UINT64_MAX)) (PreH3 : (retval <= UINT64_MAX)) (PreH4 : (k >= 0)) (PreH5 : (kc_pre >= 0)) (PreH6 : (retval >= 0)) (PreH7 : (x0 <= UINT_MAX)) (PreH8 : (x1 <= UINT_MAX)) (PreH9 : (x2 <= UINT_MAX)) (PreH10 : (x3 <= UINT_MAX)) (PreH11 : (x4 <= UINT_MAX)) (PreH12 : (x5 <= UINT_MAX)) (PreH13 : (x6 <= UINT_MAX)) (PreH14 : (x7 <= UINT_MAX)) (PreH15 : (x8 <= UINT_MAX)) (PreH16 : (x9 <= UINT_MAX)) (PreH17 : (x10 <= UINT_MAX)) (PreH18 : (x11 <= UINT_MAX)) (PreH19 : (x12 <= UINT_MAX)) (PreH20 : (x13 <= UINT_MAX)) (PreH21 : (x14 <= UINT_MAX)) (PreH22 : (x15 <= UINT_MAX)) (PreH23 : (x0 >= 0)) (PreH24 : (x1 >= 0)) (PreH25 : (x2 >= 0)) (PreH26 : (x3 >= 0)) (PreH27 : (x4 >= 0)) (PreH28 : (x5 >= 0)) (PreH29 : (x6 >= 0)) (PreH30 : (x7 >= 0)) (PreH31 : (x8 >= 0)) (PreH32 : (x9 >= 0)) (PreH33 : (x10 >= 0)) (PreH34 : (x11 >= 0)) (PreH35 : (x12 >= 0)) (PreH36 : (x13 >= 0)) (PreH37 : (x14 >= 0)) (PreH38 : (x15 >= 0)) (PreH39 : (pw_rvv_lanes F a retval (pw_vec16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)) )) (PreH40 : (pw_legal_vl k retval )) (PreH41 : (k > 0)) (PreH42 : (pw_odd_pre F W a_pre p_pre kc_pre )) (PreH43 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH44 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH45 : (0 <= k)) (PreH46 : (k <= kc_pre)) ,
  ((&(( &( "va" ) )->ₛ "s15")) # UInt  |-> x15)
  **  ((&(( &( "va" ) )->ₛ "s14")) # UInt  |-> x14)
  **  ((&(( &( "va" ) )->ₛ "s13")) # UInt  |-> x13)
  **  ((&(( &( "va" ) )->ₛ "s12")) # UInt  |-> x12)
  **  ((&(( &( "va" ) )->ₛ "s11")) # UInt  |-> x11)
  **  ((&(( &( "va" ) )->ₛ "s10")) # UInt  |-> x10)
  **  ((&(( &( "va" ) )->ₛ "s9")) # UInt  |-> x9)
  **  ((&(( &( "va" ) )->ₛ "s8")) # UInt  |-> x8)
  **  ((&(( &( "va" ) )->ₛ "s7")) # UInt  |-> x7)
  **  ((&(( &( "va" ) )->ₛ "s6")) # UInt  |-> x6)
  **  ((&(( &( "va" ) )->ₛ "s5")) # UInt  |-> x5)
  **  ((&(( &( "va" ) )->ₛ "s4")) # UInt  |-> x4)
  **  ((&(( &( "va" ) )->ₛ "s3")) # UInt  |-> x3)
  **  ((&(( &( "va" ) )->ₛ "s2")) # UInt  |-> x2)
  **  ((&(( &( "va" ) )->ₛ "s1")) # UInt  |-> x1)
  **  ((&(( &( "va" ) )->ₛ "s0")) # UInt  |-> x0)
  **  (pw_data F )
  **  ((( &( "vl" ) )) # UInt64  |-> retval)
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a)
  **  ((( &( "k" ) )) # UInt64  |-> k)
  **  ((( &( "p" ) )) # Ptr  |-> p)
  **  (pw_output W (pw_odd_run ((kc_pre - k )) (F) (a_pre) (p_pre) (O)) )
|--
  “ (pw_stride_window W p retval ) ”
.

Definition pw_rvv_odd_partial_solve_wit_4_aux := 
forall (p_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (p: Z) (k: Z) (a: Z) (retval: Z) (x0: Z) (x1: Z) (x2: Z) (x3: Z) (x4: Z) (x5: Z) (x6: Z) (x7: Z) (x8: Z) (x9: Z) (x10: Z) (x11: Z) (x12: Z) (x13: Z) (x14: Z) (x15: Z) (PreH1 : (pw_rvv_lanes F a retval (pw_vec16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)) )) (PreH2 : (pw_legal_vl k retval )) (PreH3 : (k > 0)) (PreH4 : (pw_odd_pre F W a_pre p_pre kc_pre )) (PreH5 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH6 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH7 : (0 <= k)) (PreH8 : (k <= kc_pre)) ,
  ((&(( &( "va" ) )->ₛ "s15")) # UInt  |-> x15)
  **  ((&(( &( "va" ) )->ₛ "s14")) # UInt  |-> x14)
  **  ((&(( &( "va" ) )->ₛ "s13")) # UInt  |-> x13)
  **  ((&(( &( "va" ) )->ₛ "s12")) # UInt  |-> x12)
  **  ((&(( &( "va" ) )->ₛ "s11")) # UInt  |-> x11)
  **  ((&(( &( "va" ) )->ₛ "s10")) # UInt  |-> x10)
  **  ((&(( &( "va" ) )->ₛ "s9")) # UInt  |-> x9)
  **  ((&(( &( "va" ) )->ₛ "s8")) # UInt  |-> x8)
  **  ((&(( &( "va" ) )->ₛ "s7")) # UInt  |-> x7)
  **  ((&(( &( "va" ) )->ₛ "s6")) # UInt  |-> x6)
  **  ((&(( &( "va" ) )->ₛ "s5")) # UInt  |-> x5)
  **  ((&(( &( "va" ) )->ₛ "s4")) # UInt  |-> x4)
  **  ((&(( &( "va" ) )->ₛ "s3")) # UInt  |-> x3)
  **  ((&(( &( "va" ) )->ₛ "s2")) # UInt  |-> x2)
  **  ((&(( &( "va" ) )->ₛ "s1")) # UInt  |-> x1)
  **  ((&(( &( "va" ) )->ₛ "s0")) # UInt  |-> x0)
  **  (pw_data F )
  **  (pw_output W (pw_odd_run ((kc_pre - k )) (F) (a_pre) (p_pre) (O)) )
|--
  “ (8 = 8) ” 
  &&  “ (pw_stride_window W p retval ) ” 
  &&  “ (pw_rvv_lanes F a retval (pw_vec16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)) ) ” 
  &&  “ (pw_legal_vl k retval ) ” 
  &&  “ (k > 0) ” 
  &&  “ (pw_odd_pre F W a_pre p_pre kc_pre ) ” 
  &&  “ (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) )))) ” 
  &&  “ (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) )))) ” 
  &&  “ (0 <= k) ” 
  &&  “ (k <= kc_pre) ”
  &&  (pw_output W (pw_odd_run ((kc_pre - k )) (F) (a_pre) (p_pre) (O)) )
  **  ((&(( &( "va" ) )->ₛ "s0")) # UInt  |-> x0)
  **  ((&(( &( "va" ) )->ₛ "s1")) # UInt  |-> x1)
  **  ((&(( &( "va" ) )->ₛ "s2")) # UInt  |-> x2)
  **  ((&(( &( "va" ) )->ₛ "s3")) # UInt  |-> x3)
  **  ((&(( &( "va" ) )->ₛ "s4")) # UInt  |-> x4)
  **  ((&(( &( "va" ) )->ₛ "s5")) # UInt  |-> x5)
  **  ((&(( &( "va" ) )->ₛ "s6")) # UInt  |-> x6)
  **  ((&(( &( "va" ) )->ₛ "s7")) # UInt  |-> x7)
  **  ((&(( &( "va" ) )->ₛ "s8")) # UInt  |-> x8)
  **  ((&(( &( "va" ) )->ₛ "s9")) # UInt  |-> x9)
  **  ((&(( &( "va" ) )->ₛ "s10")) # UInt  |-> x10)
  **  ((&(( &( "va" ) )->ₛ "s11")) # UInt  |-> x11)
  **  ((&(( &( "va" ) )->ₛ "s12")) # UInt  |-> x12)
  **  ((&(( &( "va" ) )->ₛ "s13")) # UInt  |-> x13)
  **  ((&(( &( "va" ) )->ₛ "s14")) # UInt  |-> x14)
  **  ((&(( &( "va" ) )->ₛ "s15")) # UInt  |-> x15)
  **  (pw_data F )
.

Definition pw_rvv_odd_partial_solve_wit_4 := pw_rvv_odd_partial_solve_wit_4_pure -> pw_rvv_odd_partial_solve_wit_4_aux.

Module Type VC_Correct.


Axiom proof_of_pw_rvv_odd_safety_wit_1 : pw_rvv_odd_safety_wit_1.
Axiom proof_of_pw_rvv_odd_safety_wit_2 : pw_rvv_odd_safety_wit_2.
Axiom proof_of_pw_rvv_odd_safety_wit_3 : pw_rvv_odd_safety_wit_3.
Axiom proof_of_pw_rvv_odd_entail_wit_1 : pw_rvv_odd_entail_wit_1.
Axiom proof_of_pw_rvv_odd_entail_wit_2 : pw_rvv_odd_entail_wit_2.
Axiom proof_of_pw_rvv_odd_return_wit_1 : pw_rvv_odd_return_wit_1.
Axiom proof_of_pw_rvv_odd_partial_solve_wit_1 : pw_rvv_odd_partial_solve_wit_1.
Axiom proof_of_pw_rvv_odd_partial_solve_wit_2_pure : pw_rvv_odd_partial_solve_wit_2_pure.
Axiom proof_of_pw_rvv_odd_partial_solve_wit_2 : pw_rvv_odd_partial_solve_wit_2.
Axiom proof_of_pw_rvv_odd_partial_solve_wit_3 : pw_rvv_odd_partial_solve_wit_3.
Axiom proof_of_pw_rvv_odd_partial_solve_wit_4_pure : pw_rvv_odd_partial_solve_wit_4_pure.
Axiom proof_of_pw_rvv_odd_partial_solve_wit_4 : pw_rvv_odd_partial_solve_wit_4.

End VC_Correct.
