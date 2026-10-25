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
Require Import X32Packw.Types.
Require Import X32Packw.StrideAccessModel X32Packw.VectorModel.
Require Import X32Packw.TileAccessModel.
Local Open Scope sac.

(*----- Function test_rvv -----*)

Definition test_rvv_safety_wit_1 := 
forall (params_pre: Z) (extra_bytes_pre: Z) (packed_weights_pre: Z) (scale_pre: Z) (bias_pre: Z) (weights_pre: Z) (sr_pre: Z) (kr_pre: Z) (nr_pre: Z) (kc_pre: Z) (nc_pre: Z) (g_pre: Z) (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (PreH1 : (g_pre > 0)) (PreH2 : (nc_pre > 0)) (PreH3 : (kc_pre > 0)) (PreH4 : (weights_pre > 0)) (PreH5 : (packed_weights_pre > 0)) (PreH6 : (g_pre = (pw_groups (G)))) (PreH7 : (nc_pre = (pw_channels (G)))) (PreH8 : (kc_pre = (pw_depth (G)))) (PreH9 : (extra_bytes_pre = (pw_extra_bytes (G)))) (PreH10 : (nr_pre = 2)) (PreH11 : (kr_pre = 1)) (PreH12 : (sr_pre = 1)) (PreH13 : (pw_program_storage F W G )) (PreH14 : (weights_pre = (pw_weights (G)))) (PreH15 : (bias_pre = (pw_bias (G)))) (PreH16 : (packed_weights_pre = (pw_output_base (G)))) ,
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
  **  (pw_data F )
  **  (pw_output W O )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition test_rvv_safety_wit_2 := 
forall (params_pre: Z) (extra_bytes_pre: Z) (packed_weights_pre: Z) (scale_pre: Z) (bias_pre: Z) (weights_pre: Z) (sr_pre: Z) (kr_pre: Z) (nr_pre: Z) (kc_pre: Z) (nc_pre: Z) (g_pre: Z) (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (PreH1 : (g_pre = 0)) (PreH2 : (g_pre > 0)) (PreH3 : (nc_pre > 0)) (PreH4 : (kc_pre > 0)) (PreH5 : (weights_pre > 0)) (PreH6 : (packed_weights_pre > 0)) (PreH7 : (g_pre = (pw_groups (G)))) (PreH8 : (nc_pre = (pw_channels (G)))) (PreH9 : (kc_pre = (pw_depth (G)))) (PreH10 : (extra_bytes_pre = (pw_extra_bytes (G)))) (PreH11 : (nr_pre = 2)) (PreH12 : (kr_pre = 1)) (PreH13 : (sr_pre = 1)) (PreH14 : (pw_program_storage F W G )) (PreH15 : (weights_pre = (pw_weights (G)))) (PreH16 : (bias_pre = (pw_bias (G)))) (PreH17 : (packed_weights_pre = (pw_output_base (G)))) ,
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
  **  (pw_data F )
  **  (pw_output W O )
|--
  “ False ”
.

Definition test_rvv_safety_wit_3 := 
forall (params_pre: Z) (extra_bytes_pre: Z) (packed_weights_pre: Z) (scale_pre: Z) (bias_pre: Z) (weights_pre: Z) (sr_pre: Z) (kr_pre: Z) (nr_pre: Z) (kc_pre: Z) (nc_pre: Z) (g_pre: Z) (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (PreH1 : (g_pre <> 0)) (PreH2 : (g_pre > 0)) (PreH3 : (nc_pre > 0)) (PreH4 : (kc_pre > 0)) (PreH5 : (weights_pre > 0)) (PreH6 : (packed_weights_pre > 0)) (PreH7 : (g_pre = (pw_groups (G)))) (PreH8 : (nc_pre = (pw_channels (G)))) (PreH9 : (kc_pre = (pw_depth (G)))) (PreH10 : (extra_bytes_pre = (pw_extra_bytes (G)))) (PreH11 : (nr_pre = 2)) (PreH12 : (kr_pre = 1)) (PreH13 : (sr_pre = 1)) (PreH14 : (pw_program_storage F W G )) (PreH15 : (weights_pre = (pw_weights (G)))) (PreH16 : (bias_pre = (pw_bias (G)))) (PreH17 : (packed_weights_pre = (pw_output_base (G)))) ,
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
  **  (pw_data F )
  **  (pw_output W O )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition test_rvv_safety_wit_4 := 
forall (params_pre: Z) (extra_bytes_pre: Z) (packed_weights_pre: Z) (scale_pre: Z) (bias_pre: Z) (weights_pre: Z) (sr_pre: Z) (kr_pre: Z) (nr_pre: Z) (kc_pre: Z) (nc_pre: Z) (g_pre: Z) (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (PreH1 : (nc_pre = 0)) (PreH2 : (g_pre <> 0)) (PreH3 : (g_pre > 0)) (PreH4 : (nc_pre > 0)) (PreH5 : (kc_pre > 0)) (PreH6 : (weights_pre > 0)) (PreH7 : (packed_weights_pre > 0)) (PreH8 : (g_pre = (pw_groups (G)))) (PreH9 : (nc_pre = (pw_channels (G)))) (PreH10 : (kc_pre = (pw_depth (G)))) (PreH11 : (extra_bytes_pre = (pw_extra_bytes (G)))) (PreH12 : (nr_pre = 2)) (PreH13 : (kr_pre = 1)) (PreH14 : (sr_pre = 1)) (PreH15 : (pw_program_storage F W G )) (PreH16 : (weights_pre = (pw_weights (G)))) (PreH17 : (bias_pre = (pw_bias (G)))) (PreH18 : (packed_weights_pre = (pw_output_base (G)))) ,
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
  **  (pw_data F )
  **  (pw_output W O )
|--
  “ False ”
.

Definition test_rvv_safety_wit_5 := 
forall (params_pre: Z) (extra_bytes_pre: Z) (packed_weights_pre: Z) (scale_pre: Z) (bias_pre: Z) (weights_pre: Z) (sr_pre: Z) (kr_pre: Z) (nr_pre: Z) (kc_pre: Z) (nc_pre: Z) (g_pre: Z) (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (PreH1 : (nc_pre <> 0)) (PreH2 : (g_pre <> 0)) (PreH3 : (g_pre > 0)) (PreH4 : (nc_pre > 0)) (PreH5 : (kc_pre > 0)) (PreH6 : (weights_pre > 0)) (PreH7 : (packed_weights_pre > 0)) (PreH8 : (g_pre = (pw_groups (G)))) (PreH9 : (nc_pre = (pw_channels (G)))) (PreH10 : (kc_pre = (pw_depth (G)))) (PreH11 : (extra_bytes_pre = (pw_extra_bytes (G)))) (PreH12 : (nr_pre = 2)) (PreH13 : (kr_pre = 1)) (PreH14 : (sr_pre = 1)) (PreH15 : (pw_program_storage F W G )) (PreH16 : (weights_pre = (pw_weights (G)))) (PreH17 : (bias_pre = (pw_bias (G)))) (PreH18 : (packed_weights_pre = (pw_output_base (G)))) ,
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
  **  (pw_data F )
  **  (pw_output W O )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition test_rvv_safety_wit_6 := 
forall (params_pre: Z) (extra_bytes_pre: Z) (packed_weights_pre: Z) (scale_pre: Z) (bias_pre: Z) (weights_pre: Z) (sr_pre: Z) (kr_pre: Z) (nr_pre: Z) (kc_pre: Z) (nc_pre: Z) (g_pre: Z) (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (PreH1 : (kc_pre = 0)) (PreH2 : (nc_pre <> 0)) (PreH3 : (g_pre <> 0)) (PreH4 : (g_pre > 0)) (PreH5 : (nc_pre > 0)) (PreH6 : (kc_pre > 0)) (PreH7 : (weights_pre > 0)) (PreH8 : (packed_weights_pre > 0)) (PreH9 : (g_pre = (pw_groups (G)))) (PreH10 : (nc_pre = (pw_channels (G)))) (PreH11 : (kc_pre = (pw_depth (G)))) (PreH12 : (extra_bytes_pre = (pw_extra_bytes (G)))) (PreH13 : (nr_pre = 2)) (PreH14 : (kr_pre = 1)) (PreH15 : (sr_pre = 1)) (PreH16 : (pw_program_storage F W G )) (PreH17 : (weights_pre = (pw_weights (G)))) (PreH18 : (bias_pre = (pw_bias (G)))) (PreH19 : (packed_weights_pre = (pw_output_base (G)))) ,
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
  **  (pw_data F )
  **  (pw_output W O )
|--
  “ False ”
.

Definition test_rvv_safety_wit_7 := 
forall (params_pre: Z) (extra_bytes_pre: Z) (packed_weights_pre: Z) (scale_pre: Z) (bias_pre: Z) (weights_pre: Z) (sr_pre: Z) (kr_pre: Z) (nr_pre: Z) (kc_pre: Z) (nc_pre: Z) (g_pre: Z) (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (PreH1 : (kc_pre <> 0)) (PreH2 : (nc_pre <> 0)) (PreH3 : (g_pre <> 0)) (PreH4 : (g_pre > 0)) (PreH5 : (nc_pre > 0)) (PreH6 : (kc_pre > 0)) (PreH7 : (weights_pre > 0)) (PreH8 : (packed_weights_pre > 0)) (PreH9 : (g_pre = (pw_groups (G)))) (PreH10 : (nc_pre = (pw_channels (G)))) (PreH11 : (kc_pre = (pw_depth (G)))) (PreH12 : (extra_bytes_pre = (pw_extra_bytes (G)))) (PreH13 : (nr_pre = 2)) (PreH14 : (kr_pre = 1)) (PreH15 : (sr_pre = 1)) (PreH16 : (pw_program_storage F W G )) (PreH17 : (weights_pre = (pw_weights (G)))) (PreH18 : (bias_pre = (pw_bias (G)))) (PreH19 : (packed_weights_pre = (pw_output_base (G)))) ,
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
  **  (pw_data F )
  **  (pw_output W O )
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition test_rvv_safety_wit_8 := 
forall (params_pre: Z) (extra_bytes_pre: Z) (packed_weights_pre: Z) (scale_pre: Z) (bias_pre: Z) (weights_pre: Z) (sr_pre: Z) (kr_pre: Z) (nr_pre: Z) (kc_pre: Z) (nc_pre: Z) (g_pre: Z) (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (PreH1 : (nr_pre <> 2)) (PreH2 : (kc_pre <> 0)) (PreH3 : (nc_pre <> 0)) (PreH4 : (g_pre <> 0)) (PreH5 : (g_pre > 0)) (PreH6 : (nc_pre > 0)) (PreH7 : (kc_pre > 0)) (PreH8 : (weights_pre > 0)) (PreH9 : (packed_weights_pre > 0)) (PreH10 : (g_pre = (pw_groups (G)))) (PreH11 : (nc_pre = (pw_channels (G)))) (PreH12 : (kc_pre = (pw_depth (G)))) (PreH13 : (extra_bytes_pre = (pw_extra_bytes (G)))) (PreH14 : (nr_pre = 2)) (PreH15 : (kr_pre = 1)) (PreH16 : (sr_pre = 1)) (PreH17 : (pw_program_storage F W G )) (PreH18 : (weights_pre = (pw_weights (G)))) (PreH19 : (bias_pre = (pw_bias (G)))) (PreH20 : (packed_weights_pre = (pw_output_base (G)))) ,
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
  **  (pw_data F )
  **  (pw_output W O )
|--
  “ False ”
.

Definition test_rvv_safety_wit_9 := 
forall (params_pre: Z) (extra_bytes_pre: Z) (packed_weights_pre: Z) (scale_pre: Z) (bias_pre: Z) (weights_pre: Z) (sr_pre: Z) (kr_pre: Z) (nr_pre: Z) (kc_pre: Z) (nc_pre: Z) (g_pre: Z) (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (PreH1 : (nr_pre = 2)) (PreH2 : (kc_pre <> 0)) (PreH3 : (nc_pre <> 0)) (PreH4 : (g_pre <> 0)) (PreH5 : (g_pre > 0)) (PreH6 : (nc_pre > 0)) (PreH7 : (kc_pre > 0)) (PreH8 : (weights_pre > 0)) (PreH9 : (packed_weights_pre > 0)) (PreH10 : (g_pre = (pw_groups (G)))) (PreH11 : (nc_pre = (pw_channels (G)))) (PreH12 : (kc_pre = (pw_depth (G)))) (PreH13 : (extra_bytes_pre = (pw_extra_bytes (G)))) (PreH14 : (nr_pre = 2)) (PreH15 : (kr_pre = 1)) (PreH16 : (sr_pre = 1)) (PreH17 : (pw_program_storage F W G )) (PreH18 : (weights_pre = (pw_weights (G)))) (PreH19 : (bias_pre = (pw_bias (G)))) (PreH20 : (packed_weights_pre = (pw_output_base (G)))) ,
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
  **  (pw_data F )
  **  (pw_output W O )
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition test_rvv_safety_wit_10 := 
forall (params_pre: Z) (extra_bytes_pre: Z) (packed_weights_pre: Z) (scale_pre: Z) (bias_pre: Z) (weights_pre: Z) (sr_pre: Z) (kr_pre: Z) (nr_pre: Z) (kc_pre: Z) (nc_pre: Z) (g_pre: Z) (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (PreH1 : (kr_pre <> 1)) (PreH2 : (nr_pre = 2)) (PreH3 : (kc_pre <> 0)) (PreH4 : (nc_pre <> 0)) (PreH5 : (g_pre <> 0)) (PreH6 : (g_pre > 0)) (PreH7 : (nc_pre > 0)) (PreH8 : (kc_pre > 0)) (PreH9 : (weights_pre > 0)) (PreH10 : (packed_weights_pre > 0)) (PreH11 : (g_pre = (pw_groups (G)))) (PreH12 : (nc_pre = (pw_channels (G)))) (PreH13 : (kc_pre = (pw_depth (G)))) (PreH14 : (extra_bytes_pre = (pw_extra_bytes (G)))) (PreH15 : (nr_pre = 2)) (PreH16 : (kr_pre = 1)) (PreH17 : (sr_pre = 1)) (PreH18 : (pw_program_storage F W G )) (PreH19 : (weights_pre = (pw_weights (G)))) (PreH20 : (bias_pre = (pw_bias (G)))) (PreH21 : (packed_weights_pre = (pw_output_base (G)))) ,
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
  **  (pw_data F )
  **  (pw_output W O )
|--
  “ False ”
.

Definition test_rvv_safety_wit_11 := 
forall (params_pre: Z) (extra_bytes_pre: Z) (packed_weights_pre: Z) (scale_pre: Z) (bias_pre: Z) (weights_pre: Z) (sr_pre: Z) (kr_pre: Z) (nr_pre: Z) (kc_pre: Z) (nc_pre: Z) (g_pre: Z) (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (PreH1 : (kr_pre = 1)) (PreH2 : (nr_pre = 2)) (PreH3 : (kc_pre <> 0)) (PreH4 : (nc_pre <> 0)) (PreH5 : (g_pre <> 0)) (PreH6 : (g_pre > 0)) (PreH7 : (nc_pre > 0)) (PreH8 : (kc_pre > 0)) (PreH9 : (weights_pre > 0)) (PreH10 : (packed_weights_pre > 0)) (PreH11 : (g_pre = (pw_groups (G)))) (PreH12 : (nc_pre = (pw_channels (G)))) (PreH13 : (kc_pre = (pw_depth (G)))) (PreH14 : (extra_bytes_pre = (pw_extra_bytes (G)))) (PreH15 : (nr_pre = 2)) (PreH16 : (kr_pre = 1)) (PreH17 : (sr_pre = 1)) (PreH18 : (pw_program_storage F W G )) (PreH19 : (weights_pre = (pw_weights (G)))) (PreH20 : (bias_pre = (pw_bias (G)))) (PreH21 : (packed_weights_pre = (pw_output_base (G)))) ,
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
  **  (pw_data F )
  **  (pw_output W O )
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition test_rvv_safety_wit_12 := 
forall (params_pre: Z) (extra_bytes_pre: Z) (packed_weights_pre: Z) (scale_pre: Z) (bias_pre: Z) (weights_pre: Z) (sr_pre: Z) (kr_pre: Z) (nr_pre: Z) (kc_pre: Z) (nc_pre: Z) (g_pre: Z) (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (PreH1 : (sr_pre <> 1)) (PreH2 : (kr_pre = 1)) (PreH3 : (nr_pre = 2)) (PreH4 : (kc_pre <> 0)) (PreH5 : (nc_pre <> 0)) (PreH6 : (g_pre <> 0)) (PreH7 : (g_pre > 0)) (PreH8 : (nc_pre > 0)) (PreH9 : (kc_pre > 0)) (PreH10 : (weights_pre > 0)) (PreH11 : (packed_weights_pre > 0)) (PreH12 : (g_pre = (pw_groups (G)))) (PreH13 : (nc_pre = (pw_channels (G)))) (PreH14 : (kc_pre = (pw_depth (G)))) (PreH15 : (extra_bytes_pre = (pw_extra_bytes (G)))) (PreH16 : (nr_pre = 2)) (PreH17 : (kr_pre = 1)) (PreH18 : (sr_pre = 1)) (PreH19 : (pw_program_storage F W G )) (PreH20 : (weights_pre = (pw_weights (G)))) (PreH21 : (bias_pre = (pw_bias (G)))) (PreH22 : (packed_weights_pre = (pw_output_base (G)))) ,
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
  **  (pw_data F )
  **  (pw_output W O )
|--
  “ False ”
.

Definition test_rvv_safety_wit_13 := 
forall (params_pre: Z) (extra_bytes_pre: Z) (packed_weights_pre: Z) (scale_pre: Z) (bias_pre: Z) (weights_pre: Z) (sr_pre: Z) (kr_pre: Z) (nr_pre: Z) (kc_pre: Z) (nc_pre: Z) (g_pre: Z) (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (PreH1 : (sr_pre = 1)) (PreH2 : (kr_pre = 1)) (PreH3 : (nr_pre = 2)) (PreH4 : (kc_pre <> 0)) (PreH5 : (nc_pre <> 0)) (PreH6 : (g_pre <> 0)) (PreH7 : (g_pre > 0)) (PreH8 : (nc_pre > 0)) (PreH9 : (kc_pre > 0)) (PreH10 : (weights_pre > 0)) (PreH11 : (packed_weights_pre > 0)) (PreH12 : (g_pre = (pw_groups (G)))) (PreH13 : (nc_pre = (pw_channels (G)))) (PreH14 : (kc_pre = (pw_depth (G)))) (PreH15 : (extra_bytes_pre = (pw_extra_bytes (G)))) (PreH16 : (nr_pre = 2)) (PreH17 : (kr_pre = 1)) (PreH18 : (sr_pre = 1)) (PreH19 : (pw_program_storage F W G )) (PreH20 : (weights_pre = (pw_weights (G)))) (PreH21 : (bias_pre = (pw_bias (G)))) (PreH22 : (packed_weights_pre = (pw_output_base (G)))) ,
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
  **  (pw_data F )
  **  (pw_output W O )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition test_rvv_safety_wit_14 := 
forall (params_pre: Z) (extra_bytes_pre: Z) (packed_weights_pre: Z) (scale_pre: Z) (bias_pre: Z) (weights_pre: Z) (sr_pre: Z) (kr_pre: Z) (nr_pre: Z) (kc_pre: Z) (nc_pre: Z) (g_pre: Z) (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (PreH1 : (weights_pre = 0)) (PreH2 : (sr_pre = 1)) (PreH3 : (kr_pre = 1)) (PreH4 : (nr_pre = 2)) (PreH5 : (kc_pre <> 0)) (PreH6 : (nc_pre <> 0)) (PreH7 : (g_pre <> 0)) (PreH8 : (g_pre > 0)) (PreH9 : (nc_pre > 0)) (PreH10 : (kc_pre > 0)) (PreH11 : (weights_pre > 0)) (PreH12 : (packed_weights_pre > 0)) (PreH13 : (g_pre = (pw_groups (G)))) (PreH14 : (nc_pre = (pw_channels (G)))) (PreH15 : (kc_pre = (pw_depth (G)))) (PreH16 : (extra_bytes_pre = (pw_extra_bytes (G)))) (PreH17 : (nr_pre = 2)) (PreH18 : (kr_pre = 1)) (PreH19 : (sr_pre = 1)) (PreH20 : (pw_program_storage F W G )) (PreH21 : (weights_pre = (pw_weights (G)))) (PreH22 : (bias_pre = (pw_bias (G)))) (PreH23 : (packed_weights_pre = (pw_output_base (G)))) ,
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
  **  (pw_data F )
  **  (pw_output W O )
|--
  “ False ”
.

Definition test_rvv_safety_wit_15 := 
forall (params_pre: Z) (extra_bytes_pre: Z) (packed_weights_pre: Z) (scale_pre: Z) (bias_pre: Z) (weights_pre: Z) (sr_pre: Z) (kr_pre: Z) (nr_pre: Z) (kc_pre: Z) (nc_pre: Z) (g_pre: Z) (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (PreH1 : (weights_pre <> 0)) (PreH2 : (sr_pre = 1)) (PreH3 : (kr_pre = 1)) (PreH4 : (nr_pre = 2)) (PreH5 : (kc_pre <> 0)) (PreH6 : (nc_pre <> 0)) (PreH7 : (g_pre <> 0)) (PreH8 : (g_pre > 0)) (PreH9 : (nc_pre > 0)) (PreH10 : (kc_pre > 0)) (PreH11 : (weights_pre > 0)) (PreH12 : (packed_weights_pre > 0)) (PreH13 : (g_pre = (pw_groups (G)))) (PreH14 : (nc_pre = (pw_channels (G)))) (PreH15 : (kc_pre = (pw_depth (G)))) (PreH16 : (extra_bytes_pre = (pw_extra_bytes (G)))) (PreH17 : (nr_pre = 2)) (PreH18 : (kr_pre = 1)) (PreH19 : (sr_pre = 1)) (PreH20 : (pw_program_storage F W G )) (PreH21 : (weights_pre = (pw_weights (G)))) (PreH22 : (bias_pre = (pw_bias (G)))) (PreH23 : (packed_weights_pre = (pw_output_base (G)))) ,
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
  **  (pw_data F )
  **  (pw_output W O )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition test_rvv_safety_wit_16 := 
forall (params_pre: Z) (extra_bytes_pre: Z) (packed_weights_pre: Z) (scale_pre: Z) (bias_pre: Z) (weights_pre: Z) (sr_pre: Z) (kr_pre: Z) (nr_pre: Z) (kc_pre: Z) (nc_pre: Z) (g_pre: Z) (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (PreH1 : (packed_weights_pre = 0)) (PreH2 : (weights_pre <> 0)) (PreH3 : (sr_pre = 1)) (PreH4 : (kr_pre = 1)) (PreH5 : (nr_pre = 2)) (PreH6 : (kc_pre <> 0)) (PreH7 : (nc_pre <> 0)) (PreH8 : (g_pre <> 0)) (PreH9 : (g_pre > 0)) (PreH10 : (nc_pre > 0)) (PreH11 : (kc_pre > 0)) (PreH12 : (weights_pre > 0)) (PreH13 : (packed_weights_pre > 0)) (PreH14 : (g_pre = (pw_groups (G)))) (PreH15 : (nc_pre = (pw_channels (G)))) (PreH16 : (kc_pre = (pw_depth (G)))) (PreH17 : (extra_bytes_pre = (pw_extra_bytes (G)))) (PreH18 : (nr_pre = 2)) (PreH19 : (kr_pre = 1)) (PreH20 : (sr_pre = 1)) (PreH21 : (pw_program_storage F W G )) (PreH22 : (weights_pre = (pw_weights (G)))) (PreH23 : (bias_pre = (pw_bias (G)))) (PreH24 : (packed_weights_pre = (pw_output_base (G)))) ,
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
  **  (pw_data F )
  **  (pw_output W O )
|--
  “ False ”
.

Definition test_rvv_safety_wit_17 := 
forall (params_pre: Z) (extra_bytes_pre: Z) (packed_weights_pre: Z) (scale_pre: Z) (bias_pre: Z) (weights_pre: Z) (sr_pre: Z) (kr_pre: Z) (nr_pre: Z) (kc_pre: Z) (nc_pre: Z) (g_pre: Z) (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (PreH1 : (packed_weights_pre <> 0)) (PreH2 : (weights_pre <> 0)) (PreH3 : (sr_pre = 1)) (PreH4 : (kr_pre = 1)) (PreH5 : (nr_pre = 2)) (PreH6 : (kc_pre <> 0)) (PreH7 : (nc_pre <> 0)) (PreH8 : (g_pre <> 0)) (PreH9 : (g_pre > 0)) (PreH10 : (nc_pre > 0)) (PreH11 : (kc_pre > 0)) (PreH12 : (weights_pre > 0)) (PreH13 : (packed_weights_pre > 0)) (PreH14 : (g_pre = (pw_groups (G)))) (PreH15 : (nc_pre = (pw_channels (G)))) (PreH16 : (kc_pre = (pw_depth (G)))) (PreH17 : (extra_bytes_pre = (pw_extra_bytes (G)))) (PreH18 : (nr_pre = 2)) (PreH19 : (kr_pre = 1)) (PreH20 : (sr_pre = 1)) (PreH21 : (pw_program_storage F W G )) (PreH22 : (weights_pre = (pw_weights (G)))) (PreH23 : (bias_pre = (pw_bias (G)))) (PreH24 : (packed_weights_pre = (pw_output_base (G)))) ,
  ((( &( "group" ) )) # UInt64  |->_)
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
  **  (pw_data F )
  **  (pw_output W O )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition test_rvv_safety_wit_18 := 
forall (params_pre: Z) (scale_pre: Z) (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (packed_weights: Z) (bias: Z) (weights: Z) (group: Z) (sr: Z) (kr: Z) (nr: Z) (extra_bytes: Z) (kc: Z) (nc: Z) (g: Z) (PreH1 : (group < g)) (PreH2 : (g = (pw_groups (G)))) (PreH3 : (nc = (pw_channels (G)))) (PreH4 : (kc = (pw_depth (G)))) (PreH5 : (extra_bytes = (pw_extra_bytes (G)))) (PreH6 : (nr = 2)) (PreH7 : (kr = 1)) (PreH8 : (sr = 1)) (PreH9 : (pw_program_storage F W G )) (PreH10 : (0 <= group)) (PreH11 : (group <= g)) (PreH12 : (weights = (pw_group_weight (G) (group)))) (PreH13 : (bias = (pw_bias_at (G) (group) (0)))) (PreH14 : (packed_weights = (pw_tile_output (G) (group) (0)))) ,
  ((( &( "tile" ) )) # UInt64  |->_)
  **  ((( &( "n" ) )) # UInt64  |-> nc)
  **  ((( &( "w0" ) )) # Ptr  |-> weights)
  **  ((( &( "scale" ) )) # Ptr  |-> scale_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "g" ) )) # UInt64  |-> g)
  **  ((( &( "nc" ) )) # UInt64  |-> nc)
  **  ((( &( "kc" ) )) # UInt64  |-> kc)
  **  ((( &( "extra_bytes" ) )) # UInt64  |-> extra_bytes)
  **  ((( &( "nr" ) )) # UInt64  |-> nr)
  **  ((( &( "kr" ) )) # UInt64  |-> kr)
  **  ((( &( "sr" ) )) # UInt64  |-> sr)
  **  ((( &( "group" ) )) # UInt64  |-> group)
  **  ((( &( "weights" ) )) # Ptr  |-> weights)
  **  ((( &( "bias" ) )) # Ptr  |-> bias)
  **  ((( &( "packed_weights" ) )) # Ptr  |-> packed_weights)
  **  (pw_data F )
  **  (pw_output W (pw_group_state (F) (G) (O) (group)) )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition test_rvv_safety_wit_19 := 
forall (params_pre: Z) (scale_pre: Z) (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (packed_weights: Z) (bias: Z) (w0: Z) (weights: Z) (n: Z) (tile: Z) (group: Z) (sr: Z) (kr: Z) (nr: Z) (extra_bytes: Z) (kc: Z) (nc: Z) (g: Z) (PreH1 : (g = (pw_groups (G)))) (PreH2 : (nc = (pw_channels (G)))) (PreH3 : (kc = (pw_depth (G)))) (PreH4 : (extra_bytes = (pw_extra_bytes (G)))) (PreH5 : (nr = 2)) (PreH6 : (kr = 1)) (PreH7 : (sr = 1)) (PreH8 : (pw_program_storage F W G )) (PreH9 : (0 <= group)) (PreH10 : (group < g)) (PreH11 : (0 <= tile)) (PreH12 : (tile <= (pw_tiles (G)))) (PreH13 : (n = (nc - (2 * tile ) ))) (PreH14 : (0 <= n)) (PreH15 : (n <= nc)) (PreH16 : (weights = (pw_group_weight (G) (group)))) (PreH17 : (w0 = (pw_tile_weight (G) (group) (tile)))) (PreH18 : (bias = (pw_bias_at (G) (group) ((2 * tile ))))) (PreH19 : (packed_weights = (pw_tile_output (G) (group) (tile)))) ,
  ((( &( "scale" ) )) # Ptr  |-> scale_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "g" ) )) # UInt64  |-> g)
  **  ((( &( "nc" ) )) # UInt64  |-> nc)
  **  ((( &( "kc" ) )) # UInt64  |-> kc)
  **  ((( &( "extra_bytes" ) )) # UInt64  |-> extra_bytes)
  **  ((( &( "nr" ) )) # UInt64  |-> nr)
  **  ((( &( "kr" ) )) # UInt64  |-> kr)
  **  ((( &( "sr" ) )) # UInt64  |-> sr)
  **  ((( &( "group" ) )) # UInt64  |-> group)
  **  ((( &( "tile" ) )) # UInt64  |-> tile)
  **  ((( &( "n" ) )) # UInt64  |-> n)
  **  ((( &( "weights" ) )) # Ptr  |-> weights)
  **  ((( &( "w0" ) )) # Ptr  |-> w0)
  **  ((( &( "bias" ) )) # Ptr  |-> bias)
  **  ((( &( "packed_weights" ) )) # Ptr  |-> packed_weights)
  **  (pw_data F )
  **  (pw_output W (pw_tile_state (F) (G) (O) (group) (tile)) )
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition test_rvv_safety_wit_20 := 
forall (params_pre: Z) (scale_pre: Z) (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (packed_weights: Z) (bias: Z) (w0: Z) (weights: Z) (n: Z) (tile: Z) (group: Z) (sr: Z) (kr: Z) (nr: Z) (extra_bytes: Z) (kc: Z) (nc: Z) (g: Z) (PreH1 : (n >= 2)) (PreH2 : (g = (pw_groups (G)))) (PreH3 : (nc = (pw_channels (G)))) (PreH4 : (kc = (pw_depth (G)))) (PreH5 : (extra_bytes = (pw_extra_bytes (G)))) (PreH6 : (nr = 2)) (PreH7 : (kr = 1)) (PreH8 : (sr = 1)) (PreH9 : (pw_program_storage F W G )) (PreH10 : (0 <= group)) (PreH11 : (group < g)) (PreH12 : (0 <= tile)) (PreH13 : (tile <= (pw_tiles (G)))) (PreH14 : (n = (nc - (2 * tile ) ))) (PreH15 : (0 <= n)) (PreH16 : (n <= nc)) (PreH17 : (weights = (pw_group_weight (G) (group)))) (PreH18 : (w0 = (pw_tile_weight (G) (group) (tile)))) (PreH19 : (bias = (pw_bias_at (G) (group) ((2 * tile ))))) (PreH20 : (packed_weights = (pw_tile_output (G) (group) (tile)))) ,
  ((( &( "scale" ) )) # Ptr  |-> scale_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "g" ) )) # UInt64  |-> g)
  **  ((( &( "nc" ) )) # UInt64  |-> nc)
  **  ((( &( "kc" ) )) # UInt64  |-> kc)
  **  ((( &( "extra_bytes" ) )) # UInt64  |-> extra_bytes)
  **  ((( &( "nr" ) )) # UInt64  |-> nr)
  **  ((( &( "kr" ) )) # UInt64  |-> kr)
  **  ((( &( "sr" ) )) # UInt64  |-> sr)
  **  ((( &( "group" ) )) # UInt64  |-> group)
  **  ((( &( "tile" ) )) # UInt64  |-> tile)
  **  ((( &( "n" ) )) # UInt64  |-> n)
  **  ((( &( "weights" ) )) # Ptr  |-> weights)
  **  ((( &( "w0" ) )) # Ptr  |-> w0)
  **  ((( &( "bias" ) )) # Ptr  |-> bias)
  **  ((( &( "packed_weights" ) )) # Ptr  |-> packed_weights)
  **  (pw_data F )
  **  (pw_output W (pw_tile_state (F) (G) (O) (group) (tile)) )
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition test_rvv_safety_wit_21 := 
forall (params_pre: Z) (scale_pre: Z) (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (packed_weights: Z) (bias: Z) (w0: Z) (weights: Z) (n: Z) (tile: Z) (group: Z) (sr: Z) (kr: Z) (nr: Z) (extra_bytes: Z) (kc: Z) (nc: Z) (g: Z) (PreH1 : (n >= 2)) (PreH2 : (g = (pw_groups (G)))) (PreH3 : (nc = (pw_channels (G)))) (PreH4 : (kc = (pw_depth (G)))) (PreH5 : (extra_bytes = (pw_extra_bytes (G)))) (PreH6 : (nr = 2)) (PreH7 : (kr = 1)) (PreH8 : (sr = 1)) (PreH9 : (pw_program_storage F W G )) (PreH10 : (0 <= group)) (PreH11 : (group < g)) (PreH12 : (0 <= tile)) (PreH13 : (tile <= (pw_tiles (G)))) (PreH14 : (n = (nc - (2 * tile ) ))) (PreH15 : (0 <= n)) (PreH16 : (n <= nc)) (PreH17 : (weights = (pw_group_weight (G) (group)))) (PreH18 : (w0 = (pw_tile_weight (G) (group) (tile)))) (PreH19 : (bias = (pw_bias_at (G) (group) ((2 * tile ))))) (PreH20 : (packed_weights = (pw_tile_output (G) (group) (tile)))) ,
  (pw_data F )
  **  (pw_output W (pw_header_run (F) (bias) (packed_weights) (2) ((pw_tile_state (F) (G) (O) (group) (tile)))) )
  **  ((( &( "scale" ) )) # Ptr  |-> scale_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "g" ) )) # UInt64  |-> g)
  **  ((( &( "nc" ) )) # UInt64  |-> nc)
  **  ((( &( "kc" ) )) # UInt64  |-> kc)
  **  ((( &( "extra_bytes" ) )) # UInt64  |-> extra_bytes)
  **  ((( &( "nr" ) )) # UInt64  |-> nr)
  **  ((( &( "kr" ) )) # UInt64  |-> kr)
  **  ((( &( "sr" ) )) # UInt64  |-> sr)
  **  ((( &( "group" ) )) # UInt64  |-> group)
  **  ((( &( "tile" ) )) # UInt64  |-> tile)
  **  ((( &( "n" ) )) # UInt64  |-> n)
  **  ((( &( "weights" ) )) # Ptr  |-> weights)
  **  ((( &( "w0" ) )) # Ptr  |-> w0)
  **  ((( &( "bias" ) )) # Ptr  |-> bias)
  **  ((( &( "packed_weights" ) )) # Ptr  |-> packed_weights)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition test_rvv_safety_wit_22 := 
forall (params_pre: Z) (scale_pre: Z) (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (packed_weights: Z) (bias: Z) (w0: Z) (weights: Z) (n: Z) (tile: Z) (group: Z) (sr: Z) (kr: Z) (nr: Z) (extra_bytes: Z) (kc: Z) (nc: Z) (g: Z) (PreH1 : (bias <> 0)) (PreH2 : (n >= 2)) (PreH3 : (g = (pw_groups (G)))) (PreH4 : (nc = (pw_channels (G)))) (PreH5 : (kc = (pw_depth (G)))) (PreH6 : (extra_bytes = (pw_extra_bytes (G)))) (PreH7 : (nr = 2)) (PreH8 : (kr = 1)) (PreH9 : (sr = 1)) (PreH10 : (pw_program_storage F W G )) (PreH11 : (0 <= group)) (PreH12 : (group < g)) (PreH13 : (0 <= tile)) (PreH14 : (tile <= (pw_tiles (G)))) (PreH15 : (n = (nc - (2 * tile ) ))) (PreH16 : (0 <= n)) (PreH17 : (n <= nc)) (PreH18 : (weights = (pw_group_weight (G) (group)))) (PreH19 : (w0 = (pw_tile_weight (G) (group) (tile)))) (PreH20 : (bias = (pw_bias_at (G) (group) ((2 * tile ))))) (PreH21 : (packed_weights = (pw_tile_output (G) (group) (tile)))) ,
  (pw_data F )
  **  (pw_output W (pw_header_run (F) (bias) (packed_weights) (2) ((pw_tile_state (F) (G) (O) (group) (tile)))) )
  **  ((( &( "scale" ) )) # Ptr  |-> scale_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "g" ) )) # UInt64  |-> g)
  **  ((( &( "nc" ) )) # UInt64  |-> nc)
  **  ((( &( "kc" ) )) # UInt64  |-> kc)
  **  ((( &( "extra_bytes" ) )) # UInt64  |-> extra_bytes)
  **  ((( &( "nr" ) )) # UInt64  |-> nr)
  **  ((( &( "kr" ) )) # UInt64  |-> kr)
  **  ((( &( "sr" ) )) # UInt64  |-> sr)
  **  ((( &( "group" ) )) # UInt64  |-> group)
  **  ((( &( "tile" ) )) # UInt64  |-> tile)
  **  ((( &( "n" ) )) # UInt64  |-> n)
  **  ((( &( "weights" ) )) # Ptr  |-> weights)
  **  ((( &( "w0" ) )) # Ptr  |-> w0)
  **  ((( &( "bias" ) )) # Ptr  |-> bias)
  **  ((( &( "packed_weights" ) )) # Ptr  |-> packed_weights)
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition test_rvv_safety_wit_23 := 
forall (params_pre: Z) (scale_pre: Z) (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (packed_weights: Z) (bias: Z) (w0: Z) (weights: Z) (n: Z) (tile: Z) (group: Z) (sr: Z) (kr: Z) (nr: Z) (extra_bytes: Z) (kc: Z) (nc: Z) (g: Z) (PreH1 : (bias <> 0)) (PreH2 : (n >= 2)) (PreH3 : (g = (pw_groups (G)))) (PreH4 : (nc = (pw_channels (G)))) (PreH5 : (kc = (pw_depth (G)))) (PreH6 : (extra_bytes = (pw_extra_bytes (G)))) (PreH7 : (nr = 2)) (PreH8 : (kr = 1)) (PreH9 : (sr = 1)) (PreH10 : (pw_program_storage F W G )) (PreH11 : (0 <= group)) (PreH12 : (group < g)) (PreH13 : (0 <= tile)) (PreH14 : (tile <= (pw_tiles (G)))) (PreH15 : (n = (nc - (2 * tile ) ))) (PreH16 : (0 <= n)) (PreH17 : (n <= nc)) (PreH18 : (weights = (pw_group_weight (G) (group)))) (PreH19 : (w0 = (pw_tile_weight (G) (group) (tile)))) (PreH20 : (bias = (pw_bias_at (G) (group) ((2 * tile ))))) (PreH21 : (packed_weights = (pw_tile_output (G) (group) (tile)))) ,
  (pw_data F )
  **  (pw_output W (pw_header_run (F) (bias) (packed_weights) (2) ((pw_tile_state (F) (G) (O) (group) (tile)))) )
  **  ((( &( "scale" ) )) # Ptr  |-> scale_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "g" ) )) # UInt64  |-> g)
  **  ((( &( "nc" ) )) # UInt64  |-> nc)
  **  ((( &( "kc" ) )) # UInt64  |-> kc)
  **  ((( &( "extra_bytes" ) )) # UInt64  |-> extra_bytes)
  **  ((( &( "nr" ) )) # UInt64  |-> nr)
  **  ((( &( "kr" ) )) # UInt64  |-> kr)
  **  ((( &( "sr" ) )) # UInt64  |-> sr)
  **  ((( &( "group" ) )) # UInt64  |-> group)
  **  ((( &( "tile" ) )) # UInt64  |-> tile)
  **  ((( &( "n" ) )) # UInt64  |-> n)
  **  ((( &( "weights" ) )) # Ptr  |-> weights)
  **  ((( &( "w0" ) )) # Ptr  |-> w0)
  **  ((( &( "bias" ) )) # Ptr  |-> (bias + (2 * sizeof(UINT))))
  **  ((( &( "packed_weights" ) )) # Ptr  |-> packed_weights)
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition test_rvv_safety_wit_24 := 
forall (params_pre: Z) (scale_pre: Z) (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (packed_weights: Z) (bias: Z) (w0: Z) (weights: Z) (n: Z) (tile: Z) (group: Z) (sr: Z) (kr: Z) (nr: Z) (extra_bytes: Z) (kc: Z) (nc: Z) (g: Z) (PreH1 : (bias = 0)) (PreH2 : (n >= 2)) (PreH3 : (g = (pw_groups (G)))) (PreH4 : (nc = (pw_channels (G)))) (PreH5 : (kc = (pw_depth (G)))) (PreH6 : (extra_bytes = (pw_extra_bytes (G)))) (PreH7 : (nr = 2)) (PreH8 : (kr = 1)) (PreH9 : (sr = 1)) (PreH10 : (pw_program_storage F W G )) (PreH11 : (0 <= group)) (PreH12 : (group < g)) (PreH13 : (0 <= tile)) (PreH14 : (tile <= (pw_tiles (G)))) (PreH15 : (n = (nc - (2 * tile ) ))) (PreH16 : (0 <= n)) (PreH17 : (n <= nc)) (PreH18 : (weights = (pw_group_weight (G) (group)))) (PreH19 : (w0 = (pw_tile_weight (G) (group) (tile)))) (PreH20 : (bias = (pw_bias_at (G) (group) ((2 * tile ))))) (PreH21 : (packed_weights = (pw_tile_output (G) (group) (tile)))) ,
  (pw_data F )
  **  (pw_output W (pw_header_run (F) (bias) (packed_weights) (2) ((pw_tile_state (F) (G) (O) (group) (tile)))) )
  **  ((( &( "scale" ) )) # Ptr  |-> scale_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "g" ) )) # UInt64  |-> g)
  **  ((( &( "nc" ) )) # UInt64  |-> nc)
  **  ((( &( "kc" ) )) # UInt64  |-> kc)
  **  ((( &( "extra_bytes" ) )) # UInt64  |-> extra_bytes)
  **  ((( &( "nr" ) )) # UInt64  |-> nr)
  **  ((( &( "kr" ) )) # UInt64  |-> kr)
  **  ((( &( "sr" ) )) # UInt64  |-> sr)
  **  ((( &( "group" ) )) # UInt64  |-> group)
  **  ((( &( "tile" ) )) # UInt64  |-> tile)
  **  ((( &( "n" ) )) # UInt64  |-> n)
  **  ((( &( "weights" ) )) # Ptr  |-> weights)
  **  ((( &( "w0" ) )) # Ptr  |-> w0)
  **  ((( &( "bias" ) )) # Ptr  |-> bias)
  **  ((( &( "packed_weights" ) )) # Ptr  |-> packed_weights)
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition test_rvv_safety_wit_25 := 
forall (params_pre: Z) (scale_pre: Z) (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (packed_weights: Z) (bias: Z) (w0: Z) (weights: Z) (n: Z) (tile: Z) (group: Z) (sr: Z) (kr: Z) (nr: Z) (extra_bytes: Z) (kc: Z) (nc: Z) (g: Z) (PreH1 : (bias <> 0)) (PreH2 : (n >= 2)) (PreH3 : (g = (pw_groups (G)))) (PreH4 : (nc = (pw_channels (G)))) (PreH5 : (kc = (pw_depth (G)))) (PreH6 : (extra_bytes = (pw_extra_bytes (G)))) (PreH7 : (nr = 2)) (PreH8 : (kr = 1)) (PreH9 : (sr = 1)) (PreH10 : (pw_program_storage F W G )) (PreH11 : (0 <= group)) (PreH12 : (group < g)) (PreH13 : (0 <= tile)) (PreH14 : (tile <= (pw_tiles (G)))) (PreH15 : (n = (nc - (2 * tile ) ))) (PreH16 : (0 <= n)) (PreH17 : (n <= nc)) (PreH18 : (weights = (pw_group_weight (G) (group)))) (PreH19 : (w0 = (pw_tile_weight (G) (group) (tile)))) (PreH20 : (bias = (pw_bias_at (G) (group) ((2 * tile ))))) (PreH21 : (packed_weights = (pw_tile_output (G) (group) (tile)))) ,
  (pw_data F )
  **  (pw_output W (pw_pair_run (kc) (F) (w0) ((w0 + (kc * sizeof(UINT)))) ((packed_weights + (2 * sizeof(UINT)))) ((pw_header_run (F) ((pw_bias_at (G) (group) ((2 * tile )))) ((pw_tile_output (G) (group) (tile))) (2) ((pw_tile_state (F) (G) (O) (group) (tile)))))) )
  **  ((( &( "w1" ) )) # Ptr  |-> (w0 + (kc * sizeof(UINT))))
  **  ((( &( "scale" ) )) # Ptr  |-> scale_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "g" ) )) # UInt64  |-> g)
  **  ((( &( "nc" ) )) # UInt64  |-> nc)
  **  ((( &( "kc" ) )) # UInt64  |-> kc)
  **  ((( &( "extra_bytes" ) )) # UInt64  |-> extra_bytes)
  **  ((( &( "nr" ) )) # UInt64  |-> nr)
  **  ((( &( "kr" ) )) # UInt64  |-> kr)
  **  ((( &( "sr" ) )) # UInt64  |-> sr)
  **  ((( &( "group" ) )) # UInt64  |-> group)
  **  ((( &( "tile" ) )) # UInt64  |-> tile)
  **  ((( &( "n" ) )) # UInt64  |-> n)
  **  ((( &( "weights" ) )) # Ptr  |-> weights)
  **  ((( &( "w0" ) )) # Ptr  |-> w0)
  **  ((( &( "bias" ) )) # Ptr  |-> (bias + (2 * sizeof(UINT))))
  **  ((( &( "packed_weights" ) )) # Ptr  |-> (packed_weights + (2 * sizeof(UINT))))
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition test_rvv_safety_wit_26 := 
forall (params_pre: Z) (scale_pre: Z) (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (packed_weights: Z) (bias: Z) (w0: Z) (weights: Z) (n: Z) (tile: Z) (group: Z) (sr: Z) (kr: Z) (nr: Z) (extra_bytes: Z) (kc: Z) (nc: Z) (g: Z) (PreH1 : (bias = 0)) (PreH2 : (n >= 2)) (PreH3 : (g = (pw_groups (G)))) (PreH4 : (nc = (pw_channels (G)))) (PreH5 : (kc = (pw_depth (G)))) (PreH6 : (extra_bytes = (pw_extra_bytes (G)))) (PreH7 : (nr = 2)) (PreH8 : (kr = 1)) (PreH9 : (sr = 1)) (PreH10 : (pw_program_storage F W G )) (PreH11 : (0 <= group)) (PreH12 : (group < g)) (PreH13 : (0 <= tile)) (PreH14 : (tile <= (pw_tiles (G)))) (PreH15 : (n = (nc - (2 * tile ) ))) (PreH16 : (0 <= n)) (PreH17 : (n <= nc)) (PreH18 : (weights = (pw_group_weight (G) (group)))) (PreH19 : (w0 = (pw_tile_weight (G) (group) (tile)))) (PreH20 : (bias = (pw_bias_at (G) (group) ((2 * tile ))))) (PreH21 : (packed_weights = (pw_tile_output (G) (group) (tile)))) ,
  (pw_data F )
  **  (pw_output W (pw_pair_run (kc) (F) (w0) ((w0 + (kc * sizeof(UINT)))) ((packed_weights + (2 * sizeof(UINT)))) ((pw_header_run (F) (0) ((pw_tile_output (G) (group) (tile))) (2) ((pw_tile_state (F) (G) (O) (group) (tile)))))) )
  **  ((( &( "w1" ) )) # Ptr  |-> (w0 + (kc * sizeof(UINT))))
  **  ((( &( "scale" ) )) # Ptr  |-> scale_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "g" ) )) # UInt64  |-> g)
  **  ((( &( "nc" ) )) # UInt64  |-> nc)
  **  ((( &( "kc" ) )) # UInt64  |-> kc)
  **  ((( &( "extra_bytes" ) )) # UInt64  |-> extra_bytes)
  **  ((( &( "nr" ) )) # UInt64  |-> nr)
  **  ((( &( "kr" ) )) # UInt64  |-> kr)
  **  ((( &( "sr" ) )) # UInt64  |-> sr)
  **  ((( &( "group" ) )) # UInt64  |-> group)
  **  ((( &( "tile" ) )) # UInt64  |-> tile)
  **  ((( &( "n" ) )) # UInt64  |-> n)
  **  ((( &( "weights" ) )) # Ptr  |-> weights)
  **  ((( &( "w0" ) )) # Ptr  |-> w0)
  **  ((( &( "bias" ) )) # Ptr  |-> bias)
  **  ((( &( "packed_weights" ) )) # Ptr  |-> (packed_weights + (2 * sizeof(UINT))))
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition test_rvv_safety_wit_27 := 
forall (params_pre: Z) (scale_pre: Z) (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (packed_weights: Z) (bias: Z) (w0: Z) (weights: Z) (n: Z) (tile: Z) (group: Z) (sr: Z) (kr: Z) (nr: Z) (extra_bytes: Z) (kc: Z) (nc: Z) (g: Z) (PreH1 : (bias <> 0)) (PreH2 : (n >= 2)) (PreH3 : (g = (pw_groups (G)))) (PreH4 : (nc = (pw_channels (G)))) (PreH5 : (kc = (pw_depth (G)))) (PreH6 : (extra_bytes = (pw_extra_bytes (G)))) (PreH7 : (nr = 2)) (PreH8 : (kr = 1)) (PreH9 : (sr = 1)) (PreH10 : (pw_program_storage F W G )) (PreH11 : (0 <= group)) (PreH12 : (group < g)) (PreH13 : (0 <= tile)) (PreH14 : (tile <= (pw_tiles (G)))) (PreH15 : (n = (nc - (2 * tile ) ))) (PreH16 : (0 <= n)) (PreH17 : (n <= nc)) (PreH18 : (weights = (pw_group_weight (G) (group)))) (PreH19 : (w0 = (pw_tile_weight (G) (group) (tile)))) (PreH20 : (bias = (pw_bias_at (G) (group) ((2 * tile ))))) (PreH21 : (packed_weights = (pw_tile_output (G) (group) (tile)))) ,
  (pw_data F )
  **  (pw_output W (pw_pair_run (kc) (F) (w0) ((w0 + (kc * sizeof(UINT)))) ((packed_weights + (2 * sizeof(UINT)))) ((pw_header_run (F) ((pw_bias_at (G) (group) ((2 * tile )))) ((pw_tile_output (G) (group) (tile))) (2) ((pw_tile_state (F) (G) (O) (group) (tile)))))) )
  **  ((( &( "w1" ) )) # Ptr  |-> (w0 + (kc * sizeof(UINT))))
  **  ((( &( "scale" ) )) # Ptr  |-> scale_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "g" ) )) # UInt64  |-> g)
  **  ((( &( "nc" ) )) # UInt64  |-> nc)
  **  ((( &( "kc" ) )) # UInt64  |-> kc)
  **  ((( &( "extra_bytes" ) )) # UInt64  |-> extra_bytes)
  **  ((( &( "nr" ) )) # UInt64  |-> nr)
  **  ((( &( "kr" ) )) # UInt64  |-> kr)
  **  ((( &( "sr" ) )) # UInt64  |-> sr)
  **  ((( &( "group" ) )) # UInt64  |-> group)
  **  ((( &( "tile" ) )) # UInt64  |-> tile)
  **  ((( &( "n" ) )) # UInt64  |-> n)
  **  ((( &( "weights" ) )) # Ptr  |-> weights)
  **  ((( &( "w0" ) )) # Ptr  |-> (w0 + ((kc + kc ) * sizeof(UINT))))
  **  ((( &( "bias" ) )) # Ptr  |-> (bias + (2 * sizeof(UINT))))
  **  ((( &( "packed_weights" ) )) # Ptr  |-> (unsigned_last_nbits (((unsigned_last_nbits ((packed_weights + ((2 + (unsigned_last_nbits ((2 * kc )) (64)) ) * sizeof(UINT)))) (64)) + extra_bytes )) (64)))
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition test_rvv_safety_wit_28 := 
forall (params_pre: Z) (scale_pre: Z) (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (packed_weights: Z) (bias: Z) (w0: Z) (weights: Z) (n: Z) (tile: Z) (group: Z) (sr: Z) (kr: Z) (nr: Z) (extra_bytes: Z) (kc: Z) (nc: Z) (g: Z) (PreH1 : (bias = 0)) (PreH2 : (n >= 2)) (PreH3 : (g = (pw_groups (G)))) (PreH4 : (nc = (pw_channels (G)))) (PreH5 : (kc = (pw_depth (G)))) (PreH6 : (extra_bytes = (pw_extra_bytes (G)))) (PreH7 : (nr = 2)) (PreH8 : (kr = 1)) (PreH9 : (sr = 1)) (PreH10 : (pw_program_storage F W G )) (PreH11 : (0 <= group)) (PreH12 : (group < g)) (PreH13 : (0 <= tile)) (PreH14 : (tile <= (pw_tiles (G)))) (PreH15 : (n = (nc - (2 * tile ) ))) (PreH16 : (0 <= n)) (PreH17 : (n <= nc)) (PreH18 : (weights = (pw_group_weight (G) (group)))) (PreH19 : (w0 = (pw_tile_weight (G) (group) (tile)))) (PreH20 : (bias = (pw_bias_at (G) (group) ((2 * tile ))))) (PreH21 : (packed_weights = (pw_tile_output (G) (group) (tile)))) ,
  (pw_data F )
  **  (pw_output W (pw_pair_run (kc) (F) (w0) ((w0 + (kc * sizeof(UINT)))) ((packed_weights + (2 * sizeof(UINT)))) ((pw_header_run (F) (0) ((pw_tile_output (G) (group) (tile))) (2) ((pw_tile_state (F) (G) (O) (group) (tile)))))) )
  **  ((( &( "w1" ) )) # Ptr  |-> (w0 + (kc * sizeof(UINT))))
  **  ((( &( "scale" ) )) # Ptr  |-> scale_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "g" ) )) # UInt64  |-> g)
  **  ((( &( "nc" ) )) # UInt64  |-> nc)
  **  ((( &( "kc" ) )) # UInt64  |-> kc)
  **  ((( &( "extra_bytes" ) )) # UInt64  |-> extra_bytes)
  **  ((( &( "nr" ) )) # UInt64  |-> nr)
  **  ((( &( "kr" ) )) # UInt64  |-> kr)
  **  ((( &( "sr" ) )) # UInt64  |-> sr)
  **  ((( &( "group" ) )) # UInt64  |-> group)
  **  ((( &( "tile" ) )) # UInt64  |-> tile)
  **  ((( &( "n" ) )) # UInt64  |-> n)
  **  ((( &( "weights" ) )) # Ptr  |-> weights)
  **  ((( &( "w0" ) )) # Ptr  |-> (w0 + ((kc + kc ) * sizeof(UINT))))
  **  ((( &( "bias" ) )) # Ptr  |-> bias)
  **  ((( &( "packed_weights" ) )) # Ptr  |-> (unsigned_last_nbits (((unsigned_last_nbits ((packed_weights + ((2 + (unsigned_last_nbits ((2 * kc )) (64)) ) * sizeof(UINT)))) (64)) + extra_bytes )) (64)))
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition test_rvv_safety_wit_29 := 
forall (params_pre: Z) (scale_pre: Z) (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (packed_weights: Z) (bias: Z) (w0: Z) (weights: Z) (n: Z) (tile: Z) (group: Z) (sr: Z) (kr: Z) (nr: Z) (extra_bytes: Z) (kc: Z) (nc: Z) (g: Z) (PreH1 : (bias <> 0)) (PreH2 : (n >= 2)) (PreH3 : (g = (pw_groups (G)))) (PreH4 : (nc = (pw_channels (G)))) (PreH5 : (kc = (pw_depth (G)))) (PreH6 : (extra_bytes = (pw_extra_bytes (G)))) (PreH7 : (nr = 2)) (PreH8 : (kr = 1)) (PreH9 : (sr = 1)) (PreH10 : (pw_program_storage F W G )) (PreH11 : (0 <= group)) (PreH12 : (group < g)) (PreH13 : (0 <= tile)) (PreH14 : (tile <= (pw_tiles (G)))) (PreH15 : (n = (nc - (2 * tile ) ))) (PreH16 : (0 <= n)) (PreH17 : (n <= nc)) (PreH18 : (weights = (pw_group_weight (G) (group)))) (PreH19 : (w0 = (pw_tile_weight (G) (group) (tile)))) (PreH20 : (bias = (pw_bias_at (G) (group) ((2 * tile ))))) (PreH21 : (packed_weights = (pw_tile_output (G) (group) (tile)))) ,
  (pw_data F )
  **  (pw_output W (pw_pair_run (kc) (F) (w0) ((w0 + (kc * sizeof(UINT)))) ((packed_weights + (2 * sizeof(UINT)))) ((pw_header_run (F) ((pw_bias_at (G) (group) ((2 * tile )))) ((pw_tile_output (G) (group) (tile))) (2) ((pw_tile_state (F) (G) (O) (group) (tile)))))) )
  **  ((( &( "w1" ) )) # Ptr  |-> (w0 + (kc * sizeof(UINT))))
  **  ((( &( "scale" ) )) # Ptr  |-> scale_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "g" ) )) # UInt64  |-> g)
  **  ((( &( "nc" ) )) # UInt64  |-> nc)
  **  ((( &( "kc" ) )) # UInt64  |-> kc)
  **  ((( &( "extra_bytes" ) )) # UInt64  |-> extra_bytes)
  **  ((( &( "nr" ) )) # UInt64  |-> nr)
  **  ((( &( "kr" ) )) # UInt64  |-> kr)
  **  ((( &( "sr" ) )) # UInt64  |-> sr)
  **  ((( &( "group" ) )) # UInt64  |-> group)
  **  ((( &( "tile" ) )) # UInt64  |-> tile)
  **  ((( &( "n" ) )) # UInt64  |-> (n - 2 ))
  **  ((( &( "weights" ) )) # Ptr  |-> weights)
  **  ((( &( "w0" ) )) # Ptr  |-> (w0 + ((kc + kc ) * sizeof(UINT))))
  **  ((( &( "bias" ) )) # Ptr  |-> (bias + (2 * sizeof(UINT))))
  **  ((( &( "packed_weights" ) )) # Ptr  |-> (unsigned_last_nbits (((unsigned_last_nbits ((packed_weights + ((2 + (unsigned_last_nbits ((2 * kc )) (64)) ) * sizeof(UINT)))) (64)) + extra_bytes )) (64)))
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition test_rvv_safety_wit_30 := 
forall (params_pre: Z) (scale_pre: Z) (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (packed_weights: Z) (bias: Z) (w0: Z) (weights: Z) (n: Z) (tile: Z) (group: Z) (sr: Z) (kr: Z) (nr: Z) (extra_bytes: Z) (kc: Z) (nc: Z) (g: Z) (PreH1 : (bias = 0)) (PreH2 : (n >= 2)) (PreH3 : (g = (pw_groups (G)))) (PreH4 : (nc = (pw_channels (G)))) (PreH5 : (kc = (pw_depth (G)))) (PreH6 : (extra_bytes = (pw_extra_bytes (G)))) (PreH7 : (nr = 2)) (PreH8 : (kr = 1)) (PreH9 : (sr = 1)) (PreH10 : (pw_program_storage F W G )) (PreH11 : (0 <= group)) (PreH12 : (group < g)) (PreH13 : (0 <= tile)) (PreH14 : (tile <= (pw_tiles (G)))) (PreH15 : (n = (nc - (2 * tile ) ))) (PreH16 : (0 <= n)) (PreH17 : (n <= nc)) (PreH18 : (weights = (pw_group_weight (G) (group)))) (PreH19 : (w0 = (pw_tile_weight (G) (group) (tile)))) (PreH20 : (bias = (pw_bias_at (G) (group) ((2 * tile ))))) (PreH21 : (packed_weights = (pw_tile_output (G) (group) (tile)))) ,
  (pw_data F )
  **  (pw_output W (pw_pair_run (kc) (F) (w0) ((w0 + (kc * sizeof(UINT)))) ((packed_weights + (2 * sizeof(UINT)))) ((pw_header_run (F) (0) ((pw_tile_output (G) (group) (tile))) (2) ((pw_tile_state (F) (G) (O) (group) (tile)))))) )
  **  ((( &( "w1" ) )) # Ptr  |-> (w0 + (kc * sizeof(UINT))))
  **  ((( &( "scale" ) )) # Ptr  |-> scale_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "g" ) )) # UInt64  |-> g)
  **  ((( &( "nc" ) )) # UInt64  |-> nc)
  **  ((( &( "kc" ) )) # UInt64  |-> kc)
  **  ((( &( "extra_bytes" ) )) # UInt64  |-> extra_bytes)
  **  ((( &( "nr" ) )) # UInt64  |-> nr)
  **  ((( &( "kr" ) )) # UInt64  |-> kr)
  **  ((( &( "sr" ) )) # UInt64  |-> sr)
  **  ((( &( "group" ) )) # UInt64  |-> group)
  **  ((( &( "tile" ) )) # UInt64  |-> tile)
  **  ((( &( "n" ) )) # UInt64  |-> (n - 2 ))
  **  ((( &( "weights" ) )) # Ptr  |-> weights)
  **  ((( &( "w0" ) )) # Ptr  |-> (w0 + ((kc + kc ) * sizeof(UINT))))
  **  ((( &( "bias" ) )) # Ptr  |-> bias)
  **  ((( &( "packed_weights" ) )) # Ptr  |-> (unsigned_last_nbits (((unsigned_last_nbits ((packed_weights + ((2 + (unsigned_last_nbits ((2 * kc )) (64)) ) * sizeof(UINT)))) (64)) + extra_bytes )) (64)))
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition test_rvv_safety_wit_31 := 
forall (params_pre: Z) (scale_pre: Z) (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (packed_weights: Z) (bias: Z) (w0: Z) (weights: Z) (n: Z) (tile: Z) (group: Z) (sr: Z) (kr: Z) (nr: Z) (extra_bytes: Z) (kc: Z) (nc: Z) (g: Z) (PreH1 : (n < 2)) (PreH2 : (g = (pw_groups (G)))) (PreH3 : (nc = (pw_channels (G)))) (PreH4 : (kc = (pw_depth (G)))) (PreH5 : (extra_bytes = (pw_extra_bytes (G)))) (PreH6 : (nr = 2)) (PreH7 : (kr = 1)) (PreH8 : (sr = 1)) (PreH9 : (pw_program_storage F W G )) (PreH10 : (0 <= group)) (PreH11 : (group < g)) (PreH12 : (0 <= tile)) (PreH13 : (tile <= (pw_tiles (G)))) (PreH14 : (n = (nc - (2 * tile ) ))) (PreH15 : (0 <= n)) (PreH16 : (n <= nc)) (PreH17 : (weights = (pw_group_weight (G) (group)))) (PreH18 : (w0 = (pw_tile_weight (G) (group) (tile)))) (PreH19 : (bias = (pw_bias_at (G) (group) ((2 * tile ))))) (PreH20 : (packed_weights = (pw_tile_output (G) (group) (tile)))) ,
  ((( &( "scale" ) )) # Ptr  |-> scale_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "g" ) )) # UInt64  |-> g)
  **  ((( &( "nc" ) )) # UInt64  |-> nc)
  **  ((( &( "kc" ) )) # UInt64  |-> kc)
  **  ((( &( "extra_bytes" ) )) # UInt64  |-> extra_bytes)
  **  ((( &( "nr" ) )) # UInt64  |-> nr)
  **  ((( &( "kr" ) )) # UInt64  |-> kr)
  **  ((( &( "sr" ) )) # UInt64  |-> sr)
  **  ((( &( "group" ) )) # UInt64  |-> group)
  **  ((( &( "tile" ) )) # UInt64  |-> tile)
  **  ((( &( "n" ) )) # UInt64  |-> n)
  **  ((( &( "weights" ) )) # Ptr  |-> weights)
  **  ((( &( "w0" ) )) # Ptr  |-> w0)
  **  ((( &( "bias" ) )) # Ptr  |-> bias)
  **  ((( &( "packed_weights" ) )) # Ptr  |-> packed_weights)
  **  (pw_data F )
  **  (pw_output W (pw_tile_state (F) (G) (O) (group) (tile)) )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition test_rvv_safety_wit_32 := 
forall (params_pre: Z) (scale_pre: Z) (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (packed_weights: Z) (bias: Z) (w0: Z) (weights: Z) (n: Z) (tile: Z) (group: Z) (sr: Z) (kr: Z) (nr: Z) (extra_bytes: Z) (kc: Z) (nc: Z) (g: Z) (PreH1 : (n <> 0)) (PreH2 : (n < 2)) (PreH3 : (g = (pw_groups (G)))) (PreH4 : (nc = (pw_channels (G)))) (PreH5 : (kc = (pw_depth (G)))) (PreH6 : (extra_bytes = (pw_extra_bytes (G)))) (PreH7 : (nr = 2)) (PreH8 : (kr = 1)) (PreH9 : (sr = 1)) (PreH10 : (pw_program_storage F W G )) (PreH11 : (0 <= group)) (PreH12 : (group < g)) (PreH13 : (0 <= tile)) (PreH14 : (tile <= (pw_tiles (G)))) (PreH15 : (n = (nc - (2 * tile ) ))) (PreH16 : (0 <= n)) (PreH17 : (n <= nc)) (PreH18 : (weights = (pw_group_weight (G) (group)))) (PreH19 : (w0 = (pw_tile_weight (G) (group) (tile)))) (PreH20 : (bias = (pw_bias_at (G) (group) ((2 * tile ))))) (PreH21 : (packed_weights = (pw_tile_output (G) (group) (tile)))) ,
  ((( &( "scale" ) )) # Ptr  |-> scale_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "g" ) )) # UInt64  |-> g)
  **  ((( &( "nc" ) )) # UInt64  |-> nc)
  **  ((( &( "kc" ) )) # UInt64  |-> kc)
  **  ((( &( "extra_bytes" ) )) # UInt64  |-> extra_bytes)
  **  ((( &( "nr" ) )) # UInt64  |-> nr)
  **  ((( &( "kr" ) )) # UInt64  |-> kr)
  **  ((( &( "sr" ) )) # UInt64  |-> sr)
  **  ((( &( "group" ) )) # UInt64  |-> group)
  **  ((( &( "tile" ) )) # UInt64  |-> tile)
  **  ((( &( "n" ) )) # UInt64  |-> n)
  **  ((( &( "weights" ) )) # Ptr  |-> weights)
  **  ((( &( "w0" ) )) # Ptr  |-> w0)
  **  ((( &( "bias" ) )) # Ptr  |-> bias)
  **  ((( &( "packed_weights" ) )) # Ptr  |-> packed_weights)
  **  (pw_data F )
  **  (pw_output W (pw_tile_state (F) (G) (O) (group) (tile)) )
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition test_rvv_safety_wit_33 := 
forall (params_pre: Z) (scale_pre: Z) (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (packed_weights: Z) (bias: Z) (w0: Z) (weights: Z) (n: Z) (tile: Z) (group: Z) (sr: Z) (kr: Z) (nr: Z) (extra_bytes: Z) (kc: Z) (nc: Z) (g: Z) (PreH1 : (n <> 0)) (PreH2 : (n < 2)) (PreH3 : (g = (pw_groups (G)))) (PreH4 : (nc = (pw_channels (G)))) (PreH5 : (kc = (pw_depth (G)))) (PreH6 : (extra_bytes = (pw_extra_bytes (G)))) (PreH7 : (nr = 2)) (PreH8 : (kr = 1)) (PreH9 : (sr = 1)) (PreH10 : (pw_program_storage F W G )) (PreH11 : (0 <= group)) (PreH12 : (group < g)) (PreH13 : (0 <= tile)) (PreH14 : (tile <= (pw_tiles (G)))) (PreH15 : (n = (nc - (2 * tile ) ))) (PreH16 : (0 <= n)) (PreH17 : (n <= nc)) (PreH18 : (weights = (pw_group_weight (G) (group)))) (PreH19 : (w0 = (pw_tile_weight (G) (group) (tile)))) (PreH20 : (bias = (pw_bias_at (G) (group) ((2 * tile ))))) (PreH21 : (packed_weights = (pw_tile_output (G) (group) (tile)))) ,
  (pw_data F )
  **  (pw_output W (pw_header_run (F) (bias) (packed_weights) (1) ((pw_tile_state (F) (G) (O) (group) (tile)))) )
  **  ((( &( "scale" ) )) # Ptr  |-> scale_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "g" ) )) # UInt64  |-> g)
  **  ((( &( "nc" ) )) # UInt64  |-> nc)
  **  ((( &( "kc" ) )) # UInt64  |-> kc)
  **  ((( &( "extra_bytes" ) )) # UInt64  |-> extra_bytes)
  **  ((( &( "nr" ) )) # UInt64  |-> nr)
  **  ((( &( "kr" ) )) # UInt64  |-> kr)
  **  ((( &( "sr" ) )) # UInt64  |-> sr)
  **  ((( &( "group" ) )) # UInt64  |-> group)
  **  ((( &( "tile" ) )) # UInt64  |-> tile)
  **  ((( &( "n" ) )) # UInt64  |-> n)
  **  ((( &( "weights" ) )) # Ptr  |-> weights)
  **  ((( &( "w0" ) )) # Ptr  |-> w0)
  **  ((( &( "bias" ) )) # Ptr  |-> bias)
  **  ((( &( "packed_weights" ) )) # Ptr  |-> packed_weights)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition test_rvv_safety_wit_34 := 
forall (params_pre: Z) (scale_pre: Z) (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (packed_weights: Z) (bias: Z) (w0: Z) (weights: Z) (n: Z) (tile: Z) (group: Z) (sr: Z) (kr: Z) (nr: Z) (extra_bytes: Z) (kc: Z) (nc: Z) (g: Z) (PreH1 : (bias <> 0)) (PreH2 : (n <> 0)) (PreH3 : (n < 2)) (PreH4 : (g = (pw_groups (G)))) (PreH5 : (nc = (pw_channels (G)))) (PreH6 : (kc = (pw_depth (G)))) (PreH7 : (extra_bytes = (pw_extra_bytes (G)))) (PreH8 : (nr = 2)) (PreH9 : (kr = 1)) (PreH10 : (sr = 1)) (PreH11 : (pw_program_storage F W G )) (PreH12 : (0 <= group)) (PreH13 : (group < g)) (PreH14 : (0 <= tile)) (PreH15 : (tile <= (pw_tiles (G)))) (PreH16 : (n = (nc - (2 * tile ) ))) (PreH17 : (0 <= n)) (PreH18 : (n <= nc)) (PreH19 : (weights = (pw_group_weight (G) (group)))) (PreH20 : (w0 = (pw_tile_weight (G) (group) (tile)))) (PreH21 : (bias = (pw_bias_at (G) (group) ((2 * tile ))))) (PreH22 : (packed_weights = (pw_tile_output (G) (group) (tile)))) ,
  (pw_data F )
  **  (pw_output W (pw_header_run (F) (bias) (packed_weights) (1) ((pw_tile_state (F) (G) (O) (group) (tile)))) )
  **  ((( &( "scale" ) )) # Ptr  |-> scale_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "g" ) )) # UInt64  |-> g)
  **  ((( &( "nc" ) )) # UInt64  |-> nc)
  **  ((( &( "kc" ) )) # UInt64  |-> kc)
  **  ((( &( "extra_bytes" ) )) # UInt64  |-> extra_bytes)
  **  ((( &( "nr" ) )) # UInt64  |-> nr)
  **  ((( &( "kr" ) )) # UInt64  |-> kr)
  **  ((( &( "sr" ) )) # UInt64  |-> sr)
  **  ((( &( "group" ) )) # UInt64  |-> group)
  **  ((( &( "tile" ) )) # UInt64  |-> tile)
  **  ((( &( "n" ) )) # UInt64  |-> n)
  **  ((( &( "weights" ) )) # Ptr  |-> weights)
  **  ((( &( "w0" ) )) # Ptr  |-> w0)
  **  ((( &( "bias" ) )) # Ptr  |-> bias)
  **  ((( &( "packed_weights" ) )) # Ptr  |-> packed_weights)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition test_rvv_safety_wit_35 := 
forall (params_pre: Z) (scale_pre: Z) (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (packed_weights: Z) (bias: Z) (w0: Z) (weights: Z) (n: Z) (tile: Z) (group: Z) (sr: Z) (kr: Z) (nr: Z) (extra_bytes: Z) (kc: Z) (nc: Z) (g: Z) (PreH1 : (bias <> 0)) (PreH2 : (n <> 0)) (PreH3 : (n < 2)) (PreH4 : (g = (pw_groups (G)))) (PreH5 : (nc = (pw_channels (G)))) (PreH6 : (kc = (pw_depth (G)))) (PreH7 : (extra_bytes = (pw_extra_bytes (G)))) (PreH8 : (nr = 2)) (PreH9 : (kr = 1)) (PreH10 : (sr = 1)) (PreH11 : (pw_program_storage F W G )) (PreH12 : (0 <= group)) (PreH13 : (group < g)) (PreH14 : (0 <= tile)) (PreH15 : (tile <= (pw_tiles (G)))) (PreH16 : (n = (nc - (2 * tile ) ))) (PreH17 : (0 <= n)) (PreH18 : (n <= nc)) (PreH19 : (weights = (pw_group_weight (G) (group)))) (PreH20 : (w0 = (pw_tile_weight (G) (group) (tile)))) (PreH21 : (bias = (pw_bias_at (G) (group) ((2 * tile ))))) (PreH22 : (packed_weights = (pw_tile_output (G) (group) (tile)))) ,
  (pw_data F )
  **  (pw_output W (pw_header_run (F) (bias) (packed_weights) (1) ((pw_tile_state (F) (G) (O) (group) (tile)))) )
  **  ((( &( "scale" ) )) # Ptr  |-> scale_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "g" ) )) # UInt64  |-> g)
  **  ((( &( "nc" ) )) # UInt64  |-> nc)
  **  ((( &( "kc" ) )) # UInt64  |-> kc)
  **  ((( &( "extra_bytes" ) )) # UInt64  |-> extra_bytes)
  **  ((( &( "nr" ) )) # UInt64  |-> nr)
  **  ((( &( "kr" ) )) # UInt64  |-> kr)
  **  ((( &( "sr" ) )) # UInt64  |-> sr)
  **  ((( &( "group" ) )) # UInt64  |-> group)
  **  ((( &( "tile" ) )) # UInt64  |-> tile)
  **  ((( &( "n" ) )) # UInt64  |-> n)
  **  ((( &( "weights" ) )) # Ptr  |-> weights)
  **  ((( &( "w0" ) )) # Ptr  |-> w0)
  **  ((( &( "bias" ) )) # Ptr  |-> (bias + (1 * sizeof(UINT))))
  **  ((( &( "packed_weights" ) )) # Ptr  |-> packed_weights)
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition test_rvv_safety_wit_36 := 
forall (params_pre: Z) (scale_pre: Z) (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (packed_weights: Z) (bias: Z) (w0: Z) (weights: Z) (n: Z) (tile: Z) (group: Z) (sr: Z) (kr: Z) (nr: Z) (extra_bytes: Z) (kc: Z) (nc: Z) (g: Z) (PreH1 : (bias = 0)) (PreH2 : (n <> 0)) (PreH3 : (n < 2)) (PreH4 : (g = (pw_groups (G)))) (PreH5 : (nc = (pw_channels (G)))) (PreH6 : (kc = (pw_depth (G)))) (PreH7 : (extra_bytes = (pw_extra_bytes (G)))) (PreH8 : (nr = 2)) (PreH9 : (kr = 1)) (PreH10 : (sr = 1)) (PreH11 : (pw_program_storage F W G )) (PreH12 : (0 <= group)) (PreH13 : (group < g)) (PreH14 : (0 <= tile)) (PreH15 : (tile <= (pw_tiles (G)))) (PreH16 : (n = (nc - (2 * tile ) ))) (PreH17 : (0 <= n)) (PreH18 : (n <= nc)) (PreH19 : (weights = (pw_group_weight (G) (group)))) (PreH20 : (w0 = (pw_tile_weight (G) (group) (tile)))) (PreH21 : (bias = (pw_bias_at (G) (group) ((2 * tile ))))) (PreH22 : (packed_weights = (pw_tile_output (G) (group) (tile)))) ,
  (pw_data F )
  **  (pw_output W (pw_header_run (F) (bias) (packed_weights) (1) ((pw_tile_state (F) (G) (O) (group) (tile)))) )
  **  ((( &( "scale" ) )) # Ptr  |-> scale_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "g" ) )) # UInt64  |-> g)
  **  ((( &( "nc" ) )) # UInt64  |-> nc)
  **  ((( &( "kc" ) )) # UInt64  |-> kc)
  **  ((( &( "extra_bytes" ) )) # UInt64  |-> extra_bytes)
  **  ((( &( "nr" ) )) # UInt64  |-> nr)
  **  ((( &( "kr" ) )) # UInt64  |-> kr)
  **  ((( &( "sr" ) )) # UInt64  |-> sr)
  **  ((( &( "group" ) )) # UInt64  |-> group)
  **  ((( &( "tile" ) )) # UInt64  |-> tile)
  **  ((( &( "n" ) )) # UInt64  |-> n)
  **  ((( &( "weights" ) )) # Ptr  |-> weights)
  **  ((( &( "w0" ) )) # Ptr  |-> w0)
  **  ((( &( "bias" ) )) # Ptr  |-> bias)
  **  ((( &( "packed_weights" ) )) # Ptr  |-> packed_weights)
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition test_rvv_safety_wit_37 := 
forall (params_pre: Z) (scale_pre: Z) (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (packed_weights: Z) (bias: Z) (w0: Z) (weights: Z) (n: Z) (tile: Z) (group: Z) (sr: Z) (kr: Z) (nr: Z) (extra_bytes: Z) (kc: Z) (nc: Z) (g: Z) (PreH1 : (bias <> 0)) (PreH2 : (n <> 0)) (PreH3 : (n < 2)) (PreH4 : (g = (pw_groups (G)))) (PreH5 : (nc = (pw_channels (G)))) (PreH6 : (kc = (pw_depth (G)))) (PreH7 : (extra_bytes = (pw_extra_bytes (G)))) (PreH8 : (nr = 2)) (PreH9 : (kr = 1)) (PreH10 : (sr = 1)) (PreH11 : (pw_program_storage F W G )) (PreH12 : (0 <= group)) (PreH13 : (group < g)) (PreH14 : (0 <= tile)) (PreH15 : (tile <= (pw_tiles (G)))) (PreH16 : (n = (nc - (2 * tile ) ))) (PreH17 : (0 <= n)) (PreH18 : (n <= nc)) (PreH19 : (weights = (pw_group_weight (G) (group)))) (PreH20 : (w0 = (pw_tile_weight (G) (group) (tile)))) (PreH21 : (bias = (pw_bias_at (G) (group) ((2 * tile ))))) (PreH22 : (packed_weights = (pw_tile_output (G) (group) (tile)))) ,
  (pw_data F )
  **  (pw_output W (pw_odd_run (kc) (F) (w0) ((packed_weights + (2 * sizeof(UINT)))) ((pw_header_run (F) ((pw_bias_at (G) (group) ((2 * tile )))) ((pw_tile_output (G) (group) (tile))) (1) ((pw_tile_state (F) (G) (O) (group) (tile)))))) )
  **  ((( &( "scale" ) )) # Ptr  |-> scale_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "g" ) )) # UInt64  |-> g)
  **  ((( &( "nc" ) )) # UInt64  |-> nc)
  **  ((( &( "kc" ) )) # UInt64  |-> kc)
  **  ((( &( "extra_bytes" ) )) # UInt64  |-> extra_bytes)
  **  ((( &( "nr" ) )) # UInt64  |-> nr)
  **  ((( &( "kr" ) )) # UInt64  |-> kr)
  **  ((( &( "sr" ) )) # UInt64  |-> sr)
  **  ((( &( "group" ) )) # UInt64  |-> group)
  **  ((( &( "tile" ) )) # UInt64  |-> tile)
  **  ((( &( "n" ) )) # UInt64  |-> n)
  **  ((( &( "weights" ) )) # Ptr  |-> weights)
  **  ((( &( "w0" ) )) # Ptr  |-> w0)
  **  ((( &( "bias" ) )) # Ptr  |-> (bias + (1 * sizeof(UINT))))
  **  ((( &( "packed_weights" ) )) # Ptr  |-> (packed_weights + (2 * sizeof(UINT))))
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition test_rvv_safety_wit_38 := 
forall (params_pre: Z) (scale_pre: Z) (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (packed_weights: Z) (bias: Z) (w0: Z) (weights: Z) (n: Z) (tile: Z) (group: Z) (sr: Z) (kr: Z) (nr: Z) (extra_bytes: Z) (kc: Z) (nc: Z) (g: Z) (PreH1 : (bias = 0)) (PreH2 : (n <> 0)) (PreH3 : (n < 2)) (PreH4 : (g = (pw_groups (G)))) (PreH5 : (nc = (pw_channels (G)))) (PreH6 : (kc = (pw_depth (G)))) (PreH7 : (extra_bytes = (pw_extra_bytes (G)))) (PreH8 : (nr = 2)) (PreH9 : (kr = 1)) (PreH10 : (sr = 1)) (PreH11 : (pw_program_storage F W G )) (PreH12 : (0 <= group)) (PreH13 : (group < g)) (PreH14 : (0 <= tile)) (PreH15 : (tile <= (pw_tiles (G)))) (PreH16 : (n = (nc - (2 * tile ) ))) (PreH17 : (0 <= n)) (PreH18 : (n <= nc)) (PreH19 : (weights = (pw_group_weight (G) (group)))) (PreH20 : (w0 = (pw_tile_weight (G) (group) (tile)))) (PreH21 : (bias = (pw_bias_at (G) (group) ((2 * tile ))))) (PreH22 : (packed_weights = (pw_tile_output (G) (group) (tile)))) ,
  (pw_data F )
  **  (pw_output W (pw_odd_run (kc) (F) (w0) ((packed_weights + (2 * sizeof(UINT)))) ((pw_header_run (F) (0) ((pw_tile_output (G) (group) (tile))) (1) ((pw_tile_state (F) (G) (O) (group) (tile)))))) )
  **  ((( &( "scale" ) )) # Ptr  |-> scale_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "g" ) )) # UInt64  |-> g)
  **  ((( &( "nc" ) )) # UInt64  |-> nc)
  **  ((( &( "kc" ) )) # UInt64  |-> kc)
  **  ((( &( "extra_bytes" ) )) # UInt64  |-> extra_bytes)
  **  ((( &( "nr" ) )) # UInt64  |-> nr)
  **  ((( &( "kr" ) )) # UInt64  |-> kr)
  **  ((( &( "sr" ) )) # UInt64  |-> sr)
  **  ((( &( "group" ) )) # UInt64  |-> group)
  **  ((( &( "tile" ) )) # UInt64  |-> tile)
  **  ((( &( "n" ) )) # UInt64  |-> n)
  **  ((( &( "weights" ) )) # Ptr  |-> weights)
  **  ((( &( "w0" ) )) # Ptr  |-> w0)
  **  ((( &( "bias" ) )) # Ptr  |-> bias)
  **  ((( &( "packed_weights" ) )) # Ptr  |-> (packed_weights + (2 * sizeof(UINT))))
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition test_rvv_safety_wit_39 := 
forall (params_pre: Z) (scale_pre: Z) (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (packed_weights: Z) (bias: Z) (w0: Z) (weights: Z) (n: Z) (tile: Z) (group: Z) (sr: Z) (kr: Z) (nr: Z) (extra_bytes: Z) (kc: Z) (nc: Z) (g: Z) (PreH1 : (bias <> 0)) (PreH2 : (n <> 0)) (PreH3 : (n < 2)) (PreH4 : (g = (pw_groups (G)))) (PreH5 : (nc = (pw_channels (G)))) (PreH6 : (kc = (pw_depth (G)))) (PreH7 : (extra_bytes = (pw_extra_bytes (G)))) (PreH8 : (nr = 2)) (PreH9 : (kr = 1)) (PreH10 : (sr = 1)) (PreH11 : (pw_program_storage F W G )) (PreH12 : (0 <= group)) (PreH13 : (group < g)) (PreH14 : (0 <= tile)) (PreH15 : (tile <= (pw_tiles (G)))) (PreH16 : (n = (nc - (2 * tile ) ))) (PreH17 : (0 <= n)) (PreH18 : (n <= nc)) (PreH19 : (weights = (pw_group_weight (G) (group)))) (PreH20 : (w0 = (pw_tile_weight (G) (group) (tile)))) (PreH21 : (bias = (pw_bias_at (G) (group) ((2 * tile ))))) (PreH22 : (packed_weights = (pw_tile_output (G) (group) (tile)))) ,
  (pw_data F )
  **  (pw_output W (pw_odd_run (kc) (F) (w0) ((packed_weights + (2 * sizeof(UINT)))) ((pw_header_run (F) ((pw_bias_at (G) (group) ((2 * tile )))) ((pw_tile_output (G) (group) (tile))) (1) ((pw_tile_state (F) (G) (O) (group) (tile)))))) )
  **  ((( &( "scale" ) )) # Ptr  |-> scale_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "g" ) )) # UInt64  |-> g)
  **  ((( &( "nc" ) )) # UInt64  |-> nc)
  **  ((( &( "kc" ) )) # UInt64  |-> kc)
  **  ((( &( "extra_bytes" ) )) # UInt64  |-> extra_bytes)
  **  ((( &( "nr" ) )) # UInt64  |-> nr)
  **  ((( &( "kr" ) )) # UInt64  |-> kr)
  **  ((( &( "sr" ) )) # UInt64  |-> sr)
  **  ((( &( "group" ) )) # UInt64  |-> group)
  **  ((( &( "tile" ) )) # UInt64  |-> tile)
  **  ((( &( "n" ) )) # UInt64  |-> n)
  **  ((( &( "weights" ) )) # Ptr  |-> weights)
  **  ((( &( "w0" ) )) # Ptr  |-> w0)
  **  ((( &( "bias" ) )) # Ptr  |-> (bias + (1 * sizeof(UINT))))
  **  ((( &( "packed_weights" ) )) # Ptr  |-> (unsigned_last_nbits (((unsigned_last_nbits ((packed_weights + ((2 + (unsigned_last_nbits ((2 * kc )) (64)) ) * sizeof(UINT)))) (64)) + extra_bytes )) (64)))
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition test_rvv_safety_wit_40 := 
forall (params_pre: Z) (scale_pre: Z) (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (packed_weights: Z) (bias: Z) (w0: Z) (weights: Z) (n: Z) (tile: Z) (group: Z) (sr: Z) (kr: Z) (nr: Z) (extra_bytes: Z) (kc: Z) (nc: Z) (g: Z) (PreH1 : (bias = 0)) (PreH2 : (n <> 0)) (PreH3 : (n < 2)) (PreH4 : (g = (pw_groups (G)))) (PreH5 : (nc = (pw_channels (G)))) (PreH6 : (kc = (pw_depth (G)))) (PreH7 : (extra_bytes = (pw_extra_bytes (G)))) (PreH8 : (nr = 2)) (PreH9 : (kr = 1)) (PreH10 : (sr = 1)) (PreH11 : (pw_program_storage F W G )) (PreH12 : (0 <= group)) (PreH13 : (group < g)) (PreH14 : (0 <= tile)) (PreH15 : (tile <= (pw_tiles (G)))) (PreH16 : (n = (nc - (2 * tile ) ))) (PreH17 : (0 <= n)) (PreH18 : (n <= nc)) (PreH19 : (weights = (pw_group_weight (G) (group)))) (PreH20 : (w0 = (pw_tile_weight (G) (group) (tile)))) (PreH21 : (bias = (pw_bias_at (G) (group) ((2 * tile ))))) (PreH22 : (packed_weights = (pw_tile_output (G) (group) (tile)))) ,
  (pw_data F )
  **  (pw_output W (pw_odd_run (kc) (F) (w0) ((packed_weights + (2 * sizeof(UINT)))) ((pw_header_run (F) (0) ((pw_tile_output (G) (group) (tile))) (1) ((pw_tile_state (F) (G) (O) (group) (tile)))))) )
  **  ((( &( "scale" ) )) # Ptr  |-> scale_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "g" ) )) # UInt64  |-> g)
  **  ((( &( "nc" ) )) # UInt64  |-> nc)
  **  ((( &( "kc" ) )) # UInt64  |-> kc)
  **  ((( &( "extra_bytes" ) )) # UInt64  |-> extra_bytes)
  **  ((( &( "nr" ) )) # UInt64  |-> nr)
  **  ((( &( "kr" ) )) # UInt64  |-> kr)
  **  ((( &( "sr" ) )) # UInt64  |-> sr)
  **  ((( &( "group" ) )) # UInt64  |-> group)
  **  ((( &( "tile" ) )) # UInt64  |-> tile)
  **  ((( &( "n" ) )) # UInt64  |-> n)
  **  ((( &( "weights" ) )) # Ptr  |-> weights)
  **  ((( &( "w0" ) )) # Ptr  |-> w0)
  **  ((( &( "bias" ) )) # Ptr  |-> bias)
  **  ((( &( "packed_weights" ) )) # Ptr  |-> (unsigned_last_nbits (((unsigned_last_nbits ((packed_weights + ((2 + (unsigned_last_nbits ((2 * kc )) (64)) ) * sizeof(UINT)))) (64)) + extra_bytes )) (64)))
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition test_rvv_safety_wit_41 := 
forall (params_pre: Z) (scale_pre: Z) (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (packed_weights: Z) (bias: Z) (w0: Z) (weights: Z) (n: Z) (tile: Z) (group: Z) (sr: Z) (kr: Z) (nr: Z) (extra_bytes: Z) (kc: Z) (nc: Z) (g: Z) (PreH1 : (bias <> 0)) (PreH2 : (n <> 0)) (PreH3 : (n < 2)) (PreH4 : (g = (pw_groups (G)))) (PreH5 : (nc = (pw_channels (G)))) (PreH6 : (kc = (pw_depth (G)))) (PreH7 : (extra_bytes = (pw_extra_bytes (G)))) (PreH8 : (nr = 2)) (PreH9 : (kr = 1)) (PreH10 : (sr = 1)) (PreH11 : (pw_program_storage F W G )) (PreH12 : (0 <= group)) (PreH13 : (group < g)) (PreH14 : (0 <= tile)) (PreH15 : (tile <= (pw_tiles (G)))) (PreH16 : (n = (nc - (2 * tile ) ))) (PreH17 : (0 <= n)) (PreH18 : (n <= nc)) (PreH19 : (weights = (pw_group_weight (G) (group)))) (PreH20 : (w0 = (pw_tile_weight (G) (group) (tile)))) (PreH21 : (bias = (pw_bias_at (G) (group) ((2 * tile ))))) (PreH22 : (packed_weights = (pw_tile_output (G) (group) (tile)))) ,
  (pw_data F )
  **  (pw_output W (pw_odd_run (kc) (F) (w0) ((packed_weights + (2 * sizeof(UINT)))) ((pw_header_run (F) ((pw_bias_at (G) (group) ((2 * tile )))) ((pw_tile_output (G) (group) (tile))) (1) ((pw_tile_state (F) (G) (O) (group) (tile)))))) )
  **  ((( &( "scale" ) )) # Ptr  |-> scale_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "g" ) )) # UInt64  |-> g)
  **  ((( &( "nc" ) )) # UInt64  |-> nc)
  **  ((( &( "kc" ) )) # UInt64  |-> kc)
  **  ((( &( "extra_bytes" ) )) # UInt64  |-> extra_bytes)
  **  ((( &( "nr" ) )) # UInt64  |-> nr)
  **  ((( &( "kr" ) )) # UInt64  |-> kr)
  **  ((( &( "sr" ) )) # UInt64  |-> sr)
  **  ((( &( "group" ) )) # UInt64  |-> group)
  **  ((( &( "tile" ) )) # UInt64  |-> (tile + 1 ))
  **  ((( &( "n" ) )) # UInt64  |-> n)
  **  ((( &( "weights" ) )) # Ptr  |-> (weights + ((unsigned_last_nbits ((nc * kc )) (64)) * sizeof(UINT))))
  **  ((( &( "w0" ) )) # Ptr  |-> w0)
  **  ((( &( "bias" ) )) # Ptr  |-> (bias + (1 * sizeof(UINT))))
  **  ((( &( "packed_weights" ) )) # Ptr  |-> (unsigned_last_nbits (((unsigned_last_nbits ((packed_weights + ((2 + (unsigned_last_nbits ((2 * kc )) (64)) ) * sizeof(UINT)))) (64)) + extra_bytes )) (64)))
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition test_rvv_safety_wit_42 := 
forall (params_pre: Z) (scale_pre: Z) (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (packed_weights: Z) (bias: Z) (w0: Z) (weights: Z) (n: Z) (tile: Z) (group: Z) (sr: Z) (kr: Z) (nr: Z) (extra_bytes: Z) (kc: Z) (nc: Z) (g: Z) (PreH1 : (bias = 0)) (PreH2 : (n <> 0)) (PreH3 : (n < 2)) (PreH4 : (g = (pw_groups (G)))) (PreH5 : (nc = (pw_channels (G)))) (PreH6 : (kc = (pw_depth (G)))) (PreH7 : (extra_bytes = (pw_extra_bytes (G)))) (PreH8 : (nr = 2)) (PreH9 : (kr = 1)) (PreH10 : (sr = 1)) (PreH11 : (pw_program_storage F W G )) (PreH12 : (0 <= group)) (PreH13 : (group < g)) (PreH14 : (0 <= tile)) (PreH15 : (tile <= (pw_tiles (G)))) (PreH16 : (n = (nc - (2 * tile ) ))) (PreH17 : (0 <= n)) (PreH18 : (n <= nc)) (PreH19 : (weights = (pw_group_weight (G) (group)))) (PreH20 : (w0 = (pw_tile_weight (G) (group) (tile)))) (PreH21 : (bias = (pw_bias_at (G) (group) ((2 * tile ))))) (PreH22 : (packed_weights = (pw_tile_output (G) (group) (tile)))) ,
  (pw_data F )
  **  (pw_output W (pw_odd_run (kc) (F) (w0) ((packed_weights + (2 * sizeof(UINT)))) ((pw_header_run (F) (0) ((pw_tile_output (G) (group) (tile))) (1) ((pw_tile_state (F) (G) (O) (group) (tile)))))) )
  **  ((( &( "scale" ) )) # Ptr  |-> scale_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "g" ) )) # UInt64  |-> g)
  **  ((( &( "nc" ) )) # UInt64  |-> nc)
  **  ((( &( "kc" ) )) # UInt64  |-> kc)
  **  ((( &( "extra_bytes" ) )) # UInt64  |-> extra_bytes)
  **  ((( &( "nr" ) )) # UInt64  |-> nr)
  **  ((( &( "kr" ) )) # UInt64  |-> kr)
  **  ((( &( "sr" ) )) # UInt64  |-> sr)
  **  ((( &( "group" ) )) # UInt64  |-> group)
  **  ((( &( "tile" ) )) # UInt64  |-> (tile + 1 ))
  **  ((( &( "n" ) )) # UInt64  |-> n)
  **  ((( &( "weights" ) )) # Ptr  |-> (weights + ((unsigned_last_nbits ((nc * kc )) (64)) * sizeof(UINT))))
  **  ((( &( "w0" ) )) # Ptr  |-> w0)
  **  ((( &( "bias" ) )) # Ptr  |-> bias)
  **  ((( &( "packed_weights" ) )) # Ptr  |-> (unsigned_last_nbits (((unsigned_last_nbits ((packed_weights + ((2 + (unsigned_last_nbits ((2 * kc )) (64)) ) * sizeof(UINT)))) (64)) + extra_bytes )) (64)))
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition test_rvv_safety_wit_43 := 
forall (params_pre: Z) (scale_pre: Z) (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (packed_weights: Z) (bias: Z) (w0: Z) (weights: Z) (n: Z) (tile: Z) (group: Z) (sr: Z) (kr: Z) (nr: Z) (extra_bytes: Z) (kc: Z) (nc: Z) (g: Z) (PreH1 : (n = 0)) (PreH2 : (n < 2)) (PreH3 : (g = (pw_groups (G)))) (PreH4 : (nc = (pw_channels (G)))) (PreH5 : (kc = (pw_depth (G)))) (PreH6 : (extra_bytes = (pw_extra_bytes (G)))) (PreH7 : (nr = 2)) (PreH8 : (kr = 1)) (PreH9 : (sr = 1)) (PreH10 : (pw_program_storage F W G )) (PreH11 : (0 <= group)) (PreH12 : (group < g)) (PreH13 : (0 <= tile)) (PreH14 : (tile <= (pw_tiles (G)))) (PreH15 : (n = (nc - (2 * tile ) ))) (PreH16 : (0 <= n)) (PreH17 : (n <= nc)) (PreH18 : (weights = (pw_group_weight (G) (group)))) (PreH19 : (w0 = (pw_tile_weight (G) (group) (tile)))) (PreH20 : (bias = (pw_bias_at (G) (group) ((2 * tile ))))) (PreH21 : (packed_weights = (pw_tile_output (G) (group) (tile)))) ,
  ((( &( "scale" ) )) # Ptr  |-> scale_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "g" ) )) # UInt64  |-> g)
  **  ((( &( "nc" ) )) # UInt64  |-> nc)
  **  ((( &( "kc" ) )) # UInt64  |-> kc)
  **  ((( &( "extra_bytes" ) )) # UInt64  |-> extra_bytes)
  **  ((( &( "nr" ) )) # UInt64  |-> nr)
  **  ((( &( "kr" ) )) # UInt64  |-> kr)
  **  ((( &( "sr" ) )) # UInt64  |-> sr)
  **  ((( &( "group" ) )) # UInt64  |-> group)
  **  ((( &( "tile" ) )) # UInt64  |-> tile)
  **  ((( &( "n" ) )) # UInt64  |-> n)
  **  ((( &( "weights" ) )) # Ptr  |-> (weights + ((unsigned_last_nbits ((nc * kc )) (64)) * sizeof(UINT))))
  **  ((( &( "w0" ) )) # Ptr  |-> w0)
  **  ((( &( "bias" ) )) # Ptr  |-> bias)
  **  ((( &( "packed_weights" ) )) # Ptr  |-> packed_weights)
  **  (pw_data F )
  **  (pw_output W (pw_tile_state (F) (G) (O) (group) (tile)) )
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition test_rvv_entail_wit_1 := 
(
forall (extra_bytes_pre: Z) (packed_weights_pre: Z) (bias_pre: Z) (weights_pre: Z) (sr_pre: Z) (kr_pre: Z) (nr_pre: Z) (kc_pre: Z) (nc_pre: Z) (g_pre: Z) (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (PreH1 : (packed_weights_pre <> 0)) (PreH2 : (weights_pre <> 0)) (PreH3 : (sr_pre = 1)) (PreH4 : (kr_pre = 1)) (PreH5 : (nr_pre = 2)) (PreH6 : (kc_pre <> 0)) (PreH7 : (nc_pre <> 0)) (PreH8 : (g_pre <> 0)) (PreH9 : (g_pre > 0)) (PreH10 : (nc_pre > 0)) (PreH11 : (kc_pre > 0)) (PreH12 : (weights_pre > 0)) (PreH13 : (packed_weights_pre > 0)) (PreH14 : (g_pre = (pw_groups (G)))) (PreH15 : (nc_pre = (pw_channels (G)))) (PreH16 : (kc_pre = (pw_depth (G)))) (PreH17 : (extra_bytes_pre = (pw_extra_bytes (G)))) (PreH18 : (nr_pre = 2)) (PreH19 : (kr_pre = 1)) (PreH20 : (sr_pre = 1)) (PreH21 : (pw_program_storage F W G )) (PreH22 : (weights_pre = (pw_weights (G)))) (PreH23 : (bias_pre = (pw_bias (G)))) (PreH24 : (packed_weights_pre = (pw_output_base (G)))) ,
  (pw_data F )
  **  (pw_output W O )
|--
  “ (g_pre = (pw_groups (G))) ” 
  &&  “ (nc_pre = (pw_channels (G))) ” 
  &&  “ (kc_pre = (pw_depth (G))) ” 
  &&  “ (extra_bytes_pre = (pw_extra_bytes (G))) ” 
  &&  “ (nr_pre = 2) ” 
  &&  “ (kr_pre = 1) ” 
  &&  “ (sr_pre = 1) ” 
  &&  “ (pw_program_storage F W G ) ” 
  &&  “ (0 <= 0) ” 
  &&  “ (0 <= g_pre) ” 
  &&  “ (weights_pre = (pw_group_weight (G) (0))) ” 
  &&  “ (bias_pre = (pw_bias_at (G) (0) (0))) ” 
  &&  “ (packed_weights_pre = (pw_tile_output (G) (0) (0))) ”
  &&  (pw_data F )
  **  (pw_output W (pw_group_state (F) (G) (O) (0)) )
) \/
(
forall (extra_bytes_pre: Z) (packed_weights_pre: Z) (bias_pre: Z) (weights_pre: Z) (sr_pre: Z) (kr_pre: Z) (nr_pre: Z) (kc_pre: Z) (nc_pre: Z) (g_pre: Z) (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (PreH1 : (packed_weights_pre <> 0)) (PreH2 : (weights_pre <> 0)) (PreH3 : (sr_pre = 1)) (PreH4 : (kr_pre = 1)) (PreH5 : (nr_pre = 2)) (PreH6 : (kc_pre <> 0)) (PreH7 : (nc_pre <> 0)) (PreH8 : (g_pre <> 0)) (PreH9 : (g_pre > 0)) (PreH10 : (nc_pre > 0)) (PreH11 : (kc_pre > 0)) (PreH12 : (weights_pre > 0)) (PreH13 : (packed_weights_pre > 0)) (PreH14 : (g_pre = (pw_groups (G)))) (PreH15 : (nc_pre = (pw_channels (G)))) (PreH16 : (kc_pre = (pw_depth (G)))) (PreH17 : (extra_bytes_pre = (pw_extra_bytes (G)))) (PreH18 : (nr_pre = 2)) (PreH19 : (kr_pre = 1)) (PreH20 : (sr_pre = 1)) (PreH21 : (pw_program_storage F W G )) (PreH22 : (weights_pre = (pw_weights (G)))) (PreH23 : (bias_pre = (pw_bias (G)))) (PreH24 : (packed_weights_pre = (pw_output_base (G)))) ,
  (pw_data F )
  **  (pw_output W O )
|--
  “ (packed_weights_pre = (pw_tile_output (G) (0) (0))) ” 
  &&  “ (bias_pre = (pw_bias_at (G) (0) (0))) ” 
  &&  “ (weights_pre = (pw_group_weight (G) (0))) ”
  &&  (pw_data F )
  **  (pw_output W (pw_group_state (F) (G) (O) (0)) )
).

Definition test_rvv_entail_wit_1_split_goal_1 := 
forall (extra_bytes_pre: Z) (packed_weights_pre: Z) (bias_pre: Z) (weights_pre: Z) (sr_pre: Z) (kr_pre: Z) (nr_pre: Z) (kc_pre: Z) (nc_pre: Z) (g_pre: Z) (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (PreH1 : (packed_weights_pre <> 0)) (PreH2 : (weights_pre <> 0)) (PreH3 : (sr_pre = 1)) (PreH4 : (kr_pre = 1)) (PreH5 : (nr_pre = 2)) (PreH6 : (kc_pre <> 0)) (PreH7 : (nc_pre <> 0)) (PreH8 : (g_pre <> 0)) (PreH9 : (g_pre > 0)) (PreH10 : (nc_pre > 0)) (PreH11 : (kc_pre > 0)) (PreH12 : (weights_pre > 0)) (PreH13 : (packed_weights_pre > 0)) (PreH14 : (g_pre = (pw_groups (G)))) (PreH15 : (nc_pre = (pw_channels (G)))) (PreH16 : (kc_pre = (pw_depth (G)))) (PreH17 : (extra_bytes_pre = (pw_extra_bytes (G)))) (PreH18 : (nr_pre = 2)) (PreH19 : (kr_pre = 1)) (PreH20 : (sr_pre = 1)) (PreH21 : (pw_program_storage F W G )) (PreH22 : (weights_pre = (pw_weights (G)))) (PreH23 : (bias_pre = (pw_bias (G)))) (PreH24 : (packed_weights_pre = (pw_output_base (G)))) ,
  (pw_data F )
  **  (pw_output W O )
|--
  “ (packed_weights_pre = (pw_tile_output (G) (0) (0))) ”
.

Definition test_rvv_entail_wit_1_split_goal_2 := 
forall (extra_bytes_pre: Z) (packed_weights_pre: Z) (bias_pre: Z) (weights_pre: Z) (sr_pre: Z) (kr_pre: Z) (nr_pre: Z) (kc_pre: Z) (nc_pre: Z) (g_pre: Z) (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (PreH1 : (packed_weights_pre <> 0)) (PreH2 : (weights_pre <> 0)) (PreH3 : (sr_pre = 1)) (PreH4 : (kr_pre = 1)) (PreH5 : (nr_pre = 2)) (PreH6 : (kc_pre <> 0)) (PreH7 : (nc_pre <> 0)) (PreH8 : (g_pre <> 0)) (PreH9 : (g_pre > 0)) (PreH10 : (nc_pre > 0)) (PreH11 : (kc_pre > 0)) (PreH12 : (weights_pre > 0)) (PreH13 : (packed_weights_pre > 0)) (PreH14 : (g_pre = (pw_groups (G)))) (PreH15 : (nc_pre = (pw_channels (G)))) (PreH16 : (kc_pre = (pw_depth (G)))) (PreH17 : (extra_bytes_pre = (pw_extra_bytes (G)))) (PreH18 : (nr_pre = 2)) (PreH19 : (kr_pre = 1)) (PreH20 : (sr_pre = 1)) (PreH21 : (pw_program_storage F W G )) (PreH22 : (weights_pre = (pw_weights (G)))) (PreH23 : (bias_pre = (pw_bias (G)))) (PreH24 : (packed_weights_pre = (pw_output_base (G)))) ,
  (pw_data F )
  **  (pw_output W O )
|--
  “ (bias_pre = (pw_bias_at (G) (0) (0))) ”
.

Definition test_rvv_entail_wit_1_split_goal_3 := 
forall (extra_bytes_pre: Z) (packed_weights_pre: Z) (bias_pre: Z) (weights_pre: Z) (sr_pre: Z) (kr_pre: Z) (nr_pre: Z) (kc_pre: Z) (nc_pre: Z) (g_pre: Z) (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (PreH1 : (packed_weights_pre <> 0)) (PreH2 : (weights_pre <> 0)) (PreH3 : (sr_pre = 1)) (PreH4 : (kr_pre = 1)) (PreH5 : (nr_pre = 2)) (PreH6 : (kc_pre <> 0)) (PreH7 : (nc_pre <> 0)) (PreH8 : (g_pre <> 0)) (PreH9 : (g_pre > 0)) (PreH10 : (nc_pre > 0)) (PreH11 : (kc_pre > 0)) (PreH12 : (weights_pre > 0)) (PreH13 : (packed_weights_pre > 0)) (PreH14 : (g_pre = (pw_groups (G)))) (PreH15 : (nc_pre = (pw_channels (G)))) (PreH16 : (kc_pre = (pw_depth (G)))) (PreH17 : (extra_bytes_pre = (pw_extra_bytes (G)))) (PreH18 : (nr_pre = 2)) (PreH19 : (kr_pre = 1)) (PreH20 : (sr_pre = 1)) (PreH21 : (pw_program_storage F W G )) (PreH22 : (weights_pre = (pw_weights (G)))) (PreH23 : (bias_pre = (pw_bias (G)))) (PreH24 : (packed_weights_pre = (pw_output_base (G)))) ,
  (pw_data F )
  **  (pw_output W O )
|--
  “ (weights_pre = (pw_group_weight (G) (0))) ”
.

Definition test_rvv_entail_wit_1_split_goal_spatial := 
forall (extra_bytes_pre: Z) (packed_weights_pre: Z) (bias_pre: Z) (weights_pre: Z) (sr_pre: Z) (kr_pre: Z) (nr_pre: Z) (kc_pre: Z) (nc_pre: Z) (g_pre: Z) (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (PreH1 : (packed_weights_pre <> 0)) (PreH2 : (weights_pre <> 0)) (PreH3 : (sr_pre = 1)) (PreH4 : (kr_pre = 1)) (PreH5 : (nr_pre = 2)) (PreH6 : (kc_pre <> 0)) (PreH7 : (nc_pre <> 0)) (PreH8 : (g_pre <> 0)) (PreH9 : (g_pre > 0)) (PreH10 : (nc_pre > 0)) (PreH11 : (kc_pre > 0)) (PreH12 : (weights_pre > 0)) (PreH13 : (packed_weights_pre > 0)) (PreH14 : (g_pre = (pw_groups (G)))) (PreH15 : (nc_pre = (pw_channels (G)))) (PreH16 : (kc_pre = (pw_depth (G)))) (PreH17 : (extra_bytes_pre = (pw_extra_bytes (G)))) (PreH18 : (nr_pre = 2)) (PreH19 : (kr_pre = 1)) (PreH20 : (sr_pre = 1)) (PreH21 : (pw_program_storage F W G )) (PreH22 : (weights_pre = (pw_weights (G)))) (PreH23 : (bias_pre = (pw_bias (G)))) (PreH24 : (packed_weights_pre = (pw_output_base (G)))) ,
  (pw_data F )
  **  (pw_output W O )
|--
  (pw_data F )
  **  (pw_output W (pw_group_state (F) (G) (O) (0)) )
.

Definition test_rvv_entail_wit_2 := 
(
forall (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (packed_weights: Z) (bias: Z) (weights: Z) (group: Z) (sr: Z) (kr: Z) (nr: Z) (extra_bytes: Z) (kc: Z) (nc: Z) (g: Z) (PreH1 : (group < g)) (PreH2 : (g = (pw_groups (G)))) (PreH3 : (nc = (pw_channels (G)))) (PreH4 : (kc = (pw_depth (G)))) (PreH5 : (extra_bytes = (pw_extra_bytes (G)))) (PreH6 : (nr = 2)) (PreH7 : (kr = 1)) (PreH8 : (sr = 1)) (PreH9 : (pw_program_storage F W G )) (PreH10 : (0 <= group)) (PreH11 : (group <= g)) (PreH12 : (weights = (pw_group_weight (G) (group)))) (PreH13 : (bias = (pw_bias_at (G) (group) (0)))) (PreH14 : (packed_weights = (pw_tile_output (G) (group) (0)))) ,
  (pw_data F )
  **  (pw_output W (pw_group_state (F) (G) (O) (group)) )
|--
  “ (g = (pw_groups (G))) ” 
  &&  “ (nc = (pw_channels (G))) ” 
  &&  “ (kc = (pw_depth (G))) ” 
  &&  “ (extra_bytes = (pw_extra_bytes (G))) ” 
  &&  “ (nr = 2) ” 
  &&  “ (kr = 1) ” 
  &&  “ (sr = 1) ” 
  &&  “ (pw_program_storage F W G ) ” 
  &&  “ (0 <= group) ” 
  &&  “ (group < g) ” 
  &&  “ (0 <= 0) ” 
  &&  “ (0 <= (pw_tiles (G))) ” 
  &&  “ (nc = (nc - (2 * 0 ) )) ” 
  &&  “ (0 <= nc) ” 
  &&  “ (nc <= nc) ” 
  &&  “ (weights = (pw_group_weight (G) (group))) ” 
  &&  “ (weights = (pw_tile_weight (G) (group) (0))) ” 
  &&  “ (bias = (pw_bias_at (G) (group) ((2 * 0 )))) ” 
  &&  “ (packed_weights = (pw_tile_output (G) (group) (0))) ”
  &&  (pw_data F )
  **  (pw_output W (pw_tile_state (F) (G) (O) (group) (0)) )
) \/
(
forall (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (packed_weights: Z) (bias: Z) (weights: Z) (group: Z) (sr: Z) (kr: Z) (nr: Z) (extra_bytes: Z) (kc: Z) (nc: Z) (g: Z) (PreH1 : (group < g)) (PreH2 : (g = (pw_groups (G)))) (PreH3 : (nc = (pw_channels (G)))) (PreH4 : (kc = (pw_depth (G)))) (PreH5 : (extra_bytes = (pw_extra_bytes (G)))) (PreH6 : (nr = 2)) (PreH7 : (kr = 1)) (PreH8 : (sr = 1)) (PreH9 : (pw_program_storage F W G )) (PreH10 : (0 <= group)) (PreH11 : (group <= g)) (PreH12 : (weights = (pw_group_weight (G) (group)))) (PreH13 : (bias = (pw_bias_at (G) (group) (0)))) (PreH14 : (packed_weights = (pw_tile_output (G) (group) (0)))) ,
  (pw_data F )
  **  (pw_output W (pw_group_state (F) (G) (O) (group)) )
|--
  “ (bias = (pw_bias_at (G) (group) ((2 * 0 )))) ” 
  &&  “ (weights = (pw_tile_weight (G) (group) (0))) ” 
  &&  “ (0 <= nc) ” 
  &&  “ (0 <= (pw_tiles (G))) ”
  &&  (pw_data F )
  **  (pw_output W (pw_tile_state (F) (G) (O) (group) (0)) )
).

Definition test_rvv_entail_wit_2_split_goal_1 := 
forall (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (packed_weights: Z) (bias: Z) (weights: Z) (group: Z) (sr: Z) (kr: Z) (nr: Z) (extra_bytes: Z) (kc: Z) (nc: Z) (g: Z) (PreH1 : (group < g)) (PreH2 : (g = (pw_groups (G)))) (PreH3 : (nc = (pw_channels (G)))) (PreH4 : (kc = (pw_depth (G)))) (PreH5 : (extra_bytes = (pw_extra_bytes (G)))) (PreH6 : (nr = 2)) (PreH7 : (kr = 1)) (PreH8 : (sr = 1)) (PreH9 : (pw_program_storage F W G )) (PreH10 : (0 <= group)) (PreH11 : (group <= g)) (PreH12 : (weights = (pw_group_weight (G) (group)))) (PreH13 : (bias = (pw_bias_at (G) (group) (0)))) (PreH14 : (packed_weights = (pw_tile_output (G) (group) (0)))) ,
  (pw_data F )
  **  (pw_output W (pw_group_state (F) (G) (O) (group)) )
|--
  “ (bias = (pw_bias_at (G) (group) ((2 * 0 )))) ”
.

Definition test_rvv_entail_wit_2_split_goal_2 := 
forall (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (packed_weights: Z) (bias: Z) (weights: Z) (group: Z) (sr: Z) (kr: Z) (nr: Z) (extra_bytes: Z) (kc: Z) (nc: Z) (g: Z) (PreH1 : (group < g)) (PreH2 : (g = (pw_groups (G)))) (PreH3 : (nc = (pw_channels (G)))) (PreH4 : (kc = (pw_depth (G)))) (PreH5 : (extra_bytes = (pw_extra_bytes (G)))) (PreH6 : (nr = 2)) (PreH7 : (kr = 1)) (PreH8 : (sr = 1)) (PreH9 : (pw_program_storage F W G )) (PreH10 : (0 <= group)) (PreH11 : (group <= g)) (PreH12 : (weights = (pw_group_weight (G) (group)))) (PreH13 : (bias = (pw_bias_at (G) (group) (0)))) (PreH14 : (packed_weights = (pw_tile_output (G) (group) (0)))) ,
  (pw_data F )
  **  (pw_output W (pw_group_state (F) (G) (O) (group)) )
|--
  “ (weights = (pw_tile_weight (G) (group) (0))) ”
.

Definition test_rvv_entail_wit_2_split_goal_3 := 
forall (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (packed_weights: Z) (bias: Z) (weights: Z) (group: Z) (sr: Z) (kr: Z) (nr: Z) (extra_bytes: Z) (kc: Z) (nc: Z) (g: Z) (PreH1 : (group < g)) (PreH2 : (g = (pw_groups (G)))) (PreH3 : (nc = (pw_channels (G)))) (PreH4 : (kc = (pw_depth (G)))) (PreH5 : (extra_bytes = (pw_extra_bytes (G)))) (PreH6 : (nr = 2)) (PreH7 : (kr = 1)) (PreH8 : (sr = 1)) (PreH9 : (pw_program_storage F W G )) (PreH10 : (0 <= group)) (PreH11 : (group <= g)) (PreH12 : (weights = (pw_group_weight (G) (group)))) (PreH13 : (bias = (pw_bias_at (G) (group) (0)))) (PreH14 : (packed_weights = (pw_tile_output (G) (group) (0)))) ,
  (pw_data F )
  **  (pw_output W (pw_group_state (F) (G) (O) (group)) )
|--
  “ (0 <= nc) ”
.

Definition test_rvv_entail_wit_2_split_goal_4 := 
forall (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (packed_weights: Z) (bias: Z) (weights: Z) (group: Z) (sr: Z) (kr: Z) (nr: Z) (extra_bytes: Z) (kc: Z) (nc: Z) (g: Z) (PreH1 : (group < g)) (PreH2 : (g = (pw_groups (G)))) (PreH3 : (nc = (pw_channels (G)))) (PreH4 : (kc = (pw_depth (G)))) (PreH5 : (extra_bytes = (pw_extra_bytes (G)))) (PreH6 : (nr = 2)) (PreH7 : (kr = 1)) (PreH8 : (sr = 1)) (PreH9 : (pw_program_storage F W G )) (PreH10 : (0 <= group)) (PreH11 : (group <= g)) (PreH12 : (weights = (pw_group_weight (G) (group)))) (PreH13 : (bias = (pw_bias_at (G) (group) (0)))) (PreH14 : (packed_weights = (pw_tile_output (G) (group) (0)))) ,
  (pw_data F )
  **  (pw_output W (pw_group_state (F) (G) (O) (group)) )
|--
  “ (0 <= (pw_tiles (G))) ”
.

Definition test_rvv_entail_wit_2_split_goal_spatial := 
forall (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (packed_weights: Z) (bias: Z) (weights: Z) (group: Z) (sr: Z) (kr: Z) (nr: Z) (extra_bytes: Z) (kc: Z) (nc: Z) (g: Z) (PreH1 : (group < g)) (PreH2 : (g = (pw_groups (G)))) (PreH3 : (nc = (pw_channels (G)))) (PreH4 : (kc = (pw_depth (G)))) (PreH5 : (extra_bytes = (pw_extra_bytes (G)))) (PreH6 : (nr = 2)) (PreH7 : (kr = 1)) (PreH8 : (sr = 1)) (PreH9 : (pw_program_storage F W G )) (PreH10 : (0 <= group)) (PreH11 : (group <= g)) (PreH12 : (weights = (pw_group_weight (G) (group)))) (PreH13 : (bias = (pw_bias_at (G) (group) (0)))) (PreH14 : (packed_weights = (pw_tile_output (G) (group) (0)))) ,
  (pw_data F )
  **  (pw_output W (pw_group_state (F) (G) (O) (group)) )
|--
  (pw_data F )
  **  (pw_output W (pw_tile_state (F) (G) (O) (group) (0)) )
.

Definition test_rvv_entail_wit_3_1 := 
(
forall (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (packed_weights: Z) (bias: Z) (w0: Z) (weights: Z) (n: Z) (tile: Z) (group: Z) (sr: Z) (kr: Z) (nr: Z) (extra_bytes: Z) (kc: Z) (nc: Z) (g: Z) (PreH1 : (bias <> 0)) (PreH2 : (n >= 2)) (PreH3 : (g = (pw_groups (G)))) (PreH4 : (nc = (pw_channels (G)))) (PreH5 : (kc = (pw_depth (G)))) (PreH6 : (extra_bytes = (pw_extra_bytes (G)))) (PreH7 : (nr = 2)) (PreH8 : (kr = 1)) (PreH9 : (sr = 1)) (PreH10 : (pw_program_storage F W G )) (PreH11 : (0 <= group)) (PreH12 : (group < g)) (PreH13 : (0 <= tile)) (PreH14 : (tile <= (pw_tiles (G)))) (PreH15 : (n = (nc - (2 * tile ) ))) (PreH16 : (0 <= n)) (PreH17 : (n <= nc)) (PreH18 : (weights = (pw_group_weight (G) (group)))) (PreH19 : (w0 = (pw_tile_weight (G) (group) (tile)))) (PreH20 : (bias = (pw_bias_at (G) (group) ((2 * tile ))))) (PreH21 : (packed_weights = (pw_tile_output (G) (group) (tile)))) ,
  (pw_data F )
  **  (pw_output W (pw_pair_run (kc) (F) (w0) ((w0 + (kc * sizeof(UINT)))) ((packed_weights + (2 * sizeof(UINT)))) ((pw_header_run (F) ((pw_bias_at (G) (group) ((2 * tile )))) ((pw_tile_output (G) (group) (tile))) (2) ((pw_tile_state (F) (G) (O) (group) (tile)))))) )
|--
  “ (g = (pw_groups (G))) ” 
  &&  “ (nc = (pw_channels (G))) ” 
  &&  “ (kc = (pw_depth (G))) ” 
  &&  “ (extra_bytes = (pw_extra_bytes (G))) ” 
  &&  “ (nr = 2) ” 
  &&  “ (kr = 1) ” 
  &&  “ (sr = 1) ” 
  &&  “ (pw_program_storage F W G ) ” 
  &&  “ (0 <= group) ” 
  &&  “ (group < g) ” 
  &&  “ (0 <= (tile + 1 )) ” 
  &&  “ ((tile + 1 ) <= (pw_tiles (G))) ” 
  &&  “ ((n - 2 ) = (nc - (2 * (tile + 1 ) ) )) ” 
  &&  “ (0 <= (n - 2 )) ” 
  &&  “ ((n - 2 ) <= nc) ” 
  &&  “ (weights = (pw_group_weight (G) (group))) ” 
  &&  “ ((w0 + ((kc + kc ) * sizeof(UINT))) = (pw_tile_weight (G) (group) ((tile + 1 )))) ” 
  &&  “ ((bias + (2 * sizeof(UINT))) = (pw_bias_at (G) (group) ((2 * (tile + 1 ) )))) ” 
  &&  “ ((unsigned_last_nbits (((unsigned_last_nbits ((packed_weights + ((2 + (unsigned_last_nbits ((2 * kc )) (64)) ) * sizeof(UINT)))) (64)) + extra_bytes )) (64)) = (pw_tile_output (G) (group) ((tile + 1 )))) ”
  &&  (pw_data F )
  **  (pw_output W (pw_tile_state (F) (G) (O) (group) ((tile + 1 ))) )
) \/
(
forall (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (packed_weights: Z) (bias: Z) (w0: Z) (weights: Z) (n: Z) (tile: Z) (group: Z) (sr: Z) (kr: Z) (nr: Z) (extra_bytes: Z) (kc: Z) (nc: Z) (g: Z) (PreH1 : (bias <> 0)) (PreH2 : (n >= 2)) (PreH3 : (g = (pw_groups (G)))) (PreH4 : (nc = (pw_channels (G)))) (PreH5 : (kc = (pw_depth (G)))) (PreH6 : (extra_bytes = (pw_extra_bytes (G)))) (PreH7 : (nr = 2)) (PreH8 : (kr = 1)) (PreH9 : (sr = 1)) (PreH10 : (pw_program_storage F W G )) (PreH11 : (0 <= group)) (PreH12 : (group < g)) (PreH13 : (0 <= tile)) (PreH14 : (tile <= (pw_tiles (G)))) (PreH15 : (n = (nc - (2 * tile ) ))) (PreH16 : (0 <= n)) (PreH17 : (n <= nc)) (PreH18 : (weights = (pw_group_weight (G) (group)))) (PreH19 : (w0 = (pw_tile_weight (G) (group) (tile)))) (PreH20 : (bias = (pw_bias_at (G) (group) ((2 * tile ))))) (PreH21 : (packed_weights = (pw_tile_output (G) (group) (tile)))) ,
  (pw_data F )
  **  (pw_output W (pw_pair_run (kc) (F) (w0) ((w0 + (kc * sizeof(UINT)))) ((packed_weights + (2 * sizeof(UINT)))) ((pw_header_run (F) ((pw_bias_at (G) (group) ((2 * tile )))) ((pw_tile_output (G) (group) (tile))) (2) ((pw_tile_state (F) (G) (O) (group) (tile)))))) )
|--
  “ ((unsigned_last_nbits (((unsigned_last_nbits ((packed_weights + ((2 + (unsigned_last_nbits ((2 * kc )) (64)) ) * sizeof(UINT)))) (64)) + extra_bytes )) (64)) = (pw_tile_output (G) (group) ((tile + 1 )))) ” 
  &&  “ ((bias + (2 * sizeof(UINT))) = (pw_bias_at (G) (group) ((2 * (tile + 1 ) )))) ” 
  &&  “ ((w0 + ((kc + kc ) * sizeof(UINT))) = (pw_tile_weight (G) (group) ((tile + 1 )))) ” 
  &&  “ ((tile + 1 ) <= (pw_tiles (G))) ”
  &&  (pw_data F )
  **  (pw_output W (pw_tile_state (F) (G) (O) (group) ((tile + 1 ))) )
).

Definition test_rvv_entail_wit_3_1_split_goal_1 := 
forall (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (packed_weights: Z) (bias: Z) (w0: Z) (weights: Z) (n: Z) (tile: Z) (group: Z) (sr: Z) (kr: Z) (nr: Z) (extra_bytes: Z) (kc: Z) (nc: Z) (g: Z) (PreH1 : (bias <> 0)) (PreH2 : (n >= 2)) (PreH3 : (g = (pw_groups (G)))) (PreH4 : (nc = (pw_channels (G)))) (PreH5 : (kc = (pw_depth (G)))) (PreH6 : (extra_bytes = (pw_extra_bytes (G)))) (PreH7 : (nr = 2)) (PreH8 : (kr = 1)) (PreH9 : (sr = 1)) (PreH10 : (pw_program_storage F W G )) (PreH11 : (0 <= group)) (PreH12 : (group < g)) (PreH13 : (0 <= tile)) (PreH14 : (tile <= (pw_tiles (G)))) (PreH15 : (n = (nc - (2 * tile ) ))) (PreH16 : (0 <= n)) (PreH17 : (n <= nc)) (PreH18 : (weights = (pw_group_weight (G) (group)))) (PreH19 : (w0 = (pw_tile_weight (G) (group) (tile)))) (PreH20 : (bias = (pw_bias_at (G) (group) ((2 * tile ))))) (PreH21 : (packed_weights = (pw_tile_output (G) (group) (tile)))) ,
  (pw_data F )
  **  (pw_output W (pw_pair_run (kc) (F) (w0) ((w0 + (kc * sizeof(UINT)))) ((packed_weights + (2 * sizeof(UINT)))) ((pw_header_run (F) ((pw_bias_at (G) (group) ((2 * tile )))) ((pw_tile_output (G) (group) (tile))) (2) ((pw_tile_state (F) (G) (O) (group) (tile)))))) )
|--
  “ ((unsigned_last_nbits (((unsigned_last_nbits ((packed_weights + ((2 + (unsigned_last_nbits ((2 * kc )) (64)) ) * sizeof(UINT)))) (64)) + extra_bytes )) (64)) = (pw_tile_output (G) (group) ((tile + 1 )))) ”
.

Definition test_rvv_entail_wit_3_1_split_goal_2 := 
forall (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (packed_weights: Z) (bias: Z) (w0: Z) (weights: Z) (n: Z) (tile: Z) (group: Z) (sr: Z) (kr: Z) (nr: Z) (extra_bytes: Z) (kc: Z) (nc: Z) (g: Z) (PreH1 : (bias <> 0)) (PreH2 : (n >= 2)) (PreH3 : (g = (pw_groups (G)))) (PreH4 : (nc = (pw_channels (G)))) (PreH5 : (kc = (pw_depth (G)))) (PreH6 : (extra_bytes = (pw_extra_bytes (G)))) (PreH7 : (nr = 2)) (PreH8 : (kr = 1)) (PreH9 : (sr = 1)) (PreH10 : (pw_program_storage F W G )) (PreH11 : (0 <= group)) (PreH12 : (group < g)) (PreH13 : (0 <= tile)) (PreH14 : (tile <= (pw_tiles (G)))) (PreH15 : (n = (nc - (2 * tile ) ))) (PreH16 : (0 <= n)) (PreH17 : (n <= nc)) (PreH18 : (weights = (pw_group_weight (G) (group)))) (PreH19 : (w0 = (pw_tile_weight (G) (group) (tile)))) (PreH20 : (bias = (pw_bias_at (G) (group) ((2 * tile ))))) (PreH21 : (packed_weights = (pw_tile_output (G) (group) (tile)))) ,
  (pw_data F )
  **  (pw_output W (pw_pair_run (kc) (F) (w0) ((w0 + (kc * sizeof(UINT)))) ((packed_weights + (2 * sizeof(UINT)))) ((pw_header_run (F) ((pw_bias_at (G) (group) ((2 * tile )))) ((pw_tile_output (G) (group) (tile))) (2) ((pw_tile_state (F) (G) (O) (group) (tile)))))) )
|--
  “ ((bias + (2 * sizeof(UINT))) = (pw_bias_at (G) (group) ((2 * (tile + 1 ) )))) ”
.

Definition test_rvv_entail_wit_3_1_split_goal_3 := 
forall (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (packed_weights: Z) (bias: Z) (w0: Z) (weights: Z) (n: Z) (tile: Z) (group: Z) (sr: Z) (kr: Z) (nr: Z) (extra_bytes: Z) (kc: Z) (nc: Z) (g: Z) (PreH1 : (bias <> 0)) (PreH2 : (n >= 2)) (PreH3 : (g = (pw_groups (G)))) (PreH4 : (nc = (pw_channels (G)))) (PreH5 : (kc = (pw_depth (G)))) (PreH6 : (extra_bytes = (pw_extra_bytes (G)))) (PreH7 : (nr = 2)) (PreH8 : (kr = 1)) (PreH9 : (sr = 1)) (PreH10 : (pw_program_storage F W G )) (PreH11 : (0 <= group)) (PreH12 : (group < g)) (PreH13 : (0 <= tile)) (PreH14 : (tile <= (pw_tiles (G)))) (PreH15 : (n = (nc - (2 * tile ) ))) (PreH16 : (0 <= n)) (PreH17 : (n <= nc)) (PreH18 : (weights = (pw_group_weight (G) (group)))) (PreH19 : (w0 = (pw_tile_weight (G) (group) (tile)))) (PreH20 : (bias = (pw_bias_at (G) (group) ((2 * tile ))))) (PreH21 : (packed_weights = (pw_tile_output (G) (group) (tile)))) ,
  (pw_data F )
  **  (pw_output W (pw_pair_run (kc) (F) (w0) ((w0 + (kc * sizeof(UINT)))) ((packed_weights + (2 * sizeof(UINT)))) ((pw_header_run (F) ((pw_bias_at (G) (group) ((2 * tile )))) ((pw_tile_output (G) (group) (tile))) (2) ((pw_tile_state (F) (G) (O) (group) (tile)))))) )
|--
  “ ((w0 + ((kc + kc ) * sizeof(UINT))) = (pw_tile_weight (G) (group) ((tile + 1 )))) ”
.

Definition test_rvv_entail_wit_3_1_split_goal_4 := 
forall (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (packed_weights: Z) (bias: Z) (w0: Z) (weights: Z) (n: Z) (tile: Z) (group: Z) (sr: Z) (kr: Z) (nr: Z) (extra_bytes: Z) (kc: Z) (nc: Z) (g: Z) (PreH1 : (bias <> 0)) (PreH2 : (n >= 2)) (PreH3 : (g = (pw_groups (G)))) (PreH4 : (nc = (pw_channels (G)))) (PreH5 : (kc = (pw_depth (G)))) (PreH6 : (extra_bytes = (pw_extra_bytes (G)))) (PreH7 : (nr = 2)) (PreH8 : (kr = 1)) (PreH9 : (sr = 1)) (PreH10 : (pw_program_storage F W G )) (PreH11 : (0 <= group)) (PreH12 : (group < g)) (PreH13 : (0 <= tile)) (PreH14 : (tile <= (pw_tiles (G)))) (PreH15 : (n = (nc - (2 * tile ) ))) (PreH16 : (0 <= n)) (PreH17 : (n <= nc)) (PreH18 : (weights = (pw_group_weight (G) (group)))) (PreH19 : (w0 = (pw_tile_weight (G) (group) (tile)))) (PreH20 : (bias = (pw_bias_at (G) (group) ((2 * tile ))))) (PreH21 : (packed_weights = (pw_tile_output (G) (group) (tile)))) ,
  (pw_data F )
  **  (pw_output W (pw_pair_run (kc) (F) (w0) ((w0 + (kc * sizeof(UINT)))) ((packed_weights + (2 * sizeof(UINT)))) ((pw_header_run (F) ((pw_bias_at (G) (group) ((2 * tile )))) ((pw_tile_output (G) (group) (tile))) (2) ((pw_tile_state (F) (G) (O) (group) (tile)))))) )
|--
  “ ((tile + 1 ) <= (pw_tiles (G))) ”
.

Definition test_rvv_entail_wit_3_1_split_goal_spatial := 
forall (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (packed_weights: Z) (bias: Z) (w0: Z) (weights: Z) (n: Z) (tile: Z) (group: Z) (sr: Z) (kr: Z) (nr: Z) (extra_bytes: Z) (kc: Z) (nc: Z) (g: Z) (PreH1 : (bias <> 0)) (PreH2 : (n >= 2)) (PreH3 : (g = (pw_groups (G)))) (PreH4 : (nc = (pw_channels (G)))) (PreH5 : (kc = (pw_depth (G)))) (PreH6 : (extra_bytes = (pw_extra_bytes (G)))) (PreH7 : (nr = 2)) (PreH8 : (kr = 1)) (PreH9 : (sr = 1)) (PreH10 : (pw_program_storage F W G )) (PreH11 : (0 <= group)) (PreH12 : (group < g)) (PreH13 : (0 <= tile)) (PreH14 : (tile <= (pw_tiles (G)))) (PreH15 : (n = (nc - (2 * tile ) ))) (PreH16 : (0 <= n)) (PreH17 : (n <= nc)) (PreH18 : (weights = (pw_group_weight (G) (group)))) (PreH19 : (w0 = (pw_tile_weight (G) (group) (tile)))) (PreH20 : (bias = (pw_bias_at (G) (group) ((2 * tile ))))) (PreH21 : (packed_weights = (pw_tile_output (G) (group) (tile)))) ,
  (pw_data F )
  **  (pw_output W (pw_pair_run (kc) (F) (w0) ((w0 + (kc * sizeof(UINT)))) ((packed_weights + (2 * sizeof(UINT)))) ((pw_header_run (F) ((pw_bias_at (G) (group) ((2 * tile )))) ((pw_tile_output (G) (group) (tile))) (2) ((pw_tile_state (F) (G) (O) (group) (tile)))))) )
|--
  (pw_data F )
  **  (pw_output W (pw_tile_state (F) (G) (O) (group) ((tile + 1 ))) )
.

Definition test_rvv_entail_wit_3_2 := 
(
forall (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (packed_weights: Z) (bias: Z) (w0: Z) (weights: Z) (n: Z) (tile: Z) (group: Z) (sr: Z) (kr: Z) (nr: Z) (extra_bytes: Z) (kc: Z) (nc: Z) (g: Z) (PreH1 : (bias = 0)) (PreH2 : (n >= 2)) (PreH3 : (g = (pw_groups (G)))) (PreH4 : (nc = (pw_channels (G)))) (PreH5 : (kc = (pw_depth (G)))) (PreH6 : (extra_bytes = (pw_extra_bytes (G)))) (PreH7 : (nr = 2)) (PreH8 : (kr = 1)) (PreH9 : (sr = 1)) (PreH10 : (pw_program_storage F W G )) (PreH11 : (0 <= group)) (PreH12 : (group < g)) (PreH13 : (0 <= tile)) (PreH14 : (tile <= (pw_tiles (G)))) (PreH15 : (n = (nc - (2 * tile ) ))) (PreH16 : (0 <= n)) (PreH17 : (n <= nc)) (PreH18 : (weights = (pw_group_weight (G) (group)))) (PreH19 : (w0 = (pw_tile_weight (G) (group) (tile)))) (PreH20 : (bias = (pw_bias_at (G) (group) ((2 * tile ))))) (PreH21 : (packed_weights = (pw_tile_output (G) (group) (tile)))) ,
  (pw_data F )
  **  (pw_output W (pw_pair_run (kc) (F) (w0) ((w0 + (kc * sizeof(UINT)))) ((packed_weights + (2 * sizeof(UINT)))) ((pw_header_run (F) (0) ((pw_tile_output (G) (group) (tile))) (2) ((pw_tile_state (F) (G) (O) (group) (tile)))))) )
|--
  “ (g = (pw_groups (G))) ” 
  &&  “ (nc = (pw_channels (G))) ” 
  &&  “ (kc = (pw_depth (G))) ” 
  &&  “ (extra_bytes = (pw_extra_bytes (G))) ” 
  &&  “ (nr = 2) ” 
  &&  “ (kr = 1) ” 
  &&  “ (sr = 1) ” 
  &&  “ (pw_program_storage F W G ) ” 
  &&  “ (0 <= group) ” 
  &&  “ (group < g) ” 
  &&  “ (0 <= (tile + 1 )) ” 
  &&  “ ((tile + 1 ) <= (pw_tiles (G))) ” 
  &&  “ ((n - 2 ) = (nc - (2 * (tile + 1 ) ) )) ” 
  &&  “ (0 <= (n - 2 )) ” 
  &&  “ ((n - 2 ) <= nc) ” 
  &&  “ (weights = (pw_group_weight (G) (group))) ” 
  &&  “ ((w0 + ((kc + kc ) * sizeof(UINT))) = (pw_tile_weight (G) (group) ((tile + 1 )))) ” 
  &&  “ (bias = (pw_bias_at (G) (group) ((2 * (tile + 1 ) )))) ” 
  &&  “ ((unsigned_last_nbits (((unsigned_last_nbits ((packed_weights + ((2 + (unsigned_last_nbits ((2 * kc )) (64)) ) * sizeof(UINT)))) (64)) + extra_bytes )) (64)) = (pw_tile_output (G) (group) ((tile + 1 )))) ”
  &&  (pw_data F )
  **  (pw_output W (pw_tile_state (F) (G) (O) (group) ((tile + 1 ))) )
) \/
(
forall (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (packed_weights: Z) (bias: Z) (w0: Z) (weights: Z) (n: Z) (tile: Z) (group: Z) (sr: Z) (kr: Z) (nr: Z) (extra_bytes: Z) (kc: Z) (nc: Z) (g: Z) (PreH1 : (bias = 0)) (PreH2 : (n >= 2)) (PreH3 : (g = (pw_groups (G)))) (PreH4 : (nc = (pw_channels (G)))) (PreH5 : (kc = (pw_depth (G)))) (PreH6 : (extra_bytes = (pw_extra_bytes (G)))) (PreH7 : (nr = 2)) (PreH8 : (kr = 1)) (PreH9 : (sr = 1)) (PreH10 : (pw_program_storage F W G )) (PreH11 : (0 <= group)) (PreH12 : (group < g)) (PreH13 : (0 <= tile)) (PreH14 : (tile <= (pw_tiles (G)))) (PreH15 : (n = (nc - (2 * tile ) ))) (PreH16 : (0 <= n)) (PreH17 : (n <= nc)) (PreH18 : (weights = (pw_group_weight (G) (group)))) (PreH19 : (w0 = (pw_tile_weight (G) (group) (tile)))) (PreH20 : (bias = (pw_bias_at (G) (group) ((2 * tile ))))) (PreH21 : (packed_weights = (pw_tile_output (G) (group) (tile)))) ,
  (pw_data F )
  **  (pw_output W (pw_pair_run (kc) (F) (w0) ((w0 + (kc * sizeof(UINT)))) ((packed_weights + (2 * sizeof(UINT)))) ((pw_header_run (F) (0) ((pw_tile_output (G) (group) (tile))) (2) ((pw_tile_state (F) (G) (O) (group) (tile)))))) )
|--
  “ ((unsigned_last_nbits (((unsigned_last_nbits ((packed_weights + ((2 + (unsigned_last_nbits ((2 * kc )) (64)) ) * sizeof(UINT)))) (64)) + extra_bytes )) (64)) = (pw_tile_output (G) (group) ((tile + 1 )))) ” 
  &&  “ (0 = (pw_bias_at (G) (group) ((2 * (tile + 1 ) )))) ” 
  &&  “ ((w0 + ((kc + kc ) * sizeof(UINT))) = (pw_tile_weight (G) (group) ((tile + 1 )))) ” 
  &&  “ ((tile + 1 ) <= (pw_tiles (G))) ”
  &&  (pw_data F )
  **  (pw_output W (pw_tile_state (F) (G) (O) (group) ((tile + 1 ))) )
).

Definition test_rvv_entail_wit_3_2_split_goal_1 := 
forall (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (packed_weights: Z) (bias: Z) (w0: Z) (weights: Z) (n: Z) (tile: Z) (group: Z) (sr: Z) (kr: Z) (nr: Z) (extra_bytes: Z) (kc: Z) (nc: Z) (g: Z) (PreH1 : (bias = 0)) (PreH2 : (n >= 2)) (PreH3 : (g = (pw_groups (G)))) (PreH4 : (nc = (pw_channels (G)))) (PreH5 : (kc = (pw_depth (G)))) (PreH6 : (extra_bytes = (pw_extra_bytes (G)))) (PreH7 : (nr = 2)) (PreH8 : (kr = 1)) (PreH9 : (sr = 1)) (PreH10 : (pw_program_storage F W G )) (PreH11 : (0 <= group)) (PreH12 : (group < g)) (PreH13 : (0 <= tile)) (PreH14 : (tile <= (pw_tiles (G)))) (PreH15 : (n = (nc - (2 * tile ) ))) (PreH16 : (0 <= n)) (PreH17 : (n <= nc)) (PreH18 : (weights = (pw_group_weight (G) (group)))) (PreH19 : (w0 = (pw_tile_weight (G) (group) (tile)))) (PreH20 : (bias = (pw_bias_at (G) (group) ((2 * tile ))))) (PreH21 : (packed_weights = (pw_tile_output (G) (group) (tile)))) ,
  (pw_data F )
  **  (pw_output W (pw_pair_run (kc) (F) (w0) ((w0 + (kc * sizeof(UINT)))) ((packed_weights + (2 * sizeof(UINT)))) ((pw_header_run (F) (0) ((pw_tile_output (G) (group) (tile))) (2) ((pw_tile_state (F) (G) (O) (group) (tile)))))) )
|--
  “ ((unsigned_last_nbits (((unsigned_last_nbits ((packed_weights + ((2 + (unsigned_last_nbits ((2 * kc )) (64)) ) * sizeof(UINT)))) (64)) + extra_bytes )) (64)) = (pw_tile_output (G) (group) ((tile + 1 )))) ”
.

Definition test_rvv_entail_wit_3_2_split_goal_2 := 
forall (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (packed_weights: Z) (bias: Z) (w0: Z) (weights: Z) (n: Z) (tile: Z) (group: Z) (sr: Z) (kr: Z) (nr: Z) (extra_bytes: Z) (kc: Z) (nc: Z) (g: Z) (PreH1 : (bias = 0)) (PreH2 : (n >= 2)) (PreH3 : (g = (pw_groups (G)))) (PreH4 : (nc = (pw_channels (G)))) (PreH5 : (kc = (pw_depth (G)))) (PreH6 : (extra_bytes = (pw_extra_bytes (G)))) (PreH7 : (nr = 2)) (PreH8 : (kr = 1)) (PreH9 : (sr = 1)) (PreH10 : (pw_program_storage F W G )) (PreH11 : (0 <= group)) (PreH12 : (group < g)) (PreH13 : (0 <= tile)) (PreH14 : (tile <= (pw_tiles (G)))) (PreH15 : (n = (nc - (2 * tile ) ))) (PreH16 : (0 <= n)) (PreH17 : (n <= nc)) (PreH18 : (weights = (pw_group_weight (G) (group)))) (PreH19 : (w0 = (pw_tile_weight (G) (group) (tile)))) (PreH20 : (bias = (pw_bias_at (G) (group) ((2 * tile ))))) (PreH21 : (packed_weights = (pw_tile_output (G) (group) (tile)))) ,
  (pw_data F )
  **  (pw_output W (pw_pair_run (kc) (F) (w0) ((w0 + (kc * sizeof(UINT)))) ((packed_weights + (2 * sizeof(UINT)))) ((pw_header_run (F) (0) ((pw_tile_output (G) (group) (tile))) (2) ((pw_tile_state (F) (G) (O) (group) (tile)))))) )
|--
  “ (0 = (pw_bias_at (G) (group) ((2 * (tile + 1 ) )))) ”
.

Definition test_rvv_entail_wit_3_2_split_goal_3 := 
forall (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (packed_weights: Z) (bias: Z) (w0: Z) (weights: Z) (n: Z) (tile: Z) (group: Z) (sr: Z) (kr: Z) (nr: Z) (extra_bytes: Z) (kc: Z) (nc: Z) (g: Z) (PreH1 : (bias = 0)) (PreH2 : (n >= 2)) (PreH3 : (g = (pw_groups (G)))) (PreH4 : (nc = (pw_channels (G)))) (PreH5 : (kc = (pw_depth (G)))) (PreH6 : (extra_bytes = (pw_extra_bytes (G)))) (PreH7 : (nr = 2)) (PreH8 : (kr = 1)) (PreH9 : (sr = 1)) (PreH10 : (pw_program_storage F W G )) (PreH11 : (0 <= group)) (PreH12 : (group < g)) (PreH13 : (0 <= tile)) (PreH14 : (tile <= (pw_tiles (G)))) (PreH15 : (n = (nc - (2 * tile ) ))) (PreH16 : (0 <= n)) (PreH17 : (n <= nc)) (PreH18 : (weights = (pw_group_weight (G) (group)))) (PreH19 : (w0 = (pw_tile_weight (G) (group) (tile)))) (PreH20 : (bias = (pw_bias_at (G) (group) ((2 * tile ))))) (PreH21 : (packed_weights = (pw_tile_output (G) (group) (tile)))) ,
  (pw_data F )
  **  (pw_output W (pw_pair_run (kc) (F) (w0) ((w0 + (kc * sizeof(UINT)))) ((packed_weights + (2 * sizeof(UINT)))) ((pw_header_run (F) (0) ((pw_tile_output (G) (group) (tile))) (2) ((pw_tile_state (F) (G) (O) (group) (tile)))))) )
|--
  “ ((w0 + ((kc + kc ) * sizeof(UINT))) = (pw_tile_weight (G) (group) ((tile + 1 )))) ”
.

Definition test_rvv_entail_wit_3_2_split_goal_4 := 
forall (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (packed_weights: Z) (bias: Z) (w0: Z) (weights: Z) (n: Z) (tile: Z) (group: Z) (sr: Z) (kr: Z) (nr: Z) (extra_bytes: Z) (kc: Z) (nc: Z) (g: Z) (PreH1 : (bias = 0)) (PreH2 : (n >= 2)) (PreH3 : (g = (pw_groups (G)))) (PreH4 : (nc = (pw_channels (G)))) (PreH5 : (kc = (pw_depth (G)))) (PreH6 : (extra_bytes = (pw_extra_bytes (G)))) (PreH7 : (nr = 2)) (PreH8 : (kr = 1)) (PreH9 : (sr = 1)) (PreH10 : (pw_program_storage F W G )) (PreH11 : (0 <= group)) (PreH12 : (group < g)) (PreH13 : (0 <= tile)) (PreH14 : (tile <= (pw_tiles (G)))) (PreH15 : (n = (nc - (2 * tile ) ))) (PreH16 : (0 <= n)) (PreH17 : (n <= nc)) (PreH18 : (weights = (pw_group_weight (G) (group)))) (PreH19 : (w0 = (pw_tile_weight (G) (group) (tile)))) (PreH20 : (bias = (pw_bias_at (G) (group) ((2 * tile ))))) (PreH21 : (packed_weights = (pw_tile_output (G) (group) (tile)))) ,
  (pw_data F )
  **  (pw_output W (pw_pair_run (kc) (F) (w0) ((w0 + (kc * sizeof(UINT)))) ((packed_weights + (2 * sizeof(UINT)))) ((pw_header_run (F) (0) ((pw_tile_output (G) (group) (tile))) (2) ((pw_tile_state (F) (G) (O) (group) (tile)))))) )
|--
  “ ((tile + 1 ) <= (pw_tiles (G))) ”
.

Definition test_rvv_entail_wit_3_2_split_goal_spatial := 
forall (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (packed_weights: Z) (bias: Z) (w0: Z) (weights: Z) (n: Z) (tile: Z) (group: Z) (sr: Z) (kr: Z) (nr: Z) (extra_bytes: Z) (kc: Z) (nc: Z) (g: Z) (PreH1 : (bias = 0)) (PreH2 : (n >= 2)) (PreH3 : (g = (pw_groups (G)))) (PreH4 : (nc = (pw_channels (G)))) (PreH5 : (kc = (pw_depth (G)))) (PreH6 : (extra_bytes = (pw_extra_bytes (G)))) (PreH7 : (nr = 2)) (PreH8 : (kr = 1)) (PreH9 : (sr = 1)) (PreH10 : (pw_program_storage F W G )) (PreH11 : (0 <= group)) (PreH12 : (group < g)) (PreH13 : (0 <= tile)) (PreH14 : (tile <= (pw_tiles (G)))) (PreH15 : (n = (nc - (2 * tile ) ))) (PreH16 : (0 <= n)) (PreH17 : (n <= nc)) (PreH18 : (weights = (pw_group_weight (G) (group)))) (PreH19 : (w0 = (pw_tile_weight (G) (group) (tile)))) (PreH20 : (bias = (pw_bias_at (G) (group) ((2 * tile ))))) (PreH21 : (packed_weights = (pw_tile_output (G) (group) (tile)))) ,
  (pw_data F )
  **  (pw_output W (pw_pair_run (kc) (F) (w0) ((w0 + (kc * sizeof(UINT)))) ((packed_weights + (2 * sizeof(UINT)))) ((pw_header_run (F) (0) ((pw_tile_output (G) (group) (tile))) (2) ((pw_tile_state (F) (G) (O) (group) (tile)))))) )
|--
  (pw_data F )
  **  (pw_output W (pw_tile_state (F) (G) (O) (group) ((tile + 1 ))) )
.

Definition test_rvv_entail_wit_4_1 := 
(
forall (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (packed_weights: Z) (bias: Z) (w0: Z) (weights: Z) (n: Z) (tile: Z) (group: Z) (sr: Z) (kr: Z) (nr: Z) (extra_bytes: Z) (kc: Z) (nc: Z) (g: Z) (PreH1 : (bias <> 0)) (PreH2 : (n <> 0)) (PreH3 : (n < 2)) (PreH4 : (g = (pw_groups (G)))) (PreH5 : (nc = (pw_channels (G)))) (PreH6 : (kc = (pw_depth (G)))) (PreH7 : (extra_bytes = (pw_extra_bytes (G)))) (PreH8 : (nr = 2)) (PreH9 : (kr = 1)) (PreH10 : (sr = 1)) (PreH11 : (pw_program_storage F W G )) (PreH12 : (0 <= group)) (PreH13 : (group < g)) (PreH14 : (0 <= tile)) (PreH15 : (tile <= (pw_tiles (G)))) (PreH16 : (n = (nc - (2 * tile ) ))) (PreH17 : (0 <= n)) (PreH18 : (n <= nc)) (PreH19 : (weights = (pw_group_weight (G) (group)))) (PreH20 : (w0 = (pw_tile_weight (G) (group) (tile)))) (PreH21 : (bias = (pw_bias_at (G) (group) ((2 * tile ))))) (PreH22 : (packed_weights = (pw_tile_output (G) (group) (tile)))) ,
  (pw_data F )
  **  (pw_output W (pw_odd_run (kc) (F) (w0) ((packed_weights + (2 * sizeof(UINT)))) ((pw_header_run (F) ((pw_bias_at (G) (group) ((2 * tile )))) ((pw_tile_output (G) (group) (tile))) (1) ((pw_tile_state (F) (G) (O) (group) (tile)))))) )
|--
  “ (g = (pw_groups (G))) ” 
  &&  “ (nc = (pw_channels (G))) ” 
  &&  “ (kc = (pw_depth (G))) ” 
  &&  “ (extra_bytes = (pw_extra_bytes (G))) ” 
  &&  “ (nr = 2) ” 
  &&  “ (kr = 1) ” 
  &&  “ (sr = 1) ” 
  &&  “ (pw_program_storage F W G ) ” 
  &&  “ (0 <= (group + 1 )) ” 
  &&  “ ((group + 1 ) <= g) ” 
  &&  “ ((weights + ((unsigned_last_nbits ((nc * kc )) (64)) * sizeof(UINT))) = (pw_group_weight (G) ((group + 1 )))) ” 
  &&  “ ((bias + (1 * sizeof(UINT))) = (pw_bias_at (G) ((group + 1 )) (0))) ” 
  &&  “ ((unsigned_last_nbits (((unsigned_last_nbits ((packed_weights + ((2 + (unsigned_last_nbits ((2 * kc )) (64)) ) * sizeof(UINT)))) (64)) + extra_bytes )) (64)) = (pw_tile_output (G) ((group + 1 )) (0))) ”
  &&  (pw_data F )
  **  (pw_output W (pw_group_state (F) (G) (O) ((group + 1 ))) )
) \/
(
forall (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (packed_weights: Z) (bias: Z) (w0: Z) (weights: Z) (n: Z) (tile: Z) (group: Z) (sr: Z) (kr: Z) (nr: Z) (extra_bytes: Z) (kc: Z) (nc: Z) (g: Z) (PreH1 : (bias <> 0)) (PreH2 : (n <> 0)) (PreH3 : (n < 2)) (PreH4 : (g = (pw_groups (G)))) (PreH5 : (nc = (pw_channels (G)))) (PreH6 : (kc = (pw_depth (G)))) (PreH7 : (extra_bytes = (pw_extra_bytes (G)))) (PreH8 : (nr = 2)) (PreH9 : (kr = 1)) (PreH10 : (sr = 1)) (PreH11 : (pw_program_storage F W G )) (PreH12 : (0 <= group)) (PreH13 : (group < g)) (PreH14 : (0 <= tile)) (PreH15 : (tile <= (pw_tiles (G)))) (PreH16 : (n = (nc - (2 * tile ) ))) (PreH17 : (0 <= n)) (PreH18 : (n <= nc)) (PreH19 : (weights = (pw_group_weight (G) (group)))) (PreH20 : (w0 = (pw_tile_weight (G) (group) (tile)))) (PreH21 : (bias = (pw_bias_at (G) (group) ((2 * tile ))))) (PreH22 : (packed_weights = (pw_tile_output (G) (group) (tile)))) ,
  (pw_data F )
  **  (pw_output W (pw_odd_run (kc) (F) (w0) ((packed_weights + (2 * sizeof(UINT)))) ((pw_header_run (F) ((pw_bias_at (G) (group) ((2 * tile )))) ((pw_tile_output (G) (group) (tile))) (1) ((pw_tile_state (F) (G) (O) (group) (tile)))))) )
|--
  “ ((unsigned_last_nbits (((unsigned_last_nbits ((packed_weights + ((2 + (unsigned_last_nbits ((2 * kc )) (64)) ) * sizeof(UINT)))) (64)) + extra_bytes )) (64)) = (pw_tile_output (G) ((group + 1 )) (0))) ” 
  &&  “ ((bias + (1 * sizeof(UINT))) = (pw_bias_at (G) ((group + 1 )) (0))) ” 
  &&  “ ((weights + ((unsigned_last_nbits ((nc * kc )) (64)) * sizeof(UINT))) = (pw_group_weight (G) ((group + 1 )))) ”
  &&  (pw_data F )
  **  (pw_output W (pw_group_state (F) (G) (O) ((group + 1 ))) )
).

Definition test_rvv_entail_wit_4_1_split_goal_1 := 
forall (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (packed_weights: Z) (bias: Z) (w0: Z) (weights: Z) (n: Z) (tile: Z) (group: Z) (sr: Z) (kr: Z) (nr: Z) (extra_bytes: Z) (kc: Z) (nc: Z) (g: Z) (PreH1 : (bias <> 0)) (PreH2 : (n <> 0)) (PreH3 : (n < 2)) (PreH4 : (g = (pw_groups (G)))) (PreH5 : (nc = (pw_channels (G)))) (PreH6 : (kc = (pw_depth (G)))) (PreH7 : (extra_bytes = (pw_extra_bytes (G)))) (PreH8 : (nr = 2)) (PreH9 : (kr = 1)) (PreH10 : (sr = 1)) (PreH11 : (pw_program_storage F W G )) (PreH12 : (0 <= group)) (PreH13 : (group < g)) (PreH14 : (0 <= tile)) (PreH15 : (tile <= (pw_tiles (G)))) (PreH16 : (n = (nc - (2 * tile ) ))) (PreH17 : (0 <= n)) (PreH18 : (n <= nc)) (PreH19 : (weights = (pw_group_weight (G) (group)))) (PreH20 : (w0 = (pw_tile_weight (G) (group) (tile)))) (PreH21 : (bias = (pw_bias_at (G) (group) ((2 * tile ))))) (PreH22 : (packed_weights = (pw_tile_output (G) (group) (tile)))) ,
  (pw_data F )
  **  (pw_output W (pw_odd_run (kc) (F) (w0) ((packed_weights + (2 * sizeof(UINT)))) ((pw_header_run (F) ((pw_bias_at (G) (group) ((2 * tile )))) ((pw_tile_output (G) (group) (tile))) (1) ((pw_tile_state (F) (G) (O) (group) (tile)))))) )
|--
  “ ((unsigned_last_nbits (((unsigned_last_nbits ((packed_weights + ((2 + (unsigned_last_nbits ((2 * kc )) (64)) ) * sizeof(UINT)))) (64)) + extra_bytes )) (64)) = (pw_tile_output (G) ((group + 1 )) (0))) ”
.

Definition test_rvv_entail_wit_4_1_split_goal_2 := 
forall (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (packed_weights: Z) (bias: Z) (w0: Z) (weights: Z) (n: Z) (tile: Z) (group: Z) (sr: Z) (kr: Z) (nr: Z) (extra_bytes: Z) (kc: Z) (nc: Z) (g: Z) (PreH1 : (bias <> 0)) (PreH2 : (n <> 0)) (PreH3 : (n < 2)) (PreH4 : (g = (pw_groups (G)))) (PreH5 : (nc = (pw_channels (G)))) (PreH6 : (kc = (pw_depth (G)))) (PreH7 : (extra_bytes = (pw_extra_bytes (G)))) (PreH8 : (nr = 2)) (PreH9 : (kr = 1)) (PreH10 : (sr = 1)) (PreH11 : (pw_program_storage F W G )) (PreH12 : (0 <= group)) (PreH13 : (group < g)) (PreH14 : (0 <= tile)) (PreH15 : (tile <= (pw_tiles (G)))) (PreH16 : (n = (nc - (2 * tile ) ))) (PreH17 : (0 <= n)) (PreH18 : (n <= nc)) (PreH19 : (weights = (pw_group_weight (G) (group)))) (PreH20 : (w0 = (pw_tile_weight (G) (group) (tile)))) (PreH21 : (bias = (pw_bias_at (G) (group) ((2 * tile ))))) (PreH22 : (packed_weights = (pw_tile_output (G) (group) (tile)))) ,
  (pw_data F )
  **  (pw_output W (pw_odd_run (kc) (F) (w0) ((packed_weights + (2 * sizeof(UINT)))) ((pw_header_run (F) ((pw_bias_at (G) (group) ((2 * tile )))) ((pw_tile_output (G) (group) (tile))) (1) ((pw_tile_state (F) (G) (O) (group) (tile)))))) )
|--
  “ ((bias + (1 * sizeof(UINT))) = (pw_bias_at (G) ((group + 1 )) (0))) ”
.

Definition test_rvv_entail_wit_4_1_split_goal_3 := 
forall (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (packed_weights: Z) (bias: Z) (w0: Z) (weights: Z) (n: Z) (tile: Z) (group: Z) (sr: Z) (kr: Z) (nr: Z) (extra_bytes: Z) (kc: Z) (nc: Z) (g: Z) (PreH1 : (bias <> 0)) (PreH2 : (n <> 0)) (PreH3 : (n < 2)) (PreH4 : (g = (pw_groups (G)))) (PreH5 : (nc = (pw_channels (G)))) (PreH6 : (kc = (pw_depth (G)))) (PreH7 : (extra_bytes = (pw_extra_bytes (G)))) (PreH8 : (nr = 2)) (PreH9 : (kr = 1)) (PreH10 : (sr = 1)) (PreH11 : (pw_program_storage F W G )) (PreH12 : (0 <= group)) (PreH13 : (group < g)) (PreH14 : (0 <= tile)) (PreH15 : (tile <= (pw_tiles (G)))) (PreH16 : (n = (nc - (2 * tile ) ))) (PreH17 : (0 <= n)) (PreH18 : (n <= nc)) (PreH19 : (weights = (pw_group_weight (G) (group)))) (PreH20 : (w0 = (pw_tile_weight (G) (group) (tile)))) (PreH21 : (bias = (pw_bias_at (G) (group) ((2 * tile ))))) (PreH22 : (packed_weights = (pw_tile_output (G) (group) (tile)))) ,
  (pw_data F )
  **  (pw_output W (pw_odd_run (kc) (F) (w0) ((packed_weights + (2 * sizeof(UINT)))) ((pw_header_run (F) ((pw_bias_at (G) (group) ((2 * tile )))) ((pw_tile_output (G) (group) (tile))) (1) ((pw_tile_state (F) (G) (O) (group) (tile)))))) )
|--
  “ ((weights + ((unsigned_last_nbits ((nc * kc )) (64)) * sizeof(UINT))) = (pw_group_weight (G) ((group + 1 )))) ”
.

Definition test_rvv_entail_wit_4_1_split_goal_spatial := 
forall (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (packed_weights: Z) (bias: Z) (w0: Z) (weights: Z) (n: Z) (tile: Z) (group: Z) (sr: Z) (kr: Z) (nr: Z) (extra_bytes: Z) (kc: Z) (nc: Z) (g: Z) (PreH1 : (bias <> 0)) (PreH2 : (n <> 0)) (PreH3 : (n < 2)) (PreH4 : (g = (pw_groups (G)))) (PreH5 : (nc = (pw_channels (G)))) (PreH6 : (kc = (pw_depth (G)))) (PreH7 : (extra_bytes = (pw_extra_bytes (G)))) (PreH8 : (nr = 2)) (PreH9 : (kr = 1)) (PreH10 : (sr = 1)) (PreH11 : (pw_program_storage F W G )) (PreH12 : (0 <= group)) (PreH13 : (group < g)) (PreH14 : (0 <= tile)) (PreH15 : (tile <= (pw_tiles (G)))) (PreH16 : (n = (nc - (2 * tile ) ))) (PreH17 : (0 <= n)) (PreH18 : (n <= nc)) (PreH19 : (weights = (pw_group_weight (G) (group)))) (PreH20 : (w0 = (pw_tile_weight (G) (group) (tile)))) (PreH21 : (bias = (pw_bias_at (G) (group) ((2 * tile ))))) (PreH22 : (packed_weights = (pw_tile_output (G) (group) (tile)))) ,
  (pw_data F )
  **  (pw_output W (pw_odd_run (kc) (F) (w0) ((packed_weights + (2 * sizeof(UINT)))) ((pw_header_run (F) ((pw_bias_at (G) (group) ((2 * tile )))) ((pw_tile_output (G) (group) (tile))) (1) ((pw_tile_state (F) (G) (O) (group) (tile)))))) )
|--
  (pw_data F )
  **  (pw_output W (pw_group_state (F) (G) (O) ((group + 1 ))) )
.

Definition test_rvv_entail_wit_4_2 := 
(
forall (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (packed_weights: Z) (bias: Z) (w0: Z) (weights: Z) (n: Z) (tile: Z) (group: Z) (sr: Z) (kr: Z) (nr: Z) (extra_bytes: Z) (kc: Z) (nc: Z) (g: Z) (PreH1 : (bias = 0)) (PreH2 : (n <> 0)) (PreH3 : (n < 2)) (PreH4 : (g = (pw_groups (G)))) (PreH5 : (nc = (pw_channels (G)))) (PreH6 : (kc = (pw_depth (G)))) (PreH7 : (extra_bytes = (pw_extra_bytes (G)))) (PreH8 : (nr = 2)) (PreH9 : (kr = 1)) (PreH10 : (sr = 1)) (PreH11 : (pw_program_storage F W G )) (PreH12 : (0 <= group)) (PreH13 : (group < g)) (PreH14 : (0 <= tile)) (PreH15 : (tile <= (pw_tiles (G)))) (PreH16 : (n = (nc - (2 * tile ) ))) (PreH17 : (0 <= n)) (PreH18 : (n <= nc)) (PreH19 : (weights = (pw_group_weight (G) (group)))) (PreH20 : (w0 = (pw_tile_weight (G) (group) (tile)))) (PreH21 : (bias = (pw_bias_at (G) (group) ((2 * tile ))))) (PreH22 : (packed_weights = (pw_tile_output (G) (group) (tile)))) ,
  (pw_data F )
  **  (pw_output W (pw_odd_run (kc) (F) (w0) ((packed_weights + (2 * sizeof(UINT)))) ((pw_header_run (F) (0) ((pw_tile_output (G) (group) (tile))) (1) ((pw_tile_state (F) (G) (O) (group) (tile)))))) )
|--
  “ (g = (pw_groups (G))) ” 
  &&  “ (nc = (pw_channels (G))) ” 
  &&  “ (kc = (pw_depth (G))) ” 
  &&  “ (extra_bytes = (pw_extra_bytes (G))) ” 
  &&  “ (nr = 2) ” 
  &&  “ (kr = 1) ” 
  &&  “ (sr = 1) ” 
  &&  “ (pw_program_storage F W G ) ” 
  &&  “ (0 <= (group + 1 )) ” 
  &&  “ ((group + 1 ) <= g) ” 
  &&  “ ((weights + ((unsigned_last_nbits ((nc * kc )) (64)) * sizeof(UINT))) = (pw_group_weight (G) ((group + 1 )))) ” 
  &&  “ (bias = (pw_bias_at (G) ((group + 1 )) (0))) ” 
  &&  “ ((unsigned_last_nbits (((unsigned_last_nbits ((packed_weights + ((2 + (unsigned_last_nbits ((2 * kc )) (64)) ) * sizeof(UINT)))) (64)) + extra_bytes )) (64)) = (pw_tile_output (G) ((group + 1 )) (0))) ”
  &&  (pw_data F )
  **  (pw_output W (pw_group_state (F) (G) (O) ((group + 1 ))) )
) \/
(
forall (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (packed_weights: Z) (bias: Z) (w0: Z) (weights: Z) (n: Z) (tile: Z) (group: Z) (sr: Z) (kr: Z) (nr: Z) (extra_bytes: Z) (kc: Z) (nc: Z) (g: Z) (PreH1 : (bias = 0)) (PreH2 : (n <> 0)) (PreH3 : (n < 2)) (PreH4 : (g = (pw_groups (G)))) (PreH5 : (nc = (pw_channels (G)))) (PreH6 : (kc = (pw_depth (G)))) (PreH7 : (extra_bytes = (pw_extra_bytes (G)))) (PreH8 : (nr = 2)) (PreH9 : (kr = 1)) (PreH10 : (sr = 1)) (PreH11 : (pw_program_storage F W G )) (PreH12 : (0 <= group)) (PreH13 : (group < g)) (PreH14 : (0 <= tile)) (PreH15 : (tile <= (pw_tiles (G)))) (PreH16 : (n = (nc - (2 * tile ) ))) (PreH17 : (0 <= n)) (PreH18 : (n <= nc)) (PreH19 : (weights = (pw_group_weight (G) (group)))) (PreH20 : (w0 = (pw_tile_weight (G) (group) (tile)))) (PreH21 : (bias = (pw_bias_at (G) (group) ((2 * tile ))))) (PreH22 : (packed_weights = (pw_tile_output (G) (group) (tile)))) ,
  (pw_data F )
  **  (pw_output W (pw_odd_run (kc) (F) (w0) ((packed_weights + (2 * sizeof(UINT)))) ((pw_header_run (F) (0) ((pw_tile_output (G) (group) (tile))) (1) ((pw_tile_state (F) (G) (O) (group) (tile)))))) )
|--
  “ ((unsigned_last_nbits (((unsigned_last_nbits ((packed_weights + ((2 + (unsigned_last_nbits ((2 * kc )) (64)) ) * sizeof(UINT)))) (64)) + extra_bytes )) (64)) = (pw_tile_output (G) ((group + 1 )) (0))) ” 
  &&  “ (0 = (pw_bias_at (G) ((group + 1 )) (0))) ” 
  &&  “ ((weights + ((unsigned_last_nbits ((nc * kc )) (64)) * sizeof(UINT))) = (pw_group_weight (G) ((group + 1 )))) ”
  &&  (pw_data F )
  **  (pw_output W (pw_group_state (F) (G) (O) ((group + 1 ))) )
).

Definition test_rvv_entail_wit_4_2_split_goal_1 := 
forall (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (packed_weights: Z) (bias: Z) (w0: Z) (weights: Z) (n: Z) (tile: Z) (group: Z) (sr: Z) (kr: Z) (nr: Z) (extra_bytes: Z) (kc: Z) (nc: Z) (g: Z) (PreH1 : (bias = 0)) (PreH2 : (n <> 0)) (PreH3 : (n < 2)) (PreH4 : (g = (pw_groups (G)))) (PreH5 : (nc = (pw_channels (G)))) (PreH6 : (kc = (pw_depth (G)))) (PreH7 : (extra_bytes = (pw_extra_bytes (G)))) (PreH8 : (nr = 2)) (PreH9 : (kr = 1)) (PreH10 : (sr = 1)) (PreH11 : (pw_program_storage F W G )) (PreH12 : (0 <= group)) (PreH13 : (group < g)) (PreH14 : (0 <= tile)) (PreH15 : (tile <= (pw_tiles (G)))) (PreH16 : (n = (nc - (2 * tile ) ))) (PreH17 : (0 <= n)) (PreH18 : (n <= nc)) (PreH19 : (weights = (pw_group_weight (G) (group)))) (PreH20 : (w0 = (pw_tile_weight (G) (group) (tile)))) (PreH21 : (bias = (pw_bias_at (G) (group) ((2 * tile ))))) (PreH22 : (packed_weights = (pw_tile_output (G) (group) (tile)))) ,
  (pw_data F )
  **  (pw_output W (pw_odd_run (kc) (F) (w0) ((packed_weights + (2 * sizeof(UINT)))) ((pw_header_run (F) (0) ((pw_tile_output (G) (group) (tile))) (1) ((pw_tile_state (F) (G) (O) (group) (tile)))))) )
|--
  “ ((unsigned_last_nbits (((unsigned_last_nbits ((packed_weights + ((2 + (unsigned_last_nbits ((2 * kc )) (64)) ) * sizeof(UINT)))) (64)) + extra_bytes )) (64)) = (pw_tile_output (G) ((group + 1 )) (0))) ”
.

Definition test_rvv_entail_wit_4_2_split_goal_2 := 
forall (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (packed_weights: Z) (bias: Z) (w0: Z) (weights: Z) (n: Z) (tile: Z) (group: Z) (sr: Z) (kr: Z) (nr: Z) (extra_bytes: Z) (kc: Z) (nc: Z) (g: Z) (PreH1 : (bias = 0)) (PreH2 : (n <> 0)) (PreH3 : (n < 2)) (PreH4 : (g = (pw_groups (G)))) (PreH5 : (nc = (pw_channels (G)))) (PreH6 : (kc = (pw_depth (G)))) (PreH7 : (extra_bytes = (pw_extra_bytes (G)))) (PreH8 : (nr = 2)) (PreH9 : (kr = 1)) (PreH10 : (sr = 1)) (PreH11 : (pw_program_storage F W G )) (PreH12 : (0 <= group)) (PreH13 : (group < g)) (PreH14 : (0 <= tile)) (PreH15 : (tile <= (pw_tiles (G)))) (PreH16 : (n = (nc - (2 * tile ) ))) (PreH17 : (0 <= n)) (PreH18 : (n <= nc)) (PreH19 : (weights = (pw_group_weight (G) (group)))) (PreH20 : (w0 = (pw_tile_weight (G) (group) (tile)))) (PreH21 : (bias = (pw_bias_at (G) (group) ((2 * tile ))))) (PreH22 : (packed_weights = (pw_tile_output (G) (group) (tile)))) ,
  (pw_data F )
  **  (pw_output W (pw_odd_run (kc) (F) (w0) ((packed_weights + (2 * sizeof(UINT)))) ((pw_header_run (F) (0) ((pw_tile_output (G) (group) (tile))) (1) ((pw_tile_state (F) (G) (O) (group) (tile)))))) )
|--
  “ (0 = (pw_bias_at (G) ((group + 1 )) (0))) ”
.

Definition test_rvv_entail_wit_4_2_split_goal_3 := 
forall (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (packed_weights: Z) (bias: Z) (w0: Z) (weights: Z) (n: Z) (tile: Z) (group: Z) (sr: Z) (kr: Z) (nr: Z) (extra_bytes: Z) (kc: Z) (nc: Z) (g: Z) (PreH1 : (bias = 0)) (PreH2 : (n <> 0)) (PreH3 : (n < 2)) (PreH4 : (g = (pw_groups (G)))) (PreH5 : (nc = (pw_channels (G)))) (PreH6 : (kc = (pw_depth (G)))) (PreH7 : (extra_bytes = (pw_extra_bytes (G)))) (PreH8 : (nr = 2)) (PreH9 : (kr = 1)) (PreH10 : (sr = 1)) (PreH11 : (pw_program_storage F W G )) (PreH12 : (0 <= group)) (PreH13 : (group < g)) (PreH14 : (0 <= tile)) (PreH15 : (tile <= (pw_tiles (G)))) (PreH16 : (n = (nc - (2 * tile ) ))) (PreH17 : (0 <= n)) (PreH18 : (n <= nc)) (PreH19 : (weights = (pw_group_weight (G) (group)))) (PreH20 : (w0 = (pw_tile_weight (G) (group) (tile)))) (PreH21 : (bias = (pw_bias_at (G) (group) ((2 * tile ))))) (PreH22 : (packed_weights = (pw_tile_output (G) (group) (tile)))) ,
  (pw_data F )
  **  (pw_output W (pw_odd_run (kc) (F) (w0) ((packed_weights + (2 * sizeof(UINT)))) ((pw_header_run (F) (0) ((pw_tile_output (G) (group) (tile))) (1) ((pw_tile_state (F) (G) (O) (group) (tile)))))) )
|--
  “ ((weights + ((unsigned_last_nbits ((nc * kc )) (64)) * sizeof(UINT))) = (pw_group_weight (G) ((group + 1 )))) ”
.

Definition test_rvv_entail_wit_4_2_split_goal_spatial := 
forall (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (packed_weights: Z) (bias: Z) (w0: Z) (weights: Z) (n: Z) (tile: Z) (group: Z) (sr: Z) (kr: Z) (nr: Z) (extra_bytes: Z) (kc: Z) (nc: Z) (g: Z) (PreH1 : (bias = 0)) (PreH2 : (n <> 0)) (PreH3 : (n < 2)) (PreH4 : (g = (pw_groups (G)))) (PreH5 : (nc = (pw_channels (G)))) (PreH6 : (kc = (pw_depth (G)))) (PreH7 : (extra_bytes = (pw_extra_bytes (G)))) (PreH8 : (nr = 2)) (PreH9 : (kr = 1)) (PreH10 : (sr = 1)) (PreH11 : (pw_program_storage F W G )) (PreH12 : (0 <= group)) (PreH13 : (group < g)) (PreH14 : (0 <= tile)) (PreH15 : (tile <= (pw_tiles (G)))) (PreH16 : (n = (nc - (2 * tile ) ))) (PreH17 : (0 <= n)) (PreH18 : (n <= nc)) (PreH19 : (weights = (pw_group_weight (G) (group)))) (PreH20 : (w0 = (pw_tile_weight (G) (group) (tile)))) (PreH21 : (bias = (pw_bias_at (G) (group) ((2 * tile ))))) (PreH22 : (packed_weights = (pw_tile_output (G) (group) (tile)))) ,
  (pw_data F )
  **  (pw_output W (pw_odd_run (kc) (F) (w0) ((packed_weights + (2 * sizeof(UINT)))) ((pw_header_run (F) (0) ((pw_tile_output (G) (group) (tile))) (1) ((pw_tile_state (F) (G) (O) (group) (tile)))))) )
|--
  (pw_data F )
  **  (pw_output W (pw_group_state (F) (G) (O) ((group + 1 ))) )
.

Definition test_rvv_entail_wit_4_3 := 
(
forall (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (packed_weights: Z) (bias: Z) (w0: Z) (weights: Z) (n: Z) (tile: Z) (group: Z) (sr: Z) (kr: Z) (nr: Z) (extra_bytes: Z) (kc: Z) (nc: Z) (g: Z) (PreH1 : (n = 0)) (PreH2 : (n < 2)) (PreH3 : (g = (pw_groups (G)))) (PreH4 : (nc = (pw_channels (G)))) (PreH5 : (kc = (pw_depth (G)))) (PreH6 : (extra_bytes = (pw_extra_bytes (G)))) (PreH7 : (nr = 2)) (PreH8 : (kr = 1)) (PreH9 : (sr = 1)) (PreH10 : (pw_program_storage F W G )) (PreH11 : (0 <= group)) (PreH12 : (group < g)) (PreH13 : (0 <= tile)) (PreH14 : (tile <= (pw_tiles (G)))) (PreH15 : (n = (nc - (2 * tile ) ))) (PreH16 : (0 <= n)) (PreH17 : (n <= nc)) (PreH18 : (weights = (pw_group_weight (G) (group)))) (PreH19 : (w0 = (pw_tile_weight (G) (group) (tile)))) (PreH20 : (bias = (pw_bias_at (G) (group) ((2 * tile ))))) (PreH21 : (packed_weights = (pw_tile_output (G) (group) (tile)))) ,
  (pw_data F )
  **  (pw_output W (pw_tile_state (F) (G) (O) (group) (tile)) )
|--
  “ (g = (pw_groups (G))) ” 
  &&  “ (nc = (pw_channels (G))) ” 
  &&  “ (kc = (pw_depth (G))) ” 
  &&  “ (extra_bytes = (pw_extra_bytes (G))) ” 
  &&  “ (nr = 2) ” 
  &&  “ (kr = 1) ” 
  &&  “ (sr = 1) ” 
  &&  “ (pw_program_storage F W G ) ” 
  &&  “ (0 <= (group + 1 )) ” 
  &&  “ ((group + 1 ) <= g) ” 
  &&  “ ((weights + ((unsigned_last_nbits ((nc * kc )) (64)) * sizeof(UINT))) = (pw_group_weight (G) ((group + 1 )))) ” 
  &&  “ (bias = (pw_bias_at (G) ((group + 1 )) (0))) ” 
  &&  “ (packed_weights = (pw_tile_output (G) ((group + 1 )) (0))) ”
  &&  (pw_data F )
  **  (pw_output W (pw_group_state (F) (G) (O) ((group + 1 ))) )
) \/
(
forall (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (packed_weights: Z) (bias: Z) (w0: Z) (weights: Z) (n: Z) (tile: Z) (group: Z) (sr: Z) (kr: Z) (nr: Z) (extra_bytes: Z) (kc: Z) (nc: Z) (g: Z) (PreH1 : (n = 0)) (PreH2 : (n < 2)) (PreH3 : (g = (pw_groups (G)))) (PreH4 : (nc = (pw_channels (G)))) (PreH5 : (kc = (pw_depth (G)))) (PreH6 : (extra_bytes = (pw_extra_bytes (G)))) (PreH7 : (nr = 2)) (PreH8 : (kr = 1)) (PreH9 : (sr = 1)) (PreH10 : (pw_program_storage F W G )) (PreH11 : (0 <= group)) (PreH12 : (group < g)) (PreH13 : (0 <= tile)) (PreH14 : (tile <= (pw_tiles (G)))) (PreH15 : (n = (nc - (2 * tile ) ))) (PreH16 : (0 <= n)) (PreH17 : (n <= nc)) (PreH18 : (weights = (pw_group_weight (G) (group)))) (PreH19 : (w0 = (pw_tile_weight (G) (group) (tile)))) (PreH20 : (bias = (pw_bias_at (G) (group) ((2 * tile ))))) (PreH21 : (packed_weights = (pw_tile_output (G) (group) (tile)))) ,
  (pw_data F )
  **  (pw_output W (pw_tile_state (F) (G) (O) (group) (tile)) )
|--
  “ (packed_weights = (pw_tile_output (G) ((group + 1 )) (0))) ” 
  &&  “ (bias = (pw_bias_at (G) ((group + 1 )) (0))) ” 
  &&  “ ((weights + ((unsigned_last_nbits ((nc * kc )) (64)) * sizeof(UINT))) = (pw_group_weight (G) ((group + 1 )))) ”
  &&  (pw_data F )
  **  (pw_output W (pw_group_state (F) (G) (O) ((group + 1 ))) )
).

Definition test_rvv_entail_wit_4_3_split_goal_1 := 
forall (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (packed_weights: Z) (bias: Z) (w0: Z) (weights: Z) (n: Z) (tile: Z) (group: Z) (sr: Z) (kr: Z) (nr: Z) (extra_bytes: Z) (kc: Z) (nc: Z) (g: Z) (PreH1 : (n = 0)) (PreH2 : (n < 2)) (PreH3 : (g = (pw_groups (G)))) (PreH4 : (nc = (pw_channels (G)))) (PreH5 : (kc = (pw_depth (G)))) (PreH6 : (extra_bytes = (pw_extra_bytes (G)))) (PreH7 : (nr = 2)) (PreH8 : (kr = 1)) (PreH9 : (sr = 1)) (PreH10 : (pw_program_storage F W G )) (PreH11 : (0 <= group)) (PreH12 : (group < g)) (PreH13 : (0 <= tile)) (PreH14 : (tile <= (pw_tiles (G)))) (PreH15 : (n = (nc - (2 * tile ) ))) (PreH16 : (0 <= n)) (PreH17 : (n <= nc)) (PreH18 : (weights = (pw_group_weight (G) (group)))) (PreH19 : (w0 = (pw_tile_weight (G) (group) (tile)))) (PreH20 : (bias = (pw_bias_at (G) (group) ((2 * tile ))))) (PreH21 : (packed_weights = (pw_tile_output (G) (group) (tile)))) ,
  (pw_data F )
  **  (pw_output W (pw_tile_state (F) (G) (O) (group) (tile)) )
|--
  “ (packed_weights = (pw_tile_output (G) ((group + 1 )) (0))) ”
.

Definition test_rvv_entail_wit_4_3_split_goal_2 := 
forall (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (packed_weights: Z) (bias: Z) (w0: Z) (weights: Z) (n: Z) (tile: Z) (group: Z) (sr: Z) (kr: Z) (nr: Z) (extra_bytes: Z) (kc: Z) (nc: Z) (g: Z) (PreH1 : (n = 0)) (PreH2 : (n < 2)) (PreH3 : (g = (pw_groups (G)))) (PreH4 : (nc = (pw_channels (G)))) (PreH5 : (kc = (pw_depth (G)))) (PreH6 : (extra_bytes = (pw_extra_bytes (G)))) (PreH7 : (nr = 2)) (PreH8 : (kr = 1)) (PreH9 : (sr = 1)) (PreH10 : (pw_program_storage F W G )) (PreH11 : (0 <= group)) (PreH12 : (group < g)) (PreH13 : (0 <= tile)) (PreH14 : (tile <= (pw_tiles (G)))) (PreH15 : (n = (nc - (2 * tile ) ))) (PreH16 : (0 <= n)) (PreH17 : (n <= nc)) (PreH18 : (weights = (pw_group_weight (G) (group)))) (PreH19 : (w0 = (pw_tile_weight (G) (group) (tile)))) (PreH20 : (bias = (pw_bias_at (G) (group) ((2 * tile ))))) (PreH21 : (packed_weights = (pw_tile_output (G) (group) (tile)))) ,
  (pw_data F )
  **  (pw_output W (pw_tile_state (F) (G) (O) (group) (tile)) )
|--
  “ (bias = (pw_bias_at (G) ((group + 1 )) (0))) ”
.

Definition test_rvv_entail_wit_4_3_split_goal_3 := 
forall (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (packed_weights: Z) (bias: Z) (w0: Z) (weights: Z) (n: Z) (tile: Z) (group: Z) (sr: Z) (kr: Z) (nr: Z) (extra_bytes: Z) (kc: Z) (nc: Z) (g: Z) (PreH1 : (n = 0)) (PreH2 : (n < 2)) (PreH3 : (g = (pw_groups (G)))) (PreH4 : (nc = (pw_channels (G)))) (PreH5 : (kc = (pw_depth (G)))) (PreH6 : (extra_bytes = (pw_extra_bytes (G)))) (PreH7 : (nr = 2)) (PreH8 : (kr = 1)) (PreH9 : (sr = 1)) (PreH10 : (pw_program_storage F W G )) (PreH11 : (0 <= group)) (PreH12 : (group < g)) (PreH13 : (0 <= tile)) (PreH14 : (tile <= (pw_tiles (G)))) (PreH15 : (n = (nc - (2 * tile ) ))) (PreH16 : (0 <= n)) (PreH17 : (n <= nc)) (PreH18 : (weights = (pw_group_weight (G) (group)))) (PreH19 : (w0 = (pw_tile_weight (G) (group) (tile)))) (PreH20 : (bias = (pw_bias_at (G) (group) ((2 * tile ))))) (PreH21 : (packed_weights = (pw_tile_output (G) (group) (tile)))) ,
  (pw_data F )
  **  (pw_output W (pw_tile_state (F) (G) (O) (group) (tile)) )
|--
  “ ((weights + ((unsigned_last_nbits ((nc * kc )) (64)) * sizeof(UINT))) = (pw_group_weight (G) ((group + 1 )))) ”
.

Definition test_rvv_entail_wit_4_3_split_goal_spatial := 
forall (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (packed_weights: Z) (bias: Z) (w0: Z) (weights: Z) (n: Z) (tile: Z) (group: Z) (sr: Z) (kr: Z) (nr: Z) (extra_bytes: Z) (kc: Z) (nc: Z) (g: Z) (PreH1 : (n = 0)) (PreH2 : (n < 2)) (PreH3 : (g = (pw_groups (G)))) (PreH4 : (nc = (pw_channels (G)))) (PreH5 : (kc = (pw_depth (G)))) (PreH6 : (extra_bytes = (pw_extra_bytes (G)))) (PreH7 : (nr = 2)) (PreH8 : (kr = 1)) (PreH9 : (sr = 1)) (PreH10 : (pw_program_storage F W G )) (PreH11 : (0 <= group)) (PreH12 : (group < g)) (PreH13 : (0 <= tile)) (PreH14 : (tile <= (pw_tiles (G)))) (PreH15 : (n = (nc - (2 * tile ) ))) (PreH16 : (0 <= n)) (PreH17 : (n <= nc)) (PreH18 : (weights = (pw_group_weight (G) (group)))) (PreH19 : (w0 = (pw_tile_weight (G) (group) (tile)))) (PreH20 : (bias = (pw_bias_at (G) (group) ((2 * tile ))))) (PreH21 : (packed_weights = (pw_tile_output (G) (group) (tile)))) ,
  (pw_data F )
  **  (pw_output W (pw_tile_state (F) (G) (O) (group) (tile)) )
|--
  (pw_data F )
  **  (pw_output W (pw_group_state (F) (G) (O) ((group + 1 ))) )
.

Definition test_rvv_return_wit_1 := 
(
forall (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (packed_weights: Z) (bias: Z) (weights: Z) (group: Z) (sr: Z) (kr: Z) (nr: Z) (extra_bytes: Z) (kc: Z) (nc: Z) (g: Z) (PreH1 : (group >= g)) (PreH2 : (g = (pw_groups (G)))) (PreH3 : (nc = (pw_channels (G)))) (PreH4 : (kc = (pw_depth (G)))) (PreH5 : (extra_bytes = (pw_extra_bytes (G)))) (PreH6 : (nr = 2)) (PreH7 : (kr = 1)) (PreH8 : (sr = 1)) (PreH9 : (pw_program_storage F W G )) (PreH10 : (0 <= group)) (PreH11 : (group <= g)) (PreH12 : (weights = (pw_group_weight (G) (group)))) (PreH13 : (bias = (pw_bias_at (G) (group) (0)))) (PreH14 : (packed_weights = (pw_tile_output (G) (group) (0)))) ,
  (pw_data F )
  **  (pw_output W (pw_group_state (F) (G) (O) (group)) )
|--
  (pw_data F )
  **  (pw_output W (pw_program (F) (G) (O)) )
) \/
(
forall (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (packed_weights: Z) (bias: Z) (weights: Z) (group: Z) (sr: Z) (kr: Z) (nr: Z) (extra_bytes: Z) (kc: Z) (nc: Z) (g: Z) (PreH1 : (group >= g)) (PreH2 : (g = (pw_groups (G)))) (PreH3 : (nc = (pw_channels (G)))) (PreH4 : (kc = (pw_depth (G)))) (PreH5 : (extra_bytes = (pw_extra_bytes (G)))) (PreH6 : (nr = 2)) (PreH7 : (kr = 1)) (PreH8 : (sr = 1)) (PreH9 : (pw_program_storage F W G )) (PreH10 : (0 <= group)) (PreH11 : (group <= g)) (PreH12 : (weights = (pw_group_weight (G) (group)))) (PreH13 : (bias = (pw_bias_at (G) (group) (0)))) (PreH14 : (packed_weights = (pw_tile_output (G) (group) (0)))) ,
  (pw_data F )
  **  (pw_output W (pw_group_state (F) (G) (O) (group)) )
|--
  (pw_data F )
  **  (pw_output W (pw_program (F) (G) (O)) )
).

Definition test_rvv_return_wit_1_split_goal_spatial := 
forall (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (packed_weights: Z) (bias: Z) (weights: Z) (group: Z) (sr: Z) (kr: Z) (nr: Z) (extra_bytes: Z) (kc: Z) (nc: Z) (g: Z) (PreH1 : (group >= g)) (PreH2 : (g = (pw_groups (G)))) (PreH3 : (nc = (pw_channels (G)))) (PreH4 : (kc = (pw_depth (G)))) (PreH5 : (extra_bytes = (pw_extra_bytes (G)))) (PreH6 : (nr = 2)) (PreH7 : (kr = 1)) (PreH8 : (sr = 1)) (PreH9 : (pw_program_storage F W G )) (PreH10 : (0 <= group)) (PreH11 : (group <= g)) (PreH12 : (weights = (pw_group_weight (G) (group)))) (PreH13 : (bias = (pw_bias_at (G) (group) (0)))) (PreH14 : (packed_weights = (pw_tile_output (G) (group) (0)))) ,
  (pw_data F )
  **  (pw_output W (pw_group_state (F) (G) (O) (group)) )
|--
  (pw_data F )
  **  (pw_output W (pw_program (F) (G) (O)) )
.

Definition test_rvv_partial_solve_wit_1_pure := 
forall (params_pre: Z) (extra_bytes_pre: Z) (packed_weights_pre: Z) (scale_pre: Z) (bias_pre: Z) (weights_pre: Z) (sr_pre: Z) (kr_pre: Z) (nr_pre: Z) (kc_pre: Z) (nc_pre: Z) (g_pre: Z) (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (PreH1 : (g_pre <> 0)) (PreH2 : (g_pre > 0)) (PreH3 : (nc_pre > 0)) (PreH4 : (kc_pre > 0)) (PreH5 : (weights_pre > 0)) (PreH6 : (packed_weights_pre > 0)) (PreH7 : (g_pre = (pw_groups (G)))) (PreH8 : (nc_pre = (pw_channels (G)))) (PreH9 : (kc_pre = (pw_depth (G)))) (PreH10 : (extra_bytes_pre = (pw_extra_bytes (G)))) (PreH11 : (nr_pre = 2)) (PreH12 : (kr_pre = 1)) (PreH13 : (sr_pre = 1)) (PreH14 : (pw_program_storage F W G )) (PreH15 : (weights_pre = (pw_weights (G)))) (PreH16 : (bias_pre = (pw_bias (G)))) (PreH17 : (packed_weights_pre = (pw_output_base (G)))) ,
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
  **  (pw_data F )
  **  (pw_output W O )
|--
  “ (1 <> 0) ”
.

Definition test_rvv_partial_solve_wit_1_aux := 
forall (extra_bytes_pre: Z) (packed_weights_pre: Z) (bias_pre: Z) (weights_pre: Z) (sr_pre: Z) (kr_pre: Z) (nr_pre: Z) (kc_pre: Z) (nc_pre: Z) (g_pre: Z) (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (PreH1 : (g_pre <> 0)) (PreH2 : (g_pre > 0)) (PreH3 : (nc_pre > 0)) (PreH4 : (kc_pre > 0)) (PreH5 : (weights_pre > 0)) (PreH6 : (packed_weights_pre > 0)) (PreH7 : (g_pre = (pw_groups (G)))) (PreH8 : (nc_pre = (pw_channels (G)))) (PreH9 : (kc_pre = (pw_depth (G)))) (PreH10 : (extra_bytes_pre = (pw_extra_bytes (G)))) (PreH11 : (nr_pre = 2)) (PreH12 : (kr_pre = 1)) (PreH13 : (sr_pre = 1)) (PreH14 : (pw_program_storage F W G )) (PreH15 : (weights_pre = (pw_weights (G)))) (PreH16 : (bias_pre = (pw_bias (G)))) (PreH17 : (packed_weights_pre = (pw_output_base (G)))) ,
  (pw_data F )
  **  (pw_output W O )
|--
  “ (1 <> 0) ” 
  &&  “ (g_pre <> 0) ” 
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
  &&  (pw_data F )
  **  (pw_output W O )
.

Definition test_rvv_partial_solve_wit_1 := test_rvv_partial_solve_wit_1_pure -> test_rvv_partial_solve_wit_1_aux.

Definition test_rvv_partial_solve_wit_2_pure := 
forall (params_pre: Z) (extra_bytes_pre: Z) (packed_weights_pre: Z) (scale_pre: Z) (bias_pre: Z) (weights_pre: Z) (sr_pre: Z) (kr_pre: Z) (nr_pre: Z) (kc_pre: Z) (nc_pre: Z) (g_pre: Z) (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (PreH1 : (nc_pre <> 0)) (PreH2 : (g_pre <> 0)) (PreH3 : (g_pre > 0)) (PreH4 : (nc_pre > 0)) (PreH5 : (kc_pre > 0)) (PreH6 : (weights_pre > 0)) (PreH7 : (packed_weights_pre > 0)) (PreH8 : (g_pre = (pw_groups (G)))) (PreH9 : (nc_pre = (pw_channels (G)))) (PreH10 : (kc_pre = (pw_depth (G)))) (PreH11 : (extra_bytes_pre = (pw_extra_bytes (G)))) (PreH12 : (nr_pre = 2)) (PreH13 : (kr_pre = 1)) (PreH14 : (sr_pre = 1)) (PreH15 : (pw_program_storage F W G )) (PreH16 : (weights_pre = (pw_weights (G)))) (PreH17 : (bias_pre = (pw_bias (G)))) (PreH18 : (packed_weights_pre = (pw_output_base (G)))) ,
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
  **  (pw_data F )
  **  (pw_output W O )
|--
  “ (1 <> 0) ”
.

Definition test_rvv_partial_solve_wit_2_aux := 
forall (extra_bytes_pre: Z) (packed_weights_pre: Z) (bias_pre: Z) (weights_pre: Z) (sr_pre: Z) (kr_pre: Z) (nr_pre: Z) (kc_pre: Z) (nc_pre: Z) (g_pre: Z) (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (PreH1 : (nc_pre <> 0)) (PreH2 : (g_pre <> 0)) (PreH3 : (g_pre > 0)) (PreH4 : (nc_pre > 0)) (PreH5 : (kc_pre > 0)) (PreH6 : (weights_pre > 0)) (PreH7 : (packed_weights_pre > 0)) (PreH8 : (g_pre = (pw_groups (G)))) (PreH9 : (nc_pre = (pw_channels (G)))) (PreH10 : (kc_pre = (pw_depth (G)))) (PreH11 : (extra_bytes_pre = (pw_extra_bytes (G)))) (PreH12 : (nr_pre = 2)) (PreH13 : (kr_pre = 1)) (PreH14 : (sr_pre = 1)) (PreH15 : (pw_program_storage F W G )) (PreH16 : (weights_pre = (pw_weights (G)))) (PreH17 : (bias_pre = (pw_bias (G)))) (PreH18 : (packed_weights_pre = (pw_output_base (G)))) ,
  (pw_data F )
  **  (pw_output W O )
|--
  “ (1 <> 0) ” 
  &&  “ (nc_pre <> 0) ” 
  &&  “ (g_pre <> 0) ” 
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
  &&  (pw_data F )
  **  (pw_output W O )
.

Definition test_rvv_partial_solve_wit_2 := test_rvv_partial_solve_wit_2_pure -> test_rvv_partial_solve_wit_2_aux.

Definition test_rvv_partial_solve_wit_3_pure := 
forall (params_pre: Z) (extra_bytes_pre: Z) (packed_weights_pre: Z) (scale_pre: Z) (bias_pre: Z) (weights_pre: Z) (sr_pre: Z) (kr_pre: Z) (nr_pre: Z) (kc_pre: Z) (nc_pre: Z) (g_pre: Z) (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (PreH1 : (kc_pre <> 0)) (PreH2 : (nc_pre <> 0)) (PreH3 : (g_pre <> 0)) (PreH4 : (g_pre > 0)) (PreH5 : (nc_pre > 0)) (PreH6 : (kc_pre > 0)) (PreH7 : (weights_pre > 0)) (PreH8 : (packed_weights_pre > 0)) (PreH9 : (g_pre = (pw_groups (G)))) (PreH10 : (nc_pre = (pw_channels (G)))) (PreH11 : (kc_pre = (pw_depth (G)))) (PreH12 : (extra_bytes_pre = (pw_extra_bytes (G)))) (PreH13 : (nr_pre = 2)) (PreH14 : (kr_pre = 1)) (PreH15 : (sr_pre = 1)) (PreH16 : (pw_program_storage F W G )) (PreH17 : (weights_pre = (pw_weights (G)))) (PreH18 : (bias_pre = (pw_bias (G)))) (PreH19 : (packed_weights_pre = (pw_output_base (G)))) ,
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
  **  (pw_data F )
  **  (pw_output W O )
|--
  “ (1 <> 0) ”
.

Definition test_rvv_partial_solve_wit_3_aux := 
forall (extra_bytes_pre: Z) (packed_weights_pre: Z) (bias_pre: Z) (weights_pre: Z) (sr_pre: Z) (kr_pre: Z) (nr_pre: Z) (kc_pre: Z) (nc_pre: Z) (g_pre: Z) (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (PreH1 : (kc_pre <> 0)) (PreH2 : (nc_pre <> 0)) (PreH3 : (g_pre <> 0)) (PreH4 : (g_pre > 0)) (PreH5 : (nc_pre > 0)) (PreH6 : (kc_pre > 0)) (PreH7 : (weights_pre > 0)) (PreH8 : (packed_weights_pre > 0)) (PreH9 : (g_pre = (pw_groups (G)))) (PreH10 : (nc_pre = (pw_channels (G)))) (PreH11 : (kc_pre = (pw_depth (G)))) (PreH12 : (extra_bytes_pre = (pw_extra_bytes (G)))) (PreH13 : (nr_pre = 2)) (PreH14 : (kr_pre = 1)) (PreH15 : (sr_pre = 1)) (PreH16 : (pw_program_storage F W G )) (PreH17 : (weights_pre = (pw_weights (G)))) (PreH18 : (bias_pre = (pw_bias (G)))) (PreH19 : (packed_weights_pre = (pw_output_base (G)))) ,
  (pw_data F )
  **  (pw_output W O )
|--
  “ (1 <> 0) ” 
  &&  “ (kc_pre <> 0) ” 
  &&  “ (nc_pre <> 0) ” 
  &&  “ (g_pre <> 0) ” 
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
  &&  (pw_data F )
  **  (pw_output W O )
.

Definition test_rvv_partial_solve_wit_3 := test_rvv_partial_solve_wit_3_pure -> test_rvv_partial_solve_wit_3_aux.

Definition test_rvv_partial_solve_wit_4_pure := 
forall (params_pre: Z) (extra_bytes_pre: Z) (packed_weights_pre: Z) (scale_pre: Z) (bias_pre: Z) (weights_pre: Z) (sr_pre: Z) (kr_pre: Z) (nr_pre: Z) (kc_pre: Z) (nc_pre: Z) (g_pre: Z) (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (PreH1 : (nr_pre = 2)) (PreH2 : (kc_pre <> 0)) (PreH3 : (nc_pre <> 0)) (PreH4 : (g_pre <> 0)) (PreH5 : (g_pre > 0)) (PreH6 : (nc_pre > 0)) (PreH7 : (kc_pre > 0)) (PreH8 : (weights_pre > 0)) (PreH9 : (packed_weights_pre > 0)) (PreH10 : (g_pre = (pw_groups (G)))) (PreH11 : (nc_pre = (pw_channels (G)))) (PreH12 : (kc_pre = (pw_depth (G)))) (PreH13 : (extra_bytes_pre = (pw_extra_bytes (G)))) (PreH14 : (nr_pre = 2)) (PreH15 : (kr_pre = 1)) (PreH16 : (sr_pre = 1)) (PreH17 : (pw_program_storage F W G )) (PreH18 : (weights_pre = (pw_weights (G)))) (PreH19 : (bias_pre = (pw_bias (G)))) (PreH20 : (packed_weights_pre = (pw_output_base (G)))) ,
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
  **  (pw_data F )
  **  (pw_output W O )
|--
  “ (1 <> 0) ”
.

Definition test_rvv_partial_solve_wit_4_aux := 
forall (extra_bytes_pre: Z) (packed_weights_pre: Z) (bias_pre: Z) (weights_pre: Z) (sr_pre: Z) (kr_pre: Z) (nr_pre: Z) (kc_pre: Z) (nc_pre: Z) (g_pre: Z) (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (PreH1 : (nr_pre = 2)) (PreH2 : (kc_pre <> 0)) (PreH3 : (nc_pre <> 0)) (PreH4 : (g_pre <> 0)) (PreH5 : (g_pre > 0)) (PreH6 : (nc_pre > 0)) (PreH7 : (kc_pre > 0)) (PreH8 : (weights_pre > 0)) (PreH9 : (packed_weights_pre > 0)) (PreH10 : (g_pre = (pw_groups (G)))) (PreH11 : (nc_pre = (pw_channels (G)))) (PreH12 : (kc_pre = (pw_depth (G)))) (PreH13 : (extra_bytes_pre = (pw_extra_bytes (G)))) (PreH14 : (nr_pre = 2)) (PreH15 : (kr_pre = 1)) (PreH16 : (sr_pre = 1)) (PreH17 : (pw_program_storage F W G )) (PreH18 : (weights_pre = (pw_weights (G)))) (PreH19 : (bias_pre = (pw_bias (G)))) (PreH20 : (packed_weights_pre = (pw_output_base (G)))) ,
  (pw_data F )
  **  (pw_output W O )
|--
  “ (1 <> 0) ” 
  &&  “ (nr_pre = 2) ” 
  &&  “ (kc_pre <> 0) ” 
  &&  “ (nc_pre <> 0) ” 
  &&  “ (g_pre <> 0) ” 
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
  &&  (pw_data F )
  **  (pw_output W O )
.

Definition test_rvv_partial_solve_wit_4 := test_rvv_partial_solve_wit_4_pure -> test_rvv_partial_solve_wit_4_aux.

Definition test_rvv_partial_solve_wit_5_pure := 
forall (params_pre: Z) (extra_bytes_pre: Z) (packed_weights_pre: Z) (scale_pre: Z) (bias_pre: Z) (weights_pre: Z) (sr_pre: Z) (kr_pre: Z) (nr_pre: Z) (kc_pre: Z) (nc_pre: Z) (g_pre: Z) (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (PreH1 : (kr_pre = 1)) (PreH2 : (nr_pre = 2)) (PreH3 : (kc_pre <> 0)) (PreH4 : (nc_pre <> 0)) (PreH5 : (g_pre <> 0)) (PreH6 : (g_pre > 0)) (PreH7 : (nc_pre > 0)) (PreH8 : (kc_pre > 0)) (PreH9 : (weights_pre > 0)) (PreH10 : (packed_weights_pre > 0)) (PreH11 : (g_pre = (pw_groups (G)))) (PreH12 : (nc_pre = (pw_channels (G)))) (PreH13 : (kc_pre = (pw_depth (G)))) (PreH14 : (extra_bytes_pre = (pw_extra_bytes (G)))) (PreH15 : (nr_pre = 2)) (PreH16 : (kr_pre = 1)) (PreH17 : (sr_pre = 1)) (PreH18 : (pw_program_storage F W G )) (PreH19 : (weights_pre = (pw_weights (G)))) (PreH20 : (bias_pre = (pw_bias (G)))) (PreH21 : (packed_weights_pre = (pw_output_base (G)))) ,
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
  **  (pw_data F )
  **  (pw_output W O )
|--
  “ (1 <> 0) ”
.

Definition test_rvv_partial_solve_wit_5_aux := 
forall (extra_bytes_pre: Z) (packed_weights_pre: Z) (bias_pre: Z) (weights_pre: Z) (sr_pre: Z) (kr_pre: Z) (nr_pre: Z) (kc_pre: Z) (nc_pre: Z) (g_pre: Z) (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (PreH1 : (kr_pre = 1)) (PreH2 : (nr_pre = 2)) (PreH3 : (kc_pre <> 0)) (PreH4 : (nc_pre <> 0)) (PreH5 : (g_pre <> 0)) (PreH6 : (g_pre > 0)) (PreH7 : (nc_pre > 0)) (PreH8 : (kc_pre > 0)) (PreH9 : (weights_pre > 0)) (PreH10 : (packed_weights_pre > 0)) (PreH11 : (g_pre = (pw_groups (G)))) (PreH12 : (nc_pre = (pw_channels (G)))) (PreH13 : (kc_pre = (pw_depth (G)))) (PreH14 : (extra_bytes_pre = (pw_extra_bytes (G)))) (PreH15 : (nr_pre = 2)) (PreH16 : (kr_pre = 1)) (PreH17 : (sr_pre = 1)) (PreH18 : (pw_program_storage F W G )) (PreH19 : (weights_pre = (pw_weights (G)))) (PreH20 : (bias_pre = (pw_bias (G)))) (PreH21 : (packed_weights_pre = (pw_output_base (G)))) ,
  (pw_data F )
  **  (pw_output W O )
|--
  “ (1 <> 0) ” 
  &&  “ (kr_pre = 1) ” 
  &&  “ (nr_pre = 2) ” 
  &&  “ (kc_pre <> 0) ” 
  &&  “ (nc_pre <> 0) ” 
  &&  “ (g_pre <> 0) ” 
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
  &&  (pw_data F )
  **  (pw_output W O )
.

Definition test_rvv_partial_solve_wit_5 := test_rvv_partial_solve_wit_5_pure -> test_rvv_partial_solve_wit_5_aux.

Definition test_rvv_partial_solve_wit_6_pure := 
forall (params_pre: Z) (extra_bytes_pre: Z) (packed_weights_pre: Z) (scale_pre: Z) (bias_pre: Z) (weights_pre: Z) (sr_pre: Z) (kr_pre: Z) (nr_pre: Z) (kc_pre: Z) (nc_pre: Z) (g_pre: Z) (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (PreH1 : (sr_pre = 1)) (PreH2 : (kr_pre = 1)) (PreH3 : (nr_pre = 2)) (PreH4 : (kc_pre <> 0)) (PreH5 : (nc_pre <> 0)) (PreH6 : (g_pre <> 0)) (PreH7 : (g_pre > 0)) (PreH8 : (nc_pre > 0)) (PreH9 : (kc_pre > 0)) (PreH10 : (weights_pre > 0)) (PreH11 : (packed_weights_pre > 0)) (PreH12 : (g_pre = (pw_groups (G)))) (PreH13 : (nc_pre = (pw_channels (G)))) (PreH14 : (kc_pre = (pw_depth (G)))) (PreH15 : (extra_bytes_pre = (pw_extra_bytes (G)))) (PreH16 : (nr_pre = 2)) (PreH17 : (kr_pre = 1)) (PreH18 : (sr_pre = 1)) (PreH19 : (pw_program_storage F W G )) (PreH20 : (weights_pre = (pw_weights (G)))) (PreH21 : (bias_pre = (pw_bias (G)))) (PreH22 : (packed_weights_pre = (pw_output_base (G)))) ,
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
  **  (pw_data F )
  **  (pw_output W O )
|--
  “ (1 <> 0) ”
.

Definition test_rvv_partial_solve_wit_6_aux := 
forall (extra_bytes_pre: Z) (packed_weights_pre: Z) (bias_pre: Z) (weights_pre: Z) (sr_pre: Z) (kr_pre: Z) (nr_pre: Z) (kc_pre: Z) (nc_pre: Z) (g_pre: Z) (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (PreH1 : (sr_pre = 1)) (PreH2 : (kr_pre = 1)) (PreH3 : (nr_pre = 2)) (PreH4 : (kc_pre <> 0)) (PreH5 : (nc_pre <> 0)) (PreH6 : (g_pre <> 0)) (PreH7 : (g_pre > 0)) (PreH8 : (nc_pre > 0)) (PreH9 : (kc_pre > 0)) (PreH10 : (weights_pre > 0)) (PreH11 : (packed_weights_pre > 0)) (PreH12 : (g_pre = (pw_groups (G)))) (PreH13 : (nc_pre = (pw_channels (G)))) (PreH14 : (kc_pre = (pw_depth (G)))) (PreH15 : (extra_bytes_pre = (pw_extra_bytes (G)))) (PreH16 : (nr_pre = 2)) (PreH17 : (kr_pre = 1)) (PreH18 : (sr_pre = 1)) (PreH19 : (pw_program_storage F W G )) (PreH20 : (weights_pre = (pw_weights (G)))) (PreH21 : (bias_pre = (pw_bias (G)))) (PreH22 : (packed_weights_pre = (pw_output_base (G)))) ,
  (pw_data F )
  **  (pw_output W O )
|--
  “ (1 <> 0) ” 
  &&  “ (sr_pre = 1) ” 
  &&  “ (kr_pre = 1) ” 
  &&  “ (nr_pre = 2) ” 
  &&  “ (kc_pre <> 0) ” 
  &&  “ (nc_pre <> 0) ” 
  &&  “ (g_pre <> 0) ” 
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
  &&  (pw_data F )
  **  (pw_output W O )
.

Definition test_rvv_partial_solve_wit_6 := test_rvv_partial_solve_wit_6_pure -> test_rvv_partial_solve_wit_6_aux.

Definition test_rvv_partial_solve_wit_7_pure := 
forall (params_pre: Z) (extra_bytes_pre: Z) (packed_weights_pre: Z) (scale_pre: Z) (bias_pre: Z) (weights_pre: Z) (sr_pre: Z) (kr_pre: Z) (nr_pre: Z) (kc_pre: Z) (nc_pre: Z) (g_pre: Z) (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (PreH1 : (weights_pre <> 0)) (PreH2 : (sr_pre = 1)) (PreH3 : (kr_pre = 1)) (PreH4 : (nr_pre = 2)) (PreH5 : (kc_pre <> 0)) (PreH6 : (nc_pre <> 0)) (PreH7 : (g_pre <> 0)) (PreH8 : (g_pre > 0)) (PreH9 : (nc_pre > 0)) (PreH10 : (kc_pre > 0)) (PreH11 : (weights_pre > 0)) (PreH12 : (packed_weights_pre > 0)) (PreH13 : (g_pre = (pw_groups (G)))) (PreH14 : (nc_pre = (pw_channels (G)))) (PreH15 : (kc_pre = (pw_depth (G)))) (PreH16 : (extra_bytes_pre = (pw_extra_bytes (G)))) (PreH17 : (nr_pre = 2)) (PreH18 : (kr_pre = 1)) (PreH19 : (sr_pre = 1)) (PreH20 : (pw_program_storage F W G )) (PreH21 : (weights_pre = (pw_weights (G)))) (PreH22 : (bias_pre = (pw_bias (G)))) (PreH23 : (packed_weights_pre = (pw_output_base (G)))) ,
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
  **  (pw_data F )
  **  (pw_output W O )
|--
  “ (1 <> 0) ”
.

Definition test_rvv_partial_solve_wit_7_aux := 
forall (extra_bytes_pre: Z) (packed_weights_pre: Z) (bias_pre: Z) (weights_pre: Z) (sr_pre: Z) (kr_pre: Z) (nr_pre: Z) (kc_pre: Z) (nc_pre: Z) (g_pre: Z) (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (PreH1 : (weights_pre <> 0)) (PreH2 : (sr_pre = 1)) (PreH3 : (kr_pre = 1)) (PreH4 : (nr_pre = 2)) (PreH5 : (kc_pre <> 0)) (PreH6 : (nc_pre <> 0)) (PreH7 : (g_pre <> 0)) (PreH8 : (g_pre > 0)) (PreH9 : (nc_pre > 0)) (PreH10 : (kc_pre > 0)) (PreH11 : (weights_pre > 0)) (PreH12 : (packed_weights_pre > 0)) (PreH13 : (g_pre = (pw_groups (G)))) (PreH14 : (nc_pre = (pw_channels (G)))) (PreH15 : (kc_pre = (pw_depth (G)))) (PreH16 : (extra_bytes_pre = (pw_extra_bytes (G)))) (PreH17 : (nr_pre = 2)) (PreH18 : (kr_pre = 1)) (PreH19 : (sr_pre = 1)) (PreH20 : (pw_program_storage F W G )) (PreH21 : (weights_pre = (pw_weights (G)))) (PreH22 : (bias_pre = (pw_bias (G)))) (PreH23 : (packed_weights_pre = (pw_output_base (G)))) ,
  (pw_data F )
  **  (pw_output W O )
|--
  “ (1 <> 0) ” 
  &&  “ (weights_pre <> 0) ” 
  &&  “ (sr_pre = 1) ” 
  &&  “ (kr_pre = 1) ” 
  &&  “ (nr_pre = 2) ” 
  &&  “ (kc_pre <> 0) ” 
  &&  “ (nc_pre <> 0) ” 
  &&  “ (g_pre <> 0) ” 
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
  &&  (pw_data F )
  **  (pw_output W O )
.

Definition test_rvv_partial_solve_wit_7 := test_rvv_partial_solve_wit_7_pure -> test_rvv_partial_solve_wit_7_aux.

Definition test_rvv_partial_solve_wit_8_pure := 
forall (params_pre: Z) (extra_bytes_pre: Z) (packed_weights_pre: Z) (scale_pre: Z) (bias_pre: Z) (weights_pre: Z) (sr_pre: Z) (kr_pre: Z) (nr_pre: Z) (kc_pre: Z) (nc_pre: Z) (g_pre: Z) (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (PreH1 : (packed_weights_pre <> 0)) (PreH2 : (weights_pre <> 0)) (PreH3 : (sr_pre = 1)) (PreH4 : (kr_pre = 1)) (PreH5 : (nr_pre = 2)) (PreH6 : (kc_pre <> 0)) (PreH7 : (nc_pre <> 0)) (PreH8 : (g_pre <> 0)) (PreH9 : (g_pre > 0)) (PreH10 : (nc_pre > 0)) (PreH11 : (kc_pre > 0)) (PreH12 : (weights_pre > 0)) (PreH13 : (packed_weights_pre > 0)) (PreH14 : (g_pre = (pw_groups (G)))) (PreH15 : (nc_pre = (pw_channels (G)))) (PreH16 : (kc_pre = (pw_depth (G)))) (PreH17 : (extra_bytes_pre = (pw_extra_bytes (G)))) (PreH18 : (nr_pre = 2)) (PreH19 : (kr_pre = 1)) (PreH20 : (sr_pre = 1)) (PreH21 : (pw_program_storage F W G )) (PreH22 : (weights_pre = (pw_weights (G)))) (PreH23 : (bias_pre = (pw_bias (G)))) (PreH24 : (packed_weights_pre = (pw_output_base (G)))) ,
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
  **  (pw_data F )
  **  (pw_output W O )
|--
  “ (1 <> 0) ”
.

Definition test_rvv_partial_solve_wit_8_aux := 
forall (extra_bytes_pre: Z) (packed_weights_pre: Z) (bias_pre: Z) (weights_pre: Z) (sr_pre: Z) (kr_pre: Z) (nr_pre: Z) (kc_pre: Z) (nc_pre: Z) (g_pre: Z) (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (PreH1 : (packed_weights_pre <> 0)) (PreH2 : (weights_pre <> 0)) (PreH3 : (sr_pre = 1)) (PreH4 : (kr_pre = 1)) (PreH5 : (nr_pre = 2)) (PreH6 : (kc_pre <> 0)) (PreH7 : (nc_pre <> 0)) (PreH8 : (g_pre <> 0)) (PreH9 : (g_pre > 0)) (PreH10 : (nc_pre > 0)) (PreH11 : (kc_pre > 0)) (PreH12 : (weights_pre > 0)) (PreH13 : (packed_weights_pre > 0)) (PreH14 : (g_pre = (pw_groups (G)))) (PreH15 : (nc_pre = (pw_channels (G)))) (PreH16 : (kc_pre = (pw_depth (G)))) (PreH17 : (extra_bytes_pre = (pw_extra_bytes (G)))) (PreH18 : (nr_pre = 2)) (PreH19 : (kr_pre = 1)) (PreH20 : (sr_pre = 1)) (PreH21 : (pw_program_storage F W G )) (PreH22 : (weights_pre = (pw_weights (G)))) (PreH23 : (bias_pre = (pw_bias (G)))) (PreH24 : (packed_weights_pre = (pw_output_base (G)))) ,
  (pw_data F )
  **  (pw_output W O )
|--
  “ (1 <> 0) ” 
  &&  “ (packed_weights_pre <> 0) ” 
  &&  “ (weights_pre <> 0) ” 
  &&  “ (sr_pre = 1) ” 
  &&  “ (kr_pre = 1) ” 
  &&  “ (nr_pre = 2) ” 
  &&  “ (kc_pre <> 0) ” 
  &&  “ (nc_pre <> 0) ” 
  &&  “ (g_pre <> 0) ” 
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
  &&  (pw_data F )
  **  (pw_output W O )
.

Definition test_rvv_partial_solve_wit_8 := test_rvv_partial_solve_wit_8_pure -> test_rvv_partial_solve_wit_8_aux.

Definition test_rvv_partial_solve_wit_9_pure := 
(
forall (params_pre: Z) (scale_pre: Z) (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (packed_weights: Z) (bias: Z) (w0: Z) (weights: Z) (n: Z) (tile: Z) (group: Z) (sr: Z) (kr: Z) (nr: Z) (extra_bytes: Z) (kc: Z) (nc: Z) (g: Z) (PreH1 : (n >= 2)) (PreH2 : (g = (pw_groups (G)))) (PreH3 : (nc = (pw_channels (G)))) (PreH4 : (kc = (pw_depth (G)))) (PreH5 : (extra_bytes = (pw_extra_bytes (G)))) (PreH6 : (nr = 2)) (PreH7 : (kr = 1)) (PreH8 : (sr = 1)) (PreH9 : (pw_program_storage F W G )) (PreH10 : (0 <= group)) (PreH11 : (group < g)) (PreH12 : (0 <= tile)) (PreH13 : (tile <= (pw_tiles (G)))) (PreH14 : (n = (nc - (2 * tile ) ))) (PreH15 : (0 <= n)) (PreH16 : (n <= nc)) (PreH17 : (weights = (pw_group_weight (G) (group)))) (PreH18 : (w0 = (pw_tile_weight (G) (group) (tile)))) (PreH19 : (bias = (pw_bias_at (G) (group) ((2 * tile ))))) (PreH20 : (packed_weights = (pw_tile_output (G) (group) (tile)))) ,
  ((( &( "scale" ) )) # Ptr  |-> scale_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "g" ) )) # UInt64  |-> g)
  **  ((( &( "nc" ) )) # UInt64  |-> nc)
  **  ((( &( "kc" ) )) # UInt64  |-> kc)
  **  ((( &( "extra_bytes" ) )) # UInt64  |-> extra_bytes)
  **  ((( &( "nr" ) )) # UInt64  |-> nr)
  **  ((( &( "kr" ) )) # UInt64  |-> kr)
  **  ((( &( "sr" ) )) # UInt64  |-> sr)
  **  ((( &( "group" ) )) # UInt64  |-> group)
  **  ((( &( "tile" ) )) # UInt64  |-> tile)
  **  ((( &( "n" ) )) # UInt64  |-> n)
  **  ((( &( "weights" ) )) # Ptr  |-> weights)
  **  ((( &( "w0" ) )) # Ptr  |-> w0)
  **  ((( &( "bias" ) )) # Ptr  |-> bias)
  **  ((( &( "packed_weights" ) )) # Ptr  |-> packed_weights)
  **  (pw_data F )
  **  (pw_output W (pw_tile_state (F) (G) (O) (group) (tile)) )
|--
  “ (pw_header_pre F W bias packed_weights 2 ) ”
) \/
(
forall (params_pre: Z) (scale_pre: Z) (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (packed_weights: Z) (bias: Z) (w0: Z) (weights: Z) (n: Z) (tile: Z) (group: Z) (sr: Z) (kr: Z) (nr: Z) (extra_bytes: Z) (kc: Z) (nc: Z) (g: Z) (PreH1 : (n <= UINT64_MAX)) (PreH2 : (tile <= UINT64_MAX)) (PreH3 : (group <= UINT64_MAX)) (PreH4 : (sr <= UINT64_MAX)) (PreH5 : (kr <= UINT64_MAX)) (PreH6 : (nr <= UINT64_MAX)) (PreH7 : (extra_bytes <= UINT64_MAX)) (PreH8 : (kc <= UINT64_MAX)) (PreH9 : (nc <= UINT64_MAX)) (PreH10 : (g <= UINT64_MAX)) (PreH11 : (n >= 0)) (PreH12 : (tile >= 0)) (PreH13 : (group >= 0)) (PreH14 : (sr >= 0)) (PreH15 : (kr >= 0)) (PreH16 : (nr >= 0)) (PreH17 : (extra_bytes >= 0)) (PreH18 : (kc >= 0)) (PreH19 : (nc >= 0)) (PreH20 : (g >= 0)) (PreH21 : (n >= 2)) (PreH22 : (g = (pw_groups (G)))) (PreH23 : (nc = (pw_channels (G)))) (PreH24 : (kc = (pw_depth (G)))) (PreH25 : (extra_bytes = (pw_extra_bytes (G)))) (PreH26 : (nr = 2)) (PreH27 : (kr = 1)) (PreH28 : (sr = 1)) (PreH29 : (pw_program_storage F W G )) (PreH30 : (0 <= group)) (PreH31 : (group < g)) (PreH32 : (0 <= tile)) (PreH33 : (tile <= (pw_tiles (G)))) (PreH34 : (n = (nc - (2 * tile ) ))) (PreH35 : (0 <= n)) (PreH36 : (n <= nc)) (PreH37 : (weights = (pw_group_weight (G) (group)))) (PreH38 : (w0 = (pw_tile_weight (G) (group) (tile)))) (PreH39 : (bias = (pw_bias_at (G) (group) ((2 * tile ))))) (PreH40 : (packed_weights = (pw_tile_output (G) (group) (tile)))) ,
  ((( &( "scale" ) )) # Ptr  |-> scale_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "g" ) )) # UInt64  |-> g)
  **  ((( &( "nc" ) )) # UInt64  |-> nc)
  **  ((( &( "kc" ) )) # UInt64  |-> kc)
  **  ((( &( "extra_bytes" ) )) # UInt64  |-> extra_bytes)
  **  ((( &( "nr" ) )) # UInt64  |-> nr)
  **  ((( &( "kr" ) )) # UInt64  |-> kr)
  **  ((( &( "sr" ) )) # UInt64  |-> sr)
  **  ((( &( "group" ) )) # UInt64  |-> group)
  **  ((( &( "tile" ) )) # UInt64  |-> tile)
  **  ((( &( "n" ) )) # UInt64  |-> n)
  **  ((( &( "weights" ) )) # Ptr  |-> weights)
  **  ((( &( "w0" ) )) # Ptr  |-> w0)
  **  ((( &( "bias" ) )) # Ptr  |-> bias)
  **  ((( &( "packed_weights" ) )) # Ptr  |-> packed_weights)
  **  (pw_data F )
  **  (pw_output W (pw_tile_state (F) (G) (O) (group) (tile)) )
|--
  “ (pw_header_pre F W bias packed_weights 2 ) ”
).

Definition test_rvv_partial_solve_wit_9_pure_split_goal_1 := 
forall (params_pre: Z) (scale_pre: Z) (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (packed_weights: Z) (bias: Z) (w0: Z) (weights: Z) (n: Z) (tile: Z) (group: Z) (sr: Z) (kr: Z) (nr: Z) (extra_bytes: Z) (kc: Z) (nc: Z) (g: Z) (PreH1 : (n <= UINT64_MAX)) (PreH2 : (tile <= UINT64_MAX)) (PreH3 : (group <= UINT64_MAX)) (PreH4 : (sr <= UINT64_MAX)) (PreH5 : (kr <= UINT64_MAX)) (PreH6 : (nr <= UINT64_MAX)) (PreH7 : (extra_bytes <= UINT64_MAX)) (PreH8 : (kc <= UINT64_MAX)) (PreH9 : (nc <= UINT64_MAX)) (PreH10 : (g <= UINT64_MAX)) (PreH11 : (n >= 0)) (PreH12 : (tile >= 0)) (PreH13 : (group >= 0)) (PreH14 : (sr >= 0)) (PreH15 : (kr >= 0)) (PreH16 : (nr >= 0)) (PreH17 : (extra_bytes >= 0)) (PreH18 : (kc >= 0)) (PreH19 : (nc >= 0)) (PreH20 : (g >= 0)) (PreH21 : (n >= 2)) (PreH22 : (g = (pw_groups (G)))) (PreH23 : (nc = (pw_channels (G)))) (PreH24 : (kc = (pw_depth (G)))) (PreH25 : (extra_bytes = (pw_extra_bytes (G)))) (PreH26 : (nr = 2)) (PreH27 : (kr = 1)) (PreH28 : (sr = 1)) (PreH29 : (pw_program_storage F W G )) (PreH30 : (0 <= group)) (PreH31 : (group < g)) (PreH32 : (0 <= tile)) (PreH33 : (tile <= (pw_tiles (G)))) (PreH34 : (n = (nc - (2 * tile ) ))) (PreH35 : (0 <= n)) (PreH36 : (n <= nc)) (PreH37 : (weights = (pw_group_weight (G) (group)))) (PreH38 : (w0 = (pw_tile_weight (G) (group) (tile)))) (PreH39 : (bias = (pw_bias_at (G) (group) ((2 * tile ))))) (PreH40 : (packed_weights = (pw_tile_output (G) (group) (tile)))) ,
  ((( &( "scale" ) )) # Ptr  |-> scale_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "g" ) )) # UInt64  |-> g)
  **  ((( &( "nc" ) )) # UInt64  |-> nc)
  **  ((( &( "kc" ) )) # UInt64  |-> kc)
  **  ((( &( "extra_bytes" ) )) # UInt64  |-> extra_bytes)
  **  ((( &( "nr" ) )) # UInt64  |-> nr)
  **  ((( &( "kr" ) )) # UInt64  |-> kr)
  **  ((( &( "sr" ) )) # UInt64  |-> sr)
  **  ((( &( "group" ) )) # UInt64  |-> group)
  **  ((( &( "tile" ) )) # UInt64  |-> tile)
  **  ((( &( "n" ) )) # UInt64  |-> n)
  **  ((( &( "weights" ) )) # Ptr  |-> weights)
  **  ((( &( "w0" ) )) # Ptr  |-> w0)
  **  ((( &( "bias" ) )) # Ptr  |-> bias)
  **  ((( &( "packed_weights" ) )) # Ptr  |-> packed_weights)
  **  (pw_data F )
  **  (pw_output W (pw_tile_state (F) (G) (O) (group) (tile)) )
|--
  “ (pw_header_pre F W bias packed_weights 2 ) ”
.

Definition test_rvv_partial_solve_wit_9_aux := 
forall (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (packed_weights: Z) (bias: Z) (w0: Z) (weights: Z) (n: Z) (tile: Z) (group: Z) (sr: Z) (kr: Z) (nr: Z) (extra_bytes: Z) (kc: Z) (nc: Z) (g: Z) (PreH1 : (n >= 2)) (PreH2 : (g = (pw_groups (G)))) (PreH3 : (nc = (pw_channels (G)))) (PreH4 : (kc = (pw_depth (G)))) (PreH5 : (extra_bytes = (pw_extra_bytes (G)))) (PreH6 : (nr = 2)) (PreH7 : (kr = 1)) (PreH8 : (sr = 1)) (PreH9 : (pw_program_storage F W G )) (PreH10 : (0 <= group)) (PreH11 : (group < g)) (PreH12 : (0 <= tile)) (PreH13 : (tile <= (pw_tiles (G)))) (PreH14 : (n = (nc - (2 * tile ) ))) (PreH15 : (0 <= n)) (PreH16 : (n <= nc)) (PreH17 : (weights = (pw_group_weight (G) (group)))) (PreH18 : (w0 = (pw_tile_weight (G) (group) (tile)))) (PreH19 : (bias = (pw_bias_at (G) (group) ((2 * tile ))))) (PreH20 : (packed_weights = (pw_tile_output (G) (group) (tile)))) ,
  (pw_data F )
  **  (pw_output W (pw_tile_state (F) (G) (O) (group) (tile)) )
|--
  “ (pw_header_pre F W bias packed_weights 2 ) ” 
  &&  “ (n >= 2) ” 
  &&  “ (g = (pw_groups (G))) ” 
  &&  “ (nc = (pw_channels (G))) ” 
  &&  “ (kc = (pw_depth (G))) ” 
  &&  “ (extra_bytes = (pw_extra_bytes (G))) ” 
  &&  “ (nr = 2) ” 
  &&  “ (kr = 1) ” 
  &&  “ (sr = 1) ” 
  &&  “ (pw_program_storage F W G ) ” 
  &&  “ (0 <= group) ” 
  &&  “ (group < g) ” 
  &&  “ (0 <= tile) ” 
  &&  “ (tile <= (pw_tiles (G))) ” 
  &&  “ (n = (nc - (2 * tile ) )) ” 
  &&  “ (0 <= n) ” 
  &&  “ (n <= nc) ” 
  &&  “ (weights = (pw_group_weight (G) (group))) ” 
  &&  “ (w0 = (pw_tile_weight (G) (group) (tile))) ” 
  &&  “ (bias = (pw_bias_at (G) (group) ((2 * tile )))) ” 
  &&  “ (packed_weights = (pw_tile_output (G) (group) (tile))) ”
  &&  (pw_data F )
  **  (pw_output W (pw_tile_state (F) (G) (O) (group) (tile)) )
.

Definition test_rvv_partial_solve_wit_9 := test_rvv_partial_solve_wit_9_pure -> test_rvv_partial_solve_wit_9_aux.

Definition test_rvv_partial_solve_wit_10_pure := 
(
forall (params_pre: Z) (scale_pre: Z) (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (packed_weights: Z) (bias: Z) (w0: Z) (weights: Z) (n: Z) (tile: Z) (group: Z) (sr: Z) (kr: Z) (nr: Z) (extra_bytes: Z) (kc: Z) (nc: Z) (g: Z) (PreH1 : (bias <> 0)) (PreH2 : (n >= 2)) (PreH3 : (g = (pw_groups (G)))) (PreH4 : (nc = (pw_channels (G)))) (PreH5 : (kc = (pw_depth (G)))) (PreH6 : (extra_bytes = (pw_extra_bytes (G)))) (PreH7 : (nr = 2)) (PreH8 : (kr = 1)) (PreH9 : (sr = 1)) (PreH10 : (pw_program_storage F W G )) (PreH11 : (0 <= group)) (PreH12 : (group < g)) (PreH13 : (0 <= tile)) (PreH14 : (tile <= (pw_tiles (G)))) (PreH15 : (n = (nc - (2 * tile ) ))) (PreH16 : (0 <= n)) (PreH17 : (n <= nc)) (PreH18 : (weights = (pw_group_weight (G) (group)))) (PreH19 : (w0 = (pw_tile_weight (G) (group) (tile)))) (PreH20 : (bias = (pw_bias_at (G) (group) ((2 * tile ))))) (PreH21 : (packed_weights = (pw_tile_output (G) (group) (tile)))) ,
  ((( &( "w1" ) )) # Ptr  |-> (w0 + (kc * sizeof(UINT))))
  **  (pw_data F )
  **  (pw_output W (pw_header_run (F) (bias) (packed_weights) (2) ((pw_tile_state (F) (G) (O) (group) (tile)))) )
  **  ((( &( "scale" ) )) # Ptr  |-> scale_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "g" ) )) # UInt64  |-> g)
  **  ((( &( "nc" ) )) # UInt64  |-> nc)
  **  ((( &( "kc" ) )) # UInt64  |-> kc)
  **  ((( &( "extra_bytes" ) )) # UInt64  |-> extra_bytes)
  **  ((( &( "nr" ) )) # UInt64  |-> nr)
  **  ((( &( "kr" ) )) # UInt64  |-> kr)
  **  ((( &( "sr" ) )) # UInt64  |-> sr)
  **  ((( &( "group" ) )) # UInt64  |-> group)
  **  ((( &( "tile" ) )) # UInt64  |-> tile)
  **  ((( &( "n" ) )) # UInt64  |-> n)
  **  ((( &( "weights" ) )) # Ptr  |-> weights)
  **  ((( &( "w0" ) )) # Ptr  |-> w0)
  **  ((( &( "bias" ) )) # Ptr  |-> (bias + (2 * sizeof(UINT))))
  **  ((( &( "packed_weights" ) )) # Ptr  |-> (packed_weights + (2 * sizeof(UINT))))
|--
  “ (pw_pair_pre F W w0 (w0 + (kc * sizeof(UINT))) (packed_weights + (2 * sizeof(UINT))) kc ) ”
) \/
(
forall (params_pre: Z) (scale_pre: Z) (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (packed_weights: Z) (bias: Z) (w0: Z) (weights: Z) (n: Z) (tile: Z) (group: Z) (sr: Z) (kr: Z) (nr: Z) (extra_bytes: Z) (kc: Z) (nc: Z) (g: Z) (PreH1 : (n <= UINT64_MAX)) (PreH2 : (tile <= UINT64_MAX)) (PreH3 : (group <= UINT64_MAX)) (PreH4 : (sr <= UINT64_MAX)) (PreH5 : (kr <= UINT64_MAX)) (PreH6 : (nr <= UINT64_MAX)) (PreH7 : (extra_bytes <= UINT64_MAX)) (PreH8 : (kc <= UINT64_MAX)) (PreH9 : (nc <= UINT64_MAX)) (PreH10 : (g <= UINT64_MAX)) (PreH11 : (n >= 0)) (PreH12 : (tile >= 0)) (PreH13 : (group >= 0)) (PreH14 : (sr >= 0)) (PreH15 : (kr >= 0)) (PreH16 : (nr >= 0)) (PreH17 : (extra_bytes >= 0)) (PreH18 : (kc >= 0)) (PreH19 : (nc >= 0)) (PreH20 : (g >= 0)) (PreH21 : (bias <> 0)) (PreH22 : (n >= 2)) (PreH23 : (g = (pw_groups (G)))) (PreH24 : (nc = (pw_channels (G)))) (PreH25 : (kc = (pw_depth (G)))) (PreH26 : (extra_bytes = (pw_extra_bytes (G)))) (PreH27 : (nr = 2)) (PreH28 : (kr = 1)) (PreH29 : (sr = 1)) (PreH30 : (pw_program_storage F W G )) (PreH31 : (0 <= group)) (PreH32 : (group < g)) (PreH33 : (0 <= tile)) (PreH34 : (tile <= (pw_tiles (G)))) (PreH35 : (n = (nc - (2 * tile ) ))) (PreH36 : (0 <= n)) (PreH37 : (n <= nc)) (PreH38 : (weights = (pw_group_weight (G) (group)))) (PreH39 : (w0 = (pw_tile_weight (G) (group) (tile)))) (PreH40 : (bias = (pw_bias_at (G) (group) ((2 * tile ))))) (PreH41 : (packed_weights = (pw_tile_output (G) (group) (tile)))) ,
  ((( &( "w1" ) )) # Ptr  |-> (w0 + (kc * sizeof(UINT))))
  **  (pw_data F )
  **  (pw_output W (pw_header_run (F) (bias) (packed_weights) (2) ((pw_tile_state (F) (G) (O) (group) (tile)))) )
  **  ((( &( "scale" ) )) # Ptr  |-> scale_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "g" ) )) # UInt64  |-> g)
  **  ((( &( "nc" ) )) # UInt64  |-> nc)
  **  ((( &( "kc" ) )) # UInt64  |-> kc)
  **  ((( &( "extra_bytes" ) )) # UInt64  |-> extra_bytes)
  **  ((( &( "nr" ) )) # UInt64  |-> nr)
  **  ((( &( "kr" ) )) # UInt64  |-> kr)
  **  ((( &( "sr" ) )) # UInt64  |-> sr)
  **  ((( &( "group" ) )) # UInt64  |-> group)
  **  ((( &( "tile" ) )) # UInt64  |-> tile)
  **  ((( &( "n" ) )) # UInt64  |-> n)
  **  ((( &( "weights" ) )) # Ptr  |-> weights)
  **  ((( &( "w0" ) )) # Ptr  |-> w0)
  **  ((( &( "bias" ) )) # Ptr  |-> (bias + (2 * sizeof(UINT))))
  **  ((( &( "packed_weights" ) )) # Ptr  |-> (packed_weights + (2 * sizeof(UINT))))
|--
  “ (pw_pair_pre F W w0 (w0 + (kc * sizeof(UINT))) (packed_weights + (2 * sizeof(UINT))) kc ) ”
).

Definition test_rvv_partial_solve_wit_10_pure_split_goal_1 := 
forall (params_pre: Z) (scale_pre: Z) (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (packed_weights: Z) (bias: Z) (w0: Z) (weights: Z) (n: Z) (tile: Z) (group: Z) (sr: Z) (kr: Z) (nr: Z) (extra_bytes: Z) (kc: Z) (nc: Z) (g: Z) (PreH1 : (n <= UINT64_MAX)) (PreH2 : (tile <= UINT64_MAX)) (PreH3 : (group <= UINT64_MAX)) (PreH4 : (sr <= UINT64_MAX)) (PreH5 : (kr <= UINT64_MAX)) (PreH6 : (nr <= UINT64_MAX)) (PreH7 : (extra_bytes <= UINT64_MAX)) (PreH8 : (kc <= UINT64_MAX)) (PreH9 : (nc <= UINT64_MAX)) (PreH10 : (g <= UINT64_MAX)) (PreH11 : (n >= 0)) (PreH12 : (tile >= 0)) (PreH13 : (group >= 0)) (PreH14 : (sr >= 0)) (PreH15 : (kr >= 0)) (PreH16 : (nr >= 0)) (PreH17 : (extra_bytes >= 0)) (PreH18 : (kc >= 0)) (PreH19 : (nc >= 0)) (PreH20 : (g >= 0)) (PreH21 : (bias <> 0)) (PreH22 : (n >= 2)) (PreH23 : (g = (pw_groups (G)))) (PreH24 : (nc = (pw_channels (G)))) (PreH25 : (kc = (pw_depth (G)))) (PreH26 : (extra_bytes = (pw_extra_bytes (G)))) (PreH27 : (nr = 2)) (PreH28 : (kr = 1)) (PreH29 : (sr = 1)) (PreH30 : (pw_program_storage F W G )) (PreH31 : (0 <= group)) (PreH32 : (group < g)) (PreH33 : (0 <= tile)) (PreH34 : (tile <= (pw_tiles (G)))) (PreH35 : (n = (nc - (2 * tile ) ))) (PreH36 : (0 <= n)) (PreH37 : (n <= nc)) (PreH38 : (weights = (pw_group_weight (G) (group)))) (PreH39 : (w0 = (pw_tile_weight (G) (group) (tile)))) (PreH40 : (bias = (pw_bias_at (G) (group) ((2 * tile ))))) (PreH41 : (packed_weights = (pw_tile_output (G) (group) (tile)))) ,
  ((( &( "w1" ) )) # Ptr  |-> (w0 + (kc * sizeof(UINT))))
  **  (pw_data F )
  **  (pw_output W (pw_header_run (F) (bias) (packed_weights) (2) ((pw_tile_state (F) (G) (O) (group) (tile)))) )
  **  ((( &( "scale" ) )) # Ptr  |-> scale_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "g" ) )) # UInt64  |-> g)
  **  ((( &( "nc" ) )) # UInt64  |-> nc)
  **  ((( &( "kc" ) )) # UInt64  |-> kc)
  **  ((( &( "extra_bytes" ) )) # UInt64  |-> extra_bytes)
  **  ((( &( "nr" ) )) # UInt64  |-> nr)
  **  ((( &( "kr" ) )) # UInt64  |-> kr)
  **  ((( &( "sr" ) )) # UInt64  |-> sr)
  **  ((( &( "group" ) )) # UInt64  |-> group)
  **  ((( &( "tile" ) )) # UInt64  |-> tile)
  **  ((( &( "n" ) )) # UInt64  |-> n)
  **  ((( &( "weights" ) )) # Ptr  |-> weights)
  **  ((( &( "w0" ) )) # Ptr  |-> w0)
  **  ((( &( "bias" ) )) # Ptr  |-> (bias + (2 * sizeof(UINT))))
  **  ((( &( "packed_weights" ) )) # Ptr  |-> (packed_weights + (2 * sizeof(UINT))))
|--
  “ (pw_pair_pre F W w0 (w0 + (kc * sizeof(UINT))) (packed_weights + (2 * sizeof(UINT))) kc ) ”
.

Definition test_rvv_partial_solve_wit_10_aux := 
forall (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (packed_weights: Z) (bias: Z) (w0: Z) (weights: Z) (n: Z) (tile: Z) (group: Z) (sr: Z) (kr: Z) (nr: Z) (extra_bytes: Z) (kc: Z) (nc: Z) (g: Z) (PreH1 : (bias <> 0)) (PreH2 : (n >= 2)) (PreH3 : (g = (pw_groups (G)))) (PreH4 : (nc = (pw_channels (G)))) (PreH5 : (kc = (pw_depth (G)))) (PreH6 : (extra_bytes = (pw_extra_bytes (G)))) (PreH7 : (nr = 2)) (PreH8 : (kr = 1)) (PreH9 : (sr = 1)) (PreH10 : (pw_program_storage F W G )) (PreH11 : (0 <= group)) (PreH12 : (group < g)) (PreH13 : (0 <= tile)) (PreH14 : (tile <= (pw_tiles (G)))) (PreH15 : (n = (nc - (2 * tile ) ))) (PreH16 : (0 <= n)) (PreH17 : (n <= nc)) (PreH18 : (weights = (pw_group_weight (G) (group)))) (PreH19 : (w0 = (pw_tile_weight (G) (group) (tile)))) (PreH20 : (bias = (pw_bias_at (G) (group) ((2 * tile ))))) (PreH21 : (packed_weights = (pw_tile_output (G) (group) (tile)))) ,
  (pw_data F )
  **  (pw_output W (pw_header_run (F) (bias) (packed_weights) (2) ((pw_tile_state (F) (G) (O) (group) (tile)))) )
|--
  “ (pw_pair_pre F W w0 (w0 + (kc * sizeof(UINT))) (packed_weights + (2 * sizeof(UINT))) kc ) ” 
  &&  “ (bias <> 0) ” 
  &&  “ (n >= 2) ” 
  &&  “ (g = (pw_groups (G))) ” 
  &&  “ (nc = (pw_channels (G))) ” 
  &&  “ (kc = (pw_depth (G))) ” 
  &&  “ (extra_bytes = (pw_extra_bytes (G))) ” 
  &&  “ (nr = 2) ” 
  &&  “ (kr = 1) ” 
  &&  “ (sr = 1) ” 
  &&  “ (pw_program_storage F W G ) ” 
  &&  “ (0 <= group) ” 
  &&  “ (group < g) ” 
  &&  “ (0 <= tile) ” 
  &&  “ (tile <= (pw_tiles (G))) ” 
  &&  “ (n = (nc - (2 * tile ) )) ” 
  &&  “ (0 <= n) ” 
  &&  “ (n <= nc) ” 
  &&  “ (weights = (pw_group_weight (G) (group))) ” 
  &&  “ (w0 = (pw_tile_weight (G) (group) (tile))) ” 
  &&  “ (bias = (pw_bias_at (G) (group) ((2 * tile )))) ” 
  &&  “ (packed_weights = (pw_tile_output (G) (group) (tile))) ”
  &&  (pw_data F )
  **  (pw_output W (pw_header_run (F) ((pw_bias_at (G) (group) ((2 * tile )))) ((pw_tile_output (G) (group) (tile))) (2) ((pw_tile_state (F) (G) (O) (group) (tile)))) )
.

Definition test_rvv_partial_solve_wit_10 := test_rvv_partial_solve_wit_10_pure -> test_rvv_partial_solve_wit_10_aux.

Definition test_rvv_partial_solve_wit_11_pure := 
(
forall (params_pre: Z) (scale_pre: Z) (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (packed_weights: Z) (bias: Z) (w0: Z) (weights: Z) (n: Z) (tile: Z) (group: Z) (sr: Z) (kr: Z) (nr: Z) (extra_bytes: Z) (kc: Z) (nc: Z) (g: Z) (PreH1 : (bias = 0)) (PreH2 : (n >= 2)) (PreH3 : (g = (pw_groups (G)))) (PreH4 : (nc = (pw_channels (G)))) (PreH5 : (kc = (pw_depth (G)))) (PreH6 : (extra_bytes = (pw_extra_bytes (G)))) (PreH7 : (nr = 2)) (PreH8 : (kr = 1)) (PreH9 : (sr = 1)) (PreH10 : (pw_program_storage F W G )) (PreH11 : (0 <= group)) (PreH12 : (group < g)) (PreH13 : (0 <= tile)) (PreH14 : (tile <= (pw_tiles (G)))) (PreH15 : (n = (nc - (2 * tile ) ))) (PreH16 : (0 <= n)) (PreH17 : (n <= nc)) (PreH18 : (weights = (pw_group_weight (G) (group)))) (PreH19 : (w0 = (pw_tile_weight (G) (group) (tile)))) (PreH20 : (bias = (pw_bias_at (G) (group) ((2 * tile ))))) (PreH21 : (packed_weights = (pw_tile_output (G) (group) (tile)))) ,
  ((( &( "w1" ) )) # Ptr  |-> (w0 + (kc * sizeof(UINT))))
  **  (pw_data F )
  **  (pw_output W (pw_header_run (F) (bias) (packed_weights) (2) ((pw_tile_state (F) (G) (O) (group) (tile)))) )
  **  ((( &( "scale" ) )) # Ptr  |-> scale_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "g" ) )) # UInt64  |-> g)
  **  ((( &( "nc" ) )) # UInt64  |-> nc)
  **  ((( &( "kc" ) )) # UInt64  |-> kc)
  **  ((( &( "extra_bytes" ) )) # UInt64  |-> extra_bytes)
  **  ((( &( "nr" ) )) # UInt64  |-> nr)
  **  ((( &( "kr" ) )) # UInt64  |-> kr)
  **  ((( &( "sr" ) )) # UInt64  |-> sr)
  **  ((( &( "group" ) )) # UInt64  |-> group)
  **  ((( &( "tile" ) )) # UInt64  |-> tile)
  **  ((( &( "n" ) )) # UInt64  |-> n)
  **  ((( &( "weights" ) )) # Ptr  |-> weights)
  **  ((( &( "w0" ) )) # Ptr  |-> w0)
  **  ((( &( "bias" ) )) # Ptr  |-> bias)
  **  ((( &( "packed_weights" ) )) # Ptr  |-> (packed_weights + (2 * sizeof(UINT))))
|--
  “ (pw_pair_pre F W w0 (w0 + (kc * sizeof(UINT))) (packed_weights + (2 * sizeof(UINT))) kc ) ”
) \/
(
forall (params_pre: Z) (scale_pre: Z) (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (packed_weights: Z) (bias: Z) (w0: Z) (weights: Z) (n: Z) (tile: Z) (group: Z) (sr: Z) (kr: Z) (nr: Z) (extra_bytes: Z) (kc: Z) (nc: Z) (g: Z) (PreH1 : (n <= UINT64_MAX)) (PreH2 : (tile <= UINT64_MAX)) (PreH3 : (group <= UINT64_MAX)) (PreH4 : (sr <= UINT64_MAX)) (PreH5 : (kr <= UINT64_MAX)) (PreH6 : (nr <= UINT64_MAX)) (PreH7 : (extra_bytes <= UINT64_MAX)) (PreH8 : (kc <= UINT64_MAX)) (PreH9 : (nc <= UINT64_MAX)) (PreH10 : (g <= UINT64_MAX)) (PreH11 : (n >= 0)) (PreH12 : (tile >= 0)) (PreH13 : (group >= 0)) (PreH14 : (sr >= 0)) (PreH15 : (kr >= 0)) (PreH16 : (nr >= 0)) (PreH17 : (extra_bytes >= 0)) (PreH18 : (kc >= 0)) (PreH19 : (nc >= 0)) (PreH20 : (g >= 0)) (PreH21 : (bias = 0)) (PreH22 : (n >= 2)) (PreH23 : (g = (pw_groups (G)))) (PreH24 : (nc = (pw_channels (G)))) (PreH25 : (kc = (pw_depth (G)))) (PreH26 : (extra_bytes = (pw_extra_bytes (G)))) (PreH27 : (nr = 2)) (PreH28 : (kr = 1)) (PreH29 : (sr = 1)) (PreH30 : (pw_program_storage F W G )) (PreH31 : (0 <= group)) (PreH32 : (group < g)) (PreH33 : (0 <= tile)) (PreH34 : (tile <= (pw_tiles (G)))) (PreH35 : (n = (nc - (2 * tile ) ))) (PreH36 : (0 <= n)) (PreH37 : (n <= nc)) (PreH38 : (weights = (pw_group_weight (G) (group)))) (PreH39 : (w0 = (pw_tile_weight (G) (group) (tile)))) (PreH40 : (bias = (pw_bias_at (G) (group) ((2 * tile ))))) (PreH41 : (packed_weights = (pw_tile_output (G) (group) (tile)))) ,
  ((( &( "w1" ) )) # Ptr  |-> (w0 + (kc * sizeof(UINT))))
  **  (pw_data F )
  **  (pw_output W (pw_header_run (F) (bias) (packed_weights) (2) ((pw_tile_state (F) (G) (O) (group) (tile)))) )
  **  ((( &( "scale" ) )) # Ptr  |-> scale_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "g" ) )) # UInt64  |-> g)
  **  ((( &( "nc" ) )) # UInt64  |-> nc)
  **  ((( &( "kc" ) )) # UInt64  |-> kc)
  **  ((( &( "extra_bytes" ) )) # UInt64  |-> extra_bytes)
  **  ((( &( "nr" ) )) # UInt64  |-> nr)
  **  ((( &( "kr" ) )) # UInt64  |-> kr)
  **  ((( &( "sr" ) )) # UInt64  |-> sr)
  **  ((( &( "group" ) )) # UInt64  |-> group)
  **  ((( &( "tile" ) )) # UInt64  |-> tile)
  **  ((( &( "n" ) )) # UInt64  |-> n)
  **  ((( &( "weights" ) )) # Ptr  |-> weights)
  **  ((( &( "w0" ) )) # Ptr  |-> w0)
  **  ((( &( "bias" ) )) # Ptr  |-> bias)
  **  ((( &( "packed_weights" ) )) # Ptr  |-> (packed_weights + (2 * sizeof(UINT))))
|--
  “ (pw_pair_pre F W w0 (w0 + (kc * sizeof(UINT))) (packed_weights + (2 * sizeof(UINT))) kc ) ”
).

Definition test_rvv_partial_solve_wit_11_pure_split_goal_1 := 
forall (params_pre: Z) (scale_pre: Z) (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (packed_weights: Z) (bias: Z) (w0: Z) (weights: Z) (n: Z) (tile: Z) (group: Z) (sr: Z) (kr: Z) (nr: Z) (extra_bytes: Z) (kc: Z) (nc: Z) (g: Z) (PreH1 : (n <= UINT64_MAX)) (PreH2 : (tile <= UINT64_MAX)) (PreH3 : (group <= UINT64_MAX)) (PreH4 : (sr <= UINT64_MAX)) (PreH5 : (kr <= UINT64_MAX)) (PreH6 : (nr <= UINT64_MAX)) (PreH7 : (extra_bytes <= UINT64_MAX)) (PreH8 : (kc <= UINT64_MAX)) (PreH9 : (nc <= UINT64_MAX)) (PreH10 : (g <= UINT64_MAX)) (PreH11 : (n >= 0)) (PreH12 : (tile >= 0)) (PreH13 : (group >= 0)) (PreH14 : (sr >= 0)) (PreH15 : (kr >= 0)) (PreH16 : (nr >= 0)) (PreH17 : (extra_bytes >= 0)) (PreH18 : (kc >= 0)) (PreH19 : (nc >= 0)) (PreH20 : (g >= 0)) (PreH21 : (bias = 0)) (PreH22 : (n >= 2)) (PreH23 : (g = (pw_groups (G)))) (PreH24 : (nc = (pw_channels (G)))) (PreH25 : (kc = (pw_depth (G)))) (PreH26 : (extra_bytes = (pw_extra_bytes (G)))) (PreH27 : (nr = 2)) (PreH28 : (kr = 1)) (PreH29 : (sr = 1)) (PreH30 : (pw_program_storage F W G )) (PreH31 : (0 <= group)) (PreH32 : (group < g)) (PreH33 : (0 <= tile)) (PreH34 : (tile <= (pw_tiles (G)))) (PreH35 : (n = (nc - (2 * tile ) ))) (PreH36 : (0 <= n)) (PreH37 : (n <= nc)) (PreH38 : (weights = (pw_group_weight (G) (group)))) (PreH39 : (w0 = (pw_tile_weight (G) (group) (tile)))) (PreH40 : (bias = (pw_bias_at (G) (group) ((2 * tile ))))) (PreH41 : (packed_weights = (pw_tile_output (G) (group) (tile)))) ,
  ((( &( "w1" ) )) # Ptr  |-> (w0 + (kc * sizeof(UINT))))
  **  (pw_data F )
  **  (pw_output W (pw_header_run (F) (bias) (packed_weights) (2) ((pw_tile_state (F) (G) (O) (group) (tile)))) )
  **  ((( &( "scale" ) )) # Ptr  |-> scale_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "g" ) )) # UInt64  |-> g)
  **  ((( &( "nc" ) )) # UInt64  |-> nc)
  **  ((( &( "kc" ) )) # UInt64  |-> kc)
  **  ((( &( "extra_bytes" ) )) # UInt64  |-> extra_bytes)
  **  ((( &( "nr" ) )) # UInt64  |-> nr)
  **  ((( &( "kr" ) )) # UInt64  |-> kr)
  **  ((( &( "sr" ) )) # UInt64  |-> sr)
  **  ((( &( "group" ) )) # UInt64  |-> group)
  **  ((( &( "tile" ) )) # UInt64  |-> tile)
  **  ((( &( "n" ) )) # UInt64  |-> n)
  **  ((( &( "weights" ) )) # Ptr  |-> weights)
  **  ((( &( "w0" ) )) # Ptr  |-> w0)
  **  ((( &( "bias" ) )) # Ptr  |-> bias)
  **  ((( &( "packed_weights" ) )) # Ptr  |-> (packed_weights + (2 * sizeof(UINT))))
|--
  “ (pw_pair_pre F W w0 (w0 + (kc * sizeof(UINT))) (packed_weights + (2 * sizeof(UINT))) kc ) ”
.

Definition test_rvv_partial_solve_wit_11_aux := 
forall (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (packed_weights: Z) (bias: Z) (w0: Z) (weights: Z) (n: Z) (tile: Z) (group: Z) (sr: Z) (kr: Z) (nr: Z) (extra_bytes: Z) (kc: Z) (nc: Z) (g: Z) (PreH1 : (bias = 0)) (PreH2 : (n >= 2)) (PreH3 : (g = (pw_groups (G)))) (PreH4 : (nc = (pw_channels (G)))) (PreH5 : (kc = (pw_depth (G)))) (PreH6 : (extra_bytes = (pw_extra_bytes (G)))) (PreH7 : (nr = 2)) (PreH8 : (kr = 1)) (PreH9 : (sr = 1)) (PreH10 : (pw_program_storage F W G )) (PreH11 : (0 <= group)) (PreH12 : (group < g)) (PreH13 : (0 <= tile)) (PreH14 : (tile <= (pw_tiles (G)))) (PreH15 : (n = (nc - (2 * tile ) ))) (PreH16 : (0 <= n)) (PreH17 : (n <= nc)) (PreH18 : (weights = (pw_group_weight (G) (group)))) (PreH19 : (w0 = (pw_tile_weight (G) (group) (tile)))) (PreH20 : (bias = (pw_bias_at (G) (group) ((2 * tile ))))) (PreH21 : (packed_weights = (pw_tile_output (G) (group) (tile)))) ,
  (pw_data F )
  **  (pw_output W (pw_header_run (F) (bias) (packed_weights) (2) ((pw_tile_state (F) (G) (O) (group) (tile)))) )
|--
  “ (pw_pair_pre F W w0 (w0 + (kc * sizeof(UINT))) (packed_weights + (2 * sizeof(UINT))) kc ) ” 
  &&  “ (bias = 0) ” 
  &&  “ (n >= 2) ” 
  &&  “ (g = (pw_groups (G))) ” 
  &&  “ (nc = (pw_channels (G))) ” 
  &&  “ (kc = (pw_depth (G))) ” 
  &&  “ (extra_bytes = (pw_extra_bytes (G))) ” 
  &&  “ (nr = 2) ” 
  &&  “ (kr = 1) ” 
  &&  “ (sr = 1) ” 
  &&  “ (pw_program_storage F W G ) ” 
  &&  “ (0 <= group) ” 
  &&  “ (group < g) ” 
  &&  “ (0 <= tile) ” 
  &&  “ (tile <= (pw_tiles (G))) ” 
  &&  “ (n = (nc - (2 * tile ) )) ” 
  &&  “ (0 <= n) ” 
  &&  “ (n <= nc) ” 
  &&  “ (weights = (pw_group_weight (G) (group))) ” 
  &&  “ (w0 = (pw_tile_weight (G) (group) (tile))) ” 
  &&  “ (bias = (pw_bias_at (G) (group) ((2 * tile )))) ” 
  &&  “ (packed_weights = (pw_tile_output (G) (group) (tile))) ”
  &&  (pw_data F )
  **  (pw_output W (pw_header_run (F) (0) ((pw_tile_output (G) (group) (tile))) (2) ((pw_tile_state (F) (G) (O) (group) (tile)))) )
.

Definition test_rvv_partial_solve_wit_11 := test_rvv_partial_solve_wit_11_pure -> test_rvv_partial_solve_wit_11_aux.

Definition test_rvv_partial_solve_wit_12_pure := 
(
forall (params_pre: Z) (scale_pre: Z) (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (packed_weights: Z) (bias: Z) (w0: Z) (weights: Z) (n: Z) (tile: Z) (group: Z) (sr: Z) (kr: Z) (nr: Z) (extra_bytes: Z) (kc: Z) (nc: Z) (g: Z) (PreH1 : (n <> 0)) (PreH2 : (n < 2)) (PreH3 : (g = (pw_groups (G)))) (PreH4 : (nc = (pw_channels (G)))) (PreH5 : (kc = (pw_depth (G)))) (PreH6 : (extra_bytes = (pw_extra_bytes (G)))) (PreH7 : (nr = 2)) (PreH8 : (kr = 1)) (PreH9 : (sr = 1)) (PreH10 : (pw_program_storage F W G )) (PreH11 : (0 <= group)) (PreH12 : (group < g)) (PreH13 : (0 <= tile)) (PreH14 : (tile <= (pw_tiles (G)))) (PreH15 : (n = (nc - (2 * tile ) ))) (PreH16 : (0 <= n)) (PreH17 : (n <= nc)) (PreH18 : (weights = (pw_group_weight (G) (group)))) (PreH19 : (w0 = (pw_tile_weight (G) (group) (tile)))) (PreH20 : (bias = (pw_bias_at (G) (group) ((2 * tile ))))) (PreH21 : (packed_weights = (pw_tile_output (G) (group) (tile)))) ,
  ((( &( "scale" ) )) # Ptr  |-> scale_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "g" ) )) # UInt64  |-> g)
  **  ((( &( "nc" ) )) # UInt64  |-> nc)
  **  ((( &( "kc" ) )) # UInt64  |-> kc)
  **  ((( &( "extra_bytes" ) )) # UInt64  |-> extra_bytes)
  **  ((( &( "nr" ) )) # UInt64  |-> nr)
  **  ((( &( "kr" ) )) # UInt64  |-> kr)
  **  ((( &( "sr" ) )) # UInt64  |-> sr)
  **  ((( &( "group" ) )) # UInt64  |-> group)
  **  ((( &( "tile" ) )) # UInt64  |-> tile)
  **  ((( &( "n" ) )) # UInt64  |-> n)
  **  ((( &( "weights" ) )) # Ptr  |-> weights)
  **  ((( &( "w0" ) )) # Ptr  |-> w0)
  **  ((( &( "bias" ) )) # Ptr  |-> bias)
  **  ((( &( "packed_weights" ) )) # Ptr  |-> packed_weights)
  **  (pw_data F )
  **  (pw_output W (pw_tile_state (F) (G) (O) (group) (tile)) )
|--
  “ (pw_header_pre F W bias packed_weights 1 ) ”
) \/
(
forall (params_pre: Z) (scale_pre: Z) (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (packed_weights: Z) (bias: Z) (w0: Z) (weights: Z) (n: Z) (tile: Z) (group: Z) (sr: Z) (kr: Z) (nr: Z) (extra_bytes: Z) (kc: Z) (nc: Z) (g: Z) (PreH1 : (n <= UINT64_MAX)) (PreH2 : (tile <= UINT64_MAX)) (PreH3 : (group <= UINT64_MAX)) (PreH4 : (sr <= UINT64_MAX)) (PreH5 : (kr <= UINT64_MAX)) (PreH6 : (nr <= UINT64_MAX)) (PreH7 : (extra_bytes <= UINT64_MAX)) (PreH8 : (kc <= UINT64_MAX)) (PreH9 : (nc <= UINT64_MAX)) (PreH10 : (g <= UINT64_MAX)) (PreH11 : (n >= 0)) (PreH12 : (tile >= 0)) (PreH13 : (group >= 0)) (PreH14 : (sr >= 0)) (PreH15 : (kr >= 0)) (PreH16 : (nr >= 0)) (PreH17 : (extra_bytes >= 0)) (PreH18 : (kc >= 0)) (PreH19 : (nc >= 0)) (PreH20 : (g >= 0)) (PreH21 : (n <> 0)) (PreH22 : (n < 2)) (PreH23 : (g = (pw_groups (G)))) (PreH24 : (nc = (pw_channels (G)))) (PreH25 : (kc = (pw_depth (G)))) (PreH26 : (extra_bytes = (pw_extra_bytes (G)))) (PreH27 : (nr = 2)) (PreH28 : (kr = 1)) (PreH29 : (sr = 1)) (PreH30 : (pw_program_storage F W G )) (PreH31 : (0 <= group)) (PreH32 : (group < g)) (PreH33 : (0 <= tile)) (PreH34 : (tile <= (pw_tiles (G)))) (PreH35 : (n = (nc - (2 * tile ) ))) (PreH36 : (0 <= n)) (PreH37 : (n <= nc)) (PreH38 : (weights = (pw_group_weight (G) (group)))) (PreH39 : (w0 = (pw_tile_weight (G) (group) (tile)))) (PreH40 : (bias = (pw_bias_at (G) (group) ((2 * tile ))))) (PreH41 : (packed_weights = (pw_tile_output (G) (group) (tile)))) ,
  ((( &( "scale" ) )) # Ptr  |-> scale_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "g" ) )) # UInt64  |-> g)
  **  ((( &( "nc" ) )) # UInt64  |-> nc)
  **  ((( &( "kc" ) )) # UInt64  |-> kc)
  **  ((( &( "extra_bytes" ) )) # UInt64  |-> extra_bytes)
  **  ((( &( "nr" ) )) # UInt64  |-> nr)
  **  ((( &( "kr" ) )) # UInt64  |-> kr)
  **  ((( &( "sr" ) )) # UInt64  |-> sr)
  **  ((( &( "group" ) )) # UInt64  |-> group)
  **  ((( &( "tile" ) )) # UInt64  |-> tile)
  **  ((( &( "n" ) )) # UInt64  |-> n)
  **  ((( &( "weights" ) )) # Ptr  |-> weights)
  **  ((( &( "w0" ) )) # Ptr  |-> w0)
  **  ((( &( "bias" ) )) # Ptr  |-> bias)
  **  ((( &( "packed_weights" ) )) # Ptr  |-> packed_weights)
  **  (pw_data F )
  **  (pw_output W (pw_tile_state (F) (G) (O) (group) (tile)) )
|--
  “ (pw_header_pre F W bias packed_weights 1 ) ”
).

Definition test_rvv_partial_solve_wit_12_pure_split_goal_1 := 
forall (params_pre: Z) (scale_pre: Z) (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (packed_weights: Z) (bias: Z) (w0: Z) (weights: Z) (n: Z) (tile: Z) (group: Z) (sr: Z) (kr: Z) (nr: Z) (extra_bytes: Z) (kc: Z) (nc: Z) (g: Z) (PreH1 : (n <= UINT64_MAX)) (PreH2 : (tile <= UINT64_MAX)) (PreH3 : (group <= UINT64_MAX)) (PreH4 : (sr <= UINT64_MAX)) (PreH5 : (kr <= UINT64_MAX)) (PreH6 : (nr <= UINT64_MAX)) (PreH7 : (extra_bytes <= UINT64_MAX)) (PreH8 : (kc <= UINT64_MAX)) (PreH9 : (nc <= UINT64_MAX)) (PreH10 : (g <= UINT64_MAX)) (PreH11 : (n >= 0)) (PreH12 : (tile >= 0)) (PreH13 : (group >= 0)) (PreH14 : (sr >= 0)) (PreH15 : (kr >= 0)) (PreH16 : (nr >= 0)) (PreH17 : (extra_bytes >= 0)) (PreH18 : (kc >= 0)) (PreH19 : (nc >= 0)) (PreH20 : (g >= 0)) (PreH21 : (n <> 0)) (PreH22 : (n < 2)) (PreH23 : (g = (pw_groups (G)))) (PreH24 : (nc = (pw_channels (G)))) (PreH25 : (kc = (pw_depth (G)))) (PreH26 : (extra_bytes = (pw_extra_bytes (G)))) (PreH27 : (nr = 2)) (PreH28 : (kr = 1)) (PreH29 : (sr = 1)) (PreH30 : (pw_program_storage F W G )) (PreH31 : (0 <= group)) (PreH32 : (group < g)) (PreH33 : (0 <= tile)) (PreH34 : (tile <= (pw_tiles (G)))) (PreH35 : (n = (nc - (2 * tile ) ))) (PreH36 : (0 <= n)) (PreH37 : (n <= nc)) (PreH38 : (weights = (pw_group_weight (G) (group)))) (PreH39 : (w0 = (pw_tile_weight (G) (group) (tile)))) (PreH40 : (bias = (pw_bias_at (G) (group) ((2 * tile ))))) (PreH41 : (packed_weights = (pw_tile_output (G) (group) (tile)))) ,
  ((( &( "scale" ) )) # Ptr  |-> scale_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "g" ) )) # UInt64  |-> g)
  **  ((( &( "nc" ) )) # UInt64  |-> nc)
  **  ((( &( "kc" ) )) # UInt64  |-> kc)
  **  ((( &( "extra_bytes" ) )) # UInt64  |-> extra_bytes)
  **  ((( &( "nr" ) )) # UInt64  |-> nr)
  **  ((( &( "kr" ) )) # UInt64  |-> kr)
  **  ((( &( "sr" ) )) # UInt64  |-> sr)
  **  ((( &( "group" ) )) # UInt64  |-> group)
  **  ((( &( "tile" ) )) # UInt64  |-> tile)
  **  ((( &( "n" ) )) # UInt64  |-> n)
  **  ((( &( "weights" ) )) # Ptr  |-> weights)
  **  ((( &( "w0" ) )) # Ptr  |-> w0)
  **  ((( &( "bias" ) )) # Ptr  |-> bias)
  **  ((( &( "packed_weights" ) )) # Ptr  |-> packed_weights)
  **  (pw_data F )
  **  (pw_output W (pw_tile_state (F) (G) (O) (group) (tile)) )
|--
  “ (pw_header_pre F W bias packed_weights 1 ) ”
.

Definition test_rvv_partial_solve_wit_12_aux := 
forall (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (packed_weights: Z) (bias: Z) (w0: Z) (weights: Z) (n: Z) (tile: Z) (group: Z) (sr: Z) (kr: Z) (nr: Z) (extra_bytes: Z) (kc: Z) (nc: Z) (g: Z) (PreH1 : (n <> 0)) (PreH2 : (n < 2)) (PreH3 : (g = (pw_groups (G)))) (PreH4 : (nc = (pw_channels (G)))) (PreH5 : (kc = (pw_depth (G)))) (PreH6 : (extra_bytes = (pw_extra_bytes (G)))) (PreH7 : (nr = 2)) (PreH8 : (kr = 1)) (PreH9 : (sr = 1)) (PreH10 : (pw_program_storage F W G )) (PreH11 : (0 <= group)) (PreH12 : (group < g)) (PreH13 : (0 <= tile)) (PreH14 : (tile <= (pw_tiles (G)))) (PreH15 : (n = (nc - (2 * tile ) ))) (PreH16 : (0 <= n)) (PreH17 : (n <= nc)) (PreH18 : (weights = (pw_group_weight (G) (group)))) (PreH19 : (w0 = (pw_tile_weight (G) (group) (tile)))) (PreH20 : (bias = (pw_bias_at (G) (group) ((2 * tile ))))) (PreH21 : (packed_weights = (pw_tile_output (G) (group) (tile)))) ,
  (pw_data F )
  **  (pw_output W (pw_tile_state (F) (G) (O) (group) (tile)) )
|--
  “ (pw_header_pre F W bias packed_weights 1 ) ” 
  &&  “ (n <> 0) ” 
  &&  “ (n < 2) ” 
  &&  “ (g = (pw_groups (G))) ” 
  &&  “ (nc = (pw_channels (G))) ” 
  &&  “ (kc = (pw_depth (G))) ” 
  &&  “ (extra_bytes = (pw_extra_bytes (G))) ” 
  &&  “ (nr = 2) ” 
  &&  “ (kr = 1) ” 
  &&  “ (sr = 1) ” 
  &&  “ (pw_program_storage F W G ) ” 
  &&  “ (0 <= group) ” 
  &&  “ (group < g) ” 
  &&  “ (0 <= tile) ” 
  &&  “ (tile <= (pw_tiles (G))) ” 
  &&  “ (n = (nc - (2 * tile ) )) ” 
  &&  “ (0 <= n) ” 
  &&  “ (n <= nc) ” 
  &&  “ (weights = (pw_group_weight (G) (group))) ” 
  &&  “ (w0 = (pw_tile_weight (G) (group) (tile))) ” 
  &&  “ (bias = (pw_bias_at (G) (group) ((2 * tile )))) ” 
  &&  “ (packed_weights = (pw_tile_output (G) (group) (tile))) ”
  &&  (pw_data F )
  **  (pw_output W (pw_tile_state (F) (G) (O) (group) (tile)) )
.

Definition test_rvv_partial_solve_wit_12 := test_rvv_partial_solve_wit_12_pure -> test_rvv_partial_solve_wit_12_aux.

Definition test_rvv_partial_solve_wit_13_pure := 
(
forall (params_pre: Z) (scale_pre: Z) (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (packed_weights: Z) (bias: Z) (w0: Z) (weights: Z) (n: Z) (tile: Z) (group: Z) (sr: Z) (kr: Z) (nr: Z) (extra_bytes: Z) (kc: Z) (nc: Z) (g: Z) (PreH1 : (bias <> 0)) (PreH2 : (n <> 0)) (PreH3 : (n < 2)) (PreH4 : (g = (pw_groups (G)))) (PreH5 : (nc = (pw_channels (G)))) (PreH6 : (kc = (pw_depth (G)))) (PreH7 : (extra_bytes = (pw_extra_bytes (G)))) (PreH8 : (nr = 2)) (PreH9 : (kr = 1)) (PreH10 : (sr = 1)) (PreH11 : (pw_program_storage F W G )) (PreH12 : (0 <= group)) (PreH13 : (group < g)) (PreH14 : (0 <= tile)) (PreH15 : (tile <= (pw_tiles (G)))) (PreH16 : (n = (nc - (2 * tile ) ))) (PreH17 : (0 <= n)) (PreH18 : (n <= nc)) (PreH19 : (weights = (pw_group_weight (G) (group)))) (PreH20 : (w0 = (pw_tile_weight (G) (group) (tile)))) (PreH21 : (bias = (pw_bias_at (G) (group) ((2 * tile ))))) (PreH22 : (packed_weights = (pw_tile_output (G) (group) (tile)))) ,
  (pw_data F )
  **  (pw_output W (pw_header_run (F) (bias) (packed_weights) (1) ((pw_tile_state (F) (G) (O) (group) (tile)))) )
  **  ((( &( "scale" ) )) # Ptr  |-> scale_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "g" ) )) # UInt64  |-> g)
  **  ((( &( "nc" ) )) # UInt64  |-> nc)
  **  ((( &( "kc" ) )) # UInt64  |-> kc)
  **  ((( &( "extra_bytes" ) )) # UInt64  |-> extra_bytes)
  **  ((( &( "nr" ) )) # UInt64  |-> nr)
  **  ((( &( "kr" ) )) # UInt64  |-> kr)
  **  ((( &( "sr" ) )) # UInt64  |-> sr)
  **  ((( &( "group" ) )) # UInt64  |-> group)
  **  ((( &( "tile" ) )) # UInt64  |-> tile)
  **  ((( &( "n" ) )) # UInt64  |-> n)
  **  ((( &( "weights" ) )) # Ptr  |-> weights)
  **  ((( &( "w0" ) )) # Ptr  |-> w0)
  **  ((( &( "bias" ) )) # Ptr  |-> (bias + (1 * sizeof(UINT))))
  **  ((( &( "packed_weights" ) )) # Ptr  |-> (packed_weights + (2 * sizeof(UINT))))
|--
  “ (pw_odd_pre F W w0 (packed_weights + (2 * sizeof(UINT))) kc ) ”
) \/
(
forall (params_pre: Z) (scale_pre: Z) (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (packed_weights: Z) (bias: Z) (w0: Z) (weights: Z) (n: Z) (tile: Z) (group: Z) (sr: Z) (kr: Z) (nr: Z) (extra_bytes: Z) (kc: Z) (nc: Z) (g: Z) (PreH1 : (n <= UINT64_MAX)) (PreH2 : (tile <= UINT64_MAX)) (PreH3 : (group <= UINT64_MAX)) (PreH4 : (sr <= UINT64_MAX)) (PreH5 : (kr <= UINT64_MAX)) (PreH6 : (nr <= UINT64_MAX)) (PreH7 : (extra_bytes <= UINT64_MAX)) (PreH8 : (kc <= UINT64_MAX)) (PreH9 : (nc <= UINT64_MAX)) (PreH10 : (g <= UINT64_MAX)) (PreH11 : (n >= 0)) (PreH12 : (tile >= 0)) (PreH13 : (group >= 0)) (PreH14 : (sr >= 0)) (PreH15 : (kr >= 0)) (PreH16 : (nr >= 0)) (PreH17 : (extra_bytes >= 0)) (PreH18 : (kc >= 0)) (PreH19 : (nc >= 0)) (PreH20 : (g >= 0)) (PreH21 : (bias <> 0)) (PreH22 : (n <> 0)) (PreH23 : (n < 2)) (PreH24 : (g = (pw_groups (G)))) (PreH25 : (nc = (pw_channels (G)))) (PreH26 : (kc = (pw_depth (G)))) (PreH27 : (extra_bytes = (pw_extra_bytes (G)))) (PreH28 : (nr = 2)) (PreH29 : (kr = 1)) (PreH30 : (sr = 1)) (PreH31 : (pw_program_storage F W G )) (PreH32 : (0 <= group)) (PreH33 : (group < g)) (PreH34 : (0 <= tile)) (PreH35 : (tile <= (pw_tiles (G)))) (PreH36 : (n = (nc - (2 * tile ) ))) (PreH37 : (0 <= n)) (PreH38 : (n <= nc)) (PreH39 : (weights = (pw_group_weight (G) (group)))) (PreH40 : (w0 = (pw_tile_weight (G) (group) (tile)))) (PreH41 : (bias = (pw_bias_at (G) (group) ((2 * tile ))))) (PreH42 : (packed_weights = (pw_tile_output (G) (group) (tile)))) ,
  (pw_data F )
  **  (pw_output W (pw_header_run (F) (bias) (packed_weights) (1) ((pw_tile_state (F) (G) (O) (group) (tile)))) )
  **  ((( &( "scale" ) )) # Ptr  |-> scale_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "g" ) )) # UInt64  |-> g)
  **  ((( &( "nc" ) )) # UInt64  |-> nc)
  **  ((( &( "kc" ) )) # UInt64  |-> kc)
  **  ((( &( "extra_bytes" ) )) # UInt64  |-> extra_bytes)
  **  ((( &( "nr" ) )) # UInt64  |-> nr)
  **  ((( &( "kr" ) )) # UInt64  |-> kr)
  **  ((( &( "sr" ) )) # UInt64  |-> sr)
  **  ((( &( "group" ) )) # UInt64  |-> group)
  **  ((( &( "tile" ) )) # UInt64  |-> tile)
  **  ((( &( "n" ) )) # UInt64  |-> n)
  **  ((( &( "weights" ) )) # Ptr  |-> weights)
  **  ((( &( "w0" ) )) # Ptr  |-> w0)
  **  ((( &( "bias" ) )) # Ptr  |-> (bias + (1 * sizeof(UINT))))
  **  ((( &( "packed_weights" ) )) # Ptr  |-> (packed_weights + (2 * sizeof(UINT))))
|--
  “ (pw_odd_pre F W w0 (packed_weights + (2 * sizeof(UINT))) kc ) ”
).

Definition test_rvv_partial_solve_wit_13_pure_split_goal_1 := 
forall (params_pre: Z) (scale_pre: Z) (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (packed_weights: Z) (bias: Z) (w0: Z) (weights: Z) (n: Z) (tile: Z) (group: Z) (sr: Z) (kr: Z) (nr: Z) (extra_bytes: Z) (kc: Z) (nc: Z) (g: Z) (PreH1 : (n <= UINT64_MAX)) (PreH2 : (tile <= UINT64_MAX)) (PreH3 : (group <= UINT64_MAX)) (PreH4 : (sr <= UINT64_MAX)) (PreH5 : (kr <= UINT64_MAX)) (PreH6 : (nr <= UINT64_MAX)) (PreH7 : (extra_bytes <= UINT64_MAX)) (PreH8 : (kc <= UINT64_MAX)) (PreH9 : (nc <= UINT64_MAX)) (PreH10 : (g <= UINT64_MAX)) (PreH11 : (n >= 0)) (PreH12 : (tile >= 0)) (PreH13 : (group >= 0)) (PreH14 : (sr >= 0)) (PreH15 : (kr >= 0)) (PreH16 : (nr >= 0)) (PreH17 : (extra_bytes >= 0)) (PreH18 : (kc >= 0)) (PreH19 : (nc >= 0)) (PreH20 : (g >= 0)) (PreH21 : (bias <> 0)) (PreH22 : (n <> 0)) (PreH23 : (n < 2)) (PreH24 : (g = (pw_groups (G)))) (PreH25 : (nc = (pw_channels (G)))) (PreH26 : (kc = (pw_depth (G)))) (PreH27 : (extra_bytes = (pw_extra_bytes (G)))) (PreH28 : (nr = 2)) (PreH29 : (kr = 1)) (PreH30 : (sr = 1)) (PreH31 : (pw_program_storage F W G )) (PreH32 : (0 <= group)) (PreH33 : (group < g)) (PreH34 : (0 <= tile)) (PreH35 : (tile <= (pw_tiles (G)))) (PreH36 : (n = (nc - (2 * tile ) ))) (PreH37 : (0 <= n)) (PreH38 : (n <= nc)) (PreH39 : (weights = (pw_group_weight (G) (group)))) (PreH40 : (w0 = (pw_tile_weight (G) (group) (tile)))) (PreH41 : (bias = (pw_bias_at (G) (group) ((2 * tile ))))) (PreH42 : (packed_weights = (pw_tile_output (G) (group) (tile)))) ,
  (pw_data F )
  **  (pw_output W (pw_header_run (F) (bias) (packed_weights) (1) ((pw_tile_state (F) (G) (O) (group) (tile)))) )
  **  ((( &( "scale" ) )) # Ptr  |-> scale_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "g" ) )) # UInt64  |-> g)
  **  ((( &( "nc" ) )) # UInt64  |-> nc)
  **  ((( &( "kc" ) )) # UInt64  |-> kc)
  **  ((( &( "extra_bytes" ) )) # UInt64  |-> extra_bytes)
  **  ((( &( "nr" ) )) # UInt64  |-> nr)
  **  ((( &( "kr" ) )) # UInt64  |-> kr)
  **  ((( &( "sr" ) )) # UInt64  |-> sr)
  **  ((( &( "group" ) )) # UInt64  |-> group)
  **  ((( &( "tile" ) )) # UInt64  |-> tile)
  **  ((( &( "n" ) )) # UInt64  |-> n)
  **  ((( &( "weights" ) )) # Ptr  |-> weights)
  **  ((( &( "w0" ) )) # Ptr  |-> w0)
  **  ((( &( "bias" ) )) # Ptr  |-> (bias + (1 * sizeof(UINT))))
  **  ((( &( "packed_weights" ) )) # Ptr  |-> (packed_weights + (2 * sizeof(UINT))))
|--
  “ (pw_odd_pre F W w0 (packed_weights + (2 * sizeof(UINT))) kc ) ”
.

Definition test_rvv_partial_solve_wit_13_aux := 
forall (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (packed_weights: Z) (bias: Z) (w0: Z) (weights: Z) (n: Z) (tile: Z) (group: Z) (sr: Z) (kr: Z) (nr: Z) (extra_bytes: Z) (kc: Z) (nc: Z) (g: Z) (PreH1 : (bias <> 0)) (PreH2 : (n <> 0)) (PreH3 : (n < 2)) (PreH4 : (g = (pw_groups (G)))) (PreH5 : (nc = (pw_channels (G)))) (PreH6 : (kc = (pw_depth (G)))) (PreH7 : (extra_bytes = (pw_extra_bytes (G)))) (PreH8 : (nr = 2)) (PreH9 : (kr = 1)) (PreH10 : (sr = 1)) (PreH11 : (pw_program_storage F W G )) (PreH12 : (0 <= group)) (PreH13 : (group < g)) (PreH14 : (0 <= tile)) (PreH15 : (tile <= (pw_tiles (G)))) (PreH16 : (n = (nc - (2 * tile ) ))) (PreH17 : (0 <= n)) (PreH18 : (n <= nc)) (PreH19 : (weights = (pw_group_weight (G) (group)))) (PreH20 : (w0 = (pw_tile_weight (G) (group) (tile)))) (PreH21 : (bias = (pw_bias_at (G) (group) ((2 * tile ))))) (PreH22 : (packed_weights = (pw_tile_output (G) (group) (tile)))) ,
  (pw_data F )
  **  (pw_output W (pw_header_run (F) (bias) (packed_weights) (1) ((pw_tile_state (F) (G) (O) (group) (tile)))) )
|--
  “ (pw_odd_pre F W w0 (packed_weights + (2 * sizeof(UINT))) kc ) ” 
  &&  “ (bias <> 0) ” 
  &&  “ (n <> 0) ” 
  &&  “ (n < 2) ” 
  &&  “ (g = (pw_groups (G))) ” 
  &&  “ (nc = (pw_channels (G))) ” 
  &&  “ (kc = (pw_depth (G))) ” 
  &&  “ (extra_bytes = (pw_extra_bytes (G))) ” 
  &&  “ (nr = 2) ” 
  &&  “ (kr = 1) ” 
  &&  “ (sr = 1) ” 
  &&  “ (pw_program_storage F W G ) ” 
  &&  “ (0 <= group) ” 
  &&  “ (group < g) ” 
  &&  “ (0 <= tile) ” 
  &&  “ (tile <= (pw_tiles (G))) ” 
  &&  “ (n = (nc - (2 * tile ) )) ” 
  &&  “ (0 <= n) ” 
  &&  “ (n <= nc) ” 
  &&  “ (weights = (pw_group_weight (G) (group))) ” 
  &&  “ (w0 = (pw_tile_weight (G) (group) (tile))) ” 
  &&  “ (bias = (pw_bias_at (G) (group) ((2 * tile )))) ” 
  &&  “ (packed_weights = (pw_tile_output (G) (group) (tile))) ”
  &&  (pw_data F )
  **  (pw_output W (pw_header_run (F) ((pw_bias_at (G) (group) ((2 * tile )))) ((pw_tile_output (G) (group) (tile))) (1) ((pw_tile_state (F) (G) (O) (group) (tile)))) )
.

Definition test_rvv_partial_solve_wit_13 := test_rvv_partial_solve_wit_13_pure -> test_rvv_partial_solve_wit_13_aux.

Definition test_rvv_partial_solve_wit_14_pure := 
(
forall (params_pre: Z) (scale_pre: Z) (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (packed_weights: Z) (bias: Z) (w0: Z) (weights: Z) (n: Z) (tile: Z) (group: Z) (sr: Z) (kr: Z) (nr: Z) (extra_bytes: Z) (kc: Z) (nc: Z) (g: Z) (PreH1 : (bias = 0)) (PreH2 : (n <> 0)) (PreH3 : (n < 2)) (PreH4 : (g = (pw_groups (G)))) (PreH5 : (nc = (pw_channels (G)))) (PreH6 : (kc = (pw_depth (G)))) (PreH7 : (extra_bytes = (pw_extra_bytes (G)))) (PreH8 : (nr = 2)) (PreH9 : (kr = 1)) (PreH10 : (sr = 1)) (PreH11 : (pw_program_storage F W G )) (PreH12 : (0 <= group)) (PreH13 : (group < g)) (PreH14 : (0 <= tile)) (PreH15 : (tile <= (pw_tiles (G)))) (PreH16 : (n = (nc - (2 * tile ) ))) (PreH17 : (0 <= n)) (PreH18 : (n <= nc)) (PreH19 : (weights = (pw_group_weight (G) (group)))) (PreH20 : (w0 = (pw_tile_weight (G) (group) (tile)))) (PreH21 : (bias = (pw_bias_at (G) (group) ((2 * tile ))))) (PreH22 : (packed_weights = (pw_tile_output (G) (group) (tile)))) ,
  (pw_data F )
  **  (pw_output W (pw_header_run (F) (bias) (packed_weights) (1) ((pw_tile_state (F) (G) (O) (group) (tile)))) )
  **  ((( &( "scale" ) )) # Ptr  |-> scale_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "g" ) )) # UInt64  |-> g)
  **  ((( &( "nc" ) )) # UInt64  |-> nc)
  **  ((( &( "kc" ) )) # UInt64  |-> kc)
  **  ((( &( "extra_bytes" ) )) # UInt64  |-> extra_bytes)
  **  ((( &( "nr" ) )) # UInt64  |-> nr)
  **  ((( &( "kr" ) )) # UInt64  |-> kr)
  **  ((( &( "sr" ) )) # UInt64  |-> sr)
  **  ((( &( "group" ) )) # UInt64  |-> group)
  **  ((( &( "tile" ) )) # UInt64  |-> tile)
  **  ((( &( "n" ) )) # UInt64  |-> n)
  **  ((( &( "weights" ) )) # Ptr  |-> weights)
  **  ((( &( "w0" ) )) # Ptr  |-> w0)
  **  ((( &( "bias" ) )) # Ptr  |-> bias)
  **  ((( &( "packed_weights" ) )) # Ptr  |-> (packed_weights + (2 * sizeof(UINT))))
|--
  “ (pw_odd_pre F W w0 (packed_weights + (2 * sizeof(UINT))) kc ) ”
) \/
(
forall (params_pre: Z) (scale_pre: Z) (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (packed_weights: Z) (bias: Z) (w0: Z) (weights: Z) (n: Z) (tile: Z) (group: Z) (sr: Z) (kr: Z) (nr: Z) (extra_bytes: Z) (kc: Z) (nc: Z) (g: Z) (PreH1 : (n <= UINT64_MAX)) (PreH2 : (tile <= UINT64_MAX)) (PreH3 : (group <= UINT64_MAX)) (PreH4 : (sr <= UINT64_MAX)) (PreH5 : (kr <= UINT64_MAX)) (PreH6 : (nr <= UINT64_MAX)) (PreH7 : (extra_bytes <= UINT64_MAX)) (PreH8 : (kc <= UINT64_MAX)) (PreH9 : (nc <= UINT64_MAX)) (PreH10 : (g <= UINT64_MAX)) (PreH11 : (n >= 0)) (PreH12 : (tile >= 0)) (PreH13 : (group >= 0)) (PreH14 : (sr >= 0)) (PreH15 : (kr >= 0)) (PreH16 : (nr >= 0)) (PreH17 : (extra_bytes >= 0)) (PreH18 : (kc >= 0)) (PreH19 : (nc >= 0)) (PreH20 : (g >= 0)) (PreH21 : (bias = 0)) (PreH22 : (n <> 0)) (PreH23 : (n < 2)) (PreH24 : (g = (pw_groups (G)))) (PreH25 : (nc = (pw_channels (G)))) (PreH26 : (kc = (pw_depth (G)))) (PreH27 : (extra_bytes = (pw_extra_bytes (G)))) (PreH28 : (nr = 2)) (PreH29 : (kr = 1)) (PreH30 : (sr = 1)) (PreH31 : (pw_program_storage F W G )) (PreH32 : (0 <= group)) (PreH33 : (group < g)) (PreH34 : (0 <= tile)) (PreH35 : (tile <= (pw_tiles (G)))) (PreH36 : (n = (nc - (2 * tile ) ))) (PreH37 : (0 <= n)) (PreH38 : (n <= nc)) (PreH39 : (weights = (pw_group_weight (G) (group)))) (PreH40 : (w0 = (pw_tile_weight (G) (group) (tile)))) (PreH41 : (bias = (pw_bias_at (G) (group) ((2 * tile ))))) (PreH42 : (packed_weights = (pw_tile_output (G) (group) (tile)))) ,
  (pw_data F )
  **  (pw_output W (pw_header_run (F) (bias) (packed_weights) (1) ((pw_tile_state (F) (G) (O) (group) (tile)))) )
  **  ((( &( "scale" ) )) # Ptr  |-> scale_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "g" ) )) # UInt64  |-> g)
  **  ((( &( "nc" ) )) # UInt64  |-> nc)
  **  ((( &( "kc" ) )) # UInt64  |-> kc)
  **  ((( &( "extra_bytes" ) )) # UInt64  |-> extra_bytes)
  **  ((( &( "nr" ) )) # UInt64  |-> nr)
  **  ((( &( "kr" ) )) # UInt64  |-> kr)
  **  ((( &( "sr" ) )) # UInt64  |-> sr)
  **  ((( &( "group" ) )) # UInt64  |-> group)
  **  ((( &( "tile" ) )) # UInt64  |-> tile)
  **  ((( &( "n" ) )) # UInt64  |-> n)
  **  ((( &( "weights" ) )) # Ptr  |-> weights)
  **  ((( &( "w0" ) )) # Ptr  |-> w0)
  **  ((( &( "bias" ) )) # Ptr  |-> bias)
  **  ((( &( "packed_weights" ) )) # Ptr  |-> (packed_weights + (2 * sizeof(UINT))))
|--
  “ (pw_odd_pre F W w0 (packed_weights + (2 * sizeof(UINT))) kc ) ”
).

Definition test_rvv_partial_solve_wit_14_pure_split_goal_1 := 
forall (params_pre: Z) (scale_pre: Z) (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (packed_weights: Z) (bias: Z) (w0: Z) (weights: Z) (n: Z) (tile: Z) (group: Z) (sr: Z) (kr: Z) (nr: Z) (extra_bytes: Z) (kc: Z) (nc: Z) (g: Z) (PreH1 : (n <= UINT64_MAX)) (PreH2 : (tile <= UINT64_MAX)) (PreH3 : (group <= UINT64_MAX)) (PreH4 : (sr <= UINT64_MAX)) (PreH5 : (kr <= UINT64_MAX)) (PreH6 : (nr <= UINT64_MAX)) (PreH7 : (extra_bytes <= UINT64_MAX)) (PreH8 : (kc <= UINT64_MAX)) (PreH9 : (nc <= UINT64_MAX)) (PreH10 : (g <= UINT64_MAX)) (PreH11 : (n >= 0)) (PreH12 : (tile >= 0)) (PreH13 : (group >= 0)) (PreH14 : (sr >= 0)) (PreH15 : (kr >= 0)) (PreH16 : (nr >= 0)) (PreH17 : (extra_bytes >= 0)) (PreH18 : (kc >= 0)) (PreH19 : (nc >= 0)) (PreH20 : (g >= 0)) (PreH21 : (bias = 0)) (PreH22 : (n <> 0)) (PreH23 : (n < 2)) (PreH24 : (g = (pw_groups (G)))) (PreH25 : (nc = (pw_channels (G)))) (PreH26 : (kc = (pw_depth (G)))) (PreH27 : (extra_bytes = (pw_extra_bytes (G)))) (PreH28 : (nr = 2)) (PreH29 : (kr = 1)) (PreH30 : (sr = 1)) (PreH31 : (pw_program_storage F W G )) (PreH32 : (0 <= group)) (PreH33 : (group < g)) (PreH34 : (0 <= tile)) (PreH35 : (tile <= (pw_tiles (G)))) (PreH36 : (n = (nc - (2 * tile ) ))) (PreH37 : (0 <= n)) (PreH38 : (n <= nc)) (PreH39 : (weights = (pw_group_weight (G) (group)))) (PreH40 : (w0 = (pw_tile_weight (G) (group) (tile)))) (PreH41 : (bias = (pw_bias_at (G) (group) ((2 * tile ))))) (PreH42 : (packed_weights = (pw_tile_output (G) (group) (tile)))) ,
  (pw_data F )
  **  (pw_output W (pw_header_run (F) (bias) (packed_weights) (1) ((pw_tile_state (F) (G) (O) (group) (tile)))) )
  **  ((( &( "scale" ) )) # Ptr  |-> scale_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "g" ) )) # UInt64  |-> g)
  **  ((( &( "nc" ) )) # UInt64  |-> nc)
  **  ((( &( "kc" ) )) # UInt64  |-> kc)
  **  ((( &( "extra_bytes" ) )) # UInt64  |-> extra_bytes)
  **  ((( &( "nr" ) )) # UInt64  |-> nr)
  **  ((( &( "kr" ) )) # UInt64  |-> kr)
  **  ((( &( "sr" ) )) # UInt64  |-> sr)
  **  ((( &( "group" ) )) # UInt64  |-> group)
  **  ((( &( "tile" ) )) # UInt64  |-> tile)
  **  ((( &( "n" ) )) # UInt64  |-> n)
  **  ((( &( "weights" ) )) # Ptr  |-> weights)
  **  ((( &( "w0" ) )) # Ptr  |-> w0)
  **  ((( &( "bias" ) )) # Ptr  |-> bias)
  **  ((( &( "packed_weights" ) )) # Ptr  |-> (packed_weights + (2 * sizeof(UINT))))
|--
  “ (pw_odd_pre F W w0 (packed_weights + (2 * sizeof(UINT))) kc ) ”
.

Definition test_rvv_partial_solve_wit_14_aux := 
forall (O: PWOutput) (G: PWCall) (W: (@list Z)) (F: PWMap) (packed_weights: Z) (bias: Z) (w0: Z) (weights: Z) (n: Z) (tile: Z) (group: Z) (sr: Z) (kr: Z) (nr: Z) (extra_bytes: Z) (kc: Z) (nc: Z) (g: Z) (PreH1 : (bias = 0)) (PreH2 : (n <> 0)) (PreH3 : (n < 2)) (PreH4 : (g = (pw_groups (G)))) (PreH5 : (nc = (pw_channels (G)))) (PreH6 : (kc = (pw_depth (G)))) (PreH7 : (extra_bytes = (pw_extra_bytes (G)))) (PreH8 : (nr = 2)) (PreH9 : (kr = 1)) (PreH10 : (sr = 1)) (PreH11 : (pw_program_storage F W G )) (PreH12 : (0 <= group)) (PreH13 : (group < g)) (PreH14 : (0 <= tile)) (PreH15 : (tile <= (pw_tiles (G)))) (PreH16 : (n = (nc - (2 * tile ) ))) (PreH17 : (0 <= n)) (PreH18 : (n <= nc)) (PreH19 : (weights = (pw_group_weight (G) (group)))) (PreH20 : (w0 = (pw_tile_weight (G) (group) (tile)))) (PreH21 : (bias = (pw_bias_at (G) (group) ((2 * tile ))))) (PreH22 : (packed_weights = (pw_tile_output (G) (group) (tile)))) ,
  (pw_data F )
  **  (pw_output W (pw_header_run (F) (bias) (packed_weights) (1) ((pw_tile_state (F) (G) (O) (group) (tile)))) )
|--
  “ (pw_odd_pre F W w0 (packed_weights + (2 * sizeof(UINT))) kc ) ” 
  &&  “ (bias = 0) ” 
  &&  “ (n <> 0) ” 
  &&  “ (n < 2) ” 
  &&  “ (g = (pw_groups (G))) ” 
  &&  “ (nc = (pw_channels (G))) ” 
  &&  “ (kc = (pw_depth (G))) ” 
  &&  “ (extra_bytes = (pw_extra_bytes (G))) ” 
  &&  “ (nr = 2) ” 
  &&  “ (kr = 1) ” 
  &&  “ (sr = 1) ” 
  &&  “ (pw_program_storage F W G ) ” 
  &&  “ (0 <= group) ” 
  &&  “ (group < g) ” 
  &&  “ (0 <= tile) ” 
  &&  “ (tile <= (pw_tiles (G))) ” 
  &&  “ (n = (nc - (2 * tile ) )) ” 
  &&  “ (0 <= n) ” 
  &&  “ (n <= nc) ” 
  &&  “ (weights = (pw_group_weight (G) (group))) ” 
  &&  “ (w0 = (pw_tile_weight (G) (group) (tile))) ” 
  &&  “ (bias = (pw_bias_at (G) (group) ((2 * tile )))) ” 
  &&  “ (packed_weights = (pw_tile_output (G) (group) (tile))) ”
  &&  (pw_data F )
  **  (pw_output W (pw_header_run (F) (0) ((pw_tile_output (G) (group) (tile))) (1) ((pw_tile_state (F) (G) (O) (group) (tile)))) )
.

Definition test_rvv_partial_solve_wit_14 := test_rvv_partial_solve_wit_14_pure -> test_rvv_partial_solve_wit_14_aux.

Module Type VC_Correct.


Axiom proof_of_test_rvv_safety_wit_1 : test_rvv_safety_wit_1.
Axiom proof_of_test_rvv_safety_wit_2 : test_rvv_safety_wit_2.
Axiom proof_of_test_rvv_safety_wit_3 : test_rvv_safety_wit_3.
Axiom proof_of_test_rvv_safety_wit_4 : test_rvv_safety_wit_4.
Axiom proof_of_test_rvv_safety_wit_5 : test_rvv_safety_wit_5.
Axiom proof_of_test_rvv_safety_wit_6 : test_rvv_safety_wit_6.
Axiom proof_of_test_rvv_safety_wit_7 : test_rvv_safety_wit_7.
Axiom proof_of_test_rvv_safety_wit_8 : test_rvv_safety_wit_8.
Axiom proof_of_test_rvv_safety_wit_9 : test_rvv_safety_wit_9.
Axiom proof_of_test_rvv_safety_wit_10 : test_rvv_safety_wit_10.
Axiom proof_of_test_rvv_safety_wit_11 : test_rvv_safety_wit_11.
Axiom proof_of_test_rvv_safety_wit_12 : test_rvv_safety_wit_12.
Axiom proof_of_test_rvv_safety_wit_13 : test_rvv_safety_wit_13.
Axiom proof_of_test_rvv_safety_wit_14 : test_rvv_safety_wit_14.
Axiom proof_of_test_rvv_safety_wit_15 : test_rvv_safety_wit_15.
Axiom proof_of_test_rvv_safety_wit_16 : test_rvv_safety_wit_16.
Axiom proof_of_test_rvv_safety_wit_17 : test_rvv_safety_wit_17.
Axiom proof_of_test_rvv_safety_wit_18 : test_rvv_safety_wit_18.
Axiom proof_of_test_rvv_safety_wit_19 : test_rvv_safety_wit_19.
Axiom proof_of_test_rvv_safety_wit_20 : test_rvv_safety_wit_20.
Axiom proof_of_test_rvv_safety_wit_21 : test_rvv_safety_wit_21.
Axiom proof_of_test_rvv_safety_wit_22 : test_rvv_safety_wit_22.
Axiom proof_of_test_rvv_safety_wit_23 : test_rvv_safety_wit_23.
Axiom proof_of_test_rvv_safety_wit_24 : test_rvv_safety_wit_24.
Axiom proof_of_test_rvv_safety_wit_25 : test_rvv_safety_wit_25.
Axiom proof_of_test_rvv_safety_wit_26 : test_rvv_safety_wit_26.
Axiom proof_of_test_rvv_safety_wit_27 : test_rvv_safety_wit_27.
Axiom proof_of_test_rvv_safety_wit_28 : test_rvv_safety_wit_28.
Axiom proof_of_test_rvv_safety_wit_29 : test_rvv_safety_wit_29.
Axiom proof_of_test_rvv_safety_wit_30 : test_rvv_safety_wit_30.
Axiom proof_of_test_rvv_safety_wit_31 : test_rvv_safety_wit_31.
Axiom proof_of_test_rvv_safety_wit_32 : test_rvv_safety_wit_32.
Axiom proof_of_test_rvv_safety_wit_33 : test_rvv_safety_wit_33.
Axiom proof_of_test_rvv_safety_wit_34 : test_rvv_safety_wit_34.
Axiom proof_of_test_rvv_safety_wit_35 : test_rvv_safety_wit_35.
Axiom proof_of_test_rvv_safety_wit_36 : test_rvv_safety_wit_36.
Axiom proof_of_test_rvv_safety_wit_37 : test_rvv_safety_wit_37.
Axiom proof_of_test_rvv_safety_wit_38 : test_rvv_safety_wit_38.
Axiom proof_of_test_rvv_safety_wit_39 : test_rvv_safety_wit_39.
Axiom proof_of_test_rvv_safety_wit_40 : test_rvv_safety_wit_40.
Axiom proof_of_test_rvv_safety_wit_41 : test_rvv_safety_wit_41.
Axiom proof_of_test_rvv_safety_wit_42 : test_rvv_safety_wit_42.
Axiom proof_of_test_rvv_safety_wit_43 : test_rvv_safety_wit_43.
Axiom proof_of_test_rvv_entail_wit_1 : test_rvv_entail_wit_1.
Axiom proof_of_test_rvv_entail_wit_2 : test_rvv_entail_wit_2.
Axiom proof_of_test_rvv_entail_wit_3_1 : test_rvv_entail_wit_3_1.
Axiom proof_of_test_rvv_entail_wit_3_2 : test_rvv_entail_wit_3_2.
Axiom proof_of_test_rvv_entail_wit_4_1 : test_rvv_entail_wit_4_1.
Axiom proof_of_test_rvv_entail_wit_4_2 : test_rvv_entail_wit_4_2.
Axiom proof_of_test_rvv_entail_wit_4_3 : test_rvv_entail_wit_4_3.
Axiom proof_of_test_rvv_return_wit_1 : test_rvv_return_wit_1.
Axiom proof_of_test_rvv_partial_solve_wit_1_pure : test_rvv_partial_solve_wit_1_pure.
Axiom proof_of_test_rvv_partial_solve_wit_1 : test_rvv_partial_solve_wit_1.
Axiom proof_of_test_rvv_partial_solve_wit_2_pure : test_rvv_partial_solve_wit_2_pure.
Axiom proof_of_test_rvv_partial_solve_wit_2 : test_rvv_partial_solve_wit_2.
Axiom proof_of_test_rvv_partial_solve_wit_3_pure : test_rvv_partial_solve_wit_3_pure.
Axiom proof_of_test_rvv_partial_solve_wit_3 : test_rvv_partial_solve_wit_3.
Axiom proof_of_test_rvv_partial_solve_wit_4_pure : test_rvv_partial_solve_wit_4_pure.
Axiom proof_of_test_rvv_partial_solve_wit_4 : test_rvv_partial_solve_wit_4.
Axiom proof_of_test_rvv_partial_solve_wit_5_pure : test_rvv_partial_solve_wit_5_pure.
Axiom proof_of_test_rvv_partial_solve_wit_5 : test_rvv_partial_solve_wit_5.
Axiom proof_of_test_rvv_partial_solve_wit_6_pure : test_rvv_partial_solve_wit_6_pure.
Axiom proof_of_test_rvv_partial_solve_wit_6 : test_rvv_partial_solve_wit_6.
Axiom proof_of_test_rvv_partial_solve_wit_7_pure : test_rvv_partial_solve_wit_7_pure.
Axiom proof_of_test_rvv_partial_solve_wit_7 : test_rvv_partial_solve_wit_7.
Axiom proof_of_test_rvv_partial_solve_wit_8_pure : test_rvv_partial_solve_wit_8_pure.
Axiom proof_of_test_rvv_partial_solve_wit_8 : test_rvv_partial_solve_wit_8.
Axiom proof_of_test_rvv_partial_solve_wit_9_pure : test_rvv_partial_solve_wit_9_pure.
Axiom proof_of_test_rvv_partial_solve_wit_9 : test_rvv_partial_solve_wit_9.
Axiom proof_of_test_rvv_partial_solve_wit_10_pure : test_rvv_partial_solve_wit_10_pure.
Axiom proof_of_test_rvv_partial_solve_wit_10 : test_rvv_partial_solve_wit_10.
Axiom proof_of_test_rvv_partial_solve_wit_11_pure : test_rvv_partial_solve_wit_11_pure.
Axiom proof_of_test_rvv_partial_solve_wit_11 : test_rvv_partial_solve_wit_11.
Axiom proof_of_test_rvv_partial_solve_wit_12_pure : test_rvv_partial_solve_wit_12_pure.
Axiom proof_of_test_rvv_partial_solve_wit_12 : test_rvv_partial_solve_wit_12.
Axiom proof_of_test_rvv_partial_solve_wit_13_pure : test_rvv_partial_solve_wit_13_pure.
Axiom proof_of_test_rvv_partial_solve_wit_13 : test_rvv_partial_solve_wit_13.
Axiom proof_of_test_rvv_partial_solve_wit_14_pure : test_rvv_partial_solve_wit_14_pure.
Axiom proof_of_test_rvv_partial_solve_wit_14 : test_rvv_partial_solve_wit_14.

End VC_Correct.
