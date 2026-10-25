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

(*----- Function pw_rvv_pair -----*)

Definition pw_rvv_pair_safety_wit_1 := 
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (p: Z) (b: Z) (k: Z) (a: Z) (PreH1 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) (PreH2 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH3 : (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) ))))) (PreH4 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH5 : (0 <= k)) (PreH6 : (k <= kc_pre)) ,
  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a)
  **  ((( &( "k" ) )) # UInt64  |-> k)
  **  ((( &( "b" ) )) # Ptr  |-> b)
  **  ((( &( "p" ) )) # Ptr  |-> p)
  **  (pw_data F )
  **  (pw_output W (pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O)) )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition pw_rvv_pair_safety_wit_2 := 
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (p: Z) (b: Z) (k: Z) (a: Z) (retval: Z) (x0: Z) (x1: Z) (x2: Z) (x3: Z) (x4: Z) (x5: Z) (x6: Z) (x7: Z) (x8: Z) (x9: Z) (x10: Z) (x11: Z) (x12: Z) (x13: Z) (x14: Z) (x15: Z) (x0_2: Z) (x1_2: Z) (x2_2: Z) (x3_2: Z) (x4_2: Z) (x5_2: Z) (x6_2: Z) (x7_2: Z) (x8_2: Z) (x9_2: Z) (x10_2: Z) (x11_2: Z) (x12_2: Z) (x13_2: Z) (x14_2: Z) (x15_2: Z) (PreH1 : (pw_rvv_lanes F b retval (pw_vec16 (x0_2) (x1_2) (x2_2) (x3_2) (x4_2) (x5_2) (x6_2) (x7_2) (x8_2) (x9_2) (x10_2) (x11_2) (x12_2) (x13_2) (x14_2) (x15_2)) )) (PreH2 : (pw_rvv_lanes F a retval (pw_vec16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)) )) (PreH3 : (pw_legal_vl k retval )) (PreH4 : (k > 0)) (PreH5 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) (PreH6 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH7 : (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) ))))) (PreH8 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH9 : (0 <= k)) (PreH10 : (k <= kc_pre)) ,
  (pw_output W (pw_segmented (retval) ((pw_vec16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15))) ((pw_vec16 (x0_2) (x1_2) (x2_2) (x3_2) (x4_2) (x5_2) (x6_2) (x7_2) (x8_2) (x9_2) (x10_2) (x11_2) (x12_2) (x13_2) (x14_2) (x15_2))) (p) ((pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O)))) )
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
  **  ((&(( &( "vb" ) )->ₛ "s0")) # UInt  |-> x0_2)
  **  ((&(( &( "vb" ) )->ₛ "s1")) # UInt  |-> x1_2)
  **  ((&(( &( "vb" ) )->ₛ "s2")) # UInt  |-> x2_2)
  **  ((&(( &( "vb" ) )->ₛ "s3")) # UInt  |-> x3_2)
  **  ((&(( &( "vb" ) )->ₛ "s4")) # UInt  |-> x4_2)
  **  ((&(( &( "vb" ) )->ₛ "s5")) # UInt  |-> x5_2)
  **  ((&(( &( "vb" ) )->ₛ "s6")) # UInt  |-> x6_2)
  **  ((&(( &( "vb" ) )->ₛ "s7")) # UInt  |-> x7_2)
  **  ((&(( &( "vb" ) )->ₛ "s8")) # UInt  |-> x8_2)
  **  ((&(( &( "vb" ) )->ₛ "s9")) # UInt  |-> x9_2)
  **  ((&(( &( "vb" ) )->ₛ "s10")) # UInt  |-> x10_2)
  **  ((&(( &( "vb" ) )->ₛ "s11")) # UInt  |-> x11_2)
  **  ((&(( &( "vb" ) )->ₛ "s12")) # UInt  |-> x12_2)
  **  ((&(( &( "vb" ) )->ₛ "s13")) # UInt  |-> x13_2)
  **  ((&(( &( "vb" ) )->ₛ "s14")) # UInt  |-> x14_2)
  **  ((&(( &( "vb" ) )->ₛ "s15")) # UInt  |-> x15_2)
  **  (pw_data F )
  **  ((( &( "vl" ) )) # UInt64  |-> retval)
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "a" ) )) # Ptr  |-> (a + (retval * sizeof(UINT))))
  **  ((( &( "k" ) )) # UInt64  |-> k)
  **  ((( &( "b" ) )) # Ptr  |-> (b + (retval * sizeof(UINT))))
  **  ((( &( "p" ) )) # Ptr  |-> p)
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition pw_rvv_pair_entail_wit_1 := 
(
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (PreH1 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) ,
  (pw_data F )
  **  (pw_output W O )
|--
  “ (pw_pair_pre F W a_pre b_pre p_pre kc_pre ) ” 
  &&  “ (a_pre = (pw_offset (a_pre) ((4 * (kc_pre - kc_pre ) )))) ” 
  &&  “ (b_pre = (pw_offset (b_pre) ((4 * (kc_pre - kc_pre ) )))) ” 
  &&  “ (p_pre = (pw_offset (p_pre) ((8 * (kc_pre - kc_pre ) )))) ” 
  &&  “ (0 <= kc_pre) ” 
  &&  “ (kc_pre <= kc_pre) ”
  &&  (pw_data F )
  **  (pw_output W (pw_pair_run ((kc_pre - kc_pre )) (F) (a_pre) (b_pre) (p_pre) (O)) )
) \/
(
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (PreH1 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) ,
  (pw_data F )
  **  (pw_output W O )
|--
  “ (0 <= kc_pre) ” 
  &&  “ (p_pre = (pw_offset (p_pre) ((8 * (kc_pre - kc_pre ) )))) ” 
  &&  “ (b_pre = (pw_offset (b_pre) ((4 * (kc_pre - kc_pre ) )))) ” 
  &&  “ (a_pre = (pw_offset (a_pre) ((4 * (kc_pre - kc_pre ) )))) ”
  &&  (pw_data F )
  **  (pw_output W (pw_pair_run ((kc_pre - kc_pre )) (F) (a_pre) (b_pre) (p_pre) (O)) )
).

Definition pw_rvv_pair_entail_wit_1_split_goal_1 := 
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (PreH1 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) ,
  (pw_data F )
  **  (pw_output W O )
|--
  “ (0 <= kc_pre) ”
.

Definition pw_rvv_pair_entail_wit_1_split_goal_2 := 
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (PreH1 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) ,
  (pw_data F )
  **  (pw_output W O )
|--
  “ (p_pre = (pw_offset (p_pre) ((8 * (kc_pre - kc_pre ) )))) ”
.

Definition pw_rvv_pair_entail_wit_1_split_goal_3 := 
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (PreH1 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) ,
  (pw_data F )
  **  (pw_output W O )
|--
  “ (b_pre = (pw_offset (b_pre) ((4 * (kc_pre - kc_pre ) )))) ”
.

Definition pw_rvv_pair_entail_wit_1_split_goal_4 := 
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (PreH1 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) ,
  (pw_data F )
  **  (pw_output W O )
|--
  “ (a_pre = (pw_offset (a_pre) ((4 * (kc_pre - kc_pre ) )))) ”
.

Definition pw_rvv_pair_entail_wit_1_split_goal_spatial := 
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (PreH1 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) ,
  (pw_data F )
  **  (pw_output W O )
|--
  (pw_data F )
  **  (pw_output W (pw_pair_run ((kc_pre - kc_pre )) (F) (a_pre) (b_pre) (p_pre) (O)) )
.

Definition pw_rvv_pair_entail_wit_2 := 
(
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (p: Z) (b: Z) (k: Z) (a: Z) (retval: Z) (x0: Z) (x1: Z) (x2: Z) (x3: Z) (x4: Z) (x5: Z) (x6: Z) (x7: Z) (x8: Z) (x9: Z) (x10: Z) (x11: Z) (x12: Z) (x13: Z) (x14: Z) (x15: Z) (x0_2: Z) (x1_2: Z) (x2_2: Z) (x3_2: Z) (x4_2: Z) (x5_2: Z) (x6_2: Z) (x7_2: Z) (x8_2: Z) (x9_2: Z) (x10_2: Z) (x11_2: Z) (x12_2: Z) (x13_2: Z) (x14_2: Z) (x15_2: Z) (PreH1 : (pw_rvv_lanes F b retval (pw_vec16 (x0_2) (x1_2) (x2_2) (x3_2) (x4_2) (x5_2) (x6_2) (x7_2) (x8_2) (x9_2) (x10_2) (x11_2) (x12_2) (x13_2) (x14_2) (x15_2)) )) (PreH2 : (pw_rvv_lanes F a retval (pw_vec16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)) )) (PreH3 : (pw_legal_vl k retval )) (PreH4 : (k > 0)) (PreH5 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) (PreH6 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH7 : (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) ))))) (PreH8 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH9 : (0 <= k)) (PreH10 : (k <= kc_pre)) ,
  (pw_output W (pw_segmented (retval) ((pw_vec16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15))) ((pw_vec16 (x0_2) (x1_2) (x2_2) (x3_2) (x4_2) (x5_2) (x6_2) (x7_2) (x8_2) (x9_2) (x10_2) (x11_2) (x12_2) (x13_2) (x14_2) (x15_2))) (p) ((pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O)))) )
  **  (pw_data F )
|--
  “ (pw_pair_pre F W a_pre b_pre p_pre kc_pre ) ” 
  &&  “ ((a + (retval * sizeof(UINT))) = (pw_offset (a_pre) ((4 * (kc_pre - (unsigned_last_nbits ((k - retval )) (64)) ) )))) ” 
  &&  “ ((b + (retval * sizeof(UINT))) = (pw_offset (b_pre) ((4 * (kc_pre - (unsigned_last_nbits ((k - retval )) (64)) ) )))) ” 
  &&  “ ((p + ((unsigned_last_nbits ((2 * retval )) (64)) * sizeof(UINT))) = (pw_offset (p_pre) ((8 * (kc_pre - (unsigned_last_nbits ((k - retval )) (64)) ) )))) ” 
  &&  “ (0 <= (unsigned_last_nbits ((k - retval )) (64))) ” 
  &&  “ ((unsigned_last_nbits ((k - retval )) (64)) <= kc_pre) ”
  &&  (pw_data F )
  **  (pw_output W (pw_pair_run ((kc_pre - (unsigned_last_nbits ((k - retval )) (64)) )) (F) (a_pre) (b_pre) (p_pre) (O)) )
) \/
(
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (p: Z) (b: Z) (k: Z) (a: Z) (retval: Z) (x0: Z) (x1: Z) (x2: Z) (x3: Z) (x4: Z) (x5: Z) (x6: Z) (x7: Z) (x8: Z) (x9: Z) (x10: Z) (x11: Z) (x12: Z) (x13: Z) (x14: Z) (x15: Z) (x0_2: Z) (x1_2: Z) (x2_2: Z) (x3_2: Z) (x4_2: Z) (x5_2: Z) (x6_2: Z) (x7_2: Z) (x8_2: Z) (x9_2: Z) (x10_2: Z) (x11_2: Z) (x12_2: Z) (x13_2: Z) (x14_2: Z) (x15_2: Z) (PreH1 : (pw_rvv_lanes F b retval (pw_vec16 (x0_2) (x1_2) (x2_2) (x3_2) (x4_2) (x5_2) (x6_2) (x7_2) (x8_2) (x9_2) (x10_2) (x11_2) (x12_2) (x13_2) (x14_2) (x15_2)) )) (PreH2 : (pw_rvv_lanes F a retval (pw_vec16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)) )) (PreH3 : (pw_legal_vl k retval )) (PreH4 : (k > 0)) (PreH5 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) (PreH6 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH7 : (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) ))))) (PreH8 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH9 : (0 <= k)) (PreH10 : (k <= kc_pre)) ,
  (pw_output W (pw_segmented (retval) ((pw_vec16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15))) ((pw_vec16 (x0_2) (x1_2) (x2_2) (x3_2) (x4_2) (x5_2) (x6_2) (x7_2) (x8_2) (x9_2) (x10_2) (x11_2) (x12_2) (x13_2) (x14_2) (x15_2))) (p) ((pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O)))) )
  **  (pw_data F )
|--
  “ ((unsigned_last_nbits ((k - retval )) (64)) <= kc_pre) ” 
  &&  “ (0 <= (unsigned_last_nbits ((k - retval )) (64))) ” 
  &&  “ ((p + ((unsigned_last_nbits ((2 * retval )) (64)) * sizeof(UINT))) = (pw_offset (p_pre) ((8 * (kc_pre - (unsigned_last_nbits ((k - retval )) (64)) ) )))) ” 
  &&  “ ((b + (retval * sizeof(UINT))) = (pw_offset (b_pre) ((4 * (kc_pre - (unsigned_last_nbits ((k - retval )) (64)) ) )))) ” 
  &&  “ ((a + (retval * sizeof(UINT))) = (pw_offset (a_pre) ((4 * (kc_pre - (unsigned_last_nbits ((k - retval )) (64)) ) )))) ”
  &&  (pw_data F )
  **  (pw_output W (pw_pair_run ((kc_pre - (unsigned_last_nbits ((k - retval )) (64)) )) (F) (a_pre) (b_pre) (p_pre) (O)) )
).

Definition pw_rvv_pair_entail_wit_2_split_goal_1 := 
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (p: Z) (b: Z) (k: Z) (a: Z) (retval: Z) (x0: Z) (x1: Z) (x2: Z) (x3: Z) (x4: Z) (x5: Z) (x6: Z) (x7: Z) (x8: Z) (x9: Z) (x10: Z) (x11: Z) (x12: Z) (x13: Z) (x14: Z) (x15: Z) (x0_2: Z) (x1_2: Z) (x2_2: Z) (x3_2: Z) (x4_2: Z) (x5_2: Z) (x6_2: Z) (x7_2: Z) (x8_2: Z) (x9_2: Z) (x10_2: Z) (x11_2: Z) (x12_2: Z) (x13_2: Z) (x14_2: Z) (x15_2: Z) (PreH1 : (pw_rvv_lanes F b retval (pw_vec16 (x0_2) (x1_2) (x2_2) (x3_2) (x4_2) (x5_2) (x6_2) (x7_2) (x8_2) (x9_2) (x10_2) (x11_2) (x12_2) (x13_2) (x14_2) (x15_2)) )) (PreH2 : (pw_rvv_lanes F a retval (pw_vec16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)) )) (PreH3 : (pw_legal_vl k retval )) (PreH4 : (k > 0)) (PreH5 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) (PreH6 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH7 : (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) ))))) (PreH8 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH9 : (0 <= k)) (PreH10 : (k <= kc_pre)) ,
  (pw_output W (pw_segmented (retval) ((pw_vec16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15))) ((pw_vec16 (x0_2) (x1_2) (x2_2) (x3_2) (x4_2) (x5_2) (x6_2) (x7_2) (x8_2) (x9_2) (x10_2) (x11_2) (x12_2) (x13_2) (x14_2) (x15_2))) (p) ((pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O)))) )
  **  (pw_data F )
|--
  “ ((unsigned_last_nbits ((k - retval )) (64)) <= kc_pre) ”
.

Definition pw_rvv_pair_entail_wit_2_split_goal_2 := 
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (p: Z) (b: Z) (k: Z) (a: Z) (retval: Z) (x0: Z) (x1: Z) (x2: Z) (x3: Z) (x4: Z) (x5: Z) (x6: Z) (x7: Z) (x8: Z) (x9: Z) (x10: Z) (x11: Z) (x12: Z) (x13: Z) (x14: Z) (x15: Z) (x0_2: Z) (x1_2: Z) (x2_2: Z) (x3_2: Z) (x4_2: Z) (x5_2: Z) (x6_2: Z) (x7_2: Z) (x8_2: Z) (x9_2: Z) (x10_2: Z) (x11_2: Z) (x12_2: Z) (x13_2: Z) (x14_2: Z) (x15_2: Z) (PreH1 : (pw_rvv_lanes F b retval (pw_vec16 (x0_2) (x1_2) (x2_2) (x3_2) (x4_2) (x5_2) (x6_2) (x7_2) (x8_2) (x9_2) (x10_2) (x11_2) (x12_2) (x13_2) (x14_2) (x15_2)) )) (PreH2 : (pw_rvv_lanes F a retval (pw_vec16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)) )) (PreH3 : (pw_legal_vl k retval )) (PreH4 : (k > 0)) (PreH5 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) (PreH6 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH7 : (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) ))))) (PreH8 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH9 : (0 <= k)) (PreH10 : (k <= kc_pre)) ,
  (pw_output W (pw_segmented (retval) ((pw_vec16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15))) ((pw_vec16 (x0_2) (x1_2) (x2_2) (x3_2) (x4_2) (x5_2) (x6_2) (x7_2) (x8_2) (x9_2) (x10_2) (x11_2) (x12_2) (x13_2) (x14_2) (x15_2))) (p) ((pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O)))) )
  **  (pw_data F )
|--
  “ (0 <= (unsigned_last_nbits ((k - retval )) (64))) ”
.

Definition pw_rvv_pair_entail_wit_2_split_goal_3 := 
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (p: Z) (b: Z) (k: Z) (a: Z) (retval: Z) (x0: Z) (x1: Z) (x2: Z) (x3: Z) (x4: Z) (x5: Z) (x6: Z) (x7: Z) (x8: Z) (x9: Z) (x10: Z) (x11: Z) (x12: Z) (x13: Z) (x14: Z) (x15: Z) (x0_2: Z) (x1_2: Z) (x2_2: Z) (x3_2: Z) (x4_2: Z) (x5_2: Z) (x6_2: Z) (x7_2: Z) (x8_2: Z) (x9_2: Z) (x10_2: Z) (x11_2: Z) (x12_2: Z) (x13_2: Z) (x14_2: Z) (x15_2: Z) (PreH1 : (pw_rvv_lanes F b retval (pw_vec16 (x0_2) (x1_2) (x2_2) (x3_2) (x4_2) (x5_2) (x6_2) (x7_2) (x8_2) (x9_2) (x10_2) (x11_2) (x12_2) (x13_2) (x14_2) (x15_2)) )) (PreH2 : (pw_rvv_lanes F a retval (pw_vec16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)) )) (PreH3 : (pw_legal_vl k retval )) (PreH4 : (k > 0)) (PreH5 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) (PreH6 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH7 : (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) ))))) (PreH8 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH9 : (0 <= k)) (PreH10 : (k <= kc_pre)) ,
  (pw_output W (pw_segmented (retval) ((pw_vec16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15))) ((pw_vec16 (x0_2) (x1_2) (x2_2) (x3_2) (x4_2) (x5_2) (x6_2) (x7_2) (x8_2) (x9_2) (x10_2) (x11_2) (x12_2) (x13_2) (x14_2) (x15_2))) (p) ((pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O)))) )
  **  (pw_data F )
|--
  “ ((p + ((unsigned_last_nbits ((2 * retval )) (64)) * sizeof(UINT))) = (pw_offset (p_pre) ((8 * (kc_pre - (unsigned_last_nbits ((k - retval )) (64)) ) )))) ”
.

Definition pw_rvv_pair_entail_wit_2_split_goal_4 := 
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (p: Z) (b: Z) (k: Z) (a: Z) (retval: Z) (x0: Z) (x1: Z) (x2: Z) (x3: Z) (x4: Z) (x5: Z) (x6: Z) (x7: Z) (x8: Z) (x9: Z) (x10: Z) (x11: Z) (x12: Z) (x13: Z) (x14: Z) (x15: Z) (x0_2: Z) (x1_2: Z) (x2_2: Z) (x3_2: Z) (x4_2: Z) (x5_2: Z) (x6_2: Z) (x7_2: Z) (x8_2: Z) (x9_2: Z) (x10_2: Z) (x11_2: Z) (x12_2: Z) (x13_2: Z) (x14_2: Z) (x15_2: Z) (PreH1 : (pw_rvv_lanes F b retval (pw_vec16 (x0_2) (x1_2) (x2_2) (x3_2) (x4_2) (x5_2) (x6_2) (x7_2) (x8_2) (x9_2) (x10_2) (x11_2) (x12_2) (x13_2) (x14_2) (x15_2)) )) (PreH2 : (pw_rvv_lanes F a retval (pw_vec16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)) )) (PreH3 : (pw_legal_vl k retval )) (PreH4 : (k > 0)) (PreH5 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) (PreH6 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH7 : (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) ))))) (PreH8 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH9 : (0 <= k)) (PreH10 : (k <= kc_pre)) ,
  (pw_output W (pw_segmented (retval) ((pw_vec16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15))) ((pw_vec16 (x0_2) (x1_2) (x2_2) (x3_2) (x4_2) (x5_2) (x6_2) (x7_2) (x8_2) (x9_2) (x10_2) (x11_2) (x12_2) (x13_2) (x14_2) (x15_2))) (p) ((pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O)))) )
  **  (pw_data F )
|--
  “ ((b + (retval * sizeof(UINT))) = (pw_offset (b_pre) ((4 * (kc_pre - (unsigned_last_nbits ((k - retval )) (64)) ) )))) ”
.

Definition pw_rvv_pair_entail_wit_2_split_goal_5 := 
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (p: Z) (b: Z) (k: Z) (a: Z) (retval: Z) (x0: Z) (x1: Z) (x2: Z) (x3: Z) (x4: Z) (x5: Z) (x6: Z) (x7: Z) (x8: Z) (x9: Z) (x10: Z) (x11: Z) (x12: Z) (x13: Z) (x14: Z) (x15: Z) (x0_2: Z) (x1_2: Z) (x2_2: Z) (x3_2: Z) (x4_2: Z) (x5_2: Z) (x6_2: Z) (x7_2: Z) (x8_2: Z) (x9_2: Z) (x10_2: Z) (x11_2: Z) (x12_2: Z) (x13_2: Z) (x14_2: Z) (x15_2: Z) (PreH1 : (pw_rvv_lanes F b retval (pw_vec16 (x0_2) (x1_2) (x2_2) (x3_2) (x4_2) (x5_2) (x6_2) (x7_2) (x8_2) (x9_2) (x10_2) (x11_2) (x12_2) (x13_2) (x14_2) (x15_2)) )) (PreH2 : (pw_rvv_lanes F a retval (pw_vec16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)) )) (PreH3 : (pw_legal_vl k retval )) (PreH4 : (k > 0)) (PreH5 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) (PreH6 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH7 : (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) ))))) (PreH8 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH9 : (0 <= k)) (PreH10 : (k <= kc_pre)) ,
  (pw_output W (pw_segmented (retval) ((pw_vec16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15))) ((pw_vec16 (x0_2) (x1_2) (x2_2) (x3_2) (x4_2) (x5_2) (x6_2) (x7_2) (x8_2) (x9_2) (x10_2) (x11_2) (x12_2) (x13_2) (x14_2) (x15_2))) (p) ((pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O)))) )
  **  (pw_data F )
|--
  “ ((a + (retval * sizeof(UINT))) = (pw_offset (a_pre) ((4 * (kc_pre - (unsigned_last_nbits ((k - retval )) (64)) ) )))) ”
.

Definition pw_rvv_pair_entail_wit_2_split_goal_spatial := 
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (p: Z) (b: Z) (k: Z) (a: Z) (retval: Z) (x0: Z) (x1: Z) (x2: Z) (x3: Z) (x4: Z) (x5: Z) (x6: Z) (x7: Z) (x8: Z) (x9: Z) (x10: Z) (x11: Z) (x12: Z) (x13: Z) (x14: Z) (x15: Z) (x0_2: Z) (x1_2: Z) (x2_2: Z) (x3_2: Z) (x4_2: Z) (x5_2: Z) (x6_2: Z) (x7_2: Z) (x8_2: Z) (x9_2: Z) (x10_2: Z) (x11_2: Z) (x12_2: Z) (x13_2: Z) (x14_2: Z) (x15_2: Z) (PreH1 : (pw_rvv_lanes F b retval (pw_vec16 (x0_2) (x1_2) (x2_2) (x3_2) (x4_2) (x5_2) (x6_2) (x7_2) (x8_2) (x9_2) (x10_2) (x11_2) (x12_2) (x13_2) (x14_2) (x15_2)) )) (PreH2 : (pw_rvv_lanes F a retval (pw_vec16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)) )) (PreH3 : (pw_legal_vl k retval )) (PreH4 : (k > 0)) (PreH5 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) (PreH6 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH7 : (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) ))))) (PreH8 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH9 : (0 <= k)) (PreH10 : (k <= kc_pre)) ,
  (pw_output W (pw_segmented (retval) ((pw_vec16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15))) ((pw_vec16 (x0_2) (x1_2) (x2_2) (x3_2) (x4_2) (x5_2) (x6_2) (x7_2) (x8_2) (x9_2) (x10_2) (x11_2) (x12_2) (x13_2) (x14_2) (x15_2))) (p) ((pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O)))) )
  **  (pw_data F )
|--
  (pw_data F )
  **  (pw_output W (pw_pair_run ((kc_pre - (unsigned_last_nbits ((k - retval )) (64)) )) (F) (a_pre) (b_pre) (p_pre) (O)) )
.

Definition pw_rvv_pair_return_wit_1 := 
(
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (p: Z) (b: Z) (k: Z) (a: Z) (PreH1 : (k <= 0)) (PreH2 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) (PreH3 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH4 : (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) ))))) (PreH5 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH6 : (0 <= k)) (PreH7 : (k <= kc_pre)) ,
  (pw_data F )
  **  (pw_output W (pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O)) )
|--
  (pw_data F )
  **  (pw_output W (pw_pair_run (kc_pre) (F) (a_pre) (b_pre) (p_pre) (O)) )
) \/
(
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (p: Z) (b: Z) (k: Z) (a: Z) (PreH1 : (k <= 0)) (PreH2 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) (PreH3 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH4 : (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) ))))) (PreH5 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH6 : (0 <= k)) (PreH7 : (k <= kc_pre)) ,
  (pw_data F )
  **  (pw_output W (pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O)) )
|--
  (pw_data F )
  **  (pw_output W (pw_pair_run (kc_pre) (F) (a_pre) (b_pre) (p_pre) (O)) )
).

Definition pw_rvv_pair_return_wit_1_split_goal_spatial := 
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (p: Z) (b: Z) (k: Z) (a: Z) (PreH1 : (k <= 0)) (PreH2 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) (PreH3 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH4 : (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) ))))) (PreH5 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH6 : (0 <= k)) (PreH7 : (k <= kc_pre)) ,
  (pw_data F )
  **  (pw_output W (pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O)) )
|--
  (pw_data F )
  **  (pw_output W (pw_pair_run (kc_pre) (F) (a_pre) (b_pre) (p_pre) (O)) )
.

Definition pw_rvv_pair_partial_solve_wit_1 := 
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (p: Z) (b: Z) (k: Z) (a: Z) (PreH1 : (k > 0)) (PreH2 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) (PreH3 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH4 : (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) ))))) (PreH5 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH6 : (0 <= k)) (PreH7 : (k <= kc_pre)) ,
  (pw_data F )
  **  (pw_output W (pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O)) )
|--
  “ (k > 0) ” 
  &&  “ (pw_pair_pre F W a_pre b_pre p_pre kc_pre ) ” 
  &&  “ (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) )))) ” 
  &&  “ (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) )))) ” 
  &&  “ (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) )))) ” 
  &&  “ (0 <= k) ” 
  &&  “ (k <= kc_pre) ”
  &&  (pw_data F )
  **  (pw_output W (pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O)) )
.

Definition pw_rvv_pair_partial_solve_wit_2_pure := 
(
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (p: Z) (b: Z) (k: Z) (a: Z) (retval: Z) (PreH1 : (pw_legal_vl k retval )) (PreH2 : (k > 0)) (PreH3 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) (PreH4 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH5 : (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) ))))) (PreH6 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH7 : (0 <= k)) (PreH8 : (k <= kc_pre)) ,
  (UndefStructPredvuint32m4_t ( &( "va" ) ) )
  **  ((( &( "vl" ) )) # UInt64  |-> retval)
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a)
  **  ((( &( "k" ) )) # UInt64  |-> k)
  **  ((( &( "b" ) )) # Ptr  |-> b)
  **  ((( &( "p" ) )) # Ptr  |-> p)
  **  (pw_data F )
  **  (pw_output W (pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O)) )
|--
  “ (pw_window F a retval ) ” 
  &&  “ (retval <= 16) ” 
  &&  “ (0 <= retval) ”
) \/
(
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (p: Z) (b: Z) (k: Z) (a: Z) (retval: Z) (PreH1 : (k <= UINT64_MAX)) (PreH2 : (kc_pre <= UINT64_MAX)) (PreH3 : (retval <= UINT64_MAX)) (PreH4 : (k >= 0)) (PreH5 : (kc_pre >= 0)) (PreH6 : (retval >= 0)) (PreH7 : (pw_legal_vl k retval )) (PreH8 : (k > 0)) (PreH9 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) (PreH10 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH11 : (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) ))))) (PreH12 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH13 : (0 <= k)) (PreH14 : (k <= kc_pre)) ,
  (UndefStructPredvuint32m4_t ( &( "va" ) ) )
  **  ((( &( "vl" ) )) # UInt64  |-> retval)
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a)
  **  ((( &( "k" ) )) # UInt64  |-> k)
  **  ((( &( "b" ) )) # Ptr  |-> b)
  **  ((( &( "p" ) )) # Ptr  |-> p)
  **  (pw_data F )
  **  (pw_output W (pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O)) )
|--
  “ (retval <= 16) ” 
  &&  “ (pw_window F a retval ) ”
).

Definition pw_rvv_pair_partial_solve_wit_2_pure_split_goal_1 := 
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (p: Z) (b: Z) (k: Z) (a: Z) (retval: Z) (PreH1 : (k <= UINT64_MAX)) (PreH2 : (kc_pre <= UINT64_MAX)) (PreH3 : (retval <= UINT64_MAX)) (PreH4 : (k >= 0)) (PreH5 : (kc_pre >= 0)) (PreH6 : (retval >= 0)) (PreH7 : (pw_legal_vl k retval )) (PreH8 : (k > 0)) (PreH9 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) (PreH10 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH11 : (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) ))))) (PreH12 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH13 : (0 <= k)) (PreH14 : (k <= kc_pre)) ,
  (UndefStructPredvuint32m4_t ( &( "va" ) ) )
  **  ((( &( "vl" ) )) # UInt64  |-> retval)
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a)
  **  ((( &( "k" ) )) # UInt64  |-> k)
  **  ((( &( "b" ) )) # Ptr  |-> b)
  **  ((( &( "p" ) )) # Ptr  |-> p)
  **  (pw_data F )
  **  (pw_output W (pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O)) )
|--
  “ (retval <= 16) ”
.

Definition pw_rvv_pair_partial_solve_wit_2_pure_split_goal_2 := 
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (p: Z) (b: Z) (k: Z) (a: Z) (retval: Z) (PreH1 : (k <= UINT64_MAX)) (PreH2 : (kc_pre <= UINT64_MAX)) (PreH3 : (retval <= UINT64_MAX)) (PreH4 : (k >= 0)) (PreH5 : (kc_pre >= 0)) (PreH6 : (retval >= 0)) (PreH7 : (pw_legal_vl k retval )) (PreH8 : (k > 0)) (PreH9 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) (PreH10 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH11 : (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) ))))) (PreH12 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH13 : (0 <= k)) (PreH14 : (k <= kc_pre)) ,
  (UndefStructPredvuint32m4_t ( &( "va" ) ) )
  **  ((( &( "vl" ) )) # UInt64  |-> retval)
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a)
  **  ((( &( "k" ) )) # UInt64  |-> k)
  **  ((( &( "b" ) )) # Ptr  |-> b)
  **  ((( &( "p" ) )) # Ptr  |-> p)
  **  (pw_data F )
  **  (pw_output W (pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O)) )
|--
  “ (pw_window F a retval ) ”
.

Definition pw_rvv_pair_partial_solve_wit_2_aux := 
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (p: Z) (b: Z) (k: Z) (a: Z) (retval: Z) (PreH1 : (pw_legal_vl k retval )) (PreH2 : (k > 0)) (PreH3 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) (PreH4 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH5 : (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) ))))) (PreH6 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH7 : (0 <= k)) (PreH8 : (k <= kc_pre)) ,
  (UndefStructPredvuint32m4_t ( &( "va" ) ) )
  **  (pw_data F )
  **  (pw_output W (pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O)) )
|--
  “ (pw_window F a retval ) ” 
  &&  “ (retval <= 16) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (pw_legal_vl k retval ) ” 
  &&  “ (k > 0) ” 
  &&  “ (pw_pair_pre F W a_pre b_pre p_pre kc_pre ) ” 
  &&  “ (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) )))) ” 
  &&  “ (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) )))) ” 
  &&  “ (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) )))) ” 
  &&  “ (0 <= k) ” 
  &&  “ (k <= kc_pre) ”
  &&  (pw_data F )
  **  (UndefStructPredvuint32m4_t ( &( "va" ) ) )
  **  (pw_output W (pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O)) )
.

Definition pw_rvv_pair_partial_solve_wit_2 := pw_rvv_pair_partial_solve_wit_2_pure -> pw_rvv_pair_partial_solve_wit_2_aux.

Definition pw_rvv_pair_partial_solve_wit_3 := 
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (p: Z) (b: Z) (k: Z) (a: Z) (retval: Z) (x0: Z) (x1: Z) (x2: Z) (x3: Z) (x4: Z) (x5: Z) (x6: Z) (x7: Z) (x8: Z) (x9: Z) (x10: Z) (x11: Z) (x12: Z) (x13: Z) (x14: Z) (x15: Z) (retval_2: Z) (PreH1 : (pw_rvv_lanes F a retval (pw_vec16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)) )) (PreH2 : (pw_legal_vl k retval )) (PreH3 : (k > 0)) (PreH4 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) (PreH5 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH6 : (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) ))))) (PreH7 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH8 : (0 <= k)) (PreH9 : (k <= kc_pre)) ,
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
  **  (pw_output W (pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O)) )
|--
  “ (pw_rvv_lanes F a retval (pw_vec16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)) ) ” 
  &&  “ (pw_legal_vl k retval ) ” 
  &&  “ (k > 0) ” 
  &&  “ (pw_pair_pre F W a_pre b_pre p_pre kc_pre ) ” 
  &&  “ (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) )))) ” 
  &&  “ (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) )))) ” 
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
  **  (pw_output W (pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O)) )
.

Definition pw_rvv_pair_partial_solve_wit_4_pure := 
(
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (p: Z) (b: Z) (k: Z) (a: Z) (retval: Z) (x0: Z) (x1: Z) (x2: Z) (x3: Z) (x4: Z) (x5: Z) (x6: Z) (x7: Z) (x8: Z) (x9: Z) (x10: Z) (x11: Z) (x12: Z) (x13: Z) (x14: Z) (x15: Z) (PreH1 : (pw_rvv_lanes F a retval (pw_vec16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)) )) (PreH2 : (pw_legal_vl k retval )) (PreH3 : (k > 0)) (PreH4 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) (PreH5 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH6 : (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) ))))) (PreH7 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH8 : (0 <= k)) (PreH9 : (k <= kc_pre)) ,
  (UndefStructPredvuint32m4_t ( &( "vb" ) ) )
  **  ((&(( &( "va" ) )->ₛ "s15")) # UInt  |-> x15)
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
  **  ((( &( "b" ) )) # Ptr  |-> b)
  **  ((( &( "p" ) )) # Ptr  |-> p)
  **  (pw_output W (pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O)) )
|--
  “ (pw_window F b retval ) ” 
  &&  “ (retval <= 16) ” 
  &&  “ (0 <= retval) ”
) \/
(
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (p: Z) (b: Z) (k: Z) (a: Z) (retval: Z) (x0: Z) (x1: Z) (x2: Z) (x3: Z) (x4: Z) (x5: Z) (x6: Z) (x7: Z) (x8: Z) (x9: Z) (x10: Z) (x11: Z) (x12: Z) (x13: Z) (x14: Z) (x15: Z) (PreH1 : (k <= UINT64_MAX)) (PreH2 : (kc_pre <= UINT64_MAX)) (PreH3 : (retval <= UINT64_MAX)) (PreH4 : (k >= 0)) (PreH5 : (kc_pre >= 0)) (PreH6 : (retval >= 0)) (PreH7 : (x0 <= UINT_MAX)) (PreH8 : (x1 <= UINT_MAX)) (PreH9 : (x2 <= UINT_MAX)) (PreH10 : (x3 <= UINT_MAX)) (PreH11 : (x4 <= UINT_MAX)) (PreH12 : (x5 <= UINT_MAX)) (PreH13 : (x6 <= UINT_MAX)) (PreH14 : (x7 <= UINT_MAX)) (PreH15 : (x8 <= UINT_MAX)) (PreH16 : (x9 <= UINT_MAX)) (PreH17 : (x10 <= UINT_MAX)) (PreH18 : (x11 <= UINT_MAX)) (PreH19 : (x12 <= UINT_MAX)) (PreH20 : (x13 <= UINT_MAX)) (PreH21 : (x14 <= UINT_MAX)) (PreH22 : (x15 <= UINT_MAX)) (PreH23 : (x0 >= 0)) (PreH24 : (x1 >= 0)) (PreH25 : (x2 >= 0)) (PreH26 : (x3 >= 0)) (PreH27 : (x4 >= 0)) (PreH28 : (x5 >= 0)) (PreH29 : (x6 >= 0)) (PreH30 : (x7 >= 0)) (PreH31 : (x8 >= 0)) (PreH32 : (x9 >= 0)) (PreH33 : (x10 >= 0)) (PreH34 : (x11 >= 0)) (PreH35 : (x12 >= 0)) (PreH36 : (x13 >= 0)) (PreH37 : (x14 >= 0)) (PreH38 : (x15 >= 0)) (PreH39 : (pw_rvv_lanes F a retval (pw_vec16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)) )) (PreH40 : (pw_legal_vl k retval )) (PreH41 : (k > 0)) (PreH42 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) (PreH43 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH44 : (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) ))))) (PreH45 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH46 : (0 <= k)) (PreH47 : (k <= kc_pre)) ,
  (UndefStructPredvuint32m4_t ( &( "vb" ) ) )
  **  ((&(( &( "va" ) )->ₛ "s15")) # UInt  |-> x15)
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
  **  ((( &( "b" ) )) # Ptr  |-> b)
  **  ((( &( "p" ) )) # Ptr  |-> p)
  **  (pw_output W (pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O)) )
|--
  “ (retval <= 16) ” 
  &&  “ (pw_window F b retval ) ”
).

Definition pw_rvv_pair_partial_solve_wit_4_pure_split_goal_1 := 
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (p: Z) (b: Z) (k: Z) (a: Z) (retval: Z) (x0: Z) (x1: Z) (x2: Z) (x3: Z) (x4: Z) (x5: Z) (x6: Z) (x7: Z) (x8: Z) (x9: Z) (x10: Z) (x11: Z) (x12: Z) (x13: Z) (x14: Z) (x15: Z) (PreH1 : (k <= UINT64_MAX)) (PreH2 : (kc_pre <= UINT64_MAX)) (PreH3 : (retval <= UINT64_MAX)) (PreH4 : (k >= 0)) (PreH5 : (kc_pre >= 0)) (PreH6 : (retval >= 0)) (PreH7 : (x0 <= UINT_MAX)) (PreH8 : (x1 <= UINT_MAX)) (PreH9 : (x2 <= UINT_MAX)) (PreH10 : (x3 <= UINT_MAX)) (PreH11 : (x4 <= UINT_MAX)) (PreH12 : (x5 <= UINT_MAX)) (PreH13 : (x6 <= UINT_MAX)) (PreH14 : (x7 <= UINT_MAX)) (PreH15 : (x8 <= UINT_MAX)) (PreH16 : (x9 <= UINT_MAX)) (PreH17 : (x10 <= UINT_MAX)) (PreH18 : (x11 <= UINT_MAX)) (PreH19 : (x12 <= UINT_MAX)) (PreH20 : (x13 <= UINT_MAX)) (PreH21 : (x14 <= UINT_MAX)) (PreH22 : (x15 <= UINT_MAX)) (PreH23 : (x0 >= 0)) (PreH24 : (x1 >= 0)) (PreH25 : (x2 >= 0)) (PreH26 : (x3 >= 0)) (PreH27 : (x4 >= 0)) (PreH28 : (x5 >= 0)) (PreH29 : (x6 >= 0)) (PreH30 : (x7 >= 0)) (PreH31 : (x8 >= 0)) (PreH32 : (x9 >= 0)) (PreH33 : (x10 >= 0)) (PreH34 : (x11 >= 0)) (PreH35 : (x12 >= 0)) (PreH36 : (x13 >= 0)) (PreH37 : (x14 >= 0)) (PreH38 : (x15 >= 0)) (PreH39 : (pw_rvv_lanes F a retval (pw_vec16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)) )) (PreH40 : (pw_legal_vl k retval )) (PreH41 : (k > 0)) (PreH42 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) (PreH43 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH44 : (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) ))))) (PreH45 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH46 : (0 <= k)) (PreH47 : (k <= kc_pre)) ,
  (UndefStructPredvuint32m4_t ( &( "vb" ) ) )
  **  ((&(( &( "va" ) )->ₛ "s15")) # UInt  |-> x15)
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
  **  ((( &( "b" ) )) # Ptr  |-> b)
  **  ((( &( "p" ) )) # Ptr  |-> p)
  **  (pw_output W (pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O)) )
|--
  “ (retval <= 16) ”
.

Definition pw_rvv_pair_partial_solve_wit_4_pure_split_goal_2 := 
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (p: Z) (b: Z) (k: Z) (a: Z) (retval: Z) (x0: Z) (x1: Z) (x2: Z) (x3: Z) (x4: Z) (x5: Z) (x6: Z) (x7: Z) (x8: Z) (x9: Z) (x10: Z) (x11: Z) (x12: Z) (x13: Z) (x14: Z) (x15: Z) (PreH1 : (k <= UINT64_MAX)) (PreH2 : (kc_pre <= UINT64_MAX)) (PreH3 : (retval <= UINT64_MAX)) (PreH4 : (k >= 0)) (PreH5 : (kc_pre >= 0)) (PreH6 : (retval >= 0)) (PreH7 : (x0 <= UINT_MAX)) (PreH8 : (x1 <= UINT_MAX)) (PreH9 : (x2 <= UINT_MAX)) (PreH10 : (x3 <= UINT_MAX)) (PreH11 : (x4 <= UINT_MAX)) (PreH12 : (x5 <= UINT_MAX)) (PreH13 : (x6 <= UINT_MAX)) (PreH14 : (x7 <= UINT_MAX)) (PreH15 : (x8 <= UINT_MAX)) (PreH16 : (x9 <= UINT_MAX)) (PreH17 : (x10 <= UINT_MAX)) (PreH18 : (x11 <= UINT_MAX)) (PreH19 : (x12 <= UINT_MAX)) (PreH20 : (x13 <= UINT_MAX)) (PreH21 : (x14 <= UINT_MAX)) (PreH22 : (x15 <= UINT_MAX)) (PreH23 : (x0 >= 0)) (PreH24 : (x1 >= 0)) (PreH25 : (x2 >= 0)) (PreH26 : (x3 >= 0)) (PreH27 : (x4 >= 0)) (PreH28 : (x5 >= 0)) (PreH29 : (x6 >= 0)) (PreH30 : (x7 >= 0)) (PreH31 : (x8 >= 0)) (PreH32 : (x9 >= 0)) (PreH33 : (x10 >= 0)) (PreH34 : (x11 >= 0)) (PreH35 : (x12 >= 0)) (PreH36 : (x13 >= 0)) (PreH37 : (x14 >= 0)) (PreH38 : (x15 >= 0)) (PreH39 : (pw_rvv_lanes F a retval (pw_vec16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)) )) (PreH40 : (pw_legal_vl k retval )) (PreH41 : (k > 0)) (PreH42 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) (PreH43 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH44 : (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) ))))) (PreH45 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH46 : (0 <= k)) (PreH47 : (k <= kc_pre)) ,
  (UndefStructPredvuint32m4_t ( &( "vb" ) ) )
  **  ((&(( &( "va" ) )->ₛ "s15")) # UInt  |-> x15)
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
  **  ((( &( "b" ) )) # Ptr  |-> b)
  **  ((( &( "p" ) )) # Ptr  |-> p)
  **  (pw_output W (pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O)) )
|--
  “ (pw_window F b retval ) ”
.

Definition pw_rvv_pair_partial_solve_wit_4_aux := 
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (p: Z) (b: Z) (k: Z) (a: Z) (retval: Z) (x0: Z) (x1: Z) (x2: Z) (x3: Z) (x4: Z) (x5: Z) (x6: Z) (x7: Z) (x8: Z) (x9: Z) (x10: Z) (x11: Z) (x12: Z) (x13: Z) (x14: Z) (x15: Z) (PreH1 : (pw_rvv_lanes F a retval (pw_vec16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)) )) (PreH2 : (pw_legal_vl k retval )) (PreH3 : (k > 0)) (PreH4 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) (PreH5 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH6 : (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) ))))) (PreH7 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH8 : (0 <= k)) (PreH9 : (k <= kc_pre)) ,
  (UndefStructPredvuint32m4_t ( &( "vb" ) ) )
  **  ((&(( &( "va" ) )->ₛ "s15")) # UInt  |-> x15)
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
  **  (pw_output W (pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O)) )
|--
  “ (pw_window F b retval ) ” 
  &&  “ (retval <= 16) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (pw_rvv_lanes F a retval (pw_vec16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)) ) ” 
  &&  “ (pw_legal_vl k retval ) ” 
  &&  “ (k > 0) ” 
  &&  “ (pw_pair_pre F W a_pre b_pre p_pre kc_pre ) ” 
  &&  “ (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) )))) ” 
  &&  “ (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) )))) ” 
  &&  “ (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) )))) ” 
  &&  “ (0 <= k) ” 
  &&  “ (k <= kc_pre) ”
  &&  (pw_data F )
  **  (UndefStructPredvuint32m4_t ( &( "vb" ) ) )
  **  ((&(( &( "va" ) )->ₛ "s15")) # UInt  |-> x15)
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
  **  (pw_output W (pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O)) )
.

Definition pw_rvv_pair_partial_solve_wit_4 := pw_rvv_pair_partial_solve_wit_4_pure -> pw_rvv_pair_partial_solve_wit_4_aux.

Definition pw_rvv_pair_partial_solve_wit_5 := 
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (p: Z) (b: Z) (k: Z) (a: Z) (retval: Z) (x0: Z) (x1: Z) (x2: Z) (x3: Z) (x4: Z) (x5: Z) (x6: Z) (x7: Z) (x8: Z) (x9: Z) (x10: Z) (x11: Z) (x12: Z) (x13: Z) (x14: Z) (x15: Z) (x0_2: Z) (x1_2: Z) (x2_2: Z) (x3_2: Z) (x4_2: Z) (x5_2: Z) (x6_2: Z) (x7_2: Z) (x8_2: Z) (x9_2: Z) (x10_2: Z) (x11_2: Z) (x12_2: Z) (x13_2: Z) (x14_2: Z) (x15_2: Z) (retval_2: Z) (PreH1 : (pw_rvv_lanes F b retval (pw_vec16 (x0_2) (x1_2) (x2_2) (x3_2) (x4_2) (x5_2) (x6_2) (x7_2) (x8_2) (x9_2) (x10_2) (x11_2) (x12_2) (x13_2) (x14_2) (x15_2)) )) (PreH2 : (pw_rvv_lanes F a retval (pw_vec16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)) )) (PreH3 : (pw_legal_vl k retval )) (PreH4 : (k > 0)) (PreH5 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) (PreH6 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH7 : (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) ))))) (PreH8 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH9 : (0 <= k)) (PreH10 : (k <= kc_pre)) ,
  (pw_data F )
  **  ((&((retval_2)  # "vuint32m4_t" ->ₛ "s0")) # UInt  |-> x0_2)
  **  ((&((retval_2)  # "vuint32m4_t" ->ₛ "s1")) # UInt  |-> x1_2)
  **  ((&((retval_2)  # "vuint32m4_t" ->ₛ "s2")) # UInt  |-> x2_2)
  **  ((&((retval_2)  # "vuint32m4_t" ->ₛ "s3")) # UInt  |-> x3_2)
  **  ((&((retval_2)  # "vuint32m4_t" ->ₛ "s4")) # UInt  |-> x4_2)
  **  ((&((retval_2)  # "vuint32m4_t" ->ₛ "s5")) # UInt  |-> x5_2)
  **  ((&((retval_2)  # "vuint32m4_t" ->ₛ "s6")) # UInt  |-> x6_2)
  **  ((&((retval_2)  # "vuint32m4_t" ->ₛ "s7")) # UInt  |-> x7_2)
  **  ((&((retval_2)  # "vuint32m4_t" ->ₛ "s8")) # UInt  |-> x8_2)
  **  ((&((retval_2)  # "vuint32m4_t" ->ₛ "s9")) # UInt  |-> x9_2)
  **  ((&((retval_2)  # "vuint32m4_t" ->ₛ "s10")) # UInt  |-> x10_2)
  **  ((&((retval_2)  # "vuint32m4_t" ->ₛ "s11")) # UInt  |-> x11_2)
  **  ((&((retval_2)  # "vuint32m4_t" ->ₛ "s12")) # UInt  |-> x12_2)
  **  ((&((retval_2)  # "vuint32m4_t" ->ₛ "s13")) # UInt  |-> x13_2)
  **  ((&((retval_2)  # "vuint32m4_t" ->ₛ "s14")) # UInt  |-> x14_2)
  **  ((&((retval_2)  # "vuint32m4_t" ->ₛ "s15")) # UInt  |-> x15_2)
  **  (UndefStructPredvuint32m4_t ( &( "vb" ) ) )
  **  ((&(( &( "va" ) )->ₛ "s15")) # UInt  |-> x15)
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
  **  (pw_output W (pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O)) )
|--
  “ (pw_rvv_lanes F b retval (pw_vec16 (x0_2) (x1_2) (x2_2) (x3_2) (x4_2) (x5_2) (x6_2) (x7_2) (x8_2) (x9_2) (x10_2) (x11_2) (x12_2) (x13_2) (x14_2) (x15_2)) ) ” 
  &&  “ (pw_rvv_lanes F a retval (pw_vec16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)) ) ” 
  &&  “ (pw_legal_vl k retval ) ” 
  &&  “ (k > 0) ” 
  &&  “ (pw_pair_pre F W a_pre b_pre p_pre kc_pre ) ” 
  &&  “ (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) )))) ” 
  &&  “ (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) )))) ” 
  &&  “ (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) )))) ” 
  &&  “ (0 <= k) ” 
  &&  “ (k <= kc_pre) ”
  &&  ((&(( &( "vb" ) )->ₛ "s15")) # UInt  |->_)
  **  ((&((retval_2)  # "vuint32m4_t" ->ₛ "s15")) # UInt  |-> x15_2)
  **  ((&(( &( "vb" ) )->ₛ "s14")) # UInt  |->_)
  **  ((&((retval_2)  # "vuint32m4_t" ->ₛ "s14")) # UInt  |-> x14_2)
  **  ((&(( &( "vb" ) )->ₛ "s13")) # UInt  |->_)
  **  ((&((retval_2)  # "vuint32m4_t" ->ₛ "s13")) # UInt  |-> x13_2)
  **  ((&(( &( "vb" ) )->ₛ "s12")) # UInt  |->_)
  **  ((&((retval_2)  # "vuint32m4_t" ->ₛ "s12")) # UInt  |-> x12_2)
  **  ((&(( &( "vb" ) )->ₛ "s11")) # UInt  |->_)
  **  ((&((retval_2)  # "vuint32m4_t" ->ₛ "s11")) # UInt  |-> x11_2)
  **  ((&(( &( "vb" ) )->ₛ "s10")) # UInt  |->_)
  **  ((&((retval_2)  # "vuint32m4_t" ->ₛ "s10")) # UInt  |-> x10_2)
  **  ((&(( &( "vb" ) )->ₛ "s9")) # UInt  |->_)
  **  ((&((retval_2)  # "vuint32m4_t" ->ₛ "s9")) # UInt  |-> x9_2)
  **  ((&(( &( "vb" ) )->ₛ "s8")) # UInt  |->_)
  **  ((&((retval_2)  # "vuint32m4_t" ->ₛ "s8")) # UInt  |-> x8_2)
  **  ((&(( &( "vb" ) )->ₛ "s7")) # UInt  |->_)
  **  ((&((retval_2)  # "vuint32m4_t" ->ₛ "s7")) # UInt  |-> x7_2)
  **  ((&(( &( "vb" ) )->ₛ "s6")) # UInt  |->_)
  **  ((&((retval_2)  # "vuint32m4_t" ->ₛ "s6")) # UInt  |-> x6_2)
  **  ((&(( &( "vb" ) )->ₛ "s5")) # UInt  |->_)
  **  ((&((retval_2)  # "vuint32m4_t" ->ₛ "s5")) # UInt  |-> x5_2)
  **  ((&(( &( "vb" ) )->ₛ "s4")) # UInt  |->_)
  **  ((&((retval_2)  # "vuint32m4_t" ->ₛ "s4")) # UInt  |-> x4_2)
  **  ((&(( &( "vb" ) )->ₛ "s3")) # UInt  |->_)
  **  ((&((retval_2)  # "vuint32m4_t" ->ₛ "s3")) # UInt  |-> x3_2)
  **  ((&(( &( "vb" ) )->ₛ "s2")) # UInt  |->_)
  **  ((&((retval_2)  # "vuint32m4_t" ->ₛ "s2")) # UInt  |-> x2_2)
  **  ((&(( &( "vb" ) )->ₛ "s1")) # UInt  |->_)
  **  ((&((retval_2)  # "vuint32m4_t" ->ₛ "s1")) # UInt  |-> x1_2)
  **  ((&(( &( "vb" ) )->ₛ "s0")) # UInt  |->_)
  **  ((&((retval_2)  # "vuint32m4_t" ->ₛ "s0")) # UInt  |-> x0_2)
  **  (pw_data F )
  **  ((&(( &( "va" ) )->ₛ "s15")) # UInt  |-> x15)
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
  **  (pw_output W (pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O)) )
.

Definition pw_rvv_pair_partial_solve_wit_6_pure := 
(
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (p: Z) (b: Z) (k: Z) (a: Z) (retval: Z) (x0: Z) (x1: Z) (x2: Z) (x3: Z) (x4: Z) (x5: Z) (x6: Z) (x7: Z) (x8: Z) (x9: Z) (x10: Z) (x11: Z) (x12: Z) (x13: Z) (x14: Z) (x15: Z) (x0_2: Z) (x1_2: Z) (x2_2: Z) (x3_2: Z) (x4_2: Z) (x5_2: Z) (x6_2: Z) (x7_2: Z) (x8_2: Z) (x9_2: Z) (x10_2: Z) (x11_2: Z) (x12_2: Z) (x13_2: Z) (x14_2: Z) (x15_2: Z) (PreH1 : (pw_rvv_lanes F b retval (pw_vec16 (x0_2) (x1_2) (x2_2) (x3_2) (x4_2) (x5_2) (x6_2) (x7_2) (x8_2) (x9_2) (x10_2) (x11_2) (x12_2) (x13_2) (x14_2) (x15_2)) )) (PreH2 : (pw_rvv_lanes F a retval (pw_vec16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)) )) (PreH3 : (pw_legal_vl k retval )) (PreH4 : (k > 0)) (PreH5 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) (PreH6 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH7 : (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) ))))) (PreH8 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH9 : (0 <= k)) (PreH10 : (k <= kc_pre)) ,
  ((&(( &( "vb" ) )->ₛ "s15")) # UInt  |-> x15_2)
  **  ((&(( &( "vb" ) )->ₛ "s14")) # UInt  |-> x14_2)
  **  ((&(( &( "vb" ) )->ₛ "s13")) # UInt  |-> x13_2)
  **  ((&(( &( "vb" ) )->ₛ "s12")) # UInt  |-> x12_2)
  **  ((&(( &( "vb" ) )->ₛ "s11")) # UInt  |-> x11_2)
  **  ((&(( &( "vb" ) )->ₛ "s10")) # UInt  |-> x10_2)
  **  ((&(( &( "vb" ) )->ₛ "s9")) # UInt  |-> x9_2)
  **  ((&(( &( "vb" ) )->ₛ "s8")) # UInt  |-> x8_2)
  **  ((&(( &( "vb" ) )->ₛ "s7")) # UInt  |-> x7_2)
  **  ((&(( &( "vb" ) )->ₛ "s6")) # UInt  |-> x6_2)
  **  ((&(( &( "vb" ) )->ₛ "s5")) # UInt  |-> x5_2)
  **  ((&(( &( "vb" ) )->ₛ "s4")) # UInt  |-> x4_2)
  **  ((&(( &( "vb" ) )->ₛ "s3")) # UInt  |-> x3_2)
  **  ((&(( &( "vb" ) )->ₛ "s2")) # UInt  |-> x2_2)
  **  ((&(( &( "vb" ) )->ₛ "s1")) # UInt  |-> x1_2)
  **  ((&(( &( "vb" ) )->ₛ "s0")) # UInt  |-> x0_2)
  **  (pw_data F )
  **  ((&(( &( "va" ) )->ₛ "s15")) # UInt  |-> x15)
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
  **  ((( &( "vl" ) )) # UInt64  |-> retval)
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a)
  **  ((( &( "k" ) )) # UInt64  |-> k)
  **  ((( &( "b" ) )) # Ptr  |-> b)
  **  ((( &( "p" ) )) # Ptr  |-> p)
  **  (pw_output W (pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O)) )
|--
  “ (pw_segment_window W p retval ) ”
) \/
(
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (p: Z) (b: Z) (k: Z) (a: Z) (retval: Z) (x0: Z) (x1: Z) (x2: Z) (x3: Z) (x4: Z) (x5: Z) (x6: Z) (x7: Z) (x8: Z) (x9: Z) (x10: Z) (x11: Z) (x12: Z) (x13: Z) (x14: Z) (x15: Z) (x0_2: Z) (x1_2: Z) (x2_2: Z) (x3_2: Z) (x4_2: Z) (x5_2: Z) (x6_2: Z) (x7_2: Z) (x8_2: Z) (x9_2: Z) (x10_2: Z) (x11_2: Z) (x12_2: Z) (x13_2: Z) (x14_2: Z) (x15_2: Z) (PreH1 : (k <= UINT64_MAX)) (PreH2 : (kc_pre <= UINT64_MAX)) (PreH3 : (retval <= UINT64_MAX)) (PreH4 : (k >= 0)) (PreH5 : (kc_pre >= 0)) (PreH6 : (retval >= 0)) (PreH7 : (x0 <= UINT_MAX)) (PreH8 : (x1 <= UINT_MAX)) (PreH9 : (x2 <= UINT_MAX)) (PreH10 : (x3 <= UINT_MAX)) (PreH11 : (x4 <= UINT_MAX)) (PreH12 : (x5 <= UINT_MAX)) (PreH13 : (x6 <= UINT_MAX)) (PreH14 : (x7 <= UINT_MAX)) (PreH15 : (x8 <= UINT_MAX)) (PreH16 : (x9 <= UINT_MAX)) (PreH17 : (x10 <= UINT_MAX)) (PreH18 : (x11 <= UINT_MAX)) (PreH19 : (x12 <= UINT_MAX)) (PreH20 : (x13 <= UINT_MAX)) (PreH21 : (x14 <= UINT_MAX)) (PreH22 : (x15 <= UINT_MAX)) (PreH23 : (x0_2 <= UINT_MAX)) (PreH24 : (x1_2 <= UINT_MAX)) (PreH25 : (x2_2 <= UINT_MAX)) (PreH26 : (x3_2 <= UINT_MAX)) (PreH27 : (x4_2 <= UINT_MAX)) (PreH28 : (x5_2 <= UINT_MAX)) (PreH29 : (x6_2 <= UINT_MAX)) (PreH30 : (x7_2 <= UINT_MAX)) (PreH31 : (x8_2 <= UINT_MAX)) (PreH32 : (x9_2 <= UINT_MAX)) (PreH33 : (x10_2 <= UINT_MAX)) (PreH34 : (x11_2 <= UINT_MAX)) (PreH35 : (x12_2 <= UINT_MAX)) (PreH36 : (x13_2 <= UINT_MAX)) (PreH37 : (x14_2 <= UINT_MAX)) (PreH38 : (x15_2 <= UINT_MAX)) (PreH39 : (x0 >= 0)) (PreH40 : (x1 >= 0)) (PreH41 : (x2 >= 0)) (PreH42 : (x3 >= 0)) (PreH43 : (x4 >= 0)) (PreH44 : (x5 >= 0)) (PreH45 : (x6 >= 0)) (PreH46 : (x7 >= 0)) (PreH47 : (x8 >= 0)) (PreH48 : (x9 >= 0)) (PreH49 : (x10 >= 0)) (PreH50 : (x11 >= 0)) (PreH51 : (x12 >= 0)) (PreH52 : (x13 >= 0)) (PreH53 : (x14 >= 0)) (PreH54 : (x15 >= 0)) (PreH55 : (x0_2 >= 0)) (PreH56 : (x1_2 >= 0)) (PreH57 : (x2_2 >= 0)) (PreH58 : (x3_2 >= 0)) (PreH59 : (x4_2 >= 0)) (PreH60 : (x5_2 >= 0)) (PreH61 : (x6_2 >= 0)) (PreH62 : (x7_2 >= 0)) (PreH63 : (x8_2 >= 0)) (PreH64 : (x9_2 >= 0)) (PreH65 : (x10_2 >= 0)) (PreH66 : (x11_2 >= 0)) (PreH67 : (x12_2 >= 0)) (PreH68 : (x13_2 >= 0)) (PreH69 : (x14_2 >= 0)) (PreH70 : (x15_2 >= 0)) (PreH71 : (pw_rvv_lanes F b retval (pw_vec16 (x0_2) (x1_2) (x2_2) (x3_2) (x4_2) (x5_2) (x6_2) (x7_2) (x8_2) (x9_2) (x10_2) (x11_2) (x12_2) (x13_2) (x14_2) (x15_2)) )) (PreH72 : (pw_rvv_lanes F a retval (pw_vec16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)) )) (PreH73 : (pw_legal_vl k retval )) (PreH74 : (k > 0)) (PreH75 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) (PreH76 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH77 : (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) ))))) (PreH78 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH79 : (0 <= k)) (PreH80 : (k <= kc_pre)) ,
  ((&(( &( "vb" ) )->ₛ "s15")) # UInt  |-> x15_2)
  **  ((&(( &( "vb" ) )->ₛ "s14")) # UInt  |-> x14_2)
  **  ((&(( &( "vb" ) )->ₛ "s13")) # UInt  |-> x13_2)
  **  ((&(( &( "vb" ) )->ₛ "s12")) # UInt  |-> x12_2)
  **  ((&(( &( "vb" ) )->ₛ "s11")) # UInt  |-> x11_2)
  **  ((&(( &( "vb" ) )->ₛ "s10")) # UInt  |-> x10_2)
  **  ((&(( &( "vb" ) )->ₛ "s9")) # UInt  |-> x9_2)
  **  ((&(( &( "vb" ) )->ₛ "s8")) # UInt  |-> x8_2)
  **  ((&(( &( "vb" ) )->ₛ "s7")) # UInt  |-> x7_2)
  **  ((&(( &( "vb" ) )->ₛ "s6")) # UInt  |-> x6_2)
  **  ((&(( &( "vb" ) )->ₛ "s5")) # UInt  |-> x5_2)
  **  ((&(( &( "vb" ) )->ₛ "s4")) # UInt  |-> x4_2)
  **  ((&(( &( "vb" ) )->ₛ "s3")) # UInt  |-> x3_2)
  **  ((&(( &( "vb" ) )->ₛ "s2")) # UInt  |-> x2_2)
  **  ((&(( &( "vb" ) )->ₛ "s1")) # UInt  |-> x1_2)
  **  ((&(( &( "vb" ) )->ₛ "s0")) # UInt  |-> x0_2)
  **  (pw_data F )
  **  ((&(( &( "va" ) )->ₛ "s15")) # UInt  |-> x15)
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
  **  ((( &( "vl" ) )) # UInt64  |-> retval)
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a)
  **  ((( &( "k" ) )) # UInt64  |-> k)
  **  ((( &( "b" ) )) # Ptr  |-> b)
  **  ((( &( "p" ) )) # Ptr  |-> p)
  **  (pw_output W (pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O)) )
|--
  “ (pw_segment_window W p retval ) ”
).

Definition pw_rvv_pair_partial_solve_wit_6_pure_split_goal_1 := 
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (p: Z) (b: Z) (k: Z) (a: Z) (retval: Z) (x0: Z) (x1: Z) (x2: Z) (x3: Z) (x4: Z) (x5: Z) (x6: Z) (x7: Z) (x8: Z) (x9: Z) (x10: Z) (x11: Z) (x12: Z) (x13: Z) (x14: Z) (x15: Z) (x0_2: Z) (x1_2: Z) (x2_2: Z) (x3_2: Z) (x4_2: Z) (x5_2: Z) (x6_2: Z) (x7_2: Z) (x8_2: Z) (x9_2: Z) (x10_2: Z) (x11_2: Z) (x12_2: Z) (x13_2: Z) (x14_2: Z) (x15_2: Z) (PreH1 : (k <= UINT64_MAX)) (PreH2 : (kc_pre <= UINT64_MAX)) (PreH3 : (retval <= UINT64_MAX)) (PreH4 : (k >= 0)) (PreH5 : (kc_pre >= 0)) (PreH6 : (retval >= 0)) (PreH7 : (x0 <= UINT_MAX)) (PreH8 : (x1 <= UINT_MAX)) (PreH9 : (x2 <= UINT_MAX)) (PreH10 : (x3 <= UINT_MAX)) (PreH11 : (x4 <= UINT_MAX)) (PreH12 : (x5 <= UINT_MAX)) (PreH13 : (x6 <= UINT_MAX)) (PreH14 : (x7 <= UINT_MAX)) (PreH15 : (x8 <= UINT_MAX)) (PreH16 : (x9 <= UINT_MAX)) (PreH17 : (x10 <= UINT_MAX)) (PreH18 : (x11 <= UINT_MAX)) (PreH19 : (x12 <= UINT_MAX)) (PreH20 : (x13 <= UINT_MAX)) (PreH21 : (x14 <= UINT_MAX)) (PreH22 : (x15 <= UINT_MAX)) (PreH23 : (x0_2 <= UINT_MAX)) (PreH24 : (x1_2 <= UINT_MAX)) (PreH25 : (x2_2 <= UINT_MAX)) (PreH26 : (x3_2 <= UINT_MAX)) (PreH27 : (x4_2 <= UINT_MAX)) (PreH28 : (x5_2 <= UINT_MAX)) (PreH29 : (x6_2 <= UINT_MAX)) (PreH30 : (x7_2 <= UINT_MAX)) (PreH31 : (x8_2 <= UINT_MAX)) (PreH32 : (x9_2 <= UINT_MAX)) (PreH33 : (x10_2 <= UINT_MAX)) (PreH34 : (x11_2 <= UINT_MAX)) (PreH35 : (x12_2 <= UINT_MAX)) (PreH36 : (x13_2 <= UINT_MAX)) (PreH37 : (x14_2 <= UINT_MAX)) (PreH38 : (x15_2 <= UINT_MAX)) (PreH39 : (x0 >= 0)) (PreH40 : (x1 >= 0)) (PreH41 : (x2 >= 0)) (PreH42 : (x3 >= 0)) (PreH43 : (x4 >= 0)) (PreH44 : (x5 >= 0)) (PreH45 : (x6 >= 0)) (PreH46 : (x7 >= 0)) (PreH47 : (x8 >= 0)) (PreH48 : (x9 >= 0)) (PreH49 : (x10 >= 0)) (PreH50 : (x11 >= 0)) (PreH51 : (x12 >= 0)) (PreH52 : (x13 >= 0)) (PreH53 : (x14 >= 0)) (PreH54 : (x15 >= 0)) (PreH55 : (x0_2 >= 0)) (PreH56 : (x1_2 >= 0)) (PreH57 : (x2_2 >= 0)) (PreH58 : (x3_2 >= 0)) (PreH59 : (x4_2 >= 0)) (PreH60 : (x5_2 >= 0)) (PreH61 : (x6_2 >= 0)) (PreH62 : (x7_2 >= 0)) (PreH63 : (x8_2 >= 0)) (PreH64 : (x9_2 >= 0)) (PreH65 : (x10_2 >= 0)) (PreH66 : (x11_2 >= 0)) (PreH67 : (x12_2 >= 0)) (PreH68 : (x13_2 >= 0)) (PreH69 : (x14_2 >= 0)) (PreH70 : (x15_2 >= 0)) (PreH71 : (pw_rvv_lanes F b retval (pw_vec16 (x0_2) (x1_2) (x2_2) (x3_2) (x4_2) (x5_2) (x6_2) (x7_2) (x8_2) (x9_2) (x10_2) (x11_2) (x12_2) (x13_2) (x14_2) (x15_2)) )) (PreH72 : (pw_rvv_lanes F a retval (pw_vec16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)) )) (PreH73 : (pw_legal_vl k retval )) (PreH74 : (k > 0)) (PreH75 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) (PreH76 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH77 : (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) ))))) (PreH78 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH79 : (0 <= k)) (PreH80 : (k <= kc_pre)) ,
  ((&(( &( "vb" ) )->ₛ "s15")) # UInt  |-> x15_2)
  **  ((&(( &( "vb" ) )->ₛ "s14")) # UInt  |-> x14_2)
  **  ((&(( &( "vb" ) )->ₛ "s13")) # UInt  |-> x13_2)
  **  ((&(( &( "vb" ) )->ₛ "s12")) # UInt  |-> x12_2)
  **  ((&(( &( "vb" ) )->ₛ "s11")) # UInt  |-> x11_2)
  **  ((&(( &( "vb" ) )->ₛ "s10")) # UInt  |-> x10_2)
  **  ((&(( &( "vb" ) )->ₛ "s9")) # UInt  |-> x9_2)
  **  ((&(( &( "vb" ) )->ₛ "s8")) # UInt  |-> x8_2)
  **  ((&(( &( "vb" ) )->ₛ "s7")) # UInt  |-> x7_2)
  **  ((&(( &( "vb" ) )->ₛ "s6")) # UInt  |-> x6_2)
  **  ((&(( &( "vb" ) )->ₛ "s5")) # UInt  |-> x5_2)
  **  ((&(( &( "vb" ) )->ₛ "s4")) # UInt  |-> x4_2)
  **  ((&(( &( "vb" ) )->ₛ "s3")) # UInt  |-> x3_2)
  **  ((&(( &( "vb" ) )->ₛ "s2")) # UInt  |-> x2_2)
  **  ((&(( &( "vb" ) )->ₛ "s1")) # UInt  |-> x1_2)
  **  ((&(( &( "vb" ) )->ₛ "s0")) # UInt  |-> x0_2)
  **  (pw_data F )
  **  ((&(( &( "va" ) )->ₛ "s15")) # UInt  |-> x15)
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
  **  ((( &( "vl" ) )) # UInt64  |-> retval)
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a)
  **  ((( &( "k" ) )) # UInt64  |-> k)
  **  ((( &( "b" ) )) # Ptr  |-> b)
  **  ((( &( "p" ) )) # Ptr  |-> p)
  **  (pw_output W (pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O)) )
|--
  “ (pw_segment_window W p retval ) ”
.

Definition pw_rvv_pair_partial_solve_wit_6_aux := 
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (p: Z) (b: Z) (k: Z) (a: Z) (retval: Z) (x0: Z) (x1: Z) (x2: Z) (x3: Z) (x4: Z) (x5: Z) (x6: Z) (x7: Z) (x8: Z) (x9: Z) (x10: Z) (x11: Z) (x12: Z) (x13: Z) (x14: Z) (x15: Z) (x0_2: Z) (x1_2: Z) (x2_2: Z) (x3_2: Z) (x4_2: Z) (x5_2: Z) (x6_2: Z) (x7_2: Z) (x8_2: Z) (x9_2: Z) (x10_2: Z) (x11_2: Z) (x12_2: Z) (x13_2: Z) (x14_2: Z) (x15_2: Z) (PreH1 : (pw_rvv_lanes F b retval (pw_vec16 (x0_2) (x1_2) (x2_2) (x3_2) (x4_2) (x5_2) (x6_2) (x7_2) (x8_2) (x9_2) (x10_2) (x11_2) (x12_2) (x13_2) (x14_2) (x15_2)) )) (PreH2 : (pw_rvv_lanes F a retval (pw_vec16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)) )) (PreH3 : (pw_legal_vl k retval )) (PreH4 : (k > 0)) (PreH5 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) (PreH6 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH7 : (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) ))))) (PreH8 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH9 : (0 <= k)) (PreH10 : (k <= kc_pre)) ,
  ((&(( &( "vb" ) )->ₛ "s15")) # UInt  |-> x15_2)
  **  ((&(( &( "vb" ) )->ₛ "s14")) # UInt  |-> x14_2)
  **  ((&(( &( "vb" ) )->ₛ "s13")) # UInt  |-> x13_2)
  **  ((&(( &( "vb" ) )->ₛ "s12")) # UInt  |-> x12_2)
  **  ((&(( &( "vb" ) )->ₛ "s11")) # UInt  |-> x11_2)
  **  ((&(( &( "vb" ) )->ₛ "s10")) # UInt  |-> x10_2)
  **  ((&(( &( "vb" ) )->ₛ "s9")) # UInt  |-> x9_2)
  **  ((&(( &( "vb" ) )->ₛ "s8")) # UInt  |-> x8_2)
  **  ((&(( &( "vb" ) )->ₛ "s7")) # UInt  |-> x7_2)
  **  ((&(( &( "vb" ) )->ₛ "s6")) # UInt  |-> x6_2)
  **  ((&(( &( "vb" ) )->ₛ "s5")) # UInt  |-> x5_2)
  **  ((&(( &( "vb" ) )->ₛ "s4")) # UInt  |-> x4_2)
  **  ((&(( &( "vb" ) )->ₛ "s3")) # UInt  |-> x3_2)
  **  ((&(( &( "vb" ) )->ₛ "s2")) # UInt  |-> x2_2)
  **  ((&(( &( "vb" ) )->ₛ "s1")) # UInt  |-> x1_2)
  **  ((&(( &( "vb" ) )->ₛ "s0")) # UInt  |-> x0_2)
  **  (pw_data F )
  **  ((&(( &( "va" ) )->ₛ "s15")) # UInt  |-> x15)
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
  **  (pw_output W (pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O)) )
|--
  “ (pw_segment_window W p retval ) ” 
  &&  “ (pw_rvv_lanes F b retval (pw_vec16 (x0_2) (x1_2) (x2_2) (x3_2) (x4_2) (x5_2) (x6_2) (x7_2) (x8_2) (x9_2) (x10_2) (x11_2) (x12_2) (x13_2) (x14_2) (x15_2)) ) ” 
  &&  “ (pw_rvv_lanes F a retval (pw_vec16 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15)) ) ” 
  &&  “ (pw_legal_vl k retval ) ” 
  &&  “ (k > 0) ” 
  &&  “ (pw_pair_pre F W a_pre b_pre p_pre kc_pre ) ” 
  &&  “ (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) )))) ” 
  &&  “ (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) )))) ” 
  &&  “ (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) )))) ” 
  &&  “ (0 <= k) ” 
  &&  “ (k <= kc_pre) ”
  &&  (pw_output W (pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O)) )
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
  **  ((&(( &( "vb" ) )->ₛ "s0")) # UInt  |-> x0_2)
  **  ((&(( &( "vb" ) )->ₛ "s1")) # UInt  |-> x1_2)
  **  ((&(( &( "vb" ) )->ₛ "s2")) # UInt  |-> x2_2)
  **  ((&(( &( "vb" ) )->ₛ "s3")) # UInt  |-> x3_2)
  **  ((&(( &( "vb" ) )->ₛ "s4")) # UInt  |-> x4_2)
  **  ((&(( &( "vb" ) )->ₛ "s5")) # UInt  |-> x5_2)
  **  ((&(( &( "vb" ) )->ₛ "s6")) # UInt  |-> x6_2)
  **  ((&(( &( "vb" ) )->ₛ "s7")) # UInt  |-> x7_2)
  **  ((&(( &( "vb" ) )->ₛ "s8")) # UInt  |-> x8_2)
  **  ((&(( &( "vb" ) )->ₛ "s9")) # UInt  |-> x9_2)
  **  ((&(( &( "vb" ) )->ₛ "s10")) # UInt  |-> x10_2)
  **  ((&(( &( "vb" ) )->ₛ "s11")) # UInt  |-> x11_2)
  **  ((&(( &( "vb" ) )->ₛ "s12")) # UInt  |-> x12_2)
  **  ((&(( &( "vb" ) )->ₛ "s13")) # UInt  |-> x13_2)
  **  ((&(( &( "vb" ) )->ₛ "s14")) # UInt  |-> x14_2)
  **  ((&(( &( "vb" ) )->ₛ "s15")) # UInt  |-> x15_2)
  **  (pw_data F )
.

Definition pw_rvv_pair_partial_solve_wit_6 := pw_rvv_pair_partial_solve_wit_6_pure -> pw_rvv_pair_partial_solve_wit_6_aux.

Module Type VC_Correct.


Axiom proof_of_pw_rvv_pair_safety_wit_1 : pw_rvv_pair_safety_wit_1.
Axiom proof_of_pw_rvv_pair_safety_wit_2 : pw_rvv_pair_safety_wit_2.
Axiom proof_of_pw_rvv_pair_entail_wit_1 : pw_rvv_pair_entail_wit_1.
Axiom proof_of_pw_rvv_pair_entail_wit_2 : pw_rvv_pair_entail_wit_2.
Axiom proof_of_pw_rvv_pair_return_wit_1 : pw_rvv_pair_return_wit_1.
Axiom proof_of_pw_rvv_pair_partial_solve_wit_1 : pw_rvv_pair_partial_solve_wit_1.
Axiom proof_of_pw_rvv_pair_partial_solve_wit_2_pure : pw_rvv_pair_partial_solve_wit_2_pure.
Axiom proof_of_pw_rvv_pair_partial_solve_wit_2 : pw_rvv_pair_partial_solve_wit_2.
Axiom proof_of_pw_rvv_pair_partial_solve_wit_3 : pw_rvv_pair_partial_solve_wit_3.
Axiom proof_of_pw_rvv_pair_partial_solve_wit_4_pure : pw_rvv_pair_partial_solve_wit_4_pure.
Axiom proof_of_pw_rvv_pair_partial_solve_wit_4 : pw_rvv_pair_partial_solve_wit_4.
Axiom proof_of_pw_rvv_pair_partial_solve_wit_5 : pw_rvv_pair_partial_solve_wit_5.
Axiom proof_of_pw_rvv_pair_partial_solve_wit_6_pure : pw_rvv_pair_partial_solve_wit_6_pure.
Axiom proof_of_pw_rvv_pair_partial_solve_wit_6 : pw_rvv_pair_partial_solve_wit_6.

End VC_Correct.
