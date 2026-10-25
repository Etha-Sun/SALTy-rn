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
Require Import X32Transpose.ArithmeticModel.
Require Import X32Transpose.NeonProgramModel.
Local Open Scope sac.

(*----- Function test_neon -----*)

Definition test_neon_safety_wit_1 := 
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

Definition test_neon_safety_wit_2 := 
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

Definition test_neon_safety_wit_3 := 
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

Definition test_neon_safety_wit_4 := 
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

Definition test_neon_safety_wit_5 := 
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

Definition test_neon_safety_wit_6 := 
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

Definition test_neon_safety_wit_7 := 
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

Definition test_neon_safety_wit_8 := 
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

Definition test_neon_safety_wit_9 := 
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

Definition test_neon_safety_wit_10 := 
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

Definition test_neon_safety_wit_11 := 
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

Definition test_neon_safety_wit_12 := 
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

Definition test_neon_safety_wit_13 := 
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

Definition test_neon_safety_wit_14 := 
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

Definition test_neon_safety_wit_15 := 
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

Definition test_neon_safety_wit_16 := 
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

Definition test_neon_safety_wit_17 := 
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

Definition test_neon_safety_wit_18 := 
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

Definition test_neon_safety_wit_19 := 
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

Definition test_neon_safety_wit_20 := 
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

Definition test_neon_safety_wit_21 := 
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
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition test_neon_safety_wit_22 := 
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
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition test_neon_safety_wit_23 := 
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
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition test_neon_safety_wit_24 := 
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
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition test_neon_safety_wit_25 := 
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
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition test_neon_safety_wit_26 := 
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
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition test_neon_safety_wit_27 := 
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
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition test_neon_safety_wit_28 := 
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
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition test_neon_safety_wit_29 := 
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
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition test_neon_safety_wit_30 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height = 0)) (PreH2 : (block_height = 1)) (PreH3 : (block_width = 1)) (PreH4 : (xt_valid F W G )) (PreH5 : (input = (xt_input (G)))) (PreH6 : (output = (xt_output_base (G)))) (PreH7 : (input_stride = (xt_input_stride (G)))) (PreH8 : (output_stride = (xt_output_stride (G)))) (PreH9 : (block_width = (xt_width (G)))) (PreH10 : (block_height = (xt_height (G)))) (PreH11 : (sizeof(UINT) = 4)) (PreH12 : (sizeof(UINT64) = 8)) (PreH13 : (sizeof(UINT64) = 8)) (PreH14 : (block_width = 1)) (PreH15 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
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

Definition test_neon_safety_wit_31 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height = 0)) (PreH2 : (block_height = 1)) (PreH3 : (block_width = 1)) (PreH4 : (xt_valid F W G )) (PreH5 : (input = (xt_input (G)))) (PreH6 : (output = (xt_output_base (G)))) (PreH7 : (input_stride = (xt_input_stride (G)))) (PreH8 : (output_stride = (xt_output_stride (G)))) (PreH9 : (block_width = (xt_width (G)))) (PreH10 : (block_height = (xt_height (G)))) (PreH11 : (sizeof(UINT) = 4)) (PreH12 : (sizeof(UINT64) = 8)) (PreH13 : (sizeof(UINT64) = 8)) (PreH14 : (block_width = 1)) (PreH15 : (block_height = 1)) ,
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

Definition test_neon_safety_wit_32 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height = 0)) (PreH2 : (block_height = 1)) (PreH3 : (block_width = 1)) (PreH4 : (xt_valid F W G )) (PreH5 : (input = (xt_input (G)))) (PreH6 : (output = (xt_output_base (G)))) (PreH7 : (input_stride = (xt_input_stride (G)))) (PreH8 : (output_stride = (xt_output_stride (G)))) (PreH9 : (block_width = (xt_width (G)))) (PreH10 : (block_height = (xt_height (G)))) (PreH11 : (sizeof(UINT) = 4)) (PreH12 : (sizeof(UINT64) = 8)) (PreH13 : (sizeof(UINT64) = 8)) (PreH14 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH15 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
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

Definition test_neon_safety_wit_33 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height = 0)) (PreH2 : (block_height = 1)) (PreH3 : (output_stride >= (unsigned_last_nbits ((block_height * sizeof(UINT) )) (64)))) (PreH4 : (block_width <> 1)) (PreH5 : (xt_valid F W G )) (PreH6 : (input = (xt_input (G)))) (PreH7 : (output = (xt_output_base (G)))) (PreH8 : (input_stride = (xt_input_stride (G)))) (PreH9 : (output_stride = (xt_output_stride (G)))) (PreH10 : (block_width = (xt_width (G)))) (PreH11 : (block_height = (xt_height (G)))) (PreH12 : (sizeof(UINT) = 4)) (PreH13 : (sizeof(UINT64) = 8)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH16 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
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

Definition test_neon_safety_wit_34 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height = 0)) (PreH2 : (block_height = 1)) (PreH3 : (block_width = 1)) (PreH4 : (xt_valid F W G )) (PreH5 : (input = (xt_input (G)))) (PreH6 : (output = (xt_output_base (G)))) (PreH7 : (input_stride = (xt_input_stride (G)))) (PreH8 : (output_stride = (xt_output_stride (G)))) (PreH9 : (block_width = (xt_width (G)))) (PreH10 : (block_height = (xt_height (G)))) (PreH11 : (sizeof(UINT) = 4)) (PreH12 : (sizeof(UINT64) = 8)) (PreH13 : (sizeof(UINT64) = 8)) (PreH14 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH15 : (block_height = 1)) ,
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

Definition test_neon_safety_wit_35 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height = 0)) (PreH2 : (block_height = 1)) (PreH3 : (output_stride >= (block_height * sizeof(UINT) ))) (PreH4 : (block_width <> 1)) (PreH5 : (xt_valid F W G )) (PreH6 : (input = (xt_input (G)))) (PreH7 : (output = (xt_output_base (G)))) (PreH8 : (input_stride = (xt_input_stride (G)))) (PreH9 : (output_stride = (xt_output_stride (G)))) (PreH10 : (block_width = (xt_width (G)))) (PreH11 : (block_height = (xt_height (G)))) (PreH12 : (sizeof(UINT) = 4)) (PreH13 : (sizeof(UINT64) = 8)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH16 : (block_height = 1)) ,
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

Definition test_neon_safety_wit_36 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height <> 0)) (PreH2 : (block_height = 1)) (PreH3 : (block_width = 1)) (PreH4 : (xt_valid F W G )) (PreH5 : (input = (xt_input (G)))) (PreH6 : (output = (xt_output_base (G)))) (PreH7 : (input_stride = (xt_input_stride (G)))) (PreH8 : (output_stride = (xt_output_stride (G)))) (PreH9 : (block_width = (xt_width (G)))) (PreH10 : (block_height = (xt_height (G)))) (PreH11 : (sizeof(UINT) = 4)) (PreH12 : (sizeof(UINT64) = 8)) (PreH13 : (sizeof(UINT64) = 8)) (PreH14 : (block_width = 1)) (PreH15 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  ((( &( "input" ) )) # Ptr  |-> input)
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

Definition test_neon_safety_wit_37 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height <> 0)) (PreH2 : (input_stride >= (block_width * sizeof(UINT) ))) (PreH3 : (block_height <> 1)) (PreH4 : (block_width = 1)) (PreH5 : (xt_valid F W G )) (PreH6 : (input = (xt_input (G)))) (PreH7 : (output = (xt_output_base (G)))) (PreH8 : (input_stride = (xt_input_stride (G)))) (PreH9 : (output_stride = (xt_output_stride (G)))) (PreH10 : (block_width = (xt_width (G)))) (PreH11 : (block_height = (xt_height (G)))) (PreH12 : (sizeof(UINT) = 4)) (PreH13 : (sizeof(UINT64) = 8)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (block_width = 1)) (PreH16 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  ((( &( "input" ) )) # Ptr  |-> input)
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

Definition test_neon_safety_wit_38 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height <> 0)) (PreH2 : (block_height = 1)) (PreH3 : (block_width = 1)) (PreH4 : (xt_valid F W G )) (PreH5 : (input = (xt_input (G)))) (PreH6 : (output = (xt_output_base (G)))) (PreH7 : (input_stride = (xt_input_stride (G)))) (PreH8 : (output_stride = (xt_output_stride (G)))) (PreH9 : (block_width = (xt_width (G)))) (PreH10 : (block_height = (xt_height (G)))) (PreH11 : (sizeof(UINT) = 4)) (PreH12 : (sizeof(UINT64) = 8)) (PreH13 : (sizeof(UINT64) = 8)) (PreH14 : (block_width = 1)) (PreH15 : (block_height = 1)) ,
  ((( &( "input" ) )) # Ptr  |-> input)
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

Definition test_neon_safety_wit_39 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height <> 0)) (PreH2 : (block_height = 1)) (PreH3 : (block_width = 1)) (PreH4 : (xt_valid F W G )) (PreH5 : (input = (xt_input (G)))) (PreH6 : (output = (xt_output_base (G)))) (PreH7 : (input_stride = (xt_input_stride (G)))) (PreH8 : (output_stride = (xt_output_stride (G)))) (PreH9 : (block_width = (xt_width (G)))) (PreH10 : (block_height = (xt_height (G)))) (PreH11 : (sizeof(UINT) = 4)) (PreH12 : (sizeof(UINT64) = 8)) (PreH13 : (sizeof(UINT64) = 8)) (PreH14 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH15 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  ((( &( "input" ) )) # Ptr  |-> input)
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

Definition test_neon_safety_wit_40 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height <> 0)) (PreH2 : (input_stride >= (block_width * sizeof(UINT) ))) (PreH3 : (block_height <> 1)) (PreH4 : (block_width = 1)) (PreH5 : (xt_valid F W G )) (PreH6 : (input = (xt_input (G)))) (PreH7 : (output = (xt_output_base (G)))) (PreH8 : (input_stride = (xt_input_stride (G)))) (PreH9 : (output_stride = (xt_output_stride (G)))) (PreH10 : (block_width = (xt_width (G)))) (PreH11 : (block_height = (xt_height (G)))) (PreH12 : (sizeof(UINT) = 4)) (PreH13 : (sizeof(UINT64) = 8)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH16 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  ((( &( "input" ) )) # Ptr  |-> input)
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

Definition test_neon_safety_wit_41 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height <> 0)) (PreH2 : (block_height = 1)) (PreH3 : (output_stride >= (unsigned_last_nbits ((block_height * sizeof(UINT) )) (64)))) (PreH4 : (block_width <> 1)) (PreH5 : (xt_valid F W G )) (PreH6 : (input = (xt_input (G)))) (PreH7 : (output = (xt_output_base (G)))) (PreH8 : (input_stride = (xt_input_stride (G)))) (PreH9 : (output_stride = (xt_output_stride (G)))) (PreH10 : (block_width = (xt_width (G)))) (PreH11 : (block_height = (xt_height (G)))) (PreH12 : (sizeof(UINT) = 4)) (PreH13 : (sizeof(UINT64) = 8)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH16 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  ((( &( "input" ) )) # Ptr  |-> input)
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

Definition test_neon_safety_wit_42 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height <> 0)) (PreH2 : (input_stride >= (unsigned_last_nbits ((block_width * sizeof(UINT) )) (64)))) (PreH3 : (block_height <> 1)) (PreH4 : (output_stride >= (unsigned_last_nbits ((block_height * sizeof(UINT) )) (64)))) (PreH5 : (block_width <> 1)) (PreH6 : (xt_valid F W G )) (PreH7 : (input = (xt_input (G)))) (PreH8 : (output = (xt_output_base (G)))) (PreH9 : (input_stride = (xt_input_stride (G)))) (PreH10 : (output_stride = (xt_output_stride (G)))) (PreH11 : (block_width = (xt_width (G)))) (PreH12 : (block_height = (xt_height (G)))) (PreH13 : (sizeof(UINT) = 4)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH17 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  ((( &( "input" ) )) # Ptr  |-> input)
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

Definition test_neon_safety_wit_43 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height <> 0)) (PreH2 : (block_height = 1)) (PreH3 : (block_width = 1)) (PreH4 : (xt_valid F W G )) (PreH5 : (input = (xt_input (G)))) (PreH6 : (output = (xt_output_base (G)))) (PreH7 : (input_stride = (xt_input_stride (G)))) (PreH8 : (output_stride = (xt_output_stride (G)))) (PreH9 : (block_width = (xt_width (G)))) (PreH10 : (block_height = (xt_height (G)))) (PreH11 : (sizeof(UINT) = 4)) (PreH12 : (sizeof(UINT64) = 8)) (PreH13 : (sizeof(UINT64) = 8)) (PreH14 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH15 : (block_height = 1)) ,
  ((( &( "input" ) )) # Ptr  |-> input)
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

Definition test_neon_safety_wit_44 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height <> 0)) (PreH2 : (block_height = 1)) (PreH3 : (output_stride >= (block_height * sizeof(UINT) ))) (PreH4 : (block_width <> 1)) (PreH5 : (xt_valid F W G )) (PreH6 : (input = (xt_input (G)))) (PreH7 : (output = (xt_output_base (G)))) (PreH8 : (input_stride = (xt_input_stride (G)))) (PreH9 : (output_stride = (xt_output_stride (G)))) (PreH10 : (block_width = (xt_width (G)))) (PreH11 : (block_height = (xt_height (G)))) (PreH12 : (sizeof(UINT) = 4)) (PreH13 : (sizeof(UINT64) = 8)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH16 : (block_height = 1)) ,
  ((( &( "input" ) )) # Ptr  |-> input)
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

Definition test_neon_safety_wit_45 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_width = 0)) (PreH2 : (block_height <> 0)) (PreH3 : (block_height = 1)) (PreH4 : (block_width = 1)) (PreH5 : (xt_valid F W G )) (PreH6 : (input = (xt_input (G)))) (PreH7 : (output = (xt_output_base (G)))) (PreH8 : (input_stride = (xt_input_stride (G)))) (PreH9 : (output_stride = (xt_output_stride (G)))) (PreH10 : (block_width = (xt_width (G)))) (PreH11 : (block_height = (xt_height (G)))) (PreH12 : (sizeof(UINT) = 4)) (PreH13 : (sizeof(UINT64) = 8)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (block_width = 1)) (PreH16 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
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

Definition test_neon_safety_wit_46 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_width = 0)) (PreH2 : (block_height <> 0)) (PreH3 : (input_stride >= (block_width * sizeof(UINT) ))) (PreH4 : (block_height <> 1)) (PreH5 : (block_width = 1)) (PreH6 : (xt_valid F W G )) (PreH7 : (input = (xt_input (G)))) (PreH8 : (output = (xt_output_base (G)))) (PreH9 : (input_stride = (xt_input_stride (G)))) (PreH10 : (output_stride = (xt_output_stride (G)))) (PreH11 : (block_width = (xt_width (G)))) (PreH12 : (block_height = (xt_height (G)))) (PreH13 : (sizeof(UINT) = 4)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (block_width = 1)) (PreH17 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
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

Definition test_neon_safety_wit_47 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_width = 0)) (PreH2 : (block_height <> 0)) (PreH3 : (block_height = 1)) (PreH4 : (block_width = 1)) (PreH5 : (xt_valid F W G )) (PreH6 : (input = (xt_input (G)))) (PreH7 : (output = (xt_output_base (G)))) (PreH8 : (input_stride = (xt_input_stride (G)))) (PreH9 : (output_stride = (xt_output_stride (G)))) (PreH10 : (block_width = (xt_width (G)))) (PreH11 : (block_height = (xt_height (G)))) (PreH12 : (sizeof(UINT) = 4)) (PreH13 : (sizeof(UINT64) = 8)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (block_width = 1)) (PreH16 : (block_height = 1)) ,
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

Definition test_neon_safety_wit_48 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_width = 0)) (PreH2 : (block_height <> 0)) (PreH3 : (block_height = 1)) (PreH4 : (block_width = 1)) (PreH5 : (xt_valid F W G )) (PreH6 : (input = (xt_input (G)))) (PreH7 : (output = (xt_output_base (G)))) (PreH8 : (input_stride = (xt_input_stride (G)))) (PreH9 : (output_stride = (xt_output_stride (G)))) (PreH10 : (block_width = (xt_width (G)))) (PreH11 : (block_height = (xt_height (G)))) (PreH12 : (sizeof(UINT) = 4)) (PreH13 : (sizeof(UINT64) = 8)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH16 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
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

Definition test_neon_safety_wit_49 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_width = 0)) (PreH2 : (block_height <> 0)) (PreH3 : (input_stride >= (block_width * sizeof(UINT) ))) (PreH4 : (block_height <> 1)) (PreH5 : (block_width = 1)) (PreH6 : (xt_valid F W G )) (PreH7 : (input = (xt_input (G)))) (PreH8 : (output = (xt_output_base (G)))) (PreH9 : (input_stride = (xt_input_stride (G)))) (PreH10 : (output_stride = (xt_output_stride (G)))) (PreH11 : (block_width = (xt_width (G)))) (PreH12 : (block_height = (xt_height (G)))) (PreH13 : (sizeof(UINT) = 4)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH17 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
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

Definition test_neon_safety_wit_50 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_width = 0)) (PreH2 : (block_height <> 0)) (PreH3 : (block_height = 1)) (PreH4 : (block_width = 1)) (PreH5 : (xt_valid F W G )) (PreH6 : (input = (xt_input (G)))) (PreH7 : (output = (xt_output_base (G)))) (PreH8 : (input_stride = (xt_input_stride (G)))) (PreH9 : (output_stride = (xt_output_stride (G)))) (PreH10 : (block_width = (xt_width (G)))) (PreH11 : (block_height = (xt_height (G)))) (PreH12 : (sizeof(UINT) = 4)) (PreH13 : (sizeof(UINT64) = 8)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH16 : (block_height = 1)) ,
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

Definition test_neon_safety_wit_51 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_width = 0)) (PreH2 : (block_height <> 0)) (PreH3 : (block_height = 1)) (PreH4 : (output_stride >= (unsigned_last_nbits ((block_height * sizeof(UINT) )) (64)))) (PreH5 : (block_width <> 1)) (PreH6 : (xt_valid F W G )) (PreH7 : (input = (xt_input (G)))) (PreH8 : (output = (xt_output_base (G)))) (PreH9 : (input_stride = (xt_input_stride (G)))) (PreH10 : (output_stride = (xt_output_stride (G)))) (PreH11 : (block_width = (xt_width (G)))) (PreH12 : (block_height = (xt_height (G)))) (PreH13 : (sizeof(UINT) = 4)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH17 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
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

Definition test_neon_safety_wit_52 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_width = 0)) (PreH2 : (block_height <> 0)) (PreH3 : (input_stride >= (unsigned_last_nbits ((block_width * sizeof(UINT) )) (64)))) (PreH4 : (block_height <> 1)) (PreH5 : (output_stride >= (unsigned_last_nbits ((block_height * sizeof(UINT) )) (64)))) (PreH6 : (block_width <> 1)) (PreH7 : (xt_valid F W G )) (PreH8 : (input = (xt_input (G)))) (PreH9 : (output = (xt_output_base (G)))) (PreH10 : (input_stride = (xt_input_stride (G)))) (PreH11 : (output_stride = (xt_output_stride (G)))) (PreH12 : (block_width = (xt_width (G)))) (PreH13 : (block_height = (xt_height (G)))) (PreH14 : (sizeof(UINT) = 4)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (sizeof(UINT64) = 8)) (PreH17 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH18 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
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

Definition test_neon_safety_wit_53 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_width = 0)) (PreH2 : (block_height <> 0)) (PreH3 : (block_height = 1)) (PreH4 : (output_stride >= (block_height * sizeof(UINT) ))) (PreH5 : (block_width <> 1)) (PreH6 : (xt_valid F W G )) (PreH7 : (input = (xt_input (G)))) (PreH8 : (output = (xt_output_base (G)))) (PreH9 : (input_stride = (xt_input_stride (G)))) (PreH10 : (output_stride = (xt_output_stride (G)))) (PreH11 : (block_width = (xt_width (G)))) (PreH12 : (block_height = (xt_height (G)))) (PreH13 : (sizeof(UINT) = 4)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH17 : (block_height = 1)) ,
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

Definition test_neon_safety_wit_54 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_width = 0)) (PreH2 : (block_height <> 0)) (PreH3 : (block_height = 1)) (PreH4 : (output_stride >= (unsigned_last_nbits ((block_height * sizeof(UINT) )) (64)))) (PreH5 : (block_width <> 1)) (PreH6 : (xt_valid F W G )) (PreH7 : (input = (xt_input (G)))) (PreH8 : (output = (xt_output_base (G)))) (PreH9 : (input_stride = (xt_input_stride (G)))) (PreH10 : (output_stride = (xt_output_stride (G)))) (PreH11 : (block_width = (xt_width (G)))) (PreH12 : (block_height = (xt_height (G)))) (PreH13 : (sizeof(UINT) = 4)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH17 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  ((( &( "tile_height" ) )) # UInt64  |->_)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> 1)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition test_neon_safety_wit_55 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_width = 0)) (PreH2 : (block_height <> 0)) (PreH3 : (input_stride >= (unsigned_last_nbits ((block_width * sizeof(UINT) )) (64)))) (PreH4 : (block_height <> 1)) (PreH5 : (output_stride >= (unsigned_last_nbits ((block_height * sizeof(UINT) )) (64)))) (PreH6 : (block_width <> 1)) (PreH7 : (xt_valid F W G )) (PreH8 : (input = (xt_input (G)))) (PreH9 : (output = (xt_output_base (G)))) (PreH10 : (input_stride = (xt_input_stride (G)))) (PreH11 : (output_stride = (xt_output_stride (G)))) (PreH12 : (block_width = (xt_width (G)))) (PreH13 : (block_height = (xt_height (G)))) (PreH14 : (sizeof(UINT) = 4)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (sizeof(UINT64) = 8)) (PreH17 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH18 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  ((( &( "tile_height" ) )) # UInt64  |->_)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> 1)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition test_neon_safety_wit_56 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_width = 0)) (PreH2 : (block_height <> 0)) (PreH3 : (block_height = 1)) (PreH4 : (output_stride >= (block_height * sizeof(UINT) ))) (PreH5 : (block_width <> 1)) (PreH6 : (xt_valid F W G )) (PreH7 : (input = (xt_input (G)))) (PreH8 : (output = (xt_output_base (G)))) (PreH9 : (input_stride = (xt_input_stride (G)))) (PreH10 : (output_stride = (xt_output_stride (G)))) (PreH11 : (block_width = (xt_width (G)))) (PreH12 : (block_height = (xt_height (G)))) (PreH13 : (sizeof(UINT) = 4)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH17 : (block_height = 1)) ,
  ((( &( "tile_height" ) )) # UInt64  |->_)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> 1)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition test_neon_safety_wit_57 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_width <> 0)) (PreH2 : (block_height <> 0)) (PreH3 : (block_height = 1)) (PreH4 : (block_width = 1)) (PreH5 : (xt_valid F W G )) (PreH6 : (input = (xt_input (G)))) (PreH7 : (output = (xt_output_base (G)))) (PreH8 : (input_stride = (xt_input_stride (G)))) (PreH9 : (output_stride = (xt_output_stride (G)))) (PreH10 : (block_width = (xt_width (G)))) (PreH11 : (block_height = (xt_height (G)))) (PreH12 : (sizeof(UINT) = 4)) (PreH13 : (sizeof(UINT64) = 8)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (block_width = 1)) (PreH16 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  ((( &( "tile_height" ) )) # UInt64  |->_)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition test_neon_safety_wit_58 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_width <> 0)) (PreH2 : (block_height <> 0)) (PreH3 : (input_stride >= (block_width * sizeof(UINT) ))) (PreH4 : (block_height <> 1)) (PreH5 : (block_width = 1)) (PreH6 : (xt_valid F W G )) (PreH7 : (input = (xt_input (G)))) (PreH8 : (output = (xt_output_base (G)))) (PreH9 : (input_stride = (xt_input_stride (G)))) (PreH10 : (output_stride = (xt_output_stride (G)))) (PreH11 : (block_width = (xt_width (G)))) (PreH12 : (block_height = (xt_height (G)))) (PreH13 : (sizeof(UINT) = 4)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (block_width = 1)) (PreH17 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  ((( &( "tile_height" ) )) # UInt64  |->_)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition test_neon_safety_wit_59 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_width <> 0)) (PreH2 : (block_height <> 0)) (PreH3 : (block_height = 1)) (PreH4 : (block_width = 1)) (PreH5 : (xt_valid F W G )) (PreH6 : (input = (xt_input (G)))) (PreH7 : (output = (xt_output_base (G)))) (PreH8 : (input_stride = (xt_input_stride (G)))) (PreH9 : (output_stride = (xt_output_stride (G)))) (PreH10 : (block_width = (xt_width (G)))) (PreH11 : (block_height = (xt_height (G)))) (PreH12 : (sizeof(UINT) = 4)) (PreH13 : (sizeof(UINT64) = 8)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (block_width = 1)) (PreH16 : (block_height = 1)) ,
  ((( &( "tile_height" ) )) # UInt64  |->_)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition test_neon_safety_wit_60 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_width <> 0)) (PreH2 : (block_height <> 0)) (PreH3 : (block_height = 1)) (PreH4 : (block_width = 1)) (PreH5 : (xt_valid F W G )) (PreH6 : (input = (xt_input (G)))) (PreH7 : (output = (xt_output_base (G)))) (PreH8 : (input_stride = (xt_input_stride (G)))) (PreH9 : (output_stride = (xt_output_stride (G)))) (PreH10 : (block_width = (xt_width (G)))) (PreH11 : (block_height = (xt_height (G)))) (PreH12 : (sizeof(UINT) = 4)) (PreH13 : (sizeof(UINT64) = 8)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH16 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  ((( &( "tile_height" ) )) # UInt64  |->_)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition test_neon_safety_wit_61 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_width <> 0)) (PreH2 : (block_height <> 0)) (PreH3 : (input_stride >= (block_width * sizeof(UINT) ))) (PreH4 : (block_height <> 1)) (PreH5 : (block_width = 1)) (PreH6 : (xt_valid F W G )) (PreH7 : (input = (xt_input (G)))) (PreH8 : (output = (xt_output_base (G)))) (PreH9 : (input_stride = (xt_input_stride (G)))) (PreH10 : (output_stride = (xt_output_stride (G)))) (PreH11 : (block_width = (xt_width (G)))) (PreH12 : (block_height = (xt_height (G)))) (PreH13 : (sizeof(UINT) = 4)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH17 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  ((( &( "tile_height" ) )) # UInt64  |->_)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition test_neon_safety_wit_62 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_width <> 0)) (PreH2 : (block_height <> 0)) (PreH3 : (block_height = 1)) (PreH4 : (output_stride >= (unsigned_last_nbits ((block_height * sizeof(UINT) )) (64)))) (PreH5 : (block_width <> 1)) (PreH6 : (xt_valid F W G )) (PreH7 : (input = (xt_input (G)))) (PreH8 : (output = (xt_output_base (G)))) (PreH9 : (input_stride = (xt_input_stride (G)))) (PreH10 : (output_stride = (xt_output_stride (G)))) (PreH11 : (block_width = (xt_width (G)))) (PreH12 : (block_height = (xt_height (G)))) (PreH13 : (sizeof(UINT) = 4)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH17 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  ((( &( "tile_height" ) )) # UInt64  |->_)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition test_neon_safety_wit_63 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_width <> 0)) (PreH2 : (block_height <> 0)) (PreH3 : (input_stride >= (unsigned_last_nbits ((block_width * sizeof(UINT) )) (64)))) (PreH4 : (block_height <> 1)) (PreH5 : (output_stride >= (unsigned_last_nbits ((block_height * sizeof(UINT) )) (64)))) (PreH6 : (block_width <> 1)) (PreH7 : (xt_valid F W G )) (PreH8 : (input = (xt_input (G)))) (PreH9 : (output = (xt_output_base (G)))) (PreH10 : (input_stride = (xt_input_stride (G)))) (PreH11 : (output_stride = (xt_output_stride (G)))) (PreH12 : (block_width = (xt_width (G)))) (PreH13 : (block_height = (xt_height (G)))) (PreH14 : (sizeof(UINT) = 4)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (sizeof(UINT64) = 8)) (PreH17 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH18 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  ((( &( "tile_height" ) )) # UInt64  |->_)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition test_neon_safety_wit_64 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_width <> 0)) (PreH2 : (block_height <> 0)) (PreH3 : (block_height = 1)) (PreH4 : (block_width = 1)) (PreH5 : (xt_valid F W G )) (PreH6 : (input = (xt_input (G)))) (PreH7 : (output = (xt_output_base (G)))) (PreH8 : (input_stride = (xt_input_stride (G)))) (PreH9 : (output_stride = (xt_output_stride (G)))) (PreH10 : (block_width = (xt_width (G)))) (PreH11 : (block_height = (xt_height (G)))) (PreH12 : (sizeof(UINT) = 4)) (PreH13 : (sizeof(UINT64) = 8)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH16 : (block_height = 1)) ,
  ((( &( "tile_height" ) )) # UInt64  |->_)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition test_neon_safety_wit_65 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_width <> 0)) (PreH2 : (block_height <> 0)) (PreH3 : (block_height = 1)) (PreH4 : (output_stride >= (block_height * sizeof(UINT) ))) (PreH5 : (block_width <> 1)) (PreH6 : (xt_valid F W G )) (PreH7 : (input = (xt_input (G)))) (PreH8 : (output = (xt_output_base (G)))) (PreH9 : (input_stride = (xt_input_stride (G)))) (PreH10 : (output_stride = (xt_output_stride (G)))) (PreH11 : (block_width = (xt_width (G)))) (PreH12 : (block_height = (xt_height (G)))) (PreH13 : (sizeof(UINT) = 4)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH17 : (block_height = 1)) ,
  ((( &( "tile_height" ) )) # UInt64  |->_)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition test_neon_safety_wit_66 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_width = 0)) (PreH2 : (block_height <> 0)) (PreH3 : (block_height = 1)) (PreH4 : (output_stride >= (unsigned_last_nbits ((block_height * sizeof(UINT) )) (64)))) (PreH5 : (block_width <> 1)) (PreH6 : (xt_valid F W G )) (PreH7 : (input = (xt_input (G)))) (PreH8 : (output = (xt_output_base (G)))) (PreH9 : (input_stride = (xt_input_stride (G)))) (PreH10 : (output_stride = (xt_output_stride (G)))) (PreH11 : (block_width = (xt_width (G)))) (PreH12 : (block_height = (xt_height (G)))) (PreH13 : (sizeof(UINT) = 4)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH17 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  ((( &( "tile_width" ) )) # UInt64  |->_)
  **  ((( &( "tile_height" ) )) # UInt64  |-> 2)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> 1)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition test_neon_safety_wit_67 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_width = 0)) (PreH2 : (block_height <> 0)) (PreH3 : (input_stride >= (unsigned_last_nbits ((block_width * sizeof(UINT) )) (64)))) (PreH4 : (block_height <> 1)) (PreH5 : (output_stride >= (unsigned_last_nbits ((block_height * sizeof(UINT) )) (64)))) (PreH6 : (block_width <> 1)) (PreH7 : (xt_valid F W G )) (PreH8 : (input = (xt_input (G)))) (PreH9 : (output = (xt_output_base (G)))) (PreH10 : (input_stride = (xt_input_stride (G)))) (PreH11 : (output_stride = (xt_output_stride (G)))) (PreH12 : (block_width = (xt_width (G)))) (PreH13 : (block_height = (xt_height (G)))) (PreH14 : (sizeof(UINT) = 4)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (sizeof(UINT64) = 8)) (PreH17 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH18 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  ((( &( "tile_width" ) )) # UInt64  |->_)
  **  ((( &( "tile_height" ) )) # UInt64  |-> 2)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> 1)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition test_neon_safety_wit_68 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_width = 0)) (PreH2 : (block_height <> 0)) (PreH3 : (block_height = 1)) (PreH4 : (output_stride >= (block_height * sizeof(UINT) ))) (PreH5 : (block_width <> 1)) (PreH6 : (xt_valid F W G )) (PreH7 : (input = (xt_input (G)))) (PreH8 : (output = (xt_output_base (G)))) (PreH9 : (input_stride = (xt_input_stride (G)))) (PreH10 : (output_stride = (xt_output_stride (G)))) (PreH11 : (block_width = (xt_width (G)))) (PreH12 : (block_height = (xt_height (G)))) (PreH13 : (sizeof(UINT) = 4)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH17 : (block_height = 1)) ,
  ((( &( "tile_width" ) )) # UInt64  |->_)
  **  ((( &( "tile_height" ) )) # UInt64  |-> 2)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> 1)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition test_neon_safety_wit_69 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_width <> 0)) (PreH2 : (block_height <> 0)) (PreH3 : (block_height = 1)) (PreH4 : (block_width = 1)) (PreH5 : (xt_valid F W G )) (PreH6 : (input = (xt_input (G)))) (PreH7 : (output = (xt_output_base (G)))) (PreH8 : (input_stride = (xt_input_stride (G)))) (PreH9 : (output_stride = (xt_output_stride (G)))) (PreH10 : (block_width = (xt_width (G)))) (PreH11 : (block_height = (xt_height (G)))) (PreH12 : (sizeof(UINT) = 4)) (PreH13 : (sizeof(UINT64) = 8)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (block_width = 1)) (PreH16 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  ((( &( "tile_width" ) )) # UInt64  |->_)
  **  ((( &( "tile_height" ) )) # UInt64  |-> 2)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition test_neon_safety_wit_70 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_width <> 0)) (PreH2 : (block_height <> 0)) (PreH3 : (input_stride >= (block_width * sizeof(UINT) ))) (PreH4 : (block_height <> 1)) (PreH5 : (block_width = 1)) (PreH6 : (xt_valid F W G )) (PreH7 : (input = (xt_input (G)))) (PreH8 : (output = (xt_output_base (G)))) (PreH9 : (input_stride = (xt_input_stride (G)))) (PreH10 : (output_stride = (xt_output_stride (G)))) (PreH11 : (block_width = (xt_width (G)))) (PreH12 : (block_height = (xt_height (G)))) (PreH13 : (sizeof(UINT) = 4)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (block_width = 1)) (PreH17 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  ((( &( "tile_width" ) )) # UInt64  |->_)
  **  ((( &( "tile_height" ) )) # UInt64  |-> 2)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition test_neon_safety_wit_71 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_width <> 0)) (PreH2 : (block_height <> 0)) (PreH3 : (block_height = 1)) (PreH4 : (block_width = 1)) (PreH5 : (xt_valid F W G )) (PreH6 : (input = (xt_input (G)))) (PreH7 : (output = (xt_output_base (G)))) (PreH8 : (input_stride = (xt_input_stride (G)))) (PreH9 : (output_stride = (xt_output_stride (G)))) (PreH10 : (block_width = (xt_width (G)))) (PreH11 : (block_height = (xt_height (G)))) (PreH12 : (sizeof(UINT) = 4)) (PreH13 : (sizeof(UINT64) = 8)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (block_width = 1)) (PreH16 : (block_height = 1)) ,
  ((( &( "tile_width" ) )) # UInt64  |->_)
  **  ((( &( "tile_height" ) )) # UInt64  |-> 2)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition test_neon_safety_wit_72 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_width <> 0)) (PreH2 : (block_height <> 0)) (PreH3 : (block_height = 1)) (PreH4 : (block_width = 1)) (PreH5 : (xt_valid F W G )) (PreH6 : (input = (xt_input (G)))) (PreH7 : (output = (xt_output_base (G)))) (PreH8 : (input_stride = (xt_input_stride (G)))) (PreH9 : (output_stride = (xt_output_stride (G)))) (PreH10 : (block_width = (xt_width (G)))) (PreH11 : (block_height = (xt_height (G)))) (PreH12 : (sizeof(UINT) = 4)) (PreH13 : (sizeof(UINT64) = 8)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH16 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  ((( &( "tile_width" ) )) # UInt64  |->_)
  **  ((( &( "tile_height" ) )) # UInt64  |-> 2)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition test_neon_safety_wit_73 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_width <> 0)) (PreH2 : (block_height <> 0)) (PreH3 : (input_stride >= (block_width * sizeof(UINT) ))) (PreH4 : (block_height <> 1)) (PreH5 : (block_width = 1)) (PreH6 : (xt_valid F W G )) (PreH7 : (input = (xt_input (G)))) (PreH8 : (output = (xt_output_base (G)))) (PreH9 : (input_stride = (xt_input_stride (G)))) (PreH10 : (output_stride = (xt_output_stride (G)))) (PreH11 : (block_width = (xt_width (G)))) (PreH12 : (block_height = (xt_height (G)))) (PreH13 : (sizeof(UINT) = 4)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH17 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  ((( &( "tile_width" ) )) # UInt64  |->_)
  **  ((( &( "tile_height" ) )) # UInt64  |-> 2)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition test_neon_safety_wit_74 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_width <> 0)) (PreH2 : (block_height <> 0)) (PreH3 : (block_height = 1)) (PreH4 : (output_stride >= (unsigned_last_nbits ((block_height * sizeof(UINT) )) (64)))) (PreH5 : (block_width <> 1)) (PreH6 : (xt_valid F W G )) (PreH7 : (input = (xt_input (G)))) (PreH8 : (output = (xt_output_base (G)))) (PreH9 : (input_stride = (xt_input_stride (G)))) (PreH10 : (output_stride = (xt_output_stride (G)))) (PreH11 : (block_width = (xt_width (G)))) (PreH12 : (block_height = (xt_height (G)))) (PreH13 : (sizeof(UINT) = 4)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH17 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  ((( &( "tile_width" ) )) # UInt64  |->_)
  **  ((( &( "tile_height" ) )) # UInt64  |-> 2)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition test_neon_safety_wit_75 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_width <> 0)) (PreH2 : (block_height <> 0)) (PreH3 : (input_stride >= (unsigned_last_nbits ((block_width * sizeof(UINT) )) (64)))) (PreH4 : (block_height <> 1)) (PreH5 : (output_stride >= (unsigned_last_nbits ((block_height * sizeof(UINT) )) (64)))) (PreH6 : (block_width <> 1)) (PreH7 : (xt_valid F W G )) (PreH8 : (input = (xt_input (G)))) (PreH9 : (output = (xt_output_base (G)))) (PreH10 : (input_stride = (xt_input_stride (G)))) (PreH11 : (output_stride = (xt_output_stride (G)))) (PreH12 : (block_width = (xt_width (G)))) (PreH13 : (block_height = (xt_height (G)))) (PreH14 : (sizeof(UINT) = 4)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (sizeof(UINT64) = 8)) (PreH17 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH18 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  ((( &( "tile_width" ) )) # UInt64  |->_)
  **  ((( &( "tile_height" ) )) # UInt64  |-> 2)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition test_neon_safety_wit_76 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_width <> 0)) (PreH2 : (block_height <> 0)) (PreH3 : (block_height = 1)) (PreH4 : (block_width = 1)) (PreH5 : (xt_valid F W G )) (PreH6 : (input = (xt_input (G)))) (PreH7 : (output = (xt_output_base (G)))) (PreH8 : (input_stride = (xt_input_stride (G)))) (PreH9 : (output_stride = (xt_output_stride (G)))) (PreH10 : (block_width = (xt_width (G)))) (PreH11 : (block_height = (xt_height (G)))) (PreH12 : (sizeof(UINT) = 4)) (PreH13 : (sizeof(UINT64) = 8)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH16 : (block_height = 1)) ,
  ((( &( "tile_width" ) )) # UInt64  |->_)
  **  ((( &( "tile_height" ) )) # UInt64  |-> 2)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition test_neon_safety_wit_77 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_width <> 0)) (PreH2 : (block_height <> 0)) (PreH3 : (block_height = 1)) (PreH4 : (output_stride >= (block_height * sizeof(UINT) ))) (PreH5 : (block_width <> 1)) (PreH6 : (xt_valid F W G )) (PreH7 : (input = (xt_input (G)))) (PreH8 : (output = (xt_output_base (G)))) (PreH9 : (input_stride = (xt_input_stride (G)))) (PreH10 : (output_stride = (xt_output_stride (G)))) (PreH11 : (block_width = (xt_width (G)))) (PreH12 : (block_height = (xt_height (G)))) (PreH13 : (sizeof(UINT) = 4)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH17 : (block_height = 1)) ,
  ((( &( "tile_width" ) )) # UInt64  |->_)
  **  ((( &( "tile_height" ) )) # UInt64  |-> 2)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition test_neon_safety_wit_78 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (retval: Z) (PreH1 : (retval = (xt_round_down (block_height) (2)))) (PreH2 : (block_width = 0)) (PreH3 : (block_height <> 0)) (PreH4 : (block_height = 1)) (PreH5 : (output_stride >= (unsigned_last_nbits ((block_height * sizeof(UINT) )) (64)))) (PreH6 : (block_width <> 1)) (PreH7 : (xt_valid F W G )) (PreH8 : (input = (xt_input (G)))) (PreH9 : (output = (xt_output_base (G)))) (PreH10 : (input_stride = (xt_input_stride (G)))) (PreH11 : (output_stride = (xt_output_stride (G)))) (PreH12 : (block_width = (xt_width (G)))) (PreH13 : (block_height = (xt_height (G)))) (PreH14 : (sizeof(UINT) = 4)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (sizeof(UINT64) = 8)) (PreH17 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH18 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  ((( &( "output_reset" ) )) # UInt64  |->_)
  **  ((( &( "input_offset" ) )) # UInt64  |-> (unsigned_last_nbits ((2 * input_stride )) (64)))
  **  ((( &( "input_reset" ) )) # UInt64  |-> (unsigned_last_nbits (((2 * sizeof(UINT) ) - (unsigned_last_nbits ((retval * input_stride )) (64)) )) (64)))
  **  ((( &( "tile_wbytes" ) )) # UInt64  |-> (2 * sizeof(UINT) ))
  **  ((( &( "tile_hbytes" ) )) # UInt64  |-> (2 * sizeof(UINT) ))
  **  ((( &( "tile_width" ) )) # UInt64  |-> 2)
  **  ((( &( "tile_height" ) )) # UInt64  |-> 2)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> 1)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition test_neon_safety_wit_79 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (retval: Z) (PreH1 : (retval = (xt_round_down (block_height) (2)))) (PreH2 : (block_width = 0)) (PreH3 : (block_height <> 0)) (PreH4 : (input_stride >= (unsigned_last_nbits ((block_width * sizeof(UINT) )) (64)))) (PreH5 : (block_height <> 1)) (PreH6 : (output_stride >= (unsigned_last_nbits ((block_height * sizeof(UINT) )) (64)))) (PreH7 : (block_width <> 1)) (PreH8 : (xt_valid F W G )) (PreH9 : (input = (xt_input (G)))) (PreH10 : (output = (xt_output_base (G)))) (PreH11 : (input_stride = (xt_input_stride (G)))) (PreH12 : (output_stride = (xt_output_stride (G)))) (PreH13 : (block_width = (xt_width (G)))) (PreH14 : (block_height = (xt_height (G)))) (PreH15 : (sizeof(UINT) = 4)) (PreH16 : (sizeof(UINT64) = 8)) (PreH17 : (sizeof(UINT64) = 8)) (PreH18 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH19 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  ((( &( "output_reset" ) )) # UInt64  |->_)
  **  ((( &( "input_offset" ) )) # UInt64  |-> (unsigned_last_nbits ((2 * input_stride )) (64)))
  **  ((( &( "input_reset" ) )) # UInt64  |-> (unsigned_last_nbits (((2 * sizeof(UINT) ) - (unsigned_last_nbits ((retval * input_stride )) (64)) )) (64)))
  **  ((( &( "tile_wbytes" ) )) # UInt64  |-> (2 * sizeof(UINT) ))
  **  ((( &( "tile_hbytes" ) )) # UInt64  |-> (2 * sizeof(UINT) ))
  **  ((( &( "tile_width" ) )) # UInt64  |-> 2)
  **  ((( &( "tile_height" ) )) # UInt64  |-> 2)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> 1)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition test_neon_safety_wit_80 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (retval: Z) (PreH1 : (retval = (xt_round_down (block_height) (2)))) (PreH2 : (block_width = 0)) (PreH3 : (block_height <> 0)) (PreH4 : (block_height = 1)) (PreH5 : (output_stride >= (block_height * sizeof(UINT) ))) (PreH6 : (block_width <> 1)) (PreH7 : (xt_valid F W G )) (PreH8 : (input = (xt_input (G)))) (PreH9 : (output = (xt_output_base (G)))) (PreH10 : (input_stride = (xt_input_stride (G)))) (PreH11 : (output_stride = (xt_output_stride (G)))) (PreH12 : (block_width = (xt_width (G)))) (PreH13 : (block_height = (xt_height (G)))) (PreH14 : (sizeof(UINT) = 4)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (sizeof(UINT64) = 8)) (PreH17 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH18 : (block_height = 1)) ,
  ((( &( "output_reset" ) )) # UInt64  |->_)
  **  ((( &( "input_offset" ) )) # UInt64  |-> (unsigned_last_nbits ((2 * input_stride )) (64)))
  **  ((( &( "input_reset" ) )) # UInt64  |-> (unsigned_last_nbits (((2 * sizeof(UINT) ) - (unsigned_last_nbits ((retval * input_stride )) (64)) )) (64)))
  **  ((( &( "tile_wbytes" ) )) # UInt64  |-> (2 * sizeof(UINT) ))
  **  ((( &( "tile_hbytes" ) )) # UInt64  |-> (2 * sizeof(UINT) ))
  **  ((( &( "tile_width" ) )) # UInt64  |-> 2)
  **  ((( &( "tile_height" ) )) # UInt64  |-> 2)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> 1)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition test_neon_safety_wit_81 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (retval: Z) (PreH1 : (retval = (xt_round_down (block_height) (2)))) (PreH2 : (block_width <> 0)) (PreH3 : (block_height <> 0)) (PreH4 : (block_height = 1)) (PreH5 : (block_width = 1)) (PreH6 : (xt_valid F W G )) (PreH7 : (input = (xt_input (G)))) (PreH8 : (output = (xt_output_base (G)))) (PreH9 : (input_stride = (xt_input_stride (G)))) (PreH10 : (output_stride = (xt_output_stride (G)))) (PreH11 : (block_width = (xt_width (G)))) (PreH12 : (block_height = (xt_height (G)))) (PreH13 : (sizeof(UINT) = 4)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (block_width = 1)) (PreH17 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  ((( &( "output_reset" ) )) # UInt64  |->_)
  **  ((( &( "input_offset" ) )) # UInt64  |-> (unsigned_last_nbits ((2 * input_stride )) (64)))
  **  ((( &( "input_reset" ) )) # UInt64  |-> (unsigned_last_nbits (((2 * sizeof(UINT) ) - (unsigned_last_nbits ((retval * input_stride )) (64)) )) (64)))
  **  ((( &( "tile_wbytes" ) )) # UInt64  |-> (2 * sizeof(UINT) ))
  **  ((( &( "tile_hbytes" ) )) # UInt64  |-> (2 * sizeof(UINT) ))
  **  ((( &( "tile_width" ) )) # UInt64  |-> 2)
  **  ((( &( "tile_height" ) )) # UInt64  |-> 2)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition test_neon_safety_wit_82 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (retval: Z) (PreH1 : (retval = (xt_round_down (block_height) (2)))) (PreH2 : (block_width <> 0)) (PreH3 : (block_height <> 0)) (PreH4 : (input_stride >= (block_width * sizeof(UINT) ))) (PreH5 : (block_height <> 1)) (PreH6 : (block_width = 1)) (PreH7 : (xt_valid F W G )) (PreH8 : (input = (xt_input (G)))) (PreH9 : (output = (xt_output_base (G)))) (PreH10 : (input_stride = (xt_input_stride (G)))) (PreH11 : (output_stride = (xt_output_stride (G)))) (PreH12 : (block_width = (xt_width (G)))) (PreH13 : (block_height = (xt_height (G)))) (PreH14 : (sizeof(UINT) = 4)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (sizeof(UINT64) = 8)) (PreH17 : (block_width = 1)) (PreH18 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  ((( &( "output_reset" ) )) # UInt64  |->_)
  **  ((( &( "input_offset" ) )) # UInt64  |-> (unsigned_last_nbits ((2 * input_stride )) (64)))
  **  ((( &( "input_reset" ) )) # UInt64  |-> (unsigned_last_nbits (((2 * sizeof(UINT) ) - (unsigned_last_nbits ((retval * input_stride )) (64)) )) (64)))
  **  ((( &( "tile_wbytes" ) )) # UInt64  |-> (2 * sizeof(UINT) ))
  **  ((( &( "tile_hbytes" ) )) # UInt64  |-> (2 * sizeof(UINT) ))
  **  ((( &( "tile_width" ) )) # UInt64  |-> 2)
  **  ((( &( "tile_height" ) )) # UInt64  |-> 2)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition test_neon_safety_wit_83 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (retval: Z) (PreH1 : (retval = (xt_round_down (block_height) (2)))) (PreH2 : (block_width <> 0)) (PreH3 : (block_height <> 0)) (PreH4 : (block_height = 1)) (PreH5 : (block_width = 1)) (PreH6 : (xt_valid F W G )) (PreH7 : (input = (xt_input (G)))) (PreH8 : (output = (xt_output_base (G)))) (PreH9 : (input_stride = (xt_input_stride (G)))) (PreH10 : (output_stride = (xt_output_stride (G)))) (PreH11 : (block_width = (xt_width (G)))) (PreH12 : (block_height = (xt_height (G)))) (PreH13 : (sizeof(UINT) = 4)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (block_width = 1)) (PreH17 : (block_height = 1)) ,
  ((( &( "output_reset" ) )) # UInt64  |->_)
  **  ((( &( "input_offset" ) )) # UInt64  |-> (unsigned_last_nbits ((2 * input_stride )) (64)))
  **  ((( &( "input_reset" ) )) # UInt64  |-> (unsigned_last_nbits (((2 * sizeof(UINT) ) - (unsigned_last_nbits ((retval * input_stride )) (64)) )) (64)))
  **  ((( &( "tile_wbytes" ) )) # UInt64  |-> (2 * sizeof(UINT) ))
  **  ((( &( "tile_hbytes" ) )) # UInt64  |-> (2 * sizeof(UINT) ))
  **  ((( &( "tile_width" ) )) # UInt64  |-> 2)
  **  ((( &( "tile_height" ) )) # UInt64  |-> 2)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition test_neon_safety_wit_84 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (retval: Z) (PreH1 : (retval = (xt_round_down (block_height) (2)))) (PreH2 : (block_width <> 0)) (PreH3 : (block_height <> 0)) (PreH4 : (block_height = 1)) (PreH5 : (block_width = 1)) (PreH6 : (xt_valid F W G )) (PreH7 : (input = (xt_input (G)))) (PreH8 : (output = (xt_output_base (G)))) (PreH9 : (input_stride = (xt_input_stride (G)))) (PreH10 : (output_stride = (xt_output_stride (G)))) (PreH11 : (block_width = (xt_width (G)))) (PreH12 : (block_height = (xt_height (G)))) (PreH13 : (sizeof(UINT) = 4)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH17 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  ((( &( "output_reset" ) )) # UInt64  |->_)
  **  ((( &( "input_offset" ) )) # UInt64  |-> (unsigned_last_nbits ((2 * input_stride )) (64)))
  **  ((( &( "input_reset" ) )) # UInt64  |-> (unsigned_last_nbits (((2 * sizeof(UINT) ) - (unsigned_last_nbits ((retval * input_stride )) (64)) )) (64)))
  **  ((( &( "tile_wbytes" ) )) # UInt64  |-> (2 * sizeof(UINT) ))
  **  ((( &( "tile_hbytes" ) )) # UInt64  |-> (2 * sizeof(UINT) ))
  **  ((( &( "tile_width" ) )) # UInt64  |-> 2)
  **  ((( &( "tile_height" ) )) # UInt64  |-> 2)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition test_neon_safety_wit_85 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (retval: Z) (PreH1 : (retval = (xt_round_down (block_height) (2)))) (PreH2 : (block_width <> 0)) (PreH3 : (block_height <> 0)) (PreH4 : (input_stride >= (block_width * sizeof(UINT) ))) (PreH5 : (block_height <> 1)) (PreH6 : (block_width = 1)) (PreH7 : (xt_valid F W G )) (PreH8 : (input = (xt_input (G)))) (PreH9 : (output = (xt_output_base (G)))) (PreH10 : (input_stride = (xt_input_stride (G)))) (PreH11 : (output_stride = (xt_output_stride (G)))) (PreH12 : (block_width = (xt_width (G)))) (PreH13 : (block_height = (xt_height (G)))) (PreH14 : (sizeof(UINT) = 4)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (sizeof(UINT64) = 8)) (PreH17 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH18 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  ((( &( "output_reset" ) )) # UInt64  |->_)
  **  ((( &( "input_offset" ) )) # UInt64  |-> (unsigned_last_nbits ((2 * input_stride )) (64)))
  **  ((( &( "input_reset" ) )) # UInt64  |-> (unsigned_last_nbits (((2 * sizeof(UINT) ) - (unsigned_last_nbits ((retval * input_stride )) (64)) )) (64)))
  **  ((( &( "tile_wbytes" ) )) # UInt64  |-> (2 * sizeof(UINT) ))
  **  ((( &( "tile_hbytes" ) )) # UInt64  |-> (2 * sizeof(UINT) ))
  **  ((( &( "tile_width" ) )) # UInt64  |-> 2)
  **  ((( &( "tile_height" ) )) # UInt64  |-> 2)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition test_neon_safety_wit_86 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (retval: Z) (PreH1 : (retval = (xt_round_down (block_height) (2)))) (PreH2 : (block_width <> 0)) (PreH3 : (block_height <> 0)) (PreH4 : (block_height = 1)) (PreH5 : (output_stride >= (unsigned_last_nbits ((block_height * sizeof(UINT) )) (64)))) (PreH6 : (block_width <> 1)) (PreH7 : (xt_valid F W G )) (PreH8 : (input = (xt_input (G)))) (PreH9 : (output = (xt_output_base (G)))) (PreH10 : (input_stride = (xt_input_stride (G)))) (PreH11 : (output_stride = (xt_output_stride (G)))) (PreH12 : (block_width = (xt_width (G)))) (PreH13 : (block_height = (xt_height (G)))) (PreH14 : (sizeof(UINT) = 4)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (sizeof(UINT64) = 8)) (PreH17 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH18 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  ((( &( "output_reset" ) )) # UInt64  |->_)
  **  ((( &( "input_offset" ) )) # UInt64  |-> (unsigned_last_nbits ((2 * input_stride )) (64)))
  **  ((( &( "input_reset" ) )) # UInt64  |-> (unsigned_last_nbits (((2 * sizeof(UINT) ) - (unsigned_last_nbits ((retval * input_stride )) (64)) )) (64)))
  **  ((( &( "tile_wbytes" ) )) # UInt64  |-> (2 * sizeof(UINT) ))
  **  ((( &( "tile_hbytes" ) )) # UInt64  |-> (2 * sizeof(UINT) ))
  **  ((( &( "tile_width" ) )) # UInt64  |-> 2)
  **  ((( &( "tile_height" ) )) # UInt64  |-> 2)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition test_neon_safety_wit_87 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (retval: Z) (PreH1 : (retval = (xt_round_down (block_height) (2)))) (PreH2 : (block_width <> 0)) (PreH3 : (block_height <> 0)) (PreH4 : (input_stride >= (unsigned_last_nbits ((block_width * sizeof(UINT) )) (64)))) (PreH5 : (block_height <> 1)) (PreH6 : (output_stride >= (unsigned_last_nbits ((block_height * sizeof(UINT) )) (64)))) (PreH7 : (block_width <> 1)) (PreH8 : (xt_valid F W G )) (PreH9 : (input = (xt_input (G)))) (PreH10 : (output = (xt_output_base (G)))) (PreH11 : (input_stride = (xt_input_stride (G)))) (PreH12 : (output_stride = (xt_output_stride (G)))) (PreH13 : (block_width = (xt_width (G)))) (PreH14 : (block_height = (xt_height (G)))) (PreH15 : (sizeof(UINT) = 4)) (PreH16 : (sizeof(UINT64) = 8)) (PreH17 : (sizeof(UINT64) = 8)) (PreH18 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH19 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  ((( &( "output_reset" ) )) # UInt64  |->_)
  **  ((( &( "input_offset" ) )) # UInt64  |-> (unsigned_last_nbits ((2 * input_stride )) (64)))
  **  ((( &( "input_reset" ) )) # UInt64  |-> (unsigned_last_nbits (((2 * sizeof(UINT) ) - (unsigned_last_nbits ((retval * input_stride )) (64)) )) (64)))
  **  ((( &( "tile_wbytes" ) )) # UInt64  |-> (2 * sizeof(UINT) ))
  **  ((( &( "tile_hbytes" ) )) # UInt64  |-> (2 * sizeof(UINT) ))
  **  ((( &( "tile_width" ) )) # UInt64  |-> 2)
  **  ((( &( "tile_height" ) )) # UInt64  |-> 2)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition test_neon_safety_wit_88 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (retval: Z) (PreH1 : (retval = (xt_round_down (block_height) (2)))) (PreH2 : (block_width <> 0)) (PreH3 : (block_height <> 0)) (PreH4 : (block_height = 1)) (PreH5 : (block_width = 1)) (PreH6 : (xt_valid F W G )) (PreH7 : (input = (xt_input (G)))) (PreH8 : (output = (xt_output_base (G)))) (PreH9 : (input_stride = (xt_input_stride (G)))) (PreH10 : (output_stride = (xt_output_stride (G)))) (PreH11 : (block_width = (xt_width (G)))) (PreH12 : (block_height = (xt_height (G)))) (PreH13 : (sizeof(UINT) = 4)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH17 : (block_height = 1)) ,
  ((( &( "output_reset" ) )) # UInt64  |->_)
  **  ((( &( "input_offset" ) )) # UInt64  |-> (unsigned_last_nbits ((2 * input_stride )) (64)))
  **  ((( &( "input_reset" ) )) # UInt64  |-> (unsigned_last_nbits (((2 * sizeof(UINT) ) - (unsigned_last_nbits ((retval * input_stride )) (64)) )) (64)))
  **  ((( &( "tile_wbytes" ) )) # UInt64  |-> (2 * sizeof(UINT) ))
  **  ((( &( "tile_hbytes" ) )) # UInt64  |-> (2 * sizeof(UINT) ))
  **  ((( &( "tile_width" ) )) # UInt64  |-> 2)
  **  ((( &( "tile_height" ) )) # UInt64  |-> 2)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition test_neon_safety_wit_89 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (retval: Z) (PreH1 : (retval = (xt_round_down (block_height) (2)))) (PreH2 : (block_width <> 0)) (PreH3 : (block_height <> 0)) (PreH4 : (block_height = 1)) (PreH5 : (output_stride >= (block_height * sizeof(UINT) ))) (PreH6 : (block_width <> 1)) (PreH7 : (xt_valid F W G )) (PreH8 : (input = (xt_input (G)))) (PreH9 : (output = (xt_output_base (G)))) (PreH10 : (input_stride = (xt_input_stride (G)))) (PreH11 : (output_stride = (xt_output_stride (G)))) (PreH12 : (block_width = (xt_width (G)))) (PreH13 : (block_height = (xt_height (G)))) (PreH14 : (sizeof(UINT) = 4)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (sizeof(UINT64) = 8)) (PreH17 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH18 : (block_height = 1)) ,
  ((( &( "output_reset" ) )) # UInt64  |->_)
  **  ((( &( "input_offset" ) )) # UInt64  |-> (unsigned_last_nbits ((2 * input_stride )) (64)))
  **  ((( &( "input_reset" ) )) # UInt64  |-> (unsigned_last_nbits (((2 * sizeof(UINT) ) - (unsigned_last_nbits ((retval * input_stride )) (64)) )) (64)))
  **  ((( &( "tile_wbytes" ) )) # UInt64  |-> (2 * sizeof(UINT) ))
  **  ((( &( "tile_hbytes" ) )) # UInt64  |-> (2 * sizeof(UINT) ))
  **  ((( &( "tile_width" ) )) # UInt64  |-> 2)
  **  ((( &( "tile_height" ) )) # UInt64  |-> 2)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition test_neon_safety_wit_90 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (R: XTOutput) (o1: Z) (o0: Z) (i1: Z) (i0: Z) (block_width: Z) (k: Z) (output_reset: Z) (input_offset: Z) (input_reset: Z) (tile_wbytes: Z) (tile_hbytes: Z) (tile_width: Z) (tile_height: Z) (block_height: Z) (output_stride: Z) (input_stride: Z) (output: Z) (input: Z) (PreH1 : (xt_valid F W G )) (PreH2 : (input = (xt_input (G)))) (PreH3 : (output = (xt_output_base (G)))) (PreH4 : (input_stride = (xt_input_stride (G)))) (PreH5 : (output_stride = (xt_output_stride (G)))) (PreH6 : (block_height = (xt_height (G)))) (PreH7 : (0 < block_height)) (PreH8 : (sizeof(UINT) = 4)) (PreH9 : (sizeof(UINT64) = 8)) (PreH10 : (sizeof(UINT64) = 8)) (PreH11 : (tile_height = 2)) (PreH12 : (tile_width = 2)) (PreH13 : (tile_hbytes = 8)) (PreH14 : (tile_wbytes = 8)) (PreH15 : (input_reset = (xt_neon_input_reset (G)))) (PreH16 : (input_offset = (xt_neon_input_offset (G)))) (PreH17 : (output_reset = (xt_neon_output_reset (G)))) (PreH18 : (0 <= k)) (PreH19 : (k <= ((xt_cols (G)) + 1 ))) (PreH20 : ((k % ( 2 ) ) = 0)) (PreH21 : (block_width = (xt_doz ((xt_cols (G))) (k)))) (PreH22 : (i0 = (xt_current_input (G) (k) (0)))) (PreH23 : (i1 = (xt_current_input (G) (k) (1)))) (PreH24 : (o0 = (xt_current_output (G) (k) (0)))) (PreH25 : (xt_neon_next G k block_width o1 )) (PreH26 : (xt_progress F G old R k 0 0 )) ,
  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  ((( &( "tile_height" ) )) # UInt64  |-> tile_height)
  **  ((( &( "tile_width" ) )) # UInt64  |-> tile_width)
  **  ((( &( "tile_hbytes" ) )) # UInt64  |-> tile_hbytes)
  **  ((( &( "tile_wbytes" ) )) # UInt64  |-> tile_wbytes)
  **  ((( &( "input_reset" ) )) # UInt64  |-> input_reset)
  **  ((( &( "input_offset" ) )) # UInt64  |-> input_offset)
  **  ((( &( "output_reset" ) )) # UInt64  |-> output_reset)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "i0" ) )) # Ptr  |-> i0)
  **  ((( &( "i1" ) )) # Ptr  |-> i1)
  **  ((( &( "o0" ) )) # Ptr  |-> o0)
  **  ((( &( "o1" ) )) # Ptr  |-> o1)
  **  (xt_data F )
  **  (xt_output W R )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition test_neon_safety_wit_91 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (R: XTOutput) (o1: Z) (o0: Z) (i1: Z) (i0: Z) (block_width: Z) (k: Z) (output_reset: Z) (input_offset: Z) (input_reset: Z) (tile_wbytes: Z) (tile_hbytes: Z) (tile_width: Z) (tile_height: Z) (block_height: Z) (output_stride: Z) (input_stride: Z) (output: Z) (input: Z) (PreH1 : (block_width <> 0)) (PreH2 : (xt_valid F W G )) (PreH3 : (input = (xt_input (G)))) (PreH4 : (output = (xt_output_base (G)))) (PreH5 : (input_stride = (xt_input_stride (G)))) (PreH6 : (output_stride = (xt_output_stride (G)))) (PreH7 : (block_height = (xt_height (G)))) (PreH8 : (0 < block_height)) (PreH9 : (sizeof(UINT) = 4)) (PreH10 : (sizeof(UINT64) = 8)) (PreH11 : (sizeof(UINT64) = 8)) (PreH12 : (tile_height = 2)) (PreH13 : (tile_width = 2)) (PreH14 : (tile_hbytes = 8)) (PreH15 : (tile_wbytes = 8)) (PreH16 : (input_reset = (xt_neon_input_reset (G)))) (PreH17 : (input_offset = (xt_neon_input_offset (G)))) (PreH18 : (output_reset = (xt_neon_output_reset (G)))) (PreH19 : (0 <= k)) (PreH20 : (k <= ((xt_cols (G)) + 1 ))) (PreH21 : ((k % ( 2 ) ) = 0)) (PreH22 : (block_width = (xt_doz ((xt_cols (G))) (k)))) (PreH23 : (i0 = (xt_current_input (G) (k) (0)))) (PreH24 : (i1 = (xt_current_input (G) (k) (1)))) (PreH25 : (o0 = (xt_current_output (G) (k) (0)))) (PreH26 : (xt_neon_next G k block_width o1 )) (PreH27 : (xt_progress F G old R k 0 0 )) ,
  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  ((( &( "tile_height" ) )) # UInt64  |-> tile_height)
  **  ((( &( "tile_width" ) )) # UInt64  |-> tile_width)
  **  ((( &( "tile_hbytes" ) )) # UInt64  |-> tile_hbytes)
  **  ((( &( "tile_wbytes" ) )) # UInt64  |-> tile_wbytes)
  **  ((( &( "input_reset" ) )) # UInt64  |-> input_reset)
  **  ((( &( "input_offset" ) )) # UInt64  |-> input_offset)
  **  ((( &( "output_reset" ) )) # UInt64  |-> output_reset)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "i0" ) )) # Ptr  |-> i0)
  **  ((( &( "i1" ) )) # Ptr  |-> i1)
  **  ((( &( "o0" ) )) # Ptr  |-> o0)
  **  ((( &( "o1" ) )) # Ptr  |-> o1)
  **  (xt_data F )
  **  (xt_output W R )
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition test_neon_safety_wit_92 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (R: XTOutput) (o1: Z) (o0: Z) (i1: Z) (i0: Z) (bh: Z) (block_width: Z) (k: Z) (output_reset: Z) (input_offset: Z) (input_reset: Z) (tile_wbytes: Z) (tile_hbytes: Z) (tile_width: Z) (tile_height: Z) (block_height: Z) (output_stride: Z) (input_stride: Z) (output: Z) (input: Z) (PreH1 : (xt_valid F W G )) (PreH2 : (input = (xt_input (G)))) (PreH3 : (output = (xt_output_base (G)))) (PreH4 : (input_stride = (xt_input_stride (G)))) (PreH5 : (output_stride = (xt_output_stride (G)))) (PreH6 : (block_height = (xt_height (G)))) (PreH7 : (0 < block_height)) (PreH8 : (sizeof(UINT) = 4)) (PreH9 : (sizeof(UINT64) = 8)) (PreH10 : (sizeof(UINT64) = 8)) (PreH11 : (tile_height = 2)) (PreH12 : (tile_width = 2)) (PreH13 : (tile_hbytes = 8)) (PreH14 : (tile_wbytes = 8)) (PreH15 : (input_reset = (xt_neon_input_reset (G)))) (PreH16 : (input_offset = (xt_neon_input_offset (G)))) (PreH17 : (output_reset = (xt_neon_output_reset (G)))) (PreH18 : (0 <= k)) (PreH19 : (k <= ((xt_cols (G)) + 1 ))) (PreH20 : ((k % ( 2 ) ) = 0)) (PreH21 : (block_width = (xt_doz ((xt_cols (G))) (k)))) (PreH22 : (0 < block_width)) (PreH23 : (k < (xt_cols (G)))) (PreH24 : (0 <= bh)) (PreH25 : (bh <= block_height)) (PreH26 : (((block_height - bh ) % ( 2 ) ) = 0)) (PreH27 : (i0 = (xt_current_input (G) (k) ((block_height - bh ))))) (PreH28 : (i1 = (xt_current_input (G) (k) (((block_height - bh ) + 1 ))))) (PreH29 : (o0 = (xt_current_output (G) (k) ((block_height - bh ))))) (PreH30 : (o1 = (xt_current_output (G) ((xt_neon_second (k) (block_width))) ((block_height - bh ))))) (PreH31 : (xt_progress F G old R k (xt_neon_batch (block_width)) (block_height - bh ) )) ,
  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  ((( &( "tile_height" ) )) # UInt64  |-> tile_height)
  **  ((( &( "tile_width" ) )) # UInt64  |-> tile_width)
  **  ((( &( "tile_hbytes" ) )) # UInt64  |-> tile_hbytes)
  **  ((( &( "tile_wbytes" ) )) # UInt64  |-> tile_wbytes)
  **  ((( &( "input_reset" ) )) # UInt64  |-> input_reset)
  **  ((( &( "input_offset" ) )) # UInt64  |-> input_offset)
  **  ((( &( "output_reset" ) )) # UInt64  |-> output_reset)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "bh" ) )) # UInt64  |-> bh)
  **  ((( &( "i0" ) )) # Ptr  |-> i0)
  **  ((( &( "i1" ) )) # Ptr  |-> i1)
  **  ((( &( "o0" ) )) # Ptr  |-> o0)
  **  ((( &( "o1" ) )) # Ptr  |-> o1)
  **  (xt_data F )
  **  (xt_output W R )
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition test_neon_safety_wit_93 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (R: XTOutput) (o1: Z) (o0: Z) (i1: Z) (i0: Z) (bh: Z) (block_width: Z) (k: Z) (output_reset: Z) (input_offset: Z) (input_reset: Z) (tile_wbytes: Z) (tile_hbytes: Z) (tile_width: Z) (tile_height: Z) (block_height: Z) (output_stride: Z) (input_stride: Z) (output: Z) (input: Z) (PreH1 : (bh >= 2)) (PreH2 : (xt_valid F W G )) (PreH3 : (input = (xt_input (G)))) (PreH4 : (output = (xt_output_base (G)))) (PreH5 : (input_stride = (xt_input_stride (G)))) (PreH6 : (output_stride = (xt_output_stride (G)))) (PreH7 : (block_height = (xt_height (G)))) (PreH8 : (0 < block_height)) (PreH9 : (sizeof(UINT) = 4)) (PreH10 : (sizeof(UINT64) = 8)) (PreH11 : (sizeof(UINT64) = 8)) (PreH12 : (tile_height = 2)) (PreH13 : (tile_width = 2)) (PreH14 : (tile_hbytes = 8)) (PreH15 : (tile_wbytes = 8)) (PreH16 : (input_reset = (xt_neon_input_reset (G)))) (PreH17 : (input_offset = (xt_neon_input_offset (G)))) (PreH18 : (output_reset = (xt_neon_output_reset (G)))) (PreH19 : (0 <= k)) (PreH20 : (k <= ((xt_cols (G)) + 1 ))) (PreH21 : ((k % ( 2 ) ) = 0)) (PreH22 : (block_width = (xt_doz ((xt_cols (G))) (k)))) (PreH23 : (0 < block_width)) (PreH24 : (k < (xt_cols (G)))) (PreH25 : (0 <= bh)) (PreH26 : (bh <= block_height)) (PreH27 : (((block_height - bh ) % ( 2 ) ) = 0)) (PreH28 : (i0 = (xt_current_input (G) (k) ((block_height - bh ))))) (PreH29 : (i1 = (xt_current_input (G) (k) (((block_height - bh ) + 1 ))))) (PreH30 : (o0 = (xt_current_output (G) (k) ((block_height - bh ))))) (PreH31 : (o1 = (xt_current_output (G) ((xt_neon_second (k) (block_width))) ((block_height - bh ))))) (PreH32 : (xt_progress F G old R k (xt_neon_batch (block_width)) (block_height - bh ) )) ,
  (xt_output W (xt_write_pair ((xt_write_pair (R) ((xt_current_output (G) ((xt_neon_second (k) (block_width))) ((block_height - bh )))) ((xt_load_lane (F) ((xt_current_input (G) (k) ((block_height - bh )))) (1))) ((xt_load_lane (F) ((xt_current_input (G) (k) (((block_height - bh ) + 1 )))) (1))))) (o0) ((xt_load_lane (F) (i0) (0))) ((xt_load_lane (F) (i1) (0)))) )
  **  (xt_data F )
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  ((( &( "tile_height" ) )) # UInt64  |-> tile_height)
  **  ((( &( "tile_width" ) )) # UInt64  |-> tile_width)
  **  ((( &( "tile_hbytes" ) )) # UInt64  |-> tile_hbytes)
  **  ((( &( "tile_wbytes" ) )) # UInt64  |-> tile_wbytes)
  **  ((( &( "input_reset" ) )) # UInt64  |-> input_reset)
  **  ((( &( "input_offset" ) )) # UInt64  |-> input_offset)
  **  ((( &( "output_reset" ) )) # UInt64  |-> output_reset)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "bh" ) )) # UInt64  |-> bh)
  **  ((( &( "i0" ) )) # Ptr  |-> (unsigned_last_nbits (((unsigned_last_nbits (i0) (64)) + input_offset )) (64)))
  **  ((( &( "i1" ) )) # Ptr  |-> (unsigned_last_nbits (((unsigned_last_nbits (i1) (64)) + input_offset )) (64)))
  **  ((( &( "o0" ) )) # Ptr  |-> (unsigned_last_nbits (((unsigned_last_nbits (o0) (64)) + tile_hbytes )) (64)))
  **  ((( &( "o1" ) )) # Ptr  |-> (unsigned_last_nbits (((unsigned_last_nbits (o1) (64)) + tile_hbytes )) (64)))
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition test_neon_safety_wit_94 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (R: XTOutput) (o1: Z) (o0: Z) (i1: Z) (i0: Z) (bh: Z) (block_width: Z) (k: Z) (output_reset: Z) (input_offset: Z) (input_reset: Z) (tile_wbytes: Z) (tile_hbytes: Z) (tile_width: Z) (tile_height: Z) (block_height: Z) (output_stride: Z) (input_stride: Z) (output: Z) (input: Z) (PreH1 : (bh < 2)) (PreH2 : (xt_valid F W G )) (PreH3 : (input = (xt_input (G)))) (PreH4 : (output = (xt_output_base (G)))) (PreH5 : (input_stride = (xt_input_stride (G)))) (PreH6 : (output_stride = (xt_output_stride (G)))) (PreH7 : (block_height = (xt_height (G)))) (PreH8 : (0 < block_height)) (PreH9 : (sizeof(UINT) = 4)) (PreH10 : (sizeof(UINT64) = 8)) (PreH11 : (sizeof(UINT64) = 8)) (PreH12 : (tile_height = 2)) (PreH13 : (tile_width = 2)) (PreH14 : (tile_hbytes = 8)) (PreH15 : (tile_wbytes = 8)) (PreH16 : (input_reset = (xt_neon_input_reset (G)))) (PreH17 : (input_offset = (xt_neon_input_offset (G)))) (PreH18 : (output_reset = (xt_neon_output_reset (G)))) (PreH19 : (0 <= k)) (PreH20 : (k <= ((xt_cols (G)) + 1 ))) (PreH21 : ((k % ( 2 ) ) = 0)) (PreH22 : (block_width = (xt_doz ((xt_cols (G))) (k)))) (PreH23 : (0 < block_width)) (PreH24 : (k < (xt_cols (G)))) (PreH25 : (0 <= bh)) (PreH26 : (bh <= block_height)) (PreH27 : (((block_height - bh ) % ( 2 ) ) = 0)) (PreH28 : (i0 = (xt_current_input (G) (k) ((block_height - bh ))))) (PreH29 : (i1 = (xt_current_input (G) (k) (((block_height - bh ) + 1 ))))) (PreH30 : (o0 = (xt_current_output (G) (k) ((block_height - bh ))))) (PreH31 : (o1 = (xt_current_output (G) ((xt_neon_second (k) (block_width))) ((block_height - bh ))))) (PreH32 : (xt_progress F G old R k (xt_neon_batch (block_width)) (block_height - bh ) )) ,
  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  ((( &( "tile_height" ) )) # UInt64  |-> tile_height)
  **  ((( &( "tile_width" ) )) # UInt64  |-> tile_width)
  **  ((( &( "tile_hbytes" ) )) # UInt64  |-> tile_hbytes)
  **  ((( &( "tile_wbytes" ) )) # UInt64  |-> tile_wbytes)
  **  ((( &( "input_reset" ) )) # UInt64  |-> input_reset)
  **  ((( &( "input_offset" ) )) # UInt64  |-> input_offset)
  **  ((( &( "output_reset" ) )) # UInt64  |-> output_reset)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "bh" ) )) # UInt64  |-> bh)
  **  ((( &( "i0" ) )) # Ptr  |-> i0)
  **  ((( &( "i1" ) )) # Ptr  |-> i1)
  **  ((( &( "o0" ) )) # Ptr  |-> o0)
  **  ((( &( "o1" ) )) # Ptr  |-> o1)
  **  (xt_data F )
  **  (xt_output W R )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition test_neon_safety_wit_95 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (R: XTOutput) (o1: Z) (o0: Z) (i1: Z) (i0: Z) (bh: Z) (block_width: Z) (k: Z) (output_reset: Z) (input_offset: Z) (input_reset: Z) (tile_wbytes: Z) (tile_hbytes: Z) (tile_width: Z) (tile_height: Z) (block_height: Z) (output_stride: Z) (input_stride: Z) (output: Z) (input: Z) (PreH1 : (bh <> 0)) (PreH2 : (bh < 2)) (PreH3 : (xt_valid F W G )) (PreH4 : (input = (xt_input (G)))) (PreH5 : (output = (xt_output_base (G)))) (PreH6 : (input_stride = (xt_input_stride (G)))) (PreH7 : (output_stride = (xt_output_stride (G)))) (PreH8 : (block_height = (xt_height (G)))) (PreH9 : (0 < block_height)) (PreH10 : (sizeof(UINT) = 4)) (PreH11 : (sizeof(UINT64) = 8)) (PreH12 : (sizeof(UINT64) = 8)) (PreH13 : (tile_height = 2)) (PreH14 : (tile_width = 2)) (PreH15 : (tile_hbytes = 8)) (PreH16 : (tile_wbytes = 8)) (PreH17 : (input_reset = (xt_neon_input_reset (G)))) (PreH18 : (input_offset = (xt_neon_input_offset (G)))) (PreH19 : (output_reset = (xt_neon_output_reset (G)))) (PreH20 : (0 <= k)) (PreH21 : (k <= ((xt_cols (G)) + 1 ))) (PreH22 : ((k % ( 2 ) ) = 0)) (PreH23 : (block_width = (xt_doz ((xt_cols (G))) (k)))) (PreH24 : (0 < block_width)) (PreH25 : (k < (xt_cols (G)))) (PreH26 : (0 <= bh)) (PreH27 : (bh <= block_height)) (PreH28 : (((block_height - bh ) % ( 2 ) ) = 0)) (PreH29 : (i0 = (xt_current_input (G) (k) ((block_height - bh ))))) (PreH30 : (i1 = (xt_current_input (G) (k) (((block_height - bh ) + 1 ))))) (PreH31 : (o0 = (xt_current_output (G) (k) ((block_height - bh ))))) (PreH32 : (o1 = (xt_current_output (G) ((xt_neon_second (k) (block_width))) ((block_height - bh ))))) (PreH33 : (xt_progress F G old R k (xt_neon_batch (block_width)) (block_height - bh ) )) ,
  (UndefStructPreduint32x2_t ( &( "v1_1" ) ) )
  **  ((&(( &( "v1_0" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (i0) (1)))
  **  ((&(( &( "v1_0" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (0)))
  **  (xt_data F )
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  ((( &( "tile_height" ) )) # UInt64  |-> tile_height)
  **  ((( &( "tile_width" ) )) # UInt64  |-> tile_width)
  **  ((( &( "tile_hbytes" ) )) # UInt64  |-> tile_hbytes)
  **  ((( &( "tile_wbytes" ) )) # UInt64  |-> tile_wbytes)
  **  ((( &( "input_reset" ) )) # UInt64  |-> input_reset)
  **  ((( &( "input_offset" ) )) # UInt64  |-> input_offset)
  **  ((( &( "output_reset" ) )) # UInt64  |-> output_reset)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "bh" ) )) # UInt64  |-> bh)
  **  ((( &( "i0" ) )) # Ptr  |-> i0)
  **  ((( &( "i1" ) )) # Ptr  |-> i1)
  **  ((( &( "o0" ) )) # Ptr  |-> o0)
  **  ((( &( "o1" ) )) # Ptr  |-> o1)
  **  (xt_output W R )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition test_neon_safety_wit_96 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (R: XTOutput) (o1: Z) (o0: Z) (i1: Z) (i0: Z) (bh: Z) (block_width: Z) (k: Z) (output_reset: Z) (input_offset: Z) (input_reset: Z) (tile_wbytes: Z) (tile_hbytes: Z) (tile_width: Z) (tile_height: Z) (block_height: Z) (output_stride: Z) (input_stride: Z) (output: Z) (input: Z) (PreH1 : (bh <> 0)) (PreH2 : (bh < 2)) (PreH3 : (xt_valid F W G )) (PreH4 : (input = (xt_input (G)))) (PreH5 : (output = (xt_output_base (G)))) (PreH6 : (input_stride = (xt_input_stride (G)))) (PreH7 : (output_stride = (xt_output_stride (G)))) (PreH8 : (block_height = (xt_height (G)))) (PreH9 : (0 < block_height)) (PreH10 : (sizeof(UINT) = 4)) (PreH11 : (sizeof(UINT64) = 8)) (PreH12 : (sizeof(UINT64) = 8)) (PreH13 : (tile_height = 2)) (PreH14 : (tile_width = 2)) (PreH15 : (tile_hbytes = 8)) (PreH16 : (tile_wbytes = 8)) (PreH17 : (input_reset = (xt_neon_input_reset (G)))) (PreH18 : (input_offset = (xt_neon_input_offset (G)))) (PreH19 : (output_reset = (xt_neon_output_reset (G)))) (PreH20 : (0 <= k)) (PreH21 : (k <= ((xt_cols (G)) + 1 ))) (PreH22 : ((k % ( 2 ) ) = 0)) (PreH23 : (block_width = (xt_doz ((xt_cols (G))) (k)))) (PreH24 : (0 < block_width)) (PreH25 : (k < (xt_cols (G)))) (PreH26 : (0 <= bh)) (PreH27 : (bh <= block_height)) (PreH28 : (((block_height - bh ) % ( 2 ) ) = 0)) (PreH29 : (i0 = (xt_current_input (G) (k) ((block_height - bh ))))) (PreH30 : (i1 = (xt_current_input (G) (k) (((block_height - bh ) + 1 ))))) (PreH31 : (o0 = (xt_current_output (G) (k) ((block_height - bh ))))) (PreH32 : (o1 = (xt_current_output (G) ((xt_neon_second (k) (block_width))) ((block_height - bh ))))) (PreH33 : (xt_progress F G old R k (xt_neon_batch (block_width)) (block_height - bh ) )) ,
  ((&(( &( "v1_low" ) )->ₛ "s1")) # UInt  |-> 0)
  **  ((&(( &( "v1_low" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (1)))
  **  ((&(( &( "v1_0" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (0)))
  **  ((&(( &( "v1_0" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (i0) (1)))
  **  ((&(( &( "v1_1" ) )->ₛ "s0")) # UInt  |-> 0)
  **  ((&(( &( "v1_1" ) )->ₛ "s1")) # UInt  |-> 0)
  **  ((&(( &( "v0_low" ) )->ₛ "s1")) # UInt  |-> 0)
  **  ((&(( &( "v0_low" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (0)))
  **  (xt_data F )
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  ((( &( "tile_height" ) )) # UInt64  |-> tile_height)
  **  ((( &( "tile_width" ) )) # UInt64  |-> tile_width)
  **  ((( &( "tile_hbytes" ) )) # UInt64  |-> tile_hbytes)
  **  ((( &( "tile_wbytes" ) )) # UInt64  |-> tile_wbytes)
  **  ((( &( "input_reset" ) )) # UInt64  |-> input_reset)
  **  ((( &( "input_offset" ) )) # UInt64  |-> input_offset)
  **  ((( &( "output_reset" ) )) # UInt64  |-> output_reset)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "bh" ) )) # UInt64  |-> bh)
  **  ((( &( "i0" ) )) # Ptr  |-> i0)
  **  ((( &( "i1" ) )) # Ptr  |-> i1)
  **  ((( &( "o0" ) )) # Ptr  |-> o0)
  **  ((( &( "o1" ) )) # Ptr  |-> o1)
  **  (xt_output W R )
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition test_neon_entail_wit_1 := 
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

Definition test_neon_entail_wit_2_1 := 
(
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (xt_round_down (block_height) (2)))) (PreH2 : (retval = (xt_round_down (block_height) (2)))) (PreH3 : (block_width = 0)) (PreH4 : (block_height <> 0)) (PreH5 : (block_height = 1)) (PreH6 : (output_stride >= (unsigned_last_nbits ((block_height * sizeof(UINT) )) (64)))) (PreH7 : (block_width <> 1)) (PreH8 : (xt_valid F W G )) (PreH9 : (input = (xt_input (G)))) (PreH10 : (output = (xt_output_base (G)))) (PreH11 : (input_stride = (xt_input_stride (G)))) (PreH12 : (output_stride = (xt_output_stride (G)))) (PreH13 : (block_width = (xt_width (G)))) (PreH14 : (block_height = (xt_height (G)))) (PreH15 : (sizeof(UINT) = 4)) (PreH16 : (sizeof(UINT64) = 8)) (PreH17 : (sizeof(UINT64) = 8)) (PreH18 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH19 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  (xt_data F )
  **  (xt_output W old )
|--
  EX (R: XTOutput)  (k: Z) ,
  “ (xt_valid F W G ) ” 
  &&  “ (input = (xt_input (G))) ” 
  &&  “ (output = (xt_output_base (G))) ” 
  &&  “ (input_stride = (xt_input_stride (G))) ” 
  &&  “ (output_stride = (xt_output_stride (G))) ” 
  &&  “ (block_height = (xt_height (G))) ” 
  &&  “ (0 < block_height) ” 
  &&  “ (sizeof(UINT) = 4) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (2 = 2) ” 
  &&  “ (2 = 2) ” 
  &&  “ ((2 * sizeof(UINT) ) = 8) ” 
  &&  “ ((2 * sizeof(UINT) ) = 8) ” 
  &&  “ ((unsigned_last_nbits (((2 * sizeof(UINT) ) - (unsigned_last_nbits ((retval * input_stride )) (64)) )) (64)) = (xt_neon_input_reset (G))) ” 
  &&  “ ((unsigned_last_nbits ((2 * input_stride )) (64)) = (xt_neon_input_offset (G))) ” 
  &&  “ ((unsigned_last_nbits (((unsigned_last_nbits ((2 * output_stride )) (64)) - (unsigned_last_nbits ((retval_2 * sizeof(UINT) )) (64)) )) (64)) = (xt_neon_output_reset (G))) ” 
  &&  “ (0 <= k) ” 
  &&  “ (k <= ((xt_cols (G)) + 1 )) ” 
  &&  “ ((k % ( 2 ) ) = 0) ” 
  &&  “ (1 = (xt_doz ((xt_cols (G))) (k))) ” 
  &&  “ (input = (xt_current_input (G) (k) (0))) ” 
  &&  “ ((unsigned_last_nbits (((unsigned_last_nbits (input) (64)) + input_stride )) (64)) = (xt_current_input (G) (k) (1))) ” 
  &&  “ (output = (xt_current_output (G) (k) (0))) ” 
  &&  “ (xt_neon_next G k 1 (unsigned_last_nbits (((unsigned_last_nbits (output) (64)) + output_stride )) (64)) ) ” 
  &&  “ (xt_progress F G old R k 0 0 ) ”
  &&  (xt_data F )
  **  (xt_output W R )
) \/
(
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (xt_round_down (block_height) (2)))) (PreH2 : (retval = (xt_round_down (block_height) (2)))) (PreH3 : (block_width = 0)) (PreH4 : (block_height <> 0)) (PreH5 : (block_height = 1)) (PreH6 : (output_stride >= (unsigned_last_nbits ((block_height * sizeof(UINT) )) (64)))) (PreH7 : (block_width <> 1)) (PreH8 : (xt_valid F W G )) (PreH9 : (input = (xt_input (G)))) (PreH10 : (output = (xt_output_base (G)))) (PreH11 : (input_stride = (xt_input_stride (G)))) (PreH12 : (output_stride = (xt_output_stride (G)))) (PreH13 : (block_width = (xt_width (G)))) (PreH14 : (block_height = (xt_height (G)))) (PreH15 : (sizeof(UINT) = 4)) (PreH16 : (sizeof(UINT64) = 8)) (PreH17 : (sizeof(UINT64) = 8)) (PreH18 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH19 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  TT && emp 
|--
  EX (k: Z) ,
  “ (0 < 1) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ ((2 * sizeof(UINT) ) = 8) ” 
  &&  “ ((2 * sizeof(UINT) ) = 8) ” 
  &&  “ ((unsigned_last_nbits (((2 * sizeof(UINT) ) - (unsigned_last_nbits (((xt_round_down (1) (2)) * (xt_input_stride (G)) )) (64)) )) (64)) = (xt_neon_input_reset (G))) ” 
  &&  “ ((unsigned_last_nbits ((2 * (xt_input_stride (G)) )) (64)) = (xt_neon_input_offset (G))) ” 
  &&  “ ((unsigned_last_nbits (((unsigned_last_nbits ((2 * (xt_output_stride (G)) )) (64)) - (unsigned_last_nbits (((xt_round_down (1) (2)) * sizeof(UINT) )) (64)) )) (64)) = (xt_neon_output_reset (G))) ” 
  &&  “ (0 <= k) ” 
  &&  “ (k <= ((xt_cols (G)) + 1 )) ” 
  &&  “ ((k % ( 2 ) ) = 0) ” 
  &&  “ (1 = (xt_doz ((xt_cols (G))) (k))) ” 
  &&  “ ((xt_input (G)) = (xt_current_input (G) (k) (0))) ” 
  &&  “ ((unsigned_last_nbits (((unsigned_last_nbits ((xt_input (G))) (64)) + (xt_input_stride (G)) )) (64)) = (xt_current_input (G) (k) (1))) ” 
  &&  “ ((xt_output_base (G)) = (xt_current_output (G) (k) (0))) ” 
  &&  “ (xt_neon_next G k 1 (unsigned_last_nbits (((unsigned_last_nbits ((xt_output_base (G))) (64)) + (xt_output_stride (G)) )) (64)) ) ” 
  &&  “ (xt_progress F G old old k 0 0 ) ”
  &&  emp
).

Definition test_neon_entail_wit_2_2 := 
(
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (xt_round_down (block_height) (2)))) (PreH2 : (retval = (xt_round_down (block_height) (2)))) (PreH3 : (block_width = 0)) (PreH4 : (block_height <> 0)) (PreH5 : (input_stride >= (unsigned_last_nbits ((block_width * sizeof(UINT) )) (64)))) (PreH6 : (block_height <> 1)) (PreH7 : (output_stride >= (unsigned_last_nbits ((block_height * sizeof(UINT) )) (64)))) (PreH8 : (block_width <> 1)) (PreH9 : (xt_valid F W G )) (PreH10 : (input = (xt_input (G)))) (PreH11 : (output = (xt_output_base (G)))) (PreH12 : (input_stride = (xt_input_stride (G)))) (PreH13 : (output_stride = (xt_output_stride (G)))) (PreH14 : (block_width = (xt_width (G)))) (PreH15 : (block_height = (xt_height (G)))) (PreH16 : (sizeof(UINT) = 4)) (PreH17 : (sizeof(UINT64) = 8)) (PreH18 : (sizeof(UINT64) = 8)) (PreH19 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH20 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  (xt_data F )
  **  (xt_output W old )
|--
  EX (R: XTOutput)  (k: Z) ,
  “ (xt_valid F W G ) ” 
  &&  “ (input = (xt_input (G))) ” 
  &&  “ (output = (xt_output_base (G))) ” 
  &&  “ (input_stride = (xt_input_stride (G))) ” 
  &&  “ (output_stride = (xt_output_stride (G))) ” 
  &&  “ (block_height = (xt_height (G))) ” 
  &&  “ (0 < block_height) ” 
  &&  “ (sizeof(UINT) = 4) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (2 = 2) ” 
  &&  “ (2 = 2) ” 
  &&  “ ((2 * sizeof(UINT) ) = 8) ” 
  &&  “ ((2 * sizeof(UINT) ) = 8) ” 
  &&  “ ((unsigned_last_nbits (((2 * sizeof(UINT) ) - (unsigned_last_nbits ((retval * input_stride )) (64)) )) (64)) = (xt_neon_input_reset (G))) ” 
  &&  “ ((unsigned_last_nbits ((2 * input_stride )) (64)) = (xt_neon_input_offset (G))) ” 
  &&  “ ((unsigned_last_nbits (((unsigned_last_nbits ((2 * output_stride )) (64)) - (unsigned_last_nbits ((retval_2 * sizeof(UINT) )) (64)) )) (64)) = (xt_neon_output_reset (G))) ” 
  &&  “ (0 <= k) ” 
  &&  “ (k <= ((xt_cols (G)) + 1 )) ” 
  &&  “ ((k % ( 2 ) ) = 0) ” 
  &&  “ (1 = (xt_doz ((xt_cols (G))) (k))) ” 
  &&  “ (input = (xt_current_input (G) (k) (0))) ” 
  &&  “ ((unsigned_last_nbits (((unsigned_last_nbits (input) (64)) + input_stride )) (64)) = (xt_current_input (G) (k) (1))) ” 
  &&  “ (output = (xt_current_output (G) (k) (0))) ” 
  &&  “ (xt_neon_next G k 1 (unsigned_last_nbits (((unsigned_last_nbits (output) (64)) + output_stride )) (64)) ) ” 
  &&  “ (xt_progress F G old R k 0 0 ) ”
  &&  (xt_data F )
  **  (xt_output W R )
) \/
(
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (xt_round_down (block_height) (2)))) (PreH2 : (retval = (xt_round_down (block_height) (2)))) (PreH3 : (block_width = 0)) (PreH4 : (block_height <> 0)) (PreH5 : (input_stride >= (unsigned_last_nbits ((block_width * sizeof(UINT) )) (64)))) (PreH6 : (block_height <> 1)) (PreH7 : (output_stride >= (unsigned_last_nbits ((block_height * sizeof(UINT) )) (64)))) (PreH8 : (block_width <> 1)) (PreH9 : (xt_valid F W G )) (PreH10 : (input = (xt_input (G)))) (PreH11 : (output = (xt_output_base (G)))) (PreH12 : (input_stride = (xt_input_stride (G)))) (PreH13 : (output_stride = (xt_output_stride (G)))) (PreH14 : (block_width = (xt_width (G)))) (PreH15 : (block_height = (xt_height (G)))) (PreH16 : (sizeof(UINT) = 4)) (PreH17 : (sizeof(UINT64) = 8)) (PreH18 : (sizeof(UINT64) = 8)) (PreH19 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH20 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  TT && emp 
|--
  EX (k: Z) ,
  “ (0 < (xt_height (G))) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ ((2 * sizeof(UINT) ) = 8) ” 
  &&  “ ((2 * sizeof(UINT) ) = 8) ” 
  &&  “ ((unsigned_last_nbits (((2 * sizeof(UINT) ) - (unsigned_last_nbits (((xt_round_down ((xt_height (G))) (2)) * (xt_input_stride (G)) )) (64)) )) (64)) = (xt_neon_input_reset (G))) ” 
  &&  “ ((unsigned_last_nbits ((2 * (xt_input_stride (G)) )) (64)) = (xt_neon_input_offset (G))) ” 
  &&  “ ((unsigned_last_nbits (((unsigned_last_nbits ((2 * (xt_output_stride (G)) )) (64)) - (unsigned_last_nbits (((xt_round_down ((xt_height (G))) (2)) * sizeof(UINT) )) (64)) )) (64)) = (xt_neon_output_reset (G))) ” 
  &&  “ (0 <= k) ” 
  &&  “ (k <= ((xt_cols (G)) + 1 )) ” 
  &&  “ ((k % ( 2 ) ) = 0) ” 
  &&  “ (1 = (xt_doz ((xt_cols (G))) (k))) ” 
  &&  “ ((xt_input (G)) = (xt_current_input (G) (k) (0))) ” 
  &&  “ ((unsigned_last_nbits (((unsigned_last_nbits ((xt_input (G))) (64)) + (xt_input_stride (G)) )) (64)) = (xt_current_input (G) (k) (1))) ” 
  &&  “ ((xt_output_base (G)) = (xt_current_output (G) (k) (0))) ” 
  &&  “ (xt_neon_next G k 1 (unsigned_last_nbits (((unsigned_last_nbits ((xt_output_base (G))) (64)) + (xt_output_stride (G)) )) (64)) ) ” 
  &&  “ (xt_progress F G old old k 0 0 ) ”
  &&  emp
).

Definition test_neon_entail_wit_2_3 := 
(
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (xt_round_down (block_height) (2)))) (PreH2 : (retval = (xt_round_down (block_height) (2)))) (PreH3 : (block_width = 0)) (PreH4 : (block_height <> 0)) (PreH5 : (block_height = 1)) (PreH6 : (output_stride >= (block_height * sizeof(UINT) ))) (PreH7 : (block_width <> 1)) (PreH8 : (xt_valid F W G )) (PreH9 : (input = (xt_input (G)))) (PreH10 : (output = (xt_output_base (G)))) (PreH11 : (input_stride = (xt_input_stride (G)))) (PreH12 : (output_stride = (xt_output_stride (G)))) (PreH13 : (block_width = (xt_width (G)))) (PreH14 : (block_height = (xt_height (G)))) (PreH15 : (sizeof(UINT) = 4)) (PreH16 : (sizeof(UINT64) = 8)) (PreH17 : (sizeof(UINT64) = 8)) (PreH18 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH19 : (block_height = 1)) ,
  (xt_data F )
  **  (xt_output W old )
|--
  EX (R: XTOutput)  (k: Z) ,
  “ (xt_valid F W G ) ” 
  &&  “ (input = (xt_input (G))) ” 
  &&  “ (output = (xt_output_base (G))) ” 
  &&  “ (input_stride = (xt_input_stride (G))) ” 
  &&  “ (output_stride = (xt_output_stride (G))) ” 
  &&  “ (block_height = (xt_height (G))) ” 
  &&  “ (0 < block_height) ” 
  &&  “ (sizeof(UINT) = 4) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (2 = 2) ” 
  &&  “ (2 = 2) ” 
  &&  “ ((2 * sizeof(UINT) ) = 8) ” 
  &&  “ ((2 * sizeof(UINT) ) = 8) ” 
  &&  “ ((unsigned_last_nbits (((2 * sizeof(UINT) ) - (unsigned_last_nbits ((retval * input_stride )) (64)) )) (64)) = (xt_neon_input_reset (G))) ” 
  &&  “ ((unsigned_last_nbits ((2 * input_stride )) (64)) = (xt_neon_input_offset (G))) ” 
  &&  “ ((unsigned_last_nbits (((unsigned_last_nbits ((2 * output_stride )) (64)) - (unsigned_last_nbits ((retval_2 * sizeof(UINT) )) (64)) )) (64)) = (xt_neon_output_reset (G))) ” 
  &&  “ (0 <= k) ” 
  &&  “ (k <= ((xt_cols (G)) + 1 )) ” 
  &&  “ ((k % ( 2 ) ) = 0) ” 
  &&  “ (1 = (xt_doz ((xt_cols (G))) (k))) ” 
  &&  “ (input = (xt_current_input (G) (k) (0))) ” 
  &&  “ ((unsigned_last_nbits (((unsigned_last_nbits (input) (64)) + input_stride )) (64)) = (xt_current_input (G) (k) (1))) ” 
  &&  “ (output = (xt_current_output (G) (k) (0))) ” 
  &&  “ (xt_neon_next G k 1 (unsigned_last_nbits (((unsigned_last_nbits (output) (64)) + output_stride )) (64)) ) ” 
  &&  “ (xt_progress F G old R k 0 0 ) ”
  &&  (xt_data F )
  **  (xt_output W R )
) \/
(
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (xt_round_down (block_height) (2)))) (PreH2 : (retval = (xt_round_down (block_height) (2)))) (PreH3 : (block_width = 0)) (PreH4 : (block_height <> 0)) (PreH5 : (block_height = 1)) (PreH6 : (output_stride >= (block_height * sizeof(UINT) ))) (PreH7 : (block_width <> 1)) (PreH8 : (xt_valid F W G )) (PreH9 : (input = (xt_input (G)))) (PreH10 : (output = (xt_output_base (G)))) (PreH11 : (input_stride = (xt_input_stride (G)))) (PreH12 : (output_stride = (xt_output_stride (G)))) (PreH13 : (block_width = (xt_width (G)))) (PreH14 : (block_height = (xt_height (G)))) (PreH15 : (sizeof(UINT) = 4)) (PreH16 : (sizeof(UINT64) = 8)) (PreH17 : (sizeof(UINT64) = 8)) (PreH18 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH19 : (block_height = 1)) ,
  TT && emp 
|--
  EX (k: Z) ,
  “ (0 < 1) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ ((2 * sizeof(UINT) ) = 8) ” 
  &&  “ ((2 * sizeof(UINT) ) = 8) ” 
  &&  “ ((unsigned_last_nbits (((2 * sizeof(UINT) ) - (unsigned_last_nbits (((xt_round_down (1) (2)) * (xt_input_stride (G)) )) (64)) )) (64)) = (xt_neon_input_reset (G))) ” 
  &&  “ ((unsigned_last_nbits ((2 * (xt_input_stride (G)) )) (64)) = (xt_neon_input_offset (G))) ” 
  &&  “ ((unsigned_last_nbits (((unsigned_last_nbits ((2 * (xt_output_stride (G)) )) (64)) - (unsigned_last_nbits (((xt_round_down (1) (2)) * sizeof(UINT) )) (64)) )) (64)) = (xt_neon_output_reset (G))) ” 
  &&  “ (0 <= k) ” 
  &&  “ (k <= ((xt_cols (G)) + 1 )) ” 
  &&  “ ((k % ( 2 ) ) = 0) ” 
  &&  “ (1 = (xt_doz ((xt_cols (G))) (k))) ” 
  &&  “ ((xt_input (G)) = (xt_current_input (G) (k) (0))) ” 
  &&  “ ((unsigned_last_nbits (((unsigned_last_nbits ((xt_input (G))) (64)) + (xt_input_stride (G)) )) (64)) = (xt_current_input (G) (k) (1))) ” 
  &&  “ ((xt_output_base (G)) = (xt_current_output (G) (k) (0))) ” 
  &&  “ (xt_neon_next G k 1 (unsigned_last_nbits (((unsigned_last_nbits ((xt_output_base (G))) (64)) + (xt_output_stride (G)) )) (64)) ) ” 
  &&  “ (xt_progress F G old old k 0 0 ) ”
  &&  emp
).

Definition test_neon_entail_wit_2_4 := 
(
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (xt_round_down (block_height) (2)))) (PreH2 : (retval = (xt_round_down (block_height) (2)))) (PreH3 : (block_width <> 0)) (PreH4 : (block_height <> 0)) (PreH5 : (block_height = 1)) (PreH6 : (block_width = 1)) (PreH7 : (xt_valid F W G )) (PreH8 : (input = (xt_input (G)))) (PreH9 : (output = (xt_output_base (G)))) (PreH10 : (input_stride = (xt_input_stride (G)))) (PreH11 : (output_stride = (xt_output_stride (G)))) (PreH12 : (block_width = (xt_width (G)))) (PreH13 : (block_height = (xt_height (G)))) (PreH14 : (sizeof(UINT) = 4)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (sizeof(UINT64) = 8)) (PreH17 : (block_width = 1)) (PreH18 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  (xt_data F )
  **  (xt_output W old )
|--
  EX (R: XTOutput)  (k: Z) ,
  “ (xt_valid F W G ) ” 
  &&  “ (input = (xt_input (G))) ” 
  &&  “ (output = (xt_output_base (G))) ” 
  &&  “ (input_stride = (xt_input_stride (G))) ” 
  &&  “ (output_stride = (xt_output_stride (G))) ” 
  &&  “ (block_height = (xt_height (G))) ” 
  &&  “ (0 < block_height) ” 
  &&  “ (sizeof(UINT) = 4) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (2 = 2) ” 
  &&  “ (2 = 2) ” 
  &&  “ ((2 * sizeof(UINT) ) = 8) ” 
  &&  “ ((2 * sizeof(UINT) ) = 8) ” 
  &&  “ ((unsigned_last_nbits (((2 * sizeof(UINT) ) - (unsigned_last_nbits ((retval * input_stride )) (64)) )) (64)) = (xt_neon_input_reset (G))) ” 
  &&  “ ((unsigned_last_nbits ((2 * input_stride )) (64)) = (xt_neon_input_offset (G))) ” 
  &&  “ ((unsigned_last_nbits (((unsigned_last_nbits ((2 * output_stride )) (64)) - (unsigned_last_nbits ((retval_2 * sizeof(UINT) )) (64)) )) (64)) = (xt_neon_output_reset (G))) ” 
  &&  “ (0 <= k) ” 
  &&  “ (k <= ((xt_cols (G)) + 1 )) ” 
  &&  “ ((k % ( 2 ) ) = 0) ” 
  &&  “ (block_width = (xt_doz ((xt_cols (G))) (k))) ” 
  &&  “ (input = (xt_current_input (G) (k) (0))) ” 
  &&  “ ((unsigned_last_nbits (((unsigned_last_nbits (input) (64)) + input_stride )) (64)) = (xt_current_input (G) (k) (1))) ” 
  &&  “ (output = (xt_current_output (G) (k) (0))) ” 
  &&  “ (xt_neon_next G k block_width (unsigned_last_nbits (((unsigned_last_nbits (output) (64)) + output_stride )) (64)) ) ” 
  &&  “ (xt_progress F G old R k 0 0 ) ”
  &&  (xt_data F )
  **  (xt_output W R )
) \/
(
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (xt_round_down (block_height) (2)))) (PreH2 : (retval = (xt_round_down (block_height) (2)))) (PreH3 : (block_width <> 0)) (PreH4 : (block_height <> 0)) (PreH5 : (block_height = 1)) (PreH6 : (block_width = 1)) (PreH7 : (xt_valid F W G )) (PreH8 : (input = (xt_input (G)))) (PreH9 : (output = (xt_output_base (G)))) (PreH10 : (input_stride = (xt_input_stride (G)))) (PreH11 : (output_stride = (xt_output_stride (G)))) (PreH12 : (block_width = (xt_width (G)))) (PreH13 : (block_height = (xt_height (G)))) (PreH14 : (sizeof(UINT) = 4)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (sizeof(UINT64) = 8)) (PreH17 : (block_width = 1)) (PreH18 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  TT && emp 
|--
  EX (k: Z) ,
  “ (0 < 1) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ ((2 * sizeof(UINT) ) = 8) ” 
  &&  “ ((2 * sizeof(UINT) ) = 8) ” 
  &&  “ ((unsigned_last_nbits (((2 * sizeof(UINT) ) - (unsigned_last_nbits (((xt_round_down (1) (2)) * (xt_input_stride (G)) )) (64)) )) (64)) = (xt_neon_input_reset (G))) ” 
  &&  “ ((unsigned_last_nbits ((2 * (xt_input_stride (G)) )) (64)) = (xt_neon_input_offset (G))) ” 
  &&  “ ((unsigned_last_nbits (((unsigned_last_nbits ((2 * (xt_output_stride (G)) )) (64)) - (unsigned_last_nbits (((xt_round_down (1) (2)) * sizeof(UINT) )) (64)) )) (64)) = (xt_neon_output_reset (G))) ” 
  &&  “ (0 <= k) ” 
  &&  “ (k <= ((xt_cols (G)) + 1 )) ” 
  &&  “ ((k % ( 2 ) ) = 0) ” 
  &&  “ (1 = (xt_doz ((xt_cols (G))) (k))) ” 
  &&  “ ((xt_input (G)) = (xt_current_input (G) (k) (0))) ” 
  &&  “ ((unsigned_last_nbits (((unsigned_last_nbits ((xt_input (G))) (64)) + (xt_input_stride (G)) )) (64)) = (xt_current_input (G) (k) (1))) ” 
  &&  “ ((xt_output_base (G)) = (xt_current_output (G) (k) (0))) ” 
  &&  “ (xt_neon_next G k 1 (unsigned_last_nbits (((unsigned_last_nbits ((xt_output_base (G))) (64)) + (xt_output_stride (G)) )) (64)) ) ” 
  &&  “ (xt_progress F G old old k 0 0 ) ”
  &&  emp
).

Definition test_neon_entail_wit_2_5 := 
(
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (xt_round_down (block_height) (2)))) (PreH2 : (retval = (xt_round_down (block_height) (2)))) (PreH3 : (block_width <> 0)) (PreH4 : (block_height <> 0)) (PreH5 : (input_stride >= (block_width * sizeof(UINT) ))) (PreH6 : (block_height <> 1)) (PreH7 : (block_width = 1)) (PreH8 : (xt_valid F W G )) (PreH9 : (input = (xt_input (G)))) (PreH10 : (output = (xt_output_base (G)))) (PreH11 : (input_stride = (xt_input_stride (G)))) (PreH12 : (output_stride = (xt_output_stride (G)))) (PreH13 : (block_width = (xt_width (G)))) (PreH14 : (block_height = (xt_height (G)))) (PreH15 : (sizeof(UINT) = 4)) (PreH16 : (sizeof(UINT64) = 8)) (PreH17 : (sizeof(UINT64) = 8)) (PreH18 : (block_width = 1)) (PreH19 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  (xt_data F )
  **  (xt_output W old )
|--
  EX (R: XTOutput)  (k: Z) ,
  “ (xt_valid F W G ) ” 
  &&  “ (input = (xt_input (G))) ” 
  &&  “ (output = (xt_output_base (G))) ” 
  &&  “ (input_stride = (xt_input_stride (G))) ” 
  &&  “ (output_stride = (xt_output_stride (G))) ” 
  &&  “ (block_height = (xt_height (G))) ” 
  &&  “ (0 < block_height) ” 
  &&  “ (sizeof(UINT) = 4) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (2 = 2) ” 
  &&  “ (2 = 2) ” 
  &&  “ ((2 * sizeof(UINT) ) = 8) ” 
  &&  “ ((2 * sizeof(UINT) ) = 8) ” 
  &&  “ ((unsigned_last_nbits (((2 * sizeof(UINT) ) - (unsigned_last_nbits ((retval * input_stride )) (64)) )) (64)) = (xt_neon_input_reset (G))) ” 
  &&  “ ((unsigned_last_nbits ((2 * input_stride )) (64)) = (xt_neon_input_offset (G))) ” 
  &&  “ ((unsigned_last_nbits (((unsigned_last_nbits ((2 * output_stride )) (64)) - (unsigned_last_nbits ((retval_2 * sizeof(UINT) )) (64)) )) (64)) = (xt_neon_output_reset (G))) ” 
  &&  “ (0 <= k) ” 
  &&  “ (k <= ((xt_cols (G)) + 1 )) ” 
  &&  “ ((k % ( 2 ) ) = 0) ” 
  &&  “ (block_width = (xt_doz ((xt_cols (G))) (k))) ” 
  &&  “ (input = (xt_current_input (G) (k) (0))) ” 
  &&  “ ((unsigned_last_nbits (((unsigned_last_nbits (input) (64)) + input_stride )) (64)) = (xt_current_input (G) (k) (1))) ” 
  &&  “ (output = (xt_current_output (G) (k) (0))) ” 
  &&  “ (xt_neon_next G k block_width (unsigned_last_nbits (((unsigned_last_nbits (output) (64)) + output_stride )) (64)) ) ” 
  &&  “ (xt_progress F G old R k 0 0 ) ”
  &&  (xt_data F )
  **  (xt_output W R )
) \/
(
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (xt_round_down (block_height) (2)))) (PreH2 : (retval = (xt_round_down (block_height) (2)))) (PreH3 : (block_width <> 0)) (PreH4 : (block_height <> 0)) (PreH5 : (input_stride >= (block_width * sizeof(UINT) ))) (PreH6 : (block_height <> 1)) (PreH7 : (block_width = 1)) (PreH8 : (xt_valid F W G )) (PreH9 : (input = (xt_input (G)))) (PreH10 : (output = (xt_output_base (G)))) (PreH11 : (input_stride = (xt_input_stride (G)))) (PreH12 : (output_stride = (xt_output_stride (G)))) (PreH13 : (block_width = (xt_width (G)))) (PreH14 : (block_height = (xt_height (G)))) (PreH15 : (sizeof(UINT) = 4)) (PreH16 : (sizeof(UINT64) = 8)) (PreH17 : (sizeof(UINT64) = 8)) (PreH18 : (block_width = 1)) (PreH19 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  TT && emp 
|--
  EX (k: Z) ,
  “ (0 < (xt_height (G))) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ ((2 * sizeof(UINT) ) = 8) ” 
  &&  “ ((2 * sizeof(UINT) ) = 8) ” 
  &&  “ ((unsigned_last_nbits (((2 * sizeof(UINT) ) - (unsigned_last_nbits (((xt_round_down ((xt_height (G))) (2)) * (xt_input_stride (G)) )) (64)) )) (64)) = (xt_neon_input_reset (G))) ” 
  &&  “ ((unsigned_last_nbits ((2 * (xt_input_stride (G)) )) (64)) = (xt_neon_input_offset (G))) ” 
  &&  “ ((unsigned_last_nbits (((unsigned_last_nbits ((2 * (xt_output_stride (G)) )) (64)) - (unsigned_last_nbits (((xt_round_down ((xt_height (G))) (2)) * sizeof(UINT) )) (64)) )) (64)) = (xt_neon_output_reset (G))) ” 
  &&  “ (0 <= k) ” 
  &&  “ (k <= ((xt_cols (G)) + 1 )) ” 
  &&  “ ((k % ( 2 ) ) = 0) ” 
  &&  “ (1 = (xt_doz ((xt_cols (G))) (k))) ” 
  &&  “ ((xt_input (G)) = (xt_current_input (G) (k) (0))) ” 
  &&  “ ((unsigned_last_nbits (((unsigned_last_nbits ((xt_input (G))) (64)) + (xt_input_stride (G)) )) (64)) = (xt_current_input (G) (k) (1))) ” 
  &&  “ ((xt_output_base (G)) = (xt_current_output (G) (k) (0))) ” 
  &&  “ (xt_neon_next G k 1 (unsigned_last_nbits (((unsigned_last_nbits ((xt_output_base (G))) (64)) + (xt_output_stride (G)) )) (64)) ) ” 
  &&  “ (xt_progress F G old old k 0 0 ) ”
  &&  emp
).

Definition test_neon_entail_wit_2_6 := 
(
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (xt_round_down (block_height) (2)))) (PreH2 : (retval = (xt_round_down (block_height) (2)))) (PreH3 : (block_width <> 0)) (PreH4 : (block_height <> 0)) (PreH5 : (block_height = 1)) (PreH6 : (block_width = 1)) (PreH7 : (xt_valid F W G )) (PreH8 : (input = (xt_input (G)))) (PreH9 : (output = (xt_output_base (G)))) (PreH10 : (input_stride = (xt_input_stride (G)))) (PreH11 : (output_stride = (xt_output_stride (G)))) (PreH12 : (block_width = (xt_width (G)))) (PreH13 : (block_height = (xt_height (G)))) (PreH14 : (sizeof(UINT) = 4)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (sizeof(UINT64) = 8)) (PreH17 : (block_width = 1)) (PreH18 : (block_height = 1)) ,
  (xt_data F )
  **  (xt_output W old )
|--
  EX (R: XTOutput)  (k: Z) ,
  “ (xt_valid F W G ) ” 
  &&  “ (input = (xt_input (G))) ” 
  &&  “ (output = (xt_output_base (G))) ” 
  &&  “ (input_stride = (xt_input_stride (G))) ” 
  &&  “ (output_stride = (xt_output_stride (G))) ” 
  &&  “ (block_height = (xt_height (G))) ” 
  &&  “ (0 < block_height) ” 
  &&  “ (sizeof(UINT) = 4) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (2 = 2) ” 
  &&  “ (2 = 2) ” 
  &&  “ ((2 * sizeof(UINT) ) = 8) ” 
  &&  “ ((2 * sizeof(UINT) ) = 8) ” 
  &&  “ ((unsigned_last_nbits (((2 * sizeof(UINT) ) - (unsigned_last_nbits ((retval * input_stride )) (64)) )) (64)) = (xt_neon_input_reset (G))) ” 
  &&  “ ((unsigned_last_nbits ((2 * input_stride )) (64)) = (xt_neon_input_offset (G))) ” 
  &&  “ ((unsigned_last_nbits (((unsigned_last_nbits ((2 * output_stride )) (64)) - (unsigned_last_nbits ((retval_2 * sizeof(UINT) )) (64)) )) (64)) = (xt_neon_output_reset (G))) ” 
  &&  “ (0 <= k) ” 
  &&  “ (k <= ((xt_cols (G)) + 1 )) ” 
  &&  “ ((k % ( 2 ) ) = 0) ” 
  &&  “ (block_width = (xt_doz ((xt_cols (G))) (k))) ” 
  &&  “ (input = (xt_current_input (G) (k) (0))) ” 
  &&  “ ((unsigned_last_nbits (((unsigned_last_nbits (input) (64)) + input_stride )) (64)) = (xt_current_input (G) (k) (1))) ” 
  &&  “ (output = (xt_current_output (G) (k) (0))) ” 
  &&  “ (xt_neon_next G k block_width (unsigned_last_nbits (((unsigned_last_nbits (output) (64)) + output_stride )) (64)) ) ” 
  &&  “ (xt_progress F G old R k 0 0 ) ”
  &&  (xt_data F )
  **  (xt_output W R )
) \/
(
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (xt_round_down (block_height) (2)))) (PreH2 : (retval = (xt_round_down (block_height) (2)))) (PreH3 : (block_width <> 0)) (PreH4 : (block_height <> 0)) (PreH5 : (block_height = 1)) (PreH6 : (block_width = 1)) (PreH7 : (xt_valid F W G )) (PreH8 : (input = (xt_input (G)))) (PreH9 : (output = (xt_output_base (G)))) (PreH10 : (input_stride = (xt_input_stride (G)))) (PreH11 : (output_stride = (xt_output_stride (G)))) (PreH12 : (block_width = (xt_width (G)))) (PreH13 : (block_height = (xt_height (G)))) (PreH14 : (sizeof(UINT) = 4)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (sizeof(UINT64) = 8)) (PreH17 : (block_width = 1)) (PreH18 : (block_height = 1)) ,
  TT && emp 
|--
  EX (k: Z) ,
  “ (0 < 1) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ ((2 * sizeof(UINT) ) = 8) ” 
  &&  “ ((2 * sizeof(UINT) ) = 8) ” 
  &&  “ ((unsigned_last_nbits (((2 * sizeof(UINT) ) - (unsigned_last_nbits (((xt_round_down (1) (2)) * (xt_input_stride (G)) )) (64)) )) (64)) = (xt_neon_input_reset (G))) ” 
  &&  “ ((unsigned_last_nbits ((2 * (xt_input_stride (G)) )) (64)) = (xt_neon_input_offset (G))) ” 
  &&  “ ((unsigned_last_nbits (((unsigned_last_nbits ((2 * (xt_output_stride (G)) )) (64)) - (unsigned_last_nbits (((xt_round_down (1) (2)) * sizeof(UINT) )) (64)) )) (64)) = (xt_neon_output_reset (G))) ” 
  &&  “ (0 <= k) ” 
  &&  “ (k <= ((xt_cols (G)) + 1 )) ” 
  &&  “ ((k % ( 2 ) ) = 0) ” 
  &&  “ (1 = (xt_doz ((xt_cols (G))) (k))) ” 
  &&  “ ((xt_input (G)) = (xt_current_input (G) (k) (0))) ” 
  &&  “ ((unsigned_last_nbits (((unsigned_last_nbits ((xt_input (G))) (64)) + (xt_input_stride (G)) )) (64)) = (xt_current_input (G) (k) (1))) ” 
  &&  “ ((xt_output_base (G)) = (xt_current_output (G) (k) (0))) ” 
  &&  “ (xt_neon_next G k 1 (unsigned_last_nbits (((unsigned_last_nbits ((xt_output_base (G))) (64)) + (xt_output_stride (G)) )) (64)) ) ” 
  &&  “ (xt_progress F G old old k 0 0 ) ”
  &&  emp
).

Definition test_neon_entail_wit_2_7 := 
(
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (xt_round_down (block_height) (2)))) (PreH2 : (retval = (xt_round_down (block_height) (2)))) (PreH3 : (block_width <> 0)) (PreH4 : (block_height <> 0)) (PreH5 : (block_height = 1)) (PreH6 : (block_width = 1)) (PreH7 : (xt_valid F W G )) (PreH8 : (input = (xt_input (G)))) (PreH9 : (output = (xt_output_base (G)))) (PreH10 : (input_stride = (xt_input_stride (G)))) (PreH11 : (output_stride = (xt_output_stride (G)))) (PreH12 : (block_width = (xt_width (G)))) (PreH13 : (block_height = (xt_height (G)))) (PreH14 : (sizeof(UINT) = 4)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (sizeof(UINT64) = 8)) (PreH17 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH18 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  (xt_data F )
  **  (xt_output W old )
|--
  EX (R: XTOutput)  (k: Z) ,
  “ (xt_valid F W G ) ” 
  &&  “ (input = (xt_input (G))) ” 
  &&  “ (output = (xt_output_base (G))) ” 
  &&  “ (input_stride = (xt_input_stride (G))) ” 
  &&  “ (output_stride = (xt_output_stride (G))) ” 
  &&  “ (block_height = (xt_height (G))) ” 
  &&  “ (0 < block_height) ” 
  &&  “ (sizeof(UINT) = 4) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (2 = 2) ” 
  &&  “ (2 = 2) ” 
  &&  “ ((2 * sizeof(UINT) ) = 8) ” 
  &&  “ ((2 * sizeof(UINT) ) = 8) ” 
  &&  “ ((unsigned_last_nbits (((2 * sizeof(UINT) ) - (unsigned_last_nbits ((retval * input_stride )) (64)) )) (64)) = (xt_neon_input_reset (G))) ” 
  &&  “ ((unsigned_last_nbits ((2 * input_stride )) (64)) = (xt_neon_input_offset (G))) ” 
  &&  “ ((unsigned_last_nbits (((unsigned_last_nbits ((2 * output_stride )) (64)) - (unsigned_last_nbits ((retval_2 * sizeof(UINT) )) (64)) )) (64)) = (xt_neon_output_reset (G))) ” 
  &&  “ (0 <= k) ” 
  &&  “ (k <= ((xt_cols (G)) + 1 )) ” 
  &&  “ ((k % ( 2 ) ) = 0) ” 
  &&  “ (block_width = (xt_doz ((xt_cols (G))) (k))) ” 
  &&  “ (input = (xt_current_input (G) (k) (0))) ” 
  &&  “ ((unsigned_last_nbits (((unsigned_last_nbits (input) (64)) + input_stride )) (64)) = (xt_current_input (G) (k) (1))) ” 
  &&  “ (output = (xt_current_output (G) (k) (0))) ” 
  &&  “ (xt_neon_next G k block_width (unsigned_last_nbits (((unsigned_last_nbits (output) (64)) + output_stride )) (64)) ) ” 
  &&  “ (xt_progress F G old R k 0 0 ) ”
  &&  (xt_data F )
  **  (xt_output W R )
) \/
(
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (xt_round_down (block_height) (2)))) (PreH2 : (retval = (xt_round_down (block_height) (2)))) (PreH3 : (block_width <> 0)) (PreH4 : (block_height <> 0)) (PreH5 : (block_height = 1)) (PreH6 : (block_width = 1)) (PreH7 : (xt_valid F W G )) (PreH8 : (input = (xt_input (G)))) (PreH9 : (output = (xt_output_base (G)))) (PreH10 : (input_stride = (xt_input_stride (G)))) (PreH11 : (output_stride = (xt_output_stride (G)))) (PreH12 : (block_width = (xt_width (G)))) (PreH13 : (block_height = (xt_height (G)))) (PreH14 : (sizeof(UINT) = 4)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (sizeof(UINT64) = 8)) (PreH17 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH18 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  TT && emp 
|--
  EX (k: Z) ,
  “ (0 < 1) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ ((2 * sizeof(UINT) ) = 8) ” 
  &&  “ ((2 * sizeof(UINT) ) = 8) ” 
  &&  “ ((unsigned_last_nbits (((2 * sizeof(UINT) ) - (unsigned_last_nbits (((xt_round_down (1) (2)) * (xt_input_stride (G)) )) (64)) )) (64)) = (xt_neon_input_reset (G))) ” 
  &&  “ ((unsigned_last_nbits ((2 * (xt_input_stride (G)) )) (64)) = (xt_neon_input_offset (G))) ” 
  &&  “ ((unsigned_last_nbits (((unsigned_last_nbits ((2 * (xt_output_stride (G)) )) (64)) - (unsigned_last_nbits (((xt_round_down (1) (2)) * sizeof(UINT) )) (64)) )) (64)) = (xt_neon_output_reset (G))) ” 
  &&  “ (0 <= k) ” 
  &&  “ (k <= ((xt_cols (G)) + 1 )) ” 
  &&  “ ((k % ( 2 ) ) = 0) ” 
  &&  “ (1 = (xt_doz ((xt_cols (G))) (k))) ” 
  &&  “ ((xt_input (G)) = (xt_current_input (G) (k) (0))) ” 
  &&  “ ((unsigned_last_nbits (((unsigned_last_nbits ((xt_input (G))) (64)) + (xt_input_stride (G)) )) (64)) = (xt_current_input (G) (k) (1))) ” 
  &&  “ ((xt_output_base (G)) = (xt_current_output (G) (k) (0))) ” 
  &&  “ (xt_neon_next G k 1 (unsigned_last_nbits (((unsigned_last_nbits ((xt_output_base (G))) (64)) + (xt_output_stride (G)) )) (64)) ) ” 
  &&  “ (xt_progress F G old old k 0 0 ) ”
  &&  emp
).

Definition test_neon_entail_wit_2_8 := 
(
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (xt_round_down (block_height) (2)))) (PreH2 : (retval = (xt_round_down (block_height) (2)))) (PreH3 : (block_width <> 0)) (PreH4 : (block_height <> 0)) (PreH5 : (input_stride >= (block_width * sizeof(UINT) ))) (PreH6 : (block_height <> 1)) (PreH7 : (block_width = 1)) (PreH8 : (xt_valid F W G )) (PreH9 : (input = (xt_input (G)))) (PreH10 : (output = (xt_output_base (G)))) (PreH11 : (input_stride = (xt_input_stride (G)))) (PreH12 : (output_stride = (xt_output_stride (G)))) (PreH13 : (block_width = (xt_width (G)))) (PreH14 : (block_height = (xt_height (G)))) (PreH15 : (sizeof(UINT) = 4)) (PreH16 : (sizeof(UINT64) = 8)) (PreH17 : (sizeof(UINT64) = 8)) (PreH18 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH19 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  (xt_data F )
  **  (xt_output W old )
|--
  EX (R: XTOutput)  (k: Z) ,
  “ (xt_valid F W G ) ” 
  &&  “ (input = (xt_input (G))) ” 
  &&  “ (output = (xt_output_base (G))) ” 
  &&  “ (input_stride = (xt_input_stride (G))) ” 
  &&  “ (output_stride = (xt_output_stride (G))) ” 
  &&  “ (block_height = (xt_height (G))) ” 
  &&  “ (0 < block_height) ” 
  &&  “ (sizeof(UINT) = 4) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (2 = 2) ” 
  &&  “ (2 = 2) ” 
  &&  “ ((2 * sizeof(UINT) ) = 8) ” 
  &&  “ ((2 * sizeof(UINT) ) = 8) ” 
  &&  “ ((unsigned_last_nbits (((2 * sizeof(UINT) ) - (unsigned_last_nbits ((retval * input_stride )) (64)) )) (64)) = (xt_neon_input_reset (G))) ” 
  &&  “ ((unsigned_last_nbits ((2 * input_stride )) (64)) = (xt_neon_input_offset (G))) ” 
  &&  “ ((unsigned_last_nbits (((unsigned_last_nbits ((2 * output_stride )) (64)) - (unsigned_last_nbits ((retval_2 * sizeof(UINT) )) (64)) )) (64)) = (xt_neon_output_reset (G))) ” 
  &&  “ (0 <= k) ” 
  &&  “ (k <= ((xt_cols (G)) + 1 )) ” 
  &&  “ ((k % ( 2 ) ) = 0) ” 
  &&  “ (block_width = (xt_doz ((xt_cols (G))) (k))) ” 
  &&  “ (input = (xt_current_input (G) (k) (0))) ” 
  &&  “ ((unsigned_last_nbits (((unsigned_last_nbits (input) (64)) + input_stride )) (64)) = (xt_current_input (G) (k) (1))) ” 
  &&  “ (output = (xt_current_output (G) (k) (0))) ” 
  &&  “ (xt_neon_next G k block_width (unsigned_last_nbits (((unsigned_last_nbits (output) (64)) + output_stride )) (64)) ) ” 
  &&  “ (xt_progress F G old R k 0 0 ) ”
  &&  (xt_data F )
  **  (xt_output W R )
) \/
(
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (xt_round_down (block_height) (2)))) (PreH2 : (retval = (xt_round_down (block_height) (2)))) (PreH3 : (block_width <> 0)) (PreH4 : (block_height <> 0)) (PreH5 : (input_stride >= (block_width * sizeof(UINT) ))) (PreH6 : (block_height <> 1)) (PreH7 : (block_width = 1)) (PreH8 : (xt_valid F W G )) (PreH9 : (input = (xt_input (G)))) (PreH10 : (output = (xt_output_base (G)))) (PreH11 : (input_stride = (xt_input_stride (G)))) (PreH12 : (output_stride = (xt_output_stride (G)))) (PreH13 : (block_width = (xt_width (G)))) (PreH14 : (block_height = (xt_height (G)))) (PreH15 : (sizeof(UINT) = 4)) (PreH16 : (sizeof(UINT64) = 8)) (PreH17 : (sizeof(UINT64) = 8)) (PreH18 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH19 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  TT && emp 
|--
  EX (k: Z) ,
  “ (0 < (xt_height (G))) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ ((2 * sizeof(UINT) ) = 8) ” 
  &&  “ ((2 * sizeof(UINT) ) = 8) ” 
  &&  “ ((unsigned_last_nbits (((2 * sizeof(UINT) ) - (unsigned_last_nbits (((xt_round_down ((xt_height (G))) (2)) * (xt_input_stride (G)) )) (64)) )) (64)) = (xt_neon_input_reset (G))) ” 
  &&  “ ((unsigned_last_nbits ((2 * (xt_input_stride (G)) )) (64)) = (xt_neon_input_offset (G))) ” 
  &&  “ ((unsigned_last_nbits (((unsigned_last_nbits ((2 * (xt_output_stride (G)) )) (64)) - (unsigned_last_nbits (((xt_round_down ((xt_height (G))) (2)) * sizeof(UINT) )) (64)) )) (64)) = (xt_neon_output_reset (G))) ” 
  &&  “ (0 <= k) ” 
  &&  “ (k <= ((xt_cols (G)) + 1 )) ” 
  &&  “ ((k % ( 2 ) ) = 0) ” 
  &&  “ (1 = (xt_doz ((xt_cols (G))) (k))) ” 
  &&  “ ((xt_input (G)) = (xt_current_input (G) (k) (0))) ” 
  &&  “ ((unsigned_last_nbits (((unsigned_last_nbits ((xt_input (G))) (64)) + (xt_input_stride (G)) )) (64)) = (xt_current_input (G) (k) (1))) ” 
  &&  “ ((xt_output_base (G)) = (xt_current_output (G) (k) (0))) ” 
  &&  “ (xt_neon_next G k 1 (unsigned_last_nbits (((unsigned_last_nbits ((xt_output_base (G))) (64)) + (xt_output_stride (G)) )) (64)) ) ” 
  &&  “ (xt_progress F G old old k 0 0 ) ”
  &&  emp
).

Definition test_neon_entail_wit_2_9 := 
(
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (xt_round_down (block_height) (2)))) (PreH2 : (retval = (xt_round_down (block_height) (2)))) (PreH3 : (block_width <> 0)) (PreH4 : (block_height <> 0)) (PreH5 : (block_height = 1)) (PreH6 : (output_stride >= (unsigned_last_nbits ((block_height * sizeof(UINT) )) (64)))) (PreH7 : (block_width <> 1)) (PreH8 : (xt_valid F W G )) (PreH9 : (input = (xt_input (G)))) (PreH10 : (output = (xt_output_base (G)))) (PreH11 : (input_stride = (xt_input_stride (G)))) (PreH12 : (output_stride = (xt_output_stride (G)))) (PreH13 : (block_width = (xt_width (G)))) (PreH14 : (block_height = (xt_height (G)))) (PreH15 : (sizeof(UINT) = 4)) (PreH16 : (sizeof(UINT64) = 8)) (PreH17 : (sizeof(UINT64) = 8)) (PreH18 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH19 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  (xt_data F )
  **  (xt_output W old )
|--
  EX (R: XTOutput)  (k: Z) ,
  “ (xt_valid F W G ) ” 
  &&  “ (input = (xt_input (G))) ” 
  &&  “ (output = (xt_output_base (G))) ” 
  &&  “ (input_stride = (xt_input_stride (G))) ” 
  &&  “ (output_stride = (xt_output_stride (G))) ” 
  &&  “ (block_height = (xt_height (G))) ” 
  &&  “ (0 < block_height) ” 
  &&  “ (sizeof(UINT) = 4) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (2 = 2) ” 
  &&  “ (2 = 2) ” 
  &&  “ ((2 * sizeof(UINT) ) = 8) ” 
  &&  “ ((2 * sizeof(UINT) ) = 8) ” 
  &&  “ ((unsigned_last_nbits (((2 * sizeof(UINT) ) - (unsigned_last_nbits ((retval * input_stride )) (64)) )) (64)) = (xt_neon_input_reset (G))) ” 
  &&  “ ((unsigned_last_nbits ((2 * input_stride )) (64)) = (xt_neon_input_offset (G))) ” 
  &&  “ ((unsigned_last_nbits (((unsigned_last_nbits ((2 * output_stride )) (64)) - (unsigned_last_nbits ((retval_2 * sizeof(UINT) )) (64)) )) (64)) = (xt_neon_output_reset (G))) ” 
  &&  “ (0 <= k) ” 
  &&  “ (k <= ((xt_cols (G)) + 1 )) ” 
  &&  “ ((k % ( 2 ) ) = 0) ” 
  &&  “ (block_width = (xt_doz ((xt_cols (G))) (k))) ” 
  &&  “ (input = (xt_current_input (G) (k) (0))) ” 
  &&  “ ((unsigned_last_nbits (((unsigned_last_nbits (input) (64)) + input_stride )) (64)) = (xt_current_input (G) (k) (1))) ” 
  &&  “ (output = (xt_current_output (G) (k) (0))) ” 
  &&  “ (xt_neon_next G k block_width (unsigned_last_nbits (((unsigned_last_nbits (output) (64)) + output_stride )) (64)) ) ” 
  &&  “ (xt_progress F G old R k 0 0 ) ”
  &&  (xt_data F )
  **  (xt_output W R )
) \/
(
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (xt_round_down (block_height) (2)))) (PreH2 : (retval = (xt_round_down (block_height) (2)))) (PreH3 : (block_width <> 0)) (PreH4 : (block_height <> 0)) (PreH5 : (block_height = 1)) (PreH6 : (output_stride >= (unsigned_last_nbits ((block_height * sizeof(UINT) )) (64)))) (PreH7 : (block_width <> 1)) (PreH8 : (xt_valid F W G )) (PreH9 : (input = (xt_input (G)))) (PreH10 : (output = (xt_output_base (G)))) (PreH11 : (input_stride = (xt_input_stride (G)))) (PreH12 : (output_stride = (xt_output_stride (G)))) (PreH13 : (block_width = (xt_width (G)))) (PreH14 : (block_height = (xt_height (G)))) (PreH15 : (sizeof(UINT) = 4)) (PreH16 : (sizeof(UINT64) = 8)) (PreH17 : (sizeof(UINT64) = 8)) (PreH18 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH19 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  TT && emp 
|--
  EX (k: Z) ,
  “ (0 < 1) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ ((2 * sizeof(UINT) ) = 8) ” 
  &&  “ ((2 * sizeof(UINT) ) = 8) ” 
  &&  “ ((unsigned_last_nbits (((2 * sizeof(UINT) ) - (unsigned_last_nbits (((xt_round_down (1) (2)) * (xt_input_stride (G)) )) (64)) )) (64)) = (xt_neon_input_reset (G))) ” 
  &&  “ ((unsigned_last_nbits ((2 * (xt_input_stride (G)) )) (64)) = (xt_neon_input_offset (G))) ” 
  &&  “ ((unsigned_last_nbits (((unsigned_last_nbits ((2 * (xt_output_stride (G)) )) (64)) - (unsigned_last_nbits (((xt_round_down (1) (2)) * sizeof(UINT) )) (64)) )) (64)) = (xt_neon_output_reset (G))) ” 
  &&  “ (0 <= k) ” 
  &&  “ (k <= ((xt_cols (G)) + 1 )) ” 
  &&  “ ((k % ( 2 ) ) = 0) ” 
  &&  “ ((xt_width (G)) = (xt_doz ((xt_cols (G))) (k))) ” 
  &&  “ ((xt_input (G)) = (xt_current_input (G) (k) (0))) ” 
  &&  “ ((unsigned_last_nbits (((unsigned_last_nbits ((xt_input (G))) (64)) + (xt_input_stride (G)) )) (64)) = (xt_current_input (G) (k) (1))) ” 
  &&  “ ((xt_output_base (G)) = (xt_current_output (G) (k) (0))) ” 
  &&  “ (xt_neon_next G k (xt_width (G)) (unsigned_last_nbits (((unsigned_last_nbits ((xt_output_base (G))) (64)) + (xt_output_stride (G)) )) (64)) ) ” 
  &&  “ (xt_progress F G old old k 0 0 ) ”
  &&  emp
).

Definition test_neon_entail_wit_2_10 := 
(
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (xt_round_down (block_height) (2)))) (PreH2 : (retval = (xt_round_down (block_height) (2)))) (PreH3 : (block_width <> 0)) (PreH4 : (block_height <> 0)) (PreH5 : (input_stride >= (unsigned_last_nbits ((block_width * sizeof(UINT) )) (64)))) (PreH6 : (block_height <> 1)) (PreH7 : (output_stride >= (unsigned_last_nbits ((block_height * sizeof(UINT) )) (64)))) (PreH8 : (block_width <> 1)) (PreH9 : (xt_valid F W G )) (PreH10 : (input = (xt_input (G)))) (PreH11 : (output = (xt_output_base (G)))) (PreH12 : (input_stride = (xt_input_stride (G)))) (PreH13 : (output_stride = (xt_output_stride (G)))) (PreH14 : (block_width = (xt_width (G)))) (PreH15 : (block_height = (xt_height (G)))) (PreH16 : (sizeof(UINT) = 4)) (PreH17 : (sizeof(UINT64) = 8)) (PreH18 : (sizeof(UINT64) = 8)) (PreH19 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH20 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  (xt_data F )
  **  (xt_output W old )
|--
  EX (R: XTOutput)  (k: Z) ,
  “ (xt_valid F W G ) ” 
  &&  “ (input = (xt_input (G))) ” 
  &&  “ (output = (xt_output_base (G))) ” 
  &&  “ (input_stride = (xt_input_stride (G))) ” 
  &&  “ (output_stride = (xt_output_stride (G))) ” 
  &&  “ (block_height = (xt_height (G))) ” 
  &&  “ (0 < block_height) ” 
  &&  “ (sizeof(UINT) = 4) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (2 = 2) ” 
  &&  “ (2 = 2) ” 
  &&  “ ((2 * sizeof(UINT) ) = 8) ” 
  &&  “ ((2 * sizeof(UINT) ) = 8) ” 
  &&  “ ((unsigned_last_nbits (((2 * sizeof(UINT) ) - (unsigned_last_nbits ((retval * input_stride )) (64)) )) (64)) = (xt_neon_input_reset (G))) ” 
  &&  “ ((unsigned_last_nbits ((2 * input_stride )) (64)) = (xt_neon_input_offset (G))) ” 
  &&  “ ((unsigned_last_nbits (((unsigned_last_nbits ((2 * output_stride )) (64)) - (unsigned_last_nbits ((retval_2 * sizeof(UINT) )) (64)) )) (64)) = (xt_neon_output_reset (G))) ” 
  &&  “ (0 <= k) ” 
  &&  “ (k <= ((xt_cols (G)) + 1 )) ” 
  &&  “ ((k % ( 2 ) ) = 0) ” 
  &&  “ (block_width = (xt_doz ((xt_cols (G))) (k))) ” 
  &&  “ (input = (xt_current_input (G) (k) (0))) ” 
  &&  “ ((unsigned_last_nbits (((unsigned_last_nbits (input) (64)) + input_stride )) (64)) = (xt_current_input (G) (k) (1))) ” 
  &&  “ (output = (xt_current_output (G) (k) (0))) ” 
  &&  “ (xt_neon_next G k block_width (unsigned_last_nbits (((unsigned_last_nbits (output) (64)) + output_stride )) (64)) ) ” 
  &&  “ (xt_progress F G old R k 0 0 ) ”
  &&  (xt_data F )
  **  (xt_output W R )
) \/
(
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (xt_round_down (block_height) (2)))) (PreH2 : (retval = (xt_round_down (block_height) (2)))) (PreH3 : (block_width <> 0)) (PreH4 : (block_height <> 0)) (PreH5 : (input_stride >= (unsigned_last_nbits ((block_width * sizeof(UINT) )) (64)))) (PreH6 : (block_height <> 1)) (PreH7 : (output_stride >= (unsigned_last_nbits ((block_height * sizeof(UINT) )) (64)))) (PreH8 : (block_width <> 1)) (PreH9 : (xt_valid F W G )) (PreH10 : (input = (xt_input (G)))) (PreH11 : (output = (xt_output_base (G)))) (PreH12 : (input_stride = (xt_input_stride (G)))) (PreH13 : (output_stride = (xt_output_stride (G)))) (PreH14 : (block_width = (xt_width (G)))) (PreH15 : (block_height = (xt_height (G)))) (PreH16 : (sizeof(UINT) = 4)) (PreH17 : (sizeof(UINT64) = 8)) (PreH18 : (sizeof(UINT64) = 8)) (PreH19 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH20 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  TT && emp 
|--
  EX (k: Z) ,
  “ (0 < (xt_height (G))) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ ((2 * sizeof(UINT) ) = 8) ” 
  &&  “ ((2 * sizeof(UINT) ) = 8) ” 
  &&  “ ((unsigned_last_nbits (((2 * sizeof(UINT) ) - (unsigned_last_nbits (((xt_round_down ((xt_height (G))) (2)) * (xt_input_stride (G)) )) (64)) )) (64)) = (xt_neon_input_reset (G))) ” 
  &&  “ ((unsigned_last_nbits ((2 * (xt_input_stride (G)) )) (64)) = (xt_neon_input_offset (G))) ” 
  &&  “ ((unsigned_last_nbits (((unsigned_last_nbits ((2 * (xt_output_stride (G)) )) (64)) - (unsigned_last_nbits (((xt_round_down ((xt_height (G))) (2)) * sizeof(UINT) )) (64)) )) (64)) = (xt_neon_output_reset (G))) ” 
  &&  “ (0 <= k) ” 
  &&  “ (k <= ((xt_cols (G)) + 1 )) ” 
  &&  “ ((k % ( 2 ) ) = 0) ” 
  &&  “ ((xt_width (G)) = (xt_doz ((xt_cols (G))) (k))) ” 
  &&  “ ((xt_input (G)) = (xt_current_input (G) (k) (0))) ” 
  &&  “ ((unsigned_last_nbits (((unsigned_last_nbits ((xt_input (G))) (64)) + (xt_input_stride (G)) )) (64)) = (xt_current_input (G) (k) (1))) ” 
  &&  “ ((xt_output_base (G)) = (xt_current_output (G) (k) (0))) ” 
  &&  “ (xt_neon_next G k (xt_width (G)) (unsigned_last_nbits (((unsigned_last_nbits ((xt_output_base (G))) (64)) + (xt_output_stride (G)) )) (64)) ) ” 
  &&  “ (xt_progress F G old old k 0 0 ) ”
  &&  emp
).

Definition test_neon_entail_wit_2_11 := 
(
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (xt_round_down (block_height) (2)))) (PreH2 : (retval = (xt_round_down (block_height) (2)))) (PreH3 : (block_width <> 0)) (PreH4 : (block_height <> 0)) (PreH5 : (block_height = 1)) (PreH6 : (block_width = 1)) (PreH7 : (xt_valid F W G )) (PreH8 : (input = (xt_input (G)))) (PreH9 : (output = (xt_output_base (G)))) (PreH10 : (input_stride = (xt_input_stride (G)))) (PreH11 : (output_stride = (xt_output_stride (G)))) (PreH12 : (block_width = (xt_width (G)))) (PreH13 : (block_height = (xt_height (G)))) (PreH14 : (sizeof(UINT) = 4)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (sizeof(UINT64) = 8)) (PreH17 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH18 : (block_height = 1)) ,
  (xt_data F )
  **  (xt_output W old )
|--
  EX (R: XTOutput)  (k: Z) ,
  “ (xt_valid F W G ) ” 
  &&  “ (input = (xt_input (G))) ” 
  &&  “ (output = (xt_output_base (G))) ” 
  &&  “ (input_stride = (xt_input_stride (G))) ” 
  &&  “ (output_stride = (xt_output_stride (G))) ” 
  &&  “ (block_height = (xt_height (G))) ” 
  &&  “ (0 < block_height) ” 
  &&  “ (sizeof(UINT) = 4) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (2 = 2) ” 
  &&  “ (2 = 2) ” 
  &&  “ ((2 * sizeof(UINT) ) = 8) ” 
  &&  “ ((2 * sizeof(UINT) ) = 8) ” 
  &&  “ ((unsigned_last_nbits (((2 * sizeof(UINT) ) - (unsigned_last_nbits ((retval * input_stride )) (64)) )) (64)) = (xt_neon_input_reset (G))) ” 
  &&  “ ((unsigned_last_nbits ((2 * input_stride )) (64)) = (xt_neon_input_offset (G))) ” 
  &&  “ ((unsigned_last_nbits (((unsigned_last_nbits ((2 * output_stride )) (64)) - (unsigned_last_nbits ((retval_2 * sizeof(UINT) )) (64)) )) (64)) = (xt_neon_output_reset (G))) ” 
  &&  “ (0 <= k) ” 
  &&  “ (k <= ((xt_cols (G)) + 1 )) ” 
  &&  “ ((k % ( 2 ) ) = 0) ” 
  &&  “ (block_width = (xt_doz ((xt_cols (G))) (k))) ” 
  &&  “ (input = (xt_current_input (G) (k) (0))) ” 
  &&  “ ((unsigned_last_nbits (((unsigned_last_nbits (input) (64)) + input_stride )) (64)) = (xt_current_input (G) (k) (1))) ” 
  &&  “ (output = (xt_current_output (G) (k) (0))) ” 
  &&  “ (xt_neon_next G k block_width (unsigned_last_nbits (((unsigned_last_nbits (output) (64)) + output_stride )) (64)) ) ” 
  &&  “ (xt_progress F G old R k 0 0 ) ”
  &&  (xt_data F )
  **  (xt_output W R )
) \/
(
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (xt_round_down (block_height) (2)))) (PreH2 : (retval = (xt_round_down (block_height) (2)))) (PreH3 : (block_width <> 0)) (PreH4 : (block_height <> 0)) (PreH5 : (block_height = 1)) (PreH6 : (block_width = 1)) (PreH7 : (xt_valid F W G )) (PreH8 : (input = (xt_input (G)))) (PreH9 : (output = (xt_output_base (G)))) (PreH10 : (input_stride = (xt_input_stride (G)))) (PreH11 : (output_stride = (xt_output_stride (G)))) (PreH12 : (block_width = (xt_width (G)))) (PreH13 : (block_height = (xt_height (G)))) (PreH14 : (sizeof(UINT) = 4)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (sizeof(UINT64) = 8)) (PreH17 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH18 : (block_height = 1)) ,
  TT && emp 
|--
  EX (k: Z) ,
  “ (0 < 1) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ ((2 * sizeof(UINT) ) = 8) ” 
  &&  “ ((2 * sizeof(UINT) ) = 8) ” 
  &&  “ ((unsigned_last_nbits (((2 * sizeof(UINT) ) - (unsigned_last_nbits (((xt_round_down (1) (2)) * (xt_input_stride (G)) )) (64)) )) (64)) = (xt_neon_input_reset (G))) ” 
  &&  “ ((unsigned_last_nbits ((2 * (xt_input_stride (G)) )) (64)) = (xt_neon_input_offset (G))) ” 
  &&  “ ((unsigned_last_nbits (((unsigned_last_nbits ((2 * (xt_output_stride (G)) )) (64)) - (unsigned_last_nbits (((xt_round_down (1) (2)) * sizeof(UINT) )) (64)) )) (64)) = (xt_neon_output_reset (G))) ” 
  &&  “ (0 <= k) ” 
  &&  “ (k <= ((xt_cols (G)) + 1 )) ” 
  &&  “ ((k % ( 2 ) ) = 0) ” 
  &&  “ (1 = (xt_doz ((xt_cols (G))) (k))) ” 
  &&  “ ((xt_input (G)) = (xt_current_input (G) (k) (0))) ” 
  &&  “ ((unsigned_last_nbits (((unsigned_last_nbits ((xt_input (G))) (64)) + (xt_input_stride (G)) )) (64)) = (xt_current_input (G) (k) (1))) ” 
  &&  “ ((xt_output_base (G)) = (xt_current_output (G) (k) (0))) ” 
  &&  “ (xt_neon_next G k 1 (unsigned_last_nbits (((unsigned_last_nbits ((xt_output_base (G))) (64)) + (xt_output_stride (G)) )) (64)) ) ” 
  &&  “ (xt_progress F G old old k 0 0 ) ”
  &&  emp
).

Definition test_neon_entail_wit_2_12 := 
(
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (xt_round_down (block_height) (2)))) (PreH2 : (retval = (xt_round_down (block_height) (2)))) (PreH3 : (block_width <> 0)) (PreH4 : (block_height <> 0)) (PreH5 : (block_height = 1)) (PreH6 : (output_stride >= (block_height * sizeof(UINT) ))) (PreH7 : (block_width <> 1)) (PreH8 : (xt_valid F W G )) (PreH9 : (input = (xt_input (G)))) (PreH10 : (output = (xt_output_base (G)))) (PreH11 : (input_stride = (xt_input_stride (G)))) (PreH12 : (output_stride = (xt_output_stride (G)))) (PreH13 : (block_width = (xt_width (G)))) (PreH14 : (block_height = (xt_height (G)))) (PreH15 : (sizeof(UINT) = 4)) (PreH16 : (sizeof(UINT64) = 8)) (PreH17 : (sizeof(UINT64) = 8)) (PreH18 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH19 : (block_height = 1)) ,
  (xt_data F )
  **  (xt_output W old )
|--
  EX (R: XTOutput)  (k: Z) ,
  “ (xt_valid F W G ) ” 
  &&  “ (input = (xt_input (G))) ” 
  &&  “ (output = (xt_output_base (G))) ” 
  &&  “ (input_stride = (xt_input_stride (G))) ” 
  &&  “ (output_stride = (xt_output_stride (G))) ” 
  &&  “ (block_height = (xt_height (G))) ” 
  &&  “ (0 < block_height) ” 
  &&  “ (sizeof(UINT) = 4) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (2 = 2) ” 
  &&  “ (2 = 2) ” 
  &&  “ ((2 * sizeof(UINT) ) = 8) ” 
  &&  “ ((2 * sizeof(UINT) ) = 8) ” 
  &&  “ ((unsigned_last_nbits (((2 * sizeof(UINT) ) - (unsigned_last_nbits ((retval * input_stride )) (64)) )) (64)) = (xt_neon_input_reset (G))) ” 
  &&  “ ((unsigned_last_nbits ((2 * input_stride )) (64)) = (xt_neon_input_offset (G))) ” 
  &&  “ ((unsigned_last_nbits (((unsigned_last_nbits ((2 * output_stride )) (64)) - (unsigned_last_nbits ((retval_2 * sizeof(UINT) )) (64)) )) (64)) = (xt_neon_output_reset (G))) ” 
  &&  “ (0 <= k) ” 
  &&  “ (k <= ((xt_cols (G)) + 1 )) ” 
  &&  “ ((k % ( 2 ) ) = 0) ” 
  &&  “ (block_width = (xt_doz ((xt_cols (G))) (k))) ” 
  &&  “ (input = (xt_current_input (G) (k) (0))) ” 
  &&  “ ((unsigned_last_nbits (((unsigned_last_nbits (input) (64)) + input_stride )) (64)) = (xt_current_input (G) (k) (1))) ” 
  &&  “ (output = (xt_current_output (G) (k) (0))) ” 
  &&  “ (xt_neon_next G k block_width (unsigned_last_nbits (((unsigned_last_nbits (output) (64)) + output_stride )) (64)) ) ” 
  &&  “ (xt_progress F G old R k 0 0 ) ”
  &&  (xt_data F )
  **  (xt_output W R )
) \/
(
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (xt_round_down (block_height) (2)))) (PreH2 : (retval = (xt_round_down (block_height) (2)))) (PreH3 : (block_width <> 0)) (PreH4 : (block_height <> 0)) (PreH5 : (block_height = 1)) (PreH6 : (output_stride >= (block_height * sizeof(UINT) ))) (PreH7 : (block_width <> 1)) (PreH8 : (xt_valid F W G )) (PreH9 : (input = (xt_input (G)))) (PreH10 : (output = (xt_output_base (G)))) (PreH11 : (input_stride = (xt_input_stride (G)))) (PreH12 : (output_stride = (xt_output_stride (G)))) (PreH13 : (block_width = (xt_width (G)))) (PreH14 : (block_height = (xt_height (G)))) (PreH15 : (sizeof(UINT) = 4)) (PreH16 : (sizeof(UINT64) = 8)) (PreH17 : (sizeof(UINT64) = 8)) (PreH18 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH19 : (block_height = 1)) ,
  TT && emp 
|--
  EX (k: Z) ,
  “ (0 < 1) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ ((2 * sizeof(UINT) ) = 8) ” 
  &&  “ ((2 * sizeof(UINT) ) = 8) ” 
  &&  “ ((unsigned_last_nbits (((2 * sizeof(UINT) ) - (unsigned_last_nbits (((xt_round_down (1) (2)) * (xt_input_stride (G)) )) (64)) )) (64)) = (xt_neon_input_reset (G))) ” 
  &&  “ ((unsigned_last_nbits ((2 * (xt_input_stride (G)) )) (64)) = (xt_neon_input_offset (G))) ” 
  &&  “ ((unsigned_last_nbits (((unsigned_last_nbits ((2 * (xt_output_stride (G)) )) (64)) - (unsigned_last_nbits (((xt_round_down (1) (2)) * sizeof(UINT) )) (64)) )) (64)) = (xt_neon_output_reset (G))) ” 
  &&  “ (0 <= k) ” 
  &&  “ (k <= ((xt_cols (G)) + 1 )) ” 
  &&  “ ((k % ( 2 ) ) = 0) ” 
  &&  “ ((xt_width (G)) = (xt_doz ((xt_cols (G))) (k))) ” 
  &&  “ ((xt_input (G)) = (xt_current_input (G) (k) (0))) ” 
  &&  “ ((unsigned_last_nbits (((unsigned_last_nbits ((xt_input (G))) (64)) + (xt_input_stride (G)) )) (64)) = (xt_current_input (G) (k) (1))) ” 
  &&  “ ((xt_output_base (G)) = (xt_current_output (G) (k) (0))) ” 
  &&  “ (xt_neon_next G k (xt_width (G)) (unsigned_last_nbits (((unsigned_last_nbits ((xt_output_base (G))) (64)) + (xt_output_stride (G)) )) (64)) ) ” 
  &&  “ (xt_progress F G old old k 0 0 ) ”
  &&  emp
).

Definition test_neon_entail_wit_3_1 := 
(
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (R_2: XTOutput) (o1: Z) (o0: Z) (i1: Z) (i0: Z) (block_width: Z) (k_2: Z) (output_reset: Z) (input_offset: Z) (input_reset: Z) (tile_wbytes: Z) (tile_hbytes: Z) (tile_width: Z) (tile_height: Z) (block_height: Z) (output_stride: Z) (input_stride: Z) (output: Z) (input: Z) (PreH1 : (block_width < 2)) (PreH2 : (block_width <> 0)) (PreH3 : (xt_valid F W G )) (PreH4 : (input = (xt_input (G)))) (PreH5 : (output = (xt_output_base (G)))) (PreH6 : (input_stride = (xt_input_stride (G)))) (PreH7 : (output_stride = (xt_output_stride (G)))) (PreH8 : (block_height = (xt_height (G)))) (PreH9 : (0 < block_height)) (PreH10 : (sizeof(UINT) = 4)) (PreH11 : (sizeof(UINT64) = 8)) (PreH12 : (sizeof(UINT64) = 8)) (PreH13 : (tile_height = 2)) (PreH14 : (tile_width = 2)) (PreH15 : (tile_hbytes = 8)) (PreH16 : (tile_wbytes = 8)) (PreH17 : (input_reset = (xt_neon_input_reset (G)))) (PreH18 : (input_offset = (xt_neon_input_offset (G)))) (PreH19 : (output_reset = (xt_neon_output_reset (G)))) (PreH20 : (0 <= k_2)) (PreH21 : (k_2 <= ((xt_cols (G)) + 1 ))) (PreH22 : ((k_2 % ( 2 ) ) = 0)) (PreH23 : (block_width = (xt_doz ((xt_cols (G))) (k_2)))) (PreH24 : (i0 = (xt_current_input (G) (k_2) (0)))) (PreH25 : (i1 = (xt_current_input (G) (k_2) (1)))) (PreH26 : (o0 = (xt_current_output (G) (k_2) (0)))) (PreH27 : (xt_neon_next G k_2 block_width o1 )) (PreH28 : (xt_progress F G old R_2 k_2 0 0 )) ,
  (xt_data F )
  **  (xt_output W R_2 )
|--
  EX (R: XTOutput)  (k: Z) ,
  “ (xt_valid F W G ) ” 
  &&  “ (input = (xt_input (G))) ” 
  &&  “ (output = (xt_output_base (G))) ” 
  &&  “ (input_stride = (xt_input_stride (G))) ” 
  &&  “ (output_stride = (xt_output_stride (G))) ” 
  &&  “ (block_height = (xt_height (G))) ” 
  &&  “ (0 < block_height) ” 
  &&  “ (sizeof(UINT) = 4) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (tile_height = 2) ” 
  &&  “ (tile_width = 2) ” 
  &&  “ (tile_hbytes = 8) ” 
  &&  “ (tile_wbytes = 8) ” 
  &&  “ (input_reset = (xt_neon_input_reset (G))) ” 
  &&  “ (input_offset = (xt_neon_input_offset (G))) ” 
  &&  “ (output_reset = (xt_neon_output_reset (G))) ” 
  &&  “ (0 <= k) ” 
  &&  “ (k <= ((xt_cols (G)) + 1 )) ” 
  &&  “ ((k % ( 2 ) ) = 0) ” 
  &&  “ (block_width = (xt_doz ((xt_cols (G))) (k))) ” 
  &&  “ (0 < block_width) ” 
  &&  “ (k < (xt_cols (G))) ” 
  &&  “ (0 <= block_height) ” 
  &&  “ (block_height <= block_height) ” 
  &&  “ (((block_height - block_height ) % ( 2 ) ) = 0) ” 
  &&  “ (i0 = (xt_current_input (G) (k) ((block_height - block_height )))) ” 
  &&  “ (i1 = (xt_current_input (G) (k) (((block_height - block_height ) + 1 )))) ” 
  &&  “ (o0 = (xt_current_output (G) (k) ((block_height - block_height )))) ” 
  &&  “ (o0 = (xt_current_output (G) ((xt_neon_second (k) (block_width))) ((block_height - block_height )))) ” 
  &&  “ (xt_progress F G old R k (xt_neon_batch (block_width)) (block_height - block_height ) ) ”
  &&  (xt_data F )
  **  (xt_output W R )
) \/
(
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (R_2: XTOutput) (o1: Z) (o0: Z) (i1: Z) (i0: Z) (block_width: Z) (k_2: Z) (output_reset: Z) (input_offset: Z) (input_reset: Z) (tile_wbytes: Z) (tile_hbytes: Z) (tile_width: Z) (tile_height: Z) (block_height: Z) (output_stride: Z) (input_stride: Z) (output: Z) (input: Z) (PreH1 : (block_width < 2)) (PreH2 : (block_width <> 0)) (PreH3 : (xt_valid F W G )) (PreH4 : (input = (xt_input (G)))) (PreH5 : (output = (xt_output_base (G)))) (PreH6 : (input_stride = (xt_input_stride (G)))) (PreH7 : (output_stride = (xt_output_stride (G)))) (PreH8 : (block_height = (xt_height (G)))) (PreH9 : (0 < block_height)) (PreH10 : (sizeof(UINT) = 4)) (PreH11 : (sizeof(UINT64) = 8)) (PreH12 : (sizeof(UINT64) = 8)) (PreH13 : (tile_height = 2)) (PreH14 : (tile_width = 2)) (PreH15 : (tile_hbytes = 8)) (PreH16 : (tile_wbytes = 8)) (PreH17 : (input_reset = (xt_neon_input_reset (G)))) (PreH18 : (input_offset = (xt_neon_input_offset (G)))) (PreH19 : (output_reset = (xt_neon_output_reset (G)))) (PreH20 : (0 <= k_2)) (PreH21 : (k_2 <= ((xt_cols (G)) + 1 ))) (PreH22 : ((k_2 % ( 2 ) ) = 0)) (PreH23 : (block_width = (xt_doz ((xt_cols (G))) (k_2)))) (PreH24 : (i0 = (xt_current_input (G) (k_2) (0)))) (PreH25 : (i1 = (xt_current_input (G) (k_2) (1)))) (PreH26 : (o0 = (xt_current_output (G) (k_2) (0)))) (PreH27 : (xt_neon_next G k_2 block_width o1 )) (PreH28 : (xt_progress F G old R_2 k_2 0 0 )) ,
  TT && emp 
|--
  EX (k: Z) ,
  “ (sizeof(UINT64) = 8) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (0 <= k) ” 
  &&  “ (k <= ((xt_cols (G)) + 1 )) ” 
  &&  “ ((k % ( 2 ) ) = 0) ” 
  &&  “ ((xt_doz ((xt_cols (G))) (k_2)) = (xt_doz ((xt_cols (G))) (k))) ” 
  &&  “ (0 < (xt_doz ((xt_cols (G))) (k_2))) ” 
  &&  “ (k < (xt_cols (G))) ” 
  &&  “ (0 <= (xt_height (G))) ” 
  &&  “ ((xt_height (G)) <= (xt_height (G))) ” 
  &&  “ ((((xt_height (G)) - (xt_height (G)) ) % ( 2 ) ) = 0) ” 
  &&  “ ((xt_current_input (G) (k_2) (0)) = (xt_current_input (G) (k) (((xt_height (G)) - (xt_height (G)) )))) ” 
  &&  “ ((xt_current_input (G) (k_2) (1)) = (xt_current_input (G) (k) ((((xt_height (G)) - (xt_height (G)) ) + 1 )))) ” 
  &&  “ ((xt_current_output (G) (k_2) (0)) = (xt_current_output (G) (k) (((xt_height (G)) - (xt_height (G)) )))) ” 
  &&  “ ((xt_current_output (G) (k_2) (0)) = (xt_current_output (G) ((xt_neon_second (k) ((xt_doz ((xt_cols (G))) (k_2))))) (((xt_height (G)) - (xt_height (G)) )))) ” 
  &&  “ (xt_progress F G old R_2 k (xt_neon_batch ((xt_doz ((xt_cols (G))) (k_2)))) ((xt_height (G)) - (xt_height (G)) ) ) ”
  &&  emp
).

Definition test_neon_entail_wit_3_2 := 
(
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (R_2: XTOutput) (o1: Z) (o0: Z) (i1: Z) (i0: Z) (block_width: Z) (k_2: Z) (output_reset: Z) (input_offset: Z) (input_reset: Z) (tile_wbytes: Z) (tile_hbytes: Z) (tile_width: Z) (tile_height: Z) (block_height: Z) (output_stride: Z) (input_stride: Z) (output: Z) (input: Z) (PreH1 : (block_width >= 2)) (PreH2 : (block_width <> 0)) (PreH3 : (xt_valid F W G )) (PreH4 : (input = (xt_input (G)))) (PreH5 : (output = (xt_output_base (G)))) (PreH6 : (input_stride = (xt_input_stride (G)))) (PreH7 : (output_stride = (xt_output_stride (G)))) (PreH8 : (block_height = (xt_height (G)))) (PreH9 : (0 < block_height)) (PreH10 : (sizeof(UINT) = 4)) (PreH11 : (sizeof(UINT64) = 8)) (PreH12 : (sizeof(UINT64) = 8)) (PreH13 : (tile_height = 2)) (PreH14 : (tile_width = 2)) (PreH15 : (tile_hbytes = 8)) (PreH16 : (tile_wbytes = 8)) (PreH17 : (input_reset = (xt_neon_input_reset (G)))) (PreH18 : (input_offset = (xt_neon_input_offset (G)))) (PreH19 : (output_reset = (xt_neon_output_reset (G)))) (PreH20 : (0 <= k_2)) (PreH21 : (k_2 <= ((xt_cols (G)) + 1 ))) (PreH22 : ((k_2 % ( 2 ) ) = 0)) (PreH23 : (block_width = (xt_doz ((xt_cols (G))) (k_2)))) (PreH24 : (i0 = (xt_current_input (G) (k_2) (0)))) (PreH25 : (i1 = (xt_current_input (G) (k_2) (1)))) (PreH26 : (o0 = (xt_current_output (G) (k_2) (0)))) (PreH27 : (xt_neon_next G k_2 block_width o1 )) (PreH28 : (xt_progress F G old R_2 k_2 0 0 )) ,
  (xt_data F )
  **  (xt_output W R_2 )
|--
  EX (R: XTOutput)  (k: Z) ,
  “ (xt_valid F W G ) ” 
  &&  “ (input = (xt_input (G))) ” 
  &&  “ (output = (xt_output_base (G))) ” 
  &&  “ (input_stride = (xt_input_stride (G))) ” 
  &&  “ (output_stride = (xt_output_stride (G))) ” 
  &&  “ (block_height = (xt_height (G))) ” 
  &&  “ (0 < block_height) ” 
  &&  “ (sizeof(UINT) = 4) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (tile_height = 2) ” 
  &&  “ (tile_width = 2) ” 
  &&  “ (tile_hbytes = 8) ” 
  &&  “ (tile_wbytes = 8) ” 
  &&  “ (input_reset = (xt_neon_input_reset (G))) ” 
  &&  “ (input_offset = (xt_neon_input_offset (G))) ” 
  &&  “ (output_reset = (xt_neon_output_reset (G))) ” 
  &&  “ (0 <= k) ” 
  &&  “ (k <= ((xt_cols (G)) + 1 )) ” 
  &&  “ ((k % ( 2 ) ) = 0) ” 
  &&  “ (block_width = (xt_doz ((xt_cols (G))) (k))) ” 
  &&  “ (0 < block_width) ” 
  &&  “ (k < (xt_cols (G))) ” 
  &&  “ (0 <= block_height) ” 
  &&  “ (block_height <= block_height) ” 
  &&  “ (((block_height - block_height ) % ( 2 ) ) = 0) ” 
  &&  “ (i0 = (xt_current_input (G) (k) ((block_height - block_height )))) ” 
  &&  “ (i1 = (xt_current_input (G) (k) (((block_height - block_height ) + 1 )))) ” 
  &&  “ (o0 = (xt_current_output (G) (k) ((block_height - block_height )))) ” 
  &&  “ (o1 = (xt_current_output (G) ((xt_neon_second (k) (block_width))) ((block_height - block_height )))) ” 
  &&  “ (xt_progress F G old R k (xt_neon_batch (block_width)) (block_height - block_height ) ) ”
  &&  (xt_data F )
  **  (xt_output W R )
) \/
(
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (R_2: XTOutput) (o1: Z) (o0: Z) (i1: Z) (i0: Z) (block_width: Z) (k_2: Z) (output_reset: Z) (input_offset: Z) (input_reset: Z) (tile_wbytes: Z) (tile_hbytes: Z) (tile_width: Z) (tile_height: Z) (block_height: Z) (output_stride: Z) (input_stride: Z) (output: Z) (input: Z) (PreH1 : (block_width >= 2)) (PreH2 : (block_width <> 0)) (PreH3 : (xt_valid F W G )) (PreH4 : (input = (xt_input (G)))) (PreH5 : (output = (xt_output_base (G)))) (PreH6 : (input_stride = (xt_input_stride (G)))) (PreH7 : (output_stride = (xt_output_stride (G)))) (PreH8 : (block_height = (xt_height (G)))) (PreH9 : (0 < block_height)) (PreH10 : (sizeof(UINT) = 4)) (PreH11 : (sizeof(UINT64) = 8)) (PreH12 : (sizeof(UINT64) = 8)) (PreH13 : (tile_height = 2)) (PreH14 : (tile_width = 2)) (PreH15 : (tile_hbytes = 8)) (PreH16 : (tile_wbytes = 8)) (PreH17 : (input_reset = (xt_neon_input_reset (G)))) (PreH18 : (input_offset = (xt_neon_input_offset (G)))) (PreH19 : (output_reset = (xt_neon_output_reset (G)))) (PreH20 : (0 <= k_2)) (PreH21 : (k_2 <= ((xt_cols (G)) + 1 ))) (PreH22 : ((k_2 % ( 2 ) ) = 0)) (PreH23 : (block_width = (xt_doz ((xt_cols (G))) (k_2)))) (PreH24 : (i0 = (xt_current_input (G) (k_2) (0)))) (PreH25 : (i1 = (xt_current_input (G) (k_2) (1)))) (PreH26 : (o0 = (xt_current_output (G) (k_2) (0)))) (PreH27 : (xt_neon_next G k_2 block_width o1 )) (PreH28 : (xt_progress F G old R_2 k_2 0 0 )) ,
  TT && emp 
|--
  EX (k: Z) ,
  “ (sizeof(UINT64) = 8) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (0 <= k) ” 
  &&  “ (k <= ((xt_cols (G)) + 1 )) ” 
  &&  “ ((k % ( 2 ) ) = 0) ” 
  &&  “ ((xt_doz ((xt_cols (G))) (k_2)) = (xt_doz ((xt_cols (G))) (k))) ” 
  &&  “ (0 < (xt_doz ((xt_cols (G))) (k_2))) ” 
  &&  “ (k < (xt_cols (G))) ” 
  &&  “ (0 <= (xt_height (G))) ” 
  &&  “ ((xt_height (G)) <= (xt_height (G))) ” 
  &&  “ ((((xt_height (G)) - (xt_height (G)) ) % ( 2 ) ) = 0) ” 
  &&  “ ((xt_current_input (G) (k_2) (0)) = (xt_current_input (G) (k) (((xt_height (G)) - (xt_height (G)) )))) ” 
  &&  “ ((xt_current_input (G) (k_2) (1)) = (xt_current_input (G) (k) ((((xt_height (G)) - (xt_height (G)) ) + 1 )))) ” 
  &&  “ ((xt_current_output (G) (k_2) (0)) = (xt_current_output (G) (k) (((xt_height (G)) - (xt_height (G)) )))) ” 
  &&  “ (o1 = (xt_current_output (G) ((xt_neon_second (k) ((xt_doz ((xt_cols (G))) (k_2))))) (((xt_height (G)) - (xt_height (G)) )))) ” 
  &&  “ (xt_progress F G old R_2 k (xt_neon_batch ((xt_doz ((xt_cols (G))) (k_2)))) ((xt_height (G)) - (xt_height (G)) ) ) ”
  &&  emp
).

Definition test_neon_entail_wit_4 := 
(
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (R_2: XTOutput) (o1: Z) (o0: Z) (i1: Z) (i0: Z) (bh: Z) (block_width: Z) (k_2: Z) (output_reset: Z) (input_offset: Z) (input_reset: Z) (tile_wbytes: Z) (tile_hbytes: Z) (tile_width: Z) (tile_height: Z) (block_height: Z) (output_stride: Z) (input_stride: Z) (output: Z) (input: Z) (PreH1 : (bh >= 2)) (PreH2 : (xt_valid F W G )) (PreH3 : (input = (xt_input (G)))) (PreH4 : (output = (xt_output_base (G)))) (PreH5 : (input_stride = (xt_input_stride (G)))) (PreH6 : (output_stride = (xt_output_stride (G)))) (PreH7 : (block_height = (xt_height (G)))) (PreH8 : (0 < block_height)) (PreH9 : (sizeof(UINT) = 4)) (PreH10 : (sizeof(UINT64) = 8)) (PreH11 : (sizeof(UINT64) = 8)) (PreH12 : (tile_height = 2)) (PreH13 : (tile_width = 2)) (PreH14 : (tile_hbytes = 8)) (PreH15 : (tile_wbytes = 8)) (PreH16 : (input_reset = (xt_neon_input_reset (G)))) (PreH17 : (input_offset = (xt_neon_input_offset (G)))) (PreH18 : (output_reset = (xt_neon_output_reset (G)))) (PreH19 : (0 <= k_2)) (PreH20 : (k_2 <= ((xt_cols (G)) + 1 ))) (PreH21 : ((k_2 % ( 2 ) ) = 0)) (PreH22 : (block_width = (xt_doz ((xt_cols (G))) (k_2)))) (PreH23 : (0 < block_width)) (PreH24 : (k_2 < (xt_cols (G)))) (PreH25 : (0 <= bh)) (PreH26 : (bh <= block_height)) (PreH27 : (((block_height - bh ) % ( 2 ) ) = 0)) (PreH28 : (i0 = (xt_current_input (G) (k_2) ((block_height - bh ))))) (PreH29 : (i1 = (xt_current_input (G) (k_2) (((block_height - bh ) + 1 ))))) (PreH30 : (o0 = (xt_current_output (G) (k_2) ((block_height - bh ))))) (PreH31 : (o1 = (xt_current_output (G) ((xt_neon_second (k_2) (block_width))) ((block_height - bh ))))) (PreH32 : (xt_progress F G old R_2 k_2 (xt_neon_batch (block_width)) (block_height - bh ) )) ,
  (xt_output W (xt_write_pair ((xt_write_pair (R_2) ((xt_current_output (G) ((xt_neon_second (k_2) (block_width))) ((block_height - bh )))) ((xt_load_lane (F) ((xt_current_input (G) (k_2) ((block_height - bh )))) (1))) ((xt_load_lane (F) ((xt_current_input (G) (k_2) (((block_height - bh ) + 1 )))) (1))))) (o0) ((xt_load_lane (F) (i0) (0))) ((xt_load_lane (F) (i1) (0)))) )
  **  (xt_data F )
|--
  EX (R: XTOutput)  (k: Z) ,
  “ (xt_valid F W G ) ” 
  &&  “ (input = (xt_input (G))) ” 
  &&  “ (output = (xt_output_base (G))) ” 
  &&  “ (input_stride = (xt_input_stride (G))) ” 
  &&  “ (output_stride = (xt_output_stride (G))) ” 
  &&  “ (block_height = (xt_height (G))) ” 
  &&  “ (0 < block_height) ” 
  &&  “ (sizeof(UINT) = 4) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (tile_height = 2) ” 
  &&  “ (tile_width = 2) ” 
  &&  “ (tile_hbytes = 8) ” 
  &&  “ (tile_wbytes = 8) ” 
  &&  “ (input_reset = (xt_neon_input_reset (G))) ” 
  &&  “ (input_offset = (xt_neon_input_offset (G))) ” 
  &&  “ (output_reset = (xt_neon_output_reset (G))) ” 
  &&  “ (0 <= k) ” 
  &&  “ (k <= ((xt_cols (G)) + 1 )) ” 
  &&  “ ((k % ( 2 ) ) = 0) ” 
  &&  “ (block_width = (xt_doz ((xt_cols (G))) (k))) ” 
  &&  “ (0 < block_width) ” 
  &&  “ (k < (xt_cols (G))) ” 
  &&  “ (0 <= (bh - 2 )) ” 
  &&  “ ((bh - 2 ) <= block_height) ” 
  &&  “ (((block_height - (bh - 2 ) ) % ( 2 ) ) = 0) ” 
  &&  “ ((unsigned_last_nbits (((unsigned_last_nbits (i0) (64)) + input_offset )) (64)) = (xt_current_input (G) (k) ((block_height - (bh - 2 ) )))) ” 
  &&  “ ((unsigned_last_nbits (((unsigned_last_nbits (i1) (64)) + input_offset )) (64)) = (xt_current_input (G) (k) (((block_height - (bh - 2 ) ) + 1 )))) ” 
  &&  “ ((unsigned_last_nbits (((unsigned_last_nbits (o0) (64)) + tile_hbytes )) (64)) = (xt_current_output (G) (k) ((block_height - (bh - 2 ) )))) ” 
  &&  “ ((unsigned_last_nbits (((unsigned_last_nbits (o1) (64)) + tile_hbytes )) (64)) = (xt_current_output (G) ((xt_neon_second (k) (block_width))) ((block_height - (bh - 2 ) )))) ” 
  &&  “ (xt_progress F G old R k (xt_neon_batch (block_width)) (block_height - (bh - 2 ) ) ) ”
  &&  (xt_data F )
  **  (xt_output W R )
) \/
(
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (R_2: XTOutput) (o1: Z) (o0: Z) (i1: Z) (i0: Z) (bh: Z) (block_width: Z) (k_2: Z) (output_reset: Z) (input_offset: Z) (input_reset: Z) (tile_wbytes: Z) (tile_hbytes: Z) (tile_width: Z) (tile_height: Z) (block_height: Z) (output_stride: Z) (input_stride: Z) (output: Z) (input: Z) (PreH1 : (bh >= 2)) (PreH2 : (xt_valid F W G )) (PreH3 : (input = (xt_input (G)))) (PreH4 : (output = (xt_output_base (G)))) (PreH5 : (input_stride = (xt_input_stride (G)))) (PreH6 : (output_stride = (xt_output_stride (G)))) (PreH7 : (block_height = (xt_height (G)))) (PreH8 : (0 < block_height)) (PreH9 : (sizeof(UINT) = 4)) (PreH10 : (sizeof(UINT64) = 8)) (PreH11 : (sizeof(UINT64) = 8)) (PreH12 : (tile_height = 2)) (PreH13 : (tile_width = 2)) (PreH14 : (tile_hbytes = 8)) (PreH15 : (tile_wbytes = 8)) (PreH16 : (input_reset = (xt_neon_input_reset (G)))) (PreH17 : (input_offset = (xt_neon_input_offset (G)))) (PreH18 : (output_reset = (xt_neon_output_reset (G)))) (PreH19 : (0 <= k_2)) (PreH20 : (k_2 <= ((xt_cols (G)) + 1 ))) (PreH21 : ((k_2 % ( 2 ) ) = 0)) (PreH22 : (block_width = (xt_doz ((xt_cols (G))) (k_2)))) (PreH23 : (0 < block_width)) (PreH24 : (k_2 < (xt_cols (G)))) (PreH25 : (0 <= bh)) (PreH26 : (bh <= block_height)) (PreH27 : (((block_height - bh ) % ( 2 ) ) = 0)) (PreH28 : (i0 = (xt_current_input (G) (k_2) ((block_height - bh ))))) (PreH29 : (i1 = (xt_current_input (G) (k_2) (((block_height - bh ) + 1 ))))) (PreH30 : (o0 = (xt_current_output (G) (k_2) ((block_height - bh ))))) (PreH31 : (o1 = (xt_current_output (G) ((xt_neon_second (k_2) (block_width))) ((block_height - bh ))))) (PreH32 : (xt_progress F G old R_2 k_2 (xt_neon_batch (block_width)) (block_height - bh ) )) ,
  TT && emp 
|--
  EX (k: Z) ,
  “ (sizeof(UINT64) = 8) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (0 <= k) ” 
  &&  “ (k <= ((xt_cols (G)) + 1 )) ” 
  &&  “ ((k % ( 2 ) ) = 0) ” 
  &&  “ ((xt_doz ((xt_cols (G))) (k_2)) = (xt_doz ((xt_cols (G))) (k))) ” 
  &&  “ (k < (xt_cols (G))) ” 
  &&  “ (0 <= (bh - 2 )) ” 
  &&  “ ((bh - 2 ) <= (xt_height (G))) ” 
  &&  “ ((((xt_height (G)) - (bh - 2 ) ) % ( 2 ) ) = 0) ” 
  &&  “ ((unsigned_last_nbits (((unsigned_last_nbits ((xt_current_input (G) (k_2) ((block_height - bh )))) (64)) + (xt_neon_input_offset (G)) )) (64)) = (xt_current_input (G) (k) (((xt_height (G)) - (bh - 2 ) )))) ” 
  &&  “ ((unsigned_last_nbits (((unsigned_last_nbits ((xt_current_input (G) (k_2) (((block_height - bh ) + 1 )))) (64)) + (xt_neon_input_offset (G)) )) (64)) = (xt_current_input (G) (k) ((((xt_height (G)) - (bh - 2 ) ) + 1 )))) ” 
  &&  “ ((unsigned_last_nbits (((unsigned_last_nbits ((xt_current_output (G) (k_2) ((block_height - bh )))) (64)) + 8 )) (64)) = (xt_current_output (G) (k) (((xt_height (G)) - (bh - 2 ) )))) ” 
  &&  “ ((unsigned_last_nbits (((unsigned_last_nbits ((xt_current_output (G) ((xt_neon_second (k_2) (block_width))) ((block_height - bh )))) (64)) + 8 )) (64)) = (xt_current_output (G) ((xt_neon_second (k) ((xt_doz ((xt_cols (G))) (k_2))))) (((xt_height (G)) - (bh - 2 ) )))) ” 
  &&  “ (xt_progress F G old (xt_write_pair ((xt_write_pair (R_2) ((xt_current_output (G) ((xt_neon_second (k_2) ((xt_doz ((xt_cols (G))) (k_2))))) (((xt_height (G)) - bh )))) ((xt_load_lane (F) ((xt_current_input (G) (k_2) (((xt_height (G)) - bh )))) (1))) ((xt_load_lane (F) ((xt_current_input (G) (k_2) ((((xt_height (G)) - bh ) + 1 )))) (1))))) ((xt_current_output (G) (k_2) ((block_height - bh )))) ((xt_load_lane (F) ((xt_current_input (G) (k_2) ((block_height - bh )))) (0))) ((xt_load_lane (F) ((xt_current_input (G) (k_2) (((block_height - bh ) + 1 )))) (0)))) k (xt_neon_batch ((xt_doz ((xt_cols (G))) (k_2)))) ((xt_height (G)) - (bh - 2 ) ) ) ”
  &&  emp
).

Definition test_neon_entail_wit_5_1 := 
(
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (R_2: XTOutput) (o1: Z) (o0: Z) (i1: Z) (i0: Z) (bh: Z) (block_width: Z) (k_2: Z) (output_reset: Z) (input_offset: Z) (input_reset: Z) (tile_wbytes: Z) (tile_hbytes: Z) (tile_width: Z) (tile_height: Z) (block_height: Z) (output_stride: Z) (input_stride: Z) (output: Z) (input: Z) (PreH1 : (bh <> 0)) (PreH2 : (bh < 2)) (PreH3 : (xt_valid F W G )) (PreH4 : (input = (xt_input (G)))) (PreH5 : (output = (xt_output_base (G)))) (PreH6 : (input_stride = (xt_input_stride (G)))) (PreH7 : (output_stride = (xt_output_stride (G)))) (PreH8 : (block_height = (xt_height (G)))) (PreH9 : (0 < block_height)) (PreH10 : (sizeof(UINT) = 4)) (PreH11 : (sizeof(UINT64) = 8)) (PreH12 : (sizeof(UINT64) = 8)) (PreH13 : (tile_height = 2)) (PreH14 : (tile_width = 2)) (PreH15 : (tile_hbytes = 8)) (PreH16 : (tile_wbytes = 8)) (PreH17 : (input_reset = (xt_neon_input_reset (G)))) (PreH18 : (input_offset = (xt_neon_input_offset (G)))) (PreH19 : (output_reset = (xt_neon_output_reset (G)))) (PreH20 : (0 <= k_2)) (PreH21 : (k_2 <= ((xt_cols (G)) + 1 ))) (PreH22 : ((k_2 % ( 2 ) ) = 0)) (PreH23 : (block_width = (xt_doz ((xt_cols (G))) (k_2)))) (PreH24 : (0 < block_width)) (PreH25 : (k_2 < (xt_cols (G)))) (PreH26 : (0 <= bh)) (PreH27 : (bh <= block_height)) (PreH28 : (((block_height - bh ) % ( 2 ) ) = 0)) (PreH29 : (i0 = (xt_current_input (G) (k_2) ((block_height - bh ))))) (PreH30 : (i1 = (xt_current_input (G) (k_2) (((block_height - bh ) + 1 ))))) (PreH31 : (o0 = (xt_current_output (G) (k_2) ((block_height - bh ))))) (PreH32 : (o1 = (xt_current_output (G) ((xt_neon_second (k_2) (block_width))) ((block_height - bh ))))) (PreH33 : (xt_progress F G old R_2 k_2 (xt_neon_batch (block_width)) (block_height - bh ) )) (PreH34 : ((Z.land bh 1) <> 0)) ,
  (xt_output W (xt_output_put ((xt_output_put (R_2) ((xt_current_output (G) ((xt_neon_second (k_2) (block_width))) ((block_height - bh )))) ((xt_load_lane (F) ((xt_current_input (G) (k_2) ((block_height - bh )))) (1))))) (o0) ((xt_load_lane (F) (i0) (0)))) )
  **  (xt_data F )
|--
  EX (R: XTOutput)  (k: Z) ,
  “ (xt_valid F W G ) ” 
  &&  “ (input = (xt_input (G))) ” 
  &&  “ (output = (xt_output_base (G))) ” 
  &&  “ (input_stride = (xt_input_stride (G))) ” 
  &&  “ (output_stride = (xt_output_stride (G))) ” 
  &&  “ (block_height = (xt_height (G))) ” 
  &&  “ (0 < block_height) ” 
  &&  “ (sizeof(UINT) = 4) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (tile_height = 2) ” 
  &&  “ (tile_width = 2) ” 
  &&  “ (tile_hbytes = 8) ” 
  &&  “ (tile_wbytes = 8) ” 
  &&  “ (input_reset = (xt_neon_input_reset (G))) ” 
  &&  “ (input_offset = (xt_neon_input_offset (G))) ” 
  &&  “ (output_reset = (xt_neon_output_reset (G))) ” 
  &&  “ (0 <= k) ” 
  &&  “ (k <= ((xt_cols (G)) + 1 )) ” 
  &&  “ ((k % ( 2 ) ) = 0) ” 
  &&  “ (block_width = (xt_doz ((xt_cols (G))) (k))) ” 
  &&  “ (0 < block_width) ” 
  &&  “ (k < (xt_cols (G))) ” 
  &&  “ (0 <= bh) ” 
  &&  “ (bh <= 1) ” 
  &&  “ (((block_height - bh ) % ( 2 ) ) = 0) ” 
  &&  “ (i0 = (xt_current_input (G) (k) ((block_height - bh )))) ” 
  &&  “ (i1 = (xt_current_input (G) (k) (((block_height - bh ) + 1 )))) ” 
  &&  “ (o0 = (xt_current_output (G) (k) ((block_height - bh )))) ” 
  &&  “ (o1 = (xt_current_output (G) ((xt_neon_second (k) (block_width))) ((block_height - bh )))) ” 
  &&  “ (xt_progress F G old R k (xt_neon_batch (block_width)) block_height ) ”
  &&  (xt_data F )
  **  (xt_output W R )
) \/
(
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (R_2: XTOutput) (o1: Z) (o0: Z) (i1: Z) (i0: Z) (bh: Z) (block_width: Z) (k_2: Z) (output_reset: Z) (input_offset: Z) (input_reset: Z) (tile_wbytes: Z) (tile_hbytes: Z) (tile_width: Z) (tile_height: Z) (block_height: Z) (output_stride: Z) (input_stride: Z) (output: Z) (input: Z) (PreH1 : (bh <> 0)) (PreH2 : (bh < 2)) (PreH3 : (xt_valid F W G )) (PreH4 : (input = (xt_input (G)))) (PreH5 : (output = (xt_output_base (G)))) (PreH6 : (input_stride = (xt_input_stride (G)))) (PreH7 : (output_stride = (xt_output_stride (G)))) (PreH8 : (block_height = (xt_height (G)))) (PreH9 : (0 < block_height)) (PreH10 : (sizeof(UINT) = 4)) (PreH11 : (sizeof(UINT64) = 8)) (PreH12 : (sizeof(UINT64) = 8)) (PreH13 : (tile_height = 2)) (PreH14 : (tile_width = 2)) (PreH15 : (tile_hbytes = 8)) (PreH16 : (tile_wbytes = 8)) (PreH17 : (input_reset = (xt_neon_input_reset (G)))) (PreH18 : (input_offset = (xt_neon_input_offset (G)))) (PreH19 : (output_reset = (xt_neon_output_reset (G)))) (PreH20 : (0 <= k_2)) (PreH21 : (k_2 <= ((xt_cols (G)) + 1 ))) (PreH22 : ((k_2 % ( 2 ) ) = 0)) (PreH23 : (block_width = (xt_doz ((xt_cols (G))) (k_2)))) (PreH24 : (0 < block_width)) (PreH25 : (k_2 < (xt_cols (G)))) (PreH26 : (0 <= bh)) (PreH27 : (bh <= block_height)) (PreH28 : (((block_height - bh ) % ( 2 ) ) = 0)) (PreH29 : (i0 = (xt_current_input (G) (k_2) ((block_height - bh ))))) (PreH30 : (i1 = (xt_current_input (G) (k_2) (((block_height - bh ) + 1 ))))) (PreH31 : (o0 = (xt_current_output (G) (k_2) ((block_height - bh ))))) (PreH32 : (o1 = (xt_current_output (G) ((xt_neon_second (k_2) (block_width))) ((block_height - bh ))))) (PreH33 : (xt_progress F G old R_2 k_2 (xt_neon_batch (block_width)) (block_height - bh ) )) (PreH34 : ((Z.land bh 1) <> 0)) ,
  TT && emp 
|--
  EX (k: Z) ,
  “ (sizeof(UINT64) = 8) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (0 <= k) ” 
  &&  “ (k <= ((xt_cols (G)) + 1 )) ” 
  &&  “ ((k % ( 2 ) ) = 0) ” 
  &&  “ ((xt_doz ((xt_cols (G))) (k_2)) = (xt_doz ((xt_cols (G))) (k))) ” 
  &&  “ (k < (xt_cols (G))) ” 
  &&  “ (bh <= 1) ” 
  &&  “ ((xt_current_input (G) (k_2) ((block_height - bh ))) = (xt_current_input (G) (k) (((xt_height (G)) - bh )))) ” 
  &&  “ ((xt_current_input (G) (k_2) (((block_height - bh ) + 1 ))) = (xt_current_input (G) (k) ((((xt_height (G)) - bh ) + 1 )))) ” 
  &&  “ ((xt_current_output (G) (k_2) ((block_height - bh ))) = (xt_current_output (G) (k) (((xt_height (G)) - bh )))) ” 
  &&  “ ((xt_current_output (G) ((xt_neon_second (k_2) (block_width))) ((block_height - bh ))) = (xt_current_output (G) ((xt_neon_second (k) ((xt_doz ((xt_cols (G))) (k_2))))) (((xt_height (G)) - bh )))) ” 
  &&  “ (xt_progress F G old (xt_output_put ((xt_output_put (R_2) ((xt_current_output (G) ((xt_neon_second (k_2) ((xt_doz ((xt_cols (G))) (k_2))))) (((xt_height (G)) - bh )))) ((xt_load_lane (F) ((xt_current_input (G) (k_2) (((xt_height (G)) - bh )))) (1))))) ((xt_current_output (G) (k_2) ((block_height - bh )))) ((xt_load_lane (F) ((xt_current_input (G) (k_2) ((block_height - bh )))) (0)))) k (xt_neon_batch ((xt_doz ((xt_cols (G))) (k_2)))) (xt_height (G)) ) ”
  &&  emp
).

Definition test_neon_entail_wit_5_2 := 
(
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (R_2: XTOutput) (o1: Z) (o0: Z) (i1: Z) (i0: Z) (bh: Z) (block_width: Z) (k_2: Z) (output_reset: Z) (input_offset: Z) (input_reset: Z) (tile_wbytes: Z) (tile_hbytes: Z) (tile_width: Z) (tile_height: Z) (block_height: Z) (output_stride: Z) (input_stride: Z) (output: Z) (input: Z) (PreH1 : (bh <> 0)) (PreH2 : (bh < 2)) (PreH3 : (xt_valid F W G )) (PreH4 : (input = (xt_input (G)))) (PreH5 : (output = (xt_output_base (G)))) (PreH6 : (input_stride = (xt_input_stride (G)))) (PreH7 : (output_stride = (xt_output_stride (G)))) (PreH8 : (block_height = (xt_height (G)))) (PreH9 : (0 < block_height)) (PreH10 : (sizeof(UINT) = 4)) (PreH11 : (sizeof(UINT64) = 8)) (PreH12 : (sizeof(UINT64) = 8)) (PreH13 : (tile_height = 2)) (PreH14 : (tile_width = 2)) (PreH15 : (tile_hbytes = 8)) (PreH16 : (tile_wbytes = 8)) (PreH17 : (input_reset = (xt_neon_input_reset (G)))) (PreH18 : (input_offset = (xt_neon_input_offset (G)))) (PreH19 : (output_reset = (xt_neon_output_reset (G)))) (PreH20 : (0 <= k_2)) (PreH21 : (k_2 <= ((xt_cols (G)) + 1 ))) (PreH22 : ((k_2 % ( 2 ) ) = 0)) (PreH23 : (block_width = (xt_doz ((xt_cols (G))) (k_2)))) (PreH24 : (0 < block_width)) (PreH25 : (k_2 < (xt_cols (G)))) (PreH26 : (0 <= bh)) (PreH27 : (bh <= block_height)) (PreH28 : (((block_height - bh ) % ( 2 ) ) = 0)) (PreH29 : (i0 = (xt_current_input (G) (k_2) ((block_height - bh ))))) (PreH30 : (i1 = (xt_current_input (G) (k_2) (((block_height - bh ) + 1 ))))) (PreH31 : (o0 = (xt_current_output (G) (k_2) ((block_height - bh ))))) (PreH32 : (o1 = (xt_current_output (G) ((xt_neon_second (k_2) (block_width))) ((block_height - bh ))))) (PreH33 : (xt_progress F G old R_2 k_2 (xt_neon_batch (block_width)) (block_height - bh ) )) (PreH34 : ((Z.land bh 1) = 0)) ,
  (xt_data F )
  **  (xt_output W R_2 )
|--
  EX (R: XTOutput)  (k: Z) ,
  “ (xt_valid F W G ) ” 
  &&  “ (input = (xt_input (G))) ” 
  &&  “ (output = (xt_output_base (G))) ” 
  &&  “ (input_stride = (xt_input_stride (G))) ” 
  &&  “ (output_stride = (xt_output_stride (G))) ” 
  &&  “ (block_height = (xt_height (G))) ” 
  &&  “ (0 < block_height) ” 
  &&  “ (sizeof(UINT) = 4) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (tile_height = 2) ” 
  &&  “ (tile_width = 2) ” 
  &&  “ (tile_hbytes = 8) ” 
  &&  “ (tile_wbytes = 8) ” 
  &&  “ (input_reset = (xt_neon_input_reset (G))) ” 
  &&  “ (input_offset = (xt_neon_input_offset (G))) ” 
  &&  “ (output_reset = (xt_neon_output_reset (G))) ” 
  &&  “ (0 <= k) ” 
  &&  “ (k <= ((xt_cols (G)) + 1 )) ” 
  &&  “ ((k % ( 2 ) ) = 0) ” 
  &&  “ (block_width = (xt_doz ((xt_cols (G))) (k))) ” 
  &&  “ (0 < block_width) ” 
  &&  “ (k < (xt_cols (G))) ” 
  &&  “ (0 <= bh) ” 
  &&  “ (bh <= 1) ” 
  &&  “ (((block_height - bh ) % ( 2 ) ) = 0) ” 
  &&  “ (i0 = (xt_current_input (G) (k) ((block_height - bh )))) ” 
  &&  “ (i1 = (xt_current_input (G) (k) (((block_height - bh ) + 1 )))) ” 
  &&  “ (o0 = (xt_current_output (G) (k) ((block_height - bh )))) ” 
  &&  “ (o1 = (xt_current_output (G) ((xt_neon_second (k) (block_width))) ((block_height - bh )))) ” 
  &&  “ (xt_progress F G old R k (xt_neon_batch (block_width)) block_height ) ”
  &&  (xt_data F )
  **  (xt_output W R )
) \/
(
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (R_2: XTOutput) (o1: Z) (o0: Z) (i1: Z) (i0: Z) (bh: Z) (block_width: Z) (k_2: Z) (output_reset: Z) (input_offset: Z) (input_reset: Z) (tile_wbytes: Z) (tile_hbytes: Z) (tile_width: Z) (tile_height: Z) (block_height: Z) (output_stride: Z) (input_stride: Z) (output: Z) (input: Z) (PreH1 : (bh <> 0)) (PreH2 : (bh < 2)) (PreH3 : (xt_valid F W G )) (PreH4 : (input = (xt_input (G)))) (PreH5 : (output = (xt_output_base (G)))) (PreH6 : (input_stride = (xt_input_stride (G)))) (PreH7 : (output_stride = (xt_output_stride (G)))) (PreH8 : (block_height = (xt_height (G)))) (PreH9 : (0 < block_height)) (PreH10 : (sizeof(UINT) = 4)) (PreH11 : (sizeof(UINT64) = 8)) (PreH12 : (sizeof(UINT64) = 8)) (PreH13 : (tile_height = 2)) (PreH14 : (tile_width = 2)) (PreH15 : (tile_hbytes = 8)) (PreH16 : (tile_wbytes = 8)) (PreH17 : (input_reset = (xt_neon_input_reset (G)))) (PreH18 : (input_offset = (xt_neon_input_offset (G)))) (PreH19 : (output_reset = (xt_neon_output_reset (G)))) (PreH20 : (0 <= k_2)) (PreH21 : (k_2 <= ((xt_cols (G)) + 1 ))) (PreH22 : ((k_2 % ( 2 ) ) = 0)) (PreH23 : (block_width = (xt_doz ((xt_cols (G))) (k_2)))) (PreH24 : (0 < block_width)) (PreH25 : (k_2 < (xt_cols (G)))) (PreH26 : (0 <= bh)) (PreH27 : (bh <= block_height)) (PreH28 : (((block_height - bh ) % ( 2 ) ) = 0)) (PreH29 : (i0 = (xt_current_input (G) (k_2) ((block_height - bh ))))) (PreH30 : (i1 = (xt_current_input (G) (k_2) (((block_height - bh ) + 1 ))))) (PreH31 : (o0 = (xt_current_output (G) (k_2) ((block_height - bh ))))) (PreH32 : (o1 = (xt_current_output (G) ((xt_neon_second (k_2) (block_width))) ((block_height - bh ))))) (PreH33 : (xt_progress F G old R_2 k_2 (xt_neon_batch (block_width)) (block_height - bh ) )) (PreH34 : ((Z.land bh 1) = 0)) ,
  TT && emp 
|--
  EX (k: Z) ,
  “ (sizeof(UINT64) = 8) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (0 <= k) ” 
  &&  “ (k <= ((xt_cols (G)) + 1 )) ” 
  &&  “ ((k % ( 2 ) ) = 0) ” 
  &&  “ ((xt_doz ((xt_cols (G))) (k_2)) = (xt_doz ((xt_cols (G))) (k))) ” 
  &&  “ (k < (xt_cols (G))) ” 
  &&  “ (bh <= 1) ” 
  &&  “ ((xt_current_input (G) (k_2) ((block_height - bh ))) = (xt_current_input (G) (k) (((xt_height (G)) - bh )))) ” 
  &&  “ ((xt_current_input (G) (k_2) (((block_height - bh ) + 1 ))) = (xt_current_input (G) (k) ((((xt_height (G)) - bh ) + 1 )))) ” 
  &&  “ ((xt_current_output (G) (k_2) ((block_height - bh ))) = (xt_current_output (G) (k) (((xt_height (G)) - bh )))) ” 
  &&  “ ((xt_current_output (G) ((xt_neon_second (k_2) (block_width))) ((block_height - bh ))) = (xt_current_output (G) ((xt_neon_second (k) ((xt_doz ((xt_cols (G))) (k_2))))) (((xt_height (G)) - bh )))) ” 
  &&  “ (xt_progress F G old R_2 k (xt_neon_batch ((xt_doz ((xt_cols (G))) (k_2)))) (xt_height (G)) ) ”
  &&  emp
).

Definition test_neon_entail_wit_5_3 := 
(
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (R_2: XTOutput) (o1: Z) (o0: Z) (i1: Z) (i0: Z) (bh: Z) (block_width: Z) (k_2: Z) (output_reset: Z) (input_offset: Z) (input_reset: Z) (tile_wbytes: Z) (tile_hbytes: Z) (tile_width: Z) (tile_height: Z) (block_height: Z) (output_stride: Z) (input_stride: Z) (output: Z) (input: Z) (PreH1 : (bh = 0)) (PreH2 : (bh < 2)) (PreH3 : (xt_valid F W G )) (PreH4 : (input = (xt_input (G)))) (PreH5 : (output = (xt_output_base (G)))) (PreH6 : (input_stride = (xt_input_stride (G)))) (PreH7 : (output_stride = (xt_output_stride (G)))) (PreH8 : (block_height = (xt_height (G)))) (PreH9 : (0 < block_height)) (PreH10 : (sizeof(UINT) = 4)) (PreH11 : (sizeof(UINT64) = 8)) (PreH12 : (sizeof(UINT64) = 8)) (PreH13 : (tile_height = 2)) (PreH14 : (tile_width = 2)) (PreH15 : (tile_hbytes = 8)) (PreH16 : (tile_wbytes = 8)) (PreH17 : (input_reset = (xt_neon_input_reset (G)))) (PreH18 : (input_offset = (xt_neon_input_offset (G)))) (PreH19 : (output_reset = (xt_neon_output_reset (G)))) (PreH20 : (0 <= k_2)) (PreH21 : (k_2 <= ((xt_cols (G)) + 1 ))) (PreH22 : ((k_2 % ( 2 ) ) = 0)) (PreH23 : (block_width = (xt_doz ((xt_cols (G))) (k_2)))) (PreH24 : (0 < block_width)) (PreH25 : (k_2 < (xt_cols (G)))) (PreH26 : (0 <= bh)) (PreH27 : (bh <= block_height)) (PreH28 : (((block_height - bh ) % ( 2 ) ) = 0)) (PreH29 : (i0 = (xt_current_input (G) (k_2) ((block_height - bh ))))) (PreH30 : (i1 = (xt_current_input (G) (k_2) (((block_height - bh ) + 1 ))))) (PreH31 : (o0 = (xt_current_output (G) (k_2) ((block_height - bh ))))) (PreH32 : (o1 = (xt_current_output (G) ((xt_neon_second (k_2) (block_width))) ((block_height - bh ))))) (PreH33 : (xt_progress F G old R_2 k_2 (xt_neon_batch (block_width)) (block_height - bh ) )) ,
  (xt_data F )
  **  (xt_output W R_2 )
|--
  EX (R: XTOutput)  (k: Z) ,
  “ (xt_valid F W G ) ” 
  &&  “ (input = (xt_input (G))) ” 
  &&  “ (output = (xt_output_base (G))) ” 
  &&  “ (input_stride = (xt_input_stride (G))) ” 
  &&  “ (output_stride = (xt_output_stride (G))) ” 
  &&  “ (block_height = (xt_height (G))) ” 
  &&  “ (0 < block_height) ” 
  &&  “ (sizeof(UINT) = 4) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (tile_height = 2) ” 
  &&  “ (tile_width = 2) ” 
  &&  “ (tile_hbytes = 8) ” 
  &&  “ (tile_wbytes = 8) ” 
  &&  “ (input_reset = (xt_neon_input_reset (G))) ” 
  &&  “ (input_offset = (xt_neon_input_offset (G))) ” 
  &&  “ (output_reset = (xt_neon_output_reset (G))) ” 
  &&  “ (0 <= k) ” 
  &&  “ (k <= ((xt_cols (G)) + 1 )) ” 
  &&  “ ((k % ( 2 ) ) = 0) ” 
  &&  “ (block_width = (xt_doz ((xt_cols (G))) (k))) ” 
  &&  “ (0 < block_width) ” 
  &&  “ (k < (xt_cols (G))) ” 
  &&  “ (0 <= bh) ” 
  &&  “ (bh <= 1) ” 
  &&  “ (((block_height - bh ) % ( 2 ) ) = 0) ” 
  &&  “ (i0 = (xt_current_input (G) (k) ((block_height - bh )))) ” 
  &&  “ (i1 = (xt_current_input (G) (k) (((block_height - bh ) + 1 )))) ” 
  &&  “ (o0 = (xt_current_output (G) (k) ((block_height - bh )))) ” 
  &&  “ (o1 = (xt_current_output (G) ((xt_neon_second (k) (block_width))) ((block_height - bh )))) ” 
  &&  “ (xt_progress F G old R k (xt_neon_batch (block_width)) block_height ) ”
  &&  (xt_data F )
  **  (xt_output W R )
) \/
(
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (R_2: XTOutput) (o1: Z) (o0: Z) (i1: Z) (i0: Z) (bh: Z) (block_width: Z) (k_2: Z) (output_reset: Z) (input_offset: Z) (input_reset: Z) (tile_wbytes: Z) (tile_hbytes: Z) (tile_width: Z) (tile_height: Z) (block_height: Z) (output_stride: Z) (input_stride: Z) (output: Z) (input: Z) (PreH1 : (bh = 0)) (PreH2 : (bh < 2)) (PreH3 : (xt_valid F W G )) (PreH4 : (input = (xt_input (G)))) (PreH5 : (output = (xt_output_base (G)))) (PreH6 : (input_stride = (xt_input_stride (G)))) (PreH7 : (output_stride = (xt_output_stride (G)))) (PreH8 : (block_height = (xt_height (G)))) (PreH9 : (0 < block_height)) (PreH10 : (sizeof(UINT) = 4)) (PreH11 : (sizeof(UINT64) = 8)) (PreH12 : (sizeof(UINT64) = 8)) (PreH13 : (tile_height = 2)) (PreH14 : (tile_width = 2)) (PreH15 : (tile_hbytes = 8)) (PreH16 : (tile_wbytes = 8)) (PreH17 : (input_reset = (xt_neon_input_reset (G)))) (PreH18 : (input_offset = (xt_neon_input_offset (G)))) (PreH19 : (output_reset = (xt_neon_output_reset (G)))) (PreH20 : (0 <= k_2)) (PreH21 : (k_2 <= ((xt_cols (G)) + 1 ))) (PreH22 : ((k_2 % ( 2 ) ) = 0)) (PreH23 : (block_width = (xt_doz ((xt_cols (G))) (k_2)))) (PreH24 : (0 < block_width)) (PreH25 : (k_2 < (xt_cols (G)))) (PreH26 : (0 <= bh)) (PreH27 : (bh <= block_height)) (PreH28 : (((block_height - bh ) % ( 2 ) ) = 0)) (PreH29 : (i0 = (xt_current_input (G) (k_2) ((block_height - bh ))))) (PreH30 : (i1 = (xt_current_input (G) (k_2) (((block_height - bh ) + 1 ))))) (PreH31 : (o0 = (xt_current_output (G) (k_2) ((block_height - bh ))))) (PreH32 : (o1 = (xt_current_output (G) ((xt_neon_second (k_2) (block_width))) ((block_height - bh ))))) (PreH33 : (xt_progress F G old R_2 k_2 (xt_neon_batch (block_width)) (block_height - bh ) )) ,
  TT && emp 
|--
  EX (k: Z) ,
  “ (sizeof(UINT64) = 8) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (0 <= k) ” 
  &&  “ (k <= ((xt_cols (G)) + 1 )) ” 
  &&  “ ((k % ( 2 ) ) = 0) ” 
  &&  “ ((xt_doz ((xt_cols (G))) (k_2)) = (xt_doz ((xt_cols (G))) (k))) ” 
  &&  “ (k < (xt_cols (G))) ” 
  &&  “ (0 <= 1) ” 
  &&  “ ((xt_current_input (G) (k_2) ((block_height - bh ))) = (xt_current_input (G) (k) (((xt_height (G)) - 0 )))) ” 
  &&  “ ((xt_current_input (G) (k_2) (((block_height - bh ) + 1 ))) = (xt_current_input (G) (k) ((((xt_height (G)) - 0 ) + 1 )))) ” 
  &&  “ ((xt_current_output (G) (k_2) ((block_height - bh ))) = (xt_current_output (G) (k) (((xt_height (G)) - 0 )))) ” 
  &&  “ ((xt_current_output (G) ((xt_neon_second (k_2) (block_width))) ((block_height - bh ))) = (xt_current_output (G) ((xt_neon_second (k) ((xt_doz ((xt_cols (G))) (k_2))))) (((xt_height (G)) - 0 )))) ” 
  &&  “ (xt_progress F G old R_2 k (xt_neon_batch ((xt_doz ((xt_cols (G))) (k_2)))) (xt_height (G)) ) ”
  &&  emp
).

Definition test_neon_entail_wit_6 := 
(
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (k_2: Z) (R_2: XTOutput) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_height: Z) (tile_height: Z) (tile_width: Z) (tile_hbytes: Z) (tile_wbytes: Z) (input_reset: Z) (input_offset: Z) (output_reset: Z) (block_width: Z) (bh: Z) (i0: Z) (i1: Z) (o0: Z) (o1: Z) (retval: Z) (PreH1 : (retval = (xt_doz (block_width) (tile_width)))) (PreH2 : (xt_valid F W G )) (PreH3 : (input = (xt_input (G)))) (PreH4 : (output = (xt_output_base (G)))) (PreH5 : (input_stride = (xt_input_stride (G)))) (PreH6 : (output_stride = (xt_output_stride (G)))) (PreH7 : (block_height = (xt_height (G)))) (PreH8 : (0 < block_height)) (PreH9 : (sizeof(UINT) = 4)) (PreH10 : (sizeof(UINT64) = 8)) (PreH11 : (sizeof(UINT64) = 8)) (PreH12 : (tile_height = 2)) (PreH13 : (tile_width = 2)) (PreH14 : (tile_hbytes = 8)) (PreH15 : (tile_wbytes = 8)) (PreH16 : (input_reset = (xt_neon_input_reset (G)))) (PreH17 : (input_offset = (xt_neon_input_offset (G)))) (PreH18 : (output_reset = (xt_neon_output_reset (G)))) (PreH19 : (0 <= k_2)) (PreH20 : (k_2 <= ((xt_cols (G)) + 1 ))) (PreH21 : ((k_2 % ( 2 ) ) = 0)) (PreH22 : (block_width = (xt_doz ((xt_cols (G))) (k_2)))) (PreH23 : (0 < block_width)) (PreH24 : (k_2 < (xt_cols (G)))) (PreH25 : (0 <= bh)) (PreH26 : (bh <= 1)) (PreH27 : (((block_height - bh ) % ( 2 ) ) = 0)) (PreH28 : (i0 = (xt_current_input (G) (k_2) ((block_height - bh ))))) (PreH29 : (i1 = (xt_current_input (G) (k_2) (((block_height - bh ) + 1 ))))) (PreH30 : (o0 = (xt_current_output (G) (k_2) ((block_height - bh ))))) (PreH31 : (o1 = (xt_current_output (G) ((xt_neon_second (k_2) (block_width))) ((block_height - bh ))))) (PreH32 : (xt_progress F G old R_2 k_2 (xt_neon_batch (block_width)) block_height )) ,
  (xt_data F )
  **  (xt_output W R_2 )
|--
  EX (R: XTOutput)  (k: Z) ,
  “ (xt_valid F W G ) ” 
  &&  “ (input = (xt_input (G))) ” 
  &&  “ (output = (xt_output_base (G))) ” 
  &&  “ (input_stride = (xt_input_stride (G))) ” 
  &&  “ (output_stride = (xt_output_stride (G))) ” 
  &&  “ (block_height = (xt_height (G))) ” 
  &&  “ (0 < block_height) ” 
  &&  “ (sizeof(UINT) = 4) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (tile_height = 2) ” 
  &&  “ (tile_width = 2) ” 
  &&  “ (tile_hbytes = 8) ” 
  &&  “ (tile_wbytes = 8) ” 
  &&  “ (input_reset = (xt_neon_input_reset (G))) ” 
  &&  “ (input_offset = (xt_neon_input_offset (G))) ” 
  &&  “ (output_reset = (xt_neon_output_reset (G))) ” 
  &&  “ (0 <= k) ” 
  &&  “ (k <= ((xt_cols (G)) + 1 )) ” 
  &&  “ ((k % ( 2 ) ) = 0) ” 
  &&  “ (retval = (xt_doz ((xt_cols (G))) (k))) ” 
  &&  “ ((unsigned_last_nbits (((unsigned_last_nbits (i0) (64)) + input_reset )) (64)) = (xt_current_input (G) (k) (0))) ” 
  &&  “ ((unsigned_last_nbits (((unsigned_last_nbits (((unsigned_last_nbits (i0) (64)) + input_reset )) (64)) + input_stride )) (64)) = (xt_current_input (G) (k) (1))) ” 
  &&  “ ((unsigned_last_nbits (((unsigned_last_nbits (o0) (64)) + output_reset )) (64)) = (xt_current_output (G) (k) (0))) ” 
  &&  “ (xt_neon_next G k retval (unsigned_last_nbits (((unsigned_last_nbits (o1) (64)) + output_reset )) (64)) ) ” 
  &&  “ (xt_progress F G old R k 0 0 ) ”
  &&  (xt_data F )
  **  (xt_output W R )
) \/
(
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (k_2: Z) (R_2: XTOutput) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_height: Z) (tile_height: Z) (tile_width: Z) (tile_hbytes: Z) (tile_wbytes: Z) (input_reset: Z) (input_offset: Z) (output_reset: Z) (block_width: Z) (bh: Z) (i0: Z) (i1: Z) (o0: Z) (o1: Z) (retval: Z) (PreH1 : (retval = (xt_doz (block_width) (tile_width)))) (PreH2 : (xt_valid F W G )) (PreH3 : (input = (xt_input (G)))) (PreH4 : (output = (xt_output_base (G)))) (PreH5 : (input_stride = (xt_input_stride (G)))) (PreH6 : (output_stride = (xt_output_stride (G)))) (PreH7 : (block_height = (xt_height (G)))) (PreH8 : (0 < block_height)) (PreH9 : (sizeof(UINT) = 4)) (PreH10 : (sizeof(UINT64) = 8)) (PreH11 : (sizeof(UINT64) = 8)) (PreH12 : (tile_height = 2)) (PreH13 : (tile_width = 2)) (PreH14 : (tile_hbytes = 8)) (PreH15 : (tile_wbytes = 8)) (PreH16 : (input_reset = (xt_neon_input_reset (G)))) (PreH17 : (input_offset = (xt_neon_input_offset (G)))) (PreH18 : (output_reset = (xt_neon_output_reset (G)))) (PreH19 : (0 <= k_2)) (PreH20 : (k_2 <= ((xt_cols (G)) + 1 ))) (PreH21 : ((k_2 % ( 2 ) ) = 0)) (PreH22 : (block_width = (xt_doz ((xt_cols (G))) (k_2)))) (PreH23 : (0 < block_width)) (PreH24 : (k_2 < (xt_cols (G)))) (PreH25 : (0 <= bh)) (PreH26 : (bh <= 1)) (PreH27 : (((block_height - bh ) % ( 2 ) ) = 0)) (PreH28 : (i0 = (xt_current_input (G) (k_2) ((block_height - bh ))))) (PreH29 : (i1 = (xt_current_input (G) (k_2) (((block_height - bh ) + 1 ))))) (PreH30 : (o0 = (xt_current_output (G) (k_2) ((block_height - bh ))))) (PreH31 : (o1 = (xt_current_output (G) ((xt_neon_second (k_2) (block_width))) ((block_height - bh ))))) (PreH32 : (xt_progress F G old R_2 k_2 (xt_neon_batch (block_width)) block_height )) ,
  TT && emp 
|--
  EX (k: Z) ,
  “ (sizeof(UINT64) = 8) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (0 <= k) ” 
  &&  “ (k <= ((xt_cols (G)) + 1 )) ” 
  &&  “ ((k % ( 2 ) ) = 0) ” 
  &&  “ ((xt_doz ((xt_doz ((xt_cols (G))) (k_2))) (2)) = (xt_doz ((xt_cols (G))) (k))) ” 
  &&  “ ((unsigned_last_nbits (((unsigned_last_nbits ((xt_current_input (G) (k_2) ((block_height - bh )))) (64)) + (xt_neon_input_reset (G)) )) (64)) = (xt_current_input (G) (k) (0))) ” 
  &&  “ ((unsigned_last_nbits (((unsigned_last_nbits (((unsigned_last_nbits ((xt_current_input (G) (k_2) ((block_height - bh )))) (64)) + (xt_neon_input_reset (G)) )) (64)) + (xt_input_stride (G)) )) (64)) = (xt_current_input (G) (k) (1))) ” 
  &&  “ ((unsigned_last_nbits (((unsigned_last_nbits ((xt_current_output (G) (k_2) ((block_height - bh )))) (64)) + (xt_neon_output_reset (G)) )) (64)) = (xt_current_output (G) (k) (0))) ” 
  &&  “ (xt_neon_next G k (xt_doz ((xt_doz ((xt_cols (G))) (k_2))) (2)) (unsigned_last_nbits (((unsigned_last_nbits ((xt_current_output (G) ((xt_neon_second (k_2) (block_width))) ((block_height - bh )))) (64)) + (xt_neon_output_reset (G)) )) (64)) ) ” 
  &&  “ (xt_progress F G old R_2 k 0 0 ) ”
  &&  emp
).

Definition test_neon_return_wit_1 := 
(
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height = 0)) (PreH2 : (input_stride >= (block_width * sizeof(UINT) ))) (PreH3 : (block_height <> 1)) (PreH4 : (block_width = 1)) (PreH5 : (xt_valid F W G )) (PreH6 : (input = (xt_input (G)))) (PreH7 : (output = (xt_output_base (G)))) (PreH8 : (input_stride = (xt_input_stride (G)))) (PreH9 : (output_stride = (xt_output_stride (G)))) (PreH10 : (block_width = (xt_width (G)))) (PreH11 : (block_height = (xt_height (G)))) (PreH12 : (sizeof(UINT) = 4)) (PreH13 : (sizeof(UINT64) = 8)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (block_width = 1)) (PreH16 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  (xt_data F )
  **  (xt_output W old )
|--
  EX (R: XTOutput) ,
  “ (xt_result F G old R ) ”
  &&  (xt_data F )
  **  (xt_output W R )
) \/
(
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height = 0)) (PreH2 : (input_stride >= (block_width * sizeof(UINT) ))) (PreH3 : (block_height <> 1)) (PreH4 : (block_width = 1)) (PreH5 : (xt_valid F W G )) (PreH6 : (input = (xt_input (G)))) (PreH7 : (output = (xt_output_base (G)))) (PreH8 : (input_stride = (xt_input_stride (G)))) (PreH9 : (output_stride = (xt_output_stride (G)))) (PreH10 : (block_width = (xt_width (G)))) (PreH11 : (block_height = (xt_height (G)))) (PreH12 : (sizeof(UINT) = 4)) (PreH13 : (sizeof(UINT64) = 8)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (block_width = 1)) (PreH16 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  TT && emp 
|--
  “ (xt_result F G old old ) ”
  &&  emp
).

Definition test_neon_return_wit_1_split_goal_1 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height = 0)) (PreH2 : (input_stride >= (block_width * sizeof(UINT) ))) (PreH3 : (block_height <> 1)) (PreH4 : (block_width = 1)) (PreH5 : (xt_valid F W G )) (PreH6 : (input = (xt_input (G)))) (PreH7 : (output = (xt_output_base (G)))) (PreH8 : (input_stride = (xt_input_stride (G)))) (PreH9 : (output_stride = (xt_output_stride (G)))) (PreH10 : (block_width = (xt_width (G)))) (PreH11 : (block_height = (xt_height (G)))) (PreH12 : (sizeof(UINT) = 4)) (PreH13 : (sizeof(UINT64) = 8)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (block_width = 1)) (PreH16 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  (xt_result F G old old )
.

Definition test_neon_return_wit_2 := 
(
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height = 0)) (PreH2 : (input_stride >= (block_width * sizeof(UINT) ))) (PreH3 : (block_height <> 1)) (PreH4 : (block_width = 1)) (PreH5 : (xt_valid F W G )) (PreH6 : (input = (xt_input (G)))) (PreH7 : (output = (xt_output_base (G)))) (PreH8 : (input_stride = (xt_input_stride (G)))) (PreH9 : (output_stride = (xt_output_stride (G)))) (PreH10 : (block_width = (xt_width (G)))) (PreH11 : (block_height = (xt_height (G)))) (PreH12 : (sizeof(UINT) = 4)) (PreH13 : (sizeof(UINT64) = 8)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH16 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  (xt_data F )
  **  (xt_output W old )
|--
  EX (R: XTOutput) ,
  “ (xt_result F G old R ) ”
  &&  (xt_data F )
  **  (xt_output W R )
) \/
(
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height = 0)) (PreH2 : (input_stride >= (block_width * sizeof(UINT) ))) (PreH3 : (block_height <> 1)) (PreH4 : (block_width = 1)) (PreH5 : (xt_valid F W G )) (PreH6 : (input = (xt_input (G)))) (PreH7 : (output = (xt_output_base (G)))) (PreH8 : (input_stride = (xt_input_stride (G)))) (PreH9 : (output_stride = (xt_output_stride (G)))) (PreH10 : (block_width = (xt_width (G)))) (PreH11 : (block_height = (xt_height (G)))) (PreH12 : (sizeof(UINT) = 4)) (PreH13 : (sizeof(UINT64) = 8)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH16 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  TT && emp 
|--
  “ (xt_result F G old old ) ”
  &&  emp
).

Definition test_neon_return_wit_2_split_goal_1 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height = 0)) (PreH2 : (input_stride >= (block_width * sizeof(UINT) ))) (PreH3 : (block_height <> 1)) (PreH4 : (block_width = 1)) (PreH5 : (xt_valid F W G )) (PreH6 : (input = (xt_input (G)))) (PreH7 : (output = (xt_output_base (G)))) (PreH8 : (input_stride = (xt_input_stride (G)))) (PreH9 : (output_stride = (xt_output_stride (G)))) (PreH10 : (block_width = (xt_width (G)))) (PreH11 : (block_height = (xt_height (G)))) (PreH12 : (sizeof(UINT) = 4)) (PreH13 : (sizeof(UINT64) = 8)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH16 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  (xt_result F G old old )
.

Definition test_neon_return_wit_3 := 
(
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height = 0)) (PreH2 : (input_stride >= (unsigned_last_nbits ((block_width * sizeof(UINT) )) (64)))) (PreH3 : (block_height <> 1)) (PreH4 : (output_stride >= (unsigned_last_nbits ((block_height * sizeof(UINT) )) (64)))) (PreH5 : (block_width <> 1)) (PreH6 : (xt_valid F W G )) (PreH7 : (input = (xt_input (G)))) (PreH8 : (output = (xt_output_base (G)))) (PreH9 : (input_stride = (xt_input_stride (G)))) (PreH10 : (output_stride = (xt_output_stride (G)))) (PreH11 : (block_width = (xt_width (G)))) (PreH12 : (block_height = (xt_height (G)))) (PreH13 : (sizeof(UINT) = 4)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH17 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  (xt_data F )
  **  (xt_output W old )
|--
  EX (R: XTOutput) ,
  “ (xt_result F G old R ) ”
  &&  (xt_data F )
  **  (xt_output W R )
) \/
(
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height = 0)) (PreH2 : (input_stride >= (unsigned_last_nbits ((block_width * sizeof(UINT) )) (64)))) (PreH3 : (block_height <> 1)) (PreH4 : (output_stride >= (unsigned_last_nbits ((block_height * sizeof(UINT) )) (64)))) (PreH5 : (block_width <> 1)) (PreH6 : (xt_valid F W G )) (PreH7 : (input = (xt_input (G)))) (PreH8 : (output = (xt_output_base (G)))) (PreH9 : (input_stride = (xt_input_stride (G)))) (PreH10 : (output_stride = (xt_output_stride (G)))) (PreH11 : (block_width = (xt_width (G)))) (PreH12 : (block_height = (xt_height (G)))) (PreH13 : (sizeof(UINT) = 4)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH17 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  TT && emp 
|--
  “ (xt_result F G old old ) ”
  &&  emp
).

Definition test_neon_return_wit_3_split_goal_1 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_height = 0)) (PreH2 : (input_stride >= (unsigned_last_nbits ((block_width * sizeof(UINT) )) (64)))) (PreH3 : (block_height <> 1)) (PreH4 : (output_stride >= (unsigned_last_nbits ((block_height * sizeof(UINT) )) (64)))) (PreH5 : (block_width <> 1)) (PreH6 : (xt_valid F W G )) (PreH7 : (input = (xt_input (G)))) (PreH8 : (output = (xt_output_base (G)))) (PreH9 : (input_stride = (xt_input_stride (G)))) (PreH10 : (output_stride = (xt_output_stride (G)))) (PreH11 : (block_width = (xt_width (G)))) (PreH12 : (block_height = (xt_height (G)))) (PreH13 : (sizeof(UINT) = 4)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH17 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  (xt_result F G old old )
.

Definition test_neon_return_wit_4 := 
(
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (R_2: XTOutput) (o1: Z) (o0: Z) (i1: Z) (i0: Z) (block_width: Z) (k: Z) (output_reset: Z) (input_offset: Z) (input_reset: Z) (tile_wbytes: Z) (tile_hbytes: Z) (tile_width: Z) (tile_height: Z) (block_height: Z) (output_stride: Z) (input_stride: Z) (output: Z) (input: Z) (PreH1 : (block_width = 0)) (PreH2 : (xt_valid F W G )) (PreH3 : (input = (xt_input (G)))) (PreH4 : (output = (xt_output_base (G)))) (PreH5 : (input_stride = (xt_input_stride (G)))) (PreH6 : (output_stride = (xt_output_stride (G)))) (PreH7 : (block_height = (xt_height (G)))) (PreH8 : (0 < block_height)) (PreH9 : (sizeof(UINT) = 4)) (PreH10 : (sizeof(UINT64) = 8)) (PreH11 : (sizeof(UINT64) = 8)) (PreH12 : (tile_height = 2)) (PreH13 : (tile_width = 2)) (PreH14 : (tile_hbytes = 8)) (PreH15 : (tile_wbytes = 8)) (PreH16 : (input_reset = (xt_neon_input_reset (G)))) (PreH17 : (input_offset = (xt_neon_input_offset (G)))) (PreH18 : (output_reset = (xt_neon_output_reset (G)))) (PreH19 : (0 <= k)) (PreH20 : (k <= ((xt_cols (G)) + 1 ))) (PreH21 : ((k % ( 2 ) ) = 0)) (PreH22 : (block_width = (xt_doz ((xt_cols (G))) (k)))) (PreH23 : (i0 = (xt_current_input (G) (k) (0)))) (PreH24 : (i1 = (xt_current_input (G) (k) (1)))) (PreH25 : (o0 = (xt_current_output (G) (k) (0)))) (PreH26 : (xt_neon_next G k block_width o1 )) (PreH27 : (xt_progress F G old R_2 k 0 0 )) ,
  (xt_data F )
  **  (xt_output W R_2 )
|--
  EX (R: XTOutput) ,
  “ (xt_result F G old R ) ”
  &&  (xt_data F )
  **  (xt_output W R )
) \/
(
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (R_2: XTOutput) (o1: Z) (o0: Z) (i1: Z) (i0: Z) (block_width: Z) (k: Z) (output_reset: Z) (input_offset: Z) (input_reset: Z) (tile_wbytes: Z) (tile_hbytes: Z) (tile_width: Z) (tile_height: Z) (block_height: Z) (output_stride: Z) (input_stride: Z) (output: Z) (input: Z) (PreH1 : (block_width = 0)) (PreH2 : (xt_valid F W G )) (PreH3 : (input = (xt_input (G)))) (PreH4 : (output = (xt_output_base (G)))) (PreH5 : (input_stride = (xt_input_stride (G)))) (PreH6 : (output_stride = (xt_output_stride (G)))) (PreH7 : (block_height = (xt_height (G)))) (PreH8 : (0 < block_height)) (PreH9 : (sizeof(UINT) = 4)) (PreH10 : (sizeof(UINT64) = 8)) (PreH11 : (sizeof(UINT64) = 8)) (PreH12 : (tile_height = 2)) (PreH13 : (tile_width = 2)) (PreH14 : (tile_hbytes = 8)) (PreH15 : (tile_wbytes = 8)) (PreH16 : (input_reset = (xt_neon_input_reset (G)))) (PreH17 : (input_offset = (xt_neon_input_offset (G)))) (PreH18 : (output_reset = (xt_neon_output_reset (G)))) (PreH19 : (0 <= k)) (PreH20 : (k <= ((xt_cols (G)) + 1 ))) (PreH21 : ((k % ( 2 ) ) = 0)) (PreH22 : (block_width = (xt_doz ((xt_cols (G))) (k)))) (PreH23 : (i0 = (xt_current_input (G) (k) (0)))) (PreH24 : (i1 = (xt_current_input (G) (k) (1)))) (PreH25 : (o0 = (xt_current_output (G) (k) (0)))) (PreH26 : (xt_neon_next G k block_width o1 )) (PreH27 : (xt_progress F G old R_2 k 0 0 )) ,
  TT && emp 
|--
  “ (xt_result F G old R_2 ) ”
  &&  emp
).

Definition test_neon_return_wit_4_split_goal_1 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (R_2: XTOutput) (o1: Z) (o0: Z) (i1: Z) (i0: Z) (block_width: Z) (k: Z) (output_reset: Z) (input_offset: Z) (input_reset: Z) (tile_wbytes: Z) (tile_hbytes: Z) (tile_width: Z) (tile_height: Z) (block_height: Z) (output_stride: Z) (input_stride: Z) (output: Z) (input: Z) (PreH1 : (block_width = 0)) (PreH2 : (xt_valid F W G )) (PreH3 : (input = (xt_input (G)))) (PreH4 : (output = (xt_output_base (G)))) (PreH5 : (input_stride = (xt_input_stride (G)))) (PreH6 : (output_stride = (xt_output_stride (G)))) (PreH7 : (block_height = (xt_height (G)))) (PreH8 : (0 < block_height)) (PreH9 : (sizeof(UINT) = 4)) (PreH10 : (sizeof(UINT64) = 8)) (PreH11 : (sizeof(UINT64) = 8)) (PreH12 : (tile_height = 2)) (PreH13 : (tile_width = 2)) (PreH14 : (tile_hbytes = 8)) (PreH15 : (tile_wbytes = 8)) (PreH16 : (input_reset = (xt_neon_input_reset (G)))) (PreH17 : (input_offset = (xt_neon_input_offset (G)))) (PreH18 : (output_reset = (xt_neon_output_reset (G)))) (PreH19 : (0 <= k)) (PreH20 : (k <= ((xt_cols (G)) + 1 ))) (PreH21 : ((k % ( 2 ) ) = 0)) (PreH22 : (block_width = (xt_doz ((xt_cols (G))) (k)))) (PreH23 : (i0 = (xt_current_input (G) (k) (0)))) (PreH24 : (i1 = (xt_current_input (G) (k) (1)))) (PreH25 : (o0 = (xt_current_output (G) (k) (0)))) (PreH26 : (xt_neon_next G k block_width o1 )) (PreH27 : (xt_progress F G old R_2 k 0 0 )) ,
  (xt_result F G old R_2 )
.

Definition test_neon_partial_solve_wit_1_pure := 
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

Definition test_neon_partial_solve_wit_1_aux := 
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

Definition test_neon_partial_solve_wit_1 := test_neon_partial_solve_wit_1_pure -> test_neon_partial_solve_wit_1_aux.

Definition test_neon_partial_solve_wit_2_pure := 
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

Definition test_neon_partial_solve_wit_2_aux := 
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

Definition test_neon_partial_solve_wit_2 := test_neon_partial_solve_wit_2_pure -> test_neon_partial_solve_wit_2_aux.

Definition test_neon_partial_solve_wit_3_pure := 
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

Definition test_neon_partial_solve_wit_3_aux := 
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

Definition test_neon_partial_solve_wit_3 := test_neon_partial_solve_wit_3_pure -> test_neon_partial_solve_wit_3_aux.

Definition test_neon_partial_solve_wit_4_pure := 
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

Definition test_neon_partial_solve_wit_4_aux := 
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

Definition test_neon_partial_solve_wit_4 := test_neon_partial_solve_wit_4_pure -> test_neon_partial_solve_wit_4_aux.

Definition test_neon_partial_solve_wit_5_pure := 
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

Definition test_neon_partial_solve_wit_5_aux := 
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

Definition test_neon_partial_solve_wit_5 := test_neon_partial_solve_wit_5_pure -> test_neon_partial_solve_wit_5_aux.

Definition test_neon_partial_solve_wit_6_pure := 
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

Definition test_neon_partial_solve_wit_6_aux := 
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

Definition test_neon_partial_solve_wit_6 := test_neon_partial_solve_wit_6_pure -> test_neon_partial_solve_wit_6_aux.

Definition test_neon_partial_solve_wit_7_pure := 
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

Definition test_neon_partial_solve_wit_7_aux := 
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

Definition test_neon_partial_solve_wit_7 := test_neon_partial_solve_wit_7_pure -> test_neon_partial_solve_wit_7_aux.

Definition test_neon_partial_solve_wit_8_pure := 
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

Definition test_neon_partial_solve_wit_8_aux := 
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

Definition test_neon_partial_solve_wit_8 := test_neon_partial_solve_wit_8_pure -> test_neon_partial_solve_wit_8_aux.

Definition test_neon_partial_solve_wit_9_pure := 
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

Definition test_neon_partial_solve_wit_9_aux := 
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

Definition test_neon_partial_solve_wit_9 := test_neon_partial_solve_wit_9_pure -> test_neon_partial_solve_wit_9_aux.

Definition test_neon_partial_solve_wit_10_pure := 
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

Definition test_neon_partial_solve_wit_10_aux := 
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

Definition test_neon_partial_solve_wit_10 := test_neon_partial_solve_wit_10_pure -> test_neon_partial_solve_wit_10_aux.

Definition test_neon_partial_solve_wit_11_pure := 
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

Definition test_neon_partial_solve_wit_11_aux := 
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

Definition test_neon_partial_solve_wit_11 := test_neon_partial_solve_wit_11_pure -> test_neon_partial_solve_wit_11_aux.

Definition test_neon_partial_solve_wit_12_pure := 
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

Definition test_neon_partial_solve_wit_12_aux := 
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

Definition test_neon_partial_solve_wit_12 := test_neon_partial_solve_wit_12_pure -> test_neon_partial_solve_wit_12_aux.

Definition test_neon_partial_solve_wit_13_pure := 
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

Definition test_neon_partial_solve_wit_13_aux := 
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

Definition test_neon_partial_solve_wit_13 := test_neon_partial_solve_wit_13_pure -> test_neon_partial_solve_wit_13_aux.

Definition test_neon_partial_solve_wit_14_pure := 
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

Definition test_neon_partial_solve_wit_14_aux := 
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

Definition test_neon_partial_solve_wit_14 := test_neon_partial_solve_wit_14_pure -> test_neon_partial_solve_wit_14_aux.

Definition test_neon_partial_solve_wit_15_pure := 
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

Definition test_neon_partial_solve_wit_15_aux := 
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

Definition test_neon_partial_solve_wit_15 := test_neon_partial_solve_wit_15_pure -> test_neon_partial_solve_wit_15_aux.

Definition test_neon_partial_solve_wit_16_pure := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_width = 0)) (PreH2 : (block_height <> 0)) (PreH3 : (block_height = 1)) (PreH4 : (output_stride >= (unsigned_last_nbits ((block_height * sizeof(UINT) )) (64)))) (PreH5 : (block_width <> 1)) (PreH6 : (xt_valid F W G )) (PreH7 : (input = (xt_input (G)))) (PreH8 : (output = (xt_output_base (G)))) (PreH9 : (input_stride = (xt_input_stride (G)))) (PreH10 : (output_stride = (xt_output_stride (G)))) (PreH11 : (block_width = (xt_width (G)))) (PreH12 : (block_height = (xt_height (G)))) (PreH13 : (sizeof(UINT) = 4)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH17 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  ((( &( "input_reset" ) )) # UInt64  |->_)
  **  ((( &( "tile_wbytes" ) )) # UInt64  |-> (2 * sizeof(UINT) ))
  **  ((( &( "tile_hbytes" ) )) # UInt64  |-> (2 * sizeof(UINT) ))
  **  ((( &( "tile_width" ) )) # UInt64  |-> 2)
  **  ((( &( "tile_height" ) )) # UInt64  |-> 2)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> 1)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (2 > 0) ”
.

Definition test_neon_partial_solve_wit_16_aux := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_width = 0)) (PreH2 : (block_height <> 0)) (PreH3 : (block_height = 1)) (PreH4 : (output_stride >= (unsigned_last_nbits ((block_height * sizeof(UINT) )) (64)))) (PreH5 : (block_width <> 1)) (PreH6 : (xt_valid F W G )) (PreH7 : (input = (xt_input (G)))) (PreH8 : (output = (xt_output_base (G)))) (PreH9 : (input_stride = (xt_input_stride (G)))) (PreH10 : (output_stride = (xt_output_stride (G)))) (PreH11 : (block_width = (xt_width (G)))) (PreH12 : (block_height = (xt_height (G)))) (PreH13 : (sizeof(UINT) = 4)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH17 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  (xt_data F )
  **  (xt_output W old )
|--
  “ (2 > 0) ” 
  &&  “ (block_width = 0) ” 
  &&  “ (block_height <> 0) ” 
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

Definition test_neon_partial_solve_wit_16 := test_neon_partial_solve_wit_16_pure -> test_neon_partial_solve_wit_16_aux.

Definition test_neon_partial_solve_wit_17_pure := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_width = 0)) (PreH2 : (block_height <> 0)) (PreH3 : (input_stride >= (unsigned_last_nbits ((block_width * sizeof(UINT) )) (64)))) (PreH4 : (block_height <> 1)) (PreH5 : (output_stride >= (unsigned_last_nbits ((block_height * sizeof(UINT) )) (64)))) (PreH6 : (block_width <> 1)) (PreH7 : (xt_valid F W G )) (PreH8 : (input = (xt_input (G)))) (PreH9 : (output = (xt_output_base (G)))) (PreH10 : (input_stride = (xt_input_stride (G)))) (PreH11 : (output_stride = (xt_output_stride (G)))) (PreH12 : (block_width = (xt_width (G)))) (PreH13 : (block_height = (xt_height (G)))) (PreH14 : (sizeof(UINT) = 4)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (sizeof(UINT64) = 8)) (PreH17 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH18 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  ((( &( "input_reset" ) )) # UInt64  |->_)
  **  ((( &( "tile_wbytes" ) )) # UInt64  |-> (2 * sizeof(UINT) ))
  **  ((( &( "tile_hbytes" ) )) # UInt64  |-> (2 * sizeof(UINT) ))
  **  ((( &( "tile_width" ) )) # UInt64  |-> 2)
  **  ((( &( "tile_height" ) )) # UInt64  |-> 2)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> 1)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (2 > 0) ”
.

Definition test_neon_partial_solve_wit_17_aux := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_width = 0)) (PreH2 : (block_height <> 0)) (PreH3 : (input_stride >= (unsigned_last_nbits ((block_width * sizeof(UINT) )) (64)))) (PreH4 : (block_height <> 1)) (PreH5 : (output_stride >= (unsigned_last_nbits ((block_height * sizeof(UINT) )) (64)))) (PreH6 : (block_width <> 1)) (PreH7 : (xt_valid F W G )) (PreH8 : (input = (xt_input (G)))) (PreH9 : (output = (xt_output_base (G)))) (PreH10 : (input_stride = (xt_input_stride (G)))) (PreH11 : (output_stride = (xt_output_stride (G)))) (PreH12 : (block_width = (xt_width (G)))) (PreH13 : (block_height = (xt_height (G)))) (PreH14 : (sizeof(UINT) = 4)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (sizeof(UINT64) = 8)) (PreH17 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH18 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  (xt_data F )
  **  (xt_output W old )
|--
  “ (2 > 0) ” 
  &&  “ (block_width = 0) ” 
  &&  “ (block_height <> 0) ” 
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

Definition test_neon_partial_solve_wit_17 := test_neon_partial_solve_wit_17_pure -> test_neon_partial_solve_wit_17_aux.

Definition test_neon_partial_solve_wit_18_pure := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_width = 0)) (PreH2 : (block_height <> 0)) (PreH3 : (block_height = 1)) (PreH4 : (output_stride >= (block_height * sizeof(UINT) ))) (PreH5 : (block_width <> 1)) (PreH6 : (xt_valid F W G )) (PreH7 : (input = (xt_input (G)))) (PreH8 : (output = (xt_output_base (G)))) (PreH9 : (input_stride = (xt_input_stride (G)))) (PreH10 : (output_stride = (xt_output_stride (G)))) (PreH11 : (block_width = (xt_width (G)))) (PreH12 : (block_height = (xt_height (G)))) (PreH13 : (sizeof(UINT) = 4)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH17 : (block_height = 1)) ,
  ((( &( "input_reset" ) )) # UInt64  |->_)
  **  ((( &( "tile_wbytes" ) )) # UInt64  |-> (2 * sizeof(UINT) ))
  **  ((( &( "tile_hbytes" ) )) # UInt64  |-> (2 * sizeof(UINT) ))
  **  ((( &( "tile_width" ) )) # UInt64  |-> 2)
  **  ((( &( "tile_height" ) )) # UInt64  |-> 2)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> 1)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (2 > 0) ”
.

Definition test_neon_partial_solve_wit_18_aux := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_width = 0)) (PreH2 : (block_height <> 0)) (PreH3 : (block_height = 1)) (PreH4 : (output_stride >= (block_height * sizeof(UINT) ))) (PreH5 : (block_width <> 1)) (PreH6 : (xt_valid F W G )) (PreH7 : (input = (xt_input (G)))) (PreH8 : (output = (xt_output_base (G)))) (PreH9 : (input_stride = (xt_input_stride (G)))) (PreH10 : (output_stride = (xt_output_stride (G)))) (PreH11 : (block_width = (xt_width (G)))) (PreH12 : (block_height = (xt_height (G)))) (PreH13 : (sizeof(UINT) = 4)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH17 : (block_height = 1)) ,
  (xt_data F )
  **  (xt_output W old )
|--
  “ (2 > 0) ” 
  &&  “ (block_width = 0) ” 
  &&  “ (block_height <> 0) ” 
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

Definition test_neon_partial_solve_wit_18 := test_neon_partial_solve_wit_18_pure -> test_neon_partial_solve_wit_18_aux.

Definition test_neon_partial_solve_wit_19_pure := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_width <> 0)) (PreH2 : (block_height <> 0)) (PreH3 : (block_height = 1)) (PreH4 : (block_width = 1)) (PreH5 : (xt_valid F W G )) (PreH6 : (input = (xt_input (G)))) (PreH7 : (output = (xt_output_base (G)))) (PreH8 : (input_stride = (xt_input_stride (G)))) (PreH9 : (output_stride = (xt_output_stride (G)))) (PreH10 : (block_width = (xt_width (G)))) (PreH11 : (block_height = (xt_height (G)))) (PreH12 : (sizeof(UINT) = 4)) (PreH13 : (sizeof(UINT64) = 8)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (block_width = 1)) (PreH16 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  ((( &( "input_reset" ) )) # UInt64  |->_)
  **  ((( &( "tile_wbytes" ) )) # UInt64  |-> (2 * sizeof(UINT) ))
  **  ((( &( "tile_hbytes" ) )) # UInt64  |-> (2 * sizeof(UINT) ))
  **  ((( &( "tile_width" ) )) # UInt64  |-> 2)
  **  ((( &( "tile_height" ) )) # UInt64  |-> 2)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (2 > 0) ”
.

Definition test_neon_partial_solve_wit_19_aux := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_width <> 0)) (PreH2 : (block_height <> 0)) (PreH3 : (block_height = 1)) (PreH4 : (block_width = 1)) (PreH5 : (xt_valid F W G )) (PreH6 : (input = (xt_input (G)))) (PreH7 : (output = (xt_output_base (G)))) (PreH8 : (input_stride = (xt_input_stride (G)))) (PreH9 : (output_stride = (xt_output_stride (G)))) (PreH10 : (block_width = (xt_width (G)))) (PreH11 : (block_height = (xt_height (G)))) (PreH12 : (sizeof(UINT) = 4)) (PreH13 : (sizeof(UINT64) = 8)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (block_width = 1)) (PreH16 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  (xt_data F )
  **  (xt_output W old )
|--
  “ (2 > 0) ” 
  &&  “ (block_width <> 0) ” 
  &&  “ (block_height <> 0) ” 
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

Definition test_neon_partial_solve_wit_19 := test_neon_partial_solve_wit_19_pure -> test_neon_partial_solve_wit_19_aux.

Definition test_neon_partial_solve_wit_20_pure := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_width <> 0)) (PreH2 : (block_height <> 0)) (PreH3 : (input_stride >= (block_width * sizeof(UINT) ))) (PreH4 : (block_height <> 1)) (PreH5 : (block_width = 1)) (PreH6 : (xt_valid F W G )) (PreH7 : (input = (xt_input (G)))) (PreH8 : (output = (xt_output_base (G)))) (PreH9 : (input_stride = (xt_input_stride (G)))) (PreH10 : (output_stride = (xt_output_stride (G)))) (PreH11 : (block_width = (xt_width (G)))) (PreH12 : (block_height = (xt_height (G)))) (PreH13 : (sizeof(UINT) = 4)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (block_width = 1)) (PreH17 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  ((( &( "input_reset" ) )) # UInt64  |->_)
  **  ((( &( "tile_wbytes" ) )) # UInt64  |-> (2 * sizeof(UINT) ))
  **  ((( &( "tile_hbytes" ) )) # UInt64  |-> (2 * sizeof(UINT) ))
  **  ((( &( "tile_width" ) )) # UInt64  |-> 2)
  **  ((( &( "tile_height" ) )) # UInt64  |-> 2)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (2 > 0) ”
.

Definition test_neon_partial_solve_wit_20_aux := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_width <> 0)) (PreH2 : (block_height <> 0)) (PreH3 : (input_stride >= (block_width * sizeof(UINT) ))) (PreH4 : (block_height <> 1)) (PreH5 : (block_width = 1)) (PreH6 : (xt_valid F W G )) (PreH7 : (input = (xt_input (G)))) (PreH8 : (output = (xt_output_base (G)))) (PreH9 : (input_stride = (xt_input_stride (G)))) (PreH10 : (output_stride = (xt_output_stride (G)))) (PreH11 : (block_width = (xt_width (G)))) (PreH12 : (block_height = (xt_height (G)))) (PreH13 : (sizeof(UINT) = 4)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (block_width = 1)) (PreH17 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  (xt_data F )
  **  (xt_output W old )
|--
  “ (2 > 0) ” 
  &&  “ (block_width <> 0) ” 
  &&  “ (block_height <> 0) ” 
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

Definition test_neon_partial_solve_wit_20 := test_neon_partial_solve_wit_20_pure -> test_neon_partial_solve_wit_20_aux.

Definition test_neon_partial_solve_wit_21_pure := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_width <> 0)) (PreH2 : (block_height <> 0)) (PreH3 : (block_height = 1)) (PreH4 : (block_width = 1)) (PreH5 : (xt_valid F W G )) (PreH6 : (input = (xt_input (G)))) (PreH7 : (output = (xt_output_base (G)))) (PreH8 : (input_stride = (xt_input_stride (G)))) (PreH9 : (output_stride = (xt_output_stride (G)))) (PreH10 : (block_width = (xt_width (G)))) (PreH11 : (block_height = (xt_height (G)))) (PreH12 : (sizeof(UINT) = 4)) (PreH13 : (sizeof(UINT64) = 8)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (block_width = 1)) (PreH16 : (block_height = 1)) ,
  ((( &( "input_reset" ) )) # UInt64  |->_)
  **  ((( &( "tile_wbytes" ) )) # UInt64  |-> (2 * sizeof(UINT) ))
  **  ((( &( "tile_hbytes" ) )) # UInt64  |-> (2 * sizeof(UINT) ))
  **  ((( &( "tile_width" ) )) # UInt64  |-> 2)
  **  ((( &( "tile_height" ) )) # UInt64  |-> 2)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (2 > 0) ”
.

Definition test_neon_partial_solve_wit_21_aux := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_width <> 0)) (PreH2 : (block_height <> 0)) (PreH3 : (block_height = 1)) (PreH4 : (block_width = 1)) (PreH5 : (xt_valid F W G )) (PreH6 : (input = (xt_input (G)))) (PreH7 : (output = (xt_output_base (G)))) (PreH8 : (input_stride = (xt_input_stride (G)))) (PreH9 : (output_stride = (xt_output_stride (G)))) (PreH10 : (block_width = (xt_width (G)))) (PreH11 : (block_height = (xt_height (G)))) (PreH12 : (sizeof(UINT) = 4)) (PreH13 : (sizeof(UINT64) = 8)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (block_width = 1)) (PreH16 : (block_height = 1)) ,
  (xt_data F )
  **  (xt_output W old )
|--
  “ (2 > 0) ” 
  &&  “ (block_width <> 0) ” 
  &&  “ (block_height <> 0) ” 
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

Definition test_neon_partial_solve_wit_21 := test_neon_partial_solve_wit_21_pure -> test_neon_partial_solve_wit_21_aux.

Definition test_neon_partial_solve_wit_22_pure := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_width <> 0)) (PreH2 : (block_height <> 0)) (PreH3 : (block_height = 1)) (PreH4 : (block_width = 1)) (PreH5 : (xt_valid F W G )) (PreH6 : (input = (xt_input (G)))) (PreH7 : (output = (xt_output_base (G)))) (PreH8 : (input_stride = (xt_input_stride (G)))) (PreH9 : (output_stride = (xt_output_stride (G)))) (PreH10 : (block_width = (xt_width (G)))) (PreH11 : (block_height = (xt_height (G)))) (PreH12 : (sizeof(UINT) = 4)) (PreH13 : (sizeof(UINT64) = 8)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH16 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  ((( &( "input_reset" ) )) # UInt64  |->_)
  **  ((( &( "tile_wbytes" ) )) # UInt64  |-> (2 * sizeof(UINT) ))
  **  ((( &( "tile_hbytes" ) )) # UInt64  |-> (2 * sizeof(UINT) ))
  **  ((( &( "tile_width" ) )) # UInt64  |-> 2)
  **  ((( &( "tile_height" ) )) # UInt64  |-> 2)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (2 > 0) ”
.

Definition test_neon_partial_solve_wit_22_aux := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_width <> 0)) (PreH2 : (block_height <> 0)) (PreH3 : (block_height = 1)) (PreH4 : (block_width = 1)) (PreH5 : (xt_valid F W G )) (PreH6 : (input = (xt_input (G)))) (PreH7 : (output = (xt_output_base (G)))) (PreH8 : (input_stride = (xt_input_stride (G)))) (PreH9 : (output_stride = (xt_output_stride (G)))) (PreH10 : (block_width = (xt_width (G)))) (PreH11 : (block_height = (xt_height (G)))) (PreH12 : (sizeof(UINT) = 4)) (PreH13 : (sizeof(UINT64) = 8)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH16 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  (xt_data F )
  **  (xt_output W old )
|--
  “ (2 > 0) ” 
  &&  “ (block_width <> 0) ” 
  &&  “ (block_height <> 0) ” 
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

Definition test_neon_partial_solve_wit_22 := test_neon_partial_solve_wit_22_pure -> test_neon_partial_solve_wit_22_aux.

Definition test_neon_partial_solve_wit_23_pure := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_width <> 0)) (PreH2 : (block_height <> 0)) (PreH3 : (input_stride >= (block_width * sizeof(UINT) ))) (PreH4 : (block_height <> 1)) (PreH5 : (block_width = 1)) (PreH6 : (xt_valid F W G )) (PreH7 : (input = (xt_input (G)))) (PreH8 : (output = (xt_output_base (G)))) (PreH9 : (input_stride = (xt_input_stride (G)))) (PreH10 : (output_stride = (xt_output_stride (G)))) (PreH11 : (block_width = (xt_width (G)))) (PreH12 : (block_height = (xt_height (G)))) (PreH13 : (sizeof(UINT) = 4)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH17 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  ((( &( "input_reset" ) )) # UInt64  |->_)
  **  ((( &( "tile_wbytes" ) )) # UInt64  |-> (2 * sizeof(UINT) ))
  **  ((( &( "tile_hbytes" ) )) # UInt64  |-> (2 * sizeof(UINT) ))
  **  ((( &( "tile_width" ) )) # UInt64  |-> 2)
  **  ((( &( "tile_height" ) )) # UInt64  |-> 2)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (2 > 0) ”
.

Definition test_neon_partial_solve_wit_23_aux := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_width <> 0)) (PreH2 : (block_height <> 0)) (PreH3 : (input_stride >= (block_width * sizeof(UINT) ))) (PreH4 : (block_height <> 1)) (PreH5 : (block_width = 1)) (PreH6 : (xt_valid F W G )) (PreH7 : (input = (xt_input (G)))) (PreH8 : (output = (xt_output_base (G)))) (PreH9 : (input_stride = (xt_input_stride (G)))) (PreH10 : (output_stride = (xt_output_stride (G)))) (PreH11 : (block_width = (xt_width (G)))) (PreH12 : (block_height = (xt_height (G)))) (PreH13 : (sizeof(UINT) = 4)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH17 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  (xt_data F )
  **  (xt_output W old )
|--
  “ (2 > 0) ” 
  &&  “ (block_width <> 0) ” 
  &&  “ (block_height <> 0) ” 
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

Definition test_neon_partial_solve_wit_23 := test_neon_partial_solve_wit_23_pure -> test_neon_partial_solve_wit_23_aux.

Definition test_neon_partial_solve_wit_24_pure := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_width <> 0)) (PreH2 : (block_height <> 0)) (PreH3 : (block_height = 1)) (PreH4 : (output_stride >= (unsigned_last_nbits ((block_height * sizeof(UINT) )) (64)))) (PreH5 : (block_width <> 1)) (PreH6 : (xt_valid F W G )) (PreH7 : (input = (xt_input (G)))) (PreH8 : (output = (xt_output_base (G)))) (PreH9 : (input_stride = (xt_input_stride (G)))) (PreH10 : (output_stride = (xt_output_stride (G)))) (PreH11 : (block_width = (xt_width (G)))) (PreH12 : (block_height = (xt_height (G)))) (PreH13 : (sizeof(UINT) = 4)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH17 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  ((( &( "input_reset" ) )) # UInt64  |->_)
  **  ((( &( "tile_wbytes" ) )) # UInt64  |-> (2 * sizeof(UINT) ))
  **  ((( &( "tile_hbytes" ) )) # UInt64  |-> (2 * sizeof(UINT) ))
  **  ((( &( "tile_width" ) )) # UInt64  |-> 2)
  **  ((( &( "tile_height" ) )) # UInt64  |-> 2)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (2 > 0) ”
.

Definition test_neon_partial_solve_wit_24_aux := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_width <> 0)) (PreH2 : (block_height <> 0)) (PreH3 : (block_height = 1)) (PreH4 : (output_stride >= (unsigned_last_nbits ((block_height * sizeof(UINT) )) (64)))) (PreH5 : (block_width <> 1)) (PreH6 : (xt_valid F W G )) (PreH7 : (input = (xt_input (G)))) (PreH8 : (output = (xt_output_base (G)))) (PreH9 : (input_stride = (xt_input_stride (G)))) (PreH10 : (output_stride = (xt_output_stride (G)))) (PreH11 : (block_width = (xt_width (G)))) (PreH12 : (block_height = (xt_height (G)))) (PreH13 : (sizeof(UINT) = 4)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH17 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  (xt_data F )
  **  (xt_output W old )
|--
  “ (2 > 0) ” 
  &&  “ (block_width <> 0) ” 
  &&  “ (block_height <> 0) ” 
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

Definition test_neon_partial_solve_wit_24 := test_neon_partial_solve_wit_24_pure -> test_neon_partial_solve_wit_24_aux.

Definition test_neon_partial_solve_wit_25_pure := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_width <> 0)) (PreH2 : (block_height <> 0)) (PreH3 : (input_stride >= (unsigned_last_nbits ((block_width * sizeof(UINT) )) (64)))) (PreH4 : (block_height <> 1)) (PreH5 : (output_stride >= (unsigned_last_nbits ((block_height * sizeof(UINT) )) (64)))) (PreH6 : (block_width <> 1)) (PreH7 : (xt_valid F W G )) (PreH8 : (input = (xt_input (G)))) (PreH9 : (output = (xt_output_base (G)))) (PreH10 : (input_stride = (xt_input_stride (G)))) (PreH11 : (output_stride = (xt_output_stride (G)))) (PreH12 : (block_width = (xt_width (G)))) (PreH13 : (block_height = (xt_height (G)))) (PreH14 : (sizeof(UINT) = 4)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (sizeof(UINT64) = 8)) (PreH17 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH18 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  ((( &( "input_reset" ) )) # UInt64  |->_)
  **  ((( &( "tile_wbytes" ) )) # UInt64  |-> (2 * sizeof(UINT) ))
  **  ((( &( "tile_hbytes" ) )) # UInt64  |-> (2 * sizeof(UINT) ))
  **  ((( &( "tile_width" ) )) # UInt64  |-> 2)
  **  ((( &( "tile_height" ) )) # UInt64  |-> 2)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (2 > 0) ”
.

Definition test_neon_partial_solve_wit_25_aux := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_width <> 0)) (PreH2 : (block_height <> 0)) (PreH3 : (input_stride >= (unsigned_last_nbits ((block_width * sizeof(UINT) )) (64)))) (PreH4 : (block_height <> 1)) (PreH5 : (output_stride >= (unsigned_last_nbits ((block_height * sizeof(UINT) )) (64)))) (PreH6 : (block_width <> 1)) (PreH7 : (xt_valid F W G )) (PreH8 : (input = (xt_input (G)))) (PreH9 : (output = (xt_output_base (G)))) (PreH10 : (input_stride = (xt_input_stride (G)))) (PreH11 : (output_stride = (xt_output_stride (G)))) (PreH12 : (block_width = (xt_width (G)))) (PreH13 : (block_height = (xt_height (G)))) (PreH14 : (sizeof(UINT) = 4)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (sizeof(UINT64) = 8)) (PreH17 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH18 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  (xt_data F )
  **  (xt_output W old )
|--
  “ (2 > 0) ” 
  &&  “ (block_width <> 0) ” 
  &&  “ (block_height <> 0) ” 
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

Definition test_neon_partial_solve_wit_25 := test_neon_partial_solve_wit_25_pure -> test_neon_partial_solve_wit_25_aux.

Definition test_neon_partial_solve_wit_26_pure := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_width <> 0)) (PreH2 : (block_height <> 0)) (PreH3 : (block_height = 1)) (PreH4 : (block_width = 1)) (PreH5 : (xt_valid F W G )) (PreH6 : (input = (xt_input (G)))) (PreH7 : (output = (xt_output_base (G)))) (PreH8 : (input_stride = (xt_input_stride (G)))) (PreH9 : (output_stride = (xt_output_stride (G)))) (PreH10 : (block_width = (xt_width (G)))) (PreH11 : (block_height = (xt_height (G)))) (PreH12 : (sizeof(UINT) = 4)) (PreH13 : (sizeof(UINT64) = 8)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH16 : (block_height = 1)) ,
  ((( &( "input_reset" ) )) # UInt64  |->_)
  **  ((( &( "tile_wbytes" ) )) # UInt64  |-> (2 * sizeof(UINT) ))
  **  ((( &( "tile_hbytes" ) )) # UInt64  |-> (2 * sizeof(UINT) ))
  **  ((( &( "tile_width" ) )) # UInt64  |-> 2)
  **  ((( &( "tile_height" ) )) # UInt64  |-> 2)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (2 > 0) ”
.

Definition test_neon_partial_solve_wit_26_aux := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_width <> 0)) (PreH2 : (block_height <> 0)) (PreH3 : (block_height = 1)) (PreH4 : (block_width = 1)) (PreH5 : (xt_valid F W G )) (PreH6 : (input = (xt_input (G)))) (PreH7 : (output = (xt_output_base (G)))) (PreH8 : (input_stride = (xt_input_stride (G)))) (PreH9 : (output_stride = (xt_output_stride (G)))) (PreH10 : (block_width = (xt_width (G)))) (PreH11 : (block_height = (xt_height (G)))) (PreH12 : (sizeof(UINT) = 4)) (PreH13 : (sizeof(UINT64) = 8)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH16 : (block_height = 1)) ,
  (xt_data F )
  **  (xt_output W old )
|--
  “ (2 > 0) ” 
  &&  “ (block_width <> 0) ” 
  &&  “ (block_height <> 0) ” 
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

Definition test_neon_partial_solve_wit_26 := test_neon_partial_solve_wit_26_pure -> test_neon_partial_solve_wit_26_aux.

Definition test_neon_partial_solve_wit_27_pure := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_width <> 0)) (PreH2 : (block_height <> 0)) (PreH3 : (block_height = 1)) (PreH4 : (output_stride >= (block_height * sizeof(UINT) ))) (PreH5 : (block_width <> 1)) (PreH6 : (xt_valid F W G )) (PreH7 : (input = (xt_input (G)))) (PreH8 : (output = (xt_output_base (G)))) (PreH9 : (input_stride = (xt_input_stride (G)))) (PreH10 : (output_stride = (xt_output_stride (G)))) (PreH11 : (block_width = (xt_width (G)))) (PreH12 : (block_height = (xt_height (G)))) (PreH13 : (sizeof(UINT) = 4)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH17 : (block_height = 1)) ,
  ((( &( "input_reset" ) )) # UInt64  |->_)
  **  ((( &( "tile_wbytes" ) )) # UInt64  |-> (2 * sizeof(UINT) ))
  **  ((( &( "tile_hbytes" ) )) # UInt64  |-> (2 * sizeof(UINT) ))
  **  ((( &( "tile_width" ) )) # UInt64  |-> 2)
  **  ((( &( "tile_height" ) )) # UInt64  |-> 2)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (2 > 0) ”
.

Definition test_neon_partial_solve_wit_27_aux := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (PreH1 : (block_width <> 0)) (PreH2 : (block_height <> 0)) (PreH3 : (block_height = 1)) (PreH4 : (output_stride >= (block_height * sizeof(UINT) ))) (PreH5 : (block_width <> 1)) (PreH6 : (xt_valid F W G )) (PreH7 : (input = (xt_input (G)))) (PreH8 : (output = (xt_output_base (G)))) (PreH9 : (input_stride = (xt_input_stride (G)))) (PreH10 : (output_stride = (xt_output_stride (G)))) (PreH11 : (block_width = (xt_width (G)))) (PreH12 : (block_height = (xt_height (G)))) (PreH13 : (sizeof(UINT) = 4)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH17 : (block_height = 1)) ,
  (xt_data F )
  **  (xt_output W old )
|--
  “ (2 > 0) ” 
  &&  “ (block_width <> 0) ” 
  &&  “ (block_height <> 0) ” 
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

Definition test_neon_partial_solve_wit_27 := test_neon_partial_solve_wit_27_pure -> test_neon_partial_solve_wit_27_aux.

Definition test_neon_partial_solve_wit_28_pure := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (retval: Z) (PreH1 : (retval = (xt_round_down (block_height) (2)))) (PreH2 : (block_width = 0)) (PreH3 : (block_height <> 0)) (PreH4 : (block_height = 1)) (PreH5 : (output_stride >= (unsigned_last_nbits ((block_height * sizeof(UINT) )) (64)))) (PreH6 : (block_width <> 1)) (PreH7 : (xt_valid F W G )) (PreH8 : (input = (xt_input (G)))) (PreH9 : (output = (xt_output_base (G)))) (PreH10 : (input_stride = (xt_input_stride (G)))) (PreH11 : (output_stride = (xt_output_stride (G)))) (PreH12 : (block_width = (xt_width (G)))) (PreH13 : (block_height = (xt_height (G)))) (PreH14 : (sizeof(UINT) = 4)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (sizeof(UINT64) = 8)) (PreH17 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH18 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  ((( &( "output_reset" ) )) # UInt64  |->_)
  **  ((( &( "input_offset" ) )) # UInt64  |-> (unsigned_last_nbits ((2 * input_stride )) (64)))
  **  ((( &( "input_reset" ) )) # UInt64  |-> (unsigned_last_nbits (((2 * sizeof(UINT) ) - (unsigned_last_nbits ((retval * input_stride )) (64)) )) (64)))
  **  ((( &( "tile_wbytes" ) )) # UInt64  |-> (2 * sizeof(UINT) ))
  **  ((( &( "tile_hbytes" ) )) # UInt64  |-> (2 * sizeof(UINT) ))
  **  ((( &( "tile_width" ) )) # UInt64  |-> 2)
  **  ((( &( "tile_height" ) )) # UInt64  |-> 2)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> 1)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (2 > 0) ”
.

Definition test_neon_partial_solve_wit_28_aux := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (retval: Z) (PreH1 : (retval = (xt_round_down (block_height) (2)))) (PreH2 : (block_width = 0)) (PreH3 : (block_height <> 0)) (PreH4 : (block_height = 1)) (PreH5 : (output_stride >= (unsigned_last_nbits ((block_height * sizeof(UINT) )) (64)))) (PreH6 : (block_width <> 1)) (PreH7 : (xt_valid F W G )) (PreH8 : (input = (xt_input (G)))) (PreH9 : (output = (xt_output_base (G)))) (PreH10 : (input_stride = (xt_input_stride (G)))) (PreH11 : (output_stride = (xt_output_stride (G)))) (PreH12 : (block_width = (xt_width (G)))) (PreH13 : (block_height = (xt_height (G)))) (PreH14 : (sizeof(UINT) = 4)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (sizeof(UINT64) = 8)) (PreH17 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH18 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  (xt_data F )
  **  (xt_output W old )
|--
  “ (2 > 0) ” 
  &&  “ (retval = (xt_round_down (block_height) (2))) ” 
  &&  “ (block_width = 0) ” 
  &&  “ (block_height <> 0) ” 
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

Definition test_neon_partial_solve_wit_28 := test_neon_partial_solve_wit_28_pure -> test_neon_partial_solve_wit_28_aux.

Definition test_neon_partial_solve_wit_29_pure := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (retval: Z) (PreH1 : (retval = (xt_round_down (block_height) (2)))) (PreH2 : (block_width = 0)) (PreH3 : (block_height <> 0)) (PreH4 : (input_stride >= (unsigned_last_nbits ((block_width * sizeof(UINT) )) (64)))) (PreH5 : (block_height <> 1)) (PreH6 : (output_stride >= (unsigned_last_nbits ((block_height * sizeof(UINT) )) (64)))) (PreH7 : (block_width <> 1)) (PreH8 : (xt_valid F W G )) (PreH9 : (input = (xt_input (G)))) (PreH10 : (output = (xt_output_base (G)))) (PreH11 : (input_stride = (xt_input_stride (G)))) (PreH12 : (output_stride = (xt_output_stride (G)))) (PreH13 : (block_width = (xt_width (G)))) (PreH14 : (block_height = (xt_height (G)))) (PreH15 : (sizeof(UINT) = 4)) (PreH16 : (sizeof(UINT64) = 8)) (PreH17 : (sizeof(UINT64) = 8)) (PreH18 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH19 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  ((( &( "output_reset" ) )) # UInt64  |->_)
  **  ((( &( "input_offset" ) )) # UInt64  |-> (unsigned_last_nbits ((2 * input_stride )) (64)))
  **  ((( &( "input_reset" ) )) # UInt64  |-> (unsigned_last_nbits (((2 * sizeof(UINT) ) - (unsigned_last_nbits ((retval * input_stride )) (64)) )) (64)))
  **  ((( &( "tile_wbytes" ) )) # UInt64  |-> (2 * sizeof(UINT) ))
  **  ((( &( "tile_hbytes" ) )) # UInt64  |-> (2 * sizeof(UINT) ))
  **  ((( &( "tile_width" ) )) # UInt64  |-> 2)
  **  ((( &( "tile_height" ) )) # UInt64  |-> 2)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> 1)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (2 > 0) ”
.

Definition test_neon_partial_solve_wit_29_aux := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (retval: Z) (PreH1 : (retval = (xt_round_down (block_height) (2)))) (PreH2 : (block_width = 0)) (PreH3 : (block_height <> 0)) (PreH4 : (input_stride >= (unsigned_last_nbits ((block_width * sizeof(UINT) )) (64)))) (PreH5 : (block_height <> 1)) (PreH6 : (output_stride >= (unsigned_last_nbits ((block_height * sizeof(UINT) )) (64)))) (PreH7 : (block_width <> 1)) (PreH8 : (xt_valid F W G )) (PreH9 : (input = (xt_input (G)))) (PreH10 : (output = (xt_output_base (G)))) (PreH11 : (input_stride = (xt_input_stride (G)))) (PreH12 : (output_stride = (xt_output_stride (G)))) (PreH13 : (block_width = (xt_width (G)))) (PreH14 : (block_height = (xt_height (G)))) (PreH15 : (sizeof(UINT) = 4)) (PreH16 : (sizeof(UINT64) = 8)) (PreH17 : (sizeof(UINT64) = 8)) (PreH18 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH19 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  (xt_data F )
  **  (xt_output W old )
|--
  “ (2 > 0) ” 
  &&  “ (retval = (xt_round_down (block_height) (2))) ” 
  &&  “ (block_width = 0) ” 
  &&  “ (block_height <> 0) ” 
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

Definition test_neon_partial_solve_wit_29 := test_neon_partial_solve_wit_29_pure -> test_neon_partial_solve_wit_29_aux.

Definition test_neon_partial_solve_wit_30_pure := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (retval: Z) (PreH1 : (retval = (xt_round_down (block_height) (2)))) (PreH2 : (block_width = 0)) (PreH3 : (block_height <> 0)) (PreH4 : (block_height = 1)) (PreH5 : (output_stride >= (block_height * sizeof(UINT) ))) (PreH6 : (block_width <> 1)) (PreH7 : (xt_valid F W G )) (PreH8 : (input = (xt_input (G)))) (PreH9 : (output = (xt_output_base (G)))) (PreH10 : (input_stride = (xt_input_stride (G)))) (PreH11 : (output_stride = (xt_output_stride (G)))) (PreH12 : (block_width = (xt_width (G)))) (PreH13 : (block_height = (xt_height (G)))) (PreH14 : (sizeof(UINT) = 4)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (sizeof(UINT64) = 8)) (PreH17 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH18 : (block_height = 1)) ,
  ((( &( "output_reset" ) )) # UInt64  |->_)
  **  ((( &( "input_offset" ) )) # UInt64  |-> (unsigned_last_nbits ((2 * input_stride )) (64)))
  **  ((( &( "input_reset" ) )) # UInt64  |-> (unsigned_last_nbits (((2 * sizeof(UINT) ) - (unsigned_last_nbits ((retval * input_stride )) (64)) )) (64)))
  **  ((( &( "tile_wbytes" ) )) # UInt64  |-> (2 * sizeof(UINT) ))
  **  ((( &( "tile_hbytes" ) )) # UInt64  |-> (2 * sizeof(UINT) ))
  **  ((( &( "tile_width" ) )) # UInt64  |-> 2)
  **  ((( &( "tile_height" ) )) # UInt64  |-> 2)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> 1)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (2 > 0) ”
.

Definition test_neon_partial_solve_wit_30_aux := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (retval: Z) (PreH1 : (retval = (xt_round_down (block_height) (2)))) (PreH2 : (block_width = 0)) (PreH3 : (block_height <> 0)) (PreH4 : (block_height = 1)) (PreH5 : (output_stride >= (block_height * sizeof(UINT) ))) (PreH6 : (block_width <> 1)) (PreH7 : (xt_valid F W G )) (PreH8 : (input = (xt_input (G)))) (PreH9 : (output = (xt_output_base (G)))) (PreH10 : (input_stride = (xt_input_stride (G)))) (PreH11 : (output_stride = (xt_output_stride (G)))) (PreH12 : (block_width = (xt_width (G)))) (PreH13 : (block_height = (xt_height (G)))) (PreH14 : (sizeof(UINT) = 4)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (sizeof(UINT64) = 8)) (PreH17 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH18 : (block_height = 1)) ,
  (xt_data F )
  **  (xt_output W old )
|--
  “ (2 > 0) ” 
  &&  “ (retval = (xt_round_down (block_height) (2))) ” 
  &&  “ (block_width = 0) ” 
  &&  “ (block_height <> 0) ” 
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

Definition test_neon_partial_solve_wit_30 := test_neon_partial_solve_wit_30_pure -> test_neon_partial_solve_wit_30_aux.

Definition test_neon_partial_solve_wit_31_pure := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (retval: Z) (PreH1 : (retval = (xt_round_down (block_height) (2)))) (PreH2 : (block_width <> 0)) (PreH3 : (block_height <> 0)) (PreH4 : (block_height = 1)) (PreH5 : (block_width = 1)) (PreH6 : (xt_valid F W G )) (PreH7 : (input = (xt_input (G)))) (PreH8 : (output = (xt_output_base (G)))) (PreH9 : (input_stride = (xt_input_stride (G)))) (PreH10 : (output_stride = (xt_output_stride (G)))) (PreH11 : (block_width = (xt_width (G)))) (PreH12 : (block_height = (xt_height (G)))) (PreH13 : (sizeof(UINT) = 4)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (block_width = 1)) (PreH17 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  ((( &( "output_reset" ) )) # UInt64  |->_)
  **  ((( &( "input_offset" ) )) # UInt64  |-> (unsigned_last_nbits ((2 * input_stride )) (64)))
  **  ((( &( "input_reset" ) )) # UInt64  |-> (unsigned_last_nbits (((2 * sizeof(UINT) ) - (unsigned_last_nbits ((retval * input_stride )) (64)) )) (64)))
  **  ((( &( "tile_wbytes" ) )) # UInt64  |-> (2 * sizeof(UINT) ))
  **  ((( &( "tile_hbytes" ) )) # UInt64  |-> (2 * sizeof(UINT) ))
  **  ((( &( "tile_width" ) )) # UInt64  |-> 2)
  **  ((( &( "tile_height" ) )) # UInt64  |-> 2)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (2 > 0) ”
.

Definition test_neon_partial_solve_wit_31_aux := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (retval: Z) (PreH1 : (retval = (xt_round_down (block_height) (2)))) (PreH2 : (block_width <> 0)) (PreH3 : (block_height <> 0)) (PreH4 : (block_height = 1)) (PreH5 : (block_width = 1)) (PreH6 : (xt_valid F W G )) (PreH7 : (input = (xt_input (G)))) (PreH8 : (output = (xt_output_base (G)))) (PreH9 : (input_stride = (xt_input_stride (G)))) (PreH10 : (output_stride = (xt_output_stride (G)))) (PreH11 : (block_width = (xt_width (G)))) (PreH12 : (block_height = (xt_height (G)))) (PreH13 : (sizeof(UINT) = 4)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (block_width = 1)) (PreH17 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  (xt_data F )
  **  (xt_output W old )
|--
  “ (2 > 0) ” 
  &&  “ (retval = (xt_round_down (block_height) (2))) ” 
  &&  “ (block_width <> 0) ” 
  &&  “ (block_height <> 0) ” 
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

Definition test_neon_partial_solve_wit_31 := test_neon_partial_solve_wit_31_pure -> test_neon_partial_solve_wit_31_aux.

Definition test_neon_partial_solve_wit_32_pure := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (retval: Z) (PreH1 : (retval = (xt_round_down (block_height) (2)))) (PreH2 : (block_width <> 0)) (PreH3 : (block_height <> 0)) (PreH4 : (input_stride >= (block_width * sizeof(UINT) ))) (PreH5 : (block_height <> 1)) (PreH6 : (block_width = 1)) (PreH7 : (xt_valid F W G )) (PreH8 : (input = (xt_input (G)))) (PreH9 : (output = (xt_output_base (G)))) (PreH10 : (input_stride = (xt_input_stride (G)))) (PreH11 : (output_stride = (xt_output_stride (G)))) (PreH12 : (block_width = (xt_width (G)))) (PreH13 : (block_height = (xt_height (G)))) (PreH14 : (sizeof(UINT) = 4)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (sizeof(UINT64) = 8)) (PreH17 : (block_width = 1)) (PreH18 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  ((( &( "output_reset" ) )) # UInt64  |->_)
  **  ((( &( "input_offset" ) )) # UInt64  |-> (unsigned_last_nbits ((2 * input_stride )) (64)))
  **  ((( &( "input_reset" ) )) # UInt64  |-> (unsigned_last_nbits (((2 * sizeof(UINT) ) - (unsigned_last_nbits ((retval * input_stride )) (64)) )) (64)))
  **  ((( &( "tile_wbytes" ) )) # UInt64  |-> (2 * sizeof(UINT) ))
  **  ((( &( "tile_hbytes" ) )) # UInt64  |-> (2 * sizeof(UINT) ))
  **  ((( &( "tile_width" ) )) # UInt64  |-> 2)
  **  ((( &( "tile_height" ) )) # UInt64  |-> 2)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (2 > 0) ”
.

Definition test_neon_partial_solve_wit_32_aux := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (retval: Z) (PreH1 : (retval = (xt_round_down (block_height) (2)))) (PreH2 : (block_width <> 0)) (PreH3 : (block_height <> 0)) (PreH4 : (input_stride >= (block_width * sizeof(UINT) ))) (PreH5 : (block_height <> 1)) (PreH6 : (block_width = 1)) (PreH7 : (xt_valid F W G )) (PreH8 : (input = (xt_input (G)))) (PreH9 : (output = (xt_output_base (G)))) (PreH10 : (input_stride = (xt_input_stride (G)))) (PreH11 : (output_stride = (xt_output_stride (G)))) (PreH12 : (block_width = (xt_width (G)))) (PreH13 : (block_height = (xt_height (G)))) (PreH14 : (sizeof(UINT) = 4)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (sizeof(UINT64) = 8)) (PreH17 : (block_width = 1)) (PreH18 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  (xt_data F )
  **  (xt_output W old )
|--
  “ (2 > 0) ” 
  &&  “ (retval = (xt_round_down (block_height) (2))) ” 
  &&  “ (block_width <> 0) ” 
  &&  “ (block_height <> 0) ” 
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

Definition test_neon_partial_solve_wit_32 := test_neon_partial_solve_wit_32_pure -> test_neon_partial_solve_wit_32_aux.

Definition test_neon_partial_solve_wit_33_pure := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (retval: Z) (PreH1 : (retval = (xt_round_down (block_height) (2)))) (PreH2 : (block_width <> 0)) (PreH3 : (block_height <> 0)) (PreH4 : (block_height = 1)) (PreH5 : (block_width = 1)) (PreH6 : (xt_valid F W G )) (PreH7 : (input = (xt_input (G)))) (PreH8 : (output = (xt_output_base (G)))) (PreH9 : (input_stride = (xt_input_stride (G)))) (PreH10 : (output_stride = (xt_output_stride (G)))) (PreH11 : (block_width = (xt_width (G)))) (PreH12 : (block_height = (xt_height (G)))) (PreH13 : (sizeof(UINT) = 4)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (block_width = 1)) (PreH17 : (block_height = 1)) ,
  ((( &( "output_reset" ) )) # UInt64  |->_)
  **  ((( &( "input_offset" ) )) # UInt64  |-> (unsigned_last_nbits ((2 * input_stride )) (64)))
  **  ((( &( "input_reset" ) )) # UInt64  |-> (unsigned_last_nbits (((2 * sizeof(UINT) ) - (unsigned_last_nbits ((retval * input_stride )) (64)) )) (64)))
  **  ((( &( "tile_wbytes" ) )) # UInt64  |-> (2 * sizeof(UINT) ))
  **  ((( &( "tile_hbytes" ) )) # UInt64  |-> (2 * sizeof(UINT) ))
  **  ((( &( "tile_width" ) )) # UInt64  |-> 2)
  **  ((( &( "tile_height" ) )) # UInt64  |-> 2)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (2 > 0) ”
.

Definition test_neon_partial_solve_wit_33_aux := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (retval: Z) (PreH1 : (retval = (xt_round_down (block_height) (2)))) (PreH2 : (block_width <> 0)) (PreH3 : (block_height <> 0)) (PreH4 : (block_height = 1)) (PreH5 : (block_width = 1)) (PreH6 : (xt_valid F W G )) (PreH7 : (input = (xt_input (G)))) (PreH8 : (output = (xt_output_base (G)))) (PreH9 : (input_stride = (xt_input_stride (G)))) (PreH10 : (output_stride = (xt_output_stride (G)))) (PreH11 : (block_width = (xt_width (G)))) (PreH12 : (block_height = (xt_height (G)))) (PreH13 : (sizeof(UINT) = 4)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (block_width = 1)) (PreH17 : (block_height = 1)) ,
  (xt_data F )
  **  (xt_output W old )
|--
  “ (2 > 0) ” 
  &&  “ (retval = (xt_round_down (block_height) (2))) ” 
  &&  “ (block_width <> 0) ” 
  &&  “ (block_height <> 0) ” 
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

Definition test_neon_partial_solve_wit_33 := test_neon_partial_solve_wit_33_pure -> test_neon_partial_solve_wit_33_aux.

Definition test_neon_partial_solve_wit_34_pure := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (retval: Z) (PreH1 : (retval = (xt_round_down (block_height) (2)))) (PreH2 : (block_width <> 0)) (PreH3 : (block_height <> 0)) (PreH4 : (block_height = 1)) (PreH5 : (block_width = 1)) (PreH6 : (xt_valid F W G )) (PreH7 : (input = (xt_input (G)))) (PreH8 : (output = (xt_output_base (G)))) (PreH9 : (input_stride = (xt_input_stride (G)))) (PreH10 : (output_stride = (xt_output_stride (G)))) (PreH11 : (block_width = (xt_width (G)))) (PreH12 : (block_height = (xt_height (G)))) (PreH13 : (sizeof(UINT) = 4)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH17 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  ((( &( "output_reset" ) )) # UInt64  |->_)
  **  ((( &( "input_offset" ) )) # UInt64  |-> (unsigned_last_nbits ((2 * input_stride )) (64)))
  **  ((( &( "input_reset" ) )) # UInt64  |-> (unsigned_last_nbits (((2 * sizeof(UINT) ) - (unsigned_last_nbits ((retval * input_stride )) (64)) )) (64)))
  **  ((( &( "tile_wbytes" ) )) # UInt64  |-> (2 * sizeof(UINT) ))
  **  ((( &( "tile_hbytes" ) )) # UInt64  |-> (2 * sizeof(UINT) ))
  **  ((( &( "tile_width" ) )) # UInt64  |-> 2)
  **  ((( &( "tile_height" ) )) # UInt64  |-> 2)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (2 > 0) ”
.

Definition test_neon_partial_solve_wit_34_aux := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (retval: Z) (PreH1 : (retval = (xt_round_down (block_height) (2)))) (PreH2 : (block_width <> 0)) (PreH3 : (block_height <> 0)) (PreH4 : (block_height = 1)) (PreH5 : (block_width = 1)) (PreH6 : (xt_valid F W G )) (PreH7 : (input = (xt_input (G)))) (PreH8 : (output = (xt_output_base (G)))) (PreH9 : (input_stride = (xt_input_stride (G)))) (PreH10 : (output_stride = (xt_output_stride (G)))) (PreH11 : (block_width = (xt_width (G)))) (PreH12 : (block_height = (xt_height (G)))) (PreH13 : (sizeof(UINT) = 4)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH17 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  (xt_data F )
  **  (xt_output W old )
|--
  “ (2 > 0) ” 
  &&  “ (retval = (xt_round_down (block_height) (2))) ” 
  &&  “ (block_width <> 0) ” 
  &&  “ (block_height <> 0) ” 
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

Definition test_neon_partial_solve_wit_34 := test_neon_partial_solve_wit_34_pure -> test_neon_partial_solve_wit_34_aux.

Definition test_neon_partial_solve_wit_35_pure := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (retval: Z) (PreH1 : (retval = (xt_round_down (block_height) (2)))) (PreH2 : (block_width <> 0)) (PreH3 : (block_height <> 0)) (PreH4 : (input_stride >= (block_width * sizeof(UINT) ))) (PreH5 : (block_height <> 1)) (PreH6 : (block_width = 1)) (PreH7 : (xt_valid F W G )) (PreH8 : (input = (xt_input (G)))) (PreH9 : (output = (xt_output_base (G)))) (PreH10 : (input_stride = (xt_input_stride (G)))) (PreH11 : (output_stride = (xt_output_stride (G)))) (PreH12 : (block_width = (xt_width (G)))) (PreH13 : (block_height = (xt_height (G)))) (PreH14 : (sizeof(UINT) = 4)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (sizeof(UINT64) = 8)) (PreH17 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH18 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  ((( &( "output_reset" ) )) # UInt64  |->_)
  **  ((( &( "input_offset" ) )) # UInt64  |-> (unsigned_last_nbits ((2 * input_stride )) (64)))
  **  ((( &( "input_reset" ) )) # UInt64  |-> (unsigned_last_nbits (((2 * sizeof(UINT) ) - (unsigned_last_nbits ((retval * input_stride )) (64)) )) (64)))
  **  ((( &( "tile_wbytes" ) )) # UInt64  |-> (2 * sizeof(UINT) ))
  **  ((( &( "tile_hbytes" ) )) # UInt64  |-> (2 * sizeof(UINT) ))
  **  ((( &( "tile_width" ) )) # UInt64  |-> 2)
  **  ((( &( "tile_height" ) )) # UInt64  |-> 2)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (2 > 0) ”
.

Definition test_neon_partial_solve_wit_35_aux := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (retval: Z) (PreH1 : (retval = (xt_round_down (block_height) (2)))) (PreH2 : (block_width <> 0)) (PreH3 : (block_height <> 0)) (PreH4 : (input_stride >= (block_width * sizeof(UINT) ))) (PreH5 : (block_height <> 1)) (PreH6 : (block_width = 1)) (PreH7 : (xt_valid F W G )) (PreH8 : (input = (xt_input (G)))) (PreH9 : (output = (xt_output_base (G)))) (PreH10 : (input_stride = (xt_input_stride (G)))) (PreH11 : (output_stride = (xt_output_stride (G)))) (PreH12 : (block_width = (xt_width (G)))) (PreH13 : (block_height = (xt_height (G)))) (PreH14 : (sizeof(UINT) = 4)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (sizeof(UINT64) = 8)) (PreH17 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH18 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  (xt_data F )
  **  (xt_output W old )
|--
  “ (2 > 0) ” 
  &&  “ (retval = (xt_round_down (block_height) (2))) ” 
  &&  “ (block_width <> 0) ” 
  &&  “ (block_height <> 0) ” 
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

Definition test_neon_partial_solve_wit_35 := test_neon_partial_solve_wit_35_pure -> test_neon_partial_solve_wit_35_aux.

Definition test_neon_partial_solve_wit_36_pure := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (retval: Z) (PreH1 : (retval = (xt_round_down (block_height) (2)))) (PreH2 : (block_width <> 0)) (PreH3 : (block_height <> 0)) (PreH4 : (block_height = 1)) (PreH5 : (output_stride >= (unsigned_last_nbits ((block_height * sizeof(UINT) )) (64)))) (PreH6 : (block_width <> 1)) (PreH7 : (xt_valid F W G )) (PreH8 : (input = (xt_input (G)))) (PreH9 : (output = (xt_output_base (G)))) (PreH10 : (input_stride = (xt_input_stride (G)))) (PreH11 : (output_stride = (xt_output_stride (G)))) (PreH12 : (block_width = (xt_width (G)))) (PreH13 : (block_height = (xt_height (G)))) (PreH14 : (sizeof(UINT) = 4)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (sizeof(UINT64) = 8)) (PreH17 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH18 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  ((( &( "output_reset" ) )) # UInt64  |->_)
  **  ((( &( "input_offset" ) )) # UInt64  |-> (unsigned_last_nbits ((2 * input_stride )) (64)))
  **  ((( &( "input_reset" ) )) # UInt64  |-> (unsigned_last_nbits (((2 * sizeof(UINT) ) - (unsigned_last_nbits ((retval * input_stride )) (64)) )) (64)))
  **  ((( &( "tile_wbytes" ) )) # UInt64  |-> (2 * sizeof(UINT) ))
  **  ((( &( "tile_hbytes" ) )) # UInt64  |-> (2 * sizeof(UINT) ))
  **  ((( &( "tile_width" ) )) # UInt64  |-> 2)
  **  ((( &( "tile_height" ) )) # UInt64  |-> 2)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (2 > 0) ”
.

Definition test_neon_partial_solve_wit_36_aux := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (retval: Z) (PreH1 : (retval = (xt_round_down (block_height) (2)))) (PreH2 : (block_width <> 0)) (PreH3 : (block_height <> 0)) (PreH4 : (block_height = 1)) (PreH5 : (output_stride >= (unsigned_last_nbits ((block_height * sizeof(UINT) )) (64)))) (PreH6 : (block_width <> 1)) (PreH7 : (xt_valid F W G )) (PreH8 : (input = (xt_input (G)))) (PreH9 : (output = (xt_output_base (G)))) (PreH10 : (input_stride = (xt_input_stride (G)))) (PreH11 : (output_stride = (xt_output_stride (G)))) (PreH12 : (block_width = (xt_width (G)))) (PreH13 : (block_height = (xt_height (G)))) (PreH14 : (sizeof(UINT) = 4)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (sizeof(UINT64) = 8)) (PreH17 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH18 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  (xt_data F )
  **  (xt_output W old )
|--
  “ (2 > 0) ” 
  &&  “ (retval = (xt_round_down (block_height) (2))) ” 
  &&  “ (block_width <> 0) ” 
  &&  “ (block_height <> 0) ” 
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

Definition test_neon_partial_solve_wit_36 := test_neon_partial_solve_wit_36_pure -> test_neon_partial_solve_wit_36_aux.

Definition test_neon_partial_solve_wit_37_pure := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (retval: Z) (PreH1 : (retval = (xt_round_down (block_height) (2)))) (PreH2 : (block_width <> 0)) (PreH3 : (block_height <> 0)) (PreH4 : (input_stride >= (unsigned_last_nbits ((block_width * sizeof(UINT) )) (64)))) (PreH5 : (block_height <> 1)) (PreH6 : (output_stride >= (unsigned_last_nbits ((block_height * sizeof(UINT) )) (64)))) (PreH7 : (block_width <> 1)) (PreH8 : (xt_valid F W G )) (PreH9 : (input = (xt_input (G)))) (PreH10 : (output = (xt_output_base (G)))) (PreH11 : (input_stride = (xt_input_stride (G)))) (PreH12 : (output_stride = (xt_output_stride (G)))) (PreH13 : (block_width = (xt_width (G)))) (PreH14 : (block_height = (xt_height (G)))) (PreH15 : (sizeof(UINT) = 4)) (PreH16 : (sizeof(UINT64) = 8)) (PreH17 : (sizeof(UINT64) = 8)) (PreH18 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH19 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  ((( &( "output_reset" ) )) # UInt64  |->_)
  **  ((( &( "input_offset" ) )) # UInt64  |-> (unsigned_last_nbits ((2 * input_stride )) (64)))
  **  ((( &( "input_reset" ) )) # UInt64  |-> (unsigned_last_nbits (((2 * sizeof(UINT) ) - (unsigned_last_nbits ((retval * input_stride )) (64)) )) (64)))
  **  ((( &( "tile_wbytes" ) )) # UInt64  |-> (2 * sizeof(UINT) ))
  **  ((( &( "tile_hbytes" ) )) # UInt64  |-> (2 * sizeof(UINT) ))
  **  ((( &( "tile_width" ) )) # UInt64  |-> 2)
  **  ((( &( "tile_height" ) )) # UInt64  |-> 2)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (2 > 0) ”
.

Definition test_neon_partial_solve_wit_37_aux := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (retval: Z) (PreH1 : (retval = (xt_round_down (block_height) (2)))) (PreH2 : (block_width <> 0)) (PreH3 : (block_height <> 0)) (PreH4 : (input_stride >= (unsigned_last_nbits ((block_width * sizeof(UINT) )) (64)))) (PreH5 : (block_height <> 1)) (PreH6 : (output_stride >= (unsigned_last_nbits ((block_height * sizeof(UINT) )) (64)))) (PreH7 : (block_width <> 1)) (PreH8 : (xt_valid F W G )) (PreH9 : (input = (xt_input (G)))) (PreH10 : (output = (xt_output_base (G)))) (PreH11 : (input_stride = (xt_input_stride (G)))) (PreH12 : (output_stride = (xt_output_stride (G)))) (PreH13 : (block_width = (xt_width (G)))) (PreH14 : (block_height = (xt_height (G)))) (PreH15 : (sizeof(UINT) = 4)) (PreH16 : (sizeof(UINT64) = 8)) (PreH17 : (sizeof(UINT64) = 8)) (PreH18 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH19 : (input_stride >= (unsigned_last_nbits ((block_width * 4 )) (64)))) ,
  (xt_data F )
  **  (xt_output W old )
|--
  “ (2 > 0) ” 
  &&  “ (retval = (xt_round_down (block_height) (2))) ” 
  &&  “ (block_width <> 0) ” 
  &&  “ (block_height <> 0) ” 
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

Definition test_neon_partial_solve_wit_37 := test_neon_partial_solve_wit_37_pure -> test_neon_partial_solve_wit_37_aux.

Definition test_neon_partial_solve_wit_38_pure := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (retval: Z) (PreH1 : (retval = (xt_round_down (block_height) (2)))) (PreH2 : (block_width <> 0)) (PreH3 : (block_height <> 0)) (PreH4 : (block_height = 1)) (PreH5 : (block_width = 1)) (PreH6 : (xt_valid F W G )) (PreH7 : (input = (xt_input (G)))) (PreH8 : (output = (xt_output_base (G)))) (PreH9 : (input_stride = (xt_input_stride (G)))) (PreH10 : (output_stride = (xt_output_stride (G)))) (PreH11 : (block_width = (xt_width (G)))) (PreH12 : (block_height = (xt_height (G)))) (PreH13 : (sizeof(UINT) = 4)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH17 : (block_height = 1)) ,
  ((( &( "output_reset" ) )) # UInt64  |->_)
  **  ((( &( "input_offset" ) )) # UInt64  |-> (unsigned_last_nbits ((2 * input_stride )) (64)))
  **  ((( &( "input_reset" ) )) # UInt64  |-> (unsigned_last_nbits (((2 * sizeof(UINT) ) - (unsigned_last_nbits ((retval * input_stride )) (64)) )) (64)))
  **  ((( &( "tile_wbytes" ) )) # UInt64  |-> (2 * sizeof(UINT) ))
  **  ((( &( "tile_hbytes" ) )) # UInt64  |-> (2 * sizeof(UINT) ))
  **  ((( &( "tile_width" ) )) # UInt64  |-> 2)
  **  ((( &( "tile_height" ) )) # UInt64  |-> 2)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (2 > 0) ”
.

Definition test_neon_partial_solve_wit_38_aux := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (retval: Z) (PreH1 : (retval = (xt_round_down (block_height) (2)))) (PreH2 : (block_width <> 0)) (PreH3 : (block_height <> 0)) (PreH4 : (block_height = 1)) (PreH5 : (block_width = 1)) (PreH6 : (xt_valid F W G )) (PreH7 : (input = (xt_input (G)))) (PreH8 : (output = (xt_output_base (G)))) (PreH9 : (input_stride = (xt_input_stride (G)))) (PreH10 : (output_stride = (xt_output_stride (G)))) (PreH11 : (block_width = (xt_width (G)))) (PreH12 : (block_height = (xt_height (G)))) (PreH13 : (sizeof(UINT) = 4)) (PreH14 : (sizeof(UINT64) = 8)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH17 : (block_height = 1)) ,
  (xt_data F )
  **  (xt_output W old )
|--
  “ (2 > 0) ” 
  &&  “ (retval = (xt_round_down (block_height) (2))) ” 
  &&  “ (block_width <> 0) ” 
  &&  “ (block_height <> 0) ” 
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

Definition test_neon_partial_solve_wit_38 := test_neon_partial_solve_wit_38_pure -> test_neon_partial_solve_wit_38_aux.

Definition test_neon_partial_solve_wit_39_pure := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (retval: Z) (PreH1 : (retval = (xt_round_down (block_height) (2)))) (PreH2 : (block_width <> 0)) (PreH3 : (block_height <> 0)) (PreH4 : (block_height = 1)) (PreH5 : (output_stride >= (block_height * sizeof(UINT) ))) (PreH6 : (block_width <> 1)) (PreH7 : (xt_valid F W G )) (PreH8 : (input = (xt_input (G)))) (PreH9 : (output = (xt_output_base (G)))) (PreH10 : (input_stride = (xt_input_stride (G)))) (PreH11 : (output_stride = (xt_output_stride (G)))) (PreH12 : (block_width = (xt_width (G)))) (PreH13 : (block_height = (xt_height (G)))) (PreH14 : (sizeof(UINT) = 4)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (sizeof(UINT64) = 8)) (PreH17 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH18 : (block_height = 1)) ,
  ((( &( "output_reset" ) )) # UInt64  |->_)
  **  ((( &( "input_offset" ) )) # UInt64  |-> (unsigned_last_nbits ((2 * input_stride )) (64)))
  **  ((( &( "input_reset" ) )) # UInt64  |-> (unsigned_last_nbits (((2 * sizeof(UINT) ) - (unsigned_last_nbits ((retval * input_stride )) (64)) )) (64)))
  **  ((( &( "tile_wbytes" ) )) # UInt64  |-> (2 * sizeof(UINT) ))
  **  ((( &( "tile_hbytes" ) )) # UInt64  |-> (2 * sizeof(UINT) ))
  **  ((( &( "tile_width" ) )) # UInt64  |-> 2)
  **  ((( &( "tile_height" ) )) # UInt64  |-> 2)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  (xt_data F )
  **  (xt_output W old )
|--
  “ (2 > 0) ”
.

Definition test_neon_partial_solve_wit_39_aux := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_width: Z) (block_height: Z) (retval: Z) (PreH1 : (retval = (xt_round_down (block_height) (2)))) (PreH2 : (block_width <> 0)) (PreH3 : (block_height <> 0)) (PreH4 : (block_height = 1)) (PreH5 : (output_stride >= (block_height * sizeof(UINT) ))) (PreH6 : (block_width <> 1)) (PreH7 : (xt_valid F W G )) (PreH8 : (input = (xt_input (G)))) (PreH9 : (output = (xt_output_base (G)))) (PreH10 : (input_stride = (xt_input_stride (G)))) (PreH11 : (output_stride = (xt_output_stride (G)))) (PreH12 : (block_width = (xt_width (G)))) (PreH13 : (block_height = (xt_height (G)))) (PreH14 : (sizeof(UINT) = 4)) (PreH15 : (sizeof(UINT64) = 8)) (PreH16 : (sizeof(UINT64) = 8)) (PreH17 : (output_stride >= (unsigned_last_nbits ((block_height * 4 )) (64)))) (PreH18 : (block_height = 1)) ,
  (xt_data F )
  **  (xt_output W old )
|--
  “ (2 > 0) ” 
  &&  “ (retval = (xt_round_down (block_height) (2))) ” 
  &&  “ (block_width <> 0) ” 
  &&  “ (block_height <> 0) ” 
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

Definition test_neon_partial_solve_wit_39 := test_neon_partial_solve_wit_39_pure -> test_neon_partial_solve_wit_39_aux.

Definition test_neon_partial_solve_wit_40_pure := 
(
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (R: XTOutput) (o1: Z) (o0: Z) (i1: Z) (i0: Z) (bh: Z) (block_width: Z) (k: Z) (output_reset: Z) (input_offset: Z) (input_reset: Z) (tile_wbytes: Z) (tile_hbytes: Z) (tile_width: Z) (tile_height: Z) (block_height: Z) (output_stride: Z) (input_stride: Z) (output: Z) (input: Z) (PreH1 : (bh >= 2)) (PreH2 : (xt_valid F W G )) (PreH3 : (input = (xt_input (G)))) (PreH4 : (output = (xt_output_base (G)))) (PreH5 : (input_stride = (xt_input_stride (G)))) (PreH6 : (output_stride = (xt_output_stride (G)))) (PreH7 : (block_height = (xt_height (G)))) (PreH8 : (0 < block_height)) (PreH9 : (sizeof(UINT) = 4)) (PreH10 : (sizeof(UINT64) = 8)) (PreH11 : (sizeof(UINT64) = 8)) (PreH12 : (tile_height = 2)) (PreH13 : (tile_width = 2)) (PreH14 : (tile_hbytes = 8)) (PreH15 : (tile_wbytes = 8)) (PreH16 : (input_reset = (xt_neon_input_reset (G)))) (PreH17 : (input_offset = (xt_neon_input_offset (G)))) (PreH18 : (output_reset = (xt_neon_output_reset (G)))) (PreH19 : (0 <= k)) (PreH20 : (k <= ((xt_cols (G)) + 1 ))) (PreH21 : ((k % ( 2 ) ) = 0)) (PreH22 : (block_width = (xt_doz ((xt_cols (G))) (k)))) (PreH23 : (0 < block_width)) (PreH24 : (k < (xt_cols (G)))) (PreH25 : (0 <= bh)) (PreH26 : (bh <= block_height)) (PreH27 : (((block_height - bh ) % ( 2 ) ) = 0)) (PreH28 : (i0 = (xt_current_input (G) (k) ((block_height - bh ))))) (PreH29 : (i1 = (xt_current_input (G) (k) (((block_height - bh ) + 1 ))))) (PreH30 : (o0 = (xt_current_output (G) (k) ((block_height - bh ))))) (PreH31 : (o1 = (xt_current_output (G) ((xt_neon_second (k) (block_width))) ((block_height - bh ))))) (PreH32 : (xt_progress F G old R k (xt_neon_batch (block_width)) (block_height - bh ) )) ,
  (UndefStructPreduint32x2_t ( &( "v1_0" ) ) )
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  ((( &( "tile_height" ) )) # UInt64  |-> tile_height)
  **  ((( &( "tile_width" ) )) # UInt64  |-> tile_width)
  **  ((( &( "tile_hbytes" ) )) # UInt64  |-> tile_hbytes)
  **  ((( &( "tile_wbytes" ) )) # UInt64  |-> tile_wbytes)
  **  ((( &( "input_reset" ) )) # UInt64  |-> input_reset)
  **  ((( &( "input_offset" ) )) # UInt64  |-> input_offset)
  **  ((( &( "output_reset" ) )) # UInt64  |-> output_reset)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "bh" ) )) # UInt64  |-> bh)
  **  ((( &( "i0" ) )) # Ptr  |-> i0)
  **  ((( &( "i1" ) )) # Ptr  |-> i1)
  **  ((( &( "o0" ) )) # Ptr  |-> o0)
  **  ((( &( "o1" ) )) # Ptr  |-> o1)
  **  (xt_data F )
  **  (xt_output W R )
|--
  “ (xt_window F i0 2 ) ”
) \/
(
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (R: XTOutput) (o1: Z) (o0: Z) (i1: Z) (i0: Z) (bh: Z) (block_width: Z) (k: Z) (output_reset: Z) (input_offset: Z) (input_reset: Z) (tile_wbytes: Z) (tile_hbytes: Z) (tile_width: Z) (tile_height: Z) (block_height: Z) (output_stride: Z) (input_stride: Z) (output: Z) (input: Z) (PreH1 : (bh <= UINT64_MAX)) (PreH2 : (block_width <= UINT64_MAX)) (PreH3 : (output_reset <= UINT64_MAX)) (PreH4 : (input_offset <= UINT64_MAX)) (PreH5 : (input_reset <= UINT64_MAX)) (PreH6 : (tile_wbytes <= UINT64_MAX)) (PreH7 : (tile_hbytes <= UINT64_MAX)) (PreH8 : (tile_width <= UINT64_MAX)) (PreH9 : (tile_height <= UINT64_MAX)) (PreH10 : (block_height <= UINT64_MAX)) (PreH11 : (output_stride <= UINT64_MAX)) (PreH12 : (input_stride <= UINT64_MAX)) (PreH13 : (bh >= 0)) (PreH14 : (block_width >= 0)) (PreH15 : (output_reset >= 0)) (PreH16 : (input_offset >= 0)) (PreH17 : (input_reset >= 0)) (PreH18 : (tile_wbytes >= 0)) (PreH19 : (tile_hbytes >= 0)) (PreH20 : (tile_width >= 0)) (PreH21 : (tile_height >= 0)) (PreH22 : (block_height >= 0)) (PreH23 : (output_stride >= 0)) (PreH24 : (input_stride >= 0)) (PreH25 : (bh >= 2)) (PreH26 : (xt_valid F W G )) (PreH27 : (input = (xt_input (G)))) (PreH28 : (output = (xt_output_base (G)))) (PreH29 : (input_stride = (xt_input_stride (G)))) (PreH30 : (output_stride = (xt_output_stride (G)))) (PreH31 : (block_height = (xt_height (G)))) (PreH32 : (0 < block_height)) (PreH33 : (sizeof(UINT) = 4)) (PreH34 : (sizeof(UINT64) = 8)) (PreH35 : (sizeof(UINT64) = 8)) (PreH36 : (tile_height = 2)) (PreH37 : (tile_width = 2)) (PreH38 : (tile_hbytes = 8)) (PreH39 : (tile_wbytes = 8)) (PreH40 : (input_reset = (xt_neon_input_reset (G)))) (PreH41 : (input_offset = (xt_neon_input_offset (G)))) (PreH42 : (output_reset = (xt_neon_output_reset (G)))) (PreH43 : (0 <= k)) (PreH44 : (k <= ((xt_cols (G)) + 1 ))) (PreH45 : ((k % ( 2 ) ) = 0)) (PreH46 : (block_width = (xt_doz ((xt_cols (G))) (k)))) (PreH47 : (0 < block_width)) (PreH48 : (k < (xt_cols (G)))) (PreH49 : (0 <= bh)) (PreH50 : (bh <= block_height)) (PreH51 : (((block_height - bh ) % ( 2 ) ) = 0)) (PreH52 : (i0 = (xt_current_input (G) (k) ((block_height - bh ))))) (PreH53 : (i1 = (xt_current_input (G) (k) (((block_height - bh ) + 1 ))))) (PreH54 : (o0 = (xt_current_output (G) (k) ((block_height - bh ))))) (PreH55 : (o1 = (xt_current_output (G) ((xt_neon_second (k) (block_width))) ((block_height - bh ))))) (PreH56 : (xt_progress F G old R k (xt_neon_batch (block_width)) (block_height - bh ) )) ,
  (UndefStructPreduint32x2_t ( &( "v1_0" ) ) )
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  ((( &( "tile_height" ) )) # UInt64  |-> tile_height)
  **  ((( &( "tile_width" ) )) # UInt64  |-> tile_width)
  **  ((( &( "tile_hbytes" ) )) # UInt64  |-> tile_hbytes)
  **  ((( &( "tile_wbytes" ) )) # UInt64  |-> tile_wbytes)
  **  ((( &( "input_reset" ) )) # UInt64  |-> input_reset)
  **  ((( &( "input_offset" ) )) # UInt64  |-> input_offset)
  **  ((( &( "output_reset" ) )) # UInt64  |-> output_reset)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "bh" ) )) # UInt64  |-> bh)
  **  ((( &( "i0" ) )) # Ptr  |-> i0)
  **  ((( &( "i1" ) )) # Ptr  |-> i1)
  **  ((( &( "o0" ) )) # Ptr  |-> o0)
  **  ((( &( "o1" ) )) # Ptr  |-> o1)
  **  (xt_data F )
  **  (xt_output W R )
|--
  “ (xt_window F i0 2 ) ”
).

Definition test_neon_partial_solve_wit_40_pure_split_goal_1 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (R: XTOutput) (o1: Z) (o0: Z) (i1: Z) (i0: Z) (bh: Z) (block_width: Z) (k: Z) (output_reset: Z) (input_offset: Z) (input_reset: Z) (tile_wbytes: Z) (tile_hbytes: Z) (tile_width: Z) (tile_height: Z) (block_height: Z) (output_stride: Z) (input_stride: Z) (output: Z) (input: Z) (PreH1 : (bh <= UINT64_MAX)) (PreH2 : (block_width <= UINT64_MAX)) (PreH3 : (output_reset <= UINT64_MAX)) (PreH4 : (input_offset <= UINT64_MAX)) (PreH5 : (input_reset <= UINT64_MAX)) (PreH6 : (tile_wbytes <= UINT64_MAX)) (PreH7 : (tile_hbytes <= UINT64_MAX)) (PreH8 : (tile_width <= UINT64_MAX)) (PreH9 : (tile_height <= UINT64_MAX)) (PreH10 : (block_height <= UINT64_MAX)) (PreH11 : (output_stride <= UINT64_MAX)) (PreH12 : (input_stride <= UINT64_MAX)) (PreH13 : (bh >= 0)) (PreH14 : (block_width >= 0)) (PreH15 : (output_reset >= 0)) (PreH16 : (input_offset >= 0)) (PreH17 : (input_reset >= 0)) (PreH18 : (tile_wbytes >= 0)) (PreH19 : (tile_hbytes >= 0)) (PreH20 : (tile_width >= 0)) (PreH21 : (tile_height >= 0)) (PreH22 : (block_height >= 0)) (PreH23 : (output_stride >= 0)) (PreH24 : (input_stride >= 0)) (PreH25 : (bh >= 2)) (PreH26 : (xt_valid F W G )) (PreH27 : (input = (xt_input (G)))) (PreH28 : (output = (xt_output_base (G)))) (PreH29 : (input_stride = (xt_input_stride (G)))) (PreH30 : (output_stride = (xt_output_stride (G)))) (PreH31 : (block_height = (xt_height (G)))) (PreH32 : (0 < block_height)) (PreH33 : (sizeof(UINT) = 4)) (PreH34 : (sizeof(UINT64) = 8)) (PreH35 : (sizeof(UINT64) = 8)) (PreH36 : (tile_height = 2)) (PreH37 : (tile_width = 2)) (PreH38 : (tile_hbytes = 8)) (PreH39 : (tile_wbytes = 8)) (PreH40 : (input_reset = (xt_neon_input_reset (G)))) (PreH41 : (input_offset = (xt_neon_input_offset (G)))) (PreH42 : (output_reset = (xt_neon_output_reset (G)))) (PreH43 : (0 <= k)) (PreH44 : (k <= ((xt_cols (G)) + 1 ))) (PreH45 : ((k % ( 2 ) ) = 0)) (PreH46 : (block_width = (xt_doz ((xt_cols (G))) (k)))) (PreH47 : (0 < block_width)) (PreH48 : (k < (xt_cols (G)))) (PreH49 : (0 <= bh)) (PreH50 : (bh <= block_height)) (PreH51 : (((block_height - bh ) % ( 2 ) ) = 0)) (PreH52 : (i0 = (xt_current_input (G) (k) ((block_height - bh ))))) (PreH53 : (i1 = (xt_current_input (G) (k) (((block_height - bh ) + 1 ))))) (PreH54 : (o0 = (xt_current_output (G) (k) ((block_height - bh ))))) (PreH55 : (o1 = (xt_current_output (G) ((xt_neon_second (k) (block_width))) ((block_height - bh ))))) (PreH56 : (xt_progress F G old R k (xt_neon_batch (block_width)) (block_height - bh ) )) ,
  (UndefStructPreduint32x2_t ( &( "v1_0" ) ) )
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  ((( &( "tile_height" ) )) # UInt64  |-> tile_height)
  **  ((( &( "tile_width" ) )) # UInt64  |-> tile_width)
  **  ((( &( "tile_hbytes" ) )) # UInt64  |-> tile_hbytes)
  **  ((( &( "tile_wbytes" ) )) # UInt64  |-> tile_wbytes)
  **  ((( &( "input_reset" ) )) # UInt64  |-> input_reset)
  **  ((( &( "input_offset" ) )) # UInt64  |-> input_offset)
  **  ((( &( "output_reset" ) )) # UInt64  |-> output_reset)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "bh" ) )) # UInt64  |-> bh)
  **  ((( &( "i0" ) )) # Ptr  |-> i0)
  **  ((( &( "i1" ) )) # Ptr  |-> i1)
  **  ((( &( "o0" ) )) # Ptr  |-> o0)
  **  ((( &( "o1" ) )) # Ptr  |-> o1)
  **  (xt_data F )
  **  (xt_output W R )
|--
  “ (xt_window F i0 2 ) ”
.

Definition test_neon_partial_solve_wit_40_aux := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (R: XTOutput) (o1: Z) (o0: Z) (i1: Z) (i0: Z) (bh: Z) (block_width: Z) (k: Z) (output_reset: Z) (input_offset: Z) (input_reset: Z) (tile_wbytes: Z) (tile_hbytes: Z) (tile_width: Z) (tile_height: Z) (block_height: Z) (output_stride: Z) (input_stride: Z) (output: Z) (input: Z) (PreH1 : (bh >= 2)) (PreH2 : (xt_valid F W G )) (PreH3 : (input = (xt_input (G)))) (PreH4 : (output = (xt_output_base (G)))) (PreH5 : (input_stride = (xt_input_stride (G)))) (PreH6 : (output_stride = (xt_output_stride (G)))) (PreH7 : (block_height = (xt_height (G)))) (PreH8 : (0 < block_height)) (PreH9 : (sizeof(UINT) = 4)) (PreH10 : (sizeof(UINT64) = 8)) (PreH11 : (sizeof(UINT64) = 8)) (PreH12 : (tile_height = 2)) (PreH13 : (tile_width = 2)) (PreH14 : (tile_hbytes = 8)) (PreH15 : (tile_wbytes = 8)) (PreH16 : (input_reset = (xt_neon_input_reset (G)))) (PreH17 : (input_offset = (xt_neon_input_offset (G)))) (PreH18 : (output_reset = (xt_neon_output_reset (G)))) (PreH19 : (0 <= k)) (PreH20 : (k <= ((xt_cols (G)) + 1 ))) (PreH21 : ((k % ( 2 ) ) = 0)) (PreH22 : (block_width = (xt_doz ((xt_cols (G))) (k)))) (PreH23 : (0 < block_width)) (PreH24 : (k < (xt_cols (G)))) (PreH25 : (0 <= bh)) (PreH26 : (bh <= block_height)) (PreH27 : (((block_height - bh ) % ( 2 ) ) = 0)) (PreH28 : (i0 = (xt_current_input (G) (k) ((block_height - bh ))))) (PreH29 : (i1 = (xt_current_input (G) (k) (((block_height - bh ) + 1 ))))) (PreH30 : (o0 = (xt_current_output (G) (k) ((block_height - bh ))))) (PreH31 : (o1 = (xt_current_output (G) ((xt_neon_second (k) (block_width))) ((block_height - bh ))))) (PreH32 : (xt_progress F G old R k (xt_neon_batch (block_width)) (block_height - bh ) )) ,
  (UndefStructPreduint32x2_t ( &( "v1_0" ) ) )
  **  (xt_data F )
  **  (xt_output W R )
|--
  “ (xt_window F i0 2 ) ” 
  &&  “ (bh >= 2) ” 
  &&  “ (xt_valid F W G ) ” 
  &&  “ (input = (xt_input (G))) ” 
  &&  “ (output = (xt_output_base (G))) ” 
  &&  “ (input_stride = (xt_input_stride (G))) ” 
  &&  “ (output_stride = (xt_output_stride (G))) ” 
  &&  “ (block_height = (xt_height (G))) ” 
  &&  “ (0 < block_height) ” 
  &&  “ (sizeof(UINT) = 4) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (tile_height = 2) ” 
  &&  “ (tile_width = 2) ” 
  &&  “ (tile_hbytes = 8) ” 
  &&  “ (tile_wbytes = 8) ” 
  &&  “ (input_reset = (xt_neon_input_reset (G))) ” 
  &&  “ (input_offset = (xt_neon_input_offset (G))) ” 
  &&  “ (output_reset = (xt_neon_output_reset (G))) ” 
  &&  “ (0 <= k) ” 
  &&  “ (k <= ((xt_cols (G)) + 1 )) ” 
  &&  “ ((k % ( 2 ) ) = 0) ” 
  &&  “ (block_width = (xt_doz ((xt_cols (G))) (k))) ” 
  &&  “ (0 < block_width) ” 
  &&  “ (k < (xt_cols (G))) ” 
  &&  “ (0 <= bh) ” 
  &&  “ (bh <= block_height) ” 
  &&  “ (((block_height - bh ) % ( 2 ) ) = 0) ” 
  &&  “ (i0 = (xt_current_input (G) (k) ((block_height - bh )))) ” 
  &&  “ (i1 = (xt_current_input (G) (k) (((block_height - bh ) + 1 )))) ” 
  &&  “ (o0 = (xt_current_output (G) (k) ((block_height - bh )))) ” 
  &&  “ (o1 = (xt_current_output (G) ((xt_neon_second (k) (block_width))) ((block_height - bh )))) ” 
  &&  “ (xt_progress F G old R k (xt_neon_batch (block_width)) (block_height - bh ) ) ”
  &&  (xt_data F )
  **  (UndefStructPreduint32x2_t ( &( "v1_0" ) ) )
  **  (xt_output W R )
.

Definition test_neon_partial_solve_wit_40 := test_neon_partial_solve_wit_40_pure -> test_neon_partial_solve_wit_40_aux.

Definition test_neon_partial_solve_wit_41 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (R: XTOutput) (o1: Z) (o0: Z) (i1: Z) (i0: Z) (bh: Z) (block_width: Z) (k: Z) (output_reset: Z) (input_offset: Z) (input_reset: Z) (tile_wbytes: Z) (tile_hbytes: Z) (tile_width: Z) (tile_height: Z) (block_height: Z) (output_stride: Z) (input_stride: Z) (output: Z) (input: Z) (retval: Z) (PreH1 : (bh >= 2)) (PreH2 : (xt_valid F W G )) (PreH3 : (input = (xt_input (G)))) (PreH4 : (output = (xt_output_base (G)))) (PreH5 : (input_stride = (xt_input_stride (G)))) (PreH6 : (output_stride = (xt_output_stride (G)))) (PreH7 : (block_height = (xt_height (G)))) (PreH8 : (0 < block_height)) (PreH9 : (sizeof(UINT) = 4)) (PreH10 : (sizeof(UINT64) = 8)) (PreH11 : (sizeof(UINT64) = 8)) (PreH12 : (tile_height = 2)) (PreH13 : (tile_width = 2)) (PreH14 : (tile_hbytes = 8)) (PreH15 : (tile_wbytes = 8)) (PreH16 : (input_reset = (xt_neon_input_reset (G)))) (PreH17 : (input_offset = (xt_neon_input_offset (G)))) (PreH18 : (output_reset = (xt_neon_output_reset (G)))) (PreH19 : (0 <= k)) (PreH20 : (k <= ((xt_cols (G)) + 1 ))) (PreH21 : ((k % ( 2 ) ) = 0)) (PreH22 : (block_width = (xt_doz ((xt_cols (G))) (k)))) (PreH23 : (0 < block_width)) (PreH24 : (k < (xt_cols (G)))) (PreH25 : (0 <= bh)) (PreH26 : (bh <= block_height)) (PreH27 : (((block_height - bh ) % ( 2 ) ) = 0)) (PreH28 : (i0 = (xt_current_input (G) (k) ((block_height - bh ))))) (PreH29 : (i1 = (xt_current_input (G) (k) (((block_height - bh ) + 1 ))))) (PreH30 : (o0 = (xt_current_output (G) (k) ((block_height - bh ))))) (PreH31 : (o1 = (xt_current_output (G) ((xt_neon_second (k) (block_width))) ((block_height - bh ))))) (PreH32 : (xt_progress F G old R k (xt_neon_batch (block_width)) (block_height - bh ) )) ,
  (xt_data F )
  **  ((&((retval)  # "uint32x2_t" ->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (0)))
  **  ((&((retval)  # "uint32x2_t" ->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (i0) (1)))
  **  (UndefStructPreduint32x2_t ( &( "v1_0" ) ) )
  **  (xt_output W R )
|--
  “ (bh >= 2) ” 
  &&  “ (xt_valid F W G ) ” 
  &&  “ (input = (xt_input (G))) ” 
  &&  “ (output = (xt_output_base (G))) ” 
  &&  “ (input_stride = (xt_input_stride (G))) ” 
  &&  “ (output_stride = (xt_output_stride (G))) ” 
  &&  “ (block_height = (xt_height (G))) ” 
  &&  “ (0 < block_height) ” 
  &&  “ (sizeof(UINT) = 4) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (tile_height = 2) ” 
  &&  “ (tile_width = 2) ” 
  &&  “ (tile_hbytes = 8) ” 
  &&  “ (tile_wbytes = 8) ” 
  &&  “ (input_reset = (xt_neon_input_reset (G))) ” 
  &&  “ (input_offset = (xt_neon_input_offset (G))) ” 
  &&  “ (output_reset = (xt_neon_output_reset (G))) ” 
  &&  “ (0 <= k) ” 
  &&  “ (k <= ((xt_cols (G)) + 1 )) ” 
  &&  “ ((k % ( 2 ) ) = 0) ” 
  &&  “ (block_width = (xt_doz ((xt_cols (G))) (k))) ” 
  &&  “ (0 < block_width) ” 
  &&  “ (k < (xt_cols (G))) ” 
  &&  “ (0 <= bh) ” 
  &&  “ (bh <= block_height) ” 
  &&  “ (((block_height - bh ) % ( 2 ) ) = 0) ” 
  &&  “ (i0 = (xt_current_input (G) (k) ((block_height - bh )))) ” 
  &&  “ (i1 = (xt_current_input (G) (k) (((block_height - bh ) + 1 )))) ” 
  &&  “ (o0 = (xt_current_output (G) (k) ((block_height - bh )))) ” 
  &&  “ (o1 = (xt_current_output (G) ((xt_neon_second (k) (block_width))) ((block_height - bh )))) ” 
  &&  “ (xt_progress F G old R k (xt_neon_batch (block_width)) (block_height - bh ) ) ”
  &&  ((&(( &( "v1_0" ) )->ₛ "s1")) # UInt  |->_)
  **  ((&((retval)  # "uint32x2_t" ->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (i0) (1)))
  **  ((&(( &( "v1_0" ) )->ₛ "s0")) # UInt  |->_)
  **  ((&((retval)  # "uint32x2_t" ->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (0)))
  **  (xt_data F )
  **  (xt_output W R )
.

Definition test_neon_partial_solve_wit_42_pure := 
(
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (R: XTOutput) (o1: Z) (o0: Z) (i1: Z) (i0: Z) (bh: Z) (block_width: Z) (k: Z) (output_reset: Z) (input_offset: Z) (input_reset: Z) (tile_wbytes: Z) (tile_hbytes: Z) (tile_width: Z) (tile_height: Z) (block_height: Z) (output_stride: Z) (input_stride: Z) (output: Z) (input: Z) (PreH1 : (bh >= 2)) (PreH2 : (xt_valid F W G )) (PreH3 : (input = (xt_input (G)))) (PreH4 : (output = (xt_output_base (G)))) (PreH5 : (input_stride = (xt_input_stride (G)))) (PreH6 : (output_stride = (xt_output_stride (G)))) (PreH7 : (block_height = (xt_height (G)))) (PreH8 : (0 < block_height)) (PreH9 : (sizeof(UINT) = 4)) (PreH10 : (sizeof(UINT64) = 8)) (PreH11 : (sizeof(UINT64) = 8)) (PreH12 : (tile_height = 2)) (PreH13 : (tile_width = 2)) (PreH14 : (tile_hbytes = 8)) (PreH15 : (tile_wbytes = 8)) (PreH16 : (input_reset = (xt_neon_input_reset (G)))) (PreH17 : (input_offset = (xt_neon_input_offset (G)))) (PreH18 : (output_reset = (xt_neon_output_reset (G)))) (PreH19 : (0 <= k)) (PreH20 : (k <= ((xt_cols (G)) + 1 ))) (PreH21 : ((k % ( 2 ) ) = 0)) (PreH22 : (block_width = (xt_doz ((xt_cols (G))) (k)))) (PreH23 : (0 < block_width)) (PreH24 : (k < (xt_cols (G)))) (PreH25 : (0 <= bh)) (PreH26 : (bh <= block_height)) (PreH27 : (((block_height - bh ) % ( 2 ) ) = 0)) (PreH28 : (i0 = (xt_current_input (G) (k) ((block_height - bh ))))) (PreH29 : (i1 = (xt_current_input (G) (k) (((block_height - bh ) + 1 ))))) (PreH30 : (o0 = (xt_current_output (G) (k) ((block_height - bh ))))) (PreH31 : (o1 = (xt_current_output (G) ((xt_neon_second (k) (block_width))) ((block_height - bh ))))) (PreH32 : (xt_progress F G old R k (xt_neon_batch (block_width)) (block_height - bh ) )) ,
  (UndefStructPreduint32x2_t ( &( "v1_1" ) ) )
  **  ((&(( &( "v1_0" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (i0) (1)))
  **  ((&(( &( "v1_0" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (0)))
  **  (xt_data F )
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  ((( &( "tile_height" ) )) # UInt64  |-> tile_height)
  **  ((( &( "tile_width" ) )) # UInt64  |-> tile_width)
  **  ((( &( "tile_hbytes" ) )) # UInt64  |-> tile_hbytes)
  **  ((( &( "tile_wbytes" ) )) # UInt64  |-> tile_wbytes)
  **  ((( &( "input_reset" ) )) # UInt64  |-> input_reset)
  **  ((( &( "input_offset" ) )) # UInt64  |-> input_offset)
  **  ((( &( "output_reset" ) )) # UInt64  |-> output_reset)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "bh" ) )) # UInt64  |-> bh)
  **  ((( &( "i0" ) )) # Ptr  |-> (unsigned_last_nbits (((unsigned_last_nbits (i0) (64)) + input_offset )) (64)))
  **  ((( &( "i1" ) )) # Ptr  |-> i1)
  **  ((( &( "o0" ) )) # Ptr  |-> o0)
  **  ((( &( "o1" ) )) # Ptr  |-> o1)
  **  (xt_output W R )
|--
  “ (xt_window F i1 2 ) ”
) \/
(
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (R: XTOutput) (o1: Z) (o0: Z) (i1: Z) (i0: Z) (bh: Z) (block_width: Z) (k: Z) (output_reset: Z) (input_offset: Z) (input_reset: Z) (tile_wbytes: Z) (tile_hbytes: Z) (tile_width: Z) (tile_height: Z) (block_height: Z) (output_stride: Z) (input_stride: Z) (output: Z) (input: Z) (PreH1 : (bh <= UINT64_MAX)) (PreH2 : (block_width <= UINT64_MAX)) (PreH3 : (output_reset <= UINT64_MAX)) (PreH4 : (input_offset <= UINT64_MAX)) (PreH5 : (input_reset <= UINT64_MAX)) (PreH6 : (tile_wbytes <= UINT64_MAX)) (PreH7 : (tile_hbytes <= UINT64_MAX)) (PreH8 : (tile_width <= UINT64_MAX)) (PreH9 : (tile_height <= UINT64_MAX)) (PreH10 : (block_height <= UINT64_MAX)) (PreH11 : (output_stride <= UINT64_MAX)) (PreH12 : (input_stride <= UINT64_MAX)) (PreH13 : (bh >= 0)) (PreH14 : (block_width >= 0)) (PreH15 : (output_reset >= 0)) (PreH16 : (input_offset >= 0)) (PreH17 : (input_reset >= 0)) (PreH18 : (tile_wbytes >= 0)) (PreH19 : (tile_hbytes >= 0)) (PreH20 : (tile_width >= 0)) (PreH21 : (tile_height >= 0)) (PreH22 : (block_height >= 0)) (PreH23 : (output_stride >= 0)) (PreH24 : (input_stride >= 0)) (PreH25 : ((xt_load_lane (F) (i0) (0)) <= UINT_MAX)) (PreH26 : ((xt_load_lane (F) (i0) (1)) <= UINT_MAX)) (PreH27 : ((xt_load_lane (F) (i0) (0)) >= 0)) (PreH28 : ((xt_load_lane (F) (i0) (1)) >= 0)) (PreH29 : (bh >= 2)) (PreH30 : (xt_valid F W G )) (PreH31 : (input = (xt_input (G)))) (PreH32 : (output = (xt_output_base (G)))) (PreH33 : (input_stride = (xt_input_stride (G)))) (PreH34 : (output_stride = (xt_output_stride (G)))) (PreH35 : (block_height = (xt_height (G)))) (PreH36 : (0 < block_height)) (PreH37 : (sizeof(UINT) = 4)) (PreH38 : (sizeof(UINT64) = 8)) (PreH39 : (sizeof(UINT64) = 8)) (PreH40 : (tile_height = 2)) (PreH41 : (tile_width = 2)) (PreH42 : (tile_hbytes = 8)) (PreH43 : (tile_wbytes = 8)) (PreH44 : (input_reset = (xt_neon_input_reset (G)))) (PreH45 : (input_offset = (xt_neon_input_offset (G)))) (PreH46 : (output_reset = (xt_neon_output_reset (G)))) (PreH47 : (0 <= k)) (PreH48 : (k <= ((xt_cols (G)) + 1 ))) (PreH49 : ((k % ( 2 ) ) = 0)) (PreH50 : (block_width = (xt_doz ((xt_cols (G))) (k)))) (PreH51 : (0 < block_width)) (PreH52 : (k < (xt_cols (G)))) (PreH53 : (0 <= bh)) (PreH54 : (bh <= block_height)) (PreH55 : (((block_height - bh ) % ( 2 ) ) = 0)) (PreH56 : (i0 = (xt_current_input (G) (k) ((block_height - bh ))))) (PreH57 : (i1 = (xt_current_input (G) (k) (((block_height - bh ) + 1 ))))) (PreH58 : (o0 = (xt_current_output (G) (k) ((block_height - bh ))))) (PreH59 : (o1 = (xt_current_output (G) ((xt_neon_second (k) (block_width))) ((block_height - bh ))))) (PreH60 : (xt_progress F G old R k (xt_neon_batch (block_width)) (block_height - bh ) )) ,
  (UndefStructPreduint32x2_t ( &( "v1_1" ) ) )
  **  ((&(( &( "v1_0" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (i0) (1)))
  **  ((&(( &( "v1_0" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (0)))
  **  (xt_data F )
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  ((( &( "tile_height" ) )) # UInt64  |-> tile_height)
  **  ((( &( "tile_width" ) )) # UInt64  |-> tile_width)
  **  ((( &( "tile_hbytes" ) )) # UInt64  |-> tile_hbytes)
  **  ((( &( "tile_wbytes" ) )) # UInt64  |-> tile_wbytes)
  **  ((( &( "input_reset" ) )) # UInt64  |-> input_reset)
  **  ((( &( "input_offset" ) )) # UInt64  |-> input_offset)
  **  ((( &( "output_reset" ) )) # UInt64  |-> output_reset)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "bh" ) )) # UInt64  |-> bh)
  **  ((( &( "i0" ) )) # Ptr  |-> (unsigned_last_nbits (((unsigned_last_nbits (i0) (64)) + input_offset )) (64)))
  **  ((( &( "i1" ) )) # Ptr  |-> i1)
  **  ((( &( "o0" ) )) # Ptr  |-> o0)
  **  ((( &( "o1" ) )) # Ptr  |-> o1)
  **  (xt_output W R )
|--
  “ (xt_window F i1 2 ) ”
).

Definition test_neon_partial_solve_wit_42_pure_split_goal_1 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (R: XTOutput) (o1: Z) (o0: Z) (i1: Z) (i0: Z) (bh: Z) (block_width: Z) (k: Z) (output_reset: Z) (input_offset: Z) (input_reset: Z) (tile_wbytes: Z) (tile_hbytes: Z) (tile_width: Z) (tile_height: Z) (block_height: Z) (output_stride: Z) (input_stride: Z) (output: Z) (input: Z) (PreH1 : (bh <= UINT64_MAX)) (PreH2 : (block_width <= UINT64_MAX)) (PreH3 : (output_reset <= UINT64_MAX)) (PreH4 : (input_offset <= UINT64_MAX)) (PreH5 : (input_reset <= UINT64_MAX)) (PreH6 : (tile_wbytes <= UINT64_MAX)) (PreH7 : (tile_hbytes <= UINT64_MAX)) (PreH8 : (tile_width <= UINT64_MAX)) (PreH9 : (tile_height <= UINT64_MAX)) (PreH10 : (block_height <= UINT64_MAX)) (PreH11 : (output_stride <= UINT64_MAX)) (PreH12 : (input_stride <= UINT64_MAX)) (PreH13 : (bh >= 0)) (PreH14 : (block_width >= 0)) (PreH15 : (output_reset >= 0)) (PreH16 : (input_offset >= 0)) (PreH17 : (input_reset >= 0)) (PreH18 : (tile_wbytes >= 0)) (PreH19 : (tile_hbytes >= 0)) (PreH20 : (tile_width >= 0)) (PreH21 : (tile_height >= 0)) (PreH22 : (block_height >= 0)) (PreH23 : (output_stride >= 0)) (PreH24 : (input_stride >= 0)) (PreH25 : ((xt_load_lane (F) (i0) (0)) <= UINT_MAX)) (PreH26 : ((xt_load_lane (F) (i0) (1)) <= UINT_MAX)) (PreH27 : ((xt_load_lane (F) (i0) (0)) >= 0)) (PreH28 : ((xt_load_lane (F) (i0) (1)) >= 0)) (PreH29 : (bh >= 2)) (PreH30 : (xt_valid F W G )) (PreH31 : (input = (xt_input (G)))) (PreH32 : (output = (xt_output_base (G)))) (PreH33 : (input_stride = (xt_input_stride (G)))) (PreH34 : (output_stride = (xt_output_stride (G)))) (PreH35 : (block_height = (xt_height (G)))) (PreH36 : (0 < block_height)) (PreH37 : (sizeof(UINT) = 4)) (PreH38 : (sizeof(UINT64) = 8)) (PreH39 : (sizeof(UINT64) = 8)) (PreH40 : (tile_height = 2)) (PreH41 : (tile_width = 2)) (PreH42 : (tile_hbytes = 8)) (PreH43 : (tile_wbytes = 8)) (PreH44 : (input_reset = (xt_neon_input_reset (G)))) (PreH45 : (input_offset = (xt_neon_input_offset (G)))) (PreH46 : (output_reset = (xt_neon_output_reset (G)))) (PreH47 : (0 <= k)) (PreH48 : (k <= ((xt_cols (G)) + 1 ))) (PreH49 : ((k % ( 2 ) ) = 0)) (PreH50 : (block_width = (xt_doz ((xt_cols (G))) (k)))) (PreH51 : (0 < block_width)) (PreH52 : (k < (xt_cols (G)))) (PreH53 : (0 <= bh)) (PreH54 : (bh <= block_height)) (PreH55 : (((block_height - bh ) % ( 2 ) ) = 0)) (PreH56 : (i0 = (xt_current_input (G) (k) ((block_height - bh ))))) (PreH57 : (i1 = (xt_current_input (G) (k) (((block_height - bh ) + 1 ))))) (PreH58 : (o0 = (xt_current_output (G) (k) ((block_height - bh ))))) (PreH59 : (o1 = (xt_current_output (G) ((xt_neon_second (k) (block_width))) ((block_height - bh ))))) (PreH60 : (xt_progress F G old R k (xt_neon_batch (block_width)) (block_height - bh ) )) ,
  (UndefStructPreduint32x2_t ( &( "v1_1" ) ) )
  **  ((&(( &( "v1_0" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (i0) (1)))
  **  ((&(( &( "v1_0" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (0)))
  **  (xt_data F )
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  ((( &( "tile_height" ) )) # UInt64  |-> tile_height)
  **  ((( &( "tile_width" ) )) # UInt64  |-> tile_width)
  **  ((( &( "tile_hbytes" ) )) # UInt64  |-> tile_hbytes)
  **  ((( &( "tile_wbytes" ) )) # UInt64  |-> tile_wbytes)
  **  ((( &( "input_reset" ) )) # UInt64  |-> input_reset)
  **  ((( &( "input_offset" ) )) # UInt64  |-> input_offset)
  **  ((( &( "output_reset" ) )) # UInt64  |-> output_reset)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "bh" ) )) # UInt64  |-> bh)
  **  ((( &( "i0" ) )) # Ptr  |-> (unsigned_last_nbits (((unsigned_last_nbits (i0) (64)) + input_offset )) (64)))
  **  ((( &( "i1" ) )) # Ptr  |-> i1)
  **  ((( &( "o0" ) )) # Ptr  |-> o0)
  **  ((( &( "o1" ) )) # Ptr  |-> o1)
  **  (xt_output W R )
|--
  “ (xt_window F i1 2 ) ”
.

Definition test_neon_partial_solve_wit_42_aux := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (R: XTOutput) (o1: Z) (o0: Z) (i1: Z) (i0: Z) (bh: Z) (block_width: Z) (k: Z) (output_reset: Z) (input_offset: Z) (input_reset: Z) (tile_wbytes: Z) (tile_hbytes: Z) (tile_width: Z) (tile_height: Z) (block_height: Z) (output_stride: Z) (input_stride: Z) (output: Z) (input: Z) (PreH1 : (bh >= 2)) (PreH2 : (xt_valid F W G )) (PreH3 : (input = (xt_input (G)))) (PreH4 : (output = (xt_output_base (G)))) (PreH5 : (input_stride = (xt_input_stride (G)))) (PreH6 : (output_stride = (xt_output_stride (G)))) (PreH7 : (block_height = (xt_height (G)))) (PreH8 : (0 < block_height)) (PreH9 : (sizeof(UINT) = 4)) (PreH10 : (sizeof(UINT64) = 8)) (PreH11 : (sizeof(UINT64) = 8)) (PreH12 : (tile_height = 2)) (PreH13 : (tile_width = 2)) (PreH14 : (tile_hbytes = 8)) (PreH15 : (tile_wbytes = 8)) (PreH16 : (input_reset = (xt_neon_input_reset (G)))) (PreH17 : (input_offset = (xt_neon_input_offset (G)))) (PreH18 : (output_reset = (xt_neon_output_reset (G)))) (PreH19 : (0 <= k)) (PreH20 : (k <= ((xt_cols (G)) + 1 ))) (PreH21 : ((k % ( 2 ) ) = 0)) (PreH22 : (block_width = (xt_doz ((xt_cols (G))) (k)))) (PreH23 : (0 < block_width)) (PreH24 : (k < (xt_cols (G)))) (PreH25 : (0 <= bh)) (PreH26 : (bh <= block_height)) (PreH27 : (((block_height - bh ) % ( 2 ) ) = 0)) (PreH28 : (i0 = (xt_current_input (G) (k) ((block_height - bh ))))) (PreH29 : (i1 = (xt_current_input (G) (k) (((block_height - bh ) + 1 ))))) (PreH30 : (o0 = (xt_current_output (G) (k) ((block_height - bh ))))) (PreH31 : (o1 = (xt_current_output (G) ((xt_neon_second (k) (block_width))) ((block_height - bh ))))) (PreH32 : (xt_progress F G old R k (xt_neon_batch (block_width)) (block_height - bh ) )) ,
  (UndefStructPreduint32x2_t ( &( "v1_1" ) ) )
  **  ((&(( &( "v1_0" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (i0) (1)))
  **  ((&(( &( "v1_0" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (0)))
  **  (xt_data F )
  **  (xt_output W R )
|--
  “ (xt_window F i1 2 ) ” 
  &&  “ (bh >= 2) ” 
  &&  “ (xt_valid F W G ) ” 
  &&  “ (input = (xt_input (G))) ” 
  &&  “ (output = (xt_output_base (G))) ” 
  &&  “ (input_stride = (xt_input_stride (G))) ” 
  &&  “ (output_stride = (xt_output_stride (G))) ” 
  &&  “ (block_height = (xt_height (G))) ” 
  &&  “ (0 < block_height) ” 
  &&  “ (sizeof(UINT) = 4) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (tile_height = 2) ” 
  &&  “ (tile_width = 2) ” 
  &&  “ (tile_hbytes = 8) ” 
  &&  “ (tile_wbytes = 8) ” 
  &&  “ (input_reset = (xt_neon_input_reset (G))) ” 
  &&  “ (input_offset = (xt_neon_input_offset (G))) ” 
  &&  “ (output_reset = (xt_neon_output_reset (G))) ” 
  &&  “ (0 <= k) ” 
  &&  “ (k <= ((xt_cols (G)) + 1 )) ” 
  &&  “ ((k % ( 2 ) ) = 0) ” 
  &&  “ (block_width = (xt_doz ((xt_cols (G))) (k))) ” 
  &&  “ (0 < block_width) ” 
  &&  “ (k < (xt_cols (G))) ” 
  &&  “ (0 <= bh) ” 
  &&  “ (bh <= block_height) ” 
  &&  “ (((block_height - bh ) % ( 2 ) ) = 0) ” 
  &&  “ (i0 = (xt_current_input (G) (k) ((block_height - bh )))) ” 
  &&  “ (i1 = (xt_current_input (G) (k) (((block_height - bh ) + 1 )))) ” 
  &&  “ (o0 = (xt_current_output (G) (k) ((block_height - bh )))) ” 
  &&  “ (o1 = (xt_current_output (G) ((xt_neon_second (k) (block_width))) ((block_height - bh )))) ” 
  &&  “ (xt_progress F G old R k (xt_neon_batch (block_width)) (block_height - bh ) ) ”
  &&  (xt_data F )
  **  (UndefStructPreduint32x2_t ( &( "v1_1" ) ) )
  **  ((&(( &( "v1_0" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (i0) (1)))
  **  ((&(( &( "v1_0" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (0)))
  **  (xt_output W R )
.

Definition test_neon_partial_solve_wit_42 := test_neon_partial_solve_wit_42_pure -> test_neon_partial_solve_wit_42_aux.

Definition test_neon_partial_solve_wit_43 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (R: XTOutput) (o1: Z) (o0: Z) (i1: Z) (i0: Z) (bh: Z) (block_width: Z) (k: Z) (output_reset: Z) (input_offset: Z) (input_reset: Z) (tile_wbytes: Z) (tile_hbytes: Z) (tile_width: Z) (tile_height: Z) (block_height: Z) (output_stride: Z) (input_stride: Z) (output: Z) (input: Z) (retval: Z) (PreH1 : (bh >= 2)) (PreH2 : (xt_valid F W G )) (PreH3 : (input = (xt_input (G)))) (PreH4 : (output = (xt_output_base (G)))) (PreH5 : (input_stride = (xt_input_stride (G)))) (PreH6 : (output_stride = (xt_output_stride (G)))) (PreH7 : (block_height = (xt_height (G)))) (PreH8 : (0 < block_height)) (PreH9 : (sizeof(UINT) = 4)) (PreH10 : (sizeof(UINT64) = 8)) (PreH11 : (sizeof(UINT64) = 8)) (PreH12 : (tile_height = 2)) (PreH13 : (tile_width = 2)) (PreH14 : (tile_hbytes = 8)) (PreH15 : (tile_wbytes = 8)) (PreH16 : (input_reset = (xt_neon_input_reset (G)))) (PreH17 : (input_offset = (xt_neon_input_offset (G)))) (PreH18 : (output_reset = (xt_neon_output_reset (G)))) (PreH19 : (0 <= k)) (PreH20 : (k <= ((xt_cols (G)) + 1 ))) (PreH21 : ((k % ( 2 ) ) = 0)) (PreH22 : (block_width = (xt_doz ((xt_cols (G))) (k)))) (PreH23 : (0 < block_width)) (PreH24 : (k < (xt_cols (G)))) (PreH25 : (0 <= bh)) (PreH26 : (bh <= block_height)) (PreH27 : (((block_height - bh ) % ( 2 ) ) = 0)) (PreH28 : (i0 = (xt_current_input (G) (k) ((block_height - bh ))))) (PreH29 : (i1 = (xt_current_input (G) (k) (((block_height - bh ) + 1 ))))) (PreH30 : (o0 = (xt_current_output (G) (k) ((block_height - bh ))))) (PreH31 : (o1 = (xt_current_output (G) ((xt_neon_second (k) (block_width))) ((block_height - bh ))))) (PreH32 : (xt_progress F G old R k (xt_neon_batch (block_width)) (block_height - bh ) )) ,
  (xt_data F )
  **  ((&((retval)  # "uint32x2_t" ->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i1) (0)))
  **  ((&((retval)  # "uint32x2_t" ->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (i1) (1)))
  **  (UndefStructPreduint32x2_t ( &( "v1_1" ) ) )
  **  ((&(( &( "v1_0" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (i0) (1)))
  **  ((&(( &( "v1_0" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (0)))
  **  (xt_output W R )
|--
  “ (bh >= 2) ” 
  &&  “ (xt_valid F W G ) ” 
  &&  “ (input = (xt_input (G))) ” 
  &&  “ (output = (xt_output_base (G))) ” 
  &&  “ (input_stride = (xt_input_stride (G))) ” 
  &&  “ (output_stride = (xt_output_stride (G))) ” 
  &&  “ (block_height = (xt_height (G))) ” 
  &&  “ (0 < block_height) ” 
  &&  “ (sizeof(UINT) = 4) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (tile_height = 2) ” 
  &&  “ (tile_width = 2) ” 
  &&  “ (tile_hbytes = 8) ” 
  &&  “ (tile_wbytes = 8) ” 
  &&  “ (input_reset = (xt_neon_input_reset (G))) ” 
  &&  “ (input_offset = (xt_neon_input_offset (G))) ” 
  &&  “ (output_reset = (xt_neon_output_reset (G))) ” 
  &&  “ (0 <= k) ” 
  &&  “ (k <= ((xt_cols (G)) + 1 )) ” 
  &&  “ ((k % ( 2 ) ) = 0) ” 
  &&  “ (block_width = (xt_doz ((xt_cols (G))) (k))) ” 
  &&  “ (0 < block_width) ” 
  &&  “ (k < (xt_cols (G))) ” 
  &&  “ (0 <= bh) ” 
  &&  “ (bh <= block_height) ” 
  &&  “ (((block_height - bh ) % ( 2 ) ) = 0) ” 
  &&  “ (i0 = (xt_current_input (G) (k) ((block_height - bh )))) ” 
  &&  “ (i1 = (xt_current_input (G) (k) (((block_height - bh ) + 1 )))) ” 
  &&  “ (o0 = (xt_current_output (G) (k) ((block_height - bh )))) ” 
  &&  “ (o1 = (xt_current_output (G) ((xt_neon_second (k) (block_width))) ((block_height - bh )))) ” 
  &&  “ (xt_progress F G old R k (xt_neon_batch (block_width)) (block_height - bh ) ) ”
  &&  ((&(( &( "v1_1" ) )->ₛ "s1")) # UInt  |->_)
  **  ((&((retval)  # "uint32x2_t" ->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (i1) (1)))
  **  ((&(( &( "v1_1" ) )->ₛ "s0")) # UInt  |->_)
  **  ((&((retval)  # "uint32x2_t" ->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i1) (0)))
  **  (xt_data F )
  **  ((&(( &( "v1_0" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (i0) (1)))
  **  ((&(( &( "v1_0" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (0)))
  **  (xt_output W R )
.

Definition test_neon_partial_solve_wit_44 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (R: XTOutput) (o1: Z) (o0: Z) (i1: Z) (i0: Z) (bh: Z) (block_width: Z) (k: Z) (output_reset: Z) (input_offset: Z) (input_reset: Z) (tile_wbytes: Z) (tile_hbytes: Z) (tile_width: Z) (tile_height: Z) (block_height: Z) (output_stride: Z) (input_stride: Z) (output: Z) (input: Z) (PreH1 : (bh >= 2)) (PreH2 : (xt_valid F W G )) (PreH3 : (input = (xt_input (G)))) (PreH4 : (output = (xt_output_base (G)))) (PreH5 : (input_stride = (xt_input_stride (G)))) (PreH6 : (output_stride = (xt_output_stride (G)))) (PreH7 : (block_height = (xt_height (G)))) (PreH8 : (0 < block_height)) (PreH9 : (sizeof(UINT) = 4)) (PreH10 : (sizeof(UINT64) = 8)) (PreH11 : (sizeof(UINT64) = 8)) (PreH12 : (tile_height = 2)) (PreH13 : (tile_width = 2)) (PreH14 : (tile_hbytes = 8)) (PreH15 : (tile_wbytes = 8)) (PreH16 : (input_reset = (xt_neon_input_reset (G)))) (PreH17 : (input_offset = (xt_neon_input_offset (G)))) (PreH18 : (output_reset = (xt_neon_output_reset (G)))) (PreH19 : (0 <= k)) (PreH20 : (k <= ((xt_cols (G)) + 1 ))) (PreH21 : ((k % ( 2 ) ) = 0)) (PreH22 : (block_width = (xt_doz ((xt_cols (G))) (k)))) (PreH23 : (0 < block_width)) (PreH24 : (k < (xt_cols (G)))) (PreH25 : (0 <= bh)) (PreH26 : (bh <= block_height)) (PreH27 : (((block_height - bh ) % ( 2 ) ) = 0)) (PreH28 : (i0 = (xt_current_input (G) (k) ((block_height - bh ))))) (PreH29 : (i1 = (xt_current_input (G) (k) (((block_height - bh ) + 1 ))))) (PreH30 : (o0 = (xt_current_output (G) (k) ((block_height - bh ))))) (PreH31 : (o1 = (xt_current_output (G) ((xt_neon_second (k) (block_width))) ((block_height - bh ))))) (PreH32 : (xt_progress F G old R k (xt_neon_batch (block_width)) (block_height - bh ) )) ,
  (UndefStructPreduint32x2_t ( &( "v0_0_low" ) ) )
  **  ((&(( &( "v1_1" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (i1) (1)))
  **  ((&(( &( "v1_1" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i1) (0)))
  **  (xt_data F )
  **  ((&(( &( "v1_0" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (i0) (1)))
  **  ((&(( &( "v1_0" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (0)))
  **  (xt_output W R )
|--
  “ (bh >= 2) ” 
  &&  “ (xt_valid F W G ) ” 
  &&  “ (input = (xt_input (G))) ” 
  &&  “ (output = (xt_output_base (G))) ” 
  &&  “ (input_stride = (xt_input_stride (G))) ” 
  &&  “ (output_stride = (xt_output_stride (G))) ” 
  &&  “ (block_height = (xt_height (G))) ” 
  &&  “ (0 < block_height) ” 
  &&  “ (sizeof(UINT) = 4) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (tile_height = 2) ” 
  &&  “ (tile_width = 2) ” 
  &&  “ (tile_hbytes = 8) ” 
  &&  “ (tile_wbytes = 8) ” 
  &&  “ (input_reset = (xt_neon_input_reset (G))) ” 
  &&  “ (input_offset = (xt_neon_input_offset (G))) ” 
  &&  “ (output_reset = (xt_neon_output_reset (G))) ” 
  &&  “ (0 <= k) ” 
  &&  “ (k <= ((xt_cols (G)) + 1 )) ” 
  &&  “ ((k % ( 2 ) ) = 0) ” 
  &&  “ (block_width = (xt_doz ((xt_cols (G))) (k))) ” 
  &&  “ (0 < block_width) ” 
  &&  “ (k < (xt_cols (G))) ” 
  &&  “ (0 <= bh) ” 
  &&  “ (bh <= block_height) ” 
  &&  “ (((block_height - bh ) % ( 2 ) ) = 0) ” 
  &&  “ (i0 = (xt_current_input (G) (k) ((block_height - bh )))) ” 
  &&  “ (i1 = (xt_current_input (G) (k) (((block_height - bh ) + 1 )))) ” 
  &&  “ (o0 = (xt_current_output (G) (k) ((block_height - bh )))) ” 
  &&  “ (o1 = (xt_current_output (G) ((xt_neon_second (k) (block_width))) ((block_height - bh )))) ” 
  &&  “ (xt_progress F G old R k (xt_neon_batch (block_width)) (block_height - bh ) ) ”
  &&  ((&(( &( "v1_0" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (0)))
  **  ((&(( &( "v1_0" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (i0) (1)))
  **  ((&(( &( "v1_1" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i1) (0)))
  **  ((&(( &( "v1_1" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (i1) (1)))
  **  (UndefStructPreduint32x2_t ( &( "v0_0_low" ) ) )
  **  (xt_data F )
  **  (xt_output W R )
.

Definition test_neon_partial_solve_wit_45 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (R: XTOutput) (o1: Z) (o0: Z) (i1: Z) (i0: Z) (bh: Z) (block_width: Z) (k: Z) (output_reset: Z) (input_offset: Z) (input_reset: Z) (tile_wbytes: Z) (tile_hbytes: Z) (tile_width: Z) (tile_height: Z) (block_height: Z) (output_stride: Z) (input_stride: Z) (output: Z) (input: Z) (retval: Z) (PreH1 : (bh >= 2)) (PreH2 : (xt_valid F W G )) (PreH3 : (input = (xt_input (G)))) (PreH4 : (output = (xt_output_base (G)))) (PreH5 : (input_stride = (xt_input_stride (G)))) (PreH6 : (output_stride = (xt_output_stride (G)))) (PreH7 : (block_height = (xt_height (G)))) (PreH8 : (0 < block_height)) (PreH9 : (sizeof(UINT) = 4)) (PreH10 : (sizeof(UINT64) = 8)) (PreH11 : (sizeof(UINT64) = 8)) (PreH12 : (tile_height = 2)) (PreH13 : (tile_width = 2)) (PreH14 : (tile_hbytes = 8)) (PreH15 : (tile_wbytes = 8)) (PreH16 : (input_reset = (xt_neon_input_reset (G)))) (PreH17 : (input_offset = (xt_neon_input_offset (G)))) (PreH18 : (output_reset = (xt_neon_output_reset (G)))) (PreH19 : (0 <= k)) (PreH20 : (k <= ((xt_cols (G)) + 1 ))) (PreH21 : ((k % ( 2 ) ) = 0)) (PreH22 : (block_width = (xt_doz ((xt_cols (G))) (k)))) (PreH23 : (0 < block_width)) (PreH24 : (k < (xt_cols (G)))) (PreH25 : (0 <= bh)) (PreH26 : (bh <= block_height)) (PreH27 : (((block_height - bh ) % ( 2 ) ) = 0)) (PreH28 : (i0 = (xt_current_input (G) (k) ((block_height - bh ))))) (PreH29 : (i1 = (xt_current_input (G) (k) (((block_height - bh ) + 1 ))))) (PreH30 : (o0 = (xt_current_output (G) (k) ((block_height - bh ))))) (PreH31 : (o1 = (xt_current_output (G) ((xt_neon_second (k) (block_width))) ((block_height - bh ))))) (PreH32 : (xt_progress F G old R k (xt_neon_batch (block_width)) (block_height - bh ) )) ,
  ((&(( &( "v1_0" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (0)))
  **  ((&(( &( "v1_0" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (i0) (1)))
  **  ((&(( &( "v1_1" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i1) (0)))
  **  ((&(( &( "v1_1" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (i1) (1)))
  **  ((&((retval)  # "uint32x2_t" ->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (0)))
  **  ((&((retval)  # "uint32x2_t" ->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (i1) (0)))
  **  (UndefStructPreduint32x2_t ( &( "v0_0_low" ) ) )
  **  (xt_data F )
  **  (xt_output W R )
|--
  “ (bh >= 2) ” 
  &&  “ (xt_valid F W G ) ” 
  &&  “ (input = (xt_input (G))) ” 
  &&  “ (output = (xt_output_base (G))) ” 
  &&  “ (input_stride = (xt_input_stride (G))) ” 
  &&  “ (output_stride = (xt_output_stride (G))) ” 
  &&  “ (block_height = (xt_height (G))) ” 
  &&  “ (0 < block_height) ” 
  &&  “ (sizeof(UINT) = 4) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (tile_height = 2) ” 
  &&  “ (tile_width = 2) ” 
  &&  “ (tile_hbytes = 8) ” 
  &&  “ (tile_wbytes = 8) ” 
  &&  “ (input_reset = (xt_neon_input_reset (G))) ” 
  &&  “ (input_offset = (xt_neon_input_offset (G))) ” 
  &&  “ (output_reset = (xt_neon_output_reset (G))) ” 
  &&  “ (0 <= k) ” 
  &&  “ (k <= ((xt_cols (G)) + 1 )) ” 
  &&  “ ((k % ( 2 ) ) = 0) ” 
  &&  “ (block_width = (xt_doz ((xt_cols (G))) (k))) ” 
  &&  “ (0 < block_width) ” 
  &&  “ (k < (xt_cols (G))) ” 
  &&  “ (0 <= bh) ” 
  &&  “ (bh <= block_height) ” 
  &&  “ (((block_height - bh ) % ( 2 ) ) = 0) ” 
  &&  “ (i0 = (xt_current_input (G) (k) ((block_height - bh )))) ” 
  &&  “ (i1 = (xt_current_input (G) (k) (((block_height - bh ) + 1 )))) ” 
  &&  “ (o0 = (xt_current_output (G) (k) ((block_height - bh )))) ” 
  &&  “ (o1 = (xt_current_output (G) ((xt_neon_second (k) (block_width))) ((block_height - bh )))) ” 
  &&  “ (xt_progress F G old R k (xt_neon_batch (block_width)) (block_height - bh ) ) ”
  &&  ((&(( &( "v0_0_low" ) )->ₛ "s1")) # UInt  |->_)
  **  ((&((retval)  # "uint32x2_t" ->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (i1) (0)))
  **  ((&(( &( "v0_0_low" ) )->ₛ "s0")) # UInt  |->_)
  **  ((&((retval)  # "uint32x2_t" ->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (0)))
  **  ((&(( &( "v1_0" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (0)))
  **  ((&(( &( "v1_0" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (i0) (1)))
  **  ((&(( &( "v1_1" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i1) (0)))
  **  ((&(( &( "v1_1" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (i1) (1)))
  **  (xt_data F )
  **  (xt_output W R )
.

Definition test_neon_partial_solve_wit_46 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (R: XTOutput) (o1: Z) (o0: Z) (i1: Z) (i0: Z) (bh: Z) (block_width: Z) (k: Z) (output_reset: Z) (input_offset: Z) (input_reset: Z) (tile_wbytes: Z) (tile_hbytes: Z) (tile_width: Z) (tile_height: Z) (block_height: Z) (output_stride: Z) (input_stride: Z) (output: Z) (input: Z) (PreH1 : (bh >= 2)) (PreH2 : (xt_valid F W G )) (PreH3 : (input = (xt_input (G)))) (PreH4 : (output = (xt_output_base (G)))) (PreH5 : (input_stride = (xt_input_stride (G)))) (PreH6 : (output_stride = (xt_output_stride (G)))) (PreH7 : (block_height = (xt_height (G)))) (PreH8 : (0 < block_height)) (PreH9 : (sizeof(UINT) = 4)) (PreH10 : (sizeof(UINT64) = 8)) (PreH11 : (sizeof(UINT64) = 8)) (PreH12 : (tile_height = 2)) (PreH13 : (tile_width = 2)) (PreH14 : (tile_hbytes = 8)) (PreH15 : (tile_wbytes = 8)) (PreH16 : (input_reset = (xt_neon_input_reset (G)))) (PreH17 : (input_offset = (xt_neon_input_offset (G)))) (PreH18 : (output_reset = (xt_neon_output_reset (G)))) (PreH19 : (0 <= k)) (PreH20 : (k <= ((xt_cols (G)) + 1 ))) (PreH21 : ((k % ( 2 ) ) = 0)) (PreH22 : (block_width = (xt_doz ((xt_cols (G))) (k)))) (PreH23 : (0 < block_width)) (PreH24 : (k < (xt_cols (G)))) (PreH25 : (0 <= bh)) (PreH26 : (bh <= block_height)) (PreH27 : (((block_height - bh ) % ( 2 ) ) = 0)) (PreH28 : (i0 = (xt_current_input (G) (k) ((block_height - bh ))))) (PreH29 : (i1 = (xt_current_input (G) (k) (((block_height - bh ) + 1 ))))) (PreH30 : (o0 = (xt_current_output (G) (k) ((block_height - bh ))))) (PreH31 : (o1 = (xt_current_output (G) ((xt_neon_second (k) (block_width))) ((block_height - bh ))))) (PreH32 : (xt_progress F G old R k (xt_neon_batch (block_width)) (block_height - bh ) )) ,
  (UndefStructPreduint32x2_t ( &( "v0_0_high" ) ) )
  **  ((&(( &( "v0_0_low" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (i1) (0)))
  **  ((&(( &( "v0_0_low" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (0)))
  **  ((&(( &( "v1_0" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (0)))
  **  ((&(( &( "v1_0" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (i0) (1)))
  **  ((&(( &( "v1_1" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i1) (0)))
  **  ((&(( &( "v1_1" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (i1) (1)))
  **  (xt_data F )
  **  (xt_output W R )
|--
  “ (bh >= 2) ” 
  &&  “ (xt_valid F W G ) ” 
  &&  “ (input = (xt_input (G))) ” 
  &&  “ (output = (xt_output_base (G))) ” 
  &&  “ (input_stride = (xt_input_stride (G))) ” 
  &&  “ (output_stride = (xt_output_stride (G))) ” 
  &&  “ (block_height = (xt_height (G))) ” 
  &&  “ (0 < block_height) ” 
  &&  “ (sizeof(UINT) = 4) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (tile_height = 2) ” 
  &&  “ (tile_width = 2) ” 
  &&  “ (tile_hbytes = 8) ” 
  &&  “ (tile_wbytes = 8) ” 
  &&  “ (input_reset = (xt_neon_input_reset (G))) ” 
  &&  “ (input_offset = (xt_neon_input_offset (G))) ” 
  &&  “ (output_reset = (xt_neon_output_reset (G))) ” 
  &&  “ (0 <= k) ” 
  &&  “ (k <= ((xt_cols (G)) + 1 )) ” 
  &&  “ ((k % ( 2 ) ) = 0) ” 
  &&  “ (block_width = (xt_doz ((xt_cols (G))) (k))) ” 
  &&  “ (0 < block_width) ” 
  &&  “ (k < (xt_cols (G))) ” 
  &&  “ (0 <= bh) ” 
  &&  “ (bh <= block_height) ” 
  &&  “ (((block_height - bh ) % ( 2 ) ) = 0) ” 
  &&  “ (i0 = (xt_current_input (G) (k) ((block_height - bh )))) ” 
  &&  “ (i1 = (xt_current_input (G) (k) (((block_height - bh ) + 1 )))) ” 
  &&  “ (o0 = (xt_current_output (G) (k) ((block_height - bh )))) ” 
  &&  “ (o1 = (xt_current_output (G) ((xt_neon_second (k) (block_width))) ((block_height - bh )))) ” 
  &&  “ (xt_progress F G old R k (xt_neon_batch (block_width)) (block_height - bh ) ) ”
  &&  ((&(( &( "v1_0" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (0)))
  **  ((&(( &( "v1_0" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (i0) (1)))
  **  ((&(( &( "v1_1" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i1) (0)))
  **  ((&(( &( "v1_1" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (i1) (1)))
  **  (UndefStructPreduint32x2_t ( &( "v0_0_high" ) ) )
  **  ((&(( &( "v0_0_low" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (i1) (0)))
  **  ((&(( &( "v0_0_low" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (0)))
  **  (xt_data F )
  **  (xt_output W R )
.

Definition test_neon_partial_solve_wit_47 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (R: XTOutput) (o1: Z) (o0: Z) (i1: Z) (i0: Z) (bh: Z) (block_width: Z) (k: Z) (output_reset: Z) (input_offset: Z) (input_reset: Z) (tile_wbytes: Z) (tile_hbytes: Z) (tile_width: Z) (tile_height: Z) (block_height: Z) (output_stride: Z) (input_stride: Z) (output: Z) (input: Z) (retval: Z) (PreH1 : (bh >= 2)) (PreH2 : (xt_valid F W G )) (PreH3 : (input = (xt_input (G)))) (PreH4 : (output = (xt_output_base (G)))) (PreH5 : (input_stride = (xt_input_stride (G)))) (PreH6 : (output_stride = (xt_output_stride (G)))) (PreH7 : (block_height = (xt_height (G)))) (PreH8 : (0 < block_height)) (PreH9 : (sizeof(UINT) = 4)) (PreH10 : (sizeof(UINT64) = 8)) (PreH11 : (sizeof(UINT64) = 8)) (PreH12 : (tile_height = 2)) (PreH13 : (tile_width = 2)) (PreH14 : (tile_hbytes = 8)) (PreH15 : (tile_wbytes = 8)) (PreH16 : (input_reset = (xt_neon_input_reset (G)))) (PreH17 : (input_offset = (xt_neon_input_offset (G)))) (PreH18 : (output_reset = (xt_neon_output_reset (G)))) (PreH19 : (0 <= k)) (PreH20 : (k <= ((xt_cols (G)) + 1 ))) (PreH21 : ((k % ( 2 ) ) = 0)) (PreH22 : (block_width = (xt_doz ((xt_cols (G))) (k)))) (PreH23 : (0 < block_width)) (PreH24 : (k < (xt_cols (G)))) (PreH25 : (0 <= bh)) (PreH26 : (bh <= block_height)) (PreH27 : (((block_height - bh ) % ( 2 ) ) = 0)) (PreH28 : (i0 = (xt_current_input (G) (k) ((block_height - bh ))))) (PreH29 : (i1 = (xt_current_input (G) (k) (((block_height - bh ) + 1 ))))) (PreH30 : (o0 = (xt_current_output (G) (k) ((block_height - bh ))))) (PreH31 : (o1 = (xt_current_output (G) ((xt_neon_second (k) (block_width))) ((block_height - bh ))))) (PreH32 : (xt_progress F G old R k (xt_neon_batch (block_width)) (block_height - bh ) )) ,
  ((&(( &( "v1_0" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (0)))
  **  ((&(( &( "v1_0" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (i0) (1)))
  **  ((&(( &( "v1_1" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i1) (0)))
  **  ((&(( &( "v1_1" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (i1) (1)))
  **  ((&((retval)  # "uint32x2_t" ->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (1)))
  **  ((&((retval)  # "uint32x2_t" ->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (i1) (1)))
  **  (UndefStructPreduint32x2_t ( &( "v0_0_high" ) ) )
  **  ((&(( &( "v0_0_low" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (i1) (0)))
  **  ((&(( &( "v0_0_low" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (0)))
  **  (xt_data F )
  **  (xt_output W R )
|--
  “ (bh >= 2) ” 
  &&  “ (xt_valid F W G ) ” 
  &&  “ (input = (xt_input (G))) ” 
  &&  “ (output = (xt_output_base (G))) ” 
  &&  “ (input_stride = (xt_input_stride (G))) ” 
  &&  “ (output_stride = (xt_output_stride (G))) ” 
  &&  “ (block_height = (xt_height (G))) ” 
  &&  “ (0 < block_height) ” 
  &&  “ (sizeof(UINT) = 4) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (tile_height = 2) ” 
  &&  “ (tile_width = 2) ” 
  &&  “ (tile_hbytes = 8) ” 
  &&  “ (tile_wbytes = 8) ” 
  &&  “ (input_reset = (xt_neon_input_reset (G))) ” 
  &&  “ (input_offset = (xt_neon_input_offset (G))) ” 
  &&  “ (output_reset = (xt_neon_output_reset (G))) ” 
  &&  “ (0 <= k) ” 
  &&  “ (k <= ((xt_cols (G)) + 1 )) ” 
  &&  “ ((k % ( 2 ) ) = 0) ” 
  &&  “ (block_width = (xt_doz ((xt_cols (G))) (k))) ” 
  &&  “ (0 < block_width) ” 
  &&  “ (k < (xt_cols (G))) ” 
  &&  “ (0 <= bh) ” 
  &&  “ (bh <= block_height) ” 
  &&  “ (((block_height - bh ) % ( 2 ) ) = 0) ” 
  &&  “ (i0 = (xt_current_input (G) (k) ((block_height - bh )))) ” 
  &&  “ (i1 = (xt_current_input (G) (k) (((block_height - bh ) + 1 )))) ” 
  &&  “ (o0 = (xt_current_output (G) (k) ((block_height - bh )))) ” 
  &&  “ (o1 = (xt_current_output (G) ((xt_neon_second (k) (block_width))) ((block_height - bh )))) ” 
  &&  “ (xt_progress F G old R k (xt_neon_batch (block_width)) (block_height - bh ) ) ”
  &&  ((&(( &( "v0_0_high" ) )->ₛ "s1")) # UInt  |->_)
  **  ((&((retval)  # "uint32x2_t" ->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (i1) (1)))
  **  ((&(( &( "v0_0_high" ) )->ₛ "s0")) # UInt  |->_)
  **  ((&((retval)  # "uint32x2_t" ->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (1)))
  **  ((&(( &( "v1_0" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (0)))
  **  ((&(( &( "v1_0" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (i0) (1)))
  **  ((&(( &( "v1_1" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i1) (0)))
  **  ((&(( &( "v1_1" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (i1) (1)))
  **  ((&(( &( "v0_0_low" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (i1) (0)))
  **  ((&(( &( "v0_0_low" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (0)))
  **  (xt_data F )
  **  (xt_output W R )
.

Definition test_neon_partial_solve_wit_48_pure := 
(
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (R: XTOutput) (o1: Z) (o0: Z) (i1: Z) (i0: Z) (bh: Z) (block_width: Z) (k: Z) (output_reset: Z) (input_offset: Z) (input_reset: Z) (tile_wbytes: Z) (tile_hbytes: Z) (tile_width: Z) (tile_height: Z) (block_height: Z) (output_stride: Z) (input_stride: Z) (output: Z) (input: Z) (PreH1 : (bh >= 2)) (PreH2 : (xt_valid F W G )) (PreH3 : (input = (xt_input (G)))) (PreH4 : (output = (xt_output_base (G)))) (PreH5 : (input_stride = (xt_input_stride (G)))) (PreH6 : (output_stride = (xt_output_stride (G)))) (PreH7 : (block_height = (xt_height (G)))) (PreH8 : (0 < block_height)) (PreH9 : (sizeof(UINT) = 4)) (PreH10 : (sizeof(UINT64) = 8)) (PreH11 : (sizeof(UINT64) = 8)) (PreH12 : (tile_height = 2)) (PreH13 : (tile_width = 2)) (PreH14 : (tile_hbytes = 8)) (PreH15 : (tile_wbytes = 8)) (PreH16 : (input_reset = (xt_neon_input_reset (G)))) (PreH17 : (input_offset = (xt_neon_input_offset (G)))) (PreH18 : (output_reset = (xt_neon_output_reset (G)))) (PreH19 : (0 <= k)) (PreH20 : (k <= ((xt_cols (G)) + 1 ))) (PreH21 : ((k % ( 2 ) ) = 0)) (PreH22 : (block_width = (xt_doz ((xt_cols (G))) (k)))) (PreH23 : (0 < block_width)) (PreH24 : (k < (xt_cols (G)))) (PreH25 : (0 <= bh)) (PreH26 : (bh <= block_height)) (PreH27 : (((block_height - bh ) % ( 2 ) ) = 0)) (PreH28 : (i0 = (xt_current_input (G) (k) ((block_height - bh ))))) (PreH29 : (i1 = (xt_current_input (G) (k) (((block_height - bh ) + 1 ))))) (PreH30 : (o0 = (xt_current_output (G) (k) ((block_height - bh ))))) (PreH31 : (o1 = (xt_current_output (G) ((xt_neon_second (k) (block_width))) ((block_height - bh ))))) (PreH32 : (xt_progress F G old R k (xt_neon_batch (block_width)) (block_height - bh ) )) ,
  ((&(( &( "v0_0_high" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (i1) (1)))
  **  ((&(( &( "v0_0_high" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (1)))
  **  ((&(( &( "v1_0" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (0)))
  **  ((&(( &( "v1_0" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (i0) (1)))
  **  ((&(( &( "v1_1" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i1) (0)))
  **  ((&(( &( "v1_1" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (i1) (1)))
  **  ((&(( &( "v0_0_low" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (i1) (0)))
  **  ((&(( &( "v0_0_low" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (0)))
  **  (xt_data F )
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  ((( &( "tile_height" ) )) # UInt64  |-> tile_height)
  **  ((( &( "tile_width" ) )) # UInt64  |-> tile_width)
  **  ((( &( "tile_hbytes" ) )) # UInt64  |-> tile_hbytes)
  **  ((( &( "tile_wbytes" ) )) # UInt64  |-> tile_wbytes)
  **  ((( &( "input_reset" ) )) # UInt64  |-> input_reset)
  **  ((( &( "input_offset" ) )) # UInt64  |-> input_offset)
  **  ((( &( "output_reset" ) )) # UInt64  |-> output_reset)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "bh" ) )) # UInt64  |-> bh)
  **  ((( &( "i0" ) )) # Ptr  |-> (unsigned_last_nbits (((unsigned_last_nbits (i0) (64)) + input_offset )) (64)))
  **  ((( &( "i1" ) )) # Ptr  |-> (unsigned_last_nbits (((unsigned_last_nbits (i1) (64)) + input_offset )) (64)))
  **  ((( &( "o0" ) )) # Ptr  |-> o0)
  **  ((( &( "o1" ) )) # Ptr  |-> o1)
  **  (xt_output W R )
|--
  “ (xt_write_window W o1 2 ) ”
) \/
(
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (R: XTOutput) (o1: Z) (o0: Z) (i1: Z) (i0: Z) (bh: Z) (block_width: Z) (k: Z) (output_reset: Z) (input_offset: Z) (input_reset: Z) (tile_wbytes: Z) (tile_hbytes: Z) (tile_width: Z) (tile_height: Z) (block_height: Z) (output_stride: Z) (input_stride: Z) (output: Z) (input: Z) (PreH1 : (bh <= UINT64_MAX)) (PreH2 : (block_width <= UINT64_MAX)) (PreH3 : (output_reset <= UINT64_MAX)) (PreH4 : (input_offset <= UINT64_MAX)) (PreH5 : (input_reset <= UINT64_MAX)) (PreH6 : (tile_wbytes <= UINT64_MAX)) (PreH7 : (tile_hbytes <= UINT64_MAX)) (PreH8 : (tile_width <= UINT64_MAX)) (PreH9 : (tile_height <= UINT64_MAX)) (PreH10 : (block_height <= UINT64_MAX)) (PreH11 : (output_stride <= UINT64_MAX)) (PreH12 : (input_stride <= UINT64_MAX)) (PreH13 : (bh >= 0)) (PreH14 : (block_width >= 0)) (PreH15 : (output_reset >= 0)) (PreH16 : (input_offset >= 0)) (PreH17 : (input_reset >= 0)) (PreH18 : (tile_wbytes >= 0)) (PreH19 : (tile_hbytes >= 0)) (PreH20 : (tile_width >= 0)) (PreH21 : (tile_height >= 0)) (PreH22 : (block_height >= 0)) (PreH23 : (output_stride >= 0)) (PreH24 : (input_stride >= 0)) (PreH25 : ((xt_load_lane (F) (i1) (0)) <= UINT_MAX)) (PreH26 : ((xt_load_lane (F) (i0) (0)) <= UINT_MAX)) (PreH27 : ((xt_load_lane (F) (i0) (1)) <= UINT_MAX)) (PreH28 : ((xt_load_lane (F) (i1) (1)) <= UINT_MAX)) (PreH29 : ((xt_load_lane (F) (i1) (0)) >= 0)) (PreH30 : ((xt_load_lane (F) (i0) (0)) >= 0)) (PreH31 : ((xt_load_lane (F) (i0) (1)) >= 0)) (PreH32 : ((xt_load_lane (F) (i1) (1)) >= 0)) (PreH33 : (bh >= 2)) (PreH34 : (xt_valid F W G )) (PreH35 : (input = (xt_input (G)))) (PreH36 : (output = (xt_output_base (G)))) (PreH37 : (input_stride = (xt_input_stride (G)))) (PreH38 : (output_stride = (xt_output_stride (G)))) (PreH39 : (block_height = (xt_height (G)))) (PreH40 : (0 < block_height)) (PreH41 : (sizeof(UINT) = 4)) (PreH42 : (sizeof(UINT64) = 8)) (PreH43 : (sizeof(UINT64) = 8)) (PreH44 : (tile_height = 2)) (PreH45 : (tile_width = 2)) (PreH46 : (tile_hbytes = 8)) (PreH47 : (tile_wbytes = 8)) (PreH48 : (input_reset = (xt_neon_input_reset (G)))) (PreH49 : (input_offset = (xt_neon_input_offset (G)))) (PreH50 : (output_reset = (xt_neon_output_reset (G)))) (PreH51 : (0 <= k)) (PreH52 : (k <= ((xt_cols (G)) + 1 ))) (PreH53 : ((k % ( 2 ) ) = 0)) (PreH54 : (block_width = (xt_doz ((xt_cols (G))) (k)))) (PreH55 : (0 < block_width)) (PreH56 : (k < (xt_cols (G)))) (PreH57 : (0 <= bh)) (PreH58 : (bh <= block_height)) (PreH59 : (((block_height - bh ) % ( 2 ) ) = 0)) (PreH60 : (i0 = (xt_current_input (G) (k) ((block_height - bh ))))) (PreH61 : (i1 = (xt_current_input (G) (k) (((block_height - bh ) + 1 ))))) (PreH62 : (o0 = (xt_current_output (G) (k) ((block_height - bh ))))) (PreH63 : (o1 = (xt_current_output (G) ((xt_neon_second (k) (block_width))) ((block_height - bh ))))) (PreH64 : (xt_progress F G old R k (xt_neon_batch (block_width)) (block_height - bh ) )) ,
  ((&(( &( "v0_0_high" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (i1) (1)))
  **  ((&(( &( "v0_0_high" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (1)))
  **  ((&(( &( "v1_0" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (0)))
  **  ((&(( &( "v1_0" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (i0) (1)))
  **  ((&(( &( "v1_1" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i1) (0)))
  **  ((&(( &( "v1_1" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (i1) (1)))
  **  ((&(( &( "v0_0_low" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (i1) (0)))
  **  ((&(( &( "v0_0_low" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (0)))
  **  (xt_data F )
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  ((( &( "tile_height" ) )) # UInt64  |-> tile_height)
  **  ((( &( "tile_width" ) )) # UInt64  |-> tile_width)
  **  ((( &( "tile_hbytes" ) )) # UInt64  |-> tile_hbytes)
  **  ((( &( "tile_wbytes" ) )) # UInt64  |-> tile_wbytes)
  **  ((( &( "input_reset" ) )) # UInt64  |-> input_reset)
  **  ((( &( "input_offset" ) )) # UInt64  |-> input_offset)
  **  ((( &( "output_reset" ) )) # UInt64  |-> output_reset)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "bh" ) )) # UInt64  |-> bh)
  **  ((( &( "i0" ) )) # Ptr  |-> (unsigned_last_nbits (((unsigned_last_nbits (i0) (64)) + input_offset )) (64)))
  **  ((( &( "i1" ) )) # Ptr  |-> (unsigned_last_nbits (((unsigned_last_nbits (i1) (64)) + input_offset )) (64)))
  **  ((( &( "o0" ) )) # Ptr  |-> o0)
  **  ((( &( "o1" ) )) # Ptr  |-> o1)
  **  (xt_output W R )
|--
  “ (xt_write_window W o1 2 ) ”
).

Definition test_neon_partial_solve_wit_48_pure_split_goal_1 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (R: XTOutput) (o1: Z) (o0: Z) (i1: Z) (i0: Z) (bh: Z) (block_width: Z) (k: Z) (output_reset: Z) (input_offset: Z) (input_reset: Z) (tile_wbytes: Z) (tile_hbytes: Z) (tile_width: Z) (tile_height: Z) (block_height: Z) (output_stride: Z) (input_stride: Z) (output: Z) (input: Z) (PreH1 : (bh <= UINT64_MAX)) (PreH2 : (block_width <= UINT64_MAX)) (PreH3 : (output_reset <= UINT64_MAX)) (PreH4 : (input_offset <= UINT64_MAX)) (PreH5 : (input_reset <= UINT64_MAX)) (PreH6 : (tile_wbytes <= UINT64_MAX)) (PreH7 : (tile_hbytes <= UINT64_MAX)) (PreH8 : (tile_width <= UINT64_MAX)) (PreH9 : (tile_height <= UINT64_MAX)) (PreH10 : (block_height <= UINT64_MAX)) (PreH11 : (output_stride <= UINT64_MAX)) (PreH12 : (input_stride <= UINT64_MAX)) (PreH13 : (bh >= 0)) (PreH14 : (block_width >= 0)) (PreH15 : (output_reset >= 0)) (PreH16 : (input_offset >= 0)) (PreH17 : (input_reset >= 0)) (PreH18 : (tile_wbytes >= 0)) (PreH19 : (tile_hbytes >= 0)) (PreH20 : (tile_width >= 0)) (PreH21 : (tile_height >= 0)) (PreH22 : (block_height >= 0)) (PreH23 : (output_stride >= 0)) (PreH24 : (input_stride >= 0)) (PreH25 : ((xt_load_lane (F) (i1) (0)) <= UINT_MAX)) (PreH26 : ((xt_load_lane (F) (i0) (0)) <= UINT_MAX)) (PreH27 : ((xt_load_lane (F) (i0) (1)) <= UINT_MAX)) (PreH28 : ((xt_load_lane (F) (i1) (1)) <= UINT_MAX)) (PreH29 : ((xt_load_lane (F) (i1) (0)) >= 0)) (PreH30 : ((xt_load_lane (F) (i0) (0)) >= 0)) (PreH31 : ((xt_load_lane (F) (i0) (1)) >= 0)) (PreH32 : ((xt_load_lane (F) (i1) (1)) >= 0)) (PreH33 : (bh >= 2)) (PreH34 : (xt_valid F W G )) (PreH35 : (input = (xt_input (G)))) (PreH36 : (output = (xt_output_base (G)))) (PreH37 : (input_stride = (xt_input_stride (G)))) (PreH38 : (output_stride = (xt_output_stride (G)))) (PreH39 : (block_height = (xt_height (G)))) (PreH40 : (0 < block_height)) (PreH41 : (sizeof(UINT) = 4)) (PreH42 : (sizeof(UINT64) = 8)) (PreH43 : (sizeof(UINT64) = 8)) (PreH44 : (tile_height = 2)) (PreH45 : (tile_width = 2)) (PreH46 : (tile_hbytes = 8)) (PreH47 : (tile_wbytes = 8)) (PreH48 : (input_reset = (xt_neon_input_reset (G)))) (PreH49 : (input_offset = (xt_neon_input_offset (G)))) (PreH50 : (output_reset = (xt_neon_output_reset (G)))) (PreH51 : (0 <= k)) (PreH52 : (k <= ((xt_cols (G)) + 1 ))) (PreH53 : ((k % ( 2 ) ) = 0)) (PreH54 : (block_width = (xt_doz ((xt_cols (G))) (k)))) (PreH55 : (0 < block_width)) (PreH56 : (k < (xt_cols (G)))) (PreH57 : (0 <= bh)) (PreH58 : (bh <= block_height)) (PreH59 : (((block_height - bh ) % ( 2 ) ) = 0)) (PreH60 : (i0 = (xt_current_input (G) (k) ((block_height - bh ))))) (PreH61 : (i1 = (xt_current_input (G) (k) (((block_height - bh ) + 1 ))))) (PreH62 : (o0 = (xt_current_output (G) (k) ((block_height - bh ))))) (PreH63 : (o1 = (xt_current_output (G) ((xt_neon_second (k) (block_width))) ((block_height - bh ))))) (PreH64 : (xt_progress F G old R k (xt_neon_batch (block_width)) (block_height - bh ) )) ,
  ((&(( &( "v0_0_high" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (i1) (1)))
  **  ((&(( &( "v0_0_high" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (1)))
  **  ((&(( &( "v1_0" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (0)))
  **  ((&(( &( "v1_0" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (i0) (1)))
  **  ((&(( &( "v1_1" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i1) (0)))
  **  ((&(( &( "v1_1" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (i1) (1)))
  **  ((&(( &( "v0_0_low" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (i1) (0)))
  **  ((&(( &( "v0_0_low" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (0)))
  **  (xt_data F )
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  ((( &( "tile_height" ) )) # UInt64  |-> tile_height)
  **  ((( &( "tile_width" ) )) # UInt64  |-> tile_width)
  **  ((( &( "tile_hbytes" ) )) # UInt64  |-> tile_hbytes)
  **  ((( &( "tile_wbytes" ) )) # UInt64  |-> tile_wbytes)
  **  ((( &( "input_reset" ) )) # UInt64  |-> input_reset)
  **  ((( &( "input_offset" ) )) # UInt64  |-> input_offset)
  **  ((( &( "output_reset" ) )) # UInt64  |-> output_reset)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "bh" ) )) # UInt64  |-> bh)
  **  ((( &( "i0" ) )) # Ptr  |-> (unsigned_last_nbits (((unsigned_last_nbits (i0) (64)) + input_offset )) (64)))
  **  ((( &( "i1" ) )) # Ptr  |-> (unsigned_last_nbits (((unsigned_last_nbits (i1) (64)) + input_offset )) (64)))
  **  ((( &( "o0" ) )) # Ptr  |-> o0)
  **  ((( &( "o1" ) )) # Ptr  |-> o1)
  **  (xt_output W R )
|--
  “ (xt_write_window W o1 2 ) ”
.

Definition test_neon_partial_solve_wit_48_aux := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (R: XTOutput) (o1: Z) (o0: Z) (i1: Z) (i0: Z) (bh: Z) (block_width: Z) (k: Z) (output_reset: Z) (input_offset: Z) (input_reset: Z) (tile_wbytes: Z) (tile_hbytes: Z) (tile_width: Z) (tile_height: Z) (block_height: Z) (output_stride: Z) (input_stride: Z) (output: Z) (input: Z) (PreH1 : (bh >= 2)) (PreH2 : (xt_valid F W G )) (PreH3 : (input = (xt_input (G)))) (PreH4 : (output = (xt_output_base (G)))) (PreH5 : (input_stride = (xt_input_stride (G)))) (PreH6 : (output_stride = (xt_output_stride (G)))) (PreH7 : (block_height = (xt_height (G)))) (PreH8 : (0 < block_height)) (PreH9 : (sizeof(UINT) = 4)) (PreH10 : (sizeof(UINT64) = 8)) (PreH11 : (sizeof(UINT64) = 8)) (PreH12 : (tile_height = 2)) (PreH13 : (tile_width = 2)) (PreH14 : (tile_hbytes = 8)) (PreH15 : (tile_wbytes = 8)) (PreH16 : (input_reset = (xt_neon_input_reset (G)))) (PreH17 : (input_offset = (xt_neon_input_offset (G)))) (PreH18 : (output_reset = (xt_neon_output_reset (G)))) (PreH19 : (0 <= k)) (PreH20 : (k <= ((xt_cols (G)) + 1 ))) (PreH21 : ((k % ( 2 ) ) = 0)) (PreH22 : (block_width = (xt_doz ((xt_cols (G))) (k)))) (PreH23 : (0 < block_width)) (PreH24 : (k < (xt_cols (G)))) (PreH25 : (0 <= bh)) (PreH26 : (bh <= block_height)) (PreH27 : (((block_height - bh ) % ( 2 ) ) = 0)) (PreH28 : (i0 = (xt_current_input (G) (k) ((block_height - bh ))))) (PreH29 : (i1 = (xt_current_input (G) (k) (((block_height - bh ) + 1 ))))) (PreH30 : (o0 = (xt_current_output (G) (k) ((block_height - bh ))))) (PreH31 : (o1 = (xt_current_output (G) ((xt_neon_second (k) (block_width))) ((block_height - bh ))))) (PreH32 : (xt_progress F G old R k (xt_neon_batch (block_width)) (block_height - bh ) )) ,
  ((&(( &( "v0_0_high" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (i1) (1)))
  **  ((&(( &( "v0_0_high" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (1)))
  **  ((&(( &( "v1_0" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (0)))
  **  ((&(( &( "v1_0" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (i0) (1)))
  **  ((&(( &( "v1_1" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i1) (0)))
  **  ((&(( &( "v1_1" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (i1) (1)))
  **  ((&(( &( "v0_0_low" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (i1) (0)))
  **  ((&(( &( "v0_0_low" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (0)))
  **  (xt_data F )
  **  (xt_output W R )
|--
  “ (xt_write_window W o1 2 ) ” 
  &&  “ (bh >= 2) ” 
  &&  “ (xt_valid F W G ) ” 
  &&  “ (input = (xt_input (G))) ” 
  &&  “ (output = (xt_output_base (G))) ” 
  &&  “ (input_stride = (xt_input_stride (G))) ” 
  &&  “ (output_stride = (xt_output_stride (G))) ” 
  &&  “ (block_height = (xt_height (G))) ” 
  &&  “ (0 < block_height) ” 
  &&  “ (sizeof(UINT) = 4) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (tile_height = 2) ” 
  &&  “ (tile_width = 2) ” 
  &&  “ (tile_hbytes = 8) ” 
  &&  “ (tile_wbytes = 8) ” 
  &&  “ (input_reset = (xt_neon_input_reset (G))) ” 
  &&  “ (input_offset = (xt_neon_input_offset (G))) ” 
  &&  “ (output_reset = (xt_neon_output_reset (G))) ” 
  &&  “ (0 <= k) ” 
  &&  “ (k <= ((xt_cols (G)) + 1 )) ” 
  &&  “ ((k % ( 2 ) ) = 0) ” 
  &&  “ (block_width = (xt_doz ((xt_cols (G))) (k))) ” 
  &&  “ (0 < block_width) ” 
  &&  “ (k < (xt_cols (G))) ” 
  &&  “ (0 <= bh) ” 
  &&  “ (bh <= block_height) ” 
  &&  “ (((block_height - bh ) % ( 2 ) ) = 0) ” 
  &&  “ (i0 = (xt_current_input (G) (k) ((block_height - bh )))) ” 
  &&  “ (i1 = (xt_current_input (G) (k) (((block_height - bh ) + 1 )))) ” 
  &&  “ (o0 = (xt_current_output (G) (k) ((block_height - bh )))) ” 
  &&  “ (o1 = (xt_current_output (G) ((xt_neon_second (k) (block_width))) ((block_height - bh )))) ” 
  &&  “ (xt_progress F G old R k (xt_neon_batch (block_width)) (block_height - bh ) ) ”
  &&  (xt_output W R )
  **  ((&(( &( "v0_0_high" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (1)))
  **  ((&(( &( "v0_0_high" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (i1) (1)))
  **  ((&(( &( "v1_0" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (0)))
  **  ((&(( &( "v1_0" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (i0) (1)))
  **  ((&(( &( "v1_1" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i1) (0)))
  **  ((&(( &( "v1_1" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (i1) (1)))
  **  ((&(( &( "v0_0_low" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (i1) (0)))
  **  ((&(( &( "v0_0_low" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (0)))
  **  (xt_data F )
.

Definition test_neon_partial_solve_wit_48 := test_neon_partial_solve_wit_48_pure -> test_neon_partial_solve_wit_48_aux.

Definition test_neon_partial_solve_wit_49_pure := 
(
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (R: XTOutput) (o1: Z) (o0: Z) (i1: Z) (i0: Z) (bh: Z) (block_width: Z) (k: Z) (output_reset: Z) (input_offset: Z) (input_reset: Z) (tile_wbytes: Z) (tile_hbytes: Z) (tile_width: Z) (tile_height: Z) (block_height: Z) (output_stride: Z) (input_stride: Z) (output: Z) (input: Z) (PreH1 : (bh >= 2)) (PreH2 : (xt_valid F W G )) (PreH3 : (input = (xt_input (G)))) (PreH4 : (output = (xt_output_base (G)))) (PreH5 : (input_stride = (xt_input_stride (G)))) (PreH6 : (output_stride = (xt_output_stride (G)))) (PreH7 : (block_height = (xt_height (G)))) (PreH8 : (0 < block_height)) (PreH9 : (sizeof(UINT) = 4)) (PreH10 : (sizeof(UINT64) = 8)) (PreH11 : (sizeof(UINT64) = 8)) (PreH12 : (tile_height = 2)) (PreH13 : (tile_width = 2)) (PreH14 : (tile_hbytes = 8)) (PreH15 : (tile_wbytes = 8)) (PreH16 : (input_reset = (xt_neon_input_reset (G)))) (PreH17 : (input_offset = (xt_neon_input_offset (G)))) (PreH18 : (output_reset = (xt_neon_output_reset (G)))) (PreH19 : (0 <= k)) (PreH20 : (k <= ((xt_cols (G)) + 1 ))) (PreH21 : ((k % ( 2 ) ) = 0)) (PreH22 : (block_width = (xt_doz ((xt_cols (G))) (k)))) (PreH23 : (0 < block_width)) (PreH24 : (k < (xt_cols (G)))) (PreH25 : (0 <= bh)) (PreH26 : (bh <= block_height)) (PreH27 : (((block_height - bh ) % ( 2 ) ) = 0)) (PreH28 : (i0 = (xt_current_input (G) (k) ((block_height - bh ))))) (PreH29 : (i1 = (xt_current_input (G) (k) (((block_height - bh ) + 1 ))))) (PreH30 : (o0 = (xt_current_output (G) (k) ((block_height - bh ))))) (PreH31 : (o1 = (xt_current_output (G) ((xt_neon_second (k) (block_width))) ((block_height - bh ))))) (PreH32 : (xt_progress F G old R k (xt_neon_batch (block_width)) (block_height - bh ) )) ,
  (xt_output W (xt_write_pair (R) (o1) ((xt_load_lane (F) (i0) (1))) ((xt_load_lane (F) (i1) (1)))) )
  **  ((&(( &( "v0_0_high" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (1)))
  **  ((&(( &( "v0_0_high" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (i1) (1)))
  **  ((&(( &( "v1_0" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (0)))
  **  ((&(( &( "v1_0" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (i0) (1)))
  **  ((&(( &( "v1_1" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i1) (0)))
  **  ((&(( &( "v1_1" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (i1) (1)))
  **  ((&(( &( "v0_0_low" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (i1) (0)))
  **  ((&(( &( "v0_0_low" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (0)))
  **  (xt_data F )
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  ((( &( "tile_height" ) )) # UInt64  |-> tile_height)
  **  ((( &( "tile_width" ) )) # UInt64  |-> tile_width)
  **  ((( &( "tile_hbytes" ) )) # UInt64  |-> tile_hbytes)
  **  ((( &( "tile_wbytes" ) )) # UInt64  |-> tile_wbytes)
  **  ((( &( "input_reset" ) )) # UInt64  |-> input_reset)
  **  ((( &( "input_offset" ) )) # UInt64  |-> input_offset)
  **  ((( &( "output_reset" ) )) # UInt64  |-> output_reset)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "bh" ) )) # UInt64  |-> bh)
  **  ((( &( "i0" ) )) # Ptr  |-> (unsigned_last_nbits (((unsigned_last_nbits (i0) (64)) + input_offset )) (64)))
  **  ((( &( "i1" ) )) # Ptr  |-> (unsigned_last_nbits (((unsigned_last_nbits (i1) (64)) + input_offset )) (64)))
  **  ((( &( "o0" ) )) # Ptr  |-> o0)
  **  ((( &( "o1" ) )) # Ptr  |-> (unsigned_last_nbits (((unsigned_last_nbits (o1) (64)) + tile_hbytes )) (64)))
|--
  “ (xt_write_window W o0 2 ) ”
) \/
(
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (R: XTOutput) (o1: Z) (o0: Z) (i1: Z) (i0: Z) (bh: Z) (block_width: Z) (k: Z) (output_reset: Z) (input_offset: Z) (input_reset: Z) (tile_wbytes: Z) (tile_hbytes: Z) (tile_width: Z) (tile_height: Z) (block_height: Z) (output_stride: Z) (input_stride: Z) (output: Z) (input: Z) (PreH1 : (bh <= UINT64_MAX)) (PreH2 : (block_width <= UINT64_MAX)) (PreH3 : (output_reset <= UINT64_MAX)) (PreH4 : (input_offset <= UINT64_MAX)) (PreH5 : (input_reset <= UINT64_MAX)) (PreH6 : (tile_wbytes <= UINT64_MAX)) (PreH7 : (tile_hbytes <= UINT64_MAX)) (PreH8 : (tile_width <= UINT64_MAX)) (PreH9 : (tile_height <= UINT64_MAX)) (PreH10 : (block_height <= UINT64_MAX)) (PreH11 : (output_stride <= UINT64_MAX)) (PreH12 : (input_stride <= UINT64_MAX)) (PreH13 : (bh >= 0)) (PreH14 : (block_width >= 0)) (PreH15 : (output_reset >= 0)) (PreH16 : (input_offset >= 0)) (PreH17 : (input_reset >= 0)) (PreH18 : (tile_wbytes >= 0)) (PreH19 : (tile_hbytes >= 0)) (PreH20 : (tile_width >= 0)) (PreH21 : (tile_height >= 0)) (PreH22 : (block_height >= 0)) (PreH23 : (output_stride >= 0)) (PreH24 : (input_stride >= 0)) (PreH25 : ((xt_load_lane (F) (i1) (0)) <= UINT_MAX)) (PreH26 : ((xt_load_lane (F) (i0) (0)) <= UINT_MAX)) (PreH27 : ((xt_load_lane (F) (i1) (1)) <= UINT_MAX)) (PreH28 : ((xt_load_lane (F) (i0) (1)) <= UINT_MAX)) (PreH29 : ((xt_load_lane (F) (i1) (0)) >= 0)) (PreH30 : ((xt_load_lane (F) (i0) (0)) >= 0)) (PreH31 : ((xt_load_lane (F) (i1) (1)) >= 0)) (PreH32 : ((xt_load_lane (F) (i0) (1)) >= 0)) (PreH33 : (bh >= 2)) (PreH34 : (xt_valid F W G )) (PreH35 : (input = (xt_input (G)))) (PreH36 : (output = (xt_output_base (G)))) (PreH37 : (input_stride = (xt_input_stride (G)))) (PreH38 : (output_stride = (xt_output_stride (G)))) (PreH39 : (block_height = (xt_height (G)))) (PreH40 : (0 < block_height)) (PreH41 : (sizeof(UINT) = 4)) (PreH42 : (sizeof(UINT64) = 8)) (PreH43 : (sizeof(UINT64) = 8)) (PreH44 : (tile_height = 2)) (PreH45 : (tile_width = 2)) (PreH46 : (tile_hbytes = 8)) (PreH47 : (tile_wbytes = 8)) (PreH48 : (input_reset = (xt_neon_input_reset (G)))) (PreH49 : (input_offset = (xt_neon_input_offset (G)))) (PreH50 : (output_reset = (xt_neon_output_reset (G)))) (PreH51 : (0 <= k)) (PreH52 : (k <= ((xt_cols (G)) + 1 ))) (PreH53 : ((k % ( 2 ) ) = 0)) (PreH54 : (block_width = (xt_doz ((xt_cols (G))) (k)))) (PreH55 : (0 < block_width)) (PreH56 : (k < (xt_cols (G)))) (PreH57 : (0 <= bh)) (PreH58 : (bh <= block_height)) (PreH59 : (((block_height - bh ) % ( 2 ) ) = 0)) (PreH60 : (i0 = (xt_current_input (G) (k) ((block_height - bh ))))) (PreH61 : (i1 = (xt_current_input (G) (k) (((block_height - bh ) + 1 ))))) (PreH62 : (o0 = (xt_current_output (G) (k) ((block_height - bh ))))) (PreH63 : (o1 = (xt_current_output (G) ((xt_neon_second (k) (block_width))) ((block_height - bh ))))) (PreH64 : (xt_progress F G old R k (xt_neon_batch (block_width)) (block_height - bh ) )) ,
  (xt_output W (xt_write_pair (R) (o1) ((xt_load_lane (F) (i0) (1))) ((xt_load_lane (F) (i1) (1)))) )
  **  ((&(( &( "v0_0_high" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (1)))
  **  ((&(( &( "v0_0_high" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (i1) (1)))
  **  ((&(( &( "v1_0" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (0)))
  **  ((&(( &( "v1_0" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (i0) (1)))
  **  ((&(( &( "v1_1" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i1) (0)))
  **  ((&(( &( "v1_1" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (i1) (1)))
  **  ((&(( &( "v0_0_low" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (i1) (0)))
  **  ((&(( &( "v0_0_low" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (0)))
  **  (xt_data F )
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  ((( &( "tile_height" ) )) # UInt64  |-> tile_height)
  **  ((( &( "tile_width" ) )) # UInt64  |-> tile_width)
  **  ((( &( "tile_hbytes" ) )) # UInt64  |-> tile_hbytes)
  **  ((( &( "tile_wbytes" ) )) # UInt64  |-> tile_wbytes)
  **  ((( &( "input_reset" ) )) # UInt64  |-> input_reset)
  **  ((( &( "input_offset" ) )) # UInt64  |-> input_offset)
  **  ((( &( "output_reset" ) )) # UInt64  |-> output_reset)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "bh" ) )) # UInt64  |-> bh)
  **  ((( &( "i0" ) )) # Ptr  |-> (unsigned_last_nbits (((unsigned_last_nbits (i0) (64)) + input_offset )) (64)))
  **  ((( &( "i1" ) )) # Ptr  |-> (unsigned_last_nbits (((unsigned_last_nbits (i1) (64)) + input_offset )) (64)))
  **  ((( &( "o0" ) )) # Ptr  |-> o0)
  **  ((( &( "o1" ) )) # Ptr  |-> (unsigned_last_nbits (((unsigned_last_nbits (o1) (64)) + tile_hbytes )) (64)))
|--
  “ (xt_write_window W o0 2 ) ”
).

Definition test_neon_partial_solve_wit_49_pure_split_goal_1 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (R: XTOutput) (o1: Z) (o0: Z) (i1: Z) (i0: Z) (bh: Z) (block_width: Z) (k: Z) (output_reset: Z) (input_offset: Z) (input_reset: Z) (tile_wbytes: Z) (tile_hbytes: Z) (tile_width: Z) (tile_height: Z) (block_height: Z) (output_stride: Z) (input_stride: Z) (output: Z) (input: Z) (PreH1 : (bh <= UINT64_MAX)) (PreH2 : (block_width <= UINT64_MAX)) (PreH3 : (output_reset <= UINT64_MAX)) (PreH4 : (input_offset <= UINT64_MAX)) (PreH5 : (input_reset <= UINT64_MAX)) (PreH6 : (tile_wbytes <= UINT64_MAX)) (PreH7 : (tile_hbytes <= UINT64_MAX)) (PreH8 : (tile_width <= UINT64_MAX)) (PreH9 : (tile_height <= UINT64_MAX)) (PreH10 : (block_height <= UINT64_MAX)) (PreH11 : (output_stride <= UINT64_MAX)) (PreH12 : (input_stride <= UINT64_MAX)) (PreH13 : (bh >= 0)) (PreH14 : (block_width >= 0)) (PreH15 : (output_reset >= 0)) (PreH16 : (input_offset >= 0)) (PreH17 : (input_reset >= 0)) (PreH18 : (tile_wbytes >= 0)) (PreH19 : (tile_hbytes >= 0)) (PreH20 : (tile_width >= 0)) (PreH21 : (tile_height >= 0)) (PreH22 : (block_height >= 0)) (PreH23 : (output_stride >= 0)) (PreH24 : (input_stride >= 0)) (PreH25 : ((xt_load_lane (F) (i1) (0)) <= UINT_MAX)) (PreH26 : ((xt_load_lane (F) (i0) (0)) <= UINT_MAX)) (PreH27 : ((xt_load_lane (F) (i1) (1)) <= UINT_MAX)) (PreH28 : ((xt_load_lane (F) (i0) (1)) <= UINT_MAX)) (PreH29 : ((xt_load_lane (F) (i1) (0)) >= 0)) (PreH30 : ((xt_load_lane (F) (i0) (0)) >= 0)) (PreH31 : ((xt_load_lane (F) (i1) (1)) >= 0)) (PreH32 : ((xt_load_lane (F) (i0) (1)) >= 0)) (PreH33 : (bh >= 2)) (PreH34 : (xt_valid F W G )) (PreH35 : (input = (xt_input (G)))) (PreH36 : (output = (xt_output_base (G)))) (PreH37 : (input_stride = (xt_input_stride (G)))) (PreH38 : (output_stride = (xt_output_stride (G)))) (PreH39 : (block_height = (xt_height (G)))) (PreH40 : (0 < block_height)) (PreH41 : (sizeof(UINT) = 4)) (PreH42 : (sizeof(UINT64) = 8)) (PreH43 : (sizeof(UINT64) = 8)) (PreH44 : (tile_height = 2)) (PreH45 : (tile_width = 2)) (PreH46 : (tile_hbytes = 8)) (PreH47 : (tile_wbytes = 8)) (PreH48 : (input_reset = (xt_neon_input_reset (G)))) (PreH49 : (input_offset = (xt_neon_input_offset (G)))) (PreH50 : (output_reset = (xt_neon_output_reset (G)))) (PreH51 : (0 <= k)) (PreH52 : (k <= ((xt_cols (G)) + 1 ))) (PreH53 : ((k % ( 2 ) ) = 0)) (PreH54 : (block_width = (xt_doz ((xt_cols (G))) (k)))) (PreH55 : (0 < block_width)) (PreH56 : (k < (xt_cols (G)))) (PreH57 : (0 <= bh)) (PreH58 : (bh <= block_height)) (PreH59 : (((block_height - bh ) % ( 2 ) ) = 0)) (PreH60 : (i0 = (xt_current_input (G) (k) ((block_height - bh ))))) (PreH61 : (i1 = (xt_current_input (G) (k) (((block_height - bh ) + 1 ))))) (PreH62 : (o0 = (xt_current_output (G) (k) ((block_height - bh ))))) (PreH63 : (o1 = (xt_current_output (G) ((xt_neon_second (k) (block_width))) ((block_height - bh ))))) (PreH64 : (xt_progress F G old R k (xt_neon_batch (block_width)) (block_height - bh ) )) ,
  (xt_output W (xt_write_pair (R) (o1) ((xt_load_lane (F) (i0) (1))) ((xt_load_lane (F) (i1) (1)))) )
  **  ((&(( &( "v0_0_high" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (1)))
  **  ((&(( &( "v0_0_high" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (i1) (1)))
  **  ((&(( &( "v1_0" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (0)))
  **  ((&(( &( "v1_0" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (i0) (1)))
  **  ((&(( &( "v1_1" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i1) (0)))
  **  ((&(( &( "v1_1" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (i1) (1)))
  **  ((&(( &( "v0_0_low" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (i1) (0)))
  **  ((&(( &( "v0_0_low" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (0)))
  **  (xt_data F )
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  ((( &( "tile_height" ) )) # UInt64  |-> tile_height)
  **  ((( &( "tile_width" ) )) # UInt64  |-> tile_width)
  **  ((( &( "tile_hbytes" ) )) # UInt64  |-> tile_hbytes)
  **  ((( &( "tile_wbytes" ) )) # UInt64  |-> tile_wbytes)
  **  ((( &( "input_reset" ) )) # UInt64  |-> input_reset)
  **  ((( &( "input_offset" ) )) # UInt64  |-> input_offset)
  **  ((( &( "output_reset" ) )) # UInt64  |-> output_reset)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "bh" ) )) # UInt64  |-> bh)
  **  ((( &( "i0" ) )) # Ptr  |-> (unsigned_last_nbits (((unsigned_last_nbits (i0) (64)) + input_offset )) (64)))
  **  ((( &( "i1" ) )) # Ptr  |-> (unsigned_last_nbits (((unsigned_last_nbits (i1) (64)) + input_offset )) (64)))
  **  ((( &( "o0" ) )) # Ptr  |-> o0)
  **  ((( &( "o1" ) )) # Ptr  |-> (unsigned_last_nbits (((unsigned_last_nbits (o1) (64)) + tile_hbytes )) (64)))
|--
  “ (xt_write_window W o0 2 ) ”
.

Definition test_neon_partial_solve_wit_49_aux := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (R: XTOutput) (o1: Z) (o0: Z) (i1: Z) (i0: Z) (bh: Z) (block_width: Z) (k: Z) (output_reset: Z) (input_offset: Z) (input_reset: Z) (tile_wbytes: Z) (tile_hbytes: Z) (tile_width: Z) (tile_height: Z) (block_height: Z) (output_stride: Z) (input_stride: Z) (output: Z) (input: Z) (PreH1 : (bh >= 2)) (PreH2 : (xt_valid F W G )) (PreH3 : (input = (xt_input (G)))) (PreH4 : (output = (xt_output_base (G)))) (PreH5 : (input_stride = (xt_input_stride (G)))) (PreH6 : (output_stride = (xt_output_stride (G)))) (PreH7 : (block_height = (xt_height (G)))) (PreH8 : (0 < block_height)) (PreH9 : (sizeof(UINT) = 4)) (PreH10 : (sizeof(UINT64) = 8)) (PreH11 : (sizeof(UINT64) = 8)) (PreH12 : (tile_height = 2)) (PreH13 : (tile_width = 2)) (PreH14 : (tile_hbytes = 8)) (PreH15 : (tile_wbytes = 8)) (PreH16 : (input_reset = (xt_neon_input_reset (G)))) (PreH17 : (input_offset = (xt_neon_input_offset (G)))) (PreH18 : (output_reset = (xt_neon_output_reset (G)))) (PreH19 : (0 <= k)) (PreH20 : (k <= ((xt_cols (G)) + 1 ))) (PreH21 : ((k % ( 2 ) ) = 0)) (PreH22 : (block_width = (xt_doz ((xt_cols (G))) (k)))) (PreH23 : (0 < block_width)) (PreH24 : (k < (xt_cols (G)))) (PreH25 : (0 <= bh)) (PreH26 : (bh <= block_height)) (PreH27 : (((block_height - bh ) % ( 2 ) ) = 0)) (PreH28 : (i0 = (xt_current_input (G) (k) ((block_height - bh ))))) (PreH29 : (i1 = (xt_current_input (G) (k) (((block_height - bh ) + 1 ))))) (PreH30 : (o0 = (xt_current_output (G) (k) ((block_height - bh ))))) (PreH31 : (o1 = (xt_current_output (G) ((xt_neon_second (k) (block_width))) ((block_height - bh ))))) (PreH32 : (xt_progress F G old R k (xt_neon_batch (block_width)) (block_height - bh ) )) ,
  (xt_output W (xt_write_pair (R) (o1) ((xt_load_lane (F) (i0) (1))) ((xt_load_lane (F) (i1) (1)))) )
  **  ((&(( &( "v0_0_high" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (1)))
  **  ((&(( &( "v0_0_high" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (i1) (1)))
  **  ((&(( &( "v1_0" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (0)))
  **  ((&(( &( "v1_0" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (i0) (1)))
  **  ((&(( &( "v1_1" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i1) (0)))
  **  ((&(( &( "v1_1" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (i1) (1)))
  **  ((&(( &( "v0_0_low" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (i1) (0)))
  **  ((&(( &( "v0_0_low" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (0)))
  **  (xt_data F )
|--
  “ (xt_write_window W o0 2 ) ” 
  &&  “ (bh >= 2) ” 
  &&  “ (xt_valid F W G ) ” 
  &&  “ (input = (xt_input (G))) ” 
  &&  “ (output = (xt_output_base (G))) ” 
  &&  “ (input_stride = (xt_input_stride (G))) ” 
  &&  “ (output_stride = (xt_output_stride (G))) ” 
  &&  “ (block_height = (xt_height (G))) ” 
  &&  “ (0 < block_height) ” 
  &&  “ (sizeof(UINT) = 4) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (tile_height = 2) ” 
  &&  “ (tile_width = 2) ” 
  &&  “ (tile_hbytes = 8) ” 
  &&  “ (tile_wbytes = 8) ” 
  &&  “ (input_reset = (xt_neon_input_reset (G))) ” 
  &&  “ (input_offset = (xt_neon_input_offset (G))) ” 
  &&  “ (output_reset = (xt_neon_output_reset (G))) ” 
  &&  “ (0 <= k) ” 
  &&  “ (k <= ((xt_cols (G)) + 1 )) ” 
  &&  “ ((k % ( 2 ) ) = 0) ” 
  &&  “ (block_width = (xt_doz ((xt_cols (G))) (k))) ” 
  &&  “ (0 < block_width) ” 
  &&  “ (k < (xt_cols (G))) ” 
  &&  “ (0 <= bh) ” 
  &&  “ (bh <= block_height) ” 
  &&  “ (((block_height - bh ) % ( 2 ) ) = 0) ” 
  &&  “ (i0 = (xt_current_input (G) (k) ((block_height - bh )))) ” 
  &&  “ (i1 = (xt_current_input (G) (k) (((block_height - bh ) + 1 )))) ” 
  &&  “ (o0 = (xt_current_output (G) (k) ((block_height - bh )))) ” 
  &&  “ (o1 = (xt_current_output (G) ((xt_neon_second (k) (block_width))) ((block_height - bh )))) ” 
  &&  “ (xt_progress F G old R k (xt_neon_batch (block_width)) (block_height - bh ) ) ”
  &&  (xt_output W (xt_write_pair (R) ((xt_current_output (G) ((xt_neon_second (k) (block_width))) ((block_height - bh )))) ((xt_load_lane (F) ((xt_current_input (G) (k) ((block_height - bh )))) (1))) ((xt_load_lane (F) ((xt_current_input (G) (k) (((block_height - bh ) + 1 )))) (1)))) )
  **  ((&(( &( "v0_0_low" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (0)))
  **  ((&(( &( "v0_0_low" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (i1) (0)))
  **  ((&(( &( "v0_0_high" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (1)))
  **  ((&(( &( "v0_0_high" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (i1) (1)))
  **  ((&(( &( "v1_0" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (0)))
  **  ((&(( &( "v1_0" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (i0) (1)))
  **  ((&(( &( "v1_1" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i1) (0)))
  **  ((&(( &( "v1_1" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (i1) (1)))
  **  (xt_data F )
.

Definition test_neon_partial_solve_wit_49 := test_neon_partial_solve_wit_49_pure -> test_neon_partial_solve_wit_49_aux.

Definition test_neon_partial_solve_wit_50_pure := 
(
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (R: XTOutput) (o1: Z) (o0: Z) (i1: Z) (i0: Z) (bh: Z) (block_width: Z) (k: Z) (output_reset: Z) (input_offset: Z) (input_reset: Z) (tile_wbytes: Z) (tile_hbytes: Z) (tile_width: Z) (tile_height: Z) (block_height: Z) (output_stride: Z) (input_stride: Z) (output: Z) (input: Z) (PreH1 : (bh <> 0)) (PreH2 : (bh < 2)) (PreH3 : (xt_valid F W G )) (PreH4 : (input = (xt_input (G)))) (PreH5 : (output = (xt_output_base (G)))) (PreH6 : (input_stride = (xt_input_stride (G)))) (PreH7 : (output_stride = (xt_output_stride (G)))) (PreH8 : (block_height = (xt_height (G)))) (PreH9 : (0 < block_height)) (PreH10 : (sizeof(UINT) = 4)) (PreH11 : (sizeof(UINT64) = 8)) (PreH12 : (sizeof(UINT64) = 8)) (PreH13 : (tile_height = 2)) (PreH14 : (tile_width = 2)) (PreH15 : (tile_hbytes = 8)) (PreH16 : (tile_wbytes = 8)) (PreH17 : (input_reset = (xt_neon_input_reset (G)))) (PreH18 : (input_offset = (xt_neon_input_offset (G)))) (PreH19 : (output_reset = (xt_neon_output_reset (G)))) (PreH20 : (0 <= k)) (PreH21 : (k <= ((xt_cols (G)) + 1 ))) (PreH22 : ((k % ( 2 ) ) = 0)) (PreH23 : (block_width = (xt_doz ((xt_cols (G))) (k)))) (PreH24 : (0 < block_width)) (PreH25 : (k < (xt_cols (G)))) (PreH26 : (0 <= bh)) (PreH27 : (bh <= block_height)) (PreH28 : (((block_height - bh ) % ( 2 ) ) = 0)) (PreH29 : (i0 = (xt_current_input (G) (k) ((block_height - bh ))))) (PreH30 : (i1 = (xt_current_input (G) (k) (((block_height - bh ) + 1 ))))) (PreH31 : (o0 = (xt_current_output (G) (k) ((block_height - bh ))))) (PreH32 : (o1 = (xt_current_output (G) ((xt_neon_second (k) (block_width))) ((block_height - bh ))))) (PreH33 : (xt_progress F G old R k (xt_neon_batch (block_width)) (block_height - bh ) )) ,
  (UndefStructPreduint32x2_t ( &( "v1_0" ) ) )
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  ((( &( "tile_height" ) )) # UInt64  |-> tile_height)
  **  ((( &( "tile_width" ) )) # UInt64  |-> tile_width)
  **  ((( &( "tile_hbytes" ) )) # UInt64  |-> tile_hbytes)
  **  ((( &( "tile_wbytes" ) )) # UInt64  |-> tile_wbytes)
  **  ((( &( "input_reset" ) )) # UInt64  |-> input_reset)
  **  ((( &( "input_offset" ) )) # UInt64  |-> input_offset)
  **  ((( &( "output_reset" ) )) # UInt64  |-> output_reset)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "bh" ) )) # UInt64  |-> bh)
  **  ((( &( "i0" ) )) # Ptr  |-> i0)
  **  ((( &( "i1" ) )) # Ptr  |-> i1)
  **  ((( &( "o0" ) )) # Ptr  |-> o0)
  **  ((( &( "o1" ) )) # Ptr  |-> o1)
  **  (xt_data F )
  **  (xt_output W R )
|--
  “ (xt_window F i0 2 ) ”
) \/
(
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (R: XTOutput) (o1: Z) (o0: Z) (i1: Z) (i0: Z) (bh: Z) (block_width: Z) (k: Z) (output_reset: Z) (input_offset: Z) (input_reset: Z) (tile_wbytes: Z) (tile_hbytes: Z) (tile_width: Z) (tile_height: Z) (block_height: Z) (output_stride: Z) (input_stride: Z) (output: Z) (input: Z) (PreH1 : (bh <= UINT64_MAX)) (PreH2 : (block_width <= UINT64_MAX)) (PreH3 : (output_reset <= UINT64_MAX)) (PreH4 : (input_offset <= UINT64_MAX)) (PreH5 : (input_reset <= UINT64_MAX)) (PreH6 : (tile_wbytes <= UINT64_MAX)) (PreH7 : (tile_hbytes <= UINT64_MAX)) (PreH8 : (tile_width <= UINT64_MAX)) (PreH9 : (tile_height <= UINT64_MAX)) (PreH10 : (block_height <= UINT64_MAX)) (PreH11 : (output_stride <= UINT64_MAX)) (PreH12 : (input_stride <= UINT64_MAX)) (PreH13 : (bh >= 0)) (PreH14 : (block_width >= 0)) (PreH15 : (output_reset >= 0)) (PreH16 : (input_offset >= 0)) (PreH17 : (input_reset >= 0)) (PreH18 : (tile_wbytes >= 0)) (PreH19 : (tile_hbytes >= 0)) (PreH20 : (tile_width >= 0)) (PreH21 : (tile_height >= 0)) (PreH22 : (block_height >= 0)) (PreH23 : (output_stride >= 0)) (PreH24 : (input_stride >= 0)) (PreH25 : (bh <> 0)) (PreH26 : (bh < 2)) (PreH27 : (xt_valid F W G )) (PreH28 : (input = (xt_input (G)))) (PreH29 : (output = (xt_output_base (G)))) (PreH30 : (input_stride = (xt_input_stride (G)))) (PreH31 : (output_stride = (xt_output_stride (G)))) (PreH32 : (block_height = (xt_height (G)))) (PreH33 : (0 < block_height)) (PreH34 : (sizeof(UINT) = 4)) (PreH35 : (sizeof(UINT64) = 8)) (PreH36 : (sizeof(UINT64) = 8)) (PreH37 : (tile_height = 2)) (PreH38 : (tile_width = 2)) (PreH39 : (tile_hbytes = 8)) (PreH40 : (tile_wbytes = 8)) (PreH41 : (input_reset = (xt_neon_input_reset (G)))) (PreH42 : (input_offset = (xt_neon_input_offset (G)))) (PreH43 : (output_reset = (xt_neon_output_reset (G)))) (PreH44 : (0 <= k)) (PreH45 : (k <= ((xt_cols (G)) + 1 ))) (PreH46 : ((k % ( 2 ) ) = 0)) (PreH47 : (block_width = (xt_doz ((xt_cols (G))) (k)))) (PreH48 : (0 < block_width)) (PreH49 : (k < (xt_cols (G)))) (PreH50 : (0 <= bh)) (PreH51 : (bh <= block_height)) (PreH52 : (((block_height - bh ) % ( 2 ) ) = 0)) (PreH53 : (i0 = (xt_current_input (G) (k) ((block_height - bh ))))) (PreH54 : (i1 = (xt_current_input (G) (k) (((block_height - bh ) + 1 ))))) (PreH55 : (o0 = (xt_current_output (G) (k) ((block_height - bh ))))) (PreH56 : (o1 = (xt_current_output (G) ((xt_neon_second (k) (block_width))) ((block_height - bh ))))) (PreH57 : (xt_progress F G old R k (xt_neon_batch (block_width)) (block_height - bh ) )) ,
  (UndefStructPreduint32x2_t ( &( "v1_0" ) ) )
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  ((( &( "tile_height" ) )) # UInt64  |-> tile_height)
  **  ((( &( "tile_width" ) )) # UInt64  |-> tile_width)
  **  ((( &( "tile_hbytes" ) )) # UInt64  |-> tile_hbytes)
  **  ((( &( "tile_wbytes" ) )) # UInt64  |-> tile_wbytes)
  **  ((( &( "input_reset" ) )) # UInt64  |-> input_reset)
  **  ((( &( "input_offset" ) )) # UInt64  |-> input_offset)
  **  ((( &( "output_reset" ) )) # UInt64  |-> output_reset)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "bh" ) )) # UInt64  |-> bh)
  **  ((( &( "i0" ) )) # Ptr  |-> i0)
  **  ((( &( "i1" ) )) # Ptr  |-> i1)
  **  ((( &( "o0" ) )) # Ptr  |-> o0)
  **  ((( &( "o1" ) )) # Ptr  |-> o1)
  **  (xt_data F )
  **  (xt_output W R )
|--
  “ (xt_window F i0 2 ) ”
).

Definition test_neon_partial_solve_wit_50_pure_split_goal_1 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (R: XTOutput) (o1: Z) (o0: Z) (i1: Z) (i0: Z) (bh: Z) (block_width: Z) (k: Z) (output_reset: Z) (input_offset: Z) (input_reset: Z) (tile_wbytes: Z) (tile_hbytes: Z) (tile_width: Z) (tile_height: Z) (block_height: Z) (output_stride: Z) (input_stride: Z) (output: Z) (input: Z) (PreH1 : (bh <= UINT64_MAX)) (PreH2 : (block_width <= UINT64_MAX)) (PreH3 : (output_reset <= UINT64_MAX)) (PreH4 : (input_offset <= UINT64_MAX)) (PreH5 : (input_reset <= UINT64_MAX)) (PreH6 : (tile_wbytes <= UINT64_MAX)) (PreH7 : (tile_hbytes <= UINT64_MAX)) (PreH8 : (tile_width <= UINT64_MAX)) (PreH9 : (tile_height <= UINT64_MAX)) (PreH10 : (block_height <= UINT64_MAX)) (PreH11 : (output_stride <= UINT64_MAX)) (PreH12 : (input_stride <= UINT64_MAX)) (PreH13 : (bh >= 0)) (PreH14 : (block_width >= 0)) (PreH15 : (output_reset >= 0)) (PreH16 : (input_offset >= 0)) (PreH17 : (input_reset >= 0)) (PreH18 : (tile_wbytes >= 0)) (PreH19 : (tile_hbytes >= 0)) (PreH20 : (tile_width >= 0)) (PreH21 : (tile_height >= 0)) (PreH22 : (block_height >= 0)) (PreH23 : (output_stride >= 0)) (PreH24 : (input_stride >= 0)) (PreH25 : (bh <> 0)) (PreH26 : (bh < 2)) (PreH27 : (xt_valid F W G )) (PreH28 : (input = (xt_input (G)))) (PreH29 : (output = (xt_output_base (G)))) (PreH30 : (input_stride = (xt_input_stride (G)))) (PreH31 : (output_stride = (xt_output_stride (G)))) (PreH32 : (block_height = (xt_height (G)))) (PreH33 : (0 < block_height)) (PreH34 : (sizeof(UINT) = 4)) (PreH35 : (sizeof(UINT64) = 8)) (PreH36 : (sizeof(UINT64) = 8)) (PreH37 : (tile_height = 2)) (PreH38 : (tile_width = 2)) (PreH39 : (tile_hbytes = 8)) (PreH40 : (tile_wbytes = 8)) (PreH41 : (input_reset = (xt_neon_input_reset (G)))) (PreH42 : (input_offset = (xt_neon_input_offset (G)))) (PreH43 : (output_reset = (xt_neon_output_reset (G)))) (PreH44 : (0 <= k)) (PreH45 : (k <= ((xt_cols (G)) + 1 ))) (PreH46 : ((k % ( 2 ) ) = 0)) (PreH47 : (block_width = (xt_doz ((xt_cols (G))) (k)))) (PreH48 : (0 < block_width)) (PreH49 : (k < (xt_cols (G)))) (PreH50 : (0 <= bh)) (PreH51 : (bh <= block_height)) (PreH52 : (((block_height - bh ) % ( 2 ) ) = 0)) (PreH53 : (i0 = (xt_current_input (G) (k) ((block_height - bh ))))) (PreH54 : (i1 = (xt_current_input (G) (k) (((block_height - bh ) + 1 ))))) (PreH55 : (o0 = (xt_current_output (G) (k) ((block_height - bh ))))) (PreH56 : (o1 = (xt_current_output (G) ((xt_neon_second (k) (block_width))) ((block_height - bh ))))) (PreH57 : (xt_progress F G old R k (xt_neon_batch (block_width)) (block_height - bh ) )) ,
  (UndefStructPreduint32x2_t ( &( "v1_0" ) ) )
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  ((( &( "tile_height" ) )) # UInt64  |-> tile_height)
  **  ((( &( "tile_width" ) )) # UInt64  |-> tile_width)
  **  ((( &( "tile_hbytes" ) )) # UInt64  |-> tile_hbytes)
  **  ((( &( "tile_wbytes" ) )) # UInt64  |-> tile_wbytes)
  **  ((( &( "input_reset" ) )) # UInt64  |-> input_reset)
  **  ((( &( "input_offset" ) )) # UInt64  |-> input_offset)
  **  ((( &( "output_reset" ) )) # UInt64  |-> output_reset)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "bh" ) )) # UInt64  |-> bh)
  **  ((( &( "i0" ) )) # Ptr  |-> i0)
  **  ((( &( "i1" ) )) # Ptr  |-> i1)
  **  ((( &( "o0" ) )) # Ptr  |-> o0)
  **  ((( &( "o1" ) )) # Ptr  |-> o1)
  **  (xt_data F )
  **  (xt_output W R )
|--
  “ (xt_window F i0 2 ) ”
.

Definition test_neon_partial_solve_wit_50_aux := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (R: XTOutput) (o1: Z) (o0: Z) (i1: Z) (i0: Z) (bh: Z) (block_width: Z) (k: Z) (output_reset: Z) (input_offset: Z) (input_reset: Z) (tile_wbytes: Z) (tile_hbytes: Z) (tile_width: Z) (tile_height: Z) (block_height: Z) (output_stride: Z) (input_stride: Z) (output: Z) (input: Z) (PreH1 : (bh <> 0)) (PreH2 : (bh < 2)) (PreH3 : (xt_valid F W G )) (PreH4 : (input = (xt_input (G)))) (PreH5 : (output = (xt_output_base (G)))) (PreH6 : (input_stride = (xt_input_stride (G)))) (PreH7 : (output_stride = (xt_output_stride (G)))) (PreH8 : (block_height = (xt_height (G)))) (PreH9 : (0 < block_height)) (PreH10 : (sizeof(UINT) = 4)) (PreH11 : (sizeof(UINT64) = 8)) (PreH12 : (sizeof(UINT64) = 8)) (PreH13 : (tile_height = 2)) (PreH14 : (tile_width = 2)) (PreH15 : (tile_hbytes = 8)) (PreH16 : (tile_wbytes = 8)) (PreH17 : (input_reset = (xt_neon_input_reset (G)))) (PreH18 : (input_offset = (xt_neon_input_offset (G)))) (PreH19 : (output_reset = (xt_neon_output_reset (G)))) (PreH20 : (0 <= k)) (PreH21 : (k <= ((xt_cols (G)) + 1 ))) (PreH22 : ((k % ( 2 ) ) = 0)) (PreH23 : (block_width = (xt_doz ((xt_cols (G))) (k)))) (PreH24 : (0 < block_width)) (PreH25 : (k < (xt_cols (G)))) (PreH26 : (0 <= bh)) (PreH27 : (bh <= block_height)) (PreH28 : (((block_height - bh ) % ( 2 ) ) = 0)) (PreH29 : (i0 = (xt_current_input (G) (k) ((block_height - bh ))))) (PreH30 : (i1 = (xt_current_input (G) (k) (((block_height - bh ) + 1 ))))) (PreH31 : (o0 = (xt_current_output (G) (k) ((block_height - bh ))))) (PreH32 : (o1 = (xt_current_output (G) ((xt_neon_second (k) (block_width))) ((block_height - bh ))))) (PreH33 : (xt_progress F G old R k (xt_neon_batch (block_width)) (block_height - bh ) )) ,
  (UndefStructPreduint32x2_t ( &( "v1_0" ) ) )
  **  (xt_data F )
  **  (xt_output W R )
|--
  “ (xt_window F i0 2 ) ” 
  &&  “ (bh <> 0) ” 
  &&  “ (bh < 2) ” 
  &&  “ (xt_valid F W G ) ” 
  &&  “ (input = (xt_input (G))) ” 
  &&  “ (output = (xt_output_base (G))) ” 
  &&  “ (input_stride = (xt_input_stride (G))) ” 
  &&  “ (output_stride = (xt_output_stride (G))) ” 
  &&  “ (block_height = (xt_height (G))) ” 
  &&  “ (0 < block_height) ” 
  &&  “ (sizeof(UINT) = 4) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (tile_height = 2) ” 
  &&  “ (tile_width = 2) ” 
  &&  “ (tile_hbytes = 8) ” 
  &&  “ (tile_wbytes = 8) ” 
  &&  “ (input_reset = (xt_neon_input_reset (G))) ” 
  &&  “ (input_offset = (xt_neon_input_offset (G))) ” 
  &&  “ (output_reset = (xt_neon_output_reset (G))) ” 
  &&  “ (0 <= k) ” 
  &&  “ (k <= ((xt_cols (G)) + 1 )) ” 
  &&  “ ((k % ( 2 ) ) = 0) ” 
  &&  “ (block_width = (xt_doz ((xt_cols (G))) (k))) ” 
  &&  “ (0 < block_width) ” 
  &&  “ (k < (xt_cols (G))) ” 
  &&  “ (0 <= bh) ” 
  &&  “ (bh <= block_height) ” 
  &&  “ (((block_height - bh ) % ( 2 ) ) = 0) ” 
  &&  “ (i0 = (xt_current_input (G) (k) ((block_height - bh )))) ” 
  &&  “ (i1 = (xt_current_input (G) (k) (((block_height - bh ) + 1 )))) ” 
  &&  “ (o0 = (xt_current_output (G) (k) ((block_height - bh )))) ” 
  &&  “ (o1 = (xt_current_output (G) ((xt_neon_second (k) (block_width))) ((block_height - bh )))) ” 
  &&  “ (xt_progress F G old R k (xt_neon_batch (block_width)) (block_height - bh ) ) ”
  &&  (xt_data F )
  **  (UndefStructPreduint32x2_t ( &( "v1_0" ) ) )
  **  (xt_output W R )
.

Definition test_neon_partial_solve_wit_50 := test_neon_partial_solve_wit_50_pure -> test_neon_partial_solve_wit_50_aux.

Definition test_neon_partial_solve_wit_51 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (R: XTOutput) (o1: Z) (o0: Z) (i1: Z) (i0: Z) (bh: Z) (block_width: Z) (k: Z) (output_reset: Z) (input_offset: Z) (input_reset: Z) (tile_wbytes: Z) (tile_hbytes: Z) (tile_width: Z) (tile_height: Z) (block_height: Z) (output_stride: Z) (input_stride: Z) (output: Z) (input: Z) (retval: Z) (PreH1 : (bh <> 0)) (PreH2 : (bh < 2)) (PreH3 : (xt_valid F W G )) (PreH4 : (input = (xt_input (G)))) (PreH5 : (output = (xt_output_base (G)))) (PreH6 : (input_stride = (xt_input_stride (G)))) (PreH7 : (output_stride = (xt_output_stride (G)))) (PreH8 : (block_height = (xt_height (G)))) (PreH9 : (0 < block_height)) (PreH10 : (sizeof(UINT) = 4)) (PreH11 : (sizeof(UINT64) = 8)) (PreH12 : (sizeof(UINT64) = 8)) (PreH13 : (tile_height = 2)) (PreH14 : (tile_width = 2)) (PreH15 : (tile_hbytes = 8)) (PreH16 : (tile_wbytes = 8)) (PreH17 : (input_reset = (xt_neon_input_reset (G)))) (PreH18 : (input_offset = (xt_neon_input_offset (G)))) (PreH19 : (output_reset = (xt_neon_output_reset (G)))) (PreH20 : (0 <= k)) (PreH21 : (k <= ((xt_cols (G)) + 1 ))) (PreH22 : ((k % ( 2 ) ) = 0)) (PreH23 : (block_width = (xt_doz ((xt_cols (G))) (k)))) (PreH24 : (0 < block_width)) (PreH25 : (k < (xt_cols (G)))) (PreH26 : (0 <= bh)) (PreH27 : (bh <= block_height)) (PreH28 : (((block_height - bh ) % ( 2 ) ) = 0)) (PreH29 : (i0 = (xt_current_input (G) (k) ((block_height - bh ))))) (PreH30 : (i1 = (xt_current_input (G) (k) (((block_height - bh ) + 1 ))))) (PreH31 : (o0 = (xt_current_output (G) (k) ((block_height - bh ))))) (PreH32 : (o1 = (xt_current_output (G) ((xt_neon_second (k) (block_width))) ((block_height - bh ))))) (PreH33 : (xt_progress F G old R k (xt_neon_batch (block_width)) (block_height - bh ) )) ,
  (xt_data F )
  **  ((&((retval)  # "uint32x2_t" ->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (0)))
  **  ((&((retval)  # "uint32x2_t" ->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (i0) (1)))
  **  (UndefStructPreduint32x2_t ( &( "v1_0" ) ) )
  **  (xt_output W R )
|--
  “ (bh <> 0) ” 
  &&  “ (bh < 2) ” 
  &&  “ (xt_valid F W G ) ” 
  &&  “ (input = (xt_input (G))) ” 
  &&  “ (output = (xt_output_base (G))) ” 
  &&  “ (input_stride = (xt_input_stride (G))) ” 
  &&  “ (output_stride = (xt_output_stride (G))) ” 
  &&  “ (block_height = (xt_height (G))) ” 
  &&  “ (0 < block_height) ” 
  &&  “ (sizeof(UINT) = 4) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (tile_height = 2) ” 
  &&  “ (tile_width = 2) ” 
  &&  “ (tile_hbytes = 8) ” 
  &&  “ (tile_wbytes = 8) ” 
  &&  “ (input_reset = (xt_neon_input_reset (G))) ” 
  &&  “ (input_offset = (xt_neon_input_offset (G))) ” 
  &&  “ (output_reset = (xt_neon_output_reset (G))) ” 
  &&  “ (0 <= k) ” 
  &&  “ (k <= ((xt_cols (G)) + 1 )) ” 
  &&  “ ((k % ( 2 ) ) = 0) ” 
  &&  “ (block_width = (xt_doz ((xt_cols (G))) (k))) ” 
  &&  “ (0 < block_width) ” 
  &&  “ (k < (xt_cols (G))) ” 
  &&  “ (0 <= bh) ” 
  &&  “ (bh <= block_height) ” 
  &&  “ (((block_height - bh ) % ( 2 ) ) = 0) ” 
  &&  “ (i0 = (xt_current_input (G) (k) ((block_height - bh )))) ” 
  &&  “ (i1 = (xt_current_input (G) (k) (((block_height - bh ) + 1 )))) ” 
  &&  “ (o0 = (xt_current_output (G) (k) ((block_height - bh )))) ” 
  &&  “ (o1 = (xt_current_output (G) ((xt_neon_second (k) (block_width))) ((block_height - bh )))) ” 
  &&  “ (xt_progress F G old R k (xt_neon_batch (block_width)) (block_height - bh ) ) ”
  &&  ((&(( &( "v1_0" ) )->ₛ "s1")) # UInt  |->_)
  **  ((&((retval)  # "uint32x2_t" ->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (i0) (1)))
  **  ((&(( &( "v1_0" ) )->ₛ "s0")) # UInt  |->_)
  **  ((&((retval)  # "uint32x2_t" ->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (0)))
  **  (xt_data F )
  **  (xt_output W R )
.

Definition test_neon_partial_solve_wit_52 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (R: XTOutput) (o1: Z) (o0: Z) (i1: Z) (i0: Z) (bh: Z) (block_width: Z) (k: Z) (output_reset: Z) (input_offset: Z) (input_reset: Z) (tile_wbytes: Z) (tile_hbytes: Z) (tile_width: Z) (tile_height: Z) (block_height: Z) (output_stride: Z) (input_stride: Z) (output: Z) (input: Z) (PreH1 : (bh <> 0)) (PreH2 : (bh < 2)) (PreH3 : (xt_valid F W G )) (PreH4 : (input = (xt_input (G)))) (PreH5 : (output = (xt_output_base (G)))) (PreH6 : (input_stride = (xt_input_stride (G)))) (PreH7 : (output_stride = (xt_output_stride (G)))) (PreH8 : (block_height = (xt_height (G)))) (PreH9 : (0 < block_height)) (PreH10 : (sizeof(UINT) = 4)) (PreH11 : (sizeof(UINT64) = 8)) (PreH12 : (sizeof(UINT64) = 8)) (PreH13 : (tile_height = 2)) (PreH14 : (tile_width = 2)) (PreH15 : (tile_hbytes = 8)) (PreH16 : (tile_wbytes = 8)) (PreH17 : (input_reset = (xt_neon_input_reset (G)))) (PreH18 : (input_offset = (xt_neon_input_offset (G)))) (PreH19 : (output_reset = (xt_neon_output_reset (G)))) (PreH20 : (0 <= k)) (PreH21 : (k <= ((xt_cols (G)) + 1 ))) (PreH22 : ((k % ( 2 ) ) = 0)) (PreH23 : (block_width = (xt_doz ((xt_cols (G))) (k)))) (PreH24 : (0 < block_width)) (PreH25 : (k < (xt_cols (G)))) (PreH26 : (0 <= bh)) (PreH27 : (bh <= block_height)) (PreH28 : (((block_height - bh ) % ( 2 ) ) = 0)) (PreH29 : (i0 = (xt_current_input (G) (k) ((block_height - bh ))))) (PreH30 : (i1 = (xt_current_input (G) (k) (((block_height - bh ) + 1 ))))) (PreH31 : (o0 = (xt_current_output (G) (k) ((block_height - bh ))))) (PreH32 : (o1 = (xt_current_output (G) ((xt_neon_second (k) (block_width))) ((block_height - bh ))))) (PreH33 : (xt_progress F G old R k (xt_neon_batch (block_width)) (block_height - bh ) )) ,
  (UndefStructPreduint32x2_t ( &( "v1_1" ) ) )
  **  ((&(( &( "v1_0" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (i0) (1)))
  **  ((&(( &( "v1_0" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (0)))
  **  (xt_data F )
  **  (xt_output W R )
|--
  “ (bh <> 0) ” 
  &&  “ (bh < 2) ” 
  &&  “ (xt_valid F W G ) ” 
  &&  “ (input = (xt_input (G))) ” 
  &&  “ (output = (xt_output_base (G))) ” 
  &&  “ (input_stride = (xt_input_stride (G))) ” 
  &&  “ (output_stride = (xt_output_stride (G))) ” 
  &&  “ (block_height = (xt_height (G))) ” 
  &&  “ (0 < block_height) ” 
  &&  “ (sizeof(UINT) = 4) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (tile_height = 2) ” 
  &&  “ (tile_width = 2) ” 
  &&  “ (tile_hbytes = 8) ” 
  &&  “ (tile_wbytes = 8) ” 
  &&  “ (input_reset = (xt_neon_input_reset (G))) ” 
  &&  “ (input_offset = (xt_neon_input_offset (G))) ” 
  &&  “ (output_reset = (xt_neon_output_reset (G))) ” 
  &&  “ (0 <= k) ” 
  &&  “ (k <= ((xt_cols (G)) + 1 )) ” 
  &&  “ ((k % ( 2 ) ) = 0) ” 
  &&  “ (block_width = (xt_doz ((xt_cols (G))) (k))) ” 
  &&  “ (0 < block_width) ” 
  &&  “ (k < (xt_cols (G))) ” 
  &&  “ (0 <= bh) ” 
  &&  “ (bh <= block_height) ” 
  &&  “ (((block_height - bh ) % ( 2 ) ) = 0) ” 
  &&  “ (i0 = (xt_current_input (G) (k) ((block_height - bh )))) ” 
  &&  “ (i1 = (xt_current_input (G) (k) (((block_height - bh ) + 1 )))) ” 
  &&  “ (o0 = (xt_current_output (G) (k) ((block_height - bh )))) ” 
  &&  “ (o1 = (xt_current_output (G) ((xt_neon_second (k) (block_width))) ((block_height - bh )))) ” 
  &&  “ (xt_progress F G old R k (xt_neon_batch (block_width)) (block_height - bh ) ) ”
  &&  (UndefStructPreduint32x2_t ( &( "v1_1" ) ) )
  **  ((&(( &( "v1_0" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (i0) (1)))
  **  ((&(( &( "v1_0" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (0)))
  **  (xt_data F )
  **  (xt_output W R )
.

Definition test_neon_partial_solve_wit_53 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (R: XTOutput) (o1: Z) (o0: Z) (i1: Z) (i0: Z) (bh: Z) (block_width: Z) (k: Z) (output_reset: Z) (input_offset: Z) (input_reset: Z) (tile_wbytes: Z) (tile_hbytes: Z) (tile_width: Z) (tile_height: Z) (block_height: Z) (output_stride: Z) (input_stride: Z) (output: Z) (input: Z) (retval: Z) (PreH1 : (bh <> 0)) (PreH2 : (bh < 2)) (PreH3 : (xt_valid F W G )) (PreH4 : (input = (xt_input (G)))) (PreH5 : (output = (xt_output_base (G)))) (PreH6 : (input_stride = (xt_input_stride (G)))) (PreH7 : (output_stride = (xt_output_stride (G)))) (PreH8 : (block_height = (xt_height (G)))) (PreH9 : (0 < block_height)) (PreH10 : (sizeof(UINT) = 4)) (PreH11 : (sizeof(UINT64) = 8)) (PreH12 : (sizeof(UINT64) = 8)) (PreH13 : (tile_height = 2)) (PreH14 : (tile_width = 2)) (PreH15 : (tile_hbytes = 8)) (PreH16 : (tile_wbytes = 8)) (PreH17 : (input_reset = (xt_neon_input_reset (G)))) (PreH18 : (input_offset = (xt_neon_input_offset (G)))) (PreH19 : (output_reset = (xt_neon_output_reset (G)))) (PreH20 : (0 <= k)) (PreH21 : (k <= ((xt_cols (G)) + 1 ))) (PreH22 : ((k % ( 2 ) ) = 0)) (PreH23 : (block_width = (xt_doz ((xt_cols (G))) (k)))) (PreH24 : (0 < block_width)) (PreH25 : (k < (xt_cols (G)))) (PreH26 : (0 <= bh)) (PreH27 : (bh <= block_height)) (PreH28 : (((block_height - bh ) % ( 2 ) ) = 0)) (PreH29 : (i0 = (xt_current_input (G) (k) ((block_height - bh ))))) (PreH30 : (i1 = (xt_current_input (G) (k) (((block_height - bh ) + 1 ))))) (PreH31 : (o0 = (xt_current_output (G) (k) ((block_height - bh ))))) (PreH32 : (o1 = (xt_current_output (G) ((xt_neon_second (k) (block_width))) ((block_height - bh ))))) (PreH33 : (xt_progress F G old R k (xt_neon_batch (block_width)) (block_height - bh ) )) ,
  ((&((retval)  # "uint32x2_t" ->ₛ "s0")) # UInt  |-> 0)
  **  ((&((retval)  # "uint32x2_t" ->ₛ "s1")) # UInt  |-> 0)
  **  (UndefStructPreduint32x2_t ( &( "v1_1" ) ) )
  **  ((&(( &( "v1_0" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (i0) (1)))
  **  ((&(( &( "v1_0" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (0)))
  **  (xt_data F )
  **  (xt_output W R )
|--
  “ (bh <> 0) ” 
  &&  “ (bh < 2) ” 
  &&  “ (xt_valid F W G ) ” 
  &&  “ (input = (xt_input (G))) ” 
  &&  “ (output = (xt_output_base (G))) ” 
  &&  “ (input_stride = (xt_input_stride (G))) ” 
  &&  “ (output_stride = (xt_output_stride (G))) ” 
  &&  “ (block_height = (xt_height (G))) ” 
  &&  “ (0 < block_height) ” 
  &&  “ (sizeof(UINT) = 4) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (tile_height = 2) ” 
  &&  “ (tile_width = 2) ” 
  &&  “ (tile_hbytes = 8) ” 
  &&  “ (tile_wbytes = 8) ” 
  &&  “ (input_reset = (xt_neon_input_reset (G))) ” 
  &&  “ (input_offset = (xt_neon_input_offset (G))) ” 
  &&  “ (output_reset = (xt_neon_output_reset (G))) ” 
  &&  “ (0 <= k) ” 
  &&  “ (k <= ((xt_cols (G)) + 1 )) ” 
  &&  “ ((k % ( 2 ) ) = 0) ” 
  &&  “ (block_width = (xt_doz ((xt_cols (G))) (k))) ” 
  &&  “ (0 < block_width) ” 
  &&  “ (k < (xt_cols (G))) ” 
  &&  “ (0 <= bh) ” 
  &&  “ (bh <= block_height) ” 
  &&  “ (((block_height - bh ) % ( 2 ) ) = 0) ” 
  &&  “ (i0 = (xt_current_input (G) (k) ((block_height - bh )))) ” 
  &&  “ (i1 = (xt_current_input (G) (k) (((block_height - bh ) + 1 )))) ” 
  &&  “ (o0 = (xt_current_output (G) (k) ((block_height - bh )))) ” 
  &&  “ (o1 = (xt_current_output (G) ((xt_neon_second (k) (block_width))) ((block_height - bh )))) ” 
  &&  “ (xt_progress F G old R k (xt_neon_batch (block_width)) (block_height - bh ) ) ”
  &&  ((&(( &( "v1_1" ) )->ₛ "s1")) # UInt  |->_)
  **  ((&((retval)  # "uint32x2_t" ->ₛ "s1")) # UInt  |-> 0)
  **  ((&(( &( "v1_1" ) )->ₛ "s0")) # UInt  |->_)
  **  ((&((retval)  # "uint32x2_t" ->ₛ "s0")) # UInt  |-> 0)
  **  ((&(( &( "v1_0" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (i0) (1)))
  **  ((&(( &( "v1_0" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (0)))
  **  (xt_data F )
  **  (xt_output W R )
.

Definition test_neon_partial_solve_wit_54 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (R: XTOutput) (o1: Z) (o0: Z) (i1: Z) (i0: Z) (bh: Z) (block_width: Z) (k: Z) (output_reset: Z) (input_offset: Z) (input_reset: Z) (tile_wbytes: Z) (tile_hbytes: Z) (tile_width: Z) (tile_height: Z) (block_height: Z) (output_stride: Z) (input_stride: Z) (output: Z) (input: Z) (PreH1 : (bh <> 0)) (PreH2 : (bh < 2)) (PreH3 : (xt_valid F W G )) (PreH4 : (input = (xt_input (G)))) (PreH5 : (output = (xt_output_base (G)))) (PreH6 : (input_stride = (xt_input_stride (G)))) (PreH7 : (output_stride = (xt_output_stride (G)))) (PreH8 : (block_height = (xt_height (G)))) (PreH9 : (0 < block_height)) (PreH10 : (sizeof(UINT) = 4)) (PreH11 : (sizeof(UINT64) = 8)) (PreH12 : (sizeof(UINT64) = 8)) (PreH13 : (tile_height = 2)) (PreH14 : (tile_width = 2)) (PreH15 : (tile_hbytes = 8)) (PreH16 : (tile_wbytes = 8)) (PreH17 : (input_reset = (xt_neon_input_reset (G)))) (PreH18 : (input_offset = (xt_neon_input_offset (G)))) (PreH19 : (output_reset = (xt_neon_output_reset (G)))) (PreH20 : (0 <= k)) (PreH21 : (k <= ((xt_cols (G)) + 1 ))) (PreH22 : ((k % ( 2 ) ) = 0)) (PreH23 : (block_width = (xt_doz ((xt_cols (G))) (k)))) (PreH24 : (0 < block_width)) (PreH25 : (k < (xt_cols (G)))) (PreH26 : (0 <= bh)) (PreH27 : (bh <= block_height)) (PreH28 : (((block_height - bh ) % ( 2 ) ) = 0)) (PreH29 : (i0 = (xt_current_input (G) (k) ((block_height - bh ))))) (PreH30 : (i1 = (xt_current_input (G) (k) (((block_height - bh ) + 1 ))))) (PreH31 : (o0 = (xt_current_output (G) (k) ((block_height - bh ))))) (PreH32 : (o1 = (xt_current_output (G) ((xt_neon_second (k) (block_width))) ((block_height - bh ))))) (PreH33 : (xt_progress F G old R k (xt_neon_batch (block_width)) (block_height - bh ) )) ,
  (UndefStructPreduint32x2_t ( &( "v0_low" ) ) )
  **  ((&(( &( "v1_1" ) )->ₛ "s1")) # UInt  |-> 0)
  **  ((&(( &( "v1_1" ) )->ₛ "s0")) # UInt  |-> 0)
  **  ((&(( &( "v1_0" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (i0) (1)))
  **  ((&(( &( "v1_0" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (0)))
  **  (xt_data F )
  **  (xt_output W R )
|--
  “ (bh <> 0) ” 
  &&  “ (bh < 2) ” 
  &&  “ (xt_valid F W G ) ” 
  &&  “ (input = (xt_input (G))) ” 
  &&  “ (output = (xt_output_base (G))) ” 
  &&  “ (input_stride = (xt_input_stride (G))) ” 
  &&  “ (output_stride = (xt_output_stride (G))) ” 
  &&  “ (block_height = (xt_height (G))) ” 
  &&  “ (0 < block_height) ” 
  &&  “ (sizeof(UINT) = 4) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (tile_height = 2) ” 
  &&  “ (tile_width = 2) ” 
  &&  “ (tile_hbytes = 8) ” 
  &&  “ (tile_wbytes = 8) ” 
  &&  “ (input_reset = (xt_neon_input_reset (G))) ” 
  &&  “ (input_offset = (xt_neon_input_offset (G))) ” 
  &&  “ (output_reset = (xt_neon_output_reset (G))) ” 
  &&  “ (0 <= k) ” 
  &&  “ (k <= ((xt_cols (G)) + 1 )) ” 
  &&  “ ((k % ( 2 ) ) = 0) ” 
  &&  “ (block_width = (xt_doz ((xt_cols (G))) (k))) ” 
  &&  “ (0 < block_width) ” 
  &&  “ (k < (xt_cols (G))) ” 
  &&  “ (0 <= bh) ” 
  &&  “ (bh <= block_height) ” 
  &&  “ (((block_height - bh ) % ( 2 ) ) = 0) ” 
  &&  “ (i0 = (xt_current_input (G) (k) ((block_height - bh )))) ” 
  &&  “ (i1 = (xt_current_input (G) (k) (((block_height - bh ) + 1 )))) ” 
  &&  “ (o0 = (xt_current_output (G) (k) ((block_height - bh )))) ” 
  &&  “ (o1 = (xt_current_output (G) ((xt_neon_second (k) (block_width))) ((block_height - bh )))) ” 
  &&  “ (xt_progress F G old R k (xt_neon_batch (block_width)) (block_height - bh ) ) ”
  &&  ((&(( &( "v1_0" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (0)))
  **  ((&(( &( "v1_0" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (i0) (1)))
  **  ((&(( &( "v1_1" ) )->ₛ "s0")) # UInt  |-> 0)
  **  ((&(( &( "v1_1" ) )->ₛ "s1")) # UInt  |-> 0)
  **  (UndefStructPreduint32x2_t ( &( "v0_low" ) ) )
  **  (xt_data F )
  **  (xt_output W R )
.

Definition test_neon_partial_solve_wit_55 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (R: XTOutput) (o1: Z) (o0: Z) (i1: Z) (i0: Z) (bh: Z) (block_width: Z) (k: Z) (output_reset: Z) (input_offset: Z) (input_reset: Z) (tile_wbytes: Z) (tile_hbytes: Z) (tile_width: Z) (tile_height: Z) (block_height: Z) (output_stride: Z) (input_stride: Z) (output: Z) (input: Z) (retval: Z) (PreH1 : (bh <> 0)) (PreH2 : (bh < 2)) (PreH3 : (xt_valid F W G )) (PreH4 : (input = (xt_input (G)))) (PreH5 : (output = (xt_output_base (G)))) (PreH6 : (input_stride = (xt_input_stride (G)))) (PreH7 : (output_stride = (xt_output_stride (G)))) (PreH8 : (block_height = (xt_height (G)))) (PreH9 : (0 < block_height)) (PreH10 : (sizeof(UINT) = 4)) (PreH11 : (sizeof(UINT64) = 8)) (PreH12 : (sizeof(UINT64) = 8)) (PreH13 : (tile_height = 2)) (PreH14 : (tile_width = 2)) (PreH15 : (tile_hbytes = 8)) (PreH16 : (tile_wbytes = 8)) (PreH17 : (input_reset = (xt_neon_input_reset (G)))) (PreH18 : (input_offset = (xt_neon_input_offset (G)))) (PreH19 : (output_reset = (xt_neon_output_reset (G)))) (PreH20 : (0 <= k)) (PreH21 : (k <= ((xt_cols (G)) + 1 ))) (PreH22 : ((k % ( 2 ) ) = 0)) (PreH23 : (block_width = (xt_doz ((xt_cols (G))) (k)))) (PreH24 : (0 < block_width)) (PreH25 : (k < (xt_cols (G)))) (PreH26 : (0 <= bh)) (PreH27 : (bh <= block_height)) (PreH28 : (((block_height - bh ) % ( 2 ) ) = 0)) (PreH29 : (i0 = (xt_current_input (G) (k) ((block_height - bh ))))) (PreH30 : (i1 = (xt_current_input (G) (k) (((block_height - bh ) + 1 ))))) (PreH31 : (o0 = (xt_current_output (G) (k) ((block_height - bh ))))) (PreH32 : (o1 = (xt_current_output (G) ((xt_neon_second (k) (block_width))) ((block_height - bh ))))) (PreH33 : (xt_progress F G old R k (xt_neon_batch (block_width)) (block_height - bh ) )) ,
  ((&(( &( "v1_0" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (0)))
  **  ((&(( &( "v1_0" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (i0) (1)))
  **  ((&(( &( "v1_1" ) )->ₛ "s0")) # UInt  |-> 0)
  **  ((&(( &( "v1_1" ) )->ₛ "s1")) # UInt  |-> 0)
  **  ((&((retval)  # "uint32x2_t" ->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (0)))
  **  ((&((retval)  # "uint32x2_t" ->ₛ "s1")) # UInt  |-> 0)
  **  (UndefStructPreduint32x2_t ( &( "v0_low" ) ) )
  **  (xt_data F )
  **  (xt_output W R )
|--
  “ (bh <> 0) ” 
  &&  “ (bh < 2) ” 
  &&  “ (xt_valid F W G ) ” 
  &&  “ (input = (xt_input (G))) ” 
  &&  “ (output = (xt_output_base (G))) ” 
  &&  “ (input_stride = (xt_input_stride (G))) ” 
  &&  “ (output_stride = (xt_output_stride (G))) ” 
  &&  “ (block_height = (xt_height (G))) ” 
  &&  “ (0 < block_height) ” 
  &&  “ (sizeof(UINT) = 4) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (tile_height = 2) ” 
  &&  “ (tile_width = 2) ” 
  &&  “ (tile_hbytes = 8) ” 
  &&  “ (tile_wbytes = 8) ” 
  &&  “ (input_reset = (xt_neon_input_reset (G))) ” 
  &&  “ (input_offset = (xt_neon_input_offset (G))) ” 
  &&  “ (output_reset = (xt_neon_output_reset (G))) ” 
  &&  “ (0 <= k) ” 
  &&  “ (k <= ((xt_cols (G)) + 1 )) ” 
  &&  “ ((k % ( 2 ) ) = 0) ” 
  &&  “ (block_width = (xt_doz ((xt_cols (G))) (k))) ” 
  &&  “ (0 < block_width) ” 
  &&  “ (k < (xt_cols (G))) ” 
  &&  “ (0 <= bh) ” 
  &&  “ (bh <= block_height) ” 
  &&  “ (((block_height - bh ) % ( 2 ) ) = 0) ” 
  &&  “ (i0 = (xt_current_input (G) (k) ((block_height - bh )))) ” 
  &&  “ (i1 = (xt_current_input (G) (k) (((block_height - bh ) + 1 )))) ” 
  &&  “ (o0 = (xt_current_output (G) (k) ((block_height - bh )))) ” 
  &&  “ (o1 = (xt_current_output (G) ((xt_neon_second (k) (block_width))) ((block_height - bh )))) ” 
  &&  “ (xt_progress F G old R k (xt_neon_batch (block_width)) (block_height - bh ) ) ”
  &&  ((&(( &( "v0_low" ) )->ₛ "s1")) # UInt  |->_)
  **  ((&((retval)  # "uint32x2_t" ->ₛ "s1")) # UInt  |-> 0)
  **  ((&(( &( "v0_low" ) )->ₛ "s0")) # UInt  |->_)
  **  ((&((retval)  # "uint32x2_t" ->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (0)))
  **  ((&(( &( "v1_0" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (0)))
  **  ((&(( &( "v1_0" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (i0) (1)))
  **  ((&(( &( "v1_1" ) )->ₛ "s0")) # UInt  |-> 0)
  **  ((&(( &( "v1_1" ) )->ₛ "s1")) # UInt  |-> 0)
  **  (xt_data F )
  **  (xt_output W R )
.

Definition test_neon_partial_solve_wit_56 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (R: XTOutput) (o1: Z) (o0: Z) (i1: Z) (i0: Z) (bh: Z) (block_width: Z) (k: Z) (output_reset: Z) (input_offset: Z) (input_reset: Z) (tile_wbytes: Z) (tile_hbytes: Z) (tile_width: Z) (tile_height: Z) (block_height: Z) (output_stride: Z) (input_stride: Z) (output: Z) (input: Z) (PreH1 : (bh <> 0)) (PreH2 : (bh < 2)) (PreH3 : (xt_valid F W G )) (PreH4 : (input = (xt_input (G)))) (PreH5 : (output = (xt_output_base (G)))) (PreH6 : (input_stride = (xt_input_stride (G)))) (PreH7 : (output_stride = (xt_output_stride (G)))) (PreH8 : (block_height = (xt_height (G)))) (PreH9 : (0 < block_height)) (PreH10 : (sizeof(UINT) = 4)) (PreH11 : (sizeof(UINT64) = 8)) (PreH12 : (sizeof(UINT64) = 8)) (PreH13 : (tile_height = 2)) (PreH14 : (tile_width = 2)) (PreH15 : (tile_hbytes = 8)) (PreH16 : (tile_wbytes = 8)) (PreH17 : (input_reset = (xt_neon_input_reset (G)))) (PreH18 : (input_offset = (xt_neon_input_offset (G)))) (PreH19 : (output_reset = (xt_neon_output_reset (G)))) (PreH20 : (0 <= k)) (PreH21 : (k <= ((xt_cols (G)) + 1 ))) (PreH22 : ((k % ( 2 ) ) = 0)) (PreH23 : (block_width = (xt_doz ((xt_cols (G))) (k)))) (PreH24 : (0 < block_width)) (PreH25 : (k < (xt_cols (G)))) (PreH26 : (0 <= bh)) (PreH27 : (bh <= block_height)) (PreH28 : (((block_height - bh ) % ( 2 ) ) = 0)) (PreH29 : (i0 = (xt_current_input (G) (k) ((block_height - bh ))))) (PreH30 : (i1 = (xt_current_input (G) (k) (((block_height - bh ) + 1 ))))) (PreH31 : (o0 = (xt_current_output (G) (k) ((block_height - bh ))))) (PreH32 : (o1 = (xt_current_output (G) ((xt_neon_second (k) (block_width))) ((block_height - bh ))))) (PreH33 : (xt_progress F G old R k (xt_neon_batch (block_width)) (block_height - bh ) )) ,
  (UndefStructPreduint32x2_t ( &( "v1_low" ) ) )
  **  ((&(( &( "v0_low" ) )->ₛ "s1")) # UInt  |-> 0)
  **  ((&(( &( "v0_low" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (0)))
  **  ((&(( &( "v1_0" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (0)))
  **  ((&(( &( "v1_0" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (i0) (1)))
  **  ((&(( &( "v1_1" ) )->ₛ "s0")) # UInt  |-> 0)
  **  ((&(( &( "v1_1" ) )->ₛ "s1")) # UInt  |-> 0)
  **  (xt_data F )
  **  (xt_output W R )
|--
  “ (bh <> 0) ” 
  &&  “ (bh < 2) ” 
  &&  “ (xt_valid F W G ) ” 
  &&  “ (input = (xt_input (G))) ” 
  &&  “ (output = (xt_output_base (G))) ” 
  &&  “ (input_stride = (xt_input_stride (G))) ” 
  &&  “ (output_stride = (xt_output_stride (G))) ” 
  &&  “ (block_height = (xt_height (G))) ” 
  &&  “ (0 < block_height) ” 
  &&  “ (sizeof(UINT) = 4) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (tile_height = 2) ” 
  &&  “ (tile_width = 2) ” 
  &&  “ (tile_hbytes = 8) ” 
  &&  “ (tile_wbytes = 8) ” 
  &&  “ (input_reset = (xt_neon_input_reset (G))) ” 
  &&  “ (input_offset = (xt_neon_input_offset (G))) ” 
  &&  “ (output_reset = (xt_neon_output_reset (G))) ” 
  &&  “ (0 <= k) ” 
  &&  “ (k <= ((xt_cols (G)) + 1 )) ” 
  &&  “ ((k % ( 2 ) ) = 0) ” 
  &&  “ (block_width = (xt_doz ((xt_cols (G))) (k))) ” 
  &&  “ (0 < block_width) ” 
  &&  “ (k < (xt_cols (G))) ” 
  &&  “ (0 <= bh) ” 
  &&  “ (bh <= block_height) ” 
  &&  “ (((block_height - bh ) % ( 2 ) ) = 0) ” 
  &&  “ (i0 = (xt_current_input (G) (k) ((block_height - bh )))) ” 
  &&  “ (i1 = (xt_current_input (G) (k) (((block_height - bh ) + 1 )))) ” 
  &&  “ (o0 = (xt_current_output (G) (k) ((block_height - bh )))) ” 
  &&  “ (o1 = (xt_current_output (G) ((xt_neon_second (k) (block_width))) ((block_height - bh )))) ” 
  &&  “ (xt_progress F G old R k (xt_neon_batch (block_width)) (block_height - bh ) ) ”
  &&  ((&(( &( "v1_0" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (0)))
  **  ((&(( &( "v1_0" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (i0) (1)))
  **  ((&(( &( "v1_1" ) )->ₛ "s0")) # UInt  |-> 0)
  **  ((&(( &( "v1_1" ) )->ₛ "s1")) # UInt  |-> 0)
  **  (UndefStructPreduint32x2_t ( &( "v1_low" ) ) )
  **  ((&(( &( "v0_low" ) )->ₛ "s1")) # UInt  |-> 0)
  **  ((&(( &( "v0_low" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (0)))
  **  (xt_data F )
  **  (xt_output W R )
.

Definition test_neon_partial_solve_wit_57 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (R: XTOutput) (o1: Z) (o0: Z) (i1: Z) (i0: Z) (bh: Z) (block_width: Z) (k: Z) (output_reset: Z) (input_offset: Z) (input_reset: Z) (tile_wbytes: Z) (tile_hbytes: Z) (tile_width: Z) (tile_height: Z) (block_height: Z) (output_stride: Z) (input_stride: Z) (output: Z) (input: Z) (retval: Z) (PreH1 : (bh <> 0)) (PreH2 : (bh < 2)) (PreH3 : (xt_valid F W G )) (PreH4 : (input = (xt_input (G)))) (PreH5 : (output = (xt_output_base (G)))) (PreH6 : (input_stride = (xt_input_stride (G)))) (PreH7 : (output_stride = (xt_output_stride (G)))) (PreH8 : (block_height = (xt_height (G)))) (PreH9 : (0 < block_height)) (PreH10 : (sizeof(UINT) = 4)) (PreH11 : (sizeof(UINT64) = 8)) (PreH12 : (sizeof(UINT64) = 8)) (PreH13 : (tile_height = 2)) (PreH14 : (tile_width = 2)) (PreH15 : (tile_hbytes = 8)) (PreH16 : (tile_wbytes = 8)) (PreH17 : (input_reset = (xt_neon_input_reset (G)))) (PreH18 : (input_offset = (xt_neon_input_offset (G)))) (PreH19 : (output_reset = (xt_neon_output_reset (G)))) (PreH20 : (0 <= k)) (PreH21 : (k <= ((xt_cols (G)) + 1 ))) (PreH22 : ((k % ( 2 ) ) = 0)) (PreH23 : (block_width = (xt_doz ((xt_cols (G))) (k)))) (PreH24 : (0 < block_width)) (PreH25 : (k < (xt_cols (G)))) (PreH26 : (0 <= bh)) (PreH27 : (bh <= block_height)) (PreH28 : (((block_height - bh ) % ( 2 ) ) = 0)) (PreH29 : (i0 = (xt_current_input (G) (k) ((block_height - bh ))))) (PreH30 : (i1 = (xt_current_input (G) (k) (((block_height - bh ) + 1 ))))) (PreH31 : (o0 = (xt_current_output (G) (k) ((block_height - bh ))))) (PreH32 : (o1 = (xt_current_output (G) ((xt_neon_second (k) (block_width))) ((block_height - bh ))))) (PreH33 : (xt_progress F G old R k (xt_neon_batch (block_width)) (block_height - bh ) )) ,
  ((&(( &( "v1_0" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (0)))
  **  ((&(( &( "v1_0" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (i0) (1)))
  **  ((&(( &( "v1_1" ) )->ₛ "s0")) # UInt  |-> 0)
  **  ((&(( &( "v1_1" ) )->ₛ "s1")) # UInt  |-> 0)
  **  ((&((retval)  # "uint32x2_t" ->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (1)))
  **  ((&((retval)  # "uint32x2_t" ->ₛ "s1")) # UInt  |-> 0)
  **  (UndefStructPreduint32x2_t ( &( "v1_low" ) ) )
  **  ((&(( &( "v0_low" ) )->ₛ "s1")) # UInt  |-> 0)
  **  ((&(( &( "v0_low" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (0)))
  **  (xt_data F )
  **  (xt_output W R )
|--
  “ (bh <> 0) ” 
  &&  “ (bh < 2) ” 
  &&  “ (xt_valid F W G ) ” 
  &&  “ (input = (xt_input (G))) ” 
  &&  “ (output = (xt_output_base (G))) ” 
  &&  “ (input_stride = (xt_input_stride (G))) ” 
  &&  “ (output_stride = (xt_output_stride (G))) ” 
  &&  “ (block_height = (xt_height (G))) ” 
  &&  “ (0 < block_height) ” 
  &&  “ (sizeof(UINT) = 4) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (tile_height = 2) ” 
  &&  “ (tile_width = 2) ” 
  &&  “ (tile_hbytes = 8) ” 
  &&  “ (tile_wbytes = 8) ” 
  &&  “ (input_reset = (xt_neon_input_reset (G))) ” 
  &&  “ (input_offset = (xt_neon_input_offset (G))) ” 
  &&  “ (output_reset = (xt_neon_output_reset (G))) ” 
  &&  “ (0 <= k) ” 
  &&  “ (k <= ((xt_cols (G)) + 1 )) ” 
  &&  “ ((k % ( 2 ) ) = 0) ” 
  &&  “ (block_width = (xt_doz ((xt_cols (G))) (k))) ” 
  &&  “ (0 < block_width) ” 
  &&  “ (k < (xt_cols (G))) ” 
  &&  “ (0 <= bh) ” 
  &&  “ (bh <= block_height) ” 
  &&  “ (((block_height - bh ) % ( 2 ) ) = 0) ” 
  &&  “ (i0 = (xt_current_input (G) (k) ((block_height - bh )))) ” 
  &&  “ (i1 = (xt_current_input (G) (k) (((block_height - bh ) + 1 )))) ” 
  &&  “ (o0 = (xt_current_output (G) (k) ((block_height - bh )))) ” 
  &&  “ (o1 = (xt_current_output (G) ((xt_neon_second (k) (block_width))) ((block_height - bh )))) ” 
  &&  “ (xt_progress F G old R k (xt_neon_batch (block_width)) (block_height - bh ) ) ”
  &&  ((&(( &( "v1_low" ) )->ₛ "s1")) # UInt  |->_)
  **  ((&((retval)  # "uint32x2_t" ->ₛ "s1")) # UInt  |-> 0)
  **  ((&(( &( "v1_low" ) )->ₛ "s0")) # UInt  |->_)
  **  ((&((retval)  # "uint32x2_t" ->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (1)))
  **  ((&(( &( "v1_0" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (0)))
  **  ((&(( &( "v1_0" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (i0) (1)))
  **  ((&(( &( "v1_1" ) )->ₛ "s0")) # UInt  |-> 0)
  **  ((&(( &( "v1_1" ) )->ₛ "s1")) # UInt  |-> 0)
  **  ((&(( &( "v0_low" ) )->ₛ "s1")) # UInt  |-> 0)
  **  ((&(( &( "v0_low" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (0)))
  **  (xt_data F )
  **  (xt_output W R )
.

Definition test_neon_partial_solve_wit_58_pure := 
(
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (R: XTOutput) (o1: Z) (o0: Z) (i1: Z) (i0: Z) (bh: Z) (block_width: Z) (k: Z) (output_reset: Z) (input_offset: Z) (input_reset: Z) (tile_wbytes: Z) (tile_hbytes: Z) (tile_width: Z) (tile_height: Z) (block_height: Z) (output_stride: Z) (input_stride: Z) (output: Z) (input: Z) (PreH1 : (bh <> 0)) (PreH2 : (bh < 2)) (PreH3 : (xt_valid F W G )) (PreH4 : (input = (xt_input (G)))) (PreH5 : (output = (xt_output_base (G)))) (PreH6 : (input_stride = (xt_input_stride (G)))) (PreH7 : (output_stride = (xt_output_stride (G)))) (PreH8 : (block_height = (xt_height (G)))) (PreH9 : (0 < block_height)) (PreH10 : (sizeof(UINT) = 4)) (PreH11 : (sizeof(UINT64) = 8)) (PreH12 : (sizeof(UINT64) = 8)) (PreH13 : (tile_height = 2)) (PreH14 : (tile_width = 2)) (PreH15 : (tile_hbytes = 8)) (PreH16 : (tile_wbytes = 8)) (PreH17 : (input_reset = (xt_neon_input_reset (G)))) (PreH18 : (input_offset = (xt_neon_input_offset (G)))) (PreH19 : (output_reset = (xt_neon_output_reset (G)))) (PreH20 : (0 <= k)) (PreH21 : (k <= ((xt_cols (G)) + 1 ))) (PreH22 : ((k % ( 2 ) ) = 0)) (PreH23 : (block_width = (xt_doz ((xt_cols (G))) (k)))) (PreH24 : (0 < block_width)) (PreH25 : (k < (xt_cols (G)))) (PreH26 : (0 <= bh)) (PreH27 : (bh <= block_height)) (PreH28 : (((block_height - bh ) % ( 2 ) ) = 0)) (PreH29 : (i0 = (xt_current_input (G) (k) ((block_height - bh ))))) (PreH30 : (i1 = (xt_current_input (G) (k) (((block_height - bh ) + 1 ))))) (PreH31 : (o0 = (xt_current_output (G) (k) ((block_height - bh ))))) (PreH32 : (o1 = (xt_current_output (G) ((xt_neon_second (k) (block_width))) ((block_height - bh ))))) (PreH33 : (xt_progress F G old R k (xt_neon_batch (block_width)) (block_height - bh ) )) (PreH34 : ((Z.land bh 1) <> 0)) ,
  ((&(( &( "v1_low" ) )->ₛ "s1")) # UInt  |-> 0)
  **  ((&(( &( "v1_low" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (1)))
  **  ((&(( &( "v1_0" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (0)))
  **  ((&(( &( "v1_0" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (i0) (1)))
  **  ((&(( &( "v1_1" ) )->ₛ "s0")) # UInt  |-> 0)
  **  ((&(( &( "v1_1" ) )->ₛ "s1")) # UInt  |-> 0)
  **  ((&(( &( "v0_low" ) )->ₛ "s1")) # UInt  |-> 0)
  **  ((&(( &( "v0_low" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (0)))
  **  (xt_data F )
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  ((( &( "tile_height" ) )) # UInt64  |-> tile_height)
  **  ((( &( "tile_width" ) )) # UInt64  |-> tile_width)
  **  ((( &( "tile_hbytes" ) )) # UInt64  |-> tile_hbytes)
  **  ((( &( "tile_wbytes" ) )) # UInt64  |-> tile_wbytes)
  **  ((( &( "input_reset" ) )) # UInt64  |-> input_reset)
  **  ((( &( "input_offset" ) )) # UInt64  |-> input_offset)
  **  ((( &( "output_reset" ) )) # UInt64  |-> output_reset)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "bh" ) )) # UInt64  |-> bh)
  **  ((( &( "i0" ) )) # Ptr  |-> i0)
  **  ((( &( "i1" ) )) # Ptr  |-> i1)
  **  ((( &( "o0" ) )) # Ptr  |-> o0)
  **  ((( &( "o1" ) )) # Ptr  |-> o1)
  **  (xt_output W R )
|--
  “ (xt_write_window W o1 1 ) ”
) \/
(
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (R: XTOutput) (o1: Z) (o0: Z) (i1: Z) (i0: Z) (bh: Z) (block_width: Z) (k: Z) (output_reset: Z) (input_offset: Z) (input_reset: Z) (tile_wbytes: Z) (tile_hbytes: Z) (tile_width: Z) (tile_height: Z) (block_height: Z) (output_stride: Z) (input_stride: Z) (output: Z) (input: Z) (PreH1 : (bh <= UINT64_MAX)) (PreH2 : (block_width <= UINT64_MAX)) (PreH3 : (output_reset <= UINT64_MAX)) (PreH4 : (input_offset <= UINT64_MAX)) (PreH5 : (input_reset <= UINT64_MAX)) (PreH6 : (tile_wbytes <= UINT64_MAX)) (PreH7 : (tile_hbytes <= UINT64_MAX)) (PreH8 : (tile_width <= UINT64_MAX)) (PreH9 : (tile_height <= UINT64_MAX)) (PreH10 : (block_height <= UINT64_MAX)) (PreH11 : (output_stride <= UINT64_MAX)) (PreH12 : (input_stride <= UINT64_MAX)) (PreH13 : (bh >= 0)) (PreH14 : (block_width >= 0)) (PreH15 : (output_reset >= 0)) (PreH16 : (input_offset >= 0)) (PreH17 : (input_reset >= 0)) (PreH18 : (tile_wbytes >= 0)) (PreH19 : (tile_hbytes >= 0)) (PreH20 : (tile_width >= 0)) (PreH21 : (tile_height >= 0)) (PreH22 : (block_height >= 0)) (PreH23 : (output_stride >= 0)) (PreH24 : (input_stride >= 0)) (PreH25 : ((xt_load_lane (F) (i0) (0)) <= UINT_MAX)) (PreH26 : ((xt_load_lane (F) (i0) (1)) <= UINT_MAX)) (PreH27 : (0 <= UINT_MAX)) (PreH28 : ((xt_load_lane (F) (i0) (0)) >= 0)) (PreH29 : ((xt_load_lane (F) (i0) (1)) >= 0)) (PreH30 : (0 >= 0)) (PreH31 : (bh <> 0)) (PreH32 : (bh < 2)) (PreH33 : (xt_valid F W G )) (PreH34 : (input = (xt_input (G)))) (PreH35 : (output = (xt_output_base (G)))) (PreH36 : (input_stride = (xt_input_stride (G)))) (PreH37 : (output_stride = (xt_output_stride (G)))) (PreH38 : (block_height = (xt_height (G)))) (PreH39 : (0 < block_height)) (PreH40 : (sizeof(UINT) = 4)) (PreH41 : (sizeof(UINT64) = 8)) (PreH42 : (sizeof(UINT64) = 8)) (PreH43 : (tile_height = 2)) (PreH44 : (tile_width = 2)) (PreH45 : (tile_hbytes = 8)) (PreH46 : (tile_wbytes = 8)) (PreH47 : (input_reset = (xt_neon_input_reset (G)))) (PreH48 : (input_offset = (xt_neon_input_offset (G)))) (PreH49 : (output_reset = (xt_neon_output_reset (G)))) (PreH50 : (0 <= k)) (PreH51 : (k <= ((xt_cols (G)) + 1 ))) (PreH52 : ((k % ( 2 ) ) = 0)) (PreH53 : (block_width = (xt_doz ((xt_cols (G))) (k)))) (PreH54 : (0 < block_width)) (PreH55 : (k < (xt_cols (G)))) (PreH56 : (0 <= bh)) (PreH57 : (bh <= block_height)) (PreH58 : (((block_height - bh ) % ( 2 ) ) = 0)) (PreH59 : (i0 = (xt_current_input (G) (k) ((block_height - bh ))))) (PreH60 : (i1 = (xt_current_input (G) (k) (((block_height - bh ) + 1 ))))) (PreH61 : (o0 = (xt_current_output (G) (k) ((block_height - bh ))))) (PreH62 : (o1 = (xt_current_output (G) ((xt_neon_second (k) (block_width))) ((block_height - bh ))))) (PreH63 : (xt_progress F G old R k (xt_neon_batch (block_width)) (block_height - bh ) )) (PreH64 : ((Z.land bh 1) <> 0)) ,
  ((&(( &( "v1_low" ) )->ₛ "s1")) # UInt  |-> 0)
  **  ((&(( &( "v1_low" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (1)))
  **  ((&(( &( "v1_0" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (0)))
  **  ((&(( &( "v1_0" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (i0) (1)))
  **  ((&(( &( "v1_1" ) )->ₛ "s0")) # UInt  |-> 0)
  **  ((&(( &( "v1_1" ) )->ₛ "s1")) # UInt  |-> 0)
  **  ((&(( &( "v0_low" ) )->ₛ "s1")) # UInt  |-> 0)
  **  ((&(( &( "v0_low" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (0)))
  **  (xt_data F )
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  ((( &( "tile_height" ) )) # UInt64  |-> tile_height)
  **  ((( &( "tile_width" ) )) # UInt64  |-> tile_width)
  **  ((( &( "tile_hbytes" ) )) # UInt64  |-> tile_hbytes)
  **  ((( &( "tile_wbytes" ) )) # UInt64  |-> tile_wbytes)
  **  ((( &( "input_reset" ) )) # UInt64  |-> input_reset)
  **  ((( &( "input_offset" ) )) # UInt64  |-> input_offset)
  **  ((( &( "output_reset" ) )) # UInt64  |-> output_reset)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "bh" ) )) # UInt64  |-> bh)
  **  ((( &( "i0" ) )) # Ptr  |-> i0)
  **  ((( &( "i1" ) )) # Ptr  |-> i1)
  **  ((( &( "o0" ) )) # Ptr  |-> o0)
  **  ((( &( "o1" ) )) # Ptr  |-> o1)
  **  (xt_output W R )
|--
  “ (xt_write_window W o1 1 ) ”
).

Definition test_neon_partial_solve_wit_58_pure_split_goal_1 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (R: XTOutput) (o1: Z) (o0: Z) (i1: Z) (i0: Z) (bh: Z) (block_width: Z) (k: Z) (output_reset: Z) (input_offset: Z) (input_reset: Z) (tile_wbytes: Z) (tile_hbytes: Z) (tile_width: Z) (tile_height: Z) (block_height: Z) (output_stride: Z) (input_stride: Z) (output: Z) (input: Z) (PreH1 : (bh <= UINT64_MAX)) (PreH2 : (block_width <= UINT64_MAX)) (PreH3 : (output_reset <= UINT64_MAX)) (PreH4 : (input_offset <= UINT64_MAX)) (PreH5 : (input_reset <= UINT64_MAX)) (PreH6 : (tile_wbytes <= UINT64_MAX)) (PreH7 : (tile_hbytes <= UINT64_MAX)) (PreH8 : (tile_width <= UINT64_MAX)) (PreH9 : (tile_height <= UINT64_MAX)) (PreH10 : (block_height <= UINT64_MAX)) (PreH11 : (output_stride <= UINT64_MAX)) (PreH12 : (input_stride <= UINT64_MAX)) (PreH13 : (bh >= 0)) (PreH14 : (block_width >= 0)) (PreH15 : (output_reset >= 0)) (PreH16 : (input_offset >= 0)) (PreH17 : (input_reset >= 0)) (PreH18 : (tile_wbytes >= 0)) (PreH19 : (tile_hbytes >= 0)) (PreH20 : (tile_width >= 0)) (PreH21 : (tile_height >= 0)) (PreH22 : (block_height >= 0)) (PreH23 : (output_stride >= 0)) (PreH24 : (input_stride >= 0)) (PreH25 : ((xt_load_lane (F) (i0) (0)) <= UINT_MAX)) (PreH26 : ((xt_load_lane (F) (i0) (1)) <= UINT_MAX)) (PreH27 : (0 <= UINT_MAX)) (PreH28 : ((xt_load_lane (F) (i0) (0)) >= 0)) (PreH29 : ((xt_load_lane (F) (i0) (1)) >= 0)) (PreH30 : (0 >= 0)) (PreH31 : (bh <> 0)) (PreH32 : (bh < 2)) (PreH33 : (xt_valid F W G )) (PreH34 : (input = (xt_input (G)))) (PreH35 : (output = (xt_output_base (G)))) (PreH36 : (input_stride = (xt_input_stride (G)))) (PreH37 : (output_stride = (xt_output_stride (G)))) (PreH38 : (block_height = (xt_height (G)))) (PreH39 : (0 < block_height)) (PreH40 : (sizeof(UINT) = 4)) (PreH41 : (sizeof(UINT64) = 8)) (PreH42 : (sizeof(UINT64) = 8)) (PreH43 : (tile_height = 2)) (PreH44 : (tile_width = 2)) (PreH45 : (tile_hbytes = 8)) (PreH46 : (tile_wbytes = 8)) (PreH47 : (input_reset = (xt_neon_input_reset (G)))) (PreH48 : (input_offset = (xt_neon_input_offset (G)))) (PreH49 : (output_reset = (xt_neon_output_reset (G)))) (PreH50 : (0 <= k)) (PreH51 : (k <= ((xt_cols (G)) + 1 ))) (PreH52 : ((k % ( 2 ) ) = 0)) (PreH53 : (block_width = (xt_doz ((xt_cols (G))) (k)))) (PreH54 : (0 < block_width)) (PreH55 : (k < (xt_cols (G)))) (PreH56 : (0 <= bh)) (PreH57 : (bh <= block_height)) (PreH58 : (((block_height - bh ) % ( 2 ) ) = 0)) (PreH59 : (i0 = (xt_current_input (G) (k) ((block_height - bh ))))) (PreH60 : (i1 = (xt_current_input (G) (k) (((block_height - bh ) + 1 ))))) (PreH61 : (o0 = (xt_current_output (G) (k) ((block_height - bh ))))) (PreH62 : (o1 = (xt_current_output (G) ((xt_neon_second (k) (block_width))) ((block_height - bh ))))) (PreH63 : (xt_progress F G old R k (xt_neon_batch (block_width)) (block_height - bh ) )) (PreH64 : ((Z.land bh 1) <> 0)) ,
  ((&(( &( "v1_low" ) )->ₛ "s1")) # UInt  |-> 0)
  **  ((&(( &( "v1_low" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (1)))
  **  ((&(( &( "v1_0" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (0)))
  **  ((&(( &( "v1_0" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (i0) (1)))
  **  ((&(( &( "v1_1" ) )->ₛ "s0")) # UInt  |-> 0)
  **  ((&(( &( "v1_1" ) )->ₛ "s1")) # UInt  |-> 0)
  **  ((&(( &( "v0_low" ) )->ₛ "s1")) # UInt  |-> 0)
  **  ((&(( &( "v0_low" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (0)))
  **  (xt_data F )
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  ((( &( "tile_height" ) )) # UInt64  |-> tile_height)
  **  ((( &( "tile_width" ) )) # UInt64  |-> tile_width)
  **  ((( &( "tile_hbytes" ) )) # UInt64  |-> tile_hbytes)
  **  ((( &( "tile_wbytes" ) )) # UInt64  |-> tile_wbytes)
  **  ((( &( "input_reset" ) )) # UInt64  |-> input_reset)
  **  ((( &( "input_offset" ) )) # UInt64  |-> input_offset)
  **  ((( &( "output_reset" ) )) # UInt64  |-> output_reset)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "bh" ) )) # UInt64  |-> bh)
  **  ((( &( "i0" ) )) # Ptr  |-> i0)
  **  ((( &( "i1" ) )) # Ptr  |-> i1)
  **  ((( &( "o0" ) )) # Ptr  |-> o0)
  **  ((( &( "o1" ) )) # Ptr  |-> o1)
  **  (xt_output W R )
|--
  “ (xt_write_window W o1 1 ) ”
.

Definition test_neon_partial_solve_wit_58_aux := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (R: XTOutput) (o1: Z) (o0: Z) (i1: Z) (i0: Z) (bh: Z) (block_width: Z) (k: Z) (output_reset: Z) (input_offset: Z) (input_reset: Z) (tile_wbytes: Z) (tile_hbytes: Z) (tile_width: Z) (tile_height: Z) (block_height: Z) (output_stride: Z) (input_stride: Z) (output: Z) (input: Z) (PreH1 : (bh <> 0)) (PreH2 : (bh < 2)) (PreH3 : (xt_valid F W G )) (PreH4 : (input = (xt_input (G)))) (PreH5 : (output = (xt_output_base (G)))) (PreH6 : (input_stride = (xt_input_stride (G)))) (PreH7 : (output_stride = (xt_output_stride (G)))) (PreH8 : (block_height = (xt_height (G)))) (PreH9 : (0 < block_height)) (PreH10 : (sizeof(UINT) = 4)) (PreH11 : (sizeof(UINT64) = 8)) (PreH12 : (sizeof(UINT64) = 8)) (PreH13 : (tile_height = 2)) (PreH14 : (tile_width = 2)) (PreH15 : (tile_hbytes = 8)) (PreH16 : (tile_wbytes = 8)) (PreH17 : (input_reset = (xt_neon_input_reset (G)))) (PreH18 : (input_offset = (xt_neon_input_offset (G)))) (PreH19 : (output_reset = (xt_neon_output_reset (G)))) (PreH20 : (0 <= k)) (PreH21 : (k <= ((xt_cols (G)) + 1 ))) (PreH22 : ((k % ( 2 ) ) = 0)) (PreH23 : (block_width = (xt_doz ((xt_cols (G))) (k)))) (PreH24 : (0 < block_width)) (PreH25 : (k < (xt_cols (G)))) (PreH26 : (0 <= bh)) (PreH27 : (bh <= block_height)) (PreH28 : (((block_height - bh ) % ( 2 ) ) = 0)) (PreH29 : (i0 = (xt_current_input (G) (k) ((block_height - bh ))))) (PreH30 : (i1 = (xt_current_input (G) (k) (((block_height - bh ) + 1 ))))) (PreH31 : (o0 = (xt_current_output (G) (k) ((block_height - bh ))))) (PreH32 : (o1 = (xt_current_output (G) ((xt_neon_second (k) (block_width))) ((block_height - bh ))))) (PreH33 : (xt_progress F G old R k (xt_neon_batch (block_width)) (block_height - bh ) )) (PreH34 : ((Z.land bh 1) <> 0)) ,
  ((&(( &( "v1_low" ) )->ₛ "s1")) # UInt  |-> 0)
  **  ((&(( &( "v1_low" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (1)))
  **  ((&(( &( "v1_0" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (0)))
  **  ((&(( &( "v1_0" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (i0) (1)))
  **  ((&(( &( "v1_1" ) )->ₛ "s0")) # UInt  |-> 0)
  **  ((&(( &( "v1_1" ) )->ₛ "s1")) # UInt  |-> 0)
  **  ((&(( &( "v0_low" ) )->ₛ "s1")) # UInt  |-> 0)
  **  ((&(( &( "v0_low" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (0)))
  **  (xt_data F )
  **  (xt_output W R )
|--
  “ (xt_write_window W o1 1 ) ” 
  &&  “ (bh <> 0) ” 
  &&  “ (bh < 2) ” 
  &&  “ (xt_valid F W G ) ” 
  &&  “ (input = (xt_input (G))) ” 
  &&  “ (output = (xt_output_base (G))) ” 
  &&  “ (input_stride = (xt_input_stride (G))) ” 
  &&  “ (output_stride = (xt_output_stride (G))) ” 
  &&  “ (block_height = (xt_height (G))) ” 
  &&  “ (0 < block_height) ” 
  &&  “ (sizeof(UINT) = 4) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (tile_height = 2) ” 
  &&  “ (tile_width = 2) ” 
  &&  “ (tile_hbytes = 8) ” 
  &&  “ (tile_wbytes = 8) ” 
  &&  “ (input_reset = (xt_neon_input_reset (G))) ” 
  &&  “ (input_offset = (xt_neon_input_offset (G))) ” 
  &&  “ (output_reset = (xt_neon_output_reset (G))) ” 
  &&  “ (0 <= k) ” 
  &&  “ (k <= ((xt_cols (G)) + 1 )) ” 
  &&  “ ((k % ( 2 ) ) = 0) ” 
  &&  “ (block_width = (xt_doz ((xt_cols (G))) (k))) ” 
  &&  “ (0 < block_width) ” 
  &&  “ (k < (xt_cols (G))) ” 
  &&  “ (0 <= bh) ” 
  &&  “ (bh <= block_height) ” 
  &&  “ (((block_height - bh ) % ( 2 ) ) = 0) ” 
  &&  “ (i0 = (xt_current_input (G) (k) ((block_height - bh )))) ” 
  &&  “ (i1 = (xt_current_input (G) (k) (((block_height - bh ) + 1 )))) ” 
  &&  “ (o0 = (xt_current_output (G) (k) ((block_height - bh )))) ” 
  &&  “ (o1 = (xt_current_output (G) ((xt_neon_second (k) (block_width))) ((block_height - bh )))) ” 
  &&  “ (xt_progress F G old R k (xt_neon_batch (block_width)) (block_height - bh ) ) ” 
  &&  “ ((Z.land bh 1) <> 0) ”
  &&  (xt_output W R )
  **  ((&(( &( "v1_low" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (1)))
  **  ((&(( &( "v1_low" ) )->ₛ "s1")) # UInt  |-> 0)
  **  ((&(( &( "v1_0" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (0)))
  **  ((&(( &( "v1_0" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (i0) (1)))
  **  ((&(( &( "v1_1" ) )->ₛ "s0")) # UInt  |-> 0)
  **  ((&(( &( "v1_1" ) )->ₛ "s1")) # UInt  |-> 0)
  **  ((&(( &( "v0_low" ) )->ₛ "s1")) # UInt  |-> 0)
  **  ((&(( &( "v0_low" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (0)))
  **  (xt_data F )
.

Definition test_neon_partial_solve_wit_58 := test_neon_partial_solve_wit_58_pure -> test_neon_partial_solve_wit_58_aux.

Definition test_neon_partial_solve_wit_59_pure := 
(
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (R: XTOutput) (o1: Z) (o0: Z) (i1: Z) (i0: Z) (bh: Z) (block_width: Z) (k: Z) (output_reset: Z) (input_offset: Z) (input_reset: Z) (tile_wbytes: Z) (tile_hbytes: Z) (tile_width: Z) (tile_height: Z) (block_height: Z) (output_stride: Z) (input_stride: Z) (output: Z) (input: Z) (PreH1 : (bh <> 0)) (PreH2 : (bh < 2)) (PreH3 : (xt_valid F W G )) (PreH4 : (input = (xt_input (G)))) (PreH5 : (output = (xt_output_base (G)))) (PreH6 : (input_stride = (xt_input_stride (G)))) (PreH7 : (output_stride = (xt_output_stride (G)))) (PreH8 : (block_height = (xt_height (G)))) (PreH9 : (0 < block_height)) (PreH10 : (sizeof(UINT) = 4)) (PreH11 : (sizeof(UINT64) = 8)) (PreH12 : (sizeof(UINT64) = 8)) (PreH13 : (tile_height = 2)) (PreH14 : (tile_width = 2)) (PreH15 : (tile_hbytes = 8)) (PreH16 : (tile_wbytes = 8)) (PreH17 : (input_reset = (xt_neon_input_reset (G)))) (PreH18 : (input_offset = (xt_neon_input_offset (G)))) (PreH19 : (output_reset = (xt_neon_output_reset (G)))) (PreH20 : (0 <= k)) (PreH21 : (k <= ((xt_cols (G)) + 1 ))) (PreH22 : ((k % ( 2 ) ) = 0)) (PreH23 : (block_width = (xt_doz ((xt_cols (G))) (k)))) (PreH24 : (0 < block_width)) (PreH25 : (k < (xt_cols (G)))) (PreH26 : (0 <= bh)) (PreH27 : (bh <= block_height)) (PreH28 : (((block_height - bh ) % ( 2 ) ) = 0)) (PreH29 : (i0 = (xt_current_input (G) (k) ((block_height - bh ))))) (PreH30 : (i1 = (xt_current_input (G) (k) (((block_height - bh ) + 1 ))))) (PreH31 : (o0 = (xt_current_output (G) (k) ((block_height - bh ))))) (PreH32 : (o1 = (xt_current_output (G) ((xt_neon_second (k) (block_width))) ((block_height - bh ))))) (PreH33 : (xt_progress F G old R k (xt_neon_batch (block_width)) (block_height - bh ) )) (PreH34 : ((Z.land bh 1) <> 0)) ,
  (xt_output W (xt_output_put (R) (o1) ((xt_load_lane (F) (i0) (1)))) )
  **  ((&(( &( "v1_low" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (1)))
  **  ((&(( &( "v1_low" ) )->ₛ "s1")) # UInt  |-> 0)
  **  ((&(( &( "v1_0" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (0)))
  **  ((&(( &( "v1_0" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (i0) (1)))
  **  ((&(( &( "v1_1" ) )->ₛ "s0")) # UInt  |-> 0)
  **  ((&(( &( "v1_1" ) )->ₛ "s1")) # UInt  |-> 0)
  **  ((&(( &( "v0_low" ) )->ₛ "s1")) # UInt  |-> 0)
  **  ((&(( &( "v0_low" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (0)))
  **  (xt_data F )
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  ((( &( "tile_height" ) )) # UInt64  |-> tile_height)
  **  ((( &( "tile_width" ) )) # UInt64  |-> tile_width)
  **  ((( &( "tile_hbytes" ) )) # UInt64  |-> tile_hbytes)
  **  ((( &( "tile_wbytes" ) )) # UInt64  |-> tile_wbytes)
  **  ((( &( "input_reset" ) )) # UInt64  |-> input_reset)
  **  ((( &( "input_offset" ) )) # UInt64  |-> input_offset)
  **  ((( &( "output_reset" ) )) # UInt64  |-> output_reset)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "bh" ) )) # UInt64  |-> bh)
  **  ((( &( "i0" ) )) # Ptr  |-> i0)
  **  ((( &( "i1" ) )) # Ptr  |-> i1)
  **  ((( &( "o0" ) )) # Ptr  |-> o0)
  **  ((( &( "o1" ) )) # Ptr  |-> o1)
|--
  “ (xt_write_window W o0 1 ) ”
) \/
(
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (R: XTOutput) (o1: Z) (o0: Z) (i1: Z) (i0: Z) (bh: Z) (block_width: Z) (k: Z) (output_reset: Z) (input_offset: Z) (input_reset: Z) (tile_wbytes: Z) (tile_hbytes: Z) (tile_width: Z) (tile_height: Z) (block_height: Z) (output_stride: Z) (input_stride: Z) (output: Z) (input: Z) (PreH1 : (bh <= UINT64_MAX)) (PreH2 : (block_width <= UINT64_MAX)) (PreH3 : (output_reset <= UINT64_MAX)) (PreH4 : (input_offset <= UINT64_MAX)) (PreH5 : (input_reset <= UINT64_MAX)) (PreH6 : (tile_wbytes <= UINT64_MAX)) (PreH7 : (tile_hbytes <= UINT64_MAX)) (PreH8 : (tile_width <= UINT64_MAX)) (PreH9 : (tile_height <= UINT64_MAX)) (PreH10 : (block_height <= UINT64_MAX)) (PreH11 : (output_stride <= UINT64_MAX)) (PreH12 : (input_stride <= UINT64_MAX)) (PreH13 : (bh >= 0)) (PreH14 : (block_width >= 0)) (PreH15 : (output_reset >= 0)) (PreH16 : (input_offset >= 0)) (PreH17 : (input_reset >= 0)) (PreH18 : (tile_wbytes >= 0)) (PreH19 : (tile_hbytes >= 0)) (PreH20 : (tile_width >= 0)) (PreH21 : (tile_height >= 0)) (PreH22 : (block_height >= 0)) (PreH23 : (output_stride >= 0)) (PreH24 : (input_stride >= 0)) (PreH25 : ((xt_load_lane (F) (i0) (0)) <= UINT_MAX)) (PreH26 : (0 <= UINT_MAX)) (PreH27 : ((xt_load_lane (F) (i0) (1)) <= UINT_MAX)) (PreH28 : ((xt_load_lane (F) (i0) (0)) >= 0)) (PreH29 : (0 >= 0)) (PreH30 : ((xt_load_lane (F) (i0) (1)) >= 0)) (PreH31 : (bh <> 0)) (PreH32 : (bh < 2)) (PreH33 : (xt_valid F W G )) (PreH34 : (input = (xt_input (G)))) (PreH35 : (output = (xt_output_base (G)))) (PreH36 : (input_stride = (xt_input_stride (G)))) (PreH37 : (output_stride = (xt_output_stride (G)))) (PreH38 : (block_height = (xt_height (G)))) (PreH39 : (0 < block_height)) (PreH40 : (sizeof(UINT) = 4)) (PreH41 : (sizeof(UINT64) = 8)) (PreH42 : (sizeof(UINT64) = 8)) (PreH43 : (tile_height = 2)) (PreH44 : (tile_width = 2)) (PreH45 : (tile_hbytes = 8)) (PreH46 : (tile_wbytes = 8)) (PreH47 : (input_reset = (xt_neon_input_reset (G)))) (PreH48 : (input_offset = (xt_neon_input_offset (G)))) (PreH49 : (output_reset = (xt_neon_output_reset (G)))) (PreH50 : (0 <= k)) (PreH51 : (k <= ((xt_cols (G)) + 1 ))) (PreH52 : ((k % ( 2 ) ) = 0)) (PreH53 : (block_width = (xt_doz ((xt_cols (G))) (k)))) (PreH54 : (0 < block_width)) (PreH55 : (k < (xt_cols (G)))) (PreH56 : (0 <= bh)) (PreH57 : (bh <= block_height)) (PreH58 : (((block_height - bh ) % ( 2 ) ) = 0)) (PreH59 : (i0 = (xt_current_input (G) (k) ((block_height - bh ))))) (PreH60 : (i1 = (xt_current_input (G) (k) (((block_height - bh ) + 1 ))))) (PreH61 : (o0 = (xt_current_output (G) (k) ((block_height - bh ))))) (PreH62 : (o1 = (xt_current_output (G) ((xt_neon_second (k) (block_width))) ((block_height - bh ))))) (PreH63 : (xt_progress F G old R k (xt_neon_batch (block_width)) (block_height - bh ) )) (PreH64 : ((Z.land bh 1) <> 0)) ,
  (xt_output W (xt_output_put (R) (o1) ((xt_load_lane (F) (i0) (1)))) )
  **  ((&(( &( "v1_low" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (1)))
  **  ((&(( &( "v1_low" ) )->ₛ "s1")) # UInt  |-> 0)
  **  ((&(( &( "v1_0" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (0)))
  **  ((&(( &( "v1_0" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (i0) (1)))
  **  ((&(( &( "v1_1" ) )->ₛ "s0")) # UInt  |-> 0)
  **  ((&(( &( "v1_1" ) )->ₛ "s1")) # UInt  |-> 0)
  **  ((&(( &( "v0_low" ) )->ₛ "s1")) # UInt  |-> 0)
  **  ((&(( &( "v0_low" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (0)))
  **  (xt_data F )
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  ((( &( "tile_height" ) )) # UInt64  |-> tile_height)
  **  ((( &( "tile_width" ) )) # UInt64  |-> tile_width)
  **  ((( &( "tile_hbytes" ) )) # UInt64  |-> tile_hbytes)
  **  ((( &( "tile_wbytes" ) )) # UInt64  |-> tile_wbytes)
  **  ((( &( "input_reset" ) )) # UInt64  |-> input_reset)
  **  ((( &( "input_offset" ) )) # UInt64  |-> input_offset)
  **  ((( &( "output_reset" ) )) # UInt64  |-> output_reset)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "bh" ) )) # UInt64  |-> bh)
  **  ((( &( "i0" ) )) # Ptr  |-> i0)
  **  ((( &( "i1" ) )) # Ptr  |-> i1)
  **  ((( &( "o0" ) )) # Ptr  |-> o0)
  **  ((( &( "o1" ) )) # Ptr  |-> o1)
|--
  “ (xt_write_window W o0 1 ) ”
).

Definition test_neon_partial_solve_wit_59_pure_split_goal_1 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (R: XTOutput) (o1: Z) (o0: Z) (i1: Z) (i0: Z) (bh: Z) (block_width: Z) (k: Z) (output_reset: Z) (input_offset: Z) (input_reset: Z) (tile_wbytes: Z) (tile_hbytes: Z) (tile_width: Z) (tile_height: Z) (block_height: Z) (output_stride: Z) (input_stride: Z) (output: Z) (input: Z) (PreH1 : (bh <= UINT64_MAX)) (PreH2 : (block_width <= UINT64_MAX)) (PreH3 : (output_reset <= UINT64_MAX)) (PreH4 : (input_offset <= UINT64_MAX)) (PreH5 : (input_reset <= UINT64_MAX)) (PreH6 : (tile_wbytes <= UINT64_MAX)) (PreH7 : (tile_hbytes <= UINT64_MAX)) (PreH8 : (tile_width <= UINT64_MAX)) (PreH9 : (tile_height <= UINT64_MAX)) (PreH10 : (block_height <= UINT64_MAX)) (PreH11 : (output_stride <= UINT64_MAX)) (PreH12 : (input_stride <= UINT64_MAX)) (PreH13 : (bh >= 0)) (PreH14 : (block_width >= 0)) (PreH15 : (output_reset >= 0)) (PreH16 : (input_offset >= 0)) (PreH17 : (input_reset >= 0)) (PreH18 : (tile_wbytes >= 0)) (PreH19 : (tile_hbytes >= 0)) (PreH20 : (tile_width >= 0)) (PreH21 : (tile_height >= 0)) (PreH22 : (block_height >= 0)) (PreH23 : (output_stride >= 0)) (PreH24 : (input_stride >= 0)) (PreH25 : ((xt_load_lane (F) (i0) (0)) <= UINT_MAX)) (PreH26 : (0 <= UINT_MAX)) (PreH27 : ((xt_load_lane (F) (i0) (1)) <= UINT_MAX)) (PreH28 : ((xt_load_lane (F) (i0) (0)) >= 0)) (PreH29 : (0 >= 0)) (PreH30 : ((xt_load_lane (F) (i0) (1)) >= 0)) (PreH31 : (bh <> 0)) (PreH32 : (bh < 2)) (PreH33 : (xt_valid F W G )) (PreH34 : (input = (xt_input (G)))) (PreH35 : (output = (xt_output_base (G)))) (PreH36 : (input_stride = (xt_input_stride (G)))) (PreH37 : (output_stride = (xt_output_stride (G)))) (PreH38 : (block_height = (xt_height (G)))) (PreH39 : (0 < block_height)) (PreH40 : (sizeof(UINT) = 4)) (PreH41 : (sizeof(UINT64) = 8)) (PreH42 : (sizeof(UINT64) = 8)) (PreH43 : (tile_height = 2)) (PreH44 : (tile_width = 2)) (PreH45 : (tile_hbytes = 8)) (PreH46 : (tile_wbytes = 8)) (PreH47 : (input_reset = (xt_neon_input_reset (G)))) (PreH48 : (input_offset = (xt_neon_input_offset (G)))) (PreH49 : (output_reset = (xt_neon_output_reset (G)))) (PreH50 : (0 <= k)) (PreH51 : (k <= ((xt_cols (G)) + 1 ))) (PreH52 : ((k % ( 2 ) ) = 0)) (PreH53 : (block_width = (xt_doz ((xt_cols (G))) (k)))) (PreH54 : (0 < block_width)) (PreH55 : (k < (xt_cols (G)))) (PreH56 : (0 <= bh)) (PreH57 : (bh <= block_height)) (PreH58 : (((block_height - bh ) % ( 2 ) ) = 0)) (PreH59 : (i0 = (xt_current_input (G) (k) ((block_height - bh ))))) (PreH60 : (i1 = (xt_current_input (G) (k) (((block_height - bh ) + 1 ))))) (PreH61 : (o0 = (xt_current_output (G) (k) ((block_height - bh ))))) (PreH62 : (o1 = (xt_current_output (G) ((xt_neon_second (k) (block_width))) ((block_height - bh ))))) (PreH63 : (xt_progress F G old R k (xt_neon_batch (block_width)) (block_height - bh ) )) (PreH64 : ((Z.land bh 1) <> 0)) ,
  (xt_output W (xt_output_put (R) (o1) ((xt_load_lane (F) (i0) (1)))) )
  **  ((&(( &( "v1_low" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (1)))
  **  ((&(( &( "v1_low" ) )->ₛ "s1")) # UInt  |-> 0)
  **  ((&(( &( "v1_0" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (0)))
  **  ((&(( &( "v1_0" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (i0) (1)))
  **  ((&(( &( "v1_1" ) )->ₛ "s0")) # UInt  |-> 0)
  **  ((&(( &( "v1_1" ) )->ₛ "s1")) # UInt  |-> 0)
  **  ((&(( &( "v0_low" ) )->ₛ "s1")) # UInt  |-> 0)
  **  ((&(( &( "v0_low" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (0)))
  **  (xt_data F )
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "input_stride" ) )) # UInt64  |-> input_stride)
  **  ((( &( "output_stride" ) )) # UInt64  |-> output_stride)
  **  ((( &( "block_height" ) )) # UInt64  |-> block_height)
  **  ((( &( "tile_height" ) )) # UInt64  |-> tile_height)
  **  ((( &( "tile_width" ) )) # UInt64  |-> tile_width)
  **  ((( &( "tile_hbytes" ) )) # UInt64  |-> tile_hbytes)
  **  ((( &( "tile_wbytes" ) )) # UInt64  |-> tile_wbytes)
  **  ((( &( "input_reset" ) )) # UInt64  |-> input_reset)
  **  ((( &( "input_offset" ) )) # UInt64  |-> input_offset)
  **  ((( &( "output_reset" ) )) # UInt64  |-> output_reset)
  **  ((( &( "block_width" ) )) # UInt64  |-> block_width)
  **  ((( &( "bh" ) )) # UInt64  |-> bh)
  **  ((( &( "i0" ) )) # Ptr  |-> i0)
  **  ((( &( "i1" ) )) # Ptr  |-> i1)
  **  ((( &( "o0" ) )) # Ptr  |-> o0)
  **  ((( &( "o1" ) )) # Ptr  |-> o1)
|--
  “ (xt_write_window W o0 1 ) ”
.

Definition test_neon_partial_solve_wit_59_aux := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (R: XTOutput) (o1: Z) (o0: Z) (i1: Z) (i0: Z) (bh: Z) (block_width: Z) (k: Z) (output_reset: Z) (input_offset: Z) (input_reset: Z) (tile_wbytes: Z) (tile_hbytes: Z) (tile_width: Z) (tile_height: Z) (block_height: Z) (output_stride: Z) (input_stride: Z) (output: Z) (input: Z) (PreH1 : (bh <> 0)) (PreH2 : (bh < 2)) (PreH3 : (xt_valid F W G )) (PreH4 : (input = (xt_input (G)))) (PreH5 : (output = (xt_output_base (G)))) (PreH6 : (input_stride = (xt_input_stride (G)))) (PreH7 : (output_stride = (xt_output_stride (G)))) (PreH8 : (block_height = (xt_height (G)))) (PreH9 : (0 < block_height)) (PreH10 : (sizeof(UINT) = 4)) (PreH11 : (sizeof(UINT64) = 8)) (PreH12 : (sizeof(UINT64) = 8)) (PreH13 : (tile_height = 2)) (PreH14 : (tile_width = 2)) (PreH15 : (tile_hbytes = 8)) (PreH16 : (tile_wbytes = 8)) (PreH17 : (input_reset = (xt_neon_input_reset (G)))) (PreH18 : (input_offset = (xt_neon_input_offset (G)))) (PreH19 : (output_reset = (xt_neon_output_reset (G)))) (PreH20 : (0 <= k)) (PreH21 : (k <= ((xt_cols (G)) + 1 ))) (PreH22 : ((k % ( 2 ) ) = 0)) (PreH23 : (block_width = (xt_doz ((xt_cols (G))) (k)))) (PreH24 : (0 < block_width)) (PreH25 : (k < (xt_cols (G)))) (PreH26 : (0 <= bh)) (PreH27 : (bh <= block_height)) (PreH28 : (((block_height - bh ) % ( 2 ) ) = 0)) (PreH29 : (i0 = (xt_current_input (G) (k) ((block_height - bh ))))) (PreH30 : (i1 = (xt_current_input (G) (k) (((block_height - bh ) + 1 ))))) (PreH31 : (o0 = (xt_current_output (G) (k) ((block_height - bh ))))) (PreH32 : (o1 = (xt_current_output (G) ((xt_neon_second (k) (block_width))) ((block_height - bh ))))) (PreH33 : (xt_progress F G old R k (xt_neon_batch (block_width)) (block_height - bh ) )) (PreH34 : ((Z.land bh 1) <> 0)) ,
  (xt_output W (xt_output_put (R) (o1) ((xt_load_lane (F) (i0) (1)))) )
  **  ((&(( &( "v1_low" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (1)))
  **  ((&(( &( "v1_low" ) )->ₛ "s1")) # UInt  |-> 0)
  **  ((&(( &( "v1_0" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (0)))
  **  ((&(( &( "v1_0" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (i0) (1)))
  **  ((&(( &( "v1_1" ) )->ₛ "s0")) # UInt  |-> 0)
  **  ((&(( &( "v1_1" ) )->ₛ "s1")) # UInt  |-> 0)
  **  ((&(( &( "v0_low" ) )->ₛ "s1")) # UInt  |-> 0)
  **  ((&(( &( "v0_low" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (0)))
  **  (xt_data F )
|--
  “ (xt_write_window W o0 1 ) ” 
  &&  “ (bh <> 0) ” 
  &&  “ (bh < 2) ” 
  &&  “ (xt_valid F W G ) ” 
  &&  “ (input = (xt_input (G))) ” 
  &&  “ (output = (xt_output_base (G))) ” 
  &&  “ (input_stride = (xt_input_stride (G))) ” 
  &&  “ (output_stride = (xt_output_stride (G))) ” 
  &&  “ (block_height = (xt_height (G))) ” 
  &&  “ (0 < block_height) ” 
  &&  “ (sizeof(UINT) = 4) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (tile_height = 2) ” 
  &&  “ (tile_width = 2) ” 
  &&  “ (tile_hbytes = 8) ” 
  &&  “ (tile_wbytes = 8) ” 
  &&  “ (input_reset = (xt_neon_input_reset (G))) ” 
  &&  “ (input_offset = (xt_neon_input_offset (G))) ” 
  &&  “ (output_reset = (xt_neon_output_reset (G))) ” 
  &&  “ (0 <= k) ” 
  &&  “ (k <= ((xt_cols (G)) + 1 )) ” 
  &&  “ ((k % ( 2 ) ) = 0) ” 
  &&  “ (block_width = (xt_doz ((xt_cols (G))) (k))) ” 
  &&  “ (0 < block_width) ” 
  &&  “ (k < (xt_cols (G))) ” 
  &&  “ (0 <= bh) ” 
  &&  “ (bh <= block_height) ” 
  &&  “ (((block_height - bh ) % ( 2 ) ) = 0) ” 
  &&  “ (i0 = (xt_current_input (G) (k) ((block_height - bh )))) ” 
  &&  “ (i1 = (xt_current_input (G) (k) (((block_height - bh ) + 1 )))) ” 
  &&  “ (o0 = (xt_current_output (G) (k) ((block_height - bh )))) ” 
  &&  “ (o1 = (xt_current_output (G) ((xt_neon_second (k) (block_width))) ((block_height - bh )))) ” 
  &&  “ (xt_progress F G old R k (xt_neon_batch (block_width)) (block_height - bh ) ) ” 
  &&  “ ((Z.land bh 1) <> 0) ”
  &&  (xt_output W (xt_output_put (R) ((xt_current_output (G) ((xt_neon_second (k) (block_width))) ((block_height - bh )))) ((xt_load_lane (F) ((xt_current_input (G) (k) ((block_height - bh )))) (1)))) )
  **  ((&(( &( "v0_low" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (0)))
  **  ((&(( &( "v0_low" ) )->ₛ "s1")) # UInt  |-> 0)
  **  ((&(( &( "v1_low" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (1)))
  **  ((&(( &( "v1_low" ) )->ₛ "s1")) # UInt  |-> 0)
  **  ((&(( &( "v1_0" ) )->ₛ "s0")) # UInt  |-> (xt_load_lane (F) (i0) (0)))
  **  ((&(( &( "v1_0" ) )->ₛ "s1")) # UInt  |-> (xt_load_lane (F) (i0) (1)))
  **  ((&(( &( "v1_1" ) )->ₛ "s0")) # UInt  |-> 0)
  **  ((&(( &( "v1_1" ) )->ₛ "s1")) # UInt  |-> 0)
  **  (xt_data F )
.

Definition test_neon_partial_solve_wit_59 := test_neon_partial_solve_wit_59_pure -> test_neon_partial_solve_wit_59_aux.

Definition test_neon_partial_solve_wit_60 := 
forall (G: XTLayout) (old: XTOutput) (W: (@list Z)) (F: XTMap) (k: Z) (R: XTOutput) (input: Z) (output: Z) (input_stride: Z) (output_stride: Z) (block_height: Z) (tile_height: Z) (tile_width: Z) (tile_hbytes: Z) (tile_wbytes: Z) (input_reset: Z) (input_offset: Z) (output_reset: Z) (block_width: Z) (bh: Z) (i0: Z) (i1: Z) (o0: Z) (o1: Z) (PreH1 : (xt_valid F W G )) (PreH2 : (input = (xt_input (G)))) (PreH3 : (output = (xt_output_base (G)))) (PreH4 : (input_stride = (xt_input_stride (G)))) (PreH5 : (output_stride = (xt_output_stride (G)))) (PreH6 : (block_height = (xt_height (G)))) (PreH7 : (0 < block_height)) (PreH8 : (sizeof(UINT) = 4)) (PreH9 : (sizeof(UINT64) = 8)) (PreH10 : (sizeof(UINT64) = 8)) (PreH11 : (tile_height = 2)) (PreH12 : (tile_width = 2)) (PreH13 : (tile_hbytes = 8)) (PreH14 : (tile_wbytes = 8)) (PreH15 : (input_reset = (xt_neon_input_reset (G)))) (PreH16 : (input_offset = (xt_neon_input_offset (G)))) (PreH17 : (output_reset = (xt_neon_output_reset (G)))) (PreH18 : (0 <= k)) (PreH19 : (k <= ((xt_cols (G)) + 1 ))) (PreH20 : ((k % ( 2 ) ) = 0)) (PreH21 : (block_width = (xt_doz ((xt_cols (G))) (k)))) (PreH22 : (0 < block_width)) (PreH23 : (k < (xt_cols (G)))) (PreH24 : (0 <= bh)) (PreH25 : (bh <= 1)) (PreH26 : (((block_height - bh ) % ( 2 ) ) = 0)) (PreH27 : (i0 = (xt_current_input (G) (k) ((block_height - bh ))))) (PreH28 : (i1 = (xt_current_input (G) (k) (((block_height - bh ) + 1 ))))) (PreH29 : (o0 = (xt_current_output (G) (k) ((block_height - bh ))))) (PreH30 : (o1 = (xt_current_output (G) ((xt_neon_second (k) (block_width))) ((block_height - bh ))))) (PreH31 : (xt_progress F G old R k (xt_neon_batch (block_width)) block_height )) ,
  (xt_data F )
  **  (xt_output W R )
|--
  “ (xt_valid F W G ) ” 
  &&  “ (input = (xt_input (G))) ” 
  &&  “ (output = (xt_output_base (G))) ” 
  &&  “ (input_stride = (xt_input_stride (G))) ” 
  &&  “ (output_stride = (xt_output_stride (G))) ” 
  &&  “ (block_height = (xt_height (G))) ” 
  &&  “ (0 < block_height) ” 
  &&  “ (sizeof(UINT) = 4) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (sizeof(UINT64) = 8) ” 
  &&  “ (tile_height = 2) ” 
  &&  “ (tile_width = 2) ” 
  &&  “ (tile_hbytes = 8) ” 
  &&  “ (tile_wbytes = 8) ” 
  &&  “ (input_reset = (xt_neon_input_reset (G))) ” 
  &&  “ (input_offset = (xt_neon_input_offset (G))) ” 
  &&  “ (output_reset = (xt_neon_output_reset (G))) ” 
  &&  “ (0 <= k) ” 
  &&  “ (k <= ((xt_cols (G)) + 1 )) ” 
  &&  “ ((k % ( 2 ) ) = 0) ” 
  &&  “ (block_width = (xt_doz ((xt_cols (G))) (k))) ” 
  &&  “ (0 < block_width) ” 
  &&  “ (k < (xt_cols (G))) ” 
  &&  “ (0 <= bh) ” 
  &&  “ (bh <= 1) ” 
  &&  “ (((block_height - bh ) % ( 2 ) ) = 0) ” 
  &&  “ (i0 = (xt_current_input (G) (k) ((block_height - bh )))) ” 
  &&  “ (i1 = (xt_current_input (G) (k) (((block_height - bh ) + 1 )))) ” 
  &&  “ (o0 = (xt_current_output (G) (k) ((block_height - bh )))) ” 
  &&  “ (o1 = (xt_current_output (G) ((xt_neon_second (k) (block_width))) ((block_height - bh )))) ” 
  &&  “ (xt_progress F G old R k (xt_neon_batch (block_width)) block_height ) ”
  &&  (xt_data F )
  **  (xt_output W R )
.

Module Type VC_Correct.


Axiom proof_of_test_neon_safety_wit_1 : test_neon_safety_wit_1.
Axiom proof_of_test_neon_safety_wit_2 : test_neon_safety_wit_2.
Axiom proof_of_test_neon_safety_wit_3 : test_neon_safety_wit_3.
Axiom proof_of_test_neon_safety_wit_4 : test_neon_safety_wit_4.
Axiom proof_of_test_neon_safety_wit_5 : test_neon_safety_wit_5.
Axiom proof_of_test_neon_safety_wit_6 : test_neon_safety_wit_6.
Axiom proof_of_test_neon_safety_wit_7 : test_neon_safety_wit_7.
Axiom proof_of_test_neon_safety_wit_8 : test_neon_safety_wit_8.
Axiom proof_of_test_neon_safety_wit_9 : test_neon_safety_wit_9.
Axiom proof_of_test_neon_safety_wit_10 : test_neon_safety_wit_10.
Axiom proof_of_test_neon_safety_wit_11 : test_neon_safety_wit_11.
Axiom proof_of_test_neon_safety_wit_12 : test_neon_safety_wit_12.
Axiom proof_of_test_neon_safety_wit_13 : test_neon_safety_wit_13.
Axiom proof_of_test_neon_safety_wit_14 : test_neon_safety_wit_14.
Axiom proof_of_test_neon_safety_wit_15 : test_neon_safety_wit_15.
Axiom proof_of_test_neon_safety_wit_16 : test_neon_safety_wit_16.
Axiom proof_of_test_neon_safety_wit_17 : test_neon_safety_wit_17.
Axiom proof_of_test_neon_safety_wit_18 : test_neon_safety_wit_18.
Axiom proof_of_test_neon_safety_wit_19 : test_neon_safety_wit_19.
Axiom proof_of_test_neon_safety_wit_20 : test_neon_safety_wit_20.
Axiom proof_of_test_neon_safety_wit_21 : test_neon_safety_wit_21.
Axiom proof_of_test_neon_safety_wit_22 : test_neon_safety_wit_22.
Axiom proof_of_test_neon_safety_wit_23 : test_neon_safety_wit_23.
Axiom proof_of_test_neon_safety_wit_24 : test_neon_safety_wit_24.
Axiom proof_of_test_neon_safety_wit_25 : test_neon_safety_wit_25.
Axiom proof_of_test_neon_safety_wit_26 : test_neon_safety_wit_26.
Axiom proof_of_test_neon_safety_wit_27 : test_neon_safety_wit_27.
Axiom proof_of_test_neon_safety_wit_28 : test_neon_safety_wit_28.
Axiom proof_of_test_neon_safety_wit_29 : test_neon_safety_wit_29.
Axiom proof_of_test_neon_safety_wit_30 : test_neon_safety_wit_30.
Axiom proof_of_test_neon_safety_wit_31 : test_neon_safety_wit_31.
Axiom proof_of_test_neon_safety_wit_32 : test_neon_safety_wit_32.
Axiom proof_of_test_neon_safety_wit_33 : test_neon_safety_wit_33.
Axiom proof_of_test_neon_safety_wit_34 : test_neon_safety_wit_34.
Axiom proof_of_test_neon_safety_wit_35 : test_neon_safety_wit_35.
Axiom proof_of_test_neon_safety_wit_36 : test_neon_safety_wit_36.
Axiom proof_of_test_neon_safety_wit_37 : test_neon_safety_wit_37.
Axiom proof_of_test_neon_safety_wit_38 : test_neon_safety_wit_38.
Axiom proof_of_test_neon_safety_wit_39 : test_neon_safety_wit_39.
Axiom proof_of_test_neon_safety_wit_40 : test_neon_safety_wit_40.
Axiom proof_of_test_neon_safety_wit_41 : test_neon_safety_wit_41.
Axiom proof_of_test_neon_safety_wit_42 : test_neon_safety_wit_42.
Axiom proof_of_test_neon_safety_wit_43 : test_neon_safety_wit_43.
Axiom proof_of_test_neon_safety_wit_44 : test_neon_safety_wit_44.
Axiom proof_of_test_neon_safety_wit_45 : test_neon_safety_wit_45.
Axiom proof_of_test_neon_safety_wit_46 : test_neon_safety_wit_46.
Axiom proof_of_test_neon_safety_wit_47 : test_neon_safety_wit_47.
Axiom proof_of_test_neon_safety_wit_48 : test_neon_safety_wit_48.
Axiom proof_of_test_neon_safety_wit_49 : test_neon_safety_wit_49.
Axiom proof_of_test_neon_safety_wit_50 : test_neon_safety_wit_50.
Axiom proof_of_test_neon_safety_wit_51 : test_neon_safety_wit_51.
Axiom proof_of_test_neon_safety_wit_52 : test_neon_safety_wit_52.
Axiom proof_of_test_neon_safety_wit_53 : test_neon_safety_wit_53.
Axiom proof_of_test_neon_safety_wit_54 : test_neon_safety_wit_54.
Axiom proof_of_test_neon_safety_wit_55 : test_neon_safety_wit_55.
Axiom proof_of_test_neon_safety_wit_56 : test_neon_safety_wit_56.
Axiom proof_of_test_neon_safety_wit_57 : test_neon_safety_wit_57.
Axiom proof_of_test_neon_safety_wit_58 : test_neon_safety_wit_58.
Axiom proof_of_test_neon_safety_wit_59 : test_neon_safety_wit_59.
Axiom proof_of_test_neon_safety_wit_60 : test_neon_safety_wit_60.
Axiom proof_of_test_neon_safety_wit_61 : test_neon_safety_wit_61.
Axiom proof_of_test_neon_safety_wit_62 : test_neon_safety_wit_62.
Axiom proof_of_test_neon_safety_wit_63 : test_neon_safety_wit_63.
Axiom proof_of_test_neon_safety_wit_64 : test_neon_safety_wit_64.
Axiom proof_of_test_neon_safety_wit_65 : test_neon_safety_wit_65.
Axiom proof_of_test_neon_safety_wit_66 : test_neon_safety_wit_66.
Axiom proof_of_test_neon_safety_wit_67 : test_neon_safety_wit_67.
Axiom proof_of_test_neon_safety_wit_68 : test_neon_safety_wit_68.
Axiom proof_of_test_neon_safety_wit_69 : test_neon_safety_wit_69.
Axiom proof_of_test_neon_safety_wit_70 : test_neon_safety_wit_70.
Axiom proof_of_test_neon_safety_wit_71 : test_neon_safety_wit_71.
Axiom proof_of_test_neon_safety_wit_72 : test_neon_safety_wit_72.
Axiom proof_of_test_neon_safety_wit_73 : test_neon_safety_wit_73.
Axiom proof_of_test_neon_safety_wit_74 : test_neon_safety_wit_74.
Axiom proof_of_test_neon_safety_wit_75 : test_neon_safety_wit_75.
Axiom proof_of_test_neon_safety_wit_76 : test_neon_safety_wit_76.
Axiom proof_of_test_neon_safety_wit_77 : test_neon_safety_wit_77.
Axiom proof_of_test_neon_safety_wit_78 : test_neon_safety_wit_78.
Axiom proof_of_test_neon_safety_wit_79 : test_neon_safety_wit_79.
Axiom proof_of_test_neon_safety_wit_80 : test_neon_safety_wit_80.
Axiom proof_of_test_neon_safety_wit_81 : test_neon_safety_wit_81.
Axiom proof_of_test_neon_safety_wit_82 : test_neon_safety_wit_82.
Axiom proof_of_test_neon_safety_wit_83 : test_neon_safety_wit_83.
Axiom proof_of_test_neon_safety_wit_84 : test_neon_safety_wit_84.
Axiom proof_of_test_neon_safety_wit_85 : test_neon_safety_wit_85.
Axiom proof_of_test_neon_safety_wit_86 : test_neon_safety_wit_86.
Axiom proof_of_test_neon_safety_wit_87 : test_neon_safety_wit_87.
Axiom proof_of_test_neon_safety_wit_88 : test_neon_safety_wit_88.
Axiom proof_of_test_neon_safety_wit_89 : test_neon_safety_wit_89.
Axiom proof_of_test_neon_safety_wit_90 : test_neon_safety_wit_90.
Axiom proof_of_test_neon_safety_wit_91 : test_neon_safety_wit_91.
Axiom proof_of_test_neon_safety_wit_92 : test_neon_safety_wit_92.
Axiom proof_of_test_neon_safety_wit_93 : test_neon_safety_wit_93.
Axiom proof_of_test_neon_safety_wit_94 : test_neon_safety_wit_94.
Axiom proof_of_test_neon_safety_wit_95 : test_neon_safety_wit_95.
Axiom proof_of_test_neon_safety_wit_96 : test_neon_safety_wit_96.
Axiom proof_of_test_neon_entail_wit_1 : test_neon_entail_wit_1.
Axiom proof_of_test_neon_entail_wit_2_1 : test_neon_entail_wit_2_1.
Axiom proof_of_test_neon_entail_wit_2_2 : test_neon_entail_wit_2_2.
Axiom proof_of_test_neon_entail_wit_2_3 : test_neon_entail_wit_2_3.
Axiom proof_of_test_neon_entail_wit_2_4 : test_neon_entail_wit_2_4.
Axiom proof_of_test_neon_entail_wit_2_5 : test_neon_entail_wit_2_5.
Axiom proof_of_test_neon_entail_wit_2_6 : test_neon_entail_wit_2_6.
Axiom proof_of_test_neon_entail_wit_2_7 : test_neon_entail_wit_2_7.
Axiom proof_of_test_neon_entail_wit_2_8 : test_neon_entail_wit_2_8.
Axiom proof_of_test_neon_entail_wit_2_9 : test_neon_entail_wit_2_9.
Axiom proof_of_test_neon_entail_wit_2_10 : test_neon_entail_wit_2_10.
Axiom proof_of_test_neon_entail_wit_2_11 : test_neon_entail_wit_2_11.
Axiom proof_of_test_neon_entail_wit_2_12 : test_neon_entail_wit_2_12.
Axiom proof_of_test_neon_entail_wit_3_1 : test_neon_entail_wit_3_1.
Axiom proof_of_test_neon_entail_wit_3_2 : test_neon_entail_wit_3_2.
Axiom proof_of_test_neon_entail_wit_4 : test_neon_entail_wit_4.
Axiom proof_of_test_neon_entail_wit_5_1 : test_neon_entail_wit_5_1.
Axiom proof_of_test_neon_entail_wit_5_2 : test_neon_entail_wit_5_2.
Axiom proof_of_test_neon_entail_wit_5_3 : test_neon_entail_wit_5_3.
Axiom proof_of_test_neon_entail_wit_6 : test_neon_entail_wit_6.
Axiom proof_of_test_neon_return_wit_1 : test_neon_return_wit_1.
Axiom proof_of_test_neon_return_wit_2 : test_neon_return_wit_2.
Axiom proof_of_test_neon_return_wit_3 : test_neon_return_wit_3.
Axiom proof_of_test_neon_return_wit_4 : test_neon_return_wit_4.
Axiom proof_of_test_neon_partial_solve_wit_1_pure : test_neon_partial_solve_wit_1_pure.
Axiom proof_of_test_neon_partial_solve_wit_1 : test_neon_partial_solve_wit_1.
Axiom proof_of_test_neon_partial_solve_wit_2_pure : test_neon_partial_solve_wit_2_pure.
Axiom proof_of_test_neon_partial_solve_wit_2 : test_neon_partial_solve_wit_2.
Axiom proof_of_test_neon_partial_solve_wit_3_pure : test_neon_partial_solve_wit_3_pure.
Axiom proof_of_test_neon_partial_solve_wit_3 : test_neon_partial_solve_wit_3.
Axiom proof_of_test_neon_partial_solve_wit_4_pure : test_neon_partial_solve_wit_4_pure.
Axiom proof_of_test_neon_partial_solve_wit_4 : test_neon_partial_solve_wit_4.
Axiom proof_of_test_neon_partial_solve_wit_5_pure : test_neon_partial_solve_wit_5_pure.
Axiom proof_of_test_neon_partial_solve_wit_5 : test_neon_partial_solve_wit_5.
Axiom proof_of_test_neon_partial_solve_wit_6_pure : test_neon_partial_solve_wit_6_pure.
Axiom proof_of_test_neon_partial_solve_wit_6 : test_neon_partial_solve_wit_6.
Axiom proof_of_test_neon_partial_solve_wit_7_pure : test_neon_partial_solve_wit_7_pure.
Axiom proof_of_test_neon_partial_solve_wit_7 : test_neon_partial_solve_wit_7.
Axiom proof_of_test_neon_partial_solve_wit_8_pure : test_neon_partial_solve_wit_8_pure.
Axiom proof_of_test_neon_partial_solve_wit_8 : test_neon_partial_solve_wit_8.
Axiom proof_of_test_neon_partial_solve_wit_9_pure : test_neon_partial_solve_wit_9_pure.
Axiom proof_of_test_neon_partial_solve_wit_9 : test_neon_partial_solve_wit_9.
Axiom proof_of_test_neon_partial_solve_wit_10_pure : test_neon_partial_solve_wit_10_pure.
Axiom proof_of_test_neon_partial_solve_wit_10 : test_neon_partial_solve_wit_10.
Axiom proof_of_test_neon_partial_solve_wit_11_pure : test_neon_partial_solve_wit_11_pure.
Axiom proof_of_test_neon_partial_solve_wit_11 : test_neon_partial_solve_wit_11.
Axiom proof_of_test_neon_partial_solve_wit_12_pure : test_neon_partial_solve_wit_12_pure.
Axiom proof_of_test_neon_partial_solve_wit_12 : test_neon_partial_solve_wit_12.
Axiom proof_of_test_neon_partial_solve_wit_13_pure : test_neon_partial_solve_wit_13_pure.
Axiom proof_of_test_neon_partial_solve_wit_13 : test_neon_partial_solve_wit_13.
Axiom proof_of_test_neon_partial_solve_wit_14_pure : test_neon_partial_solve_wit_14_pure.
Axiom proof_of_test_neon_partial_solve_wit_14 : test_neon_partial_solve_wit_14.
Axiom proof_of_test_neon_partial_solve_wit_15_pure : test_neon_partial_solve_wit_15_pure.
Axiom proof_of_test_neon_partial_solve_wit_15 : test_neon_partial_solve_wit_15.
Axiom proof_of_test_neon_partial_solve_wit_16_pure : test_neon_partial_solve_wit_16_pure.
Axiom proof_of_test_neon_partial_solve_wit_16 : test_neon_partial_solve_wit_16.
Axiom proof_of_test_neon_partial_solve_wit_17_pure : test_neon_partial_solve_wit_17_pure.
Axiom proof_of_test_neon_partial_solve_wit_17 : test_neon_partial_solve_wit_17.
Axiom proof_of_test_neon_partial_solve_wit_18_pure : test_neon_partial_solve_wit_18_pure.
Axiom proof_of_test_neon_partial_solve_wit_18 : test_neon_partial_solve_wit_18.
Axiom proof_of_test_neon_partial_solve_wit_19_pure : test_neon_partial_solve_wit_19_pure.
Axiom proof_of_test_neon_partial_solve_wit_19 : test_neon_partial_solve_wit_19.
Axiom proof_of_test_neon_partial_solve_wit_20_pure : test_neon_partial_solve_wit_20_pure.
Axiom proof_of_test_neon_partial_solve_wit_20 : test_neon_partial_solve_wit_20.
Axiom proof_of_test_neon_partial_solve_wit_21_pure : test_neon_partial_solve_wit_21_pure.
Axiom proof_of_test_neon_partial_solve_wit_21 : test_neon_partial_solve_wit_21.
Axiom proof_of_test_neon_partial_solve_wit_22_pure : test_neon_partial_solve_wit_22_pure.
Axiom proof_of_test_neon_partial_solve_wit_22 : test_neon_partial_solve_wit_22.
Axiom proof_of_test_neon_partial_solve_wit_23_pure : test_neon_partial_solve_wit_23_pure.
Axiom proof_of_test_neon_partial_solve_wit_23 : test_neon_partial_solve_wit_23.
Axiom proof_of_test_neon_partial_solve_wit_24_pure : test_neon_partial_solve_wit_24_pure.
Axiom proof_of_test_neon_partial_solve_wit_24 : test_neon_partial_solve_wit_24.
Axiom proof_of_test_neon_partial_solve_wit_25_pure : test_neon_partial_solve_wit_25_pure.
Axiom proof_of_test_neon_partial_solve_wit_25 : test_neon_partial_solve_wit_25.
Axiom proof_of_test_neon_partial_solve_wit_26_pure : test_neon_partial_solve_wit_26_pure.
Axiom proof_of_test_neon_partial_solve_wit_26 : test_neon_partial_solve_wit_26.
Axiom proof_of_test_neon_partial_solve_wit_27_pure : test_neon_partial_solve_wit_27_pure.
Axiom proof_of_test_neon_partial_solve_wit_27 : test_neon_partial_solve_wit_27.
Axiom proof_of_test_neon_partial_solve_wit_28_pure : test_neon_partial_solve_wit_28_pure.
Axiom proof_of_test_neon_partial_solve_wit_28 : test_neon_partial_solve_wit_28.
Axiom proof_of_test_neon_partial_solve_wit_29_pure : test_neon_partial_solve_wit_29_pure.
Axiom proof_of_test_neon_partial_solve_wit_29 : test_neon_partial_solve_wit_29.
Axiom proof_of_test_neon_partial_solve_wit_30_pure : test_neon_partial_solve_wit_30_pure.
Axiom proof_of_test_neon_partial_solve_wit_30 : test_neon_partial_solve_wit_30.
Axiom proof_of_test_neon_partial_solve_wit_31_pure : test_neon_partial_solve_wit_31_pure.
Axiom proof_of_test_neon_partial_solve_wit_31 : test_neon_partial_solve_wit_31.
Axiom proof_of_test_neon_partial_solve_wit_32_pure : test_neon_partial_solve_wit_32_pure.
Axiom proof_of_test_neon_partial_solve_wit_32 : test_neon_partial_solve_wit_32.
Axiom proof_of_test_neon_partial_solve_wit_33_pure : test_neon_partial_solve_wit_33_pure.
Axiom proof_of_test_neon_partial_solve_wit_33 : test_neon_partial_solve_wit_33.
Axiom proof_of_test_neon_partial_solve_wit_34_pure : test_neon_partial_solve_wit_34_pure.
Axiom proof_of_test_neon_partial_solve_wit_34 : test_neon_partial_solve_wit_34.
Axiom proof_of_test_neon_partial_solve_wit_35_pure : test_neon_partial_solve_wit_35_pure.
Axiom proof_of_test_neon_partial_solve_wit_35 : test_neon_partial_solve_wit_35.
Axiom proof_of_test_neon_partial_solve_wit_36_pure : test_neon_partial_solve_wit_36_pure.
Axiom proof_of_test_neon_partial_solve_wit_36 : test_neon_partial_solve_wit_36.
Axiom proof_of_test_neon_partial_solve_wit_37_pure : test_neon_partial_solve_wit_37_pure.
Axiom proof_of_test_neon_partial_solve_wit_37 : test_neon_partial_solve_wit_37.
Axiom proof_of_test_neon_partial_solve_wit_38_pure : test_neon_partial_solve_wit_38_pure.
Axiom proof_of_test_neon_partial_solve_wit_38 : test_neon_partial_solve_wit_38.
Axiom proof_of_test_neon_partial_solve_wit_39_pure : test_neon_partial_solve_wit_39_pure.
Axiom proof_of_test_neon_partial_solve_wit_39 : test_neon_partial_solve_wit_39.
Axiom proof_of_test_neon_partial_solve_wit_40_pure : test_neon_partial_solve_wit_40_pure.
Axiom proof_of_test_neon_partial_solve_wit_40 : test_neon_partial_solve_wit_40.
Axiom proof_of_test_neon_partial_solve_wit_41 : test_neon_partial_solve_wit_41.
Axiom proof_of_test_neon_partial_solve_wit_42_pure : test_neon_partial_solve_wit_42_pure.
Axiom proof_of_test_neon_partial_solve_wit_42 : test_neon_partial_solve_wit_42.
Axiom proof_of_test_neon_partial_solve_wit_43 : test_neon_partial_solve_wit_43.
Axiom proof_of_test_neon_partial_solve_wit_44 : test_neon_partial_solve_wit_44.
Axiom proof_of_test_neon_partial_solve_wit_45 : test_neon_partial_solve_wit_45.
Axiom proof_of_test_neon_partial_solve_wit_46 : test_neon_partial_solve_wit_46.
Axiom proof_of_test_neon_partial_solve_wit_47 : test_neon_partial_solve_wit_47.
Axiom proof_of_test_neon_partial_solve_wit_48_pure : test_neon_partial_solve_wit_48_pure.
Axiom proof_of_test_neon_partial_solve_wit_48 : test_neon_partial_solve_wit_48.
Axiom proof_of_test_neon_partial_solve_wit_49_pure : test_neon_partial_solve_wit_49_pure.
Axiom proof_of_test_neon_partial_solve_wit_49 : test_neon_partial_solve_wit_49.
Axiom proof_of_test_neon_partial_solve_wit_50_pure : test_neon_partial_solve_wit_50_pure.
Axiom proof_of_test_neon_partial_solve_wit_50 : test_neon_partial_solve_wit_50.
Axiom proof_of_test_neon_partial_solve_wit_51 : test_neon_partial_solve_wit_51.
Axiom proof_of_test_neon_partial_solve_wit_52 : test_neon_partial_solve_wit_52.
Axiom proof_of_test_neon_partial_solve_wit_53 : test_neon_partial_solve_wit_53.
Axiom proof_of_test_neon_partial_solve_wit_54 : test_neon_partial_solve_wit_54.
Axiom proof_of_test_neon_partial_solve_wit_55 : test_neon_partial_solve_wit_55.
Axiom proof_of_test_neon_partial_solve_wit_56 : test_neon_partial_solve_wit_56.
Axiom proof_of_test_neon_partial_solve_wit_57 : test_neon_partial_solve_wit_57.
Axiom proof_of_test_neon_partial_solve_wit_58_pure : test_neon_partial_solve_wit_58_pure.
Axiom proof_of_test_neon_partial_solve_wit_58 : test_neon_partial_solve_wit_58.
Axiom proof_of_test_neon_partial_solve_wit_59_pure : test_neon_partial_solve_wit_59_pure.
Axiom proof_of_test_neon_partial_solve_wit_59 : test_neon_partial_solve_wit_59.
Axiom proof_of_test_neon_partial_solve_wit_60 : test_neon_partial_solve_wit_60.

End VC_Correct.
