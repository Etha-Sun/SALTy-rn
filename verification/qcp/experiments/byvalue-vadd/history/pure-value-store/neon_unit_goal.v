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
Require Import QcpNeonLoop.InvariantFacts.
Require Import QcpVadd.VaddBits.
Require Import QcpVadd.VaddBits.
Require Import QcpNeon.NeonBridge.
Require Import QcpNeonLoop.NeonLoopBridge.
Local Open Scope sac.
From QcpNeon Require Import neon_bridge_strategy_goal.
From QcpNeon Require Import neon_bridge_strategy_proof.
From QcpNeonLoop Require Import neon_tail_strategy_goal.
From QcpNeonLoop Require Import neon_tail_strategy_proof.
From QcpVadd Require Import float_array_strategy_goal.
From QcpVadd Require Import float_array_strategy_proof.

(*----- Function test_neon -----*)

Definition test_neon_safety_wit_1 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (PreH1 : (0 < batch_pre)) (PreH2 : (batch_pre <= 18446744073709551603)) (PreH3 : ((batch_pre % ( 4 ) ) = 0)) (PreH4 : (params_pre <> 0)) (PreH5 : (input_a_pre <> 0)) (PreH6 : (input_b_pre <> 0)) (PreH7 : (output_pre <> 0)) ,
  ((( &( "batch" ) )) # UInt64  |-> batch_pre)
  **  ((( &( "input_a" ) )) # Ptr  |-> input_a_pre)
  **  ((( &( "input_b" ) )) # Ptr  |-> input_b_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (FloatArray.full input_a_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.full input_b_pre ((batch_pre ÷ 4 ) + 3 ) B )
  **  (FloatArray.undef_full output_pre (batch_pre ÷ 4 ) )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition test_neon_safety_wit_2 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (PreH1 : (batch_pre = 0)) (PreH2 : (0 < batch_pre)) (PreH3 : (batch_pre <= 18446744073709551603)) (PreH4 : ((batch_pre % ( 4 ) ) = 0)) (PreH5 : (params_pre <> 0)) (PreH6 : (input_a_pre <> 0)) (PreH7 : (input_b_pre <> 0)) (PreH8 : (output_pre <> 0)) ,
  ((( &( "batch" ) )) # UInt64  |-> batch_pre)
  **  ((( &( "input_a" ) )) # Ptr  |-> input_a_pre)
  **  ((( &( "input_b" ) )) # Ptr  |-> input_b_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (FloatArray.full input_a_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.full input_b_pre ((batch_pre ÷ 4 ) + 3 ) B )
  **  (FloatArray.undef_full output_pre (batch_pre ÷ 4 ) )
|--
  “ False ”
.

Definition test_neon_safety_wit_3 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (PreH1 : (batch_pre <> 0)) (PreH2 : (0 < batch_pre)) (PreH3 : (batch_pre <= 18446744073709551603)) (PreH4 : ((batch_pre % ( 4 ) ) = 0)) (PreH5 : (params_pre <> 0)) (PreH6 : (input_a_pre <> 0)) (PreH7 : (input_b_pre <> 0)) (PreH8 : (output_pre <> 0)) ,
  ((( &( "batch" ) )) # UInt64  |-> batch_pre)
  **  ((( &( "input_a" ) )) # Ptr  |-> input_a_pre)
  **  ((( &( "input_b" ) )) # Ptr  |-> input_b_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (FloatArray.full input_a_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.full input_b_pre ((batch_pre ÷ 4 ) + 3 ) B )
  **  (FloatArray.undef_full output_pre (batch_pre ÷ 4 ) )
|--
  “ (sizeof(FLOAT) <> 0) ”
.

Definition test_neon_safety_wit_4 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (PreH1 : (batch_pre <> 0)) (PreH2 : (0 < batch_pre)) (PreH3 : (batch_pre <= 18446744073709551603)) (PreH4 : ((batch_pre % ( 4 ) ) = 0)) (PreH5 : (params_pre <> 0)) (PreH6 : (input_a_pre <> 0)) (PreH7 : (input_b_pre <> 0)) (PreH8 : (output_pre <> 0)) ,
  ((( &( "batch" ) )) # UInt64  |-> batch_pre)
  **  ((( &( "input_a" ) )) # Ptr  |-> input_a_pre)
  **  ((( &( "input_b" ) )) # Ptr  |-> input_b_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (FloatArray.full input_a_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.full input_b_pre ((batch_pre ÷ 4 ) + 3 ) B )
  **  (FloatArray.undef_full output_pre (batch_pre ÷ 4 ) )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition test_neon_safety_wit_5 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (PreH1 : ((batch_pre % ( sizeof(FLOAT) ) ) <> 0)) (PreH2 : (batch_pre <> 0)) (PreH3 : (0 < batch_pre)) (PreH4 : (batch_pre <= 18446744073709551603)) (PreH5 : ((batch_pre % ( 4 ) ) = 0)) (PreH6 : (params_pre <> 0)) (PreH7 : (input_a_pre <> 0)) (PreH8 : (input_b_pre <> 0)) (PreH9 : (output_pre <> 0)) ,
  ((( &( "batch" ) )) # UInt64  |-> batch_pre)
  **  ((( &( "input_a" ) )) # Ptr  |-> input_a_pre)
  **  ((( &( "input_b" ) )) # Ptr  |-> input_b_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (FloatArray.full input_a_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.full input_b_pre ((batch_pre ÷ 4 ) + 3 ) B )
  **  (FloatArray.undef_full output_pre (batch_pre ÷ 4 ) )
|--
  “ False ”
.

Definition test_neon_safety_wit_6 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (PreH1 : ((batch_pre % ( sizeof(FLOAT) ) ) = 0)) (PreH2 : (batch_pre <> 0)) (PreH3 : (0 < batch_pre)) (PreH4 : (batch_pre <= 18446744073709551603)) (PreH5 : ((batch_pre % ( 4 ) ) = 0)) (PreH6 : (params_pre <> 0)) (PreH7 : (input_a_pre <> 0)) (PreH8 : (input_b_pre <> 0)) (PreH9 : (output_pre <> 0)) ,
  ((( &( "batch" ) )) # UInt64  |-> batch_pre)
  **  ((( &( "input_a" ) )) # Ptr  |-> input_a_pre)
  **  ((( &( "input_b" ) )) # Ptr  |-> input_b_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (FloatArray.full input_a_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.full input_b_pre ((batch_pre ÷ 4 ) + 3 ) B )
  **  (FloatArray.undef_full output_pre (batch_pre ÷ 4 ) )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition test_neon_safety_wit_7 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (PreH1 : (input_a_pre = 0)) (PreH2 : ((batch_pre % ( sizeof(FLOAT) ) ) = 0)) (PreH3 : (batch_pre <> 0)) (PreH4 : (0 < batch_pre)) (PreH5 : (batch_pre <= 18446744073709551603)) (PreH6 : ((batch_pre % ( 4 ) ) = 0)) (PreH7 : (params_pre <> 0)) (PreH8 : (input_a_pre <> 0)) (PreH9 : (input_b_pre <> 0)) (PreH10 : (output_pre <> 0)) ,
  ((( &( "batch" ) )) # UInt64  |-> batch_pre)
  **  ((( &( "input_a" ) )) # Ptr  |-> input_a_pre)
  **  ((( &( "input_b" ) )) # Ptr  |-> input_b_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (FloatArray.full input_a_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.full input_b_pre ((batch_pre ÷ 4 ) + 3 ) B )
  **  (FloatArray.undef_full output_pre (batch_pre ÷ 4 ) )
|--
  “ False ”
.

Definition test_neon_safety_wit_8 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (PreH1 : (input_a_pre <> 0)) (PreH2 : ((batch_pre % ( sizeof(FLOAT) ) ) = 0)) (PreH3 : (batch_pre <> 0)) (PreH4 : (0 < batch_pre)) (PreH5 : (batch_pre <= 18446744073709551603)) (PreH6 : ((batch_pre % ( 4 ) ) = 0)) (PreH7 : (params_pre <> 0)) (PreH8 : (input_a_pre <> 0)) (PreH9 : (input_b_pre <> 0)) (PreH10 : (output_pre <> 0)) ,
  ((( &( "batch" ) )) # UInt64  |-> batch_pre)
  **  ((( &( "input_a" ) )) # Ptr  |-> input_a_pre)
  **  ((( &( "input_b" ) )) # Ptr  |-> input_b_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (FloatArray.full input_a_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.full input_b_pre ((batch_pre ÷ 4 ) + 3 ) B )
  **  (FloatArray.undef_full output_pre (batch_pre ÷ 4 ) )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition test_neon_safety_wit_9 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (PreH1 : (input_b_pre = 0)) (PreH2 : (input_a_pre <> 0)) (PreH3 : ((batch_pre % ( sizeof(FLOAT) ) ) = 0)) (PreH4 : (batch_pre <> 0)) (PreH5 : (0 < batch_pre)) (PreH6 : (batch_pre <= 18446744073709551603)) (PreH7 : ((batch_pre % ( 4 ) ) = 0)) (PreH8 : (params_pre <> 0)) (PreH9 : (input_a_pre <> 0)) (PreH10 : (input_b_pre <> 0)) (PreH11 : (output_pre <> 0)) ,
  ((( &( "batch" ) )) # UInt64  |-> batch_pre)
  **  ((( &( "input_a" ) )) # Ptr  |-> input_a_pre)
  **  ((( &( "input_b" ) )) # Ptr  |-> input_b_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (FloatArray.full input_a_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.full input_b_pre ((batch_pre ÷ 4 ) + 3 ) B )
  **  (FloatArray.undef_full output_pre (batch_pre ÷ 4 ) )
|--
  “ False ”
.

Definition test_neon_safety_wit_10 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (PreH1 : (input_b_pre <> 0)) (PreH2 : (input_a_pre <> 0)) (PreH3 : ((batch_pre % ( sizeof(FLOAT) ) ) = 0)) (PreH4 : (batch_pre <> 0)) (PreH5 : (0 < batch_pre)) (PreH6 : (batch_pre <= 18446744073709551603)) (PreH7 : ((batch_pre % ( 4 ) ) = 0)) (PreH8 : (params_pre <> 0)) (PreH9 : (input_a_pre <> 0)) (PreH10 : (input_b_pre <> 0)) (PreH11 : (output_pre <> 0)) ,
  ((( &( "batch" ) )) # UInt64  |-> batch_pre)
  **  ((( &( "input_a" ) )) # Ptr  |-> input_a_pre)
  **  ((( &( "input_b" ) )) # Ptr  |-> input_b_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (FloatArray.full input_a_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.full input_b_pre ((batch_pre ÷ 4 ) + 3 ) B )
  **  (FloatArray.undef_full output_pre (batch_pre ÷ 4 ) )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition test_neon_safety_wit_11 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (PreH1 : (output_pre = 0)) (PreH2 : (input_b_pre <> 0)) (PreH3 : (input_a_pre <> 0)) (PreH4 : ((batch_pre % ( sizeof(FLOAT) ) ) = 0)) (PreH5 : (batch_pre <> 0)) (PreH6 : (0 < batch_pre)) (PreH7 : (batch_pre <= 18446744073709551603)) (PreH8 : ((batch_pre % ( 4 ) ) = 0)) (PreH9 : (params_pre <> 0)) (PreH10 : (input_a_pre <> 0)) (PreH11 : (input_b_pre <> 0)) (PreH12 : (output_pre <> 0)) ,
  ((( &( "batch" ) )) # UInt64  |-> batch_pre)
  **  ((( &( "input_a" ) )) # Ptr  |-> input_a_pre)
  **  ((( &( "input_b" ) )) # Ptr  |-> input_b_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (FloatArray.full input_a_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.full input_b_pre ((batch_pre ÷ 4 ) + 3 ) B )
  **  (FloatArray.undef_full output_pre (batch_pre ÷ 4 ) )
|--
  “ False ”
.

Definition test_neon_safety_wit_12 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (k: Z) (PreH1 : ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH2 : ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH3 : (0 <= k)) (PreH4 : (((k * 4 ) + batch ) = batch_pre)) (PreH5 : ((batch % ( 4 ) ) = 0)) (PreH6 : (0 <= batch)) (PreH7 : (batch <= batch_pre)) (PreH8 : (k <= (batch_pre ÷ 4 ))) (PreH9 : (batch = 0)) (PreH10 : (params_pre <> 0)) (PreH11 : (input_a = (input_a_pre + (k * sizeof(FLOAT))))) (PreH12 : (input_b = (input_b_pre + (k * sizeof(FLOAT))))) (PreH13 : (output = (output_pre + (k * sizeof(FLOAT))))) (PreH14 : (input_a <> 0)) (PreH15 : (input_b <> 0)) (PreH16 : (output <> 0)) ,
  ((( &( "batch" ) )) # UInt64  |-> batch)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "input_a" ) )) # Ptr  |-> input_a)
  **  ((( &( "input_b" ) )) # Ptr  |-> input_b)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_a ((batch ÷ 4 ) + 3 ) (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full input_b ((batch ÷ 4 ) + 3 ) (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
|--
  “ (4 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 4) ”
.

Definition test_neon_safety_wit_13 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (k: Z) (PreH1 : ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH2 : ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH3 : (0 <= k)) (PreH4 : (((k * 4 ) + batch ) = batch_pre)) (PreH5 : ((batch % ( 4 ) ) = 0)) (PreH6 : (0 <= batch)) (PreH7 : (batch <= batch_pre)) (PreH8 : (k <= (batch_pre ÷ 4 ))) (PreH9 : (batch = 4)) (PreH10 : ((batch ÷ 4 ) = 1)) (PreH11 : (params_pre <> 0)) (PreH12 : (input_a = (input_a_pre + (k * sizeof(FLOAT))))) (PreH13 : (input_b = (input_b_pre + (k * sizeof(FLOAT))))) (PreH14 : (output = (output_pre + (k * sizeof(FLOAT))))) (PreH15 : (input_a <> 0)) (PreH16 : (input_b <> 0)) (PreH17 : (output <> 0)) ,
  ((( &( "batch" ) )) # UInt64  |-> batch)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "input_a" ) )) # Ptr  |-> input_a)
  **  ((( &( "input_b" ) )) # Ptr  |-> input_b)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_a ((batch ÷ 4 ) + 3 ) (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full input_b ((batch ÷ 4 ) + 3 ) (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
|--
  “ (4 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 4) ”
.

Definition test_neon_safety_wit_14 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (k: Z) (PreH1 : ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH2 : ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH3 : (0 <= k)) (PreH4 : (((k * 4 ) + batch ) = batch_pre)) (PreH5 : ((batch % ( 4 ) ) = 0)) (PreH6 : (0 <= batch)) (PreH7 : (batch <= batch_pre)) (PreH8 : (k <= (batch_pre ÷ 4 ))) (PreH9 : (batch = 8)) (PreH10 : ((batch ÷ 4 ) = 2)) (PreH11 : (params_pre <> 0)) (PreH12 : (input_a = (input_a_pre + (k * sizeof(FLOAT))))) (PreH13 : (input_b = (input_b_pre + (k * sizeof(FLOAT))))) (PreH14 : (output = (output_pre + (k * sizeof(FLOAT))))) (PreH15 : (input_a <> 0)) (PreH16 : (input_b <> 0)) (PreH17 : (output <> 0)) ,
  ((( &( "batch" ) )) # UInt64  |-> batch)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "input_a" ) )) # Ptr  |-> input_a)
  **  ((( &( "input_b" ) )) # Ptr  |-> input_b)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_a ((batch ÷ 4 ) + 3 ) (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full input_b ((batch ÷ 4 ) + 3 ) (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
|--
  “ (4 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 4) ”
.

Definition test_neon_safety_wit_15 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (k: Z) (PreH1 : ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH2 : ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH3 : (0 <= k)) (PreH4 : (((k * 4 ) + batch ) = batch_pre)) (PreH5 : ((batch % ( 4 ) ) = 0)) (PreH6 : (0 <= batch)) (PreH7 : (batch <= batch_pre)) (PreH8 : (k <= (batch_pre ÷ 4 ))) (PreH9 : (batch = 12)) (PreH10 : ((batch ÷ 4 ) = 3)) (PreH11 : (params_pre <> 0)) (PreH12 : (input_a = (input_a_pre + (k * sizeof(FLOAT))))) (PreH13 : (input_b = (input_b_pre + (k * sizeof(FLOAT))))) (PreH14 : (output = (output_pre + (k * sizeof(FLOAT))))) (PreH15 : (input_a <> 0)) (PreH16 : (input_b <> 0)) (PreH17 : (output <> 0)) ,
  ((( &( "batch" ) )) # UInt64  |-> batch)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "input_a" ) )) # Ptr  |-> input_a)
  **  ((( &( "input_b" ) )) # Ptr  |-> input_b)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_a ((batch ÷ 4 ) + 3 ) (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full input_b ((batch ÷ 4 ) + 3 ) (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
|--
  “ (4 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 4) ”
.

Definition test_neon_safety_wit_16 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (k: Z) (PreH1 : ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH2 : ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH3 : (0 <= k)) (PreH4 : (((k * 4 ) + batch ) = batch_pre)) (PreH5 : ((batch % ( 4 ) ) = 0)) (PreH6 : (0 <= batch)) (PreH7 : (batch <= batch_pre)) (PreH8 : (k <= (batch_pre ÷ 4 ))) (PreH9 : (16 <= batch)) (PreH10 : (4 <= (batch ÷ 4 ))) (PreH11 : (params_pre <> 0)) (PreH12 : (input_a = (input_a_pre + (k * sizeof(FLOAT))))) (PreH13 : (input_b = (input_b_pre + (k * sizeof(FLOAT))))) (PreH14 : (output = (output_pre + (k * sizeof(FLOAT))))) (PreH15 : (input_a <> 0)) (PreH16 : (input_b <> 0)) (PreH17 : (output <> 0)) ,
  ((( &( "batch" ) )) # UInt64  |-> batch)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "input_a" ) )) # Ptr  |-> input_a)
  **  ((( &( "input_b" ) )) # Ptr  |-> input_b)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_a ((batch ÷ 4 ) + 3 ) (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full input_b ((batch ÷ 4 ) + 3 ) (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
|--
  “ (4 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 4) ”
.

Definition test_neon_safety_wit_17 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (k: Z) (PreH1 : (batch >= (4 * sizeof(FLOAT) ))) (PreH2 : ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH3 : ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH4 : (0 <= k)) (PreH5 : (((k * 4 ) + batch ) = batch_pre)) (PreH6 : ((batch % ( 4 ) ) = 0)) (PreH7 : (0 <= batch)) (PreH8 : (batch <= batch_pre)) (PreH9 : (k <= (batch_pre ÷ 4 ))) (PreH10 : (batch = 0)) (PreH11 : (params_pre <> 0)) (PreH12 : (input_a = (input_a_pre + (k * sizeof(FLOAT))))) (PreH13 : (input_b = (input_b_pre + (k * sizeof(FLOAT))))) (PreH14 : (output = (output_pre + (k * sizeof(FLOAT))))) (PreH15 : (input_a <> 0)) (PreH16 : (input_b <> 0)) (PreH17 : (output <> 0)) ,
  ((( &( "batch" ) )) # UInt64  |-> batch)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "input_a" ) )) # Ptr  |-> input_a)
  **  ((( &( "input_b" ) )) # Ptr  |-> input_b)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_a ((batch ÷ 4 ) + 3 ) (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full input_b ((batch ÷ 4 ) + 3 ) (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
|--
  “ False ”
.

Definition test_neon_safety_wit_18 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (k: Z) (PreH1 : (batch >= (4 * sizeof(FLOAT) ))) (PreH2 : ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH3 : ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH4 : (0 <= k)) (PreH5 : (((k * 4 ) + batch ) = batch_pre)) (PreH6 : ((batch % ( 4 ) ) = 0)) (PreH7 : (0 <= batch)) (PreH8 : (batch <= batch_pre)) (PreH9 : (k <= (batch_pre ÷ 4 ))) (PreH10 : (batch = 4)) (PreH11 : ((batch ÷ 4 ) = 1)) (PreH12 : (params_pre <> 0)) (PreH13 : (input_a = (input_a_pre + (k * sizeof(FLOAT))))) (PreH14 : (input_b = (input_b_pre + (k * sizeof(FLOAT))))) (PreH15 : (output = (output_pre + (k * sizeof(FLOAT))))) (PreH16 : (input_a <> 0)) (PreH17 : (input_b <> 0)) (PreH18 : (output <> 0)) ,
  ((( &( "batch" ) )) # UInt64  |-> batch)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "input_a" ) )) # Ptr  |-> input_a)
  **  ((( &( "input_b" ) )) # Ptr  |-> input_b)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_a ((batch ÷ 4 ) + 3 ) (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full input_b ((batch ÷ 4 ) + 3 ) (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
|--
  “ False ”
.

Definition test_neon_safety_wit_19 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (k: Z) (PreH1 : (batch >= (4 * sizeof(FLOAT) ))) (PreH2 : ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH3 : ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH4 : (0 <= k)) (PreH5 : (((k * 4 ) + batch ) = batch_pre)) (PreH6 : ((batch % ( 4 ) ) = 0)) (PreH7 : (0 <= batch)) (PreH8 : (batch <= batch_pre)) (PreH9 : (k <= (batch_pre ÷ 4 ))) (PreH10 : (batch = 8)) (PreH11 : ((batch ÷ 4 ) = 2)) (PreH12 : (params_pre <> 0)) (PreH13 : (input_a = (input_a_pre + (k * sizeof(FLOAT))))) (PreH14 : (input_b = (input_b_pre + (k * sizeof(FLOAT))))) (PreH15 : (output = (output_pre + (k * sizeof(FLOAT))))) (PreH16 : (input_a <> 0)) (PreH17 : (input_b <> 0)) (PreH18 : (output <> 0)) ,
  ((( &( "batch" ) )) # UInt64  |-> batch)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "input_a" ) )) # Ptr  |-> input_a)
  **  ((( &( "input_b" ) )) # Ptr  |-> input_b)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_a ((batch ÷ 4 ) + 3 ) (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full input_b ((batch ÷ 4 ) + 3 ) (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
|--
  “ False ”
.

Definition test_neon_safety_wit_20 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (k: Z) (PreH1 : (batch >= (4 * sizeof(FLOAT) ))) (PreH2 : ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH3 : ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH4 : (0 <= k)) (PreH5 : (((k * 4 ) + batch ) = batch_pre)) (PreH6 : ((batch % ( 4 ) ) = 0)) (PreH7 : (0 <= batch)) (PreH8 : (batch <= batch_pre)) (PreH9 : (k <= (batch_pre ÷ 4 ))) (PreH10 : (batch = 12)) (PreH11 : ((batch ÷ 4 ) = 3)) (PreH12 : (params_pre <> 0)) (PreH13 : (input_a = (input_a_pre + (k * sizeof(FLOAT))))) (PreH14 : (input_b = (input_b_pre + (k * sizeof(FLOAT))))) (PreH15 : (output = (output_pre + (k * sizeof(FLOAT))))) (PreH16 : (input_a <> 0)) (PreH17 : (input_b <> 0)) (PreH18 : (output <> 0)) ,
  ((( &( "batch" ) )) # UInt64  |-> batch)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "input_a" ) )) # Ptr  |-> input_a)
  **  ((( &( "input_b" ) )) # Ptr  |-> input_b)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_a ((batch ÷ 4 ) + 3 ) (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full input_b ((batch ÷ 4 ) + 3 ) (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
|--
  “ False ”
.

Definition test_neon_safety_wit_21 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (k: Z) (PreH1 : (batch < (4 * sizeof(FLOAT) ))) (PreH2 : ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH3 : ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH4 : (0 <= k)) (PreH5 : (((k * 4 ) + batch ) = batch_pre)) (PreH6 : ((batch % ( 4 ) ) = 0)) (PreH7 : (0 <= batch)) (PreH8 : (batch <= batch_pre)) (PreH9 : (k <= (batch_pre ÷ 4 ))) (PreH10 : (16 <= batch)) (PreH11 : (4 <= (batch ÷ 4 ))) (PreH12 : (params_pre <> 0)) (PreH13 : (input_a = (input_a_pre + (k * sizeof(FLOAT))))) (PreH14 : (input_b = (input_b_pre + (k * sizeof(FLOAT))))) (PreH15 : (output = (output_pre + (k * sizeof(FLOAT))))) (PreH16 : (input_a <> 0)) (PreH17 : (input_b <> 0)) (PreH18 : (output <> 0)) ,
  ((( &( "batch" ) )) # UInt64  |-> batch)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "input_a" ) )) # Ptr  |-> input_a)
  **  ((( &( "input_b" ) )) # Ptr  |-> input_b)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_a ((batch ÷ 4 ) + 3 ) (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full input_b ((batch ÷ 4 ) + 3 ) (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
|--
  “ False ”
.

Definition test_neon_safety_wit_22 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (k: Z)  __default_fp32 (PreH1 : (batch >= (4 * sizeof(FLOAT) ))) (PreH2 : ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH3 : ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH4 : (0 <= k)) (PreH5 : (((k * 4 ) + batch ) = batch_pre)) (PreH6 : ((batch % ( 4 ) ) = 0)) (PreH7 : (0 <= batch)) (PreH8 : (batch <= batch_pre)) (PreH9 : (k <= (batch_pre ÷ 4 ))) (PreH10 : (16 <= batch)) (PreH11 : (4 <= (batch ÷ 4 ))) (PreH12 : (params_pre <> 0)) (PreH13 : (input_a = (input_a_pre + (k * sizeof(FLOAT))))) (PreH14 : (input_b = (input_b_pre + (k * sizeof(FLOAT))))) (PreH15 : (output = (output_pre + (k * sizeof(FLOAT))))) (PreH16 : (input_a <> 0)) (PreH17 : (input_b <> 0)) (PreH18 : (output <> 0)) ,
  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  ((( &( "batch" ) )) # UInt64  |-> batch)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "input_a" ) )) # Ptr  |-> input_a)
  **  ((( &( "input_b" ) )) # Ptr  |-> input_b)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full input_b ((batch ÷ 4 ) + 3 ) (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
|--
  “ (4 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 4) ”
.

Definition test_neon_safety_wit_23 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (k: Z)  __default_fp32 (PreH1 : (batch >= (4 * sizeof(FLOAT) ))) (PreH2 : ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH3 : ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH4 : (0 <= k)) (PreH5 : (((k * 4 ) + batch ) = batch_pre)) (PreH6 : ((batch % ( 4 ) ) = 0)) (PreH7 : (0 <= batch)) (PreH8 : (batch <= batch_pre)) (PreH9 : (k <= (batch_pre ÷ 4 ))) (PreH10 : (16 <= batch)) (PreH11 : (4 <= (batch ÷ 4 ))) (PreH12 : (params_pre <> 0)) (PreH13 : (input_a = (input_a_pre + (k * sizeof(FLOAT))))) (PreH14 : (input_b = (input_b_pre + (k * sizeof(FLOAT))))) (PreH15 : (output = (output_pre + (k * sizeof(FLOAT))))) (PreH16 : (input_a <> 0)) (PreH17 : (input_b <> 0)) (PreH18 : (output <> 0)) ,
  ((&(( &( "vb" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  ((( &( "batch" ) )) # UInt64  |-> batch)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "input_a" ) )) # Ptr  |-> (input_a + (4 * sizeof(FLOAT))))
  **  ((( &( "input_b" ) )) # Ptr  |-> input_b)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
|--
  “ (4 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 4) ”
.

Definition test_neon_safety_wit_24 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (k: Z)  __default_fp32 (PreH1 : (batch >= (4 * sizeof(FLOAT) ))) (PreH2 : ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH3 : ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH4 : (0 <= k)) (PreH5 : (((k * 4 ) + batch ) = batch_pre)) (PreH6 : ((batch % ( 4 ) ) = 0)) (PreH7 : (0 <= batch)) (PreH8 : (batch <= batch_pre)) (PreH9 : (k <= (batch_pre ÷ 4 ))) (PreH10 : (16 <= batch)) (PreH11 : (4 <= (batch ÷ 4 ))) (PreH12 : (params_pre <> 0)) (PreH13 : (input_a = (input_a_pre + (k * sizeof(FLOAT))))) (PreH14 : (input_b = (input_b_pre + (k * sizeof(FLOAT))))) (PreH15 : (output = (output_pre + (k * sizeof(FLOAT))))) (PreH16 : (input_a <> 0)) (PreH17 : (input_b <> 0)) (PreH18 : (output <> 0)) ,
  (((output + (0 * sizeof(FLOAT)))) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((output + (1 * sizeof(FLOAT)))) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((output + (2 * sizeof(FLOAT)))) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((output + (3 * sizeof(FLOAT)))) # Float  |-> (fp32_add ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (FloatArray.undef_seg output 4 (batch ÷ 4 ) )
  **  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  ((( &( "batch" ) )) # UInt64  |-> batch)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "input_a" ) )) # Ptr  |-> (input_a + (4 * sizeof(FLOAT))))
  **  ((( &( "input_b" ) )) # Ptr  |-> (input_b + (4 * sizeof(FLOAT))))
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vacc" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # Float  |-> (fp32_add ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((output + (0 * sizeof(FLOAT)))) # Float  |->_)
  **  (((output + (1 * sizeof(FLOAT)))) # Float  |->_)
  **  (((output + (2 * sizeof(FLOAT)))) # Float  |->_)
  **  (((output + (3 * sizeof(FLOAT)))) # Float  |->_)
|--
  “ (4 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 4) ”
.

Definition test_neon_safety_wit_25 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (k: Z)  __default_fp32 (PreH1 : (batch >= (4 * sizeof(FLOAT) ))) (PreH2 : ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH3 : ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH4 : (0 <= k)) (PreH5 : (((k * 4 ) + batch ) = batch_pre)) (PreH6 : ((batch % ( 4 ) ) = 0)) (PreH7 : (0 <= batch)) (PreH8 : (batch <= batch_pre)) (PreH9 : (k <= (batch_pre ÷ 4 ))) (PreH10 : (16 <= batch)) (PreH11 : (4 <= (batch ÷ 4 ))) (PreH12 : (params_pre <> 0)) (PreH13 : (input_a = (input_a_pre + (k * sizeof(FLOAT))))) (PreH14 : (input_b = (input_b_pre + (k * sizeof(FLOAT))))) (PreH15 : (output = (output_pre + (k * sizeof(FLOAT))))) (PreH16 : (input_a <> 0)) (PreH17 : (input_b <> 0)) (PreH18 : (output <> 0)) ,
  (((output + (0 * sizeof(FLOAT)))) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((output + (1 * sizeof(FLOAT)))) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((output + (2 * sizeof(FLOAT)))) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((output + (3 * sizeof(FLOAT)))) # Float  |-> (fp32_add ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (FloatArray.undef_seg output 4 (batch ÷ 4 ) )
  **  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  ((( &( "batch" ) )) # UInt64  |-> batch)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "input_a" ) )) # Ptr  |-> (input_a + (4 * sizeof(FLOAT))))
  **  ((( &( "input_b" ) )) # Ptr  |-> (input_b + (4 * sizeof(FLOAT))))
  **  ((( &( "output" ) )) # Ptr  |-> (output + (4 * sizeof(FLOAT))))
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (((output + (0 * sizeof(FLOAT)))) # Float  |->_)
  **  (((output + (1 * sizeof(FLOAT)))) # Float  |->_)
  **  (((output + (2 * sizeof(FLOAT)))) # Float  |->_)
  **  (((output + (3 * sizeof(FLOAT)))) # Float  |->_)
|--
  “ (4 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 4) ”
.

Definition test_neon_safety_wit_26 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (k: Z) (PreH1 : (batch < (4 * sizeof(FLOAT) ))) (PreH2 : ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH3 : ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH4 : (0 <= k)) (PreH5 : (((k * 4 ) + batch ) = batch_pre)) (PreH6 : ((batch % ( 4 ) ) = 0)) (PreH7 : (0 <= batch)) (PreH8 : (batch <= batch_pre)) (PreH9 : (k <= (batch_pre ÷ 4 ))) (PreH10 : (batch = 0)) (PreH11 : (params_pre <> 0)) (PreH12 : (input_a = (input_a_pre + (k * sizeof(FLOAT))))) (PreH13 : (input_b = (input_b_pre + (k * sizeof(FLOAT))))) (PreH14 : (output = (output_pre + (k * sizeof(FLOAT))))) (PreH15 : (input_a <> 0)) (PreH16 : (input_b <> 0)) (PreH17 : (output <> 0)) ,
  ((( &( "batch" ) )) # UInt64  |-> batch)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "input_a" ) )) # Ptr  |-> input_a)
  **  ((( &( "input_b" ) )) # Ptr  |-> input_b)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_a ((batch ÷ 4 ) + 3 ) (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full input_b ((batch ÷ 4 ) + 3 ) (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition test_neon_safety_wit_27 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (k: Z) (PreH1 : (batch < (4 * sizeof(FLOAT) ))) (PreH2 : ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH3 : ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH4 : (0 <= k)) (PreH5 : (((k * 4 ) + batch ) = batch_pre)) (PreH6 : ((batch % ( 4 ) ) = 0)) (PreH7 : (0 <= batch)) (PreH8 : (batch <= batch_pre)) (PreH9 : (k <= (batch_pre ÷ 4 ))) (PreH10 : (batch = 4)) (PreH11 : ((batch ÷ 4 ) = 1)) (PreH12 : (params_pre <> 0)) (PreH13 : (input_a = (input_a_pre + (k * sizeof(FLOAT))))) (PreH14 : (input_b = (input_b_pre + (k * sizeof(FLOAT))))) (PreH15 : (output = (output_pre + (k * sizeof(FLOAT))))) (PreH16 : (input_a <> 0)) (PreH17 : (input_b <> 0)) (PreH18 : (output <> 0)) ,
  ((( &( "batch" ) )) # UInt64  |-> batch)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "input_a" ) )) # Ptr  |-> input_a)
  **  ((( &( "input_b" ) )) # Ptr  |-> input_b)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_a ((batch ÷ 4 ) + 3 ) (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full input_b ((batch ÷ 4 ) + 3 ) (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition test_neon_safety_wit_28 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (k: Z) (PreH1 : (batch < (4 * sizeof(FLOAT) ))) (PreH2 : ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH3 : ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH4 : (0 <= k)) (PreH5 : (((k * 4 ) + batch ) = batch_pre)) (PreH6 : ((batch % ( 4 ) ) = 0)) (PreH7 : (0 <= batch)) (PreH8 : (batch <= batch_pre)) (PreH9 : (k <= (batch_pre ÷ 4 ))) (PreH10 : (batch = 8)) (PreH11 : ((batch ÷ 4 ) = 2)) (PreH12 : (params_pre <> 0)) (PreH13 : (input_a = (input_a_pre + (k * sizeof(FLOAT))))) (PreH14 : (input_b = (input_b_pre + (k * sizeof(FLOAT))))) (PreH15 : (output = (output_pre + (k * sizeof(FLOAT))))) (PreH16 : (input_a <> 0)) (PreH17 : (input_b <> 0)) (PreH18 : (output <> 0)) ,
  ((( &( "batch" ) )) # UInt64  |-> batch)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "input_a" ) )) # Ptr  |-> input_a)
  **  ((( &( "input_b" ) )) # Ptr  |-> input_b)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_a ((batch ÷ 4 ) + 3 ) (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full input_b ((batch ÷ 4 ) + 3 ) (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition test_neon_safety_wit_29 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (k: Z) (PreH1 : (batch < (4 * sizeof(FLOAT) ))) (PreH2 : ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH3 : ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH4 : (0 <= k)) (PreH5 : (((k * 4 ) + batch ) = batch_pre)) (PreH6 : ((batch % ( 4 ) ) = 0)) (PreH7 : (0 <= batch)) (PreH8 : (batch <= batch_pre)) (PreH9 : (k <= (batch_pre ÷ 4 ))) (PreH10 : (batch = 12)) (PreH11 : ((batch ÷ 4 ) = 3)) (PreH12 : (params_pre <> 0)) (PreH13 : (input_a = (input_a_pre + (k * sizeof(FLOAT))))) (PreH14 : (input_b = (input_b_pre + (k * sizeof(FLOAT))))) (PreH15 : (output = (output_pre + (k * sizeof(FLOAT))))) (PreH16 : (input_a <> 0)) (PreH17 : (input_b <> 0)) (PreH18 : (output <> 0)) ,
  ((( &( "batch" ) )) # UInt64  |-> batch)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "input_a" ) )) # Ptr  |-> input_a)
  **  ((( &( "input_b" ) )) # Ptr  |-> input_b)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_a ((batch ÷ 4 ) + 3 ) (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full input_b ((batch ÷ 4 ) + 3 ) (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition test_neon_safety_wit_30 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (k: Z) (PreH1 : (batch <> 0)) (PreH2 : (batch < (4 * sizeof(FLOAT) ))) (PreH3 : ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH4 : ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH5 : (0 <= k)) (PreH6 : (((k * 4 ) + batch ) = batch_pre)) (PreH7 : ((batch % ( 4 ) ) = 0)) (PreH8 : (0 <= batch)) (PreH9 : (batch <= batch_pre)) (PreH10 : (k <= (batch_pre ÷ 4 ))) (PreH11 : (batch = 0)) (PreH12 : (params_pre <> 0)) (PreH13 : (input_a = (input_a_pre + (k * sizeof(FLOAT))))) (PreH14 : (input_b = (input_b_pre + (k * sizeof(FLOAT))))) (PreH15 : (output = (output_pre + (k * sizeof(FLOAT))))) (PreH16 : (input_a <> 0)) (PreH17 : (input_b <> 0)) (PreH18 : (output <> 0)) ,
  ((( &( "batch" ) )) # UInt64  |-> batch)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "input_a" ) )) # Ptr  |-> input_a)
  **  ((( &( "input_b" ) )) # Ptr  |-> input_b)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_a ((batch ÷ 4 ) + 3 ) (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full input_b ((batch ÷ 4 ) + 3 ) (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
|--
  “ False ”
.

Definition test_neon_safety_wit_31 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (k: Z) (PreH1 : (batch = 0)) (PreH2 : (batch < (4 * sizeof(FLOAT) ))) (PreH3 : ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH4 : ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH5 : (0 <= k)) (PreH6 : (((k * 4 ) + batch ) = batch_pre)) (PreH7 : ((batch % ( 4 ) ) = 0)) (PreH8 : (0 <= batch)) (PreH9 : (batch <= batch_pre)) (PreH10 : (k <= (batch_pre ÷ 4 ))) (PreH11 : (batch = 4)) (PreH12 : ((batch ÷ 4 ) = 1)) (PreH13 : (params_pre <> 0)) (PreH14 : (input_a = (input_a_pre + (k * sizeof(FLOAT))))) (PreH15 : (input_b = (input_b_pre + (k * sizeof(FLOAT))))) (PreH16 : (output = (output_pre + (k * sizeof(FLOAT))))) (PreH17 : (input_a <> 0)) (PreH18 : (input_b <> 0)) (PreH19 : (output <> 0)) ,
  ((( &( "batch" ) )) # UInt64  |-> batch)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "input_a" ) )) # Ptr  |-> input_a)
  **  ((( &( "input_b" ) )) # Ptr  |-> input_b)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_a ((batch ÷ 4 ) + 3 ) (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full input_b ((batch ÷ 4 ) + 3 ) (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
|--
  “ False ”
.

Definition test_neon_safety_wit_32 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (k: Z) (PreH1 : (batch = 0)) (PreH2 : (batch < (4 * sizeof(FLOAT) ))) (PreH3 : ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH4 : ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH5 : (0 <= k)) (PreH6 : (((k * 4 ) + batch ) = batch_pre)) (PreH7 : ((batch % ( 4 ) ) = 0)) (PreH8 : (0 <= batch)) (PreH9 : (batch <= batch_pre)) (PreH10 : (k <= (batch_pre ÷ 4 ))) (PreH11 : (batch = 8)) (PreH12 : ((batch ÷ 4 ) = 2)) (PreH13 : (params_pre <> 0)) (PreH14 : (input_a = (input_a_pre + (k * sizeof(FLOAT))))) (PreH15 : (input_b = (input_b_pre + (k * sizeof(FLOAT))))) (PreH16 : (output = (output_pre + (k * sizeof(FLOAT))))) (PreH17 : (input_a <> 0)) (PreH18 : (input_b <> 0)) (PreH19 : (output <> 0)) ,
  ((( &( "batch" ) )) # UInt64  |-> batch)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "input_a" ) )) # Ptr  |-> input_a)
  **  ((( &( "input_b" ) )) # Ptr  |-> input_b)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_a ((batch ÷ 4 ) + 3 ) (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full input_b ((batch ÷ 4 ) + 3 ) (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
|--
  “ False ”
.

Definition test_neon_safety_wit_33 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (k: Z) (PreH1 : (batch = 0)) (PreH2 : (batch < (4 * sizeof(FLOAT) ))) (PreH3 : ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH4 : ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH5 : (0 <= k)) (PreH6 : (((k * 4 ) + batch ) = batch_pre)) (PreH7 : ((batch % ( 4 ) ) = 0)) (PreH8 : (0 <= batch)) (PreH9 : (batch <= batch_pre)) (PreH10 : (k <= (batch_pre ÷ 4 ))) (PreH11 : (batch = 12)) (PreH12 : ((batch ÷ 4 ) = 3)) (PreH13 : (params_pre <> 0)) (PreH14 : (input_a = (input_a_pre + (k * sizeof(FLOAT))))) (PreH15 : (input_b = (input_b_pre + (k * sizeof(FLOAT))))) (PreH16 : (output = (output_pre + (k * sizeof(FLOAT))))) (PreH17 : (input_a <> 0)) (PreH18 : (input_b <> 0)) (PreH19 : (output <> 0)) ,
  ((( &( "batch" ) )) # UInt64  |-> batch)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "input_a" ) )) # Ptr  |-> input_a)
  **  ((( &( "input_b" ) )) # Ptr  |-> input_b)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_a ((batch ÷ 4 ) + 3 ) (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full input_b ((batch ÷ 4 ) + 3 ) (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
|--
  “ False ”
.

Definition test_neon_safety_wit_34 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (k: Z)  __default_fp32 (PreH1 : (batch <> 0)) (PreH2 : (batch < (4 * sizeof(FLOAT) ))) (PreH3 : ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH4 : ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH5 : (0 <= k)) (PreH6 : (((k * 4 ) + batch ) = batch_pre)) (PreH7 : ((batch % ( 4 ) ) = 0)) (PreH8 : (0 <= batch)) (PreH9 : (batch <= batch_pre)) (PreH10 : (k <= (batch_pre ÷ 4 ))) (PreH11 : (batch = 4)) (PreH12 : ((batch ÷ 4 ) = 1)) (PreH13 : (params_pre <> 0)) (PreH14 : (input_a = (input_a_pre + (k * sizeof(FLOAT))))) (PreH15 : (input_b = (input_b_pre + (k * sizeof(FLOAT))))) (PreH16 : (output = (output_pre + (k * sizeof(FLOAT))))) (PreH17 : (input_a <> 0)) (PreH18 : (input_b <> 0)) (PreH19 : (output <> 0)) ,
  ((&(( &( "vacc_lo" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc_lo" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  ((( &( "batch" ) )) # UInt64  |-> batch)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "input_a" ) )) # Ptr  |-> input_a)
  **  ((( &( "input_b" ) )) # Ptr  |-> input_b)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vacc" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # Float  |-> (fp32_add ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition test_neon_safety_wit_35 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (k: Z)  __default_fp32 (PreH1 : (batch <> 0)) (PreH2 : (batch < (4 * sizeof(FLOAT) ))) (PreH3 : ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH4 : ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH5 : (0 <= k)) (PreH6 : (((k * 4 ) + batch ) = batch_pre)) (PreH7 : ((batch % ( 4 ) ) = 0)) (PreH8 : (0 <= batch)) (PreH9 : (batch <= batch_pre)) (PreH10 : (k <= (batch_pre ÷ 4 ))) (PreH11 : (batch = 8)) (PreH12 : ((batch ÷ 4 ) = 2)) (PreH13 : (params_pre <> 0)) (PreH14 : (input_a = (input_a_pre + (k * sizeof(FLOAT))))) (PreH15 : (input_b = (input_b_pre + (k * sizeof(FLOAT))))) (PreH16 : (output = (output_pre + (k * sizeof(FLOAT))))) (PreH17 : (input_a <> 0)) (PreH18 : (input_b <> 0)) (PreH19 : (output <> 0)) ,
  ((&(( &( "vacc_lo" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc_lo" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  ((( &( "batch" ) )) # UInt64  |-> batch)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "input_a" ) )) # Ptr  |-> input_a)
  **  ((( &( "input_b" ) )) # Ptr  |-> input_b)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vacc" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # Float  |-> (fp32_add ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition test_neon_safety_wit_36 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (k: Z)  __default_fp32 (PreH1 : (batch <> 0)) (PreH2 : (batch < (4 * sizeof(FLOAT) ))) (PreH3 : ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH4 : ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH5 : (0 <= k)) (PreH6 : (((k * 4 ) + batch ) = batch_pre)) (PreH7 : ((batch % ( 4 ) ) = 0)) (PreH8 : (0 <= batch)) (PreH9 : (batch <= batch_pre)) (PreH10 : (k <= (batch_pre ÷ 4 ))) (PreH11 : (batch = 12)) (PreH12 : ((batch ÷ 4 ) = 3)) (PreH13 : (params_pre <> 0)) (PreH14 : (input_a = (input_a_pre + (k * sizeof(FLOAT))))) (PreH15 : (input_b = (input_b_pre + (k * sizeof(FLOAT))))) (PreH16 : (output = (output_pre + (k * sizeof(FLOAT))))) (PreH17 : (input_a <> 0)) (PreH18 : (input_b <> 0)) (PreH19 : (output <> 0)) ,
  ((&(( &( "vacc_lo" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc_lo" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  ((( &( "batch" ) )) # UInt64  |-> batch)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "input_a" ) )) # Ptr  |-> input_a)
  **  ((( &( "input_b" ) )) # Ptr  |-> input_b)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vacc" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # Float  |-> (fp32_add ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition test_neon_safety_wit_37 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (k: Z)  __default_fp32 (PreH1 : (batch <> 0)) (PreH2 : (batch < (4 * sizeof(FLOAT) ))) (PreH3 : ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH4 : ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH5 : (0 <= k)) (PreH6 : (((k * 4 ) + batch ) = batch_pre)) (PreH7 : ((batch % ( 4 ) ) = 0)) (PreH8 : (0 <= batch)) (PreH9 : (batch <= batch_pre)) (PreH10 : (k <= (batch_pre ÷ 4 ))) (PreH11 : (batch = 8)) (PreH12 : ((batch ÷ 4 ) = 2)) (PreH13 : (params_pre <> 0)) (PreH14 : (input_a = (input_a_pre + (k * sizeof(FLOAT))))) (PreH15 : (input_b = (input_b_pre + (k * sizeof(FLOAT))))) (PreH16 : (output = (output_pre + (k * sizeof(FLOAT))))) (PreH17 : (input_a <> 0)) (PreH18 : (input_b <> 0)) (PreH19 : (output <> 0)) (PreH20 : ((Z.land batch (2 * sizeof(FLOAT) )) = 0)) ,
  ((&(( &( "vacc_lo" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc_lo" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  ((( &( "batch" ) )) # UInt64  |-> batch)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "input_a" ) )) # Ptr  |-> input_a)
  **  ((( &( "input_b" ) )) # Ptr  |-> input_b)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vacc" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # Float  |-> (fp32_add ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
|--
  “ False ”
.

Definition test_neon_safety_wit_38 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (k: Z)  __default_fp32 (PreH1 : (batch <> 0)) (PreH2 : (batch < (4 * sizeof(FLOAT) ))) (PreH3 : ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH4 : ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH5 : (0 <= k)) (PreH6 : (((k * 4 ) + batch ) = batch_pre)) (PreH7 : ((batch % ( 4 ) ) = 0)) (PreH8 : (0 <= batch)) (PreH9 : (batch <= batch_pre)) (PreH10 : (k <= (batch_pre ÷ 4 ))) (PreH11 : (batch = 12)) (PreH12 : ((batch ÷ 4 ) = 3)) (PreH13 : (params_pre <> 0)) (PreH14 : (input_a = (input_a_pre + (k * sizeof(FLOAT))))) (PreH15 : (input_b = (input_b_pre + (k * sizeof(FLOAT))))) (PreH16 : (output = (output_pre + (k * sizeof(FLOAT))))) (PreH17 : (input_a <> 0)) (PreH18 : (input_b <> 0)) (PreH19 : (output <> 0)) (PreH20 : ((Z.land batch (2 * sizeof(FLOAT) )) = 0)) ,
  ((&(( &( "vacc_lo" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc_lo" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  ((( &( "batch" ) )) # UInt64  |-> batch)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "input_a" ) )) # Ptr  |-> input_a)
  **  ((( &( "input_b" ) )) # Ptr  |-> input_b)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vacc" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # Float  |-> (fp32_add ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
|--
  “ False ”
.

Definition test_neon_safety_wit_39 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (k: Z)  __default_fp32 (PreH1 : (batch <> 0)) (PreH2 : (batch < (4 * sizeof(FLOAT) ))) (PreH3 : ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH4 : ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH5 : (0 <= k)) (PreH6 : (((k * 4 ) + batch ) = batch_pre)) (PreH7 : ((batch % ( 4 ) ) = 0)) (PreH8 : (0 <= batch)) (PreH9 : (batch <= batch_pre)) (PreH10 : (k <= (batch_pre ÷ 4 ))) (PreH11 : (batch = 4)) (PreH12 : ((batch ÷ 4 ) = 1)) (PreH13 : (params_pre <> 0)) (PreH14 : (input_a = (input_a_pre + (k * sizeof(FLOAT))))) (PreH15 : (input_b = (input_b_pre + (k * sizeof(FLOAT))))) (PreH16 : (output = (output_pre + (k * sizeof(FLOAT))))) (PreH17 : (input_a <> 0)) (PreH18 : (input_b <> 0)) (PreH19 : (output <> 0)) (PreH20 : ((Z.land batch (2 * sizeof(FLOAT) )) <> 0)) ,
  ((&(( &( "vacc_lo" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc_lo" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  ((( &( "batch" ) )) # UInt64  |-> batch)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "input_a" ) )) # Ptr  |-> input_a)
  **  ((( &( "input_b" ) )) # Ptr  |-> input_b)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vacc" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # Float  |-> (fp32_add ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
|--
  “ False ”
.

Definition test_neon_safety_wit_40 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (k: Z)  __default_fp32 (PreH1 : (batch <> 0)) (PreH2 : (batch < (4 * sizeof(FLOAT) ))) (PreH3 : ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH4 : ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH5 : (0 <= k)) (PreH6 : (((k * 4 ) + batch ) = batch_pre)) (PreH7 : ((batch % ( 4 ) ) = 0)) (PreH8 : (0 <= batch)) (PreH9 : (batch <= batch_pre)) (PreH10 : (k <= (batch_pre ÷ 4 ))) (PreH11 : (batch = 8)) (PreH12 : ((batch ÷ 4 ) = 2)) (PreH13 : (params_pre <> 0)) (PreH14 : (input_a = (input_a_pre + (k * sizeof(FLOAT))))) (PreH15 : (input_b = (input_b_pre + (k * sizeof(FLOAT))))) (PreH16 : (output = (output_pre + (k * sizeof(FLOAT))))) (PreH17 : (input_a <> 0)) (PreH18 : (input_b <> 0)) (PreH19 : (output <> 0)) (PreH20 : ((Z.land batch (2 * sizeof(FLOAT) )) <> 0)) ,
  (((output + (0 * sizeof(FLOAT)))) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((output + (1 * sizeof(FLOAT)))) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (FloatArray.undef_seg output 2 (batch ÷ 4 ) )
  **  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  ((( &( "batch" ) )) # UInt64  |-> batch)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "input_a" ) )) # Ptr  |-> input_a)
  **  ((( &( "input_b" ) )) # Ptr  |-> input_b)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vacc" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # Float  |-> (fp32_add ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc_lo" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc_lo" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((output + (0 * sizeof(FLOAT)))) # Float  |->_)
  **  (((output + (1 * sizeof(FLOAT)))) # Float  |->_)
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition test_neon_safety_wit_41 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (k: Z)  __default_fp32 (PreH1 : (batch <> 0)) (PreH2 : (batch < (4 * sizeof(FLOAT) ))) (PreH3 : ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH4 : ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH5 : (0 <= k)) (PreH6 : (((k * 4 ) + batch ) = batch_pre)) (PreH7 : ((batch % ( 4 ) ) = 0)) (PreH8 : (0 <= batch)) (PreH9 : (batch <= batch_pre)) (PreH10 : (k <= (batch_pre ÷ 4 ))) (PreH11 : (batch = 12)) (PreH12 : ((batch ÷ 4 ) = 3)) (PreH13 : (params_pre <> 0)) (PreH14 : (input_a = (input_a_pre + (k * sizeof(FLOAT))))) (PreH15 : (input_b = (input_b_pre + (k * sizeof(FLOAT))))) (PreH16 : (output = (output_pre + (k * sizeof(FLOAT))))) (PreH17 : (input_a <> 0)) (PreH18 : (input_b <> 0)) (PreH19 : (output <> 0)) (PreH20 : ((Z.land batch (2 * sizeof(FLOAT) )) <> 0)) ,
  (((output + (0 * sizeof(FLOAT)))) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((output + (1 * sizeof(FLOAT)))) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (FloatArray.undef_seg output 2 (batch ÷ 4 ) )
  **  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  ((( &( "batch" ) )) # UInt64  |-> batch)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "input_a" ) )) # Ptr  |-> input_a)
  **  ((( &( "input_b" ) )) # Ptr  |-> input_b)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vacc" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # Float  |-> (fp32_add ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc_lo" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc_lo" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((output + (0 * sizeof(FLOAT)))) # Float  |->_)
  **  (((output + (1 * sizeof(FLOAT)))) # Float  |->_)
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition test_neon_safety_wit_42 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (k: Z)  __default_fp32 (PreH1 : (batch <> 0)) (PreH2 : (batch < (4 * sizeof(FLOAT) ))) (PreH3 : ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH4 : ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH5 : (0 <= k)) (PreH6 : (((k * 4 ) + batch ) = batch_pre)) (PreH7 : ((batch % ( 4 ) ) = 0)) (PreH8 : (0 <= batch)) (PreH9 : (batch <= batch_pre)) (PreH10 : (k <= (batch_pre ÷ 4 ))) (PreH11 : (batch = 12)) (PreH12 : ((batch ÷ 4 ) = 3)) (PreH13 : (params_pre <> 0)) (PreH14 : (input_a = (input_a_pre + (k * sizeof(FLOAT))))) (PreH15 : (input_b = (input_b_pre + (k * sizeof(FLOAT))))) (PreH16 : (output = (output_pre + (k * sizeof(FLOAT))))) (PreH17 : (input_a <> 0)) (PreH18 : (input_b <> 0)) (PreH19 : (output <> 0)) (PreH20 : ((Z.land batch (2 * sizeof(FLOAT) )) <> 0)) ,
  ((&(( &( "vacc_lo" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc_lo" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((output + (0 * sizeof(FLOAT)))) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((output + (1 * sizeof(FLOAT)))) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (FloatArray.undef_seg output 2 (batch ÷ 4 ) )
  **  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  ((( &( "batch" ) )) # UInt64  |-> batch)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "input_a" ) )) # Ptr  |-> input_a)
  **  ((( &( "input_b" ) )) # Ptr  |-> input_b)
  **  ((( &( "output" ) )) # Ptr  |-> (output + (2 * sizeof(FLOAT))))
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((output + (0 * sizeof(FLOAT)))) # Float  |->_)
  **  (((output + (1 * sizeof(FLOAT)))) # Float  |->_)
  **  ((&(( &( "vacc" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # Float  |-> (fp32_add ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition test_neon_safety_wit_43 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (k: Z)  __default_fp32 (PreH1 : (batch <> 0)) (PreH2 : (batch < (4 * sizeof(FLOAT) ))) (PreH3 : ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH4 : ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH5 : (0 <= k)) (PreH6 : (((k * 4 ) + batch ) = batch_pre)) (PreH7 : ((batch % ( 4 ) ) = 0)) (PreH8 : (0 <= batch)) (PreH9 : (batch <= batch_pre)) (PreH10 : (k <= (batch_pre ÷ 4 ))) (PreH11 : (batch = 8)) (PreH12 : ((batch ÷ 4 ) = 2)) (PreH13 : (params_pre <> 0)) (PreH14 : (input_a = (input_a_pre + (k * sizeof(FLOAT))))) (PreH15 : (input_b = (input_b_pre + (k * sizeof(FLOAT))))) (PreH16 : (output = (output_pre + (k * sizeof(FLOAT))))) (PreH17 : (input_a <> 0)) (PreH18 : (input_b <> 0)) (PreH19 : (output <> 0)) (PreH20 : ((Z.land batch (2 * sizeof(FLOAT) )) <> 0)) ,
  ((&(( &( "vacc_lo" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc_lo" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((output + (0 * sizeof(FLOAT)))) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((output + (1 * sizeof(FLOAT)))) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (FloatArray.undef_seg output 2 (batch ÷ 4 ) )
  **  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  ((( &( "batch" ) )) # UInt64  |-> batch)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "input_a" ) )) # Ptr  |-> input_a)
  **  ((( &( "input_b" ) )) # Ptr  |-> input_b)
  **  ((( &( "output" ) )) # Ptr  |-> (output + (2 * sizeof(FLOAT))))
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((output + (0 * sizeof(FLOAT)))) # Float  |->_)
  **  (((output + (1 * sizeof(FLOAT)))) # Float  |->_)
  **  ((&(( &( "vacc" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # Float  |-> (fp32_add ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition test_neon_safety_wit_44 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (k: Z)  __default_fp32 (PreH1 : (batch <> 0)) (PreH2 : (batch < (4 * sizeof(FLOAT) ))) (PreH3 : ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH4 : ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH5 : (0 <= k)) (PreH6 : (((k * 4 ) + batch ) = batch_pre)) (PreH7 : ((batch % ( 4 ) ) = 0)) (PreH8 : (0 <= batch)) (PreH9 : (batch <= batch_pre)) (PreH10 : (k <= (batch_pre ÷ 4 ))) (PreH11 : (batch = 4)) (PreH12 : ((batch ÷ 4 ) = 1)) (PreH13 : (params_pre <> 0)) (PreH14 : (input_a = (input_a_pre + (k * sizeof(FLOAT))))) (PreH15 : (input_b = (input_b_pre + (k * sizeof(FLOAT))))) (PreH16 : (output = (output_pre + (k * sizeof(FLOAT))))) (PreH17 : (input_a <> 0)) (PreH18 : (input_b <> 0)) (PreH19 : (output <> 0)) (PreH20 : ((Z.land batch (2 * sizeof(FLOAT) )) = 0)) ,
  ((&(( &( "vacc_lo" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc_lo" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  ((( &( "batch" ) )) # UInt64  |-> batch)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "input_a" ) )) # Ptr  |-> input_a)
  **  ((( &( "input_b" ) )) # Ptr  |-> input_b)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vacc" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # Float  |-> (fp32_add ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition test_neon_safety_wit_45 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (k: Z)  __default_fp32 (PreH1 : (batch <> 0)) (PreH2 : (batch < (4 * sizeof(FLOAT) ))) (PreH3 : ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH4 : ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH5 : (0 <= k)) (PreH6 : (((k * 4 ) + batch ) = batch_pre)) (PreH7 : ((batch % ( 4 ) ) = 0)) (PreH8 : (0 <= batch)) (PreH9 : (batch <= batch_pre)) (PreH10 : (k <= (batch_pre ÷ 4 ))) (PreH11 : (batch = 12)) (PreH12 : ((batch ÷ 4 ) = 3)) (PreH13 : (params_pre <> 0)) (PreH14 : (input_a = (input_a_pre + (k * sizeof(FLOAT))))) (PreH15 : (input_b = (input_b_pre + (k * sizeof(FLOAT))))) (PreH16 : (output = (output_pre + (k * sizeof(FLOAT))))) (PreH17 : (input_a <> 0)) (PreH18 : (input_b <> 0)) (PreH19 : (output <> 0)) (PreH20 : ((Z.land batch (2 * sizeof(FLOAT) )) <> 0)) (PreH21 : ((Z.land batch (1 * sizeof(FLOAT) )) = 0)) ,
  ((&(( &( "vacc_lo" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc_lo" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((output + (0 * sizeof(FLOAT)))) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((output + (1 * sizeof(FLOAT)))) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (FloatArray.undef_seg output 2 (batch ÷ 4 ) )
  **  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  ((( &( "batch" ) )) # UInt64  |-> batch)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "input_a" ) )) # Ptr  |-> input_a)
  **  ((( &( "input_b" ) )) # Ptr  |-> input_b)
  **  ((( &( "output" ) )) # Ptr  |-> (output + (2 * sizeof(FLOAT))))
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((output + (0 * sizeof(FLOAT)))) # Float  |->_)
  **  (((output + (1 * sizeof(FLOAT)))) # Float  |->_)
  **  ((&(( &( "vacc" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # Float  |-> (fp32_add ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
|--
  “ False ”
.

Definition test_neon_safety_wit_46 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (k: Z)  __default_fp32 (PreH1 : (batch <> 0)) (PreH2 : (batch < (4 * sizeof(FLOAT) ))) (PreH3 : ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH4 : ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH5 : (0 <= k)) (PreH6 : (((k * 4 ) + batch ) = batch_pre)) (PreH7 : ((batch % ( 4 ) ) = 0)) (PreH8 : (0 <= batch)) (PreH9 : (batch <= batch_pre)) (PreH10 : (k <= (batch_pre ÷ 4 ))) (PreH11 : (batch = 4)) (PreH12 : ((batch ÷ 4 ) = 1)) (PreH13 : (params_pre <> 0)) (PreH14 : (input_a = (input_a_pre + (k * sizeof(FLOAT))))) (PreH15 : (input_b = (input_b_pre + (k * sizeof(FLOAT))))) (PreH16 : (output = (output_pre + (k * sizeof(FLOAT))))) (PreH17 : (input_a <> 0)) (PreH18 : (input_b <> 0)) (PreH19 : (output <> 0)) (PreH20 : ((Z.land batch (2 * sizeof(FLOAT) )) = 0)) (PreH21 : ((Z.land batch (1 * sizeof(FLOAT) )) = 0)) ,
  ((&(( &( "vacc_lo" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc_lo" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  ((( &( "batch" ) )) # UInt64  |-> batch)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "input_a" ) )) # Ptr  |-> input_a)
  **  ((( &( "input_b" ) )) # Ptr  |-> input_b)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vacc" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # Float  |-> (fp32_add ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
|--
  “ False ”
.

Definition test_neon_safety_wit_47 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (k: Z)  __default_fp32 (PreH1 : (batch <> 0)) (PreH2 : (batch < (4 * sizeof(FLOAT) ))) (PreH3 : ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH4 : ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH5 : (0 <= k)) (PreH6 : (((k * 4 ) + batch ) = batch_pre)) (PreH7 : ((batch % ( 4 ) ) = 0)) (PreH8 : (0 <= batch)) (PreH9 : (batch <= batch_pre)) (PreH10 : (k <= (batch_pre ÷ 4 ))) (PreH11 : (batch = 8)) (PreH12 : ((batch ÷ 4 ) = 2)) (PreH13 : (params_pre <> 0)) (PreH14 : (input_a = (input_a_pre + (k * sizeof(FLOAT))))) (PreH15 : (input_b = (input_b_pre + (k * sizeof(FLOAT))))) (PreH16 : (output = (output_pre + (k * sizeof(FLOAT))))) (PreH17 : (input_a <> 0)) (PreH18 : (input_b <> 0)) (PreH19 : (output <> 0)) (PreH20 : ((Z.land batch (2 * sizeof(FLOAT) )) <> 0)) (PreH21 : ((Z.land batch (1 * sizeof(FLOAT) )) <> 0)) ,
  ((&(( &( "vacc_lo" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc_lo" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((output + (0 * sizeof(FLOAT)))) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((output + (1 * sizeof(FLOAT)))) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (FloatArray.undef_seg output 2 (batch ÷ 4 ) )
  **  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  ((( &( "batch" ) )) # UInt64  |-> batch)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "input_a" ) )) # Ptr  |-> input_a)
  **  ((( &( "input_b" ) )) # Ptr  |-> input_b)
  **  ((( &( "output" ) )) # Ptr  |-> (output + (2 * sizeof(FLOAT))))
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((output + (0 * sizeof(FLOAT)))) # Float  |->_)
  **  (((output + (1 * sizeof(FLOAT)))) # Float  |->_)
  **  ((&(( &( "vacc" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # Float  |-> (fp32_add ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
|--
  “ False ”
.

Definition test_neon_safety_wit_48 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (k: Z)  __default_fp32 (PreH1 : (batch <> 0)) (PreH2 : (batch < (4 * sizeof(FLOAT) ))) (PreH3 : ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH4 : ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH5 : (0 <= k)) (PreH6 : (((k * 4 ) + batch ) = batch_pre)) (PreH7 : ((batch % ( 4 ) ) = 0)) (PreH8 : (0 <= batch)) (PreH9 : (batch <= batch_pre)) (PreH10 : (k <= (batch_pre ÷ 4 ))) (PreH11 : (batch = 12)) (PreH12 : ((batch ÷ 4 ) = 3)) (PreH13 : (params_pre <> 0)) (PreH14 : (input_a = (input_a_pre + (k * sizeof(FLOAT))))) (PreH15 : (input_b = (input_b_pre + (k * sizeof(FLOAT))))) (PreH16 : (output = (output_pre + (k * sizeof(FLOAT))))) (PreH17 : (input_a <> 0)) (PreH18 : (input_b <> 0)) (PreH19 : (output <> 0)) (PreH20 : ((Z.land batch (2 * sizeof(FLOAT) )) <> 0)) (PreH21 : ((Z.land batch (1 * sizeof(FLOAT) )) <> 0)) ,
  ((&(( &( "vacc_lo" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc_lo" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((output + (0 * sizeof(FLOAT)))) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((output + (1 * sizeof(FLOAT)))) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (FloatArray.undef_seg output 2 (batch ÷ 4 ) )
  **  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  ((( &( "batch" ) )) # UInt64  |-> batch)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "input_a" ) )) # Ptr  |-> input_a)
  **  ((( &( "input_b" ) )) # Ptr  |-> input_b)
  **  ((( &( "output" ) )) # Ptr  |-> (output + (2 * sizeof(FLOAT))))
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((output + (0 * sizeof(FLOAT)))) # Float  |->_)
  **  (((output + (1 * sizeof(FLOAT)))) # Float  |->_)
  **  ((&(( &( "vacc" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # Float  |-> (fp32_add ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition test_neon_safety_wit_49 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (k: Z)  __default_fp32 (PreH1 : (batch <> 0)) (PreH2 : (batch < (4 * sizeof(FLOAT) ))) (PreH3 : ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH4 : ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH5 : (0 <= k)) (PreH6 : (((k * 4 ) + batch ) = batch_pre)) (PreH7 : ((batch % ( 4 ) ) = 0)) (PreH8 : (0 <= batch)) (PreH9 : (batch <= batch_pre)) (PreH10 : (k <= (batch_pre ÷ 4 ))) (PreH11 : (batch = 4)) (PreH12 : ((batch ÷ 4 ) = 1)) (PreH13 : (params_pre <> 0)) (PreH14 : (input_a = (input_a_pre + (k * sizeof(FLOAT))))) (PreH15 : (input_b = (input_b_pre + (k * sizeof(FLOAT))))) (PreH16 : (output = (output_pre + (k * sizeof(FLOAT))))) (PreH17 : (input_a <> 0)) (PreH18 : (input_b <> 0)) (PreH19 : (output <> 0)) (PreH20 : ((Z.land batch (2 * sizeof(FLOAT) )) = 0)) (PreH21 : ((Z.land batch (1 * sizeof(FLOAT) )) <> 0)) ,
  ((&(( &( "vacc_lo" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc_lo" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  ((( &( "batch" ) )) # UInt64  |-> batch)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "input_a" ) )) # Ptr  |-> input_a)
  **  ((( &( "input_b" ) )) # Ptr  |-> input_b)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vacc" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # Float  |-> (fp32_add ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition test_neon_entail_wit_1 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (PreH1 : (output_pre <> 0)) (PreH2 : (input_b_pre <> 0)) (PreH3 : (input_a_pre <> 0)) (PreH4 : ((batch_pre % ( sizeof(FLOAT) ) ) = 0)) (PreH5 : (batch_pre <> 0)) (PreH6 : (0 < batch_pre)) (PreH7 : (batch_pre <= 18446744073709551603)) (PreH8 : ((batch_pre % ( 4 ) ) = 0)) (PreH9 : (params_pre <> 0)) (PreH10 : (input_a_pre <> 0)) (PreH11 : (input_b_pre <> 0)) (PreH12 : (output_pre <> 0)) ,
  (FloatArray.full input_a_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.full input_b_pre ((batch_pre ÷ 4 ) + 3 ) B )
  **  (FloatArray.undef_full output_pre (batch_pre ÷ 4 ) )
|--
  (EX (k: Z) ,
  “ ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ (0 <= k) ” 
  &&  “ (((k * 4 ) + batch_pre ) = batch_pre) ” 
  &&  “ ((batch_pre % ( 4 ) ) = 0) ” 
  &&  “ (0 <= batch_pre) ” 
  &&  “ (batch_pre <= batch_pre) ” 
  &&  “ (k <= (batch_pre ÷ 4 )) ” 
  &&  “ (batch_pre = 4) ” 
  &&  “ ((batch_pre ÷ 4 ) = 1) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (input_a_pre = (input_a_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (input_b_pre = (input_b_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (output_pre = (output_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (input_a_pre <> 0) ” 
  &&  “ (input_b_pre <> 0) ” 
  &&  “ (output_pre <> 0) ”
  &&  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_a_pre ((batch_pre ÷ 4 ) + 3 ) (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full input_b_pre ((batch_pre ÷ 4 ) + 3 ) (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full output_pre (batch_pre ÷ 4 ) ))
  ||
  (EX (k: Z) ,
  “ ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ (0 <= k) ” 
  &&  “ (((k * 4 ) + batch_pre ) = batch_pre) ” 
  &&  “ ((batch_pre % ( 4 ) ) = 0) ” 
  &&  “ (0 <= batch_pre) ” 
  &&  “ (batch_pre <= batch_pre) ” 
  &&  “ (k <= (batch_pre ÷ 4 )) ” 
  &&  “ (batch_pre = 8) ” 
  &&  “ ((batch_pre ÷ 4 ) = 2) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (input_a_pre = (input_a_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (input_b_pre = (input_b_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (output_pre = (output_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (input_a_pre <> 0) ” 
  &&  “ (input_b_pre <> 0) ” 
  &&  “ (output_pre <> 0) ”
  &&  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_a_pre ((batch_pre ÷ 4 ) + 3 ) (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full input_b_pre ((batch_pre ÷ 4 ) + 3 ) (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full output_pre (batch_pre ÷ 4 ) ))
  ||
  (EX (k: Z) ,
  “ ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ (0 <= k) ” 
  &&  “ (((k * 4 ) + batch_pre ) = batch_pre) ” 
  &&  “ ((batch_pre % ( 4 ) ) = 0) ” 
  &&  “ (0 <= batch_pre) ” 
  &&  “ (batch_pre <= batch_pre) ” 
  &&  “ (k <= (batch_pre ÷ 4 )) ” 
  &&  “ (batch_pre = 12) ” 
  &&  “ ((batch_pre ÷ 4 ) = 3) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (input_a_pre = (input_a_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (input_b_pre = (input_b_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (output_pre = (output_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (input_a_pre <> 0) ” 
  &&  “ (input_b_pre <> 0) ” 
  &&  “ (output_pre <> 0) ”
  &&  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_a_pre ((batch_pre ÷ 4 ) + 3 ) (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full input_b_pre ((batch_pre ÷ 4 ) + 3 ) (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full output_pre (batch_pre ÷ 4 ) ))
  ||
  (EX (k: Z) ,
  “ ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ (0 <= k) ” 
  &&  “ (((k * 4 ) + batch_pre ) = batch_pre) ” 
  &&  “ ((batch_pre % ( 4 ) ) = 0) ” 
  &&  “ (0 <= batch_pre) ” 
  &&  “ (batch_pre <= batch_pre) ” 
  &&  “ (k <= (batch_pre ÷ 4 )) ” 
  &&  “ (16 <= batch_pre) ” 
  &&  “ (4 <= (batch_pre ÷ 4 )) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (input_a_pre = (input_a_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (input_b_pre = (input_b_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (output_pre = (output_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (input_a_pre <> 0) ” 
  &&  “ (input_b_pre <> 0) ” 
  &&  “ (output_pre <> 0) ”
  &&  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_a_pre ((batch_pre ÷ 4 ) + 3 ) (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full input_b_pre ((batch_pre ÷ 4 ) + 3 ) (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full output_pre (batch_pre ÷ 4 ) ))
.

Definition test_neon_entail_wit_2 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (k_2: Z)  __default_fp32 (PreH1 : (batch >= (4 * sizeof(FLOAT) ))) (PreH2 : ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH3 : ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH4 : (0 <= k_2)) (PreH5 : (((k_2 * 4 ) + batch ) = batch_pre)) (PreH6 : ((batch % ( 4 ) ) = 0)) (PreH7 : (0 <= batch)) (PreH8 : (batch <= batch_pre)) (PreH9 : (k_2 <= (batch_pre ÷ 4 ))) (PreH10 : (16 <= batch)) (PreH11 : (4 <= (batch ÷ 4 ))) (PreH12 : (params_pre <> 0)) (PreH13 : (input_a = (input_a_pre + (k_2 * sizeof(FLOAT))))) (PreH14 : (input_b = (input_b_pre + (k_2 * sizeof(FLOAT))))) (PreH15 : (output = (output_pre + (k_2 * sizeof(FLOAT))))) (PreH16 : (input_a <> 0)) (PreH17 : (input_b <> 0)) (PreH18 : (output <> 0)) ,
  (((output + (0 * sizeof(FLOAT)))) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((output + (1 * sizeof(FLOAT)))) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((output + (2 * sizeof(FLOAT)))) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((output + (3 * sizeof(FLOAT)))) # Float  |-> (fp32_add ((Znth 3 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 3 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (FloatArray.undef_seg output 4 (batch ÷ 4 ) )
  **  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  (FloatArray.full input_a_pre k_2 (fp32_slice (0) (k_2) (A)) )
  **  (FloatArray.full input_b_pre k_2 (fp32_slice (0) (k_2) (B)) )
  **  (FloatArray.full output_pre k_2 (vadd_values (k_2) (A) (B)) )
  **  (((output + (0 * sizeof(FLOAT)))) # Float  |->_)
  **  (((output + (1 * sizeof(FLOAT)))) # Float  |->_)
  **  (((output + (2 * sizeof(FLOAT)))) # Float  |->_)
  **  (((output + (3 * sizeof(FLOAT)))) # Float  |->_)
|--
  (EX (k: Z) ,
  “ ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ (0 <= k) ” 
  &&  “ (((k * 4 ) + (batch - (4 * sizeof(FLOAT) ) ) ) = batch_pre) ” 
  &&  “ (((batch - (4 * sizeof(FLOAT) ) ) % ( 4 ) ) = 0) ” 
  &&  “ (0 <= (batch - (4 * sizeof(FLOAT) ) )) ” 
  &&  “ ((batch - (4 * sizeof(FLOAT) ) ) <= batch_pre) ” 
  &&  “ (k <= (batch_pre ÷ 4 )) ” 
  &&  “ ((batch - (4 * sizeof(FLOAT) ) ) = 0) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ ((input_a + (4 * sizeof(FLOAT))) = (input_a_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ ((input_b + (4 * sizeof(FLOAT))) = (input_b_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ ((output + (4 * sizeof(FLOAT))) = (output_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ ((input_a + (4 * sizeof(FLOAT))) <> 0) ” 
  &&  “ ((input_b + (4 * sizeof(FLOAT))) <> 0) ” 
  &&  “ ((output + (4 * sizeof(FLOAT))) <> 0) ”
  &&  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full (input_a + (4 * sizeof(FLOAT))) (((batch - (4 * sizeof(FLOAT) ) ) ÷ 4 ) + 3 ) (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full (input_b + (4 * sizeof(FLOAT))) (((batch - (4 * sizeof(FLOAT) ) ) ÷ 4 ) + 3 ) (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full (output + (4 * sizeof(FLOAT))) ((batch - (4 * sizeof(FLOAT) ) ) ÷ 4 ) ))
  ||
  (EX (k: Z) ,
  “ ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ (0 <= k) ” 
  &&  “ (((k * 4 ) + (batch - (4 * sizeof(FLOAT) ) ) ) = batch_pre) ” 
  &&  “ (((batch - (4 * sizeof(FLOAT) ) ) % ( 4 ) ) = 0) ” 
  &&  “ (0 <= (batch - (4 * sizeof(FLOAT) ) )) ” 
  &&  “ ((batch - (4 * sizeof(FLOAT) ) ) <= batch_pre) ” 
  &&  “ (k <= (batch_pre ÷ 4 )) ” 
  &&  “ ((batch - (4 * sizeof(FLOAT) ) ) = 4) ” 
  &&  “ (((batch - (4 * sizeof(FLOAT) ) ) ÷ 4 ) = 1) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ ((input_a + (4 * sizeof(FLOAT))) = (input_a_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ ((input_b + (4 * sizeof(FLOAT))) = (input_b_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ ((output + (4 * sizeof(FLOAT))) = (output_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ ((input_a + (4 * sizeof(FLOAT))) <> 0) ” 
  &&  “ ((input_b + (4 * sizeof(FLOAT))) <> 0) ” 
  &&  “ ((output + (4 * sizeof(FLOAT))) <> 0) ”
  &&  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full (input_a + (4 * sizeof(FLOAT))) (((batch - (4 * sizeof(FLOAT) ) ) ÷ 4 ) + 3 ) (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full (input_b + (4 * sizeof(FLOAT))) (((batch - (4 * sizeof(FLOAT) ) ) ÷ 4 ) + 3 ) (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full (output + (4 * sizeof(FLOAT))) ((batch - (4 * sizeof(FLOAT) ) ) ÷ 4 ) ))
  ||
  (EX (k: Z) ,
  “ ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ (0 <= k) ” 
  &&  “ (((k * 4 ) + (batch - (4 * sizeof(FLOAT) ) ) ) = batch_pre) ” 
  &&  “ (((batch - (4 * sizeof(FLOAT) ) ) % ( 4 ) ) = 0) ” 
  &&  “ (0 <= (batch - (4 * sizeof(FLOAT) ) )) ” 
  &&  “ ((batch - (4 * sizeof(FLOAT) ) ) <= batch_pre) ” 
  &&  “ (k <= (batch_pre ÷ 4 )) ” 
  &&  “ ((batch - (4 * sizeof(FLOAT) ) ) = 8) ” 
  &&  “ (((batch - (4 * sizeof(FLOAT) ) ) ÷ 4 ) = 2) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ ((input_a + (4 * sizeof(FLOAT))) = (input_a_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ ((input_b + (4 * sizeof(FLOAT))) = (input_b_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ ((output + (4 * sizeof(FLOAT))) = (output_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ ((input_a + (4 * sizeof(FLOAT))) <> 0) ” 
  &&  “ ((input_b + (4 * sizeof(FLOAT))) <> 0) ” 
  &&  “ ((output + (4 * sizeof(FLOAT))) <> 0) ”
  &&  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full (input_a + (4 * sizeof(FLOAT))) (((batch - (4 * sizeof(FLOAT) ) ) ÷ 4 ) + 3 ) (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full (input_b + (4 * sizeof(FLOAT))) (((batch - (4 * sizeof(FLOAT) ) ) ÷ 4 ) + 3 ) (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full (output + (4 * sizeof(FLOAT))) ((batch - (4 * sizeof(FLOAT) ) ) ÷ 4 ) ))
  ||
  (EX (k: Z) ,
  “ ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ (0 <= k) ” 
  &&  “ (((k * 4 ) + (batch - (4 * sizeof(FLOAT) ) ) ) = batch_pre) ” 
  &&  “ (((batch - (4 * sizeof(FLOAT) ) ) % ( 4 ) ) = 0) ” 
  &&  “ (0 <= (batch - (4 * sizeof(FLOAT) ) )) ” 
  &&  “ ((batch - (4 * sizeof(FLOAT) ) ) <= batch_pre) ” 
  &&  “ (k <= (batch_pre ÷ 4 )) ” 
  &&  “ ((batch - (4 * sizeof(FLOAT) ) ) = 12) ” 
  &&  “ (((batch - (4 * sizeof(FLOAT) ) ) ÷ 4 ) = 3) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ ((input_a + (4 * sizeof(FLOAT))) = (input_a_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ ((input_b + (4 * sizeof(FLOAT))) = (input_b_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ ((output + (4 * sizeof(FLOAT))) = (output_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ ((input_a + (4 * sizeof(FLOAT))) <> 0) ” 
  &&  “ ((input_b + (4 * sizeof(FLOAT))) <> 0) ” 
  &&  “ ((output + (4 * sizeof(FLOAT))) <> 0) ”
  &&  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full (input_a + (4 * sizeof(FLOAT))) (((batch - (4 * sizeof(FLOAT) ) ) ÷ 4 ) + 3 ) (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full (input_b + (4 * sizeof(FLOAT))) (((batch - (4 * sizeof(FLOAT) ) ) ÷ 4 ) + 3 ) (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full (output + (4 * sizeof(FLOAT))) ((batch - (4 * sizeof(FLOAT) ) ) ÷ 4 ) ))
  ||
  (EX (k: Z) ,
  “ ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ (0 <= k) ” 
  &&  “ (((k * 4 ) + (batch - (4 * sizeof(FLOAT) ) ) ) = batch_pre) ” 
  &&  “ (((batch - (4 * sizeof(FLOAT) ) ) % ( 4 ) ) = 0) ” 
  &&  “ (0 <= (batch - (4 * sizeof(FLOAT) ) )) ” 
  &&  “ ((batch - (4 * sizeof(FLOAT) ) ) <= batch_pre) ” 
  &&  “ (k <= (batch_pre ÷ 4 )) ” 
  &&  “ (16 <= (batch - (4 * sizeof(FLOAT) ) )) ” 
  &&  “ (4 <= ((batch - (4 * sizeof(FLOAT) ) ) ÷ 4 )) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ ((input_a + (4 * sizeof(FLOAT))) = (input_a_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ ((input_b + (4 * sizeof(FLOAT))) = (input_b_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ ((output + (4 * sizeof(FLOAT))) = (output_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ ((input_a + (4 * sizeof(FLOAT))) <> 0) ” 
  &&  “ ((input_b + (4 * sizeof(FLOAT))) <> 0) ” 
  &&  “ ((output + (4 * sizeof(FLOAT))) <> 0) ”
  &&  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full (input_a + (4 * sizeof(FLOAT))) (((batch - (4 * sizeof(FLOAT) ) ) ÷ 4 ) + 3 ) (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full (input_b + (4 * sizeof(FLOAT))) (((batch - (4 * sizeof(FLOAT) ) ) ÷ 4 ) + 3 ) (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full (output + (4 * sizeof(FLOAT))) ((batch - (4 * sizeof(FLOAT) ) ) ÷ 4 ) ))
.

Definition test_neon_entail_wit_3_1 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (k: Z)  __default_fp32 (PreH1 : (batch <> 0)) (PreH2 : (batch < (4 * sizeof(FLOAT) ))) (PreH3 : ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH4 : ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH5 : (0 <= k)) (PreH6 : (((k * 4 ) + batch ) = batch_pre)) (PreH7 : ((batch % ( 4 ) ) = 0)) (PreH8 : (0 <= batch)) (PreH9 : (batch <= batch_pre)) (PreH10 : (k <= (batch_pre ÷ 4 ))) (PreH11 : (batch = 4)) (PreH12 : ((batch ÷ 4 ) = 1)) (PreH13 : (params_pre <> 0)) (PreH14 : (input_a = (input_a_pre + (k * sizeof(FLOAT))))) (PreH15 : (input_b = (input_b_pre + (k * sizeof(FLOAT))))) (PreH16 : (output = (output_pre + (k * sizeof(FLOAT))))) (PreH17 : (input_a <> 0)) (PreH18 : (input_b <> 0)) (PreH19 : (output <> 0)) (PreH20 : ((Z.land batch (2 * sizeof(FLOAT) )) = 0)) ,
  ((&(( &( "vacc_lo" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc_lo" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vacc" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # Float  |-> (fp32_add ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
|--
  “ (batch <> 0) ” 
  &&  “ (batch < (4 * sizeof(FLOAT) )) ” 
  &&  “ ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ (0 <= k) ” 
  &&  “ (((k * 4 ) + batch ) = batch_pre) ” 
  &&  “ ((batch % ( 4 ) ) = 0) ” 
  &&  “ (0 <= batch) ” 
  &&  “ (batch <= batch_pre) ” 
  &&  “ (k <= (batch_pre ÷ 4 )) ” 
  &&  “ (batch = 4) ” 
  &&  “ ((batch ÷ 4 ) = 1) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (input_a = (input_a_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (input_b = (input_b_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (input_a <> 0) ” 
  &&  “ (input_b <> 0) ” 
  &&  “ (output <> 0) ” 
  &&  “ ((Z.land batch (2 * sizeof(FLOAT) )) = 0) ”
  &&  ((&(( &( "vacc_lo" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc_lo" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vacc" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # Float  |-> (fp32_add ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
.

Definition test_neon_entail_wit_3_2 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (k_2: Z)  __default_fp32 (PreH1 : (batch <> 0)) (PreH2 : (batch < (4 * sizeof(FLOAT) ))) (PreH3 : ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH4 : ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH5 : (0 <= k_2)) (PreH6 : (((k_2 * 4 ) + batch ) = batch_pre)) (PreH7 : ((batch % ( 4 ) ) = 0)) (PreH8 : (0 <= batch)) (PreH9 : (batch <= batch_pre)) (PreH10 : (k_2 <= (batch_pre ÷ 4 ))) (PreH11 : (batch = 8)) (PreH12 : ((batch ÷ 4 ) = 2)) (PreH13 : (params_pre <> 0)) (PreH14 : (input_a = (input_a_pre + (k_2 * sizeof(FLOAT))))) (PreH15 : (input_b = (input_b_pre + (k_2 * sizeof(FLOAT))))) (PreH16 : (output = (output_pre + (k_2 * sizeof(FLOAT))))) (PreH17 : (input_a <> 0)) (PreH18 : (input_b <> 0)) (PreH19 : (output <> 0)) (PreH20 : ((Z.land batch (2 * sizeof(FLOAT) )) = 0)) ,
  ((&(( &( "vacc_lo" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc_lo" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  (FloatArray.full input_a_pre k_2 (fp32_slice (0) (k_2) (A)) )
  **  (FloatArray.full input_b_pre k_2 (fp32_slice (0) (k_2) (B)) )
  **  (FloatArray.full output_pre k_2 (vadd_values (k_2) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vacc" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # Float  |-> (fp32_add ((Znth 3 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 3 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
|--
  EX (k: Z) ,
  “ (batch <> 0) ” 
  &&  “ (batch < (4 * sizeof(FLOAT) )) ” 
  &&  “ ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ (0 <= k) ” 
  &&  “ (((k * 4 ) + batch ) = batch_pre) ” 
  &&  “ ((batch % ( 4 ) ) = 0) ” 
  &&  “ (0 <= batch) ” 
  &&  “ (batch <= batch_pre) ” 
  &&  “ (k <= (batch_pre ÷ 4 )) ” 
  &&  “ (batch = 4) ” 
  &&  “ ((batch ÷ 4 ) = 1) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (input_a = (input_a_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (input_b = (input_b_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (input_a <> 0) ” 
  &&  “ (input_b <> 0) ” 
  &&  “ (output <> 0) ” 
  &&  “ ((Z.land batch (2 * sizeof(FLOAT) )) = 0) ”
  &&  ((&(( &( "vacc_lo" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc_lo" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vacc" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # Float  |-> (fp32_add ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
.

Definition test_neon_entail_wit_3_3 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (k_2: Z)  __default_fp32 (PreH1 : (batch <> 0)) (PreH2 : (batch < (4 * sizeof(FLOAT) ))) (PreH3 : ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH4 : ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH5 : (0 <= k_2)) (PreH6 : (((k_2 * 4 ) + batch ) = batch_pre)) (PreH7 : ((batch % ( 4 ) ) = 0)) (PreH8 : (0 <= batch)) (PreH9 : (batch <= batch_pre)) (PreH10 : (k_2 <= (batch_pre ÷ 4 ))) (PreH11 : (batch = 12)) (PreH12 : ((batch ÷ 4 ) = 3)) (PreH13 : (params_pre <> 0)) (PreH14 : (input_a = (input_a_pre + (k_2 * sizeof(FLOAT))))) (PreH15 : (input_b = (input_b_pre + (k_2 * sizeof(FLOAT))))) (PreH16 : (output = (output_pre + (k_2 * sizeof(FLOAT))))) (PreH17 : (input_a <> 0)) (PreH18 : (input_b <> 0)) (PreH19 : (output <> 0)) (PreH20 : ((Z.land batch (2 * sizeof(FLOAT) )) = 0)) ,
  ((&(( &( "vacc_lo" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc_lo" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  (FloatArray.full input_a_pre k_2 (fp32_slice (0) (k_2) (A)) )
  **  (FloatArray.full input_b_pre k_2 (fp32_slice (0) (k_2) (B)) )
  **  (FloatArray.full output_pre k_2 (vadd_values (k_2) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vacc" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # Float  |-> (fp32_add ((Znth 3 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 3 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
|--
  EX (k: Z) ,
  “ (batch <> 0) ” 
  &&  “ (batch < (4 * sizeof(FLOAT) )) ” 
  &&  “ ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ (0 <= k) ” 
  &&  “ (((k * 4 ) + batch ) = batch_pre) ” 
  &&  “ ((batch % ( 4 ) ) = 0) ” 
  &&  “ (0 <= batch) ” 
  &&  “ (batch <= batch_pre) ” 
  &&  “ (k <= (batch_pre ÷ 4 )) ” 
  &&  “ (batch = 4) ” 
  &&  “ ((batch ÷ 4 ) = 1) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (input_a = (input_a_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (input_b = (input_b_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (input_a <> 0) ” 
  &&  “ (input_b <> 0) ” 
  &&  “ (output <> 0) ” 
  &&  “ ((Z.land batch (2 * sizeof(FLOAT) )) = 0) ”
  &&  ((&(( &( "vacc_lo" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc_lo" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vacc" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # Float  |-> (fp32_add ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
.

Definition test_neon_entail_wit_4_1 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (k_3: Z)  __default_fp32 (PreH1 : (batch <> 0)) (PreH2 : (batch < (4 * sizeof(FLOAT) ))) (PreH3 : ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH4 : ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH5 : (0 <= k_3)) (PreH6 : (((k_3 * 4 ) + batch ) = batch_pre)) (PreH7 : ((batch % ( 4 ) ) = 0)) (PreH8 : (0 <= batch)) (PreH9 : (batch <= batch_pre)) (PreH10 : (k_3 <= (batch_pre ÷ 4 ))) (PreH11 : (batch = 4)) (PreH12 : ((batch ÷ 4 ) = 1)) (PreH13 : (params_pre <> 0)) (PreH14 : (input_a = (input_a_pre + (k_3 * sizeof(FLOAT))))) (PreH15 : (input_b = (input_b_pre + (k_3 * sizeof(FLOAT))))) (PreH16 : (output = (output_pre + (k_3 * sizeof(FLOAT))))) (PreH17 : (input_a <> 0)) (PreH18 : (input_b <> 0)) (PreH19 : (output <> 0)) (PreH20 : ((Z.land batch (2 * sizeof(FLOAT) )) <> 0)) ,
  ((&(( &( "vacc_lo" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k_3) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k_3) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc_lo" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k_3) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k_3) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k_3) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k_3) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k_3) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k_3) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k_3) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k_3) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k_3) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k_3) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k_3) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k_3) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  (FloatArray.full input_a_pre k_3 (fp32_slice (0) (k_3) (A)) )
  **  (FloatArray.full input_b_pre k_3 (fp32_slice (0) (k_3) (B)) )
  **  (FloatArray.full output_pre k_3 (vadd_values (k_3) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k_3) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k_3) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k_3) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k_3) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k_3) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k_3) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k_3) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k_3) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vacc" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k_3) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k_3) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k_3) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k_3) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k_3) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k_3) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # Float  |-> (fp32_add ((Znth 3 (fp32_slice (k_3) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 3 (fp32_slice (k_3) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
|--
  (EX (k: Z) ,
  “ (batch <> 0) ” 
  &&  “ (batch < (4 * sizeof(FLOAT) )) ” 
  &&  “ ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ (0 <= k) ” 
  &&  “ (((k * 4 ) + batch ) = batch_pre) ” 
  &&  “ ((batch % ( 4 ) ) = 0) ” 
  &&  “ (0 <= batch) ” 
  &&  “ (batch <= batch_pre) ” 
  &&  “ (k <= (batch_pre ÷ 4 )) ” 
  &&  “ (batch = 8) ” 
  &&  “ ((batch ÷ 4 ) = 2) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (input_a = (input_a_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (input_b = (input_b_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (input_a <> 0) ” 
  &&  “ (input_b <> 0) ” 
  &&  “ (output <> 0) ” 
  &&  “ ((Z.land batch (2 * sizeof(FLOAT) )) <> 0) ”
  &&  ((&(( &( "vacc_lo" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc_lo" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vacc" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # Float  |-> (fp32_add ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32)))))
  ||
  (EX (k_2: Z) ,
  “ (batch <> 0) ” 
  &&  “ (batch < (4 * sizeof(FLOAT) )) ” 
  &&  “ ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ (0 <= k_2) ” 
  &&  “ (((k_2 * 4 ) + batch ) = batch_pre) ” 
  &&  “ ((batch % ( 4 ) ) = 0) ” 
  &&  “ (0 <= batch) ” 
  &&  “ (batch <= batch_pre) ” 
  &&  “ (k_2 <= (batch_pre ÷ 4 )) ” 
  &&  “ (batch = 12) ” 
  &&  “ ((batch ÷ 4 ) = 3) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (input_a = (input_a_pre + (k_2 * sizeof(FLOAT)))) ” 
  &&  “ (input_b = (input_b_pre + (k_2 * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (k_2 * sizeof(FLOAT)))) ” 
  &&  “ (input_a <> 0) ” 
  &&  “ (input_b <> 0) ” 
  &&  “ (output <> 0) ” 
  &&  “ ((Z.land batch (2 * sizeof(FLOAT) )) <> 0) ”
  &&  ((&(( &( "vacc_lo" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc_lo" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  (FloatArray.full input_a_pre k_2 (fp32_slice (0) (k_2) (A)) )
  **  (FloatArray.full input_b_pre k_2 (fp32_slice (0) (k_2) (B)) )
  **  (FloatArray.full output_pre k_2 (vadd_values (k_2) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vacc" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # Float  |-> (fp32_add ((Znth 3 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 3 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32)))))
.

Definition test_neon_entail_wit_4_2 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (k: Z)  __default_fp32 (PreH1 : (batch <> 0)) (PreH2 : (batch < (4 * sizeof(FLOAT) ))) (PreH3 : ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH4 : ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH5 : (0 <= k)) (PreH6 : (((k * 4 ) + batch ) = batch_pre)) (PreH7 : ((batch % ( 4 ) ) = 0)) (PreH8 : (0 <= batch)) (PreH9 : (batch <= batch_pre)) (PreH10 : (k <= (batch_pre ÷ 4 ))) (PreH11 : (batch = 8)) (PreH12 : ((batch ÷ 4 ) = 2)) (PreH13 : (params_pre <> 0)) (PreH14 : (input_a = (input_a_pre + (k * sizeof(FLOAT))))) (PreH15 : (input_b = (input_b_pre + (k * sizeof(FLOAT))))) (PreH16 : (output = (output_pre + (k * sizeof(FLOAT))))) (PreH17 : (input_a <> 0)) (PreH18 : (input_b <> 0)) (PreH19 : (output <> 0)) (PreH20 : ((Z.land batch (2 * sizeof(FLOAT) )) <> 0)) ,
  ((&(( &( "vacc_lo" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc_lo" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vacc" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # Float  |-> (fp32_add ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
|--
  “ (batch <> 0) ” 
  &&  “ (batch < (4 * sizeof(FLOAT) )) ” 
  &&  “ ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ (0 <= k) ” 
  &&  “ (((k * 4 ) + batch ) = batch_pre) ” 
  &&  “ ((batch % ( 4 ) ) = 0) ” 
  &&  “ (0 <= batch) ” 
  &&  “ (batch <= batch_pre) ” 
  &&  “ (k <= (batch_pre ÷ 4 )) ” 
  &&  “ (batch = 8) ” 
  &&  “ ((batch ÷ 4 ) = 2) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (input_a = (input_a_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (input_b = (input_b_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (input_a <> 0) ” 
  &&  “ (input_b <> 0) ” 
  &&  “ (output <> 0) ” 
  &&  “ ((Z.land batch (2 * sizeof(FLOAT) )) <> 0) ”
  &&  ((&(( &( "vacc_lo" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc_lo" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vacc" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # Float  |-> (fp32_add ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
.

Definition test_neon_entail_wit_4_3 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (k_2: Z)  __default_fp32 (PreH1 : (batch <> 0)) (PreH2 : (batch < (4 * sizeof(FLOAT) ))) (PreH3 : ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH4 : ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH5 : (0 <= k_2)) (PreH6 : (((k_2 * 4 ) + batch ) = batch_pre)) (PreH7 : ((batch % ( 4 ) ) = 0)) (PreH8 : (0 <= batch)) (PreH9 : (batch <= batch_pre)) (PreH10 : (k_2 <= (batch_pre ÷ 4 ))) (PreH11 : (batch = 12)) (PreH12 : ((batch ÷ 4 ) = 3)) (PreH13 : (params_pre <> 0)) (PreH14 : (input_a = (input_a_pre + (k_2 * sizeof(FLOAT))))) (PreH15 : (input_b = (input_b_pre + (k_2 * sizeof(FLOAT))))) (PreH16 : (output = (output_pre + (k_2 * sizeof(FLOAT))))) (PreH17 : (input_a <> 0)) (PreH18 : (input_b <> 0)) (PreH19 : (output <> 0)) (PreH20 : ((Z.land batch (2 * sizeof(FLOAT) )) <> 0)) ,
  ((&(( &( "vacc_lo" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc_lo" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  (FloatArray.full input_a_pre k_2 (fp32_slice (0) (k_2) (A)) )
  **  (FloatArray.full input_b_pre k_2 (fp32_slice (0) (k_2) (B)) )
  **  (FloatArray.full output_pre k_2 (vadd_values (k_2) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vacc" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # Float  |-> (fp32_add ((Znth 3 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 3 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
|--
  “ (batch <> 0) ” 
  &&  “ (batch < (4 * sizeof(FLOAT) )) ” 
  &&  “ ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ (0 <= k_2) ” 
  &&  “ (((k_2 * 4 ) + batch ) = batch_pre) ” 
  &&  “ ((batch % ( 4 ) ) = 0) ” 
  &&  “ (0 <= batch) ” 
  &&  “ (batch <= batch_pre) ” 
  &&  “ (k_2 <= (batch_pre ÷ 4 )) ” 
  &&  “ (batch = 12) ” 
  &&  “ ((batch ÷ 4 ) = 3) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (input_a = (input_a_pre + (k_2 * sizeof(FLOAT)))) ” 
  &&  “ (input_b = (input_b_pre + (k_2 * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (k_2 * sizeof(FLOAT)))) ” 
  &&  “ (input_a <> 0) ” 
  &&  “ (input_b <> 0) ” 
  &&  “ (output <> 0) ” 
  &&  “ ((Z.land batch (2 * sizeof(FLOAT) )) <> 0) ”
  &&  ((&(( &( "vacc_lo" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc_lo" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  (FloatArray.full input_a_pre k_2 (fp32_slice (0) (k_2) (A)) )
  **  (FloatArray.full input_b_pre k_2 (fp32_slice (0) (k_2) (B)) )
  **  (FloatArray.full output_pre k_2 (vadd_values (k_2) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vacc" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # Float  |-> (fp32_add ((Znth 3 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 3 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
.

Definition test_neon_entail_wit_5_1 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (output_2: Z) (input_b: Z) (input_a: Z) (batch: Z) (k_2: Z)  __default_fp32 (PreH1 : (batch <> 0)) (PreH2 : (batch < (4 * sizeof(FLOAT) ))) (PreH3 : ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH4 : ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH5 : (0 <= k_2)) (PreH6 : (((k_2 * 4 ) + batch ) = batch_pre)) (PreH7 : ((batch % ( 4 ) ) = 0)) (PreH8 : (0 <= batch)) (PreH9 : (batch <= batch_pre)) (PreH10 : (k_2 <= (batch_pre ÷ 4 ))) (PreH11 : (batch = 12)) (PreH12 : ((batch ÷ 4 ) = 3)) (PreH13 : (params_pre <> 0)) (PreH14 : (input_a = (input_a_pre + (k_2 * sizeof(FLOAT))))) (PreH15 : (input_b = (input_b_pre + (k_2 * sizeof(FLOAT))))) (PreH16 : (output_2 = (output_pre + (k_2 * sizeof(FLOAT))))) (PreH17 : (input_a <> 0)) (PreH18 : (input_b <> 0)) (PreH19 : (output_2 <> 0)) (PreH20 : ((Z.land batch (2 * sizeof(FLOAT) )) <> 0)) (PreH21 : ((Z.land batch (1 * sizeof(FLOAT) )) = 0)) ,
  ((&(( &( "vacc_lo" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 3 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 3 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc_lo" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((output_2 + (0 * sizeof(FLOAT)))) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((output_2 + (1 * sizeof(FLOAT)))) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (FloatArray.undef_seg output_2 2 (batch ÷ 4 ) )
  **  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  ((( &( "output" ) )) # Ptr  |-> (output_2 + (2 * sizeof(FLOAT))))
  **  (FloatArray.full input_a_pre k_2 (fp32_slice (0) (k_2) (A)) )
  **  (FloatArray.full input_b_pre k_2 (fp32_slice (0) (k_2) (B)) )
  **  (FloatArray.full output_pre k_2 (vadd_values (k_2) (A) (B)) )
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((output_2 + (0 * sizeof(FLOAT)))) # Float  |->_)
  **  (((output_2 + (1 * sizeof(FLOAT)))) # Float  |->_)
  **  ((&(( &( "vacc" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # Float  |-> (fp32_add ((Znth 3 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 3 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
|--
  EX (output: Z)  (k: Z) ,
  “ (batch <> 0) ” 
  &&  “ (batch < (4 * sizeof(FLOAT) )) ” 
  &&  “ ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ (0 <= k) ” 
  &&  “ (((k * 4 ) + batch ) = batch_pre) ” 
  &&  “ ((batch % ( 4 ) ) = 0) ” 
  &&  “ (0 <= batch) ” 
  &&  “ (batch <= batch_pre) ” 
  &&  “ (k <= (batch_pre ÷ 4 )) ” 
  &&  “ (batch = 8) ” 
  &&  “ ((batch ÷ 4 ) = 2) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (input_a = (input_a_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (input_b = (input_b_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (input_a <> 0) ” 
  &&  “ (input_b <> 0) ” 
  &&  “ (output <> 0) ” 
  &&  “ ((Z.land batch (2 * sizeof(FLOAT) )) <> 0) ” 
  &&  “ ((Z.land batch (1 * sizeof(FLOAT) )) = 0) ”
  &&  ((&(( &( "vacc_lo" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc_lo" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((output + (0 * sizeof(FLOAT)))) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((output + (1 * sizeof(FLOAT)))) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (FloatArray.undef_seg output 2 (batch ÷ 4 ) )
  **  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  ((( &( "output" ) )) # Ptr  |-> (output + (2 * sizeof(FLOAT))))
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((output + (0 * sizeof(FLOAT)))) # Float  |->_)
  **  (((output + (1 * sizeof(FLOAT)))) # Float  |->_)
  **  ((&(( &( "vacc" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # Float  |-> (fp32_add ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
.

Definition test_neon_entail_wit_5_2 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (k: Z)  __default_fp32 (PreH1 : (batch <> 0)) (PreH2 : (batch < (4 * sizeof(FLOAT) ))) (PreH3 : ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH4 : ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH5 : (0 <= k)) (PreH6 : (((k * 4 ) + batch ) = batch_pre)) (PreH7 : ((batch % ( 4 ) ) = 0)) (PreH8 : (0 <= batch)) (PreH9 : (batch <= batch_pre)) (PreH10 : (k <= (batch_pre ÷ 4 ))) (PreH11 : (batch = 8)) (PreH12 : ((batch ÷ 4 ) = 2)) (PreH13 : (params_pre <> 0)) (PreH14 : (input_a = (input_a_pre + (k * sizeof(FLOAT))))) (PreH15 : (input_b = (input_b_pre + (k * sizeof(FLOAT))))) (PreH16 : (output = (output_pre + (k * sizeof(FLOAT))))) (PreH17 : (input_a <> 0)) (PreH18 : (input_b <> 0)) (PreH19 : (output <> 0)) (PreH20 : ((Z.land batch (2 * sizeof(FLOAT) )) <> 0)) (PreH21 : ((Z.land batch (1 * sizeof(FLOAT) )) = 0)) ,
  ((&(( &( "vacc_lo" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc_lo" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((output + (0 * sizeof(FLOAT)))) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((output + (1 * sizeof(FLOAT)))) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (FloatArray.undef_seg output 2 (batch ÷ 4 ) )
  **  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((output + (0 * sizeof(FLOAT)))) # Float  |->_)
  **  (((output + (1 * sizeof(FLOAT)))) # Float  |->_)
  **  ((&(( &( "vacc" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # Float  |-> (fp32_add ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
|--
  “ (batch <> 0) ” 
  &&  “ (batch < (4 * sizeof(FLOAT) )) ” 
  &&  “ ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ (0 <= k) ” 
  &&  “ (((k * 4 ) + batch ) = batch_pre) ” 
  &&  “ ((batch % ( 4 ) ) = 0) ” 
  &&  “ (0 <= batch) ” 
  &&  “ (batch <= batch_pre) ” 
  &&  “ (k <= (batch_pre ÷ 4 )) ” 
  &&  “ (batch = 8) ” 
  &&  “ ((batch ÷ 4 ) = 2) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (input_a = (input_a_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (input_b = (input_b_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (input_a <> 0) ” 
  &&  “ (input_b <> 0) ” 
  &&  “ (output <> 0) ” 
  &&  “ ((Z.land batch (2 * sizeof(FLOAT) )) <> 0) ” 
  &&  “ ((Z.land batch (1 * sizeof(FLOAT) )) = 0) ”
  &&  ((&(( &( "vacc_lo" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc_lo" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((output + (0 * sizeof(FLOAT)))) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((output + (1 * sizeof(FLOAT)))) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (FloatArray.undef_seg output 2 (batch ÷ 4 ) )
  **  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((output + (0 * sizeof(FLOAT)))) # Float  |->_)
  **  (((output + (1 * sizeof(FLOAT)))) # Float  |->_)
  **  ((&(( &( "vacc" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # Float  |-> (fp32_add ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
.

Definition test_neon_entail_wit_5_3 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (output_2: Z) (input_b: Z) (input_a: Z) (batch: Z) (k_2: Z)  __default_fp32 (PreH1 : (batch <> 0)) (PreH2 : (batch < (4 * sizeof(FLOAT) ))) (PreH3 : ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH4 : ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH5 : (0 <= k_2)) (PreH6 : (((k_2 * 4 ) + batch ) = batch_pre)) (PreH7 : ((batch % ( 4 ) ) = 0)) (PreH8 : (0 <= batch)) (PreH9 : (batch <= batch_pre)) (PreH10 : (k_2 <= (batch_pre ÷ 4 ))) (PreH11 : (batch = 4)) (PreH12 : ((batch ÷ 4 ) = 1)) (PreH13 : (params_pre <> 0)) (PreH14 : (input_a = (input_a_pre + (k_2 * sizeof(FLOAT))))) (PreH15 : (input_b = (input_b_pre + (k_2 * sizeof(FLOAT))))) (PreH16 : (output_2 = (output_pre + (k_2 * sizeof(FLOAT))))) (PreH17 : (input_a <> 0)) (PreH18 : (input_b <> 0)) (PreH19 : (output_2 <> 0)) (PreH20 : ((Z.land batch (2 * sizeof(FLOAT) )) = 0)) (PreH21 : ((Z.land batch (1 * sizeof(FLOAT) )) = 0)) ,
  ((&(( &( "vacc_lo" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc_lo" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  ((( &( "output" ) )) # Ptr  |-> output_2)
  **  (FloatArray.full input_a_pre k_2 (fp32_slice (0) (k_2) (A)) )
  **  (FloatArray.full input_b_pre k_2 (fp32_slice (0) (k_2) (B)) )
  **  (FloatArray.full output_pre k_2 (vadd_values (k_2) (A) (B)) )
  **  (FloatArray.undef_full output_2 (batch ÷ 4 ) )
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vacc" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # Float  |-> (fp32_add ((Znth 3 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 3 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
|--
  EX (output: Z)  (k: Z) ,
  “ (batch <> 0) ” 
  &&  “ (batch < (4 * sizeof(FLOAT) )) ” 
  &&  “ ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ (0 <= k) ” 
  &&  “ (((k * 4 ) + batch ) = batch_pre) ” 
  &&  “ ((batch % ( 4 ) ) = 0) ” 
  &&  “ (0 <= batch) ” 
  &&  “ (batch <= batch_pre) ” 
  &&  “ (k <= (batch_pre ÷ 4 )) ” 
  &&  “ (batch = 8) ” 
  &&  “ ((batch ÷ 4 ) = 2) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (input_a = (input_a_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (input_b = (input_b_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (input_a <> 0) ” 
  &&  “ (input_b <> 0) ” 
  &&  “ (output <> 0) ” 
  &&  “ ((Z.land batch (2 * sizeof(FLOAT) )) <> 0) ” 
  &&  “ ((Z.land batch (1 * sizeof(FLOAT) )) = 0) ”
  &&  ((&(( &( "vacc_lo" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc_lo" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((output + (0 * sizeof(FLOAT)))) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((output + (1 * sizeof(FLOAT)))) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (FloatArray.undef_seg output 2 (batch ÷ 4 ) )
  **  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  ((( &( "output" ) )) # Ptr  |-> (output + (2 * sizeof(FLOAT))))
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((output + (0 * sizeof(FLOAT)))) # Float  |->_)
  **  (((output + (1 * sizeof(FLOAT)))) # Float  |->_)
  **  ((&(( &( "vacc" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # Float  |-> (fp32_add ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
.

Definition test_neon_entail_wit_6_1 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (k: Z)  __default_fp32 (PreH1 : (batch <> 0)) (PreH2 : (batch < (4 * sizeof(FLOAT) ))) (PreH3 : ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH4 : ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH5 : (0 <= k)) (PreH6 : (((k * 4 ) + batch ) = batch_pre)) (PreH7 : ((batch % ( 4 ) ) = 0)) (PreH8 : (0 <= batch)) (PreH9 : (batch <= batch_pre)) (PreH10 : (k <= (batch_pre ÷ 4 ))) (PreH11 : (batch = 12)) (PreH12 : ((batch ÷ 4 ) = 3)) (PreH13 : (params_pre <> 0)) (PreH14 : (input_a = (input_a_pre + (k * sizeof(FLOAT))))) (PreH15 : (input_b = (input_b_pre + (k * sizeof(FLOAT))))) (PreH16 : (output = (output_pre + (k * sizeof(FLOAT))))) (PreH17 : (input_a <> 0)) (PreH18 : (input_b <> 0)) (PreH19 : (output <> 0)) (PreH20 : ((Z.land batch (2 * sizeof(FLOAT) )) <> 0)) (PreH21 : ((Z.land batch (1 * sizeof(FLOAT) )) <> 0)) ,
  ((&(( &( "vacc_lo" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc_lo" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((output + (0 * sizeof(FLOAT)))) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((output + (1 * sizeof(FLOAT)))) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (FloatArray.undef_seg output 2 (batch ÷ 4 ) )
  **  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((output + (0 * sizeof(FLOAT)))) # Float  |->_)
  **  (((output + (1 * sizeof(FLOAT)))) # Float  |->_)
  **  ((&(( &( "vacc" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # Float  |-> (fp32_add ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
|--
  “ (batch <> 0) ” 
  &&  “ (batch < (4 * sizeof(FLOAT) )) ” 
  &&  “ ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ (0 <= k) ” 
  &&  “ (((k * 4 ) + batch ) = batch_pre) ” 
  &&  “ ((batch % ( 4 ) ) = 0) ” 
  &&  “ (0 <= batch) ” 
  &&  “ (batch <= batch_pre) ” 
  &&  “ (k <= (batch_pre ÷ 4 )) ” 
  &&  “ (batch = 12) ” 
  &&  “ ((batch ÷ 4 ) = 3) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (input_a = (input_a_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (input_b = (input_b_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (input_a <> 0) ” 
  &&  “ (input_b <> 0) ” 
  &&  “ (output <> 0) ” 
  &&  “ ((Z.land batch (2 * sizeof(FLOAT) )) <> 0) ” 
  &&  “ ((Z.land batch (1 * sizeof(FLOAT) )) <> 0) ”
  &&  ((&(( &( "vacc_lo" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc_lo" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((output + (0 * sizeof(FLOAT)))) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((output + (1 * sizeof(FLOAT)))) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (FloatArray.undef_seg output 2 (batch ÷ 4 ) )
  **  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((output + (0 * sizeof(FLOAT)))) # Float  |->_)
  **  (((output + (1 * sizeof(FLOAT)))) # Float  |->_)
  **  ((&(( &( "vacc" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # Float  |-> (fp32_add ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
.

Definition test_neon_entail_wit_6_2 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (output_3: Z) (input_b: Z) (input_a: Z) (batch: Z) (k_3: Z)  __default_fp32 (PreH1 : (batch <> 0)) (PreH2 : (batch < (4 * sizeof(FLOAT) ))) (PreH3 : ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH4 : ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH5 : (0 <= k_3)) (PreH6 : (((k_3 * 4 ) + batch ) = batch_pre)) (PreH7 : ((batch % ( 4 ) ) = 0)) (PreH8 : (0 <= batch)) (PreH9 : (batch <= batch_pre)) (PreH10 : (k_3 <= (batch_pre ÷ 4 ))) (PreH11 : (batch = 8)) (PreH12 : ((batch ÷ 4 ) = 2)) (PreH13 : (params_pre <> 0)) (PreH14 : (input_a = (input_a_pre + (k_3 * sizeof(FLOAT))))) (PreH15 : (input_b = (input_b_pre + (k_3 * sizeof(FLOAT))))) (PreH16 : (output_3 = (output_pre + (k_3 * sizeof(FLOAT))))) (PreH17 : (input_a <> 0)) (PreH18 : (input_b <> 0)) (PreH19 : (output_3 <> 0)) (PreH20 : ((Z.land batch (2 * sizeof(FLOAT) )) <> 0)) (PreH21 : ((Z.land batch (1 * sizeof(FLOAT) )) <> 0)) ,
  ((&(( &( "vacc_lo" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 3 (fp32_slice (k_3) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 3 (fp32_slice (k_3) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc_lo" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k_3) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k_3) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((output_3 + (0 * sizeof(FLOAT)))) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k_3) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k_3) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((output_3 + (1 * sizeof(FLOAT)))) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k_3) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k_3) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (FloatArray.undef_seg output_3 2 (batch ÷ 4 ) )
  **  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k_3) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k_3) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k_3) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k_3) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k_3) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k_3) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k_3) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k_3) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k_3) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k_3) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  ((( &( "output" ) )) # Ptr  |-> (output_3 + (2 * sizeof(FLOAT))))
  **  (FloatArray.full input_a_pre k_3 (fp32_slice (0) (k_3) (A)) )
  **  (FloatArray.full input_b_pre k_3 (fp32_slice (0) (k_3) (B)) )
  **  (FloatArray.full output_pre k_3 (vadd_values (k_3) (A) (B)) )
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k_3) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k_3) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k_3) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k_3) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k_3) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k_3) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k_3) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k_3) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((output_3 + (0 * sizeof(FLOAT)))) # Float  |->_)
  **  (((output_3 + (1 * sizeof(FLOAT)))) # Float  |->_)
  **  ((&(( &( "vacc" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k_3) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k_3) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k_3) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k_3) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k_3) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k_3) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # Float  |-> (fp32_add ((Znth 3 (fp32_slice (k_3) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 3 (fp32_slice (k_3) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
|--
  (EX (output: Z)  (k: Z) ,
  “ (batch <> 0) ” 
  &&  “ (batch < (4 * sizeof(FLOAT) )) ” 
  &&  “ ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ (0 <= k) ” 
  &&  “ (((k * 4 ) + batch ) = batch_pre) ” 
  &&  “ ((batch % ( 4 ) ) = 0) ” 
  &&  “ (0 <= batch) ” 
  &&  “ (batch <= batch_pre) ” 
  &&  “ (k <= (batch_pre ÷ 4 )) ” 
  &&  “ (batch = 12) ” 
  &&  “ ((batch ÷ 4 ) = 3) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (input_a = (input_a_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (input_b = (input_b_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (input_a <> 0) ” 
  &&  “ (input_b <> 0) ” 
  &&  “ (output <> 0) ” 
  &&  “ ((Z.land batch (2 * sizeof(FLOAT) )) <> 0) ” 
  &&  “ ((Z.land batch (1 * sizeof(FLOAT) )) <> 0) ”
  &&  ((&(( &( "vacc_lo" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc_lo" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((output + (0 * sizeof(FLOAT)))) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((output + (1 * sizeof(FLOAT)))) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (FloatArray.undef_seg output 2 (batch ÷ 4 ) )
  **  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  ((( &( "output" ) )) # Ptr  |-> (output + (2 * sizeof(FLOAT))))
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((output + (0 * sizeof(FLOAT)))) # Float  |->_)
  **  (((output + (1 * sizeof(FLOAT)))) # Float  |->_)
  **  ((&(( &( "vacc" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # Float  |-> (fp32_add ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32)))))
  ||
  (EX (output_2: Z)  (k_2: Z) ,
  “ (batch <> 0) ” 
  &&  “ (batch < (4 * sizeof(FLOAT) )) ” 
  &&  “ ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ (0 <= k_2) ” 
  &&  “ (((k_2 * 4 ) + batch ) = batch_pre) ” 
  &&  “ ((batch % ( 4 ) ) = 0) ” 
  &&  “ (0 <= batch) ” 
  &&  “ (batch <= batch_pre) ” 
  &&  “ (k_2 <= (batch_pre ÷ 4 )) ” 
  &&  “ (batch = 4) ” 
  &&  “ ((batch ÷ 4 ) = 1) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (input_a = (input_a_pre + (k_2 * sizeof(FLOAT)))) ” 
  &&  “ (input_b = (input_b_pre + (k_2 * sizeof(FLOAT)))) ” 
  &&  “ (output_2 = (output_pre + (k_2 * sizeof(FLOAT)))) ” 
  &&  “ (input_a <> 0) ” 
  &&  “ (input_b <> 0) ” 
  &&  “ (output_2 <> 0) ” 
  &&  “ ((Z.land batch (2 * sizeof(FLOAT) )) = 0) ” 
  &&  “ ((Z.land batch (1 * sizeof(FLOAT) )) <> 0) ”
  &&  ((&(( &( "vacc_lo" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc_lo" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  ((( &( "output" ) )) # Ptr  |-> output_2)
  **  (FloatArray.full input_a_pre k_2 (fp32_slice (0) (k_2) (A)) )
  **  (FloatArray.full input_b_pre k_2 (fp32_slice (0) (k_2) (B)) )
  **  (FloatArray.full output_pre k_2 (vadd_values (k_2) (A) (B)) )
  **  (FloatArray.undef_full output_2 (batch ÷ 4 ) )
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vacc" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # Float  |-> (fp32_add ((Znth 3 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 3 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32)))))
.

Definition test_neon_entail_wit_6_3 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (output_2: Z) (input_b: Z) (input_a: Z) (batch: Z) (k_2: Z)  __default_fp32 (PreH1 : (batch <> 0)) (PreH2 : (batch < (4 * sizeof(FLOAT) ))) (PreH3 : ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH4 : ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH5 : (0 <= k_2)) (PreH6 : (((k_2 * 4 ) + batch ) = batch_pre)) (PreH7 : ((batch % ( 4 ) ) = 0)) (PreH8 : (0 <= batch)) (PreH9 : (batch <= batch_pre)) (PreH10 : (k_2 <= (batch_pre ÷ 4 ))) (PreH11 : (batch = 4)) (PreH12 : ((batch ÷ 4 ) = 1)) (PreH13 : (params_pre <> 0)) (PreH14 : (input_a = (input_a_pre + (k_2 * sizeof(FLOAT))))) (PreH15 : (input_b = (input_b_pre + (k_2 * sizeof(FLOAT))))) (PreH16 : (output_2 = (output_pre + (k_2 * sizeof(FLOAT))))) (PreH17 : (input_a <> 0)) (PreH18 : (input_b <> 0)) (PreH19 : (output_2 <> 0)) (PreH20 : ((Z.land batch (2 * sizeof(FLOAT) )) = 0)) (PreH21 : ((Z.land batch (1 * sizeof(FLOAT) )) <> 0)) ,
  ((&(( &( "vacc_lo" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc_lo" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  ((( &( "output" ) )) # Ptr  |-> output_2)
  **  (FloatArray.full input_a_pre k_2 (fp32_slice (0) (k_2) (A)) )
  **  (FloatArray.full input_b_pre k_2 (fp32_slice (0) (k_2) (B)) )
  **  (FloatArray.full output_pre k_2 (vadd_values (k_2) (A) (B)) )
  **  (FloatArray.undef_full output_2 (batch ÷ 4 ) )
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vacc" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # Float  |-> (fp32_add ((Znth 3 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 3 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
|--
  “ (batch <> 0) ” 
  &&  “ (batch < (4 * sizeof(FLOAT) )) ” 
  &&  “ ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ (0 <= k_2) ” 
  &&  “ (((k_2 * 4 ) + batch ) = batch_pre) ” 
  &&  “ ((batch % ( 4 ) ) = 0) ” 
  &&  “ (0 <= batch) ” 
  &&  “ (batch <= batch_pre) ” 
  &&  “ (k_2 <= (batch_pre ÷ 4 )) ” 
  &&  “ (batch = 4) ” 
  &&  “ ((batch ÷ 4 ) = 1) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (input_a = (input_a_pre + (k_2 * sizeof(FLOAT)))) ” 
  &&  “ (input_b = (input_b_pre + (k_2 * sizeof(FLOAT)))) ” 
  &&  “ (output_2 = (output_pre + (k_2 * sizeof(FLOAT)))) ” 
  &&  “ (input_a <> 0) ” 
  &&  “ (input_b <> 0) ” 
  &&  “ (output_2 <> 0) ” 
  &&  “ ((Z.land batch (2 * sizeof(FLOAT) )) = 0) ” 
  &&  “ ((Z.land batch (1 * sizeof(FLOAT) )) <> 0) ”
  &&  ((&(( &( "vacc_lo" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc_lo" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  ((( &( "output" ) )) # Ptr  |-> output_2)
  **  (FloatArray.full input_a_pre k_2 (fp32_slice (0) (k_2) (A)) )
  **  (FloatArray.full input_b_pre k_2 (fp32_slice (0) (k_2) (B)) )
  **  (FloatArray.full output_pre k_2 (vadd_values (k_2) (A) (B)) )
  **  (FloatArray.undef_full output_2 (batch ÷ 4 ) )
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vacc" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # Float  |-> (fp32_add ((Znth 3 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 3 (fp32_slice (k_2) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
.

Definition test_neon_return_wit_1 := 
(
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (k: Z)  __default_fp32 (PreH1 : (batch <> 0)) (PreH2 : (batch < (4 * sizeof(FLOAT) ))) (PreH3 : ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH4 : ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH5 : (0 <= k)) (PreH6 : (((k * 4 ) + batch ) = batch_pre)) (PreH7 : ((batch % ( 4 ) ) = 0)) (PreH8 : (0 <= batch)) (PreH9 : (batch <= batch_pre)) (PreH10 : (k <= (batch_pre ÷ 4 ))) (PreH11 : (batch = 12)) (PreH12 : ((batch ÷ 4 ) = 3)) (PreH13 : (params_pre <> 0)) (PreH14 : (input_a = (input_a_pre + (k * sizeof(FLOAT))))) (PreH15 : (input_b = (input_b_pre + (k * sizeof(FLOAT))))) (PreH16 : (output = (output_pre + (k * sizeof(FLOAT))))) (PreH17 : (input_a <> 0)) (PreH18 : (input_b <> 0)) (PreH19 : (output <> 0)) (PreH20 : ((Z.land batch (2 * sizeof(FLOAT) )) <> 0)) (PreH21 : ((Z.land batch (1 * sizeof(FLOAT) )) <> 0)) ,
  (((output + (2 * sizeof(FLOAT)))) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (FloatArray.undef_seg output (2 + 1 ) (batch ÷ 4 ) )
  **  (((output + (0 * sizeof(FLOAT)))) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((output + (1 * sizeof(FLOAT)))) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (((output + (0 * sizeof(FLOAT)))) # Float  |->_)
  **  (((output + (1 * sizeof(FLOAT)))) # Float  |->_)
  **  (((output + (2 * sizeof(FLOAT)))) # Float  |->_)
|--
  (FloatArray.full input_a_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.full input_b_pre ((batch_pre ÷ 4 ) + 3 ) B )
  **  (FloatArray.full output_pre (batch_pre ÷ 4 ) (vadd_values ((batch_pre ÷ 4 )) (A) (B)) )
) \/
(
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (k: Z)  __default_fp32 (PreH1 : (batch <> 0)) (PreH2 : (batch < (4 * sizeof(FLOAT) ))) (PreH3 : ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH4 : ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH5 : (0 <= k)) (PreH6 : (((k * 4 ) + batch ) = batch_pre)) (PreH7 : ((batch % ( 4 ) ) = 0)) (PreH8 : (0 <= batch)) (PreH9 : (batch <= batch_pre)) (PreH10 : (k <= (batch_pre ÷ 4 ))) (PreH11 : (batch = 12)) (PreH12 : ((batch ÷ 4 ) = 3)) (PreH13 : (params_pre <> 0)) (PreH14 : (input_a = (input_a_pre + (k * sizeof(FLOAT))))) (PreH15 : (input_b = (input_b_pre + (k * sizeof(FLOAT))))) (PreH16 : (output = (output_pre + (k * sizeof(FLOAT))))) (PreH17 : (input_a <> 0)) (PreH18 : (input_b <> 0)) (PreH19 : (output <> 0)) (PreH20 : ((Z.land batch (2 * sizeof(FLOAT) )) <> 0)) (PreH21 : ((Z.land batch (1 * sizeof(FLOAT) )) <> 0)) ,
  (((output + (2 * sizeof(FLOAT)))) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (FloatArray.undef_seg output (2 + 1 ) (batch ÷ 4 ) )
  **  (((output + (0 * sizeof(FLOAT)))) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((output + (1 * sizeof(FLOAT)))) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (((output + (0 * sizeof(FLOAT)))) # Float  |->_)
  **  (((output + (1 * sizeof(FLOAT)))) # Float  |->_)
  **  (((output + (2 * sizeof(FLOAT)))) # Float  |->_)
|--
  (FloatArray.full input_a_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.full input_b_pre ((batch_pre ÷ 4 ) + 3 ) B )
  **  (FloatArray.full output_pre (batch_pre ÷ 4 ) (vadd_values ((batch_pre ÷ 4 )) (A) (B)) )
).

Definition test_neon_return_wit_1_split_goal_spatial := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (k: Z)  __default_fp32 (PreH1 : (batch <> 0)) (PreH2 : (batch < (4 * sizeof(FLOAT) ))) (PreH3 : ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH4 : ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH5 : (0 <= k)) (PreH6 : (((k * 4 ) + batch ) = batch_pre)) (PreH7 : ((batch % ( 4 ) ) = 0)) (PreH8 : (0 <= batch)) (PreH9 : (batch <= batch_pre)) (PreH10 : (k <= (batch_pre ÷ 4 ))) (PreH11 : (batch = 12)) (PreH12 : ((batch ÷ 4 ) = 3)) (PreH13 : (params_pre <> 0)) (PreH14 : (input_a = (input_a_pre + (k * sizeof(FLOAT))))) (PreH15 : (input_b = (input_b_pre + (k * sizeof(FLOAT))))) (PreH16 : (output = (output_pre + (k * sizeof(FLOAT))))) (PreH17 : (input_a <> 0)) (PreH18 : (input_b <> 0)) (PreH19 : (output <> 0)) (PreH20 : ((Z.land batch (2 * sizeof(FLOAT) )) <> 0)) (PreH21 : ((Z.land batch (1 * sizeof(FLOAT) )) <> 0)) ,
  (((output + (2 * sizeof(FLOAT)))) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (FloatArray.undef_seg output (2 + 1 ) (batch ÷ 4 ) )
  **  (((output + (0 * sizeof(FLOAT)))) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((output + (1 * sizeof(FLOAT)))) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (((output + (0 * sizeof(FLOAT)))) # Float  |->_)
  **  (((output + (1 * sizeof(FLOAT)))) # Float  |->_)
  **  (((output + (2 * sizeof(FLOAT)))) # Float  |->_)
|--
  (FloatArray.full input_a_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.full input_b_pre ((batch_pre ÷ 4 ) + 3 ) B )
  **  (FloatArray.full output_pre (batch_pre ÷ 4 ) (vadd_values ((batch_pre ÷ 4 )) (A) (B)) )
.

Definition test_neon_return_wit_2 := 
(
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (k: Z)  __default_fp32 (PreH1 : (batch <> 0)) (PreH2 : (batch < (4 * sizeof(FLOAT) ))) (PreH3 : ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH4 : ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH5 : (0 <= k)) (PreH6 : (((k * 4 ) + batch ) = batch_pre)) (PreH7 : ((batch % ( 4 ) ) = 0)) (PreH8 : (0 <= batch)) (PreH9 : (batch <= batch_pre)) (PreH10 : (k <= (batch_pre ÷ 4 ))) (PreH11 : (batch = 4)) (PreH12 : ((batch ÷ 4 ) = 1)) (PreH13 : (params_pre <> 0)) (PreH14 : (input_a = (input_a_pre + (k * sizeof(FLOAT))))) (PreH15 : (input_b = (input_b_pre + (k * sizeof(FLOAT))))) (PreH16 : (output = (output_pre + (k * sizeof(FLOAT))))) (PreH17 : (input_a <> 0)) (PreH18 : (input_b <> 0)) (PreH19 : (output <> 0)) (PreH20 : ((Z.land batch (2 * sizeof(FLOAT) )) = 0)) (PreH21 : ((Z.land batch (1 * sizeof(FLOAT) )) <> 0)) ,
  ((output) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (FloatArray.undef_seg output 1 (batch ÷ 4 ) )
  **  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  ((output) # Float  |->_)
|--
  (FloatArray.full input_a_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.full input_b_pre ((batch_pre ÷ 4 ) + 3 ) B )
  **  (FloatArray.full output_pre (batch_pre ÷ 4 ) (vadd_values ((batch_pre ÷ 4 )) (A) (B)) )
) \/
(
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (k: Z)  __default_fp32 (PreH1 : (batch <> 0)) (PreH2 : (batch < (4 * sizeof(FLOAT) ))) (PreH3 : ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH4 : ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH5 : (0 <= k)) (PreH6 : (((k * 4 ) + batch ) = batch_pre)) (PreH7 : ((batch % ( 4 ) ) = 0)) (PreH8 : (0 <= batch)) (PreH9 : (batch <= batch_pre)) (PreH10 : (k <= (batch_pre ÷ 4 ))) (PreH11 : (batch = 4)) (PreH12 : ((batch ÷ 4 ) = 1)) (PreH13 : (params_pre <> 0)) (PreH14 : (input_a = (input_a_pre + (k * sizeof(FLOAT))))) (PreH15 : (input_b = (input_b_pre + (k * sizeof(FLOAT))))) (PreH16 : (output = (output_pre + (k * sizeof(FLOAT))))) (PreH17 : (input_a <> 0)) (PreH18 : (input_b <> 0)) (PreH19 : (output <> 0)) (PreH20 : ((Z.land batch (2 * sizeof(FLOAT) )) = 0)) (PreH21 : ((Z.land batch (1 * sizeof(FLOAT) )) <> 0)) ,
  ((output) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (FloatArray.undef_seg output 1 (batch ÷ 4 ) )
  **  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  ((output) # Float  |->_)
|--
  (FloatArray.full input_a_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.full input_b_pre ((batch_pre ÷ 4 ) + 3 ) B )
  **  (FloatArray.full output_pre (batch_pre ÷ 4 ) (vadd_values ((batch_pre ÷ 4 )) (A) (B)) )
).

Definition test_neon_return_wit_2_split_goal_spatial := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (k: Z)  __default_fp32 (PreH1 : (batch <> 0)) (PreH2 : (batch < (4 * sizeof(FLOAT) ))) (PreH3 : ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH4 : ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH5 : (0 <= k)) (PreH6 : (((k * 4 ) + batch ) = batch_pre)) (PreH7 : ((batch % ( 4 ) ) = 0)) (PreH8 : (0 <= batch)) (PreH9 : (batch <= batch_pre)) (PreH10 : (k <= (batch_pre ÷ 4 ))) (PreH11 : (batch = 4)) (PreH12 : ((batch ÷ 4 ) = 1)) (PreH13 : (params_pre <> 0)) (PreH14 : (input_a = (input_a_pre + (k * sizeof(FLOAT))))) (PreH15 : (input_b = (input_b_pre + (k * sizeof(FLOAT))))) (PreH16 : (output = (output_pre + (k * sizeof(FLOAT))))) (PreH17 : (input_a <> 0)) (PreH18 : (input_b <> 0)) (PreH19 : (output <> 0)) (PreH20 : ((Z.land batch (2 * sizeof(FLOAT) )) = 0)) (PreH21 : ((Z.land batch (1 * sizeof(FLOAT) )) <> 0)) ,
  ((output) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (FloatArray.undef_seg output 1 (batch ÷ 4 ) )
  **  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  ((output) # Float  |->_)
|--
  (FloatArray.full input_a_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.full input_b_pre ((batch_pre ÷ 4 ) + 3 ) B )
  **  (FloatArray.full output_pre (batch_pre ÷ 4 ) (vadd_values ((batch_pre ÷ 4 )) (A) (B)) )
.

Definition test_neon_return_wit_3 := 
(
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (k: Z)  __default_fp32 (PreH1 : (batch <> 0)) (PreH2 : (batch < (4 * sizeof(FLOAT) ))) (PreH3 : ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH4 : ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH5 : (0 <= k)) (PreH6 : (((k * 4 ) + batch ) = batch_pre)) (PreH7 : ((batch % ( 4 ) ) = 0)) (PreH8 : (0 <= batch)) (PreH9 : (batch <= batch_pre)) (PreH10 : (k <= (batch_pre ÷ 4 ))) (PreH11 : (batch = 8)) (PreH12 : ((batch ÷ 4 ) = 2)) (PreH13 : (params_pre <> 0)) (PreH14 : (input_a = (input_a_pre + (k * sizeof(FLOAT))))) (PreH15 : (input_b = (input_b_pre + (k * sizeof(FLOAT))))) (PreH16 : (output = (output_pre + (k * sizeof(FLOAT))))) (PreH17 : (input_a <> 0)) (PreH18 : (input_b <> 0)) (PreH19 : (output <> 0)) (PreH20 : ((Z.land batch (2 * sizeof(FLOAT) )) <> 0)) (PreH21 : ((Z.land batch (1 * sizeof(FLOAT) )) = 0)) ,
  (((output + (0 * sizeof(FLOAT)))) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((output + (1 * sizeof(FLOAT)))) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (FloatArray.undef_seg output 2 (batch ÷ 4 ) )
  **  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (((output + (0 * sizeof(FLOAT)))) # Float  |->_)
  **  (((output + (1 * sizeof(FLOAT)))) # Float  |->_)
|--
  (FloatArray.full input_a_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.full input_b_pre ((batch_pre ÷ 4 ) + 3 ) B )
  **  (FloatArray.full output_pre (batch_pre ÷ 4 ) (vadd_values ((batch_pre ÷ 4 )) (A) (B)) )
) \/
(
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (k: Z)  __default_fp32 (PreH1 : (batch <> 0)) (PreH2 : (batch < (4 * sizeof(FLOAT) ))) (PreH3 : ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH4 : ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH5 : (0 <= k)) (PreH6 : (((k * 4 ) + batch ) = batch_pre)) (PreH7 : ((batch % ( 4 ) ) = 0)) (PreH8 : (0 <= batch)) (PreH9 : (batch <= batch_pre)) (PreH10 : (k <= (batch_pre ÷ 4 ))) (PreH11 : (batch = 8)) (PreH12 : ((batch ÷ 4 ) = 2)) (PreH13 : (params_pre <> 0)) (PreH14 : (input_a = (input_a_pre + (k * sizeof(FLOAT))))) (PreH15 : (input_b = (input_b_pre + (k * sizeof(FLOAT))))) (PreH16 : (output = (output_pre + (k * sizeof(FLOAT))))) (PreH17 : (input_a <> 0)) (PreH18 : (input_b <> 0)) (PreH19 : (output <> 0)) (PreH20 : ((Z.land batch (2 * sizeof(FLOAT) )) <> 0)) (PreH21 : ((Z.land batch (1 * sizeof(FLOAT) )) = 0)) ,
  (((output + (0 * sizeof(FLOAT)))) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((output + (1 * sizeof(FLOAT)))) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (FloatArray.undef_seg output 2 (batch ÷ 4 ) )
  **  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (((output + (0 * sizeof(FLOAT)))) # Float  |->_)
  **  (((output + (1 * sizeof(FLOAT)))) # Float  |->_)
|--
  (FloatArray.full input_a_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.full input_b_pre ((batch_pre ÷ 4 ) + 3 ) B )
  **  (FloatArray.full output_pre (batch_pre ÷ 4 ) (vadd_values ((batch_pre ÷ 4 )) (A) (B)) )
).

Definition test_neon_return_wit_3_split_goal_spatial := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (k: Z)  __default_fp32 (PreH1 : (batch <> 0)) (PreH2 : (batch < (4 * sizeof(FLOAT) ))) (PreH3 : ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH4 : ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH5 : (0 <= k)) (PreH6 : (((k * 4 ) + batch ) = batch_pre)) (PreH7 : ((batch % ( 4 ) ) = 0)) (PreH8 : (0 <= batch)) (PreH9 : (batch <= batch_pre)) (PreH10 : (k <= (batch_pre ÷ 4 ))) (PreH11 : (batch = 8)) (PreH12 : ((batch ÷ 4 ) = 2)) (PreH13 : (params_pre <> 0)) (PreH14 : (input_a = (input_a_pre + (k * sizeof(FLOAT))))) (PreH15 : (input_b = (input_b_pre + (k * sizeof(FLOAT))))) (PreH16 : (output = (output_pre + (k * sizeof(FLOAT))))) (PreH17 : (input_a <> 0)) (PreH18 : (input_b <> 0)) (PreH19 : (output <> 0)) (PreH20 : ((Z.land batch (2 * sizeof(FLOAT) )) <> 0)) (PreH21 : ((Z.land batch (1 * sizeof(FLOAT) )) = 0)) ,
  (((output + (0 * sizeof(FLOAT)))) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((output + (1 * sizeof(FLOAT)))) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (FloatArray.undef_seg output 2 (batch ÷ 4 ) )
  **  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (((output + (0 * sizeof(FLOAT)))) # Float  |->_)
  **  (((output + (1 * sizeof(FLOAT)))) # Float  |->_)
|--
  (FloatArray.full input_a_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.full input_b_pre ((batch_pre ÷ 4 ) + 3 ) B )
  **  (FloatArray.full output_pre (batch_pre ÷ 4 ) (vadd_values ((batch_pre ÷ 4 )) (A) (B)) )
.

Definition test_neon_return_wit_4 := 
(
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (k: Z) (PreH1 : (batch = 0)) (PreH2 : (batch < (4 * sizeof(FLOAT) ))) (PreH3 : ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH4 : ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH5 : (0 <= k)) (PreH6 : (((k * 4 ) + batch ) = batch_pre)) (PreH7 : ((batch % ( 4 ) ) = 0)) (PreH8 : (0 <= batch)) (PreH9 : (batch <= batch_pre)) (PreH10 : (k <= (batch_pre ÷ 4 ))) (PreH11 : (batch = 0)) (PreH12 : (params_pre <> 0)) (PreH13 : (input_a = (input_a_pre + (k * sizeof(FLOAT))))) (PreH14 : (input_b = (input_b_pre + (k * sizeof(FLOAT))))) (PreH15 : (output = (output_pre + (k * sizeof(FLOAT))))) (PreH16 : (input_a <> 0)) (PreH17 : (input_b <> 0)) (PreH18 : (output <> 0)) ,
  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_a ((batch ÷ 4 ) + 3 ) (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full input_b ((batch ÷ 4 ) + 3 ) (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
|--
  (FloatArray.full input_a_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.full input_b_pre ((batch_pre ÷ 4 ) + 3 ) B )
  **  (FloatArray.full output_pre (batch_pre ÷ 4 ) (vadd_values ((batch_pre ÷ 4 )) (A) (B)) )
) \/
(
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (k: Z) (PreH1 : (batch = 0)) (PreH2 : (batch < (4 * sizeof(FLOAT) ))) (PreH3 : ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH4 : ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH5 : (0 <= k)) (PreH6 : (((k * 4 ) + batch ) = batch_pre)) (PreH7 : ((batch % ( 4 ) ) = 0)) (PreH8 : (0 <= batch)) (PreH9 : (batch <= batch_pre)) (PreH10 : (k <= (batch_pre ÷ 4 ))) (PreH11 : (batch = 0)) (PreH12 : (params_pre <> 0)) (PreH13 : (input_a = (input_a_pre + (k * sizeof(FLOAT))))) (PreH14 : (input_b = (input_b_pre + (k * sizeof(FLOAT))))) (PreH15 : (output = (output_pre + (k * sizeof(FLOAT))))) (PreH16 : (input_a <> 0)) (PreH17 : (input_b <> 0)) (PreH18 : (output <> 0)) ,
  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_a ((batch ÷ 4 ) + 3 ) (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full input_b ((batch ÷ 4 ) + 3 ) (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
|--
  (FloatArray.full input_a_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.full input_b_pre ((batch_pre ÷ 4 ) + 3 ) B )
  **  (FloatArray.full output_pre (batch_pre ÷ 4 ) (vadd_values ((batch_pre ÷ 4 )) (A) (B)) )
).

Definition test_neon_return_wit_4_split_goal_spatial := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (k: Z) (PreH1 : (batch = 0)) (PreH2 : (batch < (4 * sizeof(FLOAT) ))) (PreH3 : ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH4 : ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH5 : (0 <= k)) (PreH6 : (((k * 4 ) + batch ) = batch_pre)) (PreH7 : ((batch % ( 4 ) ) = 0)) (PreH8 : (0 <= batch)) (PreH9 : (batch <= batch_pre)) (PreH10 : (k <= (batch_pre ÷ 4 ))) (PreH11 : (batch = 0)) (PreH12 : (params_pre <> 0)) (PreH13 : (input_a = (input_a_pre + (k * sizeof(FLOAT))))) (PreH14 : (input_b = (input_b_pre + (k * sizeof(FLOAT))))) (PreH15 : (output = (output_pre + (k * sizeof(FLOAT))))) (PreH16 : (input_a <> 0)) (PreH17 : (input_b <> 0)) (PreH18 : (output <> 0)) ,
  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_a ((batch ÷ 4 ) + 3 ) (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full input_b ((batch ÷ 4 ) + 3 ) (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
|--
  (FloatArray.full input_a_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.full input_b_pre ((batch_pre ÷ 4 ) + 3 ) B )
  **  (FloatArray.full output_pre (batch_pre ÷ 4 ) (vadd_values ((batch_pre ÷ 4 )) (A) (B)) )
.

Definition test_neon_partial_solve_wit_1_pure := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (PreH1 : (batch_pre <> 0)) (PreH2 : (0 < batch_pre)) (PreH3 : (batch_pre <= 18446744073709551603)) (PreH4 : ((batch_pre % ( 4 ) ) = 0)) (PreH5 : (params_pre <> 0)) (PreH6 : (input_a_pre <> 0)) (PreH7 : (input_b_pre <> 0)) (PreH8 : (output_pre <> 0)) ,
  ((( &( "batch" ) )) # UInt64  |-> batch_pre)
  **  ((( &( "input_a" ) )) # Ptr  |-> input_a_pre)
  **  ((( &( "input_b" ) )) # Ptr  |-> input_b_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (FloatArray.full input_a_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.full input_b_pre ((batch_pre ÷ 4 ) + 3 ) B )
  **  (FloatArray.undef_full output_pre (batch_pre ÷ 4 ) )
|--
  “ (1 <> 0) ”
.

Definition test_neon_partial_solve_wit_1_aux := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (PreH1 : (batch_pre <> 0)) (PreH2 : (0 < batch_pre)) (PreH3 : (batch_pre <= 18446744073709551603)) (PreH4 : ((batch_pre % ( 4 ) ) = 0)) (PreH5 : (params_pre <> 0)) (PreH6 : (input_a_pre <> 0)) (PreH7 : (input_b_pre <> 0)) (PreH8 : (output_pre <> 0)) ,
  (FloatArray.full input_a_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.full input_b_pre ((batch_pre ÷ 4 ) + 3 ) B )
  **  (FloatArray.undef_full output_pre (batch_pre ÷ 4 ) )
|--
  “ (1 <> 0) ” 
  &&  “ (batch_pre <> 0) ” 
  &&  “ (0 < batch_pre) ” 
  &&  “ (batch_pre <= 18446744073709551603) ” 
  &&  “ ((batch_pre % ( 4 ) ) = 0) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (input_a_pre <> 0) ” 
  &&  “ (input_b_pre <> 0) ” 
  &&  “ (output_pre <> 0) ”
  &&  (FloatArray.full input_a_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.full input_b_pre ((batch_pre ÷ 4 ) + 3 ) B )
  **  (FloatArray.undef_full output_pre (batch_pre ÷ 4 ) )
.

Definition test_neon_partial_solve_wit_1 := test_neon_partial_solve_wit_1_pure -> test_neon_partial_solve_wit_1_aux.

Definition test_neon_partial_solve_wit_2_pure := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (PreH1 : ((batch_pre % ( sizeof(FLOAT) ) ) = 0)) (PreH2 : (batch_pre <> 0)) (PreH3 : (0 < batch_pre)) (PreH4 : (batch_pre <= 18446744073709551603)) (PreH5 : ((batch_pre % ( 4 ) ) = 0)) (PreH6 : (params_pre <> 0)) (PreH7 : (input_a_pre <> 0)) (PreH8 : (input_b_pre <> 0)) (PreH9 : (output_pre <> 0)) ,
  ((( &( "batch" ) )) # UInt64  |-> batch_pre)
  **  ((( &( "input_a" ) )) # Ptr  |-> input_a_pre)
  **  ((( &( "input_b" ) )) # Ptr  |-> input_b_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (FloatArray.full input_a_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.full input_b_pre ((batch_pre ÷ 4 ) + 3 ) B )
  **  (FloatArray.undef_full output_pre (batch_pre ÷ 4 ) )
|--
  “ (1 <> 0) ”
.

Definition test_neon_partial_solve_wit_2_aux := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (PreH1 : ((batch_pre % ( sizeof(FLOAT) ) ) = 0)) (PreH2 : (batch_pre <> 0)) (PreH3 : (0 < batch_pre)) (PreH4 : (batch_pre <= 18446744073709551603)) (PreH5 : ((batch_pre % ( 4 ) ) = 0)) (PreH6 : (params_pre <> 0)) (PreH7 : (input_a_pre <> 0)) (PreH8 : (input_b_pre <> 0)) (PreH9 : (output_pre <> 0)) ,
  (FloatArray.full input_a_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.full input_b_pre ((batch_pre ÷ 4 ) + 3 ) B )
  **  (FloatArray.undef_full output_pre (batch_pre ÷ 4 ) )
|--
  “ (1 <> 0) ” 
  &&  “ ((batch_pre % ( sizeof(FLOAT) ) ) = 0) ” 
  &&  “ (batch_pre <> 0) ” 
  &&  “ (0 < batch_pre) ” 
  &&  “ (batch_pre <= 18446744073709551603) ” 
  &&  “ ((batch_pre % ( 4 ) ) = 0) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (input_a_pre <> 0) ” 
  &&  “ (input_b_pre <> 0) ” 
  &&  “ (output_pre <> 0) ”
  &&  (FloatArray.full input_a_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.full input_b_pre ((batch_pre ÷ 4 ) + 3 ) B )
  **  (FloatArray.undef_full output_pre (batch_pre ÷ 4 ) )
.

Definition test_neon_partial_solve_wit_2 := test_neon_partial_solve_wit_2_pure -> test_neon_partial_solve_wit_2_aux.

Definition test_neon_partial_solve_wit_3_pure := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (PreH1 : (input_a_pre <> 0)) (PreH2 : ((batch_pre % ( sizeof(FLOAT) ) ) = 0)) (PreH3 : (batch_pre <> 0)) (PreH4 : (0 < batch_pre)) (PreH5 : (batch_pre <= 18446744073709551603)) (PreH6 : ((batch_pre % ( 4 ) ) = 0)) (PreH7 : (params_pre <> 0)) (PreH8 : (input_a_pre <> 0)) (PreH9 : (input_b_pre <> 0)) (PreH10 : (output_pre <> 0)) ,
  ((( &( "batch" ) )) # UInt64  |-> batch_pre)
  **  ((( &( "input_a" ) )) # Ptr  |-> input_a_pre)
  **  ((( &( "input_b" ) )) # Ptr  |-> input_b_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (FloatArray.full input_a_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.full input_b_pre ((batch_pre ÷ 4 ) + 3 ) B )
  **  (FloatArray.undef_full output_pre (batch_pre ÷ 4 ) )
|--
  “ (1 <> 0) ”
.

Definition test_neon_partial_solve_wit_3_aux := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (PreH1 : (input_a_pre <> 0)) (PreH2 : ((batch_pre % ( sizeof(FLOAT) ) ) = 0)) (PreH3 : (batch_pre <> 0)) (PreH4 : (0 < batch_pre)) (PreH5 : (batch_pre <= 18446744073709551603)) (PreH6 : ((batch_pre % ( 4 ) ) = 0)) (PreH7 : (params_pre <> 0)) (PreH8 : (input_a_pre <> 0)) (PreH9 : (input_b_pre <> 0)) (PreH10 : (output_pre <> 0)) ,
  (FloatArray.full input_a_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.full input_b_pre ((batch_pre ÷ 4 ) + 3 ) B )
  **  (FloatArray.undef_full output_pre (batch_pre ÷ 4 ) )
|--
  “ (1 <> 0) ” 
  &&  “ (input_a_pre <> 0) ” 
  &&  “ ((batch_pre % ( sizeof(FLOAT) ) ) = 0) ” 
  &&  “ (batch_pre <> 0) ” 
  &&  “ (0 < batch_pre) ” 
  &&  “ (batch_pre <= 18446744073709551603) ” 
  &&  “ ((batch_pre % ( 4 ) ) = 0) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (input_a_pre <> 0) ” 
  &&  “ (input_b_pre <> 0) ” 
  &&  “ (output_pre <> 0) ”
  &&  (FloatArray.full input_a_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.full input_b_pre ((batch_pre ÷ 4 ) + 3 ) B )
  **  (FloatArray.undef_full output_pre (batch_pre ÷ 4 ) )
.

Definition test_neon_partial_solve_wit_3 := test_neon_partial_solve_wit_3_pure -> test_neon_partial_solve_wit_3_aux.

Definition test_neon_partial_solve_wit_4_pure := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (PreH1 : (input_b_pre <> 0)) (PreH2 : (input_a_pre <> 0)) (PreH3 : ((batch_pre % ( sizeof(FLOAT) ) ) = 0)) (PreH4 : (batch_pre <> 0)) (PreH5 : (0 < batch_pre)) (PreH6 : (batch_pre <= 18446744073709551603)) (PreH7 : ((batch_pre % ( 4 ) ) = 0)) (PreH8 : (params_pre <> 0)) (PreH9 : (input_a_pre <> 0)) (PreH10 : (input_b_pre <> 0)) (PreH11 : (output_pre <> 0)) ,
  ((( &( "batch" ) )) # UInt64  |-> batch_pre)
  **  ((( &( "input_a" ) )) # Ptr  |-> input_a_pre)
  **  ((( &( "input_b" ) )) # Ptr  |-> input_b_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (FloatArray.full input_a_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.full input_b_pre ((batch_pre ÷ 4 ) + 3 ) B )
  **  (FloatArray.undef_full output_pre (batch_pre ÷ 4 ) )
|--
  “ (1 <> 0) ”
.

Definition test_neon_partial_solve_wit_4_aux := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (PreH1 : (input_b_pre <> 0)) (PreH2 : (input_a_pre <> 0)) (PreH3 : ((batch_pre % ( sizeof(FLOAT) ) ) = 0)) (PreH4 : (batch_pre <> 0)) (PreH5 : (0 < batch_pre)) (PreH6 : (batch_pre <= 18446744073709551603)) (PreH7 : ((batch_pre % ( 4 ) ) = 0)) (PreH8 : (params_pre <> 0)) (PreH9 : (input_a_pre <> 0)) (PreH10 : (input_b_pre <> 0)) (PreH11 : (output_pre <> 0)) ,
  (FloatArray.full input_a_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.full input_b_pre ((batch_pre ÷ 4 ) + 3 ) B )
  **  (FloatArray.undef_full output_pre (batch_pre ÷ 4 ) )
|--
  “ (1 <> 0) ” 
  &&  “ (input_b_pre <> 0) ” 
  &&  “ (input_a_pre <> 0) ” 
  &&  “ ((batch_pre % ( sizeof(FLOAT) ) ) = 0) ” 
  &&  “ (batch_pre <> 0) ” 
  &&  “ (0 < batch_pre) ” 
  &&  “ (batch_pre <= 18446744073709551603) ” 
  &&  “ ((batch_pre % ( 4 ) ) = 0) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (input_a_pre <> 0) ” 
  &&  “ (input_b_pre <> 0) ” 
  &&  “ (output_pre <> 0) ”
  &&  (FloatArray.full input_a_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.full input_b_pre ((batch_pre ÷ 4 ) + 3 ) B )
  **  (FloatArray.undef_full output_pre (batch_pre ÷ 4 ) )
.

Definition test_neon_partial_solve_wit_4 := test_neon_partial_solve_wit_4_pure -> test_neon_partial_solve_wit_4_aux.

Definition test_neon_partial_solve_wit_5_pure := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (PreH1 : (output_pre <> 0)) (PreH2 : (input_b_pre <> 0)) (PreH3 : (input_a_pre <> 0)) (PreH4 : ((batch_pre % ( sizeof(FLOAT) ) ) = 0)) (PreH5 : (batch_pre <> 0)) (PreH6 : (0 < batch_pre)) (PreH7 : (batch_pre <= 18446744073709551603)) (PreH8 : ((batch_pre % ( 4 ) ) = 0)) (PreH9 : (params_pre <> 0)) (PreH10 : (input_a_pre <> 0)) (PreH11 : (input_b_pre <> 0)) (PreH12 : (output_pre <> 0)) ,
  ((( &( "batch" ) )) # UInt64  |-> batch_pre)
  **  ((( &( "input_a" ) )) # Ptr  |-> input_a_pre)
  **  ((( &( "input_b" ) )) # Ptr  |-> input_b_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (FloatArray.full input_a_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.full input_b_pre ((batch_pre ÷ 4 ) + 3 ) B )
  **  (FloatArray.undef_full output_pre (batch_pre ÷ 4 ) )
|--
  “ (1 <> 0) ”
.

Definition test_neon_partial_solve_wit_5_aux := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (PreH1 : (output_pre <> 0)) (PreH2 : (input_b_pre <> 0)) (PreH3 : (input_a_pre <> 0)) (PreH4 : ((batch_pre % ( sizeof(FLOAT) ) ) = 0)) (PreH5 : (batch_pre <> 0)) (PreH6 : (0 < batch_pre)) (PreH7 : (batch_pre <= 18446744073709551603)) (PreH8 : ((batch_pre % ( 4 ) ) = 0)) (PreH9 : (params_pre <> 0)) (PreH10 : (input_a_pre <> 0)) (PreH11 : (input_b_pre <> 0)) (PreH12 : (output_pre <> 0)) ,
  (FloatArray.full input_a_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.full input_b_pre ((batch_pre ÷ 4 ) + 3 ) B )
  **  (FloatArray.undef_full output_pre (batch_pre ÷ 4 ) )
|--
  “ (1 <> 0) ” 
  &&  “ (output_pre <> 0) ” 
  &&  “ (input_b_pre <> 0) ” 
  &&  “ (input_a_pre <> 0) ” 
  &&  “ ((batch_pre % ( sizeof(FLOAT) ) ) = 0) ” 
  &&  “ (batch_pre <> 0) ” 
  &&  “ (0 < batch_pre) ” 
  &&  “ (batch_pre <= 18446744073709551603) ” 
  &&  “ ((batch_pre % ( 4 ) ) = 0) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (input_a_pre <> 0) ” 
  &&  “ (input_b_pre <> 0) ” 
  &&  “ (output_pre <> 0) ”
  &&  (FloatArray.full input_a_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.full input_b_pre ((batch_pre ÷ 4 ) + 3 ) B )
  **  (FloatArray.undef_full output_pre (batch_pre ÷ 4 ) )
.

Definition test_neon_partial_solve_wit_5 := test_neon_partial_solve_wit_5_pure -> test_neon_partial_solve_wit_5_aux.

Definition test_neon_partial_solve_wit_6 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (k: Z)  __default_fp32 (PreH1 : (batch >= (4 * sizeof(FLOAT) ))) (PreH2 : ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH3 : ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH4 : (0 <= k)) (PreH5 : (((k * 4 ) + batch ) = batch_pre)) (PreH6 : ((batch % ( 4 ) ) = 0)) (PreH7 : (0 <= batch)) (PreH8 : (batch <= batch_pre)) (PreH9 : (k <= (batch_pre ÷ 4 ))) (PreH10 : (16 <= batch)) (PreH11 : (4 <= (batch ÷ 4 ))) (PreH12 : (params_pre <> 0)) (PreH13 : (input_a = (input_a_pre + (k * sizeof(FLOAT))))) (PreH14 : (input_b = (input_b_pre + (k * sizeof(FLOAT))))) (PreH15 : (output = (output_pre + (k * sizeof(FLOAT))))) (PreH16 : (input_a <> 0)) (PreH17 : (input_b <> 0)) (PreH18 : (output <> 0)) ,
  (UndefStructPredfloat32x4_t ( &( "va" ) ) )
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_a ((batch ÷ 4 ) + 3 ) (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full input_b ((batch ÷ 4 ) + 3 ) (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
|--
  “ (batch >= (4 * sizeof(FLOAT) )) ” 
  &&  “ ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ (0 <= k) ” 
  &&  “ (((k * 4 ) + batch ) = batch_pre) ” 
  &&  “ ((batch % ( 4 ) ) = 0) ” 
  &&  “ (0 <= batch) ” 
  &&  “ (batch <= batch_pre) ” 
  &&  “ (k <= (batch_pre ÷ 4 )) ” 
  &&  “ (16 <= batch) ” 
  &&  “ (4 <= (batch ÷ 4 )) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (input_a = (input_a_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (input_b = (input_b_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (input_a <> 0) ” 
  &&  “ (input_b <> 0) ” 
  &&  “ (output <> 0) ”
  &&  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  (UndefStructPredfloat32x4_t ( &( "va" ) ) )
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full input_b ((batch ÷ 4 ) + 3 ) (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
.

Definition test_neon_partial_solve_wit_7 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (k: Z) (retval: Z)  __default_fp32 (PreH1 : (batch >= (4 * sizeof(FLOAT) ))) (PreH2 : ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH3 : ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH4 : (0 <= k)) (PreH5 : (((k * 4 ) + batch ) = batch_pre)) (PreH6 : ((batch % ( 4 ) ) = 0)) (PreH7 : (0 <= batch)) (PreH8 : (batch <= batch_pre)) (PreH9 : (k <= (batch_pre ÷ 4 ))) (PreH10 : (16 <= batch)) (PreH11 : (4 <= (batch ÷ 4 ))) (PreH12 : (params_pre <> 0)) (PreH13 : (input_a = (input_a_pre + (k * sizeof(FLOAT))))) (PreH14 : (input_b = (input_b_pre + (k * sizeof(FLOAT))))) (PreH15 : (output = (output_pre + (k * sizeof(FLOAT))))) (PreH16 : (input_a <> 0)) (PreH17 : (input_b <> 0)) (PreH18 : (output <> 0)) ,
  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&((retval)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&((retval)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&((retval)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&((retval)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  (UndefStructPredfloat32x4_t ( &( "va" ) ) )
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full input_b ((batch ÷ 4 ) + 3 ) (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
|--
  “ (batch >= (4 * sizeof(FLOAT) )) ” 
  &&  “ ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ (0 <= k) ” 
  &&  “ (((k * 4 ) + batch ) = batch_pre) ” 
  &&  “ ((batch % ( 4 ) ) = 0) ” 
  &&  “ (0 <= batch) ” 
  &&  “ (batch <= batch_pre) ” 
  &&  “ (k <= (batch_pre ÷ 4 )) ” 
  &&  “ (16 <= batch) ” 
  &&  “ (4 <= (batch ÷ 4 )) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (input_a = (input_a_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (input_b = (input_b_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (input_a <> 0) ” 
  &&  “ (input_b <> 0) ” 
  &&  “ (output <> 0) ”
  &&  ((&(( &( "va" ) )->ₛ "s3")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full input_b ((batch ÷ 4 ) + 3 ) (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
.

Definition test_neon_partial_solve_wit_8 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (k: Z)  __default_fp32 (PreH1 : (batch >= (4 * sizeof(FLOAT) ))) (PreH2 : ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH3 : ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH4 : (0 <= k)) (PreH5 : (((k * 4 ) + batch ) = batch_pre)) (PreH6 : ((batch % ( 4 ) ) = 0)) (PreH7 : (0 <= batch)) (PreH8 : (batch <= batch_pre)) (PreH9 : (k <= (batch_pre ÷ 4 ))) (PreH10 : (16 <= batch)) (PreH11 : (4 <= (batch ÷ 4 ))) (PreH12 : (params_pre <> 0)) (PreH13 : (input_a = (input_a_pre + (k * sizeof(FLOAT))))) (PreH14 : (input_b = (input_b_pre + (k * sizeof(FLOAT))))) (PreH15 : (output = (output_pre + (k * sizeof(FLOAT))))) (PreH16 : (input_a <> 0)) (PreH17 : (input_b <> 0)) (PreH18 : (output <> 0)) ,
  (UndefStructPredfloat32x4_t ( &( "vb" ) ) )
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full input_b ((batch ÷ 4 ) + 3 ) (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
|--
  “ (batch >= (4 * sizeof(FLOAT) )) ” 
  &&  “ ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ (0 <= k) ” 
  &&  “ (((k * 4 ) + batch ) = batch_pre) ” 
  &&  “ ((batch % ( 4 ) ) = 0) ” 
  &&  “ (0 <= batch) ” 
  &&  “ (batch <= batch_pre) ” 
  &&  “ (k <= (batch_pre ÷ 4 )) ” 
  &&  “ (16 <= batch) ” 
  &&  “ (4 <= (batch ÷ 4 )) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (input_a = (input_a_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (input_b = (input_b_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (input_a <> 0) ” 
  &&  “ (input_b <> 0) ” 
  &&  “ (output <> 0) ”
  &&  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  (UndefStructPredfloat32x4_t ( &( "vb" ) ) )
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
.

Definition test_neon_partial_solve_wit_9 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (k: Z) (retval: Z)  __default_fp32 (PreH1 : (batch >= (4 * sizeof(FLOAT) ))) (PreH2 : ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH3 : ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH4 : (0 <= k)) (PreH5 : (((k * 4 ) + batch ) = batch_pre)) (PreH6 : ((batch % ( 4 ) ) = 0)) (PreH7 : (0 <= batch)) (PreH8 : (batch <= batch_pre)) (PreH9 : (k <= (batch_pre ÷ 4 ))) (PreH10 : (16 <= batch)) (PreH11 : (4 <= (batch ÷ 4 ))) (PreH12 : (params_pre <> 0)) (PreH13 : (input_a = (input_a_pre + (k * sizeof(FLOAT))))) (PreH14 : (input_b = (input_b_pre + (k * sizeof(FLOAT))))) (PreH15 : (output = (output_pre + (k * sizeof(FLOAT))))) (PreH16 : (input_a <> 0)) (PreH17 : (input_b <> 0)) (PreH18 : (output <> 0)) ,
  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&((retval)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&((retval)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&((retval)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&((retval)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  (UndefStructPredfloat32x4_t ( &( "vb" ) ) )
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
|--
  “ (batch >= (4 * sizeof(FLOAT) )) ” 
  &&  “ ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ (0 <= k) ” 
  &&  “ (((k * 4 ) + batch ) = batch_pre) ” 
  &&  “ ((batch % ( 4 ) ) = 0) ” 
  &&  “ (0 <= batch) ” 
  &&  “ (batch <= batch_pre) ” 
  &&  “ (k <= (batch_pre ÷ 4 )) ” 
  &&  “ (16 <= batch) ” 
  &&  “ (4 <= (batch ÷ 4 )) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (input_a = (input_a_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (input_b = (input_b_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (input_a <> 0) ” 
  &&  “ (input_b <> 0) ” 
  &&  “ (output <> 0) ”
  &&  ((&(( &( "vb" ) )->ₛ "s3")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s2")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s1")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s0")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
.

Definition test_neon_partial_solve_wit_10 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (k: Z)  __default_fp32 (PreH1 : (batch >= (4 * sizeof(FLOAT) ))) (PreH2 : ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH3 : ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH4 : (0 <= k)) (PreH5 : (((k * 4 ) + batch ) = batch_pre)) (PreH6 : ((batch % ( 4 ) ) = 0)) (PreH7 : (0 <= batch)) (PreH8 : (batch <= batch_pre)) (PreH9 : (k <= (batch_pre ÷ 4 ))) (PreH10 : (16 <= batch)) (PreH11 : (4 <= (batch ÷ 4 ))) (PreH12 : (params_pre <> 0)) (PreH13 : (input_a = (input_a_pre + (k * sizeof(FLOAT))))) (PreH14 : (input_b = (input_b_pre + (k * sizeof(FLOAT))))) (PreH15 : (output = (output_pre + (k * sizeof(FLOAT))))) (PreH16 : (input_a <> 0)) (PreH17 : (input_b <> 0)) (PreH18 : (output <> 0)) ,
  (UndefStructPredfloat32x4_t ( &( "vacc" ) ) )
  **  ((&(( &( "vb" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
|--
  “ (batch >= (4 * sizeof(FLOAT) )) ” 
  &&  “ ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ (0 <= k) ” 
  &&  “ (((k * 4 ) + batch ) = batch_pre) ” 
  &&  “ ((batch % ( 4 ) ) = 0) ” 
  &&  “ (0 <= batch) ” 
  &&  “ (batch <= batch_pre) ” 
  &&  “ (k <= (batch_pre ÷ 4 )) ” 
  &&  “ (16 <= batch) ” 
  &&  “ (4 <= (batch ÷ 4 )) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (input_a = (input_a_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (input_b = (input_b_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (input_a <> 0) ” 
  &&  “ (input_b <> 0) ” 
  &&  “ (output <> 0) ”
  &&  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (UndefStructPredfloat32x4_t ( &( "vacc" ) ) )
  **  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
.

Definition test_neon_partial_solve_wit_11 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (k: Z) (retval: Z)  __default_fp32 (PreH1 : (batch >= (4 * sizeof(FLOAT) ))) (PreH2 : ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH3 : ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH4 : (0 <= k)) (PreH5 : (((k * 4 ) + batch ) = batch_pre)) (PreH6 : ((batch % ( 4 ) ) = 0)) (PreH7 : (0 <= batch)) (PreH8 : (batch <= batch_pre)) (PreH9 : (k <= (batch_pre ÷ 4 ))) (PreH10 : (16 <= batch)) (PreH11 : (4 <= (batch ÷ 4 ))) (PreH12 : (params_pre <> 0)) (PreH13 : (input_a = (input_a_pre + (k * sizeof(FLOAT))))) (PreH14 : (input_b = (input_b_pre + (k * sizeof(FLOAT))))) (PreH15 : (output = (output_pre + (k * sizeof(FLOAT))))) (PreH16 : (input_a <> 0)) (PreH17 : (input_b <> 0)) (PreH18 : (output <> 0)) ,
  ((&((retval)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&((retval)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&((retval)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&((retval)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (fp32_add ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (UndefStructPredfloat32x4_t ( &( "vacc" ) ) )
  **  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
|--
  “ (batch >= (4 * sizeof(FLOAT) )) ” 
  &&  “ ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ (0 <= k) ” 
  &&  “ (((k * 4 ) + batch ) = batch_pre) ” 
  &&  “ ((batch % ( 4 ) ) = 0) ” 
  &&  “ (0 <= batch) ” 
  &&  “ (batch <= batch_pre) ” 
  &&  “ (k <= (batch_pre ÷ 4 )) ” 
  &&  “ (16 <= batch) ” 
  &&  “ (4 <= (batch ÷ 4 )) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (input_a = (input_a_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (input_b = (input_b_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (input_a <> 0) ” 
  &&  “ (input_b <> 0) ” 
  &&  “ (output <> 0) ”
  &&  ((&(( &( "vacc" ) )->ₛ "s3")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (fp32_add ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s0")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
.

Definition test_neon_partial_solve_wit_12 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (k: Z)  __default_fp32 (PreH1 : (batch >= (4 * sizeof(FLOAT) ))) (PreH2 : ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH3 : ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH4 : (0 <= k)) (PreH5 : (((k * 4 ) + batch ) = batch_pre)) (PreH6 : ((batch % ( 4 ) ) = 0)) (PreH7 : (0 <= batch)) (PreH8 : (batch <= batch_pre)) (PreH9 : (k <= (batch_pre ÷ 4 ))) (PreH10 : (16 <= batch)) (PreH11 : (4 <= (batch ÷ 4 ))) (PreH12 : (params_pre <> 0)) (PreH13 : (input_a = (input_a_pre + (k * sizeof(FLOAT))))) (PreH14 : (input_b = (input_b_pre + (k * sizeof(FLOAT))))) (PreH15 : (output = (output_pre + (k * sizeof(FLOAT))))) (PreH16 : (input_a <> 0)) (PreH17 : (input_b <> 0)) (PreH18 : (output <> 0)) ,
  ((&(( &( "vacc" ) )->ₛ "s3")) # Float  |-> (fp32_add ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
|--
  “ (batch >= (4 * sizeof(FLOAT) )) ” 
  &&  “ ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ (0 <= k) ” 
  &&  “ (((k * 4 ) + batch ) = batch_pre) ” 
  &&  “ ((batch % ( 4 ) ) = 0) ” 
  &&  “ (0 <= batch) ” 
  &&  “ (batch <= batch_pre) ” 
  &&  “ (k <= (batch_pre ÷ 4 )) ” 
  &&  “ (16 <= batch) ” 
  &&  “ (4 <= (batch ÷ 4 )) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (input_a = (input_a_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (input_b = (input_b_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (input_a <> 0) ” 
  &&  “ (input_b <> 0) ” 
  &&  “ (output <> 0) ”
  &&  ((&(( &( "vacc" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # Float  |-> (fp32_add ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((output + (0 * sizeof(FLOAT)))) # Float  |->_)
  **  (((output + (1 * sizeof(FLOAT)))) # Float  |->_)
  **  (((output + (2 * sizeof(FLOAT)))) # Float  |->_)
  **  (((output + (3 * sizeof(FLOAT)))) # Float  |->_)
  **  (FloatArray.undef_seg output 4 (batch ÷ 4 ) )
  **  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
.

Definition test_neon_partial_solve_wit_13 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (k: Z)  __default_fp32 (PreH1 : (batch <> 0)) (PreH2 : (batch < (4 * sizeof(FLOAT) ))) (PreH3 : ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH4 : ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH5 : (0 <= k)) (PreH6 : (((k * 4 ) + batch ) = batch_pre)) (PreH7 : ((batch % ( 4 ) ) = 0)) (PreH8 : (0 <= batch)) (PreH9 : (batch <= batch_pre)) (PreH10 : (k <= (batch_pre ÷ 4 ))) (PreH11 : (batch = 4)) (PreH12 : ((batch ÷ 4 ) = 1)) (PreH13 : (params_pre <> 0)) (PreH14 : (input_a = (input_a_pre + (k * sizeof(FLOAT))))) (PreH15 : (input_b = (input_b_pre + (k * sizeof(FLOAT))))) (PreH16 : (output = (output_pre + (k * sizeof(FLOAT))))) (PreH17 : (input_a <> 0)) (PreH18 : (input_b <> 0)) (PreH19 : (output <> 0)) ,
  (UndefStructPredfloat32x4_t ( &( "va" ) ) )
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_a ((batch ÷ 4 ) + 3 ) (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full input_b ((batch ÷ 4 ) + 3 ) (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
|--
  “ (batch <> 0) ” 
  &&  “ (batch < (4 * sizeof(FLOAT) )) ” 
  &&  “ ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ (0 <= k) ” 
  &&  “ (((k * 4 ) + batch ) = batch_pre) ” 
  &&  “ ((batch % ( 4 ) ) = 0) ” 
  &&  “ (0 <= batch) ” 
  &&  “ (batch <= batch_pre) ” 
  &&  “ (k <= (batch_pre ÷ 4 )) ” 
  &&  “ (batch = 4) ” 
  &&  “ ((batch ÷ 4 ) = 1) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (input_a = (input_a_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (input_b = (input_b_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (input_a <> 0) ” 
  &&  “ (input_b <> 0) ” 
  &&  “ (output <> 0) ”
  &&  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  (UndefStructPredfloat32x4_t ( &( "va" ) ) )
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full input_b ((batch ÷ 4 ) + 3 ) (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
.

Definition test_neon_partial_solve_wit_14 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (k: Z)  __default_fp32 (PreH1 : (batch <> 0)) (PreH2 : (batch < (4 * sizeof(FLOAT) ))) (PreH3 : ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH4 : ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH5 : (0 <= k)) (PreH6 : (((k * 4 ) + batch ) = batch_pre)) (PreH7 : ((batch % ( 4 ) ) = 0)) (PreH8 : (0 <= batch)) (PreH9 : (batch <= batch_pre)) (PreH10 : (k <= (batch_pre ÷ 4 ))) (PreH11 : (batch = 8)) (PreH12 : ((batch ÷ 4 ) = 2)) (PreH13 : (params_pre <> 0)) (PreH14 : (input_a = (input_a_pre + (k * sizeof(FLOAT))))) (PreH15 : (input_b = (input_b_pre + (k * sizeof(FLOAT))))) (PreH16 : (output = (output_pre + (k * sizeof(FLOAT))))) (PreH17 : (input_a <> 0)) (PreH18 : (input_b <> 0)) (PreH19 : (output <> 0)) ,
  (UndefStructPredfloat32x4_t ( &( "va" ) ) )
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_a ((batch ÷ 4 ) + 3 ) (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full input_b ((batch ÷ 4 ) + 3 ) (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
|--
  “ (batch <> 0) ” 
  &&  “ (batch < (4 * sizeof(FLOAT) )) ” 
  &&  “ ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ (0 <= k) ” 
  &&  “ (((k * 4 ) + batch ) = batch_pre) ” 
  &&  “ ((batch % ( 4 ) ) = 0) ” 
  &&  “ (0 <= batch) ” 
  &&  “ (batch <= batch_pre) ” 
  &&  “ (k <= (batch_pre ÷ 4 )) ” 
  &&  “ (batch = 8) ” 
  &&  “ ((batch ÷ 4 ) = 2) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (input_a = (input_a_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (input_b = (input_b_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (input_a <> 0) ” 
  &&  “ (input_b <> 0) ” 
  &&  “ (output <> 0) ”
  &&  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  (UndefStructPredfloat32x4_t ( &( "va" ) ) )
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full input_b ((batch ÷ 4 ) + 3 ) (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
.

Definition test_neon_partial_solve_wit_15 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (k: Z)  __default_fp32 (PreH1 : (batch <> 0)) (PreH2 : (batch < (4 * sizeof(FLOAT) ))) (PreH3 : ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH4 : ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH5 : (0 <= k)) (PreH6 : (((k * 4 ) + batch ) = batch_pre)) (PreH7 : ((batch % ( 4 ) ) = 0)) (PreH8 : (0 <= batch)) (PreH9 : (batch <= batch_pre)) (PreH10 : (k <= (batch_pre ÷ 4 ))) (PreH11 : (batch = 12)) (PreH12 : ((batch ÷ 4 ) = 3)) (PreH13 : (params_pre <> 0)) (PreH14 : (input_a = (input_a_pre + (k * sizeof(FLOAT))))) (PreH15 : (input_b = (input_b_pre + (k * sizeof(FLOAT))))) (PreH16 : (output = (output_pre + (k * sizeof(FLOAT))))) (PreH17 : (input_a <> 0)) (PreH18 : (input_b <> 0)) (PreH19 : (output <> 0)) ,
  (UndefStructPredfloat32x4_t ( &( "va" ) ) )
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_a ((batch ÷ 4 ) + 3 ) (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full input_b ((batch ÷ 4 ) + 3 ) (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
|--
  “ (batch <> 0) ” 
  &&  “ (batch < (4 * sizeof(FLOAT) )) ” 
  &&  “ ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ (0 <= k) ” 
  &&  “ (((k * 4 ) + batch ) = batch_pre) ” 
  &&  “ ((batch % ( 4 ) ) = 0) ” 
  &&  “ (0 <= batch) ” 
  &&  “ (batch <= batch_pre) ” 
  &&  “ (k <= (batch_pre ÷ 4 )) ” 
  &&  “ (batch = 12) ” 
  &&  “ ((batch ÷ 4 ) = 3) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (input_a = (input_a_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (input_b = (input_b_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (input_a <> 0) ” 
  &&  “ (input_b <> 0) ” 
  &&  “ (output <> 0) ”
  &&  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  (UndefStructPredfloat32x4_t ( &( "va" ) ) )
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full input_b ((batch ÷ 4 ) + 3 ) (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
.

Definition test_neon_partial_solve_wit_16 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (k: Z) (retval: Z)  __default_fp32 (PreH1 : (batch <> 0)) (PreH2 : (batch < (4 * sizeof(FLOAT) ))) (PreH3 : ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH4 : ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH5 : (0 <= k)) (PreH6 : (((k * 4 ) + batch ) = batch_pre)) (PreH7 : ((batch % ( 4 ) ) = 0)) (PreH8 : (0 <= batch)) (PreH9 : (batch <= batch_pre)) (PreH10 : (k <= (batch_pre ÷ 4 ))) (PreH11 : (batch = 4)) (PreH12 : ((batch ÷ 4 ) = 1)) (PreH13 : (params_pre <> 0)) (PreH14 : (input_a = (input_a_pre + (k * sizeof(FLOAT))))) (PreH15 : (input_b = (input_b_pre + (k * sizeof(FLOAT))))) (PreH16 : (output = (output_pre + (k * sizeof(FLOAT))))) (PreH17 : (input_a <> 0)) (PreH18 : (input_b <> 0)) (PreH19 : (output <> 0)) ,
  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&((retval)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&((retval)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&((retval)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&((retval)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  (UndefStructPredfloat32x4_t ( &( "va" ) ) )
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full input_b ((batch ÷ 4 ) + 3 ) (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
|--
  “ (batch <> 0) ” 
  &&  “ (batch < (4 * sizeof(FLOAT) )) ” 
  &&  “ ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ (0 <= k) ” 
  &&  “ (((k * 4 ) + batch ) = batch_pre) ” 
  &&  “ ((batch % ( 4 ) ) = 0) ” 
  &&  “ (0 <= batch) ” 
  &&  “ (batch <= batch_pre) ” 
  &&  “ (k <= (batch_pre ÷ 4 )) ” 
  &&  “ (batch = 4) ” 
  &&  “ ((batch ÷ 4 ) = 1) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (input_a = (input_a_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (input_b = (input_b_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (input_a <> 0) ” 
  &&  “ (input_b <> 0) ” 
  &&  “ (output <> 0) ”
  &&  ((&(( &( "va" ) )->ₛ "s3")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full input_b ((batch ÷ 4 ) + 3 ) (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
.

Definition test_neon_partial_solve_wit_17 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (k: Z) (retval: Z)  __default_fp32 (PreH1 : (batch <> 0)) (PreH2 : (batch < (4 * sizeof(FLOAT) ))) (PreH3 : ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH4 : ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH5 : (0 <= k)) (PreH6 : (((k * 4 ) + batch ) = batch_pre)) (PreH7 : ((batch % ( 4 ) ) = 0)) (PreH8 : (0 <= batch)) (PreH9 : (batch <= batch_pre)) (PreH10 : (k <= (batch_pre ÷ 4 ))) (PreH11 : (batch = 8)) (PreH12 : ((batch ÷ 4 ) = 2)) (PreH13 : (params_pre <> 0)) (PreH14 : (input_a = (input_a_pre + (k * sizeof(FLOAT))))) (PreH15 : (input_b = (input_b_pre + (k * sizeof(FLOAT))))) (PreH16 : (output = (output_pre + (k * sizeof(FLOAT))))) (PreH17 : (input_a <> 0)) (PreH18 : (input_b <> 0)) (PreH19 : (output <> 0)) ,
  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&((retval)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&((retval)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&((retval)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&((retval)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  (UndefStructPredfloat32x4_t ( &( "va" ) ) )
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full input_b ((batch ÷ 4 ) + 3 ) (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
|--
  “ (batch <> 0) ” 
  &&  “ (batch < (4 * sizeof(FLOAT) )) ” 
  &&  “ ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ (0 <= k) ” 
  &&  “ (((k * 4 ) + batch ) = batch_pre) ” 
  &&  “ ((batch % ( 4 ) ) = 0) ” 
  &&  “ (0 <= batch) ” 
  &&  “ (batch <= batch_pre) ” 
  &&  “ (k <= (batch_pre ÷ 4 )) ” 
  &&  “ (batch = 8) ” 
  &&  “ ((batch ÷ 4 ) = 2) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (input_a = (input_a_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (input_b = (input_b_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (input_a <> 0) ” 
  &&  “ (input_b <> 0) ” 
  &&  “ (output <> 0) ”
  &&  ((&(( &( "va" ) )->ₛ "s3")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full input_b ((batch ÷ 4 ) + 3 ) (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
.

Definition test_neon_partial_solve_wit_18 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (k: Z) (retval: Z)  __default_fp32 (PreH1 : (batch <> 0)) (PreH2 : (batch < (4 * sizeof(FLOAT) ))) (PreH3 : ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH4 : ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH5 : (0 <= k)) (PreH6 : (((k * 4 ) + batch ) = batch_pre)) (PreH7 : ((batch % ( 4 ) ) = 0)) (PreH8 : (0 <= batch)) (PreH9 : (batch <= batch_pre)) (PreH10 : (k <= (batch_pre ÷ 4 ))) (PreH11 : (batch = 12)) (PreH12 : ((batch ÷ 4 ) = 3)) (PreH13 : (params_pre <> 0)) (PreH14 : (input_a = (input_a_pre + (k * sizeof(FLOAT))))) (PreH15 : (input_b = (input_b_pre + (k * sizeof(FLOAT))))) (PreH16 : (output = (output_pre + (k * sizeof(FLOAT))))) (PreH17 : (input_a <> 0)) (PreH18 : (input_b <> 0)) (PreH19 : (output <> 0)) ,
  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&((retval)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&((retval)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&((retval)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&((retval)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  (UndefStructPredfloat32x4_t ( &( "va" ) ) )
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full input_b ((batch ÷ 4 ) + 3 ) (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
|--
  “ (batch <> 0) ” 
  &&  “ (batch < (4 * sizeof(FLOAT) )) ” 
  &&  “ ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ (0 <= k) ” 
  &&  “ (((k * 4 ) + batch ) = batch_pre) ” 
  &&  “ ((batch % ( 4 ) ) = 0) ” 
  &&  “ (0 <= batch) ” 
  &&  “ (batch <= batch_pre) ” 
  &&  “ (k <= (batch_pre ÷ 4 )) ” 
  &&  “ (batch = 12) ” 
  &&  “ ((batch ÷ 4 ) = 3) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (input_a = (input_a_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (input_b = (input_b_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (input_a <> 0) ” 
  &&  “ (input_b <> 0) ” 
  &&  “ (output <> 0) ”
  &&  ((&(( &( "va" ) )->ₛ "s3")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full input_b ((batch ÷ 4 ) + 3 ) (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
.

Definition test_neon_partial_solve_wit_19 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (k: Z)  __default_fp32 (PreH1 : (batch <> 0)) (PreH2 : (batch < (4 * sizeof(FLOAT) ))) (PreH3 : ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH4 : ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH5 : (0 <= k)) (PreH6 : (((k * 4 ) + batch ) = batch_pre)) (PreH7 : ((batch % ( 4 ) ) = 0)) (PreH8 : (0 <= batch)) (PreH9 : (batch <= batch_pre)) (PreH10 : (k <= (batch_pre ÷ 4 ))) (PreH11 : (batch = 12)) (PreH12 : ((batch ÷ 4 ) = 3)) (PreH13 : (params_pre <> 0)) (PreH14 : (input_a = (input_a_pre + (k * sizeof(FLOAT))))) (PreH15 : (input_b = (input_b_pre + (k * sizeof(FLOAT))))) (PreH16 : (output = (output_pre + (k * sizeof(FLOAT))))) (PreH17 : (input_a <> 0)) (PreH18 : (input_b <> 0)) (PreH19 : (output <> 0)) ,
  (UndefStructPredfloat32x4_t ( &( "vb" ) ) )
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full input_b ((batch ÷ 4 ) + 3 ) (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
|--
  “ (batch <> 0) ” 
  &&  “ (batch < (4 * sizeof(FLOAT) )) ” 
  &&  “ ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ (0 <= k) ” 
  &&  “ (((k * 4 ) + batch ) = batch_pre) ” 
  &&  “ ((batch % ( 4 ) ) = 0) ” 
  &&  “ (0 <= batch) ” 
  &&  “ (batch <= batch_pre) ” 
  &&  “ (k <= (batch_pre ÷ 4 )) ” 
  &&  “ (batch = 12) ” 
  &&  “ ((batch ÷ 4 ) = 3) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (input_a = (input_a_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (input_b = (input_b_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (input_a <> 0) ” 
  &&  “ (input_b <> 0) ” 
  &&  “ (output <> 0) ”
  &&  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  (UndefStructPredfloat32x4_t ( &( "vb" ) ) )
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
.

Definition test_neon_partial_solve_wit_20 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (k: Z)  __default_fp32 (PreH1 : (batch <> 0)) (PreH2 : (batch < (4 * sizeof(FLOAT) ))) (PreH3 : ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH4 : ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH5 : (0 <= k)) (PreH6 : (((k * 4 ) + batch ) = batch_pre)) (PreH7 : ((batch % ( 4 ) ) = 0)) (PreH8 : (0 <= batch)) (PreH9 : (batch <= batch_pre)) (PreH10 : (k <= (batch_pre ÷ 4 ))) (PreH11 : (batch = 8)) (PreH12 : ((batch ÷ 4 ) = 2)) (PreH13 : (params_pre <> 0)) (PreH14 : (input_a = (input_a_pre + (k * sizeof(FLOAT))))) (PreH15 : (input_b = (input_b_pre + (k * sizeof(FLOAT))))) (PreH16 : (output = (output_pre + (k * sizeof(FLOAT))))) (PreH17 : (input_a <> 0)) (PreH18 : (input_b <> 0)) (PreH19 : (output <> 0)) ,
  (UndefStructPredfloat32x4_t ( &( "vb" ) ) )
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full input_b ((batch ÷ 4 ) + 3 ) (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
|--
  “ (batch <> 0) ” 
  &&  “ (batch < (4 * sizeof(FLOAT) )) ” 
  &&  “ ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ (0 <= k) ” 
  &&  “ (((k * 4 ) + batch ) = batch_pre) ” 
  &&  “ ((batch % ( 4 ) ) = 0) ” 
  &&  “ (0 <= batch) ” 
  &&  “ (batch <= batch_pre) ” 
  &&  “ (k <= (batch_pre ÷ 4 )) ” 
  &&  “ (batch = 8) ” 
  &&  “ ((batch ÷ 4 ) = 2) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (input_a = (input_a_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (input_b = (input_b_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (input_a <> 0) ” 
  &&  “ (input_b <> 0) ” 
  &&  “ (output <> 0) ”
  &&  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  (UndefStructPredfloat32x4_t ( &( "vb" ) ) )
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
.

Definition test_neon_partial_solve_wit_21 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (k: Z)  __default_fp32 (PreH1 : (batch <> 0)) (PreH2 : (batch < (4 * sizeof(FLOAT) ))) (PreH3 : ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH4 : ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH5 : (0 <= k)) (PreH6 : (((k * 4 ) + batch ) = batch_pre)) (PreH7 : ((batch % ( 4 ) ) = 0)) (PreH8 : (0 <= batch)) (PreH9 : (batch <= batch_pre)) (PreH10 : (k <= (batch_pre ÷ 4 ))) (PreH11 : (batch = 4)) (PreH12 : ((batch ÷ 4 ) = 1)) (PreH13 : (params_pre <> 0)) (PreH14 : (input_a = (input_a_pre + (k * sizeof(FLOAT))))) (PreH15 : (input_b = (input_b_pre + (k * sizeof(FLOAT))))) (PreH16 : (output = (output_pre + (k * sizeof(FLOAT))))) (PreH17 : (input_a <> 0)) (PreH18 : (input_b <> 0)) (PreH19 : (output <> 0)) ,
  (UndefStructPredfloat32x4_t ( &( "vb" ) ) )
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full input_b ((batch ÷ 4 ) + 3 ) (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
|--
  “ (batch <> 0) ” 
  &&  “ (batch < (4 * sizeof(FLOAT) )) ” 
  &&  “ ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ (0 <= k) ” 
  &&  “ (((k * 4 ) + batch ) = batch_pre) ” 
  &&  “ ((batch % ( 4 ) ) = 0) ” 
  &&  “ (0 <= batch) ” 
  &&  “ (batch <= batch_pre) ” 
  &&  “ (k <= (batch_pre ÷ 4 )) ” 
  &&  “ (batch = 4) ” 
  &&  “ ((batch ÷ 4 ) = 1) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (input_a = (input_a_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (input_b = (input_b_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (input_a <> 0) ” 
  &&  “ (input_b <> 0) ” 
  &&  “ (output <> 0) ”
  &&  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  (UndefStructPredfloat32x4_t ( &( "vb" ) ) )
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
.

Definition test_neon_partial_solve_wit_22 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (k: Z) (retval: Z)  __default_fp32 (PreH1 : (batch <> 0)) (PreH2 : (batch < (4 * sizeof(FLOAT) ))) (PreH3 : ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH4 : ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH5 : (0 <= k)) (PreH6 : (((k * 4 ) + batch ) = batch_pre)) (PreH7 : ((batch % ( 4 ) ) = 0)) (PreH8 : (0 <= batch)) (PreH9 : (batch <= batch_pre)) (PreH10 : (k <= (batch_pre ÷ 4 ))) (PreH11 : (batch = 12)) (PreH12 : ((batch ÷ 4 ) = 3)) (PreH13 : (params_pre <> 0)) (PreH14 : (input_a = (input_a_pre + (k * sizeof(FLOAT))))) (PreH15 : (input_b = (input_b_pre + (k * sizeof(FLOAT))))) (PreH16 : (output = (output_pre + (k * sizeof(FLOAT))))) (PreH17 : (input_a <> 0)) (PreH18 : (input_b <> 0)) (PreH19 : (output <> 0)) ,
  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&((retval)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&((retval)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&((retval)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&((retval)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  (UndefStructPredfloat32x4_t ( &( "vb" ) ) )
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
|--
  “ (batch <> 0) ” 
  &&  “ (batch < (4 * sizeof(FLOAT) )) ” 
  &&  “ ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ (0 <= k) ” 
  &&  “ (((k * 4 ) + batch ) = batch_pre) ” 
  &&  “ ((batch % ( 4 ) ) = 0) ” 
  &&  “ (0 <= batch) ” 
  &&  “ (batch <= batch_pre) ” 
  &&  “ (k <= (batch_pre ÷ 4 )) ” 
  &&  “ (batch = 12) ” 
  &&  “ ((batch ÷ 4 ) = 3) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (input_a = (input_a_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (input_b = (input_b_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (input_a <> 0) ” 
  &&  “ (input_b <> 0) ” 
  &&  “ (output <> 0) ”
  &&  ((&(( &( "vb" ) )->ₛ "s3")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s2")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s1")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s0")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
.

Definition test_neon_partial_solve_wit_23 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (k: Z) (retval: Z)  __default_fp32 (PreH1 : (batch <> 0)) (PreH2 : (batch < (4 * sizeof(FLOAT) ))) (PreH3 : ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH4 : ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH5 : (0 <= k)) (PreH6 : (((k * 4 ) + batch ) = batch_pre)) (PreH7 : ((batch % ( 4 ) ) = 0)) (PreH8 : (0 <= batch)) (PreH9 : (batch <= batch_pre)) (PreH10 : (k <= (batch_pre ÷ 4 ))) (PreH11 : (batch = 8)) (PreH12 : ((batch ÷ 4 ) = 2)) (PreH13 : (params_pre <> 0)) (PreH14 : (input_a = (input_a_pre + (k * sizeof(FLOAT))))) (PreH15 : (input_b = (input_b_pre + (k * sizeof(FLOAT))))) (PreH16 : (output = (output_pre + (k * sizeof(FLOAT))))) (PreH17 : (input_a <> 0)) (PreH18 : (input_b <> 0)) (PreH19 : (output <> 0)) ,
  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&((retval)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&((retval)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&((retval)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&((retval)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  (UndefStructPredfloat32x4_t ( &( "vb" ) ) )
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
|--
  “ (batch <> 0) ” 
  &&  “ (batch < (4 * sizeof(FLOAT) )) ” 
  &&  “ ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ (0 <= k) ” 
  &&  “ (((k * 4 ) + batch ) = batch_pre) ” 
  &&  “ ((batch % ( 4 ) ) = 0) ” 
  &&  “ (0 <= batch) ” 
  &&  “ (batch <= batch_pre) ” 
  &&  “ (k <= (batch_pre ÷ 4 )) ” 
  &&  “ (batch = 8) ” 
  &&  “ ((batch ÷ 4 ) = 2) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (input_a = (input_a_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (input_b = (input_b_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (input_a <> 0) ” 
  &&  “ (input_b <> 0) ” 
  &&  “ (output <> 0) ”
  &&  ((&(( &( "vb" ) )->ₛ "s3")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s2")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s1")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s0")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
.

Definition test_neon_partial_solve_wit_24 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (k: Z) (retval: Z)  __default_fp32 (PreH1 : (batch <> 0)) (PreH2 : (batch < (4 * sizeof(FLOAT) ))) (PreH3 : ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH4 : ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH5 : (0 <= k)) (PreH6 : (((k * 4 ) + batch ) = batch_pre)) (PreH7 : ((batch % ( 4 ) ) = 0)) (PreH8 : (0 <= batch)) (PreH9 : (batch <= batch_pre)) (PreH10 : (k <= (batch_pre ÷ 4 ))) (PreH11 : (batch = 4)) (PreH12 : ((batch ÷ 4 ) = 1)) (PreH13 : (params_pre <> 0)) (PreH14 : (input_a = (input_a_pre + (k * sizeof(FLOAT))))) (PreH15 : (input_b = (input_b_pre + (k * sizeof(FLOAT))))) (PreH16 : (output = (output_pre + (k * sizeof(FLOAT))))) (PreH17 : (input_a <> 0)) (PreH18 : (input_b <> 0)) (PreH19 : (output <> 0)) ,
  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&((retval)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&((retval)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&((retval)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&((retval)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  (UndefStructPredfloat32x4_t ( &( "vb" ) ) )
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
|--
  “ (batch <> 0) ” 
  &&  “ (batch < (4 * sizeof(FLOAT) )) ” 
  &&  “ ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ (0 <= k) ” 
  &&  “ (((k * 4 ) + batch ) = batch_pre) ” 
  &&  “ ((batch % ( 4 ) ) = 0) ” 
  &&  “ (0 <= batch) ” 
  &&  “ (batch <= batch_pre) ” 
  &&  “ (k <= (batch_pre ÷ 4 )) ” 
  &&  “ (batch = 4) ” 
  &&  “ ((batch ÷ 4 ) = 1) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (input_a = (input_a_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (input_b = (input_b_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (input_a <> 0) ” 
  &&  “ (input_b <> 0) ” 
  &&  “ (output <> 0) ”
  &&  ((&(( &( "vb" ) )->ₛ "s3")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s2")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s1")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s0")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
.

Definition test_neon_partial_solve_wit_25 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (k: Z)  __default_fp32 (PreH1 : (batch <> 0)) (PreH2 : (batch < (4 * sizeof(FLOAT) ))) (PreH3 : ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH4 : ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH5 : (0 <= k)) (PreH6 : (((k * 4 ) + batch ) = batch_pre)) (PreH7 : ((batch % ( 4 ) ) = 0)) (PreH8 : (0 <= batch)) (PreH9 : (batch <= batch_pre)) (PreH10 : (k <= (batch_pre ÷ 4 ))) (PreH11 : (batch = 4)) (PreH12 : ((batch ÷ 4 ) = 1)) (PreH13 : (params_pre <> 0)) (PreH14 : (input_a = (input_a_pre + (k * sizeof(FLOAT))))) (PreH15 : (input_b = (input_b_pre + (k * sizeof(FLOAT))))) (PreH16 : (output = (output_pre + (k * sizeof(FLOAT))))) (PreH17 : (input_a <> 0)) (PreH18 : (input_b <> 0)) (PreH19 : (output <> 0)) ,
  (UndefStructPredfloat32x4_t ( &( "vacc" ) ) )
  **  ((&(( &( "vb" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
|--
  “ (batch <> 0) ” 
  &&  “ (batch < (4 * sizeof(FLOAT) )) ” 
  &&  “ ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ (0 <= k) ” 
  &&  “ (((k * 4 ) + batch ) = batch_pre) ” 
  &&  “ ((batch % ( 4 ) ) = 0) ” 
  &&  “ (0 <= batch) ” 
  &&  “ (batch <= batch_pre) ” 
  &&  “ (k <= (batch_pre ÷ 4 )) ” 
  &&  “ (batch = 4) ” 
  &&  “ ((batch ÷ 4 ) = 1) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (input_a = (input_a_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (input_b = (input_b_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (input_a <> 0) ” 
  &&  “ (input_b <> 0) ” 
  &&  “ (output <> 0) ”
  &&  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (UndefStructPredfloat32x4_t ( &( "vacc" ) ) )
  **  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
.

Definition test_neon_partial_solve_wit_26 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (k: Z)  __default_fp32 (PreH1 : (batch <> 0)) (PreH2 : (batch < (4 * sizeof(FLOAT) ))) (PreH3 : ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH4 : ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH5 : (0 <= k)) (PreH6 : (((k * 4 ) + batch ) = batch_pre)) (PreH7 : ((batch % ( 4 ) ) = 0)) (PreH8 : (0 <= batch)) (PreH9 : (batch <= batch_pre)) (PreH10 : (k <= (batch_pre ÷ 4 ))) (PreH11 : (batch = 8)) (PreH12 : ((batch ÷ 4 ) = 2)) (PreH13 : (params_pre <> 0)) (PreH14 : (input_a = (input_a_pre + (k * sizeof(FLOAT))))) (PreH15 : (input_b = (input_b_pre + (k * sizeof(FLOAT))))) (PreH16 : (output = (output_pre + (k * sizeof(FLOAT))))) (PreH17 : (input_a <> 0)) (PreH18 : (input_b <> 0)) (PreH19 : (output <> 0)) ,
  (UndefStructPredfloat32x4_t ( &( "vacc" ) ) )
  **  ((&(( &( "vb" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
|--
  “ (batch <> 0) ” 
  &&  “ (batch < (4 * sizeof(FLOAT) )) ” 
  &&  “ ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ (0 <= k) ” 
  &&  “ (((k * 4 ) + batch ) = batch_pre) ” 
  &&  “ ((batch % ( 4 ) ) = 0) ” 
  &&  “ (0 <= batch) ” 
  &&  “ (batch <= batch_pre) ” 
  &&  “ (k <= (batch_pre ÷ 4 )) ” 
  &&  “ (batch = 8) ” 
  &&  “ ((batch ÷ 4 ) = 2) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (input_a = (input_a_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (input_b = (input_b_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (input_a <> 0) ” 
  &&  “ (input_b <> 0) ” 
  &&  “ (output <> 0) ”
  &&  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (UndefStructPredfloat32x4_t ( &( "vacc" ) ) )
  **  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
.

Definition test_neon_partial_solve_wit_27 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (k: Z)  __default_fp32 (PreH1 : (batch <> 0)) (PreH2 : (batch < (4 * sizeof(FLOAT) ))) (PreH3 : ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH4 : ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH5 : (0 <= k)) (PreH6 : (((k * 4 ) + batch ) = batch_pre)) (PreH7 : ((batch % ( 4 ) ) = 0)) (PreH8 : (0 <= batch)) (PreH9 : (batch <= batch_pre)) (PreH10 : (k <= (batch_pre ÷ 4 ))) (PreH11 : (batch = 12)) (PreH12 : ((batch ÷ 4 ) = 3)) (PreH13 : (params_pre <> 0)) (PreH14 : (input_a = (input_a_pre + (k * sizeof(FLOAT))))) (PreH15 : (input_b = (input_b_pre + (k * sizeof(FLOAT))))) (PreH16 : (output = (output_pre + (k * sizeof(FLOAT))))) (PreH17 : (input_a <> 0)) (PreH18 : (input_b <> 0)) (PreH19 : (output <> 0)) ,
  (UndefStructPredfloat32x4_t ( &( "vacc" ) ) )
  **  ((&(( &( "vb" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
|--
  “ (batch <> 0) ” 
  &&  “ (batch < (4 * sizeof(FLOAT) )) ” 
  &&  “ ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ (0 <= k) ” 
  &&  “ (((k * 4 ) + batch ) = batch_pre) ” 
  &&  “ ((batch % ( 4 ) ) = 0) ” 
  &&  “ (0 <= batch) ” 
  &&  “ (batch <= batch_pre) ” 
  &&  “ (k <= (batch_pre ÷ 4 )) ” 
  &&  “ (batch = 12) ” 
  &&  “ ((batch ÷ 4 ) = 3) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (input_a = (input_a_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (input_b = (input_b_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (input_a <> 0) ” 
  &&  “ (input_b <> 0) ” 
  &&  “ (output <> 0) ”
  &&  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (UndefStructPredfloat32x4_t ( &( "vacc" ) ) )
  **  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
.

Definition test_neon_partial_solve_wit_28 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (k: Z) (retval: Z)  __default_fp32 (PreH1 : (batch <> 0)) (PreH2 : (batch < (4 * sizeof(FLOAT) ))) (PreH3 : ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH4 : ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH5 : (0 <= k)) (PreH6 : (((k * 4 ) + batch ) = batch_pre)) (PreH7 : ((batch % ( 4 ) ) = 0)) (PreH8 : (0 <= batch)) (PreH9 : (batch <= batch_pre)) (PreH10 : (k <= (batch_pre ÷ 4 ))) (PreH11 : (batch = 4)) (PreH12 : ((batch ÷ 4 ) = 1)) (PreH13 : (params_pre <> 0)) (PreH14 : (input_a = (input_a_pre + (k * sizeof(FLOAT))))) (PreH15 : (input_b = (input_b_pre + (k * sizeof(FLOAT))))) (PreH16 : (output = (output_pre + (k * sizeof(FLOAT))))) (PreH17 : (input_a <> 0)) (PreH18 : (input_b <> 0)) (PreH19 : (output <> 0)) ,
  ((&((retval)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&((retval)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&((retval)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&((retval)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (fp32_add ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (UndefStructPredfloat32x4_t ( &( "vacc" ) ) )
  **  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
|--
  “ (batch <> 0) ” 
  &&  “ (batch < (4 * sizeof(FLOAT) )) ” 
  &&  “ ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ (0 <= k) ” 
  &&  “ (((k * 4 ) + batch ) = batch_pre) ” 
  &&  “ ((batch % ( 4 ) ) = 0) ” 
  &&  “ (0 <= batch) ” 
  &&  “ (batch <= batch_pre) ” 
  &&  “ (k <= (batch_pre ÷ 4 )) ” 
  &&  “ (batch = 4) ” 
  &&  “ ((batch ÷ 4 ) = 1) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (input_a = (input_a_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (input_b = (input_b_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (input_a <> 0) ” 
  &&  “ (input_b <> 0) ” 
  &&  “ (output <> 0) ”
  &&  ((&(( &( "vacc" ) )->ₛ "s3")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (fp32_add ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s0")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
.

Definition test_neon_partial_solve_wit_29 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (k: Z) (retval: Z)  __default_fp32 (PreH1 : (batch <> 0)) (PreH2 : (batch < (4 * sizeof(FLOAT) ))) (PreH3 : ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH4 : ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH5 : (0 <= k)) (PreH6 : (((k * 4 ) + batch ) = batch_pre)) (PreH7 : ((batch % ( 4 ) ) = 0)) (PreH8 : (0 <= batch)) (PreH9 : (batch <= batch_pre)) (PreH10 : (k <= (batch_pre ÷ 4 ))) (PreH11 : (batch = 8)) (PreH12 : ((batch ÷ 4 ) = 2)) (PreH13 : (params_pre <> 0)) (PreH14 : (input_a = (input_a_pre + (k * sizeof(FLOAT))))) (PreH15 : (input_b = (input_b_pre + (k * sizeof(FLOAT))))) (PreH16 : (output = (output_pre + (k * sizeof(FLOAT))))) (PreH17 : (input_a <> 0)) (PreH18 : (input_b <> 0)) (PreH19 : (output <> 0)) ,
  ((&((retval)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&((retval)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&((retval)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&((retval)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (fp32_add ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (UndefStructPredfloat32x4_t ( &( "vacc" ) ) )
  **  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
|--
  “ (batch <> 0) ” 
  &&  “ (batch < (4 * sizeof(FLOAT) )) ” 
  &&  “ ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ (0 <= k) ” 
  &&  “ (((k * 4 ) + batch ) = batch_pre) ” 
  &&  “ ((batch % ( 4 ) ) = 0) ” 
  &&  “ (0 <= batch) ” 
  &&  “ (batch <= batch_pre) ” 
  &&  “ (k <= (batch_pre ÷ 4 )) ” 
  &&  “ (batch = 8) ” 
  &&  “ ((batch ÷ 4 ) = 2) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (input_a = (input_a_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (input_b = (input_b_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (input_a <> 0) ” 
  &&  “ (input_b <> 0) ” 
  &&  “ (output <> 0) ”
  &&  ((&(( &( "vacc" ) )->ₛ "s3")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (fp32_add ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s0")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
.

Definition test_neon_partial_solve_wit_30 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (k: Z) (retval: Z)  __default_fp32 (PreH1 : (batch <> 0)) (PreH2 : (batch < (4 * sizeof(FLOAT) ))) (PreH3 : ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH4 : ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH5 : (0 <= k)) (PreH6 : (((k * 4 ) + batch ) = batch_pre)) (PreH7 : ((batch % ( 4 ) ) = 0)) (PreH8 : (0 <= batch)) (PreH9 : (batch <= batch_pre)) (PreH10 : (k <= (batch_pre ÷ 4 ))) (PreH11 : (batch = 12)) (PreH12 : ((batch ÷ 4 ) = 3)) (PreH13 : (params_pre <> 0)) (PreH14 : (input_a = (input_a_pre + (k * sizeof(FLOAT))))) (PreH15 : (input_b = (input_b_pre + (k * sizeof(FLOAT))))) (PreH16 : (output = (output_pre + (k * sizeof(FLOAT))))) (PreH17 : (input_a <> 0)) (PreH18 : (input_b <> 0)) (PreH19 : (output <> 0)) ,
  ((&((retval)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&((retval)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&((retval)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&((retval)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (fp32_add ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (UndefStructPredfloat32x4_t ( &( "vacc" ) ) )
  **  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
|--
  “ (batch <> 0) ” 
  &&  “ (batch < (4 * sizeof(FLOAT) )) ” 
  &&  “ ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ (0 <= k) ” 
  &&  “ (((k * 4 ) + batch ) = batch_pre) ” 
  &&  “ ((batch % ( 4 ) ) = 0) ” 
  &&  “ (0 <= batch) ” 
  &&  “ (batch <= batch_pre) ” 
  &&  “ (k <= (batch_pre ÷ 4 )) ” 
  &&  “ (batch = 12) ” 
  &&  “ ((batch ÷ 4 ) = 3) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (input_a = (input_a_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (input_b = (input_b_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (input_a <> 0) ” 
  &&  “ (input_b <> 0) ” 
  &&  “ (output <> 0) ”
  &&  ((&(( &( "vacc" ) )->ₛ "s3")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (fp32_add ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s0")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
.

Definition test_neon_partial_solve_wit_31 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (k: Z)  __default_fp32 (PreH1 : (batch <> 0)) (PreH2 : (batch < (4 * sizeof(FLOAT) ))) (PreH3 : ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH4 : ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH5 : (0 <= k)) (PreH6 : (((k * 4 ) + batch ) = batch_pre)) (PreH7 : ((batch % ( 4 ) ) = 0)) (PreH8 : (0 <= batch)) (PreH9 : (batch <= batch_pre)) (PreH10 : (k <= (batch_pre ÷ 4 ))) (PreH11 : (batch = 12)) (PreH12 : ((batch ÷ 4 ) = 3)) (PreH13 : (params_pre <> 0)) (PreH14 : (input_a = (input_a_pre + (k * sizeof(FLOAT))))) (PreH15 : (input_b = (input_b_pre + (k * sizeof(FLOAT))))) (PreH16 : (output = (output_pre + (k * sizeof(FLOAT))))) (PreH17 : (input_a <> 0)) (PreH18 : (input_b <> 0)) (PreH19 : (output <> 0)) ,
  (UndefStructPredfloat32x2_t ( &( "vacc_lo" ) ) )
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # Float  |-> (fp32_add ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
|--
  “ (batch <> 0) ” 
  &&  “ (batch < (4 * sizeof(FLOAT) )) ” 
  &&  “ ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ (0 <= k) ” 
  &&  “ (((k * 4 ) + batch ) = batch_pre) ” 
  &&  “ ((batch % ( 4 ) ) = 0) ” 
  &&  “ (0 <= batch) ” 
  &&  “ (batch <= batch_pre) ” 
  &&  “ (k <= (batch_pre ÷ 4 )) ” 
  &&  “ (batch = 12) ” 
  &&  “ ((batch ÷ 4 ) = 3) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (input_a = (input_a_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (input_b = (input_b_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (input_a <> 0) ” 
  &&  “ (input_b <> 0) ” 
  &&  “ (output <> 0) ”
  &&  ((&(( &( "vacc" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # Float  |-> (fp32_add ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (UndefStructPredfloat32x2_t ( &( "vacc_lo" ) ) )
  **  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
.

Definition test_neon_partial_solve_wit_32 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (k: Z)  __default_fp32 (PreH1 : (batch <> 0)) (PreH2 : (batch < (4 * sizeof(FLOAT) ))) (PreH3 : ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH4 : ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH5 : (0 <= k)) (PreH6 : (((k * 4 ) + batch ) = batch_pre)) (PreH7 : ((batch % ( 4 ) ) = 0)) (PreH8 : (0 <= batch)) (PreH9 : (batch <= batch_pre)) (PreH10 : (k <= (batch_pre ÷ 4 ))) (PreH11 : (batch = 8)) (PreH12 : ((batch ÷ 4 ) = 2)) (PreH13 : (params_pre <> 0)) (PreH14 : (input_a = (input_a_pre + (k * sizeof(FLOAT))))) (PreH15 : (input_b = (input_b_pre + (k * sizeof(FLOAT))))) (PreH16 : (output = (output_pre + (k * sizeof(FLOAT))))) (PreH17 : (input_a <> 0)) (PreH18 : (input_b <> 0)) (PreH19 : (output <> 0)) ,
  (UndefStructPredfloat32x2_t ( &( "vacc_lo" ) ) )
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # Float  |-> (fp32_add ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
|--
  “ (batch <> 0) ” 
  &&  “ (batch < (4 * sizeof(FLOAT) )) ” 
  &&  “ ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ (0 <= k) ” 
  &&  “ (((k * 4 ) + batch ) = batch_pre) ” 
  &&  “ ((batch % ( 4 ) ) = 0) ” 
  &&  “ (0 <= batch) ” 
  &&  “ (batch <= batch_pre) ” 
  &&  “ (k <= (batch_pre ÷ 4 )) ” 
  &&  “ (batch = 8) ” 
  &&  “ ((batch ÷ 4 ) = 2) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (input_a = (input_a_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (input_b = (input_b_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (input_a <> 0) ” 
  &&  “ (input_b <> 0) ” 
  &&  “ (output <> 0) ”
  &&  ((&(( &( "vacc" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # Float  |-> (fp32_add ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (UndefStructPredfloat32x2_t ( &( "vacc_lo" ) ) )
  **  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
.

Definition test_neon_partial_solve_wit_33 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (k: Z)  __default_fp32 (PreH1 : (batch <> 0)) (PreH2 : (batch < (4 * sizeof(FLOAT) ))) (PreH3 : ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH4 : ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH5 : (0 <= k)) (PreH6 : (((k * 4 ) + batch ) = batch_pre)) (PreH7 : ((batch % ( 4 ) ) = 0)) (PreH8 : (0 <= batch)) (PreH9 : (batch <= batch_pre)) (PreH10 : (k <= (batch_pre ÷ 4 ))) (PreH11 : (batch = 4)) (PreH12 : ((batch ÷ 4 ) = 1)) (PreH13 : (params_pre <> 0)) (PreH14 : (input_a = (input_a_pre + (k * sizeof(FLOAT))))) (PreH15 : (input_b = (input_b_pre + (k * sizeof(FLOAT))))) (PreH16 : (output = (output_pre + (k * sizeof(FLOAT))))) (PreH17 : (input_a <> 0)) (PreH18 : (input_b <> 0)) (PreH19 : (output <> 0)) ,
  (UndefStructPredfloat32x2_t ( &( "vacc_lo" ) ) )
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # Float  |-> (fp32_add ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
|--
  “ (batch <> 0) ” 
  &&  “ (batch < (4 * sizeof(FLOAT) )) ” 
  &&  “ ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ (0 <= k) ” 
  &&  “ (((k * 4 ) + batch ) = batch_pre) ” 
  &&  “ ((batch % ( 4 ) ) = 0) ” 
  &&  “ (0 <= batch) ” 
  &&  “ (batch <= batch_pre) ” 
  &&  “ (k <= (batch_pre ÷ 4 )) ” 
  &&  “ (batch = 4) ” 
  &&  “ ((batch ÷ 4 ) = 1) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (input_a = (input_a_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (input_b = (input_b_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (input_a <> 0) ” 
  &&  “ (input_b <> 0) ” 
  &&  “ (output <> 0) ”
  &&  ((&(( &( "vacc" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # Float  |-> (fp32_add ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (UndefStructPredfloat32x2_t ( &( "vacc_lo" ) ) )
  **  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
.

Definition test_neon_partial_solve_wit_34 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (k: Z) (retval: Z)  __default_fp32 (PreH1 : (batch <> 0)) (PreH2 : (batch < (4 * sizeof(FLOAT) ))) (PreH3 : ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH4 : ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH5 : (0 <= k)) (PreH6 : (((k * 4 ) + batch ) = batch_pre)) (PreH7 : ((batch % ( 4 ) ) = 0)) (PreH8 : (0 <= batch)) (PreH9 : (batch <= batch_pre)) (PreH10 : (k <= (batch_pre ÷ 4 ))) (PreH11 : (batch = 12)) (PreH12 : ((batch ÷ 4 ) = 3)) (PreH13 : (params_pre <> 0)) (PreH14 : (input_a = (input_a_pre + (k * sizeof(FLOAT))))) (PreH15 : (input_b = (input_b_pre + (k * sizeof(FLOAT))))) (PreH16 : (output = (output_pre + (k * sizeof(FLOAT))))) (PreH17 : (input_a <> 0)) (PreH18 : (input_b <> 0)) (PreH19 : (output <> 0)) ,
  ((&((retval)  # "float32x2_t" ->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&((retval)  # "float32x2_t" ->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (UndefStructPredfloat32x2_t ( &( "vacc_lo" ) ) )
  **  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vacc" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # Float  |-> (fp32_add ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
|--
  “ (batch <> 0) ” 
  &&  “ (batch < (4 * sizeof(FLOAT) )) ” 
  &&  “ ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ (0 <= k) ” 
  &&  “ (((k * 4 ) + batch ) = batch_pre) ” 
  &&  “ ((batch % ( 4 ) ) = 0) ” 
  &&  “ (0 <= batch) ” 
  &&  “ (batch <= batch_pre) ” 
  &&  “ (k <= (batch_pre ÷ 4 )) ” 
  &&  “ (batch = 12) ” 
  &&  “ ((batch ÷ 4 ) = 3) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (input_a = (input_a_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (input_b = (input_b_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (input_a <> 0) ” 
  &&  “ (input_b <> 0) ” 
  &&  “ (output <> 0) ”
  &&  ((&(( &( "vacc_lo" ) )->ₛ "s1")) # Float  |->_)
  **  ((&((retval)  # "float32x2_t" ->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc_lo" ) )->ₛ "s0")) # Float  |->_)
  **  ((&((retval)  # "float32x2_t" ->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vacc" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # Float  |-> (fp32_add ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
.

Definition test_neon_partial_solve_wit_35 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (k: Z) (retval: Z)  __default_fp32 (PreH1 : (batch <> 0)) (PreH2 : (batch < (4 * sizeof(FLOAT) ))) (PreH3 : ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH4 : ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH5 : (0 <= k)) (PreH6 : (((k * 4 ) + batch ) = batch_pre)) (PreH7 : ((batch % ( 4 ) ) = 0)) (PreH8 : (0 <= batch)) (PreH9 : (batch <= batch_pre)) (PreH10 : (k <= (batch_pre ÷ 4 ))) (PreH11 : (batch = 8)) (PreH12 : ((batch ÷ 4 ) = 2)) (PreH13 : (params_pre <> 0)) (PreH14 : (input_a = (input_a_pre + (k * sizeof(FLOAT))))) (PreH15 : (input_b = (input_b_pre + (k * sizeof(FLOAT))))) (PreH16 : (output = (output_pre + (k * sizeof(FLOAT))))) (PreH17 : (input_a <> 0)) (PreH18 : (input_b <> 0)) (PreH19 : (output <> 0)) ,
  ((&((retval)  # "float32x2_t" ->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&((retval)  # "float32x2_t" ->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (UndefStructPredfloat32x2_t ( &( "vacc_lo" ) ) )
  **  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vacc" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # Float  |-> (fp32_add ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
|--
  “ (batch <> 0) ” 
  &&  “ (batch < (4 * sizeof(FLOAT) )) ” 
  &&  “ ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ (0 <= k) ” 
  &&  “ (((k * 4 ) + batch ) = batch_pre) ” 
  &&  “ ((batch % ( 4 ) ) = 0) ” 
  &&  “ (0 <= batch) ” 
  &&  “ (batch <= batch_pre) ” 
  &&  “ (k <= (batch_pre ÷ 4 )) ” 
  &&  “ (batch = 8) ” 
  &&  “ ((batch ÷ 4 ) = 2) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (input_a = (input_a_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (input_b = (input_b_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (input_a <> 0) ” 
  &&  “ (input_b <> 0) ” 
  &&  “ (output <> 0) ”
  &&  ((&(( &( "vacc_lo" ) )->ₛ "s1")) # Float  |->_)
  **  ((&((retval)  # "float32x2_t" ->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc_lo" ) )->ₛ "s0")) # Float  |->_)
  **  ((&((retval)  # "float32x2_t" ->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vacc" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # Float  |-> (fp32_add ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
.

Definition test_neon_partial_solve_wit_36 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (k: Z) (retval: Z)  __default_fp32 (PreH1 : (batch <> 0)) (PreH2 : (batch < (4 * sizeof(FLOAT) ))) (PreH3 : ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH4 : ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH5 : (0 <= k)) (PreH6 : (((k * 4 ) + batch ) = batch_pre)) (PreH7 : ((batch % ( 4 ) ) = 0)) (PreH8 : (0 <= batch)) (PreH9 : (batch <= batch_pre)) (PreH10 : (k <= (batch_pre ÷ 4 ))) (PreH11 : (batch = 4)) (PreH12 : ((batch ÷ 4 ) = 1)) (PreH13 : (params_pre <> 0)) (PreH14 : (input_a = (input_a_pre + (k * sizeof(FLOAT))))) (PreH15 : (input_b = (input_b_pre + (k * sizeof(FLOAT))))) (PreH16 : (output = (output_pre + (k * sizeof(FLOAT))))) (PreH17 : (input_a <> 0)) (PreH18 : (input_b <> 0)) (PreH19 : (output <> 0)) ,
  ((&((retval)  # "float32x2_t" ->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&((retval)  # "float32x2_t" ->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (UndefStructPredfloat32x2_t ( &( "vacc_lo" ) ) )
  **  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vacc" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # Float  |-> (fp32_add ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
|--
  “ (batch <> 0) ” 
  &&  “ (batch < (4 * sizeof(FLOAT) )) ” 
  &&  “ ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ (0 <= k) ” 
  &&  “ (((k * 4 ) + batch ) = batch_pre) ” 
  &&  “ ((batch % ( 4 ) ) = 0) ” 
  &&  “ (0 <= batch) ” 
  &&  “ (batch <= batch_pre) ” 
  &&  “ (k <= (batch_pre ÷ 4 )) ” 
  &&  “ (batch = 4) ” 
  &&  “ ((batch ÷ 4 ) = 1) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (input_a = (input_a_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (input_b = (input_b_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (input_a <> 0) ” 
  &&  “ (input_b <> 0) ” 
  &&  “ (output <> 0) ”
  &&  ((&(( &( "vacc_lo" ) )->ₛ "s1")) # Float  |->_)
  **  ((&((retval)  # "float32x2_t" ->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc_lo" ) )->ₛ "s0")) # Float  |->_)
  **  ((&((retval)  # "float32x2_t" ->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vacc" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # Float  |-> (fp32_add ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
.

Definition test_neon_partial_solve_wit_37 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (k: Z)  __default_fp32 (PreH1 : (batch <> 0)) (PreH2 : (batch < (4 * sizeof(FLOAT) ))) (PreH3 : ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH4 : ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH5 : (0 <= k)) (PreH6 : (((k * 4 ) + batch ) = batch_pre)) (PreH7 : ((batch % ( 4 ) ) = 0)) (PreH8 : (0 <= batch)) (PreH9 : (batch <= batch_pre)) (PreH10 : (k <= (batch_pre ÷ 4 ))) (PreH11 : (batch = 8)) (PreH12 : ((batch ÷ 4 ) = 2)) (PreH13 : (params_pre <> 0)) (PreH14 : (input_a = (input_a_pre + (k * sizeof(FLOAT))))) (PreH15 : (input_b = (input_b_pre + (k * sizeof(FLOAT))))) (PreH16 : (output = (output_pre + (k * sizeof(FLOAT))))) (PreH17 : (input_a <> 0)) (PreH18 : (input_b <> 0)) (PreH19 : (output <> 0)) (PreH20 : ((Z.land batch (2 * sizeof(FLOAT) )) <> 0)) ,
  ((&(( &( "vacc_lo" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc_lo" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vacc" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # Float  |-> (fp32_add ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
|--
  “ (batch <> 0) ” 
  &&  “ (batch < (4 * sizeof(FLOAT) )) ” 
  &&  “ ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ (0 <= k) ” 
  &&  “ (((k * 4 ) + batch ) = batch_pre) ” 
  &&  “ ((batch % ( 4 ) ) = 0) ” 
  &&  “ (0 <= batch) ” 
  &&  “ (batch <= batch_pre) ” 
  &&  “ (k <= (batch_pre ÷ 4 )) ” 
  &&  “ (batch = 8) ” 
  &&  “ ((batch ÷ 4 ) = 2) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (input_a = (input_a_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (input_b = (input_b_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (input_a <> 0) ” 
  &&  “ (input_b <> 0) ” 
  &&  “ (output <> 0) ” 
  &&  “ ((Z.land batch (2 * sizeof(FLOAT) )) <> 0) ”
  &&  ((&(( &( "vacc_lo" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc_lo" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((output + (0 * sizeof(FLOAT)))) # Float  |->_)
  **  (((output + (1 * sizeof(FLOAT)))) # Float  |->_)
  **  (FloatArray.undef_seg output 2 (batch ÷ 4 ) )
  **  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vacc" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # Float  |-> (fp32_add ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
.

Definition test_neon_partial_solve_wit_38 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (k: Z)  __default_fp32 (PreH1 : (batch <> 0)) (PreH2 : (batch < (4 * sizeof(FLOAT) ))) (PreH3 : ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH4 : ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH5 : (0 <= k)) (PreH6 : (((k * 4 ) + batch ) = batch_pre)) (PreH7 : ((batch % ( 4 ) ) = 0)) (PreH8 : (0 <= batch)) (PreH9 : (batch <= batch_pre)) (PreH10 : (k <= (batch_pre ÷ 4 ))) (PreH11 : (batch = 12)) (PreH12 : ((batch ÷ 4 ) = 3)) (PreH13 : (params_pre <> 0)) (PreH14 : (input_a = (input_a_pre + (k * sizeof(FLOAT))))) (PreH15 : (input_b = (input_b_pre + (k * sizeof(FLOAT))))) (PreH16 : (output = (output_pre + (k * sizeof(FLOAT))))) (PreH17 : (input_a <> 0)) (PreH18 : (input_b <> 0)) (PreH19 : (output <> 0)) (PreH20 : ((Z.land batch (2 * sizeof(FLOAT) )) <> 0)) ,
  ((&(( &( "vacc_lo" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc_lo" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vacc" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # Float  |-> (fp32_add ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
|--
  “ (batch <> 0) ” 
  &&  “ (batch < (4 * sizeof(FLOAT) )) ” 
  &&  “ ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ (0 <= k) ” 
  &&  “ (((k * 4 ) + batch ) = batch_pre) ” 
  &&  “ ((batch % ( 4 ) ) = 0) ” 
  &&  “ (0 <= batch) ” 
  &&  “ (batch <= batch_pre) ” 
  &&  “ (k <= (batch_pre ÷ 4 )) ” 
  &&  “ (batch = 12) ” 
  &&  “ ((batch ÷ 4 ) = 3) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (input_a = (input_a_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (input_b = (input_b_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (input_a <> 0) ” 
  &&  “ (input_b <> 0) ” 
  &&  “ (output <> 0) ” 
  &&  “ ((Z.land batch (2 * sizeof(FLOAT) )) <> 0) ”
  &&  ((&(( &( "vacc_lo" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc_lo" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((output + (0 * sizeof(FLOAT)))) # Float  |->_)
  **  (((output + (1 * sizeof(FLOAT)))) # Float  |->_)
  **  (FloatArray.undef_seg output 2 (batch ÷ 4 ) )
  **  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vacc" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # Float  |-> (fp32_add ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
.

Definition test_neon_partial_solve_wit_39 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (k: Z)  __default_fp32 (PreH1 : (batch <> 0)) (PreH2 : (batch < (4 * sizeof(FLOAT) ))) (PreH3 : ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH4 : ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH5 : (0 <= k)) (PreH6 : (((k * 4 ) + batch ) = batch_pre)) (PreH7 : ((batch % ( 4 ) ) = 0)) (PreH8 : (0 <= batch)) (PreH9 : (batch <= batch_pre)) (PreH10 : (k <= (batch_pre ÷ 4 ))) (PreH11 : (batch = 8)) (PreH12 : ((batch ÷ 4 ) = 2)) (PreH13 : (params_pre <> 0)) (PreH14 : (input_a = (input_a_pre + (k * sizeof(FLOAT))))) (PreH15 : (input_b = (input_b_pre + (k * sizeof(FLOAT))))) (PreH16 : (output = (output_pre + (k * sizeof(FLOAT))))) (PreH17 : (input_a <> 0)) (PreH18 : (input_b <> 0)) (PreH19 : (output <> 0)) (PreH20 : ((Z.land batch (2 * sizeof(FLOAT) )) <> 0)) ,
  (((output + (0 * sizeof(FLOAT)))) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((output + (1 * sizeof(FLOAT)))) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (FloatArray.undef_seg output 2 (batch ÷ 4 ) )
  **  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vacc" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # Float  |-> (fp32_add ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc_lo" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc_lo" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((output + (0 * sizeof(FLOAT)))) # Float  |->_)
  **  (((output + (1 * sizeof(FLOAT)))) # Float  |->_)
|--
  “ (batch <> 0) ” 
  &&  “ (batch < (4 * sizeof(FLOAT) )) ” 
  &&  “ ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ (0 <= k) ” 
  &&  “ (((k * 4 ) + batch ) = batch_pre) ” 
  &&  “ ((batch % ( 4 ) ) = 0) ” 
  &&  “ (0 <= batch) ” 
  &&  “ (batch <= batch_pre) ” 
  &&  “ (k <= (batch_pre ÷ 4 )) ” 
  &&  “ (batch = 8) ” 
  &&  “ ((batch ÷ 4 ) = 2) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (input_a = (input_a_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (input_b = (input_b_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (input_a <> 0) ” 
  &&  “ (input_b <> 0) ” 
  &&  “ (output <> 0) ” 
  &&  “ ((Z.land batch (2 * sizeof(FLOAT) )) <> 0) ”
  &&  ((&(( &( "vacc" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # Float  |-> (fp32_add ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((output + (0 * sizeof(FLOAT)))) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((output + (1 * sizeof(FLOAT)))) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (FloatArray.undef_seg output 2 (batch ÷ 4 ) )
  **  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vacc_lo" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc_lo" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((output + (0 * sizeof(FLOAT)))) # Float  |->_)
  **  (((output + (1 * sizeof(FLOAT)))) # Float  |->_)
.

Definition test_neon_partial_solve_wit_40 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (k: Z) (retval: Z)  __default_fp32 (PreH1 : (batch <> 0)) (PreH2 : (batch < (4 * sizeof(FLOAT) ))) (PreH3 : ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH4 : ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH5 : (0 <= k)) (PreH6 : (((k * 4 ) + batch ) = batch_pre)) (PreH7 : ((batch % ( 4 ) ) = 0)) (PreH8 : (0 <= batch)) (PreH9 : (batch <= batch_pre)) (PreH10 : (k <= (batch_pre ÷ 4 ))) (PreH11 : (batch = 8)) (PreH12 : ((batch ÷ 4 ) = 2)) (PreH13 : (params_pre <> 0)) (PreH14 : (input_a = (input_a_pre + (k * sizeof(FLOAT))))) (PreH15 : (input_b = (input_b_pre + (k * sizeof(FLOAT))))) (PreH16 : (output = (output_pre + (k * sizeof(FLOAT))))) (PreH17 : (input_a <> 0)) (PreH18 : (input_b <> 0)) (PreH19 : (output <> 0)) (PreH20 : ((Z.land batch (2 * sizeof(FLOAT) )) <> 0)) ,
  (UndefStructPredfloat32x2_t ( &( "vacc_lo" ) ) )
  **  ((&((retval)  # "float32x2_t" ->ₛ "s0")) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&((retval)  # "float32x2_t" ->ₛ "s1")) # Float  |-> (fp32_add ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((output + (0 * sizeof(FLOAT)))) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((output + (1 * sizeof(FLOAT)))) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (FloatArray.undef_seg output 2 (batch ÷ 4 ) )
  **  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((output + (0 * sizeof(FLOAT)))) # Float  |->_)
  **  (((output + (1 * sizeof(FLOAT)))) # Float  |->_)
  **  ((&(( &( "vacc" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # Float  |-> (fp32_add ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
|--
  “ (batch <> 0) ” 
  &&  “ (batch < (4 * sizeof(FLOAT) )) ” 
  &&  “ ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ (0 <= k) ” 
  &&  “ (((k * 4 ) + batch ) = batch_pre) ” 
  &&  “ ((batch % ( 4 ) ) = 0) ” 
  &&  “ (0 <= batch) ” 
  &&  “ (batch <= batch_pre) ” 
  &&  “ (k <= (batch_pre ÷ 4 )) ” 
  &&  “ (batch = 8) ” 
  &&  “ ((batch ÷ 4 ) = 2) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (input_a = (input_a_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (input_b = (input_b_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (input_a <> 0) ” 
  &&  “ (input_b <> 0) ” 
  &&  “ (output <> 0) ” 
  &&  “ ((Z.land batch (2 * sizeof(FLOAT) )) <> 0) ”
  &&  ((&(( &( "vacc_lo" ) )->ₛ "s1")) # Float  |->_)
  **  ((&((retval)  # "float32x2_t" ->ₛ "s1")) # Float  |-> (fp32_add ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc_lo" ) )->ₛ "s0")) # Float  |->_)
  **  ((&((retval)  # "float32x2_t" ->ₛ "s0")) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((output + (0 * sizeof(FLOAT)))) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((output + (1 * sizeof(FLOAT)))) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (FloatArray.undef_seg output 2 (batch ÷ 4 ) )
  **  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((output + (0 * sizeof(FLOAT)))) # Float  |->_)
  **  (((output + (1 * sizeof(FLOAT)))) # Float  |->_)
  **  ((&(( &( "vacc" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # Float  |-> (fp32_add ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
.

Definition test_neon_partial_solve_wit_41 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (k: Z)  __default_fp32 (PreH1 : (batch <> 0)) (PreH2 : (batch < (4 * sizeof(FLOAT) ))) (PreH3 : ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH4 : ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH5 : (0 <= k)) (PreH6 : (((k * 4 ) + batch ) = batch_pre)) (PreH7 : ((batch % ( 4 ) ) = 0)) (PreH8 : (0 <= batch)) (PreH9 : (batch <= batch_pre)) (PreH10 : (k <= (batch_pre ÷ 4 ))) (PreH11 : (batch = 12)) (PreH12 : ((batch ÷ 4 ) = 3)) (PreH13 : (params_pre <> 0)) (PreH14 : (input_a = (input_a_pre + (k * sizeof(FLOAT))))) (PreH15 : (input_b = (input_b_pre + (k * sizeof(FLOAT))))) (PreH16 : (output = (output_pre + (k * sizeof(FLOAT))))) (PreH17 : (input_a <> 0)) (PreH18 : (input_b <> 0)) (PreH19 : (output <> 0)) (PreH20 : ((Z.land batch (2 * sizeof(FLOAT) )) <> 0)) ,
  (((output + (0 * sizeof(FLOAT)))) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((output + (1 * sizeof(FLOAT)))) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (FloatArray.undef_seg output 2 (batch ÷ 4 ) )
  **  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vacc" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # Float  |-> (fp32_add ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc_lo" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc_lo" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((output + (0 * sizeof(FLOAT)))) # Float  |->_)
  **  (((output + (1 * sizeof(FLOAT)))) # Float  |->_)
|--
  “ (batch <> 0) ” 
  &&  “ (batch < (4 * sizeof(FLOAT) )) ” 
  &&  “ ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ (0 <= k) ” 
  &&  “ (((k * 4 ) + batch ) = batch_pre) ” 
  &&  “ ((batch % ( 4 ) ) = 0) ” 
  &&  “ (0 <= batch) ” 
  &&  “ (batch <= batch_pre) ” 
  &&  “ (k <= (batch_pre ÷ 4 )) ” 
  &&  “ (batch = 12) ” 
  &&  “ ((batch ÷ 4 ) = 3) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (input_a = (input_a_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (input_b = (input_b_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (input_a <> 0) ” 
  &&  “ (input_b <> 0) ” 
  &&  “ (output <> 0) ” 
  &&  “ ((Z.land batch (2 * sizeof(FLOAT) )) <> 0) ”
  &&  ((&(( &( "vacc" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # Float  |-> (fp32_add ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((output + (0 * sizeof(FLOAT)))) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((output + (1 * sizeof(FLOAT)))) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (FloatArray.undef_seg output 2 (batch ÷ 4 ) )
  **  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vacc_lo" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc_lo" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((output + (0 * sizeof(FLOAT)))) # Float  |->_)
  **  (((output + (1 * sizeof(FLOAT)))) # Float  |->_)
.

Definition test_neon_partial_solve_wit_42 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (k: Z) (retval: Z)  __default_fp32 (PreH1 : (batch <> 0)) (PreH2 : (batch < (4 * sizeof(FLOAT) ))) (PreH3 : ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH4 : ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH5 : (0 <= k)) (PreH6 : (((k * 4 ) + batch ) = batch_pre)) (PreH7 : ((batch % ( 4 ) ) = 0)) (PreH8 : (0 <= batch)) (PreH9 : (batch <= batch_pre)) (PreH10 : (k <= (batch_pre ÷ 4 ))) (PreH11 : (batch = 12)) (PreH12 : ((batch ÷ 4 ) = 3)) (PreH13 : (params_pre <> 0)) (PreH14 : (input_a = (input_a_pre + (k * sizeof(FLOAT))))) (PreH15 : (input_b = (input_b_pre + (k * sizeof(FLOAT))))) (PreH16 : (output = (output_pre + (k * sizeof(FLOAT))))) (PreH17 : (input_a <> 0)) (PreH18 : (input_b <> 0)) (PreH19 : (output <> 0)) (PreH20 : ((Z.land batch (2 * sizeof(FLOAT) )) <> 0)) ,
  (UndefStructPredfloat32x2_t ( &( "vacc_lo" ) ) )
  **  ((&((retval)  # "float32x2_t" ->ₛ "s0")) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&((retval)  # "float32x2_t" ->ₛ "s1")) # Float  |-> (fp32_add ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((output + (0 * sizeof(FLOAT)))) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((output + (1 * sizeof(FLOAT)))) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (FloatArray.undef_seg output 2 (batch ÷ 4 ) )
  **  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((output + (0 * sizeof(FLOAT)))) # Float  |->_)
  **  (((output + (1 * sizeof(FLOAT)))) # Float  |->_)
  **  ((&(( &( "vacc" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # Float  |-> (fp32_add ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
|--
  “ (batch <> 0) ” 
  &&  “ (batch < (4 * sizeof(FLOAT) )) ” 
  &&  “ ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ (0 <= k) ” 
  &&  “ (((k * 4 ) + batch ) = batch_pre) ” 
  &&  “ ((batch % ( 4 ) ) = 0) ” 
  &&  “ (0 <= batch) ” 
  &&  “ (batch <= batch_pre) ” 
  &&  “ (k <= (batch_pre ÷ 4 )) ” 
  &&  “ (batch = 12) ” 
  &&  “ ((batch ÷ 4 ) = 3) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (input_a = (input_a_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (input_b = (input_b_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (input_a <> 0) ” 
  &&  “ (input_b <> 0) ” 
  &&  “ (output <> 0) ” 
  &&  “ ((Z.land batch (2 * sizeof(FLOAT) )) <> 0) ”
  &&  ((&(( &( "vacc_lo" ) )->ₛ "s1")) # Float  |->_)
  **  ((&((retval)  # "float32x2_t" ->ₛ "s1")) # Float  |-> (fp32_add ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc_lo" ) )->ₛ "s0")) # Float  |->_)
  **  ((&((retval)  # "float32x2_t" ->ₛ "s0")) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((output + (0 * sizeof(FLOAT)))) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((output + (1 * sizeof(FLOAT)))) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (FloatArray.undef_seg output 2 (batch ÷ 4 ) )
  **  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((output + (0 * sizeof(FLOAT)))) # Float  |->_)
  **  (((output + (1 * sizeof(FLOAT)))) # Float  |->_)
  **  ((&(( &( "vacc" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # Float  |-> (fp32_add ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
.

Definition test_neon_partial_solve_wit_43_pure := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (k: Z)  __default_fp32 (PreH1 : (batch <> 0)) (PreH2 : (batch < (4 * sizeof(FLOAT) ))) (PreH3 : ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH4 : ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH5 : (0 <= k)) (PreH6 : (((k * 4 ) + batch ) = batch_pre)) (PreH7 : ((batch % ( 4 ) ) = 0)) (PreH8 : (0 <= batch)) (PreH9 : (batch <= batch_pre)) (PreH10 : (k <= (batch_pre ÷ 4 ))) (PreH11 : (batch = 12)) (PreH12 : ((batch ÷ 4 ) = 3)) (PreH13 : (params_pre <> 0)) (PreH14 : (input_a = (input_a_pre + (k * sizeof(FLOAT))))) (PreH15 : (input_b = (input_b_pre + (k * sizeof(FLOAT))))) (PreH16 : (output = (output_pre + (k * sizeof(FLOAT))))) (PreH17 : (input_a <> 0)) (PreH18 : (input_b <> 0)) (PreH19 : (output <> 0)) (PreH20 : ((Z.land batch (2 * sizeof(FLOAT) )) <> 0)) (PreH21 : ((Z.land batch (1 * sizeof(FLOAT) )) <> 0)) ,
  ((&(( &( "vacc_lo" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc_lo" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((output + (0 * sizeof(FLOAT)))) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((output + (1 * sizeof(FLOAT)))) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (FloatArray.undef_seg output 2 (batch ÷ 4 ) )
  **  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  ((( &( "batch" ) )) # UInt64  |-> batch)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "input_a" ) )) # Ptr  |-> input_a)
  **  ((( &( "input_b" ) )) # Ptr  |-> input_b)
  **  ((( &( "output" ) )) # Ptr  |-> (output + (2 * sizeof(FLOAT))))
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((output + (0 * sizeof(FLOAT)))) # Float  |->_)
  **  (((output + (1 * sizeof(FLOAT)))) # Float  |->_)
  **  ((&(( &( "vacc" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # Float  |-> (fp32_add ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
|--
  “ (0 = 0) ”
.

Definition test_neon_partial_solve_wit_43_aux := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (k: Z)  __default_fp32 (PreH1 : (batch <> 0)) (PreH2 : (batch < (4 * sizeof(FLOAT) ))) (PreH3 : ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH4 : ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH5 : (0 <= k)) (PreH6 : (((k * 4 ) + batch ) = batch_pre)) (PreH7 : ((batch % ( 4 ) ) = 0)) (PreH8 : (0 <= batch)) (PreH9 : (batch <= batch_pre)) (PreH10 : (k <= (batch_pre ÷ 4 ))) (PreH11 : (batch = 12)) (PreH12 : ((batch ÷ 4 ) = 3)) (PreH13 : (params_pre <> 0)) (PreH14 : (input_a = (input_a_pre + (k * sizeof(FLOAT))))) (PreH15 : (input_b = (input_b_pre + (k * sizeof(FLOAT))))) (PreH16 : (output = (output_pre + (k * sizeof(FLOAT))))) (PreH17 : (input_a <> 0)) (PreH18 : (input_b <> 0)) (PreH19 : (output <> 0)) (PreH20 : ((Z.land batch (2 * sizeof(FLOAT) )) <> 0)) (PreH21 : ((Z.land batch (1 * sizeof(FLOAT) )) <> 0)) ,
  ((&(( &( "vacc_lo" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc_lo" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((output + (0 * sizeof(FLOAT)))) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((output + (1 * sizeof(FLOAT)))) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (FloatArray.undef_seg output 2 (batch ÷ 4 ) )
  **  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((output + (0 * sizeof(FLOAT)))) # Float  |->_)
  **  (((output + (1 * sizeof(FLOAT)))) # Float  |->_)
  **  ((&(( &( "vacc" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # Float  |-> (fp32_add ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
|--
  “ (0 = 0) ” 
  &&  “ (batch <> 0) ” 
  &&  “ (batch < (4 * sizeof(FLOAT) )) ” 
  &&  “ ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ (0 <= k) ” 
  &&  “ (((k * 4 ) + batch ) = batch_pre) ” 
  &&  “ ((batch % ( 4 ) ) = 0) ” 
  &&  “ (0 <= batch) ” 
  &&  “ (batch <= batch_pre) ” 
  &&  “ (k <= (batch_pre ÷ 4 )) ” 
  &&  “ (batch = 12) ” 
  &&  “ ((batch ÷ 4 ) = 3) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (input_a = (input_a_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (input_b = (input_b_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (input_a <> 0) ” 
  &&  “ (input_b <> 0) ” 
  &&  “ (output <> 0) ” 
  &&  “ ((Z.land batch (2 * sizeof(FLOAT) )) <> 0) ” 
  &&  “ ((Z.land batch (1 * sizeof(FLOAT) )) <> 0) ”
  &&  ((&(( &( "vacc_lo" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc_lo" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((output + (2 * sizeof(FLOAT)))) # Float  |->_)
  **  (FloatArray.undef_seg output (2 + 1 ) (batch ÷ 4 ) )
  **  (((output + (0 * sizeof(FLOAT)))) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((output + (1 * sizeof(FLOAT)))) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((output + (0 * sizeof(FLOAT)))) # Float  |->_)
  **  (((output + (1 * sizeof(FLOAT)))) # Float  |->_)
  **  ((&(( &( "vacc" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # Float  |-> (fp32_add ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
.

Definition test_neon_partial_solve_wit_43 := test_neon_partial_solve_wit_43_pure -> test_neon_partial_solve_wit_43_aux.

Definition test_neon_partial_solve_wit_44_pure := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (k: Z)  __default_fp32 (PreH1 : (batch <> 0)) (PreH2 : (batch < (4 * sizeof(FLOAT) ))) (PreH3 : ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH4 : ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH5 : (0 <= k)) (PreH6 : (((k * 4 ) + batch ) = batch_pre)) (PreH7 : ((batch % ( 4 ) ) = 0)) (PreH8 : (0 <= batch)) (PreH9 : (batch <= batch_pre)) (PreH10 : (k <= (batch_pre ÷ 4 ))) (PreH11 : (batch = 4)) (PreH12 : ((batch ÷ 4 ) = 1)) (PreH13 : (params_pre <> 0)) (PreH14 : (input_a = (input_a_pre + (k * sizeof(FLOAT))))) (PreH15 : (input_b = (input_b_pre + (k * sizeof(FLOAT))))) (PreH16 : (output = (output_pre + (k * sizeof(FLOAT))))) (PreH17 : (input_a <> 0)) (PreH18 : (input_b <> 0)) (PreH19 : (output <> 0)) (PreH20 : ((Z.land batch (2 * sizeof(FLOAT) )) = 0)) (PreH21 : ((Z.land batch (1 * sizeof(FLOAT) )) <> 0)) ,
  ((&(( &( "vacc_lo" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc_lo" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  ((( &( "batch" ) )) # UInt64  |-> batch)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "input_a" ) )) # Ptr  |-> input_a)
  **  ((( &( "input_b" ) )) # Ptr  |-> input_b)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vacc" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # Float  |-> (fp32_add ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
|--
  “ (0 = 0) ”
.

Definition test_neon_partial_solve_wit_44_aux := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (output: Z) (input_b: Z) (input_a: Z) (batch: Z) (k: Z)  __default_fp32 (PreH1 : (batch <> 0)) (PreH2 : (batch < (4 * sizeof(FLOAT) ))) (PreH3 : ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH4 : ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH5 : (0 <= k)) (PreH6 : (((k * 4 ) + batch ) = batch_pre)) (PreH7 : ((batch % ( 4 ) ) = 0)) (PreH8 : (0 <= batch)) (PreH9 : (batch <= batch_pre)) (PreH10 : (k <= (batch_pre ÷ 4 ))) (PreH11 : (batch = 4)) (PreH12 : ((batch ÷ 4 ) = 1)) (PreH13 : (params_pre <> 0)) (PreH14 : (input_a = (input_a_pre + (k * sizeof(FLOAT))))) (PreH15 : (input_b = (input_b_pre + (k * sizeof(FLOAT))))) (PreH16 : (output = (output_pre + (k * sizeof(FLOAT))))) (PreH17 : (input_a <> 0)) (PreH18 : (input_b <> 0)) (PreH19 : (output <> 0)) (PreH20 : ((Z.land batch (2 * sizeof(FLOAT) )) = 0)) (PreH21 : ((Z.land batch (1 * sizeof(FLOAT) )) <> 0)) ,
  ((&(( &( "vacc_lo" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc_lo" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  (FloatArray.undef_full output (batch ÷ 4 ) )
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vacc" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # Float  |-> (fp32_add ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
|--
  “ (0 = 0) ” 
  &&  “ (batch <> 0) ” 
  &&  “ (batch < (4 * sizeof(FLOAT) )) ” 
  &&  “ ((fp32_length (A)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ ((fp32_length (B)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ (0 <= k) ” 
  &&  “ (((k * 4 ) + batch ) = batch_pre) ” 
  &&  “ ((batch % ( 4 ) ) = 0) ” 
  &&  “ (0 <= batch) ” 
  &&  “ (batch <= batch_pre) ” 
  &&  “ (k <= (batch_pre ÷ 4 )) ” 
  &&  “ (batch = 4) ” 
  &&  “ ((batch ÷ 4 ) = 1) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (input_a = (input_a_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (input_b = (input_b_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (k * sizeof(FLOAT)))) ” 
  &&  “ (input_a <> 0) ” 
  &&  “ (input_b <> 0) ” 
  &&  “ (output <> 0) ” 
  &&  “ ((Z.land batch (2 * sizeof(FLOAT) )) = 0) ” 
  &&  “ ((Z.land batch (1 * sizeof(FLOAT) )) <> 0) ”
  &&  ((&(( &( "vacc_lo" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc_lo" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((output) # Float  |->_)
  **  (FloatArray.undef_seg output 1 (batch ÷ 4 ) )
  **  (((input_b + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (((input_b + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  (FloatArray.seg input_b 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)))) )
  **  (((input_a + (0 * sizeof(FLOAT)))) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (1 * sizeof(FLOAT)))) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (2 * sizeof(FLOAT)))) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (((input_a + (3 * sizeof(FLOAT)))) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  (FloatArray.seg input_a 4 ((batch ÷ 4 ) + 3 ) (fp32_slice (4) (((batch ÷ 4 ) + 3 )) ((fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)))) )
  **  (FloatArray.full input_a_pre k (fp32_slice (0) (k) (A)) )
  **  (FloatArray.full input_b_pre k (fp32_slice (0) (k) (B)) )
  **  (FloatArray.full output_pre k (vadd_values (k) (A) (B)) )
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s0")) # Float  |-> (Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s1")) # Float  |-> (Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s2")) # Float  |-> (Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vb" ) )->ₛ "s3")) # Float  |-> (Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))
  **  ((&(( &( "vacc" ) )->ₛ "s0")) # Float  |-> (fp32_add ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 0 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # Float  |-> (fp32_add ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 1 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # Float  |-> (fp32_add ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 2 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # Float  |-> (fp32_add ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (A)) __default_fp32)) ((Znth 3 (fp32_slice (k) (((batch_pre ÷ 4 ) + 3 )) (B)) __default_fp32))))
.

Definition test_neon_partial_solve_wit_44 := test_neon_partial_solve_wit_44_pure -> test_neon_partial_solve_wit_44_aux.

Module Type VC_Correct.

Include neon_bridge_Strategy_Correct.
Include neon_tail_Strategy_Correct.
Include float_array_Strategy_Correct.

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
Axiom proof_of_test_neon_entail_wit_1 : test_neon_entail_wit_1.
Axiom proof_of_test_neon_entail_wit_2 : test_neon_entail_wit_2.
Axiom proof_of_test_neon_entail_wit_3_1 : test_neon_entail_wit_3_1.
Axiom proof_of_test_neon_entail_wit_3_2 : test_neon_entail_wit_3_2.
Axiom proof_of_test_neon_entail_wit_3_3 : test_neon_entail_wit_3_3.
Axiom proof_of_test_neon_entail_wit_4_1 : test_neon_entail_wit_4_1.
Axiom proof_of_test_neon_entail_wit_4_2 : test_neon_entail_wit_4_2.
Axiom proof_of_test_neon_entail_wit_4_3 : test_neon_entail_wit_4_3.
Axiom proof_of_test_neon_entail_wit_5_1 : test_neon_entail_wit_5_1.
Axiom proof_of_test_neon_entail_wit_5_2 : test_neon_entail_wit_5_2.
Axiom proof_of_test_neon_entail_wit_5_3 : test_neon_entail_wit_5_3.
Axiom proof_of_test_neon_entail_wit_6_1 : test_neon_entail_wit_6_1.
Axiom proof_of_test_neon_entail_wit_6_2 : test_neon_entail_wit_6_2.
Axiom proof_of_test_neon_entail_wit_6_3 : test_neon_entail_wit_6_3.
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
Axiom proof_of_test_neon_partial_solve_wit_6 : test_neon_partial_solve_wit_6.
Axiom proof_of_test_neon_partial_solve_wit_7 : test_neon_partial_solve_wit_7.
Axiom proof_of_test_neon_partial_solve_wit_8 : test_neon_partial_solve_wit_8.
Axiom proof_of_test_neon_partial_solve_wit_9 : test_neon_partial_solve_wit_9.
Axiom proof_of_test_neon_partial_solve_wit_10 : test_neon_partial_solve_wit_10.
Axiom proof_of_test_neon_partial_solve_wit_11 : test_neon_partial_solve_wit_11.
Axiom proof_of_test_neon_partial_solve_wit_12 : test_neon_partial_solve_wit_12.
Axiom proof_of_test_neon_partial_solve_wit_13 : test_neon_partial_solve_wit_13.
Axiom proof_of_test_neon_partial_solve_wit_14 : test_neon_partial_solve_wit_14.
Axiom proof_of_test_neon_partial_solve_wit_15 : test_neon_partial_solve_wit_15.
Axiom proof_of_test_neon_partial_solve_wit_16 : test_neon_partial_solve_wit_16.
Axiom proof_of_test_neon_partial_solve_wit_17 : test_neon_partial_solve_wit_17.
Axiom proof_of_test_neon_partial_solve_wit_18 : test_neon_partial_solve_wit_18.
Axiom proof_of_test_neon_partial_solve_wit_19 : test_neon_partial_solve_wit_19.
Axiom proof_of_test_neon_partial_solve_wit_20 : test_neon_partial_solve_wit_20.
Axiom proof_of_test_neon_partial_solve_wit_21 : test_neon_partial_solve_wit_21.
Axiom proof_of_test_neon_partial_solve_wit_22 : test_neon_partial_solve_wit_22.
Axiom proof_of_test_neon_partial_solve_wit_23 : test_neon_partial_solve_wit_23.
Axiom proof_of_test_neon_partial_solve_wit_24 : test_neon_partial_solve_wit_24.
Axiom proof_of_test_neon_partial_solve_wit_25 : test_neon_partial_solve_wit_25.
Axiom proof_of_test_neon_partial_solve_wit_26 : test_neon_partial_solve_wit_26.
Axiom proof_of_test_neon_partial_solve_wit_27 : test_neon_partial_solve_wit_27.
Axiom proof_of_test_neon_partial_solve_wit_28 : test_neon_partial_solve_wit_28.
Axiom proof_of_test_neon_partial_solve_wit_29 : test_neon_partial_solve_wit_29.
Axiom proof_of_test_neon_partial_solve_wit_30 : test_neon_partial_solve_wit_30.
Axiom proof_of_test_neon_partial_solve_wit_31 : test_neon_partial_solve_wit_31.
Axiom proof_of_test_neon_partial_solve_wit_32 : test_neon_partial_solve_wit_32.
Axiom proof_of_test_neon_partial_solve_wit_33 : test_neon_partial_solve_wit_33.
Axiom proof_of_test_neon_partial_solve_wit_34 : test_neon_partial_solve_wit_34.
Axiom proof_of_test_neon_partial_solve_wit_35 : test_neon_partial_solve_wit_35.
Axiom proof_of_test_neon_partial_solve_wit_36 : test_neon_partial_solve_wit_36.
Axiom proof_of_test_neon_partial_solve_wit_37 : test_neon_partial_solve_wit_37.
Axiom proof_of_test_neon_partial_solve_wit_38 : test_neon_partial_solve_wit_38.
Axiom proof_of_test_neon_partial_solve_wit_39 : test_neon_partial_solve_wit_39.
Axiom proof_of_test_neon_partial_solve_wit_40 : test_neon_partial_solve_wit_40.
Axiom proof_of_test_neon_partial_solve_wit_41 : test_neon_partial_solve_wit_41.
Axiom proof_of_test_neon_partial_solve_wit_42 : test_neon_partial_solve_wit_42.
Axiom proof_of_test_neon_partial_solve_wit_43_pure : test_neon_partial_solve_wit_43_pure.
Axiom proof_of_test_neon_partial_solve_wit_43 : test_neon_partial_solve_wit_43.
Axiom proof_of_test_neon_partial_solve_wit_44_pure : test_neon_partial_solve_wit_44_pure.
Axiom proof_of_test_neon_partial_solve_wit_44 : test_neon_partial_solve_wit_44.

End VC_Correct.
