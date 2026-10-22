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
Require Import QcpVadd.VaddBits.
Require Import QcpRvv32.RvvLogic.
Require Import QcpRvv32.RvvStoreModel.
Require Import QcpRvv32.RvvLayout.
Require Import ByvalueRvv.Layout.
Require Import QcpRvv32.RvvLoopModel.
Local Open Scope sac.
From QcpRvv32 Require Import rvv_arrays_strategy_goal.
From QcpRvv32 Require Import rvv_arrays_strategy_proof.
From QcpRvv32 Require Import rvv_store_strategy_goal.
From QcpRvv32 Require Import rvv_store_strategy_proof.
From QcpRvv32 Require Import rvv_loop_strategy_goal.
From QcpRvv32 Require Import rvv_loop_strategy_proof.

(*----- Function qcp_assert -----*)

Definition qcp_assert_return_wit_1 := 
forall (condition_pre: Z) (PreH1 : (condition_pre <> 0)) ,
  TT && emp 
|--
  TT && emp 
.

(*----- Function __riscv_vsetvl_e32m8 -----*)

Definition __riscv_vsetvl_e32m8_safety_wit_1 := 
forall (n_pre: Z) ,
  ((( &( "n" ) )) # UInt64  |-> n_pre)
|--
  “ (32 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 32) ”
.

Definition __riscv_vsetvl_e32m8_safety_wit_2 := 
forall (n_pre: Z) (PreH1 : (n_pre >= 32)) ,
  ((( &( "n" ) )) # UInt64  |-> n_pre)
|--
  “ (32 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 32) ”
.

Definition __riscv_vsetvl_e32m8_return_wit_1 := 
(
forall (n_pre: Z) (PreH1 : (n_pre < 32)) ,
  TT && emp 
|--
  “ (n_pre = (vadd_vl (n_pre))) ”
  &&  emp
) \/
(
forall (n_pre: Z) (PreH1 : (n_pre < 32)) ,
  TT && emp 
|--
  “ (n_pre = (vadd_vl (n_pre))) ”
  &&  emp
).

Definition __riscv_vsetvl_e32m8_return_wit_1_split_goal_1 := 
forall (n_pre: Z) (PreH1 : (n_pre < 32)) ,
  (n_pre = (vadd_vl (n_pre)))
.

Definition __riscv_vsetvl_e32m8_return_wit_2 := 
(
forall (n_pre: Z) (PreH1 : (n_pre >= 32)) ,
  TT && emp 
|--
  “ (32 = (vadd_vl (n_pre))) ”
  &&  emp
) \/
(
forall (n_pre: Z) (PreH1 : (n_pre >= 32)) ,
  TT && emp 
|--
  “ (32 = (vadd_vl (n_pre))) ”
  &&  emp
).

Definition __riscv_vsetvl_e32m8_return_wit_2_split_goal_1 := 
forall (n_pre: Z) (PreH1 : (n_pre >= 32)) ,
  (32 = (vadd_vl (n_pre)))
.

(*----- Function test_rvv -----*)

Definition test_rvv_safety_wit_1 := 
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

Definition test_rvv_safety_wit_2 := 
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

Definition test_rvv_safety_wit_3 := 
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

Definition test_rvv_safety_wit_4 := 
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

Definition test_rvv_safety_wit_5 := 
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

Definition test_rvv_safety_wit_6 := 
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

Definition test_rvv_safety_wit_7 := 
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

Definition test_rvv_safety_wit_8 := 
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

Definition test_rvv_safety_wit_9 := 
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

Definition test_rvv_safety_wit_10 := 
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

Definition test_rvv_safety_wit_11 := 
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

Definition test_rvv_safety_wit_12 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (PreH1 : (output_pre <> 0)) (PreH2 : (input_b_pre <> 0)) (PreH3 : (input_a_pre <> 0)) (PreH4 : ((batch_pre % ( sizeof(FLOAT) ) ) = 0)) (PreH5 : (batch_pre <> 0)) (PreH6 : (0 < batch_pre)) (PreH7 : (batch_pre <= 18446744073709551603)) (PreH8 : ((batch_pre % ( 4 ) ) = 0)) (PreH9 : (params_pre <> 0)) (PreH10 : (input_a_pre <> 0)) (PreH11 : (input_b_pre <> 0)) (PreH12 : (output_pre <> 0)) ,
  ((( &( "n" ) )) # UInt64  |->_)
  **  ((( &( "batch" ) )) # UInt64  |-> batch_pre)
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

Definition test_rvv_safety_wit_13 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (n: Z) (output: Z) (input_b: Z) (input_a: Z) (n_2: Z) (PreH1 : (0 < (batch_pre ÷ 4 ))) (PreH2 : ((batch_pre ÷ 4 ) <= 4611686018427387900)) (PreH3 : (0 <= n_2)) (PreH4 : (n_2 <= (batch_pre ÷ 4 ))) (PreH5 : ((rvv_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH6 : ((rvv_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH7 : (input_a = (input_a_pre + (((batch_pre ÷ 4 ) - n_2 ) * sizeof(FLOAT))))) (PreH8 : (input_b = (input_b_pre + (((batch_pre ÷ 4 ) - n_2 ) * sizeof(FLOAT))))) (PreH9 : (output = (output_pre + (((batch_pre ÷ 4 ) - n_2 ) * sizeof(FLOAT))))) (PreH10 : (0 < (batch_pre ÷ 4 ))) (PreH11 : ((batch_pre ÷ 4 ) <= 4611686018427387900)) (PreH12 : (n = (batch_pre ÷ 4 ))) (PreH13 : ((rvv_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH14 : ((rvv_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) ,
  ((( &( "batch" ) )) # UInt64  |-> batch_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "n" ) )) # UInt64  |-> n_2)
  **  ((( &( "input_a" ) )) # Ptr  |-> input_a)
  **  ((( &( "input_b" ) )) # Ptr  |-> input_b)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  (FloatArray.full input_a_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.full input_b_pre ((batch_pre ÷ 4 ) + 3 ) B )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - n_2 ) (vadd_values (((batch_pre ÷ 4 ) - n_2 )) (A) (B)) )
  **  (FloatArray.undef_seg output_pre ((batch_pre ÷ 4 ) - n_2 ) (batch_pre ÷ 4 ) )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition test_rvv_entail_wit_1 := 
(
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (PreH1 : (output_pre <> 0)) (PreH2 : (input_b_pre <> 0)) (PreH3 : (input_a_pre <> 0)) (PreH4 : ((batch_pre % ( sizeof(FLOAT) ) ) = 0)) (PreH5 : (batch_pre <> 0)) (PreH6 : (0 < batch_pre)) (PreH7 : (batch_pre <= 18446744073709551603)) (PreH8 : ((batch_pre % ( 4 ) ) = 0)) (PreH9 : (params_pre <> 0)) (PreH10 : (input_a_pre <> 0)) (PreH11 : (input_b_pre <> 0)) (PreH12 : (output_pre <> 0)) ,
  (FloatArray.full input_a_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.full input_b_pre ((batch_pre ÷ 4 ) + 3 ) B )
  **  (FloatArray.undef_full output_pre (batch_pre ÷ 4 ) )
|--
  “ (0 < (batch_pre ÷ 4 )) ” 
  &&  “ ((batch_pre ÷ 4 ) <= 4611686018427387900) ” 
  &&  “ ((batch_pre ÷ sizeof(FLOAT) ) = (batch_pre ÷ 4 )) ” 
  &&  “ ((rvv_length (A)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ ((rvv_length (B)) = ((batch_pre ÷ 4 ) + 3 )) ”
  &&  (FloatArray.full input_a_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.full input_b_pre ((batch_pre ÷ 4 ) + 3 ) B )
  **  (FloatArray.undef_full output_pre (batch_pre ÷ 4 ) )
) \/
(
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (PreH1 : (output_pre <> 0)) (PreH2 : (input_b_pre <> 0)) (PreH3 : (input_a_pre <> 0)) (PreH4 : ((batch_pre % ( sizeof(FLOAT) ) ) = 0)) (PreH5 : (batch_pre <> 0)) (PreH6 : (0 < batch_pre)) (PreH7 : (batch_pre <= 18446744073709551603)) (PreH8 : ((batch_pre % ( 4 ) ) = 0)) (PreH9 : (params_pre <> 0)) (PreH10 : (input_a_pre <> 0)) (PreH11 : (input_b_pre <> 0)) (PreH12 : (output_pre <> 0)) ,
  TT && emp 
|--
  “ ((rvv_length (B)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ ((rvv_length (A)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ ((batch_pre ÷ 4 ) <= 4611686018427387900) ” 
  &&  “ (0 < (batch_pre ÷ 4 )) ”
  &&  emp
).

Definition test_rvv_entail_wit_1_split_goal_1 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (PreH1 : (output_pre <> 0)) (PreH2 : (input_b_pre <> 0)) (PreH3 : (input_a_pre <> 0)) (PreH4 : ((batch_pre % ( sizeof(FLOAT) ) ) = 0)) (PreH5 : (batch_pre <> 0)) (PreH6 : (0 < batch_pre)) (PreH7 : (batch_pre <= 18446744073709551603)) (PreH8 : ((batch_pre % ( 4 ) ) = 0)) (PreH9 : (params_pre <> 0)) (PreH10 : (input_a_pre <> 0)) (PreH11 : (input_b_pre <> 0)) (PreH12 : (output_pre <> 0)) ,
  ((rvv_length (B)) = ((batch_pre ÷ 4 ) + 3 ))
.

Definition test_rvv_entail_wit_1_split_goal_2 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (A: (@list fp32)) (PreH1 : (output_pre <> 0)) (PreH2 : (input_b_pre <> 0)) (PreH3 : (input_a_pre <> 0)) (PreH4 : ((batch_pre % ( sizeof(FLOAT) ) ) = 0)) (PreH5 : (batch_pre <> 0)) (PreH6 : (0 < batch_pre)) (PreH7 : (batch_pre <= 18446744073709551603)) (PreH8 : ((batch_pre % ( 4 ) ) = 0)) (PreH9 : (params_pre <> 0)) (PreH10 : (input_a_pre <> 0)) (PreH11 : (input_b_pre <> 0)) (PreH12 : (output_pre <> 0)) ,
  ((rvv_length (A)) = ((batch_pre ÷ 4 ) + 3 ))
.

Definition test_rvv_entail_wit_1_split_goal_3 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (PreH1 : (output_pre <> 0)) (PreH2 : (input_b_pre <> 0)) (PreH3 : (input_a_pre <> 0)) (PreH4 : ((batch_pre % ( sizeof(FLOAT) ) ) = 0)) (PreH5 : (batch_pre <> 0)) (PreH6 : (0 < batch_pre)) (PreH7 : (batch_pre <= 18446744073709551603)) (PreH8 : ((batch_pre % ( 4 ) ) = 0)) (PreH9 : (params_pre <> 0)) (PreH10 : (input_a_pre <> 0)) (PreH11 : (input_b_pre <> 0)) (PreH12 : (output_pre <> 0)) ,
  ((batch_pre ÷ 4 ) <= 4611686018427387900)
.

Definition test_rvv_entail_wit_1_split_goal_4 := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (PreH1 : (output_pre <> 0)) (PreH2 : (input_b_pre <> 0)) (PreH3 : (input_a_pre <> 0)) (PreH4 : ((batch_pre % ( sizeof(FLOAT) ) ) = 0)) (PreH5 : (batch_pre <> 0)) (PreH6 : (0 < batch_pre)) (PreH7 : (batch_pre <= 18446744073709551603)) (PreH8 : ((batch_pre % ( 4 ) ) = 0)) (PreH9 : (params_pre <> 0)) (PreH10 : (input_a_pre <> 0)) (PreH11 : (input_b_pre <> 0)) (PreH12 : (output_pre <> 0)) ,
  (0 < (batch_pre ÷ 4 ))
.

Definition test_rvv_entail_wit_2 := 
forall (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (n: Z) (PreH1 : (0 < (batch_pre ÷ 4 ))) (PreH2 : ((batch_pre ÷ 4 ) <= 4611686018427387900)) (PreH3 : (n = (batch_pre ÷ 4 ))) (PreH4 : ((rvv_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH5 : ((rvv_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) ,
  (FloatArray.full input_a_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.full input_b_pre ((batch_pre ÷ 4 ) + 3 ) B )
  **  (FloatArray.undef_full output_pre (batch_pre ÷ 4 ) )
|--
  “ (0 < (batch_pre ÷ 4 )) ” 
  &&  “ ((batch_pre ÷ 4 ) <= 4611686018427387900) ” 
  &&  “ (0 <= n) ” 
  &&  “ (n <= (batch_pre ÷ 4 )) ” 
  &&  “ ((rvv_length (A)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ ((rvv_length (B)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ (input_a_pre = (input_a_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT)))) ” 
  &&  “ (input_b_pre = (input_b_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT)))) ” 
  &&  “ (output_pre = (output_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT)))) ” 
  &&  “ (0 < (batch_pre ÷ 4 )) ” 
  &&  “ ((batch_pre ÷ 4 ) <= 4611686018427387900) ” 
  &&  “ (n = (batch_pre ÷ 4 )) ” 
  &&  “ ((rvv_length (A)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ ((rvv_length (B)) = ((batch_pre ÷ 4 ) + 3 )) ”
  &&  (FloatArray.full input_a_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.full input_b_pre ((batch_pre ÷ 4 ) + 3 ) B )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - n ) (vadd_values (((batch_pre ÷ 4 ) - n )) (A) (B)) )
  **  (FloatArray.undef_seg output_pre ((batch_pre ÷ 4 ) - n ) (batch_pre ÷ 4 ) )
.

Definition test_rvv_entail_wit_3 := 
(
forall (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (n_2: Z) (output: Z) (input_b: Z) (input_a: Z) (n: Z) (retval: Z) (PreH1 : (retval = (vadd_vl (n)))) (PreH2 : (n > 0)) (PreH3 : (0 < (batch_pre ÷ 4 ))) (PreH4 : ((batch_pre ÷ 4 ) <= 4611686018427387900)) (PreH5 : (0 <= n)) (PreH6 : (n <= (batch_pre ÷ 4 ))) (PreH7 : ((rvv_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH8 : ((rvv_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH9 : (input_a = (input_a_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) (PreH10 : (input_b = (input_b_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) (PreH11 : (output = (output_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) (PreH12 : (0 < (batch_pre ÷ 4 ))) (PreH13 : ((batch_pre ÷ 4 ) <= 4611686018427387900)) (PreH14 : (n_2 = (batch_pre ÷ 4 ))) (PreH15 : ((rvv_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH16 : ((rvv_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) ,
  (FloatArray.full input_a_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.full input_b_pre ((batch_pre ÷ 4 ) + 3 ) B )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - n ) (vadd_values (((batch_pre ÷ 4 ) - n )) (A) (B)) )
  **  (FloatArray.undef_seg output_pre ((batch_pre ÷ 4 ) - n ) (batch_pre ÷ 4 ) )
|--
  “ (0 < (batch_pre ÷ 4 )) ” 
  &&  “ ((batch_pre ÷ 4 ) <= 4611686018427387900) ” 
  &&  “ (0 <= n) ” 
  &&  “ (n <= (batch_pre ÷ 4 )) ” 
  &&  “ ((rvv_length (A)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ ((rvv_length (B)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ (input_a = (input_a_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT)))) ” 
  &&  “ (input_b = (input_b_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT)))) ” 
  &&  “ (0 < n) ” 
  &&  “ (0 < retval) ” 
  &&  “ (retval <= 32) ” 
  &&  “ (retval <= n) ” 
  &&  “ (retval = (vadd_vl (n))) ”
  &&  (FloatArray.seg input_a_pre 0 ((batch_pre ÷ 4 ) - n ) (rvv_slice (0) (((batch_pre ÷ 4 ) - n )) (A)) )
  **  (FloatArray.full input_a retval (rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + retval )) (A)) )
  **  (FloatArray.seg input_a_pre (((batch_pre ÷ 4 ) - n ) + retval ) ((batch_pre ÷ 4 ) + 3 ) (rvv_slice ((((batch_pre ÷ 4 ) - n ) + retval )) (((batch_pre ÷ 4 ) + 3 )) (A)) )
  **  (FloatArray.seg input_b_pre 0 ((batch_pre ÷ 4 ) - n ) (rvv_slice (0) (((batch_pre ÷ 4 ) - n )) (B)) )
  **  (FloatArray.full input_b retval (rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + retval )) (B)) )
  **  (FloatArray.seg input_b_pre (((batch_pre ÷ 4 ) - n ) + retval ) ((batch_pre ÷ 4 ) + 3 ) (rvv_slice ((((batch_pre ÷ 4 ) - n ) + retval )) (((batch_pre ÷ 4 ) + 3 )) (B)) )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - n ) (vadd_values (((batch_pre ÷ 4 ) - n )) (A) (B)) )
  **  (FloatArray.undef_full output retval )
  **  (FloatArray.undef_seg output_pre (((batch_pre ÷ 4 ) - n ) + retval ) (batch_pre ÷ 4 ) )
) \/
(
forall (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (n_2: Z) (output: Z) (input_b: Z) (input_a: Z) (n: Z) (retval: Z) (PreH1 : (retval = (vadd_vl (n)))) (PreH2 : (n > 0)) (PreH3 : (0 < (batch_pre ÷ 4 ))) (PreH4 : ((batch_pre ÷ 4 ) <= 4611686018427387900)) (PreH5 : (0 <= n)) (PreH6 : (n <= (batch_pre ÷ 4 ))) (PreH7 : ((rvv_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH8 : ((rvv_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH9 : (input_a = (input_a_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) (PreH10 : (input_b = (input_b_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) (PreH11 : (output = (output_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) (PreH12 : (0 < (batch_pre ÷ 4 ))) (PreH13 : ((batch_pre ÷ 4 ) <= 4611686018427387900)) (PreH14 : (n_2 = (batch_pre ÷ 4 ))) (PreH15 : ((rvv_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH16 : ((rvv_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) ,
  (FloatArray.full input_a_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.full input_b_pre ((batch_pre ÷ 4 ) + 3 ) B )
  **  (FloatArray.undef_seg output_pre ((batch_pre ÷ 4 ) - n ) (batch_pre ÷ 4 ) )
|--
  “ (retval <= n) ” 
  &&  “ (retval <= 32) ” 
  &&  “ (0 < retval) ”
  &&  (FloatArray.seg input_a_pre 0 ((batch_pre ÷ 4 ) - n ) (rvv_slice (0) (((batch_pre ÷ 4 ) - n )) (A)) )
  **  (FloatArray.full input_a retval (rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + retval )) (A)) )
  **  (FloatArray.seg input_a_pre (((batch_pre ÷ 4 ) - n ) + retval ) ((batch_pre ÷ 4 ) + 3 ) (rvv_slice ((((batch_pre ÷ 4 ) - n ) + retval )) (((batch_pre ÷ 4 ) + 3 )) (A)) )
  **  (FloatArray.seg input_b_pre 0 ((batch_pre ÷ 4 ) - n ) (rvv_slice (0) (((batch_pre ÷ 4 ) - n )) (B)) )
  **  (FloatArray.full input_b retval (rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + retval )) (B)) )
  **  (FloatArray.seg input_b_pre (((batch_pre ÷ 4 ) - n ) + retval ) ((batch_pre ÷ 4 ) + 3 ) (rvv_slice ((((batch_pre ÷ 4 ) - n ) + retval )) (((batch_pre ÷ 4 ) + 3 )) (B)) )
  **  (FloatArray.undef_full output retval )
  **  (FloatArray.undef_seg output_pre (((batch_pre ÷ 4 ) - n ) + retval ) (batch_pre ÷ 4 ) )
).

Definition test_rvv_entail_wit_3_split_goal_1 := 
forall (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (n_2: Z) (output: Z) (input_b: Z) (input_a: Z) (n: Z) (retval: Z) (PreH1 : (retval = (vadd_vl (n)))) (PreH2 : (n > 0)) (PreH3 : (0 < (batch_pre ÷ 4 ))) (PreH4 : ((batch_pre ÷ 4 ) <= 4611686018427387900)) (PreH5 : (0 <= n)) (PreH6 : (n <= (batch_pre ÷ 4 ))) (PreH7 : ((rvv_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH8 : ((rvv_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH9 : (input_a = (input_a_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) (PreH10 : (input_b = (input_b_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) (PreH11 : (output = (output_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) (PreH12 : (0 < (batch_pre ÷ 4 ))) (PreH13 : ((batch_pre ÷ 4 ) <= 4611686018427387900)) (PreH14 : (n_2 = (batch_pre ÷ 4 ))) (PreH15 : ((rvv_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH16 : ((rvv_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) ,
  (FloatArray.full input_a_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.full input_b_pre ((batch_pre ÷ 4 ) + 3 ) B )
  **  (FloatArray.undef_seg output_pre ((batch_pre ÷ 4 ) - n ) (batch_pre ÷ 4 ) )
|--
  “ (retval <= n) ”
.

Definition test_rvv_entail_wit_3_split_goal_2 := 
forall (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (n_2: Z) (output: Z) (input_b: Z) (input_a: Z) (n: Z) (retval: Z) (PreH1 : (retval = (vadd_vl (n)))) (PreH2 : (n > 0)) (PreH3 : (0 < (batch_pre ÷ 4 ))) (PreH4 : ((batch_pre ÷ 4 ) <= 4611686018427387900)) (PreH5 : (0 <= n)) (PreH6 : (n <= (batch_pre ÷ 4 ))) (PreH7 : ((rvv_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH8 : ((rvv_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH9 : (input_a = (input_a_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) (PreH10 : (input_b = (input_b_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) (PreH11 : (output = (output_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) (PreH12 : (0 < (batch_pre ÷ 4 ))) (PreH13 : ((batch_pre ÷ 4 ) <= 4611686018427387900)) (PreH14 : (n_2 = (batch_pre ÷ 4 ))) (PreH15 : ((rvv_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH16 : ((rvv_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) ,
  (FloatArray.full input_a_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.full input_b_pre ((batch_pre ÷ 4 ) + 3 ) B )
  **  (FloatArray.undef_seg output_pre ((batch_pre ÷ 4 ) - n ) (batch_pre ÷ 4 ) )
|--
  “ (retval <= 32) ”
.

Definition test_rvv_entail_wit_3_split_goal_3 := 
forall (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (n_2: Z) (output: Z) (input_b: Z) (input_a: Z) (n: Z) (retval: Z) (PreH1 : (retval = (vadd_vl (n)))) (PreH2 : (n > 0)) (PreH3 : (0 < (batch_pre ÷ 4 ))) (PreH4 : ((batch_pre ÷ 4 ) <= 4611686018427387900)) (PreH5 : (0 <= n)) (PreH6 : (n <= (batch_pre ÷ 4 ))) (PreH7 : ((rvv_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH8 : ((rvv_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH9 : (input_a = (input_a_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) (PreH10 : (input_b = (input_b_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) (PreH11 : (output = (output_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) (PreH12 : (0 < (batch_pre ÷ 4 ))) (PreH13 : ((batch_pre ÷ 4 ) <= 4611686018427387900)) (PreH14 : (n_2 = (batch_pre ÷ 4 ))) (PreH15 : ((rvv_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH16 : ((rvv_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) ,
  (FloatArray.full input_a_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.full input_b_pre ((batch_pre ÷ 4 ) + 3 ) B )
  **  (FloatArray.undef_seg output_pre ((batch_pre ÷ 4 ) - n ) (batch_pre ÷ 4 ) )
|--
  “ (0 < retval) ”
.

Definition test_rvv_entail_wit_3_split_goal_spatial := 
forall (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (n_2: Z) (output: Z) (input_b: Z) (input_a: Z) (n: Z) (retval: Z) (PreH1 : (retval = (vadd_vl (n)))) (PreH2 : (n > 0)) (PreH3 : (0 < (batch_pre ÷ 4 ))) (PreH4 : ((batch_pre ÷ 4 ) <= 4611686018427387900)) (PreH5 : (0 <= n)) (PreH6 : (n <= (batch_pre ÷ 4 ))) (PreH7 : ((rvv_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH8 : ((rvv_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH9 : (input_a = (input_a_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) (PreH10 : (input_b = (input_b_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) (PreH11 : (output = (output_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) (PreH12 : (0 < (batch_pre ÷ 4 ))) (PreH13 : ((batch_pre ÷ 4 ) <= 4611686018427387900)) (PreH14 : (n_2 = (batch_pre ÷ 4 ))) (PreH15 : ((rvv_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH16 : ((rvv_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) ,
  (FloatArray.full input_a_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.full input_b_pre ((batch_pre ÷ 4 ) + 3 ) B )
  **  (FloatArray.undef_seg output_pre ((batch_pre ÷ 4 ) - n ) (batch_pre ÷ 4 ) )
|--
  (FloatArray.seg input_a_pre 0 ((batch_pre ÷ 4 ) - n ) (rvv_slice (0) (((batch_pre ÷ 4 ) - n )) (A)) )
  **  (FloatArray.full input_a retval (rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + retval )) (A)) )
  **  (FloatArray.seg input_a_pre (((batch_pre ÷ 4 ) - n ) + retval ) ((batch_pre ÷ 4 ) + 3 ) (rvv_slice ((((batch_pre ÷ 4 ) - n ) + retval )) (((batch_pre ÷ 4 ) + 3 )) (A)) )
  **  (FloatArray.seg input_b_pre 0 ((batch_pre ÷ 4 ) - n ) (rvv_slice (0) (((batch_pre ÷ 4 ) - n )) (B)) )
  **  (FloatArray.full input_b retval (rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + retval )) (B)) )
  **  (FloatArray.seg input_b_pre (((batch_pre ÷ 4 ) - n ) + retval ) ((batch_pre ÷ 4 ) + 3 ) (rvv_slice ((((batch_pre ÷ 4 ) - n ) + retval )) (((batch_pre ÷ 4 ) + 3 )) (B)) )
  **  (FloatArray.undef_full output retval )
  **  (FloatArray.undef_seg output_pre (((batch_pre ÷ 4 ) - n ) + retval ) (batch_pre ÷ 4 ) )
.

Definition test_rvv_entail_wit_4 := 
(
forall (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (n_2: Z) (input_a: Z) (input_b: Z) (output: Z) (vl: Z) (PreH1 : (0 < (batch_pre ÷ 4 ))) (PreH2 : ((batch_pre ÷ 4 ) <= 4611686018427387900)) (PreH3 : (0 <= n_2)) (PreH4 : (n_2 <= (batch_pre ÷ 4 ))) (PreH5 : ((rvv_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH6 : ((rvv_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH7 : (input_a = (input_a_pre + (((batch_pre ÷ 4 ) - n_2 ) * sizeof(FLOAT))))) (PreH8 : (input_b = (input_b_pre + (((batch_pre ÷ 4 ) - n_2 ) * sizeof(FLOAT))))) (PreH9 : (output = (output_pre + (((batch_pre ÷ 4 ) - n_2 ) * sizeof(FLOAT))))) (PreH10 : (0 < n_2)) (PreH11 : (0 < vl)) (PreH12 : (vl <= 32)) (PreH13 : (vl <= n_2)) (PreH14 : (vl = (vadd_vl (n_2)))) ,
  (FloatArray.full output vl (rvv_take (vl) ((rvv_pack32 ((vadd_active_add (0) (vl) ((rvv_read_value (0) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (0) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (1) (vl) ((rvv_read_value (1) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (1) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (2) (vl) ((rvv_read_value (2) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (2) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (3) (vl) ((rvv_read_value (3) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (3) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (4) (vl) ((rvv_read_value (4) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (4) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (5) (vl) ((rvv_read_value (5) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (5) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (6) (vl) ((rvv_read_value (6) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (6) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (7) (vl) ((rvv_read_value (7) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (7) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (8) (vl) ((rvv_read_value (8) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (8) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (9) (vl) ((rvv_read_value (9) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (9) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (10) (vl) ((rvv_read_value (10) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (10) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (11) (vl) ((rvv_read_value (11) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (11) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (12) (vl) ((rvv_read_value (12) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (12) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (13) (vl) ((rvv_read_value (13) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (13) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (14) (vl) ((rvv_read_value (14) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (14) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (15) (vl) ((rvv_read_value (15) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (15) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (16) (vl) ((rvv_read_value (16) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (16) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (17) (vl) ((rvv_read_value (17) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (17) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (18) (vl) ((rvv_read_value (18) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (18) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (19) (vl) ((rvv_read_value (19) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (19) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (20) (vl) ((rvv_read_value (20) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (20) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (21) (vl) ((rvv_read_value (21) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (21) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (22) (vl) ((rvv_read_value (22) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (22) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (23) (vl) ((rvv_read_value (23) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (23) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (24) (vl) ((rvv_read_value (24) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (24) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (25) (vl) ((rvv_read_value (25) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (25) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (26) (vl) ((rvv_read_value (26) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (26) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (27) (vl) ((rvv_read_value (27) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (27) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (28) (vl) ((rvv_read_value (28) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (28) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (29) (vl) ((rvv_read_value (29) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (29) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (30) (vl) ((rvv_read_value (30) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (30) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (31) (vl) ((rvv_read_value (31) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (31) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B)))))))))) )
  **  (FloatArray.full input_b vl (rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B)) )
  **  (FloatArray.full input_a vl (rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A)) )
  **  (FloatArray.seg input_a_pre 0 ((batch_pre ÷ 4 ) - n_2 ) (rvv_slice (0) (((batch_pre ÷ 4 ) - n_2 )) (A)) )
  **  (FloatArray.seg input_a_pre (((batch_pre ÷ 4 ) - n_2 ) + vl ) ((batch_pre ÷ 4 ) + 3 ) (rvv_slice ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (((batch_pre ÷ 4 ) + 3 )) (A)) )
  **  (FloatArray.seg input_b_pre 0 ((batch_pre ÷ 4 ) - n_2 ) (rvv_slice (0) (((batch_pre ÷ 4 ) - n_2 )) (B)) )
  **  (FloatArray.seg input_b_pre (((batch_pre ÷ 4 ) - n_2 ) + vl ) ((batch_pre ÷ 4 ) + 3 ) (rvv_slice ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (((batch_pre ÷ 4 ) + 3 )) (B)) )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - n_2 ) (vadd_values (((batch_pre ÷ 4 ) - n_2 )) (A) (B)) )
  **  (FloatArray.undef_seg output_pre (((batch_pre ÷ 4 ) - n_2 ) + vl ) (batch_pre ÷ 4 ) )
  **  (FloatArray.undef_full output vl )
|--
  EX (n: Z) ,
  “ (0 < (batch_pre ÷ 4 )) ” 
  &&  “ ((batch_pre ÷ 4 ) <= 4611686018427387900) ” 
  &&  “ (0 <= (n_2 - vl )) ” 
  &&  “ ((n_2 - vl ) <= (batch_pre ÷ 4 )) ” 
  &&  “ ((rvv_length (A)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ ((rvv_length (B)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ ((input_a + (vl * sizeof(FLOAT))) = (input_a_pre + (((batch_pre ÷ 4 ) - (n_2 - vl ) ) * sizeof(FLOAT)))) ” 
  &&  “ ((input_b + (vl * sizeof(FLOAT))) = (input_b_pre + (((batch_pre ÷ 4 ) - (n_2 - vl ) ) * sizeof(FLOAT)))) ” 
  &&  “ ((output + (vl * sizeof(FLOAT))) = (output_pre + (((batch_pre ÷ 4 ) - (n_2 - vl ) ) * sizeof(FLOAT)))) ” 
  &&  “ (0 < (batch_pre ÷ 4 )) ” 
  &&  “ ((batch_pre ÷ 4 ) <= 4611686018427387900) ” 
  &&  “ (n = (batch_pre ÷ 4 )) ” 
  &&  “ ((rvv_length (A)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ ((rvv_length (B)) = ((batch_pre ÷ 4 ) + 3 )) ”
  &&  (FloatArray.full input_a_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.full input_b_pre ((batch_pre ÷ 4 ) + 3 ) B )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (n_2 - vl ) ) (vadd_values (((batch_pre ÷ 4 ) - (n_2 - vl ) )) (A) (B)) )
  **  (FloatArray.undef_seg output_pre ((batch_pre ÷ 4 ) - (n_2 - vl ) ) (batch_pre ÷ 4 ) )
) \/
(
forall (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (n_2: Z) (input_a: Z) (input_b: Z) (output: Z) (vl: Z) (PreH1 : (0 < (batch_pre ÷ 4 ))) (PreH2 : ((batch_pre ÷ 4 ) <= 4611686018427387900)) (PreH3 : (0 <= n_2)) (PreH4 : (n_2 <= (batch_pre ÷ 4 ))) (PreH5 : ((rvv_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH6 : ((rvv_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH7 : (input_a = (input_a_pre + (((batch_pre ÷ 4 ) - n_2 ) * sizeof(FLOAT))))) (PreH8 : (input_b = (input_b_pre + (((batch_pre ÷ 4 ) - n_2 ) * sizeof(FLOAT))))) (PreH9 : (output = (output_pre + (((batch_pre ÷ 4 ) - n_2 ) * sizeof(FLOAT))))) (PreH10 : (0 < n_2)) (PreH11 : (0 < vl)) (PreH12 : (vl <= 32)) (PreH13 : (vl <= n_2)) (PreH14 : (vl = (vadd_vl (n_2)))) ,
  (FloatArray.full output vl (rvv_take (vl) ((rvv_pack32 ((vadd_active_add (0) (vl) ((rvv_read_value (0) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (0) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (1) (vl) ((rvv_read_value (1) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (1) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (2) (vl) ((rvv_read_value (2) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (2) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (3) (vl) ((rvv_read_value (3) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (3) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (4) (vl) ((rvv_read_value (4) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (4) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (5) (vl) ((rvv_read_value (5) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (5) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (6) (vl) ((rvv_read_value (6) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (6) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (7) (vl) ((rvv_read_value (7) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (7) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (8) (vl) ((rvv_read_value (8) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (8) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (9) (vl) ((rvv_read_value (9) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (9) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (10) (vl) ((rvv_read_value (10) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (10) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (11) (vl) ((rvv_read_value (11) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (11) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (12) (vl) ((rvv_read_value (12) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (12) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (13) (vl) ((rvv_read_value (13) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (13) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (14) (vl) ((rvv_read_value (14) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (14) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (15) (vl) ((rvv_read_value (15) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (15) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (16) (vl) ((rvv_read_value (16) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (16) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (17) (vl) ((rvv_read_value (17) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (17) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (18) (vl) ((rvv_read_value (18) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (18) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (19) (vl) ((rvv_read_value (19) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (19) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (20) (vl) ((rvv_read_value (20) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (20) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (21) (vl) ((rvv_read_value (21) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (21) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (22) (vl) ((rvv_read_value (22) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (22) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (23) (vl) ((rvv_read_value (23) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (23) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (24) (vl) ((rvv_read_value (24) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (24) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (25) (vl) ((rvv_read_value (25) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (25) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (26) (vl) ((rvv_read_value (26) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (26) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (27) (vl) ((rvv_read_value (27) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (27) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (28) (vl) ((rvv_read_value (28) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (28) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (29) (vl) ((rvv_read_value (29) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (29) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (30) (vl) ((rvv_read_value (30) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (30) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (31) (vl) ((rvv_read_value (31) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (31) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B)))))))))) )
  **  (FloatArray.full input_b vl (rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B)) )
  **  (FloatArray.full input_a vl (rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A)) )
  **  (FloatArray.seg input_a_pre 0 ((batch_pre ÷ 4 ) - n_2 ) (rvv_slice (0) (((batch_pre ÷ 4 ) - n_2 )) (A)) )
  **  (FloatArray.seg input_a_pre (((batch_pre ÷ 4 ) - n_2 ) + vl ) ((batch_pre ÷ 4 ) + 3 ) (rvv_slice ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (((batch_pre ÷ 4 ) + 3 )) (A)) )
  **  (FloatArray.seg input_b_pre 0 ((batch_pre ÷ 4 ) - n_2 ) (rvv_slice (0) (((batch_pre ÷ 4 ) - n_2 )) (B)) )
  **  (FloatArray.seg input_b_pre (((batch_pre ÷ 4 ) - n_2 ) + vl ) ((batch_pre ÷ 4 ) + 3 ) (rvv_slice ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (((batch_pre ÷ 4 ) + 3 )) (B)) )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - n_2 ) (vadd_values (((batch_pre ÷ 4 ) - n_2 )) (A) (B)) )
  **  (FloatArray.undef_full output vl )
|--
  “ ((output + (vl * sizeof(FLOAT))) = (output_pre + (((batch_pre ÷ 4 ) - (n_2 - vl ) ) * sizeof(FLOAT)))) ” 
  &&  “ ((input_b + (vl * sizeof(FLOAT))) = (input_b_pre + (((batch_pre ÷ 4 ) - (n_2 - vl ) ) * sizeof(FLOAT)))) ” 
  &&  “ ((input_a + (vl * sizeof(FLOAT))) = (input_a_pre + (((batch_pre ÷ 4 ) - (n_2 - vl ) ) * sizeof(FLOAT)))) ”
  &&  (FloatArray.full input_a_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.full input_b_pre ((batch_pre ÷ 4 ) + 3 ) B )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (n_2 - vl ) ) (vadd_values (((batch_pre ÷ 4 ) - (n_2 - vl ) )) (A) (B)) )
).

Definition test_rvv_entail_wit_4_split_goal_1 := 
forall (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (n_2: Z) (input_a: Z) (input_b: Z) (output: Z) (vl: Z) (PreH1 : (0 < (batch_pre ÷ 4 ))) (PreH2 : ((batch_pre ÷ 4 ) <= 4611686018427387900)) (PreH3 : (0 <= n_2)) (PreH4 : (n_2 <= (batch_pre ÷ 4 ))) (PreH5 : ((rvv_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH6 : ((rvv_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH7 : (input_a = (input_a_pre + (((batch_pre ÷ 4 ) - n_2 ) * sizeof(FLOAT))))) (PreH8 : (input_b = (input_b_pre + (((batch_pre ÷ 4 ) - n_2 ) * sizeof(FLOAT))))) (PreH9 : (output = (output_pre + (((batch_pre ÷ 4 ) - n_2 ) * sizeof(FLOAT))))) (PreH10 : (0 < n_2)) (PreH11 : (0 < vl)) (PreH12 : (vl <= 32)) (PreH13 : (vl <= n_2)) (PreH14 : (vl = (vadd_vl (n_2)))) ,
  (FloatArray.full output vl (rvv_take (vl) ((rvv_pack32 ((vadd_active_add (0) (vl) ((rvv_read_value (0) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (0) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (1) (vl) ((rvv_read_value (1) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (1) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (2) (vl) ((rvv_read_value (2) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (2) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (3) (vl) ((rvv_read_value (3) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (3) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (4) (vl) ((rvv_read_value (4) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (4) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (5) (vl) ((rvv_read_value (5) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (5) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (6) (vl) ((rvv_read_value (6) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (6) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (7) (vl) ((rvv_read_value (7) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (7) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (8) (vl) ((rvv_read_value (8) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (8) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (9) (vl) ((rvv_read_value (9) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (9) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (10) (vl) ((rvv_read_value (10) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (10) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (11) (vl) ((rvv_read_value (11) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (11) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (12) (vl) ((rvv_read_value (12) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (12) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (13) (vl) ((rvv_read_value (13) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (13) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (14) (vl) ((rvv_read_value (14) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (14) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (15) (vl) ((rvv_read_value (15) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (15) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (16) (vl) ((rvv_read_value (16) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (16) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (17) (vl) ((rvv_read_value (17) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (17) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (18) (vl) ((rvv_read_value (18) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (18) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (19) (vl) ((rvv_read_value (19) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (19) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (20) (vl) ((rvv_read_value (20) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (20) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (21) (vl) ((rvv_read_value (21) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (21) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (22) (vl) ((rvv_read_value (22) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (22) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (23) (vl) ((rvv_read_value (23) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (23) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (24) (vl) ((rvv_read_value (24) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (24) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (25) (vl) ((rvv_read_value (25) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (25) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (26) (vl) ((rvv_read_value (26) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (26) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (27) (vl) ((rvv_read_value (27) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (27) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (28) (vl) ((rvv_read_value (28) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (28) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (29) (vl) ((rvv_read_value (29) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (29) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (30) (vl) ((rvv_read_value (30) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (30) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (31) (vl) ((rvv_read_value (31) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (31) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B)))))))))) )
  **  (FloatArray.full input_b vl (rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B)) )
  **  (FloatArray.full input_a vl (rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A)) )
  **  (FloatArray.seg input_a_pre 0 ((batch_pre ÷ 4 ) - n_2 ) (rvv_slice (0) (((batch_pre ÷ 4 ) - n_2 )) (A)) )
  **  (FloatArray.seg input_a_pre (((batch_pre ÷ 4 ) - n_2 ) + vl ) ((batch_pre ÷ 4 ) + 3 ) (rvv_slice ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (((batch_pre ÷ 4 ) + 3 )) (A)) )
  **  (FloatArray.seg input_b_pre 0 ((batch_pre ÷ 4 ) - n_2 ) (rvv_slice (0) (((batch_pre ÷ 4 ) - n_2 )) (B)) )
  **  (FloatArray.seg input_b_pre (((batch_pre ÷ 4 ) - n_2 ) + vl ) ((batch_pre ÷ 4 ) + 3 ) (rvv_slice ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (((batch_pre ÷ 4 ) + 3 )) (B)) )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - n_2 ) (vadd_values (((batch_pre ÷ 4 ) - n_2 )) (A) (B)) )
  **  (FloatArray.undef_full output vl )
|--
  “ ((output + (vl * sizeof(FLOAT))) = (output_pre + (((batch_pre ÷ 4 ) - (n_2 - vl ) ) * sizeof(FLOAT)))) ”
.

Definition test_rvv_entail_wit_4_split_goal_2 := 
forall (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (n_2: Z) (input_a: Z) (input_b: Z) (output: Z) (vl: Z) (PreH1 : (0 < (batch_pre ÷ 4 ))) (PreH2 : ((batch_pre ÷ 4 ) <= 4611686018427387900)) (PreH3 : (0 <= n_2)) (PreH4 : (n_2 <= (batch_pre ÷ 4 ))) (PreH5 : ((rvv_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH6 : ((rvv_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH7 : (input_a = (input_a_pre + (((batch_pre ÷ 4 ) - n_2 ) * sizeof(FLOAT))))) (PreH8 : (input_b = (input_b_pre + (((batch_pre ÷ 4 ) - n_2 ) * sizeof(FLOAT))))) (PreH9 : (output = (output_pre + (((batch_pre ÷ 4 ) - n_2 ) * sizeof(FLOAT))))) (PreH10 : (0 < n_2)) (PreH11 : (0 < vl)) (PreH12 : (vl <= 32)) (PreH13 : (vl <= n_2)) (PreH14 : (vl = (vadd_vl (n_2)))) ,
  (FloatArray.full output vl (rvv_take (vl) ((rvv_pack32 ((vadd_active_add (0) (vl) ((rvv_read_value (0) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (0) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (1) (vl) ((rvv_read_value (1) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (1) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (2) (vl) ((rvv_read_value (2) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (2) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (3) (vl) ((rvv_read_value (3) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (3) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (4) (vl) ((rvv_read_value (4) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (4) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (5) (vl) ((rvv_read_value (5) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (5) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (6) (vl) ((rvv_read_value (6) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (6) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (7) (vl) ((rvv_read_value (7) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (7) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (8) (vl) ((rvv_read_value (8) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (8) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (9) (vl) ((rvv_read_value (9) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (9) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (10) (vl) ((rvv_read_value (10) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (10) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (11) (vl) ((rvv_read_value (11) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (11) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (12) (vl) ((rvv_read_value (12) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (12) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (13) (vl) ((rvv_read_value (13) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (13) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (14) (vl) ((rvv_read_value (14) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (14) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (15) (vl) ((rvv_read_value (15) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (15) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (16) (vl) ((rvv_read_value (16) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (16) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (17) (vl) ((rvv_read_value (17) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (17) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (18) (vl) ((rvv_read_value (18) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (18) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (19) (vl) ((rvv_read_value (19) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (19) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (20) (vl) ((rvv_read_value (20) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (20) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (21) (vl) ((rvv_read_value (21) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (21) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (22) (vl) ((rvv_read_value (22) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (22) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (23) (vl) ((rvv_read_value (23) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (23) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (24) (vl) ((rvv_read_value (24) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (24) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (25) (vl) ((rvv_read_value (25) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (25) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (26) (vl) ((rvv_read_value (26) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (26) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (27) (vl) ((rvv_read_value (27) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (27) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (28) (vl) ((rvv_read_value (28) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (28) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (29) (vl) ((rvv_read_value (29) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (29) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (30) (vl) ((rvv_read_value (30) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (30) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (31) (vl) ((rvv_read_value (31) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (31) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B)))))))))) )
  **  (FloatArray.full input_b vl (rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B)) )
  **  (FloatArray.full input_a vl (rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A)) )
  **  (FloatArray.seg input_a_pre 0 ((batch_pre ÷ 4 ) - n_2 ) (rvv_slice (0) (((batch_pre ÷ 4 ) - n_2 )) (A)) )
  **  (FloatArray.seg input_a_pre (((batch_pre ÷ 4 ) - n_2 ) + vl ) ((batch_pre ÷ 4 ) + 3 ) (rvv_slice ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (((batch_pre ÷ 4 ) + 3 )) (A)) )
  **  (FloatArray.seg input_b_pre 0 ((batch_pre ÷ 4 ) - n_2 ) (rvv_slice (0) (((batch_pre ÷ 4 ) - n_2 )) (B)) )
  **  (FloatArray.seg input_b_pre (((batch_pre ÷ 4 ) - n_2 ) + vl ) ((batch_pre ÷ 4 ) + 3 ) (rvv_slice ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (((batch_pre ÷ 4 ) + 3 )) (B)) )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - n_2 ) (vadd_values (((batch_pre ÷ 4 ) - n_2 )) (A) (B)) )
  **  (FloatArray.undef_full output vl )
|--
  “ ((input_b + (vl * sizeof(FLOAT))) = (input_b_pre + (((batch_pre ÷ 4 ) - (n_2 - vl ) ) * sizeof(FLOAT)))) ”
.

Definition test_rvv_entail_wit_4_split_goal_3 := 
forall (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (n_2: Z) (input_a: Z) (input_b: Z) (output: Z) (vl: Z) (PreH1 : (0 < (batch_pre ÷ 4 ))) (PreH2 : ((batch_pre ÷ 4 ) <= 4611686018427387900)) (PreH3 : (0 <= n_2)) (PreH4 : (n_2 <= (batch_pre ÷ 4 ))) (PreH5 : ((rvv_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH6 : ((rvv_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH7 : (input_a = (input_a_pre + (((batch_pre ÷ 4 ) - n_2 ) * sizeof(FLOAT))))) (PreH8 : (input_b = (input_b_pre + (((batch_pre ÷ 4 ) - n_2 ) * sizeof(FLOAT))))) (PreH9 : (output = (output_pre + (((batch_pre ÷ 4 ) - n_2 ) * sizeof(FLOAT))))) (PreH10 : (0 < n_2)) (PreH11 : (0 < vl)) (PreH12 : (vl <= 32)) (PreH13 : (vl <= n_2)) (PreH14 : (vl = (vadd_vl (n_2)))) ,
  (FloatArray.full output vl (rvv_take (vl) ((rvv_pack32 ((vadd_active_add (0) (vl) ((rvv_read_value (0) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (0) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (1) (vl) ((rvv_read_value (1) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (1) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (2) (vl) ((rvv_read_value (2) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (2) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (3) (vl) ((rvv_read_value (3) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (3) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (4) (vl) ((rvv_read_value (4) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (4) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (5) (vl) ((rvv_read_value (5) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (5) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (6) (vl) ((rvv_read_value (6) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (6) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (7) (vl) ((rvv_read_value (7) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (7) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (8) (vl) ((rvv_read_value (8) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (8) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (9) (vl) ((rvv_read_value (9) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (9) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (10) (vl) ((rvv_read_value (10) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (10) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (11) (vl) ((rvv_read_value (11) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (11) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (12) (vl) ((rvv_read_value (12) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (12) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (13) (vl) ((rvv_read_value (13) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (13) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (14) (vl) ((rvv_read_value (14) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (14) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (15) (vl) ((rvv_read_value (15) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (15) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (16) (vl) ((rvv_read_value (16) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (16) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (17) (vl) ((rvv_read_value (17) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (17) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (18) (vl) ((rvv_read_value (18) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (18) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (19) (vl) ((rvv_read_value (19) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (19) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (20) (vl) ((rvv_read_value (20) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (20) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (21) (vl) ((rvv_read_value (21) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (21) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (22) (vl) ((rvv_read_value (22) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (22) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (23) (vl) ((rvv_read_value (23) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (23) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (24) (vl) ((rvv_read_value (24) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (24) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (25) (vl) ((rvv_read_value (25) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (25) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (26) (vl) ((rvv_read_value (26) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (26) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (27) (vl) ((rvv_read_value (27) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (27) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (28) (vl) ((rvv_read_value (28) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (28) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (29) (vl) ((rvv_read_value (29) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (29) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (30) (vl) ((rvv_read_value (30) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (30) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (31) (vl) ((rvv_read_value (31) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (31) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B)))))))))) )
  **  (FloatArray.full input_b vl (rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B)) )
  **  (FloatArray.full input_a vl (rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A)) )
  **  (FloatArray.seg input_a_pre 0 ((batch_pre ÷ 4 ) - n_2 ) (rvv_slice (0) (((batch_pre ÷ 4 ) - n_2 )) (A)) )
  **  (FloatArray.seg input_a_pre (((batch_pre ÷ 4 ) - n_2 ) + vl ) ((batch_pre ÷ 4 ) + 3 ) (rvv_slice ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (((batch_pre ÷ 4 ) + 3 )) (A)) )
  **  (FloatArray.seg input_b_pre 0 ((batch_pre ÷ 4 ) - n_2 ) (rvv_slice (0) (((batch_pre ÷ 4 ) - n_2 )) (B)) )
  **  (FloatArray.seg input_b_pre (((batch_pre ÷ 4 ) - n_2 ) + vl ) ((batch_pre ÷ 4 ) + 3 ) (rvv_slice ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (((batch_pre ÷ 4 ) + 3 )) (B)) )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - n_2 ) (vadd_values (((batch_pre ÷ 4 ) - n_2 )) (A) (B)) )
  **  (FloatArray.undef_full output vl )
|--
  “ ((input_a + (vl * sizeof(FLOAT))) = (input_a_pre + (((batch_pre ÷ 4 ) - (n_2 - vl ) ) * sizeof(FLOAT)))) ”
.

Definition test_rvv_entail_wit_4_split_goal_spatial := 
forall (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (n_2: Z) (input_a: Z) (input_b: Z) (output: Z) (vl: Z) (PreH1 : (0 < (batch_pre ÷ 4 ))) (PreH2 : ((batch_pre ÷ 4 ) <= 4611686018427387900)) (PreH3 : (0 <= n_2)) (PreH4 : (n_2 <= (batch_pre ÷ 4 ))) (PreH5 : ((rvv_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH6 : ((rvv_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH7 : (input_a = (input_a_pre + (((batch_pre ÷ 4 ) - n_2 ) * sizeof(FLOAT))))) (PreH8 : (input_b = (input_b_pre + (((batch_pre ÷ 4 ) - n_2 ) * sizeof(FLOAT))))) (PreH9 : (output = (output_pre + (((batch_pre ÷ 4 ) - n_2 ) * sizeof(FLOAT))))) (PreH10 : (0 < n_2)) (PreH11 : (0 < vl)) (PreH12 : (vl <= 32)) (PreH13 : (vl <= n_2)) (PreH14 : (vl = (vadd_vl (n_2)))) ,
  (FloatArray.full output vl (rvv_take (vl) ((rvv_pack32 ((vadd_active_add (0) (vl) ((rvv_read_value (0) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (0) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (1) (vl) ((rvv_read_value (1) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (1) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (2) (vl) ((rvv_read_value (2) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (2) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (3) (vl) ((rvv_read_value (3) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (3) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (4) (vl) ((rvv_read_value (4) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (4) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (5) (vl) ((rvv_read_value (5) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (5) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (6) (vl) ((rvv_read_value (6) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (6) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (7) (vl) ((rvv_read_value (7) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (7) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (8) (vl) ((rvv_read_value (8) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (8) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (9) (vl) ((rvv_read_value (9) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (9) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (10) (vl) ((rvv_read_value (10) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (10) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (11) (vl) ((rvv_read_value (11) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (11) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (12) (vl) ((rvv_read_value (12) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (12) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (13) (vl) ((rvv_read_value (13) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (13) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (14) (vl) ((rvv_read_value (14) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (14) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (15) (vl) ((rvv_read_value (15) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (15) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (16) (vl) ((rvv_read_value (16) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (16) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (17) (vl) ((rvv_read_value (17) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (17) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (18) (vl) ((rvv_read_value (18) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (18) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (19) (vl) ((rvv_read_value (19) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (19) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (20) (vl) ((rvv_read_value (20) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (20) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (21) (vl) ((rvv_read_value (21) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (21) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (22) (vl) ((rvv_read_value (22) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (22) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (23) (vl) ((rvv_read_value (23) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (23) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (24) (vl) ((rvv_read_value (24) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (24) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (25) (vl) ((rvv_read_value (25) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (25) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (26) (vl) ((rvv_read_value (26) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (26) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (27) (vl) ((rvv_read_value (27) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (27) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (28) (vl) ((rvv_read_value (28) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (28) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (29) (vl) ((rvv_read_value (29) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (29) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (30) (vl) ((rvv_read_value (30) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (30) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B))))))) ((vadd_active_add (31) (vl) ((rvv_read_value (31) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A))))) ((rvv_read_value (31) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B)))))))))) )
  **  (FloatArray.full input_b vl (rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (B)) )
  **  (FloatArray.full input_a vl (rvv_slice (((batch_pre ÷ 4 ) - n_2 )) ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (A)) )
  **  (FloatArray.seg input_a_pre 0 ((batch_pre ÷ 4 ) - n_2 ) (rvv_slice (0) (((batch_pre ÷ 4 ) - n_2 )) (A)) )
  **  (FloatArray.seg input_a_pre (((batch_pre ÷ 4 ) - n_2 ) + vl ) ((batch_pre ÷ 4 ) + 3 ) (rvv_slice ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (((batch_pre ÷ 4 ) + 3 )) (A)) )
  **  (FloatArray.seg input_b_pre 0 ((batch_pre ÷ 4 ) - n_2 ) (rvv_slice (0) (((batch_pre ÷ 4 ) - n_2 )) (B)) )
  **  (FloatArray.seg input_b_pre (((batch_pre ÷ 4 ) - n_2 ) + vl ) ((batch_pre ÷ 4 ) + 3 ) (rvv_slice ((((batch_pre ÷ 4 ) - n_2 ) + vl )) (((batch_pre ÷ 4 ) + 3 )) (B)) )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - n_2 ) (vadd_values (((batch_pre ÷ 4 ) - n_2 )) (A) (B)) )
  **  (FloatArray.undef_full output vl )
|--
  (FloatArray.full input_a_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.full input_b_pre ((batch_pre ÷ 4 ) + 3 ) B )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (n_2 - vl ) ) (vadd_values (((batch_pre ÷ 4 ) - (n_2 - vl ) )) (A) (B)) )
.

Definition test_rvv_return_wit_1 := 
(
forall (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (n: Z) (output: Z) (input_b: Z) (input_a: Z) (n_2: Z) (PreH1 : (n_2 <= 0)) (PreH2 : (0 < (batch_pre ÷ 4 ))) (PreH3 : ((batch_pre ÷ 4 ) <= 4611686018427387900)) (PreH4 : (0 <= n_2)) (PreH5 : (n_2 <= (batch_pre ÷ 4 ))) (PreH6 : ((rvv_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH7 : ((rvv_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH8 : (input_a = (input_a_pre + (((batch_pre ÷ 4 ) - n_2 ) * sizeof(FLOAT))))) (PreH9 : (input_b = (input_b_pre + (((batch_pre ÷ 4 ) - n_2 ) * sizeof(FLOAT))))) (PreH10 : (output = (output_pre + (((batch_pre ÷ 4 ) - n_2 ) * sizeof(FLOAT))))) (PreH11 : (0 < (batch_pre ÷ 4 ))) (PreH12 : ((batch_pre ÷ 4 ) <= 4611686018427387900)) (PreH13 : (n = (batch_pre ÷ 4 ))) (PreH14 : ((rvv_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH15 : ((rvv_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) ,
  (FloatArray.full input_a_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.full input_b_pre ((batch_pre ÷ 4 ) + 3 ) B )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - n_2 ) (vadd_values (((batch_pre ÷ 4 ) - n_2 )) (A) (B)) )
  **  (FloatArray.undef_seg output_pre ((batch_pre ÷ 4 ) - n_2 ) (batch_pre ÷ 4 ) )
|--
  (FloatArray.full input_a_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.full input_b_pre ((batch_pre ÷ 4 ) + 3 ) B )
  **  (FloatArray.full output_pre (batch_pre ÷ 4 ) (vadd_values ((batch_pre ÷ 4 )) (A) (B)) )
) \/
(
forall (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (n: Z) (output: Z) (input_b: Z) (input_a: Z) (n_2: Z) (PreH1 : (n_2 <= 0)) (PreH2 : (0 < (batch_pre ÷ 4 ))) (PreH3 : ((batch_pre ÷ 4 ) <= 4611686018427387900)) (PreH4 : (0 <= n_2)) (PreH5 : (n_2 <= (batch_pre ÷ 4 ))) (PreH6 : ((rvv_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH7 : ((rvv_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH8 : (input_a = (input_a_pre + (((batch_pre ÷ 4 ) - n_2 ) * sizeof(FLOAT))))) (PreH9 : (input_b = (input_b_pre + (((batch_pre ÷ 4 ) - n_2 ) * sizeof(FLOAT))))) (PreH10 : (output = (output_pre + (((batch_pre ÷ 4 ) - n_2 ) * sizeof(FLOAT))))) (PreH11 : (0 < (batch_pre ÷ 4 ))) (PreH12 : ((batch_pre ÷ 4 ) <= 4611686018427387900)) (PreH13 : (n = (batch_pre ÷ 4 ))) (PreH14 : ((rvv_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH15 : ((rvv_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) ,
  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - n_2 ) (vadd_values (((batch_pre ÷ 4 ) - n_2 )) (A) (B)) )
  **  (FloatArray.undef_seg output_pre ((batch_pre ÷ 4 ) - n_2 ) (batch_pre ÷ 4 ) )
|--
  (FloatArray.full output_pre (batch_pre ÷ 4 ) (vadd_values ((batch_pre ÷ 4 )) (A) (B)) )
).

Definition test_rvv_return_wit_1_split_goal_spatial := 
forall (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (n: Z) (output: Z) (input_b: Z) (input_a: Z) (n_2: Z) (PreH1 : (n_2 <= 0)) (PreH2 : (0 < (batch_pre ÷ 4 ))) (PreH3 : ((batch_pre ÷ 4 ) <= 4611686018427387900)) (PreH4 : (0 <= n_2)) (PreH5 : (n_2 <= (batch_pre ÷ 4 ))) (PreH6 : ((rvv_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH7 : ((rvv_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH8 : (input_a = (input_a_pre + (((batch_pre ÷ 4 ) - n_2 ) * sizeof(FLOAT))))) (PreH9 : (input_b = (input_b_pre + (((batch_pre ÷ 4 ) - n_2 ) * sizeof(FLOAT))))) (PreH10 : (output = (output_pre + (((batch_pre ÷ 4 ) - n_2 ) * sizeof(FLOAT))))) (PreH11 : (0 < (batch_pre ÷ 4 ))) (PreH12 : ((batch_pre ÷ 4 ) <= 4611686018427387900)) (PreH13 : (n = (batch_pre ÷ 4 ))) (PreH14 : ((rvv_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH15 : ((rvv_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) ,
  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - n_2 ) (vadd_values (((batch_pre ÷ 4 ) - n_2 )) (A) (B)) )
  **  (FloatArray.undef_seg output_pre ((batch_pre ÷ 4 ) - n_2 ) (batch_pre ÷ 4 ) )
|--
  (FloatArray.full output_pre (batch_pre ÷ 4 ) (vadd_values ((batch_pre ÷ 4 )) (A) (B)) )
.

Definition test_rvv_partial_solve_wit_1_pure := 
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

Definition test_rvv_partial_solve_wit_1_aux := 
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

Definition test_rvv_partial_solve_wit_1 := test_rvv_partial_solve_wit_1_pure -> test_rvv_partial_solve_wit_1_aux.

Definition test_rvv_partial_solve_wit_2_pure := 
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

Definition test_rvv_partial_solve_wit_2_aux := 
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

Definition test_rvv_partial_solve_wit_2 := test_rvv_partial_solve_wit_2_pure -> test_rvv_partial_solve_wit_2_aux.

Definition test_rvv_partial_solve_wit_3_pure := 
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

Definition test_rvv_partial_solve_wit_3_aux := 
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

Definition test_rvv_partial_solve_wit_3 := test_rvv_partial_solve_wit_3_pure -> test_rvv_partial_solve_wit_3_aux.

Definition test_rvv_partial_solve_wit_4_pure := 
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

Definition test_rvv_partial_solve_wit_4_aux := 
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

Definition test_rvv_partial_solve_wit_4 := test_rvv_partial_solve_wit_4_pure -> test_rvv_partial_solve_wit_4_aux.

Definition test_rvv_partial_solve_wit_5_pure := 
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

Definition test_rvv_partial_solve_wit_5_aux := 
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

Definition test_rvv_partial_solve_wit_5 := test_rvv_partial_solve_wit_5_pure -> test_rvv_partial_solve_wit_5_aux.

Definition test_rvv_partial_solve_wit_6 := 
forall (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (n: Z) (output: Z) (input_b: Z) (input_a: Z) (n_2: Z) (PreH1 : (n_2 > 0)) (PreH2 : (0 < (batch_pre ÷ 4 ))) (PreH3 : ((batch_pre ÷ 4 ) <= 4611686018427387900)) (PreH4 : (0 <= n_2)) (PreH5 : (n_2 <= (batch_pre ÷ 4 ))) (PreH6 : ((rvv_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH7 : ((rvv_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH8 : (input_a = (input_a_pre + (((batch_pre ÷ 4 ) - n_2 ) * sizeof(FLOAT))))) (PreH9 : (input_b = (input_b_pre + (((batch_pre ÷ 4 ) - n_2 ) * sizeof(FLOAT))))) (PreH10 : (output = (output_pre + (((batch_pre ÷ 4 ) - n_2 ) * sizeof(FLOAT))))) (PreH11 : (0 < (batch_pre ÷ 4 ))) (PreH12 : ((batch_pre ÷ 4 ) <= 4611686018427387900)) (PreH13 : (n = (batch_pre ÷ 4 ))) (PreH14 : ((rvv_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH15 : ((rvv_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) ,
  (FloatArray.full input_a_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.full input_b_pre ((batch_pre ÷ 4 ) + 3 ) B )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - n_2 ) (vadd_values (((batch_pre ÷ 4 ) - n_2 )) (A) (B)) )
  **  (FloatArray.undef_seg output_pre ((batch_pre ÷ 4 ) - n_2 ) (batch_pre ÷ 4 ) )
|--
  “ (n_2 > 0) ” 
  &&  “ (0 < (batch_pre ÷ 4 )) ” 
  &&  “ ((batch_pre ÷ 4 ) <= 4611686018427387900) ” 
  &&  “ (0 <= n_2) ” 
  &&  “ (n_2 <= (batch_pre ÷ 4 )) ” 
  &&  “ ((rvv_length (A)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ ((rvv_length (B)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ (input_a = (input_a_pre + (((batch_pre ÷ 4 ) - n_2 ) * sizeof(FLOAT)))) ” 
  &&  “ (input_b = (input_b_pre + (((batch_pre ÷ 4 ) - n_2 ) * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (((batch_pre ÷ 4 ) - n_2 ) * sizeof(FLOAT)))) ” 
  &&  “ (0 < (batch_pre ÷ 4 )) ” 
  &&  “ ((batch_pre ÷ 4 ) <= 4611686018427387900) ” 
  &&  “ (n = (batch_pre ÷ 4 )) ” 
  &&  “ ((rvv_length (A)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ ((rvv_length (B)) = ((batch_pre ÷ 4 ) + 3 )) ”
  &&  (FloatArray.full input_a_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.full input_b_pre ((batch_pre ÷ 4 ) + 3 ) B )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - n_2 ) (vadd_values (((batch_pre ÷ 4 ) - n_2 )) (A) (B)) )
  **  (FloatArray.undef_seg output_pre ((batch_pre ÷ 4 ) - n_2 ) (batch_pre ÷ 4 ) )
.

Definition test_rvv_partial_solve_wit_7_pure := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (n: Z) (input_a: Z) (input_b: Z) (output: Z) (vl: Z) (PreH1 : (0 < (batch_pre ÷ 4 ))) (PreH2 : ((batch_pre ÷ 4 ) <= 4611686018427387900)) (PreH3 : (0 <= n)) (PreH4 : (n <= (batch_pre ÷ 4 ))) (PreH5 : ((rvv_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH6 : ((rvv_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH7 : (input_a = (input_a_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) (PreH8 : (input_b = (input_b_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) (PreH9 : (output = (output_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) (PreH10 : (0 < n)) (PreH11 : (0 < vl)) (PreH12 : (vl <= 32)) (PreH13 : (vl <= n)) (PreH14 : (vl = (vadd_vl (n)))) ,
  (UndefStructPredvfloat32m8_t ( &( "va" ) ) )
  **  ((( &( "batch" ) )) # UInt64  |-> batch_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "n" ) )) # UInt64  |-> n)
  **  ((( &( "input_a" ) )) # Ptr  |-> input_a)
  **  ((( &( "input_b" ) )) # Ptr  |-> input_b)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "vl" ) )) # UInt64  |-> vl)
  **  (FloatArray.seg input_a_pre 0 ((batch_pre ÷ 4 ) - n ) (rvv_slice (0) (((batch_pre ÷ 4 ) - n )) (A)) )
  **  (FloatArray.full input_a vl (rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)) )
  **  (FloatArray.seg input_a_pre (((batch_pre ÷ 4 ) - n ) + vl ) ((batch_pre ÷ 4 ) + 3 ) (rvv_slice ((((batch_pre ÷ 4 ) - n ) + vl )) (((batch_pre ÷ 4 ) + 3 )) (A)) )
  **  (FloatArray.seg input_b_pre 0 ((batch_pre ÷ 4 ) - n ) (rvv_slice (0) (((batch_pre ÷ 4 ) - n )) (B)) )
  **  (FloatArray.full input_b vl (rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)) )
  **  (FloatArray.seg input_b_pre (((batch_pre ÷ 4 ) - n ) + vl ) ((batch_pre ÷ 4 ) + 3 ) (rvv_slice ((((batch_pre ÷ 4 ) - n ) + vl )) (((batch_pre ÷ 4 ) + 3 )) (B)) )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - n ) (vadd_values (((batch_pre ÷ 4 ) - n )) (A) (B)) )
  **  (FloatArray.undef_full output vl )
  **  (FloatArray.undef_seg output_pre (((batch_pre ÷ 4 ) - n ) + vl ) (batch_pre ÷ 4 ) )
|--
  “ (0 <= vl) ” 
  &&  “ (vl <= 32) ”
.

Definition test_rvv_partial_solve_wit_7_aux := 
forall (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (n: Z) (input_a: Z) (input_b: Z) (output: Z) (vl: Z) (PreH1 : (0 < (batch_pre ÷ 4 ))) (PreH2 : ((batch_pre ÷ 4 ) <= 4611686018427387900)) (PreH3 : (0 <= n)) (PreH4 : (n <= (batch_pre ÷ 4 ))) (PreH5 : ((rvv_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH6 : ((rvv_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH7 : (input_a = (input_a_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) (PreH8 : (input_b = (input_b_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) (PreH9 : (output = (output_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) (PreH10 : (0 < n)) (PreH11 : (0 < vl)) (PreH12 : (vl <= 32)) (PreH13 : (vl <= n)) (PreH14 : (vl = (vadd_vl (n)))) ,
  (UndefStructPredvfloat32m8_t ( &( "va" ) ) )
  **  (FloatArray.seg input_a_pre 0 ((batch_pre ÷ 4 ) - n ) (rvv_slice (0) (((batch_pre ÷ 4 ) - n )) (A)) )
  **  (FloatArray.full input_a vl (rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)) )
  **  (FloatArray.seg input_a_pre (((batch_pre ÷ 4 ) - n ) + vl ) ((batch_pre ÷ 4 ) + 3 ) (rvv_slice ((((batch_pre ÷ 4 ) - n ) + vl )) (((batch_pre ÷ 4 ) + 3 )) (A)) )
  **  (FloatArray.seg input_b_pre 0 ((batch_pre ÷ 4 ) - n ) (rvv_slice (0) (((batch_pre ÷ 4 ) - n )) (B)) )
  **  (FloatArray.full input_b vl (rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)) )
  **  (FloatArray.seg input_b_pre (((batch_pre ÷ 4 ) - n ) + vl ) ((batch_pre ÷ 4 ) + 3 ) (rvv_slice ((((batch_pre ÷ 4 ) - n ) + vl )) (((batch_pre ÷ 4 ) + 3 )) (B)) )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - n ) (vadd_values (((batch_pre ÷ 4 ) - n )) (A) (B)) )
  **  (FloatArray.undef_full output vl )
  **  (FloatArray.undef_seg output_pre (((batch_pre ÷ 4 ) - n ) + vl ) (batch_pre ÷ 4 ) )
|--
  “ (0 <= vl) ” 
  &&  “ (vl <= 32) ” 
  &&  “ (0 < (batch_pre ÷ 4 )) ” 
  &&  “ ((batch_pre ÷ 4 ) <= 4611686018427387900) ” 
  &&  “ (0 <= n) ” 
  &&  “ (n <= (batch_pre ÷ 4 )) ” 
  &&  “ ((rvv_length (A)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ ((rvv_length (B)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ (input_a = (input_a_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT)))) ” 
  &&  “ (input_b = (input_b_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT)))) ” 
  &&  “ (0 < n) ” 
  &&  “ (0 < vl) ” 
  &&  “ (vl <= 32) ” 
  &&  “ (vl <= n) ” 
  &&  “ (vl = (vadd_vl (n))) ”
  &&  (FloatArray.full input_a vl (rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)) )
  **  (UndefStructPredvfloat32m8_t ( &( "va" ) ) )
  **  (FloatArray.seg input_a_pre 0 ((batch_pre ÷ 4 ) - n ) (rvv_slice (0) (((batch_pre ÷ 4 ) - n )) (A)) )
  **  (FloatArray.seg input_a_pre (((batch_pre ÷ 4 ) - n ) + vl ) ((batch_pre ÷ 4 ) + 3 ) (rvv_slice ((((batch_pre ÷ 4 ) - n ) + vl )) (((batch_pre ÷ 4 ) + 3 )) (A)) )
  **  (FloatArray.seg input_b_pre 0 ((batch_pre ÷ 4 ) - n ) (rvv_slice (0) (((batch_pre ÷ 4 ) - n )) (B)) )
  **  (FloatArray.full input_b vl (rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)) )
  **  (FloatArray.seg input_b_pre (((batch_pre ÷ 4 ) - n ) + vl ) ((batch_pre ÷ 4 ) + 3 ) (rvv_slice ((((batch_pre ÷ 4 ) - n ) + vl )) (((batch_pre ÷ 4 ) + 3 )) (B)) )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - n ) (vadd_values (((batch_pre ÷ 4 ) - n )) (A) (B)) )
  **  (FloatArray.undef_full output vl )
  **  (FloatArray.undef_seg output_pre (((batch_pre ÷ 4 ) - n ) + vl ) (batch_pre ÷ 4 ) )
.

Definition test_rvv_partial_solve_wit_7 := test_rvv_partial_solve_wit_7_pure -> test_rvv_partial_solve_wit_7_aux.

Definition test_rvv_partial_solve_wit_8 := 
forall (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (n: Z) (input_a: Z) (input_b: Z) (output: Z) (vl: Z) (retval: Z) (PreH1 : (0 < (batch_pre ÷ 4 ))) (PreH2 : ((batch_pre ÷ 4 ) <= 4611686018427387900)) (PreH3 : (0 <= n)) (PreH4 : (n <= (batch_pre ÷ 4 ))) (PreH5 : ((rvv_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH6 : ((rvv_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH7 : (input_a = (input_a_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) (PreH8 : (input_b = (input_b_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) (PreH9 : (output = (output_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) (PreH10 : (0 < n)) (PreH11 : (0 < vl)) (PreH12 : (vl <= 32)) (PreH13 : (vl <= n)) (PreH14 : (vl = (vadd_vl (n)))) ,
  (FloatArray.full input_a vl (rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)) )
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> (rvv_read_value (0) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> (rvv_read_value (1) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> (rvv_read_value (2) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> (rvv_read_value (3) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> (rvv_read_value (4) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> (rvv_read_value (5) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> (rvv_read_value (6) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> (rvv_read_value (7) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> (rvv_read_value (8) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> (rvv_read_value (9) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> (rvv_read_value (10) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> (rvv_read_value (11) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> (rvv_read_value (12) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> (rvv_read_value (13) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> (rvv_read_value (14) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> (rvv_read_value (15) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> (rvv_read_value (16) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> (rvv_read_value (17) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> (rvv_read_value (18) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> (rvv_read_value (19) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> (rvv_read_value (20) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> (rvv_read_value (21) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> (rvv_read_value (22) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> (rvv_read_value (23) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> (rvv_read_value (24) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> (rvv_read_value (25) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> (rvv_read_value (26) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> (rvv_read_value (27) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> (rvv_read_value (28) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> (rvv_read_value (29) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> (rvv_read_value (30) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> (rvv_read_value (31) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  (UndefStructPredvfloat32m8_t ( &( "va" ) ) )
  **  (FloatArray.seg input_a_pre 0 ((batch_pre ÷ 4 ) - n ) (rvv_slice (0) (((batch_pre ÷ 4 ) - n )) (A)) )
  **  (FloatArray.seg input_a_pre (((batch_pre ÷ 4 ) - n ) + vl ) ((batch_pre ÷ 4 ) + 3 ) (rvv_slice ((((batch_pre ÷ 4 ) - n ) + vl )) (((batch_pre ÷ 4 ) + 3 )) (A)) )
  **  (FloatArray.seg input_b_pre 0 ((batch_pre ÷ 4 ) - n ) (rvv_slice (0) (((batch_pre ÷ 4 ) - n )) (B)) )
  **  (FloatArray.full input_b vl (rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)) )
  **  (FloatArray.seg input_b_pre (((batch_pre ÷ 4 ) - n ) + vl ) ((batch_pre ÷ 4 ) + 3 ) (rvv_slice ((((batch_pre ÷ 4 ) - n ) + vl )) (((batch_pre ÷ 4 ) + 3 )) (B)) )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - n ) (vadd_values (((batch_pre ÷ 4 ) - n )) (A) (B)) )
  **  (FloatArray.undef_full output vl )
  **  (FloatArray.undef_seg output_pre (((batch_pre ÷ 4 ) - n ) + vl ) (batch_pre ÷ 4 ) )
|--
  “ (0 < (batch_pre ÷ 4 )) ” 
  &&  “ ((batch_pre ÷ 4 ) <= 4611686018427387900) ” 
  &&  “ (0 <= n) ” 
  &&  “ (n <= (batch_pre ÷ 4 )) ” 
  &&  “ ((rvv_length (A)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ ((rvv_length (B)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ (input_a = (input_a_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT)))) ” 
  &&  “ (input_b = (input_b_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT)))) ” 
  &&  “ (0 < n) ” 
  &&  “ (0 < vl) ” 
  &&  “ (vl <= 32) ” 
  &&  “ (vl <= n) ” 
  &&  “ (vl = (vadd_vl (n))) ”
  &&  ((&(( &( "va" ) )->ₛ "s31")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> (rvv_read_value (31) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s30")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> (rvv_read_value (30) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s29")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> (rvv_read_value (29) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s28")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> (rvv_read_value (28) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s27")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> (rvv_read_value (27) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s26")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> (rvv_read_value (26) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s25")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> (rvv_read_value (25) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s24")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> (rvv_read_value (24) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s23")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> (rvv_read_value (23) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s22")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> (rvv_read_value (22) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s21")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> (rvv_read_value (21) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s20")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> (rvv_read_value (20) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s19")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> (rvv_read_value (19) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s18")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> (rvv_read_value (18) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s17")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> (rvv_read_value (17) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s16")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> (rvv_read_value (16) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s15")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> (rvv_read_value (15) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s14")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> (rvv_read_value (14) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s13")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> (rvv_read_value (13) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s12")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> (rvv_read_value (12) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s11")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> (rvv_read_value (11) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s10")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> (rvv_read_value (10) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s9")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> (rvv_read_value (9) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s8")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> (rvv_read_value (8) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s7")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> (rvv_read_value (7) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s6")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> (rvv_read_value (6) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s5")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> (rvv_read_value (5) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s4")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> (rvv_read_value (4) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> (rvv_read_value (3) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> (rvv_read_value (2) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> (rvv_read_value (1) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> (rvv_read_value (0) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  (FloatArray.full input_a vl (rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)) )
  **  (FloatArray.seg input_a_pre 0 ((batch_pre ÷ 4 ) - n ) (rvv_slice (0) (((batch_pre ÷ 4 ) - n )) (A)) )
  **  (FloatArray.seg input_a_pre (((batch_pre ÷ 4 ) - n ) + vl ) ((batch_pre ÷ 4 ) + 3 ) (rvv_slice ((((batch_pre ÷ 4 ) - n ) + vl )) (((batch_pre ÷ 4 ) + 3 )) (A)) )
  **  (FloatArray.seg input_b_pre 0 ((batch_pre ÷ 4 ) - n ) (rvv_slice (0) (((batch_pre ÷ 4 ) - n )) (B)) )
  **  (FloatArray.full input_b vl (rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)) )
  **  (FloatArray.seg input_b_pre (((batch_pre ÷ 4 ) - n ) + vl ) ((batch_pre ÷ 4 ) + 3 ) (rvv_slice ((((batch_pre ÷ 4 ) - n ) + vl )) (((batch_pre ÷ 4 ) + 3 )) (B)) )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - n ) (vadd_values (((batch_pre ÷ 4 ) - n )) (A) (B)) )
  **  (FloatArray.undef_full output vl )
  **  (FloatArray.undef_seg output_pre (((batch_pre ÷ 4 ) - n ) + vl ) (batch_pre ÷ 4 ) )
.

Definition test_rvv_partial_solve_wit_9_pure := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (n: Z) (input_a: Z) (input_b: Z) (output: Z) (vl: Z) (PreH1 : (0 < (batch_pre ÷ 4 ))) (PreH2 : ((batch_pre ÷ 4 ) <= 4611686018427387900)) (PreH3 : (0 <= n)) (PreH4 : (n <= (batch_pre ÷ 4 ))) (PreH5 : ((rvv_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH6 : ((rvv_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH7 : (input_a = (input_a_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) (PreH8 : (input_b = (input_b_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) (PreH9 : (output = (output_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) (PreH10 : (0 < n)) (PreH11 : (0 < vl)) (PreH12 : (vl <= 32)) (PreH13 : (vl <= n)) (PreH14 : (vl = (vadd_vl (n)))) ,
  (UndefStructPredvfloat32m8_t ( &( "vb" ) ) )
  **  ((&(( &( "va" ) )->ₛ "s31")) # Float  |-> (rvv_read_value (31) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s30")) # Float  |-> (rvv_read_value (30) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s29")) # Float  |-> (rvv_read_value (29) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s28")) # Float  |-> (rvv_read_value (28) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s27")) # Float  |-> (rvv_read_value (27) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s26")) # Float  |-> (rvv_read_value (26) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s25")) # Float  |-> (rvv_read_value (25) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s24")) # Float  |-> (rvv_read_value (24) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s23")) # Float  |-> (rvv_read_value (23) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s22")) # Float  |-> (rvv_read_value (22) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s21")) # Float  |-> (rvv_read_value (21) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s20")) # Float  |-> (rvv_read_value (20) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s19")) # Float  |-> (rvv_read_value (19) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s18")) # Float  |-> (rvv_read_value (18) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s17")) # Float  |-> (rvv_read_value (17) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s16")) # Float  |-> (rvv_read_value (16) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s15")) # Float  |-> (rvv_read_value (15) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s14")) # Float  |-> (rvv_read_value (14) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s13")) # Float  |-> (rvv_read_value (13) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s12")) # Float  |-> (rvv_read_value (12) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s11")) # Float  |-> (rvv_read_value (11) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s10")) # Float  |-> (rvv_read_value (10) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s9")) # Float  |-> (rvv_read_value (9) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s8")) # Float  |-> (rvv_read_value (8) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s7")) # Float  |-> (rvv_read_value (7) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s6")) # Float  |-> (rvv_read_value (6) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s5")) # Float  |-> (rvv_read_value (5) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s4")) # Float  |-> (rvv_read_value (4) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (rvv_read_value (3) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (rvv_read_value (2) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (rvv_read_value (1) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (rvv_read_value (0) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  (FloatArray.full input_a vl (rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)) )
  **  ((( &( "batch" ) )) # UInt64  |-> batch_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "n" ) )) # UInt64  |-> n)
  **  ((( &( "input_a" ) )) # Ptr  |-> input_a)
  **  ((( &( "input_b" ) )) # Ptr  |-> input_b)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "vl" ) )) # UInt64  |-> vl)
  **  (FloatArray.seg input_a_pre 0 ((batch_pre ÷ 4 ) - n ) (rvv_slice (0) (((batch_pre ÷ 4 ) - n )) (A)) )
  **  (FloatArray.seg input_a_pre (((batch_pre ÷ 4 ) - n ) + vl ) ((batch_pre ÷ 4 ) + 3 ) (rvv_slice ((((batch_pre ÷ 4 ) - n ) + vl )) (((batch_pre ÷ 4 ) + 3 )) (A)) )
  **  (FloatArray.seg input_b_pre 0 ((batch_pre ÷ 4 ) - n ) (rvv_slice (0) (((batch_pre ÷ 4 ) - n )) (B)) )
  **  (FloatArray.full input_b vl (rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)) )
  **  (FloatArray.seg input_b_pre (((batch_pre ÷ 4 ) - n ) + vl ) ((batch_pre ÷ 4 ) + 3 ) (rvv_slice ((((batch_pre ÷ 4 ) - n ) + vl )) (((batch_pre ÷ 4 ) + 3 )) (B)) )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - n ) (vadd_values (((batch_pre ÷ 4 ) - n )) (A) (B)) )
  **  (FloatArray.undef_full output vl )
  **  (FloatArray.undef_seg output_pre (((batch_pre ÷ 4 ) - n ) + vl ) (batch_pre ÷ 4 ) )
|--
  “ (0 <= vl) ” 
  &&  “ (vl <= 32) ”
.

Definition test_rvv_partial_solve_wit_9_aux := 
forall (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (n: Z) (input_a: Z) (input_b: Z) (output: Z) (vl: Z) (PreH1 : (0 < (batch_pre ÷ 4 ))) (PreH2 : ((batch_pre ÷ 4 ) <= 4611686018427387900)) (PreH3 : (0 <= n)) (PreH4 : (n <= (batch_pre ÷ 4 ))) (PreH5 : ((rvv_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH6 : ((rvv_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH7 : (input_a = (input_a_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) (PreH8 : (input_b = (input_b_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) (PreH9 : (output = (output_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) (PreH10 : (0 < n)) (PreH11 : (0 < vl)) (PreH12 : (vl <= 32)) (PreH13 : (vl <= n)) (PreH14 : (vl = (vadd_vl (n)))) ,
  (UndefStructPredvfloat32m8_t ( &( "vb" ) ) )
  **  ((&(( &( "va" ) )->ₛ "s31")) # Float  |-> (rvv_read_value (31) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s30")) # Float  |-> (rvv_read_value (30) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s29")) # Float  |-> (rvv_read_value (29) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s28")) # Float  |-> (rvv_read_value (28) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s27")) # Float  |-> (rvv_read_value (27) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s26")) # Float  |-> (rvv_read_value (26) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s25")) # Float  |-> (rvv_read_value (25) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s24")) # Float  |-> (rvv_read_value (24) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s23")) # Float  |-> (rvv_read_value (23) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s22")) # Float  |-> (rvv_read_value (22) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s21")) # Float  |-> (rvv_read_value (21) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s20")) # Float  |-> (rvv_read_value (20) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s19")) # Float  |-> (rvv_read_value (19) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s18")) # Float  |-> (rvv_read_value (18) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s17")) # Float  |-> (rvv_read_value (17) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s16")) # Float  |-> (rvv_read_value (16) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s15")) # Float  |-> (rvv_read_value (15) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s14")) # Float  |-> (rvv_read_value (14) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s13")) # Float  |-> (rvv_read_value (13) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s12")) # Float  |-> (rvv_read_value (12) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s11")) # Float  |-> (rvv_read_value (11) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s10")) # Float  |-> (rvv_read_value (10) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s9")) # Float  |-> (rvv_read_value (9) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s8")) # Float  |-> (rvv_read_value (8) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s7")) # Float  |-> (rvv_read_value (7) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s6")) # Float  |-> (rvv_read_value (6) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s5")) # Float  |-> (rvv_read_value (5) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s4")) # Float  |-> (rvv_read_value (4) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (rvv_read_value (3) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (rvv_read_value (2) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (rvv_read_value (1) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (rvv_read_value (0) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  (FloatArray.full input_a vl (rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)) )
  **  (FloatArray.seg input_a_pre 0 ((batch_pre ÷ 4 ) - n ) (rvv_slice (0) (((batch_pre ÷ 4 ) - n )) (A)) )
  **  (FloatArray.seg input_a_pre (((batch_pre ÷ 4 ) - n ) + vl ) ((batch_pre ÷ 4 ) + 3 ) (rvv_slice ((((batch_pre ÷ 4 ) - n ) + vl )) (((batch_pre ÷ 4 ) + 3 )) (A)) )
  **  (FloatArray.seg input_b_pre 0 ((batch_pre ÷ 4 ) - n ) (rvv_slice (0) (((batch_pre ÷ 4 ) - n )) (B)) )
  **  (FloatArray.full input_b vl (rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)) )
  **  (FloatArray.seg input_b_pre (((batch_pre ÷ 4 ) - n ) + vl ) ((batch_pre ÷ 4 ) + 3 ) (rvv_slice ((((batch_pre ÷ 4 ) - n ) + vl )) (((batch_pre ÷ 4 ) + 3 )) (B)) )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - n ) (vadd_values (((batch_pre ÷ 4 ) - n )) (A) (B)) )
  **  (FloatArray.undef_full output vl )
  **  (FloatArray.undef_seg output_pre (((batch_pre ÷ 4 ) - n ) + vl ) (batch_pre ÷ 4 ) )
|--
  “ (0 <= vl) ” 
  &&  “ (vl <= 32) ” 
  &&  “ (0 < (batch_pre ÷ 4 )) ” 
  &&  “ ((batch_pre ÷ 4 ) <= 4611686018427387900) ” 
  &&  “ (0 <= n) ” 
  &&  “ (n <= (batch_pre ÷ 4 )) ” 
  &&  “ ((rvv_length (A)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ ((rvv_length (B)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ (input_a = (input_a_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT)))) ” 
  &&  “ (input_b = (input_b_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT)))) ” 
  &&  “ (0 < n) ” 
  &&  “ (0 < vl) ” 
  &&  “ (vl <= 32) ” 
  &&  “ (vl <= n) ” 
  &&  “ (vl = (vadd_vl (n))) ”
  &&  (FloatArray.full input_b vl (rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)) )
  **  (UndefStructPredvfloat32m8_t ( &( "vb" ) ) )
  **  ((&(( &( "va" ) )->ₛ "s31")) # Float  |-> (rvv_read_value (31) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s30")) # Float  |-> (rvv_read_value (30) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s29")) # Float  |-> (rvv_read_value (29) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s28")) # Float  |-> (rvv_read_value (28) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s27")) # Float  |-> (rvv_read_value (27) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s26")) # Float  |-> (rvv_read_value (26) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s25")) # Float  |-> (rvv_read_value (25) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s24")) # Float  |-> (rvv_read_value (24) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s23")) # Float  |-> (rvv_read_value (23) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s22")) # Float  |-> (rvv_read_value (22) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s21")) # Float  |-> (rvv_read_value (21) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s20")) # Float  |-> (rvv_read_value (20) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s19")) # Float  |-> (rvv_read_value (19) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s18")) # Float  |-> (rvv_read_value (18) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s17")) # Float  |-> (rvv_read_value (17) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s16")) # Float  |-> (rvv_read_value (16) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s15")) # Float  |-> (rvv_read_value (15) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s14")) # Float  |-> (rvv_read_value (14) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s13")) # Float  |-> (rvv_read_value (13) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s12")) # Float  |-> (rvv_read_value (12) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s11")) # Float  |-> (rvv_read_value (11) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s10")) # Float  |-> (rvv_read_value (10) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s9")) # Float  |-> (rvv_read_value (9) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s8")) # Float  |-> (rvv_read_value (8) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s7")) # Float  |-> (rvv_read_value (7) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s6")) # Float  |-> (rvv_read_value (6) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s5")) # Float  |-> (rvv_read_value (5) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s4")) # Float  |-> (rvv_read_value (4) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (rvv_read_value (3) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (rvv_read_value (2) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (rvv_read_value (1) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (rvv_read_value (0) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  (FloatArray.full input_a vl (rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)) )
  **  (FloatArray.seg input_a_pre 0 ((batch_pre ÷ 4 ) - n ) (rvv_slice (0) (((batch_pre ÷ 4 ) - n )) (A)) )
  **  (FloatArray.seg input_a_pre (((batch_pre ÷ 4 ) - n ) + vl ) ((batch_pre ÷ 4 ) + 3 ) (rvv_slice ((((batch_pre ÷ 4 ) - n ) + vl )) (((batch_pre ÷ 4 ) + 3 )) (A)) )
  **  (FloatArray.seg input_b_pre 0 ((batch_pre ÷ 4 ) - n ) (rvv_slice (0) (((batch_pre ÷ 4 ) - n )) (B)) )
  **  (FloatArray.seg input_b_pre (((batch_pre ÷ 4 ) - n ) + vl ) ((batch_pre ÷ 4 ) + 3 ) (rvv_slice ((((batch_pre ÷ 4 ) - n ) + vl )) (((batch_pre ÷ 4 ) + 3 )) (B)) )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - n ) (vadd_values (((batch_pre ÷ 4 ) - n )) (A) (B)) )
  **  (FloatArray.undef_full output vl )
  **  (FloatArray.undef_seg output_pre (((batch_pre ÷ 4 ) - n ) + vl ) (batch_pre ÷ 4 ) )
.

Definition test_rvv_partial_solve_wit_9 := test_rvv_partial_solve_wit_9_pure -> test_rvv_partial_solve_wit_9_aux.

Definition test_rvv_partial_solve_wit_10 := 
forall (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (n: Z) (input_a: Z) (input_b: Z) (output: Z) (vl: Z) (retval: Z) (PreH1 : (0 < (batch_pre ÷ 4 ))) (PreH2 : ((batch_pre ÷ 4 ) <= 4611686018427387900)) (PreH3 : (0 <= n)) (PreH4 : (n <= (batch_pre ÷ 4 ))) (PreH5 : ((rvv_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH6 : ((rvv_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH7 : (input_a = (input_a_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) (PreH8 : (input_b = (input_b_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) (PreH9 : (output = (output_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) (PreH10 : (0 < n)) (PreH11 : (0 < vl)) (PreH12 : (vl <= 32)) (PreH13 : (vl <= n)) (PreH14 : (vl = (vadd_vl (n)))) ,
  (FloatArray.full input_b vl (rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)) )
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> (rvv_read_value (0) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> (rvv_read_value (1) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> (rvv_read_value (2) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> (rvv_read_value (3) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> (rvv_read_value (4) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> (rvv_read_value (5) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> (rvv_read_value (6) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> (rvv_read_value (7) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> (rvv_read_value (8) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> (rvv_read_value (9) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> (rvv_read_value (10) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> (rvv_read_value (11) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> (rvv_read_value (12) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> (rvv_read_value (13) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> (rvv_read_value (14) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> (rvv_read_value (15) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> (rvv_read_value (16) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> (rvv_read_value (17) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> (rvv_read_value (18) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> (rvv_read_value (19) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> (rvv_read_value (20) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> (rvv_read_value (21) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> (rvv_read_value (22) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> (rvv_read_value (23) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> (rvv_read_value (24) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> (rvv_read_value (25) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> (rvv_read_value (26) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> (rvv_read_value (27) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> (rvv_read_value (28) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> (rvv_read_value (29) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> (rvv_read_value (30) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> (rvv_read_value (31) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  (UndefStructPredvfloat32m8_t ( &( "vb" ) ) )
  **  ((&(( &( "va" ) )->ₛ "s31")) # Float  |-> (rvv_read_value (31) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s30")) # Float  |-> (rvv_read_value (30) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s29")) # Float  |-> (rvv_read_value (29) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s28")) # Float  |-> (rvv_read_value (28) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s27")) # Float  |-> (rvv_read_value (27) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s26")) # Float  |-> (rvv_read_value (26) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s25")) # Float  |-> (rvv_read_value (25) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s24")) # Float  |-> (rvv_read_value (24) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s23")) # Float  |-> (rvv_read_value (23) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s22")) # Float  |-> (rvv_read_value (22) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s21")) # Float  |-> (rvv_read_value (21) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s20")) # Float  |-> (rvv_read_value (20) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s19")) # Float  |-> (rvv_read_value (19) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s18")) # Float  |-> (rvv_read_value (18) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s17")) # Float  |-> (rvv_read_value (17) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s16")) # Float  |-> (rvv_read_value (16) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s15")) # Float  |-> (rvv_read_value (15) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s14")) # Float  |-> (rvv_read_value (14) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s13")) # Float  |-> (rvv_read_value (13) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s12")) # Float  |-> (rvv_read_value (12) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s11")) # Float  |-> (rvv_read_value (11) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s10")) # Float  |-> (rvv_read_value (10) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s9")) # Float  |-> (rvv_read_value (9) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s8")) # Float  |-> (rvv_read_value (8) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s7")) # Float  |-> (rvv_read_value (7) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s6")) # Float  |-> (rvv_read_value (6) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s5")) # Float  |-> (rvv_read_value (5) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s4")) # Float  |-> (rvv_read_value (4) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (rvv_read_value (3) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (rvv_read_value (2) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (rvv_read_value (1) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (rvv_read_value (0) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  (FloatArray.full input_a vl (rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)) )
  **  (FloatArray.seg input_a_pre 0 ((batch_pre ÷ 4 ) - n ) (rvv_slice (0) (((batch_pre ÷ 4 ) - n )) (A)) )
  **  (FloatArray.seg input_a_pre (((batch_pre ÷ 4 ) - n ) + vl ) ((batch_pre ÷ 4 ) + 3 ) (rvv_slice ((((batch_pre ÷ 4 ) - n ) + vl )) (((batch_pre ÷ 4 ) + 3 )) (A)) )
  **  (FloatArray.seg input_b_pre 0 ((batch_pre ÷ 4 ) - n ) (rvv_slice (0) (((batch_pre ÷ 4 ) - n )) (B)) )
  **  (FloatArray.seg input_b_pre (((batch_pre ÷ 4 ) - n ) + vl ) ((batch_pre ÷ 4 ) + 3 ) (rvv_slice ((((batch_pre ÷ 4 ) - n ) + vl )) (((batch_pre ÷ 4 ) + 3 )) (B)) )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - n ) (vadd_values (((batch_pre ÷ 4 ) - n )) (A) (B)) )
  **  (FloatArray.undef_full output vl )
  **  (FloatArray.undef_seg output_pre (((batch_pre ÷ 4 ) - n ) + vl ) (batch_pre ÷ 4 ) )
|--
  “ (0 < (batch_pre ÷ 4 )) ” 
  &&  “ ((batch_pre ÷ 4 ) <= 4611686018427387900) ” 
  &&  “ (0 <= n) ” 
  &&  “ (n <= (batch_pre ÷ 4 )) ” 
  &&  “ ((rvv_length (A)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ ((rvv_length (B)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ (input_a = (input_a_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT)))) ” 
  &&  “ (input_b = (input_b_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT)))) ” 
  &&  “ (0 < n) ” 
  &&  “ (0 < vl) ” 
  &&  “ (vl <= 32) ” 
  &&  “ (vl <= n) ” 
  &&  “ (vl = (vadd_vl (n))) ”
  &&  ((&(( &( "vb" ) )->ₛ "s31")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> (rvv_read_value (31) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s30")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> (rvv_read_value (30) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s29")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> (rvv_read_value (29) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s28")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> (rvv_read_value (28) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s27")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> (rvv_read_value (27) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s26")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> (rvv_read_value (26) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s25")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> (rvv_read_value (25) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s24")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> (rvv_read_value (24) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s23")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> (rvv_read_value (23) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s22")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> (rvv_read_value (22) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s21")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> (rvv_read_value (21) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s20")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> (rvv_read_value (20) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s19")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> (rvv_read_value (19) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s18")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> (rvv_read_value (18) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s17")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> (rvv_read_value (17) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s16")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> (rvv_read_value (16) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s15")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> (rvv_read_value (15) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s14")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> (rvv_read_value (14) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s13")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> (rvv_read_value (13) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s12")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> (rvv_read_value (12) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s11")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> (rvv_read_value (11) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s10")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> (rvv_read_value (10) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s9")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> (rvv_read_value (9) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s8")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> (rvv_read_value (8) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s7")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> (rvv_read_value (7) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s6")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> (rvv_read_value (6) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s5")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> (rvv_read_value (5) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s4")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> (rvv_read_value (4) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s3")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> (rvv_read_value (3) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s2")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> (rvv_read_value (2) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s1")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> (rvv_read_value (1) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s0")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> (rvv_read_value (0) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  (FloatArray.full input_b vl (rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)) )
  **  ((&(( &( "va" ) )->ₛ "s31")) # Float  |-> (rvv_read_value (31) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s30")) # Float  |-> (rvv_read_value (30) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s29")) # Float  |-> (rvv_read_value (29) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s28")) # Float  |-> (rvv_read_value (28) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s27")) # Float  |-> (rvv_read_value (27) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s26")) # Float  |-> (rvv_read_value (26) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s25")) # Float  |-> (rvv_read_value (25) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s24")) # Float  |-> (rvv_read_value (24) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s23")) # Float  |-> (rvv_read_value (23) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s22")) # Float  |-> (rvv_read_value (22) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s21")) # Float  |-> (rvv_read_value (21) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s20")) # Float  |-> (rvv_read_value (20) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s19")) # Float  |-> (rvv_read_value (19) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s18")) # Float  |-> (rvv_read_value (18) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s17")) # Float  |-> (rvv_read_value (17) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s16")) # Float  |-> (rvv_read_value (16) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s15")) # Float  |-> (rvv_read_value (15) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s14")) # Float  |-> (rvv_read_value (14) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s13")) # Float  |-> (rvv_read_value (13) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s12")) # Float  |-> (rvv_read_value (12) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s11")) # Float  |-> (rvv_read_value (11) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s10")) # Float  |-> (rvv_read_value (10) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s9")) # Float  |-> (rvv_read_value (9) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s8")) # Float  |-> (rvv_read_value (8) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s7")) # Float  |-> (rvv_read_value (7) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s6")) # Float  |-> (rvv_read_value (6) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s5")) # Float  |-> (rvv_read_value (5) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s4")) # Float  |-> (rvv_read_value (4) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (rvv_read_value (3) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (rvv_read_value (2) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (rvv_read_value (1) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (rvv_read_value (0) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  (FloatArray.full input_a vl (rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)) )
  **  (FloatArray.seg input_a_pre 0 ((batch_pre ÷ 4 ) - n ) (rvv_slice (0) (((batch_pre ÷ 4 ) - n )) (A)) )
  **  (FloatArray.seg input_a_pre (((batch_pre ÷ 4 ) - n ) + vl ) ((batch_pre ÷ 4 ) + 3 ) (rvv_slice ((((batch_pre ÷ 4 ) - n ) + vl )) (((batch_pre ÷ 4 ) + 3 )) (A)) )
  **  (FloatArray.seg input_b_pre 0 ((batch_pre ÷ 4 ) - n ) (rvv_slice (0) (((batch_pre ÷ 4 ) - n )) (B)) )
  **  (FloatArray.seg input_b_pre (((batch_pre ÷ 4 ) - n ) + vl ) ((batch_pre ÷ 4 ) + 3 ) (rvv_slice ((((batch_pre ÷ 4 ) - n ) + vl )) (((batch_pre ÷ 4 ) + 3 )) (B)) )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - n ) (vadd_values (((batch_pre ÷ 4 ) - n )) (A) (B)) )
  **  (FloatArray.undef_full output vl )
  **  (FloatArray.undef_seg output_pre (((batch_pre ÷ 4 ) - n ) + vl ) (batch_pre ÷ 4 ) )
.

Definition test_rvv_partial_solve_wit_11_pure := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (n: Z) (input_a: Z) (input_b: Z) (output: Z) (vl: Z) (PreH1 : (0 < (batch_pre ÷ 4 ))) (PreH2 : ((batch_pre ÷ 4 ) <= 4611686018427387900)) (PreH3 : (0 <= n)) (PreH4 : (n <= (batch_pre ÷ 4 ))) (PreH5 : ((rvv_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH6 : ((rvv_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH7 : (input_a = (input_a_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) (PreH8 : (input_b = (input_b_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) (PreH9 : (output = (output_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) (PreH10 : (0 < n)) (PreH11 : (0 < vl)) (PreH12 : (vl <= 32)) (PreH13 : (vl <= n)) (PreH14 : (vl = (vadd_vl (n)))) ,
  (UndefStructPredvfloat32m8_t ( &( "vacc" ) ) )
  **  ((&(( &( "vb" ) )->ₛ "s31")) # Float  |-> (rvv_read_value (31) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s30")) # Float  |-> (rvv_read_value (30) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s29")) # Float  |-> (rvv_read_value (29) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s28")) # Float  |-> (rvv_read_value (28) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s27")) # Float  |-> (rvv_read_value (27) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s26")) # Float  |-> (rvv_read_value (26) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s25")) # Float  |-> (rvv_read_value (25) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s24")) # Float  |-> (rvv_read_value (24) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s23")) # Float  |-> (rvv_read_value (23) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s22")) # Float  |-> (rvv_read_value (22) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s21")) # Float  |-> (rvv_read_value (21) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s20")) # Float  |-> (rvv_read_value (20) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s19")) # Float  |-> (rvv_read_value (19) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s18")) # Float  |-> (rvv_read_value (18) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s17")) # Float  |-> (rvv_read_value (17) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s16")) # Float  |-> (rvv_read_value (16) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s15")) # Float  |-> (rvv_read_value (15) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s14")) # Float  |-> (rvv_read_value (14) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s13")) # Float  |-> (rvv_read_value (13) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s12")) # Float  |-> (rvv_read_value (12) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s11")) # Float  |-> (rvv_read_value (11) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s10")) # Float  |-> (rvv_read_value (10) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s9")) # Float  |-> (rvv_read_value (9) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s8")) # Float  |-> (rvv_read_value (8) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s7")) # Float  |-> (rvv_read_value (7) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s6")) # Float  |-> (rvv_read_value (6) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s5")) # Float  |-> (rvv_read_value (5) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s4")) # Float  |-> (rvv_read_value (4) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s3")) # Float  |-> (rvv_read_value (3) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s2")) # Float  |-> (rvv_read_value (2) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s1")) # Float  |-> (rvv_read_value (1) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s0")) # Float  |-> (rvv_read_value (0) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  (FloatArray.full input_b vl (rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)) )
  **  ((&(( &( "va" ) )->ₛ "s31")) # Float  |-> (rvv_read_value (31) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s30")) # Float  |-> (rvv_read_value (30) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s29")) # Float  |-> (rvv_read_value (29) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s28")) # Float  |-> (rvv_read_value (28) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s27")) # Float  |-> (rvv_read_value (27) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s26")) # Float  |-> (rvv_read_value (26) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s25")) # Float  |-> (rvv_read_value (25) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s24")) # Float  |-> (rvv_read_value (24) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s23")) # Float  |-> (rvv_read_value (23) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s22")) # Float  |-> (rvv_read_value (22) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s21")) # Float  |-> (rvv_read_value (21) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s20")) # Float  |-> (rvv_read_value (20) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s19")) # Float  |-> (rvv_read_value (19) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s18")) # Float  |-> (rvv_read_value (18) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s17")) # Float  |-> (rvv_read_value (17) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s16")) # Float  |-> (rvv_read_value (16) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s15")) # Float  |-> (rvv_read_value (15) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s14")) # Float  |-> (rvv_read_value (14) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s13")) # Float  |-> (rvv_read_value (13) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s12")) # Float  |-> (rvv_read_value (12) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s11")) # Float  |-> (rvv_read_value (11) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s10")) # Float  |-> (rvv_read_value (10) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s9")) # Float  |-> (rvv_read_value (9) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s8")) # Float  |-> (rvv_read_value (8) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s7")) # Float  |-> (rvv_read_value (7) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s6")) # Float  |-> (rvv_read_value (6) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s5")) # Float  |-> (rvv_read_value (5) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s4")) # Float  |-> (rvv_read_value (4) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (rvv_read_value (3) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (rvv_read_value (2) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (rvv_read_value (1) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (rvv_read_value (0) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  (FloatArray.full input_a vl (rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)) )
  **  ((( &( "batch" ) )) # UInt64  |-> batch_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "n" ) )) # UInt64  |-> n)
  **  ((( &( "input_a" ) )) # Ptr  |-> input_a)
  **  ((( &( "input_b" ) )) # Ptr  |-> input_b)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "vl" ) )) # UInt64  |-> vl)
  **  (FloatArray.seg input_a_pre 0 ((batch_pre ÷ 4 ) - n ) (rvv_slice (0) (((batch_pre ÷ 4 ) - n )) (A)) )
  **  (FloatArray.seg input_a_pre (((batch_pre ÷ 4 ) - n ) + vl ) ((batch_pre ÷ 4 ) + 3 ) (rvv_slice ((((batch_pre ÷ 4 ) - n ) + vl )) (((batch_pre ÷ 4 ) + 3 )) (A)) )
  **  (FloatArray.seg input_b_pre 0 ((batch_pre ÷ 4 ) - n ) (rvv_slice (0) (((batch_pre ÷ 4 ) - n )) (B)) )
  **  (FloatArray.seg input_b_pre (((batch_pre ÷ 4 ) - n ) + vl ) ((batch_pre ÷ 4 ) + 3 ) (rvv_slice ((((batch_pre ÷ 4 ) - n ) + vl )) (((batch_pre ÷ 4 ) + 3 )) (B)) )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - n ) (vadd_values (((batch_pre ÷ 4 ) - n )) (A) (B)) )
  **  (FloatArray.undef_full output vl )
  **  (FloatArray.undef_seg output_pre (((batch_pre ÷ 4 ) - n ) + vl ) (batch_pre ÷ 4 ) )
|--
  “ (0 <= vl) ” 
  &&  “ (vl <= 32) ”
.

Definition test_rvv_partial_solve_wit_11_aux := 
forall (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (n: Z) (input_a: Z) (input_b: Z) (output: Z) (vl: Z) (PreH1 : (0 < (batch_pre ÷ 4 ))) (PreH2 : ((batch_pre ÷ 4 ) <= 4611686018427387900)) (PreH3 : (0 <= n)) (PreH4 : (n <= (batch_pre ÷ 4 ))) (PreH5 : ((rvv_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH6 : ((rvv_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH7 : (input_a = (input_a_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) (PreH8 : (input_b = (input_b_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) (PreH9 : (output = (output_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) (PreH10 : (0 < n)) (PreH11 : (0 < vl)) (PreH12 : (vl <= 32)) (PreH13 : (vl <= n)) (PreH14 : (vl = (vadd_vl (n)))) ,
  (UndefStructPredvfloat32m8_t ( &( "vacc" ) ) )
  **  ((&(( &( "vb" ) )->ₛ "s31")) # Float  |-> (rvv_read_value (31) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s30")) # Float  |-> (rvv_read_value (30) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s29")) # Float  |-> (rvv_read_value (29) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s28")) # Float  |-> (rvv_read_value (28) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s27")) # Float  |-> (rvv_read_value (27) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s26")) # Float  |-> (rvv_read_value (26) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s25")) # Float  |-> (rvv_read_value (25) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s24")) # Float  |-> (rvv_read_value (24) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s23")) # Float  |-> (rvv_read_value (23) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s22")) # Float  |-> (rvv_read_value (22) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s21")) # Float  |-> (rvv_read_value (21) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s20")) # Float  |-> (rvv_read_value (20) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s19")) # Float  |-> (rvv_read_value (19) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s18")) # Float  |-> (rvv_read_value (18) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s17")) # Float  |-> (rvv_read_value (17) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s16")) # Float  |-> (rvv_read_value (16) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s15")) # Float  |-> (rvv_read_value (15) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s14")) # Float  |-> (rvv_read_value (14) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s13")) # Float  |-> (rvv_read_value (13) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s12")) # Float  |-> (rvv_read_value (12) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s11")) # Float  |-> (rvv_read_value (11) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s10")) # Float  |-> (rvv_read_value (10) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s9")) # Float  |-> (rvv_read_value (9) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s8")) # Float  |-> (rvv_read_value (8) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s7")) # Float  |-> (rvv_read_value (7) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s6")) # Float  |-> (rvv_read_value (6) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s5")) # Float  |-> (rvv_read_value (5) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s4")) # Float  |-> (rvv_read_value (4) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s3")) # Float  |-> (rvv_read_value (3) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s2")) # Float  |-> (rvv_read_value (2) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s1")) # Float  |-> (rvv_read_value (1) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s0")) # Float  |-> (rvv_read_value (0) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  (FloatArray.full input_b vl (rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)) )
  **  ((&(( &( "va" ) )->ₛ "s31")) # Float  |-> (rvv_read_value (31) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s30")) # Float  |-> (rvv_read_value (30) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s29")) # Float  |-> (rvv_read_value (29) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s28")) # Float  |-> (rvv_read_value (28) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s27")) # Float  |-> (rvv_read_value (27) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s26")) # Float  |-> (rvv_read_value (26) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s25")) # Float  |-> (rvv_read_value (25) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s24")) # Float  |-> (rvv_read_value (24) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s23")) # Float  |-> (rvv_read_value (23) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s22")) # Float  |-> (rvv_read_value (22) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s21")) # Float  |-> (rvv_read_value (21) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s20")) # Float  |-> (rvv_read_value (20) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s19")) # Float  |-> (rvv_read_value (19) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s18")) # Float  |-> (rvv_read_value (18) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s17")) # Float  |-> (rvv_read_value (17) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s16")) # Float  |-> (rvv_read_value (16) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s15")) # Float  |-> (rvv_read_value (15) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s14")) # Float  |-> (rvv_read_value (14) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s13")) # Float  |-> (rvv_read_value (13) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s12")) # Float  |-> (rvv_read_value (12) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s11")) # Float  |-> (rvv_read_value (11) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s10")) # Float  |-> (rvv_read_value (10) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s9")) # Float  |-> (rvv_read_value (9) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s8")) # Float  |-> (rvv_read_value (8) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s7")) # Float  |-> (rvv_read_value (7) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s6")) # Float  |-> (rvv_read_value (6) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s5")) # Float  |-> (rvv_read_value (5) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s4")) # Float  |-> (rvv_read_value (4) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (rvv_read_value (3) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (rvv_read_value (2) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (rvv_read_value (1) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (rvv_read_value (0) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  (FloatArray.full input_a vl (rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)) )
  **  (FloatArray.seg input_a_pre 0 ((batch_pre ÷ 4 ) - n ) (rvv_slice (0) (((batch_pre ÷ 4 ) - n )) (A)) )
  **  (FloatArray.seg input_a_pre (((batch_pre ÷ 4 ) - n ) + vl ) ((batch_pre ÷ 4 ) + 3 ) (rvv_slice ((((batch_pre ÷ 4 ) - n ) + vl )) (((batch_pre ÷ 4 ) + 3 )) (A)) )
  **  (FloatArray.seg input_b_pre 0 ((batch_pre ÷ 4 ) - n ) (rvv_slice (0) (((batch_pre ÷ 4 ) - n )) (B)) )
  **  (FloatArray.seg input_b_pre (((batch_pre ÷ 4 ) - n ) + vl ) ((batch_pre ÷ 4 ) + 3 ) (rvv_slice ((((batch_pre ÷ 4 ) - n ) + vl )) (((batch_pre ÷ 4 ) + 3 )) (B)) )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - n ) (vadd_values (((batch_pre ÷ 4 ) - n )) (A) (B)) )
  **  (FloatArray.undef_full output vl )
  **  (FloatArray.undef_seg output_pre (((batch_pre ÷ 4 ) - n ) + vl ) (batch_pre ÷ 4 ) )
|--
  “ (0 <= vl) ” 
  &&  “ (vl <= 32) ” 
  &&  “ (0 < (batch_pre ÷ 4 )) ” 
  &&  “ ((batch_pre ÷ 4 ) <= 4611686018427387900) ” 
  &&  “ (0 <= n) ” 
  &&  “ (n <= (batch_pre ÷ 4 )) ” 
  &&  “ ((rvv_length (A)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ ((rvv_length (B)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ (input_a = (input_a_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT)))) ” 
  &&  “ (input_b = (input_b_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT)))) ” 
  &&  “ (0 < n) ” 
  &&  “ (0 < vl) ” 
  &&  “ (vl <= 32) ” 
  &&  “ (vl <= n) ” 
  &&  “ (vl = (vadd_vl (n))) ”
  &&  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (rvv_read_value (0) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (rvv_read_value (1) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (rvv_read_value (2) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (rvv_read_value (3) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s4")) # Float  |-> (rvv_read_value (4) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s5")) # Float  |-> (rvv_read_value (5) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s6")) # Float  |-> (rvv_read_value (6) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s7")) # Float  |-> (rvv_read_value (7) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s8")) # Float  |-> (rvv_read_value (8) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s9")) # Float  |-> (rvv_read_value (9) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s10")) # Float  |-> (rvv_read_value (10) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s11")) # Float  |-> (rvv_read_value (11) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s12")) # Float  |-> (rvv_read_value (12) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s13")) # Float  |-> (rvv_read_value (13) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s14")) # Float  |-> (rvv_read_value (14) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s15")) # Float  |-> (rvv_read_value (15) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s16")) # Float  |-> (rvv_read_value (16) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s17")) # Float  |-> (rvv_read_value (17) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s18")) # Float  |-> (rvv_read_value (18) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s19")) # Float  |-> (rvv_read_value (19) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s20")) # Float  |-> (rvv_read_value (20) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s21")) # Float  |-> (rvv_read_value (21) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s22")) # Float  |-> (rvv_read_value (22) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s23")) # Float  |-> (rvv_read_value (23) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s24")) # Float  |-> (rvv_read_value (24) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s25")) # Float  |-> (rvv_read_value (25) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s26")) # Float  |-> (rvv_read_value (26) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s27")) # Float  |-> (rvv_read_value (27) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s28")) # Float  |-> (rvv_read_value (28) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s29")) # Float  |-> (rvv_read_value (29) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s30")) # Float  |-> (rvv_read_value (30) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s31")) # Float  |-> (rvv_read_value (31) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "vb" ) )->ₛ "s0")) # Float  |-> (rvv_read_value (0) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s1")) # Float  |-> (rvv_read_value (1) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s2")) # Float  |-> (rvv_read_value (2) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s3")) # Float  |-> (rvv_read_value (3) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s4")) # Float  |-> (rvv_read_value (4) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s5")) # Float  |-> (rvv_read_value (5) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s6")) # Float  |-> (rvv_read_value (6) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s7")) # Float  |-> (rvv_read_value (7) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s8")) # Float  |-> (rvv_read_value (8) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s9")) # Float  |-> (rvv_read_value (9) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s10")) # Float  |-> (rvv_read_value (10) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s11")) # Float  |-> (rvv_read_value (11) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s12")) # Float  |-> (rvv_read_value (12) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s13")) # Float  |-> (rvv_read_value (13) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s14")) # Float  |-> (rvv_read_value (14) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s15")) # Float  |-> (rvv_read_value (15) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s16")) # Float  |-> (rvv_read_value (16) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s17")) # Float  |-> (rvv_read_value (17) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s18")) # Float  |-> (rvv_read_value (18) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s19")) # Float  |-> (rvv_read_value (19) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s20")) # Float  |-> (rvv_read_value (20) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s21")) # Float  |-> (rvv_read_value (21) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s22")) # Float  |-> (rvv_read_value (22) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s23")) # Float  |-> (rvv_read_value (23) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s24")) # Float  |-> (rvv_read_value (24) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s25")) # Float  |-> (rvv_read_value (25) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s26")) # Float  |-> (rvv_read_value (26) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s27")) # Float  |-> (rvv_read_value (27) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s28")) # Float  |-> (rvv_read_value (28) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s29")) # Float  |-> (rvv_read_value (29) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s30")) # Float  |-> (rvv_read_value (30) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s31")) # Float  |-> (rvv_read_value (31) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  (UndefStructPredvfloat32m8_t ( &( "vacc" ) ) )
  **  (FloatArray.full input_b vl (rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)) )
  **  (FloatArray.full input_a vl (rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)) )
  **  (FloatArray.seg input_a_pre 0 ((batch_pre ÷ 4 ) - n ) (rvv_slice (0) (((batch_pre ÷ 4 ) - n )) (A)) )
  **  (FloatArray.seg input_a_pre (((batch_pre ÷ 4 ) - n ) + vl ) ((batch_pre ÷ 4 ) + 3 ) (rvv_slice ((((batch_pre ÷ 4 ) - n ) + vl )) (((batch_pre ÷ 4 ) + 3 )) (A)) )
  **  (FloatArray.seg input_b_pre 0 ((batch_pre ÷ 4 ) - n ) (rvv_slice (0) (((batch_pre ÷ 4 ) - n )) (B)) )
  **  (FloatArray.seg input_b_pre (((batch_pre ÷ 4 ) - n ) + vl ) ((batch_pre ÷ 4 ) + 3 ) (rvv_slice ((((batch_pre ÷ 4 ) - n ) + vl )) (((batch_pre ÷ 4 ) + 3 )) (B)) )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - n ) (vadd_values (((batch_pre ÷ 4 ) - n )) (A) (B)) )
  **  (FloatArray.undef_full output vl )
  **  (FloatArray.undef_seg output_pre (((batch_pre ÷ 4 ) - n ) + vl ) (batch_pre ÷ 4 ) )
.

Definition test_rvv_partial_solve_wit_11 := test_rvv_partial_solve_wit_11_pure -> test_rvv_partial_solve_wit_11_aux.

Definition test_rvv_partial_solve_wit_12 := 
forall (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (n: Z) (input_a: Z) (input_b: Z) (output: Z) (vl: Z) (retval: Z) (PreH1 : (0 < (batch_pre ÷ 4 ))) (PreH2 : ((batch_pre ÷ 4 ) <= 4611686018427387900)) (PreH3 : (0 <= n)) (PreH4 : (n <= (batch_pre ÷ 4 ))) (PreH5 : ((rvv_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH6 : ((rvv_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH7 : (input_a = (input_a_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) (PreH8 : (input_b = (input_b_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) (PreH9 : (output = (output_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) (PreH10 : (0 < n)) (PreH11 : (0 < vl)) (PreH12 : (vl <= 32)) (PreH13 : (vl <= n)) (PreH14 : (vl = (vadd_vl (n)))) ,
  ((&((retval)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> (vadd_active_add (0) (vl) ((rvv_read_value (0) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (0) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> (vadd_active_add (1) (vl) ((rvv_read_value (1) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (1) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> (vadd_active_add (2) (vl) ((rvv_read_value (2) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (2) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> (vadd_active_add (3) (vl) ((rvv_read_value (3) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (3) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> (vadd_active_add (4) (vl) ((rvv_read_value (4) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (4) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> (vadd_active_add (5) (vl) ((rvv_read_value (5) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (5) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> (vadd_active_add (6) (vl) ((rvv_read_value (6) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (6) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> (vadd_active_add (7) (vl) ((rvv_read_value (7) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (7) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> (vadd_active_add (8) (vl) ((rvv_read_value (8) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (8) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> (vadd_active_add (9) (vl) ((rvv_read_value (9) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (9) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> (vadd_active_add (10) (vl) ((rvv_read_value (10) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (10) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> (vadd_active_add (11) (vl) ((rvv_read_value (11) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (11) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> (vadd_active_add (12) (vl) ((rvv_read_value (12) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (12) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> (vadd_active_add (13) (vl) ((rvv_read_value (13) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (13) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> (vadd_active_add (14) (vl) ((rvv_read_value (14) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (14) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> (vadd_active_add (15) (vl) ((rvv_read_value (15) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (15) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> (vadd_active_add (16) (vl) ((rvv_read_value (16) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (16) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> (vadd_active_add (17) (vl) ((rvv_read_value (17) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (17) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> (vadd_active_add (18) (vl) ((rvv_read_value (18) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (18) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> (vadd_active_add (19) (vl) ((rvv_read_value (19) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (19) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> (vadd_active_add (20) (vl) ((rvv_read_value (20) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (20) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> (vadd_active_add (21) (vl) ((rvv_read_value (21) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (21) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> (vadd_active_add (22) (vl) ((rvv_read_value (22) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (22) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> (vadd_active_add (23) (vl) ((rvv_read_value (23) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (23) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> (vadd_active_add (24) (vl) ((rvv_read_value (24) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (24) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> (vadd_active_add (25) (vl) ((rvv_read_value (25) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (25) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> (vadd_active_add (26) (vl) ((rvv_read_value (26) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (26) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> (vadd_active_add (27) (vl) ((rvv_read_value (27) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (27) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> (vadd_active_add (28) (vl) ((rvv_read_value (28) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (28) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> (vadd_active_add (29) (vl) ((rvv_read_value (29) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (29) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> (vadd_active_add (30) (vl) ((rvv_read_value (30) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (30) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> (vadd_active_add (31) (vl) ((rvv_read_value (31) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (31) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  (UndefStructPredvfloat32m8_t ( &( "vacc" ) ) )
  **  (FloatArray.full input_b vl (rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)) )
  **  (FloatArray.full input_a vl (rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)) )
  **  (FloatArray.seg input_a_pre 0 ((batch_pre ÷ 4 ) - n ) (rvv_slice (0) (((batch_pre ÷ 4 ) - n )) (A)) )
  **  (FloatArray.seg input_a_pre (((batch_pre ÷ 4 ) - n ) + vl ) ((batch_pre ÷ 4 ) + 3 ) (rvv_slice ((((batch_pre ÷ 4 ) - n ) + vl )) (((batch_pre ÷ 4 ) + 3 )) (A)) )
  **  (FloatArray.seg input_b_pre 0 ((batch_pre ÷ 4 ) - n ) (rvv_slice (0) (((batch_pre ÷ 4 ) - n )) (B)) )
  **  (FloatArray.seg input_b_pre (((batch_pre ÷ 4 ) - n ) + vl ) ((batch_pre ÷ 4 ) + 3 ) (rvv_slice ((((batch_pre ÷ 4 ) - n ) + vl )) (((batch_pre ÷ 4 ) + 3 )) (B)) )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - n ) (vadd_values (((batch_pre ÷ 4 ) - n )) (A) (B)) )
  **  (FloatArray.undef_full output vl )
  **  (FloatArray.undef_seg output_pre (((batch_pre ÷ 4 ) - n ) + vl ) (batch_pre ÷ 4 ) )
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (rvv_read_value (0) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (rvv_read_value (1) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (rvv_read_value (2) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (rvv_read_value (3) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s4")) # Float  |-> (rvv_read_value (4) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s5")) # Float  |-> (rvv_read_value (5) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s6")) # Float  |-> (rvv_read_value (6) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s7")) # Float  |-> (rvv_read_value (7) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s8")) # Float  |-> (rvv_read_value (8) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s9")) # Float  |-> (rvv_read_value (9) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s10")) # Float  |-> (rvv_read_value (10) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s11")) # Float  |-> (rvv_read_value (11) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s12")) # Float  |-> (rvv_read_value (12) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s13")) # Float  |-> (rvv_read_value (13) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s14")) # Float  |-> (rvv_read_value (14) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s15")) # Float  |-> (rvv_read_value (15) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s16")) # Float  |-> (rvv_read_value (16) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s17")) # Float  |-> (rvv_read_value (17) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s18")) # Float  |-> (rvv_read_value (18) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s19")) # Float  |-> (rvv_read_value (19) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s20")) # Float  |-> (rvv_read_value (20) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s21")) # Float  |-> (rvv_read_value (21) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s22")) # Float  |-> (rvv_read_value (22) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s23")) # Float  |-> (rvv_read_value (23) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s24")) # Float  |-> (rvv_read_value (24) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s25")) # Float  |-> (rvv_read_value (25) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s26")) # Float  |-> (rvv_read_value (26) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s27")) # Float  |-> (rvv_read_value (27) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s28")) # Float  |-> (rvv_read_value (28) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s29")) # Float  |-> (rvv_read_value (29) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s30")) # Float  |-> (rvv_read_value (30) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s31")) # Float  |-> (rvv_read_value (31) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "vb" ) )->ₛ "s0")) # Float  |-> (rvv_read_value (0) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s1")) # Float  |-> (rvv_read_value (1) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s2")) # Float  |-> (rvv_read_value (2) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s3")) # Float  |-> (rvv_read_value (3) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s4")) # Float  |-> (rvv_read_value (4) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s5")) # Float  |-> (rvv_read_value (5) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s6")) # Float  |-> (rvv_read_value (6) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s7")) # Float  |-> (rvv_read_value (7) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s8")) # Float  |-> (rvv_read_value (8) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s9")) # Float  |-> (rvv_read_value (9) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s10")) # Float  |-> (rvv_read_value (10) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s11")) # Float  |-> (rvv_read_value (11) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s12")) # Float  |-> (rvv_read_value (12) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s13")) # Float  |-> (rvv_read_value (13) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s14")) # Float  |-> (rvv_read_value (14) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s15")) # Float  |-> (rvv_read_value (15) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s16")) # Float  |-> (rvv_read_value (16) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s17")) # Float  |-> (rvv_read_value (17) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s18")) # Float  |-> (rvv_read_value (18) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s19")) # Float  |-> (rvv_read_value (19) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s20")) # Float  |-> (rvv_read_value (20) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s21")) # Float  |-> (rvv_read_value (21) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s22")) # Float  |-> (rvv_read_value (22) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s23")) # Float  |-> (rvv_read_value (23) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s24")) # Float  |-> (rvv_read_value (24) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s25")) # Float  |-> (rvv_read_value (25) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s26")) # Float  |-> (rvv_read_value (26) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s27")) # Float  |-> (rvv_read_value (27) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s28")) # Float  |-> (rvv_read_value (28) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s29")) # Float  |-> (rvv_read_value (29) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s30")) # Float  |-> (rvv_read_value (30) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s31")) # Float  |-> (rvv_read_value (31) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
|--
  “ (0 < (batch_pre ÷ 4 )) ” 
  &&  “ ((batch_pre ÷ 4 ) <= 4611686018427387900) ” 
  &&  “ (0 <= n) ” 
  &&  “ (n <= (batch_pre ÷ 4 )) ” 
  &&  “ ((rvv_length (A)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ ((rvv_length (B)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ (input_a = (input_a_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT)))) ” 
  &&  “ (input_b = (input_b_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT)))) ” 
  &&  “ (0 < n) ” 
  &&  “ (0 < vl) ” 
  &&  “ (vl <= 32) ” 
  &&  “ (vl <= n) ” 
  &&  “ (vl = (vadd_vl (n))) ”
  &&  ((&(( &( "vacc" ) )->ₛ "s31")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> (vadd_active_add (31) (vl) ((rvv_read_value (31) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (31) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s30")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> (vadd_active_add (30) (vl) ((rvv_read_value (30) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (30) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s29")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> (vadd_active_add (29) (vl) ((rvv_read_value (29) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (29) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s28")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> (vadd_active_add (28) (vl) ((rvv_read_value (28) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (28) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s27")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> (vadd_active_add (27) (vl) ((rvv_read_value (27) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (27) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s26")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> (vadd_active_add (26) (vl) ((rvv_read_value (26) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (26) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s25")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> (vadd_active_add (25) (vl) ((rvv_read_value (25) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (25) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s24")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> (vadd_active_add (24) (vl) ((rvv_read_value (24) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (24) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s23")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> (vadd_active_add (23) (vl) ((rvv_read_value (23) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (23) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s22")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> (vadd_active_add (22) (vl) ((rvv_read_value (22) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (22) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s21")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> (vadd_active_add (21) (vl) ((rvv_read_value (21) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (21) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s20")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> (vadd_active_add (20) (vl) ((rvv_read_value (20) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (20) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s19")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> (vadd_active_add (19) (vl) ((rvv_read_value (19) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (19) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s18")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> (vadd_active_add (18) (vl) ((rvv_read_value (18) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (18) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s17")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> (vadd_active_add (17) (vl) ((rvv_read_value (17) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (17) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s16")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> (vadd_active_add (16) (vl) ((rvv_read_value (16) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (16) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s15")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> (vadd_active_add (15) (vl) ((rvv_read_value (15) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (15) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s14")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> (vadd_active_add (14) (vl) ((rvv_read_value (14) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (14) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s13")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> (vadd_active_add (13) (vl) ((rvv_read_value (13) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (13) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s12")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> (vadd_active_add (12) (vl) ((rvv_read_value (12) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (12) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s11")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> (vadd_active_add (11) (vl) ((rvv_read_value (11) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (11) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s10")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> (vadd_active_add (10) (vl) ((rvv_read_value (10) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (10) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s9")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> (vadd_active_add (9) (vl) ((rvv_read_value (9) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (9) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s8")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> (vadd_active_add (8) (vl) ((rvv_read_value (8) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (8) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s7")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> (vadd_active_add (7) (vl) ((rvv_read_value (7) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (7) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s6")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> (vadd_active_add (6) (vl) ((rvv_read_value (6) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (6) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s5")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> (vadd_active_add (5) (vl) ((rvv_read_value (5) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (5) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s4")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> (vadd_active_add (4) (vl) ((rvv_read_value (4) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (4) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> (vadd_active_add (3) (vl) ((rvv_read_value (3) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (3) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> (vadd_active_add (2) (vl) ((rvv_read_value (2) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (2) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> (vadd_active_add (1) (vl) ((rvv_read_value (1) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (1) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s0")) # Float  |->_)
  **  ((&((retval)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> (vadd_active_add (0) (vl) ((rvv_read_value (0) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (0) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  (FloatArray.full input_b vl (rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)) )
  **  (FloatArray.full input_a vl (rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)) )
  **  (FloatArray.seg input_a_pre 0 ((batch_pre ÷ 4 ) - n ) (rvv_slice (0) (((batch_pre ÷ 4 ) - n )) (A)) )
  **  (FloatArray.seg input_a_pre (((batch_pre ÷ 4 ) - n ) + vl ) ((batch_pre ÷ 4 ) + 3 ) (rvv_slice ((((batch_pre ÷ 4 ) - n ) + vl )) (((batch_pre ÷ 4 ) + 3 )) (A)) )
  **  (FloatArray.seg input_b_pre 0 ((batch_pre ÷ 4 ) - n ) (rvv_slice (0) (((batch_pre ÷ 4 ) - n )) (B)) )
  **  (FloatArray.seg input_b_pre (((batch_pre ÷ 4 ) - n ) + vl ) ((batch_pre ÷ 4 ) + 3 ) (rvv_slice ((((batch_pre ÷ 4 ) - n ) + vl )) (((batch_pre ÷ 4 ) + 3 )) (B)) )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - n ) (vadd_values (((batch_pre ÷ 4 ) - n )) (A) (B)) )
  **  (FloatArray.undef_full output vl )
  **  (FloatArray.undef_seg output_pre (((batch_pre ÷ 4 ) - n ) + vl ) (batch_pre ÷ 4 ) )
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (rvv_read_value (0) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (rvv_read_value (1) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (rvv_read_value (2) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (rvv_read_value (3) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s4")) # Float  |-> (rvv_read_value (4) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s5")) # Float  |-> (rvv_read_value (5) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s6")) # Float  |-> (rvv_read_value (6) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s7")) # Float  |-> (rvv_read_value (7) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s8")) # Float  |-> (rvv_read_value (8) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s9")) # Float  |-> (rvv_read_value (9) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s10")) # Float  |-> (rvv_read_value (10) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s11")) # Float  |-> (rvv_read_value (11) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s12")) # Float  |-> (rvv_read_value (12) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s13")) # Float  |-> (rvv_read_value (13) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s14")) # Float  |-> (rvv_read_value (14) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s15")) # Float  |-> (rvv_read_value (15) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s16")) # Float  |-> (rvv_read_value (16) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s17")) # Float  |-> (rvv_read_value (17) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s18")) # Float  |-> (rvv_read_value (18) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s19")) # Float  |-> (rvv_read_value (19) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s20")) # Float  |-> (rvv_read_value (20) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s21")) # Float  |-> (rvv_read_value (21) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s22")) # Float  |-> (rvv_read_value (22) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s23")) # Float  |-> (rvv_read_value (23) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s24")) # Float  |-> (rvv_read_value (24) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s25")) # Float  |-> (rvv_read_value (25) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s26")) # Float  |-> (rvv_read_value (26) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s27")) # Float  |-> (rvv_read_value (27) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s28")) # Float  |-> (rvv_read_value (28) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s29")) # Float  |-> (rvv_read_value (29) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s30")) # Float  |-> (rvv_read_value (30) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s31")) # Float  |-> (rvv_read_value (31) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "vb" ) )->ₛ "s0")) # Float  |-> (rvv_read_value (0) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s1")) # Float  |-> (rvv_read_value (1) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s2")) # Float  |-> (rvv_read_value (2) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s3")) # Float  |-> (rvv_read_value (3) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s4")) # Float  |-> (rvv_read_value (4) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s5")) # Float  |-> (rvv_read_value (5) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s6")) # Float  |-> (rvv_read_value (6) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s7")) # Float  |-> (rvv_read_value (7) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s8")) # Float  |-> (rvv_read_value (8) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s9")) # Float  |-> (rvv_read_value (9) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s10")) # Float  |-> (rvv_read_value (10) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s11")) # Float  |-> (rvv_read_value (11) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s12")) # Float  |-> (rvv_read_value (12) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s13")) # Float  |-> (rvv_read_value (13) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s14")) # Float  |-> (rvv_read_value (14) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s15")) # Float  |-> (rvv_read_value (15) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s16")) # Float  |-> (rvv_read_value (16) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s17")) # Float  |-> (rvv_read_value (17) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s18")) # Float  |-> (rvv_read_value (18) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s19")) # Float  |-> (rvv_read_value (19) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s20")) # Float  |-> (rvv_read_value (20) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s21")) # Float  |-> (rvv_read_value (21) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s22")) # Float  |-> (rvv_read_value (22) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s23")) # Float  |-> (rvv_read_value (23) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s24")) # Float  |-> (rvv_read_value (24) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s25")) # Float  |-> (rvv_read_value (25) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s26")) # Float  |-> (rvv_read_value (26) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s27")) # Float  |-> (rvv_read_value (27) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s28")) # Float  |-> (rvv_read_value (28) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s29")) # Float  |-> (rvv_read_value (29) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s30")) # Float  |-> (rvv_read_value (30) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s31")) # Float  |-> (rvv_read_value (31) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
.

Definition test_rvv_partial_solve_wit_13_pure := 
forall (params_pre: Z) (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (n: Z) (input_a: Z) (input_b: Z) (output: Z) (vl: Z) (PreH1 : (0 < (batch_pre ÷ 4 ))) (PreH2 : ((batch_pre ÷ 4 ) <= 4611686018427387900)) (PreH3 : (0 <= n)) (PreH4 : (n <= (batch_pre ÷ 4 ))) (PreH5 : ((rvv_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH6 : ((rvv_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH7 : (input_a = (input_a_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) (PreH8 : (input_b = (input_b_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) (PreH9 : (output = (output_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) (PreH10 : (0 < n)) (PreH11 : (0 < vl)) (PreH12 : (vl <= 32)) (PreH13 : (vl <= n)) (PreH14 : (vl = (vadd_vl (n)))) ,
  ((&(( &( "vacc" ) )->ₛ "s31")) # Float  |-> (vadd_active_add (31) (vl) ((rvv_read_value (31) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (31) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s30")) # Float  |-> (vadd_active_add (30) (vl) ((rvv_read_value (30) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (30) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s29")) # Float  |-> (vadd_active_add (29) (vl) ((rvv_read_value (29) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (29) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s28")) # Float  |-> (vadd_active_add (28) (vl) ((rvv_read_value (28) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (28) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s27")) # Float  |-> (vadd_active_add (27) (vl) ((rvv_read_value (27) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (27) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s26")) # Float  |-> (vadd_active_add (26) (vl) ((rvv_read_value (26) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (26) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s25")) # Float  |-> (vadd_active_add (25) (vl) ((rvv_read_value (25) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (25) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s24")) # Float  |-> (vadd_active_add (24) (vl) ((rvv_read_value (24) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (24) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s23")) # Float  |-> (vadd_active_add (23) (vl) ((rvv_read_value (23) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (23) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s22")) # Float  |-> (vadd_active_add (22) (vl) ((rvv_read_value (22) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (22) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s21")) # Float  |-> (vadd_active_add (21) (vl) ((rvv_read_value (21) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (21) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s20")) # Float  |-> (vadd_active_add (20) (vl) ((rvv_read_value (20) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (20) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s19")) # Float  |-> (vadd_active_add (19) (vl) ((rvv_read_value (19) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (19) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s18")) # Float  |-> (vadd_active_add (18) (vl) ((rvv_read_value (18) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (18) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s17")) # Float  |-> (vadd_active_add (17) (vl) ((rvv_read_value (17) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (17) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s16")) # Float  |-> (vadd_active_add (16) (vl) ((rvv_read_value (16) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (16) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s15")) # Float  |-> (vadd_active_add (15) (vl) ((rvv_read_value (15) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (15) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s14")) # Float  |-> (vadd_active_add (14) (vl) ((rvv_read_value (14) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (14) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s13")) # Float  |-> (vadd_active_add (13) (vl) ((rvv_read_value (13) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (13) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s12")) # Float  |-> (vadd_active_add (12) (vl) ((rvv_read_value (12) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (12) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s11")) # Float  |-> (vadd_active_add (11) (vl) ((rvv_read_value (11) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (11) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s10")) # Float  |-> (vadd_active_add (10) (vl) ((rvv_read_value (10) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (10) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s9")) # Float  |-> (vadd_active_add (9) (vl) ((rvv_read_value (9) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (9) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s8")) # Float  |-> (vadd_active_add (8) (vl) ((rvv_read_value (8) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (8) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s7")) # Float  |-> (vadd_active_add (7) (vl) ((rvv_read_value (7) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (7) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s6")) # Float  |-> (vadd_active_add (6) (vl) ((rvv_read_value (6) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (6) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s5")) # Float  |-> (vadd_active_add (5) (vl) ((rvv_read_value (5) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (5) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s4")) # Float  |-> (vadd_active_add (4) (vl) ((rvv_read_value (4) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (4) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # Float  |-> (vadd_active_add (3) (vl) ((rvv_read_value (3) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (3) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # Float  |-> (vadd_active_add (2) (vl) ((rvv_read_value (2) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (2) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # Float  |-> (vadd_active_add (1) (vl) ((rvv_read_value (1) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (1) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s0")) # Float  |-> (vadd_active_add (0) (vl) ((rvv_read_value (0) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (0) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  (FloatArray.full input_b vl (rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)) )
  **  (FloatArray.full input_a vl (rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)) )
  **  ((( &( "batch" ) )) # UInt64  |-> batch_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "n" ) )) # UInt64  |-> n)
  **  ((( &( "input_a" ) )) # Ptr  |-> input_a)
  **  ((( &( "input_b" ) )) # Ptr  |-> input_b)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  ((( &( "vl" ) )) # UInt64  |-> vl)
  **  (FloatArray.seg input_a_pre 0 ((batch_pre ÷ 4 ) - n ) (rvv_slice (0) (((batch_pre ÷ 4 ) - n )) (A)) )
  **  (FloatArray.seg input_a_pre (((batch_pre ÷ 4 ) - n ) + vl ) ((batch_pre ÷ 4 ) + 3 ) (rvv_slice ((((batch_pre ÷ 4 ) - n ) + vl )) (((batch_pre ÷ 4 ) + 3 )) (A)) )
  **  (FloatArray.seg input_b_pre 0 ((batch_pre ÷ 4 ) - n ) (rvv_slice (0) (((batch_pre ÷ 4 ) - n )) (B)) )
  **  (FloatArray.seg input_b_pre (((batch_pre ÷ 4 ) - n ) + vl ) ((batch_pre ÷ 4 ) + 3 ) (rvv_slice ((((batch_pre ÷ 4 ) - n ) + vl )) (((batch_pre ÷ 4 ) + 3 )) (B)) )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - n ) (vadd_values (((batch_pre ÷ 4 ) - n )) (A) (B)) )
  **  (FloatArray.undef_full output vl )
  **  (FloatArray.undef_seg output_pre (((batch_pre ÷ 4 ) - n ) + vl ) (batch_pre ÷ 4 ) )
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (rvv_read_value (0) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (rvv_read_value (1) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (rvv_read_value (2) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (rvv_read_value (3) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s4")) # Float  |-> (rvv_read_value (4) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s5")) # Float  |-> (rvv_read_value (5) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s6")) # Float  |-> (rvv_read_value (6) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s7")) # Float  |-> (rvv_read_value (7) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s8")) # Float  |-> (rvv_read_value (8) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s9")) # Float  |-> (rvv_read_value (9) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s10")) # Float  |-> (rvv_read_value (10) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s11")) # Float  |-> (rvv_read_value (11) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s12")) # Float  |-> (rvv_read_value (12) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s13")) # Float  |-> (rvv_read_value (13) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s14")) # Float  |-> (rvv_read_value (14) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s15")) # Float  |-> (rvv_read_value (15) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s16")) # Float  |-> (rvv_read_value (16) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s17")) # Float  |-> (rvv_read_value (17) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s18")) # Float  |-> (rvv_read_value (18) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s19")) # Float  |-> (rvv_read_value (19) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s20")) # Float  |-> (rvv_read_value (20) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s21")) # Float  |-> (rvv_read_value (21) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s22")) # Float  |-> (rvv_read_value (22) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s23")) # Float  |-> (rvv_read_value (23) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s24")) # Float  |-> (rvv_read_value (24) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s25")) # Float  |-> (rvv_read_value (25) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s26")) # Float  |-> (rvv_read_value (26) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s27")) # Float  |-> (rvv_read_value (27) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s28")) # Float  |-> (rvv_read_value (28) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s29")) # Float  |-> (rvv_read_value (29) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s30")) # Float  |-> (rvv_read_value (30) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s31")) # Float  |-> (rvv_read_value (31) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "vb" ) )->ₛ "s0")) # Float  |-> (rvv_read_value (0) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s1")) # Float  |-> (rvv_read_value (1) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s2")) # Float  |-> (rvv_read_value (2) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s3")) # Float  |-> (rvv_read_value (3) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s4")) # Float  |-> (rvv_read_value (4) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s5")) # Float  |-> (rvv_read_value (5) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s6")) # Float  |-> (rvv_read_value (6) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s7")) # Float  |-> (rvv_read_value (7) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s8")) # Float  |-> (rvv_read_value (8) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s9")) # Float  |-> (rvv_read_value (9) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s10")) # Float  |-> (rvv_read_value (10) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s11")) # Float  |-> (rvv_read_value (11) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s12")) # Float  |-> (rvv_read_value (12) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s13")) # Float  |-> (rvv_read_value (13) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s14")) # Float  |-> (rvv_read_value (14) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s15")) # Float  |-> (rvv_read_value (15) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s16")) # Float  |-> (rvv_read_value (16) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s17")) # Float  |-> (rvv_read_value (17) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s18")) # Float  |-> (rvv_read_value (18) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s19")) # Float  |-> (rvv_read_value (19) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s20")) # Float  |-> (rvv_read_value (20) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s21")) # Float  |-> (rvv_read_value (21) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s22")) # Float  |-> (rvv_read_value (22) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s23")) # Float  |-> (rvv_read_value (23) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s24")) # Float  |-> (rvv_read_value (24) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s25")) # Float  |-> (rvv_read_value (25) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s26")) # Float  |-> (rvv_read_value (26) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s27")) # Float  |-> (rvv_read_value (27) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s28")) # Float  |-> (rvv_read_value (28) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s29")) # Float  |-> (rvv_read_value (29) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s30")) # Float  |-> (rvv_read_value (30) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s31")) # Float  |-> (rvv_read_value (31) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
|--
  “ (0 <= vl) ” 
  &&  “ (vl <= 32) ” 
  &&  “ ((rvv_pack32 ((vadd_active_add (0) (vl) ((rvv_read_value (0) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (0) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (1) (vl) ((rvv_read_value (1) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (1) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (2) (vl) ((rvv_read_value (2) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (2) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (3) (vl) ((rvv_read_value (3) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (3) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (4) (vl) ((rvv_read_value (4) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (4) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (5) (vl) ((rvv_read_value (5) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (5) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (6) (vl) ((rvv_read_value (6) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (6) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (7) (vl) ((rvv_read_value (7) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (7) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (8) (vl) ((rvv_read_value (8) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (8) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (9) (vl) ((rvv_read_value (9) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (9) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (10) (vl) ((rvv_read_value (10) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (10) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (11) (vl) ((rvv_read_value (11) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (11) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (12) (vl) ((rvv_read_value (12) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (12) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (13) (vl) ((rvv_read_value (13) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (13) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (14) (vl) ((rvv_read_value (14) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (14) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (15) (vl) ((rvv_read_value (15) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (15) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (16) (vl) ((rvv_read_value (16) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (16) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (17) (vl) ((rvv_read_value (17) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (17) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (18) (vl) ((rvv_read_value (18) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (18) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (19) (vl) ((rvv_read_value (19) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (19) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (20) (vl) ((rvv_read_value (20) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (20) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (21) (vl) ((rvv_read_value (21) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (21) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (22) (vl) ((rvv_read_value (22) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (22) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (23) (vl) ((rvv_read_value (23) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (23) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (24) (vl) ((rvv_read_value (24) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (24) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (25) (vl) ((rvv_read_value (25) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (25) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (26) (vl) ((rvv_read_value (26) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (26) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (27) (vl) ((rvv_read_value (27) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (27) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (28) (vl) ((rvv_read_value (28) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (28) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (29) (vl) ((rvv_read_value (29) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (29) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (30) (vl) ((rvv_read_value (30) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (30) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (31) (vl) ((rvv_read_value (31) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (31) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))) = (rvv_pack32 ((vadd_active_add (0) (vl) ((rvv_read_value (0) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (0) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (1) (vl) ((rvv_read_value (1) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (1) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (2) (vl) ((rvv_read_value (2) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (2) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (3) (vl) ((rvv_read_value (3) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (3) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (4) (vl) ((rvv_read_value (4) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (4) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (5) (vl) ((rvv_read_value (5) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (5) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (6) (vl) ((rvv_read_value (6) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (6) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (7) (vl) ((rvv_read_value (7) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (7) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (8) (vl) ((rvv_read_value (8) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (8) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (9) (vl) ((rvv_read_value (9) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (9) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (10) (vl) ((rvv_read_value (10) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (10) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (11) (vl) ((rvv_read_value (11) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (11) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (12) (vl) ((rvv_read_value (12) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (12) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (13) (vl) ((rvv_read_value (13) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (13) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (14) (vl) ((rvv_read_value (14) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (14) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (15) (vl) ((rvv_read_value (15) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (15) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (16) (vl) ((rvv_read_value (16) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (16) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (17) (vl) ((rvv_read_value (17) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (17) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (18) (vl) ((rvv_read_value (18) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (18) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (19) (vl) ((rvv_read_value (19) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (19) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (20) (vl) ((rvv_read_value (20) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (20) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (21) (vl) ((rvv_read_value (21) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (21) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (22) (vl) ((rvv_read_value (22) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (22) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (23) (vl) ((rvv_read_value (23) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (23) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (24) (vl) ((rvv_read_value (24) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (24) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (25) (vl) ((rvv_read_value (25) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (25) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (26) (vl) ((rvv_read_value (26) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (26) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (27) (vl) ((rvv_read_value (27) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (27) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (28) (vl) ((rvv_read_value (28) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (28) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (29) (vl) ((rvv_read_value (29) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (29) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (30) (vl) ((rvv_read_value (30) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (30) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (31) (vl) ((rvv_read_value (31) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (31) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))))) ”
.

Definition test_rvv_partial_solve_wit_13_aux := 
forall (output_pre: Z) (input_b_pre: Z) (input_a_pre: Z) (batch_pre: Z) (B: (@list fp32)) (A: (@list fp32)) (n: Z) (input_a: Z) (input_b: Z) (output: Z) (vl: Z) (PreH1 : (0 < (batch_pre ÷ 4 ))) (PreH2 : ((batch_pre ÷ 4 ) <= 4611686018427387900)) (PreH3 : (0 <= n)) (PreH4 : (n <= (batch_pre ÷ 4 ))) (PreH5 : ((rvv_length (A)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH6 : ((rvv_length (B)) = ((batch_pre ÷ 4 ) + 3 ))) (PreH7 : (input_a = (input_a_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) (PreH8 : (input_b = (input_b_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) (PreH9 : (output = (output_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) (PreH10 : (0 < n)) (PreH11 : (0 < vl)) (PreH12 : (vl <= 32)) (PreH13 : (vl <= n)) (PreH14 : (vl = (vadd_vl (n)))) ,
  ((&(( &( "vacc" ) )->ₛ "s31")) # Float  |-> (vadd_active_add (31) (vl) ((rvv_read_value (31) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (31) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s30")) # Float  |-> (vadd_active_add (30) (vl) ((rvv_read_value (30) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (30) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s29")) # Float  |-> (vadd_active_add (29) (vl) ((rvv_read_value (29) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (29) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s28")) # Float  |-> (vadd_active_add (28) (vl) ((rvv_read_value (28) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (28) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s27")) # Float  |-> (vadd_active_add (27) (vl) ((rvv_read_value (27) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (27) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s26")) # Float  |-> (vadd_active_add (26) (vl) ((rvv_read_value (26) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (26) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s25")) # Float  |-> (vadd_active_add (25) (vl) ((rvv_read_value (25) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (25) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s24")) # Float  |-> (vadd_active_add (24) (vl) ((rvv_read_value (24) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (24) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s23")) # Float  |-> (vadd_active_add (23) (vl) ((rvv_read_value (23) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (23) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s22")) # Float  |-> (vadd_active_add (22) (vl) ((rvv_read_value (22) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (22) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s21")) # Float  |-> (vadd_active_add (21) (vl) ((rvv_read_value (21) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (21) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s20")) # Float  |-> (vadd_active_add (20) (vl) ((rvv_read_value (20) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (20) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s19")) # Float  |-> (vadd_active_add (19) (vl) ((rvv_read_value (19) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (19) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s18")) # Float  |-> (vadd_active_add (18) (vl) ((rvv_read_value (18) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (18) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s17")) # Float  |-> (vadd_active_add (17) (vl) ((rvv_read_value (17) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (17) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s16")) # Float  |-> (vadd_active_add (16) (vl) ((rvv_read_value (16) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (16) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s15")) # Float  |-> (vadd_active_add (15) (vl) ((rvv_read_value (15) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (15) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s14")) # Float  |-> (vadd_active_add (14) (vl) ((rvv_read_value (14) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (14) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s13")) # Float  |-> (vadd_active_add (13) (vl) ((rvv_read_value (13) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (13) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s12")) # Float  |-> (vadd_active_add (12) (vl) ((rvv_read_value (12) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (12) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s11")) # Float  |-> (vadd_active_add (11) (vl) ((rvv_read_value (11) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (11) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s10")) # Float  |-> (vadd_active_add (10) (vl) ((rvv_read_value (10) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (10) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s9")) # Float  |-> (vadd_active_add (9) (vl) ((rvv_read_value (9) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (9) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s8")) # Float  |-> (vadd_active_add (8) (vl) ((rvv_read_value (8) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (8) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s7")) # Float  |-> (vadd_active_add (7) (vl) ((rvv_read_value (7) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (7) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s6")) # Float  |-> (vadd_active_add (6) (vl) ((rvv_read_value (6) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (6) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s5")) # Float  |-> (vadd_active_add (5) (vl) ((rvv_read_value (5) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (5) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s4")) # Float  |-> (vadd_active_add (4) (vl) ((rvv_read_value (4) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (4) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # Float  |-> (vadd_active_add (3) (vl) ((rvv_read_value (3) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (3) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # Float  |-> (vadd_active_add (2) (vl) ((rvv_read_value (2) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (2) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # Float  |-> (vadd_active_add (1) (vl) ((rvv_read_value (1) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (1) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s0")) # Float  |-> (vadd_active_add (0) (vl) ((rvv_read_value (0) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (0) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  (FloatArray.full input_b vl (rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)) )
  **  (FloatArray.full input_a vl (rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)) )
  **  (FloatArray.seg input_a_pre 0 ((batch_pre ÷ 4 ) - n ) (rvv_slice (0) (((batch_pre ÷ 4 ) - n )) (A)) )
  **  (FloatArray.seg input_a_pre (((batch_pre ÷ 4 ) - n ) + vl ) ((batch_pre ÷ 4 ) + 3 ) (rvv_slice ((((batch_pre ÷ 4 ) - n ) + vl )) (((batch_pre ÷ 4 ) + 3 )) (A)) )
  **  (FloatArray.seg input_b_pre 0 ((batch_pre ÷ 4 ) - n ) (rvv_slice (0) (((batch_pre ÷ 4 ) - n )) (B)) )
  **  (FloatArray.seg input_b_pre (((batch_pre ÷ 4 ) - n ) + vl ) ((batch_pre ÷ 4 ) + 3 ) (rvv_slice ((((batch_pre ÷ 4 ) - n ) + vl )) (((batch_pre ÷ 4 ) + 3 )) (B)) )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - n ) (vadd_values (((batch_pre ÷ 4 ) - n )) (A) (B)) )
  **  (FloatArray.undef_full output vl )
  **  (FloatArray.undef_seg output_pre (((batch_pre ÷ 4 ) - n ) + vl ) (batch_pre ÷ 4 ) )
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (rvv_read_value (0) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (rvv_read_value (1) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (rvv_read_value (2) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (rvv_read_value (3) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s4")) # Float  |-> (rvv_read_value (4) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s5")) # Float  |-> (rvv_read_value (5) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s6")) # Float  |-> (rvv_read_value (6) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s7")) # Float  |-> (rvv_read_value (7) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s8")) # Float  |-> (rvv_read_value (8) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s9")) # Float  |-> (rvv_read_value (9) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s10")) # Float  |-> (rvv_read_value (10) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s11")) # Float  |-> (rvv_read_value (11) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s12")) # Float  |-> (rvv_read_value (12) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s13")) # Float  |-> (rvv_read_value (13) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s14")) # Float  |-> (rvv_read_value (14) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s15")) # Float  |-> (rvv_read_value (15) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s16")) # Float  |-> (rvv_read_value (16) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s17")) # Float  |-> (rvv_read_value (17) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s18")) # Float  |-> (rvv_read_value (18) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s19")) # Float  |-> (rvv_read_value (19) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s20")) # Float  |-> (rvv_read_value (20) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s21")) # Float  |-> (rvv_read_value (21) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s22")) # Float  |-> (rvv_read_value (22) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s23")) # Float  |-> (rvv_read_value (23) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s24")) # Float  |-> (rvv_read_value (24) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s25")) # Float  |-> (rvv_read_value (25) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s26")) # Float  |-> (rvv_read_value (26) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s27")) # Float  |-> (rvv_read_value (27) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s28")) # Float  |-> (rvv_read_value (28) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s29")) # Float  |-> (rvv_read_value (29) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s30")) # Float  |-> (rvv_read_value (30) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s31")) # Float  |-> (rvv_read_value (31) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "vb" ) )->ₛ "s0")) # Float  |-> (rvv_read_value (0) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s1")) # Float  |-> (rvv_read_value (1) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s2")) # Float  |-> (rvv_read_value (2) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s3")) # Float  |-> (rvv_read_value (3) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s4")) # Float  |-> (rvv_read_value (4) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s5")) # Float  |-> (rvv_read_value (5) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s6")) # Float  |-> (rvv_read_value (6) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s7")) # Float  |-> (rvv_read_value (7) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s8")) # Float  |-> (rvv_read_value (8) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s9")) # Float  |-> (rvv_read_value (9) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s10")) # Float  |-> (rvv_read_value (10) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s11")) # Float  |-> (rvv_read_value (11) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s12")) # Float  |-> (rvv_read_value (12) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s13")) # Float  |-> (rvv_read_value (13) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s14")) # Float  |-> (rvv_read_value (14) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s15")) # Float  |-> (rvv_read_value (15) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s16")) # Float  |-> (rvv_read_value (16) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s17")) # Float  |-> (rvv_read_value (17) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s18")) # Float  |-> (rvv_read_value (18) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s19")) # Float  |-> (rvv_read_value (19) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s20")) # Float  |-> (rvv_read_value (20) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s21")) # Float  |-> (rvv_read_value (21) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s22")) # Float  |-> (rvv_read_value (22) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s23")) # Float  |-> (rvv_read_value (23) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s24")) # Float  |-> (rvv_read_value (24) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s25")) # Float  |-> (rvv_read_value (25) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s26")) # Float  |-> (rvv_read_value (26) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s27")) # Float  |-> (rvv_read_value (27) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s28")) # Float  |-> (rvv_read_value (28) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s29")) # Float  |-> (rvv_read_value (29) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s30")) # Float  |-> (rvv_read_value (30) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s31")) # Float  |-> (rvv_read_value (31) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
|--
  “ (0 <= vl) ” 
  &&  “ (vl <= 32) ” 
  &&  “ ((rvv_pack32 ((vadd_active_add (0) (vl) ((rvv_read_value (0) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (0) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (1) (vl) ((rvv_read_value (1) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (1) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (2) (vl) ((rvv_read_value (2) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (2) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (3) (vl) ((rvv_read_value (3) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (3) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (4) (vl) ((rvv_read_value (4) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (4) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (5) (vl) ((rvv_read_value (5) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (5) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (6) (vl) ((rvv_read_value (6) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (6) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (7) (vl) ((rvv_read_value (7) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (7) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (8) (vl) ((rvv_read_value (8) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (8) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (9) (vl) ((rvv_read_value (9) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (9) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (10) (vl) ((rvv_read_value (10) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (10) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (11) (vl) ((rvv_read_value (11) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (11) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (12) (vl) ((rvv_read_value (12) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (12) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (13) (vl) ((rvv_read_value (13) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (13) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (14) (vl) ((rvv_read_value (14) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (14) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (15) (vl) ((rvv_read_value (15) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (15) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (16) (vl) ((rvv_read_value (16) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (16) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (17) (vl) ((rvv_read_value (17) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (17) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (18) (vl) ((rvv_read_value (18) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (18) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (19) (vl) ((rvv_read_value (19) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (19) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (20) (vl) ((rvv_read_value (20) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (20) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (21) (vl) ((rvv_read_value (21) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (21) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (22) (vl) ((rvv_read_value (22) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (22) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (23) (vl) ((rvv_read_value (23) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (23) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (24) (vl) ((rvv_read_value (24) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (24) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (25) (vl) ((rvv_read_value (25) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (25) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (26) (vl) ((rvv_read_value (26) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (26) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (27) (vl) ((rvv_read_value (27) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (27) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (28) (vl) ((rvv_read_value (28) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (28) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (29) (vl) ((rvv_read_value (29) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (29) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (30) (vl) ((rvv_read_value (30) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (30) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (31) (vl) ((rvv_read_value (31) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (31) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))) = (rvv_pack32 ((vadd_active_add (0) (vl) ((rvv_read_value (0) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (0) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (1) (vl) ((rvv_read_value (1) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (1) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (2) (vl) ((rvv_read_value (2) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (2) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (3) (vl) ((rvv_read_value (3) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (3) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (4) (vl) ((rvv_read_value (4) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (4) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (5) (vl) ((rvv_read_value (5) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (5) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (6) (vl) ((rvv_read_value (6) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (6) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (7) (vl) ((rvv_read_value (7) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (7) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (8) (vl) ((rvv_read_value (8) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (8) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (9) (vl) ((rvv_read_value (9) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (9) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (10) (vl) ((rvv_read_value (10) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (10) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (11) (vl) ((rvv_read_value (11) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (11) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (12) (vl) ((rvv_read_value (12) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (12) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (13) (vl) ((rvv_read_value (13) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (13) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (14) (vl) ((rvv_read_value (14) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (14) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (15) (vl) ((rvv_read_value (15) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (15) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (16) (vl) ((rvv_read_value (16) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (16) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (17) (vl) ((rvv_read_value (17) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (17) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (18) (vl) ((rvv_read_value (18) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (18) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (19) (vl) ((rvv_read_value (19) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (19) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (20) (vl) ((rvv_read_value (20) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (20) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (21) (vl) ((rvv_read_value (21) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (21) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (22) (vl) ((rvv_read_value (22) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (22) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (23) (vl) ((rvv_read_value (23) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (23) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (24) (vl) ((rvv_read_value (24) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (24) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (25) (vl) ((rvv_read_value (25) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (25) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (26) (vl) ((rvv_read_value (26) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (26) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (27) (vl) ((rvv_read_value (27) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (27) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (28) (vl) ((rvv_read_value (28) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (28) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (29) (vl) ((rvv_read_value (29) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (29) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (30) (vl) ((rvv_read_value (30) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (30) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))) ((vadd_active_add (31) (vl) ((rvv_read_value (31) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (31) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B))))))))) ” 
  &&  “ (0 < (batch_pre ÷ 4 )) ” 
  &&  “ ((batch_pre ÷ 4 ) <= 4611686018427387900) ” 
  &&  “ (0 <= n) ” 
  &&  “ (n <= (batch_pre ÷ 4 )) ” 
  &&  “ ((rvv_length (A)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ ((rvv_length (B)) = ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ (input_a = (input_a_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT)))) ” 
  &&  “ (input_b = (input_b_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT)))) ” 
  &&  “ (0 < n) ” 
  &&  “ (0 < vl) ” 
  &&  “ (vl <= 32) ” 
  &&  “ (vl <= n) ” 
  &&  “ (vl = (vadd_vl (n))) ”
  &&  ((&(( &( "vacc" ) )->ₛ "s0")) # Float  |-> (vadd_active_add (0) (vl) ((rvv_read_value (0) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (0) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s1")) # Float  |-> (vadd_active_add (1) (vl) ((rvv_read_value (1) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (1) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s2")) # Float  |-> (vadd_active_add (2) (vl) ((rvv_read_value (2) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (2) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s3")) # Float  |-> (vadd_active_add (3) (vl) ((rvv_read_value (3) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (3) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s4")) # Float  |-> (vadd_active_add (4) (vl) ((rvv_read_value (4) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (4) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s5")) # Float  |-> (vadd_active_add (5) (vl) ((rvv_read_value (5) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (5) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s6")) # Float  |-> (vadd_active_add (6) (vl) ((rvv_read_value (6) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (6) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s7")) # Float  |-> (vadd_active_add (7) (vl) ((rvv_read_value (7) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (7) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s8")) # Float  |-> (vadd_active_add (8) (vl) ((rvv_read_value (8) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (8) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s9")) # Float  |-> (vadd_active_add (9) (vl) ((rvv_read_value (9) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (9) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s10")) # Float  |-> (vadd_active_add (10) (vl) ((rvv_read_value (10) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (10) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s11")) # Float  |-> (vadd_active_add (11) (vl) ((rvv_read_value (11) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (11) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s12")) # Float  |-> (vadd_active_add (12) (vl) ((rvv_read_value (12) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (12) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s13")) # Float  |-> (vadd_active_add (13) (vl) ((rvv_read_value (13) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (13) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s14")) # Float  |-> (vadd_active_add (14) (vl) ((rvv_read_value (14) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (14) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s15")) # Float  |-> (vadd_active_add (15) (vl) ((rvv_read_value (15) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (15) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s16")) # Float  |-> (vadd_active_add (16) (vl) ((rvv_read_value (16) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (16) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s17")) # Float  |-> (vadd_active_add (17) (vl) ((rvv_read_value (17) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (17) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s18")) # Float  |-> (vadd_active_add (18) (vl) ((rvv_read_value (18) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (18) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s19")) # Float  |-> (vadd_active_add (19) (vl) ((rvv_read_value (19) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (19) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s20")) # Float  |-> (vadd_active_add (20) (vl) ((rvv_read_value (20) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (20) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s21")) # Float  |-> (vadd_active_add (21) (vl) ((rvv_read_value (21) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (21) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s22")) # Float  |-> (vadd_active_add (22) (vl) ((rvv_read_value (22) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (22) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s23")) # Float  |-> (vadd_active_add (23) (vl) ((rvv_read_value (23) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (23) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s24")) # Float  |-> (vadd_active_add (24) (vl) ((rvv_read_value (24) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (24) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s25")) # Float  |-> (vadd_active_add (25) (vl) ((rvv_read_value (25) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (25) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s26")) # Float  |-> (vadd_active_add (26) (vl) ((rvv_read_value (26) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (26) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s27")) # Float  |-> (vadd_active_add (27) (vl) ((rvv_read_value (27) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (27) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s28")) # Float  |-> (vadd_active_add (28) (vl) ((rvv_read_value (28) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (28) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s29")) # Float  |-> (vadd_active_add (29) (vl) ((rvv_read_value (29) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (29) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s30")) # Float  |-> (vadd_active_add (30) (vl) ((rvv_read_value (30) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (30) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  ((&(( &( "vacc" ) )->ₛ "s31")) # Float  |-> (vadd_active_add (31) (vl) ((rvv_read_value (31) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A))))) ((rvv_read_value (31) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))))
  **  (FloatArray.undef_full output vl )
  **  (FloatArray.full input_b vl (rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)) )
  **  (FloatArray.full input_a vl (rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)) )
  **  (FloatArray.seg input_a_pre 0 ((batch_pre ÷ 4 ) - n ) (rvv_slice (0) (((batch_pre ÷ 4 ) - n )) (A)) )
  **  (FloatArray.seg input_a_pre (((batch_pre ÷ 4 ) - n ) + vl ) ((batch_pre ÷ 4 ) + 3 ) (rvv_slice ((((batch_pre ÷ 4 ) - n ) + vl )) (((batch_pre ÷ 4 ) + 3 )) (A)) )
  **  (FloatArray.seg input_b_pre 0 ((batch_pre ÷ 4 ) - n ) (rvv_slice (0) (((batch_pre ÷ 4 ) - n )) (B)) )
  **  (FloatArray.seg input_b_pre (((batch_pre ÷ 4 ) - n ) + vl ) ((batch_pre ÷ 4 ) + 3 ) (rvv_slice ((((batch_pre ÷ 4 ) - n ) + vl )) (((batch_pre ÷ 4 ) + 3 )) (B)) )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - n ) (vadd_values (((batch_pre ÷ 4 ) - n )) (A) (B)) )
  **  (FloatArray.undef_seg output_pre (((batch_pre ÷ 4 ) - n ) + vl ) (batch_pre ÷ 4 ) )
  **  ((&(( &( "va" ) )->ₛ "s0")) # Float  |-> (rvv_read_value (0) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s1")) # Float  |-> (rvv_read_value (1) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s2")) # Float  |-> (rvv_read_value (2) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s3")) # Float  |-> (rvv_read_value (3) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s4")) # Float  |-> (rvv_read_value (4) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s5")) # Float  |-> (rvv_read_value (5) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s6")) # Float  |-> (rvv_read_value (6) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s7")) # Float  |-> (rvv_read_value (7) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s8")) # Float  |-> (rvv_read_value (8) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s9")) # Float  |-> (rvv_read_value (9) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s10")) # Float  |-> (rvv_read_value (10) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s11")) # Float  |-> (rvv_read_value (11) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s12")) # Float  |-> (rvv_read_value (12) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s13")) # Float  |-> (rvv_read_value (13) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s14")) # Float  |-> (rvv_read_value (14) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s15")) # Float  |-> (rvv_read_value (15) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s16")) # Float  |-> (rvv_read_value (16) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s17")) # Float  |-> (rvv_read_value (17) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s18")) # Float  |-> (rvv_read_value (18) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s19")) # Float  |-> (rvv_read_value (19) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s20")) # Float  |-> (rvv_read_value (20) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s21")) # Float  |-> (rvv_read_value (21) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s22")) # Float  |-> (rvv_read_value (22) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s23")) # Float  |-> (rvv_read_value (23) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s24")) # Float  |-> (rvv_read_value (24) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s25")) # Float  |-> (rvv_read_value (25) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s26")) # Float  |-> (rvv_read_value (26) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s27")) # Float  |-> (rvv_read_value (27) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s28")) # Float  |-> (rvv_read_value (28) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s29")) # Float  |-> (rvv_read_value (29) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s30")) # Float  |-> (rvv_read_value (30) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "va" ) )->ₛ "s31")) # Float  |-> (rvv_read_value (31) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (A)))))
  **  ((&(( &( "vb" ) )->ₛ "s0")) # Float  |-> (rvv_read_value (0) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s1")) # Float  |-> (rvv_read_value (1) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s2")) # Float  |-> (rvv_read_value (2) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s3")) # Float  |-> (rvv_read_value (3) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s4")) # Float  |-> (rvv_read_value (4) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s5")) # Float  |-> (rvv_read_value (5) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s6")) # Float  |-> (rvv_read_value (6) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s7")) # Float  |-> (rvv_read_value (7) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s8")) # Float  |-> (rvv_read_value (8) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s9")) # Float  |-> (rvv_read_value (9) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s10")) # Float  |-> (rvv_read_value (10) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s11")) # Float  |-> (rvv_read_value (11) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s12")) # Float  |-> (rvv_read_value (12) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s13")) # Float  |-> (rvv_read_value (13) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s14")) # Float  |-> (rvv_read_value (14) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s15")) # Float  |-> (rvv_read_value (15) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s16")) # Float  |-> (rvv_read_value (16) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s17")) # Float  |-> (rvv_read_value (17) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s18")) # Float  |-> (rvv_read_value (18) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s19")) # Float  |-> (rvv_read_value (19) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s20")) # Float  |-> (rvv_read_value (20) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s21")) # Float  |-> (rvv_read_value (21) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s22")) # Float  |-> (rvv_read_value (22) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s23")) # Float  |-> (rvv_read_value (23) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s24")) # Float  |-> (rvv_read_value (24) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s25")) # Float  |-> (rvv_read_value (25) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s26")) # Float  |-> (rvv_read_value (26) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s27")) # Float  |-> (rvv_read_value (27) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s28")) # Float  |-> (rvv_read_value (28) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s29")) # Float  |-> (rvv_read_value (29) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s30")) # Float  |-> (rvv_read_value (30) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
  **  ((&(( &( "vb" ) )->ₛ "s31")) # Float  |-> (rvv_read_value (31) (vl) ((rvv_slice (((batch_pre ÷ 4 ) - n )) ((((batch_pre ÷ 4 ) - n ) + vl )) (B)))))
.

Definition test_rvv_partial_solve_wit_13 := test_rvv_partial_solve_wit_13_pure -> test_rvv_partial_solve_wit_13_aux.

Module Type VC_Correct.

Include rvv_arrays_Strategy_Correct.
Include rvv_store_Strategy_Correct.
Include rvv_loop_Strategy_Correct.

Axiom proof_of_qcp_assert_return_wit_1 : qcp_assert_return_wit_1.
Axiom proof_of___riscv_vsetvl_e32m8_safety_wit_1 : __riscv_vsetvl_e32m8_safety_wit_1.
Axiom proof_of___riscv_vsetvl_e32m8_safety_wit_2 : __riscv_vsetvl_e32m8_safety_wit_2.
Axiom proof_of___riscv_vsetvl_e32m8_return_wit_1 : __riscv_vsetvl_e32m8_return_wit_1.
Axiom proof_of___riscv_vsetvl_e32m8_return_wit_2 : __riscv_vsetvl_e32m8_return_wit_2.
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
Axiom proof_of_test_rvv_entail_wit_1 : test_rvv_entail_wit_1.
Axiom proof_of_test_rvv_entail_wit_2 : test_rvv_entail_wit_2.
Axiom proof_of_test_rvv_entail_wit_3 : test_rvv_entail_wit_3.
Axiom proof_of_test_rvv_entail_wit_4 : test_rvv_entail_wit_4.
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
Axiom proof_of_test_rvv_partial_solve_wit_6 : test_rvv_partial_solve_wit_6.
Axiom proof_of_test_rvv_partial_solve_wit_7_pure : test_rvv_partial_solve_wit_7_pure.
Axiom proof_of_test_rvv_partial_solve_wit_7 : test_rvv_partial_solve_wit_7.
Axiom proof_of_test_rvv_partial_solve_wit_8 : test_rvv_partial_solve_wit_8.
Axiom proof_of_test_rvv_partial_solve_wit_9_pure : test_rvv_partial_solve_wit_9_pure.
Axiom proof_of_test_rvv_partial_solve_wit_9 : test_rvv_partial_solve_wit_9.
Axiom proof_of_test_rvv_partial_solve_wit_10 : test_rvv_partial_solve_wit_10.
Axiom proof_of_test_rvv_partial_solve_wit_11_pure : test_rvv_partial_solve_wit_11_pure.
Axiom proof_of_test_rvv_partial_solve_wit_11 : test_rvv_partial_solve_wit_11.
Axiom proof_of_test_rvv_partial_solve_wit_12 : test_rvv_partial_solve_wit_12.
Axiom proof_of_test_rvv_partial_solve_wit_13_pure : test_rvv_partial_solve_wit_13_pure.
Axiom proof_of_test_rvv_partial_solve_wit_13 : test_rvv_partial_solve_wit_13.

End VC_Correct.
