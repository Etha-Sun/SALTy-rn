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
Require Import MaxPool.Model.
Require Import MaxPool.Types.
Require Import MaxPool.CompareTypes.
Require Import MaxPool.MemoryModel MaxPool.MemoryViews MaxPool.PackModel.
Require Import MaxPool.CompareModel.
Require Import MaxPool.ContractModel.
Require Import MaxPool.TraceLookup.
Require Import MaxPool.CompareModel.
Local Open Scope sac.

(*----- Function compare_maxpool_written -----*)

Definition compare_maxpool_written_safety_wit_1 := 
forall (probe_pre: Z) (params_pre: Z) (output_increment_pre: Z) (input_increment_pre: Z) (output_pre: Z) (input_pixel_stride_pre: Z) (input_offset_pre: Z) (input_pre: Z) (channels_pre: Z) (kernel_elements_pre: Z) (output_pixels_pre: Z) (hi: fp32) (lo: fp32) (old: MPOutput) (W: (@list Z)) (PT: MPPtrMap) (F: MPFloatMap) (retval: Z) (retval_2: Z) (PreH1 : (retval <> retval_2)) (PreH2 : (retval_2 = (bits_of_fp32 ((mp_probe_value (F) (PT) (output_pixels_pre) (kernel_elements_pre) (channels_pre) (input_pre) (input_offset_pre) (input_pixel_stride_pre) (input_increment_pre) (output_pre) (output_increment_pre) (lo) (hi) (probe_pre)))))) (PreH3 : (retval = (bits_of_fp32 ((mp_probe_value (F) (PT) (output_pixels_pre) (kernel_elements_pre) (channels_pre) (input_pre) (input_offset_pre) (input_pixel_stride_pre) (input_increment_pre) (output_pre) (output_increment_pre) (lo) (hi) (probe_pre)))))) (PreH4 : (mp_written output_pixels_pre channels_pre output_pre output_increment_pre probe_pre )) (PreH5 : (0 < output_pixels_pre)) (PreH6 : (0 < channels_pre)) (PreH7 : (params_pre <> 0)) (PreH8 : (mp_word64 output_pixels_pre )) (PreH9 : (mp_word64 kernel_elements_pre )) (PreH10 : (mp_word64 channels_pre )) (PreH11 : (mp_word64 input_offset_pre )) (PreH12 : (mp_word64 input_pixel_stride_pre )) (PreH13 : (mp_word64 input_increment_pre )) (PreH14 : (mp_word64 output_increment_pre )) (PreH15 : (mp_word64 input_pre )) (PreH16 : (mp_word64 output_pre )) (PreH17 : (mp_word64 params_pre )) (PreH18 : (mp_geometry F PT W output_pixels_pre kernel_elements_pre channels_pre input_pre input_offset_pre input_pixel_stride_pre input_increment_pre output_pre output_increment_pre )) ,
  (mp_out W (mp_complete (F) (PT) ((mp_complete (F) (PT) (old) (output_pixels_pre) (kernel_elements_pre) (channels_pre) (input_pre) (input_offset_pre) (input_pixel_stride_pre) (input_increment_pre) (output_pre) (output_increment_pre) (lo) (hi))) (output_pixels_pre) (kernel_elements_pre) (channels_pre) (input_pre) (input_offset_pre) (input_pixel_stride_pre) (input_increment_pre) (output_pre) (output_increment_pre) (lo) (hi)) )
  **  ((( &( "after" ) )) # UInt  |-> retval_2)
  **  (mp_data F )
  **  (mp_ptr_data PT )
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min")) # Float  |-> lo)
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max")) # Float  |-> hi)
  **  ((( &( "before" ) )) # UInt  |-> retval)
  **  ((( &( "output_pixels" ) )) # UInt64  |-> output_pixels_pre)
  **  ((( &( "kernel_elements" ) )) # UInt64  |-> kernel_elements_pre)
  **  ((( &( "channels" ) )) # UInt64  |-> channels_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "input_offset" ) )) # UInt64  |-> input_offset_pre)
  **  ((( &( "input_pixel_stride" ) )) # UInt64  |-> input_pixel_stride_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "input_increment" ) )) # UInt64  |-> input_increment_pre)
  **  ((( &( "output_increment" ) )) # UInt64  |-> output_increment_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "probe" ) )) # Ptr  |-> probe_pre)
|--
  “ False ”
.

Definition compare_maxpool_written_return_wit_1 := 
forall (probe_pre: Z) (params_pre: Z) (output_increment_pre: Z) (input_increment_pre: Z) (output_pre: Z) (input_pixel_stride_pre: Z) (input_offset_pre: Z) (input_pre: Z) (channels_pre: Z) (kernel_elements_pre: Z) (output_pixels_pre: Z) (hi: fp32) (lo: fp32) (old: MPOutput) (W: (@list Z)) (PT: MPPtrMap) (F: MPFloatMap) (retval: Z) (retval_2: Z) (PreH1 : (retval = retval_2)) (PreH2 : (retval_2 = (bits_of_fp32 ((mp_probe_value (F) (PT) (output_pixels_pre) (kernel_elements_pre) (channels_pre) (input_pre) (input_offset_pre) (input_pixel_stride_pre) (input_increment_pre) (output_pre) (output_increment_pre) (lo) (hi) (probe_pre)))))) (PreH3 : (retval = (bits_of_fp32 ((mp_probe_value (F) (PT) (output_pixels_pre) (kernel_elements_pre) (channels_pre) (input_pre) (input_offset_pre) (input_pixel_stride_pre) (input_increment_pre) (output_pre) (output_increment_pre) (lo) (hi) (probe_pre)))))) (PreH4 : (mp_written output_pixels_pre channels_pre output_pre output_increment_pre probe_pre )) (PreH5 : (0 < output_pixels_pre)) (PreH6 : (0 < channels_pre)) (PreH7 : (params_pre <> 0)) (PreH8 : (mp_word64 output_pixels_pre )) (PreH9 : (mp_word64 kernel_elements_pre )) (PreH10 : (mp_word64 channels_pre )) (PreH11 : (mp_word64 input_offset_pre )) (PreH12 : (mp_word64 input_pixel_stride_pre )) (PreH13 : (mp_word64 input_increment_pre )) (PreH14 : (mp_word64 output_increment_pre )) (PreH15 : (mp_word64 input_pre )) (PreH16 : (mp_word64 output_pre )) (PreH17 : (mp_word64 params_pre )) (PreH18 : (mp_geometry F PT W output_pixels_pre kernel_elements_pre channels_pre input_pre input_offset_pre input_pixel_stride_pre input_increment_pre output_pre output_increment_pre )) ,
  (mp_out W (mp_complete (F) (PT) ((mp_complete (F) (PT) (old) (output_pixels_pre) (kernel_elements_pre) (channels_pre) (input_pre) (input_offset_pre) (input_pixel_stride_pre) (input_increment_pre) (output_pre) (output_increment_pre) (lo) (hi))) (output_pixels_pre) (kernel_elements_pre) (channels_pre) (input_pre) (input_offset_pre) (input_pixel_stride_pre) (input_increment_pre) (output_pre) (output_increment_pre) (lo) (hi)) )
  **  (mp_data F )
  **  (mp_ptr_data PT )
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min")) # Float  |-> lo)
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max")) # Float  |-> hi)
|--
  “ (1 = 1) ”
  &&  (mp_data F )
  **  (mp_ptr_data PT )
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min")) # Float  |-> lo)
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max")) # Float  |-> hi)
  **  (mp_out W (mp_complete (F) (PT) ((mp_complete (F) (PT) (old) (output_pixels_pre) (kernel_elements_pre) (channels_pre) (input_pre) (input_offset_pre) (input_pixel_stride_pre) (input_increment_pre) (output_pre) (output_increment_pre) (lo) (hi))) (output_pixels_pre) (kernel_elements_pre) (channels_pre) (input_pre) (input_offset_pre) (input_pixel_stride_pre) (input_increment_pre) (output_pre) (output_increment_pre) (lo) (hi)) )
.

Definition compare_maxpool_written_partial_solve_wit_1_pure := 
forall (probe_pre: Z) (params_pre: Z) (output_increment_pre: Z) (input_increment_pre: Z) (output_pre: Z) (input_pixel_stride_pre: Z) (input_offset_pre: Z) (input_pre: Z) (channels_pre: Z) (kernel_elements_pre: Z) (output_pixels_pre: Z) (hi: fp32) (lo: fp32) (old: MPOutput) (W: (@list Z)) (PT: MPPtrMap) (F: MPFloatMap) (PreH1 : (mp_written output_pixels_pre channels_pre output_pre output_increment_pre probe_pre )) (PreH2 : (0 < output_pixels_pre)) (PreH3 : (0 < channels_pre)) (PreH4 : (params_pre <> 0)) (PreH5 : (mp_word64 output_pixels_pre )) (PreH6 : (mp_word64 kernel_elements_pre )) (PreH7 : (mp_word64 channels_pre )) (PreH8 : (mp_word64 input_offset_pre )) (PreH9 : (mp_word64 input_pixel_stride_pre )) (PreH10 : (mp_word64 input_increment_pre )) (PreH11 : (mp_word64 output_increment_pre )) (PreH12 : (mp_word64 input_pre )) (PreH13 : (mp_word64 output_pre )) (PreH14 : (mp_word64 params_pre )) (PreH15 : (mp_geometry F PT W output_pixels_pre kernel_elements_pre channels_pre input_pre input_offset_pre input_pixel_stride_pre input_increment_pre output_pre output_increment_pre )) ,
  ((( &( "output_pixels" ) )) # UInt64  |-> output_pixels_pre)
  **  ((( &( "kernel_elements" ) )) # UInt64  |-> kernel_elements_pre)
  **  ((( &( "channels" ) )) # UInt64  |-> channels_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "input_offset" ) )) # UInt64  |-> input_offset_pre)
  **  ((( &( "input_pixel_stride" ) )) # UInt64  |-> input_pixel_stride_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "input_increment" ) )) # UInt64  |-> input_increment_pre)
  **  ((( &( "output_increment" ) )) # UInt64  |-> output_increment_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "probe" ) )) # Ptr  |-> probe_pre)
  **  (mp_data F )
  **  (mp_ptr_data PT )
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min")) # Float  |-> lo)
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max")) # Float  |-> hi)
  **  (mp_out W old )
|--
  “ (0 < output_pixels_pre) ” 
  &&  “ (0 < channels_pre) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (mp_word64 output_pixels_pre ) ” 
  &&  “ (mp_word64 kernel_elements_pre ) ” 
  &&  “ (mp_word64 channels_pre ) ” 
  &&  “ (mp_word64 input_offset_pre ) ” 
  &&  “ (mp_word64 input_pixel_stride_pre ) ” 
  &&  “ (mp_word64 input_increment_pre ) ” 
  &&  “ (mp_word64 output_increment_pre ) ” 
  &&  “ (mp_word64 input_pre ) ” 
  &&  “ (mp_word64 output_pre ) ” 
  &&  “ (mp_word64 params_pre ) ” 
  &&  “ (mp_geometry F PT W output_pixels_pre kernel_elements_pre channels_pre input_pre input_offset_pre input_pixel_stride_pre input_increment_pre output_pre output_increment_pre ) ”
.

Definition compare_maxpool_written_partial_solve_wit_1_aux := 
forall (probe_pre: Z) (params_pre: Z) (output_increment_pre: Z) (input_increment_pre: Z) (output_pre: Z) (input_pixel_stride_pre: Z) (input_offset_pre: Z) (input_pre: Z) (channels_pre: Z) (kernel_elements_pre: Z) (output_pixels_pre: Z) (hi: fp32) (lo: fp32) (old: MPOutput) (W: (@list Z)) (PT: MPPtrMap) (F: MPFloatMap) (PreH1 : (mp_written output_pixels_pre channels_pre output_pre output_increment_pre probe_pre )) (PreH2 : (0 < output_pixels_pre)) (PreH3 : (0 < channels_pre)) (PreH4 : (params_pre <> 0)) (PreH5 : (mp_word64 output_pixels_pre )) (PreH6 : (mp_word64 kernel_elements_pre )) (PreH7 : (mp_word64 channels_pre )) (PreH8 : (mp_word64 input_offset_pre )) (PreH9 : (mp_word64 input_pixel_stride_pre )) (PreH10 : (mp_word64 input_increment_pre )) (PreH11 : (mp_word64 output_increment_pre )) (PreH12 : (mp_word64 input_pre )) (PreH13 : (mp_word64 output_pre )) (PreH14 : (mp_word64 params_pre )) (PreH15 : (mp_geometry F PT W output_pixels_pre kernel_elements_pre channels_pre input_pre input_offset_pre input_pixel_stride_pre input_increment_pre output_pre output_increment_pre )) ,
  (mp_data F )
  **  (mp_ptr_data PT )
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min")) # Float  |-> lo)
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max")) # Float  |-> hi)
  **  (mp_out W old )
|--
  “ (0 < output_pixels_pre) ” 
  &&  “ (0 < channels_pre) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (mp_word64 output_pixels_pre ) ” 
  &&  “ (mp_word64 kernel_elements_pre ) ” 
  &&  “ (mp_word64 channels_pre ) ” 
  &&  “ (mp_word64 input_offset_pre ) ” 
  &&  “ (mp_word64 input_pixel_stride_pre ) ” 
  &&  “ (mp_word64 input_increment_pre ) ” 
  &&  “ (mp_word64 output_increment_pre ) ” 
  &&  “ (mp_word64 input_pre ) ” 
  &&  “ (mp_word64 output_pre ) ” 
  &&  “ (mp_word64 params_pre ) ” 
  &&  “ (mp_geometry F PT W output_pixels_pre kernel_elements_pre channels_pre input_pre input_offset_pre input_pixel_stride_pre input_increment_pre output_pre output_increment_pre ) ” 
  &&  “ (mp_written output_pixels_pre channels_pre output_pre output_increment_pre probe_pre ) ” 
  &&  “ (0 < output_pixels_pre) ” 
  &&  “ (0 < channels_pre) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (mp_word64 output_pixels_pre ) ” 
  &&  “ (mp_word64 kernel_elements_pre ) ” 
  &&  “ (mp_word64 channels_pre ) ” 
  &&  “ (mp_word64 input_offset_pre ) ” 
  &&  “ (mp_word64 input_pixel_stride_pre ) ” 
  &&  “ (mp_word64 input_increment_pre ) ” 
  &&  “ (mp_word64 output_increment_pre ) ” 
  &&  “ (mp_word64 input_pre ) ” 
  &&  “ (mp_word64 output_pre ) ” 
  &&  “ (mp_word64 params_pre ) ” 
  &&  “ (mp_geometry F PT W output_pixels_pre kernel_elements_pre channels_pre input_pre input_offset_pre input_pixel_stride_pre input_increment_pre output_pre output_increment_pre ) ”
  &&  (mp_data F )
  **  (mp_ptr_data PT )
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min")) # Float  |-> lo)
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max")) # Float  |-> hi)
  **  (mp_out W old )
.

Definition compare_maxpool_written_partial_solve_wit_1 := compare_maxpool_written_partial_solve_wit_1_pure -> compare_maxpool_written_partial_solve_wit_1_aux.

Definition compare_maxpool_written_partial_solve_wit_2_pure := 
(
forall (probe_pre: Z) (params_pre: Z) (output_increment_pre: Z) (input_increment_pre: Z) (output_pre: Z) (input_pixel_stride_pre: Z) (input_offset_pre: Z) (input_pre: Z) (channels_pre: Z) (kernel_elements_pre: Z) (output_pixels_pre: Z) (hi: fp32) (lo: fp32) (old: MPOutput) (W: (@list Z)) (PT: MPPtrMap) (F: MPFloatMap) (PreH1 : (mp_written output_pixels_pre channels_pre output_pre output_increment_pre probe_pre )) (PreH2 : (0 < output_pixels_pre)) (PreH3 : (0 < channels_pre)) (PreH4 : (params_pre <> 0)) (PreH5 : (mp_word64 output_pixels_pre )) (PreH6 : (mp_word64 kernel_elements_pre )) (PreH7 : (mp_word64 channels_pre )) (PreH8 : (mp_word64 input_offset_pre )) (PreH9 : (mp_word64 input_pixel_stride_pre )) (PreH10 : (mp_word64 input_increment_pre )) (PreH11 : (mp_word64 output_increment_pre )) (PreH12 : (mp_word64 input_pre )) (PreH13 : (mp_word64 output_pre )) (PreH14 : (mp_word64 params_pre )) (PreH15 : (mp_geometry F PT W output_pixels_pre kernel_elements_pre channels_pre input_pre input_offset_pre input_pixel_stride_pre input_increment_pre output_pre output_increment_pre )) ,
  ((( &( "before" ) )) # UInt  |->_)
  **  (mp_data F )
  **  (mp_ptr_data PT )
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min")) # Float  |-> lo)
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max")) # Float  |-> hi)
  **  (mp_out W (mp_complete (F) (PT) (old) (output_pixels_pre) (kernel_elements_pre) (channels_pre) (input_pre) (input_offset_pre) (input_pixel_stride_pre) (input_increment_pre) (output_pre) (output_increment_pre) (lo) (hi)) )
  **  ((( &( "output_pixels" ) )) # UInt64  |-> output_pixels_pre)
  **  ((( &( "kernel_elements" ) )) # UInt64  |-> kernel_elements_pre)
  **  ((( &( "channels" ) )) # UInt64  |-> channels_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "input_offset" ) )) # UInt64  |-> input_offset_pre)
  **  ((( &( "input_pixel_stride" ) )) # UInt64  |-> input_pixel_stride_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "input_increment" ) )) # UInt64  |-> input_increment_pre)
  **  ((( &( "output_increment" ) )) # UInt64  |-> output_increment_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "probe" ) )) # Ptr  |-> probe_pre)
|--
  “ (mp_out_known (mp_complete (F) (PT) (old) (output_pixels_pre) (kernel_elements_pre) (channels_pre) (input_pre) (input_offset_pre) (input_pixel_stride_pre) (input_increment_pre) (output_pre) (output_increment_pre) (lo) (hi)) probe_pre (mp_probe_value (F) (PT) (output_pixels_pre) (kernel_elements_pre) (channels_pre) (input_pre) (input_offset_pre) (input_pixel_stride_pre) (input_increment_pre) (output_pre) (output_increment_pre) (lo) (hi) (probe_pre)) ) ” 
  &&  “ (mp_write_window W probe_pre 4 ) ” 
  &&  “ (probe_pre <> 0) ”
) \/
(
forall (probe_pre: Z) (params_pre: Z) (output_increment_pre: Z) (input_increment_pre: Z) (output_pre: Z) (input_pixel_stride_pre: Z) (input_offset_pre: Z) (input_pre: Z) (channels_pre: Z) (kernel_elements_pre: Z) (output_pixels_pre: Z) (hi: fp32) (lo: fp32) (old: MPOutput) (W: (@list Z)) (PT: MPPtrMap) (F: MPFloatMap) (PreH1 : (output_increment_pre <= UINT64_MAX)) (PreH2 : (input_increment_pre <= UINT64_MAX)) (PreH3 : (input_pixel_stride_pre <= UINT64_MAX)) (PreH4 : (input_offset_pre <= UINT64_MAX)) (PreH5 : (channels_pre <= UINT64_MAX)) (PreH6 : (kernel_elements_pre <= UINT64_MAX)) (PreH7 : (output_pixels_pre <= UINT64_MAX)) (PreH8 : (output_increment_pre >= 0)) (PreH9 : (input_increment_pre >= 0)) (PreH10 : (input_pixel_stride_pre >= 0)) (PreH11 : (input_offset_pre >= 0)) (PreH12 : (channels_pre >= 0)) (PreH13 : (kernel_elements_pre >= 0)) (PreH14 : (output_pixels_pre >= 0)) (PreH15 : (mp_written output_pixels_pre channels_pre output_pre output_increment_pre probe_pre )) (PreH16 : (0 < output_pixels_pre)) (PreH17 : (0 < channels_pre)) (PreH18 : (params_pre <> 0)) (PreH19 : (mp_word64 output_pixels_pre )) (PreH20 : (mp_word64 kernel_elements_pre )) (PreH21 : (mp_word64 channels_pre )) (PreH22 : (mp_word64 input_offset_pre )) (PreH23 : (mp_word64 input_pixel_stride_pre )) (PreH24 : (mp_word64 input_increment_pre )) (PreH25 : (mp_word64 output_increment_pre )) (PreH26 : (mp_word64 input_pre )) (PreH27 : (mp_word64 output_pre )) (PreH28 : (mp_word64 params_pre )) (PreH29 : (mp_geometry F PT W output_pixels_pre kernel_elements_pre channels_pre input_pre input_offset_pre input_pixel_stride_pre input_increment_pre output_pre output_increment_pre )) ,
  ((( &( "before" ) )) # UInt  |->_)
  **  (mp_data F )
  **  (mp_ptr_data PT )
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min")) # Float  |-> lo)
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max")) # Float  |-> hi)
  **  (mp_out W (mp_complete (F) (PT) (old) (output_pixels_pre) (kernel_elements_pre) (channels_pre) (input_pre) (input_offset_pre) (input_pixel_stride_pre) (input_increment_pre) (output_pre) (output_increment_pre) (lo) (hi)) )
  **  ((( &( "output_pixels" ) )) # UInt64  |-> output_pixels_pre)
  **  ((( &( "kernel_elements" ) )) # UInt64  |-> kernel_elements_pre)
  **  ((( &( "channels" ) )) # UInt64  |-> channels_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "input_offset" ) )) # UInt64  |-> input_offset_pre)
  **  ((( &( "input_pixel_stride" ) )) # UInt64  |-> input_pixel_stride_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "input_increment" ) )) # UInt64  |-> input_increment_pre)
  **  ((( &( "output_increment" ) )) # UInt64  |-> output_increment_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "probe" ) )) # Ptr  |-> probe_pre)
|--
  “ (probe_pre <> 0) ” 
  &&  “ (mp_write_window W probe_pre 4 ) ” 
  &&  “ (mp_out_known (mp_complete (F) (PT) (old) (output_pixels_pre) (kernel_elements_pre) (channels_pre) (input_pre) (input_offset_pre) (input_pixel_stride_pre) (input_increment_pre) (output_pre) (output_increment_pre) (lo) (hi)) probe_pre (mp_probe_value (F) (PT) (output_pixels_pre) (kernel_elements_pre) (channels_pre) (input_pre) (input_offset_pre) (input_pixel_stride_pre) (input_increment_pre) (output_pre) (output_increment_pre) (lo) (hi) (probe_pre)) ) ”
).

Definition compare_maxpool_written_partial_solve_wit_2_pure_split_goal_1 := 
forall (probe_pre: Z) (params_pre: Z) (output_increment_pre: Z) (input_increment_pre: Z) (output_pre: Z) (input_pixel_stride_pre: Z) (input_offset_pre: Z) (input_pre: Z) (channels_pre: Z) (kernel_elements_pre: Z) (output_pixels_pre: Z) (hi: fp32) (lo: fp32) (old: MPOutput) (W: (@list Z)) (PT: MPPtrMap) (F: MPFloatMap) (PreH1 : (output_increment_pre <= UINT64_MAX)) (PreH2 : (input_increment_pre <= UINT64_MAX)) (PreH3 : (input_pixel_stride_pre <= UINT64_MAX)) (PreH4 : (input_offset_pre <= UINT64_MAX)) (PreH5 : (channels_pre <= UINT64_MAX)) (PreH6 : (kernel_elements_pre <= UINT64_MAX)) (PreH7 : (output_pixels_pre <= UINT64_MAX)) (PreH8 : (output_increment_pre >= 0)) (PreH9 : (input_increment_pre >= 0)) (PreH10 : (input_pixel_stride_pre >= 0)) (PreH11 : (input_offset_pre >= 0)) (PreH12 : (channels_pre >= 0)) (PreH13 : (kernel_elements_pre >= 0)) (PreH14 : (output_pixels_pre >= 0)) (PreH15 : (mp_written output_pixels_pre channels_pre output_pre output_increment_pre probe_pre )) (PreH16 : (0 < output_pixels_pre)) (PreH17 : (0 < channels_pre)) (PreH18 : (params_pre <> 0)) (PreH19 : (mp_word64 output_pixels_pre )) (PreH20 : (mp_word64 kernel_elements_pre )) (PreH21 : (mp_word64 channels_pre )) (PreH22 : (mp_word64 input_offset_pre )) (PreH23 : (mp_word64 input_pixel_stride_pre )) (PreH24 : (mp_word64 input_increment_pre )) (PreH25 : (mp_word64 output_increment_pre )) (PreH26 : (mp_word64 input_pre )) (PreH27 : (mp_word64 output_pre )) (PreH28 : (mp_word64 params_pre )) (PreH29 : (mp_geometry F PT W output_pixels_pre kernel_elements_pre channels_pre input_pre input_offset_pre input_pixel_stride_pre input_increment_pre output_pre output_increment_pre )) ,
  ((( &( "before" ) )) # UInt  |->_)
  **  (mp_data F )
  **  (mp_ptr_data PT )
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min")) # Float  |-> lo)
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max")) # Float  |-> hi)
  **  (mp_out W (mp_complete (F) (PT) (old) (output_pixels_pre) (kernel_elements_pre) (channels_pre) (input_pre) (input_offset_pre) (input_pixel_stride_pre) (input_increment_pre) (output_pre) (output_increment_pre) (lo) (hi)) )
  **  ((( &( "output_pixels" ) )) # UInt64  |-> output_pixels_pre)
  **  ((( &( "kernel_elements" ) )) # UInt64  |-> kernel_elements_pre)
  **  ((( &( "channels" ) )) # UInt64  |-> channels_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "input_offset" ) )) # UInt64  |-> input_offset_pre)
  **  ((( &( "input_pixel_stride" ) )) # UInt64  |-> input_pixel_stride_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "input_increment" ) )) # UInt64  |-> input_increment_pre)
  **  ((( &( "output_increment" ) )) # UInt64  |-> output_increment_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "probe" ) )) # Ptr  |-> probe_pre)
|--
  “ (probe_pre <> 0) ”
.

Definition compare_maxpool_written_partial_solve_wit_2_pure_split_goal_2 := 
forall (probe_pre: Z) (params_pre: Z) (output_increment_pre: Z) (input_increment_pre: Z) (output_pre: Z) (input_pixel_stride_pre: Z) (input_offset_pre: Z) (input_pre: Z) (channels_pre: Z) (kernel_elements_pre: Z) (output_pixels_pre: Z) (hi: fp32) (lo: fp32) (old: MPOutput) (W: (@list Z)) (PT: MPPtrMap) (F: MPFloatMap) (PreH1 : (output_increment_pre <= UINT64_MAX)) (PreH2 : (input_increment_pre <= UINT64_MAX)) (PreH3 : (input_pixel_stride_pre <= UINT64_MAX)) (PreH4 : (input_offset_pre <= UINT64_MAX)) (PreH5 : (channels_pre <= UINT64_MAX)) (PreH6 : (kernel_elements_pre <= UINT64_MAX)) (PreH7 : (output_pixels_pre <= UINT64_MAX)) (PreH8 : (output_increment_pre >= 0)) (PreH9 : (input_increment_pre >= 0)) (PreH10 : (input_pixel_stride_pre >= 0)) (PreH11 : (input_offset_pre >= 0)) (PreH12 : (channels_pre >= 0)) (PreH13 : (kernel_elements_pre >= 0)) (PreH14 : (output_pixels_pre >= 0)) (PreH15 : (mp_written output_pixels_pre channels_pre output_pre output_increment_pre probe_pre )) (PreH16 : (0 < output_pixels_pre)) (PreH17 : (0 < channels_pre)) (PreH18 : (params_pre <> 0)) (PreH19 : (mp_word64 output_pixels_pre )) (PreH20 : (mp_word64 kernel_elements_pre )) (PreH21 : (mp_word64 channels_pre )) (PreH22 : (mp_word64 input_offset_pre )) (PreH23 : (mp_word64 input_pixel_stride_pre )) (PreH24 : (mp_word64 input_increment_pre )) (PreH25 : (mp_word64 output_increment_pre )) (PreH26 : (mp_word64 input_pre )) (PreH27 : (mp_word64 output_pre )) (PreH28 : (mp_word64 params_pre )) (PreH29 : (mp_geometry F PT W output_pixels_pre kernel_elements_pre channels_pre input_pre input_offset_pre input_pixel_stride_pre input_increment_pre output_pre output_increment_pre )) ,
  ((( &( "before" ) )) # UInt  |->_)
  **  (mp_data F )
  **  (mp_ptr_data PT )
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min")) # Float  |-> lo)
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max")) # Float  |-> hi)
  **  (mp_out W (mp_complete (F) (PT) (old) (output_pixels_pre) (kernel_elements_pre) (channels_pre) (input_pre) (input_offset_pre) (input_pixel_stride_pre) (input_increment_pre) (output_pre) (output_increment_pre) (lo) (hi)) )
  **  ((( &( "output_pixels" ) )) # UInt64  |-> output_pixels_pre)
  **  ((( &( "kernel_elements" ) )) # UInt64  |-> kernel_elements_pre)
  **  ((( &( "channels" ) )) # UInt64  |-> channels_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "input_offset" ) )) # UInt64  |-> input_offset_pre)
  **  ((( &( "input_pixel_stride" ) )) # UInt64  |-> input_pixel_stride_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "input_increment" ) )) # UInt64  |-> input_increment_pre)
  **  ((( &( "output_increment" ) )) # UInt64  |-> output_increment_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "probe" ) )) # Ptr  |-> probe_pre)
|--
  “ (mp_write_window W probe_pre 4 ) ”
.

Definition compare_maxpool_written_partial_solve_wit_2_pure_split_goal_3 := 
forall (probe_pre: Z) (params_pre: Z) (output_increment_pre: Z) (input_increment_pre: Z) (output_pre: Z) (input_pixel_stride_pre: Z) (input_offset_pre: Z) (input_pre: Z) (channels_pre: Z) (kernel_elements_pre: Z) (output_pixels_pre: Z) (hi: fp32) (lo: fp32) (old: MPOutput) (W: (@list Z)) (PT: MPPtrMap) (F: MPFloatMap) (PreH1 : (output_increment_pre <= UINT64_MAX)) (PreH2 : (input_increment_pre <= UINT64_MAX)) (PreH3 : (input_pixel_stride_pre <= UINT64_MAX)) (PreH4 : (input_offset_pre <= UINT64_MAX)) (PreH5 : (channels_pre <= UINT64_MAX)) (PreH6 : (kernel_elements_pre <= UINT64_MAX)) (PreH7 : (output_pixels_pre <= UINT64_MAX)) (PreH8 : (output_increment_pre >= 0)) (PreH9 : (input_increment_pre >= 0)) (PreH10 : (input_pixel_stride_pre >= 0)) (PreH11 : (input_offset_pre >= 0)) (PreH12 : (channels_pre >= 0)) (PreH13 : (kernel_elements_pre >= 0)) (PreH14 : (output_pixels_pre >= 0)) (PreH15 : (mp_written output_pixels_pre channels_pre output_pre output_increment_pre probe_pre )) (PreH16 : (0 < output_pixels_pre)) (PreH17 : (0 < channels_pre)) (PreH18 : (params_pre <> 0)) (PreH19 : (mp_word64 output_pixels_pre )) (PreH20 : (mp_word64 kernel_elements_pre )) (PreH21 : (mp_word64 channels_pre )) (PreH22 : (mp_word64 input_offset_pre )) (PreH23 : (mp_word64 input_pixel_stride_pre )) (PreH24 : (mp_word64 input_increment_pre )) (PreH25 : (mp_word64 output_increment_pre )) (PreH26 : (mp_word64 input_pre )) (PreH27 : (mp_word64 output_pre )) (PreH28 : (mp_word64 params_pre )) (PreH29 : (mp_geometry F PT W output_pixels_pre kernel_elements_pre channels_pre input_pre input_offset_pre input_pixel_stride_pre input_increment_pre output_pre output_increment_pre )) ,
  ((( &( "before" ) )) # UInt  |->_)
  **  (mp_data F )
  **  (mp_ptr_data PT )
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min")) # Float  |-> lo)
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max")) # Float  |-> hi)
  **  (mp_out W (mp_complete (F) (PT) (old) (output_pixels_pre) (kernel_elements_pre) (channels_pre) (input_pre) (input_offset_pre) (input_pixel_stride_pre) (input_increment_pre) (output_pre) (output_increment_pre) (lo) (hi)) )
  **  ((( &( "output_pixels" ) )) # UInt64  |-> output_pixels_pre)
  **  ((( &( "kernel_elements" ) )) # UInt64  |-> kernel_elements_pre)
  **  ((( &( "channels" ) )) # UInt64  |-> channels_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "input_offset" ) )) # UInt64  |-> input_offset_pre)
  **  ((( &( "input_pixel_stride" ) )) # UInt64  |-> input_pixel_stride_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "input_increment" ) )) # UInt64  |-> input_increment_pre)
  **  ((( &( "output_increment" ) )) # UInt64  |-> output_increment_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "probe" ) )) # Ptr  |-> probe_pre)
|--
  “ (mp_out_known (mp_complete (F) (PT) (old) (output_pixels_pre) (kernel_elements_pre) (channels_pre) (input_pre) (input_offset_pre) (input_pixel_stride_pre) (input_increment_pre) (output_pre) (output_increment_pre) (lo) (hi)) probe_pre (mp_probe_value (F) (PT) (output_pixels_pre) (kernel_elements_pre) (channels_pre) (input_pre) (input_offset_pre) (input_pixel_stride_pre) (input_increment_pre) (output_pre) (output_increment_pre) (lo) (hi) (probe_pre)) ) ”
.

Definition compare_maxpool_written_partial_solve_wit_2_aux := 
forall (probe_pre: Z) (params_pre: Z) (output_increment_pre: Z) (input_increment_pre: Z) (output_pre: Z) (input_pixel_stride_pre: Z) (input_offset_pre: Z) (input_pre: Z) (channels_pre: Z) (kernel_elements_pre: Z) (output_pixels_pre: Z) (hi: fp32) (lo: fp32) (old: MPOutput) (W: (@list Z)) (PT: MPPtrMap) (F: MPFloatMap) (PreH1 : (mp_written output_pixels_pre channels_pre output_pre output_increment_pre probe_pre )) (PreH2 : (0 < output_pixels_pre)) (PreH3 : (0 < channels_pre)) (PreH4 : (params_pre <> 0)) (PreH5 : (mp_word64 output_pixels_pre )) (PreH6 : (mp_word64 kernel_elements_pre )) (PreH7 : (mp_word64 channels_pre )) (PreH8 : (mp_word64 input_offset_pre )) (PreH9 : (mp_word64 input_pixel_stride_pre )) (PreH10 : (mp_word64 input_increment_pre )) (PreH11 : (mp_word64 output_increment_pre )) (PreH12 : (mp_word64 input_pre )) (PreH13 : (mp_word64 output_pre )) (PreH14 : (mp_word64 params_pre )) (PreH15 : (mp_geometry F PT W output_pixels_pre kernel_elements_pre channels_pre input_pre input_offset_pre input_pixel_stride_pre input_increment_pre output_pre output_increment_pre )) ,
  (mp_data F )
  **  (mp_ptr_data PT )
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min")) # Float  |-> lo)
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max")) # Float  |-> hi)
  **  (mp_out W (mp_complete (F) (PT) (old) (output_pixels_pre) (kernel_elements_pre) (channels_pre) (input_pre) (input_offset_pre) (input_pixel_stride_pre) (input_increment_pre) (output_pre) (output_increment_pre) (lo) (hi)) )
|--
  “ (mp_out_known (mp_complete (F) (PT) (old) (output_pixels_pre) (kernel_elements_pre) (channels_pre) (input_pre) (input_offset_pre) (input_pixel_stride_pre) (input_increment_pre) (output_pre) (output_increment_pre) (lo) (hi)) probe_pre (mp_probe_value (F) (PT) (output_pixels_pre) (kernel_elements_pre) (channels_pre) (input_pre) (input_offset_pre) (input_pixel_stride_pre) (input_increment_pre) (output_pre) (output_increment_pre) (lo) (hi) (probe_pre)) ) ” 
  &&  “ (mp_write_window W probe_pre 4 ) ” 
  &&  “ (probe_pre <> 0) ” 
  &&  “ (mp_written output_pixels_pre channels_pre output_pre output_increment_pre probe_pre ) ” 
  &&  “ (0 < output_pixels_pre) ” 
  &&  “ (0 < channels_pre) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (mp_word64 output_pixels_pre ) ” 
  &&  “ (mp_word64 kernel_elements_pre ) ” 
  &&  “ (mp_word64 channels_pre ) ” 
  &&  “ (mp_word64 input_offset_pre ) ” 
  &&  “ (mp_word64 input_pixel_stride_pre ) ” 
  &&  “ (mp_word64 input_increment_pre ) ” 
  &&  “ (mp_word64 output_increment_pre ) ” 
  &&  “ (mp_word64 input_pre ) ” 
  &&  “ (mp_word64 output_pre ) ” 
  &&  “ (mp_word64 params_pre ) ” 
  &&  “ (mp_geometry F PT W output_pixels_pre kernel_elements_pre channels_pre input_pre input_offset_pre input_pixel_stride_pre input_increment_pre output_pre output_increment_pre ) ”
  &&  (mp_out W (mp_complete (F) (PT) (old) (output_pixels_pre) (kernel_elements_pre) (channels_pre) (input_pre) (input_offset_pre) (input_pixel_stride_pre) (input_increment_pre) (output_pre) (output_increment_pre) (lo) (hi)) )
  **  (mp_data F )
  **  (mp_ptr_data PT )
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min")) # Float  |-> lo)
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max")) # Float  |-> hi)
.

Definition compare_maxpool_written_partial_solve_wit_2 := compare_maxpool_written_partial_solve_wit_2_pure -> compare_maxpool_written_partial_solve_wit_2_aux.

Definition compare_maxpool_written_partial_solve_wit_3_pure := 
forall (probe_pre: Z) (params_pre: Z) (output_increment_pre: Z) (input_increment_pre: Z) (output_pre: Z) (input_pixel_stride_pre: Z) (input_offset_pre: Z) (input_pre: Z) (channels_pre: Z) (kernel_elements_pre: Z) (output_pixels_pre: Z) (hi: fp32) (lo: fp32) (old: MPOutput) (W: (@list Z)) (PT: MPPtrMap) (F: MPFloatMap) (retval: Z) (PreH1 : (retval = (bits_of_fp32 ((mp_probe_value (F) (PT) (output_pixels_pre) (kernel_elements_pre) (channels_pre) (input_pre) (input_offset_pre) (input_pixel_stride_pre) (input_increment_pre) (output_pre) (output_increment_pre) (lo) (hi) (probe_pre)))))) (PreH2 : (mp_written output_pixels_pre channels_pre output_pre output_increment_pre probe_pre )) (PreH3 : (0 < output_pixels_pre)) (PreH4 : (0 < channels_pre)) (PreH5 : (params_pre <> 0)) (PreH6 : (mp_word64 output_pixels_pre )) (PreH7 : (mp_word64 kernel_elements_pre )) (PreH8 : (mp_word64 channels_pre )) (PreH9 : (mp_word64 input_offset_pre )) (PreH10 : (mp_word64 input_pixel_stride_pre )) (PreH11 : (mp_word64 input_increment_pre )) (PreH12 : (mp_word64 output_increment_pre )) (PreH13 : (mp_word64 input_pre )) (PreH14 : (mp_word64 output_pre )) (PreH15 : (mp_word64 params_pre )) (PreH16 : (mp_geometry F PT W output_pixels_pre kernel_elements_pre channels_pre input_pre input_offset_pre input_pixel_stride_pre input_increment_pre output_pre output_increment_pre )) ,
  (mp_out W (mp_complete (F) (PT) (old) (output_pixels_pre) (kernel_elements_pre) (channels_pre) (input_pre) (input_offset_pre) (input_pixel_stride_pre) (input_increment_pre) (output_pre) (output_increment_pre) (lo) (hi)) )
  **  ((( &( "before" ) )) # UInt  |-> retval)
  **  (mp_data F )
  **  (mp_ptr_data PT )
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min")) # Float  |-> lo)
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max")) # Float  |-> hi)
  **  ((( &( "output_pixels" ) )) # UInt64  |-> output_pixels_pre)
  **  ((( &( "kernel_elements" ) )) # UInt64  |-> kernel_elements_pre)
  **  ((( &( "channels" ) )) # UInt64  |-> channels_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "input_offset" ) )) # UInt64  |-> input_offset_pre)
  **  ((( &( "input_pixel_stride" ) )) # UInt64  |-> input_pixel_stride_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "input_increment" ) )) # UInt64  |-> input_increment_pre)
  **  ((( &( "output_increment" ) )) # UInt64  |-> output_increment_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "probe" ) )) # Ptr  |-> probe_pre)
|--
  “ (0 < output_pixels_pre) ” 
  &&  “ (0 < channels_pre) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (mp_word64 output_pixels_pre ) ” 
  &&  “ (mp_word64 kernel_elements_pre ) ” 
  &&  “ (mp_word64 channels_pre ) ” 
  &&  “ (mp_word64 input_offset_pre ) ” 
  &&  “ (mp_word64 input_pixel_stride_pre ) ” 
  &&  “ (mp_word64 input_increment_pre ) ” 
  &&  “ (mp_word64 output_increment_pre ) ” 
  &&  “ (mp_word64 input_pre ) ” 
  &&  “ (mp_word64 output_pre ) ” 
  &&  “ (mp_word64 params_pre ) ” 
  &&  “ (mp_geometry F PT W output_pixels_pre kernel_elements_pre channels_pre input_pre input_offset_pre input_pixel_stride_pre input_increment_pre output_pre output_increment_pre ) ”
.

Definition compare_maxpool_written_partial_solve_wit_3_aux := 
forall (probe_pre: Z) (params_pre: Z) (output_increment_pre: Z) (input_increment_pre: Z) (output_pre: Z) (input_pixel_stride_pre: Z) (input_offset_pre: Z) (input_pre: Z) (channels_pre: Z) (kernel_elements_pre: Z) (output_pixels_pre: Z) (hi: fp32) (lo: fp32) (old: MPOutput) (W: (@list Z)) (PT: MPPtrMap) (F: MPFloatMap) (retval: Z) (PreH1 : (retval = (bits_of_fp32 ((mp_probe_value (F) (PT) (output_pixels_pre) (kernel_elements_pre) (channels_pre) (input_pre) (input_offset_pre) (input_pixel_stride_pre) (input_increment_pre) (output_pre) (output_increment_pre) (lo) (hi) (probe_pre)))))) (PreH2 : (mp_written output_pixels_pre channels_pre output_pre output_increment_pre probe_pre )) (PreH3 : (0 < output_pixels_pre)) (PreH4 : (0 < channels_pre)) (PreH5 : (params_pre <> 0)) (PreH6 : (mp_word64 output_pixels_pre )) (PreH7 : (mp_word64 kernel_elements_pre )) (PreH8 : (mp_word64 channels_pre )) (PreH9 : (mp_word64 input_offset_pre )) (PreH10 : (mp_word64 input_pixel_stride_pre )) (PreH11 : (mp_word64 input_increment_pre )) (PreH12 : (mp_word64 output_increment_pre )) (PreH13 : (mp_word64 input_pre )) (PreH14 : (mp_word64 output_pre )) (PreH15 : (mp_word64 params_pre )) (PreH16 : (mp_geometry F PT W output_pixels_pre kernel_elements_pre channels_pre input_pre input_offset_pre input_pixel_stride_pre input_increment_pre output_pre output_increment_pre )) ,
  (mp_out W (mp_complete (F) (PT) (old) (output_pixels_pre) (kernel_elements_pre) (channels_pre) (input_pre) (input_offset_pre) (input_pixel_stride_pre) (input_increment_pre) (output_pre) (output_increment_pre) (lo) (hi)) )
  **  (mp_data F )
  **  (mp_ptr_data PT )
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min")) # Float  |-> lo)
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max")) # Float  |-> hi)
|--
  “ (0 < output_pixels_pre) ” 
  &&  “ (0 < channels_pre) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (mp_word64 output_pixels_pre ) ” 
  &&  “ (mp_word64 kernel_elements_pre ) ” 
  &&  “ (mp_word64 channels_pre ) ” 
  &&  “ (mp_word64 input_offset_pre ) ” 
  &&  “ (mp_word64 input_pixel_stride_pre ) ” 
  &&  “ (mp_word64 input_increment_pre ) ” 
  &&  “ (mp_word64 output_increment_pre ) ” 
  &&  “ (mp_word64 input_pre ) ” 
  &&  “ (mp_word64 output_pre ) ” 
  &&  “ (mp_word64 params_pre ) ” 
  &&  “ (mp_geometry F PT W output_pixels_pre kernel_elements_pre channels_pre input_pre input_offset_pre input_pixel_stride_pre input_increment_pre output_pre output_increment_pre ) ” 
  &&  “ (retval = (bits_of_fp32 ((mp_probe_value (F) (PT) (output_pixels_pre) (kernel_elements_pre) (channels_pre) (input_pre) (input_offset_pre) (input_pixel_stride_pre) (input_increment_pre) (output_pre) (output_increment_pre) (lo) (hi) (probe_pre))))) ” 
  &&  “ (mp_written output_pixels_pre channels_pre output_pre output_increment_pre probe_pre ) ” 
  &&  “ (0 < output_pixels_pre) ” 
  &&  “ (0 < channels_pre) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (mp_word64 output_pixels_pre ) ” 
  &&  “ (mp_word64 kernel_elements_pre ) ” 
  &&  “ (mp_word64 channels_pre ) ” 
  &&  “ (mp_word64 input_offset_pre ) ” 
  &&  “ (mp_word64 input_pixel_stride_pre ) ” 
  &&  “ (mp_word64 input_increment_pre ) ” 
  &&  “ (mp_word64 output_increment_pre ) ” 
  &&  “ (mp_word64 input_pre ) ” 
  &&  “ (mp_word64 output_pre ) ” 
  &&  “ (mp_word64 params_pre ) ” 
  &&  “ (mp_geometry F PT W output_pixels_pre kernel_elements_pre channels_pre input_pre input_offset_pre input_pixel_stride_pre input_increment_pre output_pre output_increment_pre ) ”
  &&  (mp_data F )
  **  (mp_ptr_data PT )
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min")) # Float  |-> lo)
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max")) # Float  |-> hi)
  **  (mp_out W (mp_complete (F) (PT) (old) (output_pixels_pre) (kernel_elements_pre) (channels_pre) (input_pre) (input_offset_pre) (input_pixel_stride_pre) (input_increment_pre) (output_pre) (output_increment_pre) (lo) (hi)) )
.

Definition compare_maxpool_written_partial_solve_wit_3 := compare_maxpool_written_partial_solve_wit_3_pure -> compare_maxpool_written_partial_solve_wit_3_aux.

Definition compare_maxpool_written_partial_solve_wit_4_pure := 
(
forall (probe_pre: Z) (params_pre: Z) (output_increment_pre: Z) (input_increment_pre: Z) (output_pre: Z) (input_pixel_stride_pre: Z) (input_offset_pre: Z) (input_pre: Z) (channels_pre: Z) (kernel_elements_pre: Z) (output_pixels_pre: Z) (hi: fp32) (lo: fp32) (old: MPOutput) (W: (@list Z)) (PT: MPPtrMap) (F: MPFloatMap) (retval: Z) (PreH1 : (retval = (bits_of_fp32 ((mp_probe_value (F) (PT) (output_pixels_pre) (kernel_elements_pre) (channels_pre) (input_pre) (input_offset_pre) (input_pixel_stride_pre) (input_increment_pre) (output_pre) (output_increment_pre) (lo) (hi) (probe_pre)))))) (PreH2 : (mp_written output_pixels_pre channels_pre output_pre output_increment_pre probe_pre )) (PreH3 : (0 < output_pixels_pre)) (PreH4 : (0 < channels_pre)) (PreH5 : (params_pre <> 0)) (PreH6 : (mp_word64 output_pixels_pre )) (PreH7 : (mp_word64 kernel_elements_pre )) (PreH8 : (mp_word64 channels_pre )) (PreH9 : (mp_word64 input_offset_pre )) (PreH10 : (mp_word64 input_pixel_stride_pre )) (PreH11 : (mp_word64 input_increment_pre )) (PreH12 : (mp_word64 output_increment_pre )) (PreH13 : (mp_word64 input_pre )) (PreH14 : (mp_word64 output_pre )) (PreH15 : (mp_word64 params_pre )) (PreH16 : (mp_geometry F PT W output_pixels_pre kernel_elements_pre channels_pre input_pre input_offset_pre input_pixel_stride_pre input_increment_pre output_pre output_increment_pre )) ,
  ((( &( "after" ) )) # UInt  |->_)
  **  (mp_data F )
  **  (mp_ptr_data PT )
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min")) # Float  |-> lo)
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max")) # Float  |-> hi)
  **  (mp_out W (mp_complete (F) (PT) ((mp_complete (F) (PT) (old) (output_pixels_pre) (kernel_elements_pre) (channels_pre) (input_pre) (input_offset_pre) (input_pixel_stride_pre) (input_increment_pre) (output_pre) (output_increment_pre) (lo) (hi))) (output_pixels_pre) (kernel_elements_pre) (channels_pre) (input_pre) (input_offset_pre) (input_pixel_stride_pre) (input_increment_pre) (output_pre) (output_increment_pre) (lo) (hi)) )
  **  ((( &( "before" ) )) # UInt  |-> retval)
  **  ((( &( "output_pixels" ) )) # UInt64  |-> output_pixels_pre)
  **  ((( &( "kernel_elements" ) )) # UInt64  |-> kernel_elements_pre)
  **  ((( &( "channels" ) )) # UInt64  |-> channels_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "input_offset" ) )) # UInt64  |-> input_offset_pre)
  **  ((( &( "input_pixel_stride" ) )) # UInt64  |-> input_pixel_stride_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "input_increment" ) )) # UInt64  |-> input_increment_pre)
  **  ((( &( "output_increment" ) )) # UInt64  |-> output_increment_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "probe" ) )) # Ptr  |-> probe_pre)
|--
  “ (mp_out_known (mp_complete (F) (PT) ((mp_complete (F) (PT) (old) (output_pixels_pre) (kernel_elements_pre) (channels_pre) (input_pre) (input_offset_pre) (input_pixel_stride_pre) (input_increment_pre) (output_pre) (output_increment_pre) (lo) (hi))) (output_pixels_pre) (kernel_elements_pre) (channels_pre) (input_pre) (input_offset_pre) (input_pixel_stride_pre) (input_increment_pre) (output_pre) (output_increment_pre) (lo) (hi)) probe_pre (mp_probe_value (F) (PT) (output_pixels_pre) (kernel_elements_pre) (channels_pre) (input_pre) (input_offset_pre) (input_pixel_stride_pre) (input_increment_pre) (output_pre) (output_increment_pre) (lo) (hi) (probe_pre)) ) ” 
  &&  “ (mp_write_window W probe_pre 4 ) ” 
  &&  “ (probe_pre <> 0) ”
) \/
(
forall (probe_pre: Z) (params_pre: Z) (output_increment_pre: Z) (input_increment_pre: Z) (output_pre: Z) (input_pixel_stride_pre: Z) (input_offset_pre: Z) (input_pre: Z) (channels_pre: Z) (kernel_elements_pre: Z) (output_pixels_pre: Z) (hi: fp32) (lo: fp32) (old: MPOutput) (W: (@list Z)) (PT: MPPtrMap) (F: MPFloatMap) (retval: Z) (PreH1 : (output_increment_pre <= UINT64_MAX)) (PreH2 : (input_increment_pre <= UINT64_MAX)) (PreH3 : (input_pixel_stride_pre <= UINT64_MAX)) (PreH4 : (input_offset_pre <= UINT64_MAX)) (PreH5 : (channels_pre <= UINT64_MAX)) (PreH6 : (kernel_elements_pre <= UINT64_MAX)) (PreH7 : (output_pixels_pre <= UINT64_MAX)) (PreH8 : (output_increment_pre >= 0)) (PreH9 : (input_increment_pre >= 0)) (PreH10 : (input_pixel_stride_pre >= 0)) (PreH11 : (input_offset_pre >= 0)) (PreH12 : (channels_pre >= 0)) (PreH13 : (kernel_elements_pre >= 0)) (PreH14 : (output_pixels_pre >= 0)) (PreH15 : (retval <= UINT_MAX)) (PreH16 : (retval >= 0)) (PreH17 : (retval = (bits_of_fp32 ((mp_probe_value (F) (PT) (output_pixels_pre) (kernel_elements_pre) (channels_pre) (input_pre) (input_offset_pre) (input_pixel_stride_pre) (input_increment_pre) (output_pre) (output_increment_pre) (lo) (hi) (probe_pre)))))) (PreH18 : (mp_written output_pixels_pre channels_pre output_pre output_increment_pre probe_pre )) (PreH19 : (0 < output_pixels_pre)) (PreH20 : (0 < channels_pre)) (PreH21 : (params_pre <> 0)) (PreH22 : (mp_word64 output_pixels_pre )) (PreH23 : (mp_word64 kernel_elements_pre )) (PreH24 : (mp_word64 channels_pre )) (PreH25 : (mp_word64 input_offset_pre )) (PreH26 : (mp_word64 input_pixel_stride_pre )) (PreH27 : (mp_word64 input_increment_pre )) (PreH28 : (mp_word64 output_increment_pre )) (PreH29 : (mp_word64 input_pre )) (PreH30 : (mp_word64 output_pre )) (PreH31 : (mp_word64 params_pre )) (PreH32 : (mp_geometry F PT W output_pixels_pre kernel_elements_pre channels_pre input_pre input_offset_pre input_pixel_stride_pre input_increment_pre output_pre output_increment_pre )) ,
  ((( &( "after" ) )) # UInt  |->_)
  **  (mp_data F )
  **  (mp_ptr_data PT )
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min")) # Float  |-> lo)
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max")) # Float  |-> hi)
  **  (mp_out W (mp_complete (F) (PT) ((mp_complete (F) (PT) (old) (output_pixels_pre) (kernel_elements_pre) (channels_pre) (input_pre) (input_offset_pre) (input_pixel_stride_pre) (input_increment_pre) (output_pre) (output_increment_pre) (lo) (hi))) (output_pixels_pre) (kernel_elements_pre) (channels_pre) (input_pre) (input_offset_pre) (input_pixel_stride_pre) (input_increment_pre) (output_pre) (output_increment_pre) (lo) (hi)) )
  **  ((( &( "before" ) )) # UInt  |-> retval)
  **  ((( &( "output_pixels" ) )) # UInt64  |-> output_pixels_pre)
  **  ((( &( "kernel_elements" ) )) # UInt64  |-> kernel_elements_pre)
  **  ((( &( "channels" ) )) # UInt64  |-> channels_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "input_offset" ) )) # UInt64  |-> input_offset_pre)
  **  ((( &( "input_pixel_stride" ) )) # UInt64  |-> input_pixel_stride_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "input_increment" ) )) # UInt64  |-> input_increment_pre)
  **  ((( &( "output_increment" ) )) # UInt64  |-> output_increment_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "probe" ) )) # Ptr  |-> probe_pre)
|--
  “ (probe_pre <> 0) ” 
  &&  “ (mp_write_window W probe_pre 4 ) ” 
  &&  “ (mp_out_known (mp_complete (F) (PT) ((mp_complete (F) (PT) (old) (output_pixels_pre) (kernel_elements_pre) (channels_pre) (input_pre) (input_offset_pre) (input_pixel_stride_pre) (input_increment_pre) (output_pre) (output_increment_pre) (lo) (hi))) (output_pixels_pre) (kernel_elements_pre) (channels_pre) (input_pre) (input_offset_pre) (input_pixel_stride_pre) (input_increment_pre) (output_pre) (output_increment_pre) (lo) (hi)) probe_pre (mp_probe_value (F) (PT) (output_pixels_pre) (kernel_elements_pre) (channels_pre) (input_pre) (input_offset_pre) (input_pixel_stride_pre) (input_increment_pre) (output_pre) (output_increment_pre) (lo) (hi) (probe_pre)) ) ”
).

Definition compare_maxpool_written_partial_solve_wit_4_pure_split_goal_1 := 
forall (probe_pre: Z) (params_pre: Z) (output_increment_pre: Z) (input_increment_pre: Z) (output_pre: Z) (input_pixel_stride_pre: Z) (input_offset_pre: Z) (input_pre: Z) (channels_pre: Z) (kernel_elements_pre: Z) (output_pixels_pre: Z) (hi: fp32) (lo: fp32) (old: MPOutput) (W: (@list Z)) (PT: MPPtrMap) (F: MPFloatMap) (retval: Z) (PreH1 : (output_increment_pre <= UINT64_MAX)) (PreH2 : (input_increment_pre <= UINT64_MAX)) (PreH3 : (input_pixel_stride_pre <= UINT64_MAX)) (PreH4 : (input_offset_pre <= UINT64_MAX)) (PreH5 : (channels_pre <= UINT64_MAX)) (PreH6 : (kernel_elements_pre <= UINT64_MAX)) (PreH7 : (output_pixels_pre <= UINT64_MAX)) (PreH8 : (output_increment_pre >= 0)) (PreH9 : (input_increment_pre >= 0)) (PreH10 : (input_pixel_stride_pre >= 0)) (PreH11 : (input_offset_pre >= 0)) (PreH12 : (channels_pre >= 0)) (PreH13 : (kernel_elements_pre >= 0)) (PreH14 : (output_pixels_pre >= 0)) (PreH15 : (retval <= UINT_MAX)) (PreH16 : (retval >= 0)) (PreH17 : (retval = (bits_of_fp32 ((mp_probe_value (F) (PT) (output_pixels_pre) (kernel_elements_pre) (channels_pre) (input_pre) (input_offset_pre) (input_pixel_stride_pre) (input_increment_pre) (output_pre) (output_increment_pre) (lo) (hi) (probe_pre)))))) (PreH18 : (mp_written output_pixels_pre channels_pre output_pre output_increment_pre probe_pre )) (PreH19 : (0 < output_pixels_pre)) (PreH20 : (0 < channels_pre)) (PreH21 : (params_pre <> 0)) (PreH22 : (mp_word64 output_pixels_pre )) (PreH23 : (mp_word64 kernel_elements_pre )) (PreH24 : (mp_word64 channels_pre )) (PreH25 : (mp_word64 input_offset_pre )) (PreH26 : (mp_word64 input_pixel_stride_pre )) (PreH27 : (mp_word64 input_increment_pre )) (PreH28 : (mp_word64 output_increment_pre )) (PreH29 : (mp_word64 input_pre )) (PreH30 : (mp_word64 output_pre )) (PreH31 : (mp_word64 params_pre )) (PreH32 : (mp_geometry F PT W output_pixels_pre kernel_elements_pre channels_pre input_pre input_offset_pre input_pixel_stride_pre input_increment_pre output_pre output_increment_pre )) ,
  ((( &( "after" ) )) # UInt  |->_)
  **  (mp_data F )
  **  (mp_ptr_data PT )
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min")) # Float  |-> lo)
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max")) # Float  |-> hi)
  **  (mp_out W (mp_complete (F) (PT) ((mp_complete (F) (PT) (old) (output_pixels_pre) (kernel_elements_pre) (channels_pre) (input_pre) (input_offset_pre) (input_pixel_stride_pre) (input_increment_pre) (output_pre) (output_increment_pre) (lo) (hi))) (output_pixels_pre) (kernel_elements_pre) (channels_pre) (input_pre) (input_offset_pre) (input_pixel_stride_pre) (input_increment_pre) (output_pre) (output_increment_pre) (lo) (hi)) )
  **  ((( &( "before" ) )) # UInt  |-> retval)
  **  ((( &( "output_pixels" ) )) # UInt64  |-> output_pixels_pre)
  **  ((( &( "kernel_elements" ) )) # UInt64  |-> kernel_elements_pre)
  **  ((( &( "channels" ) )) # UInt64  |-> channels_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "input_offset" ) )) # UInt64  |-> input_offset_pre)
  **  ((( &( "input_pixel_stride" ) )) # UInt64  |-> input_pixel_stride_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "input_increment" ) )) # UInt64  |-> input_increment_pre)
  **  ((( &( "output_increment" ) )) # UInt64  |-> output_increment_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "probe" ) )) # Ptr  |-> probe_pre)
|--
  “ (probe_pre <> 0) ”
.

Definition compare_maxpool_written_partial_solve_wit_4_pure_split_goal_2 := 
forall (probe_pre: Z) (params_pre: Z) (output_increment_pre: Z) (input_increment_pre: Z) (output_pre: Z) (input_pixel_stride_pre: Z) (input_offset_pre: Z) (input_pre: Z) (channels_pre: Z) (kernel_elements_pre: Z) (output_pixels_pre: Z) (hi: fp32) (lo: fp32) (old: MPOutput) (W: (@list Z)) (PT: MPPtrMap) (F: MPFloatMap) (retval: Z) (PreH1 : (output_increment_pre <= UINT64_MAX)) (PreH2 : (input_increment_pre <= UINT64_MAX)) (PreH3 : (input_pixel_stride_pre <= UINT64_MAX)) (PreH4 : (input_offset_pre <= UINT64_MAX)) (PreH5 : (channels_pre <= UINT64_MAX)) (PreH6 : (kernel_elements_pre <= UINT64_MAX)) (PreH7 : (output_pixels_pre <= UINT64_MAX)) (PreH8 : (output_increment_pre >= 0)) (PreH9 : (input_increment_pre >= 0)) (PreH10 : (input_pixel_stride_pre >= 0)) (PreH11 : (input_offset_pre >= 0)) (PreH12 : (channels_pre >= 0)) (PreH13 : (kernel_elements_pre >= 0)) (PreH14 : (output_pixels_pre >= 0)) (PreH15 : (retval <= UINT_MAX)) (PreH16 : (retval >= 0)) (PreH17 : (retval = (bits_of_fp32 ((mp_probe_value (F) (PT) (output_pixels_pre) (kernel_elements_pre) (channels_pre) (input_pre) (input_offset_pre) (input_pixel_stride_pre) (input_increment_pre) (output_pre) (output_increment_pre) (lo) (hi) (probe_pre)))))) (PreH18 : (mp_written output_pixels_pre channels_pre output_pre output_increment_pre probe_pre )) (PreH19 : (0 < output_pixels_pre)) (PreH20 : (0 < channels_pre)) (PreH21 : (params_pre <> 0)) (PreH22 : (mp_word64 output_pixels_pre )) (PreH23 : (mp_word64 kernel_elements_pre )) (PreH24 : (mp_word64 channels_pre )) (PreH25 : (mp_word64 input_offset_pre )) (PreH26 : (mp_word64 input_pixel_stride_pre )) (PreH27 : (mp_word64 input_increment_pre )) (PreH28 : (mp_word64 output_increment_pre )) (PreH29 : (mp_word64 input_pre )) (PreH30 : (mp_word64 output_pre )) (PreH31 : (mp_word64 params_pre )) (PreH32 : (mp_geometry F PT W output_pixels_pre kernel_elements_pre channels_pre input_pre input_offset_pre input_pixel_stride_pre input_increment_pre output_pre output_increment_pre )) ,
  ((( &( "after" ) )) # UInt  |->_)
  **  (mp_data F )
  **  (mp_ptr_data PT )
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min")) # Float  |-> lo)
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max")) # Float  |-> hi)
  **  (mp_out W (mp_complete (F) (PT) ((mp_complete (F) (PT) (old) (output_pixels_pre) (kernel_elements_pre) (channels_pre) (input_pre) (input_offset_pre) (input_pixel_stride_pre) (input_increment_pre) (output_pre) (output_increment_pre) (lo) (hi))) (output_pixels_pre) (kernel_elements_pre) (channels_pre) (input_pre) (input_offset_pre) (input_pixel_stride_pre) (input_increment_pre) (output_pre) (output_increment_pre) (lo) (hi)) )
  **  ((( &( "before" ) )) # UInt  |-> retval)
  **  ((( &( "output_pixels" ) )) # UInt64  |-> output_pixels_pre)
  **  ((( &( "kernel_elements" ) )) # UInt64  |-> kernel_elements_pre)
  **  ((( &( "channels" ) )) # UInt64  |-> channels_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "input_offset" ) )) # UInt64  |-> input_offset_pre)
  **  ((( &( "input_pixel_stride" ) )) # UInt64  |-> input_pixel_stride_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "input_increment" ) )) # UInt64  |-> input_increment_pre)
  **  ((( &( "output_increment" ) )) # UInt64  |-> output_increment_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "probe" ) )) # Ptr  |-> probe_pre)
|--
  “ (mp_write_window W probe_pre 4 ) ”
.

Definition compare_maxpool_written_partial_solve_wit_4_pure_split_goal_3 := 
forall (probe_pre: Z) (params_pre: Z) (output_increment_pre: Z) (input_increment_pre: Z) (output_pre: Z) (input_pixel_stride_pre: Z) (input_offset_pre: Z) (input_pre: Z) (channels_pre: Z) (kernel_elements_pre: Z) (output_pixels_pre: Z) (hi: fp32) (lo: fp32) (old: MPOutput) (W: (@list Z)) (PT: MPPtrMap) (F: MPFloatMap) (retval: Z) (PreH1 : (output_increment_pre <= UINT64_MAX)) (PreH2 : (input_increment_pre <= UINT64_MAX)) (PreH3 : (input_pixel_stride_pre <= UINT64_MAX)) (PreH4 : (input_offset_pre <= UINT64_MAX)) (PreH5 : (channels_pre <= UINT64_MAX)) (PreH6 : (kernel_elements_pre <= UINT64_MAX)) (PreH7 : (output_pixels_pre <= UINT64_MAX)) (PreH8 : (output_increment_pre >= 0)) (PreH9 : (input_increment_pre >= 0)) (PreH10 : (input_pixel_stride_pre >= 0)) (PreH11 : (input_offset_pre >= 0)) (PreH12 : (channels_pre >= 0)) (PreH13 : (kernel_elements_pre >= 0)) (PreH14 : (output_pixels_pre >= 0)) (PreH15 : (retval <= UINT_MAX)) (PreH16 : (retval >= 0)) (PreH17 : (retval = (bits_of_fp32 ((mp_probe_value (F) (PT) (output_pixels_pre) (kernel_elements_pre) (channels_pre) (input_pre) (input_offset_pre) (input_pixel_stride_pre) (input_increment_pre) (output_pre) (output_increment_pre) (lo) (hi) (probe_pre)))))) (PreH18 : (mp_written output_pixels_pre channels_pre output_pre output_increment_pre probe_pre )) (PreH19 : (0 < output_pixels_pre)) (PreH20 : (0 < channels_pre)) (PreH21 : (params_pre <> 0)) (PreH22 : (mp_word64 output_pixels_pre )) (PreH23 : (mp_word64 kernel_elements_pre )) (PreH24 : (mp_word64 channels_pre )) (PreH25 : (mp_word64 input_offset_pre )) (PreH26 : (mp_word64 input_pixel_stride_pre )) (PreH27 : (mp_word64 input_increment_pre )) (PreH28 : (mp_word64 output_increment_pre )) (PreH29 : (mp_word64 input_pre )) (PreH30 : (mp_word64 output_pre )) (PreH31 : (mp_word64 params_pre )) (PreH32 : (mp_geometry F PT W output_pixels_pre kernel_elements_pre channels_pre input_pre input_offset_pre input_pixel_stride_pre input_increment_pre output_pre output_increment_pre )) ,
  ((( &( "after" ) )) # UInt  |->_)
  **  (mp_data F )
  **  (mp_ptr_data PT )
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min")) # Float  |-> lo)
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max")) # Float  |-> hi)
  **  (mp_out W (mp_complete (F) (PT) ((mp_complete (F) (PT) (old) (output_pixels_pre) (kernel_elements_pre) (channels_pre) (input_pre) (input_offset_pre) (input_pixel_stride_pre) (input_increment_pre) (output_pre) (output_increment_pre) (lo) (hi))) (output_pixels_pre) (kernel_elements_pre) (channels_pre) (input_pre) (input_offset_pre) (input_pixel_stride_pre) (input_increment_pre) (output_pre) (output_increment_pre) (lo) (hi)) )
  **  ((( &( "before" ) )) # UInt  |-> retval)
  **  ((( &( "output_pixels" ) )) # UInt64  |-> output_pixels_pre)
  **  ((( &( "kernel_elements" ) )) # UInt64  |-> kernel_elements_pre)
  **  ((( &( "channels" ) )) # UInt64  |-> channels_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "input_offset" ) )) # UInt64  |-> input_offset_pre)
  **  ((( &( "input_pixel_stride" ) )) # UInt64  |-> input_pixel_stride_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "input_increment" ) )) # UInt64  |-> input_increment_pre)
  **  ((( &( "output_increment" ) )) # UInt64  |-> output_increment_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "probe" ) )) # Ptr  |-> probe_pre)
|--
  “ (mp_out_known (mp_complete (F) (PT) ((mp_complete (F) (PT) (old) (output_pixels_pre) (kernel_elements_pre) (channels_pre) (input_pre) (input_offset_pre) (input_pixel_stride_pre) (input_increment_pre) (output_pre) (output_increment_pre) (lo) (hi))) (output_pixels_pre) (kernel_elements_pre) (channels_pre) (input_pre) (input_offset_pre) (input_pixel_stride_pre) (input_increment_pre) (output_pre) (output_increment_pre) (lo) (hi)) probe_pre (mp_probe_value (F) (PT) (output_pixels_pre) (kernel_elements_pre) (channels_pre) (input_pre) (input_offset_pre) (input_pixel_stride_pre) (input_increment_pre) (output_pre) (output_increment_pre) (lo) (hi) (probe_pre)) ) ”
.

Definition compare_maxpool_written_partial_solve_wit_4_aux := 
forall (probe_pre: Z) (params_pre: Z) (output_increment_pre: Z) (input_increment_pre: Z) (output_pre: Z) (input_pixel_stride_pre: Z) (input_offset_pre: Z) (input_pre: Z) (channels_pre: Z) (kernel_elements_pre: Z) (output_pixels_pre: Z) (hi: fp32) (lo: fp32) (old: MPOutput) (W: (@list Z)) (PT: MPPtrMap) (F: MPFloatMap) (retval: Z) (PreH1 : (retval = (bits_of_fp32 ((mp_probe_value (F) (PT) (output_pixels_pre) (kernel_elements_pre) (channels_pre) (input_pre) (input_offset_pre) (input_pixel_stride_pre) (input_increment_pre) (output_pre) (output_increment_pre) (lo) (hi) (probe_pre)))))) (PreH2 : (mp_written output_pixels_pre channels_pre output_pre output_increment_pre probe_pre )) (PreH3 : (0 < output_pixels_pre)) (PreH4 : (0 < channels_pre)) (PreH5 : (params_pre <> 0)) (PreH6 : (mp_word64 output_pixels_pre )) (PreH7 : (mp_word64 kernel_elements_pre )) (PreH8 : (mp_word64 channels_pre )) (PreH9 : (mp_word64 input_offset_pre )) (PreH10 : (mp_word64 input_pixel_stride_pre )) (PreH11 : (mp_word64 input_increment_pre )) (PreH12 : (mp_word64 output_increment_pre )) (PreH13 : (mp_word64 input_pre )) (PreH14 : (mp_word64 output_pre )) (PreH15 : (mp_word64 params_pre )) (PreH16 : (mp_geometry F PT W output_pixels_pre kernel_elements_pre channels_pre input_pre input_offset_pre input_pixel_stride_pre input_increment_pre output_pre output_increment_pre )) ,
  (mp_data F )
  **  (mp_ptr_data PT )
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min")) # Float  |-> lo)
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max")) # Float  |-> hi)
  **  (mp_out W (mp_complete (F) (PT) ((mp_complete (F) (PT) (old) (output_pixels_pre) (kernel_elements_pre) (channels_pre) (input_pre) (input_offset_pre) (input_pixel_stride_pre) (input_increment_pre) (output_pre) (output_increment_pre) (lo) (hi))) (output_pixels_pre) (kernel_elements_pre) (channels_pre) (input_pre) (input_offset_pre) (input_pixel_stride_pre) (input_increment_pre) (output_pre) (output_increment_pre) (lo) (hi)) )
|--
  “ (mp_out_known (mp_complete (F) (PT) ((mp_complete (F) (PT) (old) (output_pixels_pre) (kernel_elements_pre) (channels_pre) (input_pre) (input_offset_pre) (input_pixel_stride_pre) (input_increment_pre) (output_pre) (output_increment_pre) (lo) (hi))) (output_pixels_pre) (kernel_elements_pre) (channels_pre) (input_pre) (input_offset_pre) (input_pixel_stride_pre) (input_increment_pre) (output_pre) (output_increment_pre) (lo) (hi)) probe_pre (mp_probe_value (F) (PT) (output_pixels_pre) (kernel_elements_pre) (channels_pre) (input_pre) (input_offset_pre) (input_pixel_stride_pre) (input_increment_pre) (output_pre) (output_increment_pre) (lo) (hi) (probe_pre)) ) ” 
  &&  “ (mp_write_window W probe_pre 4 ) ” 
  &&  “ (probe_pre <> 0) ” 
  &&  “ (retval = (bits_of_fp32 ((mp_probe_value (F) (PT) (output_pixels_pre) (kernel_elements_pre) (channels_pre) (input_pre) (input_offset_pre) (input_pixel_stride_pre) (input_increment_pre) (output_pre) (output_increment_pre) (lo) (hi) (probe_pre))))) ” 
  &&  “ (mp_written output_pixels_pre channels_pre output_pre output_increment_pre probe_pre ) ” 
  &&  “ (0 < output_pixels_pre) ” 
  &&  “ (0 < channels_pre) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (mp_word64 output_pixels_pre ) ” 
  &&  “ (mp_word64 kernel_elements_pre ) ” 
  &&  “ (mp_word64 channels_pre ) ” 
  &&  “ (mp_word64 input_offset_pre ) ” 
  &&  “ (mp_word64 input_pixel_stride_pre ) ” 
  &&  “ (mp_word64 input_increment_pre ) ” 
  &&  “ (mp_word64 output_increment_pre ) ” 
  &&  “ (mp_word64 input_pre ) ” 
  &&  “ (mp_word64 output_pre ) ” 
  &&  “ (mp_word64 params_pre ) ” 
  &&  “ (mp_geometry F PT W output_pixels_pre kernel_elements_pre channels_pre input_pre input_offset_pre input_pixel_stride_pre input_increment_pre output_pre output_increment_pre ) ”
  &&  (mp_out W (mp_complete (F) (PT) ((mp_complete (F) (PT) (old) (output_pixels_pre) (kernel_elements_pre) (channels_pre) (input_pre) (input_offset_pre) (input_pixel_stride_pre) (input_increment_pre) (output_pre) (output_increment_pre) (lo) (hi))) (output_pixels_pre) (kernel_elements_pre) (channels_pre) (input_pre) (input_offset_pre) (input_pixel_stride_pre) (input_increment_pre) (output_pre) (output_increment_pre) (lo) (hi)) )
  **  (mp_data F )
  **  (mp_ptr_data PT )
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min")) # Float  |-> lo)
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max")) # Float  |-> hi)
.

Definition compare_maxpool_written_partial_solve_wit_4 := compare_maxpool_written_partial_solve_wit_4_pure -> compare_maxpool_written_partial_solve_wit_4_aux.

Module Type VC_Correct.


Axiom proof_of_compare_maxpool_written_safety_wit_1 : compare_maxpool_written_safety_wit_1.
Axiom proof_of_compare_maxpool_written_return_wit_1 : compare_maxpool_written_return_wit_1.
Axiom proof_of_compare_maxpool_written_partial_solve_wit_1_pure : compare_maxpool_written_partial_solve_wit_1_pure.
Axiom proof_of_compare_maxpool_written_partial_solve_wit_1 : compare_maxpool_written_partial_solve_wit_1.
Axiom proof_of_compare_maxpool_written_partial_solve_wit_2_pure : compare_maxpool_written_partial_solve_wit_2_pure.
Axiom proof_of_compare_maxpool_written_partial_solve_wit_2 : compare_maxpool_written_partial_solve_wit_2.
Axiom proof_of_compare_maxpool_written_partial_solve_wit_3_pure : compare_maxpool_written_partial_solve_wit_3_pure.
Axiom proof_of_compare_maxpool_written_partial_solve_wit_3 : compare_maxpool_written_partial_solve_wit_3.
Axiom proof_of_compare_maxpool_written_partial_solve_wit_4_pure : compare_maxpool_written_partial_solve_wit_4_pure.
Axiom proof_of_compare_maxpool_written_partial_solve_wit_4 : compare_maxpool_written_partial_solve_wit_4.

End VC_Correct.
