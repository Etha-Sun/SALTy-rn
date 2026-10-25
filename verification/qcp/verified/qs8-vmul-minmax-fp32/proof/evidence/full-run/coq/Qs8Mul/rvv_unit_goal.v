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
From Qs8Mul Require Import rvv_unit_def.
Import Snaive_C_Rules64.
Require Import Qs8Mul.Types.
Require Import Qs8Mul.IntrinsicModel.
Require Import Qs8Mul.ActiveModel.
Require Import Qs8Mul.VectorValues.
Require Import Qs8Mul.ScalarBitsFacts.
Require Import Qs8Mul.ProgramModel.
Require Import Qs8Mul.Types.
Require Import Qs8Mul.KernelFacts.
Require Import Qs8Mul.Types.
Require Import Qs8Mul.RecordViews.
Require Import Qs8Mul.Types.
Require Import Qs8Mul.RecordStageViews.
Require Import Qs8Mul.RecordInputViews.
Require Import Qs8Mul.RecordComputeModel.
Local Open Scope sac.
From Qs8Mul Require Import byte_store_strategy_goal.
From Qs8Mul Require Import byte_store_strategy_proof.
From Qs8Mul Require Import rvv_prefix_store_strategy_goal.
From Qs8Mul Require Import rvv_prefix_store_strategy_proof.

(*----- Function test_rvv -----*)

Definition test_rvv_safety_wit_1 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (Hi: Z) (Lo: Z) (OZ: Z) (Scale: fp32) (BZ: Z) (AZ: Z) (M: RDMap) (PreH1 : (0 < batch_pre)) (PreH2 : (batch_pre <= UINT64_MAX)) (PreH3 : (input_a_pre <> 0)) (PreH4 : (input_b_pre <> 0)) (PreH5 : (output_pre <> 0)) (PreH6 : (params_pre <> 0)) (PreH7 : ((-128) <= AZ)) (PreH8 : (AZ <= 127)) (PreH9 : ((-128) <= BZ)) (PreH10 : (BZ <= 127)) (PreH11 : ((-32768) <= OZ)) (PreH12 : (OZ <= 32767)) (PreH13 : ((-128) <= Lo)) (PreH14 : (Lo <= 127)) (PreH15 : ((-128) <= Hi)) (PreH16 : (Hi <= 127)) (PreH17 : (qm_inputs M input_a_pre input_b_pre batch_pre )) (PreH18 : (sizeof(CHAR) = 1)) (PreH19 : (0 <= batch_pre)) (PreH20 : (batch_pre <= batch_pre)) (PreH21 : (input_a_pre = (input_a_pre + ((batch_pre - batch_pre ) * sizeof(CHAR))))) (PreH22 : (input_b_pre = (input_b_pre + ((batch_pre - batch_pre ) * sizeof(CHAR))))) (PreH23 : (batch_pre = 0)) (PreH24 : ((batch_pre % ( sizeof(CHAR) ) ) = 0)) ,
  ((( &( "batch" ) )) # UInt64  |-> batch_pre)
  **  ((( &( "input_a" ) )) # Ptr  |-> input_a_pre)
  **  ((( &( "input_b" ) )) # Ptr  |-> input_b_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  (rd_mem M )
  **  (CharArray.full output_pre (batch_pre - batch_pre ) (qm_values ((batch_pre - batch_pre )) (M) (input_a_pre) (input_b_pre) (AZ) (BZ) (Scale) (OZ) (Lo) (Hi)) )
  **  (CharArray.undef_full output_pre batch_pre )
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "a_zero_point")) # Char  |-> AZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "b_zero_point")) # Char  |-> BZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "scale")) # Float  |-> Scale)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_zero_point")) # Short  |-> OZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_min")) # Char  |-> Lo)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_max")) # Char  |-> Hi)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition test_rvv_safety_wit_2 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (Hi: Z) (Lo: Z) (OZ: Z) (Scale: fp32) (BZ: Z) (AZ: Z) (M: RDMap) (PreH1 : (batch_pre = (unsigned_last_nbits (0) (64)))) (PreH2 : (0 < batch_pre)) (PreH3 : (batch_pre <= UINT64_MAX)) (PreH4 : (input_a_pre <> 0)) (PreH5 : (input_b_pre <> 0)) (PreH6 : (output_pre <> 0)) (PreH7 : (params_pre <> 0)) (PreH8 : ((-128) <= AZ)) (PreH9 : (AZ <= 127)) (PreH10 : ((-128) <= BZ)) (PreH11 : (BZ <= 127)) (PreH12 : ((-32768) <= OZ)) (PreH13 : (OZ <= 32767)) (PreH14 : ((-128) <= Lo)) (PreH15 : (Lo <= 127)) (PreH16 : ((-128) <= Hi)) (PreH17 : (Hi <= 127)) (PreH18 : (qm_inputs M input_a_pre input_b_pre batch_pre )) (PreH19 : (sizeof(CHAR) = 1)) (PreH20 : (0 <= batch_pre)) (PreH21 : (batch_pre <= batch_pre)) (PreH22 : (input_a_pre = (input_a_pre + ((batch_pre - batch_pre ) * sizeof(CHAR))))) (PreH23 : (input_b_pre = (input_b_pre + ((batch_pre - batch_pre ) * sizeof(CHAR))))) (PreH24 : (batch_pre = 0)) (PreH25 : ((batch_pre % ( sizeof(CHAR) ) ) = 0)) ,
  ((( &( "batch" ) )) # UInt64  |-> batch_pre)
  **  ((( &( "input_a" ) )) # Ptr  |-> input_a_pre)
  **  ((( &( "input_b" ) )) # Ptr  |-> input_b_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  (rd_mem M )
  **  (CharArray.full output_pre (batch_pre - batch_pre ) (qm_values ((batch_pre - batch_pre )) (M) (input_a_pre) (input_b_pre) (AZ) (BZ) (Scale) (OZ) (Lo) (Hi)) )
  **  (CharArray.undef_full output_pre batch_pre )
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "a_zero_point")) # Char  |-> AZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "b_zero_point")) # Char  |-> BZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "scale")) # Float  |-> Scale)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_zero_point")) # Short  |-> OZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_min")) # Char  |-> Lo)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_max")) # Char  |-> Hi)
|--
  “ False ”
.

Definition test_rvv_safety_wit_3 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (Hi: Z) (Lo: Z) (OZ: Z) (Scale: fp32) (BZ: Z) (AZ: Z) (M: RDMap) (PreH1 : (batch_pre <> (unsigned_last_nbits (0) (64)))) (PreH2 : (0 < batch_pre)) (PreH3 : (batch_pre <= UINT64_MAX)) (PreH4 : (input_a_pre <> 0)) (PreH5 : (input_b_pre <> 0)) (PreH6 : (output_pre <> 0)) (PreH7 : (params_pre <> 0)) (PreH8 : ((-128) <= AZ)) (PreH9 : (AZ <= 127)) (PreH10 : ((-128) <= BZ)) (PreH11 : (BZ <= 127)) (PreH12 : ((-32768) <= OZ)) (PreH13 : (OZ <= 32767)) (PreH14 : ((-128) <= Lo)) (PreH15 : (Lo <= 127)) (PreH16 : ((-128) <= Hi)) (PreH17 : (Hi <= 127)) (PreH18 : (qm_inputs M input_a_pre input_b_pre batch_pre )) (PreH19 : (sizeof(CHAR) = 1)) (PreH20 : (0 <= batch_pre)) (PreH21 : (batch_pre <= batch_pre)) (PreH22 : (input_a_pre = (input_a_pre + ((batch_pre - batch_pre ) * sizeof(CHAR))))) (PreH23 : (input_b_pre = (input_b_pre + ((batch_pre - batch_pre ) * sizeof(CHAR))))) (PreH24 : (batch_pre = 0)) (PreH25 : ((batch_pre % ( sizeof(CHAR) ) ) = 0)) ,
  ((( &( "batch" ) )) # UInt64  |-> batch_pre)
  **  ((( &( "input_a" ) )) # Ptr  |-> input_a_pre)
  **  ((( &( "input_b" ) )) # Ptr  |-> input_b_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  (rd_mem M )
  **  (CharArray.full output_pre (batch_pre - batch_pre ) (qm_values ((batch_pre - batch_pre )) (M) (input_a_pre) (input_b_pre) (AZ) (BZ) (Scale) (OZ) (Lo) (Hi)) )
  **  (CharArray.undef_full output_pre batch_pre )
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "a_zero_point")) # Char  |-> AZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "b_zero_point")) # Char  |-> BZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "scale")) # Float  |-> Scale)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_zero_point")) # Short  |-> OZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_min")) # Char  |-> Lo)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_max")) # Char  |-> Hi)
|--
  “ False ”
.

Definition test_rvv_safety_wit_4 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (Hi: Z) (Lo: Z) (OZ: Z) (Scale: fp32) (BZ: Z) (AZ: Z) (M: RDMap) (PreH1 : (0 < batch_pre)) (PreH2 : (batch_pre <= UINT64_MAX)) (PreH3 : (input_a_pre <> 0)) (PreH4 : (input_b_pre <> 0)) (PreH5 : (output_pre <> 0)) (PreH6 : (params_pre <> 0)) (PreH7 : ((-128) <= AZ)) (PreH8 : (AZ <= 127)) (PreH9 : ((-128) <= BZ)) (PreH10 : (BZ <= 127)) (PreH11 : ((-32768) <= OZ)) (PreH12 : (OZ <= 32767)) (PreH13 : ((-128) <= Lo)) (PreH14 : (Lo <= 127)) (PreH15 : ((-128) <= Hi)) (PreH16 : (Hi <= 127)) (PreH17 : (qm_inputs M input_a_pre input_b_pre batch_pre )) (PreH18 : (sizeof(CHAR) = 1)) (PreH19 : (0 <= batch_pre)) (PreH20 : (batch_pre <= batch_pre)) (PreH21 : (input_a_pre = (input_a_pre + ((batch_pre - batch_pre ) * sizeof(CHAR))))) (PreH22 : (input_b_pre = (input_b_pre + ((batch_pre - batch_pre ) * sizeof(CHAR))))) (PreH23 : (output_pre = (output_pre + ((batch_pre - batch_pre ) * sizeof(CHAR))))) (PreH24 : ((batch_pre % ( sizeof(CHAR) ) ) = 0)) ,
  ((( &( "batch" ) )) # UInt64  |-> batch_pre)
  **  ((( &( "input_a" ) )) # Ptr  |-> input_a_pre)
  **  ((( &( "input_b" ) )) # Ptr  |-> input_b_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (rd_mem M )
  **  (CharArray.full output_pre (batch_pre - batch_pre ) (qm_values ((batch_pre - batch_pre )) (M) (input_a_pre) (input_b_pre) (AZ) (BZ) (Scale) (OZ) (Lo) (Hi)) )
  **  (CharArray.undef_full output_pre batch_pre )
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "a_zero_point")) # Char  |-> AZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "b_zero_point")) # Char  |-> BZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "scale")) # Float  |-> Scale)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_zero_point")) # Short  |-> OZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_min")) # Char  |-> Lo)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_max")) # Char  |-> Hi)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition test_rvv_safety_wit_5 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (Hi: Z) (Lo: Z) (OZ: Z) (Scale: fp32) (BZ: Z) (AZ: Z) (M: RDMap) (PreH1 : (batch_pre = 0)) (PreH2 : (0 < batch_pre)) (PreH3 : (batch_pre <= UINT64_MAX)) (PreH4 : (input_a_pre <> 0)) (PreH5 : (input_b_pre <> 0)) (PreH6 : (output_pre <> 0)) (PreH7 : (params_pre <> 0)) (PreH8 : ((-128) <= AZ)) (PreH9 : (AZ <= 127)) (PreH10 : ((-128) <= BZ)) (PreH11 : (BZ <= 127)) (PreH12 : ((-32768) <= OZ)) (PreH13 : (OZ <= 32767)) (PreH14 : ((-128) <= Lo)) (PreH15 : (Lo <= 127)) (PreH16 : ((-128) <= Hi)) (PreH17 : (Hi <= 127)) (PreH18 : (qm_inputs M input_a_pre input_b_pre batch_pre )) (PreH19 : (sizeof(CHAR) = 1)) (PreH20 : (0 <= batch_pre)) (PreH21 : (batch_pre <= batch_pre)) (PreH22 : (input_a_pre = (input_a_pre + ((batch_pre - batch_pre ) * sizeof(CHAR))))) (PreH23 : (input_b_pre = (input_b_pre + ((batch_pre - batch_pre ) * sizeof(CHAR))))) (PreH24 : (output_pre = (output_pre + ((batch_pre - batch_pre ) * sizeof(CHAR))))) (PreH25 : ((batch_pre % ( sizeof(CHAR) ) ) = 0)) ,
  ((( &( "batch" ) )) # UInt64  |-> batch_pre)
  **  ((( &( "input_a" ) )) # Ptr  |-> input_a_pre)
  **  ((( &( "input_b" ) )) # Ptr  |-> input_b_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (rd_mem M )
  **  (CharArray.full output_pre (batch_pre - batch_pre ) (qm_values ((batch_pre - batch_pre )) (M) (input_a_pre) (input_b_pre) (AZ) (BZ) (Scale) (OZ) (Lo) (Hi)) )
  **  (CharArray.undef_full output_pre batch_pre )
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "a_zero_point")) # Char  |-> AZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "b_zero_point")) # Char  |-> BZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "scale")) # Float  |-> Scale)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_zero_point")) # Short  |-> OZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_min")) # Char  |-> Lo)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_max")) # Char  |-> Hi)
|--
  “ False ”
.

Definition test_rvv_safety_wit_6 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (Hi: Z) (Lo: Z) (OZ: Z) (Scale: fp32) (BZ: Z) (AZ: Z) (M: RDMap) (PreH1 : (batch_pre <> 0)) (PreH2 : (0 < batch_pre)) (PreH3 : (batch_pre <= UINT64_MAX)) (PreH4 : (input_a_pre <> 0)) (PreH5 : (input_b_pre <> 0)) (PreH6 : (output_pre <> 0)) (PreH7 : (params_pre <> 0)) (PreH8 : ((-128) <= AZ)) (PreH9 : (AZ <= 127)) (PreH10 : ((-128) <= BZ)) (PreH11 : (BZ <= 127)) (PreH12 : ((-32768) <= OZ)) (PreH13 : (OZ <= 32767)) (PreH14 : ((-128) <= Lo)) (PreH15 : (Lo <= 127)) (PreH16 : ((-128) <= Hi)) (PreH17 : (Hi <= 127)) (PreH18 : (qm_inputs M input_a_pre input_b_pre batch_pre )) (PreH19 : (sizeof(CHAR) = 1)) (PreH20 : (0 <= batch_pre)) (PreH21 : (batch_pre <= batch_pre)) (PreH22 : (input_a_pre = (input_a_pre + ((batch_pre - batch_pre ) * sizeof(CHAR))))) (PreH23 : (input_b_pre = (input_b_pre + ((batch_pre - batch_pre ) * sizeof(CHAR))))) (PreH24 : (output_pre = (output_pre + ((batch_pre - batch_pre ) * sizeof(CHAR))))) (PreH25 : ((batch_pre % ( sizeof(CHAR) ) ) = 0)) ,
  ((( &( "batch" ) )) # UInt64  |-> batch_pre)
  **  ((( &( "input_a" ) )) # Ptr  |-> input_a_pre)
  **  ((( &( "input_b" ) )) # Ptr  |-> input_b_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (rd_mem M )
  **  (CharArray.full output_pre (batch_pre - batch_pre ) (qm_values ((batch_pre - batch_pre )) (M) (input_a_pre) (input_b_pre) (AZ) (BZ) (Scale) (OZ) (Lo) (Hi)) )
  **  (CharArray.undef_full output_pre batch_pre )
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "a_zero_point")) # Char  |-> AZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "b_zero_point")) # Char  |-> BZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "scale")) # Float  |-> Scale)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_zero_point")) # Short  |-> OZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_min")) # Char  |-> Lo)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_max")) # Char  |-> Hi)
|--
  “ (sizeof(CHAR) <> 0) ”
.

Definition test_rvv_safety_wit_7 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (Hi: Z) (Lo: Z) (OZ: Z) (Scale: fp32) (BZ: Z) (AZ: Z) (M: RDMap) (PreH1 : (batch_pre <> 0)) (PreH2 : (0 < batch_pre)) (PreH3 : (batch_pre <= UINT64_MAX)) (PreH4 : (input_a_pre <> 0)) (PreH5 : (input_b_pre <> 0)) (PreH6 : (output_pre <> 0)) (PreH7 : (params_pre <> 0)) (PreH8 : ((-128) <= AZ)) (PreH9 : (AZ <= 127)) (PreH10 : ((-128) <= BZ)) (PreH11 : (BZ <= 127)) (PreH12 : ((-32768) <= OZ)) (PreH13 : (OZ <= 32767)) (PreH14 : ((-128) <= Lo)) (PreH15 : (Lo <= 127)) (PreH16 : ((-128) <= Hi)) (PreH17 : (Hi <= 127)) (PreH18 : (qm_inputs M input_a_pre input_b_pre batch_pre )) (PreH19 : (sizeof(CHAR) = 1)) (PreH20 : (0 <= batch_pre)) (PreH21 : (batch_pre <= batch_pre)) (PreH22 : (input_a_pre = (input_a_pre + ((batch_pre - batch_pre ) * sizeof(CHAR))))) (PreH23 : (input_b_pre = (input_b_pre + ((batch_pre - batch_pre ) * sizeof(CHAR))))) (PreH24 : (output_pre = (output_pre + ((batch_pre - batch_pre ) * sizeof(CHAR))))) (PreH25 : ((batch_pre % ( sizeof(CHAR) ) ) = 0)) ,
  ((( &( "batch" ) )) # UInt64  |-> batch_pre)
  **  ((( &( "input_a" ) )) # Ptr  |-> input_a_pre)
  **  ((( &( "input_b" ) )) # Ptr  |-> input_b_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (rd_mem M )
  **  (CharArray.full output_pre (batch_pre - batch_pre ) (qm_values ((batch_pre - batch_pre )) (M) (input_a_pre) (input_b_pre) (AZ) (BZ) (Scale) (OZ) (Lo) (Hi)) )
  **  (CharArray.undef_full output_pre batch_pre )
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "a_zero_point")) # Char  |-> AZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "b_zero_point")) # Char  |-> BZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "scale")) # Float  |-> Scale)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_zero_point")) # Short  |-> OZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_min")) # Char  |-> Lo)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_max")) # Char  |-> Hi)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition test_rvv_safety_wit_8 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (Hi: Z) (Lo: Z) (OZ: Z) (Scale: fp32) (BZ: Z) (AZ: Z) (M: RDMap) (PreH1 : ((batch_pre % ( sizeof(CHAR) ) ) <> 0)) (PreH2 : (batch_pre <> 0)) (PreH3 : (0 < batch_pre)) (PreH4 : (batch_pre <= UINT64_MAX)) (PreH5 : (input_a_pre <> 0)) (PreH6 : (input_b_pre <> 0)) (PreH7 : (output_pre <> 0)) (PreH8 : (params_pre <> 0)) (PreH9 : ((-128) <= AZ)) (PreH10 : (AZ <= 127)) (PreH11 : ((-128) <= BZ)) (PreH12 : (BZ <= 127)) (PreH13 : ((-32768) <= OZ)) (PreH14 : (OZ <= 32767)) (PreH15 : ((-128) <= Lo)) (PreH16 : (Lo <= 127)) (PreH17 : ((-128) <= Hi)) (PreH18 : (Hi <= 127)) (PreH19 : (qm_inputs M input_a_pre input_b_pre batch_pre )) (PreH20 : (sizeof(CHAR) = 1)) (PreH21 : (0 <= batch_pre)) (PreH22 : (batch_pre <= batch_pre)) (PreH23 : (input_a_pre = (input_a_pre + ((batch_pre - batch_pre ) * sizeof(CHAR))))) (PreH24 : (input_b_pre = (input_b_pre + ((batch_pre - batch_pre ) * sizeof(CHAR))))) (PreH25 : (output_pre = (output_pre + ((batch_pre - batch_pre ) * sizeof(CHAR))))) (PreH26 : ((batch_pre % ( sizeof(CHAR) ) ) = 0)) ,
  ((( &( "batch" ) )) # UInt64  |-> batch_pre)
  **  ((( &( "input_a" ) )) # Ptr  |-> input_a_pre)
  **  ((( &( "input_b" ) )) # Ptr  |-> input_b_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (rd_mem M )
  **  (CharArray.full output_pre (batch_pre - batch_pre ) (qm_values ((batch_pre - batch_pre )) (M) (input_a_pre) (input_b_pre) (AZ) (BZ) (Scale) (OZ) (Lo) (Hi)) )
  **  (CharArray.undef_full output_pre batch_pre )
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "a_zero_point")) # Char  |-> AZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "b_zero_point")) # Char  |-> BZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "scale")) # Float  |-> Scale)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_zero_point")) # Short  |-> OZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_min")) # Char  |-> Lo)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_max")) # Char  |-> Hi)
|--
  “ False ”
.

Definition test_rvv_safety_wit_9 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (Hi: Z) (Lo: Z) (OZ: Z) (Scale: fp32) (BZ: Z) (AZ: Z) (M: RDMap) (PreH1 : ((batch_pre % ( sizeof(CHAR) ) ) = 0)) (PreH2 : (batch_pre <> 0)) (PreH3 : (0 < batch_pre)) (PreH4 : (batch_pre <= UINT64_MAX)) (PreH5 : (input_a_pre <> 0)) (PreH6 : (input_b_pre <> 0)) (PreH7 : (output_pre <> 0)) (PreH8 : (params_pre <> 0)) (PreH9 : ((-128) <= AZ)) (PreH10 : (AZ <= 127)) (PreH11 : ((-128) <= BZ)) (PreH12 : (BZ <= 127)) (PreH13 : ((-32768) <= OZ)) (PreH14 : (OZ <= 32767)) (PreH15 : ((-128) <= Lo)) (PreH16 : (Lo <= 127)) (PreH17 : ((-128) <= Hi)) (PreH18 : (Hi <= 127)) (PreH19 : (qm_inputs M input_a_pre input_b_pre batch_pre )) (PreH20 : (sizeof(CHAR) = 1)) (PreH21 : (0 <= batch_pre)) (PreH22 : (batch_pre <= batch_pre)) (PreH23 : (input_a_pre = (input_a_pre + ((batch_pre - batch_pre ) * sizeof(CHAR))))) (PreH24 : (input_b_pre = (input_b_pre + ((batch_pre - batch_pre ) * sizeof(CHAR))))) (PreH25 : (output_pre = (output_pre + ((batch_pre - batch_pre ) * sizeof(CHAR))))) (PreH26 : ((batch_pre % ( sizeof(CHAR) ) ) = 0)) ,
  ((( &( "batch" ) )) # UInt64  |-> batch_pre)
  **  ((( &( "input_a" ) )) # Ptr  |-> input_a_pre)
  **  ((( &( "input_b" ) )) # Ptr  |-> input_b_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (rd_mem M )
  **  (CharArray.full output_pre (batch_pre - batch_pre ) (qm_values ((batch_pre - batch_pre )) (M) (input_a_pre) (input_b_pre) (AZ) (BZ) (Scale) (OZ) (Lo) (Hi)) )
  **  (CharArray.undef_full output_pre batch_pre )
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "a_zero_point")) # Char  |-> AZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "b_zero_point")) # Char  |-> BZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "scale")) # Float  |-> Scale)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_zero_point")) # Short  |-> OZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_min")) # Char  |-> Lo)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_max")) # Char  |-> Hi)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition test_rvv_safety_wit_10 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (Hi: Z) (Lo: Z) (OZ: Z) (Scale: fp32) (BZ: Z) (AZ: Z) (M: RDMap) (PreH1 : (input_a_pre = 0)) (PreH2 : ((batch_pre % ( sizeof(CHAR) ) ) = 0)) (PreH3 : (batch_pre <> 0)) (PreH4 : (0 < batch_pre)) (PreH5 : (batch_pre <= UINT64_MAX)) (PreH6 : (input_a_pre <> 0)) (PreH7 : (input_b_pre <> 0)) (PreH8 : (output_pre <> 0)) (PreH9 : (params_pre <> 0)) (PreH10 : ((-128) <= AZ)) (PreH11 : (AZ <= 127)) (PreH12 : ((-128) <= BZ)) (PreH13 : (BZ <= 127)) (PreH14 : ((-32768) <= OZ)) (PreH15 : (OZ <= 32767)) (PreH16 : ((-128) <= Lo)) (PreH17 : (Lo <= 127)) (PreH18 : ((-128) <= Hi)) (PreH19 : (Hi <= 127)) (PreH20 : (qm_inputs M input_a_pre input_b_pre batch_pre )) (PreH21 : (sizeof(CHAR) = 1)) (PreH22 : (0 <= batch_pre)) (PreH23 : (batch_pre <= batch_pre)) (PreH24 : (input_a_pre = (input_a_pre + ((batch_pre - batch_pre ) * sizeof(CHAR))))) (PreH25 : (input_b_pre = (input_b_pre + ((batch_pre - batch_pre ) * sizeof(CHAR))))) (PreH26 : (output_pre = (output_pre + ((batch_pre - batch_pre ) * sizeof(CHAR))))) (PreH27 : ((batch_pre % ( sizeof(CHAR) ) ) = 0)) ,
  ((( &( "batch" ) )) # UInt64  |-> batch_pre)
  **  ((( &( "input_a" ) )) # Ptr  |-> input_a_pre)
  **  ((( &( "input_b" ) )) # Ptr  |-> input_b_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (rd_mem M )
  **  (CharArray.full output_pre (batch_pre - batch_pre ) (qm_values ((batch_pre - batch_pre )) (M) (input_a_pre) (input_b_pre) (AZ) (BZ) (Scale) (OZ) (Lo) (Hi)) )
  **  (CharArray.undef_full output_pre batch_pre )
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "a_zero_point")) # Char  |-> AZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "b_zero_point")) # Char  |-> BZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "scale")) # Float  |-> Scale)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_zero_point")) # Short  |-> OZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_min")) # Char  |-> Lo)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_max")) # Char  |-> Hi)
|--
  “ False ”
.

Definition test_rvv_safety_wit_11 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (Hi: Z) (Lo: Z) (OZ: Z) (Scale: fp32) (BZ: Z) (AZ: Z) (M: RDMap) (PreH1 : (input_a_pre <> 0)) (PreH2 : ((batch_pre % ( sizeof(CHAR) ) ) = 0)) (PreH3 : (batch_pre <> 0)) (PreH4 : (0 < batch_pre)) (PreH5 : (batch_pre <= UINT64_MAX)) (PreH6 : (input_a_pre <> 0)) (PreH7 : (input_b_pre <> 0)) (PreH8 : (output_pre <> 0)) (PreH9 : (params_pre <> 0)) (PreH10 : ((-128) <= AZ)) (PreH11 : (AZ <= 127)) (PreH12 : ((-128) <= BZ)) (PreH13 : (BZ <= 127)) (PreH14 : ((-32768) <= OZ)) (PreH15 : (OZ <= 32767)) (PreH16 : ((-128) <= Lo)) (PreH17 : (Lo <= 127)) (PreH18 : ((-128) <= Hi)) (PreH19 : (Hi <= 127)) (PreH20 : (qm_inputs M input_a_pre input_b_pre batch_pre )) (PreH21 : (sizeof(CHAR) = 1)) (PreH22 : (0 <= batch_pre)) (PreH23 : (batch_pre <= batch_pre)) (PreH24 : (input_a_pre = (input_a_pre + ((batch_pre - batch_pre ) * sizeof(CHAR))))) (PreH25 : (input_b_pre = (input_b_pre + ((batch_pre - batch_pre ) * sizeof(CHAR))))) (PreH26 : (output_pre = (output_pre + ((batch_pre - batch_pre ) * sizeof(CHAR))))) (PreH27 : ((batch_pre % ( sizeof(CHAR) ) ) = 0)) ,
  ((( &( "batch" ) )) # UInt64  |-> batch_pre)
  **  ((( &( "input_a" ) )) # Ptr  |-> input_a_pre)
  **  ((( &( "input_b" ) )) # Ptr  |-> input_b_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (rd_mem M )
  **  (CharArray.full output_pre (batch_pre - batch_pre ) (qm_values ((batch_pre - batch_pre )) (M) (input_a_pre) (input_b_pre) (AZ) (BZ) (Scale) (OZ) (Lo) (Hi)) )
  **  (CharArray.undef_full output_pre batch_pre )
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "a_zero_point")) # Char  |-> AZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "b_zero_point")) # Char  |-> BZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "scale")) # Float  |-> Scale)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_zero_point")) # Short  |-> OZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_min")) # Char  |-> Lo)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_max")) # Char  |-> Hi)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition test_rvv_safety_wit_12 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (Hi: Z) (Lo: Z) (OZ: Z) (Scale: fp32) (BZ: Z) (AZ: Z) (M: RDMap) (PreH1 : (input_b_pre = 0)) (PreH2 : (input_a_pre <> 0)) (PreH3 : ((batch_pre % ( sizeof(CHAR) ) ) = 0)) (PreH4 : (batch_pre <> 0)) (PreH5 : (0 < batch_pre)) (PreH6 : (batch_pre <= UINT64_MAX)) (PreH7 : (input_a_pre <> 0)) (PreH8 : (input_b_pre <> 0)) (PreH9 : (output_pre <> 0)) (PreH10 : (params_pre <> 0)) (PreH11 : ((-128) <= AZ)) (PreH12 : (AZ <= 127)) (PreH13 : ((-128) <= BZ)) (PreH14 : (BZ <= 127)) (PreH15 : ((-32768) <= OZ)) (PreH16 : (OZ <= 32767)) (PreH17 : ((-128) <= Lo)) (PreH18 : (Lo <= 127)) (PreH19 : ((-128) <= Hi)) (PreH20 : (Hi <= 127)) (PreH21 : (qm_inputs M input_a_pre input_b_pre batch_pre )) (PreH22 : (sizeof(CHAR) = 1)) (PreH23 : (0 <= batch_pre)) (PreH24 : (batch_pre <= batch_pre)) (PreH25 : (input_a_pre = (input_a_pre + ((batch_pre - batch_pre ) * sizeof(CHAR))))) (PreH26 : (input_b_pre = (input_b_pre + ((batch_pre - batch_pre ) * sizeof(CHAR))))) (PreH27 : (output_pre = (output_pre + ((batch_pre - batch_pre ) * sizeof(CHAR))))) (PreH28 : ((batch_pre % ( sizeof(CHAR) ) ) = 0)) ,
  ((( &( "batch" ) )) # UInt64  |-> batch_pre)
  **  ((( &( "input_a" ) )) # Ptr  |-> input_a_pre)
  **  ((( &( "input_b" ) )) # Ptr  |-> input_b_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (rd_mem M )
  **  (CharArray.full output_pre (batch_pre - batch_pre ) (qm_values ((batch_pre - batch_pre )) (M) (input_a_pre) (input_b_pre) (AZ) (BZ) (Scale) (OZ) (Lo) (Hi)) )
  **  (CharArray.undef_full output_pre batch_pre )
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "a_zero_point")) # Char  |-> AZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "b_zero_point")) # Char  |-> BZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "scale")) # Float  |-> Scale)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_zero_point")) # Short  |-> OZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_min")) # Char  |-> Lo)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_max")) # Char  |-> Hi)
|--
  “ False ”
.

Definition test_rvv_safety_wit_13 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (Hi: Z) (Lo: Z) (OZ: Z) (Scale: fp32) (BZ: Z) (AZ: Z) (M: RDMap) (PreH1 : (input_b_pre <> 0)) (PreH2 : (input_a_pre <> 0)) (PreH3 : ((batch_pre % ( sizeof(CHAR) ) ) = 0)) (PreH4 : (batch_pre <> 0)) (PreH5 : (0 < batch_pre)) (PreH6 : (batch_pre <= UINT64_MAX)) (PreH7 : (input_a_pre <> 0)) (PreH8 : (input_b_pre <> 0)) (PreH9 : (output_pre <> 0)) (PreH10 : (params_pre <> 0)) (PreH11 : ((-128) <= AZ)) (PreH12 : (AZ <= 127)) (PreH13 : ((-128) <= BZ)) (PreH14 : (BZ <= 127)) (PreH15 : ((-32768) <= OZ)) (PreH16 : (OZ <= 32767)) (PreH17 : ((-128) <= Lo)) (PreH18 : (Lo <= 127)) (PreH19 : ((-128) <= Hi)) (PreH20 : (Hi <= 127)) (PreH21 : (qm_inputs M input_a_pre input_b_pre batch_pre )) (PreH22 : (sizeof(CHAR) = 1)) (PreH23 : (0 <= batch_pre)) (PreH24 : (batch_pre <= batch_pre)) (PreH25 : (input_a_pre = (input_a_pre + ((batch_pre - batch_pre ) * sizeof(CHAR))))) (PreH26 : (input_b_pre = (input_b_pre + ((batch_pre - batch_pre ) * sizeof(CHAR))))) (PreH27 : (output_pre = (output_pre + ((batch_pre - batch_pre ) * sizeof(CHAR))))) (PreH28 : ((batch_pre % ( sizeof(CHAR) ) ) = 0)) ,
  ((( &( "batch" ) )) # UInt64  |-> batch_pre)
  **  ((( &( "input_a" ) )) # Ptr  |-> input_a_pre)
  **  ((( &( "input_b" ) )) # Ptr  |-> input_b_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (rd_mem M )
  **  (CharArray.full output_pre (batch_pre - batch_pre ) (qm_values ((batch_pre - batch_pre )) (M) (input_a_pre) (input_b_pre) (AZ) (BZ) (Scale) (OZ) (Lo) (Hi)) )
  **  (CharArray.undef_full output_pre batch_pre )
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "a_zero_point")) # Char  |-> AZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "b_zero_point")) # Char  |-> BZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "scale")) # Float  |-> Scale)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_zero_point")) # Short  |-> OZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_min")) # Char  |-> Lo)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_max")) # Char  |-> Hi)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition test_rvv_safety_wit_14 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (Hi: Z) (Lo: Z) (OZ: Z) (Scale: fp32) (BZ: Z) (AZ: Z) (M: RDMap) (PreH1 : (output_pre = 0)) (PreH2 : (input_b_pre <> 0)) (PreH3 : (input_a_pre <> 0)) (PreH4 : ((batch_pre % ( sizeof(CHAR) ) ) = 0)) (PreH5 : (batch_pre <> 0)) (PreH6 : (0 < batch_pre)) (PreH7 : (batch_pre <= UINT64_MAX)) (PreH8 : (input_a_pre <> 0)) (PreH9 : (input_b_pre <> 0)) (PreH10 : (output_pre <> 0)) (PreH11 : (params_pre <> 0)) (PreH12 : ((-128) <= AZ)) (PreH13 : (AZ <= 127)) (PreH14 : ((-128) <= BZ)) (PreH15 : (BZ <= 127)) (PreH16 : ((-32768) <= OZ)) (PreH17 : (OZ <= 32767)) (PreH18 : ((-128) <= Lo)) (PreH19 : (Lo <= 127)) (PreH20 : ((-128) <= Hi)) (PreH21 : (Hi <= 127)) (PreH22 : (qm_inputs M input_a_pre input_b_pre batch_pre )) (PreH23 : (sizeof(CHAR) = 1)) (PreH24 : (0 <= batch_pre)) (PreH25 : (batch_pre <= batch_pre)) (PreH26 : (input_a_pre = (input_a_pre + ((batch_pre - batch_pre ) * sizeof(CHAR))))) (PreH27 : (input_b_pre = (input_b_pre + ((batch_pre - batch_pre ) * sizeof(CHAR))))) (PreH28 : (output_pre = (output_pre + ((batch_pre - batch_pre ) * sizeof(CHAR))))) (PreH29 : ((batch_pre % ( sizeof(CHAR) ) ) = 0)) ,
  ((( &( "batch" ) )) # UInt64  |-> batch_pre)
  **  ((( &( "input_a" ) )) # Ptr  |-> input_a_pre)
  **  ((( &( "input_b" ) )) # Ptr  |-> input_b_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (rd_mem M )
  **  (CharArray.full output_pre (batch_pre - batch_pre ) (qm_values ((batch_pre - batch_pre )) (M) (input_a_pre) (input_b_pre) (AZ) (BZ) (Scale) (OZ) (Lo) (Hi)) )
  **  (CharArray.undef_full output_pre batch_pre )
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "a_zero_point")) # Char  |-> AZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "b_zero_point")) # Char  |-> BZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "scale")) # Float  |-> Scale)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_zero_point")) # Short  |-> OZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_min")) # Char  |-> Lo)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_max")) # Char  |-> Hi)
|--
  “ False ”
.

Definition test_rvv_safety_wit_15 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (Hi: Z) (Lo: Z) (OZ: Z) (Scale: fp32) (BZ: Z) (AZ: Z) (M: RDMap) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (PreH1 : (0 < batch_pre)) (PreH2 : (batch_pre <= UINT64_MAX)) (PreH3 : (input_a_pre <> 0)) (PreH4 : (input_b_pre <> 0)) (PreH5 : (output_pre <> 0)) (PreH6 : (params_pre <> 0)) (PreH7 : ((-128) <= AZ)) (PreH8 : (AZ <= 127)) (PreH9 : ((-128) <= BZ)) (PreH10 : (BZ <= 127)) (PreH11 : ((-32768) <= OZ)) (PreH12 : (OZ <= 32767)) (PreH13 : ((-128) <= Lo)) (PreH14 : (Lo <= 127)) (PreH15 : ((-128) <= Hi)) (PreH16 : (Hi <= 127)) (PreH17 : (qm_inputs M input_a_pre input_b_pre batch_pre )) (PreH18 : (sizeof(CHAR) = 1)) (PreH19 : (0 <= batch)) (PreH20 : (batch <= batch_pre)) (PreH21 : (input_a = (input_a_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH22 : (input_b = (input_b_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH23 : (output = (output_pre + ((batch_pre - batch ) * sizeof(CHAR))))) ,
  ((( &( "batch" ) )) # UInt64  |-> batch)
  **  ((( &( "input_a" ) )) # Ptr  |-> input_a)
  **  ((( &( "input_b" ) )) # Ptr  |-> input_b)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (rd_mem M )
  **  (CharArray.full output_pre (batch_pre - batch ) (qm_values ((batch_pre - batch )) (M) (input_a_pre) (input_b_pre) (AZ) (BZ) (Scale) (OZ) (Lo) (Hi)) )
  **  (CharArray.undef_full output batch )
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "a_zero_point")) # Char  |-> AZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "b_zero_point")) # Char  |-> BZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "scale")) # Float  |-> Scale)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_zero_point")) # Short  |-> OZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_min")) # Char  |-> Lo)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_max")) # Char  |-> Hi)
  **  ((( &( "a_zero_point" ) )) # Char  |-> AZ)
  **  ((( &( "b_zero_point" ) )) # Char  |-> BZ)
  **  ((( &( "scale" ) )) # Float  |-> Scale)
  **  ((( &( "output_zero_point" ) )) # Short  |-> OZ)
  **  ((( &( "output_min" ) )) # Char  |-> Lo)
  **  ((( &( "output_max" ) )) # Char  |-> Hi)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition test_rvv_safety_wit_16 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (Hi: Z) (Lo: Z) (OZ: Z) (Scale: fp32) (BZ: Z) (AZ: Z) (M: RDMap) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (PreH1 : (0 < batch_pre)) (PreH2 : (batch_pre <= UINT64_MAX)) (PreH3 : (input_a_pre <> 0)) (PreH4 : (input_b_pre <> 0)) (PreH5 : (output_pre <> 0)) (PreH6 : (params_pre <> 0)) (PreH7 : ((-128) <= AZ)) (PreH8 : (AZ <= 127)) (PreH9 : ((-128) <= BZ)) (PreH10 : (BZ <= 127)) (PreH11 : ((-32768) <= OZ)) (PreH12 : (OZ <= 32767)) (PreH13 : ((-128) <= Lo)) (PreH14 : (Lo <= 127)) (PreH15 : ((-128) <= Hi)) (PreH16 : (Hi <= 127)) (PreH17 : (qm_inputs M input_a_pre input_b_pre batch_pre )) (PreH18 : (sizeof(CHAR) = 1)) (PreH19 : (0 <= batch)) (PreH20 : (batch <= batch_pre)) (PreH21 : (input_a = (input_a_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH22 : (input_b = (input_b_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH23 : (batch = 0)) ,
  ((( &( "batch" ) )) # UInt64  |-> batch)
  **  ((( &( "input_a" ) )) # Ptr  |-> input_a)
  **  ((( &( "input_b" ) )) # Ptr  |-> input_b)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (rd_mem M )
  **  (CharArray.full output_pre (batch_pre - batch ) (qm_values ((batch_pre - batch )) (M) (input_a_pre) (input_b_pre) (AZ) (BZ) (Scale) (OZ) (Lo) (Hi)) )
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  (CharArray.undef_full output batch )
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "a_zero_point")) # Char  |-> AZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "b_zero_point")) # Char  |-> BZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "scale")) # Float  |-> Scale)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_zero_point")) # Short  |-> OZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_min")) # Char  |-> Lo)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_max")) # Char  |-> Hi)
  **  ((( &( "a_zero_point" ) )) # Char  |-> AZ)
  **  ((( &( "b_zero_point" ) )) # Char  |-> BZ)
  **  ((( &( "scale" ) )) # Float  |-> Scale)
  **  ((( &( "output_zero_point" ) )) # Short  |-> OZ)
  **  ((( &( "output_min" ) )) # Char  |-> Lo)
  **  ((( &( "output_max" ) )) # Char  |-> Hi)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition test_rvv_safety_wit_17 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (Hi: Z) (Lo: Z) (OZ: Z) (Scale: fp32) (BZ: Z) (AZ: Z) (M: RDMap) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (PreH1 : (batch > 0)) (PreH2 : (0 < batch_pre)) (PreH3 : (batch_pre <= UINT64_MAX)) (PreH4 : (input_a_pre <> 0)) (PreH5 : (input_b_pre <> 0)) (PreH6 : (output_pre <> 0)) (PreH7 : (params_pre <> 0)) (PreH8 : ((-128) <= AZ)) (PreH9 : (AZ <= 127)) (PreH10 : ((-128) <= BZ)) (PreH11 : (BZ <= 127)) (PreH12 : ((-32768) <= OZ)) (PreH13 : (OZ <= 32767)) (PreH14 : ((-128) <= Lo)) (PreH15 : (Lo <= 127)) (PreH16 : ((-128) <= Hi)) (PreH17 : (Hi <= 127)) (PreH18 : (qm_inputs M input_a_pre input_b_pre batch_pre )) (PreH19 : (sizeof(CHAR) = 1)) (PreH20 : (0 <= batch)) (PreH21 : (batch <= batch_pre)) (PreH22 : (input_a = (input_a_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH23 : (input_b = (input_b_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH24 : (batch = 0)) ,
  ((( &( "batch" ) )) # UInt64  |-> batch)
  **  ((( &( "input_a" ) )) # Ptr  |-> input_a)
  **  ((( &( "input_b" ) )) # Ptr  |-> input_b)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (rd_mem M )
  **  (CharArray.full output_pre (batch_pre - batch ) (qm_values ((batch_pre - batch )) (M) (input_a_pre) (input_b_pre) (AZ) (BZ) (Scale) (OZ) (Lo) (Hi)) )
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  (CharArray.undef_full output batch )
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "a_zero_point")) # Char  |-> AZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "b_zero_point")) # Char  |-> BZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "scale")) # Float  |-> Scale)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_zero_point")) # Short  |-> OZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_min")) # Char  |-> Lo)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_max")) # Char  |-> Hi)
  **  ((( &( "a_zero_point" ) )) # Char  |-> AZ)
  **  ((( &( "b_zero_point" ) )) # Char  |-> BZ)
  **  ((( &( "scale" ) )) # Float  |-> Scale)
  **  ((( &( "output_zero_point" ) )) # Short  |-> OZ)
  **  ((( &( "output_min" ) )) # Char  |-> Lo)
  **  ((( &( "output_max" ) )) # Char  |-> Hi)
|--
  “ False ”
.

Definition test_rvv_entail_wit_1 := 
(
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (Hi: Z) (Lo: Z) (OZ: Z) (Scale: fp32) (BZ: Z) (AZ: Z) (M: RDMap) (PreH1 : (0 < batch_pre)) (PreH2 : (batch_pre <= UINT64_MAX)) (PreH3 : (input_a_pre <> 0)) (PreH4 : (input_b_pre <> 0)) (PreH5 : (output_pre <> 0)) (PreH6 : (params_pre <> 0)) (PreH7 : ((-128) <= AZ)) (PreH8 : (AZ <= 127)) (PreH9 : ((-128) <= BZ)) (PreH10 : (BZ <= 127)) (PreH11 : ((-32768) <= OZ)) (PreH12 : (OZ <= 32767)) (PreH13 : ((-128) <= Lo)) (PreH14 : (Lo <= 127)) (PreH15 : ((-128) <= Hi)) (PreH16 : (Hi <= 127)) (PreH17 : (qm_inputs M input_a_pre input_b_pre batch_pre )) ,
  (rd_mem M )
  **  (CharArray.undef_full output_pre batch_pre )
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "a_zero_point")) # Char  |-> AZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "b_zero_point")) # Char  |-> BZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "scale")) # Float  |-> Scale)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_zero_point")) # Short  |-> OZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_min")) # Char  |-> Lo)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_max")) # Char  |-> Hi)
|--
  “ (0 < batch_pre) ” 
  &&  “ (batch_pre <= UINT64_MAX) ” 
  &&  “ (input_a_pre <> 0) ” 
  &&  “ (input_b_pre <> 0) ” 
  &&  “ (output_pre <> 0) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ ((-128) <= AZ) ” 
  &&  “ (AZ <= 127) ” 
  &&  “ ((-128) <= BZ) ” 
  &&  “ (BZ <= 127) ” 
  &&  “ ((-32768) <= OZ) ” 
  &&  “ (OZ <= 32767) ” 
  &&  “ ((-128) <= Lo) ” 
  &&  “ (Lo <= 127) ” 
  &&  “ ((-128) <= Hi) ” 
  &&  “ (Hi <= 127) ” 
  &&  “ (qm_inputs M input_a_pre input_b_pre batch_pre ) ” 
  &&  “ (sizeof(CHAR) = 1) ” 
  &&  “ (0 <= batch_pre) ” 
  &&  “ (batch_pre <= batch_pre) ” 
  &&  “ (input_a_pre = (input_a_pre + ((batch_pre - batch_pre ) * sizeof(CHAR)))) ” 
  &&  “ (input_b_pre = (input_b_pre + ((batch_pre - batch_pre ) * sizeof(CHAR)))) ” 
  &&  “ (output_pre = (output_pre + ((batch_pre - batch_pre ) * sizeof(CHAR)))) ” 
  &&  “ ((batch_pre % ( sizeof(CHAR) ) ) = 0) ”
  &&  (rd_mem M )
  **  (CharArray.full output_pre (batch_pre - batch_pre ) (qm_values ((batch_pre - batch_pre )) (M) (input_a_pre) (input_b_pre) (AZ) (BZ) (Scale) (OZ) (Lo) (Hi)) )
  **  (CharArray.undef_full output_pre batch_pre )
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "a_zero_point")) # Char  |-> AZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "b_zero_point")) # Char  |-> BZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "scale")) # Float  |-> Scale)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_zero_point")) # Short  |-> OZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_min")) # Char  |-> Lo)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_max")) # Char  |-> Hi)
) \/
(
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (Hi: Z) (Lo: Z) (OZ: Z) (Scale: fp32) (BZ: Z) (AZ: Z) (M: RDMap) (PreH1 : (0 < batch_pre)) (PreH2 : (batch_pre <= UINT64_MAX)) (PreH3 : (input_a_pre <> 0)) (PreH4 : (input_b_pre <> 0)) (PreH5 : (output_pre <> 0)) (PreH6 : (params_pre <> 0)) (PreH7 : ((-128) <= AZ)) (PreH8 : (AZ <= 127)) (PreH9 : ((-128) <= BZ)) (PreH10 : (BZ <= 127)) (PreH11 : ((-32768) <= OZ)) (PreH12 : (OZ <= 32767)) (PreH13 : ((-128) <= Lo)) (PreH14 : (Lo <= 127)) (PreH15 : ((-128) <= Hi)) (PreH16 : (Hi <= 127)) (PreH17 : (qm_inputs M input_a_pre input_b_pre batch_pre )) ,
  (CharArray.undef_full (output_pre + (batch_pre * sizeof(CHAR))) (batch_pre - batch_pre ) )
|--
  “ ((batch_pre % ( sizeof(CHAR) ) ) = 0) ” 
  &&  “ ((qm_values ((batch_pre - batch_pre )) (M) (input_a_pre) (input_b_pre) (AZ) (BZ) (Scale) (OZ) (Lo) (Hi)) = (@nil Z)) ”
  &&  emp
).

Definition test_rvv_entail_wit_1_split_goal_1 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (Hi: Z) (Lo: Z) (OZ: Z) (BZ: Z) (AZ: Z) (M: RDMap) (PreH1 : (0 < batch_pre)) (PreH2 : (batch_pre <= UINT64_MAX)) (PreH3 : (input_a_pre <> 0)) (PreH4 : (input_b_pre <> 0)) (PreH5 : (output_pre <> 0)) (PreH6 : (params_pre <> 0)) (PreH7 : ((-128) <= AZ)) (PreH8 : (AZ <= 127)) (PreH9 : ((-128) <= BZ)) (PreH10 : (BZ <= 127)) (PreH11 : ((-32768) <= OZ)) (PreH12 : (OZ <= 32767)) (PreH13 : ((-128) <= Lo)) (PreH14 : (Lo <= 127)) (PreH15 : ((-128) <= Hi)) (PreH16 : (Hi <= 127)) (PreH17 : (qm_inputs M input_a_pre input_b_pre batch_pre )) ,
  (CharArray.undef_full (output_pre + (batch_pre * sizeof(CHAR))) (batch_pre - batch_pre ) )
|--
  “ ((batch_pre % ( sizeof(CHAR) ) ) = 0) ”
.

Definition test_rvv_entail_wit_1_split_goal_2 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (Hi: Z) (Lo: Z) (OZ: Z) (Scale: fp32) (BZ: Z) (AZ: Z) (M: RDMap) (PreH1 : (0 < batch_pre)) (PreH2 : (batch_pre <= UINT64_MAX)) (PreH3 : (input_a_pre <> 0)) (PreH4 : (input_b_pre <> 0)) (PreH5 : (output_pre <> 0)) (PreH6 : (params_pre <> 0)) (PreH7 : ((-128) <= AZ)) (PreH8 : (AZ <= 127)) (PreH9 : ((-128) <= BZ)) (PreH10 : (BZ <= 127)) (PreH11 : ((-32768) <= OZ)) (PreH12 : (OZ <= 32767)) (PreH13 : ((-128) <= Lo)) (PreH14 : (Lo <= 127)) (PreH15 : ((-128) <= Hi)) (PreH16 : (Hi <= 127)) (PreH17 : (qm_inputs M input_a_pre input_b_pre batch_pre )) ,
  (CharArray.undef_full (output_pre + (batch_pre * sizeof(CHAR))) (batch_pre - batch_pre ) )
|--
  “ ((qm_values ((batch_pre - batch_pre )) (M) (input_a_pre) (input_b_pre) (AZ) (BZ) (Scale) (OZ) (Lo) (Hi)) = (@nil Z)) ”
.

Definition test_rvv_entail_wit_1_split_goal_spatial := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (Hi: Z) (Lo: Z) (OZ: Z) (BZ: Z) (AZ: Z) (M: RDMap) (PreH1 : (0 < batch_pre)) (PreH2 : (batch_pre <= UINT64_MAX)) (PreH3 : (input_a_pre <> 0)) (PreH4 : (input_b_pre <> 0)) (PreH5 : (output_pre <> 0)) (PreH6 : (params_pre <> 0)) (PreH7 : ((-128) <= AZ)) (PreH8 : (AZ <= 127)) (PreH9 : ((-128) <= BZ)) (PreH10 : (BZ <= 127)) (PreH11 : ((-32768) <= OZ)) (PreH12 : (OZ <= 32767)) (PreH13 : ((-128) <= Lo)) (PreH14 : (Lo <= 127)) (PreH15 : ((-128) <= Hi)) (PreH16 : (Hi <= 127)) (PreH17 : (qm_inputs M input_a_pre input_b_pre batch_pre )) ,
  (CharArray.undef_full (output_pre + (batch_pre * sizeof(CHAR))) (batch_pre - batch_pre ) )
|--
  TT && emp 
.

Definition test_rvv_entail_wit_2 := 
(
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (Hi: Z) (Lo: Z) (OZ: Z) (Scale: fp32) (BZ: Z) (AZ: Z) (M: RDMap) (PreH1 : (output_pre <> 0)) (PreH2 : (input_b_pre <> 0)) (PreH3 : (input_a_pre <> 0)) (PreH4 : ((batch_pre % ( sizeof(CHAR) ) ) = 0)) (PreH5 : (batch_pre <> 0)) (PreH6 : (0 < batch_pre)) (PreH7 : (batch_pre <= UINT64_MAX)) (PreH8 : (input_a_pre <> 0)) (PreH9 : (input_b_pre <> 0)) (PreH10 : (output_pre <> 0)) (PreH11 : (params_pre <> 0)) (PreH12 : ((-128) <= AZ)) (PreH13 : (AZ <= 127)) (PreH14 : ((-128) <= BZ)) (PreH15 : (BZ <= 127)) (PreH16 : ((-32768) <= OZ)) (PreH17 : (OZ <= 32767)) (PreH18 : ((-128) <= Lo)) (PreH19 : (Lo <= 127)) (PreH20 : ((-128) <= Hi)) (PreH21 : (Hi <= 127)) (PreH22 : (qm_inputs M input_a_pre input_b_pre batch_pre )) (PreH23 : (sizeof(CHAR) = 1)) (PreH24 : (0 <= batch_pre)) (PreH25 : (batch_pre <= batch_pre)) (PreH26 : (input_a_pre = (input_a_pre + ((batch_pre - batch_pre ) * sizeof(CHAR))))) (PreH27 : (input_b_pre = (input_b_pre + ((batch_pre - batch_pre ) * sizeof(CHAR))))) (PreH28 : (output_pre = (output_pre + ((batch_pre - batch_pre ) * sizeof(CHAR))))) (PreH29 : ((batch_pre % ( sizeof(CHAR) ) ) = 0)) ,
  (rd_mem M )
  **  (CharArray.full output_pre (batch_pre - batch_pre ) (qm_values ((batch_pre - batch_pre )) (M) (input_a_pre) (input_b_pre) (AZ) (BZ) (Scale) (OZ) (Lo) (Hi)) )
  **  (CharArray.undef_full output_pre batch_pre )
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "a_zero_point")) # Char  |-> AZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "b_zero_point")) # Char  |-> BZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "scale")) # Float  |-> Scale)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_zero_point")) # Short  |-> OZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_min")) # Char  |-> Lo)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_max")) # Char  |-> Hi)
|--
  “ (0 < batch_pre) ” 
  &&  “ (batch_pre <= UINT64_MAX) ” 
  &&  “ (input_a_pre <> 0) ” 
  &&  “ (input_b_pre <> 0) ” 
  &&  “ (output_pre <> 0) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ ((-128) <= AZ) ” 
  &&  “ (AZ <= 127) ” 
  &&  “ ((-128) <= BZ) ” 
  &&  “ (BZ <= 127) ” 
  &&  “ ((-32768) <= OZ) ” 
  &&  “ (OZ <= 32767) ” 
  &&  “ ((-128) <= Lo) ” 
  &&  “ (Lo <= 127) ” 
  &&  “ ((-128) <= Hi) ” 
  &&  “ (Hi <= 127) ” 
  &&  “ (qm_inputs M input_a_pre input_b_pre batch_pre ) ” 
  &&  “ (sizeof(CHAR) = 1) ” 
  &&  “ (0 <= batch_pre) ” 
  &&  “ (batch_pre <= batch_pre) ” 
  &&  “ (input_a_pre = (input_a_pre + ((batch_pre - batch_pre ) * sizeof(CHAR)))) ” 
  &&  “ (input_b_pre = (input_b_pre + ((batch_pre - batch_pre ) * sizeof(CHAR)))) ” 
  &&  “ (output_pre = (output_pre + ((batch_pre - batch_pre ) * sizeof(CHAR)))) ”
  &&  (rd_mem M )
  **  (CharArray.full output_pre (batch_pre - batch_pre ) (qm_values ((batch_pre - batch_pre )) (M) (input_a_pre) (input_b_pre) (AZ) (BZ) (Scale) (OZ) (Lo) (Hi)) )
  **  (CharArray.undef_full output_pre batch_pre )
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "a_zero_point")) # Char  |-> AZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "b_zero_point")) # Char  |-> BZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "scale")) # Float  |-> Scale)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_zero_point")) # Short  |-> OZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_min")) # Char  |-> Lo)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_max")) # Char  |-> Hi)
) \/
(
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (Hi: Z) (Lo: Z) (OZ: Z) (BZ: Z) (AZ: Z) (M: RDMap) (PreH1 : (output_pre <> 0)) (PreH2 : (input_b_pre <> 0)) (PreH3 : (input_a_pre <> 0)) (PreH4 : ((batch_pre % ( sizeof(CHAR) ) ) = 0)) (PreH5 : (batch_pre <> 0)) (PreH6 : (0 < batch_pre)) (PreH7 : (batch_pre <= UINT64_MAX)) (PreH8 : (input_a_pre <> 0)) (PreH9 : (input_b_pre <> 0)) (PreH10 : (output_pre <> 0)) (PreH11 : (params_pre <> 0)) (PreH12 : ((-128) <= AZ)) (PreH13 : (AZ <= 127)) (PreH14 : ((-128) <= BZ)) (PreH15 : (BZ <= 127)) (PreH16 : ((-32768) <= OZ)) (PreH17 : (OZ <= 32767)) (PreH18 : ((-128) <= Lo)) (PreH19 : (Lo <= 127)) (PreH20 : ((-128) <= Hi)) (PreH21 : (Hi <= 127)) (PreH22 : (qm_inputs M input_a_pre input_b_pre batch_pre )) (PreH23 : (sizeof(CHAR) = 1)) (PreH24 : (0 <= batch_pre)) (PreH25 : (batch_pre <= batch_pre)) (PreH26 : (input_a_pre = (input_a_pre + ((batch_pre - batch_pre ) * sizeof(CHAR))))) (PreH27 : (input_b_pre = (input_b_pre + ((batch_pre - batch_pre ) * sizeof(CHAR))))) (PreH28 : (output_pre = (output_pre + ((batch_pre - batch_pre ) * sizeof(CHAR))))) (PreH29 : ((batch_pre % ( sizeof(CHAR) ) ) = 0)) ,
  (CharArray.undef_full (output_pre + (batch_pre * sizeof(CHAR))) (batch_pre - batch_pre ) )
|--
  TT && emp 
).

Definition test_rvv_entail_wit_2_split_goal_spatial := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (Hi: Z) (Lo: Z) (OZ: Z) (BZ: Z) (AZ: Z) (M: RDMap) (PreH1 : (output_pre <> 0)) (PreH2 : (input_b_pre <> 0)) (PreH3 : (input_a_pre <> 0)) (PreH4 : ((batch_pre % ( sizeof(CHAR) ) ) = 0)) (PreH5 : (batch_pre <> 0)) (PreH6 : (0 < batch_pre)) (PreH7 : (batch_pre <= UINT64_MAX)) (PreH8 : (input_a_pre <> 0)) (PreH9 : (input_b_pre <> 0)) (PreH10 : (output_pre <> 0)) (PreH11 : (params_pre <> 0)) (PreH12 : ((-128) <= AZ)) (PreH13 : (AZ <= 127)) (PreH14 : ((-128) <= BZ)) (PreH15 : (BZ <= 127)) (PreH16 : ((-32768) <= OZ)) (PreH17 : (OZ <= 32767)) (PreH18 : ((-128) <= Lo)) (PreH19 : (Lo <= 127)) (PreH20 : ((-128) <= Hi)) (PreH21 : (Hi <= 127)) (PreH22 : (qm_inputs M input_a_pre input_b_pre batch_pre )) (PreH23 : (sizeof(CHAR) = 1)) (PreH24 : (0 <= batch_pre)) (PreH25 : (batch_pre <= batch_pre)) (PreH26 : (input_a_pre = (input_a_pre + ((batch_pre - batch_pre ) * sizeof(CHAR))))) (PreH27 : (input_b_pre = (input_b_pre + ((batch_pre - batch_pre ) * sizeof(CHAR))))) (PreH28 : (output_pre = (output_pre + ((batch_pre - batch_pre ) * sizeof(CHAR))))) (PreH29 : ((batch_pre % ( sizeof(CHAR) ) ) = 0)) ,
  (CharArray.undef_full (output_pre + (batch_pre * sizeof(CHAR))) (batch_pre - batch_pre ) )
|--
  TT && emp 
.

Definition test_rvv_entail_wit_3 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (Hi: Z) (Lo: Z) (OZ: Z) (Scale: fp32) (BZ: Z) (AZ: Z) (M: RDMap) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (retval: Z) (R: Recordvint8m2_t) (R_2: Recordvint8m2_t) (R_3: Recordvint8m2_t) (PreH1 : (qm_record_compute_match retval R R_2 R_3 AZ BZ Scale OZ Lo Hi )) (PreH2 : (qm_record_load_match M input_b retval R_2 )) (PreH3 : (qm_record_load_match M input_a retval R )) (PreH4 : (qm_vl_allowed batch retval )) (PreH5 : (1 <= retval)) (PreH6 : (retval <= 32)) (PreH7 : (retval <= batch)) (PreH8 : (batch > 0)) (PreH9 : (0 < batch_pre)) (PreH10 : (batch_pre <= UINT64_MAX)) (PreH11 : (input_a_pre <> 0)) (PreH12 : (input_b_pre <> 0)) (PreH13 : (output_pre <> 0)) (PreH14 : (params_pre <> 0)) (PreH15 : ((-128) <= AZ)) (PreH16 : (AZ <= 127)) (PreH17 : ((-128) <= BZ)) (PreH18 : (BZ <= 127)) (PreH19 : ((-32768) <= OZ)) (PreH20 : (OZ <= 32767)) (PreH21 : ((-128) <= Lo)) (PreH22 : (Lo <= 127)) (PreH23 : ((-128) <= Hi)) (PreH24 : (Hi <= 127)) (PreH25 : (qm_inputs M input_a_pre input_b_pre batch_pre )) (PreH26 : (sizeof(CHAR) = 1)) (PreH27 : (0 <= batch)) (PreH28 : (batch <= batch_pre)) (PreH29 : (input_a = (input_a_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH30 : (input_b = (input_b_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH31 : (output = (output_pre + ((batch_pre - batch ) * sizeof(CHAR))))) ,
  (CharArray.full output retval (qm_take32 (retval) ((qm_list32 ((R_3.(vint8m2_t_s0) )) ((R_3.(vint8m2_t_s1) )) ((R_3.(vint8m2_t_s2) )) ((R_3.(vint8m2_t_s3) )) ((R_3.(vint8m2_t_s4) )) ((R_3.(vint8m2_t_s5) )) ((R_3.(vint8m2_t_s6) )) ((R_3.(vint8m2_t_s7) )) ((R_3.(vint8m2_t_s8) )) ((R_3.(vint8m2_t_s9) )) ((R_3.(vint8m2_t_s10) )) ((R_3.(vint8m2_t_s11) )) ((R_3.(vint8m2_t_s12) )) ((R_3.(vint8m2_t_s13) )) ((R_3.(vint8m2_t_s14) )) ((R_3.(vint8m2_t_s15) )) ((R_3.(vint8m2_t_s16) )) ((R_3.(vint8m2_t_s17) )) ((R_3.(vint8m2_t_s18) )) ((R_3.(vint8m2_t_s19) )) ((R_3.(vint8m2_t_s20) )) ((R_3.(vint8m2_t_s21) )) ((R_3.(vint8m2_t_s22) )) ((R_3.(vint8m2_t_s23) )) ((R_3.(vint8m2_t_s24) )) ((R_3.(vint8m2_t_s25) )) ((R_3.(vint8m2_t_s26) )) ((R_3.(vint8m2_t_s27) )) ((R_3.(vint8m2_t_s28) )) ((R_3.(vint8m2_t_s29) )) ((R_3.(vint8m2_t_s30) )) ((R_3.(vint8m2_t_s31) ))))) )
  **  (CharArray.undef_full (output + (retval * sizeof(CHAR))) (batch - retval ) )
  **  (rd_mem M )
  **  (CharArray.full output_pre (batch_pre - batch ) (qm_values ((batch_pre - batch )) (M) (input_a_pre) (input_b_pre) (AZ) (BZ) (Scale) (OZ) (Lo) (Hi)) )
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "a_zero_point")) # Char  |-> AZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "b_zero_point")) # Char  |-> BZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "scale")) # Float  |-> Scale)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_zero_point")) # Short  |-> OZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_min")) # Char  |-> Lo)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_max")) # Char  |-> Hi)
|--
  (“ (0 < batch_pre) ” 
  &&  “ (batch_pre <= UINT64_MAX) ” 
  &&  “ (input_a_pre <> 0) ” 
  &&  “ (input_b_pre <> 0) ” 
  &&  “ (output_pre <> 0) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ ((-128) <= AZ) ” 
  &&  “ (AZ <= 127) ” 
  &&  “ ((-128) <= BZ) ” 
  &&  “ (BZ <= 127) ” 
  &&  “ ((-32768) <= OZ) ” 
  &&  “ (OZ <= 32767) ” 
  &&  “ ((-128) <= Lo) ” 
  &&  “ (Lo <= 127) ” 
  &&  “ ((-128) <= Hi) ” 
  &&  “ (Hi <= 127) ” 
  &&  “ (qm_inputs M input_a_pre input_b_pre batch_pre ) ” 
  &&  “ (sizeof(CHAR) = 1) ” 
  &&  “ (0 <= (batch - retval )) ” 
  &&  “ ((batch - retval ) <= batch_pre) ” 
  &&  “ ((input_a + (retval * sizeof(CHAR))) = (input_a_pre + ((batch_pre - (batch - retval ) ) * sizeof(CHAR)))) ” 
  &&  “ ((input_b + (retval * sizeof(CHAR))) = (input_b_pre + ((batch_pre - (batch - retval ) ) * sizeof(CHAR)))) ” 
  &&  “ ((output + (retval * sizeof(CHAR))) = (output_pre + ((batch_pre - (batch - retval ) ) * sizeof(CHAR)))) ”
  &&  (rd_mem M )
  **  (CharArray.full output_pre (batch_pre - (batch - retval ) ) (qm_values ((batch_pre - (batch - retval ) )) (M) (input_a_pre) (input_b_pre) (AZ) (BZ) (Scale) (OZ) (Lo) (Hi)) )
  **  (CharArray.undef_full (output + (retval * sizeof(CHAR))) (batch - retval ) )
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "a_zero_point")) # Char  |-> AZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "b_zero_point")) # Char  |-> BZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "scale")) # Float  |-> Scale)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_zero_point")) # Short  |-> OZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_min")) # Char  |-> Lo)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_max")) # Char  |-> Hi))
  ||
  (“ (0 < batch_pre) ” 
  &&  “ (batch_pre <= UINT64_MAX) ” 
  &&  “ (input_a_pre <> 0) ” 
  &&  “ (input_b_pre <> 0) ” 
  &&  “ (output_pre <> 0) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ ((-128) <= AZ) ” 
  &&  “ (AZ <= 127) ” 
  &&  “ ((-128) <= BZ) ” 
  &&  “ (BZ <= 127) ” 
  &&  “ ((-32768) <= OZ) ” 
  &&  “ (OZ <= 32767) ” 
  &&  “ ((-128) <= Lo) ” 
  &&  “ (Lo <= 127) ” 
  &&  “ ((-128) <= Hi) ” 
  &&  “ (Hi <= 127) ” 
  &&  “ (qm_inputs M input_a_pre input_b_pre batch_pre ) ” 
  &&  “ (sizeof(CHAR) = 1) ” 
  &&  “ (0 <= (batch - retval )) ” 
  &&  “ ((batch - retval ) <= batch_pre) ” 
  &&  “ ((input_a + (retval * sizeof(CHAR))) = (input_a_pre + ((batch_pre - (batch - retval ) ) * sizeof(CHAR)))) ” 
  &&  “ ((input_b + (retval * sizeof(CHAR))) = (input_b_pre + ((batch_pre - (batch - retval ) ) * sizeof(CHAR)))) ” 
  &&  “ ((batch - retval ) = 0) ”
  &&  (rd_mem M )
  **  (CharArray.full output_pre (batch_pre - (batch - retval ) ) (qm_values ((batch_pre - (batch - retval ) )) (M) (input_a_pre) (input_b_pre) (AZ) (BZ) (Scale) (OZ) (Lo) (Hi)) )
  **  (CharArray.undef_full (output + (retval * sizeof(CHAR))) (batch - retval ) )
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "a_zero_point")) # Char  |-> AZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "b_zero_point")) # Char  |-> BZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "scale")) # Float  |-> Scale)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_zero_point")) # Short  |-> OZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_min")) # Char  |-> Lo)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_max")) # Char  |-> Hi))
.

Definition test_rvv_return_wit_1 := 
(
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (Hi: Z) (Lo: Z) (OZ: Z) (Scale: fp32) (BZ: Z) (AZ: Z) (M: RDMap) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (PreH1 : (batch <= 0)) (PreH2 : (0 < batch_pre)) (PreH3 : (batch_pre <= UINT64_MAX)) (PreH4 : (input_a_pre <> 0)) (PreH5 : (input_b_pre <> 0)) (PreH6 : (output_pre <> 0)) (PreH7 : (params_pre <> 0)) (PreH8 : ((-128) <= AZ)) (PreH9 : (AZ <= 127)) (PreH10 : ((-128) <= BZ)) (PreH11 : (BZ <= 127)) (PreH12 : ((-32768) <= OZ)) (PreH13 : (OZ <= 32767)) (PreH14 : ((-128) <= Lo)) (PreH15 : (Lo <= 127)) (PreH16 : ((-128) <= Hi)) (PreH17 : (Hi <= 127)) (PreH18 : (qm_inputs M input_a_pre input_b_pre batch_pre )) (PreH19 : (sizeof(CHAR) = 1)) (PreH20 : (0 <= batch)) (PreH21 : (batch <= batch_pre)) (PreH22 : (input_a = (input_a_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH23 : (input_b = (input_b_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH24 : (output = (output_pre + ((batch_pre - batch ) * sizeof(CHAR))))) ,
  (rd_mem M )
  **  (CharArray.full output_pre (batch_pre - batch ) (qm_values ((batch_pre - batch )) (M) (input_a_pre) (input_b_pre) (AZ) (BZ) (Scale) (OZ) (Lo) (Hi)) )
  **  (CharArray.undef_full output batch )
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "a_zero_point")) # Char  |-> AZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "b_zero_point")) # Char  |-> BZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "scale")) # Float  |-> Scale)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_zero_point")) # Short  |-> OZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_min")) # Char  |-> Lo)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_max")) # Char  |-> Hi)
|--
  (rd_mem M )
  **  (CharArray.full output_pre batch_pre (qm_values (batch_pre) (M) (input_a_pre) (input_b_pre) (AZ) (BZ) (Scale) (OZ) (Lo) (Hi)) )
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "a_zero_point")) # Char  |-> AZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "b_zero_point")) # Char  |-> BZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "scale")) # Float  |-> Scale)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_zero_point")) # Short  |-> OZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_min")) # Char  |-> Lo)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_max")) # Char  |-> Hi)
) \/
(
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (Hi: Z) (Lo: Z) (OZ: Z) (Scale: fp32) (BZ: Z) (AZ: Z) (M: RDMap) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (PreH1 : (batch <= 0)) (PreH2 : (0 < batch_pre)) (PreH3 : (batch_pre <= UINT64_MAX)) (PreH4 : (input_a_pre <> 0)) (PreH5 : (input_b_pre <> 0)) (PreH6 : (output_pre <> 0)) (PreH7 : (params_pre <> 0)) (PreH8 : ((-128) <= AZ)) (PreH9 : (AZ <= 127)) (PreH10 : ((-128) <= BZ)) (PreH11 : (BZ <= 127)) (PreH12 : ((-32768) <= OZ)) (PreH13 : (OZ <= 32767)) (PreH14 : ((-128) <= Lo)) (PreH15 : (Lo <= 127)) (PreH16 : ((-128) <= Hi)) (PreH17 : (Hi <= 127)) (PreH18 : (qm_inputs M input_a_pre input_b_pre batch_pre )) (PreH19 : (sizeof(CHAR) = 1)) (PreH20 : (0 <= batch)) (PreH21 : (batch <= batch_pre)) (PreH22 : (input_a = (input_a_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH23 : (input_b = (input_b_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH24 : (output = (output_pre + ((batch_pre - batch ) * sizeof(CHAR))))) ,
  (CharArray.undef_full output batch )
|--
  “ ((qm_values ((batch_pre - batch )) (M) (input_a_pre) (input_b_pre) (AZ) (BZ) (Scale) (OZ) (Lo) (Hi)) = (qm_values (batch_pre) (M) (input_a_pre) (input_b_pre) (AZ) (BZ) (Scale) (OZ) (Lo) (Hi))) ”
  &&  emp
).

Definition test_rvv_return_wit_1_split_goal_1 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (Hi: Z) (Lo: Z) (OZ: Z) (Scale: fp32) (BZ: Z) (AZ: Z) (M: RDMap) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (PreH1 : (batch <= 0)) (PreH2 : (0 < batch_pre)) (PreH3 : (batch_pre <= UINT64_MAX)) (PreH4 : (input_a_pre <> 0)) (PreH5 : (input_b_pre <> 0)) (PreH6 : (output_pre <> 0)) (PreH7 : (params_pre <> 0)) (PreH8 : ((-128) <= AZ)) (PreH9 : (AZ <= 127)) (PreH10 : ((-128) <= BZ)) (PreH11 : (BZ <= 127)) (PreH12 : ((-32768) <= OZ)) (PreH13 : (OZ <= 32767)) (PreH14 : ((-128) <= Lo)) (PreH15 : (Lo <= 127)) (PreH16 : ((-128) <= Hi)) (PreH17 : (Hi <= 127)) (PreH18 : (qm_inputs M input_a_pre input_b_pre batch_pre )) (PreH19 : (sizeof(CHAR) = 1)) (PreH20 : (0 <= batch)) (PreH21 : (batch <= batch_pre)) (PreH22 : (input_a = (input_a_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH23 : (input_b = (input_b_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH24 : (output = (output_pre + ((batch_pre - batch ) * sizeof(CHAR))))) ,
  (CharArray.undef_full output batch )
|--
  “ ((qm_values ((batch_pre - batch )) (M) (input_a_pre) (input_b_pre) (AZ) (BZ) (Scale) (OZ) (Lo) (Hi)) = (qm_values (batch_pre) (M) (input_a_pre) (input_b_pre) (AZ) (BZ) (Scale) (OZ) (Lo) (Hi))) ”
.

Definition test_rvv_return_wit_1_split_goal_spatial := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (Hi: Z) (Lo: Z) (OZ: Z) (BZ: Z) (AZ: Z) (M: RDMap) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (PreH1 : (batch <= 0)) (PreH2 : (0 < batch_pre)) (PreH3 : (batch_pre <= UINT64_MAX)) (PreH4 : (input_a_pre <> 0)) (PreH5 : (input_b_pre <> 0)) (PreH6 : (output_pre <> 0)) (PreH7 : (params_pre <> 0)) (PreH8 : ((-128) <= AZ)) (PreH9 : (AZ <= 127)) (PreH10 : ((-128) <= BZ)) (PreH11 : (BZ <= 127)) (PreH12 : ((-32768) <= OZ)) (PreH13 : (OZ <= 32767)) (PreH14 : ((-128) <= Lo)) (PreH15 : (Lo <= 127)) (PreH16 : ((-128) <= Hi)) (PreH17 : (Hi <= 127)) (PreH18 : (qm_inputs M input_a_pre input_b_pre batch_pre )) (PreH19 : (sizeof(CHAR) = 1)) (PreH20 : (0 <= batch)) (PreH21 : (batch <= batch_pre)) (PreH22 : (input_a = (input_a_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH23 : (input_b = (input_b_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH24 : (output = (output_pre + ((batch_pre - batch ) * sizeof(CHAR))))) ,
  (CharArray.undef_full output batch )
|--
  TT && emp 
.

Definition test_rvv_return_wit_2 := 
(
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (Hi: Z) (Lo: Z) (OZ: Z) (Scale: fp32) (BZ: Z) (AZ: Z) (M: RDMap) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (PreH1 : (batch <= 0)) (PreH2 : (0 < batch_pre)) (PreH3 : (batch_pre <= UINT64_MAX)) (PreH4 : (input_a_pre <> 0)) (PreH5 : (input_b_pre <> 0)) (PreH6 : (output_pre <> 0)) (PreH7 : (params_pre <> 0)) (PreH8 : ((-128) <= AZ)) (PreH9 : (AZ <= 127)) (PreH10 : ((-128) <= BZ)) (PreH11 : (BZ <= 127)) (PreH12 : ((-32768) <= OZ)) (PreH13 : (OZ <= 32767)) (PreH14 : ((-128) <= Lo)) (PreH15 : (Lo <= 127)) (PreH16 : ((-128) <= Hi)) (PreH17 : (Hi <= 127)) (PreH18 : (qm_inputs M input_a_pre input_b_pre batch_pre )) (PreH19 : (sizeof(CHAR) = 1)) (PreH20 : (0 <= batch)) (PreH21 : (batch <= batch_pre)) (PreH22 : (input_a = (input_a_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH23 : (input_b = (input_b_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH24 : (batch = 0)) ,
  (rd_mem M )
  **  (CharArray.full output_pre (batch_pre - batch ) (qm_values ((batch_pre - batch )) (M) (input_a_pre) (input_b_pre) (AZ) (BZ) (Scale) (OZ) (Lo) (Hi)) )
  **  (CharArray.undef_full output batch )
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "a_zero_point")) # Char  |-> AZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "b_zero_point")) # Char  |-> BZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "scale")) # Float  |-> Scale)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_zero_point")) # Short  |-> OZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_min")) # Char  |-> Lo)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_max")) # Char  |-> Hi)
|--
  (rd_mem M )
  **  (CharArray.full output_pre batch_pre (qm_values (batch_pre) (M) (input_a_pre) (input_b_pre) (AZ) (BZ) (Scale) (OZ) (Lo) (Hi)) )
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "a_zero_point")) # Char  |-> AZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "b_zero_point")) # Char  |-> BZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "scale")) # Float  |-> Scale)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_zero_point")) # Short  |-> OZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_min")) # Char  |-> Lo)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_max")) # Char  |-> Hi)
) \/
(
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (Hi: Z) (Lo: Z) (OZ: Z) (Scale: fp32) (BZ: Z) (AZ: Z) (M: RDMap) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (PreH1 : (batch <= 0)) (PreH2 : (0 < batch_pre)) (PreH3 : (batch_pre <= UINT64_MAX)) (PreH4 : (input_a_pre <> 0)) (PreH5 : (input_b_pre <> 0)) (PreH6 : (output_pre <> 0)) (PreH7 : (params_pre <> 0)) (PreH8 : ((-128) <= AZ)) (PreH9 : (AZ <= 127)) (PreH10 : ((-128) <= BZ)) (PreH11 : (BZ <= 127)) (PreH12 : ((-32768) <= OZ)) (PreH13 : (OZ <= 32767)) (PreH14 : ((-128) <= Lo)) (PreH15 : (Lo <= 127)) (PreH16 : ((-128) <= Hi)) (PreH17 : (Hi <= 127)) (PreH18 : (qm_inputs M input_a_pre input_b_pre batch_pre )) (PreH19 : (sizeof(CHAR) = 1)) (PreH20 : (0 <= batch)) (PreH21 : (batch <= batch_pre)) (PreH22 : (input_a = (input_a_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH23 : (input_b = (input_b_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH24 : (batch = 0)) ,
  (CharArray.undef_full output batch )
|--
  “ ((qm_values ((batch_pre - 0 )) (M) (input_a_pre) (input_b_pre) (AZ) (BZ) (Scale) (OZ) (Lo) (Hi)) = (qm_values (batch_pre) (M) (input_a_pre) (input_b_pre) (AZ) (BZ) (Scale) (OZ) (Lo) (Hi))) ”
  &&  emp
).

Definition test_rvv_return_wit_2_split_goal_1 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (Hi: Z) (Lo: Z) (OZ: Z) (Scale: fp32) (BZ: Z) (AZ: Z) (M: RDMap) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (PreH1 : (batch <= 0)) (PreH2 : (0 < batch_pre)) (PreH3 : (batch_pre <= UINT64_MAX)) (PreH4 : (input_a_pre <> 0)) (PreH5 : (input_b_pre <> 0)) (PreH6 : (output_pre <> 0)) (PreH7 : (params_pre <> 0)) (PreH8 : ((-128) <= AZ)) (PreH9 : (AZ <= 127)) (PreH10 : ((-128) <= BZ)) (PreH11 : (BZ <= 127)) (PreH12 : ((-32768) <= OZ)) (PreH13 : (OZ <= 32767)) (PreH14 : ((-128) <= Lo)) (PreH15 : (Lo <= 127)) (PreH16 : ((-128) <= Hi)) (PreH17 : (Hi <= 127)) (PreH18 : (qm_inputs M input_a_pre input_b_pre batch_pre )) (PreH19 : (sizeof(CHAR) = 1)) (PreH20 : (0 <= batch)) (PreH21 : (batch <= batch_pre)) (PreH22 : (input_a = (input_a_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH23 : (input_b = (input_b_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH24 : (batch = 0)) ,
  (CharArray.undef_full output batch )
|--
  “ ((qm_values ((batch_pre - 0 )) (M) (input_a_pre) (input_b_pre) (AZ) (BZ) (Scale) (OZ) (Lo) (Hi)) = (qm_values (batch_pre) (M) (input_a_pre) (input_b_pre) (AZ) (BZ) (Scale) (OZ) (Lo) (Hi))) ”
.

Definition test_rvv_return_wit_2_split_goal_spatial := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (Hi: Z) (Lo: Z) (OZ: Z) (BZ: Z) (AZ: Z) (M: RDMap) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (PreH1 : (batch <= 0)) (PreH2 : (0 < batch_pre)) (PreH3 : (batch_pre <= UINT64_MAX)) (PreH4 : (input_a_pre <> 0)) (PreH5 : (input_b_pre <> 0)) (PreH6 : (output_pre <> 0)) (PreH7 : (params_pre <> 0)) (PreH8 : ((-128) <= AZ)) (PreH9 : (AZ <= 127)) (PreH10 : ((-128) <= BZ)) (PreH11 : (BZ <= 127)) (PreH12 : ((-32768) <= OZ)) (PreH13 : (OZ <= 32767)) (PreH14 : ((-128) <= Lo)) (PreH15 : (Lo <= 127)) (PreH16 : ((-128) <= Hi)) (PreH17 : (Hi <= 127)) (PreH18 : (qm_inputs M input_a_pre input_b_pre batch_pre )) (PreH19 : (sizeof(CHAR) = 1)) (PreH20 : (0 <= batch)) (PreH21 : (batch <= batch_pre)) (PreH22 : (input_a = (input_a_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH23 : (input_b = (input_b_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH24 : (batch = 0)) ,
  (CharArray.undef_full output batch )
|--
  TT && emp 
.

Definition test_rvv_partial_solve_wit_1_pure := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (Hi: Z) (Lo: Z) (OZ: Z) (Scale: fp32) (BZ: Z) (AZ: Z) (M: RDMap) (PreH1 : (batch_pre <> 0)) (PreH2 : (0 < batch_pre)) (PreH3 : (batch_pre <= UINT64_MAX)) (PreH4 : (input_a_pre <> 0)) (PreH5 : (input_b_pre <> 0)) (PreH6 : (output_pre <> 0)) (PreH7 : (params_pre <> 0)) (PreH8 : ((-128) <= AZ)) (PreH9 : (AZ <= 127)) (PreH10 : ((-128) <= BZ)) (PreH11 : (BZ <= 127)) (PreH12 : ((-32768) <= OZ)) (PreH13 : (OZ <= 32767)) (PreH14 : ((-128) <= Lo)) (PreH15 : (Lo <= 127)) (PreH16 : ((-128) <= Hi)) (PreH17 : (Hi <= 127)) (PreH18 : (qm_inputs M input_a_pre input_b_pre batch_pre )) (PreH19 : (sizeof(CHAR) = 1)) (PreH20 : (0 <= batch_pre)) (PreH21 : (batch_pre <= batch_pre)) (PreH22 : (input_a_pre = (input_a_pre + ((batch_pre - batch_pre ) * sizeof(CHAR))))) (PreH23 : (input_b_pre = (input_b_pre + ((batch_pre - batch_pre ) * sizeof(CHAR))))) (PreH24 : (output_pre = (output_pre + ((batch_pre - batch_pre ) * sizeof(CHAR))))) (PreH25 : ((batch_pre % ( sizeof(CHAR) ) ) = 0)) ,
  ((( &( "batch" ) )) # UInt64  |-> batch_pre)
  **  ((( &( "input_a" ) )) # Ptr  |-> input_a_pre)
  **  ((( &( "input_b" ) )) # Ptr  |-> input_b_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (rd_mem M )
  **  (CharArray.full output_pre (batch_pre - batch_pre ) (qm_values ((batch_pre - batch_pre )) (M) (input_a_pre) (input_b_pre) (AZ) (BZ) (Scale) (OZ) (Lo) (Hi)) )
  **  (CharArray.undef_full output_pre batch_pre )
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "a_zero_point")) # Char  |-> AZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "b_zero_point")) # Char  |-> BZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "scale")) # Float  |-> Scale)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_zero_point")) # Short  |-> OZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_min")) # Char  |-> Lo)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_max")) # Char  |-> Hi)
|--
  “ (1 <> 0) ”
.

Definition test_rvv_partial_solve_wit_1_aux := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (Hi: Z) (Lo: Z) (OZ: Z) (Scale: fp32) (BZ: Z) (AZ: Z) (M: RDMap) (PreH1 : (batch_pre <> 0)) (PreH2 : (0 < batch_pre)) (PreH3 : (batch_pre <= UINT64_MAX)) (PreH4 : (input_a_pre <> 0)) (PreH5 : (input_b_pre <> 0)) (PreH6 : (output_pre <> 0)) (PreH7 : (params_pre <> 0)) (PreH8 : ((-128) <= AZ)) (PreH9 : (AZ <= 127)) (PreH10 : ((-128) <= BZ)) (PreH11 : (BZ <= 127)) (PreH12 : ((-32768) <= OZ)) (PreH13 : (OZ <= 32767)) (PreH14 : ((-128) <= Lo)) (PreH15 : (Lo <= 127)) (PreH16 : ((-128) <= Hi)) (PreH17 : (Hi <= 127)) (PreH18 : (qm_inputs M input_a_pre input_b_pre batch_pre )) (PreH19 : (sizeof(CHAR) = 1)) (PreH20 : (0 <= batch_pre)) (PreH21 : (batch_pre <= batch_pre)) (PreH22 : (input_a_pre = (input_a_pre + ((batch_pre - batch_pre ) * sizeof(CHAR))))) (PreH23 : (input_b_pre = (input_b_pre + ((batch_pre - batch_pre ) * sizeof(CHAR))))) (PreH24 : (output_pre = (output_pre + ((batch_pre - batch_pre ) * sizeof(CHAR))))) (PreH25 : ((batch_pre % ( sizeof(CHAR) ) ) = 0)) ,
  (rd_mem M )
  **  (CharArray.full output_pre (batch_pre - batch_pre ) (qm_values ((batch_pre - batch_pre )) (M) (input_a_pre) (input_b_pre) (AZ) (BZ) (Scale) (OZ) (Lo) (Hi)) )
  **  (CharArray.undef_full output_pre batch_pre )
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "a_zero_point")) # Char  |-> AZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "b_zero_point")) # Char  |-> BZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "scale")) # Float  |-> Scale)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_zero_point")) # Short  |-> OZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_min")) # Char  |-> Lo)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_max")) # Char  |-> Hi)
|--
  “ (1 <> 0) ” 
  &&  “ (batch_pre <> 0) ” 
  &&  “ (0 < batch_pre) ” 
  &&  “ (batch_pre <= UINT64_MAX) ” 
  &&  “ (input_a_pre <> 0) ” 
  &&  “ (input_b_pre <> 0) ” 
  &&  “ (output_pre <> 0) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ ((-128) <= AZ) ” 
  &&  “ (AZ <= 127) ” 
  &&  “ ((-128) <= BZ) ” 
  &&  “ (BZ <= 127) ” 
  &&  “ ((-32768) <= OZ) ” 
  &&  “ (OZ <= 32767) ” 
  &&  “ ((-128) <= Lo) ” 
  &&  “ (Lo <= 127) ” 
  &&  “ ((-128) <= Hi) ” 
  &&  “ (Hi <= 127) ” 
  &&  “ (qm_inputs M input_a_pre input_b_pre batch_pre ) ” 
  &&  “ (sizeof(CHAR) = 1) ” 
  &&  “ (0 <= batch_pre) ” 
  &&  “ (batch_pre <= batch_pre) ” 
  &&  “ (input_a_pre = (input_a_pre + ((batch_pre - batch_pre ) * sizeof(CHAR)))) ” 
  &&  “ (input_b_pre = (input_b_pre + ((batch_pre - batch_pre ) * sizeof(CHAR)))) ” 
  &&  “ (output_pre = (output_pre + ((batch_pre - batch_pre ) * sizeof(CHAR)))) ” 
  &&  “ ((batch_pre % ( sizeof(CHAR) ) ) = 0) ”
  &&  (rd_mem M )
  **  (CharArray.full output_pre (batch_pre - batch_pre ) (qm_values ((batch_pre - batch_pre )) (M) (input_a_pre) (input_b_pre) (AZ) (BZ) (Scale) (OZ) (Lo) (Hi)) )
  **  (CharArray.undef_full output_pre batch_pre )
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "a_zero_point")) # Char  |-> AZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "b_zero_point")) # Char  |-> BZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "scale")) # Float  |-> Scale)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_zero_point")) # Short  |-> OZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_min")) # Char  |-> Lo)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_max")) # Char  |-> Hi)
.

Definition test_rvv_partial_solve_wit_1 := test_rvv_partial_solve_wit_1_pure -> test_rvv_partial_solve_wit_1_aux.

Definition test_rvv_partial_solve_wit_2_pure := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (Hi: Z) (Lo: Z) (OZ: Z) (Scale: fp32) (BZ: Z) (AZ: Z) (M: RDMap) (PreH1 : ((batch_pre % ( sizeof(CHAR) ) ) = 0)) (PreH2 : (batch_pre <> 0)) (PreH3 : (0 < batch_pre)) (PreH4 : (batch_pre <= UINT64_MAX)) (PreH5 : (input_a_pre <> 0)) (PreH6 : (input_b_pre <> 0)) (PreH7 : (output_pre <> 0)) (PreH8 : (params_pre <> 0)) (PreH9 : ((-128) <= AZ)) (PreH10 : (AZ <= 127)) (PreH11 : ((-128) <= BZ)) (PreH12 : (BZ <= 127)) (PreH13 : ((-32768) <= OZ)) (PreH14 : (OZ <= 32767)) (PreH15 : ((-128) <= Lo)) (PreH16 : (Lo <= 127)) (PreH17 : ((-128) <= Hi)) (PreH18 : (Hi <= 127)) (PreH19 : (qm_inputs M input_a_pre input_b_pre batch_pre )) (PreH20 : (sizeof(CHAR) = 1)) (PreH21 : (0 <= batch_pre)) (PreH22 : (batch_pre <= batch_pre)) (PreH23 : (input_a_pre = (input_a_pre + ((batch_pre - batch_pre ) * sizeof(CHAR))))) (PreH24 : (input_b_pre = (input_b_pre + ((batch_pre - batch_pre ) * sizeof(CHAR))))) (PreH25 : (output_pre = (output_pre + ((batch_pre - batch_pre ) * sizeof(CHAR))))) (PreH26 : ((batch_pre % ( sizeof(CHAR) ) ) = 0)) ,
  ((( &( "batch" ) )) # UInt64  |-> batch_pre)
  **  ((( &( "input_a" ) )) # Ptr  |-> input_a_pre)
  **  ((( &( "input_b" ) )) # Ptr  |-> input_b_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (rd_mem M )
  **  (CharArray.full output_pre (batch_pre - batch_pre ) (qm_values ((batch_pre - batch_pre )) (M) (input_a_pre) (input_b_pre) (AZ) (BZ) (Scale) (OZ) (Lo) (Hi)) )
  **  (CharArray.undef_full output_pre batch_pre )
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "a_zero_point")) # Char  |-> AZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "b_zero_point")) # Char  |-> BZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "scale")) # Float  |-> Scale)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_zero_point")) # Short  |-> OZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_min")) # Char  |-> Lo)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_max")) # Char  |-> Hi)
|--
  “ (1 <> 0) ”
.

Definition test_rvv_partial_solve_wit_2_aux := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (Hi: Z) (Lo: Z) (OZ: Z) (Scale: fp32) (BZ: Z) (AZ: Z) (M: RDMap) (PreH1 : ((batch_pre % ( sizeof(CHAR) ) ) = 0)) (PreH2 : (batch_pre <> 0)) (PreH3 : (0 < batch_pre)) (PreH4 : (batch_pre <= UINT64_MAX)) (PreH5 : (input_a_pre <> 0)) (PreH6 : (input_b_pre <> 0)) (PreH7 : (output_pre <> 0)) (PreH8 : (params_pre <> 0)) (PreH9 : ((-128) <= AZ)) (PreH10 : (AZ <= 127)) (PreH11 : ((-128) <= BZ)) (PreH12 : (BZ <= 127)) (PreH13 : ((-32768) <= OZ)) (PreH14 : (OZ <= 32767)) (PreH15 : ((-128) <= Lo)) (PreH16 : (Lo <= 127)) (PreH17 : ((-128) <= Hi)) (PreH18 : (Hi <= 127)) (PreH19 : (qm_inputs M input_a_pre input_b_pre batch_pre )) (PreH20 : (sizeof(CHAR) = 1)) (PreH21 : (0 <= batch_pre)) (PreH22 : (batch_pre <= batch_pre)) (PreH23 : (input_a_pre = (input_a_pre + ((batch_pre - batch_pre ) * sizeof(CHAR))))) (PreH24 : (input_b_pre = (input_b_pre + ((batch_pre - batch_pre ) * sizeof(CHAR))))) (PreH25 : (output_pre = (output_pre + ((batch_pre - batch_pre ) * sizeof(CHAR))))) (PreH26 : ((batch_pre % ( sizeof(CHAR) ) ) = 0)) ,
  (rd_mem M )
  **  (CharArray.full output_pre (batch_pre - batch_pre ) (qm_values ((batch_pre - batch_pre )) (M) (input_a_pre) (input_b_pre) (AZ) (BZ) (Scale) (OZ) (Lo) (Hi)) )
  **  (CharArray.undef_full output_pre batch_pre )
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "a_zero_point")) # Char  |-> AZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "b_zero_point")) # Char  |-> BZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "scale")) # Float  |-> Scale)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_zero_point")) # Short  |-> OZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_min")) # Char  |-> Lo)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_max")) # Char  |-> Hi)
|--
  “ (1 <> 0) ” 
  &&  “ ((batch_pre % ( sizeof(CHAR) ) ) = 0) ” 
  &&  “ (batch_pre <> 0) ” 
  &&  “ (0 < batch_pre) ” 
  &&  “ (batch_pre <= UINT64_MAX) ” 
  &&  “ (input_a_pre <> 0) ” 
  &&  “ (input_b_pre <> 0) ” 
  &&  “ (output_pre <> 0) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ ((-128) <= AZ) ” 
  &&  “ (AZ <= 127) ” 
  &&  “ ((-128) <= BZ) ” 
  &&  “ (BZ <= 127) ” 
  &&  “ ((-32768) <= OZ) ” 
  &&  “ (OZ <= 32767) ” 
  &&  “ ((-128) <= Lo) ” 
  &&  “ (Lo <= 127) ” 
  &&  “ ((-128) <= Hi) ” 
  &&  “ (Hi <= 127) ” 
  &&  “ (qm_inputs M input_a_pre input_b_pre batch_pre ) ” 
  &&  “ (sizeof(CHAR) = 1) ” 
  &&  “ (0 <= batch_pre) ” 
  &&  “ (batch_pre <= batch_pre) ” 
  &&  “ (input_a_pre = (input_a_pre + ((batch_pre - batch_pre ) * sizeof(CHAR)))) ” 
  &&  “ (input_b_pre = (input_b_pre + ((batch_pre - batch_pre ) * sizeof(CHAR)))) ” 
  &&  “ (output_pre = (output_pre + ((batch_pre - batch_pre ) * sizeof(CHAR)))) ” 
  &&  “ ((batch_pre % ( sizeof(CHAR) ) ) = 0) ”
  &&  (rd_mem M )
  **  (CharArray.full output_pre (batch_pre - batch_pre ) (qm_values ((batch_pre - batch_pre )) (M) (input_a_pre) (input_b_pre) (AZ) (BZ) (Scale) (OZ) (Lo) (Hi)) )
  **  (CharArray.undef_full output_pre batch_pre )
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "a_zero_point")) # Char  |-> AZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "b_zero_point")) # Char  |-> BZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "scale")) # Float  |-> Scale)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_zero_point")) # Short  |-> OZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_min")) # Char  |-> Lo)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_max")) # Char  |-> Hi)
.

Definition test_rvv_partial_solve_wit_2 := test_rvv_partial_solve_wit_2_pure -> test_rvv_partial_solve_wit_2_aux.

Definition test_rvv_partial_solve_wit_3_pure := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (Hi: Z) (Lo: Z) (OZ: Z) (Scale: fp32) (BZ: Z) (AZ: Z) (M: RDMap) (PreH1 : (input_a_pre <> 0)) (PreH2 : ((batch_pre % ( sizeof(CHAR) ) ) = 0)) (PreH3 : (batch_pre <> 0)) (PreH4 : (0 < batch_pre)) (PreH5 : (batch_pre <= UINT64_MAX)) (PreH6 : (input_a_pre <> 0)) (PreH7 : (input_b_pre <> 0)) (PreH8 : (output_pre <> 0)) (PreH9 : (params_pre <> 0)) (PreH10 : ((-128) <= AZ)) (PreH11 : (AZ <= 127)) (PreH12 : ((-128) <= BZ)) (PreH13 : (BZ <= 127)) (PreH14 : ((-32768) <= OZ)) (PreH15 : (OZ <= 32767)) (PreH16 : ((-128) <= Lo)) (PreH17 : (Lo <= 127)) (PreH18 : ((-128) <= Hi)) (PreH19 : (Hi <= 127)) (PreH20 : (qm_inputs M input_a_pre input_b_pre batch_pre )) (PreH21 : (sizeof(CHAR) = 1)) (PreH22 : (0 <= batch_pre)) (PreH23 : (batch_pre <= batch_pre)) (PreH24 : (input_a_pre = (input_a_pre + ((batch_pre - batch_pre ) * sizeof(CHAR))))) (PreH25 : (input_b_pre = (input_b_pre + ((batch_pre - batch_pre ) * sizeof(CHAR))))) (PreH26 : (output_pre = (output_pre + ((batch_pre - batch_pre ) * sizeof(CHAR))))) (PreH27 : ((batch_pre % ( sizeof(CHAR) ) ) = 0)) ,
  ((( &( "batch" ) )) # UInt64  |-> batch_pre)
  **  ((( &( "input_a" ) )) # Ptr  |-> input_a_pre)
  **  ((( &( "input_b" ) )) # Ptr  |-> input_b_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (rd_mem M )
  **  (CharArray.full output_pre (batch_pre - batch_pre ) (qm_values ((batch_pre - batch_pre )) (M) (input_a_pre) (input_b_pre) (AZ) (BZ) (Scale) (OZ) (Lo) (Hi)) )
  **  (CharArray.undef_full output_pre batch_pre )
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "a_zero_point")) # Char  |-> AZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "b_zero_point")) # Char  |-> BZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "scale")) # Float  |-> Scale)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_zero_point")) # Short  |-> OZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_min")) # Char  |-> Lo)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_max")) # Char  |-> Hi)
|--
  “ (1 <> 0) ”
.

Definition test_rvv_partial_solve_wit_3_aux := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (Hi: Z) (Lo: Z) (OZ: Z) (Scale: fp32) (BZ: Z) (AZ: Z) (M: RDMap) (PreH1 : (input_a_pre <> 0)) (PreH2 : ((batch_pre % ( sizeof(CHAR) ) ) = 0)) (PreH3 : (batch_pre <> 0)) (PreH4 : (0 < batch_pre)) (PreH5 : (batch_pre <= UINT64_MAX)) (PreH6 : (input_a_pre <> 0)) (PreH7 : (input_b_pre <> 0)) (PreH8 : (output_pre <> 0)) (PreH9 : (params_pre <> 0)) (PreH10 : ((-128) <= AZ)) (PreH11 : (AZ <= 127)) (PreH12 : ((-128) <= BZ)) (PreH13 : (BZ <= 127)) (PreH14 : ((-32768) <= OZ)) (PreH15 : (OZ <= 32767)) (PreH16 : ((-128) <= Lo)) (PreH17 : (Lo <= 127)) (PreH18 : ((-128) <= Hi)) (PreH19 : (Hi <= 127)) (PreH20 : (qm_inputs M input_a_pre input_b_pre batch_pre )) (PreH21 : (sizeof(CHAR) = 1)) (PreH22 : (0 <= batch_pre)) (PreH23 : (batch_pre <= batch_pre)) (PreH24 : (input_a_pre = (input_a_pre + ((batch_pre - batch_pre ) * sizeof(CHAR))))) (PreH25 : (input_b_pre = (input_b_pre + ((batch_pre - batch_pre ) * sizeof(CHAR))))) (PreH26 : (output_pre = (output_pre + ((batch_pre - batch_pre ) * sizeof(CHAR))))) (PreH27 : ((batch_pre % ( sizeof(CHAR) ) ) = 0)) ,
  (rd_mem M )
  **  (CharArray.full output_pre (batch_pre - batch_pre ) (qm_values ((batch_pre - batch_pre )) (M) (input_a_pre) (input_b_pre) (AZ) (BZ) (Scale) (OZ) (Lo) (Hi)) )
  **  (CharArray.undef_full output_pre batch_pre )
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "a_zero_point")) # Char  |-> AZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "b_zero_point")) # Char  |-> BZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "scale")) # Float  |-> Scale)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_zero_point")) # Short  |-> OZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_min")) # Char  |-> Lo)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_max")) # Char  |-> Hi)
|--
  “ (1 <> 0) ” 
  &&  “ (input_a_pre <> 0) ” 
  &&  “ ((batch_pre % ( sizeof(CHAR) ) ) = 0) ” 
  &&  “ (batch_pre <> 0) ” 
  &&  “ (0 < batch_pre) ” 
  &&  “ (batch_pre <= UINT64_MAX) ” 
  &&  “ (input_a_pre <> 0) ” 
  &&  “ (input_b_pre <> 0) ” 
  &&  “ (output_pre <> 0) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ ((-128) <= AZ) ” 
  &&  “ (AZ <= 127) ” 
  &&  “ ((-128) <= BZ) ” 
  &&  “ (BZ <= 127) ” 
  &&  “ ((-32768) <= OZ) ” 
  &&  “ (OZ <= 32767) ” 
  &&  “ ((-128) <= Lo) ” 
  &&  “ (Lo <= 127) ” 
  &&  “ ((-128) <= Hi) ” 
  &&  “ (Hi <= 127) ” 
  &&  “ (qm_inputs M input_a_pre input_b_pre batch_pre ) ” 
  &&  “ (sizeof(CHAR) = 1) ” 
  &&  “ (0 <= batch_pre) ” 
  &&  “ (batch_pre <= batch_pre) ” 
  &&  “ (input_a_pre = (input_a_pre + ((batch_pre - batch_pre ) * sizeof(CHAR)))) ” 
  &&  “ (input_b_pre = (input_b_pre + ((batch_pre - batch_pre ) * sizeof(CHAR)))) ” 
  &&  “ (output_pre = (output_pre + ((batch_pre - batch_pre ) * sizeof(CHAR)))) ” 
  &&  “ ((batch_pre % ( sizeof(CHAR) ) ) = 0) ”
  &&  (rd_mem M )
  **  (CharArray.full output_pre (batch_pre - batch_pre ) (qm_values ((batch_pre - batch_pre )) (M) (input_a_pre) (input_b_pre) (AZ) (BZ) (Scale) (OZ) (Lo) (Hi)) )
  **  (CharArray.undef_full output_pre batch_pre )
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "a_zero_point")) # Char  |-> AZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "b_zero_point")) # Char  |-> BZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "scale")) # Float  |-> Scale)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_zero_point")) # Short  |-> OZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_min")) # Char  |-> Lo)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_max")) # Char  |-> Hi)
.

Definition test_rvv_partial_solve_wit_3 := test_rvv_partial_solve_wit_3_pure -> test_rvv_partial_solve_wit_3_aux.

Definition test_rvv_partial_solve_wit_4_pure := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (Hi: Z) (Lo: Z) (OZ: Z) (Scale: fp32) (BZ: Z) (AZ: Z) (M: RDMap) (PreH1 : (input_b_pre <> 0)) (PreH2 : (input_a_pre <> 0)) (PreH3 : ((batch_pre % ( sizeof(CHAR) ) ) = 0)) (PreH4 : (batch_pre <> 0)) (PreH5 : (0 < batch_pre)) (PreH6 : (batch_pre <= UINT64_MAX)) (PreH7 : (input_a_pre <> 0)) (PreH8 : (input_b_pre <> 0)) (PreH9 : (output_pre <> 0)) (PreH10 : (params_pre <> 0)) (PreH11 : ((-128) <= AZ)) (PreH12 : (AZ <= 127)) (PreH13 : ((-128) <= BZ)) (PreH14 : (BZ <= 127)) (PreH15 : ((-32768) <= OZ)) (PreH16 : (OZ <= 32767)) (PreH17 : ((-128) <= Lo)) (PreH18 : (Lo <= 127)) (PreH19 : ((-128) <= Hi)) (PreH20 : (Hi <= 127)) (PreH21 : (qm_inputs M input_a_pre input_b_pre batch_pre )) (PreH22 : (sizeof(CHAR) = 1)) (PreH23 : (0 <= batch_pre)) (PreH24 : (batch_pre <= batch_pre)) (PreH25 : (input_a_pre = (input_a_pre + ((batch_pre - batch_pre ) * sizeof(CHAR))))) (PreH26 : (input_b_pre = (input_b_pre + ((batch_pre - batch_pre ) * sizeof(CHAR))))) (PreH27 : (output_pre = (output_pre + ((batch_pre - batch_pre ) * sizeof(CHAR))))) (PreH28 : ((batch_pre % ( sizeof(CHAR) ) ) = 0)) ,
  ((( &( "batch" ) )) # UInt64  |-> batch_pre)
  **  ((( &( "input_a" ) )) # Ptr  |-> input_a_pre)
  **  ((( &( "input_b" ) )) # Ptr  |-> input_b_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (rd_mem M )
  **  (CharArray.full output_pre (batch_pre - batch_pre ) (qm_values ((batch_pre - batch_pre )) (M) (input_a_pre) (input_b_pre) (AZ) (BZ) (Scale) (OZ) (Lo) (Hi)) )
  **  (CharArray.undef_full output_pre batch_pre )
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "a_zero_point")) # Char  |-> AZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "b_zero_point")) # Char  |-> BZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "scale")) # Float  |-> Scale)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_zero_point")) # Short  |-> OZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_min")) # Char  |-> Lo)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_max")) # Char  |-> Hi)
|--
  “ (1 <> 0) ”
.

Definition test_rvv_partial_solve_wit_4_aux := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (Hi: Z) (Lo: Z) (OZ: Z) (Scale: fp32) (BZ: Z) (AZ: Z) (M: RDMap) (PreH1 : (input_b_pre <> 0)) (PreH2 : (input_a_pre <> 0)) (PreH3 : ((batch_pre % ( sizeof(CHAR) ) ) = 0)) (PreH4 : (batch_pre <> 0)) (PreH5 : (0 < batch_pre)) (PreH6 : (batch_pre <= UINT64_MAX)) (PreH7 : (input_a_pre <> 0)) (PreH8 : (input_b_pre <> 0)) (PreH9 : (output_pre <> 0)) (PreH10 : (params_pre <> 0)) (PreH11 : ((-128) <= AZ)) (PreH12 : (AZ <= 127)) (PreH13 : ((-128) <= BZ)) (PreH14 : (BZ <= 127)) (PreH15 : ((-32768) <= OZ)) (PreH16 : (OZ <= 32767)) (PreH17 : ((-128) <= Lo)) (PreH18 : (Lo <= 127)) (PreH19 : ((-128) <= Hi)) (PreH20 : (Hi <= 127)) (PreH21 : (qm_inputs M input_a_pre input_b_pre batch_pre )) (PreH22 : (sizeof(CHAR) = 1)) (PreH23 : (0 <= batch_pre)) (PreH24 : (batch_pre <= batch_pre)) (PreH25 : (input_a_pre = (input_a_pre + ((batch_pre - batch_pre ) * sizeof(CHAR))))) (PreH26 : (input_b_pre = (input_b_pre + ((batch_pre - batch_pre ) * sizeof(CHAR))))) (PreH27 : (output_pre = (output_pre + ((batch_pre - batch_pre ) * sizeof(CHAR))))) (PreH28 : ((batch_pre % ( sizeof(CHAR) ) ) = 0)) ,
  (rd_mem M )
  **  (CharArray.full output_pre (batch_pre - batch_pre ) (qm_values ((batch_pre - batch_pre )) (M) (input_a_pre) (input_b_pre) (AZ) (BZ) (Scale) (OZ) (Lo) (Hi)) )
  **  (CharArray.undef_full output_pre batch_pre )
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "a_zero_point")) # Char  |-> AZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "b_zero_point")) # Char  |-> BZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "scale")) # Float  |-> Scale)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_zero_point")) # Short  |-> OZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_min")) # Char  |-> Lo)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_max")) # Char  |-> Hi)
|--
  “ (1 <> 0) ” 
  &&  “ (input_b_pre <> 0) ” 
  &&  “ (input_a_pre <> 0) ” 
  &&  “ ((batch_pre % ( sizeof(CHAR) ) ) = 0) ” 
  &&  “ (batch_pre <> 0) ” 
  &&  “ (0 < batch_pre) ” 
  &&  “ (batch_pre <= UINT64_MAX) ” 
  &&  “ (input_a_pre <> 0) ” 
  &&  “ (input_b_pre <> 0) ” 
  &&  “ (output_pre <> 0) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ ((-128) <= AZ) ” 
  &&  “ (AZ <= 127) ” 
  &&  “ ((-128) <= BZ) ” 
  &&  “ (BZ <= 127) ” 
  &&  “ ((-32768) <= OZ) ” 
  &&  “ (OZ <= 32767) ” 
  &&  “ ((-128) <= Lo) ” 
  &&  “ (Lo <= 127) ” 
  &&  “ ((-128) <= Hi) ” 
  &&  “ (Hi <= 127) ” 
  &&  “ (qm_inputs M input_a_pre input_b_pre batch_pre ) ” 
  &&  “ (sizeof(CHAR) = 1) ” 
  &&  “ (0 <= batch_pre) ” 
  &&  “ (batch_pre <= batch_pre) ” 
  &&  “ (input_a_pre = (input_a_pre + ((batch_pre - batch_pre ) * sizeof(CHAR)))) ” 
  &&  “ (input_b_pre = (input_b_pre + ((batch_pre - batch_pre ) * sizeof(CHAR)))) ” 
  &&  “ (output_pre = (output_pre + ((batch_pre - batch_pre ) * sizeof(CHAR)))) ” 
  &&  “ ((batch_pre % ( sizeof(CHAR) ) ) = 0) ”
  &&  (rd_mem M )
  **  (CharArray.full output_pre (batch_pre - batch_pre ) (qm_values ((batch_pre - batch_pre )) (M) (input_a_pre) (input_b_pre) (AZ) (BZ) (Scale) (OZ) (Lo) (Hi)) )
  **  (CharArray.undef_full output_pre batch_pre )
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "a_zero_point")) # Char  |-> AZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "b_zero_point")) # Char  |-> BZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "scale")) # Float  |-> Scale)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_zero_point")) # Short  |-> OZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_min")) # Char  |-> Lo)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_max")) # Char  |-> Hi)
.

Definition test_rvv_partial_solve_wit_4 := test_rvv_partial_solve_wit_4_pure -> test_rvv_partial_solve_wit_4_aux.

Definition test_rvv_partial_solve_wit_5_pure := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (Hi: Z) (Lo: Z) (OZ: Z) (Scale: fp32) (BZ: Z) (AZ: Z) (M: RDMap) (PreH1 : (output_pre <> 0)) (PreH2 : (input_b_pre <> 0)) (PreH3 : (input_a_pre <> 0)) (PreH4 : ((batch_pre % ( sizeof(CHAR) ) ) = 0)) (PreH5 : (batch_pre <> 0)) (PreH6 : (0 < batch_pre)) (PreH7 : (batch_pre <= UINT64_MAX)) (PreH8 : (input_a_pre <> 0)) (PreH9 : (input_b_pre <> 0)) (PreH10 : (output_pre <> 0)) (PreH11 : (params_pre <> 0)) (PreH12 : ((-128) <= AZ)) (PreH13 : (AZ <= 127)) (PreH14 : ((-128) <= BZ)) (PreH15 : (BZ <= 127)) (PreH16 : ((-32768) <= OZ)) (PreH17 : (OZ <= 32767)) (PreH18 : ((-128) <= Lo)) (PreH19 : (Lo <= 127)) (PreH20 : ((-128) <= Hi)) (PreH21 : (Hi <= 127)) (PreH22 : (qm_inputs M input_a_pre input_b_pre batch_pre )) (PreH23 : (sizeof(CHAR) = 1)) (PreH24 : (0 <= batch_pre)) (PreH25 : (batch_pre <= batch_pre)) (PreH26 : (input_a_pre = (input_a_pre + ((batch_pre - batch_pre ) * sizeof(CHAR))))) (PreH27 : (input_b_pre = (input_b_pre + ((batch_pre - batch_pre ) * sizeof(CHAR))))) (PreH28 : (output_pre = (output_pre + ((batch_pre - batch_pre ) * sizeof(CHAR))))) (PreH29 : ((batch_pre % ( sizeof(CHAR) ) ) = 0)) ,
  ((( &( "batch" ) )) # UInt64  |-> batch_pre)
  **  ((( &( "input_a" ) )) # Ptr  |-> input_a_pre)
  **  ((( &( "input_b" ) )) # Ptr  |-> input_b_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (rd_mem M )
  **  (CharArray.full output_pre (batch_pre - batch_pre ) (qm_values ((batch_pre - batch_pre )) (M) (input_a_pre) (input_b_pre) (AZ) (BZ) (Scale) (OZ) (Lo) (Hi)) )
  **  (CharArray.undef_full output_pre batch_pre )
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "a_zero_point")) # Char  |-> AZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "b_zero_point")) # Char  |-> BZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "scale")) # Float  |-> Scale)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_zero_point")) # Short  |-> OZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_min")) # Char  |-> Lo)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_max")) # Char  |-> Hi)
|--
  “ (1 <> 0) ”
.

Definition test_rvv_partial_solve_wit_5_aux := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (Hi: Z) (Lo: Z) (OZ: Z) (Scale: fp32) (BZ: Z) (AZ: Z) (M: RDMap) (PreH1 : (output_pre <> 0)) (PreH2 : (input_b_pre <> 0)) (PreH3 : (input_a_pre <> 0)) (PreH4 : ((batch_pre % ( sizeof(CHAR) ) ) = 0)) (PreH5 : (batch_pre <> 0)) (PreH6 : (0 < batch_pre)) (PreH7 : (batch_pre <= UINT64_MAX)) (PreH8 : (input_a_pre <> 0)) (PreH9 : (input_b_pre <> 0)) (PreH10 : (output_pre <> 0)) (PreH11 : (params_pre <> 0)) (PreH12 : ((-128) <= AZ)) (PreH13 : (AZ <= 127)) (PreH14 : ((-128) <= BZ)) (PreH15 : (BZ <= 127)) (PreH16 : ((-32768) <= OZ)) (PreH17 : (OZ <= 32767)) (PreH18 : ((-128) <= Lo)) (PreH19 : (Lo <= 127)) (PreH20 : ((-128) <= Hi)) (PreH21 : (Hi <= 127)) (PreH22 : (qm_inputs M input_a_pre input_b_pre batch_pre )) (PreH23 : (sizeof(CHAR) = 1)) (PreH24 : (0 <= batch_pre)) (PreH25 : (batch_pre <= batch_pre)) (PreH26 : (input_a_pre = (input_a_pre + ((batch_pre - batch_pre ) * sizeof(CHAR))))) (PreH27 : (input_b_pre = (input_b_pre + ((batch_pre - batch_pre ) * sizeof(CHAR))))) (PreH28 : (output_pre = (output_pre + ((batch_pre - batch_pre ) * sizeof(CHAR))))) (PreH29 : ((batch_pre % ( sizeof(CHAR) ) ) = 0)) ,
  (rd_mem M )
  **  (CharArray.full output_pre (batch_pre - batch_pre ) (qm_values ((batch_pre - batch_pre )) (M) (input_a_pre) (input_b_pre) (AZ) (BZ) (Scale) (OZ) (Lo) (Hi)) )
  **  (CharArray.undef_full output_pre batch_pre )
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "a_zero_point")) # Char  |-> AZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "b_zero_point")) # Char  |-> BZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "scale")) # Float  |-> Scale)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_zero_point")) # Short  |-> OZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_min")) # Char  |-> Lo)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_max")) # Char  |-> Hi)
|--
  “ (1 <> 0) ” 
  &&  “ (output_pre <> 0) ” 
  &&  “ (input_b_pre <> 0) ” 
  &&  “ (input_a_pre <> 0) ” 
  &&  “ ((batch_pre % ( sizeof(CHAR) ) ) = 0) ” 
  &&  “ (batch_pre <> 0) ” 
  &&  “ (0 < batch_pre) ” 
  &&  “ (batch_pre <= UINT64_MAX) ” 
  &&  “ (input_a_pre <> 0) ” 
  &&  “ (input_b_pre <> 0) ” 
  &&  “ (output_pre <> 0) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ ((-128) <= AZ) ” 
  &&  “ (AZ <= 127) ” 
  &&  “ ((-128) <= BZ) ” 
  &&  “ (BZ <= 127) ” 
  &&  “ ((-32768) <= OZ) ” 
  &&  “ (OZ <= 32767) ” 
  &&  “ ((-128) <= Lo) ” 
  &&  “ (Lo <= 127) ” 
  &&  “ ((-128) <= Hi) ” 
  &&  “ (Hi <= 127) ” 
  &&  “ (qm_inputs M input_a_pre input_b_pre batch_pre ) ” 
  &&  “ (sizeof(CHAR) = 1) ” 
  &&  “ (0 <= batch_pre) ” 
  &&  “ (batch_pre <= batch_pre) ” 
  &&  “ (input_a_pre = (input_a_pre + ((batch_pre - batch_pre ) * sizeof(CHAR)))) ” 
  &&  “ (input_b_pre = (input_b_pre + ((batch_pre - batch_pre ) * sizeof(CHAR)))) ” 
  &&  “ (output_pre = (output_pre + ((batch_pre - batch_pre ) * sizeof(CHAR)))) ” 
  &&  “ ((batch_pre % ( sizeof(CHAR) ) ) = 0) ”
  &&  (rd_mem M )
  **  (CharArray.full output_pre (batch_pre - batch_pre ) (qm_values ((batch_pre - batch_pre )) (M) (input_a_pre) (input_b_pre) (AZ) (BZ) (Scale) (OZ) (Lo) (Hi)) )
  **  (CharArray.undef_full output_pre batch_pre )
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "a_zero_point")) # Char  |-> AZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "b_zero_point")) # Char  |-> BZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "scale")) # Float  |-> Scale)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_zero_point")) # Short  |-> OZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_min")) # Char  |-> Lo)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_max")) # Char  |-> Hi)
.

Definition test_rvv_partial_solve_wit_5 := test_rvv_partial_solve_wit_5_pure -> test_rvv_partial_solve_wit_5_aux.

Definition test_rvv_partial_solve_wit_6_pure := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (Hi: Z) (Lo: Z) (OZ: Z) (Scale: fp32) (BZ: Z) (AZ: Z) (M: RDMap) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (PreH1 : (batch > 0)) (PreH2 : (0 < batch_pre)) (PreH3 : (batch_pre <= UINT64_MAX)) (PreH4 : (input_a_pre <> 0)) (PreH5 : (input_b_pre <> 0)) (PreH6 : (output_pre <> 0)) (PreH7 : (params_pre <> 0)) (PreH8 : ((-128) <= AZ)) (PreH9 : (AZ <= 127)) (PreH10 : ((-128) <= BZ)) (PreH11 : (BZ <= 127)) (PreH12 : ((-32768) <= OZ)) (PreH13 : (OZ <= 32767)) (PreH14 : ((-128) <= Lo)) (PreH15 : (Lo <= 127)) (PreH16 : ((-128) <= Hi)) (PreH17 : (Hi <= 127)) (PreH18 : (qm_inputs M input_a_pre input_b_pre batch_pre )) (PreH19 : (sizeof(CHAR) = 1)) (PreH20 : (0 <= batch)) (PreH21 : (batch <= batch_pre)) (PreH22 : (input_a = (input_a_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH23 : (input_b = (input_b_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH24 : (output = (output_pre + ((batch_pre - batch ) * sizeof(CHAR))))) ,
  ((( &( "vl" ) )) # UInt64  |->_)
  **  ((( &( "batch" ) )) # UInt64  |-> batch)
  **  ((( &( "input_a" ) )) # Ptr  |-> input_a)
  **  ((( &( "input_b" ) )) # Ptr  |-> input_b)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (rd_mem M )
  **  (CharArray.full output_pre (batch_pre - batch ) (qm_values ((batch_pre - batch )) (M) (input_a_pre) (input_b_pre) (AZ) (BZ) (Scale) (OZ) (Lo) (Hi)) )
  **  (CharArray.undef_full output batch )
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "a_zero_point")) # Char  |-> AZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "b_zero_point")) # Char  |-> BZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "scale")) # Float  |-> Scale)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_zero_point")) # Short  |-> OZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_min")) # Char  |-> Lo)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_max")) # Char  |-> Hi)
  **  ((( &( "a_zero_point" ) )) # Char  |-> AZ)
  **  ((( &( "b_zero_point" ) )) # Char  |-> BZ)
  **  ((( &( "scale" ) )) # Float  |-> Scale)
  **  ((( &( "output_zero_point" ) )) # Short  |-> OZ)
  **  ((( &( "output_min" ) )) # Char  |-> Lo)
  **  ((( &( "output_max" ) )) # Char  |-> Hi)
|--
  “ (0 < batch) ”
.

Definition test_rvv_partial_solve_wit_6_aux := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (Hi: Z) (Lo: Z) (OZ: Z) (Scale: fp32) (BZ: Z) (AZ: Z) (M: RDMap) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (PreH1 : (batch > 0)) (PreH2 : (0 < batch_pre)) (PreH3 : (batch_pre <= UINT64_MAX)) (PreH4 : (input_a_pre <> 0)) (PreH5 : (input_b_pre <> 0)) (PreH6 : (output_pre <> 0)) (PreH7 : (params_pre <> 0)) (PreH8 : ((-128) <= AZ)) (PreH9 : (AZ <= 127)) (PreH10 : ((-128) <= BZ)) (PreH11 : (BZ <= 127)) (PreH12 : ((-32768) <= OZ)) (PreH13 : (OZ <= 32767)) (PreH14 : ((-128) <= Lo)) (PreH15 : (Lo <= 127)) (PreH16 : ((-128) <= Hi)) (PreH17 : (Hi <= 127)) (PreH18 : (qm_inputs M input_a_pre input_b_pre batch_pre )) (PreH19 : (sizeof(CHAR) = 1)) (PreH20 : (0 <= batch)) (PreH21 : (batch <= batch_pre)) (PreH22 : (input_a = (input_a_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH23 : (input_b = (input_b_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH24 : (output = (output_pre + ((batch_pre - batch ) * sizeof(CHAR))))) ,
  (rd_mem M )
  **  (CharArray.full output_pre (batch_pre - batch ) (qm_values ((batch_pre - batch )) (M) (input_a_pre) (input_b_pre) (AZ) (BZ) (Scale) (OZ) (Lo) (Hi)) )
  **  (CharArray.undef_full output batch )
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "a_zero_point")) # Char  |-> AZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "b_zero_point")) # Char  |-> BZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "scale")) # Float  |-> Scale)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_zero_point")) # Short  |-> OZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_min")) # Char  |-> Lo)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_max")) # Char  |-> Hi)
|--
  “ (0 < batch) ” 
  &&  “ (batch > 0) ” 
  &&  “ (0 < batch_pre) ” 
  &&  “ (batch_pre <= UINT64_MAX) ” 
  &&  “ (input_a_pre <> 0) ” 
  &&  “ (input_b_pre <> 0) ” 
  &&  “ (output_pre <> 0) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ ((-128) <= AZ) ” 
  &&  “ (AZ <= 127) ” 
  &&  “ ((-128) <= BZ) ” 
  &&  “ (BZ <= 127) ” 
  &&  “ ((-32768) <= OZ) ” 
  &&  “ (OZ <= 32767) ” 
  &&  “ ((-128) <= Lo) ” 
  &&  “ (Lo <= 127) ” 
  &&  “ ((-128) <= Hi) ” 
  &&  “ (Hi <= 127) ” 
  &&  “ (qm_inputs M input_a_pre input_b_pre batch_pre ) ” 
  &&  “ (sizeof(CHAR) = 1) ” 
  &&  “ (0 <= batch) ” 
  &&  “ (batch <= batch_pre) ” 
  &&  “ (input_a = (input_a_pre + ((batch_pre - batch ) * sizeof(CHAR)))) ” 
  &&  “ (input_b = (input_b_pre + ((batch_pre - batch ) * sizeof(CHAR)))) ” 
  &&  “ (output = (output_pre + ((batch_pre - batch ) * sizeof(CHAR)))) ”
  &&  (rd_mem M )
  **  (CharArray.full output_pre (batch_pre - batch ) (qm_values ((batch_pre - batch )) (M) (input_a_pre) (input_b_pre) (AZ) (BZ) (Scale) (OZ) (Lo) (Hi)) )
  **  (CharArray.undef_full output batch )
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "a_zero_point")) # Char  |-> AZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "b_zero_point")) # Char  |-> BZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "scale")) # Float  |-> Scale)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_zero_point")) # Short  |-> OZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_min")) # Char  |-> Lo)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_max")) # Char  |-> Hi)
.

Definition test_rvv_partial_solve_wit_6 := test_rvv_partial_solve_wit_6_pure -> test_rvv_partial_solve_wit_6_aux.

Definition test_rvv_partial_solve_wit_7_pure := 
(
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (Hi: Z) (Lo: Z) (OZ: Z) (Scale: fp32) (BZ: Z) (AZ: Z) (M: RDMap) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (retval: Z) (PreH1 : (qm_vl_allowed batch retval )) (PreH2 : (1 <= retval)) (PreH3 : (retval <= 32)) (PreH4 : (retval <= batch)) (PreH5 : (batch > 0)) (PreH6 : (0 < batch_pre)) (PreH7 : (batch_pre <= UINT64_MAX)) (PreH8 : (input_a_pre <> 0)) (PreH9 : (input_b_pre <> 0)) (PreH10 : (output_pre <> 0)) (PreH11 : (params_pre <> 0)) (PreH12 : ((-128) <= AZ)) (PreH13 : (AZ <= 127)) (PreH14 : ((-128) <= BZ)) (PreH15 : (BZ <= 127)) (PreH16 : ((-32768) <= OZ)) (PreH17 : (OZ <= 32767)) (PreH18 : ((-128) <= Lo)) (PreH19 : (Lo <= 127)) (PreH20 : ((-128) <= Hi)) (PreH21 : (Hi <= 127)) (PreH22 : (qm_inputs M input_a_pre input_b_pre batch_pre )) (PreH23 : (sizeof(CHAR) = 1)) (PreH24 : (0 <= batch)) (PreH25 : (batch <= batch_pre)) (PreH26 : (input_a = (input_a_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH27 : (input_b = (input_b_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH28 : (output = (output_pre + ((batch_pre - batch ) * sizeof(CHAR))))) ,
  (UndefStructPredvint8m2_t ( &( "va" ) ) )
  **  ((( &( "vl" ) )) # UInt64  |-> retval)
  **  ((( &( "batch" ) )) # UInt64  |-> batch)
  **  ((( &( "input_a" ) )) # Ptr  |-> input_a)
  **  ((( &( "input_b" ) )) # Ptr  |-> input_b)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (rd_mem M )
  **  (CharArray.full output_pre (batch_pre - batch ) (qm_values ((batch_pre - batch )) (M) (input_a_pre) (input_b_pre) (AZ) (BZ) (Scale) (OZ) (Lo) (Hi)) )
  **  (CharArray.undef_full output batch )
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "a_zero_point")) # Char  |-> AZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "b_zero_point")) # Char  |-> BZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "scale")) # Float  |-> Scale)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_zero_point")) # Short  |-> OZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_min")) # Char  |-> Lo)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_max")) # Char  |-> Hi)
  **  ((( &( "a_zero_point" ) )) # Char  |-> AZ)
  **  ((( &( "b_zero_point" ) )) # Char  |-> BZ)
  **  ((( &( "scale" ) )) # Float  |-> Scale)
  **  ((( &( "output_zero_point" ) )) # Short  |-> OZ)
  **  ((( &( "output_min" ) )) # Char  |-> Lo)
  **  ((( &( "output_max" ) )) # Char  |-> Hi)
|--
  “ (0 <= retval) ” 
  &&  “ (retval <= 32) ” 
  &&  “ (rd_window M input_a retval ) ” 
  &&  “ (rd_window M (input_a_pre + ((batch_pre - batch ) * 1)) retval ) ”
) \/
(
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (Hi: Z) (Lo: Z) (OZ: Z) (Scale: fp32) (BZ: Z) (AZ: Z) (M: RDMap) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (retval: Z) (PreH1 : (batch <= UINT64_MAX)) (PreH2 : (retval <= UINT64_MAX)) (PreH3 : (batch >= 0)) (PreH4 : (retval >= 0)) (PreH5 : (qm_vl_allowed batch retval )) (PreH6 : (1 <= retval)) (PreH7 : (retval <= 32)) (PreH8 : (retval <= batch)) (PreH9 : (batch > 0)) (PreH10 : (0 < batch_pre)) (PreH11 : (batch_pre <= UINT64_MAX)) (PreH12 : (input_a_pre <> 0)) (PreH13 : (input_b_pre <> 0)) (PreH14 : (output_pre <> 0)) (PreH15 : (params_pre <> 0)) (PreH16 : ((-128) <= AZ)) (PreH17 : (AZ <= 127)) (PreH18 : ((-128) <= BZ)) (PreH19 : (BZ <= 127)) (PreH20 : ((-32768) <= OZ)) (PreH21 : (OZ <= 32767)) (PreH22 : ((-128) <= Lo)) (PreH23 : (Lo <= 127)) (PreH24 : ((-128) <= Hi)) (PreH25 : (Hi <= 127)) (PreH26 : (qm_inputs M input_a_pre input_b_pre batch_pre )) (PreH27 : (sizeof(CHAR) = 1)) (PreH28 : (0 <= batch)) (PreH29 : (batch <= batch_pre)) (PreH30 : (input_a = (input_a_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH31 : (input_b = (input_b_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH32 : (output = (output_pre + ((batch_pre - batch ) * sizeof(CHAR))))) ,
  (UndefStructPredvint8m2_t ( &( "va" ) ) )
  **  ((( &( "vl" ) )) # UInt64  |-> retval)
  **  ((( &( "batch" ) )) # UInt64  |-> batch)
  **  ((( &( "input_a" ) )) # Ptr  |-> input_a)
  **  ((( &( "input_b" ) )) # Ptr  |-> input_b)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (rd_mem M )
  **  (CharArray.full output_pre (batch_pre - batch ) (qm_values ((batch_pre - batch )) (M) (input_a_pre) (input_b_pre) (AZ) (BZ) (Scale) (OZ) (Lo) (Hi)) )
  **  (CharArray.undef_full output batch )
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "a_zero_point")) # Char  |-> AZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "b_zero_point")) # Char  |-> BZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "scale")) # Float  |-> Scale)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_zero_point")) # Short  |-> OZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_min")) # Char  |-> Lo)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_max")) # Char  |-> Hi)
  **  ((( &( "a_zero_point" ) )) # Char  |-> AZ)
  **  ((( &( "b_zero_point" ) )) # Char  |-> BZ)
  **  ((( &( "scale" ) )) # Float  |-> Scale)
  **  ((( &( "output_zero_point" ) )) # Short  |-> OZ)
  **  ((( &( "output_min" ) )) # Char  |-> Lo)
  **  ((( &( "output_max" ) )) # Char  |-> Hi)
|--
  “ (rd_window M (input_a_pre + ((batch_pre - batch ) * 1)) retval ) ” 
  &&  “ (rd_window M input_a retval ) ”
).

Definition test_rvv_partial_solve_wit_7_pure_split_goal_1 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (Hi: Z) (Lo: Z) (OZ: Z) (Scale: fp32) (BZ: Z) (AZ: Z) (M: RDMap) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (retval: Z) (PreH1 : (batch <= UINT64_MAX)) (PreH2 : (retval <= UINT64_MAX)) (PreH3 : (batch >= 0)) (PreH4 : (retval >= 0)) (PreH5 : (qm_vl_allowed batch retval )) (PreH6 : (1 <= retval)) (PreH7 : (retval <= 32)) (PreH8 : (retval <= batch)) (PreH9 : (batch > 0)) (PreH10 : (0 < batch_pre)) (PreH11 : (batch_pre <= UINT64_MAX)) (PreH12 : (input_a_pre <> 0)) (PreH13 : (input_b_pre <> 0)) (PreH14 : (output_pre <> 0)) (PreH15 : (params_pre <> 0)) (PreH16 : ((-128) <= AZ)) (PreH17 : (AZ <= 127)) (PreH18 : ((-128) <= BZ)) (PreH19 : (BZ <= 127)) (PreH20 : ((-32768) <= OZ)) (PreH21 : (OZ <= 32767)) (PreH22 : ((-128) <= Lo)) (PreH23 : (Lo <= 127)) (PreH24 : ((-128) <= Hi)) (PreH25 : (Hi <= 127)) (PreH26 : (qm_inputs M input_a_pre input_b_pre batch_pre )) (PreH27 : (sizeof(CHAR) = 1)) (PreH28 : (0 <= batch)) (PreH29 : (batch <= batch_pre)) (PreH30 : (input_a = (input_a_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH31 : (input_b = (input_b_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH32 : (output = (output_pre + ((batch_pre - batch ) * sizeof(CHAR))))) ,
  (UndefStructPredvint8m2_t ( &( "va" ) ) )
  **  ((( &( "vl" ) )) # UInt64  |-> retval)
  **  ((( &( "batch" ) )) # UInt64  |-> batch)
  **  ((( &( "input_a" ) )) # Ptr  |-> input_a)
  **  ((( &( "input_b" ) )) # Ptr  |-> input_b)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (rd_mem M )
  **  (CharArray.full output_pre (batch_pre - batch ) (qm_values ((batch_pre - batch )) (M) (input_a_pre) (input_b_pre) (AZ) (BZ) (Scale) (OZ) (Lo) (Hi)) )
  **  (CharArray.undef_full output batch )
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "a_zero_point")) # Char  |-> AZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "b_zero_point")) # Char  |-> BZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "scale")) # Float  |-> Scale)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_zero_point")) # Short  |-> OZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_min")) # Char  |-> Lo)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_max")) # Char  |-> Hi)
  **  ((( &( "a_zero_point" ) )) # Char  |-> AZ)
  **  ((( &( "b_zero_point" ) )) # Char  |-> BZ)
  **  ((( &( "scale" ) )) # Float  |-> Scale)
  **  ((( &( "output_zero_point" ) )) # Short  |-> OZ)
  **  ((( &( "output_min" ) )) # Char  |-> Lo)
  **  ((( &( "output_max" ) )) # Char  |-> Hi)
|--
  “ (rd_window M (input_a_pre + ((batch_pre - batch ) * 1)) retval ) ”
.

Definition test_rvv_partial_solve_wit_7_pure_split_goal_2 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (Hi: Z) (Lo: Z) (OZ: Z) (Scale: fp32) (BZ: Z) (AZ: Z) (M: RDMap) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (retval: Z) (PreH1 : (batch <= UINT64_MAX)) (PreH2 : (retval <= UINT64_MAX)) (PreH3 : (batch >= 0)) (PreH4 : (retval >= 0)) (PreH5 : (qm_vl_allowed batch retval )) (PreH6 : (1 <= retval)) (PreH7 : (retval <= 32)) (PreH8 : (retval <= batch)) (PreH9 : (batch > 0)) (PreH10 : (0 < batch_pre)) (PreH11 : (batch_pre <= UINT64_MAX)) (PreH12 : (input_a_pre <> 0)) (PreH13 : (input_b_pre <> 0)) (PreH14 : (output_pre <> 0)) (PreH15 : (params_pre <> 0)) (PreH16 : ((-128) <= AZ)) (PreH17 : (AZ <= 127)) (PreH18 : ((-128) <= BZ)) (PreH19 : (BZ <= 127)) (PreH20 : ((-32768) <= OZ)) (PreH21 : (OZ <= 32767)) (PreH22 : ((-128) <= Lo)) (PreH23 : (Lo <= 127)) (PreH24 : ((-128) <= Hi)) (PreH25 : (Hi <= 127)) (PreH26 : (qm_inputs M input_a_pre input_b_pre batch_pre )) (PreH27 : (sizeof(CHAR) = 1)) (PreH28 : (0 <= batch)) (PreH29 : (batch <= batch_pre)) (PreH30 : (input_a = (input_a_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH31 : (input_b = (input_b_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH32 : (output = (output_pre + ((batch_pre - batch ) * sizeof(CHAR))))) ,
  (UndefStructPredvint8m2_t ( &( "va" ) ) )
  **  ((( &( "vl" ) )) # UInt64  |-> retval)
  **  ((( &( "batch" ) )) # UInt64  |-> batch)
  **  ((( &( "input_a" ) )) # Ptr  |-> input_a)
  **  ((( &( "input_b" ) )) # Ptr  |-> input_b)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (rd_mem M )
  **  (CharArray.full output_pre (batch_pre - batch ) (qm_values ((batch_pre - batch )) (M) (input_a_pre) (input_b_pre) (AZ) (BZ) (Scale) (OZ) (Lo) (Hi)) )
  **  (CharArray.undef_full output batch )
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "a_zero_point")) # Char  |-> AZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "b_zero_point")) # Char  |-> BZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "scale")) # Float  |-> Scale)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_zero_point")) # Short  |-> OZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_min")) # Char  |-> Lo)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_max")) # Char  |-> Hi)
  **  ((( &( "a_zero_point" ) )) # Char  |-> AZ)
  **  ((( &( "b_zero_point" ) )) # Char  |-> BZ)
  **  ((( &( "scale" ) )) # Float  |-> Scale)
  **  ((( &( "output_zero_point" ) )) # Short  |-> OZ)
  **  ((( &( "output_min" ) )) # Char  |-> Lo)
  **  ((( &( "output_max" ) )) # Char  |-> Hi)
|--
  “ (rd_window M input_a retval ) ”
.

Definition test_rvv_partial_solve_wit_7_aux := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (Hi: Z) (Lo: Z) (OZ: Z) (Scale: fp32) (BZ: Z) (AZ: Z) (M: RDMap) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (retval: Z) (PreH1 : (qm_vl_allowed batch retval )) (PreH2 : (1 <= retval)) (PreH3 : (retval <= 32)) (PreH4 : (retval <= batch)) (PreH5 : (batch > 0)) (PreH6 : (0 < batch_pre)) (PreH7 : (batch_pre <= UINT64_MAX)) (PreH8 : (input_a_pre <> 0)) (PreH9 : (input_b_pre <> 0)) (PreH10 : (output_pre <> 0)) (PreH11 : (params_pre <> 0)) (PreH12 : ((-128) <= AZ)) (PreH13 : (AZ <= 127)) (PreH14 : ((-128) <= BZ)) (PreH15 : (BZ <= 127)) (PreH16 : ((-32768) <= OZ)) (PreH17 : (OZ <= 32767)) (PreH18 : ((-128) <= Lo)) (PreH19 : (Lo <= 127)) (PreH20 : ((-128) <= Hi)) (PreH21 : (Hi <= 127)) (PreH22 : (qm_inputs M input_a_pre input_b_pre batch_pre )) (PreH23 : (sizeof(CHAR) = 1)) (PreH24 : (0 <= batch)) (PreH25 : (batch <= batch_pre)) (PreH26 : (input_a = (input_a_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH27 : (input_b = (input_b_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH28 : (output = (output_pre + ((batch_pre - batch ) * sizeof(CHAR))))) ,
  (UndefStructPredvint8m2_t ( &( "va" ) ) )
  **  (rd_mem M )
  **  (CharArray.full output_pre (batch_pre - batch ) (qm_values ((batch_pre - batch )) (M) (input_a_pre) (input_b_pre) (AZ) (BZ) (Scale) (OZ) (Lo) (Hi)) )
  **  (CharArray.undef_full output batch )
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "a_zero_point")) # Char  |-> AZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "b_zero_point")) # Char  |-> BZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "scale")) # Float  |-> Scale)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_zero_point")) # Short  |-> OZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_min")) # Char  |-> Lo)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_max")) # Char  |-> Hi)
|--
  “ (0 <= retval) ” 
  &&  “ (retval <= 32) ” 
  &&  “ (rd_window M input_a retval ) ” 
  &&  “ (rd_window M (input_a_pre + ((batch_pre - batch ) * 1)) retval ) ” 
  &&  “ (qm_vl_allowed batch retval ) ” 
  &&  “ (1 <= retval) ” 
  &&  “ (retval <= 32) ” 
  &&  “ (retval <= batch) ” 
  &&  “ (batch > 0) ” 
  &&  “ (0 < batch_pre) ” 
  &&  “ (batch_pre <= UINT64_MAX) ” 
  &&  “ (input_a_pre <> 0) ” 
  &&  “ (input_b_pre <> 0) ” 
  &&  “ (output_pre <> 0) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ ((-128) <= AZ) ” 
  &&  “ (AZ <= 127) ” 
  &&  “ ((-128) <= BZ) ” 
  &&  “ (BZ <= 127) ” 
  &&  “ ((-32768) <= OZ) ” 
  &&  “ (OZ <= 32767) ” 
  &&  “ ((-128) <= Lo) ” 
  &&  “ (Lo <= 127) ” 
  &&  “ ((-128) <= Hi) ” 
  &&  “ (Hi <= 127) ” 
  &&  “ (qm_inputs M input_a_pre input_b_pre batch_pre ) ” 
  &&  “ (sizeof(CHAR) = 1) ” 
  &&  “ (0 <= batch) ” 
  &&  “ (batch <= batch_pre) ” 
  &&  “ (input_a = (input_a_pre + ((batch_pre - batch ) * sizeof(CHAR)))) ” 
  &&  “ (input_b = (input_b_pre + ((batch_pre - batch ) * sizeof(CHAR)))) ” 
  &&  “ (output = (output_pre + ((batch_pre - batch ) * sizeof(CHAR)))) ”
  &&  (rd_mem M )
  **  (UndefStructPredvint8m2_t ( &( "va" ) ) )
  **  (CharArray.full output_pre (batch_pre - batch ) (qm_values ((batch_pre - batch )) (M) (input_a_pre) (input_b_pre) (AZ) (BZ) (Scale) (OZ) (Lo) (Hi)) )
  **  (CharArray.undef_full output batch )
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "a_zero_point")) # Char  |-> AZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "b_zero_point")) # Char  |-> BZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "scale")) # Float  |-> Scale)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_zero_point")) # Short  |-> OZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_min")) # Char  |-> Lo)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_max")) # Char  |-> Hi)
.

Definition test_rvv_partial_solve_wit_7 := test_rvv_partial_solve_wit_7_pure -> test_rvv_partial_solve_wit_7_aux.

Definition test_rvv_partial_solve_wit_8_pure := 
(
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (Hi: Z) (Lo: Z) (OZ: Z) (Scale: fp32) (BZ: Z) (AZ: Z) (M: RDMap) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (retval: Z) (R: Recordvint8m2_t) (PreH1 : (qm_record_load_match M input_a retval R )) (PreH2 : (qm_vl_allowed batch retval )) (PreH3 : (1 <= retval)) (PreH4 : (retval <= 32)) (PreH5 : (retval <= batch)) (PreH6 : (batch > 0)) (PreH7 : (0 < batch_pre)) (PreH8 : (batch_pre <= UINT64_MAX)) (PreH9 : (input_a_pre <> 0)) (PreH10 : (input_b_pre <> 0)) (PreH11 : (output_pre <> 0)) (PreH12 : (params_pre <> 0)) (PreH13 : ((-128) <= AZ)) (PreH14 : (AZ <= 127)) (PreH15 : ((-128) <= BZ)) (PreH16 : (BZ <= 127)) (PreH17 : ((-32768) <= OZ)) (PreH18 : (OZ <= 32767)) (PreH19 : ((-128) <= Lo)) (PreH20 : (Lo <= 127)) (PreH21 : ((-128) <= Hi)) (PreH22 : (Hi <= 127)) (PreH23 : (qm_inputs M input_a_pre input_b_pre batch_pre )) (PreH24 : (sizeof(CHAR) = 1)) (PreH25 : (0 <= batch)) (PreH26 : (batch <= batch_pre)) (PreH27 : (input_a = (input_a_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH28 : (input_b = (input_b_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH29 : (output = (output_pre + ((batch_pre - batch ) * sizeof(CHAR))))) ,
  (UndefStructPredvint8m2_t ( &( "vb" ) ) )
  **  (rd_mem M )
  **  (StructPredvint8m2_t ( &( "va" ) ) R )
  **  ((( &( "vl" ) )) # UInt64  |-> retval)
  **  ((( &( "batch" ) )) # UInt64  |-> batch)
  **  ((( &( "input_a" ) )) # Ptr  |-> input_a)
  **  ((( &( "input_b" ) )) # Ptr  |-> input_b)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (CharArray.full output_pre (batch_pre - batch ) (qm_values ((batch_pre - batch )) (M) (input_a_pre) (input_b_pre) (AZ) (BZ) (Scale) (OZ) (Lo) (Hi)) )
  **  (CharArray.undef_full output batch )
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "a_zero_point")) # Char  |-> AZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "b_zero_point")) # Char  |-> BZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "scale")) # Float  |-> Scale)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_zero_point")) # Short  |-> OZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_min")) # Char  |-> Lo)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_max")) # Char  |-> Hi)
  **  ((( &( "a_zero_point" ) )) # Char  |-> AZ)
  **  ((( &( "b_zero_point" ) )) # Char  |-> BZ)
  **  ((( &( "scale" ) )) # Float  |-> Scale)
  **  ((( &( "output_zero_point" ) )) # Short  |-> OZ)
  **  ((( &( "output_min" ) )) # Char  |-> Lo)
  **  ((( &( "output_max" ) )) # Char  |-> Hi)
|--
  “ (0 <= retval) ” 
  &&  “ (retval <= 32) ” 
  &&  “ (rd_window M input_b retval ) ” 
  &&  “ (rd_window M (input_b_pre + ((batch_pre - batch ) * 1)) retval ) ”
) \/
(
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (Hi: Z) (Lo: Z) (OZ: Z) (Scale: fp32) (BZ: Z) (AZ: Z) (M: RDMap) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (retval: Z) (R: Recordvint8m2_t) (PreH1 : (batch <= UINT64_MAX)) (PreH2 : (retval <= UINT64_MAX)) (PreH3 : (batch >= 0)) (PreH4 : (retval >= 0)) (PreH5 : (qm_record_load_match M input_a retval R )) (PreH6 : (qm_vl_allowed batch retval )) (PreH7 : (1 <= retval)) (PreH8 : (retval <= 32)) (PreH9 : (retval <= batch)) (PreH10 : (batch > 0)) (PreH11 : (0 < batch_pre)) (PreH12 : (batch_pre <= UINT64_MAX)) (PreH13 : (input_a_pre <> 0)) (PreH14 : (input_b_pre <> 0)) (PreH15 : (output_pre <> 0)) (PreH16 : (params_pre <> 0)) (PreH17 : ((-128) <= AZ)) (PreH18 : (AZ <= 127)) (PreH19 : ((-128) <= BZ)) (PreH20 : (BZ <= 127)) (PreH21 : ((-32768) <= OZ)) (PreH22 : (OZ <= 32767)) (PreH23 : ((-128) <= Lo)) (PreH24 : (Lo <= 127)) (PreH25 : ((-128) <= Hi)) (PreH26 : (Hi <= 127)) (PreH27 : (qm_inputs M input_a_pre input_b_pre batch_pre )) (PreH28 : (sizeof(CHAR) = 1)) (PreH29 : (0 <= batch)) (PreH30 : (batch <= batch_pre)) (PreH31 : (input_a = (input_a_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH32 : (input_b = (input_b_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH33 : (output = (output_pre + ((batch_pre - batch ) * sizeof(CHAR))))) ,
  (UndefStructPredvint8m2_t ( &( "vb" ) ) )
  **  (rd_mem M )
  **  (StructPredvint8m2_t ( &( "va" ) ) R )
  **  ((( &( "vl" ) )) # UInt64  |-> retval)
  **  ((( &( "batch" ) )) # UInt64  |-> batch)
  **  ((( &( "input_a" ) )) # Ptr  |-> input_a)
  **  ((( &( "input_b" ) )) # Ptr  |-> input_b)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (CharArray.full output_pre (batch_pre - batch ) (qm_values ((batch_pre - batch )) (M) (input_a_pre) (input_b_pre) (AZ) (BZ) (Scale) (OZ) (Lo) (Hi)) )
  **  (CharArray.undef_full output batch )
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "a_zero_point")) # Char  |-> AZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "b_zero_point")) # Char  |-> BZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "scale")) # Float  |-> Scale)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_zero_point")) # Short  |-> OZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_min")) # Char  |-> Lo)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_max")) # Char  |-> Hi)
  **  ((( &( "a_zero_point" ) )) # Char  |-> AZ)
  **  ((( &( "b_zero_point" ) )) # Char  |-> BZ)
  **  ((( &( "scale" ) )) # Float  |-> Scale)
  **  ((( &( "output_zero_point" ) )) # Short  |-> OZ)
  **  ((( &( "output_min" ) )) # Char  |-> Lo)
  **  ((( &( "output_max" ) )) # Char  |-> Hi)
|--
  “ (rd_window M (input_b_pre + ((batch_pre - batch ) * 1)) retval ) ” 
  &&  “ (rd_window M input_b retval ) ”
).

Definition test_rvv_partial_solve_wit_8_pure_split_goal_1 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (Hi: Z) (Lo: Z) (OZ: Z) (Scale: fp32) (BZ: Z) (AZ: Z) (M: RDMap) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (retval: Z) (R: Recordvint8m2_t) (PreH1 : (batch <= UINT64_MAX)) (PreH2 : (retval <= UINT64_MAX)) (PreH3 : (batch >= 0)) (PreH4 : (retval >= 0)) (PreH5 : (qm_record_load_match M input_a retval R )) (PreH6 : (qm_vl_allowed batch retval )) (PreH7 : (1 <= retval)) (PreH8 : (retval <= 32)) (PreH9 : (retval <= batch)) (PreH10 : (batch > 0)) (PreH11 : (0 < batch_pre)) (PreH12 : (batch_pre <= UINT64_MAX)) (PreH13 : (input_a_pre <> 0)) (PreH14 : (input_b_pre <> 0)) (PreH15 : (output_pre <> 0)) (PreH16 : (params_pre <> 0)) (PreH17 : ((-128) <= AZ)) (PreH18 : (AZ <= 127)) (PreH19 : ((-128) <= BZ)) (PreH20 : (BZ <= 127)) (PreH21 : ((-32768) <= OZ)) (PreH22 : (OZ <= 32767)) (PreH23 : ((-128) <= Lo)) (PreH24 : (Lo <= 127)) (PreH25 : ((-128) <= Hi)) (PreH26 : (Hi <= 127)) (PreH27 : (qm_inputs M input_a_pre input_b_pre batch_pre )) (PreH28 : (sizeof(CHAR) = 1)) (PreH29 : (0 <= batch)) (PreH30 : (batch <= batch_pre)) (PreH31 : (input_a = (input_a_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH32 : (input_b = (input_b_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH33 : (output = (output_pre + ((batch_pre - batch ) * sizeof(CHAR))))) ,
  (UndefStructPredvint8m2_t ( &( "vb" ) ) )
  **  (rd_mem M )
  **  (StructPredvint8m2_t ( &( "va" ) ) R )
  **  ((( &( "vl" ) )) # UInt64  |-> retval)
  **  ((( &( "batch" ) )) # UInt64  |-> batch)
  **  ((( &( "input_a" ) )) # Ptr  |-> input_a)
  **  ((( &( "input_b" ) )) # Ptr  |-> input_b)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (CharArray.full output_pre (batch_pre - batch ) (qm_values ((batch_pre - batch )) (M) (input_a_pre) (input_b_pre) (AZ) (BZ) (Scale) (OZ) (Lo) (Hi)) )
  **  (CharArray.undef_full output batch )
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "a_zero_point")) # Char  |-> AZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "b_zero_point")) # Char  |-> BZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "scale")) # Float  |-> Scale)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_zero_point")) # Short  |-> OZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_min")) # Char  |-> Lo)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_max")) # Char  |-> Hi)
  **  ((( &( "a_zero_point" ) )) # Char  |-> AZ)
  **  ((( &( "b_zero_point" ) )) # Char  |-> BZ)
  **  ((( &( "scale" ) )) # Float  |-> Scale)
  **  ((( &( "output_zero_point" ) )) # Short  |-> OZ)
  **  ((( &( "output_min" ) )) # Char  |-> Lo)
  **  ((( &( "output_max" ) )) # Char  |-> Hi)
|--
  “ (rd_window M (input_b_pre + ((batch_pre - batch ) * 1)) retval ) ”
.

Definition test_rvv_partial_solve_wit_8_pure_split_goal_2 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (Hi: Z) (Lo: Z) (OZ: Z) (Scale: fp32) (BZ: Z) (AZ: Z) (M: RDMap) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (retval: Z) (R: Recordvint8m2_t) (PreH1 : (batch <= UINT64_MAX)) (PreH2 : (retval <= UINT64_MAX)) (PreH3 : (batch >= 0)) (PreH4 : (retval >= 0)) (PreH5 : (qm_record_load_match M input_a retval R )) (PreH6 : (qm_vl_allowed batch retval )) (PreH7 : (1 <= retval)) (PreH8 : (retval <= 32)) (PreH9 : (retval <= batch)) (PreH10 : (batch > 0)) (PreH11 : (0 < batch_pre)) (PreH12 : (batch_pre <= UINT64_MAX)) (PreH13 : (input_a_pre <> 0)) (PreH14 : (input_b_pre <> 0)) (PreH15 : (output_pre <> 0)) (PreH16 : (params_pre <> 0)) (PreH17 : ((-128) <= AZ)) (PreH18 : (AZ <= 127)) (PreH19 : ((-128) <= BZ)) (PreH20 : (BZ <= 127)) (PreH21 : ((-32768) <= OZ)) (PreH22 : (OZ <= 32767)) (PreH23 : ((-128) <= Lo)) (PreH24 : (Lo <= 127)) (PreH25 : ((-128) <= Hi)) (PreH26 : (Hi <= 127)) (PreH27 : (qm_inputs M input_a_pre input_b_pre batch_pre )) (PreH28 : (sizeof(CHAR) = 1)) (PreH29 : (0 <= batch)) (PreH30 : (batch <= batch_pre)) (PreH31 : (input_a = (input_a_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH32 : (input_b = (input_b_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH33 : (output = (output_pre + ((batch_pre - batch ) * sizeof(CHAR))))) ,
  (UndefStructPredvint8m2_t ( &( "vb" ) ) )
  **  (rd_mem M )
  **  (StructPredvint8m2_t ( &( "va" ) ) R )
  **  ((( &( "vl" ) )) # UInt64  |-> retval)
  **  ((( &( "batch" ) )) # UInt64  |-> batch)
  **  ((( &( "input_a" ) )) # Ptr  |-> input_a)
  **  ((( &( "input_b" ) )) # Ptr  |-> input_b)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (CharArray.full output_pre (batch_pre - batch ) (qm_values ((batch_pre - batch )) (M) (input_a_pre) (input_b_pre) (AZ) (BZ) (Scale) (OZ) (Lo) (Hi)) )
  **  (CharArray.undef_full output batch )
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "a_zero_point")) # Char  |-> AZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "b_zero_point")) # Char  |-> BZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "scale")) # Float  |-> Scale)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_zero_point")) # Short  |-> OZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_min")) # Char  |-> Lo)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_max")) # Char  |-> Hi)
  **  ((( &( "a_zero_point" ) )) # Char  |-> AZ)
  **  ((( &( "b_zero_point" ) )) # Char  |-> BZ)
  **  ((( &( "scale" ) )) # Float  |-> Scale)
  **  ((( &( "output_zero_point" ) )) # Short  |-> OZ)
  **  ((( &( "output_min" ) )) # Char  |-> Lo)
  **  ((( &( "output_max" ) )) # Char  |-> Hi)
|--
  “ (rd_window M input_b retval ) ”
.

Definition test_rvv_partial_solve_wit_8_aux := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (Hi: Z) (Lo: Z) (OZ: Z) (Scale: fp32) (BZ: Z) (AZ: Z) (M: RDMap) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (retval: Z) (R: Recordvint8m2_t) (PreH1 : (qm_record_load_match M input_a retval R )) (PreH2 : (qm_vl_allowed batch retval )) (PreH3 : (1 <= retval)) (PreH4 : (retval <= 32)) (PreH5 : (retval <= batch)) (PreH6 : (batch > 0)) (PreH7 : (0 < batch_pre)) (PreH8 : (batch_pre <= UINT64_MAX)) (PreH9 : (input_a_pre <> 0)) (PreH10 : (input_b_pre <> 0)) (PreH11 : (output_pre <> 0)) (PreH12 : (params_pre <> 0)) (PreH13 : ((-128) <= AZ)) (PreH14 : (AZ <= 127)) (PreH15 : ((-128) <= BZ)) (PreH16 : (BZ <= 127)) (PreH17 : ((-32768) <= OZ)) (PreH18 : (OZ <= 32767)) (PreH19 : ((-128) <= Lo)) (PreH20 : (Lo <= 127)) (PreH21 : ((-128) <= Hi)) (PreH22 : (Hi <= 127)) (PreH23 : (qm_inputs M input_a_pre input_b_pre batch_pre )) (PreH24 : (sizeof(CHAR) = 1)) (PreH25 : (0 <= batch)) (PreH26 : (batch <= batch_pre)) (PreH27 : (input_a = (input_a_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH28 : (input_b = (input_b_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH29 : (output = (output_pre + ((batch_pre - batch ) * sizeof(CHAR))))) ,
  (UndefStructPredvint8m2_t ( &( "vb" ) ) )
  **  (rd_mem M )
  **  (StructPredvint8m2_t ( &( "va" ) ) R )
  **  (CharArray.full output_pre (batch_pre - batch ) (qm_values ((batch_pre - batch )) (M) (input_a_pre) (input_b_pre) (AZ) (BZ) (Scale) (OZ) (Lo) (Hi)) )
  **  (CharArray.undef_full output batch )
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "a_zero_point")) # Char  |-> AZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "b_zero_point")) # Char  |-> BZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "scale")) # Float  |-> Scale)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_zero_point")) # Short  |-> OZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_min")) # Char  |-> Lo)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_max")) # Char  |-> Hi)
|--
  “ (0 <= retval) ” 
  &&  “ (retval <= 32) ” 
  &&  “ (rd_window M input_b retval ) ” 
  &&  “ (rd_window M (input_b_pre + ((batch_pre - batch ) * 1)) retval ) ” 
  &&  “ (qm_record_load_match M input_a retval R ) ” 
  &&  “ (qm_vl_allowed batch retval ) ” 
  &&  “ (1 <= retval) ” 
  &&  “ (retval <= 32) ” 
  &&  “ (retval <= batch) ” 
  &&  “ (batch > 0) ” 
  &&  “ (0 < batch_pre) ” 
  &&  “ (batch_pre <= UINT64_MAX) ” 
  &&  “ (input_a_pre <> 0) ” 
  &&  “ (input_b_pre <> 0) ” 
  &&  “ (output_pre <> 0) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ ((-128) <= AZ) ” 
  &&  “ (AZ <= 127) ” 
  &&  “ ((-128) <= BZ) ” 
  &&  “ (BZ <= 127) ” 
  &&  “ ((-32768) <= OZ) ” 
  &&  “ (OZ <= 32767) ” 
  &&  “ ((-128) <= Lo) ” 
  &&  “ (Lo <= 127) ” 
  &&  “ ((-128) <= Hi) ” 
  &&  “ (Hi <= 127) ” 
  &&  “ (qm_inputs M input_a_pre input_b_pre batch_pre ) ” 
  &&  “ (sizeof(CHAR) = 1) ” 
  &&  “ (0 <= batch) ” 
  &&  “ (batch <= batch_pre) ” 
  &&  “ (input_a = (input_a_pre + ((batch_pre - batch ) * sizeof(CHAR)))) ” 
  &&  “ (input_b = (input_b_pre + ((batch_pre - batch ) * sizeof(CHAR)))) ” 
  &&  “ (output = (output_pre + ((batch_pre - batch ) * sizeof(CHAR)))) ”
  &&  (rd_mem M )
  **  (UndefStructPredvint8m2_t ( &( "vb" ) ) )
  **  (StructPredvint8m2_t ( &( "va" ) ) R )
  **  (CharArray.full output_pre (batch_pre - batch ) (qm_values ((batch_pre - batch )) (M) (input_a_pre) (input_b_pre) (AZ) (BZ) (Scale) (OZ) (Lo) (Hi)) )
  **  (CharArray.undef_full output batch )
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "a_zero_point")) # Char  |-> AZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "b_zero_point")) # Char  |-> BZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "scale")) # Float  |-> Scale)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_zero_point")) # Short  |-> OZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_min")) # Char  |-> Lo)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_max")) # Char  |-> Hi)
.

Definition test_rvv_partial_solve_wit_8 := test_rvv_partial_solve_wit_8_pure -> test_rvv_partial_solve_wit_8_aux.

Definition test_rvv_partial_solve_wit_9_pure := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (Hi: Z) (Lo: Z) (OZ: Z) (Scale: fp32) (BZ: Z) (AZ: Z) (M: RDMap) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (retval: Z) (R: Recordvint8m2_t) (R_2: Recordvint8m2_t) (PreH1 : (qm_record_load_match M input_b retval R_2 )) (PreH2 : (qm_record_load_match M input_a retval R )) (PreH3 : (qm_vl_allowed batch retval )) (PreH4 : (1 <= retval)) (PreH5 : (retval <= 32)) (PreH6 : (retval <= batch)) (PreH7 : (batch > 0)) (PreH8 : (0 < batch_pre)) (PreH9 : (batch_pre <= UINT64_MAX)) (PreH10 : (input_a_pre <> 0)) (PreH11 : (input_b_pre <> 0)) (PreH12 : (output_pre <> 0)) (PreH13 : (params_pre <> 0)) (PreH14 : ((-128) <= AZ)) (PreH15 : (AZ <= 127)) (PreH16 : ((-128) <= BZ)) (PreH17 : (BZ <= 127)) (PreH18 : ((-32768) <= OZ)) (PreH19 : (OZ <= 32767)) (PreH20 : ((-128) <= Lo)) (PreH21 : (Lo <= 127)) (PreH22 : ((-128) <= Hi)) (PreH23 : (Hi <= 127)) (PreH24 : (qm_inputs M input_a_pre input_b_pre batch_pre )) (PreH25 : (sizeof(CHAR) = 1)) (PreH26 : (0 <= batch)) (PreH27 : (batch <= batch_pre)) (PreH28 : (input_a = (input_a_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH29 : (input_b = (input_b_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH30 : (output = (output_pre + ((batch_pre - batch ) * sizeof(CHAR))))) ,
  (UndefStructPredvint8m2_t ( &( "vout" ) ) )
  **  (rd_mem M )
  **  (StructPredvint8m2_t ( &( "vb" ) ) R_2 )
  **  (StructPredvint8m2_t ( &( "va" ) ) R )
  **  ((( &( "vl" ) )) # UInt64  |-> retval)
  **  ((( &( "batch" ) )) # UInt64  |-> batch)
  **  ((( &( "input_a" ) )) # Ptr  |-> input_a)
  **  ((( &( "input_b" ) )) # Ptr  |-> input_b)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (CharArray.full output_pre (batch_pre - batch ) (qm_values ((batch_pre - batch )) (M) (input_a_pre) (input_b_pre) (AZ) (BZ) (Scale) (OZ) (Lo) (Hi)) )
  **  (CharArray.undef_full output batch )
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "a_zero_point")) # Char  |-> AZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "b_zero_point")) # Char  |-> BZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "scale")) # Float  |-> Scale)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_zero_point")) # Short  |-> OZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_min")) # Char  |-> Lo)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_max")) # Char  |-> Hi)
  **  ((( &( "a_zero_point" ) )) # Char  |-> AZ)
  **  ((( &( "b_zero_point" ) )) # Char  |-> BZ)
  **  ((( &( "scale" ) )) # Float  |-> Scale)
  **  ((( &( "output_zero_point" ) )) # Short  |-> OZ)
  **  ((( &( "output_min" ) )) # Char  |-> Lo)
  **  ((( &( "output_max" ) )) # Char  |-> Hi)
|--
  “ (0 <= retval) ” 
  &&  “ (retval <= 32) ”
.

Definition test_rvv_partial_solve_wit_9_aux := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (Hi: Z) (Lo: Z) (OZ: Z) (Scale: fp32) (BZ: Z) (AZ: Z) (M: RDMap) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (retval: Z) (R: Recordvint8m2_t) (R_2: Recordvint8m2_t) (PreH1 : (qm_record_load_match M input_b retval R_2 )) (PreH2 : (qm_record_load_match M input_a retval R )) (PreH3 : (qm_vl_allowed batch retval )) (PreH4 : (1 <= retval)) (PreH5 : (retval <= 32)) (PreH6 : (retval <= batch)) (PreH7 : (batch > 0)) (PreH8 : (0 < batch_pre)) (PreH9 : (batch_pre <= UINT64_MAX)) (PreH10 : (input_a_pre <> 0)) (PreH11 : (input_b_pre <> 0)) (PreH12 : (output_pre <> 0)) (PreH13 : (params_pre <> 0)) (PreH14 : ((-128) <= AZ)) (PreH15 : (AZ <= 127)) (PreH16 : ((-128) <= BZ)) (PreH17 : (BZ <= 127)) (PreH18 : ((-32768) <= OZ)) (PreH19 : (OZ <= 32767)) (PreH20 : ((-128) <= Lo)) (PreH21 : (Lo <= 127)) (PreH22 : ((-128) <= Hi)) (PreH23 : (Hi <= 127)) (PreH24 : (qm_inputs M input_a_pre input_b_pre batch_pre )) (PreH25 : (sizeof(CHAR) = 1)) (PreH26 : (0 <= batch)) (PreH27 : (batch <= batch_pre)) (PreH28 : (input_a = (input_a_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH29 : (input_b = (input_b_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH30 : (output = (output_pre + ((batch_pre - batch ) * sizeof(CHAR))))) ,
  (UndefStructPredvint8m2_t ( &( "vout" ) ) )
  **  (rd_mem M )
  **  (StructPredvint8m2_t ( &( "vb" ) ) R_2 )
  **  (StructPredvint8m2_t ( &( "va" ) ) R )
  **  (CharArray.full output_pre (batch_pre - batch ) (qm_values ((batch_pre - batch )) (M) (input_a_pre) (input_b_pre) (AZ) (BZ) (Scale) (OZ) (Lo) (Hi)) )
  **  (CharArray.undef_full output batch )
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "a_zero_point")) # Char  |-> AZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "b_zero_point")) # Char  |-> BZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "scale")) # Float  |-> Scale)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_zero_point")) # Short  |-> OZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_min")) # Char  |-> Lo)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_max")) # Char  |-> Hi)
|--
  “ (0 <= retval) ” 
  &&  “ (retval <= 32) ” 
  &&  “ (qm_record_load_match M input_b retval R_2 ) ” 
  &&  “ (qm_record_load_match M input_a retval R ) ” 
  &&  “ (qm_vl_allowed batch retval ) ” 
  &&  “ (1 <= retval) ” 
  &&  “ (retval <= 32) ” 
  &&  “ (retval <= batch) ” 
  &&  “ (batch > 0) ” 
  &&  “ (0 < batch_pre) ” 
  &&  “ (batch_pre <= UINT64_MAX) ” 
  &&  “ (input_a_pre <> 0) ” 
  &&  “ (input_b_pre <> 0) ” 
  &&  “ (output_pre <> 0) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ ((-128) <= AZ) ” 
  &&  “ (AZ <= 127) ” 
  &&  “ ((-128) <= BZ) ” 
  &&  “ (BZ <= 127) ” 
  &&  “ ((-32768) <= OZ) ” 
  &&  “ (OZ <= 32767) ” 
  &&  “ ((-128) <= Lo) ” 
  &&  “ (Lo <= 127) ” 
  &&  “ ((-128) <= Hi) ” 
  &&  “ (Hi <= 127) ” 
  &&  “ (qm_inputs M input_a_pre input_b_pre batch_pre ) ” 
  &&  “ (sizeof(CHAR) = 1) ” 
  &&  “ (0 <= batch) ” 
  &&  “ (batch <= batch_pre) ” 
  &&  “ (input_a = (input_a_pre + ((batch_pre - batch ) * sizeof(CHAR)))) ” 
  &&  “ (input_b = (input_b_pre + ((batch_pre - batch ) * sizeof(CHAR)))) ” 
  &&  “ (output = (output_pre + ((batch_pre - batch ) * sizeof(CHAR)))) ”
  &&  (StructPredvint8m2_t ( &( "va" ) ) R )
  **  (StructPredvint8m2_t ( &( "vb" ) ) R_2 )
  **  (UndefStructPredvint8m2_t ( &( "vout" ) ) )
  **  (rd_mem M )
  **  (CharArray.full output_pre (batch_pre - batch ) (qm_values ((batch_pre - batch )) (M) (input_a_pre) (input_b_pre) (AZ) (BZ) (Scale) (OZ) (Lo) (Hi)) )
  **  (CharArray.undef_full output batch )
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "a_zero_point")) # Char  |-> AZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "b_zero_point")) # Char  |-> BZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "scale")) # Float  |-> Scale)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_zero_point")) # Short  |-> OZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_min")) # Char  |-> Lo)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_max")) # Char  |-> Hi)
.

Definition test_rvv_partial_solve_wit_9 := test_rvv_partial_solve_wit_9_pure -> test_rvv_partial_solve_wit_9_aux.

Definition test_rvv_partial_solve_wit_10 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (Hi: Z) (Lo: Z) (OZ: Z) (Scale: fp32) (BZ: Z) (AZ: Z) (M: RDMap) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (retval: Z) (R: Recordvint8m2_t) (R_2: Recordvint8m2_t) (R_3: Recordvint8m2_t) (retval_2: Z) (PreH1 : (qm_record_compute_match retval R R_2 R_3 AZ BZ Scale OZ Lo Hi )) (PreH2 : (qm_record_load_match M input_b retval R_2 )) (PreH3 : (qm_record_load_match M input_a retval R )) (PreH4 : (qm_vl_allowed batch retval )) (PreH5 : (1 <= retval)) (PreH6 : (retval <= 32)) (PreH7 : (retval <= batch)) (PreH8 : (batch > 0)) (PreH9 : (0 < batch_pre)) (PreH10 : (batch_pre <= UINT64_MAX)) (PreH11 : (input_a_pre <> 0)) (PreH12 : (input_b_pre <> 0)) (PreH13 : (output_pre <> 0)) (PreH14 : (params_pre <> 0)) (PreH15 : ((-128) <= AZ)) (PreH16 : (AZ <= 127)) (PreH17 : ((-128) <= BZ)) (PreH18 : (BZ <= 127)) (PreH19 : ((-32768) <= OZ)) (PreH20 : (OZ <= 32767)) (PreH21 : ((-128) <= Lo)) (PreH22 : (Lo <= 127)) (PreH23 : ((-128) <= Hi)) (PreH24 : (Hi <= 127)) (PreH25 : (qm_inputs M input_a_pre input_b_pre batch_pre )) (PreH26 : (sizeof(CHAR) = 1)) (PreH27 : (0 <= batch)) (PreH28 : (batch <= batch_pre)) (PreH29 : (input_a = (input_a_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH30 : (input_b = (input_b_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH31 : (output = (output_pre + ((batch_pre - batch ) * sizeof(CHAR))))) ,
  (StructPredvint8m2_t ( &( "va" ) ) R )
  **  (StructPredvint8m2_t ( &( "vb" ) ) R_2 )
  **  (StructPredvint8m2_t retval_2 R_3 )
  **  (UndefStructPredvint8m2_t ( &( "vout" ) ) )
  **  (rd_mem M )
  **  (CharArray.full output_pre (batch_pre - batch ) (qm_values ((batch_pre - batch )) (M) (input_a_pre) (input_b_pre) (AZ) (BZ) (Scale) (OZ) (Lo) (Hi)) )
  **  (CharArray.undef_full output batch )
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "a_zero_point")) # Char  |-> AZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "b_zero_point")) # Char  |-> BZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "scale")) # Float  |-> Scale)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_zero_point")) # Short  |-> OZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_min")) # Char  |-> Lo)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_max")) # Char  |-> Hi)
|--
  “ (qm_record_compute_match retval R R_2 R_3 AZ BZ Scale OZ Lo Hi ) ” 
  &&  “ (qm_record_load_match M input_b retval R_2 ) ” 
  &&  “ (qm_record_load_match M input_a retval R ) ” 
  &&  “ (qm_vl_allowed batch retval ) ” 
  &&  “ (1 <= retval) ” 
  &&  “ (retval <= 32) ” 
  &&  “ (retval <= batch) ” 
  &&  “ (batch > 0) ” 
  &&  “ (0 < batch_pre) ” 
  &&  “ (batch_pre <= UINT64_MAX) ” 
  &&  “ (input_a_pre <> 0) ” 
  &&  “ (input_b_pre <> 0) ” 
  &&  “ (output_pre <> 0) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ ((-128) <= AZ) ” 
  &&  “ (AZ <= 127) ” 
  &&  “ ((-128) <= BZ) ” 
  &&  “ (BZ <= 127) ” 
  &&  “ ((-32768) <= OZ) ” 
  &&  “ (OZ <= 32767) ” 
  &&  “ ((-128) <= Lo) ” 
  &&  “ (Lo <= 127) ” 
  &&  “ ((-128) <= Hi) ” 
  &&  “ (Hi <= 127) ” 
  &&  “ (qm_inputs M input_a_pre input_b_pre batch_pre ) ” 
  &&  “ (sizeof(CHAR) = 1) ” 
  &&  “ (0 <= batch) ” 
  &&  “ (batch <= batch_pre) ” 
  &&  “ (input_a = (input_a_pre + ((batch_pre - batch ) * sizeof(CHAR)))) ” 
  &&  “ (input_b = (input_b_pre + ((batch_pre - batch ) * sizeof(CHAR)))) ” 
  &&  “ (output = (output_pre + ((batch_pre - batch ) * sizeof(CHAR)))) ”
  &&  ((&(( &( "vout" ) )->ₛ "s31")) # Char  |->_)
  **  ((&((retval_2)  # "vint8m2_t" ->ₛ "s31")) # Char  |-> (R_3.(vint8m2_t_s31) ))
  **  ((&(( &( "vout" ) )->ₛ "s30")) # Char  |->_)
  **  ((&((retval_2)  # "vint8m2_t" ->ₛ "s30")) # Char  |-> (R_3.(vint8m2_t_s30) ))
  **  ((&(( &( "vout" ) )->ₛ "s29")) # Char  |->_)
  **  ((&((retval_2)  # "vint8m2_t" ->ₛ "s29")) # Char  |-> (R_3.(vint8m2_t_s29) ))
  **  ((&(( &( "vout" ) )->ₛ "s28")) # Char  |->_)
  **  ((&((retval_2)  # "vint8m2_t" ->ₛ "s28")) # Char  |-> (R_3.(vint8m2_t_s28) ))
  **  ((&(( &( "vout" ) )->ₛ "s27")) # Char  |->_)
  **  ((&((retval_2)  # "vint8m2_t" ->ₛ "s27")) # Char  |-> (R_3.(vint8m2_t_s27) ))
  **  ((&(( &( "vout" ) )->ₛ "s26")) # Char  |->_)
  **  ((&((retval_2)  # "vint8m2_t" ->ₛ "s26")) # Char  |-> (R_3.(vint8m2_t_s26) ))
  **  ((&(( &( "vout" ) )->ₛ "s25")) # Char  |->_)
  **  ((&((retval_2)  # "vint8m2_t" ->ₛ "s25")) # Char  |-> (R_3.(vint8m2_t_s25) ))
  **  ((&(( &( "vout" ) )->ₛ "s24")) # Char  |->_)
  **  ((&((retval_2)  # "vint8m2_t" ->ₛ "s24")) # Char  |-> (R_3.(vint8m2_t_s24) ))
  **  ((&(( &( "vout" ) )->ₛ "s23")) # Char  |->_)
  **  ((&((retval_2)  # "vint8m2_t" ->ₛ "s23")) # Char  |-> (R_3.(vint8m2_t_s23) ))
  **  ((&(( &( "vout" ) )->ₛ "s22")) # Char  |->_)
  **  ((&((retval_2)  # "vint8m2_t" ->ₛ "s22")) # Char  |-> (R_3.(vint8m2_t_s22) ))
  **  ((&(( &( "vout" ) )->ₛ "s21")) # Char  |->_)
  **  ((&((retval_2)  # "vint8m2_t" ->ₛ "s21")) # Char  |-> (R_3.(vint8m2_t_s21) ))
  **  ((&(( &( "vout" ) )->ₛ "s20")) # Char  |->_)
  **  ((&((retval_2)  # "vint8m2_t" ->ₛ "s20")) # Char  |-> (R_3.(vint8m2_t_s20) ))
  **  ((&(( &( "vout" ) )->ₛ "s19")) # Char  |->_)
  **  ((&((retval_2)  # "vint8m2_t" ->ₛ "s19")) # Char  |-> (R_3.(vint8m2_t_s19) ))
  **  ((&(( &( "vout" ) )->ₛ "s18")) # Char  |->_)
  **  ((&((retval_2)  # "vint8m2_t" ->ₛ "s18")) # Char  |-> (R_3.(vint8m2_t_s18) ))
  **  ((&(( &( "vout" ) )->ₛ "s17")) # Char  |->_)
  **  ((&((retval_2)  # "vint8m2_t" ->ₛ "s17")) # Char  |-> (R_3.(vint8m2_t_s17) ))
  **  ((&(( &( "vout" ) )->ₛ "s16")) # Char  |->_)
  **  ((&((retval_2)  # "vint8m2_t" ->ₛ "s16")) # Char  |-> (R_3.(vint8m2_t_s16) ))
  **  ((&(( &( "vout" ) )->ₛ "s15")) # Char  |->_)
  **  ((&((retval_2)  # "vint8m2_t" ->ₛ "s15")) # Char  |-> (R_3.(vint8m2_t_s15) ))
  **  ((&(( &( "vout" ) )->ₛ "s14")) # Char  |->_)
  **  ((&((retval_2)  # "vint8m2_t" ->ₛ "s14")) # Char  |-> (R_3.(vint8m2_t_s14) ))
  **  ((&(( &( "vout" ) )->ₛ "s13")) # Char  |->_)
  **  ((&((retval_2)  # "vint8m2_t" ->ₛ "s13")) # Char  |-> (R_3.(vint8m2_t_s13) ))
  **  ((&(( &( "vout" ) )->ₛ "s12")) # Char  |->_)
  **  ((&((retval_2)  # "vint8m2_t" ->ₛ "s12")) # Char  |-> (R_3.(vint8m2_t_s12) ))
  **  ((&(( &( "vout" ) )->ₛ "s11")) # Char  |->_)
  **  ((&((retval_2)  # "vint8m2_t" ->ₛ "s11")) # Char  |-> (R_3.(vint8m2_t_s11) ))
  **  ((&(( &( "vout" ) )->ₛ "s10")) # Char  |->_)
  **  ((&((retval_2)  # "vint8m2_t" ->ₛ "s10")) # Char  |-> (R_3.(vint8m2_t_s10) ))
  **  ((&(( &( "vout" ) )->ₛ "s9")) # Char  |->_)
  **  ((&((retval_2)  # "vint8m2_t" ->ₛ "s9")) # Char  |-> (R_3.(vint8m2_t_s9) ))
  **  ((&(( &( "vout" ) )->ₛ "s8")) # Char  |->_)
  **  ((&((retval_2)  # "vint8m2_t" ->ₛ "s8")) # Char  |-> (R_3.(vint8m2_t_s8) ))
  **  ((&(( &( "vout" ) )->ₛ "s7")) # Char  |->_)
  **  ((&((retval_2)  # "vint8m2_t" ->ₛ "s7")) # Char  |-> (R_3.(vint8m2_t_s7) ))
  **  ((&(( &( "vout" ) )->ₛ "s6")) # Char  |->_)
  **  ((&((retval_2)  # "vint8m2_t" ->ₛ "s6")) # Char  |-> (R_3.(vint8m2_t_s6) ))
  **  ((&(( &( "vout" ) )->ₛ "s5")) # Char  |->_)
  **  ((&((retval_2)  # "vint8m2_t" ->ₛ "s5")) # Char  |-> (R_3.(vint8m2_t_s5) ))
  **  ((&(( &( "vout" ) )->ₛ "s4")) # Char  |->_)
  **  ((&((retval_2)  # "vint8m2_t" ->ₛ "s4")) # Char  |-> (R_3.(vint8m2_t_s4) ))
  **  ((&(( &( "vout" ) )->ₛ "s3")) # Char  |->_)
  **  ((&((retval_2)  # "vint8m2_t" ->ₛ "s3")) # Char  |-> (R_3.(vint8m2_t_s3) ))
  **  ((&(( &( "vout" ) )->ₛ "s2")) # Char  |->_)
  **  ((&((retval_2)  # "vint8m2_t" ->ₛ "s2")) # Char  |-> (R_3.(vint8m2_t_s2) ))
  **  ((&(( &( "vout" ) )->ₛ "s1")) # Char  |->_)
  **  ((&((retval_2)  # "vint8m2_t" ->ₛ "s1")) # Char  |-> (R_3.(vint8m2_t_s1) ))
  **  ((&(( &( "vout" ) )->ₛ "s0")) # Char  |->_)
  **  ((&((retval_2)  # "vint8m2_t" ->ₛ "s0")) # Char  |-> (R_3.(vint8m2_t_s0) ))
  **  (StructPredvint8m2_t ( &( "va" ) ) R )
  **  (StructPredvint8m2_t ( &( "vb" ) ) R_2 )
  **  (rd_mem M )
  **  (CharArray.full output_pre (batch_pre - batch ) (qm_values ((batch_pre - batch )) (M) (input_a_pre) (input_b_pre) (AZ) (BZ) (Scale) (OZ) (Lo) (Hi)) )
  **  (CharArray.undef_full output batch )
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "a_zero_point")) # Char  |-> AZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "b_zero_point")) # Char  |-> BZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "scale")) # Float  |-> Scale)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_zero_point")) # Short  |-> OZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_min")) # Char  |-> Lo)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_max")) # Char  |-> Hi)
.

Definition test_rvv_partial_solve_wit_11_pure := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (Hi: Z) (Lo: Z) (OZ: Z) (Scale: fp32) (BZ: Z) (AZ: Z) (M: RDMap) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (retval: Z) (R: Recordvint8m2_t) (R_2: Recordvint8m2_t) (R_3: Recordvint8m2_t) (PreH1 : (qm_record_compute_match retval R R_2 R_3 AZ BZ Scale OZ Lo Hi )) (PreH2 : (qm_record_load_match M input_b retval R_2 )) (PreH3 : (qm_record_load_match M input_a retval R )) (PreH4 : (qm_vl_allowed batch retval )) (PreH5 : (1 <= retval)) (PreH6 : (retval <= 32)) (PreH7 : (retval <= batch)) (PreH8 : (batch > 0)) (PreH9 : (0 < batch_pre)) (PreH10 : (batch_pre <= UINT64_MAX)) (PreH11 : (input_a_pre <> 0)) (PreH12 : (input_b_pre <> 0)) (PreH13 : (output_pre <> 0)) (PreH14 : (params_pre <> 0)) (PreH15 : ((-128) <= AZ)) (PreH16 : (AZ <= 127)) (PreH17 : ((-128) <= BZ)) (PreH18 : (BZ <= 127)) (PreH19 : ((-32768) <= OZ)) (PreH20 : (OZ <= 32767)) (PreH21 : ((-128) <= Lo)) (PreH22 : (Lo <= 127)) (PreH23 : ((-128) <= Hi)) (PreH24 : (Hi <= 127)) (PreH25 : (qm_inputs M input_a_pre input_b_pre batch_pre )) (PreH26 : (sizeof(CHAR) = 1)) (PreH27 : (0 <= batch)) (PreH28 : (batch <= batch_pre)) (PreH29 : (input_a = (input_a_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH30 : (input_b = (input_b_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH31 : (output = (output_pre + ((batch_pre - batch ) * sizeof(CHAR))))) ,
  ((&(( &( "vout" ) )->ₛ "s31")) # Char  |-> (R_3.(vint8m2_t_s31) ))
  **  ((&(( &( "vout" ) )->ₛ "s30")) # Char  |-> (R_3.(vint8m2_t_s30) ))
  **  ((&(( &( "vout" ) )->ₛ "s29")) # Char  |-> (R_3.(vint8m2_t_s29) ))
  **  ((&(( &( "vout" ) )->ₛ "s28")) # Char  |-> (R_3.(vint8m2_t_s28) ))
  **  ((&(( &( "vout" ) )->ₛ "s27")) # Char  |-> (R_3.(vint8m2_t_s27) ))
  **  ((&(( &( "vout" ) )->ₛ "s26")) # Char  |-> (R_3.(vint8m2_t_s26) ))
  **  ((&(( &( "vout" ) )->ₛ "s25")) # Char  |-> (R_3.(vint8m2_t_s25) ))
  **  ((&(( &( "vout" ) )->ₛ "s24")) # Char  |-> (R_3.(vint8m2_t_s24) ))
  **  ((&(( &( "vout" ) )->ₛ "s23")) # Char  |-> (R_3.(vint8m2_t_s23) ))
  **  ((&(( &( "vout" ) )->ₛ "s22")) # Char  |-> (R_3.(vint8m2_t_s22) ))
  **  ((&(( &( "vout" ) )->ₛ "s21")) # Char  |-> (R_3.(vint8m2_t_s21) ))
  **  ((&(( &( "vout" ) )->ₛ "s20")) # Char  |-> (R_3.(vint8m2_t_s20) ))
  **  ((&(( &( "vout" ) )->ₛ "s19")) # Char  |-> (R_3.(vint8m2_t_s19) ))
  **  ((&(( &( "vout" ) )->ₛ "s18")) # Char  |-> (R_3.(vint8m2_t_s18) ))
  **  ((&(( &( "vout" ) )->ₛ "s17")) # Char  |-> (R_3.(vint8m2_t_s17) ))
  **  ((&(( &( "vout" ) )->ₛ "s16")) # Char  |-> (R_3.(vint8m2_t_s16) ))
  **  ((&(( &( "vout" ) )->ₛ "s15")) # Char  |-> (R_3.(vint8m2_t_s15) ))
  **  ((&(( &( "vout" ) )->ₛ "s14")) # Char  |-> (R_3.(vint8m2_t_s14) ))
  **  ((&(( &( "vout" ) )->ₛ "s13")) # Char  |-> (R_3.(vint8m2_t_s13) ))
  **  ((&(( &( "vout" ) )->ₛ "s12")) # Char  |-> (R_3.(vint8m2_t_s12) ))
  **  ((&(( &( "vout" ) )->ₛ "s11")) # Char  |-> (R_3.(vint8m2_t_s11) ))
  **  ((&(( &( "vout" ) )->ₛ "s10")) # Char  |-> (R_3.(vint8m2_t_s10) ))
  **  ((&(( &( "vout" ) )->ₛ "s9")) # Char  |-> (R_3.(vint8m2_t_s9) ))
  **  ((&(( &( "vout" ) )->ₛ "s8")) # Char  |-> (R_3.(vint8m2_t_s8) ))
  **  ((&(( &( "vout" ) )->ₛ "s7")) # Char  |-> (R_3.(vint8m2_t_s7) ))
  **  ((&(( &( "vout" ) )->ₛ "s6")) # Char  |-> (R_3.(vint8m2_t_s6) ))
  **  ((&(( &( "vout" ) )->ₛ "s5")) # Char  |-> (R_3.(vint8m2_t_s5) ))
  **  ((&(( &( "vout" ) )->ₛ "s4")) # Char  |-> (R_3.(vint8m2_t_s4) ))
  **  ((&(( &( "vout" ) )->ₛ "s3")) # Char  |-> (R_3.(vint8m2_t_s3) ))
  **  ((&(( &( "vout" ) )->ₛ "s2")) # Char  |-> (R_3.(vint8m2_t_s2) ))
  **  ((&(( &( "vout" ) )->ₛ "s1")) # Char  |-> (R_3.(vint8m2_t_s1) ))
  **  ((&(( &( "vout" ) )->ₛ "s0")) # Char  |-> (R_3.(vint8m2_t_s0) ))
  **  (StructPredvint8m2_t ( &( "va" ) ) R )
  **  (StructPredvint8m2_t ( &( "vb" ) ) R_2 )
  **  (rd_mem M )
  **  ((( &( "vl" ) )) # UInt64  |-> retval)
  **  ((( &( "batch" ) )) # UInt64  |-> batch)
  **  ((( &( "input_a" ) )) # Ptr  |-> input_a)
  **  ((( &( "input_b" ) )) # Ptr  |-> input_b)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (CharArray.full output_pre (batch_pre - batch ) (qm_values ((batch_pre - batch )) (M) (input_a_pre) (input_b_pre) (AZ) (BZ) (Scale) (OZ) (Lo) (Hi)) )
  **  (CharArray.undef_full output batch )
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "a_zero_point")) # Char  |-> AZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "b_zero_point")) # Char  |-> BZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "scale")) # Float  |-> Scale)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_zero_point")) # Short  |-> OZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_min")) # Char  |-> Lo)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_max")) # Char  |-> Hi)
  **  ((( &( "a_zero_point" ) )) # Char  |-> AZ)
  **  ((( &( "b_zero_point" ) )) # Char  |-> BZ)
  **  ((( &( "scale" ) )) # Float  |-> Scale)
  **  ((( &( "output_zero_point" ) )) # Short  |-> OZ)
  **  ((( &( "output_min" ) )) # Char  |-> Lo)
  **  ((( &( "output_max" ) )) # Char  |-> Hi)
|--
  “ (0 <= retval) ” 
  &&  “ (retval <= 32) ”
.

Definition test_rvv_partial_solve_wit_11_aux := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (Hi: Z) (Lo: Z) (OZ: Z) (Scale: fp32) (BZ: Z) (AZ: Z) (M: RDMap) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (retval: Z) (R: Recordvint8m2_t) (R_2: Recordvint8m2_t) (R_3: Recordvint8m2_t) (PreH1 : (qm_record_compute_match retval R R_2 R_3 AZ BZ Scale OZ Lo Hi )) (PreH2 : (qm_record_load_match M input_b retval R_2 )) (PreH3 : (qm_record_load_match M input_a retval R )) (PreH4 : (qm_vl_allowed batch retval )) (PreH5 : (1 <= retval)) (PreH6 : (retval <= 32)) (PreH7 : (retval <= batch)) (PreH8 : (batch > 0)) (PreH9 : (0 < batch_pre)) (PreH10 : (batch_pre <= UINT64_MAX)) (PreH11 : (input_a_pre <> 0)) (PreH12 : (input_b_pre <> 0)) (PreH13 : (output_pre <> 0)) (PreH14 : (params_pre <> 0)) (PreH15 : ((-128) <= AZ)) (PreH16 : (AZ <= 127)) (PreH17 : ((-128) <= BZ)) (PreH18 : (BZ <= 127)) (PreH19 : ((-32768) <= OZ)) (PreH20 : (OZ <= 32767)) (PreH21 : ((-128) <= Lo)) (PreH22 : (Lo <= 127)) (PreH23 : ((-128) <= Hi)) (PreH24 : (Hi <= 127)) (PreH25 : (qm_inputs M input_a_pre input_b_pre batch_pre )) (PreH26 : (sizeof(CHAR) = 1)) (PreH27 : (0 <= batch)) (PreH28 : (batch <= batch_pre)) (PreH29 : (input_a = (input_a_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH30 : (input_b = (input_b_pre + ((batch_pre - batch ) * sizeof(CHAR))))) (PreH31 : (output = (output_pre + ((batch_pre - batch ) * sizeof(CHAR))))) ,
  ((&(( &( "vout" ) )->ₛ "s31")) # Char  |-> (R_3.(vint8m2_t_s31) ))
  **  ((&(( &( "vout" ) )->ₛ "s30")) # Char  |-> (R_3.(vint8m2_t_s30) ))
  **  ((&(( &( "vout" ) )->ₛ "s29")) # Char  |-> (R_3.(vint8m2_t_s29) ))
  **  ((&(( &( "vout" ) )->ₛ "s28")) # Char  |-> (R_3.(vint8m2_t_s28) ))
  **  ((&(( &( "vout" ) )->ₛ "s27")) # Char  |-> (R_3.(vint8m2_t_s27) ))
  **  ((&(( &( "vout" ) )->ₛ "s26")) # Char  |-> (R_3.(vint8m2_t_s26) ))
  **  ((&(( &( "vout" ) )->ₛ "s25")) # Char  |-> (R_3.(vint8m2_t_s25) ))
  **  ((&(( &( "vout" ) )->ₛ "s24")) # Char  |-> (R_3.(vint8m2_t_s24) ))
  **  ((&(( &( "vout" ) )->ₛ "s23")) # Char  |-> (R_3.(vint8m2_t_s23) ))
  **  ((&(( &( "vout" ) )->ₛ "s22")) # Char  |-> (R_3.(vint8m2_t_s22) ))
  **  ((&(( &( "vout" ) )->ₛ "s21")) # Char  |-> (R_3.(vint8m2_t_s21) ))
  **  ((&(( &( "vout" ) )->ₛ "s20")) # Char  |-> (R_3.(vint8m2_t_s20) ))
  **  ((&(( &( "vout" ) )->ₛ "s19")) # Char  |-> (R_3.(vint8m2_t_s19) ))
  **  ((&(( &( "vout" ) )->ₛ "s18")) # Char  |-> (R_3.(vint8m2_t_s18) ))
  **  ((&(( &( "vout" ) )->ₛ "s17")) # Char  |-> (R_3.(vint8m2_t_s17) ))
  **  ((&(( &( "vout" ) )->ₛ "s16")) # Char  |-> (R_3.(vint8m2_t_s16) ))
  **  ((&(( &( "vout" ) )->ₛ "s15")) # Char  |-> (R_3.(vint8m2_t_s15) ))
  **  ((&(( &( "vout" ) )->ₛ "s14")) # Char  |-> (R_3.(vint8m2_t_s14) ))
  **  ((&(( &( "vout" ) )->ₛ "s13")) # Char  |-> (R_3.(vint8m2_t_s13) ))
  **  ((&(( &( "vout" ) )->ₛ "s12")) # Char  |-> (R_3.(vint8m2_t_s12) ))
  **  ((&(( &( "vout" ) )->ₛ "s11")) # Char  |-> (R_3.(vint8m2_t_s11) ))
  **  ((&(( &( "vout" ) )->ₛ "s10")) # Char  |-> (R_3.(vint8m2_t_s10) ))
  **  ((&(( &( "vout" ) )->ₛ "s9")) # Char  |-> (R_3.(vint8m2_t_s9) ))
  **  ((&(( &( "vout" ) )->ₛ "s8")) # Char  |-> (R_3.(vint8m2_t_s8) ))
  **  ((&(( &( "vout" ) )->ₛ "s7")) # Char  |-> (R_3.(vint8m2_t_s7) ))
  **  ((&(( &( "vout" ) )->ₛ "s6")) # Char  |-> (R_3.(vint8m2_t_s6) ))
  **  ((&(( &( "vout" ) )->ₛ "s5")) # Char  |-> (R_3.(vint8m2_t_s5) ))
  **  ((&(( &( "vout" ) )->ₛ "s4")) # Char  |-> (R_3.(vint8m2_t_s4) ))
  **  ((&(( &( "vout" ) )->ₛ "s3")) # Char  |-> (R_3.(vint8m2_t_s3) ))
  **  ((&(( &( "vout" ) )->ₛ "s2")) # Char  |-> (R_3.(vint8m2_t_s2) ))
  **  ((&(( &( "vout" ) )->ₛ "s1")) # Char  |-> (R_3.(vint8m2_t_s1) ))
  **  ((&(( &( "vout" ) )->ₛ "s0")) # Char  |-> (R_3.(vint8m2_t_s0) ))
  **  (StructPredvint8m2_t ( &( "va" ) ) R )
  **  (StructPredvint8m2_t ( &( "vb" ) ) R_2 )
  **  (rd_mem M )
  **  (CharArray.full output_pre (batch_pre - batch ) (qm_values ((batch_pre - batch )) (M) (input_a_pre) (input_b_pre) (AZ) (BZ) (Scale) (OZ) (Lo) (Hi)) )
  **  (CharArray.undef_full output batch )
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "a_zero_point")) # Char  |-> AZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "b_zero_point")) # Char  |-> BZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "scale")) # Float  |-> Scale)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_zero_point")) # Short  |-> OZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_min")) # Char  |-> Lo)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_max")) # Char  |-> Hi)
|--
  “ (0 <= retval) ” 
  &&  “ (retval <= 32) ” 
  &&  “ (qm_record_compute_match retval R R_2 R_3 AZ BZ Scale OZ Lo Hi ) ” 
  &&  “ (qm_record_load_match M input_b retval R_2 ) ” 
  &&  “ (qm_record_load_match M input_a retval R ) ” 
  &&  “ (qm_vl_allowed batch retval ) ” 
  &&  “ (1 <= retval) ” 
  &&  “ (retval <= 32) ” 
  &&  “ (retval <= batch) ” 
  &&  “ (batch > 0) ” 
  &&  “ (0 < batch_pre) ” 
  &&  “ (batch_pre <= UINT64_MAX) ” 
  &&  “ (input_a_pre <> 0) ” 
  &&  “ (input_b_pre <> 0) ” 
  &&  “ (output_pre <> 0) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ ((-128) <= AZ) ” 
  &&  “ (AZ <= 127) ” 
  &&  “ ((-128) <= BZ) ” 
  &&  “ (BZ <= 127) ” 
  &&  “ ((-32768) <= OZ) ” 
  &&  “ (OZ <= 32767) ” 
  &&  “ ((-128) <= Lo) ” 
  &&  “ (Lo <= 127) ” 
  &&  “ ((-128) <= Hi) ” 
  &&  “ (Hi <= 127) ” 
  &&  “ (qm_inputs M input_a_pre input_b_pre batch_pre ) ” 
  &&  “ (sizeof(CHAR) = 1) ” 
  &&  “ (0 <= batch) ” 
  &&  “ (batch <= batch_pre) ” 
  &&  “ (input_a = (input_a_pre + ((batch_pre - batch ) * sizeof(CHAR)))) ” 
  &&  “ (input_b = (input_b_pre + ((batch_pre - batch ) * sizeof(CHAR)))) ” 
  &&  “ (output = (output_pre + ((batch_pre - batch ) * sizeof(CHAR)))) ”
  &&  (CharArray.undef_full output retval )
  **  ((&(( &( "vout" ) )->ₛ "s0")) # Char  |-> (R_3.(vint8m2_t_s0) ))
  **  ((&(( &( "vout" ) )->ₛ "s1")) # Char  |-> (R_3.(vint8m2_t_s1) ))
  **  ((&(( &( "vout" ) )->ₛ "s2")) # Char  |-> (R_3.(vint8m2_t_s2) ))
  **  ((&(( &( "vout" ) )->ₛ "s3")) # Char  |-> (R_3.(vint8m2_t_s3) ))
  **  ((&(( &( "vout" ) )->ₛ "s4")) # Char  |-> (R_3.(vint8m2_t_s4) ))
  **  ((&(( &( "vout" ) )->ₛ "s5")) # Char  |-> (R_3.(vint8m2_t_s5) ))
  **  ((&(( &( "vout" ) )->ₛ "s6")) # Char  |-> (R_3.(vint8m2_t_s6) ))
  **  ((&(( &( "vout" ) )->ₛ "s7")) # Char  |-> (R_3.(vint8m2_t_s7) ))
  **  ((&(( &( "vout" ) )->ₛ "s8")) # Char  |-> (R_3.(vint8m2_t_s8) ))
  **  ((&(( &( "vout" ) )->ₛ "s9")) # Char  |-> (R_3.(vint8m2_t_s9) ))
  **  ((&(( &( "vout" ) )->ₛ "s10")) # Char  |-> (R_3.(vint8m2_t_s10) ))
  **  ((&(( &( "vout" ) )->ₛ "s11")) # Char  |-> (R_3.(vint8m2_t_s11) ))
  **  ((&(( &( "vout" ) )->ₛ "s12")) # Char  |-> (R_3.(vint8m2_t_s12) ))
  **  ((&(( &( "vout" ) )->ₛ "s13")) # Char  |-> (R_3.(vint8m2_t_s13) ))
  **  ((&(( &( "vout" ) )->ₛ "s14")) # Char  |-> (R_3.(vint8m2_t_s14) ))
  **  ((&(( &( "vout" ) )->ₛ "s15")) # Char  |-> (R_3.(vint8m2_t_s15) ))
  **  ((&(( &( "vout" ) )->ₛ "s16")) # Char  |-> (R_3.(vint8m2_t_s16) ))
  **  ((&(( &( "vout" ) )->ₛ "s17")) # Char  |-> (R_3.(vint8m2_t_s17) ))
  **  ((&(( &( "vout" ) )->ₛ "s18")) # Char  |-> (R_3.(vint8m2_t_s18) ))
  **  ((&(( &( "vout" ) )->ₛ "s19")) # Char  |-> (R_3.(vint8m2_t_s19) ))
  **  ((&(( &( "vout" ) )->ₛ "s20")) # Char  |-> (R_3.(vint8m2_t_s20) ))
  **  ((&(( &( "vout" ) )->ₛ "s21")) # Char  |-> (R_3.(vint8m2_t_s21) ))
  **  ((&(( &( "vout" ) )->ₛ "s22")) # Char  |-> (R_3.(vint8m2_t_s22) ))
  **  ((&(( &( "vout" ) )->ₛ "s23")) # Char  |-> (R_3.(vint8m2_t_s23) ))
  **  ((&(( &( "vout" ) )->ₛ "s24")) # Char  |-> (R_3.(vint8m2_t_s24) ))
  **  ((&(( &( "vout" ) )->ₛ "s25")) # Char  |-> (R_3.(vint8m2_t_s25) ))
  **  ((&(( &( "vout" ) )->ₛ "s26")) # Char  |-> (R_3.(vint8m2_t_s26) ))
  **  ((&(( &( "vout" ) )->ₛ "s27")) # Char  |-> (R_3.(vint8m2_t_s27) ))
  **  ((&(( &( "vout" ) )->ₛ "s28")) # Char  |-> (R_3.(vint8m2_t_s28) ))
  **  ((&(( &( "vout" ) )->ₛ "s29")) # Char  |-> (R_3.(vint8m2_t_s29) ))
  **  ((&(( &( "vout" ) )->ₛ "s30")) # Char  |-> (R_3.(vint8m2_t_s30) ))
  **  ((&(( &( "vout" ) )->ₛ "s31")) # Char  |-> (R_3.(vint8m2_t_s31) ))
  **  (CharArray.undef_full (output + (retval * sizeof(CHAR))) (batch - retval ) )
  **  (StructPredvint8m2_t ( &( "va" ) ) R )
  **  (StructPredvint8m2_t ( &( "vb" ) ) R_2 )
  **  (rd_mem M )
  **  (CharArray.full output_pre (batch_pre - batch ) (qm_values ((batch_pre - batch )) (M) (input_a_pre) (input_b_pre) (AZ) (BZ) (Scale) (OZ) (Lo) (Hi)) )
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "a_zero_point")) # Char  |-> AZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "b_zero_point")) # Char  |-> BZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "scale")) # Float  |-> Scale)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_zero_point")) # Short  |-> OZ)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_min")) # Char  |-> Lo)
  **  ((&((params_pre)  # "xnn_qs8_mul_minmax_params" ->ₛ "scalar" .ₛ "output_max")) # Char  |-> Hi)
.

Definition test_rvv_partial_solve_wit_11 := test_rvv_partial_solve_wit_11_pure -> test_rvv_partial_solve_wit_11_aux.

Module Type VC_Correct.

Include byte_store_Strategy_Correct.
Include rvv_prefix_store_Strategy_Correct.

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
Axiom proof_of_test_rvv_return_wit_1 : test_rvv_return_wit_1.
Axiom proof_of_test_rvv_return_wit_2 : test_rvv_return_wit_2.
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
Axiom proof_of_test_rvv_partial_solve_wit_10 : test_rvv_partial_solve_wit_10.
Axiom proof_of_test_rvv_partial_solve_wit_11_pure : test_rvv_partial_solve_wit_11_pure.
Axiom proof_of_test_rvv_partial_solve_wit_11 : test_rvv_partial_solve_wit_11.

End VC_Correct.
