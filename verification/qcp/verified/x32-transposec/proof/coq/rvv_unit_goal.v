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
Require Import X32Transpose.VectorModel.
Require Import X32Transpose.ProgramModel.
Require Import X32Transpose.StrideModel.
Require Import X32Transpose.ProgramModel.
Local Open Scope sac.

(*----- Function test_rvv -----*)

Definition test_rvv_safety_wit_1 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (xt_valid F W G )) (PreH2 : (input = (xt_input (G)))) (PreH3 : (output = (xt_output_base (G)))) (PreH4 : (input_stride = (xt_input_stride (G)))) (PreH5 : (output_stride = (xt_output_stride (G)))) (PreH6 : (block_width = (xt_width (G)))) (PreH7 : (block_height = (xt_height (G)))) (PreH8 : (sizeof(UINT) = 4)) (PreH9 : (sizeof(UINT64) = 8)) (PreH10 : (sizeof(UINT64) = 8)) (PreH11 : (block_width = 1)) (PreH12 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition test_rvv_safety_wit_2 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_width <> 1)) (PreH2 : (xt_valid F W G )) (PreH3 : (input = (xt_input (G)))) (PreH4 : (output = (xt_output_base (G)))) (PreH5 : (input_stride = (xt_input_stride (G)))) (PreH6 : (output_stride = (xt_output_stride (G)))) (PreH7 : (block_width = (xt_width (G)))) (PreH8 : (block_height = (xt_height (G)))) (PreH9 : (sizeof(UINT) = 4)) (PreH10 : (sizeof(UINT64) = 8)) (PreH11 : (sizeof(UINT64) = 8)) (PreH12 : (block_width = 1)) (PreH13 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ False ”
.

Definition test_rvv_safety_wit_3 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (xt_valid F W G )) (PreH2 : (input = (xt_input (G)))) (PreH3 : (output = (xt_output_base (G)))) (PreH4 : (input_stride = (xt_input_stride (G)))) (PreH5 : (output_stride = (xt_output_stride (G)))) (PreH6 : (block_width = (xt_width (G)))) (PreH7 : (block_height = (xt_height (G)))) (PreH8 : (sizeof(UINT) = 4)) (PreH9 : (sizeof(UINT64) = 8)) (PreH10 : (sizeof(UINT64) = 8)) (PreH11 : (block_width = 1)) (PreH12 : (block_height = 1)) ,
  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition test_rvv_safety_wit_4 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_width <> 1)) (PreH2 : (xt_valid F W G )) (PreH3 : (input = (xt_input (G)))) (PreH4 : (output = (xt_output_base (G)))) (PreH5 : (input_stride = (xt_input_stride (G)))) (PreH6 : (output_stride = (xt_output_stride (G)))) (PreH7 : (block_width = (xt_width (G)))) (PreH8 : (block_height = (xt_height (G)))) (PreH9 : (sizeof(UINT) = 4)) (PreH10 : (sizeof(UINT64) = 8)) (PreH11 : (sizeof(UINT64) = 8)) (PreH12 : (block_width = 1)) (PreH13 : (block_height = 1)) ,
  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ False ”
.

Definition test_rvv_safety_wit_5 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (xt_valid F W G )) (PreH2 : (input = (xt_input (G)))) (PreH3 : (output = (xt_output_base (G)))) (PreH4 : (input_stride = (xt_input_stride (G)))) (PreH5 : (output_stride = (xt_output_stride (G)))) (PreH6 : (block_width = (xt_width (G)))) (PreH7 : (block_height = (xt_height (G)))) (PreH8 : (sizeof(UINT) = 4)) (PreH9 : (sizeof(UINT64) = 8)) (PreH10 : (sizeof(UINT64) = 8)) (PreH11 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH12 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition test_rvv_safety_wit_6 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (output_stride < (unsigned_last_nbits ((block_height * sizeof(UINT) )) (64)))) (PreH2 : (block_width <> 1)) (PreH3 : (xt_valid F W G )) (PreH4 : (input = (xt_input (G)))) (PreH5 : (output = (xt_output_base (G)))) (PreH6 : (input_stride = (xt_input_stride (G)))) (PreH7 : (output_stride = (xt_output_stride (G)))) (PreH8 : (block_width = (xt_width (G)))) (PreH9 : (block_height = (xt_height (G)))) (PreH10 : (sizeof(UINT) = 4)) (PreH11 : (sizeof(UINT64) = 8)) (PreH12 : (sizeof(UINT64) = 8)) (PreH13 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH14 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ False ”
.

Definition test_rvv_safety_wit_7 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (xt_valid F W G )) (PreH2 : (input = (xt_input (G)))) (PreH3 : (output = (xt_output_base (G)))) (PreH4 : (input_stride = (xt_input_stride (G)))) (PreH5 : (output_stride = (xt_output_stride (G)))) (PreH6 : (block_width = (xt_width (G)))) (PreH7 : (block_height = (xt_height (G)))) (PreH8 : (sizeof(UINT) = 4)) (PreH9 : (sizeof(UINT64) = 8)) (PreH10 : (sizeof(UINT64) = 8)) (PreH11 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH12 : (block_height = 1)) ,
  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition test_rvv_safety_wit_8 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (output_stride < (block_height * sizeof(UINT) ))) (PreH2 : (block_width <> 1)) (PreH3 : (xt_valid F W G )) (PreH4 : (input = (xt_input (G)))) (PreH5 : (output = (xt_output_base (G)))) (PreH6 : (input_stride = (xt_input_stride (G)))) (PreH7 : (output_stride = (xt_output_stride (G)))) (PreH8 : (block_width = (xt_width (G)))) (PreH9 : (block_height = (xt_height (G)))) (PreH10 : (sizeof(UINT) = 4)) (PreH11 : (sizeof(UINT64) = 8)) (PreH12 : (sizeof(UINT64) = 8)) (PreH13 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH14 : (block_height = 1)) ,
  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ False ”
.

Definition test_rvv_safety_wit_9 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_width = 1)) (PreH2 : (xt_valid F W G )) (PreH3 : (input = (xt_input (G)))) (PreH4 : (output = (xt_output_base (G)))) (PreH5 : (input_stride = (xt_input_stride (G)))) (PreH6 : (output_stride = (xt_output_stride (G)))) (PreH7 : (block_width = (xt_width (G)))) (PreH8 : (block_height = (xt_height (G)))) (PreH9 : (sizeof(UINT) = 4)) (PreH10 : (sizeof(UINT64) = 8)) (PreH11 : (sizeof(UINT64) = 8)) (PreH12 : (block_width = 1)) (PreH13 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition test_rvv_safety_wit_10 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (input_stride < (block_width * sizeof(UINT) ))) (PreH2 : (block_height <> 1)) (PreH3 : (block_width = 1)) (PreH4 : (xt_valid F W G )) (PreH5 : (input = (xt_input (G)))) (PreH6 : (output = (xt_output_base (G)))) (PreH7 : (input_stride = (xt_input_stride (G)))) (PreH8 : (output_stride = (xt_output_stride (G)))) (PreH9 : (block_width = (xt_width (G)))) (PreH10 : (block_height = (xt_height (G)))) (PreH11 : (sizeof(UINT) = 4)) (PreH12 : (sizeof(UINT64) = 8)) (PreH13 : (sizeof(UINT64) = 8)) (PreH14 : (block_width = 1)) (PreH15 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ False ”
.

Definition test_rvv_safety_wit_11 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_width = 1)) (PreH2 : (xt_valid F W G )) (PreH3 : (input = (xt_input (G)))) (PreH4 : (output = (xt_output_base (G)))) (PreH5 : (input_stride = (xt_input_stride (G)))) (PreH6 : (output_stride = (xt_output_stride (G)))) (PreH7 : (block_width = (xt_width (G)))) (PreH8 : (block_height = (xt_height (G)))) (PreH9 : (sizeof(UINT) = 4)) (PreH10 : (sizeof(UINT64) = 8)) (PreH11 : (sizeof(UINT64) = 8)) (PreH12 : (block_width = 1)) (PreH13 : (block_height = 1)) ,
  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition test_rvv_safety_wit_12 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height <> 1)) (PreH2 : (block_width = 1)) (PreH3 : (xt_valid F W G )) (PreH4 : (input = (xt_input (G)))) (PreH5 : (output = (xt_output_base (G)))) (PreH6 : (input_stride = (xt_input_stride (G)))) (PreH7 : (output_stride = (xt_output_stride (G)))) (PreH8 : (block_width = (xt_width (G)))) (PreH9 : (block_height = (xt_height (G)))) (PreH10 : (sizeof(UINT) = 4)) (PreH11 : (sizeof(UINT64) = 8)) (PreH12 : (sizeof(UINT64) = 8)) (PreH13 : (block_width = 1)) (PreH14 : (block_height = 1)) ,
  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ False ”
.

Definition test_rvv_safety_wit_13 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_width = 1)) (PreH2 : (xt_valid F W G )) (PreH3 : (input = (xt_input (G)))) (PreH4 : (output = (xt_output_base (G)))) (PreH5 : (input_stride = (xt_input_stride (G)))) (PreH6 : (output_stride = (xt_output_stride (G)))) (PreH7 : (block_width = (xt_width (G)))) (PreH8 : (block_height = (xt_height (G)))) (PreH9 : (sizeof(UINT) = 4)) (PreH10 : (sizeof(UINT64) = 8)) (PreH11 : (sizeof(UINT64) = 8)) (PreH12 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH13 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition test_rvv_safety_wit_14 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (input_stride < (block_width * sizeof(UINT) ))) (PreH2 : (block_height <> 1)) (PreH3 : (block_width = 1)) (PreH4 : (xt_valid F W G )) (PreH5 : (input = (xt_input (G)))) (PreH6 : (output = (xt_output_base (G)))) (PreH7 : (input_stride = (xt_input_stride (G)))) (PreH8 : (output_stride = (xt_output_stride (G)))) (PreH9 : (block_width = (xt_width (G)))) (PreH10 : (block_height = (xt_height (G)))) (PreH11 : (sizeof(UINT) = 4)) (PreH12 : (sizeof(UINT64) = 8)) (PreH13 : (sizeof(UINT64) = 8)) (PreH14 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH15 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ False ”
.

Definition test_rvv_safety_wit_15 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (output_stride >= (unsigned_last_nbits ((block_height * sizeof(UINT) )) (64)))) (PreH2 : (block_width <> 1)) (PreH3 : (xt_valid F W G )) (PreH4 : (input = (xt_input (G)))) (PreH5 : (output = (xt_output_base (G)))) (PreH6 : (input_stride = (xt_input_stride (G)))) (PreH7 : (output_stride = (xt_output_stride (G)))) (PreH8 : (block_width = (xt_width (G)))) (PreH9 : (block_height = (xt_height (G)))) (PreH10 : (sizeof(UINT) = 4)) (PreH11 : (sizeof(UINT64) = 8)) (PreH12 : (sizeof(UINT64) = 8)) (PreH13 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH14 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition test_rvv_safety_wit_16 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (input_stride < (unsigned_last_nbits ((block_width * sizeof(UINT) )) (64)))) (PreH2 : (block_height <> 1)) (PreH3 : (output_stride >= (unsigned_last_nbits ((block_height * sizeof(UINT) )) (64)))) (PreH4 : (block_width <> 1)) (PreH5 : (xt_valid F W G )) (PreH6 : (input = (xt_input (G)))) (PreH7 : (output = (xt_output_base (G)))) (PreH8 : (input_stride = (xt_input_stride (G)))) (PreH9 : (output_stride = (xt_output_stride (G)))) (PreH10 : (block_width = (xt_width (G)))) (PreH11 : (block_height = (xt_height (G)))) (PreH12 : (sizeof(UINT) = 4)) (PreH13 : (sizeof(UINT64) = 8)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH16 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ False ”
.

Definition test_rvv_safety_wit_17 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_width = 1)) (PreH2 : (xt_valid F W G )) (PreH3 : (input = (xt_input (G)))) (PreH4 : (output = (xt_output_base (G)))) (PreH5 : (input_stride = (xt_input_stride (G)))) (PreH6 : (output_stride = (xt_output_stride (G)))) (PreH7 : (block_width = (xt_width (G)))) (PreH8 : (block_height = (xt_height (G)))) (PreH9 : (sizeof(UINT) = 4)) (PreH10 : (sizeof(UINT64) = 8)) (PreH11 : (sizeof(UINT64) = 8)) (PreH12 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH13 : (block_height = 1)) ,
  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition test_rvv_safety_wit_18 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height <> 1)) (PreH2 : (block_width = 1)) (PreH3 : (xt_valid F W G )) (PreH4 : (input = (xt_input (G)))) (PreH5 : (output = (xt_output_base (G)))) (PreH6 : (input_stride = (xt_input_stride (G)))) (PreH7 : (output_stride = (xt_output_stride (G)))) (PreH8 : (block_width = (xt_width (G)))) (PreH9 : (block_height = (xt_height (G)))) (PreH10 : (sizeof(UINT) = 4)) (PreH11 : (sizeof(UINT64) = 8)) (PreH12 : (sizeof(UINT64) = 8)) (PreH13 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH14 : (block_height = 1)) ,
  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ False ”
.

Definition test_rvv_safety_wit_19 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (output_stride >= (block_height * sizeof(UINT) ))) (PreH2 : (block_width <> 1)) (PreH3 : (xt_valid F W G )) (PreH4 : (input = (xt_input (G)))) (PreH5 : (output = (xt_output_base (G)))) (PreH6 : (input_stride = (xt_input_stride (G)))) (PreH7 : (output_stride = (xt_output_stride (G)))) (PreH8 : (block_width = (xt_width (G)))) (PreH9 : (block_height = (xt_height (G)))) (PreH10 : (sizeof(UINT) = 4)) (PreH11 : (sizeof(UINT64) = 8)) (PreH12 : (sizeof(UINT64) = 8)) (PreH13 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH14 : (block_height = 1)) ,
  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition test_rvv_safety_wit_20 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height <> 1)) (PreH2 : (output_stride >= (block_height * sizeof(UINT) ))) (PreH3 : (block_width <> 1)) (PreH4 : (xt_valid F W G )) (PreH5 : (input = (xt_input (G)))) (PreH6 : (output = (xt_output_base (G)))) (PreH7 : (input_stride = (xt_input_stride (G)))) (PreH8 : (output_stride = (xt_output_stride (G)))) (PreH9 : (block_width = (xt_width (G)))) (PreH10 : (block_height = (xt_height (G)))) (PreH11 : (sizeof(UINT) = 4)) (PreH12 : (sizeof(UINT64) = 8)) (PreH13 : (sizeof(UINT64) = 8)) (PreH14 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH15 : (block_height = 1)) ,
  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ False ”
.

Definition test_rvv_safety_wit_21 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height = 1)) (PreH2 : (block_width = 1)) (PreH3 : (xt_valid F W G )) (PreH4 : (input = (xt_input (G)))) (PreH5 : (output = (xt_output_base (G)))) (PreH6 : (input_stride = (xt_input_stride (G)))) (PreH7 : (output_stride = (xt_output_stride (G)))) (PreH8 : (block_width = (xt_width (G)))) (PreH9 : (block_height = (xt_height (G)))) (PreH10 : (sizeof(UINT) = 4)) (PreH11 : (sizeof(UINT64) = 8)) (PreH12 : (sizeof(UINT64) = 8)) (PreH13 : (block_width = 1)) (PreH14 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  ((( &( "bw" ) )) # UInt64  |-> block_width)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition test_rvv_safety_wit_22 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (input_stride >= (block_width * sizeof(UINT) ))) (PreH2 : (block_height <> 1)) (PreH3 : (block_width = 1)) (PreH4 : (xt_valid F W G )) (PreH5 : (input = (xt_input (G)))) (PreH6 : (output = (xt_output_base (G)))) (PreH7 : (input_stride = (xt_input_stride (G)))) (PreH8 : (output_stride = (xt_output_stride (G)))) (PreH9 : (block_width = (xt_width (G)))) (PreH10 : (block_height = (xt_height (G)))) (PreH11 : (sizeof(UINT) = 4)) (PreH12 : (sizeof(UINT64) = 8)) (PreH13 : (sizeof(UINT64) = 8)) (PreH14 : (block_width = 1)) (PreH15 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  ((( &( "bw" ) )) # UInt64  |-> block_width)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition test_rvv_safety_wit_23 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height = 1)) (PreH2 : (block_width = 1)) (PreH3 : (xt_valid F W G )) (PreH4 : (input = (xt_input (G)))) (PreH5 : (output = (xt_output_base (G)))) (PreH6 : (input_stride = (xt_input_stride (G)))) (PreH7 : (output_stride = (xt_output_stride (G)))) (PreH8 : (block_width = (xt_width (G)))) (PreH9 : (block_height = (xt_height (G)))) (PreH10 : (sizeof(UINT) = 4)) (PreH11 : (sizeof(UINT64) = 8)) (PreH12 : (sizeof(UINT64) = 8)) (PreH13 : (block_width = 1)) (PreH14 : (block_height = 1)) ,
  ((( &( "bw" ) )) # UInt64  |-> block_width)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition test_rvv_safety_wit_24 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height = 1)) (PreH2 : (block_width = 1)) (PreH3 : (xt_valid F W G )) (PreH4 : (input = (xt_input (G)))) (PreH5 : (output = (xt_output_base (G)))) (PreH6 : (input_stride = (xt_input_stride (G)))) (PreH7 : (output_stride = (xt_output_stride (G)))) (PreH8 : (block_width = (xt_width (G)))) (PreH9 : (block_height = (xt_height (G)))) (PreH10 : (sizeof(UINT) = 4)) (PreH11 : (sizeof(UINT64) = 8)) (PreH12 : (sizeof(UINT64) = 8)) (PreH13 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH14 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  ((( &( "bw" ) )) # UInt64  |-> block_width)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition test_rvv_safety_wit_25 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (input_stride >= (block_width * sizeof(UINT) ))) (PreH2 : (block_height <> 1)) (PreH3 : (block_width = 1)) (PreH4 : (xt_valid F W G )) (PreH5 : (input = (xt_input (G)))) (PreH6 : (output = (xt_output_base (G)))) (PreH7 : (input_stride = (xt_input_stride (G)))) (PreH8 : (output_stride = (xt_output_stride (G)))) (PreH9 : (block_width = (xt_width (G)))) (PreH10 : (block_height = (xt_height (G)))) (PreH11 : (sizeof(UINT) = 4)) (PreH12 : (sizeof(UINT64) = 8)) (PreH13 : (sizeof(UINT64) = 8)) (PreH14 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH15 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  ((( &( "bw" ) )) # UInt64  |-> block_width)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition test_rvv_safety_wit_26 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height = 1)) (PreH2 : (output_stride >= (unsigned_last_nbits ((block_height * sizeof(UINT) )) (64)))) (PreH3 : (block_width <> 1)) (PreH4 : (xt_valid F W G )) (PreH5 : (input = (xt_input (G)))) (PreH6 : (output = (xt_output_base (G)))) (PreH7 : (input_stride = (xt_input_stride (G)))) (PreH8 : (output_stride = (xt_output_stride (G)))) (PreH9 : (block_width = (xt_width (G)))) (PreH10 : (block_height = (xt_height (G)))) (PreH11 : (sizeof(UINT) = 4)) (PreH12 : (sizeof(UINT64) = 8)) (PreH13 : (sizeof(UINT64) = 8)) (PreH14 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH15 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  ((( &( "bw" ) )) # UInt64  |-> block_width)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition test_rvv_safety_wit_27 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (input_stride >= (unsigned_last_nbits ((block_width * sizeof(UINT) )) (64)))) (PreH2 : (block_height <> 1)) (PreH3 : (output_stride >= (unsigned_last_nbits ((block_height * sizeof(UINT) )) (64)))) (PreH4 : (block_width <> 1)) (PreH5 : (xt_valid F W G )) (PreH6 : (input = (xt_input (G)))) (PreH7 : (output = (xt_output_base (G)))) (PreH8 : (input_stride = (xt_input_stride (G)))) (PreH9 : (output_stride = (xt_output_stride (G)))) (PreH10 : (block_width = (xt_width (G)))) (PreH11 : (block_height = (xt_height (G)))) (PreH12 : (sizeof(UINT) = 4)) (PreH13 : (sizeof(UINT64) = 8)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH16 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  ((( &( "bw" ) )) # UInt64  |-> block_width)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition test_rvv_safety_wit_28 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height = 1)) (PreH2 : (block_width = 1)) (PreH3 : (xt_valid F W G )) (PreH4 : (input = (xt_input (G)))) (PreH5 : (output = (xt_output_base (G)))) (PreH6 : (input_stride = (xt_input_stride (G)))) (PreH7 : (output_stride = (xt_output_stride (G)))) (PreH8 : (block_width = (xt_width (G)))) (PreH9 : (block_height = (xt_height (G)))) (PreH10 : (sizeof(UINT) = 4)) (PreH11 : (sizeof(UINT64) = 8)) (PreH12 : (sizeof(UINT64) = 8)) (PreH13 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH14 : (block_height = 1)) ,
  ((( &( "bw" ) )) # UInt64  |-> block_width)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition test_rvv_safety_wit_29 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height = 1)) (PreH2 : (output_stride >= (block_height * sizeof(UINT) ))) (PreH3 : (block_width <> 1)) (PreH4 : (xt_valid F W G )) (PreH5 : (input = (xt_input (G)))) (PreH6 : (output = (xt_output_base (G)))) (PreH7 : (input_stride = (xt_input_stride (G)))) (PreH8 : (output_stride = (xt_output_stride (G)))) (PreH9 : (block_width = (xt_width (G)))) (PreH10 : (block_height = (xt_height (G)))) (PreH11 : (sizeof(UINT) = 4)) (PreH12 : (sizeof(UINT64) = 8)) (PreH13 : (sizeof(UINT64) = 8)) (PreH14 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH15 : (block_height = 1)) ,
  ((( &( "bw" ) )) # UInt64  |-> block_width)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition test_rvv_safety_wit_30 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_width = 0)) (PreH2 : (block_height = 1)) (PreH3 : (block_width = 1)) (PreH4 : (xt_valid F W G )) (PreH5 : (input = (xt_input (G)))) (PreH6 : (output = (xt_output_base (G)))) (PreH7 : (input_stride = (xt_input_stride (G)))) (PreH8 : (output_stride = (xt_output_stride (G)))) (PreH9 : (block_width = (xt_width (G)))) (PreH10 : (block_height = (xt_height (G)))) (PreH11 : (sizeof(UINT) = 4)) (PreH12 : (sizeof(UINT64) = 8)) (PreH13 : (sizeof(UINT64) = 8)) (PreH14 : (block_width = 1)) (PreH15 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  ((( &( "bw" ) )) # UInt64  |-> block_width)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ False ”
.

Definition test_rvv_safety_wit_31 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_width = 0)) (PreH2 : (input_stride >= (block_width * sizeof(UINT) ))) (PreH3 : (block_height <> 1)) (PreH4 : (block_width = 1)) (PreH5 : (xt_valid F W G )) (PreH6 : (input = (xt_input (G)))) (PreH7 : (output = (xt_output_base (G)))) (PreH8 : (input_stride = (xt_input_stride (G)))) (PreH9 : (output_stride = (xt_output_stride (G)))) (PreH10 : (block_width = (xt_width (G)))) (PreH11 : (block_height = (xt_height (G)))) (PreH12 : (sizeof(UINT) = 4)) (PreH13 : (sizeof(UINT64) = 8)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (block_width = 1)) (PreH16 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  ((( &( "bw" ) )) # UInt64  |-> block_width)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ False ”
.

Definition test_rvv_safety_wit_32 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_width = 0)) (PreH2 : (block_height = 1)) (PreH3 : (block_width = 1)) (PreH4 : (xt_valid F W G )) (PreH5 : (input = (xt_input (G)))) (PreH6 : (output = (xt_output_base (G)))) (PreH7 : (input_stride = (xt_input_stride (G)))) (PreH8 : (output_stride = (xt_output_stride (G)))) (PreH9 : (block_width = (xt_width (G)))) (PreH10 : (block_height = (xt_height (G)))) (PreH11 : (sizeof(UINT) = 4)) (PreH12 : (sizeof(UINT64) = 8)) (PreH13 : (sizeof(UINT64) = 8)) (PreH14 : (block_width = 1)) (PreH15 : (block_height = 1)) ,
  ((( &( "bw" ) )) # UInt64  |-> block_width)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ False ”
.

Definition test_rvv_safety_wit_33 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_width = 0)) (PreH2 : (block_height = 1)) (PreH3 : (block_width = 1)) (PreH4 : (xt_valid F W G )) (PreH5 : (input = (xt_input (G)))) (PreH6 : (output = (xt_output_base (G)))) (PreH7 : (input_stride = (xt_input_stride (G)))) (PreH8 : (output_stride = (xt_output_stride (G)))) (PreH9 : (block_width = (xt_width (G)))) (PreH10 : (block_height = (xt_height (G)))) (PreH11 : (sizeof(UINT) = 4)) (PreH12 : (sizeof(UINT64) = 8)) (PreH13 : (sizeof(UINT64) = 8)) (PreH14 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH15 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  ((( &( "bw" ) )) # UInt64  |-> block_width)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ False ”
.

Definition test_rvv_safety_wit_34 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_width = 0)) (PreH2 : (input_stride >= (block_width * sizeof(UINT) ))) (PreH3 : (block_height <> 1)) (PreH4 : (block_width = 1)) (PreH5 : (xt_valid F W G )) (PreH6 : (input = (xt_input (G)))) (PreH7 : (output = (xt_output_base (G)))) (PreH8 : (input_stride = (xt_input_stride (G)))) (PreH9 : (output_stride = (xt_output_stride (G)))) (PreH10 : (block_width = (xt_width (G)))) (PreH11 : (block_height = (xt_height (G)))) (PreH12 : (sizeof(UINT) = 4)) (PreH13 : (sizeof(UINT64) = 8)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH16 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  ((( &( "bw" ) )) # UInt64  |-> block_width)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ False ”
.

Definition test_rvv_safety_wit_35 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_width = 0)) (PreH2 : (block_height = 1)) (PreH3 : (block_width = 1)) (PreH4 : (xt_valid F W G )) (PreH5 : (input = (xt_input (G)))) (PreH6 : (output = (xt_output_base (G)))) (PreH7 : (input_stride = (xt_input_stride (G)))) (PreH8 : (output_stride = (xt_output_stride (G)))) (PreH9 : (block_width = (xt_width (G)))) (PreH10 : (block_height = (xt_height (G)))) (PreH11 : (sizeof(UINT) = 4)) (PreH12 : (sizeof(UINT64) = 8)) (PreH13 : (sizeof(UINT64) = 8)) (PreH14 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH15 : (block_height = 1)) ,
  ((( &( "bw" ) )) # UInt64  |-> block_width)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ False ”
.

Definition test_rvv_safety_wit_36 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_width = 0)) (PreH2 : (block_height = 1)) (PreH3 : (output_stride >= (unsigned_last_nbits ((block_height * sizeof(UINT) )) (64)))) (PreH4 : (block_width <> 1)) (PreH5 : (xt_valid F W G )) (PreH6 : (input = (xt_input (G)))) (PreH7 : (output = (xt_output_base (G)))) (PreH8 : (input_stride = (xt_input_stride (G)))) (PreH9 : (output_stride = (xt_output_stride (G)))) (PreH10 : (block_width = (xt_width (G)))) (PreH11 : (block_height = (xt_height (G)))) (PreH12 : (sizeof(UINT) = 4)) (PreH13 : (sizeof(UINT64) = 8)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH16 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  ((( &( "bw" ) )) # UInt64  |-> block_width)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition test_rvv_safety_wit_37 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_width = 0)) (PreH2 : (input_stride >= (unsigned_last_nbits ((block_width * sizeof(UINT) )) (64)))) (PreH3 : (block_height <> 1)) (PreH4 : (output_stride >= (unsigned_last_nbits ((block_height * sizeof(UINT) )) (64)))) (PreH5 : (block_width <> 1)) (PreH6 : (xt_valid F W G )) (PreH7 : (input = (xt_input (G)))) (PreH8 : (output = (xt_output_base (G)))) (PreH9 : (input_stride = (xt_input_stride (G)))) (PreH10 : (output_stride = (xt_output_stride (G)))) (PreH11 : (block_width = (xt_width (G)))) (PreH12 : (block_height = (xt_height (G)))) (PreH13 : (sizeof(UINT) = 4)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH17 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  ((( &( "bw" ) )) # UInt64  |-> block_width)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition test_rvv_safety_wit_38 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_width = 0)) (PreH2 : (block_height = 1)) (PreH3 : (output_stride >= (block_height * sizeof(UINT) ))) (PreH4 : (block_width <> 1)) (PreH5 : (xt_valid F W G )) (PreH6 : (input = (xt_input (G)))) (PreH7 : (output = (xt_output_base (G)))) (PreH8 : (input_stride = (xt_input_stride (G)))) (PreH9 : (output_stride = (xt_output_stride (G)))) (PreH10 : (block_width = (xt_width (G)))) (PreH11 : (block_height = (xt_height (G)))) (PreH12 : (sizeof(UINT) = 4)) (PreH13 : (sizeof(UINT64) = 8)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH16 : (block_height = 1)) ,
  ((( &( "bw" ) )) # UInt64  |-> block_width)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition test_rvv_safety_wit_39 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_width = 0)) (PreH2 : (block_height = 1)) (PreH3 : (output_stride >= (unsigned_last_nbits ((block_height * sizeof(UINT) )) (64)))) (PreH4 : (block_width <> 1)) (PreH5 : (xt_valid F W G )) (PreH6 : (input = (xt_input (G)))) (PreH7 : (output = (xt_output_base (G)))) (PreH8 : (input_stride = (xt_input_stride (G)))) (PreH9 : (output_stride = (xt_output_stride (G)))) (PreH10 : (block_width = (xt_width (G)))) (PreH11 : (block_height = (xt_height (G)))) (PreH12 : (sizeof(UINT) = 4)) (PreH13 : (sizeof(UINT64) = 8)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH16 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  ((( &( "bw" ) )) # UInt64  |-> 1)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition test_rvv_safety_wit_40 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_width = 0)) (PreH2 : (input_stride >= (unsigned_last_nbits ((block_width * sizeof(UINT) )) (64)))) (PreH3 : (block_height <> 1)) (PreH4 : (output_stride >= (unsigned_last_nbits ((block_height * sizeof(UINT) )) (64)))) (PreH5 : (block_width <> 1)) (PreH6 : (xt_valid F W G )) (PreH7 : (input = (xt_input (G)))) (PreH8 : (output = (xt_output_base (G)))) (PreH9 : (input_stride = (xt_input_stride (G)))) (PreH10 : (output_stride = (xt_output_stride (G)))) (PreH11 : (block_width = (xt_width (G)))) (PreH12 : (block_height = (xt_height (G)))) (PreH13 : (sizeof(UINT) = 4)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH17 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  ((( &( "bw" ) )) # UInt64  |-> 1)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition test_rvv_safety_wit_41 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_width = 0)) (PreH2 : (block_height = 1)) (PreH3 : (output_stride >= (block_height * sizeof(UINT) ))) (PreH4 : (block_width <> 1)) (PreH5 : (xt_valid F W G )) (PreH6 : (input = (xt_input (G)))) (PreH7 : (output = (xt_output_base (G)))) (PreH8 : (input_stride = (xt_input_stride (G)))) (PreH9 : (output_stride = (xt_output_stride (G)))) (PreH10 : (block_width = (xt_width (G)))) (PreH11 : (block_height = (xt_height (G)))) (PreH12 : (sizeof(UINT) = 4)) (PreH13 : (sizeof(UINT64) = 8)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH16 : (block_height = 1)) ,
  ((( &( "bw" ) )) # UInt64  |-> 1)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition test_rvv_safety_wit_42 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_width <> 0)) (PreH2 : (block_height = 1)) (PreH3 : (block_width = 1)) (PreH4 : (xt_valid F W G )) (PreH5 : (input = (xt_input (G)))) (PreH6 : (output = (xt_output_base (G)))) (PreH7 : (input_stride = (xt_input_stride (G)))) (PreH8 : (output_stride = (xt_output_stride (G)))) (PreH9 : (block_width = (xt_width (G)))) (PreH10 : (block_height = (xt_height (G)))) (PreH11 : (sizeof(UINT) = 4)) (PreH12 : (sizeof(UINT64) = 8)) (PreH13 : (sizeof(UINT64) = 8)) (PreH14 : (block_width = 1)) (PreH15 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  ((( &( "bw" ) )) # UInt64  |-> block_width)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition test_rvv_safety_wit_43 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_width <> 0)) (PreH2 : (input_stride >= (block_width * sizeof(UINT) ))) (PreH3 : (block_height <> 1)) (PreH4 : (block_width = 1)) (PreH5 : (xt_valid F W G )) (PreH6 : (input = (xt_input (G)))) (PreH7 : (output = (xt_output_base (G)))) (PreH8 : (input_stride = (xt_input_stride (G)))) (PreH9 : (output_stride = (xt_output_stride (G)))) (PreH10 : (block_width = (xt_width (G)))) (PreH11 : (block_height = (xt_height (G)))) (PreH12 : (sizeof(UINT) = 4)) (PreH13 : (sizeof(UINT64) = 8)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (block_width = 1)) (PreH16 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  ((( &( "bw" ) )) # UInt64  |-> block_width)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition test_rvv_safety_wit_44 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_width <> 0)) (PreH2 : (block_height = 1)) (PreH3 : (block_width = 1)) (PreH4 : (xt_valid F W G )) (PreH5 : (input = (xt_input (G)))) (PreH6 : (output = (xt_output_base (G)))) (PreH7 : (input_stride = (xt_input_stride (G)))) (PreH8 : (output_stride = (xt_output_stride (G)))) (PreH9 : (block_width = (xt_width (G)))) (PreH10 : (block_height = (xt_height (G)))) (PreH11 : (sizeof(UINT) = 4)) (PreH12 : (sizeof(UINT64) = 8)) (PreH13 : (sizeof(UINT64) = 8)) (PreH14 : (block_width = 1)) (PreH15 : (block_height = 1)) ,
  ((( &( "bw" ) )) # UInt64  |-> block_width)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition test_rvv_safety_wit_45 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_width <> 0)) (PreH2 : (block_height = 1)) (PreH3 : (block_width = 1)) (PreH4 : (xt_valid F W G )) (PreH5 : (input = (xt_input (G)))) (PreH6 : (output = (xt_output_base (G)))) (PreH7 : (input_stride = (xt_input_stride (G)))) (PreH8 : (output_stride = (xt_output_stride (G)))) (PreH9 : (block_width = (xt_width (G)))) (PreH10 : (block_height = (xt_height (G)))) (PreH11 : (sizeof(UINT) = 4)) (PreH12 : (sizeof(UINT64) = 8)) (PreH13 : (sizeof(UINT64) = 8)) (PreH14 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH15 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  ((( &( "bw" ) )) # UInt64  |-> block_width)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition test_rvv_safety_wit_46 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_width <> 0)) (PreH2 : (input_stride >= (block_width * sizeof(UINT) ))) (PreH3 : (block_height <> 1)) (PreH4 : (block_width = 1)) (PreH5 : (xt_valid F W G )) (PreH6 : (input = (xt_input (G)))) (PreH7 : (output = (xt_output_base (G)))) (PreH8 : (input_stride = (xt_input_stride (G)))) (PreH9 : (output_stride = (xt_output_stride (G)))) (PreH10 : (block_width = (xt_width (G)))) (PreH11 : (block_height = (xt_height (G)))) (PreH12 : (sizeof(UINT) = 4)) (PreH13 : (sizeof(UINT64) = 8)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH16 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  ((( &( "bw" ) )) # UInt64  |-> block_width)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition test_rvv_safety_wit_47 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_width <> 0)) (PreH2 : (block_height = 1)) (PreH3 : (output_stride >= (unsigned_last_nbits ((block_height * sizeof(UINT) )) (64)))) (PreH4 : (block_width <> 1)) (PreH5 : (xt_valid F W G )) (PreH6 : (input = (xt_input (G)))) (PreH7 : (output = (xt_output_base (G)))) (PreH8 : (input_stride = (xt_input_stride (G)))) (PreH9 : (output_stride = (xt_output_stride (G)))) (PreH10 : (block_width = (xt_width (G)))) (PreH11 : (block_height = (xt_height (G)))) (PreH12 : (sizeof(UINT) = 4)) (PreH13 : (sizeof(UINT64) = 8)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH16 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  ((( &( "bw" ) )) # UInt64  |-> block_width)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition test_rvv_safety_wit_48 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_width <> 0)) (PreH2 : (input_stride >= (unsigned_last_nbits ((block_width * sizeof(UINT) )) (64)))) (PreH3 : (block_height <> 1)) (PreH4 : (output_stride >= (unsigned_last_nbits ((block_height * sizeof(UINT) )) (64)))) (PreH5 : (block_width <> 1)) (PreH6 : (xt_valid F W G )) (PreH7 : (input = (xt_input (G)))) (PreH8 : (output = (xt_output_base (G)))) (PreH9 : (input_stride = (xt_input_stride (G)))) (PreH10 : (output_stride = (xt_output_stride (G)))) (PreH11 : (block_width = (xt_width (G)))) (PreH12 : (block_height = (xt_height (G)))) (PreH13 : (sizeof(UINT) = 4)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH17 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  ((( &( "bw" ) )) # UInt64  |-> block_width)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition test_rvv_safety_wit_49 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_width <> 0)) (PreH2 : (block_height = 1)) (PreH3 : (block_width = 1)) (PreH4 : (xt_valid F W G )) (PreH5 : (input = (xt_input (G)))) (PreH6 : (output = (xt_output_base (G)))) (PreH7 : (input_stride = (xt_input_stride (G)))) (PreH8 : (output_stride = (xt_output_stride (G)))) (PreH9 : (block_width = (xt_width (G)))) (PreH10 : (block_height = (xt_height (G)))) (PreH11 : (sizeof(UINT) = 4)) (PreH12 : (sizeof(UINT64) = 8)) (PreH13 : (sizeof(UINT64) = 8)) (PreH14 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH15 : (block_height = 1)) ,
  ((( &( "bw" ) )) # UInt64  |-> block_width)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition test_rvv_safety_wit_50 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_width <> 0)) (PreH2 : (block_height = 1)) (PreH3 : (output_stride >= (block_height * sizeof(UINT) ))) (PreH4 : (block_width <> 1)) (PreH5 : (xt_valid F W G )) (PreH6 : (input = (xt_input (G)))) (PreH7 : (output = (xt_output_base (G)))) (PreH8 : (input_stride = (xt_input_stride (G)))) (PreH9 : (output_stride = (xt_output_stride (G)))) (PreH10 : (block_width = (xt_width (G)))) (PreH11 : (block_height = (xt_height (G)))) (PreH12 : (sizeof(UINT) = 4)) (PreH13 : (sizeof(UINT64) = 8)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH16 : (block_height = 1)) ,
  ((( &( "bw" ) )) # UInt64  |-> block_width)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition test_rvv_safety_wit_51 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height = 0)) (PreH2 : (block_width = 0)) (PreH3 : (block_height = 1)) (PreH4 : (output_stride >= (unsigned_last_nbits ((block_height * sizeof(UINT) )) (64)))) (PreH5 : (block_width <> 1)) (PreH6 : (xt_valid F W G )) (PreH7 : (input = (xt_input (G)))) (PreH8 : (output = (xt_output_base (G)))) (PreH9 : (input_stride = (xt_input_stride (G)))) (PreH10 : (output_stride = (xt_output_stride (G)))) (PreH11 : (block_width = (xt_width (G)))) (PreH12 : (block_height = (xt_height (G)))) (PreH13 : (sizeof(UINT) = 4)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH17 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  ((( &( "bw" ) )) # UInt64  |-> 1)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ False ”
.

Definition test_rvv_safety_wit_52 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height = 0)) (PreH2 : (block_width = 0)) (PreH3 : (block_height = 1)) (PreH4 : (output_stride >= (block_height * sizeof(UINT) ))) (PreH5 : (block_width <> 1)) (PreH6 : (xt_valid F W G )) (PreH7 : (input = (xt_input (G)))) (PreH8 : (output = (xt_output_base (G)))) (PreH9 : (input_stride = (xt_input_stride (G)))) (PreH10 : (output_stride = (xt_output_stride (G)))) (PreH11 : (block_width = (xt_width (G)))) (PreH12 : (block_height = (xt_height (G)))) (PreH13 : (sizeof(UINT) = 4)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH17 : (block_height = 1)) ,
  ((( &( "bw" ) )) # UInt64  |-> 1)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ False ”
.

Definition test_rvv_safety_wit_53 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height = 0)) (PreH2 : (block_width <> 0)) (PreH3 : (block_height = 1)) (PreH4 : (block_width = 1)) (PreH5 : (xt_valid F W G )) (PreH6 : (input = (xt_input (G)))) (PreH7 : (output = (xt_output_base (G)))) (PreH8 : (input_stride = (xt_input_stride (G)))) (PreH9 : (output_stride = (xt_output_stride (G)))) (PreH10 : (block_width = (xt_width (G)))) (PreH11 : (block_height = (xt_height (G)))) (PreH12 : (sizeof(UINT) = 4)) (PreH13 : (sizeof(UINT64) = 8)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (block_width = 1)) (PreH16 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  ((( &( "bw" ) )) # UInt64  |-> block_width)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ False ”
.

Definition test_rvv_safety_wit_54 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height = 0)) (PreH2 : (block_width <> 0)) (PreH3 : (block_height = 1)) (PreH4 : (block_width = 1)) (PreH5 : (xt_valid F W G )) (PreH6 : (input = (xt_input (G)))) (PreH7 : (output = (xt_output_base (G)))) (PreH8 : (input_stride = (xt_input_stride (G)))) (PreH9 : (output_stride = (xt_output_stride (G)))) (PreH10 : (block_width = (xt_width (G)))) (PreH11 : (block_height = (xt_height (G)))) (PreH12 : (sizeof(UINT) = 4)) (PreH13 : (sizeof(UINT64) = 8)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (block_width = 1)) (PreH16 : (block_height = 1)) ,
  ((( &( "bw" ) )) # UInt64  |-> block_width)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ False ”
.

Definition test_rvv_safety_wit_55 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height = 0)) (PreH2 : (block_width <> 0)) (PreH3 : (block_height = 1)) (PreH4 : (block_width = 1)) (PreH5 : (xt_valid F W G )) (PreH6 : (input = (xt_input (G)))) (PreH7 : (output = (xt_output_base (G)))) (PreH8 : (input_stride = (xt_input_stride (G)))) (PreH9 : (output_stride = (xt_output_stride (G)))) (PreH10 : (block_width = (xt_width (G)))) (PreH11 : (block_height = (xt_height (G)))) (PreH12 : (sizeof(UINT) = 4)) (PreH13 : (sizeof(UINT64) = 8)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH16 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  ((( &( "bw" ) )) # UInt64  |-> block_width)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ False ”
.

Definition test_rvv_safety_wit_56 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height = 0)) (PreH2 : (block_width <> 0)) (PreH3 : (block_height = 1)) (PreH4 : (output_stride >= (unsigned_last_nbits ((block_height * sizeof(UINT) )) (64)))) (PreH5 : (block_width <> 1)) (PreH6 : (xt_valid F W G )) (PreH7 : (input = (xt_input (G)))) (PreH8 : (output = (xt_output_base (G)))) (PreH9 : (input_stride = (xt_input_stride (G)))) (PreH10 : (output_stride = (xt_output_stride (G)))) (PreH11 : (block_width = (xt_width (G)))) (PreH12 : (block_height = (xt_height (G)))) (PreH13 : (sizeof(UINT) = 4)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH17 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  ((( &( "bw" ) )) # UInt64  |-> block_width)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ False ”
.

Definition test_rvv_safety_wit_57 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height = 0)) (PreH2 : (block_width <> 0)) (PreH3 : (block_height = 1)) (PreH4 : (block_width = 1)) (PreH5 : (xt_valid F W G )) (PreH6 : (input = (xt_input (G)))) (PreH7 : (output = (xt_output_base (G)))) (PreH8 : (input_stride = (xt_input_stride (G)))) (PreH9 : (output_stride = (xt_output_stride (G)))) (PreH10 : (block_width = (xt_width (G)))) (PreH11 : (block_height = (xt_height (G)))) (PreH12 : (sizeof(UINT) = 4)) (PreH13 : (sizeof(UINT64) = 8)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH16 : (block_height = 1)) ,
  ((( &( "bw" ) )) # UInt64  |-> block_width)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ False ”
.

Definition test_rvv_safety_wit_58 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height = 0)) (PreH2 : (block_width <> 0)) (PreH3 : (block_height = 1)) (PreH4 : (output_stride >= (block_height * sizeof(UINT) ))) (PreH5 : (block_width <> 1)) (PreH6 : (xt_valid F W G )) (PreH7 : (input = (xt_input (G)))) (PreH8 : (output = (xt_output_base (G)))) (PreH9 : (input_stride = (xt_input_stride (G)))) (PreH10 : (output_stride = (xt_output_stride (G)))) (PreH11 : (block_width = (xt_width (G)))) (PreH12 : (block_height = (xt_height (G)))) (PreH13 : (sizeof(UINT) = 4)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH17 : (block_height = 1)) ,
  ((( &( "bw" ) )) # UInt64  |-> block_width)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ False ”
.

Definition test_rvv_safety_wit_59 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height = 0)) (PreH2 : (block_width = 0)) (PreH3 : (input_stride >= (unsigned_last_nbits ((block_width * sizeof(UINT) )) (64)))) (PreH4 : (block_height <> 1)) (PreH5 : (output_stride >= (unsigned_last_nbits ((block_height * sizeof(UINT) )) (64)))) (PreH6 : (block_width <> 1)) (PreH7 : (xt_valid F W G )) (PreH8 : (input = (xt_input (G)))) (PreH9 : (output = (xt_output_base (G)))) (PreH10 : (input_stride = (xt_input_stride (G)))) (PreH11 : (output_stride = (xt_output_stride (G)))) (PreH12 : (block_width = (xt_width (G)))) (PreH13 : (block_height = (xt_height (G)))) (PreH14 : (sizeof(UINT) = 4)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (sizeof(UINT64) = 8)) (PreH17 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH18 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  ((( &( "bw" ) )) # UInt64  |-> 1)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition test_rvv_safety_wit_60 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height = 0)) (PreH2 : (block_width <> 0)) (PreH3 : (input_stride >= (block_width * sizeof(UINT) ))) (PreH4 : (block_height <> 1)) (PreH5 : (block_width = 1)) (PreH6 : (xt_valid F W G )) (PreH7 : (input = (xt_input (G)))) (PreH8 : (output = (xt_output_base (G)))) (PreH9 : (input_stride = (xt_input_stride (G)))) (PreH10 : (output_stride = (xt_output_stride (G)))) (PreH11 : (block_width = (xt_width (G)))) (PreH12 : (block_height = (xt_height (G)))) (PreH13 : (sizeof(UINT) = 4)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (block_width = 1)) (PreH17 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  ((( &( "bw" ) )) # UInt64  |-> block_width)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition test_rvv_safety_wit_61 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height = 0)) (PreH2 : (block_width <> 0)) (PreH3 : (input_stride >= (block_width * sizeof(UINT) ))) (PreH4 : (block_height <> 1)) (PreH5 : (block_width = 1)) (PreH6 : (xt_valid F W G )) (PreH7 : (input = (xt_input (G)))) (PreH8 : (output = (xt_output_base (G)))) (PreH9 : (input_stride = (xt_input_stride (G)))) (PreH10 : (output_stride = (xt_output_stride (G)))) (PreH11 : (block_width = (xt_width (G)))) (PreH12 : (block_height = (xt_height (G)))) (PreH13 : (sizeof(UINT) = 4)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH17 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  ((( &( "bw" ) )) # UInt64  |-> block_width)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition test_rvv_safety_wit_62 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height = 0)) (PreH2 : (block_width <> 0)) (PreH3 : (input_stride >= (unsigned_last_nbits ((block_width * sizeof(UINT) )) (64)))) (PreH4 : (block_height <> 1)) (PreH5 : (output_stride >= (unsigned_last_nbits ((block_height * sizeof(UINT) )) (64)))) (PreH6 : (block_width <> 1)) (PreH7 : (xt_valid F W G )) (PreH8 : (input = (xt_input (G)))) (PreH9 : (output = (xt_output_base (G)))) (PreH10 : (input_stride = (xt_input_stride (G)))) (PreH11 : (output_stride = (xt_output_stride (G)))) (PreH12 : (block_width = (xt_width (G)))) (PreH13 : (block_height = (xt_height (G)))) (PreH14 : (sizeof(UINT) = 4)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (sizeof(UINT64) = 8)) (PreH17 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH18 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  ((( &( "bw" ) )) # UInt64  |-> block_width)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition test_rvv_safety_wit_63 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (R: XTOutput) (output: Z) (input: Z) (bw: Z) (block_height: Z) (block_width: Z) (output_stride: Z) (input_stride: Z) (PreH1 : (xt_valid F W G )) (PreH2 : (input_stride = (xt_input_stride (G)))) (PreH3 : (output_stride = (xt_output_stride (G)))) (PreH4 : (block_width = (xt_width (G)))) (PreH5 : (block_height = (xt_height (G)))) (PreH6 : (sizeof(UINT) = 4)) (PreH7 : (sizeof(UINT64) = 8)) (PreH8 : (sizeof(UINT64) = 8)) (PreH9 : (0 <= bw)) (PreH10 : (bw <= (xt_total (G)))) (PreH11 : (input = (xt_current_input (G) (((xt_total (G)) - bw )) (0)))) (PreH12 : (output = (xt_current_output (G) (((xt_total (G)) - bw )) (0)))) (PreH13 : (xt_progress F G old R ((xt_total (G)) - bw ) 0 0 )) ,
  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  ((( &( "bw" ) )) # UInt64  |-> bw)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  (xt_data F )
  **  (xt_output W R )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition test_rvv_safety_wit_64 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (R: XTOutput) (o: Z) (i: Z) (output: Z) (input: Z) (bh: Z) (vl: Z) (bw: Z) (block_height: Z) (block_width: Z) (output_stride: Z) (input_stride: Z) (PreH1 : (xt_valid F W G )) (PreH2 : (input_stride = (xt_input_stride (G)))) (PreH3 : (output_stride = (xt_output_stride (G)))) (PreH4 : (block_width = (xt_width (G)))) (PreH5 : (block_height = (xt_height (G)))) (PreH6 : (sizeof(UINT) = 4)) (PreH7 : (sizeof(UINT64) = 8)) (PreH8 : (sizeof(UINT64) = 8)) (PreH9 : (0 < bw)) (PreH10 : (bw <= (xt_total (G)))) (PreH11 : (xt_legal_vl bw vl )) (PreH12 : (0 < vl)) (PreH13 : (vl <= 32)) (PreH14 : (vl <= bw)) (PreH15 : (0 <= bh)) (PreH16 : (bh <= block_height)) (PreH17 : (input = (xt_current_input (G) (((xt_total (G)) - bw )) (0)))) (PreH18 : (output = (xt_current_output (G) (((xt_total (G)) - bw )) (0)))) (PreH19 : (i = (xt_current_input (G) (((xt_total (G)) - bw )) ((block_height - bh ))))) (PreH20 : (o = (xt_current_output (G) (((xt_total (G)) - bw )) ((block_height - bh ))))) (PreH21 : (xt_progress F G old R ((xt_total (G)) - bw ) vl (block_height - bh ) )) ,
  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  ((( &( "bw" ) )) # UInt64  |-> bw)
  **  ((( &( "vl" ) )) # UInt64  |-> vl)
  **  ((( &( "bh" ) )) # UInt64  |-> bh)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "i" ) )) # Ptr  |-> i)
  **  ((( &( "o" ) )) # Ptr  |-> o)
  **  (xt_data F )
  **  (xt_output W R )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition test_rvv_safety_wit_65 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (R: XTOutput) (o: Z) (i: Z) (output: Z) (input: Z) (bh: Z) (vl: Z) (bw: Z) (block_height: Z) (block_width: Z) (output_stride: Z) (input_stride: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (xt_rvv_lane F i vl 0 x0 )) (PreH2 : (xt_rvv_lane F i vl 1 x1 )) (PreH3 : (xt_rvv_lane F i vl 2 x2 )) (PreH4 : (xt_rvv_lane F i vl 3 x3 )) (PreH5 : (xt_rvv_lane F i vl 4 x4 )) (PreH6 : (xt_rvv_lane F i vl 5 x5 )) (PreH7 : (xt_rvv_lane F i vl 6 x6 )) (PreH8 : (xt_rvv_lane F i vl 7 x7 )) (PreH9 : (xt_rvv_lane F i vl 8 x8 )) (PreH10 : (xt_rvv_lane F i vl 9 x9 )) (PreH11 : (xt_rvv_lane F i vl 10 x10 )) (PreH12 : (xt_rvv_lane F i vl 11 x11 )) (PreH13 : (xt_rvv_lane F i vl 12 x12 )) (PreH14 : (xt_rvv_lane F i vl 13 x13 )) (PreH15 : (xt_rvv_lane F i vl 14 x14 )) (PreH16 : (xt_rvv_lane F i vl 15 x15 )) (PreH17 : (xt_rvv_lane F i vl 16 x16 )) (PreH18 : (xt_rvv_lane F i vl 17 x17 )) (PreH19 : (xt_rvv_lane F i vl 18 x18 )) (PreH20 : (xt_rvv_lane F i vl 19 x19 )) (PreH21 : (xt_rvv_lane F i vl 20 x20 )) (PreH22 : (xt_rvv_lane F i vl 21 x21 )) (PreH23 : (xt_rvv_lane F i vl 22 x22 )) (PreH24 : (xt_rvv_lane F i vl 23 x23 )) (PreH25 : (xt_rvv_lane F i vl 24 x24 )) (PreH26 : (xt_rvv_lane F i vl 25 x25 )) (PreH27 : (xt_rvv_lane F i vl 26 x26 )) (PreH28 : (xt_rvv_lane F i vl 27 x27 )) (PreH29 : (xt_rvv_lane F i vl 28 x28 )) (PreH30 : (xt_rvv_lane F i vl 29 x29 )) (PreH31 : (xt_rvv_lane F i vl 30 x30 )) (PreH32 : (xt_rvv_lane F i vl 31 x31 )) (PreH33 : (bh > 0)) (PreH34 : (xt_valid F W G )) (PreH35 : (input_stride = (xt_input_stride (G)))) (PreH36 : (output_stride = (xt_output_stride (G)))) (PreH37 : (block_width = (xt_width (G)))) (PreH38 : (block_height = (xt_height (G)))) (PreH39 : (sizeof(UINT) = 4)) (PreH40 : (sizeof(UINT64) = 8)) (PreH41 : (sizeof(UINT64) = 8)) (PreH42 : (0 < bw)) (PreH43 : (bw <= (xt_total (G)))) (PreH44 : (xt_legal_vl bw vl )) (PreH45 : (0 < vl)) (PreH46 : (vl <= 32)) (PreH47 : (vl <= bw)) (PreH48 : (0 <= bh)) (PreH49 : (bh <= block_height)) (PreH50 : (input = (xt_current_input (G) (((xt_total (G)) - bw )) (0)))) (PreH51 : (output = (xt_current_output (G) (((xt_total (G)) - bw )) (0)))) (PreH52 : (i = (xt_current_input (G) (((xt_total (G)) - bw )) ((block_height - bh ))))) (PreH53 : (o = (xt_current_output (G) (((xt_total (G)) - bw )) ((block_height - bh ))))) (PreH54 : (xt_progress F G old R ((xt_total (G)) - bw ) vl (block_height - bh ) )) ,
  (xt_output W (xt_strided_write (R) (o) (output_stride) (vl) ((xt_vec32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) )
  **  ((&(( &( "v" ) )->ₛ "s0")) # UInt  |-> x0)
  **  ((&(( &( "v" ) )->ₛ "s1")) # UInt  |-> x1)
  **  ((&(( &( "v" ) )->ₛ "s2")) # UInt  |-> x2)
  **  ((&(( &( "v" ) )->ₛ "s3")) # UInt  |-> x3)
  **  ((&(( &( "v" ) )->ₛ "s4")) # UInt  |-> x4)
  **  ((&(( &( "v" ) )->ₛ "s5")) # UInt  |-> x5)
  **  ((&(( &( "v" ) )->ₛ "s6")) # UInt  |-> x6)
  **  ((&(( &( "v" ) )->ₛ "s7")) # UInt  |-> x7)
  **  ((&(( &( "v" ) )->ₛ "s8")) # UInt  |-> x8)
  **  ((&(( &( "v" ) )->ₛ "s9")) # UInt  |-> x9)
  **  ((&(( &( "v" ) )->ₛ "s10")) # UInt  |-> x10)
  **  ((&(( &( "v" ) )->ₛ "s11")) # UInt  |-> x11)
  **  ((&(( &( "v" ) )->ₛ "s12")) # UInt  |-> x12)
  **  ((&(( &( "v" ) )->ₛ "s13")) # UInt  |-> x13)
  **  ((&(( &( "v" ) )->ₛ "s14")) # UInt  |-> x14)
  **  ((&(( &( "v" ) )->ₛ "s15")) # UInt  |-> x15)
  **  ((&(( &( "v" ) )->ₛ "s16")) # UInt  |-> x16)
  **  ((&(( &( "v" ) )->ₛ "s17")) # UInt  |-> x17)
  **  ((&(( &( "v" ) )->ₛ "s18")) # UInt  |-> x18)
  **  ((&(( &( "v" ) )->ₛ "s19")) # UInt  |-> x19)
  **  ((&(( &( "v" ) )->ₛ "s20")) # UInt  |-> x20)
  **  ((&(( &( "v" ) )->ₛ "s21")) # UInt  |-> x21)
  **  ((&(( &( "v" ) )->ₛ "s22")) # UInt  |-> x22)
  **  ((&(( &( "v" ) )->ₛ "s23")) # UInt  |-> x23)
  **  ((&(( &( "v" ) )->ₛ "s24")) # UInt  |-> x24)
  **  ((&(( &( "v" ) )->ₛ "s25")) # UInt  |-> x25)
  **  ((&(( &( "v" ) )->ₛ "s26")) # UInt  |-> x26)
  **  ((&(( &( "v" ) )->ₛ "s27")) # UInt  |-> x27)
  **  ((&(( &( "v" ) )->ₛ "s28")) # UInt  |-> x28)
  **  ((&(( &( "v" ) )->ₛ "s29")) # UInt  |-> x29)
  **  ((&(( &( "v" ) )->ₛ "s30")) # UInt  |-> x30)
  **  ((&(( &( "v" ) )->ₛ "s31")) # UInt  |-> x31)
  **  (xt_data F )
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  ((( &( "bw" ) )) # UInt64  |-> bw)
  **  ((( &( "vl" ) )) # UInt64  |-> vl)
  **  ((( &( "bh" ) )) # UInt64  |-> bh)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "i" ) )) # Ptr  |-> (unsigned_last_nbits (((unsigned_last_nbits (i) (64)) + input_stride )) (64)))
  **  ((( &( "o" ) )) # Ptr  |-> o)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition test_rvv_safety_wit_66 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (R: XTOutput) (o: Z) (i: Z) (output: Z) (input: Z) (bh: Z) (vl: Z) (bw: Z) (block_height: Z) (block_width: Z) (output_stride: Z) (input_stride: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (xt_rvv_lane F i vl 0 x0 )) (PreH2 : (xt_rvv_lane F i vl 1 x1 )) (PreH3 : (xt_rvv_lane F i vl 2 x2 )) (PreH4 : (xt_rvv_lane F i vl 3 x3 )) (PreH5 : (xt_rvv_lane F i vl 4 x4 )) (PreH6 : (xt_rvv_lane F i vl 5 x5 )) (PreH7 : (xt_rvv_lane F i vl 6 x6 )) (PreH8 : (xt_rvv_lane F i vl 7 x7 )) (PreH9 : (xt_rvv_lane F i vl 8 x8 )) (PreH10 : (xt_rvv_lane F i vl 9 x9 )) (PreH11 : (xt_rvv_lane F i vl 10 x10 )) (PreH12 : (xt_rvv_lane F i vl 11 x11 )) (PreH13 : (xt_rvv_lane F i vl 12 x12 )) (PreH14 : (xt_rvv_lane F i vl 13 x13 )) (PreH15 : (xt_rvv_lane F i vl 14 x14 )) (PreH16 : (xt_rvv_lane F i vl 15 x15 )) (PreH17 : (xt_rvv_lane F i vl 16 x16 )) (PreH18 : (xt_rvv_lane F i vl 17 x17 )) (PreH19 : (xt_rvv_lane F i vl 18 x18 )) (PreH20 : (xt_rvv_lane F i vl 19 x19 )) (PreH21 : (xt_rvv_lane F i vl 20 x20 )) (PreH22 : (xt_rvv_lane F i vl 21 x21 )) (PreH23 : (xt_rvv_lane F i vl 22 x22 )) (PreH24 : (xt_rvv_lane F i vl 23 x23 )) (PreH25 : (xt_rvv_lane F i vl 24 x24 )) (PreH26 : (xt_rvv_lane F i vl 25 x25 )) (PreH27 : (xt_rvv_lane F i vl 26 x26 )) (PreH28 : (xt_rvv_lane F i vl 27 x27 )) (PreH29 : (xt_rvv_lane F i vl 28 x28 )) (PreH30 : (xt_rvv_lane F i vl 29 x29 )) (PreH31 : (xt_rvv_lane F i vl 30 x30 )) (PreH32 : (xt_rvv_lane F i vl 31 x31 )) (PreH33 : (bh > 0)) (PreH34 : (xt_valid F W G )) (PreH35 : (input_stride = (xt_input_stride (G)))) (PreH36 : (output_stride = (xt_output_stride (G)))) (PreH37 : (block_width = (xt_width (G)))) (PreH38 : (block_height = (xt_height (G)))) (PreH39 : (sizeof(UINT) = 4)) (PreH40 : (sizeof(UINT64) = 8)) (PreH41 : (sizeof(UINT64) = 8)) (PreH42 : (0 < bw)) (PreH43 : (bw <= (xt_total (G)))) (PreH44 : (xt_legal_vl bw vl )) (PreH45 : (0 < vl)) (PreH46 : (vl <= 32)) (PreH47 : (vl <= bw)) (PreH48 : (0 <= bh)) (PreH49 : (bh <= block_height)) (PreH50 : (input = (xt_current_input (G) (((xt_total (G)) - bw )) (0)))) (PreH51 : (output = (xt_current_output (G) (((xt_total (G)) - bw )) (0)))) (PreH52 : (i = (xt_current_input (G) (((xt_total (G)) - bw )) ((block_height - bh ))))) (PreH53 : (o = (xt_current_output (G) (((xt_total (G)) - bw )) ((block_height - bh ))))) (PreH54 : (xt_progress F G old R ((xt_total (G)) - bw ) vl (block_height - bh ) )) ,
  (xt_output W (xt_strided_write (R) (o) (output_stride) (vl) ((xt_vec32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) )
  **  ((&(( &( "v" ) )->ₛ "s0")) # UInt  |-> x0)
  **  ((&(( &( "v" ) )->ₛ "s1")) # UInt  |-> x1)
  **  ((&(( &( "v" ) )->ₛ "s2")) # UInt  |-> x2)
  **  ((&(( &( "v" ) )->ₛ "s3")) # UInt  |-> x3)
  **  ((&(( &( "v" ) )->ₛ "s4")) # UInt  |-> x4)
  **  ((&(( &( "v" ) )->ₛ "s5")) # UInt  |-> x5)
  **  ((&(( &( "v" ) )->ₛ "s6")) # UInt  |-> x6)
  **  ((&(( &( "v" ) )->ₛ "s7")) # UInt  |-> x7)
  **  ((&(( &( "v" ) )->ₛ "s8")) # UInt  |-> x8)
  **  ((&(( &( "v" ) )->ₛ "s9")) # UInt  |-> x9)
  **  ((&(( &( "v" ) )->ₛ "s10")) # UInt  |-> x10)
  **  ((&(( &( "v" ) )->ₛ "s11")) # UInt  |-> x11)
  **  ((&(( &( "v" ) )->ₛ "s12")) # UInt  |-> x12)
  **  ((&(( &( "v" ) )->ₛ "s13")) # UInt  |-> x13)
  **  ((&(( &( "v" ) )->ₛ "s14")) # UInt  |-> x14)
  **  ((&(( &( "v" ) )->ₛ "s15")) # UInt  |-> x15)
  **  ((&(( &( "v" ) )->ₛ "s16")) # UInt  |-> x16)
  **  ((&(( &( "v" ) )->ₛ "s17")) # UInt  |-> x17)
  **  ((&(( &( "v" ) )->ₛ "s18")) # UInt  |-> x18)
  **  ((&(( &( "v" ) )->ₛ "s19")) # UInt  |-> x19)
  **  ((&(( &( "v" ) )->ₛ "s20")) # UInt  |-> x20)
  **  ((&(( &( "v" ) )->ₛ "s21")) # UInt  |-> x21)
  **  ((&(( &( "v" ) )->ₛ "s22")) # UInt  |-> x22)
  **  ((&(( &( "v" ) )->ₛ "s23")) # UInt  |-> x23)
  **  ((&(( &( "v" ) )->ₛ "s24")) # UInt  |-> x24)
  **  ((&(( &( "v" ) )->ₛ "s25")) # UInt  |-> x25)
  **  ((&(( &( "v" ) )->ₛ "s26")) # UInt  |-> x26)
  **  ((&(( &( "v" ) )->ₛ "s27")) # UInt  |-> x27)
  **  ((&(( &( "v" ) )->ₛ "s28")) # UInt  |-> x28)
  **  ((&(( &( "v" ) )->ₛ "s29")) # UInt  |-> x29)
  **  ((&(( &( "v" ) )->ₛ "s30")) # UInt  |-> x30)
  **  ((&(( &( "v" ) )->ₛ "s31")) # UInt  |-> x31)
  **  (xt_data F )
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  ((( &( "bw" ) )) # UInt64  |-> bw)
  **  ((( &( "vl" ) )) # UInt64  |-> vl)
  **  ((( &( "bh" ) )) # UInt64  |-> bh)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "i" ) )) # Ptr  |-> (unsigned_last_nbits (((unsigned_last_nbits (i) (64)) + input_stride )) (64)))
  **  ((( &( "o" ) )) # Ptr  |-> (o + (1 * sizeof(UINT))))
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition test_rvv_entail_wit_1 := 
forall (block_height_pre: Z) (block_width_pre: Z) (output_stride_pre: Z) (input_stride_pre: Z) (output_pre: Z) (input_pre: Z) (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (PreH1 : (xt_valid F W G )) (PreH2 : (input_pre = (xt_input (G)))) (PreH3 : (output_pre = (xt_output_base (G)))) (PreH4 : (input_stride_pre = (xt_input_stride (G)))) (PreH5 : (output_stride_pre = (xt_output_stride (G)))) (PreH6 : (block_width_pre = (xt_width (G)))) (PreH7 : (block_height_pre = (xt_height (G)))) ,
  (xt_data F )
  **  (xt_output W old )
|--
  (“ (xt_valid F W G ) ” 
  &&  “ (input_pre = (xt_input (G))) ” 
  &&  “ (output_pre = (xt_output_base (G))) ” 
  &&  “ (input_stride_pre = (xt_input_stride (G))) ” 
  &&  “ (output_stride_pre = (xt_output_stride (G))) ” 
  &&  “ (block_width_pre = (xt_width (G))) ” 
  &&  “ (block_height_pre = (xt_height (G))) ” 
  &&  “ (sizeof(UINT) = 4) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (block_width_pre = 1) ” 
  &&  “ (input_stride_pre >= (unsigned_last_nbits ((block_width_pre * 4 )) (64))) ”
  &&  (xt_data F )
  **  (xt_output W old ))
  ||
  (“ (xt_valid F W G ) ” 
  &&  “ (input_pre = (xt_input (G))) ” 
  &&  “ (output_pre = (xt_output_base (G))) ” 
  &&  “ (input_stride_pre = (xt_input_stride (G))) ” 
  &&  “ (output_stride_pre = (xt_output_stride (G))) ” 
  &&  “ (block_width_pre = (xt_width (G))) ” 
  &&  “ (block_height_pre = (xt_height (G))) ” 
  &&  “ (sizeof(UINT) = 4) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (block_width_pre = 1) ” 
  &&  “ (block_height_pre = 1) ”
  &&  (xt_data F )
  **  (xt_output W old ))
  ||
  (“ (xt_valid F W G ) ” 
  &&  “ (input_pre = (xt_input (G))) ” 
  &&  “ (output_pre = (xt_output_base (G))) ” 
  &&  “ (input_stride_pre = (xt_input_stride (G))) ” 
  &&  “ (output_stride_pre = (xt_output_stride (G))) ” 
  &&  “ (block_width_pre = (xt_width (G))) ” 
  &&  “ (block_height_pre = (xt_height (G))) ” 
  &&  “ (sizeof(UINT) = 4) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (output_stride_pre >= (unsigned_last_nbits ((block_height_pre * 4 )) (64))) ” 
  &&  “ (input_stride_pre >= (unsigned_last_nbits ((block_width_pre * 4 )) (64))) ”
  &&  (xt_data F )
  **  (xt_output W old ))
  ||
  (“ (xt_valid F W G ) ” 
  &&  “ (input_pre = (xt_input (G))) ” 
  &&  “ (output_pre = (xt_output_base (G))) ” 
  &&  “ (input_stride_pre = (xt_input_stride (G))) ” 
  &&  “ (output_stride_pre = (xt_output_stride (G))) ” 
  &&  “ (block_width_pre = (xt_width (G))) ” 
  &&  “ (block_height_pre = (xt_height (G))) ” 
  &&  “ (sizeof(UINT) = 4) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (output_stride_pre >= (unsigned_last_nbits ((block_height_pre * 4 )) (64))) ” 
  &&  “ (block_height_pre = 1) ”
  &&  (xt_data F )
  **  (xt_output W old ))
.

Definition test_rvv_entail_wit_2_1 := 
(
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height = 0)) (PreH2 : (block_width = 0)) (PreH3 : (input_stride >= (unsigned_last_nbits ((block_width * sizeof(UINT) )) (64)))) (PreH4 : (block_height <> 1)) (PreH5 : (output_stride >= (unsigned_last_nbits ((block_height * sizeof(UINT) )) (64)))) (PreH6 : (block_width <> 1)) (PreH7 : (xt_valid F W G )) (PreH8 : (input = (xt_input (G)))) (PreH9 : (output = (xt_output_base (G)))) (PreH10 : (input_stride = (xt_input_stride (G)))) (PreH11 : (output_stride = (xt_output_stride (G)))) (PreH12 : (block_width = (xt_width (G)))) (PreH13 : (block_height = (xt_height (G)))) (PreH14 : (sizeof(UINT) = 4)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (sizeof(UINT64) = 8)) (PreH17 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH18 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  (xt_data F )
  **  (xt_output W old )
|--
  EX (R: XTOutput) ,
  “ (xt_valid F W G ) ” 
  &&  “ (input_stride = (xt_input_stride (G))) ” 
  &&  “ (output_stride = (xt_output_stride (G))) ” 
  &&  “ (block_width = (xt_width (G))) ” 
  &&  “ (block_height = (xt_height (G))) ” 
  &&  “ (sizeof(UINT) = 4) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (0 <= 0) ” 
  &&  “ (0 <= (xt_total (G))) ” 
  &&  “ (input = (xt_current_input (G) (((xt_total (G)) - 0 )) (0))) ” 
  &&  “ (output = (xt_current_output (G) (((xt_total (G)) - 0 )) (0))) ” 
  &&  “ (xt_progress F G old R ((xt_total (G)) - 0 ) 0 0 ) ”
  &&  (xt_data F )
  **  (xt_output W R )
) \/
(
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height = 0)) (PreH2 : (block_width = 0)) (PreH3 : (input_stride >= (unsigned_last_nbits ((block_width * sizeof(UINT) )) (64)))) (PreH4 : (block_height <> 1)) (PreH5 : (output_stride >= (unsigned_last_nbits ((block_height * sizeof(UINT) )) (64)))) (PreH6 : (block_width <> 1)) (PreH7 : (xt_valid F W G )) (PreH8 : (input = (xt_input (G)))) (PreH9 : (output = (xt_output_base (G)))) (PreH10 : (input_stride = (xt_input_stride (G)))) (PreH11 : (output_stride = (xt_output_stride (G)))) (PreH12 : (block_width = (xt_width (G)))) (PreH13 : (block_height = (xt_height (G)))) (PreH14 : (sizeof(UINT) = 4)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (sizeof(UINT64) = 8)) (PreH17 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH18 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  TT && emp 
|--
  “ (xt_progress F G old old ((xt_total (G)) - 0 ) 0 0 ) ” 
  &&  “ (output = (xt_current_output (G) (((xt_total (G)) - 0 )) (0))) ” 
  &&  “ (input = (xt_current_input (G) (((xt_total (G)) - 0 )) (0))) ” 
  &&  “ (0 <= (xt_total (G))) ”
  &&  emp
).

Definition test_rvv_entail_wit_2_1_split_goal_1 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height = 0)) (PreH2 : (block_width = 0)) (PreH3 : (input_stride >= (unsigned_last_nbits ((block_width * sizeof(UINT) )) (64)))) (PreH4 : (block_height <> 1)) (PreH5 : (output_stride >= (unsigned_last_nbits ((block_height * sizeof(UINT) )) (64)))) (PreH6 : (block_width <> 1)) (PreH7 : (xt_valid F W G )) (PreH8 : (input = (xt_input (G)))) (PreH9 : (output = (xt_output_base (G)))) (PreH10 : (input_stride = (xt_input_stride (G)))) (PreH11 : (output_stride = (xt_output_stride (G)))) (PreH12 : (block_width = (xt_width (G)))) (PreH13 : (block_height = (xt_height (G)))) (PreH14 : (sizeof(UINT) = 4)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (sizeof(UINT64) = 8)) (PreH17 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH18 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  (xt_progress F G old old ((xt_total (G)) - 0 ) 0 0 )
.

Definition test_rvv_entail_wit_2_1_split_goal_2 := 
forall (G: XTLayout) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height = 0)) (PreH2 : (block_width = 0)) (PreH3 : (input_stride >= (unsigned_last_nbits ((block_width * sizeof(UINT) )) (64)))) (PreH4 : (block_height <> 1)) (PreH5 : (output_stride >= (unsigned_last_nbits ((block_height * sizeof(UINT) )) (64)))) (PreH6 : (block_width <> 1)) (PreH7 : (xt_valid F W G )) (PreH8 : (input = (xt_input (G)))) (PreH9 : (output = (xt_output_base (G)))) (PreH10 : (input_stride = (xt_input_stride (G)))) (PreH11 : (output_stride = (xt_output_stride (G)))) (PreH12 : (block_width = (xt_width (G)))) (PreH13 : (block_height = (xt_height (G)))) (PreH14 : (sizeof(UINT) = 4)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (sizeof(UINT64) = 8)) (PreH17 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH18 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  (output = (xt_current_output (G) (((xt_total (G)) - 0 )) (0)))
.

Definition test_rvv_entail_wit_2_1_split_goal_3 := 
forall (G: XTLayout) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height = 0)) (PreH2 : (block_width = 0)) (PreH3 : (input_stride >= (unsigned_last_nbits ((block_width * sizeof(UINT) )) (64)))) (PreH4 : (block_height <> 1)) (PreH5 : (output_stride >= (unsigned_last_nbits ((block_height * sizeof(UINT) )) (64)))) (PreH6 : (block_width <> 1)) (PreH7 : (xt_valid F W G )) (PreH8 : (input = (xt_input (G)))) (PreH9 : (output = (xt_output_base (G)))) (PreH10 : (input_stride = (xt_input_stride (G)))) (PreH11 : (output_stride = (xt_output_stride (G)))) (PreH12 : (block_width = (xt_width (G)))) (PreH13 : (block_height = (xt_height (G)))) (PreH14 : (sizeof(UINT) = 4)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (sizeof(UINT64) = 8)) (PreH17 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH18 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  (input = (xt_current_input (G) (((xt_total (G)) - 0 )) (0)))
.

Definition test_rvv_entail_wit_2_1_split_goal_4 := 
forall (G: XTLayout) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height = 0)) (PreH2 : (block_width = 0)) (PreH3 : (input_stride >= (unsigned_last_nbits ((block_width * sizeof(UINT) )) (64)))) (PreH4 : (block_height <> 1)) (PreH5 : (output_stride >= (unsigned_last_nbits ((block_height * sizeof(UINT) )) (64)))) (PreH6 : (block_width <> 1)) (PreH7 : (xt_valid F W G )) (PreH8 : (input = (xt_input (G)))) (PreH9 : (output = (xt_output_base (G)))) (PreH10 : (input_stride = (xt_input_stride (G)))) (PreH11 : (output_stride = (xt_output_stride (G)))) (PreH12 : (block_width = (xt_width (G)))) (PreH13 : (block_height = (xt_height (G)))) (PreH14 : (sizeof(UINT) = 4)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (sizeof(UINT64) = 8)) (PreH17 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH18 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  (0 <= (xt_total (G)))
.

Definition test_rvv_entail_wit_2_2 := 
(
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height = 0)) (PreH2 : (block_width <> 0)) (PreH3 : (input_stride >= (block_width * sizeof(UINT) ))) (PreH4 : (block_height <> 1)) (PreH5 : (block_width = 1)) (PreH6 : (xt_valid F W G )) (PreH7 : (input = (xt_input (G)))) (PreH8 : (output = (xt_output_base (G)))) (PreH9 : (input_stride = (xt_input_stride (G)))) (PreH10 : (output_stride = (xt_output_stride (G)))) (PreH11 : (block_width = (xt_width (G)))) (PreH12 : (block_height = (xt_height (G)))) (PreH13 : (sizeof(UINT) = 4)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (block_width = 1)) (PreH17 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  (xt_data F )
  **  (xt_output W old )
|--
  EX (R: XTOutput) ,
  “ (xt_valid F W G ) ” 
  &&  “ (input_stride = (xt_input_stride (G))) ” 
  &&  “ (output_stride = (xt_output_stride (G))) ” 
  &&  “ (block_width = (xt_width (G))) ” 
  &&  “ (block_height = (xt_height (G))) ” 
  &&  “ (sizeof(UINT) = 4) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (0 <= 0) ” 
  &&  “ (0 <= (xt_total (G))) ” 
  &&  “ (input = (xt_current_input (G) (((xt_total (G)) - 0 )) (0))) ” 
  &&  “ (output = (xt_current_output (G) (((xt_total (G)) - 0 )) (0))) ” 
  &&  “ (xt_progress F G old R ((xt_total (G)) - 0 ) 0 0 ) ”
  &&  (xt_data F )
  **  (xt_output W R )
) \/
(
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height = 0)) (PreH2 : (block_width <> 0)) (PreH3 : (input_stride >= (block_width * sizeof(UINT) ))) (PreH4 : (block_height <> 1)) (PreH5 : (block_width = 1)) (PreH6 : (xt_valid F W G )) (PreH7 : (input = (xt_input (G)))) (PreH8 : (output = (xt_output_base (G)))) (PreH9 : (input_stride = (xt_input_stride (G)))) (PreH10 : (output_stride = (xt_output_stride (G)))) (PreH11 : (block_width = (xt_width (G)))) (PreH12 : (block_height = (xt_height (G)))) (PreH13 : (sizeof(UINT) = 4)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (block_width = 1)) (PreH17 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  TT && emp 
|--
  “ (xt_progress F G old old ((xt_total (G)) - 0 ) 0 0 ) ” 
  &&  “ (output = (xt_current_output (G) (((xt_total (G)) - 0 )) (0))) ” 
  &&  “ (input = (xt_current_input (G) (((xt_total (G)) - 0 )) (0))) ” 
  &&  “ (0 <= (xt_total (G))) ”
  &&  emp
).

Definition test_rvv_entail_wit_2_2_split_goal_1 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height = 0)) (PreH2 : (block_width <> 0)) (PreH3 : (input_stride >= (block_width * sizeof(UINT) ))) (PreH4 : (block_height <> 1)) (PreH5 : (block_width = 1)) (PreH6 : (xt_valid F W G )) (PreH7 : (input = (xt_input (G)))) (PreH8 : (output = (xt_output_base (G)))) (PreH9 : (input_stride = (xt_input_stride (G)))) (PreH10 : (output_stride = (xt_output_stride (G)))) (PreH11 : (block_width = (xt_width (G)))) (PreH12 : (block_height = (xt_height (G)))) (PreH13 : (sizeof(UINT) = 4)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (block_width = 1)) (PreH17 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  (xt_progress F G old old ((xt_total (G)) - 0 ) 0 0 )
.

Definition test_rvv_entail_wit_2_2_split_goal_2 := 
forall (G: XTLayout) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height = 0)) (PreH2 : (block_width <> 0)) (PreH3 : (input_stride >= (block_width * sizeof(UINT) ))) (PreH4 : (block_height <> 1)) (PreH5 : (block_width = 1)) (PreH6 : (xt_valid F W G )) (PreH7 : (input = (xt_input (G)))) (PreH8 : (output = (xt_output_base (G)))) (PreH9 : (input_stride = (xt_input_stride (G)))) (PreH10 : (output_stride = (xt_output_stride (G)))) (PreH11 : (block_width = (xt_width (G)))) (PreH12 : (block_height = (xt_height (G)))) (PreH13 : (sizeof(UINT) = 4)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (block_width = 1)) (PreH17 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  (output = (xt_current_output (G) (((xt_total (G)) - 0 )) (0)))
.

Definition test_rvv_entail_wit_2_2_split_goal_3 := 
forall (G: XTLayout) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height = 0)) (PreH2 : (block_width <> 0)) (PreH3 : (input_stride >= (block_width * sizeof(UINT) ))) (PreH4 : (block_height <> 1)) (PreH5 : (block_width = 1)) (PreH6 : (xt_valid F W G )) (PreH7 : (input = (xt_input (G)))) (PreH8 : (output = (xt_output_base (G)))) (PreH9 : (input_stride = (xt_input_stride (G)))) (PreH10 : (output_stride = (xt_output_stride (G)))) (PreH11 : (block_width = (xt_width (G)))) (PreH12 : (block_height = (xt_height (G)))) (PreH13 : (sizeof(UINT) = 4)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (block_width = 1)) (PreH17 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  (input = (xt_current_input (G) (((xt_total (G)) - 0 )) (0)))
.

Definition test_rvv_entail_wit_2_2_split_goal_4 := 
forall (G: XTLayout) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height = 0)) (PreH2 : (block_width <> 0)) (PreH3 : (input_stride >= (block_width * sizeof(UINT) ))) (PreH4 : (block_height <> 1)) (PreH5 : (block_width = 1)) (PreH6 : (xt_valid F W G )) (PreH7 : (input = (xt_input (G)))) (PreH8 : (output = (xt_output_base (G)))) (PreH9 : (input_stride = (xt_input_stride (G)))) (PreH10 : (output_stride = (xt_output_stride (G)))) (PreH11 : (block_width = (xt_width (G)))) (PreH12 : (block_height = (xt_height (G)))) (PreH13 : (sizeof(UINT) = 4)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (block_width = 1)) (PreH17 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  (0 <= (xt_total (G)))
.

Definition test_rvv_entail_wit_2_3 := 
(
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height = 0)) (PreH2 : (block_width <> 0)) (PreH3 : (input_stride >= (block_width * sizeof(UINT) ))) (PreH4 : (block_height <> 1)) (PreH5 : (block_width = 1)) (PreH6 : (xt_valid F W G )) (PreH7 : (input = (xt_input (G)))) (PreH8 : (output = (xt_output_base (G)))) (PreH9 : (input_stride = (xt_input_stride (G)))) (PreH10 : (output_stride = (xt_output_stride (G)))) (PreH11 : (block_width = (xt_width (G)))) (PreH12 : (block_height = (xt_height (G)))) (PreH13 : (sizeof(UINT) = 4)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH17 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  (xt_data F )
  **  (xt_output W old )
|--
  EX (R: XTOutput) ,
  “ (xt_valid F W G ) ” 
  &&  “ (input_stride = (xt_input_stride (G))) ” 
  &&  “ (output_stride = (xt_output_stride (G))) ” 
  &&  “ (block_width = (xt_width (G))) ” 
  &&  “ (block_height = (xt_height (G))) ” 
  &&  “ (sizeof(UINT) = 4) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (0 <= 0) ” 
  &&  “ (0 <= (xt_total (G))) ” 
  &&  “ (input = (xt_current_input (G) (((xt_total (G)) - 0 )) (0))) ” 
  &&  “ (output = (xt_current_output (G) (((xt_total (G)) - 0 )) (0))) ” 
  &&  “ (xt_progress F G old R ((xt_total (G)) - 0 ) 0 0 ) ”
  &&  (xt_data F )
  **  (xt_output W R )
) \/
(
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height = 0)) (PreH2 : (block_width <> 0)) (PreH3 : (input_stride >= (block_width * sizeof(UINT) ))) (PreH4 : (block_height <> 1)) (PreH5 : (block_width = 1)) (PreH6 : (xt_valid F W G )) (PreH7 : (input = (xt_input (G)))) (PreH8 : (output = (xt_output_base (G)))) (PreH9 : (input_stride = (xt_input_stride (G)))) (PreH10 : (output_stride = (xt_output_stride (G)))) (PreH11 : (block_width = (xt_width (G)))) (PreH12 : (block_height = (xt_height (G)))) (PreH13 : (sizeof(UINT) = 4)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH17 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  TT && emp 
|--
  “ (xt_progress F G old old ((xt_total (G)) - 0 ) 0 0 ) ” 
  &&  “ (output = (xt_current_output (G) (((xt_total (G)) - 0 )) (0))) ” 
  &&  “ (input = (xt_current_input (G) (((xt_total (G)) - 0 )) (0))) ” 
  &&  “ (0 <= (xt_total (G))) ”
  &&  emp
).

Definition test_rvv_entail_wit_2_3_split_goal_1 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height = 0)) (PreH2 : (block_width <> 0)) (PreH3 : (input_stride >= (block_width * sizeof(UINT) ))) (PreH4 : (block_height <> 1)) (PreH5 : (block_width = 1)) (PreH6 : (xt_valid F W G )) (PreH7 : (input = (xt_input (G)))) (PreH8 : (output = (xt_output_base (G)))) (PreH9 : (input_stride = (xt_input_stride (G)))) (PreH10 : (output_stride = (xt_output_stride (G)))) (PreH11 : (block_width = (xt_width (G)))) (PreH12 : (block_height = (xt_height (G)))) (PreH13 : (sizeof(UINT) = 4)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH17 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  (xt_progress F G old old ((xt_total (G)) - 0 ) 0 0 )
.

Definition test_rvv_entail_wit_2_3_split_goal_2 := 
forall (G: XTLayout) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height = 0)) (PreH2 : (block_width <> 0)) (PreH3 : (input_stride >= (block_width * sizeof(UINT) ))) (PreH4 : (block_height <> 1)) (PreH5 : (block_width = 1)) (PreH6 : (xt_valid F W G )) (PreH7 : (input = (xt_input (G)))) (PreH8 : (output = (xt_output_base (G)))) (PreH9 : (input_stride = (xt_input_stride (G)))) (PreH10 : (output_stride = (xt_output_stride (G)))) (PreH11 : (block_width = (xt_width (G)))) (PreH12 : (block_height = (xt_height (G)))) (PreH13 : (sizeof(UINT) = 4)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH17 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  (output = (xt_current_output (G) (((xt_total (G)) - 0 )) (0)))
.

Definition test_rvv_entail_wit_2_3_split_goal_3 := 
forall (G: XTLayout) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height = 0)) (PreH2 : (block_width <> 0)) (PreH3 : (input_stride >= (block_width * sizeof(UINT) ))) (PreH4 : (block_height <> 1)) (PreH5 : (block_width = 1)) (PreH6 : (xt_valid F W G )) (PreH7 : (input = (xt_input (G)))) (PreH8 : (output = (xt_output_base (G)))) (PreH9 : (input_stride = (xt_input_stride (G)))) (PreH10 : (output_stride = (xt_output_stride (G)))) (PreH11 : (block_width = (xt_width (G)))) (PreH12 : (block_height = (xt_height (G)))) (PreH13 : (sizeof(UINT) = 4)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH17 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  (input = (xt_current_input (G) (((xt_total (G)) - 0 )) (0)))
.

Definition test_rvv_entail_wit_2_3_split_goal_4 := 
forall (G: XTLayout) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height = 0)) (PreH2 : (block_width <> 0)) (PreH3 : (input_stride >= (block_width * sizeof(UINT) ))) (PreH4 : (block_height <> 1)) (PreH5 : (block_width = 1)) (PreH6 : (xt_valid F W G )) (PreH7 : (input = (xt_input (G)))) (PreH8 : (output = (xt_output_base (G)))) (PreH9 : (input_stride = (xt_input_stride (G)))) (PreH10 : (output_stride = (xt_output_stride (G)))) (PreH11 : (block_width = (xt_width (G)))) (PreH12 : (block_height = (xt_height (G)))) (PreH13 : (sizeof(UINT) = 4)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH17 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  (0 <= (xt_total (G)))
.

Definition test_rvv_entail_wit_2_4 := 
(
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height = 0)) (PreH2 : (block_width <> 0)) (PreH3 : (input_stride >= (unsigned_last_nbits ((block_width * sizeof(UINT) )) (64)))) (PreH4 : (block_height <> 1)) (PreH5 : (output_stride >= (unsigned_last_nbits ((block_height * sizeof(UINT) )) (64)))) (PreH6 : (block_width <> 1)) (PreH7 : (xt_valid F W G )) (PreH8 : (input = (xt_input (G)))) (PreH9 : (output = (xt_output_base (G)))) (PreH10 : (input_stride = (xt_input_stride (G)))) (PreH11 : (output_stride = (xt_output_stride (G)))) (PreH12 : (block_width = (xt_width (G)))) (PreH13 : (block_height = (xt_height (G)))) (PreH14 : (sizeof(UINT) = 4)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (sizeof(UINT64) = 8)) (PreH17 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH18 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  (xt_data F )
  **  (xt_output W old )
|--
  EX (R: XTOutput) ,
  “ (xt_valid F W G ) ” 
  &&  “ (input_stride = (xt_input_stride (G))) ” 
  &&  “ (output_stride = (xt_output_stride (G))) ” 
  &&  “ (block_width = (xt_width (G))) ” 
  &&  “ (block_height = (xt_height (G))) ” 
  &&  “ (sizeof(UINT) = 4) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (0 <= 0) ” 
  &&  “ (0 <= (xt_total (G))) ” 
  &&  “ (input = (xt_current_input (G) (((xt_total (G)) - 0 )) (0))) ” 
  &&  “ (output = (xt_current_output (G) (((xt_total (G)) - 0 )) (0))) ” 
  &&  “ (xt_progress F G old R ((xt_total (G)) - 0 ) 0 0 ) ”
  &&  (xt_data F )
  **  (xt_output W R )
) \/
(
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height = 0)) (PreH2 : (block_width <> 0)) (PreH3 : (input_stride >= (unsigned_last_nbits ((block_width * sizeof(UINT) )) (64)))) (PreH4 : (block_height <> 1)) (PreH5 : (output_stride >= (unsigned_last_nbits ((block_height * sizeof(UINT) )) (64)))) (PreH6 : (block_width <> 1)) (PreH7 : (xt_valid F W G )) (PreH8 : (input = (xt_input (G)))) (PreH9 : (output = (xt_output_base (G)))) (PreH10 : (input_stride = (xt_input_stride (G)))) (PreH11 : (output_stride = (xt_output_stride (G)))) (PreH12 : (block_width = (xt_width (G)))) (PreH13 : (block_height = (xt_height (G)))) (PreH14 : (sizeof(UINT) = 4)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (sizeof(UINT64) = 8)) (PreH17 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH18 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  TT && emp 
|--
  “ (xt_progress F G old old ((xt_total (G)) - 0 ) 0 0 ) ” 
  &&  “ (output = (xt_current_output (G) (((xt_total (G)) - 0 )) (0))) ” 
  &&  “ (input = (xt_current_input (G) (((xt_total (G)) - 0 )) (0))) ” 
  &&  “ (0 <= (xt_total (G))) ”
  &&  emp
).

Definition test_rvv_entail_wit_2_4_split_goal_1 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height = 0)) (PreH2 : (block_width <> 0)) (PreH3 : (input_stride >= (unsigned_last_nbits ((block_width * sizeof(UINT) )) (64)))) (PreH4 : (block_height <> 1)) (PreH5 : (output_stride >= (unsigned_last_nbits ((block_height * sizeof(UINT) )) (64)))) (PreH6 : (block_width <> 1)) (PreH7 : (xt_valid F W G )) (PreH8 : (input = (xt_input (G)))) (PreH9 : (output = (xt_output_base (G)))) (PreH10 : (input_stride = (xt_input_stride (G)))) (PreH11 : (output_stride = (xt_output_stride (G)))) (PreH12 : (block_width = (xt_width (G)))) (PreH13 : (block_height = (xt_height (G)))) (PreH14 : (sizeof(UINT) = 4)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (sizeof(UINT64) = 8)) (PreH17 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH18 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  (xt_progress F G old old ((xt_total (G)) - 0 ) 0 0 )
.

Definition test_rvv_entail_wit_2_4_split_goal_2 := 
forall (G: XTLayout) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height = 0)) (PreH2 : (block_width <> 0)) (PreH3 : (input_stride >= (unsigned_last_nbits ((block_width * sizeof(UINT) )) (64)))) (PreH4 : (block_height <> 1)) (PreH5 : (output_stride >= (unsigned_last_nbits ((block_height * sizeof(UINT) )) (64)))) (PreH6 : (block_width <> 1)) (PreH7 : (xt_valid F W G )) (PreH8 : (input = (xt_input (G)))) (PreH9 : (output = (xt_output_base (G)))) (PreH10 : (input_stride = (xt_input_stride (G)))) (PreH11 : (output_stride = (xt_output_stride (G)))) (PreH12 : (block_width = (xt_width (G)))) (PreH13 : (block_height = (xt_height (G)))) (PreH14 : (sizeof(UINT) = 4)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (sizeof(UINT64) = 8)) (PreH17 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH18 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  (output = (xt_current_output (G) (((xt_total (G)) - 0 )) (0)))
.

Definition test_rvv_entail_wit_2_4_split_goal_3 := 
forall (G: XTLayout) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height = 0)) (PreH2 : (block_width <> 0)) (PreH3 : (input_stride >= (unsigned_last_nbits ((block_width * sizeof(UINT) )) (64)))) (PreH4 : (block_height <> 1)) (PreH5 : (output_stride >= (unsigned_last_nbits ((block_height * sizeof(UINT) )) (64)))) (PreH6 : (block_width <> 1)) (PreH7 : (xt_valid F W G )) (PreH8 : (input = (xt_input (G)))) (PreH9 : (output = (xt_output_base (G)))) (PreH10 : (input_stride = (xt_input_stride (G)))) (PreH11 : (output_stride = (xt_output_stride (G)))) (PreH12 : (block_width = (xt_width (G)))) (PreH13 : (block_height = (xt_height (G)))) (PreH14 : (sizeof(UINT) = 4)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (sizeof(UINT64) = 8)) (PreH17 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH18 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  (input = (xt_current_input (G) (((xt_total (G)) - 0 )) (0)))
.

Definition test_rvv_entail_wit_2_4_split_goal_4 := 
forall (G: XTLayout) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height = 0)) (PreH2 : (block_width <> 0)) (PreH3 : (input_stride >= (unsigned_last_nbits ((block_width * sizeof(UINT) )) (64)))) (PreH4 : (block_height <> 1)) (PreH5 : (output_stride >= (unsigned_last_nbits ((block_height * sizeof(UINT) )) (64)))) (PreH6 : (block_width <> 1)) (PreH7 : (xt_valid F W G )) (PreH8 : (input = (xt_input (G)))) (PreH9 : (output = (xt_output_base (G)))) (PreH10 : (input_stride = (xt_input_stride (G)))) (PreH11 : (output_stride = (xt_output_stride (G)))) (PreH12 : (block_width = (xt_width (G)))) (PreH13 : (block_height = (xt_height (G)))) (PreH14 : (sizeof(UINT) = 4)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (sizeof(UINT64) = 8)) (PreH17 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH18 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  (0 <= (xt_total (G)))
.

Definition test_rvv_entail_wit_2_5 := 
(
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height <> 0)) (PreH2 : (block_width = 0)) (PreH3 : (block_height = 1)) (PreH4 : (output_stride >= (unsigned_last_nbits ((block_height * sizeof(UINT) )) (64)))) (PreH5 : (block_width <> 1)) (PreH6 : (xt_valid F W G )) (PreH7 : (input = (xt_input (G)))) (PreH8 : (output = (xt_output_base (G)))) (PreH9 : (input_stride = (xt_input_stride (G)))) (PreH10 : (output_stride = (xt_output_stride (G)))) (PreH11 : (block_width = (xt_width (G)))) (PreH12 : (block_height = (xt_height (G)))) (PreH13 : (sizeof(UINT) = 4)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH17 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  (xt_data F )
  **  (xt_output W old )
|--
  EX (R: XTOutput) ,
  “ (xt_valid F W G ) ” 
  &&  “ (input_stride = (xt_input_stride (G))) ” 
  &&  “ (output_stride = (xt_output_stride (G))) ” 
  &&  “ (block_width = (xt_width (G))) ” 
  &&  “ (block_height = (xt_height (G))) ” 
  &&  “ (sizeof(UINT) = 4) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (0 <= 1) ” 
  &&  “ (1 <= (xt_total (G))) ” 
  &&  “ (input = (xt_current_input (G) (((xt_total (G)) - 1 )) (0))) ” 
  &&  “ (output = (xt_current_output (G) (((xt_total (G)) - 1 )) (0))) ” 
  &&  “ (xt_progress F G old R ((xt_total (G)) - 1 ) 0 0 ) ”
  &&  (xt_data F )
  **  (xt_output W R )
) \/
(
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height <> 0)) (PreH2 : (block_width = 0)) (PreH3 : (block_height = 1)) (PreH4 : (output_stride >= (unsigned_last_nbits ((block_height * sizeof(UINT) )) (64)))) (PreH5 : (block_width <> 1)) (PreH6 : (xt_valid F W G )) (PreH7 : (input = (xt_input (G)))) (PreH8 : (output = (xt_output_base (G)))) (PreH9 : (input_stride = (xt_input_stride (G)))) (PreH10 : (output_stride = (xt_output_stride (G)))) (PreH11 : (block_width = (xt_width (G)))) (PreH12 : (block_height = (xt_height (G)))) (PreH13 : (sizeof(UINT) = 4)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH17 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  TT && emp 
|--
  “ (xt_progress F G old old ((xt_total (G)) - 1 ) 0 0 ) ” 
  &&  “ (output = (xt_current_output (G) (((xt_total (G)) - 1 )) (0))) ” 
  &&  “ (input = (xt_current_input (G) (((xt_total (G)) - 1 )) (0))) ” 
  &&  “ (1 <= (xt_total (G))) ”
  &&  emp
).

Definition test_rvv_entail_wit_2_5_split_goal_1 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height <> 0)) (PreH2 : (block_width = 0)) (PreH3 : (block_height = 1)) (PreH4 : (output_stride >= (unsigned_last_nbits ((block_height * sizeof(UINT) )) (64)))) (PreH5 : (block_width <> 1)) (PreH6 : (xt_valid F W G )) (PreH7 : (input = (xt_input (G)))) (PreH8 : (output = (xt_output_base (G)))) (PreH9 : (input_stride = (xt_input_stride (G)))) (PreH10 : (output_stride = (xt_output_stride (G)))) (PreH11 : (block_width = (xt_width (G)))) (PreH12 : (block_height = (xt_height (G)))) (PreH13 : (sizeof(UINT) = 4)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH17 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  (xt_progress F G old old ((xt_total (G)) - 1 ) 0 0 )
.

Definition test_rvv_entail_wit_2_5_split_goal_2 := 
forall (G: XTLayout) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height <> 0)) (PreH2 : (block_width = 0)) (PreH3 : (block_height = 1)) (PreH4 : (output_stride >= (unsigned_last_nbits ((block_height * sizeof(UINT) )) (64)))) (PreH5 : (block_width <> 1)) (PreH6 : (xt_valid F W G )) (PreH7 : (input = (xt_input (G)))) (PreH8 : (output = (xt_output_base (G)))) (PreH9 : (input_stride = (xt_input_stride (G)))) (PreH10 : (output_stride = (xt_output_stride (G)))) (PreH11 : (block_width = (xt_width (G)))) (PreH12 : (block_height = (xt_height (G)))) (PreH13 : (sizeof(UINT) = 4)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH17 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  (output = (xt_current_output (G) (((xt_total (G)) - 1 )) (0)))
.

Definition test_rvv_entail_wit_2_5_split_goal_3 := 
forall (G: XTLayout) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height <> 0)) (PreH2 : (block_width = 0)) (PreH3 : (block_height = 1)) (PreH4 : (output_stride >= (unsigned_last_nbits ((block_height * sizeof(UINT) )) (64)))) (PreH5 : (block_width <> 1)) (PreH6 : (xt_valid F W G )) (PreH7 : (input = (xt_input (G)))) (PreH8 : (output = (xt_output_base (G)))) (PreH9 : (input_stride = (xt_input_stride (G)))) (PreH10 : (output_stride = (xt_output_stride (G)))) (PreH11 : (block_width = (xt_width (G)))) (PreH12 : (block_height = (xt_height (G)))) (PreH13 : (sizeof(UINT) = 4)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH17 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  (input = (xt_current_input (G) (((xt_total (G)) - 1 )) (0)))
.

Definition test_rvv_entail_wit_2_5_split_goal_4 := 
forall (G: XTLayout) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height <> 0)) (PreH2 : (block_width = 0)) (PreH3 : (block_height = 1)) (PreH4 : (output_stride >= (unsigned_last_nbits ((block_height * sizeof(UINT) )) (64)))) (PreH5 : (block_width <> 1)) (PreH6 : (xt_valid F W G )) (PreH7 : (input = (xt_input (G)))) (PreH8 : (output = (xt_output_base (G)))) (PreH9 : (input_stride = (xt_input_stride (G)))) (PreH10 : (output_stride = (xt_output_stride (G)))) (PreH11 : (block_width = (xt_width (G)))) (PreH12 : (block_height = (xt_height (G)))) (PreH13 : (sizeof(UINT) = 4)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH17 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  (1 <= (xt_total (G)))
.

Definition test_rvv_entail_wit_2_6 := 
(
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height <> 0)) (PreH2 : (block_width = 0)) (PreH3 : (input_stride >= (unsigned_last_nbits ((block_width * sizeof(UINT) )) (64)))) (PreH4 : (block_height <> 1)) (PreH5 : (output_stride >= (unsigned_last_nbits ((block_height * sizeof(UINT) )) (64)))) (PreH6 : (block_width <> 1)) (PreH7 : (xt_valid F W G )) (PreH8 : (input = (xt_input (G)))) (PreH9 : (output = (xt_output_base (G)))) (PreH10 : (input_stride = (xt_input_stride (G)))) (PreH11 : (output_stride = (xt_output_stride (G)))) (PreH12 : (block_width = (xt_width (G)))) (PreH13 : (block_height = (xt_height (G)))) (PreH14 : (sizeof(UINT) = 4)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (sizeof(UINT64) = 8)) (PreH17 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH18 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  (xt_data F )
  **  (xt_output W old )
|--
  EX (R: XTOutput) ,
  “ (xt_valid F W G ) ” 
  &&  “ (input_stride = (xt_input_stride (G))) ” 
  &&  “ (output_stride = (xt_output_stride (G))) ” 
  &&  “ (block_width = (xt_width (G))) ” 
  &&  “ (block_height = (xt_height (G))) ” 
  &&  “ (sizeof(UINT) = 4) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (0 <= 1) ” 
  &&  “ (1 <= (xt_total (G))) ” 
  &&  “ (input = (xt_current_input (G) (((xt_total (G)) - 1 )) (0))) ” 
  &&  “ (output = (xt_current_output (G) (((xt_total (G)) - 1 )) (0))) ” 
  &&  “ (xt_progress F G old R ((xt_total (G)) - 1 ) 0 0 ) ”
  &&  (xt_data F )
  **  (xt_output W R )
) \/
(
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height <> 0)) (PreH2 : (block_width = 0)) (PreH3 : (input_stride >= (unsigned_last_nbits ((block_width * sizeof(UINT) )) (64)))) (PreH4 : (block_height <> 1)) (PreH5 : (output_stride >= (unsigned_last_nbits ((block_height * sizeof(UINT) )) (64)))) (PreH6 : (block_width <> 1)) (PreH7 : (xt_valid F W G )) (PreH8 : (input = (xt_input (G)))) (PreH9 : (output = (xt_output_base (G)))) (PreH10 : (input_stride = (xt_input_stride (G)))) (PreH11 : (output_stride = (xt_output_stride (G)))) (PreH12 : (block_width = (xt_width (G)))) (PreH13 : (block_height = (xt_height (G)))) (PreH14 : (sizeof(UINT) = 4)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (sizeof(UINT64) = 8)) (PreH17 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH18 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  TT && emp 
|--
  “ (xt_progress F G old old ((xt_total (G)) - 1 ) 0 0 ) ” 
  &&  “ (output = (xt_current_output (G) (((xt_total (G)) - 1 )) (0))) ” 
  &&  “ (input = (xt_current_input (G) (((xt_total (G)) - 1 )) (0))) ” 
  &&  “ (1 <= (xt_total (G))) ”
  &&  emp
).

Definition test_rvv_entail_wit_2_6_split_goal_1 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height <> 0)) (PreH2 : (block_width = 0)) (PreH3 : (input_stride >= (unsigned_last_nbits ((block_width * sizeof(UINT) )) (64)))) (PreH4 : (block_height <> 1)) (PreH5 : (output_stride >= (unsigned_last_nbits ((block_height * sizeof(UINT) )) (64)))) (PreH6 : (block_width <> 1)) (PreH7 : (xt_valid F W G )) (PreH8 : (input = (xt_input (G)))) (PreH9 : (output = (xt_output_base (G)))) (PreH10 : (input_stride = (xt_input_stride (G)))) (PreH11 : (output_stride = (xt_output_stride (G)))) (PreH12 : (block_width = (xt_width (G)))) (PreH13 : (block_height = (xt_height (G)))) (PreH14 : (sizeof(UINT) = 4)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (sizeof(UINT64) = 8)) (PreH17 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH18 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  (xt_progress F G old old ((xt_total (G)) - 1 ) 0 0 )
.

Definition test_rvv_entail_wit_2_6_split_goal_2 := 
forall (G: XTLayout) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height <> 0)) (PreH2 : (block_width = 0)) (PreH3 : (input_stride >= (unsigned_last_nbits ((block_width * sizeof(UINT) )) (64)))) (PreH4 : (block_height <> 1)) (PreH5 : (output_stride >= (unsigned_last_nbits ((block_height * sizeof(UINT) )) (64)))) (PreH6 : (block_width <> 1)) (PreH7 : (xt_valid F W G )) (PreH8 : (input = (xt_input (G)))) (PreH9 : (output = (xt_output_base (G)))) (PreH10 : (input_stride = (xt_input_stride (G)))) (PreH11 : (output_stride = (xt_output_stride (G)))) (PreH12 : (block_width = (xt_width (G)))) (PreH13 : (block_height = (xt_height (G)))) (PreH14 : (sizeof(UINT) = 4)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (sizeof(UINT64) = 8)) (PreH17 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH18 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  (output = (xt_current_output (G) (((xt_total (G)) - 1 )) (0)))
.

Definition test_rvv_entail_wit_2_6_split_goal_3 := 
forall (G: XTLayout) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height <> 0)) (PreH2 : (block_width = 0)) (PreH3 : (input_stride >= (unsigned_last_nbits ((block_width * sizeof(UINT) )) (64)))) (PreH4 : (block_height <> 1)) (PreH5 : (output_stride >= (unsigned_last_nbits ((block_height * sizeof(UINT) )) (64)))) (PreH6 : (block_width <> 1)) (PreH7 : (xt_valid F W G )) (PreH8 : (input = (xt_input (G)))) (PreH9 : (output = (xt_output_base (G)))) (PreH10 : (input_stride = (xt_input_stride (G)))) (PreH11 : (output_stride = (xt_output_stride (G)))) (PreH12 : (block_width = (xt_width (G)))) (PreH13 : (block_height = (xt_height (G)))) (PreH14 : (sizeof(UINT) = 4)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (sizeof(UINT64) = 8)) (PreH17 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH18 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  (input = (xt_current_input (G) (((xt_total (G)) - 1 )) (0)))
.

Definition test_rvv_entail_wit_2_6_split_goal_4 := 
forall (G: XTLayout) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height <> 0)) (PreH2 : (block_width = 0)) (PreH3 : (input_stride >= (unsigned_last_nbits ((block_width * sizeof(UINT) )) (64)))) (PreH4 : (block_height <> 1)) (PreH5 : (output_stride >= (unsigned_last_nbits ((block_height * sizeof(UINT) )) (64)))) (PreH6 : (block_width <> 1)) (PreH7 : (xt_valid F W G )) (PreH8 : (input = (xt_input (G)))) (PreH9 : (output = (xt_output_base (G)))) (PreH10 : (input_stride = (xt_input_stride (G)))) (PreH11 : (output_stride = (xt_output_stride (G)))) (PreH12 : (block_width = (xt_width (G)))) (PreH13 : (block_height = (xt_height (G)))) (PreH14 : (sizeof(UINT) = 4)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (sizeof(UINT64) = 8)) (PreH17 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH18 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  (1 <= (xt_total (G)))
.

Definition test_rvv_entail_wit_2_7 := 
(
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height <> 0)) (PreH2 : (block_width = 0)) (PreH3 : (block_height = 1)) (PreH4 : (output_stride >= (block_height * sizeof(UINT) ))) (PreH5 : (block_width <> 1)) (PreH6 : (xt_valid F W G )) (PreH7 : (input = (xt_input (G)))) (PreH8 : (output = (xt_output_base (G)))) (PreH9 : (input_stride = (xt_input_stride (G)))) (PreH10 : (output_stride = (xt_output_stride (G)))) (PreH11 : (block_width = (xt_width (G)))) (PreH12 : (block_height = (xt_height (G)))) (PreH13 : (sizeof(UINT) = 4)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH17 : (block_height = 1)) ,
  (xt_data F )
  **  (xt_output W old )
|--
  EX (R: XTOutput) ,
  “ (xt_valid F W G ) ” 
  &&  “ (input_stride = (xt_input_stride (G))) ” 
  &&  “ (output_stride = (xt_output_stride (G))) ” 
  &&  “ (block_width = (xt_width (G))) ” 
  &&  “ (block_height = (xt_height (G))) ” 
  &&  “ (sizeof(UINT) = 4) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (0 <= 1) ” 
  &&  “ (1 <= (xt_total (G))) ” 
  &&  “ (input = (xt_current_input (G) (((xt_total (G)) - 1 )) (0))) ” 
  &&  “ (output = (xt_current_output (G) (((xt_total (G)) - 1 )) (0))) ” 
  &&  “ (xt_progress F G old R ((xt_total (G)) - 1 ) 0 0 ) ”
  &&  (xt_data F )
  **  (xt_output W R )
) \/
(
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height <> 0)) (PreH2 : (block_width = 0)) (PreH3 : (block_height = 1)) (PreH4 : (output_stride >= (block_height * sizeof(UINT) ))) (PreH5 : (block_width <> 1)) (PreH6 : (xt_valid F W G )) (PreH7 : (input = (xt_input (G)))) (PreH8 : (output = (xt_output_base (G)))) (PreH9 : (input_stride = (xt_input_stride (G)))) (PreH10 : (output_stride = (xt_output_stride (G)))) (PreH11 : (block_width = (xt_width (G)))) (PreH12 : (block_height = (xt_height (G)))) (PreH13 : (sizeof(UINT) = 4)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH17 : (block_height = 1)) ,
  TT && emp 
|--
  “ (xt_progress F G old old ((xt_total (G)) - 1 ) 0 0 ) ” 
  &&  “ (output = (xt_current_output (G) (((xt_total (G)) - 1 )) (0))) ” 
  &&  “ (input = (xt_current_input (G) (((xt_total (G)) - 1 )) (0))) ” 
  &&  “ (1 <= (xt_total (G))) ”
  &&  emp
).

Definition test_rvv_entail_wit_2_7_split_goal_1 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height <> 0)) (PreH2 : (block_width = 0)) (PreH3 : (block_height = 1)) (PreH4 : (output_stride >= (block_height * sizeof(UINT) ))) (PreH5 : (block_width <> 1)) (PreH6 : (xt_valid F W G )) (PreH7 : (input = (xt_input (G)))) (PreH8 : (output = (xt_output_base (G)))) (PreH9 : (input_stride = (xt_input_stride (G)))) (PreH10 : (output_stride = (xt_output_stride (G)))) (PreH11 : (block_width = (xt_width (G)))) (PreH12 : (block_height = (xt_height (G)))) (PreH13 : (sizeof(UINT) = 4)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH17 : (block_height = 1)) ,
  (xt_progress F G old old ((xt_total (G)) - 1 ) 0 0 )
.

Definition test_rvv_entail_wit_2_7_split_goal_2 := 
forall (G: XTLayout) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height <> 0)) (PreH2 : (block_width = 0)) (PreH3 : (block_height = 1)) (PreH4 : (output_stride >= (block_height * sizeof(UINT) ))) (PreH5 : (block_width <> 1)) (PreH6 : (xt_valid F W G )) (PreH7 : (input = (xt_input (G)))) (PreH8 : (output = (xt_output_base (G)))) (PreH9 : (input_stride = (xt_input_stride (G)))) (PreH10 : (output_stride = (xt_output_stride (G)))) (PreH11 : (block_width = (xt_width (G)))) (PreH12 : (block_height = (xt_height (G)))) (PreH13 : (sizeof(UINT) = 4)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH17 : (block_height = 1)) ,
  (output = (xt_current_output (G) (((xt_total (G)) - 1 )) (0)))
.

Definition test_rvv_entail_wit_2_7_split_goal_3 := 
forall (G: XTLayout) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height <> 0)) (PreH2 : (block_width = 0)) (PreH3 : (block_height = 1)) (PreH4 : (output_stride >= (block_height * sizeof(UINT) ))) (PreH5 : (block_width <> 1)) (PreH6 : (xt_valid F W G )) (PreH7 : (input = (xt_input (G)))) (PreH8 : (output = (xt_output_base (G)))) (PreH9 : (input_stride = (xt_input_stride (G)))) (PreH10 : (output_stride = (xt_output_stride (G)))) (PreH11 : (block_width = (xt_width (G)))) (PreH12 : (block_height = (xt_height (G)))) (PreH13 : (sizeof(UINT) = 4)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH17 : (block_height = 1)) ,
  (input = (xt_current_input (G) (((xt_total (G)) - 1 )) (0)))
.

Definition test_rvv_entail_wit_2_7_split_goal_4 := 
forall (G: XTLayout) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height <> 0)) (PreH2 : (block_width = 0)) (PreH3 : (block_height = 1)) (PreH4 : (output_stride >= (block_height * sizeof(UINT) ))) (PreH5 : (block_width <> 1)) (PreH6 : (xt_valid F W G )) (PreH7 : (input = (xt_input (G)))) (PreH8 : (output = (xt_output_base (G)))) (PreH9 : (input_stride = (xt_input_stride (G)))) (PreH10 : (output_stride = (xt_output_stride (G)))) (PreH11 : (block_width = (xt_width (G)))) (PreH12 : (block_height = (xt_height (G)))) (PreH13 : (sizeof(UINT) = 4)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH17 : (block_height = 1)) ,
  (1 <= (xt_total (G)))
.

Definition test_rvv_entail_wit_2_8 := 
(
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height <> 0)) (PreH2 : (block_width <> 0)) (PreH3 : (block_height = 1)) (PreH4 : (block_width = 1)) (PreH5 : (xt_valid F W G )) (PreH6 : (input = (xt_input (G)))) (PreH7 : (output = (xt_output_base (G)))) (PreH8 : (input_stride = (xt_input_stride (G)))) (PreH9 : (output_stride = (xt_output_stride (G)))) (PreH10 : (block_width = (xt_width (G)))) (PreH11 : (block_height = (xt_height (G)))) (PreH12 : (sizeof(UINT) = 4)) (PreH13 : (sizeof(UINT64) = 8)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (block_width = 1)) (PreH16 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  (xt_data F )
  **  (xt_output W old )
|--
  EX (R: XTOutput) ,
  “ (xt_valid F W G ) ” 
  &&  “ (input_stride = (xt_input_stride (G))) ” 
  &&  “ (output_stride = (xt_output_stride (G))) ” 
  &&  “ (block_width = (xt_width (G))) ” 
  &&  “ (block_height = (xt_height (G))) ” 
  &&  “ (sizeof(UINT) = 4) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (0 <= block_width) ” 
  &&  “ (block_width <= (xt_total (G))) ” 
  &&  “ (input = (xt_current_input (G) (((xt_total (G)) - block_width )) (0))) ” 
  &&  “ (output = (xt_current_output (G) (((xt_total (G)) - block_width )) (0))) ” 
  &&  “ (xt_progress F G old R ((xt_total (G)) - block_width ) 0 0 ) ”
  &&  (xt_data F )
  **  (xt_output W R )
) \/
(
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height <> 0)) (PreH2 : (block_width <> 0)) (PreH3 : (block_height = 1)) (PreH4 : (block_width = 1)) (PreH5 : (xt_valid F W G )) (PreH6 : (input = (xt_input (G)))) (PreH7 : (output = (xt_output_base (G)))) (PreH8 : (input_stride = (xt_input_stride (G)))) (PreH9 : (output_stride = (xt_output_stride (G)))) (PreH10 : (block_width = (xt_width (G)))) (PreH11 : (block_height = (xt_height (G)))) (PreH12 : (sizeof(UINT) = 4)) (PreH13 : (sizeof(UINT64) = 8)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (block_width = 1)) (PreH16 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  TT && emp 
|--
  “ (xt_progress F G old old ((xt_total (G)) - 1 ) 0 0 ) ” 
  &&  “ (output = (xt_current_output (G) (((xt_total (G)) - 1 )) (0))) ” 
  &&  “ (input = (xt_current_input (G) (((xt_total (G)) - 1 )) (0))) ” 
  &&  “ (1 <= (xt_total (G))) ”
  &&  emp
).

Definition test_rvv_entail_wit_2_8_split_goal_1 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height <> 0)) (PreH2 : (block_width <> 0)) (PreH3 : (block_height = 1)) (PreH4 : (block_width = 1)) (PreH5 : (xt_valid F W G )) (PreH6 : (input = (xt_input (G)))) (PreH7 : (output = (xt_output_base (G)))) (PreH8 : (input_stride = (xt_input_stride (G)))) (PreH9 : (output_stride = (xt_output_stride (G)))) (PreH10 : (block_width = (xt_width (G)))) (PreH11 : (block_height = (xt_height (G)))) (PreH12 : (sizeof(UINT) = 4)) (PreH13 : (sizeof(UINT64) = 8)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (block_width = 1)) (PreH16 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  (xt_progress F G old old ((xt_total (G)) - 1 ) 0 0 )
.

Definition test_rvv_entail_wit_2_8_split_goal_2 := 
forall (G: XTLayout) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height <> 0)) (PreH2 : (block_width <> 0)) (PreH3 : (block_height = 1)) (PreH4 : (block_width = 1)) (PreH5 : (xt_valid F W G )) (PreH6 : (input = (xt_input (G)))) (PreH7 : (output = (xt_output_base (G)))) (PreH8 : (input_stride = (xt_input_stride (G)))) (PreH9 : (output_stride = (xt_output_stride (G)))) (PreH10 : (block_width = (xt_width (G)))) (PreH11 : (block_height = (xt_height (G)))) (PreH12 : (sizeof(UINT) = 4)) (PreH13 : (sizeof(UINT64) = 8)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (block_width = 1)) (PreH16 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  (output = (xt_current_output (G) (((xt_total (G)) - 1 )) (0)))
.

Definition test_rvv_entail_wit_2_8_split_goal_3 := 
forall (G: XTLayout) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height <> 0)) (PreH2 : (block_width <> 0)) (PreH3 : (block_height = 1)) (PreH4 : (block_width = 1)) (PreH5 : (xt_valid F W G )) (PreH6 : (input = (xt_input (G)))) (PreH7 : (output = (xt_output_base (G)))) (PreH8 : (input_stride = (xt_input_stride (G)))) (PreH9 : (output_stride = (xt_output_stride (G)))) (PreH10 : (block_width = (xt_width (G)))) (PreH11 : (block_height = (xt_height (G)))) (PreH12 : (sizeof(UINT) = 4)) (PreH13 : (sizeof(UINT64) = 8)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (block_width = 1)) (PreH16 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  (input = (xt_current_input (G) (((xt_total (G)) - 1 )) (0)))
.

Definition test_rvv_entail_wit_2_8_split_goal_4 := 
forall (G: XTLayout) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height <> 0)) (PreH2 : (block_width <> 0)) (PreH3 : (block_height = 1)) (PreH4 : (block_width = 1)) (PreH5 : (xt_valid F W G )) (PreH6 : (input = (xt_input (G)))) (PreH7 : (output = (xt_output_base (G)))) (PreH8 : (input_stride = (xt_input_stride (G)))) (PreH9 : (output_stride = (xt_output_stride (G)))) (PreH10 : (block_width = (xt_width (G)))) (PreH11 : (block_height = (xt_height (G)))) (PreH12 : (sizeof(UINT) = 4)) (PreH13 : (sizeof(UINT64) = 8)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (block_width = 1)) (PreH16 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  (1 <= (xt_total (G)))
.

Definition test_rvv_entail_wit_2_9 := 
(
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height <> 0)) (PreH2 : (block_width <> 0)) (PreH3 : (input_stride >= (block_width * sizeof(UINT) ))) (PreH4 : (block_height <> 1)) (PreH5 : (block_width = 1)) (PreH6 : (xt_valid F W G )) (PreH7 : (input = (xt_input (G)))) (PreH8 : (output = (xt_output_base (G)))) (PreH9 : (input_stride = (xt_input_stride (G)))) (PreH10 : (output_stride = (xt_output_stride (G)))) (PreH11 : (block_width = (xt_width (G)))) (PreH12 : (block_height = (xt_height (G)))) (PreH13 : (sizeof(UINT) = 4)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (block_width = 1)) (PreH17 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  (xt_data F )
  **  (xt_output W old )
|--
  EX (R: XTOutput) ,
  “ (xt_valid F W G ) ” 
  &&  “ (input_stride = (xt_input_stride (G))) ” 
  &&  “ (output_stride = (xt_output_stride (G))) ” 
  &&  “ (block_width = (xt_width (G))) ” 
  &&  “ (block_height = (xt_height (G))) ” 
  &&  “ (sizeof(UINT) = 4) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (0 <= block_width) ” 
  &&  “ (block_width <= (xt_total (G))) ” 
  &&  “ (input = (xt_current_input (G) (((xt_total (G)) - block_width )) (0))) ” 
  &&  “ (output = (xt_current_output (G) (((xt_total (G)) - block_width )) (0))) ” 
  &&  “ (xt_progress F G old R ((xt_total (G)) - block_width ) 0 0 ) ”
  &&  (xt_data F )
  **  (xt_output W R )
) \/
(
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height <> 0)) (PreH2 : (block_width <> 0)) (PreH3 : (input_stride >= (block_width * sizeof(UINT) ))) (PreH4 : (block_height <> 1)) (PreH5 : (block_width = 1)) (PreH6 : (xt_valid F W G )) (PreH7 : (input = (xt_input (G)))) (PreH8 : (output = (xt_output_base (G)))) (PreH9 : (input_stride = (xt_input_stride (G)))) (PreH10 : (output_stride = (xt_output_stride (G)))) (PreH11 : (block_width = (xt_width (G)))) (PreH12 : (block_height = (xt_height (G)))) (PreH13 : (sizeof(UINT) = 4)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (block_width = 1)) (PreH17 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  TT && emp 
|--
  “ (xt_progress F G old old ((xt_total (G)) - 1 ) 0 0 ) ” 
  &&  “ (output = (xt_current_output (G) (((xt_total (G)) - 1 )) (0))) ” 
  &&  “ (input = (xt_current_input (G) (((xt_total (G)) - 1 )) (0))) ” 
  &&  “ (1 <= (xt_total (G))) ”
  &&  emp
).

Definition test_rvv_entail_wit_2_9_split_goal_1 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height <> 0)) (PreH2 : (block_width <> 0)) (PreH3 : (input_stride >= (block_width * sizeof(UINT) ))) (PreH4 : (block_height <> 1)) (PreH5 : (block_width = 1)) (PreH6 : (xt_valid F W G )) (PreH7 : (input = (xt_input (G)))) (PreH8 : (output = (xt_output_base (G)))) (PreH9 : (input_stride = (xt_input_stride (G)))) (PreH10 : (output_stride = (xt_output_stride (G)))) (PreH11 : (block_width = (xt_width (G)))) (PreH12 : (block_height = (xt_height (G)))) (PreH13 : (sizeof(UINT) = 4)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (block_width = 1)) (PreH17 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  (xt_progress F G old old ((xt_total (G)) - 1 ) 0 0 )
.

Definition test_rvv_entail_wit_2_9_split_goal_2 := 
forall (G: XTLayout) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height <> 0)) (PreH2 : (block_width <> 0)) (PreH3 : (input_stride >= (block_width * sizeof(UINT) ))) (PreH4 : (block_height <> 1)) (PreH5 : (block_width = 1)) (PreH6 : (xt_valid F W G )) (PreH7 : (input = (xt_input (G)))) (PreH8 : (output = (xt_output_base (G)))) (PreH9 : (input_stride = (xt_input_stride (G)))) (PreH10 : (output_stride = (xt_output_stride (G)))) (PreH11 : (block_width = (xt_width (G)))) (PreH12 : (block_height = (xt_height (G)))) (PreH13 : (sizeof(UINT) = 4)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (block_width = 1)) (PreH17 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  (output = (xt_current_output (G) (((xt_total (G)) - 1 )) (0)))
.

Definition test_rvv_entail_wit_2_9_split_goal_3 := 
forall (G: XTLayout) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height <> 0)) (PreH2 : (block_width <> 0)) (PreH3 : (input_stride >= (block_width * sizeof(UINT) ))) (PreH4 : (block_height <> 1)) (PreH5 : (block_width = 1)) (PreH6 : (xt_valid F W G )) (PreH7 : (input = (xt_input (G)))) (PreH8 : (output = (xt_output_base (G)))) (PreH9 : (input_stride = (xt_input_stride (G)))) (PreH10 : (output_stride = (xt_output_stride (G)))) (PreH11 : (block_width = (xt_width (G)))) (PreH12 : (block_height = (xt_height (G)))) (PreH13 : (sizeof(UINT) = 4)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (block_width = 1)) (PreH17 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  (input = (xt_current_input (G) (((xt_total (G)) - 1 )) (0)))
.

Definition test_rvv_entail_wit_2_9_split_goal_4 := 
forall (G: XTLayout) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height <> 0)) (PreH2 : (block_width <> 0)) (PreH3 : (input_stride >= (block_width * sizeof(UINT) ))) (PreH4 : (block_height <> 1)) (PreH5 : (block_width = 1)) (PreH6 : (xt_valid F W G )) (PreH7 : (input = (xt_input (G)))) (PreH8 : (output = (xt_output_base (G)))) (PreH9 : (input_stride = (xt_input_stride (G)))) (PreH10 : (output_stride = (xt_output_stride (G)))) (PreH11 : (block_width = (xt_width (G)))) (PreH12 : (block_height = (xt_height (G)))) (PreH13 : (sizeof(UINT) = 4)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (block_width = 1)) (PreH17 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  (1 <= (xt_total (G)))
.

Definition test_rvv_entail_wit_2_10 := 
(
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height <> 0)) (PreH2 : (block_width <> 0)) (PreH3 : (block_height = 1)) (PreH4 : (block_width = 1)) (PreH5 : (xt_valid F W G )) (PreH6 : (input = (xt_input (G)))) (PreH7 : (output = (xt_output_base (G)))) (PreH8 : (input_stride = (xt_input_stride (G)))) (PreH9 : (output_stride = (xt_output_stride (G)))) (PreH10 : (block_width = (xt_width (G)))) (PreH11 : (block_height = (xt_height (G)))) (PreH12 : (sizeof(UINT) = 4)) (PreH13 : (sizeof(UINT64) = 8)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (block_width = 1)) (PreH16 : (block_height = 1)) ,
  (xt_data F )
  **  (xt_output W old )
|--
  EX (R: XTOutput) ,
  “ (xt_valid F W G ) ” 
  &&  “ (input_stride = (xt_input_stride (G))) ” 
  &&  “ (output_stride = (xt_output_stride (G))) ” 
  &&  “ (block_width = (xt_width (G))) ” 
  &&  “ (block_height = (xt_height (G))) ” 
  &&  “ (sizeof(UINT) = 4) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (0 <= block_width) ” 
  &&  “ (block_width <= (xt_total (G))) ” 
  &&  “ (input = (xt_current_input (G) (((xt_total (G)) - block_width )) (0))) ” 
  &&  “ (output = (xt_current_output (G) (((xt_total (G)) - block_width )) (0))) ” 
  &&  “ (xt_progress F G old R ((xt_total (G)) - block_width ) 0 0 ) ”
  &&  (xt_data F )
  **  (xt_output W R )
) \/
(
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height <> 0)) (PreH2 : (block_width <> 0)) (PreH3 : (block_height = 1)) (PreH4 : (block_width = 1)) (PreH5 : (xt_valid F W G )) (PreH6 : (input = (xt_input (G)))) (PreH7 : (output = (xt_output_base (G)))) (PreH8 : (input_stride = (xt_input_stride (G)))) (PreH9 : (output_stride = (xt_output_stride (G)))) (PreH10 : (block_width = (xt_width (G)))) (PreH11 : (block_height = (xt_height (G)))) (PreH12 : (sizeof(UINT) = 4)) (PreH13 : (sizeof(UINT64) = 8)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (block_width = 1)) (PreH16 : (block_height = 1)) ,
  TT && emp 
|--
  “ (xt_progress F G old old ((xt_total (G)) - 1 ) 0 0 ) ” 
  &&  “ (output = (xt_current_output (G) (((xt_total (G)) - 1 )) (0))) ” 
  &&  “ (input = (xt_current_input (G) (((xt_total (G)) - 1 )) (0))) ” 
  &&  “ (1 <= (xt_total (G))) ”
  &&  emp
).

Definition test_rvv_entail_wit_2_10_split_goal_1 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height <> 0)) (PreH2 : (block_width <> 0)) (PreH3 : (block_height = 1)) (PreH4 : (block_width = 1)) (PreH5 : (xt_valid F W G )) (PreH6 : (input = (xt_input (G)))) (PreH7 : (output = (xt_output_base (G)))) (PreH8 : (input_stride = (xt_input_stride (G)))) (PreH9 : (output_stride = (xt_output_stride (G)))) (PreH10 : (block_width = (xt_width (G)))) (PreH11 : (block_height = (xt_height (G)))) (PreH12 : (sizeof(UINT) = 4)) (PreH13 : (sizeof(UINT64) = 8)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (block_width = 1)) (PreH16 : (block_height = 1)) ,
  (xt_progress F G old old ((xt_total (G)) - 1 ) 0 0 )
.

Definition test_rvv_entail_wit_2_10_split_goal_2 := 
forall (G: XTLayout) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height <> 0)) (PreH2 : (block_width <> 0)) (PreH3 : (block_height = 1)) (PreH4 : (block_width = 1)) (PreH5 : (xt_valid F W G )) (PreH6 : (input = (xt_input (G)))) (PreH7 : (output = (xt_output_base (G)))) (PreH8 : (input_stride = (xt_input_stride (G)))) (PreH9 : (output_stride = (xt_output_stride (G)))) (PreH10 : (block_width = (xt_width (G)))) (PreH11 : (block_height = (xt_height (G)))) (PreH12 : (sizeof(UINT) = 4)) (PreH13 : (sizeof(UINT64) = 8)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (block_width = 1)) (PreH16 : (block_height = 1)) ,
  (output = (xt_current_output (G) (((xt_total (G)) - 1 )) (0)))
.

Definition test_rvv_entail_wit_2_10_split_goal_3 := 
forall (G: XTLayout) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height <> 0)) (PreH2 : (block_width <> 0)) (PreH3 : (block_height = 1)) (PreH4 : (block_width = 1)) (PreH5 : (xt_valid F W G )) (PreH6 : (input = (xt_input (G)))) (PreH7 : (output = (xt_output_base (G)))) (PreH8 : (input_stride = (xt_input_stride (G)))) (PreH9 : (output_stride = (xt_output_stride (G)))) (PreH10 : (block_width = (xt_width (G)))) (PreH11 : (block_height = (xt_height (G)))) (PreH12 : (sizeof(UINT) = 4)) (PreH13 : (sizeof(UINT64) = 8)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (block_width = 1)) (PreH16 : (block_height = 1)) ,
  (input = (xt_current_input (G) (((xt_total (G)) - 1 )) (0)))
.

Definition test_rvv_entail_wit_2_10_split_goal_4 := 
forall (G: XTLayout) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height <> 0)) (PreH2 : (block_width <> 0)) (PreH3 : (block_height = 1)) (PreH4 : (block_width = 1)) (PreH5 : (xt_valid F W G )) (PreH6 : (input = (xt_input (G)))) (PreH7 : (output = (xt_output_base (G)))) (PreH8 : (input_stride = (xt_input_stride (G)))) (PreH9 : (output_stride = (xt_output_stride (G)))) (PreH10 : (block_width = (xt_width (G)))) (PreH11 : (block_height = (xt_height (G)))) (PreH12 : (sizeof(UINT) = 4)) (PreH13 : (sizeof(UINT64) = 8)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (block_width = 1)) (PreH16 : (block_height = 1)) ,
  (1 <= (xt_total (G)))
.

Definition test_rvv_entail_wit_2_11 := 
(
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height <> 0)) (PreH2 : (block_width <> 0)) (PreH3 : (block_height = 1)) (PreH4 : (block_width = 1)) (PreH5 : (xt_valid F W G )) (PreH6 : (input = (xt_input (G)))) (PreH7 : (output = (xt_output_base (G)))) (PreH8 : (input_stride = (xt_input_stride (G)))) (PreH9 : (output_stride = (xt_output_stride (G)))) (PreH10 : (block_width = (xt_width (G)))) (PreH11 : (block_height = (xt_height (G)))) (PreH12 : (sizeof(UINT) = 4)) (PreH13 : (sizeof(UINT64) = 8)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH16 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  (xt_data F )
  **  (xt_output W old )
|--
  EX (R: XTOutput) ,
  “ (xt_valid F W G ) ” 
  &&  “ (input_stride = (xt_input_stride (G))) ” 
  &&  “ (output_stride = (xt_output_stride (G))) ” 
  &&  “ (block_width = (xt_width (G))) ” 
  &&  “ (block_height = (xt_height (G))) ” 
  &&  “ (sizeof(UINT) = 4) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (0 <= block_width) ” 
  &&  “ (block_width <= (xt_total (G))) ” 
  &&  “ (input = (xt_current_input (G) (((xt_total (G)) - block_width )) (0))) ” 
  &&  “ (output = (xt_current_output (G) (((xt_total (G)) - block_width )) (0))) ” 
  &&  “ (xt_progress F G old R ((xt_total (G)) - block_width ) 0 0 ) ”
  &&  (xt_data F )
  **  (xt_output W R )
) \/
(
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height <> 0)) (PreH2 : (block_width <> 0)) (PreH3 : (block_height = 1)) (PreH4 : (block_width = 1)) (PreH5 : (xt_valid F W G )) (PreH6 : (input = (xt_input (G)))) (PreH7 : (output = (xt_output_base (G)))) (PreH8 : (input_stride = (xt_input_stride (G)))) (PreH9 : (output_stride = (xt_output_stride (G)))) (PreH10 : (block_width = (xt_width (G)))) (PreH11 : (block_height = (xt_height (G)))) (PreH12 : (sizeof(UINT) = 4)) (PreH13 : (sizeof(UINT64) = 8)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH16 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  TT && emp 
|--
  “ (xt_progress F G old old ((xt_total (G)) - 1 ) 0 0 ) ” 
  &&  “ (output = (xt_current_output (G) (((xt_total (G)) - 1 )) (0))) ” 
  &&  “ (input = (xt_current_input (G) (((xt_total (G)) - 1 )) (0))) ” 
  &&  “ (1 <= (xt_total (G))) ”
  &&  emp
).

Definition test_rvv_entail_wit_2_11_split_goal_1 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height <> 0)) (PreH2 : (block_width <> 0)) (PreH3 : (block_height = 1)) (PreH4 : (block_width = 1)) (PreH5 : (xt_valid F W G )) (PreH6 : (input = (xt_input (G)))) (PreH7 : (output = (xt_output_base (G)))) (PreH8 : (input_stride = (xt_input_stride (G)))) (PreH9 : (output_stride = (xt_output_stride (G)))) (PreH10 : (block_width = (xt_width (G)))) (PreH11 : (block_height = (xt_height (G)))) (PreH12 : (sizeof(UINT) = 4)) (PreH13 : (sizeof(UINT64) = 8)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH16 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  (xt_progress F G old old ((xt_total (G)) - 1 ) 0 0 )
.

Definition test_rvv_entail_wit_2_11_split_goal_2 := 
forall (G: XTLayout) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height <> 0)) (PreH2 : (block_width <> 0)) (PreH3 : (block_height = 1)) (PreH4 : (block_width = 1)) (PreH5 : (xt_valid F W G )) (PreH6 : (input = (xt_input (G)))) (PreH7 : (output = (xt_output_base (G)))) (PreH8 : (input_stride = (xt_input_stride (G)))) (PreH9 : (output_stride = (xt_output_stride (G)))) (PreH10 : (block_width = (xt_width (G)))) (PreH11 : (block_height = (xt_height (G)))) (PreH12 : (sizeof(UINT) = 4)) (PreH13 : (sizeof(UINT64) = 8)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH16 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  (output = (xt_current_output (G) (((xt_total (G)) - 1 )) (0)))
.

Definition test_rvv_entail_wit_2_11_split_goal_3 := 
forall (G: XTLayout) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height <> 0)) (PreH2 : (block_width <> 0)) (PreH3 : (block_height = 1)) (PreH4 : (block_width = 1)) (PreH5 : (xt_valid F W G )) (PreH6 : (input = (xt_input (G)))) (PreH7 : (output = (xt_output_base (G)))) (PreH8 : (input_stride = (xt_input_stride (G)))) (PreH9 : (output_stride = (xt_output_stride (G)))) (PreH10 : (block_width = (xt_width (G)))) (PreH11 : (block_height = (xt_height (G)))) (PreH12 : (sizeof(UINT) = 4)) (PreH13 : (sizeof(UINT64) = 8)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH16 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  (input = (xt_current_input (G) (((xt_total (G)) - 1 )) (0)))
.

Definition test_rvv_entail_wit_2_11_split_goal_4 := 
forall (G: XTLayout) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height <> 0)) (PreH2 : (block_width <> 0)) (PreH3 : (block_height = 1)) (PreH4 : (block_width = 1)) (PreH5 : (xt_valid F W G )) (PreH6 : (input = (xt_input (G)))) (PreH7 : (output = (xt_output_base (G)))) (PreH8 : (input_stride = (xt_input_stride (G)))) (PreH9 : (output_stride = (xt_output_stride (G)))) (PreH10 : (block_width = (xt_width (G)))) (PreH11 : (block_height = (xt_height (G)))) (PreH12 : (sizeof(UINT) = 4)) (PreH13 : (sizeof(UINT64) = 8)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH16 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  (1 <= (xt_total (G)))
.

Definition test_rvv_entail_wit_2_12 := 
(
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height <> 0)) (PreH2 : (block_width <> 0)) (PreH3 : (input_stride >= (block_width * sizeof(UINT) ))) (PreH4 : (block_height <> 1)) (PreH5 : (block_width = 1)) (PreH6 : (xt_valid F W G )) (PreH7 : (input = (xt_input (G)))) (PreH8 : (output = (xt_output_base (G)))) (PreH9 : (input_stride = (xt_input_stride (G)))) (PreH10 : (output_stride = (xt_output_stride (G)))) (PreH11 : (block_width = (xt_width (G)))) (PreH12 : (block_height = (xt_height (G)))) (PreH13 : (sizeof(UINT) = 4)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH17 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  (xt_data F )
  **  (xt_output W old )
|--
  EX (R: XTOutput) ,
  “ (xt_valid F W G ) ” 
  &&  “ (input_stride = (xt_input_stride (G))) ” 
  &&  “ (output_stride = (xt_output_stride (G))) ” 
  &&  “ (block_width = (xt_width (G))) ” 
  &&  “ (block_height = (xt_height (G))) ” 
  &&  “ (sizeof(UINT) = 4) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (0 <= block_width) ” 
  &&  “ (block_width <= (xt_total (G))) ” 
  &&  “ (input = (xt_current_input (G) (((xt_total (G)) - block_width )) (0))) ” 
  &&  “ (output = (xt_current_output (G) (((xt_total (G)) - block_width )) (0))) ” 
  &&  “ (xt_progress F G old R ((xt_total (G)) - block_width ) 0 0 ) ”
  &&  (xt_data F )
  **  (xt_output W R )
) \/
(
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height <> 0)) (PreH2 : (block_width <> 0)) (PreH3 : (input_stride >= (block_width * sizeof(UINT) ))) (PreH4 : (block_height <> 1)) (PreH5 : (block_width = 1)) (PreH6 : (xt_valid F W G )) (PreH7 : (input = (xt_input (G)))) (PreH8 : (output = (xt_output_base (G)))) (PreH9 : (input_stride = (xt_input_stride (G)))) (PreH10 : (output_stride = (xt_output_stride (G)))) (PreH11 : (block_width = (xt_width (G)))) (PreH12 : (block_height = (xt_height (G)))) (PreH13 : (sizeof(UINT) = 4)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH17 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  TT && emp 
|--
  “ (xt_progress F G old old ((xt_total (G)) - 1 ) 0 0 ) ” 
  &&  “ (output = (xt_current_output (G) (((xt_total (G)) - 1 )) (0))) ” 
  &&  “ (input = (xt_current_input (G) (((xt_total (G)) - 1 )) (0))) ” 
  &&  “ (1 <= (xt_total (G))) ”
  &&  emp
).

Definition test_rvv_entail_wit_2_12_split_goal_1 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height <> 0)) (PreH2 : (block_width <> 0)) (PreH3 : (input_stride >= (block_width * sizeof(UINT) ))) (PreH4 : (block_height <> 1)) (PreH5 : (block_width = 1)) (PreH6 : (xt_valid F W G )) (PreH7 : (input = (xt_input (G)))) (PreH8 : (output = (xt_output_base (G)))) (PreH9 : (input_stride = (xt_input_stride (G)))) (PreH10 : (output_stride = (xt_output_stride (G)))) (PreH11 : (block_width = (xt_width (G)))) (PreH12 : (block_height = (xt_height (G)))) (PreH13 : (sizeof(UINT) = 4)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH17 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  (xt_progress F G old old ((xt_total (G)) - 1 ) 0 0 )
.

Definition test_rvv_entail_wit_2_12_split_goal_2 := 
forall (G: XTLayout) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height <> 0)) (PreH2 : (block_width <> 0)) (PreH3 : (input_stride >= (block_width * sizeof(UINT) ))) (PreH4 : (block_height <> 1)) (PreH5 : (block_width = 1)) (PreH6 : (xt_valid F W G )) (PreH7 : (input = (xt_input (G)))) (PreH8 : (output = (xt_output_base (G)))) (PreH9 : (input_stride = (xt_input_stride (G)))) (PreH10 : (output_stride = (xt_output_stride (G)))) (PreH11 : (block_width = (xt_width (G)))) (PreH12 : (block_height = (xt_height (G)))) (PreH13 : (sizeof(UINT) = 4)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH17 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  (output = (xt_current_output (G) (((xt_total (G)) - 1 )) (0)))
.

Definition test_rvv_entail_wit_2_12_split_goal_3 := 
forall (G: XTLayout) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height <> 0)) (PreH2 : (block_width <> 0)) (PreH3 : (input_stride >= (block_width * sizeof(UINT) ))) (PreH4 : (block_height <> 1)) (PreH5 : (block_width = 1)) (PreH6 : (xt_valid F W G )) (PreH7 : (input = (xt_input (G)))) (PreH8 : (output = (xt_output_base (G)))) (PreH9 : (input_stride = (xt_input_stride (G)))) (PreH10 : (output_stride = (xt_output_stride (G)))) (PreH11 : (block_width = (xt_width (G)))) (PreH12 : (block_height = (xt_height (G)))) (PreH13 : (sizeof(UINT) = 4)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH17 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  (input = (xt_current_input (G) (((xt_total (G)) - 1 )) (0)))
.

Definition test_rvv_entail_wit_2_12_split_goal_4 := 
forall (G: XTLayout) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height <> 0)) (PreH2 : (block_width <> 0)) (PreH3 : (input_stride >= (block_width * sizeof(UINT) ))) (PreH4 : (block_height <> 1)) (PreH5 : (block_width = 1)) (PreH6 : (xt_valid F W G )) (PreH7 : (input = (xt_input (G)))) (PreH8 : (output = (xt_output_base (G)))) (PreH9 : (input_stride = (xt_input_stride (G)))) (PreH10 : (output_stride = (xt_output_stride (G)))) (PreH11 : (block_width = (xt_width (G)))) (PreH12 : (block_height = (xt_height (G)))) (PreH13 : (sizeof(UINT) = 4)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH17 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  (1 <= (xt_total (G)))
.

Definition test_rvv_entail_wit_2_13 := 
(
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height <> 0)) (PreH2 : (block_width <> 0)) (PreH3 : (block_height = 1)) (PreH4 : (output_stride >= (unsigned_last_nbits ((block_height * sizeof(UINT) )) (64)))) (PreH5 : (block_width <> 1)) (PreH6 : (xt_valid F W G )) (PreH7 : (input = (xt_input (G)))) (PreH8 : (output = (xt_output_base (G)))) (PreH9 : (input_stride = (xt_input_stride (G)))) (PreH10 : (output_stride = (xt_output_stride (G)))) (PreH11 : (block_width = (xt_width (G)))) (PreH12 : (block_height = (xt_height (G)))) (PreH13 : (sizeof(UINT) = 4)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH17 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  (xt_data F )
  **  (xt_output W old )
|--
  EX (R: XTOutput) ,
  “ (xt_valid F W G ) ” 
  &&  “ (input_stride = (xt_input_stride (G))) ” 
  &&  “ (output_stride = (xt_output_stride (G))) ” 
  &&  “ (block_width = (xt_width (G))) ” 
  &&  “ (block_height = (xt_height (G))) ” 
  &&  “ (sizeof(UINT) = 4) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (0 <= block_width) ” 
  &&  “ (block_width <= (xt_total (G))) ” 
  &&  “ (input = (xt_current_input (G) (((xt_total (G)) - block_width )) (0))) ” 
  &&  “ (output = (xt_current_output (G) (((xt_total (G)) - block_width )) (0))) ” 
  &&  “ (xt_progress F G old R ((xt_total (G)) - block_width ) 0 0 ) ”
  &&  (xt_data F )
  **  (xt_output W R )
) \/
(
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height <> 0)) (PreH2 : (block_width <> 0)) (PreH3 : (block_height = 1)) (PreH4 : (output_stride >= (unsigned_last_nbits ((block_height * sizeof(UINT) )) (64)))) (PreH5 : (block_width <> 1)) (PreH6 : (xt_valid F W G )) (PreH7 : (input = (xt_input (G)))) (PreH8 : (output = (xt_output_base (G)))) (PreH9 : (input_stride = (xt_input_stride (G)))) (PreH10 : (output_stride = (xt_output_stride (G)))) (PreH11 : (block_width = (xt_width (G)))) (PreH12 : (block_height = (xt_height (G)))) (PreH13 : (sizeof(UINT) = 4)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH17 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  TT && emp 
|--
  “ (xt_progress F G old old ((xt_total (G)) - block_width ) 0 0 ) ” 
  &&  “ (output = (xt_current_output (G) (((xt_total (G)) - block_width )) (0))) ” 
  &&  “ (input = (xt_current_input (G) (((xt_total (G)) - block_width )) (0))) ” 
  &&  “ (block_width <= (xt_total (G))) ” 
  &&  “ (0 <= block_width) ”
  &&  emp
).

Definition test_rvv_entail_wit_2_13_split_goal_1 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height <> 0)) (PreH2 : (block_width <> 0)) (PreH3 : (block_height = 1)) (PreH4 : (output_stride >= (unsigned_last_nbits ((block_height * sizeof(UINT) )) (64)))) (PreH5 : (block_width <> 1)) (PreH6 : (xt_valid F W G )) (PreH7 : (input = (xt_input (G)))) (PreH8 : (output = (xt_output_base (G)))) (PreH9 : (input_stride = (xt_input_stride (G)))) (PreH10 : (output_stride = (xt_output_stride (G)))) (PreH11 : (block_width = (xt_width (G)))) (PreH12 : (block_height = (xt_height (G)))) (PreH13 : (sizeof(UINT) = 4)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH17 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  (xt_progress F G old old ((xt_total (G)) - block_width ) 0 0 )
.

Definition test_rvv_entail_wit_2_13_split_goal_2 := 
forall (G: XTLayout) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height <> 0)) (PreH2 : (block_width <> 0)) (PreH3 : (block_height = 1)) (PreH4 : (output_stride >= (unsigned_last_nbits ((block_height * sizeof(UINT) )) (64)))) (PreH5 : (block_width <> 1)) (PreH6 : (xt_valid F W G )) (PreH7 : (input = (xt_input (G)))) (PreH8 : (output = (xt_output_base (G)))) (PreH9 : (input_stride = (xt_input_stride (G)))) (PreH10 : (output_stride = (xt_output_stride (G)))) (PreH11 : (block_width = (xt_width (G)))) (PreH12 : (block_height = (xt_height (G)))) (PreH13 : (sizeof(UINT) = 4)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH17 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  (output = (xt_current_output (G) (((xt_total (G)) - block_width )) (0)))
.

Definition test_rvv_entail_wit_2_13_split_goal_3 := 
forall (G: XTLayout) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height <> 0)) (PreH2 : (block_width <> 0)) (PreH3 : (block_height = 1)) (PreH4 : (output_stride >= (unsigned_last_nbits ((block_height * sizeof(UINT) )) (64)))) (PreH5 : (block_width <> 1)) (PreH6 : (xt_valid F W G )) (PreH7 : (input = (xt_input (G)))) (PreH8 : (output = (xt_output_base (G)))) (PreH9 : (input_stride = (xt_input_stride (G)))) (PreH10 : (output_stride = (xt_output_stride (G)))) (PreH11 : (block_width = (xt_width (G)))) (PreH12 : (block_height = (xt_height (G)))) (PreH13 : (sizeof(UINT) = 4)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH17 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  (input = (xt_current_input (G) (((xt_total (G)) - block_width )) (0)))
.

Definition test_rvv_entail_wit_2_13_split_goal_4 := 
forall (G: XTLayout) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height <> 0)) (PreH2 : (block_width <> 0)) (PreH3 : (block_height = 1)) (PreH4 : (output_stride >= (unsigned_last_nbits ((block_height * sizeof(UINT) )) (64)))) (PreH5 : (block_width <> 1)) (PreH6 : (xt_valid F W G )) (PreH7 : (input = (xt_input (G)))) (PreH8 : (output = (xt_output_base (G)))) (PreH9 : (input_stride = (xt_input_stride (G)))) (PreH10 : (output_stride = (xt_output_stride (G)))) (PreH11 : (block_width = (xt_width (G)))) (PreH12 : (block_height = (xt_height (G)))) (PreH13 : (sizeof(UINT) = 4)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH17 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  (block_width <= (xt_total (G)))
.

Definition test_rvv_entail_wit_2_13_split_goal_5 := 
forall (G: XTLayout) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height <> 0)) (PreH2 : (block_width <> 0)) (PreH3 : (block_height = 1)) (PreH4 : (output_stride >= (unsigned_last_nbits ((block_height * sizeof(UINT) )) (64)))) (PreH5 : (block_width <> 1)) (PreH6 : (xt_valid F W G )) (PreH7 : (input = (xt_input (G)))) (PreH8 : (output = (xt_output_base (G)))) (PreH9 : (input_stride = (xt_input_stride (G)))) (PreH10 : (output_stride = (xt_output_stride (G)))) (PreH11 : (block_width = (xt_width (G)))) (PreH12 : (block_height = (xt_height (G)))) (PreH13 : (sizeof(UINT) = 4)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH17 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  (0 <= block_width)
.

Definition test_rvv_entail_wit_2_14 := 
(
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height <> 0)) (PreH2 : (block_width <> 0)) (PreH3 : (input_stride >= (unsigned_last_nbits ((block_width * sizeof(UINT) )) (64)))) (PreH4 : (block_height <> 1)) (PreH5 : (output_stride >= (unsigned_last_nbits ((block_height * sizeof(UINT) )) (64)))) (PreH6 : (block_width <> 1)) (PreH7 : (xt_valid F W G )) (PreH8 : (input = (xt_input (G)))) (PreH9 : (output = (xt_output_base (G)))) (PreH10 : (input_stride = (xt_input_stride (G)))) (PreH11 : (output_stride = (xt_output_stride (G)))) (PreH12 : (block_width = (xt_width (G)))) (PreH13 : (block_height = (xt_height (G)))) (PreH14 : (sizeof(UINT) = 4)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (sizeof(UINT64) = 8)) (PreH17 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH18 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  (xt_data F )
  **  (xt_output W old )
|--
  EX (R: XTOutput) ,
  “ (xt_valid F W G ) ” 
  &&  “ (input_stride = (xt_input_stride (G))) ” 
  &&  “ (output_stride = (xt_output_stride (G))) ” 
  &&  “ (block_width = (xt_width (G))) ” 
  &&  “ (block_height = (xt_height (G))) ” 
  &&  “ (sizeof(UINT) = 4) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (0 <= block_width) ” 
  &&  “ (block_width <= (xt_total (G))) ” 
  &&  “ (input = (xt_current_input (G) (((xt_total (G)) - block_width )) (0))) ” 
  &&  “ (output = (xt_current_output (G) (((xt_total (G)) - block_width )) (0))) ” 
  &&  “ (xt_progress F G old R ((xt_total (G)) - block_width ) 0 0 ) ”
  &&  (xt_data F )
  **  (xt_output W R )
) \/
(
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height <> 0)) (PreH2 : (block_width <> 0)) (PreH3 : (input_stride >= (unsigned_last_nbits ((block_width * sizeof(UINT) )) (64)))) (PreH4 : (block_height <> 1)) (PreH5 : (output_stride >= (unsigned_last_nbits ((block_height * sizeof(UINT) )) (64)))) (PreH6 : (block_width <> 1)) (PreH7 : (xt_valid F W G )) (PreH8 : (input = (xt_input (G)))) (PreH9 : (output = (xt_output_base (G)))) (PreH10 : (input_stride = (xt_input_stride (G)))) (PreH11 : (output_stride = (xt_output_stride (G)))) (PreH12 : (block_width = (xt_width (G)))) (PreH13 : (block_height = (xt_height (G)))) (PreH14 : (sizeof(UINT) = 4)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (sizeof(UINT64) = 8)) (PreH17 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH18 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  TT && emp 
|--
  “ (xt_progress F G old old ((xt_total (G)) - block_width ) 0 0 ) ” 
  &&  “ (output = (xt_current_output (G) (((xt_total (G)) - block_width )) (0))) ” 
  &&  “ (input = (xt_current_input (G) (((xt_total (G)) - block_width )) (0))) ” 
  &&  “ (block_width <= (xt_total (G))) ” 
  &&  “ (0 <= block_width) ”
  &&  emp
).

Definition test_rvv_entail_wit_2_14_split_goal_1 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height <> 0)) (PreH2 : (block_width <> 0)) (PreH3 : (input_stride >= (unsigned_last_nbits ((block_width * sizeof(UINT) )) (64)))) (PreH4 : (block_height <> 1)) (PreH5 : (output_stride >= (unsigned_last_nbits ((block_height * sizeof(UINT) )) (64)))) (PreH6 : (block_width <> 1)) (PreH7 : (xt_valid F W G )) (PreH8 : (input = (xt_input (G)))) (PreH9 : (output = (xt_output_base (G)))) (PreH10 : (input_stride = (xt_input_stride (G)))) (PreH11 : (output_stride = (xt_output_stride (G)))) (PreH12 : (block_width = (xt_width (G)))) (PreH13 : (block_height = (xt_height (G)))) (PreH14 : (sizeof(UINT) = 4)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (sizeof(UINT64) = 8)) (PreH17 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH18 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  (xt_progress F G old old ((xt_total (G)) - block_width ) 0 0 )
.

Definition test_rvv_entail_wit_2_14_split_goal_2 := 
forall (G: XTLayout) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height <> 0)) (PreH2 : (block_width <> 0)) (PreH3 : (input_stride >= (unsigned_last_nbits ((block_width * sizeof(UINT) )) (64)))) (PreH4 : (block_height <> 1)) (PreH5 : (output_stride >= (unsigned_last_nbits ((block_height * sizeof(UINT) )) (64)))) (PreH6 : (block_width <> 1)) (PreH7 : (xt_valid F W G )) (PreH8 : (input = (xt_input (G)))) (PreH9 : (output = (xt_output_base (G)))) (PreH10 : (input_stride = (xt_input_stride (G)))) (PreH11 : (output_stride = (xt_output_stride (G)))) (PreH12 : (block_width = (xt_width (G)))) (PreH13 : (block_height = (xt_height (G)))) (PreH14 : (sizeof(UINT) = 4)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (sizeof(UINT64) = 8)) (PreH17 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH18 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  (output = (xt_current_output (G) (((xt_total (G)) - block_width )) (0)))
.

Definition test_rvv_entail_wit_2_14_split_goal_3 := 
forall (G: XTLayout) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height <> 0)) (PreH2 : (block_width <> 0)) (PreH3 : (input_stride >= (unsigned_last_nbits ((block_width * sizeof(UINT) )) (64)))) (PreH4 : (block_height <> 1)) (PreH5 : (output_stride >= (unsigned_last_nbits ((block_height * sizeof(UINT) )) (64)))) (PreH6 : (block_width <> 1)) (PreH7 : (xt_valid F W G )) (PreH8 : (input = (xt_input (G)))) (PreH9 : (output = (xt_output_base (G)))) (PreH10 : (input_stride = (xt_input_stride (G)))) (PreH11 : (output_stride = (xt_output_stride (G)))) (PreH12 : (block_width = (xt_width (G)))) (PreH13 : (block_height = (xt_height (G)))) (PreH14 : (sizeof(UINT) = 4)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (sizeof(UINT64) = 8)) (PreH17 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH18 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  (input = (xt_current_input (G) (((xt_total (G)) - block_width )) (0)))
.

Definition test_rvv_entail_wit_2_14_split_goal_4 := 
forall (G: XTLayout) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height <> 0)) (PreH2 : (block_width <> 0)) (PreH3 : (input_stride >= (unsigned_last_nbits ((block_width * sizeof(UINT) )) (64)))) (PreH4 : (block_height <> 1)) (PreH5 : (output_stride >= (unsigned_last_nbits ((block_height * sizeof(UINT) )) (64)))) (PreH6 : (block_width <> 1)) (PreH7 : (xt_valid F W G )) (PreH8 : (input = (xt_input (G)))) (PreH9 : (output = (xt_output_base (G)))) (PreH10 : (input_stride = (xt_input_stride (G)))) (PreH11 : (output_stride = (xt_output_stride (G)))) (PreH12 : (block_width = (xt_width (G)))) (PreH13 : (block_height = (xt_height (G)))) (PreH14 : (sizeof(UINT) = 4)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (sizeof(UINT64) = 8)) (PreH17 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH18 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  (block_width <= (xt_total (G)))
.

Definition test_rvv_entail_wit_2_14_split_goal_5 := 
forall (G: XTLayout) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height <> 0)) (PreH2 : (block_width <> 0)) (PreH3 : (input_stride >= (unsigned_last_nbits ((block_width * sizeof(UINT) )) (64)))) (PreH4 : (block_height <> 1)) (PreH5 : (output_stride >= (unsigned_last_nbits ((block_height * sizeof(UINT) )) (64)))) (PreH6 : (block_width <> 1)) (PreH7 : (xt_valid F W G )) (PreH8 : (input = (xt_input (G)))) (PreH9 : (output = (xt_output_base (G)))) (PreH10 : (input_stride = (xt_input_stride (G)))) (PreH11 : (output_stride = (xt_output_stride (G)))) (PreH12 : (block_width = (xt_width (G)))) (PreH13 : (block_height = (xt_height (G)))) (PreH14 : (sizeof(UINT) = 4)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (sizeof(UINT64) = 8)) (PreH17 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH18 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  (0 <= block_width)
.

Definition test_rvv_entail_wit_2_15 := 
(
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height <> 0)) (PreH2 : (block_width <> 0)) (PreH3 : (block_height = 1)) (PreH4 : (block_width = 1)) (PreH5 : (xt_valid F W G )) (PreH6 : (input = (xt_input (G)))) (PreH7 : (output = (xt_output_base (G)))) (PreH8 : (input_stride = (xt_input_stride (G)))) (PreH9 : (output_stride = (xt_output_stride (G)))) (PreH10 : (block_width = (xt_width (G)))) (PreH11 : (block_height = (xt_height (G)))) (PreH12 : (sizeof(UINT) = 4)) (PreH13 : (sizeof(UINT64) = 8)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH16 : (block_height = 1)) ,
  (xt_data F )
  **  (xt_output W old )
|--
  EX (R: XTOutput) ,
  “ (xt_valid F W G ) ” 
  &&  “ (input_stride = (xt_input_stride (G))) ” 
  &&  “ (output_stride = (xt_output_stride (G))) ” 
  &&  “ (block_width = (xt_width (G))) ” 
  &&  “ (block_height = (xt_height (G))) ” 
  &&  “ (sizeof(UINT) = 4) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (0 <= block_width) ” 
  &&  “ (block_width <= (xt_total (G))) ” 
  &&  “ (input = (xt_current_input (G) (((xt_total (G)) - block_width )) (0))) ” 
  &&  “ (output = (xt_current_output (G) (((xt_total (G)) - block_width )) (0))) ” 
  &&  “ (xt_progress F G old R ((xt_total (G)) - block_width ) 0 0 ) ”
  &&  (xt_data F )
  **  (xt_output W R )
) \/
(
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height <> 0)) (PreH2 : (block_width <> 0)) (PreH3 : (block_height = 1)) (PreH4 : (block_width = 1)) (PreH5 : (xt_valid F W G )) (PreH6 : (input = (xt_input (G)))) (PreH7 : (output = (xt_output_base (G)))) (PreH8 : (input_stride = (xt_input_stride (G)))) (PreH9 : (output_stride = (xt_output_stride (G)))) (PreH10 : (block_width = (xt_width (G)))) (PreH11 : (block_height = (xt_height (G)))) (PreH12 : (sizeof(UINT) = 4)) (PreH13 : (sizeof(UINT64) = 8)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH16 : (block_height = 1)) ,
  TT && emp 
|--
  “ (xt_progress F G old old ((xt_total (G)) - 1 ) 0 0 ) ” 
  &&  “ (output = (xt_current_output (G) (((xt_total (G)) - 1 )) (0))) ” 
  &&  “ (input = (xt_current_input (G) (((xt_total (G)) - 1 )) (0))) ” 
  &&  “ (1 <= (xt_total (G))) ”
  &&  emp
).

Definition test_rvv_entail_wit_2_15_split_goal_1 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height <> 0)) (PreH2 : (block_width <> 0)) (PreH3 : (block_height = 1)) (PreH4 : (block_width = 1)) (PreH5 : (xt_valid F W G )) (PreH6 : (input = (xt_input (G)))) (PreH7 : (output = (xt_output_base (G)))) (PreH8 : (input_stride = (xt_input_stride (G)))) (PreH9 : (output_stride = (xt_output_stride (G)))) (PreH10 : (block_width = (xt_width (G)))) (PreH11 : (block_height = (xt_height (G)))) (PreH12 : (sizeof(UINT) = 4)) (PreH13 : (sizeof(UINT64) = 8)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH16 : (block_height = 1)) ,
  (xt_progress F G old old ((xt_total (G)) - 1 ) 0 0 )
.

Definition test_rvv_entail_wit_2_15_split_goal_2 := 
forall (G: XTLayout) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height <> 0)) (PreH2 : (block_width <> 0)) (PreH3 : (block_height = 1)) (PreH4 : (block_width = 1)) (PreH5 : (xt_valid F W G )) (PreH6 : (input = (xt_input (G)))) (PreH7 : (output = (xt_output_base (G)))) (PreH8 : (input_stride = (xt_input_stride (G)))) (PreH9 : (output_stride = (xt_output_stride (G)))) (PreH10 : (block_width = (xt_width (G)))) (PreH11 : (block_height = (xt_height (G)))) (PreH12 : (sizeof(UINT) = 4)) (PreH13 : (sizeof(UINT64) = 8)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH16 : (block_height = 1)) ,
  (output = (xt_current_output (G) (((xt_total (G)) - 1 )) (0)))
.

Definition test_rvv_entail_wit_2_15_split_goal_3 := 
forall (G: XTLayout) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height <> 0)) (PreH2 : (block_width <> 0)) (PreH3 : (block_height = 1)) (PreH4 : (block_width = 1)) (PreH5 : (xt_valid F W G )) (PreH6 : (input = (xt_input (G)))) (PreH7 : (output = (xt_output_base (G)))) (PreH8 : (input_stride = (xt_input_stride (G)))) (PreH9 : (output_stride = (xt_output_stride (G)))) (PreH10 : (block_width = (xt_width (G)))) (PreH11 : (block_height = (xt_height (G)))) (PreH12 : (sizeof(UINT) = 4)) (PreH13 : (sizeof(UINT64) = 8)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH16 : (block_height = 1)) ,
  (input = (xt_current_input (G) (((xt_total (G)) - 1 )) (0)))
.

Definition test_rvv_entail_wit_2_15_split_goal_4 := 
forall (G: XTLayout) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height <> 0)) (PreH2 : (block_width <> 0)) (PreH3 : (block_height = 1)) (PreH4 : (block_width = 1)) (PreH5 : (xt_valid F W G )) (PreH6 : (input = (xt_input (G)))) (PreH7 : (output = (xt_output_base (G)))) (PreH8 : (input_stride = (xt_input_stride (G)))) (PreH9 : (output_stride = (xt_output_stride (G)))) (PreH10 : (block_width = (xt_width (G)))) (PreH11 : (block_height = (xt_height (G)))) (PreH12 : (sizeof(UINT) = 4)) (PreH13 : (sizeof(UINT64) = 8)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH16 : (block_height = 1)) ,
  (1 <= (xt_total (G)))
.

Definition test_rvv_entail_wit_2_16 := 
(
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height <> 0)) (PreH2 : (block_width <> 0)) (PreH3 : (block_height = 1)) (PreH4 : (output_stride >= (block_height * sizeof(UINT) ))) (PreH5 : (block_width <> 1)) (PreH6 : (xt_valid F W G )) (PreH7 : (input = (xt_input (G)))) (PreH8 : (output = (xt_output_base (G)))) (PreH9 : (input_stride = (xt_input_stride (G)))) (PreH10 : (output_stride = (xt_output_stride (G)))) (PreH11 : (block_width = (xt_width (G)))) (PreH12 : (block_height = (xt_height (G)))) (PreH13 : (sizeof(UINT) = 4)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH17 : (block_height = 1)) ,
  (xt_data F )
  **  (xt_output W old )
|--
  EX (R: XTOutput) ,
  “ (xt_valid F W G ) ” 
  &&  “ (input_stride = (xt_input_stride (G))) ” 
  &&  “ (output_stride = (xt_output_stride (G))) ” 
  &&  “ (block_width = (xt_width (G))) ” 
  &&  “ (block_height = (xt_height (G))) ” 
  &&  “ (sizeof(UINT) = 4) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (0 <= block_width) ” 
  &&  “ (block_width <= (xt_total (G))) ” 
  &&  “ (input = (xt_current_input (G) (((xt_total (G)) - block_width )) (0))) ” 
  &&  “ (output = (xt_current_output (G) (((xt_total (G)) - block_width )) (0))) ” 
  &&  “ (xt_progress F G old R ((xt_total (G)) - block_width ) 0 0 ) ”
  &&  (xt_data F )
  **  (xt_output W R )
) \/
(
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height <> 0)) (PreH2 : (block_width <> 0)) (PreH3 : (block_height = 1)) (PreH4 : (output_stride >= (block_height * sizeof(UINT) ))) (PreH5 : (block_width <> 1)) (PreH6 : (xt_valid F W G )) (PreH7 : (input = (xt_input (G)))) (PreH8 : (output = (xt_output_base (G)))) (PreH9 : (input_stride = (xt_input_stride (G)))) (PreH10 : (output_stride = (xt_output_stride (G)))) (PreH11 : (block_width = (xt_width (G)))) (PreH12 : (block_height = (xt_height (G)))) (PreH13 : (sizeof(UINT) = 4)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH17 : (block_height = 1)) ,
  TT && emp 
|--
  “ (xt_progress F G old old ((xt_total (G)) - block_width ) 0 0 ) ” 
  &&  “ (output = (xt_current_output (G) (((xt_total (G)) - block_width )) (0))) ” 
  &&  “ (input = (xt_current_input (G) (((xt_total (G)) - block_width )) (0))) ” 
  &&  “ (block_width <= (xt_total (G))) ” 
  &&  “ (0 <= block_width) ”
  &&  emp
).

Definition test_rvv_entail_wit_2_16_split_goal_1 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height <> 0)) (PreH2 : (block_width <> 0)) (PreH3 : (block_height = 1)) (PreH4 : (output_stride >= (block_height * sizeof(UINT) ))) (PreH5 : (block_width <> 1)) (PreH6 : (xt_valid F W G )) (PreH7 : (input = (xt_input (G)))) (PreH8 : (output = (xt_output_base (G)))) (PreH9 : (input_stride = (xt_input_stride (G)))) (PreH10 : (output_stride = (xt_output_stride (G)))) (PreH11 : (block_width = (xt_width (G)))) (PreH12 : (block_height = (xt_height (G)))) (PreH13 : (sizeof(UINT) = 4)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH17 : (block_height = 1)) ,
  (xt_progress F G old old ((xt_total (G)) - block_width ) 0 0 )
.

Definition test_rvv_entail_wit_2_16_split_goal_2 := 
forall (G: XTLayout) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height <> 0)) (PreH2 : (block_width <> 0)) (PreH3 : (block_height = 1)) (PreH4 : (output_stride >= (block_height * sizeof(UINT) ))) (PreH5 : (block_width <> 1)) (PreH6 : (xt_valid F W G )) (PreH7 : (input = (xt_input (G)))) (PreH8 : (output = (xt_output_base (G)))) (PreH9 : (input_stride = (xt_input_stride (G)))) (PreH10 : (output_stride = (xt_output_stride (G)))) (PreH11 : (block_width = (xt_width (G)))) (PreH12 : (block_height = (xt_height (G)))) (PreH13 : (sizeof(UINT) = 4)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH17 : (block_height = 1)) ,
  (output = (xt_current_output (G) (((xt_total (G)) - block_width )) (0)))
.

Definition test_rvv_entail_wit_2_16_split_goal_3 := 
forall (G: XTLayout) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height <> 0)) (PreH2 : (block_width <> 0)) (PreH3 : (block_height = 1)) (PreH4 : (output_stride >= (block_height * sizeof(UINT) ))) (PreH5 : (block_width <> 1)) (PreH6 : (xt_valid F W G )) (PreH7 : (input = (xt_input (G)))) (PreH8 : (output = (xt_output_base (G)))) (PreH9 : (input_stride = (xt_input_stride (G)))) (PreH10 : (output_stride = (xt_output_stride (G)))) (PreH11 : (block_width = (xt_width (G)))) (PreH12 : (block_height = (xt_height (G)))) (PreH13 : (sizeof(UINT) = 4)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH17 : (block_height = 1)) ,
  (input = (xt_current_input (G) (((xt_total (G)) - block_width )) (0)))
.

Definition test_rvv_entail_wit_2_16_split_goal_4 := 
forall (G: XTLayout) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height <> 0)) (PreH2 : (block_width <> 0)) (PreH3 : (block_height = 1)) (PreH4 : (output_stride >= (block_height * sizeof(UINT) ))) (PreH5 : (block_width <> 1)) (PreH6 : (xt_valid F W G )) (PreH7 : (input = (xt_input (G)))) (PreH8 : (output = (xt_output_base (G)))) (PreH9 : (input_stride = (xt_input_stride (G)))) (PreH10 : (output_stride = (xt_output_stride (G)))) (PreH11 : (block_width = (xt_width (G)))) (PreH12 : (block_height = (xt_height (G)))) (PreH13 : (sizeof(UINT) = 4)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH17 : (block_height = 1)) ,
  (block_width <= (xt_total (G)))
.

Definition test_rvv_entail_wit_2_16_split_goal_5 := 
forall (G: XTLayout) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height <> 0)) (PreH2 : (block_width <> 0)) (PreH3 : (block_height = 1)) (PreH4 : (output_stride >= (block_height * sizeof(UINT) ))) (PreH5 : (block_width <> 1)) (PreH6 : (xt_valid F W G )) (PreH7 : (input = (xt_input (G)))) (PreH8 : (output = (xt_output_base (G)))) (PreH9 : (input_stride = (xt_input_stride (G)))) (PreH10 : (output_stride = (xt_output_stride (G)))) (PreH11 : (block_width = (xt_width (G)))) (PreH12 : (block_height = (xt_height (G)))) (PreH13 : (sizeof(UINT) = 4)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH17 : (block_height = 1)) ,
  (0 <= block_width)
.

Definition test_rvv_entail_wit_3 := 
(
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (R_2: XTOutput) (output: Z) (input: Z) (bw: Z) (block_height: Z) (block_width: Z) (output_stride: Z) (input_stride: Z) (retval: Z) (PreH1 : (xt_legal_vl bw retval )) (PreH2 : (bw > 0)) (PreH3 : (xt_valid F W G )) (PreH4 : (input_stride = (xt_input_stride (G)))) (PreH5 : (output_stride = (xt_output_stride (G)))) (PreH6 : (block_width = (xt_width (G)))) (PreH7 : (block_height = (xt_height (G)))) (PreH8 : (sizeof(UINT) = 4)) (PreH9 : (sizeof(UINT64) = 8)) (PreH10 : (sizeof(UINT64) = 8)) (PreH11 : (0 <= bw)) (PreH12 : (bw <= (xt_total (G)))) (PreH13 : (input = (xt_current_input (G) (((xt_total (G)) - bw )) (0)))) (PreH14 : (output = (xt_current_output (G) (((xt_total (G)) - bw )) (0)))) (PreH15 : (xt_progress F G old R_2 ((xt_total (G)) - bw ) 0 0 )) ,
  (xt_data F )
  **  (xt_output W R_2 )
|--
  EX (R: XTOutput) ,
  “ (xt_valid F W G ) ” 
  &&  “ (input_stride = (xt_input_stride (G))) ” 
  &&  “ (output_stride = (xt_output_stride (G))) ” 
  &&  “ (block_width = (xt_width (G))) ” 
  &&  “ (block_height = (xt_height (G))) ” 
  &&  “ (sizeof(UINT) = 4) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (0 <= bw) ” 
  &&  “ (bw <= (xt_total (G))) ” 
  &&  “ (input = (xt_current_input (G) (((xt_total (G)) - bw )) (0))) ” 
  &&  “ (output = (xt_current_output (G) (((xt_total (G)) - bw )) (0))) ” 
  &&  “ (xt_progress F G old R ((xt_total (G)) - bw ) 0 0 ) ” 
  &&  “ (0 < bw) ” 
  &&  “ (xt_legal_vl bw retval ) ” 
  &&  “ (0 < retval) ” 
  &&  “ (retval <= 32) ” 
  &&  “ (retval <= bw) ”
  &&  (xt_data F )
  **  (xt_output W R )
) \/
(
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (R_2: XTOutput) (output: Z) (input: Z) (bw: Z) (block_height: Z) (block_width: Z) (output_stride: Z) (input_stride: Z) (retval: Z) (PreH1 : (xt_legal_vl bw retval )) (PreH2 : (bw > 0)) (PreH3 : (xt_valid F W G )) (PreH4 : (input_stride = (xt_input_stride (G)))) (PreH5 : (output_stride = (xt_output_stride (G)))) (PreH6 : (block_width = (xt_width (G)))) (PreH7 : (block_height = (xt_height (G)))) (PreH8 : (sizeof(UINT) = 4)) (PreH9 : (sizeof(UINT64) = 8)) (PreH10 : (sizeof(UINT64) = 8)) (PreH11 : (0 <= bw)) (PreH12 : (bw <= (xt_total (G)))) (PreH13 : (input = (xt_current_input (G) (((xt_total (G)) - bw )) (0)))) (PreH14 : (output = (xt_current_output (G) (((xt_total (G)) - bw )) (0)))) (PreH15 : (xt_progress F G old R_2 ((xt_total (G)) - bw ) 0 0 )) ,
  TT && emp 
|--
  “ (retval <= bw) ” 
  &&  “ (retval <= 32) ” 
  &&  “ (0 < retval) ”
  &&  emp
).

Definition test_rvv_entail_wit_3_split_goal_1 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (R_2: XTOutput) (output: Z) (input: Z) (bw: Z) (block_height: Z) (block_width: Z) (output_stride: Z) (input_stride: Z) (retval: Z) (PreH1 : (xt_legal_vl bw retval )) (PreH2 : (bw > 0)) (PreH3 : (xt_valid F W G )) (PreH4 : (input_stride = (xt_input_stride (G)))) (PreH5 : (output_stride = (xt_output_stride (G)))) (PreH6 : (block_width = (xt_width (G)))) (PreH7 : (block_height = (xt_height (G)))) (PreH8 : (sizeof(UINT) = 4)) (PreH9 : (sizeof(UINT64) = 8)) (PreH10 : (sizeof(UINT64) = 8)) (PreH11 : (0 <= bw)) (PreH12 : (bw <= (xt_total (G)))) (PreH13 : (input = (xt_current_input (G) (((xt_total (G)) - bw )) (0)))) (PreH14 : (output = (xt_current_output (G) (((xt_total (G)) - bw )) (0)))) (PreH15 : (xt_progress F G old R_2 ((xt_total (G)) - bw ) 0 0 )) ,
  (retval <= bw)
.

Definition test_rvv_entail_wit_3_split_goal_2 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (R_2: XTOutput) (output: Z) (input: Z) (bw: Z) (block_height: Z) (block_width: Z) (output_stride: Z) (input_stride: Z) (retval: Z) (PreH1 : (xt_legal_vl bw retval )) (PreH2 : (bw > 0)) (PreH3 : (xt_valid F W G )) (PreH4 : (input_stride = (xt_input_stride (G)))) (PreH5 : (output_stride = (xt_output_stride (G)))) (PreH6 : (block_width = (xt_width (G)))) (PreH7 : (block_height = (xt_height (G)))) (PreH8 : (sizeof(UINT) = 4)) (PreH9 : (sizeof(UINT64) = 8)) (PreH10 : (sizeof(UINT64) = 8)) (PreH11 : (0 <= bw)) (PreH12 : (bw <= (xt_total (G)))) (PreH13 : (input = (xt_current_input (G) (((xt_total (G)) - bw )) (0)))) (PreH14 : (output = (xt_current_output (G) (((xt_total (G)) - bw )) (0)))) (PreH15 : (xt_progress F G old R_2 ((xt_total (G)) - bw ) 0 0 )) ,
  (retval <= 32)
.

Definition test_rvv_entail_wit_3_split_goal_3 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (R_2: XTOutput) (output: Z) (input: Z) (bw: Z) (block_height: Z) (block_width: Z) (output_stride: Z) (input_stride: Z) (retval: Z) (PreH1 : (xt_legal_vl bw retval )) (PreH2 : (bw > 0)) (PreH3 : (xt_valid F W G )) (PreH4 : (input_stride = (xt_input_stride (G)))) (PreH5 : (output_stride = (xt_output_stride (G)))) (PreH6 : (block_width = (xt_width (G)))) (PreH7 : (block_height = (xt_height (G)))) (PreH8 : (sizeof(UINT) = 4)) (PreH9 : (sizeof(UINT64) = 8)) (PreH10 : (sizeof(UINT64) = 8)) (PreH11 : (0 <= bw)) (PreH12 : (bw <= (xt_total (G)))) (PreH13 : (input = (xt_current_input (G) (((xt_total (G)) - bw )) (0)))) (PreH14 : (output = (xt_current_output (G) (((xt_total (G)) - bw )) (0)))) (PreH15 : (xt_progress F G old R_2 ((xt_total (G)) - bw ) 0 0 )) ,
  (0 < retval)
.

Definition test_rvv_entail_wit_4 := 
(
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (R_2: XTOutput) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (bw: Z) (input: Z) (output: Z) (vl: Z) (PreH1 : (xt_valid F W G )) (PreH2 : (input_stride = (xt_input_stride (G)))) (PreH3 : (output_stride = (xt_output_stride (G)))) (PreH4 : (block_width = (xt_width (G)))) (PreH5 : (block_height = (xt_height (G)))) (PreH6 : (sizeof(UINT) = 4)) (PreH7 : (sizeof(UINT64) = 8)) (PreH8 : (sizeof(UINT64) = 8)) (PreH9 : (0 <= bw)) (PreH10 : (bw <= (xt_total (G)))) (PreH11 : (input = (xt_current_input (G) (((xt_total (G)) - bw )) (0)))) (PreH12 : (output = (xt_current_output (G) (((xt_total (G)) - bw )) (0)))) (PreH13 : (xt_progress F G old R_2 ((xt_total (G)) - bw ) 0 0 )) (PreH14 : (0 < bw)) (PreH15 : (xt_legal_vl bw vl )) (PreH16 : (0 < vl)) (PreH17 : (vl <= 32)) (PreH18 : (vl <= bw)) ,
  (xt_data F )
  **  (xt_output W R_2 )
|--
  EX (R: XTOutput) ,
  “ (xt_valid F W G ) ” 
  &&  “ (input_stride = (xt_input_stride (G))) ” 
  &&  “ (output_stride = (xt_output_stride (G))) ” 
  &&  “ (block_width = (xt_width (G))) ” 
  &&  “ (block_height = (xt_height (G))) ” 
  &&  “ (sizeof(UINT) = 4) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (0 < bw) ” 
  &&  “ (bw <= (xt_total (G))) ” 
  &&  “ (xt_legal_vl bw vl ) ” 
  &&  “ (0 < vl) ” 
  &&  “ (vl <= 32) ” 
  &&  “ (vl <= bw) ” 
  &&  “ (0 <= block_height) ” 
  &&  “ (block_height <= block_height) ” 
  &&  “ (input = (xt_current_input (G) (((xt_total (G)) - bw )) (0))) ” 
  &&  “ (output = (xt_current_output (G) (((xt_total (G)) - bw )) (0))) ” 
  &&  “ (input = (xt_current_input (G) (((xt_total (G)) - bw )) ((block_height - block_height )))) ” 
  &&  “ (output = (xt_current_output (G) (((xt_total (G)) - bw )) ((block_height - block_height )))) ” 
  &&  “ (xt_progress F G old R ((xt_total (G)) - bw ) vl (block_height - block_height ) ) ”
  &&  (xt_data F )
  **  (xt_output W R )
) \/
(
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (R_2: XTOutput) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (bw: Z) (input: Z) (output: Z) (vl: Z) (PreH1 : (xt_valid F W G )) (PreH2 : (input_stride = (xt_input_stride (G)))) (PreH3 : (output_stride = (xt_output_stride (G)))) (PreH4 : (block_width = (xt_width (G)))) (PreH5 : (block_height = (xt_height (G)))) (PreH6 : (sizeof(UINT) = 4)) (PreH7 : (sizeof(UINT64) = 8)) (PreH8 : (sizeof(UINT64) = 8)) (PreH9 : (0 <= bw)) (PreH10 : (bw <= (xt_total (G)))) (PreH11 : (input = (xt_current_input (G) (((xt_total (G)) - bw )) (0)))) (PreH12 : (output = (xt_current_output (G) (((xt_total (G)) - bw )) (0)))) (PreH13 : (xt_progress F G old R_2 ((xt_total (G)) - bw ) 0 0 )) (PreH14 : (0 < bw)) (PreH15 : (xt_legal_vl bw vl )) (PreH16 : (0 < vl)) (PreH17 : (vl <= 32)) (PreH18 : (vl <= bw)) ,
  TT && emp 
|--
  “ (xt_progress F G old R_2 ((xt_total (G)) - bw ) vl (block_height - block_height ) ) ” 
  &&  “ (output = (xt_current_output (G) (((xt_total (G)) - bw )) ((block_height - block_height )))) ” 
  &&  “ (input = (xt_current_input (G) (((xt_total (G)) - bw )) ((block_height - block_height )))) ” 
  &&  “ (0 <= block_height) ”
  &&  emp
).

Definition test_rvv_entail_wit_4_split_goal_1 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (R_2: XTOutput) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (bw: Z) (input: Z) (output: Z) (vl: Z) (PreH1 : (xt_valid F W G )) (PreH2 : (input_stride = (xt_input_stride (G)))) (PreH3 : (output_stride = (xt_output_stride (G)))) (PreH4 : (block_width = (xt_width (G)))) (PreH5 : (block_height = (xt_height (G)))) (PreH6 : (sizeof(UINT) = 4)) (PreH7 : (sizeof(UINT64) = 8)) (PreH8 : (sizeof(UINT64) = 8)) (PreH9 : (0 <= bw)) (PreH10 : (bw <= (xt_total (G)))) (PreH11 : (input = (xt_current_input (G) (((xt_total (G)) - bw )) (0)))) (PreH12 : (output = (xt_current_output (G) (((xt_total (G)) - bw )) (0)))) (PreH13 : (xt_progress F G old R_2 ((xt_total (G)) - bw ) 0 0 )) (PreH14 : (0 < bw)) (PreH15 : (xt_legal_vl bw vl )) (PreH16 : (0 < vl)) (PreH17 : (vl <= 32)) (PreH18 : (vl <= bw)) ,
  (xt_progress F G old R_2 ((xt_total (G)) - bw ) vl (block_height - block_height ) )
.

Definition test_rvv_entail_wit_4_split_goal_2 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (R_2: XTOutput) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (bw: Z) (input: Z) (output: Z) (vl: Z) (PreH1 : (xt_valid F W G )) (PreH2 : (input_stride = (xt_input_stride (G)))) (PreH3 : (output_stride = (xt_output_stride (G)))) (PreH4 : (block_width = (xt_width (G)))) (PreH5 : (block_height = (xt_height (G)))) (PreH6 : (sizeof(UINT) = 4)) (PreH7 : (sizeof(UINT64) = 8)) (PreH8 : (sizeof(UINT64) = 8)) (PreH9 : (0 <= bw)) (PreH10 : (bw <= (xt_total (G)))) (PreH11 : (input = (xt_current_input (G) (((xt_total (G)) - bw )) (0)))) (PreH12 : (output = (xt_current_output (G) (((xt_total (G)) - bw )) (0)))) (PreH13 : (xt_progress F G old R_2 ((xt_total (G)) - bw ) 0 0 )) (PreH14 : (0 < bw)) (PreH15 : (xt_legal_vl bw vl )) (PreH16 : (0 < vl)) (PreH17 : (vl <= 32)) (PreH18 : (vl <= bw)) ,
  (output = (xt_current_output (G) (((xt_total (G)) - bw )) ((block_height - block_height ))))
.

Definition test_rvv_entail_wit_4_split_goal_3 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (R_2: XTOutput) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (bw: Z) (input: Z) (output: Z) (vl: Z) (PreH1 : (xt_valid F W G )) (PreH2 : (input_stride = (xt_input_stride (G)))) (PreH3 : (output_stride = (xt_output_stride (G)))) (PreH4 : (block_width = (xt_width (G)))) (PreH5 : (block_height = (xt_height (G)))) (PreH6 : (sizeof(UINT) = 4)) (PreH7 : (sizeof(UINT64) = 8)) (PreH8 : (sizeof(UINT64) = 8)) (PreH9 : (0 <= bw)) (PreH10 : (bw <= (xt_total (G)))) (PreH11 : (input = (xt_current_input (G) (((xt_total (G)) - bw )) (0)))) (PreH12 : (output = (xt_current_output (G) (((xt_total (G)) - bw )) (0)))) (PreH13 : (xt_progress F G old R_2 ((xt_total (G)) - bw ) 0 0 )) (PreH14 : (0 < bw)) (PreH15 : (xt_legal_vl bw vl )) (PreH16 : (0 < vl)) (PreH17 : (vl <= 32)) (PreH18 : (vl <= bw)) ,
  (input = (xt_current_input (G) (((xt_total (G)) - bw )) ((block_height - block_height ))))
.

Definition test_rvv_entail_wit_4_split_goal_4 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (R_2: XTOutput) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (bw: Z) (input: Z) (output: Z) (vl: Z) (PreH1 : (xt_valid F W G )) (PreH2 : (input_stride = (xt_input_stride (G)))) (PreH3 : (output_stride = (xt_output_stride (G)))) (PreH4 : (block_width = (xt_width (G)))) (PreH5 : (block_height = (xt_height (G)))) (PreH6 : (sizeof(UINT) = 4)) (PreH7 : (sizeof(UINT64) = 8)) (PreH8 : (sizeof(UINT64) = 8)) (PreH9 : (0 <= bw)) (PreH10 : (bw <= (xt_total (G)))) (PreH11 : (input = (xt_current_input (G) (((xt_total (G)) - bw )) (0)))) (PreH12 : (output = (xt_current_output (G) (((xt_total (G)) - bw )) (0)))) (PreH13 : (xt_progress F G old R_2 ((xt_total (G)) - bw ) 0 0 )) (PreH14 : (0 < bw)) (PreH15 : (xt_legal_vl bw vl )) (PreH16 : (0 < vl)) (PreH17 : (vl <= 32)) (PreH18 : (vl <= bw)) ,
  (0 <= block_height)
.

Definition test_rvv_entail_wit_5 := 
(
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (R_2: XTOutput) (o: Z) (i: Z) (output: Z) (input: Z) (bh: Z) (vl: Z) (bw: Z) (block_height: Z) (block_width: Z) (output_stride: Z) (input_stride: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (xt_rvv_lane F i vl 0 x0 )) (PreH2 : (xt_rvv_lane F i vl 1 x1 )) (PreH3 : (xt_rvv_lane F i vl 2 x2 )) (PreH4 : (xt_rvv_lane F i vl 3 x3 )) (PreH5 : (xt_rvv_lane F i vl 4 x4 )) (PreH6 : (xt_rvv_lane F i vl 5 x5 )) (PreH7 : (xt_rvv_lane F i vl 6 x6 )) (PreH8 : (xt_rvv_lane F i vl 7 x7 )) (PreH9 : (xt_rvv_lane F i vl 8 x8 )) (PreH10 : (xt_rvv_lane F i vl 9 x9 )) (PreH11 : (xt_rvv_lane F i vl 10 x10 )) (PreH12 : (xt_rvv_lane F i vl 11 x11 )) (PreH13 : (xt_rvv_lane F i vl 12 x12 )) (PreH14 : (xt_rvv_lane F i vl 13 x13 )) (PreH15 : (xt_rvv_lane F i vl 14 x14 )) (PreH16 : (xt_rvv_lane F i vl 15 x15 )) (PreH17 : (xt_rvv_lane F i vl 16 x16 )) (PreH18 : (xt_rvv_lane F i vl 17 x17 )) (PreH19 : (xt_rvv_lane F i vl 18 x18 )) (PreH20 : (xt_rvv_lane F i vl 19 x19 )) (PreH21 : (xt_rvv_lane F i vl 20 x20 )) (PreH22 : (xt_rvv_lane F i vl 21 x21 )) (PreH23 : (xt_rvv_lane F i vl 22 x22 )) (PreH24 : (xt_rvv_lane F i vl 23 x23 )) (PreH25 : (xt_rvv_lane F i vl 24 x24 )) (PreH26 : (xt_rvv_lane F i vl 25 x25 )) (PreH27 : (xt_rvv_lane F i vl 26 x26 )) (PreH28 : (xt_rvv_lane F i vl 27 x27 )) (PreH29 : (xt_rvv_lane F i vl 28 x28 )) (PreH30 : (xt_rvv_lane F i vl 29 x29 )) (PreH31 : (xt_rvv_lane F i vl 30 x30 )) (PreH32 : (xt_rvv_lane F i vl 31 x31 )) (PreH33 : (bh > 0)) (PreH34 : (xt_valid F W G )) (PreH35 : (input_stride = (xt_input_stride (G)))) (PreH36 : (output_stride = (xt_output_stride (G)))) (PreH37 : (block_width = (xt_width (G)))) (PreH38 : (block_height = (xt_height (G)))) (PreH39 : (sizeof(UINT) = 4)) (PreH40 : (sizeof(UINT64) = 8)) (PreH41 : (sizeof(UINT64) = 8)) (PreH42 : (0 < bw)) (PreH43 : (bw <= (xt_total (G)))) (PreH44 : (xt_legal_vl bw vl )) (PreH45 : (0 < vl)) (PreH46 : (vl <= 32)) (PreH47 : (vl <= bw)) (PreH48 : (0 <= bh)) (PreH49 : (bh <= block_height)) (PreH50 : (input = (xt_current_input (G) (((xt_total (G)) - bw )) (0)))) (PreH51 : (output = (xt_current_output (G) (((xt_total (G)) - bw )) (0)))) (PreH52 : (i = (xt_current_input (G) (((xt_total (G)) - bw )) ((block_height - bh ))))) (PreH53 : (o = (xt_current_output (G) (((xt_total (G)) - bw )) ((block_height - bh ))))) (PreH54 : (xt_progress F G old R_2 ((xt_total (G)) - bw ) vl (block_height - bh ) )) ,
  (xt_output W (xt_strided_write (R_2) (o) (output_stride) (vl) ((xt_vec32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) )
  **  (xt_data F )
|--
  EX (R: XTOutput) ,
  “ (xt_valid F W G ) ” 
  &&  “ (input_stride = (xt_input_stride (G))) ” 
  &&  “ (output_stride = (xt_output_stride (G))) ” 
  &&  “ (block_width = (xt_width (G))) ” 
  &&  “ (block_height = (xt_height (G))) ” 
  &&  “ (sizeof(UINT) = 4) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (0 < bw) ” 
  &&  “ (bw <= (xt_total (G))) ” 
  &&  “ (xt_legal_vl bw vl ) ” 
  &&  “ (0 < vl) ” 
  &&  “ (vl <= 32) ” 
  &&  “ (vl <= bw) ” 
  &&  “ (0 <= (bh - 1 )) ” 
  &&  “ ((bh - 1 ) <= block_height) ” 
  &&  “ (input = (xt_current_input (G) (((xt_total (G)) - bw )) (0))) ” 
  &&  “ (output = (xt_current_output (G) (((xt_total (G)) - bw )) (0))) ” 
  &&  “ ((unsigned_last_nbits (((unsigned_last_nbits (i) (64)) + input_stride )) (64)) = (xt_current_input (G) (((xt_total (G)) - bw )) ((block_height - (bh - 1 ) )))) ” 
  &&  “ ((o + (1 * sizeof(UINT))) = (xt_current_output (G) (((xt_total (G)) - bw )) ((block_height - (bh - 1 ) )))) ” 
  &&  “ (xt_progress F G old R ((xt_total (G)) - bw ) vl (block_height - (bh - 1 ) ) ) ”
  &&  (xt_data F )
  **  (xt_output W R )
) \/
(
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (R_2: XTOutput) (o: Z) (i: Z) (output: Z) (input: Z) (bh: Z) (vl: Z) (bw: Z) (block_height: Z) (block_width: Z) (output_stride: Z) (input_stride: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (xt_rvv_lane F i vl 0 x0 )) (PreH2 : (xt_rvv_lane F i vl 1 x1 )) (PreH3 : (xt_rvv_lane F i vl 2 x2 )) (PreH4 : (xt_rvv_lane F i vl 3 x3 )) (PreH5 : (xt_rvv_lane F i vl 4 x4 )) (PreH6 : (xt_rvv_lane F i vl 5 x5 )) (PreH7 : (xt_rvv_lane F i vl 6 x6 )) (PreH8 : (xt_rvv_lane F i vl 7 x7 )) (PreH9 : (xt_rvv_lane F i vl 8 x8 )) (PreH10 : (xt_rvv_lane F i vl 9 x9 )) (PreH11 : (xt_rvv_lane F i vl 10 x10 )) (PreH12 : (xt_rvv_lane F i vl 11 x11 )) (PreH13 : (xt_rvv_lane F i vl 12 x12 )) (PreH14 : (xt_rvv_lane F i vl 13 x13 )) (PreH15 : (xt_rvv_lane F i vl 14 x14 )) (PreH16 : (xt_rvv_lane F i vl 15 x15 )) (PreH17 : (xt_rvv_lane F i vl 16 x16 )) (PreH18 : (xt_rvv_lane F i vl 17 x17 )) (PreH19 : (xt_rvv_lane F i vl 18 x18 )) (PreH20 : (xt_rvv_lane F i vl 19 x19 )) (PreH21 : (xt_rvv_lane F i vl 20 x20 )) (PreH22 : (xt_rvv_lane F i vl 21 x21 )) (PreH23 : (xt_rvv_lane F i vl 22 x22 )) (PreH24 : (xt_rvv_lane F i vl 23 x23 )) (PreH25 : (xt_rvv_lane F i vl 24 x24 )) (PreH26 : (xt_rvv_lane F i vl 25 x25 )) (PreH27 : (xt_rvv_lane F i vl 26 x26 )) (PreH28 : (xt_rvv_lane F i vl 27 x27 )) (PreH29 : (xt_rvv_lane F i vl 28 x28 )) (PreH30 : (xt_rvv_lane F i vl 29 x29 )) (PreH31 : (xt_rvv_lane F i vl 30 x30 )) (PreH32 : (xt_rvv_lane F i vl 31 x31 )) (PreH33 : (bh > 0)) (PreH34 : (xt_valid F W G )) (PreH35 : (input_stride = (xt_input_stride (G)))) (PreH36 : (output_stride = (xt_output_stride (G)))) (PreH37 : (block_width = (xt_width (G)))) (PreH38 : (block_height = (xt_height (G)))) (PreH39 : (sizeof(UINT) = 4)) (PreH40 : (sizeof(UINT64) = 8)) (PreH41 : (sizeof(UINT64) = 8)) (PreH42 : (0 < bw)) (PreH43 : (bw <= (xt_total (G)))) (PreH44 : (xt_legal_vl bw vl )) (PreH45 : (0 < vl)) (PreH46 : (vl <= 32)) (PreH47 : (vl <= bw)) (PreH48 : (0 <= bh)) (PreH49 : (bh <= block_height)) (PreH50 : (input = (xt_current_input (G) (((xt_total (G)) - bw )) (0)))) (PreH51 : (output = (xt_current_output (G) (((xt_total (G)) - bw )) (0)))) (PreH52 : (i = (xt_current_input (G) (((xt_total (G)) - bw )) ((block_height - bh ))))) (PreH53 : (o = (xt_current_output (G) (((xt_total (G)) - bw )) ((block_height - bh ))))) (PreH54 : (xt_progress F G old R_2 ((xt_total (G)) - bw ) vl (block_height - bh ) )) ,
  TT && emp 
|--
  “ (xt_progress F G old (xt_strided_write (R_2) (o) (output_stride) (vl) ((xt_vec32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) ((xt_total (G)) - bw ) vl (block_height - (bh - 1 ) ) ) ” 
  &&  “ ((o + (1 * 4)) = (xt_current_output (G) (((xt_total (G)) - bw )) ((block_height - (bh - 1 ) )))) ” 
  &&  “ ((unsigned_last_nbits (((unsigned_last_nbits (i) (64)) + input_stride )) (64)) = (xt_current_input (G) (((xt_total (G)) - bw )) ((block_height - (bh - 1 ) )))) ”
  &&  emp
).

Definition test_rvv_entail_wit_5_split_goal_1 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (R_2: XTOutput) (o: Z) (i: Z) (output: Z) (input: Z) (bh: Z) (vl: Z) (bw: Z) (block_height: Z) (block_width: Z) (output_stride: Z) (input_stride: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (xt_rvv_lane F i vl 0 x0 )) (PreH2 : (xt_rvv_lane F i vl 1 x1 )) (PreH3 : (xt_rvv_lane F i vl 2 x2 )) (PreH4 : (xt_rvv_lane F i vl 3 x3 )) (PreH5 : (xt_rvv_lane F i vl 4 x4 )) (PreH6 : (xt_rvv_lane F i vl 5 x5 )) (PreH7 : (xt_rvv_lane F i vl 6 x6 )) (PreH8 : (xt_rvv_lane F i vl 7 x7 )) (PreH9 : (xt_rvv_lane F i vl 8 x8 )) (PreH10 : (xt_rvv_lane F i vl 9 x9 )) (PreH11 : (xt_rvv_lane F i vl 10 x10 )) (PreH12 : (xt_rvv_lane F i vl 11 x11 )) (PreH13 : (xt_rvv_lane F i vl 12 x12 )) (PreH14 : (xt_rvv_lane F i vl 13 x13 )) (PreH15 : (xt_rvv_lane F i vl 14 x14 )) (PreH16 : (xt_rvv_lane F i vl 15 x15 )) (PreH17 : (xt_rvv_lane F i vl 16 x16 )) (PreH18 : (xt_rvv_lane F i vl 17 x17 )) (PreH19 : (xt_rvv_lane F i vl 18 x18 )) (PreH20 : (xt_rvv_lane F i vl 19 x19 )) (PreH21 : (xt_rvv_lane F i vl 20 x20 )) (PreH22 : (xt_rvv_lane F i vl 21 x21 )) (PreH23 : (xt_rvv_lane F i vl 22 x22 )) (PreH24 : (xt_rvv_lane F i vl 23 x23 )) (PreH25 : (xt_rvv_lane F i vl 24 x24 )) (PreH26 : (xt_rvv_lane F i vl 25 x25 )) (PreH27 : (xt_rvv_lane F i vl 26 x26 )) (PreH28 : (xt_rvv_lane F i vl 27 x27 )) (PreH29 : (xt_rvv_lane F i vl 28 x28 )) (PreH30 : (xt_rvv_lane F i vl 29 x29 )) (PreH31 : (xt_rvv_lane F i vl 30 x30 )) (PreH32 : (xt_rvv_lane F i vl 31 x31 )) (PreH33 : (bh > 0)) (PreH34 : (xt_valid F W G )) (PreH35 : (input_stride = (xt_input_stride (G)))) (PreH36 : (output_stride = (xt_output_stride (G)))) (PreH37 : (block_width = (xt_width (G)))) (PreH38 : (block_height = (xt_height (G)))) (PreH39 : (sizeof(UINT) = 4)) (PreH40 : (sizeof(UINT64) = 8)) (PreH41 : (sizeof(UINT64) = 8)) (PreH42 : (0 < bw)) (PreH43 : (bw <= (xt_total (G)))) (PreH44 : (xt_legal_vl bw vl )) (PreH45 : (0 < vl)) (PreH46 : (vl <= 32)) (PreH47 : (vl <= bw)) (PreH48 : (0 <= bh)) (PreH49 : (bh <= block_height)) (PreH50 : (input = (xt_current_input (G) (((xt_total (G)) - bw )) (0)))) (PreH51 : (output = (xt_current_output (G) (((xt_total (G)) - bw )) (0)))) (PreH52 : (i = (xt_current_input (G) (((xt_total (G)) - bw )) ((block_height - bh ))))) (PreH53 : (o = (xt_current_output (G) (((xt_total (G)) - bw )) ((block_height - bh ))))) (PreH54 : (xt_progress F G old R_2 ((xt_total (G)) - bw ) vl (block_height - bh ) )) ,
  (xt_progress F G old (xt_strided_write (R_2) (o) (output_stride) (vl) ((xt_vec32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) ((xt_total (G)) - bw ) vl (block_height - (bh - 1 ) ) )
.

Definition test_rvv_entail_wit_5_split_goal_2 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (R_2: XTOutput) (o: Z) (i: Z) (output: Z) (input: Z) (bh: Z) (vl: Z) (bw: Z) (block_height: Z) (block_width: Z) (output_stride: Z) (input_stride: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (xt_rvv_lane F i vl 0 x0 )) (PreH2 : (xt_rvv_lane F i vl 1 x1 )) (PreH3 : (xt_rvv_lane F i vl 2 x2 )) (PreH4 : (xt_rvv_lane F i vl 3 x3 )) (PreH5 : (xt_rvv_lane F i vl 4 x4 )) (PreH6 : (xt_rvv_lane F i vl 5 x5 )) (PreH7 : (xt_rvv_lane F i vl 6 x6 )) (PreH8 : (xt_rvv_lane F i vl 7 x7 )) (PreH9 : (xt_rvv_lane F i vl 8 x8 )) (PreH10 : (xt_rvv_lane F i vl 9 x9 )) (PreH11 : (xt_rvv_lane F i vl 10 x10 )) (PreH12 : (xt_rvv_lane F i vl 11 x11 )) (PreH13 : (xt_rvv_lane F i vl 12 x12 )) (PreH14 : (xt_rvv_lane F i vl 13 x13 )) (PreH15 : (xt_rvv_lane F i vl 14 x14 )) (PreH16 : (xt_rvv_lane F i vl 15 x15 )) (PreH17 : (xt_rvv_lane F i vl 16 x16 )) (PreH18 : (xt_rvv_lane F i vl 17 x17 )) (PreH19 : (xt_rvv_lane F i vl 18 x18 )) (PreH20 : (xt_rvv_lane F i vl 19 x19 )) (PreH21 : (xt_rvv_lane F i vl 20 x20 )) (PreH22 : (xt_rvv_lane F i vl 21 x21 )) (PreH23 : (xt_rvv_lane F i vl 22 x22 )) (PreH24 : (xt_rvv_lane F i vl 23 x23 )) (PreH25 : (xt_rvv_lane F i vl 24 x24 )) (PreH26 : (xt_rvv_lane F i vl 25 x25 )) (PreH27 : (xt_rvv_lane F i vl 26 x26 )) (PreH28 : (xt_rvv_lane F i vl 27 x27 )) (PreH29 : (xt_rvv_lane F i vl 28 x28 )) (PreH30 : (xt_rvv_lane F i vl 29 x29 )) (PreH31 : (xt_rvv_lane F i vl 30 x30 )) (PreH32 : (xt_rvv_lane F i vl 31 x31 )) (PreH33 : (bh > 0)) (PreH34 : (xt_valid F W G )) (PreH35 : (input_stride = (xt_input_stride (G)))) (PreH36 : (output_stride = (xt_output_stride (G)))) (PreH37 : (block_width = (xt_width (G)))) (PreH38 : (block_height = (xt_height (G)))) (PreH39 : (sizeof(UINT) = 4)) (PreH40 : (sizeof(UINT64) = 8)) (PreH41 : (sizeof(UINT64) = 8)) (PreH42 : (0 < bw)) (PreH43 : (bw <= (xt_total (G)))) (PreH44 : (xt_legal_vl bw vl )) (PreH45 : (0 < vl)) (PreH46 : (vl <= 32)) (PreH47 : (vl <= bw)) (PreH48 : (0 <= bh)) (PreH49 : (bh <= block_height)) (PreH50 : (input = (xt_current_input (G) (((xt_total (G)) - bw )) (0)))) (PreH51 : (output = (xt_current_output (G) (((xt_total (G)) - bw )) (0)))) (PreH52 : (i = (xt_current_input (G) (((xt_total (G)) - bw )) ((block_height - bh ))))) (PreH53 : (o = (xt_current_output (G) (((xt_total (G)) - bw )) ((block_height - bh ))))) (PreH54 : (xt_progress F G old R_2 ((xt_total (G)) - bw ) vl (block_height - bh ) )) ,
  ((o + (1 * 4)) = (xt_current_output (G) (((xt_total (G)) - bw )) ((block_height - (bh - 1 ) ))))
.

Definition test_rvv_entail_wit_5_split_goal_3 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (R_2: XTOutput) (o: Z) (i: Z) (output: Z) (input: Z) (bh: Z) (vl: Z) (bw: Z) (block_height: Z) (block_width: Z) (output_stride: Z) (input_stride: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (xt_rvv_lane F i vl 0 x0 )) (PreH2 : (xt_rvv_lane F i vl 1 x1 )) (PreH3 : (xt_rvv_lane F i vl 2 x2 )) (PreH4 : (xt_rvv_lane F i vl 3 x3 )) (PreH5 : (xt_rvv_lane F i vl 4 x4 )) (PreH6 : (xt_rvv_lane F i vl 5 x5 )) (PreH7 : (xt_rvv_lane F i vl 6 x6 )) (PreH8 : (xt_rvv_lane F i vl 7 x7 )) (PreH9 : (xt_rvv_lane F i vl 8 x8 )) (PreH10 : (xt_rvv_lane F i vl 9 x9 )) (PreH11 : (xt_rvv_lane F i vl 10 x10 )) (PreH12 : (xt_rvv_lane F i vl 11 x11 )) (PreH13 : (xt_rvv_lane F i vl 12 x12 )) (PreH14 : (xt_rvv_lane F i vl 13 x13 )) (PreH15 : (xt_rvv_lane F i vl 14 x14 )) (PreH16 : (xt_rvv_lane F i vl 15 x15 )) (PreH17 : (xt_rvv_lane F i vl 16 x16 )) (PreH18 : (xt_rvv_lane F i vl 17 x17 )) (PreH19 : (xt_rvv_lane F i vl 18 x18 )) (PreH20 : (xt_rvv_lane F i vl 19 x19 )) (PreH21 : (xt_rvv_lane F i vl 20 x20 )) (PreH22 : (xt_rvv_lane F i vl 21 x21 )) (PreH23 : (xt_rvv_lane F i vl 22 x22 )) (PreH24 : (xt_rvv_lane F i vl 23 x23 )) (PreH25 : (xt_rvv_lane F i vl 24 x24 )) (PreH26 : (xt_rvv_lane F i vl 25 x25 )) (PreH27 : (xt_rvv_lane F i vl 26 x26 )) (PreH28 : (xt_rvv_lane F i vl 27 x27 )) (PreH29 : (xt_rvv_lane F i vl 28 x28 )) (PreH30 : (xt_rvv_lane F i vl 29 x29 )) (PreH31 : (xt_rvv_lane F i vl 30 x30 )) (PreH32 : (xt_rvv_lane F i vl 31 x31 )) (PreH33 : (bh > 0)) (PreH34 : (xt_valid F W G )) (PreH35 : (input_stride = (xt_input_stride (G)))) (PreH36 : (output_stride = (xt_output_stride (G)))) (PreH37 : (block_width = (xt_width (G)))) (PreH38 : (block_height = (xt_height (G)))) (PreH39 : (sizeof(UINT) = 4)) (PreH40 : (sizeof(UINT64) = 8)) (PreH41 : (sizeof(UINT64) = 8)) (PreH42 : (0 < bw)) (PreH43 : (bw <= (xt_total (G)))) (PreH44 : (xt_legal_vl bw vl )) (PreH45 : (0 < vl)) (PreH46 : (vl <= 32)) (PreH47 : (vl <= bw)) (PreH48 : (0 <= bh)) (PreH49 : (bh <= block_height)) (PreH50 : (input = (xt_current_input (G) (((xt_total (G)) - bw )) (0)))) (PreH51 : (output = (xt_current_output (G) (((xt_total (G)) - bw )) (0)))) (PreH52 : (i = (xt_current_input (G) (((xt_total (G)) - bw )) ((block_height - bh ))))) (PreH53 : (o = (xt_current_output (G) (((xt_total (G)) - bw )) ((block_height - bh ))))) (PreH54 : (xt_progress F G old R_2 ((xt_total (G)) - bw ) vl (block_height - bh ) )) ,
  ((unsigned_last_nbits (((unsigned_last_nbits (i) (64)) + input_stride )) (64)) = (xt_current_input (G) (((xt_total (G)) - bw )) ((block_height - (bh - 1 ) ))))
.

Definition test_rvv_entail_wit_6 := 
(
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (R_2: XTOutput) (o: Z) (i: Z) (output: Z) (input: Z) (bh: Z) (vl: Z) (bw: Z) (block_height: Z) (block_width: Z) (output_stride: Z) (input_stride: Z) (PreH1 : (bh <= 0)) (PreH2 : (xt_valid F W G )) (PreH3 : (input_stride = (xt_input_stride (G)))) (PreH4 : (output_stride = (xt_output_stride (G)))) (PreH5 : (block_width = (xt_width (G)))) (PreH6 : (block_height = (xt_height (G)))) (PreH7 : (sizeof(UINT) = 4)) (PreH8 : (sizeof(UINT64) = 8)) (PreH9 : (sizeof(UINT64) = 8)) (PreH10 : (0 < bw)) (PreH11 : (bw <= (xt_total (G)))) (PreH12 : (xt_legal_vl bw vl )) (PreH13 : (0 < vl)) (PreH14 : (vl <= 32)) (PreH15 : (vl <= bw)) (PreH16 : (0 <= bh)) (PreH17 : (bh <= block_height)) (PreH18 : (input = (xt_current_input (G) (((xt_total (G)) - bw )) (0)))) (PreH19 : (output = (xt_current_output (G) (((xt_total (G)) - bw )) (0)))) (PreH20 : (i = (xt_current_input (G) (((xt_total (G)) - bw )) ((block_height - bh ))))) (PreH21 : (o = (xt_current_output (G) (((xt_total (G)) - bw )) ((block_height - bh ))))) (PreH22 : (xt_progress F G old R_2 ((xt_total (G)) - bw ) vl (block_height - bh ) )) ,
  (xt_data F )
  **  (xt_output W R_2 )
|--
  EX (R: XTOutput) ,
  “ (xt_valid F W G ) ” 
  &&  “ (input_stride = (xt_input_stride (G))) ” 
  &&  “ (output_stride = (xt_output_stride (G))) ” 
  &&  “ (block_width = (xt_width (G))) ” 
  &&  “ (block_height = (xt_height (G))) ” 
  &&  “ (sizeof(UINT) = 4) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (0 <= (bw - vl )) ” 
  &&  “ ((bw - vl ) <= (xt_total (G))) ” 
  &&  “ ((input + (vl * sizeof(UINT))) = (xt_current_input (G) (((xt_total (G)) - (bw - vl ) )) (0))) ” 
  &&  “ ((unsigned_last_nbits (((unsigned_last_nbits (output) (64)) + (unsigned_last_nbits ((vl * output_stride )) (64)) )) (64)) = (xt_current_output (G) (((xt_total (G)) - (bw - vl ) )) (0))) ” 
  &&  “ (xt_progress F G old R ((xt_total (G)) - (bw - vl ) ) 0 0 ) ”
  &&  (xt_data F )
  **  (xt_output W R )
) \/
(
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (R_2: XTOutput) (o: Z) (i: Z) (output: Z) (input: Z) (bh: Z) (vl: Z) (bw: Z) (block_height: Z) (block_width: Z) (output_stride: Z) (input_stride: Z) (PreH1 : (bh <= 0)) (PreH2 : (xt_valid F W G )) (PreH3 : (input_stride = (xt_input_stride (G)))) (PreH4 : (output_stride = (xt_output_stride (G)))) (PreH5 : (block_width = (xt_width (G)))) (PreH6 : (block_height = (xt_height (G)))) (PreH7 : (sizeof(UINT) = 4)) (PreH8 : (sizeof(UINT64) = 8)) (PreH9 : (sizeof(UINT64) = 8)) (PreH10 : (0 < bw)) (PreH11 : (bw <= (xt_total (G)))) (PreH12 : (xt_legal_vl bw vl )) (PreH13 : (0 < vl)) (PreH14 : (vl <= 32)) (PreH15 : (vl <= bw)) (PreH16 : (0 <= bh)) (PreH17 : (bh <= block_height)) (PreH18 : (input = (xt_current_input (G) (((xt_total (G)) - bw )) (0)))) (PreH19 : (output = (xt_current_output (G) (((xt_total (G)) - bw )) (0)))) (PreH20 : (i = (xt_current_input (G) (((xt_total (G)) - bw )) ((block_height - bh ))))) (PreH21 : (o = (xt_current_output (G) (((xt_total (G)) - bw )) ((block_height - bh ))))) (PreH22 : (xt_progress F G old R_2 ((xt_total (G)) - bw ) vl (block_height - bh ) )) ,
  TT && emp 
|--
  “ (xt_progress F G old R_2 ((xt_total (G)) - (bw - vl ) ) 0 0 ) ” 
  &&  “ ((unsigned_last_nbits (((unsigned_last_nbits (output) (64)) + (unsigned_last_nbits ((vl * output_stride )) (64)) )) (64)) = (xt_current_output (G) (((xt_total (G)) - (bw - vl ) )) (0))) ” 
  &&  “ ((input + (vl * 4)) = (xt_current_input (G) (((xt_total (G)) - (bw - vl ) )) (0))) ”
  &&  emp
).

Definition test_rvv_entail_wit_6_split_goal_1 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (R_2: XTOutput) (o: Z) (i: Z) (output: Z) (input: Z) (bh: Z) (vl: Z) (bw: Z) (block_height: Z) (block_width: Z) (output_stride: Z) (input_stride: Z) (PreH1 : (bh <= 0)) (PreH2 : (xt_valid F W G )) (PreH3 : (input_stride = (xt_input_stride (G)))) (PreH4 : (output_stride = (xt_output_stride (G)))) (PreH5 : (block_width = (xt_width (G)))) (PreH6 : (block_height = (xt_height (G)))) (PreH7 : (sizeof(UINT) = 4)) (PreH8 : (sizeof(UINT64) = 8)) (PreH9 : (sizeof(UINT64) = 8)) (PreH10 : (0 < bw)) (PreH11 : (bw <= (xt_total (G)))) (PreH12 : (xt_legal_vl bw vl )) (PreH13 : (0 < vl)) (PreH14 : (vl <= 32)) (PreH15 : (vl <= bw)) (PreH16 : (0 <= bh)) (PreH17 : (bh <= block_height)) (PreH18 : (input = (xt_current_input (G) (((xt_total (G)) - bw )) (0)))) (PreH19 : (output = (xt_current_output (G) (((xt_total (G)) - bw )) (0)))) (PreH20 : (i = (xt_current_input (G) (((xt_total (G)) - bw )) ((block_height - bh ))))) (PreH21 : (o = (xt_current_output (G) (((xt_total (G)) - bw )) ((block_height - bh ))))) (PreH22 : (xt_progress F G old R_2 ((xt_total (G)) - bw ) vl (block_height - bh ) )) ,
  (xt_progress F G old R_2 ((xt_total (G)) - (bw - vl ) ) 0 0 )
.

Definition test_rvv_entail_wit_6_split_goal_2 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (R_2: XTOutput) (o: Z) (i: Z) (output: Z) (input: Z) (bh: Z) (vl: Z) (bw: Z) (block_height: Z) (block_width: Z) (output_stride: Z) (input_stride: Z) (PreH1 : (bh <= 0)) (PreH2 : (xt_valid F W G )) (PreH3 : (input_stride = (xt_input_stride (G)))) (PreH4 : (output_stride = (xt_output_stride (G)))) (PreH5 : (block_width = (xt_width (G)))) (PreH6 : (block_height = (xt_height (G)))) (PreH7 : (sizeof(UINT) = 4)) (PreH8 : (sizeof(UINT64) = 8)) (PreH9 : (sizeof(UINT64) = 8)) (PreH10 : (0 < bw)) (PreH11 : (bw <= (xt_total (G)))) (PreH12 : (xt_legal_vl bw vl )) (PreH13 : (0 < vl)) (PreH14 : (vl <= 32)) (PreH15 : (vl <= bw)) (PreH16 : (0 <= bh)) (PreH17 : (bh <= block_height)) (PreH18 : (input = (xt_current_input (G) (((xt_total (G)) - bw )) (0)))) (PreH19 : (output = (xt_current_output (G) (((xt_total (G)) - bw )) (0)))) (PreH20 : (i = (xt_current_input (G) (((xt_total (G)) - bw )) ((block_height - bh ))))) (PreH21 : (o = (xt_current_output (G) (((xt_total (G)) - bw )) ((block_height - bh ))))) (PreH22 : (xt_progress F G old R_2 ((xt_total (G)) - bw ) vl (block_height - bh ) )) ,
  ((unsigned_last_nbits (((unsigned_last_nbits (output) (64)) + (unsigned_last_nbits ((vl * output_stride )) (64)) )) (64)) = (xt_current_output (G) (((xt_total (G)) - (bw - vl ) )) (0)))
.

Definition test_rvv_entail_wit_6_split_goal_3 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (R_2: XTOutput) (o: Z) (i: Z) (output: Z) (input: Z) (bh: Z) (vl: Z) (bw: Z) (block_height: Z) (block_width: Z) (output_stride: Z) (input_stride: Z) (PreH1 : (bh <= 0)) (PreH2 : (xt_valid F W G )) (PreH3 : (input_stride = (xt_input_stride (G)))) (PreH4 : (output_stride = (xt_output_stride (G)))) (PreH5 : (block_width = (xt_width (G)))) (PreH6 : (block_height = (xt_height (G)))) (PreH7 : (sizeof(UINT) = 4)) (PreH8 : (sizeof(UINT64) = 8)) (PreH9 : (sizeof(UINT64) = 8)) (PreH10 : (0 < bw)) (PreH11 : (bw <= (xt_total (G)))) (PreH12 : (xt_legal_vl bw vl )) (PreH13 : (0 < vl)) (PreH14 : (vl <= 32)) (PreH15 : (vl <= bw)) (PreH16 : (0 <= bh)) (PreH17 : (bh <= block_height)) (PreH18 : (input = (xt_current_input (G) (((xt_total (G)) - bw )) (0)))) (PreH19 : (output = (xt_current_output (G) (((xt_total (G)) - bw )) (0)))) (PreH20 : (i = (xt_current_input (G) (((xt_total (G)) - bw )) ((block_height - bh ))))) (PreH21 : (o = (xt_current_output (G) (((xt_total (G)) - bw )) ((block_height - bh ))))) (PreH22 : (xt_progress F G old R_2 ((xt_total (G)) - bw ) vl (block_height - bh ) )) ,
  ((input + (vl * 4)) = (xt_current_input (G) (((xt_total (G)) - (bw - vl ) )) (0)))
.

Definition test_rvv_return_wit_1 := 
(
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (R_2: XTOutput) (output: Z) (input: Z) (bw: Z) (block_height: Z) (block_width: Z) (output_stride: Z) (input_stride: Z) (PreH1 : (bw <= 0)) (PreH2 : (xt_valid F W G )) (PreH3 : (input_stride = (xt_input_stride (G)))) (PreH4 : (output_stride = (xt_output_stride (G)))) (PreH5 : (block_width = (xt_width (G)))) (PreH6 : (block_height = (xt_height (G)))) (PreH7 : (sizeof(UINT) = 4)) (PreH8 : (sizeof(UINT64) = 8)) (PreH9 : (sizeof(UINT64) = 8)) (PreH10 : (0 <= bw)) (PreH11 : (bw <= (xt_total (G)))) (PreH12 : (input = (xt_current_input (G) (((xt_total (G)) - bw )) (0)))) (PreH13 : (output = (xt_current_output (G) (((xt_total (G)) - bw )) (0)))) (PreH14 : (xt_progress F G old R_2 ((xt_total (G)) - bw ) 0 0 )) ,
  (xt_data F )
  **  (xt_output W R_2 )
|--
  EX (R: XTOutput) ,
  “ (xt_result F G old R ) ”
  &&  (xt_data F )
  **  (xt_output W R )
) \/
(
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (R_2: XTOutput) (output: Z) (input: Z) (bw: Z) (block_height: Z) (block_width: Z) (output_stride: Z) (input_stride: Z) (PreH1 : (bw <= 0)) (PreH2 : (xt_valid F W G )) (PreH3 : (input_stride = (xt_input_stride (G)))) (PreH4 : (output_stride = (xt_output_stride (G)))) (PreH5 : (block_width = (xt_width (G)))) (PreH6 : (block_height = (xt_height (G)))) (PreH7 : (sizeof(UINT) = 4)) (PreH8 : (sizeof(UINT64) = 8)) (PreH9 : (sizeof(UINT64) = 8)) (PreH10 : (0 <= bw)) (PreH11 : (bw <= (xt_total (G)))) (PreH12 : (input = (xt_current_input (G) (((xt_total (G)) - bw )) (0)))) (PreH13 : (output = (xt_current_output (G) (((xt_total (G)) - bw )) (0)))) (PreH14 : (xt_progress F G old R_2 ((xt_total (G)) - bw ) 0 0 )) ,
  TT && emp 
|--
  “ (xt_result F G old R_2 ) ”
  &&  emp
).

Definition test_rvv_return_wit_1_split_goal_1 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (R_2: XTOutput) (output: Z) (input: Z) (bw: Z) (block_height: Z) (block_width: Z) (output_stride: Z) (input_stride: Z) (PreH1 : (bw <= 0)) (PreH2 : (xt_valid F W G )) (PreH3 : (input_stride = (xt_input_stride (G)))) (PreH4 : (output_stride = (xt_output_stride (G)))) (PreH5 : (block_width = (xt_width (G)))) (PreH6 : (block_height = (xt_height (G)))) (PreH7 : (sizeof(UINT) = 4)) (PreH8 : (sizeof(UINT64) = 8)) (PreH9 : (sizeof(UINT64) = 8)) (PreH10 : (0 <= bw)) (PreH11 : (bw <= (xt_total (G)))) (PreH12 : (input = (xt_current_input (G) (((xt_total (G)) - bw )) (0)))) (PreH13 : (output = (xt_current_output (G) (((xt_total (G)) - bw )) (0)))) (PreH14 : (xt_progress F G old R_2 ((xt_total (G)) - bw ) 0 0 )) ,
  (xt_result F G old R_2 )
.

Definition test_rvv_partial_solve_wit_1_pure := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_width = 1)) (PreH2 : (xt_valid F W G )) (PreH3 : (input = (xt_input (G)))) (PreH4 : (output = (xt_output_base (G)))) (PreH5 : (input_stride = (xt_input_stride (G)))) (PreH6 : (output_stride = (xt_output_stride (G)))) (PreH7 : (block_width = (xt_width (G)))) (PreH8 : (block_height = (xt_height (G)))) (PreH9 : (sizeof(UINT) = 4)) (PreH10 : (sizeof(UINT64) = 8)) (PreH11 : (sizeof(UINT64) = 8)) (PreH12 : (block_width = 1)) (PreH13 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (1 <> 0) ”
.

Definition test_rvv_partial_solve_wit_1_aux := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_width = 1)) (PreH2 : (xt_valid F W G )) (PreH3 : (input = (xt_input (G)))) (PreH4 : (output = (xt_output_base (G)))) (PreH5 : (input_stride = (xt_input_stride (G)))) (PreH6 : (output_stride = (xt_output_stride (G)))) (PreH7 : (block_width = (xt_width (G)))) (PreH8 : (block_height = (xt_height (G)))) (PreH9 : (sizeof(UINT) = 4)) (PreH10 : (sizeof(UINT64) = 8)) (PreH11 : (sizeof(UINT64) = 8)) (PreH12 : (block_width = 1)) (PreH13 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  (xt_data F )
  **  (xt_output W old )
|--
  “ (1 <> 0) ” 
  &&  “ (block_width = 1) ” 
  &&  “ (xt_valid F W G ) ” 
  &&  “ (input = (xt_input (G))) ” 
  &&  “ (output = (xt_output_base (G))) ” 
  &&  “ (input_stride = (xt_input_stride (G))) ” 
  &&  “ (output_stride = (xt_output_stride (G))) ” 
  &&  “ (block_width = (xt_width (G))) ” 
  &&  “ (block_height = (xt_height (G))) ” 
  &&  “ (sizeof(UINT) = 4) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (block_width = 1) ” 
  &&  “ (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64))) ”
  &&  (xt_data F )
  **  (xt_output W old )
.

Definition test_rvv_partial_solve_wit_1 := test_rvv_partial_solve_wit_1_pure -> test_rvv_partial_solve_wit_1_aux.

Definition test_rvv_partial_solve_wit_2_pure := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_width = 1)) (PreH2 : (xt_valid F W G )) (PreH3 : (input = (xt_input (G)))) (PreH4 : (output = (xt_output_base (G)))) (PreH5 : (input_stride = (xt_input_stride (G)))) (PreH6 : (output_stride = (xt_output_stride (G)))) (PreH7 : (block_width = (xt_width (G)))) (PreH8 : (block_height = (xt_height (G)))) (PreH9 : (sizeof(UINT) = 4)) (PreH10 : (sizeof(UINT64) = 8)) (PreH11 : (sizeof(UINT64) = 8)) (PreH12 : (block_width = 1)) (PreH13 : (block_height = 1)) ,
  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (1 <> 0) ”
.

Definition test_rvv_partial_solve_wit_2_aux := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_width = 1)) (PreH2 : (xt_valid F W G )) (PreH3 : (input = (xt_input (G)))) (PreH4 : (output = (xt_output_base (G)))) (PreH5 : (input_stride = (xt_input_stride (G)))) (PreH6 : (output_stride = (xt_output_stride (G)))) (PreH7 : (block_width = (xt_width (G)))) (PreH8 : (block_height = (xt_height (G)))) (PreH9 : (sizeof(UINT) = 4)) (PreH10 : (sizeof(UINT64) = 8)) (PreH11 : (sizeof(UINT64) = 8)) (PreH12 : (block_width = 1)) (PreH13 : (block_height = 1)) ,
  (xt_data F )
  **  (xt_output W old )
|--
  “ (1 <> 0) ” 
  &&  “ (block_width = 1) ” 
  &&  “ (xt_valid F W G ) ” 
  &&  “ (input = (xt_input (G))) ” 
  &&  “ (output = (xt_output_base (G))) ” 
  &&  “ (input_stride = (xt_input_stride (G))) ” 
  &&  “ (output_stride = (xt_output_stride (G))) ” 
  &&  “ (block_width = (xt_width (G))) ” 
  &&  “ (block_height = (xt_height (G))) ” 
  &&  “ (sizeof(UINT) = 4) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (block_width = 1) ” 
  &&  “ (block_height = 1) ”
  &&  (xt_data F )
  **  (xt_output W old )
.

Definition test_rvv_partial_solve_wit_2 := test_rvv_partial_solve_wit_2_pure -> test_rvv_partial_solve_wit_2_aux.

Definition test_rvv_partial_solve_wit_3_pure := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_width = 1)) (PreH2 : (xt_valid F W G )) (PreH3 : (input = (xt_input (G)))) (PreH4 : (output = (xt_output_base (G)))) (PreH5 : (input_stride = (xt_input_stride (G)))) (PreH6 : (output_stride = (xt_output_stride (G)))) (PreH7 : (block_width = (xt_width (G)))) (PreH8 : (block_height = (xt_height (G)))) (PreH9 : (sizeof(UINT) = 4)) (PreH10 : (sizeof(UINT64) = 8)) (PreH11 : (sizeof(UINT64) = 8)) (PreH12 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH13 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (1 <> 0) ”
.

Definition test_rvv_partial_solve_wit_3_aux := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_width = 1)) (PreH2 : (xt_valid F W G )) (PreH3 : (input = (xt_input (G)))) (PreH4 : (output = (xt_output_base (G)))) (PreH5 : (input_stride = (xt_input_stride (G)))) (PreH6 : (output_stride = (xt_output_stride (G)))) (PreH7 : (block_width = (xt_width (G)))) (PreH8 : (block_height = (xt_height (G)))) (PreH9 : (sizeof(UINT) = 4)) (PreH10 : (sizeof(UINT64) = 8)) (PreH11 : (sizeof(UINT64) = 8)) (PreH12 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH13 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  (xt_data F )
  **  (xt_output W old )
|--
  “ (1 <> 0) ” 
  &&  “ (block_width = 1) ” 
  &&  “ (xt_valid F W G ) ” 
  &&  “ (input = (xt_input (G))) ” 
  &&  “ (output = (xt_output_base (G))) ” 
  &&  “ (input_stride = (xt_input_stride (G))) ” 
  &&  “ (output_stride = (xt_output_stride (G))) ” 
  &&  “ (block_width = (xt_width (G))) ” 
  &&  “ (block_height = (xt_height (G))) ” 
  &&  “ (sizeof(UINT) = 4) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64))) ” 
  &&  “ (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64))) ”
  &&  (xt_data F )
  **  (xt_output W old )
.

Definition test_rvv_partial_solve_wit_3 := test_rvv_partial_solve_wit_3_pure -> test_rvv_partial_solve_wit_3_aux.

Definition test_rvv_partial_solve_wit_4_pure := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (output_stride >= (unsigned_last_nbits ((block_height * sizeof(UINT) )) (64)))) (PreH2 : (block_width <> 1)) (PreH3 : (xt_valid F W G )) (PreH4 : (input = (xt_input (G)))) (PreH5 : (output = (xt_output_base (G)))) (PreH6 : (input_stride = (xt_input_stride (G)))) (PreH7 : (output_stride = (xt_output_stride (G)))) (PreH8 : (block_width = (xt_width (G)))) (PreH9 : (block_height = (xt_height (G)))) (PreH10 : (sizeof(UINT) = 4)) (PreH11 : (sizeof(UINT64) = 8)) (PreH12 : (sizeof(UINT64) = 8)) (PreH13 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH14 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (1 <> 0) ”
.

Definition test_rvv_partial_solve_wit_4_aux := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (output_stride >= (unsigned_last_nbits ((block_height * sizeof(UINT) )) (64)))) (PreH2 : (block_width <> 1)) (PreH3 : (xt_valid F W G )) (PreH4 : (input = (xt_input (G)))) (PreH5 : (output = (xt_output_base (G)))) (PreH6 : (input_stride = (xt_input_stride (G)))) (PreH7 : (output_stride = (xt_output_stride (G)))) (PreH8 : (block_width = (xt_width (G)))) (PreH9 : (block_height = (xt_height (G)))) (PreH10 : (sizeof(UINT) = 4)) (PreH11 : (sizeof(UINT64) = 8)) (PreH12 : (sizeof(UINT64) = 8)) (PreH13 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH14 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  (xt_data F )
  **  (xt_output W old )
|--
  “ (1 <> 0) ” 
  &&  “ (output_stride >= (unsigned_last_nbits ((block_height * sizeof(UINT) )) (64))) ” 
  &&  “ (block_width <> 1) ” 
  &&  “ (xt_valid F W G ) ” 
  &&  “ (input = (xt_input (G))) ” 
  &&  “ (output = (xt_output_base (G))) ” 
  &&  “ (input_stride = (xt_input_stride (G))) ” 
  &&  “ (output_stride = (xt_output_stride (G))) ” 
  &&  “ (block_width = (xt_width (G))) ” 
  &&  “ (block_height = (xt_height (G))) ” 
  &&  “ (sizeof(UINT) = 4) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64))) ” 
  &&  “ (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64))) ”
  &&  (xt_data F )
  **  (xt_output W old )
.

Definition test_rvv_partial_solve_wit_4 := test_rvv_partial_solve_wit_4_pure -> test_rvv_partial_solve_wit_4_aux.

Definition test_rvv_partial_solve_wit_5_pure := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_width = 1)) (PreH2 : (xt_valid F W G )) (PreH3 : (input = (xt_input (G)))) (PreH4 : (output = (xt_output_base (G)))) (PreH5 : (input_stride = (xt_input_stride (G)))) (PreH6 : (output_stride = (xt_output_stride (G)))) (PreH7 : (block_width = (xt_width (G)))) (PreH8 : (block_height = (xt_height (G)))) (PreH9 : (sizeof(UINT) = 4)) (PreH10 : (sizeof(UINT64) = 8)) (PreH11 : (sizeof(UINT64) = 8)) (PreH12 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH13 : (block_height = 1)) ,
  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (1 <> 0) ”
.

Definition test_rvv_partial_solve_wit_5_aux := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_width = 1)) (PreH2 : (xt_valid F W G )) (PreH3 : (input = (xt_input (G)))) (PreH4 : (output = (xt_output_base (G)))) (PreH5 : (input_stride = (xt_input_stride (G)))) (PreH6 : (output_stride = (xt_output_stride (G)))) (PreH7 : (block_width = (xt_width (G)))) (PreH8 : (block_height = (xt_height (G)))) (PreH9 : (sizeof(UINT) = 4)) (PreH10 : (sizeof(UINT64) = 8)) (PreH11 : (sizeof(UINT64) = 8)) (PreH12 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH13 : (block_height = 1)) ,
  (xt_data F )
  **  (xt_output W old )
|--
  “ (1 <> 0) ” 
  &&  “ (block_width = 1) ” 
  &&  “ (xt_valid F W G ) ” 
  &&  “ (input = (xt_input (G))) ” 
  &&  “ (output = (xt_output_base (G))) ” 
  &&  “ (input_stride = (xt_input_stride (G))) ” 
  &&  “ (output_stride = (xt_output_stride (G))) ” 
  &&  “ (block_width = (xt_width (G))) ” 
  &&  “ (block_height = (xt_height (G))) ” 
  &&  “ (sizeof(UINT) = 4) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64))) ” 
  &&  “ (block_height = 1) ”
  &&  (xt_data F )
  **  (xt_output W old )
.

Definition test_rvv_partial_solve_wit_5 := test_rvv_partial_solve_wit_5_pure -> test_rvv_partial_solve_wit_5_aux.

Definition test_rvv_partial_solve_wit_6_pure := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (output_stride >= (block_height * sizeof(UINT) ))) (PreH2 : (block_width <> 1)) (PreH3 : (xt_valid F W G )) (PreH4 : (input = (xt_input (G)))) (PreH5 : (output = (xt_output_base (G)))) (PreH6 : (input_stride = (xt_input_stride (G)))) (PreH7 : (output_stride = (xt_output_stride (G)))) (PreH8 : (block_width = (xt_width (G)))) (PreH9 : (block_height = (xt_height (G)))) (PreH10 : (sizeof(UINT) = 4)) (PreH11 : (sizeof(UINT64) = 8)) (PreH12 : (sizeof(UINT64) = 8)) (PreH13 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH14 : (block_height = 1)) ,
  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (1 <> 0) ”
.

Definition test_rvv_partial_solve_wit_6_aux := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (output_stride >= (block_height * sizeof(UINT) ))) (PreH2 : (block_width <> 1)) (PreH3 : (xt_valid F W G )) (PreH4 : (input = (xt_input (G)))) (PreH5 : (output = (xt_output_base (G)))) (PreH6 : (input_stride = (xt_input_stride (G)))) (PreH7 : (output_stride = (xt_output_stride (G)))) (PreH8 : (block_width = (xt_width (G)))) (PreH9 : (block_height = (xt_height (G)))) (PreH10 : (sizeof(UINT) = 4)) (PreH11 : (sizeof(UINT64) = 8)) (PreH12 : (sizeof(UINT64) = 8)) (PreH13 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH14 : (block_height = 1)) ,
  (xt_data F )
  **  (xt_output W old )
|--
  “ (1 <> 0) ” 
  &&  “ (output_stride >= (block_height * sizeof(UINT) )) ” 
  &&  “ (block_width <> 1) ” 
  &&  “ (xt_valid F W G ) ” 
  &&  “ (input = (xt_input (G))) ” 
  &&  “ (output = (xt_output_base (G))) ” 
  &&  “ (input_stride = (xt_input_stride (G))) ” 
  &&  “ (output_stride = (xt_output_stride (G))) ” 
  &&  “ (block_width = (xt_width (G))) ” 
  &&  “ (block_height = (xt_height (G))) ” 
  &&  “ (sizeof(UINT) = 4) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64))) ” 
  &&  “ (block_height = 1) ”
  &&  (xt_data F )
  **  (xt_output W old )
.

Definition test_rvv_partial_solve_wit_6 := test_rvv_partial_solve_wit_6_pure -> test_rvv_partial_solve_wit_6_aux.

Definition test_rvv_partial_solve_wit_7_pure := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height = 1)) (PreH2 : (block_width = 1)) (PreH3 : (xt_valid F W G )) (PreH4 : (input = (xt_input (G)))) (PreH5 : (output = (xt_output_base (G)))) (PreH6 : (input_stride = (xt_input_stride (G)))) (PreH7 : (output_stride = (xt_output_stride (G)))) (PreH8 : (block_width = (xt_width (G)))) (PreH9 : (block_height = (xt_height (G)))) (PreH10 : (sizeof(UINT) = 4)) (PreH11 : (sizeof(UINT64) = 8)) (PreH12 : (sizeof(UINT64) = 8)) (PreH13 : (block_width = 1)) (PreH14 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (1 <> 0) ”
.

Definition test_rvv_partial_solve_wit_7_aux := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height = 1)) (PreH2 : (block_width = 1)) (PreH3 : (xt_valid F W G )) (PreH4 : (input = (xt_input (G)))) (PreH5 : (output = (xt_output_base (G)))) (PreH6 : (input_stride = (xt_input_stride (G)))) (PreH7 : (output_stride = (xt_output_stride (G)))) (PreH8 : (block_width = (xt_width (G)))) (PreH9 : (block_height = (xt_height (G)))) (PreH10 : (sizeof(UINT) = 4)) (PreH11 : (sizeof(UINT64) = 8)) (PreH12 : (sizeof(UINT64) = 8)) (PreH13 : (block_width = 1)) (PreH14 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  (xt_data F )
  **  (xt_output W old )
|--
  “ (1 <> 0) ” 
  &&  “ (block_height = 1) ” 
  &&  “ (block_width = 1) ” 
  &&  “ (xt_valid F W G ) ” 
  &&  “ (input = (xt_input (G))) ” 
  &&  “ (output = (xt_output_base (G))) ” 
  &&  “ (input_stride = (xt_input_stride (G))) ” 
  &&  “ (output_stride = (xt_output_stride (G))) ” 
  &&  “ (block_width = (xt_width (G))) ” 
  &&  “ (block_height = (xt_height (G))) ” 
  &&  “ (sizeof(UINT) = 4) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (block_width = 1) ” 
  &&  “ (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64))) ”
  &&  (xt_data F )
  **  (xt_output W old )
.

Definition test_rvv_partial_solve_wit_7 := test_rvv_partial_solve_wit_7_pure -> test_rvv_partial_solve_wit_7_aux.

Definition test_rvv_partial_solve_wit_8_pure := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (input_stride >= (block_width * sizeof(UINT) ))) (PreH2 : (block_height <> 1)) (PreH3 : (block_width = 1)) (PreH4 : (xt_valid F W G )) (PreH5 : (input = (xt_input (G)))) (PreH6 : (output = (xt_output_base (G)))) (PreH7 : (input_stride = (xt_input_stride (G)))) (PreH8 : (output_stride = (xt_output_stride (G)))) (PreH9 : (block_width = (xt_width (G)))) (PreH10 : (block_height = (xt_height (G)))) (PreH11 : (sizeof(UINT) = 4)) (PreH12 : (sizeof(UINT64) = 8)) (PreH13 : (sizeof(UINT64) = 8)) (PreH14 : (block_width = 1)) (PreH15 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (1 <> 0) ”
.

Definition test_rvv_partial_solve_wit_8_aux := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (input_stride >= (block_width * sizeof(UINT) ))) (PreH2 : (block_height <> 1)) (PreH3 : (block_width = 1)) (PreH4 : (xt_valid F W G )) (PreH5 : (input = (xt_input (G)))) (PreH6 : (output = (xt_output_base (G)))) (PreH7 : (input_stride = (xt_input_stride (G)))) (PreH8 : (output_stride = (xt_output_stride (G)))) (PreH9 : (block_width = (xt_width (G)))) (PreH10 : (block_height = (xt_height (G)))) (PreH11 : (sizeof(UINT) = 4)) (PreH12 : (sizeof(UINT64) = 8)) (PreH13 : (sizeof(UINT64) = 8)) (PreH14 : (block_width = 1)) (PreH15 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  (xt_data F )
  **  (xt_output W old )
|--
  “ (1 <> 0) ” 
  &&  “ (input_stride >= (block_width * sizeof(UINT) )) ” 
  &&  “ (block_height <> 1) ” 
  &&  “ (block_width = 1) ” 
  &&  “ (xt_valid F W G ) ” 
  &&  “ (input = (xt_input (G))) ” 
  &&  “ (output = (xt_output_base (G))) ” 
  &&  “ (input_stride = (xt_input_stride (G))) ” 
  &&  “ (output_stride = (xt_output_stride (G))) ” 
  &&  “ (block_width = (xt_width (G))) ” 
  &&  “ (block_height = (xt_height (G))) ” 
  &&  “ (sizeof(UINT) = 4) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (block_width = 1) ” 
  &&  “ (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64))) ”
  &&  (xt_data F )
  **  (xt_output W old )
.

Definition test_rvv_partial_solve_wit_8 := test_rvv_partial_solve_wit_8_pure -> test_rvv_partial_solve_wit_8_aux.

Definition test_rvv_partial_solve_wit_9_pure := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height = 1)) (PreH2 : (block_width = 1)) (PreH3 : (xt_valid F W G )) (PreH4 : (input = (xt_input (G)))) (PreH5 : (output = (xt_output_base (G)))) (PreH6 : (input_stride = (xt_input_stride (G)))) (PreH7 : (output_stride = (xt_output_stride (G)))) (PreH8 : (block_width = (xt_width (G)))) (PreH9 : (block_height = (xt_height (G)))) (PreH10 : (sizeof(UINT) = 4)) (PreH11 : (sizeof(UINT64) = 8)) (PreH12 : (sizeof(UINT64) = 8)) (PreH13 : (block_width = 1)) (PreH14 : (block_height = 1)) ,
  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (1 <> 0) ”
.

Definition test_rvv_partial_solve_wit_9_aux := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height = 1)) (PreH2 : (block_width = 1)) (PreH3 : (xt_valid F W G )) (PreH4 : (input = (xt_input (G)))) (PreH5 : (output = (xt_output_base (G)))) (PreH6 : (input_stride = (xt_input_stride (G)))) (PreH7 : (output_stride = (xt_output_stride (G)))) (PreH8 : (block_width = (xt_width (G)))) (PreH9 : (block_height = (xt_height (G)))) (PreH10 : (sizeof(UINT) = 4)) (PreH11 : (sizeof(UINT64) = 8)) (PreH12 : (sizeof(UINT64) = 8)) (PreH13 : (block_width = 1)) (PreH14 : (block_height = 1)) ,
  (xt_data F )
  **  (xt_output W old )
|--
  “ (1 <> 0) ” 
  &&  “ (block_height = 1) ” 
  &&  “ (block_width = 1) ” 
  &&  “ (xt_valid F W G ) ” 
  &&  “ (input = (xt_input (G))) ” 
  &&  “ (output = (xt_output_base (G))) ” 
  &&  “ (input_stride = (xt_input_stride (G))) ” 
  &&  “ (output_stride = (xt_output_stride (G))) ” 
  &&  “ (block_width = (xt_width (G))) ” 
  &&  “ (block_height = (xt_height (G))) ” 
  &&  “ (sizeof(UINT) = 4) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (block_width = 1) ” 
  &&  “ (block_height = 1) ”
  &&  (xt_data F )
  **  (xt_output W old )
.

Definition test_rvv_partial_solve_wit_9 := test_rvv_partial_solve_wit_9_pure -> test_rvv_partial_solve_wit_9_aux.

Definition test_rvv_partial_solve_wit_10_pure := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height = 1)) (PreH2 : (block_width = 1)) (PreH3 : (xt_valid F W G )) (PreH4 : (input = (xt_input (G)))) (PreH5 : (output = (xt_output_base (G)))) (PreH6 : (input_stride = (xt_input_stride (G)))) (PreH7 : (output_stride = (xt_output_stride (G)))) (PreH8 : (block_width = (xt_width (G)))) (PreH9 : (block_height = (xt_height (G)))) (PreH10 : (sizeof(UINT) = 4)) (PreH11 : (sizeof(UINT64) = 8)) (PreH12 : (sizeof(UINT64) = 8)) (PreH13 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH14 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (1 <> 0) ”
.

Definition test_rvv_partial_solve_wit_10_aux := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height = 1)) (PreH2 : (block_width = 1)) (PreH3 : (xt_valid F W G )) (PreH4 : (input = (xt_input (G)))) (PreH5 : (output = (xt_output_base (G)))) (PreH6 : (input_stride = (xt_input_stride (G)))) (PreH7 : (output_stride = (xt_output_stride (G)))) (PreH8 : (block_width = (xt_width (G)))) (PreH9 : (block_height = (xt_height (G)))) (PreH10 : (sizeof(UINT) = 4)) (PreH11 : (sizeof(UINT64) = 8)) (PreH12 : (sizeof(UINT64) = 8)) (PreH13 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH14 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  (xt_data F )
  **  (xt_output W old )
|--
  “ (1 <> 0) ” 
  &&  “ (block_height = 1) ” 
  &&  “ (block_width = 1) ” 
  &&  “ (xt_valid F W G ) ” 
  &&  “ (input = (xt_input (G))) ” 
  &&  “ (output = (xt_output_base (G))) ” 
  &&  “ (input_stride = (xt_input_stride (G))) ” 
  &&  “ (output_stride = (xt_output_stride (G))) ” 
  &&  “ (block_width = (xt_width (G))) ” 
  &&  “ (block_height = (xt_height (G))) ” 
  &&  “ (sizeof(UINT) = 4) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64))) ” 
  &&  “ (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64))) ”
  &&  (xt_data F )
  **  (xt_output W old )
.

Definition test_rvv_partial_solve_wit_10 := test_rvv_partial_solve_wit_10_pure -> test_rvv_partial_solve_wit_10_aux.

Definition test_rvv_partial_solve_wit_11_pure := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (input_stride >= (block_width * sizeof(UINT) ))) (PreH2 : (block_height <> 1)) (PreH3 : (block_width = 1)) (PreH4 : (xt_valid F W G )) (PreH5 : (input = (xt_input (G)))) (PreH6 : (output = (xt_output_base (G)))) (PreH7 : (input_stride = (xt_input_stride (G)))) (PreH8 : (output_stride = (xt_output_stride (G)))) (PreH9 : (block_width = (xt_width (G)))) (PreH10 : (block_height = (xt_height (G)))) (PreH11 : (sizeof(UINT) = 4)) (PreH12 : (sizeof(UINT64) = 8)) (PreH13 : (sizeof(UINT64) = 8)) (PreH14 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH15 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (1 <> 0) ”
.

Definition test_rvv_partial_solve_wit_11_aux := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (input_stride >= (block_width * sizeof(UINT) ))) (PreH2 : (block_height <> 1)) (PreH3 : (block_width = 1)) (PreH4 : (xt_valid F W G )) (PreH5 : (input = (xt_input (G)))) (PreH6 : (output = (xt_output_base (G)))) (PreH7 : (input_stride = (xt_input_stride (G)))) (PreH8 : (output_stride = (xt_output_stride (G)))) (PreH9 : (block_width = (xt_width (G)))) (PreH10 : (block_height = (xt_height (G)))) (PreH11 : (sizeof(UINT) = 4)) (PreH12 : (sizeof(UINT64) = 8)) (PreH13 : (sizeof(UINT64) = 8)) (PreH14 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH15 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  (xt_data F )
  **  (xt_output W old )
|--
  “ (1 <> 0) ” 
  &&  “ (input_stride >= (block_width * sizeof(UINT) )) ” 
  &&  “ (block_height <> 1) ” 
  &&  “ (block_width = 1) ” 
  &&  “ (xt_valid F W G ) ” 
  &&  “ (input = (xt_input (G))) ” 
  &&  “ (output = (xt_output_base (G))) ” 
  &&  “ (input_stride = (xt_input_stride (G))) ” 
  &&  “ (output_stride = (xt_output_stride (G))) ” 
  &&  “ (block_width = (xt_width (G))) ” 
  &&  “ (block_height = (xt_height (G))) ” 
  &&  “ (sizeof(UINT) = 4) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64))) ” 
  &&  “ (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64))) ”
  &&  (xt_data F )
  **  (xt_output W old )
.

Definition test_rvv_partial_solve_wit_11 := test_rvv_partial_solve_wit_11_pure -> test_rvv_partial_solve_wit_11_aux.

Definition test_rvv_partial_solve_wit_12_pure := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height = 1)) (PreH2 : (output_stride >= (unsigned_last_nbits ((block_height * sizeof(UINT) )) (64)))) (PreH3 : (block_width <> 1)) (PreH4 : (xt_valid F W G )) (PreH5 : (input = (xt_input (G)))) (PreH6 : (output = (xt_output_base (G)))) (PreH7 : (input_stride = (xt_input_stride (G)))) (PreH8 : (output_stride = (xt_output_stride (G)))) (PreH9 : (block_width = (xt_width (G)))) (PreH10 : (block_height = (xt_height (G)))) (PreH11 : (sizeof(UINT) = 4)) (PreH12 : (sizeof(UINT64) = 8)) (PreH13 : (sizeof(UINT64) = 8)) (PreH14 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH15 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (1 <> 0) ”
.

Definition test_rvv_partial_solve_wit_12_aux := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height = 1)) (PreH2 : (output_stride >= (unsigned_last_nbits ((block_height * sizeof(UINT) )) (64)))) (PreH3 : (block_width <> 1)) (PreH4 : (xt_valid F W G )) (PreH5 : (input = (xt_input (G)))) (PreH6 : (output = (xt_output_base (G)))) (PreH7 : (input_stride = (xt_input_stride (G)))) (PreH8 : (output_stride = (xt_output_stride (G)))) (PreH9 : (block_width = (xt_width (G)))) (PreH10 : (block_height = (xt_height (G)))) (PreH11 : (sizeof(UINT) = 4)) (PreH12 : (sizeof(UINT64) = 8)) (PreH13 : (sizeof(UINT64) = 8)) (PreH14 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH15 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  (xt_data F )
  **  (xt_output W old )
|--
  “ (1 <> 0) ” 
  &&  “ (block_height = 1) ” 
  &&  “ (output_stride >= (unsigned_last_nbits ((block_height * sizeof(UINT) )) (64))) ” 
  &&  “ (block_width <> 1) ” 
  &&  “ (xt_valid F W G ) ” 
  &&  “ (input = (xt_input (G))) ” 
  &&  “ (output = (xt_output_base (G))) ” 
  &&  “ (input_stride = (xt_input_stride (G))) ” 
  &&  “ (output_stride = (xt_output_stride (G))) ” 
  &&  “ (block_width = (xt_width (G))) ” 
  &&  “ (block_height = (xt_height (G))) ” 
  &&  “ (sizeof(UINT) = 4) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64))) ” 
  &&  “ (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64))) ”
  &&  (xt_data F )
  **  (xt_output W old )
.

Definition test_rvv_partial_solve_wit_12 := test_rvv_partial_solve_wit_12_pure -> test_rvv_partial_solve_wit_12_aux.

Definition test_rvv_partial_solve_wit_13_pure := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (input_stride >= (unsigned_last_nbits ((block_width * sizeof(UINT) )) (64)))) (PreH2 : (block_height <> 1)) (PreH3 : (output_stride >= (unsigned_last_nbits ((block_height * sizeof(UINT) )) (64)))) (PreH4 : (block_width <> 1)) (PreH5 : (xt_valid F W G )) (PreH6 : (input = (xt_input (G)))) (PreH7 : (output = (xt_output_base (G)))) (PreH8 : (input_stride = (xt_input_stride (G)))) (PreH9 : (output_stride = (xt_output_stride (G)))) (PreH10 : (block_width = (xt_width (G)))) (PreH11 : (block_height = (xt_height (G)))) (PreH12 : (sizeof(UINT) = 4)) (PreH13 : (sizeof(UINT64) = 8)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH16 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (1 <> 0) ”
.

Definition test_rvv_partial_solve_wit_13_aux := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (input_stride >= (unsigned_last_nbits ((block_width * sizeof(UINT) )) (64)))) (PreH2 : (block_height <> 1)) (PreH3 : (output_stride >= (unsigned_last_nbits ((block_height * sizeof(UINT) )) (64)))) (PreH4 : (block_width <> 1)) (PreH5 : (xt_valid F W G )) (PreH6 : (input = (xt_input (G)))) (PreH7 : (output = (xt_output_base (G)))) (PreH8 : (input_stride = (xt_input_stride (G)))) (PreH9 : (output_stride = (xt_output_stride (G)))) (PreH10 : (block_width = (xt_width (G)))) (PreH11 : (block_height = (xt_height (G)))) (PreH12 : (sizeof(UINT) = 4)) (PreH13 : (sizeof(UINT64) = 8)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH16 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  (xt_data F )
  **  (xt_output W old )
|--
  “ (1 <> 0) ” 
  &&  “ (input_stride >= (unsigned_last_nbits ((block_width * sizeof(UINT) )) (64))) ” 
  &&  “ (block_height <> 1) ” 
  &&  “ (output_stride >= (unsigned_last_nbits ((block_height * sizeof(UINT) )) (64))) ” 
  &&  “ (block_width <> 1) ” 
  &&  “ (xt_valid F W G ) ” 
  &&  “ (input = (xt_input (G))) ” 
  &&  “ (output = (xt_output_base (G))) ” 
  &&  “ (input_stride = (xt_input_stride (G))) ” 
  &&  “ (output_stride = (xt_output_stride (G))) ” 
  &&  “ (block_width = (xt_width (G))) ” 
  &&  “ (block_height = (xt_height (G))) ” 
  &&  “ (sizeof(UINT) = 4) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64))) ” 
  &&  “ (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64))) ”
  &&  (xt_data F )
  **  (xt_output W old )
.

Definition test_rvv_partial_solve_wit_13 := test_rvv_partial_solve_wit_13_pure -> test_rvv_partial_solve_wit_13_aux.

Definition test_rvv_partial_solve_wit_14_pure := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height = 1)) (PreH2 : (block_width = 1)) (PreH3 : (xt_valid F W G )) (PreH4 : (input = (xt_input (G)))) (PreH5 : (output = (xt_output_base (G)))) (PreH6 : (input_stride = (xt_input_stride (G)))) (PreH7 : (output_stride = (xt_output_stride (G)))) (PreH8 : (block_width = (xt_width (G)))) (PreH9 : (block_height = (xt_height (G)))) (PreH10 : (sizeof(UINT) = 4)) (PreH11 : (sizeof(UINT64) = 8)) (PreH12 : (sizeof(UINT64) = 8)) (PreH13 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH14 : (block_height = 1)) ,
  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (1 <> 0) ”
.

Definition test_rvv_partial_solve_wit_14_aux := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height = 1)) (PreH2 : (block_width = 1)) (PreH3 : (xt_valid F W G )) (PreH4 : (input = (xt_input (G)))) (PreH5 : (output = (xt_output_base (G)))) (PreH6 : (input_stride = (xt_input_stride (G)))) (PreH7 : (output_stride = (xt_output_stride (G)))) (PreH8 : (block_width = (xt_width (G)))) (PreH9 : (block_height = (xt_height (G)))) (PreH10 : (sizeof(UINT) = 4)) (PreH11 : (sizeof(UINT64) = 8)) (PreH12 : (sizeof(UINT64) = 8)) (PreH13 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH14 : (block_height = 1)) ,
  (xt_data F )
  **  (xt_output W old )
|--
  “ (1 <> 0) ” 
  &&  “ (block_height = 1) ” 
  &&  “ (block_width = 1) ” 
  &&  “ (xt_valid F W G ) ” 
  &&  “ (input = (xt_input (G))) ” 
  &&  “ (output = (xt_output_base (G))) ” 
  &&  “ (input_stride = (xt_input_stride (G))) ” 
  &&  “ (output_stride = (xt_output_stride (G))) ” 
  &&  “ (block_width = (xt_width (G))) ” 
  &&  “ (block_height = (xt_height (G))) ” 
  &&  “ (sizeof(UINT) = 4) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64))) ” 
  &&  “ (block_height = 1) ”
  &&  (xt_data F )
  **  (xt_output W old )
.

Definition test_rvv_partial_solve_wit_14 := test_rvv_partial_solve_wit_14_pure -> test_rvv_partial_solve_wit_14_aux.

Definition test_rvv_partial_solve_wit_15_pure := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height = 1)) (PreH2 : (output_stride >= (block_height * sizeof(UINT) ))) (PreH3 : (block_width <> 1)) (PreH4 : (xt_valid F W G )) (PreH5 : (input = (xt_input (G)))) (PreH6 : (output = (xt_output_base (G)))) (PreH7 : (input_stride = (xt_input_stride (G)))) (PreH8 : (output_stride = (xt_output_stride (G)))) (PreH9 : (block_width = (xt_width (G)))) (PreH10 : (block_height = (xt_height (G)))) (PreH11 : (sizeof(UINT) = 4)) (PreH12 : (sizeof(UINT64) = 8)) (PreH13 : (sizeof(UINT64) = 8)) (PreH14 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH15 : (block_height = 1)) ,
  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (1 <> 0) ”
.

Definition test_rvv_partial_solve_wit_15_aux := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height = 1)) (PreH2 : (output_stride >= (block_height * sizeof(UINT) ))) (PreH3 : (block_width <> 1)) (PreH4 : (xt_valid F W G )) (PreH5 : (input = (xt_input (G)))) (PreH6 : (output = (xt_output_base (G)))) (PreH7 : (input_stride = (xt_input_stride (G)))) (PreH8 : (output_stride = (xt_output_stride (G)))) (PreH9 : (block_width = (xt_width (G)))) (PreH10 : (block_height = (xt_height (G)))) (PreH11 : (sizeof(UINT) = 4)) (PreH12 : (sizeof(UINT64) = 8)) (PreH13 : (sizeof(UINT64) = 8)) (PreH14 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH15 : (block_height = 1)) ,
  (xt_data F )
  **  (xt_output W old )
|--
  “ (1 <> 0) ” 
  &&  “ (block_height = 1) ” 
  &&  “ (output_stride >= (block_height * sizeof(UINT) )) ” 
  &&  “ (block_width <> 1) ” 
  &&  “ (xt_valid F W G ) ” 
  &&  “ (input = (xt_input (G))) ” 
  &&  “ (output = (xt_output_base (G))) ” 
  &&  “ (input_stride = (xt_input_stride (G))) ” 
  &&  “ (output_stride = (xt_output_stride (G))) ” 
  &&  “ (block_width = (xt_width (G))) ” 
  &&  “ (block_height = (xt_height (G))) ” 
  &&  “ (sizeof(UINT) = 4) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64))) ” 
  &&  “ (block_height = 1) ”
  &&  (xt_data F )
  **  (xt_output W old )
.

Definition test_rvv_partial_solve_wit_15 := test_rvv_partial_solve_wit_15_pure -> test_rvv_partial_solve_wit_15_aux.

Definition test_rvv_partial_solve_wit_16 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (R: XTOutput) (output: Z) (input: Z) (bw: Z) (block_height: Z) (block_width: Z) (output_stride: Z) (input_stride: Z) (PreH1 : (bw > 0)) (PreH2 : (xt_valid F W G )) (PreH3 : (input_stride = (xt_input_stride (G)))) (PreH4 : (output_stride = (xt_output_stride (G)))) (PreH5 : (block_width = (xt_width (G)))) (PreH6 : (block_height = (xt_height (G)))) (PreH7 : (sizeof(UINT) = 4)) (PreH8 : (sizeof(UINT64) = 8)) (PreH9 : (sizeof(UINT64) = 8)) (PreH10 : (0 <= bw)) (PreH11 : (bw <= (xt_total (G)))) (PreH12 : (input = (xt_current_input (G) (((xt_total (G)) - bw )) (0)))) (PreH13 : (output = (xt_current_output (G) (((xt_total (G)) - bw )) (0)))) (PreH14 : (xt_progress F G old R ((xt_total (G)) - bw ) 0 0 )) ,
  (xt_data F )
  **  (xt_output W R )
|--
  “ (bw > 0) ” 
  &&  “ (xt_valid F W G ) ” 
  &&  “ (input_stride = (xt_input_stride (G))) ” 
  &&  “ (output_stride = (xt_output_stride (G))) ” 
  &&  “ (block_width = (xt_width (G))) ” 
  &&  “ (block_height = (xt_height (G))) ” 
  &&  “ (sizeof(UINT) = 4) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (0 <= bw) ” 
  &&  “ (bw <= (xt_total (G))) ” 
  &&  “ (input = (xt_current_input (G) (((xt_total (G)) - bw )) (0))) ” 
  &&  “ (output = (xt_current_output (G) (((xt_total (G)) - bw )) (0))) ” 
  &&  “ (xt_progress F G old R ((xt_total (G)) - bw ) 0 0 ) ”
  &&  (xt_data F )
  **  (xt_output W R )
.

Definition test_rvv_partial_solve_wit_17_pure := 
(
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (R: XTOutput) (o: Z) (i: Z) (output: Z) (input: Z) (bh: Z) (vl: Z) (bw: Z) (block_height: Z) (block_width: Z) (output_stride: Z) (input_stride: Z) (PreH1 : (bh > 0)) (PreH2 : (xt_valid F W G )) (PreH3 : (input_stride = (xt_input_stride (G)))) (PreH4 : (output_stride = (xt_output_stride (G)))) (PreH5 : (block_width = (xt_width (G)))) (PreH6 : (block_height = (xt_height (G)))) (PreH7 : (sizeof(UINT) = 4)) (PreH8 : (sizeof(UINT64) = 8)) (PreH9 : (sizeof(UINT64) = 8)) (PreH10 : (0 < bw)) (PreH11 : (bw <= (xt_total (G)))) (PreH12 : (xt_legal_vl bw vl )) (PreH13 : (0 < vl)) (PreH14 : (vl <= 32)) (PreH15 : (vl <= bw)) (PreH16 : (0 <= bh)) (PreH17 : (bh <= block_height)) (PreH18 : (input = (xt_current_input (G) (((xt_total (G)) - bw )) (0)))) (PreH19 : (output = (xt_current_output (G) (((xt_total (G)) - bw )) (0)))) (PreH20 : (i = (xt_current_input (G) (((xt_total (G)) - bw )) ((block_height - bh ))))) (PreH21 : (o = (xt_current_output (G) (((xt_total (G)) - bw )) ((block_height - bh ))))) (PreH22 : (xt_progress F G old R ((xt_total (G)) - bw ) vl (block_height - bh ) )) ,
  (UndefStructPredvuint32m8_t ( &( "v" ) ) )
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  ((( &( "bw" ) )) # UInt64  |-> bw)
  **  ((( &( "vl" ) )) # UInt64  |-> vl)
  **  ((( &( "bh" ) )) # UInt64  |-> bh)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "i" ) )) # Ptr  |-> i)
  **  ((( &( "o" ) )) # Ptr  |-> o)
  **  (xt_data F )
  **  (xt_output W R )
|--
  “ (0 <= vl) ” 
  &&  “ (vl <= 32) ” 
  &&  “ (xt_window F i vl ) ”
) \/
(
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (R: XTOutput) (o: Z) (i: Z) (output: Z) (input: Z) (bh: Z) (vl: Z) (bw: Z) (block_height: Z) (block_width: Z) (output_stride: Z) (input_stride: Z) (PreH1 : (bh <= UINT64_MAX)) (PreH2 : (vl <= UINT64_MAX)) (PreH3 : (bw <= UINT64_MAX)) (PreH4 : (block_height <= UINT64_MAX)) (PreH5 : (block_width <= UINT64_MAX)) (PreH6 : (output_stride <= UINT64_MAX)) (PreH7 : (input_stride <= UINT64_MAX)) (PreH8 : (bh >= 0)) (PreH9 : (vl >= 0)) (PreH10 : (bw >= 0)) (PreH11 : (block_height >= 0)) (PreH12 : (block_width >= 0)) (PreH13 : (output_stride >= 0)) (PreH14 : (input_stride >= 0)) (PreH15 : (bh > 0)) (PreH16 : (xt_valid F W G )) (PreH17 : (input_stride = (xt_input_stride (G)))) (PreH18 : (output_stride = (xt_output_stride (G)))) (PreH19 : (block_width = (xt_width (G)))) (PreH20 : (block_height = (xt_height (G)))) (PreH21 : (sizeof(UINT) = 4)) (PreH22 : (sizeof(UINT64) = 8)) (PreH23 : (sizeof(UINT64) = 8)) (PreH24 : (0 < bw)) (PreH25 : (bw <= (xt_total (G)))) (PreH26 : (xt_legal_vl bw vl )) (PreH27 : (0 < vl)) (PreH28 : (vl <= 32)) (PreH29 : (vl <= bw)) (PreH30 : (0 <= bh)) (PreH31 : (bh <= block_height)) (PreH32 : (input = (xt_current_input (G) (((xt_total (G)) - bw )) (0)))) (PreH33 : (output = (xt_current_output (G) (((xt_total (G)) - bw )) (0)))) (PreH34 : (i = (xt_current_input (G) (((xt_total (G)) - bw )) ((block_height - bh ))))) (PreH35 : (o = (xt_current_output (G) (((xt_total (G)) - bw )) ((block_height - bh ))))) (PreH36 : (xt_progress F G old R ((xt_total (G)) - bw ) vl (block_height - bh ) )) ,
  (UndefStructPredvuint32m8_t ( &( "v" ) ) )
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  ((( &( "bw" ) )) # UInt64  |-> bw)
  **  ((( &( "vl" ) )) # UInt64  |-> vl)
  **  ((( &( "bh" ) )) # UInt64  |-> bh)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "i" ) )) # Ptr  |-> i)
  **  ((( &( "o" ) )) # Ptr  |-> o)
  **  (xt_data F )
  **  (xt_output W R )
|--
  “ (xt_window F i vl ) ”
).

Definition test_rvv_partial_solve_wit_17_pure_split_goal_1 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (R: XTOutput) (o: Z) (i: Z) (output: Z) (input: Z) (bh: Z) (vl: Z) (bw: Z) (block_height: Z) (block_width: Z) (output_stride: Z) (input_stride: Z) (PreH1 : (bh <= UINT64_MAX)) (PreH2 : (vl <= UINT64_MAX)) (PreH3 : (bw <= UINT64_MAX)) (PreH4 : (block_height <= UINT64_MAX)) (PreH5 : (block_width <= UINT64_MAX)) (PreH6 : (output_stride <= UINT64_MAX)) (PreH7 : (input_stride <= UINT64_MAX)) (PreH8 : (bh >= 0)) (PreH9 : (vl >= 0)) (PreH10 : (bw >= 0)) (PreH11 : (block_height >= 0)) (PreH12 : (block_width >= 0)) (PreH13 : (output_stride >= 0)) (PreH14 : (input_stride >= 0)) (PreH15 : (bh > 0)) (PreH16 : (xt_valid F W G )) (PreH17 : (input_stride = (xt_input_stride (G)))) (PreH18 : (output_stride = (xt_output_stride (G)))) (PreH19 : (block_width = (xt_width (G)))) (PreH20 : (block_height = (xt_height (G)))) (PreH21 : (sizeof(UINT) = 4)) (PreH22 : (sizeof(UINT64) = 8)) (PreH23 : (sizeof(UINT64) = 8)) (PreH24 : (0 < bw)) (PreH25 : (bw <= (xt_total (G)))) (PreH26 : (xt_legal_vl bw vl )) (PreH27 : (0 < vl)) (PreH28 : (vl <= 32)) (PreH29 : (vl <= bw)) (PreH30 : (0 <= bh)) (PreH31 : (bh <= block_height)) (PreH32 : (input = (xt_current_input (G) (((xt_total (G)) - bw )) (0)))) (PreH33 : (output = (xt_current_output (G) (((xt_total (G)) - bw )) (0)))) (PreH34 : (i = (xt_current_input (G) (((xt_total (G)) - bw )) ((block_height - bh ))))) (PreH35 : (o = (xt_current_output (G) (((xt_total (G)) - bw )) ((block_height - bh ))))) (PreH36 : (xt_progress F G old R ((xt_total (G)) - bw ) vl (block_height - bh ) )) ,
  (UndefStructPredvuint32m8_t ( &( "v" ) ) )
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  ((( &( "bw" ) )) # UInt64  |-> bw)
  **  ((( &( "vl" ) )) # UInt64  |-> vl)
  **  ((( &( "bh" ) )) # UInt64  |-> bh)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "i" ) )) # Ptr  |-> i)
  **  ((( &( "o" ) )) # Ptr  |-> o)
  **  (xt_data F )
  **  (xt_output W R )
|--
  “ (xt_window F i vl ) ”
.

Definition test_rvv_partial_solve_wit_17_aux := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (R: XTOutput) (o: Z) (i: Z) (output: Z) (input: Z) (bh: Z) (vl: Z) (bw: Z) (block_height: Z) (block_width: Z) (output_stride: Z) (input_stride: Z) (PreH1 : (bh > 0)) (PreH2 : (xt_valid F W G )) (PreH3 : (input_stride = (xt_input_stride (G)))) (PreH4 : (output_stride = (xt_output_stride (G)))) (PreH5 : (block_width = (xt_width (G)))) (PreH6 : (block_height = (xt_height (G)))) (PreH7 : (sizeof(UINT) = 4)) (PreH8 : (sizeof(UINT64) = 8)) (PreH9 : (sizeof(UINT64) = 8)) (PreH10 : (0 < bw)) (PreH11 : (bw <= (xt_total (G)))) (PreH12 : (xt_legal_vl bw vl )) (PreH13 : (0 < vl)) (PreH14 : (vl <= 32)) (PreH15 : (vl <= bw)) (PreH16 : (0 <= bh)) (PreH17 : (bh <= block_height)) (PreH18 : (input = (xt_current_input (G) (((xt_total (G)) - bw )) (0)))) (PreH19 : (output = (xt_current_output (G) (((xt_total (G)) - bw )) (0)))) (PreH20 : (i = (xt_current_input (G) (((xt_total (G)) - bw )) ((block_height - bh ))))) (PreH21 : (o = (xt_current_output (G) (((xt_total (G)) - bw )) ((block_height - bh ))))) (PreH22 : (xt_progress F G old R ((xt_total (G)) - bw ) vl (block_height - bh ) )) ,
  (UndefStructPredvuint32m8_t ( &( "v" ) ) )
  **  (xt_data F )
  **  (xt_output W R )
|--
  “ (0 <= vl) ” 
  &&  “ (vl <= 32) ” 
  &&  “ (xt_window F i vl ) ” 
  &&  “ (bh > 0) ” 
  &&  “ (xt_valid F W G ) ” 
  &&  “ (input_stride = (xt_input_stride (G))) ” 
  &&  “ (output_stride = (xt_output_stride (G))) ” 
  &&  “ (block_width = (xt_width (G))) ” 
  &&  “ (block_height = (xt_height (G))) ” 
  &&  “ (sizeof(UINT) = 4) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (0 < bw) ” 
  &&  “ (bw <= (xt_total (G))) ” 
  &&  “ (xt_legal_vl bw vl ) ” 
  &&  “ (0 < vl) ” 
  &&  “ (vl <= 32) ” 
  &&  “ (vl <= bw) ” 
  &&  “ (0 <= bh) ” 
  &&  “ (bh <= block_height) ” 
  &&  “ (input = (xt_current_input (G) (((xt_total (G)) - bw )) (0))) ” 
  &&  “ (output = (xt_current_output (G) (((xt_total (G)) - bw )) (0))) ” 
  &&  “ (i = (xt_current_input (G) (((xt_total (G)) - bw )) ((block_height - bh )))) ” 
  &&  “ (o = (xt_current_output (G) (((xt_total (G)) - bw )) ((block_height - bh )))) ” 
  &&  “ (xt_progress F G old R ((xt_total (G)) - bw ) vl (block_height - bh ) ) ”
  &&  (xt_data F )
  **  (UndefStructPredvuint32m8_t ( &( "v" ) ) )
  **  (xt_output W R )
.

Definition test_rvv_partial_solve_wit_17 := test_rvv_partial_solve_wit_17_pure -> test_rvv_partial_solve_wit_17_aux.

Definition test_rvv_partial_solve_wit_18 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (R: XTOutput) (o: Z) (i: Z) (output: Z) (input: Z) (bh: Z) (vl: Z) (bw: Z) (block_height: Z) (block_width: Z) (output_stride: Z) (input_stride: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (retval: Z) (PreH1 : (xt_rvv_lane F i vl 0 x0 )) (PreH2 : (xt_rvv_lane F i vl 1 x1 )) (PreH3 : (xt_rvv_lane F i vl 2 x2 )) (PreH4 : (xt_rvv_lane F i vl 3 x3 )) (PreH5 : (xt_rvv_lane F i vl 4 x4 )) (PreH6 : (xt_rvv_lane F i vl 5 x5 )) (PreH7 : (xt_rvv_lane F i vl 6 x6 )) (PreH8 : (xt_rvv_lane F i vl 7 x7 )) (PreH9 : (xt_rvv_lane F i vl 8 x8 )) (PreH10 : (xt_rvv_lane F i vl 9 x9 )) (PreH11 : (xt_rvv_lane F i vl 10 x10 )) (PreH12 : (xt_rvv_lane F i vl 11 x11 )) (PreH13 : (xt_rvv_lane F i vl 12 x12 )) (PreH14 : (xt_rvv_lane F i vl 13 x13 )) (PreH15 : (xt_rvv_lane F i vl 14 x14 )) (PreH16 : (xt_rvv_lane F i vl 15 x15 )) (PreH17 : (xt_rvv_lane F i vl 16 x16 )) (PreH18 : (xt_rvv_lane F i vl 17 x17 )) (PreH19 : (xt_rvv_lane F i vl 18 x18 )) (PreH20 : (xt_rvv_lane F i vl 19 x19 )) (PreH21 : (xt_rvv_lane F i vl 20 x20 )) (PreH22 : (xt_rvv_lane F i vl 21 x21 )) (PreH23 : (xt_rvv_lane F i vl 22 x22 )) (PreH24 : (xt_rvv_lane F i vl 23 x23 )) (PreH25 : (xt_rvv_lane F i vl 24 x24 )) (PreH26 : (xt_rvv_lane F i vl 25 x25 )) (PreH27 : (xt_rvv_lane F i vl 26 x26 )) (PreH28 : (xt_rvv_lane F i vl 27 x27 )) (PreH29 : (xt_rvv_lane F i vl 28 x28 )) (PreH30 : (xt_rvv_lane F i vl 29 x29 )) (PreH31 : (xt_rvv_lane F i vl 30 x30 )) (PreH32 : (xt_rvv_lane F i vl 31 x31 )) (PreH33 : (bh > 0)) (PreH34 : (xt_valid F W G )) (PreH35 : (input_stride = (xt_input_stride (G)))) (PreH36 : (output_stride = (xt_output_stride (G)))) (PreH37 : (block_width = (xt_width (G)))) (PreH38 : (block_height = (xt_height (G)))) (PreH39 : (sizeof(UINT) = 4)) (PreH40 : (sizeof(UINT64) = 8)) (PreH41 : (sizeof(UINT64) = 8)) (PreH42 : (0 < bw)) (PreH43 : (bw <= (xt_total (G)))) (PreH44 : (xt_legal_vl bw vl )) (PreH45 : (0 < vl)) (PreH46 : (vl <= 32)) (PreH47 : (vl <= bw)) (PreH48 : (0 <= bh)) (PreH49 : (bh <= block_height)) (PreH50 : (input = (xt_current_input (G) (((xt_total (G)) - bw )) (0)))) (PreH51 : (output = (xt_current_output (G) (((xt_total (G)) - bw )) (0)))) (PreH52 : (i = (xt_current_input (G) (((xt_total (G)) - bw )) ((block_height - bh ))))) (PreH53 : (o = (xt_current_output (G) (((xt_total (G)) - bw )) ((block_height - bh ))))) (PreH54 : (xt_progress F G old R ((xt_total (G)) - bw ) vl (block_height - bh ) )) ,
  (xt_data F )
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s0")) # UInt  |-> x0)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s1")) # UInt  |-> x1)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s2")) # UInt  |-> x2)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s3")) # UInt  |-> x3)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s4")) # UInt  |-> x4)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s5")) # UInt  |-> x5)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s6")) # UInt  |-> x6)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s7")) # UInt  |-> x7)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s8")) # UInt  |-> x8)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s9")) # UInt  |-> x9)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s10")) # UInt  |-> x10)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s11")) # UInt  |-> x11)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s12")) # UInt  |-> x12)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s13")) # UInt  |-> x13)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s14")) # UInt  |-> x14)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s15")) # UInt  |-> x15)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s16")) # UInt  |-> x16)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s17")) # UInt  |-> x17)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s18")) # UInt  |-> x18)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s19")) # UInt  |-> x19)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s20")) # UInt  |-> x20)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s21")) # UInt  |-> x21)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s22")) # UInt  |-> x22)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s23")) # UInt  |-> x23)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s24")) # UInt  |-> x24)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s25")) # UInt  |-> x25)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s26")) # UInt  |-> x26)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s27")) # UInt  |-> x27)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s28")) # UInt  |-> x28)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s29")) # UInt  |-> x29)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s30")) # UInt  |-> x30)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s31")) # UInt  |-> x31)
  **  (UndefStructPredvuint32m8_t ( &( "v" ) ) )
  **  (xt_output W R )
|--
  “ (xt_rvv_lane F i vl 0 x0 ) ” 
  &&  “ (xt_rvv_lane F i vl 1 x1 ) ” 
  &&  “ (xt_rvv_lane F i vl 2 x2 ) ” 
  &&  “ (xt_rvv_lane F i vl 3 x3 ) ” 
  &&  “ (xt_rvv_lane F i vl 4 x4 ) ” 
  &&  “ (xt_rvv_lane F i vl 5 x5 ) ” 
  &&  “ (xt_rvv_lane F i vl 6 x6 ) ” 
  &&  “ (xt_rvv_lane F i vl 7 x7 ) ” 
  &&  “ (xt_rvv_lane F i vl 8 x8 ) ” 
  &&  “ (xt_rvv_lane F i vl 9 x9 ) ” 
  &&  “ (xt_rvv_lane F i vl 10 x10 ) ” 
  &&  “ (xt_rvv_lane F i vl 11 x11 ) ” 
  &&  “ (xt_rvv_lane F i vl 12 x12 ) ” 
  &&  “ (xt_rvv_lane F i vl 13 x13 ) ” 
  &&  “ (xt_rvv_lane F i vl 14 x14 ) ” 
  &&  “ (xt_rvv_lane F i vl 15 x15 ) ” 
  &&  “ (xt_rvv_lane F i vl 16 x16 ) ” 
  &&  “ (xt_rvv_lane F i vl 17 x17 ) ” 
  &&  “ (xt_rvv_lane F i vl 18 x18 ) ” 
  &&  “ (xt_rvv_lane F i vl 19 x19 ) ” 
  &&  “ (xt_rvv_lane F i vl 20 x20 ) ” 
  &&  “ (xt_rvv_lane F i vl 21 x21 ) ” 
  &&  “ (xt_rvv_lane F i vl 22 x22 ) ” 
  &&  “ (xt_rvv_lane F i vl 23 x23 ) ” 
  &&  “ (xt_rvv_lane F i vl 24 x24 ) ” 
  &&  “ (xt_rvv_lane F i vl 25 x25 ) ” 
  &&  “ (xt_rvv_lane F i vl 26 x26 ) ” 
  &&  “ (xt_rvv_lane F i vl 27 x27 ) ” 
  &&  “ (xt_rvv_lane F i vl 28 x28 ) ” 
  &&  “ (xt_rvv_lane F i vl 29 x29 ) ” 
  &&  “ (xt_rvv_lane F i vl 30 x30 ) ” 
  &&  “ (xt_rvv_lane F i vl 31 x31 ) ” 
  &&  “ (bh > 0) ” 
  &&  “ (xt_valid F W G ) ” 
  &&  “ (input_stride = (xt_input_stride (G))) ” 
  &&  “ (output_stride = (xt_output_stride (G))) ” 
  &&  “ (block_width = (xt_width (G))) ” 
  &&  “ (block_height = (xt_height (G))) ” 
  &&  “ (sizeof(UINT) = 4) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (0 < bw) ” 
  &&  “ (bw <= (xt_total (G))) ” 
  &&  “ (xt_legal_vl bw vl ) ” 
  &&  “ (0 < vl) ” 
  &&  “ (vl <= 32) ” 
  &&  “ (vl <= bw) ” 
  &&  “ (0 <= bh) ” 
  &&  “ (bh <= block_height) ” 
  &&  “ (input = (xt_current_input (G) (((xt_total (G)) - bw )) (0))) ” 
  &&  “ (output = (xt_current_output (G) (((xt_total (G)) - bw )) (0))) ” 
  &&  “ (i = (xt_current_input (G) (((xt_total (G)) - bw )) ((block_height - bh )))) ” 
  &&  “ (o = (xt_current_output (G) (((xt_total (G)) - bw )) ((block_height - bh )))) ” 
  &&  “ (xt_progress F G old R ((xt_total (G)) - bw ) vl (block_height - bh ) ) ”
  &&  ((&(( &( "v" ) )->ₛ "s31")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s31")) # UInt  |-> x31)
  **  ((&(( &( "v" ) )->ₛ "s30")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s30")) # UInt  |-> x30)
  **  ((&(( &( "v" ) )->ₛ "s29")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s29")) # UInt  |-> x29)
  **  ((&(( &( "v" ) )->ₛ "s28")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s28")) # UInt  |-> x28)
  **  ((&(( &( "v" ) )->ₛ "s27")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s27")) # UInt  |-> x27)
  **  ((&(( &( "v" ) )->ₛ "s26")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s26")) # UInt  |-> x26)
  **  ((&(( &( "v" ) )->ₛ "s25")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s25")) # UInt  |-> x25)
  **  ((&(( &( "v" ) )->ₛ "s24")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s24")) # UInt  |-> x24)
  **  ((&(( &( "v" ) )->ₛ "s23")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s23")) # UInt  |-> x23)
  **  ((&(( &( "v" ) )->ₛ "s22")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s22")) # UInt  |-> x22)
  **  ((&(( &( "v" ) )->ₛ "s21")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s21")) # UInt  |-> x21)
  **  ((&(( &( "v" ) )->ₛ "s20")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s20")) # UInt  |-> x20)
  **  ((&(( &( "v" ) )->ₛ "s19")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s19")) # UInt  |-> x19)
  **  ((&(( &( "v" ) )->ₛ "s18")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s18")) # UInt  |-> x18)
  **  ((&(( &( "v" ) )->ₛ "s17")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s17")) # UInt  |-> x17)
  **  ((&(( &( "v" ) )->ₛ "s16")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s16")) # UInt  |-> x16)
  **  ((&(( &( "v" ) )->ₛ "s15")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s15")) # UInt  |-> x15)
  **  ((&(( &( "v" ) )->ₛ "s14")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s14")) # UInt  |-> x14)
  **  ((&(( &( "v" ) )->ₛ "s13")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s13")) # UInt  |-> x13)
  **  ((&(( &( "v" ) )->ₛ "s12")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s12")) # UInt  |-> x12)
  **  ((&(( &( "v" ) )->ₛ "s11")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s11")) # UInt  |-> x11)
  **  ((&(( &( "v" ) )->ₛ "s10")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s10")) # UInt  |-> x10)
  **  ((&(( &( "v" ) )->ₛ "s9")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s9")) # UInt  |-> x9)
  **  ((&(( &( "v" ) )->ₛ "s8")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s8")) # UInt  |-> x8)
  **  ((&(( &( "v" ) )->ₛ "s7")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s7")) # UInt  |-> x7)
  **  ((&(( &( "v" ) )->ₛ "s6")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s6")) # UInt  |-> x6)
  **  ((&(( &( "v" ) )->ₛ "s5")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s5")) # UInt  |-> x5)
  **  ((&(( &( "v" ) )->ₛ "s4")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s4")) # UInt  |-> x4)
  **  ((&(( &( "v" ) )->ₛ "s3")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s3")) # UInt  |-> x3)
  **  ((&(( &( "v" ) )->ₛ "s2")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s2")) # UInt  |-> x2)
  **  ((&(( &( "v" ) )->ₛ "s1")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s1")) # UInt  |-> x1)
  **  ((&(( &( "v" ) )->ₛ "s0")) # UInt  |->_)
  **  ((&((retval)  # "vuint32m8_t" ->ₛ "s0")) # UInt  |-> x0)
  **  (xt_data F )
  **  (xt_output W R )
.

Definition test_rvv_partial_solve_wit_19_pure := 
(
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (R: XTOutput) (o: Z) (i: Z) (output: Z) (input: Z) (bh: Z) (vl: Z) (bw: Z) (block_height: Z) (block_width: Z) (output_stride: Z) (input_stride: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (xt_rvv_lane F i vl 0 x0 )) (PreH2 : (xt_rvv_lane F i vl 1 x1 )) (PreH3 : (xt_rvv_lane F i vl 2 x2 )) (PreH4 : (xt_rvv_lane F i vl 3 x3 )) (PreH5 : (xt_rvv_lane F i vl 4 x4 )) (PreH6 : (xt_rvv_lane F i vl 5 x5 )) (PreH7 : (xt_rvv_lane F i vl 6 x6 )) (PreH8 : (xt_rvv_lane F i vl 7 x7 )) (PreH9 : (xt_rvv_lane F i vl 8 x8 )) (PreH10 : (xt_rvv_lane F i vl 9 x9 )) (PreH11 : (xt_rvv_lane F i vl 10 x10 )) (PreH12 : (xt_rvv_lane F i vl 11 x11 )) (PreH13 : (xt_rvv_lane F i vl 12 x12 )) (PreH14 : (xt_rvv_lane F i vl 13 x13 )) (PreH15 : (xt_rvv_lane F i vl 14 x14 )) (PreH16 : (xt_rvv_lane F i vl 15 x15 )) (PreH17 : (xt_rvv_lane F i vl 16 x16 )) (PreH18 : (xt_rvv_lane F i vl 17 x17 )) (PreH19 : (xt_rvv_lane F i vl 18 x18 )) (PreH20 : (xt_rvv_lane F i vl 19 x19 )) (PreH21 : (xt_rvv_lane F i vl 20 x20 )) (PreH22 : (xt_rvv_lane F i vl 21 x21 )) (PreH23 : (xt_rvv_lane F i vl 22 x22 )) (PreH24 : (xt_rvv_lane F i vl 23 x23 )) (PreH25 : (xt_rvv_lane F i vl 24 x24 )) (PreH26 : (xt_rvv_lane F i vl 25 x25 )) (PreH27 : (xt_rvv_lane F i vl 26 x26 )) (PreH28 : (xt_rvv_lane F i vl 27 x27 )) (PreH29 : (xt_rvv_lane F i vl 28 x28 )) (PreH30 : (xt_rvv_lane F i vl 29 x29 )) (PreH31 : (xt_rvv_lane F i vl 30 x30 )) (PreH32 : (xt_rvv_lane F i vl 31 x31 )) (PreH33 : (bh > 0)) (PreH34 : (xt_valid F W G )) (PreH35 : (input_stride = (xt_input_stride (G)))) (PreH36 : (output_stride = (xt_output_stride (G)))) (PreH37 : (block_width = (xt_width (G)))) (PreH38 : (block_height = (xt_height (G)))) (PreH39 : (sizeof(UINT) = 4)) (PreH40 : (sizeof(UINT64) = 8)) (PreH41 : (sizeof(UINT64) = 8)) (PreH42 : (0 < bw)) (PreH43 : (bw <= (xt_total (G)))) (PreH44 : (xt_legal_vl bw vl )) (PreH45 : (0 < vl)) (PreH46 : (vl <= 32)) (PreH47 : (vl <= bw)) (PreH48 : (0 <= bh)) (PreH49 : (bh <= block_height)) (PreH50 : (input = (xt_current_input (G) (((xt_total (G)) - bw )) (0)))) (PreH51 : (output = (xt_current_output (G) (((xt_total (G)) - bw )) (0)))) (PreH52 : (i = (xt_current_input (G) (((xt_total (G)) - bw )) ((block_height - bh ))))) (PreH53 : (o = (xt_current_output (G) (((xt_total (G)) - bw )) ((block_height - bh ))))) (PreH54 : (xt_progress F G old R ((xt_total (G)) - bw ) vl (block_height - bh ) )) ,
  ((&(( &( "v" ) )->ₛ "s31")) # UInt  |-> x31)
  **  ((&(( &( "v" ) )->ₛ "s30")) # UInt  |-> x30)
  **  ((&(( &( "v" ) )->ₛ "s29")) # UInt  |-> x29)
  **  ((&(( &( "v" ) )->ₛ "s28")) # UInt  |-> x28)
  **  ((&(( &( "v" ) )->ₛ "s27")) # UInt  |-> x27)
  **  ((&(( &( "v" ) )->ₛ "s26")) # UInt  |-> x26)
  **  ((&(( &( "v" ) )->ₛ "s25")) # UInt  |-> x25)
  **  ((&(( &( "v" ) )->ₛ "s24")) # UInt  |-> x24)
  **  ((&(( &( "v" ) )->ₛ "s23")) # UInt  |-> x23)
  **  ((&(( &( "v" ) )->ₛ "s22")) # UInt  |-> x22)
  **  ((&(( &( "v" ) )->ₛ "s21")) # UInt  |-> x21)
  **  ((&(( &( "v" ) )->ₛ "s20")) # UInt  |-> x20)
  **  ((&(( &( "v" ) )->ₛ "s19")) # UInt  |-> x19)
  **  ((&(( &( "v" ) )->ₛ "s18")) # UInt  |-> x18)
  **  ((&(( &( "v" ) )->ₛ "s17")) # UInt  |-> x17)
  **  ((&(( &( "v" ) )->ₛ "s16")) # UInt  |-> x16)
  **  ((&(( &( "v" ) )->ₛ "s15")) # UInt  |-> x15)
  **  ((&(( &( "v" ) )->ₛ "s14")) # UInt  |-> x14)
  **  ((&(( &( "v" ) )->ₛ "s13")) # UInt  |-> x13)
  **  ((&(( &( "v" ) )->ₛ "s12")) # UInt  |-> x12)
  **  ((&(( &( "v" ) )->ₛ "s11")) # UInt  |-> x11)
  **  ((&(( &( "v" ) )->ₛ "s10")) # UInt  |-> x10)
  **  ((&(( &( "v" ) )->ₛ "s9")) # UInt  |-> x9)
  **  ((&(( &( "v" ) )->ₛ "s8")) # UInt  |-> x8)
  **  ((&(( &( "v" ) )->ₛ "s7")) # UInt  |-> x7)
  **  ((&(( &( "v" ) )->ₛ "s6")) # UInt  |-> x6)
  **  ((&(( &( "v" ) )->ₛ "s5")) # UInt  |-> x5)
  **  ((&(( &( "v" ) )->ₛ "s4")) # UInt  |-> x4)
  **  ((&(( &( "v" ) )->ₛ "s3")) # UInt  |-> x3)
  **  ((&(( &( "v" ) )->ₛ "s2")) # UInt  |-> x2)
  **  ((&(( &( "v" ) )->ₛ "s1")) # UInt  |-> x1)
  **  ((&(( &( "v" ) )->ₛ "s0")) # UInt  |-> x0)
  **  (xt_data F )
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  ((( &( "bw" ) )) # UInt64  |-> bw)
  **  ((( &( "vl" ) )) # UInt64  |-> vl)
  **  ((( &( "bh" ) )) # UInt64  |-> bh)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "i" ) )) # Ptr  |-> i)
  **  ((( &( "o" ) )) # Ptr  |-> o)
  **  (xt_output W R )
|--
  “ (xt_stride_distinct o output_stride vl ) ” 
  &&  “ (xt_stride_valid W o output_stride vl ) ”
) \/
(
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (R: XTOutput) (o: Z) (i: Z) (output: Z) (input: Z) (bh: Z) (vl: Z) (bw: Z) (block_height: Z) (block_width: Z) (output_stride: Z) (input_stride: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (bh <= UINT64_MAX)) (PreH2 : (vl <= UINT64_MAX)) (PreH3 : (bw <= UINT64_MAX)) (PreH4 : (block_height <= UINT64_MAX)) (PreH5 : (block_width <= UINT64_MAX)) (PreH6 : (output_stride <= UINT64_MAX)) (PreH7 : (input_stride <= UINT64_MAX)) (PreH8 : (bh >= 0)) (PreH9 : (vl >= 0)) (PreH10 : (bw >= 0)) (PreH11 : (block_height >= 0)) (PreH12 : (block_width >= 0)) (PreH13 : (output_stride >= 0)) (PreH14 : (input_stride >= 0)) (PreH15 : (x0 <= UINT_MAX)) (PreH16 : (x1 <= UINT_MAX)) (PreH17 : (x2 <= UINT_MAX)) (PreH18 : (x3 <= UINT_MAX)) (PreH19 : (x4 <= UINT_MAX)) (PreH20 : (x5 <= UINT_MAX)) (PreH21 : (x6 <= UINT_MAX)) (PreH22 : (x7 <= UINT_MAX)) (PreH23 : (x8 <= UINT_MAX)) (PreH24 : (x9 <= UINT_MAX)) (PreH25 : (x10 <= UINT_MAX)) (PreH26 : (x11 <= UINT_MAX)) (PreH27 : (x12 <= UINT_MAX)) (PreH28 : (x13 <= UINT_MAX)) (PreH29 : (x14 <= UINT_MAX)) (PreH30 : (x15 <= UINT_MAX)) (PreH31 : (x16 <= UINT_MAX)) (PreH32 : (x17 <= UINT_MAX)) (PreH33 : (x18 <= UINT_MAX)) (PreH34 : (x19 <= UINT_MAX)) (PreH35 : (x20 <= UINT_MAX)) (PreH36 : (x21 <= UINT_MAX)) (PreH37 : (x22 <= UINT_MAX)) (PreH38 : (x23 <= UINT_MAX)) (PreH39 : (x24 <= UINT_MAX)) (PreH40 : (x25 <= UINT_MAX)) (PreH41 : (x26 <= UINT_MAX)) (PreH42 : (x27 <= UINT_MAX)) (PreH43 : (x28 <= UINT_MAX)) (PreH44 : (x29 <= UINT_MAX)) (PreH45 : (x30 <= UINT_MAX)) (PreH46 : (x31 <= UINT_MAX)) (PreH47 : (x0 >= 0)) (PreH48 : (x1 >= 0)) (PreH49 : (x2 >= 0)) (PreH50 : (x3 >= 0)) (PreH51 : (x4 >= 0)) (PreH52 : (x5 >= 0)) (PreH53 : (x6 >= 0)) (PreH54 : (x7 >= 0)) (PreH55 : (x8 >= 0)) (PreH56 : (x9 >= 0)) (PreH57 : (x10 >= 0)) (PreH58 : (x11 >= 0)) (PreH59 : (x12 >= 0)) (PreH60 : (x13 >= 0)) (PreH61 : (x14 >= 0)) (PreH62 : (x15 >= 0)) (PreH63 : (x16 >= 0)) (PreH64 : (x17 >= 0)) (PreH65 : (x18 >= 0)) (PreH66 : (x19 >= 0)) (PreH67 : (x20 >= 0)) (PreH68 : (x21 >= 0)) (PreH69 : (x22 >= 0)) (PreH70 : (x23 >= 0)) (PreH71 : (x24 >= 0)) (PreH72 : (x25 >= 0)) (PreH73 : (x26 >= 0)) (PreH74 : (x27 >= 0)) (PreH75 : (x28 >= 0)) (PreH76 : (x29 >= 0)) (PreH77 : (x30 >= 0)) (PreH78 : (x31 >= 0)) (PreH79 : (xt_rvv_lane F i vl 0 x0 )) (PreH80 : (xt_rvv_lane F i vl 1 x1 )) (PreH81 : (xt_rvv_lane F i vl 2 x2 )) (PreH82 : (xt_rvv_lane F i vl 3 x3 )) (PreH83 : (xt_rvv_lane F i vl 4 x4 )) (PreH84 : (xt_rvv_lane F i vl 5 x5 )) (PreH85 : (xt_rvv_lane F i vl 6 x6 )) (PreH86 : (xt_rvv_lane F i vl 7 x7 )) (PreH87 : (xt_rvv_lane F i vl 8 x8 )) (PreH88 : (xt_rvv_lane F i vl 9 x9 )) (PreH89 : (xt_rvv_lane F i vl 10 x10 )) (PreH90 : (xt_rvv_lane F i vl 11 x11 )) (PreH91 : (xt_rvv_lane F i vl 12 x12 )) (PreH92 : (xt_rvv_lane F i vl 13 x13 )) (PreH93 : (xt_rvv_lane F i vl 14 x14 )) (PreH94 : (xt_rvv_lane F i vl 15 x15 )) (PreH95 : (xt_rvv_lane F i vl 16 x16 )) (PreH96 : (xt_rvv_lane F i vl 17 x17 )) (PreH97 : (xt_rvv_lane F i vl 18 x18 )) (PreH98 : (xt_rvv_lane F i vl 19 x19 )) (PreH99 : (xt_rvv_lane F i vl 20 x20 )) (PreH100 : (xt_rvv_lane F i vl 21 x21 )) (PreH101 : (xt_rvv_lane F i vl 22 x22 )) (PreH102 : (xt_rvv_lane F i vl 23 x23 )) (PreH103 : (xt_rvv_lane F i vl 24 x24 )) (PreH104 : (xt_rvv_lane F i vl 25 x25 )) (PreH105 : (xt_rvv_lane F i vl 26 x26 )) (PreH106 : (xt_rvv_lane F i vl 27 x27 )) (PreH107 : (xt_rvv_lane F i vl 28 x28 )) (PreH108 : (xt_rvv_lane F i vl 29 x29 )) (PreH109 : (xt_rvv_lane F i vl 30 x30 )) (PreH110 : (xt_rvv_lane F i vl 31 x31 )) (PreH111 : (bh > 0)) (PreH112 : (xt_valid F W G )) (PreH113 : (input_stride = (xt_input_stride (G)))) (PreH114 : (output_stride = (xt_output_stride (G)))) (PreH115 : (block_width = (xt_width (G)))) (PreH116 : (block_height = (xt_height (G)))) (PreH117 : (sizeof(UINT) = 4)) (PreH118 : (sizeof(UINT64) = 8)) (PreH119 : (sizeof(UINT64) = 8)) (PreH120 : (0 < bw)) (PreH121 : (bw <= (xt_total (G)))) (PreH122 : (xt_legal_vl bw vl )) (PreH123 : (0 < vl)) (PreH124 : (vl <= 32)) (PreH125 : (vl <= bw)) (PreH126 : (0 <= bh)) (PreH127 : (bh <= block_height)) (PreH128 : (input = (xt_current_input (G) (((xt_total (G)) - bw )) (0)))) (PreH129 : (output = (xt_current_output (G) (((xt_total (G)) - bw )) (0)))) (PreH130 : (i = (xt_current_input (G) (((xt_total (G)) - bw )) ((block_height - bh ))))) (PreH131 : (o = (xt_current_output (G) (((xt_total (G)) - bw )) ((block_height - bh ))))) (PreH132 : (xt_progress F G old R ((xt_total (G)) - bw ) vl (block_height - bh ) )) ,
  ((&(( &( "v" ) )->ₛ "s31")) # UInt  |-> x31)
  **  ((&(( &( "v" ) )->ₛ "s30")) # UInt  |-> x30)
  **  ((&(( &( "v" ) )->ₛ "s29")) # UInt  |-> x29)
  **  ((&(( &( "v" ) )->ₛ "s28")) # UInt  |-> x28)
  **  ((&(( &( "v" ) )->ₛ "s27")) # UInt  |-> x27)
  **  ((&(( &( "v" ) )->ₛ "s26")) # UInt  |-> x26)
  **  ((&(( &( "v" ) )->ₛ "s25")) # UInt  |-> x25)
  **  ((&(( &( "v" ) )->ₛ "s24")) # UInt  |-> x24)
  **  ((&(( &( "v" ) )->ₛ "s23")) # UInt  |-> x23)
  **  ((&(( &( "v" ) )->ₛ "s22")) # UInt  |-> x22)
  **  ((&(( &( "v" ) )->ₛ "s21")) # UInt  |-> x21)
  **  ((&(( &( "v" ) )->ₛ "s20")) # UInt  |-> x20)
  **  ((&(( &( "v" ) )->ₛ "s19")) # UInt  |-> x19)
  **  ((&(( &( "v" ) )->ₛ "s18")) # UInt  |-> x18)
  **  ((&(( &( "v" ) )->ₛ "s17")) # UInt  |-> x17)
  **  ((&(( &( "v" ) )->ₛ "s16")) # UInt  |-> x16)
  **  ((&(( &( "v" ) )->ₛ "s15")) # UInt  |-> x15)
  **  ((&(( &( "v" ) )->ₛ "s14")) # UInt  |-> x14)
  **  ((&(( &( "v" ) )->ₛ "s13")) # UInt  |-> x13)
  **  ((&(( &( "v" ) )->ₛ "s12")) # UInt  |-> x12)
  **  ((&(( &( "v" ) )->ₛ "s11")) # UInt  |-> x11)
  **  ((&(( &( "v" ) )->ₛ "s10")) # UInt  |-> x10)
  **  ((&(( &( "v" ) )->ₛ "s9")) # UInt  |-> x9)
  **  ((&(( &( "v" ) )->ₛ "s8")) # UInt  |-> x8)
  **  ((&(( &( "v" ) )->ₛ "s7")) # UInt  |-> x7)
  **  ((&(( &( "v" ) )->ₛ "s6")) # UInt  |-> x6)
  **  ((&(( &( "v" ) )->ₛ "s5")) # UInt  |-> x5)
  **  ((&(( &( "v" ) )->ₛ "s4")) # UInt  |-> x4)
  **  ((&(( &( "v" ) )->ₛ "s3")) # UInt  |-> x3)
  **  ((&(( &( "v" ) )->ₛ "s2")) # UInt  |-> x2)
  **  ((&(( &( "v" ) )->ₛ "s1")) # UInt  |-> x1)
  **  ((&(( &( "v" ) )->ₛ "s0")) # UInt  |-> x0)
  **  (xt_data F )
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  ((( &( "bw" ) )) # UInt64  |-> bw)
  **  ((( &( "vl" ) )) # UInt64  |-> vl)
  **  ((( &( "bh" ) )) # UInt64  |-> bh)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "i" ) )) # Ptr  |-> i)
  **  ((( &( "o" ) )) # Ptr  |-> o)
  **  (xt_output W R )
|--
  “ (xt_stride_valid W o output_stride vl ) ” 
  &&  “ (xt_stride_distinct o output_stride vl ) ”
).

Definition test_rvv_partial_solve_wit_19_pure_split_goal_1 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (R: XTOutput) (o: Z) (i: Z) (output: Z) (input: Z) (bh: Z) (vl: Z) (bw: Z) (block_height: Z) (block_width: Z) (output_stride: Z) (input_stride: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (bh <= UINT64_MAX)) (PreH2 : (vl <= UINT64_MAX)) (PreH3 : (bw <= UINT64_MAX)) (PreH4 : (block_height <= UINT64_MAX)) (PreH5 : (block_width <= UINT64_MAX)) (PreH6 : (output_stride <= UINT64_MAX)) (PreH7 : (input_stride <= UINT64_MAX)) (PreH8 : (bh >= 0)) (PreH9 : (vl >= 0)) (PreH10 : (bw >= 0)) (PreH11 : (block_height >= 0)) (PreH12 : (block_width >= 0)) (PreH13 : (output_stride >= 0)) (PreH14 : (input_stride >= 0)) (PreH15 : (x0 <= UINT_MAX)) (PreH16 : (x1 <= UINT_MAX)) (PreH17 : (x2 <= UINT_MAX)) (PreH18 : (x3 <= UINT_MAX)) (PreH19 : (x4 <= UINT_MAX)) (PreH20 : (x5 <= UINT_MAX)) (PreH21 : (x6 <= UINT_MAX)) (PreH22 : (x7 <= UINT_MAX)) (PreH23 : (x8 <= UINT_MAX)) (PreH24 : (x9 <= UINT_MAX)) (PreH25 : (x10 <= UINT_MAX)) (PreH26 : (x11 <= UINT_MAX)) (PreH27 : (x12 <= UINT_MAX)) (PreH28 : (x13 <= UINT_MAX)) (PreH29 : (x14 <= UINT_MAX)) (PreH30 : (x15 <= UINT_MAX)) (PreH31 : (x16 <= UINT_MAX)) (PreH32 : (x17 <= UINT_MAX)) (PreH33 : (x18 <= UINT_MAX)) (PreH34 : (x19 <= UINT_MAX)) (PreH35 : (x20 <= UINT_MAX)) (PreH36 : (x21 <= UINT_MAX)) (PreH37 : (x22 <= UINT_MAX)) (PreH38 : (x23 <= UINT_MAX)) (PreH39 : (x24 <= UINT_MAX)) (PreH40 : (x25 <= UINT_MAX)) (PreH41 : (x26 <= UINT_MAX)) (PreH42 : (x27 <= UINT_MAX)) (PreH43 : (x28 <= UINT_MAX)) (PreH44 : (x29 <= UINT_MAX)) (PreH45 : (x30 <= UINT_MAX)) (PreH46 : (x31 <= UINT_MAX)) (PreH47 : (x0 >= 0)) (PreH48 : (x1 >= 0)) (PreH49 : (x2 >= 0)) (PreH50 : (x3 >= 0)) (PreH51 : (x4 >= 0)) (PreH52 : (x5 >= 0)) (PreH53 : (x6 >= 0)) (PreH54 : (x7 >= 0)) (PreH55 : (x8 >= 0)) (PreH56 : (x9 >= 0)) (PreH57 : (x10 >= 0)) (PreH58 : (x11 >= 0)) (PreH59 : (x12 >= 0)) (PreH60 : (x13 >= 0)) (PreH61 : (x14 >= 0)) (PreH62 : (x15 >= 0)) (PreH63 : (x16 >= 0)) (PreH64 : (x17 >= 0)) (PreH65 : (x18 >= 0)) (PreH66 : (x19 >= 0)) (PreH67 : (x20 >= 0)) (PreH68 : (x21 >= 0)) (PreH69 : (x22 >= 0)) (PreH70 : (x23 >= 0)) (PreH71 : (x24 >= 0)) (PreH72 : (x25 >= 0)) (PreH73 : (x26 >= 0)) (PreH74 : (x27 >= 0)) (PreH75 : (x28 >= 0)) (PreH76 : (x29 >= 0)) (PreH77 : (x30 >= 0)) (PreH78 : (x31 >= 0)) (PreH79 : (xt_rvv_lane F i vl 0 x0 )) (PreH80 : (xt_rvv_lane F i vl 1 x1 )) (PreH81 : (xt_rvv_lane F i vl 2 x2 )) (PreH82 : (xt_rvv_lane F i vl 3 x3 )) (PreH83 : (xt_rvv_lane F i vl 4 x4 )) (PreH84 : (xt_rvv_lane F i vl 5 x5 )) (PreH85 : (xt_rvv_lane F i vl 6 x6 )) (PreH86 : (xt_rvv_lane F i vl 7 x7 )) (PreH87 : (xt_rvv_lane F i vl 8 x8 )) (PreH88 : (xt_rvv_lane F i vl 9 x9 )) (PreH89 : (xt_rvv_lane F i vl 10 x10 )) (PreH90 : (xt_rvv_lane F i vl 11 x11 )) (PreH91 : (xt_rvv_lane F i vl 12 x12 )) (PreH92 : (xt_rvv_lane F i vl 13 x13 )) (PreH93 : (xt_rvv_lane F i vl 14 x14 )) (PreH94 : (xt_rvv_lane F i vl 15 x15 )) (PreH95 : (xt_rvv_lane F i vl 16 x16 )) (PreH96 : (xt_rvv_lane F i vl 17 x17 )) (PreH97 : (xt_rvv_lane F i vl 18 x18 )) (PreH98 : (xt_rvv_lane F i vl 19 x19 )) (PreH99 : (xt_rvv_lane F i vl 20 x20 )) (PreH100 : (xt_rvv_lane F i vl 21 x21 )) (PreH101 : (xt_rvv_lane F i vl 22 x22 )) (PreH102 : (xt_rvv_lane F i vl 23 x23 )) (PreH103 : (xt_rvv_lane F i vl 24 x24 )) (PreH104 : (xt_rvv_lane F i vl 25 x25 )) (PreH105 : (xt_rvv_lane F i vl 26 x26 )) (PreH106 : (xt_rvv_lane F i vl 27 x27 )) (PreH107 : (xt_rvv_lane F i vl 28 x28 )) (PreH108 : (xt_rvv_lane F i vl 29 x29 )) (PreH109 : (xt_rvv_lane F i vl 30 x30 )) (PreH110 : (xt_rvv_lane F i vl 31 x31 )) (PreH111 : (bh > 0)) (PreH112 : (xt_valid F W G )) (PreH113 : (input_stride = (xt_input_stride (G)))) (PreH114 : (output_stride = (xt_output_stride (G)))) (PreH115 : (block_width = (xt_width (G)))) (PreH116 : (block_height = (xt_height (G)))) (PreH117 : (sizeof(UINT) = 4)) (PreH118 : (sizeof(UINT64) = 8)) (PreH119 : (sizeof(UINT64) = 8)) (PreH120 : (0 < bw)) (PreH121 : (bw <= (xt_total (G)))) (PreH122 : (xt_legal_vl bw vl )) (PreH123 : (0 < vl)) (PreH124 : (vl <= 32)) (PreH125 : (vl <= bw)) (PreH126 : (0 <= bh)) (PreH127 : (bh <= block_height)) (PreH128 : (input = (xt_current_input (G) (((xt_total (G)) - bw )) (0)))) (PreH129 : (output = (xt_current_output (G) (((xt_total (G)) - bw )) (0)))) (PreH130 : (i = (xt_current_input (G) (((xt_total (G)) - bw )) ((block_height - bh ))))) (PreH131 : (o = (xt_current_output (G) (((xt_total (G)) - bw )) ((block_height - bh ))))) (PreH132 : (xt_progress F G old R ((xt_total (G)) - bw ) vl (block_height - bh ) )) ,
  ((&(( &( "v" ) )->ₛ "s31")) # UInt  |-> x31)
  **  ((&(( &( "v" ) )->ₛ "s30")) # UInt  |-> x30)
  **  ((&(( &( "v" ) )->ₛ "s29")) # UInt  |-> x29)
  **  ((&(( &( "v" ) )->ₛ "s28")) # UInt  |-> x28)
  **  ((&(( &( "v" ) )->ₛ "s27")) # UInt  |-> x27)
  **  ((&(( &( "v" ) )->ₛ "s26")) # UInt  |-> x26)
  **  ((&(( &( "v" ) )->ₛ "s25")) # UInt  |-> x25)
  **  ((&(( &( "v" ) )->ₛ "s24")) # UInt  |-> x24)
  **  ((&(( &( "v" ) )->ₛ "s23")) # UInt  |-> x23)
  **  ((&(( &( "v" ) )->ₛ "s22")) # UInt  |-> x22)
  **  ((&(( &( "v" ) )->ₛ "s21")) # UInt  |-> x21)
  **  ((&(( &( "v" ) )->ₛ "s20")) # UInt  |-> x20)
  **  ((&(( &( "v" ) )->ₛ "s19")) # UInt  |-> x19)
  **  ((&(( &( "v" ) )->ₛ "s18")) # UInt  |-> x18)
  **  ((&(( &( "v" ) )->ₛ "s17")) # UInt  |-> x17)
  **  ((&(( &( "v" ) )->ₛ "s16")) # UInt  |-> x16)
  **  ((&(( &( "v" ) )->ₛ "s15")) # UInt  |-> x15)
  **  ((&(( &( "v" ) )->ₛ "s14")) # UInt  |-> x14)
  **  ((&(( &( "v" ) )->ₛ "s13")) # UInt  |-> x13)
  **  ((&(( &( "v" ) )->ₛ "s12")) # UInt  |-> x12)
  **  ((&(( &( "v" ) )->ₛ "s11")) # UInt  |-> x11)
  **  ((&(( &( "v" ) )->ₛ "s10")) # UInt  |-> x10)
  **  ((&(( &( "v" ) )->ₛ "s9")) # UInt  |-> x9)
  **  ((&(( &( "v" ) )->ₛ "s8")) # UInt  |-> x8)
  **  ((&(( &( "v" ) )->ₛ "s7")) # UInt  |-> x7)
  **  ((&(( &( "v" ) )->ₛ "s6")) # UInt  |-> x6)
  **  ((&(( &( "v" ) )->ₛ "s5")) # UInt  |-> x5)
  **  ((&(( &( "v" ) )->ₛ "s4")) # UInt  |-> x4)
  **  ((&(( &( "v" ) )->ₛ "s3")) # UInt  |-> x3)
  **  ((&(( &( "v" ) )->ₛ "s2")) # UInt  |-> x2)
  **  ((&(( &( "v" ) )->ₛ "s1")) # UInt  |-> x1)
  **  ((&(( &( "v" ) )->ₛ "s0")) # UInt  |-> x0)
  **  (xt_data F )
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  ((( &( "bw" ) )) # UInt64  |-> bw)
  **  ((( &( "vl" ) )) # UInt64  |-> vl)
  **  ((( &( "bh" ) )) # UInt64  |-> bh)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "i" ) )) # Ptr  |-> i)
  **  ((( &( "o" ) )) # Ptr  |-> o)
  **  (xt_output W R )
|--
  “ (xt_stride_valid W o output_stride vl ) ”
.

Definition test_rvv_partial_solve_wit_19_pure_split_goal_2 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (R: XTOutput) (o: Z) (i: Z) (output: Z) (input: Z) (bh: Z) (vl: Z) (bw: Z) (block_height: Z) (block_width: Z) (output_stride: Z) (input_stride: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (bh <= UINT64_MAX)) (PreH2 : (vl <= UINT64_MAX)) (PreH3 : (bw <= UINT64_MAX)) (PreH4 : (block_height <= UINT64_MAX)) (PreH5 : (block_width <= UINT64_MAX)) (PreH6 : (output_stride <= UINT64_MAX)) (PreH7 : (input_stride <= UINT64_MAX)) (PreH8 : (bh >= 0)) (PreH9 : (vl >= 0)) (PreH10 : (bw >= 0)) (PreH11 : (block_height >= 0)) (PreH12 : (block_width >= 0)) (PreH13 : (output_stride >= 0)) (PreH14 : (input_stride >= 0)) (PreH15 : (x0 <= UINT_MAX)) (PreH16 : (x1 <= UINT_MAX)) (PreH17 : (x2 <= UINT_MAX)) (PreH18 : (x3 <= UINT_MAX)) (PreH19 : (x4 <= UINT_MAX)) (PreH20 : (x5 <= UINT_MAX)) (PreH21 : (x6 <= UINT_MAX)) (PreH22 : (x7 <= UINT_MAX)) (PreH23 : (x8 <= UINT_MAX)) (PreH24 : (x9 <= UINT_MAX)) (PreH25 : (x10 <= UINT_MAX)) (PreH26 : (x11 <= UINT_MAX)) (PreH27 : (x12 <= UINT_MAX)) (PreH28 : (x13 <= UINT_MAX)) (PreH29 : (x14 <= UINT_MAX)) (PreH30 : (x15 <= UINT_MAX)) (PreH31 : (x16 <= UINT_MAX)) (PreH32 : (x17 <= UINT_MAX)) (PreH33 : (x18 <= UINT_MAX)) (PreH34 : (x19 <= UINT_MAX)) (PreH35 : (x20 <= UINT_MAX)) (PreH36 : (x21 <= UINT_MAX)) (PreH37 : (x22 <= UINT_MAX)) (PreH38 : (x23 <= UINT_MAX)) (PreH39 : (x24 <= UINT_MAX)) (PreH40 : (x25 <= UINT_MAX)) (PreH41 : (x26 <= UINT_MAX)) (PreH42 : (x27 <= UINT_MAX)) (PreH43 : (x28 <= UINT_MAX)) (PreH44 : (x29 <= UINT_MAX)) (PreH45 : (x30 <= UINT_MAX)) (PreH46 : (x31 <= UINT_MAX)) (PreH47 : (x0 >= 0)) (PreH48 : (x1 >= 0)) (PreH49 : (x2 >= 0)) (PreH50 : (x3 >= 0)) (PreH51 : (x4 >= 0)) (PreH52 : (x5 >= 0)) (PreH53 : (x6 >= 0)) (PreH54 : (x7 >= 0)) (PreH55 : (x8 >= 0)) (PreH56 : (x9 >= 0)) (PreH57 : (x10 >= 0)) (PreH58 : (x11 >= 0)) (PreH59 : (x12 >= 0)) (PreH60 : (x13 >= 0)) (PreH61 : (x14 >= 0)) (PreH62 : (x15 >= 0)) (PreH63 : (x16 >= 0)) (PreH64 : (x17 >= 0)) (PreH65 : (x18 >= 0)) (PreH66 : (x19 >= 0)) (PreH67 : (x20 >= 0)) (PreH68 : (x21 >= 0)) (PreH69 : (x22 >= 0)) (PreH70 : (x23 >= 0)) (PreH71 : (x24 >= 0)) (PreH72 : (x25 >= 0)) (PreH73 : (x26 >= 0)) (PreH74 : (x27 >= 0)) (PreH75 : (x28 >= 0)) (PreH76 : (x29 >= 0)) (PreH77 : (x30 >= 0)) (PreH78 : (x31 >= 0)) (PreH79 : (xt_rvv_lane F i vl 0 x0 )) (PreH80 : (xt_rvv_lane F i vl 1 x1 )) (PreH81 : (xt_rvv_lane F i vl 2 x2 )) (PreH82 : (xt_rvv_lane F i vl 3 x3 )) (PreH83 : (xt_rvv_lane F i vl 4 x4 )) (PreH84 : (xt_rvv_lane F i vl 5 x5 )) (PreH85 : (xt_rvv_lane F i vl 6 x6 )) (PreH86 : (xt_rvv_lane F i vl 7 x7 )) (PreH87 : (xt_rvv_lane F i vl 8 x8 )) (PreH88 : (xt_rvv_lane F i vl 9 x9 )) (PreH89 : (xt_rvv_lane F i vl 10 x10 )) (PreH90 : (xt_rvv_lane F i vl 11 x11 )) (PreH91 : (xt_rvv_lane F i vl 12 x12 )) (PreH92 : (xt_rvv_lane F i vl 13 x13 )) (PreH93 : (xt_rvv_lane F i vl 14 x14 )) (PreH94 : (xt_rvv_lane F i vl 15 x15 )) (PreH95 : (xt_rvv_lane F i vl 16 x16 )) (PreH96 : (xt_rvv_lane F i vl 17 x17 )) (PreH97 : (xt_rvv_lane F i vl 18 x18 )) (PreH98 : (xt_rvv_lane F i vl 19 x19 )) (PreH99 : (xt_rvv_lane F i vl 20 x20 )) (PreH100 : (xt_rvv_lane F i vl 21 x21 )) (PreH101 : (xt_rvv_lane F i vl 22 x22 )) (PreH102 : (xt_rvv_lane F i vl 23 x23 )) (PreH103 : (xt_rvv_lane F i vl 24 x24 )) (PreH104 : (xt_rvv_lane F i vl 25 x25 )) (PreH105 : (xt_rvv_lane F i vl 26 x26 )) (PreH106 : (xt_rvv_lane F i vl 27 x27 )) (PreH107 : (xt_rvv_lane F i vl 28 x28 )) (PreH108 : (xt_rvv_lane F i vl 29 x29 )) (PreH109 : (xt_rvv_lane F i vl 30 x30 )) (PreH110 : (xt_rvv_lane F i vl 31 x31 )) (PreH111 : (bh > 0)) (PreH112 : (xt_valid F W G )) (PreH113 : (input_stride = (xt_input_stride (G)))) (PreH114 : (output_stride = (xt_output_stride (G)))) (PreH115 : (block_width = (xt_width (G)))) (PreH116 : (block_height = (xt_height (G)))) (PreH117 : (sizeof(UINT) = 4)) (PreH118 : (sizeof(UINT64) = 8)) (PreH119 : (sizeof(UINT64) = 8)) (PreH120 : (0 < bw)) (PreH121 : (bw <= (xt_total (G)))) (PreH122 : (xt_legal_vl bw vl )) (PreH123 : (0 < vl)) (PreH124 : (vl <= 32)) (PreH125 : (vl <= bw)) (PreH126 : (0 <= bh)) (PreH127 : (bh <= block_height)) (PreH128 : (input = (xt_current_input (G) (((xt_total (G)) - bw )) (0)))) (PreH129 : (output = (xt_current_output (G) (((xt_total (G)) - bw )) (0)))) (PreH130 : (i = (xt_current_input (G) (((xt_total (G)) - bw )) ((block_height - bh ))))) (PreH131 : (o = (xt_current_output (G) (((xt_total (G)) - bw )) ((block_height - bh ))))) (PreH132 : (xt_progress F G old R ((xt_total (G)) - bw ) vl (block_height - bh ) )) ,
  ((&(( &( "v" ) )->ₛ "s31")) # UInt  |-> x31)
  **  ((&(( &( "v" ) )->ₛ "s30")) # UInt  |-> x30)
  **  ((&(( &( "v" ) )->ₛ "s29")) # UInt  |-> x29)
  **  ((&(( &( "v" ) )->ₛ "s28")) # UInt  |-> x28)
  **  ((&(( &( "v" ) )->ₛ "s27")) # UInt  |-> x27)
  **  ((&(( &( "v" ) )->ₛ "s26")) # UInt  |-> x26)
  **  ((&(( &( "v" ) )->ₛ "s25")) # UInt  |-> x25)
  **  ((&(( &( "v" ) )->ₛ "s24")) # UInt  |-> x24)
  **  ((&(( &( "v" ) )->ₛ "s23")) # UInt  |-> x23)
  **  ((&(( &( "v" ) )->ₛ "s22")) # UInt  |-> x22)
  **  ((&(( &( "v" ) )->ₛ "s21")) # UInt  |-> x21)
  **  ((&(( &( "v" ) )->ₛ "s20")) # UInt  |-> x20)
  **  ((&(( &( "v" ) )->ₛ "s19")) # UInt  |-> x19)
  **  ((&(( &( "v" ) )->ₛ "s18")) # UInt  |-> x18)
  **  ((&(( &( "v" ) )->ₛ "s17")) # UInt  |-> x17)
  **  ((&(( &( "v" ) )->ₛ "s16")) # UInt  |-> x16)
  **  ((&(( &( "v" ) )->ₛ "s15")) # UInt  |-> x15)
  **  ((&(( &( "v" ) )->ₛ "s14")) # UInt  |-> x14)
  **  ((&(( &( "v" ) )->ₛ "s13")) # UInt  |-> x13)
  **  ((&(( &( "v" ) )->ₛ "s12")) # UInt  |-> x12)
  **  ((&(( &( "v" ) )->ₛ "s11")) # UInt  |-> x11)
  **  ((&(( &( "v" ) )->ₛ "s10")) # UInt  |-> x10)
  **  ((&(( &( "v" ) )->ₛ "s9")) # UInt  |-> x9)
  **  ((&(( &( "v" ) )->ₛ "s8")) # UInt  |-> x8)
  **  ((&(( &( "v" ) )->ₛ "s7")) # UInt  |-> x7)
  **  ((&(( &( "v" ) )->ₛ "s6")) # UInt  |-> x6)
  **  ((&(( &( "v" ) )->ₛ "s5")) # UInt  |-> x5)
  **  ((&(( &( "v" ) )->ₛ "s4")) # UInt  |-> x4)
  **  ((&(( &( "v" ) )->ₛ "s3")) # UInt  |-> x3)
  **  ((&(( &( "v" ) )->ₛ "s2")) # UInt  |-> x2)
  **  ((&(( &( "v" ) )->ₛ "s1")) # UInt  |-> x1)
  **  ((&(( &( "v" ) )->ₛ "s0")) # UInt  |-> x0)
  **  (xt_data F )
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  ((( &( "bw" ) )) # UInt64  |-> bw)
  **  ((( &( "vl" ) )) # UInt64  |-> vl)
  **  ((( &( "bh" ) )) # UInt64  |-> bh)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "i" ) )) # Ptr  |-> i)
  **  ((( &( "o" ) )) # Ptr  |-> o)
  **  (xt_output W R )
|--
  “ (xt_stride_distinct o output_stride vl ) ”
.

Definition test_rvv_partial_solve_wit_19_aux := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (R: XTOutput) (o: Z) (i: Z) (output: Z) (input: Z) (bh: Z) (vl: Z) (bw: Z) (block_height: Z) (block_width: Z) (output_stride: Z) (input_stride: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (xt_rvv_lane F i vl 0 x0 )) (PreH2 : (xt_rvv_lane F i vl 1 x1 )) (PreH3 : (xt_rvv_lane F i vl 2 x2 )) (PreH4 : (xt_rvv_lane F i vl 3 x3 )) (PreH5 : (xt_rvv_lane F i vl 4 x4 )) (PreH6 : (xt_rvv_lane F i vl 5 x5 )) (PreH7 : (xt_rvv_lane F i vl 6 x6 )) (PreH8 : (xt_rvv_lane F i vl 7 x7 )) (PreH9 : (xt_rvv_lane F i vl 8 x8 )) (PreH10 : (xt_rvv_lane F i vl 9 x9 )) (PreH11 : (xt_rvv_lane F i vl 10 x10 )) (PreH12 : (xt_rvv_lane F i vl 11 x11 )) (PreH13 : (xt_rvv_lane F i vl 12 x12 )) (PreH14 : (xt_rvv_lane F i vl 13 x13 )) (PreH15 : (xt_rvv_lane F i vl 14 x14 )) (PreH16 : (xt_rvv_lane F i vl 15 x15 )) (PreH17 : (xt_rvv_lane F i vl 16 x16 )) (PreH18 : (xt_rvv_lane F i vl 17 x17 )) (PreH19 : (xt_rvv_lane F i vl 18 x18 )) (PreH20 : (xt_rvv_lane F i vl 19 x19 )) (PreH21 : (xt_rvv_lane F i vl 20 x20 )) (PreH22 : (xt_rvv_lane F i vl 21 x21 )) (PreH23 : (xt_rvv_lane F i vl 22 x22 )) (PreH24 : (xt_rvv_lane F i vl 23 x23 )) (PreH25 : (xt_rvv_lane F i vl 24 x24 )) (PreH26 : (xt_rvv_lane F i vl 25 x25 )) (PreH27 : (xt_rvv_lane F i vl 26 x26 )) (PreH28 : (xt_rvv_lane F i vl 27 x27 )) (PreH29 : (xt_rvv_lane F i vl 28 x28 )) (PreH30 : (xt_rvv_lane F i vl 29 x29 )) (PreH31 : (xt_rvv_lane F i vl 30 x30 )) (PreH32 : (xt_rvv_lane F i vl 31 x31 )) (PreH33 : (bh > 0)) (PreH34 : (xt_valid F W G )) (PreH35 : (input_stride = (xt_input_stride (G)))) (PreH36 : (output_stride = (xt_output_stride (G)))) (PreH37 : (block_width = (xt_width (G)))) (PreH38 : (block_height = (xt_height (G)))) (PreH39 : (sizeof(UINT) = 4)) (PreH40 : (sizeof(UINT64) = 8)) (PreH41 : (sizeof(UINT64) = 8)) (PreH42 : (0 < bw)) (PreH43 : (bw <= (xt_total (G)))) (PreH44 : (xt_legal_vl bw vl )) (PreH45 : (0 < vl)) (PreH46 : (vl <= 32)) (PreH47 : (vl <= bw)) (PreH48 : (0 <= bh)) (PreH49 : (bh <= block_height)) (PreH50 : (input = (xt_current_input (G) (((xt_total (G)) - bw )) (0)))) (PreH51 : (output = (xt_current_output (G) (((xt_total (G)) - bw )) (0)))) (PreH52 : (i = (xt_current_input (G) (((xt_total (G)) - bw )) ((block_height - bh ))))) (PreH53 : (o = (xt_current_output (G) (((xt_total (G)) - bw )) ((block_height - bh ))))) (PreH54 : (xt_progress F G old R ((xt_total (G)) - bw ) vl (block_height - bh ) )) ,
  ((&(( &( "v" ) )->ₛ "s31")) # UInt  |-> x31)
  **  ((&(( &( "v" ) )->ₛ "s30")) # UInt  |-> x30)
  **  ((&(( &( "v" ) )->ₛ "s29")) # UInt  |-> x29)
  **  ((&(( &( "v" ) )->ₛ "s28")) # UInt  |-> x28)
  **  ((&(( &( "v" ) )->ₛ "s27")) # UInt  |-> x27)
  **  ((&(( &( "v" ) )->ₛ "s26")) # UInt  |-> x26)
  **  ((&(( &( "v" ) )->ₛ "s25")) # UInt  |-> x25)
  **  ((&(( &( "v" ) )->ₛ "s24")) # UInt  |-> x24)
  **  ((&(( &( "v" ) )->ₛ "s23")) # UInt  |-> x23)
  **  ((&(( &( "v" ) )->ₛ "s22")) # UInt  |-> x22)
  **  ((&(( &( "v" ) )->ₛ "s21")) # UInt  |-> x21)
  **  ((&(( &( "v" ) )->ₛ "s20")) # UInt  |-> x20)
  **  ((&(( &( "v" ) )->ₛ "s19")) # UInt  |-> x19)
  **  ((&(( &( "v" ) )->ₛ "s18")) # UInt  |-> x18)
  **  ((&(( &( "v" ) )->ₛ "s17")) # UInt  |-> x17)
  **  ((&(( &( "v" ) )->ₛ "s16")) # UInt  |-> x16)
  **  ((&(( &( "v" ) )->ₛ "s15")) # UInt  |-> x15)
  **  ((&(( &( "v" ) )->ₛ "s14")) # UInt  |-> x14)
  **  ((&(( &( "v" ) )->ₛ "s13")) # UInt  |-> x13)
  **  ((&(( &( "v" ) )->ₛ "s12")) # UInt  |-> x12)
  **  ((&(( &( "v" ) )->ₛ "s11")) # UInt  |-> x11)
  **  ((&(( &( "v" ) )->ₛ "s10")) # UInt  |-> x10)
  **  ((&(( &( "v" ) )->ₛ "s9")) # UInt  |-> x9)
  **  ((&(( &( "v" ) )->ₛ "s8")) # UInt  |-> x8)
  **  ((&(( &( "v" ) )->ₛ "s7")) # UInt  |-> x7)
  **  ((&(( &( "v" ) )->ₛ "s6")) # UInt  |-> x6)
  **  ((&(( &( "v" ) )->ₛ "s5")) # UInt  |-> x5)
  **  ((&(( &( "v" ) )->ₛ "s4")) # UInt  |-> x4)
  **  ((&(( &( "v" ) )->ₛ "s3")) # UInt  |-> x3)
  **  ((&(( &( "v" ) )->ₛ "s2")) # UInt  |-> x2)
  **  ((&(( &( "v" ) )->ₛ "s1")) # UInt  |-> x1)
  **  ((&(( &( "v" ) )->ₛ "s0")) # UInt  |-> x0)
  **  (xt_data F )
  **  (xt_output W R )
|--
  “ (xt_stride_distinct o output_stride vl ) ” 
  &&  “ (xt_stride_valid W o output_stride vl ) ” 
  &&  “ (xt_rvv_lane F i vl 0 x0 ) ” 
  &&  “ (xt_rvv_lane F i vl 1 x1 ) ” 
  &&  “ (xt_rvv_lane F i vl 2 x2 ) ” 
  &&  “ (xt_rvv_lane F i vl 3 x3 ) ” 
  &&  “ (xt_rvv_lane F i vl 4 x4 ) ” 
  &&  “ (xt_rvv_lane F i vl 5 x5 ) ” 
  &&  “ (xt_rvv_lane F i vl 6 x6 ) ” 
  &&  “ (xt_rvv_lane F i vl 7 x7 ) ” 
  &&  “ (xt_rvv_lane F i vl 8 x8 ) ” 
  &&  “ (xt_rvv_lane F i vl 9 x9 ) ” 
  &&  “ (xt_rvv_lane F i vl 10 x10 ) ” 
  &&  “ (xt_rvv_lane F i vl 11 x11 ) ” 
  &&  “ (xt_rvv_lane F i vl 12 x12 ) ” 
  &&  “ (xt_rvv_lane F i vl 13 x13 ) ” 
  &&  “ (xt_rvv_lane F i vl 14 x14 ) ” 
  &&  “ (xt_rvv_lane F i vl 15 x15 ) ” 
  &&  “ (xt_rvv_lane F i vl 16 x16 ) ” 
  &&  “ (xt_rvv_lane F i vl 17 x17 ) ” 
  &&  “ (xt_rvv_lane F i vl 18 x18 ) ” 
  &&  “ (xt_rvv_lane F i vl 19 x19 ) ” 
  &&  “ (xt_rvv_lane F i vl 20 x20 ) ” 
  &&  “ (xt_rvv_lane F i vl 21 x21 ) ” 
  &&  “ (xt_rvv_lane F i vl 22 x22 ) ” 
  &&  “ (xt_rvv_lane F i vl 23 x23 ) ” 
  &&  “ (xt_rvv_lane F i vl 24 x24 ) ” 
  &&  “ (xt_rvv_lane F i vl 25 x25 ) ” 
  &&  “ (xt_rvv_lane F i vl 26 x26 ) ” 
  &&  “ (xt_rvv_lane F i vl 27 x27 ) ” 
  &&  “ (xt_rvv_lane F i vl 28 x28 ) ” 
  &&  “ (xt_rvv_lane F i vl 29 x29 ) ” 
  &&  “ (xt_rvv_lane F i vl 30 x30 ) ” 
  &&  “ (xt_rvv_lane F i vl 31 x31 ) ” 
  &&  “ (bh > 0) ” 
  &&  “ (xt_valid F W G ) ” 
  &&  “ (input_stride = (xt_input_stride (G))) ” 
  &&  “ (output_stride = (xt_output_stride (G))) ” 
  &&  “ (block_width = (xt_width (G))) ” 
  &&  “ (block_height = (xt_height (G))) ” 
  &&  “ (sizeof(UINT) = 4) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (0 < bw) ” 
  &&  “ (bw <= (xt_total (G))) ” 
  &&  “ (xt_legal_vl bw vl ) ” 
  &&  “ (0 < vl) ” 
  &&  “ (vl <= 32) ” 
  &&  “ (vl <= bw) ” 
  &&  “ (0 <= bh) ” 
  &&  “ (bh <= block_height) ” 
  &&  “ (input = (xt_current_input (G) (((xt_total (G)) - bw )) (0))) ” 
  &&  “ (output = (xt_current_output (G) (((xt_total (G)) - bw )) (0))) ” 
  &&  “ (i = (xt_current_input (G) (((xt_total (G)) - bw )) ((block_height - bh )))) ” 
  &&  “ (o = (xt_current_output (G) (((xt_total (G)) - bw )) ((block_height - bh )))) ” 
  &&  “ (xt_progress F G old R ((xt_total (G)) - bw ) vl (block_height - bh ) ) ”
  &&  (xt_output W R )
  **  ((&(( &( "v" ) )->ₛ "s0")) # UInt  |-> x0)
  **  ((&(( &( "v" ) )->ₛ "s1")) # UInt  |-> x1)
  **  ((&(( &( "v" ) )->ₛ "s2")) # UInt  |-> x2)
  **  ((&(( &( "v" ) )->ₛ "s3")) # UInt  |-> x3)
  **  ((&(( &( "v" ) )->ₛ "s4")) # UInt  |-> x4)
  **  ((&(( &( "v" ) )->ₛ "s5")) # UInt  |-> x5)
  **  ((&(( &( "v" ) )->ₛ "s6")) # UInt  |-> x6)
  **  ((&(( &( "v" ) )->ₛ "s7")) # UInt  |-> x7)
  **  ((&(( &( "v" ) )->ₛ "s8")) # UInt  |-> x8)
  **  ((&(( &( "v" ) )->ₛ "s9")) # UInt  |-> x9)
  **  ((&(( &( "v" ) )->ₛ "s10")) # UInt  |-> x10)
  **  ((&(( &( "v" ) )->ₛ "s11")) # UInt  |-> x11)
  **  ((&(( &( "v" ) )->ₛ "s12")) # UInt  |-> x12)
  **  ((&(( &( "v" ) )->ₛ "s13")) # UInt  |-> x13)
  **  ((&(( &( "v" ) )->ₛ "s14")) # UInt  |-> x14)
  **  ((&(( &( "v" ) )->ₛ "s15")) # UInt  |-> x15)
  **  ((&(( &( "v" ) )->ₛ "s16")) # UInt  |-> x16)
  **  ((&(( &( "v" ) )->ₛ "s17")) # UInt  |-> x17)
  **  ((&(( &( "v" ) )->ₛ "s18")) # UInt  |-> x18)
  **  ((&(( &( "v" ) )->ₛ "s19")) # UInt  |-> x19)
  **  ((&(( &( "v" ) )->ₛ "s20")) # UInt  |-> x20)
  **  ((&(( &( "v" ) )->ₛ "s21")) # UInt  |-> x21)
  **  ((&(( &( "v" ) )->ₛ "s22")) # UInt  |-> x22)
  **  ((&(( &( "v" ) )->ₛ "s23")) # UInt  |-> x23)
  **  ((&(( &( "v" ) )->ₛ "s24")) # UInt  |-> x24)
  **  ((&(( &( "v" ) )->ₛ "s25")) # UInt  |-> x25)
  **  ((&(( &( "v" ) )->ₛ "s26")) # UInt  |-> x26)
  **  ((&(( &( "v" ) )->ₛ "s27")) # UInt  |-> x27)
  **  ((&(( &( "v" ) )->ₛ "s28")) # UInt  |-> x28)
  **  ((&(( &( "v" ) )->ₛ "s29")) # UInt  |-> x29)
  **  ((&(( &( "v" ) )->ₛ "s30")) # UInt  |-> x30)
  **  ((&(( &( "v" ) )->ₛ "s31")) # UInt  |-> x31)
  **  (xt_data F )
.

Definition test_rvv_partial_solve_wit_19 := test_rvv_partial_solve_wit_19_pure -> test_rvv_partial_solve_wit_19_aux.

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
Axiom proof_of_test_rvv_safety_wit_44 : test_rvv_safety_wit_44.
Axiom proof_of_test_rvv_safety_wit_45 : test_rvv_safety_wit_45.
Axiom proof_of_test_rvv_safety_wit_46 : test_rvv_safety_wit_46.
Axiom proof_of_test_rvv_safety_wit_47 : test_rvv_safety_wit_47.
Axiom proof_of_test_rvv_safety_wit_48 : test_rvv_safety_wit_48.
Axiom proof_of_test_rvv_safety_wit_49 : test_rvv_safety_wit_49.
Axiom proof_of_test_rvv_safety_wit_50 : test_rvv_safety_wit_50.
Axiom proof_of_test_rvv_safety_wit_51 : test_rvv_safety_wit_51.
Axiom proof_of_test_rvv_safety_wit_52 : test_rvv_safety_wit_52.
Axiom proof_of_test_rvv_safety_wit_53 : test_rvv_safety_wit_53.
Axiom proof_of_test_rvv_safety_wit_54 : test_rvv_safety_wit_54.
Axiom proof_of_test_rvv_safety_wit_55 : test_rvv_safety_wit_55.
Axiom proof_of_test_rvv_safety_wit_56 : test_rvv_safety_wit_56.
Axiom proof_of_test_rvv_safety_wit_57 : test_rvv_safety_wit_57.
Axiom proof_of_test_rvv_safety_wit_58 : test_rvv_safety_wit_58.
Axiom proof_of_test_rvv_safety_wit_59 : test_rvv_safety_wit_59.
Axiom proof_of_test_rvv_safety_wit_60 : test_rvv_safety_wit_60.
Axiom proof_of_test_rvv_safety_wit_61 : test_rvv_safety_wit_61.
Axiom proof_of_test_rvv_safety_wit_62 : test_rvv_safety_wit_62.
Axiom proof_of_test_rvv_safety_wit_63 : test_rvv_safety_wit_63.
Axiom proof_of_test_rvv_safety_wit_64 : test_rvv_safety_wit_64.
Axiom proof_of_test_rvv_safety_wit_65 : test_rvv_safety_wit_65.
Axiom proof_of_test_rvv_safety_wit_66 : test_rvv_safety_wit_66.
Axiom proof_of_test_rvv_entail_wit_1 : test_rvv_entail_wit_1.
Axiom proof_of_test_rvv_entail_wit_2_1 : test_rvv_entail_wit_2_1.
Axiom proof_of_test_rvv_entail_wit_2_2 : test_rvv_entail_wit_2_2.
Axiom proof_of_test_rvv_entail_wit_2_3 : test_rvv_entail_wit_2_3.
Axiom proof_of_test_rvv_entail_wit_2_4 : test_rvv_entail_wit_2_4.
Axiom proof_of_test_rvv_entail_wit_2_5 : test_rvv_entail_wit_2_5.
Axiom proof_of_test_rvv_entail_wit_2_6 : test_rvv_entail_wit_2_6.
Axiom proof_of_test_rvv_entail_wit_2_7 : test_rvv_entail_wit_2_7.
Axiom proof_of_test_rvv_entail_wit_2_8 : test_rvv_entail_wit_2_8.
Axiom proof_of_test_rvv_entail_wit_2_9 : test_rvv_entail_wit_2_9.
Axiom proof_of_test_rvv_entail_wit_2_10 : test_rvv_entail_wit_2_10.
Axiom proof_of_test_rvv_entail_wit_2_11 : test_rvv_entail_wit_2_11.
Axiom proof_of_test_rvv_entail_wit_2_12 : test_rvv_entail_wit_2_12.
Axiom proof_of_test_rvv_entail_wit_2_13 : test_rvv_entail_wit_2_13.
Axiom proof_of_test_rvv_entail_wit_2_14 : test_rvv_entail_wit_2_14.
Axiom proof_of_test_rvv_entail_wit_2_15 : test_rvv_entail_wit_2_15.
Axiom proof_of_test_rvv_entail_wit_2_16 : test_rvv_entail_wit_2_16.
Axiom proof_of_test_rvv_entail_wit_3 : test_rvv_entail_wit_3.
Axiom proof_of_test_rvv_entail_wit_4 : test_rvv_entail_wit_4.
Axiom proof_of_test_rvv_entail_wit_5 : test_rvv_entail_wit_5.
Axiom proof_of_test_rvv_entail_wit_6 : test_rvv_entail_wit_6.
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
Axiom proof_of_test_rvv_partial_solve_wit_15_pure : test_rvv_partial_solve_wit_15_pure.
Axiom proof_of_test_rvv_partial_solve_wit_15 : test_rvv_partial_solve_wit_15.
Axiom proof_of_test_rvv_partial_solve_wit_16 : test_rvv_partial_solve_wit_16.
Axiom proof_of_test_rvv_partial_solve_wit_17_pure : test_rvv_partial_solve_wit_17_pure.
Axiom proof_of_test_rvv_partial_solve_wit_17 : test_rvv_partial_solve_wit_17.
Axiom proof_of_test_rvv_partial_solve_wit_18 : test_rvv_partial_solve_wit_18.
Axiom proof_of_test_rvv_partial_solve_wit_19_pure : test_rvv_partial_solve_wit_19_pure.
Axiom proof_of_test_rvv_partial_solve_wit_19 : test_rvv_partial_solve_wit_19.

End VC_Correct.
