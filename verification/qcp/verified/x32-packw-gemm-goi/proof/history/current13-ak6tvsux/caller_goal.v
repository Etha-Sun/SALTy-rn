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
Require Import X32Packw.MainModel.
Require Import X32Packw.ObservationModel.
Local Open Scope sac.

(*----- Function test_equivalence -----*)

Definition test_equivalence_safety_wit_1 := 
forall (address_pre: Z) (params_pre: Z) (extra_bytes_pre: Z) (packed_weights_pre: Z) (scale_pre: Z) (bias_pre: Z) (weights_pre: Z) (sr_pre: Z) (kr_pre: Z) (nr_pre: Z) (kc_pre: Z) (nc_pre: Z) (g_pre: Z) (x: Z) (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (retval: Z) (retval_2: Z) (PreH1 : (retval <> retval_2)) (PreH2 : (retval_2 = x)) (PreH3 : (retval = x)) (PreH4 : (g_pre > 0)) (PreH5 : (nc_pre > 0)) (PreH6 : (kc_pre > 0)) (PreH7 : (weights_pre > 0)) (PreH8 : (packed_weights_pre > 0)) (PreH9 : (g_pre = (pw_groups (G)))) (PreH10 : (nc_pre = (pw_channels (G)))) (PreH11 : (kc_pre = (pw_depth (G)))) (PreH12 : (extra_bytes_pre = (pw_extra_bytes (G)))) (PreH13 : (nr_pre = 2)) (PreH14 : (kr_pre = 1)) (PreH15 : (sr_pre = 1)) (PreH16 : (pw_program_storage F W G )) (PreH17 : (weights_pre = (pw_weights (G)))) (PreH18 : (bias_pre = (pw_bias (G)))) (PreH19 : (packed_weights_pre = (pw_output_base (G)))) (PreH20 : (address_pre > 0)) (PreH21 : (In address_pre W )) (PreH22 : (pw_observation F G O address_pre x )) ,
  (pw_output W (pw_program (F) (G) ((pw_program (F) (G) (O)))) )
  **  ((( &( "right" ) )) # UInt  |-> retval_2)
  **  (pw_data F )
  **  ((( &( "left" ) )) # UInt  |-> retval)
  **  ((( &( "g" ) )) # UInt64  |-> g_pre)
  **  ((( &( "nc" ) )) # UInt64  |-> nc_pre)
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "nr" ) )) # UInt64  |-> nr_pre)
  **  ((( &( "kr" ) )) # UInt64  |-> kr_pre)
  **  ((( &( "sr" ) )) # UInt64  |-> sr_pre)
  **  ((( &( "weights" ) )) # Ptr  |-> weights_pre)
  **  ((( &( "bias" ) )) # Ptr  |-> bias_pre)
  **  ((( &( "scale" ) )) # Ptr  |-> scale_pre)
  **  ((( &( "packed_weights" ) )) # Ptr  |-> packed_weights_pre)
  **  ((( &( "extra_bytes" ) )) # UInt64  |-> extra_bytes_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "address" ) )) # Ptr  |-> address_pre)
|--
  “ False ”
.

Definition test_equivalence_return_wit_1 := 
(
forall (address_pre: Z) (extra_bytes_pre: Z) (packed_weights_pre: Z) (bias_pre: Z) (weights_pre: Z) (sr_pre: Z) (kr_pre: Z) (nr_pre: Z) (kc_pre: Z) (nc_pre: Z) (g_pre: Z) (x: Z) (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (retval: Z) (retval_2: Z) (PreH1 : (retval = retval_2)) (PreH2 : (retval_2 = x)) (PreH3 : (retval = x)) (PreH4 : (g_pre > 0)) (PreH5 : (nc_pre > 0)) (PreH6 : (kc_pre > 0)) (PreH7 : (weights_pre > 0)) (PreH8 : (packed_weights_pre > 0)) (PreH9 : (g_pre = (pw_groups (G)))) (PreH10 : (nc_pre = (pw_channels (G)))) (PreH11 : (kc_pre = (pw_depth (G)))) (PreH12 : (extra_bytes_pre = (pw_extra_bytes (G)))) (PreH13 : (nr_pre = 2)) (PreH14 : (kr_pre = 1)) (PreH15 : (sr_pre = 1)) (PreH16 : (pw_program_storage F W G )) (PreH17 : (weights_pre = (pw_weights (G)))) (PreH18 : (bias_pre = (pw_bias (G)))) (PreH19 : (packed_weights_pre = (pw_output_base (G)))) (PreH20 : (address_pre > 0)) (PreH21 : (In address_pre W )) (PreH22 : (pw_observation F G O address_pre x )) ,
  (pw_output W (pw_program (F) (G) ((pw_program (F) (G) (O)))) )
  **  (pw_data F )
|--
  “ (1 = 1) ”
  &&  (pw_data F )
  **  (pw_output W (pw_program (F) (G) (O)) )
) \/
(
forall (address_pre: Z) (extra_bytes_pre: Z) (packed_weights_pre: Z) (bias_pre: Z) (weights_pre: Z) (sr_pre: Z) (kr_pre: Z) (nr_pre: Z) (kc_pre: Z) (nc_pre: Z) (g_pre: Z) (x: Z) (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (retval: Z) (retval_2: Z) (PreH1 : (retval = retval_2)) (PreH2 : (retval_2 = x)) (PreH3 : (retval = x)) (PreH4 : (g_pre > 0)) (PreH5 : (nc_pre > 0)) (PreH6 : (kc_pre > 0)) (PreH7 : (weights_pre > 0)) (PreH8 : (packed_weights_pre > 0)) (PreH9 : (g_pre = (pw_groups (G)))) (PreH10 : (nc_pre = (pw_channels (G)))) (PreH11 : (kc_pre = (pw_depth (G)))) (PreH12 : (extra_bytes_pre = (pw_extra_bytes (G)))) (PreH13 : (nr_pre = 2)) (PreH14 : (kr_pre = 1)) (PreH15 : (sr_pre = 1)) (PreH16 : (pw_program_storage F W G )) (PreH17 : (weights_pre = (pw_weights (G)))) (PreH18 : (bias_pre = (pw_bias (G)))) (PreH19 : (packed_weights_pre = (pw_output_base (G)))) (PreH20 : (address_pre > 0)) (PreH21 : (In address_pre W )) (PreH22 : (pw_observation F G O address_pre x )) ,
  (pw_output W (pw_program (F) (G) ((pw_program (F) (G) (O)))) )
  **  (pw_data F )
|--
  (pw_data F )
  **  (pw_output W (pw_program (F) (G) (O)) )
).

Definition test_equivalence_return_wit_1_split_goal_spatial := 
forall (address_pre: Z) (extra_bytes_pre: Z) (packed_weights_pre: Z) (bias_pre: Z) (weights_pre: Z) (sr_pre: Z) (kr_pre: Z) (nr_pre: Z) (kc_pre: Z) (nc_pre: Z) (g_pre: Z) (x: Z) (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (retval: Z) (retval_2: Z) (PreH1 : (retval = retval_2)) (PreH2 : (retval_2 = x)) (PreH3 : (retval = x)) (PreH4 : (g_pre > 0)) (PreH5 : (nc_pre > 0)) (PreH6 : (kc_pre > 0)) (PreH7 : (weights_pre > 0)) (PreH8 : (packed_weights_pre > 0)) (PreH9 : (g_pre = (pw_groups (G)))) (PreH10 : (nc_pre = (pw_channels (G)))) (PreH11 : (kc_pre = (pw_depth (G)))) (PreH12 : (extra_bytes_pre = (pw_extra_bytes (G)))) (PreH13 : (nr_pre = 2)) (PreH14 : (kr_pre = 1)) (PreH15 : (sr_pre = 1)) (PreH16 : (pw_program_storage F W G )) (PreH17 : (weights_pre = (pw_weights (G)))) (PreH18 : (bias_pre = (pw_bias (G)))) (PreH19 : (packed_weights_pre = (pw_output_base (G)))) (PreH20 : (address_pre > 0)) (PreH21 : (In address_pre W )) (PreH22 : (pw_observation F G O address_pre x )) ,
  (pw_output W (pw_program (F) (G) ((pw_program (F) (G) (O)))) )
  **  (pw_data F )
|--
  (pw_data F )
  **  (pw_output W (pw_program (F) (G) (O)) )
.

Definition test_equivalence_partial_solve_wit_1_pure := 
forall (address_pre: Z) (params_pre: Z) (extra_bytes_pre: Z) (packed_weights_pre: Z) (scale_pre: Z) (bias_pre: Z) (weights_pre: Z) (sr_pre: Z) (kr_pre: Z) (nr_pre: Z) (kc_pre: Z) (nc_pre: Z) (g_pre: Z) (x: Z) (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (PreH1 : (g_pre > 0)) (PreH2 : (nc_pre > 0)) (PreH3 : (kc_pre > 0)) (PreH4 : (weights_pre > 0)) (PreH5 : (packed_weights_pre > 0)) (PreH6 : (g_pre = (pw_groups (G)))) (PreH7 : (nc_pre = (pw_channels (G)))) (PreH8 : (kc_pre = (pw_depth (G)))) (PreH9 : (extra_bytes_pre = (pw_extra_bytes (G)))) (PreH10 : (nr_pre = 2)) (PreH11 : (kr_pre = 1)) (PreH12 : (sr_pre = 1)) (PreH13 : (pw_program_storage F W G )) (PreH14 : (weights_pre = (pw_weights (G)))) (PreH15 : (bias_pre = (pw_bias (G)))) (PreH16 : (packed_weights_pre = (pw_output_base (G)))) (PreH17 : (address_pre > 0)) (PreH18 : (In address_pre W )) (PreH19 : (pw_observation F G O address_pre x )) ,
  ((( &( "g" ) )) # UInt64  |-> g_pre)
  **  ((( &( "nc" ) )) # UInt64  |-> nc_pre)
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "nr" ) )) # UInt64  |-> nr_pre)
  **  ((( &( "kr" ) )) # UInt64  |-> kr_pre)
  **  ((( &( "sr" ) )) # UInt64  |-> sr_pre)
  **  ((( &( "weights" ) )) # Ptr  |-> weights_pre)
  **  ((( &( "bias" ) )) # Ptr  |-> bias_pre)
  **  ((( &( "scale" ) )) # Ptr  |-> scale_pre)
  **  ((( &( "packed_weights" ) )) # Ptr  |-> packed_weights_pre)
  **  ((( &( "extra_bytes" ) )) # UInt64  |-> extra_bytes_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "address" ) )) # Ptr  |-> address_pre)
  **  (pw_data F )
  **  (pw_output W O )
|--
  “ (g_pre > 0) ” 
  &&  “ (nc_pre > 0) ” 
  &&  “ (kc_pre > 0) ” 
  &&  “ (weights_pre > 0) ” 
  &&  “ (packed_weights_pre > 0) ” 
  &&  “ (g_pre = (pw_groups (G))) ” 
  &&  “ (nc_pre = (pw_channels (G))) ” 
  &&  “ (kc_pre = (pw_depth (G))) ” 
  &&  “ (extra_bytes_pre = (pw_extra_bytes (G))) ” 
  &&  “ (nr_pre = 2) ” 
  &&  “ (kr_pre = 1) ” 
  &&  “ (sr_pre = 1) ” 
  &&  “ (pw_program_storage F W G ) ” 
  &&  “ (weights_pre = (pw_weights (G))) ” 
  &&  “ (bias_pre = (pw_bias (G))) ” 
  &&  “ (packed_weights_pre = (pw_output_base (G))) ”
.

Definition test_equivalence_partial_solve_wit_1_aux := 
forall (address_pre: Z) (extra_bytes_pre: Z) (packed_weights_pre: Z) (bias_pre: Z) (weights_pre: Z) (sr_pre: Z) (kr_pre: Z) (nr_pre: Z) (kc_pre: Z) (nc_pre: Z) (g_pre: Z) (x: Z) (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (PreH1 : (g_pre > 0)) (PreH2 : (nc_pre > 0)) (PreH3 : (kc_pre > 0)) (PreH4 : (weights_pre > 0)) (PreH5 : (packed_weights_pre > 0)) (PreH6 : (g_pre = (pw_groups (G)))) (PreH7 : (nc_pre = (pw_channels (G)))) (PreH8 : (kc_pre = (pw_depth (G)))) (PreH9 : (extra_bytes_pre = (pw_extra_bytes (G)))) (PreH10 : (nr_pre = 2)) (PreH11 : (kr_pre = 1)) (PreH12 : (sr_pre = 1)) (PreH13 : (pw_program_storage F W G )) (PreH14 : (weights_pre = (pw_weights (G)))) (PreH15 : (bias_pre = (pw_bias (G)))) (PreH16 : (packed_weights_pre = (pw_output_base (G)))) (PreH17 : (address_pre > 0)) (PreH18 : (In address_pre W )) (PreH19 : (pw_observation F G O address_pre x )) ,
  (pw_data F )
  **  (pw_output W O )
|--
  “ (g_pre > 0) ” 
  &&  “ (nc_pre > 0) ” 
  &&  “ (kc_pre > 0) ” 
  &&  “ (weights_pre > 0) ” 
  &&  “ (packed_weights_pre > 0) ” 
  &&  “ (g_pre = (pw_groups (G))) ” 
  &&  “ (nc_pre = (pw_channels (G))) ” 
  &&  “ (kc_pre = (pw_depth (G))) ” 
  &&  “ (extra_bytes_pre = (pw_extra_bytes (G))) ” 
  &&  “ (nr_pre = 2) ” 
  &&  “ (kr_pre = 1) ” 
  &&  “ (sr_pre = 1) ” 
  &&  “ (pw_program_storage F W G ) ” 
  &&  “ (weights_pre = (pw_weights (G))) ” 
  &&  “ (bias_pre = (pw_bias (G))) ” 
  &&  “ (packed_weights_pre = (pw_output_base (G))) ” 
  &&  “ (g_pre > 0) ” 
  &&  “ (nc_pre > 0) ” 
  &&  “ (kc_pre > 0) ” 
  &&  “ (weights_pre > 0) ” 
  &&  “ (packed_weights_pre > 0) ” 
  &&  “ (g_pre = (pw_groups (G))) ” 
  &&  “ (nc_pre = (pw_channels (G))) ” 
  &&  “ (kc_pre = (pw_depth (G))) ” 
  &&  “ (extra_bytes_pre = (pw_extra_bytes (G))) ” 
  &&  “ (nr_pre = 2) ” 
  &&  “ (kr_pre = 1) ” 
  &&  “ (sr_pre = 1) ” 
  &&  “ (pw_program_storage F W G ) ” 
  &&  “ (weights_pre = (pw_weights (G))) ” 
  &&  “ (bias_pre = (pw_bias (G))) ” 
  &&  “ (packed_weights_pre = (pw_output_base (G))) ” 
  &&  “ (address_pre > 0) ” 
  &&  “ (In address_pre W ) ” 
  &&  “ (pw_observation F G O address_pre x ) ”
  &&  (pw_data F )
  **  (pw_output W O )
.

Definition test_equivalence_partial_solve_wit_1 := test_equivalence_partial_solve_wit_1_pure -> test_equivalence_partial_solve_wit_1_aux.

Definition test_equivalence_partial_solve_wit_2_pure := 
(
forall (address_pre: Z) (params_pre: Z) (extra_bytes_pre: Z) (packed_weights_pre: Z) (scale_pre: Z) (bias_pre: Z) (weights_pre: Z) (sr_pre: Z) (kr_pre: Z) (nr_pre: Z) (kc_pre: Z) (nc_pre: Z) (g_pre: Z) (x: Z) (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (PreH1 : (g_pre > 0)) (PreH2 : (nc_pre > 0)) (PreH3 : (kc_pre > 0)) (PreH4 : (weights_pre > 0)) (PreH5 : (packed_weights_pre > 0)) (PreH6 : (g_pre = (pw_groups (G)))) (PreH7 : (nc_pre = (pw_channels (G)))) (PreH8 : (kc_pre = (pw_depth (G)))) (PreH9 : (extra_bytes_pre = (pw_extra_bytes (G)))) (PreH10 : (nr_pre = 2)) (PreH11 : (kr_pre = 1)) (PreH12 : (sr_pre = 1)) (PreH13 : (pw_program_storage F W G )) (PreH14 : (weights_pre = (pw_weights (G)))) (PreH15 : (bias_pre = (pw_bias (G)))) (PreH16 : (packed_weights_pre = (pw_output_base (G)))) (PreH17 : (address_pre > 0)) (PreH18 : (In address_pre W )) (PreH19 : (pw_observation F G O address_pre x )) ,
  ((( &( "left" ) )) # UInt  |->_)
  **  (pw_data F )
  **  (pw_output W (pw_program (F) (G) (O)) )
  **  ((( &( "g" ) )) # UInt64  |-> g_pre)
  **  ((( &( "nc" ) )) # UInt64  |-> nc_pre)
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "nr" ) )) # UInt64  |-> nr_pre)
  **  ((( &( "kr" ) )) # UInt64  |-> kr_pre)
  **  ((( &( "sr" ) )) # UInt64  |-> sr_pre)
  **  ((( &( "weights" ) )) # Ptr  |-> weights_pre)
  **  ((( &( "bias" ) )) # Ptr  |-> bias_pre)
  **  ((( &( "scale" ) )) # Ptr  |-> scale_pre)
  **  ((( &( "packed_weights" ) )) # Ptr  |-> packed_weights_pre)
  **  ((( &( "extra_bytes" ) )) # UInt64  |-> extra_bytes_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "address" ) )) # Ptr  |-> address_pre)
|--
  “ (address_pre > 0) ” 
  &&  “ (In address_pre W ) ” 
  &&  “ (pw_exact (pw_program (F) (G) (O)) address_pre x ) ” 
  &&  “ (NoDup W ) ”
) \/
(
forall (address_pre: Z) (params_pre: Z) (extra_bytes_pre: Z) (packed_weights_pre: Z) (scale_pre: Z) (bias_pre: Z) (weights_pre: Z) (sr_pre: Z) (kr_pre: Z) (nr_pre: Z) (kc_pre: Z) (nc_pre: Z) (g_pre: Z) (x: Z) (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (PreH1 : (extra_bytes_pre <= UINT64_MAX)) (PreH2 : (sr_pre <= UINT64_MAX)) (PreH3 : (kr_pre <= UINT64_MAX)) (PreH4 : (nr_pre <= UINT64_MAX)) (PreH5 : (kc_pre <= UINT64_MAX)) (PreH6 : (nc_pre <= UINT64_MAX)) (PreH7 : (g_pre <= UINT64_MAX)) (PreH8 : (extra_bytes_pre >= 0)) (PreH9 : (sr_pre >= 0)) (PreH10 : (kr_pre >= 0)) (PreH11 : (nr_pre >= 0)) (PreH12 : (kc_pre >= 0)) (PreH13 : (nc_pre >= 0)) (PreH14 : (g_pre >= 0)) (PreH15 : (g_pre > 0)) (PreH16 : (nc_pre > 0)) (PreH17 : (kc_pre > 0)) (PreH18 : (weights_pre > 0)) (PreH19 : (packed_weights_pre > 0)) (PreH20 : (g_pre = (pw_groups (G)))) (PreH21 : (nc_pre = (pw_channels (G)))) (PreH22 : (kc_pre = (pw_depth (G)))) (PreH23 : (extra_bytes_pre = (pw_extra_bytes (G)))) (PreH24 : (nr_pre = 2)) (PreH25 : (kr_pre = 1)) (PreH26 : (sr_pre = 1)) (PreH27 : (pw_program_storage F W G )) (PreH28 : (weights_pre = (pw_weights (G)))) (PreH29 : (bias_pre = (pw_bias (G)))) (PreH30 : (packed_weights_pre = (pw_output_base (G)))) (PreH31 : (address_pre > 0)) (PreH32 : (In address_pre W )) (PreH33 : (pw_observation F G O address_pre x )) ,
  ((( &( "left" ) )) # UInt  |->_)
  **  (pw_data F )
  **  (pw_output W (pw_program (F) (G) (O)) )
  **  ((( &( "g" ) )) # UInt64  |-> g_pre)
  **  ((( &( "nc" ) )) # UInt64  |-> nc_pre)
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "nr" ) )) # UInt64  |-> nr_pre)
  **  ((( &( "kr" ) )) # UInt64  |-> kr_pre)
  **  ((( &( "sr" ) )) # UInt64  |-> sr_pre)
  **  ((( &( "weights" ) )) # Ptr  |-> weights_pre)
  **  ((( &( "bias" ) )) # Ptr  |-> bias_pre)
  **  ((( &( "scale" ) )) # Ptr  |-> scale_pre)
  **  ((( &( "packed_weights" ) )) # Ptr  |-> packed_weights_pre)
  **  ((( &( "extra_bytes" ) )) # UInt64  |-> extra_bytes_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "address" ) )) # Ptr  |-> address_pre)
|--
  “ (NoDup W ) ” 
  &&  “ (pw_exact (pw_program (F) (G) (O)) address_pre x ) ”
).

Definition test_equivalence_partial_solve_wit_2_pure_split_goal_1 := 
forall (address_pre: Z) (params_pre: Z) (extra_bytes_pre: Z) (packed_weights_pre: Z) (scale_pre: Z) (bias_pre: Z) (weights_pre: Z) (sr_pre: Z) (kr_pre: Z) (nr_pre: Z) (kc_pre: Z) (nc_pre: Z) (g_pre: Z) (x: Z) (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (PreH1 : (extra_bytes_pre <= UINT64_MAX)) (PreH2 : (sr_pre <= UINT64_MAX)) (PreH3 : (kr_pre <= UINT64_MAX)) (PreH4 : (nr_pre <= UINT64_MAX)) (PreH5 : (kc_pre <= UINT64_MAX)) (PreH6 : (nc_pre <= UINT64_MAX)) (PreH7 : (g_pre <= UINT64_MAX)) (PreH8 : (extra_bytes_pre >= 0)) (PreH9 : (sr_pre >= 0)) (PreH10 : (kr_pre >= 0)) (PreH11 : (nr_pre >= 0)) (PreH12 : (kc_pre >= 0)) (PreH13 : (nc_pre >= 0)) (PreH14 : (g_pre >= 0)) (PreH15 : (g_pre > 0)) (PreH16 : (nc_pre > 0)) (PreH17 : (kc_pre > 0)) (PreH18 : (weights_pre > 0)) (PreH19 : (packed_weights_pre > 0)) (PreH20 : (g_pre = (pw_groups (G)))) (PreH21 : (nc_pre = (pw_channels (G)))) (PreH22 : (kc_pre = (pw_depth (G)))) (PreH23 : (extra_bytes_pre = (pw_extra_bytes (G)))) (PreH24 : (nr_pre = 2)) (PreH25 : (kr_pre = 1)) (PreH26 : (sr_pre = 1)) (PreH27 : (pw_program_storage F W G )) (PreH28 : (weights_pre = (pw_weights (G)))) (PreH29 : (bias_pre = (pw_bias (G)))) (PreH30 : (packed_weights_pre = (pw_output_base (G)))) (PreH31 : (address_pre > 0)) (PreH32 : (In address_pre W )) (PreH33 : (pw_observation F G O address_pre x )) ,
  ((( &( "left" ) )) # UInt  |->_)
  **  (pw_data F )
  **  (pw_output W (pw_program (F) (G) (O)) )
  **  ((( &( "g" ) )) # UInt64  |-> g_pre)
  **  ((( &( "nc" ) )) # UInt64  |-> nc_pre)
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "nr" ) )) # UInt64  |-> nr_pre)
  **  ((( &( "kr" ) )) # UInt64  |-> kr_pre)
  **  ((( &( "sr" ) )) # UInt64  |-> sr_pre)
  **  ((( &( "weights" ) )) # Ptr  |-> weights_pre)
  **  ((( &( "bias" ) )) # Ptr  |-> bias_pre)
  **  ((( &( "scale" ) )) # Ptr  |-> scale_pre)
  **  ((( &( "packed_weights" ) )) # Ptr  |-> packed_weights_pre)
  **  ((( &( "extra_bytes" ) )) # UInt64  |-> extra_bytes_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "address" ) )) # Ptr  |-> address_pre)
|--
  “ (NoDup W ) ”
.

Definition test_equivalence_partial_solve_wit_2_pure_split_goal_2 := 
forall (address_pre: Z) (params_pre: Z) (extra_bytes_pre: Z) (packed_weights_pre: Z) (scale_pre: Z) (bias_pre: Z) (weights_pre: Z) (sr_pre: Z) (kr_pre: Z) (nr_pre: Z) (kc_pre: Z) (nc_pre: Z) (g_pre: Z) (x: Z) (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (PreH1 : (extra_bytes_pre <= UINT64_MAX)) (PreH2 : (sr_pre <= UINT64_MAX)) (PreH3 : (kr_pre <= UINT64_MAX)) (PreH4 : (nr_pre <= UINT64_MAX)) (PreH5 : (kc_pre <= UINT64_MAX)) (PreH6 : (nc_pre <= UINT64_MAX)) (PreH7 : (g_pre <= UINT64_MAX)) (PreH8 : (extra_bytes_pre >= 0)) (PreH9 : (sr_pre >= 0)) (PreH10 : (kr_pre >= 0)) (PreH11 : (nr_pre >= 0)) (PreH12 : (kc_pre >= 0)) (PreH13 : (nc_pre >= 0)) (PreH14 : (g_pre >= 0)) (PreH15 : (g_pre > 0)) (PreH16 : (nc_pre > 0)) (PreH17 : (kc_pre > 0)) (PreH18 : (weights_pre > 0)) (PreH19 : (packed_weights_pre > 0)) (PreH20 : (g_pre = (pw_groups (G)))) (PreH21 : (nc_pre = (pw_channels (G)))) (PreH22 : (kc_pre = (pw_depth (G)))) (PreH23 : (extra_bytes_pre = (pw_extra_bytes (G)))) (PreH24 : (nr_pre = 2)) (PreH25 : (kr_pre = 1)) (PreH26 : (sr_pre = 1)) (PreH27 : (pw_program_storage F W G )) (PreH28 : (weights_pre = (pw_weights (G)))) (PreH29 : (bias_pre = (pw_bias (G)))) (PreH30 : (packed_weights_pre = (pw_output_base (G)))) (PreH31 : (address_pre > 0)) (PreH32 : (In address_pre W )) (PreH33 : (pw_observation F G O address_pre x )) ,
  ((( &( "left" ) )) # UInt  |->_)
  **  (pw_data F )
  **  (pw_output W (pw_program (F) (G) (O)) )
  **  ((( &( "g" ) )) # UInt64  |-> g_pre)
  **  ((( &( "nc" ) )) # UInt64  |-> nc_pre)
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "nr" ) )) # UInt64  |-> nr_pre)
  **  ((( &( "kr" ) )) # UInt64  |-> kr_pre)
  **  ((( &( "sr" ) )) # UInt64  |-> sr_pre)
  **  ((( &( "weights" ) )) # Ptr  |-> weights_pre)
  **  ((( &( "bias" ) )) # Ptr  |-> bias_pre)
  **  ((( &( "scale" ) )) # Ptr  |-> scale_pre)
  **  ((( &( "packed_weights" ) )) # Ptr  |-> packed_weights_pre)
  **  ((( &( "extra_bytes" ) )) # UInt64  |-> extra_bytes_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "address" ) )) # Ptr  |-> address_pre)
|--
  “ (pw_exact (pw_program (F) (G) (O)) address_pre x ) ”
.

Definition test_equivalence_partial_solve_wit_2_aux := 
forall (address_pre: Z) (extra_bytes_pre: Z) (packed_weights_pre: Z) (bias_pre: Z) (weights_pre: Z) (sr_pre: Z) (kr_pre: Z) (nr_pre: Z) (kc_pre: Z) (nc_pre: Z) (g_pre: Z) (x: Z) (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (PreH1 : (g_pre > 0)) (PreH2 : (nc_pre > 0)) (PreH3 : (kc_pre > 0)) (PreH4 : (weights_pre > 0)) (PreH5 : (packed_weights_pre > 0)) (PreH6 : (g_pre = (pw_groups (G)))) (PreH7 : (nc_pre = (pw_channels (G)))) (PreH8 : (kc_pre = (pw_depth (G)))) (PreH9 : (extra_bytes_pre = (pw_extra_bytes (G)))) (PreH10 : (nr_pre = 2)) (PreH11 : (kr_pre = 1)) (PreH12 : (sr_pre = 1)) (PreH13 : (pw_program_storage F W G )) (PreH14 : (weights_pre = (pw_weights (G)))) (PreH15 : (bias_pre = (pw_bias (G)))) (PreH16 : (packed_weights_pre = (pw_output_base (G)))) (PreH17 : (address_pre > 0)) (PreH18 : (In address_pre W )) (PreH19 : (pw_observation F G O address_pre x )) ,
  (pw_data F )
  **  (pw_output W (pw_program (F) (G) (O)) )
|--
  “ (address_pre > 0) ” 
  &&  “ (In address_pre W ) ” 
  &&  “ (pw_exact (pw_program (F) (G) (O)) address_pre x ) ” 
  &&  “ (NoDup W ) ” 
  &&  “ (g_pre > 0) ” 
  &&  “ (nc_pre > 0) ” 
  &&  “ (kc_pre > 0) ” 
  &&  “ (weights_pre > 0) ” 
  &&  “ (packed_weights_pre > 0) ” 
  &&  “ (g_pre = (pw_groups (G))) ” 
  &&  “ (nc_pre = (pw_channels (G))) ” 
  &&  “ (kc_pre = (pw_depth (G))) ” 
  &&  “ (extra_bytes_pre = (pw_extra_bytes (G))) ” 
  &&  “ (nr_pre = 2) ” 
  &&  “ (kr_pre = 1) ” 
  &&  “ (sr_pre = 1) ” 
  &&  “ (pw_program_storage F W G ) ” 
  &&  “ (weights_pre = (pw_weights (G))) ” 
  &&  “ (bias_pre = (pw_bias (G))) ” 
  &&  “ (packed_weights_pre = (pw_output_base (G))) ” 
  &&  “ (address_pre > 0) ” 
  &&  “ (In address_pre W ) ” 
  &&  “ (pw_observation F G O address_pre x ) ”
  &&  (pw_output W (pw_program (F) (G) (O)) )
  **  (pw_data F )
.

Definition test_equivalence_partial_solve_wit_2 := test_equivalence_partial_solve_wit_2_pure -> test_equivalence_partial_solve_wit_2_aux.

Definition test_equivalence_partial_solve_wit_3_pure := 
forall (address_pre: Z) (params_pre: Z) (extra_bytes_pre: Z) (packed_weights_pre: Z) (scale_pre: Z) (bias_pre: Z) (weights_pre: Z) (sr_pre: Z) (kr_pre: Z) (nr_pre: Z) (kc_pre: Z) (nc_pre: Z) (g_pre: Z) (x: Z) (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (retval: Z) (PreH1 : (retval = x)) (PreH2 : (g_pre > 0)) (PreH3 : (nc_pre > 0)) (PreH4 : (kc_pre > 0)) (PreH5 : (weights_pre > 0)) (PreH6 : (packed_weights_pre > 0)) (PreH7 : (g_pre = (pw_groups (G)))) (PreH8 : (nc_pre = (pw_channels (G)))) (PreH9 : (kc_pre = (pw_depth (G)))) (PreH10 : (extra_bytes_pre = (pw_extra_bytes (G)))) (PreH11 : (nr_pre = 2)) (PreH12 : (kr_pre = 1)) (PreH13 : (sr_pre = 1)) (PreH14 : (pw_program_storage F W G )) (PreH15 : (weights_pre = (pw_weights (G)))) (PreH16 : (bias_pre = (pw_bias (G)))) (PreH17 : (packed_weights_pre = (pw_output_base (G)))) (PreH18 : (address_pre > 0)) (PreH19 : (In address_pre W )) (PreH20 : (pw_observation F G O address_pre x )) ,
  (pw_output W (pw_program (F) (G) (O)) )
  **  ((( &( "left" ) )) # UInt  |-> retval)
  **  (pw_data F )
  **  ((( &( "g" ) )) # UInt64  |-> g_pre)
  **  ((( &( "nc" ) )) # UInt64  |-> nc_pre)
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "nr" ) )) # UInt64  |-> nr_pre)
  **  ((( &( "kr" ) )) # UInt64  |-> kr_pre)
  **  ((( &( "sr" ) )) # UInt64  |-> sr_pre)
  **  ((( &( "weights" ) )) # Ptr  |-> weights_pre)
  **  ((( &( "bias" ) )) # Ptr  |-> bias_pre)
  **  ((( &( "scale" ) )) # Ptr  |-> scale_pre)
  **  ((( &( "packed_weights" ) )) # Ptr  |-> packed_weights_pre)
  **  ((( &( "extra_bytes" ) )) # UInt64  |-> extra_bytes_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "address" ) )) # Ptr  |-> address_pre)
|--
  “ (g_pre > 0) ” 
  &&  “ (nc_pre > 0) ” 
  &&  “ (kc_pre > 0) ” 
  &&  “ (weights_pre > 0) ” 
  &&  “ (packed_weights_pre > 0) ” 
  &&  “ (g_pre = (pw_groups (G))) ” 
  &&  “ (nc_pre = (pw_channels (G))) ” 
  &&  “ (kc_pre = (pw_depth (G))) ” 
  &&  “ (extra_bytes_pre = (pw_extra_bytes (G))) ” 
  &&  “ (nr_pre = 2) ” 
  &&  “ (kr_pre = 1) ” 
  &&  “ (sr_pre = 1) ” 
  &&  “ (pw_program_storage F W G ) ” 
  &&  “ (weights_pre = (pw_weights (G))) ” 
  &&  “ (bias_pre = (pw_bias (G))) ” 
  &&  “ (packed_weights_pre = (pw_output_base (G))) ”
.

Definition test_equivalence_partial_solve_wit_3_aux := 
forall (address_pre: Z) (extra_bytes_pre: Z) (packed_weights_pre: Z) (bias_pre: Z) (weights_pre: Z) (sr_pre: Z) (kr_pre: Z) (nr_pre: Z) (kc_pre: Z) (nc_pre: Z) (g_pre: Z) (x: Z) (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (retval: Z) (PreH1 : (retval = x)) (PreH2 : (g_pre > 0)) (PreH3 : (nc_pre > 0)) (PreH4 : (kc_pre > 0)) (PreH5 : (weights_pre > 0)) (PreH6 : (packed_weights_pre > 0)) (PreH7 : (g_pre = (pw_groups (G)))) (PreH8 : (nc_pre = (pw_channels (G)))) (PreH9 : (kc_pre = (pw_depth (G)))) (PreH10 : (extra_bytes_pre = (pw_extra_bytes (G)))) (PreH11 : (nr_pre = 2)) (PreH12 : (kr_pre = 1)) (PreH13 : (sr_pre = 1)) (PreH14 : (pw_program_storage F W G )) (PreH15 : (weights_pre = (pw_weights (G)))) (PreH16 : (bias_pre = (pw_bias (G)))) (PreH17 : (packed_weights_pre = (pw_output_base (G)))) (PreH18 : (address_pre > 0)) (PreH19 : (In address_pre W )) (PreH20 : (pw_observation F G O address_pre x )) ,
  (pw_output W (pw_program (F) (G) (O)) )
  **  (pw_data F )
|--
  “ (g_pre > 0) ” 
  &&  “ (nc_pre > 0) ” 
  &&  “ (kc_pre > 0) ” 
  &&  “ (weights_pre > 0) ” 
  &&  “ (packed_weights_pre > 0) ” 
  &&  “ (g_pre = (pw_groups (G))) ” 
  &&  “ (nc_pre = (pw_channels (G))) ” 
  &&  “ (kc_pre = (pw_depth (G))) ” 
  &&  “ (extra_bytes_pre = (pw_extra_bytes (G))) ” 
  &&  “ (nr_pre = 2) ” 
  &&  “ (kr_pre = 1) ” 
  &&  “ (sr_pre = 1) ” 
  &&  “ (pw_program_storage F W G ) ” 
  &&  “ (weights_pre = (pw_weights (G))) ” 
  &&  “ (bias_pre = (pw_bias (G))) ” 
  &&  “ (packed_weights_pre = (pw_output_base (G))) ” 
  &&  “ (retval = x) ” 
  &&  “ (g_pre > 0) ” 
  &&  “ (nc_pre > 0) ” 
  &&  “ (kc_pre > 0) ” 
  &&  “ (weights_pre > 0) ” 
  &&  “ (packed_weights_pre > 0) ” 
  &&  “ (g_pre = (pw_groups (G))) ” 
  &&  “ (nc_pre = (pw_channels (G))) ” 
  &&  “ (kc_pre = (pw_depth (G))) ” 
  &&  “ (extra_bytes_pre = (pw_extra_bytes (G))) ” 
  &&  “ (nr_pre = 2) ” 
  &&  “ (kr_pre = 1) ” 
  &&  “ (sr_pre = 1) ” 
  &&  “ (pw_program_storage F W G ) ” 
  &&  “ (weights_pre = (pw_weights (G))) ” 
  &&  “ (bias_pre = (pw_bias (G))) ” 
  &&  “ (packed_weights_pre = (pw_output_base (G))) ” 
  &&  “ (address_pre > 0) ” 
  &&  “ (In address_pre W ) ” 
  &&  “ (pw_observation F G O address_pre x ) ”
  &&  (pw_data F )
  **  (pw_output W (pw_program (F) (G) (O)) )
.

Definition test_equivalence_partial_solve_wit_3 := test_equivalence_partial_solve_wit_3_pure -> test_equivalence_partial_solve_wit_3_aux.

Definition test_equivalence_partial_solve_wit_4_pure := 
(
forall (address_pre: Z) (params_pre: Z) (extra_bytes_pre: Z) (packed_weights_pre: Z) (scale_pre: Z) (bias_pre: Z) (weights_pre: Z) (sr_pre: Z) (kr_pre: Z) (nr_pre: Z) (kc_pre: Z) (nc_pre: Z) (g_pre: Z) (x: Z) (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (retval: Z) (PreH1 : (retval = x)) (PreH2 : (g_pre > 0)) (PreH3 : (nc_pre > 0)) (PreH4 : (kc_pre > 0)) (PreH5 : (weights_pre > 0)) (PreH6 : (packed_weights_pre > 0)) (PreH7 : (g_pre = (pw_groups (G)))) (PreH8 : (nc_pre = (pw_channels (G)))) (PreH9 : (kc_pre = (pw_depth (G)))) (PreH10 : (extra_bytes_pre = (pw_extra_bytes (G)))) (PreH11 : (nr_pre = 2)) (PreH12 : (kr_pre = 1)) (PreH13 : (sr_pre = 1)) (PreH14 : (pw_program_storage F W G )) (PreH15 : (weights_pre = (pw_weights (G)))) (PreH16 : (bias_pre = (pw_bias (G)))) (PreH17 : (packed_weights_pre = (pw_output_base (G)))) (PreH18 : (address_pre > 0)) (PreH19 : (In address_pre W )) (PreH20 : (pw_observation F G O address_pre x )) ,
  ((( &( "right" ) )) # UInt  |->_)
  **  (pw_data F )
  **  (pw_output W (pw_program (F) (G) ((pw_program (F) (G) (O)))) )
  **  ((( &( "left" ) )) # UInt  |-> retval)
  **  ((( &( "g" ) )) # UInt64  |-> g_pre)
  **  ((( &( "nc" ) )) # UInt64  |-> nc_pre)
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "nr" ) )) # UInt64  |-> nr_pre)
  **  ((( &( "kr" ) )) # UInt64  |-> kr_pre)
  **  ((( &( "sr" ) )) # UInt64  |-> sr_pre)
  **  ((( &( "weights" ) )) # Ptr  |-> weights_pre)
  **  ((( &( "bias" ) )) # Ptr  |-> bias_pre)
  **  ((( &( "scale" ) )) # Ptr  |-> scale_pre)
  **  ((( &( "packed_weights" ) )) # Ptr  |-> packed_weights_pre)
  **  ((( &( "extra_bytes" ) )) # UInt64  |-> extra_bytes_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "address" ) )) # Ptr  |-> address_pre)
|--
  “ (address_pre > 0) ” 
  &&  “ (In address_pre W ) ” 
  &&  “ (pw_exact (pw_program (F) (G) ((pw_program (F) (G) (O)))) address_pre x ) ” 
  &&  “ (NoDup W ) ”
) \/
(
forall (address_pre: Z) (params_pre: Z) (extra_bytes_pre: Z) (packed_weights_pre: Z) (scale_pre: Z) (bias_pre: Z) (weights_pre: Z) (sr_pre: Z) (kr_pre: Z) (nr_pre: Z) (kc_pre: Z) (nc_pre: Z) (g_pre: Z) (x: Z) (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (retval: Z) (PreH1 : (extra_bytes_pre <= UINT64_MAX)) (PreH2 : (sr_pre <= UINT64_MAX)) (PreH3 : (kr_pre <= UINT64_MAX)) (PreH4 : (nr_pre <= UINT64_MAX)) (PreH5 : (kc_pre <= UINT64_MAX)) (PreH6 : (nc_pre <= UINT64_MAX)) (PreH7 : (g_pre <= UINT64_MAX)) (PreH8 : (extra_bytes_pre >= 0)) (PreH9 : (sr_pre >= 0)) (PreH10 : (kr_pre >= 0)) (PreH11 : (nr_pre >= 0)) (PreH12 : (kc_pre >= 0)) (PreH13 : (nc_pre >= 0)) (PreH14 : (g_pre >= 0)) (PreH15 : (retval <= UINT_MAX)) (PreH16 : (retval >= 0)) (PreH17 : (retval = x)) (PreH18 : (g_pre > 0)) (PreH19 : (nc_pre > 0)) (PreH20 : (kc_pre > 0)) (PreH21 : (weights_pre > 0)) (PreH22 : (packed_weights_pre > 0)) (PreH23 : (g_pre = (pw_groups (G)))) (PreH24 : (nc_pre = (pw_channels (G)))) (PreH25 : (kc_pre = (pw_depth (G)))) (PreH26 : (extra_bytes_pre = (pw_extra_bytes (G)))) (PreH27 : (nr_pre = 2)) (PreH28 : (kr_pre = 1)) (PreH29 : (sr_pre = 1)) (PreH30 : (pw_program_storage F W G )) (PreH31 : (weights_pre = (pw_weights (G)))) (PreH32 : (bias_pre = (pw_bias (G)))) (PreH33 : (packed_weights_pre = (pw_output_base (G)))) (PreH34 : (address_pre > 0)) (PreH35 : (In address_pre W )) (PreH36 : (pw_observation F G O address_pre x )) ,
  ((( &( "right" ) )) # UInt  |->_)
  **  (pw_data F )
  **  (pw_output W (pw_program (F) (G) ((pw_program (F) (G) (O)))) )
  **  ((( &( "left" ) )) # UInt  |-> retval)
  **  ((( &( "g" ) )) # UInt64  |-> g_pre)
  **  ((( &( "nc" ) )) # UInt64  |-> nc_pre)
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "nr" ) )) # UInt64  |-> nr_pre)
  **  ((( &( "kr" ) )) # UInt64  |-> kr_pre)
  **  ((( &( "sr" ) )) # UInt64  |-> sr_pre)
  **  ((( &( "weights" ) )) # Ptr  |-> weights_pre)
  **  ((( &( "bias" ) )) # Ptr  |-> bias_pre)
  **  ((( &( "scale" ) )) # Ptr  |-> scale_pre)
  **  ((( &( "packed_weights" ) )) # Ptr  |-> packed_weights_pre)
  **  ((( &( "extra_bytes" ) )) # UInt64  |-> extra_bytes_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "address" ) )) # Ptr  |-> address_pre)
|--
  “ (NoDup W ) ” 
  &&  “ (pw_exact (pw_program (F) (G) ((pw_program (F) (G) (O)))) address_pre x ) ”
).

Definition test_equivalence_partial_solve_wit_4_pure_split_goal_1 := 
forall (address_pre: Z) (params_pre: Z) (extra_bytes_pre: Z) (packed_weights_pre: Z) (scale_pre: Z) (bias_pre: Z) (weights_pre: Z) (sr_pre: Z) (kr_pre: Z) (nr_pre: Z) (kc_pre: Z) (nc_pre: Z) (g_pre: Z) (x: Z) (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (retval: Z) (PreH1 : (extra_bytes_pre <= UINT64_MAX)) (PreH2 : (sr_pre <= UINT64_MAX)) (PreH3 : (kr_pre <= UINT64_MAX)) (PreH4 : (nr_pre <= UINT64_MAX)) (PreH5 : (kc_pre <= UINT64_MAX)) (PreH6 : (nc_pre <= UINT64_MAX)) (PreH7 : (g_pre <= UINT64_MAX)) (PreH8 : (extra_bytes_pre >= 0)) (PreH9 : (sr_pre >= 0)) (PreH10 : (kr_pre >= 0)) (PreH11 : (nr_pre >= 0)) (PreH12 : (kc_pre >= 0)) (PreH13 : (nc_pre >= 0)) (PreH14 : (g_pre >= 0)) (PreH15 : (retval <= UINT_MAX)) (PreH16 : (retval >= 0)) (PreH17 : (retval = x)) (PreH18 : (g_pre > 0)) (PreH19 : (nc_pre > 0)) (PreH20 : (kc_pre > 0)) (PreH21 : (weights_pre > 0)) (PreH22 : (packed_weights_pre > 0)) (PreH23 : (g_pre = (pw_groups (G)))) (PreH24 : (nc_pre = (pw_channels (G)))) (PreH25 : (kc_pre = (pw_depth (G)))) (PreH26 : (extra_bytes_pre = (pw_extra_bytes (G)))) (PreH27 : (nr_pre = 2)) (PreH28 : (kr_pre = 1)) (PreH29 : (sr_pre = 1)) (PreH30 : (pw_program_storage F W G )) (PreH31 : (weights_pre = (pw_weights (G)))) (PreH32 : (bias_pre = (pw_bias (G)))) (PreH33 : (packed_weights_pre = (pw_output_base (G)))) (PreH34 : (address_pre > 0)) (PreH35 : (In address_pre W )) (PreH36 : (pw_observation F G O address_pre x )) ,
  ((( &( "right" ) )) # UInt  |->_)
  **  (pw_data F )
  **  (pw_output W (pw_program (F) (G) ((pw_program (F) (G) (O)))) )
  **  ((( &( "left" ) )) # UInt  |-> retval)
  **  ((( &( "g" ) )) # UInt64  |-> g_pre)
  **  ((( &( "nc" ) )) # UInt64  |-> nc_pre)
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "nr" ) )) # UInt64  |-> nr_pre)
  **  ((( &( "kr" ) )) # UInt64  |-> kr_pre)
  **  ((( &( "sr" ) )) # UInt64  |-> sr_pre)
  **  ((( &( "weights" ) )) # Ptr  |-> weights_pre)
  **  ((( &( "bias" ) )) # Ptr  |-> bias_pre)
  **  ((( &( "scale" ) )) # Ptr  |-> scale_pre)
  **  ((( &( "packed_weights" ) )) # Ptr  |-> packed_weights_pre)
  **  ((( &( "extra_bytes" ) )) # UInt64  |-> extra_bytes_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "address" ) )) # Ptr  |-> address_pre)
|--
  “ (NoDup W ) ”
.

Definition test_equivalence_partial_solve_wit_4_pure_split_goal_2 := 
forall (address_pre: Z) (params_pre: Z) (extra_bytes_pre: Z) (packed_weights_pre: Z) (scale_pre: Z) (bias_pre: Z) (weights_pre: Z) (sr_pre: Z) (kr_pre: Z) (nr_pre: Z) (kc_pre: Z) (nc_pre: Z) (g_pre: Z) (x: Z) (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (retval: Z) (PreH1 : (extra_bytes_pre <= UINT64_MAX)) (PreH2 : (sr_pre <= UINT64_MAX)) (PreH3 : (kr_pre <= UINT64_MAX)) (PreH4 : (nr_pre <= UINT64_MAX)) (PreH5 : (kc_pre <= UINT64_MAX)) (PreH6 : (nc_pre <= UINT64_MAX)) (PreH7 : (g_pre <= UINT64_MAX)) (PreH8 : (extra_bytes_pre >= 0)) (PreH9 : (sr_pre >= 0)) (PreH10 : (kr_pre >= 0)) (PreH11 : (nr_pre >= 0)) (PreH12 : (kc_pre >= 0)) (PreH13 : (nc_pre >= 0)) (PreH14 : (g_pre >= 0)) (PreH15 : (retval <= UINT_MAX)) (PreH16 : (retval >= 0)) (PreH17 : (retval = x)) (PreH18 : (g_pre > 0)) (PreH19 : (nc_pre > 0)) (PreH20 : (kc_pre > 0)) (PreH21 : (weights_pre > 0)) (PreH22 : (packed_weights_pre > 0)) (PreH23 : (g_pre = (pw_groups (G)))) (PreH24 : (nc_pre = (pw_channels (G)))) (PreH25 : (kc_pre = (pw_depth (G)))) (PreH26 : (extra_bytes_pre = (pw_extra_bytes (G)))) (PreH27 : (nr_pre = 2)) (PreH28 : (kr_pre = 1)) (PreH29 : (sr_pre = 1)) (PreH30 : (pw_program_storage F W G )) (PreH31 : (weights_pre = (pw_weights (G)))) (PreH32 : (bias_pre = (pw_bias (G)))) (PreH33 : (packed_weights_pre = (pw_output_base (G)))) (PreH34 : (address_pre > 0)) (PreH35 : (In address_pre W )) (PreH36 : (pw_observation F G O address_pre x )) ,
  ((( &( "right" ) )) # UInt  |->_)
  **  (pw_data F )
  **  (pw_output W (pw_program (F) (G) ((pw_program (F) (G) (O)))) )
  **  ((( &( "left" ) )) # UInt  |-> retval)
  **  ((( &( "g" ) )) # UInt64  |-> g_pre)
  **  ((( &( "nc" ) )) # UInt64  |-> nc_pre)
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "nr" ) )) # UInt64  |-> nr_pre)
  **  ((( &( "kr" ) )) # UInt64  |-> kr_pre)
  **  ((( &( "sr" ) )) # UInt64  |-> sr_pre)
  **  ((( &( "weights" ) )) # Ptr  |-> weights_pre)
  **  ((( &( "bias" ) )) # Ptr  |-> bias_pre)
  **  ((( &( "scale" ) )) # Ptr  |-> scale_pre)
  **  ((( &( "packed_weights" ) )) # Ptr  |-> packed_weights_pre)
  **  ((( &( "extra_bytes" ) )) # UInt64  |-> extra_bytes_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "address" ) )) # Ptr  |-> address_pre)
|--
  “ (pw_exact (pw_program (F) (G) ((pw_program (F) (G) (O)))) address_pre x ) ”
.

Definition test_equivalence_partial_solve_wit_4_aux := 
forall (address_pre: Z) (extra_bytes_pre: Z) (packed_weights_pre: Z) (bias_pre: Z) (weights_pre: Z) (sr_pre: Z) (kr_pre: Z) (nr_pre: Z) (kc_pre: Z) (nc_pre: Z) (g_pre: Z) (x: Z) (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (retval: Z) (PreH1 : (retval = x)) (PreH2 : (g_pre > 0)) (PreH3 : (nc_pre > 0)) (PreH4 : (kc_pre > 0)) (PreH5 : (weights_pre > 0)) (PreH6 : (packed_weights_pre > 0)) (PreH7 : (g_pre = (pw_groups (G)))) (PreH8 : (nc_pre = (pw_channels (G)))) (PreH9 : (kc_pre = (pw_depth (G)))) (PreH10 : (extra_bytes_pre = (pw_extra_bytes (G)))) (PreH11 : (nr_pre = 2)) (PreH12 : (kr_pre = 1)) (PreH13 : (sr_pre = 1)) (PreH14 : (pw_program_storage F W G )) (PreH15 : (weights_pre = (pw_weights (G)))) (PreH16 : (bias_pre = (pw_bias (G)))) (PreH17 : (packed_weights_pre = (pw_output_base (G)))) (PreH18 : (address_pre > 0)) (PreH19 : (In address_pre W )) (PreH20 : (pw_observation F G O address_pre x )) ,
  (pw_data F )
  **  (pw_output W (pw_program (F) (G) ((pw_program (F) (G) (O)))) )
|--
  “ (address_pre > 0) ” 
  &&  “ (In address_pre W ) ” 
  &&  “ (pw_exact (pw_program (F) (G) ((pw_program (F) (G) (O)))) address_pre x ) ” 
  &&  “ (NoDup W ) ” 
  &&  “ (retval = x) ” 
  &&  “ (g_pre > 0) ” 
  &&  “ (nc_pre > 0) ” 
  &&  “ (kc_pre > 0) ” 
  &&  “ (weights_pre > 0) ” 
  &&  “ (packed_weights_pre > 0) ” 
  &&  “ (g_pre = (pw_groups (G))) ” 
  &&  “ (nc_pre = (pw_channels (G))) ” 
  &&  “ (kc_pre = (pw_depth (G))) ” 
  &&  “ (extra_bytes_pre = (pw_extra_bytes (G))) ” 
  &&  “ (nr_pre = 2) ” 
  &&  “ (kr_pre = 1) ” 
  &&  “ (sr_pre = 1) ” 
  &&  “ (pw_program_storage F W G ) ” 
  &&  “ (weights_pre = (pw_weights (G))) ” 
  &&  “ (bias_pre = (pw_bias (G))) ” 
  &&  “ (packed_weights_pre = (pw_output_base (G))) ” 
  &&  “ (address_pre > 0) ” 
  &&  “ (In address_pre W ) ” 
  &&  “ (pw_observation F G O address_pre x ) ”
  &&  (pw_output W (pw_program (F) (G) ((pw_program (F) (G) (O)))) )
  **  (pw_data F )
.

Definition test_equivalence_partial_solve_wit_4 := test_equivalence_partial_solve_wit_4_pure -> test_equivalence_partial_solve_wit_4_aux.

Module Type VC_Correct.


Axiom proof_of_test_equivalence_safety_wit_1 : test_equivalence_safety_wit_1.
Axiom proof_of_test_equivalence_return_wit_1 : test_equivalence_return_wit_1.
Axiom proof_of_test_equivalence_partial_solve_wit_1_pure : test_equivalence_partial_solve_wit_1_pure.
Axiom proof_of_test_equivalence_partial_solve_wit_1 : test_equivalence_partial_solve_wit_1.
Axiom proof_of_test_equivalence_partial_solve_wit_2_pure : test_equivalence_partial_solve_wit_2_pure.
Axiom proof_of_test_equivalence_partial_solve_wit_2 : test_equivalence_partial_solve_wit_2.
Axiom proof_of_test_equivalence_partial_solve_wit_3_pure : test_equivalence_partial_solve_wit_3_pure.
Axiom proof_of_test_equivalence_partial_solve_wit_3 : test_equivalence_partial_solve_wit_3.
Axiom proof_of_test_equivalence_partial_solve_wit_4_pure : test_equivalence_partial_solve_wit_4_pure.
Axiom proof_of_test_equivalence_partial_solve_wit_4 : test_equivalence_partial_solve_wit_4.

End VC_Correct.
