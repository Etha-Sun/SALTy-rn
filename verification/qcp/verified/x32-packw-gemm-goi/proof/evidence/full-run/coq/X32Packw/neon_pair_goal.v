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
Require Import X32Packw.AccessModel.
Local Open Scope sac.

(*----- Function pw_neon_pair -----*)

Definition pw_neon_pair_safety_wit_1 := 
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (PreH1 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) ,
  (UndefStructPreduint32x2_t ( &( "v0" ) ) )
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "b" ) )) # Ptr  |-> b_pre)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  (pw_data F )
  **  (pw_output W O )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition pw_neon_pair_safety_wit_2 := 
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (PreH1 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) ,
  (UndefStructPreduint32x2_t ( &( "v1" ) ) )
  **  ((&(( &( "v0" ) )->ₛ "s1")) # UInt  |-> 0)
  **  ((&(( &( "v0" ) )->ₛ "s0")) # UInt  |-> 0)
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "b" ) )) # Ptr  |-> b_pre)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  (pw_data F )
  **  (pw_output W O )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition pw_neon_pair_safety_wit_3 := 
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (x11: Z) (x10: Z) (x01: Z) (x00: Z) (p: Z) (b: Z) (k: Z) (a: Z) (PreH1 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) (PreH2 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH3 : (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) ))))) (PreH4 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH5 : (0 <= k)) (PreH6 : (k <= kc_pre)) ,
  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a)
  **  ((( &( "k" ) )) # UInt64  |-> k)
  **  ((( &( "b" ) )) # Ptr  |-> b)
  **  ((( &( "p" ) )) # Ptr  |-> p)
  **  (pw_data F )
  **  (pw_output W (pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O)) )
  **  ((&(( &( "v0" ) )->ₛ "s0")) # UInt  |-> x00)
  **  ((&(( &( "v0" ) )->ₛ "s1")) # UInt  |-> x01)
  **  ((&(( &( "v1" ) )->ₛ "s0")) # UInt  |-> x10)
  **  ((&(( &( "v1" ) )->ₛ "s1")) # UInt  |-> x11)
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition pw_neon_pair_safety_wit_4 := 
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (x11: Z) (x10: Z) (x01: Z) (p: Z) (b: Z) (k: Z) (a: Z) (PreH1 : (k >= 2)) (PreH2 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) (PreH3 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH4 : (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) ))))) (PreH5 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH6 : (0 <= k)) (PreH7 : (k <= kc_pre)) ,
  ((&(( &( "v0" ) )->ₛ "s1")) # UInt  |-> x01)
  **  ((&(( &( "v0" ) )->ₛ "s0")) # UInt  |-> (pw_load_lane (F) (a) (0)))
  **  (pw_data F )
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a)
  **  ((( &( "k" ) )) # UInt64  |-> k)
  **  ((( &( "b" ) )) # Ptr  |-> b)
  **  ((( &( "p" ) )) # Ptr  |-> p)
  **  (pw_output W (pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O)) )
  **  ((&(( &( "v1" ) )->ₛ "s0")) # UInt  |-> x10)
  **  ((&(( &( "v1" ) )->ₛ "s1")) # UInt  |-> x11)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition pw_neon_pair_safety_wit_5 := 
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (x11: Z) (x01: Z) (p: Z) (b: Z) (k: Z) (a: Z) (PreH1 : (k >= 2)) (PreH2 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) (PreH3 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH4 : (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) ))))) (PreH5 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH6 : (0 <= k)) (PreH7 : (k <= kc_pre)) ,
  ((&(( &( "v1" ) )->ₛ "s1")) # UInt  |-> x11)
  **  ((&(( &( "v1" ) )->ₛ "s0")) # UInt  |-> (pw_load_lane (F) ((a + (1 * sizeof(UINT)))) (0)))
  **  (pw_data F )
  **  ((&(( &( "v0" ) )->ₛ "s1")) # UInt  |-> x01)
  **  ((&(( &( "v0" ) )->ₛ "s0")) # UInt  |-> (pw_load_lane (F) (a) (0)))
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a)
  **  ((( &( "k" ) )) # UInt64  |-> k)
  **  ((( &( "b" ) )) # Ptr  |-> b)
  **  ((( &( "p" ) )) # Ptr  |-> p)
  **  (pw_output W (pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O)) )
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition pw_neon_pair_safety_wit_6 := 
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (x11: Z) (p: Z) (b: Z) (k: Z) (a: Z) (PreH1 : (k >= 2)) (PreH2 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) (PreH3 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH4 : (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) ))))) (PreH5 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH6 : (0 <= k)) (PreH7 : (k <= kc_pre)) ,
  ((&(( &( "v0" ) )->ₛ "s1")) # UInt  |-> (pw_load_lane (F) (b) (0)))
  **  ((&(( &( "v0" ) )->ₛ "s0")) # UInt  |-> (pw_load_lane (F) (a) (0)))
  **  (pw_data F )
  **  ((&(( &( "v1" ) )->ₛ "s1")) # UInt  |-> x11)
  **  ((&(( &( "v1" ) )->ₛ "s0")) # UInt  |-> (pw_load_lane (F) ((a + (1 * sizeof(UINT)))) (0)))
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "a" ) )) # Ptr  |-> (a + (2 * sizeof(UINT))))
  **  ((( &( "k" ) )) # UInt64  |-> k)
  **  ((( &( "b" ) )) # Ptr  |-> b)
  **  ((( &( "p" ) )) # Ptr  |-> p)
  **  (pw_output W (pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O)) )
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition pw_neon_pair_safety_wit_7 := 
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (p: Z) (b: Z) (k: Z) (a: Z) (PreH1 : (k >= 2)) (PreH2 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) (PreH3 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH4 : (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) ))))) (PreH5 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH6 : (0 <= k)) (PreH7 : (k <= kc_pre)) ,
  ((&(( &( "v1" ) )->ₛ "s1")) # UInt  |-> (pw_load_lane (F) ((b + (1 * sizeof(UINT)))) (0)))
  **  ((&(( &( "v1" ) )->ₛ "s0")) # UInt  |-> (pw_load_lane (F) ((a + (1 * sizeof(UINT)))) (0)))
  **  (pw_data F )
  **  ((&(( &( "v0" ) )->ₛ "s1")) # UInt  |-> (pw_load_lane (F) (b) (0)))
  **  ((&(( &( "v0" ) )->ₛ "s0")) # UInt  |-> (pw_load_lane (F) (a) (0)))
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "a" ) )) # Ptr  |-> (a + (2 * sizeof(UINT))))
  **  ((( &( "k" ) )) # UInt64  |-> k)
  **  ((( &( "b" ) )) # Ptr  |-> b)
  **  ((( &( "p" ) )) # Ptr  |-> p)
  **  (pw_output W (pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O)) )
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition pw_neon_pair_safety_wit_8 := 
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (p: Z) (b: Z) (k: Z) (a: Z) (PreH1 : (k >= 2)) (PreH2 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) (PreH3 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH4 : (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) ))))) (PreH5 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH6 : (0 <= k)) (PreH7 : (k <= kc_pre)) ,
  (pw_output W (pw_write_pair ((pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O))) (p) ((pw_load_lane (F) (a) (0))) ((pw_load_lane (F) (b) (0)))) )
  **  ((&(( &( "v0" ) )->ₛ "s0")) # UInt  |-> (pw_load_lane (F) (a) (0)))
  **  ((&(( &( "v0" ) )->ₛ "s1")) # UInt  |-> (pw_load_lane (F) (b) (0)))
  **  ((&(( &( "v1" ) )->ₛ "s1")) # UInt  |-> (pw_load_lane (F) ((b + (1 * sizeof(UINT)))) (0)))
  **  ((&(( &( "v1" ) )->ₛ "s0")) # UInt  |-> (pw_load_lane (F) ((a + (1 * sizeof(UINT)))) (0)))
  **  (pw_data F )
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "a" ) )) # Ptr  |-> (a + (2 * sizeof(UINT))))
  **  ((( &( "k" ) )) # UInt64  |-> k)
  **  ((( &( "b" ) )) # Ptr  |-> (b + (2 * sizeof(UINT))))
  **  ((( &( "p" ) )) # Ptr  |-> p)
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition pw_neon_pair_safety_wit_9 := 
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (p: Z) (b: Z) (k: Z) (a: Z) (PreH1 : (k >= 2)) (PreH2 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) (PreH3 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH4 : (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) ))))) (PreH5 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH6 : (0 <= k)) (PreH7 : (k <= kc_pre)) ,
  (pw_output W (pw_write_pair ((pw_write_pair ((pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O))) ((pw_offset (p_pre) ((8 * (kc_pre - k ) )))) ((pw_load_lane (F) ((pw_offset (a_pre) ((4 * (kc_pre - k ) )))) (0))) ((pw_load_lane (F) ((pw_offset (b_pre) ((4 * (kc_pre - k ) )))) (0))))) ((p + (2 * sizeof(UINT)))) ((pw_load_lane (F) ((a + (1 * sizeof(UINT)))) (0))) ((pw_load_lane (F) ((b + (1 * sizeof(UINT)))) (0)))) )
  **  ((&(( &( "v1" ) )->ₛ "s0")) # UInt  |-> (pw_load_lane (F) ((a + (1 * sizeof(UINT)))) (0)))
  **  ((&(( &( "v1" ) )->ₛ "s1")) # UInt  |-> (pw_load_lane (F) ((b + (1 * sizeof(UINT)))) (0)))
  **  ((&(( &( "v0" ) )->ₛ "s0")) # UInt  |-> (pw_load_lane (F) (a) (0)))
  **  ((&(( &( "v0" ) )->ₛ "s1")) # UInt  |-> (pw_load_lane (F) (b) (0)))
  **  (pw_data F )
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "a" ) )) # Ptr  |-> (a + (2 * sizeof(UINT))))
  **  ((( &( "k" ) )) # UInt64  |-> k)
  **  ((( &( "b" ) )) # Ptr  |-> (b + (2 * sizeof(UINT))))
  **  ((( &( "p" ) )) # Ptr  |-> p)
|--
  “ (4 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 4) ”
.

Definition pw_neon_pair_safety_wit_10 := 
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (p: Z) (b: Z) (k: Z) (a: Z) (PreH1 : (k >= 2)) (PreH2 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) (PreH3 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH4 : (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) ))))) (PreH5 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH6 : (0 <= k)) (PreH7 : (k <= kc_pre)) ,
  (pw_output W (pw_write_pair ((pw_write_pair ((pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O))) ((pw_offset (p_pre) ((8 * (kc_pre - k ) )))) ((pw_load_lane (F) ((pw_offset (a_pre) ((4 * (kc_pre - k ) )))) (0))) ((pw_load_lane (F) ((pw_offset (b_pre) ((4 * (kc_pre - k ) )))) (0))))) ((p + (2 * sizeof(UINT)))) ((pw_load_lane (F) ((a + (1 * sizeof(UINT)))) (0))) ((pw_load_lane (F) ((b + (1 * sizeof(UINT)))) (0)))) )
  **  ((&(( &( "v1" ) )->ₛ "s0")) # UInt  |-> (pw_load_lane (F) ((a + (1 * sizeof(UINT)))) (0)))
  **  ((&(( &( "v1" ) )->ₛ "s1")) # UInt  |-> (pw_load_lane (F) ((b + (1 * sizeof(UINT)))) (0)))
  **  ((&(( &( "v0" ) )->ₛ "s0")) # UInt  |-> (pw_load_lane (F) (a) (0)))
  **  ((&(( &( "v0" ) )->ₛ "s1")) # UInt  |-> (pw_load_lane (F) (b) (0)))
  **  (pw_data F )
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "a" ) )) # Ptr  |-> (a + (2 * sizeof(UINT))))
  **  ((( &( "k" ) )) # UInt64  |-> k)
  **  ((( &( "b" ) )) # Ptr  |-> (b + (2 * sizeof(UINT))))
  **  ((( &( "p" ) )) # Ptr  |-> (p + (4 * sizeof(UINT))))
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition pw_neon_pair_safety_wit_11 := 
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (x11: Z) (x10: Z) (x01: Z) (x00: Z) (p: Z) (b: Z) (k: Z) (a: Z) (PreH1 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) (PreH2 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH3 : (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) ))))) (PreH4 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH5 : (0 <= k)) (PreH6 : (k <= kc_pre)) ,
  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a)
  **  ((( &( "k" ) )) # UInt64  |-> k)
  **  ((( &( "b" ) )) # Ptr  |-> b)
  **  ((( &( "p" ) )) # Ptr  |-> p)
  **  (pw_data F )
  **  (pw_output W (pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O)) )
  **  ((&(( &( "v0" ) )->ₛ "s0")) # UInt  |-> x00)
  **  ((&(( &( "v0" ) )->ₛ "s1")) # UInt  |-> x01)
  **  ((&(( &( "v1" ) )->ₛ "s0")) # UInt  |-> x10)
  **  ((&(( &( "v1" ) )->ₛ "s1")) # UInt  |-> x11)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition pw_neon_pair_safety_wit_12 := 
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (x11: Z) (x10: Z) (x01: Z) (p: Z) (b: Z) (k: Z) (a: Z) (PreH1 : (k <> 0)) (PreH2 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) (PreH3 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH4 : (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) ))))) (PreH5 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH6 : (0 <= k)) (PreH7 : (k <= kc_pre)) ,
  ((&(( &( "v0" ) )->ₛ "s1")) # UInt  |-> x01)
  **  ((&(( &( "v0" ) )->ₛ "s0")) # UInt  |-> (pw_load_lane (F) (a) (0)))
  **  (pw_data F )
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a)
  **  ((( &( "k" ) )) # UInt64  |-> k)
  **  ((( &( "b" ) )) # Ptr  |-> b)
  **  ((( &( "p" ) )) # Ptr  |-> p)
  **  (pw_output W (pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O)) )
  **  ((&(( &( "v1" ) )->ₛ "s0")) # UInt  |-> x10)
  **  ((&(( &( "v1" ) )->ₛ "s1")) # UInt  |-> x11)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition pw_neon_pair_safety_wit_13 := 
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (x11: Z) (x10: Z) (p: Z) (b: Z) (k: Z) (a: Z) (PreH1 : (k <> 0)) (PreH2 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) (PreH3 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH4 : (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) ))))) (PreH5 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH6 : (0 <= k)) (PreH7 : (k <= kc_pre)) ,
  ((&(( &( "v0" ) )->ₛ "s1")) # UInt  |-> (pw_load_lane (F) (b) (0)))
  **  ((&(( &( "v0" ) )->ₛ "s0")) # UInt  |-> (pw_load_lane (F) (a) (0)))
  **  (pw_data F )
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "a" ) )) # Ptr  |-> (a + (1 * sizeof(UINT))))
  **  ((( &( "k" ) )) # UInt64  |-> k)
  **  ((( &( "b" ) )) # Ptr  |-> b)
  **  ((( &( "p" ) )) # Ptr  |-> p)
  **  (pw_output W (pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O)) )
  **  ((&(( &( "v1" ) )->ₛ "s0")) # UInt  |-> x10)
  **  ((&(( &( "v1" ) )->ₛ "s1")) # UInt  |-> x11)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition pw_neon_pair_safety_wit_14 := 
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (x11: Z) (x10: Z) (p: Z) (b: Z) (k: Z) (a: Z) (PreH1 : (k <> 0)) (PreH2 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) (PreH3 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH4 : (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) ))))) (PreH5 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH6 : (0 <= k)) (PreH7 : (k <= kc_pre)) ,
  (pw_output W (pw_write_pair ((pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O))) (p) ((pw_load_lane (F) (a) (0))) ((pw_load_lane (F) (b) (0)))) )
  **  ((&(( &( "v0" ) )->ₛ "s0")) # UInt  |-> (pw_load_lane (F) (a) (0)))
  **  ((&(( &( "v0" ) )->ₛ "s1")) # UInt  |-> (pw_load_lane (F) (b) (0)))
  **  (pw_data F )
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "a" ) )) # Ptr  |-> (a + (1 * sizeof(UINT))))
  **  ((( &( "k" ) )) # UInt64  |-> k)
  **  ((( &( "b" ) )) # Ptr  |-> (b + (1 * sizeof(UINT))))
  **  ((( &( "p" ) )) # Ptr  |-> p)
  **  ((&(( &( "v1" ) )->ₛ "s0")) # UInt  |-> x10)
  **  ((&(( &( "v1" ) )->ₛ "s1")) # UInt  |-> x11)
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition pw_neon_pair_safety_wit_15 := 
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (x11: Z) (x10: Z) (p: Z) (b: Z) (k: Z) (a: Z) (PreH1 : (k <> 0)) (PreH2 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) (PreH3 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH4 : (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) ))))) (PreH5 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH6 : (0 <= k)) (PreH7 : (k <= kc_pre)) ,
  (pw_output W (pw_write_pair ((pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O))) (p) ((pw_load_lane (F) (a) (0))) ((pw_load_lane (F) (b) (0)))) )
  **  ((&(( &( "v0" ) )->ₛ "s0")) # UInt  |-> (pw_load_lane (F) (a) (0)))
  **  ((&(( &( "v0" ) )->ₛ "s1")) # UInt  |-> (pw_load_lane (F) (b) (0)))
  **  (pw_data F )
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "a" ) )) # Ptr  |-> (a + (1 * sizeof(UINT))))
  **  ((( &( "k" ) )) # UInt64  |-> k)
  **  ((( &( "b" ) )) # Ptr  |-> (b + (1 * sizeof(UINT))))
  **  ((( &( "p" ) )) # Ptr  |-> (p + (2 * sizeof(UINT))))
  **  ((&(( &( "v1" ) )->ₛ "s0")) # UInt  |-> x10)
  **  ((&(( &( "v1" ) )->ₛ "s1")) # UInt  |-> x11)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition pw_neon_pair_entail_wit_1 := 
(
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (PreH1 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) ,
  ((&(( &( "v1" ) )->ₛ "s1")) # UInt  |-> 0)
  **  ((&(( &( "v1" ) )->ₛ "s0")) # UInt  |-> 0)
  **  ((&(( &( "v0" ) )->ₛ "s1")) # UInt  |-> 0)
  **  ((&(( &( "v0" ) )->ₛ "s0")) # UInt  |-> 0)
  **  (pw_data F )
  **  (pw_output W O )
|--
  EX (x11: Z)  (x10: Z)  (x01: Z)  (x00: Z) ,
  “ (pw_pair_pre F W a_pre b_pre p_pre kc_pre ) ” 
  &&  “ (a_pre = (pw_offset (a_pre) ((4 * (kc_pre - kc_pre ) )))) ” 
  &&  “ (b_pre = (pw_offset (b_pre) ((4 * (kc_pre - kc_pre ) )))) ” 
  &&  “ (p_pre = (pw_offset (p_pre) ((8 * (kc_pre - kc_pre ) )))) ” 
  &&  “ (0 <= kc_pre) ” 
  &&  “ (kc_pre <= kc_pre) ”
  &&  (pw_data F )
  **  (pw_output W (pw_pair_run ((kc_pre - kc_pre )) (F) (a_pre) (b_pre) (p_pre) (O)) )
  **  ((&(( &( "v0" ) )->ₛ "s0")) # UInt  |-> x00)
  **  ((&(( &( "v0" ) )->ₛ "s1")) # UInt  |-> x01)
  **  ((&(( &( "v1" ) )->ₛ "s0")) # UInt  |-> x10)
  **  ((&(( &( "v1" ) )->ₛ "s1")) # UInt  |-> x11)
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

Definition pw_neon_pair_entail_wit_1_split_goal_1 := 
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (PreH1 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) ,
  (pw_data F )
  **  (pw_output W O )
|--
  “ (0 <= kc_pre) ”
.

Definition pw_neon_pair_entail_wit_1_split_goal_2 := 
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (PreH1 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) ,
  (pw_data F )
  **  (pw_output W O )
|--
  “ (p_pre = (pw_offset (p_pre) ((8 * (kc_pre - kc_pre ) )))) ”
.

Definition pw_neon_pair_entail_wit_1_split_goal_3 := 
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (PreH1 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) ,
  (pw_data F )
  **  (pw_output W O )
|--
  “ (b_pre = (pw_offset (b_pre) ((4 * (kc_pre - kc_pre ) )))) ”
.

Definition pw_neon_pair_entail_wit_1_split_goal_4 := 
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (PreH1 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) ,
  (pw_data F )
  **  (pw_output W O )
|--
  “ (a_pre = (pw_offset (a_pre) ((4 * (kc_pre - kc_pre ) )))) ”
.

Definition pw_neon_pair_entail_wit_1_split_goal_spatial := 
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (PreH1 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) ,
  (pw_data F )
  **  (pw_output W O )
|--
  (pw_data F )
  **  (pw_output W (pw_pair_run ((kc_pre - kc_pre )) (F) (a_pre) (b_pre) (p_pre) (O)) )
.

Definition pw_neon_pair_entail_wit_2 := 
(
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (p: Z) (b: Z) (k: Z) (a: Z) (PreH1 : (k >= 2)) (PreH2 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) (PreH3 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH4 : (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) ))))) (PreH5 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH6 : (0 <= k)) (PreH7 : (k <= kc_pre)) ,
  (pw_output W (pw_write_pair ((pw_write_pair ((pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O))) ((pw_offset (p_pre) ((8 * (kc_pre - k ) )))) ((pw_load_lane (F) ((pw_offset (a_pre) ((4 * (kc_pre - k ) )))) (0))) ((pw_load_lane (F) ((pw_offset (b_pre) ((4 * (kc_pre - k ) )))) (0))))) ((p + (2 * sizeof(UINT)))) ((pw_load_lane (F) ((a + (1 * sizeof(UINT)))) (0))) ((pw_load_lane (F) ((b + (1 * sizeof(UINT)))) (0)))) )
  **  ((&(( &( "v1" ) )->ₛ "s0")) # UInt  |-> (pw_load_lane (F) ((a + (1 * sizeof(UINT)))) (0)))
  **  ((&(( &( "v1" ) )->ₛ "s1")) # UInt  |-> (pw_load_lane (F) ((b + (1 * sizeof(UINT)))) (0)))
  **  ((&(( &( "v0" ) )->ₛ "s0")) # UInt  |-> (pw_load_lane (F) (a) (0)))
  **  ((&(( &( "v0" ) )->ₛ "s1")) # UInt  |-> (pw_load_lane (F) (b) (0)))
  **  (pw_data F )
|--
  EX (x11: Z)  (x10: Z)  (x01: Z)  (x00: Z) ,
  “ (pw_pair_pre F W a_pre b_pre p_pre kc_pre ) ” 
  &&  “ ((a + (2 * sizeof(UINT))) = (pw_offset (a_pre) ((4 * (kc_pre - (k - 2 ) ) )))) ” 
  &&  “ ((b + (2 * sizeof(UINT))) = (pw_offset (b_pre) ((4 * (kc_pre - (k - 2 ) ) )))) ” 
  &&  “ ((p + (4 * sizeof(UINT))) = (pw_offset (p_pre) ((8 * (kc_pre - (k - 2 ) ) )))) ” 
  &&  “ (0 <= (k - 2 )) ” 
  &&  “ ((k - 2 ) <= kc_pre) ”
  &&  (pw_data F )
  **  (pw_output W (pw_pair_run ((kc_pre - (k - 2 ) )) (F) (a_pre) (b_pre) (p_pre) (O)) )
  **  ((&(( &( "v0" ) )->ₛ "s0")) # UInt  |-> x00)
  **  ((&(( &( "v0" ) )->ₛ "s1")) # UInt  |-> x01)
  **  ((&(( &( "v1" ) )->ₛ "s0")) # UInt  |-> x10)
  **  ((&(( &( "v1" ) )->ₛ "s1")) # UInt  |-> x11)
) \/
(
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (p: Z) (b: Z) (k: Z) (a: Z) (PreH1 : (k >= 2)) (PreH2 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) (PreH3 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH4 : (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) ))))) (PreH5 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH6 : (0 <= k)) (PreH7 : (k <= kc_pre)) ,
  (pw_output W (pw_write_pair ((pw_write_pair ((pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O))) ((pw_offset (p_pre) ((8 * (kc_pre - k ) )))) ((pw_load_lane (F) ((pw_offset (a_pre) ((4 * (kc_pre - k ) )))) (0))) ((pw_load_lane (F) ((pw_offset (b_pre) ((4 * (kc_pre - k ) )))) (0))))) ((p + (2 * sizeof(UINT)))) ((pw_load_lane (F) ((a + (1 * sizeof(UINT)))) (0))) ((pw_load_lane (F) ((b + (1 * sizeof(UINT)))) (0)))) )
  **  (pw_data F )
|--
  “ ((p + (4 * sizeof(UINT))) = (pw_offset (p_pre) ((8 * (kc_pre - (k - 2 ) ) )))) ” 
  &&  “ ((b + (2 * sizeof(UINT))) = (pw_offset (b_pre) ((4 * (kc_pre - (k - 2 ) ) )))) ” 
  &&  “ ((a + (2 * sizeof(UINT))) = (pw_offset (a_pre) ((4 * (kc_pre - (k - 2 ) ) )))) ”
  &&  (pw_data F )
  **  (pw_output W (pw_pair_run ((kc_pre - (k - 2 ) )) (F) (a_pre) (b_pre) (p_pre) (O)) )
).

Definition pw_neon_pair_entail_wit_2_split_goal_1 := 
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (p: Z) (b: Z) (k: Z) (a: Z) (PreH1 : (k >= 2)) (PreH2 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) (PreH3 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH4 : (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) ))))) (PreH5 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH6 : (0 <= k)) (PreH7 : (k <= kc_pre)) ,
  (pw_output W (pw_write_pair ((pw_write_pair ((pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O))) ((pw_offset (p_pre) ((8 * (kc_pre - k ) )))) ((pw_load_lane (F) ((pw_offset (a_pre) ((4 * (kc_pre - k ) )))) (0))) ((pw_load_lane (F) ((pw_offset (b_pre) ((4 * (kc_pre - k ) )))) (0))))) ((p + (2 * sizeof(UINT)))) ((pw_load_lane (F) ((a + (1 * sizeof(UINT)))) (0))) ((pw_load_lane (F) ((b + (1 * sizeof(UINT)))) (0)))) )
  **  (pw_data F )
|--
  “ ((p + (4 * sizeof(UINT))) = (pw_offset (p_pre) ((8 * (kc_pre - (k - 2 ) ) )))) ”
.

Definition pw_neon_pair_entail_wit_2_split_goal_2 := 
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (p: Z) (b: Z) (k: Z) (a: Z) (PreH1 : (k >= 2)) (PreH2 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) (PreH3 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH4 : (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) ))))) (PreH5 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH6 : (0 <= k)) (PreH7 : (k <= kc_pre)) ,
  (pw_output W (pw_write_pair ((pw_write_pair ((pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O))) ((pw_offset (p_pre) ((8 * (kc_pre - k ) )))) ((pw_load_lane (F) ((pw_offset (a_pre) ((4 * (kc_pre - k ) )))) (0))) ((pw_load_lane (F) ((pw_offset (b_pre) ((4 * (kc_pre - k ) )))) (0))))) ((p + (2 * sizeof(UINT)))) ((pw_load_lane (F) ((a + (1 * sizeof(UINT)))) (0))) ((pw_load_lane (F) ((b + (1 * sizeof(UINT)))) (0)))) )
  **  (pw_data F )
|--
  “ ((b + (2 * sizeof(UINT))) = (pw_offset (b_pre) ((4 * (kc_pre - (k - 2 ) ) )))) ”
.

Definition pw_neon_pair_entail_wit_2_split_goal_3 := 
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (p: Z) (b: Z) (k: Z) (a: Z) (PreH1 : (k >= 2)) (PreH2 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) (PreH3 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH4 : (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) ))))) (PreH5 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH6 : (0 <= k)) (PreH7 : (k <= kc_pre)) ,
  (pw_output W (pw_write_pair ((pw_write_pair ((pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O))) ((pw_offset (p_pre) ((8 * (kc_pre - k ) )))) ((pw_load_lane (F) ((pw_offset (a_pre) ((4 * (kc_pre - k ) )))) (0))) ((pw_load_lane (F) ((pw_offset (b_pre) ((4 * (kc_pre - k ) )))) (0))))) ((p + (2 * sizeof(UINT)))) ((pw_load_lane (F) ((a + (1 * sizeof(UINT)))) (0))) ((pw_load_lane (F) ((b + (1 * sizeof(UINT)))) (0)))) )
  **  (pw_data F )
|--
  “ ((a + (2 * sizeof(UINT))) = (pw_offset (a_pre) ((4 * (kc_pre - (k - 2 ) ) )))) ”
.

Definition pw_neon_pair_entail_wit_2_split_goal_spatial := 
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (p: Z) (b: Z) (k: Z) (a: Z) (PreH1 : (k >= 2)) (PreH2 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) (PreH3 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH4 : (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) ))))) (PreH5 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH6 : (0 <= k)) (PreH7 : (k <= kc_pre)) ,
  (pw_output W (pw_write_pair ((pw_write_pair ((pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O))) ((pw_offset (p_pre) ((8 * (kc_pre - k ) )))) ((pw_load_lane (F) ((pw_offset (a_pre) ((4 * (kc_pre - k ) )))) (0))) ((pw_load_lane (F) ((pw_offset (b_pre) ((4 * (kc_pre - k ) )))) (0))))) ((p + (2 * sizeof(UINT)))) ((pw_load_lane (F) ((a + (1 * sizeof(UINT)))) (0))) ((pw_load_lane (F) ((b + (1 * sizeof(UINT)))) (0)))) )
  **  (pw_data F )
|--
  (pw_data F )
  **  (pw_output W (pw_pair_run ((kc_pre - (k - 2 ) )) (F) (a_pre) (b_pre) (p_pre) (O)) )
.

Definition pw_neon_pair_entail_wit_3 := 
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (x11_2: Z) (x10_2: Z) (x01_2: Z) (x00_2: Z) (p: Z) (b: Z) (k: Z) (a: Z) (PreH1 : (k < 2)) (PreH2 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) (PreH3 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH4 : (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) ))))) (PreH5 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH6 : (0 <= k)) (PreH7 : (k <= kc_pre)) ,
  (pw_data F )
  **  (pw_output W (pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O)) )
  **  ((&(( &( "v0" ) )->ₛ "s0")) # UInt  |-> x00_2)
  **  ((&(( &( "v0" ) )->ₛ "s1")) # UInt  |-> x01_2)
  **  ((&(( &( "v1" ) )->ₛ "s0")) # UInt  |-> x10_2)
  **  ((&(( &( "v1" ) )->ₛ "s1")) # UInt  |-> x11_2)
|--
  EX (x11: Z)  (x10: Z)  (x01: Z)  (x00: Z) ,
  “ (pw_pair_pre F W a_pre b_pre p_pre kc_pre ) ” 
  &&  “ (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) )))) ” 
  &&  “ (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) )))) ” 
  &&  “ (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) )))) ” 
  &&  “ (0 <= k) ” 
  &&  “ (k <= kc_pre) ”
  &&  (pw_data F )
  **  (pw_output W (pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O)) )
  **  ((&(( &( "v0" ) )->ₛ "s0")) # UInt  |-> x00)
  **  ((&(( &( "v0" ) )->ₛ "s1")) # UInt  |-> x01)
  **  ((&(( &( "v1" ) )->ₛ "s0")) # UInt  |-> x10)
  **  ((&(( &( "v1" ) )->ₛ "s1")) # UInt  |-> x11)
.

Definition pw_neon_pair_entail_wit_4 := 
(
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (x11_2: Z) (x10_2: Z) (p: Z) (b: Z) (k: Z) (a: Z) (PreH1 : (k <> 0)) (PreH2 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) (PreH3 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH4 : (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) ))))) (PreH5 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH6 : (0 <= k)) (PreH7 : (k <= kc_pre)) ,
  (pw_output W (pw_write_pair ((pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O))) (p) ((pw_load_lane (F) (a) (0))) ((pw_load_lane (F) (b) (0)))) )
  **  ((&(( &( "v0" ) )->ₛ "s0")) # UInt  |-> (pw_load_lane (F) (a) (0)))
  **  ((&(( &( "v0" ) )->ₛ "s1")) # UInt  |-> (pw_load_lane (F) (b) (0)))
  **  (pw_data F )
  **  ((&(( &( "v1" ) )->ₛ "s0")) # UInt  |-> x10_2)
  **  ((&(( &( "v1" ) )->ₛ "s1")) # UInt  |-> x11_2)
|--
  EX (x11: Z)  (x10: Z)  (x01: Z)  (x00: Z) ,
  “ (pw_pair_pre F W a_pre b_pre p_pre kc_pre ) ” 
  &&  “ ((a + (1 * sizeof(UINT))) = (pw_offset (a_pre) ((4 * (kc_pre - (k - 1 ) ) )))) ” 
  &&  “ ((b + (1 * sizeof(UINT))) = (pw_offset (b_pre) ((4 * (kc_pre - (k - 1 ) ) )))) ” 
  &&  “ ((p + (2 * sizeof(UINT))) = (pw_offset (p_pre) ((8 * (kc_pre - (k - 1 ) ) )))) ” 
  &&  “ (0 <= (k - 1 )) ” 
  &&  “ ((k - 1 ) <= kc_pre) ”
  &&  (pw_data F )
  **  (pw_output W (pw_pair_run ((kc_pre - (k - 1 ) )) (F) (a_pre) (b_pre) (p_pre) (O)) )
  **  ((&(( &( "v0" ) )->ₛ "s0")) # UInt  |-> x00)
  **  ((&(( &( "v0" ) )->ₛ "s1")) # UInt  |-> x01)
  **  ((&(( &( "v1" ) )->ₛ "s0")) # UInt  |-> x10)
  **  ((&(( &( "v1" ) )->ₛ "s1")) # UInt  |-> x11)
) \/
(
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (p: Z) (b: Z) (k: Z) (a: Z) (PreH1 : (k <> 0)) (PreH2 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) (PreH3 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH4 : (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) ))))) (PreH5 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH6 : (0 <= k)) (PreH7 : (k <= kc_pre)) ,
  (pw_output W (pw_write_pair ((pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O))) (p) ((pw_load_lane (F) (a) (0))) ((pw_load_lane (F) (b) (0)))) )
  **  (pw_data F )
|--
  “ ((p + (2 * sizeof(UINT))) = (pw_offset (p_pre) ((8 * (kc_pre - (k - 1 ) ) )))) ” 
  &&  “ ((b + (1 * sizeof(UINT))) = (pw_offset (b_pre) ((4 * (kc_pre - (k - 1 ) ) )))) ” 
  &&  “ ((a + (1 * sizeof(UINT))) = (pw_offset (a_pre) ((4 * (kc_pre - (k - 1 ) ) )))) ”
  &&  (pw_data F )
  **  (pw_output W (pw_pair_run ((kc_pre - (k - 1 ) )) (F) (a_pre) (b_pre) (p_pre) (O)) )
).

Definition pw_neon_pair_entail_wit_4_split_goal_1 := 
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (p: Z) (b: Z) (k: Z) (a: Z) (PreH1 : (k <> 0)) (PreH2 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) (PreH3 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH4 : (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) ))))) (PreH5 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH6 : (0 <= k)) (PreH7 : (k <= kc_pre)) ,
  (pw_output W (pw_write_pair ((pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O))) (p) ((pw_load_lane (F) (a) (0))) ((pw_load_lane (F) (b) (0)))) )
  **  (pw_data F )
|--
  “ ((p + (2 * sizeof(UINT))) = (pw_offset (p_pre) ((8 * (kc_pre - (k - 1 ) ) )))) ”
.

Definition pw_neon_pair_entail_wit_4_split_goal_2 := 
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (p: Z) (b: Z) (k: Z) (a: Z) (PreH1 : (k <> 0)) (PreH2 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) (PreH3 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH4 : (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) ))))) (PreH5 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH6 : (0 <= k)) (PreH7 : (k <= kc_pre)) ,
  (pw_output W (pw_write_pair ((pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O))) (p) ((pw_load_lane (F) (a) (0))) ((pw_load_lane (F) (b) (0)))) )
  **  (pw_data F )
|--
  “ ((b + (1 * sizeof(UINT))) = (pw_offset (b_pre) ((4 * (kc_pre - (k - 1 ) ) )))) ”
.

Definition pw_neon_pair_entail_wit_4_split_goal_3 := 
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (p: Z) (b: Z) (k: Z) (a: Z) (PreH1 : (k <> 0)) (PreH2 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) (PreH3 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH4 : (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) ))))) (PreH5 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH6 : (0 <= k)) (PreH7 : (k <= kc_pre)) ,
  (pw_output W (pw_write_pair ((pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O))) (p) ((pw_load_lane (F) (a) (0))) ((pw_load_lane (F) (b) (0)))) )
  **  (pw_data F )
|--
  “ ((a + (1 * sizeof(UINT))) = (pw_offset (a_pre) ((4 * (kc_pre - (k - 1 ) ) )))) ”
.

Definition pw_neon_pair_entail_wit_4_split_goal_spatial := 
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (p: Z) (b: Z) (k: Z) (a: Z) (PreH1 : (k <> 0)) (PreH2 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) (PreH3 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH4 : (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) ))))) (PreH5 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH6 : (0 <= k)) (PreH7 : (k <= kc_pre)) ,
  (pw_output W (pw_write_pair ((pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O))) (p) ((pw_load_lane (F) (a) (0))) ((pw_load_lane (F) (b) (0)))) )
  **  (pw_data F )
|--
  (pw_data F )
  **  (pw_output W (pw_pair_run ((kc_pre - (k - 1 ) )) (F) (a_pre) (b_pre) (p_pre) (O)) )
.

Definition pw_neon_pair_return_wit_1 := 
(
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (p: Z) (b: Z) (k: Z) (a: Z) (PreH1 : (k = 0)) (PreH2 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) (PreH3 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH4 : (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) ))))) (PreH5 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH6 : (0 <= k)) (PreH7 : (k <= kc_pre)) ,
  (pw_data F )
  **  (pw_output W (pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O)) )
|--
  (pw_data F )
  **  (pw_output W (pw_pair_run (kc_pre) (F) (a_pre) (b_pre) (p_pre) (O)) )
) \/
(
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (p: Z) (b: Z) (k: Z) (a: Z) (PreH1 : (k = 0)) (PreH2 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) (PreH3 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH4 : (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) ))))) (PreH5 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH6 : (0 <= k)) (PreH7 : (k <= kc_pre)) ,
  (pw_data F )
  **  (pw_output W (pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O)) )
|--
  (pw_data F )
  **  (pw_output W (pw_pair_run (kc_pre) (F) (a_pre) (b_pre) (p_pre) (O)) )
).

Definition pw_neon_pair_return_wit_1_split_goal_spatial := 
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (p: Z) (b: Z) (k: Z) (a: Z) (PreH1 : (k = 0)) (PreH2 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) (PreH3 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH4 : (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) ))))) (PreH5 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH6 : (0 <= k)) (PreH7 : (k <= kc_pre)) ,
  (pw_data F )
  **  (pw_output W (pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O)) )
|--
  (pw_data F )
  **  (pw_output W (pw_pair_run (kc_pre) (F) (a_pre) (b_pre) (p_pre) (O)) )
.

Definition pw_neon_pair_partial_solve_wit_1 := 
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (PreH1 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) ,
  (UndefStructPreduint32x2_t ( &( "v0" ) ) )
  **  (pw_data F )
  **  (pw_output W O )
|--
  “ (pw_pair_pre F W a_pre b_pre p_pre kc_pre ) ”
  &&  (UndefStructPreduint32x2_t ( &( "v0" ) ) )
  **  (pw_data F )
  **  (pw_output W O )
.

Definition pw_neon_pair_partial_solve_wit_2 := 
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (retval: Z) (PreH1 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) ,
  ((&((retval)  # "uint32x2_t" ->ₛ "s0")) # UInt  |-> 0)
  **  ((&((retval)  # "uint32x2_t" ->ₛ "s1")) # UInt  |-> 0)
  **  (UndefStructPreduint32x2_t ( &( "v0" ) ) )
  **  (pw_data F )
  **  (pw_output W O )
|--
  “ (pw_pair_pre F W a_pre b_pre p_pre kc_pre ) ”
  &&  ((&(( &( "v0" ) )->ₛ "s1")) # UInt  |->_)
  **  ((&((retval)  # "uint32x2_t" ->ₛ "s1")) # UInt  |-> 0)
  **  ((&(( &( "v0" ) )->ₛ "s0")) # UInt  |->_)
  **  ((&((retval)  # "uint32x2_t" ->ₛ "s0")) # UInt  |-> 0)
  **  (pw_data F )
  **  (pw_output W O )
.

Definition pw_neon_pair_partial_solve_wit_3 := 
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (PreH1 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) ,
  (UndefStructPreduint32x2_t ( &( "v1" ) ) )
  **  ((&(( &( "v0" ) )->ₛ "s1")) # UInt  |-> 0)
  **  ((&(( &( "v0" ) )->ₛ "s0")) # UInt  |-> 0)
  **  (pw_data F )
  **  (pw_output W O )
|--
  “ (pw_pair_pre F W a_pre b_pre p_pre kc_pre ) ”
  &&  (UndefStructPreduint32x2_t ( &( "v1" ) ) )
  **  ((&(( &( "v0" ) )->ₛ "s1")) # UInt  |-> 0)
  **  ((&(( &( "v0" ) )->ₛ "s0")) # UInt  |-> 0)
  **  (pw_data F )
  **  (pw_output W O )
.

Definition pw_neon_pair_partial_solve_wit_4 := 
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (retval: Z) (PreH1 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) ,
  ((&((retval)  # "uint32x2_t" ->ₛ "s0")) # UInt  |-> 0)
  **  ((&((retval)  # "uint32x2_t" ->ₛ "s1")) # UInt  |-> 0)
  **  (UndefStructPreduint32x2_t ( &( "v1" ) ) )
  **  ((&(( &( "v0" ) )->ₛ "s1")) # UInt  |-> 0)
  **  ((&(( &( "v0" ) )->ₛ "s0")) # UInt  |-> 0)
  **  (pw_data F )
  **  (pw_output W O )
|--
  “ (pw_pair_pre F W a_pre b_pre p_pre kc_pre ) ”
  &&  ((&(( &( "v1" ) )->ₛ "s1")) # UInt  |->_)
  **  ((&((retval)  # "uint32x2_t" ->ₛ "s1")) # UInt  |-> 0)
  **  ((&(( &( "v1" ) )->ₛ "s0")) # UInt  |->_)
  **  ((&((retval)  # "uint32x2_t" ->ₛ "s0")) # UInt  |-> 0)
  **  ((&(( &( "v0" ) )->ₛ "s1")) # UInt  |-> 0)
  **  ((&(( &( "v0" ) )->ₛ "s0")) # UInt  |-> 0)
  **  (pw_data F )
  **  (pw_output W O )
.

Definition pw_neon_pair_partial_solve_wit_5_pure := 
(
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (x11: Z) (x10: Z) (x01: Z) (x00: Z) (p: Z) (b: Z) (k: Z) (a: Z) (PreH1 : (k >= 2)) (PreH2 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) (PreH3 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH4 : (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) ))))) (PreH5 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH6 : (0 <= k)) (PreH7 : (k <= kc_pre)) ,
  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a)
  **  ((( &( "k" ) )) # UInt64  |-> k)
  **  ((( &( "b" ) )) # Ptr  |-> b)
  **  ((( &( "p" ) )) # Ptr  |-> p)
  **  (pw_data F )
  **  (pw_output W (pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O)) )
  **  ((&(( &( "v0" ) )->ₛ "s0")) # UInt  |-> x00)
  **  ((&(( &( "v0" ) )->ₛ "s1")) # UInt  |-> x01)
  **  ((&(( &( "v1" ) )->ₛ "s0")) # UInt  |-> x10)
  **  ((&(( &( "v1" ) )->ₛ "s1")) # UInt  |-> x11)
|--
  “ (pw_window F a 1 ) ”
) \/
(
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (x11: Z) (x10: Z) (x01: Z) (x00: Z) (p: Z) (b: Z) (k: Z) (a: Z) (PreH1 : (k <= UINT64_MAX)) (PreH2 : (kc_pre <= UINT64_MAX)) (PreH3 : (k >= 0)) (PreH4 : (kc_pre >= 0)) (PreH5 : (x11 <= UINT_MAX)) (PreH6 : (x10 <= UINT_MAX)) (PreH7 : (x01 <= UINT_MAX)) (PreH8 : (x00 <= UINT_MAX)) (PreH9 : (x11 >= 0)) (PreH10 : (x10 >= 0)) (PreH11 : (x01 >= 0)) (PreH12 : (x00 >= 0)) (PreH13 : (k >= 2)) (PreH14 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) (PreH15 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH16 : (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) ))))) (PreH17 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH18 : (0 <= k)) (PreH19 : (k <= kc_pre)) ,
  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a)
  **  ((( &( "k" ) )) # UInt64  |-> k)
  **  ((( &( "b" ) )) # Ptr  |-> b)
  **  ((( &( "p" ) )) # Ptr  |-> p)
  **  (pw_data F )
  **  (pw_output W (pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O)) )
  **  ((&(( &( "v0" ) )->ₛ "s0")) # UInt  |-> x00)
  **  ((&(( &( "v0" ) )->ₛ "s1")) # UInt  |-> x01)
  **  ((&(( &( "v1" ) )->ₛ "s0")) # UInt  |-> x10)
  **  ((&(( &( "v1" ) )->ₛ "s1")) # UInt  |-> x11)
|--
  “ (pw_window F a 1 ) ”
).

Definition pw_neon_pair_partial_solve_wit_5_pure_split_goal_1 := 
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (x11: Z) (x10: Z) (x01: Z) (x00: Z) (p: Z) (b: Z) (k: Z) (a: Z) (PreH1 : (k <= UINT64_MAX)) (PreH2 : (kc_pre <= UINT64_MAX)) (PreH3 : (k >= 0)) (PreH4 : (kc_pre >= 0)) (PreH5 : (x11 <= UINT_MAX)) (PreH6 : (x10 <= UINT_MAX)) (PreH7 : (x01 <= UINT_MAX)) (PreH8 : (x00 <= UINT_MAX)) (PreH9 : (x11 >= 0)) (PreH10 : (x10 >= 0)) (PreH11 : (x01 >= 0)) (PreH12 : (x00 >= 0)) (PreH13 : (k >= 2)) (PreH14 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) (PreH15 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH16 : (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) ))))) (PreH17 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH18 : (0 <= k)) (PreH19 : (k <= kc_pre)) ,
  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a)
  **  ((( &( "k" ) )) # UInt64  |-> k)
  **  ((( &( "b" ) )) # Ptr  |-> b)
  **  ((( &( "p" ) )) # Ptr  |-> p)
  **  (pw_data F )
  **  (pw_output W (pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O)) )
  **  ((&(( &( "v0" ) )->ₛ "s0")) # UInt  |-> x00)
  **  ((&(( &( "v0" ) )->ₛ "s1")) # UInt  |-> x01)
  **  ((&(( &( "v1" ) )->ₛ "s0")) # UInt  |-> x10)
  **  ((&(( &( "v1" ) )->ₛ "s1")) # UInt  |-> x11)
|--
  “ (pw_window F a 1 ) ”
.

Definition pw_neon_pair_partial_solve_wit_5_aux := 
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (x11: Z) (x10: Z) (x01: Z) (x00: Z) (p: Z) (b: Z) (k: Z) (a: Z) (PreH1 : (k >= 2)) (PreH2 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) (PreH3 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH4 : (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) ))))) (PreH5 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH6 : (0 <= k)) (PreH7 : (k <= kc_pre)) ,
  (pw_data F )
  **  (pw_output W (pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O)) )
  **  ((&(( &( "v0" ) )->ₛ "s0")) # UInt  |-> x00)
  **  ((&(( &( "v0" ) )->ₛ "s1")) # UInt  |-> x01)
  **  ((&(( &( "v1" ) )->ₛ "s0")) # UInt  |-> x10)
  **  ((&(( &( "v1" ) )->ₛ "s1")) # UInt  |-> x11)
|--
  “ (pw_window F a 1 ) ” 
  &&  “ (k >= 2) ” 
  &&  “ (pw_pair_pre F W a_pre b_pre p_pre kc_pre ) ” 
  &&  “ (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) )))) ” 
  &&  “ (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) )))) ” 
  &&  “ (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) )))) ” 
  &&  “ (0 <= k) ” 
  &&  “ (k <= kc_pre) ”
  &&  (pw_data F )
  **  ((&(( &( "v0" ) )->ₛ "s0")) # UInt  |-> x00)
  **  ((&(( &( "v0" ) )->ₛ "s1")) # UInt  |-> x01)
  **  (pw_output W (pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O)) )
  **  ((&(( &( "v1" ) )->ₛ "s0")) # UInt  |-> x10)
  **  ((&(( &( "v1" ) )->ₛ "s1")) # UInt  |-> x11)
.

Definition pw_neon_pair_partial_solve_wit_5 := pw_neon_pair_partial_solve_wit_5_pure -> pw_neon_pair_partial_solve_wit_5_aux.

Definition pw_neon_pair_partial_solve_wit_6 := 
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (x11: Z) (x10: Z) (x01: Z) (p: Z) (b: Z) (k: Z) (a: Z) (retval: Z) (PreH1 : (k >= 2)) (PreH2 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) (PreH3 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH4 : (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) ))))) (PreH5 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH6 : (0 <= k)) (PreH7 : (k <= kc_pre)) ,
  (UndefStructPreduint32x2_t ( &( "v0" ) ) )
  **  (pw_data F )
  **  ((&((retval)  # "uint32x2_t" ->ₛ "s0")) # UInt  |-> (pw_load_lane (F) (a) (0)))
  **  ((&((retval)  # "uint32x2_t" ->ₛ "s1")) # UInt  |-> x01)
  **  (pw_output W (pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O)) )
  **  ((&(( &( "v1" ) )->ₛ "s0")) # UInt  |-> x10)
  **  ((&(( &( "v1" ) )->ₛ "s1")) # UInt  |-> x11)
|--
  “ (k >= 2) ” 
  &&  “ (pw_pair_pre F W a_pre b_pre p_pre kc_pre ) ” 
  &&  “ (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) )))) ” 
  &&  “ (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) )))) ” 
  &&  “ (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) )))) ” 
  &&  “ (0 <= k) ” 
  &&  “ (k <= kc_pre) ”
  &&  ((&(( &( "v0" ) )->ₛ "s1")) # UInt  |->_)
  **  ((&((retval)  # "uint32x2_t" ->ₛ "s1")) # UInt  |-> x01)
  **  ((&(( &( "v0" ) )->ₛ "s0")) # UInt  |->_)
  **  ((&((retval)  # "uint32x2_t" ->ₛ "s0")) # UInt  |-> (pw_load_lane (F) (a) (0)))
  **  (pw_data F )
  **  (pw_output W (pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O)) )
  **  ((&(( &( "v1" ) )->ₛ "s0")) # UInt  |-> x10)
  **  ((&(( &( "v1" ) )->ₛ "s1")) # UInt  |-> x11)
.

Definition pw_neon_pair_partial_solve_wit_7_pure := 
(
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (x11: Z) (x10: Z) (x01: Z) (p: Z) (b: Z) (k: Z) (a: Z) (PreH1 : (k >= 2)) (PreH2 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) (PreH3 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH4 : (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) ))))) (PreH5 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH6 : (0 <= k)) (PreH7 : (k <= kc_pre)) ,
  ((&(( &( "v0" ) )->ₛ "s1")) # UInt  |-> x01)
  **  ((&(( &( "v0" ) )->ₛ "s0")) # UInt  |-> (pw_load_lane (F) (a) (0)))
  **  (pw_data F )
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a)
  **  ((( &( "k" ) )) # UInt64  |-> k)
  **  ((( &( "b" ) )) # Ptr  |-> b)
  **  ((( &( "p" ) )) # Ptr  |-> p)
  **  (pw_output W (pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O)) )
  **  ((&(( &( "v1" ) )->ₛ "s0")) # UInt  |-> x10)
  **  ((&(( &( "v1" ) )->ₛ "s1")) # UInt  |-> x11)
|--
  “ (pw_window F (a + (1 * sizeof(UINT))) 1 ) ”
) \/
(
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (x11: Z) (x10: Z) (x01: Z) (p: Z) (b: Z) (k: Z) (a: Z) (PreH1 : (k <= UINT64_MAX)) (PreH2 : (kc_pre <= UINT64_MAX)) (PreH3 : (k >= 0)) (PreH4 : (kc_pre >= 0)) (PreH5 : (x11 <= UINT_MAX)) (PreH6 : (x10 <= UINT_MAX)) (PreH7 : ((pw_load_lane (F) (a) (0)) <= UINT_MAX)) (PreH8 : (x01 <= UINT_MAX)) (PreH9 : (x11 >= 0)) (PreH10 : (x10 >= 0)) (PreH11 : ((pw_load_lane (F) (a) (0)) >= 0)) (PreH12 : (x01 >= 0)) (PreH13 : (k >= 2)) (PreH14 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) (PreH15 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH16 : (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) ))))) (PreH17 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH18 : (0 <= k)) (PreH19 : (k <= kc_pre)) ,
  ((&(( &( "v0" ) )->ₛ "s1")) # UInt  |-> x01)
  **  ((&(( &( "v0" ) )->ₛ "s0")) # UInt  |-> (pw_load_lane (F) (a) (0)))
  **  (pw_data F )
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a)
  **  ((( &( "k" ) )) # UInt64  |-> k)
  **  ((( &( "b" ) )) # Ptr  |-> b)
  **  ((( &( "p" ) )) # Ptr  |-> p)
  **  (pw_output W (pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O)) )
  **  ((&(( &( "v1" ) )->ₛ "s0")) # UInt  |-> x10)
  **  ((&(( &( "v1" ) )->ₛ "s1")) # UInt  |-> x11)
|--
  “ (pw_window F (a + (1 * sizeof(UINT))) 1 ) ”
).

Definition pw_neon_pair_partial_solve_wit_7_pure_split_goal_1 := 
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (x11: Z) (x10: Z) (x01: Z) (p: Z) (b: Z) (k: Z) (a: Z) (PreH1 : (k <= UINT64_MAX)) (PreH2 : (kc_pre <= UINT64_MAX)) (PreH3 : (k >= 0)) (PreH4 : (kc_pre >= 0)) (PreH5 : (x11 <= UINT_MAX)) (PreH6 : (x10 <= UINT_MAX)) (PreH7 : ((pw_load_lane (F) (a) (0)) <= UINT_MAX)) (PreH8 : (x01 <= UINT_MAX)) (PreH9 : (x11 >= 0)) (PreH10 : (x10 >= 0)) (PreH11 : ((pw_load_lane (F) (a) (0)) >= 0)) (PreH12 : (x01 >= 0)) (PreH13 : (k >= 2)) (PreH14 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) (PreH15 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH16 : (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) ))))) (PreH17 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH18 : (0 <= k)) (PreH19 : (k <= kc_pre)) ,
  ((&(( &( "v0" ) )->ₛ "s1")) # UInt  |-> x01)
  **  ((&(( &( "v0" ) )->ₛ "s0")) # UInt  |-> (pw_load_lane (F) (a) (0)))
  **  (pw_data F )
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a)
  **  ((( &( "k" ) )) # UInt64  |-> k)
  **  ((( &( "b" ) )) # Ptr  |-> b)
  **  ((( &( "p" ) )) # Ptr  |-> p)
  **  (pw_output W (pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O)) )
  **  ((&(( &( "v1" ) )->ₛ "s0")) # UInt  |-> x10)
  **  ((&(( &( "v1" ) )->ₛ "s1")) # UInt  |-> x11)
|--
  “ (pw_window F (a + (1 * sizeof(UINT))) 1 ) ”
.

Definition pw_neon_pair_partial_solve_wit_7_aux := 
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (x11: Z) (x10: Z) (x01: Z) (p: Z) (b: Z) (k: Z) (a: Z) (PreH1 : (k >= 2)) (PreH2 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) (PreH3 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH4 : (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) ))))) (PreH5 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH6 : (0 <= k)) (PreH7 : (k <= kc_pre)) ,
  ((&(( &( "v0" ) )->ₛ "s1")) # UInt  |-> x01)
  **  ((&(( &( "v0" ) )->ₛ "s0")) # UInt  |-> (pw_load_lane (F) (a) (0)))
  **  (pw_data F )
  **  (pw_output W (pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O)) )
  **  ((&(( &( "v1" ) )->ₛ "s0")) # UInt  |-> x10)
  **  ((&(( &( "v1" ) )->ₛ "s1")) # UInt  |-> x11)
|--
  “ (pw_window F (a + (1 * sizeof(UINT))) 1 ) ” 
  &&  “ (k >= 2) ” 
  &&  “ (pw_pair_pre F W a_pre b_pre p_pre kc_pre ) ” 
  &&  “ (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) )))) ” 
  &&  “ (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) )))) ” 
  &&  “ (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) )))) ” 
  &&  “ (0 <= k) ” 
  &&  “ (k <= kc_pre) ”
  &&  (pw_data F )
  **  ((&(( &( "v1" ) )->ₛ "s0")) # UInt  |-> x10)
  **  ((&(( &( "v1" ) )->ₛ "s1")) # UInt  |-> x11)
  **  ((&(( &( "v0" ) )->ₛ "s1")) # UInt  |-> x01)
  **  ((&(( &( "v0" ) )->ₛ "s0")) # UInt  |-> (pw_load_lane (F) (a) (0)))
  **  (pw_output W (pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O)) )
.

Definition pw_neon_pair_partial_solve_wit_7 := pw_neon_pair_partial_solve_wit_7_pure -> pw_neon_pair_partial_solve_wit_7_aux.

Definition pw_neon_pair_partial_solve_wit_8 := 
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (x11: Z) (x01: Z) (p: Z) (b: Z) (k: Z) (a: Z) (retval: Z) (PreH1 : (k >= 2)) (PreH2 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) (PreH3 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH4 : (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) ))))) (PreH5 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH6 : (0 <= k)) (PreH7 : (k <= kc_pre)) ,
  (UndefStructPreduint32x2_t ( &( "v1" ) ) )
  **  (pw_data F )
  **  ((&((retval)  # "uint32x2_t" ->ₛ "s0")) # UInt  |-> (pw_load_lane (F) ((a + (1 * sizeof(UINT)))) (0)))
  **  ((&((retval)  # "uint32x2_t" ->ₛ "s1")) # UInt  |-> x11)
  **  ((&(( &( "v0" ) )->ₛ "s1")) # UInt  |-> x01)
  **  ((&(( &( "v0" ) )->ₛ "s0")) # UInt  |-> (pw_load_lane (F) (a) (0)))
  **  (pw_output W (pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O)) )
|--
  “ (k >= 2) ” 
  &&  “ (pw_pair_pre F W a_pre b_pre p_pre kc_pre ) ” 
  &&  “ (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) )))) ” 
  &&  “ (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) )))) ” 
  &&  “ (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) )))) ” 
  &&  “ (0 <= k) ” 
  &&  “ (k <= kc_pre) ”
  &&  ((&(( &( "v1" ) )->ₛ "s1")) # UInt  |->_)
  **  ((&((retval)  # "uint32x2_t" ->ₛ "s1")) # UInt  |-> x11)
  **  ((&(( &( "v1" ) )->ₛ "s0")) # UInt  |->_)
  **  ((&((retval)  # "uint32x2_t" ->ₛ "s0")) # UInt  |-> (pw_load_lane (F) ((a + (1 * sizeof(UINT)))) (0)))
  **  (pw_data F )
  **  ((&(( &( "v0" ) )->ₛ "s1")) # UInt  |-> x01)
  **  ((&(( &( "v0" ) )->ₛ "s0")) # UInt  |-> (pw_load_lane (F) (a) (0)))
  **  (pw_output W (pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O)) )
.

Definition pw_neon_pair_partial_solve_wit_9_pure := 
(
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (x11: Z) (x01: Z) (p: Z) (b: Z) (k: Z) (a: Z) (PreH1 : (k >= 2)) (PreH2 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) (PreH3 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH4 : (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) ))))) (PreH5 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH6 : (0 <= k)) (PreH7 : (k <= kc_pre)) ,
  ((&(( &( "v1" ) )->ₛ "s1")) # UInt  |-> x11)
  **  ((&(( &( "v1" ) )->ₛ "s0")) # UInt  |-> (pw_load_lane (F) ((a + (1 * sizeof(UINT)))) (0)))
  **  (pw_data F )
  **  ((&(( &( "v0" ) )->ₛ "s1")) # UInt  |-> x01)
  **  ((&(( &( "v0" ) )->ₛ "s0")) # UInt  |-> (pw_load_lane (F) (a) (0)))
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "a" ) )) # Ptr  |-> (a + (2 * sizeof(UINT))))
  **  ((( &( "k" ) )) # UInt64  |-> k)
  **  ((( &( "b" ) )) # Ptr  |-> b)
  **  ((( &( "p" ) )) # Ptr  |-> p)
  **  (pw_output W (pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O)) )
|--
  “ (pw_window F b 1 ) ”
) \/
(
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (x11: Z) (x01: Z) (p: Z) (b: Z) (k: Z) (a: Z) (PreH1 : (k <= UINT64_MAX)) (PreH2 : (kc_pre <= UINT64_MAX)) (PreH3 : (k >= 0)) (PreH4 : (kc_pre >= 0)) (PreH5 : ((pw_load_lane (F) (a) (0)) <= UINT_MAX)) (PreH6 : (x01 <= UINT_MAX)) (PreH7 : ((pw_load_lane (F) ((a + (1 * sizeof(UINT)))) (0)) <= UINT_MAX)) (PreH8 : (x11 <= UINT_MAX)) (PreH9 : ((pw_load_lane (F) (a) (0)) >= 0)) (PreH10 : (x01 >= 0)) (PreH11 : ((pw_load_lane (F) ((a + (1 * sizeof(UINT)))) (0)) >= 0)) (PreH12 : (x11 >= 0)) (PreH13 : (k >= 2)) (PreH14 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) (PreH15 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH16 : (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) ))))) (PreH17 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH18 : (0 <= k)) (PreH19 : (k <= kc_pre)) ,
  ((&(( &( "v1" ) )->ₛ "s1")) # UInt  |-> x11)
  **  ((&(( &( "v1" ) )->ₛ "s0")) # UInt  |-> (pw_load_lane (F) ((a + (1 * sizeof(UINT)))) (0)))
  **  (pw_data F )
  **  ((&(( &( "v0" ) )->ₛ "s1")) # UInt  |-> x01)
  **  ((&(( &( "v0" ) )->ₛ "s0")) # UInt  |-> (pw_load_lane (F) (a) (0)))
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "a" ) )) # Ptr  |-> (a + (2 * sizeof(UINT))))
  **  ((( &( "k" ) )) # UInt64  |-> k)
  **  ((( &( "b" ) )) # Ptr  |-> b)
  **  ((( &( "p" ) )) # Ptr  |-> p)
  **  (pw_output W (pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O)) )
|--
  “ (pw_window F b 1 ) ”
).

Definition pw_neon_pair_partial_solve_wit_9_pure_split_goal_1 := 
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (x11: Z) (x01: Z) (p: Z) (b: Z) (k: Z) (a: Z) (PreH1 : (k <= UINT64_MAX)) (PreH2 : (kc_pre <= UINT64_MAX)) (PreH3 : (k >= 0)) (PreH4 : (kc_pre >= 0)) (PreH5 : ((pw_load_lane (F) (a) (0)) <= UINT_MAX)) (PreH6 : (x01 <= UINT_MAX)) (PreH7 : ((pw_load_lane (F) ((a + (1 * sizeof(UINT)))) (0)) <= UINT_MAX)) (PreH8 : (x11 <= UINT_MAX)) (PreH9 : ((pw_load_lane (F) (a) (0)) >= 0)) (PreH10 : (x01 >= 0)) (PreH11 : ((pw_load_lane (F) ((a + (1 * sizeof(UINT)))) (0)) >= 0)) (PreH12 : (x11 >= 0)) (PreH13 : (k >= 2)) (PreH14 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) (PreH15 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH16 : (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) ))))) (PreH17 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH18 : (0 <= k)) (PreH19 : (k <= kc_pre)) ,
  ((&(( &( "v1" ) )->ₛ "s1")) # UInt  |-> x11)
  **  ((&(( &( "v1" ) )->ₛ "s0")) # UInt  |-> (pw_load_lane (F) ((a + (1 * sizeof(UINT)))) (0)))
  **  (pw_data F )
  **  ((&(( &( "v0" ) )->ₛ "s1")) # UInt  |-> x01)
  **  ((&(( &( "v0" ) )->ₛ "s0")) # UInt  |-> (pw_load_lane (F) (a) (0)))
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "a" ) )) # Ptr  |-> (a + (2 * sizeof(UINT))))
  **  ((( &( "k" ) )) # UInt64  |-> k)
  **  ((( &( "b" ) )) # Ptr  |-> b)
  **  ((( &( "p" ) )) # Ptr  |-> p)
  **  (pw_output W (pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O)) )
|--
  “ (pw_window F b 1 ) ”
.

Definition pw_neon_pair_partial_solve_wit_9_aux := 
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (x11: Z) (x01: Z) (p: Z) (b: Z) (k: Z) (a: Z) (PreH1 : (k >= 2)) (PreH2 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) (PreH3 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH4 : (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) ))))) (PreH5 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH6 : (0 <= k)) (PreH7 : (k <= kc_pre)) ,
  ((&(( &( "v1" ) )->ₛ "s1")) # UInt  |-> x11)
  **  ((&(( &( "v1" ) )->ₛ "s0")) # UInt  |-> (pw_load_lane (F) ((a + (1 * sizeof(UINT)))) (0)))
  **  (pw_data F )
  **  ((&(( &( "v0" ) )->ₛ "s1")) # UInt  |-> x01)
  **  ((&(( &( "v0" ) )->ₛ "s0")) # UInt  |-> (pw_load_lane (F) (a) (0)))
  **  (pw_output W (pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O)) )
|--
  “ (pw_window F b 1 ) ” 
  &&  “ (k >= 2) ” 
  &&  “ (pw_pair_pre F W a_pre b_pre p_pre kc_pre ) ” 
  &&  “ (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) )))) ” 
  &&  “ (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) )))) ” 
  &&  “ (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) )))) ” 
  &&  “ (0 <= k) ” 
  &&  “ (k <= kc_pre) ”
  &&  (pw_data F )
  **  ((&(( &( "v0" ) )->ₛ "s0")) # UInt  |-> (pw_load_lane (F) (a) (0)))
  **  ((&(( &( "v0" ) )->ₛ "s1")) # UInt  |-> x01)
  **  ((&(( &( "v1" ) )->ₛ "s1")) # UInt  |-> x11)
  **  ((&(( &( "v1" ) )->ₛ "s0")) # UInt  |-> (pw_load_lane (F) ((a + (1 * sizeof(UINT)))) (0)))
  **  (pw_output W (pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O)) )
.

Definition pw_neon_pair_partial_solve_wit_9 := pw_neon_pair_partial_solve_wit_9_pure -> pw_neon_pair_partial_solve_wit_9_aux.

Definition pw_neon_pair_partial_solve_wit_10 := 
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (x11: Z) (p: Z) (b: Z) (k: Z) (a: Z) (retval: Z) (PreH1 : (k >= 2)) (PreH2 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) (PreH3 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH4 : (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) ))))) (PreH5 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH6 : (0 <= k)) (PreH7 : (k <= kc_pre)) ,
  (UndefStructPreduint32x2_t ( &( "v0" ) ) )
  **  (pw_data F )
  **  ((&((retval)  # "uint32x2_t" ->ₛ "s0")) # UInt  |-> (pw_load_lane (F) (a) (0)))
  **  ((&((retval)  # "uint32x2_t" ->ₛ "s1")) # UInt  |-> (pw_load_lane (F) (b) (0)))
  **  ((&(( &( "v1" ) )->ₛ "s1")) # UInt  |-> x11)
  **  ((&(( &( "v1" ) )->ₛ "s0")) # UInt  |-> (pw_load_lane (F) ((a + (1 * sizeof(UINT)))) (0)))
  **  (pw_output W (pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O)) )
|--
  “ (k >= 2) ” 
  &&  “ (pw_pair_pre F W a_pre b_pre p_pre kc_pre ) ” 
  &&  “ (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) )))) ” 
  &&  “ (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) )))) ” 
  &&  “ (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) )))) ” 
  &&  “ (0 <= k) ” 
  &&  “ (k <= kc_pre) ”
  &&  ((&(( &( "v0" ) )->ₛ "s1")) # UInt  |->_)
  **  ((&((retval)  # "uint32x2_t" ->ₛ "s1")) # UInt  |-> (pw_load_lane (F) (b) (0)))
  **  ((&(( &( "v0" ) )->ₛ "s0")) # UInt  |->_)
  **  ((&((retval)  # "uint32x2_t" ->ₛ "s0")) # UInt  |-> (pw_load_lane (F) (a) (0)))
  **  (pw_data F )
  **  ((&(( &( "v1" ) )->ₛ "s1")) # UInt  |-> x11)
  **  ((&(( &( "v1" ) )->ₛ "s0")) # UInt  |-> (pw_load_lane (F) ((a + (1 * sizeof(UINT)))) (0)))
  **  (pw_output W (pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O)) )
.

Definition pw_neon_pair_partial_solve_wit_11_pure := 
(
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (x11: Z) (p: Z) (b: Z) (k: Z) (a: Z) (PreH1 : (k >= 2)) (PreH2 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) (PreH3 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH4 : (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) ))))) (PreH5 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH6 : (0 <= k)) (PreH7 : (k <= kc_pre)) ,
  ((&(( &( "v0" ) )->ₛ "s1")) # UInt  |-> (pw_load_lane (F) (b) (0)))
  **  ((&(( &( "v0" ) )->ₛ "s0")) # UInt  |-> (pw_load_lane (F) (a) (0)))
  **  (pw_data F )
  **  ((&(( &( "v1" ) )->ₛ "s1")) # UInt  |-> x11)
  **  ((&(( &( "v1" ) )->ₛ "s0")) # UInt  |-> (pw_load_lane (F) ((a + (1 * sizeof(UINT)))) (0)))
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "a" ) )) # Ptr  |-> (a + (2 * sizeof(UINT))))
  **  ((( &( "k" ) )) # UInt64  |-> k)
  **  ((( &( "b" ) )) # Ptr  |-> b)
  **  ((( &( "p" ) )) # Ptr  |-> p)
  **  (pw_output W (pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O)) )
|--
  “ (pw_window F (b + (1 * sizeof(UINT))) 1 ) ”
) \/
(
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (x11: Z) (p: Z) (b: Z) (k: Z) (a: Z) (PreH1 : (k <= UINT64_MAX)) (PreH2 : (kc_pre <= UINT64_MAX)) (PreH3 : (k >= 0)) (PreH4 : (kc_pre >= 0)) (PreH5 : ((pw_load_lane (F) ((a + (1 * sizeof(UINT)))) (0)) <= UINT_MAX)) (PreH6 : (x11 <= UINT_MAX)) (PreH7 : ((pw_load_lane (F) (a) (0)) <= UINT_MAX)) (PreH8 : ((pw_load_lane (F) (b) (0)) <= UINT_MAX)) (PreH9 : ((pw_load_lane (F) ((a + (1 * sizeof(UINT)))) (0)) >= 0)) (PreH10 : (x11 >= 0)) (PreH11 : ((pw_load_lane (F) (a) (0)) >= 0)) (PreH12 : ((pw_load_lane (F) (b) (0)) >= 0)) (PreH13 : (k >= 2)) (PreH14 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) (PreH15 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH16 : (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) ))))) (PreH17 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH18 : (0 <= k)) (PreH19 : (k <= kc_pre)) ,
  ((&(( &( "v0" ) )->ₛ "s1")) # UInt  |-> (pw_load_lane (F) (b) (0)))
  **  ((&(( &( "v0" ) )->ₛ "s0")) # UInt  |-> (pw_load_lane (F) (a) (0)))
  **  (pw_data F )
  **  ((&(( &( "v1" ) )->ₛ "s1")) # UInt  |-> x11)
  **  ((&(( &( "v1" ) )->ₛ "s0")) # UInt  |-> (pw_load_lane (F) ((a + (1 * sizeof(UINT)))) (0)))
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "a" ) )) # Ptr  |-> (a + (2 * sizeof(UINT))))
  **  ((( &( "k" ) )) # UInt64  |-> k)
  **  ((( &( "b" ) )) # Ptr  |-> b)
  **  ((( &( "p" ) )) # Ptr  |-> p)
  **  (pw_output W (pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O)) )
|--
  “ (pw_window F (b + (1 * sizeof(UINT))) 1 ) ”
).

Definition pw_neon_pair_partial_solve_wit_11_pure_split_goal_1 := 
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (x11: Z) (p: Z) (b: Z) (k: Z) (a: Z) (PreH1 : (k <= UINT64_MAX)) (PreH2 : (kc_pre <= UINT64_MAX)) (PreH3 : (k >= 0)) (PreH4 : (kc_pre >= 0)) (PreH5 : ((pw_load_lane (F) ((a + (1 * sizeof(UINT)))) (0)) <= UINT_MAX)) (PreH6 : (x11 <= UINT_MAX)) (PreH7 : ((pw_load_lane (F) (a) (0)) <= UINT_MAX)) (PreH8 : ((pw_load_lane (F) (b) (0)) <= UINT_MAX)) (PreH9 : ((pw_load_lane (F) ((a + (1 * sizeof(UINT)))) (0)) >= 0)) (PreH10 : (x11 >= 0)) (PreH11 : ((pw_load_lane (F) (a) (0)) >= 0)) (PreH12 : ((pw_load_lane (F) (b) (0)) >= 0)) (PreH13 : (k >= 2)) (PreH14 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) (PreH15 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH16 : (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) ))))) (PreH17 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH18 : (0 <= k)) (PreH19 : (k <= kc_pre)) ,
  ((&(( &( "v0" ) )->ₛ "s1")) # UInt  |-> (pw_load_lane (F) (b) (0)))
  **  ((&(( &( "v0" ) )->ₛ "s0")) # UInt  |-> (pw_load_lane (F) (a) (0)))
  **  (pw_data F )
  **  ((&(( &( "v1" ) )->ₛ "s1")) # UInt  |-> x11)
  **  ((&(( &( "v1" ) )->ₛ "s0")) # UInt  |-> (pw_load_lane (F) ((a + (1 * sizeof(UINT)))) (0)))
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "a" ) )) # Ptr  |-> (a + (2 * sizeof(UINT))))
  **  ((( &( "k" ) )) # UInt64  |-> k)
  **  ((( &( "b" ) )) # Ptr  |-> b)
  **  ((( &( "p" ) )) # Ptr  |-> p)
  **  (pw_output W (pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O)) )
|--
  “ (pw_window F (b + (1 * sizeof(UINT))) 1 ) ”
.

Definition pw_neon_pair_partial_solve_wit_11_aux := 
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (x11: Z) (p: Z) (b: Z) (k: Z) (a: Z) (PreH1 : (k >= 2)) (PreH2 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) (PreH3 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH4 : (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) ))))) (PreH5 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH6 : (0 <= k)) (PreH7 : (k <= kc_pre)) ,
  ((&(( &( "v0" ) )->ₛ "s1")) # UInt  |-> (pw_load_lane (F) (b) (0)))
  **  ((&(( &( "v0" ) )->ₛ "s0")) # UInt  |-> (pw_load_lane (F) (a) (0)))
  **  (pw_data F )
  **  ((&(( &( "v1" ) )->ₛ "s1")) # UInt  |-> x11)
  **  ((&(( &( "v1" ) )->ₛ "s0")) # UInt  |-> (pw_load_lane (F) ((a + (1 * sizeof(UINT)))) (0)))
  **  (pw_output W (pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O)) )
|--
  “ (pw_window F (b + (1 * sizeof(UINT))) 1 ) ” 
  &&  “ (k >= 2) ” 
  &&  “ (pw_pair_pre F W a_pre b_pre p_pre kc_pre ) ” 
  &&  “ (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) )))) ” 
  &&  “ (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) )))) ” 
  &&  “ (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) )))) ” 
  &&  “ (0 <= k) ” 
  &&  “ (k <= kc_pre) ”
  &&  (pw_data F )
  **  ((&(( &( "v1" ) )->ₛ "s0")) # UInt  |-> (pw_load_lane (F) ((a + (1 * sizeof(UINT)))) (0)))
  **  ((&(( &( "v1" ) )->ₛ "s1")) # UInt  |-> x11)
  **  ((&(( &( "v0" ) )->ₛ "s1")) # UInt  |-> (pw_load_lane (F) (b) (0)))
  **  ((&(( &( "v0" ) )->ₛ "s0")) # UInt  |-> (pw_load_lane (F) (a) (0)))
  **  (pw_output W (pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O)) )
.

Definition pw_neon_pair_partial_solve_wit_11 := pw_neon_pair_partial_solve_wit_11_pure -> pw_neon_pair_partial_solve_wit_11_aux.

Definition pw_neon_pair_partial_solve_wit_12 := 
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (p: Z) (b: Z) (k: Z) (a: Z) (retval: Z) (PreH1 : (k >= 2)) (PreH2 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) (PreH3 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH4 : (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) ))))) (PreH5 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH6 : (0 <= k)) (PreH7 : (k <= kc_pre)) ,
  (UndefStructPreduint32x2_t ( &( "v1" ) ) )
  **  (pw_data F )
  **  ((&((retval)  # "uint32x2_t" ->ₛ "s0")) # UInt  |-> (pw_load_lane (F) ((a + (1 * sizeof(UINT)))) (0)))
  **  ((&((retval)  # "uint32x2_t" ->ₛ "s1")) # UInt  |-> (pw_load_lane (F) ((b + (1 * sizeof(UINT)))) (0)))
  **  ((&(( &( "v0" ) )->ₛ "s1")) # UInt  |-> (pw_load_lane (F) (b) (0)))
  **  ((&(( &( "v0" ) )->ₛ "s0")) # UInt  |-> (pw_load_lane (F) (a) (0)))
  **  (pw_output W (pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O)) )
|--
  “ (k >= 2) ” 
  &&  “ (pw_pair_pre F W a_pre b_pre p_pre kc_pre ) ” 
  &&  “ (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) )))) ” 
  &&  “ (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) )))) ” 
  &&  “ (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) )))) ” 
  &&  “ (0 <= k) ” 
  &&  “ (k <= kc_pre) ”
  &&  ((&(( &( "v1" ) )->ₛ "s1")) # UInt  |->_)
  **  ((&((retval)  # "uint32x2_t" ->ₛ "s1")) # UInt  |-> (pw_load_lane (F) ((b + (1 * sizeof(UINT)))) (0)))
  **  ((&(( &( "v1" ) )->ₛ "s0")) # UInt  |->_)
  **  ((&((retval)  # "uint32x2_t" ->ₛ "s0")) # UInt  |-> (pw_load_lane (F) ((a + (1 * sizeof(UINT)))) (0)))
  **  (pw_data F )
  **  ((&(( &( "v0" ) )->ₛ "s1")) # UInt  |-> (pw_load_lane (F) (b) (0)))
  **  ((&(( &( "v0" ) )->ₛ "s0")) # UInt  |-> (pw_load_lane (F) (a) (0)))
  **  (pw_output W (pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O)) )
.

Definition pw_neon_pair_partial_solve_wit_13_pure := 
(
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (p: Z) (b: Z) (k: Z) (a: Z) (PreH1 : (k >= 2)) (PreH2 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) (PreH3 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH4 : (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) ))))) (PreH5 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH6 : (0 <= k)) (PreH7 : (k <= kc_pre)) ,
  ((&(( &( "v1" ) )->ₛ "s1")) # UInt  |-> (pw_load_lane (F) ((b + (1 * sizeof(UINT)))) (0)))
  **  ((&(( &( "v1" ) )->ₛ "s0")) # UInt  |-> (pw_load_lane (F) ((a + (1 * sizeof(UINT)))) (0)))
  **  (pw_data F )
  **  ((&(( &( "v0" ) )->ₛ "s1")) # UInt  |-> (pw_load_lane (F) (b) (0)))
  **  ((&(( &( "v0" ) )->ₛ "s0")) # UInt  |-> (pw_load_lane (F) (a) (0)))
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "a" ) )) # Ptr  |-> (a + (2 * sizeof(UINT))))
  **  ((( &( "k" ) )) # UInt64  |-> k)
  **  ((( &( "b" ) )) # Ptr  |-> (b + (2 * sizeof(UINT))))
  **  ((( &( "p" ) )) # Ptr  |-> p)
  **  (pw_output W (pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O)) )
|--
  “ (pw_write_window W p 2 ) ”
) \/
(
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (p: Z) (b: Z) (k: Z) (a: Z) (PreH1 : (k <= UINT64_MAX)) (PreH2 : (kc_pre <= UINT64_MAX)) (PreH3 : (k >= 0)) (PreH4 : (kc_pre >= 0)) (PreH5 : ((pw_load_lane (F) (a) (0)) <= UINT_MAX)) (PreH6 : ((pw_load_lane (F) (b) (0)) <= UINT_MAX)) (PreH7 : ((pw_load_lane (F) ((a + (1 * sizeof(UINT)))) (0)) <= UINT_MAX)) (PreH8 : ((pw_load_lane (F) ((b + (1 * sizeof(UINT)))) (0)) <= UINT_MAX)) (PreH9 : ((pw_load_lane (F) (a) (0)) >= 0)) (PreH10 : ((pw_load_lane (F) (b) (0)) >= 0)) (PreH11 : ((pw_load_lane (F) ((a + (1 * sizeof(UINT)))) (0)) >= 0)) (PreH12 : ((pw_load_lane (F) ((b + (1 * sizeof(UINT)))) (0)) >= 0)) (PreH13 : (k >= 2)) (PreH14 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) (PreH15 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH16 : (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) ))))) (PreH17 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH18 : (0 <= k)) (PreH19 : (k <= kc_pre)) ,
  ((&(( &( "v1" ) )->ₛ "s1")) # UInt  |-> (pw_load_lane (F) ((b + (1 * sizeof(UINT)))) (0)))
  **  ((&(( &( "v1" ) )->ₛ "s0")) # UInt  |-> (pw_load_lane (F) ((a + (1 * sizeof(UINT)))) (0)))
  **  (pw_data F )
  **  ((&(( &( "v0" ) )->ₛ "s1")) # UInt  |-> (pw_load_lane (F) (b) (0)))
  **  ((&(( &( "v0" ) )->ₛ "s0")) # UInt  |-> (pw_load_lane (F) (a) (0)))
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "a" ) )) # Ptr  |-> (a + (2 * sizeof(UINT))))
  **  ((( &( "k" ) )) # UInt64  |-> k)
  **  ((( &( "b" ) )) # Ptr  |-> (b + (2 * sizeof(UINT))))
  **  ((( &( "p" ) )) # Ptr  |-> p)
  **  (pw_output W (pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O)) )
|--
  “ (pw_write_window W p 2 ) ”
).

Definition pw_neon_pair_partial_solve_wit_13_pure_split_goal_1 := 
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (p: Z) (b: Z) (k: Z) (a: Z) (PreH1 : (k <= UINT64_MAX)) (PreH2 : (kc_pre <= UINT64_MAX)) (PreH3 : (k >= 0)) (PreH4 : (kc_pre >= 0)) (PreH5 : ((pw_load_lane (F) (a) (0)) <= UINT_MAX)) (PreH6 : ((pw_load_lane (F) (b) (0)) <= UINT_MAX)) (PreH7 : ((pw_load_lane (F) ((a + (1 * sizeof(UINT)))) (0)) <= UINT_MAX)) (PreH8 : ((pw_load_lane (F) ((b + (1 * sizeof(UINT)))) (0)) <= UINT_MAX)) (PreH9 : ((pw_load_lane (F) (a) (0)) >= 0)) (PreH10 : ((pw_load_lane (F) (b) (0)) >= 0)) (PreH11 : ((pw_load_lane (F) ((a + (1 * sizeof(UINT)))) (0)) >= 0)) (PreH12 : ((pw_load_lane (F) ((b + (1 * sizeof(UINT)))) (0)) >= 0)) (PreH13 : (k >= 2)) (PreH14 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) (PreH15 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH16 : (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) ))))) (PreH17 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH18 : (0 <= k)) (PreH19 : (k <= kc_pre)) ,
  ((&(( &( "v1" ) )->ₛ "s1")) # UInt  |-> (pw_load_lane (F) ((b + (1 * sizeof(UINT)))) (0)))
  **  ((&(( &( "v1" ) )->ₛ "s0")) # UInt  |-> (pw_load_lane (F) ((a + (1 * sizeof(UINT)))) (0)))
  **  (pw_data F )
  **  ((&(( &( "v0" ) )->ₛ "s1")) # UInt  |-> (pw_load_lane (F) (b) (0)))
  **  ((&(( &( "v0" ) )->ₛ "s0")) # UInt  |-> (pw_load_lane (F) (a) (0)))
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "a" ) )) # Ptr  |-> (a + (2 * sizeof(UINT))))
  **  ((( &( "k" ) )) # UInt64  |-> k)
  **  ((( &( "b" ) )) # Ptr  |-> (b + (2 * sizeof(UINT))))
  **  ((( &( "p" ) )) # Ptr  |-> p)
  **  (pw_output W (pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O)) )
|--
  “ (pw_write_window W p 2 ) ”
.

Definition pw_neon_pair_partial_solve_wit_13_aux := 
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (p: Z) (b: Z) (k: Z) (a: Z) (PreH1 : (k >= 2)) (PreH2 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) (PreH3 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH4 : (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) ))))) (PreH5 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH6 : (0 <= k)) (PreH7 : (k <= kc_pre)) ,
  ((&(( &( "v1" ) )->ₛ "s1")) # UInt  |-> (pw_load_lane (F) ((b + (1 * sizeof(UINT)))) (0)))
  **  ((&(( &( "v1" ) )->ₛ "s0")) # UInt  |-> (pw_load_lane (F) ((a + (1 * sizeof(UINT)))) (0)))
  **  (pw_data F )
  **  ((&(( &( "v0" ) )->ₛ "s1")) # UInt  |-> (pw_load_lane (F) (b) (0)))
  **  ((&(( &( "v0" ) )->ₛ "s0")) # UInt  |-> (pw_load_lane (F) (a) (0)))
  **  (pw_output W (pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O)) )
|--
  “ (pw_write_window W p 2 ) ” 
  &&  “ (k >= 2) ” 
  &&  “ (pw_pair_pre F W a_pre b_pre p_pre kc_pre ) ” 
  &&  “ (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) )))) ” 
  &&  “ (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) )))) ” 
  &&  “ (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) )))) ” 
  &&  “ (0 <= k) ” 
  &&  “ (k <= kc_pre) ”
  &&  (pw_output W (pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O)) )
  **  ((&(( &( "v0" ) )->ₛ "s0")) # UInt  |-> (pw_load_lane (F) (a) (0)))
  **  ((&(( &( "v0" ) )->ₛ "s1")) # UInt  |-> (pw_load_lane (F) (b) (0)))
  **  ((&(( &( "v1" ) )->ₛ "s1")) # UInt  |-> (pw_load_lane (F) ((b + (1 * sizeof(UINT)))) (0)))
  **  ((&(( &( "v1" ) )->ₛ "s0")) # UInt  |-> (pw_load_lane (F) ((a + (1 * sizeof(UINT)))) (0)))
  **  (pw_data F )
.

Definition pw_neon_pair_partial_solve_wit_13 := pw_neon_pair_partial_solve_wit_13_pure -> pw_neon_pair_partial_solve_wit_13_aux.

Definition pw_neon_pair_partial_solve_wit_14_pure := 
(
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (p: Z) (b: Z) (k: Z) (a: Z) (PreH1 : (k >= 2)) (PreH2 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) (PreH3 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH4 : (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) ))))) (PreH5 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH6 : (0 <= k)) (PreH7 : (k <= kc_pre)) ,
  (pw_output W (pw_write_pair ((pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O))) (p) ((pw_load_lane (F) (a) (0))) ((pw_load_lane (F) (b) (0)))) )
  **  ((&(( &( "v0" ) )->ₛ "s0")) # UInt  |-> (pw_load_lane (F) (a) (0)))
  **  ((&(( &( "v0" ) )->ₛ "s1")) # UInt  |-> (pw_load_lane (F) (b) (0)))
  **  ((&(( &( "v1" ) )->ₛ "s1")) # UInt  |-> (pw_load_lane (F) ((b + (1 * sizeof(UINT)))) (0)))
  **  ((&(( &( "v1" ) )->ₛ "s0")) # UInt  |-> (pw_load_lane (F) ((a + (1 * sizeof(UINT)))) (0)))
  **  (pw_data F )
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "a" ) )) # Ptr  |-> (a + (2 * sizeof(UINT))))
  **  ((( &( "k" ) )) # UInt64  |-> k)
  **  ((( &( "b" ) )) # Ptr  |-> (b + (2 * sizeof(UINT))))
  **  ((( &( "p" ) )) # Ptr  |-> p)
|--
  “ (pw_write_window W (p + (2 * sizeof(UINT))) 2 ) ”
) \/
(
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (p: Z) (b: Z) (k: Z) (a: Z) (PreH1 : (k <= UINT64_MAX)) (PreH2 : (kc_pre <= UINT64_MAX)) (PreH3 : (k >= 0)) (PreH4 : (kc_pre >= 0)) (PreH5 : ((pw_load_lane (F) ((a + (1 * sizeof(UINT)))) (0)) <= UINT_MAX)) (PreH6 : ((pw_load_lane (F) ((b + (1 * sizeof(UINT)))) (0)) <= UINT_MAX)) (PreH7 : ((pw_load_lane (F) (b) (0)) <= UINT_MAX)) (PreH8 : ((pw_load_lane (F) (a) (0)) <= UINT_MAX)) (PreH9 : ((pw_load_lane (F) ((a + (1 * sizeof(UINT)))) (0)) >= 0)) (PreH10 : ((pw_load_lane (F) ((b + (1 * sizeof(UINT)))) (0)) >= 0)) (PreH11 : ((pw_load_lane (F) (b) (0)) >= 0)) (PreH12 : ((pw_load_lane (F) (a) (0)) >= 0)) (PreH13 : (k >= 2)) (PreH14 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) (PreH15 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH16 : (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) ))))) (PreH17 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH18 : (0 <= k)) (PreH19 : (k <= kc_pre)) ,
  (pw_output W (pw_write_pair ((pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O))) (p) ((pw_load_lane (F) (a) (0))) ((pw_load_lane (F) (b) (0)))) )
  **  ((&(( &( "v0" ) )->ₛ "s0")) # UInt  |-> (pw_load_lane (F) (a) (0)))
  **  ((&(( &( "v0" ) )->ₛ "s1")) # UInt  |-> (pw_load_lane (F) (b) (0)))
  **  ((&(( &( "v1" ) )->ₛ "s1")) # UInt  |-> (pw_load_lane (F) ((b + (1 * sizeof(UINT)))) (0)))
  **  ((&(( &( "v1" ) )->ₛ "s0")) # UInt  |-> (pw_load_lane (F) ((a + (1 * sizeof(UINT)))) (0)))
  **  (pw_data F )
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "a" ) )) # Ptr  |-> (a + (2 * sizeof(UINT))))
  **  ((( &( "k" ) )) # UInt64  |-> k)
  **  ((( &( "b" ) )) # Ptr  |-> (b + (2 * sizeof(UINT))))
  **  ((( &( "p" ) )) # Ptr  |-> p)
|--
  “ (pw_write_window W (p + (2 * sizeof(UINT))) 2 ) ”
).

Definition pw_neon_pair_partial_solve_wit_14_pure_split_goal_1 := 
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (p: Z) (b: Z) (k: Z) (a: Z) (PreH1 : (k <= UINT64_MAX)) (PreH2 : (kc_pre <= UINT64_MAX)) (PreH3 : (k >= 0)) (PreH4 : (kc_pre >= 0)) (PreH5 : ((pw_load_lane (F) ((a + (1 * sizeof(UINT)))) (0)) <= UINT_MAX)) (PreH6 : ((pw_load_lane (F) ((b + (1 * sizeof(UINT)))) (0)) <= UINT_MAX)) (PreH7 : ((pw_load_lane (F) (b) (0)) <= UINT_MAX)) (PreH8 : ((pw_load_lane (F) (a) (0)) <= UINT_MAX)) (PreH9 : ((pw_load_lane (F) ((a + (1 * sizeof(UINT)))) (0)) >= 0)) (PreH10 : ((pw_load_lane (F) ((b + (1 * sizeof(UINT)))) (0)) >= 0)) (PreH11 : ((pw_load_lane (F) (b) (0)) >= 0)) (PreH12 : ((pw_load_lane (F) (a) (0)) >= 0)) (PreH13 : (k >= 2)) (PreH14 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) (PreH15 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH16 : (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) ))))) (PreH17 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH18 : (0 <= k)) (PreH19 : (k <= kc_pre)) ,
  (pw_output W (pw_write_pair ((pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O))) (p) ((pw_load_lane (F) (a) (0))) ((pw_load_lane (F) (b) (0)))) )
  **  ((&(( &( "v0" ) )->ₛ "s0")) # UInt  |-> (pw_load_lane (F) (a) (0)))
  **  ((&(( &( "v0" ) )->ₛ "s1")) # UInt  |-> (pw_load_lane (F) (b) (0)))
  **  ((&(( &( "v1" ) )->ₛ "s1")) # UInt  |-> (pw_load_lane (F) ((b + (1 * sizeof(UINT)))) (0)))
  **  ((&(( &( "v1" ) )->ₛ "s0")) # UInt  |-> (pw_load_lane (F) ((a + (1 * sizeof(UINT)))) (0)))
  **  (pw_data F )
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "a" ) )) # Ptr  |-> (a + (2 * sizeof(UINT))))
  **  ((( &( "k" ) )) # UInt64  |-> k)
  **  ((( &( "b" ) )) # Ptr  |-> (b + (2 * sizeof(UINT))))
  **  ((( &( "p" ) )) # Ptr  |-> p)
|--
  “ (pw_write_window W (p + (2 * sizeof(UINT))) 2 ) ”
.

Definition pw_neon_pair_partial_solve_wit_14_aux := 
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (p: Z) (b: Z) (k: Z) (a: Z) (PreH1 : (k >= 2)) (PreH2 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) (PreH3 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH4 : (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) ))))) (PreH5 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH6 : (0 <= k)) (PreH7 : (k <= kc_pre)) ,
  (pw_output W (pw_write_pair ((pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O))) (p) ((pw_load_lane (F) (a) (0))) ((pw_load_lane (F) (b) (0)))) )
  **  ((&(( &( "v0" ) )->ₛ "s0")) # UInt  |-> (pw_load_lane (F) (a) (0)))
  **  ((&(( &( "v0" ) )->ₛ "s1")) # UInt  |-> (pw_load_lane (F) (b) (0)))
  **  ((&(( &( "v1" ) )->ₛ "s1")) # UInt  |-> (pw_load_lane (F) ((b + (1 * sizeof(UINT)))) (0)))
  **  ((&(( &( "v1" ) )->ₛ "s0")) # UInt  |-> (pw_load_lane (F) ((a + (1 * sizeof(UINT)))) (0)))
  **  (pw_data F )
|--
  “ (pw_write_window W (p + (2 * sizeof(UINT))) 2 ) ” 
  &&  “ (k >= 2) ” 
  &&  “ (pw_pair_pre F W a_pre b_pre p_pre kc_pre ) ” 
  &&  “ (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) )))) ” 
  &&  “ (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) )))) ” 
  &&  “ (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) )))) ” 
  &&  “ (0 <= k) ” 
  &&  “ (k <= kc_pre) ”
  &&  (pw_output W (pw_write_pair ((pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O))) ((pw_offset (p_pre) ((8 * (kc_pre - k ) )))) ((pw_load_lane (F) ((pw_offset (a_pre) ((4 * (kc_pre - k ) )))) (0))) ((pw_load_lane (F) ((pw_offset (b_pre) ((4 * (kc_pre - k ) )))) (0)))) )
  **  ((&(( &( "v1" ) )->ₛ "s0")) # UInt  |-> (pw_load_lane (F) ((a + (1 * sizeof(UINT)))) (0)))
  **  ((&(( &( "v1" ) )->ₛ "s1")) # UInt  |-> (pw_load_lane (F) ((b + (1 * sizeof(UINT)))) (0)))
  **  ((&(( &( "v0" ) )->ₛ "s0")) # UInt  |-> (pw_load_lane (F) (a) (0)))
  **  ((&(( &( "v0" ) )->ₛ "s1")) # UInt  |-> (pw_load_lane (F) (b) (0)))
  **  (pw_data F )
.

Definition pw_neon_pair_partial_solve_wit_14 := pw_neon_pair_partial_solve_wit_14_pure -> pw_neon_pair_partial_solve_wit_14_aux.

Definition pw_neon_pair_partial_solve_wit_15_pure := 
(
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (x11: Z) (x10: Z) (x01: Z) (x00: Z) (p: Z) (b: Z) (k: Z) (a: Z) (PreH1 : (k <> 0)) (PreH2 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) (PreH3 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH4 : (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) ))))) (PreH5 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH6 : (0 <= k)) (PreH7 : (k <= kc_pre)) ,
  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a)
  **  ((( &( "k" ) )) # UInt64  |-> k)
  **  ((( &( "b" ) )) # Ptr  |-> b)
  **  ((( &( "p" ) )) # Ptr  |-> p)
  **  (pw_data F )
  **  (pw_output W (pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O)) )
  **  ((&(( &( "v0" ) )->ₛ "s0")) # UInt  |-> x00)
  **  ((&(( &( "v0" ) )->ₛ "s1")) # UInt  |-> x01)
  **  ((&(( &( "v1" ) )->ₛ "s0")) # UInt  |-> x10)
  **  ((&(( &( "v1" ) )->ₛ "s1")) # UInt  |-> x11)
|--
  “ (pw_window F a 1 ) ”
) \/
(
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (x11: Z) (x10: Z) (x01: Z) (x00: Z) (p: Z) (b: Z) (k: Z) (a: Z) (PreH1 : (k <= UINT64_MAX)) (PreH2 : (kc_pre <= UINT64_MAX)) (PreH3 : (k >= 0)) (PreH4 : (kc_pre >= 0)) (PreH5 : (x11 <= UINT_MAX)) (PreH6 : (x10 <= UINT_MAX)) (PreH7 : (x01 <= UINT_MAX)) (PreH8 : (x00 <= UINT_MAX)) (PreH9 : (x11 >= 0)) (PreH10 : (x10 >= 0)) (PreH11 : (x01 >= 0)) (PreH12 : (x00 >= 0)) (PreH13 : (k <> 0)) (PreH14 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) (PreH15 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH16 : (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) ))))) (PreH17 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH18 : (0 <= k)) (PreH19 : (k <= kc_pre)) ,
  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a)
  **  ((( &( "k" ) )) # UInt64  |-> k)
  **  ((( &( "b" ) )) # Ptr  |-> b)
  **  ((( &( "p" ) )) # Ptr  |-> p)
  **  (pw_data F )
  **  (pw_output W (pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O)) )
  **  ((&(( &( "v0" ) )->ₛ "s0")) # UInt  |-> x00)
  **  ((&(( &( "v0" ) )->ₛ "s1")) # UInt  |-> x01)
  **  ((&(( &( "v1" ) )->ₛ "s0")) # UInt  |-> x10)
  **  ((&(( &( "v1" ) )->ₛ "s1")) # UInt  |-> x11)
|--
  “ (pw_window F a 1 ) ”
).

Definition pw_neon_pair_partial_solve_wit_15_pure_split_goal_1 := 
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (x11: Z) (x10: Z) (x01: Z) (x00: Z) (p: Z) (b: Z) (k: Z) (a: Z) (PreH1 : (k <= UINT64_MAX)) (PreH2 : (kc_pre <= UINT64_MAX)) (PreH3 : (k >= 0)) (PreH4 : (kc_pre >= 0)) (PreH5 : (x11 <= UINT_MAX)) (PreH6 : (x10 <= UINT_MAX)) (PreH7 : (x01 <= UINT_MAX)) (PreH8 : (x00 <= UINT_MAX)) (PreH9 : (x11 >= 0)) (PreH10 : (x10 >= 0)) (PreH11 : (x01 >= 0)) (PreH12 : (x00 >= 0)) (PreH13 : (k <> 0)) (PreH14 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) (PreH15 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH16 : (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) ))))) (PreH17 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH18 : (0 <= k)) (PreH19 : (k <= kc_pre)) ,
  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a)
  **  ((( &( "k" ) )) # UInt64  |-> k)
  **  ((( &( "b" ) )) # Ptr  |-> b)
  **  ((( &( "p" ) )) # Ptr  |-> p)
  **  (pw_data F )
  **  (pw_output W (pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O)) )
  **  ((&(( &( "v0" ) )->ₛ "s0")) # UInt  |-> x00)
  **  ((&(( &( "v0" ) )->ₛ "s1")) # UInt  |-> x01)
  **  ((&(( &( "v1" ) )->ₛ "s0")) # UInt  |-> x10)
  **  ((&(( &( "v1" ) )->ₛ "s1")) # UInt  |-> x11)
|--
  “ (pw_window F a 1 ) ”
.

Definition pw_neon_pair_partial_solve_wit_15_aux := 
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (x11: Z) (x10: Z) (x01: Z) (x00: Z) (p: Z) (b: Z) (k: Z) (a: Z) (PreH1 : (k <> 0)) (PreH2 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) (PreH3 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH4 : (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) ))))) (PreH5 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH6 : (0 <= k)) (PreH7 : (k <= kc_pre)) ,
  (pw_data F )
  **  (pw_output W (pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O)) )
  **  ((&(( &( "v0" ) )->ₛ "s0")) # UInt  |-> x00)
  **  ((&(( &( "v0" ) )->ₛ "s1")) # UInt  |-> x01)
  **  ((&(( &( "v1" ) )->ₛ "s0")) # UInt  |-> x10)
  **  ((&(( &( "v1" ) )->ₛ "s1")) # UInt  |-> x11)
|--
  “ (pw_window F a 1 ) ” 
  &&  “ (k <> 0) ” 
  &&  “ (pw_pair_pre F W a_pre b_pre p_pre kc_pre ) ” 
  &&  “ (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) )))) ” 
  &&  “ (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) )))) ” 
  &&  “ (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) )))) ” 
  &&  “ (0 <= k) ” 
  &&  “ (k <= kc_pre) ”
  &&  (pw_data F )
  **  ((&(( &( "v0" ) )->ₛ "s0")) # UInt  |-> x00)
  **  ((&(( &( "v0" ) )->ₛ "s1")) # UInt  |-> x01)
  **  (pw_output W (pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O)) )
  **  ((&(( &( "v1" ) )->ₛ "s0")) # UInt  |-> x10)
  **  ((&(( &( "v1" ) )->ₛ "s1")) # UInt  |-> x11)
.

Definition pw_neon_pair_partial_solve_wit_15 := pw_neon_pair_partial_solve_wit_15_pure -> pw_neon_pair_partial_solve_wit_15_aux.

Definition pw_neon_pair_partial_solve_wit_16 := 
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (x11: Z) (x10: Z) (x01: Z) (p: Z) (b: Z) (k: Z) (a: Z) (retval: Z) (PreH1 : (k <> 0)) (PreH2 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) (PreH3 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH4 : (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) ))))) (PreH5 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH6 : (0 <= k)) (PreH7 : (k <= kc_pre)) ,
  (UndefStructPreduint32x2_t ( &( "v0" ) ) )
  **  (pw_data F )
  **  ((&((retval)  # "uint32x2_t" ->ₛ "s0")) # UInt  |-> (pw_load_lane (F) (a) (0)))
  **  ((&((retval)  # "uint32x2_t" ->ₛ "s1")) # UInt  |-> x01)
  **  (pw_output W (pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O)) )
  **  ((&(( &( "v1" ) )->ₛ "s0")) # UInt  |-> x10)
  **  ((&(( &( "v1" ) )->ₛ "s1")) # UInt  |-> x11)
|--
  “ (k <> 0) ” 
  &&  “ (pw_pair_pre F W a_pre b_pre p_pre kc_pre ) ” 
  &&  “ (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) )))) ” 
  &&  “ (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) )))) ” 
  &&  “ (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) )))) ” 
  &&  “ (0 <= k) ” 
  &&  “ (k <= kc_pre) ”
  &&  ((&(( &( "v0" ) )->ₛ "s1")) # UInt  |->_)
  **  ((&((retval)  # "uint32x2_t" ->ₛ "s1")) # UInt  |-> x01)
  **  ((&(( &( "v0" ) )->ₛ "s0")) # UInt  |->_)
  **  ((&((retval)  # "uint32x2_t" ->ₛ "s0")) # UInt  |-> (pw_load_lane (F) (a) (0)))
  **  (pw_data F )
  **  (pw_output W (pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O)) )
  **  ((&(( &( "v1" ) )->ₛ "s0")) # UInt  |-> x10)
  **  ((&(( &( "v1" ) )->ₛ "s1")) # UInt  |-> x11)
.

Definition pw_neon_pair_partial_solve_wit_17_pure := 
(
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (x11: Z) (x10: Z) (x01: Z) (p: Z) (b: Z) (k: Z) (a: Z) (PreH1 : (k <> 0)) (PreH2 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) (PreH3 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH4 : (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) ))))) (PreH5 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH6 : (0 <= k)) (PreH7 : (k <= kc_pre)) ,
  ((&(( &( "v0" ) )->ₛ "s1")) # UInt  |-> x01)
  **  ((&(( &( "v0" ) )->ₛ "s0")) # UInt  |-> (pw_load_lane (F) (a) (0)))
  **  (pw_data F )
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "a" ) )) # Ptr  |-> (a + (1 * sizeof(UINT))))
  **  ((( &( "k" ) )) # UInt64  |-> k)
  **  ((( &( "b" ) )) # Ptr  |-> b)
  **  ((( &( "p" ) )) # Ptr  |-> p)
  **  (pw_output W (pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O)) )
  **  ((&(( &( "v1" ) )->ₛ "s0")) # UInt  |-> x10)
  **  ((&(( &( "v1" ) )->ₛ "s1")) # UInt  |-> x11)
|--
  “ (pw_window F b 1 ) ”
) \/
(
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (x11: Z) (x10: Z) (x01: Z) (p: Z) (b: Z) (k: Z) (a: Z) (PreH1 : (k <= UINT64_MAX)) (PreH2 : (kc_pre <= UINT64_MAX)) (PreH3 : (k >= 0)) (PreH4 : (kc_pre >= 0)) (PreH5 : (x11 <= UINT_MAX)) (PreH6 : (x10 <= UINT_MAX)) (PreH7 : ((pw_load_lane (F) (a) (0)) <= UINT_MAX)) (PreH8 : (x01 <= UINT_MAX)) (PreH9 : (x11 >= 0)) (PreH10 : (x10 >= 0)) (PreH11 : ((pw_load_lane (F) (a) (0)) >= 0)) (PreH12 : (x01 >= 0)) (PreH13 : (k <> 0)) (PreH14 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) (PreH15 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH16 : (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) ))))) (PreH17 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH18 : (0 <= k)) (PreH19 : (k <= kc_pre)) ,
  ((&(( &( "v0" ) )->ₛ "s1")) # UInt  |-> x01)
  **  ((&(( &( "v0" ) )->ₛ "s0")) # UInt  |-> (pw_load_lane (F) (a) (0)))
  **  (pw_data F )
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "a" ) )) # Ptr  |-> (a + (1 * sizeof(UINT))))
  **  ((( &( "k" ) )) # UInt64  |-> k)
  **  ((( &( "b" ) )) # Ptr  |-> b)
  **  ((( &( "p" ) )) # Ptr  |-> p)
  **  (pw_output W (pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O)) )
  **  ((&(( &( "v1" ) )->ₛ "s0")) # UInt  |-> x10)
  **  ((&(( &( "v1" ) )->ₛ "s1")) # UInt  |-> x11)
|--
  “ (pw_window F b 1 ) ”
).

Definition pw_neon_pair_partial_solve_wit_17_pure_split_goal_1 := 
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (x11: Z) (x10: Z) (x01: Z) (p: Z) (b: Z) (k: Z) (a: Z) (PreH1 : (k <= UINT64_MAX)) (PreH2 : (kc_pre <= UINT64_MAX)) (PreH3 : (k >= 0)) (PreH4 : (kc_pre >= 0)) (PreH5 : (x11 <= UINT_MAX)) (PreH6 : (x10 <= UINT_MAX)) (PreH7 : ((pw_load_lane (F) (a) (0)) <= UINT_MAX)) (PreH8 : (x01 <= UINT_MAX)) (PreH9 : (x11 >= 0)) (PreH10 : (x10 >= 0)) (PreH11 : ((pw_load_lane (F) (a) (0)) >= 0)) (PreH12 : (x01 >= 0)) (PreH13 : (k <> 0)) (PreH14 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) (PreH15 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH16 : (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) ))))) (PreH17 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH18 : (0 <= k)) (PreH19 : (k <= kc_pre)) ,
  ((&(( &( "v0" ) )->ₛ "s1")) # UInt  |-> x01)
  **  ((&(( &( "v0" ) )->ₛ "s0")) # UInt  |-> (pw_load_lane (F) (a) (0)))
  **  (pw_data F )
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "a" ) )) # Ptr  |-> (a + (1 * sizeof(UINT))))
  **  ((( &( "k" ) )) # UInt64  |-> k)
  **  ((( &( "b" ) )) # Ptr  |-> b)
  **  ((( &( "p" ) )) # Ptr  |-> p)
  **  (pw_output W (pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O)) )
  **  ((&(( &( "v1" ) )->ₛ "s0")) # UInt  |-> x10)
  **  ((&(( &( "v1" ) )->ₛ "s1")) # UInt  |-> x11)
|--
  “ (pw_window F b 1 ) ”
.

Definition pw_neon_pair_partial_solve_wit_17_aux := 
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (x11: Z) (x10: Z) (x01: Z) (p: Z) (b: Z) (k: Z) (a: Z) (PreH1 : (k <> 0)) (PreH2 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) (PreH3 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH4 : (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) ))))) (PreH5 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH6 : (0 <= k)) (PreH7 : (k <= kc_pre)) ,
  ((&(( &( "v0" ) )->ₛ "s1")) # UInt  |-> x01)
  **  ((&(( &( "v0" ) )->ₛ "s0")) # UInt  |-> (pw_load_lane (F) (a) (0)))
  **  (pw_data F )
  **  (pw_output W (pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O)) )
  **  ((&(( &( "v1" ) )->ₛ "s0")) # UInt  |-> x10)
  **  ((&(( &( "v1" ) )->ₛ "s1")) # UInt  |-> x11)
|--
  “ (pw_window F b 1 ) ” 
  &&  “ (k <> 0) ” 
  &&  “ (pw_pair_pre F W a_pre b_pre p_pre kc_pre ) ” 
  &&  “ (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) )))) ” 
  &&  “ (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) )))) ” 
  &&  “ (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) )))) ” 
  &&  “ (0 <= k) ” 
  &&  “ (k <= kc_pre) ”
  &&  (pw_data F )
  **  ((&(( &( "v0" ) )->ₛ "s0")) # UInt  |-> (pw_load_lane (F) (a) (0)))
  **  ((&(( &( "v0" ) )->ₛ "s1")) # UInt  |-> x01)
  **  (pw_output W (pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O)) )
  **  ((&(( &( "v1" ) )->ₛ "s0")) # UInt  |-> x10)
  **  ((&(( &( "v1" ) )->ₛ "s1")) # UInt  |-> x11)
.

Definition pw_neon_pair_partial_solve_wit_17 := pw_neon_pair_partial_solve_wit_17_pure -> pw_neon_pair_partial_solve_wit_17_aux.

Definition pw_neon_pair_partial_solve_wit_18 := 
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (x11: Z) (x10: Z) (p: Z) (b: Z) (k: Z) (a: Z) (retval: Z) (PreH1 : (k <> 0)) (PreH2 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) (PreH3 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH4 : (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) ))))) (PreH5 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH6 : (0 <= k)) (PreH7 : (k <= kc_pre)) ,
  (UndefStructPreduint32x2_t ( &( "v0" ) ) )
  **  (pw_data F )
  **  ((&((retval)  # "uint32x2_t" ->ₛ "s0")) # UInt  |-> (pw_load_lane (F) (a) (0)))
  **  ((&((retval)  # "uint32x2_t" ->ₛ "s1")) # UInt  |-> (pw_load_lane (F) (b) (0)))
  **  (pw_output W (pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O)) )
  **  ((&(( &( "v1" ) )->ₛ "s0")) # UInt  |-> x10)
  **  ((&(( &( "v1" ) )->ₛ "s1")) # UInt  |-> x11)
|--
  “ (k <> 0) ” 
  &&  “ (pw_pair_pre F W a_pre b_pre p_pre kc_pre ) ” 
  &&  “ (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) )))) ” 
  &&  “ (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) )))) ” 
  &&  “ (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) )))) ” 
  &&  “ (0 <= k) ” 
  &&  “ (k <= kc_pre) ”
  &&  ((&(( &( "v0" ) )->ₛ "s1")) # UInt  |->_)
  **  ((&((retval)  # "uint32x2_t" ->ₛ "s1")) # UInt  |-> (pw_load_lane (F) (b) (0)))
  **  ((&(( &( "v0" ) )->ₛ "s0")) # UInt  |->_)
  **  ((&((retval)  # "uint32x2_t" ->ₛ "s0")) # UInt  |-> (pw_load_lane (F) (a) (0)))
  **  (pw_data F )
  **  (pw_output W (pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O)) )
  **  ((&(( &( "v1" ) )->ₛ "s0")) # UInt  |-> x10)
  **  ((&(( &( "v1" ) )->ₛ "s1")) # UInt  |-> x11)
.

Definition pw_neon_pair_partial_solve_wit_19_pure := 
(
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (x11: Z) (x10: Z) (p: Z) (b: Z) (k: Z) (a: Z) (PreH1 : (k <> 0)) (PreH2 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) (PreH3 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH4 : (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) ))))) (PreH5 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH6 : (0 <= k)) (PreH7 : (k <= kc_pre)) ,
  ((&(( &( "v0" ) )->ₛ "s1")) # UInt  |-> (pw_load_lane (F) (b) (0)))
  **  ((&(( &( "v0" ) )->ₛ "s0")) # UInt  |-> (pw_load_lane (F) (a) (0)))
  **  (pw_data F )
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "a" ) )) # Ptr  |-> (a + (1 * sizeof(UINT))))
  **  ((( &( "k" ) )) # UInt64  |-> k)
  **  ((( &( "b" ) )) # Ptr  |-> (b + (1 * sizeof(UINT))))
  **  ((( &( "p" ) )) # Ptr  |-> p)
  **  (pw_output W (pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O)) )
  **  ((&(( &( "v1" ) )->ₛ "s0")) # UInt  |-> x10)
  **  ((&(( &( "v1" ) )->ₛ "s1")) # UInt  |-> x11)
|--
  “ (pw_write_window W p 2 ) ”
) \/
(
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (x11: Z) (x10: Z) (p: Z) (b: Z) (k: Z) (a: Z) (PreH1 : (k <= UINT64_MAX)) (PreH2 : (kc_pre <= UINT64_MAX)) (PreH3 : (k >= 0)) (PreH4 : (kc_pre >= 0)) (PreH5 : (x11 <= UINT_MAX)) (PreH6 : (x10 <= UINT_MAX)) (PreH7 : ((pw_load_lane (F) (a) (0)) <= UINT_MAX)) (PreH8 : ((pw_load_lane (F) (b) (0)) <= UINT_MAX)) (PreH9 : (x11 >= 0)) (PreH10 : (x10 >= 0)) (PreH11 : ((pw_load_lane (F) (a) (0)) >= 0)) (PreH12 : ((pw_load_lane (F) (b) (0)) >= 0)) (PreH13 : (k <> 0)) (PreH14 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) (PreH15 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH16 : (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) ))))) (PreH17 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH18 : (0 <= k)) (PreH19 : (k <= kc_pre)) ,
  ((&(( &( "v0" ) )->ₛ "s1")) # UInt  |-> (pw_load_lane (F) (b) (0)))
  **  ((&(( &( "v0" ) )->ₛ "s0")) # UInt  |-> (pw_load_lane (F) (a) (0)))
  **  (pw_data F )
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "a" ) )) # Ptr  |-> (a + (1 * sizeof(UINT))))
  **  ((( &( "k" ) )) # UInt64  |-> k)
  **  ((( &( "b" ) )) # Ptr  |-> (b + (1 * sizeof(UINT))))
  **  ((( &( "p" ) )) # Ptr  |-> p)
  **  (pw_output W (pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O)) )
  **  ((&(( &( "v1" ) )->ₛ "s0")) # UInt  |-> x10)
  **  ((&(( &( "v1" ) )->ₛ "s1")) # UInt  |-> x11)
|--
  “ (pw_write_window W p 2 ) ”
).

Definition pw_neon_pair_partial_solve_wit_19_pure_split_goal_1 := 
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (x11: Z) (x10: Z) (p: Z) (b: Z) (k: Z) (a: Z) (PreH1 : (k <= UINT64_MAX)) (PreH2 : (kc_pre <= UINT64_MAX)) (PreH3 : (k >= 0)) (PreH4 : (kc_pre >= 0)) (PreH5 : (x11 <= UINT_MAX)) (PreH6 : (x10 <= UINT_MAX)) (PreH7 : ((pw_load_lane (F) (a) (0)) <= UINT_MAX)) (PreH8 : ((pw_load_lane (F) (b) (0)) <= UINT_MAX)) (PreH9 : (x11 >= 0)) (PreH10 : (x10 >= 0)) (PreH11 : ((pw_load_lane (F) (a) (0)) >= 0)) (PreH12 : ((pw_load_lane (F) (b) (0)) >= 0)) (PreH13 : (k <> 0)) (PreH14 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) (PreH15 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH16 : (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) ))))) (PreH17 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH18 : (0 <= k)) (PreH19 : (k <= kc_pre)) ,
  ((&(( &( "v0" ) )->ₛ "s1")) # UInt  |-> (pw_load_lane (F) (b) (0)))
  **  ((&(( &( "v0" ) )->ₛ "s0")) # UInt  |-> (pw_load_lane (F) (a) (0)))
  **  (pw_data F )
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "a" ) )) # Ptr  |-> (a + (1 * sizeof(UINT))))
  **  ((( &( "k" ) )) # UInt64  |-> k)
  **  ((( &( "b" ) )) # Ptr  |-> (b + (1 * sizeof(UINT))))
  **  ((( &( "p" ) )) # Ptr  |-> p)
  **  (pw_output W (pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O)) )
  **  ((&(( &( "v1" ) )->ₛ "s0")) # UInt  |-> x10)
  **  ((&(( &( "v1" ) )->ₛ "s1")) # UInt  |-> x11)
|--
  “ (pw_write_window W p 2 ) ”
.

Definition pw_neon_pair_partial_solve_wit_19_aux := 
forall (p_pre: Z) (b_pre: Z) (a_pre: Z) (kc_pre: Z) (O: PWOutput) (W: (@list Z)) (F: PWMap) (x11: Z) (x10: Z) (p: Z) (b: Z) (k: Z) (a: Z) (PreH1 : (k <> 0)) (PreH2 : (pw_pair_pre F W a_pre b_pre p_pre kc_pre )) (PreH3 : (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) ))))) (PreH4 : (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) ))))) (PreH5 : (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) ))))) (PreH6 : (0 <= k)) (PreH7 : (k <= kc_pre)) ,
  ((&(( &( "v0" ) )->ₛ "s1")) # UInt  |-> (pw_load_lane (F) (b) (0)))
  **  ((&(( &( "v0" ) )->ₛ "s0")) # UInt  |-> (pw_load_lane (F) (a) (0)))
  **  (pw_data F )
  **  (pw_output W (pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O)) )
  **  ((&(( &( "v1" ) )->ₛ "s0")) # UInt  |-> x10)
  **  ((&(( &( "v1" ) )->ₛ "s1")) # UInt  |-> x11)
|--
  “ (pw_write_window W p 2 ) ” 
  &&  “ (k <> 0) ” 
  &&  “ (pw_pair_pre F W a_pre b_pre p_pre kc_pre ) ” 
  &&  “ (a = (pw_offset (a_pre) ((4 * (kc_pre - k ) )))) ” 
  &&  “ (b = (pw_offset (b_pre) ((4 * (kc_pre - k ) )))) ” 
  &&  “ (p = (pw_offset (p_pre) ((8 * (kc_pre - k ) )))) ” 
  &&  “ (0 <= k) ” 
  &&  “ (k <= kc_pre) ”
  &&  (pw_output W (pw_pair_run ((kc_pre - k )) (F) (a_pre) (b_pre) (p_pre) (O)) )
  **  ((&(( &( "v0" ) )->ₛ "s0")) # UInt  |-> (pw_load_lane (F) (a) (0)))
  **  ((&(( &( "v0" ) )->ₛ "s1")) # UInt  |-> (pw_load_lane (F) (b) (0)))
  **  (pw_data F )
  **  ((&(( &( "v1" ) )->ₛ "s0")) # UInt  |-> x10)
  **  ((&(( &( "v1" ) )->ₛ "s1")) # UInt  |-> x11)
.

Definition pw_neon_pair_partial_solve_wit_19 := pw_neon_pair_partial_solve_wit_19_pure -> pw_neon_pair_partial_solve_wit_19_aux.

Module Type VC_Correct.


Axiom proof_of_pw_neon_pair_safety_wit_1 : pw_neon_pair_safety_wit_1.
Axiom proof_of_pw_neon_pair_safety_wit_2 : pw_neon_pair_safety_wit_2.
Axiom proof_of_pw_neon_pair_safety_wit_3 : pw_neon_pair_safety_wit_3.
Axiom proof_of_pw_neon_pair_safety_wit_4 : pw_neon_pair_safety_wit_4.
Axiom proof_of_pw_neon_pair_safety_wit_5 : pw_neon_pair_safety_wit_5.
Axiom proof_of_pw_neon_pair_safety_wit_6 : pw_neon_pair_safety_wit_6.
Axiom proof_of_pw_neon_pair_safety_wit_7 : pw_neon_pair_safety_wit_7.
Axiom proof_of_pw_neon_pair_safety_wit_8 : pw_neon_pair_safety_wit_8.
Axiom proof_of_pw_neon_pair_safety_wit_9 : pw_neon_pair_safety_wit_9.
Axiom proof_of_pw_neon_pair_safety_wit_10 : pw_neon_pair_safety_wit_10.
Axiom proof_of_pw_neon_pair_safety_wit_11 : pw_neon_pair_safety_wit_11.
Axiom proof_of_pw_neon_pair_safety_wit_12 : pw_neon_pair_safety_wit_12.
Axiom proof_of_pw_neon_pair_safety_wit_13 : pw_neon_pair_safety_wit_13.
Axiom proof_of_pw_neon_pair_safety_wit_14 : pw_neon_pair_safety_wit_14.
Axiom proof_of_pw_neon_pair_safety_wit_15 : pw_neon_pair_safety_wit_15.
Axiom proof_of_pw_neon_pair_entail_wit_1 : pw_neon_pair_entail_wit_1.
Axiom proof_of_pw_neon_pair_entail_wit_2 : pw_neon_pair_entail_wit_2.
Axiom proof_of_pw_neon_pair_entail_wit_3 : pw_neon_pair_entail_wit_3.
Axiom proof_of_pw_neon_pair_entail_wit_4 : pw_neon_pair_entail_wit_4.
Axiom proof_of_pw_neon_pair_return_wit_1 : pw_neon_pair_return_wit_1.
Axiom proof_of_pw_neon_pair_partial_solve_wit_1 : pw_neon_pair_partial_solve_wit_1.
Axiom proof_of_pw_neon_pair_partial_solve_wit_2 : pw_neon_pair_partial_solve_wit_2.
Axiom proof_of_pw_neon_pair_partial_solve_wit_3 : pw_neon_pair_partial_solve_wit_3.
Axiom proof_of_pw_neon_pair_partial_solve_wit_4 : pw_neon_pair_partial_solve_wit_4.
Axiom proof_of_pw_neon_pair_partial_solve_wit_5_pure : pw_neon_pair_partial_solve_wit_5_pure.
Axiom proof_of_pw_neon_pair_partial_solve_wit_5 : pw_neon_pair_partial_solve_wit_5.
Axiom proof_of_pw_neon_pair_partial_solve_wit_6 : pw_neon_pair_partial_solve_wit_6.
Axiom proof_of_pw_neon_pair_partial_solve_wit_7_pure : pw_neon_pair_partial_solve_wit_7_pure.
Axiom proof_of_pw_neon_pair_partial_solve_wit_7 : pw_neon_pair_partial_solve_wit_7.
Axiom proof_of_pw_neon_pair_partial_solve_wit_8 : pw_neon_pair_partial_solve_wit_8.
Axiom proof_of_pw_neon_pair_partial_solve_wit_9_pure : pw_neon_pair_partial_solve_wit_9_pure.
Axiom proof_of_pw_neon_pair_partial_solve_wit_9 : pw_neon_pair_partial_solve_wit_9.
Axiom proof_of_pw_neon_pair_partial_solve_wit_10 : pw_neon_pair_partial_solve_wit_10.
Axiom proof_of_pw_neon_pair_partial_solve_wit_11_pure : pw_neon_pair_partial_solve_wit_11_pure.
Axiom proof_of_pw_neon_pair_partial_solve_wit_11 : pw_neon_pair_partial_solve_wit_11.
Axiom proof_of_pw_neon_pair_partial_solve_wit_12 : pw_neon_pair_partial_solve_wit_12.
Axiom proof_of_pw_neon_pair_partial_solve_wit_13_pure : pw_neon_pair_partial_solve_wit_13_pure.
Axiom proof_of_pw_neon_pair_partial_solve_wit_13 : pw_neon_pair_partial_solve_wit_13.
Axiom proof_of_pw_neon_pair_partial_solve_wit_14_pure : pw_neon_pair_partial_solve_wit_14_pure.
Axiom proof_of_pw_neon_pair_partial_solve_wit_14 : pw_neon_pair_partial_solve_wit_14.
Axiom proof_of_pw_neon_pair_partial_solve_wit_15_pure : pw_neon_pair_partial_solve_wit_15_pure.
Axiom proof_of_pw_neon_pair_partial_solve_wit_15 : pw_neon_pair_partial_solve_wit_15.
Axiom proof_of_pw_neon_pair_partial_solve_wit_16 : pw_neon_pair_partial_solve_wit_16.
Axiom proof_of_pw_neon_pair_partial_solve_wit_17_pure : pw_neon_pair_partial_solve_wit_17_pure.
Axiom proof_of_pw_neon_pair_partial_solve_wit_17 : pw_neon_pair_partial_solve_wit_17.
Axiom proof_of_pw_neon_pair_partial_solve_wit_18 : pw_neon_pair_partial_solve_wit_18.
Axiom proof_of_pw_neon_pair_partial_solve_wit_19_pure : pw_neon_pair_partial_solve_wit_19_pure.
Axiom proof_of_pw_neon_pair_partial_solve_wit_19 : pw_neon_pair_partial_solve_wit_19.

End VC_Correct.
