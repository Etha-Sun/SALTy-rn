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
Require Import Dwconv.VectorModel.
Require Import Dwconv.MemoryInterface.
Require Import Dwconv.ProgramInterface.
Require Import Dwconv.MemoryInterface.
Require Import Dwconv.OutputReadModel.
Require Import Dwconv.WrittenReadModel.
Require Import NanBridge.BridgeLogic.
Require Import Dwconv.PublicModel.
Local Open Scope sac.
From Dwconv Require Import dw_maps_strategy_goal.
From Dwconv Require Import dw_maps_strategy_proof.

(*----- Function equivalent -----*)

Definition equivalent_entail_wit_1 := 
(
forall (params_pre: Z) (zero_pre: Z) (input_pixel_stride_pre: Z) (input_offset_pre: Z) (output_increment_pre: Z) (input_stride_pre: Z) (right_pre: Z) (left_pre: Z) (weights_pre: Z) (input_pre: Z) (output_width_pre: Z) (channels_pre: Z) (hi: fp32) (lo: fp32) (O2: DwOutput) (O1: DwOutput) (W2: (@list Z)) (W1: (@list Z)) (out2: Z) (P: DwPtrMap) (F: DwROMap) (D: DwProgram) (PreH1 : (params_pre <> 0)) (PreH2 : (channels_pre > 0)) (PreH3 : (output_width_pre > 0)) (PreH4 : (channels_pre = (dw_channels (D)))) (PreH5 : (output_width_pre = (dw_width (D)))) (PreH6 : (input_pre = (dw_input (D)))) (PreH7 : (weights_pre = (dw_weights (D)))) (PreH8 : (left_pre = (dw_out (D)))) (PreH9 : (right_pre = out2)) (PreH10 : (input_stride_pre = (dw_input_stride (D)))) (PreH11 : (output_increment_pre = (dw_out_increment (D)))) (PreH12 : (input_offset_pre = (dw_offset (D)))) (PreH13 : (input_pixel_stride_pre = (dw_pixel_stride (D)))) (PreH14 : (zero_pre = (dw_zero_ptr (D)))) (PreH15 : (dw_valid F P W1 D )) (PreH16 : (dw_valid F P W2 (dw_rebase (D) (out2)) )) (PreH17 : (dw_distinct W1 )) (PreH18 : (dw_distinct W2 )) (PreH19 : (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min") )) (PreH20 : (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max") )) (PreH21 : (dw_same lo (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min"))) )) (PreH22 : (dw_same hi (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max"))) )) ,
  (dw_data F )
  **  (dw_ptr_data P )
  **  (dw_output W2 (dw_rvv_result (F) (P) ((dw_rebase (D) (out2))) (lo) (hi) (O2)) )
  **  (dw_output W1 (dw_neon_result (F) (P) (D) (lo) (hi) (O1)) )
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
|--
  “ (params_pre <> 0) ” 
  &&  “ (channels_pre > 0) ” 
  &&  “ (output_width_pre > 0) ” 
  &&  “ (channels_pre = (dw_channels (D))) ” 
  &&  “ (output_width_pre = (dw_width (D))) ” 
  &&  “ (input_pre = (dw_input (D))) ” 
  &&  “ (weights_pre = (dw_weights (D))) ” 
  &&  “ (left_pre = (dw_out (D))) ” 
  &&  “ (input_stride_pre = (dw_input_stride (D))) ” 
  &&  “ (output_increment_pre = (dw_out_increment (D))) ” 
  &&  “ (input_offset_pre = (dw_offset (D))) ” 
  &&  “ (input_pixel_stride_pre = (dw_pixel_stride (D))) ” 
  &&  “ (zero_pre = (dw_zero_ptr (D))) ” 
  &&  “ (dw_valid F P W1 D ) ” 
  &&  “ (dw_valid F P W2 (dw_rebase (D) (out2)) ) ” 
  &&  “ (dw_distinct W1 ) ” 
  &&  “ (dw_distinct W2 ) ” 
  &&  “ (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min") ) ” 
  &&  “ (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max") ) ” 
  &&  “ (dw_same lo (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min"))) ) ” 
  &&  “ (dw_same hi (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max"))) ) ” 
  &&  “ (dw_output_domain W1 D ) ” 
  &&  “ (dw_output_domain W2 (dw_rebase (D) (out2)) ) ” 
  &&  “ (dw_pair_observed D out2 (dw_neon_result (F) (P) (D) (lo) (hi) (O1)) (dw_rvv_result (F) (P) ((dw_rebase (D) (out2))) (lo) (hi) (O2)) ) ”
  &&  ((( &( "right" ) )) # Ptr  |-> out2)
  **  (dw_data F )
  **  (dw_ptr_data P )
  **  (dw_output W1 (dw_neon_result (F) (P) (D) (lo) (hi) (O1)) )
  **  (dw_output W2 (dw_rvv_result (F) (P) ((dw_rebase (D) (out2))) (lo) (hi) (O2)) )
) \/
(
forall (params_pre: Z) (zero_pre: Z) (input_pixel_stride_pre: Z) (input_offset_pre: Z) (output_increment_pre: Z) (input_stride_pre: Z) (right_pre: Z) (left_pre: Z) (weights_pre: Z) (input_pre: Z) (output_width_pre: Z) (channels_pre: Z) (hi: fp32) (lo: fp32) (O2: DwOutput) (O1: DwOutput) (W2: (@list Z)) (W1: (@list Z)) (out2: Z) (P: DwPtrMap) (F: DwROMap) (D: DwProgram) (PreH1 : (params_pre <> 0)) (PreH2 : (channels_pre > 0)) (PreH3 : (output_width_pre > 0)) (PreH4 : (channels_pre = (dw_channels (D)))) (PreH5 : (output_width_pre = (dw_width (D)))) (PreH6 : (input_pre = (dw_input (D)))) (PreH7 : (weights_pre = (dw_weights (D)))) (PreH8 : (left_pre = (dw_out (D)))) (PreH9 : (right_pre = out2)) (PreH10 : (input_stride_pre = (dw_input_stride (D)))) (PreH11 : (output_increment_pre = (dw_out_increment (D)))) (PreH12 : (input_offset_pre = (dw_offset (D)))) (PreH13 : (input_pixel_stride_pre = (dw_pixel_stride (D)))) (PreH14 : (zero_pre = (dw_zero_ptr (D)))) (PreH15 : (dw_valid F P W1 D )) (PreH16 : (dw_valid F P W2 (dw_rebase (D) (out2)) )) (PreH17 : (dw_distinct W1 )) (PreH18 : (dw_distinct W2 )) (PreH19 : (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min") )) (PreH20 : (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max") )) (PreH21 : (dw_same lo (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min"))) )) (PreH22 : (dw_same hi (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max"))) )) ,
  TT && emp 
|--
  “ (dw_pair_observed D right_pre (dw_neon_result (F) (P) (D) (lo) (hi) (O1)) (dw_rvv_result (F) (P) ((dw_rebase (D) (right_pre))) (lo) (hi) (O2)) ) ” 
  &&  “ (dw_output_domain W2 (dw_rebase (D) (right_pre)) ) ” 
  &&  “ (dw_output_domain W1 D ) ”
  &&  emp
).

Definition equivalent_entail_wit_1_split_goal_1 := 
forall (params_pre: Z) (zero_pre: Z) (input_pixel_stride_pre: Z) (input_offset_pre: Z) (output_increment_pre: Z) (input_stride_pre: Z) (right_pre: Z) (left_pre: Z) (weights_pre: Z) (input_pre: Z) (output_width_pre: Z) (channels_pre: Z) (hi: fp32) (lo: fp32) (O2: DwOutput) (O1: DwOutput) (W2: (@list Z)) (W1: (@list Z)) (out2: Z) (P: DwPtrMap) (F: DwROMap) (D: DwProgram) (PreH1 : (params_pre <> 0)) (PreH2 : (channels_pre > 0)) (PreH3 : (output_width_pre > 0)) (PreH4 : (channels_pre = (dw_channels (D)))) (PreH5 : (output_width_pre = (dw_width (D)))) (PreH6 : (input_pre = (dw_input (D)))) (PreH7 : (weights_pre = (dw_weights (D)))) (PreH8 : (left_pre = (dw_out (D)))) (PreH9 : (right_pre = out2)) (PreH10 : (input_stride_pre = (dw_input_stride (D)))) (PreH11 : (output_increment_pre = (dw_out_increment (D)))) (PreH12 : (input_offset_pre = (dw_offset (D)))) (PreH13 : (input_pixel_stride_pre = (dw_pixel_stride (D)))) (PreH14 : (zero_pre = (dw_zero_ptr (D)))) (PreH15 : (dw_valid F P W1 D )) (PreH16 : (dw_valid F P W2 (dw_rebase (D) (out2)) )) (PreH17 : (dw_distinct W1 )) (PreH18 : (dw_distinct W2 )) (PreH19 : (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min") )) (PreH20 : (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max") )) (PreH21 : (dw_same lo (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min"))) )) (PreH22 : (dw_same hi (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max"))) )) ,
  (dw_pair_observed D right_pre (dw_neon_result (F) (P) (D) (lo) (hi) (O1)) (dw_rvv_result (F) (P) ((dw_rebase (D) (right_pre))) (lo) (hi) (O2)) )
.

Definition equivalent_entail_wit_1_split_goal_2 := 
forall (params_pre: Z) (zero_pre: Z) (input_pixel_stride_pre: Z) (input_offset_pre: Z) (output_increment_pre: Z) (input_stride_pre: Z) (right_pre: Z) (left_pre: Z) (weights_pre: Z) (input_pre: Z) (output_width_pre: Z) (channels_pre: Z) (hi: fp32) (lo: fp32) (W2: (@list Z)) (W1: (@list Z)) (out2: Z) (P: DwPtrMap) (F: DwROMap) (D: DwProgram) (PreH1 : (params_pre <> 0)) (PreH2 : (channels_pre > 0)) (PreH3 : (output_width_pre > 0)) (PreH4 : (channels_pre = (dw_channels (D)))) (PreH5 : (output_width_pre = (dw_width (D)))) (PreH6 : (input_pre = (dw_input (D)))) (PreH7 : (weights_pre = (dw_weights (D)))) (PreH8 : (left_pre = (dw_out (D)))) (PreH9 : (right_pre = out2)) (PreH10 : (input_stride_pre = (dw_input_stride (D)))) (PreH11 : (output_increment_pre = (dw_out_increment (D)))) (PreH12 : (input_offset_pre = (dw_offset (D)))) (PreH13 : (input_pixel_stride_pre = (dw_pixel_stride (D)))) (PreH14 : (zero_pre = (dw_zero_ptr (D)))) (PreH15 : (dw_valid F P W1 D )) (PreH16 : (dw_valid F P W2 (dw_rebase (D) (out2)) )) (PreH17 : (dw_distinct W1 )) (PreH18 : (dw_distinct W2 )) (PreH19 : (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min") )) (PreH20 : (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max") )) (PreH21 : (dw_same lo (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min"))) )) (PreH22 : (dw_same hi (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max"))) )) ,
  (dw_output_domain W2 (dw_rebase (D) (right_pre)) )
.

Definition equivalent_entail_wit_1_split_goal_3 := 
forall (params_pre: Z) (zero_pre: Z) (input_pixel_stride_pre: Z) (input_offset_pre: Z) (output_increment_pre: Z) (input_stride_pre: Z) (right_pre: Z) (left_pre: Z) (weights_pre: Z) (input_pre: Z) (output_width_pre: Z) (channels_pre: Z) (hi: fp32) (lo: fp32) (W2: (@list Z)) (W1: (@list Z)) (out2: Z) (P: DwPtrMap) (F: DwROMap) (D: DwProgram) (PreH1 : (params_pre <> 0)) (PreH2 : (channels_pre > 0)) (PreH3 : (output_width_pre > 0)) (PreH4 : (channels_pre = (dw_channels (D)))) (PreH5 : (output_width_pre = (dw_width (D)))) (PreH6 : (input_pre = (dw_input (D)))) (PreH7 : (weights_pre = (dw_weights (D)))) (PreH8 : (left_pre = (dw_out (D)))) (PreH9 : (right_pre = out2)) (PreH10 : (input_stride_pre = (dw_input_stride (D)))) (PreH11 : (output_increment_pre = (dw_out_increment (D)))) (PreH12 : (input_offset_pre = (dw_offset (D)))) (PreH13 : (input_pixel_stride_pre = (dw_pixel_stride (D)))) (PreH14 : (zero_pre = (dw_zero_ptr (D)))) (PreH15 : (dw_valid F P W1 D )) (PreH16 : (dw_valid F P W2 (dw_rebase (D) (out2)) )) (PreH17 : (dw_distinct W1 )) (PreH18 : (dw_distinct W2 )) (PreH19 : (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min") )) (PreH20 : (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max") )) (PreH21 : (dw_same lo (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min"))) )) (PreH22 : (dw_same hi (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max"))) )) ,
  (dw_output_domain W1 D )
.

Definition equivalent_return_wit_1 := 
forall (hi: fp32) (lo: fp32) (O2: DwOutput) (O1: DwOutput) (W2: (@list Z)) (W1: (@list Z)) (out2: Z) (P: DwPtrMap) (F: DwROMap) (D: DwProgram) (params: Z) (channels: Z) (output_width: Z) (input: Z) (weights: Z) (left: Z) (input_stride: Z) (output_increment: Z) (input_offset: Z) (input_pixel_stride: Z) (zero: Z) (retval: Z) (PreH1 : (retval = 1)) (PreH2 : (params <> 0)) (PreH3 : (channels > 0)) (PreH4 : (output_width > 0)) (PreH5 : (channels = (dw_channels (D)))) (PreH6 : (output_width = (dw_width (D)))) (PreH7 : (input = (dw_input (D)))) (PreH8 : (weights = (dw_weights (D)))) (PreH9 : (left = (dw_out (D)))) (PreH10 : (input_stride = (dw_input_stride (D)))) (PreH11 : (output_increment = (dw_out_increment (D)))) (PreH12 : (input_offset = (dw_offset (D)))) (PreH13 : (input_pixel_stride = (dw_pixel_stride (D)))) (PreH14 : (zero = (dw_zero_ptr (D)))) (PreH15 : (dw_valid F P W1 D )) (PreH16 : (dw_valid F P W2 (dw_rebase (D) (out2)) )) (PreH17 : (dw_distinct W1 )) (PreH18 : (dw_distinct W2 )) (PreH19 : (dw_present F &((params)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min") )) (PreH20 : (dw_present F &((params)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max") )) (PreH21 : (dw_same lo (dw_get (F) (&((params)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min"))) )) (PreH22 : (dw_same hi (dw_get (F) (&((params)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max"))) )) (PreH23 : (dw_output_domain W1 D )) (PreH24 : (dw_output_domain W2 (dw_rebase (D) (out2)) )) (PreH25 : (dw_pair_observed D out2 (dw_neon_result (F) (P) (D) (lo) (hi) (O1)) (dw_rvv_result (F) (P) ((dw_rebase (D) (out2))) (lo) (hi) (O2)) )) ,
  (dw_output W1 (dw_neon_result (F) (P) (D) (lo) (hi) (O1)) )
  **  (dw_output W2 (dw_rvv_result (F) (P) ((dw_rebase (D) (out2))) (lo) (hi) (O2)) )
  **  (dw_data F )
  **  (dw_ptr_data P )
|--
  “ (retval = 1) ” 
  &&  “ (dw_pair_observed D out2 (dw_neon_result (F) (P) (D) (lo) (hi) (O1)) (dw_rvv_result (F) (P) ((dw_rebase (D) (out2))) (lo) (hi) (O2)) ) ”
  &&  (dw_data F )
  **  (dw_ptr_data P )
  **  (dw_output W1 (dw_neon_result (F) (P) (D) (lo) (hi) (O1)) )
  **  (dw_output W2 (dw_rvv_result (F) (P) ((dw_rebase (D) (out2))) (lo) (hi) (O2)) )
.

Definition equivalent_partial_solve_wit_1_pure := 
forall (params_pre: Z) (zero_pre: Z) (input_pixel_stride_pre: Z) (input_offset_pre: Z) (output_increment_pre: Z) (input_stride_pre: Z) (right_pre: Z) (left_pre: Z) (weights_pre: Z) (input_pre: Z) (output_width_pre: Z) (channels_pre: Z) (hi: fp32) (lo: fp32) (O2: DwOutput) (O1: DwOutput) (W2: (@list Z)) (W1: (@list Z)) (out2: Z) (P: DwPtrMap) (F: DwROMap) (D: DwProgram) (PreH1 : (params_pre <> 0)) (PreH2 : (channels_pre > 0)) (PreH3 : (output_width_pre > 0)) (PreH4 : (channels_pre = (dw_channels (D)))) (PreH5 : (output_width_pre = (dw_width (D)))) (PreH6 : (input_pre = (dw_input (D)))) (PreH7 : (weights_pre = (dw_weights (D)))) (PreH8 : (left_pre = (dw_out (D)))) (PreH9 : (right_pre = out2)) (PreH10 : (input_stride_pre = (dw_input_stride (D)))) (PreH11 : (output_increment_pre = (dw_out_increment (D)))) (PreH12 : (input_offset_pre = (dw_offset (D)))) (PreH13 : (input_pixel_stride_pre = (dw_pixel_stride (D)))) (PreH14 : (zero_pre = (dw_zero_ptr (D)))) (PreH15 : (dw_valid F P W1 D )) (PreH16 : (dw_valid F P W2 (dw_rebase (D) (out2)) )) (PreH17 : (dw_distinct W1 )) (PreH18 : (dw_distinct W2 )) (PreH19 : (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min") )) (PreH20 : (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max") )) (PreH21 : (dw_same lo (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min"))) )) (PreH22 : (dw_same hi (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max"))) )) ,
  ((( &( "channels" ) )) # UInt64  |-> channels_pre)
  **  ((( &( "output_width" ) )) # UInt64  |-> output_width_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "weights" ) )) # Ptr  |-> weights_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  ((( &( "input_stride" ) )) # Int64  |-> input_stride_pre)
  **  ((( &( "output_increment" ) )) # UInt64  |-> output_increment_pre)
  **  ((( &( "input_offset" ) )) # UInt64  |-> input_offset_pre)
  **  ((( &( "input_pixel_stride" ) )) # UInt64  |-> input_pixel_stride_pre)
  **  ((( &( "zero" ) )) # Ptr  |-> zero_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (dw_data F )
  **  (dw_ptr_data P )
  **  (dw_output W1 O1 )
  **  (dw_output W2 O2 )
|--
  “ (params_pre <> 0) ” 
  &&  “ (channels_pre > 0) ” 
  &&  “ (output_width_pre > 0) ” 
  &&  “ (channels_pre = (dw_channels (D))) ” 
  &&  “ (output_width_pre = (dw_width (D))) ” 
  &&  “ (input_pre = (dw_input (D))) ” 
  &&  “ (weights_pre = (dw_weights (D))) ” 
  &&  “ (left_pre = (dw_out (D))) ” 
  &&  “ (input_stride_pre = (dw_input_stride (D))) ” 
  &&  “ (output_increment_pre = (dw_out_increment (D))) ” 
  &&  “ (input_offset_pre = (dw_offset (D))) ” 
  &&  “ (input_pixel_stride_pre = (dw_pixel_stride (D))) ” 
  &&  “ (zero_pre = (dw_zero_ptr (D))) ” 
  &&  “ (dw_valid F P W1 D ) ” 
  &&  “ (dw_distinct W1 ) ” 
  &&  “ (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min") ) ” 
  &&  “ (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max") ) ” 
  &&  “ (dw_same lo (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min"))) ) ” 
  &&  “ (dw_same hi (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max"))) ) ”
.

Definition equivalent_partial_solve_wit_1_aux := 
forall (params_pre: Z) (zero_pre: Z) (input_pixel_stride_pre: Z) (input_offset_pre: Z) (output_increment_pre: Z) (input_stride_pre: Z) (right_pre: Z) (left_pre: Z) (weights_pre: Z) (input_pre: Z) (output_width_pre: Z) (channels_pre: Z) (hi: fp32) (lo: fp32) (O2: DwOutput) (O1: DwOutput) (W2: (@list Z)) (W1: (@list Z)) (out2: Z) (P: DwPtrMap) (F: DwROMap) (D: DwProgram) (PreH1 : (params_pre <> 0)) (PreH2 : (channels_pre > 0)) (PreH3 : (output_width_pre > 0)) (PreH4 : (channels_pre = (dw_channels (D)))) (PreH5 : (output_width_pre = (dw_width (D)))) (PreH6 : (input_pre = (dw_input (D)))) (PreH7 : (weights_pre = (dw_weights (D)))) (PreH8 : (left_pre = (dw_out (D)))) (PreH9 : (right_pre = out2)) (PreH10 : (input_stride_pre = (dw_input_stride (D)))) (PreH11 : (output_increment_pre = (dw_out_increment (D)))) (PreH12 : (input_offset_pre = (dw_offset (D)))) (PreH13 : (input_pixel_stride_pre = (dw_pixel_stride (D)))) (PreH14 : (zero_pre = (dw_zero_ptr (D)))) (PreH15 : (dw_valid F P W1 D )) (PreH16 : (dw_valid F P W2 (dw_rebase (D) (out2)) )) (PreH17 : (dw_distinct W1 )) (PreH18 : (dw_distinct W2 )) (PreH19 : (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min") )) (PreH20 : (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max") )) (PreH21 : (dw_same lo (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min"))) )) (PreH22 : (dw_same hi (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max"))) )) ,
  (dw_data F )
  **  (dw_ptr_data P )
  **  (dw_output W1 O1 )
  **  (dw_output W2 O2 )
|--
  “ (params_pre <> 0) ” 
  &&  “ (channels_pre > 0) ” 
  &&  “ (output_width_pre > 0) ” 
  &&  “ (channels_pre = (dw_channels (D))) ” 
  &&  “ (output_width_pre = (dw_width (D))) ” 
  &&  “ (input_pre = (dw_input (D))) ” 
  &&  “ (weights_pre = (dw_weights (D))) ” 
  &&  “ (left_pre = (dw_out (D))) ” 
  &&  “ (input_stride_pre = (dw_input_stride (D))) ” 
  &&  “ (output_increment_pre = (dw_out_increment (D))) ” 
  &&  “ (input_offset_pre = (dw_offset (D))) ” 
  &&  “ (input_pixel_stride_pre = (dw_pixel_stride (D))) ” 
  &&  “ (zero_pre = (dw_zero_ptr (D))) ” 
  &&  “ (dw_valid F P W1 D ) ” 
  &&  “ (dw_distinct W1 ) ” 
  &&  “ (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min") ) ” 
  &&  “ (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max") ) ” 
  &&  “ (dw_same lo (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min"))) ) ” 
  &&  “ (dw_same hi (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max"))) ) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (channels_pre > 0) ” 
  &&  “ (output_width_pre > 0) ” 
  &&  “ (channels_pre = (dw_channels (D))) ” 
  &&  “ (output_width_pre = (dw_width (D))) ” 
  &&  “ (input_pre = (dw_input (D))) ” 
  &&  “ (weights_pre = (dw_weights (D))) ” 
  &&  “ (left_pre = (dw_out (D))) ” 
  &&  “ (right_pre = out2) ” 
  &&  “ (input_stride_pre = (dw_input_stride (D))) ” 
  &&  “ (output_increment_pre = (dw_out_increment (D))) ” 
  &&  “ (input_offset_pre = (dw_offset (D))) ” 
  &&  “ (input_pixel_stride_pre = (dw_pixel_stride (D))) ” 
  &&  “ (zero_pre = (dw_zero_ptr (D))) ” 
  &&  “ (dw_valid F P W1 D ) ” 
  &&  “ (dw_valid F P W2 (dw_rebase (D) (out2)) ) ” 
  &&  “ (dw_distinct W1 ) ” 
  &&  “ (dw_distinct W2 ) ” 
  &&  “ (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min") ) ” 
  &&  “ (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max") ) ” 
  &&  “ (dw_same lo (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min"))) ) ” 
  &&  “ (dw_same hi (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max"))) ) ”
  &&  (dw_data F )
  **  (dw_ptr_data P )
  **  (dw_output W1 O1 )
  **  (dw_output W2 O2 )
.

Definition equivalent_partial_solve_wit_1 := equivalent_partial_solve_wit_1_pure -> equivalent_partial_solve_wit_1_aux.

Definition equivalent_partial_solve_wit_2_pure := 
(
forall (params_pre: Z) (zero_pre: Z) (input_pixel_stride_pre: Z) (input_offset_pre: Z) (output_increment_pre: Z) (input_stride_pre: Z) (right_pre: Z) (left_pre: Z) (weights_pre: Z) (input_pre: Z) (output_width_pre: Z) (channels_pre: Z) (hi: fp32) (lo: fp32) (O2: DwOutput) (O1: DwOutput) (W2: (@list Z)) (W1: (@list Z)) (out2: Z) (P: DwPtrMap) (F: DwROMap) (D: DwProgram) (PreH1 : (params_pre <> 0)) (PreH2 : (channels_pre > 0)) (PreH3 : (output_width_pre > 0)) (PreH4 : (channels_pre = (dw_channels (D)))) (PreH5 : (output_width_pre = (dw_width (D)))) (PreH6 : (input_pre = (dw_input (D)))) (PreH7 : (weights_pre = (dw_weights (D)))) (PreH8 : (left_pre = (dw_out (D)))) (PreH9 : (right_pre = out2)) (PreH10 : (input_stride_pre = (dw_input_stride (D)))) (PreH11 : (output_increment_pre = (dw_out_increment (D)))) (PreH12 : (input_offset_pre = (dw_offset (D)))) (PreH13 : (input_pixel_stride_pre = (dw_pixel_stride (D)))) (PreH14 : (zero_pre = (dw_zero_ptr (D)))) (PreH15 : (dw_valid F P W1 D )) (PreH16 : (dw_valid F P W2 (dw_rebase (D) (out2)) )) (PreH17 : (dw_distinct W1 )) (PreH18 : (dw_distinct W2 )) (PreH19 : (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min") )) (PreH20 : (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max") )) (PreH21 : (dw_same lo (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min"))) )) (PreH22 : (dw_same hi (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max"))) )) ,
  (dw_data F )
  **  (dw_ptr_data P )
  **  (dw_output W1 (dw_neon_result (F) (P) (D) (lo) (hi) (O1)) )
  **  ((( &( "channels" ) )) # UInt64  |-> channels_pre)
  **  ((( &( "output_width" ) )) # UInt64  |-> output_width_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "weights" ) )) # Ptr  |-> weights_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  ((( &( "input_stride" ) )) # Int64  |-> input_stride_pre)
  **  ((( &( "output_increment" ) )) # UInt64  |-> output_increment_pre)
  **  ((( &( "input_offset" ) )) # UInt64  |-> input_offset_pre)
  **  ((( &( "input_pixel_stride" ) )) # UInt64  |-> input_pixel_stride_pre)
  **  ((( &( "zero" ) )) # Ptr  |-> zero_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (dw_output W2 O2 )
|--
  “ (params_pre <> 0) ” 
  &&  “ (channels_pre > 0) ” 
  &&  “ (output_width_pre > 0) ” 
  &&  “ (channels_pre = (dw_channels ((dw_rebase (D) (out2))))) ” 
  &&  “ (output_width_pre = (dw_width ((dw_rebase (D) (out2))))) ” 
  &&  “ (input_pre = (dw_input ((dw_rebase (D) (out2))))) ” 
  &&  “ (weights_pre = (dw_weights ((dw_rebase (D) (out2))))) ” 
  &&  “ (right_pre = (dw_out ((dw_rebase (D) (out2))))) ” 
  &&  “ (input_stride_pre = (dw_input_stride ((dw_rebase (D) (out2))))) ” 
  &&  “ (output_increment_pre = (dw_out_increment ((dw_rebase (D) (out2))))) ” 
  &&  “ (input_offset_pre = (dw_offset ((dw_rebase (D) (out2))))) ” 
  &&  “ (input_pixel_stride_pre = (dw_pixel_stride ((dw_rebase (D) (out2))))) ” 
  &&  “ (zero_pre = (dw_zero_ptr ((dw_rebase (D) (out2))))) ” 
  &&  “ (dw_valid F P W2 (dw_rebase (D) (out2)) ) ” 
  &&  “ (dw_distinct W2 ) ” 
  &&  “ (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min") ) ” 
  &&  “ (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max") ) ” 
  &&  “ (dw_same lo (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min"))) ) ” 
  &&  “ (dw_same hi (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max"))) ) ” 
  &&  “ (zero_pre = (dw_zero_ptr ((dw_rebase (D) (right_pre))))) ” 
  &&  “ (input_pixel_stride_pre = (dw_pixel_stride ((dw_rebase (D) (right_pre))))) ” 
  &&  “ (input_offset_pre = (dw_offset ((dw_rebase (D) (right_pre))))) ” 
  &&  “ (output_increment_pre = (dw_out_increment ((dw_rebase (D) (right_pre))))) ” 
  &&  “ (input_stride_pre = (dw_input_stride ((dw_rebase (D) (right_pre))))) ” 
  &&  “ (right_pre = (dw_out ((dw_rebase (D) (right_pre))))) ” 
  &&  “ (weights_pre = (dw_weights ((dw_rebase (D) (right_pre))))) ” 
  &&  “ (input_pre = (dw_input ((dw_rebase (D) (right_pre))))) ” 
  &&  “ (output_width_pre = (dw_width ((dw_rebase (D) (right_pre))))) ” 
  &&  “ (channels_pre = (dw_channels ((dw_rebase (D) (right_pre))))) ”
) \/
(
forall (params_pre: Z) (zero_pre: Z) (input_pixel_stride_pre: Z) (input_offset_pre: Z) (output_increment_pre: Z) (input_stride_pre: Z) (right_pre: Z) (left_pre: Z) (weights_pre: Z) (input_pre: Z) (output_width_pre: Z) (channels_pre: Z) (hi: fp32) (lo: fp32) (O2: DwOutput) (O1: DwOutput) (W2: (@list Z)) (W1: (@list Z)) (out2: Z) (P: DwPtrMap) (F: DwROMap) (D: DwProgram) (PreH1 : (input_pixel_stride_pre <= UINT64_MAX)) (PreH2 : (input_offset_pre <= UINT64_MAX)) (PreH3 : (output_increment_pre <= UINT64_MAX)) (PreH4 : (output_width_pre <= UINT64_MAX)) (PreH5 : (channels_pre <= UINT64_MAX)) (PreH6 : (input_pixel_stride_pre >= 0)) (PreH7 : (input_offset_pre >= 0)) (PreH8 : (output_increment_pre >= 0)) (PreH9 : (output_width_pre >= 0)) (PreH10 : (channels_pre >= 0)) (PreH11 : (input_stride_pre <= INT64_MAX)) (PreH12 : (input_stride_pre >= INT64_MIN)) (PreH13 : (params_pre <> 0)) (PreH14 : (channels_pre > 0)) (PreH15 : (output_width_pre > 0)) (PreH16 : (channels_pre = (dw_channels (D)))) (PreH17 : (output_width_pre = (dw_width (D)))) (PreH18 : (input_pre = (dw_input (D)))) (PreH19 : (weights_pre = (dw_weights (D)))) (PreH20 : (left_pre = (dw_out (D)))) (PreH21 : (right_pre = out2)) (PreH22 : (input_stride_pre = (dw_input_stride (D)))) (PreH23 : (output_increment_pre = (dw_out_increment (D)))) (PreH24 : (input_offset_pre = (dw_offset (D)))) (PreH25 : (input_pixel_stride_pre = (dw_pixel_stride (D)))) (PreH26 : (zero_pre = (dw_zero_ptr (D)))) (PreH27 : (dw_valid F P W1 D )) (PreH28 : (dw_valid F P W2 (dw_rebase (D) (out2)) )) (PreH29 : (dw_distinct W1 )) (PreH30 : (dw_distinct W2 )) (PreH31 : (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min") )) (PreH32 : (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max") )) (PreH33 : (dw_same lo (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min"))) )) (PreH34 : (dw_same hi (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max"))) )) ,
  (dw_data F )
  **  (dw_ptr_data P )
  **  (dw_output W1 (dw_neon_result (F) (P) (D) (lo) (hi) (O1)) )
  **  ((( &( "channels" ) )) # UInt64  |-> channels_pre)
  **  ((( &( "output_width" ) )) # UInt64  |-> output_width_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "weights" ) )) # Ptr  |-> weights_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  ((( &( "input_stride" ) )) # Int64  |-> input_stride_pre)
  **  ((( &( "output_increment" ) )) # UInt64  |-> output_increment_pre)
  **  ((( &( "input_offset" ) )) # UInt64  |-> input_offset_pre)
  **  ((( &( "input_pixel_stride" ) )) # UInt64  |-> input_pixel_stride_pre)
  **  ((( &( "zero" ) )) # Ptr  |-> zero_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (dw_output W2 O2 )
|--
  “ (channels_pre = (dw_channels ((dw_rebase (D) (right_pre))))) ” 
  &&  “ (output_width_pre = (dw_width ((dw_rebase (D) (right_pre))))) ” 
  &&  “ (input_pre = (dw_input ((dw_rebase (D) (right_pre))))) ” 
  &&  “ (weights_pre = (dw_weights ((dw_rebase (D) (right_pre))))) ” 
  &&  “ (right_pre = (dw_out ((dw_rebase (D) (right_pre))))) ” 
  &&  “ (input_stride_pre = (dw_input_stride ((dw_rebase (D) (right_pre))))) ” 
  &&  “ (output_increment_pre = (dw_out_increment ((dw_rebase (D) (right_pre))))) ” 
  &&  “ (input_offset_pre = (dw_offset ((dw_rebase (D) (right_pre))))) ” 
  &&  “ (input_pixel_stride_pre = (dw_pixel_stride ((dw_rebase (D) (right_pre))))) ” 
  &&  “ (zero_pre = (dw_zero_ptr ((dw_rebase (D) (right_pre))))) ” 
  &&  “ (zero_pre = (dw_zero_ptr ((dw_rebase (D) (right_pre))))) ” 
  &&  “ (input_pixel_stride_pre = (dw_pixel_stride ((dw_rebase (D) (right_pre))))) ” 
  &&  “ (input_offset_pre = (dw_offset ((dw_rebase (D) (right_pre))))) ” 
  &&  “ (output_increment_pre = (dw_out_increment ((dw_rebase (D) (right_pre))))) ” 
  &&  “ (input_stride_pre = (dw_input_stride ((dw_rebase (D) (right_pre))))) ” 
  &&  “ (right_pre = (dw_out ((dw_rebase (D) (right_pre))))) ” 
  &&  “ (weights_pre = (dw_weights ((dw_rebase (D) (right_pre))))) ” 
  &&  “ (input_pre = (dw_input ((dw_rebase (D) (right_pre))))) ” 
  &&  “ (output_width_pre = (dw_width ((dw_rebase (D) (right_pre))))) ” 
  &&  “ (channels_pre = (dw_channels ((dw_rebase (D) (right_pre))))) ”
).

Definition equivalent_partial_solve_wit_2_pure_split_goal_1 := 
forall (params_pre: Z) (zero_pre: Z) (input_pixel_stride_pre: Z) (input_offset_pre: Z) (output_increment_pre: Z) (input_stride_pre: Z) (right_pre: Z) (left_pre: Z) (weights_pre: Z) (input_pre: Z) (output_width_pre: Z) (channels_pre: Z) (hi: fp32) (lo: fp32) (O2: DwOutput) (O1: DwOutput) (W2: (@list Z)) (W1: (@list Z)) (out2: Z) (P: DwPtrMap) (F: DwROMap) (D: DwProgram) (PreH1 : (input_pixel_stride_pre <= UINT64_MAX)) (PreH2 : (input_offset_pre <= UINT64_MAX)) (PreH3 : (output_increment_pre <= UINT64_MAX)) (PreH4 : (output_width_pre <= UINT64_MAX)) (PreH5 : (channels_pre <= UINT64_MAX)) (PreH6 : (input_pixel_stride_pre >= 0)) (PreH7 : (input_offset_pre >= 0)) (PreH8 : (output_increment_pre >= 0)) (PreH9 : (output_width_pre >= 0)) (PreH10 : (channels_pre >= 0)) (PreH11 : (input_stride_pre <= INT64_MAX)) (PreH12 : (input_stride_pre >= INT64_MIN)) (PreH13 : (params_pre <> 0)) (PreH14 : (channels_pre > 0)) (PreH15 : (output_width_pre > 0)) (PreH16 : (channels_pre = (dw_channels (D)))) (PreH17 : (output_width_pre = (dw_width (D)))) (PreH18 : (input_pre = (dw_input (D)))) (PreH19 : (weights_pre = (dw_weights (D)))) (PreH20 : (left_pre = (dw_out (D)))) (PreH21 : (right_pre = out2)) (PreH22 : (input_stride_pre = (dw_input_stride (D)))) (PreH23 : (output_increment_pre = (dw_out_increment (D)))) (PreH24 : (input_offset_pre = (dw_offset (D)))) (PreH25 : (input_pixel_stride_pre = (dw_pixel_stride (D)))) (PreH26 : (zero_pre = (dw_zero_ptr (D)))) (PreH27 : (dw_valid F P W1 D )) (PreH28 : (dw_valid F P W2 (dw_rebase (D) (out2)) )) (PreH29 : (dw_distinct W1 )) (PreH30 : (dw_distinct W2 )) (PreH31 : (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min") )) (PreH32 : (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max") )) (PreH33 : (dw_same lo (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min"))) )) (PreH34 : (dw_same hi (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max"))) )) ,
  (dw_data F )
  **  (dw_ptr_data P )
  **  (dw_output W1 (dw_neon_result (F) (P) (D) (lo) (hi) (O1)) )
  **  ((( &( "channels" ) )) # UInt64  |-> channels_pre)
  **  ((( &( "output_width" ) )) # UInt64  |-> output_width_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "weights" ) )) # Ptr  |-> weights_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  ((( &( "input_stride" ) )) # Int64  |-> input_stride_pre)
  **  ((( &( "output_increment" ) )) # UInt64  |-> output_increment_pre)
  **  ((( &( "input_offset" ) )) # UInt64  |-> input_offset_pre)
  **  ((( &( "input_pixel_stride" ) )) # UInt64  |-> input_pixel_stride_pre)
  **  ((( &( "zero" ) )) # Ptr  |-> zero_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (dw_output W2 O2 )
|--
  “ (channels_pre = (dw_channels ((dw_rebase (D) (right_pre))))) ”
.

Definition equivalent_partial_solve_wit_2_pure_split_goal_2 := 
forall (params_pre: Z) (zero_pre: Z) (input_pixel_stride_pre: Z) (input_offset_pre: Z) (output_increment_pre: Z) (input_stride_pre: Z) (right_pre: Z) (left_pre: Z) (weights_pre: Z) (input_pre: Z) (output_width_pre: Z) (channels_pre: Z) (hi: fp32) (lo: fp32) (O2: DwOutput) (O1: DwOutput) (W2: (@list Z)) (W1: (@list Z)) (out2: Z) (P: DwPtrMap) (F: DwROMap) (D: DwProgram) (PreH1 : (input_pixel_stride_pre <= UINT64_MAX)) (PreH2 : (input_offset_pre <= UINT64_MAX)) (PreH3 : (output_increment_pre <= UINT64_MAX)) (PreH4 : (output_width_pre <= UINT64_MAX)) (PreH5 : (channels_pre <= UINT64_MAX)) (PreH6 : (input_pixel_stride_pre >= 0)) (PreH7 : (input_offset_pre >= 0)) (PreH8 : (output_increment_pre >= 0)) (PreH9 : (output_width_pre >= 0)) (PreH10 : (channels_pre >= 0)) (PreH11 : (input_stride_pre <= INT64_MAX)) (PreH12 : (input_stride_pre >= INT64_MIN)) (PreH13 : (params_pre <> 0)) (PreH14 : (channels_pre > 0)) (PreH15 : (output_width_pre > 0)) (PreH16 : (channels_pre = (dw_channels (D)))) (PreH17 : (output_width_pre = (dw_width (D)))) (PreH18 : (input_pre = (dw_input (D)))) (PreH19 : (weights_pre = (dw_weights (D)))) (PreH20 : (left_pre = (dw_out (D)))) (PreH21 : (right_pre = out2)) (PreH22 : (input_stride_pre = (dw_input_stride (D)))) (PreH23 : (output_increment_pre = (dw_out_increment (D)))) (PreH24 : (input_offset_pre = (dw_offset (D)))) (PreH25 : (input_pixel_stride_pre = (dw_pixel_stride (D)))) (PreH26 : (zero_pre = (dw_zero_ptr (D)))) (PreH27 : (dw_valid F P W1 D )) (PreH28 : (dw_valid F P W2 (dw_rebase (D) (out2)) )) (PreH29 : (dw_distinct W1 )) (PreH30 : (dw_distinct W2 )) (PreH31 : (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min") )) (PreH32 : (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max") )) (PreH33 : (dw_same lo (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min"))) )) (PreH34 : (dw_same hi (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max"))) )) ,
  (dw_data F )
  **  (dw_ptr_data P )
  **  (dw_output W1 (dw_neon_result (F) (P) (D) (lo) (hi) (O1)) )
  **  ((( &( "channels" ) )) # UInt64  |-> channels_pre)
  **  ((( &( "output_width" ) )) # UInt64  |-> output_width_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "weights" ) )) # Ptr  |-> weights_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  ((( &( "input_stride" ) )) # Int64  |-> input_stride_pre)
  **  ((( &( "output_increment" ) )) # UInt64  |-> output_increment_pre)
  **  ((( &( "input_offset" ) )) # UInt64  |-> input_offset_pre)
  **  ((( &( "input_pixel_stride" ) )) # UInt64  |-> input_pixel_stride_pre)
  **  ((( &( "zero" ) )) # Ptr  |-> zero_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (dw_output W2 O2 )
|--
  “ (output_width_pre = (dw_width ((dw_rebase (D) (right_pre))))) ”
.

Definition equivalent_partial_solve_wit_2_pure_split_goal_3 := 
forall (params_pre: Z) (zero_pre: Z) (input_pixel_stride_pre: Z) (input_offset_pre: Z) (output_increment_pre: Z) (input_stride_pre: Z) (right_pre: Z) (left_pre: Z) (weights_pre: Z) (input_pre: Z) (output_width_pre: Z) (channels_pre: Z) (hi: fp32) (lo: fp32) (O2: DwOutput) (O1: DwOutput) (W2: (@list Z)) (W1: (@list Z)) (out2: Z) (P: DwPtrMap) (F: DwROMap) (D: DwProgram) (PreH1 : (input_pixel_stride_pre <= UINT64_MAX)) (PreH2 : (input_offset_pre <= UINT64_MAX)) (PreH3 : (output_increment_pre <= UINT64_MAX)) (PreH4 : (output_width_pre <= UINT64_MAX)) (PreH5 : (channels_pre <= UINT64_MAX)) (PreH6 : (input_pixel_stride_pre >= 0)) (PreH7 : (input_offset_pre >= 0)) (PreH8 : (output_increment_pre >= 0)) (PreH9 : (output_width_pre >= 0)) (PreH10 : (channels_pre >= 0)) (PreH11 : (input_stride_pre <= INT64_MAX)) (PreH12 : (input_stride_pre >= INT64_MIN)) (PreH13 : (params_pre <> 0)) (PreH14 : (channels_pre > 0)) (PreH15 : (output_width_pre > 0)) (PreH16 : (channels_pre = (dw_channels (D)))) (PreH17 : (output_width_pre = (dw_width (D)))) (PreH18 : (input_pre = (dw_input (D)))) (PreH19 : (weights_pre = (dw_weights (D)))) (PreH20 : (left_pre = (dw_out (D)))) (PreH21 : (right_pre = out2)) (PreH22 : (input_stride_pre = (dw_input_stride (D)))) (PreH23 : (output_increment_pre = (dw_out_increment (D)))) (PreH24 : (input_offset_pre = (dw_offset (D)))) (PreH25 : (input_pixel_stride_pre = (dw_pixel_stride (D)))) (PreH26 : (zero_pre = (dw_zero_ptr (D)))) (PreH27 : (dw_valid F P W1 D )) (PreH28 : (dw_valid F P W2 (dw_rebase (D) (out2)) )) (PreH29 : (dw_distinct W1 )) (PreH30 : (dw_distinct W2 )) (PreH31 : (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min") )) (PreH32 : (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max") )) (PreH33 : (dw_same lo (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min"))) )) (PreH34 : (dw_same hi (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max"))) )) ,
  (dw_data F )
  **  (dw_ptr_data P )
  **  (dw_output W1 (dw_neon_result (F) (P) (D) (lo) (hi) (O1)) )
  **  ((( &( "channels" ) )) # UInt64  |-> channels_pre)
  **  ((( &( "output_width" ) )) # UInt64  |-> output_width_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "weights" ) )) # Ptr  |-> weights_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  ((( &( "input_stride" ) )) # Int64  |-> input_stride_pre)
  **  ((( &( "output_increment" ) )) # UInt64  |-> output_increment_pre)
  **  ((( &( "input_offset" ) )) # UInt64  |-> input_offset_pre)
  **  ((( &( "input_pixel_stride" ) )) # UInt64  |-> input_pixel_stride_pre)
  **  ((( &( "zero" ) )) # Ptr  |-> zero_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (dw_output W2 O2 )
|--
  “ (input_pre = (dw_input ((dw_rebase (D) (right_pre))))) ”
.

Definition equivalent_partial_solve_wit_2_pure_split_goal_4 := 
forall (params_pre: Z) (zero_pre: Z) (input_pixel_stride_pre: Z) (input_offset_pre: Z) (output_increment_pre: Z) (input_stride_pre: Z) (right_pre: Z) (left_pre: Z) (weights_pre: Z) (input_pre: Z) (output_width_pre: Z) (channels_pre: Z) (hi: fp32) (lo: fp32) (O2: DwOutput) (O1: DwOutput) (W2: (@list Z)) (W1: (@list Z)) (out2: Z) (P: DwPtrMap) (F: DwROMap) (D: DwProgram) (PreH1 : (input_pixel_stride_pre <= UINT64_MAX)) (PreH2 : (input_offset_pre <= UINT64_MAX)) (PreH3 : (output_increment_pre <= UINT64_MAX)) (PreH4 : (output_width_pre <= UINT64_MAX)) (PreH5 : (channels_pre <= UINT64_MAX)) (PreH6 : (input_pixel_stride_pre >= 0)) (PreH7 : (input_offset_pre >= 0)) (PreH8 : (output_increment_pre >= 0)) (PreH9 : (output_width_pre >= 0)) (PreH10 : (channels_pre >= 0)) (PreH11 : (input_stride_pre <= INT64_MAX)) (PreH12 : (input_stride_pre >= INT64_MIN)) (PreH13 : (params_pre <> 0)) (PreH14 : (channels_pre > 0)) (PreH15 : (output_width_pre > 0)) (PreH16 : (channels_pre = (dw_channels (D)))) (PreH17 : (output_width_pre = (dw_width (D)))) (PreH18 : (input_pre = (dw_input (D)))) (PreH19 : (weights_pre = (dw_weights (D)))) (PreH20 : (left_pre = (dw_out (D)))) (PreH21 : (right_pre = out2)) (PreH22 : (input_stride_pre = (dw_input_stride (D)))) (PreH23 : (output_increment_pre = (dw_out_increment (D)))) (PreH24 : (input_offset_pre = (dw_offset (D)))) (PreH25 : (input_pixel_stride_pre = (dw_pixel_stride (D)))) (PreH26 : (zero_pre = (dw_zero_ptr (D)))) (PreH27 : (dw_valid F P W1 D )) (PreH28 : (dw_valid F P W2 (dw_rebase (D) (out2)) )) (PreH29 : (dw_distinct W1 )) (PreH30 : (dw_distinct W2 )) (PreH31 : (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min") )) (PreH32 : (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max") )) (PreH33 : (dw_same lo (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min"))) )) (PreH34 : (dw_same hi (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max"))) )) ,
  (dw_data F )
  **  (dw_ptr_data P )
  **  (dw_output W1 (dw_neon_result (F) (P) (D) (lo) (hi) (O1)) )
  **  ((( &( "channels" ) )) # UInt64  |-> channels_pre)
  **  ((( &( "output_width" ) )) # UInt64  |-> output_width_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "weights" ) )) # Ptr  |-> weights_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  ((( &( "input_stride" ) )) # Int64  |-> input_stride_pre)
  **  ((( &( "output_increment" ) )) # UInt64  |-> output_increment_pre)
  **  ((( &( "input_offset" ) )) # UInt64  |-> input_offset_pre)
  **  ((( &( "input_pixel_stride" ) )) # UInt64  |-> input_pixel_stride_pre)
  **  ((( &( "zero" ) )) # Ptr  |-> zero_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (dw_output W2 O2 )
|--
  “ (weights_pre = (dw_weights ((dw_rebase (D) (right_pre))))) ”
.

Definition equivalent_partial_solve_wit_2_pure_split_goal_5 := 
forall (params_pre: Z) (zero_pre: Z) (input_pixel_stride_pre: Z) (input_offset_pre: Z) (output_increment_pre: Z) (input_stride_pre: Z) (right_pre: Z) (left_pre: Z) (weights_pre: Z) (input_pre: Z) (output_width_pre: Z) (channels_pre: Z) (hi: fp32) (lo: fp32) (O2: DwOutput) (O1: DwOutput) (W2: (@list Z)) (W1: (@list Z)) (out2: Z) (P: DwPtrMap) (F: DwROMap) (D: DwProgram) (PreH1 : (input_pixel_stride_pre <= UINT64_MAX)) (PreH2 : (input_offset_pre <= UINT64_MAX)) (PreH3 : (output_increment_pre <= UINT64_MAX)) (PreH4 : (output_width_pre <= UINT64_MAX)) (PreH5 : (channels_pre <= UINT64_MAX)) (PreH6 : (input_pixel_stride_pre >= 0)) (PreH7 : (input_offset_pre >= 0)) (PreH8 : (output_increment_pre >= 0)) (PreH9 : (output_width_pre >= 0)) (PreH10 : (channels_pre >= 0)) (PreH11 : (input_stride_pre <= INT64_MAX)) (PreH12 : (input_stride_pre >= INT64_MIN)) (PreH13 : (params_pre <> 0)) (PreH14 : (channels_pre > 0)) (PreH15 : (output_width_pre > 0)) (PreH16 : (channels_pre = (dw_channels (D)))) (PreH17 : (output_width_pre = (dw_width (D)))) (PreH18 : (input_pre = (dw_input (D)))) (PreH19 : (weights_pre = (dw_weights (D)))) (PreH20 : (left_pre = (dw_out (D)))) (PreH21 : (right_pre = out2)) (PreH22 : (input_stride_pre = (dw_input_stride (D)))) (PreH23 : (output_increment_pre = (dw_out_increment (D)))) (PreH24 : (input_offset_pre = (dw_offset (D)))) (PreH25 : (input_pixel_stride_pre = (dw_pixel_stride (D)))) (PreH26 : (zero_pre = (dw_zero_ptr (D)))) (PreH27 : (dw_valid F P W1 D )) (PreH28 : (dw_valid F P W2 (dw_rebase (D) (out2)) )) (PreH29 : (dw_distinct W1 )) (PreH30 : (dw_distinct W2 )) (PreH31 : (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min") )) (PreH32 : (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max") )) (PreH33 : (dw_same lo (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min"))) )) (PreH34 : (dw_same hi (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max"))) )) ,
  (dw_data F )
  **  (dw_ptr_data P )
  **  (dw_output W1 (dw_neon_result (F) (P) (D) (lo) (hi) (O1)) )
  **  ((( &( "channels" ) )) # UInt64  |-> channels_pre)
  **  ((( &( "output_width" ) )) # UInt64  |-> output_width_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "weights" ) )) # Ptr  |-> weights_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  ((( &( "input_stride" ) )) # Int64  |-> input_stride_pre)
  **  ((( &( "output_increment" ) )) # UInt64  |-> output_increment_pre)
  **  ((( &( "input_offset" ) )) # UInt64  |-> input_offset_pre)
  **  ((( &( "input_pixel_stride" ) )) # UInt64  |-> input_pixel_stride_pre)
  **  ((( &( "zero" ) )) # Ptr  |-> zero_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (dw_output W2 O2 )
|--
  “ (right_pre = (dw_out ((dw_rebase (D) (right_pre))))) ”
.

Definition equivalent_partial_solve_wit_2_pure_split_goal_6 := 
forall (params_pre: Z) (zero_pre: Z) (input_pixel_stride_pre: Z) (input_offset_pre: Z) (output_increment_pre: Z) (input_stride_pre: Z) (right_pre: Z) (left_pre: Z) (weights_pre: Z) (input_pre: Z) (output_width_pre: Z) (channels_pre: Z) (hi: fp32) (lo: fp32) (O2: DwOutput) (O1: DwOutput) (W2: (@list Z)) (W1: (@list Z)) (out2: Z) (P: DwPtrMap) (F: DwROMap) (D: DwProgram) (PreH1 : (input_pixel_stride_pre <= UINT64_MAX)) (PreH2 : (input_offset_pre <= UINT64_MAX)) (PreH3 : (output_increment_pre <= UINT64_MAX)) (PreH4 : (output_width_pre <= UINT64_MAX)) (PreH5 : (channels_pre <= UINT64_MAX)) (PreH6 : (input_pixel_stride_pre >= 0)) (PreH7 : (input_offset_pre >= 0)) (PreH8 : (output_increment_pre >= 0)) (PreH9 : (output_width_pre >= 0)) (PreH10 : (channels_pre >= 0)) (PreH11 : (input_stride_pre <= INT64_MAX)) (PreH12 : (input_stride_pre >= INT64_MIN)) (PreH13 : (params_pre <> 0)) (PreH14 : (channels_pre > 0)) (PreH15 : (output_width_pre > 0)) (PreH16 : (channels_pre = (dw_channels (D)))) (PreH17 : (output_width_pre = (dw_width (D)))) (PreH18 : (input_pre = (dw_input (D)))) (PreH19 : (weights_pre = (dw_weights (D)))) (PreH20 : (left_pre = (dw_out (D)))) (PreH21 : (right_pre = out2)) (PreH22 : (input_stride_pre = (dw_input_stride (D)))) (PreH23 : (output_increment_pre = (dw_out_increment (D)))) (PreH24 : (input_offset_pre = (dw_offset (D)))) (PreH25 : (input_pixel_stride_pre = (dw_pixel_stride (D)))) (PreH26 : (zero_pre = (dw_zero_ptr (D)))) (PreH27 : (dw_valid F P W1 D )) (PreH28 : (dw_valid F P W2 (dw_rebase (D) (out2)) )) (PreH29 : (dw_distinct W1 )) (PreH30 : (dw_distinct W2 )) (PreH31 : (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min") )) (PreH32 : (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max") )) (PreH33 : (dw_same lo (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min"))) )) (PreH34 : (dw_same hi (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max"))) )) ,
  (dw_data F )
  **  (dw_ptr_data P )
  **  (dw_output W1 (dw_neon_result (F) (P) (D) (lo) (hi) (O1)) )
  **  ((( &( "channels" ) )) # UInt64  |-> channels_pre)
  **  ((( &( "output_width" ) )) # UInt64  |-> output_width_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "weights" ) )) # Ptr  |-> weights_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  ((( &( "input_stride" ) )) # Int64  |-> input_stride_pre)
  **  ((( &( "output_increment" ) )) # UInt64  |-> output_increment_pre)
  **  ((( &( "input_offset" ) )) # UInt64  |-> input_offset_pre)
  **  ((( &( "input_pixel_stride" ) )) # UInt64  |-> input_pixel_stride_pre)
  **  ((( &( "zero" ) )) # Ptr  |-> zero_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (dw_output W2 O2 )
|--
  “ (input_stride_pre = (dw_input_stride ((dw_rebase (D) (right_pre))))) ”
.

Definition equivalent_partial_solve_wit_2_pure_split_goal_7 := 
forall (params_pre: Z) (zero_pre: Z) (input_pixel_stride_pre: Z) (input_offset_pre: Z) (output_increment_pre: Z) (input_stride_pre: Z) (right_pre: Z) (left_pre: Z) (weights_pre: Z) (input_pre: Z) (output_width_pre: Z) (channels_pre: Z) (hi: fp32) (lo: fp32) (O2: DwOutput) (O1: DwOutput) (W2: (@list Z)) (W1: (@list Z)) (out2: Z) (P: DwPtrMap) (F: DwROMap) (D: DwProgram) (PreH1 : (input_pixel_stride_pre <= UINT64_MAX)) (PreH2 : (input_offset_pre <= UINT64_MAX)) (PreH3 : (output_increment_pre <= UINT64_MAX)) (PreH4 : (output_width_pre <= UINT64_MAX)) (PreH5 : (channels_pre <= UINT64_MAX)) (PreH6 : (input_pixel_stride_pre >= 0)) (PreH7 : (input_offset_pre >= 0)) (PreH8 : (output_increment_pre >= 0)) (PreH9 : (output_width_pre >= 0)) (PreH10 : (channels_pre >= 0)) (PreH11 : (input_stride_pre <= INT64_MAX)) (PreH12 : (input_stride_pre >= INT64_MIN)) (PreH13 : (params_pre <> 0)) (PreH14 : (channels_pre > 0)) (PreH15 : (output_width_pre > 0)) (PreH16 : (channels_pre = (dw_channels (D)))) (PreH17 : (output_width_pre = (dw_width (D)))) (PreH18 : (input_pre = (dw_input (D)))) (PreH19 : (weights_pre = (dw_weights (D)))) (PreH20 : (left_pre = (dw_out (D)))) (PreH21 : (right_pre = out2)) (PreH22 : (input_stride_pre = (dw_input_stride (D)))) (PreH23 : (output_increment_pre = (dw_out_increment (D)))) (PreH24 : (input_offset_pre = (dw_offset (D)))) (PreH25 : (input_pixel_stride_pre = (dw_pixel_stride (D)))) (PreH26 : (zero_pre = (dw_zero_ptr (D)))) (PreH27 : (dw_valid F P W1 D )) (PreH28 : (dw_valid F P W2 (dw_rebase (D) (out2)) )) (PreH29 : (dw_distinct W1 )) (PreH30 : (dw_distinct W2 )) (PreH31 : (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min") )) (PreH32 : (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max") )) (PreH33 : (dw_same lo (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min"))) )) (PreH34 : (dw_same hi (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max"))) )) ,
  (dw_data F )
  **  (dw_ptr_data P )
  **  (dw_output W1 (dw_neon_result (F) (P) (D) (lo) (hi) (O1)) )
  **  ((( &( "channels" ) )) # UInt64  |-> channels_pre)
  **  ((( &( "output_width" ) )) # UInt64  |-> output_width_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "weights" ) )) # Ptr  |-> weights_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  ((( &( "input_stride" ) )) # Int64  |-> input_stride_pre)
  **  ((( &( "output_increment" ) )) # UInt64  |-> output_increment_pre)
  **  ((( &( "input_offset" ) )) # UInt64  |-> input_offset_pre)
  **  ((( &( "input_pixel_stride" ) )) # UInt64  |-> input_pixel_stride_pre)
  **  ((( &( "zero" ) )) # Ptr  |-> zero_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (dw_output W2 O2 )
|--
  “ (output_increment_pre = (dw_out_increment ((dw_rebase (D) (right_pre))))) ”
.

Definition equivalent_partial_solve_wit_2_pure_split_goal_8 := 
forall (params_pre: Z) (zero_pre: Z) (input_pixel_stride_pre: Z) (input_offset_pre: Z) (output_increment_pre: Z) (input_stride_pre: Z) (right_pre: Z) (left_pre: Z) (weights_pre: Z) (input_pre: Z) (output_width_pre: Z) (channels_pre: Z) (hi: fp32) (lo: fp32) (O2: DwOutput) (O1: DwOutput) (W2: (@list Z)) (W1: (@list Z)) (out2: Z) (P: DwPtrMap) (F: DwROMap) (D: DwProgram) (PreH1 : (input_pixel_stride_pre <= UINT64_MAX)) (PreH2 : (input_offset_pre <= UINT64_MAX)) (PreH3 : (output_increment_pre <= UINT64_MAX)) (PreH4 : (output_width_pre <= UINT64_MAX)) (PreH5 : (channels_pre <= UINT64_MAX)) (PreH6 : (input_pixel_stride_pre >= 0)) (PreH7 : (input_offset_pre >= 0)) (PreH8 : (output_increment_pre >= 0)) (PreH9 : (output_width_pre >= 0)) (PreH10 : (channels_pre >= 0)) (PreH11 : (input_stride_pre <= INT64_MAX)) (PreH12 : (input_stride_pre >= INT64_MIN)) (PreH13 : (params_pre <> 0)) (PreH14 : (channels_pre > 0)) (PreH15 : (output_width_pre > 0)) (PreH16 : (channels_pre = (dw_channels (D)))) (PreH17 : (output_width_pre = (dw_width (D)))) (PreH18 : (input_pre = (dw_input (D)))) (PreH19 : (weights_pre = (dw_weights (D)))) (PreH20 : (left_pre = (dw_out (D)))) (PreH21 : (right_pre = out2)) (PreH22 : (input_stride_pre = (dw_input_stride (D)))) (PreH23 : (output_increment_pre = (dw_out_increment (D)))) (PreH24 : (input_offset_pre = (dw_offset (D)))) (PreH25 : (input_pixel_stride_pre = (dw_pixel_stride (D)))) (PreH26 : (zero_pre = (dw_zero_ptr (D)))) (PreH27 : (dw_valid F P W1 D )) (PreH28 : (dw_valid F P W2 (dw_rebase (D) (out2)) )) (PreH29 : (dw_distinct W1 )) (PreH30 : (dw_distinct W2 )) (PreH31 : (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min") )) (PreH32 : (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max") )) (PreH33 : (dw_same lo (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min"))) )) (PreH34 : (dw_same hi (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max"))) )) ,
  (dw_data F )
  **  (dw_ptr_data P )
  **  (dw_output W1 (dw_neon_result (F) (P) (D) (lo) (hi) (O1)) )
  **  ((( &( "channels" ) )) # UInt64  |-> channels_pre)
  **  ((( &( "output_width" ) )) # UInt64  |-> output_width_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "weights" ) )) # Ptr  |-> weights_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  ((( &( "input_stride" ) )) # Int64  |-> input_stride_pre)
  **  ((( &( "output_increment" ) )) # UInt64  |-> output_increment_pre)
  **  ((( &( "input_offset" ) )) # UInt64  |-> input_offset_pre)
  **  ((( &( "input_pixel_stride" ) )) # UInt64  |-> input_pixel_stride_pre)
  **  ((( &( "zero" ) )) # Ptr  |-> zero_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (dw_output W2 O2 )
|--
  “ (input_offset_pre = (dw_offset ((dw_rebase (D) (right_pre))))) ”
.

Definition equivalent_partial_solve_wit_2_pure_split_goal_9 := 
forall (params_pre: Z) (zero_pre: Z) (input_pixel_stride_pre: Z) (input_offset_pre: Z) (output_increment_pre: Z) (input_stride_pre: Z) (right_pre: Z) (left_pre: Z) (weights_pre: Z) (input_pre: Z) (output_width_pre: Z) (channels_pre: Z) (hi: fp32) (lo: fp32) (O2: DwOutput) (O1: DwOutput) (W2: (@list Z)) (W1: (@list Z)) (out2: Z) (P: DwPtrMap) (F: DwROMap) (D: DwProgram) (PreH1 : (input_pixel_stride_pre <= UINT64_MAX)) (PreH2 : (input_offset_pre <= UINT64_MAX)) (PreH3 : (output_increment_pre <= UINT64_MAX)) (PreH4 : (output_width_pre <= UINT64_MAX)) (PreH5 : (channels_pre <= UINT64_MAX)) (PreH6 : (input_pixel_stride_pre >= 0)) (PreH7 : (input_offset_pre >= 0)) (PreH8 : (output_increment_pre >= 0)) (PreH9 : (output_width_pre >= 0)) (PreH10 : (channels_pre >= 0)) (PreH11 : (input_stride_pre <= INT64_MAX)) (PreH12 : (input_stride_pre >= INT64_MIN)) (PreH13 : (params_pre <> 0)) (PreH14 : (channels_pre > 0)) (PreH15 : (output_width_pre > 0)) (PreH16 : (channels_pre = (dw_channels (D)))) (PreH17 : (output_width_pre = (dw_width (D)))) (PreH18 : (input_pre = (dw_input (D)))) (PreH19 : (weights_pre = (dw_weights (D)))) (PreH20 : (left_pre = (dw_out (D)))) (PreH21 : (right_pre = out2)) (PreH22 : (input_stride_pre = (dw_input_stride (D)))) (PreH23 : (output_increment_pre = (dw_out_increment (D)))) (PreH24 : (input_offset_pre = (dw_offset (D)))) (PreH25 : (input_pixel_stride_pre = (dw_pixel_stride (D)))) (PreH26 : (zero_pre = (dw_zero_ptr (D)))) (PreH27 : (dw_valid F P W1 D )) (PreH28 : (dw_valid F P W2 (dw_rebase (D) (out2)) )) (PreH29 : (dw_distinct W1 )) (PreH30 : (dw_distinct W2 )) (PreH31 : (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min") )) (PreH32 : (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max") )) (PreH33 : (dw_same lo (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min"))) )) (PreH34 : (dw_same hi (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max"))) )) ,
  (dw_data F )
  **  (dw_ptr_data P )
  **  (dw_output W1 (dw_neon_result (F) (P) (D) (lo) (hi) (O1)) )
  **  ((( &( "channels" ) )) # UInt64  |-> channels_pre)
  **  ((( &( "output_width" ) )) # UInt64  |-> output_width_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "weights" ) )) # Ptr  |-> weights_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  ((( &( "input_stride" ) )) # Int64  |-> input_stride_pre)
  **  ((( &( "output_increment" ) )) # UInt64  |-> output_increment_pre)
  **  ((( &( "input_offset" ) )) # UInt64  |-> input_offset_pre)
  **  ((( &( "input_pixel_stride" ) )) # UInt64  |-> input_pixel_stride_pre)
  **  ((( &( "zero" ) )) # Ptr  |-> zero_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (dw_output W2 O2 )
|--
  “ (input_pixel_stride_pre = (dw_pixel_stride ((dw_rebase (D) (right_pre))))) ”
.

Definition equivalent_partial_solve_wit_2_pure_split_goal_10 := 
forall (params_pre: Z) (zero_pre: Z) (input_pixel_stride_pre: Z) (input_offset_pre: Z) (output_increment_pre: Z) (input_stride_pre: Z) (right_pre: Z) (left_pre: Z) (weights_pre: Z) (input_pre: Z) (output_width_pre: Z) (channels_pre: Z) (hi: fp32) (lo: fp32) (O2: DwOutput) (O1: DwOutput) (W2: (@list Z)) (W1: (@list Z)) (out2: Z) (P: DwPtrMap) (F: DwROMap) (D: DwProgram) (PreH1 : (input_pixel_stride_pre <= UINT64_MAX)) (PreH2 : (input_offset_pre <= UINT64_MAX)) (PreH3 : (output_increment_pre <= UINT64_MAX)) (PreH4 : (output_width_pre <= UINT64_MAX)) (PreH5 : (channels_pre <= UINT64_MAX)) (PreH6 : (input_pixel_stride_pre >= 0)) (PreH7 : (input_offset_pre >= 0)) (PreH8 : (output_increment_pre >= 0)) (PreH9 : (output_width_pre >= 0)) (PreH10 : (channels_pre >= 0)) (PreH11 : (input_stride_pre <= INT64_MAX)) (PreH12 : (input_stride_pre >= INT64_MIN)) (PreH13 : (params_pre <> 0)) (PreH14 : (channels_pre > 0)) (PreH15 : (output_width_pre > 0)) (PreH16 : (channels_pre = (dw_channels (D)))) (PreH17 : (output_width_pre = (dw_width (D)))) (PreH18 : (input_pre = (dw_input (D)))) (PreH19 : (weights_pre = (dw_weights (D)))) (PreH20 : (left_pre = (dw_out (D)))) (PreH21 : (right_pre = out2)) (PreH22 : (input_stride_pre = (dw_input_stride (D)))) (PreH23 : (output_increment_pre = (dw_out_increment (D)))) (PreH24 : (input_offset_pre = (dw_offset (D)))) (PreH25 : (input_pixel_stride_pre = (dw_pixel_stride (D)))) (PreH26 : (zero_pre = (dw_zero_ptr (D)))) (PreH27 : (dw_valid F P W1 D )) (PreH28 : (dw_valid F P W2 (dw_rebase (D) (out2)) )) (PreH29 : (dw_distinct W1 )) (PreH30 : (dw_distinct W2 )) (PreH31 : (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min") )) (PreH32 : (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max") )) (PreH33 : (dw_same lo (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min"))) )) (PreH34 : (dw_same hi (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max"))) )) ,
  (dw_data F )
  **  (dw_ptr_data P )
  **  (dw_output W1 (dw_neon_result (F) (P) (D) (lo) (hi) (O1)) )
  **  ((( &( "channels" ) )) # UInt64  |-> channels_pre)
  **  ((( &( "output_width" ) )) # UInt64  |-> output_width_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "weights" ) )) # Ptr  |-> weights_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  ((( &( "input_stride" ) )) # Int64  |-> input_stride_pre)
  **  ((( &( "output_increment" ) )) # UInt64  |-> output_increment_pre)
  **  ((( &( "input_offset" ) )) # UInt64  |-> input_offset_pre)
  **  ((( &( "input_pixel_stride" ) )) # UInt64  |-> input_pixel_stride_pre)
  **  ((( &( "zero" ) )) # Ptr  |-> zero_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (dw_output W2 O2 )
|--
  “ (zero_pre = (dw_zero_ptr ((dw_rebase (D) (right_pre))))) ”
.

Definition equivalent_partial_solve_wit_2_pure_split_goal_11 := 
forall (params_pre: Z) (zero_pre: Z) (input_pixel_stride_pre: Z) (input_offset_pre: Z) (output_increment_pre: Z) (input_stride_pre: Z) (right_pre: Z) (left_pre: Z) (weights_pre: Z) (input_pre: Z) (output_width_pre: Z) (channels_pre: Z) (hi: fp32) (lo: fp32) (O2: DwOutput) (O1: DwOutput) (W2: (@list Z)) (W1: (@list Z)) (out2: Z) (P: DwPtrMap) (F: DwROMap) (D: DwProgram) (PreH1 : (input_pixel_stride_pre <= UINT64_MAX)) (PreH2 : (input_offset_pre <= UINT64_MAX)) (PreH3 : (output_increment_pre <= UINT64_MAX)) (PreH4 : (output_width_pre <= UINT64_MAX)) (PreH5 : (channels_pre <= UINT64_MAX)) (PreH6 : (input_pixel_stride_pre >= 0)) (PreH7 : (input_offset_pre >= 0)) (PreH8 : (output_increment_pre >= 0)) (PreH9 : (output_width_pre >= 0)) (PreH10 : (channels_pre >= 0)) (PreH11 : (input_stride_pre <= INT64_MAX)) (PreH12 : (input_stride_pre >= INT64_MIN)) (PreH13 : (params_pre <> 0)) (PreH14 : (channels_pre > 0)) (PreH15 : (output_width_pre > 0)) (PreH16 : (channels_pre = (dw_channels (D)))) (PreH17 : (output_width_pre = (dw_width (D)))) (PreH18 : (input_pre = (dw_input (D)))) (PreH19 : (weights_pre = (dw_weights (D)))) (PreH20 : (left_pre = (dw_out (D)))) (PreH21 : (right_pre = out2)) (PreH22 : (input_stride_pre = (dw_input_stride (D)))) (PreH23 : (output_increment_pre = (dw_out_increment (D)))) (PreH24 : (input_offset_pre = (dw_offset (D)))) (PreH25 : (input_pixel_stride_pre = (dw_pixel_stride (D)))) (PreH26 : (zero_pre = (dw_zero_ptr (D)))) (PreH27 : (dw_valid F P W1 D )) (PreH28 : (dw_valid F P W2 (dw_rebase (D) (out2)) )) (PreH29 : (dw_distinct W1 )) (PreH30 : (dw_distinct W2 )) (PreH31 : (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min") )) (PreH32 : (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max") )) (PreH33 : (dw_same lo (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min"))) )) (PreH34 : (dw_same hi (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max"))) )) ,
  (dw_data F )
  **  (dw_ptr_data P )
  **  (dw_output W1 (dw_neon_result (F) (P) (D) (lo) (hi) (O1)) )
  **  ((( &( "channels" ) )) # UInt64  |-> channels_pre)
  **  ((( &( "output_width" ) )) # UInt64  |-> output_width_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "weights" ) )) # Ptr  |-> weights_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  ((( &( "input_stride" ) )) # Int64  |-> input_stride_pre)
  **  ((( &( "output_increment" ) )) # UInt64  |-> output_increment_pre)
  **  ((( &( "input_offset" ) )) # UInt64  |-> input_offset_pre)
  **  ((( &( "input_pixel_stride" ) )) # UInt64  |-> input_pixel_stride_pre)
  **  ((( &( "zero" ) )) # Ptr  |-> zero_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (dw_output W2 O2 )
|--
  “ (zero_pre = (dw_zero_ptr ((dw_rebase (D) (right_pre))))) ”
.

Definition equivalent_partial_solve_wit_2_pure_split_goal_12 := 
forall (params_pre: Z) (zero_pre: Z) (input_pixel_stride_pre: Z) (input_offset_pre: Z) (output_increment_pre: Z) (input_stride_pre: Z) (right_pre: Z) (left_pre: Z) (weights_pre: Z) (input_pre: Z) (output_width_pre: Z) (channels_pre: Z) (hi: fp32) (lo: fp32) (O2: DwOutput) (O1: DwOutput) (W2: (@list Z)) (W1: (@list Z)) (out2: Z) (P: DwPtrMap) (F: DwROMap) (D: DwProgram) (PreH1 : (input_pixel_stride_pre <= UINT64_MAX)) (PreH2 : (input_offset_pre <= UINT64_MAX)) (PreH3 : (output_increment_pre <= UINT64_MAX)) (PreH4 : (output_width_pre <= UINT64_MAX)) (PreH5 : (channels_pre <= UINT64_MAX)) (PreH6 : (input_pixel_stride_pre >= 0)) (PreH7 : (input_offset_pre >= 0)) (PreH8 : (output_increment_pre >= 0)) (PreH9 : (output_width_pre >= 0)) (PreH10 : (channels_pre >= 0)) (PreH11 : (input_stride_pre <= INT64_MAX)) (PreH12 : (input_stride_pre >= INT64_MIN)) (PreH13 : (params_pre <> 0)) (PreH14 : (channels_pre > 0)) (PreH15 : (output_width_pre > 0)) (PreH16 : (channels_pre = (dw_channels (D)))) (PreH17 : (output_width_pre = (dw_width (D)))) (PreH18 : (input_pre = (dw_input (D)))) (PreH19 : (weights_pre = (dw_weights (D)))) (PreH20 : (left_pre = (dw_out (D)))) (PreH21 : (right_pre = out2)) (PreH22 : (input_stride_pre = (dw_input_stride (D)))) (PreH23 : (output_increment_pre = (dw_out_increment (D)))) (PreH24 : (input_offset_pre = (dw_offset (D)))) (PreH25 : (input_pixel_stride_pre = (dw_pixel_stride (D)))) (PreH26 : (zero_pre = (dw_zero_ptr (D)))) (PreH27 : (dw_valid F P W1 D )) (PreH28 : (dw_valid F P W2 (dw_rebase (D) (out2)) )) (PreH29 : (dw_distinct W1 )) (PreH30 : (dw_distinct W2 )) (PreH31 : (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min") )) (PreH32 : (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max") )) (PreH33 : (dw_same lo (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min"))) )) (PreH34 : (dw_same hi (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max"))) )) ,
  (dw_data F )
  **  (dw_ptr_data P )
  **  (dw_output W1 (dw_neon_result (F) (P) (D) (lo) (hi) (O1)) )
  **  ((( &( "channels" ) )) # UInt64  |-> channels_pre)
  **  ((( &( "output_width" ) )) # UInt64  |-> output_width_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "weights" ) )) # Ptr  |-> weights_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  ((( &( "input_stride" ) )) # Int64  |-> input_stride_pre)
  **  ((( &( "output_increment" ) )) # UInt64  |-> output_increment_pre)
  **  ((( &( "input_offset" ) )) # UInt64  |-> input_offset_pre)
  **  ((( &( "input_pixel_stride" ) )) # UInt64  |-> input_pixel_stride_pre)
  **  ((( &( "zero" ) )) # Ptr  |-> zero_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (dw_output W2 O2 )
|--
  “ (input_pixel_stride_pre = (dw_pixel_stride ((dw_rebase (D) (right_pre))))) ”
.

Definition equivalent_partial_solve_wit_2_pure_split_goal_13 := 
forall (params_pre: Z) (zero_pre: Z) (input_pixel_stride_pre: Z) (input_offset_pre: Z) (output_increment_pre: Z) (input_stride_pre: Z) (right_pre: Z) (left_pre: Z) (weights_pre: Z) (input_pre: Z) (output_width_pre: Z) (channels_pre: Z) (hi: fp32) (lo: fp32) (O2: DwOutput) (O1: DwOutput) (W2: (@list Z)) (W1: (@list Z)) (out2: Z) (P: DwPtrMap) (F: DwROMap) (D: DwProgram) (PreH1 : (input_pixel_stride_pre <= UINT64_MAX)) (PreH2 : (input_offset_pre <= UINT64_MAX)) (PreH3 : (output_increment_pre <= UINT64_MAX)) (PreH4 : (output_width_pre <= UINT64_MAX)) (PreH5 : (channels_pre <= UINT64_MAX)) (PreH6 : (input_pixel_stride_pre >= 0)) (PreH7 : (input_offset_pre >= 0)) (PreH8 : (output_increment_pre >= 0)) (PreH9 : (output_width_pre >= 0)) (PreH10 : (channels_pre >= 0)) (PreH11 : (input_stride_pre <= INT64_MAX)) (PreH12 : (input_stride_pre >= INT64_MIN)) (PreH13 : (params_pre <> 0)) (PreH14 : (channels_pre > 0)) (PreH15 : (output_width_pre > 0)) (PreH16 : (channels_pre = (dw_channels (D)))) (PreH17 : (output_width_pre = (dw_width (D)))) (PreH18 : (input_pre = (dw_input (D)))) (PreH19 : (weights_pre = (dw_weights (D)))) (PreH20 : (left_pre = (dw_out (D)))) (PreH21 : (right_pre = out2)) (PreH22 : (input_stride_pre = (dw_input_stride (D)))) (PreH23 : (output_increment_pre = (dw_out_increment (D)))) (PreH24 : (input_offset_pre = (dw_offset (D)))) (PreH25 : (input_pixel_stride_pre = (dw_pixel_stride (D)))) (PreH26 : (zero_pre = (dw_zero_ptr (D)))) (PreH27 : (dw_valid F P W1 D )) (PreH28 : (dw_valid F P W2 (dw_rebase (D) (out2)) )) (PreH29 : (dw_distinct W1 )) (PreH30 : (dw_distinct W2 )) (PreH31 : (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min") )) (PreH32 : (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max") )) (PreH33 : (dw_same lo (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min"))) )) (PreH34 : (dw_same hi (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max"))) )) ,
  (dw_data F )
  **  (dw_ptr_data P )
  **  (dw_output W1 (dw_neon_result (F) (P) (D) (lo) (hi) (O1)) )
  **  ((( &( "channels" ) )) # UInt64  |-> channels_pre)
  **  ((( &( "output_width" ) )) # UInt64  |-> output_width_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "weights" ) )) # Ptr  |-> weights_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  ((( &( "input_stride" ) )) # Int64  |-> input_stride_pre)
  **  ((( &( "output_increment" ) )) # UInt64  |-> output_increment_pre)
  **  ((( &( "input_offset" ) )) # UInt64  |-> input_offset_pre)
  **  ((( &( "input_pixel_stride" ) )) # UInt64  |-> input_pixel_stride_pre)
  **  ((( &( "zero" ) )) # Ptr  |-> zero_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (dw_output W2 O2 )
|--
  “ (input_offset_pre = (dw_offset ((dw_rebase (D) (right_pre))))) ”
.

Definition equivalent_partial_solve_wit_2_pure_split_goal_14 := 
forall (params_pre: Z) (zero_pre: Z) (input_pixel_stride_pre: Z) (input_offset_pre: Z) (output_increment_pre: Z) (input_stride_pre: Z) (right_pre: Z) (left_pre: Z) (weights_pre: Z) (input_pre: Z) (output_width_pre: Z) (channels_pre: Z) (hi: fp32) (lo: fp32) (O2: DwOutput) (O1: DwOutput) (W2: (@list Z)) (W1: (@list Z)) (out2: Z) (P: DwPtrMap) (F: DwROMap) (D: DwProgram) (PreH1 : (input_pixel_stride_pre <= UINT64_MAX)) (PreH2 : (input_offset_pre <= UINT64_MAX)) (PreH3 : (output_increment_pre <= UINT64_MAX)) (PreH4 : (output_width_pre <= UINT64_MAX)) (PreH5 : (channels_pre <= UINT64_MAX)) (PreH6 : (input_pixel_stride_pre >= 0)) (PreH7 : (input_offset_pre >= 0)) (PreH8 : (output_increment_pre >= 0)) (PreH9 : (output_width_pre >= 0)) (PreH10 : (channels_pre >= 0)) (PreH11 : (input_stride_pre <= INT64_MAX)) (PreH12 : (input_stride_pre >= INT64_MIN)) (PreH13 : (params_pre <> 0)) (PreH14 : (channels_pre > 0)) (PreH15 : (output_width_pre > 0)) (PreH16 : (channels_pre = (dw_channels (D)))) (PreH17 : (output_width_pre = (dw_width (D)))) (PreH18 : (input_pre = (dw_input (D)))) (PreH19 : (weights_pre = (dw_weights (D)))) (PreH20 : (left_pre = (dw_out (D)))) (PreH21 : (right_pre = out2)) (PreH22 : (input_stride_pre = (dw_input_stride (D)))) (PreH23 : (output_increment_pre = (dw_out_increment (D)))) (PreH24 : (input_offset_pre = (dw_offset (D)))) (PreH25 : (input_pixel_stride_pre = (dw_pixel_stride (D)))) (PreH26 : (zero_pre = (dw_zero_ptr (D)))) (PreH27 : (dw_valid F P W1 D )) (PreH28 : (dw_valid F P W2 (dw_rebase (D) (out2)) )) (PreH29 : (dw_distinct W1 )) (PreH30 : (dw_distinct W2 )) (PreH31 : (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min") )) (PreH32 : (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max") )) (PreH33 : (dw_same lo (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min"))) )) (PreH34 : (dw_same hi (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max"))) )) ,
  (dw_data F )
  **  (dw_ptr_data P )
  **  (dw_output W1 (dw_neon_result (F) (P) (D) (lo) (hi) (O1)) )
  **  ((( &( "channels" ) )) # UInt64  |-> channels_pre)
  **  ((( &( "output_width" ) )) # UInt64  |-> output_width_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "weights" ) )) # Ptr  |-> weights_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  ((( &( "input_stride" ) )) # Int64  |-> input_stride_pre)
  **  ((( &( "output_increment" ) )) # UInt64  |-> output_increment_pre)
  **  ((( &( "input_offset" ) )) # UInt64  |-> input_offset_pre)
  **  ((( &( "input_pixel_stride" ) )) # UInt64  |-> input_pixel_stride_pre)
  **  ((( &( "zero" ) )) # Ptr  |-> zero_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (dw_output W2 O2 )
|--
  “ (output_increment_pre = (dw_out_increment ((dw_rebase (D) (right_pre))))) ”
.

Definition equivalent_partial_solve_wit_2_pure_split_goal_15 := 
forall (params_pre: Z) (zero_pre: Z) (input_pixel_stride_pre: Z) (input_offset_pre: Z) (output_increment_pre: Z) (input_stride_pre: Z) (right_pre: Z) (left_pre: Z) (weights_pre: Z) (input_pre: Z) (output_width_pre: Z) (channels_pre: Z) (hi: fp32) (lo: fp32) (O2: DwOutput) (O1: DwOutput) (W2: (@list Z)) (W1: (@list Z)) (out2: Z) (P: DwPtrMap) (F: DwROMap) (D: DwProgram) (PreH1 : (input_pixel_stride_pre <= UINT64_MAX)) (PreH2 : (input_offset_pre <= UINT64_MAX)) (PreH3 : (output_increment_pre <= UINT64_MAX)) (PreH4 : (output_width_pre <= UINT64_MAX)) (PreH5 : (channels_pre <= UINT64_MAX)) (PreH6 : (input_pixel_stride_pre >= 0)) (PreH7 : (input_offset_pre >= 0)) (PreH8 : (output_increment_pre >= 0)) (PreH9 : (output_width_pre >= 0)) (PreH10 : (channels_pre >= 0)) (PreH11 : (input_stride_pre <= INT64_MAX)) (PreH12 : (input_stride_pre >= INT64_MIN)) (PreH13 : (params_pre <> 0)) (PreH14 : (channels_pre > 0)) (PreH15 : (output_width_pre > 0)) (PreH16 : (channels_pre = (dw_channels (D)))) (PreH17 : (output_width_pre = (dw_width (D)))) (PreH18 : (input_pre = (dw_input (D)))) (PreH19 : (weights_pre = (dw_weights (D)))) (PreH20 : (left_pre = (dw_out (D)))) (PreH21 : (right_pre = out2)) (PreH22 : (input_stride_pre = (dw_input_stride (D)))) (PreH23 : (output_increment_pre = (dw_out_increment (D)))) (PreH24 : (input_offset_pre = (dw_offset (D)))) (PreH25 : (input_pixel_stride_pre = (dw_pixel_stride (D)))) (PreH26 : (zero_pre = (dw_zero_ptr (D)))) (PreH27 : (dw_valid F P W1 D )) (PreH28 : (dw_valid F P W2 (dw_rebase (D) (out2)) )) (PreH29 : (dw_distinct W1 )) (PreH30 : (dw_distinct W2 )) (PreH31 : (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min") )) (PreH32 : (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max") )) (PreH33 : (dw_same lo (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min"))) )) (PreH34 : (dw_same hi (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max"))) )) ,
  (dw_data F )
  **  (dw_ptr_data P )
  **  (dw_output W1 (dw_neon_result (F) (P) (D) (lo) (hi) (O1)) )
  **  ((( &( "channels" ) )) # UInt64  |-> channels_pre)
  **  ((( &( "output_width" ) )) # UInt64  |-> output_width_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "weights" ) )) # Ptr  |-> weights_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  ((( &( "input_stride" ) )) # Int64  |-> input_stride_pre)
  **  ((( &( "output_increment" ) )) # UInt64  |-> output_increment_pre)
  **  ((( &( "input_offset" ) )) # UInt64  |-> input_offset_pre)
  **  ((( &( "input_pixel_stride" ) )) # UInt64  |-> input_pixel_stride_pre)
  **  ((( &( "zero" ) )) # Ptr  |-> zero_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (dw_output W2 O2 )
|--
  “ (input_stride_pre = (dw_input_stride ((dw_rebase (D) (right_pre))))) ”
.

Definition equivalent_partial_solve_wit_2_pure_split_goal_16 := 
forall (params_pre: Z) (zero_pre: Z) (input_pixel_stride_pre: Z) (input_offset_pre: Z) (output_increment_pre: Z) (input_stride_pre: Z) (right_pre: Z) (left_pre: Z) (weights_pre: Z) (input_pre: Z) (output_width_pre: Z) (channels_pre: Z) (hi: fp32) (lo: fp32) (O2: DwOutput) (O1: DwOutput) (W2: (@list Z)) (W1: (@list Z)) (out2: Z) (P: DwPtrMap) (F: DwROMap) (D: DwProgram) (PreH1 : (input_pixel_stride_pre <= UINT64_MAX)) (PreH2 : (input_offset_pre <= UINT64_MAX)) (PreH3 : (output_increment_pre <= UINT64_MAX)) (PreH4 : (output_width_pre <= UINT64_MAX)) (PreH5 : (channels_pre <= UINT64_MAX)) (PreH6 : (input_pixel_stride_pre >= 0)) (PreH7 : (input_offset_pre >= 0)) (PreH8 : (output_increment_pre >= 0)) (PreH9 : (output_width_pre >= 0)) (PreH10 : (channels_pre >= 0)) (PreH11 : (input_stride_pre <= INT64_MAX)) (PreH12 : (input_stride_pre >= INT64_MIN)) (PreH13 : (params_pre <> 0)) (PreH14 : (channels_pre > 0)) (PreH15 : (output_width_pre > 0)) (PreH16 : (channels_pre = (dw_channels (D)))) (PreH17 : (output_width_pre = (dw_width (D)))) (PreH18 : (input_pre = (dw_input (D)))) (PreH19 : (weights_pre = (dw_weights (D)))) (PreH20 : (left_pre = (dw_out (D)))) (PreH21 : (right_pre = out2)) (PreH22 : (input_stride_pre = (dw_input_stride (D)))) (PreH23 : (output_increment_pre = (dw_out_increment (D)))) (PreH24 : (input_offset_pre = (dw_offset (D)))) (PreH25 : (input_pixel_stride_pre = (dw_pixel_stride (D)))) (PreH26 : (zero_pre = (dw_zero_ptr (D)))) (PreH27 : (dw_valid F P W1 D )) (PreH28 : (dw_valid F P W2 (dw_rebase (D) (out2)) )) (PreH29 : (dw_distinct W1 )) (PreH30 : (dw_distinct W2 )) (PreH31 : (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min") )) (PreH32 : (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max") )) (PreH33 : (dw_same lo (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min"))) )) (PreH34 : (dw_same hi (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max"))) )) ,
  (dw_data F )
  **  (dw_ptr_data P )
  **  (dw_output W1 (dw_neon_result (F) (P) (D) (lo) (hi) (O1)) )
  **  ((( &( "channels" ) )) # UInt64  |-> channels_pre)
  **  ((( &( "output_width" ) )) # UInt64  |-> output_width_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "weights" ) )) # Ptr  |-> weights_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  ((( &( "input_stride" ) )) # Int64  |-> input_stride_pre)
  **  ((( &( "output_increment" ) )) # UInt64  |-> output_increment_pre)
  **  ((( &( "input_offset" ) )) # UInt64  |-> input_offset_pre)
  **  ((( &( "input_pixel_stride" ) )) # UInt64  |-> input_pixel_stride_pre)
  **  ((( &( "zero" ) )) # Ptr  |-> zero_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (dw_output W2 O2 )
|--
  “ (right_pre = (dw_out ((dw_rebase (D) (right_pre))))) ”
.

Definition equivalent_partial_solve_wit_2_pure_split_goal_17 := 
forall (params_pre: Z) (zero_pre: Z) (input_pixel_stride_pre: Z) (input_offset_pre: Z) (output_increment_pre: Z) (input_stride_pre: Z) (right_pre: Z) (left_pre: Z) (weights_pre: Z) (input_pre: Z) (output_width_pre: Z) (channels_pre: Z) (hi: fp32) (lo: fp32) (O2: DwOutput) (O1: DwOutput) (W2: (@list Z)) (W1: (@list Z)) (out2: Z) (P: DwPtrMap) (F: DwROMap) (D: DwProgram) (PreH1 : (input_pixel_stride_pre <= UINT64_MAX)) (PreH2 : (input_offset_pre <= UINT64_MAX)) (PreH3 : (output_increment_pre <= UINT64_MAX)) (PreH4 : (output_width_pre <= UINT64_MAX)) (PreH5 : (channels_pre <= UINT64_MAX)) (PreH6 : (input_pixel_stride_pre >= 0)) (PreH7 : (input_offset_pre >= 0)) (PreH8 : (output_increment_pre >= 0)) (PreH9 : (output_width_pre >= 0)) (PreH10 : (channels_pre >= 0)) (PreH11 : (input_stride_pre <= INT64_MAX)) (PreH12 : (input_stride_pre >= INT64_MIN)) (PreH13 : (params_pre <> 0)) (PreH14 : (channels_pre > 0)) (PreH15 : (output_width_pre > 0)) (PreH16 : (channels_pre = (dw_channels (D)))) (PreH17 : (output_width_pre = (dw_width (D)))) (PreH18 : (input_pre = (dw_input (D)))) (PreH19 : (weights_pre = (dw_weights (D)))) (PreH20 : (left_pre = (dw_out (D)))) (PreH21 : (right_pre = out2)) (PreH22 : (input_stride_pre = (dw_input_stride (D)))) (PreH23 : (output_increment_pre = (dw_out_increment (D)))) (PreH24 : (input_offset_pre = (dw_offset (D)))) (PreH25 : (input_pixel_stride_pre = (dw_pixel_stride (D)))) (PreH26 : (zero_pre = (dw_zero_ptr (D)))) (PreH27 : (dw_valid F P W1 D )) (PreH28 : (dw_valid F P W2 (dw_rebase (D) (out2)) )) (PreH29 : (dw_distinct W1 )) (PreH30 : (dw_distinct W2 )) (PreH31 : (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min") )) (PreH32 : (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max") )) (PreH33 : (dw_same lo (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min"))) )) (PreH34 : (dw_same hi (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max"))) )) ,
  (dw_data F )
  **  (dw_ptr_data P )
  **  (dw_output W1 (dw_neon_result (F) (P) (D) (lo) (hi) (O1)) )
  **  ((( &( "channels" ) )) # UInt64  |-> channels_pre)
  **  ((( &( "output_width" ) )) # UInt64  |-> output_width_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "weights" ) )) # Ptr  |-> weights_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  ((( &( "input_stride" ) )) # Int64  |-> input_stride_pre)
  **  ((( &( "output_increment" ) )) # UInt64  |-> output_increment_pre)
  **  ((( &( "input_offset" ) )) # UInt64  |-> input_offset_pre)
  **  ((( &( "input_pixel_stride" ) )) # UInt64  |-> input_pixel_stride_pre)
  **  ((( &( "zero" ) )) # Ptr  |-> zero_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (dw_output W2 O2 )
|--
  “ (weights_pre = (dw_weights ((dw_rebase (D) (right_pre))))) ”
.

Definition equivalent_partial_solve_wit_2_pure_split_goal_18 := 
forall (params_pre: Z) (zero_pre: Z) (input_pixel_stride_pre: Z) (input_offset_pre: Z) (output_increment_pre: Z) (input_stride_pre: Z) (right_pre: Z) (left_pre: Z) (weights_pre: Z) (input_pre: Z) (output_width_pre: Z) (channels_pre: Z) (hi: fp32) (lo: fp32) (O2: DwOutput) (O1: DwOutput) (W2: (@list Z)) (W1: (@list Z)) (out2: Z) (P: DwPtrMap) (F: DwROMap) (D: DwProgram) (PreH1 : (input_pixel_stride_pre <= UINT64_MAX)) (PreH2 : (input_offset_pre <= UINT64_MAX)) (PreH3 : (output_increment_pre <= UINT64_MAX)) (PreH4 : (output_width_pre <= UINT64_MAX)) (PreH5 : (channels_pre <= UINT64_MAX)) (PreH6 : (input_pixel_stride_pre >= 0)) (PreH7 : (input_offset_pre >= 0)) (PreH8 : (output_increment_pre >= 0)) (PreH9 : (output_width_pre >= 0)) (PreH10 : (channels_pre >= 0)) (PreH11 : (input_stride_pre <= INT64_MAX)) (PreH12 : (input_stride_pre >= INT64_MIN)) (PreH13 : (params_pre <> 0)) (PreH14 : (channels_pre > 0)) (PreH15 : (output_width_pre > 0)) (PreH16 : (channels_pre = (dw_channels (D)))) (PreH17 : (output_width_pre = (dw_width (D)))) (PreH18 : (input_pre = (dw_input (D)))) (PreH19 : (weights_pre = (dw_weights (D)))) (PreH20 : (left_pre = (dw_out (D)))) (PreH21 : (right_pre = out2)) (PreH22 : (input_stride_pre = (dw_input_stride (D)))) (PreH23 : (output_increment_pre = (dw_out_increment (D)))) (PreH24 : (input_offset_pre = (dw_offset (D)))) (PreH25 : (input_pixel_stride_pre = (dw_pixel_stride (D)))) (PreH26 : (zero_pre = (dw_zero_ptr (D)))) (PreH27 : (dw_valid F P W1 D )) (PreH28 : (dw_valid F P W2 (dw_rebase (D) (out2)) )) (PreH29 : (dw_distinct W1 )) (PreH30 : (dw_distinct W2 )) (PreH31 : (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min") )) (PreH32 : (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max") )) (PreH33 : (dw_same lo (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min"))) )) (PreH34 : (dw_same hi (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max"))) )) ,
  (dw_data F )
  **  (dw_ptr_data P )
  **  (dw_output W1 (dw_neon_result (F) (P) (D) (lo) (hi) (O1)) )
  **  ((( &( "channels" ) )) # UInt64  |-> channels_pre)
  **  ((( &( "output_width" ) )) # UInt64  |-> output_width_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "weights" ) )) # Ptr  |-> weights_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  ((( &( "input_stride" ) )) # Int64  |-> input_stride_pre)
  **  ((( &( "output_increment" ) )) # UInt64  |-> output_increment_pre)
  **  ((( &( "input_offset" ) )) # UInt64  |-> input_offset_pre)
  **  ((( &( "input_pixel_stride" ) )) # UInt64  |-> input_pixel_stride_pre)
  **  ((( &( "zero" ) )) # Ptr  |-> zero_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (dw_output W2 O2 )
|--
  “ (input_pre = (dw_input ((dw_rebase (D) (right_pre))))) ”
.

Definition equivalent_partial_solve_wit_2_pure_split_goal_19 := 
forall (params_pre: Z) (zero_pre: Z) (input_pixel_stride_pre: Z) (input_offset_pre: Z) (output_increment_pre: Z) (input_stride_pre: Z) (right_pre: Z) (left_pre: Z) (weights_pre: Z) (input_pre: Z) (output_width_pre: Z) (channels_pre: Z) (hi: fp32) (lo: fp32) (O2: DwOutput) (O1: DwOutput) (W2: (@list Z)) (W1: (@list Z)) (out2: Z) (P: DwPtrMap) (F: DwROMap) (D: DwProgram) (PreH1 : (input_pixel_stride_pre <= UINT64_MAX)) (PreH2 : (input_offset_pre <= UINT64_MAX)) (PreH3 : (output_increment_pre <= UINT64_MAX)) (PreH4 : (output_width_pre <= UINT64_MAX)) (PreH5 : (channels_pre <= UINT64_MAX)) (PreH6 : (input_pixel_stride_pre >= 0)) (PreH7 : (input_offset_pre >= 0)) (PreH8 : (output_increment_pre >= 0)) (PreH9 : (output_width_pre >= 0)) (PreH10 : (channels_pre >= 0)) (PreH11 : (input_stride_pre <= INT64_MAX)) (PreH12 : (input_stride_pre >= INT64_MIN)) (PreH13 : (params_pre <> 0)) (PreH14 : (channels_pre > 0)) (PreH15 : (output_width_pre > 0)) (PreH16 : (channels_pre = (dw_channels (D)))) (PreH17 : (output_width_pre = (dw_width (D)))) (PreH18 : (input_pre = (dw_input (D)))) (PreH19 : (weights_pre = (dw_weights (D)))) (PreH20 : (left_pre = (dw_out (D)))) (PreH21 : (right_pre = out2)) (PreH22 : (input_stride_pre = (dw_input_stride (D)))) (PreH23 : (output_increment_pre = (dw_out_increment (D)))) (PreH24 : (input_offset_pre = (dw_offset (D)))) (PreH25 : (input_pixel_stride_pre = (dw_pixel_stride (D)))) (PreH26 : (zero_pre = (dw_zero_ptr (D)))) (PreH27 : (dw_valid F P W1 D )) (PreH28 : (dw_valid F P W2 (dw_rebase (D) (out2)) )) (PreH29 : (dw_distinct W1 )) (PreH30 : (dw_distinct W2 )) (PreH31 : (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min") )) (PreH32 : (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max") )) (PreH33 : (dw_same lo (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min"))) )) (PreH34 : (dw_same hi (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max"))) )) ,
  (dw_data F )
  **  (dw_ptr_data P )
  **  (dw_output W1 (dw_neon_result (F) (P) (D) (lo) (hi) (O1)) )
  **  ((( &( "channels" ) )) # UInt64  |-> channels_pre)
  **  ((( &( "output_width" ) )) # UInt64  |-> output_width_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "weights" ) )) # Ptr  |-> weights_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  ((( &( "input_stride" ) )) # Int64  |-> input_stride_pre)
  **  ((( &( "output_increment" ) )) # UInt64  |-> output_increment_pre)
  **  ((( &( "input_offset" ) )) # UInt64  |-> input_offset_pre)
  **  ((( &( "input_pixel_stride" ) )) # UInt64  |-> input_pixel_stride_pre)
  **  ((( &( "zero" ) )) # Ptr  |-> zero_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (dw_output W2 O2 )
|--
  “ (output_width_pre = (dw_width ((dw_rebase (D) (right_pre))))) ”
.

Definition equivalent_partial_solve_wit_2_pure_split_goal_20 := 
forall (params_pre: Z) (zero_pre: Z) (input_pixel_stride_pre: Z) (input_offset_pre: Z) (output_increment_pre: Z) (input_stride_pre: Z) (right_pre: Z) (left_pre: Z) (weights_pre: Z) (input_pre: Z) (output_width_pre: Z) (channels_pre: Z) (hi: fp32) (lo: fp32) (O2: DwOutput) (O1: DwOutput) (W2: (@list Z)) (W1: (@list Z)) (out2: Z) (P: DwPtrMap) (F: DwROMap) (D: DwProgram) (PreH1 : (input_pixel_stride_pre <= UINT64_MAX)) (PreH2 : (input_offset_pre <= UINT64_MAX)) (PreH3 : (output_increment_pre <= UINT64_MAX)) (PreH4 : (output_width_pre <= UINT64_MAX)) (PreH5 : (channels_pre <= UINT64_MAX)) (PreH6 : (input_pixel_stride_pre >= 0)) (PreH7 : (input_offset_pre >= 0)) (PreH8 : (output_increment_pre >= 0)) (PreH9 : (output_width_pre >= 0)) (PreH10 : (channels_pre >= 0)) (PreH11 : (input_stride_pre <= INT64_MAX)) (PreH12 : (input_stride_pre >= INT64_MIN)) (PreH13 : (params_pre <> 0)) (PreH14 : (channels_pre > 0)) (PreH15 : (output_width_pre > 0)) (PreH16 : (channels_pre = (dw_channels (D)))) (PreH17 : (output_width_pre = (dw_width (D)))) (PreH18 : (input_pre = (dw_input (D)))) (PreH19 : (weights_pre = (dw_weights (D)))) (PreH20 : (left_pre = (dw_out (D)))) (PreH21 : (right_pre = out2)) (PreH22 : (input_stride_pre = (dw_input_stride (D)))) (PreH23 : (output_increment_pre = (dw_out_increment (D)))) (PreH24 : (input_offset_pre = (dw_offset (D)))) (PreH25 : (input_pixel_stride_pre = (dw_pixel_stride (D)))) (PreH26 : (zero_pre = (dw_zero_ptr (D)))) (PreH27 : (dw_valid F P W1 D )) (PreH28 : (dw_valid F P W2 (dw_rebase (D) (out2)) )) (PreH29 : (dw_distinct W1 )) (PreH30 : (dw_distinct W2 )) (PreH31 : (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min") )) (PreH32 : (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max") )) (PreH33 : (dw_same lo (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min"))) )) (PreH34 : (dw_same hi (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max"))) )) ,
  (dw_data F )
  **  (dw_ptr_data P )
  **  (dw_output W1 (dw_neon_result (F) (P) (D) (lo) (hi) (O1)) )
  **  ((( &( "channels" ) )) # UInt64  |-> channels_pre)
  **  ((( &( "output_width" ) )) # UInt64  |-> output_width_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "weights" ) )) # Ptr  |-> weights_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  ((( &( "input_stride" ) )) # Int64  |-> input_stride_pre)
  **  ((( &( "output_increment" ) )) # UInt64  |-> output_increment_pre)
  **  ((( &( "input_offset" ) )) # UInt64  |-> input_offset_pre)
  **  ((( &( "input_pixel_stride" ) )) # UInt64  |-> input_pixel_stride_pre)
  **  ((( &( "zero" ) )) # Ptr  |-> zero_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (dw_output W2 O2 )
|--
  “ (channels_pre = (dw_channels ((dw_rebase (D) (right_pre))))) ”
.

Definition equivalent_partial_solve_wit_2_aux := 
forall (params_pre: Z) (zero_pre: Z) (input_pixel_stride_pre: Z) (input_offset_pre: Z) (output_increment_pre: Z) (input_stride_pre: Z) (right_pre: Z) (left_pre: Z) (weights_pre: Z) (input_pre: Z) (output_width_pre: Z) (channels_pre: Z) (hi: fp32) (lo: fp32) (O2: DwOutput) (O1: DwOutput) (W2: (@list Z)) (W1: (@list Z)) (out2: Z) (P: DwPtrMap) (F: DwROMap) (D: DwProgram) (PreH1 : (params_pre <> 0)) (PreH2 : (channels_pre > 0)) (PreH3 : (output_width_pre > 0)) (PreH4 : (channels_pre = (dw_channels (D)))) (PreH5 : (output_width_pre = (dw_width (D)))) (PreH6 : (input_pre = (dw_input (D)))) (PreH7 : (weights_pre = (dw_weights (D)))) (PreH8 : (left_pre = (dw_out (D)))) (PreH9 : (right_pre = out2)) (PreH10 : (input_stride_pre = (dw_input_stride (D)))) (PreH11 : (output_increment_pre = (dw_out_increment (D)))) (PreH12 : (input_offset_pre = (dw_offset (D)))) (PreH13 : (input_pixel_stride_pre = (dw_pixel_stride (D)))) (PreH14 : (zero_pre = (dw_zero_ptr (D)))) (PreH15 : (dw_valid F P W1 D )) (PreH16 : (dw_valid F P W2 (dw_rebase (D) (out2)) )) (PreH17 : (dw_distinct W1 )) (PreH18 : (dw_distinct W2 )) (PreH19 : (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min") )) (PreH20 : (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max") )) (PreH21 : (dw_same lo (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min"))) )) (PreH22 : (dw_same hi (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max"))) )) ,
  (dw_data F )
  **  (dw_ptr_data P )
  **  (dw_output W1 (dw_neon_result (F) (P) (D) (lo) (hi) (O1)) )
  **  (dw_output W2 O2 )
|--
  “ (params_pre <> 0) ” 
  &&  “ (channels_pre > 0) ” 
  &&  “ (output_width_pre > 0) ” 
  &&  “ (channels_pre = (dw_channels ((dw_rebase (D) (out2))))) ” 
  &&  “ (output_width_pre = (dw_width ((dw_rebase (D) (out2))))) ” 
  &&  “ (input_pre = (dw_input ((dw_rebase (D) (out2))))) ” 
  &&  “ (weights_pre = (dw_weights ((dw_rebase (D) (out2))))) ” 
  &&  “ (right_pre = (dw_out ((dw_rebase (D) (out2))))) ” 
  &&  “ (input_stride_pre = (dw_input_stride ((dw_rebase (D) (out2))))) ” 
  &&  “ (output_increment_pre = (dw_out_increment ((dw_rebase (D) (out2))))) ” 
  &&  “ (input_offset_pre = (dw_offset ((dw_rebase (D) (out2))))) ” 
  &&  “ (input_pixel_stride_pre = (dw_pixel_stride ((dw_rebase (D) (out2))))) ” 
  &&  “ (zero_pre = (dw_zero_ptr ((dw_rebase (D) (out2))))) ” 
  &&  “ (dw_valid F P W2 (dw_rebase (D) (out2)) ) ” 
  &&  “ (dw_distinct W2 ) ” 
  &&  “ (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min") ) ” 
  &&  “ (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max") ) ” 
  &&  “ (dw_same lo (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min"))) ) ” 
  &&  “ (dw_same hi (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max"))) ) ” 
  &&  “ (zero_pre = (dw_zero_ptr ((dw_rebase (D) (right_pre))))) ” 
  &&  “ (input_pixel_stride_pre = (dw_pixel_stride ((dw_rebase (D) (right_pre))))) ” 
  &&  “ (input_offset_pre = (dw_offset ((dw_rebase (D) (right_pre))))) ” 
  &&  “ (output_increment_pre = (dw_out_increment ((dw_rebase (D) (right_pre))))) ” 
  &&  “ (input_stride_pre = (dw_input_stride ((dw_rebase (D) (right_pre))))) ” 
  &&  “ (right_pre = (dw_out ((dw_rebase (D) (right_pre))))) ” 
  &&  “ (weights_pre = (dw_weights ((dw_rebase (D) (right_pre))))) ” 
  &&  “ (input_pre = (dw_input ((dw_rebase (D) (right_pre))))) ” 
  &&  “ (output_width_pre = (dw_width ((dw_rebase (D) (right_pre))))) ” 
  &&  “ (channels_pre = (dw_channels ((dw_rebase (D) (right_pre))))) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (channels_pre > 0) ” 
  &&  “ (output_width_pre > 0) ” 
  &&  “ (channels_pre = (dw_channels (D))) ” 
  &&  “ (output_width_pre = (dw_width (D))) ” 
  &&  “ (input_pre = (dw_input (D))) ” 
  &&  “ (weights_pre = (dw_weights (D))) ” 
  &&  “ (left_pre = (dw_out (D))) ” 
  &&  “ (right_pre = out2) ” 
  &&  “ (input_stride_pre = (dw_input_stride (D))) ” 
  &&  “ (output_increment_pre = (dw_out_increment (D))) ” 
  &&  “ (input_offset_pre = (dw_offset (D))) ” 
  &&  “ (input_pixel_stride_pre = (dw_pixel_stride (D))) ” 
  &&  “ (zero_pre = (dw_zero_ptr (D))) ” 
  &&  “ (dw_valid F P W1 D ) ” 
  &&  “ (dw_valid F P W2 (dw_rebase (D) (out2)) ) ” 
  &&  “ (dw_distinct W1 ) ” 
  &&  “ (dw_distinct W2 ) ” 
  &&  “ (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min") ) ” 
  &&  “ (dw_present F &((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max") ) ” 
  &&  “ (dw_same lo (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min"))) ) ” 
  &&  “ (dw_same hi (dw_get (F) (&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max"))) ) ”
  &&  (dw_data F )
  **  (dw_ptr_data P )
  **  (dw_output W2 O2 )
  **  (dw_output W1 (dw_neon_result (F) (P) (D) (lo) (hi) (O1)) )
.

Definition equivalent_partial_solve_wit_2 := equivalent_partial_solve_wit_2_pure -> equivalent_partial_solve_wit_2_aux.

Definition equivalent_partial_solve_wit_3_pure := 
forall (hi: fp32) (lo: fp32) (O2: DwOutput) (O1: DwOutput) (W2: (@list Z)) (W1: (@list Z)) (out2: Z) (P: DwPtrMap) (F: DwROMap) (D: DwProgram) (params: Z) (channels: Z) (output_width: Z) (input: Z) (weights: Z) (left: Z) (input_stride: Z) (output_increment: Z) (input_offset: Z) (input_pixel_stride: Z) (zero: Z) (PreH1 : (params <> 0)) (PreH2 : (channels > 0)) (PreH3 : (output_width > 0)) (PreH4 : (channels = (dw_channels (D)))) (PreH5 : (output_width = (dw_width (D)))) (PreH6 : (input = (dw_input (D)))) (PreH7 : (weights = (dw_weights (D)))) (PreH8 : (left = (dw_out (D)))) (PreH9 : (input_stride = (dw_input_stride (D)))) (PreH10 : (output_increment = (dw_out_increment (D)))) (PreH11 : (input_offset = (dw_offset (D)))) (PreH12 : (input_pixel_stride = (dw_pixel_stride (D)))) (PreH13 : (zero = (dw_zero_ptr (D)))) (PreH14 : (dw_valid F P W1 D )) (PreH15 : (dw_valid F P W2 (dw_rebase (D) (out2)) )) (PreH16 : (dw_distinct W1 )) (PreH17 : (dw_distinct W2 )) (PreH18 : (dw_present F &((params)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min") )) (PreH19 : (dw_present F &((params)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max") )) (PreH20 : (dw_same lo (dw_get (F) (&((params)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min"))) )) (PreH21 : (dw_same hi (dw_get (F) (&((params)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max"))) )) (PreH22 : (dw_output_domain W1 D )) (PreH23 : (dw_output_domain W2 (dw_rebase (D) (out2)) )) (PreH24 : (dw_pair_observed D out2 (dw_neon_result (F) (P) (D) (lo) (hi) (O1)) (dw_rvv_result (F) (P) ((dw_rebase (D) (out2))) (lo) (hi) (O2)) )) ,
  ((( &( "params" ) )) # Ptr  |-> params)
  **  ((( &( "channels" ) )) # UInt64  |-> channels)
  **  ((( &( "output_width" ) )) # UInt64  |-> output_width)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "weights" ) )) # Ptr  |-> weights)
  **  ((( &( "left" ) )) # Ptr  |-> left)
  **  ((( &( "right" ) )) # Ptr  |-> out2)
  **  ((( &( "input_stride" ) )) # Int64  |-> input_stride)
  **  ((( &( "output_increment" ) )) # UInt64  |-> output_increment)
  **  ((( &( "input_offset" ) )) # UInt64  |-> input_offset)
  **  ((( &( "input_pixel_stride" ) )) # UInt64  |-> input_pixel_stride)
  **  ((( &( "zero" ) )) # Ptr  |-> zero)
  **  (dw_data F )
  **  (dw_ptr_data P )
  **  (dw_output W1 (dw_neon_result (F) (P) (D) (lo) (hi) (O1)) )
  **  (dw_output W2 (dw_rvv_result (F) (P) ((dw_rebase (D) (out2))) (lo) (hi) (O2)) )
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
  &&  “ (dw_pair_observed D out2 (dw_neon_result (F) (P) (D) (lo) (hi) (O1)) (dw_rvv_result (F) (P) ((dw_rebase (D) (out2))) (lo) (hi) (O2)) ) ” 
  &&  “ (left = (dw_out (D))) ” 
  &&  “ (out2 = out2) ”
.

Definition equivalent_partial_solve_wit_3_aux := 
forall (hi: fp32) (lo: fp32) (O2: DwOutput) (O1: DwOutput) (W2: (@list Z)) (W1: (@list Z)) (out2: Z) (P: DwPtrMap) (F: DwROMap) (D: DwProgram) (params: Z) (channels: Z) (output_width: Z) (input: Z) (weights: Z) (left: Z) (input_stride: Z) (output_increment: Z) (input_offset: Z) (input_pixel_stride: Z) (zero: Z) (PreH1 : (params <> 0)) (PreH2 : (channels > 0)) (PreH3 : (output_width > 0)) (PreH4 : (channels = (dw_channels (D)))) (PreH5 : (output_width = (dw_width (D)))) (PreH6 : (input = (dw_input (D)))) (PreH7 : (weights = (dw_weights (D)))) (PreH8 : (left = (dw_out (D)))) (PreH9 : (input_stride = (dw_input_stride (D)))) (PreH10 : (output_increment = (dw_out_increment (D)))) (PreH11 : (input_offset = (dw_offset (D)))) (PreH12 : (input_pixel_stride = (dw_pixel_stride (D)))) (PreH13 : (zero = (dw_zero_ptr (D)))) (PreH14 : (dw_valid F P W1 D )) (PreH15 : (dw_valid F P W2 (dw_rebase (D) (out2)) )) (PreH16 : (dw_distinct W1 )) (PreH17 : (dw_distinct W2 )) (PreH18 : (dw_present F &((params)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min") )) (PreH19 : (dw_present F &((params)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max") )) (PreH20 : (dw_same lo (dw_get (F) (&((params)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min"))) )) (PreH21 : (dw_same hi (dw_get (F) (&((params)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max"))) )) (PreH22 : (dw_output_domain W1 D )) (PreH23 : (dw_output_domain W2 (dw_rebase (D) (out2)) )) (PreH24 : (dw_pair_observed D out2 (dw_neon_result (F) (P) (D) (lo) (hi) (O1)) (dw_rvv_result (F) (P) ((dw_rebase (D) (out2))) (lo) (hi) (O2)) )) ,
  (dw_data F )
  **  (dw_ptr_data P )
  **  (dw_output W1 (dw_neon_result (F) (P) (D) (lo) (hi) (O1)) )
  **  (dw_output W2 (dw_rvv_result (F) (P) ((dw_rebase (D) (out2))) (lo) (hi) (O2)) )
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
  &&  “ (dw_pair_observed D out2 (dw_neon_result (F) (P) (D) (lo) (hi) (O1)) (dw_rvv_result (F) (P) ((dw_rebase (D) (out2))) (lo) (hi) (O2)) ) ” 
  &&  “ (left = (dw_out (D))) ” 
  &&  “ (out2 = out2) ” 
  &&  “ (params <> 0) ” 
  &&  “ (channels > 0) ” 
  &&  “ (output_width > 0) ” 
  &&  “ (channels = (dw_channels (D))) ” 
  &&  “ (output_width = (dw_width (D))) ” 
  &&  “ (input = (dw_input (D))) ” 
  &&  “ (weights = (dw_weights (D))) ” 
  &&  “ (left = (dw_out (D))) ” 
  &&  “ (input_stride = (dw_input_stride (D))) ” 
  &&  “ (output_increment = (dw_out_increment (D))) ” 
  &&  “ (input_offset = (dw_offset (D))) ” 
  &&  “ (input_pixel_stride = (dw_pixel_stride (D))) ” 
  &&  “ (zero = (dw_zero_ptr (D))) ” 
  &&  “ (dw_valid F P W1 D ) ” 
  &&  “ (dw_valid F P W2 (dw_rebase (D) (out2)) ) ” 
  &&  “ (dw_distinct W1 ) ” 
  &&  “ (dw_distinct W2 ) ” 
  &&  “ (dw_present F &((params)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min") ) ” 
  &&  “ (dw_present F &((params)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max") ) ” 
  &&  “ (dw_same lo (dw_get (F) (&((params)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min"))) ) ” 
  &&  “ (dw_same hi (dw_get (F) (&((params)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max"))) ) ” 
  &&  “ (dw_output_domain W1 D ) ” 
  &&  “ (dw_output_domain W2 (dw_rebase (D) (out2)) ) ” 
  &&  “ (dw_pair_observed D out2 (dw_neon_result (F) (P) (D) (lo) (hi) (O1)) (dw_rvv_result (F) (P) ((dw_rebase (D) (out2))) (lo) (hi) (O2)) ) ”
  &&  (dw_output W1 (dw_neon_result (F) (P) (D) (lo) (hi) (O1)) )
  **  (dw_output W2 (dw_rvv_result (F) (P) ((dw_rebase (D) (out2))) (lo) (hi) (O2)) )
  **  (dw_data F )
  **  (dw_ptr_data P )
.

Definition equivalent_partial_solve_wit_3 := equivalent_partial_solve_wit_3_pure -> equivalent_partial_solve_wit_3_aux.

Module Type VC_Correct.

Include dw_maps_Strategy_Correct.

Axiom proof_of_equivalent_entail_wit_1 : equivalent_entail_wit_1.
Axiom proof_of_equivalent_return_wit_1 : equivalent_return_wit_1.
Axiom proof_of_equivalent_partial_solve_wit_1_pure : equivalent_partial_solve_wit_1_pure.
Axiom proof_of_equivalent_partial_solve_wit_1 : equivalent_partial_solve_wit_1.
Axiom proof_of_equivalent_partial_solve_wit_2_pure : equivalent_partial_solve_wit_2_pure.
Axiom proof_of_equivalent_partial_solve_wit_2 : equivalent_partial_solve_wit_2.
Axiom proof_of_equivalent_partial_solve_wit_3_pure : equivalent_partial_solve_wit_3_pure.
Axiom proof_of_equivalent_partial_solve_wit_3 : equivalent_partial_solve_wit_3.

End VC_Correct.
