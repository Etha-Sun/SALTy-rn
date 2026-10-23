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
Require Import S8Clamp.Types.
Require Import S8Clamp.MemoryModel.
Require Import S8Clamp.ProgramModel.
Require Import S8Clamp.RvvModel.
Require Import S8Clamp.RvvKernelModel.
Local Open Scope sac.
From S8Clamp Require Import s8_arrays_strategy_goal.
From S8Clamp Require Import s8_arrays_strategy_proof.
From S8Clamp Require Import rvv_vectors_strategy_goal.
From S8Clamp Require Import rvv_vectors_strategy_proof.
From S8Clamp Require Import rvv_kernel_strategy_goal.
From S8Clamp Require Import rvv_kernel_strategy_proof.

(*----- Function test_rvv -----*)

Definition test_rvv_safety_wit_1 := 
forall (params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (RawHi: Z) (RawLo: Z) (A: (@list Z)) (PreH1 : (0 < batch_pre)) (PreH2 : (batch_pre <= 18446744073709551608)) (PreH3 : (input_pre <> 0)) (PreH4 : (output_pre <> 0)) (PreH5 : (params_pre <> 0)) (PreH6 : (sizeof(CHAR) = 1)) (PreH7 : ((batch_pre % ( sizeof(CHAR) ) ) = 0)) (PreH8 : ((Zlength (A)) = (batch_pre + 7 ))) ,
  ((( &( "batch" ) )) # UInt64  |-> batch_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (CharArray.full input_pre (batch_pre + 7 ) A )
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
  **  (CharArray.undef_full output_pre batch_pre )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition test_rvv_safety_wit_2 := 
forall (params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (RawHi: Z) (RawLo: Z) (A: (@list Z)) (PreH1 : (batch_pre = 0)) (PreH2 : (0 < batch_pre)) (PreH3 : (batch_pre <= 18446744073709551608)) (PreH4 : (input_pre <> 0)) (PreH5 : (output_pre <> 0)) (PreH6 : (params_pre <> 0)) (PreH7 : (sizeof(CHAR) = 1)) (PreH8 : ((batch_pre % ( sizeof(CHAR) ) ) = 0)) (PreH9 : ((Zlength (A)) = (batch_pre + 7 ))) ,
  ((( &( "batch" ) )) # UInt64  |-> batch_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (CharArray.full input_pre (batch_pre + 7 ) A )
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
  **  (CharArray.undef_full output_pre batch_pre )
|--
  “ False ”
.

Definition test_rvv_safety_wit_3 := 
forall (params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (RawHi: Z) (RawLo: Z) (A: (@list Z)) (PreH1 : (batch_pre <> 0)) (PreH2 : (0 < batch_pre)) (PreH3 : (batch_pre <= 18446744073709551608)) (PreH4 : (input_pre <> 0)) (PreH5 : (output_pre <> 0)) (PreH6 : (params_pre <> 0)) (PreH7 : (sizeof(CHAR) = 1)) (PreH8 : ((batch_pre % ( sizeof(CHAR) ) ) = 0)) (PreH9 : ((Zlength (A)) = (batch_pre + 7 ))) ,
  ((( &( "batch" ) )) # UInt64  |-> batch_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (CharArray.full input_pre (batch_pre + 7 ) A )
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
  **  (CharArray.undef_full output_pre batch_pre )
|--
  “ (sizeof(CHAR) <> 0) ”
.

Definition test_rvv_safety_wit_4 := 
forall (params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (RawHi: Z) (RawLo: Z) (A: (@list Z)) (PreH1 : (batch_pre <> 0)) (PreH2 : (0 < batch_pre)) (PreH3 : (batch_pre <= 18446744073709551608)) (PreH4 : (input_pre <> 0)) (PreH5 : (output_pre <> 0)) (PreH6 : (params_pre <> 0)) (PreH7 : (sizeof(CHAR) = 1)) (PreH8 : ((batch_pre % ( sizeof(CHAR) ) ) = 0)) (PreH9 : ((Zlength (A)) = (batch_pre + 7 ))) ,
  ((( &( "batch" ) )) # UInt64  |-> batch_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (CharArray.full input_pre (batch_pre + 7 ) A )
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
  **  (CharArray.undef_full output_pre batch_pre )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition test_rvv_safety_wit_5 := 
forall (params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (RawHi: Z) (RawLo: Z) (A: (@list Z)) (PreH1 : ((batch_pre % ( sizeof(CHAR) ) ) <> 0)) (PreH2 : (batch_pre <> 0)) (PreH3 : (0 < batch_pre)) (PreH4 : (batch_pre <= 18446744073709551608)) (PreH5 : (input_pre <> 0)) (PreH6 : (output_pre <> 0)) (PreH7 : (params_pre <> 0)) (PreH8 : (sizeof(CHAR) = 1)) (PreH9 : ((batch_pre % ( sizeof(CHAR) ) ) = 0)) (PreH10 : ((Zlength (A)) = (batch_pre + 7 ))) ,
  ((( &( "batch" ) )) # UInt64  |-> batch_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (CharArray.full input_pre (batch_pre + 7 ) A )
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
  **  (CharArray.undef_full output_pre batch_pre )
|--
  “ False ”
.

Definition test_rvv_safety_wit_6 := 
forall (params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (RawHi: Z) (RawLo: Z) (A: (@list Z)) (PreH1 : ((batch_pre % ( sizeof(CHAR) ) ) = 0)) (PreH2 : (batch_pre <> 0)) (PreH3 : (0 < batch_pre)) (PreH4 : (batch_pre <= 18446744073709551608)) (PreH5 : (input_pre <> 0)) (PreH6 : (output_pre <> 0)) (PreH7 : (params_pre <> 0)) (PreH8 : (sizeof(CHAR) = 1)) (PreH9 : ((batch_pre % ( sizeof(CHAR) ) ) = 0)) (PreH10 : ((Zlength (A)) = (batch_pre + 7 ))) ,
  ((( &( "batch" ) )) # UInt64  |-> batch_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (CharArray.full input_pre (batch_pre + 7 ) A )
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
  **  (CharArray.undef_full output_pre batch_pre )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition test_rvv_safety_wit_7 := 
forall (params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (RawHi: Z) (RawLo: Z) (A: (@list Z)) (PreH1 : (input_pre = 0)) (PreH2 : ((batch_pre % ( sizeof(CHAR) ) ) = 0)) (PreH3 : (batch_pre <> 0)) (PreH4 : (0 < batch_pre)) (PreH5 : (batch_pre <= 18446744073709551608)) (PreH6 : (input_pre <> 0)) (PreH7 : (output_pre <> 0)) (PreH8 : (params_pre <> 0)) (PreH9 : (sizeof(CHAR) = 1)) (PreH10 : ((batch_pre % ( sizeof(CHAR) ) ) = 0)) (PreH11 : ((Zlength (A)) = (batch_pre + 7 ))) ,
  ((( &( "batch" ) )) # UInt64  |-> batch_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (CharArray.full input_pre (batch_pre + 7 ) A )
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
  **  (CharArray.undef_full output_pre batch_pre )
|--
  “ False ”
.

Definition test_rvv_safety_wit_8 := 
forall (params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (RawHi: Z) (RawLo: Z) (A: (@list Z)) (PreH1 : (input_pre <> 0)) (PreH2 : ((batch_pre % ( sizeof(CHAR) ) ) = 0)) (PreH3 : (batch_pre <> 0)) (PreH4 : (0 < batch_pre)) (PreH5 : (batch_pre <= 18446744073709551608)) (PreH6 : (input_pre <> 0)) (PreH7 : (output_pre <> 0)) (PreH8 : (params_pre <> 0)) (PreH9 : (sizeof(CHAR) = 1)) (PreH10 : ((batch_pre % ( sizeof(CHAR) ) ) = 0)) (PreH11 : ((Zlength (A)) = (batch_pre + 7 ))) ,
  ((( &( "batch" ) )) # UInt64  |-> batch_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (CharArray.full input_pre (batch_pre + 7 ) A )
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
  **  (CharArray.undef_full output_pre batch_pre )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition test_rvv_safety_wit_9 := 
forall (params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (RawHi: Z) (RawLo: Z) (A: (@list Z)) (PreH1 : (output_pre = 0)) (PreH2 : (input_pre <> 0)) (PreH3 : ((batch_pre % ( sizeof(CHAR) ) ) = 0)) (PreH4 : (batch_pre <> 0)) (PreH5 : (0 < batch_pre)) (PreH6 : (batch_pre <= 18446744073709551608)) (PreH7 : (input_pre <> 0)) (PreH8 : (output_pre <> 0)) (PreH9 : (params_pre <> 0)) (PreH10 : (sizeof(CHAR) = 1)) (PreH11 : ((batch_pre % ( sizeof(CHAR) ) ) = 0)) (PreH12 : ((Zlength (A)) = (batch_pre + 7 ))) ,
  ((( &( "batch" ) )) # UInt64  |-> batch_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (CharArray.full input_pre (batch_pre + 7 ) A )
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
  **  (CharArray.undef_full output_pre batch_pre )
|--
  “ False ”
.

Definition test_rvv_safety_wit_10 := 
forall (params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (RawHi: Z) (RawLo: Z) (A: (@list Z)) (PreH1 : (output_pre <> 0)) (PreH2 : (input_pre <> 0)) (PreH3 : ((batch_pre % ( sizeof(CHAR) ) ) = 0)) (PreH4 : (batch_pre <> 0)) (PreH5 : (0 < batch_pre)) (PreH6 : (batch_pre <= 18446744073709551608)) (PreH7 : (input_pre <> 0)) (PreH8 : (output_pre <> 0)) (PreH9 : (params_pre <> 0)) (PreH10 : (sizeof(CHAR) = 1)) (PreH11 : ((batch_pre % ( sizeof(CHAR) ) ) = 0)) (PreH12 : ((Zlength (A)) = (batch_pre + 7 ))) ,
  ((( &( "batch64" ) )) # UInt64  |->_)
  **  ((( &( "voutput_max" ) )) # Char  |-> (signed_last_nbits (RawHi) (8)))
  **  ((( &( "voutput_min" ) )) # Char  |-> (signed_last_nbits (RawLo) (8)))
  **  ((( &( "batch" ) )) # UInt64  |-> batch_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (CharArray.full input_pre (batch_pre + 7 ) A )
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
  **  (CharArray.undef_full output_pre batch_pre )
|--
  “ (63 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 63) ”
.

Definition test_rvv_safety_wit_11 := 
forall (params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (RawHi: Z) (RawLo: Z) (A: (@list Z)) (output: Z) (batch64: Z) (voutput_max: Z) (voutput_min: Z) (input: Z) (batch: Z) (PreH1 : (0 < batch_pre)) (PreH2 : (batch_pre <= 18446744073709551608)) (PreH3 : (sizeof(CHAR) = 1)) (PreH4 : ((Zlength (A)) = (batch_pre + 7 ))) (PreH5 : (0 <= batch)) (PreH6 : (batch <= batch_pre)) (PreH7 : (input = (input_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH8 : (batch = 0)) (PreH9 : (voutput_min = (s8_narrow (RawLo)))) (PreH10 : (voutput_max = (s8_narrow (RawHi)))) (PreH11 : ((-128) <= voutput_min)) (PreH12 : (voutput_min <= 127)) (PreH13 : ((-128) <= voutput_max)) (PreH14 : (voutput_max <= 127)) (PreH15 : (0 <= (s8_bulk_count (batch_pre)))) (PreH16 : ((s8_bulk_count (batch_pre)) <= batch_pre)) (PreH17 : (0 <= batch64)) (PreH18 : (batch64 = ((s8_bulk_count (batch_pre)) - (batch_pre - batch ) ))) (PreH19 : ((batch_pre - batch ) <= (s8_bulk_count (batch_pre)))) ,
  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "batch" ) )) # UInt64  |-> batch)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "voutput_min" ) )) # Char  |-> voutput_min)
  **  ((( &( "voutput_max" ) )) # Char  |-> voutput_max)
  **  ((( &( "batch64" ) )) # UInt64  |-> batch64)
  **  (CharArray.full input_pre (batch_pre + 7 ) A )
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
  **  (CharArray.full output_pre (batch_pre - batch ) (s8_rvv_progress ((batch_pre - batch )) (batch_pre) ((s8_narrow (RawLo))) ((s8_narrow (RawHi))) (A)) )
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  (CharArray.undef_full output batch )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition test_rvv_safety_wit_12 := 
forall (params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (RawHi: Z) (RawLo: Z) (A: (@list Z)) (batch64: Z) (voutput_max: Z) (voutput_min: Z) (output: Z) (input: Z) (batch: Z) (PreH1 : (0 < batch_pre)) (PreH2 : (batch_pre <= 18446744073709551608)) (PreH3 : (sizeof(CHAR) = 1)) (PreH4 : ((Zlength (A)) = (batch_pre + 7 ))) (PreH5 : (0 <= batch)) (PreH6 : (batch <= batch_pre)) (PreH7 : (input = (input_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH8 : (batch > 0)) (PreH9 : (output = (output_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH10 : (voutput_min = (s8_narrow (RawLo)))) (PreH11 : (voutput_max = (s8_narrow (RawHi)))) (PreH12 : ((-128) <= voutput_min)) (PreH13 : (voutput_min <= 127)) (PreH14 : ((-128) <= voutput_max)) (PreH15 : (voutput_max <= 127)) (PreH16 : (0 <= (s8_bulk_count (batch_pre)))) (PreH17 : ((s8_bulk_count (batch_pre)) <= batch_pre)) (PreH18 : (0 <= batch64)) (PreH19 : (batch64 = ((s8_bulk_count (batch_pre)) - (batch_pre - batch ) ))) (PreH20 : ((batch_pre - batch ) <= (s8_bulk_count (batch_pre)))) ,
  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "batch" ) )) # UInt64  |-> batch)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "voutput_min" ) )) # Char  |-> voutput_min)
  **  ((( &( "voutput_max" ) )) # Char  |-> voutput_max)
  **  ((( &( "batch64" ) )) # UInt64  |-> batch64)
  **  (CharArray.full input_pre (batch_pre + 7 ) A )
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
  **  (CharArray.full output_pre (batch_pre - batch ) (s8_rvv_progress ((batch_pre - batch )) (batch_pre) ((s8_narrow (RawLo))) ((s8_narrow (RawHi))) (A)) )
  **  (CharArray.undef_full output batch )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition test_rvv_safety_wit_13 := 
forall (params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (RawHi: Z) (RawLo: Z) (A: (@list Z)) (output: Z) (batch64: Z) (voutput_max: Z) (voutput_min: Z) (input: Z) (batch: Z) (PreH1 : (batch64 > 0)) (PreH2 : (0 < batch_pre)) (PreH3 : (batch_pre <= 18446744073709551608)) (PreH4 : (sizeof(CHAR) = 1)) (PreH5 : ((Zlength (A)) = (batch_pre + 7 ))) (PreH6 : (0 <= batch)) (PreH7 : (batch <= batch_pre)) (PreH8 : (input = (input_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH9 : (batch = 0)) (PreH10 : (voutput_min = (s8_narrow (RawLo)))) (PreH11 : (voutput_max = (s8_narrow (RawHi)))) (PreH12 : ((-128) <= voutput_min)) (PreH13 : (voutput_min <= 127)) (PreH14 : ((-128) <= voutput_max)) (PreH15 : (voutput_max <= 127)) (PreH16 : (0 <= (s8_bulk_count (batch_pre)))) (PreH17 : ((s8_bulk_count (batch_pre)) <= batch_pre)) (PreH18 : (0 <= batch64)) (PreH19 : (batch64 = ((s8_bulk_count (batch_pre)) - (batch_pre - batch ) ))) (PreH20 : ((batch_pre - batch ) <= (s8_bulk_count (batch_pre)))) ,
  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "batch" ) )) # UInt64  |-> batch)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "voutput_min" ) )) # Char  |-> voutput_min)
  **  ((( &( "voutput_max" ) )) # Char  |-> voutput_max)
  **  ((( &( "batch64" ) )) # UInt64  |-> batch64)
  **  (CharArray.full input_pre (batch_pre + 7 ) A )
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
  **  (CharArray.full output_pre (batch_pre - batch ) (s8_rvv_progress ((batch_pre - batch )) (batch_pre) ((s8_narrow (RawLo))) ((s8_narrow (RawHi))) (A)) )
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  (CharArray.undef_full output batch )
|--
  “ False ”
.

Definition test_rvv_safety_wit_14 := 
forall (params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (RawHi: Z) (RawLo: Z) (A: (@list Z)) (output: Z) (voutput_max: Z) (voutput_min: Z) (input: Z) (batch: Z) (batch64: Z) (PreH1 : (batch64 = 0)) (PreH2 : (0 < batch_pre)) (PreH3 : (batch_pre <= 18446744073709551608)) (PreH4 : (sizeof(CHAR) = 1)) (PreH5 : ((Zlength (A)) = (batch_pre + 7 ))) (PreH6 : (0 <= batch)) (PreH7 : (batch <= batch_pre)) (PreH8 : (input = (input_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH9 : (batch = 0)) (PreH10 : (voutput_min = (s8_narrow (RawLo)))) (PreH11 : (voutput_max = (s8_narrow (RawHi)))) (PreH12 : ((-128) <= voutput_min)) (PreH13 : (voutput_min <= 127)) (PreH14 : ((-128) <= voutput_max)) (PreH15 : (voutput_max <= 127)) (PreH16 : ((s8_bulk_count (batch_pre)) <= (batch_pre - batch ))) ,
  ((( &( "batch64" ) )) # UInt64  |-> batch64)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "batch" ) )) # UInt64  |-> batch)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "voutput_min" ) )) # Char  |-> voutput_min)
  **  ((( &( "voutput_max" ) )) # Char  |-> voutput_max)
  **  (CharArray.full input_pre (batch_pre + 7 ) A )
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
  **  (CharArray.full output_pre (batch_pre - batch ) (s8_rvv_progress ((batch_pre - batch )) (batch_pre) ((s8_narrow (RawLo))) ((s8_narrow (RawHi))) (A)) )
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  (CharArray.undef_full output batch )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition test_rvv_safety_wit_15 := 
forall (params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (RawHi: Z) (RawLo: Z) (A: (@list Z)) (voutput_max: Z) (voutput_min: Z) (output: Z) (input: Z) (batch: Z) (batch64: Z) (PreH1 : (batch64 = 0)) (PreH2 : (0 < batch_pre)) (PreH3 : (batch_pre <= 18446744073709551608)) (PreH4 : (sizeof(CHAR) = 1)) (PreH5 : ((Zlength (A)) = (batch_pre + 7 ))) (PreH6 : (0 <= batch)) (PreH7 : (batch <= batch_pre)) (PreH8 : (input = (input_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH9 : (batch > 0)) (PreH10 : (output = (output_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH11 : (voutput_min = (s8_narrow (RawLo)))) (PreH12 : (voutput_max = (s8_narrow (RawHi)))) (PreH13 : ((-128) <= voutput_min)) (PreH14 : (voutput_min <= 127)) (PreH15 : ((-128) <= voutput_max)) (PreH16 : (voutput_max <= 127)) (PreH17 : ((s8_bulk_count (batch_pre)) <= (batch_pre - batch ))) ,
  ((( &( "batch64" ) )) # UInt64  |-> batch64)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "batch" ) )) # UInt64  |-> batch)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "voutput_min" ) )) # Char  |-> voutput_min)
  **  ((( &( "voutput_max" ) )) # Char  |-> voutput_max)
  **  (CharArray.full input_pre (batch_pre + 7 ) A )
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
  **  (CharArray.full output_pre (batch_pre - batch ) (s8_rvv_progress ((batch_pre - batch )) (batch_pre) ((s8_narrow (RawLo))) ((s8_narrow (RawHi))) (A)) )
  **  (CharArray.undef_full output batch )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition test_rvv_safety_wit_16 := 
forall (params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (RawHi: Z) (RawLo: Z) (A: (@list Z)) (output: Z) (voutput_max: Z) (voutput_min: Z) (input: Z) (batch: Z) (batch64: Z) (PreH1 : (batch > 0)) (PreH2 : (batch64 = 0)) (PreH3 : (0 < batch_pre)) (PreH4 : (batch_pre <= 18446744073709551608)) (PreH5 : (sizeof(CHAR) = 1)) (PreH6 : ((Zlength (A)) = (batch_pre + 7 ))) (PreH7 : (0 <= batch)) (PreH8 : (batch <= batch_pre)) (PreH9 : (input = (input_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH10 : (batch = 0)) (PreH11 : (voutput_min = (s8_narrow (RawLo)))) (PreH12 : (voutput_max = (s8_narrow (RawHi)))) (PreH13 : ((-128) <= voutput_min)) (PreH14 : (voutput_min <= 127)) (PreH15 : ((-128) <= voutput_max)) (PreH16 : (voutput_max <= 127)) (PreH17 : ((s8_bulk_count (batch_pre)) <= (batch_pre - batch ))) ,
  ((( &( "batch64" ) )) # UInt64  |-> batch64)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "batch" ) )) # UInt64  |-> batch)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "voutput_min" ) )) # Char  |-> voutput_min)
  **  ((( &( "voutput_max" ) )) # Char  |-> voutput_max)
  **  (CharArray.full input_pre (batch_pre + 7 ) A )
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
  **  (CharArray.full output_pre (batch_pre - batch ) (s8_rvv_progress ((batch_pre - batch )) (batch_pre) ((s8_narrow (RawLo))) ((s8_narrow (RawHi))) (A)) )
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  (CharArray.undef_full output batch )
|--
  “ False ”
.

Definition test_rvv_safety_wit_17 := 
forall (params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (RawHi: Z) (RawLo: Z) (A: (@list Z)) (voutput_max: Z) (voutput_min: Z) (output: Z) (input: Z) (batch: Z) (batch64: Z) (PreH1 : (batch <= 0)) (PreH2 : (batch64 = 0)) (PreH3 : (0 < batch_pre)) (PreH4 : (batch_pre <= 18446744073709551608)) (PreH5 : (sizeof(CHAR) = 1)) (PreH6 : ((Zlength (A)) = (batch_pre + 7 ))) (PreH7 : (0 <= batch)) (PreH8 : (batch <= batch_pre)) (PreH9 : (input = (input_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH10 : (batch > 0)) (PreH11 : (output = (output_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH12 : (voutput_min = (s8_narrow (RawLo)))) (PreH13 : (voutput_max = (s8_narrow (RawHi)))) (PreH14 : ((-128) <= voutput_min)) (PreH15 : (voutput_min <= 127)) (PreH16 : ((-128) <= voutput_max)) (PreH17 : (voutput_max <= 127)) (PreH18 : ((s8_bulk_count (batch_pre)) <= (batch_pre - batch ))) ,
  ((( &( "batch64" ) )) # UInt64  |-> batch64)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "batch" ) )) # UInt64  |-> batch)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "voutput_min" ) )) # Char  |-> voutput_min)
  **  ((( &( "voutput_max" ) )) # Char  |-> voutput_max)
  **  (CharArray.full input_pre (batch_pre + 7 ) A )
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
  **  (CharArray.full output_pre (batch_pre - batch ) (s8_rvv_progress ((batch_pre - batch )) (batch_pre) ((s8_narrow (RawLo))) ((s8_narrow (RawHi))) (A)) )
  **  (CharArray.undef_full output batch )
|--
  “ False ”
.

Definition test_rvv_entail_wit_1 := 
(
forall (params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (RawHi: Z) (RawLo: Z) (A: (@list Z)) (PreH1 : (0 < batch_pre)) (PreH2 : (batch_pre <= 18446744073709551608)) (PreH3 : (input_pre <> 0)) (PreH4 : (output_pre <> 0)) (PreH5 : (params_pre <> 0)) ,
  (CharArray.full input_pre (batch_pre + 7 ) A )
  **  (CharArray.undef_full output_pre batch_pre )
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
|--
  “ (0 < batch_pre) ” 
  &&  “ (batch_pre <= 18446744073709551608) ” 
  &&  “ (input_pre <> 0) ” 
  &&  “ (output_pre <> 0) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (sizeof(CHAR) = 1) ” 
  &&  “ ((batch_pre % ( sizeof(CHAR) ) ) = 0) ” 
  &&  “ ((Zlength (A)) = (batch_pre + 7 )) ”
  &&  (CharArray.full input_pre (batch_pre + 7 ) A )
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
  **  (CharArray.undef_full output_pre batch_pre )
) \/
(
forall (params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list Z)) (PreH1 : (0 < batch_pre)) (PreH2 : (batch_pre <= 18446744073709551608)) (PreH3 : (input_pre <> 0)) (PreH4 : (output_pre <> 0)) (PreH5 : (params_pre <> 0)) ,
  (CharArray.undef_full (output_pre + (batch_pre * sizeof(CHAR))) (batch_pre - batch_pre ) )
|--
  “ ((Zlength (A)) = (batch_pre + 7 )) ” 
  &&  “ ((batch_pre % ( sizeof(CHAR) ) ) = 0) ”
  &&  emp
).

Definition test_rvv_entail_wit_1_split_goal_1 := 
forall (params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list Z)) (PreH1 : (0 < batch_pre)) (PreH2 : (batch_pre <= 18446744073709551608)) (PreH3 : (input_pre <> 0)) (PreH4 : (output_pre <> 0)) (PreH5 : (params_pre <> 0)) ,
  (CharArray.undef_full (output_pre + (batch_pre * sizeof(CHAR))) (batch_pre - batch_pre ) )
|--
  “ ((Zlength (A)) = (batch_pre + 7 )) ”
.

Definition test_rvv_entail_wit_1_split_goal_2 := 
forall (params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (PreH1 : (0 < batch_pre)) (PreH2 : (batch_pre <= 18446744073709551608)) (PreH3 : (input_pre <> 0)) (PreH4 : (output_pre <> 0)) (PreH5 : (params_pre <> 0)) ,
  (CharArray.undef_full (output_pre + (batch_pre * sizeof(CHAR))) (batch_pre - batch_pre ) )
|--
  “ ((batch_pre % ( sizeof(CHAR) ) ) = 0) ”
.

Definition test_rvv_entail_wit_1_split_goal_spatial := 
forall (params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (PreH1 : (0 < batch_pre)) (PreH2 : (batch_pre <= 18446744073709551608)) (PreH3 : (input_pre <> 0)) (PreH4 : (output_pre <> 0)) (PreH5 : (params_pre <> 0)) ,
  (CharArray.undef_full (output_pre + (batch_pre * sizeof(CHAR))) (batch_pre - batch_pre ) )
|--
  TT && emp 
.

Definition test_rvv_entail_wit_2 := 
(
forall (params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (RawHi: Z) (RawLo: Z) (A: (@list Z)) (PreH1 : (output_pre <> 0)) (PreH2 : (input_pre <> 0)) (PreH3 : ((batch_pre % ( sizeof(CHAR) ) ) = 0)) (PreH4 : (batch_pre <> 0)) (PreH5 : (0 < batch_pre)) (PreH6 : (batch_pre <= 18446744073709551608)) (PreH7 : (input_pre <> 0)) (PreH8 : (output_pre <> 0)) (PreH9 : (params_pre <> 0)) (PreH10 : (sizeof(CHAR) = 1)) (PreH11 : ((batch_pre % ( sizeof(CHAR) ) ) = 0)) (PreH12 : ((Zlength (A)) = (batch_pre + 7 ))) ,
  (CharArray.full input_pre (batch_pre + 7 ) A )
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
  **  (CharArray.undef_full output_pre batch_pre )
|--
  “ (0 < batch_pre) ” 
  &&  “ (batch_pre <= 18446744073709551608) ” 
  &&  “ (sizeof(CHAR) = 1) ” 
  &&  “ ((Zlength (A)) = (batch_pre + 7 )) ” 
  &&  “ ((signed_last_nbits (RawLo) (8)) = (s8_narrow (RawLo))) ” 
  &&  “ ((signed_last_nbits (RawHi) (8)) = (s8_narrow (RawHi))) ” 
  &&  “ ((-128) <= (signed_last_nbits (RawLo) (8))) ” 
  &&  “ ((signed_last_nbits (RawLo) (8)) <= 127) ” 
  &&  “ ((-128) <= (signed_last_nbits (RawHi) (8))) ” 
  &&  “ ((signed_last_nbits (RawHi) (8)) <= 127) ” 
  &&  “ ((Z.land batch_pre (Z.lnot 63)) = (s8_bulk_count (batch_pre))) ” 
  &&  “ (0 <= (Z.land batch_pre (Z.lnot 63))) ” 
  &&  “ ((Z.land batch_pre (Z.lnot 63)) <= batch_pre) ”
  &&  (CharArray.full input_pre (batch_pre + 7 ) A )
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
  **  (CharArray.undef_full output_pre batch_pre )
) \/
(
forall (params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (RawHi: Z) (RawLo: Z) (A: (@list Z)) (PreH1 : (output_pre <> 0)) (PreH2 : (input_pre <> 0)) (PreH3 : ((batch_pre % ( sizeof(CHAR) ) ) = 0)) (PreH4 : (batch_pre <> 0)) (PreH5 : (0 < batch_pre)) (PreH6 : (batch_pre <= 18446744073709551608)) (PreH7 : (input_pre <> 0)) (PreH8 : (output_pre <> 0)) (PreH9 : (params_pre <> 0)) (PreH10 : (sizeof(CHAR) = 1)) (PreH11 : ((batch_pre % ( sizeof(CHAR) ) ) = 0)) (PreH12 : ((Zlength (A)) = (batch_pre + 7 ))) ,
  (CharArray.undef_full (output_pre + (batch_pre * sizeof(CHAR))) (batch_pre - batch_pre ) )
|--
  “ ((Z.land batch_pre (Z.lnot 63)) <= batch_pre) ” 
  &&  “ (0 <= (Z.land batch_pre (Z.lnot 63))) ” 
  &&  “ ((Z.land batch_pre (Z.lnot 63)) = (s8_bulk_count (batch_pre))) ” 
  &&  “ ((signed_last_nbits (RawHi) (8)) <= 127) ” 
  &&  “ ((-128) <= (signed_last_nbits (RawHi) (8))) ” 
  &&  “ ((signed_last_nbits (RawLo) (8)) <= 127) ” 
  &&  “ ((-128) <= (signed_last_nbits (RawLo) (8))) ” 
  &&  “ ((signed_last_nbits (RawHi) (8)) = (s8_narrow (RawHi))) ” 
  &&  “ ((signed_last_nbits (RawLo) (8)) = (s8_narrow (RawLo))) ”
  &&  emp
).

Definition test_rvv_entail_wit_2_split_goal_1 := 
forall (params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list Z)) (PreH1 : (output_pre <> 0)) (PreH2 : (input_pre <> 0)) (PreH3 : ((batch_pre % ( sizeof(CHAR) ) ) = 0)) (PreH4 : (batch_pre <> 0)) (PreH5 : (0 < batch_pre)) (PreH6 : (batch_pre <= 18446744073709551608)) (PreH7 : (input_pre <> 0)) (PreH8 : (output_pre <> 0)) (PreH9 : (params_pre <> 0)) (PreH10 : (sizeof(CHAR) = 1)) (PreH11 : ((batch_pre % ( sizeof(CHAR) ) ) = 0)) (PreH12 : ((Zlength (A)) = (batch_pre + 7 ))) ,
  (CharArray.undef_full (output_pre + (batch_pre * sizeof(CHAR))) (batch_pre - batch_pre ) )
|--
  “ ((Z.land batch_pre (Z.lnot 63)) <= batch_pre) ”
.

Definition test_rvv_entail_wit_2_split_goal_2 := 
forall (params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list Z)) (PreH1 : (output_pre <> 0)) (PreH2 : (input_pre <> 0)) (PreH3 : ((batch_pre % ( sizeof(CHAR) ) ) = 0)) (PreH4 : (batch_pre <> 0)) (PreH5 : (0 < batch_pre)) (PreH6 : (batch_pre <= 18446744073709551608)) (PreH7 : (input_pre <> 0)) (PreH8 : (output_pre <> 0)) (PreH9 : (params_pre <> 0)) (PreH10 : (sizeof(CHAR) = 1)) (PreH11 : ((batch_pre % ( sizeof(CHAR) ) ) = 0)) (PreH12 : ((Zlength (A)) = (batch_pre + 7 ))) ,
  (CharArray.undef_full (output_pre + (batch_pre * sizeof(CHAR))) (batch_pre - batch_pre ) )
|--
  “ (0 <= (Z.land batch_pre (Z.lnot 63))) ”
.

Definition test_rvv_entail_wit_2_split_goal_3 := 
forall (params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list Z)) (PreH1 : (output_pre <> 0)) (PreH2 : (input_pre <> 0)) (PreH3 : ((batch_pre % ( sizeof(CHAR) ) ) = 0)) (PreH4 : (batch_pre <> 0)) (PreH5 : (0 < batch_pre)) (PreH6 : (batch_pre <= 18446744073709551608)) (PreH7 : (input_pre <> 0)) (PreH8 : (output_pre <> 0)) (PreH9 : (params_pre <> 0)) (PreH10 : (sizeof(CHAR) = 1)) (PreH11 : ((batch_pre % ( sizeof(CHAR) ) ) = 0)) (PreH12 : ((Zlength (A)) = (batch_pre + 7 ))) ,
  (CharArray.undef_full (output_pre + (batch_pre * sizeof(CHAR))) (batch_pre - batch_pre ) )
|--
  “ ((Z.land batch_pre (Z.lnot 63)) = (s8_bulk_count (batch_pre))) ”
.

Definition test_rvv_entail_wit_2_split_goal_4 := 
forall (params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (RawHi: Z) (A: (@list Z)) (PreH1 : (output_pre <> 0)) (PreH2 : (input_pre <> 0)) (PreH3 : ((batch_pre % ( sizeof(CHAR) ) ) = 0)) (PreH4 : (batch_pre <> 0)) (PreH5 : (0 < batch_pre)) (PreH6 : (batch_pre <= 18446744073709551608)) (PreH7 : (input_pre <> 0)) (PreH8 : (output_pre <> 0)) (PreH9 : (params_pre <> 0)) (PreH10 : (sizeof(CHAR) = 1)) (PreH11 : ((batch_pre % ( sizeof(CHAR) ) ) = 0)) (PreH12 : ((Zlength (A)) = (batch_pre + 7 ))) ,
  (CharArray.undef_full (output_pre + (batch_pre * sizeof(CHAR))) (batch_pre - batch_pre ) )
|--
  “ ((signed_last_nbits (RawHi) (8)) <= 127) ”
.

Definition test_rvv_entail_wit_2_split_goal_5 := 
forall (params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (RawHi: Z) (A: (@list Z)) (PreH1 : (output_pre <> 0)) (PreH2 : (input_pre <> 0)) (PreH3 : ((batch_pre % ( sizeof(CHAR) ) ) = 0)) (PreH4 : (batch_pre <> 0)) (PreH5 : (0 < batch_pre)) (PreH6 : (batch_pre <= 18446744073709551608)) (PreH7 : (input_pre <> 0)) (PreH8 : (output_pre <> 0)) (PreH9 : (params_pre <> 0)) (PreH10 : (sizeof(CHAR) = 1)) (PreH11 : ((batch_pre % ( sizeof(CHAR) ) ) = 0)) (PreH12 : ((Zlength (A)) = (batch_pre + 7 ))) ,
  (CharArray.undef_full (output_pre + (batch_pre * sizeof(CHAR))) (batch_pre - batch_pre ) )
|--
  “ ((-128) <= (signed_last_nbits (RawHi) (8))) ”
.

Definition test_rvv_entail_wit_2_split_goal_6 := 
forall (params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (RawLo: Z) (A: (@list Z)) (PreH1 : (output_pre <> 0)) (PreH2 : (input_pre <> 0)) (PreH3 : ((batch_pre % ( sizeof(CHAR) ) ) = 0)) (PreH4 : (batch_pre <> 0)) (PreH5 : (0 < batch_pre)) (PreH6 : (batch_pre <= 18446744073709551608)) (PreH7 : (input_pre <> 0)) (PreH8 : (output_pre <> 0)) (PreH9 : (params_pre <> 0)) (PreH10 : (sizeof(CHAR) = 1)) (PreH11 : ((batch_pre % ( sizeof(CHAR) ) ) = 0)) (PreH12 : ((Zlength (A)) = (batch_pre + 7 ))) ,
  (CharArray.undef_full (output_pre + (batch_pre * sizeof(CHAR))) (batch_pre - batch_pre ) )
|--
  “ ((signed_last_nbits (RawLo) (8)) <= 127) ”
.

Definition test_rvv_entail_wit_2_split_goal_7 := 
forall (params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (RawLo: Z) (A: (@list Z)) (PreH1 : (output_pre <> 0)) (PreH2 : (input_pre <> 0)) (PreH3 : ((batch_pre % ( sizeof(CHAR) ) ) = 0)) (PreH4 : (batch_pre <> 0)) (PreH5 : (0 < batch_pre)) (PreH6 : (batch_pre <= 18446744073709551608)) (PreH7 : (input_pre <> 0)) (PreH8 : (output_pre <> 0)) (PreH9 : (params_pre <> 0)) (PreH10 : (sizeof(CHAR) = 1)) (PreH11 : ((batch_pre % ( sizeof(CHAR) ) ) = 0)) (PreH12 : ((Zlength (A)) = (batch_pre + 7 ))) ,
  (CharArray.undef_full (output_pre + (batch_pre * sizeof(CHAR))) (batch_pre - batch_pre ) )
|--
  “ ((-128) <= (signed_last_nbits (RawLo) (8))) ”
.

Definition test_rvv_entail_wit_2_split_goal_8 := 
forall (params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (RawHi: Z) (A: (@list Z)) (PreH1 : (output_pre <> 0)) (PreH2 : (input_pre <> 0)) (PreH3 : ((batch_pre % ( sizeof(CHAR) ) ) = 0)) (PreH4 : (batch_pre <> 0)) (PreH5 : (0 < batch_pre)) (PreH6 : (batch_pre <= 18446744073709551608)) (PreH7 : (input_pre <> 0)) (PreH8 : (output_pre <> 0)) (PreH9 : (params_pre <> 0)) (PreH10 : (sizeof(CHAR) = 1)) (PreH11 : ((batch_pre % ( sizeof(CHAR) ) ) = 0)) (PreH12 : ((Zlength (A)) = (batch_pre + 7 ))) ,
  (CharArray.undef_full (output_pre + (batch_pre * sizeof(CHAR))) (batch_pre - batch_pre ) )
|--
  “ ((signed_last_nbits (RawHi) (8)) = (s8_narrow (RawHi))) ”
.

Definition test_rvv_entail_wit_2_split_goal_9 := 
forall (params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (RawLo: Z) (A: (@list Z)) (PreH1 : (output_pre <> 0)) (PreH2 : (input_pre <> 0)) (PreH3 : ((batch_pre % ( sizeof(CHAR) ) ) = 0)) (PreH4 : (batch_pre <> 0)) (PreH5 : (0 < batch_pre)) (PreH6 : (batch_pre <= 18446744073709551608)) (PreH7 : (input_pre <> 0)) (PreH8 : (output_pre <> 0)) (PreH9 : (params_pre <> 0)) (PreH10 : (sizeof(CHAR) = 1)) (PreH11 : ((batch_pre % ( sizeof(CHAR) ) ) = 0)) (PreH12 : ((Zlength (A)) = (batch_pre + 7 ))) ,
  (CharArray.undef_full (output_pre + (batch_pre * sizeof(CHAR))) (batch_pre - batch_pre ) )
|--
  “ ((signed_last_nbits (RawLo) (8)) = (s8_narrow (RawLo))) ”
.

Definition test_rvv_entail_wit_2_split_goal_spatial := 
forall (params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list Z)) (PreH1 : (output_pre <> 0)) (PreH2 : (input_pre <> 0)) (PreH3 : ((batch_pre % ( sizeof(CHAR) ) ) = 0)) (PreH4 : (batch_pre <> 0)) (PreH5 : (0 < batch_pre)) (PreH6 : (batch_pre <= 18446744073709551608)) (PreH7 : (input_pre <> 0)) (PreH8 : (output_pre <> 0)) (PreH9 : (params_pre <> 0)) (PreH10 : (sizeof(CHAR) = 1)) (PreH11 : ((batch_pre % ( sizeof(CHAR) ) ) = 0)) (PreH12 : ((Zlength (A)) = (batch_pre + 7 ))) ,
  (CharArray.undef_full (output_pre + (batch_pre * sizeof(CHAR))) (batch_pre - batch_pre ) )
|--
  TT && emp 
.

Definition test_rvv_entail_wit_3 := 
(
forall (params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (RawHi: Z) (RawLo: Z) (A: (@list Z)) (voutput_min: Z) (voutput_max: Z) (batch64: Z) (PreH1 : (0 < batch_pre)) (PreH2 : (batch_pre <= 18446744073709551608)) (PreH3 : (sizeof(CHAR) = 1)) (PreH4 : ((Zlength (A)) = (batch_pre + 7 ))) (PreH5 : (voutput_min = (s8_narrow (RawLo)))) (PreH6 : (voutput_max = (s8_narrow (RawHi)))) (PreH7 : ((-128) <= voutput_min)) (PreH8 : (voutput_min <= 127)) (PreH9 : ((-128) <= voutput_max)) (PreH10 : (voutput_max <= 127)) (PreH11 : (batch64 = (s8_bulk_count (batch_pre)))) (PreH12 : (0 <= batch64)) (PreH13 : (batch64 <= batch_pre)) ,
  (CharArray.full input_pre (batch_pre + 7 ) A )
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
  **  (CharArray.undef_full output_pre batch_pre )
|--
  “ (0 < batch_pre) ” 
  &&  “ (batch_pre <= 18446744073709551608) ” 
  &&  “ (sizeof(CHAR) = 1) ” 
  &&  “ ((Zlength (A)) = (batch_pre + 7 )) ” 
  &&  “ (0 <= batch_pre) ” 
  &&  “ (batch_pre <= batch_pre) ” 
  &&  “ (input_pre = (input_pre + ((batch_pre - batch_pre ) * sizeof(CHAR)))) ” 
  &&  “ (batch_pre > 0) ” 
  &&  “ (output_pre = (output_pre + ((batch_pre - batch_pre ) * sizeof(CHAR)))) ” 
  &&  “ (voutput_min = (s8_narrow (RawLo))) ” 
  &&  “ (voutput_max = (s8_narrow (RawHi))) ” 
  &&  “ ((-128) <= voutput_min) ” 
  &&  “ (voutput_min <= 127) ” 
  &&  “ ((-128) <= voutput_max) ” 
  &&  “ (voutput_max <= 127) ” 
  &&  “ (0 <= (s8_bulk_count (batch_pre))) ” 
  &&  “ ((s8_bulk_count (batch_pre)) <= batch_pre) ” 
  &&  “ (0 <= batch64) ” 
  &&  “ (batch64 = ((s8_bulk_count (batch_pre)) - (batch_pre - batch_pre ) )) ” 
  &&  “ ((batch_pre - batch_pre ) <= (s8_bulk_count (batch_pre))) ”
  &&  (CharArray.full input_pre (batch_pre + 7 ) A )
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
  **  (CharArray.full output_pre (batch_pre - batch_pre ) (s8_rvv_progress ((batch_pre - batch_pre )) (batch_pre) ((s8_narrow (RawLo))) ((s8_narrow (RawHi))) (A)) )
  **  (CharArray.undef_full output_pre batch_pre )
) \/
(
forall (output_pre: Z) (batch_pre: Z) (RawHi: Z) (RawLo: Z) (A: (@list Z)) (voutput_min: Z) (voutput_max: Z) (batch64: Z) (PreH1 : (0 < batch_pre)) (PreH2 : (batch_pre <= 18446744073709551608)) (PreH3 : (sizeof(CHAR) = 1)) (PreH4 : ((Zlength (A)) = (batch_pre + 7 ))) (PreH5 : (voutput_min = (s8_narrow (RawLo)))) (PreH6 : (voutput_max = (s8_narrow (RawHi)))) (PreH7 : ((-128) <= voutput_min)) (PreH8 : (voutput_min <= 127)) (PreH9 : ((-128) <= voutput_max)) (PreH10 : (voutput_max <= 127)) (PreH11 : (batch64 = (s8_bulk_count (batch_pre)))) (PreH12 : (0 <= batch64)) (PreH13 : (batch64 <= batch_pre)) ,
  (CharArray.undef_full (output_pre + (batch_pre * sizeof(CHAR))) (batch_pre - batch_pre ) )
|--
  “ ((s8_rvv_progress ((batch_pre - batch_pre )) (batch_pre) (voutput_min) (voutput_max) (A)) = (@nil Z)) ”
  &&  emp
).

Definition test_rvv_entail_wit_3_split_goal_1 := 
forall (output_pre: Z) (batch_pre: Z) (RawHi: Z) (RawLo: Z) (A: (@list Z)) (voutput_min: Z) (voutput_max: Z) (batch64: Z) (PreH1 : (0 < batch_pre)) (PreH2 : (batch_pre <= 18446744073709551608)) (PreH3 : (sizeof(CHAR) = 1)) (PreH4 : ((Zlength (A)) = (batch_pre + 7 ))) (PreH5 : (voutput_min = (s8_narrow (RawLo)))) (PreH6 : (voutput_max = (s8_narrow (RawHi)))) (PreH7 : ((-128) <= voutput_min)) (PreH8 : (voutput_min <= 127)) (PreH9 : ((-128) <= voutput_max)) (PreH10 : (voutput_max <= 127)) (PreH11 : (batch64 = (s8_bulk_count (batch_pre)))) (PreH12 : (0 <= batch64)) (PreH13 : (batch64 <= batch_pre)) ,
  (CharArray.undef_full (output_pre + (batch_pre * sizeof(CHAR))) (batch_pre - batch_pre ) )
|--
  “ ((s8_rvv_progress ((batch_pre - batch_pre )) (batch_pre) (voutput_min) (voutput_max) (A)) = (@nil Z)) ”
.

Definition test_rvv_entail_wit_3_split_goal_spatial := 
forall (output_pre: Z) (batch_pre: Z) (RawHi: Z) (RawLo: Z) (A: (@list Z)) (voutput_min: Z) (voutput_max: Z) (batch64: Z) (PreH1 : (0 < batch_pre)) (PreH2 : (batch_pre <= 18446744073709551608)) (PreH3 : (sizeof(CHAR) = 1)) (PreH4 : ((Zlength (A)) = (batch_pre + 7 ))) (PreH5 : (voutput_min = (s8_narrow (RawLo)))) (PreH6 : (voutput_max = (s8_narrow (RawHi)))) (PreH7 : ((-128) <= voutput_min)) (PreH8 : (voutput_min <= 127)) (PreH9 : ((-128) <= voutput_max)) (PreH10 : (voutput_max <= 127)) (PreH11 : (batch64 = (s8_bulk_count (batch_pre)))) (PreH12 : (0 <= batch64)) (PreH13 : (batch64 <= batch_pre)) ,
  (CharArray.undef_full (output_pre + (batch_pre * sizeof(CHAR))) (batch_pre - batch_pre ) )
|--
  TT && emp 
.

Definition test_rvv_entail_wit_4_1 := 
(
forall (params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (RawHi: Z) (RawLo: Z) (A: (@list Z)) (batch64: Z) (voutput_max: Z) (voutput_min: Z) (output: Z) (input: Z) (batch: Z) (retval: Z) (PreH1 : (128 <= batch64)) (PreH2 : (retval = 128)) (PreH3 : (batch64 > 0)) (PreH4 : (0 < batch_pre)) (PreH5 : (batch_pre <= 18446744073709551608)) (PreH6 : (sizeof(CHAR) = 1)) (PreH7 : ((Zlength (A)) = (batch_pre + 7 ))) (PreH8 : (0 <= batch)) (PreH9 : (batch <= batch_pre)) (PreH10 : (input = (input_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH11 : (batch > 0)) (PreH12 : (output = (output_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH13 : (voutput_min = (s8_narrow (RawLo)))) (PreH14 : (voutput_max = (s8_narrow (RawHi)))) (PreH15 : ((-128) <= voutput_min)) (PreH16 : (voutput_min <= 127)) (PreH17 : ((-128) <= voutput_max)) (PreH18 : (voutput_max <= 127)) (PreH19 : (0 <= (s8_bulk_count (batch_pre)))) (PreH20 : ((s8_bulk_count (batch_pre)) <= batch_pre)) (PreH21 : (0 <= batch64)) (PreH22 : (batch64 = ((s8_bulk_count (batch_pre)) - (batch_pre - batch ) ))) (PreH23 : ((batch_pre - batch ) <= (s8_bulk_count (batch_pre)))) ,
  (CharArray.full input_pre (batch_pre + 7 ) A )
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
  **  (CharArray.full output_pre (batch_pre - batch ) (s8_rvv_progress ((batch_pre - batch )) (batch_pre) ((s8_narrow (RawLo))) ((s8_narrow (RawHi))) (A)) )
  **  (CharArray.undef_full output batch )
|--
  “ (0 < retval) ” 
  &&  “ (retval <= 128) ” 
  &&  “ (retval <= batch) ” 
  &&  “ (retval <= batch64) ” 
  &&  “ (0 < batch_pre) ” 
  &&  “ (batch_pre <= 18446744073709551608) ” 
  &&  “ (sizeof(CHAR) = 1) ” 
  &&  “ ((Zlength (A)) = (batch_pre + 7 )) ” 
  &&  “ (0 <= batch) ” 
  &&  “ (batch <= batch_pre) ” 
  &&  “ (input = (input_pre + ((batch_pre - batch ) * sizeof(CHAR)))) ” 
  &&  “ (batch > 0) ” 
  &&  “ (output = (output_pre + ((batch_pre - batch ) * sizeof(CHAR)))) ” 
  &&  “ (voutput_min = (s8_narrow (RawLo))) ” 
  &&  “ (voutput_max = (s8_narrow (RawHi))) ” 
  &&  “ ((-128) <= voutput_min) ” 
  &&  “ (voutput_min <= 127) ” 
  &&  “ ((-128) <= voutput_max) ” 
  &&  “ (voutput_max <= 127) ” 
  &&  “ (0 <= (s8_bulk_count (batch_pre))) ” 
  &&  “ ((s8_bulk_count (batch_pre)) <= batch_pre) ” 
  &&  “ (0 <= batch64) ” 
  &&  “ (batch64 = ((s8_bulk_count (batch_pre)) - (batch_pre - batch ) )) ” 
  &&  “ ((batch_pre - batch ) <= (s8_bulk_count (batch_pre))) ”
  &&  (CharArray.full input_pre (batch_pre + 7 ) A )
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
  **  (CharArray.full output_pre (batch_pre - batch ) (s8_rvv_progress ((batch_pre - batch )) (batch_pre) ((s8_narrow (RawLo))) ((s8_narrow (RawHi))) (A)) )
  **  (CharArray.undef_full output batch )
) \/
(
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (RawHi: Z) (RawLo: Z) (A: (@list Z)) (batch64: Z) (voutput_max: Z) (voutput_min: Z) (output: Z) (input: Z) (batch: Z) (retval: Z) (PreH1 : (128 <= batch64)) (PreH2 : (retval = 128)) (PreH3 : (batch64 > 0)) (PreH4 : (0 < batch_pre)) (PreH5 : (batch_pre <= 18446744073709551608)) (PreH6 : (sizeof(CHAR) = 1)) (PreH7 : ((Zlength (A)) = (batch_pre + 7 ))) (PreH8 : (0 <= batch)) (PreH9 : (batch <= batch_pre)) (PreH10 : (input = (input_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH11 : (batch > 0)) (PreH12 : (output = (output_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH13 : (voutput_min = (s8_narrow (RawLo)))) (PreH14 : (voutput_max = (s8_narrow (RawHi)))) (PreH15 : ((-128) <= voutput_min)) (PreH16 : (voutput_min <= 127)) (PreH17 : ((-128) <= voutput_max)) (PreH18 : (voutput_max <= 127)) (PreH19 : (0 <= (s8_bulk_count (batch_pre)))) (PreH20 : ((s8_bulk_count (batch_pre)) <= batch_pre)) (PreH21 : (0 <= batch64)) (PreH22 : (batch64 = ((s8_bulk_count (batch_pre)) - (batch_pre - batch ) ))) (PreH23 : ((batch_pre - batch ) <= (s8_bulk_count (batch_pre)))) ,
  (CharArray.undef_full (output + (batch * sizeof(CHAR))) (batch - batch ) )
|--
  “ (128 <= batch) ”
  &&  emp
).

Definition test_rvv_entail_wit_4_1_split_goal_1 := 
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (RawHi: Z) (RawLo: Z) (A: (@list Z)) (batch64: Z) (voutput_max: Z) (voutput_min: Z) (output: Z) (input: Z) (batch: Z) (retval: Z) (PreH1 : (128 <= batch64)) (PreH2 : (retval = 128)) (PreH3 : (batch64 > 0)) (PreH4 : (0 < batch_pre)) (PreH5 : (batch_pre <= 18446744073709551608)) (PreH6 : (sizeof(CHAR) = 1)) (PreH7 : ((Zlength (A)) = (batch_pre + 7 ))) (PreH8 : (0 <= batch)) (PreH9 : (batch <= batch_pre)) (PreH10 : (input = (input_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH11 : (batch > 0)) (PreH12 : (output = (output_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH13 : (voutput_min = (s8_narrow (RawLo)))) (PreH14 : (voutput_max = (s8_narrow (RawHi)))) (PreH15 : ((-128) <= voutput_min)) (PreH16 : (voutput_min <= 127)) (PreH17 : ((-128) <= voutput_max)) (PreH18 : (voutput_max <= 127)) (PreH19 : (0 <= (s8_bulk_count (batch_pre)))) (PreH20 : ((s8_bulk_count (batch_pre)) <= batch_pre)) (PreH21 : (0 <= batch64)) (PreH22 : (batch64 = ((s8_bulk_count (batch_pre)) - (batch_pre - batch ) ))) (PreH23 : ((batch_pre - batch ) <= (s8_bulk_count (batch_pre)))) ,
  (CharArray.undef_full (output + (batch * sizeof(CHAR))) (batch - batch ) )
|--
  “ (128 <= batch) ”
.

Definition test_rvv_entail_wit_4_1_split_goal_spatial := 
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (RawHi: Z) (RawLo: Z) (A: (@list Z)) (batch64: Z) (voutput_max: Z) (voutput_min: Z) (output: Z) (input: Z) (batch: Z) (retval: Z) (PreH1 : (128 <= batch64)) (PreH2 : (retval = 128)) (PreH3 : (batch64 > 0)) (PreH4 : (0 < batch_pre)) (PreH5 : (batch_pre <= 18446744073709551608)) (PreH6 : (sizeof(CHAR) = 1)) (PreH7 : ((Zlength (A)) = (batch_pre + 7 ))) (PreH8 : (0 <= batch)) (PreH9 : (batch <= batch_pre)) (PreH10 : (input = (input_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH11 : (batch > 0)) (PreH12 : (output = (output_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH13 : (voutput_min = (s8_narrow (RawLo)))) (PreH14 : (voutput_max = (s8_narrow (RawHi)))) (PreH15 : ((-128) <= voutput_min)) (PreH16 : (voutput_min <= 127)) (PreH17 : ((-128) <= voutput_max)) (PreH18 : (voutput_max <= 127)) (PreH19 : (0 <= (s8_bulk_count (batch_pre)))) (PreH20 : ((s8_bulk_count (batch_pre)) <= batch_pre)) (PreH21 : (0 <= batch64)) (PreH22 : (batch64 = ((s8_bulk_count (batch_pre)) - (batch_pre - batch ) ))) (PreH23 : ((batch_pre - batch ) <= (s8_bulk_count (batch_pre)))) ,
  (CharArray.undef_full (output + (batch * sizeof(CHAR))) (batch - batch ) )
|--
  TT && emp 
.

Definition test_rvv_entail_wit_4_2 := 
(
forall (params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (RawHi: Z) (RawLo: Z) (A: (@list Z)) (batch64: Z) (voutput_max: Z) (voutput_min: Z) (output: Z) (input: Z) (batch: Z) (retval: Z) (PreH1 : (batch64 < 128)) (PreH2 : (retval = batch64)) (PreH3 : (batch64 > 0)) (PreH4 : (0 < batch_pre)) (PreH5 : (batch_pre <= 18446744073709551608)) (PreH6 : (sizeof(CHAR) = 1)) (PreH7 : ((Zlength (A)) = (batch_pre + 7 ))) (PreH8 : (0 <= batch)) (PreH9 : (batch <= batch_pre)) (PreH10 : (input = (input_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH11 : (batch > 0)) (PreH12 : (output = (output_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH13 : (voutput_min = (s8_narrow (RawLo)))) (PreH14 : (voutput_max = (s8_narrow (RawHi)))) (PreH15 : ((-128) <= voutput_min)) (PreH16 : (voutput_min <= 127)) (PreH17 : ((-128) <= voutput_max)) (PreH18 : (voutput_max <= 127)) (PreH19 : (0 <= (s8_bulk_count (batch_pre)))) (PreH20 : ((s8_bulk_count (batch_pre)) <= batch_pre)) (PreH21 : (0 <= batch64)) (PreH22 : (batch64 = ((s8_bulk_count (batch_pre)) - (batch_pre - batch ) ))) (PreH23 : ((batch_pre - batch ) <= (s8_bulk_count (batch_pre)))) ,
  (CharArray.full input_pre (batch_pre + 7 ) A )
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
  **  (CharArray.full output_pre (batch_pre - batch ) (s8_rvv_progress ((batch_pre - batch )) (batch_pre) ((s8_narrow (RawLo))) ((s8_narrow (RawHi))) (A)) )
  **  (CharArray.undef_full output batch )
|--
  “ (0 < retval) ” 
  &&  “ (retval <= 128) ” 
  &&  “ (retval <= batch) ” 
  &&  “ (retval <= batch64) ” 
  &&  “ (0 < batch_pre) ” 
  &&  “ (batch_pre <= 18446744073709551608) ” 
  &&  “ (sizeof(CHAR) = 1) ” 
  &&  “ ((Zlength (A)) = (batch_pre + 7 )) ” 
  &&  “ (0 <= batch) ” 
  &&  “ (batch <= batch_pre) ” 
  &&  “ (input = (input_pre + ((batch_pre - batch ) * sizeof(CHAR)))) ” 
  &&  “ (batch > 0) ” 
  &&  “ (output = (output_pre + ((batch_pre - batch ) * sizeof(CHAR)))) ” 
  &&  “ (voutput_min = (s8_narrow (RawLo))) ” 
  &&  “ (voutput_max = (s8_narrow (RawHi))) ” 
  &&  “ ((-128) <= voutput_min) ” 
  &&  “ (voutput_min <= 127) ” 
  &&  “ ((-128) <= voutput_max) ” 
  &&  “ (voutput_max <= 127) ” 
  &&  “ (0 <= (s8_bulk_count (batch_pre))) ” 
  &&  “ ((s8_bulk_count (batch_pre)) <= batch_pre) ” 
  &&  “ (0 <= batch64) ” 
  &&  “ (batch64 = ((s8_bulk_count (batch_pre)) - (batch_pre - batch ) )) ” 
  &&  “ ((batch_pre - batch ) <= (s8_bulk_count (batch_pre))) ”
  &&  (CharArray.full input_pre (batch_pre + 7 ) A )
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
  **  (CharArray.full output_pre (batch_pre - batch ) (s8_rvv_progress ((batch_pre - batch )) (batch_pre) ((s8_narrow (RawLo))) ((s8_narrow (RawHi))) (A)) )
  **  (CharArray.undef_full output batch )
) \/
(
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (RawHi: Z) (RawLo: Z) (A: (@list Z)) (batch64: Z) (voutput_max: Z) (voutput_min: Z) (output: Z) (input: Z) (batch: Z) (retval: Z) (PreH1 : (batch64 < 128)) (PreH2 : (retval = batch64)) (PreH3 : (batch64 > 0)) (PreH4 : (0 < batch_pre)) (PreH5 : (batch_pre <= 18446744073709551608)) (PreH6 : (sizeof(CHAR) = 1)) (PreH7 : ((Zlength (A)) = (batch_pre + 7 ))) (PreH8 : (0 <= batch)) (PreH9 : (batch <= batch_pre)) (PreH10 : (input = (input_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH11 : (batch > 0)) (PreH12 : (output = (output_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH13 : (voutput_min = (s8_narrow (RawLo)))) (PreH14 : (voutput_max = (s8_narrow (RawHi)))) (PreH15 : ((-128) <= voutput_min)) (PreH16 : (voutput_min <= 127)) (PreH17 : ((-128) <= voutput_max)) (PreH18 : (voutput_max <= 127)) (PreH19 : (0 <= (s8_bulk_count (batch_pre)))) (PreH20 : ((s8_bulk_count (batch_pre)) <= batch_pre)) (PreH21 : (0 <= batch64)) (PreH22 : (batch64 = ((s8_bulk_count (batch_pre)) - (batch_pre - batch ) ))) (PreH23 : ((batch_pre - batch ) <= (s8_bulk_count (batch_pre)))) ,
  (CharArray.undef_full (output + (batch * sizeof(CHAR))) (batch - batch ) )
|--
  “ (batch64 <= batch) ”
  &&  emp
).

Definition test_rvv_entail_wit_4_2_split_goal_1 := 
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (RawHi: Z) (RawLo: Z) (A: (@list Z)) (batch64: Z) (voutput_max: Z) (voutput_min: Z) (output: Z) (input: Z) (batch: Z) (retval: Z) (PreH1 : (batch64 < 128)) (PreH2 : (retval = batch64)) (PreH3 : (batch64 > 0)) (PreH4 : (0 < batch_pre)) (PreH5 : (batch_pre <= 18446744073709551608)) (PreH6 : (sizeof(CHAR) = 1)) (PreH7 : ((Zlength (A)) = (batch_pre + 7 ))) (PreH8 : (0 <= batch)) (PreH9 : (batch <= batch_pre)) (PreH10 : (input = (input_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH11 : (batch > 0)) (PreH12 : (output = (output_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH13 : (voutput_min = (s8_narrow (RawLo)))) (PreH14 : (voutput_max = (s8_narrow (RawHi)))) (PreH15 : ((-128) <= voutput_min)) (PreH16 : (voutput_min <= 127)) (PreH17 : ((-128) <= voutput_max)) (PreH18 : (voutput_max <= 127)) (PreH19 : (0 <= (s8_bulk_count (batch_pre)))) (PreH20 : ((s8_bulk_count (batch_pre)) <= batch_pre)) (PreH21 : (0 <= batch64)) (PreH22 : (batch64 = ((s8_bulk_count (batch_pre)) - (batch_pre - batch ) ))) (PreH23 : ((batch_pre - batch ) <= (s8_bulk_count (batch_pre)))) ,
  (CharArray.undef_full (output + (batch * sizeof(CHAR))) (batch - batch ) )
|--
  “ (batch64 <= batch) ”
.

Definition test_rvv_entail_wit_4_2_split_goal_spatial := 
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (RawHi: Z) (RawLo: Z) (A: (@list Z)) (batch64: Z) (voutput_max: Z) (voutput_min: Z) (output: Z) (input: Z) (batch: Z) (retval: Z) (PreH1 : (batch64 < 128)) (PreH2 : (retval = batch64)) (PreH3 : (batch64 > 0)) (PreH4 : (0 < batch_pre)) (PreH5 : (batch_pre <= 18446744073709551608)) (PreH6 : (sizeof(CHAR) = 1)) (PreH7 : ((Zlength (A)) = (batch_pre + 7 ))) (PreH8 : (0 <= batch)) (PreH9 : (batch <= batch_pre)) (PreH10 : (input = (input_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH11 : (batch > 0)) (PreH12 : (output = (output_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH13 : (voutput_min = (s8_narrow (RawLo)))) (PreH14 : (voutput_max = (s8_narrow (RawHi)))) (PreH15 : ((-128) <= voutput_min)) (PreH16 : (voutput_min <= 127)) (PreH17 : ((-128) <= voutput_max)) (PreH18 : (voutput_max <= 127)) (PreH19 : (0 <= (s8_bulk_count (batch_pre)))) (PreH20 : ((s8_bulk_count (batch_pre)) <= batch_pre)) (PreH21 : (0 <= batch64)) (PreH22 : (batch64 = ((s8_bulk_count (batch_pre)) - (batch_pre - batch ) ))) (PreH23 : ((batch_pre - batch ) <= (s8_bulk_count (batch_pre)))) ,
  (CharArray.undef_full (output + (batch * sizeof(CHAR))) (batch - batch ) )
|--
  TT && emp 
.

Definition test_rvv_entail_wit_5 := 
forall (params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (RawHi: Z) (RawLo: Z) (A: (@list Z)) (vl: Z) (batch: Z) (batch64: Z) (input: Z) (output: Z) (voutput_min: Z) (voutput_max: Z) (PreH1 : (0 < vl)) (PreH2 : (vl <= 128)) (PreH3 : (vl <= batch)) (PreH4 : (vl <= batch64)) (PreH5 : (0 < batch_pre)) (PreH6 : (batch_pre <= 18446744073709551608)) (PreH7 : (sizeof(CHAR) = 1)) (PreH8 : ((Zlength (A)) = (batch_pre + 7 ))) (PreH9 : (0 <= batch)) (PreH10 : (batch <= batch_pre)) (PreH11 : (input = (input_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH12 : (batch > 0)) (PreH13 : (output = (output_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH14 : (voutput_min = (s8_narrow (RawLo)))) (PreH15 : (voutput_max = (s8_narrow (RawHi)))) (PreH16 : ((-128) <= voutput_min)) (PreH17 : (voutput_min <= 127)) (PreH18 : ((-128) <= voutput_max)) (PreH19 : (voutput_max <= 127)) (PreH20 : (0 <= (s8_bulk_count (batch_pre)))) (PreH21 : ((s8_bulk_count (batch_pre)) <= batch_pre)) (PreH22 : (0 <= batch64)) (PreH23 : (batch64 = ((s8_bulk_count (batch_pre)) - (batch_pre - batch ) ))) (PreH24 : ((batch_pre - batch ) <= (s8_bulk_count (batch_pre)))) ,
  (CharArray.full output vl (s8_rvv_prefix (vl) ((s8_rvv_pack128 ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (0) (vl) ((batch_pre - batch )) (A))) (voutput_min) (0) (vl))) (voutput_max) (0) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (1) (vl) ((batch_pre - batch )) (A))) (voutput_min) (1) (vl))) (voutput_max) (1) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (2) (vl) ((batch_pre - batch )) (A))) (voutput_min) (2) (vl))) (voutput_max) (2) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (3) (vl) ((batch_pre - batch )) (A))) (voutput_min) (3) (vl))) (voutput_max) (3) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (4) (vl) ((batch_pre - batch )) (A))) (voutput_min) (4) (vl))) (voutput_max) (4) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (5) (vl) ((batch_pre - batch )) (A))) (voutput_min) (5) (vl))) (voutput_max) (5) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (6) (vl) ((batch_pre - batch )) (A))) (voutput_min) (6) (vl))) (voutput_max) (6) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (7) (vl) ((batch_pre - batch )) (A))) (voutput_min) (7) (vl))) (voutput_max) (7) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (8) (vl) ((batch_pre - batch )) (A))) (voutput_min) (8) (vl))) (voutput_max) (8) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (9) (vl) ((batch_pre - batch )) (A))) (voutput_min) (9) (vl))) (voutput_max) (9) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (10) (vl) ((batch_pre - batch )) (A))) (voutput_min) (10) (vl))) (voutput_max) (10) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (11) (vl) ((batch_pre - batch )) (A))) (voutput_min) (11) (vl))) (voutput_max) (11) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (12) (vl) ((batch_pre - batch )) (A))) (voutput_min) (12) (vl))) (voutput_max) (12) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (13) (vl) ((batch_pre - batch )) (A))) (voutput_min) (13) (vl))) (voutput_max) (13) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (14) (vl) ((batch_pre - batch )) (A))) (voutput_min) (14) (vl))) (voutput_max) (14) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (15) (vl) ((batch_pre - batch )) (A))) (voutput_min) (15) (vl))) (voutput_max) (15) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (16) (vl) ((batch_pre - batch )) (A))) (voutput_min) (16) (vl))) (voutput_max) (16) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (17) (vl) ((batch_pre - batch )) (A))) (voutput_min) (17) (vl))) (voutput_max) (17) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (18) (vl) ((batch_pre - batch )) (A))) (voutput_min) (18) (vl))) (voutput_max) (18) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (19) (vl) ((batch_pre - batch )) (A))) (voutput_min) (19) (vl))) (voutput_max) (19) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (20) (vl) ((batch_pre - batch )) (A))) (voutput_min) (20) (vl))) (voutput_max) (20) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (21) (vl) ((batch_pre - batch )) (A))) (voutput_min) (21) (vl))) (voutput_max) (21) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (22) (vl) ((batch_pre - batch )) (A))) (voutput_min) (22) (vl))) (voutput_max) (22) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (23) (vl) ((batch_pre - batch )) (A))) (voutput_min) (23) (vl))) (voutput_max) (23) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (24) (vl) ((batch_pre - batch )) (A))) (voutput_min) (24) (vl))) (voutput_max) (24) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (25) (vl) ((batch_pre - batch )) (A))) (voutput_min) (25) (vl))) (voutput_max) (25) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (26) (vl) ((batch_pre - batch )) (A))) (voutput_min) (26) (vl))) (voutput_max) (26) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (27) (vl) ((batch_pre - batch )) (A))) (voutput_min) (27) (vl))) (voutput_max) (27) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (28) (vl) ((batch_pre - batch )) (A))) (voutput_min) (28) (vl))) (voutput_max) (28) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (29) (vl) ((batch_pre - batch )) (A))) (voutput_min) (29) (vl))) (voutput_max) (29) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (30) (vl) ((batch_pre - batch )) (A))) (voutput_min) (30) (vl))) (voutput_max) (30) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (31) (vl) ((batch_pre - batch )) (A))) (voutput_min) (31) (vl))) (voutput_max) (31) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (32) (vl) ((batch_pre - batch )) (A))) (voutput_min) (32) (vl))) (voutput_max) (32) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (33) (vl) ((batch_pre - batch )) (A))) (voutput_min) (33) (vl))) (voutput_max) (33) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (34) (vl) ((batch_pre - batch )) (A))) (voutput_min) (34) (vl))) (voutput_max) (34) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (35) (vl) ((batch_pre - batch )) (A))) (voutput_min) (35) (vl))) (voutput_max) (35) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (36) (vl) ((batch_pre - batch )) (A))) (voutput_min) (36) (vl))) (voutput_max) (36) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (37) (vl) ((batch_pre - batch )) (A))) (voutput_min) (37) (vl))) (voutput_max) (37) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (38) (vl) ((batch_pre - batch )) (A))) (voutput_min) (38) (vl))) (voutput_max) (38) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (39) (vl) ((batch_pre - batch )) (A))) (voutput_min) (39) (vl))) (voutput_max) (39) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (40) (vl) ((batch_pre - batch )) (A))) (voutput_min) (40) (vl))) (voutput_max) (40) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (41) (vl) ((batch_pre - batch )) (A))) (voutput_min) (41) (vl))) (voutput_max) (41) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (42) (vl) ((batch_pre - batch )) (A))) (voutput_min) (42) (vl))) (voutput_max) (42) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (43) (vl) ((batch_pre - batch )) (A))) (voutput_min) (43) (vl))) (voutput_max) (43) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (44) (vl) ((batch_pre - batch )) (A))) (voutput_min) (44) (vl))) (voutput_max) (44) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (45) (vl) ((batch_pre - batch )) (A))) (voutput_min) (45) (vl))) (voutput_max) (45) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (46) (vl) ((batch_pre - batch )) (A))) (voutput_min) (46) (vl))) (voutput_max) (46) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (47) (vl) ((batch_pre - batch )) (A))) (voutput_min) (47) (vl))) (voutput_max) (47) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (48) (vl) ((batch_pre - batch )) (A))) (voutput_min) (48) (vl))) (voutput_max) (48) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (49) (vl) ((batch_pre - batch )) (A))) (voutput_min) (49) (vl))) (voutput_max) (49) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (50) (vl) ((batch_pre - batch )) (A))) (voutput_min) (50) (vl))) (voutput_max) (50) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (51) (vl) ((batch_pre - batch )) (A))) (voutput_min) (51) (vl))) (voutput_max) (51) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (52) (vl) ((batch_pre - batch )) (A))) (voutput_min) (52) (vl))) (voutput_max) (52) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (53) (vl) ((batch_pre - batch )) (A))) (voutput_min) (53) (vl))) (voutput_max) (53) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (54) (vl) ((batch_pre - batch )) (A))) (voutput_min) (54) (vl))) (voutput_max) (54) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (55) (vl) ((batch_pre - batch )) (A))) (voutput_min) (55) (vl))) (voutput_max) (55) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (56) (vl) ((batch_pre - batch )) (A))) (voutput_min) (56) (vl))) (voutput_max) (56) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (57) (vl) ((batch_pre - batch )) (A))) (voutput_min) (57) (vl))) (voutput_max) (57) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (58) (vl) ((batch_pre - batch )) (A))) (voutput_min) (58) (vl))) (voutput_max) (58) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (59) (vl) ((batch_pre - batch )) (A))) (voutput_min) (59) (vl))) (voutput_max) (59) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (60) (vl) ((batch_pre - batch )) (A))) (voutput_min) (60) (vl))) (voutput_max) (60) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (61) (vl) ((batch_pre - batch )) (A))) (voutput_min) (61) (vl))) (voutput_max) (61) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (62) (vl) ((batch_pre - batch )) (A))) (voutput_min) (62) (vl))) (voutput_max) (62) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (63) (vl) ((batch_pre - batch )) (A))) (voutput_min) (63) (vl))) (voutput_max) (63) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (64) (vl) ((batch_pre - batch )) (A))) (voutput_min) (64) (vl))) (voutput_max) (64) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (65) (vl) ((batch_pre - batch )) (A))) (voutput_min) (65) (vl))) (voutput_max) (65) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (66) (vl) ((batch_pre - batch )) (A))) (voutput_min) (66) (vl))) (voutput_max) (66) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (67) (vl) ((batch_pre - batch )) (A))) (voutput_min) (67) (vl))) (voutput_max) (67) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (68) (vl) ((batch_pre - batch )) (A))) (voutput_min) (68) (vl))) (voutput_max) (68) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (69) (vl) ((batch_pre - batch )) (A))) (voutput_min) (69) (vl))) (voutput_max) (69) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (70) (vl) ((batch_pre - batch )) (A))) (voutput_min) (70) (vl))) (voutput_max) (70) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (71) (vl) ((batch_pre - batch )) (A))) (voutput_min) (71) (vl))) (voutput_max) (71) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (72) (vl) ((batch_pre - batch )) (A))) (voutput_min) (72) (vl))) (voutput_max) (72) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (73) (vl) ((batch_pre - batch )) (A))) (voutput_min) (73) (vl))) (voutput_max) (73) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (74) (vl) ((batch_pre - batch )) (A))) (voutput_min) (74) (vl))) (voutput_max) (74) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (75) (vl) ((batch_pre - batch )) (A))) (voutput_min) (75) (vl))) (voutput_max) (75) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (76) (vl) ((batch_pre - batch )) (A))) (voutput_min) (76) (vl))) (voutput_max) (76) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (77) (vl) ((batch_pre - batch )) (A))) (voutput_min) (77) (vl))) (voutput_max) (77) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (78) (vl) ((batch_pre - batch )) (A))) (voutput_min) (78) (vl))) (voutput_max) (78) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (79) (vl) ((batch_pre - batch )) (A))) (voutput_min) (79) (vl))) (voutput_max) (79) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (80) (vl) ((batch_pre - batch )) (A))) (voutput_min) (80) (vl))) (voutput_max) (80) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (81) (vl) ((batch_pre - batch )) (A))) (voutput_min) (81) (vl))) (voutput_max) (81) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (82) (vl) ((batch_pre - batch )) (A))) (voutput_min) (82) (vl))) (voutput_max) (82) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (83) (vl) ((batch_pre - batch )) (A))) (voutput_min) (83) (vl))) (voutput_max) (83) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (84) (vl) ((batch_pre - batch )) (A))) (voutput_min) (84) (vl))) (voutput_max) (84) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (85) (vl) ((batch_pre - batch )) (A))) (voutput_min) (85) (vl))) (voutput_max) (85) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (86) (vl) ((batch_pre - batch )) (A))) (voutput_min) (86) (vl))) (voutput_max) (86) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (87) (vl) ((batch_pre - batch )) (A))) (voutput_min) (87) (vl))) (voutput_max) (87) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (88) (vl) ((batch_pre - batch )) (A))) (voutput_min) (88) (vl))) (voutput_max) (88) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (89) (vl) ((batch_pre - batch )) (A))) (voutput_min) (89) (vl))) (voutput_max) (89) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (90) (vl) ((batch_pre - batch )) (A))) (voutput_min) (90) (vl))) (voutput_max) (90) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (91) (vl) ((batch_pre - batch )) (A))) (voutput_min) (91) (vl))) (voutput_max) (91) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (92) (vl) ((batch_pre - batch )) (A))) (voutput_min) (92) (vl))) (voutput_max) (92) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (93) (vl) ((batch_pre - batch )) (A))) (voutput_min) (93) (vl))) (voutput_max) (93) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (94) (vl) ((batch_pre - batch )) (A))) (voutput_min) (94) (vl))) (voutput_max) (94) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (95) (vl) ((batch_pre - batch )) (A))) (voutput_min) (95) (vl))) (voutput_max) (95) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (96) (vl) ((batch_pre - batch )) (A))) (voutput_min) (96) (vl))) (voutput_max) (96) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (97) (vl) ((batch_pre - batch )) (A))) (voutput_min) (97) (vl))) (voutput_max) (97) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (98) (vl) ((batch_pre - batch )) (A))) (voutput_min) (98) (vl))) (voutput_max) (98) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (99) (vl) ((batch_pre - batch )) (A))) (voutput_min) (99) (vl))) (voutput_max) (99) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (100) (vl) ((batch_pre - batch )) (A))) (voutput_min) (100) (vl))) (voutput_max) (100) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (101) (vl) ((batch_pre - batch )) (A))) (voutput_min) (101) (vl))) (voutput_max) (101) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (102) (vl) ((batch_pre - batch )) (A))) (voutput_min) (102) (vl))) (voutput_max) (102) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (103) (vl) ((batch_pre - batch )) (A))) (voutput_min) (103) (vl))) (voutput_max) (103) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (104) (vl) ((batch_pre - batch )) (A))) (voutput_min) (104) (vl))) (voutput_max) (104) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (105) (vl) ((batch_pre - batch )) (A))) (voutput_min) (105) (vl))) (voutput_max) (105) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (106) (vl) ((batch_pre - batch )) (A))) (voutput_min) (106) (vl))) (voutput_max) (106) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (107) (vl) ((batch_pre - batch )) (A))) (voutput_min) (107) (vl))) (voutput_max) (107) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (108) (vl) ((batch_pre - batch )) (A))) (voutput_min) (108) (vl))) (voutput_max) (108) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (109) (vl) ((batch_pre - batch )) (A))) (voutput_min) (109) (vl))) (voutput_max) (109) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (110) (vl) ((batch_pre - batch )) (A))) (voutput_min) (110) (vl))) (voutput_max) (110) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (111) (vl) ((batch_pre - batch )) (A))) (voutput_min) (111) (vl))) (voutput_max) (111) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (112) (vl) ((batch_pre - batch )) (A))) (voutput_min) (112) (vl))) (voutput_max) (112) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (113) (vl) ((batch_pre - batch )) (A))) (voutput_min) (113) (vl))) (voutput_max) (113) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (114) (vl) ((batch_pre - batch )) (A))) (voutput_min) (114) (vl))) (voutput_max) (114) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (115) (vl) ((batch_pre - batch )) (A))) (voutput_min) (115) (vl))) (voutput_max) (115) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (116) (vl) ((batch_pre - batch )) (A))) (voutput_min) (116) (vl))) (voutput_max) (116) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (117) (vl) ((batch_pre - batch )) (A))) (voutput_min) (117) (vl))) (voutput_max) (117) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (118) (vl) ((batch_pre - batch )) (A))) (voutput_min) (118) (vl))) (voutput_max) (118) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (119) (vl) ((batch_pre - batch )) (A))) (voutput_min) (119) (vl))) (voutput_max) (119) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (120) (vl) ((batch_pre - batch )) (A))) (voutput_min) (120) (vl))) (voutput_max) (120) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (121) (vl) ((batch_pre - batch )) (A))) (voutput_min) (121) (vl))) (voutput_max) (121) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (122) (vl) ((batch_pre - batch )) (A))) (voutput_min) (122) (vl))) (voutput_max) (122) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (123) (vl) ((batch_pre - batch )) (A))) (voutput_min) (123) (vl))) (voutput_max) (123) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (124) (vl) ((batch_pre - batch )) (A))) (voutput_min) (124) (vl))) (voutput_max) (124) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (125) (vl) ((batch_pre - batch )) (A))) (voutput_min) (125) (vl))) (voutput_max) (125) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (126) (vl) ((batch_pre - batch )) (A))) (voutput_min) (126) (vl))) (voutput_max) (126) (vl))) ((s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (127) (vl) ((batch_pre - batch )) (A))) (voutput_min) (127) (vl))) (voutput_max) (127) (vl)))))) )
  **  (CharArray.undef_full (output + (vl * sizeof(CHAR))) (batch - vl ) )
  **  (CharArray.full input_pre (batch_pre + 7 ) A )
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
  **  (CharArray.full output_pre (batch_pre - batch ) (s8_rvv_progress ((batch_pre - batch )) (batch_pre) ((s8_narrow (RawLo))) ((s8_narrow (RawHi))) (A)) )
|--
  (“ (0 < batch_pre) ” 
  &&  “ (batch_pre <= 18446744073709551608) ” 
  &&  “ (sizeof(CHAR) = 1) ” 
  &&  “ ((Zlength (A)) = (batch_pre + 7 )) ” 
  &&  “ (0 <= (batch - vl )) ” 
  &&  “ ((batch - vl ) <= batch_pre) ” 
  &&  “ ((input + (vl * sizeof(CHAR))) = (input_pre + ((batch_pre - (batch - vl ) ) * sizeof(CHAR)))) ” 
  &&  “ ((batch - vl ) = 0) ” 
  &&  “ (voutput_min = (s8_narrow (RawLo))) ” 
  &&  “ (voutput_max = (s8_narrow (RawHi))) ” 
  &&  “ ((-128) <= voutput_min) ” 
  &&  “ (voutput_min <= 127) ” 
  &&  “ ((-128) <= voutput_max) ” 
  &&  “ (voutput_max <= 127) ” 
  &&  “ (0 <= (s8_bulk_count (batch_pre))) ” 
  &&  “ ((s8_bulk_count (batch_pre)) <= batch_pre) ” 
  &&  “ (0 <= (batch64 - vl )) ” 
  &&  “ ((batch64 - vl ) = ((s8_bulk_count (batch_pre)) - (batch_pre - (batch - vl ) ) )) ” 
  &&  “ ((batch_pre - (batch - vl ) ) <= (s8_bulk_count (batch_pre))) ”
  &&  (CharArray.full input_pre (batch_pre + 7 ) A )
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
  **  (CharArray.full output_pre (batch_pre - (batch - vl ) ) (s8_rvv_progress ((batch_pre - (batch - vl ) )) (batch_pre) ((s8_narrow (RawLo))) ((s8_narrow (RawHi))) (A)) )
  **  (CharArray.undef_full (output + (vl * sizeof(CHAR))) (batch - vl ) ))
  ||
  (“ (0 < batch_pre) ” 
  &&  “ (batch_pre <= 18446744073709551608) ” 
  &&  “ (sizeof(CHAR) = 1) ” 
  &&  “ ((Zlength (A)) = (batch_pre + 7 )) ” 
  &&  “ (0 <= (batch - vl )) ” 
  &&  “ ((batch - vl ) <= batch_pre) ” 
  &&  “ ((input + (vl * sizeof(CHAR))) = (input_pre + ((batch_pre - (batch - vl ) ) * sizeof(CHAR)))) ” 
  &&  “ ((batch - vl ) > 0) ” 
  &&  “ ((output + (vl * sizeof(CHAR))) = (output_pre + ((batch_pre - (batch - vl ) ) * sizeof(CHAR)))) ” 
  &&  “ (voutput_min = (s8_narrow (RawLo))) ” 
  &&  “ (voutput_max = (s8_narrow (RawHi))) ” 
  &&  “ ((-128) <= voutput_min) ” 
  &&  “ (voutput_min <= 127) ” 
  &&  “ ((-128) <= voutput_max) ” 
  &&  “ (voutput_max <= 127) ” 
  &&  “ (0 <= (s8_bulk_count (batch_pre))) ” 
  &&  “ ((s8_bulk_count (batch_pre)) <= batch_pre) ” 
  &&  “ (0 <= (batch64 - vl )) ” 
  &&  “ ((batch64 - vl ) = ((s8_bulk_count (batch_pre)) - (batch_pre - (batch - vl ) ) )) ” 
  &&  “ ((batch_pre - (batch - vl ) ) <= (s8_bulk_count (batch_pre))) ”
  &&  (CharArray.full input_pre (batch_pre + 7 ) A )
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
  **  (CharArray.full output_pre (batch_pre - (batch - vl ) ) (s8_rvv_progress ((batch_pre - (batch - vl ) )) (batch_pre) ((s8_narrow (RawLo))) ((s8_narrow (RawHi))) (A)) )
  **  (CharArray.undef_full (output + (vl * sizeof(CHAR))) (batch - vl ) ))
.

Definition test_rvv_entail_wit_6_1 := 
(
forall (params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (RawHi: Z) (RawLo: Z) (A: (@list Z)) (output: Z) (batch64: Z) (voutput_max: Z) (voutput_min: Z) (input: Z) (batch: Z) (PreH1 : (batch64 <= 0)) (PreH2 : (0 < batch_pre)) (PreH3 : (batch_pre <= 18446744073709551608)) (PreH4 : (sizeof(CHAR) = 1)) (PreH5 : ((Zlength (A)) = (batch_pre + 7 ))) (PreH6 : (0 <= batch)) (PreH7 : (batch <= batch_pre)) (PreH8 : (input = (input_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH9 : (batch = 0)) (PreH10 : (voutput_min = (s8_narrow (RawLo)))) (PreH11 : (voutput_max = (s8_narrow (RawHi)))) (PreH12 : ((-128) <= voutput_min)) (PreH13 : (voutput_min <= 127)) (PreH14 : ((-128) <= voutput_max)) (PreH15 : (voutput_max <= 127)) (PreH16 : (0 <= (s8_bulk_count (batch_pre)))) (PreH17 : ((s8_bulk_count (batch_pre)) <= batch_pre)) (PreH18 : (0 <= batch64)) (PreH19 : (batch64 = ((s8_bulk_count (batch_pre)) - (batch_pre - batch ) ))) (PreH20 : ((batch_pre - batch ) <= (s8_bulk_count (batch_pre)))) ,
  (CharArray.full input_pre (batch_pre + 7 ) A )
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
  **  (CharArray.full output_pre (batch_pre - batch ) (s8_rvv_progress ((batch_pre - batch )) (batch_pre) ((s8_narrow (RawLo))) ((s8_narrow (RawHi))) (A)) )
  **  (CharArray.undef_full output batch )
|--
  “ (batch64 = 0) ” 
  &&  “ (0 < batch_pre) ” 
  &&  “ (batch_pre <= 18446744073709551608) ” 
  &&  “ (sizeof(CHAR) = 1) ” 
  &&  “ ((Zlength (A)) = (batch_pre + 7 )) ” 
  &&  “ (0 <= batch) ” 
  &&  “ (batch <= batch_pre) ” 
  &&  “ (input = (input_pre + ((batch_pre - batch ) * sizeof(CHAR)))) ” 
  &&  “ (batch = 0) ” 
  &&  “ (voutput_min = (s8_narrow (RawLo))) ” 
  &&  “ (voutput_max = (s8_narrow (RawHi))) ” 
  &&  “ ((-128) <= voutput_min) ” 
  &&  “ (voutput_min <= 127) ” 
  &&  “ ((-128) <= voutput_max) ” 
  &&  “ (voutput_max <= 127) ” 
  &&  “ ((s8_bulk_count (batch_pre)) <= (batch_pre - batch )) ”
  &&  (CharArray.full input_pre (batch_pre + 7 ) A )
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
  **  (CharArray.full output_pre (batch_pre - batch ) (s8_rvv_progress ((batch_pre - batch )) (batch_pre) ((s8_narrow (RawLo))) ((s8_narrow (RawHi))) (A)) )
  **  (CharArray.undef_full output batch )
) \/
(
forall (input_pre: Z) (batch_pre: Z) (RawHi: Z) (RawLo: Z) (A: (@list Z)) (output: Z) (batch64: Z) (voutput_max: Z) (voutput_min: Z) (input: Z) (batch: Z) (PreH1 : (batch64 <= 0)) (PreH2 : (0 < batch_pre)) (PreH3 : (batch_pre <= 18446744073709551608)) (PreH4 : (sizeof(CHAR) = 1)) (PreH5 : ((Zlength (A)) = (batch_pre + 7 ))) (PreH6 : (0 <= batch)) (PreH7 : (batch <= batch_pre)) (PreH8 : (input = (input_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH9 : (batch = 0)) (PreH10 : (voutput_min = (s8_narrow (RawLo)))) (PreH11 : (voutput_max = (s8_narrow (RawHi)))) (PreH12 : ((-128) <= voutput_min)) (PreH13 : (voutput_min <= 127)) (PreH14 : ((-128) <= voutput_max)) (PreH15 : (voutput_max <= 127)) (PreH16 : (0 <= (s8_bulk_count (batch_pre)))) (PreH17 : ((s8_bulk_count (batch_pre)) <= batch_pre)) (PreH18 : (0 <= batch64)) (PreH19 : (batch64 = ((s8_bulk_count (batch_pre)) - (batch_pre - batch ) ))) (PreH20 : ((batch_pre - batch ) <= (s8_bulk_count (batch_pre)))) ,
  (CharArray.undef_full (output + (batch * sizeof(CHAR))) (batch - batch ) )
|--
  TT && emp 
).

Definition test_rvv_entail_wit_6_1_split_goal_spatial := 
forall (input_pre: Z) (batch_pre: Z) (RawHi: Z) (RawLo: Z) (A: (@list Z)) (output: Z) (batch64: Z) (voutput_max: Z) (voutput_min: Z) (input: Z) (batch: Z) (PreH1 : (batch64 <= 0)) (PreH2 : (0 < batch_pre)) (PreH3 : (batch_pre <= 18446744073709551608)) (PreH4 : (sizeof(CHAR) = 1)) (PreH5 : ((Zlength (A)) = (batch_pre + 7 ))) (PreH6 : (0 <= batch)) (PreH7 : (batch <= batch_pre)) (PreH8 : (input = (input_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH9 : (batch = 0)) (PreH10 : (voutput_min = (s8_narrow (RawLo)))) (PreH11 : (voutput_max = (s8_narrow (RawHi)))) (PreH12 : ((-128) <= voutput_min)) (PreH13 : (voutput_min <= 127)) (PreH14 : ((-128) <= voutput_max)) (PreH15 : (voutput_max <= 127)) (PreH16 : (0 <= (s8_bulk_count (batch_pre)))) (PreH17 : ((s8_bulk_count (batch_pre)) <= batch_pre)) (PreH18 : (0 <= batch64)) (PreH19 : (batch64 = ((s8_bulk_count (batch_pre)) - (batch_pre - batch ) ))) (PreH20 : ((batch_pre - batch ) <= (s8_bulk_count (batch_pre)))) ,
  (CharArray.undef_full (output + (batch * sizeof(CHAR))) (batch - batch ) )
|--
  TT && emp 
.

Definition test_rvv_entail_wit_6_2 := 
(
forall (params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (RawHi: Z) (RawLo: Z) (A: (@list Z)) (batch64: Z) (voutput_max: Z) (voutput_min: Z) (output: Z) (input: Z) (batch: Z) (PreH1 : (batch64 <= 0)) (PreH2 : (0 < batch_pre)) (PreH3 : (batch_pre <= 18446744073709551608)) (PreH4 : (sizeof(CHAR) = 1)) (PreH5 : ((Zlength (A)) = (batch_pre + 7 ))) (PreH6 : (0 <= batch)) (PreH7 : (batch <= batch_pre)) (PreH8 : (input = (input_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH9 : (batch > 0)) (PreH10 : (output = (output_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH11 : (voutput_min = (s8_narrow (RawLo)))) (PreH12 : (voutput_max = (s8_narrow (RawHi)))) (PreH13 : ((-128) <= voutput_min)) (PreH14 : (voutput_min <= 127)) (PreH15 : ((-128) <= voutput_max)) (PreH16 : (voutput_max <= 127)) (PreH17 : (0 <= (s8_bulk_count (batch_pre)))) (PreH18 : ((s8_bulk_count (batch_pre)) <= batch_pre)) (PreH19 : (0 <= batch64)) (PreH20 : (batch64 = ((s8_bulk_count (batch_pre)) - (batch_pre - batch ) ))) (PreH21 : ((batch_pre - batch ) <= (s8_bulk_count (batch_pre)))) ,
  (CharArray.full input_pre (batch_pre + 7 ) A )
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
  **  (CharArray.full output_pre (batch_pre - batch ) (s8_rvv_progress ((batch_pre - batch )) (batch_pre) ((s8_narrow (RawLo))) ((s8_narrow (RawHi))) (A)) )
  **  (CharArray.undef_full output batch )
|--
  “ (batch64 = 0) ” 
  &&  “ (0 < batch_pre) ” 
  &&  “ (batch_pre <= 18446744073709551608) ” 
  &&  “ (sizeof(CHAR) = 1) ” 
  &&  “ ((Zlength (A)) = (batch_pre + 7 )) ” 
  &&  “ (0 <= batch) ” 
  &&  “ (batch <= batch_pre) ” 
  &&  “ (input = (input_pre + ((batch_pre - batch ) * sizeof(CHAR)))) ” 
  &&  “ (batch > 0) ” 
  &&  “ (output = (output_pre + ((batch_pre - batch ) * sizeof(CHAR)))) ” 
  &&  “ (voutput_min = (s8_narrow (RawLo))) ” 
  &&  “ (voutput_max = (s8_narrow (RawHi))) ” 
  &&  “ ((-128) <= voutput_min) ” 
  &&  “ (voutput_min <= 127) ” 
  &&  “ ((-128) <= voutput_max) ” 
  &&  “ (voutput_max <= 127) ” 
  &&  “ ((s8_bulk_count (batch_pre)) <= (batch_pre - batch )) ”
  &&  (CharArray.full input_pre (batch_pre + 7 ) A )
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
  **  (CharArray.full output_pre (batch_pre - batch ) (s8_rvv_progress ((batch_pre - batch )) (batch_pre) ((s8_narrow (RawLo))) ((s8_narrow (RawHi))) (A)) )
  **  (CharArray.undef_full output batch )
) \/
(
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (RawHi: Z) (RawLo: Z) (A: (@list Z)) (batch64: Z) (voutput_max: Z) (voutput_min: Z) (output: Z) (input: Z) (batch: Z) (PreH1 : (batch64 <= 0)) (PreH2 : (0 < batch_pre)) (PreH3 : (batch_pre <= 18446744073709551608)) (PreH4 : (sizeof(CHAR) = 1)) (PreH5 : ((Zlength (A)) = (batch_pre + 7 ))) (PreH6 : (0 <= batch)) (PreH7 : (batch <= batch_pre)) (PreH8 : (input = (input_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH9 : (batch > 0)) (PreH10 : (output = (output_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH11 : (voutput_min = (s8_narrow (RawLo)))) (PreH12 : (voutput_max = (s8_narrow (RawHi)))) (PreH13 : ((-128) <= voutput_min)) (PreH14 : (voutput_min <= 127)) (PreH15 : ((-128) <= voutput_max)) (PreH16 : (voutput_max <= 127)) (PreH17 : (0 <= (s8_bulk_count (batch_pre)))) (PreH18 : ((s8_bulk_count (batch_pre)) <= batch_pre)) (PreH19 : (0 <= batch64)) (PreH20 : (batch64 = ((s8_bulk_count (batch_pre)) - (batch_pre - batch ) ))) (PreH21 : ((batch_pre - batch ) <= (s8_bulk_count (batch_pre)))) ,
  (CharArray.undef_full (output + (batch * sizeof(CHAR))) (batch - batch ) )
|--
  “ ((s8_bulk_count (batch_pre)) <= (batch_pre - batch )) ”
  &&  emp
).

Definition test_rvv_entail_wit_6_2_split_goal_1 := 
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (RawHi: Z) (RawLo: Z) (A: (@list Z)) (batch64: Z) (voutput_max: Z) (voutput_min: Z) (output: Z) (input: Z) (batch: Z) (PreH1 : (batch64 <= 0)) (PreH2 : (0 < batch_pre)) (PreH3 : (batch_pre <= 18446744073709551608)) (PreH4 : (sizeof(CHAR) = 1)) (PreH5 : ((Zlength (A)) = (batch_pre + 7 ))) (PreH6 : (0 <= batch)) (PreH7 : (batch <= batch_pre)) (PreH8 : (input = (input_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH9 : (batch > 0)) (PreH10 : (output = (output_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH11 : (voutput_min = (s8_narrow (RawLo)))) (PreH12 : (voutput_max = (s8_narrow (RawHi)))) (PreH13 : ((-128) <= voutput_min)) (PreH14 : (voutput_min <= 127)) (PreH15 : ((-128) <= voutput_max)) (PreH16 : (voutput_max <= 127)) (PreH17 : (0 <= (s8_bulk_count (batch_pre)))) (PreH18 : ((s8_bulk_count (batch_pre)) <= batch_pre)) (PreH19 : (0 <= batch64)) (PreH20 : (batch64 = ((s8_bulk_count (batch_pre)) - (batch_pre - batch ) ))) (PreH21 : ((batch_pre - batch ) <= (s8_bulk_count (batch_pre)))) ,
  (CharArray.undef_full (output + (batch * sizeof(CHAR))) (batch - batch ) )
|--
  “ ((s8_bulk_count (batch_pre)) <= (batch_pre - batch )) ”
.

Definition test_rvv_entail_wit_6_2_split_goal_spatial := 
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (RawHi: Z) (RawLo: Z) (A: (@list Z)) (batch64: Z) (voutput_max: Z) (voutput_min: Z) (output: Z) (input: Z) (batch: Z) (PreH1 : (batch64 <= 0)) (PreH2 : (0 < batch_pre)) (PreH3 : (batch_pre <= 18446744073709551608)) (PreH4 : (sizeof(CHAR) = 1)) (PreH5 : ((Zlength (A)) = (batch_pre + 7 ))) (PreH6 : (0 <= batch)) (PreH7 : (batch <= batch_pre)) (PreH8 : (input = (input_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH9 : (batch > 0)) (PreH10 : (output = (output_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH11 : (voutput_min = (s8_narrow (RawLo)))) (PreH12 : (voutput_max = (s8_narrow (RawHi)))) (PreH13 : ((-128) <= voutput_min)) (PreH14 : (voutput_min <= 127)) (PreH15 : ((-128) <= voutput_max)) (PreH16 : (voutput_max <= 127)) (PreH17 : (0 <= (s8_bulk_count (batch_pre)))) (PreH18 : ((s8_bulk_count (batch_pre)) <= batch_pre)) (PreH19 : (0 <= batch64)) (PreH20 : (batch64 = ((s8_bulk_count (batch_pre)) - (batch_pre - batch ) ))) (PreH21 : ((batch_pre - batch ) <= (s8_bulk_count (batch_pre)))) ,
  (CharArray.undef_full (output + (batch * sizeof(CHAR))) (batch - batch ) )
|--
  TT && emp 
.

Definition test_rvv_entail_wit_7_1 := 
(
forall (params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (RawHi: Z) (RawLo: Z) (A: (@list Z)) (voutput_max: Z) (voutput_min: Z) (output: Z) (input: Z) (batch: Z) (batch64: Z) (retval: Z) (PreH1 : (128 <= batch)) (PreH2 : (retval = 128)) (PreH3 : (batch > 0)) (PreH4 : (batch64 = 0)) (PreH5 : (0 < batch_pre)) (PreH6 : (batch_pre <= 18446744073709551608)) (PreH7 : (sizeof(CHAR) = 1)) (PreH8 : ((Zlength (A)) = (batch_pre + 7 ))) (PreH9 : (0 <= batch)) (PreH10 : (batch <= batch_pre)) (PreH11 : (input = (input_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH12 : (batch > 0)) (PreH13 : (output = (output_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH14 : (voutput_min = (s8_narrow (RawLo)))) (PreH15 : (voutput_max = (s8_narrow (RawHi)))) (PreH16 : ((-128) <= voutput_min)) (PreH17 : (voutput_min <= 127)) (PreH18 : ((-128) <= voutput_max)) (PreH19 : (voutput_max <= 127)) (PreH20 : ((s8_bulk_count (batch_pre)) <= (batch_pre - batch ))) ,
  (CharArray.full input_pre (batch_pre + 7 ) A )
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
  **  (CharArray.full output_pre (batch_pre - batch ) (s8_rvv_progress ((batch_pre - batch )) (batch_pre) ((s8_narrow (RawLo))) ((s8_narrow (RawHi))) (A)) )
  **  (CharArray.undef_full output batch )
|--
  “ (batch64 = 0) ” 
  &&  “ (0 < retval) ” 
  &&  “ (retval <= 128) ” 
  &&  “ (retval <= batch) ” 
  &&  “ (0 < batch_pre) ” 
  &&  “ (batch_pre <= 18446744073709551608) ” 
  &&  “ (sizeof(CHAR) = 1) ” 
  &&  “ ((Zlength (A)) = (batch_pre + 7 )) ” 
  &&  “ (0 <= batch) ” 
  &&  “ (batch <= batch_pre) ” 
  &&  “ (input = (input_pre + ((batch_pre - batch ) * sizeof(CHAR)))) ” 
  &&  “ (batch > 0) ” 
  &&  “ (output = (output_pre + ((batch_pre - batch ) * sizeof(CHAR)))) ” 
  &&  “ (voutput_min = (s8_narrow (RawLo))) ” 
  &&  “ (voutput_max = (s8_narrow (RawHi))) ” 
  &&  “ ((-128) <= voutput_min) ” 
  &&  “ (voutput_min <= 127) ” 
  &&  “ ((-128) <= voutput_max) ” 
  &&  “ (voutput_max <= 127) ” 
  &&  “ ((s8_bulk_count (batch_pre)) <= (batch_pre - batch )) ”
  &&  (CharArray.full input_pre (batch_pre + 7 ) A )
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
  **  (CharArray.full output_pre (batch_pre - batch ) (s8_rvv_progress ((batch_pre - batch )) (batch_pre) ((s8_narrow (RawLo))) ((s8_narrow (RawHi))) (A)) )
  **  (CharArray.undef_full output batch )
) \/
(
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (RawHi: Z) (RawLo: Z) (A: (@list Z)) (voutput_max: Z) (voutput_min: Z) (output: Z) (input: Z) (batch: Z) (batch64: Z) (retval: Z) (PreH1 : (128 <= batch)) (PreH2 : (retval = 128)) (PreH3 : (batch > 0)) (PreH4 : (batch64 = 0)) (PreH5 : (0 < batch_pre)) (PreH6 : (batch_pre <= 18446744073709551608)) (PreH7 : (sizeof(CHAR) = 1)) (PreH8 : ((Zlength (A)) = (batch_pre + 7 ))) (PreH9 : (0 <= batch)) (PreH10 : (batch <= batch_pre)) (PreH11 : (input = (input_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH12 : (batch > 0)) (PreH13 : (output = (output_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH14 : (voutput_min = (s8_narrow (RawLo)))) (PreH15 : (voutput_max = (s8_narrow (RawHi)))) (PreH16 : ((-128) <= voutput_min)) (PreH17 : (voutput_min <= 127)) (PreH18 : ((-128) <= voutput_max)) (PreH19 : (voutput_max <= 127)) (PreH20 : ((s8_bulk_count (batch_pre)) <= (batch_pre - batch ))) ,
  (CharArray.undef_full (output + (batch * sizeof(CHAR))) (batch - batch ) )
|--
  TT && emp 
).

Definition test_rvv_entail_wit_7_1_split_goal_spatial := 
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (RawHi: Z) (RawLo: Z) (A: (@list Z)) (voutput_max: Z) (voutput_min: Z) (output: Z) (input: Z) (batch: Z) (batch64: Z) (retval: Z) (PreH1 : (128 <= batch)) (PreH2 : (retval = 128)) (PreH3 : (batch > 0)) (PreH4 : (batch64 = 0)) (PreH5 : (0 < batch_pre)) (PreH6 : (batch_pre <= 18446744073709551608)) (PreH7 : (sizeof(CHAR) = 1)) (PreH8 : ((Zlength (A)) = (batch_pre + 7 ))) (PreH9 : (0 <= batch)) (PreH10 : (batch <= batch_pre)) (PreH11 : (input = (input_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH12 : (batch > 0)) (PreH13 : (output = (output_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH14 : (voutput_min = (s8_narrow (RawLo)))) (PreH15 : (voutput_max = (s8_narrow (RawHi)))) (PreH16 : ((-128) <= voutput_min)) (PreH17 : (voutput_min <= 127)) (PreH18 : ((-128) <= voutput_max)) (PreH19 : (voutput_max <= 127)) (PreH20 : ((s8_bulk_count (batch_pre)) <= (batch_pre - batch ))) ,
  (CharArray.undef_full (output + (batch * sizeof(CHAR))) (batch - batch ) )
|--
  TT && emp 
.

Definition test_rvv_entail_wit_7_2 := 
(
forall (params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (RawHi: Z) (RawLo: Z) (A: (@list Z)) (voutput_max: Z) (voutput_min: Z) (output: Z) (input: Z) (batch: Z) (batch64: Z) (retval: Z) (PreH1 : (batch < 128)) (PreH2 : (retval = batch)) (PreH3 : (batch > 0)) (PreH4 : (batch64 = 0)) (PreH5 : (0 < batch_pre)) (PreH6 : (batch_pre <= 18446744073709551608)) (PreH7 : (sizeof(CHAR) = 1)) (PreH8 : ((Zlength (A)) = (batch_pre + 7 ))) (PreH9 : (0 <= batch)) (PreH10 : (batch <= batch_pre)) (PreH11 : (input = (input_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH12 : (batch > 0)) (PreH13 : (output = (output_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH14 : (voutput_min = (s8_narrow (RawLo)))) (PreH15 : (voutput_max = (s8_narrow (RawHi)))) (PreH16 : ((-128) <= voutput_min)) (PreH17 : (voutput_min <= 127)) (PreH18 : ((-128) <= voutput_max)) (PreH19 : (voutput_max <= 127)) (PreH20 : ((s8_bulk_count (batch_pre)) <= (batch_pre - batch ))) ,
  (CharArray.full input_pre (batch_pre + 7 ) A )
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
  **  (CharArray.full output_pre (batch_pre - batch ) (s8_rvv_progress ((batch_pre - batch )) (batch_pre) ((s8_narrow (RawLo))) ((s8_narrow (RawHi))) (A)) )
  **  (CharArray.undef_full output batch )
|--
  “ (batch64 = 0) ” 
  &&  “ (0 < retval) ” 
  &&  “ (retval <= 128) ” 
  &&  “ (retval <= batch) ” 
  &&  “ (0 < batch_pre) ” 
  &&  “ (batch_pre <= 18446744073709551608) ” 
  &&  “ (sizeof(CHAR) = 1) ” 
  &&  “ ((Zlength (A)) = (batch_pre + 7 )) ” 
  &&  “ (0 <= batch) ” 
  &&  “ (batch <= batch_pre) ” 
  &&  “ (input = (input_pre + ((batch_pre - batch ) * sizeof(CHAR)))) ” 
  &&  “ (batch > 0) ” 
  &&  “ (output = (output_pre + ((batch_pre - batch ) * sizeof(CHAR)))) ” 
  &&  “ (voutput_min = (s8_narrow (RawLo))) ” 
  &&  “ (voutput_max = (s8_narrow (RawHi))) ” 
  &&  “ ((-128) <= voutput_min) ” 
  &&  “ (voutput_min <= 127) ” 
  &&  “ ((-128) <= voutput_max) ” 
  &&  “ (voutput_max <= 127) ” 
  &&  “ ((s8_bulk_count (batch_pre)) <= (batch_pre - batch )) ”
  &&  (CharArray.full input_pre (batch_pre + 7 ) A )
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
  **  (CharArray.full output_pre (batch_pre - batch ) (s8_rvv_progress ((batch_pre - batch )) (batch_pre) ((s8_narrow (RawLo))) ((s8_narrow (RawHi))) (A)) )
  **  (CharArray.undef_full output batch )
) \/
(
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (RawHi: Z) (RawLo: Z) (A: (@list Z)) (voutput_max: Z) (voutput_min: Z) (output: Z) (input: Z) (batch: Z) (batch64: Z) (retval: Z) (PreH1 : (batch < 128)) (PreH2 : (retval = batch)) (PreH3 : (batch > 0)) (PreH4 : (batch64 = 0)) (PreH5 : (0 < batch_pre)) (PreH6 : (batch_pre <= 18446744073709551608)) (PreH7 : (sizeof(CHAR) = 1)) (PreH8 : ((Zlength (A)) = (batch_pre + 7 ))) (PreH9 : (0 <= batch)) (PreH10 : (batch <= batch_pre)) (PreH11 : (input = (input_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH12 : (batch > 0)) (PreH13 : (output = (output_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH14 : (voutput_min = (s8_narrow (RawLo)))) (PreH15 : (voutput_max = (s8_narrow (RawHi)))) (PreH16 : ((-128) <= voutput_min)) (PreH17 : (voutput_min <= 127)) (PreH18 : ((-128) <= voutput_max)) (PreH19 : (voutput_max <= 127)) (PreH20 : ((s8_bulk_count (batch_pre)) <= (batch_pre - batch ))) ,
  (CharArray.undef_full (output + (batch * sizeof(CHAR))) (batch - batch ) )
|--
  TT && emp 
).

Definition test_rvv_entail_wit_7_2_split_goal_spatial := 
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (RawHi: Z) (RawLo: Z) (A: (@list Z)) (voutput_max: Z) (voutput_min: Z) (output: Z) (input: Z) (batch: Z) (batch64: Z) (retval: Z) (PreH1 : (batch < 128)) (PreH2 : (retval = batch)) (PreH3 : (batch > 0)) (PreH4 : (batch64 = 0)) (PreH5 : (0 < batch_pre)) (PreH6 : (batch_pre <= 18446744073709551608)) (PreH7 : (sizeof(CHAR) = 1)) (PreH8 : ((Zlength (A)) = (batch_pre + 7 ))) (PreH9 : (0 <= batch)) (PreH10 : (batch <= batch_pre)) (PreH11 : (input = (input_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH12 : (batch > 0)) (PreH13 : (output = (output_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH14 : (voutput_min = (s8_narrow (RawLo)))) (PreH15 : (voutput_max = (s8_narrow (RawHi)))) (PreH16 : ((-128) <= voutput_min)) (PreH17 : (voutput_min <= 127)) (PreH18 : ((-128) <= voutput_max)) (PreH19 : (voutput_max <= 127)) (PreH20 : ((s8_bulk_count (batch_pre)) <= (batch_pre - batch ))) ,
  (CharArray.undef_full (output + (batch * sizeof(CHAR))) (batch - batch ) )
|--
  TT && emp 
.

Definition test_rvv_entail_wit_8 := 
forall (params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (RawHi: Z) (RawLo: Z) (A: (@list Z)) (batch64: Z) (vl: Z) (batch: Z) (input: Z) (output: Z) (voutput_min: Z) (voutput_max: Z) (PreH1 : (batch64 = 0)) (PreH2 : (0 < vl)) (PreH3 : (vl <= 128)) (PreH4 : (vl <= batch)) (PreH5 : (0 < batch_pre)) (PreH6 : (batch_pre <= 18446744073709551608)) (PreH7 : (sizeof(CHAR) = 1)) (PreH8 : ((Zlength (A)) = (batch_pre + 7 ))) (PreH9 : (0 <= batch)) (PreH10 : (batch <= batch_pre)) (PreH11 : (input = (input_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH12 : (batch > 0)) (PreH13 : (output = (output_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH14 : (voutput_min = (s8_narrow (RawLo)))) (PreH15 : (voutput_max = (s8_narrow (RawHi)))) (PreH16 : ((-128) <= voutput_min)) (PreH17 : (voutput_min <= 127)) (PreH18 : ((-128) <= voutput_max)) (PreH19 : (voutput_max <= 127)) (PreH20 : ((s8_bulk_count (batch_pre)) <= (batch_pre - batch ))) ,
  (CharArray.full output vl (s8_rvv_prefix (vl) ((s8_rvv_pack128 ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (0) (vl) ((batch_pre - batch )) (A))) (voutput_max) (0) (vl))) (voutput_min) (0) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (1) (vl) ((batch_pre - batch )) (A))) (voutput_max) (1) (vl))) (voutput_min) (1) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (2) (vl) ((batch_pre - batch )) (A))) (voutput_max) (2) (vl))) (voutput_min) (2) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (3) (vl) ((batch_pre - batch )) (A))) (voutput_max) (3) (vl))) (voutput_min) (3) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (4) (vl) ((batch_pre - batch )) (A))) (voutput_max) (4) (vl))) (voutput_min) (4) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (5) (vl) ((batch_pre - batch )) (A))) (voutput_max) (5) (vl))) (voutput_min) (5) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (6) (vl) ((batch_pre - batch )) (A))) (voutput_max) (6) (vl))) (voutput_min) (6) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (7) (vl) ((batch_pre - batch )) (A))) (voutput_max) (7) (vl))) (voutput_min) (7) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (8) (vl) ((batch_pre - batch )) (A))) (voutput_max) (8) (vl))) (voutput_min) (8) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (9) (vl) ((batch_pre - batch )) (A))) (voutput_max) (9) (vl))) (voutput_min) (9) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (10) (vl) ((batch_pre - batch )) (A))) (voutput_max) (10) (vl))) (voutput_min) (10) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (11) (vl) ((batch_pre - batch )) (A))) (voutput_max) (11) (vl))) (voutput_min) (11) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (12) (vl) ((batch_pre - batch )) (A))) (voutput_max) (12) (vl))) (voutput_min) (12) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (13) (vl) ((batch_pre - batch )) (A))) (voutput_max) (13) (vl))) (voutput_min) (13) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (14) (vl) ((batch_pre - batch )) (A))) (voutput_max) (14) (vl))) (voutput_min) (14) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (15) (vl) ((batch_pre - batch )) (A))) (voutput_max) (15) (vl))) (voutput_min) (15) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (16) (vl) ((batch_pre - batch )) (A))) (voutput_max) (16) (vl))) (voutput_min) (16) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (17) (vl) ((batch_pre - batch )) (A))) (voutput_max) (17) (vl))) (voutput_min) (17) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (18) (vl) ((batch_pre - batch )) (A))) (voutput_max) (18) (vl))) (voutput_min) (18) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (19) (vl) ((batch_pre - batch )) (A))) (voutput_max) (19) (vl))) (voutput_min) (19) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (20) (vl) ((batch_pre - batch )) (A))) (voutput_max) (20) (vl))) (voutput_min) (20) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (21) (vl) ((batch_pre - batch )) (A))) (voutput_max) (21) (vl))) (voutput_min) (21) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (22) (vl) ((batch_pre - batch )) (A))) (voutput_max) (22) (vl))) (voutput_min) (22) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (23) (vl) ((batch_pre - batch )) (A))) (voutput_max) (23) (vl))) (voutput_min) (23) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (24) (vl) ((batch_pre - batch )) (A))) (voutput_max) (24) (vl))) (voutput_min) (24) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (25) (vl) ((batch_pre - batch )) (A))) (voutput_max) (25) (vl))) (voutput_min) (25) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (26) (vl) ((batch_pre - batch )) (A))) (voutput_max) (26) (vl))) (voutput_min) (26) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (27) (vl) ((batch_pre - batch )) (A))) (voutput_max) (27) (vl))) (voutput_min) (27) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (28) (vl) ((batch_pre - batch )) (A))) (voutput_max) (28) (vl))) (voutput_min) (28) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (29) (vl) ((batch_pre - batch )) (A))) (voutput_max) (29) (vl))) (voutput_min) (29) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (30) (vl) ((batch_pre - batch )) (A))) (voutput_max) (30) (vl))) (voutput_min) (30) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (31) (vl) ((batch_pre - batch )) (A))) (voutput_max) (31) (vl))) (voutput_min) (31) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (32) (vl) ((batch_pre - batch )) (A))) (voutput_max) (32) (vl))) (voutput_min) (32) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (33) (vl) ((batch_pre - batch )) (A))) (voutput_max) (33) (vl))) (voutput_min) (33) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (34) (vl) ((batch_pre - batch )) (A))) (voutput_max) (34) (vl))) (voutput_min) (34) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (35) (vl) ((batch_pre - batch )) (A))) (voutput_max) (35) (vl))) (voutput_min) (35) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (36) (vl) ((batch_pre - batch )) (A))) (voutput_max) (36) (vl))) (voutput_min) (36) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (37) (vl) ((batch_pre - batch )) (A))) (voutput_max) (37) (vl))) (voutput_min) (37) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (38) (vl) ((batch_pre - batch )) (A))) (voutput_max) (38) (vl))) (voutput_min) (38) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (39) (vl) ((batch_pre - batch )) (A))) (voutput_max) (39) (vl))) (voutput_min) (39) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (40) (vl) ((batch_pre - batch )) (A))) (voutput_max) (40) (vl))) (voutput_min) (40) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (41) (vl) ((batch_pre - batch )) (A))) (voutput_max) (41) (vl))) (voutput_min) (41) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (42) (vl) ((batch_pre - batch )) (A))) (voutput_max) (42) (vl))) (voutput_min) (42) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (43) (vl) ((batch_pre - batch )) (A))) (voutput_max) (43) (vl))) (voutput_min) (43) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (44) (vl) ((batch_pre - batch )) (A))) (voutput_max) (44) (vl))) (voutput_min) (44) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (45) (vl) ((batch_pre - batch )) (A))) (voutput_max) (45) (vl))) (voutput_min) (45) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (46) (vl) ((batch_pre - batch )) (A))) (voutput_max) (46) (vl))) (voutput_min) (46) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (47) (vl) ((batch_pre - batch )) (A))) (voutput_max) (47) (vl))) (voutput_min) (47) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (48) (vl) ((batch_pre - batch )) (A))) (voutput_max) (48) (vl))) (voutput_min) (48) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (49) (vl) ((batch_pre - batch )) (A))) (voutput_max) (49) (vl))) (voutput_min) (49) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (50) (vl) ((batch_pre - batch )) (A))) (voutput_max) (50) (vl))) (voutput_min) (50) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (51) (vl) ((batch_pre - batch )) (A))) (voutput_max) (51) (vl))) (voutput_min) (51) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (52) (vl) ((batch_pre - batch )) (A))) (voutput_max) (52) (vl))) (voutput_min) (52) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (53) (vl) ((batch_pre - batch )) (A))) (voutput_max) (53) (vl))) (voutput_min) (53) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (54) (vl) ((batch_pre - batch )) (A))) (voutput_max) (54) (vl))) (voutput_min) (54) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (55) (vl) ((batch_pre - batch )) (A))) (voutput_max) (55) (vl))) (voutput_min) (55) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (56) (vl) ((batch_pre - batch )) (A))) (voutput_max) (56) (vl))) (voutput_min) (56) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (57) (vl) ((batch_pre - batch )) (A))) (voutput_max) (57) (vl))) (voutput_min) (57) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (58) (vl) ((batch_pre - batch )) (A))) (voutput_max) (58) (vl))) (voutput_min) (58) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (59) (vl) ((batch_pre - batch )) (A))) (voutput_max) (59) (vl))) (voutput_min) (59) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (60) (vl) ((batch_pre - batch )) (A))) (voutput_max) (60) (vl))) (voutput_min) (60) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (61) (vl) ((batch_pre - batch )) (A))) (voutput_max) (61) (vl))) (voutput_min) (61) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (62) (vl) ((batch_pre - batch )) (A))) (voutput_max) (62) (vl))) (voutput_min) (62) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (63) (vl) ((batch_pre - batch )) (A))) (voutput_max) (63) (vl))) (voutput_min) (63) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (64) (vl) ((batch_pre - batch )) (A))) (voutput_max) (64) (vl))) (voutput_min) (64) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (65) (vl) ((batch_pre - batch )) (A))) (voutput_max) (65) (vl))) (voutput_min) (65) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (66) (vl) ((batch_pre - batch )) (A))) (voutput_max) (66) (vl))) (voutput_min) (66) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (67) (vl) ((batch_pre - batch )) (A))) (voutput_max) (67) (vl))) (voutput_min) (67) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (68) (vl) ((batch_pre - batch )) (A))) (voutput_max) (68) (vl))) (voutput_min) (68) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (69) (vl) ((batch_pre - batch )) (A))) (voutput_max) (69) (vl))) (voutput_min) (69) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (70) (vl) ((batch_pre - batch )) (A))) (voutput_max) (70) (vl))) (voutput_min) (70) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (71) (vl) ((batch_pre - batch )) (A))) (voutput_max) (71) (vl))) (voutput_min) (71) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (72) (vl) ((batch_pre - batch )) (A))) (voutput_max) (72) (vl))) (voutput_min) (72) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (73) (vl) ((batch_pre - batch )) (A))) (voutput_max) (73) (vl))) (voutput_min) (73) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (74) (vl) ((batch_pre - batch )) (A))) (voutput_max) (74) (vl))) (voutput_min) (74) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (75) (vl) ((batch_pre - batch )) (A))) (voutput_max) (75) (vl))) (voutput_min) (75) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (76) (vl) ((batch_pre - batch )) (A))) (voutput_max) (76) (vl))) (voutput_min) (76) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (77) (vl) ((batch_pre - batch )) (A))) (voutput_max) (77) (vl))) (voutput_min) (77) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (78) (vl) ((batch_pre - batch )) (A))) (voutput_max) (78) (vl))) (voutput_min) (78) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (79) (vl) ((batch_pre - batch )) (A))) (voutput_max) (79) (vl))) (voutput_min) (79) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (80) (vl) ((batch_pre - batch )) (A))) (voutput_max) (80) (vl))) (voutput_min) (80) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (81) (vl) ((batch_pre - batch )) (A))) (voutput_max) (81) (vl))) (voutput_min) (81) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (82) (vl) ((batch_pre - batch )) (A))) (voutput_max) (82) (vl))) (voutput_min) (82) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (83) (vl) ((batch_pre - batch )) (A))) (voutput_max) (83) (vl))) (voutput_min) (83) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (84) (vl) ((batch_pre - batch )) (A))) (voutput_max) (84) (vl))) (voutput_min) (84) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (85) (vl) ((batch_pre - batch )) (A))) (voutput_max) (85) (vl))) (voutput_min) (85) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (86) (vl) ((batch_pre - batch )) (A))) (voutput_max) (86) (vl))) (voutput_min) (86) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (87) (vl) ((batch_pre - batch )) (A))) (voutput_max) (87) (vl))) (voutput_min) (87) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (88) (vl) ((batch_pre - batch )) (A))) (voutput_max) (88) (vl))) (voutput_min) (88) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (89) (vl) ((batch_pre - batch )) (A))) (voutput_max) (89) (vl))) (voutput_min) (89) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (90) (vl) ((batch_pre - batch )) (A))) (voutput_max) (90) (vl))) (voutput_min) (90) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (91) (vl) ((batch_pre - batch )) (A))) (voutput_max) (91) (vl))) (voutput_min) (91) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (92) (vl) ((batch_pre - batch )) (A))) (voutput_max) (92) (vl))) (voutput_min) (92) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (93) (vl) ((batch_pre - batch )) (A))) (voutput_max) (93) (vl))) (voutput_min) (93) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (94) (vl) ((batch_pre - batch )) (A))) (voutput_max) (94) (vl))) (voutput_min) (94) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (95) (vl) ((batch_pre - batch )) (A))) (voutput_max) (95) (vl))) (voutput_min) (95) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (96) (vl) ((batch_pre - batch )) (A))) (voutput_max) (96) (vl))) (voutput_min) (96) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (97) (vl) ((batch_pre - batch )) (A))) (voutput_max) (97) (vl))) (voutput_min) (97) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (98) (vl) ((batch_pre - batch )) (A))) (voutput_max) (98) (vl))) (voutput_min) (98) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (99) (vl) ((batch_pre - batch )) (A))) (voutput_max) (99) (vl))) (voutput_min) (99) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (100) (vl) ((batch_pre - batch )) (A))) (voutput_max) (100) (vl))) (voutput_min) (100) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (101) (vl) ((batch_pre - batch )) (A))) (voutput_max) (101) (vl))) (voutput_min) (101) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (102) (vl) ((batch_pre - batch )) (A))) (voutput_max) (102) (vl))) (voutput_min) (102) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (103) (vl) ((batch_pre - batch )) (A))) (voutput_max) (103) (vl))) (voutput_min) (103) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (104) (vl) ((batch_pre - batch )) (A))) (voutput_max) (104) (vl))) (voutput_min) (104) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (105) (vl) ((batch_pre - batch )) (A))) (voutput_max) (105) (vl))) (voutput_min) (105) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (106) (vl) ((batch_pre - batch )) (A))) (voutput_max) (106) (vl))) (voutput_min) (106) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (107) (vl) ((batch_pre - batch )) (A))) (voutput_max) (107) (vl))) (voutput_min) (107) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (108) (vl) ((batch_pre - batch )) (A))) (voutput_max) (108) (vl))) (voutput_min) (108) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (109) (vl) ((batch_pre - batch )) (A))) (voutput_max) (109) (vl))) (voutput_min) (109) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (110) (vl) ((batch_pre - batch )) (A))) (voutput_max) (110) (vl))) (voutput_min) (110) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (111) (vl) ((batch_pre - batch )) (A))) (voutput_max) (111) (vl))) (voutput_min) (111) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (112) (vl) ((batch_pre - batch )) (A))) (voutput_max) (112) (vl))) (voutput_min) (112) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (113) (vl) ((batch_pre - batch )) (A))) (voutput_max) (113) (vl))) (voutput_min) (113) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (114) (vl) ((batch_pre - batch )) (A))) (voutput_max) (114) (vl))) (voutput_min) (114) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (115) (vl) ((batch_pre - batch )) (A))) (voutput_max) (115) (vl))) (voutput_min) (115) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (116) (vl) ((batch_pre - batch )) (A))) (voutput_max) (116) (vl))) (voutput_min) (116) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (117) (vl) ((batch_pre - batch )) (A))) (voutput_max) (117) (vl))) (voutput_min) (117) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (118) (vl) ((batch_pre - batch )) (A))) (voutput_max) (118) (vl))) (voutput_min) (118) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (119) (vl) ((batch_pre - batch )) (A))) (voutput_max) (119) (vl))) (voutput_min) (119) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (120) (vl) ((batch_pre - batch )) (A))) (voutput_max) (120) (vl))) (voutput_min) (120) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (121) (vl) ((batch_pre - batch )) (A))) (voutput_max) (121) (vl))) (voutput_min) (121) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (122) (vl) ((batch_pre - batch )) (A))) (voutput_max) (122) (vl))) (voutput_min) (122) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (123) (vl) ((batch_pre - batch )) (A))) (voutput_max) (123) (vl))) (voutput_min) (123) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (124) (vl) ((batch_pre - batch )) (A))) (voutput_max) (124) (vl))) (voutput_min) (124) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (125) (vl) ((batch_pre - batch )) (A))) (voutput_max) (125) (vl))) (voutput_min) (125) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (126) (vl) ((batch_pre - batch )) (A))) (voutput_max) (126) (vl))) (voutput_min) (126) (vl))) ((s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (127) (vl) ((batch_pre - batch )) (A))) (voutput_max) (127) (vl))) (voutput_min) (127) (vl)))))) )
  **  (CharArray.undef_full (output + (vl * sizeof(CHAR))) (batch - vl ) )
  **  (CharArray.full input_pre (batch_pre + 7 ) A )
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
  **  (CharArray.full output_pre (batch_pre - batch ) (s8_rvv_progress ((batch_pre - batch )) (batch_pre) ((s8_narrow (RawLo))) ((s8_narrow (RawHi))) (A)) )
|--
  (“ (batch64 = 0) ” 
  &&  “ (0 < batch_pre) ” 
  &&  “ (batch_pre <= 18446744073709551608) ” 
  &&  “ (sizeof(CHAR) = 1) ” 
  &&  “ ((Zlength (A)) = (batch_pre + 7 )) ” 
  &&  “ (0 <= (batch - vl )) ” 
  &&  “ ((batch - vl ) <= batch_pre) ” 
  &&  “ ((input + (vl * sizeof(CHAR))) = (input_pre + ((batch_pre - (batch - vl ) ) * sizeof(CHAR)))) ” 
  &&  “ ((batch - vl ) = 0) ” 
  &&  “ (voutput_min = (s8_narrow (RawLo))) ” 
  &&  “ (voutput_max = (s8_narrow (RawHi))) ” 
  &&  “ ((-128) <= voutput_min) ” 
  &&  “ (voutput_min <= 127) ” 
  &&  “ ((-128) <= voutput_max) ” 
  &&  “ (voutput_max <= 127) ” 
  &&  “ ((s8_bulk_count (batch_pre)) <= (batch_pre - (batch - vl ) )) ”
  &&  (CharArray.full input_pre (batch_pre + 7 ) A )
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
  **  (CharArray.full output_pre (batch_pre - (batch - vl ) ) (s8_rvv_progress ((batch_pre - (batch - vl ) )) (batch_pre) ((s8_narrow (RawLo))) ((s8_narrow (RawHi))) (A)) )
  **  (CharArray.undef_full (output + (vl * sizeof(CHAR))) (batch - vl ) ))
  ||
  (“ (batch64 = 0) ” 
  &&  “ (0 < batch_pre) ” 
  &&  “ (batch_pre <= 18446744073709551608) ” 
  &&  “ (sizeof(CHAR) = 1) ” 
  &&  “ ((Zlength (A)) = (batch_pre + 7 )) ” 
  &&  “ (0 <= (batch - vl )) ” 
  &&  “ ((batch - vl ) <= batch_pre) ” 
  &&  “ ((input + (vl * sizeof(CHAR))) = (input_pre + ((batch_pre - (batch - vl ) ) * sizeof(CHAR)))) ” 
  &&  “ ((batch - vl ) > 0) ” 
  &&  “ ((output + (vl * sizeof(CHAR))) = (output_pre + ((batch_pre - (batch - vl ) ) * sizeof(CHAR)))) ” 
  &&  “ (voutput_min = (s8_narrow (RawLo))) ” 
  &&  “ (voutput_max = (s8_narrow (RawHi))) ” 
  &&  “ ((-128) <= voutput_min) ” 
  &&  “ (voutput_min <= 127) ” 
  &&  “ ((-128) <= voutput_max) ” 
  &&  “ (voutput_max <= 127) ” 
  &&  “ ((s8_bulk_count (batch_pre)) <= (batch_pre - (batch - vl ) )) ”
  &&  (CharArray.full input_pre (batch_pre + 7 ) A )
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
  **  (CharArray.full output_pre (batch_pre - (batch - vl ) ) (s8_rvv_progress ((batch_pre - (batch - vl ) )) (batch_pre) ((s8_narrow (RawLo))) ((s8_narrow (RawHi))) (A)) )
  **  (CharArray.undef_full (output + (vl * sizeof(CHAR))) (batch - vl ) ))
.

Definition test_rvv_return_wit_1 := 
(
forall (params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (RawHi: Z) (RawLo: Z) (A: (@list Z)) (output: Z) (voutput_max: Z) (voutput_min: Z) (input: Z) (batch: Z) (batch64: Z) (PreH1 : (batch <= 0)) (PreH2 : (batch64 = 0)) (PreH3 : (0 < batch_pre)) (PreH4 : (batch_pre <= 18446744073709551608)) (PreH5 : (sizeof(CHAR) = 1)) (PreH6 : ((Zlength (A)) = (batch_pre + 7 ))) (PreH7 : (0 <= batch)) (PreH8 : (batch <= batch_pre)) (PreH9 : (input = (input_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH10 : (batch = 0)) (PreH11 : (voutput_min = (s8_narrow (RawLo)))) (PreH12 : (voutput_max = (s8_narrow (RawHi)))) (PreH13 : ((-128) <= voutput_min)) (PreH14 : (voutput_min <= 127)) (PreH15 : ((-128) <= voutput_max)) (PreH16 : (voutput_max <= 127)) (PreH17 : ((s8_bulk_count (batch_pre)) <= (batch_pre - batch ))) ,
  (CharArray.full input_pre (batch_pre + 7 ) A )
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
  **  (CharArray.full output_pre (batch_pre - batch ) (s8_rvv_progress ((batch_pre - batch )) (batch_pre) ((s8_narrow (RawLo))) ((s8_narrow (RawHi))) (A)) )
  **  (CharArray.undef_full output batch )
|--
  (CharArray.full input_pre (batch_pre + 7 ) A )
  **  (CharArray.full output_pre batch_pre (s8_values (batch_pre) ((s8_narrow (RawLo))) ((s8_narrow (RawHi))) (A)) )
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
) \/
(
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (RawHi: Z) (RawLo: Z) (A: (@list Z)) (output: Z) (voutput_max: Z) (voutput_min: Z) (input: Z) (batch: Z) (batch64: Z) (PreH1 : (batch <= 0)) (PreH2 : (batch64 = 0)) (PreH3 : (0 < batch_pre)) (PreH4 : (batch_pre <= 18446744073709551608)) (PreH5 : (sizeof(CHAR) = 1)) (PreH6 : ((Zlength (A)) = (batch_pre + 7 ))) (PreH7 : (0 <= batch)) (PreH8 : (batch <= batch_pre)) (PreH9 : (input = (input_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH10 : (batch = 0)) (PreH11 : (voutput_min = (s8_narrow (RawLo)))) (PreH12 : (voutput_max = (s8_narrow (RawHi)))) (PreH13 : ((-128) <= voutput_min)) (PreH14 : (voutput_min <= 127)) (PreH15 : ((-128) <= voutput_max)) (PreH16 : (voutput_max <= 127)) (PreH17 : ((s8_bulk_count (batch_pre)) <= (batch_pre - batch ))) ,
  (CharArray.full output_pre (batch_pre - batch ) (s8_rvv_progress ((batch_pre - batch )) (batch_pre) ((s8_narrow (RawLo))) ((s8_narrow (RawHi))) (A)) )
  **  (CharArray.undef_full output batch )
|--
  (CharArray.full output_pre batch_pre (s8_values (batch_pre) ((s8_narrow (RawLo))) ((s8_narrow (RawHi))) (A)) )
).

Definition test_rvv_return_wit_1_split_goal_spatial := 
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (RawHi: Z) (RawLo: Z) (A: (@list Z)) (output: Z) (voutput_max: Z) (voutput_min: Z) (input: Z) (batch: Z) (batch64: Z) (PreH1 : (batch <= 0)) (PreH2 : (batch64 = 0)) (PreH3 : (0 < batch_pre)) (PreH4 : (batch_pre <= 18446744073709551608)) (PreH5 : (sizeof(CHAR) = 1)) (PreH6 : ((Zlength (A)) = (batch_pre + 7 ))) (PreH7 : (0 <= batch)) (PreH8 : (batch <= batch_pre)) (PreH9 : (input = (input_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH10 : (batch = 0)) (PreH11 : (voutput_min = (s8_narrow (RawLo)))) (PreH12 : (voutput_max = (s8_narrow (RawHi)))) (PreH13 : ((-128) <= voutput_min)) (PreH14 : (voutput_min <= 127)) (PreH15 : ((-128) <= voutput_max)) (PreH16 : (voutput_max <= 127)) (PreH17 : ((s8_bulk_count (batch_pre)) <= (batch_pre - batch ))) ,
  (CharArray.full output_pre (batch_pre - batch ) (s8_rvv_progress ((batch_pre - batch )) (batch_pre) ((s8_narrow (RawLo))) ((s8_narrow (RawHi))) (A)) )
  **  (CharArray.undef_full output batch )
|--
  (CharArray.full output_pre batch_pre (s8_values (batch_pre) ((s8_narrow (RawLo))) ((s8_narrow (RawHi))) (A)) )
.

Definition test_rvv_partial_solve_wit_1_pure := 
forall (params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (RawHi: Z) (RawLo: Z) (A: (@list Z)) (PreH1 : (batch_pre <> 0)) (PreH2 : (0 < batch_pre)) (PreH3 : (batch_pre <= 18446744073709551608)) (PreH4 : (input_pre <> 0)) (PreH5 : (output_pre <> 0)) (PreH6 : (params_pre <> 0)) (PreH7 : (sizeof(CHAR) = 1)) (PreH8 : ((batch_pre % ( sizeof(CHAR) ) ) = 0)) (PreH9 : ((Zlength (A)) = (batch_pre + 7 ))) ,
  ((( &( "batch" ) )) # UInt64  |-> batch_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (CharArray.full input_pre (batch_pre + 7 ) A )
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
  **  (CharArray.undef_full output_pre batch_pre )
|--
  “ (1 <> 0) ”
.

Definition test_rvv_partial_solve_wit_1_aux := 
forall (params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (RawHi: Z) (RawLo: Z) (A: (@list Z)) (PreH1 : (batch_pre <> 0)) (PreH2 : (0 < batch_pre)) (PreH3 : (batch_pre <= 18446744073709551608)) (PreH4 : (input_pre <> 0)) (PreH5 : (output_pre <> 0)) (PreH6 : (params_pre <> 0)) (PreH7 : (sizeof(CHAR) = 1)) (PreH8 : ((batch_pre % ( sizeof(CHAR) ) ) = 0)) (PreH9 : ((Zlength (A)) = (batch_pre + 7 ))) ,
  (CharArray.full input_pre (batch_pre + 7 ) A )
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
  **  (CharArray.undef_full output_pre batch_pre )
|--
  “ (1 <> 0) ” 
  &&  “ (batch_pre <> 0) ” 
  &&  “ (0 < batch_pre) ” 
  &&  “ (batch_pre <= 18446744073709551608) ” 
  &&  “ (input_pre <> 0) ” 
  &&  “ (output_pre <> 0) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (sizeof(CHAR) = 1) ” 
  &&  “ ((batch_pre % ( sizeof(CHAR) ) ) = 0) ” 
  &&  “ ((Zlength (A)) = (batch_pre + 7 )) ”
  &&  (CharArray.full input_pre (batch_pre + 7 ) A )
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
  **  (CharArray.undef_full output_pre batch_pre )
.

Definition test_rvv_partial_solve_wit_1 := test_rvv_partial_solve_wit_1_pure -> test_rvv_partial_solve_wit_1_aux.

Definition test_rvv_partial_solve_wit_2_pure := 
forall (params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (RawHi: Z) (RawLo: Z) (A: (@list Z)) (PreH1 : ((batch_pre % ( sizeof(CHAR) ) ) = 0)) (PreH2 : (batch_pre <> 0)) (PreH3 : (0 < batch_pre)) (PreH4 : (batch_pre <= 18446744073709551608)) (PreH5 : (input_pre <> 0)) (PreH6 : (output_pre <> 0)) (PreH7 : (params_pre <> 0)) (PreH8 : (sizeof(CHAR) = 1)) (PreH9 : ((batch_pre % ( sizeof(CHAR) ) ) = 0)) (PreH10 : ((Zlength (A)) = (batch_pre + 7 ))) ,
  ((( &( "batch" ) )) # UInt64  |-> batch_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (CharArray.full input_pre (batch_pre + 7 ) A )
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
  **  (CharArray.undef_full output_pre batch_pre )
|--
  “ (1 <> 0) ”
.

Definition test_rvv_partial_solve_wit_2_aux := 
forall (params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (RawHi: Z) (RawLo: Z) (A: (@list Z)) (PreH1 : ((batch_pre % ( sizeof(CHAR) ) ) = 0)) (PreH2 : (batch_pre <> 0)) (PreH3 : (0 < batch_pre)) (PreH4 : (batch_pre <= 18446744073709551608)) (PreH5 : (input_pre <> 0)) (PreH6 : (output_pre <> 0)) (PreH7 : (params_pre <> 0)) (PreH8 : (sizeof(CHAR) = 1)) (PreH9 : ((batch_pre % ( sizeof(CHAR) ) ) = 0)) (PreH10 : ((Zlength (A)) = (batch_pre + 7 ))) ,
  (CharArray.full input_pre (batch_pre + 7 ) A )
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
  **  (CharArray.undef_full output_pre batch_pre )
|--
  “ (1 <> 0) ” 
  &&  “ ((batch_pre % ( sizeof(CHAR) ) ) = 0) ” 
  &&  “ (batch_pre <> 0) ” 
  &&  “ (0 < batch_pre) ” 
  &&  “ (batch_pre <= 18446744073709551608) ” 
  &&  “ (input_pre <> 0) ” 
  &&  “ (output_pre <> 0) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (sizeof(CHAR) = 1) ” 
  &&  “ ((batch_pre % ( sizeof(CHAR) ) ) = 0) ” 
  &&  “ ((Zlength (A)) = (batch_pre + 7 )) ”
  &&  (CharArray.full input_pre (batch_pre + 7 ) A )
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
  **  (CharArray.undef_full output_pre batch_pre )
.

Definition test_rvv_partial_solve_wit_2 := test_rvv_partial_solve_wit_2_pure -> test_rvv_partial_solve_wit_2_aux.

Definition test_rvv_partial_solve_wit_3_pure := 
forall (params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (RawHi: Z) (RawLo: Z) (A: (@list Z)) (PreH1 : (input_pre <> 0)) (PreH2 : ((batch_pre % ( sizeof(CHAR) ) ) = 0)) (PreH3 : (batch_pre <> 0)) (PreH4 : (0 < batch_pre)) (PreH5 : (batch_pre <= 18446744073709551608)) (PreH6 : (input_pre <> 0)) (PreH7 : (output_pre <> 0)) (PreH8 : (params_pre <> 0)) (PreH9 : (sizeof(CHAR) = 1)) (PreH10 : ((batch_pre % ( sizeof(CHAR) ) ) = 0)) (PreH11 : ((Zlength (A)) = (batch_pre + 7 ))) ,
  ((( &( "batch" ) )) # UInt64  |-> batch_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (CharArray.full input_pre (batch_pre + 7 ) A )
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
  **  (CharArray.undef_full output_pre batch_pre )
|--
  “ (1 <> 0) ”
.

Definition test_rvv_partial_solve_wit_3_aux := 
forall (params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (RawHi: Z) (RawLo: Z) (A: (@list Z)) (PreH1 : (input_pre <> 0)) (PreH2 : ((batch_pre % ( sizeof(CHAR) ) ) = 0)) (PreH3 : (batch_pre <> 0)) (PreH4 : (0 < batch_pre)) (PreH5 : (batch_pre <= 18446744073709551608)) (PreH6 : (input_pre <> 0)) (PreH7 : (output_pre <> 0)) (PreH8 : (params_pre <> 0)) (PreH9 : (sizeof(CHAR) = 1)) (PreH10 : ((batch_pre % ( sizeof(CHAR) ) ) = 0)) (PreH11 : ((Zlength (A)) = (batch_pre + 7 ))) ,
  (CharArray.full input_pre (batch_pre + 7 ) A )
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
  **  (CharArray.undef_full output_pre batch_pre )
|--
  “ (1 <> 0) ” 
  &&  “ (input_pre <> 0) ” 
  &&  “ ((batch_pre % ( sizeof(CHAR) ) ) = 0) ” 
  &&  “ (batch_pre <> 0) ” 
  &&  “ (0 < batch_pre) ” 
  &&  “ (batch_pre <= 18446744073709551608) ” 
  &&  “ (input_pre <> 0) ” 
  &&  “ (output_pre <> 0) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (sizeof(CHAR) = 1) ” 
  &&  “ ((batch_pre % ( sizeof(CHAR) ) ) = 0) ” 
  &&  “ ((Zlength (A)) = (batch_pre + 7 )) ”
  &&  (CharArray.full input_pre (batch_pre + 7 ) A )
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
  **  (CharArray.undef_full output_pre batch_pre )
.

Definition test_rvv_partial_solve_wit_3 := test_rvv_partial_solve_wit_3_pure -> test_rvv_partial_solve_wit_3_aux.

Definition test_rvv_partial_solve_wit_4_pure := 
forall (params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (RawHi: Z) (RawLo: Z) (A: (@list Z)) (PreH1 : (output_pre <> 0)) (PreH2 : (input_pre <> 0)) (PreH3 : ((batch_pre % ( sizeof(CHAR) ) ) = 0)) (PreH4 : (batch_pre <> 0)) (PreH5 : (0 < batch_pre)) (PreH6 : (batch_pre <= 18446744073709551608)) (PreH7 : (input_pre <> 0)) (PreH8 : (output_pre <> 0)) (PreH9 : (params_pre <> 0)) (PreH10 : (sizeof(CHAR) = 1)) (PreH11 : ((batch_pre % ( sizeof(CHAR) ) ) = 0)) (PreH12 : ((Zlength (A)) = (batch_pre + 7 ))) ,
  ((( &( "batch" ) )) # UInt64  |-> batch_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (CharArray.full input_pre (batch_pre + 7 ) A )
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
  **  (CharArray.undef_full output_pre batch_pre )
|--
  “ (1 <> 0) ”
.

Definition test_rvv_partial_solve_wit_4_aux := 
forall (params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (RawHi: Z) (RawLo: Z) (A: (@list Z)) (PreH1 : (output_pre <> 0)) (PreH2 : (input_pre <> 0)) (PreH3 : ((batch_pre % ( sizeof(CHAR) ) ) = 0)) (PreH4 : (batch_pre <> 0)) (PreH5 : (0 < batch_pre)) (PreH6 : (batch_pre <= 18446744073709551608)) (PreH7 : (input_pre <> 0)) (PreH8 : (output_pre <> 0)) (PreH9 : (params_pre <> 0)) (PreH10 : (sizeof(CHAR) = 1)) (PreH11 : ((batch_pre % ( sizeof(CHAR) ) ) = 0)) (PreH12 : ((Zlength (A)) = (batch_pre + 7 ))) ,
  (CharArray.full input_pre (batch_pre + 7 ) A )
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
  **  (CharArray.undef_full output_pre batch_pre )
|--
  “ (1 <> 0) ” 
  &&  “ (output_pre <> 0) ” 
  &&  “ (input_pre <> 0) ” 
  &&  “ ((batch_pre % ( sizeof(CHAR) ) ) = 0) ” 
  &&  “ (batch_pre <> 0) ” 
  &&  “ (0 < batch_pre) ” 
  &&  “ (batch_pre <= 18446744073709551608) ” 
  &&  “ (input_pre <> 0) ” 
  &&  “ (output_pre <> 0) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (sizeof(CHAR) = 1) ” 
  &&  “ ((batch_pre % ( sizeof(CHAR) ) ) = 0) ” 
  &&  “ ((Zlength (A)) = (batch_pre + 7 )) ”
  &&  (CharArray.full input_pre (batch_pre + 7 ) A )
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
  **  (CharArray.undef_full output_pre batch_pre )
.

Definition test_rvv_partial_solve_wit_4 := test_rvv_partial_solve_wit_4_pure -> test_rvv_partial_solve_wit_4_aux.

Definition test_rvv_partial_solve_wit_5_pure := 
forall (params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (RawHi: Z) (RawLo: Z) (A: (@list Z)) (batch64: Z) (voutput_max: Z) (voutput_min: Z) (output: Z) (input: Z) (batch: Z) (PreH1 : (batch64 > 0)) (PreH2 : (0 < batch_pre)) (PreH3 : (batch_pre <= 18446744073709551608)) (PreH4 : (sizeof(CHAR) = 1)) (PreH5 : ((Zlength (A)) = (batch_pre + 7 ))) (PreH6 : (0 <= batch)) (PreH7 : (batch <= batch_pre)) (PreH8 : (input = (input_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH9 : (batch > 0)) (PreH10 : (output = (output_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH11 : (voutput_min = (s8_narrow (RawLo)))) (PreH12 : (voutput_max = (s8_narrow (RawHi)))) (PreH13 : ((-128) <= voutput_min)) (PreH14 : (voutput_min <= 127)) (PreH15 : ((-128) <= voutput_max)) (PreH16 : (voutput_max <= 127)) (PreH17 : (0 <= (s8_bulk_count (batch_pre)))) (PreH18 : ((s8_bulk_count (batch_pre)) <= batch_pre)) (PreH19 : (0 <= batch64)) (PreH20 : (batch64 = ((s8_bulk_count (batch_pre)) - (batch_pre - batch ) ))) (PreH21 : ((batch_pre - batch ) <= (s8_bulk_count (batch_pre)))) ,
  ((( &( "vl" ) )) # UInt64  |->_)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "batch" ) )) # UInt64  |-> batch)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "voutput_min" ) )) # Char  |-> voutput_min)
  **  ((( &( "voutput_max" ) )) # Char  |-> voutput_max)
  **  ((( &( "batch64" ) )) # UInt64  |-> batch64)
  **  (CharArray.full input_pre (batch_pre + 7 ) A )
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
  **  (CharArray.full output_pre (batch_pre - batch ) (s8_rvv_progress ((batch_pre - batch )) (batch_pre) ((s8_narrow (RawLo))) ((s8_narrow (RawHi))) (A)) )
  **  (CharArray.undef_full output batch )
|--
  “ (0 <= batch64) ” 
  &&  “ (batch64 <= UINT64_MAX) ”
.

Definition test_rvv_partial_solve_wit_5_aux := 
forall (params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (RawHi: Z) (RawLo: Z) (A: (@list Z)) (batch64: Z) (voutput_max: Z) (voutput_min: Z) (output: Z) (input: Z) (batch: Z) (PreH1 : (batch64 > 0)) (PreH2 : (0 < batch_pre)) (PreH3 : (batch_pre <= 18446744073709551608)) (PreH4 : (sizeof(CHAR) = 1)) (PreH5 : ((Zlength (A)) = (batch_pre + 7 ))) (PreH6 : (0 <= batch)) (PreH7 : (batch <= batch_pre)) (PreH8 : (input = (input_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH9 : (batch > 0)) (PreH10 : (output = (output_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH11 : (voutput_min = (s8_narrow (RawLo)))) (PreH12 : (voutput_max = (s8_narrow (RawHi)))) (PreH13 : ((-128) <= voutput_min)) (PreH14 : (voutput_min <= 127)) (PreH15 : ((-128) <= voutput_max)) (PreH16 : (voutput_max <= 127)) (PreH17 : (0 <= (s8_bulk_count (batch_pre)))) (PreH18 : ((s8_bulk_count (batch_pre)) <= batch_pre)) (PreH19 : (0 <= batch64)) (PreH20 : (batch64 = ((s8_bulk_count (batch_pre)) - (batch_pre - batch ) ))) (PreH21 : ((batch_pre - batch ) <= (s8_bulk_count (batch_pre)))) ,
  (CharArray.full input_pre (batch_pre + 7 ) A )
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
  **  (CharArray.full output_pre (batch_pre - batch ) (s8_rvv_progress ((batch_pre - batch )) (batch_pre) ((s8_narrow (RawLo))) ((s8_narrow (RawHi))) (A)) )
  **  (CharArray.undef_full output batch )
|--
  “ (0 <= batch64) ” 
  &&  “ (batch64 <= UINT64_MAX) ” 
  &&  “ (batch64 > 0) ” 
  &&  “ (0 < batch_pre) ” 
  &&  “ (batch_pre <= 18446744073709551608) ” 
  &&  “ (sizeof(CHAR) = 1) ” 
  &&  “ ((Zlength (A)) = (batch_pre + 7 )) ” 
  &&  “ (0 <= batch) ” 
  &&  “ (batch <= batch_pre) ” 
  &&  “ (input = (input_pre + ((batch_pre - batch ) * sizeof(CHAR)))) ” 
  &&  “ (batch > 0) ” 
  &&  “ (output = (output_pre + ((batch_pre - batch ) * sizeof(CHAR)))) ” 
  &&  “ (voutput_min = (s8_narrow (RawLo))) ” 
  &&  “ (voutput_max = (s8_narrow (RawHi))) ” 
  &&  “ ((-128) <= voutput_min) ” 
  &&  “ (voutput_min <= 127) ” 
  &&  “ ((-128) <= voutput_max) ” 
  &&  “ (voutput_max <= 127) ” 
  &&  “ (0 <= (s8_bulk_count (batch_pre))) ” 
  &&  “ ((s8_bulk_count (batch_pre)) <= batch_pre) ” 
  &&  “ (0 <= batch64) ” 
  &&  “ (batch64 = ((s8_bulk_count (batch_pre)) - (batch_pre - batch ) )) ” 
  &&  “ ((batch_pre - batch ) <= (s8_bulk_count (batch_pre))) ”
  &&  (CharArray.full input_pre (batch_pre + 7 ) A )
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
  **  (CharArray.full output_pre (batch_pre - batch ) (s8_rvv_progress ((batch_pre - batch )) (batch_pre) ((s8_narrow (RawLo))) ((s8_narrow (RawHi))) (A)) )
  **  (CharArray.undef_full output batch )
.

Definition test_rvv_partial_solve_wit_5 := test_rvv_partial_solve_wit_5_pure -> test_rvv_partial_solve_wit_5_aux.

Definition test_rvv_partial_solve_wit_6_pure := 
forall (params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (RawHi: Z) (RawLo: Z) (A: (@list Z)) (vl: Z) (batch: Z) (batch64: Z) (input: Z) (output: Z) (voutput_min: Z) (voutput_max: Z) (PreH1 : (0 < vl)) (PreH2 : (vl <= 128)) (PreH3 : (vl <= batch)) (PreH4 : (vl <= batch64)) (PreH5 : (0 < batch_pre)) (PreH6 : (batch_pre <= 18446744073709551608)) (PreH7 : (sizeof(CHAR) = 1)) (PreH8 : ((Zlength (A)) = (batch_pre + 7 ))) (PreH9 : (0 <= batch)) (PreH10 : (batch <= batch_pre)) (PreH11 : (input = (input_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH12 : (batch > 0)) (PreH13 : (output = (output_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH14 : (voutput_min = (s8_narrow (RawLo)))) (PreH15 : (voutput_max = (s8_narrow (RawHi)))) (PreH16 : ((-128) <= voutput_min)) (PreH17 : (voutput_min <= 127)) (PreH18 : ((-128) <= voutput_max)) (PreH19 : (voutput_max <= 127)) (PreH20 : (0 <= (s8_bulk_count (batch_pre)))) (PreH21 : ((s8_bulk_count (batch_pre)) <= batch_pre)) (PreH22 : (0 <= batch64)) (PreH23 : (batch64 = ((s8_bulk_count (batch_pre)) - (batch_pre - batch ) ))) (PreH24 : ((batch_pre - batch ) <= (s8_bulk_count (batch_pre)))) ,
  (UndefStructPredvint8m8_t ( &( "vacc" ) ) )
  **  ((( &( "vl" ) )) # UInt64  |-> vl)
  **  ((( &( "batch" ) )) # UInt64  |-> batch)
  **  ((( &( "batch64" ) )) # UInt64  |-> batch64)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "voutput_min" ) )) # Char  |-> voutput_min)
  **  ((( &( "voutput_max" ) )) # Char  |-> voutput_max)
  **  (CharArray.full input_pre (batch_pre + 7 ) A )
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
  **  (CharArray.full output_pre (batch_pre - batch ) (s8_rvv_progress ((batch_pre - batch )) (batch_pre) ((s8_narrow (RawLo))) ((s8_narrow (RawHi))) (A)) )
  **  (CharArray.undef_full output batch )
|--
  “ (0 <= vl) ” 
  &&  “ (vl <= 128) ” 
  &&  “ (0 <= (batch_pre - batch )) ” 
  &&  “ (((batch_pre - batch ) + vl ) <= (batch_pre + 7 )) ” 
  &&  “ (input = (input_pre + (batch_pre - batch ) )) ”
.

Definition test_rvv_partial_solve_wit_6_aux := 
forall (params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (RawHi: Z) (RawLo: Z) (A: (@list Z)) (vl: Z) (batch: Z) (batch64: Z) (input: Z) (output: Z) (voutput_min: Z) (voutput_max: Z) (PreH1 : (0 < vl)) (PreH2 : (vl <= 128)) (PreH3 : (vl <= batch)) (PreH4 : (vl <= batch64)) (PreH5 : (0 < batch_pre)) (PreH6 : (batch_pre <= 18446744073709551608)) (PreH7 : (sizeof(CHAR) = 1)) (PreH8 : ((Zlength (A)) = (batch_pre + 7 ))) (PreH9 : (0 <= batch)) (PreH10 : (batch <= batch_pre)) (PreH11 : (input = (input_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH12 : (batch > 0)) (PreH13 : (output = (output_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH14 : (voutput_min = (s8_narrow (RawLo)))) (PreH15 : (voutput_max = (s8_narrow (RawHi)))) (PreH16 : ((-128) <= voutput_min)) (PreH17 : (voutput_min <= 127)) (PreH18 : ((-128) <= voutput_max)) (PreH19 : (voutput_max <= 127)) (PreH20 : (0 <= (s8_bulk_count (batch_pre)))) (PreH21 : ((s8_bulk_count (batch_pre)) <= batch_pre)) (PreH22 : (0 <= batch64)) (PreH23 : (batch64 = ((s8_bulk_count (batch_pre)) - (batch_pre - batch ) ))) (PreH24 : ((batch_pre - batch ) <= (s8_bulk_count (batch_pre)))) ,
  (UndefStructPredvint8m8_t ( &( "vacc" ) ) )
  **  (CharArray.full input_pre (batch_pre + 7 ) A )
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
  **  (CharArray.full output_pre (batch_pre - batch ) (s8_rvv_progress ((batch_pre - batch )) (batch_pre) ((s8_narrow (RawLo))) ((s8_narrow (RawHi))) (A)) )
  **  (CharArray.undef_full output batch )
|--
  “ (0 <= vl) ” 
  &&  “ (vl <= 128) ” 
  &&  “ (0 <= (batch_pre - batch )) ” 
  &&  “ (((batch_pre - batch ) + vl ) <= (batch_pre + 7 )) ” 
  &&  “ (input = (input_pre + (batch_pre - batch ) )) ” 
  &&  “ (0 < vl) ” 
  &&  “ (vl <= 128) ” 
  &&  “ (vl <= batch) ” 
  &&  “ (vl <= batch64) ” 
  &&  “ (0 < batch_pre) ” 
  &&  “ (batch_pre <= 18446744073709551608) ” 
  &&  “ (sizeof(CHAR) = 1) ” 
  &&  “ ((Zlength (A)) = (batch_pre + 7 )) ” 
  &&  “ (0 <= batch) ” 
  &&  “ (batch <= batch_pre) ” 
  &&  “ (input = (input_pre + ((batch_pre - batch ) * sizeof(CHAR)))) ” 
  &&  “ (batch > 0) ” 
  &&  “ (output = (output_pre + ((batch_pre - batch ) * sizeof(CHAR)))) ” 
  &&  “ (voutput_min = (s8_narrow (RawLo))) ” 
  &&  “ (voutput_max = (s8_narrow (RawHi))) ” 
  &&  “ ((-128) <= voutput_min) ” 
  &&  “ (voutput_min <= 127) ” 
  &&  “ ((-128) <= voutput_max) ” 
  &&  “ (voutput_max <= 127) ” 
  &&  “ (0 <= (s8_bulk_count (batch_pre))) ” 
  &&  “ ((s8_bulk_count (batch_pre)) <= batch_pre) ” 
  &&  “ (0 <= batch64) ” 
  &&  “ (batch64 = ((s8_bulk_count (batch_pre)) - (batch_pre - batch ) )) ” 
  &&  “ ((batch_pre - batch ) <= (s8_bulk_count (batch_pre))) ”
  &&  (CharArray.full input_pre (batch_pre + 7 ) A )
  **  (UndefStructPredvint8m8_t ( &( "vacc" ) ) )
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
  **  (CharArray.full output_pre (batch_pre - batch ) (s8_rvv_progress ((batch_pre - batch )) (batch_pre) ((s8_narrow (RawLo))) ((s8_narrow (RawHi))) (A)) )
  **  (CharArray.undef_full output batch )
.

Definition test_rvv_partial_solve_wit_6 := test_rvv_partial_solve_wit_6_pure -> test_rvv_partial_solve_wit_6_aux.

Definition test_rvv_partial_solve_wit_7 := 
forall (params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (RawHi: Z) (RawLo: Z) (A: (@list Z)) (vl: Z) (batch: Z) (batch64: Z) (input: Z) (output: Z) (voutput_min: Z) (voutput_max: Z) (retval: Z) (PreH1 : (0 < vl)) (PreH2 : (vl <= 128)) (PreH3 : (vl <= batch)) (PreH4 : (vl <= batch64)) (PreH5 : (0 < batch_pre)) (PreH6 : (batch_pre <= 18446744073709551608)) (PreH7 : (sizeof(CHAR) = 1)) (PreH8 : ((Zlength (A)) = (batch_pre + 7 ))) (PreH9 : (0 <= batch)) (PreH10 : (batch <= batch_pre)) (PreH11 : (input = (input_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH12 : (batch > 0)) (PreH13 : (output = (output_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH14 : (voutput_min = (s8_narrow (RawLo)))) (PreH15 : (voutput_max = (s8_narrow (RawHi)))) (PreH16 : ((-128) <= voutput_min)) (PreH17 : (voutput_min <= 127)) (PreH18 : ((-128) <= voutput_max)) (PreH19 : (voutput_max <= 127)) (PreH20 : (0 <= (s8_bulk_count (batch_pre)))) (PreH21 : ((s8_bulk_count (batch_pre)) <= batch_pre)) (PreH22 : (0 <= batch64)) (PreH23 : (batch64 = ((s8_bulk_count (batch_pre)) - (batch_pre - batch ) ))) (PreH24 : ((batch_pre - batch ) <= (s8_bulk_count (batch_pre)))) ,
  (CharArray.full input_pre (batch_pre + 7 ) A )
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s0")) # Char  |-> (s8_read_lane (0) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s1")) # Char  |-> (s8_read_lane (1) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s2")) # Char  |-> (s8_read_lane (2) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s3")) # Char  |-> (s8_read_lane (3) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s4")) # Char  |-> (s8_read_lane (4) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s5")) # Char  |-> (s8_read_lane (5) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s6")) # Char  |-> (s8_read_lane (6) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s7")) # Char  |-> (s8_read_lane (7) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s8")) # Char  |-> (s8_read_lane (8) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s9")) # Char  |-> (s8_read_lane (9) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s10")) # Char  |-> (s8_read_lane (10) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s11")) # Char  |-> (s8_read_lane (11) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s12")) # Char  |-> (s8_read_lane (12) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s13")) # Char  |-> (s8_read_lane (13) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s14")) # Char  |-> (s8_read_lane (14) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s15")) # Char  |-> (s8_read_lane (15) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s16")) # Char  |-> (s8_read_lane (16) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s17")) # Char  |-> (s8_read_lane (17) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s18")) # Char  |-> (s8_read_lane (18) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s19")) # Char  |-> (s8_read_lane (19) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s20")) # Char  |-> (s8_read_lane (20) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s21")) # Char  |-> (s8_read_lane (21) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s22")) # Char  |-> (s8_read_lane (22) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s23")) # Char  |-> (s8_read_lane (23) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s24")) # Char  |-> (s8_read_lane (24) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s25")) # Char  |-> (s8_read_lane (25) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s26")) # Char  |-> (s8_read_lane (26) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s27")) # Char  |-> (s8_read_lane (27) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s28")) # Char  |-> (s8_read_lane (28) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s29")) # Char  |-> (s8_read_lane (29) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s30")) # Char  |-> (s8_read_lane (30) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s31")) # Char  |-> (s8_read_lane (31) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s32")) # Char  |-> (s8_read_lane (32) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s33")) # Char  |-> (s8_read_lane (33) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s34")) # Char  |-> (s8_read_lane (34) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s35")) # Char  |-> (s8_read_lane (35) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s36")) # Char  |-> (s8_read_lane (36) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s37")) # Char  |-> (s8_read_lane (37) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s38")) # Char  |-> (s8_read_lane (38) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s39")) # Char  |-> (s8_read_lane (39) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s40")) # Char  |-> (s8_read_lane (40) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s41")) # Char  |-> (s8_read_lane (41) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s42")) # Char  |-> (s8_read_lane (42) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s43")) # Char  |-> (s8_read_lane (43) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s44")) # Char  |-> (s8_read_lane (44) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s45")) # Char  |-> (s8_read_lane (45) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s46")) # Char  |-> (s8_read_lane (46) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s47")) # Char  |-> (s8_read_lane (47) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s48")) # Char  |-> (s8_read_lane (48) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s49")) # Char  |-> (s8_read_lane (49) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s50")) # Char  |-> (s8_read_lane (50) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s51")) # Char  |-> (s8_read_lane (51) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s52")) # Char  |-> (s8_read_lane (52) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s53")) # Char  |-> (s8_read_lane (53) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s54")) # Char  |-> (s8_read_lane (54) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s55")) # Char  |-> (s8_read_lane (55) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s56")) # Char  |-> (s8_read_lane (56) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s57")) # Char  |-> (s8_read_lane (57) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s58")) # Char  |-> (s8_read_lane (58) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s59")) # Char  |-> (s8_read_lane (59) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s60")) # Char  |-> (s8_read_lane (60) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s61")) # Char  |-> (s8_read_lane (61) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s62")) # Char  |-> (s8_read_lane (62) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s63")) # Char  |-> (s8_read_lane (63) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s64")) # Char  |-> (s8_read_lane (64) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s65")) # Char  |-> (s8_read_lane (65) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s66")) # Char  |-> (s8_read_lane (66) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s67")) # Char  |-> (s8_read_lane (67) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s68")) # Char  |-> (s8_read_lane (68) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s69")) # Char  |-> (s8_read_lane (69) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s70")) # Char  |-> (s8_read_lane (70) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s71")) # Char  |-> (s8_read_lane (71) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s72")) # Char  |-> (s8_read_lane (72) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s73")) # Char  |-> (s8_read_lane (73) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s74")) # Char  |-> (s8_read_lane (74) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s75")) # Char  |-> (s8_read_lane (75) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s76")) # Char  |-> (s8_read_lane (76) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s77")) # Char  |-> (s8_read_lane (77) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s78")) # Char  |-> (s8_read_lane (78) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s79")) # Char  |-> (s8_read_lane (79) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s80")) # Char  |-> (s8_read_lane (80) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s81")) # Char  |-> (s8_read_lane (81) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s82")) # Char  |-> (s8_read_lane (82) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s83")) # Char  |-> (s8_read_lane (83) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s84")) # Char  |-> (s8_read_lane (84) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s85")) # Char  |-> (s8_read_lane (85) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s86")) # Char  |-> (s8_read_lane (86) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s87")) # Char  |-> (s8_read_lane (87) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s88")) # Char  |-> (s8_read_lane (88) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s89")) # Char  |-> (s8_read_lane (89) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s90")) # Char  |-> (s8_read_lane (90) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s91")) # Char  |-> (s8_read_lane (91) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s92")) # Char  |-> (s8_read_lane (92) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s93")) # Char  |-> (s8_read_lane (93) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s94")) # Char  |-> (s8_read_lane (94) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s95")) # Char  |-> (s8_read_lane (95) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s96")) # Char  |-> (s8_read_lane (96) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s97")) # Char  |-> (s8_read_lane (97) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s98")) # Char  |-> (s8_read_lane (98) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s99")) # Char  |-> (s8_read_lane (99) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s100")) # Char  |-> (s8_read_lane (100) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s101")) # Char  |-> (s8_read_lane (101) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s102")) # Char  |-> (s8_read_lane (102) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s103")) # Char  |-> (s8_read_lane (103) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s104")) # Char  |-> (s8_read_lane (104) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s105")) # Char  |-> (s8_read_lane (105) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s106")) # Char  |-> (s8_read_lane (106) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s107")) # Char  |-> (s8_read_lane (107) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s108")) # Char  |-> (s8_read_lane (108) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s109")) # Char  |-> (s8_read_lane (109) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s110")) # Char  |-> (s8_read_lane (110) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s111")) # Char  |-> (s8_read_lane (111) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s112")) # Char  |-> (s8_read_lane (112) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s113")) # Char  |-> (s8_read_lane (113) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s114")) # Char  |-> (s8_read_lane (114) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s115")) # Char  |-> (s8_read_lane (115) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s116")) # Char  |-> (s8_read_lane (116) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s117")) # Char  |-> (s8_read_lane (117) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s118")) # Char  |-> (s8_read_lane (118) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s119")) # Char  |-> (s8_read_lane (119) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s120")) # Char  |-> (s8_read_lane (120) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s121")) # Char  |-> (s8_read_lane (121) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s122")) # Char  |-> (s8_read_lane (122) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s123")) # Char  |-> (s8_read_lane (123) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s124")) # Char  |-> (s8_read_lane (124) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s125")) # Char  |-> (s8_read_lane (125) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s126")) # Char  |-> (s8_read_lane (126) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s127")) # Char  |-> (s8_read_lane (127) (vl) ((batch_pre - batch )) (A)))
  **  (UndefStructPredvint8m8_t ( &( "vacc" ) ) )
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
  **  (CharArray.full output_pre (batch_pre - batch ) (s8_rvv_progress ((batch_pre - batch )) (batch_pre) ((s8_narrow (RawLo))) ((s8_narrow (RawHi))) (A)) )
  **  (CharArray.undef_full output batch )
|--
  “ (0 < vl) ” 
  &&  “ (vl <= 128) ” 
  &&  “ (vl <= batch) ” 
  &&  “ (vl <= batch64) ” 
  &&  “ (0 < batch_pre) ” 
  &&  “ (batch_pre <= 18446744073709551608) ” 
  &&  “ (sizeof(CHAR) = 1) ” 
  &&  “ ((Zlength (A)) = (batch_pre + 7 )) ” 
  &&  “ (0 <= batch) ” 
  &&  “ (batch <= batch_pre) ” 
  &&  “ (input = (input_pre + ((batch_pre - batch ) * sizeof(CHAR)))) ” 
  &&  “ (batch > 0) ” 
  &&  “ (output = (output_pre + ((batch_pre - batch ) * sizeof(CHAR)))) ” 
  &&  “ (voutput_min = (s8_narrow (RawLo))) ” 
  &&  “ (voutput_max = (s8_narrow (RawHi))) ” 
  &&  “ ((-128) <= voutput_min) ” 
  &&  “ (voutput_min <= 127) ” 
  &&  “ ((-128) <= voutput_max) ” 
  &&  “ (voutput_max <= 127) ” 
  &&  “ (0 <= (s8_bulk_count (batch_pre))) ” 
  &&  “ ((s8_bulk_count (batch_pre)) <= batch_pre) ” 
  &&  “ (0 <= batch64) ” 
  &&  “ (batch64 = ((s8_bulk_count (batch_pre)) - (batch_pre - batch ) )) ” 
  &&  “ ((batch_pre - batch ) <= (s8_bulk_count (batch_pre))) ”
  &&  ((&(( &( "vacc" ) )->ₛ "s127")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s127")) # Char  |-> (s8_read_lane (127) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s126")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s126")) # Char  |-> (s8_read_lane (126) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s125")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s125")) # Char  |-> (s8_read_lane (125) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s124")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s124")) # Char  |-> (s8_read_lane (124) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s123")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s123")) # Char  |-> (s8_read_lane (123) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s122")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s122")) # Char  |-> (s8_read_lane (122) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s121")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s121")) # Char  |-> (s8_read_lane (121) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s120")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s120")) # Char  |-> (s8_read_lane (120) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s119")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s119")) # Char  |-> (s8_read_lane (119) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s118")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s118")) # Char  |-> (s8_read_lane (118) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s117")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s117")) # Char  |-> (s8_read_lane (117) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s116")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s116")) # Char  |-> (s8_read_lane (116) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s115")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s115")) # Char  |-> (s8_read_lane (115) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s114")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s114")) # Char  |-> (s8_read_lane (114) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s113")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s113")) # Char  |-> (s8_read_lane (113) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s112")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s112")) # Char  |-> (s8_read_lane (112) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s111")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s111")) # Char  |-> (s8_read_lane (111) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s110")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s110")) # Char  |-> (s8_read_lane (110) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s109")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s109")) # Char  |-> (s8_read_lane (109) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s108")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s108")) # Char  |-> (s8_read_lane (108) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s107")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s107")) # Char  |-> (s8_read_lane (107) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s106")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s106")) # Char  |-> (s8_read_lane (106) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s105")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s105")) # Char  |-> (s8_read_lane (105) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s104")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s104")) # Char  |-> (s8_read_lane (104) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s103")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s103")) # Char  |-> (s8_read_lane (103) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s102")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s102")) # Char  |-> (s8_read_lane (102) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s101")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s101")) # Char  |-> (s8_read_lane (101) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s100")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s100")) # Char  |-> (s8_read_lane (100) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s99")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s99")) # Char  |-> (s8_read_lane (99) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s98")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s98")) # Char  |-> (s8_read_lane (98) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s97")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s97")) # Char  |-> (s8_read_lane (97) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s96")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s96")) # Char  |-> (s8_read_lane (96) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s95")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s95")) # Char  |-> (s8_read_lane (95) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s94")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s94")) # Char  |-> (s8_read_lane (94) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s93")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s93")) # Char  |-> (s8_read_lane (93) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s92")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s92")) # Char  |-> (s8_read_lane (92) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s91")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s91")) # Char  |-> (s8_read_lane (91) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s90")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s90")) # Char  |-> (s8_read_lane (90) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s89")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s89")) # Char  |-> (s8_read_lane (89) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s88")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s88")) # Char  |-> (s8_read_lane (88) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s87")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s87")) # Char  |-> (s8_read_lane (87) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s86")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s86")) # Char  |-> (s8_read_lane (86) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s85")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s85")) # Char  |-> (s8_read_lane (85) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s84")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s84")) # Char  |-> (s8_read_lane (84) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s83")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s83")) # Char  |-> (s8_read_lane (83) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s82")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s82")) # Char  |-> (s8_read_lane (82) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s81")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s81")) # Char  |-> (s8_read_lane (81) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s80")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s80")) # Char  |-> (s8_read_lane (80) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s79")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s79")) # Char  |-> (s8_read_lane (79) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s78")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s78")) # Char  |-> (s8_read_lane (78) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s77")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s77")) # Char  |-> (s8_read_lane (77) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s76")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s76")) # Char  |-> (s8_read_lane (76) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s75")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s75")) # Char  |-> (s8_read_lane (75) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s74")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s74")) # Char  |-> (s8_read_lane (74) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s73")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s73")) # Char  |-> (s8_read_lane (73) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s72")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s72")) # Char  |-> (s8_read_lane (72) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s71")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s71")) # Char  |-> (s8_read_lane (71) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s70")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s70")) # Char  |-> (s8_read_lane (70) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s69")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s69")) # Char  |-> (s8_read_lane (69) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s68")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s68")) # Char  |-> (s8_read_lane (68) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s67")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s67")) # Char  |-> (s8_read_lane (67) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s66")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s66")) # Char  |-> (s8_read_lane (66) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s65")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s65")) # Char  |-> (s8_read_lane (65) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s64")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s64")) # Char  |-> (s8_read_lane (64) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s63")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s63")) # Char  |-> (s8_read_lane (63) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s62")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s62")) # Char  |-> (s8_read_lane (62) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s61")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s61")) # Char  |-> (s8_read_lane (61) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s60")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s60")) # Char  |-> (s8_read_lane (60) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s59")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s59")) # Char  |-> (s8_read_lane (59) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s58")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s58")) # Char  |-> (s8_read_lane (58) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s57")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s57")) # Char  |-> (s8_read_lane (57) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s56")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s56")) # Char  |-> (s8_read_lane (56) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s55")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s55")) # Char  |-> (s8_read_lane (55) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s54")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s54")) # Char  |-> (s8_read_lane (54) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s53")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s53")) # Char  |-> (s8_read_lane (53) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s52")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s52")) # Char  |-> (s8_read_lane (52) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s51")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s51")) # Char  |-> (s8_read_lane (51) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s50")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s50")) # Char  |-> (s8_read_lane (50) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s49")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s49")) # Char  |-> (s8_read_lane (49) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s48")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s48")) # Char  |-> (s8_read_lane (48) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s47")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s47")) # Char  |-> (s8_read_lane (47) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s46")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s46")) # Char  |-> (s8_read_lane (46) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s45")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s45")) # Char  |-> (s8_read_lane (45) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s44")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s44")) # Char  |-> (s8_read_lane (44) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s43")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s43")) # Char  |-> (s8_read_lane (43) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s42")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s42")) # Char  |-> (s8_read_lane (42) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s41")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s41")) # Char  |-> (s8_read_lane (41) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s40")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s40")) # Char  |-> (s8_read_lane (40) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s39")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s39")) # Char  |-> (s8_read_lane (39) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s38")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s38")) # Char  |-> (s8_read_lane (38) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s37")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s37")) # Char  |-> (s8_read_lane (37) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s36")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s36")) # Char  |-> (s8_read_lane (36) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s35")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s35")) # Char  |-> (s8_read_lane (35) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s34")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s34")) # Char  |-> (s8_read_lane (34) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s33")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s33")) # Char  |-> (s8_read_lane (33) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s32")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s32")) # Char  |-> (s8_read_lane (32) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s31")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s31")) # Char  |-> (s8_read_lane (31) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s30")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s30")) # Char  |-> (s8_read_lane (30) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s29")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s29")) # Char  |-> (s8_read_lane (29) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s28")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s28")) # Char  |-> (s8_read_lane (28) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s27")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s27")) # Char  |-> (s8_read_lane (27) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s26")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s26")) # Char  |-> (s8_read_lane (26) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s25")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s25")) # Char  |-> (s8_read_lane (25) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s24")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s24")) # Char  |-> (s8_read_lane (24) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s23")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s23")) # Char  |-> (s8_read_lane (23) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s22")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s22")) # Char  |-> (s8_read_lane (22) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s21")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s21")) # Char  |-> (s8_read_lane (21) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s20")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s20")) # Char  |-> (s8_read_lane (20) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s19")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s19")) # Char  |-> (s8_read_lane (19) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s18")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s18")) # Char  |-> (s8_read_lane (18) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s17")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s17")) # Char  |-> (s8_read_lane (17) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s16")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s16")) # Char  |-> (s8_read_lane (16) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s15")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s15")) # Char  |-> (s8_read_lane (15) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s14")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s14")) # Char  |-> (s8_read_lane (14) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s13")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s13")) # Char  |-> (s8_read_lane (13) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s12")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s12")) # Char  |-> (s8_read_lane (12) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s11")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s11")) # Char  |-> (s8_read_lane (11) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s10")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s10")) # Char  |-> (s8_read_lane (10) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s9")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s9")) # Char  |-> (s8_read_lane (9) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s8")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s8")) # Char  |-> (s8_read_lane (8) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s7")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s7")) # Char  |-> (s8_read_lane (7) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s6")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s6")) # Char  |-> (s8_read_lane (6) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s5")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s5")) # Char  |-> (s8_read_lane (5) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s4")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s4")) # Char  |-> (s8_read_lane (4) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s3")) # Char  |-> (s8_read_lane (3) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s2")) # Char  |-> (s8_read_lane (2) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s1")) # Char  |-> (s8_read_lane (1) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s0")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s0")) # Char  |-> (s8_read_lane (0) (vl) ((batch_pre - batch )) (A)))
  **  (CharArray.full input_pre (batch_pre + 7 ) A )
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
  **  (CharArray.full output_pre (batch_pre - batch ) (s8_rvv_progress ((batch_pre - batch )) (batch_pre) ((s8_narrow (RawLo))) ((s8_narrow (RawHi))) (A)) )
  **  (CharArray.undef_full output batch )
.

Definition test_rvv_partial_solve_wit_8_pure := 
forall (params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (RawHi: Z) (RawLo: Z) (A: (@list Z)) (vl: Z) (batch: Z) (batch64: Z) (input: Z) (output: Z) (voutput_min: Z) (voutput_max: Z) (PreH1 : (0 < vl)) (PreH2 : (vl <= 128)) (PreH3 : (vl <= batch)) (PreH4 : (vl <= batch64)) (PreH5 : (0 < batch_pre)) (PreH6 : (batch_pre <= 18446744073709551608)) (PreH7 : (sizeof(CHAR) = 1)) (PreH8 : ((Zlength (A)) = (batch_pre + 7 ))) (PreH9 : (0 <= batch)) (PreH10 : (batch <= batch_pre)) (PreH11 : (input = (input_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH12 : (batch > 0)) (PreH13 : (output = (output_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH14 : (voutput_min = (s8_narrow (RawLo)))) (PreH15 : (voutput_max = (s8_narrow (RawHi)))) (PreH16 : ((-128) <= voutput_min)) (PreH17 : (voutput_min <= 127)) (PreH18 : ((-128) <= voutput_max)) (PreH19 : (voutput_max <= 127)) (PreH20 : (0 <= (s8_bulk_count (batch_pre)))) (PreH21 : ((s8_bulk_count (batch_pre)) <= batch_pre)) (PreH22 : (0 <= batch64)) (PreH23 : (batch64 = ((s8_bulk_count (batch_pre)) - (batch_pre - batch ) ))) (PreH24 : ((batch_pre - batch ) <= (s8_bulk_count (batch_pre)))) ,
  ((&(( &( "vacc" ) )->ₛ "s127")) # Char  |-> (s8_read_lane (127) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s126")) # Char  |-> (s8_read_lane (126) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s125")) # Char  |-> (s8_read_lane (125) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s124")) # Char  |-> (s8_read_lane (124) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s123")) # Char  |-> (s8_read_lane (123) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s122")) # Char  |-> (s8_read_lane (122) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s121")) # Char  |-> (s8_read_lane (121) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s120")) # Char  |-> (s8_read_lane (120) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s119")) # Char  |-> (s8_read_lane (119) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s118")) # Char  |-> (s8_read_lane (118) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s117")) # Char  |-> (s8_read_lane (117) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s116")) # Char  |-> (s8_read_lane (116) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s115")) # Char  |-> (s8_read_lane (115) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s114")) # Char  |-> (s8_read_lane (114) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s113")) # Char  |-> (s8_read_lane (113) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s112")) # Char  |-> (s8_read_lane (112) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s111")) # Char  |-> (s8_read_lane (111) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s110")) # Char  |-> (s8_read_lane (110) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s109")) # Char  |-> (s8_read_lane (109) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s108")) # Char  |-> (s8_read_lane (108) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s107")) # Char  |-> (s8_read_lane (107) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s106")) # Char  |-> (s8_read_lane (106) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s105")) # Char  |-> (s8_read_lane (105) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s104")) # Char  |-> (s8_read_lane (104) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s103")) # Char  |-> (s8_read_lane (103) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s102")) # Char  |-> (s8_read_lane (102) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s101")) # Char  |-> (s8_read_lane (101) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s100")) # Char  |-> (s8_read_lane (100) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s99")) # Char  |-> (s8_read_lane (99) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s98")) # Char  |-> (s8_read_lane (98) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s97")) # Char  |-> (s8_read_lane (97) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s96")) # Char  |-> (s8_read_lane (96) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s95")) # Char  |-> (s8_read_lane (95) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s94")) # Char  |-> (s8_read_lane (94) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s93")) # Char  |-> (s8_read_lane (93) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s92")) # Char  |-> (s8_read_lane (92) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s91")) # Char  |-> (s8_read_lane (91) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s90")) # Char  |-> (s8_read_lane (90) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s89")) # Char  |-> (s8_read_lane (89) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s88")) # Char  |-> (s8_read_lane (88) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s87")) # Char  |-> (s8_read_lane (87) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s86")) # Char  |-> (s8_read_lane (86) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s85")) # Char  |-> (s8_read_lane (85) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s84")) # Char  |-> (s8_read_lane (84) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s83")) # Char  |-> (s8_read_lane (83) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s82")) # Char  |-> (s8_read_lane (82) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s81")) # Char  |-> (s8_read_lane (81) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s80")) # Char  |-> (s8_read_lane (80) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s79")) # Char  |-> (s8_read_lane (79) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s78")) # Char  |-> (s8_read_lane (78) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s77")) # Char  |-> (s8_read_lane (77) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s76")) # Char  |-> (s8_read_lane (76) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s75")) # Char  |-> (s8_read_lane (75) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s74")) # Char  |-> (s8_read_lane (74) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s73")) # Char  |-> (s8_read_lane (73) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s72")) # Char  |-> (s8_read_lane (72) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s71")) # Char  |-> (s8_read_lane (71) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s70")) # Char  |-> (s8_read_lane (70) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s69")) # Char  |-> (s8_read_lane (69) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s68")) # Char  |-> (s8_read_lane (68) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s67")) # Char  |-> (s8_read_lane (67) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s66")) # Char  |-> (s8_read_lane (66) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s65")) # Char  |-> (s8_read_lane (65) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s64")) # Char  |-> (s8_read_lane (64) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s63")) # Char  |-> (s8_read_lane (63) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s62")) # Char  |-> (s8_read_lane (62) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s61")) # Char  |-> (s8_read_lane (61) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s60")) # Char  |-> (s8_read_lane (60) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s59")) # Char  |-> (s8_read_lane (59) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s58")) # Char  |-> (s8_read_lane (58) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s57")) # Char  |-> (s8_read_lane (57) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s56")) # Char  |-> (s8_read_lane (56) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s55")) # Char  |-> (s8_read_lane (55) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s54")) # Char  |-> (s8_read_lane (54) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s53")) # Char  |-> (s8_read_lane (53) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s52")) # Char  |-> (s8_read_lane (52) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s51")) # Char  |-> (s8_read_lane (51) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s50")) # Char  |-> (s8_read_lane (50) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s49")) # Char  |-> (s8_read_lane (49) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s48")) # Char  |-> (s8_read_lane (48) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s47")) # Char  |-> (s8_read_lane (47) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s46")) # Char  |-> (s8_read_lane (46) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s45")) # Char  |-> (s8_read_lane (45) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s44")) # Char  |-> (s8_read_lane (44) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s43")) # Char  |-> (s8_read_lane (43) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s42")) # Char  |-> (s8_read_lane (42) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s41")) # Char  |-> (s8_read_lane (41) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s40")) # Char  |-> (s8_read_lane (40) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s39")) # Char  |-> (s8_read_lane (39) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s38")) # Char  |-> (s8_read_lane (38) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s37")) # Char  |-> (s8_read_lane (37) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s36")) # Char  |-> (s8_read_lane (36) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s35")) # Char  |-> (s8_read_lane (35) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s34")) # Char  |-> (s8_read_lane (34) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s33")) # Char  |-> (s8_read_lane (33) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s32")) # Char  |-> (s8_read_lane (32) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s31")) # Char  |-> (s8_read_lane (31) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s30")) # Char  |-> (s8_read_lane (30) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s29")) # Char  |-> (s8_read_lane (29) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s28")) # Char  |-> (s8_read_lane (28) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s27")) # Char  |-> (s8_read_lane (27) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s26")) # Char  |-> (s8_read_lane (26) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s25")) # Char  |-> (s8_read_lane (25) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s24")) # Char  |-> (s8_read_lane (24) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s23")) # Char  |-> (s8_read_lane (23) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s22")) # Char  |-> (s8_read_lane (22) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s21")) # Char  |-> (s8_read_lane (21) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s20")) # Char  |-> (s8_read_lane (20) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s19")) # Char  |-> (s8_read_lane (19) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s18")) # Char  |-> (s8_read_lane (18) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s17")) # Char  |-> (s8_read_lane (17) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s16")) # Char  |-> (s8_read_lane (16) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s15")) # Char  |-> (s8_read_lane (15) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s14")) # Char  |-> (s8_read_lane (14) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s13")) # Char  |-> (s8_read_lane (13) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s12")) # Char  |-> (s8_read_lane (12) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s11")) # Char  |-> (s8_read_lane (11) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s10")) # Char  |-> (s8_read_lane (10) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s9")) # Char  |-> (s8_read_lane (9) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s8")) # Char  |-> (s8_read_lane (8) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s7")) # Char  |-> (s8_read_lane (7) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s6")) # Char  |-> (s8_read_lane (6) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s5")) # Char  |-> (s8_read_lane (5) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s4")) # Char  |-> (s8_read_lane (4) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # Char  |-> (s8_read_lane (3) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # Char  |-> (s8_read_lane (2) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # Char  |-> (s8_read_lane (1) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s0")) # Char  |-> (s8_read_lane (0) (vl) ((batch_pre - batch )) (A)))
  **  (CharArray.full input_pre (batch_pre + 7 ) A )
  **  ((( &( "vl" ) )) # UInt64  |-> vl)
  **  ((( &( "batch" ) )) # UInt64  |-> batch)
  **  ((( &( "batch64" ) )) # UInt64  |-> batch64)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "voutput_min" ) )) # Char  |-> voutput_min)
  **  ((( &( "voutput_max" ) )) # Char  |-> voutput_max)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
  **  (CharArray.full output_pre (batch_pre - batch ) (s8_rvv_progress ((batch_pre - batch )) (batch_pre) ((s8_narrow (RawLo))) ((s8_narrow (RawHi))) (A)) )
  **  (CharArray.undef_full output batch )
|--
  “ ((-128) <= voutput_min) ” 
  &&  “ (voutput_min <= 127) ” 
  &&  “ (0 <= vl) ” 
  &&  “ (vl <= 128) ”
.

Definition test_rvv_partial_solve_wit_8_aux := 
forall (params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (RawHi: Z) (RawLo: Z) (A: (@list Z)) (vl: Z) (batch: Z) (batch64: Z) (input: Z) (output: Z) (voutput_min: Z) (voutput_max: Z) (PreH1 : (0 < vl)) (PreH2 : (vl <= 128)) (PreH3 : (vl <= batch)) (PreH4 : (vl <= batch64)) (PreH5 : (0 < batch_pre)) (PreH6 : (batch_pre <= 18446744073709551608)) (PreH7 : (sizeof(CHAR) = 1)) (PreH8 : ((Zlength (A)) = (batch_pre + 7 ))) (PreH9 : (0 <= batch)) (PreH10 : (batch <= batch_pre)) (PreH11 : (input = (input_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH12 : (batch > 0)) (PreH13 : (output = (output_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH14 : (voutput_min = (s8_narrow (RawLo)))) (PreH15 : (voutput_max = (s8_narrow (RawHi)))) (PreH16 : ((-128) <= voutput_min)) (PreH17 : (voutput_min <= 127)) (PreH18 : ((-128) <= voutput_max)) (PreH19 : (voutput_max <= 127)) (PreH20 : (0 <= (s8_bulk_count (batch_pre)))) (PreH21 : ((s8_bulk_count (batch_pre)) <= batch_pre)) (PreH22 : (0 <= batch64)) (PreH23 : (batch64 = ((s8_bulk_count (batch_pre)) - (batch_pre - batch ) ))) (PreH24 : ((batch_pre - batch ) <= (s8_bulk_count (batch_pre)))) ,
  ((&(( &( "vacc" ) )->ₛ "s127")) # Char  |-> (s8_read_lane (127) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s126")) # Char  |-> (s8_read_lane (126) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s125")) # Char  |-> (s8_read_lane (125) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s124")) # Char  |-> (s8_read_lane (124) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s123")) # Char  |-> (s8_read_lane (123) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s122")) # Char  |-> (s8_read_lane (122) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s121")) # Char  |-> (s8_read_lane (121) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s120")) # Char  |-> (s8_read_lane (120) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s119")) # Char  |-> (s8_read_lane (119) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s118")) # Char  |-> (s8_read_lane (118) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s117")) # Char  |-> (s8_read_lane (117) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s116")) # Char  |-> (s8_read_lane (116) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s115")) # Char  |-> (s8_read_lane (115) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s114")) # Char  |-> (s8_read_lane (114) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s113")) # Char  |-> (s8_read_lane (113) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s112")) # Char  |-> (s8_read_lane (112) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s111")) # Char  |-> (s8_read_lane (111) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s110")) # Char  |-> (s8_read_lane (110) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s109")) # Char  |-> (s8_read_lane (109) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s108")) # Char  |-> (s8_read_lane (108) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s107")) # Char  |-> (s8_read_lane (107) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s106")) # Char  |-> (s8_read_lane (106) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s105")) # Char  |-> (s8_read_lane (105) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s104")) # Char  |-> (s8_read_lane (104) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s103")) # Char  |-> (s8_read_lane (103) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s102")) # Char  |-> (s8_read_lane (102) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s101")) # Char  |-> (s8_read_lane (101) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s100")) # Char  |-> (s8_read_lane (100) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s99")) # Char  |-> (s8_read_lane (99) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s98")) # Char  |-> (s8_read_lane (98) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s97")) # Char  |-> (s8_read_lane (97) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s96")) # Char  |-> (s8_read_lane (96) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s95")) # Char  |-> (s8_read_lane (95) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s94")) # Char  |-> (s8_read_lane (94) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s93")) # Char  |-> (s8_read_lane (93) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s92")) # Char  |-> (s8_read_lane (92) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s91")) # Char  |-> (s8_read_lane (91) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s90")) # Char  |-> (s8_read_lane (90) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s89")) # Char  |-> (s8_read_lane (89) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s88")) # Char  |-> (s8_read_lane (88) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s87")) # Char  |-> (s8_read_lane (87) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s86")) # Char  |-> (s8_read_lane (86) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s85")) # Char  |-> (s8_read_lane (85) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s84")) # Char  |-> (s8_read_lane (84) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s83")) # Char  |-> (s8_read_lane (83) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s82")) # Char  |-> (s8_read_lane (82) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s81")) # Char  |-> (s8_read_lane (81) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s80")) # Char  |-> (s8_read_lane (80) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s79")) # Char  |-> (s8_read_lane (79) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s78")) # Char  |-> (s8_read_lane (78) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s77")) # Char  |-> (s8_read_lane (77) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s76")) # Char  |-> (s8_read_lane (76) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s75")) # Char  |-> (s8_read_lane (75) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s74")) # Char  |-> (s8_read_lane (74) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s73")) # Char  |-> (s8_read_lane (73) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s72")) # Char  |-> (s8_read_lane (72) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s71")) # Char  |-> (s8_read_lane (71) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s70")) # Char  |-> (s8_read_lane (70) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s69")) # Char  |-> (s8_read_lane (69) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s68")) # Char  |-> (s8_read_lane (68) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s67")) # Char  |-> (s8_read_lane (67) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s66")) # Char  |-> (s8_read_lane (66) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s65")) # Char  |-> (s8_read_lane (65) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s64")) # Char  |-> (s8_read_lane (64) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s63")) # Char  |-> (s8_read_lane (63) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s62")) # Char  |-> (s8_read_lane (62) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s61")) # Char  |-> (s8_read_lane (61) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s60")) # Char  |-> (s8_read_lane (60) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s59")) # Char  |-> (s8_read_lane (59) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s58")) # Char  |-> (s8_read_lane (58) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s57")) # Char  |-> (s8_read_lane (57) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s56")) # Char  |-> (s8_read_lane (56) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s55")) # Char  |-> (s8_read_lane (55) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s54")) # Char  |-> (s8_read_lane (54) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s53")) # Char  |-> (s8_read_lane (53) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s52")) # Char  |-> (s8_read_lane (52) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s51")) # Char  |-> (s8_read_lane (51) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s50")) # Char  |-> (s8_read_lane (50) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s49")) # Char  |-> (s8_read_lane (49) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s48")) # Char  |-> (s8_read_lane (48) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s47")) # Char  |-> (s8_read_lane (47) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s46")) # Char  |-> (s8_read_lane (46) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s45")) # Char  |-> (s8_read_lane (45) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s44")) # Char  |-> (s8_read_lane (44) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s43")) # Char  |-> (s8_read_lane (43) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s42")) # Char  |-> (s8_read_lane (42) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s41")) # Char  |-> (s8_read_lane (41) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s40")) # Char  |-> (s8_read_lane (40) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s39")) # Char  |-> (s8_read_lane (39) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s38")) # Char  |-> (s8_read_lane (38) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s37")) # Char  |-> (s8_read_lane (37) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s36")) # Char  |-> (s8_read_lane (36) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s35")) # Char  |-> (s8_read_lane (35) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s34")) # Char  |-> (s8_read_lane (34) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s33")) # Char  |-> (s8_read_lane (33) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s32")) # Char  |-> (s8_read_lane (32) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s31")) # Char  |-> (s8_read_lane (31) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s30")) # Char  |-> (s8_read_lane (30) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s29")) # Char  |-> (s8_read_lane (29) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s28")) # Char  |-> (s8_read_lane (28) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s27")) # Char  |-> (s8_read_lane (27) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s26")) # Char  |-> (s8_read_lane (26) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s25")) # Char  |-> (s8_read_lane (25) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s24")) # Char  |-> (s8_read_lane (24) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s23")) # Char  |-> (s8_read_lane (23) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s22")) # Char  |-> (s8_read_lane (22) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s21")) # Char  |-> (s8_read_lane (21) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s20")) # Char  |-> (s8_read_lane (20) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s19")) # Char  |-> (s8_read_lane (19) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s18")) # Char  |-> (s8_read_lane (18) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s17")) # Char  |-> (s8_read_lane (17) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s16")) # Char  |-> (s8_read_lane (16) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s15")) # Char  |-> (s8_read_lane (15) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s14")) # Char  |-> (s8_read_lane (14) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s13")) # Char  |-> (s8_read_lane (13) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s12")) # Char  |-> (s8_read_lane (12) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s11")) # Char  |-> (s8_read_lane (11) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s10")) # Char  |-> (s8_read_lane (10) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s9")) # Char  |-> (s8_read_lane (9) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s8")) # Char  |-> (s8_read_lane (8) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s7")) # Char  |-> (s8_read_lane (7) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s6")) # Char  |-> (s8_read_lane (6) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s5")) # Char  |-> (s8_read_lane (5) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s4")) # Char  |-> (s8_read_lane (4) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # Char  |-> (s8_read_lane (3) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # Char  |-> (s8_read_lane (2) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # Char  |-> (s8_read_lane (1) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s0")) # Char  |-> (s8_read_lane (0) (vl) ((batch_pre - batch )) (A)))
  **  (CharArray.full input_pre (batch_pre + 7 ) A )
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
  **  (CharArray.full output_pre (batch_pre - batch ) (s8_rvv_progress ((batch_pre - batch )) (batch_pre) ((s8_narrow (RawLo))) ((s8_narrow (RawHi))) (A)) )
  **  (CharArray.undef_full output batch )
|--
  “ ((-128) <= voutput_min) ” 
  &&  “ (voutput_min <= 127) ” 
  &&  “ (0 <= vl) ” 
  &&  “ (vl <= 128) ” 
  &&  “ (0 < vl) ” 
  &&  “ (vl <= 128) ” 
  &&  “ (vl <= batch) ” 
  &&  “ (vl <= batch64) ” 
  &&  “ (0 < batch_pre) ” 
  &&  “ (batch_pre <= 18446744073709551608) ” 
  &&  “ (sizeof(CHAR) = 1) ” 
  &&  “ ((Zlength (A)) = (batch_pre + 7 )) ” 
  &&  “ (0 <= batch) ” 
  &&  “ (batch <= batch_pre) ” 
  &&  “ (input = (input_pre + ((batch_pre - batch ) * sizeof(CHAR)))) ” 
  &&  “ (batch > 0) ” 
  &&  “ (output = (output_pre + ((batch_pre - batch ) * sizeof(CHAR)))) ” 
  &&  “ (voutput_min = (s8_narrow (RawLo))) ” 
  &&  “ (voutput_max = (s8_narrow (RawHi))) ” 
  &&  “ ((-128) <= voutput_min) ” 
  &&  “ (voutput_min <= 127) ” 
  &&  “ ((-128) <= voutput_max) ” 
  &&  “ (voutput_max <= 127) ” 
  &&  “ (0 <= (s8_bulk_count (batch_pre))) ” 
  &&  “ ((s8_bulk_count (batch_pre)) <= batch_pre) ” 
  &&  “ (0 <= batch64) ” 
  &&  “ (batch64 = ((s8_bulk_count (batch_pre)) - (batch_pre - batch ) )) ” 
  &&  “ ((batch_pre - batch ) <= (s8_bulk_count (batch_pre))) ”
  &&  ((&(( &( "vacc" ) )->ₛ "s0")) # Char  |-> (s8_read_lane (0) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # Char  |-> (s8_read_lane (1) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # Char  |-> (s8_read_lane (2) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # Char  |-> (s8_read_lane (3) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s4")) # Char  |-> (s8_read_lane (4) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s5")) # Char  |-> (s8_read_lane (5) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s6")) # Char  |-> (s8_read_lane (6) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s7")) # Char  |-> (s8_read_lane (7) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s8")) # Char  |-> (s8_read_lane (8) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s9")) # Char  |-> (s8_read_lane (9) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s10")) # Char  |-> (s8_read_lane (10) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s11")) # Char  |-> (s8_read_lane (11) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s12")) # Char  |-> (s8_read_lane (12) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s13")) # Char  |-> (s8_read_lane (13) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s14")) # Char  |-> (s8_read_lane (14) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s15")) # Char  |-> (s8_read_lane (15) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s16")) # Char  |-> (s8_read_lane (16) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s17")) # Char  |-> (s8_read_lane (17) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s18")) # Char  |-> (s8_read_lane (18) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s19")) # Char  |-> (s8_read_lane (19) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s20")) # Char  |-> (s8_read_lane (20) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s21")) # Char  |-> (s8_read_lane (21) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s22")) # Char  |-> (s8_read_lane (22) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s23")) # Char  |-> (s8_read_lane (23) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s24")) # Char  |-> (s8_read_lane (24) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s25")) # Char  |-> (s8_read_lane (25) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s26")) # Char  |-> (s8_read_lane (26) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s27")) # Char  |-> (s8_read_lane (27) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s28")) # Char  |-> (s8_read_lane (28) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s29")) # Char  |-> (s8_read_lane (29) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s30")) # Char  |-> (s8_read_lane (30) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s31")) # Char  |-> (s8_read_lane (31) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s32")) # Char  |-> (s8_read_lane (32) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s33")) # Char  |-> (s8_read_lane (33) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s34")) # Char  |-> (s8_read_lane (34) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s35")) # Char  |-> (s8_read_lane (35) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s36")) # Char  |-> (s8_read_lane (36) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s37")) # Char  |-> (s8_read_lane (37) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s38")) # Char  |-> (s8_read_lane (38) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s39")) # Char  |-> (s8_read_lane (39) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s40")) # Char  |-> (s8_read_lane (40) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s41")) # Char  |-> (s8_read_lane (41) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s42")) # Char  |-> (s8_read_lane (42) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s43")) # Char  |-> (s8_read_lane (43) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s44")) # Char  |-> (s8_read_lane (44) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s45")) # Char  |-> (s8_read_lane (45) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s46")) # Char  |-> (s8_read_lane (46) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s47")) # Char  |-> (s8_read_lane (47) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s48")) # Char  |-> (s8_read_lane (48) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s49")) # Char  |-> (s8_read_lane (49) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s50")) # Char  |-> (s8_read_lane (50) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s51")) # Char  |-> (s8_read_lane (51) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s52")) # Char  |-> (s8_read_lane (52) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s53")) # Char  |-> (s8_read_lane (53) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s54")) # Char  |-> (s8_read_lane (54) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s55")) # Char  |-> (s8_read_lane (55) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s56")) # Char  |-> (s8_read_lane (56) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s57")) # Char  |-> (s8_read_lane (57) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s58")) # Char  |-> (s8_read_lane (58) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s59")) # Char  |-> (s8_read_lane (59) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s60")) # Char  |-> (s8_read_lane (60) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s61")) # Char  |-> (s8_read_lane (61) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s62")) # Char  |-> (s8_read_lane (62) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s63")) # Char  |-> (s8_read_lane (63) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s64")) # Char  |-> (s8_read_lane (64) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s65")) # Char  |-> (s8_read_lane (65) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s66")) # Char  |-> (s8_read_lane (66) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s67")) # Char  |-> (s8_read_lane (67) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s68")) # Char  |-> (s8_read_lane (68) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s69")) # Char  |-> (s8_read_lane (69) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s70")) # Char  |-> (s8_read_lane (70) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s71")) # Char  |-> (s8_read_lane (71) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s72")) # Char  |-> (s8_read_lane (72) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s73")) # Char  |-> (s8_read_lane (73) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s74")) # Char  |-> (s8_read_lane (74) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s75")) # Char  |-> (s8_read_lane (75) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s76")) # Char  |-> (s8_read_lane (76) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s77")) # Char  |-> (s8_read_lane (77) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s78")) # Char  |-> (s8_read_lane (78) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s79")) # Char  |-> (s8_read_lane (79) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s80")) # Char  |-> (s8_read_lane (80) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s81")) # Char  |-> (s8_read_lane (81) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s82")) # Char  |-> (s8_read_lane (82) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s83")) # Char  |-> (s8_read_lane (83) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s84")) # Char  |-> (s8_read_lane (84) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s85")) # Char  |-> (s8_read_lane (85) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s86")) # Char  |-> (s8_read_lane (86) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s87")) # Char  |-> (s8_read_lane (87) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s88")) # Char  |-> (s8_read_lane (88) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s89")) # Char  |-> (s8_read_lane (89) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s90")) # Char  |-> (s8_read_lane (90) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s91")) # Char  |-> (s8_read_lane (91) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s92")) # Char  |-> (s8_read_lane (92) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s93")) # Char  |-> (s8_read_lane (93) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s94")) # Char  |-> (s8_read_lane (94) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s95")) # Char  |-> (s8_read_lane (95) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s96")) # Char  |-> (s8_read_lane (96) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s97")) # Char  |-> (s8_read_lane (97) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s98")) # Char  |-> (s8_read_lane (98) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s99")) # Char  |-> (s8_read_lane (99) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s100")) # Char  |-> (s8_read_lane (100) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s101")) # Char  |-> (s8_read_lane (101) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s102")) # Char  |-> (s8_read_lane (102) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s103")) # Char  |-> (s8_read_lane (103) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s104")) # Char  |-> (s8_read_lane (104) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s105")) # Char  |-> (s8_read_lane (105) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s106")) # Char  |-> (s8_read_lane (106) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s107")) # Char  |-> (s8_read_lane (107) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s108")) # Char  |-> (s8_read_lane (108) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s109")) # Char  |-> (s8_read_lane (109) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s110")) # Char  |-> (s8_read_lane (110) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s111")) # Char  |-> (s8_read_lane (111) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s112")) # Char  |-> (s8_read_lane (112) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s113")) # Char  |-> (s8_read_lane (113) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s114")) # Char  |-> (s8_read_lane (114) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s115")) # Char  |-> (s8_read_lane (115) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s116")) # Char  |-> (s8_read_lane (116) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s117")) # Char  |-> (s8_read_lane (117) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s118")) # Char  |-> (s8_read_lane (118) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s119")) # Char  |-> (s8_read_lane (119) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s120")) # Char  |-> (s8_read_lane (120) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s121")) # Char  |-> (s8_read_lane (121) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s122")) # Char  |-> (s8_read_lane (122) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s123")) # Char  |-> (s8_read_lane (123) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s124")) # Char  |-> (s8_read_lane (124) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s125")) # Char  |-> (s8_read_lane (125) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s126")) # Char  |-> (s8_read_lane (126) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s127")) # Char  |-> (s8_read_lane (127) (vl) ((batch_pre - batch )) (A)))
  **  (CharArray.full input_pre (batch_pre + 7 ) A )
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
  **  (CharArray.full output_pre (batch_pre - batch ) (s8_rvv_progress ((batch_pre - batch )) (batch_pre) ((s8_narrow (RawLo))) ((s8_narrow (RawHi))) (A)) )
  **  (CharArray.undef_full output batch )
.

Definition test_rvv_partial_solve_wit_8 := test_rvv_partial_solve_wit_8_pure -> test_rvv_partial_solve_wit_8_aux.

Definition test_rvv_partial_solve_wit_9 := 
forall (params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (RawHi: Z) (RawLo: Z) (A: (@list Z)) (vl: Z) (batch: Z) (batch64: Z) (input: Z) (output: Z) (voutput_min: Z) (voutput_max: Z) (retval: Z) (PreH1 : (0 < vl)) (PreH2 : (vl <= 128)) (PreH3 : (vl <= batch)) (PreH4 : (vl <= batch64)) (PreH5 : (0 < batch_pre)) (PreH6 : (batch_pre <= 18446744073709551608)) (PreH7 : (sizeof(CHAR) = 1)) (PreH8 : ((Zlength (A)) = (batch_pre + 7 ))) (PreH9 : (0 <= batch)) (PreH10 : (batch <= batch_pre)) (PreH11 : (input = (input_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH12 : (batch > 0)) (PreH13 : (output = (output_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH14 : (voutput_min = (s8_narrow (RawLo)))) (PreH15 : (voutput_max = (s8_narrow (RawHi)))) (PreH16 : ((-128) <= voutput_min)) (PreH17 : (voutput_min <= 127)) (PreH18 : ((-128) <= voutput_max)) (PreH19 : (voutput_max <= 127)) (PreH20 : (0 <= (s8_bulk_count (batch_pre)))) (PreH21 : ((s8_bulk_count (batch_pre)) <= batch_pre)) (PreH22 : (0 <= batch64)) (PreH23 : (batch64 = ((s8_bulk_count (batch_pre)) - (batch_pre - batch ) ))) (PreH24 : ((batch_pre - batch ) <= (s8_bulk_count (batch_pre)))) ,
  (UndefStructPredvint8m8_t ( &( "vacc" ) ) )
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s0")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (0) (vl) ((batch_pre - batch )) (A))) (voutput_min) (0) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s1")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (1) (vl) ((batch_pre - batch )) (A))) (voutput_min) (1) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s2")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (2) (vl) ((batch_pre - batch )) (A))) (voutput_min) (2) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s3")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (3) (vl) ((batch_pre - batch )) (A))) (voutput_min) (3) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s4")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (4) (vl) ((batch_pre - batch )) (A))) (voutput_min) (4) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s5")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (5) (vl) ((batch_pre - batch )) (A))) (voutput_min) (5) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s6")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (6) (vl) ((batch_pre - batch )) (A))) (voutput_min) (6) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s7")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (7) (vl) ((batch_pre - batch )) (A))) (voutput_min) (7) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s8")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (8) (vl) ((batch_pre - batch )) (A))) (voutput_min) (8) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s9")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (9) (vl) ((batch_pre - batch )) (A))) (voutput_min) (9) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s10")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (10) (vl) ((batch_pre - batch )) (A))) (voutput_min) (10) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s11")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (11) (vl) ((batch_pre - batch )) (A))) (voutput_min) (11) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s12")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (12) (vl) ((batch_pre - batch )) (A))) (voutput_min) (12) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s13")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (13) (vl) ((batch_pre - batch )) (A))) (voutput_min) (13) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s14")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (14) (vl) ((batch_pre - batch )) (A))) (voutput_min) (14) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s15")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (15) (vl) ((batch_pre - batch )) (A))) (voutput_min) (15) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s16")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (16) (vl) ((batch_pre - batch )) (A))) (voutput_min) (16) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s17")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (17) (vl) ((batch_pre - batch )) (A))) (voutput_min) (17) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s18")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (18) (vl) ((batch_pre - batch )) (A))) (voutput_min) (18) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s19")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (19) (vl) ((batch_pre - batch )) (A))) (voutput_min) (19) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s20")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (20) (vl) ((batch_pre - batch )) (A))) (voutput_min) (20) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s21")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (21) (vl) ((batch_pre - batch )) (A))) (voutput_min) (21) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s22")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (22) (vl) ((batch_pre - batch )) (A))) (voutput_min) (22) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s23")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (23) (vl) ((batch_pre - batch )) (A))) (voutput_min) (23) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s24")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (24) (vl) ((batch_pre - batch )) (A))) (voutput_min) (24) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s25")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (25) (vl) ((batch_pre - batch )) (A))) (voutput_min) (25) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s26")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (26) (vl) ((batch_pre - batch )) (A))) (voutput_min) (26) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s27")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (27) (vl) ((batch_pre - batch )) (A))) (voutput_min) (27) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s28")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (28) (vl) ((batch_pre - batch )) (A))) (voutput_min) (28) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s29")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (29) (vl) ((batch_pre - batch )) (A))) (voutput_min) (29) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s30")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (30) (vl) ((batch_pre - batch )) (A))) (voutput_min) (30) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s31")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (31) (vl) ((batch_pre - batch )) (A))) (voutput_min) (31) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s32")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (32) (vl) ((batch_pre - batch )) (A))) (voutput_min) (32) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s33")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (33) (vl) ((batch_pre - batch )) (A))) (voutput_min) (33) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s34")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (34) (vl) ((batch_pre - batch )) (A))) (voutput_min) (34) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s35")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (35) (vl) ((batch_pre - batch )) (A))) (voutput_min) (35) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s36")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (36) (vl) ((batch_pre - batch )) (A))) (voutput_min) (36) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s37")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (37) (vl) ((batch_pre - batch )) (A))) (voutput_min) (37) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s38")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (38) (vl) ((batch_pre - batch )) (A))) (voutput_min) (38) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s39")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (39) (vl) ((batch_pre - batch )) (A))) (voutput_min) (39) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s40")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (40) (vl) ((batch_pre - batch )) (A))) (voutput_min) (40) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s41")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (41) (vl) ((batch_pre - batch )) (A))) (voutput_min) (41) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s42")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (42) (vl) ((batch_pre - batch )) (A))) (voutput_min) (42) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s43")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (43) (vl) ((batch_pre - batch )) (A))) (voutput_min) (43) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s44")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (44) (vl) ((batch_pre - batch )) (A))) (voutput_min) (44) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s45")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (45) (vl) ((batch_pre - batch )) (A))) (voutput_min) (45) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s46")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (46) (vl) ((batch_pre - batch )) (A))) (voutput_min) (46) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s47")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (47) (vl) ((batch_pre - batch )) (A))) (voutput_min) (47) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s48")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (48) (vl) ((batch_pre - batch )) (A))) (voutput_min) (48) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s49")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (49) (vl) ((batch_pre - batch )) (A))) (voutput_min) (49) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s50")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (50) (vl) ((batch_pre - batch )) (A))) (voutput_min) (50) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s51")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (51) (vl) ((batch_pre - batch )) (A))) (voutput_min) (51) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s52")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (52) (vl) ((batch_pre - batch )) (A))) (voutput_min) (52) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s53")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (53) (vl) ((batch_pre - batch )) (A))) (voutput_min) (53) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s54")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (54) (vl) ((batch_pre - batch )) (A))) (voutput_min) (54) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s55")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (55) (vl) ((batch_pre - batch )) (A))) (voutput_min) (55) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s56")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (56) (vl) ((batch_pre - batch )) (A))) (voutput_min) (56) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s57")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (57) (vl) ((batch_pre - batch )) (A))) (voutput_min) (57) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s58")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (58) (vl) ((batch_pre - batch )) (A))) (voutput_min) (58) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s59")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (59) (vl) ((batch_pre - batch )) (A))) (voutput_min) (59) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s60")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (60) (vl) ((batch_pre - batch )) (A))) (voutput_min) (60) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s61")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (61) (vl) ((batch_pre - batch )) (A))) (voutput_min) (61) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s62")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (62) (vl) ((batch_pre - batch )) (A))) (voutput_min) (62) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s63")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (63) (vl) ((batch_pre - batch )) (A))) (voutput_min) (63) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s64")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (64) (vl) ((batch_pre - batch )) (A))) (voutput_min) (64) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s65")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (65) (vl) ((batch_pre - batch )) (A))) (voutput_min) (65) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s66")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (66) (vl) ((batch_pre - batch )) (A))) (voutput_min) (66) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s67")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (67) (vl) ((batch_pre - batch )) (A))) (voutput_min) (67) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s68")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (68) (vl) ((batch_pre - batch )) (A))) (voutput_min) (68) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s69")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (69) (vl) ((batch_pre - batch )) (A))) (voutput_min) (69) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s70")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (70) (vl) ((batch_pre - batch )) (A))) (voutput_min) (70) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s71")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (71) (vl) ((batch_pre - batch )) (A))) (voutput_min) (71) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s72")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (72) (vl) ((batch_pre - batch )) (A))) (voutput_min) (72) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s73")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (73) (vl) ((batch_pre - batch )) (A))) (voutput_min) (73) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s74")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (74) (vl) ((batch_pre - batch )) (A))) (voutput_min) (74) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s75")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (75) (vl) ((batch_pre - batch )) (A))) (voutput_min) (75) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s76")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (76) (vl) ((batch_pre - batch )) (A))) (voutput_min) (76) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s77")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (77) (vl) ((batch_pre - batch )) (A))) (voutput_min) (77) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s78")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (78) (vl) ((batch_pre - batch )) (A))) (voutput_min) (78) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s79")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (79) (vl) ((batch_pre - batch )) (A))) (voutput_min) (79) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s80")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (80) (vl) ((batch_pre - batch )) (A))) (voutput_min) (80) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s81")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (81) (vl) ((batch_pre - batch )) (A))) (voutput_min) (81) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s82")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (82) (vl) ((batch_pre - batch )) (A))) (voutput_min) (82) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s83")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (83) (vl) ((batch_pre - batch )) (A))) (voutput_min) (83) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s84")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (84) (vl) ((batch_pre - batch )) (A))) (voutput_min) (84) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s85")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (85) (vl) ((batch_pre - batch )) (A))) (voutput_min) (85) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s86")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (86) (vl) ((batch_pre - batch )) (A))) (voutput_min) (86) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s87")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (87) (vl) ((batch_pre - batch )) (A))) (voutput_min) (87) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s88")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (88) (vl) ((batch_pre - batch )) (A))) (voutput_min) (88) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s89")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (89) (vl) ((batch_pre - batch )) (A))) (voutput_min) (89) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s90")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (90) (vl) ((batch_pre - batch )) (A))) (voutput_min) (90) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s91")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (91) (vl) ((batch_pre - batch )) (A))) (voutput_min) (91) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s92")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (92) (vl) ((batch_pre - batch )) (A))) (voutput_min) (92) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s93")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (93) (vl) ((batch_pre - batch )) (A))) (voutput_min) (93) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s94")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (94) (vl) ((batch_pre - batch )) (A))) (voutput_min) (94) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s95")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (95) (vl) ((batch_pre - batch )) (A))) (voutput_min) (95) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s96")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (96) (vl) ((batch_pre - batch )) (A))) (voutput_min) (96) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s97")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (97) (vl) ((batch_pre - batch )) (A))) (voutput_min) (97) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s98")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (98) (vl) ((batch_pre - batch )) (A))) (voutput_min) (98) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s99")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (99) (vl) ((batch_pre - batch )) (A))) (voutput_min) (99) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s100")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (100) (vl) ((batch_pre - batch )) (A))) (voutput_min) (100) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s101")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (101) (vl) ((batch_pre - batch )) (A))) (voutput_min) (101) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s102")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (102) (vl) ((batch_pre - batch )) (A))) (voutput_min) (102) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s103")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (103) (vl) ((batch_pre - batch )) (A))) (voutput_min) (103) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s104")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (104) (vl) ((batch_pre - batch )) (A))) (voutput_min) (104) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s105")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (105) (vl) ((batch_pre - batch )) (A))) (voutput_min) (105) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s106")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (106) (vl) ((batch_pre - batch )) (A))) (voutput_min) (106) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s107")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (107) (vl) ((batch_pre - batch )) (A))) (voutput_min) (107) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s108")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (108) (vl) ((batch_pre - batch )) (A))) (voutput_min) (108) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s109")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (109) (vl) ((batch_pre - batch )) (A))) (voutput_min) (109) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s110")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (110) (vl) ((batch_pre - batch )) (A))) (voutput_min) (110) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s111")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (111) (vl) ((batch_pre - batch )) (A))) (voutput_min) (111) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s112")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (112) (vl) ((batch_pre - batch )) (A))) (voutput_min) (112) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s113")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (113) (vl) ((batch_pre - batch )) (A))) (voutput_min) (113) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s114")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (114) (vl) ((batch_pre - batch )) (A))) (voutput_min) (114) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s115")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (115) (vl) ((batch_pre - batch )) (A))) (voutput_min) (115) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s116")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (116) (vl) ((batch_pre - batch )) (A))) (voutput_min) (116) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s117")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (117) (vl) ((batch_pre - batch )) (A))) (voutput_min) (117) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s118")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (118) (vl) ((batch_pre - batch )) (A))) (voutput_min) (118) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s119")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (119) (vl) ((batch_pre - batch )) (A))) (voutput_min) (119) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s120")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (120) (vl) ((batch_pre - batch )) (A))) (voutput_min) (120) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s121")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (121) (vl) ((batch_pre - batch )) (A))) (voutput_min) (121) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s122")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (122) (vl) ((batch_pre - batch )) (A))) (voutput_min) (122) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s123")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (123) (vl) ((batch_pre - batch )) (A))) (voutput_min) (123) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s124")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (124) (vl) ((batch_pre - batch )) (A))) (voutput_min) (124) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s125")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (125) (vl) ((batch_pre - batch )) (A))) (voutput_min) (125) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s126")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (126) (vl) ((batch_pre - batch )) (A))) (voutput_min) (126) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s127")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (127) (vl) ((batch_pre - batch )) (A))) (voutput_min) (127) (vl)))
  **  (CharArray.full input_pre (batch_pre + 7 ) A )
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
  **  (CharArray.full output_pre (batch_pre - batch ) (s8_rvv_progress ((batch_pre - batch )) (batch_pre) ((s8_narrow (RawLo))) ((s8_narrow (RawHi))) (A)) )
  **  (CharArray.undef_full output batch )
|--
  “ (0 < vl) ” 
  &&  “ (vl <= 128) ” 
  &&  “ (vl <= batch) ” 
  &&  “ (vl <= batch64) ” 
  &&  “ (0 < batch_pre) ” 
  &&  “ (batch_pre <= 18446744073709551608) ” 
  &&  “ (sizeof(CHAR) = 1) ” 
  &&  “ ((Zlength (A)) = (batch_pre + 7 )) ” 
  &&  “ (0 <= batch) ” 
  &&  “ (batch <= batch_pre) ” 
  &&  “ (input = (input_pre + ((batch_pre - batch ) * sizeof(CHAR)))) ” 
  &&  “ (batch > 0) ” 
  &&  “ (output = (output_pre + ((batch_pre - batch ) * sizeof(CHAR)))) ” 
  &&  “ (voutput_min = (s8_narrow (RawLo))) ” 
  &&  “ (voutput_max = (s8_narrow (RawHi))) ” 
  &&  “ ((-128) <= voutput_min) ” 
  &&  “ (voutput_min <= 127) ” 
  &&  “ ((-128) <= voutput_max) ” 
  &&  “ (voutput_max <= 127) ” 
  &&  “ (0 <= (s8_bulk_count (batch_pre))) ” 
  &&  “ ((s8_bulk_count (batch_pre)) <= batch_pre) ” 
  &&  “ (0 <= batch64) ” 
  &&  “ (batch64 = ((s8_bulk_count (batch_pre)) - (batch_pre - batch ) )) ” 
  &&  “ ((batch_pre - batch ) <= (s8_bulk_count (batch_pre))) ”
  &&  ((&(( &( "vacc" ) )->ₛ "s127")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s127")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (127) (vl) ((batch_pre - batch )) (A))) (voutput_min) (127) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s126")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s126")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (126) (vl) ((batch_pre - batch )) (A))) (voutput_min) (126) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s125")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s125")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (125) (vl) ((batch_pre - batch )) (A))) (voutput_min) (125) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s124")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s124")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (124) (vl) ((batch_pre - batch )) (A))) (voutput_min) (124) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s123")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s123")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (123) (vl) ((batch_pre - batch )) (A))) (voutput_min) (123) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s122")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s122")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (122) (vl) ((batch_pre - batch )) (A))) (voutput_min) (122) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s121")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s121")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (121) (vl) ((batch_pre - batch )) (A))) (voutput_min) (121) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s120")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s120")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (120) (vl) ((batch_pre - batch )) (A))) (voutput_min) (120) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s119")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s119")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (119) (vl) ((batch_pre - batch )) (A))) (voutput_min) (119) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s118")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s118")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (118) (vl) ((batch_pre - batch )) (A))) (voutput_min) (118) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s117")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s117")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (117) (vl) ((batch_pre - batch )) (A))) (voutput_min) (117) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s116")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s116")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (116) (vl) ((batch_pre - batch )) (A))) (voutput_min) (116) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s115")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s115")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (115) (vl) ((batch_pre - batch )) (A))) (voutput_min) (115) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s114")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s114")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (114) (vl) ((batch_pre - batch )) (A))) (voutput_min) (114) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s113")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s113")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (113) (vl) ((batch_pre - batch )) (A))) (voutput_min) (113) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s112")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s112")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (112) (vl) ((batch_pre - batch )) (A))) (voutput_min) (112) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s111")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s111")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (111) (vl) ((batch_pre - batch )) (A))) (voutput_min) (111) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s110")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s110")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (110) (vl) ((batch_pre - batch )) (A))) (voutput_min) (110) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s109")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s109")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (109) (vl) ((batch_pre - batch )) (A))) (voutput_min) (109) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s108")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s108")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (108) (vl) ((batch_pre - batch )) (A))) (voutput_min) (108) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s107")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s107")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (107) (vl) ((batch_pre - batch )) (A))) (voutput_min) (107) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s106")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s106")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (106) (vl) ((batch_pre - batch )) (A))) (voutput_min) (106) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s105")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s105")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (105) (vl) ((batch_pre - batch )) (A))) (voutput_min) (105) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s104")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s104")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (104) (vl) ((batch_pre - batch )) (A))) (voutput_min) (104) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s103")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s103")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (103) (vl) ((batch_pre - batch )) (A))) (voutput_min) (103) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s102")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s102")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (102) (vl) ((batch_pre - batch )) (A))) (voutput_min) (102) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s101")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s101")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (101) (vl) ((batch_pre - batch )) (A))) (voutput_min) (101) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s100")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s100")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (100) (vl) ((batch_pre - batch )) (A))) (voutput_min) (100) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s99")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s99")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (99) (vl) ((batch_pre - batch )) (A))) (voutput_min) (99) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s98")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s98")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (98) (vl) ((batch_pre - batch )) (A))) (voutput_min) (98) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s97")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s97")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (97) (vl) ((batch_pre - batch )) (A))) (voutput_min) (97) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s96")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s96")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (96) (vl) ((batch_pre - batch )) (A))) (voutput_min) (96) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s95")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s95")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (95) (vl) ((batch_pre - batch )) (A))) (voutput_min) (95) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s94")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s94")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (94) (vl) ((batch_pre - batch )) (A))) (voutput_min) (94) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s93")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s93")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (93) (vl) ((batch_pre - batch )) (A))) (voutput_min) (93) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s92")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s92")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (92) (vl) ((batch_pre - batch )) (A))) (voutput_min) (92) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s91")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s91")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (91) (vl) ((batch_pre - batch )) (A))) (voutput_min) (91) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s90")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s90")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (90) (vl) ((batch_pre - batch )) (A))) (voutput_min) (90) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s89")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s89")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (89) (vl) ((batch_pre - batch )) (A))) (voutput_min) (89) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s88")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s88")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (88) (vl) ((batch_pre - batch )) (A))) (voutput_min) (88) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s87")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s87")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (87) (vl) ((batch_pre - batch )) (A))) (voutput_min) (87) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s86")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s86")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (86) (vl) ((batch_pre - batch )) (A))) (voutput_min) (86) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s85")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s85")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (85) (vl) ((batch_pre - batch )) (A))) (voutput_min) (85) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s84")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s84")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (84) (vl) ((batch_pre - batch )) (A))) (voutput_min) (84) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s83")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s83")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (83) (vl) ((batch_pre - batch )) (A))) (voutput_min) (83) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s82")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s82")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (82) (vl) ((batch_pre - batch )) (A))) (voutput_min) (82) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s81")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s81")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (81) (vl) ((batch_pre - batch )) (A))) (voutput_min) (81) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s80")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s80")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (80) (vl) ((batch_pre - batch )) (A))) (voutput_min) (80) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s79")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s79")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (79) (vl) ((batch_pre - batch )) (A))) (voutput_min) (79) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s78")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s78")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (78) (vl) ((batch_pre - batch )) (A))) (voutput_min) (78) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s77")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s77")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (77) (vl) ((batch_pre - batch )) (A))) (voutput_min) (77) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s76")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s76")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (76) (vl) ((batch_pre - batch )) (A))) (voutput_min) (76) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s75")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s75")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (75) (vl) ((batch_pre - batch )) (A))) (voutput_min) (75) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s74")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s74")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (74) (vl) ((batch_pre - batch )) (A))) (voutput_min) (74) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s73")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s73")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (73) (vl) ((batch_pre - batch )) (A))) (voutput_min) (73) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s72")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s72")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (72) (vl) ((batch_pre - batch )) (A))) (voutput_min) (72) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s71")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s71")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (71) (vl) ((batch_pre - batch )) (A))) (voutput_min) (71) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s70")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s70")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (70) (vl) ((batch_pre - batch )) (A))) (voutput_min) (70) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s69")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s69")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (69) (vl) ((batch_pre - batch )) (A))) (voutput_min) (69) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s68")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s68")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (68) (vl) ((batch_pre - batch )) (A))) (voutput_min) (68) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s67")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s67")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (67) (vl) ((batch_pre - batch )) (A))) (voutput_min) (67) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s66")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s66")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (66) (vl) ((batch_pre - batch )) (A))) (voutput_min) (66) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s65")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s65")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (65) (vl) ((batch_pre - batch )) (A))) (voutput_min) (65) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s64")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s64")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (64) (vl) ((batch_pre - batch )) (A))) (voutput_min) (64) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s63")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s63")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (63) (vl) ((batch_pre - batch )) (A))) (voutput_min) (63) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s62")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s62")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (62) (vl) ((batch_pre - batch )) (A))) (voutput_min) (62) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s61")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s61")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (61) (vl) ((batch_pre - batch )) (A))) (voutput_min) (61) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s60")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s60")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (60) (vl) ((batch_pre - batch )) (A))) (voutput_min) (60) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s59")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s59")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (59) (vl) ((batch_pre - batch )) (A))) (voutput_min) (59) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s58")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s58")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (58) (vl) ((batch_pre - batch )) (A))) (voutput_min) (58) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s57")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s57")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (57) (vl) ((batch_pre - batch )) (A))) (voutput_min) (57) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s56")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s56")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (56) (vl) ((batch_pre - batch )) (A))) (voutput_min) (56) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s55")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s55")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (55) (vl) ((batch_pre - batch )) (A))) (voutput_min) (55) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s54")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s54")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (54) (vl) ((batch_pre - batch )) (A))) (voutput_min) (54) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s53")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s53")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (53) (vl) ((batch_pre - batch )) (A))) (voutput_min) (53) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s52")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s52")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (52) (vl) ((batch_pre - batch )) (A))) (voutput_min) (52) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s51")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s51")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (51) (vl) ((batch_pre - batch )) (A))) (voutput_min) (51) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s50")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s50")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (50) (vl) ((batch_pre - batch )) (A))) (voutput_min) (50) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s49")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s49")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (49) (vl) ((batch_pre - batch )) (A))) (voutput_min) (49) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s48")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s48")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (48) (vl) ((batch_pre - batch )) (A))) (voutput_min) (48) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s47")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s47")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (47) (vl) ((batch_pre - batch )) (A))) (voutput_min) (47) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s46")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s46")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (46) (vl) ((batch_pre - batch )) (A))) (voutput_min) (46) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s45")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s45")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (45) (vl) ((batch_pre - batch )) (A))) (voutput_min) (45) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s44")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s44")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (44) (vl) ((batch_pre - batch )) (A))) (voutput_min) (44) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s43")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s43")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (43) (vl) ((batch_pre - batch )) (A))) (voutput_min) (43) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s42")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s42")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (42) (vl) ((batch_pre - batch )) (A))) (voutput_min) (42) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s41")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s41")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (41) (vl) ((batch_pre - batch )) (A))) (voutput_min) (41) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s40")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s40")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (40) (vl) ((batch_pre - batch )) (A))) (voutput_min) (40) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s39")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s39")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (39) (vl) ((batch_pre - batch )) (A))) (voutput_min) (39) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s38")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s38")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (38) (vl) ((batch_pre - batch )) (A))) (voutput_min) (38) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s37")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s37")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (37) (vl) ((batch_pre - batch )) (A))) (voutput_min) (37) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s36")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s36")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (36) (vl) ((batch_pre - batch )) (A))) (voutput_min) (36) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s35")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s35")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (35) (vl) ((batch_pre - batch )) (A))) (voutput_min) (35) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s34")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s34")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (34) (vl) ((batch_pre - batch )) (A))) (voutput_min) (34) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s33")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s33")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (33) (vl) ((batch_pre - batch )) (A))) (voutput_min) (33) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s32")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s32")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (32) (vl) ((batch_pre - batch )) (A))) (voutput_min) (32) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s31")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s31")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (31) (vl) ((batch_pre - batch )) (A))) (voutput_min) (31) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s30")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s30")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (30) (vl) ((batch_pre - batch )) (A))) (voutput_min) (30) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s29")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s29")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (29) (vl) ((batch_pre - batch )) (A))) (voutput_min) (29) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s28")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s28")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (28) (vl) ((batch_pre - batch )) (A))) (voutput_min) (28) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s27")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s27")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (27) (vl) ((batch_pre - batch )) (A))) (voutput_min) (27) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s26")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s26")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (26) (vl) ((batch_pre - batch )) (A))) (voutput_min) (26) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s25")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s25")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (25) (vl) ((batch_pre - batch )) (A))) (voutput_min) (25) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s24")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s24")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (24) (vl) ((batch_pre - batch )) (A))) (voutput_min) (24) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s23")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s23")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (23) (vl) ((batch_pre - batch )) (A))) (voutput_min) (23) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s22")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s22")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (22) (vl) ((batch_pre - batch )) (A))) (voutput_min) (22) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s21")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s21")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (21) (vl) ((batch_pre - batch )) (A))) (voutput_min) (21) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s20")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s20")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (20) (vl) ((batch_pre - batch )) (A))) (voutput_min) (20) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s19")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s19")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (19) (vl) ((batch_pre - batch )) (A))) (voutput_min) (19) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s18")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s18")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (18) (vl) ((batch_pre - batch )) (A))) (voutput_min) (18) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s17")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s17")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (17) (vl) ((batch_pre - batch )) (A))) (voutput_min) (17) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s16")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s16")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (16) (vl) ((batch_pre - batch )) (A))) (voutput_min) (16) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s15")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s15")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (15) (vl) ((batch_pre - batch )) (A))) (voutput_min) (15) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s14")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s14")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (14) (vl) ((batch_pre - batch )) (A))) (voutput_min) (14) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s13")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s13")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (13) (vl) ((batch_pre - batch )) (A))) (voutput_min) (13) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s12")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s12")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (12) (vl) ((batch_pre - batch )) (A))) (voutput_min) (12) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s11")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s11")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (11) (vl) ((batch_pre - batch )) (A))) (voutput_min) (11) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s10")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s10")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (10) (vl) ((batch_pre - batch )) (A))) (voutput_min) (10) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s9")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s9")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (9) (vl) ((batch_pre - batch )) (A))) (voutput_min) (9) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s8")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s8")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (8) (vl) ((batch_pre - batch )) (A))) (voutput_min) (8) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s7")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s7")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (7) (vl) ((batch_pre - batch )) (A))) (voutput_min) (7) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s6")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s6")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (6) (vl) ((batch_pre - batch )) (A))) (voutput_min) (6) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s5")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s5")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (5) (vl) ((batch_pre - batch )) (A))) (voutput_min) (5) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s4")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s4")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (4) (vl) ((batch_pre - batch )) (A))) (voutput_min) (4) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s3")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (3) (vl) ((batch_pre - batch )) (A))) (voutput_min) (3) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s2")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (2) (vl) ((batch_pre - batch )) (A))) (voutput_min) (2) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s1")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (1) (vl) ((batch_pre - batch )) (A))) (voutput_min) (1) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s0")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s0")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (0) (vl) ((batch_pre - batch )) (A))) (voutput_min) (0) (vl)))
  **  (CharArray.full input_pre (batch_pre + 7 ) A )
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
  **  (CharArray.full output_pre (batch_pre - batch ) (s8_rvv_progress ((batch_pre - batch )) (batch_pre) ((s8_narrow (RawLo))) ((s8_narrow (RawHi))) (A)) )
  **  (CharArray.undef_full output batch )
.

Definition test_rvv_partial_solve_wit_10_pure := 
forall (params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (RawHi: Z) (RawLo: Z) (A: (@list Z)) (vl: Z) (batch: Z) (batch64: Z) (input: Z) (output: Z) (voutput_min: Z) (voutput_max: Z) (PreH1 : (0 < vl)) (PreH2 : (vl <= 128)) (PreH3 : (vl <= batch)) (PreH4 : (vl <= batch64)) (PreH5 : (0 < batch_pre)) (PreH6 : (batch_pre <= 18446744073709551608)) (PreH7 : (sizeof(CHAR) = 1)) (PreH8 : ((Zlength (A)) = (batch_pre + 7 ))) (PreH9 : (0 <= batch)) (PreH10 : (batch <= batch_pre)) (PreH11 : (input = (input_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH12 : (batch > 0)) (PreH13 : (output = (output_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH14 : (voutput_min = (s8_narrow (RawLo)))) (PreH15 : (voutput_max = (s8_narrow (RawHi)))) (PreH16 : ((-128) <= voutput_min)) (PreH17 : (voutput_min <= 127)) (PreH18 : ((-128) <= voutput_max)) (PreH19 : (voutput_max <= 127)) (PreH20 : (0 <= (s8_bulk_count (batch_pre)))) (PreH21 : ((s8_bulk_count (batch_pre)) <= batch_pre)) (PreH22 : (0 <= batch64)) (PreH23 : (batch64 = ((s8_bulk_count (batch_pre)) - (batch_pre - batch ) ))) (PreH24 : ((batch_pre - batch ) <= (s8_bulk_count (batch_pre)))) ,
  ((&(( &( "vacc" ) )->ₛ "s127")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (127) (vl) ((batch_pre - batch )) (A))) (voutput_min) (127) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s126")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (126) (vl) ((batch_pre - batch )) (A))) (voutput_min) (126) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s125")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (125) (vl) ((batch_pre - batch )) (A))) (voutput_min) (125) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s124")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (124) (vl) ((batch_pre - batch )) (A))) (voutput_min) (124) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s123")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (123) (vl) ((batch_pre - batch )) (A))) (voutput_min) (123) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s122")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (122) (vl) ((batch_pre - batch )) (A))) (voutput_min) (122) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s121")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (121) (vl) ((batch_pre - batch )) (A))) (voutput_min) (121) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s120")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (120) (vl) ((batch_pre - batch )) (A))) (voutput_min) (120) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s119")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (119) (vl) ((batch_pre - batch )) (A))) (voutput_min) (119) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s118")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (118) (vl) ((batch_pre - batch )) (A))) (voutput_min) (118) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s117")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (117) (vl) ((batch_pre - batch )) (A))) (voutput_min) (117) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s116")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (116) (vl) ((batch_pre - batch )) (A))) (voutput_min) (116) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s115")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (115) (vl) ((batch_pre - batch )) (A))) (voutput_min) (115) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s114")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (114) (vl) ((batch_pre - batch )) (A))) (voutput_min) (114) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s113")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (113) (vl) ((batch_pre - batch )) (A))) (voutput_min) (113) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s112")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (112) (vl) ((batch_pre - batch )) (A))) (voutput_min) (112) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s111")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (111) (vl) ((batch_pre - batch )) (A))) (voutput_min) (111) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s110")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (110) (vl) ((batch_pre - batch )) (A))) (voutput_min) (110) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s109")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (109) (vl) ((batch_pre - batch )) (A))) (voutput_min) (109) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s108")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (108) (vl) ((batch_pre - batch )) (A))) (voutput_min) (108) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s107")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (107) (vl) ((batch_pre - batch )) (A))) (voutput_min) (107) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s106")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (106) (vl) ((batch_pre - batch )) (A))) (voutput_min) (106) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s105")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (105) (vl) ((batch_pre - batch )) (A))) (voutput_min) (105) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s104")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (104) (vl) ((batch_pre - batch )) (A))) (voutput_min) (104) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s103")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (103) (vl) ((batch_pre - batch )) (A))) (voutput_min) (103) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s102")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (102) (vl) ((batch_pre - batch )) (A))) (voutput_min) (102) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s101")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (101) (vl) ((batch_pre - batch )) (A))) (voutput_min) (101) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s100")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (100) (vl) ((batch_pre - batch )) (A))) (voutput_min) (100) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s99")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (99) (vl) ((batch_pre - batch )) (A))) (voutput_min) (99) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s98")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (98) (vl) ((batch_pre - batch )) (A))) (voutput_min) (98) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s97")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (97) (vl) ((batch_pre - batch )) (A))) (voutput_min) (97) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s96")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (96) (vl) ((batch_pre - batch )) (A))) (voutput_min) (96) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s95")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (95) (vl) ((batch_pre - batch )) (A))) (voutput_min) (95) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s94")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (94) (vl) ((batch_pre - batch )) (A))) (voutput_min) (94) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s93")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (93) (vl) ((batch_pre - batch )) (A))) (voutput_min) (93) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s92")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (92) (vl) ((batch_pre - batch )) (A))) (voutput_min) (92) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s91")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (91) (vl) ((batch_pre - batch )) (A))) (voutput_min) (91) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s90")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (90) (vl) ((batch_pre - batch )) (A))) (voutput_min) (90) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s89")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (89) (vl) ((batch_pre - batch )) (A))) (voutput_min) (89) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s88")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (88) (vl) ((batch_pre - batch )) (A))) (voutput_min) (88) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s87")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (87) (vl) ((batch_pre - batch )) (A))) (voutput_min) (87) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s86")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (86) (vl) ((batch_pre - batch )) (A))) (voutput_min) (86) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s85")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (85) (vl) ((batch_pre - batch )) (A))) (voutput_min) (85) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s84")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (84) (vl) ((batch_pre - batch )) (A))) (voutput_min) (84) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s83")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (83) (vl) ((batch_pre - batch )) (A))) (voutput_min) (83) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s82")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (82) (vl) ((batch_pre - batch )) (A))) (voutput_min) (82) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s81")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (81) (vl) ((batch_pre - batch )) (A))) (voutput_min) (81) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s80")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (80) (vl) ((batch_pre - batch )) (A))) (voutput_min) (80) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s79")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (79) (vl) ((batch_pre - batch )) (A))) (voutput_min) (79) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s78")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (78) (vl) ((batch_pre - batch )) (A))) (voutput_min) (78) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s77")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (77) (vl) ((batch_pre - batch )) (A))) (voutput_min) (77) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s76")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (76) (vl) ((batch_pre - batch )) (A))) (voutput_min) (76) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s75")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (75) (vl) ((batch_pre - batch )) (A))) (voutput_min) (75) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s74")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (74) (vl) ((batch_pre - batch )) (A))) (voutput_min) (74) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s73")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (73) (vl) ((batch_pre - batch )) (A))) (voutput_min) (73) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s72")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (72) (vl) ((batch_pre - batch )) (A))) (voutput_min) (72) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s71")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (71) (vl) ((batch_pre - batch )) (A))) (voutput_min) (71) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s70")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (70) (vl) ((batch_pre - batch )) (A))) (voutput_min) (70) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s69")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (69) (vl) ((batch_pre - batch )) (A))) (voutput_min) (69) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s68")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (68) (vl) ((batch_pre - batch )) (A))) (voutput_min) (68) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s67")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (67) (vl) ((batch_pre - batch )) (A))) (voutput_min) (67) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s66")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (66) (vl) ((batch_pre - batch )) (A))) (voutput_min) (66) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s65")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (65) (vl) ((batch_pre - batch )) (A))) (voutput_min) (65) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s64")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (64) (vl) ((batch_pre - batch )) (A))) (voutput_min) (64) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s63")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (63) (vl) ((batch_pre - batch )) (A))) (voutput_min) (63) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s62")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (62) (vl) ((batch_pre - batch )) (A))) (voutput_min) (62) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s61")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (61) (vl) ((batch_pre - batch )) (A))) (voutput_min) (61) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s60")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (60) (vl) ((batch_pre - batch )) (A))) (voutput_min) (60) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s59")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (59) (vl) ((batch_pre - batch )) (A))) (voutput_min) (59) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s58")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (58) (vl) ((batch_pre - batch )) (A))) (voutput_min) (58) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s57")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (57) (vl) ((batch_pre - batch )) (A))) (voutput_min) (57) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s56")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (56) (vl) ((batch_pre - batch )) (A))) (voutput_min) (56) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s55")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (55) (vl) ((batch_pre - batch )) (A))) (voutput_min) (55) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s54")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (54) (vl) ((batch_pre - batch )) (A))) (voutput_min) (54) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s53")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (53) (vl) ((batch_pre - batch )) (A))) (voutput_min) (53) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s52")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (52) (vl) ((batch_pre - batch )) (A))) (voutput_min) (52) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s51")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (51) (vl) ((batch_pre - batch )) (A))) (voutput_min) (51) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s50")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (50) (vl) ((batch_pre - batch )) (A))) (voutput_min) (50) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s49")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (49) (vl) ((batch_pre - batch )) (A))) (voutput_min) (49) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s48")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (48) (vl) ((batch_pre - batch )) (A))) (voutput_min) (48) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s47")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (47) (vl) ((batch_pre - batch )) (A))) (voutput_min) (47) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s46")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (46) (vl) ((batch_pre - batch )) (A))) (voutput_min) (46) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s45")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (45) (vl) ((batch_pre - batch )) (A))) (voutput_min) (45) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s44")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (44) (vl) ((batch_pre - batch )) (A))) (voutput_min) (44) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s43")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (43) (vl) ((batch_pre - batch )) (A))) (voutput_min) (43) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s42")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (42) (vl) ((batch_pre - batch )) (A))) (voutput_min) (42) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s41")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (41) (vl) ((batch_pre - batch )) (A))) (voutput_min) (41) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s40")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (40) (vl) ((batch_pre - batch )) (A))) (voutput_min) (40) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s39")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (39) (vl) ((batch_pre - batch )) (A))) (voutput_min) (39) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s38")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (38) (vl) ((batch_pre - batch )) (A))) (voutput_min) (38) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s37")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (37) (vl) ((batch_pre - batch )) (A))) (voutput_min) (37) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s36")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (36) (vl) ((batch_pre - batch )) (A))) (voutput_min) (36) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s35")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (35) (vl) ((batch_pre - batch )) (A))) (voutput_min) (35) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s34")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (34) (vl) ((batch_pre - batch )) (A))) (voutput_min) (34) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s33")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (33) (vl) ((batch_pre - batch )) (A))) (voutput_min) (33) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s32")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (32) (vl) ((batch_pre - batch )) (A))) (voutput_min) (32) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s31")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (31) (vl) ((batch_pre - batch )) (A))) (voutput_min) (31) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s30")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (30) (vl) ((batch_pre - batch )) (A))) (voutput_min) (30) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s29")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (29) (vl) ((batch_pre - batch )) (A))) (voutput_min) (29) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s28")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (28) (vl) ((batch_pre - batch )) (A))) (voutput_min) (28) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s27")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (27) (vl) ((batch_pre - batch )) (A))) (voutput_min) (27) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s26")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (26) (vl) ((batch_pre - batch )) (A))) (voutput_min) (26) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s25")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (25) (vl) ((batch_pre - batch )) (A))) (voutput_min) (25) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s24")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (24) (vl) ((batch_pre - batch )) (A))) (voutput_min) (24) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s23")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (23) (vl) ((batch_pre - batch )) (A))) (voutput_min) (23) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s22")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (22) (vl) ((batch_pre - batch )) (A))) (voutput_min) (22) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s21")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (21) (vl) ((batch_pre - batch )) (A))) (voutput_min) (21) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s20")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (20) (vl) ((batch_pre - batch )) (A))) (voutput_min) (20) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s19")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (19) (vl) ((batch_pre - batch )) (A))) (voutput_min) (19) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s18")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (18) (vl) ((batch_pre - batch )) (A))) (voutput_min) (18) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s17")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (17) (vl) ((batch_pre - batch )) (A))) (voutput_min) (17) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s16")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (16) (vl) ((batch_pre - batch )) (A))) (voutput_min) (16) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s15")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (15) (vl) ((batch_pre - batch )) (A))) (voutput_min) (15) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s14")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (14) (vl) ((batch_pre - batch )) (A))) (voutput_min) (14) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s13")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (13) (vl) ((batch_pre - batch )) (A))) (voutput_min) (13) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s12")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (12) (vl) ((batch_pre - batch )) (A))) (voutput_min) (12) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s11")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (11) (vl) ((batch_pre - batch )) (A))) (voutput_min) (11) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s10")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (10) (vl) ((batch_pre - batch )) (A))) (voutput_min) (10) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s9")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (9) (vl) ((batch_pre - batch )) (A))) (voutput_min) (9) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s8")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (8) (vl) ((batch_pre - batch )) (A))) (voutput_min) (8) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s7")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (7) (vl) ((batch_pre - batch )) (A))) (voutput_min) (7) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s6")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (6) (vl) ((batch_pre - batch )) (A))) (voutput_min) (6) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s5")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (5) (vl) ((batch_pre - batch )) (A))) (voutput_min) (5) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s4")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (4) (vl) ((batch_pre - batch )) (A))) (voutput_min) (4) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (3) (vl) ((batch_pre - batch )) (A))) (voutput_min) (3) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (2) (vl) ((batch_pre - batch )) (A))) (voutput_min) (2) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (1) (vl) ((batch_pre - batch )) (A))) (voutput_min) (1) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s0")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (0) (vl) ((batch_pre - batch )) (A))) (voutput_min) (0) (vl)))
  **  (CharArray.full input_pre (batch_pre + 7 ) A )
  **  ((( &( "vl" ) )) # UInt64  |-> vl)
  **  ((( &( "batch" ) )) # UInt64  |-> batch)
  **  ((( &( "batch64" ) )) # UInt64  |-> batch64)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "voutput_min" ) )) # Char  |-> voutput_min)
  **  ((( &( "voutput_max" ) )) # Char  |-> voutput_max)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
  **  (CharArray.full output_pre (batch_pre - batch ) (s8_rvv_progress ((batch_pre - batch )) (batch_pre) ((s8_narrow (RawLo))) ((s8_narrow (RawHi))) (A)) )
  **  (CharArray.undef_full output batch )
|--
  “ ((-128) <= voutput_max) ” 
  &&  “ (voutput_max <= 127) ” 
  &&  “ (0 <= vl) ” 
  &&  “ (vl <= 128) ”
.

Definition test_rvv_partial_solve_wit_10_aux := 
forall (params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (RawHi: Z) (RawLo: Z) (A: (@list Z)) (vl: Z) (batch: Z) (batch64: Z) (input: Z) (output: Z) (voutput_min: Z) (voutput_max: Z) (PreH1 : (0 < vl)) (PreH2 : (vl <= 128)) (PreH3 : (vl <= batch)) (PreH4 : (vl <= batch64)) (PreH5 : (0 < batch_pre)) (PreH6 : (batch_pre <= 18446744073709551608)) (PreH7 : (sizeof(CHAR) = 1)) (PreH8 : ((Zlength (A)) = (batch_pre + 7 ))) (PreH9 : (0 <= batch)) (PreH10 : (batch <= batch_pre)) (PreH11 : (input = (input_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH12 : (batch > 0)) (PreH13 : (output = (output_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH14 : (voutput_min = (s8_narrow (RawLo)))) (PreH15 : (voutput_max = (s8_narrow (RawHi)))) (PreH16 : ((-128) <= voutput_min)) (PreH17 : (voutput_min <= 127)) (PreH18 : ((-128) <= voutput_max)) (PreH19 : (voutput_max <= 127)) (PreH20 : (0 <= (s8_bulk_count (batch_pre)))) (PreH21 : ((s8_bulk_count (batch_pre)) <= batch_pre)) (PreH22 : (0 <= batch64)) (PreH23 : (batch64 = ((s8_bulk_count (batch_pre)) - (batch_pre - batch ) ))) (PreH24 : ((batch_pre - batch ) <= (s8_bulk_count (batch_pre)))) ,
  ((&(( &( "vacc" ) )->ₛ "s127")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (127) (vl) ((batch_pre - batch )) (A))) (voutput_min) (127) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s126")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (126) (vl) ((batch_pre - batch )) (A))) (voutput_min) (126) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s125")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (125) (vl) ((batch_pre - batch )) (A))) (voutput_min) (125) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s124")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (124) (vl) ((batch_pre - batch )) (A))) (voutput_min) (124) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s123")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (123) (vl) ((batch_pre - batch )) (A))) (voutput_min) (123) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s122")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (122) (vl) ((batch_pre - batch )) (A))) (voutput_min) (122) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s121")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (121) (vl) ((batch_pre - batch )) (A))) (voutput_min) (121) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s120")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (120) (vl) ((batch_pre - batch )) (A))) (voutput_min) (120) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s119")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (119) (vl) ((batch_pre - batch )) (A))) (voutput_min) (119) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s118")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (118) (vl) ((batch_pre - batch )) (A))) (voutput_min) (118) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s117")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (117) (vl) ((batch_pre - batch )) (A))) (voutput_min) (117) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s116")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (116) (vl) ((batch_pre - batch )) (A))) (voutput_min) (116) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s115")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (115) (vl) ((batch_pre - batch )) (A))) (voutput_min) (115) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s114")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (114) (vl) ((batch_pre - batch )) (A))) (voutput_min) (114) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s113")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (113) (vl) ((batch_pre - batch )) (A))) (voutput_min) (113) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s112")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (112) (vl) ((batch_pre - batch )) (A))) (voutput_min) (112) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s111")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (111) (vl) ((batch_pre - batch )) (A))) (voutput_min) (111) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s110")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (110) (vl) ((batch_pre - batch )) (A))) (voutput_min) (110) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s109")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (109) (vl) ((batch_pre - batch )) (A))) (voutput_min) (109) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s108")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (108) (vl) ((batch_pre - batch )) (A))) (voutput_min) (108) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s107")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (107) (vl) ((batch_pre - batch )) (A))) (voutput_min) (107) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s106")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (106) (vl) ((batch_pre - batch )) (A))) (voutput_min) (106) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s105")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (105) (vl) ((batch_pre - batch )) (A))) (voutput_min) (105) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s104")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (104) (vl) ((batch_pre - batch )) (A))) (voutput_min) (104) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s103")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (103) (vl) ((batch_pre - batch )) (A))) (voutput_min) (103) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s102")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (102) (vl) ((batch_pre - batch )) (A))) (voutput_min) (102) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s101")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (101) (vl) ((batch_pre - batch )) (A))) (voutput_min) (101) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s100")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (100) (vl) ((batch_pre - batch )) (A))) (voutput_min) (100) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s99")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (99) (vl) ((batch_pre - batch )) (A))) (voutput_min) (99) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s98")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (98) (vl) ((batch_pre - batch )) (A))) (voutput_min) (98) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s97")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (97) (vl) ((batch_pre - batch )) (A))) (voutput_min) (97) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s96")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (96) (vl) ((batch_pre - batch )) (A))) (voutput_min) (96) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s95")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (95) (vl) ((batch_pre - batch )) (A))) (voutput_min) (95) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s94")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (94) (vl) ((batch_pre - batch )) (A))) (voutput_min) (94) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s93")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (93) (vl) ((batch_pre - batch )) (A))) (voutput_min) (93) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s92")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (92) (vl) ((batch_pre - batch )) (A))) (voutput_min) (92) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s91")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (91) (vl) ((batch_pre - batch )) (A))) (voutput_min) (91) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s90")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (90) (vl) ((batch_pre - batch )) (A))) (voutput_min) (90) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s89")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (89) (vl) ((batch_pre - batch )) (A))) (voutput_min) (89) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s88")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (88) (vl) ((batch_pre - batch )) (A))) (voutput_min) (88) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s87")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (87) (vl) ((batch_pre - batch )) (A))) (voutput_min) (87) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s86")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (86) (vl) ((batch_pre - batch )) (A))) (voutput_min) (86) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s85")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (85) (vl) ((batch_pre - batch )) (A))) (voutput_min) (85) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s84")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (84) (vl) ((batch_pre - batch )) (A))) (voutput_min) (84) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s83")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (83) (vl) ((batch_pre - batch )) (A))) (voutput_min) (83) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s82")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (82) (vl) ((batch_pre - batch )) (A))) (voutput_min) (82) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s81")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (81) (vl) ((batch_pre - batch )) (A))) (voutput_min) (81) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s80")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (80) (vl) ((batch_pre - batch )) (A))) (voutput_min) (80) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s79")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (79) (vl) ((batch_pre - batch )) (A))) (voutput_min) (79) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s78")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (78) (vl) ((batch_pre - batch )) (A))) (voutput_min) (78) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s77")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (77) (vl) ((batch_pre - batch )) (A))) (voutput_min) (77) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s76")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (76) (vl) ((batch_pre - batch )) (A))) (voutput_min) (76) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s75")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (75) (vl) ((batch_pre - batch )) (A))) (voutput_min) (75) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s74")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (74) (vl) ((batch_pre - batch )) (A))) (voutput_min) (74) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s73")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (73) (vl) ((batch_pre - batch )) (A))) (voutput_min) (73) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s72")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (72) (vl) ((batch_pre - batch )) (A))) (voutput_min) (72) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s71")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (71) (vl) ((batch_pre - batch )) (A))) (voutput_min) (71) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s70")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (70) (vl) ((batch_pre - batch )) (A))) (voutput_min) (70) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s69")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (69) (vl) ((batch_pre - batch )) (A))) (voutput_min) (69) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s68")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (68) (vl) ((batch_pre - batch )) (A))) (voutput_min) (68) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s67")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (67) (vl) ((batch_pre - batch )) (A))) (voutput_min) (67) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s66")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (66) (vl) ((batch_pre - batch )) (A))) (voutput_min) (66) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s65")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (65) (vl) ((batch_pre - batch )) (A))) (voutput_min) (65) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s64")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (64) (vl) ((batch_pre - batch )) (A))) (voutput_min) (64) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s63")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (63) (vl) ((batch_pre - batch )) (A))) (voutput_min) (63) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s62")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (62) (vl) ((batch_pre - batch )) (A))) (voutput_min) (62) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s61")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (61) (vl) ((batch_pre - batch )) (A))) (voutput_min) (61) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s60")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (60) (vl) ((batch_pre - batch )) (A))) (voutput_min) (60) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s59")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (59) (vl) ((batch_pre - batch )) (A))) (voutput_min) (59) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s58")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (58) (vl) ((batch_pre - batch )) (A))) (voutput_min) (58) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s57")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (57) (vl) ((batch_pre - batch )) (A))) (voutput_min) (57) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s56")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (56) (vl) ((batch_pre - batch )) (A))) (voutput_min) (56) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s55")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (55) (vl) ((batch_pre - batch )) (A))) (voutput_min) (55) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s54")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (54) (vl) ((batch_pre - batch )) (A))) (voutput_min) (54) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s53")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (53) (vl) ((batch_pre - batch )) (A))) (voutput_min) (53) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s52")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (52) (vl) ((batch_pre - batch )) (A))) (voutput_min) (52) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s51")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (51) (vl) ((batch_pre - batch )) (A))) (voutput_min) (51) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s50")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (50) (vl) ((batch_pre - batch )) (A))) (voutput_min) (50) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s49")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (49) (vl) ((batch_pre - batch )) (A))) (voutput_min) (49) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s48")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (48) (vl) ((batch_pre - batch )) (A))) (voutput_min) (48) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s47")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (47) (vl) ((batch_pre - batch )) (A))) (voutput_min) (47) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s46")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (46) (vl) ((batch_pre - batch )) (A))) (voutput_min) (46) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s45")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (45) (vl) ((batch_pre - batch )) (A))) (voutput_min) (45) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s44")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (44) (vl) ((batch_pre - batch )) (A))) (voutput_min) (44) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s43")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (43) (vl) ((batch_pre - batch )) (A))) (voutput_min) (43) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s42")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (42) (vl) ((batch_pre - batch )) (A))) (voutput_min) (42) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s41")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (41) (vl) ((batch_pre - batch )) (A))) (voutput_min) (41) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s40")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (40) (vl) ((batch_pre - batch )) (A))) (voutput_min) (40) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s39")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (39) (vl) ((batch_pre - batch )) (A))) (voutput_min) (39) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s38")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (38) (vl) ((batch_pre - batch )) (A))) (voutput_min) (38) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s37")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (37) (vl) ((batch_pre - batch )) (A))) (voutput_min) (37) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s36")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (36) (vl) ((batch_pre - batch )) (A))) (voutput_min) (36) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s35")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (35) (vl) ((batch_pre - batch )) (A))) (voutput_min) (35) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s34")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (34) (vl) ((batch_pre - batch )) (A))) (voutput_min) (34) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s33")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (33) (vl) ((batch_pre - batch )) (A))) (voutput_min) (33) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s32")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (32) (vl) ((batch_pre - batch )) (A))) (voutput_min) (32) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s31")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (31) (vl) ((batch_pre - batch )) (A))) (voutput_min) (31) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s30")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (30) (vl) ((batch_pre - batch )) (A))) (voutput_min) (30) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s29")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (29) (vl) ((batch_pre - batch )) (A))) (voutput_min) (29) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s28")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (28) (vl) ((batch_pre - batch )) (A))) (voutput_min) (28) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s27")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (27) (vl) ((batch_pre - batch )) (A))) (voutput_min) (27) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s26")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (26) (vl) ((batch_pre - batch )) (A))) (voutput_min) (26) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s25")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (25) (vl) ((batch_pre - batch )) (A))) (voutput_min) (25) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s24")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (24) (vl) ((batch_pre - batch )) (A))) (voutput_min) (24) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s23")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (23) (vl) ((batch_pre - batch )) (A))) (voutput_min) (23) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s22")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (22) (vl) ((batch_pre - batch )) (A))) (voutput_min) (22) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s21")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (21) (vl) ((batch_pre - batch )) (A))) (voutput_min) (21) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s20")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (20) (vl) ((batch_pre - batch )) (A))) (voutput_min) (20) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s19")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (19) (vl) ((batch_pre - batch )) (A))) (voutput_min) (19) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s18")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (18) (vl) ((batch_pre - batch )) (A))) (voutput_min) (18) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s17")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (17) (vl) ((batch_pre - batch )) (A))) (voutput_min) (17) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s16")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (16) (vl) ((batch_pre - batch )) (A))) (voutput_min) (16) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s15")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (15) (vl) ((batch_pre - batch )) (A))) (voutput_min) (15) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s14")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (14) (vl) ((batch_pre - batch )) (A))) (voutput_min) (14) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s13")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (13) (vl) ((batch_pre - batch )) (A))) (voutput_min) (13) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s12")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (12) (vl) ((batch_pre - batch )) (A))) (voutput_min) (12) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s11")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (11) (vl) ((batch_pre - batch )) (A))) (voutput_min) (11) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s10")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (10) (vl) ((batch_pre - batch )) (A))) (voutput_min) (10) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s9")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (9) (vl) ((batch_pre - batch )) (A))) (voutput_min) (9) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s8")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (8) (vl) ((batch_pre - batch )) (A))) (voutput_min) (8) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s7")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (7) (vl) ((batch_pre - batch )) (A))) (voutput_min) (7) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s6")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (6) (vl) ((batch_pre - batch )) (A))) (voutput_min) (6) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s5")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (5) (vl) ((batch_pre - batch )) (A))) (voutput_min) (5) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s4")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (4) (vl) ((batch_pre - batch )) (A))) (voutput_min) (4) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (3) (vl) ((batch_pre - batch )) (A))) (voutput_min) (3) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (2) (vl) ((batch_pre - batch )) (A))) (voutput_min) (2) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (1) (vl) ((batch_pre - batch )) (A))) (voutput_min) (1) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s0")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (0) (vl) ((batch_pre - batch )) (A))) (voutput_min) (0) (vl)))
  **  (CharArray.full input_pre (batch_pre + 7 ) A )
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
  **  (CharArray.full output_pre (batch_pre - batch ) (s8_rvv_progress ((batch_pre - batch )) (batch_pre) ((s8_narrow (RawLo))) ((s8_narrow (RawHi))) (A)) )
  **  (CharArray.undef_full output batch )
|--
  “ ((-128) <= voutput_max) ” 
  &&  “ (voutput_max <= 127) ” 
  &&  “ (0 <= vl) ” 
  &&  “ (vl <= 128) ” 
  &&  “ (0 < vl) ” 
  &&  “ (vl <= 128) ” 
  &&  “ (vl <= batch) ” 
  &&  “ (vl <= batch64) ” 
  &&  “ (0 < batch_pre) ” 
  &&  “ (batch_pre <= 18446744073709551608) ” 
  &&  “ (sizeof(CHAR) = 1) ” 
  &&  “ ((Zlength (A)) = (batch_pre + 7 )) ” 
  &&  “ (0 <= batch) ” 
  &&  “ (batch <= batch_pre) ” 
  &&  “ (input = (input_pre + ((batch_pre - batch ) * sizeof(CHAR)))) ” 
  &&  “ (batch > 0) ” 
  &&  “ (output = (output_pre + ((batch_pre - batch ) * sizeof(CHAR)))) ” 
  &&  “ (voutput_min = (s8_narrow (RawLo))) ” 
  &&  “ (voutput_max = (s8_narrow (RawHi))) ” 
  &&  “ ((-128) <= voutput_min) ” 
  &&  “ (voutput_min <= 127) ” 
  &&  “ ((-128) <= voutput_max) ” 
  &&  “ (voutput_max <= 127) ” 
  &&  “ (0 <= (s8_bulk_count (batch_pre))) ” 
  &&  “ ((s8_bulk_count (batch_pre)) <= batch_pre) ” 
  &&  “ (0 <= batch64) ” 
  &&  “ (batch64 = ((s8_bulk_count (batch_pre)) - (batch_pre - batch ) )) ” 
  &&  “ ((batch_pre - batch ) <= (s8_bulk_count (batch_pre))) ”
  &&  ((&(( &( "vacc" ) )->ₛ "s0")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (0) (vl) ((batch_pre - batch )) (A))) (voutput_min) (0) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (1) (vl) ((batch_pre - batch )) (A))) (voutput_min) (1) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (2) (vl) ((batch_pre - batch )) (A))) (voutput_min) (2) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (3) (vl) ((batch_pre - batch )) (A))) (voutput_min) (3) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s4")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (4) (vl) ((batch_pre - batch )) (A))) (voutput_min) (4) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s5")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (5) (vl) ((batch_pre - batch )) (A))) (voutput_min) (5) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s6")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (6) (vl) ((batch_pre - batch )) (A))) (voutput_min) (6) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s7")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (7) (vl) ((batch_pre - batch )) (A))) (voutput_min) (7) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s8")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (8) (vl) ((batch_pre - batch )) (A))) (voutput_min) (8) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s9")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (9) (vl) ((batch_pre - batch )) (A))) (voutput_min) (9) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s10")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (10) (vl) ((batch_pre - batch )) (A))) (voutput_min) (10) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s11")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (11) (vl) ((batch_pre - batch )) (A))) (voutput_min) (11) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s12")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (12) (vl) ((batch_pre - batch )) (A))) (voutput_min) (12) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s13")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (13) (vl) ((batch_pre - batch )) (A))) (voutput_min) (13) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s14")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (14) (vl) ((batch_pre - batch )) (A))) (voutput_min) (14) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s15")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (15) (vl) ((batch_pre - batch )) (A))) (voutput_min) (15) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s16")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (16) (vl) ((batch_pre - batch )) (A))) (voutput_min) (16) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s17")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (17) (vl) ((batch_pre - batch )) (A))) (voutput_min) (17) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s18")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (18) (vl) ((batch_pre - batch )) (A))) (voutput_min) (18) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s19")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (19) (vl) ((batch_pre - batch )) (A))) (voutput_min) (19) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s20")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (20) (vl) ((batch_pre - batch )) (A))) (voutput_min) (20) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s21")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (21) (vl) ((batch_pre - batch )) (A))) (voutput_min) (21) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s22")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (22) (vl) ((batch_pre - batch )) (A))) (voutput_min) (22) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s23")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (23) (vl) ((batch_pre - batch )) (A))) (voutput_min) (23) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s24")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (24) (vl) ((batch_pre - batch )) (A))) (voutput_min) (24) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s25")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (25) (vl) ((batch_pre - batch )) (A))) (voutput_min) (25) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s26")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (26) (vl) ((batch_pre - batch )) (A))) (voutput_min) (26) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s27")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (27) (vl) ((batch_pre - batch )) (A))) (voutput_min) (27) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s28")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (28) (vl) ((batch_pre - batch )) (A))) (voutput_min) (28) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s29")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (29) (vl) ((batch_pre - batch )) (A))) (voutput_min) (29) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s30")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (30) (vl) ((batch_pre - batch )) (A))) (voutput_min) (30) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s31")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (31) (vl) ((batch_pre - batch )) (A))) (voutput_min) (31) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s32")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (32) (vl) ((batch_pre - batch )) (A))) (voutput_min) (32) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s33")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (33) (vl) ((batch_pre - batch )) (A))) (voutput_min) (33) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s34")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (34) (vl) ((batch_pre - batch )) (A))) (voutput_min) (34) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s35")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (35) (vl) ((batch_pre - batch )) (A))) (voutput_min) (35) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s36")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (36) (vl) ((batch_pre - batch )) (A))) (voutput_min) (36) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s37")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (37) (vl) ((batch_pre - batch )) (A))) (voutput_min) (37) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s38")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (38) (vl) ((batch_pre - batch )) (A))) (voutput_min) (38) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s39")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (39) (vl) ((batch_pre - batch )) (A))) (voutput_min) (39) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s40")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (40) (vl) ((batch_pre - batch )) (A))) (voutput_min) (40) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s41")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (41) (vl) ((batch_pre - batch )) (A))) (voutput_min) (41) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s42")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (42) (vl) ((batch_pre - batch )) (A))) (voutput_min) (42) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s43")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (43) (vl) ((batch_pre - batch )) (A))) (voutput_min) (43) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s44")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (44) (vl) ((batch_pre - batch )) (A))) (voutput_min) (44) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s45")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (45) (vl) ((batch_pre - batch )) (A))) (voutput_min) (45) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s46")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (46) (vl) ((batch_pre - batch )) (A))) (voutput_min) (46) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s47")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (47) (vl) ((batch_pre - batch )) (A))) (voutput_min) (47) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s48")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (48) (vl) ((batch_pre - batch )) (A))) (voutput_min) (48) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s49")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (49) (vl) ((batch_pre - batch )) (A))) (voutput_min) (49) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s50")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (50) (vl) ((batch_pre - batch )) (A))) (voutput_min) (50) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s51")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (51) (vl) ((batch_pre - batch )) (A))) (voutput_min) (51) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s52")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (52) (vl) ((batch_pre - batch )) (A))) (voutput_min) (52) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s53")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (53) (vl) ((batch_pre - batch )) (A))) (voutput_min) (53) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s54")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (54) (vl) ((batch_pre - batch )) (A))) (voutput_min) (54) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s55")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (55) (vl) ((batch_pre - batch )) (A))) (voutput_min) (55) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s56")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (56) (vl) ((batch_pre - batch )) (A))) (voutput_min) (56) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s57")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (57) (vl) ((batch_pre - batch )) (A))) (voutput_min) (57) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s58")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (58) (vl) ((batch_pre - batch )) (A))) (voutput_min) (58) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s59")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (59) (vl) ((batch_pre - batch )) (A))) (voutput_min) (59) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s60")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (60) (vl) ((batch_pre - batch )) (A))) (voutput_min) (60) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s61")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (61) (vl) ((batch_pre - batch )) (A))) (voutput_min) (61) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s62")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (62) (vl) ((batch_pre - batch )) (A))) (voutput_min) (62) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s63")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (63) (vl) ((batch_pre - batch )) (A))) (voutput_min) (63) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s64")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (64) (vl) ((batch_pre - batch )) (A))) (voutput_min) (64) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s65")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (65) (vl) ((batch_pre - batch )) (A))) (voutput_min) (65) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s66")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (66) (vl) ((batch_pre - batch )) (A))) (voutput_min) (66) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s67")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (67) (vl) ((batch_pre - batch )) (A))) (voutput_min) (67) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s68")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (68) (vl) ((batch_pre - batch )) (A))) (voutput_min) (68) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s69")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (69) (vl) ((batch_pre - batch )) (A))) (voutput_min) (69) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s70")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (70) (vl) ((batch_pre - batch )) (A))) (voutput_min) (70) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s71")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (71) (vl) ((batch_pre - batch )) (A))) (voutput_min) (71) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s72")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (72) (vl) ((batch_pre - batch )) (A))) (voutput_min) (72) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s73")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (73) (vl) ((batch_pre - batch )) (A))) (voutput_min) (73) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s74")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (74) (vl) ((batch_pre - batch )) (A))) (voutput_min) (74) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s75")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (75) (vl) ((batch_pre - batch )) (A))) (voutput_min) (75) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s76")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (76) (vl) ((batch_pre - batch )) (A))) (voutput_min) (76) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s77")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (77) (vl) ((batch_pre - batch )) (A))) (voutput_min) (77) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s78")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (78) (vl) ((batch_pre - batch )) (A))) (voutput_min) (78) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s79")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (79) (vl) ((batch_pre - batch )) (A))) (voutput_min) (79) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s80")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (80) (vl) ((batch_pre - batch )) (A))) (voutput_min) (80) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s81")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (81) (vl) ((batch_pre - batch )) (A))) (voutput_min) (81) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s82")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (82) (vl) ((batch_pre - batch )) (A))) (voutput_min) (82) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s83")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (83) (vl) ((batch_pre - batch )) (A))) (voutput_min) (83) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s84")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (84) (vl) ((batch_pre - batch )) (A))) (voutput_min) (84) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s85")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (85) (vl) ((batch_pre - batch )) (A))) (voutput_min) (85) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s86")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (86) (vl) ((batch_pre - batch )) (A))) (voutput_min) (86) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s87")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (87) (vl) ((batch_pre - batch )) (A))) (voutput_min) (87) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s88")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (88) (vl) ((batch_pre - batch )) (A))) (voutput_min) (88) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s89")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (89) (vl) ((batch_pre - batch )) (A))) (voutput_min) (89) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s90")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (90) (vl) ((batch_pre - batch )) (A))) (voutput_min) (90) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s91")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (91) (vl) ((batch_pre - batch )) (A))) (voutput_min) (91) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s92")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (92) (vl) ((batch_pre - batch )) (A))) (voutput_min) (92) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s93")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (93) (vl) ((batch_pre - batch )) (A))) (voutput_min) (93) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s94")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (94) (vl) ((batch_pre - batch )) (A))) (voutput_min) (94) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s95")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (95) (vl) ((batch_pre - batch )) (A))) (voutput_min) (95) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s96")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (96) (vl) ((batch_pre - batch )) (A))) (voutput_min) (96) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s97")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (97) (vl) ((batch_pre - batch )) (A))) (voutput_min) (97) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s98")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (98) (vl) ((batch_pre - batch )) (A))) (voutput_min) (98) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s99")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (99) (vl) ((batch_pre - batch )) (A))) (voutput_min) (99) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s100")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (100) (vl) ((batch_pre - batch )) (A))) (voutput_min) (100) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s101")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (101) (vl) ((batch_pre - batch )) (A))) (voutput_min) (101) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s102")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (102) (vl) ((batch_pre - batch )) (A))) (voutput_min) (102) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s103")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (103) (vl) ((batch_pre - batch )) (A))) (voutput_min) (103) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s104")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (104) (vl) ((batch_pre - batch )) (A))) (voutput_min) (104) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s105")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (105) (vl) ((batch_pre - batch )) (A))) (voutput_min) (105) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s106")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (106) (vl) ((batch_pre - batch )) (A))) (voutput_min) (106) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s107")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (107) (vl) ((batch_pre - batch )) (A))) (voutput_min) (107) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s108")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (108) (vl) ((batch_pre - batch )) (A))) (voutput_min) (108) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s109")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (109) (vl) ((batch_pre - batch )) (A))) (voutput_min) (109) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s110")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (110) (vl) ((batch_pre - batch )) (A))) (voutput_min) (110) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s111")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (111) (vl) ((batch_pre - batch )) (A))) (voutput_min) (111) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s112")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (112) (vl) ((batch_pre - batch )) (A))) (voutput_min) (112) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s113")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (113) (vl) ((batch_pre - batch )) (A))) (voutput_min) (113) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s114")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (114) (vl) ((batch_pre - batch )) (A))) (voutput_min) (114) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s115")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (115) (vl) ((batch_pre - batch )) (A))) (voutput_min) (115) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s116")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (116) (vl) ((batch_pre - batch )) (A))) (voutput_min) (116) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s117")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (117) (vl) ((batch_pre - batch )) (A))) (voutput_min) (117) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s118")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (118) (vl) ((batch_pre - batch )) (A))) (voutput_min) (118) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s119")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (119) (vl) ((batch_pre - batch )) (A))) (voutput_min) (119) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s120")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (120) (vl) ((batch_pre - batch )) (A))) (voutput_min) (120) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s121")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (121) (vl) ((batch_pre - batch )) (A))) (voutput_min) (121) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s122")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (122) (vl) ((batch_pre - batch )) (A))) (voutput_min) (122) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s123")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (123) (vl) ((batch_pre - batch )) (A))) (voutput_min) (123) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s124")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (124) (vl) ((batch_pre - batch )) (A))) (voutput_min) (124) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s125")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (125) (vl) ((batch_pre - batch )) (A))) (voutput_min) (125) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s126")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (126) (vl) ((batch_pre - batch )) (A))) (voutput_min) (126) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s127")) # Char  |-> (s8_rvv_max_lane ((s8_read_lane (127) (vl) ((batch_pre - batch )) (A))) (voutput_min) (127) (vl)))
  **  (CharArray.full input_pre (batch_pre + 7 ) A )
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
  **  (CharArray.full output_pre (batch_pre - batch ) (s8_rvv_progress ((batch_pre - batch )) (batch_pre) ((s8_narrow (RawLo))) ((s8_narrow (RawHi))) (A)) )
  **  (CharArray.undef_full output batch )
.

Definition test_rvv_partial_solve_wit_10 := test_rvv_partial_solve_wit_10_pure -> test_rvv_partial_solve_wit_10_aux.

Definition test_rvv_partial_solve_wit_11 := 
forall (params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (RawHi: Z) (RawLo: Z) (A: (@list Z)) (vl: Z) (batch: Z) (batch64: Z) (input: Z) (output: Z) (voutput_min: Z) (voutput_max: Z) (retval: Z) (PreH1 : (0 < vl)) (PreH2 : (vl <= 128)) (PreH3 : (vl <= batch)) (PreH4 : (vl <= batch64)) (PreH5 : (0 < batch_pre)) (PreH6 : (batch_pre <= 18446744073709551608)) (PreH7 : (sizeof(CHAR) = 1)) (PreH8 : ((Zlength (A)) = (batch_pre + 7 ))) (PreH9 : (0 <= batch)) (PreH10 : (batch <= batch_pre)) (PreH11 : (input = (input_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH12 : (batch > 0)) (PreH13 : (output = (output_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH14 : (voutput_min = (s8_narrow (RawLo)))) (PreH15 : (voutput_max = (s8_narrow (RawHi)))) (PreH16 : ((-128) <= voutput_min)) (PreH17 : (voutput_min <= 127)) (PreH18 : ((-128) <= voutput_max)) (PreH19 : (voutput_max <= 127)) (PreH20 : (0 <= (s8_bulk_count (batch_pre)))) (PreH21 : ((s8_bulk_count (batch_pre)) <= batch_pre)) (PreH22 : (0 <= batch64)) (PreH23 : (batch64 = ((s8_bulk_count (batch_pre)) - (batch_pre - batch ) ))) (PreH24 : ((batch_pre - batch ) <= (s8_bulk_count (batch_pre)))) ,
  (UndefStructPredvint8m8_t ( &( "vacc" ) ) )
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s0")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (0) (vl) ((batch_pre - batch )) (A))) (voutput_min) (0) (vl))) (voutput_max) (0) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s1")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (1) (vl) ((batch_pre - batch )) (A))) (voutput_min) (1) (vl))) (voutput_max) (1) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s2")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (2) (vl) ((batch_pre - batch )) (A))) (voutput_min) (2) (vl))) (voutput_max) (2) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s3")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (3) (vl) ((batch_pre - batch )) (A))) (voutput_min) (3) (vl))) (voutput_max) (3) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s4")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (4) (vl) ((batch_pre - batch )) (A))) (voutput_min) (4) (vl))) (voutput_max) (4) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s5")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (5) (vl) ((batch_pre - batch )) (A))) (voutput_min) (5) (vl))) (voutput_max) (5) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s6")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (6) (vl) ((batch_pre - batch )) (A))) (voutput_min) (6) (vl))) (voutput_max) (6) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s7")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (7) (vl) ((batch_pre - batch )) (A))) (voutput_min) (7) (vl))) (voutput_max) (7) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s8")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (8) (vl) ((batch_pre - batch )) (A))) (voutput_min) (8) (vl))) (voutput_max) (8) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s9")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (9) (vl) ((batch_pre - batch )) (A))) (voutput_min) (9) (vl))) (voutput_max) (9) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s10")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (10) (vl) ((batch_pre - batch )) (A))) (voutput_min) (10) (vl))) (voutput_max) (10) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s11")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (11) (vl) ((batch_pre - batch )) (A))) (voutput_min) (11) (vl))) (voutput_max) (11) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s12")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (12) (vl) ((batch_pre - batch )) (A))) (voutput_min) (12) (vl))) (voutput_max) (12) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s13")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (13) (vl) ((batch_pre - batch )) (A))) (voutput_min) (13) (vl))) (voutput_max) (13) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s14")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (14) (vl) ((batch_pre - batch )) (A))) (voutput_min) (14) (vl))) (voutput_max) (14) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s15")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (15) (vl) ((batch_pre - batch )) (A))) (voutput_min) (15) (vl))) (voutput_max) (15) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s16")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (16) (vl) ((batch_pre - batch )) (A))) (voutput_min) (16) (vl))) (voutput_max) (16) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s17")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (17) (vl) ((batch_pre - batch )) (A))) (voutput_min) (17) (vl))) (voutput_max) (17) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s18")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (18) (vl) ((batch_pre - batch )) (A))) (voutput_min) (18) (vl))) (voutput_max) (18) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s19")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (19) (vl) ((batch_pre - batch )) (A))) (voutput_min) (19) (vl))) (voutput_max) (19) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s20")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (20) (vl) ((batch_pre - batch )) (A))) (voutput_min) (20) (vl))) (voutput_max) (20) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s21")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (21) (vl) ((batch_pre - batch )) (A))) (voutput_min) (21) (vl))) (voutput_max) (21) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s22")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (22) (vl) ((batch_pre - batch )) (A))) (voutput_min) (22) (vl))) (voutput_max) (22) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s23")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (23) (vl) ((batch_pre - batch )) (A))) (voutput_min) (23) (vl))) (voutput_max) (23) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s24")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (24) (vl) ((batch_pre - batch )) (A))) (voutput_min) (24) (vl))) (voutput_max) (24) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s25")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (25) (vl) ((batch_pre - batch )) (A))) (voutput_min) (25) (vl))) (voutput_max) (25) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s26")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (26) (vl) ((batch_pre - batch )) (A))) (voutput_min) (26) (vl))) (voutput_max) (26) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s27")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (27) (vl) ((batch_pre - batch )) (A))) (voutput_min) (27) (vl))) (voutput_max) (27) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s28")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (28) (vl) ((batch_pre - batch )) (A))) (voutput_min) (28) (vl))) (voutput_max) (28) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s29")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (29) (vl) ((batch_pre - batch )) (A))) (voutput_min) (29) (vl))) (voutput_max) (29) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s30")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (30) (vl) ((batch_pre - batch )) (A))) (voutput_min) (30) (vl))) (voutput_max) (30) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s31")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (31) (vl) ((batch_pre - batch )) (A))) (voutput_min) (31) (vl))) (voutput_max) (31) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s32")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (32) (vl) ((batch_pre - batch )) (A))) (voutput_min) (32) (vl))) (voutput_max) (32) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s33")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (33) (vl) ((batch_pre - batch )) (A))) (voutput_min) (33) (vl))) (voutput_max) (33) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s34")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (34) (vl) ((batch_pre - batch )) (A))) (voutput_min) (34) (vl))) (voutput_max) (34) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s35")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (35) (vl) ((batch_pre - batch )) (A))) (voutput_min) (35) (vl))) (voutput_max) (35) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s36")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (36) (vl) ((batch_pre - batch )) (A))) (voutput_min) (36) (vl))) (voutput_max) (36) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s37")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (37) (vl) ((batch_pre - batch )) (A))) (voutput_min) (37) (vl))) (voutput_max) (37) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s38")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (38) (vl) ((batch_pre - batch )) (A))) (voutput_min) (38) (vl))) (voutput_max) (38) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s39")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (39) (vl) ((batch_pre - batch )) (A))) (voutput_min) (39) (vl))) (voutput_max) (39) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s40")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (40) (vl) ((batch_pre - batch )) (A))) (voutput_min) (40) (vl))) (voutput_max) (40) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s41")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (41) (vl) ((batch_pre - batch )) (A))) (voutput_min) (41) (vl))) (voutput_max) (41) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s42")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (42) (vl) ((batch_pre - batch )) (A))) (voutput_min) (42) (vl))) (voutput_max) (42) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s43")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (43) (vl) ((batch_pre - batch )) (A))) (voutput_min) (43) (vl))) (voutput_max) (43) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s44")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (44) (vl) ((batch_pre - batch )) (A))) (voutput_min) (44) (vl))) (voutput_max) (44) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s45")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (45) (vl) ((batch_pre - batch )) (A))) (voutput_min) (45) (vl))) (voutput_max) (45) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s46")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (46) (vl) ((batch_pre - batch )) (A))) (voutput_min) (46) (vl))) (voutput_max) (46) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s47")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (47) (vl) ((batch_pre - batch )) (A))) (voutput_min) (47) (vl))) (voutput_max) (47) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s48")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (48) (vl) ((batch_pre - batch )) (A))) (voutput_min) (48) (vl))) (voutput_max) (48) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s49")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (49) (vl) ((batch_pre - batch )) (A))) (voutput_min) (49) (vl))) (voutput_max) (49) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s50")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (50) (vl) ((batch_pre - batch )) (A))) (voutput_min) (50) (vl))) (voutput_max) (50) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s51")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (51) (vl) ((batch_pre - batch )) (A))) (voutput_min) (51) (vl))) (voutput_max) (51) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s52")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (52) (vl) ((batch_pre - batch )) (A))) (voutput_min) (52) (vl))) (voutput_max) (52) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s53")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (53) (vl) ((batch_pre - batch )) (A))) (voutput_min) (53) (vl))) (voutput_max) (53) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s54")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (54) (vl) ((batch_pre - batch )) (A))) (voutput_min) (54) (vl))) (voutput_max) (54) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s55")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (55) (vl) ((batch_pre - batch )) (A))) (voutput_min) (55) (vl))) (voutput_max) (55) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s56")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (56) (vl) ((batch_pre - batch )) (A))) (voutput_min) (56) (vl))) (voutput_max) (56) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s57")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (57) (vl) ((batch_pre - batch )) (A))) (voutput_min) (57) (vl))) (voutput_max) (57) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s58")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (58) (vl) ((batch_pre - batch )) (A))) (voutput_min) (58) (vl))) (voutput_max) (58) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s59")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (59) (vl) ((batch_pre - batch )) (A))) (voutput_min) (59) (vl))) (voutput_max) (59) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s60")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (60) (vl) ((batch_pre - batch )) (A))) (voutput_min) (60) (vl))) (voutput_max) (60) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s61")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (61) (vl) ((batch_pre - batch )) (A))) (voutput_min) (61) (vl))) (voutput_max) (61) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s62")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (62) (vl) ((batch_pre - batch )) (A))) (voutput_min) (62) (vl))) (voutput_max) (62) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s63")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (63) (vl) ((batch_pre - batch )) (A))) (voutput_min) (63) (vl))) (voutput_max) (63) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s64")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (64) (vl) ((batch_pre - batch )) (A))) (voutput_min) (64) (vl))) (voutput_max) (64) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s65")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (65) (vl) ((batch_pre - batch )) (A))) (voutput_min) (65) (vl))) (voutput_max) (65) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s66")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (66) (vl) ((batch_pre - batch )) (A))) (voutput_min) (66) (vl))) (voutput_max) (66) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s67")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (67) (vl) ((batch_pre - batch )) (A))) (voutput_min) (67) (vl))) (voutput_max) (67) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s68")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (68) (vl) ((batch_pre - batch )) (A))) (voutput_min) (68) (vl))) (voutput_max) (68) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s69")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (69) (vl) ((batch_pre - batch )) (A))) (voutput_min) (69) (vl))) (voutput_max) (69) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s70")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (70) (vl) ((batch_pre - batch )) (A))) (voutput_min) (70) (vl))) (voutput_max) (70) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s71")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (71) (vl) ((batch_pre - batch )) (A))) (voutput_min) (71) (vl))) (voutput_max) (71) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s72")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (72) (vl) ((batch_pre - batch )) (A))) (voutput_min) (72) (vl))) (voutput_max) (72) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s73")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (73) (vl) ((batch_pre - batch )) (A))) (voutput_min) (73) (vl))) (voutput_max) (73) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s74")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (74) (vl) ((batch_pre - batch )) (A))) (voutput_min) (74) (vl))) (voutput_max) (74) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s75")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (75) (vl) ((batch_pre - batch )) (A))) (voutput_min) (75) (vl))) (voutput_max) (75) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s76")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (76) (vl) ((batch_pre - batch )) (A))) (voutput_min) (76) (vl))) (voutput_max) (76) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s77")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (77) (vl) ((batch_pre - batch )) (A))) (voutput_min) (77) (vl))) (voutput_max) (77) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s78")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (78) (vl) ((batch_pre - batch )) (A))) (voutput_min) (78) (vl))) (voutput_max) (78) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s79")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (79) (vl) ((batch_pre - batch )) (A))) (voutput_min) (79) (vl))) (voutput_max) (79) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s80")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (80) (vl) ((batch_pre - batch )) (A))) (voutput_min) (80) (vl))) (voutput_max) (80) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s81")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (81) (vl) ((batch_pre - batch )) (A))) (voutput_min) (81) (vl))) (voutput_max) (81) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s82")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (82) (vl) ((batch_pre - batch )) (A))) (voutput_min) (82) (vl))) (voutput_max) (82) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s83")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (83) (vl) ((batch_pre - batch )) (A))) (voutput_min) (83) (vl))) (voutput_max) (83) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s84")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (84) (vl) ((batch_pre - batch )) (A))) (voutput_min) (84) (vl))) (voutput_max) (84) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s85")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (85) (vl) ((batch_pre - batch )) (A))) (voutput_min) (85) (vl))) (voutput_max) (85) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s86")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (86) (vl) ((batch_pre - batch )) (A))) (voutput_min) (86) (vl))) (voutput_max) (86) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s87")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (87) (vl) ((batch_pre - batch )) (A))) (voutput_min) (87) (vl))) (voutput_max) (87) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s88")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (88) (vl) ((batch_pre - batch )) (A))) (voutput_min) (88) (vl))) (voutput_max) (88) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s89")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (89) (vl) ((batch_pre - batch )) (A))) (voutput_min) (89) (vl))) (voutput_max) (89) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s90")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (90) (vl) ((batch_pre - batch )) (A))) (voutput_min) (90) (vl))) (voutput_max) (90) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s91")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (91) (vl) ((batch_pre - batch )) (A))) (voutput_min) (91) (vl))) (voutput_max) (91) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s92")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (92) (vl) ((batch_pre - batch )) (A))) (voutput_min) (92) (vl))) (voutput_max) (92) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s93")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (93) (vl) ((batch_pre - batch )) (A))) (voutput_min) (93) (vl))) (voutput_max) (93) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s94")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (94) (vl) ((batch_pre - batch )) (A))) (voutput_min) (94) (vl))) (voutput_max) (94) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s95")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (95) (vl) ((batch_pre - batch )) (A))) (voutput_min) (95) (vl))) (voutput_max) (95) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s96")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (96) (vl) ((batch_pre - batch )) (A))) (voutput_min) (96) (vl))) (voutput_max) (96) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s97")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (97) (vl) ((batch_pre - batch )) (A))) (voutput_min) (97) (vl))) (voutput_max) (97) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s98")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (98) (vl) ((batch_pre - batch )) (A))) (voutput_min) (98) (vl))) (voutput_max) (98) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s99")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (99) (vl) ((batch_pre - batch )) (A))) (voutput_min) (99) (vl))) (voutput_max) (99) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s100")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (100) (vl) ((batch_pre - batch )) (A))) (voutput_min) (100) (vl))) (voutput_max) (100) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s101")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (101) (vl) ((batch_pre - batch )) (A))) (voutput_min) (101) (vl))) (voutput_max) (101) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s102")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (102) (vl) ((batch_pre - batch )) (A))) (voutput_min) (102) (vl))) (voutput_max) (102) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s103")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (103) (vl) ((batch_pre - batch )) (A))) (voutput_min) (103) (vl))) (voutput_max) (103) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s104")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (104) (vl) ((batch_pre - batch )) (A))) (voutput_min) (104) (vl))) (voutput_max) (104) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s105")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (105) (vl) ((batch_pre - batch )) (A))) (voutput_min) (105) (vl))) (voutput_max) (105) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s106")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (106) (vl) ((batch_pre - batch )) (A))) (voutput_min) (106) (vl))) (voutput_max) (106) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s107")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (107) (vl) ((batch_pre - batch )) (A))) (voutput_min) (107) (vl))) (voutput_max) (107) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s108")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (108) (vl) ((batch_pre - batch )) (A))) (voutput_min) (108) (vl))) (voutput_max) (108) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s109")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (109) (vl) ((batch_pre - batch )) (A))) (voutput_min) (109) (vl))) (voutput_max) (109) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s110")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (110) (vl) ((batch_pre - batch )) (A))) (voutput_min) (110) (vl))) (voutput_max) (110) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s111")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (111) (vl) ((batch_pre - batch )) (A))) (voutput_min) (111) (vl))) (voutput_max) (111) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s112")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (112) (vl) ((batch_pre - batch )) (A))) (voutput_min) (112) (vl))) (voutput_max) (112) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s113")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (113) (vl) ((batch_pre - batch )) (A))) (voutput_min) (113) (vl))) (voutput_max) (113) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s114")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (114) (vl) ((batch_pre - batch )) (A))) (voutput_min) (114) (vl))) (voutput_max) (114) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s115")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (115) (vl) ((batch_pre - batch )) (A))) (voutput_min) (115) (vl))) (voutput_max) (115) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s116")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (116) (vl) ((batch_pre - batch )) (A))) (voutput_min) (116) (vl))) (voutput_max) (116) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s117")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (117) (vl) ((batch_pre - batch )) (A))) (voutput_min) (117) (vl))) (voutput_max) (117) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s118")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (118) (vl) ((batch_pre - batch )) (A))) (voutput_min) (118) (vl))) (voutput_max) (118) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s119")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (119) (vl) ((batch_pre - batch )) (A))) (voutput_min) (119) (vl))) (voutput_max) (119) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s120")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (120) (vl) ((batch_pre - batch )) (A))) (voutput_min) (120) (vl))) (voutput_max) (120) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s121")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (121) (vl) ((batch_pre - batch )) (A))) (voutput_min) (121) (vl))) (voutput_max) (121) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s122")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (122) (vl) ((batch_pre - batch )) (A))) (voutput_min) (122) (vl))) (voutput_max) (122) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s123")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (123) (vl) ((batch_pre - batch )) (A))) (voutput_min) (123) (vl))) (voutput_max) (123) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s124")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (124) (vl) ((batch_pre - batch )) (A))) (voutput_min) (124) (vl))) (voutput_max) (124) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s125")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (125) (vl) ((batch_pre - batch )) (A))) (voutput_min) (125) (vl))) (voutput_max) (125) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s126")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (126) (vl) ((batch_pre - batch )) (A))) (voutput_min) (126) (vl))) (voutput_max) (126) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s127")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (127) (vl) ((batch_pre - batch )) (A))) (voutput_min) (127) (vl))) (voutput_max) (127) (vl)))
  **  (CharArray.full input_pre (batch_pre + 7 ) A )
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
  **  (CharArray.full output_pre (batch_pre - batch ) (s8_rvv_progress ((batch_pre - batch )) (batch_pre) ((s8_narrow (RawLo))) ((s8_narrow (RawHi))) (A)) )
  **  (CharArray.undef_full output batch )
|--
  “ (0 < vl) ” 
  &&  “ (vl <= 128) ” 
  &&  “ (vl <= batch) ” 
  &&  “ (vl <= batch64) ” 
  &&  “ (0 < batch_pre) ” 
  &&  “ (batch_pre <= 18446744073709551608) ” 
  &&  “ (sizeof(CHAR) = 1) ” 
  &&  “ ((Zlength (A)) = (batch_pre + 7 )) ” 
  &&  “ (0 <= batch) ” 
  &&  “ (batch <= batch_pre) ” 
  &&  “ (input = (input_pre + ((batch_pre - batch ) * sizeof(CHAR)))) ” 
  &&  “ (batch > 0) ” 
  &&  “ (output = (output_pre + ((batch_pre - batch ) * sizeof(CHAR)))) ” 
  &&  “ (voutput_min = (s8_narrow (RawLo))) ” 
  &&  “ (voutput_max = (s8_narrow (RawHi))) ” 
  &&  “ ((-128) <= voutput_min) ” 
  &&  “ (voutput_min <= 127) ” 
  &&  “ ((-128) <= voutput_max) ” 
  &&  “ (voutput_max <= 127) ” 
  &&  “ (0 <= (s8_bulk_count (batch_pre))) ” 
  &&  “ ((s8_bulk_count (batch_pre)) <= batch_pre) ” 
  &&  “ (0 <= batch64) ” 
  &&  “ (batch64 = ((s8_bulk_count (batch_pre)) - (batch_pre - batch ) )) ” 
  &&  “ ((batch_pre - batch ) <= (s8_bulk_count (batch_pre))) ”
  &&  ((&(( &( "vacc" ) )->ₛ "s127")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s127")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (127) (vl) ((batch_pre - batch )) (A))) (voutput_min) (127) (vl))) (voutput_max) (127) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s126")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s126")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (126) (vl) ((batch_pre - batch )) (A))) (voutput_min) (126) (vl))) (voutput_max) (126) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s125")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s125")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (125) (vl) ((batch_pre - batch )) (A))) (voutput_min) (125) (vl))) (voutput_max) (125) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s124")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s124")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (124) (vl) ((batch_pre - batch )) (A))) (voutput_min) (124) (vl))) (voutput_max) (124) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s123")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s123")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (123) (vl) ((batch_pre - batch )) (A))) (voutput_min) (123) (vl))) (voutput_max) (123) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s122")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s122")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (122) (vl) ((batch_pre - batch )) (A))) (voutput_min) (122) (vl))) (voutput_max) (122) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s121")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s121")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (121) (vl) ((batch_pre - batch )) (A))) (voutput_min) (121) (vl))) (voutput_max) (121) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s120")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s120")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (120) (vl) ((batch_pre - batch )) (A))) (voutput_min) (120) (vl))) (voutput_max) (120) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s119")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s119")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (119) (vl) ((batch_pre - batch )) (A))) (voutput_min) (119) (vl))) (voutput_max) (119) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s118")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s118")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (118) (vl) ((batch_pre - batch )) (A))) (voutput_min) (118) (vl))) (voutput_max) (118) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s117")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s117")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (117) (vl) ((batch_pre - batch )) (A))) (voutput_min) (117) (vl))) (voutput_max) (117) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s116")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s116")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (116) (vl) ((batch_pre - batch )) (A))) (voutput_min) (116) (vl))) (voutput_max) (116) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s115")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s115")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (115) (vl) ((batch_pre - batch )) (A))) (voutput_min) (115) (vl))) (voutput_max) (115) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s114")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s114")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (114) (vl) ((batch_pre - batch )) (A))) (voutput_min) (114) (vl))) (voutput_max) (114) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s113")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s113")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (113) (vl) ((batch_pre - batch )) (A))) (voutput_min) (113) (vl))) (voutput_max) (113) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s112")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s112")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (112) (vl) ((batch_pre - batch )) (A))) (voutput_min) (112) (vl))) (voutput_max) (112) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s111")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s111")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (111) (vl) ((batch_pre - batch )) (A))) (voutput_min) (111) (vl))) (voutput_max) (111) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s110")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s110")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (110) (vl) ((batch_pre - batch )) (A))) (voutput_min) (110) (vl))) (voutput_max) (110) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s109")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s109")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (109) (vl) ((batch_pre - batch )) (A))) (voutput_min) (109) (vl))) (voutput_max) (109) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s108")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s108")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (108) (vl) ((batch_pre - batch )) (A))) (voutput_min) (108) (vl))) (voutput_max) (108) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s107")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s107")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (107) (vl) ((batch_pre - batch )) (A))) (voutput_min) (107) (vl))) (voutput_max) (107) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s106")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s106")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (106) (vl) ((batch_pre - batch )) (A))) (voutput_min) (106) (vl))) (voutput_max) (106) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s105")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s105")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (105) (vl) ((batch_pre - batch )) (A))) (voutput_min) (105) (vl))) (voutput_max) (105) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s104")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s104")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (104) (vl) ((batch_pre - batch )) (A))) (voutput_min) (104) (vl))) (voutput_max) (104) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s103")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s103")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (103) (vl) ((batch_pre - batch )) (A))) (voutput_min) (103) (vl))) (voutput_max) (103) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s102")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s102")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (102) (vl) ((batch_pre - batch )) (A))) (voutput_min) (102) (vl))) (voutput_max) (102) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s101")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s101")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (101) (vl) ((batch_pre - batch )) (A))) (voutput_min) (101) (vl))) (voutput_max) (101) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s100")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s100")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (100) (vl) ((batch_pre - batch )) (A))) (voutput_min) (100) (vl))) (voutput_max) (100) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s99")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s99")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (99) (vl) ((batch_pre - batch )) (A))) (voutput_min) (99) (vl))) (voutput_max) (99) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s98")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s98")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (98) (vl) ((batch_pre - batch )) (A))) (voutput_min) (98) (vl))) (voutput_max) (98) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s97")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s97")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (97) (vl) ((batch_pre - batch )) (A))) (voutput_min) (97) (vl))) (voutput_max) (97) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s96")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s96")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (96) (vl) ((batch_pre - batch )) (A))) (voutput_min) (96) (vl))) (voutput_max) (96) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s95")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s95")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (95) (vl) ((batch_pre - batch )) (A))) (voutput_min) (95) (vl))) (voutput_max) (95) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s94")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s94")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (94) (vl) ((batch_pre - batch )) (A))) (voutput_min) (94) (vl))) (voutput_max) (94) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s93")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s93")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (93) (vl) ((batch_pre - batch )) (A))) (voutput_min) (93) (vl))) (voutput_max) (93) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s92")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s92")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (92) (vl) ((batch_pre - batch )) (A))) (voutput_min) (92) (vl))) (voutput_max) (92) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s91")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s91")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (91) (vl) ((batch_pre - batch )) (A))) (voutput_min) (91) (vl))) (voutput_max) (91) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s90")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s90")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (90) (vl) ((batch_pre - batch )) (A))) (voutput_min) (90) (vl))) (voutput_max) (90) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s89")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s89")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (89) (vl) ((batch_pre - batch )) (A))) (voutput_min) (89) (vl))) (voutput_max) (89) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s88")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s88")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (88) (vl) ((batch_pre - batch )) (A))) (voutput_min) (88) (vl))) (voutput_max) (88) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s87")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s87")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (87) (vl) ((batch_pre - batch )) (A))) (voutput_min) (87) (vl))) (voutput_max) (87) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s86")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s86")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (86) (vl) ((batch_pre - batch )) (A))) (voutput_min) (86) (vl))) (voutput_max) (86) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s85")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s85")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (85) (vl) ((batch_pre - batch )) (A))) (voutput_min) (85) (vl))) (voutput_max) (85) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s84")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s84")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (84) (vl) ((batch_pre - batch )) (A))) (voutput_min) (84) (vl))) (voutput_max) (84) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s83")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s83")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (83) (vl) ((batch_pre - batch )) (A))) (voutput_min) (83) (vl))) (voutput_max) (83) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s82")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s82")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (82) (vl) ((batch_pre - batch )) (A))) (voutput_min) (82) (vl))) (voutput_max) (82) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s81")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s81")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (81) (vl) ((batch_pre - batch )) (A))) (voutput_min) (81) (vl))) (voutput_max) (81) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s80")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s80")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (80) (vl) ((batch_pre - batch )) (A))) (voutput_min) (80) (vl))) (voutput_max) (80) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s79")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s79")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (79) (vl) ((batch_pre - batch )) (A))) (voutput_min) (79) (vl))) (voutput_max) (79) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s78")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s78")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (78) (vl) ((batch_pre - batch )) (A))) (voutput_min) (78) (vl))) (voutput_max) (78) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s77")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s77")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (77) (vl) ((batch_pre - batch )) (A))) (voutput_min) (77) (vl))) (voutput_max) (77) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s76")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s76")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (76) (vl) ((batch_pre - batch )) (A))) (voutput_min) (76) (vl))) (voutput_max) (76) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s75")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s75")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (75) (vl) ((batch_pre - batch )) (A))) (voutput_min) (75) (vl))) (voutput_max) (75) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s74")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s74")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (74) (vl) ((batch_pre - batch )) (A))) (voutput_min) (74) (vl))) (voutput_max) (74) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s73")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s73")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (73) (vl) ((batch_pre - batch )) (A))) (voutput_min) (73) (vl))) (voutput_max) (73) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s72")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s72")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (72) (vl) ((batch_pre - batch )) (A))) (voutput_min) (72) (vl))) (voutput_max) (72) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s71")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s71")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (71) (vl) ((batch_pre - batch )) (A))) (voutput_min) (71) (vl))) (voutput_max) (71) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s70")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s70")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (70) (vl) ((batch_pre - batch )) (A))) (voutput_min) (70) (vl))) (voutput_max) (70) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s69")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s69")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (69) (vl) ((batch_pre - batch )) (A))) (voutput_min) (69) (vl))) (voutput_max) (69) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s68")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s68")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (68) (vl) ((batch_pre - batch )) (A))) (voutput_min) (68) (vl))) (voutput_max) (68) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s67")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s67")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (67) (vl) ((batch_pre - batch )) (A))) (voutput_min) (67) (vl))) (voutput_max) (67) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s66")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s66")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (66) (vl) ((batch_pre - batch )) (A))) (voutput_min) (66) (vl))) (voutput_max) (66) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s65")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s65")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (65) (vl) ((batch_pre - batch )) (A))) (voutput_min) (65) (vl))) (voutput_max) (65) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s64")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s64")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (64) (vl) ((batch_pre - batch )) (A))) (voutput_min) (64) (vl))) (voutput_max) (64) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s63")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s63")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (63) (vl) ((batch_pre - batch )) (A))) (voutput_min) (63) (vl))) (voutput_max) (63) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s62")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s62")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (62) (vl) ((batch_pre - batch )) (A))) (voutput_min) (62) (vl))) (voutput_max) (62) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s61")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s61")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (61) (vl) ((batch_pre - batch )) (A))) (voutput_min) (61) (vl))) (voutput_max) (61) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s60")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s60")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (60) (vl) ((batch_pre - batch )) (A))) (voutput_min) (60) (vl))) (voutput_max) (60) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s59")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s59")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (59) (vl) ((batch_pre - batch )) (A))) (voutput_min) (59) (vl))) (voutput_max) (59) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s58")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s58")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (58) (vl) ((batch_pre - batch )) (A))) (voutput_min) (58) (vl))) (voutput_max) (58) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s57")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s57")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (57) (vl) ((batch_pre - batch )) (A))) (voutput_min) (57) (vl))) (voutput_max) (57) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s56")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s56")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (56) (vl) ((batch_pre - batch )) (A))) (voutput_min) (56) (vl))) (voutput_max) (56) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s55")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s55")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (55) (vl) ((batch_pre - batch )) (A))) (voutput_min) (55) (vl))) (voutput_max) (55) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s54")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s54")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (54) (vl) ((batch_pre - batch )) (A))) (voutput_min) (54) (vl))) (voutput_max) (54) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s53")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s53")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (53) (vl) ((batch_pre - batch )) (A))) (voutput_min) (53) (vl))) (voutput_max) (53) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s52")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s52")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (52) (vl) ((batch_pre - batch )) (A))) (voutput_min) (52) (vl))) (voutput_max) (52) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s51")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s51")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (51) (vl) ((batch_pre - batch )) (A))) (voutput_min) (51) (vl))) (voutput_max) (51) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s50")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s50")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (50) (vl) ((batch_pre - batch )) (A))) (voutput_min) (50) (vl))) (voutput_max) (50) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s49")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s49")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (49) (vl) ((batch_pre - batch )) (A))) (voutput_min) (49) (vl))) (voutput_max) (49) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s48")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s48")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (48) (vl) ((batch_pre - batch )) (A))) (voutput_min) (48) (vl))) (voutput_max) (48) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s47")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s47")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (47) (vl) ((batch_pre - batch )) (A))) (voutput_min) (47) (vl))) (voutput_max) (47) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s46")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s46")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (46) (vl) ((batch_pre - batch )) (A))) (voutput_min) (46) (vl))) (voutput_max) (46) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s45")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s45")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (45) (vl) ((batch_pre - batch )) (A))) (voutput_min) (45) (vl))) (voutput_max) (45) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s44")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s44")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (44) (vl) ((batch_pre - batch )) (A))) (voutput_min) (44) (vl))) (voutput_max) (44) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s43")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s43")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (43) (vl) ((batch_pre - batch )) (A))) (voutput_min) (43) (vl))) (voutput_max) (43) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s42")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s42")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (42) (vl) ((batch_pre - batch )) (A))) (voutput_min) (42) (vl))) (voutput_max) (42) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s41")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s41")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (41) (vl) ((batch_pre - batch )) (A))) (voutput_min) (41) (vl))) (voutput_max) (41) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s40")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s40")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (40) (vl) ((batch_pre - batch )) (A))) (voutput_min) (40) (vl))) (voutput_max) (40) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s39")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s39")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (39) (vl) ((batch_pre - batch )) (A))) (voutput_min) (39) (vl))) (voutput_max) (39) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s38")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s38")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (38) (vl) ((batch_pre - batch )) (A))) (voutput_min) (38) (vl))) (voutput_max) (38) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s37")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s37")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (37) (vl) ((batch_pre - batch )) (A))) (voutput_min) (37) (vl))) (voutput_max) (37) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s36")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s36")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (36) (vl) ((batch_pre - batch )) (A))) (voutput_min) (36) (vl))) (voutput_max) (36) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s35")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s35")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (35) (vl) ((batch_pre - batch )) (A))) (voutput_min) (35) (vl))) (voutput_max) (35) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s34")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s34")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (34) (vl) ((batch_pre - batch )) (A))) (voutput_min) (34) (vl))) (voutput_max) (34) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s33")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s33")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (33) (vl) ((batch_pre - batch )) (A))) (voutput_min) (33) (vl))) (voutput_max) (33) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s32")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s32")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (32) (vl) ((batch_pre - batch )) (A))) (voutput_min) (32) (vl))) (voutput_max) (32) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s31")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s31")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (31) (vl) ((batch_pre - batch )) (A))) (voutput_min) (31) (vl))) (voutput_max) (31) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s30")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s30")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (30) (vl) ((batch_pre - batch )) (A))) (voutput_min) (30) (vl))) (voutput_max) (30) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s29")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s29")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (29) (vl) ((batch_pre - batch )) (A))) (voutput_min) (29) (vl))) (voutput_max) (29) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s28")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s28")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (28) (vl) ((batch_pre - batch )) (A))) (voutput_min) (28) (vl))) (voutput_max) (28) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s27")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s27")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (27) (vl) ((batch_pre - batch )) (A))) (voutput_min) (27) (vl))) (voutput_max) (27) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s26")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s26")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (26) (vl) ((batch_pre - batch )) (A))) (voutput_min) (26) (vl))) (voutput_max) (26) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s25")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s25")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (25) (vl) ((batch_pre - batch )) (A))) (voutput_min) (25) (vl))) (voutput_max) (25) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s24")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s24")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (24) (vl) ((batch_pre - batch )) (A))) (voutput_min) (24) (vl))) (voutput_max) (24) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s23")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s23")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (23) (vl) ((batch_pre - batch )) (A))) (voutput_min) (23) (vl))) (voutput_max) (23) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s22")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s22")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (22) (vl) ((batch_pre - batch )) (A))) (voutput_min) (22) (vl))) (voutput_max) (22) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s21")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s21")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (21) (vl) ((batch_pre - batch )) (A))) (voutput_min) (21) (vl))) (voutput_max) (21) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s20")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s20")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (20) (vl) ((batch_pre - batch )) (A))) (voutput_min) (20) (vl))) (voutput_max) (20) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s19")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s19")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (19) (vl) ((batch_pre - batch )) (A))) (voutput_min) (19) (vl))) (voutput_max) (19) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s18")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s18")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (18) (vl) ((batch_pre - batch )) (A))) (voutput_min) (18) (vl))) (voutput_max) (18) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s17")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s17")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (17) (vl) ((batch_pre - batch )) (A))) (voutput_min) (17) (vl))) (voutput_max) (17) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s16")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s16")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (16) (vl) ((batch_pre - batch )) (A))) (voutput_min) (16) (vl))) (voutput_max) (16) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s15")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s15")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (15) (vl) ((batch_pre - batch )) (A))) (voutput_min) (15) (vl))) (voutput_max) (15) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s14")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s14")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (14) (vl) ((batch_pre - batch )) (A))) (voutput_min) (14) (vl))) (voutput_max) (14) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s13")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s13")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (13) (vl) ((batch_pre - batch )) (A))) (voutput_min) (13) (vl))) (voutput_max) (13) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s12")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s12")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (12) (vl) ((batch_pre - batch )) (A))) (voutput_min) (12) (vl))) (voutput_max) (12) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s11")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s11")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (11) (vl) ((batch_pre - batch )) (A))) (voutput_min) (11) (vl))) (voutput_max) (11) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s10")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s10")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (10) (vl) ((batch_pre - batch )) (A))) (voutput_min) (10) (vl))) (voutput_max) (10) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s9")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s9")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (9) (vl) ((batch_pre - batch )) (A))) (voutput_min) (9) (vl))) (voutput_max) (9) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s8")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s8")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (8) (vl) ((batch_pre - batch )) (A))) (voutput_min) (8) (vl))) (voutput_max) (8) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s7")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s7")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (7) (vl) ((batch_pre - batch )) (A))) (voutput_min) (7) (vl))) (voutput_max) (7) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s6")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s6")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (6) (vl) ((batch_pre - batch )) (A))) (voutput_min) (6) (vl))) (voutput_max) (6) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s5")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s5")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (5) (vl) ((batch_pre - batch )) (A))) (voutput_min) (5) (vl))) (voutput_max) (5) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s4")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s4")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (4) (vl) ((batch_pre - batch )) (A))) (voutput_min) (4) (vl))) (voutput_max) (4) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s3")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (3) (vl) ((batch_pre - batch )) (A))) (voutput_min) (3) (vl))) (voutput_max) (3) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s2")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (2) (vl) ((batch_pre - batch )) (A))) (voutput_min) (2) (vl))) (voutput_max) (2) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s1")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (1) (vl) ((batch_pre - batch )) (A))) (voutput_min) (1) (vl))) (voutput_max) (1) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s0")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s0")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (0) (vl) ((batch_pre - batch )) (A))) (voutput_min) (0) (vl))) (voutput_max) (0) (vl)))
  **  (CharArray.full input_pre (batch_pre + 7 ) A )
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
  **  (CharArray.full output_pre (batch_pre - batch ) (s8_rvv_progress ((batch_pre - batch )) (batch_pre) ((s8_narrow (RawLo))) ((s8_narrow (RawHi))) (A)) )
  **  (CharArray.undef_full output batch )
.

Definition test_rvv_partial_solve_wit_12_pure := 
forall (params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (RawHi: Z) (RawLo: Z) (A: (@list Z)) (vl: Z) (batch: Z) (batch64: Z) (input: Z) (output: Z) (voutput_min: Z) (voutput_max: Z) (PreH1 : (0 < vl)) (PreH2 : (vl <= 128)) (PreH3 : (vl <= batch)) (PreH4 : (vl <= batch64)) (PreH5 : (0 < batch_pre)) (PreH6 : (batch_pre <= 18446744073709551608)) (PreH7 : (sizeof(CHAR) = 1)) (PreH8 : ((Zlength (A)) = (batch_pre + 7 ))) (PreH9 : (0 <= batch)) (PreH10 : (batch <= batch_pre)) (PreH11 : (input = (input_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH12 : (batch > 0)) (PreH13 : (output = (output_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH14 : (voutput_min = (s8_narrow (RawLo)))) (PreH15 : (voutput_max = (s8_narrow (RawHi)))) (PreH16 : ((-128) <= voutput_min)) (PreH17 : (voutput_min <= 127)) (PreH18 : ((-128) <= voutput_max)) (PreH19 : (voutput_max <= 127)) (PreH20 : (0 <= (s8_bulk_count (batch_pre)))) (PreH21 : ((s8_bulk_count (batch_pre)) <= batch_pre)) (PreH22 : (0 <= batch64)) (PreH23 : (batch64 = ((s8_bulk_count (batch_pre)) - (batch_pre - batch ) ))) (PreH24 : ((batch_pre - batch ) <= (s8_bulk_count (batch_pre)))) ,
  ((&(( &( "vacc" ) )->ₛ "s127")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (127) (vl) ((batch_pre - batch )) (A))) (voutput_min) (127) (vl))) (voutput_max) (127) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s126")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (126) (vl) ((batch_pre - batch )) (A))) (voutput_min) (126) (vl))) (voutput_max) (126) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s125")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (125) (vl) ((batch_pre - batch )) (A))) (voutput_min) (125) (vl))) (voutput_max) (125) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s124")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (124) (vl) ((batch_pre - batch )) (A))) (voutput_min) (124) (vl))) (voutput_max) (124) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s123")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (123) (vl) ((batch_pre - batch )) (A))) (voutput_min) (123) (vl))) (voutput_max) (123) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s122")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (122) (vl) ((batch_pre - batch )) (A))) (voutput_min) (122) (vl))) (voutput_max) (122) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s121")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (121) (vl) ((batch_pre - batch )) (A))) (voutput_min) (121) (vl))) (voutput_max) (121) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s120")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (120) (vl) ((batch_pre - batch )) (A))) (voutput_min) (120) (vl))) (voutput_max) (120) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s119")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (119) (vl) ((batch_pre - batch )) (A))) (voutput_min) (119) (vl))) (voutput_max) (119) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s118")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (118) (vl) ((batch_pre - batch )) (A))) (voutput_min) (118) (vl))) (voutput_max) (118) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s117")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (117) (vl) ((batch_pre - batch )) (A))) (voutput_min) (117) (vl))) (voutput_max) (117) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s116")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (116) (vl) ((batch_pre - batch )) (A))) (voutput_min) (116) (vl))) (voutput_max) (116) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s115")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (115) (vl) ((batch_pre - batch )) (A))) (voutput_min) (115) (vl))) (voutput_max) (115) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s114")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (114) (vl) ((batch_pre - batch )) (A))) (voutput_min) (114) (vl))) (voutput_max) (114) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s113")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (113) (vl) ((batch_pre - batch )) (A))) (voutput_min) (113) (vl))) (voutput_max) (113) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s112")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (112) (vl) ((batch_pre - batch )) (A))) (voutput_min) (112) (vl))) (voutput_max) (112) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s111")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (111) (vl) ((batch_pre - batch )) (A))) (voutput_min) (111) (vl))) (voutput_max) (111) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s110")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (110) (vl) ((batch_pre - batch )) (A))) (voutput_min) (110) (vl))) (voutput_max) (110) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s109")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (109) (vl) ((batch_pre - batch )) (A))) (voutput_min) (109) (vl))) (voutput_max) (109) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s108")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (108) (vl) ((batch_pre - batch )) (A))) (voutput_min) (108) (vl))) (voutput_max) (108) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s107")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (107) (vl) ((batch_pre - batch )) (A))) (voutput_min) (107) (vl))) (voutput_max) (107) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s106")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (106) (vl) ((batch_pre - batch )) (A))) (voutput_min) (106) (vl))) (voutput_max) (106) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s105")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (105) (vl) ((batch_pre - batch )) (A))) (voutput_min) (105) (vl))) (voutput_max) (105) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s104")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (104) (vl) ((batch_pre - batch )) (A))) (voutput_min) (104) (vl))) (voutput_max) (104) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s103")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (103) (vl) ((batch_pre - batch )) (A))) (voutput_min) (103) (vl))) (voutput_max) (103) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s102")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (102) (vl) ((batch_pre - batch )) (A))) (voutput_min) (102) (vl))) (voutput_max) (102) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s101")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (101) (vl) ((batch_pre - batch )) (A))) (voutput_min) (101) (vl))) (voutput_max) (101) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s100")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (100) (vl) ((batch_pre - batch )) (A))) (voutput_min) (100) (vl))) (voutput_max) (100) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s99")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (99) (vl) ((batch_pre - batch )) (A))) (voutput_min) (99) (vl))) (voutput_max) (99) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s98")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (98) (vl) ((batch_pre - batch )) (A))) (voutput_min) (98) (vl))) (voutput_max) (98) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s97")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (97) (vl) ((batch_pre - batch )) (A))) (voutput_min) (97) (vl))) (voutput_max) (97) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s96")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (96) (vl) ((batch_pre - batch )) (A))) (voutput_min) (96) (vl))) (voutput_max) (96) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s95")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (95) (vl) ((batch_pre - batch )) (A))) (voutput_min) (95) (vl))) (voutput_max) (95) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s94")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (94) (vl) ((batch_pre - batch )) (A))) (voutput_min) (94) (vl))) (voutput_max) (94) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s93")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (93) (vl) ((batch_pre - batch )) (A))) (voutput_min) (93) (vl))) (voutput_max) (93) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s92")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (92) (vl) ((batch_pre - batch )) (A))) (voutput_min) (92) (vl))) (voutput_max) (92) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s91")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (91) (vl) ((batch_pre - batch )) (A))) (voutput_min) (91) (vl))) (voutput_max) (91) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s90")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (90) (vl) ((batch_pre - batch )) (A))) (voutput_min) (90) (vl))) (voutput_max) (90) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s89")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (89) (vl) ((batch_pre - batch )) (A))) (voutput_min) (89) (vl))) (voutput_max) (89) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s88")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (88) (vl) ((batch_pre - batch )) (A))) (voutput_min) (88) (vl))) (voutput_max) (88) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s87")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (87) (vl) ((batch_pre - batch )) (A))) (voutput_min) (87) (vl))) (voutput_max) (87) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s86")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (86) (vl) ((batch_pre - batch )) (A))) (voutput_min) (86) (vl))) (voutput_max) (86) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s85")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (85) (vl) ((batch_pre - batch )) (A))) (voutput_min) (85) (vl))) (voutput_max) (85) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s84")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (84) (vl) ((batch_pre - batch )) (A))) (voutput_min) (84) (vl))) (voutput_max) (84) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s83")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (83) (vl) ((batch_pre - batch )) (A))) (voutput_min) (83) (vl))) (voutput_max) (83) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s82")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (82) (vl) ((batch_pre - batch )) (A))) (voutput_min) (82) (vl))) (voutput_max) (82) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s81")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (81) (vl) ((batch_pre - batch )) (A))) (voutput_min) (81) (vl))) (voutput_max) (81) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s80")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (80) (vl) ((batch_pre - batch )) (A))) (voutput_min) (80) (vl))) (voutput_max) (80) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s79")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (79) (vl) ((batch_pre - batch )) (A))) (voutput_min) (79) (vl))) (voutput_max) (79) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s78")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (78) (vl) ((batch_pre - batch )) (A))) (voutput_min) (78) (vl))) (voutput_max) (78) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s77")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (77) (vl) ((batch_pre - batch )) (A))) (voutput_min) (77) (vl))) (voutput_max) (77) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s76")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (76) (vl) ((batch_pre - batch )) (A))) (voutput_min) (76) (vl))) (voutput_max) (76) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s75")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (75) (vl) ((batch_pre - batch )) (A))) (voutput_min) (75) (vl))) (voutput_max) (75) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s74")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (74) (vl) ((batch_pre - batch )) (A))) (voutput_min) (74) (vl))) (voutput_max) (74) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s73")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (73) (vl) ((batch_pre - batch )) (A))) (voutput_min) (73) (vl))) (voutput_max) (73) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s72")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (72) (vl) ((batch_pre - batch )) (A))) (voutput_min) (72) (vl))) (voutput_max) (72) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s71")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (71) (vl) ((batch_pre - batch )) (A))) (voutput_min) (71) (vl))) (voutput_max) (71) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s70")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (70) (vl) ((batch_pre - batch )) (A))) (voutput_min) (70) (vl))) (voutput_max) (70) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s69")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (69) (vl) ((batch_pre - batch )) (A))) (voutput_min) (69) (vl))) (voutput_max) (69) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s68")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (68) (vl) ((batch_pre - batch )) (A))) (voutput_min) (68) (vl))) (voutput_max) (68) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s67")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (67) (vl) ((batch_pre - batch )) (A))) (voutput_min) (67) (vl))) (voutput_max) (67) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s66")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (66) (vl) ((batch_pre - batch )) (A))) (voutput_min) (66) (vl))) (voutput_max) (66) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s65")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (65) (vl) ((batch_pre - batch )) (A))) (voutput_min) (65) (vl))) (voutput_max) (65) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s64")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (64) (vl) ((batch_pre - batch )) (A))) (voutput_min) (64) (vl))) (voutput_max) (64) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s63")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (63) (vl) ((batch_pre - batch )) (A))) (voutput_min) (63) (vl))) (voutput_max) (63) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s62")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (62) (vl) ((batch_pre - batch )) (A))) (voutput_min) (62) (vl))) (voutput_max) (62) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s61")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (61) (vl) ((batch_pre - batch )) (A))) (voutput_min) (61) (vl))) (voutput_max) (61) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s60")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (60) (vl) ((batch_pre - batch )) (A))) (voutput_min) (60) (vl))) (voutput_max) (60) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s59")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (59) (vl) ((batch_pre - batch )) (A))) (voutput_min) (59) (vl))) (voutput_max) (59) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s58")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (58) (vl) ((batch_pre - batch )) (A))) (voutput_min) (58) (vl))) (voutput_max) (58) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s57")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (57) (vl) ((batch_pre - batch )) (A))) (voutput_min) (57) (vl))) (voutput_max) (57) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s56")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (56) (vl) ((batch_pre - batch )) (A))) (voutput_min) (56) (vl))) (voutput_max) (56) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s55")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (55) (vl) ((batch_pre - batch )) (A))) (voutput_min) (55) (vl))) (voutput_max) (55) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s54")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (54) (vl) ((batch_pre - batch )) (A))) (voutput_min) (54) (vl))) (voutput_max) (54) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s53")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (53) (vl) ((batch_pre - batch )) (A))) (voutput_min) (53) (vl))) (voutput_max) (53) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s52")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (52) (vl) ((batch_pre - batch )) (A))) (voutput_min) (52) (vl))) (voutput_max) (52) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s51")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (51) (vl) ((batch_pre - batch )) (A))) (voutput_min) (51) (vl))) (voutput_max) (51) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s50")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (50) (vl) ((batch_pre - batch )) (A))) (voutput_min) (50) (vl))) (voutput_max) (50) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s49")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (49) (vl) ((batch_pre - batch )) (A))) (voutput_min) (49) (vl))) (voutput_max) (49) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s48")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (48) (vl) ((batch_pre - batch )) (A))) (voutput_min) (48) (vl))) (voutput_max) (48) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s47")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (47) (vl) ((batch_pre - batch )) (A))) (voutput_min) (47) (vl))) (voutput_max) (47) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s46")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (46) (vl) ((batch_pre - batch )) (A))) (voutput_min) (46) (vl))) (voutput_max) (46) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s45")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (45) (vl) ((batch_pre - batch )) (A))) (voutput_min) (45) (vl))) (voutput_max) (45) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s44")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (44) (vl) ((batch_pre - batch )) (A))) (voutput_min) (44) (vl))) (voutput_max) (44) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s43")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (43) (vl) ((batch_pre - batch )) (A))) (voutput_min) (43) (vl))) (voutput_max) (43) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s42")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (42) (vl) ((batch_pre - batch )) (A))) (voutput_min) (42) (vl))) (voutput_max) (42) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s41")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (41) (vl) ((batch_pre - batch )) (A))) (voutput_min) (41) (vl))) (voutput_max) (41) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s40")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (40) (vl) ((batch_pre - batch )) (A))) (voutput_min) (40) (vl))) (voutput_max) (40) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s39")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (39) (vl) ((batch_pre - batch )) (A))) (voutput_min) (39) (vl))) (voutput_max) (39) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s38")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (38) (vl) ((batch_pre - batch )) (A))) (voutput_min) (38) (vl))) (voutput_max) (38) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s37")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (37) (vl) ((batch_pre - batch )) (A))) (voutput_min) (37) (vl))) (voutput_max) (37) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s36")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (36) (vl) ((batch_pre - batch )) (A))) (voutput_min) (36) (vl))) (voutput_max) (36) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s35")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (35) (vl) ((batch_pre - batch )) (A))) (voutput_min) (35) (vl))) (voutput_max) (35) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s34")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (34) (vl) ((batch_pre - batch )) (A))) (voutput_min) (34) (vl))) (voutput_max) (34) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s33")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (33) (vl) ((batch_pre - batch )) (A))) (voutput_min) (33) (vl))) (voutput_max) (33) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s32")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (32) (vl) ((batch_pre - batch )) (A))) (voutput_min) (32) (vl))) (voutput_max) (32) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s31")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (31) (vl) ((batch_pre - batch )) (A))) (voutput_min) (31) (vl))) (voutput_max) (31) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s30")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (30) (vl) ((batch_pre - batch )) (A))) (voutput_min) (30) (vl))) (voutput_max) (30) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s29")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (29) (vl) ((batch_pre - batch )) (A))) (voutput_min) (29) (vl))) (voutput_max) (29) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s28")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (28) (vl) ((batch_pre - batch )) (A))) (voutput_min) (28) (vl))) (voutput_max) (28) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s27")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (27) (vl) ((batch_pre - batch )) (A))) (voutput_min) (27) (vl))) (voutput_max) (27) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s26")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (26) (vl) ((batch_pre - batch )) (A))) (voutput_min) (26) (vl))) (voutput_max) (26) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s25")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (25) (vl) ((batch_pre - batch )) (A))) (voutput_min) (25) (vl))) (voutput_max) (25) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s24")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (24) (vl) ((batch_pre - batch )) (A))) (voutput_min) (24) (vl))) (voutput_max) (24) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s23")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (23) (vl) ((batch_pre - batch )) (A))) (voutput_min) (23) (vl))) (voutput_max) (23) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s22")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (22) (vl) ((batch_pre - batch )) (A))) (voutput_min) (22) (vl))) (voutput_max) (22) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s21")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (21) (vl) ((batch_pre - batch )) (A))) (voutput_min) (21) (vl))) (voutput_max) (21) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s20")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (20) (vl) ((batch_pre - batch )) (A))) (voutput_min) (20) (vl))) (voutput_max) (20) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s19")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (19) (vl) ((batch_pre - batch )) (A))) (voutput_min) (19) (vl))) (voutput_max) (19) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s18")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (18) (vl) ((batch_pre - batch )) (A))) (voutput_min) (18) (vl))) (voutput_max) (18) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s17")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (17) (vl) ((batch_pre - batch )) (A))) (voutput_min) (17) (vl))) (voutput_max) (17) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s16")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (16) (vl) ((batch_pre - batch )) (A))) (voutput_min) (16) (vl))) (voutput_max) (16) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s15")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (15) (vl) ((batch_pre - batch )) (A))) (voutput_min) (15) (vl))) (voutput_max) (15) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s14")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (14) (vl) ((batch_pre - batch )) (A))) (voutput_min) (14) (vl))) (voutput_max) (14) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s13")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (13) (vl) ((batch_pre - batch )) (A))) (voutput_min) (13) (vl))) (voutput_max) (13) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s12")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (12) (vl) ((batch_pre - batch )) (A))) (voutput_min) (12) (vl))) (voutput_max) (12) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s11")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (11) (vl) ((batch_pre - batch )) (A))) (voutput_min) (11) (vl))) (voutput_max) (11) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s10")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (10) (vl) ((batch_pre - batch )) (A))) (voutput_min) (10) (vl))) (voutput_max) (10) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s9")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (9) (vl) ((batch_pre - batch )) (A))) (voutput_min) (9) (vl))) (voutput_max) (9) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s8")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (8) (vl) ((batch_pre - batch )) (A))) (voutput_min) (8) (vl))) (voutput_max) (8) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s7")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (7) (vl) ((batch_pre - batch )) (A))) (voutput_min) (7) (vl))) (voutput_max) (7) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s6")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (6) (vl) ((batch_pre - batch )) (A))) (voutput_min) (6) (vl))) (voutput_max) (6) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s5")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (5) (vl) ((batch_pre - batch )) (A))) (voutput_min) (5) (vl))) (voutput_max) (5) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s4")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (4) (vl) ((batch_pre - batch )) (A))) (voutput_min) (4) (vl))) (voutput_max) (4) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (3) (vl) ((batch_pre - batch )) (A))) (voutput_min) (3) (vl))) (voutput_max) (3) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (2) (vl) ((batch_pre - batch )) (A))) (voutput_min) (2) (vl))) (voutput_max) (2) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (1) (vl) ((batch_pre - batch )) (A))) (voutput_min) (1) (vl))) (voutput_max) (1) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s0")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (0) (vl) ((batch_pre - batch )) (A))) (voutput_min) (0) (vl))) (voutput_max) (0) (vl)))
  **  (CharArray.full input_pre (batch_pre + 7 ) A )
  **  ((( &( "vl" ) )) # UInt64  |-> vl)
  **  ((( &( "batch" ) )) # UInt64  |-> batch)
  **  ((( &( "batch64" ) )) # UInt64  |-> batch64)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "voutput_min" ) )) # Char  |-> voutput_min)
  **  ((( &( "voutput_max" ) )) # Char  |-> voutput_max)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
  **  (CharArray.full output_pre (batch_pre - batch ) (s8_rvv_progress ((batch_pre - batch )) (batch_pre) ((s8_narrow (RawLo))) ((s8_narrow (RawHi))) (A)) )
  **  (CharArray.undef_full output batch )
|--
  “ (0 <= vl) ” 
  &&  “ (vl <= 128) ”
.

Definition test_rvv_partial_solve_wit_12_aux := 
forall (params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (RawHi: Z) (RawLo: Z) (A: (@list Z)) (vl: Z) (batch: Z) (batch64: Z) (input: Z) (output: Z) (voutput_min: Z) (voutput_max: Z) (PreH1 : (0 < vl)) (PreH2 : (vl <= 128)) (PreH3 : (vl <= batch)) (PreH4 : (vl <= batch64)) (PreH5 : (0 < batch_pre)) (PreH6 : (batch_pre <= 18446744073709551608)) (PreH7 : (sizeof(CHAR) = 1)) (PreH8 : ((Zlength (A)) = (batch_pre + 7 ))) (PreH9 : (0 <= batch)) (PreH10 : (batch <= batch_pre)) (PreH11 : (input = (input_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH12 : (batch > 0)) (PreH13 : (output = (output_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH14 : (voutput_min = (s8_narrow (RawLo)))) (PreH15 : (voutput_max = (s8_narrow (RawHi)))) (PreH16 : ((-128) <= voutput_min)) (PreH17 : (voutput_min <= 127)) (PreH18 : ((-128) <= voutput_max)) (PreH19 : (voutput_max <= 127)) (PreH20 : (0 <= (s8_bulk_count (batch_pre)))) (PreH21 : ((s8_bulk_count (batch_pre)) <= batch_pre)) (PreH22 : (0 <= batch64)) (PreH23 : (batch64 = ((s8_bulk_count (batch_pre)) - (batch_pre - batch ) ))) (PreH24 : ((batch_pre - batch ) <= (s8_bulk_count (batch_pre)))) ,
  ((&(( &( "vacc" ) )->ₛ "s127")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (127) (vl) ((batch_pre - batch )) (A))) (voutput_min) (127) (vl))) (voutput_max) (127) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s126")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (126) (vl) ((batch_pre - batch )) (A))) (voutput_min) (126) (vl))) (voutput_max) (126) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s125")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (125) (vl) ((batch_pre - batch )) (A))) (voutput_min) (125) (vl))) (voutput_max) (125) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s124")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (124) (vl) ((batch_pre - batch )) (A))) (voutput_min) (124) (vl))) (voutput_max) (124) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s123")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (123) (vl) ((batch_pre - batch )) (A))) (voutput_min) (123) (vl))) (voutput_max) (123) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s122")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (122) (vl) ((batch_pre - batch )) (A))) (voutput_min) (122) (vl))) (voutput_max) (122) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s121")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (121) (vl) ((batch_pre - batch )) (A))) (voutput_min) (121) (vl))) (voutput_max) (121) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s120")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (120) (vl) ((batch_pre - batch )) (A))) (voutput_min) (120) (vl))) (voutput_max) (120) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s119")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (119) (vl) ((batch_pre - batch )) (A))) (voutput_min) (119) (vl))) (voutput_max) (119) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s118")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (118) (vl) ((batch_pre - batch )) (A))) (voutput_min) (118) (vl))) (voutput_max) (118) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s117")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (117) (vl) ((batch_pre - batch )) (A))) (voutput_min) (117) (vl))) (voutput_max) (117) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s116")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (116) (vl) ((batch_pre - batch )) (A))) (voutput_min) (116) (vl))) (voutput_max) (116) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s115")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (115) (vl) ((batch_pre - batch )) (A))) (voutput_min) (115) (vl))) (voutput_max) (115) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s114")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (114) (vl) ((batch_pre - batch )) (A))) (voutput_min) (114) (vl))) (voutput_max) (114) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s113")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (113) (vl) ((batch_pre - batch )) (A))) (voutput_min) (113) (vl))) (voutput_max) (113) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s112")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (112) (vl) ((batch_pre - batch )) (A))) (voutput_min) (112) (vl))) (voutput_max) (112) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s111")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (111) (vl) ((batch_pre - batch )) (A))) (voutput_min) (111) (vl))) (voutput_max) (111) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s110")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (110) (vl) ((batch_pre - batch )) (A))) (voutput_min) (110) (vl))) (voutput_max) (110) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s109")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (109) (vl) ((batch_pre - batch )) (A))) (voutput_min) (109) (vl))) (voutput_max) (109) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s108")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (108) (vl) ((batch_pre - batch )) (A))) (voutput_min) (108) (vl))) (voutput_max) (108) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s107")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (107) (vl) ((batch_pre - batch )) (A))) (voutput_min) (107) (vl))) (voutput_max) (107) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s106")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (106) (vl) ((batch_pre - batch )) (A))) (voutput_min) (106) (vl))) (voutput_max) (106) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s105")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (105) (vl) ((batch_pre - batch )) (A))) (voutput_min) (105) (vl))) (voutput_max) (105) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s104")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (104) (vl) ((batch_pre - batch )) (A))) (voutput_min) (104) (vl))) (voutput_max) (104) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s103")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (103) (vl) ((batch_pre - batch )) (A))) (voutput_min) (103) (vl))) (voutput_max) (103) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s102")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (102) (vl) ((batch_pre - batch )) (A))) (voutput_min) (102) (vl))) (voutput_max) (102) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s101")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (101) (vl) ((batch_pre - batch )) (A))) (voutput_min) (101) (vl))) (voutput_max) (101) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s100")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (100) (vl) ((batch_pre - batch )) (A))) (voutput_min) (100) (vl))) (voutput_max) (100) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s99")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (99) (vl) ((batch_pre - batch )) (A))) (voutput_min) (99) (vl))) (voutput_max) (99) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s98")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (98) (vl) ((batch_pre - batch )) (A))) (voutput_min) (98) (vl))) (voutput_max) (98) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s97")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (97) (vl) ((batch_pre - batch )) (A))) (voutput_min) (97) (vl))) (voutput_max) (97) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s96")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (96) (vl) ((batch_pre - batch )) (A))) (voutput_min) (96) (vl))) (voutput_max) (96) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s95")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (95) (vl) ((batch_pre - batch )) (A))) (voutput_min) (95) (vl))) (voutput_max) (95) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s94")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (94) (vl) ((batch_pre - batch )) (A))) (voutput_min) (94) (vl))) (voutput_max) (94) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s93")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (93) (vl) ((batch_pre - batch )) (A))) (voutput_min) (93) (vl))) (voutput_max) (93) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s92")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (92) (vl) ((batch_pre - batch )) (A))) (voutput_min) (92) (vl))) (voutput_max) (92) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s91")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (91) (vl) ((batch_pre - batch )) (A))) (voutput_min) (91) (vl))) (voutput_max) (91) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s90")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (90) (vl) ((batch_pre - batch )) (A))) (voutput_min) (90) (vl))) (voutput_max) (90) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s89")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (89) (vl) ((batch_pre - batch )) (A))) (voutput_min) (89) (vl))) (voutput_max) (89) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s88")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (88) (vl) ((batch_pre - batch )) (A))) (voutput_min) (88) (vl))) (voutput_max) (88) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s87")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (87) (vl) ((batch_pre - batch )) (A))) (voutput_min) (87) (vl))) (voutput_max) (87) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s86")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (86) (vl) ((batch_pre - batch )) (A))) (voutput_min) (86) (vl))) (voutput_max) (86) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s85")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (85) (vl) ((batch_pre - batch )) (A))) (voutput_min) (85) (vl))) (voutput_max) (85) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s84")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (84) (vl) ((batch_pre - batch )) (A))) (voutput_min) (84) (vl))) (voutput_max) (84) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s83")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (83) (vl) ((batch_pre - batch )) (A))) (voutput_min) (83) (vl))) (voutput_max) (83) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s82")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (82) (vl) ((batch_pre - batch )) (A))) (voutput_min) (82) (vl))) (voutput_max) (82) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s81")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (81) (vl) ((batch_pre - batch )) (A))) (voutput_min) (81) (vl))) (voutput_max) (81) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s80")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (80) (vl) ((batch_pre - batch )) (A))) (voutput_min) (80) (vl))) (voutput_max) (80) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s79")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (79) (vl) ((batch_pre - batch )) (A))) (voutput_min) (79) (vl))) (voutput_max) (79) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s78")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (78) (vl) ((batch_pre - batch )) (A))) (voutput_min) (78) (vl))) (voutput_max) (78) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s77")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (77) (vl) ((batch_pre - batch )) (A))) (voutput_min) (77) (vl))) (voutput_max) (77) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s76")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (76) (vl) ((batch_pre - batch )) (A))) (voutput_min) (76) (vl))) (voutput_max) (76) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s75")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (75) (vl) ((batch_pre - batch )) (A))) (voutput_min) (75) (vl))) (voutput_max) (75) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s74")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (74) (vl) ((batch_pre - batch )) (A))) (voutput_min) (74) (vl))) (voutput_max) (74) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s73")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (73) (vl) ((batch_pre - batch )) (A))) (voutput_min) (73) (vl))) (voutput_max) (73) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s72")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (72) (vl) ((batch_pre - batch )) (A))) (voutput_min) (72) (vl))) (voutput_max) (72) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s71")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (71) (vl) ((batch_pre - batch )) (A))) (voutput_min) (71) (vl))) (voutput_max) (71) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s70")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (70) (vl) ((batch_pre - batch )) (A))) (voutput_min) (70) (vl))) (voutput_max) (70) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s69")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (69) (vl) ((batch_pre - batch )) (A))) (voutput_min) (69) (vl))) (voutput_max) (69) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s68")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (68) (vl) ((batch_pre - batch )) (A))) (voutput_min) (68) (vl))) (voutput_max) (68) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s67")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (67) (vl) ((batch_pre - batch )) (A))) (voutput_min) (67) (vl))) (voutput_max) (67) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s66")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (66) (vl) ((batch_pre - batch )) (A))) (voutput_min) (66) (vl))) (voutput_max) (66) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s65")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (65) (vl) ((batch_pre - batch )) (A))) (voutput_min) (65) (vl))) (voutput_max) (65) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s64")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (64) (vl) ((batch_pre - batch )) (A))) (voutput_min) (64) (vl))) (voutput_max) (64) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s63")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (63) (vl) ((batch_pre - batch )) (A))) (voutput_min) (63) (vl))) (voutput_max) (63) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s62")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (62) (vl) ((batch_pre - batch )) (A))) (voutput_min) (62) (vl))) (voutput_max) (62) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s61")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (61) (vl) ((batch_pre - batch )) (A))) (voutput_min) (61) (vl))) (voutput_max) (61) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s60")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (60) (vl) ((batch_pre - batch )) (A))) (voutput_min) (60) (vl))) (voutput_max) (60) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s59")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (59) (vl) ((batch_pre - batch )) (A))) (voutput_min) (59) (vl))) (voutput_max) (59) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s58")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (58) (vl) ((batch_pre - batch )) (A))) (voutput_min) (58) (vl))) (voutput_max) (58) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s57")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (57) (vl) ((batch_pre - batch )) (A))) (voutput_min) (57) (vl))) (voutput_max) (57) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s56")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (56) (vl) ((batch_pre - batch )) (A))) (voutput_min) (56) (vl))) (voutput_max) (56) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s55")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (55) (vl) ((batch_pre - batch )) (A))) (voutput_min) (55) (vl))) (voutput_max) (55) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s54")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (54) (vl) ((batch_pre - batch )) (A))) (voutput_min) (54) (vl))) (voutput_max) (54) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s53")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (53) (vl) ((batch_pre - batch )) (A))) (voutput_min) (53) (vl))) (voutput_max) (53) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s52")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (52) (vl) ((batch_pre - batch )) (A))) (voutput_min) (52) (vl))) (voutput_max) (52) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s51")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (51) (vl) ((batch_pre - batch )) (A))) (voutput_min) (51) (vl))) (voutput_max) (51) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s50")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (50) (vl) ((batch_pre - batch )) (A))) (voutput_min) (50) (vl))) (voutput_max) (50) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s49")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (49) (vl) ((batch_pre - batch )) (A))) (voutput_min) (49) (vl))) (voutput_max) (49) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s48")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (48) (vl) ((batch_pre - batch )) (A))) (voutput_min) (48) (vl))) (voutput_max) (48) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s47")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (47) (vl) ((batch_pre - batch )) (A))) (voutput_min) (47) (vl))) (voutput_max) (47) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s46")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (46) (vl) ((batch_pre - batch )) (A))) (voutput_min) (46) (vl))) (voutput_max) (46) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s45")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (45) (vl) ((batch_pre - batch )) (A))) (voutput_min) (45) (vl))) (voutput_max) (45) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s44")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (44) (vl) ((batch_pre - batch )) (A))) (voutput_min) (44) (vl))) (voutput_max) (44) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s43")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (43) (vl) ((batch_pre - batch )) (A))) (voutput_min) (43) (vl))) (voutput_max) (43) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s42")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (42) (vl) ((batch_pre - batch )) (A))) (voutput_min) (42) (vl))) (voutput_max) (42) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s41")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (41) (vl) ((batch_pre - batch )) (A))) (voutput_min) (41) (vl))) (voutput_max) (41) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s40")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (40) (vl) ((batch_pre - batch )) (A))) (voutput_min) (40) (vl))) (voutput_max) (40) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s39")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (39) (vl) ((batch_pre - batch )) (A))) (voutput_min) (39) (vl))) (voutput_max) (39) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s38")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (38) (vl) ((batch_pre - batch )) (A))) (voutput_min) (38) (vl))) (voutput_max) (38) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s37")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (37) (vl) ((batch_pre - batch )) (A))) (voutput_min) (37) (vl))) (voutput_max) (37) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s36")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (36) (vl) ((batch_pre - batch )) (A))) (voutput_min) (36) (vl))) (voutput_max) (36) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s35")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (35) (vl) ((batch_pre - batch )) (A))) (voutput_min) (35) (vl))) (voutput_max) (35) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s34")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (34) (vl) ((batch_pre - batch )) (A))) (voutput_min) (34) (vl))) (voutput_max) (34) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s33")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (33) (vl) ((batch_pre - batch )) (A))) (voutput_min) (33) (vl))) (voutput_max) (33) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s32")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (32) (vl) ((batch_pre - batch )) (A))) (voutput_min) (32) (vl))) (voutput_max) (32) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s31")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (31) (vl) ((batch_pre - batch )) (A))) (voutput_min) (31) (vl))) (voutput_max) (31) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s30")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (30) (vl) ((batch_pre - batch )) (A))) (voutput_min) (30) (vl))) (voutput_max) (30) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s29")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (29) (vl) ((batch_pre - batch )) (A))) (voutput_min) (29) (vl))) (voutput_max) (29) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s28")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (28) (vl) ((batch_pre - batch )) (A))) (voutput_min) (28) (vl))) (voutput_max) (28) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s27")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (27) (vl) ((batch_pre - batch )) (A))) (voutput_min) (27) (vl))) (voutput_max) (27) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s26")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (26) (vl) ((batch_pre - batch )) (A))) (voutput_min) (26) (vl))) (voutput_max) (26) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s25")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (25) (vl) ((batch_pre - batch )) (A))) (voutput_min) (25) (vl))) (voutput_max) (25) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s24")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (24) (vl) ((batch_pre - batch )) (A))) (voutput_min) (24) (vl))) (voutput_max) (24) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s23")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (23) (vl) ((batch_pre - batch )) (A))) (voutput_min) (23) (vl))) (voutput_max) (23) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s22")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (22) (vl) ((batch_pre - batch )) (A))) (voutput_min) (22) (vl))) (voutput_max) (22) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s21")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (21) (vl) ((batch_pre - batch )) (A))) (voutput_min) (21) (vl))) (voutput_max) (21) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s20")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (20) (vl) ((batch_pre - batch )) (A))) (voutput_min) (20) (vl))) (voutput_max) (20) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s19")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (19) (vl) ((batch_pre - batch )) (A))) (voutput_min) (19) (vl))) (voutput_max) (19) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s18")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (18) (vl) ((batch_pre - batch )) (A))) (voutput_min) (18) (vl))) (voutput_max) (18) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s17")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (17) (vl) ((batch_pre - batch )) (A))) (voutput_min) (17) (vl))) (voutput_max) (17) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s16")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (16) (vl) ((batch_pre - batch )) (A))) (voutput_min) (16) (vl))) (voutput_max) (16) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s15")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (15) (vl) ((batch_pre - batch )) (A))) (voutput_min) (15) (vl))) (voutput_max) (15) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s14")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (14) (vl) ((batch_pre - batch )) (A))) (voutput_min) (14) (vl))) (voutput_max) (14) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s13")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (13) (vl) ((batch_pre - batch )) (A))) (voutput_min) (13) (vl))) (voutput_max) (13) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s12")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (12) (vl) ((batch_pre - batch )) (A))) (voutput_min) (12) (vl))) (voutput_max) (12) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s11")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (11) (vl) ((batch_pre - batch )) (A))) (voutput_min) (11) (vl))) (voutput_max) (11) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s10")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (10) (vl) ((batch_pre - batch )) (A))) (voutput_min) (10) (vl))) (voutput_max) (10) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s9")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (9) (vl) ((batch_pre - batch )) (A))) (voutput_min) (9) (vl))) (voutput_max) (9) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s8")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (8) (vl) ((batch_pre - batch )) (A))) (voutput_min) (8) (vl))) (voutput_max) (8) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s7")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (7) (vl) ((batch_pre - batch )) (A))) (voutput_min) (7) (vl))) (voutput_max) (7) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s6")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (6) (vl) ((batch_pre - batch )) (A))) (voutput_min) (6) (vl))) (voutput_max) (6) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s5")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (5) (vl) ((batch_pre - batch )) (A))) (voutput_min) (5) (vl))) (voutput_max) (5) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s4")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (4) (vl) ((batch_pre - batch )) (A))) (voutput_min) (4) (vl))) (voutput_max) (4) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (3) (vl) ((batch_pre - batch )) (A))) (voutput_min) (3) (vl))) (voutput_max) (3) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (2) (vl) ((batch_pre - batch )) (A))) (voutput_min) (2) (vl))) (voutput_max) (2) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (1) (vl) ((batch_pre - batch )) (A))) (voutput_min) (1) (vl))) (voutput_max) (1) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s0")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (0) (vl) ((batch_pre - batch )) (A))) (voutput_min) (0) (vl))) (voutput_max) (0) (vl)))
  **  (CharArray.full input_pre (batch_pre + 7 ) A )
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
  **  (CharArray.full output_pre (batch_pre - batch ) (s8_rvv_progress ((batch_pre - batch )) (batch_pre) ((s8_narrow (RawLo))) ((s8_narrow (RawHi))) (A)) )
  **  (CharArray.undef_full output batch )
|--
  “ (0 <= vl) ” 
  &&  “ (vl <= 128) ” 
  &&  “ (0 < vl) ” 
  &&  “ (vl <= 128) ” 
  &&  “ (vl <= batch) ” 
  &&  “ (vl <= batch64) ” 
  &&  “ (0 < batch_pre) ” 
  &&  “ (batch_pre <= 18446744073709551608) ” 
  &&  “ (sizeof(CHAR) = 1) ” 
  &&  “ ((Zlength (A)) = (batch_pre + 7 )) ” 
  &&  “ (0 <= batch) ” 
  &&  “ (batch <= batch_pre) ” 
  &&  “ (input = (input_pre + ((batch_pre - batch ) * sizeof(CHAR)))) ” 
  &&  “ (batch > 0) ” 
  &&  “ (output = (output_pre + ((batch_pre - batch ) * sizeof(CHAR)))) ” 
  &&  “ (voutput_min = (s8_narrow (RawLo))) ” 
  &&  “ (voutput_max = (s8_narrow (RawHi))) ” 
  &&  “ ((-128) <= voutput_min) ” 
  &&  “ (voutput_min <= 127) ” 
  &&  “ ((-128) <= voutput_max) ” 
  &&  “ (voutput_max <= 127) ” 
  &&  “ (0 <= (s8_bulk_count (batch_pre))) ” 
  &&  “ ((s8_bulk_count (batch_pre)) <= batch_pre) ” 
  &&  “ (0 <= batch64) ” 
  &&  “ (batch64 = ((s8_bulk_count (batch_pre)) - (batch_pre - batch ) )) ” 
  &&  “ ((batch_pre - batch ) <= (s8_bulk_count (batch_pre))) ”
  &&  ((&(( &( "vacc" ) )->ₛ "s0")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (0) (vl) ((batch_pre - batch )) (A))) (voutput_min) (0) (vl))) (voutput_max) (0) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (1) (vl) ((batch_pre - batch )) (A))) (voutput_min) (1) (vl))) (voutput_max) (1) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (2) (vl) ((batch_pre - batch )) (A))) (voutput_min) (2) (vl))) (voutput_max) (2) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (3) (vl) ((batch_pre - batch )) (A))) (voutput_min) (3) (vl))) (voutput_max) (3) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s4")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (4) (vl) ((batch_pre - batch )) (A))) (voutput_min) (4) (vl))) (voutput_max) (4) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s5")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (5) (vl) ((batch_pre - batch )) (A))) (voutput_min) (5) (vl))) (voutput_max) (5) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s6")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (6) (vl) ((batch_pre - batch )) (A))) (voutput_min) (6) (vl))) (voutput_max) (6) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s7")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (7) (vl) ((batch_pre - batch )) (A))) (voutput_min) (7) (vl))) (voutput_max) (7) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s8")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (8) (vl) ((batch_pre - batch )) (A))) (voutput_min) (8) (vl))) (voutput_max) (8) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s9")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (9) (vl) ((batch_pre - batch )) (A))) (voutput_min) (9) (vl))) (voutput_max) (9) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s10")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (10) (vl) ((batch_pre - batch )) (A))) (voutput_min) (10) (vl))) (voutput_max) (10) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s11")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (11) (vl) ((batch_pre - batch )) (A))) (voutput_min) (11) (vl))) (voutput_max) (11) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s12")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (12) (vl) ((batch_pre - batch )) (A))) (voutput_min) (12) (vl))) (voutput_max) (12) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s13")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (13) (vl) ((batch_pre - batch )) (A))) (voutput_min) (13) (vl))) (voutput_max) (13) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s14")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (14) (vl) ((batch_pre - batch )) (A))) (voutput_min) (14) (vl))) (voutput_max) (14) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s15")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (15) (vl) ((batch_pre - batch )) (A))) (voutput_min) (15) (vl))) (voutput_max) (15) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s16")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (16) (vl) ((batch_pre - batch )) (A))) (voutput_min) (16) (vl))) (voutput_max) (16) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s17")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (17) (vl) ((batch_pre - batch )) (A))) (voutput_min) (17) (vl))) (voutput_max) (17) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s18")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (18) (vl) ((batch_pre - batch )) (A))) (voutput_min) (18) (vl))) (voutput_max) (18) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s19")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (19) (vl) ((batch_pre - batch )) (A))) (voutput_min) (19) (vl))) (voutput_max) (19) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s20")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (20) (vl) ((batch_pre - batch )) (A))) (voutput_min) (20) (vl))) (voutput_max) (20) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s21")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (21) (vl) ((batch_pre - batch )) (A))) (voutput_min) (21) (vl))) (voutput_max) (21) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s22")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (22) (vl) ((batch_pre - batch )) (A))) (voutput_min) (22) (vl))) (voutput_max) (22) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s23")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (23) (vl) ((batch_pre - batch )) (A))) (voutput_min) (23) (vl))) (voutput_max) (23) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s24")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (24) (vl) ((batch_pre - batch )) (A))) (voutput_min) (24) (vl))) (voutput_max) (24) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s25")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (25) (vl) ((batch_pre - batch )) (A))) (voutput_min) (25) (vl))) (voutput_max) (25) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s26")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (26) (vl) ((batch_pre - batch )) (A))) (voutput_min) (26) (vl))) (voutput_max) (26) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s27")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (27) (vl) ((batch_pre - batch )) (A))) (voutput_min) (27) (vl))) (voutput_max) (27) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s28")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (28) (vl) ((batch_pre - batch )) (A))) (voutput_min) (28) (vl))) (voutput_max) (28) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s29")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (29) (vl) ((batch_pre - batch )) (A))) (voutput_min) (29) (vl))) (voutput_max) (29) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s30")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (30) (vl) ((batch_pre - batch )) (A))) (voutput_min) (30) (vl))) (voutput_max) (30) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s31")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (31) (vl) ((batch_pre - batch )) (A))) (voutput_min) (31) (vl))) (voutput_max) (31) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s32")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (32) (vl) ((batch_pre - batch )) (A))) (voutput_min) (32) (vl))) (voutput_max) (32) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s33")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (33) (vl) ((batch_pre - batch )) (A))) (voutput_min) (33) (vl))) (voutput_max) (33) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s34")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (34) (vl) ((batch_pre - batch )) (A))) (voutput_min) (34) (vl))) (voutput_max) (34) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s35")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (35) (vl) ((batch_pre - batch )) (A))) (voutput_min) (35) (vl))) (voutput_max) (35) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s36")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (36) (vl) ((batch_pre - batch )) (A))) (voutput_min) (36) (vl))) (voutput_max) (36) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s37")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (37) (vl) ((batch_pre - batch )) (A))) (voutput_min) (37) (vl))) (voutput_max) (37) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s38")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (38) (vl) ((batch_pre - batch )) (A))) (voutput_min) (38) (vl))) (voutput_max) (38) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s39")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (39) (vl) ((batch_pre - batch )) (A))) (voutput_min) (39) (vl))) (voutput_max) (39) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s40")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (40) (vl) ((batch_pre - batch )) (A))) (voutput_min) (40) (vl))) (voutput_max) (40) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s41")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (41) (vl) ((batch_pre - batch )) (A))) (voutput_min) (41) (vl))) (voutput_max) (41) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s42")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (42) (vl) ((batch_pre - batch )) (A))) (voutput_min) (42) (vl))) (voutput_max) (42) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s43")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (43) (vl) ((batch_pre - batch )) (A))) (voutput_min) (43) (vl))) (voutput_max) (43) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s44")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (44) (vl) ((batch_pre - batch )) (A))) (voutput_min) (44) (vl))) (voutput_max) (44) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s45")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (45) (vl) ((batch_pre - batch )) (A))) (voutput_min) (45) (vl))) (voutput_max) (45) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s46")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (46) (vl) ((batch_pre - batch )) (A))) (voutput_min) (46) (vl))) (voutput_max) (46) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s47")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (47) (vl) ((batch_pre - batch )) (A))) (voutput_min) (47) (vl))) (voutput_max) (47) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s48")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (48) (vl) ((batch_pre - batch )) (A))) (voutput_min) (48) (vl))) (voutput_max) (48) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s49")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (49) (vl) ((batch_pre - batch )) (A))) (voutput_min) (49) (vl))) (voutput_max) (49) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s50")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (50) (vl) ((batch_pre - batch )) (A))) (voutput_min) (50) (vl))) (voutput_max) (50) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s51")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (51) (vl) ((batch_pre - batch )) (A))) (voutput_min) (51) (vl))) (voutput_max) (51) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s52")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (52) (vl) ((batch_pre - batch )) (A))) (voutput_min) (52) (vl))) (voutput_max) (52) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s53")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (53) (vl) ((batch_pre - batch )) (A))) (voutput_min) (53) (vl))) (voutput_max) (53) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s54")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (54) (vl) ((batch_pre - batch )) (A))) (voutput_min) (54) (vl))) (voutput_max) (54) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s55")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (55) (vl) ((batch_pre - batch )) (A))) (voutput_min) (55) (vl))) (voutput_max) (55) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s56")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (56) (vl) ((batch_pre - batch )) (A))) (voutput_min) (56) (vl))) (voutput_max) (56) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s57")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (57) (vl) ((batch_pre - batch )) (A))) (voutput_min) (57) (vl))) (voutput_max) (57) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s58")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (58) (vl) ((batch_pre - batch )) (A))) (voutput_min) (58) (vl))) (voutput_max) (58) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s59")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (59) (vl) ((batch_pre - batch )) (A))) (voutput_min) (59) (vl))) (voutput_max) (59) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s60")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (60) (vl) ((batch_pre - batch )) (A))) (voutput_min) (60) (vl))) (voutput_max) (60) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s61")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (61) (vl) ((batch_pre - batch )) (A))) (voutput_min) (61) (vl))) (voutput_max) (61) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s62")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (62) (vl) ((batch_pre - batch )) (A))) (voutput_min) (62) (vl))) (voutput_max) (62) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s63")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (63) (vl) ((batch_pre - batch )) (A))) (voutput_min) (63) (vl))) (voutput_max) (63) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s64")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (64) (vl) ((batch_pre - batch )) (A))) (voutput_min) (64) (vl))) (voutput_max) (64) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s65")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (65) (vl) ((batch_pre - batch )) (A))) (voutput_min) (65) (vl))) (voutput_max) (65) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s66")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (66) (vl) ((batch_pre - batch )) (A))) (voutput_min) (66) (vl))) (voutput_max) (66) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s67")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (67) (vl) ((batch_pre - batch )) (A))) (voutput_min) (67) (vl))) (voutput_max) (67) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s68")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (68) (vl) ((batch_pre - batch )) (A))) (voutput_min) (68) (vl))) (voutput_max) (68) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s69")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (69) (vl) ((batch_pre - batch )) (A))) (voutput_min) (69) (vl))) (voutput_max) (69) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s70")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (70) (vl) ((batch_pre - batch )) (A))) (voutput_min) (70) (vl))) (voutput_max) (70) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s71")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (71) (vl) ((batch_pre - batch )) (A))) (voutput_min) (71) (vl))) (voutput_max) (71) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s72")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (72) (vl) ((batch_pre - batch )) (A))) (voutput_min) (72) (vl))) (voutput_max) (72) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s73")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (73) (vl) ((batch_pre - batch )) (A))) (voutput_min) (73) (vl))) (voutput_max) (73) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s74")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (74) (vl) ((batch_pre - batch )) (A))) (voutput_min) (74) (vl))) (voutput_max) (74) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s75")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (75) (vl) ((batch_pre - batch )) (A))) (voutput_min) (75) (vl))) (voutput_max) (75) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s76")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (76) (vl) ((batch_pre - batch )) (A))) (voutput_min) (76) (vl))) (voutput_max) (76) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s77")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (77) (vl) ((batch_pre - batch )) (A))) (voutput_min) (77) (vl))) (voutput_max) (77) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s78")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (78) (vl) ((batch_pre - batch )) (A))) (voutput_min) (78) (vl))) (voutput_max) (78) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s79")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (79) (vl) ((batch_pre - batch )) (A))) (voutput_min) (79) (vl))) (voutput_max) (79) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s80")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (80) (vl) ((batch_pre - batch )) (A))) (voutput_min) (80) (vl))) (voutput_max) (80) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s81")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (81) (vl) ((batch_pre - batch )) (A))) (voutput_min) (81) (vl))) (voutput_max) (81) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s82")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (82) (vl) ((batch_pre - batch )) (A))) (voutput_min) (82) (vl))) (voutput_max) (82) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s83")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (83) (vl) ((batch_pre - batch )) (A))) (voutput_min) (83) (vl))) (voutput_max) (83) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s84")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (84) (vl) ((batch_pre - batch )) (A))) (voutput_min) (84) (vl))) (voutput_max) (84) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s85")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (85) (vl) ((batch_pre - batch )) (A))) (voutput_min) (85) (vl))) (voutput_max) (85) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s86")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (86) (vl) ((batch_pre - batch )) (A))) (voutput_min) (86) (vl))) (voutput_max) (86) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s87")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (87) (vl) ((batch_pre - batch )) (A))) (voutput_min) (87) (vl))) (voutput_max) (87) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s88")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (88) (vl) ((batch_pre - batch )) (A))) (voutput_min) (88) (vl))) (voutput_max) (88) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s89")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (89) (vl) ((batch_pre - batch )) (A))) (voutput_min) (89) (vl))) (voutput_max) (89) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s90")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (90) (vl) ((batch_pre - batch )) (A))) (voutput_min) (90) (vl))) (voutput_max) (90) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s91")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (91) (vl) ((batch_pre - batch )) (A))) (voutput_min) (91) (vl))) (voutput_max) (91) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s92")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (92) (vl) ((batch_pre - batch )) (A))) (voutput_min) (92) (vl))) (voutput_max) (92) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s93")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (93) (vl) ((batch_pre - batch )) (A))) (voutput_min) (93) (vl))) (voutput_max) (93) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s94")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (94) (vl) ((batch_pre - batch )) (A))) (voutput_min) (94) (vl))) (voutput_max) (94) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s95")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (95) (vl) ((batch_pre - batch )) (A))) (voutput_min) (95) (vl))) (voutput_max) (95) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s96")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (96) (vl) ((batch_pre - batch )) (A))) (voutput_min) (96) (vl))) (voutput_max) (96) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s97")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (97) (vl) ((batch_pre - batch )) (A))) (voutput_min) (97) (vl))) (voutput_max) (97) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s98")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (98) (vl) ((batch_pre - batch )) (A))) (voutput_min) (98) (vl))) (voutput_max) (98) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s99")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (99) (vl) ((batch_pre - batch )) (A))) (voutput_min) (99) (vl))) (voutput_max) (99) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s100")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (100) (vl) ((batch_pre - batch )) (A))) (voutput_min) (100) (vl))) (voutput_max) (100) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s101")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (101) (vl) ((batch_pre - batch )) (A))) (voutput_min) (101) (vl))) (voutput_max) (101) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s102")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (102) (vl) ((batch_pre - batch )) (A))) (voutput_min) (102) (vl))) (voutput_max) (102) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s103")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (103) (vl) ((batch_pre - batch )) (A))) (voutput_min) (103) (vl))) (voutput_max) (103) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s104")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (104) (vl) ((batch_pre - batch )) (A))) (voutput_min) (104) (vl))) (voutput_max) (104) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s105")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (105) (vl) ((batch_pre - batch )) (A))) (voutput_min) (105) (vl))) (voutput_max) (105) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s106")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (106) (vl) ((batch_pre - batch )) (A))) (voutput_min) (106) (vl))) (voutput_max) (106) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s107")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (107) (vl) ((batch_pre - batch )) (A))) (voutput_min) (107) (vl))) (voutput_max) (107) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s108")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (108) (vl) ((batch_pre - batch )) (A))) (voutput_min) (108) (vl))) (voutput_max) (108) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s109")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (109) (vl) ((batch_pre - batch )) (A))) (voutput_min) (109) (vl))) (voutput_max) (109) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s110")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (110) (vl) ((batch_pre - batch )) (A))) (voutput_min) (110) (vl))) (voutput_max) (110) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s111")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (111) (vl) ((batch_pre - batch )) (A))) (voutput_min) (111) (vl))) (voutput_max) (111) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s112")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (112) (vl) ((batch_pre - batch )) (A))) (voutput_min) (112) (vl))) (voutput_max) (112) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s113")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (113) (vl) ((batch_pre - batch )) (A))) (voutput_min) (113) (vl))) (voutput_max) (113) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s114")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (114) (vl) ((batch_pre - batch )) (A))) (voutput_min) (114) (vl))) (voutput_max) (114) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s115")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (115) (vl) ((batch_pre - batch )) (A))) (voutput_min) (115) (vl))) (voutput_max) (115) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s116")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (116) (vl) ((batch_pre - batch )) (A))) (voutput_min) (116) (vl))) (voutput_max) (116) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s117")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (117) (vl) ((batch_pre - batch )) (A))) (voutput_min) (117) (vl))) (voutput_max) (117) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s118")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (118) (vl) ((batch_pre - batch )) (A))) (voutput_min) (118) (vl))) (voutput_max) (118) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s119")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (119) (vl) ((batch_pre - batch )) (A))) (voutput_min) (119) (vl))) (voutput_max) (119) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s120")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (120) (vl) ((batch_pre - batch )) (A))) (voutput_min) (120) (vl))) (voutput_max) (120) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s121")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (121) (vl) ((batch_pre - batch )) (A))) (voutput_min) (121) (vl))) (voutput_max) (121) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s122")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (122) (vl) ((batch_pre - batch )) (A))) (voutput_min) (122) (vl))) (voutput_max) (122) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s123")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (123) (vl) ((batch_pre - batch )) (A))) (voutput_min) (123) (vl))) (voutput_max) (123) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s124")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (124) (vl) ((batch_pre - batch )) (A))) (voutput_min) (124) (vl))) (voutput_max) (124) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s125")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (125) (vl) ((batch_pre - batch )) (A))) (voutput_min) (125) (vl))) (voutput_max) (125) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s126")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (126) (vl) ((batch_pre - batch )) (A))) (voutput_min) (126) (vl))) (voutput_max) (126) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s127")) # Char  |-> (s8_rvv_min_lane ((s8_rvv_max_lane ((s8_read_lane (127) (vl) ((batch_pre - batch )) (A))) (voutput_min) (127) (vl))) (voutput_max) (127) (vl)))
  **  (CharArray.undef_full output vl )
  **  (CharArray.undef_full (output + (vl * sizeof(CHAR))) (batch - vl ) )
  **  (CharArray.full input_pre (batch_pre + 7 ) A )
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
  **  (CharArray.full output_pre (batch_pre - batch ) (s8_rvv_progress ((batch_pre - batch )) (batch_pre) ((s8_narrow (RawLo))) ((s8_narrow (RawHi))) (A)) )
.

Definition test_rvv_partial_solve_wit_12 := test_rvv_partial_solve_wit_12_pure -> test_rvv_partial_solve_wit_12_aux.

Definition test_rvv_partial_solve_wit_13_pure := 
forall (params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (RawHi: Z) (RawLo: Z) (A: (@list Z)) (voutput_max: Z) (voutput_min: Z) (output: Z) (input: Z) (batch: Z) (batch64: Z) (PreH1 : (batch > 0)) (PreH2 : (batch64 = 0)) (PreH3 : (0 < batch_pre)) (PreH4 : (batch_pre <= 18446744073709551608)) (PreH5 : (sizeof(CHAR) = 1)) (PreH6 : ((Zlength (A)) = (batch_pre + 7 ))) (PreH7 : (0 <= batch)) (PreH8 : (batch <= batch_pre)) (PreH9 : (input = (input_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH10 : (batch > 0)) (PreH11 : (output = (output_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH12 : (voutput_min = (s8_narrow (RawLo)))) (PreH13 : (voutput_max = (s8_narrow (RawHi)))) (PreH14 : ((-128) <= voutput_min)) (PreH15 : (voutput_min <= 127)) (PreH16 : ((-128) <= voutput_max)) (PreH17 : (voutput_max <= 127)) (PreH18 : ((s8_bulk_count (batch_pre)) <= (batch_pre - batch ))) ,
  ((( &( "vl" ) )) # UInt64  |->_)
  **  ((( &( "batch64" ) )) # UInt64  |-> batch64)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "batch" ) )) # UInt64  |-> batch)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "voutput_min" ) )) # Char  |-> voutput_min)
  **  ((( &( "voutput_max" ) )) # Char  |-> voutput_max)
  **  (CharArray.full input_pre (batch_pre + 7 ) A )
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
  **  (CharArray.full output_pre (batch_pre - batch ) (s8_rvv_progress ((batch_pre - batch )) (batch_pre) ((s8_narrow (RawLo))) ((s8_narrow (RawHi))) (A)) )
  **  (CharArray.undef_full output batch )
|--
  “ (0 <= batch) ” 
  &&  “ (batch <= UINT64_MAX) ”
.

Definition test_rvv_partial_solve_wit_13_aux := 
forall (params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (RawHi: Z) (RawLo: Z) (A: (@list Z)) (voutput_max: Z) (voutput_min: Z) (output: Z) (input: Z) (batch: Z) (batch64: Z) (PreH1 : (batch > 0)) (PreH2 : (batch64 = 0)) (PreH3 : (0 < batch_pre)) (PreH4 : (batch_pre <= 18446744073709551608)) (PreH5 : (sizeof(CHAR) = 1)) (PreH6 : ((Zlength (A)) = (batch_pre + 7 ))) (PreH7 : (0 <= batch)) (PreH8 : (batch <= batch_pre)) (PreH9 : (input = (input_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH10 : (batch > 0)) (PreH11 : (output = (output_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH12 : (voutput_min = (s8_narrow (RawLo)))) (PreH13 : (voutput_max = (s8_narrow (RawHi)))) (PreH14 : ((-128) <= voutput_min)) (PreH15 : (voutput_min <= 127)) (PreH16 : ((-128) <= voutput_max)) (PreH17 : (voutput_max <= 127)) (PreH18 : ((s8_bulk_count (batch_pre)) <= (batch_pre - batch ))) ,
  (CharArray.full input_pre (batch_pre + 7 ) A )
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
  **  (CharArray.full output_pre (batch_pre - batch ) (s8_rvv_progress ((batch_pre - batch )) (batch_pre) ((s8_narrow (RawLo))) ((s8_narrow (RawHi))) (A)) )
  **  (CharArray.undef_full output batch )
|--
  “ (0 <= batch) ” 
  &&  “ (batch <= UINT64_MAX) ” 
  &&  “ (batch > 0) ” 
  &&  “ (batch64 = 0) ” 
  &&  “ (0 < batch_pre) ” 
  &&  “ (batch_pre <= 18446744073709551608) ” 
  &&  “ (sizeof(CHAR) = 1) ” 
  &&  “ ((Zlength (A)) = (batch_pre + 7 )) ” 
  &&  “ (0 <= batch) ” 
  &&  “ (batch <= batch_pre) ” 
  &&  “ (input = (input_pre + ((batch_pre - batch ) * sizeof(CHAR)))) ” 
  &&  “ (batch > 0) ” 
  &&  “ (output = (output_pre + ((batch_pre - batch ) * sizeof(CHAR)))) ” 
  &&  “ (voutput_min = (s8_narrow (RawLo))) ” 
  &&  “ (voutput_max = (s8_narrow (RawHi))) ” 
  &&  “ ((-128) <= voutput_min) ” 
  &&  “ (voutput_min <= 127) ” 
  &&  “ ((-128) <= voutput_max) ” 
  &&  “ (voutput_max <= 127) ” 
  &&  “ ((s8_bulk_count (batch_pre)) <= (batch_pre - batch )) ”
  &&  (CharArray.full input_pre (batch_pre + 7 ) A )
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
  **  (CharArray.full output_pre (batch_pre - batch ) (s8_rvv_progress ((batch_pre - batch )) (batch_pre) ((s8_narrow (RawLo))) ((s8_narrow (RawHi))) (A)) )
  **  (CharArray.undef_full output batch )
.

Definition test_rvv_partial_solve_wit_13 := test_rvv_partial_solve_wit_13_pure -> test_rvv_partial_solve_wit_13_aux.

Definition test_rvv_partial_solve_wit_14_pure := 
forall (params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (RawHi: Z) (RawLo: Z) (A: (@list Z)) (batch64: Z) (vl: Z) (batch: Z) (input: Z) (output: Z) (voutput_min: Z) (voutput_max: Z) (PreH1 : (batch64 = 0)) (PreH2 : (0 < vl)) (PreH3 : (vl <= 128)) (PreH4 : (vl <= batch)) (PreH5 : (0 < batch_pre)) (PreH6 : (batch_pre <= 18446744073709551608)) (PreH7 : (sizeof(CHAR) = 1)) (PreH8 : ((Zlength (A)) = (batch_pre + 7 ))) (PreH9 : (0 <= batch)) (PreH10 : (batch <= batch_pre)) (PreH11 : (input = (input_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH12 : (batch > 0)) (PreH13 : (output = (output_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH14 : (voutput_min = (s8_narrow (RawLo)))) (PreH15 : (voutput_max = (s8_narrow (RawHi)))) (PreH16 : ((-128) <= voutput_min)) (PreH17 : (voutput_min <= 127)) (PreH18 : ((-128) <= voutput_max)) (PreH19 : (voutput_max <= 127)) (PreH20 : ((s8_bulk_count (batch_pre)) <= (batch_pre - batch ))) ,
  (UndefStructPredvint8m8_t ( &( "vacc" ) ) )
  **  ((( &( "batch64" ) )) # UInt64  |-> batch64)
  **  ((( &( "vl" ) )) # UInt64  |-> vl)
  **  ((( &( "batch" ) )) # UInt64  |-> batch)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "voutput_min" ) )) # Char  |-> voutput_min)
  **  ((( &( "voutput_max" ) )) # Char  |-> voutput_max)
  **  (CharArray.full input_pre (batch_pre + 7 ) A )
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
  **  (CharArray.full output_pre (batch_pre - batch ) (s8_rvv_progress ((batch_pre - batch )) (batch_pre) ((s8_narrow (RawLo))) ((s8_narrow (RawHi))) (A)) )
  **  (CharArray.undef_full output batch )
|--
  “ (0 <= vl) ” 
  &&  “ (vl <= 128) ” 
  &&  “ (0 <= (batch_pre - batch )) ” 
  &&  “ (((batch_pre - batch ) + vl ) <= (batch_pre + 7 )) ” 
  &&  “ (input = (input_pre + (batch_pre - batch ) )) ”
.

Definition test_rvv_partial_solve_wit_14_aux := 
forall (params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (RawHi: Z) (RawLo: Z) (A: (@list Z)) (batch64: Z) (vl: Z) (batch: Z) (input: Z) (output: Z) (voutput_min: Z) (voutput_max: Z) (PreH1 : (batch64 = 0)) (PreH2 : (0 < vl)) (PreH3 : (vl <= 128)) (PreH4 : (vl <= batch)) (PreH5 : (0 < batch_pre)) (PreH6 : (batch_pre <= 18446744073709551608)) (PreH7 : (sizeof(CHAR) = 1)) (PreH8 : ((Zlength (A)) = (batch_pre + 7 ))) (PreH9 : (0 <= batch)) (PreH10 : (batch <= batch_pre)) (PreH11 : (input = (input_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH12 : (batch > 0)) (PreH13 : (output = (output_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH14 : (voutput_min = (s8_narrow (RawLo)))) (PreH15 : (voutput_max = (s8_narrow (RawHi)))) (PreH16 : ((-128) <= voutput_min)) (PreH17 : (voutput_min <= 127)) (PreH18 : ((-128) <= voutput_max)) (PreH19 : (voutput_max <= 127)) (PreH20 : ((s8_bulk_count (batch_pre)) <= (batch_pre - batch ))) ,
  (UndefStructPredvint8m8_t ( &( "vacc" ) ) )
  **  (CharArray.full input_pre (batch_pre + 7 ) A )
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
  **  (CharArray.full output_pre (batch_pre - batch ) (s8_rvv_progress ((batch_pre - batch )) (batch_pre) ((s8_narrow (RawLo))) ((s8_narrow (RawHi))) (A)) )
  **  (CharArray.undef_full output batch )
|--
  “ (0 <= vl) ” 
  &&  “ (vl <= 128) ” 
  &&  “ (0 <= (batch_pre - batch )) ” 
  &&  “ (((batch_pre - batch ) + vl ) <= (batch_pre + 7 )) ” 
  &&  “ (input = (input_pre + (batch_pre - batch ) )) ” 
  &&  “ (batch64 = 0) ” 
  &&  “ (0 < vl) ” 
  &&  “ (vl <= 128) ” 
  &&  “ (vl <= batch) ” 
  &&  “ (0 < batch_pre) ” 
  &&  “ (batch_pre <= 18446744073709551608) ” 
  &&  “ (sizeof(CHAR) = 1) ” 
  &&  “ ((Zlength (A)) = (batch_pre + 7 )) ” 
  &&  “ (0 <= batch) ” 
  &&  “ (batch <= batch_pre) ” 
  &&  “ (input = (input_pre + ((batch_pre - batch ) * sizeof(CHAR)))) ” 
  &&  “ (batch > 0) ” 
  &&  “ (output = (output_pre + ((batch_pre - batch ) * sizeof(CHAR)))) ” 
  &&  “ (voutput_min = (s8_narrow (RawLo))) ” 
  &&  “ (voutput_max = (s8_narrow (RawHi))) ” 
  &&  “ ((-128) <= voutput_min) ” 
  &&  “ (voutput_min <= 127) ” 
  &&  “ ((-128) <= voutput_max) ” 
  &&  “ (voutput_max <= 127) ” 
  &&  “ ((s8_bulk_count (batch_pre)) <= (batch_pre - batch )) ”
  &&  (CharArray.full input_pre (batch_pre + 7 ) A )
  **  (UndefStructPredvint8m8_t ( &( "vacc" ) ) )
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
  **  (CharArray.full output_pre (batch_pre - batch ) (s8_rvv_progress ((batch_pre - batch )) (batch_pre) ((s8_narrow (RawLo))) ((s8_narrow (RawHi))) (A)) )
  **  (CharArray.undef_full output batch )
.

Definition test_rvv_partial_solve_wit_14 := test_rvv_partial_solve_wit_14_pure -> test_rvv_partial_solve_wit_14_aux.

Definition test_rvv_partial_solve_wit_15 := 
forall (params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (RawHi: Z) (RawLo: Z) (A: (@list Z)) (batch64: Z) (vl: Z) (batch: Z) (input: Z) (output: Z) (voutput_min: Z) (voutput_max: Z) (retval: Z) (PreH1 : (batch64 = 0)) (PreH2 : (0 < vl)) (PreH3 : (vl <= 128)) (PreH4 : (vl <= batch)) (PreH5 : (0 < batch_pre)) (PreH6 : (batch_pre <= 18446744073709551608)) (PreH7 : (sizeof(CHAR) = 1)) (PreH8 : ((Zlength (A)) = (batch_pre + 7 ))) (PreH9 : (0 <= batch)) (PreH10 : (batch <= batch_pre)) (PreH11 : (input = (input_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH12 : (batch > 0)) (PreH13 : (output = (output_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH14 : (voutput_min = (s8_narrow (RawLo)))) (PreH15 : (voutput_max = (s8_narrow (RawHi)))) (PreH16 : ((-128) <= voutput_min)) (PreH17 : (voutput_min <= 127)) (PreH18 : ((-128) <= voutput_max)) (PreH19 : (voutput_max <= 127)) (PreH20 : ((s8_bulk_count (batch_pre)) <= (batch_pre - batch ))) ,
  (CharArray.full input_pre (batch_pre + 7 ) A )
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s0")) # Char  |-> (s8_read_lane (0) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s1")) # Char  |-> (s8_read_lane (1) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s2")) # Char  |-> (s8_read_lane (2) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s3")) # Char  |-> (s8_read_lane (3) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s4")) # Char  |-> (s8_read_lane (4) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s5")) # Char  |-> (s8_read_lane (5) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s6")) # Char  |-> (s8_read_lane (6) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s7")) # Char  |-> (s8_read_lane (7) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s8")) # Char  |-> (s8_read_lane (8) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s9")) # Char  |-> (s8_read_lane (9) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s10")) # Char  |-> (s8_read_lane (10) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s11")) # Char  |-> (s8_read_lane (11) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s12")) # Char  |-> (s8_read_lane (12) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s13")) # Char  |-> (s8_read_lane (13) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s14")) # Char  |-> (s8_read_lane (14) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s15")) # Char  |-> (s8_read_lane (15) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s16")) # Char  |-> (s8_read_lane (16) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s17")) # Char  |-> (s8_read_lane (17) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s18")) # Char  |-> (s8_read_lane (18) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s19")) # Char  |-> (s8_read_lane (19) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s20")) # Char  |-> (s8_read_lane (20) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s21")) # Char  |-> (s8_read_lane (21) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s22")) # Char  |-> (s8_read_lane (22) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s23")) # Char  |-> (s8_read_lane (23) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s24")) # Char  |-> (s8_read_lane (24) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s25")) # Char  |-> (s8_read_lane (25) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s26")) # Char  |-> (s8_read_lane (26) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s27")) # Char  |-> (s8_read_lane (27) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s28")) # Char  |-> (s8_read_lane (28) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s29")) # Char  |-> (s8_read_lane (29) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s30")) # Char  |-> (s8_read_lane (30) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s31")) # Char  |-> (s8_read_lane (31) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s32")) # Char  |-> (s8_read_lane (32) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s33")) # Char  |-> (s8_read_lane (33) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s34")) # Char  |-> (s8_read_lane (34) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s35")) # Char  |-> (s8_read_lane (35) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s36")) # Char  |-> (s8_read_lane (36) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s37")) # Char  |-> (s8_read_lane (37) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s38")) # Char  |-> (s8_read_lane (38) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s39")) # Char  |-> (s8_read_lane (39) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s40")) # Char  |-> (s8_read_lane (40) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s41")) # Char  |-> (s8_read_lane (41) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s42")) # Char  |-> (s8_read_lane (42) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s43")) # Char  |-> (s8_read_lane (43) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s44")) # Char  |-> (s8_read_lane (44) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s45")) # Char  |-> (s8_read_lane (45) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s46")) # Char  |-> (s8_read_lane (46) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s47")) # Char  |-> (s8_read_lane (47) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s48")) # Char  |-> (s8_read_lane (48) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s49")) # Char  |-> (s8_read_lane (49) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s50")) # Char  |-> (s8_read_lane (50) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s51")) # Char  |-> (s8_read_lane (51) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s52")) # Char  |-> (s8_read_lane (52) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s53")) # Char  |-> (s8_read_lane (53) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s54")) # Char  |-> (s8_read_lane (54) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s55")) # Char  |-> (s8_read_lane (55) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s56")) # Char  |-> (s8_read_lane (56) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s57")) # Char  |-> (s8_read_lane (57) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s58")) # Char  |-> (s8_read_lane (58) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s59")) # Char  |-> (s8_read_lane (59) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s60")) # Char  |-> (s8_read_lane (60) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s61")) # Char  |-> (s8_read_lane (61) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s62")) # Char  |-> (s8_read_lane (62) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s63")) # Char  |-> (s8_read_lane (63) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s64")) # Char  |-> (s8_read_lane (64) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s65")) # Char  |-> (s8_read_lane (65) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s66")) # Char  |-> (s8_read_lane (66) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s67")) # Char  |-> (s8_read_lane (67) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s68")) # Char  |-> (s8_read_lane (68) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s69")) # Char  |-> (s8_read_lane (69) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s70")) # Char  |-> (s8_read_lane (70) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s71")) # Char  |-> (s8_read_lane (71) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s72")) # Char  |-> (s8_read_lane (72) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s73")) # Char  |-> (s8_read_lane (73) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s74")) # Char  |-> (s8_read_lane (74) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s75")) # Char  |-> (s8_read_lane (75) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s76")) # Char  |-> (s8_read_lane (76) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s77")) # Char  |-> (s8_read_lane (77) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s78")) # Char  |-> (s8_read_lane (78) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s79")) # Char  |-> (s8_read_lane (79) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s80")) # Char  |-> (s8_read_lane (80) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s81")) # Char  |-> (s8_read_lane (81) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s82")) # Char  |-> (s8_read_lane (82) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s83")) # Char  |-> (s8_read_lane (83) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s84")) # Char  |-> (s8_read_lane (84) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s85")) # Char  |-> (s8_read_lane (85) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s86")) # Char  |-> (s8_read_lane (86) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s87")) # Char  |-> (s8_read_lane (87) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s88")) # Char  |-> (s8_read_lane (88) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s89")) # Char  |-> (s8_read_lane (89) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s90")) # Char  |-> (s8_read_lane (90) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s91")) # Char  |-> (s8_read_lane (91) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s92")) # Char  |-> (s8_read_lane (92) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s93")) # Char  |-> (s8_read_lane (93) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s94")) # Char  |-> (s8_read_lane (94) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s95")) # Char  |-> (s8_read_lane (95) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s96")) # Char  |-> (s8_read_lane (96) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s97")) # Char  |-> (s8_read_lane (97) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s98")) # Char  |-> (s8_read_lane (98) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s99")) # Char  |-> (s8_read_lane (99) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s100")) # Char  |-> (s8_read_lane (100) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s101")) # Char  |-> (s8_read_lane (101) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s102")) # Char  |-> (s8_read_lane (102) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s103")) # Char  |-> (s8_read_lane (103) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s104")) # Char  |-> (s8_read_lane (104) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s105")) # Char  |-> (s8_read_lane (105) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s106")) # Char  |-> (s8_read_lane (106) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s107")) # Char  |-> (s8_read_lane (107) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s108")) # Char  |-> (s8_read_lane (108) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s109")) # Char  |-> (s8_read_lane (109) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s110")) # Char  |-> (s8_read_lane (110) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s111")) # Char  |-> (s8_read_lane (111) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s112")) # Char  |-> (s8_read_lane (112) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s113")) # Char  |-> (s8_read_lane (113) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s114")) # Char  |-> (s8_read_lane (114) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s115")) # Char  |-> (s8_read_lane (115) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s116")) # Char  |-> (s8_read_lane (116) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s117")) # Char  |-> (s8_read_lane (117) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s118")) # Char  |-> (s8_read_lane (118) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s119")) # Char  |-> (s8_read_lane (119) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s120")) # Char  |-> (s8_read_lane (120) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s121")) # Char  |-> (s8_read_lane (121) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s122")) # Char  |-> (s8_read_lane (122) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s123")) # Char  |-> (s8_read_lane (123) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s124")) # Char  |-> (s8_read_lane (124) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s125")) # Char  |-> (s8_read_lane (125) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s126")) # Char  |-> (s8_read_lane (126) (vl) ((batch_pre - batch )) (A)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s127")) # Char  |-> (s8_read_lane (127) (vl) ((batch_pre - batch )) (A)))
  **  (UndefStructPredvint8m8_t ( &( "vacc" ) ) )
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
  **  (CharArray.full output_pre (batch_pre - batch ) (s8_rvv_progress ((batch_pre - batch )) (batch_pre) ((s8_narrow (RawLo))) ((s8_narrow (RawHi))) (A)) )
  **  (CharArray.undef_full output batch )
|--
  “ (batch64 = 0) ” 
  &&  “ (0 < vl) ” 
  &&  “ (vl <= 128) ” 
  &&  “ (vl <= batch) ” 
  &&  “ (0 < batch_pre) ” 
  &&  “ (batch_pre <= 18446744073709551608) ” 
  &&  “ (sizeof(CHAR) = 1) ” 
  &&  “ ((Zlength (A)) = (batch_pre + 7 )) ” 
  &&  “ (0 <= batch) ” 
  &&  “ (batch <= batch_pre) ” 
  &&  “ (input = (input_pre + ((batch_pre - batch ) * sizeof(CHAR)))) ” 
  &&  “ (batch > 0) ” 
  &&  “ (output = (output_pre + ((batch_pre - batch ) * sizeof(CHAR)))) ” 
  &&  “ (voutput_min = (s8_narrow (RawLo))) ” 
  &&  “ (voutput_max = (s8_narrow (RawHi))) ” 
  &&  “ ((-128) <= voutput_min) ” 
  &&  “ (voutput_min <= 127) ” 
  &&  “ ((-128) <= voutput_max) ” 
  &&  “ (voutput_max <= 127) ” 
  &&  “ ((s8_bulk_count (batch_pre)) <= (batch_pre - batch )) ”
  &&  ((&(( &( "vacc" ) )->ₛ "s127")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s127")) # Char  |-> (s8_read_lane (127) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s126")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s126")) # Char  |-> (s8_read_lane (126) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s125")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s125")) # Char  |-> (s8_read_lane (125) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s124")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s124")) # Char  |-> (s8_read_lane (124) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s123")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s123")) # Char  |-> (s8_read_lane (123) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s122")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s122")) # Char  |-> (s8_read_lane (122) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s121")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s121")) # Char  |-> (s8_read_lane (121) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s120")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s120")) # Char  |-> (s8_read_lane (120) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s119")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s119")) # Char  |-> (s8_read_lane (119) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s118")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s118")) # Char  |-> (s8_read_lane (118) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s117")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s117")) # Char  |-> (s8_read_lane (117) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s116")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s116")) # Char  |-> (s8_read_lane (116) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s115")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s115")) # Char  |-> (s8_read_lane (115) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s114")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s114")) # Char  |-> (s8_read_lane (114) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s113")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s113")) # Char  |-> (s8_read_lane (113) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s112")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s112")) # Char  |-> (s8_read_lane (112) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s111")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s111")) # Char  |-> (s8_read_lane (111) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s110")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s110")) # Char  |-> (s8_read_lane (110) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s109")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s109")) # Char  |-> (s8_read_lane (109) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s108")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s108")) # Char  |-> (s8_read_lane (108) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s107")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s107")) # Char  |-> (s8_read_lane (107) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s106")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s106")) # Char  |-> (s8_read_lane (106) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s105")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s105")) # Char  |-> (s8_read_lane (105) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s104")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s104")) # Char  |-> (s8_read_lane (104) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s103")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s103")) # Char  |-> (s8_read_lane (103) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s102")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s102")) # Char  |-> (s8_read_lane (102) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s101")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s101")) # Char  |-> (s8_read_lane (101) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s100")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s100")) # Char  |-> (s8_read_lane (100) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s99")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s99")) # Char  |-> (s8_read_lane (99) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s98")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s98")) # Char  |-> (s8_read_lane (98) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s97")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s97")) # Char  |-> (s8_read_lane (97) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s96")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s96")) # Char  |-> (s8_read_lane (96) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s95")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s95")) # Char  |-> (s8_read_lane (95) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s94")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s94")) # Char  |-> (s8_read_lane (94) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s93")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s93")) # Char  |-> (s8_read_lane (93) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s92")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s92")) # Char  |-> (s8_read_lane (92) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s91")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s91")) # Char  |-> (s8_read_lane (91) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s90")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s90")) # Char  |-> (s8_read_lane (90) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s89")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s89")) # Char  |-> (s8_read_lane (89) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s88")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s88")) # Char  |-> (s8_read_lane (88) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s87")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s87")) # Char  |-> (s8_read_lane (87) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s86")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s86")) # Char  |-> (s8_read_lane (86) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s85")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s85")) # Char  |-> (s8_read_lane (85) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s84")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s84")) # Char  |-> (s8_read_lane (84) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s83")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s83")) # Char  |-> (s8_read_lane (83) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s82")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s82")) # Char  |-> (s8_read_lane (82) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s81")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s81")) # Char  |-> (s8_read_lane (81) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s80")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s80")) # Char  |-> (s8_read_lane (80) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s79")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s79")) # Char  |-> (s8_read_lane (79) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s78")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s78")) # Char  |-> (s8_read_lane (78) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s77")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s77")) # Char  |-> (s8_read_lane (77) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s76")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s76")) # Char  |-> (s8_read_lane (76) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s75")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s75")) # Char  |-> (s8_read_lane (75) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s74")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s74")) # Char  |-> (s8_read_lane (74) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s73")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s73")) # Char  |-> (s8_read_lane (73) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s72")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s72")) # Char  |-> (s8_read_lane (72) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s71")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s71")) # Char  |-> (s8_read_lane (71) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s70")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s70")) # Char  |-> (s8_read_lane (70) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s69")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s69")) # Char  |-> (s8_read_lane (69) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s68")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s68")) # Char  |-> (s8_read_lane (68) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s67")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s67")) # Char  |-> (s8_read_lane (67) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s66")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s66")) # Char  |-> (s8_read_lane (66) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s65")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s65")) # Char  |-> (s8_read_lane (65) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s64")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s64")) # Char  |-> (s8_read_lane (64) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s63")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s63")) # Char  |-> (s8_read_lane (63) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s62")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s62")) # Char  |-> (s8_read_lane (62) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s61")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s61")) # Char  |-> (s8_read_lane (61) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s60")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s60")) # Char  |-> (s8_read_lane (60) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s59")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s59")) # Char  |-> (s8_read_lane (59) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s58")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s58")) # Char  |-> (s8_read_lane (58) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s57")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s57")) # Char  |-> (s8_read_lane (57) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s56")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s56")) # Char  |-> (s8_read_lane (56) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s55")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s55")) # Char  |-> (s8_read_lane (55) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s54")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s54")) # Char  |-> (s8_read_lane (54) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s53")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s53")) # Char  |-> (s8_read_lane (53) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s52")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s52")) # Char  |-> (s8_read_lane (52) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s51")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s51")) # Char  |-> (s8_read_lane (51) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s50")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s50")) # Char  |-> (s8_read_lane (50) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s49")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s49")) # Char  |-> (s8_read_lane (49) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s48")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s48")) # Char  |-> (s8_read_lane (48) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s47")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s47")) # Char  |-> (s8_read_lane (47) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s46")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s46")) # Char  |-> (s8_read_lane (46) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s45")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s45")) # Char  |-> (s8_read_lane (45) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s44")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s44")) # Char  |-> (s8_read_lane (44) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s43")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s43")) # Char  |-> (s8_read_lane (43) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s42")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s42")) # Char  |-> (s8_read_lane (42) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s41")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s41")) # Char  |-> (s8_read_lane (41) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s40")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s40")) # Char  |-> (s8_read_lane (40) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s39")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s39")) # Char  |-> (s8_read_lane (39) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s38")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s38")) # Char  |-> (s8_read_lane (38) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s37")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s37")) # Char  |-> (s8_read_lane (37) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s36")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s36")) # Char  |-> (s8_read_lane (36) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s35")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s35")) # Char  |-> (s8_read_lane (35) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s34")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s34")) # Char  |-> (s8_read_lane (34) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s33")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s33")) # Char  |-> (s8_read_lane (33) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s32")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s32")) # Char  |-> (s8_read_lane (32) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s31")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s31")) # Char  |-> (s8_read_lane (31) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s30")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s30")) # Char  |-> (s8_read_lane (30) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s29")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s29")) # Char  |-> (s8_read_lane (29) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s28")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s28")) # Char  |-> (s8_read_lane (28) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s27")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s27")) # Char  |-> (s8_read_lane (27) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s26")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s26")) # Char  |-> (s8_read_lane (26) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s25")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s25")) # Char  |-> (s8_read_lane (25) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s24")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s24")) # Char  |-> (s8_read_lane (24) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s23")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s23")) # Char  |-> (s8_read_lane (23) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s22")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s22")) # Char  |-> (s8_read_lane (22) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s21")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s21")) # Char  |-> (s8_read_lane (21) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s20")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s20")) # Char  |-> (s8_read_lane (20) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s19")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s19")) # Char  |-> (s8_read_lane (19) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s18")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s18")) # Char  |-> (s8_read_lane (18) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s17")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s17")) # Char  |-> (s8_read_lane (17) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s16")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s16")) # Char  |-> (s8_read_lane (16) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s15")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s15")) # Char  |-> (s8_read_lane (15) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s14")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s14")) # Char  |-> (s8_read_lane (14) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s13")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s13")) # Char  |-> (s8_read_lane (13) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s12")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s12")) # Char  |-> (s8_read_lane (12) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s11")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s11")) # Char  |-> (s8_read_lane (11) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s10")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s10")) # Char  |-> (s8_read_lane (10) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s9")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s9")) # Char  |-> (s8_read_lane (9) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s8")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s8")) # Char  |-> (s8_read_lane (8) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s7")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s7")) # Char  |-> (s8_read_lane (7) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s6")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s6")) # Char  |-> (s8_read_lane (6) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s5")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s5")) # Char  |-> (s8_read_lane (5) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s4")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s4")) # Char  |-> (s8_read_lane (4) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s3")) # Char  |-> (s8_read_lane (3) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s2")) # Char  |-> (s8_read_lane (2) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s1")) # Char  |-> (s8_read_lane (1) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s0")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s0")) # Char  |-> (s8_read_lane (0) (vl) ((batch_pre - batch )) (A)))
  **  (CharArray.full input_pre (batch_pre + 7 ) A )
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
  **  (CharArray.full output_pre (batch_pre - batch ) (s8_rvv_progress ((batch_pre - batch )) (batch_pre) ((s8_narrow (RawLo))) ((s8_narrow (RawHi))) (A)) )
  **  (CharArray.undef_full output batch )
.

Definition test_rvv_partial_solve_wit_16_pure := 
forall (params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (RawHi: Z) (RawLo: Z) (A: (@list Z)) (batch64: Z) (vl: Z) (batch: Z) (input: Z) (output: Z) (voutput_min: Z) (voutput_max: Z) (PreH1 : (batch64 = 0)) (PreH2 : (0 < vl)) (PreH3 : (vl <= 128)) (PreH4 : (vl <= batch)) (PreH5 : (0 < batch_pre)) (PreH6 : (batch_pre <= 18446744073709551608)) (PreH7 : (sizeof(CHAR) = 1)) (PreH8 : ((Zlength (A)) = (batch_pre + 7 ))) (PreH9 : (0 <= batch)) (PreH10 : (batch <= batch_pre)) (PreH11 : (input = (input_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH12 : (batch > 0)) (PreH13 : (output = (output_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH14 : (voutput_min = (s8_narrow (RawLo)))) (PreH15 : (voutput_max = (s8_narrow (RawHi)))) (PreH16 : ((-128) <= voutput_min)) (PreH17 : (voutput_min <= 127)) (PreH18 : ((-128) <= voutput_max)) (PreH19 : (voutput_max <= 127)) (PreH20 : ((s8_bulk_count (batch_pre)) <= (batch_pre - batch ))) ,
  ((&(( &( "vacc" ) )->ₛ "s127")) # Char  |-> (s8_read_lane (127) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s126")) # Char  |-> (s8_read_lane (126) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s125")) # Char  |-> (s8_read_lane (125) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s124")) # Char  |-> (s8_read_lane (124) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s123")) # Char  |-> (s8_read_lane (123) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s122")) # Char  |-> (s8_read_lane (122) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s121")) # Char  |-> (s8_read_lane (121) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s120")) # Char  |-> (s8_read_lane (120) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s119")) # Char  |-> (s8_read_lane (119) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s118")) # Char  |-> (s8_read_lane (118) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s117")) # Char  |-> (s8_read_lane (117) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s116")) # Char  |-> (s8_read_lane (116) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s115")) # Char  |-> (s8_read_lane (115) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s114")) # Char  |-> (s8_read_lane (114) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s113")) # Char  |-> (s8_read_lane (113) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s112")) # Char  |-> (s8_read_lane (112) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s111")) # Char  |-> (s8_read_lane (111) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s110")) # Char  |-> (s8_read_lane (110) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s109")) # Char  |-> (s8_read_lane (109) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s108")) # Char  |-> (s8_read_lane (108) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s107")) # Char  |-> (s8_read_lane (107) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s106")) # Char  |-> (s8_read_lane (106) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s105")) # Char  |-> (s8_read_lane (105) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s104")) # Char  |-> (s8_read_lane (104) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s103")) # Char  |-> (s8_read_lane (103) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s102")) # Char  |-> (s8_read_lane (102) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s101")) # Char  |-> (s8_read_lane (101) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s100")) # Char  |-> (s8_read_lane (100) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s99")) # Char  |-> (s8_read_lane (99) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s98")) # Char  |-> (s8_read_lane (98) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s97")) # Char  |-> (s8_read_lane (97) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s96")) # Char  |-> (s8_read_lane (96) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s95")) # Char  |-> (s8_read_lane (95) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s94")) # Char  |-> (s8_read_lane (94) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s93")) # Char  |-> (s8_read_lane (93) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s92")) # Char  |-> (s8_read_lane (92) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s91")) # Char  |-> (s8_read_lane (91) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s90")) # Char  |-> (s8_read_lane (90) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s89")) # Char  |-> (s8_read_lane (89) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s88")) # Char  |-> (s8_read_lane (88) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s87")) # Char  |-> (s8_read_lane (87) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s86")) # Char  |-> (s8_read_lane (86) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s85")) # Char  |-> (s8_read_lane (85) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s84")) # Char  |-> (s8_read_lane (84) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s83")) # Char  |-> (s8_read_lane (83) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s82")) # Char  |-> (s8_read_lane (82) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s81")) # Char  |-> (s8_read_lane (81) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s80")) # Char  |-> (s8_read_lane (80) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s79")) # Char  |-> (s8_read_lane (79) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s78")) # Char  |-> (s8_read_lane (78) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s77")) # Char  |-> (s8_read_lane (77) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s76")) # Char  |-> (s8_read_lane (76) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s75")) # Char  |-> (s8_read_lane (75) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s74")) # Char  |-> (s8_read_lane (74) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s73")) # Char  |-> (s8_read_lane (73) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s72")) # Char  |-> (s8_read_lane (72) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s71")) # Char  |-> (s8_read_lane (71) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s70")) # Char  |-> (s8_read_lane (70) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s69")) # Char  |-> (s8_read_lane (69) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s68")) # Char  |-> (s8_read_lane (68) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s67")) # Char  |-> (s8_read_lane (67) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s66")) # Char  |-> (s8_read_lane (66) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s65")) # Char  |-> (s8_read_lane (65) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s64")) # Char  |-> (s8_read_lane (64) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s63")) # Char  |-> (s8_read_lane (63) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s62")) # Char  |-> (s8_read_lane (62) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s61")) # Char  |-> (s8_read_lane (61) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s60")) # Char  |-> (s8_read_lane (60) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s59")) # Char  |-> (s8_read_lane (59) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s58")) # Char  |-> (s8_read_lane (58) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s57")) # Char  |-> (s8_read_lane (57) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s56")) # Char  |-> (s8_read_lane (56) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s55")) # Char  |-> (s8_read_lane (55) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s54")) # Char  |-> (s8_read_lane (54) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s53")) # Char  |-> (s8_read_lane (53) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s52")) # Char  |-> (s8_read_lane (52) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s51")) # Char  |-> (s8_read_lane (51) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s50")) # Char  |-> (s8_read_lane (50) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s49")) # Char  |-> (s8_read_lane (49) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s48")) # Char  |-> (s8_read_lane (48) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s47")) # Char  |-> (s8_read_lane (47) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s46")) # Char  |-> (s8_read_lane (46) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s45")) # Char  |-> (s8_read_lane (45) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s44")) # Char  |-> (s8_read_lane (44) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s43")) # Char  |-> (s8_read_lane (43) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s42")) # Char  |-> (s8_read_lane (42) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s41")) # Char  |-> (s8_read_lane (41) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s40")) # Char  |-> (s8_read_lane (40) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s39")) # Char  |-> (s8_read_lane (39) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s38")) # Char  |-> (s8_read_lane (38) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s37")) # Char  |-> (s8_read_lane (37) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s36")) # Char  |-> (s8_read_lane (36) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s35")) # Char  |-> (s8_read_lane (35) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s34")) # Char  |-> (s8_read_lane (34) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s33")) # Char  |-> (s8_read_lane (33) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s32")) # Char  |-> (s8_read_lane (32) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s31")) # Char  |-> (s8_read_lane (31) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s30")) # Char  |-> (s8_read_lane (30) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s29")) # Char  |-> (s8_read_lane (29) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s28")) # Char  |-> (s8_read_lane (28) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s27")) # Char  |-> (s8_read_lane (27) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s26")) # Char  |-> (s8_read_lane (26) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s25")) # Char  |-> (s8_read_lane (25) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s24")) # Char  |-> (s8_read_lane (24) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s23")) # Char  |-> (s8_read_lane (23) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s22")) # Char  |-> (s8_read_lane (22) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s21")) # Char  |-> (s8_read_lane (21) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s20")) # Char  |-> (s8_read_lane (20) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s19")) # Char  |-> (s8_read_lane (19) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s18")) # Char  |-> (s8_read_lane (18) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s17")) # Char  |-> (s8_read_lane (17) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s16")) # Char  |-> (s8_read_lane (16) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s15")) # Char  |-> (s8_read_lane (15) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s14")) # Char  |-> (s8_read_lane (14) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s13")) # Char  |-> (s8_read_lane (13) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s12")) # Char  |-> (s8_read_lane (12) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s11")) # Char  |-> (s8_read_lane (11) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s10")) # Char  |-> (s8_read_lane (10) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s9")) # Char  |-> (s8_read_lane (9) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s8")) # Char  |-> (s8_read_lane (8) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s7")) # Char  |-> (s8_read_lane (7) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s6")) # Char  |-> (s8_read_lane (6) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s5")) # Char  |-> (s8_read_lane (5) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s4")) # Char  |-> (s8_read_lane (4) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # Char  |-> (s8_read_lane (3) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # Char  |-> (s8_read_lane (2) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # Char  |-> (s8_read_lane (1) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s0")) # Char  |-> (s8_read_lane (0) (vl) ((batch_pre - batch )) (A)))
  **  (CharArray.full input_pre (batch_pre + 7 ) A )
  **  ((( &( "batch64" ) )) # UInt64  |-> batch64)
  **  ((( &( "vl" ) )) # UInt64  |-> vl)
  **  ((( &( "batch" ) )) # UInt64  |-> batch)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "voutput_min" ) )) # Char  |-> voutput_min)
  **  ((( &( "voutput_max" ) )) # Char  |-> voutput_max)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
  **  (CharArray.full output_pre (batch_pre - batch ) (s8_rvv_progress ((batch_pre - batch )) (batch_pre) ((s8_narrow (RawLo))) ((s8_narrow (RawHi))) (A)) )
  **  (CharArray.undef_full output batch )
|--
  “ ((-128) <= voutput_max) ” 
  &&  “ (voutput_max <= 127) ” 
  &&  “ (0 <= vl) ” 
  &&  “ (vl <= 128) ”
.

Definition test_rvv_partial_solve_wit_16_aux := 
forall (params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (RawHi: Z) (RawLo: Z) (A: (@list Z)) (batch64: Z) (vl: Z) (batch: Z) (input: Z) (output: Z) (voutput_min: Z) (voutput_max: Z) (PreH1 : (batch64 = 0)) (PreH2 : (0 < vl)) (PreH3 : (vl <= 128)) (PreH4 : (vl <= batch)) (PreH5 : (0 < batch_pre)) (PreH6 : (batch_pre <= 18446744073709551608)) (PreH7 : (sizeof(CHAR) = 1)) (PreH8 : ((Zlength (A)) = (batch_pre + 7 ))) (PreH9 : (0 <= batch)) (PreH10 : (batch <= batch_pre)) (PreH11 : (input = (input_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH12 : (batch > 0)) (PreH13 : (output = (output_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH14 : (voutput_min = (s8_narrow (RawLo)))) (PreH15 : (voutput_max = (s8_narrow (RawHi)))) (PreH16 : ((-128) <= voutput_min)) (PreH17 : (voutput_min <= 127)) (PreH18 : ((-128) <= voutput_max)) (PreH19 : (voutput_max <= 127)) (PreH20 : ((s8_bulk_count (batch_pre)) <= (batch_pre - batch ))) ,
  ((&(( &( "vacc" ) )->ₛ "s127")) # Char  |-> (s8_read_lane (127) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s126")) # Char  |-> (s8_read_lane (126) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s125")) # Char  |-> (s8_read_lane (125) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s124")) # Char  |-> (s8_read_lane (124) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s123")) # Char  |-> (s8_read_lane (123) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s122")) # Char  |-> (s8_read_lane (122) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s121")) # Char  |-> (s8_read_lane (121) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s120")) # Char  |-> (s8_read_lane (120) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s119")) # Char  |-> (s8_read_lane (119) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s118")) # Char  |-> (s8_read_lane (118) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s117")) # Char  |-> (s8_read_lane (117) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s116")) # Char  |-> (s8_read_lane (116) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s115")) # Char  |-> (s8_read_lane (115) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s114")) # Char  |-> (s8_read_lane (114) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s113")) # Char  |-> (s8_read_lane (113) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s112")) # Char  |-> (s8_read_lane (112) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s111")) # Char  |-> (s8_read_lane (111) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s110")) # Char  |-> (s8_read_lane (110) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s109")) # Char  |-> (s8_read_lane (109) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s108")) # Char  |-> (s8_read_lane (108) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s107")) # Char  |-> (s8_read_lane (107) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s106")) # Char  |-> (s8_read_lane (106) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s105")) # Char  |-> (s8_read_lane (105) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s104")) # Char  |-> (s8_read_lane (104) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s103")) # Char  |-> (s8_read_lane (103) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s102")) # Char  |-> (s8_read_lane (102) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s101")) # Char  |-> (s8_read_lane (101) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s100")) # Char  |-> (s8_read_lane (100) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s99")) # Char  |-> (s8_read_lane (99) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s98")) # Char  |-> (s8_read_lane (98) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s97")) # Char  |-> (s8_read_lane (97) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s96")) # Char  |-> (s8_read_lane (96) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s95")) # Char  |-> (s8_read_lane (95) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s94")) # Char  |-> (s8_read_lane (94) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s93")) # Char  |-> (s8_read_lane (93) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s92")) # Char  |-> (s8_read_lane (92) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s91")) # Char  |-> (s8_read_lane (91) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s90")) # Char  |-> (s8_read_lane (90) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s89")) # Char  |-> (s8_read_lane (89) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s88")) # Char  |-> (s8_read_lane (88) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s87")) # Char  |-> (s8_read_lane (87) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s86")) # Char  |-> (s8_read_lane (86) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s85")) # Char  |-> (s8_read_lane (85) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s84")) # Char  |-> (s8_read_lane (84) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s83")) # Char  |-> (s8_read_lane (83) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s82")) # Char  |-> (s8_read_lane (82) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s81")) # Char  |-> (s8_read_lane (81) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s80")) # Char  |-> (s8_read_lane (80) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s79")) # Char  |-> (s8_read_lane (79) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s78")) # Char  |-> (s8_read_lane (78) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s77")) # Char  |-> (s8_read_lane (77) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s76")) # Char  |-> (s8_read_lane (76) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s75")) # Char  |-> (s8_read_lane (75) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s74")) # Char  |-> (s8_read_lane (74) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s73")) # Char  |-> (s8_read_lane (73) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s72")) # Char  |-> (s8_read_lane (72) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s71")) # Char  |-> (s8_read_lane (71) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s70")) # Char  |-> (s8_read_lane (70) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s69")) # Char  |-> (s8_read_lane (69) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s68")) # Char  |-> (s8_read_lane (68) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s67")) # Char  |-> (s8_read_lane (67) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s66")) # Char  |-> (s8_read_lane (66) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s65")) # Char  |-> (s8_read_lane (65) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s64")) # Char  |-> (s8_read_lane (64) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s63")) # Char  |-> (s8_read_lane (63) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s62")) # Char  |-> (s8_read_lane (62) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s61")) # Char  |-> (s8_read_lane (61) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s60")) # Char  |-> (s8_read_lane (60) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s59")) # Char  |-> (s8_read_lane (59) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s58")) # Char  |-> (s8_read_lane (58) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s57")) # Char  |-> (s8_read_lane (57) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s56")) # Char  |-> (s8_read_lane (56) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s55")) # Char  |-> (s8_read_lane (55) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s54")) # Char  |-> (s8_read_lane (54) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s53")) # Char  |-> (s8_read_lane (53) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s52")) # Char  |-> (s8_read_lane (52) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s51")) # Char  |-> (s8_read_lane (51) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s50")) # Char  |-> (s8_read_lane (50) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s49")) # Char  |-> (s8_read_lane (49) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s48")) # Char  |-> (s8_read_lane (48) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s47")) # Char  |-> (s8_read_lane (47) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s46")) # Char  |-> (s8_read_lane (46) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s45")) # Char  |-> (s8_read_lane (45) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s44")) # Char  |-> (s8_read_lane (44) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s43")) # Char  |-> (s8_read_lane (43) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s42")) # Char  |-> (s8_read_lane (42) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s41")) # Char  |-> (s8_read_lane (41) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s40")) # Char  |-> (s8_read_lane (40) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s39")) # Char  |-> (s8_read_lane (39) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s38")) # Char  |-> (s8_read_lane (38) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s37")) # Char  |-> (s8_read_lane (37) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s36")) # Char  |-> (s8_read_lane (36) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s35")) # Char  |-> (s8_read_lane (35) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s34")) # Char  |-> (s8_read_lane (34) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s33")) # Char  |-> (s8_read_lane (33) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s32")) # Char  |-> (s8_read_lane (32) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s31")) # Char  |-> (s8_read_lane (31) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s30")) # Char  |-> (s8_read_lane (30) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s29")) # Char  |-> (s8_read_lane (29) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s28")) # Char  |-> (s8_read_lane (28) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s27")) # Char  |-> (s8_read_lane (27) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s26")) # Char  |-> (s8_read_lane (26) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s25")) # Char  |-> (s8_read_lane (25) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s24")) # Char  |-> (s8_read_lane (24) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s23")) # Char  |-> (s8_read_lane (23) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s22")) # Char  |-> (s8_read_lane (22) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s21")) # Char  |-> (s8_read_lane (21) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s20")) # Char  |-> (s8_read_lane (20) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s19")) # Char  |-> (s8_read_lane (19) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s18")) # Char  |-> (s8_read_lane (18) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s17")) # Char  |-> (s8_read_lane (17) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s16")) # Char  |-> (s8_read_lane (16) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s15")) # Char  |-> (s8_read_lane (15) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s14")) # Char  |-> (s8_read_lane (14) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s13")) # Char  |-> (s8_read_lane (13) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s12")) # Char  |-> (s8_read_lane (12) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s11")) # Char  |-> (s8_read_lane (11) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s10")) # Char  |-> (s8_read_lane (10) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s9")) # Char  |-> (s8_read_lane (9) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s8")) # Char  |-> (s8_read_lane (8) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s7")) # Char  |-> (s8_read_lane (7) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s6")) # Char  |-> (s8_read_lane (6) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s5")) # Char  |-> (s8_read_lane (5) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s4")) # Char  |-> (s8_read_lane (4) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # Char  |-> (s8_read_lane (3) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # Char  |-> (s8_read_lane (2) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # Char  |-> (s8_read_lane (1) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s0")) # Char  |-> (s8_read_lane (0) (vl) ((batch_pre - batch )) (A)))
  **  (CharArray.full input_pre (batch_pre + 7 ) A )
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
  **  (CharArray.full output_pre (batch_pre - batch ) (s8_rvv_progress ((batch_pre - batch )) (batch_pre) ((s8_narrow (RawLo))) ((s8_narrow (RawHi))) (A)) )
  **  (CharArray.undef_full output batch )
|--
  “ ((-128) <= voutput_max) ” 
  &&  “ (voutput_max <= 127) ” 
  &&  “ (0 <= vl) ” 
  &&  “ (vl <= 128) ” 
  &&  “ (batch64 = 0) ” 
  &&  “ (0 < vl) ” 
  &&  “ (vl <= 128) ” 
  &&  “ (vl <= batch) ” 
  &&  “ (0 < batch_pre) ” 
  &&  “ (batch_pre <= 18446744073709551608) ” 
  &&  “ (sizeof(CHAR) = 1) ” 
  &&  “ ((Zlength (A)) = (batch_pre + 7 )) ” 
  &&  “ (0 <= batch) ” 
  &&  “ (batch <= batch_pre) ” 
  &&  “ (input = (input_pre + ((batch_pre - batch ) * sizeof(CHAR)))) ” 
  &&  “ (batch > 0) ” 
  &&  “ (output = (output_pre + ((batch_pre - batch ) * sizeof(CHAR)))) ” 
  &&  “ (voutput_min = (s8_narrow (RawLo))) ” 
  &&  “ (voutput_max = (s8_narrow (RawHi))) ” 
  &&  “ ((-128) <= voutput_min) ” 
  &&  “ (voutput_min <= 127) ” 
  &&  “ ((-128) <= voutput_max) ” 
  &&  “ (voutput_max <= 127) ” 
  &&  “ ((s8_bulk_count (batch_pre)) <= (batch_pre - batch )) ”
  &&  ((&(( &( "vacc" ) )->ₛ "s0")) # Char  |-> (s8_read_lane (0) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # Char  |-> (s8_read_lane (1) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # Char  |-> (s8_read_lane (2) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # Char  |-> (s8_read_lane (3) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s4")) # Char  |-> (s8_read_lane (4) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s5")) # Char  |-> (s8_read_lane (5) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s6")) # Char  |-> (s8_read_lane (6) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s7")) # Char  |-> (s8_read_lane (7) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s8")) # Char  |-> (s8_read_lane (8) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s9")) # Char  |-> (s8_read_lane (9) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s10")) # Char  |-> (s8_read_lane (10) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s11")) # Char  |-> (s8_read_lane (11) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s12")) # Char  |-> (s8_read_lane (12) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s13")) # Char  |-> (s8_read_lane (13) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s14")) # Char  |-> (s8_read_lane (14) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s15")) # Char  |-> (s8_read_lane (15) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s16")) # Char  |-> (s8_read_lane (16) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s17")) # Char  |-> (s8_read_lane (17) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s18")) # Char  |-> (s8_read_lane (18) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s19")) # Char  |-> (s8_read_lane (19) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s20")) # Char  |-> (s8_read_lane (20) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s21")) # Char  |-> (s8_read_lane (21) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s22")) # Char  |-> (s8_read_lane (22) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s23")) # Char  |-> (s8_read_lane (23) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s24")) # Char  |-> (s8_read_lane (24) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s25")) # Char  |-> (s8_read_lane (25) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s26")) # Char  |-> (s8_read_lane (26) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s27")) # Char  |-> (s8_read_lane (27) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s28")) # Char  |-> (s8_read_lane (28) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s29")) # Char  |-> (s8_read_lane (29) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s30")) # Char  |-> (s8_read_lane (30) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s31")) # Char  |-> (s8_read_lane (31) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s32")) # Char  |-> (s8_read_lane (32) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s33")) # Char  |-> (s8_read_lane (33) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s34")) # Char  |-> (s8_read_lane (34) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s35")) # Char  |-> (s8_read_lane (35) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s36")) # Char  |-> (s8_read_lane (36) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s37")) # Char  |-> (s8_read_lane (37) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s38")) # Char  |-> (s8_read_lane (38) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s39")) # Char  |-> (s8_read_lane (39) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s40")) # Char  |-> (s8_read_lane (40) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s41")) # Char  |-> (s8_read_lane (41) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s42")) # Char  |-> (s8_read_lane (42) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s43")) # Char  |-> (s8_read_lane (43) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s44")) # Char  |-> (s8_read_lane (44) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s45")) # Char  |-> (s8_read_lane (45) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s46")) # Char  |-> (s8_read_lane (46) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s47")) # Char  |-> (s8_read_lane (47) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s48")) # Char  |-> (s8_read_lane (48) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s49")) # Char  |-> (s8_read_lane (49) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s50")) # Char  |-> (s8_read_lane (50) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s51")) # Char  |-> (s8_read_lane (51) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s52")) # Char  |-> (s8_read_lane (52) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s53")) # Char  |-> (s8_read_lane (53) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s54")) # Char  |-> (s8_read_lane (54) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s55")) # Char  |-> (s8_read_lane (55) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s56")) # Char  |-> (s8_read_lane (56) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s57")) # Char  |-> (s8_read_lane (57) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s58")) # Char  |-> (s8_read_lane (58) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s59")) # Char  |-> (s8_read_lane (59) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s60")) # Char  |-> (s8_read_lane (60) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s61")) # Char  |-> (s8_read_lane (61) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s62")) # Char  |-> (s8_read_lane (62) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s63")) # Char  |-> (s8_read_lane (63) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s64")) # Char  |-> (s8_read_lane (64) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s65")) # Char  |-> (s8_read_lane (65) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s66")) # Char  |-> (s8_read_lane (66) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s67")) # Char  |-> (s8_read_lane (67) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s68")) # Char  |-> (s8_read_lane (68) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s69")) # Char  |-> (s8_read_lane (69) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s70")) # Char  |-> (s8_read_lane (70) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s71")) # Char  |-> (s8_read_lane (71) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s72")) # Char  |-> (s8_read_lane (72) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s73")) # Char  |-> (s8_read_lane (73) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s74")) # Char  |-> (s8_read_lane (74) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s75")) # Char  |-> (s8_read_lane (75) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s76")) # Char  |-> (s8_read_lane (76) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s77")) # Char  |-> (s8_read_lane (77) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s78")) # Char  |-> (s8_read_lane (78) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s79")) # Char  |-> (s8_read_lane (79) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s80")) # Char  |-> (s8_read_lane (80) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s81")) # Char  |-> (s8_read_lane (81) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s82")) # Char  |-> (s8_read_lane (82) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s83")) # Char  |-> (s8_read_lane (83) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s84")) # Char  |-> (s8_read_lane (84) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s85")) # Char  |-> (s8_read_lane (85) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s86")) # Char  |-> (s8_read_lane (86) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s87")) # Char  |-> (s8_read_lane (87) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s88")) # Char  |-> (s8_read_lane (88) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s89")) # Char  |-> (s8_read_lane (89) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s90")) # Char  |-> (s8_read_lane (90) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s91")) # Char  |-> (s8_read_lane (91) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s92")) # Char  |-> (s8_read_lane (92) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s93")) # Char  |-> (s8_read_lane (93) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s94")) # Char  |-> (s8_read_lane (94) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s95")) # Char  |-> (s8_read_lane (95) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s96")) # Char  |-> (s8_read_lane (96) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s97")) # Char  |-> (s8_read_lane (97) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s98")) # Char  |-> (s8_read_lane (98) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s99")) # Char  |-> (s8_read_lane (99) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s100")) # Char  |-> (s8_read_lane (100) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s101")) # Char  |-> (s8_read_lane (101) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s102")) # Char  |-> (s8_read_lane (102) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s103")) # Char  |-> (s8_read_lane (103) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s104")) # Char  |-> (s8_read_lane (104) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s105")) # Char  |-> (s8_read_lane (105) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s106")) # Char  |-> (s8_read_lane (106) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s107")) # Char  |-> (s8_read_lane (107) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s108")) # Char  |-> (s8_read_lane (108) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s109")) # Char  |-> (s8_read_lane (109) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s110")) # Char  |-> (s8_read_lane (110) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s111")) # Char  |-> (s8_read_lane (111) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s112")) # Char  |-> (s8_read_lane (112) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s113")) # Char  |-> (s8_read_lane (113) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s114")) # Char  |-> (s8_read_lane (114) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s115")) # Char  |-> (s8_read_lane (115) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s116")) # Char  |-> (s8_read_lane (116) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s117")) # Char  |-> (s8_read_lane (117) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s118")) # Char  |-> (s8_read_lane (118) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s119")) # Char  |-> (s8_read_lane (119) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s120")) # Char  |-> (s8_read_lane (120) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s121")) # Char  |-> (s8_read_lane (121) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s122")) # Char  |-> (s8_read_lane (122) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s123")) # Char  |-> (s8_read_lane (123) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s124")) # Char  |-> (s8_read_lane (124) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s125")) # Char  |-> (s8_read_lane (125) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s126")) # Char  |-> (s8_read_lane (126) (vl) ((batch_pre - batch )) (A)))
  **  ((&(( &( "vacc" ) )->ₛ "s127")) # Char  |-> (s8_read_lane (127) (vl) ((batch_pre - batch )) (A)))
  **  (CharArray.full input_pre (batch_pre + 7 ) A )
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
  **  (CharArray.full output_pre (batch_pre - batch ) (s8_rvv_progress ((batch_pre - batch )) (batch_pre) ((s8_narrow (RawLo))) ((s8_narrow (RawHi))) (A)) )
  **  (CharArray.undef_full output batch )
.

Definition test_rvv_partial_solve_wit_16 := test_rvv_partial_solve_wit_16_pure -> test_rvv_partial_solve_wit_16_aux.

Definition test_rvv_partial_solve_wit_17 := 
forall (params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (RawHi: Z) (RawLo: Z) (A: (@list Z)) (batch64: Z) (vl: Z) (batch: Z) (input: Z) (output: Z) (voutput_min: Z) (voutput_max: Z) (retval: Z) (PreH1 : (batch64 = 0)) (PreH2 : (0 < vl)) (PreH3 : (vl <= 128)) (PreH4 : (vl <= batch)) (PreH5 : (0 < batch_pre)) (PreH6 : (batch_pre <= 18446744073709551608)) (PreH7 : (sizeof(CHAR) = 1)) (PreH8 : ((Zlength (A)) = (batch_pre + 7 ))) (PreH9 : (0 <= batch)) (PreH10 : (batch <= batch_pre)) (PreH11 : (input = (input_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH12 : (batch > 0)) (PreH13 : (output = (output_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH14 : (voutput_min = (s8_narrow (RawLo)))) (PreH15 : (voutput_max = (s8_narrow (RawHi)))) (PreH16 : ((-128) <= voutput_min)) (PreH17 : (voutput_min <= 127)) (PreH18 : ((-128) <= voutput_max)) (PreH19 : (voutput_max <= 127)) (PreH20 : ((s8_bulk_count (batch_pre)) <= (batch_pre - batch ))) ,
  (UndefStructPredvint8m8_t ( &( "vacc" ) ) )
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s0")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (0) (vl) ((batch_pre - batch )) (A))) (voutput_max) (0) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s1")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (1) (vl) ((batch_pre - batch )) (A))) (voutput_max) (1) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s2")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (2) (vl) ((batch_pre - batch )) (A))) (voutput_max) (2) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s3")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (3) (vl) ((batch_pre - batch )) (A))) (voutput_max) (3) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s4")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (4) (vl) ((batch_pre - batch )) (A))) (voutput_max) (4) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s5")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (5) (vl) ((batch_pre - batch )) (A))) (voutput_max) (5) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s6")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (6) (vl) ((batch_pre - batch )) (A))) (voutput_max) (6) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s7")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (7) (vl) ((batch_pre - batch )) (A))) (voutput_max) (7) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s8")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (8) (vl) ((batch_pre - batch )) (A))) (voutput_max) (8) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s9")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (9) (vl) ((batch_pre - batch )) (A))) (voutput_max) (9) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s10")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (10) (vl) ((batch_pre - batch )) (A))) (voutput_max) (10) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s11")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (11) (vl) ((batch_pre - batch )) (A))) (voutput_max) (11) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s12")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (12) (vl) ((batch_pre - batch )) (A))) (voutput_max) (12) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s13")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (13) (vl) ((batch_pre - batch )) (A))) (voutput_max) (13) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s14")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (14) (vl) ((batch_pre - batch )) (A))) (voutput_max) (14) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s15")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (15) (vl) ((batch_pre - batch )) (A))) (voutput_max) (15) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s16")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (16) (vl) ((batch_pre - batch )) (A))) (voutput_max) (16) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s17")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (17) (vl) ((batch_pre - batch )) (A))) (voutput_max) (17) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s18")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (18) (vl) ((batch_pre - batch )) (A))) (voutput_max) (18) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s19")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (19) (vl) ((batch_pre - batch )) (A))) (voutput_max) (19) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s20")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (20) (vl) ((batch_pre - batch )) (A))) (voutput_max) (20) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s21")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (21) (vl) ((batch_pre - batch )) (A))) (voutput_max) (21) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s22")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (22) (vl) ((batch_pre - batch )) (A))) (voutput_max) (22) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s23")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (23) (vl) ((batch_pre - batch )) (A))) (voutput_max) (23) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s24")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (24) (vl) ((batch_pre - batch )) (A))) (voutput_max) (24) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s25")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (25) (vl) ((batch_pre - batch )) (A))) (voutput_max) (25) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s26")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (26) (vl) ((batch_pre - batch )) (A))) (voutput_max) (26) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s27")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (27) (vl) ((batch_pre - batch )) (A))) (voutput_max) (27) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s28")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (28) (vl) ((batch_pre - batch )) (A))) (voutput_max) (28) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s29")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (29) (vl) ((batch_pre - batch )) (A))) (voutput_max) (29) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s30")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (30) (vl) ((batch_pre - batch )) (A))) (voutput_max) (30) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s31")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (31) (vl) ((batch_pre - batch )) (A))) (voutput_max) (31) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s32")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (32) (vl) ((batch_pre - batch )) (A))) (voutput_max) (32) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s33")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (33) (vl) ((batch_pre - batch )) (A))) (voutput_max) (33) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s34")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (34) (vl) ((batch_pre - batch )) (A))) (voutput_max) (34) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s35")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (35) (vl) ((batch_pre - batch )) (A))) (voutput_max) (35) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s36")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (36) (vl) ((batch_pre - batch )) (A))) (voutput_max) (36) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s37")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (37) (vl) ((batch_pre - batch )) (A))) (voutput_max) (37) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s38")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (38) (vl) ((batch_pre - batch )) (A))) (voutput_max) (38) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s39")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (39) (vl) ((batch_pre - batch )) (A))) (voutput_max) (39) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s40")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (40) (vl) ((batch_pre - batch )) (A))) (voutput_max) (40) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s41")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (41) (vl) ((batch_pre - batch )) (A))) (voutput_max) (41) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s42")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (42) (vl) ((batch_pre - batch )) (A))) (voutput_max) (42) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s43")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (43) (vl) ((batch_pre - batch )) (A))) (voutput_max) (43) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s44")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (44) (vl) ((batch_pre - batch )) (A))) (voutput_max) (44) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s45")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (45) (vl) ((batch_pre - batch )) (A))) (voutput_max) (45) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s46")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (46) (vl) ((batch_pre - batch )) (A))) (voutput_max) (46) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s47")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (47) (vl) ((batch_pre - batch )) (A))) (voutput_max) (47) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s48")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (48) (vl) ((batch_pre - batch )) (A))) (voutput_max) (48) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s49")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (49) (vl) ((batch_pre - batch )) (A))) (voutput_max) (49) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s50")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (50) (vl) ((batch_pre - batch )) (A))) (voutput_max) (50) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s51")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (51) (vl) ((batch_pre - batch )) (A))) (voutput_max) (51) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s52")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (52) (vl) ((batch_pre - batch )) (A))) (voutput_max) (52) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s53")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (53) (vl) ((batch_pre - batch )) (A))) (voutput_max) (53) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s54")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (54) (vl) ((batch_pre - batch )) (A))) (voutput_max) (54) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s55")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (55) (vl) ((batch_pre - batch )) (A))) (voutput_max) (55) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s56")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (56) (vl) ((batch_pre - batch )) (A))) (voutput_max) (56) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s57")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (57) (vl) ((batch_pre - batch )) (A))) (voutput_max) (57) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s58")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (58) (vl) ((batch_pre - batch )) (A))) (voutput_max) (58) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s59")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (59) (vl) ((batch_pre - batch )) (A))) (voutput_max) (59) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s60")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (60) (vl) ((batch_pre - batch )) (A))) (voutput_max) (60) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s61")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (61) (vl) ((batch_pre - batch )) (A))) (voutput_max) (61) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s62")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (62) (vl) ((batch_pre - batch )) (A))) (voutput_max) (62) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s63")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (63) (vl) ((batch_pre - batch )) (A))) (voutput_max) (63) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s64")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (64) (vl) ((batch_pre - batch )) (A))) (voutput_max) (64) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s65")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (65) (vl) ((batch_pre - batch )) (A))) (voutput_max) (65) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s66")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (66) (vl) ((batch_pre - batch )) (A))) (voutput_max) (66) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s67")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (67) (vl) ((batch_pre - batch )) (A))) (voutput_max) (67) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s68")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (68) (vl) ((batch_pre - batch )) (A))) (voutput_max) (68) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s69")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (69) (vl) ((batch_pre - batch )) (A))) (voutput_max) (69) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s70")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (70) (vl) ((batch_pre - batch )) (A))) (voutput_max) (70) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s71")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (71) (vl) ((batch_pre - batch )) (A))) (voutput_max) (71) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s72")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (72) (vl) ((batch_pre - batch )) (A))) (voutput_max) (72) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s73")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (73) (vl) ((batch_pre - batch )) (A))) (voutput_max) (73) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s74")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (74) (vl) ((batch_pre - batch )) (A))) (voutput_max) (74) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s75")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (75) (vl) ((batch_pre - batch )) (A))) (voutput_max) (75) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s76")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (76) (vl) ((batch_pre - batch )) (A))) (voutput_max) (76) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s77")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (77) (vl) ((batch_pre - batch )) (A))) (voutput_max) (77) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s78")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (78) (vl) ((batch_pre - batch )) (A))) (voutput_max) (78) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s79")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (79) (vl) ((batch_pre - batch )) (A))) (voutput_max) (79) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s80")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (80) (vl) ((batch_pre - batch )) (A))) (voutput_max) (80) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s81")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (81) (vl) ((batch_pre - batch )) (A))) (voutput_max) (81) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s82")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (82) (vl) ((batch_pre - batch )) (A))) (voutput_max) (82) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s83")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (83) (vl) ((batch_pre - batch )) (A))) (voutput_max) (83) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s84")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (84) (vl) ((batch_pre - batch )) (A))) (voutput_max) (84) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s85")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (85) (vl) ((batch_pre - batch )) (A))) (voutput_max) (85) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s86")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (86) (vl) ((batch_pre - batch )) (A))) (voutput_max) (86) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s87")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (87) (vl) ((batch_pre - batch )) (A))) (voutput_max) (87) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s88")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (88) (vl) ((batch_pre - batch )) (A))) (voutput_max) (88) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s89")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (89) (vl) ((batch_pre - batch )) (A))) (voutput_max) (89) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s90")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (90) (vl) ((batch_pre - batch )) (A))) (voutput_max) (90) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s91")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (91) (vl) ((batch_pre - batch )) (A))) (voutput_max) (91) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s92")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (92) (vl) ((batch_pre - batch )) (A))) (voutput_max) (92) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s93")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (93) (vl) ((batch_pre - batch )) (A))) (voutput_max) (93) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s94")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (94) (vl) ((batch_pre - batch )) (A))) (voutput_max) (94) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s95")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (95) (vl) ((batch_pre - batch )) (A))) (voutput_max) (95) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s96")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (96) (vl) ((batch_pre - batch )) (A))) (voutput_max) (96) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s97")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (97) (vl) ((batch_pre - batch )) (A))) (voutput_max) (97) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s98")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (98) (vl) ((batch_pre - batch )) (A))) (voutput_max) (98) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s99")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (99) (vl) ((batch_pre - batch )) (A))) (voutput_max) (99) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s100")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (100) (vl) ((batch_pre - batch )) (A))) (voutput_max) (100) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s101")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (101) (vl) ((batch_pre - batch )) (A))) (voutput_max) (101) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s102")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (102) (vl) ((batch_pre - batch )) (A))) (voutput_max) (102) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s103")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (103) (vl) ((batch_pre - batch )) (A))) (voutput_max) (103) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s104")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (104) (vl) ((batch_pre - batch )) (A))) (voutput_max) (104) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s105")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (105) (vl) ((batch_pre - batch )) (A))) (voutput_max) (105) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s106")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (106) (vl) ((batch_pre - batch )) (A))) (voutput_max) (106) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s107")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (107) (vl) ((batch_pre - batch )) (A))) (voutput_max) (107) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s108")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (108) (vl) ((batch_pre - batch )) (A))) (voutput_max) (108) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s109")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (109) (vl) ((batch_pre - batch )) (A))) (voutput_max) (109) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s110")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (110) (vl) ((batch_pre - batch )) (A))) (voutput_max) (110) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s111")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (111) (vl) ((batch_pre - batch )) (A))) (voutput_max) (111) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s112")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (112) (vl) ((batch_pre - batch )) (A))) (voutput_max) (112) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s113")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (113) (vl) ((batch_pre - batch )) (A))) (voutput_max) (113) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s114")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (114) (vl) ((batch_pre - batch )) (A))) (voutput_max) (114) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s115")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (115) (vl) ((batch_pre - batch )) (A))) (voutput_max) (115) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s116")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (116) (vl) ((batch_pre - batch )) (A))) (voutput_max) (116) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s117")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (117) (vl) ((batch_pre - batch )) (A))) (voutput_max) (117) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s118")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (118) (vl) ((batch_pre - batch )) (A))) (voutput_max) (118) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s119")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (119) (vl) ((batch_pre - batch )) (A))) (voutput_max) (119) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s120")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (120) (vl) ((batch_pre - batch )) (A))) (voutput_max) (120) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s121")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (121) (vl) ((batch_pre - batch )) (A))) (voutput_max) (121) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s122")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (122) (vl) ((batch_pre - batch )) (A))) (voutput_max) (122) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s123")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (123) (vl) ((batch_pre - batch )) (A))) (voutput_max) (123) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s124")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (124) (vl) ((batch_pre - batch )) (A))) (voutput_max) (124) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s125")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (125) (vl) ((batch_pre - batch )) (A))) (voutput_max) (125) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s126")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (126) (vl) ((batch_pre - batch )) (A))) (voutput_max) (126) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s127")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (127) (vl) ((batch_pre - batch )) (A))) (voutput_max) (127) (vl)))
  **  (CharArray.full input_pre (batch_pre + 7 ) A )
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
  **  (CharArray.full output_pre (batch_pre - batch ) (s8_rvv_progress ((batch_pre - batch )) (batch_pre) ((s8_narrow (RawLo))) ((s8_narrow (RawHi))) (A)) )
  **  (CharArray.undef_full output batch )
|--
  “ (batch64 = 0) ” 
  &&  “ (0 < vl) ” 
  &&  “ (vl <= 128) ” 
  &&  “ (vl <= batch) ” 
  &&  “ (0 < batch_pre) ” 
  &&  “ (batch_pre <= 18446744073709551608) ” 
  &&  “ (sizeof(CHAR) = 1) ” 
  &&  “ ((Zlength (A)) = (batch_pre + 7 )) ” 
  &&  “ (0 <= batch) ” 
  &&  “ (batch <= batch_pre) ” 
  &&  “ (input = (input_pre + ((batch_pre - batch ) * sizeof(CHAR)))) ” 
  &&  “ (batch > 0) ” 
  &&  “ (output = (output_pre + ((batch_pre - batch ) * sizeof(CHAR)))) ” 
  &&  “ (voutput_min = (s8_narrow (RawLo))) ” 
  &&  “ (voutput_max = (s8_narrow (RawHi))) ” 
  &&  “ ((-128) <= voutput_min) ” 
  &&  “ (voutput_min <= 127) ” 
  &&  “ ((-128) <= voutput_max) ” 
  &&  “ (voutput_max <= 127) ” 
  &&  “ ((s8_bulk_count (batch_pre)) <= (batch_pre - batch )) ”
  &&  ((&(( &( "vacc" ) )->ₛ "s127")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s127")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (127) (vl) ((batch_pre - batch )) (A))) (voutput_max) (127) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s126")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s126")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (126) (vl) ((batch_pre - batch )) (A))) (voutput_max) (126) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s125")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s125")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (125) (vl) ((batch_pre - batch )) (A))) (voutput_max) (125) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s124")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s124")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (124) (vl) ((batch_pre - batch )) (A))) (voutput_max) (124) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s123")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s123")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (123) (vl) ((batch_pre - batch )) (A))) (voutput_max) (123) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s122")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s122")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (122) (vl) ((batch_pre - batch )) (A))) (voutput_max) (122) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s121")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s121")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (121) (vl) ((batch_pre - batch )) (A))) (voutput_max) (121) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s120")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s120")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (120) (vl) ((batch_pre - batch )) (A))) (voutput_max) (120) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s119")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s119")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (119) (vl) ((batch_pre - batch )) (A))) (voutput_max) (119) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s118")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s118")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (118) (vl) ((batch_pre - batch )) (A))) (voutput_max) (118) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s117")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s117")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (117) (vl) ((batch_pre - batch )) (A))) (voutput_max) (117) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s116")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s116")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (116) (vl) ((batch_pre - batch )) (A))) (voutput_max) (116) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s115")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s115")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (115) (vl) ((batch_pre - batch )) (A))) (voutput_max) (115) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s114")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s114")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (114) (vl) ((batch_pre - batch )) (A))) (voutput_max) (114) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s113")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s113")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (113) (vl) ((batch_pre - batch )) (A))) (voutput_max) (113) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s112")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s112")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (112) (vl) ((batch_pre - batch )) (A))) (voutput_max) (112) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s111")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s111")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (111) (vl) ((batch_pre - batch )) (A))) (voutput_max) (111) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s110")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s110")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (110) (vl) ((batch_pre - batch )) (A))) (voutput_max) (110) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s109")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s109")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (109) (vl) ((batch_pre - batch )) (A))) (voutput_max) (109) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s108")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s108")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (108) (vl) ((batch_pre - batch )) (A))) (voutput_max) (108) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s107")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s107")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (107) (vl) ((batch_pre - batch )) (A))) (voutput_max) (107) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s106")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s106")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (106) (vl) ((batch_pre - batch )) (A))) (voutput_max) (106) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s105")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s105")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (105) (vl) ((batch_pre - batch )) (A))) (voutput_max) (105) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s104")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s104")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (104) (vl) ((batch_pre - batch )) (A))) (voutput_max) (104) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s103")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s103")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (103) (vl) ((batch_pre - batch )) (A))) (voutput_max) (103) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s102")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s102")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (102) (vl) ((batch_pre - batch )) (A))) (voutput_max) (102) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s101")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s101")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (101) (vl) ((batch_pre - batch )) (A))) (voutput_max) (101) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s100")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s100")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (100) (vl) ((batch_pre - batch )) (A))) (voutput_max) (100) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s99")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s99")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (99) (vl) ((batch_pre - batch )) (A))) (voutput_max) (99) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s98")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s98")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (98) (vl) ((batch_pre - batch )) (A))) (voutput_max) (98) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s97")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s97")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (97) (vl) ((batch_pre - batch )) (A))) (voutput_max) (97) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s96")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s96")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (96) (vl) ((batch_pre - batch )) (A))) (voutput_max) (96) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s95")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s95")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (95) (vl) ((batch_pre - batch )) (A))) (voutput_max) (95) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s94")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s94")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (94) (vl) ((batch_pre - batch )) (A))) (voutput_max) (94) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s93")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s93")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (93) (vl) ((batch_pre - batch )) (A))) (voutput_max) (93) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s92")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s92")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (92) (vl) ((batch_pre - batch )) (A))) (voutput_max) (92) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s91")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s91")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (91) (vl) ((batch_pre - batch )) (A))) (voutput_max) (91) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s90")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s90")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (90) (vl) ((batch_pre - batch )) (A))) (voutput_max) (90) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s89")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s89")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (89) (vl) ((batch_pre - batch )) (A))) (voutput_max) (89) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s88")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s88")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (88) (vl) ((batch_pre - batch )) (A))) (voutput_max) (88) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s87")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s87")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (87) (vl) ((batch_pre - batch )) (A))) (voutput_max) (87) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s86")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s86")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (86) (vl) ((batch_pre - batch )) (A))) (voutput_max) (86) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s85")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s85")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (85) (vl) ((batch_pre - batch )) (A))) (voutput_max) (85) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s84")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s84")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (84) (vl) ((batch_pre - batch )) (A))) (voutput_max) (84) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s83")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s83")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (83) (vl) ((batch_pre - batch )) (A))) (voutput_max) (83) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s82")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s82")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (82) (vl) ((batch_pre - batch )) (A))) (voutput_max) (82) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s81")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s81")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (81) (vl) ((batch_pre - batch )) (A))) (voutput_max) (81) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s80")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s80")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (80) (vl) ((batch_pre - batch )) (A))) (voutput_max) (80) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s79")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s79")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (79) (vl) ((batch_pre - batch )) (A))) (voutput_max) (79) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s78")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s78")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (78) (vl) ((batch_pre - batch )) (A))) (voutput_max) (78) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s77")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s77")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (77) (vl) ((batch_pre - batch )) (A))) (voutput_max) (77) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s76")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s76")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (76) (vl) ((batch_pre - batch )) (A))) (voutput_max) (76) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s75")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s75")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (75) (vl) ((batch_pre - batch )) (A))) (voutput_max) (75) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s74")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s74")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (74) (vl) ((batch_pre - batch )) (A))) (voutput_max) (74) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s73")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s73")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (73) (vl) ((batch_pre - batch )) (A))) (voutput_max) (73) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s72")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s72")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (72) (vl) ((batch_pre - batch )) (A))) (voutput_max) (72) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s71")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s71")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (71) (vl) ((batch_pre - batch )) (A))) (voutput_max) (71) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s70")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s70")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (70) (vl) ((batch_pre - batch )) (A))) (voutput_max) (70) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s69")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s69")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (69) (vl) ((batch_pre - batch )) (A))) (voutput_max) (69) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s68")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s68")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (68) (vl) ((batch_pre - batch )) (A))) (voutput_max) (68) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s67")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s67")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (67) (vl) ((batch_pre - batch )) (A))) (voutput_max) (67) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s66")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s66")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (66) (vl) ((batch_pre - batch )) (A))) (voutput_max) (66) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s65")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s65")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (65) (vl) ((batch_pre - batch )) (A))) (voutput_max) (65) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s64")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s64")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (64) (vl) ((batch_pre - batch )) (A))) (voutput_max) (64) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s63")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s63")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (63) (vl) ((batch_pre - batch )) (A))) (voutput_max) (63) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s62")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s62")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (62) (vl) ((batch_pre - batch )) (A))) (voutput_max) (62) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s61")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s61")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (61) (vl) ((batch_pre - batch )) (A))) (voutput_max) (61) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s60")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s60")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (60) (vl) ((batch_pre - batch )) (A))) (voutput_max) (60) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s59")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s59")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (59) (vl) ((batch_pre - batch )) (A))) (voutput_max) (59) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s58")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s58")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (58) (vl) ((batch_pre - batch )) (A))) (voutput_max) (58) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s57")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s57")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (57) (vl) ((batch_pre - batch )) (A))) (voutput_max) (57) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s56")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s56")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (56) (vl) ((batch_pre - batch )) (A))) (voutput_max) (56) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s55")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s55")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (55) (vl) ((batch_pre - batch )) (A))) (voutput_max) (55) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s54")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s54")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (54) (vl) ((batch_pre - batch )) (A))) (voutput_max) (54) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s53")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s53")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (53) (vl) ((batch_pre - batch )) (A))) (voutput_max) (53) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s52")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s52")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (52) (vl) ((batch_pre - batch )) (A))) (voutput_max) (52) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s51")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s51")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (51) (vl) ((batch_pre - batch )) (A))) (voutput_max) (51) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s50")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s50")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (50) (vl) ((batch_pre - batch )) (A))) (voutput_max) (50) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s49")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s49")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (49) (vl) ((batch_pre - batch )) (A))) (voutput_max) (49) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s48")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s48")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (48) (vl) ((batch_pre - batch )) (A))) (voutput_max) (48) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s47")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s47")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (47) (vl) ((batch_pre - batch )) (A))) (voutput_max) (47) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s46")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s46")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (46) (vl) ((batch_pre - batch )) (A))) (voutput_max) (46) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s45")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s45")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (45) (vl) ((batch_pre - batch )) (A))) (voutput_max) (45) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s44")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s44")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (44) (vl) ((batch_pre - batch )) (A))) (voutput_max) (44) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s43")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s43")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (43) (vl) ((batch_pre - batch )) (A))) (voutput_max) (43) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s42")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s42")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (42) (vl) ((batch_pre - batch )) (A))) (voutput_max) (42) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s41")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s41")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (41) (vl) ((batch_pre - batch )) (A))) (voutput_max) (41) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s40")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s40")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (40) (vl) ((batch_pre - batch )) (A))) (voutput_max) (40) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s39")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s39")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (39) (vl) ((batch_pre - batch )) (A))) (voutput_max) (39) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s38")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s38")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (38) (vl) ((batch_pre - batch )) (A))) (voutput_max) (38) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s37")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s37")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (37) (vl) ((batch_pre - batch )) (A))) (voutput_max) (37) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s36")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s36")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (36) (vl) ((batch_pre - batch )) (A))) (voutput_max) (36) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s35")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s35")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (35) (vl) ((batch_pre - batch )) (A))) (voutput_max) (35) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s34")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s34")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (34) (vl) ((batch_pre - batch )) (A))) (voutput_max) (34) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s33")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s33")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (33) (vl) ((batch_pre - batch )) (A))) (voutput_max) (33) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s32")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s32")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (32) (vl) ((batch_pre - batch )) (A))) (voutput_max) (32) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s31")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s31")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (31) (vl) ((batch_pre - batch )) (A))) (voutput_max) (31) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s30")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s30")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (30) (vl) ((batch_pre - batch )) (A))) (voutput_max) (30) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s29")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s29")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (29) (vl) ((batch_pre - batch )) (A))) (voutput_max) (29) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s28")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s28")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (28) (vl) ((batch_pre - batch )) (A))) (voutput_max) (28) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s27")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s27")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (27) (vl) ((batch_pre - batch )) (A))) (voutput_max) (27) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s26")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s26")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (26) (vl) ((batch_pre - batch )) (A))) (voutput_max) (26) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s25")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s25")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (25) (vl) ((batch_pre - batch )) (A))) (voutput_max) (25) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s24")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s24")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (24) (vl) ((batch_pre - batch )) (A))) (voutput_max) (24) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s23")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s23")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (23) (vl) ((batch_pre - batch )) (A))) (voutput_max) (23) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s22")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s22")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (22) (vl) ((batch_pre - batch )) (A))) (voutput_max) (22) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s21")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s21")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (21) (vl) ((batch_pre - batch )) (A))) (voutput_max) (21) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s20")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s20")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (20) (vl) ((batch_pre - batch )) (A))) (voutput_max) (20) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s19")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s19")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (19) (vl) ((batch_pre - batch )) (A))) (voutput_max) (19) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s18")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s18")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (18) (vl) ((batch_pre - batch )) (A))) (voutput_max) (18) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s17")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s17")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (17) (vl) ((batch_pre - batch )) (A))) (voutput_max) (17) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s16")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s16")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (16) (vl) ((batch_pre - batch )) (A))) (voutput_max) (16) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s15")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s15")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (15) (vl) ((batch_pre - batch )) (A))) (voutput_max) (15) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s14")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s14")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (14) (vl) ((batch_pre - batch )) (A))) (voutput_max) (14) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s13")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s13")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (13) (vl) ((batch_pre - batch )) (A))) (voutput_max) (13) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s12")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s12")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (12) (vl) ((batch_pre - batch )) (A))) (voutput_max) (12) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s11")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s11")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (11) (vl) ((batch_pre - batch )) (A))) (voutput_max) (11) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s10")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s10")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (10) (vl) ((batch_pre - batch )) (A))) (voutput_max) (10) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s9")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s9")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (9) (vl) ((batch_pre - batch )) (A))) (voutput_max) (9) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s8")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s8")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (8) (vl) ((batch_pre - batch )) (A))) (voutput_max) (8) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s7")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s7")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (7) (vl) ((batch_pre - batch )) (A))) (voutput_max) (7) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s6")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s6")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (6) (vl) ((batch_pre - batch )) (A))) (voutput_max) (6) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s5")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s5")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (5) (vl) ((batch_pre - batch )) (A))) (voutput_max) (5) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s4")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s4")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (4) (vl) ((batch_pre - batch )) (A))) (voutput_max) (4) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s3")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (3) (vl) ((batch_pre - batch )) (A))) (voutput_max) (3) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s2")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (2) (vl) ((batch_pre - batch )) (A))) (voutput_max) (2) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s1")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (1) (vl) ((batch_pre - batch )) (A))) (voutput_max) (1) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s0")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s0")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (0) (vl) ((batch_pre - batch )) (A))) (voutput_max) (0) (vl)))
  **  (CharArray.full input_pre (batch_pre + 7 ) A )
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
  **  (CharArray.full output_pre (batch_pre - batch ) (s8_rvv_progress ((batch_pre - batch )) (batch_pre) ((s8_narrow (RawLo))) ((s8_narrow (RawHi))) (A)) )
  **  (CharArray.undef_full output batch )
.

Definition test_rvv_partial_solve_wit_18_pure := 
forall (params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (RawHi: Z) (RawLo: Z) (A: (@list Z)) (batch64: Z) (vl: Z) (batch: Z) (input: Z) (output: Z) (voutput_min: Z) (voutput_max: Z) (PreH1 : (batch64 = 0)) (PreH2 : (0 < vl)) (PreH3 : (vl <= 128)) (PreH4 : (vl <= batch)) (PreH5 : (0 < batch_pre)) (PreH6 : (batch_pre <= 18446744073709551608)) (PreH7 : (sizeof(CHAR) = 1)) (PreH8 : ((Zlength (A)) = (batch_pre + 7 ))) (PreH9 : (0 <= batch)) (PreH10 : (batch <= batch_pre)) (PreH11 : (input = (input_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH12 : (batch > 0)) (PreH13 : (output = (output_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH14 : (voutput_min = (s8_narrow (RawLo)))) (PreH15 : (voutput_max = (s8_narrow (RawHi)))) (PreH16 : ((-128) <= voutput_min)) (PreH17 : (voutput_min <= 127)) (PreH18 : ((-128) <= voutput_max)) (PreH19 : (voutput_max <= 127)) (PreH20 : ((s8_bulk_count (batch_pre)) <= (batch_pre - batch ))) ,
  ((&(( &( "vacc" ) )->ₛ "s127")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (127) (vl) ((batch_pre - batch )) (A))) (voutput_max) (127) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s126")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (126) (vl) ((batch_pre - batch )) (A))) (voutput_max) (126) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s125")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (125) (vl) ((batch_pre - batch )) (A))) (voutput_max) (125) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s124")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (124) (vl) ((batch_pre - batch )) (A))) (voutput_max) (124) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s123")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (123) (vl) ((batch_pre - batch )) (A))) (voutput_max) (123) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s122")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (122) (vl) ((batch_pre - batch )) (A))) (voutput_max) (122) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s121")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (121) (vl) ((batch_pre - batch )) (A))) (voutput_max) (121) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s120")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (120) (vl) ((batch_pre - batch )) (A))) (voutput_max) (120) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s119")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (119) (vl) ((batch_pre - batch )) (A))) (voutput_max) (119) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s118")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (118) (vl) ((batch_pre - batch )) (A))) (voutput_max) (118) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s117")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (117) (vl) ((batch_pre - batch )) (A))) (voutput_max) (117) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s116")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (116) (vl) ((batch_pre - batch )) (A))) (voutput_max) (116) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s115")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (115) (vl) ((batch_pre - batch )) (A))) (voutput_max) (115) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s114")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (114) (vl) ((batch_pre - batch )) (A))) (voutput_max) (114) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s113")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (113) (vl) ((batch_pre - batch )) (A))) (voutput_max) (113) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s112")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (112) (vl) ((batch_pre - batch )) (A))) (voutput_max) (112) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s111")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (111) (vl) ((batch_pre - batch )) (A))) (voutput_max) (111) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s110")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (110) (vl) ((batch_pre - batch )) (A))) (voutput_max) (110) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s109")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (109) (vl) ((batch_pre - batch )) (A))) (voutput_max) (109) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s108")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (108) (vl) ((batch_pre - batch )) (A))) (voutput_max) (108) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s107")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (107) (vl) ((batch_pre - batch )) (A))) (voutput_max) (107) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s106")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (106) (vl) ((batch_pre - batch )) (A))) (voutput_max) (106) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s105")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (105) (vl) ((batch_pre - batch )) (A))) (voutput_max) (105) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s104")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (104) (vl) ((batch_pre - batch )) (A))) (voutput_max) (104) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s103")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (103) (vl) ((batch_pre - batch )) (A))) (voutput_max) (103) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s102")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (102) (vl) ((batch_pre - batch )) (A))) (voutput_max) (102) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s101")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (101) (vl) ((batch_pre - batch )) (A))) (voutput_max) (101) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s100")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (100) (vl) ((batch_pre - batch )) (A))) (voutput_max) (100) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s99")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (99) (vl) ((batch_pre - batch )) (A))) (voutput_max) (99) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s98")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (98) (vl) ((batch_pre - batch )) (A))) (voutput_max) (98) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s97")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (97) (vl) ((batch_pre - batch )) (A))) (voutput_max) (97) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s96")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (96) (vl) ((batch_pre - batch )) (A))) (voutput_max) (96) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s95")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (95) (vl) ((batch_pre - batch )) (A))) (voutput_max) (95) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s94")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (94) (vl) ((batch_pre - batch )) (A))) (voutput_max) (94) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s93")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (93) (vl) ((batch_pre - batch )) (A))) (voutput_max) (93) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s92")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (92) (vl) ((batch_pre - batch )) (A))) (voutput_max) (92) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s91")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (91) (vl) ((batch_pre - batch )) (A))) (voutput_max) (91) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s90")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (90) (vl) ((batch_pre - batch )) (A))) (voutput_max) (90) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s89")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (89) (vl) ((batch_pre - batch )) (A))) (voutput_max) (89) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s88")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (88) (vl) ((batch_pre - batch )) (A))) (voutput_max) (88) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s87")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (87) (vl) ((batch_pre - batch )) (A))) (voutput_max) (87) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s86")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (86) (vl) ((batch_pre - batch )) (A))) (voutput_max) (86) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s85")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (85) (vl) ((batch_pre - batch )) (A))) (voutput_max) (85) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s84")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (84) (vl) ((batch_pre - batch )) (A))) (voutput_max) (84) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s83")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (83) (vl) ((batch_pre - batch )) (A))) (voutput_max) (83) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s82")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (82) (vl) ((batch_pre - batch )) (A))) (voutput_max) (82) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s81")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (81) (vl) ((batch_pre - batch )) (A))) (voutput_max) (81) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s80")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (80) (vl) ((batch_pre - batch )) (A))) (voutput_max) (80) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s79")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (79) (vl) ((batch_pre - batch )) (A))) (voutput_max) (79) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s78")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (78) (vl) ((batch_pre - batch )) (A))) (voutput_max) (78) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s77")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (77) (vl) ((batch_pre - batch )) (A))) (voutput_max) (77) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s76")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (76) (vl) ((batch_pre - batch )) (A))) (voutput_max) (76) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s75")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (75) (vl) ((batch_pre - batch )) (A))) (voutput_max) (75) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s74")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (74) (vl) ((batch_pre - batch )) (A))) (voutput_max) (74) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s73")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (73) (vl) ((batch_pre - batch )) (A))) (voutput_max) (73) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s72")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (72) (vl) ((batch_pre - batch )) (A))) (voutput_max) (72) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s71")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (71) (vl) ((batch_pre - batch )) (A))) (voutput_max) (71) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s70")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (70) (vl) ((batch_pre - batch )) (A))) (voutput_max) (70) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s69")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (69) (vl) ((batch_pre - batch )) (A))) (voutput_max) (69) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s68")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (68) (vl) ((batch_pre - batch )) (A))) (voutput_max) (68) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s67")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (67) (vl) ((batch_pre - batch )) (A))) (voutput_max) (67) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s66")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (66) (vl) ((batch_pre - batch )) (A))) (voutput_max) (66) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s65")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (65) (vl) ((batch_pre - batch )) (A))) (voutput_max) (65) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s64")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (64) (vl) ((batch_pre - batch )) (A))) (voutput_max) (64) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s63")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (63) (vl) ((batch_pre - batch )) (A))) (voutput_max) (63) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s62")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (62) (vl) ((batch_pre - batch )) (A))) (voutput_max) (62) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s61")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (61) (vl) ((batch_pre - batch )) (A))) (voutput_max) (61) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s60")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (60) (vl) ((batch_pre - batch )) (A))) (voutput_max) (60) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s59")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (59) (vl) ((batch_pre - batch )) (A))) (voutput_max) (59) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s58")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (58) (vl) ((batch_pre - batch )) (A))) (voutput_max) (58) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s57")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (57) (vl) ((batch_pre - batch )) (A))) (voutput_max) (57) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s56")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (56) (vl) ((batch_pre - batch )) (A))) (voutput_max) (56) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s55")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (55) (vl) ((batch_pre - batch )) (A))) (voutput_max) (55) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s54")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (54) (vl) ((batch_pre - batch )) (A))) (voutput_max) (54) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s53")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (53) (vl) ((batch_pre - batch )) (A))) (voutput_max) (53) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s52")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (52) (vl) ((batch_pre - batch )) (A))) (voutput_max) (52) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s51")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (51) (vl) ((batch_pre - batch )) (A))) (voutput_max) (51) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s50")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (50) (vl) ((batch_pre - batch )) (A))) (voutput_max) (50) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s49")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (49) (vl) ((batch_pre - batch )) (A))) (voutput_max) (49) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s48")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (48) (vl) ((batch_pre - batch )) (A))) (voutput_max) (48) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s47")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (47) (vl) ((batch_pre - batch )) (A))) (voutput_max) (47) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s46")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (46) (vl) ((batch_pre - batch )) (A))) (voutput_max) (46) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s45")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (45) (vl) ((batch_pre - batch )) (A))) (voutput_max) (45) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s44")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (44) (vl) ((batch_pre - batch )) (A))) (voutput_max) (44) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s43")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (43) (vl) ((batch_pre - batch )) (A))) (voutput_max) (43) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s42")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (42) (vl) ((batch_pre - batch )) (A))) (voutput_max) (42) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s41")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (41) (vl) ((batch_pre - batch )) (A))) (voutput_max) (41) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s40")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (40) (vl) ((batch_pre - batch )) (A))) (voutput_max) (40) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s39")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (39) (vl) ((batch_pre - batch )) (A))) (voutput_max) (39) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s38")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (38) (vl) ((batch_pre - batch )) (A))) (voutput_max) (38) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s37")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (37) (vl) ((batch_pre - batch )) (A))) (voutput_max) (37) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s36")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (36) (vl) ((batch_pre - batch )) (A))) (voutput_max) (36) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s35")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (35) (vl) ((batch_pre - batch )) (A))) (voutput_max) (35) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s34")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (34) (vl) ((batch_pre - batch )) (A))) (voutput_max) (34) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s33")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (33) (vl) ((batch_pre - batch )) (A))) (voutput_max) (33) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s32")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (32) (vl) ((batch_pre - batch )) (A))) (voutput_max) (32) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s31")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (31) (vl) ((batch_pre - batch )) (A))) (voutput_max) (31) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s30")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (30) (vl) ((batch_pre - batch )) (A))) (voutput_max) (30) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s29")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (29) (vl) ((batch_pre - batch )) (A))) (voutput_max) (29) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s28")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (28) (vl) ((batch_pre - batch )) (A))) (voutput_max) (28) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s27")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (27) (vl) ((batch_pre - batch )) (A))) (voutput_max) (27) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s26")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (26) (vl) ((batch_pre - batch )) (A))) (voutput_max) (26) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s25")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (25) (vl) ((batch_pre - batch )) (A))) (voutput_max) (25) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s24")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (24) (vl) ((batch_pre - batch )) (A))) (voutput_max) (24) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s23")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (23) (vl) ((batch_pre - batch )) (A))) (voutput_max) (23) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s22")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (22) (vl) ((batch_pre - batch )) (A))) (voutput_max) (22) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s21")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (21) (vl) ((batch_pre - batch )) (A))) (voutput_max) (21) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s20")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (20) (vl) ((batch_pre - batch )) (A))) (voutput_max) (20) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s19")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (19) (vl) ((batch_pre - batch )) (A))) (voutput_max) (19) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s18")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (18) (vl) ((batch_pre - batch )) (A))) (voutput_max) (18) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s17")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (17) (vl) ((batch_pre - batch )) (A))) (voutput_max) (17) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s16")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (16) (vl) ((batch_pre - batch )) (A))) (voutput_max) (16) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s15")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (15) (vl) ((batch_pre - batch )) (A))) (voutput_max) (15) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s14")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (14) (vl) ((batch_pre - batch )) (A))) (voutput_max) (14) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s13")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (13) (vl) ((batch_pre - batch )) (A))) (voutput_max) (13) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s12")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (12) (vl) ((batch_pre - batch )) (A))) (voutput_max) (12) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s11")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (11) (vl) ((batch_pre - batch )) (A))) (voutput_max) (11) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s10")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (10) (vl) ((batch_pre - batch )) (A))) (voutput_max) (10) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s9")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (9) (vl) ((batch_pre - batch )) (A))) (voutput_max) (9) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s8")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (8) (vl) ((batch_pre - batch )) (A))) (voutput_max) (8) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s7")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (7) (vl) ((batch_pre - batch )) (A))) (voutput_max) (7) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s6")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (6) (vl) ((batch_pre - batch )) (A))) (voutput_max) (6) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s5")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (5) (vl) ((batch_pre - batch )) (A))) (voutput_max) (5) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s4")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (4) (vl) ((batch_pre - batch )) (A))) (voutput_max) (4) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (3) (vl) ((batch_pre - batch )) (A))) (voutput_max) (3) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (2) (vl) ((batch_pre - batch )) (A))) (voutput_max) (2) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (1) (vl) ((batch_pre - batch )) (A))) (voutput_max) (1) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s0")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (0) (vl) ((batch_pre - batch )) (A))) (voutput_max) (0) (vl)))
  **  (CharArray.full input_pre (batch_pre + 7 ) A )
  **  ((( &( "batch64" ) )) # UInt64  |-> batch64)
  **  ((( &( "vl" ) )) # UInt64  |-> vl)
  **  ((( &( "batch" ) )) # UInt64  |-> batch)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "voutput_min" ) )) # Char  |-> voutput_min)
  **  ((( &( "voutput_max" ) )) # Char  |-> voutput_max)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
  **  (CharArray.full output_pre (batch_pre - batch ) (s8_rvv_progress ((batch_pre - batch )) (batch_pre) ((s8_narrow (RawLo))) ((s8_narrow (RawHi))) (A)) )
  **  (CharArray.undef_full output batch )
|--
  “ ((-128) <= voutput_min) ” 
  &&  “ (voutput_min <= 127) ” 
  &&  “ (0 <= vl) ” 
  &&  “ (vl <= 128) ”
.

Definition test_rvv_partial_solve_wit_18_aux := 
forall (params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (RawHi: Z) (RawLo: Z) (A: (@list Z)) (batch64: Z) (vl: Z) (batch: Z) (input: Z) (output: Z) (voutput_min: Z) (voutput_max: Z) (PreH1 : (batch64 = 0)) (PreH2 : (0 < vl)) (PreH3 : (vl <= 128)) (PreH4 : (vl <= batch)) (PreH5 : (0 < batch_pre)) (PreH6 : (batch_pre <= 18446744073709551608)) (PreH7 : (sizeof(CHAR) = 1)) (PreH8 : ((Zlength (A)) = (batch_pre + 7 ))) (PreH9 : (0 <= batch)) (PreH10 : (batch <= batch_pre)) (PreH11 : (input = (input_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH12 : (batch > 0)) (PreH13 : (output = (output_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH14 : (voutput_min = (s8_narrow (RawLo)))) (PreH15 : (voutput_max = (s8_narrow (RawHi)))) (PreH16 : ((-128) <= voutput_min)) (PreH17 : (voutput_min <= 127)) (PreH18 : ((-128) <= voutput_max)) (PreH19 : (voutput_max <= 127)) (PreH20 : ((s8_bulk_count (batch_pre)) <= (batch_pre - batch ))) ,
  ((&(( &( "vacc" ) )->ₛ "s127")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (127) (vl) ((batch_pre - batch )) (A))) (voutput_max) (127) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s126")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (126) (vl) ((batch_pre - batch )) (A))) (voutput_max) (126) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s125")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (125) (vl) ((batch_pre - batch )) (A))) (voutput_max) (125) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s124")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (124) (vl) ((batch_pre - batch )) (A))) (voutput_max) (124) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s123")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (123) (vl) ((batch_pre - batch )) (A))) (voutput_max) (123) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s122")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (122) (vl) ((batch_pre - batch )) (A))) (voutput_max) (122) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s121")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (121) (vl) ((batch_pre - batch )) (A))) (voutput_max) (121) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s120")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (120) (vl) ((batch_pre - batch )) (A))) (voutput_max) (120) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s119")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (119) (vl) ((batch_pre - batch )) (A))) (voutput_max) (119) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s118")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (118) (vl) ((batch_pre - batch )) (A))) (voutput_max) (118) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s117")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (117) (vl) ((batch_pre - batch )) (A))) (voutput_max) (117) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s116")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (116) (vl) ((batch_pre - batch )) (A))) (voutput_max) (116) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s115")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (115) (vl) ((batch_pre - batch )) (A))) (voutput_max) (115) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s114")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (114) (vl) ((batch_pre - batch )) (A))) (voutput_max) (114) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s113")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (113) (vl) ((batch_pre - batch )) (A))) (voutput_max) (113) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s112")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (112) (vl) ((batch_pre - batch )) (A))) (voutput_max) (112) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s111")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (111) (vl) ((batch_pre - batch )) (A))) (voutput_max) (111) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s110")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (110) (vl) ((batch_pre - batch )) (A))) (voutput_max) (110) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s109")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (109) (vl) ((batch_pre - batch )) (A))) (voutput_max) (109) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s108")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (108) (vl) ((batch_pre - batch )) (A))) (voutput_max) (108) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s107")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (107) (vl) ((batch_pre - batch )) (A))) (voutput_max) (107) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s106")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (106) (vl) ((batch_pre - batch )) (A))) (voutput_max) (106) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s105")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (105) (vl) ((batch_pre - batch )) (A))) (voutput_max) (105) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s104")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (104) (vl) ((batch_pre - batch )) (A))) (voutput_max) (104) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s103")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (103) (vl) ((batch_pre - batch )) (A))) (voutput_max) (103) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s102")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (102) (vl) ((batch_pre - batch )) (A))) (voutput_max) (102) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s101")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (101) (vl) ((batch_pre - batch )) (A))) (voutput_max) (101) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s100")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (100) (vl) ((batch_pre - batch )) (A))) (voutput_max) (100) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s99")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (99) (vl) ((batch_pre - batch )) (A))) (voutput_max) (99) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s98")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (98) (vl) ((batch_pre - batch )) (A))) (voutput_max) (98) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s97")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (97) (vl) ((batch_pre - batch )) (A))) (voutput_max) (97) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s96")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (96) (vl) ((batch_pre - batch )) (A))) (voutput_max) (96) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s95")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (95) (vl) ((batch_pre - batch )) (A))) (voutput_max) (95) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s94")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (94) (vl) ((batch_pre - batch )) (A))) (voutput_max) (94) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s93")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (93) (vl) ((batch_pre - batch )) (A))) (voutput_max) (93) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s92")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (92) (vl) ((batch_pre - batch )) (A))) (voutput_max) (92) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s91")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (91) (vl) ((batch_pre - batch )) (A))) (voutput_max) (91) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s90")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (90) (vl) ((batch_pre - batch )) (A))) (voutput_max) (90) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s89")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (89) (vl) ((batch_pre - batch )) (A))) (voutput_max) (89) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s88")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (88) (vl) ((batch_pre - batch )) (A))) (voutput_max) (88) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s87")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (87) (vl) ((batch_pre - batch )) (A))) (voutput_max) (87) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s86")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (86) (vl) ((batch_pre - batch )) (A))) (voutput_max) (86) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s85")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (85) (vl) ((batch_pre - batch )) (A))) (voutput_max) (85) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s84")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (84) (vl) ((batch_pre - batch )) (A))) (voutput_max) (84) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s83")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (83) (vl) ((batch_pre - batch )) (A))) (voutput_max) (83) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s82")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (82) (vl) ((batch_pre - batch )) (A))) (voutput_max) (82) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s81")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (81) (vl) ((batch_pre - batch )) (A))) (voutput_max) (81) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s80")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (80) (vl) ((batch_pre - batch )) (A))) (voutput_max) (80) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s79")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (79) (vl) ((batch_pre - batch )) (A))) (voutput_max) (79) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s78")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (78) (vl) ((batch_pre - batch )) (A))) (voutput_max) (78) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s77")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (77) (vl) ((batch_pre - batch )) (A))) (voutput_max) (77) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s76")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (76) (vl) ((batch_pre - batch )) (A))) (voutput_max) (76) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s75")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (75) (vl) ((batch_pre - batch )) (A))) (voutput_max) (75) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s74")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (74) (vl) ((batch_pre - batch )) (A))) (voutput_max) (74) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s73")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (73) (vl) ((batch_pre - batch )) (A))) (voutput_max) (73) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s72")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (72) (vl) ((batch_pre - batch )) (A))) (voutput_max) (72) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s71")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (71) (vl) ((batch_pre - batch )) (A))) (voutput_max) (71) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s70")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (70) (vl) ((batch_pre - batch )) (A))) (voutput_max) (70) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s69")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (69) (vl) ((batch_pre - batch )) (A))) (voutput_max) (69) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s68")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (68) (vl) ((batch_pre - batch )) (A))) (voutput_max) (68) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s67")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (67) (vl) ((batch_pre - batch )) (A))) (voutput_max) (67) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s66")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (66) (vl) ((batch_pre - batch )) (A))) (voutput_max) (66) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s65")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (65) (vl) ((batch_pre - batch )) (A))) (voutput_max) (65) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s64")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (64) (vl) ((batch_pre - batch )) (A))) (voutput_max) (64) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s63")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (63) (vl) ((batch_pre - batch )) (A))) (voutput_max) (63) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s62")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (62) (vl) ((batch_pre - batch )) (A))) (voutput_max) (62) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s61")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (61) (vl) ((batch_pre - batch )) (A))) (voutput_max) (61) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s60")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (60) (vl) ((batch_pre - batch )) (A))) (voutput_max) (60) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s59")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (59) (vl) ((batch_pre - batch )) (A))) (voutput_max) (59) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s58")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (58) (vl) ((batch_pre - batch )) (A))) (voutput_max) (58) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s57")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (57) (vl) ((batch_pre - batch )) (A))) (voutput_max) (57) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s56")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (56) (vl) ((batch_pre - batch )) (A))) (voutput_max) (56) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s55")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (55) (vl) ((batch_pre - batch )) (A))) (voutput_max) (55) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s54")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (54) (vl) ((batch_pre - batch )) (A))) (voutput_max) (54) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s53")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (53) (vl) ((batch_pre - batch )) (A))) (voutput_max) (53) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s52")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (52) (vl) ((batch_pre - batch )) (A))) (voutput_max) (52) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s51")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (51) (vl) ((batch_pre - batch )) (A))) (voutput_max) (51) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s50")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (50) (vl) ((batch_pre - batch )) (A))) (voutput_max) (50) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s49")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (49) (vl) ((batch_pre - batch )) (A))) (voutput_max) (49) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s48")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (48) (vl) ((batch_pre - batch )) (A))) (voutput_max) (48) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s47")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (47) (vl) ((batch_pre - batch )) (A))) (voutput_max) (47) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s46")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (46) (vl) ((batch_pre - batch )) (A))) (voutput_max) (46) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s45")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (45) (vl) ((batch_pre - batch )) (A))) (voutput_max) (45) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s44")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (44) (vl) ((batch_pre - batch )) (A))) (voutput_max) (44) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s43")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (43) (vl) ((batch_pre - batch )) (A))) (voutput_max) (43) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s42")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (42) (vl) ((batch_pre - batch )) (A))) (voutput_max) (42) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s41")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (41) (vl) ((batch_pre - batch )) (A))) (voutput_max) (41) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s40")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (40) (vl) ((batch_pre - batch )) (A))) (voutput_max) (40) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s39")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (39) (vl) ((batch_pre - batch )) (A))) (voutput_max) (39) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s38")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (38) (vl) ((batch_pre - batch )) (A))) (voutput_max) (38) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s37")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (37) (vl) ((batch_pre - batch )) (A))) (voutput_max) (37) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s36")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (36) (vl) ((batch_pre - batch )) (A))) (voutput_max) (36) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s35")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (35) (vl) ((batch_pre - batch )) (A))) (voutput_max) (35) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s34")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (34) (vl) ((batch_pre - batch )) (A))) (voutput_max) (34) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s33")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (33) (vl) ((batch_pre - batch )) (A))) (voutput_max) (33) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s32")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (32) (vl) ((batch_pre - batch )) (A))) (voutput_max) (32) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s31")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (31) (vl) ((batch_pre - batch )) (A))) (voutput_max) (31) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s30")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (30) (vl) ((batch_pre - batch )) (A))) (voutput_max) (30) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s29")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (29) (vl) ((batch_pre - batch )) (A))) (voutput_max) (29) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s28")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (28) (vl) ((batch_pre - batch )) (A))) (voutput_max) (28) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s27")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (27) (vl) ((batch_pre - batch )) (A))) (voutput_max) (27) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s26")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (26) (vl) ((batch_pre - batch )) (A))) (voutput_max) (26) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s25")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (25) (vl) ((batch_pre - batch )) (A))) (voutput_max) (25) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s24")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (24) (vl) ((batch_pre - batch )) (A))) (voutput_max) (24) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s23")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (23) (vl) ((batch_pre - batch )) (A))) (voutput_max) (23) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s22")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (22) (vl) ((batch_pre - batch )) (A))) (voutput_max) (22) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s21")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (21) (vl) ((batch_pre - batch )) (A))) (voutput_max) (21) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s20")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (20) (vl) ((batch_pre - batch )) (A))) (voutput_max) (20) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s19")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (19) (vl) ((batch_pre - batch )) (A))) (voutput_max) (19) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s18")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (18) (vl) ((batch_pre - batch )) (A))) (voutput_max) (18) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s17")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (17) (vl) ((batch_pre - batch )) (A))) (voutput_max) (17) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s16")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (16) (vl) ((batch_pre - batch )) (A))) (voutput_max) (16) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s15")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (15) (vl) ((batch_pre - batch )) (A))) (voutput_max) (15) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s14")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (14) (vl) ((batch_pre - batch )) (A))) (voutput_max) (14) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s13")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (13) (vl) ((batch_pre - batch )) (A))) (voutput_max) (13) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s12")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (12) (vl) ((batch_pre - batch )) (A))) (voutput_max) (12) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s11")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (11) (vl) ((batch_pre - batch )) (A))) (voutput_max) (11) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s10")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (10) (vl) ((batch_pre - batch )) (A))) (voutput_max) (10) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s9")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (9) (vl) ((batch_pre - batch )) (A))) (voutput_max) (9) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s8")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (8) (vl) ((batch_pre - batch )) (A))) (voutput_max) (8) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s7")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (7) (vl) ((batch_pre - batch )) (A))) (voutput_max) (7) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s6")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (6) (vl) ((batch_pre - batch )) (A))) (voutput_max) (6) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s5")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (5) (vl) ((batch_pre - batch )) (A))) (voutput_max) (5) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s4")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (4) (vl) ((batch_pre - batch )) (A))) (voutput_max) (4) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (3) (vl) ((batch_pre - batch )) (A))) (voutput_max) (3) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (2) (vl) ((batch_pre - batch )) (A))) (voutput_max) (2) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (1) (vl) ((batch_pre - batch )) (A))) (voutput_max) (1) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s0")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (0) (vl) ((batch_pre - batch )) (A))) (voutput_max) (0) (vl)))
  **  (CharArray.full input_pre (batch_pre + 7 ) A )
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
  **  (CharArray.full output_pre (batch_pre - batch ) (s8_rvv_progress ((batch_pre - batch )) (batch_pre) ((s8_narrow (RawLo))) ((s8_narrow (RawHi))) (A)) )
  **  (CharArray.undef_full output batch )
|--
  “ ((-128) <= voutput_min) ” 
  &&  “ (voutput_min <= 127) ” 
  &&  “ (0 <= vl) ” 
  &&  “ (vl <= 128) ” 
  &&  “ (batch64 = 0) ” 
  &&  “ (0 < vl) ” 
  &&  “ (vl <= 128) ” 
  &&  “ (vl <= batch) ” 
  &&  “ (0 < batch_pre) ” 
  &&  “ (batch_pre <= 18446744073709551608) ” 
  &&  “ (sizeof(CHAR) = 1) ” 
  &&  “ ((Zlength (A)) = (batch_pre + 7 )) ” 
  &&  “ (0 <= batch) ” 
  &&  “ (batch <= batch_pre) ” 
  &&  “ (input = (input_pre + ((batch_pre - batch ) * sizeof(CHAR)))) ” 
  &&  “ (batch > 0) ” 
  &&  “ (output = (output_pre + ((batch_pre - batch ) * sizeof(CHAR)))) ” 
  &&  “ (voutput_min = (s8_narrow (RawLo))) ” 
  &&  “ (voutput_max = (s8_narrow (RawHi))) ” 
  &&  “ ((-128) <= voutput_min) ” 
  &&  “ (voutput_min <= 127) ” 
  &&  “ ((-128) <= voutput_max) ” 
  &&  “ (voutput_max <= 127) ” 
  &&  “ ((s8_bulk_count (batch_pre)) <= (batch_pre - batch )) ”
  &&  ((&(( &( "vacc" ) )->ₛ "s0")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (0) (vl) ((batch_pre - batch )) (A))) (voutput_max) (0) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (1) (vl) ((batch_pre - batch )) (A))) (voutput_max) (1) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (2) (vl) ((batch_pre - batch )) (A))) (voutput_max) (2) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (3) (vl) ((batch_pre - batch )) (A))) (voutput_max) (3) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s4")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (4) (vl) ((batch_pre - batch )) (A))) (voutput_max) (4) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s5")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (5) (vl) ((batch_pre - batch )) (A))) (voutput_max) (5) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s6")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (6) (vl) ((batch_pre - batch )) (A))) (voutput_max) (6) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s7")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (7) (vl) ((batch_pre - batch )) (A))) (voutput_max) (7) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s8")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (8) (vl) ((batch_pre - batch )) (A))) (voutput_max) (8) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s9")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (9) (vl) ((batch_pre - batch )) (A))) (voutput_max) (9) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s10")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (10) (vl) ((batch_pre - batch )) (A))) (voutput_max) (10) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s11")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (11) (vl) ((batch_pre - batch )) (A))) (voutput_max) (11) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s12")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (12) (vl) ((batch_pre - batch )) (A))) (voutput_max) (12) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s13")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (13) (vl) ((batch_pre - batch )) (A))) (voutput_max) (13) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s14")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (14) (vl) ((batch_pre - batch )) (A))) (voutput_max) (14) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s15")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (15) (vl) ((batch_pre - batch )) (A))) (voutput_max) (15) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s16")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (16) (vl) ((batch_pre - batch )) (A))) (voutput_max) (16) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s17")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (17) (vl) ((batch_pre - batch )) (A))) (voutput_max) (17) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s18")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (18) (vl) ((batch_pre - batch )) (A))) (voutput_max) (18) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s19")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (19) (vl) ((batch_pre - batch )) (A))) (voutput_max) (19) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s20")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (20) (vl) ((batch_pre - batch )) (A))) (voutput_max) (20) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s21")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (21) (vl) ((batch_pre - batch )) (A))) (voutput_max) (21) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s22")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (22) (vl) ((batch_pre - batch )) (A))) (voutput_max) (22) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s23")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (23) (vl) ((batch_pre - batch )) (A))) (voutput_max) (23) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s24")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (24) (vl) ((batch_pre - batch )) (A))) (voutput_max) (24) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s25")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (25) (vl) ((batch_pre - batch )) (A))) (voutput_max) (25) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s26")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (26) (vl) ((batch_pre - batch )) (A))) (voutput_max) (26) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s27")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (27) (vl) ((batch_pre - batch )) (A))) (voutput_max) (27) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s28")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (28) (vl) ((batch_pre - batch )) (A))) (voutput_max) (28) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s29")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (29) (vl) ((batch_pre - batch )) (A))) (voutput_max) (29) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s30")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (30) (vl) ((batch_pre - batch )) (A))) (voutput_max) (30) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s31")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (31) (vl) ((batch_pre - batch )) (A))) (voutput_max) (31) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s32")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (32) (vl) ((batch_pre - batch )) (A))) (voutput_max) (32) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s33")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (33) (vl) ((batch_pre - batch )) (A))) (voutput_max) (33) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s34")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (34) (vl) ((batch_pre - batch )) (A))) (voutput_max) (34) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s35")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (35) (vl) ((batch_pre - batch )) (A))) (voutput_max) (35) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s36")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (36) (vl) ((batch_pre - batch )) (A))) (voutput_max) (36) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s37")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (37) (vl) ((batch_pre - batch )) (A))) (voutput_max) (37) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s38")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (38) (vl) ((batch_pre - batch )) (A))) (voutput_max) (38) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s39")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (39) (vl) ((batch_pre - batch )) (A))) (voutput_max) (39) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s40")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (40) (vl) ((batch_pre - batch )) (A))) (voutput_max) (40) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s41")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (41) (vl) ((batch_pre - batch )) (A))) (voutput_max) (41) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s42")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (42) (vl) ((batch_pre - batch )) (A))) (voutput_max) (42) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s43")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (43) (vl) ((batch_pre - batch )) (A))) (voutput_max) (43) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s44")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (44) (vl) ((batch_pre - batch )) (A))) (voutput_max) (44) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s45")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (45) (vl) ((batch_pre - batch )) (A))) (voutput_max) (45) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s46")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (46) (vl) ((batch_pre - batch )) (A))) (voutput_max) (46) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s47")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (47) (vl) ((batch_pre - batch )) (A))) (voutput_max) (47) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s48")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (48) (vl) ((batch_pre - batch )) (A))) (voutput_max) (48) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s49")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (49) (vl) ((batch_pre - batch )) (A))) (voutput_max) (49) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s50")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (50) (vl) ((batch_pre - batch )) (A))) (voutput_max) (50) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s51")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (51) (vl) ((batch_pre - batch )) (A))) (voutput_max) (51) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s52")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (52) (vl) ((batch_pre - batch )) (A))) (voutput_max) (52) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s53")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (53) (vl) ((batch_pre - batch )) (A))) (voutput_max) (53) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s54")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (54) (vl) ((batch_pre - batch )) (A))) (voutput_max) (54) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s55")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (55) (vl) ((batch_pre - batch )) (A))) (voutput_max) (55) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s56")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (56) (vl) ((batch_pre - batch )) (A))) (voutput_max) (56) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s57")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (57) (vl) ((batch_pre - batch )) (A))) (voutput_max) (57) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s58")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (58) (vl) ((batch_pre - batch )) (A))) (voutput_max) (58) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s59")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (59) (vl) ((batch_pre - batch )) (A))) (voutput_max) (59) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s60")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (60) (vl) ((batch_pre - batch )) (A))) (voutput_max) (60) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s61")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (61) (vl) ((batch_pre - batch )) (A))) (voutput_max) (61) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s62")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (62) (vl) ((batch_pre - batch )) (A))) (voutput_max) (62) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s63")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (63) (vl) ((batch_pre - batch )) (A))) (voutput_max) (63) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s64")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (64) (vl) ((batch_pre - batch )) (A))) (voutput_max) (64) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s65")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (65) (vl) ((batch_pre - batch )) (A))) (voutput_max) (65) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s66")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (66) (vl) ((batch_pre - batch )) (A))) (voutput_max) (66) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s67")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (67) (vl) ((batch_pre - batch )) (A))) (voutput_max) (67) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s68")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (68) (vl) ((batch_pre - batch )) (A))) (voutput_max) (68) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s69")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (69) (vl) ((batch_pre - batch )) (A))) (voutput_max) (69) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s70")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (70) (vl) ((batch_pre - batch )) (A))) (voutput_max) (70) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s71")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (71) (vl) ((batch_pre - batch )) (A))) (voutput_max) (71) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s72")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (72) (vl) ((batch_pre - batch )) (A))) (voutput_max) (72) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s73")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (73) (vl) ((batch_pre - batch )) (A))) (voutput_max) (73) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s74")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (74) (vl) ((batch_pre - batch )) (A))) (voutput_max) (74) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s75")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (75) (vl) ((batch_pre - batch )) (A))) (voutput_max) (75) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s76")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (76) (vl) ((batch_pre - batch )) (A))) (voutput_max) (76) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s77")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (77) (vl) ((batch_pre - batch )) (A))) (voutput_max) (77) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s78")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (78) (vl) ((batch_pre - batch )) (A))) (voutput_max) (78) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s79")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (79) (vl) ((batch_pre - batch )) (A))) (voutput_max) (79) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s80")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (80) (vl) ((batch_pre - batch )) (A))) (voutput_max) (80) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s81")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (81) (vl) ((batch_pre - batch )) (A))) (voutput_max) (81) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s82")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (82) (vl) ((batch_pre - batch )) (A))) (voutput_max) (82) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s83")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (83) (vl) ((batch_pre - batch )) (A))) (voutput_max) (83) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s84")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (84) (vl) ((batch_pre - batch )) (A))) (voutput_max) (84) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s85")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (85) (vl) ((batch_pre - batch )) (A))) (voutput_max) (85) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s86")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (86) (vl) ((batch_pre - batch )) (A))) (voutput_max) (86) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s87")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (87) (vl) ((batch_pre - batch )) (A))) (voutput_max) (87) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s88")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (88) (vl) ((batch_pre - batch )) (A))) (voutput_max) (88) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s89")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (89) (vl) ((batch_pre - batch )) (A))) (voutput_max) (89) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s90")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (90) (vl) ((batch_pre - batch )) (A))) (voutput_max) (90) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s91")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (91) (vl) ((batch_pre - batch )) (A))) (voutput_max) (91) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s92")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (92) (vl) ((batch_pre - batch )) (A))) (voutput_max) (92) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s93")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (93) (vl) ((batch_pre - batch )) (A))) (voutput_max) (93) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s94")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (94) (vl) ((batch_pre - batch )) (A))) (voutput_max) (94) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s95")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (95) (vl) ((batch_pre - batch )) (A))) (voutput_max) (95) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s96")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (96) (vl) ((batch_pre - batch )) (A))) (voutput_max) (96) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s97")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (97) (vl) ((batch_pre - batch )) (A))) (voutput_max) (97) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s98")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (98) (vl) ((batch_pre - batch )) (A))) (voutput_max) (98) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s99")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (99) (vl) ((batch_pre - batch )) (A))) (voutput_max) (99) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s100")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (100) (vl) ((batch_pre - batch )) (A))) (voutput_max) (100) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s101")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (101) (vl) ((batch_pre - batch )) (A))) (voutput_max) (101) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s102")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (102) (vl) ((batch_pre - batch )) (A))) (voutput_max) (102) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s103")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (103) (vl) ((batch_pre - batch )) (A))) (voutput_max) (103) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s104")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (104) (vl) ((batch_pre - batch )) (A))) (voutput_max) (104) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s105")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (105) (vl) ((batch_pre - batch )) (A))) (voutput_max) (105) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s106")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (106) (vl) ((batch_pre - batch )) (A))) (voutput_max) (106) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s107")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (107) (vl) ((batch_pre - batch )) (A))) (voutput_max) (107) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s108")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (108) (vl) ((batch_pre - batch )) (A))) (voutput_max) (108) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s109")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (109) (vl) ((batch_pre - batch )) (A))) (voutput_max) (109) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s110")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (110) (vl) ((batch_pre - batch )) (A))) (voutput_max) (110) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s111")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (111) (vl) ((batch_pre - batch )) (A))) (voutput_max) (111) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s112")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (112) (vl) ((batch_pre - batch )) (A))) (voutput_max) (112) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s113")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (113) (vl) ((batch_pre - batch )) (A))) (voutput_max) (113) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s114")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (114) (vl) ((batch_pre - batch )) (A))) (voutput_max) (114) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s115")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (115) (vl) ((batch_pre - batch )) (A))) (voutput_max) (115) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s116")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (116) (vl) ((batch_pre - batch )) (A))) (voutput_max) (116) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s117")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (117) (vl) ((batch_pre - batch )) (A))) (voutput_max) (117) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s118")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (118) (vl) ((batch_pre - batch )) (A))) (voutput_max) (118) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s119")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (119) (vl) ((batch_pre - batch )) (A))) (voutput_max) (119) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s120")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (120) (vl) ((batch_pre - batch )) (A))) (voutput_max) (120) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s121")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (121) (vl) ((batch_pre - batch )) (A))) (voutput_max) (121) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s122")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (122) (vl) ((batch_pre - batch )) (A))) (voutput_max) (122) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s123")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (123) (vl) ((batch_pre - batch )) (A))) (voutput_max) (123) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s124")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (124) (vl) ((batch_pre - batch )) (A))) (voutput_max) (124) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s125")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (125) (vl) ((batch_pre - batch )) (A))) (voutput_max) (125) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s126")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (126) (vl) ((batch_pre - batch )) (A))) (voutput_max) (126) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s127")) # Char  |-> (s8_rvv_min_lane ((s8_read_lane (127) (vl) ((batch_pre - batch )) (A))) (voutput_max) (127) (vl)))
  **  (CharArray.full input_pre (batch_pre + 7 ) A )
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
  **  (CharArray.full output_pre (batch_pre - batch ) (s8_rvv_progress ((batch_pre - batch )) (batch_pre) ((s8_narrow (RawLo))) ((s8_narrow (RawHi))) (A)) )
  **  (CharArray.undef_full output batch )
.

Definition test_rvv_partial_solve_wit_18 := test_rvv_partial_solve_wit_18_pure -> test_rvv_partial_solve_wit_18_aux.

Definition test_rvv_partial_solve_wit_19 := 
forall (params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (RawHi: Z) (RawLo: Z) (A: (@list Z)) (batch64: Z) (vl: Z) (batch: Z) (input: Z) (output: Z) (voutput_min: Z) (voutput_max: Z) (retval: Z) (PreH1 : (batch64 = 0)) (PreH2 : (0 < vl)) (PreH3 : (vl <= 128)) (PreH4 : (vl <= batch)) (PreH5 : (0 < batch_pre)) (PreH6 : (batch_pre <= 18446744073709551608)) (PreH7 : (sizeof(CHAR) = 1)) (PreH8 : ((Zlength (A)) = (batch_pre + 7 ))) (PreH9 : (0 <= batch)) (PreH10 : (batch <= batch_pre)) (PreH11 : (input = (input_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH12 : (batch > 0)) (PreH13 : (output = (output_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH14 : (voutput_min = (s8_narrow (RawLo)))) (PreH15 : (voutput_max = (s8_narrow (RawHi)))) (PreH16 : ((-128) <= voutput_min)) (PreH17 : (voutput_min <= 127)) (PreH18 : ((-128) <= voutput_max)) (PreH19 : (voutput_max <= 127)) (PreH20 : ((s8_bulk_count (batch_pre)) <= (batch_pre - batch ))) ,
  (UndefStructPredvint8m8_t ( &( "vacc" ) ) )
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s0")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (0) (vl) ((batch_pre - batch )) (A))) (voutput_max) (0) (vl))) (voutput_min) (0) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s1")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (1) (vl) ((batch_pre - batch )) (A))) (voutput_max) (1) (vl))) (voutput_min) (1) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s2")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (2) (vl) ((batch_pre - batch )) (A))) (voutput_max) (2) (vl))) (voutput_min) (2) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s3")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (3) (vl) ((batch_pre - batch )) (A))) (voutput_max) (3) (vl))) (voutput_min) (3) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s4")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (4) (vl) ((batch_pre - batch )) (A))) (voutput_max) (4) (vl))) (voutput_min) (4) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s5")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (5) (vl) ((batch_pre - batch )) (A))) (voutput_max) (5) (vl))) (voutput_min) (5) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s6")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (6) (vl) ((batch_pre - batch )) (A))) (voutput_max) (6) (vl))) (voutput_min) (6) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s7")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (7) (vl) ((batch_pre - batch )) (A))) (voutput_max) (7) (vl))) (voutput_min) (7) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s8")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (8) (vl) ((batch_pre - batch )) (A))) (voutput_max) (8) (vl))) (voutput_min) (8) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s9")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (9) (vl) ((batch_pre - batch )) (A))) (voutput_max) (9) (vl))) (voutput_min) (9) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s10")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (10) (vl) ((batch_pre - batch )) (A))) (voutput_max) (10) (vl))) (voutput_min) (10) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s11")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (11) (vl) ((batch_pre - batch )) (A))) (voutput_max) (11) (vl))) (voutput_min) (11) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s12")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (12) (vl) ((batch_pre - batch )) (A))) (voutput_max) (12) (vl))) (voutput_min) (12) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s13")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (13) (vl) ((batch_pre - batch )) (A))) (voutput_max) (13) (vl))) (voutput_min) (13) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s14")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (14) (vl) ((batch_pre - batch )) (A))) (voutput_max) (14) (vl))) (voutput_min) (14) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s15")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (15) (vl) ((batch_pre - batch )) (A))) (voutput_max) (15) (vl))) (voutput_min) (15) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s16")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (16) (vl) ((batch_pre - batch )) (A))) (voutput_max) (16) (vl))) (voutput_min) (16) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s17")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (17) (vl) ((batch_pre - batch )) (A))) (voutput_max) (17) (vl))) (voutput_min) (17) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s18")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (18) (vl) ((batch_pre - batch )) (A))) (voutput_max) (18) (vl))) (voutput_min) (18) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s19")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (19) (vl) ((batch_pre - batch )) (A))) (voutput_max) (19) (vl))) (voutput_min) (19) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s20")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (20) (vl) ((batch_pre - batch )) (A))) (voutput_max) (20) (vl))) (voutput_min) (20) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s21")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (21) (vl) ((batch_pre - batch )) (A))) (voutput_max) (21) (vl))) (voutput_min) (21) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s22")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (22) (vl) ((batch_pre - batch )) (A))) (voutput_max) (22) (vl))) (voutput_min) (22) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s23")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (23) (vl) ((batch_pre - batch )) (A))) (voutput_max) (23) (vl))) (voutput_min) (23) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s24")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (24) (vl) ((batch_pre - batch )) (A))) (voutput_max) (24) (vl))) (voutput_min) (24) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s25")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (25) (vl) ((batch_pre - batch )) (A))) (voutput_max) (25) (vl))) (voutput_min) (25) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s26")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (26) (vl) ((batch_pre - batch )) (A))) (voutput_max) (26) (vl))) (voutput_min) (26) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s27")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (27) (vl) ((batch_pre - batch )) (A))) (voutput_max) (27) (vl))) (voutput_min) (27) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s28")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (28) (vl) ((batch_pre - batch )) (A))) (voutput_max) (28) (vl))) (voutput_min) (28) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s29")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (29) (vl) ((batch_pre - batch )) (A))) (voutput_max) (29) (vl))) (voutput_min) (29) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s30")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (30) (vl) ((batch_pre - batch )) (A))) (voutput_max) (30) (vl))) (voutput_min) (30) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s31")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (31) (vl) ((batch_pre - batch )) (A))) (voutput_max) (31) (vl))) (voutput_min) (31) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s32")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (32) (vl) ((batch_pre - batch )) (A))) (voutput_max) (32) (vl))) (voutput_min) (32) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s33")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (33) (vl) ((batch_pre - batch )) (A))) (voutput_max) (33) (vl))) (voutput_min) (33) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s34")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (34) (vl) ((batch_pre - batch )) (A))) (voutput_max) (34) (vl))) (voutput_min) (34) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s35")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (35) (vl) ((batch_pre - batch )) (A))) (voutput_max) (35) (vl))) (voutput_min) (35) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s36")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (36) (vl) ((batch_pre - batch )) (A))) (voutput_max) (36) (vl))) (voutput_min) (36) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s37")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (37) (vl) ((batch_pre - batch )) (A))) (voutput_max) (37) (vl))) (voutput_min) (37) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s38")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (38) (vl) ((batch_pre - batch )) (A))) (voutput_max) (38) (vl))) (voutput_min) (38) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s39")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (39) (vl) ((batch_pre - batch )) (A))) (voutput_max) (39) (vl))) (voutput_min) (39) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s40")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (40) (vl) ((batch_pre - batch )) (A))) (voutput_max) (40) (vl))) (voutput_min) (40) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s41")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (41) (vl) ((batch_pre - batch )) (A))) (voutput_max) (41) (vl))) (voutput_min) (41) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s42")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (42) (vl) ((batch_pre - batch )) (A))) (voutput_max) (42) (vl))) (voutput_min) (42) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s43")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (43) (vl) ((batch_pre - batch )) (A))) (voutput_max) (43) (vl))) (voutput_min) (43) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s44")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (44) (vl) ((batch_pre - batch )) (A))) (voutput_max) (44) (vl))) (voutput_min) (44) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s45")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (45) (vl) ((batch_pre - batch )) (A))) (voutput_max) (45) (vl))) (voutput_min) (45) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s46")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (46) (vl) ((batch_pre - batch )) (A))) (voutput_max) (46) (vl))) (voutput_min) (46) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s47")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (47) (vl) ((batch_pre - batch )) (A))) (voutput_max) (47) (vl))) (voutput_min) (47) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s48")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (48) (vl) ((batch_pre - batch )) (A))) (voutput_max) (48) (vl))) (voutput_min) (48) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s49")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (49) (vl) ((batch_pre - batch )) (A))) (voutput_max) (49) (vl))) (voutput_min) (49) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s50")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (50) (vl) ((batch_pre - batch )) (A))) (voutput_max) (50) (vl))) (voutput_min) (50) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s51")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (51) (vl) ((batch_pre - batch )) (A))) (voutput_max) (51) (vl))) (voutput_min) (51) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s52")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (52) (vl) ((batch_pre - batch )) (A))) (voutput_max) (52) (vl))) (voutput_min) (52) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s53")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (53) (vl) ((batch_pre - batch )) (A))) (voutput_max) (53) (vl))) (voutput_min) (53) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s54")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (54) (vl) ((batch_pre - batch )) (A))) (voutput_max) (54) (vl))) (voutput_min) (54) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s55")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (55) (vl) ((batch_pre - batch )) (A))) (voutput_max) (55) (vl))) (voutput_min) (55) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s56")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (56) (vl) ((batch_pre - batch )) (A))) (voutput_max) (56) (vl))) (voutput_min) (56) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s57")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (57) (vl) ((batch_pre - batch )) (A))) (voutput_max) (57) (vl))) (voutput_min) (57) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s58")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (58) (vl) ((batch_pre - batch )) (A))) (voutput_max) (58) (vl))) (voutput_min) (58) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s59")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (59) (vl) ((batch_pre - batch )) (A))) (voutput_max) (59) (vl))) (voutput_min) (59) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s60")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (60) (vl) ((batch_pre - batch )) (A))) (voutput_max) (60) (vl))) (voutput_min) (60) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s61")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (61) (vl) ((batch_pre - batch )) (A))) (voutput_max) (61) (vl))) (voutput_min) (61) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s62")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (62) (vl) ((batch_pre - batch )) (A))) (voutput_max) (62) (vl))) (voutput_min) (62) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s63")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (63) (vl) ((batch_pre - batch )) (A))) (voutput_max) (63) (vl))) (voutput_min) (63) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s64")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (64) (vl) ((batch_pre - batch )) (A))) (voutput_max) (64) (vl))) (voutput_min) (64) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s65")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (65) (vl) ((batch_pre - batch )) (A))) (voutput_max) (65) (vl))) (voutput_min) (65) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s66")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (66) (vl) ((batch_pre - batch )) (A))) (voutput_max) (66) (vl))) (voutput_min) (66) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s67")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (67) (vl) ((batch_pre - batch )) (A))) (voutput_max) (67) (vl))) (voutput_min) (67) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s68")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (68) (vl) ((batch_pre - batch )) (A))) (voutput_max) (68) (vl))) (voutput_min) (68) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s69")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (69) (vl) ((batch_pre - batch )) (A))) (voutput_max) (69) (vl))) (voutput_min) (69) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s70")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (70) (vl) ((batch_pre - batch )) (A))) (voutput_max) (70) (vl))) (voutput_min) (70) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s71")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (71) (vl) ((batch_pre - batch )) (A))) (voutput_max) (71) (vl))) (voutput_min) (71) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s72")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (72) (vl) ((batch_pre - batch )) (A))) (voutput_max) (72) (vl))) (voutput_min) (72) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s73")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (73) (vl) ((batch_pre - batch )) (A))) (voutput_max) (73) (vl))) (voutput_min) (73) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s74")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (74) (vl) ((batch_pre - batch )) (A))) (voutput_max) (74) (vl))) (voutput_min) (74) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s75")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (75) (vl) ((batch_pre - batch )) (A))) (voutput_max) (75) (vl))) (voutput_min) (75) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s76")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (76) (vl) ((batch_pre - batch )) (A))) (voutput_max) (76) (vl))) (voutput_min) (76) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s77")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (77) (vl) ((batch_pre - batch )) (A))) (voutput_max) (77) (vl))) (voutput_min) (77) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s78")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (78) (vl) ((batch_pre - batch )) (A))) (voutput_max) (78) (vl))) (voutput_min) (78) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s79")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (79) (vl) ((batch_pre - batch )) (A))) (voutput_max) (79) (vl))) (voutput_min) (79) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s80")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (80) (vl) ((batch_pre - batch )) (A))) (voutput_max) (80) (vl))) (voutput_min) (80) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s81")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (81) (vl) ((batch_pre - batch )) (A))) (voutput_max) (81) (vl))) (voutput_min) (81) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s82")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (82) (vl) ((batch_pre - batch )) (A))) (voutput_max) (82) (vl))) (voutput_min) (82) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s83")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (83) (vl) ((batch_pre - batch )) (A))) (voutput_max) (83) (vl))) (voutput_min) (83) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s84")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (84) (vl) ((batch_pre - batch )) (A))) (voutput_max) (84) (vl))) (voutput_min) (84) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s85")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (85) (vl) ((batch_pre - batch )) (A))) (voutput_max) (85) (vl))) (voutput_min) (85) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s86")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (86) (vl) ((batch_pre - batch )) (A))) (voutput_max) (86) (vl))) (voutput_min) (86) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s87")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (87) (vl) ((batch_pre - batch )) (A))) (voutput_max) (87) (vl))) (voutput_min) (87) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s88")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (88) (vl) ((batch_pre - batch )) (A))) (voutput_max) (88) (vl))) (voutput_min) (88) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s89")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (89) (vl) ((batch_pre - batch )) (A))) (voutput_max) (89) (vl))) (voutput_min) (89) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s90")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (90) (vl) ((batch_pre - batch )) (A))) (voutput_max) (90) (vl))) (voutput_min) (90) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s91")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (91) (vl) ((batch_pre - batch )) (A))) (voutput_max) (91) (vl))) (voutput_min) (91) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s92")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (92) (vl) ((batch_pre - batch )) (A))) (voutput_max) (92) (vl))) (voutput_min) (92) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s93")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (93) (vl) ((batch_pre - batch )) (A))) (voutput_max) (93) (vl))) (voutput_min) (93) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s94")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (94) (vl) ((batch_pre - batch )) (A))) (voutput_max) (94) (vl))) (voutput_min) (94) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s95")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (95) (vl) ((batch_pre - batch )) (A))) (voutput_max) (95) (vl))) (voutput_min) (95) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s96")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (96) (vl) ((batch_pre - batch )) (A))) (voutput_max) (96) (vl))) (voutput_min) (96) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s97")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (97) (vl) ((batch_pre - batch )) (A))) (voutput_max) (97) (vl))) (voutput_min) (97) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s98")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (98) (vl) ((batch_pre - batch )) (A))) (voutput_max) (98) (vl))) (voutput_min) (98) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s99")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (99) (vl) ((batch_pre - batch )) (A))) (voutput_max) (99) (vl))) (voutput_min) (99) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s100")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (100) (vl) ((batch_pre - batch )) (A))) (voutput_max) (100) (vl))) (voutput_min) (100) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s101")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (101) (vl) ((batch_pre - batch )) (A))) (voutput_max) (101) (vl))) (voutput_min) (101) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s102")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (102) (vl) ((batch_pre - batch )) (A))) (voutput_max) (102) (vl))) (voutput_min) (102) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s103")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (103) (vl) ((batch_pre - batch )) (A))) (voutput_max) (103) (vl))) (voutput_min) (103) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s104")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (104) (vl) ((batch_pre - batch )) (A))) (voutput_max) (104) (vl))) (voutput_min) (104) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s105")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (105) (vl) ((batch_pre - batch )) (A))) (voutput_max) (105) (vl))) (voutput_min) (105) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s106")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (106) (vl) ((batch_pre - batch )) (A))) (voutput_max) (106) (vl))) (voutput_min) (106) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s107")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (107) (vl) ((batch_pre - batch )) (A))) (voutput_max) (107) (vl))) (voutput_min) (107) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s108")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (108) (vl) ((batch_pre - batch )) (A))) (voutput_max) (108) (vl))) (voutput_min) (108) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s109")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (109) (vl) ((batch_pre - batch )) (A))) (voutput_max) (109) (vl))) (voutput_min) (109) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s110")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (110) (vl) ((batch_pre - batch )) (A))) (voutput_max) (110) (vl))) (voutput_min) (110) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s111")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (111) (vl) ((batch_pre - batch )) (A))) (voutput_max) (111) (vl))) (voutput_min) (111) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s112")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (112) (vl) ((batch_pre - batch )) (A))) (voutput_max) (112) (vl))) (voutput_min) (112) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s113")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (113) (vl) ((batch_pre - batch )) (A))) (voutput_max) (113) (vl))) (voutput_min) (113) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s114")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (114) (vl) ((batch_pre - batch )) (A))) (voutput_max) (114) (vl))) (voutput_min) (114) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s115")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (115) (vl) ((batch_pre - batch )) (A))) (voutput_max) (115) (vl))) (voutput_min) (115) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s116")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (116) (vl) ((batch_pre - batch )) (A))) (voutput_max) (116) (vl))) (voutput_min) (116) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s117")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (117) (vl) ((batch_pre - batch )) (A))) (voutput_max) (117) (vl))) (voutput_min) (117) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s118")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (118) (vl) ((batch_pre - batch )) (A))) (voutput_max) (118) (vl))) (voutput_min) (118) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s119")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (119) (vl) ((batch_pre - batch )) (A))) (voutput_max) (119) (vl))) (voutput_min) (119) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s120")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (120) (vl) ((batch_pre - batch )) (A))) (voutput_max) (120) (vl))) (voutput_min) (120) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s121")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (121) (vl) ((batch_pre - batch )) (A))) (voutput_max) (121) (vl))) (voutput_min) (121) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s122")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (122) (vl) ((batch_pre - batch )) (A))) (voutput_max) (122) (vl))) (voutput_min) (122) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s123")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (123) (vl) ((batch_pre - batch )) (A))) (voutput_max) (123) (vl))) (voutput_min) (123) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s124")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (124) (vl) ((batch_pre - batch )) (A))) (voutput_max) (124) (vl))) (voutput_min) (124) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s125")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (125) (vl) ((batch_pre - batch )) (A))) (voutput_max) (125) (vl))) (voutput_min) (125) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s126")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (126) (vl) ((batch_pre - batch )) (A))) (voutput_max) (126) (vl))) (voutput_min) (126) (vl)))
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s127")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (127) (vl) ((batch_pre - batch )) (A))) (voutput_max) (127) (vl))) (voutput_min) (127) (vl)))
  **  (CharArray.full input_pre (batch_pre + 7 ) A )
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
  **  (CharArray.full output_pre (batch_pre - batch ) (s8_rvv_progress ((batch_pre - batch )) (batch_pre) ((s8_narrow (RawLo))) ((s8_narrow (RawHi))) (A)) )
  **  (CharArray.undef_full output batch )
|--
  “ (batch64 = 0) ” 
  &&  “ (0 < vl) ” 
  &&  “ (vl <= 128) ” 
  &&  “ (vl <= batch) ” 
  &&  “ (0 < batch_pre) ” 
  &&  “ (batch_pre <= 18446744073709551608) ” 
  &&  “ (sizeof(CHAR) = 1) ” 
  &&  “ ((Zlength (A)) = (batch_pre + 7 )) ” 
  &&  “ (0 <= batch) ” 
  &&  “ (batch <= batch_pre) ” 
  &&  “ (input = (input_pre + ((batch_pre - batch ) * sizeof(CHAR)))) ” 
  &&  “ (batch > 0) ” 
  &&  “ (output = (output_pre + ((batch_pre - batch ) * sizeof(CHAR)))) ” 
  &&  “ (voutput_min = (s8_narrow (RawLo))) ” 
  &&  “ (voutput_max = (s8_narrow (RawHi))) ” 
  &&  “ ((-128) <= voutput_min) ” 
  &&  “ (voutput_min <= 127) ” 
  &&  “ ((-128) <= voutput_max) ” 
  &&  “ (voutput_max <= 127) ” 
  &&  “ ((s8_bulk_count (batch_pre)) <= (batch_pre - batch )) ”
  &&  ((&(( &( "vacc" ) )->ₛ "s127")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s127")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (127) (vl) ((batch_pre - batch )) (A))) (voutput_max) (127) (vl))) (voutput_min) (127) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s126")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s126")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (126) (vl) ((batch_pre - batch )) (A))) (voutput_max) (126) (vl))) (voutput_min) (126) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s125")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s125")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (125) (vl) ((batch_pre - batch )) (A))) (voutput_max) (125) (vl))) (voutput_min) (125) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s124")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s124")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (124) (vl) ((batch_pre - batch )) (A))) (voutput_max) (124) (vl))) (voutput_min) (124) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s123")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s123")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (123) (vl) ((batch_pre - batch )) (A))) (voutput_max) (123) (vl))) (voutput_min) (123) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s122")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s122")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (122) (vl) ((batch_pre - batch )) (A))) (voutput_max) (122) (vl))) (voutput_min) (122) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s121")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s121")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (121) (vl) ((batch_pre - batch )) (A))) (voutput_max) (121) (vl))) (voutput_min) (121) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s120")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s120")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (120) (vl) ((batch_pre - batch )) (A))) (voutput_max) (120) (vl))) (voutput_min) (120) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s119")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s119")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (119) (vl) ((batch_pre - batch )) (A))) (voutput_max) (119) (vl))) (voutput_min) (119) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s118")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s118")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (118) (vl) ((batch_pre - batch )) (A))) (voutput_max) (118) (vl))) (voutput_min) (118) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s117")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s117")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (117) (vl) ((batch_pre - batch )) (A))) (voutput_max) (117) (vl))) (voutput_min) (117) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s116")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s116")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (116) (vl) ((batch_pre - batch )) (A))) (voutput_max) (116) (vl))) (voutput_min) (116) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s115")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s115")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (115) (vl) ((batch_pre - batch )) (A))) (voutput_max) (115) (vl))) (voutput_min) (115) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s114")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s114")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (114) (vl) ((batch_pre - batch )) (A))) (voutput_max) (114) (vl))) (voutput_min) (114) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s113")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s113")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (113) (vl) ((batch_pre - batch )) (A))) (voutput_max) (113) (vl))) (voutput_min) (113) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s112")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s112")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (112) (vl) ((batch_pre - batch )) (A))) (voutput_max) (112) (vl))) (voutput_min) (112) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s111")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s111")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (111) (vl) ((batch_pre - batch )) (A))) (voutput_max) (111) (vl))) (voutput_min) (111) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s110")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s110")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (110) (vl) ((batch_pre - batch )) (A))) (voutput_max) (110) (vl))) (voutput_min) (110) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s109")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s109")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (109) (vl) ((batch_pre - batch )) (A))) (voutput_max) (109) (vl))) (voutput_min) (109) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s108")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s108")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (108) (vl) ((batch_pre - batch )) (A))) (voutput_max) (108) (vl))) (voutput_min) (108) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s107")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s107")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (107) (vl) ((batch_pre - batch )) (A))) (voutput_max) (107) (vl))) (voutput_min) (107) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s106")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s106")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (106) (vl) ((batch_pre - batch )) (A))) (voutput_max) (106) (vl))) (voutput_min) (106) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s105")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s105")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (105) (vl) ((batch_pre - batch )) (A))) (voutput_max) (105) (vl))) (voutput_min) (105) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s104")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s104")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (104) (vl) ((batch_pre - batch )) (A))) (voutput_max) (104) (vl))) (voutput_min) (104) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s103")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s103")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (103) (vl) ((batch_pre - batch )) (A))) (voutput_max) (103) (vl))) (voutput_min) (103) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s102")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s102")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (102) (vl) ((batch_pre - batch )) (A))) (voutput_max) (102) (vl))) (voutput_min) (102) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s101")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s101")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (101) (vl) ((batch_pre - batch )) (A))) (voutput_max) (101) (vl))) (voutput_min) (101) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s100")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s100")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (100) (vl) ((batch_pre - batch )) (A))) (voutput_max) (100) (vl))) (voutput_min) (100) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s99")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s99")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (99) (vl) ((batch_pre - batch )) (A))) (voutput_max) (99) (vl))) (voutput_min) (99) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s98")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s98")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (98) (vl) ((batch_pre - batch )) (A))) (voutput_max) (98) (vl))) (voutput_min) (98) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s97")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s97")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (97) (vl) ((batch_pre - batch )) (A))) (voutput_max) (97) (vl))) (voutput_min) (97) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s96")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s96")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (96) (vl) ((batch_pre - batch )) (A))) (voutput_max) (96) (vl))) (voutput_min) (96) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s95")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s95")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (95) (vl) ((batch_pre - batch )) (A))) (voutput_max) (95) (vl))) (voutput_min) (95) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s94")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s94")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (94) (vl) ((batch_pre - batch )) (A))) (voutput_max) (94) (vl))) (voutput_min) (94) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s93")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s93")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (93) (vl) ((batch_pre - batch )) (A))) (voutput_max) (93) (vl))) (voutput_min) (93) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s92")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s92")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (92) (vl) ((batch_pre - batch )) (A))) (voutput_max) (92) (vl))) (voutput_min) (92) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s91")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s91")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (91) (vl) ((batch_pre - batch )) (A))) (voutput_max) (91) (vl))) (voutput_min) (91) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s90")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s90")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (90) (vl) ((batch_pre - batch )) (A))) (voutput_max) (90) (vl))) (voutput_min) (90) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s89")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s89")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (89) (vl) ((batch_pre - batch )) (A))) (voutput_max) (89) (vl))) (voutput_min) (89) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s88")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s88")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (88) (vl) ((batch_pre - batch )) (A))) (voutput_max) (88) (vl))) (voutput_min) (88) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s87")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s87")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (87) (vl) ((batch_pre - batch )) (A))) (voutput_max) (87) (vl))) (voutput_min) (87) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s86")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s86")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (86) (vl) ((batch_pre - batch )) (A))) (voutput_max) (86) (vl))) (voutput_min) (86) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s85")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s85")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (85) (vl) ((batch_pre - batch )) (A))) (voutput_max) (85) (vl))) (voutput_min) (85) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s84")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s84")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (84) (vl) ((batch_pre - batch )) (A))) (voutput_max) (84) (vl))) (voutput_min) (84) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s83")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s83")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (83) (vl) ((batch_pre - batch )) (A))) (voutput_max) (83) (vl))) (voutput_min) (83) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s82")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s82")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (82) (vl) ((batch_pre - batch )) (A))) (voutput_max) (82) (vl))) (voutput_min) (82) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s81")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s81")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (81) (vl) ((batch_pre - batch )) (A))) (voutput_max) (81) (vl))) (voutput_min) (81) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s80")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s80")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (80) (vl) ((batch_pre - batch )) (A))) (voutput_max) (80) (vl))) (voutput_min) (80) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s79")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s79")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (79) (vl) ((batch_pre - batch )) (A))) (voutput_max) (79) (vl))) (voutput_min) (79) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s78")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s78")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (78) (vl) ((batch_pre - batch )) (A))) (voutput_max) (78) (vl))) (voutput_min) (78) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s77")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s77")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (77) (vl) ((batch_pre - batch )) (A))) (voutput_max) (77) (vl))) (voutput_min) (77) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s76")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s76")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (76) (vl) ((batch_pre - batch )) (A))) (voutput_max) (76) (vl))) (voutput_min) (76) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s75")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s75")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (75) (vl) ((batch_pre - batch )) (A))) (voutput_max) (75) (vl))) (voutput_min) (75) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s74")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s74")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (74) (vl) ((batch_pre - batch )) (A))) (voutput_max) (74) (vl))) (voutput_min) (74) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s73")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s73")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (73) (vl) ((batch_pre - batch )) (A))) (voutput_max) (73) (vl))) (voutput_min) (73) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s72")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s72")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (72) (vl) ((batch_pre - batch )) (A))) (voutput_max) (72) (vl))) (voutput_min) (72) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s71")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s71")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (71) (vl) ((batch_pre - batch )) (A))) (voutput_max) (71) (vl))) (voutput_min) (71) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s70")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s70")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (70) (vl) ((batch_pre - batch )) (A))) (voutput_max) (70) (vl))) (voutput_min) (70) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s69")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s69")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (69) (vl) ((batch_pre - batch )) (A))) (voutput_max) (69) (vl))) (voutput_min) (69) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s68")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s68")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (68) (vl) ((batch_pre - batch )) (A))) (voutput_max) (68) (vl))) (voutput_min) (68) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s67")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s67")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (67) (vl) ((batch_pre - batch )) (A))) (voutput_max) (67) (vl))) (voutput_min) (67) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s66")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s66")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (66) (vl) ((batch_pre - batch )) (A))) (voutput_max) (66) (vl))) (voutput_min) (66) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s65")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s65")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (65) (vl) ((batch_pre - batch )) (A))) (voutput_max) (65) (vl))) (voutput_min) (65) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s64")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s64")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (64) (vl) ((batch_pre - batch )) (A))) (voutput_max) (64) (vl))) (voutput_min) (64) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s63")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s63")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (63) (vl) ((batch_pre - batch )) (A))) (voutput_max) (63) (vl))) (voutput_min) (63) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s62")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s62")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (62) (vl) ((batch_pre - batch )) (A))) (voutput_max) (62) (vl))) (voutput_min) (62) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s61")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s61")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (61) (vl) ((batch_pre - batch )) (A))) (voutput_max) (61) (vl))) (voutput_min) (61) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s60")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s60")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (60) (vl) ((batch_pre - batch )) (A))) (voutput_max) (60) (vl))) (voutput_min) (60) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s59")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s59")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (59) (vl) ((batch_pre - batch )) (A))) (voutput_max) (59) (vl))) (voutput_min) (59) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s58")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s58")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (58) (vl) ((batch_pre - batch )) (A))) (voutput_max) (58) (vl))) (voutput_min) (58) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s57")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s57")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (57) (vl) ((batch_pre - batch )) (A))) (voutput_max) (57) (vl))) (voutput_min) (57) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s56")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s56")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (56) (vl) ((batch_pre - batch )) (A))) (voutput_max) (56) (vl))) (voutput_min) (56) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s55")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s55")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (55) (vl) ((batch_pre - batch )) (A))) (voutput_max) (55) (vl))) (voutput_min) (55) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s54")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s54")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (54) (vl) ((batch_pre - batch )) (A))) (voutput_max) (54) (vl))) (voutput_min) (54) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s53")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s53")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (53) (vl) ((batch_pre - batch )) (A))) (voutput_max) (53) (vl))) (voutput_min) (53) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s52")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s52")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (52) (vl) ((batch_pre - batch )) (A))) (voutput_max) (52) (vl))) (voutput_min) (52) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s51")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s51")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (51) (vl) ((batch_pre - batch )) (A))) (voutput_max) (51) (vl))) (voutput_min) (51) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s50")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s50")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (50) (vl) ((batch_pre - batch )) (A))) (voutput_max) (50) (vl))) (voutput_min) (50) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s49")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s49")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (49) (vl) ((batch_pre - batch )) (A))) (voutput_max) (49) (vl))) (voutput_min) (49) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s48")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s48")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (48) (vl) ((batch_pre - batch )) (A))) (voutput_max) (48) (vl))) (voutput_min) (48) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s47")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s47")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (47) (vl) ((batch_pre - batch )) (A))) (voutput_max) (47) (vl))) (voutput_min) (47) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s46")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s46")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (46) (vl) ((batch_pre - batch )) (A))) (voutput_max) (46) (vl))) (voutput_min) (46) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s45")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s45")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (45) (vl) ((batch_pre - batch )) (A))) (voutput_max) (45) (vl))) (voutput_min) (45) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s44")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s44")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (44) (vl) ((batch_pre - batch )) (A))) (voutput_max) (44) (vl))) (voutput_min) (44) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s43")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s43")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (43) (vl) ((batch_pre - batch )) (A))) (voutput_max) (43) (vl))) (voutput_min) (43) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s42")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s42")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (42) (vl) ((batch_pre - batch )) (A))) (voutput_max) (42) (vl))) (voutput_min) (42) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s41")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s41")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (41) (vl) ((batch_pre - batch )) (A))) (voutput_max) (41) (vl))) (voutput_min) (41) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s40")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s40")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (40) (vl) ((batch_pre - batch )) (A))) (voutput_max) (40) (vl))) (voutput_min) (40) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s39")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s39")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (39) (vl) ((batch_pre - batch )) (A))) (voutput_max) (39) (vl))) (voutput_min) (39) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s38")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s38")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (38) (vl) ((batch_pre - batch )) (A))) (voutput_max) (38) (vl))) (voutput_min) (38) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s37")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s37")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (37) (vl) ((batch_pre - batch )) (A))) (voutput_max) (37) (vl))) (voutput_min) (37) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s36")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s36")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (36) (vl) ((batch_pre - batch )) (A))) (voutput_max) (36) (vl))) (voutput_min) (36) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s35")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s35")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (35) (vl) ((batch_pre - batch )) (A))) (voutput_max) (35) (vl))) (voutput_min) (35) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s34")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s34")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (34) (vl) ((batch_pre - batch )) (A))) (voutput_max) (34) (vl))) (voutput_min) (34) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s33")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s33")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (33) (vl) ((batch_pre - batch )) (A))) (voutput_max) (33) (vl))) (voutput_min) (33) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s32")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s32")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (32) (vl) ((batch_pre - batch )) (A))) (voutput_max) (32) (vl))) (voutput_min) (32) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s31")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s31")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (31) (vl) ((batch_pre - batch )) (A))) (voutput_max) (31) (vl))) (voutput_min) (31) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s30")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s30")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (30) (vl) ((batch_pre - batch )) (A))) (voutput_max) (30) (vl))) (voutput_min) (30) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s29")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s29")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (29) (vl) ((batch_pre - batch )) (A))) (voutput_max) (29) (vl))) (voutput_min) (29) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s28")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s28")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (28) (vl) ((batch_pre - batch )) (A))) (voutput_max) (28) (vl))) (voutput_min) (28) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s27")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s27")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (27) (vl) ((batch_pre - batch )) (A))) (voutput_max) (27) (vl))) (voutput_min) (27) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s26")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s26")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (26) (vl) ((batch_pre - batch )) (A))) (voutput_max) (26) (vl))) (voutput_min) (26) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s25")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s25")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (25) (vl) ((batch_pre - batch )) (A))) (voutput_max) (25) (vl))) (voutput_min) (25) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s24")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s24")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (24) (vl) ((batch_pre - batch )) (A))) (voutput_max) (24) (vl))) (voutput_min) (24) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s23")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s23")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (23) (vl) ((batch_pre - batch )) (A))) (voutput_max) (23) (vl))) (voutput_min) (23) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s22")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s22")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (22) (vl) ((batch_pre - batch )) (A))) (voutput_max) (22) (vl))) (voutput_min) (22) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s21")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s21")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (21) (vl) ((batch_pre - batch )) (A))) (voutput_max) (21) (vl))) (voutput_min) (21) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s20")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s20")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (20) (vl) ((batch_pre - batch )) (A))) (voutput_max) (20) (vl))) (voutput_min) (20) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s19")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s19")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (19) (vl) ((batch_pre - batch )) (A))) (voutput_max) (19) (vl))) (voutput_min) (19) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s18")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s18")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (18) (vl) ((batch_pre - batch )) (A))) (voutput_max) (18) (vl))) (voutput_min) (18) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s17")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s17")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (17) (vl) ((batch_pre - batch )) (A))) (voutput_max) (17) (vl))) (voutput_min) (17) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s16")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s16")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (16) (vl) ((batch_pre - batch )) (A))) (voutput_max) (16) (vl))) (voutput_min) (16) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s15")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s15")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (15) (vl) ((batch_pre - batch )) (A))) (voutput_max) (15) (vl))) (voutput_min) (15) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s14")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s14")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (14) (vl) ((batch_pre - batch )) (A))) (voutput_max) (14) (vl))) (voutput_min) (14) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s13")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s13")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (13) (vl) ((batch_pre - batch )) (A))) (voutput_max) (13) (vl))) (voutput_min) (13) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s12")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s12")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (12) (vl) ((batch_pre - batch )) (A))) (voutput_max) (12) (vl))) (voutput_min) (12) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s11")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s11")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (11) (vl) ((batch_pre - batch )) (A))) (voutput_max) (11) (vl))) (voutput_min) (11) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s10")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s10")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (10) (vl) ((batch_pre - batch )) (A))) (voutput_max) (10) (vl))) (voutput_min) (10) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s9")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s9")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (9) (vl) ((batch_pre - batch )) (A))) (voutput_max) (9) (vl))) (voutput_min) (9) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s8")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s8")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (8) (vl) ((batch_pre - batch )) (A))) (voutput_max) (8) (vl))) (voutput_min) (8) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s7")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s7")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (7) (vl) ((batch_pre - batch )) (A))) (voutput_max) (7) (vl))) (voutput_min) (7) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s6")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s6")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (6) (vl) ((batch_pre - batch )) (A))) (voutput_max) (6) (vl))) (voutput_min) (6) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s5")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s5")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (5) (vl) ((batch_pre - batch )) (A))) (voutput_max) (5) (vl))) (voutput_min) (5) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s4")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s4")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (4) (vl) ((batch_pre - batch )) (A))) (voutput_max) (4) (vl))) (voutput_min) (4) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s3")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (3) (vl) ((batch_pre - batch )) (A))) (voutput_max) (3) (vl))) (voutput_min) (3) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s2")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (2) (vl) ((batch_pre - batch )) (A))) (voutput_max) (2) (vl))) (voutput_min) (2) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s1")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (1) (vl) ((batch_pre - batch )) (A))) (voutput_max) (1) (vl))) (voutput_min) (1) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s0")) # Char  |->_)
  **  ((&((retval)  # "vint8m8_t" ->ₛ "s0")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (0) (vl) ((batch_pre - batch )) (A))) (voutput_max) (0) (vl))) (voutput_min) (0) (vl)))
  **  (CharArray.full input_pre (batch_pre + 7 ) A )
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
  **  (CharArray.full output_pre (batch_pre - batch ) (s8_rvv_progress ((batch_pre - batch )) (batch_pre) ((s8_narrow (RawLo))) ((s8_narrow (RawHi))) (A)) )
  **  (CharArray.undef_full output batch )
.

Definition test_rvv_partial_solve_wit_20_pure := 
forall (params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (RawHi: Z) (RawLo: Z) (A: (@list Z)) (batch64: Z) (vl: Z) (batch: Z) (input: Z) (output: Z) (voutput_min: Z) (voutput_max: Z) (PreH1 : (batch64 = 0)) (PreH2 : (0 < vl)) (PreH3 : (vl <= 128)) (PreH4 : (vl <= batch)) (PreH5 : (0 < batch_pre)) (PreH6 : (batch_pre <= 18446744073709551608)) (PreH7 : (sizeof(CHAR) = 1)) (PreH8 : ((Zlength (A)) = (batch_pre + 7 ))) (PreH9 : (0 <= batch)) (PreH10 : (batch <= batch_pre)) (PreH11 : (input = (input_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH12 : (batch > 0)) (PreH13 : (output = (output_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH14 : (voutput_min = (s8_narrow (RawLo)))) (PreH15 : (voutput_max = (s8_narrow (RawHi)))) (PreH16 : ((-128) <= voutput_min)) (PreH17 : (voutput_min <= 127)) (PreH18 : ((-128) <= voutput_max)) (PreH19 : (voutput_max <= 127)) (PreH20 : ((s8_bulk_count (batch_pre)) <= (batch_pre - batch ))) ,
  ((&(( &( "vacc" ) )->ₛ "s127")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (127) (vl) ((batch_pre - batch )) (A))) (voutput_max) (127) (vl))) (voutput_min) (127) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s126")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (126) (vl) ((batch_pre - batch )) (A))) (voutput_max) (126) (vl))) (voutput_min) (126) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s125")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (125) (vl) ((batch_pre - batch )) (A))) (voutput_max) (125) (vl))) (voutput_min) (125) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s124")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (124) (vl) ((batch_pre - batch )) (A))) (voutput_max) (124) (vl))) (voutput_min) (124) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s123")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (123) (vl) ((batch_pre - batch )) (A))) (voutput_max) (123) (vl))) (voutput_min) (123) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s122")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (122) (vl) ((batch_pre - batch )) (A))) (voutput_max) (122) (vl))) (voutput_min) (122) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s121")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (121) (vl) ((batch_pre - batch )) (A))) (voutput_max) (121) (vl))) (voutput_min) (121) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s120")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (120) (vl) ((batch_pre - batch )) (A))) (voutput_max) (120) (vl))) (voutput_min) (120) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s119")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (119) (vl) ((batch_pre - batch )) (A))) (voutput_max) (119) (vl))) (voutput_min) (119) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s118")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (118) (vl) ((batch_pre - batch )) (A))) (voutput_max) (118) (vl))) (voutput_min) (118) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s117")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (117) (vl) ((batch_pre - batch )) (A))) (voutput_max) (117) (vl))) (voutput_min) (117) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s116")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (116) (vl) ((batch_pre - batch )) (A))) (voutput_max) (116) (vl))) (voutput_min) (116) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s115")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (115) (vl) ((batch_pre - batch )) (A))) (voutput_max) (115) (vl))) (voutput_min) (115) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s114")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (114) (vl) ((batch_pre - batch )) (A))) (voutput_max) (114) (vl))) (voutput_min) (114) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s113")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (113) (vl) ((batch_pre - batch )) (A))) (voutput_max) (113) (vl))) (voutput_min) (113) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s112")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (112) (vl) ((batch_pre - batch )) (A))) (voutput_max) (112) (vl))) (voutput_min) (112) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s111")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (111) (vl) ((batch_pre - batch )) (A))) (voutput_max) (111) (vl))) (voutput_min) (111) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s110")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (110) (vl) ((batch_pre - batch )) (A))) (voutput_max) (110) (vl))) (voutput_min) (110) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s109")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (109) (vl) ((batch_pre - batch )) (A))) (voutput_max) (109) (vl))) (voutput_min) (109) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s108")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (108) (vl) ((batch_pre - batch )) (A))) (voutput_max) (108) (vl))) (voutput_min) (108) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s107")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (107) (vl) ((batch_pre - batch )) (A))) (voutput_max) (107) (vl))) (voutput_min) (107) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s106")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (106) (vl) ((batch_pre - batch )) (A))) (voutput_max) (106) (vl))) (voutput_min) (106) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s105")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (105) (vl) ((batch_pre - batch )) (A))) (voutput_max) (105) (vl))) (voutput_min) (105) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s104")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (104) (vl) ((batch_pre - batch )) (A))) (voutput_max) (104) (vl))) (voutput_min) (104) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s103")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (103) (vl) ((batch_pre - batch )) (A))) (voutput_max) (103) (vl))) (voutput_min) (103) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s102")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (102) (vl) ((batch_pre - batch )) (A))) (voutput_max) (102) (vl))) (voutput_min) (102) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s101")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (101) (vl) ((batch_pre - batch )) (A))) (voutput_max) (101) (vl))) (voutput_min) (101) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s100")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (100) (vl) ((batch_pre - batch )) (A))) (voutput_max) (100) (vl))) (voutput_min) (100) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s99")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (99) (vl) ((batch_pre - batch )) (A))) (voutput_max) (99) (vl))) (voutput_min) (99) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s98")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (98) (vl) ((batch_pre - batch )) (A))) (voutput_max) (98) (vl))) (voutput_min) (98) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s97")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (97) (vl) ((batch_pre - batch )) (A))) (voutput_max) (97) (vl))) (voutput_min) (97) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s96")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (96) (vl) ((batch_pre - batch )) (A))) (voutput_max) (96) (vl))) (voutput_min) (96) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s95")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (95) (vl) ((batch_pre - batch )) (A))) (voutput_max) (95) (vl))) (voutput_min) (95) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s94")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (94) (vl) ((batch_pre - batch )) (A))) (voutput_max) (94) (vl))) (voutput_min) (94) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s93")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (93) (vl) ((batch_pre - batch )) (A))) (voutput_max) (93) (vl))) (voutput_min) (93) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s92")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (92) (vl) ((batch_pre - batch )) (A))) (voutput_max) (92) (vl))) (voutput_min) (92) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s91")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (91) (vl) ((batch_pre - batch )) (A))) (voutput_max) (91) (vl))) (voutput_min) (91) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s90")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (90) (vl) ((batch_pre - batch )) (A))) (voutput_max) (90) (vl))) (voutput_min) (90) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s89")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (89) (vl) ((batch_pre - batch )) (A))) (voutput_max) (89) (vl))) (voutput_min) (89) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s88")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (88) (vl) ((batch_pre - batch )) (A))) (voutput_max) (88) (vl))) (voutput_min) (88) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s87")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (87) (vl) ((batch_pre - batch )) (A))) (voutput_max) (87) (vl))) (voutput_min) (87) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s86")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (86) (vl) ((batch_pre - batch )) (A))) (voutput_max) (86) (vl))) (voutput_min) (86) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s85")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (85) (vl) ((batch_pre - batch )) (A))) (voutput_max) (85) (vl))) (voutput_min) (85) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s84")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (84) (vl) ((batch_pre - batch )) (A))) (voutput_max) (84) (vl))) (voutput_min) (84) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s83")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (83) (vl) ((batch_pre - batch )) (A))) (voutput_max) (83) (vl))) (voutput_min) (83) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s82")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (82) (vl) ((batch_pre - batch )) (A))) (voutput_max) (82) (vl))) (voutput_min) (82) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s81")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (81) (vl) ((batch_pre - batch )) (A))) (voutput_max) (81) (vl))) (voutput_min) (81) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s80")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (80) (vl) ((batch_pre - batch )) (A))) (voutput_max) (80) (vl))) (voutput_min) (80) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s79")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (79) (vl) ((batch_pre - batch )) (A))) (voutput_max) (79) (vl))) (voutput_min) (79) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s78")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (78) (vl) ((batch_pre - batch )) (A))) (voutput_max) (78) (vl))) (voutput_min) (78) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s77")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (77) (vl) ((batch_pre - batch )) (A))) (voutput_max) (77) (vl))) (voutput_min) (77) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s76")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (76) (vl) ((batch_pre - batch )) (A))) (voutput_max) (76) (vl))) (voutput_min) (76) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s75")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (75) (vl) ((batch_pre - batch )) (A))) (voutput_max) (75) (vl))) (voutput_min) (75) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s74")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (74) (vl) ((batch_pre - batch )) (A))) (voutput_max) (74) (vl))) (voutput_min) (74) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s73")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (73) (vl) ((batch_pre - batch )) (A))) (voutput_max) (73) (vl))) (voutput_min) (73) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s72")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (72) (vl) ((batch_pre - batch )) (A))) (voutput_max) (72) (vl))) (voutput_min) (72) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s71")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (71) (vl) ((batch_pre - batch )) (A))) (voutput_max) (71) (vl))) (voutput_min) (71) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s70")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (70) (vl) ((batch_pre - batch )) (A))) (voutput_max) (70) (vl))) (voutput_min) (70) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s69")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (69) (vl) ((batch_pre - batch )) (A))) (voutput_max) (69) (vl))) (voutput_min) (69) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s68")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (68) (vl) ((batch_pre - batch )) (A))) (voutput_max) (68) (vl))) (voutput_min) (68) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s67")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (67) (vl) ((batch_pre - batch )) (A))) (voutput_max) (67) (vl))) (voutput_min) (67) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s66")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (66) (vl) ((batch_pre - batch )) (A))) (voutput_max) (66) (vl))) (voutput_min) (66) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s65")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (65) (vl) ((batch_pre - batch )) (A))) (voutput_max) (65) (vl))) (voutput_min) (65) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s64")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (64) (vl) ((batch_pre - batch )) (A))) (voutput_max) (64) (vl))) (voutput_min) (64) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s63")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (63) (vl) ((batch_pre - batch )) (A))) (voutput_max) (63) (vl))) (voutput_min) (63) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s62")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (62) (vl) ((batch_pre - batch )) (A))) (voutput_max) (62) (vl))) (voutput_min) (62) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s61")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (61) (vl) ((batch_pre - batch )) (A))) (voutput_max) (61) (vl))) (voutput_min) (61) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s60")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (60) (vl) ((batch_pre - batch )) (A))) (voutput_max) (60) (vl))) (voutput_min) (60) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s59")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (59) (vl) ((batch_pre - batch )) (A))) (voutput_max) (59) (vl))) (voutput_min) (59) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s58")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (58) (vl) ((batch_pre - batch )) (A))) (voutput_max) (58) (vl))) (voutput_min) (58) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s57")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (57) (vl) ((batch_pre - batch )) (A))) (voutput_max) (57) (vl))) (voutput_min) (57) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s56")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (56) (vl) ((batch_pre - batch )) (A))) (voutput_max) (56) (vl))) (voutput_min) (56) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s55")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (55) (vl) ((batch_pre - batch )) (A))) (voutput_max) (55) (vl))) (voutput_min) (55) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s54")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (54) (vl) ((batch_pre - batch )) (A))) (voutput_max) (54) (vl))) (voutput_min) (54) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s53")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (53) (vl) ((batch_pre - batch )) (A))) (voutput_max) (53) (vl))) (voutput_min) (53) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s52")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (52) (vl) ((batch_pre - batch )) (A))) (voutput_max) (52) (vl))) (voutput_min) (52) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s51")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (51) (vl) ((batch_pre - batch )) (A))) (voutput_max) (51) (vl))) (voutput_min) (51) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s50")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (50) (vl) ((batch_pre - batch )) (A))) (voutput_max) (50) (vl))) (voutput_min) (50) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s49")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (49) (vl) ((batch_pre - batch )) (A))) (voutput_max) (49) (vl))) (voutput_min) (49) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s48")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (48) (vl) ((batch_pre - batch )) (A))) (voutput_max) (48) (vl))) (voutput_min) (48) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s47")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (47) (vl) ((batch_pre - batch )) (A))) (voutput_max) (47) (vl))) (voutput_min) (47) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s46")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (46) (vl) ((batch_pre - batch )) (A))) (voutput_max) (46) (vl))) (voutput_min) (46) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s45")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (45) (vl) ((batch_pre - batch )) (A))) (voutput_max) (45) (vl))) (voutput_min) (45) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s44")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (44) (vl) ((batch_pre - batch )) (A))) (voutput_max) (44) (vl))) (voutput_min) (44) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s43")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (43) (vl) ((batch_pre - batch )) (A))) (voutput_max) (43) (vl))) (voutput_min) (43) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s42")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (42) (vl) ((batch_pre - batch )) (A))) (voutput_max) (42) (vl))) (voutput_min) (42) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s41")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (41) (vl) ((batch_pre - batch )) (A))) (voutput_max) (41) (vl))) (voutput_min) (41) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s40")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (40) (vl) ((batch_pre - batch )) (A))) (voutput_max) (40) (vl))) (voutput_min) (40) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s39")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (39) (vl) ((batch_pre - batch )) (A))) (voutput_max) (39) (vl))) (voutput_min) (39) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s38")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (38) (vl) ((batch_pre - batch )) (A))) (voutput_max) (38) (vl))) (voutput_min) (38) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s37")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (37) (vl) ((batch_pre - batch )) (A))) (voutput_max) (37) (vl))) (voutput_min) (37) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s36")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (36) (vl) ((batch_pre - batch )) (A))) (voutput_max) (36) (vl))) (voutput_min) (36) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s35")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (35) (vl) ((batch_pre - batch )) (A))) (voutput_max) (35) (vl))) (voutput_min) (35) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s34")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (34) (vl) ((batch_pre - batch )) (A))) (voutput_max) (34) (vl))) (voutput_min) (34) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s33")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (33) (vl) ((batch_pre - batch )) (A))) (voutput_max) (33) (vl))) (voutput_min) (33) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s32")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (32) (vl) ((batch_pre - batch )) (A))) (voutput_max) (32) (vl))) (voutput_min) (32) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s31")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (31) (vl) ((batch_pre - batch )) (A))) (voutput_max) (31) (vl))) (voutput_min) (31) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s30")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (30) (vl) ((batch_pre - batch )) (A))) (voutput_max) (30) (vl))) (voutput_min) (30) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s29")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (29) (vl) ((batch_pre - batch )) (A))) (voutput_max) (29) (vl))) (voutput_min) (29) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s28")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (28) (vl) ((batch_pre - batch )) (A))) (voutput_max) (28) (vl))) (voutput_min) (28) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s27")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (27) (vl) ((batch_pre - batch )) (A))) (voutput_max) (27) (vl))) (voutput_min) (27) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s26")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (26) (vl) ((batch_pre - batch )) (A))) (voutput_max) (26) (vl))) (voutput_min) (26) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s25")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (25) (vl) ((batch_pre - batch )) (A))) (voutput_max) (25) (vl))) (voutput_min) (25) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s24")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (24) (vl) ((batch_pre - batch )) (A))) (voutput_max) (24) (vl))) (voutput_min) (24) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s23")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (23) (vl) ((batch_pre - batch )) (A))) (voutput_max) (23) (vl))) (voutput_min) (23) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s22")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (22) (vl) ((batch_pre - batch )) (A))) (voutput_max) (22) (vl))) (voutput_min) (22) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s21")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (21) (vl) ((batch_pre - batch )) (A))) (voutput_max) (21) (vl))) (voutput_min) (21) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s20")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (20) (vl) ((batch_pre - batch )) (A))) (voutput_max) (20) (vl))) (voutput_min) (20) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s19")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (19) (vl) ((batch_pre - batch )) (A))) (voutput_max) (19) (vl))) (voutput_min) (19) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s18")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (18) (vl) ((batch_pre - batch )) (A))) (voutput_max) (18) (vl))) (voutput_min) (18) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s17")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (17) (vl) ((batch_pre - batch )) (A))) (voutput_max) (17) (vl))) (voutput_min) (17) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s16")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (16) (vl) ((batch_pre - batch )) (A))) (voutput_max) (16) (vl))) (voutput_min) (16) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s15")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (15) (vl) ((batch_pre - batch )) (A))) (voutput_max) (15) (vl))) (voutput_min) (15) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s14")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (14) (vl) ((batch_pre - batch )) (A))) (voutput_max) (14) (vl))) (voutput_min) (14) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s13")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (13) (vl) ((batch_pre - batch )) (A))) (voutput_max) (13) (vl))) (voutput_min) (13) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s12")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (12) (vl) ((batch_pre - batch )) (A))) (voutput_max) (12) (vl))) (voutput_min) (12) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s11")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (11) (vl) ((batch_pre - batch )) (A))) (voutput_max) (11) (vl))) (voutput_min) (11) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s10")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (10) (vl) ((batch_pre - batch )) (A))) (voutput_max) (10) (vl))) (voutput_min) (10) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s9")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (9) (vl) ((batch_pre - batch )) (A))) (voutput_max) (9) (vl))) (voutput_min) (9) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s8")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (8) (vl) ((batch_pre - batch )) (A))) (voutput_max) (8) (vl))) (voutput_min) (8) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s7")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (7) (vl) ((batch_pre - batch )) (A))) (voutput_max) (7) (vl))) (voutput_min) (7) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s6")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (6) (vl) ((batch_pre - batch )) (A))) (voutput_max) (6) (vl))) (voutput_min) (6) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s5")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (5) (vl) ((batch_pre - batch )) (A))) (voutput_max) (5) (vl))) (voutput_min) (5) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s4")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (4) (vl) ((batch_pre - batch )) (A))) (voutput_max) (4) (vl))) (voutput_min) (4) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (3) (vl) ((batch_pre - batch )) (A))) (voutput_max) (3) (vl))) (voutput_min) (3) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (2) (vl) ((batch_pre - batch )) (A))) (voutput_max) (2) (vl))) (voutput_min) (2) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (1) (vl) ((batch_pre - batch )) (A))) (voutput_max) (1) (vl))) (voutput_min) (1) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s0")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (0) (vl) ((batch_pre - batch )) (A))) (voutput_max) (0) (vl))) (voutput_min) (0) (vl)))
  **  (CharArray.full input_pre (batch_pre + 7 ) A )
  **  ((( &( "batch64" ) )) # UInt64  |-> batch64)
  **  ((( &( "vl" ) )) # UInt64  |-> vl)
  **  ((( &( "batch" ) )) # UInt64  |-> batch)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "voutput_min" ) )) # Char  |-> voutput_min)
  **  ((( &( "voutput_max" ) )) # Char  |-> voutput_max)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
  **  (CharArray.full output_pre (batch_pre - batch ) (s8_rvv_progress ((batch_pre - batch )) (batch_pre) ((s8_narrow (RawLo))) ((s8_narrow (RawHi))) (A)) )
  **  (CharArray.undef_full output batch )
|--
  “ (0 <= vl) ” 
  &&  “ (vl <= 128) ”
.

Definition test_rvv_partial_solve_wit_20_aux := 
forall (params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (RawHi: Z) (RawLo: Z) (A: (@list Z)) (batch64: Z) (vl: Z) (batch: Z) (input: Z) (output: Z) (voutput_min: Z) (voutput_max: Z) (PreH1 : (batch64 = 0)) (PreH2 : (0 < vl)) (PreH3 : (vl <= 128)) (PreH4 : (vl <= batch)) (PreH5 : (0 < batch_pre)) (PreH6 : (batch_pre <= 18446744073709551608)) (PreH7 : (sizeof(CHAR) = 1)) (PreH8 : ((Zlength (A)) = (batch_pre + 7 ))) (PreH9 : (0 <= batch)) (PreH10 : (batch <= batch_pre)) (PreH11 : (input = (input_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH12 : (batch > 0)) (PreH13 : (output = (output_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH14 : (voutput_min = (s8_narrow (RawLo)))) (PreH15 : (voutput_max = (s8_narrow (RawHi)))) (PreH16 : ((-128) <= voutput_min)) (PreH17 : (voutput_min <= 127)) (PreH18 : ((-128) <= voutput_max)) (PreH19 : (voutput_max <= 127)) (PreH20 : ((s8_bulk_count (batch_pre)) <= (batch_pre - batch ))) ,
  ((&(( &( "vacc" ) )->ₛ "s127")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (127) (vl) ((batch_pre - batch )) (A))) (voutput_max) (127) (vl))) (voutput_min) (127) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s126")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (126) (vl) ((batch_pre - batch )) (A))) (voutput_max) (126) (vl))) (voutput_min) (126) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s125")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (125) (vl) ((batch_pre - batch )) (A))) (voutput_max) (125) (vl))) (voutput_min) (125) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s124")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (124) (vl) ((batch_pre - batch )) (A))) (voutput_max) (124) (vl))) (voutput_min) (124) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s123")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (123) (vl) ((batch_pre - batch )) (A))) (voutput_max) (123) (vl))) (voutput_min) (123) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s122")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (122) (vl) ((batch_pre - batch )) (A))) (voutput_max) (122) (vl))) (voutput_min) (122) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s121")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (121) (vl) ((batch_pre - batch )) (A))) (voutput_max) (121) (vl))) (voutput_min) (121) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s120")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (120) (vl) ((batch_pre - batch )) (A))) (voutput_max) (120) (vl))) (voutput_min) (120) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s119")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (119) (vl) ((batch_pre - batch )) (A))) (voutput_max) (119) (vl))) (voutput_min) (119) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s118")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (118) (vl) ((batch_pre - batch )) (A))) (voutput_max) (118) (vl))) (voutput_min) (118) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s117")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (117) (vl) ((batch_pre - batch )) (A))) (voutput_max) (117) (vl))) (voutput_min) (117) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s116")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (116) (vl) ((batch_pre - batch )) (A))) (voutput_max) (116) (vl))) (voutput_min) (116) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s115")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (115) (vl) ((batch_pre - batch )) (A))) (voutput_max) (115) (vl))) (voutput_min) (115) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s114")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (114) (vl) ((batch_pre - batch )) (A))) (voutput_max) (114) (vl))) (voutput_min) (114) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s113")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (113) (vl) ((batch_pre - batch )) (A))) (voutput_max) (113) (vl))) (voutput_min) (113) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s112")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (112) (vl) ((batch_pre - batch )) (A))) (voutput_max) (112) (vl))) (voutput_min) (112) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s111")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (111) (vl) ((batch_pre - batch )) (A))) (voutput_max) (111) (vl))) (voutput_min) (111) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s110")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (110) (vl) ((batch_pre - batch )) (A))) (voutput_max) (110) (vl))) (voutput_min) (110) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s109")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (109) (vl) ((batch_pre - batch )) (A))) (voutput_max) (109) (vl))) (voutput_min) (109) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s108")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (108) (vl) ((batch_pre - batch )) (A))) (voutput_max) (108) (vl))) (voutput_min) (108) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s107")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (107) (vl) ((batch_pre - batch )) (A))) (voutput_max) (107) (vl))) (voutput_min) (107) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s106")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (106) (vl) ((batch_pre - batch )) (A))) (voutput_max) (106) (vl))) (voutput_min) (106) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s105")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (105) (vl) ((batch_pre - batch )) (A))) (voutput_max) (105) (vl))) (voutput_min) (105) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s104")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (104) (vl) ((batch_pre - batch )) (A))) (voutput_max) (104) (vl))) (voutput_min) (104) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s103")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (103) (vl) ((batch_pre - batch )) (A))) (voutput_max) (103) (vl))) (voutput_min) (103) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s102")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (102) (vl) ((batch_pre - batch )) (A))) (voutput_max) (102) (vl))) (voutput_min) (102) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s101")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (101) (vl) ((batch_pre - batch )) (A))) (voutput_max) (101) (vl))) (voutput_min) (101) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s100")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (100) (vl) ((batch_pre - batch )) (A))) (voutput_max) (100) (vl))) (voutput_min) (100) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s99")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (99) (vl) ((batch_pre - batch )) (A))) (voutput_max) (99) (vl))) (voutput_min) (99) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s98")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (98) (vl) ((batch_pre - batch )) (A))) (voutput_max) (98) (vl))) (voutput_min) (98) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s97")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (97) (vl) ((batch_pre - batch )) (A))) (voutput_max) (97) (vl))) (voutput_min) (97) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s96")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (96) (vl) ((batch_pre - batch )) (A))) (voutput_max) (96) (vl))) (voutput_min) (96) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s95")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (95) (vl) ((batch_pre - batch )) (A))) (voutput_max) (95) (vl))) (voutput_min) (95) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s94")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (94) (vl) ((batch_pre - batch )) (A))) (voutput_max) (94) (vl))) (voutput_min) (94) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s93")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (93) (vl) ((batch_pre - batch )) (A))) (voutput_max) (93) (vl))) (voutput_min) (93) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s92")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (92) (vl) ((batch_pre - batch )) (A))) (voutput_max) (92) (vl))) (voutput_min) (92) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s91")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (91) (vl) ((batch_pre - batch )) (A))) (voutput_max) (91) (vl))) (voutput_min) (91) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s90")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (90) (vl) ((batch_pre - batch )) (A))) (voutput_max) (90) (vl))) (voutput_min) (90) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s89")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (89) (vl) ((batch_pre - batch )) (A))) (voutput_max) (89) (vl))) (voutput_min) (89) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s88")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (88) (vl) ((batch_pre - batch )) (A))) (voutput_max) (88) (vl))) (voutput_min) (88) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s87")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (87) (vl) ((batch_pre - batch )) (A))) (voutput_max) (87) (vl))) (voutput_min) (87) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s86")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (86) (vl) ((batch_pre - batch )) (A))) (voutput_max) (86) (vl))) (voutput_min) (86) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s85")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (85) (vl) ((batch_pre - batch )) (A))) (voutput_max) (85) (vl))) (voutput_min) (85) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s84")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (84) (vl) ((batch_pre - batch )) (A))) (voutput_max) (84) (vl))) (voutput_min) (84) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s83")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (83) (vl) ((batch_pre - batch )) (A))) (voutput_max) (83) (vl))) (voutput_min) (83) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s82")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (82) (vl) ((batch_pre - batch )) (A))) (voutput_max) (82) (vl))) (voutput_min) (82) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s81")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (81) (vl) ((batch_pre - batch )) (A))) (voutput_max) (81) (vl))) (voutput_min) (81) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s80")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (80) (vl) ((batch_pre - batch )) (A))) (voutput_max) (80) (vl))) (voutput_min) (80) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s79")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (79) (vl) ((batch_pre - batch )) (A))) (voutput_max) (79) (vl))) (voutput_min) (79) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s78")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (78) (vl) ((batch_pre - batch )) (A))) (voutput_max) (78) (vl))) (voutput_min) (78) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s77")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (77) (vl) ((batch_pre - batch )) (A))) (voutput_max) (77) (vl))) (voutput_min) (77) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s76")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (76) (vl) ((batch_pre - batch )) (A))) (voutput_max) (76) (vl))) (voutput_min) (76) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s75")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (75) (vl) ((batch_pre - batch )) (A))) (voutput_max) (75) (vl))) (voutput_min) (75) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s74")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (74) (vl) ((batch_pre - batch )) (A))) (voutput_max) (74) (vl))) (voutput_min) (74) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s73")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (73) (vl) ((batch_pre - batch )) (A))) (voutput_max) (73) (vl))) (voutput_min) (73) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s72")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (72) (vl) ((batch_pre - batch )) (A))) (voutput_max) (72) (vl))) (voutput_min) (72) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s71")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (71) (vl) ((batch_pre - batch )) (A))) (voutput_max) (71) (vl))) (voutput_min) (71) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s70")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (70) (vl) ((batch_pre - batch )) (A))) (voutput_max) (70) (vl))) (voutput_min) (70) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s69")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (69) (vl) ((batch_pre - batch )) (A))) (voutput_max) (69) (vl))) (voutput_min) (69) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s68")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (68) (vl) ((batch_pre - batch )) (A))) (voutput_max) (68) (vl))) (voutput_min) (68) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s67")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (67) (vl) ((batch_pre - batch )) (A))) (voutput_max) (67) (vl))) (voutput_min) (67) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s66")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (66) (vl) ((batch_pre - batch )) (A))) (voutput_max) (66) (vl))) (voutput_min) (66) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s65")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (65) (vl) ((batch_pre - batch )) (A))) (voutput_max) (65) (vl))) (voutput_min) (65) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s64")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (64) (vl) ((batch_pre - batch )) (A))) (voutput_max) (64) (vl))) (voutput_min) (64) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s63")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (63) (vl) ((batch_pre - batch )) (A))) (voutput_max) (63) (vl))) (voutput_min) (63) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s62")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (62) (vl) ((batch_pre - batch )) (A))) (voutput_max) (62) (vl))) (voutput_min) (62) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s61")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (61) (vl) ((batch_pre - batch )) (A))) (voutput_max) (61) (vl))) (voutput_min) (61) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s60")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (60) (vl) ((batch_pre - batch )) (A))) (voutput_max) (60) (vl))) (voutput_min) (60) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s59")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (59) (vl) ((batch_pre - batch )) (A))) (voutput_max) (59) (vl))) (voutput_min) (59) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s58")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (58) (vl) ((batch_pre - batch )) (A))) (voutput_max) (58) (vl))) (voutput_min) (58) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s57")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (57) (vl) ((batch_pre - batch )) (A))) (voutput_max) (57) (vl))) (voutput_min) (57) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s56")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (56) (vl) ((batch_pre - batch )) (A))) (voutput_max) (56) (vl))) (voutput_min) (56) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s55")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (55) (vl) ((batch_pre - batch )) (A))) (voutput_max) (55) (vl))) (voutput_min) (55) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s54")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (54) (vl) ((batch_pre - batch )) (A))) (voutput_max) (54) (vl))) (voutput_min) (54) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s53")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (53) (vl) ((batch_pre - batch )) (A))) (voutput_max) (53) (vl))) (voutput_min) (53) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s52")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (52) (vl) ((batch_pre - batch )) (A))) (voutput_max) (52) (vl))) (voutput_min) (52) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s51")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (51) (vl) ((batch_pre - batch )) (A))) (voutput_max) (51) (vl))) (voutput_min) (51) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s50")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (50) (vl) ((batch_pre - batch )) (A))) (voutput_max) (50) (vl))) (voutput_min) (50) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s49")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (49) (vl) ((batch_pre - batch )) (A))) (voutput_max) (49) (vl))) (voutput_min) (49) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s48")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (48) (vl) ((batch_pre - batch )) (A))) (voutput_max) (48) (vl))) (voutput_min) (48) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s47")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (47) (vl) ((batch_pre - batch )) (A))) (voutput_max) (47) (vl))) (voutput_min) (47) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s46")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (46) (vl) ((batch_pre - batch )) (A))) (voutput_max) (46) (vl))) (voutput_min) (46) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s45")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (45) (vl) ((batch_pre - batch )) (A))) (voutput_max) (45) (vl))) (voutput_min) (45) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s44")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (44) (vl) ((batch_pre - batch )) (A))) (voutput_max) (44) (vl))) (voutput_min) (44) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s43")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (43) (vl) ((batch_pre - batch )) (A))) (voutput_max) (43) (vl))) (voutput_min) (43) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s42")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (42) (vl) ((batch_pre - batch )) (A))) (voutput_max) (42) (vl))) (voutput_min) (42) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s41")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (41) (vl) ((batch_pre - batch )) (A))) (voutput_max) (41) (vl))) (voutput_min) (41) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s40")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (40) (vl) ((batch_pre - batch )) (A))) (voutput_max) (40) (vl))) (voutput_min) (40) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s39")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (39) (vl) ((batch_pre - batch )) (A))) (voutput_max) (39) (vl))) (voutput_min) (39) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s38")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (38) (vl) ((batch_pre - batch )) (A))) (voutput_max) (38) (vl))) (voutput_min) (38) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s37")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (37) (vl) ((batch_pre - batch )) (A))) (voutput_max) (37) (vl))) (voutput_min) (37) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s36")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (36) (vl) ((batch_pre - batch )) (A))) (voutput_max) (36) (vl))) (voutput_min) (36) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s35")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (35) (vl) ((batch_pre - batch )) (A))) (voutput_max) (35) (vl))) (voutput_min) (35) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s34")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (34) (vl) ((batch_pre - batch )) (A))) (voutput_max) (34) (vl))) (voutput_min) (34) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s33")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (33) (vl) ((batch_pre - batch )) (A))) (voutput_max) (33) (vl))) (voutput_min) (33) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s32")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (32) (vl) ((batch_pre - batch )) (A))) (voutput_max) (32) (vl))) (voutput_min) (32) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s31")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (31) (vl) ((batch_pre - batch )) (A))) (voutput_max) (31) (vl))) (voutput_min) (31) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s30")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (30) (vl) ((batch_pre - batch )) (A))) (voutput_max) (30) (vl))) (voutput_min) (30) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s29")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (29) (vl) ((batch_pre - batch )) (A))) (voutput_max) (29) (vl))) (voutput_min) (29) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s28")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (28) (vl) ((batch_pre - batch )) (A))) (voutput_max) (28) (vl))) (voutput_min) (28) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s27")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (27) (vl) ((batch_pre - batch )) (A))) (voutput_max) (27) (vl))) (voutput_min) (27) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s26")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (26) (vl) ((batch_pre - batch )) (A))) (voutput_max) (26) (vl))) (voutput_min) (26) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s25")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (25) (vl) ((batch_pre - batch )) (A))) (voutput_max) (25) (vl))) (voutput_min) (25) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s24")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (24) (vl) ((batch_pre - batch )) (A))) (voutput_max) (24) (vl))) (voutput_min) (24) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s23")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (23) (vl) ((batch_pre - batch )) (A))) (voutput_max) (23) (vl))) (voutput_min) (23) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s22")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (22) (vl) ((batch_pre - batch )) (A))) (voutput_max) (22) (vl))) (voutput_min) (22) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s21")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (21) (vl) ((batch_pre - batch )) (A))) (voutput_max) (21) (vl))) (voutput_min) (21) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s20")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (20) (vl) ((batch_pre - batch )) (A))) (voutput_max) (20) (vl))) (voutput_min) (20) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s19")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (19) (vl) ((batch_pre - batch )) (A))) (voutput_max) (19) (vl))) (voutput_min) (19) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s18")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (18) (vl) ((batch_pre - batch )) (A))) (voutput_max) (18) (vl))) (voutput_min) (18) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s17")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (17) (vl) ((batch_pre - batch )) (A))) (voutput_max) (17) (vl))) (voutput_min) (17) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s16")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (16) (vl) ((batch_pre - batch )) (A))) (voutput_max) (16) (vl))) (voutput_min) (16) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s15")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (15) (vl) ((batch_pre - batch )) (A))) (voutput_max) (15) (vl))) (voutput_min) (15) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s14")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (14) (vl) ((batch_pre - batch )) (A))) (voutput_max) (14) (vl))) (voutput_min) (14) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s13")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (13) (vl) ((batch_pre - batch )) (A))) (voutput_max) (13) (vl))) (voutput_min) (13) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s12")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (12) (vl) ((batch_pre - batch )) (A))) (voutput_max) (12) (vl))) (voutput_min) (12) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s11")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (11) (vl) ((batch_pre - batch )) (A))) (voutput_max) (11) (vl))) (voutput_min) (11) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s10")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (10) (vl) ((batch_pre - batch )) (A))) (voutput_max) (10) (vl))) (voutput_min) (10) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s9")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (9) (vl) ((batch_pre - batch )) (A))) (voutput_max) (9) (vl))) (voutput_min) (9) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s8")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (8) (vl) ((batch_pre - batch )) (A))) (voutput_max) (8) (vl))) (voutput_min) (8) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s7")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (7) (vl) ((batch_pre - batch )) (A))) (voutput_max) (7) (vl))) (voutput_min) (7) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s6")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (6) (vl) ((batch_pre - batch )) (A))) (voutput_max) (6) (vl))) (voutput_min) (6) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s5")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (5) (vl) ((batch_pre - batch )) (A))) (voutput_max) (5) (vl))) (voutput_min) (5) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s4")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (4) (vl) ((batch_pre - batch )) (A))) (voutput_max) (4) (vl))) (voutput_min) (4) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (3) (vl) ((batch_pre - batch )) (A))) (voutput_max) (3) (vl))) (voutput_min) (3) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (2) (vl) ((batch_pre - batch )) (A))) (voutput_max) (2) (vl))) (voutput_min) (2) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (1) (vl) ((batch_pre - batch )) (A))) (voutput_max) (1) (vl))) (voutput_min) (1) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s0")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (0) (vl) ((batch_pre - batch )) (A))) (voutput_max) (0) (vl))) (voutput_min) (0) (vl)))
  **  (CharArray.full input_pre (batch_pre + 7 ) A )
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
  **  (CharArray.full output_pre (batch_pre - batch ) (s8_rvv_progress ((batch_pre - batch )) (batch_pre) ((s8_narrow (RawLo))) ((s8_narrow (RawHi))) (A)) )
  **  (CharArray.undef_full output batch )
|--
  “ (0 <= vl) ” 
  &&  “ (vl <= 128) ” 
  &&  “ (batch64 = 0) ” 
  &&  “ (0 < vl) ” 
  &&  “ (vl <= 128) ” 
  &&  “ (vl <= batch) ” 
  &&  “ (0 < batch_pre) ” 
  &&  “ (batch_pre <= 18446744073709551608) ” 
  &&  “ (sizeof(CHAR) = 1) ” 
  &&  “ ((Zlength (A)) = (batch_pre + 7 )) ” 
  &&  “ (0 <= batch) ” 
  &&  “ (batch <= batch_pre) ” 
  &&  “ (input = (input_pre + ((batch_pre - batch ) * sizeof(CHAR)))) ” 
  &&  “ (batch > 0) ” 
  &&  “ (output = (output_pre + ((batch_pre - batch ) * sizeof(CHAR)))) ” 
  &&  “ (voutput_min = (s8_narrow (RawLo))) ” 
  &&  “ (voutput_max = (s8_narrow (RawHi))) ” 
  &&  “ ((-128) <= voutput_min) ” 
  &&  “ (voutput_min <= 127) ” 
  &&  “ ((-128) <= voutput_max) ” 
  &&  “ (voutput_max <= 127) ” 
  &&  “ ((s8_bulk_count (batch_pre)) <= (batch_pre - batch )) ”
  &&  ((&(( &( "vacc" ) )->ₛ "s0")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (0) (vl) ((batch_pre - batch )) (A))) (voutput_max) (0) (vl))) (voutput_min) (0) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (1) (vl) ((batch_pre - batch )) (A))) (voutput_max) (1) (vl))) (voutput_min) (1) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (2) (vl) ((batch_pre - batch )) (A))) (voutput_max) (2) (vl))) (voutput_min) (2) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (3) (vl) ((batch_pre - batch )) (A))) (voutput_max) (3) (vl))) (voutput_min) (3) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s4")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (4) (vl) ((batch_pre - batch )) (A))) (voutput_max) (4) (vl))) (voutput_min) (4) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s5")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (5) (vl) ((batch_pre - batch )) (A))) (voutput_max) (5) (vl))) (voutput_min) (5) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s6")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (6) (vl) ((batch_pre - batch )) (A))) (voutput_max) (6) (vl))) (voutput_min) (6) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s7")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (7) (vl) ((batch_pre - batch )) (A))) (voutput_max) (7) (vl))) (voutput_min) (7) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s8")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (8) (vl) ((batch_pre - batch )) (A))) (voutput_max) (8) (vl))) (voutput_min) (8) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s9")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (9) (vl) ((batch_pre - batch )) (A))) (voutput_max) (9) (vl))) (voutput_min) (9) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s10")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (10) (vl) ((batch_pre - batch )) (A))) (voutput_max) (10) (vl))) (voutput_min) (10) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s11")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (11) (vl) ((batch_pre - batch )) (A))) (voutput_max) (11) (vl))) (voutput_min) (11) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s12")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (12) (vl) ((batch_pre - batch )) (A))) (voutput_max) (12) (vl))) (voutput_min) (12) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s13")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (13) (vl) ((batch_pre - batch )) (A))) (voutput_max) (13) (vl))) (voutput_min) (13) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s14")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (14) (vl) ((batch_pre - batch )) (A))) (voutput_max) (14) (vl))) (voutput_min) (14) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s15")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (15) (vl) ((batch_pre - batch )) (A))) (voutput_max) (15) (vl))) (voutput_min) (15) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s16")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (16) (vl) ((batch_pre - batch )) (A))) (voutput_max) (16) (vl))) (voutput_min) (16) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s17")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (17) (vl) ((batch_pre - batch )) (A))) (voutput_max) (17) (vl))) (voutput_min) (17) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s18")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (18) (vl) ((batch_pre - batch )) (A))) (voutput_max) (18) (vl))) (voutput_min) (18) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s19")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (19) (vl) ((batch_pre - batch )) (A))) (voutput_max) (19) (vl))) (voutput_min) (19) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s20")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (20) (vl) ((batch_pre - batch )) (A))) (voutput_max) (20) (vl))) (voutput_min) (20) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s21")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (21) (vl) ((batch_pre - batch )) (A))) (voutput_max) (21) (vl))) (voutput_min) (21) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s22")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (22) (vl) ((batch_pre - batch )) (A))) (voutput_max) (22) (vl))) (voutput_min) (22) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s23")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (23) (vl) ((batch_pre - batch )) (A))) (voutput_max) (23) (vl))) (voutput_min) (23) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s24")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (24) (vl) ((batch_pre - batch )) (A))) (voutput_max) (24) (vl))) (voutput_min) (24) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s25")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (25) (vl) ((batch_pre - batch )) (A))) (voutput_max) (25) (vl))) (voutput_min) (25) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s26")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (26) (vl) ((batch_pre - batch )) (A))) (voutput_max) (26) (vl))) (voutput_min) (26) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s27")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (27) (vl) ((batch_pre - batch )) (A))) (voutput_max) (27) (vl))) (voutput_min) (27) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s28")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (28) (vl) ((batch_pre - batch )) (A))) (voutput_max) (28) (vl))) (voutput_min) (28) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s29")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (29) (vl) ((batch_pre - batch )) (A))) (voutput_max) (29) (vl))) (voutput_min) (29) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s30")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (30) (vl) ((batch_pre - batch )) (A))) (voutput_max) (30) (vl))) (voutput_min) (30) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s31")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (31) (vl) ((batch_pre - batch )) (A))) (voutput_max) (31) (vl))) (voutput_min) (31) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s32")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (32) (vl) ((batch_pre - batch )) (A))) (voutput_max) (32) (vl))) (voutput_min) (32) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s33")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (33) (vl) ((batch_pre - batch )) (A))) (voutput_max) (33) (vl))) (voutput_min) (33) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s34")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (34) (vl) ((batch_pre - batch )) (A))) (voutput_max) (34) (vl))) (voutput_min) (34) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s35")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (35) (vl) ((batch_pre - batch )) (A))) (voutput_max) (35) (vl))) (voutput_min) (35) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s36")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (36) (vl) ((batch_pre - batch )) (A))) (voutput_max) (36) (vl))) (voutput_min) (36) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s37")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (37) (vl) ((batch_pre - batch )) (A))) (voutput_max) (37) (vl))) (voutput_min) (37) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s38")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (38) (vl) ((batch_pre - batch )) (A))) (voutput_max) (38) (vl))) (voutput_min) (38) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s39")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (39) (vl) ((batch_pre - batch )) (A))) (voutput_max) (39) (vl))) (voutput_min) (39) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s40")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (40) (vl) ((batch_pre - batch )) (A))) (voutput_max) (40) (vl))) (voutput_min) (40) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s41")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (41) (vl) ((batch_pre - batch )) (A))) (voutput_max) (41) (vl))) (voutput_min) (41) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s42")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (42) (vl) ((batch_pre - batch )) (A))) (voutput_max) (42) (vl))) (voutput_min) (42) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s43")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (43) (vl) ((batch_pre - batch )) (A))) (voutput_max) (43) (vl))) (voutput_min) (43) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s44")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (44) (vl) ((batch_pre - batch )) (A))) (voutput_max) (44) (vl))) (voutput_min) (44) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s45")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (45) (vl) ((batch_pre - batch )) (A))) (voutput_max) (45) (vl))) (voutput_min) (45) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s46")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (46) (vl) ((batch_pre - batch )) (A))) (voutput_max) (46) (vl))) (voutput_min) (46) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s47")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (47) (vl) ((batch_pre - batch )) (A))) (voutput_max) (47) (vl))) (voutput_min) (47) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s48")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (48) (vl) ((batch_pre - batch )) (A))) (voutput_max) (48) (vl))) (voutput_min) (48) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s49")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (49) (vl) ((batch_pre - batch )) (A))) (voutput_max) (49) (vl))) (voutput_min) (49) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s50")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (50) (vl) ((batch_pre - batch )) (A))) (voutput_max) (50) (vl))) (voutput_min) (50) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s51")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (51) (vl) ((batch_pre - batch )) (A))) (voutput_max) (51) (vl))) (voutput_min) (51) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s52")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (52) (vl) ((batch_pre - batch )) (A))) (voutput_max) (52) (vl))) (voutput_min) (52) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s53")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (53) (vl) ((batch_pre - batch )) (A))) (voutput_max) (53) (vl))) (voutput_min) (53) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s54")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (54) (vl) ((batch_pre - batch )) (A))) (voutput_max) (54) (vl))) (voutput_min) (54) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s55")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (55) (vl) ((batch_pre - batch )) (A))) (voutput_max) (55) (vl))) (voutput_min) (55) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s56")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (56) (vl) ((batch_pre - batch )) (A))) (voutput_max) (56) (vl))) (voutput_min) (56) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s57")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (57) (vl) ((batch_pre - batch )) (A))) (voutput_max) (57) (vl))) (voutput_min) (57) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s58")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (58) (vl) ((batch_pre - batch )) (A))) (voutput_max) (58) (vl))) (voutput_min) (58) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s59")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (59) (vl) ((batch_pre - batch )) (A))) (voutput_max) (59) (vl))) (voutput_min) (59) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s60")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (60) (vl) ((batch_pre - batch )) (A))) (voutput_max) (60) (vl))) (voutput_min) (60) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s61")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (61) (vl) ((batch_pre - batch )) (A))) (voutput_max) (61) (vl))) (voutput_min) (61) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s62")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (62) (vl) ((batch_pre - batch )) (A))) (voutput_max) (62) (vl))) (voutput_min) (62) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s63")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (63) (vl) ((batch_pre - batch )) (A))) (voutput_max) (63) (vl))) (voutput_min) (63) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s64")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (64) (vl) ((batch_pre - batch )) (A))) (voutput_max) (64) (vl))) (voutput_min) (64) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s65")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (65) (vl) ((batch_pre - batch )) (A))) (voutput_max) (65) (vl))) (voutput_min) (65) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s66")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (66) (vl) ((batch_pre - batch )) (A))) (voutput_max) (66) (vl))) (voutput_min) (66) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s67")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (67) (vl) ((batch_pre - batch )) (A))) (voutput_max) (67) (vl))) (voutput_min) (67) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s68")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (68) (vl) ((batch_pre - batch )) (A))) (voutput_max) (68) (vl))) (voutput_min) (68) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s69")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (69) (vl) ((batch_pre - batch )) (A))) (voutput_max) (69) (vl))) (voutput_min) (69) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s70")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (70) (vl) ((batch_pre - batch )) (A))) (voutput_max) (70) (vl))) (voutput_min) (70) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s71")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (71) (vl) ((batch_pre - batch )) (A))) (voutput_max) (71) (vl))) (voutput_min) (71) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s72")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (72) (vl) ((batch_pre - batch )) (A))) (voutput_max) (72) (vl))) (voutput_min) (72) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s73")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (73) (vl) ((batch_pre - batch )) (A))) (voutput_max) (73) (vl))) (voutput_min) (73) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s74")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (74) (vl) ((batch_pre - batch )) (A))) (voutput_max) (74) (vl))) (voutput_min) (74) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s75")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (75) (vl) ((batch_pre - batch )) (A))) (voutput_max) (75) (vl))) (voutput_min) (75) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s76")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (76) (vl) ((batch_pre - batch )) (A))) (voutput_max) (76) (vl))) (voutput_min) (76) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s77")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (77) (vl) ((batch_pre - batch )) (A))) (voutput_max) (77) (vl))) (voutput_min) (77) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s78")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (78) (vl) ((batch_pre - batch )) (A))) (voutput_max) (78) (vl))) (voutput_min) (78) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s79")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (79) (vl) ((batch_pre - batch )) (A))) (voutput_max) (79) (vl))) (voutput_min) (79) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s80")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (80) (vl) ((batch_pre - batch )) (A))) (voutput_max) (80) (vl))) (voutput_min) (80) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s81")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (81) (vl) ((batch_pre - batch )) (A))) (voutput_max) (81) (vl))) (voutput_min) (81) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s82")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (82) (vl) ((batch_pre - batch )) (A))) (voutput_max) (82) (vl))) (voutput_min) (82) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s83")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (83) (vl) ((batch_pre - batch )) (A))) (voutput_max) (83) (vl))) (voutput_min) (83) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s84")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (84) (vl) ((batch_pre - batch )) (A))) (voutput_max) (84) (vl))) (voutput_min) (84) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s85")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (85) (vl) ((batch_pre - batch )) (A))) (voutput_max) (85) (vl))) (voutput_min) (85) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s86")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (86) (vl) ((batch_pre - batch )) (A))) (voutput_max) (86) (vl))) (voutput_min) (86) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s87")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (87) (vl) ((batch_pre - batch )) (A))) (voutput_max) (87) (vl))) (voutput_min) (87) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s88")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (88) (vl) ((batch_pre - batch )) (A))) (voutput_max) (88) (vl))) (voutput_min) (88) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s89")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (89) (vl) ((batch_pre - batch )) (A))) (voutput_max) (89) (vl))) (voutput_min) (89) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s90")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (90) (vl) ((batch_pre - batch )) (A))) (voutput_max) (90) (vl))) (voutput_min) (90) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s91")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (91) (vl) ((batch_pre - batch )) (A))) (voutput_max) (91) (vl))) (voutput_min) (91) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s92")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (92) (vl) ((batch_pre - batch )) (A))) (voutput_max) (92) (vl))) (voutput_min) (92) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s93")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (93) (vl) ((batch_pre - batch )) (A))) (voutput_max) (93) (vl))) (voutput_min) (93) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s94")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (94) (vl) ((batch_pre - batch )) (A))) (voutput_max) (94) (vl))) (voutput_min) (94) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s95")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (95) (vl) ((batch_pre - batch )) (A))) (voutput_max) (95) (vl))) (voutput_min) (95) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s96")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (96) (vl) ((batch_pre - batch )) (A))) (voutput_max) (96) (vl))) (voutput_min) (96) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s97")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (97) (vl) ((batch_pre - batch )) (A))) (voutput_max) (97) (vl))) (voutput_min) (97) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s98")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (98) (vl) ((batch_pre - batch )) (A))) (voutput_max) (98) (vl))) (voutput_min) (98) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s99")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (99) (vl) ((batch_pre - batch )) (A))) (voutput_max) (99) (vl))) (voutput_min) (99) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s100")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (100) (vl) ((batch_pre - batch )) (A))) (voutput_max) (100) (vl))) (voutput_min) (100) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s101")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (101) (vl) ((batch_pre - batch )) (A))) (voutput_max) (101) (vl))) (voutput_min) (101) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s102")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (102) (vl) ((batch_pre - batch )) (A))) (voutput_max) (102) (vl))) (voutput_min) (102) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s103")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (103) (vl) ((batch_pre - batch )) (A))) (voutput_max) (103) (vl))) (voutput_min) (103) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s104")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (104) (vl) ((batch_pre - batch )) (A))) (voutput_max) (104) (vl))) (voutput_min) (104) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s105")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (105) (vl) ((batch_pre - batch )) (A))) (voutput_max) (105) (vl))) (voutput_min) (105) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s106")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (106) (vl) ((batch_pre - batch )) (A))) (voutput_max) (106) (vl))) (voutput_min) (106) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s107")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (107) (vl) ((batch_pre - batch )) (A))) (voutput_max) (107) (vl))) (voutput_min) (107) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s108")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (108) (vl) ((batch_pre - batch )) (A))) (voutput_max) (108) (vl))) (voutput_min) (108) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s109")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (109) (vl) ((batch_pre - batch )) (A))) (voutput_max) (109) (vl))) (voutput_min) (109) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s110")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (110) (vl) ((batch_pre - batch )) (A))) (voutput_max) (110) (vl))) (voutput_min) (110) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s111")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (111) (vl) ((batch_pre - batch )) (A))) (voutput_max) (111) (vl))) (voutput_min) (111) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s112")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (112) (vl) ((batch_pre - batch )) (A))) (voutput_max) (112) (vl))) (voutput_min) (112) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s113")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (113) (vl) ((batch_pre - batch )) (A))) (voutput_max) (113) (vl))) (voutput_min) (113) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s114")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (114) (vl) ((batch_pre - batch )) (A))) (voutput_max) (114) (vl))) (voutput_min) (114) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s115")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (115) (vl) ((batch_pre - batch )) (A))) (voutput_max) (115) (vl))) (voutput_min) (115) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s116")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (116) (vl) ((batch_pre - batch )) (A))) (voutput_max) (116) (vl))) (voutput_min) (116) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s117")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (117) (vl) ((batch_pre - batch )) (A))) (voutput_max) (117) (vl))) (voutput_min) (117) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s118")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (118) (vl) ((batch_pre - batch )) (A))) (voutput_max) (118) (vl))) (voutput_min) (118) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s119")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (119) (vl) ((batch_pre - batch )) (A))) (voutput_max) (119) (vl))) (voutput_min) (119) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s120")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (120) (vl) ((batch_pre - batch )) (A))) (voutput_max) (120) (vl))) (voutput_min) (120) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s121")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (121) (vl) ((batch_pre - batch )) (A))) (voutput_max) (121) (vl))) (voutput_min) (121) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s122")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (122) (vl) ((batch_pre - batch )) (A))) (voutput_max) (122) (vl))) (voutput_min) (122) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s123")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (123) (vl) ((batch_pre - batch )) (A))) (voutput_max) (123) (vl))) (voutput_min) (123) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s124")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (124) (vl) ((batch_pre - batch )) (A))) (voutput_max) (124) (vl))) (voutput_min) (124) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s125")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (125) (vl) ((batch_pre - batch )) (A))) (voutput_max) (125) (vl))) (voutput_min) (125) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s126")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (126) (vl) ((batch_pre - batch )) (A))) (voutput_max) (126) (vl))) (voutput_min) (126) (vl)))
  **  ((&(( &( "vacc" ) )->ₛ "s127")) # Char  |-> (s8_rvv_max_lane ((s8_rvv_min_lane ((s8_read_lane (127) (vl) ((batch_pre - batch )) (A))) (voutput_max) (127) (vl))) (voutput_min) (127) (vl)))
  **  (CharArray.undef_full output vl )
  **  (CharArray.undef_full (output + (vl * sizeof(CHAR))) (batch - vl ) )
  **  (CharArray.full input_pre (batch_pre + 7 ) A )
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "min")) # Int  |-> RawLo)
  **  ((&((params_pre)  # "xnn_s8_minmax_params" ->ₛ "scalar" .ₛ "max")) # Int  |-> RawHi)
  **  (CharArray.full output_pre (batch_pre - batch ) (s8_rvv_progress ((batch_pre - batch )) (batch_pre) ((s8_narrow (RawLo))) ((s8_narrow (RawHi))) (A)) )
.

Definition test_rvv_partial_solve_wit_20 := test_rvv_partial_solve_wit_20_pure -> test_rvv_partial_solve_wit_20_aux.

Module Type VC_Correct.

Include s8_arrays_Strategy_Correct.
Include rvv_vectors_Strategy_Correct.
Include rvv_kernel_Strategy_Correct.

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
Axiom proof_of_test_rvv_entail_wit_1 : test_rvv_entail_wit_1.
Axiom proof_of_test_rvv_entail_wit_2 : test_rvv_entail_wit_2.
Axiom proof_of_test_rvv_entail_wit_3 : test_rvv_entail_wit_3.
Axiom proof_of_test_rvv_entail_wit_4_1 : test_rvv_entail_wit_4_1.
Axiom proof_of_test_rvv_entail_wit_4_2 : test_rvv_entail_wit_4_2.
Axiom proof_of_test_rvv_entail_wit_5 : test_rvv_entail_wit_5.
Axiom proof_of_test_rvv_entail_wit_6_1 : test_rvv_entail_wit_6_1.
Axiom proof_of_test_rvv_entail_wit_6_2 : test_rvv_entail_wit_6_2.
Axiom proof_of_test_rvv_entail_wit_7_1 : test_rvv_entail_wit_7_1.
Axiom proof_of_test_rvv_entail_wit_7_2 : test_rvv_entail_wit_7_2.
Axiom proof_of_test_rvv_entail_wit_8 : test_rvv_entail_wit_8.
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
Axiom proof_of_test_rvv_partial_solve_wit_7 : test_rvv_partial_solve_wit_7.
Axiom proof_of_test_rvv_partial_solve_wit_8_pure : test_rvv_partial_solve_wit_8_pure.
Axiom proof_of_test_rvv_partial_solve_wit_8 : test_rvv_partial_solve_wit_8.
Axiom proof_of_test_rvv_partial_solve_wit_9 : test_rvv_partial_solve_wit_9.
Axiom proof_of_test_rvv_partial_solve_wit_10_pure : test_rvv_partial_solve_wit_10_pure.
Axiom proof_of_test_rvv_partial_solve_wit_10 : test_rvv_partial_solve_wit_10.
Axiom proof_of_test_rvv_partial_solve_wit_11 : test_rvv_partial_solve_wit_11.
Axiom proof_of_test_rvv_partial_solve_wit_12_pure : test_rvv_partial_solve_wit_12_pure.
Axiom proof_of_test_rvv_partial_solve_wit_12 : test_rvv_partial_solve_wit_12.
Axiom proof_of_test_rvv_partial_solve_wit_13_pure : test_rvv_partial_solve_wit_13_pure.
Axiom proof_of_test_rvv_partial_solve_wit_13 : test_rvv_partial_solve_wit_13.
Axiom proof_of_test_rvv_partial_solve_wit_14_pure : test_rvv_partial_solve_wit_14_pure.
Axiom proof_of_test_rvv_partial_solve_wit_14 : test_rvv_partial_solve_wit_14.
Axiom proof_of_test_rvv_partial_solve_wit_15 : test_rvv_partial_solve_wit_15.
Axiom proof_of_test_rvv_partial_solve_wit_16_pure : test_rvv_partial_solve_wit_16_pure.
Axiom proof_of_test_rvv_partial_solve_wit_16 : test_rvv_partial_solve_wit_16.
Axiom proof_of_test_rvv_partial_solve_wit_17 : test_rvv_partial_solve_wit_17.
Axiom proof_of_test_rvv_partial_solve_wit_18_pure : test_rvv_partial_solve_wit_18_pure.
Axiom proof_of_test_rvv_partial_solve_wit_18 : test_rvv_partial_solve_wit_18.
Axiom proof_of_test_rvv_partial_solve_wit_19 : test_rvv_partial_solve_wit_19.
Axiom proof_of_test_rvv_partial_solve_wit_20_pure : test_rvv_partial_solve_wit_20_pure.
Axiom proof_of_test_rvv_partial_solve_wit_20 : test_rvv_partial_solve_wit_20.

End VC_Correct.
