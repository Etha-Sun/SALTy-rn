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
From HwcConv Require Import public_mode_def.
Import Snaive_C_Rules64.
Require Import HwcConv.Types.
Require Import HwcConv.VectorRecords.
Require Import HwcConv.FloatCopyModel.
Require Import HwcConv.ClampModel HwcConv.MaskModel.
Require Import HwcConv.MemoryFacts HwcConv.FloatCopyModel.
Require Import HwcConv.StoreViewsModel.
Require Import HwcConv.RvvViewsModel.
Require Import HwcConv.SupportModel.
Require Import HwcConv.KernelPointers HwcConv.RvvMaskBounds.
Require Import HwcConv.NeonViewsModel.
Require Import HwcConv.NeonKernelModel.
Import HwcConv.HwcPublicObservationModel.
Local Open Scope sac.
From HwcConv Require Import hc_maps_strategy_goal.
From HwcConv Require Import hc_maps_strategy_proof.

(*----- Function hwc_public_mode -----*)

Definition hwc_public_mode_safety_wit_1 := 
forall (params_pre: Z) (output_channel_stride_pre: Z) (output_height_stride_pre: Z) (output_channels_pre: Z) (input_padding_top_pre: Z) (output_pre: Z) (weights_pre: Z) (zero_pre: Z) (input_pre: Z) (output_y_end_pre: Z) (output_y_start_pre: Z) (input_width_pre: Z) (input_height_pre: Z) (use_rvv_pre: Z) (Hi: fp32) (Lo: fp32) (Cs: Z) (Hs: Z) (Cn: Z) (Params: Z) (Output: Z) (Weights: Z) (Zero: Z) (Input: Z) (End: Z) (Start: Z) (Top: Z) (N: Z) (H: Z) (W: (@list Z)) (O: HwcOutput) (F: HwcROMap) (PreH1 : (input_height_pre = H)) (PreH2 : (input_width_pre = N)) (PreH3 : (input_padding_top_pre = Top)) (PreH4 : (output_y_start_pre = Start)) (PreH5 : (output_y_end_pre = End)) (PreH6 : (input_pre = Input)) (PreH7 : (zero_pre = Zero)) (PreH8 : (weights_pre = Weights)) (PreH9 : (output_pre = Output)) (PreH10 : (params_pre = Params)) (PreH11 : (output_channels_pre = Cn)) (PreH12 : (output_height_stride_pre = Hs)) (PreH13 : (output_channel_stride_pre = Cs)) (PreH14 : (hc_input_domain F Input Zero Weights Params H N Top Start End Cn )) (PreH15 : (hc_output_layout Output Hs Cs H N Cn End )) (PreH16 : (hc_output_owned W Output Hs Cs Cn Start End ((N + 1 ) ÷ 2 ) )) (PreH17 : (hc_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min") )) (PreH18 : (hc_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max") )) (PreH19 : (hc_same_bits (hc_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min"))) Lo )) (PreH20 : (hc_same_bits (hc_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max"))) Hi )) (PreH21 : (0 < H)) (PreH22 : (0 < N)) (PreH23 : (0 < Cn)) (PreH24 : (0 <= Top)) (PreH25 : (Top <= 1)) (PreH26 : (0 <= Start)) (PreH27 : (Start < End)) ,
  ((( &( "use_rvv" ) )) # UInt  |-> use_rvv_pre)
  **  ((( &( "input_height" ) )) # UInt64  |-> input_height_pre)
  **  ((( &( "input_width" ) )) # UInt64  |-> input_width_pre)
  **  ((( &( "output_y_start" ) )) # UInt64  |-> output_y_start_pre)
  **  ((( &( "output_y_end" ) )) # UInt64  |-> output_y_end_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "zero" ) )) # Ptr  |-> zero_pre)
  **  ((( &( "weights" ) )) # Ptr  |-> weights_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "input_padding_top" ) )) # UInt64  |-> input_padding_top_pre)
  **  ((( &( "output_channels" ) )) # UInt64  |-> output_channels_pre)
  **  ((( &( "output_height_stride" ) )) # UInt64  |-> output_height_stride_pre)
  **  ((( &( "output_channel_stride" ) )) # UInt64  |-> output_channel_stride_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (hc_data F )
  **  (hc_output W O )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition hwc_public_mode_safety_wit_2 := 
forall (params_pre: Z) (output_channel_stride_pre: Z) (output_height_stride_pre: Z) (output_channels_pre: Z) (input_padding_top_pre: Z) (output_pre: Z) (weights_pre: Z) (zero_pre: Z) (input_pre: Z) (output_y_end_pre: Z) (output_y_start_pre: Z) (input_width_pre: Z) (input_height_pre: Z) (use_rvv_pre: Z) (Hi: fp32) (Lo: fp32) (Cs: Z) (Hs: Z) (Cn: Z) (Params: Z) (Output: Z) (Weights: Z) (Zero: Z) (Input: Z) (End: Z) (Start: Z) (Top: Z) (N: Z) (H: Z) (W: (@list Z)) (O: HwcOutput) (F: HwcROMap) (PreH1 : (use_rvv_pre = 0)) (PreH2 : (input_height_pre = H)) (PreH3 : (input_width_pre = N)) (PreH4 : (input_padding_top_pre = Top)) (PreH5 : (output_y_start_pre = Start)) (PreH6 : (output_y_end_pre = End)) (PreH7 : (input_pre = Input)) (PreH8 : (zero_pre = Zero)) (PreH9 : (weights_pre = Weights)) (PreH10 : (output_pre = Output)) (PreH11 : (params_pre = Params)) (PreH12 : (output_channels_pre = Cn)) (PreH13 : (output_height_stride_pre = Hs)) (PreH14 : (output_channel_stride_pre = Cs)) (PreH15 : (hc_input_domain F Input Zero Weights Params H N Top Start End Cn )) (PreH16 : (hc_output_layout Output Hs Cs H N Cn End )) (PreH17 : (hc_output_owned W Output Hs Cs Cn Start End ((N + 1 ) ÷ 2 ) )) (PreH18 : (hc_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min") )) (PreH19 : (hc_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max") )) (PreH20 : (hc_same_bits (hc_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min"))) Lo )) (PreH21 : (hc_same_bits (hc_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max"))) Hi )) (PreH22 : (0 < H)) (PreH23 : (0 < N)) (PreH24 : (0 < Cn)) (PreH25 : (0 <= Top)) (PreH26 : (Top <= 1)) (PreH27 : (0 <= Start)) (PreH28 : (Start < End)) ,
  (hc_data F )
  **  (hc_output W (hc_final ((hc_visible ((hc_neon_raw (F) (input_pre) (zero_pre) (weights_pre) (input_height_pre) (input_width_pre) (input_padding_top_pre) (Lo) (Hi))) (output_channels_pre))) (O) (output_pre) (output_height_stride_pre) (output_channel_stride_pre) (output_channels_pre) (output_y_start_pre) (output_y_end_pre) (((input_width_pre + 1 ) ÷ 2 ))) )
  **  ((( &( "use_rvv" ) )) # UInt  |-> use_rvv_pre)
  **  ((( &( "input_height" ) )) # UInt64  |-> input_height_pre)
  **  ((( &( "input_width" ) )) # UInt64  |-> input_width_pre)
  **  ((( &( "output_y_start" ) )) # UInt64  |-> output_y_start_pre)
  **  ((( &( "output_y_end" ) )) # UInt64  |-> output_y_end_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "zero" ) )) # Ptr  |-> zero_pre)
  **  ((( &( "weights" ) )) # Ptr  |-> weights_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "input_padding_top" ) )) # UInt64  |-> input_padding_top_pre)
  **  ((( &( "output_channels" ) )) # UInt64  |-> output_channels_pre)
  **  ((( &( "output_height_stride" ) )) # UInt64  |-> output_height_stride_pre)
  **  ((( &( "output_channel_stride" ) )) # UInt64  |-> output_channel_stride_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition hwc_public_mode_safety_wit_3 := 
forall (params_pre: Z) (output_channel_stride_pre: Z) (output_height_stride_pre: Z) (output_channels_pre: Z) (input_padding_top_pre: Z) (output_pre: Z) (weights_pre: Z) (zero_pre: Z) (input_pre: Z) (output_y_end_pre: Z) (output_y_start_pre: Z) (input_width_pre: Z) (input_height_pre: Z) (use_rvv_pre: Z) (Hi: fp32) (Lo: fp32) (Cs: Z) (Hs: Z) (Cn: Z) (Params: Z) (Output: Z) (Weights: Z) (Zero: Z) (Input: Z) (End: Z) (Start: Z) (Top: Z) (N: Z) (H: Z) (W: (@list Z)) (O: HwcOutput) (F: HwcROMap) (PreH1 : (use_rvv_pre <> 0)) (PreH2 : (input_height_pre = H)) (PreH3 : (input_width_pre = N)) (PreH4 : (input_padding_top_pre = Top)) (PreH5 : (output_y_start_pre = Start)) (PreH6 : (output_y_end_pre = End)) (PreH7 : (input_pre = Input)) (PreH8 : (zero_pre = Zero)) (PreH9 : (weights_pre = Weights)) (PreH10 : (output_pre = Output)) (PreH11 : (params_pre = Params)) (PreH12 : (output_channels_pre = Cn)) (PreH13 : (output_height_stride_pre = Hs)) (PreH14 : (output_channel_stride_pre = Cs)) (PreH15 : (hc_input_domain F Input Zero Weights Params H N Top Start End Cn )) (PreH16 : (hc_output_layout Output Hs Cs H N Cn End )) (PreH17 : (hc_output_owned W Output Hs Cs Cn Start End ((N + 1 ) ÷ 2 ) )) (PreH18 : (hc_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min") )) (PreH19 : (hc_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max") )) (PreH20 : (hc_same_bits (hc_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min"))) Lo )) (PreH21 : (hc_same_bits (hc_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max"))) Hi )) (PreH22 : (0 < H)) (PreH23 : (0 < N)) (PreH24 : (0 < Cn)) (PreH25 : (0 <= Top)) (PreH26 : (Top <= 1)) (PreH27 : (0 <= Start)) (PreH28 : (Start < End)) ,
  (hc_data F )
  **  (hc_output W (hc_final ((hc_visible ((hc_rvv_raw (F) (input_pre) (zero_pre) (weights_pre) (input_height_pre) (input_width_pre) (input_padding_top_pre) (Lo) (Hi))) (output_channels_pre))) (O) (output_pre) (output_height_stride_pre) (output_channel_stride_pre) (output_channels_pre) (output_y_start_pre) (output_y_end_pre) (((input_width_pre + 1 ) ÷ 2 ))) )
  **  ((( &( "use_rvv" ) )) # UInt  |-> use_rvv_pre)
  **  ((( &( "input_height" ) )) # UInt64  |-> input_height_pre)
  **  ((( &( "input_width" ) )) # UInt64  |-> input_width_pre)
  **  ((( &( "output_y_start" ) )) # UInt64  |-> output_y_start_pre)
  **  ((( &( "output_y_end" ) )) # UInt64  |-> output_y_end_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "zero" ) )) # Ptr  |-> zero_pre)
  **  ((( &( "weights" ) )) # Ptr  |-> weights_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "input_padding_top" ) )) # UInt64  |-> input_padding_top_pre)
  **  ((( &( "output_channels" ) )) # UInt64  |-> output_channels_pre)
  **  ((( &( "output_height_stride" ) )) # UInt64  |-> output_height_stride_pre)
  **  ((( &( "output_channel_stride" ) )) # UInt64  |-> output_channel_stride_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition hwc_public_mode_return_wit_1 := 
(
forall (params_pre: Z) (output_channel_stride_pre: Z) (output_height_stride_pre: Z) (output_channels_pre: Z) (input_padding_top_pre: Z) (output_pre: Z) (weights_pre: Z) (zero_pre: Z) (input_pre: Z) (output_y_end_pre: Z) (output_y_start_pre: Z) (input_width_pre: Z) (input_height_pre: Z) (use_rvv_pre: Z) (Hi: fp32) (Lo: fp32) (Cs: Z) (Hs: Z) (Cn: Z) (Params: Z) (Output: Z) (Weights: Z) (Zero: Z) (Input: Z) (End: Z) (Start: Z) (Top: Z) (N: Z) (H: Z) (W: (@list Z)) (O: HwcOutput) (F: HwcROMap) (PreH1 : (use_rvv_pre = 0)) (PreH2 : (input_height_pre = H)) (PreH3 : (input_width_pre = N)) (PreH4 : (input_padding_top_pre = Top)) (PreH5 : (output_y_start_pre = Start)) (PreH6 : (output_y_end_pre = End)) (PreH7 : (input_pre = Input)) (PreH8 : (zero_pre = Zero)) (PreH9 : (weights_pre = Weights)) (PreH10 : (output_pre = Output)) (PreH11 : (params_pre = Params)) (PreH12 : (output_channels_pre = Cn)) (PreH13 : (output_height_stride_pre = Hs)) (PreH14 : (output_channel_stride_pre = Cs)) (PreH15 : (hc_input_domain F Input Zero Weights Params H N Top Start End Cn )) (PreH16 : (hc_output_layout Output Hs Cs H N Cn End )) (PreH17 : (hc_output_owned W Output Hs Cs Cn Start End ((N + 1 ) ÷ 2 ) )) (PreH18 : (hc_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min") )) (PreH19 : (hc_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max") )) (PreH20 : (hc_same_bits (hc_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min"))) Lo )) (PreH21 : (hc_same_bits (hc_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max"))) Hi )) (PreH22 : (0 < H)) (PreH23 : (0 < N)) (PreH24 : (0 < Cn)) (PreH25 : (0 <= Top)) (PreH26 : (Top <= 1)) (PreH27 : (0 <= Start)) (PreH28 : (Start < End)) ,
  (hc_data F )
  **  (hc_output W (hc_final ((hc_visible ((hc_neon_raw (F) (input_pre) (zero_pre) (weights_pre) (input_height_pre) (input_width_pre) (input_padding_top_pre) (Lo) (Hi))) (output_channels_pre))) (O) (output_pre) (output_height_stride_pre) (output_channel_stride_pre) (output_channels_pre) (output_y_start_pre) (output_y_end_pre) (((input_width_pre + 1 ) ÷ 2 ))) )
|--
  EX (OA: HwcOutput) ,
  “ (1 = 1) ” 
  &&  “ (hwp_state_observe (hc_final ((hc_visible ((hc_neon_raw (F) (Input) (Zero) (Weights) (H) (N) (Top) (Lo) (Hi))) (Cn))) (O) (Output) (Hs) (Cs) (Cn) (Start) (End) (((N + 1 ) ÷ 2 ))) OA ) ” 
  &&  “ (hwp_unwritten_frame O OA Output Hs Cs Cn Start End ((N + 1 ) ÷ 2 ) ) ”
  &&  (hc_data F )
  **  (hc_output W OA )
) \/
(
forall (params_pre: Z) (output_channel_stride_pre: Z) (output_height_stride_pre: Z) (output_channels_pre: Z) (input_padding_top_pre: Z) (output_pre: Z) (weights_pre: Z) (zero_pre: Z) (input_pre: Z) (output_y_end_pre: Z) (output_y_start_pre: Z) (input_width_pre: Z) (input_height_pre: Z) (use_rvv_pre: Z) (Hi: fp32) (Lo: fp32) (Cs: Z) (Hs: Z) (Cn: Z) (Params: Z) (Output: Z) (Weights: Z) (Zero: Z) (Input: Z) (End: Z) (Start: Z) (Top: Z) (N: Z) (H: Z) (W: (@list Z)) (O: HwcOutput) (F: HwcROMap) (PreH1 : (use_rvv_pre = 0)) (PreH2 : (input_height_pre = H)) (PreH3 : (input_width_pre = N)) (PreH4 : (input_padding_top_pre = Top)) (PreH5 : (output_y_start_pre = Start)) (PreH6 : (output_y_end_pre = End)) (PreH7 : (input_pre = Input)) (PreH8 : (zero_pre = Zero)) (PreH9 : (weights_pre = Weights)) (PreH10 : (output_pre = Output)) (PreH11 : (params_pre = Params)) (PreH12 : (output_channels_pre = Cn)) (PreH13 : (output_height_stride_pre = Hs)) (PreH14 : (output_channel_stride_pre = Cs)) (PreH15 : (hc_input_domain F Input Zero Weights Params H N Top Start End Cn )) (PreH16 : (hc_output_layout Output Hs Cs H N Cn End )) (PreH17 : (hc_output_owned W Output Hs Cs Cn Start End ((N + 1 ) ÷ 2 ) )) (PreH18 : (hc_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min") )) (PreH19 : (hc_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max") )) (PreH20 : (hc_same_bits (hc_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min"))) Lo )) (PreH21 : (hc_same_bits (hc_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max"))) Hi )) (PreH22 : (0 < H)) (PreH23 : (0 < N)) (PreH24 : (0 < Cn)) (PreH25 : (0 <= Top)) (PreH26 : (Top <= 1)) (PreH27 : (0 <= Start)) (PreH28 : (Start < End)) ,
  TT && emp 
|--
  “ (hwp_unwritten_frame O (hc_final ((hc_visible ((hc_neon_raw (F) (input_pre) (zero_pre) (weights_pre) (input_height_pre) (input_width_pre) (input_padding_top_pre) (Lo) (Hi))) (output_channels_pre))) (O) (output_pre) (output_height_stride_pre) (output_channel_stride_pre) (output_channels_pre) (output_y_start_pre) (output_y_end_pre) (((input_width_pre + 1 ) ÷ 2 ))) output_pre output_height_stride_pre output_channel_stride_pre output_channels_pre output_y_start_pre output_y_end_pre ((input_width_pre + 1 ) ÷ 2 ) ) ” 
  &&  “ (hwp_state_observe (hc_final ((hc_visible ((hc_neon_raw (F) (input_pre) (zero_pre) (weights_pre) (input_height_pre) (input_width_pre) (input_padding_top_pre) (Lo) (Hi))) (output_channels_pre))) (O) (output_pre) (output_height_stride_pre) (output_channel_stride_pre) (output_channels_pre) (output_y_start_pre) (output_y_end_pre) (((input_width_pre + 1 ) ÷ 2 ))) (hc_final ((hc_visible ((hc_neon_raw (F) (input_pre) (zero_pre) (weights_pre) (input_height_pre) (input_width_pre) (input_padding_top_pre) (Lo) (Hi))) (output_channels_pre))) (O) (output_pre) (output_height_stride_pre) (output_channel_stride_pre) (output_channels_pre) (output_y_start_pre) (output_y_end_pre) (((input_width_pre + 1 ) ÷ 2 ))) ) ”
  &&  emp
).

Definition hwc_public_mode_return_wit_1_split_goal_1 := 
forall (params_pre: Z) (output_channel_stride_pre: Z) (output_height_stride_pre: Z) (output_channels_pre: Z) (input_padding_top_pre: Z) (output_pre: Z) (weights_pre: Z) (zero_pre: Z) (input_pre: Z) (output_y_end_pre: Z) (output_y_start_pre: Z) (input_width_pre: Z) (input_height_pre: Z) (use_rvv_pre: Z) (Hi: fp32) (Lo: fp32) (Cs: Z) (Hs: Z) (Cn: Z) (Params: Z) (Output: Z) (Weights: Z) (Zero: Z) (Input: Z) (End: Z) (Start: Z) (Top: Z) (N: Z) (H: Z) (W: (@list Z)) (O: HwcOutput) (F: HwcROMap) (PreH1 : (use_rvv_pre = 0)) (PreH2 : (input_height_pre = H)) (PreH3 : (input_width_pre = N)) (PreH4 : (input_padding_top_pre = Top)) (PreH5 : (output_y_start_pre = Start)) (PreH6 : (output_y_end_pre = End)) (PreH7 : (input_pre = Input)) (PreH8 : (zero_pre = Zero)) (PreH9 : (weights_pre = Weights)) (PreH10 : (output_pre = Output)) (PreH11 : (params_pre = Params)) (PreH12 : (output_channels_pre = Cn)) (PreH13 : (output_height_stride_pre = Hs)) (PreH14 : (output_channel_stride_pre = Cs)) (PreH15 : (hc_input_domain F Input Zero Weights Params H N Top Start End Cn )) (PreH16 : (hc_output_layout Output Hs Cs H N Cn End )) (PreH17 : (hc_output_owned W Output Hs Cs Cn Start End ((N + 1 ) ÷ 2 ) )) (PreH18 : (hc_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min") )) (PreH19 : (hc_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max") )) (PreH20 : (hc_same_bits (hc_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min"))) Lo )) (PreH21 : (hc_same_bits (hc_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max"))) Hi )) (PreH22 : (0 < H)) (PreH23 : (0 < N)) (PreH24 : (0 < Cn)) (PreH25 : (0 <= Top)) (PreH26 : (Top <= 1)) (PreH27 : (0 <= Start)) (PreH28 : (Start < End)) ,
  (hwp_unwritten_frame O (hc_final ((hc_visible ((hc_neon_raw (F) (input_pre) (zero_pre) (weights_pre) (input_height_pre) (input_width_pre) (input_padding_top_pre) (Lo) (Hi))) (output_channels_pre))) (O) (output_pre) (output_height_stride_pre) (output_channel_stride_pre) (output_channels_pre) (output_y_start_pre) (output_y_end_pre) (((input_width_pre + 1 ) ÷ 2 ))) output_pre output_height_stride_pre output_channel_stride_pre output_channels_pre output_y_start_pre output_y_end_pre ((input_width_pre + 1 ) ÷ 2 ) )
.

Definition hwc_public_mode_return_wit_1_split_goal_2 := 
forall (params_pre: Z) (output_channel_stride_pre: Z) (output_height_stride_pre: Z) (output_channels_pre: Z) (input_padding_top_pre: Z) (output_pre: Z) (weights_pre: Z) (zero_pre: Z) (input_pre: Z) (output_y_end_pre: Z) (output_y_start_pre: Z) (input_width_pre: Z) (input_height_pre: Z) (use_rvv_pre: Z) (Hi: fp32) (Lo: fp32) (Cs: Z) (Hs: Z) (Cn: Z) (Params: Z) (Output: Z) (Weights: Z) (Zero: Z) (Input: Z) (End: Z) (Start: Z) (Top: Z) (N: Z) (H: Z) (W: (@list Z)) (O: HwcOutput) (F: HwcROMap) (PreH1 : (use_rvv_pre = 0)) (PreH2 : (input_height_pre = H)) (PreH3 : (input_width_pre = N)) (PreH4 : (input_padding_top_pre = Top)) (PreH5 : (output_y_start_pre = Start)) (PreH6 : (output_y_end_pre = End)) (PreH7 : (input_pre = Input)) (PreH8 : (zero_pre = Zero)) (PreH9 : (weights_pre = Weights)) (PreH10 : (output_pre = Output)) (PreH11 : (params_pre = Params)) (PreH12 : (output_channels_pre = Cn)) (PreH13 : (output_height_stride_pre = Hs)) (PreH14 : (output_channel_stride_pre = Cs)) (PreH15 : (hc_input_domain F Input Zero Weights Params H N Top Start End Cn )) (PreH16 : (hc_output_layout Output Hs Cs H N Cn End )) (PreH17 : (hc_output_owned W Output Hs Cs Cn Start End ((N + 1 ) ÷ 2 ) )) (PreH18 : (hc_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min") )) (PreH19 : (hc_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max") )) (PreH20 : (hc_same_bits (hc_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min"))) Lo )) (PreH21 : (hc_same_bits (hc_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max"))) Hi )) (PreH22 : (0 < H)) (PreH23 : (0 < N)) (PreH24 : (0 < Cn)) (PreH25 : (0 <= Top)) (PreH26 : (Top <= 1)) (PreH27 : (0 <= Start)) (PreH28 : (Start < End)) ,
  (hwp_state_observe (hc_final ((hc_visible ((hc_neon_raw (F) (input_pre) (zero_pre) (weights_pre) (input_height_pre) (input_width_pre) (input_padding_top_pre) (Lo) (Hi))) (output_channels_pre))) (O) (output_pre) (output_height_stride_pre) (output_channel_stride_pre) (output_channels_pre) (output_y_start_pre) (output_y_end_pre) (((input_width_pre + 1 ) ÷ 2 ))) (hc_final ((hc_visible ((hc_neon_raw (F) (input_pre) (zero_pre) (weights_pre) (input_height_pre) (input_width_pre) (input_padding_top_pre) (Lo) (Hi))) (output_channels_pre))) (O) (output_pre) (output_height_stride_pre) (output_channel_stride_pre) (output_channels_pre) (output_y_start_pre) (output_y_end_pre) (((input_width_pre + 1 ) ÷ 2 ))) )
.

Definition hwc_public_mode_return_wit_2 := 
(
forall (params_pre: Z) (output_channel_stride_pre: Z) (output_height_stride_pre: Z) (output_channels_pre: Z) (input_padding_top_pre: Z) (output_pre: Z) (weights_pre: Z) (zero_pre: Z) (input_pre: Z) (output_y_end_pre: Z) (output_y_start_pre: Z) (input_width_pre: Z) (input_height_pre: Z) (use_rvv_pre: Z) (Hi: fp32) (Lo: fp32) (Cs: Z) (Hs: Z) (Cn: Z) (Params: Z) (Output: Z) (Weights: Z) (Zero: Z) (Input: Z) (End: Z) (Start: Z) (Top: Z) (N: Z) (H: Z) (W: (@list Z)) (O: HwcOutput) (F: HwcROMap) (PreH1 : (use_rvv_pre <> 0)) (PreH2 : (input_height_pre = H)) (PreH3 : (input_width_pre = N)) (PreH4 : (input_padding_top_pre = Top)) (PreH5 : (output_y_start_pre = Start)) (PreH6 : (output_y_end_pre = End)) (PreH7 : (input_pre = Input)) (PreH8 : (zero_pre = Zero)) (PreH9 : (weights_pre = Weights)) (PreH10 : (output_pre = Output)) (PreH11 : (params_pre = Params)) (PreH12 : (output_channels_pre = Cn)) (PreH13 : (output_height_stride_pre = Hs)) (PreH14 : (output_channel_stride_pre = Cs)) (PreH15 : (hc_input_domain F Input Zero Weights Params H N Top Start End Cn )) (PreH16 : (hc_output_layout Output Hs Cs H N Cn End )) (PreH17 : (hc_output_owned W Output Hs Cs Cn Start End ((N + 1 ) ÷ 2 ) )) (PreH18 : (hc_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min") )) (PreH19 : (hc_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max") )) (PreH20 : (hc_same_bits (hc_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min"))) Lo )) (PreH21 : (hc_same_bits (hc_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max"))) Hi )) (PreH22 : (0 < H)) (PreH23 : (0 < N)) (PreH24 : (0 < Cn)) (PreH25 : (0 <= Top)) (PreH26 : (Top <= 1)) (PreH27 : (0 <= Start)) (PreH28 : (Start < End)) ,
  (hc_data F )
  **  (hc_output W (hc_final ((hc_visible ((hc_rvv_raw (F) (input_pre) (zero_pre) (weights_pre) (input_height_pre) (input_width_pre) (input_padding_top_pre) (Lo) (Hi))) (output_channels_pre))) (O) (output_pre) (output_height_stride_pre) (output_channel_stride_pre) (output_channels_pre) (output_y_start_pre) (output_y_end_pre) (((input_width_pre + 1 ) ÷ 2 ))) )
|--
  EX (OA: HwcOutput) ,
  “ (1 = 1) ” 
  &&  “ (hwp_state_observe (hc_final ((hc_visible ((hc_neon_raw (F) (Input) (Zero) (Weights) (H) (N) (Top) (Lo) (Hi))) (Cn))) (O) (Output) (Hs) (Cs) (Cn) (Start) (End) (((N + 1 ) ÷ 2 ))) OA ) ” 
  &&  “ (hwp_unwritten_frame O OA Output Hs Cs Cn Start End ((N + 1 ) ÷ 2 ) ) ”
  &&  (hc_data F )
  **  (hc_output W OA )
) \/
(
forall (params_pre: Z) (output_channel_stride_pre: Z) (output_height_stride_pre: Z) (output_channels_pre: Z) (input_padding_top_pre: Z) (output_pre: Z) (weights_pre: Z) (zero_pre: Z) (input_pre: Z) (output_y_end_pre: Z) (output_y_start_pre: Z) (input_width_pre: Z) (input_height_pre: Z) (use_rvv_pre: Z) (Hi: fp32) (Lo: fp32) (Cs: Z) (Hs: Z) (Cn: Z) (Params: Z) (Output: Z) (Weights: Z) (Zero: Z) (Input: Z) (End: Z) (Start: Z) (Top: Z) (N: Z) (H: Z) (W: (@list Z)) (O: HwcOutput) (F: HwcROMap) (PreH1 : (use_rvv_pre <> 0)) (PreH2 : (input_height_pre = H)) (PreH3 : (input_width_pre = N)) (PreH4 : (input_padding_top_pre = Top)) (PreH5 : (output_y_start_pre = Start)) (PreH6 : (output_y_end_pre = End)) (PreH7 : (input_pre = Input)) (PreH8 : (zero_pre = Zero)) (PreH9 : (weights_pre = Weights)) (PreH10 : (output_pre = Output)) (PreH11 : (params_pre = Params)) (PreH12 : (output_channels_pre = Cn)) (PreH13 : (output_height_stride_pre = Hs)) (PreH14 : (output_channel_stride_pre = Cs)) (PreH15 : (hc_input_domain F Input Zero Weights Params H N Top Start End Cn )) (PreH16 : (hc_output_layout Output Hs Cs H N Cn End )) (PreH17 : (hc_output_owned W Output Hs Cs Cn Start End ((N + 1 ) ÷ 2 ) )) (PreH18 : (hc_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min") )) (PreH19 : (hc_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max") )) (PreH20 : (hc_same_bits (hc_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min"))) Lo )) (PreH21 : (hc_same_bits (hc_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max"))) Hi )) (PreH22 : (0 < H)) (PreH23 : (0 < N)) (PreH24 : (0 < Cn)) (PreH25 : (0 <= Top)) (PreH26 : (Top <= 1)) (PreH27 : (0 <= Start)) (PreH28 : (Start < End)) ,
  TT && emp 
|--
  “ (hwp_unwritten_frame O (hc_final ((hc_visible ((hc_rvv_raw (F) (input_pre) (zero_pre) (weights_pre) (input_height_pre) (input_width_pre) (input_padding_top_pre) (Lo) (Hi))) (output_channels_pre))) (O) (output_pre) (output_height_stride_pre) (output_channel_stride_pre) (output_channels_pre) (output_y_start_pre) (output_y_end_pre) (((input_width_pre + 1 ) ÷ 2 ))) output_pre output_height_stride_pre output_channel_stride_pre output_channels_pre output_y_start_pre output_y_end_pre ((input_width_pre + 1 ) ÷ 2 ) ) ” 
  &&  “ (hwp_state_observe (hc_final ((hc_visible ((hc_neon_raw (F) (input_pre) (zero_pre) (weights_pre) (input_height_pre) (input_width_pre) (input_padding_top_pre) (Lo) (Hi))) (output_channels_pre))) (O) (output_pre) (output_height_stride_pre) (output_channel_stride_pre) (output_channels_pre) (output_y_start_pre) (output_y_end_pre) (((input_width_pre + 1 ) ÷ 2 ))) (hc_final ((hc_visible ((hc_rvv_raw (F) (input_pre) (zero_pre) (weights_pre) (input_height_pre) (input_width_pre) (input_padding_top_pre) (Lo) (Hi))) (output_channels_pre))) (O) (output_pre) (output_height_stride_pre) (output_channel_stride_pre) (output_channels_pre) (output_y_start_pre) (output_y_end_pre) (((input_width_pre + 1 ) ÷ 2 ))) ) ”
  &&  emp
).

Definition hwc_public_mode_return_wit_2_split_goal_1 := 
forall (params_pre: Z) (output_channel_stride_pre: Z) (output_height_stride_pre: Z) (output_channels_pre: Z) (input_padding_top_pre: Z) (output_pre: Z) (weights_pre: Z) (zero_pre: Z) (input_pre: Z) (output_y_end_pre: Z) (output_y_start_pre: Z) (input_width_pre: Z) (input_height_pre: Z) (use_rvv_pre: Z) (Hi: fp32) (Lo: fp32) (Cs: Z) (Hs: Z) (Cn: Z) (Params: Z) (Output: Z) (Weights: Z) (Zero: Z) (Input: Z) (End: Z) (Start: Z) (Top: Z) (N: Z) (H: Z) (W: (@list Z)) (O: HwcOutput) (F: HwcROMap) (PreH1 : (use_rvv_pre <> 0)) (PreH2 : (input_height_pre = H)) (PreH3 : (input_width_pre = N)) (PreH4 : (input_padding_top_pre = Top)) (PreH5 : (output_y_start_pre = Start)) (PreH6 : (output_y_end_pre = End)) (PreH7 : (input_pre = Input)) (PreH8 : (zero_pre = Zero)) (PreH9 : (weights_pre = Weights)) (PreH10 : (output_pre = Output)) (PreH11 : (params_pre = Params)) (PreH12 : (output_channels_pre = Cn)) (PreH13 : (output_height_stride_pre = Hs)) (PreH14 : (output_channel_stride_pre = Cs)) (PreH15 : (hc_input_domain F Input Zero Weights Params H N Top Start End Cn )) (PreH16 : (hc_output_layout Output Hs Cs H N Cn End )) (PreH17 : (hc_output_owned W Output Hs Cs Cn Start End ((N + 1 ) ÷ 2 ) )) (PreH18 : (hc_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min") )) (PreH19 : (hc_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max") )) (PreH20 : (hc_same_bits (hc_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min"))) Lo )) (PreH21 : (hc_same_bits (hc_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max"))) Hi )) (PreH22 : (0 < H)) (PreH23 : (0 < N)) (PreH24 : (0 < Cn)) (PreH25 : (0 <= Top)) (PreH26 : (Top <= 1)) (PreH27 : (0 <= Start)) (PreH28 : (Start < End)) ,
  (hwp_unwritten_frame O (hc_final ((hc_visible ((hc_rvv_raw (F) (input_pre) (zero_pre) (weights_pre) (input_height_pre) (input_width_pre) (input_padding_top_pre) (Lo) (Hi))) (output_channels_pre))) (O) (output_pre) (output_height_stride_pre) (output_channel_stride_pre) (output_channels_pre) (output_y_start_pre) (output_y_end_pre) (((input_width_pre + 1 ) ÷ 2 ))) output_pre output_height_stride_pre output_channel_stride_pre output_channels_pre output_y_start_pre output_y_end_pre ((input_width_pre + 1 ) ÷ 2 ) )
.

Definition hwc_public_mode_return_wit_2_split_goal_2 := 
forall (params_pre: Z) (output_channel_stride_pre: Z) (output_height_stride_pre: Z) (output_channels_pre: Z) (input_padding_top_pre: Z) (output_pre: Z) (weights_pre: Z) (zero_pre: Z) (input_pre: Z) (output_y_end_pre: Z) (output_y_start_pre: Z) (input_width_pre: Z) (input_height_pre: Z) (use_rvv_pre: Z) (Hi: fp32) (Lo: fp32) (Cs: Z) (Hs: Z) (Cn: Z) (Params: Z) (Output: Z) (Weights: Z) (Zero: Z) (Input: Z) (End: Z) (Start: Z) (Top: Z) (N: Z) (H: Z) (W: (@list Z)) (O: HwcOutput) (F: HwcROMap) (PreH1 : (use_rvv_pre <> 0)) (PreH2 : (input_height_pre = H)) (PreH3 : (input_width_pre = N)) (PreH4 : (input_padding_top_pre = Top)) (PreH5 : (output_y_start_pre = Start)) (PreH6 : (output_y_end_pre = End)) (PreH7 : (input_pre = Input)) (PreH8 : (zero_pre = Zero)) (PreH9 : (weights_pre = Weights)) (PreH10 : (output_pre = Output)) (PreH11 : (params_pre = Params)) (PreH12 : (output_channels_pre = Cn)) (PreH13 : (output_height_stride_pre = Hs)) (PreH14 : (output_channel_stride_pre = Cs)) (PreH15 : (hc_input_domain F Input Zero Weights Params H N Top Start End Cn )) (PreH16 : (hc_output_layout Output Hs Cs H N Cn End )) (PreH17 : (hc_output_owned W Output Hs Cs Cn Start End ((N + 1 ) ÷ 2 ) )) (PreH18 : (hc_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min") )) (PreH19 : (hc_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max") )) (PreH20 : (hc_same_bits (hc_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min"))) Lo )) (PreH21 : (hc_same_bits (hc_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max"))) Hi )) (PreH22 : (0 < H)) (PreH23 : (0 < N)) (PreH24 : (0 < Cn)) (PreH25 : (0 <= Top)) (PreH26 : (Top <= 1)) (PreH27 : (0 <= Start)) (PreH28 : (Start < End)) ,
  (hwp_state_observe (hc_final ((hc_visible ((hc_neon_raw (F) (input_pre) (zero_pre) (weights_pre) (input_height_pre) (input_width_pre) (input_padding_top_pre) (Lo) (Hi))) (output_channels_pre))) (O) (output_pre) (output_height_stride_pre) (output_channel_stride_pre) (output_channels_pre) (output_y_start_pre) (output_y_end_pre) (((input_width_pre + 1 ) ÷ 2 ))) (hc_final ((hc_visible ((hc_rvv_raw (F) (input_pre) (zero_pre) (weights_pre) (input_height_pre) (input_width_pre) (input_padding_top_pre) (Lo) (Hi))) (output_channels_pre))) (O) (output_pre) (output_height_stride_pre) (output_channel_stride_pre) (output_channels_pre) (output_y_start_pre) (output_y_end_pre) (((input_width_pre + 1 ) ÷ 2 ))) )
.

Definition hwc_public_mode_partial_solve_wit_1_pure := 
forall (params_pre: Z) (output_channel_stride_pre: Z) (output_height_stride_pre: Z) (output_channels_pre: Z) (input_padding_top_pre: Z) (output_pre: Z) (weights_pre: Z) (zero_pre: Z) (input_pre: Z) (output_y_end_pre: Z) (output_y_start_pre: Z) (input_width_pre: Z) (input_height_pre: Z) (use_rvv_pre: Z) (Hi: fp32) (Lo: fp32) (Cs: Z) (Hs: Z) (Cn: Z) (Params: Z) (Output: Z) (Weights: Z) (Zero: Z) (Input: Z) (End: Z) (Start: Z) (Top: Z) (N: Z) (H: Z) (W: (@list Z)) (O: HwcOutput) (F: HwcROMap) (PreH1 : (use_rvv_pre = 0)) (PreH2 : (input_height_pre = H)) (PreH3 : (input_width_pre = N)) (PreH4 : (input_padding_top_pre = Top)) (PreH5 : (output_y_start_pre = Start)) (PreH6 : (output_y_end_pre = End)) (PreH7 : (input_pre = Input)) (PreH8 : (zero_pre = Zero)) (PreH9 : (weights_pre = Weights)) (PreH10 : (output_pre = Output)) (PreH11 : (params_pre = Params)) (PreH12 : (output_channels_pre = Cn)) (PreH13 : (output_height_stride_pre = Hs)) (PreH14 : (output_channel_stride_pre = Cs)) (PreH15 : (hc_input_domain F Input Zero Weights Params H N Top Start End Cn )) (PreH16 : (hc_output_layout Output Hs Cs H N Cn End )) (PreH17 : (hc_output_owned W Output Hs Cs Cn Start End ((N + 1 ) ÷ 2 ) )) (PreH18 : (hc_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min") )) (PreH19 : (hc_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max") )) (PreH20 : (hc_same_bits (hc_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min"))) Lo )) (PreH21 : (hc_same_bits (hc_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max"))) Hi )) (PreH22 : (0 < H)) (PreH23 : (0 < N)) (PreH24 : (0 < Cn)) (PreH25 : (0 <= Top)) (PreH26 : (Top <= 1)) (PreH27 : (0 <= Start)) (PreH28 : (Start < End)) ,
  ((( &( "use_rvv" ) )) # UInt  |-> use_rvv_pre)
  **  ((( &( "input_height" ) )) # UInt64  |-> input_height_pre)
  **  ((( &( "input_width" ) )) # UInt64  |-> input_width_pre)
  **  ((( &( "output_y_start" ) )) # UInt64  |-> output_y_start_pre)
  **  ((( &( "output_y_end" ) )) # UInt64  |-> output_y_end_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "zero" ) )) # Ptr  |-> zero_pre)
  **  ((( &( "weights" ) )) # Ptr  |-> weights_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "input_padding_top" ) )) # UInt64  |-> input_padding_top_pre)
  **  ((( &( "output_channels" ) )) # UInt64  |-> output_channels_pre)
  **  ((( &( "output_height_stride" ) )) # UInt64  |-> output_height_stride_pre)
  **  ((( &( "output_channel_stride" ) )) # UInt64  |-> output_channel_stride_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (hc_data F )
  **  (hc_output W O )
|--
  “ (input_height_pre = input_height_pre) ” 
  &&  “ (input_width_pre = input_width_pre) ” 
  &&  “ (input_padding_top_pre = input_padding_top_pre) ” 
  &&  “ (output_y_start_pre = output_y_start_pre) ” 
  &&  “ (output_y_end_pre = output_y_end_pre) ” 
  &&  “ (input_pre = input_pre) ” 
  &&  “ (zero_pre = zero_pre) ” 
  &&  “ (weights_pre = weights_pre) ” 
  &&  “ (output_pre = output_pre) ” 
  &&  “ (params_pre = params_pre) ” 
  &&  “ (output_channels_pre = output_channels_pre) ” 
  &&  “ (output_height_stride_pre = output_height_stride_pre) ” 
  &&  “ (output_channel_stride_pre = output_channel_stride_pre) ” 
  &&  “ (hc_input_domain F input_pre zero_pre weights_pre params_pre input_height_pre input_width_pre input_padding_top_pre output_y_start_pre output_y_end_pre output_channels_pre ) ” 
  &&  “ (hc_output_layout output_pre output_height_stride_pre output_channel_stride_pre input_height_pre input_width_pre output_channels_pre output_y_end_pre ) ” 
  &&  “ (hc_output_owned W output_pre output_height_stride_pre output_channel_stride_pre output_channels_pre output_y_start_pre output_y_end_pre ((input_width_pre + 1 ) ÷ 2 ) ) ” 
  &&  “ (hc_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min") ) ” 
  &&  “ (hc_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max") ) ” 
  &&  “ (hc_same_bits (hc_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min"))) Lo ) ” 
  &&  “ (hc_same_bits (hc_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max"))) Hi ) ” 
  &&  “ (0 < input_height_pre) ” 
  &&  “ (0 < input_width_pre) ” 
  &&  “ (0 < output_channels_pre) ” 
  &&  “ (0 <= input_padding_top_pre) ” 
  &&  “ (input_padding_top_pre <= 1) ” 
  &&  “ (0 <= output_y_start_pre) ” 
  &&  “ (output_y_start_pre < output_y_end_pre) ”
.

Definition hwc_public_mode_partial_solve_wit_1_aux := 
forall (params_pre: Z) (output_channel_stride_pre: Z) (output_height_stride_pre: Z) (output_channels_pre: Z) (input_padding_top_pre: Z) (output_pre: Z) (weights_pre: Z) (zero_pre: Z) (input_pre: Z) (output_y_end_pre: Z) (output_y_start_pre: Z) (input_width_pre: Z) (input_height_pre: Z) (use_rvv_pre: Z) (Hi: fp32) (Lo: fp32) (Cs: Z) (Hs: Z) (Cn: Z) (Params: Z) (Output: Z) (Weights: Z) (Zero: Z) (Input: Z) (End: Z) (Start: Z) (Top: Z) (N: Z) (H: Z) (W: (@list Z)) (O: HwcOutput) (F: HwcROMap) (PreH1 : (use_rvv_pre = 0)) (PreH2 : (input_height_pre = H)) (PreH3 : (input_width_pre = N)) (PreH4 : (input_padding_top_pre = Top)) (PreH5 : (output_y_start_pre = Start)) (PreH6 : (output_y_end_pre = End)) (PreH7 : (input_pre = Input)) (PreH8 : (zero_pre = Zero)) (PreH9 : (weights_pre = Weights)) (PreH10 : (output_pre = Output)) (PreH11 : (params_pre = Params)) (PreH12 : (output_channels_pre = Cn)) (PreH13 : (output_height_stride_pre = Hs)) (PreH14 : (output_channel_stride_pre = Cs)) (PreH15 : (hc_input_domain F Input Zero Weights Params H N Top Start End Cn )) (PreH16 : (hc_output_layout Output Hs Cs H N Cn End )) (PreH17 : (hc_output_owned W Output Hs Cs Cn Start End ((N + 1 ) ÷ 2 ) )) (PreH18 : (hc_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min") )) (PreH19 : (hc_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max") )) (PreH20 : (hc_same_bits (hc_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min"))) Lo )) (PreH21 : (hc_same_bits (hc_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max"))) Hi )) (PreH22 : (0 < H)) (PreH23 : (0 < N)) (PreH24 : (0 < Cn)) (PreH25 : (0 <= Top)) (PreH26 : (Top <= 1)) (PreH27 : (0 <= Start)) (PreH28 : (Start < End)) ,
  (hc_data F )
  **  (hc_output W O )
|--
  “ (input_height_pre = input_height_pre) ” 
  &&  “ (input_width_pre = input_width_pre) ” 
  &&  “ (input_padding_top_pre = input_padding_top_pre) ” 
  &&  “ (output_y_start_pre = output_y_start_pre) ” 
  &&  “ (output_y_end_pre = output_y_end_pre) ” 
  &&  “ (input_pre = input_pre) ” 
  &&  “ (zero_pre = zero_pre) ” 
  &&  “ (weights_pre = weights_pre) ” 
  &&  “ (output_pre = output_pre) ” 
  &&  “ (params_pre = params_pre) ” 
  &&  “ (output_channels_pre = output_channels_pre) ” 
  &&  “ (output_height_stride_pre = output_height_stride_pre) ” 
  &&  “ (output_channel_stride_pre = output_channel_stride_pre) ” 
  &&  “ (hc_input_domain F input_pre zero_pre weights_pre params_pre input_height_pre input_width_pre input_padding_top_pre output_y_start_pre output_y_end_pre output_channels_pre ) ” 
  &&  “ (hc_output_layout output_pre output_height_stride_pre output_channel_stride_pre input_height_pre input_width_pre output_channels_pre output_y_end_pre ) ” 
  &&  “ (hc_output_owned W output_pre output_height_stride_pre output_channel_stride_pre output_channels_pre output_y_start_pre output_y_end_pre ((input_width_pre + 1 ) ÷ 2 ) ) ” 
  &&  “ (hc_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min") ) ” 
  &&  “ (hc_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max") ) ” 
  &&  “ (hc_same_bits (hc_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min"))) Lo ) ” 
  &&  “ (hc_same_bits (hc_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max"))) Hi ) ” 
  &&  “ (0 < input_height_pre) ” 
  &&  “ (0 < input_width_pre) ” 
  &&  “ (0 < output_channels_pre) ” 
  &&  “ (0 <= input_padding_top_pre) ” 
  &&  “ (input_padding_top_pre <= 1) ” 
  &&  “ (0 <= output_y_start_pre) ” 
  &&  “ (output_y_start_pre < output_y_end_pre) ” 
  &&  “ (use_rvv_pre = 0) ” 
  &&  “ (input_height_pre = H) ” 
  &&  “ (input_width_pre = N) ” 
  &&  “ (input_padding_top_pre = Top) ” 
  &&  “ (output_y_start_pre = Start) ” 
  &&  “ (output_y_end_pre = End) ” 
  &&  “ (input_pre = Input) ” 
  &&  “ (zero_pre = Zero) ” 
  &&  “ (weights_pre = Weights) ” 
  &&  “ (output_pre = Output) ” 
  &&  “ (params_pre = Params) ” 
  &&  “ (output_channels_pre = Cn) ” 
  &&  “ (output_height_stride_pre = Hs) ” 
  &&  “ (output_channel_stride_pre = Cs) ” 
  &&  “ (hc_input_domain F Input Zero Weights Params H N Top Start End Cn ) ” 
  &&  “ (hc_output_layout Output Hs Cs H N Cn End ) ” 
  &&  “ (hc_output_owned W Output Hs Cs Cn Start End ((N + 1 ) ÷ 2 ) ) ” 
  &&  “ (hc_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min") ) ” 
  &&  “ (hc_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max") ) ” 
  &&  “ (hc_same_bits (hc_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min"))) Lo ) ” 
  &&  “ (hc_same_bits (hc_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max"))) Hi ) ” 
  &&  “ (0 < H) ” 
  &&  “ (0 < N) ” 
  &&  “ (0 < Cn) ” 
  &&  “ (0 <= Top) ” 
  &&  “ (Top <= 1) ” 
  &&  “ (0 <= Start) ” 
  &&  “ (Start < End) ”
  &&  (hc_data F )
  **  (hc_output W O )
.

Definition hwc_public_mode_partial_solve_wit_1 := hwc_public_mode_partial_solve_wit_1_pure -> hwc_public_mode_partial_solve_wit_1_aux.

Definition hwc_public_mode_partial_solve_wit_2_pure := 
forall (params_pre: Z) (output_channel_stride_pre: Z) (output_height_stride_pre: Z) (output_channels_pre: Z) (input_padding_top_pre: Z) (output_pre: Z) (weights_pre: Z) (zero_pre: Z) (input_pre: Z) (output_y_end_pre: Z) (output_y_start_pre: Z) (input_width_pre: Z) (input_height_pre: Z) (use_rvv_pre: Z) (Hi: fp32) (Lo: fp32) (Cs: Z) (Hs: Z) (Cn: Z) (Params: Z) (Output: Z) (Weights: Z) (Zero: Z) (Input: Z) (End: Z) (Start: Z) (Top: Z) (N: Z) (H: Z) (W: (@list Z)) (O: HwcOutput) (F: HwcROMap) (PreH1 : (use_rvv_pre <> 0)) (PreH2 : (input_height_pre = H)) (PreH3 : (input_width_pre = N)) (PreH4 : (input_padding_top_pre = Top)) (PreH5 : (output_y_start_pre = Start)) (PreH6 : (output_y_end_pre = End)) (PreH7 : (input_pre = Input)) (PreH8 : (zero_pre = Zero)) (PreH9 : (weights_pre = Weights)) (PreH10 : (output_pre = Output)) (PreH11 : (params_pre = Params)) (PreH12 : (output_channels_pre = Cn)) (PreH13 : (output_height_stride_pre = Hs)) (PreH14 : (output_channel_stride_pre = Cs)) (PreH15 : (hc_input_domain F Input Zero Weights Params H N Top Start End Cn )) (PreH16 : (hc_output_layout Output Hs Cs H N Cn End )) (PreH17 : (hc_output_owned W Output Hs Cs Cn Start End ((N + 1 ) ÷ 2 ) )) (PreH18 : (hc_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min") )) (PreH19 : (hc_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max") )) (PreH20 : (hc_same_bits (hc_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min"))) Lo )) (PreH21 : (hc_same_bits (hc_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max"))) Hi )) (PreH22 : (0 < H)) (PreH23 : (0 < N)) (PreH24 : (0 < Cn)) (PreH25 : (0 <= Top)) (PreH26 : (Top <= 1)) (PreH27 : (0 <= Start)) (PreH28 : (Start < End)) ,
  ((( &( "use_rvv" ) )) # UInt  |-> use_rvv_pre)
  **  ((( &( "input_height" ) )) # UInt64  |-> input_height_pre)
  **  ((( &( "input_width" ) )) # UInt64  |-> input_width_pre)
  **  ((( &( "output_y_start" ) )) # UInt64  |-> output_y_start_pre)
  **  ((( &( "output_y_end" ) )) # UInt64  |-> output_y_end_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "zero" ) )) # Ptr  |-> zero_pre)
  **  ((( &( "weights" ) )) # Ptr  |-> weights_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "input_padding_top" ) )) # UInt64  |-> input_padding_top_pre)
  **  ((( &( "output_channels" ) )) # UInt64  |-> output_channels_pre)
  **  ((( &( "output_height_stride" ) )) # UInt64  |-> output_height_stride_pre)
  **  ((( &( "output_channel_stride" ) )) # UInt64  |-> output_channel_stride_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (hc_data F )
  **  (hc_output W O )
|--
  “ (input_height_pre = input_height_pre) ” 
  &&  “ (input_width_pre = input_width_pre) ” 
  &&  “ (input_padding_top_pre = input_padding_top_pre) ” 
  &&  “ (output_y_start_pre = output_y_start_pre) ” 
  &&  “ (output_y_end_pre = output_y_end_pre) ” 
  &&  “ (input_pre = input_pre) ” 
  &&  “ (zero_pre = zero_pre) ” 
  &&  “ (weights_pre = weights_pre) ” 
  &&  “ (output_pre = output_pre) ” 
  &&  “ (params_pre = params_pre) ” 
  &&  “ (output_channels_pre = output_channels_pre) ” 
  &&  “ (output_height_stride_pre = output_height_stride_pre) ” 
  &&  “ (output_channel_stride_pre = output_channel_stride_pre) ” 
  &&  “ (hc_input_domain F input_pre zero_pre weights_pre params_pre input_height_pre input_width_pre input_padding_top_pre output_y_start_pre output_y_end_pre output_channels_pre ) ” 
  &&  “ (hc_output_layout output_pre output_height_stride_pre output_channel_stride_pre input_height_pre input_width_pre output_channels_pre output_y_end_pre ) ” 
  &&  “ (hc_output_owned W output_pre output_height_stride_pre output_channel_stride_pre output_channels_pre output_y_start_pre output_y_end_pre ((input_width_pre + 1 ) ÷ 2 ) ) ” 
  &&  “ (hc_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min") ) ” 
  &&  “ (hc_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max") ) ” 
  &&  “ (hc_same_bits (hc_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min"))) Lo ) ” 
  &&  “ (hc_same_bits (hc_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max"))) Hi ) ” 
  &&  “ (0 < input_height_pre) ” 
  &&  “ (0 < input_width_pre) ” 
  &&  “ (0 < output_channels_pre) ” 
  &&  “ (0 <= input_padding_top_pre) ” 
  &&  “ (input_padding_top_pre <= 1) ” 
  &&  “ (0 <= output_y_start_pre) ” 
  &&  “ (output_y_start_pre < output_y_end_pre) ”
.

Definition hwc_public_mode_partial_solve_wit_2_aux := 
forall (params_pre: Z) (output_channel_stride_pre: Z) (output_height_stride_pre: Z) (output_channels_pre: Z) (input_padding_top_pre: Z) (output_pre: Z) (weights_pre: Z) (zero_pre: Z) (input_pre: Z) (output_y_end_pre: Z) (output_y_start_pre: Z) (input_width_pre: Z) (input_height_pre: Z) (use_rvv_pre: Z) (Hi: fp32) (Lo: fp32) (Cs: Z) (Hs: Z) (Cn: Z) (Params: Z) (Output: Z) (Weights: Z) (Zero: Z) (Input: Z) (End: Z) (Start: Z) (Top: Z) (N: Z) (H: Z) (W: (@list Z)) (O: HwcOutput) (F: HwcROMap) (PreH1 : (use_rvv_pre <> 0)) (PreH2 : (input_height_pre = H)) (PreH3 : (input_width_pre = N)) (PreH4 : (input_padding_top_pre = Top)) (PreH5 : (output_y_start_pre = Start)) (PreH6 : (output_y_end_pre = End)) (PreH7 : (input_pre = Input)) (PreH8 : (zero_pre = Zero)) (PreH9 : (weights_pre = Weights)) (PreH10 : (output_pre = Output)) (PreH11 : (params_pre = Params)) (PreH12 : (output_channels_pre = Cn)) (PreH13 : (output_height_stride_pre = Hs)) (PreH14 : (output_channel_stride_pre = Cs)) (PreH15 : (hc_input_domain F Input Zero Weights Params H N Top Start End Cn )) (PreH16 : (hc_output_layout Output Hs Cs H N Cn End )) (PreH17 : (hc_output_owned W Output Hs Cs Cn Start End ((N + 1 ) ÷ 2 ) )) (PreH18 : (hc_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min") )) (PreH19 : (hc_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max") )) (PreH20 : (hc_same_bits (hc_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min"))) Lo )) (PreH21 : (hc_same_bits (hc_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max"))) Hi )) (PreH22 : (0 < H)) (PreH23 : (0 < N)) (PreH24 : (0 < Cn)) (PreH25 : (0 <= Top)) (PreH26 : (Top <= 1)) (PreH27 : (0 <= Start)) (PreH28 : (Start < End)) ,
  (hc_data F )
  **  (hc_output W O )
|--
  “ (input_height_pre = input_height_pre) ” 
  &&  “ (input_width_pre = input_width_pre) ” 
  &&  “ (input_padding_top_pre = input_padding_top_pre) ” 
  &&  “ (output_y_start_pre = output_y_start_pre) ” 
  &&  “ (output_y_end_pre = output_y_end_pre) ” 
  &&  “ (input_pre = input_pre) ” 
  &&  “ (zero_pre = zero_pre) ” 
  &&  “ (weights_pre = weights_pre) ” 
  &&  “ (output_pre = output_pre) ” 
  &&  “ (params_pre = params_pre) ” 
  &&  “ (output_channels_pre = output_channels_pre) ” 
  &&  “ (output_height_stride_pre = output_height_stride_pre) ” 
  &&  “ (output_channel_stride_pre = output_channel_stride_pre) ” 
  &&  “ (hc_input_domain F input_pre zero_pre weights_pre params_pre input_height_pre input_width_pre input_padding_top_pre output_y_start_pre output_y_end_pre output_channels_pre ) ” 
  &&  “ (hc_output_layout output_pre output_height_stride_pre output_channel_stride_pre input_height_pre input_width_pre output_channels_pre output_y_end_pre ) ” 
  &&  “ (hc_output_owned W output_pre output_height_stride_pre output_channel_stride_pre output_channels_pre output_y_start_pre output_y_end_pre ((input_width_pre + 1 ) ÷ 2 ) ) ” 
  &&  “ (hc_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min") ) ” 
  &&  “ (hc_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max") ) ” 
  &&  “ (hc_same_bits (hc_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min"))) Lo ) ” 
  &&  “ (hc_same_bits (hc_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max"))) Hi ) ” 
  &&  “ (0 < input_height_pre) ” 
  &&  “ (0 < input_width_pre) ” 
  &&  “ (0 < output_channels_pre) ” 
  &&  “ (0 <= input_padding_top_pre) ” 
  &&  “ (input_padding_top_pre <= 1) ” 
  &&  “ (0 <= output_y_start_pre) ” 
  &&  “ (output_y_start_pre < output_y_end_pre) ” 
  &&  “ (use_rvv_pre <> 0) ” 
  &&  “ (input_height_pre = H) ” 
  &&  “ (input_width_pre = N) ” 
  &&  “ (input_padding_top_pre = Top) ” 
  &&  “ (output_y_start_pre = Start) ” 
  &&  “ (output_y_end_pre = End) ” 
  &&  “ (input_pre = Input) ” 
  &&  “ (zero_pre = Zero) ” 
  &&  “ (weights_pre = Weights) ” 
  &&  “ (output_pre = Output) ” 
  &&  “ (params_pre = Params) ” 
  &&  “ (output_channels_pre = Cn) ” 
  &&  “ (output_height_stride_pre = Hs) ” 
  &&  “ (output_channel_stride_pre = Cs) ” 
  &&  “ (hc_input_domain F Input Zero Weights Params H N Top Start End Cn ) ” 
  &&  “ (hc_output_layout Output Hs Cs H N Cn End ) ” 
  &&  “ (hc_output_owned W Output Hs Cs Cn Start End ((N + 1 ) ÷ 2 ) ) ” 
  &&  “ (hc_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min") ) ” 
  &&  “ (hc_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max") ) ” 
  &&  “ (hc_same_bits (hc_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min"))) Lo ) ” 
  &&  “ (hc_same_bits (hc_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max"))) Hi ) ” 
  &&  “ (0 < H) ” 
  &&  “ (0 < N) ” 
  &&  “ (0 < Cn) ” 
  &&  “ (0 <= Top) ” 
  &&  “ (Top <= 1) ” 
  &&  “ (0 <= Start) ” 
  &&  “ (Start < End) ”
  &&  (hc_data F )
  **  (hc_output W O )
.

Definition hwc_public_mode_partial_solve_wit_2 := hwc_public_mode_partial_solve_wit_2_pure -> hwc_public_mode_partial_solve_wit_2_aux.

Module Type VC_Correct.

Include hc_maps_Strategy_Correct.

Axiom proof_of_hwc_public_mode_safety_wit_1 : hwc_public_mode_safety_wit_1.
Axiom proof_of_hwc_public_mode_safety_wit_2 : hwc_public_mode_safety_wit_2.
Axiom proof_of_hwc_public_mode_safety_wit_3 : hwc_public_mode_safety_wit_3.
Axiom proof_of_hwc_public_mode_return_wit_1 : hwc_public_mode_return_wit_1.
Axiom proof_of_hwc_public_mode_return_wit_2 : hwc_public_mode_return_wit_2.
Axiom proof_of_hwc_public_mode_partial_solve_wit_1_pure : hwc_public_mode_partial_solve_wit_1_pure.
Axiom proof_of_hwc_public_mode_partial_solve_wit_1 : hwc_public_mode_partial_solve_wit_1.
Axiom proof_of_hwc_public_mode_partial_solve_wit_2_pure : hwc_public_mode_partial_solve_wit_2_pure.
Axiom proof_of_hwc_public_mode_partial_solve_wit_2 : hwc_public_mode_partial_solve_wit_2.

End VC_Correct.
