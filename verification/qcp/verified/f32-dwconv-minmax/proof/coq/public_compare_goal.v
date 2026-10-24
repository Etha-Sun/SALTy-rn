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
Require Import Dwconv.MemoryInterface.
Require Import Dwconv.OutputReadModel.
Require Import Dwconv.WrittenReadModel.
Require Import NanBridge.BridgeLogic.
Require Import Dwconv.PublicModel.
Local Open Scope sac.

(*----- Function compare_outputs -----*)

Definition compare_outputs_safety_wit_1 := 
forall (O2: DwOutput) (O1: DwOutput) (W2: (@list Z)) (W1: (@list Z)) (out2: Z) (D: DwProgram) (right: Z) (left: Z) (pixels: Z) (output_increment: Z) (output_width: Z) (channels: Z) (PreH1 : (channels = (dw_channels (D)))) (PreH2 : (output_width = (dw_width (D)))) (PreH3 : (output_increment = (dw_out_increment (D)))) (PreH4 : (0 < channels)) (PreH5 : (0 < output_width)) (PreH6 : (dw_distinct W1 )) (PreH7 : (dw_distinct W2 )) (PreH8 : (dw_output_domain W1 D )) (PreH9 : (dw_output_domain W2 (dw_rebase (D) (out2)) )) (PreH10 : (dw_pair_observed D out2 O1 O2 )) (PreH11 : (0 <= pixels)) (PreH12 : (pixels <= output_width)) (PreH13 : (left = (dw_output_at (D) ((output_width - pixels ))))) (PreH14 : (right = (dw_output_at ((dw_rebase (D) (out2))) ((output_width - pixels ))))) ,
  ((( &( "channels" ) )) # UInt64  |-> channels)
  **  ((( &( "output_width" ) )) # UInt64  |-> output_width)
  **  ((( &( "output_increment" ) )) # UInt64  |-> output_increment)
  **  ((( &( "pixels" ) )) # UInt64  |-> pixels)
  **  ((( &( "left" ) )) # Ptr  |-> left)
  **  ((( &( "right" ) )) # Ptr  |-> right)
  **  (dw_output W1 O1 )
  **  (dw_output W2 O2 )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition compare_outputs_safety_wit_2 := 
forall (O2: DwOutput) (O1: DwOutput) (W2: (@list Z)) (W1: (@list Z)) (out2: Z) (D: DwProgram) (right: Z) (left: Z) (remaining: Z) (pixels: Z) (output_increment: Z) (output_width: Z) (channels: Z) (PreH1 : (channels = (dw_channels (D)))) (PreH2 : (output_width = (dw_width (D)))) (PreH3 : (output_increment = (dw_out_increment (D)))) (PreH4 : (0 < channels)) (PreH5 : (0 < output_width)) (PreH6 : (dw_distinct W1 )) (PreH7 : (dw_distinct W2 )) (PreH8 : (dw_output_domain W1 D )) (PreH9 : (dw_output_domain W2 (dw_rebase (D) (out2)) )) (PreH10 : (dw_pair_observed D out2 O1 O2 )) (PreH11 : (0 < pixels)) (PreH12 : (pixels <= output_width)) (PreH13 : (0 <= remaining)) (PreH14 : (remaining <= channels)) (PreH15 : (left = ((dw_output_at (D) ((output_width - pixels ))) + (4 * (channels - remaining ) ) ))) (PreH16 : (right = ((dw_output_at ((dw_rebase (D) (out2))) ((output_width - pixels ))) + (4 * (channels - remaining ) ) ))) ,
  ((( &( "channels" ) )) # UInt64  |-> channels)
  **  ((( &( "output_width" ) )) # UInt64  |-> output_width)
  **  ((( &( "output_increment" ) )) # UInt64  |-> output_increment)
  **  ((( &( "pixels" ) )) # UInt64  |-> pixels)
  **  ((( &( "remaining" ) )) # UInt64  |-> remaining)
  **  ((( &( "left" ) )) # Ptr  |-> left)
  **  ((( &( "right" ) )) # Ptr  |-> right)
  **  (dw_output W1 O1 )
  **  (dw_output W2 O2 )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition compare_outputs_safety_wit_3 := 
forall (O2: DwOutput) (O1: DwOutput) (W2: (@list Z)) (W1: (@list Z)) (out2: Z) (D: DwProgram) (channels: Z) (output_width: Z) (output_increment: Z) (pixels: Z) (remaining: Z) (left: Z) (right: Z) (retval: fp32) (retval_2: fp32) (retval_3: Z) (PreH1 : (retval_3 = 0)) (PreH2 : (retval_3 = 1)) (PreH3 : (dw_initialized O2 right retval_2 )) (PreH4 : (dw_initialized O1 left retval )) (PreH5 : (channels = (dw_channels (D)))) (PreH6 : (output_width = (dw_width (D)))) (PreH7 : (output_increment = (dw_out_increment (D)))) (PreH8 : (0 < channels)) (PreH9 : (0 < output_width)) (PreH10 : (dw_distinct W1 )) (PreH11 : (dw_distinct W2 )) (PreH12 : (dw_output_domain W1 D )) (PreH13 : (dw_output_domain W2 (dw_rebase (D) (out2)) )) (PreH14 : (dw_pair_observed D out2 O1 O2 )) (PreH15 : (0 < pixels)) (PreH16 : (pixels <= output_width)) (PreH17 : (0 <= remaining)) (PreH18 : (remaining <= channels)) (PreH19 : (left = ((dw_output_at (D) ((output_width - pixels ))) + (4 * (channels - remaining ) ) ))) (PreH20 : (right = ((dw_output_at ((dw_rebase (D) (out2))) ((output_width - pixels ))) + (4 * (channels - remaining ) ) ))) (PreH21 : (0 < remaining)) (PreH22 : (left <> 0)) (PreH23 : (right <> 0)) (PreH24 : (dw_owned W1 left )) (PreH25 : (dw_owned W2 right )) (PreH26 : (dw_output_ready O1 left )) (PreH27 : (dw_output_ready O2 right )) (PreH28 : (dw_observed_pair O1 O2 left right )) ,
  (dw_output W2 O2 )
  **  ((( &( "y" ) )) # Float  |-> retval_2)
  **  (dw_output W1 O1 )
  **  ((( &( "x" ) )) # Float  |-> retval)
  **  ((( &( "channels" ) )) # UInt64  |-> channels)
  **  ((( &( "output_width" ) )) # UInt64  |-> output_width)
  **  ((( &( "output_increment" ) )) # UInt64  |-> output_increment)
  **  ((( &( "pixels" ) )) # UInt64  |-> pixels)
  **  ((( &( "remaining" ) )) # UInt64  |-> remaining)
  **  ((( &( "left" ) )) # Ptr  |-> left)
  **  ((( &( "right" ) )) # Ptr  |-> right)
|--
  “ False ”
.

Definition compare_outputs_safety_wit_4 := 
forall (O2: DwOutput) (O1: DwOutput) (W2: (@list Z)) (W1: (@list Z)) (out2: Z) (D: DwProgram) (right: Z) (left: Z) (pixels: Z) (output_increment: Z) (output_width: Z) (channels: Z) (PreH1 : (pixels = 0)) (PreH2 : (channels = (dw_channels (D)))) (PreH3 : (output_width = (dw_width (D)))) (PreH4 : (output_increment = (dw_out_increment (D)))) (PreH5 : (0 < channels)) (PreH6 : (0 < output_width)) (PreH7 : (dw_distinct W1 )) (PreH8 : (dw_distinct W2 )) (PreH9 : (dw_output_domain W1 D )) (PreH10 : (dw_output_domain W2 (dw_rebase (D) (out2)) )) (PreH11 : (dw_pair_observed D out2 O1 O2 )) (PreH12 : (0 <= pixels)) (PreH13 : (pixels <= output_width)) (PreH14 : (left = (dw_output_at (D) ((output_width - pixels ))))) (PreH15 : (right = (dw_output_at ((dw_rebase (D) (out2))) ((output_width - pixels ))))) ,
  ((( &( "channels" ) )) # UInt64  |-> channels)
  **  ((( &( "output_width" ) )) # UInt64  |-> output_width)
  **  ((( &( "output_increment" ) )) # UInt64  |-> output_increment)
  **  ((( &( "pixels" ) )) # UInt64  |-> pixels)
  **  ((( &( "left" ) )) # Ptr  |-> left)
  **  ((( &( "right" ) )) # Ptr  |-> right)
  **  (dw_output W1 O1 )
  **  (dw_output W2 O2 )
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition compare_outputs_entail_wit_1 := 
(
forall (output_increment_pre: Z) (right_pre: Z) (left_pre: Z) (output_width_pre: Z) (channels_pre: Z) (O2: DwOutput) (O1: DwOutput) (W2: (@list Z)) (W1: (@list Z)) (out2: Z) (D: DwProgram) (PreH1 : (channels_pre = (dw_channels (D)))) (PreH2 : (output_width_pre = (dw_width (D)))) (PreH3 : (output_increment_pre = (dw_out_increment (D)))) (PreH4 : (0 < channels_pre)) (PreH5 : (0 < output_width_pre)) (PreH6 : (dw_distinct W1 )) (PreH7 : (dw_distinct W2 )) (PreH8 : (dw_output_domain W1 D )) (PreH9 : (dw_output_domain W2 (dw_rebase (D) (out2)) )) (PreH10 : (dw_pair_observed D out2 O1 O2 )) (PreH11 : (left_pre = (dw_out (D)))) (PreH12 : (right_pre = out2)) ,
  (dw_output W1 O1 )
  **  (dw_output W2 O2 )
|--
  “ (channels_pre = (dw_channels (D))) ” 
  &&  “ (output_width_pre = (dw_width (D))) ” 
  &&  “ (output_increment_pre = (dw_out_increment (D))) ” 
  &&  “ (0 < channels_pre) ” 
  &&  “ (0 < output_width_pre) ” 
  &&  “ (dw_distinct W1 ) ” 
  &&  “ (dw_distinct W2 ) ” 
  &&  “ (dw_output_domain W1 D ) ” 
  &&  “ (dw_output_domain W2 (dw_rebase (D) (out2)) ) ” 
  &&  “ (dw_pair_observed D out2 O1 O2 ) ” 
  &&  “ (0 <= output_width_pre) ” 
  &&  “ (output_width_pre <= output_width_pre) ” 
  &&  “ (left_pre = (dw_output_at (D) ((output_width_pre - output_width_pre )))) ” 
  &&  “ (right_pre = (dw_output_at ((dw_rebase (D) (out2))) ((output_width_pre - output_width_pre )))) ”
  &&  (dw_output W1 O1 )
  **  (dw_output W2 O2 )
) \/
(
forall (output_increment_pre: Z) (right_pre: Z) (left_pre: Z) (output_width_pre: Z) (channels_pre: Z) (O2: DwOutput) (O1: DwOutput) (W2: (@list Z)) (W1: (@list Z)) (out2: Z) (D: DwProgram) (PreH1 : (channels_pre = (dw_channels (D)))) (PreH2 : (output_width_pre = (dw_width (D)))) (PreH3 : (output_increment_pre = (dw_out_increment (D)))) (PreH4 : (0 < channels_pre)) (PreH5 : (0 < output_width_pre)) (PreH6 : (dw_distinct W1 )) (PreH7 : (dw_distinct W2 )) (PreH8 : (dw_output_domain W1 D )) (PreH9 : (dw_output_domain W2 (dw_rebase (D) (out2)) )) (PreH10 : (dw_pair_observed D out2 O1 O2 )) (PreH11 : (left_pre = (dw_out (D)))) (PreH12 : (right_pre = out2)) ,
  TT && emp 
|--
  “ (right_pre = (dw_output_at ((dw_rebase (D) (right_pre))) ((output_width_pre - output_width_pre )))) ” 
  &&  “ (left_pre = (dw_output_at (D) ((output_width_pre - output_width_pre )))) ”
  &&  emp
).

Definition compare_outputs_entail_wit_1_split_goal_1 := 
forall (output_increment_pre: Z) (right_pre: Z) (left_pre: Z) (output_width_pre: Z) (channels_pre: Z) (O2: DwOutput) (O1: DwOutput) (W2: (@list Z)) (W1: (@list Z)) (out2: Z) (D: DwProgram) (PreH1 : (channels_pre = (dw_channels (D)))) (PreH2 : (output_width_pre = (dw_width (D)))) (PreH3 : (output_increment_pre = (dw_out_increment (D)))) (PreH4 : (0 < channels_pre)) (PreH5 : (0 < output_width_pre)) (PreH6 : (dw_distinct W1 )) (PreH7 : (dw_distinct W2 )) (PreH8 : (dw_output_domain W1 D )) (PreH9 : (dw_output_domain W2 (dw_rebase (D) (out2)) )) (PreH10 : (dw_pair_observed D out2 O1 O2 )) (PreH11 : (left_pre = (dw_out (D)))) (PreH12 : (right_pre = out2)) ,
  (right_pre = (dw_output_at ((dw_rebase (D) (right_pre))) ((output_width_pre - output_width_pre ))))
.

Definition compare_outputs_entail_wit_1_split_goal_2 := 
forall (output_increment_pre: Z) (right_pre: Z) (left_pre: Z) (output_width_pre: Z) (channels_pre: Z) (O2: DwOutput) (O1: DwOutput) (W2: (@list Z)) (W1: (@list Z)) (out2: Z) (D: DwProgram) (PreH1 : (channels_pre = (dw_channels (D)))) (PreH2 : (output_width_pre = (dw_width (D)))) (PreH3 : (output_increment_pre = (dw_out_increment (D)))) (PreH4 : (0 < channels_pre)) (PreH5 : (0 < output_width_pre)) (PreH6 : (dw_distinct W1 )) (PreH7 : (dw_distinct W2 )) (PreH8 : (dw_output_domain W1 D )) (PreH9 : (dw_output_domain W2 (dw_rebase (D) (out2)) )) (PreH10 : (dw_pair_observed D out2 O1 O2 )) (PreH11 : (left_pre = (dw_out (D)))) (PreH12 : (right_pre = out2)) ,
  (left_pre = (dw_output_at (D) ((output_width_pre - output_width_pre ))))
.

Definition compare_outputs_entail_wit_2 := 
forall (O2: DwOutput) (O1: DwOutput) (W2: (@list Z)) (W1: (@list Z)) (out2: Z) (D: DwProgram) (right: Z) (left: Z) (pixels: Z) (output_increment: Z) (output_width: Z) (channels: Z) (PreH1 : (pixels <> 0)) (PreH2 : (channels = (dw_channels (D)))) (PreH3 : (output_width = (dw_width (D)))) (PreH4 : (output_increment = (dw_out_increment (D)))) (PreH5 : (0 < channels)) (PreH6 : (0 < output_width)) (PreH7 : (dw_distinct W1 )) (PreH8 : (dw_distinct W2 )) (PreH9 : (dw_output_domain W1 D )) (PreH10 : (dw_output_domain W2 (dw_rebase (D) (out2)) )) (PreH11 : (dw_pair_observed D out2 O1 O2 )) (PreH12 : (0 <= pixels)) (PreH13 : (pixels <= output_width)) (PreH14 : (left = (dw_output_at (D) ((output_width - pixels ))))) (PreH15 : (right = (dw_output_at ((dw_rebase (D) (out2))) ((output_width - pixels ))))) ,
  (dw_output W1 O1 )
  **  (dw_output W2 O2 )
|--
  “ (channels = (dw_channels (D))) ” 
  &&  “ (output_width = (dw_width (D))) ” 
  &&  “ (output_increment = (dw_out_increment (D))) ” 
  &&  “ (0 < channels) ” 
  &&  “ (0 < output_width) ” 
  &&  “ (dw_distinct W1 ) ” 
  &&  “ (dw_distinct W2 ) ” 
  &&  “ (dw_output_domain W1 D ) ” 
  &&  “ (dw_output_domain W2 (dw_rebase (D) (out2)) ) ” 
  &&  “ (dw_pair_observed D out2 O1 O2 ) ” 
  &&  “ (0 < pixels) ” 
  &&  “ (pixels <= output_width) ” 
  &&  “ (0 <= channels) ” 
  &&  “ (channels <= channels) ” 
  &&  “ (left = ((dw_output_at (D) ((output_width - pixels ))) + (4 * (channels - channels ) ) )) ” 
  &&  “ (right = ((dw_output_at ((dw_rebase (D) (out2))) ((output_width - pixels ))) + (4 * (channels - channels ) ) )) ”
  &&  (dw_output W1 O1 )
  **  (dw_output W2 O2 )
.

Definition compare_outputs_entail_wit_3 := 
(
forall (O2: DwOutput) (O1: DwOutput) (W2: (@list Z)) (W1: (@list Z)) (out2: Z) (D: DwProgram) (right: Z) (left: Z) (remaining: Z) (pixels: Z) (output_increment: Z) (output_width: Z) (channels: Z) (PreH1 : (remaining <> 0)) (PreH2 : (channels = (dw_channels (D)))) (PreH3 : (output_width = (dw_width (D)))) (PreH4 : (output_increment = (dw_out_increment (D)))) (PreH5 : (0 < channels)) (PreH6 : (0 < output_width)) (PreH7 : (dw_distinct W1 )) (PreH8 : (dw_distinct W2 )) (PreH9 : (dw_output_domain W1 D )) (PreH10 : (dw_output_domain W2 (dw_rebase (D) (out2)) )) (PreH11 : (dw_pair_observed D out2 O1 O2 )) (PreH12 : (0 < pixels)) (PreH13 : (pixels <= output_width)) (PreH14 : (0 <= remaining)) (PreH15 : (remaining <= channels)) (PreH16 : (left = ((dw_output_at (D) ((output_width - pixels ))) + (4 * (channels - remaining ) ) ))) (PreH17 : (right = ((dw_output_at ((dw_rebase (D) (out2))) ((output_width - pixels ))) + (4 * (channels - remaining ) ) ))) ,
  (dw_output W1 O1 )
  **  (dw_output W2 O2 )
|--
  “ (channels = (dw_channels (D))) ” 
  &&  “ (output_width = (dw_width (D))) ” 
  &&  “ (output_increment = (dw_out_increment (D))) ” 
  &&  “ (0 < channels) ” 
  &&  “ (0 < output_width) ” 
  &&  “ (dw_distinct W1 ) ” 
  &&  “ (dw_distinct W2 ) ” 
  &&  “ (dw_output_domain W1 D ) ” 
  &&  “ (dw_output_domain W2 (dw_rebase (D) (out2)) ) ” 
  &&  “ (dw_pair_observed D out2 O1 O2 ) ” 
  &&  “ (0 < pixels) ” 
  &&  “ (pixels <= output_width) ” 
  &&  “ (0 <= remaining) ” 
  &&  “ (remaining <= channels) ” 
  &&  “ (left = ((dw_output_at (D) ((output_width - pixels ))) + (4 * (channels - remaining ) ) )) ” 
  &&  “ (right = ((dw_output_at ((dw_rebase (D) (out2))) ((output_width - pixels ))) + (4 * (channels - remaining ) ) )) ” 
  &&  “ (0 < remaining) ” 
  &&  “ (left <> 0) ” 
  &&  “ (right <> 0) ” 
  &&  “ (dw_owned W1 left ) ” 
  &&  “ (dw_owned W2 right ) ” 
  &&  “ (dw_output_ready O1 left ) ” 
  &&  “ (dw_output_ready O2 right ) ” 
  &&  “ (dw_observed_pair O1 O2 left right ) ”
  &&  (dw_output W1 O1 )
  **  (dw_output W2 O2 )
) \/
(
forall (O2: DwOutput) (O1: DwOutput) (W2: (@list Z)) (W1: (@list Z)) (out2: Z) (D: DwProgram) (right: Z) (left: Z) (remaining: Z) (pixels: Z) (output_increment: Z) (output_width: Z) (channels: Z) (PreH1 : (remaining <> 0)) (PreH2 : (channels = (dw_channels (D)))) (PreH3 : (output_width = (dw_width (D)))) (PreH4 : (output_increment = (dw_out_increment (D)))) (PreH5 : (0 < channels)) (PreH6 : (0 < output_width)) (PreH7 : (dw_distinct W1 )) (PreH8 : (dw_distinct W2 )) (PreH9 : (dw_output_domain W1 D )) (PreH10 : (dw_output_domain W2 (dw_rebase (D) (out2)) )) (PreH11 : (dw_pair_observed D out2 O1 O2 )) (PreH12 : (0 < pixels)) (PreH13 : (pixels <= output_width)) (PreH14 : (0 <= remaining)) (PreH15 : (remaining <= channels)) (PreH16 : (left = ((dw_output_at (D) ((output_width - pixels ))) + (4 * (channels - remaining ) ) ))) (PreH17 : (right = ((dw_output_at ((dw_rebase (D) (out2))) ((output_width - pixels ))) + (4 * (channels - remaining ) ) ))) ,
  TT && emp 
|--
  “ (dw_observed_pair O1 O2 left right ) ” 
  &&  “ (dw_output_ready O2 right ) ” 
  &&  “ (dw_output_ready O1 left ) ” 
  &&  “ (dw_owned W2 right ) ” 
  &&  “ (dw_owned W1 left ) ” 
  &&  “ (right <> 0) ” 
  &&  “ (left <> 0) ”
  &&  emp
).

Definition compare_outputs_entail_wit_3_split_goal_1 := 
forall (O2: DwOutput) (O1: DwOutput) (W2: (@list Z)) (W1: (@list Z)) (out2: Z) (D: DwProgram) (right: Z) (left: Z) (remaining: Z) (pixels: Z) (output_increment: Z) (output_width: Z) (channels: Z) (PreH1 : (remaining <> 0)) (PreH2 : (channels = (dw_channels (D)))) (PreH3 : (output_width = (dw_width (D)))) (PreH4 : (output_increment = (dw_out_increment (D)))) (PreH5 : (0 < channels)) (PreH6 : (0 < output_width)) (PreH7 : (dw_distinct W1 )) (PreH8 : (dw_distinct W2 )) (PreH9 : (dw_output_domain W1 D )) (PreH10 : (dw_output_domain W2 (dw_rebase (D) (out2)) )) (PreH11 : (dw_pair_observed D out2 O1 O2 )) (PreH12 : (0 < pixels)) (PreH13 : (pixels <= output_width)) (PreH14 : (0 <= remaining)) (PreH15 : (remaining <= channels)) (PreH16 : (left = ((dw_output_at (D) ((output_width - pixels ))) + (4 * (channels - remaining ) ) ))) (PreH17 : (right = ((dw_output_at ((dw_rebase (D) (out2))) ((output_width - pixels ))) + (4 * (channels - remaining ) ) ))) ,
  (dw_observed_pair O1 O2 left right )
.

Definition compare_outputs_entail_wit_3_split_goal_2 := 
forall (O2: DwOutput) (O1: DwOutput) (W2: (@list Z)) (W1: (@list Z)) (out2: Z) (D: DwProgram) (right: Z) (left: Z) (remaining: Z) (pixels: Z) (output_increment: Z) (output_width: Z) (channels: Z) (PreH1 : (remaining <> 0)) (PreH2 : (channels = (dw_channels (D)))) (PreH3 : (output_width = (dw_width (D)))) (PreH4 : (output_increment = (dw_out_increment (D)))) (PreH5 : (0 < channels)) (PreH6 : (0 < output_width)) (PreH7 : (dw_distinct W1 )) (PreH8 : (dw_distinct W2 )) (PreH9 : (dw_output_domain W1 D )) (PreH10 : (dw_output_domain W2 (dw_rebase (D) (out2)) )) (PreH11 : (dw_pair_observed D out2 O1 O2 )) (PreH12 : (0 < pixels)) (PreH13 : (pixels <= output_width)) (PreH14 : (0 <= remaining)) (PreH15 : (remaining <= channels)) (PreH16 : (left = ((dw_output_at (D) ((output_width - pixels ))) + (4 * (channels - remaining ) ) ))) (PreH17 : (right = ((dw_output_at ((dw_rebase (D) (out2))) ((output_width - pixels ))) + (4 * (channels - remaining ) ) ))) ,
  (dw_output_ready O2 right )
.

Definition compare_outputs_entail_wit_3_split_goal_3 := 
forall (O2: DwOutput) (O1: DwOutput) (W2: (@list Z)) (W1: (@list Z)) (out2: Z) (D: DwProgram) (right: Z) (left: Z) (remaining: Z) (pixels: Z) (output_increment: Z) (output_width: Z) (channels: Z) (PreH1 : (remaining <> 0)) (PreH2 : (channels = (dw_channels (D)))) (PreH3 : (output_width = (dw_width (D)))) (PreH4 : (output_increment = (dw_out_increment (D)))) (PreH5 : (0 < channels)) (PreH6 : (0 < output_width)) (PreH7 : (dw_distinct W1 )) (PreH8 : (dw_distinct W2 )) (PreH9 : (dw_output_domain W1 D )) (PreH10 : (dw_output_domain W2 (dw_rebase (D) (out2)) )) (PreH11 : (dw_pair_observed D out2 O1 O2 )) (PreH12 : (0 < pixels)) (PreH13 : (pixels <= output_width)) (PreH14 : (0 <= remaining)) (PreH15 : (remaining <= channels)) (PreH16 : (left = ((dw_output_at (D) ((output_width - pixels ))) + (4 * (channels - remaining ) ) ))) (PreH17 : (right = ((dw_output_at ((dw_rebase (D) (out2))) ((output_width - pixels ))) + (4 * (channels - remaining ) ) ))) ,
  (dw_output_ready O1 left )
.

Definition compare_outputs_entail_wit_3_split_goal_4 := 
forall (O2: DwOutput) (O1: DwOutput) (W2: (@list Z)) (W1: (@list Z)) (out2: Z) (D: DwProgram) (right: Z) (left: Z) (remaining: Z) (pixels: Z) (output_increment: Z) (output_width: Z) (channels: Z) (PreH1 : (remaining <> 0)) (PreH2 : (channels = (dw_channels (D)))) (PreH3 : (output_width = (dw_width (D)))) (PreH4 : (output_increment = (dw_out_increment (D)))) (PreH5 : (0 < channels)) (PreH6 : (0 < output_width)) (PreH7 : (dw_distinct W1 )) (PreH8 : (dw_distinct W2 )) (PreH9 : (dw_output_domain W1 D )) (PreH10 : (dw_output_domain W2 (dw_rebase (D) (out2)) )) (PreH11 : (dw_pair_observed D out2 O1 O2 )) (PreH12 : (0 < pixels)) (PreH13 : (pixels <= output_width)) (PreH14 : (0 <= remaining)) (PreH15 : (remaining <= channels)) (PreH16 : (left = ((dw_output_at (D) ((output_width - pixels ))) + (4 * (channels - remaining ) ) ))) (PreH17 : (right = ((dw_output_at ((dw_rebase (D) (out2))) ((output_width - pixels ))) + (4 * (channels - remaining ) ) ))) ,
  (dw_owned W2 right )
.

Definition compare_outputs_entail_wit_3_split_goal_5 := 
forall (O2: DwOutput) (O1: DwOutput) (W2: (@list Z)) (W1: (@list Z)) (out2: Z) (D: DwProgram) (right: Z) (left: Z) (remaining: Z) (pixels: Z) (output_increment: Z) (output_width: Z) (channels: Z) (PreH1 : (remaining <> 0)) (PreH2 : (channels = (dw_channels (D)))) (PreH3 : (output_width = (dw_width (D)))) (PreH4 : (output_increment = (dw_out_increment (D)))) (PreH5 : (0 < channels)) (PreH6 : (0 < output_width)) (PreH7 : (dw_distinct W1 )) (PreH8 : (dw_distinct W2 )) (PreH9 : (dw_output_domain W1 D )) (PreH10 : (dw_output_domain W2 (dw_rebase (D) (out2)) )) (PreH11 : (dw_pair_observed D out2 O1 O2 )) (PreH12 : (0 < pixels)) (PreH13 : (pixels <= output_width)) (PreH14 : (0 <= remaining)) (PreH15 : (remaining <= channels)) (PreH16 : (left = ((dw_output_at (D) ((output_width - pixels ))) + (4 * (channels - remaining ) ) ))) (PreH17 : (right = ((dw_output_at ((dw_rebase (D) (out2))) ((output_width - pixels ))) + (4 * (channels - remaining ) ) ))) ,
  (dw_owned W1 left )
.

Definition compare_outputs_entail_wit_3_split_goal_6 := 
forall (O2: DwOutput) (O1: DwOutput) (W2: (@list Z)) (W1: (@list Z)) (out2: Z) (D: DwProgram) (right: Z) (left: Z) (remaining: Z) (pixels: Z) (output_increment: Z) (output_width: Z) (channels: Z) (PreH1 : (remaining <> 0)) (PreH2 : (channels = (dw_channels (D)))) (PreH3 : (output_width = (dw_width (D)))) (PreH4 : (output_increment = (dw_out_increment (D)))) (PreH5 : (0 < channels)) (PreH6 : (0 < output_width)) (PreH7 : (dw_distinct W1 )) (PreH8 : (dw_distinct W2 )) (PreH9 : (dw_output_domain W1 D )) (PreH10 : (dw_output_domain W2 (dw_rebase (D) (out2)) )) (PreH11 : (dw_pair_observed D out2 O1 O2 )) (PreH12 : (0 < pixels)) (PreH13 : (pixels <= output_width)) (PreH14 : (0 <= remaining)) (PreH15 : (remaining <= channels)) (PreH16 : (left = ((dw_output_at (D) ((output_width - pixels ))) + (4 * (channels - remaining ) ) ))) (PreH17 : (right = ((dw_output_at ((dw_rebase (D) (out2))) ((output_width - pixels ))) + (4 * (channels - remaining ) ) ))) ,
  (right <> 0)
.

Definition compare_outputs_entail_wit_3_split_goal_7 := 
forall (O2: DwOutput) (O1: DwOutput) (W2: (@list Z)) (W1: (@list Z)) (out2: Z) (D: DwProgram) (right: Z) (left: Z) (remaining: Z) (pixels: Z) (output_increment: Z) (output_width: Z) (channels: Z) (PreH1 : (remaining <> 0)) (PreH2 : (channels = (dw_channels (D)))) (PreH3 : (output_width = (dw_width (D)))) (PreH4 : (output_increment = (dw_out_increment (D)))) (PreH5 : (0 < channels)) (PreH6 : (0 < output_width)) (PreH7 : (dw_distinct W1 )) (PreH8 : (dw_distinct W2 )) (PreH9 : (dw_output_domain W1 D )) (PreH10 : (dw_output_domain W2 (dw_rebase (D) (out2)) )) (PreH11 : (dw_pair_observed D out2 O1 O2 )) (PreH12 : (0 < pixels)) (PreH13 : (pixels <= output_width)) (PreH14 : (0 <= remaining)) (PreH15 : (remaining <= channels)) (PreH16 : (left = ((dw_output_at (D) ((output_width - pixels ))) + (4 * (channels - remaining ) ) ))) (PreH17 : (right = ((dw_output_at ((dw_rebase (D) (out2))) ((output_width - pixels ))) + (4 * (channels - remaining ) ) ))) ,
  (left <> 0)
.

Definition compare_outputs_entail_wit_4 := 
(
forall (O2: DwOutput) (O1: DwOutput) (W2: (@list Z)) (W1: (@list Z)) (out2: Z) (D: DwProgram) (channels: Z) (output_width: Z) (output_increment: Z) (pixels: Z) (remaining: Z) (left: Z) (right: Z) (retval: fp32) (retval_2: fp32) (retval_3: Z) (PreH1 : (retval_3 <> 0)) (PreH2 : (retval_3 = 1)) (PreH3 : (dw_initialized O2 right retval_2 )) (PreH4 : (dw_initialized O1 left retval )) (PreH5 : (channels = (dw_channels (D)))) (PreH6 : (output_width = (dw_width (D)))) (PreH7 : (output_increment = (dw_out_increment (D)))) (PreH8 : (0 < channels)) (PreH9 : (0 < output_width)) (PreH10 : (dw_distinct W1 )) (PreH11 : (dw_distinct W2 )) (PreH12 : (dw_output_domain W1 D )) (PreH13 : (dw_output_domain W2 (dw_rebase (D) (out2)) )) (PreH14 : (dw_pair_observed D out2 O1 O2 )) (PreH15 : (0 < pixels)) (PreH16 : (pixels <= output_width)) (PreH17 : (0 <= remaining)) (PreH18 : (remaining <= channels)) (PreH19 : (left = ((dw_output_at (D) ((output_width - pixels ))) + (4 * (channels - remaining ) ) ))) (PreH20 : (right = ((dw_output_at ((dw_rebase (D) (out2))) ((output_width - pixels ))) + (4 * (channels - remaining ) ) ))) (PreH21 : (0 < remaining)) (PreH22 : (left <> 0)) (PreH23 : (right <> 0)) (PreH24 : (dw_owned W1 left )) (PreH25 : (dw_owned W2 right )) (PreH26 : (dw_output_ready O1 left )) (PreH27 : (dw_output_ready O2 right )) (PreH28 : (dw_observed_pair O1 O2 left right )) ,
  (dw_output W2 O2 )
  **  (dw_output W1 O1 )
|--
  “ (channels = (dw_channels (D))) ” 
  &&  “ (output_width = (dw_width (D))) ” 
  &&  “ (output_increment = (dw_out_increment (D))) ” 
  &&  “ (0 < channels) ” 
  &&  “ (0 < output_width) ” 
  &&  “ (dw_distinct W1 ) ” 
  &&  “ (dw_distinct W2 ) ” 
  &&  “ (dw_output_domain W1 D ) ” 
  &&  “ (dw_output_domain W2 (dw_rebase (D) (out2)) ) ” 
  &&  “ (dw_pair_observed D out2 O1 O2 ) ” 
  &&  “ (0 < pixels) ” 
  &&  “ (pixels <= output_width) ” 
  &&  “ (0 <= (remaining - 1 )) ” 
  &&  “ ((remaining - 1 ) <= channels) ” 
  &&  “ ((left + (1 * sizeof(FLOAT))) = ((dw_output_at (D) ((output_width - pixels ))) + (4 * (channels - (remaining - 1 ) ) ) )) ” 
  &&  “ ((right + (1 * sizeof(FLOAT))) = ((dw_output_at ((dw_rebase (D) (out2))) ((output_width - pixels ))) + (4 * (channels - (remaining - 1 ) ) ) )) ”
  &&  (dw_output W1 O1 )
  **  (dw_output W2 O2 )
) \/
(
forall (O2: DwOutput) (O1: DwOutput) (W2: (@list Z)) (W1: (@list Z)) (out2: Z) (D: DwProgram) (channels: Z) (output_width: Z) (output_increment: Z) (pixels: Z) (remaining: Z) (left: Z) (right: Z) (retval: fp32) (retval_2: fp32) (retval_3: Z) (PreH1 : (retval_3 <> 0)) (PreH2 : (retval_3 = 1)) (PreH3 : (dw_initialized O2 right retval_2 )) (PreH4 : (dw_initialized O1 left retval )) (PreH5 : (channels = (dw_channels (D)))) (PreH6 : (output_width = (dw_width (D)))) (PreH7 : (output_increment = (dw_out_increment (D)))) (PreH8 : (0 < channels)) (PreH9 : (0 < output_width)) (PreH10 : (dw_distinct W1 )) (PreH11 : (dw_distinct W2 )) (PreH12 : (dw_output_domain W1 D )) (PreH13 : (dw_output_domain W2 (dw_rebase (D) (out2)) )) (PreH14 : (dw_pair_observed D out2 O1 O2 )) (PreH15 : (0 < pixels)) (PreH16 : (pixels <= output_width)) (PreH17 : (0 <= remaining)) (PreH18 : (remaining <= channels)) (PreH19 : (left = ((dw_output_at (D) ((output_width - pixels ))) + (4 * (channels - remaining ) ) ))) (PreH20 : (right = ((dw_output_at ((dw_rebase (D) (out2))) ((output_width - pixels ))) + (4 * (channels - remaining ) ) ))) (PreH21 : (0 < remaining)) (PreH22 : (left <> 0)) (PreH23 : (right <> 0)) (PreH24 : (dw_owned W1 left )) (PreH25 : (dw_owned W2 right )) (PreH26 : (dw_output_ready O1 left )) (PreH27 : (dw_output_ready O2 right )) (PreH28 : (dw_observed_pair O1 O2 left right )) ,
  TT && emp 
|--
  “ ((right + (1 * sizeof(FLOAT))) = ((dw_output_at ((dw_rebase (D) (out2))) ((output_width - pixels ))) + (4 * (channels - (remaining - 1 ) ) ) )) ” 
  &&  “ ((left + (1 * sizeof(FLOAT))) = ((dw_output_at (D) ((output_width - pixels ))) + (4 * (channels - (remaining - 1 ) ) ) )) ”
  &&  emp
).

Definition compare_outputs_entail_wit_4_split_goal_1 := 
forall (O2: DwOutput) (O1: DwOutput) (W2: (@list Z)) (W1: (@list Z)) (out2: Z) (D: DwProgram) (channels: Z) (output_width: Z) (output_increment: Z) (pixels: Z) (remaining: Z) (left: Z) (right: Z) (retval: fp32) (retval_2: fp32) (retval_3: Z) (PreH1 : (retval_3 <> 0)) (PreH2 : (retval_3 = 1)) (PreH3 : (dw_initialized O2 right retval_2 )) (PreH4 : (dw_initialized O1 left retval )) (PreH5 : (channels = (dw_channels (D)))) (PreH6 : (output_width = (dw_width (D)))) (PreH7 : (output_increment = (dw_out_increment (D)))) (PreH8 : (0 < channels)) (PreH9 : (0 < output_width)) (PreH10 : (dw_distinct W1 )) (PreH11 : (dw_distinct W2 )) (PreH12 : (dw_output_domain W1 D )) (PreH13 : (dw_output_domain W2 (dw_rebase (D) (out2)) )) (PreH14 : (dw_pair_observed D out2 O1 O2 )) (PreH15 : (0 < pixels)) (PreH16 : (pixels <= output_width)) (PreH17 : (0 <= remaining)) (PreH18 : (remaining <= channels)) (PreH19 : (left = ((dw_output_at (D) ((output_width - pixels ))) + (4 * (channels - remaining ) ) ))) (PreH20 : (right = ((dw_output_at ((dw_rebase (D) (out2))) ((output_width - pixels ))) + (4 * (channels - remaining ) ) ))) (PreH21 : (0 < remaining)) (PreH22 : (left <> 0)) (PreH23 : (right <> 0)) (PreH24 : (dw_owned W1 left )) (PreH25 : (dw_owned W2 right )) (PreH26 : (dw_output_ready O1 left )) (PreH27 : (dw_output_ready O2 right )) (PreH28 : (dw_observed_pair O1 O2 left right )) ,
  ((right + (1 * sizeof(FLOAT))) = ((dw_output_at ((dw_rebase (D) (out2))) ((output_width - pixels ))) + (4 * (channels - (remaining - 1 ) ) ) ))
.

Definition compare_outputs_entail_wit_4_split_goal_2 := 
forall (O2: DwOutput) (O1: DwOutput) (W2: (@list Z)) (W1: (@list Z)) (out2: Z) (D: DwProgram) (channels: Z) (output_width: Z) (output_increment: Z) (pixels: Z) (remaining: Z) (left: Z) (right: Z) (retval: fp32) (retval_2: fp32) (retval_3: Z) (PreH1 : (retval_3 <> 0)) (PreH2 : (retval_3 = 1)) (PreH3 : (dw_initialized O2 right retval_2 )) (PreH4 : (dw_initialized O1 left retval )) (PreH5 : (channels = (dw_channels (D)))) (PreH6 : (output_width = (dw_width (D)))) (PreH7 : (output_increment = (dw_out_increment (D)))) (PreH8 : (0 < channels)) (PreH9 : (0 < output_width)) (PreH10 : (dw_distinct W1 )) (PreH11 : (dw_distinct W2 )) (PreH12 : (dw_output_domain W1 D )) (PreH13 : (dw_output_domain W2 (dw_rebase (D) (out2)) )) (PreH14 : (dw_pair_observed D out2 O1 O2 )) (PreH15 : (0 < pixels)) (PreH16 : (pixels <= output_width)) (PreH17 : (0 <= remaining)) (PreH18 : (remaining <= channels)) (PreH19 : (left = ((dw_output_at (D) ((output_width - pixels ))) + (4 * (channels - remaining ) ) ))) (PreH20 : (right = ((dw_output_at ((dw_rebase (D) (out2))) ((output_width - pixels ))) + (4 * (channels - remaining ) ) ))) (PreH21 : (0 < remaining)) (PreH22 : (left <> 0)) (PreH23 : (right <> 0)) (PreH24 : (dw_owned W1 left )) (PreH25 : (dw_owned W2 right )) (PreH26 : (dw_output_ready O1 left )) (PreH27 : (dw_output_ready O2 right )) (PreH28 : (dw_observed_pair O1 O2 left right )) ,
  ((left + (1 * sizeof(FLOAT))) = ((dw_output_at (D) ((output_width - pixels ))) + (4 * (channels - (remaining - 1 ) ) ) ))
.

Definition compare_outputs_entail_wit_5 := 
(
forall (O2: DwOutput) (O1: DwOutput) (W2: (@list Z)) (W1: (@list Z)) (out2: Z) (D: DwProgram) (right: Z) (left: Z) (remaining: Z) (pixels: Z) (output_increment: Z) (output_width: Z) (channels: Z) (PreH1 : (remaining = 0)) (PreH2 : (channels = (dw_channels (D)))) (PreH3 : (output_width = (dw_width (D)))) (PreH4 : (output_increment = (dw_out_increment (D)))) (PreH5 : (0 < channels)) (PreH6 : (0 < output_width)) (PreH7 : (dw_distinct W1 )) (PreH8 : (dw_distinct W2 )) (PreH9 : (dw_output_domain W1 D )) (PreH10 : (dw_output_domain W2 (dw_rebase (D) (out2)) )) (PreH11 : (dw_pair_observed D out2 O1 O2 )) (PreH12 : (0 < pixels)) (PreH13 : (pixels <= output_width)) (PreH14 : (0 <= remaining)) (PreH15 : (remaining <= channels)) (PreH16 : (left = ((dw_output_at (D) ((output_width - pixels ))) + (4 * (channels - remaining ) ) ))) (PreH17 : (right = ((dw_output_at ((dw_rebase (D) (out2))) ((output_width - pixels ))) + (4 * (channels - remaining ) ) ))) ,
  (dw_output W1 O1 )
  **  (dw_output W2 O2 )
|--
  “ (channels = (dw_channels (D))) ” 
  &&  “ (output_width = (dw_width (D))) ” 
  &&  “ (output_increment = (dw_out_increment (D))) ” 
  &&  “ (0 < channels) ” 
  &&  “ (0 < output_width) ” 
  &&  “ (dw_distinct W1 ) ” 
  &&  “ (dw_distinct W2 ) ” 
  &&  “ (dw_output_domain W1 D ) ” 
  &&  “ (dw_output_domain W2 (dw_rebase (D) (out2)) ) ” 
  &&  “ (dw_pair_observed D out2 O1 O2 ) ” 
  &&  “ (0 <= (pixels - 1 )) ” 
  &&  “ ((pixels - 1 ) <= output_width) ” 
  &&  “ ((unsigned_last_nbits (((unsigned_last_nbits (left) (64)) + output_increment )) (64)) = (dw_output_at (D) ((output_width - (pixels - 1 ) )))) ” 
  &&  “ ((unsigned_last_nbits (((unsigned_last_nbits (right) (64)) + output_increment )) (64)) = (dw_output_at ((dw_rebase (D) (out2))) ((output_width - (pixels - 1 ) )))) ”
  &&  (dw_output W1 O1 )
  **  (dw_output W2 O2 )
) \/
(
forall (O2: DwOutput) (O1: DwOutput) (W2: (@list Z)) (W1: (@list Z)) (out2: Z) (D: DwProgram) (right: Z) (left: Z) (remaining: Z) (pixels: Z) (output_increment: Z) (output_width: Z) (channels: Z) (PreH1 : (remaining = 0)) (PreH2 : (channels = (dw_channels (D)))) (PreH3 : (output_width = (dw_width (D)))) (PreH4 : (output_increment = (dw_out_increment (D)))) (PreH5 : (0 < channels)) (PreH6 : (0 < output_width)) (PreH7 : (dw_distinct W1 )) (PreH8 : (dw_distinct W2 )) (PreH9 : (dw_output_domain W1 D )) (PreH10 : (dw_output_domain W2 (dw_rebase (D) (out2)) )) (PreH11 : (dw_pair_observed D out2 O1 O2 )) (PreH12 : (0 < pixels)) (PreH13 : (pixels <= output_width)) (PreH14 : (0 <= remaining)) (PreH15 : (remaining <= channels)) (PreH16 : (left = ((dw_output_at (D) ((output_width - pixels ))) + (4 * (channels - remaining ) ) ))) (PreH17 : (right = ((dw_output_at ((dw_rebase (D) (out2))) ((output_width - pixels ))) + (4 * (channels - remaining ) ) ))) ,
  TT && emp 
|--
  “ ((unsigned_last_nbits (((unsigned_last_nbits (((dw_output_at ((dw_rebase (D) (out2))) ((output_width - pixels ))) + (4 * (channels - 0 ) ) )) (64)) + output_increment )) (64)) = (dw_output_at ((dw_rebase (D) (out2))) ((output_width - (pixels - 1 ) )))) ” 
  &&  “ ((unsigned_last_nbits (((unsigned_last_nbits (((dw_output_at (D) ((output_width - pixels ))) + (4 * (channels - 0 ) ) )) (64)) + output_increment )) (64)) = (dw_output_at (D) ((output_width - (pixels - 1 ) )))) ”
  &&  emp
).

Definition compare_outputs_entail_wit_5_split_goal_1 := 
forall (O2: DwOutput) (O1: DwOutput) (W2: (@list Z)) (W1: (@list Z)) (out2: Z) (D: DwProgram) (right: Z) (left: Z) (remaining: Z) (pixels: Z) (output_increment: Z) (output_width: Z) (channels: Z) (PreH1 : (remaining = 0)) (PreH2 : (channels = (dw_channels (D)))) (PreH3 : (output_width = (dw_width (D)))) (PreH4 : (output_increment = (dw_out_increment (D)))) (PreH5 : (0 < channels)) (PreH6 : (0 < output_width)) (PreH7 : (dw_distinct W1 )) (PreH8 : (dw_distinct W2 )) (PreH9 : (dw_output_domain W1 D )) (PreH10 : (dw_output_domain W2 (dw_rebase (D) (out2)) )) (PreH11 : (dw_pair_observed D out2 O1 O2 )) (PreH12 : (0 < pixels)) (PreH13 : (pixels <= output_width)) (PreH14 : (0 <= remaining)) (PreH15 : (remaining <= channels)) (PreH16 : (left = ((dw_output_at (D) ((output_width - pixels ))) + (4 * (channels - remaining ) ) ))) (PreH17 : (right = ((dw_output_at ((dw_rebase (D) (out2))) ((output_width - pixels ))) + (4 * (channels - remaining ) ) ))) ,
  ((unsigned_last_nbits (((unsigned_last_nbits (((dw_output_at ((dw_rebase (D) (out2))) ((output_width - pixels ))) + (4 * (channels - 0 ) ) )) (64)) + output_increment )) (64)) = (dw_output_at ((dw_rebase (D) (out2))) ((output_width - (pixels - 1 ) ))))
.

Definition compare_outputs_entail_wit_5_split_goal_2 := 
forall (O2: DwOutput) (O1: DwOutput) (W2: (@list Z)) (W1: (@list Z)) (out2: Z) (D: DwProgram) (right: Z) (left: Z) (remaining: Z) (pixels: Z) (output_increment: Z) (output_width: Z) (channels: Z) (PreH1 : (remaining = 0)) (PreH2 : (channels = (dw_channels (D)))) (PreH3 : (output_width = (dw_width (D)))) (PreH4 : (output_increment = (dw_out_increment (D)))) (PreH5 : (0 < channels)) (PreH6 : (0 < output_width)) (PreH7 : (dw_distinct W1 )) (PreH8 : (dw_distinct W2 )) (PreH9 : (dw_output_domain W1 D )) (PreH10 : (dw_output_domain W2 (dw_rebase (D) (out2)) )) (PreH11 : (dw_pair_observed D out2 O1 O2 )) (PreH12 : (0 < pixels)) (PreH13 : (pixels <= output_width)) (PreH14 : (0 <= remaining)) (PreH15 : (remaining <= channels)) (PreH16 : (left = ((dw_output_at (D) ((output_width - pixels ))) + (4 * (channels - remaining ) ) ))) (PreH17 : (right = ((dw_output_at ((dw_rebase (D) (out2))) ((output_width - pixels ))) + (4 * (channels - remaining ) ) ))) ,
  ((unsigned_last_nbits (((unsigned_last_nbits (((dw_output_at (D) ((output_width - pixels ))) + (4 * (channels - 0 ) ) )) (64)) + output_increment )) (64)) = (dw_output_at (D) ((output_width - (pixels - 1 ) ))))
.

Definition compare_outputs_return_wit_1 := 
forall (O2: DwOutput) (O1: DwOutput) (W2: (@list Z)) (W1: (@list Z)) (out2: Z) (D: DwProgram) (right: Z) (left: Z) (pixels: Z) (output_increment: Z) (output_width: Z) (channels: Z) (PreH1 : (pixels = 0)) (PreH2 : (channels = (dw_channels (D)))) (PreH3 : (output_width = (dw_width (D)))) (PreH4 : (output_increment = (dw_out_increment (D)))) (PreH5 : (0 < channels)) (PreH6 : (0 < output_width)) (PreH7 : (dw_distinct W1 )) (PreH8 : (dw_distinct W2 )) (PreH9 : (dw_output_domain W1 D )) (PreH10 : (dw_output_domain W2 (dw_rebase (D) (out2)) )) (PreH11 : (dw_pair_observed D out2 O1 O2 )) (PreH12 : (0 <= pixels)) (PreH13 : (pixels <= output_width)) (PreH14 : (left = (dw_output_at (D) ((output_width - pixels ))))) (PreH15 : (right = (dw_output_at ((dw_rebase (D) (out2))) ((output_width - pixels ))))) ,
  (dw_output W1 O1 )
  **  (dw_output W2 O2 )
|--
  “ (1 = 1) ”
  &&  (dw_output W1 O1 )
  **  (dw_output W2 O2 )
.

Definition compare_outputs_partial_solve_wit_1_pure := 
forall (O2: DwOutput) (O1: DwOutput) (W2: (@list Z)) (W1: (@list Z)) (out2: Z) (D: DwProgram) (channels: Z) (output_width: Z) (output_increment: Z) (pixels: Z) (remaining: Z) (left: Z) (right: Z) (PreH1 : (channels = (dw_channels (D)))) (PreH2 : (output_width = (dw_width (D)))) (PreH3 : (output_increment = (dw_out_increment (D)))) (PreH4 : (0 < channels)) (PreH5 : (0 < output_width)) (PreH6 : (dw_distinct W1 )) (PreH7 : (dw_distinct W2 )) (PreH8 : (dw_output_domain W1 D )) (PreH9 : (dw_output_domain W2 (dw_rebase (D) (out2)) )) (PreH10 : (dw_pair_observed D out2 O1 O2 )) (PreH11 : (0 < pixels)) (PreH12 : (pixels <= output_width)) (PreH13 : (0 <= remaining)) (PreH14 : (remaining <= channels)) (PreH15 : (left = ((dw_output_at (D) ((output_width - pixels ))) + (4 * (channels - remaining ) ) ))) (PreH16 : (right = ((dw_output_at ((dw_rebase (D) (out2))) ((output_width - pixels ))) + (4 * (channels - remaining ) ) ))) (PreH17 : (0 < remaining)) (PreH18 : (left <> 0)) (PreH19 : (right <> 0)) (PreH20 : (dw_owned W1 left )) (PreH21 : (dw_owned W2 right )) (PreH22 : (dw_output_ready O1 left )) (PreH23 : (dw_output_ready O2 right )) (PreH24 : (dw_observed_pair O1 O2 left right )) ,
  ((( &( "x" ) )) # Float  |->_)
  **  ((( &( "channels" ) )) # UInt64  |-> channels)
  **  ((( &( "output_width" ) )) # UInt64  |-> output_width)
  **  ((( &( "output_increment" ) )) # UInt64  |-> output_increment)
  **  ((( &( "pixels" ) )) # UInt64  |-> pixels)
  **  ((( &( "remaining" ) )) # UInt64  |-> remaining)
  **  ((( &( "left" ) )) # Ptr  |-> left)
  **  ((( &( "right" ) )) # Ptr  |-> right)
  **  (dw_output W1 O1 )
  **  (dw_output W2 O2 )
|--
  “ (left <> 0) ” 
  &&  “ (dw_distinct W1 ) ” 
  &&  “ (dw_owned W1 left ) ” 
  &&  “ (dw_output_ready O1 left ) ”
.

Definition compare_outputs_partial_solve_wit_1_aux := 
forall (O2: DwOutput) (O1: DwOutput) (W2: (@list Z)) (W1: (@list Z)) (out2: Z) (D: DwProgram) (channels: Z) (output_width: Z) (output_increment: Z) (pixels: Z) (remaining: Z) (left: Z) (right: Z) (PreH1 : (channels = (dw_channels (D)))) (PreH2 : (output_width = (dw_width (D)))) (PreH3 : (output_increment = (dw_out_increment (D)))) (PreH4 : (0 < channels)) (PreH5 : (0 < output_width)) (PreH6 : (dw_distinct W1 )) (PreH7 : (dw_distinct W2 )) (PreH8 : (dw_output_domain W1 D )) (PreH9 : (dw_output_domain W2 (dw_rebase (D) (out2)) )) (PreH10 : (dw_pair_observed D out2 O1 O2 )) (PreH11 : (0 < pixels)) (PreH12 : (pixels <= output_width)) (PreH13 : (0 <= remaining)) (PreH14 : (remaining <= channels)) (PreH15 : (left = ((dw_output_at (D) ((output_width - pixels ))) + (4 * (channels - remaining ) ) ))) (PreH16 : (right = ((dw_output_at ((dw_rebase (D) (out2))) ((output_width - pixels ))) + (4 * (channels - remaining ) ) ))) (PreH17 : (0 < remaining)) (PreH18 : (left <> 0)) (PreH19 : (right <> 0)) (PreH20 : (dw_owned W1 left )) (PreH21 : (dw_owned W2 right )) (PreH22 : (dw_output_ready O1 left )) (PreH23 : (dw_output_ready O2 right )) (PreH24 : (dw_observed_pair O1 O2 left right )) ,
  (dw_output W1 O1 )
  **  (dw_output W2 O2 )
|--
  “ (left <> 0) ” 
  &&  “ (dw_distinct W1 ) ” 
  &&  “ (dw_owned W1 left ) ” 
  &&  “ (dw_output_ready O1 left ) ” 
  &&  “ (channels = (dw_channels (D))) ” 
  &&  “ (output_width = (dw_width (D))) ” 
  &&  “ (output_increment = (dw_out_increment (D))) ” 
  &&  “ (0 < channels) ” 
  &&  “ (0 < output_width) ” 
  &&  “ (dw_distinct W1 ) ” 
  &&  “ (dw_distinct W2 ) ” 
  &&  “ (dw_output_domain W1 D ) ” 
  &&  “ (dw_output_domain W2 (dw_rebase (D) (out2)) ) ” 
  &&  “ (dw_pair_observed D out2 O1 O2 ) ” 
  &&  “ (0 < pixels) ” 
  &&  “ (pixels <= output_width) ” 
  &&  “ (0 <= remaining) ” 
  &&  “ (remaining <= channels) ” 
  &&  “ (left = ((dw_output_at (D) ((output_width - pixels ))) + (4 * (channels - remaining ) ) )) ” 
  &&  “ (right = ((dw_output_at ((dw_rebase (D) (out2))) ((output_width - pixels ))) + (4 * (channels - remaining ) ) )) ” 
  &&  “ (0 < remaining) ” 
  &&  “ (left <> 0) ” 
  &&  “ (right <> 0) ” 
  &&  “ (dw_owned W1 left ) ” 
  &&  “ (dw_owned W2 right ) ” 
  &&  “ (dw_output_ready O1 left ) ” 
  &&  “ (dw_output_ready O2 right ) ” 
  &&  “ (dw_observed_pair O1 O2 left right ) ”
  &&  (dw_output W1 O1 )
  **  (dw_output W2 O2 )
.

Definition compare_outputs_partial_solve_wit_1 := compare_outputs_partial_solve_wit_1_pure -> compare_outputs_partial_solve_wit_1_aux.

Definition compare_outputs_partial_solve_wit_2_pure := 
forall (O2: DwOutput) (O1: DwOutput) (W2: (@list Z)) (W1: (@list Z)) (out2: Z) (D: DwProgram) (channels: Z) (output_width: Z) (output_increment: Z) (pixels: Z) (remaining: Z) (left: Z) (right: Z) (retval: fp32) (PreH1 : (dw_initialized O1 left retval )) (PreH2 : (channels = (dw_channels (D)))) (PreH3 : (output_width = (dw_width (D)))) (PreH4 : (output_increment = (dw_out_increment (D)))) (PreH5 : (0 < channels)) (PreH6 : (0 < output_width)) (PreH7 : (dw_distinct W1 )) (PreH8 : (dw_distinct W2 )) (PreH9 : (dw_output_domain W1 D )) (PreH10 : (dw_output_domain W2 (dw_rebase (D) (out2)) )) (PreH11 : (dw_pair_observed D out2 O1 O2 )) (PreH12 : (0 < pixels)) (PreH13 : (pixels <= output_width)) (PreH14 : (0 <= remaining)) (PreH15 : (remaining <= channels)) (PreH16 : (left = ((dw_output_at (D) ((output_width - pixels ))) + (4 * (channels - remaining ) ) ))) (PreH17 : (right = ((dw_output_at ((dw_rebase (D) (out2))) ((output_width - pixels ))) + (4 * (channels - remaining ) ) ))) (PreH18 : (0 < remaining)) (PreH19 : (left <> 0)) (PreH20 : (right <> 0)) (PreH21 : (dw_owned W1 left )) (PreH22 : (dw_owned W2 right )) (PreH23 : (dw_output_ready O1 left )) (PreH24 : (dw_output_ready O2 right )) (PreH25 : (dw_observed_pair O1 O2 left right )) ,
  ((( &( "y" ) )) # Float  |->_)
  **  (dw_output W1 O1 )
  **  ((( &( "x" ) )) # Float  |-> retval)
  **  ((( &( "channels" ) )) # UInt64  |-> channels)
  **  ((( &( "output_width" ) )) # UInt64  |-> output_width)
  **  ((( &( "output_increment" ) )) # UInt64  |-> output_increment)
  **  ((( &( "pixels" ) )) # UInt64  |-> pixels)
  **  ((( &( "remaining" ) )) # UInt64  |-> remaining)
  **  ((( &( "left" ) )) # Ptr  |-> left)
  **  ((( &( "right" ) )) # Ptr  |-> right)
  **  (dw_output W2 O2 )
|--
  “ (right <> 0) ” 
  &&  “ (dw_distinct W2 ) ” 
  &&  “ (dw_owned W2 right ) ” 
  &&  “ (dw_output_ready O2 right ) ”
.

Definition compare_outputs_partial_solve_wit_2_aux := 
forall (O2: DwOutput) (O1: DwOutput) (W2: (@list Z)) (W1: (@list Z)) (out2: Z) (D: DwProgram) (channels: Z) (output_width: Z) (output_increment: Z) (pixels: Z) (remaining: Z) (left: Z) (right: Z) (retval: fp32) (PreH1 : (dw_initialized O1 left retval )) (PreH2 : (channels = (dw_channels (D)))) (PreH3 : (output_width = (dw_width (D)))) (PreH4 : (output_increment = (dw_out_increment (D)))) (PreH5 : (0 < channels)) (PreH6 : (0 < output_width)) (PreH7 : (dw_distinct W1 )) (PreH8 : (dw_distinct W2 )) (PreH9 : (dw_output_domain W1 D )) (PreH10 : (dw_output_domain W2 (dw_rebase (D) (out2)) )) (PreH11 : (dw_pair_observed D out2 O1 O2 )) (PreH12 : (0 < pixels)) (PreH13 : (pixels <= output_width)) (PreH14 : (0 <= remaining)) (PreH15 : (remaining <= channels)) (PreH16 : (left = ((dw_output_at (D) ((output_width - pixels ))) + (4 * (channels - remaining ) ) ))) (PreH17 : (right = ((dw_output_at ((dw_rebase (D) (out2))) ((output_width - pixels ))) + (4 * (channels - remaining ) ) ))) (PreH18 : (0 < remaining)) (PreH19 : (left <> 0)) (PreH20 : (right <> 0)) (PreH21 : (dw_owned W1 left )) (PreH22 : (dw_owned W2 right )) (PreH23 : (dw_output_ready O1 left )) (PreH24 : (dw_output_ready O2 right )) (PreH25 : (dw_observed_pair O1 O2 left right )) ,
  (dw_output W1 O1 )
  **  (dw_output W2 O2 )
|--
  “ (right <> 0) ” 
  &&  “ (dw_distinct W2 ) ” 
  &&  “ (dw_owned W2 right ) ” 
  &&  “ (dw_output_ready O2 right ) ” 
  &&  “ (dw_initialized O1 left retval ) ” 
  &&  “ (channels = (dw_channels (D))) ” 
  &&  “ (output_width = (dw_width (D))) ” 
  &&  “ (output_increment = (dw_out_increment (D))) ” 
  &&  “ (0 < channels) ” 
  &&  “ (0 < output_width) ” 
  &&  “ (dw_distinct W1 ) ” 
  &&  “ (dw_distinct W2 ) ” 
  &&  “ (dw_output_domain W1 D ) ” 
  &&  “ (dw_output_domain W2 (dw_rebase (D) (out2)) ) ” 
  &&  “ (dw_pair_observed D out2 O1 O2 ) ” 
  &&  “ (0 < pixels) ” 
  &&  “ (pixels <= output_width) ” 
  &&  “ (0 <= remaining) ” 
  &&  “ (remaining <= channels) ” 
  &&  “ (left = ((dw_output_at (D) ((output_width - pixels ))) + (4 * (channels - remaining ) ) )) ” 
  &&  “ (right = ((dw_output_at ((dw_rebase (D) (out2))) ((output_width - pixels ))) + (4 * (channels - remaining ) ) )) ” 
  &&  “ (0 < remaining) ” 
  &&  “ (left <> 0) ” 
  &&  “ (right <> 0) ” 
  &&  “ (dw_owned W1 left ) ” 
  &&  “ (dw_owned W2 right ) ” 
  &&  “ (dw_output_ready O1 left ) ” 
  &&  “ (dw_output_ready O2 right ) ” 
  &&  “ (dw_observed_pair O1 O2 left right ) ”
  &&  (dw_output W2 O2 )
  **  (dw_output W1 O1 )
.

Definition compare_outputs_partial_solve_wit_2 := compare_outputs_partial_solve_wit_2_pure -> compare_outputs_partial_solve_wit_2_aux.

Definition compare_outputs_partial_solve_wit_3_pure := 
(
forall (O2: DwOutput) (O1: DwOutput) (W2: (@list Z)) (W1: (@list Z)) (out2: Z) (D: DwProgram) (channels: Z) (output_width: Z) (output_increment: Z) (pixels: Z) (remaining: Z) (left: Z) (right: Z) (retval: fp32) (retval_2: fp32) (PreH1 : (dw_initialized O2 right retval_2 )) (PreH2 : (dw_initialized O1 left retval )) (PreH3 : (channels = (dw_channels (D)))) (PreH4 : (output_width = (dw_width (D)))) (PreH5 : (output_increment = (dw_out_increment (D)))) (PreH6 : (0 < channels)) (PreH7 : (0 < output_width)) (PreH8 : (dw_distinct W1 )) (PreH9 : (dw_distinct W2 )) (PreH10 : (dw_output_domain W1 D )) (PreH11 : (dw_output_domain W2 (dw_rebase (D) (out2)) )) (PreH12 : (dw_pair_observed D out2 O1 O2 )) (PreH13 : (0 < pixels)) (PreH14 : (pixels <= output_width)) (PreH15 : (0 <= remaining)) (PreH16 : (remaining <= channels)) (PreH17 : (left = ((dw_output_at (D) ((output_width - pixels ))) + (4 * (channels - remaining ) ) ))) (PreH18 : (right = ((dw_output_at ((dw_rebase (D) (out2))) ((output_width - pixels ))) + (4 * (channels - remaining ) ) ))) (PreH19 : (0 < remaining)) (PreH20 : (left <> 0)) (PreH21 : (right <> 0)) (PreH22 : (dw_owned W1 left )) (PreH23 : (dw_owned W2 right )) (PreH24 : (dw_output_ready O1 left )) (PreH25 : (dw_output_ready O2 right )) (PreH26 : (dw_observed_pair O1 O2 left right )) ,
  (dw_output W2 O2 )
  **  ((( &( "y" ) )) # Float  |-> retval_2)
  **  (dw_output W1 O1 )
  **  ((( &( "x" ) )) # Float  |-> retval)
  **  ((( &( "channels" ) )) # UInt64  |-> channels)
  **  ((( &( "output_width" ) )) # UInt64  |-> output_width)
  **  ((( &( "output_increment" ) )) # UInt64  |-> output_increment)
  **  ((( &( "pixels" ) )) # UInt64  |-> pixels)
  **  ((( &( "remaining" ) )) # UInt64  |-> remaining)
  **  ((( &( "left" ) )) # Ptr  |-> left)
  **  ((( &( "right" ) )) # Ptr  |-> right)
|--
  “ (same_value retval retval_2 ) ”
) \/
(
forall (O2: DwOutput) (O1: DwOutput) (W2: (@list Z)) (W1: (@list Z)) (out2: Z) (D: DwProgram) (channels: Z) (output_width: Z) (output_increment: Z) (pixels: Z) (remaining: Z) (left: Z) (right: Z) (retval: fp32) (retval_2: fp32) (PreH1 : (remaining <= UINT64_MAX)) (PreH2 : (pixels <= UINT64_MAX)) (PreH3 : (output_increment <= UINT64_MAX)) (PreH4 : (output_width <= UINT64_MAX)) (PreH5 : (channels <= UINT64_MAX)) (PreH6 : (remaining >= 0)) (PreH7 : (pixels >= 0)) (PreH8 : (output_increment >= 0)) (PreH9 : (output_width >= 0)) (PreH10 : (channels >= 0)) (PreH11 : (dw_initialized O2 right retval_2 )) (PreH12 : (dw_initialized O1 left retval )) (PreH13 : (channels = (dw_channels (D)))) (PreH14 : (output_width = (dw_width (D)))) (PreH15 : (output_increment = (dw_out_increment (D)))) (PreH16 : (0 < channels)) (PreH17 : (0 < output_width)) (PreH18 : (dw_distinct W1 )) (PreH19 : (dw_distinct W2 )) (PreH20 : (dw_output_domain W1 D )) (PreH21 : (dw_output_domain W2 (dw_rebase (D) (out2)) )) (PreH22 : (dw_pair_observed D out2 O1 O2 )) (PreH23 : (0 < pixels)) (PreH24 : (pixels <= output_width)) (PreH25 : (0 <= remaining)) (PreH26 : (remaining <= channels)) (PreH27 : (left = ((dw_output_at (D) ((output_width - pixels ))) + (4 * (channels - remaining ) ) ))) (PreH28 : (right = ((dw_output_at ((dw_rebase (D) (out2))) ((output_width - pixels ))) + (4 * (channels - remaining ) ) ))) (PreH29 : (0 < remaining)) (PreH30 : (left <> 0)) (PreH31 : (right <> 0)) (PreH32 : (dw_owned W1 left )) (PreH33 : (dw_owned W2 right )) (PreH34 : (dw_output_ready O1 left )) (PreH35 : (dw_output_ready O2 right )) (PreH36 : (dw_observed_pair O1 O2 left right )) ,
  (dw_output W2 O2 )
  **  ((( &( "y" ) )) # Float  |-> retval_2)
  **  (dw_output W1 O1 )
  **  ((( &( "x" ) )) # Float  |-> retval)
  **  ((( &( "channels" ) )) # UInt64  |-> channels)
  **  ((( &( "output_width" ) )) # UInt64  |-> output_width)
  **  ((( &( "output_increment" ) )) # UInt64  |-> output_increment)
  **  ((( &( "pixels" ) )) # UInt64  |-> pixels)
  **  ((( &( "remaining" ) )) # UInt64  |-> remaining)
  **  ((( &( "left" ) )) # Ptr  |-> left)
  **  ((( &( "right" ) )) # Ptr  |-> right)
|--
  “ (same_value retval retval_2 ) ”
).

Definition compare_outputs_partial_solve_wit_3_pure_split_goal_1 := 
forall (O2: DwOutput) (O1: DwOutput) (W2: (@list Z)) (W1: (@list Z)) (out2: Z) (D: DwProgram) (channels: Z) (output_width: Z) (output_increment: Z) (pixels: Z) (remaining: Z) (left: Z) (right: Z) (retval: fp32) (retval_2: fp32) (PreH1 : (remaining <= UINT64_MAX)) (PreH2 : (pixels <= UINT64_MAX)) (PreH3 : (output_increment <= UINT64_MAX)) (PreH4 : (output_width <= UINT64_MAX)) (PreH5 : (channels <= UINT64_MAX)) (PreH6 : (remaining >= 0)) (PreH7 : (pixels >= 0)) (PreH8 : (output_increment >= 0)) (PreH9 : (output_width >= 0)) (PreH10 : (channels >= 0)) (PreH11 : (dw_initialized O2 right retval_2 )) (PreH12 : (dw_initialized O1 left retval )) (PreH13 : (channels = (dw_channels (D)))) (PreH14 : (output_width = (dw_width (D)))) (PreH15 : (output_increment = (dw_out_increment (D)))) (PreH16 : (0 < channels)) (PreH17 : (0 < output_width)) (PreH18 : (dw_distinct W1 )) (PreH19 : (dw_distinct W2 )) (PreH20 : (dw_output_domain W1 D )) (PreH21 : (dw_output_domain W2 (dw_rebase (D) (out2)) )) (PreH22 : (dw_pair_observed D out2 O1 O2 )) (PreH23 : (0 < pixels)) (PreH24 : (pixels <= output_width)) (PreH25 : (0 <= remaining)) (PreH26 : (remaining <= channels)) (PreH27 : (left = ((dw_output_at (D) ((output_width - pixels ))) + (4 * (channels - remaining ) ) ))) (PreH28 : (right = ((dw_output_at ((dw_rebase (D) (out2))) ((output_width - pixels ))) + (4 * (channels - remaining ) ) ))) (PreH29 : (0 < remaining)) (PreH30 : (left <> 0)) (PreH31 : (right <> 0)) (PreH32 : (dw_owned W1 left )) (PreH33 : (dw_owned W2 right )) (PreH34 : (dw_output_ready O1 left )) (PreH35 : (dw_output_ready O2 right )) (PreH36 : (dw_observed_pair O1 O2 left right )) ,
  (dw_output W2 O2 )
  **  ((( &( "y" ) )) # Float  |-> retval_2)
  **  (dw_output W1 O1 )
  **  ((( &( "x" ) )) # Float  |-> retval)
  **  ((( &( "channels" ) )) # UInt64  |-> channels)
  **  ((( &( "output_width" ) )) # UInt64  |-> output_width)
  **  ((( &( "output_increment" ) )) # UInt64  |-> output_increment)
  **  ((( &( "pixels" ) )) # UInt64  |-> pixels)
  **  ((( &( "remaining" ) )) # UInt64  |-> remaining)
  **  ((( &( "left" ) )) # Ptr  |-> left)
  **  ((( &( "right" ) )) # Ptr  |-> right)
|--
  “ (same_value retval retval_2 ) ”
.

Definition compare_outputs_partial_solve_wit_3_aux := 
forall (O2: DwOutput) (O1: DwOutput) (W2: (@list Z)) (W1: (@list Z)) (out2: Z) (D: DwProgram) (channels: Z) (output_width: Z) (output_increment: Z) (pixels: Z) (remaining: Z) (left: Z) (right: Z) (retval: fp32) (retval_2: fp32) (PreH1 : (dw_initialized O2 right retval_2 )) (PreH2 : (dw_initialized O1 left retval )) (PreH3 : (channels = (dw_channels (D)))) (PreH4 : (output_width = (dw_width (D)))) (PreH5 : (output_increment = (dw_out_increment (D)))) (PreH6 : (0 < channels)) (PreH7 : (0 < output_width)) (PreH8 : (dw_distinct W1 )) (PreH9 : (dw_distinct W2 )) (PreH10 : (dw_output_domain W1 D )) (PreH11 : (dw_output_domain W2 (dw_rebase (D) (out2)) )) (PreH12 : (dw_pair_observed D out2 O1 O2 )) (PreH13 : (0 < pixels)) (PreH14 : (pixels <= output_width)) (PreH15 : (0 <= remaining)) (PreH16 : (remaining <= channels)) (PreH17 : (left = ((dw_output_at (D) ((output_width - pixels ))) + (4 * (channels - remaining ) ) ))) (PreH18 : (right = ((dw_output_at ((dw_rebase (D) (out2))) ((output_width - pixels ))) + (4 * (channels - remaining ) ) ))) (PreH19 : (0 < remaining)) (PreH20 : (left <> 0)) (PreH21 : (right <> 0)) (PreH22 : (dw_owned W1 left )) (PreH23 : (dw_owned W2 right )) (PreH24 : (dw_output_ready O1 left )) (PreH25 : (dw_output_ready O2 right )) (PreH26 : (dw_observed_pair O1 O2 left right )) ,
  (dw_output W2 O2 )
  **  (dw_output W1 O1 )
|--
  “ (same_value retval retval_2 ) ” 
  &&  “ (dw_initialized O2 right retval_2 ) ” 
  &&  “ (dw_initialized O1 left retval ) ” 
  &&  “ (channels = (dw_channels (D))) ” 
  &&  “ (output_width = (dw_width (D))) ” 
  &&  “ (output_increment = (dw_out_increment (D))) ” 
  &&  “ (0 < channels) ” 
  &&  “ (0 < output_width) ” 
  &&  “ (dw_distinct W1 ) ” 
  &&  “ (dw_distinct W2 ) ” 
  &&  “ (dw_output_domain W1 D ) ” 
  &&  “ (dw_output_domain W2 (dw_rebase (D) (out2)) ) ” 
  &&  “ (dw_pair_observed D out2 O1 O2 ) ” 
  &&  “ (0 < pixels) ” 
  &&  “ (pixels <= output_width) ” 
  &&  “ (0 <= remaining) ” 
  &&  “ (remaining <= channels) ” 
  &&  “ (left = ((dw_output_at (D) ((output_width - pixels ))) + (4 * (channels - remaining ) ) )) ” 
  &&  “ (right = ((dw_output_at ((dw_rebase (D) (out2))) ((output_width - pixels ))) + (4 * (channels - remaining ) ) )) ” 
  &&  “ (0 < remaining) ” 
  &&  “ (left <> 0) ” 
  &&  “ (right <> 0) ” 
  &&  “ (dw_owned W1 left ) ” 
  &&  “ (dw_owned W2 right ) ” 
  &&  “ (dw_output_ready O1 left ) ” 
  &&  “ (dw_output_ready O2 right ) ” 
  &&  “ (dw_observed_pair O1 O2 left right ) ”
  &&  (dw_output W2 O2 )
  **  (dw_output W1 O1 )
.

Definition compare_outputs_partial_solve_wit_3 := compare_outputs_partial_solve_wit_3_pure -> compare_outputs_partial_solve_wit_3_aux.

Module Type VC_Correct.


Axiom proof_of_compare_outputs_safety_wit_1 : compare_outputs_safety_wit_1.
Axiom proof_of_compare_outputs_safety_wit_2 : compare_outputs_safety_wit_2.
Axiom proof_of_compare_outputs_safety_wit_3 : compare_outputs_safety_wit_3.
Axiom proof_of_compare_outputs_safety_wit_4 : compare_outputs_safety_wit_4.
Axiom proof_of_compare_outputs_entail_wit_1 : compare_outputs_entail_wit_1.
Axiom proof_of_compare_outputs_entail_wit_2 : compare_outputs_entail_wit_2.
Axiom proof_of_compare_outputs_entail_wit_3 : compare_outputs_entail_wit_3.
Axiom proof_of_compare_outputs_entail_wit_4 : compare_outputs_entail_wit_4.
Axiom proof_of_compare_outputs_entail_wit_5 : compare_outputs_entail_wit_5.
Axiom proof_of_compare_outputs_return_wit_1 : compare_outputs_return_wit_1.
Axiom proof_of_compare_outputs_partial_solve_wit_1_pure : compare_outputs_partial_solve_wit_1_pure.
Axiom proof_of_compare_outputs_partial_solve_wit_1 : compare_outputs_partial_solve_wit_1.
Axiom proof_of_compare_outputs_partial_solve_wit_2_pure : compare_outputs_partial_solve_wit_2_pure.
Axiom proof_of_compare_outputs_partial_solve_wit_2 : compare_outputs_partial_solve_wit_2.
Axiom proof_of_compare_outputs_partial_solve_wit_3_pure : compare_outputs_partial_solve_wit_3_pure.
Axiom proof_of_compare_outputs_partial_solve_wit_3 : compare_outputs_partial_solve_wit_3.

End VC_Correct.
