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
Require Import QcpRvv32.RvvStoreModel.
Require Import QcpVadd.VaddBits.
Require Import Sqrt.Types Sqrt.Pack Sqrt.Borrowed.
Local Open Scope sac.
From Sqrt Require Import sqrt_arrays_strategy_goal.
From Sqrt Require Import sqrt_arrays_strategy_proof.

(*----- Function test_rvv -----*)

Definition test_rvv_safety_wit_1 := 
forall (unused_params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (PreH1 : (0 < batch_pre)) (PreH2 : (batch_pre <= UINT64_MAX)) (PreH3 : ((batch_pre % ( 4 ) ) = 0)) (PreH4 : (input_pre <> 0)) (PreH5 : (output_pre <> 0)) (PreH6 : (sizeof(FLOAT) = 4)) (PreH7 : ((batch_pre % ( sizeof(FLOAT) ) ) = 0)) (PreH8 : (0 < (batch_pre ÷ 4 ))) (PreH9 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) ,
  ((( &( "unused_params" ) )) # Ptr  |-> unused_params_pre)
  **  ((( &( "batch" ) )) # UInt64  |-> batch_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.undef_full output_pre (batch_pre ÷ 4 ) )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition test_rvv_safety_wit_2 := 
forall (unused_params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (PreH1 : (batch_pre = 0)) (PreH2 : (0 < batch_pre)) (PreH3 : (batch_pre <= UINT64_MAX)) (PreH4 : ((batch_pre % ( 4 ) ) = 0)) (PreH5 : (input_pre <> 0)) (PreH6 : (output_pre <> 0)) (PreH7 : (sizeof(FLOAT) = 4)) (PreH8 : ((batch_pre % ( sizeof(FLOAT) ) ) = 0)) (PreH9 : (0 < (batch_pre ÷ 4 ))) (PreH10 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) ,
  ((( &( "unused_params" ) )) # Ptr  |-> unused_params_pre)
  **  ((( &( "batch" ) )) # UInt64  |-> batch_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.undef_full output_pre (batch_pre ÷ 4 ) )
|--
  “ False ”
.

Definition test_rvv_safety_wit_3 := 
forall (unused_params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (PreH1 : (batch_pre <> 0)) (PreH2 : (0 < batch_pre)) (PreH3 : (batch_pre <= UINT64_MAX)) (PreH4 : ((batch_pre % ( 4 ) ) = 0)) (PreH5 : (input_pre <> 0)) (PreH6 : (output_pre <> 0)) (PreH7 : (sizeof(FLOAT) = 4)) (PreH8 : ((batch_pre % ( sizeof(FLOAT) ) ) = 0)) (PreH9 : (0 < (batch_pre ÷ 4 ))) (PreH10 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) ,
  ((( &( "unused_params" ) )) # Ptr  |-> unused_params_pre)
  **  ((( &( "batch" ) )) # UInt64  |-> batch_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.undef_full output_pre (batch_pre ÷ 4 ) )
|--
  “ (sizeof(FLOAT) <> 0) ”
.

Definition test_rvv_safety_wit_4 := 
forall (unused_params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (PreH1 : (batch_pre <> 0)) (PreH2 : (0 < batch_pre)) (PreH3 : (batch_pre <= UINT64_MAX)) (PreH4 : ((batch_pre % ( 4 ) ) = 0)) (PreH5 : (input_pre <> 0)) (PreH6 : (output_pre <> 0)) (PreH7 : (sizeof(FLOAT) = 4)) (PreH8 : ((batch_pre % ( sizeof(FLOAT) ) ) = 0)) (PreH9 : (0 < (batch_pre ÷ 4 ))) (PreH10 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) ,
  ((( &( "unused_params" ) )) # Ptr  |-> unused_params_pre)
  **  ((( &( "batch" ) )) # UInt64  |-> batch_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.undef_full output_pre (batch_pre ÷ 4 ) )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition test_rvv_safety_wit_5 := 
forall (unused_params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (PreH1 : ((batch_pre % ( sizeof(FLOAT) ) ) <> 0)) (PreH2 : (batch_pre <> 0)) (PreH3 : (0 < batch_pre)) (PreH4 : (batch_pre <= UINT64_MAX)) (PreH5 : ((batch_pre % ( 4 ) ) = 0)) (PreH6 : (input_pre <> 0)) (PreH7 : (output_pre <> 0)) (PreH8 : (sizeof(FLOAT) = 4)) (PreH9 : ((batch_pre % ( sizeof(FLOAT) ) ) = 0)) (PreH10 : (0 < (batch_pre ÷ 4 ))) (PreH11 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) ,
  ((( &( "unused_params" ) )) # Ptr  |-> unused_params_pre)
  **  ((( &( "batch" ) )) # UInt64  |-> batch_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.undef_full output_pre (batch_pre ÷ 4 ) )
|--
  “ False ”
.

Definition test_rvv_safety_wit_6 := 
forall (unused_params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (PreH1 : ((batch_pre % ( sizeof(FLOAT) ) ) = 0)) (PreH2 : (batch_pre <> 0)) (PreH3 : (0 < batch_pre)) (PreH4 : (batch_pre <= UINT64_MAX)) (PreH5 : ((batch_pre % ( 4 ) ) = 0)) (PreH6 : (input_pre <> 0)) (PreH7 : (output_pre <> 0)) (PreH8 : (sizeof(FLOAT) = 4)) (PreH9 : ((batch_pre % ( sizeof(FLOAT) ) ) = 0)) (PreH10 : (0 < (batch_pre ÷ 4 ))) (PreH11 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) ,
  ((( &( "unused_params" ) )) # Ptr  |-> unused_params_pre)
  **  ((( &( "batch" ) )) # UInt64  |-> batch_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.undef_full output_pre (batch_pre ÷ 4 ) )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition test_rvv_safety_wit_7 := 
forall (unused_params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (PreH1 : (input_pre = 0)) (PreH2 : ((batch_pre % ( sizeof(FLOAT) ) ) = 0)) (PreH3 : (batch_pre <> 0)) (PreH4 : (0 < batch_pre)) (PreH5 : (batch_pre <= UINT64_MAX)) (PreH6 : ((batch_pre % ( 4 ) ) = 0)) (PreH7 : (input_pre <> 0)) (PreH8 : (output_pre <> 0)) (PreH9 : (sizeof(FLOAT) = 4)) (PreH10 : ((batch_pre % ( sizeof(FLOAT) ) ) = 0)) (PreH11 : (0 < (batch_pre ÷ 4 ))) (PreH12 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) ,
  ((( &( "unused_params" ) )) # Ptr  |-> unused_params_pre)
  **  ((( &( "batch" ) )) # UInt64  |-> batch_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.undef_full output_pre (batch_pre ÷ 4 ) )
|--
  “ False ”
.

Definition test_rvv_safety_wit_8 := 
forall (unused_params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (PreH1 : (input_pre <> 0)) (PreH2 : ((batch_pre % ( sizeof(FLOAT) ) ) = 0)) (PreH3 : (batch_pre <> 0)) (PreH4 : (0 < batch_pre)) (PreH5 : (batch_pre <= UINT64_MAX)) (PreH6 : ((batch_pre % ( 4 ) ) = 0)) (PreH7 : (input_pre <> 0)) (PreH8 : (output_pre <> 0)) (PreH9 : (sizeof(FLOAT) = 4)) (PreH10 : ((batch_pre % ( sizeof(FLOAT) ) ) = 0)) (PreH11 : (0 < (batch_pre ÷ 4 ))) (PreH12 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) ,
  ((( &( "unused_params" ) )) # Ptr  |-> unused_params_pre)
  **  ((( &( "batch" ) )) # UInt64  |-> batch_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.undef_full output_pre (batch_pre ÷ 4 ) )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition test_rvv_safety_wit_9 := 
forall (unused_params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (PreH1 : (output_pre = 0)) (PreH2 : (input_pre <> 0)) (PreH3 : ((batch_pre % ( sizeof(FLOAT) ) ) = 0)) (PreH4 : (batch_pre <> 0)) (PreH5 : (0 < batch_pre)) (PreH6 : (batch_pre <= UINT64_MAX)) (PreH7 : ((batch_pre % ( 4 ) ) = 0)) (PreH8 : (input_pre <> 0)) (PreH9 : (output_pre <> 0)) (PreH10 : (sizeof(FLOAT) = 4)) (PreH11 : ((batch_pre % ( sizeof(FLOAT) ) ) = 0)) (PreH12 : (0 < (batch_pre ÷ 4 ))) (PreH13 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) ,
  ((( &( "unused_params" ) )) # Ptr  |-> unused_params_pre)
  **  ((( &( "batch" ) )) # UInt64  |-> batch_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.undef_full output_pre (batch_pre ÷ 4 ) )
|--
  “ False ”
.

Definition test_rvv_safety_wit_10 := 
forall (unused_params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (PreH1 : (output_pre <> 0)) (PreH2 : (input_pre <> 0)) (PreH3 : ((batch_pre % ( sizeof(FLOAT) ) ) = 0)) (PreH4 : (batch_pre <> 0)) (PreH5 : (0 < batch_pre)) (PreH6 : (batch_pre <= UINT64_MAX)) (PreH7 : ((batch_pre % ( 4 ) ) = 0)) (PreH8 : (input_pre <> 0)) (PreH9 : (output_pre <> 0)) (PreH10 : (sizeof(FLOAT) = 4)) (PreH11 : ((batch_pre % ( sizeof(FLOAT) ) ) = 0)) (PreH12 : (0 < (batch_pre ÷ 4 ))) (PreH13 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) ,
  ((( &( "n" ) )) # UInt64  |->_)
  **  ((( &( "unused_params" ) )) # Ptr  |-> unused_params_pre)
  **  ((( &( "batch" ) )) # UInt64  |-> batch_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.undef_full output_pre (batch_pre ÷ 4 ) )
|--
  “ (sizeof(FLOAT) <> 0) ”
.

Definition test_rvv_safety_wit_11 := 
forall (unused_params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (output: Z) (input: Z) (n: Z) (PreH1 : (sizeof(FLOAT) = 4)) (PreH2 : ((batch_pre % ( 4 ) ) = 0)) (PreH3 : ((batch_pre % ( sizeof(FLOAT) ) ) = 0)) (PreH4 : (0 < (batch_pre ÷ 4 ))) (PreH5 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH6 : (0 <= n)) (PreH7 : (n <= (batch_pre ÷ 4 ))) (PreH8 : (input = (input_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) (PreH9 : (output = (output_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) ,
  ((( &( "unused_params" ) )) # Ptr  |-> unused_params_pre)
  **  ((( &( "batch" ) )) # UInt64  |-> batch_pre)
  **  ((( &( "n" ) )) # UInt64  |-> n)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - n ) (sqrt_rvv_values (((batch_pre ÷ 4 ) - n )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - n ) ) )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition test_rvv_safety_wit_12 := 
forall (unused_params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (output: Z) (input: Z) (n: Z) (retval: Z) (PreH1 : (0 <= retval)) (PreH2 : (retval <= 32)) (PreH3 : (retval <= n)) (PreH4 : (n = 0)) (PreH5 : (n <= 32)) (PreH6 : (retval = n)) (PreH7 : (n > 0)) (PreH8 : (sizeof(FLOAT) = 4)) (PreH9 : ((batch_pre % ( 4 ) ) = 0)) (PreH10 : ((batch_pre % ( sizeof(FLOAT) ) ) = 0)) (PreH11 : (0 < (batch_pre ÷ 4 ))) (PreH12 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH13 : (0 <= n)) (PreH14 : (n <= (batch_pre ÷ 4 ))) (PreH15 : (input = (input_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) (PreH16 : (output = (output_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) ,
  ((( &( "vl" ) )) # UInt64  |->_)
  **  ((( &( "unused_params" ) )) # Ptr  |-> unused_params_pre)
  **  ((( &( "batch" ) )) # UInt64  |-> batch_pre)
  **  ((( &( "n" ) )) # UInt64  |-> n)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - n ) (sqrt_rvv_values (((batch_pre ÷ 4 ) - n )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - n ) ) )
|--
  “ False ”
.

Definition test_rvv_safety_wit_13 := 
forall (unused_params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (output: Z) (input: Z) (n: Z) (retval: Z) (PreH1 : (0 <= retval)) (PreH2 : (retval <= 32)) (PreH3 : (retval <= n)) (PreH4 : (n = 0)) (PreH5 : (32 < n)) (PreH6 : (n < 64)) (PreH7 : (((n + 1 ) ÷ 2 ) <= retval)) (PreH8 : (n > 0)) (PreH9 : (sizeof(FLOAT) = 4)) (PreH10 : ((batch_pre % ( 4 ) ) = 0)) (PreH11 : ((batch_pre % ( sizeof(FLOAT) ) ) = 0)) (PreH12 : (0 < (batch_pre ÷ 4 ))) (PreH13 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH14 : (0 <= n)) (PreH15 : (n <= (batch_pre ÷ 4 ))) (PreH16 : (input = (input_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) (PreH17 : (output = (output_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) ,
  ((( &( "vl" ) )) # UInt64  |->_)
  **  ((( &( "unused_params" ) )) # Ptr  |-> unused_params_pre)
  **  ((( &( "batch" ) )) # UInt64  |-> batch_pre)
  **  ((( &( "n" ) )) # UInt64  |-> n)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - n ) (sqrt_rvv_values (((batch_pre ÷ 4 ) - n )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - n ) ) )
|--
  “ False ”
.

Definition test_rvv_safety_wit_14 := 
forall (unused_params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (output: Z) (input: Z) (n: Z) (retval: Z) (PreH1 : (0 <= retval)) (PreH2 : (retval <= 32)) (PreH3 : (retval <= n)) (PreH4 : (n = 0)) (PreH5 : (64 <= n)) (PreH6 : (retval = 32)) (PreH7 : (n > 0)) (PreH8 : (sizeof(FLOAT) = 4)) (PreH9 : ((batch_pre % ( 4 ) ) = 0)) (PreH10 : ((batch_pre % ( sizeof(FLOAT) ) ) = 0)) (PreH11 : (0 < (batch_pre ÷ 4 ))) (PreH12 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH13 : (0 <= n)) (PreH14 : (n <= (batch_pre ÷ 4 ))) (PreH15 : (input = (input_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) (PreH16 : (output = (output_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) ,
  ((( &( "vl" ) )) # UInt64  |->_)
  **  ((( &( "unused_params" ) )) # Ptr  |-> unused_params_pre)
  **  ((( &( "batch" ) )) # UInt64  |-> batch_pre)
  **  ((( &( "n" ) )) # UInt64  |-> n)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - n ) (sqrt_rvv_values (((batch_pre ÷ 4 ) - n )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - n ) ) )
|--
  “ False ”
.

Definition test_rvv_entail_wit_1 := 
(
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (PreH1 : (0 < batch_pre)) (PreH2 : (batch_pre <= UINT64_MAX)) (PreH3 : ((batch_pre % ( 4 ) ) = 0)) (PreH4 : (input_pre <> 0)) (PreH5 : (output_pre <> 0)) ,
  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.undef_full output_pre (batch_pre ÷ 4 ) )
|--
  “ (0 < batch_pre) ” 
  &&  “ (batch_pre <= UINT64_MAX) ” 
  &&  “ ((batch_pre % ( 4 ) ) = 0) ” 
  &&  “ (input_pre <> 0) ” 
  &&  “ (output_pre <> 0) ” 
  &&  “ (sizeof(FLOAT) = 4) ” 
  &&  “ ((batch_pre % ( sizeof(FLOAT) ) ) = 0) ” 
  &&  “ (0 < (batch_pre ÷ 4 )) ” 
  &&  “ ((batch_pre ÷ 4 ) <= 4611686018427387903) ”
  &&  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.undef_full output_pre (batch_pre ÷ 4 ) )
) \/
(
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (PreH1 : (0 < batch_pre)) (PreH2 : (batch_pre <= UINT64_MAX)) (PreH3 : ((batch_pre % ( 4 ) ) = 0)) (PreH4 : (input_pre <> 0)) (PreH5 : (output_pre <> 0)) ,
  TT && emp 
|--
  “ ((batch_pre ÷ 4 ) <= 4611686018427387903) ” 
  &&  “ (0 < (batch_pre ÷ 4 )) ”
  &&  emp
).

Definition test_rvv_entail_wit_1_split_goal_1 := 
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (PreH1 : (0 < batch_pre)) (PreH2 : (batch_pre <= UINT64_MAX)) (PreH3 : ((batch_pre % ( 4 ) ) = 0)) (PreH4 : (input_pre <> 0)) (PreH5 : (output_pre <> 0)) ,
  ((batch_pre ÷ 4 ) <= 4611686018427387903)
.

Definition test_rvv_entail_wit_1_split_goal_2 := 
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (PreH1 : (0 < batch_pre)) (PreH2 : (batch_pre <= UINT64_MAX)) (PreH3 : ((batch_pre % ( 4 ) ) = 0)) (PreH4 : (input_pre <> 0)) (PreH5 : (output_pre <> 0)) ,
  (0 < (batch_pre ÷ 4 ))
.

Definition test_rvv_entail_wit_2 := 
(
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (PreH1 : (output_pre <> 0)) (PreH2 : (input_pre <> 0)) (PreH3 : ((batch_pre % ( sizeof(FLOAT) ) ) = 0)) (PreH4 : (batch_pre <> 0)) (PreH5 : (0 < batch_pre)) (PreH6 : (batch_pre <= UINT64_MAX)) (PreH7 : ((batch_pre % ( 4 ) ) = 0)) (PreH8 : (input_pre <> 0)) (PreH9 : (output_pre <> 0)) (PreH10 : (sizeof(FLOAT) = 4)) (PreH11 : ((batch_pre % ( sizeof(FLOAT) ) ) = 0)) (PreH12 : (0 < (batch_pre ÷ 4 ))) (PreH13 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) ,
  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.undef_full output_pre (batch_pre ÷ 4 ) )
|--
  “ (sizeof(FLOAT) = 4) ” 
  &&  “ ((batch_pre % ( 4 ) ) = 0) ” 
  &&  “ ((batch_pre % ( sizeof(FLOAT) ) ) = 0) ” 
  &&  “ (0 < (batch_pre ÷ 4 )) ” 
  &&  “ ((batch_pre ÷ 4 ) <= 4611686018427387903) ” 
  &&  “ (0 <= (batch_pre ÷ sizeof(FLOAT) )) ” 
  &&  “ ((batch_pre ÷ sizeof(FLOAT) ) <= (batch_pre ÷ 4 )) ” 
  &&  “ (input_pre = (input_pre + (((batch_pre ÷ 4 ) - (batch_pre ÷ sizeof(FLOAT) ) ) * sizeof(FLOAT)))) ” 
  &&  “ (output_pre = (output_pre + (((batch_pre ÷ 4 ) - (batch_pre ÷ sizeof(FLOAT) ) ) * sizeof(FLOAT)))) ”
  &&  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch_pre ÷ sizeof(FLOAT) ) ) (sqrt_rvv_values (((batch_pre ÷ 4 ) - (batch_pre ÷ sizeof(FLOAT) ) )) (A)) )
  **  (FloatArray.undef_full output_pre ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch_pre ÷ sizeof(FLOAT) ) ) ) )
) \/
(
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (PreH1 : (output_pre <> 0)) (PreH2 : (input_pre <> 0)) (PreH3 : ((batch_pre % ( sizeof(FLOAT) ) ) = 0)) (PreH4 : (batch_pre <> 0)) (PreH5 : (0 < batch_pre)) (PreH6 : (batch_pre <= UINT64_MAX)) (PreH7 : ((batch_pre % ( 4 ) ) = 0)) (PreH8 : (input_pre <> 0)) (PreH9 : (output_pre <> 0)) (PreH10 : (sizeof(FLOAT) = 4)) (PreH11 : ((batch_pre % ( sizeof(FLOAT) ) ) = 0)) (PreH12 : (0 < (batch_pre ÷ 4 ))) (PreH13 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) ,
  (FloatArray.undef_full (output_pre + (((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch_pre ÷ sizeof(FLOAT) ) ) ) * sizeof(FLOAT))) ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch_pre ÷ sizeof(FLOAT) ) ) ) ) )
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
|--
  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch_pre ÷ sizeof(FLOAT) ) ) (sqrt_rvv_values (((batch_pre ÷ 4 ) - (batch_pre ÷ sizeof(FLOAT) ) )) (A)) )
).

Definition test_rvv_entail_wit_2_split_goal_spatial := 
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (PreH1 : (output_pre <> 0)) (PreH2 : (input_pre <> 0)) (PreH3 : ((batch_pre % ( sizeof(FLOAT) ) ) = 0)) (PreH4 : (batch_pre <> 0)) (PreH5 : (0 < batch_pre)) (PreH6 : (batch_pre <= UINT64_MAX)) (PreH7 : ((batch_pre % ( 4 ) ) = 0)) (PreH8 : (input_pre <> 0)) (PreH9 : (output_pre <> 0)) (PreH10 : (sizeof(FLOAT) = 4)) (PreH11 : ((batch_pre % ( sizeof(FLOAT) ) ) = 0)) (PreH12 : (0 < (batch_pre ÷ 4 ))) (PreH13 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) ,
  (FloatArray.undef_full (output_pre + (((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch_pre ÷ sizeof(FLOAT) ) ) ) * sizeof(FLOAT))) ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch_pre ÷ sizeof(FLOAT) ) ) ) ) )
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
|--
  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch_pre ÷ sizeof(FLOAT) ) ) (sqrt_rvv_values (((batch_pre ÷ 4 ) - (batch_pre ÷ sizeof(FLOAT) ) )) (A)) )
.

Definition test_rvv_entail_wit_3_1 := 
(
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (output: Z) (input: Z) (n: Z) (retval: Z) (t31: fp32) (t30: fp32) (t29: fp32) (t28: fp32) (t27: fp32) (t26: fp32) (t25: fp32) (t24: fp32) (t23: fp32) (t22: fp32) (t21: fp32) (t20: fp32) (t19: fp32) (t18: fp32) (t17: fp32) (t16: fp32) (t15: fp32) (t14: fp32) (t13: fp32) (t12: fp32) (t11: fp32) (t10: fp32) (t9: fp32) (t8: fp32) (t7: fp32) (t6: fp32) (t5: fp32) (t4: fp32) (t3: fp32) (t2: fp32) (t1: fp32) (t0: fp32) (t31_2: fp32) (t30_2: fp32) (t29_2: fp32) (t28_2: fp32) (t27_2: fp32) (t26_2: fp32) (t25_2: fp32) (t24_2: fp32) (t23_2: fp32) (t22_2: fp32) (t21_2: fp32) (t20_2: fp32) (t19_2: fp32) (t18_2: fp32) (t17_2: fp32) (t16_2: fp32) (t15_2: fp32) (t14_2: fp32) (t13_2: fp32) (t12_2: fp32) (t11_2: fp32) (t10_2: fp32) (t9_2: fp32) (t8_2: fp32) (t7_2: fp32) (t6_2: fp32) (t5_2: fp32) (t4_2: fp32) (t3_2: fp32) (t2_2: fp32) (t1_2: fp32) (t0_2: fp32) (PreH1 : (0 <= retval)) (PreH2 : (retval <= 32)) (PreH3 : (retval <= n)) (PreH4 : (retval > 0)) (PreH5 : (n <= 32)) (PreH6 : (retval = n)) (PreH7 : (n > 0)) (PreH8 : (sizeof(FLOAT) = 4)) (PreH9 : ((batch_pre % ( 4 ) ) = 0)) (PreH10 : ((batch_pre % ( sizeof(FLOAT) ) ) = 0)) (PreH11 : (0 < (batch_pre ÷ 4 ))) (PreH12 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH13 : (0 <= n)) (PreH14 : (n <= (batch_pre ÷ 4 ))) (PreH15 : (input = (input_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) (PreH16 : (output = (output_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) ,
  (FloatArray.full output retval (rvv_take (retval) ((rvv_pack32 ((sqrt_active (0) (retval) ((sqrt_read_at (0) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t0))) (t0_2))) ((sqrt_active (1) (retval) ((sqrt_read_at (1) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t1))) (t1_2))) ((sqrt_active (2) (retval) ((sqrt_read_at (2) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t2))) (t2_2))) ((sqrt_active (3) (retval) ((sqrt_read_at (3) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t3))) (t3_2))) ((sqrt_active (4) (retval) ((sqrt_read_at (4) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t4))) (t4_2))) ((sqrt_active (5) (retval) ((sqrt_read_at (5) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t5))) (t5_2))) ((sqrt_active (6) (retval) ((sqrt_read_at (6) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t6))) (t6_2))) ((sqrt_active (7) (retval) ((sqrt_read_at (7) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t7))) (t7_2))) ((sqrt_active (8) (retval) ((sqrt_read_at (8) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t8))) (t8_2))) ((sqrt_active (9) (retval) ((sqrt_read_at (9) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t9))) (t9_2))) ((sqrt_active (10) (retval) ((sqrt_read_at (10) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t10))) (t10_2))) ((sqrt_active (11) (retval) ((sqrt_read_at (11) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t11))) (t11_2))) ((sqrt_active (12) (retval) ((sqrt_read_at (12) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t12))) (t12_2))) ((sqrt_active (13) (retval) ((sqrt_read_at (13) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t13))) (t13_2))) ((sqrt_active (14) (retval) ((sqrt_read_at (14) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t14))) (t14_2))) ((sqrt_active (15) (retval) ((sqrt_read_at (15) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t15))) (t15_2))) ((sqrt_active (16) (retval) ((sqrt_read_at (16) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t16))) (t16_2))) ((sqrt_active (17) (retval) ((sqrt_read_at (17) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t17))) (t17_2))) ((sqrt_active (18) (retval) ((sqrt_read_at (18) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t18))) (t18_2))) ((sqrt_active (19) (retval) ((sqrt_read_at (19) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t19))) (t19_2))) ((sqrt_active (20) (retval) ((sqrt_read_at (20) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t20))) (t20_2))) ((sqrt_active (21) (retval) ((sqrt_read_at (21) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t21))) (t21_2))) ((sqrt_active (22) (retval) ((sqrt_read_at (22) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t22))) (t22_2))) ((sqrt_active (23) (retval) ((sqrt_read_at (23) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t23))) (t23_2))) ((sqrt_active (24) (retval) ((sqrt_read_at (24) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t24))) (t24_2))) ((sqrt_active (25) (retval) ((sqrt_read_at (25) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t25))) (t25_2))) ((sqrt_active (26) (retval) ((sqrt_read_at (26) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t26))) (t26_2))) ((sqrt_active (27) (retval) ((sqrt_read_at (27) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t27))) (t27_2))) ((sqrt_active (28) (retval) ((sqrt_read_at (28) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t28))) (t28_2))) ((sqrt_active (29) (retval) ((sqrt_read_at (29) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t29))) (t29_2))) ((sqrt_active (30) (retval) ((sqrt_read_at (30) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t30))) (t30_2))) ((sqrt_active (31) (retval) ((sqrt_read_at (31) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t31))) (t31_2)))))) )
  **  (FloatArray.undef_full (output + (retval * sizeof(FLOAT))) (((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - n ) ) - retval ) )
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - n ) (sqrt_rvv_values (((batch_pre ÷ 4 ) - n )) (A)) )
|--
  “ (sizeof(FLOAT) = 4) ” 
  &&  “ ((batch_pre % ( 4 ) ) = 0) ” 
  &&  “ ((batch_pre % ( sizeof(FLOAT) ) ) = 0) ” 
  &&  “ (0 < (batch_pre ÷ 4 )) ” 
  &&  “ ((batch_pre ÷ 4 ) <= 4611686018427387903) ” 
  &&  “ (0 <= (n - retval )) ” 
  &&  “ ((n - retval ) <= (batch_pre ÷ 4 )) ” 
  &&  “ ((input + (retval * sizeof(FLOAT))) = (input_pre + (((batch_pre ÷ 4 ) - (n - retval ) ) * sizeof(FLOAT)))) ” 
  &&  “ ((output + (retval * sizeof(FLOAT))) = (output_pre + (((batch_pre ÷ 4 ) - (n - retval ) ) * sizeof(FLOAT)))) ”
  &&  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (n - retval ) ) (sqrt_rvv_values (((batch_pre ÷ 4 ) - (n - retval ) )) (A)) )
  **  (FloatArray.undef_full (output + (retval * sizeof(FLOAT))) ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (n - retval ) ) ) )
) \/
(
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (output: Z) (input: Z) (n: Z) (retval: Z) (t31: fp32) (t30: fp32) (t29: fp32) (t28: fp32) (t27: fp32) (t26: fp32) (t25: fp32) (t24: fp32) (t23: fp32) (t22: fp32) (t21: fp32) (t20: fp32) (t19: fp32) (t18: fp32) (t17: fp32) (t16: fp32) (t15: fp32) (t14: fp32) (t13: fp32) (t12: fp32) (t11: fp32) (t10: fp32) (t9: fp32) (t8: fp32) (t7: fp32) (t6: fp32) (t5: fp32) (t4: fp32) (t3: fp32) (t2: fp32) (t1: fp32) (t0: fp32) (t31_2: fp32) (t30_2: fp32) (t29_2: fp32) (t28_2: fp32) (t27_2: fp32) (t26_2: fp32) (t25_2: fp32) (t24_2: fp32) (t23_2: fp32) (t22_2: fp32) (t21_2: fp32) (t20_2: fp32) (t19_2: fp32) (t18_2: fp32) (t17_2: fp32) (t16_2: fp32) (t15_2: fp32) (t14_2: fp32) (t13_2: fp32) (t12_2: fp32) (t11_2: fp32) (t10_2: fp32) (t9_2: fp32) (t8_2: fp32) (t7_2: fp32) (t6_2: fp32) (t5_2: fp32) (t4_2: fp32) (t3_2: fp32) (t2_2: fp32) (t1_2: fp32) (t0_2: fp32) (PreH1 : (0 <= retval)) (PreH2 : (retval <= 32)) (PreH3 : (retval <= n)) (PreH4 : (retval > 0)) (PreH5 : (n <= 32)) (PreH6 : (retval = n)) (PreH7 : (n > 0)) (PreH8 : (sizeof(FLOAT) = 4)) (PreH9 : ((batch_pre % ( 4 ) ) = 0)) (PreH10 : ((batch_pre % ( sizeof(FLOAT) ) ) = 0)) (PreH11 : (0 < (batch_pre ÷ 4 ))) (PreH12 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH13 : (0 <= n)) (PreH14 : (n <= (batch_pre ÷ 4 ))) (PreH15 : (input = (input_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) (PreH16 : (output = (output_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) ,
  (FloatArray.undef_full (output + ((retval + ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (n - retval ) ) ) ) * sizeof(FLOAT))) ((((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - n ) ) - retval ) - ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (n - retval ) ) ) ) )
  **  (FloatArray.full output retval (rvv_take (retval) ((rvv_pack32 ((sqrt_active (0) (retval) ((sqrt_read_at (0) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t0))) (t0_2))) ((sqrt_active (1) (retval) ((sqrt_read_at (1) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t1))) (t1_2))) ((sqrt_active (2) (retval) ((sqrt_read_at (2) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t2))) (t2_2))) ((sqrt_active (3) (retval) ((sqrt_read_at (3) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t3))) (t3_2))) ((sqrt_active (4) (retval) ((sqrt_read_at (4) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t4))) (t4_2))) ((sqrt_active (5) (retval) ((sqrt_read_at (5) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t5))) (t5_2))) ((sqrt_active (6) (retval) ((sqrt_read_at (6) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t6))) (t6_2))) ((sqrt_active (7) (retval) ((sqrt_read_at (7) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t7))) (t7_2))) ((sqrt_active (8) (retval) ((sqrt_read_at (8) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t8))) (t8_2))) ((sqrt_active (9) (retval) ((sqrt_read_at (9) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t9))) (t9_2))) ((sqrt_active (10) (retval) ((sqrt_read_at (10) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t10))) (t10_2))) ((sqrt_active (11) (retval) ((sqrt_read_at (11) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t11))) (t11_2))) ((sqrt_active (12) (retval) ((sqrt_read_at (12) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t12))) (t12_2))) ((sqrt_active (13) (retval) ((sqrt_read_at (13) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t13))) (t13_2))) ((sqrt_active (14) (retval) ((sqrt_read_at (14) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t14))) (t14_2))) ((sqrt_active (15) (retval) ((sqrt_read_at (15) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t15))) (t15_2))) ((sqrt_active (16) (retval) ((sqrt_read_at (16) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t16))) (t16_2))) ((sqrt_active (17) (retval) ((sqrt_read_at (17) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t17))) (t17_2))) ((sqrt_active (18) (retval) ((sqrt_read_at (18) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t18))) (t18_2))) ((sqrt_active (19) (retval) ((sqrt_read_at (19) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t19))) (t19_2))) ((sqrt_active (20) (retval) ((sqrt_read_at (20) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t20))) (t20_2))) ((sqrt_active (21) (retval) ((sqrt_read_at (21) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t21))) (t21_2))) ((sqrt_active (22) (retval) ((sqrt_read_at (22) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t22))) (t22_2))) ((sqrt_active (23) (retval) ((sqrt_read_at (23) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t23))) (t23_2))) ((sqrt_active (24) (retval) ((sqrt_read_at (24) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t24))) (t24_2))) ((sqrt_active (25) (retval) ((sqrt_read_at (25) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t25))) (t25_2))) ((sqrt_active (26) (retval) ((sqrt_read_at (26) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t26))) (t26_2))) ((sqrt_active (27) (retval) ((sqrt_read_at (27) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t27))) (t27_2))) ((sqrt_active (28) (retval) ((sqrt_read_at (28) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t28))) (t28_2))) ((sqrt_active (29) (retval) ((sqrt_read_at (29) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t29))) (t29_2))) ((sqrt_active (30) (retval) ((sqrt_read_at (30) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t30))) (t30_2))) ((sqrt_active (31) (retval) ((sqrt_read_at (31) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t31))) (t31_2)))))) )
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - n ) (sqrt_rvv_values (((batch_pre ÷ 4 ) - n )) (A)) )
|--
  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (n - retval ) ) (sqrt_rvv_values (((batch_pre ÷ 4 ) - (n - retval ) )) (A)) )
).

Definition test_rvv_entail_wit_3_1_split_goal_spatial := 
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (output: Z) (input: Z) (n: Z) (retval: Z) (t31: fp32) (t30: fp32) (t29: fp32) (t28: fp32) (t27: fp32) (t26: fp32) (t25: fp32) (t24: fp32) (t23: fp32) (t22: fp32) (t21: fp32) (t20: fp32) (t19: fp32) (t18: fp32) (t17: fp32) (t16: fp32) (t15: fp32) (t14: fp32) (t13: fp32) (t12: fp32) (t11: fp32) (t10: fp32) (t9: fp32) (t8: fp32) (t7: fp32) (t6: fp32) (t5: fp32) (t4: fp32) (t3: fp32) (t2: fp32) (t1: fp32) (t0: fp32) (t31_2: fp32) (t30_2: fp32) (t29_2: fp32) (t28_2: fp32) (t27_2: fp32) (t26_2: fp32) (t25_2: fp32) (t24_2: fp32) (t23_2: fp32) (t22_2: fp32) (t21_2: fp32) (t20_2: fp32) (t19_2: fp32) (t18_2: fp32) (t17_2: fp32) (t16_2: fp32) (t15_2: fp32) (t14_2: fp32) (t13_2: fp32) (t12_2: fp32) (t11_2: fp32) (t10_2: fp32) (t9_2: fp32) (t8_2: fp32) (t7_2: fp32) (t6_2: fp32) (t5_2: fp32) (t4_2: fp32) (t3_2: fp32) (t2_2: fp32) (t1_2: fp32) (t0_2: fp32) (PreH1 : (0 <= retval)) (PreH2 : (retval <= 32)) (PreH3 : (retval <= n)) (PreH4 : (retval > 0)) (PreH5 : (n <= 32)) (PreH6 : (retval = n)) (PreH7 : (n > 0)) (PreH8 : (sizeof(FLOAT) = 4)) (PreH9 : ((batch_pre % ( 4 ) ) = 0)) (PreH10 : ((batch_pre % ( sizeof(FLOAT) ) ) = 0)) (PreH11 : (0 < (batch_pre ÷ 4 ))) (PreH12 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH13 : (0 <= n)) (PreH14 : (n <= (batch_pre ÷ 4 ))) (PreH15 : (input = (input_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) (PreH16 : (output = (output_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) ,
  (FloatArray.undef_full (output + ((retval + ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (n - retval ) ) ) ) * sizeof(FLOAT))) ((((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - n ) ) - retval ) - ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (n - retval ) ) ) ) )
  **  (FloatArray.full output retval (rvv_take (retval) ((rvv_pack32 ((sqrt_active (0) (retval) ((sqrt_read_at (0) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t0))) (t0_2))) ((sqrt_active (1) (retval) ((sqrt_read_at (1) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t1))) (t1_2))) ((sqrt_active (2) (retval) ((sqrt_read_at (2) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t2))) (t2_2))) ((sqrt_active (3) (retval) ((sqrt_read_at (3) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t3))) (t3_2))) ((sqrt_active (4) (retval) ((sqrt_read_at (4) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t4))) (t4_2))) ((sqrt_active (5) (retval) ((sqrt_read_at (5) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t5))) (t5_2))) ((sqrt_active (6) (retval) ((sqrt_read_at (6) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t6))) (t6_2))) ((sqrt_active (7) (retval) ((sqrt_read_at (7) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t7))) (t7_2))) ((sqrt_active (8) (retval) ((sqrt_read_at (8) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t8))) (t8_2))) ((sqrt_active (9) (retval) ((sqrt_read_at (9) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t9))) (t9_2))) ((sqrt_active (10) (retval) ((sqrt_read_at (10) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t10))) (t10_2))) ((sqrt_active (11) (retval) ((sqrt_read_at (11) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t11))) (t11_2))) ((sqrt_active (12) (retval) ((sqrt_read_at (12) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t12))) (t12_2))) ((sqrt_active (13) (retval) ((sqrt_read_at (13) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t13))) (t13_2))) ((sqrt_active (14) (retval) ((sqrt_read_at (14) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t14))) (t14_2))) ((sqrt_active (15) (retval) ((sqrt_read_at (15) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t15))) (t15_2))) ((sqrt_active (16) (retval) ((sqrt_read_at (16) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t16))) (t16_2))) ((sqrt_active (17) (retval) ((sqrt_read_at (17) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t17))) (t17_2))) ((sqrt_active (18) (retval) ((sqrt_read_at (18) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t18))) (t18_2))) ((sqrt_active (19) (retval) ((sqrt_read_at (19) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t19))) (t19_2))) ((sqrt_active (20) (retval) ((sqrt_read_at (20) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t20))) (t20_2))) ((sqrt_active (21) (retval) ((sqrt_read_at (21) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t21))) (t21_2))) ((sqrt_active (22) (retval) ((sqrt_read_at (22) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t22))) (t22_2))) ((sqrt_active (23) (retval) ((sqrt_read_at (23) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t23))) (t23_2))) ((sqrt_active (24) (retval) ((sqrt_read_at (24) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t24))) (t24_2))) ((sqrt_active (25) (retval) ((sqrt_read_at (25) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t25))) (t25_2))) ((sqrt_active (26) (retval) ((sqrt_read_at (26) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t26))) (t26_2))) ((sqrt_active (27) (retval) ((sqrt_read_at (27) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t27))) (t27_2))) ((sqrt_active (28) (retval) ((sqrt_read_at (28) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t28))) (t28_2))) ((sqrt_active (29) (retval) ((sqrt_read_at (29) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t29))) (t29_2))) ((sqrt_active (30) (retval) ((sqrt_read_at (30) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t30))) (t30_2))) ((sqrt_active (31) (retval) ((sqrt_read_at (31) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t31))) (t31_2)))))) )
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - n ) (sqrt_rvv_values (((batch_pre ÷ 4 ) - n )) (A)) )
|--
  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (n - retval ) ) (sqrt_rvv_values (((batch_pre ÷ 4 ) - (n - retval ) )) (A)) )
.

Definition test_rvv_entail_wit_3_2 := 
(
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (output: Z) (input: Z) (n: Z) (retval: Z) (t31: fp32) (t30: fp32) (t29: fp32) (t28: fp32) (t27: fp32) (t26: fp32) (t25: fp32) (t24: fp32) (t23: fp32) (t22: fp32) (t21: fp32) (t20: fp32) (t19: fp32) (t18: fp32) (t17: fp32) (t16: fp32) (t15: fp32) (t14: fp32) (t13: fp32) (t12: fp32) (t11: fp32) (t10: fp32) (t9: fp32) (t8: fp32) (t7: fp32) (t6: fp32) (t5: fp32) (t4: fp32) (t3: fp32) (t2: fp32) (t1: fp32) (t0: fp32) (t31_2: fp32) (t30_2: fp32) (t29_2: fp32) (t28_2: fp32) (t27_2: fp32) (t26_2: fp32) (t25_2: fp32) (t24_2: fp32) (t23_2: fp32) (t22_2: fp32) (t21_2: fp32) (t20_2: fp32) (t19_2: fp32) (t18_2: fp32) (t17_2: fp32) (t16_2: fp32) (t15_2: fp32) (t14_2: fp32) (t13_2: fp32) (t12_2: fp32) (t11_2: fp32) (t10_2: fp32) (t9_2: fp32) (t8_2: fp32) (t7_2: fp32) (t6_2: fp32) (t5_2: fp32) (t4_2: fp32) (t3_2: fp32) (t2_2: fp32) (t1_2: fp32) (t0_2: fp32) (PreH1 : (0 <= retval)) (PreH2 : (retval <= 32)) (PreH3 : (retval <= n)) (PreH4 : (retval > 0)) (PreH5 : (32 < n)) (PreH6 : (n < 64)) (PreH7 : (((n + 1 ) ÷ 2 ) <= retval)) (PreH8 : (n > 0)) (PreH9 : (sizeof(FLOAT) = 4)) (PreH10 : ((batch_pre % ( 4 ) ) = 0)) (PreH11 : ((batch_pre % ( sizeof(FLOAT) ) ) = 0)) (PreH12 : (0 < (batch_pre ÷ 4 ))) (PreH13 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH14 : (0 <= n)) (PreH15 : (n <= (batch_pre ÷ 4 ))) (PreH16 : (input = (input_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) (PreH17 : (output = (output_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) ,
  (FloatArray.full output retval (rvv_take (retval) ((rvv_pack32 ((sqrt_active (0) (retval) ((sqrt_read_at (0) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t0))) (t0_2))) ((sqrt_active (1) (retval) ((sqrt_read_at (1) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t1))) (t1_2))) ((sqrt_active (2) (retval) ((sqrt_read_at (2) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t2))) (t2_2))) ((sqrt_active (3) (retval) ((sqrt_read_at (3) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t3))) (t3_2))) ((sqrt_active (4) (retval) ((sqrt_read_at (4) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t4))) (t4_2))) ((sqrt_active (5) (retval) ((sqrt_read_at (5) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t5))) (t5_2))) ((sqrt_active (6) (retval) ((sqrt_read_at (6) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t6))) (t6_2))) ((sqrt_active (7) (retval) ((sqrt_read_at (7) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t7))) (t7_2))) ((sqrt_active (8) (retval) ((sqrt_read_at (8) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t8))) (t8_2))) ((sqrt_active (9) (retval) ((sqrt_read_at (9) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t9))) (t9_2))) ((sqrt_active (10) (retval) ((sqrt_read_at (10) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t10))) (t10_2))) ((sqrt_active (11) (retval) ((sqrt_read_at (11) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t11))) (t11_2))) ((sqrt_active (12) (retval) ((sqrt_read_at (12) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t12))) (t12_2))) ((sqrt_active (13) (retval) ((sqrt_read_at (13) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t13))) (t13_2))) ((sqrt_active (14) (retval) ((sqrt_read_at (14) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t14))) (t14_2))) ((sqrt_active (15) (retval) ((sqrt_read_at (15) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t15))) (t15_2))) ((sqrt_active (16) (retval) ((sqrt_read_at (16) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t16))) (t16_2))) ((sqrt_active (17) (retval) ((sqrt_read_at (17) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t17))) (t17_2))) ((sqrt_active (18) (retval) ((sqrt_read_at (18) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t18))) (t18_2))) ((sqrt_active (19) (retval) ((sqrt_read_at (19) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t19))) (t19_2))) ((sqrt_active (20) (retval) ((sqrt_read_at (20) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t20))) (t20_2))) ((sqrt_active (21) (retval) ((sqrt_read_at (21) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t21))) (t21_2))) ((sqrt_active (22) (retval) ((sqrt_read_at (22) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t22))) (t22_2))) ((sqrt_active (23) (retval) ((sqrt_read_at (23) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t23))) (t23_2))) ((sqrt_active (24) (retval) ((sqrt_read_at (24) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t24))) (t24_2))) ((sqrt_active (25) (retval) ((sqrt_read_at (25) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t25))) (t25_2))) ((sqrt_active (26) (retval) ((sqrt_read_at (26) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t26))) (t26_2))) ((sqrt_active (27) (retval) ((sqrt_read_at (27) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t27))) (t27_2))) ((sqrt_active (28) (retval) ((sqrt_read_at (28) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t28))) (t28_2))) ((sqrt_active (29) (retval) ((sqrt_read_at (29) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t29))) (t29_2))) ((sqrt_active (30) (retval) ((sqrt_read_at (30) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t30))) (t30_2))) ((sqrt_active (31) (retval) ((sqrt_read_at (31) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t31))) (t31_2)))))) )
  **  (FloatArray.undef_full (output + (retval * sizeof(FLOAT))) (((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - n ) ) - retval ) )
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - n ) (sqrt_rvv_values (((batch_pre ÷ 4 ) - n )) (A)) )
|--
  “ (sizeof(FLOAT) = 4) ” 
  &&  “ ((batch_pre % ( 4 ) ) = 0) ” 
  &&  “ ((batch_pre % ( sizeof(FLOAT) ) ) = 0) ” 
  &&  “ (0 < (batch_pre ÷ 4 )) ” 
  &&  “ ((batch_pre ÷ 4 ) <= 4611686018427387903) ” 
  &&  “ (0 <= (n - retval )) ” 
  &&  “ ((n - retval ) <= (batch_pre ÷ 4 )) ” 
  &&  “ ((input + (retval * sizeof(FLOAT))) = (input_pre + (((batch_pre ÷ 4 ) - (n - retval ) ) * sizeof(FLOAT)))) ” 
  &&  “ ((output + (retval * sizeof(FLOAT))) = (output_pre + (((batch_pre ÷ 4 ) - (n - retval ) ) * sizeof(FLOAT)))) ”
  &&  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (n - retval ) ) (sqrt_rvv_values (((batch_pre ÷ 4 ) - (n - retval ) )) (A)) )
  **  (FloatArray.undef_full (output + (retval * sizeof(FLOAT))) ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (n - retval ) ) ) )
) \/
(
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (output: Z) (input: Z) (n: Z) (retval: Z) (t31: fp32) (t30: fp32) (t29: fp32) (t28: fp32) (t27: fp32) (t26: fp32) (t25: fp32) (t24: fp32) (t23: fp32) (t22: fp32) (t21: fp32) (t20: fp32) (t19: fp32) (t18: fp32) (t17: fp32) (t16: fp32) (t15: fp32) (t14: fp32) (t13: fp32) (t12: fp32) (t11: fp32) (t10: fp32) (t9: fp32) (t8: fp32) (t7: fp32) (t6: fp32) (t5: fp32) (t4: fp32) (t3: fp32) (t2: fp32) (t1: fp32) (t0: fp32) (t31_2: fp32) (t30_2: fp32) (t29_2: fp32) (t28_2: fp32) (t27_2: fp32) (t26_2: fp32) (t25_2: fp32) (t24_2: fp32) (t23_2: fp32) (t22_2: fp32) (t21_2: fp32) (t20_2: fp32) (t19_2: fp32) (t18_2: fp32) (t17_2: fp32) (t16_2: fp32) (t15_2: fp32) (t14_2: fp32) (t13_2: fp32) (t12_2: fp32) (t11_2: fp32) (t10_2: fp32) (t9_2: fp32) (t8_2: fp32) (t7_2: fp32) (t6_2: fp32) (t5_2: fp32) (t4_2: fp32) (t3_2: fp32) (t2_2: fp32) (t1_2: fp32) (t0_2: fp32) (PreH1 : (0 <= retval)) (PreH2 : (retval <= 32)) (PreH3 : (retval <= n)) (PreH4 : (retval > 0)) (PreH5 : (32 < n)) (PreH6 : (n < 64)) (PreH7 : (((n + 1 ) ÷ 2 ) <= retval)) (PreH8 : (n > 0)) (PreH9 : (sizeof(FLOAT) = 4)) (PreH10 : ((batch_pre % ( 4 ) ) = 0)) (PreH11 : ((batch_pre % ( sizeof(FLOAT) ) ) = 0)) (PreH12 : (0 < (batch_pre ÷ 4 ))) (PreH13 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH14 : (0 <= n)) (PreH15 : (n <= (batch_pre ÷ 4 ))) (PreH16 : (input = (input_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) (PreH17 : (output = (output_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) ,
  (FloatArray.undef_full (output + ((retval + ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (n - retval ) ) ) ) * sizeof(FLOAT))) ((((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - n ) ) - retval ) - ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (n - retval ) ) ) ) )
  **  (FloatArray.full output retval (rvv_take (retval) ((rvv_pack32 ((sqrt_active (0) (retval) ((sqrt_read_at (0) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t0))) (t0_2))) ((sqrt_active (1) (retval) ((sqrt_read_at (1) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t1))) (t1_2))) ((sqrt_active (2) (retval) ((sqrt_read_at (2) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t2))) (t2_2))) ((sqrt_active (3) (retval) ((sqrt_read_at (3) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t3))) (t3_2))) ((sqrt_active (4) (retval) ((sqrt_read_at (4) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t4))) (t4_2))) ((sqrt_active (5) (retval) ((sqrt_read_at (5) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t5))) (t5_2))) ((sqrt_active (6) (retval) ((sqrt_read_at (6) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t6))) (t6_2))) ((sqrt_active (7) (retval) ((sqrt_read_at (7) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t7))) (t7_2))) ((sqrt_active (8) (retval) ((sqrt_read_at (8) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t8))) (t8_2))) ((sqrt_active (9) (retval) ((sqrt_read_at (9) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t9))) (t9_2))) ((sqrt_active (10) (retval) ((sqrt_read_at (10) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t10))) (t10_2))) ((sqrt_active (11) (retval) ((sqrt_read_at (11) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t11))) (t11_2))) ((sqrt_active (12) (retval) ((sqrt_read_at (12) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t12))) (t12_2))) ((sqrt_active (13) (retval) ((sqrt_read_at (13) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t13))) (t13_2))) ((sqrt_active (14) (retval) ((sqrt_read_at (14) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t14))) (t14_2))) ((sqrt_active (15) (retval) ((sqrt_read_at (15) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t15))) (t15_2))) ((sqrt_active (16) (retval) ((sqrt_read_at (16) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t16))) (t16_2))) ((sqrt_active (17) (retval) ((sqrt_read_at (17) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t17))) (t17_2))) ((sqrt_active (18) (retval) ((sqrt_read_at (18) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t18))) (t18_2))) ((sqrt_active (19) (retval) ((sqrt_read_at (19) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t19))) (t19_2))) ((sqrt_active (20) (retval) ((sqrt_read_at (20) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t20))) (t20_2))) ((sqrt_active (21) (retval) ((sqrt_read_at (21) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t21))) (t21_2))) ((sqrt_active (22) (retval) ((sqrt_read_at (22) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t22))) (t22_2))) ((sqrt_active (23) (retval) ((sqrt_read_at (23) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t23))) (t23_2))) ((sqrt_active (24) (retval) ((sqrt_read_at (24) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t24))) (t24_2))) ((sqrt_active (25) (retval) ((sqrt_read_at (25) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t25))) (t25_2))) ((sqrt_active (26) (retval) ((sqrt_read_at (26) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t26))) (t26_2))) ((sqrt_active (27) (retval) ((sqrt_read_at (27) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t27))) (t27_2))) ((sqrt_active (28) (retval) ((sqrt_read_at (28) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t28))) (t28_2))) ((sqrt_active (29) (retval) ((sqrt_read_at (29) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t29))) (t29_2))) ((sqrt_active (30) (retval) ((sqrt_read_at (30) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t30))) (t30_2))) ((sqrt_active (31) (retval) ((sqrt_read_at (31) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t31))) (t31_2)))))) )
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - n ) (sqrt_rvv_values (((batch_pre ÷ 4 ) - n )) (A)) )
|--
  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (n - retval ) ) (sqrt_rvv_values (((batch_pre ÷ 4 ) - (n - retval ) )) (A)) )
).

Definition test_rvv_entail_wit_3_2_split_goal_spatial := 
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (output: Z) (input: Z) (n: Z) (retval: Z) (t31: fp32) (t30: fp32) (t29: fp32) (t28: fp32) (t27: fp32) (t26: fp32) (t25: fp32) (t24: fp32) (t23: fp32) (t22: fp32) (t21: fp32) (t20: fp32) (t19: fp32) (t18: fp32) (t17: fp32) (t16: fp32) (t15: fp32) (t14: fp32) (t13: fp32) (t12: fp32) (t11: fp32) (t10: fp32) (t9: fp32) (t8: fp32) (t7: fp32) (t6: fp32) (t5: fp32) (t4: fp32) (t3: fp32) (t2: fp32) (t1: fp32) (t0: fp32) (t31_2: fp32) (t30_2: fp32) (t29_2: fp32) (t28_2: fp32) (t27_2: fp32) (t26_2: fp32) (t25_2: fp32) (t24_2: fp32) (t23_2: fp32) (t22_2: fp32) (t21_2: fp32) (t20_2: fp32) (t19_2: fp32) (t18_2: fp32) (t17_2: fp32) (t16_2: fp32) (t15_2: fp32) (t14_2: fp32) (t13_2: fp32) (t12_2: fp32) (t11_2: fp32) (t10_2: fp32) (t9_2: fp32) (t8_2: fp32) (t7_2: fp32) (t6_2: fp32) (t5_2: fp32) (t4_2: fp32) (t3_2: fp32) (t2_2: fp32) (t1_2: fp32) (t0_2: fp32) (PreH1 : (0 <= retval)) (PreH2 : (retval <= 32)) (PreH3 : (retval <= n)) (PreH4 : (retval > 0)) (PreH5 : (32 < n)) (PreH6 : (n < 64)) (PreH7 : (((n + 1 ) ÷ 2 ) <= retval)) (PreH8 : (n > 0)) (PreH9 : (sizeof(FLOAT) = 4)) (PreH10 : ((batch_pre % ( 4 ) ) = 0)) (PreH11 : ((batch_pre % ( sizeof(FLOAT) ) ) = 0)) (PreH12 : (0 < (batch_pre ÷ 4 ))) (PreH13 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH14 : (0 <= n)) (PreH15 : (n <= (batch_pre ÷ 4 ))) (PreH16 : (input = (input_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) (PreH17 : (output = (output_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) ,
  (FloatArray.undef_full (output + ((retval + ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (n - retval ) ) ) ) * sizeof(FLOAT))) ((((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - n ) ) - retval ) - ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (n - retval ) ) ) ) )
  **  (FloatArray.full output retval (rvv_take (retval) ((rvv_pack32 ((sqrt_active (0) (retval) ((sqrt_read_at (0) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t0))) (t0_2))) ((sqrt_active (1) (retval) ((sqrt_read_at (1) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t1))) (t1_2))) ((sqrt_active (2) (retval) ((sqrt_read_at (2) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t2))) (t2_2))) ((sqrt_active (3) (retval) ((sqrt_read_at (3) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t3))) (t3_2))) ((sqrt_active (4) (retval) ((sqrt_read_at (4) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t4))) (t4_2))) ((sqrt_active (5) (retval) ((sqrt_read_at (5) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t5))) (t5_2))) ((sqrt_active (6) (retval) ((sqrt_read_at (6) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t6))) (t6_2))) ((sqrt_active (7) (retval) ((sqrt_read_at (7) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t7))) (t7_2))) ((sqrt_active (8) (retval) ((sqrt_read_at (8) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t8))) (t8_2))) ((sqrt_active (9) (retval) ((sqrt_read_at (9) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t9))) (t9_2))) ((sqrt_active (10) (retval) ((sqrt_read_at (10) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t10))) (t10_2))) ((sqrt_active (11) (retval) ((sqrt_read_at (11) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t11))) (t11_2))) ((sqrt_active (12) (retval) ((sqrt_read_at (12) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t12))) (t12_2))) ((sqrt_active (13) (retval) ((sqrt_read_at (13) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t13))) (t13_2))) ((sqrt_active (14) (retval) ((sqrt_read_at (14) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t14))) (t14_2))) ((sqrt_active (15) (retval) ((sqrt_read_at (15) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t15))) (t15_2))) ((sqrt_active (16) (retval) ((sqrt_read_at (16) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t16))) (t16_2))) ((sqrt_active (17) (retval) ((sqrt_read_at (17) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t17))) (t17_2))) ((sqrt_active (18) (retval) ((sqrt_read_at (18) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t18))) (t18_2))) ((sqrt_active (19) (retval) ((sqrt_read_at (19) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t19))) (t19_2))) ((sqrt_active (20) (retval) ((sqrt_read_at (20) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t20))) (t20_2))) ((sqrt_active (21) (retval) ((sqrt_read_at (21) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t21))) (t21_2))) ((sqrt_active (22) (retval) ((sqrt_read_at (22) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t22))) (t22_2))) ((sqrt_active (23) (retval) ((sqrt_read_at (23) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t23))) (t23_2))) ((sqrt_active (24) (retval) ((sqrt_read_at (24) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t24))) (t24_2))) ((sqrt_active (25) (retval) ((sqrt_read_at (25) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t25))) (t25_2))) ((sqrt_active (26) (retval) ((sqrt_read_at (26) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t26))) (t26_2))) ((sqrt_active (27) (retval) ((sqrt_read_at (27) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t27))) (t27_2))) ((sqrt_active (28) (retval) ((sqrt_read_at (28) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t28))) (t28_2))) ((sqrt_active (29) (retval) ((sqrt_read_at (29) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t29))) (t29_2))) ((sqrt_active (30) (retval) ((sqrt_read_at (30) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t30))) (t30_2))) ((sqrt_active (31) (retval) ((sqrt_read_at (31) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t31))) (t31_2)))))) )
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - n ) (sqrt_rvv_values (((batch_pre ÷ 4 ) - n )) (A)) )
|--
  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (n - retval ) ) (sqrt_rvv_values (((batch_pre ÷ 4 ) - (n - retval ) )) (A)) )
.

Definition test_rvv_entail_wit_3_3 := 
(
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (output: Z) (input: Z) (n: Z) (retval: Z) (t31: fp32) (t30: fp32) (t29: fp32) (t28: fp32) (t27: fp32) (t26: fp32) (t25: fp32) (t24: fp32) (t23: fp32) (t22: fp32) (t21: fp32) (t20: fp32) (t19: fp32) (t18: fp32) (t17: fp32) (t16: fp32) (t15: fp32) (t14: fp32) (t13: fp32) (t12: fp32) (t11: fp32) (t10: fp32) (t9: fp32) (t8: fp32) (t7: fp32) (t6: fp32) (t5: fp32) (t4: fp32) (t3: fp32) (t2: fp32) (t1: fp32) (t0: fp32) (t31_2: fp32) (t30_2: fp32) (t29_2: fp32) (t28_2: fp32) (t27_2: fp32) (t26_2: fp32) (t25_2: fp32) (t24_2: fp32) (t23_2: fp32) (t22_2: fp32) (t21_2: fp32) (t20_2: fp32) (t19_2: fp32) (t18_2: fp32) (t17_2: fp32) (t16_2: fp32) (t15_2: fp32) (t14_2: fp32) (t13_2: fp32) (t12_2: fp32) (t11_2: fp32) (t10_2: fp32) (t9_2: fp32) (t8_2: fp32) (t7_2: fp32) (t6_2: fp32) (t5_2: fp32) (t4_2: fp32) (t3_2: fp32) (t2_2: fp32) (t1_2: fp32) (t0_2: fp32) (PreH1 : (0 <= retval)) (PreH2 : (retval <= 32)) (PreH3 : (retval <= n)) (PreH4 : (retval > 0)) (PreH5 : (64 <= n)) (PreH6 : (retval = 32)) (PreH7 : (n > 0)) (PreH8 : (sizeof(FLOAT) = 4)) (PreH9 : ((batch_pre % ( 4 ) ) = 0)) (PreH10 : ((batch_pre % ( sizeof(FLOAT) ) ) = 0)) (PreH11 : (0 < (batch_pre ÷ 4 ))) (PreH12 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH13 : (0 <= n)) (PreH14 : (n <= (batch_pre ÷ 4 ))) (PreH15 : (input = (input_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) (PreH16 : (output = (output_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) ,
  (FloatArray.full output retval (rvv_take (retval) ((rvv_pack32 ((sqrt_active (0) (retval) ((sqrt_read_at (0) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t0))) (t0_2))) ((sqrt_active (1) (retval) ((sqrt_read_at (1) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t1))) (t1_2))) ((sqrt_active (2) (retval) ((sqrt_read_at (2) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t2))) (t2_2))) ((sqrt_active (3) (retval) ((sqrt_read_at (3) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t3))) (t3_2))) ((sqrt_active (4) (retval) ((sqrt_read_at (4) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t4))) (t4_2))) ((sqrt_active (5) (retval) ((sqrt_read_at (5) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t5))) (t5_2))) ((sqrt_active (6) (retval) ((sqrt_read_at (6) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t6))) (t6_2))) ((sqrt_active (7) (retval) ((sqrt_read_at (7) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t7))) (t7_2))) ((sqrt_active (8) (retval) ((sqrt_read_at (8) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t8))) (t8_2))) ((sqrt_active (9) (retval) ((sqrt_read_at (9) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t9))) (t9_2))) ((sqrt_active (10) (retval) ((sqrt_read_at (10) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t10))) (t10_2))) ((sqrt_active (11) (retval) ((sqrt_read_at (11) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t11))) (t11_2))) ((sqrt_active (12) (retval) ((sqrt_read_at (12) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t12))) (t12_2))) ((sqrt_active (13) (retval) ((sqrt_read_at (13) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t13))) (t13_2))) ((sqrt_active (14) (retval) ((sqrt_read_at (14) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t14))) (t14_2))) ((sqrt_active (15) (retval) ((sqrt_read_at (15) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t15))) (t15_2))) ((sqrt_active (16) (retval) ((sqrt_read_at (16) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t16))) (t16_2))) ((sqrt_active (17) (retval) ((sqrt_read_at (17) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t17))) (t17_2))) ((sqrt_active (18) (retval) ((sqrt_read_at (18) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t18))) (t18_2))) ((sqrt_active (19) (retval) ((sqrt_read_at (19) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t19))) (t19_2))) ((sqrt_active (20) (retval) ((sqrt_read_at (20) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t20))) (t20_2))) ((sqrt_active (21) (retval) ((sqrt_read_at (21) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t21))) (t21_2))) ((sqrt_active (22) (retval) ((sqrt_read_at (22) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t22))) (t22_2))) ((sqrt_active (23) (retval) ((sqrt_read_at (23) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t23))) (t23_2))) ((sqrt_active (24) (retval) ((sqrt_read_at (24) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t24))) (t24_2))) ((sqrt_active (25) (retval) ((sqrt_read_at (25) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t25))) (t25_2))) ((sqrt_active (26) (retval) ((sqrt_read_at (26) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t26))) (t26_2))) ((sqrt_active (27) (retval) ((sqrt_read_at (27) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t27))) (t27_2))) ((sqrt_active (28) (retval) ((sqrt_read_at (28) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t28))) (t28_2))) ((sqrt_active (29) (retval) ((sqrt_read_at (29) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t29))) (t29_2))) ((sqrt_active (30) (retval) ((sqrt_read_at (30) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t30))) (t30_2))) ((sqrt_active (31) (retval) ((sqrt_read_at (31) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t31))) (t31_2)))))) )
  **  (FloatArray.undef_full (output + (retval * sizeof(FLOAT))) (((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - n ) ) - retval ) )
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - n ) (sqrt_rvv_values (((batch_pre ÷ 4 ) - n )) (A)) )
|--
  “ (sizeof(FLOAT) = 4) ” 
  &&  “ ((batch_pre % ( 4 ) ) = 0) ” 
  &&  “ ((batch_pre % ( sizeof(FLOAT) ) ) = 0) ” 
  &&  “ (0 < (batch_pre ÷ 4 )) ” 
  &&  “ ((batch_pre ÷ 4 ) <= 4611686018427387903) ” 
  &&  “ (0 <= (n - retval )) ” 
  &&  “ ((n - retval ) <= (batch_pre ÷ 4 )) ” 
  &&  “ ((input + (retval * sizeof(FLOAT))) = (input_pre + (((batch_pre ÷ 4 ) - (n - retval ) ) * sizeof(FLOAT)))) ” 
  &&  “ ((output + (retval * sizeof(FLOAT))) = (output_pre + (((batch_pre ÷ 4 ) - (n - retval ) ) * sizeof(FLOAT)))) ”
  &&  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (n - retval ) ) (sqrt_rvv_values (((batch_pre ÷ 4 ) - (n - retval ) )) (A)) )
  **  (FloatArray.undef_full (output + (retval * sizeof(FLOAT))) ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (n - retval ) ) ) )
) \/
(
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (output: Z) (input: Z) (n: Z) (retval: Z) (t31: fp32) (t30: fp32) (t29: fp32) (t28: fp32) (t27: fp32) (t26: fp32) (t25: fp32) (t24: fp32) (t23: fp32) (t22: fp32) (t21: fp32) (t20: fp32) (t19: fp32) (t18: fp32) (t17: fp32) (t16: fp32) (t15: fp32) (t14: fp32) (t13: fp32) (t12: fp32) (t11: fp32) (t10: fp32) (t9: fp32) (t8: fp32) (t7: fp32) (t6: fp32) (t5: fp32) (t4: fp32) (t3: fp32) (t2: fp32) (t1: fp32) (t0: fp32) (t31_2: fp32) (t30_2: fp32) (t29_2: fp32) (t28_2: fp32) (t27_2: fp32) (t26_2: fp32) (t25_2: fp32) (t24_2: fp32) (t23_2: fp32) (t22_2: fp32) (t21_2: fp32) (t20_2: fp32) (t19_2: fp32) (t18_2: fp32) (t17_2: fp32) (t16_2: fp32) (t15_2: fp32) (t14_2: fp32) (t13_2: fp32) (t12_2: fp32) (t11_2: fp32) (t10_2: fp32) (t9_2: fp32) (t8_2: fp32) (t7_2: fp32) (t6_2: fp32) (t5_2: fp32) (t4_2: fp32) (t3_2: fp32) (t2_2: fp32) (t1_2: fp32) (t0_2: fp32) (PreH1 : (0 <= retval)) (PreH2 : (retval <= 32)) (PreH3 : (retval <= n)) (PreH4 : (retval > 0)) (PreH5 : (64 <= n)) (PreH6 : (retval = 32)) (PreH7 : (n > 0)) (PreH8 : (sizeof(FLOAT) = 4)) (PreH9 : ((batch_pre % ( 4 ) ) = 0)) (PreH10 : ((batch_pre % ( sizeof(FLOAT) ) ) = 0)) (PreH11 : (0 < (batch_pre ÷ 4 ))) (PreH12 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH13 : (0 <= n)) (PreH14 : (n <= (batch_pre ÷ 4 ))) (PreH15 : (input = (input_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) (PreH16 : (output = (output_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) ,
  (FloatArray.undef_full (output + ((retval + ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (n - retval ) ) ) ) * sizeof(FLOAT))) ((((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - n ) ) - retval ) - ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (n - retval ) ) ) ) )
  **  (FloatArray.full output retval (rvv_take (retval) ((rvv_pack32 ((sqrt_active (0) (retval) ((sqrt_read_at (0) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t0))) (t0_2))) ((sqrt_active (1) (retval) ((sqrt_read_at (1) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t1))) (t1_2))) ((sqrt_active (2) (retval) ((sqrt_read_at (2) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t2))) (t2_2))) ((sqrt_active (3) (retval) ((sqrt_read_at (3) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t3))) (t3_2))) ((sqrt_active (4) (retval) ((sqrt_read_at (4) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t4))) (t4_2))) ((sqrt_active (5) (retval) ((sqrt_read_at (5) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t5))) (t5_2))) ((sqrt_active (6) (retval) ((sqrt_read_at (6) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t6))) (t6_2))) ((sqrt_active (7) (retval) ((sqrt_read_at (7) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t7))) (t7_2))) ((sqrt_active (8) (retval) ((sqrt_read_at (8) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t8))) (t8_2))) ((sqrt_active (9) (retval) ((sqrt_read_at (9) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t9))) (t9_2))) ((sqrt_active (10) (retval) ((sqrt_read_at (10) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t10))) (t10_2))) ((sqrt_active (11) (retval) ((sqrt_read_at (11) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t11))) (t11_2))) ((sqrt_active (12) (retval) ((sqrt_read_at (12) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t12))) (t12_2))) ((sqrt_active (13) (retval) ((sqrt_read_at (13) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t13))) (t13_2))) ((sqrt_active (14) (retval) ((sqrt_read_at (14) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t14))) (t14_2))) ((sqrt_active (15) (retval) ((sqrt_read_at (15) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t15))) (t15_2))) ((sqrt_active (16) (retval) ((sqrt_read_at (16) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t16))) (t16_2))) ((sqrt_active (17) (retval) ((sqrt_read_at (17) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t17))) (t17_2))) ((sqrt_active (18) (retval) ((sqrt_read_at (18) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t18))) (t18_2))) ((sqrt_active (19) (retval) ((sqrt_read_at (19) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t19))) (t19_2))) ((sqrt_active (20) (retval) ((sqrt_read_at (20) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t20))) (t20_2))) ((sqrt_active (21) (retval) ((sqrt_read_at (21) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t21))) (t21_2))) ((sqrt_active (22) (retval) ((sqrt_read_at (22) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t22))) (t22_2))) ((sqrt_active (23) (retval) ((sqrt_read_at (23) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t23))) (t23_2))) ((sqrt_active (24) (retval) ((sqrt_read_at (24) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t24))) (t24_2))) ((sqrt_active (25) (retval) ((sqrt_read_at (25) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t25))) (t25_2))) ((sqrt_active (26) (retval) ((sqrt_read_at (26) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t26))) (t26_2))) ((sqrt_active (27) (retval) ((sqrt_read_at (27) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t27))) (t27_2))) ((sqrt_active (28) (retval) ((sqrt_read_at (28) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t28))) (t28_2))) ((sqrt_active (29) (retval) ((sqrt_read_at (29) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t29))) (t29_2))) ((sqrt_active (30) (retval) ((sqrt_read_at (30) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t30))) (t30_2))) ((sqrt_active (31) (retval) ((sqrt_read_at (31) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t31))) (t31_2)))))) )
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - n ) (sqrt_rvv_values (((batch_pre ÷ 4 ) - n )) (A)) )
|--
  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (n - retval ) ) (sqrt_rvv_values (((batch_pre ÷ 4 ) - (n - retval ) )) (A)) )
).

Definition test_rvv_entail_wit_3_3_split_goal_spatial := 
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (output: Z) (input: Z) (n: Z) (retval: Z) (t31: fp32) (t30: fp32) (t29: fp32) (t28: fp32) (t27: fp32) (t26: fp32) (t25: fp32) (t24: fp32) (t23: fp32) (t22: fp32) (t21: fp32) (t20: fp32) (t19: fp32) (t18: fp32) (t17: fp32) (t16: fp32) (t15: fp32) (t14: fp32) (t13: fp32) (t12: fp32) (t11: fp32) (t10: fp32) (t9: fp32) (t8: fp32) (t7: fp32) (t6: fp32) (t5: fp32) (t4: fp32) (t3: fp32) (t2: fp32) (t1: fp32) (t0: fp32) (t31_2: fp32) (t30_2: fp32) (t29_2: fp32) (t28_2: fp32) (t27_2: fp32) (t26_2: fp32) (t25_2: fp32) (t24_2: fp32) (t23_2: fp32) (t22_2: fp32) (t21_2: fp32) (t20_2: fp32) (t19_2: fp32) (t18_2: fp32) (t17_2: fp32) (t16_2: fp32) (t15_2: fp32) (t14_2: fp32) (t13_2: fp32) (t12_2: fp32) (t11_2: fp32) (t10_2: fp32) (t9_2: fp32) (t8_2: fp32) (t7_2: fp32) (t6_2: fp32) (t5_2: fp32) (t4_2: fp32) (t3_2: fp32) (t2_2: fp32) (t1_2: fp32) (t0_2: fp32) (PreH1 : (0 <= retval)) (PreH2 : (retval <= 32)) (PreH3 : (retval <= n)) (PreH4 : (retval > 0)) (PreH5 : (64 <= n)) (PreH6 : (retval = 32)) (PreH7 : (n > 0)) (PreH8 : (sizeof(FLOAT) = 4)) (PreH9 : ((batch_pre % ( 4 ) ) = 0)) (PreH10 : ((batch_pre % ( sizeof(FLOAT) ) ) = 0)) (PreH11 : (0 < (batch_pre ÷ 4 ))) (PreH12 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH13 : (0 <= n)) (PreH14 : (n <= (batch_pre ÷ 4 ))) (PreH15 : (input = (input_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) (PreH16 : (output = (output_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) ,
  (FloatArray.undef_full (output + ((retval + ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (n - retval ) ) ) ) * sizeof(FLOAT))) ((((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - n ) ) - retval ) - ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (n - retval ) ) ) ) )
  **  (FloatArray.full output retval (rvv_take (retval) ((rvv_pack32 ((sqrt_active (0) (retval) ((sqrt_read_at (0) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t0))) (t0_2))) ((sqrt_active (1) (retval) ((sqrt_read_at (1) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t1))) (t1_2))) ((sqrt_active (2) (retval) ((sqrt_read_at (2) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t2))) (t2_2))) ((sqrt_active (3) (retval) ((sqrt_read_at (3) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t3))) (t3_2))) ((sqrt_active (4) (retval) ((sqrt_read_at (4) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t4))) (t4_2))) ((sqrt_active (5) (retval) ((sqrt_read_at (5) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t5))) (t5_2))) ((sqrt_active (6) (retval) ((sqrt_read_at (6) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t6))) (t6_2))) ((sqrt_active (7) (retval) ((sqrt_read_at (7) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t7))) (t7_2))) ((sqrt_active (8) (retval) ((sqrt_read_at (8) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t8))) (t8_2))) ((sqrt_active (9) (retval) ((sqrt_read_at (9) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t9))) (t9_2))) ((sqrt_active (10) (retval) ((sqrt_read_at (10) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t10))) (t10_2))) ((sqrt_active (11) (retval) ((sqrt_read_at (11) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t11))) (t11_2))) ((sqrt_active (12) (retval) ((sqrt_read_at (12) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t12))) (t12_2))) ((sqrt_active (13) (retval) ((sqrt_read_at (13) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t13))) (t13_2))) ((sqrt_active (14) (retval) ((sqrt_read_at (14) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t14))) (t14_2))) ((sqrt_active (15) (retval) ((sqrt_read_at (15) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t15))) (t15_2))) ((sqrt_active (16) (retval) ((sqrt_read_at (16) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t16))) (t16_2))) ((sqrt_active (17) (retval) ((sqrt_read_at (17) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t17))) (t17_2))) ((sqrt_active (18) (retval) ((sqrt_read_at (18) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t18))) (t18_2))) ((sqrt_active (19) (retval) ((sqrt_read_at (19) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t19))) (t19_2))) ((sqrt_active (20) (retval) ((sqrt_read_at (20) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t20))) (t20_2))) ((sqrt_active (21) (retval) ((sqrt_read_at (21) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t21))) (t21_2))) ((sqrt_active (22) (retval) ((sqrt_read_at (22) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t22))) (t22_2))) ((sqrt_active (23) (retval) ((sqrt_read_at (23) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t23))) (t23_2))) ((sqrt_active (24) (retval) ((sqrt_read_at (24) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t24))) (t24_2))) ((sqrt_active (25) (retval) ((sqrt_read_at (25) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t25))) (t25_2))) ((sqrt_active (26) (retval) ((sqrt_read_at (26) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t26))) (t26_2))) ((sqrt_active (27) (retval) ((sqrt_read_at (27) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t27))) (t27_2))) ((sqrt_active (28) (retval) ((sqrt_read_at (28) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t28))) (t28_2))) ((sqrt_active (29) (retval) ((sqrt_read_at (29) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t29))) (t29_2))) ((sqrt_active (30) (retval) ((sqrt_read_at (30) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t30))) (t30_2))) ((sqrt_active (31) (retval) ((sqrt_read_at (31) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t31))) (t31_2)))))) )
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - n ) (sqrt_rvv_values (((batch_pre ÷ 4 ) - n )) (A)) )
|--
  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (n - retval ) ) (sqrt_rvv_values (((batch_pre ÷ 4 ) - (n - retval ) )) (A)) )
.

Definition test_rvv_return_wit_1 := 
(
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (output: Z) (input: Z) (n: Z) (PreH1 : (n <= 0)) (PreH2 : (sizeof(FLOAT) = 4)) (PreH3 : ((batch_pre % ( 4 ) ) = 0)) (PreH4 : ((batch_pre % ( sizeof(FLOAT) ) ) = 0)) (PreH5 : (0 < (batch_pre ÷ 4 ))) (PreH6 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH7 : (0 <= n)) (PreH8 : (n <= (batch_pre ÷ 4 ))) (PreH9 : (input = (input_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) (PreH10 : (output = (output_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) ,
  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - n ) (sqrt_rvv_values (((batch_pre ÷ 4 ) - n )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - n ) ) )
|--
  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.full output_pre (batch_pre ÷ 4 ) (sqrt_rvv_values ((batch_pre ÷ 4 )) (A)) )
) \/
(
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (output: Z) (input: Z) (n: Z) (PreH1 : (n <= 0)) (PreH2 : (sizeof(FLOAT) = 4)) (PreH3 : ((batch_pre % ( 4 ) ) = 0)) (PreH4 : ((batch_pre % ( sizeof(FLOAT) ) ) = 0)) (PreH5 : (0 < (batch_pre ÷ 4 ))) (PreH6 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH7 : (0 <= n)) (PreH8 : (n <= (batch_pre ÷ 4 ))) (PreH9 : (input = (input_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) (PreH10 : (output = (output_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) ,
  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - n ) (sqrt_rvv_values (((batch_pre ÷ 4 ) - n )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - n ) ) )
|--
  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.full output_pre (batch_pre ÷ 4 ) (sqrt_rvv_values ((batch_pre ÷ 4 )) (A)) )
).

Definition test_rvv_return_wit_1_split_goal_spatial := 
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (output: Z) (input: Z) (n: Z) (PreH1 : (n <= 0)) (PreH2 : (sizeof(FLOAT) = 4)) (PreH3 : ((batch_pre % ( 4 ) ) = 0)) (PreH4 : ((batch_pre % ( sizeof(FLOAT) ) ) = 0)) (PreH5 : (0 < (batch_pre ÷ 4 ))) (PreH6 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH7 : (0 <= n)) (PreH8 : (n <= (batch_pre ÷ 4 ))) (PreH9 : (input = (input_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) (PreH10 : (output = (output_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) ,
  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - n ) (sqrt_rvv_values (((batch_pre ÷ 4 ) - n )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - n ) ) )
|--
  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.full output_pre (batch_pre ÷ 4 ) (sqrt_rvv_values ((batch_pre ÷ 4 )) (A)) )
.

Definition test_rvv_partial_solve_wit_1_pure := 
forall (unused_params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (PreH1 : (batch_pre <> 0)) (PreH2 : (0 < batch_pre)) (PreH3 : (batch_pre <= UINT64_MAX)) (PreH4 : ((batch_pre % ( 4 ) ) = 0)) (PreH5 : (input_pre <> 0)) (PreH6 : (output_pre <> 0)) (PreH7 : (sizeof(FLOAT) = 4)) (PreH8 : ((batch_pre % ( sizeof(FLOAT) ) ) = 0)) (PreH9 : (0 < (batch_pre ÷ 4 ))) (PreH10 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) ,
  ((( &( "unused_params" ) )) # Ptr  |-> unused_params_pre)
  **  ((( &( "batch" ) )) # UInt64  |-> batch_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.undef_full output_pre (batch_pre ÷ 4 ) )
|--
  “ (1 <> 0) ”
.

Definition test_rvv_partial_solve_wit_1_aux := 
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (PreH1 : (batch_pre <> 0)) (PreH2 : (0 < batch_pre)) (PreH3 : (batch_pre <= UINT64_MAX)) (PreH4 : ((batch_pre % ( 4 ) ) = 0)) (PreH5 : (input_pre <> 0)) (PreH6 : (output_pre <> 0)) (PreH7 : (sizeof(FLOAT) = 4)) (PreH8 : ((batch_pre % ( sizeof(FLOAT) ) ) = 0)) (PreH9 : (0 < (batch_pre ÷ 4 ))) (PreH10 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) ,
  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.undef_full output_pre (batch_pre ÷ 4 ) )
|--
  “ (1 <> 0) ” 
  &&  “ (batch_pre <> 0) ” 
  &&  “ (0 < batch_pre) ” 
  &&  “ (batch_pre <= UINT64_MAX) ” 
  &&  “ ((batch_pre % ( 4 ) ) = 0) ” 
  &&  “ (input_pre <> 0) ” 
  &&  “ (output_pre <> 0) ” 
  &&  “ (sizeof(FLOAT) = 4) ” 
  &&  “ ((batch_pre % ( sizeof(FLOAT) ) ) = 0) ” 
  &&  “ (0 < (batch_pre ÷ 4 )) ” 
  &&  “ ((batch_pre ÷ 4 ) <= 4611686018427387903) ”
  &&  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.undef_full output_pre (batch_pre ÷ 4 ) )
.

Definition test_rvv_partial_solve_wit_1 := test_rvv_partial_solve_wit_1_pure -> test_rvv_partial_solve_wit_1_aux.

Definition test_rvv_partial_solve_wit_2_pure := 
forall (unused_params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (PreH1 : ((batch_pre % ( sizeof(FLOAT) ) ) = 0)) (PreH2 : (batch_pre <> 0)) (PreH3 : (0 < batch_pre)) (PreH4 : (batch_pre <= UINT64_MAX)) (PreH5 : ((batch_pre % ( 4 ) ) = 0)) (PreH6 : (input_pre <> 0)) (PreH7 : (output_pre <> 0)) (PreH8 : (sizeof(FLOAT) = 4)) (PreH9 : ((batch_pre % ( sizeof(FLOAT) ) ) = 0)) (PreH10 : (0 < (batch_pre ÷ 4 ))) (PreH11 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) ,
  ((( &( "unused_params" ) )) # Ptr  |-> unused_params_pre)
  **  ((( &( "batch" ) )) # UInt64  |-> batch_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.undef_full output_pre (batch_pre ÷ 4 ) )
|--
  “ (1 <> 0) ”
.

Definition test_rvv_partial_solve_wit_2_aux := 
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (PreH1 : ((batch_pre % ( sizeof(FLOAT) ) ) = 0)) (PreH2 : (batch_pre <> 0)) (PreH3 : (0 < batch_pre)) (PreH4 : (batch_pre <= UINT64_MAX)) (PreH5 : ((batch_pre % ( 4 ) ) = 0)) (PreH6 : (input_pre <> 0)) (PreH7 : (output_pre <> 0)) (PreH8 : (sizeof(FLOAT) = 4)) (PreH9 : ((batch_pre % ( sizeof(FLOAT) ) ) = 0)) (PreH10 : (0 < (batch_pre ÷ 4 ))) (PreH11 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) ,
  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.undef_full output_pre (batch_pre ÷ 4 ) )
|--
  “ (1 <> 0) ” 
  &&  “ ((batch_pre % ( sizeof(FLOAT) ) ) = 0) ” 
  &&  “ (batch_pre <> 0) ” 
  &&  “ (0 < batch_pre) ” 
  &&  “ (batch_pre <= UINT64_MAX) ” 
  &&  “ ((batch_pre % ( 4 ) ) = 0) ” 
  &&  “ (input_pre <> 0) ” 
  &&  “ (output_pre <> 0) ” 
  &&  “ (sizeof(FLOAT) = 4) ” 
  &&  “ ((batch_pre % ( sizeof(FLOAT) ) ) = 0) ” 
  &&  “ (0 < (batch_pre ÷ 4 )) ” 
  &&  “ ((batch_pre ÷ 4 ) <= 4611686018427387903) ”
  &&  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.undef_full output_pre (batch_pre ÷ 4 ) )
.

Definition test_rvv_partial_solve_wit_2 := test_rvv_partial_solve_wit_2_pure -> test_rvv_partial_solve_wit_2_aux.

Definition test_rvv_partial_solve_wit_3_pure := 
forall (unused_params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (PreH1 : (input_pre <> 0)) (PreH2 : ((batch_pre % ( sizeof(FLOAT) ) ) = 0)) (PreH3 : (batch_pre <> 0)) (PreH4 : (0 < batch_pre)) (PreH5 : (batch_pre <= UINT64_MAX)) (PreH6 : ((batch_pre % ( 4 ) ) = 0)) (PreH7 : (input_pre <> 0)) (PreH8 : (output_pre <> 0)) (PreH9 : (sizeof(FLOAT) = 4)) (PreH10 : ((batch_pre % ( sizeof(FLOAT) ) ) = 0)) (PreH11 : (0 < (batch_pre ÷ 4 ))) (PreH12 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) ,
  ((( &( "unused_params" ) )) # Ptr  |-> unused_params_pre)
  **  ((( &( "batch" ) )) # UInt64  |-> batch_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.undef_full output_pre (batch_pre ÷ 4 ) )
|--
  “ (1 <> 0) ”
.

Definition test_rvv_partial_solve_wit_3_aux := 
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (PreH1 : (input_pre <> 0)) (PreH2 : ((batch_pre % ( sizeof(FLOAT) ) ) = 0)) (PreH3 : (batch_pre <> 0)) (PreH4 : (0 < batch_pre)) (PreH5 : (batch_pre <= UINT64_MAX)) (PreH6 : ((batch_pre % ( 4 ) ) = 0)) (PreH7 : (input_pre <> 0)) (PreH8 : (output_pre <> 0)) (PreH9 : (sizeof(FLOAT) = 4)) (PreH10 : ((batch_pre % ( sizeof(FLOAT) ) ) = 0)) (PreH11 : (0 < (batch_pre ÷ 4 ))) (PreH12 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) ,
  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.undef_full output_pre (batch_pre ÷ 4 ) )
|--
  “ (1 <> 0) ” 
  &&  “ (input_pre <> 0) ” 
  &&  “ ((batch_pre % ( sizeof(FLOAT) ) ) = 0) ” 
  &&  “ (batch_pre <> 0) ” 
  &&  “ (0 < batch_pre) ” 
  &&  “ (batch_pre <= UINT64_MAX) ” 
  &&  “ ((batch_pre % ( 4 ) ) = 0) ” 
  &&  “ (input_pre <> 0) ” 
  &&  “ (output_pre <> 0) ” 
  &&  “ (sizeof(FLOAT) = 4) ” 
  &&  “ ((batch_pre % ( sizeof(FLOAT) ) ) = 0) ” 
  &&  “ (0 < (batch_pre ÷ 4 )) ” 
  &&  “ ((batch_pre ÷ 4 ) <= 4611686018427387903) ”
  &&  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.undef_full output_pre (batch_pre ÷ 4 ) )
.

Definition test_rvv_partial_solve_wit_3 := test_rvv_partial_solve_wit_3_pure -> test_rvv_partial_solve_wit_3_aux.

Definition test_rvv_partial_solve_wit_4_pure := 
forall (unused_params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (PreH1 : (output_pre <> 0)) (PreH2 : (input_pre <> 0)) (PreH3 : ((batch_pre % ( sizeof(FLOAT) ) ) = 0)) (PreH4 : (batch_pre <> 0)) (PreH5 : (0 < batch_pre)) (PreH6 : (batch_pre <= UINT64_MAX)) (PreH7 : ((batch_pre % ( 4 ) ) = 0)) (PreH8 : (input_pre <> 0)) (PreH9 : (output_pre <> 0)) (PreH10 : (sizeof(FLOAT) = 4)) (PreH11 : ((batch_pre % ( sizeof(FLOAT) ) ) = 0)) (PreH12 : (0 < (batch_pre ÷ 4 ))) (PreH13 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) ,
  ((( &( "unused_params" ) )) # Ptr  |-> unused_params_pre)
  **  ((( &( "batch" ) )) # UInt64  |-> batch_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "output" ) )) # Ptr  |-> output_pre)
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.undef_full output_pre (batch_pre ÷ 4 ) )
|--
  “ (1 <> 0) ”
.

Definition test_rvv_partial_solve_wit_4_aux := 
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (PreH1 : (output_pre <> 0)) (PreH2 : (input_pre <> 0)) (PreH3 : ((batch_pre % ( sizeof(FLOAT) ) ) = 0)) (PreH4 : (batch_pre <> 0)) (PreH5 : (0 < batch_pre)) (PreH6 : (batch_pre <= UINT64_MAX)) (PreH7 : ((batch_pre % ( 4 ) ) = 0)) (PreH8 : (input_pre <> 0)) (PreH9 : (output_pre <> 0)) (PreH10 : (sizeof(FLOAT) = 4)) (PreH11 : ((batch_pre % ( sizeof(FLOAT) ) ) = 0)) (PreH12 : (0 < (batch_pre ÷ 4 ))) (PreH13 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) ,
  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.undef_full output_pre (batch_pre ÷ 4 ) )
|--
  “ (1 <> 0) ” 
  &&  “ (output_pre <> 0) ” 
  &&  “ (input_pre <> 0) ” 
  &&  “ ((batch_pre % ( sizeof(FLOAT) ) ) = 0) ” 
  &&  “ (batch_pre <> 0) ” 
  &&  “ (0 < batch_pre) ” 
  &&  “ (batch_pre <= UINT64_MAX) ” 
  &&  “ ((batch_pre % ( 4 ) ) = 0) ” 
  &&  “ (input_pre <> 0) ” 
  &&  “ (output_pre <> 0) ” 
  &&  “ (sizeof(FLOAT) = 4) ” 
  &&  “ ((batch_pre % ( sizeof(FLOAT) ) ) = 0) ” 
  &&  “ (0 < (batch_pre ÷ 4 )) ” 
  &&  “ ((batch_pre ÷ 4 ) <= 4611686018427387903) ”
  &&  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.undef_full output_pre (batch_pre ÷ 4 ) )
.

Definition test_rvv_partial_solve_wit_4 := test_rvv_partial_solve_wit_4_pure -> test_rvv_partial_solve_wit_4_aux.

Definition test_rvv_partial_solve_wit_5 := 
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (output: Z) (input: Z) (n: Z) (PreH1 : (n > 0)) (PreH2 : (sizeof(FLOAT) = 4)) (PreH3 : ((batch_pre % ( 4 ) ) = 0)) (PreH4 : ((batch_pre % ( sizeof(FLOAT) ) ) = 0)) (PreH5 : (0 < (batch_pre ÷ 4 ))) (PreH6 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH7 : (0 <= n)) (PreH8 : (n <= (batch_pre ÷ 4 ))) (PreH9 : (input = (input_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) (PreH10 : (output = (output_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) ,
  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - n ) (sqrt_rvv_values (((batch_pre ÷ 4 ) - n )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - n ) ) )
|--
  “ (n > 0) ” 
  &&  “ (sizeof(FLOAT) = 4) ” 
  &&  “ ((batch_pre % ( 4 ) ) = 0) ” 
  &&  “ ((batch_pre % ( sizeof(FLOAT) ) ) = 0) ” 
  &&  “ (0 < (batch_pre ÷ 4 )) ” 
  &&  “ ((batch_pre ÷ 4 ) <= 4611686018427387903) ” 
  &&  “ (0 <= n) ” 
  &&  “ (n <= (batch_pre ÷ 4 )) ” 
  &&  “ (input = (input_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT)))) ”
  &&  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - n ) (sqrt_rvv_values (((batch_pre ÷ 4 ) - n )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - n ) ) )
.

Definition test_rvv_partial_solve_wit_6_pure := 
forall (unused_params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (output: Z) (input: Z) (n: Z) (retval: Z) (PreH1 : (0 <= retval)) (PreH2 : (retval <= 32)) (PreH3 : (retval <= n)) (PreH4 : (retval > 0)) (PreH5 : (n <= 32)) (PreH6 : (retval = n)) (PreH7 : (n > 0)) (PreH8 : (sizeof(FLOAT) = 4)) (PreH9 : ((batch_pre % ( 4 ) ) = 0)) (PreH10 : ((batch_pre % ( sizeof(FLOAT) ) ) = 0)) (PreH11 : (0 < (batch_pre ÷ 4 ))) (PreH12 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH13 : (0 <= n)) (PreH14 : (n <= (batch_pre ÷ 4 ))) (PreH15 : (input = (input_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) (PreH16 : (output = (output_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) ,
  (UndefStructPredvfloat32m8_t ( &( "vx" ) ) )
  **  ((( &( "vl" ) )) # UInt64  |-> retval)
  **  ((( &( "unused_params" ) )) # Ptr  |-> unused_params_pre)
  **  ((( &( "batch" ) )) # UInt64  |-> batch_pre)
  **  ((( &( "n" ) )) # UInt64  |-> n)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - n ) (sqrt_rvv_values (((batch_pre ÷ 4 ) - n )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - n ) ) )
|--
  “ (0 <= retval) ” 
  &&  “ (retval <= 32) ” 
  &&  “ (0 <= ((batch_pre ÷ 4 ) - n )) ” 
  &&  “ ((((batch_pre ÷ 4 ) - n ) + retval ) <= ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ (input = (input_pre + (4 * ((batch_pre ÷ 4 ) - n ) ) )) ”
.

Definition test_rvv_partial_solve_wit_6_aux := 
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (output: Z) (input: Z) (n: Z) (retval: Z) (PreH1 : (0 <= retval)) (PreH2 : (retval <= 32)) (PreH3 : (retval <= n)) (PreH4 : (retval > 0)) (PreH5 : (n <= 32)) (PreH6 : (retval = n)) (PreH7 : (n > 0)) (PreH8 : (sizeof(FLOAT) = 4)) (PreH9 : ((batch_pre % ( 4 ) ) = 0)) (PreH10 : ((batch_pre % ( sizeof(FLOAT) ) ) = 0)) (PreH11 : (0 < (batch_pre ÷ 4 ))) (PreH12 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH13 : (0 <= n)) (PreH14 : (n <= (batch_pre ÷ 4 ))) (PreH15 : (input = (input_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) (PreH16 : (output = (output_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) ,
  (UndefStructPredvfloat32m8_t ( &( "vx" ) ) )
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - n ) (sqrt_rvv_values (((batch_pre ÷ 4 ) - n )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - n ) ) )
|--
  “ (0 <= retval) ” 
  &&  “ (retval <= 32) ” 
  &&  “ (0 <= ((batch_pre ÷ 4 ) - n )) ” 
  &&  “ ((((batch_pre ÷ 4 ) - n ) + retval ) <= ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ (input = (input_pre + (4 * ((batch_pre ÷ 4 ) - n ) ) )) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 32) ” 
  &&  “ (retval <= n) ” 
  &&  “ (retval > 0) ” 
  &&  “ (n <= 32) ” 
  &&  “ (retval = n) ” 
  &&  “ (n > 0) ” 
  &&  “ (sizeof(FLOAT) = 4) ” 
  &&  “ ((batch_pre % ( 4 ) ) = 0) ” 
  &&  “ ((batch_pre % ( sizeof(FLOAT) ) ) = 0) ” 
  &&  “ (0 < (batch_pre ÷ 4 )) ” 
  &&  “ ((batch_pre ÷ 4 ) <= 4611686018427387903) ” 
  &&  “ (0 <= n) ” 
  &&  “ (n <= (batch_pre ÷ 4 )) ” 
  &&  “ (input = (input_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT)))) ”
  &&  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (UndefStructPredvfloat32m8_t ( &( "vx" ) ) )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - n ) (sqrt_rvv_values (((batch_pre ÷ 4 ) - n )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - n ) ) )
.

Definition test_rvv_partial_solve_wit_6 := test_rvv_partial_solve_wit_6_pure -> test_rvv_partial_solve_wit_6_aux.

Definition test_rvv_partial_solve_wit_7_pure := 
forall (unused_params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (output: Z) (input: Z) (n: Z) (retval: Z) (PreH1 : (0 <= retval)) (PreH2 : (retval <= 32)) (PreH3 : (retval <= n)) (PreH4 : (retval > 0)) (PreH5 : (32 < n)) (PreH6 : (n < 64)) (PreH7 : (((n + 1 ) ÷ 2 ) <= retval)) (PreH8 : (n > 0)) (PreH9 : (sizeof(FLOAT) = 4)) (PreH10 : ((batch_pre % ( 4 ) ) = 0)) (PreH11 : ((batch_pre % ( sizeof(FLOAT) ) ) = 0)) (PreH12 : (0 < (batch_pre ÷ 4 ))) (PreH13 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH14 : (0 <= n)) (PreH15 : (n <= (batch_pre ÷ 4 ))) (PreH16 : (input = (input_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) (PreH17 : (output = (output_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) ,
  (UndefStructPredvfloat32m8_t ( &( "vx" ) ) )
  **  ((( &( "vl" ) )) # UInt64  |-> retval)
  **  ((( &( "unused_params" ) )) # Ptr  |-> unused_params_pre)
  **  ((( &( "batch" ) )) # UInt64  |-> batch_pre)
  **  ((( &( "n" ) )) # UInt64  |-> n)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - n ) (sqrt_rvv_values (((batch_pre ÷ 4 ) - n )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - n ) ) )
|--
  “ (0 <= retval) ” 
  &&  “ (retval <= 32) ” 
  &&  “ (0 <= ((batch_pre ÷ 4 ) - n )) ” 
  &&  “ ((((batch_pre ÷ 4 ) - n ) + retval ) <= ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ (input = (input_pre + (4 * ((batch_pre ÷ 4 ) - n ) ) )) ”
.

Definition test_rvv_partial_solve_wit_7_aux := 
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (output: Z) (input: Z) (n: Z) (retval: Z) (PreH1 : (0 <= retval)) (PreH2 : (retval <= 32)) (PreH3 : (retval <= n)) (PreH4 : (retval > 0)) (PreH5 : (32 < n)) (PreH6 : (n < 64)) (PreH7 : (((n + 1 ) ÷ 2 ) <= retval)) (PreH8 : (n > 0)) (PreH9 : (sizeof(FLOAT) = 4)) (PreH10 : ((batch_pre % ( 4 ) ) = 0)) (PreH11 : ((batch_pre % ( sizeof(FLOAT) ) ) = 0)) (PreH12 : (0 < (batch_pre ÷ 4 ))) (PreH13 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH14 : (0 <= n)) (PreH15 : (n <= (batch_pre ÷ 4 ))) (PreH16 : (input = (input_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) (PreH17 : (output = (output_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) ,
  (UndefStructPredvfloat32m8_t ( &( "vx" ) ) )
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - n ) (sqrt_rvv_values (((batch_pre ÷ 4 ) - n )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - n ) ) )
|--
  “ (0 <= retval) ” 
  &&  “ (retval <= 32) ” 
  &&  “ (0 <= ((batch_pre ÷ 4 ) - n )) ” 
  &&  “ ((((batch_pre ÷ 4 ) - n ) + retval ) <= ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ (input = (input_pre + (4 * ((batch_pre ÷ 4 ) - n ) ) )) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 32) ” 
  &&  “ (retval <= n) ” 
  &&  “ (retval > 0) ” 
  &&  “ (32 < n) ” 
  &&  “ (n < 64) ” 
  &&  “ (((n + 1 ) ÷ 2 ) <= retval) ” 
  &&  “ (n > 0) ” 
  &&  “ (sizeof(FLOAT) = 4) ” 
  &&  “ ((batch_pre % ( 4 ) ) = 0) ” 
  &&  “ ((batch_pre % ( sizeof(FLOAT) ) ) = 0) ” 
  &&  “ (0 < (batch_pre ÷ 4 )) ” 
  &&  “ ((batch_pre ÷ 4 ) <= 4611686018427387903) ” 
  &&  “ (0 <= n) ” 
  &&  “ (n <= (batch_pre ÷ 4 )) ” 
  &&  “ (input = (input_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT)))) ”
  &&  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (UndefStructPredvfloat32m8_t ( &( "vx" ) ) )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - n ) (sqrt_rvv_values (((batch_pre ÷ 4 ) - n )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - n ) ) )
.

Definition test_rvv_partial_solve_wit_7 := test_rvv_partial_solve_wit_7_pure -> test_rvv_partial_solve_wit_7_aux.

Definition test_rvv_partial_solve_wit_8_pure := 
forall (unused_params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (output: Z) (input: Z) (n: Z) (retval: Z) (PreH1 : (0 <= retval)) (PreH2 : (retval <= 32)) (PreH3 : (retval <= n)) (PreH4 : (retval > 0)) (PreH5 : (64 <= n)) (PreH6 : (retval = 32)) (PreH7 : (n > 0)) (PreH8 : (sizeof(FLOAT) = 4)) (PreH9 : ((batch_pre % ( 4 ) ) = 0)) (PreH10 : ((batch_pre % ( sizeof(FLOAT) ) ) = 0)) (PreH11 : (0 < (batch_pre ÷ 4 ))) (PreH12 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH13 : (0 <= n)) (PreH14 : (n <= (batch_pre ÷ 4 ))) (PreH15 : (input = (input_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) (PreH16 : (output = (output_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) ,
  (UndefStructPredvfloat32m8_t ( &( "vx" ) ) )
  **  ((( &( "vl" ) )) # UInt64  |-> retval)
  **  ((( &( "unused_params" ) )) # Ptr  |-> unused_params_pre)
  **  ((( &( "batch" ) )) # UInt64  |-> batch_pre)
  **  ((( &( "n" ) )) # UInt64  |-> n)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - n ) (sqrt_rvv_values (((batch_pre ÷ 4 ) - n )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - n ) ) )
|--
  “ (0 <= retval) ” 
  &&  “ (retval <= 32) ” 
  &&  “ (0 <= ((batch_pre ÷ 4 ) - n )) ” 
  &&  “ ((((batch_pre ÷ 4 ) - n ) + retval ) <= ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ (input = (input_pre + (4 * ((batch_pre ÷ 4 ) - n ) ) )) ”
.

Definition test_rvv_partial_solve_wit_8_aux := 
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (output: Z) (input: Z) (n: Z) (retval: Z) (PreH1 : (0 <= retval)) (PreH2 : (retval <= 32)) (PreH3 : (retval <= n)) (PreH4 : (retval > 0)) (PreH5 : (64 <= n)) (PreH6 : (retval = 32)) (PreH7 : (n > 0)) (PreH8 : (sizeof(FLOAT) = 4)) (PreH9 : ((batch_pre % ( 4 ) ) = 0)) (PreH10 : ((batch_pre % ( sizeof(FLOAT) ) ) = 0)) (PreH11 : (0 < (batch_pre ÷ 4 ))) (PreH12 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH13 : (0 <= n)) (PreH14 : (n <= (batch_pre ÷ 4 ))) (PreH15 : (input = (input_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) (PreH16 : (output = (output_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) ,
  (UndefStructPredvfloat32m8_t ( &( "vx" ) ) )
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - n ) (sqrt_rvv_values (((batch_pre ÷ 4 ) - n )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - n ) ) )
|--
  “ (0 <= retval) ” 
  &&  “ (retval <= 32) ” 
  &&  “ (0 <= ((batch_pre ÷ 4 ) - n )) ” 
  &&  “ ((((batch_pre ÷ 4 ) - n ) + retval ) <= ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ (input = (input_pre + (4 * ((batch_pre ÷ 4 ) - n ) ) )) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 32) ” 
  &&  “ (retval <= n) ” 
  &&  “ (retval > 0) ” 
  &&  “ (64 <= n) ” 
  &&  “ (retval = 32) ” 
  &&  “ (n > 0) ” 
  &&  “ (sizeof(FLOAT) = 4) ” 
  &&  “ ((batch_pre % ( 4 ) ) = 0) ” 
  &&  “ ((batch_pre % ( sizeof(FLOAT) ) ) = 0) ” 
  &&  “ (0 < (batch_pre ÷ 4 )) ” 
  &&  “ ((batch_pre ÷ 4 ) <= 4611686018427387903) ” 
  &&  “ (0 <= n) ” 
  &&  “ (n <= (batch_pre ÷ 4 )) ” 
  &&  “ (input = (input_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT)))) ”
  &&  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (UndefStructPredvfloat32m8_t ( &( "vx" ) ) )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - n ) (sqrt_rvv_values (((batch_pre ÷ 4 ) - n )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - n ) ) )
.

Definition test_rvv_partial_solve_wit_8 := test_rvv_partial_solve_wit_8_pure -> test_rvv_partial_solve_wit_8_aux.

Definition test_rvv_partial_solve_wit_9 := 
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (output: Z) (input: Z) (n: Z) (retval: Z) (t31: fp32) (t30: fp32) (t29: fp32) (t28: fp32) (t27: fp32) (t26: fp32) (t25: fp32) (t24: fp32) (t23: fp32) (t22: fp32) (t21: fp32) (t20: fp32) (t19: fp32) (t18: fp32) (t17: fp32) (t16: fp32) (t15: fp32) (t14: fp32) (t13: fp32) (t12: fp32) (t11: fp32) (t10: fp32) (t9: fp32) (t8: fp32) (t7: fp32) (t6: fp32) (t5: fp32) (t4: fp32) (t3: fp32) (t2: fp32) (t1: fp32) (t0: fp32) (retval_2: Z) (PreH1 : (0 <= retval)) (PreH2 : (retval <= 32)) (PreH3 : (retval <= n)) (PreH4 : (retval > 0)) (PreH5 : (n <= 32)) (PreH6 : (retval = n)) (PreH7 : (n > 0)) (PreH8 : (sizeof(FLOAT) = 4)) (PreH9 : ((batch_pre % ( 4 ) ) = 0)) (PreH10 : ((batch_pre % ( sizeof(FLOAT) ) ) = 0)) (PreH11 : (0 < (batch_pre ÷ 4 ))) (PreH12 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH13 : (0 <= n)) (PreH14 : (n <= (batch_pre ÷ 4 ))) (PreH15 : (input = (input_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) (PreH16 : (output = (output_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) ,
  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> (sqrt_read_at (0) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t0)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> (sqrt_read_at (1) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t1)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> (sqrt_read_at (2) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t2)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> (sqrt_read_at (3) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t3)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> (sqrt_read_at (4) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t4)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> (sqrt_read_at (5) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t5)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> (sqrt_read_at (6) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t6)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> (sqrt_read_at (7) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t7)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> (sqrt_read_at (8) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t8)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> (sqrt_read_at (9) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t9)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> (sqrt_read_at (10) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t10)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> (sqrt_read_at (11) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t11)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> (sqrt_read_at (12) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t12)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> (sqrt_read_at (13) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t13)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> (sqrt_read_at (14) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t14)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> (sqrt_read_at (15) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t15)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> (sqrt_read_at (16) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t16)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> (sqrt_read_at (17) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t17)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> (sqrt_read_at (18) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t18)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> (sqrt_read_at (19) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t19)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> (sqrt_read_at (20) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t20)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> (sqrt_read_at (21) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t21)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> (sqrt_read_at (22) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t22)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> (sqrt_read_at (23) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t23)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> (sqrt_read_at (24) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t24)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> (sqrt_read_at (25) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t25)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> (sqrt_read_at (26) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t26)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> (sqrt_read_at (27) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t27)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> (sqrt_read_at (28) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t28)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> (sqrt_read_at (29) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t29)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> (sqrt_read_at (30) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t30)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> (sqrt_read_at (31) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t31)))
  **  (UndefStructPredvfloat32m8_t ( &( "vx" ) ) )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - n ) (sqrt_rvv_values (((batch_pre ÷ 4 ) - n )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - n ) ) )
|--
  “ (0 <= retval) ” 
  &&  “ (retval <= 32) ” 
  &&  “ (retval <= n) ” 
  &&  “ (retval > 0) ” 
  &&  “ (n <= 32) ” 
  &&  “ (retval = n) ” 
  &&  “ (n > 0) ” 
  &&  “ (sizeof(FLOAT) = 4) ” 
  &&  “ ((batch_pre % ( 4 ) ) = 0) ” 
  &&  “ ((batch_pre % ( sizeof(FLOAT) ) ) = 0) ” 
  &&  “ (0 < (batch_pre ÷ 4 )) ” 
  &&  “ ((batch_pre ÷ 4 ) <= 4611686018427387903) ” 
  &&  “ (0 <= n) ” 
  &&  “ (n <= (batch_pre ÷ 4 )) ” 
  &&  “ (input = (input_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT)))) ”
  &&  ((&(( &( "vx" ) )->ₛ "s31")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> (sqrt_read_at (31) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t31)))
  **  ((&(( &( "vx" ) )->ₛ "s30")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> (sqrt_read_at (30) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t30)))
  **  ((&(( &( "vx" ) )->ₛ "s29")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> (sqrt_read_at (29) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t29)))
  **  ((&(( &( "vx" ) )->ₛ "s28")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> (sqrt_read_at (28) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t28)))
  **  ((&(( &( "vx" ) )->ₛ "s27")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> (sqrt_read_at (27) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t27)))
  **  ((&(( &( "vx" ) )->ₛ "s26")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> (sqrt_read_at (26) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t26)))
  **  ((&(( &( "vx" ) )->ₛ "s25")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> (sqrt_read_at (25) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t25)))
  **  ((&(( &( "vx" ) )->ₛ "s24")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> (sqrt_read_at (24) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t24)))
  **  ((&(( &( "vx" ) )->ₛ "s23")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> (sqrt_read_at (23) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t23)))
  **  ((&(( &( "vx" ) )->ₛ "s22")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> (sqrt_read_at (22) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t22)))
  **  ((&(( &( "vx" ) )->ₛ "s21")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> (sqrt_read_at (21) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t21)))
  **  ((&(( &( "vx" ) )->ₛ "s20")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> (sqrt_read_at (20) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t20)))
  **  ((&(( &( "vx" ) )->ₛ "s19")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> (sqrt_read_at (19) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t19)))
  **  ((&(( &( "vx" ) )->ₛ "s18")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> (sqrt_read_at (18) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t18)))
  **  ((&(( &( "vx" ) )->ₛ "s17")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> (sqrt_read_at (17) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t17)))
  **  ((&(( &( "vx" ) )->ₛ "s16")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> (sqrt_read_at (16) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t16)))
  **  ((&(( &( "vx" ) )->ₛ "s15")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> (sqrt_read_at (15) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t15)))
  **  ((&(( &( "vx" ) )->ₛ "s14")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> (sqrt_read_at (14) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t14)))
  **  ((&(( &( "vx" ) )->ₛ "s13")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> (sqrt_read_at (13) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t13)))
  **  ((&(( &( "vx" ) )->ₛ "s12")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> (sqrt_read_at (12) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t12)))
  **  ((&(( &( "vx" ) )->ₛ "s11")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> (sqrt_read_at (11) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t11)))
  **  ((&(( &( "vx" ) )->ₛ "s10")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> (sqrt_read_at (10) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t10)))
  **  ((&(( &( "vx" ) )->ₛ "s9")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> (sqrt_read_at (9) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t9)))
  **  ((&(( &( "vx" ) )->ₛ "s8")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> (sqrt_read_at (8) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t8)))
  **  ((&(( &( "vx" ) )->ₛ "s7")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> (sqrt_read_at (7) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t7)))
  **  ((&(( &( "vx" ) )->ₛ "s6")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> (sqrt_read_at (6) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t6)))
  **  ((&(( &( "vx" ) )->ₛ "s5")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> (sqrt_read_at (5) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t5)))
  **  ((&(( &( "vx" ) )->ₛ "s4")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> (sqrt_read_at (4) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t4)))
  **  ((&(( &( "vx" ) )->ₛ "s3")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> (sqrt_read_at (3) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t3)))
  **  ((&(( &( "vx" ) )->ₛ "s2")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> (sqrt_read_at (2) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t2)))
  **  ((&(( &( "vx" ) )->ₛ "s1")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> (sqrt_read_at (1) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t1)))
  **  ((&(( &( "vx" ) )->ₛ "s0")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> (sqrt_read_at (0) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t0)))
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - n ) (sqrt_rvv_values (((batch_pre ÷ 4 ) - n )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - n ) ) )
.

Definition test_rvv_partial_solve_wit_10 := 
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (output: Z) (input: Z) (n: Z) (retval: Z) (t31: fp32) (t30: fp32) (t29: fp32) (t28: fp32) (t27: fp32) (t26: fp32) (t25: fp32) (t24: fp32) (t23: fp32) (t22: fp32) (t21: fp32) (t20: fp32) (t19: fp32) (t18: fp32) (t17: fp32) (t16: fp32) (t15: fp32) (t14: fp32) (t13: fp32) (t12: fp32) (t11: fp32) (t10: fp32) (t9: fp32) (t8: fp32) (t7: fp32) (t6: fp32) (t5: fp32) (t4: fp32) (t3: fp32) (t2: fp32) (t1: fp32) (t0: fp32) (retval_2: Z) (PreH1 : (0 <= retval)) (PreH2 : (retval <= 32)) (PreH3 : (retval <= n)) (PreH4 : (retval > 0)) (PreH5 : (32 < n)) (PreH6 : (n < 64)) (PreH7 : (((n + 1 ) ÷ 2 ) <= retval)) (PreH8 : (n > 0)) (PreH9 : (sizeof(FLOAT) = 4)) (PreH10 : ((batch_pre % ( 4 ) ) = 0)) (PreH11 : ((batch_pre % ( sizeof(FLOAT) ) ) = 0)) (PreH12 : (0 < (batch_pre ÷ 4 ))) (PreH13 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH14 : (0 <= n)) (PreH15 : (n <= (batch_pre ÷ 4 ))) (PreH16 : (input = (input_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) (PreH17 : (output = (output_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) ,
  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> (sqrt_read_at (0) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t0)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> (sqrt_read_at (1) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t1)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> (sqrt_read_at (2) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t2)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> (sqrt_read_at (3) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t3)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> (sqrt_read_at (4) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t4)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> (sqrt_read_at (5) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t5)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> (sqrt_read_at (6) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t6)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> (sqrt_read_at (7) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t7)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> (sqrt_read_at (8) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t8)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> (sqrt_read_at (9) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t9)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> (sqrt_read_at (10) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t10)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> (sqrt_read_at (11) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t11)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> (sqrt_read_at (12) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t12)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> (sqrt_read_at (13) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t13)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> (sqrt_read_at (14) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t14)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> (sqrt_read_at (15) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t15)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> (sqrt_read_at (16) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t16)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> (sqrt_read_at (17) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t17)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> (sqrt_read_at (18) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t18)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> (sqrt_read_at (19) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t19)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> (sqrt_read_at (20) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t20)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> (sqrt_read_at (21) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t21)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> (sqrt_read_at (22) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t22)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> (sqrt_read_at (23) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t23)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> (sqrt_read_at (24) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t24)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> (sqrt_read_at (25) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t25)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> (sqrt_read_at (26) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t26)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> (sqrt_read_at (27) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t27)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> (sqrt_read_at (28) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t28)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> (sqrt_read_at (29) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t29)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> (sqrt_read_at (30) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t30)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> (sqrt_read_at (31) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t31)))
  **  (UndefStructPredvfloat32m8_t ( &( "vx" ) ) )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - n ) (sqrt_rvv_values (((batch_pre ÷ 4 ) - n )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - n ) ) )
|--
  “ (0 <= retval) ” 
  &&  “ (retval <= 32) ” 
  &&  “ (retval <= n) ” 
  &&  “ (retval > 0) ” 
  &&  “ (32 < n) ” 
  &&  “ (n < 64) ” 
  &&  “ (((n + 1 ) ÷ 2 ) <= retval) ” 
  &&  “ (n > 0) ” 
  &&  “ (sizeof(FLOAT) = 4) ” 
  &&  “ ((batch_pre % ( 4 ) ) = 0) ” 
  &&  “ ((batch_pre % ( sizeof(FLOAT) ) ) = 0) ” 
  &&  “ (0 < (batch_pre ÷ 4 )) ” 
  &&  “ ((batch_pre ÷ 4 ) <= 4611686018427387903) ” 
  &&  “ (0 <= n) ” 
  &&  “ (n <= (batch_pre ÷ 4 )) ” 
  &&  “ (input = (input_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT)))) ”
  &&  ((&(( &( "vx" ) )->ₛ "s31")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> (sqrt_read_at (31) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t31)))
  **  ((&(( &( "vx" ) )->ₛ "s30")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> (sqrt_read_at (30) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t30)))
  **  ((&(( &( "vx" ) )->ₛ "s29")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> (sqrt_read_at (29) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t29)))
  **  ((&(( &( "vx" ) )->ₛ "s28")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> (sqrt_read_at (28) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t28)))
  **  ((&(( &( "vx" ) )->ₛ "s27")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> (sqrt_read_at (27) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t27)))
  **  ((&(( &( "vx" ) )->ₛ "s26")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> (sqrt_read_at (26) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t26)))
  **  ((&(( &( "vx" ) )->ₛ "s25")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> (sqrt_read_at (25) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t25)))
  **  ((&(( &( "vx" ) )->ₛ "s24")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> (sqrt_read_at (24) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t24)))
  **  ((&(( &( "vx" ) )->ₛ "s23")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> (sqrt_read_at (23) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t23)))
  **  ((&(( &( "vx" ) )->ₛ "s22")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> (sqrt_read_at (22) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t22)))
  **  ((&(( &( "vx" ) )->ₛ "s21")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> (sqrt_read_at (21) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t21)))
  **  ((&(( &( "vx" ) )->ₛ "s20")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> (sqrt_read_at (20) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t20)))
  **  ((&(( &( "vx" ) )->ₛ "s19")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> (sqrt_read_at (19) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t19)))
  **  ((&(( &( "vx" ) )->ₛ "s18")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> (sqrt_read_at (18) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t18)))
  **  ((&(( &( "vx" ) )->ₛ "s17")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> (sqrt_read_at (17) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t17)))
  **  ((&(( &( "vx" ) )->ₛ "s16")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> (sqrt_read_at (16) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t16)))
  **  ((&(( &( "vx" ) )->ₛ "s15")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> (sqrt_read_at (15) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t15)))
  **  ((&(( &( "vx" ) )->ₛ "s14")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> (sqrt_read_at (14) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t14)))
  **  ((&(( &( "vx" ) )->ₛ "s13")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> (sqrt_read_at (13) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t13)))
  **  ((&(( &( "vx" ) )->ₛ "s12")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> (sqrt_read_at (12) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t12)))
  **  ((&(( &( "vx" ) )->ₛ "s11")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> (sqrt_read_at (11) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t11)))
  **  ((&(( &( "vx" ) )->ₛ "s10")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> (sqrt_read_at (10) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t10)))
  **  ((&(( &( "vx" ) )->ₛ "s9")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> (sqrt_read_at (9) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t9)))
  **  ((&(( &( "vx" ) )->ₛ "s8")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> (sqrt_read_at (8) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t8)))
  **  ((&(( &( "vx" ) )->ₛ "s7")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> (sqrt_read_at (7) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t7)))
  **  ((&(( &( "vx" ) )->ₛ "s6")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> (sqrt_read_at (6) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t6)))
  **  ((&(( &( "vx" ) )->ₛ "s5")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> (sqrt_read_at (5) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t5)))
  **  ((&(( &( "vx" ) )->ₛ "s4")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> (sqrt_read_at (4) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t4)))
  **  ((&(( &( "vx" ) )->ₛ "s3")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> (sqrt_read_at (3) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t3)))
  **  ((&(( &( "vx" ) )->ₛ "s2")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> (sqrt_read_at (2) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t2)))
  **  ((&(( &( "vx" ) )->ₛ "s1")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> (sqrt_read_at (1) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t1)))
  **  ((&(( &( "vx" ) )->ₛ "s0")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> (sqrt_read_at (0) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t0)))
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - n ) (sqrt_rvv_values (((batch_pre ÷ 4 ) - n )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - n ) ) )
.

Definition test_rvv_partial_solve_wit_11 := 
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (output: Z) (input: Z) (n: Z) (retval: Z) (t31: fp32) (t30: fp32) (t29: fp32) (t28: fp32) (t27: fp32) (t26: fp32) (t25: fp32) (t24: fp32) (t23: fp32) (t22: fp32) (t21: fp32) (t20: fp32) (t19: fp32) (t18: fp32) (t17: fp32) (t16: fp32) (t15: fp32) (t14: fp32) (t13: fp32) (t12: fp32) (t11: fp32) (t10: fp32) (t9: fp32) (t8: fp32) (t7: fp32) (t6: fp32) (t5: fp32) (t4: fp32) (t3: fp32) (t2: fp32) (t1: fp32) (t0: fp32) (retval_2: Z) (PreH1 : (0 <= retval)) (PreH2 : (retval <= 32)) (PreH3 : (retval <= n)) (PreH4 : (retval > 0)) (PreH5 : (64 <= n)) (PreH6 : (retval = 32)) (PreH7 : (n > 0)) (PreH8 : (sizeof(FLOAT) = 4)) (PreH9 : ((batch_pre % ( 4 ) ) = 0)) (PreH10 : ((batch_pre % ( sizeof(FLOAT) ) ) = 0)) (PreH11 : (0 < (batch_pre ÷ 4 ))) (PreH12 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH13 : (0 <= n)) (PreH14 : (n <= (batch_pre ÷ 4 ))) (PreH15 : (input = (input_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) (PreH16 : (output = (output_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) ,
  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> (sqrt_read_at (0) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t0)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> (sqrt_read_at (1) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t1)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> (sqrt_read_at (2) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t2)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> (sqrt_read_at (3) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t3)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> (sqrt_read_at (4) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t4)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> (sqrt_read_at (5) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t5)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> (sqrt_read_at (6) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t6)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> (sqrt_read_at (7) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t7)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> (sqrt_read_at (8) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t8)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> (sqrt_read_at (9) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t9)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> (sqrt_read_at (10) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t10)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> (sqrt_read_at (11) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t11)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> (sqrt_read_at (12) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t12)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> (sqrt_read_at (13) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t13)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> (sqrt_read_at (14) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t14)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> (sqrt_read_at (15) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t15)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> (sqrt_read_at (16) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t16)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> (sqrt_read_at (17) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t17)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> (sqrt_read_at (18) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t18)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> (sqrt_read_at (19) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t19)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> (sqrt_read_at (20) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t20)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> (sqrt_read_at (21) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t21)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> (sqrt_read_at (22) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t22)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> (sqrt_read_at (23) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t23)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> (sqrt_read_at (24) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t24)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> (sqrt_read_at (25) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t25)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> (sqrt_read_at (26) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t26)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> (sqrt_read_at (27) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t27)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> (sqrt_read_at (28) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t28)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> (sqrt_read_at (29) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t29)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> (sqrt_read_at (30) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t30)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> (sqrt_read_at (31) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t31)))
  **  (UndefStructPredvfloat32m8_t ( &( "vx" ) ) )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - n ) (sqrt_rvv_values (((batch_pre ÷ 4 ) - n )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - n ) ) )
|--
  “ (0 <= retval) ” 
  &&  “ (retval <= 32) ” 
  &&  “ (retval <= n) ” 
  &&  “ (retval > 0) ” 
  &&  “ (64 <= n) ” 
  &&  “ (retval = 32) ” 
  &&  “ (n > 0) ” 
  &&  “ (sizeof(FLOAT) = 4) ” 
  &&  “ ((batch_pre % ( 4 ) ) = 0) ” 
  &&  “ ((batch_pre % ( sizeof(FLOAT) ) ) = 0) ” 
  &&  “ (0 < (batch_pre ÷ 4 )) ” 
  &&  “ ((batch_pre ÷ 4 ) <= 4611686018427387903) ” 
  &&  “ (0 <= n) ” 
  &&  “ (n <= (batch_pre ÷ 4 )) ” 
  &&  “ (input = (input_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT)))) ”
  &&  ((&(( &( "vx" ) )->ₛ "s31")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> (sqrt_read_at (31) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t31)))
  **  ((&(( &( "vx" ) )->ₛ "s30")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> (sqrt_read_at (30) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t30)))
  **  ((&(( &( "vx" ) )->ₛ "s29")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> (sqrt_read_at (29) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t29)))
  **  ((&(( &( "vx" ) )->ₛ "s28")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> (sqrt_read_at (28) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t28)))
  **  ((&(( &( "vx" ) )->ₛ "s27")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> (sqrt_read_at (27) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t27)))
  **  ((&(( &( "vx" ) )->ₛ "s26")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> (sqrt_read_at (26) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t26)))
  **  ((&(( &( "vx" ) )->ₛ "s25")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> (sqrt_read_at (25) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t25)))
  **  ((&(( &( "vx" ) )->ₛ "s24")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> (sqrt_read_at (24) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t24)))
  **  ((&(( &( "vx" ) )->ₛ "s23")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> (sqrt_read_at (23) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t23)))
  **  ((&(( &( "vx" ) )->ₛ "s22")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> (sqrt_read_at (22) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t22)))
  **  ((&(( &( "vx" ) )->ₛ "s21")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> (sqrt_read_at (21) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t21)))
  **  ((&(( &( "vx" ) )->ₛ "s20")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> (sqrt_read_at (20) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t20)))
  **  ((&(( &( "vx" ) )->ₛ "s19")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> (sqrt_read_at (19) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t19)))
  **  ((&(( &( "vx" ) )->ₛ "s18")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> (sqrt_read_at (18) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t18)))
  **  ((&(( &( "vx" ) )->ₛ "s17")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> (sqrt_read_at (17) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t17)))
  **  ((&(( &( "vx" ) )->ₛ "s16")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> (sqrt_read_at (16) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t16)))
  **  ((&(( &( "vx" ) )->ₛ "s15")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> (sqrt_read_at (15) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t15)))
  **  ((&(( &( "vx" ) )->ₛ "s14")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> (sqrt_read_at (14) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t14)))
  **  ((&(( &( "vx" ) )->ₛ "s13")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> (sqrt_read_at (13) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t13)))
  **  ((&(( &( "vx" ) )->ₛ "s12")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> (sqrt_read_at (12) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t12)))
  **  ((&(( &( "vx" ) )->ₛ "s11")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> (sqrt_read_at (11) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t11)))
  **  ((&(( &( "vx" ) )->ₛ "s10")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> (sqrt_read_at (10) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t10)))
  **  ((&(( &( "vx" ) )->ₛ "s9")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> (sqrt_read_at (9) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t9)))
  **  ((&(( &( "vx" ) )->ₛ "s8")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> (sqrt_read_at (8) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t8)))
  **  ((&(( &( "vx" ) )->ₛ "s7")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> (sqrt_read_at (7) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t7)))
  **  ((&(( &( "vx" ) )->ₛ "s6")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> (sqrt_read_at (6) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t6)))
  **  ((&(( &( "vx" ) )->ₛ "s5")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> (sqrt_read_at (5) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t5)))
  **  ((&(( &( "vx" ) )->ₛ "s4")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> (sqrt_read_at (4) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t4)))
  **  ((&(( &( "vx" ) )->ₛ "s3")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> (sqrt_read_at (3) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t3)))
  **  ((&(( &( "vx" ) )->ₛ "s2")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> (sqrt_read_at (2) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t2)))
  **  ((&(( &( "vx" ) )->ₛ "s1")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> (sqrt_read_at (1) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t1)))
  **  ((&(( &( "vx" ) )->ₛ "s0")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> (sqrt_read_at (0) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t0)))
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - n ) (sqrt_rvv_values (((batch_pre ÷ 4 ) - n )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - n ) ) )
.

Definition test_rvv_partial_solve_wit_12_pure := 
forall (unused_params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (output: Z) (input: Z) (n: Z) (retval: Z) (t31: fp32) (t30: fp32) (t29: fp32) (t28: fp32) (t27: fp32) (t26: fp32) (t25: fp32) (t24: fp32) (t23: fp32) (t22: fp32) (t21: fp32) (t20: fp32) (t19: fp32) (t18: fp32) (t17: fp32) (t16: fp32) (t15: fp32) (t14: fp32) (t13: fp32) (t12: fp32) (t11: fp32) (t10: fp32) (t9: fp32) (t8: fp32) (t7: fp32) (t6: fp32) (t5: fp32) (t4: fp32) (t3: fp32) (t2: fp32) (t1: fp32) (t0: fp32) (PreH1 : (0 <= retval)) (PreH2 : (retval <= 32)) (PreH3 : (retval <= n)) (PreH4 : (retval > 0)) (PreH5 : (64 <= n)) (PreH6 : (retval = 32)) (PreH7 : (n > 0)) (PreH8 : (sizeof(FLOAT) = 4)) (PreH9 : ((batch_pre % ( 4 ) ) = 0)) (PreH10 : ((batch_pre % ( sizeof(FLOAT) ) ) = 0)) (PreH11 : (0 < (batch_pre ÷ 4 ))) (PreH12 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH13 : (0 <= n)) (PreH14 : (n <= (batch_pre ÷ 4 ))) (PreH15 : (input = (input_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) (PreH16 : (output = (output_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) ,
  (UndefStructPredvfloat32m8_t ( &( "vy" ) ) )
  **  ((&(( &( "vx" ) )->ₛ "s31")) # Float  |-> (sqrt_read_at (31) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t31)))
  **  ((&(( &( "vx" ) )->ₛ "s30")) # Float  |-> (sqrt_read_at (30) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t30)))
  **  ((&(( &( "vx" ) )->ₛ "s29")) # Float  |-> (sqrt_read_at (29) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t29)))
  **  ((&(( &( "vx" ) )->ₛ "s28")) # Float  |-> (sqrt_read_at (28) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t28)))
  **  ((&(( &( "vx" ) )->ₛ "s27")) # Float  |-> (sqrt_read_at (27) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t27)))
  **  ((&(( &( "vx" ) )->ₛ "s26")) # Float  |-> (sqrt_read_at (26) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t26)))
  **  ((&(( &( "vx" ) )->ₛ "s25")) # Float  |-> (sqrt_read_at (25) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t25)))
  **  ((&(( &( "vx" ) )->ₛ "s24")) # Float  |-> (sqrt_read_at (24) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t24)))
  **  ((&(( &( "vx" ) )->ₛ "s23")) # Float  |-> (sqrt_read_at (23) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t23)))
  **  ((&(( &( "vx" ) )->ₛ "s22")) # Float  |-> (sqrt_read_at (22) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t22)))
  **  ((&(( &( "vx" ) )->ₛ "s21")) # Float  |-> (sqrt_read_at (21) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t21)))
  **  ((&(( &( "vx" ) )->ₛ "s20")) # Float  |-> (sqrt_read_at (20) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t20)))
  **  ((&(( &( "vx" ) )->ₛ "s19")) # Float  |-> (sqrt_read_at (19) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t19)))
  **  ((&(( &( "vx" ) )->ₛ "s18")) # Float  |-> (sqrt_read_at (18) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t18)))
  **  ((&(( &( "vx" ) )->ₛ "s17")) # Float  |-> (sqrt_read_at (17) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t17)))
  **  ((&(( &( "vx" ) )->ₛ "s16")) # Float  |-> (sqrt_read_at (16) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t16)))
  **  ((&(( &( "vx" ) )->ₛ "s15")) # Float  |-> (sqrt_read_at (15) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t15)))
  **  ((&(( &( "vx" ) )->ₛ "s14")) # Float  |-> (sqrt_read_at (14) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t14)))
  **  ((&(( &( "vx" ) )->ₛ "s13")) # Float  |-> (sqrt_read_at (13) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t13)))
  **  ((&(( &( "vx" ) )->ₛ "s12")) # Float  |-> (sqrt_read_at (12) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t12)))
  **  ((&(( &( "vx" ) )->ₛ "s11")) # Float  |-> (sqrt_read_at (11) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t11)))
  **  ((&(( &( "vx" ) )->ₛ "s10")) # Float  |-> (sqrt_read_at (10) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t10)))
  **  ((&(( &( "vx" ) )->ₛ "s9")) # Float  |-> (sqrt_read_at (9) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t9)))
  **  ((&(( &( "vx" ) )->ₛ "s8")) # Float  |-> (sqrt_read_at (8) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t8)))
  **  ((&(( &( "vx" ) )->ₛ "s7")) # Float  |-> (sqrt_read_at (7) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t7)))
  **  ((&(( &( "vx" ) )->ₛ "s6")) # Float  |-> (sqrt_read_at (6) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t6)))
  **  ((&(( &( "vx" ) )->ₛ "s5")) # Float  |-> (sqrt_read_at (5) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t5)))
  **  ((&(( &( "vx" ) )->ₛ "s4")) # Float  |-> (sqrt_read_at (4) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t4)))
  **  ((&(( &( "vx" ) )->ₛ "s3")) # Float  |-> (sqrt_read_at (3) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t3)))
  **  ((&(( &( "vx" ) )->ₛ "s2")) # Float  |-> (sqrt_read_at (2) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t2)))
  **  ((&(( &( "vx" ) )->ₛ "s1")) # Float  |-> (sqrt_read_at (1) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t1)))
  **  ((&(( &( "vx" ) )->ₛ "s0")) # Float  |-> (sqrt_read_at (0) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t0)))
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  ((( &( "vl" ) )) # UInt64  |-> retval)
  **  ((( &( "unused_params" ) )) # Ptr  |-> unused_params_pre)
  **  ((( &( "batch" ) )) # UInt64  |-> batch_pre)
  **  ((( &( "n" ) )) # UInt64  |-> n)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - n ) (sqrt_rvv_values (((batch_pre ÷ 4 ) - n )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - n ) ) )
|--
  “ (0 <= retval) ” 
  &&  “ (retval <= 32) ”
.

Definition test_rvv_partial_solve_wit_12_aux := 
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (output: Z) (input: Z) (n: Z) (retval: Z) (t31: fp32) (t30: fp32) (t29: fp32) (t28: fp32) (t27: fp32) (t26: fp32) (t25: fp32) (t24: fp32) (t23: fp32) (t22: fp32) (t21: fp32) (t20: fp32) (t19: fp32) (t18: fp32) (t17: fp32) (t16: fp32) (t15: fp32) (t14: fp32) (t13: fp32) (t12: fp32) (t11: fp32) (t10: fp32) (t9: fp32) (t8: fp32) (t7: fp32) (t6: fp32) (t5: fp32) (t4: fp32) (t3: fp32) (t2: fp32) (t1: fp32) (t0: fp32) (PreH1 : (0 <= retval)) (PreH2 : (retval <= 32)) (PreH3 : (retval <= n)) (PreH4 : (retval > 0)) (PreH5 : (64 <= n)) (PreH6 : (retval = 32)) (PreH7 : (n > 0)) (PreH8 : (sizeof(FLOAT) = 4)) (PreH9 : ((batch_pre % ( 4 ) ) = 0)) (PreH10 : ((batch_pre % ( sizeof(FLOAT) ) ) = 0)) (PreH11 : (0 < (batch_pre ÷ 4 ))) (PreH12 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH13 : (0 <= n)) (PreH14 : (n <= (batch_pre ÷ 4 ))) (PreH15 : (input = (input_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) (PreH16 : (output = (output_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) ,
  (UndefStructPredvfloat32m8_t ( &( "vy" ) ) )
  **  ((&(( &( "vx" ) )->ₛ "s31")) # Float  |-> (sqrt_read_at (31) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t31)))
  **  ((&(( &( "vx" ) )->ₛ "s30")) # Float  |-> (sqrt_read_at (30) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t30)))
  **  ((&(( &( "vx" ) )->ₛ "s29")) # Float  |-> (sqrt_read_at (29) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t29)))
  **  ((&(( &( "vx" ) )->ₛ "s28")) # Float  |-> (sqrt_read_at (28) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t28)))
  **  ((&(( &( "vx" ) )->ₛ "s27")) # Float  |-> (sqrt_read_at (27) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t27)))
  **  ((&(( &( "vx" ) )->ₛ "s26")) # Float  |-> (sqrt_read_at (26) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t26)))
  **  ((&(( &( "vx" ) )->ₛ "s25")) # Float  |-> (sqrt_read_at (25) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t25)))
  **  ((&(( &( "vx" ) )->ₛ "s24")) # Float  |-> (sqrt_read_at (24) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t24)))
  **  ((&(( &( "vx" ) )->ₛ "s23")) # Float  |-> (sqrt_read_at (23) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t23)))
  **  ((&(( &( "vx" ) )->ₛ "s22")) # Float  |-> (sqrt_read_at (22) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t22)))
  **  ((&(( &( "vx" ) )->ₛ "s21")) # Float  |-> (sqrt_read_at (21) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t21)))
  **  ((&(( &( "vx" ) )->ₛ "s20")) # Float  |-> (sqrt_read_at (20) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t20)))
  **  ((&(( &( "vx" ) )->ₛ "s19")) # Float  |-> (sqrt_read_at (19) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t19)))
  **  ((&(( &( "vx" ) )->ₛ "s18")) # Float  |-> (sqrt_read_at (18) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t18)))
  **  ((&(( &( "vx" ) )->ₛ "s17")) # Float  |-> (sqrt_read_at (17) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t17)))
  **  ((&(( &( "vx" ) )->ₛ "s16")) # Float  |-> (sqrt_read_at (16) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t16)))
  **  ((&(( &( "vx" ) )->ₛ "s15")) # Float  |-> (sqrt_read_at (15) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t15)))
  **  ((&(( &( "vx" ) )->ₛ "s14")) # Float  |-> (sqrt_read_at (14) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t14)))
  **  ((&(( &( "vx" ) )->ₛ "s13")) # Float  |-> (sqrt_read_at (13) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t13)))
  **  ((&(( &( "vx" ) )->ₛ "s12")) # Float  |-> (sqrt_read_at (12) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t12)))
  **  ((&(( &( "vx" ) )->ₛ "s11")) # Float  |-> (sqrt_read_at (11) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t11)))
  **  ((&(( &( "vx" ) )->ₛ "s10")) # Float  |-> (sqrt_read_at (10) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t10)))
  **  ((&(( &( "vx" ) )->ₛ "s9")) # Float  |-> (sqrt_read_at (9) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t9)))
  **  ((&(( &( "vx" ) )->ₛ "s8")) # Float  |-> (sqrt_read_at (8) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t8)))
  **  ((&(( &( "vx" ) )->ₛ "s7")) # Float  |-> (sqrt_read_at (7) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t7)))
  **  ((&(( &( "vx" ) )->ₛ "s6")) # Float  |-> (sqrt_read_at (6) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t6)))
  **  ((&(( &( "vx" ) )->ₛ "s5")) # Float  |-> (sqrt_read_at (5) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t5)))
  **  ((&(( &( "vx" ) )->ₛ "s4")) # Float  |-> (sqrt_read_at (4) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t4)))
  **  ((&(( &( "vx" ) )->ₛ "s3")) # Float  |-> (sqrt_read_at (3) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t3)))
  **  ((&(( &( "vx" ) )->ₛ "s2")) # Float  |-> (sqrt_read_at (2) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t2)))
  **  ((&(( &( "vx" ) )->ₛ "s1")) # Float  |-> (sqrt_read_at (1) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t1)))
  **  ((&(( &( "vx" ) )->ₛ "s0")) # Float  |-> (sqrt_read_at (0) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t0)))
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - n ) (sqrt_rvv_values (((batch_pre ÷ 4 ) - n )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - n ) ) )
|--
  “ (0 <= retval) ” 
  &&  “ (retval <= 32) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 32) ” 
  &&  “ (retval <= n) ” 
  &&  “ (retval > 0) ” 
  &&  “ (64 <= n) ” 
  &&  “ (retval = 32) ” 
  &&  “ (n > 0) ” 
  &&  “ (sizeof(FLOAT) = 4) ” 
  &&  “ ((batch_pre % ( 4 ) ) = 0) ” 
  &&  “ ((batch_pre % ( sizeof(FLOAT) ) ) = 0) ” 
  &&  “ (0 < (batch_pre ÷ 4 )) ” 
  &&  “ ((batch_pre ÷ 4 ) <= 4611686018427387903) ” 
  &&  “ (0 <= n) ” 
  &&  “ (n <= (batch_pre ÷ 4 )) ” 
  &&  “ (input = (input_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT)))) ”
  &&  ((&(( &( "vx" ) )->ₛ "s0")) # Float  |-> (sqrt_read_at (0) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t0)))
  **  ((&(( &( "vx" ) )->ₛ "s1")) # Float  |-> (sqrt_read_at (1) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t1)))
  **  ((&(( &( "vx" ) )->ₛ "s2")) # Float  |-> (sqrt_read_at (2) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t2)))
  **  ((&(( &( "vx" ) )->ₛ "s3")) # Float  |-> (sqrt_read_at (3) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t3)))
  **  ((&(( &( "vx" ) )->ₛ "s4")) # Float  |-> (sqrt_read_at (4) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t4)))
  **  ((&(( &( "vx" ) )->ₛ "s5")) # Float  |-> (sqrt_read_at (5) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t5)))
  **  ((&(( &( "vx" ) )->ₛ "s6")) # Float  |-> (sqrt_read_at (6) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t6)))
  **  ((&(( &( "vx" ) )->ₛ "s7")) # Float  |-> (sqrt_read_at (7) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t7)))
  **  ((&(( &( "vx" ) )->ₛ "s8")) # Float  |-> (sqrt_read_at (8) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t8)))
  **  ((&(( &( "vx" ) )->ₛ "s9")) # Float  |-> (sqrt_read_at (9) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t9)))
  **  ((&(( &( "vx" ) )->ₛ "s10")) # Float  |-> (sqrt_read_at (10) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t10)))
  **  ((&(( &( "vx" ) )->ₛ "s11")) # Float  |-> (sqrt_read_at (11) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t11)))
  **  ((&(( &( "vx" ) )->ₛ "s12")) # Float  |-> (sqrt_read_at (12) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t12)))
  **  ((&(( &( "vx" ) )->ₛ "s13")) # Float  |-> (sqrt_read_at (13) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t13)))
  **  ((&(( &( "vx" ) )->ₛ "s14")) # Float  |-> (sqrt_read_at (14) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t14)))
  **  ((&(( &( "vx" ) )->ₛ "s15")) # Float  |-> (sqrt_read_at (15) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t15)))
  **  ((&(( &( "vx" ) )->ₛ "s16")) # Float  |-> (sqrt_read_at (16) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t16)))
  **  ((&(( &( "vx" ) )->ₛ "s17")) # Float  |-> (sqrt_read_at (17) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t17)))
  **  ((&(( &( "vx" ) )->ₛ "s18")) # Float  |-> (sqrt_read_at (18) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t18)))
  **  ((&(( &( "vx" ) )->ₛ "s19")) # Float  |-> (sqrt_read_at (19) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t19)))
  **  ((&(( &( "vx" ) )->ₛ "s20")) # Float  |-> (sqrt_read_at (20) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t20)))
  **  ((&(( &( "vx" ) )->ₛ "s21")) # Float  |-> (sqrt_read_at (21) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t21)))
  **  ((&(( &( "vx" ) )->ₛ "s22")) # Float  |-> (sqrt_read_at (22) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t22)))
  **  ((&(( &( "vx" ) )->ₛ "s23")) # Float  |-> (sqrt_read_at (23) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t23)))
  **  ((&(( &( "vx" ) )->ₛ "s24")) # Float  |-> (sqrt_read_at (24) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t24)))
  **  ((&(( &( "vx" ) )->ₛ "s25")) # Float  |-> (sqrt_read_at (25) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t25)))
  **  ((&(( &( "vx" ) )->ₛ "s26")) # Float  |-> (sqrt_read_at (26) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t26)))
  **  ((&(( &( "vx" ) )->ₛ "s27")) # Float  |-> (sqrt_read_at (27) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t27)))
  **  ((&(( &( "vx" ) )->ₛ "s28")) # Float  |-> (sqrt_read_at (28) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t28)))
  **  ((&(( &( "vx" ) )->ₛ "s29")) # Float  |-> (sqrt_read_at (29) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t29)))
  **  ((&(( &( "vx" ) )->ₛ "s30")) # Float  |-> (sqrt_read_at (30) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t30)))
  **  ((&(( &( "vx" ) )->ₛ "s31")) # Float  |-> (sqrt_read_at (31) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t31)))
  **  (UndefStructPredvfloat32m8_t ( &( "vy" ) ) )
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - n ) (sqrt_rvv_values (((batch_pre ÷ 4 ) - n )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - n ) ) )
.

Definition test_rvv_partial_solve_wit_12 := test_rvv_partial_solve_wit_12_pure -> test_rvv_partial_solve_wit_12_aux.

Definition test_rvv_partial_solve_wit_13_pure := 
forall (unused_params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (output: Z) (input: Z) (n: Z) (retval: Z) (t31: fp32) (t30: fp32) (t29: fp32) (t28: fp32) (t27: fp32) (t26: fp32) (t25: fp32) (t24: fp32) (t23: fp32) (t22: fp32) (t21: fp32) (t20: fp32) (t19: fp32) (t18: fp32) (t17: fp32) (t16: fp32) (t15: fp32) (t14: fp32) (t13: fp32) (t12: fp32) (t11: fp32) (t10: fp32) (t9: fp32) (t8: fp32) (t7: fp32) (t6: fp32) (t5: fp32) (t4: fp32) (t3: fp32) (t2: fp32) (t1: fp32) (t0: fp32) (PreH1 : (0 <= retval)) (PreH2 : (retval <= 32)) (PreH3 : (retval <= n)) (PreH4 : (retval > 0)) (PreH5 : (32 < n)) (PreH6 : (n < 64)) (PreH7 : (((n + 1 ) ÷ 2 ) <= retval)) (PreH8 : (n > 0)) (PreH9 : (sizeof(FLOAT) = 4)) (PreH10 : ((batch_pre % ( 4 ) ) = 0)) (PreH11 : ((batch_pre % ( sizeof(FLOAT) ) ) = 0)) (PreH12 : (0 < (batch_pre ÷ 4 ))) (PreH13 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH14 : (0 <= n)) (PreH15 : (n <= (batch_pre ÷ 4 ))) (PreH16 : (input = (input_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) (PreH17 : (output = (output_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) ,
  (UndefStructPredvfloat32m8_t ( &( "vy" ) ) )
  **  ((&(( &( "vx" ) )->ₛ "s31")) # Float  |-> (sqrt_read_at (31) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t31)))
  **  ((&(( &( "vx" ) )->ₛ "s30")) # Float  |-> (sqrt_read_at (30) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t30)))
  **  ((&(( &( "vx" ) )->ₛ "s29")) # Float  |-> (sqrt_read_at (29) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t29)))
  **  ((&(( &( "vx" ) )->ₛ "s28")) # Float  |-> (sqrt_read_at (28) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t28)))
  **  ((&(( &( "vx" ) )->ₛ "s27")) # Float  |-> (sqrt_read_at (27) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t27)))
  **  ((&(( &( "vx" ) )->ₛ "s26")) # Float  |-> (sqrt_read_at (26) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t26)))
  **  ((&(( &( "vx" ) )->ₛ "s25")) # Float  |-> (sqrt_read_at (25) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t25)))
  **  ((&(( &( "vx" ) )->ₛ "s24")) # Float  |-> (sqrt_read_at (24) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t24)))
  **  ((&(( &( "vx" ) )->ₛ "s23")) # Float  |-> (sqrt_read_at (23) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t23)))
  **  ((&(( &( "vx" ) )->ₛ "s22")) # Float  |-> (sqrt_read_at (22) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t22)))
  **  ((&(( &( "vx" ) )->ₛ "s21")) # Float  |-> (sqrt_read_at (21) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t21)))
  **  ((&(( &( "vx" ) )->ₛ "s20")) # Float  |-> (sqrt_read_at (20) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t20)))
  **  ((&(( &( "vx" ) )->ₛ "s19")) # Float  |-> (sqrt_read_at (19) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t19)))
  **  ((&(( &( "vx" ) )->ₛ "s18")) # Float  |-> (sqrt_read_at (18) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t18)))
  **  ((&(( &( "vx" ) )->ₛ "s17")) # Float  |-> (sqrt_read_at (17) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t17)))
  **  ((&(( &( "vx" ) )->ₛ "s16")) # Float  |-> (sqrt_read_at (16) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t16)))
  **  ((&(( &( "vx" ) )->ₛ "s15")) # Float  |-> (sqrt_read_at (15) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t15)))
  **  ((&(( &( "vx" ) )->ₛ "s14")) # Float  |-> (sqrt_read_at (14) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t14)))
  **  ((&(( &( "vx" ) )->ₛ "s13")) # Float  |-> (sqrt_read_at (13) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t13)))
  **  ((&(( &( "vx" ) )->ₛ "s12")) # Float  |-> (sqrt_read_at (12) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t12)))
  **  ((&(( &( "vx" ) )->ₛ "s11")) # Float  |-> (sqrt_read_at (11) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t11)))
  **  ((&(( &( "vx" ) )->ₛ "s10")) # Float  |-> (sqrt_read_at (10) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t10)))
  **  ((&(( &( "vx" ) )->ₛ "s9")) # Float  |-> (sqrt_read_at (9) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t9)))
  **  ((&(( &( "vx" ) )->ₛ "s8")) # Float  |-> (sqrt_read_at (8) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t8)))
  **  ((&(( &( "vx" ) )->ₛ "s7")) # Float  |-> (sqrt_read_at (7) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t7)))
  **  ((&(( &( "vx" ) )->ₛ "s6")) # Float  |-> (sqrt_read_at (6) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t6)))
  **  ((&(( &( "vx" ) )->ₛ "s5")) # Float  |-> (sqrt_read_at (5) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t5)))
  **  ((&(( &( "vx" ) )->ₛ "s4")) # Float  |-> (sqrt_read_at (4) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t4)))
  **  ((&(( &( "vx" ) )->ₛ "s3")) # Float  |-> (sqrt_read_at (3) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t3)))
  **  ((&(( &( "vx" ) )->ₛ "s2")) # Float  |-> (sqrt_read_at (2) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t2)))
  **  ((&(( &( "vx" ) )->ₛ "s1")) # Float  |-> (sqrt_read_at (1) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t1)))
  **  ((&(( &( "vx" ) )->ₛ "s0")) # Float  |-> (sqrt_read_at (0) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t0)))
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  ((( &( "vl" ) )) # UInt64  |-> retval)
  **  ((( &( "unused_params" ) )) # Ptr  |-> unused_params_pre)
  **  ((( &( "batch" ) )) # UInt64  |-> batch_pre)
  **  ((( &( "n" ) )) # UInt64  |-> n)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - n ) (sqrt_rvv_values (((batch_pre ÷ 4 ) - n )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - n ) ) )
|--
  “ (0 <= retval) ” 
  &&  “ (retval <= 32) ”
.

Definition test_rvv_partial_solve_wit_13_aux := 
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (output: Z) (input: Z) (n: Z) (retval: Z) (t31: fp32) (t30: fp32) (t29: fp32) (t28: fp32) (t27: fp32) (t26: fp32) (t25: fp32) (t24: fp32) (t23: fp32) (t22: fp32) (t21: fp32) (t20: fp32) (t19: fp32) (t18: fp32) (t17: fp32) (t16: fp32) (t15: fp32) (t14: fp32) (t13: fp32) (t12: fp32) (t11: fp32) (t10: fp32) (t9: fp32) (t8: fp32) (t7: fp32) (t6: fp32) (t5: fp32) (t4: fp32) (t3: fp32) (t2: fp32) (t1: fp32) (t0: fp32) (PreH1 : (0 <= retval)) (PreH2 : (retval <= 32)) (PreH3 : (retval <= n)) (PreH4 : (retval > 0)) (PreH5 : (32 < n)) (PreH6 : (n < 64)) (PreH7 : (((n + 1 ) ÷ 2 ) <= retval)) (PreH8 : (n > 0)) (PreH9 : (sizeof(FLOAT) = 4)) (PreH10 : ((batch_pre % ( 4 ) ) = 0)) (PreH11 : ((batch_pre % ( sizeof(FLOAT) ) ) = 0)) (PreH12 : (0 < (batch_pre ÷ 4 ))) (PreH13 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH14 : (0 <= n)) (PreH15 : (n <= (batch_pre ÷ 4 ))) (PreH16 : (input = (input_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) (PreH17 : (output = (output_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) ,
  (UndefStructPredvfloat32m8_t ( &( "vy" ) ) )
  **  ((&(( &( "vx" ) )->ₛ "s31")) # Float  |-> (sqrt_read_at (31) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t31)))
  **  ((&(( &( "vx" ) )->ₛ "s30")) # Float  |-> (sqrt_read_at (30) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t30)))
  **  ((&(( &( "vx" ) )->ₛ "s29")) # Float  |-> (sqrt_read_at (29) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t29)))
  **  ((&(( &( "vx" ) )->ₛ "s28")) # Float  |-> (sqrt_read_at (28) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t28)))
  **  ((&(( &( "vx" ) )->ₛ "s27")) # Float  |-> (sqrt_read_at (27) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t27)))
  **  ((&(( &( "vx" ) )->ₛ "s26")) # Float  |-> (sqrt_read_at (26) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t26)))
  **  ((&(( &( "vx" ) )->ₛ "s25")) # Float  |-> (sqrt_read_at (25) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t25)))
  **  ((&(( &( "vx" ) )->ₛ "s24")) # Float  |-> (sqrt_read_at (24) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t24)))
  **  ((&(( &( "vx" ) )->ₛ "s23")) # Float  |-> (sqrt_read_at (23) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t23)))
  **  ((&(( &( "vx" ) )->ₛ "s22")) # Float  |-> (sqrt_read_at (22) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t22)))
  **  ((&(( &( "vx" ) )->ₛ "s21")) # Float  |-> (sqrt_read_at (21) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t21)))
  **  ((&(( &( "vx" ) )->ₛ "s20")) # Float  |-> (sqrt_read_at (20) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t20)))
  **  ((&(( &( "vx" ) )->ₛ "s19")) # Float  |-> (sqrt_read_at (19) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t19)))
  **  ((&(( &( "vx" ) )->ₛ "s18")) # Float  |-> (sqrt_read_at (18) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t18)))
  **  ((&(( &( "vx" ) )->ₛ "s17")) # Float  |-> (sqrt_read_at (17) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t17)))
  **  ((&(( &( "vx" ) )->ₛ "s16")) # Float  |-> (sqrt_read_at (16) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t16)))
  **  ((&(( &( "vx" ) )->ₛ "s15")) # Float  |-> (sqrt_read_at (15) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t15)))
  **  ((&(( &( "vx" ) )->ₛ "s14")) # Float  |-> (sqrt_read_at (14) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t14)))
  **  ((&(( &( "vx" ) )->ₛ "s13")) # Float  |-> (sqrt_read_at (13) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t13)))
  **  ((&(( &( "vx" ) )->ₛ "s12")) # Float  |-> (sqrt_read_at (12) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t12)))
  **  ((&(( &( "vx" ) )->ₛ "s11")) # Float  |-> (sqrt_read_at (11) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t11)))
  **  ((&(( &( "vx" ) )->ₛ "s10")) # Float  |-> (sqrt_read_at (10) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t10)))
  **  ((&(( &( "vx" ) )->ₛ "s9")) # Float  |-> (sqrt_read_at (9) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t9)))
  **  ((&(( &( "vx" ) )->ₛ "s8")) # Float  |-> (sqrt_read_at (8) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t8)))
  **  ((&(( &( "vx" ) )->ₛ "s7")) # Float  |-> (sqrt_read_at (7) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t7)))
  **  ((&(( &( "vx" ) )->ₛ "s6")) # Float  |-> (sqrt_read_at (6) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t6)))
  **  ((&(( &( "vx" ) )->ₛ "s5")) # Float  |-> (sqrt_read_at (5) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t5)))
  **  ((&(( &( "vx" ) )->ₛ "s4")) # Float  |-> (sqrt_read_at (4) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t4)))
  **  ((&(( &( "vx" ) )->ₛ "s3")) # Float  |-> (sqrt_read_at (3) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t3)))
  **  ((&(( &( "vx" ) )->ₛ "s2")) # Float  |-> (sqrt_read_at (2) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t2)))
  **  ((&(( &( "vx" ) )->ₛ "s1")) # Float  |-> (sqrt_read_at (1) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t1)))
  **  ((&(( &( "vx" ) )->ₛ "s0")) # Float  |-> (sqrt_read_at (0) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t0)))
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - n ) (sqrt_rvv_values (((batch_pre ÷ 4 ) - n )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - n ) ) )
|--
  “ (0 <= retval) ” 
  &&  “ (retval <= 32) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 32) ” 
  &&  “ (retval <= n) ” 
  &&  “ (retval > 0) ” 
  &&  “ (32 < n) ” 
  &&  “ (n < 64) ” 
  &&  “ (((n + 1 ) ÷ 2 ) <= retval) ” 
  &&  “ (n > 0) ” 
  &&  “ (sizeof(FLOAT) = 4) ” 
  &&  “ ((batch_pre % ( 4 ) ) = 0) ” 
  &&  “ ((batch_pre % ( sizeof(FLOAT) ) ) = 0) ” 
  &&  “ (0 < (batch_pre ÷ 4 )) ” 
  &&  “ ((batch_pre ÷ 4 ) <= 4611686018427387903) ” 
  &&  “ (0 <= n) ” 
  &&  “ (n <= (batch_pre ÷ 4 )) ” 
  &&  “ (input = (input_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT)))) ”
  &&  ((&(( &( "vx" ) )->ₛ "s0")) # Float  |-> (sqrt_read_at (0) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t0)))
  **  ((&(( &( "vx" ) )->ₛ "s1")) # Float  |-> (sqrt_read_at (1) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t1)))
  **  ((&(( &( "vx" ) )->ₛ "s2")) # Float  |-> (sqrt_read_at (2) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t2)))
  **  ((&(( &( "vx" ) )->ₛ "s3")) # Float  |-> (sqrt_read_at (3) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t3)))
  **  ((&(( &( "vx" ) )->ₛ "s4")) # Float  |-> (sqrt_read_at (4) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t4)))
  **  ((&(( &( "vx" ) )->ₛ "s5")) # Float  |-> (sqrt_read_at (5) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t5)))
  **  ((&(( &( "vx" ) )->ₛ "s6")) # Float  |-> (sqrt_read_at (6) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t6)))
  **  ((&(( &( "vx" ) )->ₛ "s7")) # Float  |-> (sqrt_read_at (7) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t7)))
  **  ((&(( &( "vx" ) )->ₛ "s8")) # Float  |-> (sqrt_read_at (8) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t8)))
  **  ((&(( &( "vx" ) )->ₛ "s9")) # Float  |-> (sqrt_read_at (9) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t9)))
  **  ((&(( &( "vx" ) )->ₛ "s10")) # Float  |-> (sqrt_read_at (10) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t10)))
  **  ((&(( &( "vx" ) )->ₛ "s11")) # Float  |-> (sqrt_read_at (11) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t11)))
  **  ((&(( &( "vx" ) )->ₛ "s12")) # Float  |-> (sqrt_read_at (12) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t12)))
  **  ((&(( &( "vx" ) )->ₛ "s13")) # Float  |-> (sqrt_read_at (13) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t13)))
  **  ((&(( &( "vx" ) )->ₛ "s14")) # Float  |-> (sqrt_read_at (14) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t14)))
  **  ((&(( &( "vx" ) )->ₛ "s15")) # Float  |-> (sqrt_read_at (15) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t15)))
  **  ((&(( &( "vx" ) )->ₛ "s16")) # Float  |-> (sqrt_read_at (16) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t16)))
  **  ((&(( &( "vx" ) )->ₛ "s17")) # Float  |-> (sqrt_read_at (17) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t17)))
  **  ((&(( &( "vx" ) )->ₛ "s18")) # Float  |-> (sqrt_read_at (18) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t18)))
  **  ((&(( &( "vx" ) )->ₛ "s19")) # Float  |-> (sqrt_read_at (19) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t19)))
  **  ((&(( &( "vx" ) )->ₛ "s20")) # Float  |-> (sqrt_read_at (20) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t20)))
  **  ((&(( &( "vx" ) )->ₛ "s21")) # Float  |-> (sqrt_read_at (21) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t21)))
  **  ((&(( &( "vx" ) )->ₛ "s22")) # Float  |-> (sqrt_read_at (22) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t22)))
  **  ((&(( &( "vx" ) )->ₛ "s23")) # Float  |-> (sqrt_read_at (23) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t23)))
  **  ((&(( &( "vx" ) )->ₛ "s24")) # Float  |-> (sqrt_read_at (24) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t24)))
  **  ((&(( &( "vx" ) )->ₛ "s25")) # Float  |-> (sqrt_read_at (25) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t25)))
  **  ((&(( &( "vx" ) )->ₛ "s26")) # Float  |-> (sqrt_read_at (26) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t26)))
  **  ((&(( &( "vx" ) )->ₛ "s27")) # Float  |-> (sqrt_read_at (27) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t27)))
  **  ((&(( &( "vx" ) )->ₛ "s28")) # Float  |-> (sqrt_read_at (28) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t28)))
  **  ((&(( &( "vx" ) )->ₛ "s29")) # Float  |-> (sqrt_read_at (29) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t29)))
  **  ((&(( &( "vx" ) )->ₛ "s30")) # Float  |-> (sqrt_read_at (30) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t30)))
  **  ((&(( &( "vx" ) )->ₛ "s31")) # Float  |-> (sqrt_read_at (31) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t31)))
  **  (UndefStructPredvfloat32m8_t ( &( "vy" ) ) )
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - n ) (sqrt_rvv_values (((batch_pre ÷ 4 ) - n )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - n ) ) )
.

Definition test_rvv_partial_solve_wit_13 := test_rvv_partial_solve_wit_13_pure -> test_rvv_partial_solve_wit_13_aux.

Definition test_rvv_partial_solve_wit_14_pure := 
forall (unused_params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (output: Z) (input: Z) (n: Z) (retval: Z) (t31: fp32) (t30: fp32) (t29: fp32) (t28: fp32) (t27: fp32) (t26: fp32) (t25: fp32) (t24: fp32) (t23: fp32) (t22: fp32) (t21: fp32) (t20: fp32) (t19: fp32) (t18: fp32) (t17: fp32) (t16: fp32) (t15: fp32) (t14: fp32) (t13: fp32) (t12: fp32) (t11: fp32) (t10: fp32) (t9: fp32) (t8: fp32) (t7: fp32) (t6: fp32) (t5: fp32) (t4: fp32) (t3: fp32) (t2: fp32) (t1: fp32) (t0: fp32) (PreH1 : (0 <= retval)) (PreH2 : (retval <= 32)) (PreH3 : (retval <= n)) (PreH4 : (retval > 0)) (PreH5 : (n <= 32)) (PreH6 : (retval = n)) (PreH7 : (n > 0)) (PreH8 : (sizeof(FLOAT) = 4)) (PreH9 : ((batch_pre % ( 4 ) ) = 0)) (PreH10 : ((batch_pre % ( sizeof(FLOAT) ) ) = 0)) (PreH11 : (0 < (batch_pre ÷ 4 ))) (PreH12 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH13 : (0 <= n)) (PreH14 : (n <= (batch_pre ÷ 4 ))) (PreH15 : (input = (input_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) (PreH16 : (output = (output_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) ,
  (UndefStructPredvfloat32m8_t ( &( "vy" ) ) )
  **  ((&(( &( "vx" ) )->ₛ "s31")) # Float  |-> (sqrt_read_at (31) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t31)))
  **  ((&(( &( "vx" ) )->ₛ "s30")) # Float  |-> (sqrt_read_at (30) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t30)))
  **  ((&(( &( "vx" ) )->ₛ "s29")) # Float  |-> (sqrt_read_at (29) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t29)))
  **  ((&(( &( "vx" ) )->ₛ "s28")) # Float  |-> (sqrt_read_at (28) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t28)))
  **  ((&(( &( "vx" ) )->ₛ "s27")) # Float  |-> (sqrt_read_at (27) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t27)))
  **  ((&(( &( "vx" ) )->ₛ "s26")) # Float  |-> (sqrt_read_at (26) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t26)))
  **  ((&(( &( "vx" ) )->ₛ "s25")) # Float  |-> (sqrt_read_at (25) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t25)))
  **  ((&(( &( "vx" ) )->ₛ "s24")) # Float  |-> (sqrt_read_at (24) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t24)))
  **  ((&(( &( "vx" ) )->ₛ "s23")) # Float  |-> (sqrt_read_at (23) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t23)))
  **  ((&(( &( "vx" ) )->ₛ "s22")) # Float  |-> (sqrt_read_at (22) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t22)))
  **  ((&(( &( "vx" ) )->ₛ "s21")) # Float  |-> (sqrt_read_at (21) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t21)))
  **  ((&(( &( "vx" ) )->ₛ "s20")) # Float  |-> (sqrt_read_at (20) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t20)))
  **  ((&(( &( "vx" ) )->ₛ "s19")) # Float  |-> (sqrt_read_at (19) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t19)))
  **  ((&(( &( "vx" ) )->ₛ "s18")) # Float  |-> (sqrt_read_at (18) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t18)))
  **  ((&(( &( "vx" ) )->ₛ "s17")) # Float  |-> (sqrt_read_at (17) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t17)))
  **  ((&(( &( "vx" ) )->ₛ "s16")) # Float  |-> (sqrt_read_at (16) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t16)))
  **  ((&(( &( "vx" ) )->ₛ "s15")) # Float  |-> (sqrt_read_at (15) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t15)))
  **  ((&(( &( "vx" ) )->ₛ "s14")) # Float  |-> (sqrt_read_at (14) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t14)))
  **  ((&(( &( "vx" ) )->ₛ "s13")) # Float  |-> (sqrt_read_at (13) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t13)))
  **  ((&(( &( "vx" ) )->ₛ "s12")) # Float  |-> (sqrt_read_at (12) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t12)))
  **  ((&(( &( "vx" ) )->ₛ "s11")) # Float  |-> (sqrt_read_at (11) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t11)))
  **  ((&(( &( "vx" ) )->ₛ "s10")) # Float  |-> (sqrt_read_at (10) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t10)))
  **  ((&(( &( "vx" ) )->ₛ "s9")) # Float  |-> (sqrt_read_at (9) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t9)))
  **  ((&(( &( "vx" ) )->ₛ "s8")) # Float  |-> (sqrt_read_at (8) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t8)))
  **  ((&(( &( "vx" ) )->ₛ "s7")) # Float  |-> (sqrt_read_at (7) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t7)))
  **  ((&(( &( "vx" ) )->ₛ "s6")) # Float  |-> (sqrt_read_at (6) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t6)))
  **  ((&(( &( "vx" ) )->ₛ "s5")) # Float  |-> (sqrt_read_at (5) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t5)))
  **  ((&(( &( "vx" ) )->ₛ "s4")) # Float  |-> (sqrt_read_at (4) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t4)))
  **  ((&(( &( "vx" ) )->ₛ "s3")) # Float  |-> (sqrt_read_at (3) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t3)))
  **  ((&(( &( "vx" ) )->ₛ "s2")) # Float  |-> (sqrt_read_at (2) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t2)))
  **  ((&(( &( "vx" ) )->ₛ "s1")) # Float  |-> (sqrt_read_at (1) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t1)))
  **  ((&(( &( "vx" ) )->ₛ "s0")) # Float  |-> (sqrt_read_at (0) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t0)))
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  ((( &( "vl" ) )) # UInt64  |-> retval)
  **  ((( &( "unused_params" ) )) # Ptr  |-> unused_params_pre)
  **  ((( &( "batch" ) )) # UInt64  |-> batch_pre)
  **  ((( &( "n" ) )) # UInt64  |-> n)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - n ) (sqrt_rvv_values (((batch_pre ÷ 4 ) - n )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - n ) ) )
|--
  “ (0 <= retval) ” 
  &&  “ (retval <= 32) ”
.

Definition test_rvv_partial_solve_wit_14_aux := 
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (output: Z) (input: Z) (n: Z) (retval: Z) (t31: fp32) (t30: fp32) (t29: fp32) (t28: fp32) (t27: fp32) (t26: fp32) (t25: fp32) (t24: fp32) (t23: fp32) (t22: fp32) (t21: fp32) (t20: fp32) (t19: fp32) (t18: fp32) (t17: fp32) (t16: fp32) (t15: fp32) (t14: fp32) (t13: fp32) (t12: fp32) (t11: fp32) (t10: fp32) (t9: fp32) (t8: fp32) (t7: fp32) (t6: fp32) (t5: fp32) (t4: fp32) (t3: fp32) (t2: fp32) (t1: fp32) (t0: fp32) (PreH1 : (0 <= retval)) (PreH2 : (retval <= 32)) (PreH3 : (retval <= n)) (PreH4 : (retval > 0)) (PreH5 : (n <= 32)) (PreH6 : (retval = n)) (PreH7 : (n > 0)) (PreH8 : (sizeof(FLOAT) = 4)) (PreH9 : ((batch_pre % ( 4 ) ) = 0)) (PreH10 : ((batch_pre % ( sizeof(FLOAT) ) ) = 0)) (PreH11 : (0 < (batch_pre ÷ 4 ))) (PreH12 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH13 : (0 <= n)) (PreH14 : (n <= (batch_pre ÷ 4 ))) (PreH15 : (input = (input_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) (PreH16 : (output = (output_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) ,
  (UndefStructPredvfloat32m8_t ( &( "vy" ) ) )
  **  ((&(( &( "vx" ) )->ₛ "s31")) # Float  |-> (sqrt_read_at (31) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t31)))
  **  ((&(( &( "vx" ) )->ₛ "s30")) # Float  |-> (sqrt_read_at (30) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t30)))
  **  ((&(( &( "vx" ) )->ₛ "s29")) # Float  |-> (sqrt_read_at (29) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t29)))
  **  ((&(( &( "vx" ) )->ₛ "s28")) # Float  |-> (sqrt_read_at (28) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t28)))
  **  ((&(( &( "vx" ) )->ₛ "s27")) # Float  |-> (sqrt_read_at (27) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t27)))
  **  ((&(( &( "vx" ) )->ₛ "s26")) # Float  |-> (sqrt_read_at (26) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t26)))
  **  ((&(( &( "vx" ) )->ₛ "s25")) # Float  |-> (sqrt_read_at (25) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t25)))
  **  ((&(( &( "vx" ) )->ₛ "s24")) # Float  |-> (sqrt_read_at (24) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t24)))
  **  ((&(( &( "vx" ) )->ₛ "s23")) # Float  |-> (sqrt_read_at (23) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t23)))
  **  ((&(( &( "vx" ) )->ₛ "s22")) # Float  |-> (sqrt_read_at (22) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t22)))
  **  ((&(( &( "vx" ) )->ₛ "s21")) # Float  |-> (sqrt_read_at (21) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t21)))
  **  ((&(( &( "vx" ) )->ₛ "s20")) # Float  |-> (sqrt_read_at (20) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t20)))
  **  ((&(( &( "vx" ) )->ₛ "s19")) # Float  |-> (sqrt_read_at (19) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t19)))
  **  ((&(( &( "vx" ) )->ₛ "s18")) # Float  |-> (sqrt_read_at (18) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t18)))
  **  ((&(( &( "vx" ) )->ₛ "s17")) # Float  |-> (sqrt_read_at (17) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t17)))
  **  ((&(( &( "vx" ) )->ₛ "s16")) # Float  |-> (sqrt_read_at (16) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t16)))
  **  ((&(( &( "vx" ) )->ₛ "s15")) # Float  |-> (sqrt_read_at (15) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t15)))
  **  ((&(( &( "vx" ) )->ₛ "s14")) # Float  |-> (sqrt_read_at (14) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t14)))
  **  ((&(( &( "vx" ) )->ₛ "s13")) # Float  |-> (sqrt_read_at (13) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t13)))
  **  ((&(( &( "vx" ) )->ₛ "s12")) # Float  |-> (sqrt_read_at (12) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t12)))
  **  ((&(( &( "vx" ) )->ₛ "s11")) # Float  |-> (sqrt_read_at (11) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t11)))
  **  ((&(( &( "vx" ) )->ₛ "s10")) # Float  |-> (sqrt_read_at (10) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t10)))
  **  ((&(( &( "vx" ) )->ₛ "s9")) # Float  |-> (sqrt_read_at (9) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t9)))
  **  ((&(( &( "vx" ) )->ₛ "s8")) # Float  |-> (sqrt_read_at (8) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t8)))
  **  ((&(( &( "vx" ) )->ₛ "s7")) # Float  |-> (sqrt_read_at (7) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t7)))
  **  ((&(( &( "vx" ) )->ₛ "s6")) # Float  |-> (sqrt_read_at (6) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t6)))
  **  ((&(( &( "vx" ) )->ₛ "s5")) # Float  |-> (sqrt_read_at (5) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t5)))
  **  ((&(( &( "vx" ) )->ₛ "s4")) # Float  |-> (sqrt_read_at (4) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t4)))
  **  ((&(( &( "vx" ) )->ₛ "s3")) # Float  |-> (sqrt_read_at (3) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t3)))
  **  ((&(( &( "vx" ) )->ₛ "s2")) # Float  |-> (sqrt_read_at (2) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t2)))
  **  ((&(( &( "vx" ) )->ₛ "s1")) # Float  |-> (sqrt_read_at (1) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t1)))
  **  ((&(( &( "vx" ) )->ₛ "s0")) # Float  |-> (sqrt_read_at (0) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t0)))
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - n ) (sqrt_rvv_values (((batch_pre ÷ 4 ) - n )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - n ) ) )
|--
  “ (0 <= retval) ” 
  &&  “ (retval <= 32) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 32) ” 
  &&  “ (retval <= n) ” 
  &&  “ (retval > 0) ” 
  &&  “ (n <= 32) ” 
  &&  “ (retval = n) ” 
  &&  “ (n > 0) ” 
  &&  “ (sizeof(FLOAT) = 4) ” 
  &&  “ ((batch_pre % ( 4 ) ) = 0) ” 
  &&  “ ((batch_pre % ( sizeof(FLOAT) ) ) = 0) ” 
  &&  “ (0 < (batch_pre ÷ 4 )) ” 
  &&  “ ((batch_pre ÷ 4 ) <= 4611686018427387903) ” 
  &&  “ (0 <= n) ” 
  &&  “ (n <= (batch_pre ÷ 4 )) ” 
  &&  “ (input = (input_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT)))) ”
  &&  ((&(( &( "vx" ) )->ₛ "s0")) # Float  |-> (sqrt_read_at (0) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t0)))
  **  ((&(( &( "vx" ) )->ₛ "s1")) # Float  |-> (sqrt_read_at (1) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t1)))
  **  ((&(( &( "vx" ) )->ₛ "s2")) # Float  |-> (sqrt_read_at (2) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t2)))
  **  ((&(( &( "vx" ) )->ₛ "s3")) # Float  |-> (sqrt_read_at (3) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t3)))
  **  ((&(( &( "vx" ) )->ₛ "s4")) # Float  |-> (sqrt_read_at (4) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t4)))
  **  ((&(( &( "vx" ) )->ₛ "s5")) # Float  |-> (sqrt_read_at (5) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t5)))
  **  ((&(( &( "vx" ) )->ₛ "s6")) # Float  |-> (sqrt_read_at (6) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t6)))
  **  ((&(( &( "vx" ) )->ₛ "s7")) # Float  |-> (sqrt_read_at (7) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t7)))
  **  ((&(( &( "vx" ) )->ₛ "s8")) # Float  |-> (sqrt_read_at (8) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t8)))
  **  ((&(( &( "vx" ) )->ₛ "s9")) # Float  |-> (sqrt_read_at (9) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t9)))
  **  ((&(( &( "vx" ) )->ₛ "s10")) # Float  |-> (sqrt_read_at (10) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t10)))
  **  ((&(( &( "vx" ) )->ₛ "s11")) # Float  |-> (sqrt_read_at (11) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t11)))
  **  ((&(( &( "vx" ) )->ₛ "s12")) # Float  |-> (sqrt_read_at (12) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t12)))
  **  ((&(( &( "vx" ) )->ₛ "s13")) # Float  |-> (sqrt_read_at (13) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t13)))
  **  ((&(( &( "vx" ) )->ₛ "s14")) # Float  |-> (sqrt_read_at (14) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t14)))
  **  ((&(( &( "vx" ) )->ₛ "s15")) # Float  |-> (sqrt_read_at (15) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t15)))
  **  ((&(( &( "vx" ) )->ₛ "s16")) # Float  |-> (sqrt_read_at (16) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t16)))
  **  ((&(( &( "vx" ) )->ₛ "s17")) # Float  |-> (sqrt_read_at (17) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t17)))
  **  ((&(( &( "vx" ) )->ₛ "s18")) # Float  |-> (sqrt_read_at (18) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t18)))
  **  ((&(( &( "vx" ) )->ₛ "s19")) # Float  |-> (sqrt_read_at (19) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t19)))
  **  ((&(( &( "vx" ) )->ₛ "s20")) # Float  |-> (sqrt_read_at (20) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t20)))
  **  ((&(( &( "vx" ) )->ₛ "s21")) # Float  |-> (sqrt_read_at (21) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t21)))
  **  ((&(( &( "vx" ) )->ₛ "s22")) # Float  |-> (sqrt_read_at (22) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t22)))
  **  ((&(( &( "vx" ) )->ₛ "s23")) # Float  |-> (sqrt_read_at (23) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t23)))
  **  ((&(( &( "vx" ) )->ₛ "s24")) # Float  |-> (sqrt_read_at (24) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t24)))
  **  ((&(( &( "vx" ) )->ₛ "s25")) # Float  |-> (sqrt_read_at (25) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t25)))
  **  ((&(( &( "vx" ) )->ₛ "s26")) # Float  |-> (sqrt_read_at (26) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t26)))
  **  ((&(( &( "vx" ) )->ₛ "s27")) # Float  |-> (sqrt_read_at (27) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t27)))
  **  ((&(( &( "vx" ) )->ₛ "s28")) # Float  |-> (sqrt_read_at (28) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t28)))
  **  ((&(( &( "vx" ) )->ₛ "s29")) # Float  |-> (sqrt_read_at (29) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t29)))
  **  ((&(( &( "vx" ) )->ₛ "s30")) # Float  |-> (sqrt_read_at (30) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t30)))
  **  ((&(( &( "vx" ) )->ₛ "s31")) # Float  |-> (sqrt_read_at (31) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t31)))
  **  (UndefStructPredvfloat32m8_t ( &( "vy" ) ) )
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - n ) (sqrt_rvv_values (((batch_pre ÷ 4 ) - n )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - n ) ) )
.

Definition test_rvv_partial_solve_wit_14 := test_rvv_partial_solve_wit_14_pure -> test_rvv_partial_solve_wit_14_aux.

Definition test_rvv_partial_solve_wit_15 := 
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (output: Z) (input: Z) (n: Z) (retval: Z) (t31: fp32) (t30: fp32) (t29: fp32) (t28: fp32) (t27: fp32) (t26: fp32) (t25: fp32) (t24: fp32) (t23: fp32) (t22: fp32) (t21: fp32) (t20: fp32) (t19: fp32) (t18: fp32) (t17: fp32) (t16: fp32) (t15: fp32) (t14: fp32) (t13: fp32) (t12: fp32) (t11: fp32) (t10: fp32) (t9: fp32) (t8: fp32) (t7: fp32) (t6: fp32) (t5: fp32) (t4: fp32) (t3: fp32) (t2: fp32) (t1: fp32) (t0: fp32) (t31_2: fp32) (t30_2: fp32) (t29_2: fp32) (t28_2: fp32) (t27_2: fp32) (t26_2: fp32) (t25_2: fp32) (t24_2: fp32) (t23_2: fp32) (t22_2: fp32) (t21_2: fp32) (t20_2: fp32) (t19_2: fp32) (t18_2: fp32) (t17_2: fp32) (t16_2: fp32) (t15_2: fp32) (t14_2: fp32) (t13_2: fp32) (t12_2: fp32) (t11_2: fp32) (t10_2: fp32) (t9_2: fp32) (t8_2: fp32) (t7_2: fp32) (t6_2: fp32) (t5_2: fp32) (t4_2: fp32) (t3_2: fp32) (t2_2: fp32) (t1_2: fp32) (t0_2: fp32) (retval_2: Z) (PreH1 : (0 <= retval)) (PreH2 : (retval <= 32)) (PreH3 : (retval <= n)) (PreH4 : (retval > 0)) (PreH5 : (64 <= n)) (PreH6 : (retval = 32)) (PreH7 : (n > 0)) (PreH8 : (sizeof(FLOAT) = 4)) (PreH9 : ((batch_pre % ( 4 ) ) = 0)) (PreH10 : ((batch_pre % ( sizeof(FLOAT) ) ) = 0)) (PreH11 : (0 < (batch_pre ÷ 4 ))) (PreH12 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH13 : (0 <= n)) (PreH14 : (n <= (batch_pre ÷ 4 ))) (PreH15 : (input = (input_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) (PreH16 : (output = (output_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) ,
  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> (sqrt_active (0) (retval) ((sqrt_read_at (0) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t0))) (t0_2)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> (sqrt_active (1) (retval) ((sqrt_read_at (1) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t1))) (t1_2)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> (sqrt_active (2) (retval) ((sqrt_read_at (2) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t2))) (t2_2)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> (sqrt_active (3) (retval) ((sqrt_read_at (3) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t3))) (t3_2)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> (sqrt_active (4) (retval) ((sqrt_read_at (4) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t4))) (t4_2)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> (sqrt_active (5) (retval) ((sqrt_read_at (5) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t5))) (t5_2)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> (sqrt_active (6) (retval) ((sqrt_read_at (6) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t6))) (t6_2)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> (sqrt_active (7) (retval) ((sqrt_read_at (7) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t7))) (t7_2)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> (sqrt_active (8) (retval) ((sqrt_read_at (8) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t8))) (t8_2)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> (sqrt_active (9) (retval) ((sqrt_read_at (9) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t9))) (t9_2)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> (sqrt_active (10) (retval) ((sqrt_read_at (10) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t10))) (t10_2)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> (sqrt_active (11) (retval) ((sqrt_read_at (11) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t11))) (t11_2)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> (sqrt_active (12) (retval) ((sqrt_read_at (12) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t12))) (t12_2)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> (sqrt_active (13) (retval) ((sqrt_read_at (13) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t13))) (t13_2)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> (sqrt_active (14) (retval) ((sqrt_read_at (14) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t14))) (t14_2)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> (sqrt_active (15) (retval) ((sqrt_read_at (15) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t15))) (t15_2)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> (sqrt_active (16) (retval) ((sqrt_read_at (16) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t16))) (t16_2)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> (sqrt_active (17) (retval) ((sqrt_read_at (17) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t17))) (t17_2)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> (sqrt_active (18) (retval) ((sqrt_read_at (18) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t18))) (t18_2)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> (sqrt_active (19) (retval) ((sqrt_read_at (19) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t19))) (t19_2)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> (sqrt_active (20) (retval) ((sqrt_read_at (20) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t20))) (t20_2)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> (sqrt_active (21) (retval) ((sqrt_read_at (21) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t21))) (t21_2)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> (sqrt_active (22) (retval) ((sqrt_read_at (22) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t22))) (t22_2)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> (sqrt_active (23) (retval) ((sqrt_read_at (23) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t23))) (t23_2)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> (sqrt_active (24) (retval) ((sqrt_read_at (24) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t24))) (t24_2)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> (sqrt_active (25) (retval) ((sqrt_read_at (25) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t25))) (t25_2)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> (sqrt_active (26) (retval) ((sqrt_read_at (26) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t26))) (t26_2)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> (sqrt_active (27) (retval) ((sqrt_read_at (27) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t27))) (t27_2)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> (sqrt_active (28) (retval) ((sqrt_read_at (28) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t28))) (t28_2)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> (sqrt_active (29) (retval) ((sqrt_read_at (29) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t29))) (t29_2)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> (sqrt_active (30) (retval) ((sqrt_read_at (30) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t30))) (t30_2)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> (sqrt_active (31) (retval) ((sqrt_read_at (31) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t31))) (t31_2)))
  **  (UndefStructPredvfloat32m8_t ( &( "vy" ) ) )
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - n ) (sqrt_rvv_values (((batch_pre ÷ 4 ) - n )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - n ) ) )
  **  ((&(( &( "vx" ) )->ₛ "s0")) # Float  |-> (sqrt_read_at (0) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t0)))
  **  ((&(( &( "vx" ) )->ₛ "s1")) # Float  |-> (sqrt_read_at (1) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t1)))
  **  ((&(( &( "vx" ) )->ₛ "s2")) # Float  |-> (sqrt_read_at (2) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t2)))
  **  ((&(( &( "vx" ) )->ₛ "s3")) # Float  |-> (sqrt_read_at (3) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t3)))
  **  ((&(( &( "vx" ) )->ₛ "s4")) # Float  |-> (sqrt_read_at (4) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t4)))
  **  ((&(( &( "vx" ) )->ₛ "s5")) # Float  |-> (sqrt_read_at (5) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t5)))
  **  ((&(( &( "vx" ) )->ₛ "s6")) # Float  |-> (sqrt_read_at (6) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t6)))
  **  ((&(( &( "vx" ) )->ₛ "s7")) # Float  |-> (sqrt_read_at (7) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t7)))
  **  ((&(( &( "vx" ) )->ₛ "s8")) # Float  |-> (sqrt_read_at (8) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t8)))
  **  ((&(( &( "vx" ) )->ₛ "s9")) # Float  |-> (sqrt_read_at (9) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t9)))
  **  ((&(( &( "vx" ) )->ₛ "s10")) # Float  |-> (sqrt_read_at (10) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t10)))
  **  ((&(( &( "vx" ) )->ₛ "s11")) # Float  |-> (sqrt_read_at (11) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t11)))
  **  ((&(( &( "vx" ) )->ₛ "s12")) # Float  |-> (sqrt_read_at (12) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t12)))
  **  ((&(( &( "vx" ) )->ₛ "s13")) # Float  |-> (sqrt_read_at (13) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t13)))
  **  ((&(( &( "vx" ) )->ₛ "s14")) # Float  |-> (sqrt_read_at (14) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t14)))
  **  ((&(( &( "vx" ) )->ₛ "s15")) # Float  |-> (sqrt_read_at (15) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t15)))
  **  ((&(( &( "vx" ) )->ₛ "s16")) # Float  |-> (sqrt_read_at (16) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t16)))
  **  ((&(( &( "vx" ) )->ₛ "s17")) # Float  |-> (sqrt_read_at (17) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t17)))
  **  ((&(( &( "vx" ) )->ₛ "s18")) # Float  |-> (sqrt_read_at (18) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t18)))
  **  ((&(( &( "vx" ) )->ₛ "s19")) # Float  |-> (sqrt_read_at (19) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t19)))
  **  ((&(( &( "vx" ) )->ₛ "s20")) # Float  |-> (sqrt_read_at (20) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t20)))
  **  ((&(( &( "vx" ) )->ₛ "s21")) # Float  |-> (sqrt_read_at (21) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t21)))
  **  ((&(( &( "vx" ) )->ₛ "s22")) # Float  |-> (sqrt_read_at (22) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t22)))
  **  ((&(( &( "vx" ) )->ₛ "s23")) # Float  |-> (sqrt_read_at (23) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t23)))
  **  ((&(( &( "vx" ) )->ₛ "s24")) # Float  |-> (sqrt_read_at (24) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t24)))
  **  ((&(( &( "vx" ) )->ₛ "s25")) # Float  |-> (sqrt_read_at (25) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t25)))
  **  ((&(( &( "vx" ) )->ₛ "s26")) # Float  |-> (sqrt_read_at (26) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t26)))
  **  ((&(( &( "vx" ) )->ₛ "s27")) # Float  |-> (sqrt_read_at (27) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t27)))
  **  ((&(( &( "vx" ) )->ₛ "s28")) # Float  |-> (sqrt_read_at (28) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t28)))
  **  ((&(( &( "vx" ) )->ₛ "s29")) # Float  |-> (sqrt_read_at (29) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t29)))
  **  ((&(( &( "vx" ) )->ₛ "s30")) # Float  |-> (sqrt_read_at (30) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t30)))
  **  ((&(( &( "vx" ) )->ₛ "s31")) # Float  |-> (sqrt_read_at (31) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t31)))
|--
  “ (0 <= retval) ” 
  &&  “ (retval <= 32) ” 
  &&  “ (retval <= n) ” 
  &&  “ (retval > 0) ” 
  &&  “ (64 <= n) ” 
  &&  “ (retval = 32) ” 
  &&  “ (n > 0) ” 
  &&  “ (sizeof(FLOAT) = 4) ” 
  &&  “ ((batch_pre % ( 4 ) ) = 0) ” 
  &&  “ ((batch_pre % ( sizeof(FLOAT) ) ) = 0) ” 
  &&  “ (0 < (batch_pre ÷ 4 )) ” 
  &&  “ ((batch_pre ÷ 4 ) <= 4611686018427387903) ” 
  &&  “ (0 <= n) ” 
  &&  “ (n <= (batch_pre ÷ 4 )) ” 
  &&  “ (input = (input_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT)))) ”
  &&  ((&(( &( "vy" ) )->ₛ "s31")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> (sqrt_active (31) (retval) ((sqrt_read_at (31) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t31))) (t31_2)))
  **  ((&(( &( "vy" ) )->ₛ "s30")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> (sqrt_active (30) (retval) ((sqrt_read_at (30) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t30))) (t30_2)))
  **  ((&(( &( "vy" ) )->ₛ "s29")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> (sqrt_active (29) (retval) ((sqrt_read_at (29) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t29))) (t29_2)))
  **  ((&(( &( "vy" ) )->ₛ "s28")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> (sqrt_active (28) (retval) ((sqrt_read_at (28) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t28))) (t28_2)))
  **  ((&(( &( "vy" ) )->ₛ "s27")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> (sqrt_active (27) (retval) ((sqrt_read_at (27) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t27))) (t27_2)))
  **  ((&(( &( "vy" ) )->ₛ "s26")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> (sqrt_active (26) (retval) ((sqrt_read_at (26) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t26))) (t26_2)))
  **  ((&(( &( "vy" ) )->ₛ "s25")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> (sqrt_active (25) (retval) ((sqrt_read_at (25) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t25))) (t25_2)))
  **  ((&(( &( "vy" ) )->ₛ "s24")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> (sqrt_active (24) (retval) ((sqrt_read_at (24) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t24))) (t24_2)))
  **  ((&(( &( "vy" ) )->ₛ "s23")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> (sqrt_active (23) (retval) ((sqrt_read_at (23) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t23))) (t23_2)))
  **  ((&(( &( "vy" ) )->ₛ "s22")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> (sqrt_active (22) (retval) ((sqrt_read_at (22) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t22))) (t22_2)))
  **  ((&(( &( "vy" ) )->ₛ "s21")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> (sqrt_active (21) (retval) ((sqrt_read_at (21) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t21))) (t21_2)))
  **  ((&(( &( "vy" ) )->ₛ "s20")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> (sqrt_active (20) (retval) ((sqrt_read_at (20) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t20))) (t20_2)))
  **  ((&(( &( "vy" ) )->ₛ "s19")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> (sqrt_active (19) (retval) ((sqrt_read_at (19) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t19))) (t19_2)))
  **  ((&(( &( "vy" ) )->ₛ "s18")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> (sqrt_active (18) (retval) ((sqrt_read_at (18) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t18))) (t18_2)))
  **  ((&(( &( "vy" ) )->ₛ "s17")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> (sqrt_active (17) (retval) ((sqrt_read_at (17) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t17))) (t17_2)))
  **  ((&(( &( "vy" ) )->ₛ "s16")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> (sqrt_active (16) (retval) ((sqrt_read_at (16) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t16))) (t16_2)))
  **  ((&(( &( "vy" ) )->ₛ "s15")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> (sqrt_active (15) (retval) ((sqrt_read_at (15) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t15))) (t15_2)))
  **  ((&(( &( "vy" ) )->ₛ "s14")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> (sqrt_active (14) (retval) ((sqrt_read_at (14) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t14))) (t14_2)))
  **  ((&(( &( "vy" ) )->ₛ "s13")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> (sqrt_active (13) (retval) ((sqrt_read_at (13) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t13))) (t13_2)))
  **  ((&(( &( "vy" ) )->ₛ "s12")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> (sqrt_active (12) (retval) ((sqrt_read_at (12) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t12))) (t12_2)))
  **  ((&(( &( "vy" ) )->ₛ "s11")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> (sqrt_active (11) (retval) ((sqrt_read_at (11) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t11))) (t11_2)))
  **  ((&(( &( "vy" ) )->ₛ "s10")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> (sqrt_active (10) (retval) ((sqrt_read_at (10) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t10))) (t10_2)))
  **  ((&(( &( "vy" ) )->ₛ "s9")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> (sqrt_active (9) (retval) ((sqrt_read_at (9) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t9))) (t9_2)))
  **  ((&(( &( "vy" ) )->ₛ "s8")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> (sqrt_active (8) (retval) ((sqrt_read_at (8) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t8))) (t8_2)))
  **  ((&(( &( "vy" ) )->ₛ "s7")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> (sqrt_active (7) (retval) ((sqrt_read_at (7) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t7))) (t7_2)))
  **  ((&(( &( "vy" ) )->ₛ "s6")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> (sqrt_active (6) (retval) ((sqrt_read_at (6) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t6))) (t6_2)))
  **  ((&(( &( "vy" ) )->ₛ "s5")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> (sqrt_active (5) (retval) ((sqrt_read_at (5) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t5))) (t5_2)))
  **  ((&(( &( "vy" ) )->ₛ "s4")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> (sqrt_active (4) (retval) ((sqrt_read_at (4) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t4))) (t4_2)))
  **  ((&(( &( "vy" ) )->ₛ "s3")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> (sqrt_active (3) (retval) ((sqrt_read_at (3) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t3))) (t3_2)))
  **  ((&(( &( "vy" ) )->ₛ "s2")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> (sqrt_active (2) (retval) ((sqrt_read_at (2) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t2))) (t2_2)))
  **  ((&(( &( "vy" ) )->ₛ "s1")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> (sqrt_active (1) (retval) ((sqrt_read_at (1) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t1))) (t1_2)))
  **  ((&(( &( "vy" ) )->ₛ "s0")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> (sqrt_active (0) (retval) ((sqrt_read_at (0) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t0))) (t0_2)))
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - n ) (sqrt_rvv_values (((batch_pre ÷ 4 ) - n )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - n ) ) )
  **  ((&(( &( "vx" ) )->ₛ "s0")) # Float  |-> (sqrt_read_at (0) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t0)))
  **  ((&(( &( "vx" ) )->ₛ "s1")) # Float  |-> (sqrt_read_at (1) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t1)))
  **  ((&(( &( "vx" ) )->ₛ "s2")) # Float  |-> (sqrt_read_at (2) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t2)))
  **  ((&(( &( "vx" ) )->ₛ "s3")) # Float  |-> (sqrt_read_at (3) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t3)))
  **  ((&(( &( "vx" ) )->ₛ "s4")) # Float  |-> (sqrt_read_at (4) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t4)))
  **  ((&(( &( "vx" ) )->ₛ "s5")) # Float  |-> (sqrt_read_at (5) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t5)))
  **  ((&(( &( "vx" ) )->ₛ "s6")) # Float  |-> (sqrt_read_at (6) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t6)))
  **  ((&(( &( "vx" ) )->ₛ "s7")) # Float  |-> (sqrt_read_at (7) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t7)))
  **  ((&(( &( "vx" ) )->ₛ "s8")) # Float  |-> (sqrt_read_at (8) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t8)))
  **  ((&(( &( "vx" ) )->ₛ "s9")) # Float  |-> (sqrt_read_at (9) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t9)))
  **  ((&(( &( "vx" ) )->ₛ "s10")) # Float  |-> (sqrt_read_at (10) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t10)))
  **  ((&(( &( "vx" ) )->ₛ "s11")) # Float  |-> (sqrt_read_at (11) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t11)))
  **  ((&(( &( "vx" ) )->ₛ "s12")) # Float  |-> (sqrt_read_at (12) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t12)))
  **  ((&(( &( "vx" ) )->ₛ "s13")) # Float  |-> (sqrt_read_at (13) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t13)))
  **  ((&(( &( "vx" ) )->ₛ "s14")) # Float  |-> (sqrt_read_at (14) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t14)))
  **  ((&(( &( "vx" ) )->ₛ "s15")) # Float  |-> (sqrt_read_at (15) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t15)))
  **  ((&(( &( "vx" ) )->ₛ "s16")) # Float  |-> (sqrt_read_at (16) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t16)))
  **  ((&(( &( "vx" ) )->ₛ "s17")) # Float  |-> (sqrt_read_at (17) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t17)))
  **  ((&(( &( "vx" ) )->ₛ "s18")) # Float  |-> (sqrt_read_at (18) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t18)))
  **  ((&(( &( "vx" ) )->ₛ "s19")) # Float  |-> (sqrt_read_at (19) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t19)))
  **  ((&(( &( "vx" ) )->ₛ "s20")) # Float  |-> (sqrt_read_at (20) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t20)))
  **  ((&(( &( "vx" ) )->ₛ "s21")) # Float  |-> (sqrt_read_at (21) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t21)))
  **  ((&(( &( "vx" ) )->ₛ "s22")) # Float  |-> (sqrt_read_at (22) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t22)))
  **  ((&(( &( "vx" ) )->ₛ "s23")) # Float  |-> (sqrt_read_at (23) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t23)))
  **  ((&(( &( "vx" ) )->ₛ "s24")) # Float  |-> (sqrt_read_at (24) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t24)))
  **  ((&(( &( "vx" ) )->ₛ "s25")) # Float  |-> (sqrt_read_at (25) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t25)))
  **  ((&(( &( "vx" ) )->ₛ "s26")) # Float  |-> (sqrt_read_at (26) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t26)))
  **  ((&(( &( "vx" ) )->ₛ "s27")) # Float  |-> (sqrt_read_at (27) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t27)))
  **  ((&(( &( "vx" ) )->ₛ "s28")) # Float  |-> (sqrt_read_at (28) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t28)))
  **  ((&(( &( "vx" ) )->ₛ "s29")) # Float  |-> (sqrt_read_at (29) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t29)))
  **  ((&(( &( "vx" ) )->ₛ "s30")) # Float  |-> (sqrt_read_at (30) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t30)))
  **  ((&(( &( "vx" ) )->ₛ "s31")) # Float  |-> (sqrt_read_at (31) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t31)))
.

Definition test_rvv_partial_solve_wit_16 := 
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (output: Z) (input: Z) (n: Z) (retval: Z) (t31: fp32) (t30: fp32) (t29: fp32) (t28: fp32) (t27: fp32) (t26: fp32) (t25: fp32) (t24: fp32) (t23: fp32) (t22: fp32) (t21: fp32) (t20: fp32) (t19: fp32) (t18: fp32) (t17: fp32) (t16: fp32) (t15: fp32) (t14: fp32) (t13: fp32) (t12: fp32) (t11: fp32) (t10: fp32) (t9: fp32) (t8: fp32) (t7: fp32) (t6: fp32) (t5: fp32) (t4: fp32) (t3: fp32) (t2: fp32) (t1: fp32) (t0: fp32) (t31_2: fp32) (t30_2: fp32) (t29_2: fp32) (t28_2: fp32) (t27_2: fp32) (t26_2: fp32) (t25_2: fp32) (t24_2: fp32) (t23_2: fp32) (t22_2: fp32) (t21_2: fp32) (t20_2: fp32) (t19_2: fp32) (t18_2: fp32) (t17_2: fp32) (t16_2: fp32) (t15_2: fp32) (t14_2: fp32) (t13_2: fp32) (t12_2: fp32) (t11_2: fp32) (t10_2: fp32) (t9_2: fp32) (t8_2: fp32) (t7_2: fp32) (t6_2: fp32) (t5_2: fp32) (t4_2: fp32) (t3_2: fp32) (t2_2: fp32) (t1_2: fp32) (t0_2: fp32) (retval_2: Z) (PreH1 : (0 <= retval)) (PreH2 : (retval <= 32)) (PreH3 : (retval <= n)) (PreH4 : (retval > 0)) (PreH5 : (32 < n)) (PreH6 : (n < 64)) (PreH7 : (((n + 1 ) ÷ 2 ) <= retval)) (PreH8 : (n > 0)) (PreH9 : (sizeof(FLOAT) = 4)) (PreH10 : ((batch_pre % ( 4 ) ) = 0)) (PreH11 : ((batch_pre % ( sizeof(FLOAT) ) ) = 0)) (PreH12 : (0 < (batch_pre ÷ 4 ))) (PreH13 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH14 : (0 <= n)) (PreH15 : (n <= (batch_pre ÷ 4 ))) (PreH16 : (input = (input_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) (PreH17 : (output = (output_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) ,
  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> (sqrt_active (0) (retval) ((sqrt_read_at (0) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t0))) (t0_2)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> (sqrt_active (1) (retval) ((sqrt_read_at (1) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t1))) (t1_2)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> (sqrt_active (2) (retval) ((sqrt_read_at (2) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t2))) (t2_2)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> (sqrt_active (3) (retval) ((sqrt_read_at (3) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t3))) (t3_2)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> (sqrt_active (4) (retval) ((sqrt_read_at (4) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t4))) (t4_2)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> (sqrt_active (5) (retval) ((sqrt_read_at (5) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t5))) (t5_2)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> (sqrt_active (6) (retval) ((sqrt_read_at (6) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t6))) (t6_2)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> (sqrt_active (7) (retval) ((sqrt_read_at (7) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t7))) (t7_2)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> (sqrt_active (8) (retval) ((sqrt_read_at (8) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t8))) (t8_2)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> (sqrt_active (9) (retval) ((sqrt_read_at (9) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t9))) (t9_2)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> (sqrt_active (10) (retval) ((sqrt_read_at (10) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t10))) (t10_2)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> (sqrt_active (11) (retval) ((sqrt_read_at (11) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t11))) (t11_2)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> (sqrt_active (12) (retval) ((sqrt_read_at (12) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t12))) (t12_2)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> (sqrt_active (13) (retval) ((sqrt_read_at (13) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t13))) (t13_2)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> (sqrt_active (14) (retval) ((sqrt_read_at (14) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t14))) (t14_2)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> (sqrt_active (15) (retval) ((sqrt_read_at (15) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t15))) (t15_2)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> (sqrt_active (16) (retval) ((sqrt_read_at (16) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t16))) (t16_2)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> (sqrt_active (17) (retval) ((sqrt_read_at (17) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t17))) (t17_2)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> (sqrt_active (18) (retval) ((sqrt_read_at (18) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t18))) (t18_2)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> (sqrt_active (19) (retval) ((sqrt_read_at (19) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t19))) (t19_2)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> (sqrt_active (20) (retval) ((sqrt_read_at (20) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t20))) (t20_2)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> (sqrt_active (21) (retval) ((sqrt_read_at (21) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t21))) (t21_2)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> (sqrt_active (22) (retval) ((sqrt_read_at (22) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t22))) (t22_2)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> (sqrt_active (23) (retval) ((sqrt_read_at (23) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t23))) (t23_2)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> (sqrt_active (24) (retval) ((sqrt_read_at (24) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t24))) (t24_2)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> (sqrt_active (25) (retval) ((sqrt_read_at (25) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t25))) (t25_2)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> (sqrt_active (26) (retval) ((sqrt_read_at (26) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t26))) (t26_2)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> (sqrt_active (27) (retval) ((sqrt_read_at (27) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t27))) (t27_2)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> (sqrt_active (28) (retval) ((sqrt_read_at (28) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t28))) (t28_2)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> (sqrt_active (29) (retval) ((sqrt_read_at (29) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t29))) (t29_2)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> (sqrt_active (30) (retval) ((sqrt_read_at (30) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t30))) (t30_2)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> (sqrt_active (31) (retval) ((sqrt_read_at (31) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t31))) (t31_2)))
  **  (UndefStructPredvfloat32m8_t ( &( "vy" ) ) )
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - n ) (sqrt_rvv_values (((batch_pre ÷ 4 ) - n )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - n ) ) )
  **  ((&(( &( "vx" ) )->ₛ "s0")) # Float  |-> (sqrt_read_at (0) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t0)))
  **  ((&(( &( "vx" ) )->ₛ "s1")) # Float  |-> (sqrt_read_at (1) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t1)))
  **  ((&(( &( "vx" ) )->ₛ "s2")) # Float  |-> (sqrt_read_at (2) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t2)))
  **  ((&(( &( "vx" ) )->ₛ "s3")) # Float  |-> (sqrt_read_at (3) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t3)))
  **  ((&(( &( "vx" ) )->ₛ "s4")) # Float  |-> (sqrt_read_at (4) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t4)))
  **  ((&(( &( "vx" ) )->ₛ "s5")) # Float  |-> (sqrt_read_at (5) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t5)))
  **  ((&(( &( "vx" ) )->ₛ "s6")) # Float  |-> (sqrt_read_at (6) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t6)))
  **  ((&(( &( "vx" ) )->ₛ "s7")) # Float  |-> (sqrt_read_at (7) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t7)))
  **  ((&(( &( "vx" ) )->ₛ "s8")) # Float  |-> (sqrt_read_at (8) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t8)))
  **  ((&(( &( "vx" ) )->ₛ "s9")) # Float  |-> (sqrt_read_at (9) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t9)))
  **  ((&(( &( "vx" ) )->ₛ "s10")) # Float  |-> (sqrt_read_at (10) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t10)))
  **  ((&(( &( "vx" ) )->ₛ "s11")) # Float  |-> (sqrt_read_at (11) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t11)))
  **  ((&(( &( "vx" ) )->ₛ "s12")) # Float  |-> (sqrt_read_at (12) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t12)))
  **  ((&(( &( "vx" ) )->ₛ "s13")) # Float  |-> (sqrt_read_at (13) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t13)))
  **  ((&(( &( "vx" ) )->ₛ "s14")) # Float  |-> (sqrt_read_at (14) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t14)))
  **  ((&(( &( "vx" ) )->ₛ "s15")) # Float  |-> (sqrt_read_at (15) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t15)))
  **  ((&(( &( "vx" ) )->ₛ "s16")) # Float  |-> (sqrt_read_at (16) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t16)))
  **  ((&(( &( "vx" ) )->ₛ "s17")) # Float  |-> (sqrt_read_at (17) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t17)))
  **  ((&(( &( "vx" ) )->ₛ "s18")) # Float  |-> (sqrt_read_at (18) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t18)))
  **  ((&(( &( "vx" ) )->ₛ "s19")) # Float  |-> (sqrt_read_at (19) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t19)))
  **  ((&(( &( "vx" ) )->ₛ "s20")) # Float  |-> (sqrt_read_at (20) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t20)))
  **  ((&(( &( "vx" ) )->ₛ "s21")) # Float  |-> (sqrt_read_at (21) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t21)))
  **  ((&(( &( "vx" ) )->ₛ "s22")) # Float  |-> (sqrt_read_at (22) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t22)))
  **  ((&(( &( "vx" ) )->ₛ "s23")) # Float  |-> (sqrt_read_at (23) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t23)))
  **  ((&(( &( "vx" ) )->ₛ "s24")) # Float  |-> (sqrt_read_at (24) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t24)))
  **  ((&(( &( "vx" ) )->ₛ "s25")) # Float  |-> (sqrt_read_at (25) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t25)))
  **  ((&(( &( "vx" ) )->ₛ "s26")) # Float  |-> (sqrt_read_at (26) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t26)))
  **  ((&(( &( "vx" ) )->ₛ "s27")) # Float  |-> (sqrt_read_at (27) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t27)))
  **  ((&(( &( "vx" ) )->ₛ "s28")) # Float  |-> (sqrt_read_at (28) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t28)))
  **  ((&(( &( "vx" ) )->ₛ "s29")) # Float  |-> (sqrt_read_at (29) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t29)))
  **  ((&(( &( "vx" ) )->ₛ "s30")) # Float  |-> (sqrt_read_at (30) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t30)))
  **  ((&(( &( "vx" ) )->ₛ "s31")) # Float  |-> (sqrt_read_at (31) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t31)))
|--
  “ (0 <= retval) ” 
  &&  “ (retval <= 32) ” 
  &&  “ (retval <= n) ” 
  &&  “ (retval > 0) ” 
  &&  “ (32 < n) ” 
  &&  “ (n < 64) ” 
  &&  “ (((n + 1 ) ÷ 2 ) <= retval) ” 
  &&  “ (n > 0) ” 
  &&  “ (sizeof(FLOAT) = 4) ” 
  &&  “ ((batch_pre % ( 4 ) ) = 0) ” 
  &&  “ ((batch_pre % ( sizeof(FLOAT) ) ) = 0) ” 
  &&  “ (0 < (batch_pre ÷ 4 )) ” 
  &&  “ ((batch_pre ÷ 4 ) <= 4611686018427387903) ” 
  &&  “ (0 <= n) ” 
  &&  “ (n <= (batch_pre ÷ 4 )) ” 
  &&  “ (input = (input_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT)))) ”
  &&  ((&(( &( "vy" ) )->ₛ "s31")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> (sqrt_active (31) (retval) ((sqrt_read_at (31) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t31))) (t31_2)))
  **  ((&(( &( "vy" ) )->ₛ "s30")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> (sqrt_active (30) (retval) ((sqrt_read_at (30) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t30))) (t30_2)))
  **  ((&(( &( "vy" ) )->ₛ "s29")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> (sqrt_active (29) (retval) ((sqrt_read_at (29) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t29))) (t29_2)))
  **  ((&(( &( "vy" ) )->ₛ "s28")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> (sqrt_active (28) (retval) ((sqrt_read_at (28) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t28))) (t28_2)))
  **  ((&(( &( "vy" ) )->ₛ "s27")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> (sqrt_active (27) (retval) ((sqrt_read_at (27) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t27))) (t27_2)))
  **  ((&(( &( "vy" ) )->ₛ "s26")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> (sqrt_active (26) (retval) ((sqrt_read_at (26) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t26))) (t26_2)))
  **  ((&(( &( "vy" ) )->ₛ "s25")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> (sqrt_active (25) (retval) ((sqrt_read_at (25) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t25))) (t25_2)))
  **  ((&(( &( "vy" ) )->ₛ "s24")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> (sqrt_active (24) (retval) ((sqrt_read_at (24) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t24))) (t24_2)))
  **  ((&(( &( "vy" ) )->ₛ "s23")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> (sqrt_active (23) (retval) ((sqrt_read_at (23) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t23))) (t23_2)))
  **  ((&(( &( "vy" ) )->ₛ "s22")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> (sqrt_active (22) (retval) ((sqrt_read_at (22) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t22))) (t22_2)))
  **  ((&(( &( "vy" ) )->ₛ "s21")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> (sqrt_active (21) (retval) ((sqrt_read_at (21) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t21))) (t21_2)))
  **  ((&(( &( "vy" ) )->ₛ "s20")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> (sqrt_active (20) (retval) ((sqrt_read_at (20) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t20))) (t20_2)))
  **  ((&(( &( "vy" ) )->ₛ "s19")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> (sqrt_active (19) (retval) ((sqrt_read_at (19) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t19))) (t19_2)))
  **  ((&(( &( "vy" ) )->ₛ "s18")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> (sqrt_active (18) (retval) ((sqrt_read_at (18) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t18))) (t18_2)))
  **  ((&(( &( "vy" ) )->ₛ "s17")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> (sqrt_active (17) (retval) ((sqrt_read_at (17) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t17))) (t17_2)))
  **  ((&(( &( "vy" ) )->ₛ "s16")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> (sqrt_active (16) (retval) ((sqrt_read_at (16) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t16))) (t16_2)))
  **  ((&(( &( "vy" ) )->ₛ "s15")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> (sqrt_active (15) (retval) ((sqrt_read_at (15) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t15))) (t15_2)))
  **  ((&(( &( "vy" ) )->ₛ "s14")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> (sqrt_active (14) (retval) ((sqrt_read_at (14) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t14))) (t14_2)))
  **  ((&(( &( "vy" ) )->ₛ "s13")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> (sqrt_active (13) (retval) ((sqrt_read_at (13) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t13))) (t13_2)))
  **  ((&(( &( "vy" ) )->ₛ "s12")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> (sqrt_active (12) (retval) ((sqrt_read_at (12) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t12))) (t12_2)))
  **  ((&(( &( "vy" ) )->ₛ "s11")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> (sqrt_active (11) (retval) ((sqrt_read_at (11) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t11))) (t11_2)))
  **  ((&(( &( "vy" ) )->ₛ "s10")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> (sqrt_active (10) (retval) ((sqrt_read_at (10) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t10))) (t10_2)))
  **  ((&(( &( "vy" ) )->ₛ "s9")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> (sqrt_active (9) (retval) ((sqrt_read_at (9) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t9))) (t9_2)))
  **  ((&(( &( "vy" ) )->ₛ "s8")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> (sqrt_active (8) (retval) ((sqrt_read_at (8) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t8))) (t8_2)))
  **  ((&(( &( "vy" ) )->ₛ "s7")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> (sqrt_active (7) (retval) ((sqrt_read_at (7) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t7))) (t7_2)))
  **  ((&(( &( "vy" ) )->ₛ "s6")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> (sqrt_active (6) (retval) ((sqrt_read_at (6) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t6))) (t6_2)))
  **  ((&(( &( "vy" ) )->ₛ "s5")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> (sqrt_active (5) (retval) ((sqrt_read_at (5) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t5))) (t5_2)))
  **  ((&(( &( "vy" ) )->ₛ "s4")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> (sqrt_active (4) (retval) ((sqrt_read_at (4) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t4))) (t4_2)))
  **  ((&(( &( "vy" ) )->ₛ "s3")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> (sqrt_active (3) (retval) ((sqrt_read_at (3) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t3))) (t3_2)))
  **  ((&(( &( "vy" ) )->ₛ "s2")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> (sqrt_active (2) (retval) ((sqrt_read_at (2) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t2))) (t2_2)))
  **  ((&(( &( "vy" ) )->ₛ "s1")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> (sqrt_active (1) (retval) ((sqrt_read_at (1) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t1))) (t1_2)))
  **  ((&(( &( "vy" ) )->ₛ "s0")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> (sqrt_active (0) (retval) ((sqrt_read_at (0) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t0))) (t0_2)))
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - n ) (sqrt_rvv_values (((batch_pre ÷ 4 ) - n )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - n ) ) )
  **  ((&(( &( "vx" ) )->ₛ "s0")) # Float  |-> (sqrt_read_at (0) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t0)))
  **  ((&(( &( "vx" ) )->ₛ "s1")) # Float  |-> (sqrt_read_at (1) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t1)))
  **  ((&(( &( "vx" ) )->ₛ "s2")) # Float  |-> (sqrt_read_at (2) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t2)))
  **  ((&(( &( "vx" ) )->ₛ "s3")) # Float  |-> (sqrt_read_at (3) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t3)))
  **  ((&(( &( "vx" ) )->ₛ "s4")) # Float  |-> (sqrt_read_at (4) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t4)))
  **  ((&(( &( "vx" ) )->ₛ "s5")) # Float  |-> (sqrt_read_at (5) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t5)))
  **  ((&(( &( "vx" ) )->ₛ "s6")) # Float  |-> (sqrt_read_at (6) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t6)))
  **  ((&(( &( "vx" ) )->ₛ "s7")) # Float  |-> (sqrt_read_at (7) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t7)))
  **  ((&(( &( "vx" ) )->ₛ "s8")) # Float  |-> (sqrt_read_at (8) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t8)))
  **  ((&(( &( "vx" ) )->ₛ "s9")) # Float  |-> (sqrt_read_at (9) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t9)))
  **  ((&(( &( "vx" ) )->ₛ "s10")) # Float  |-> (sqrt_read_at (10) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t10)))
  **  ((&(( &( "vx" ) )->ₛ "s11")) # Float  |-> (sqrt_read_at (11) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t11)))
  **  ((&(( &( "vx" ) )->ₛ "s12")) # Float  |-> (sqrt_read_at (12) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t12)))
  **  ((&(( &( "vx" ) )->ₛ "s13")) # Float  |-> (sqrt_read_at (13) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t13)))
  **  ((&(( &( "vx" ) )->ₛ "s14")) # Float  |-> (sqrt_read_at (14) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t14)))
  **  ((&(( &( "vx" ) )->ₛ "s15")) # Float  |-> (sqrt_read_at (15) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t15)))
  **  ((&(( &( "vx" ) )->ₛ "s16")) # Float  |-> (sqrt_read_at (16) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t16)))
  **  ((&(( &( "vx" ) )->ₛ "s17")) # Float  |-> (sqrt_read_at (17) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t17)))
  **  ((&(( &( "vx" ) )->ₛ "s18")) # Float  |-> (sqrt_read_at (18) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t18)))
  **  ((&(( &( "vx" ) )->ₛ "s19")) # Float  |-> (sqrt_read_at (19) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t19)))
  **  ((&(( &( "vx" ) )->ₛ "s20")) # Float  |-> (sqrt_read_at (20) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t20)))
  **  ((&(( &( "vx" ) )->ₛ "s21")) # Float  |-> (sqrt_read_at (21) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t21)))
  **  ((&(( &( "vx" ) )->ₛ "s22")) # Float  |-> (sqrt_read_at (22) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t22)))
  **  ((&(( &( "vx" ) )->ₛ "s23")) # Float  |-> (sqrt_read_at (23) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t23)))
  **  ((&(( &( "vx" ) )->ₛ "s24")) # Float  |-> (sqrt_read_at (24) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t24)))
  **  ((&(( &( "vx" ) )->ₛ "s25")) # Float  |-> (sqrt_read_at (25) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t25)))
  **  ((&(( &( "vx" ) )->ₛ "s26")) # Float  |-> (sqrt_read_at (26) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t26)))
  **  ((&(( &( "vx" ) )->ₛ "s27")) # Float  |-> (sqrt_read_at (27) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t27)))
  **  ((&(( &( "vx" ) )->ₛ "s28")) # Float  |-> (sqrt_read_at (28) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t28)))
  **  ((&(( &( "vx" ) )->ₛ "s29")) # Float  |-> (sqrt_read_at (29) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t29)))
  **  ((&(( &( "vx" ) )->ₛ "s30")) # Float  |-> (sqrt_read_at (30) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t30)))
  **  ((&(( &( "vx" ) )->ₛ "s31")) # Float  |-> (sqrt_read_at (31) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t31)))
.

Definition test_rvv_partial_solve_wit_17 := 
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (output: Z) (input: Z) (n: Z) (retval: Z) (t31: fp32) (t30: fp32) (t29: fp32) (t28: fp32) (t27: fp32) (t26: fp32) (t25: fp32) (t24: fp32) (t23: fp32) (t22: fp32) (t21: fp32) (t20: fp32) (t19: fp32) (t18: fp32) (t17: fp32) (t16: fp32) (t15: fp32) (t14: fp32) (t13: fp32) (t12: fp32) (t11: fp32) (t10: fp32) (t9: fp32) (t8: fp32) (t7: fp32) (t6: fp32) (t5: fp32) (t4: fp32) (t3: fp32) (t2: fp32) (t1: fp32) (t0: fp32) (t31_2: fp32) (t30_2: fp32) (t29_2: fp32) (t28_2: fp32) (t27_2: fp32) (t26_2: fp32) (t25_2: fp32) (t24_2: fp32) (t23_2: fp32) (t22_2: fp32) (t21_2: fp32) (t20_2: fp32) (t19_2: fp32) (t18_2: fp32) (t17_2: fp32) (t16_2: fp32) (t15_2: fp32) (t14_2: fp32) (t13_2: fp32) (t12_2: fp32) (t11_2: fp32) (t10_2: fp32) (t9_2: fp32) (t8_2: fp32) (t7_2: fp32) (t6_2: fp32) (t5_2: fp32) (t4_2: fp32) (t3_2: fp32) (t2_2: fp32) (t1_2: fp32) (t0_2: fp32) (retval_2: Z) (PreH1 : (0 <= retval)) (PreH2 : (retval <= 32)) (PreH3 : (retval <= n)) (PreH4 : (retval > 0)) (PreH5 : (n <= 32)) (PreH6 : (retval = n)) (PreH7 : (n > 0)) (PreH8 : (sizeof(FLOAT) = 4)) (PreH9 : ((batch_pre % ( 4 ) ) = 0)) (PreH10 : ((batch_pre % ( sizeof(FLOAT) ) ) = 0)) (PreH11 : (0 < (batch_pre ÷ 4 ))) (PreH12 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH13 : (0 <= n)) (PreH14 : (n <= (batch_pre ÷ 4 ))) (PreH15 : (input = (input_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) (PreH16 : (output = (output_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) ,
  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> (sqrt_active (0) (retval) ((sqrt_read_at (0) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t0))) (t0_2)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> (sqrt_active (1) (retval) ((sqrt_read_at (1) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t1))) (t1_2)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> (sqrt_active (2) (retval) ((sqrt_read_at (2) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t2))) (t2_2)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> (sqrt_active (3) (retval) ((sqrt_read_at (3) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t3))) (t3_2)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> (sqrt_active (4) (retval) ((sqrt_read_at (4) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t4))) (t4_2)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> (sqrt_active (5) (retval) ((sqrt_read_at (5) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t5))) (t5_2)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> (sqrt_active (6) (retval) ((sqrt_read_at (6) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t6))) (t6_2)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> (sqrt_active (7) (retval) ((sqrt_read_at (7) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t7))) (t7_2)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> (sqrt_active (8) (retval) ((sqrt_read_at (8) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t8))) (t8_2)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> (sqrt_active (9) (retval) ((sqrt_read_at (9) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t9))) (t9_2)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> (sqrt_active (10) (retval) ((sqrt_read_at (10) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t10))) (t10_2)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> (sqrt_active (11) (retval) ((sqrt_read_at (11) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t11))) (t11_2)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> (sqrt_active (12) (retval) ((sqrt_read_at (12) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t12))) (t12_2)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> (sqrt_active (13) (retval) ((sqrt_read_at (13) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t13))) (t13_2)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> (sqrt_active (14) (retval) ((sqrt_read_at (14) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t14))) (t14_2)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> (sqrt_active (15) (retval) ((sqrt_read_at (15) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t15))) (t15_2)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> (sqrt_active (16) (retval) ((sqrt_read_at (16) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t16))) (t16_2)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> (sqrt_active (17) (retval) ((sqrt_read_at (17) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t17))) (t17_2)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> (sqrt_active (18) (retval) ((sqrt_read_at (18) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t18))) (t18_2)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> (sqrt_active (19) (retval) ((sqrt_read_at (19) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t19))) (t19_2)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> (sqrt_active (20) (retval) ((sqrt_read_at (20) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t20))) (t20_2)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> (sqrt_active (21) (retval) ((sqrt_read_at (21) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t21))) (t21_2)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> (sqrt_active (22) (retval) ((sqrt_read_at (22) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t22))) (t22_2)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> (sqrt_active (23) (retval) ((sqrt_read_at (23) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t23))) (t23_2)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> (sqrt_active (24) (retval) ((sqrt_read_at (24) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t24))) (t24_2)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> (sqrt_active (25) (retval) ((sqrt_read_at (25) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t25))) (t25_2)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> (sqrt_active (26) (retval) ((sqrt_read_at (26) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t26))) (t26_2)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> (sqrt_active (27) (retval) ((sqrt_read_at (27) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t27))) (t27_2)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> (sqrt_active (28) (retval) ((sqrt_read_at (28) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t28))) (t28_2)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> (sqrt_active (29) (retval) ((sqrt_read_at (29) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t29))) (t29_2)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> (sqrt_active (30) (retval) ((sqrt_read_at (30) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t30))) (t30_2)))
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> (sqrt_active (31) (retval) ((sqrt_read_at (31) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t31))) (t31_2)))
  **  (UndefStructPredvfloat32m8_t ( &( "vy" ) ) )
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - n ) (sqrt_rvv_values (((batch_pre ÷ 4 ) - n )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - n ) ) )
  **  ((&(( &( "vx" ) )->ₛ "s0")) # Float  |-> (sqrt_read_at (0) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t0)))
  **  ((&(( &( "vx" ) )->ₛ "s1")) # Float  |-> (sqrt_read_at (1) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t1)))
  **  ((&(( &( "vx" ) )->ₛ "s2")) # Float  |-> (sqrt_read_at (2) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t2)))
  **  ((&(( &( "vx" ) )->ₛ "s3")) # Float  |-> (sqrt_read_at (3) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t3)))
  **  ((&(( &( "vx" ) )->ₛ "s4")) # Float  |-> (sqrt_read_at (4) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t4)))
  **  ((&(( &( "vx" ) )->ₛ "s5")) # Float  |-> (sqrt_read_at (5) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t5)))
  **  ((&(( &( "vx" ) )->ₛ "s6")) # Float  |-> (sqrt_read_at (6) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t6)))
  **  ((&(( &( "vx" ) )->ₛ "s7")) # Float  |-> (sqrt_read_at (7) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t7)))
  **  ((&(( &( "vx" ) )->ₛ "s8")) # Float  |-> (sqrt_read_at (8) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t8)))
  **  ((&(( &( "vx" ) )->ₛ "s9")) # Float  |-> (sqrt_read_at (9) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t9)))
  **  ((&(( &( "vx" ) )->ₛ "s10")) # Float  |-> (sqrt_read_at (10) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t10)))
  **  ((&(( &( "vx" ) )->ₛ "s11")) # Float  |-> (sqrt_read_at (11) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t11)))
  **  ((&(( &( "vx" ) )->ₛ "s12")) # Float  |-> (sqrt_read_at (12) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t12)))
  **  ((&(( &( "vx" ) )->ₛ "s13")) # Float  |-> (sqrt_read_at (13) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t13)))
  **  ((&(( &( "vx" ) )->ₛ "s14")) # Float  |-> (sqrt_read_at (14) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t14)))
  **  ((&(( &( "vx" ) )->ₛ "s15")) # Float  |-> (sqrt_read_at (15) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t15)))
  **  ((&(( &( "vx" ) )->ₛ "s16")) # Float  |-> (sqrt_read_at (16) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t16)))
  **  ((&(( &( "vx" ) )->ₛ "s17")) # Float  |-> (sqrt_read_at (17) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t17)))
  **  ((&(( &( "vx" ) )->ₛ "s18")) # Float  |-> (sqrt_read_at (18) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t18)))
  **  ((&(( &( "vx" ) )->ₛ "s19")) # Float  |-> (sqrt_read_at (19) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t19)))
  **  ((&(( &( "vx" ) )->ₛ "s20")) # Float  |-> (sqrt_read_at (20) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t20)))
  **  ((&(( &( "vx" ) )->ₛ "s21")) # Float  |-> (sqrt_read_at (21) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t21)))
  **  ((&(( &( "vx" ) )->ₛ "s22")) # Float  |-> (sqrt_read_at (22) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t22)))
  **  ((&(( &( "vx" ) )->ₛ "s23")) # Float  |-> (sqrt_read_at (23) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t23)))
  **  ((&(( &( "vx" ) )->ₛ "s24")) # Float  |-> (sqrt_read_at (24) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t24)))
  **  ((&(( &( "vx" ) )->ₛ "s25")) # Float  |-> (sqrt_read_at (25) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t25)))
  **  ((&(( &( "vx" ) )->ₛ "s26")) # Float  |-> (sqrt_read_at (26) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t26)))
  **  ((&(( &( "vx" ) )->ₛ "s27")) # Float  |-> (sqrt_read_at (27) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t27)))
  **  ((&(( &( "vx" ) )->ₛ "s28")) # Float  |-> (sqrt_read_at (28) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t28)))
  **  ((&(( &( "vx" ) )->ₛ "s29")) # Float  |-> (sqrt_read_at (29) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t29)))
  **  ((&(( &( "vx" ) )->ₛ "s30")) # Float  |-> (sqrt_read_at (30) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t30)))
  **  ((&(( &( "vx" ) )->ₛ "s31")) # Float  |-> (sqrt_read_at (31) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t31)))
|--
  “ (0 <= retval) ” 
  &&  “ (retval <= 32) ” 
  &&  “ (retval <= n) ” 
  &&  “ (retval > 0) ” 
  &&  “ (n <= 32) ” 
  &&  “ (retval = n) ” 
  &&  “ (n > 0) ” 
  &&  “ (sizeof(FLOAT) = 4) ” 
  &&  “ ((batch_pre % ( 4 ) ) = 0) ” 
  &&  “ ((batch_pre % ( sizeof(FLOAT) ) ) = 0) ” 
  &&  “ (0 < (batch_pre ÷ 4 )) ” 
  &&  “ ((batch_pre ÷ 4 ) <= 4611686018427387903) ” 
  &&  “ (0 <= n) ” 
  &&  “ (n <= (batch_pre ÷ 4 )) ” 
  &&  “ (input = (input_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT)))) ”
  &&  ((&(( &( "vy" ) )->ₛ "s31")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s31")) # Float  |-> (sqrt_active (31) (retval) ((sqrt_read_at (31) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t31))) (t31_2)))
  **  ((&(( &( "vy" ) )->ₛ "s30")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s30")) # Float  |-> (sqrt_active (30) (retval) ((sqrt_read_at (30) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t30))) (t30_2)))
  **  ((&(( &( "vy" ) )->ₛ "s29")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s29")) # Float  |-> (sqrt_active (29) (retval) ((sqrt_read_at (29) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t29))) (t29_2)))
  **  ((&(( &( "vy" ) )->ₛ "s28")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s28")) # Float  |-> (sqrt_active (28) (retval) ((sqrt_read_at (28) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t28))) (t28_2)))
  **  ((&(( &( "vy" ) )->ₛ "s27")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s27")) # Float  |-> (sqrt_active (27) (retval) ((sqrt_read_at (27) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t27))) (t27_2)))
  **  ((&(( &( "vy" ) )->ₛ "s26")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s26")) # Float  |-> (sqrt_active (26) (retval) ((sqrt_read_at (26) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t26))) (t26_2)))
  **  ((&(( &( "vy" ) )->ₛ "s25")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s25")) # Float  |-> (sqrt_active (25) (retval) ((sqrt_read_at (25) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t25))) (t25_2)))
  **  ((&(( &( "vy" ) )->ₛ "s24")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s24")) # Float  |-> (sqrt_active (24) (retval) ((sqrt_read_at (24) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t24))) (t24_2)))
  **  ((&(( &( "vy" ) )->ₛ "s23")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s23")) # Float  |-> (sqrt_active (23) (retval) ((sqrt_read_at (23) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t23))) (t23_2)))
  **  ((&(( &( "vy" ) )->ₛ "s22")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s22")) # Float  |-> (sqrt_active (22) (retval) ((sqrt_read_at (22) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t22))) (t22_2)))
  **  ((&(( &( "vy" ) )->ₛ "s21")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s21")) # Float  |-> (sqrt_active (21) (retval) ((sqrt_read_at (21) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t21))) (t21_2)))
  **  ((&(( &( "vy" ) )->ₛ "s20")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s20")) # Float  |-> (sqrt_active (20) (retval) ((sqrt_read_at (20) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t20))) (t20_2)))
  **  ((&(( &( "vy" ) )->ₛ "s19")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s19")) # Float  |-> (sqrt_active (19) (retval) ((sqrt_read_at (19) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t19))) (t19_2)))
  **  ((&(( &( "vy" ) )->ₛ "s18")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s18")) # Float  |-> (sqrt_active (18) (retval) ((sqrt_read_at (18) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t18))) (t18_2)))
  **  ((&(( &( "vy" ) )->ₛ "s17")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s17")) # Float  |-> (sqrt_active (17) (retval) ((sqrt_read_at (17) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t17))) (t17_2)))
  **  ((&(( &( "vy" ) )->ₛ "s16")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s16")) # Float  |-> (sqrt_active (16) (retval) ((sqrt_read_at (16) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t16))) (t16_2)))
  **  ((&(( &( "vy" ) )->ₛ "s15")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s15")) # Float  |-> (sqrt_active (15) (retval) ((sqrt_read_at (15) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t15))) (t15_2)))
  **  ((&(( &( "vy" ) )->ₛ "s14")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s14")) # Float  |-> (sqrt_active (14) (retval) ((sqrt_read_at (14) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t14))) (t14_2)))
  **  ((&(( &( "vy" ) )->ₛ "s13")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s13")) # Float  |-> (sqrt_active (13) (retval) ((sqrt_read_at (13) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t13))) (t13_2)))
  **  ((&(( &( "vy" ) )->ₛ "s12")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s12")) # Float  |-> (sqrt_active (12) (retval) ((sqrt_read_at (12) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t12))) (t12_2)))
  **  ((&(( &( "vy" ) )->ₛ "s11")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s11")) # Float  |-> (sqrt_active (11) (retval) ((sqrt_read_at (11) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t11))) (t11_2)))
  **  ((&(( &( "vy" ) )->ₛ "s10")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s10")) # Float  |-> (sqrt_active (10) (retval) ((sqrt_read_at (10) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t10))) (t10_2)))
  **  ((&(( &( "vy" ) )->ₛ "s9")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s9")) # Float  |-> (sqrt_active (9) (retval) ((sqrt_read_at (9) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t9))) (t9_2)))
  **  ((&(( &( "vy" ) )->ₛ "s8")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s8")) # Float  |-> (sqrt_active (8) (retval) ((sqrt_read_at (8) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t8))) (t8_2)))
  **  ((&(( &( "vy" ) )->ₛ "s7")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s7")) # Float  |-> (sqrt_active (7) (retval) ((sqrt_read_at (7) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t7))) (t7_2)))
  **  ((&(( &( "vy" ) )->ₛ "s6")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s6")) # Float  |-> (sqrt_active (6) (retval) ((sqrt_read_at (6) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t6))) (t6_2)))
  **  ((&(( &( "vy" ) )->ₛ "s5")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s5")) # Float  |-> (sqrt_active (5) (retval) ((sqrt_read_at (5) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t5))) (t5_2)))
  **  ((&(( &( "vy" ) )->ₛ "s4")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s4")) # Float  |-> (sqrt_active (4) (retval) ((sqrt_read_at (4) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t4))) (t4_2)))
  **  ((&(( &( "vy" ) )->ₛ "s3")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s3")) # Float  |-> (sqrt_active (3) (retval) ((sqrt_read_at (3) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t3))) (t3_2)))
  **  ((&(( &( "vy" ) )->ₛ "s2")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s2")) # Float  |-> (sqrt_active (2) (retval) ((sqrt_read_at (2) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t2))) (t2_2)))
  **  ((&(( &( "vy" ) )->ₛ "s1")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s1")) # Float  |-> (sqrt_active (1) (retval) ((sqrt_read_at (1) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t1))) (t1_2)))
  **  ((&(( &( "vy" ) )->ₛ "s0")) # Float  |->_)
  **  ((&((retval_2)  # "vfloat32m8_t" ->ₛ "s0")) # Float  |-> (sqrt_active (0) (retval) ((sqrt_read_at (0) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t0))) (t0_2)))
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - n ) (sqrt_rvv_values (((batch_pre ÷ 4 ) - n )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - n ) ) )
  **  ((&(( &( "vx" ) )->ₛ "s0")) # Float  |-> (sqrt_read_at (0) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t0)))
  **  ((&(( &( "vx" ) )->ₛ "s1")) # Float  |-> (sqrt_read_at (1) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t1)))
  **  ((&(( &( "vx" ) )->ₛ "s2")) # Float  |-> (sqrt_read_at (2) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t2)))
  **  ((&(( &( "vx" ) )->ₛ "s3")) # Float  |-> (sqrt_read_at (3) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t3)))
  **  ((&(( &( "vx" ) )->ₛ "s4")) # Float  |-> (sqrt_read_at (4) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t4)))
  **  ((&(( &( "vx" ) )->ₛ "s5")) # Float  |-> (sqrt_read_at (5) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t5)))
  **  ((&(( &( "vx" ) )->ₛ "s6")) # Float  |-> (sqrt_read_at (6) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t6)))
  **  ((&(( &( "vx" ) )->ₛ "s7")) # Float  |-> (sqrt_read_at (7) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t7)))
  **  ((&(( &( "vx" ) )->ₛ "s8")) # Float  |-> (sqrt_read_at (8) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t8)))
  **  ((&(( &( "vx" ) )->ₛ "s9")) # Float  |-> (sqrt_read_at (9) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t9)))
  **  ((&(( &( "vx" ) )->ₛ "s10")) # Float  |-> (sqrt_read_at (10) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t10)))
  **  ((&(( &( "vx" ) )->ₛ "s11")) # Float  |-> (sqrt_read_at (11) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t11)))
  **  ((&(( &( "vx" ) )->ₛ "s12")) # Float  |-> (sqrt_read_at (12) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t12)))
  **  ((&(( &( "vx" ) )->ₛ "s13")) # Float  |-> (sqrt_read_at (13) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t13)))
  **  ((&(( &( "vx" ) )->ₛ "s14")) # Float  |-> (sqrt_read_at (14) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t14)))
  **  ((&(( &( "vx" ) )->ₛ "s15")) # Float  |-> (sqrt_read_at (15) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t15)))
  **  ((&(( &( "vx" ) )->ₛ "s16")) # Float  |-> (sqrt_read_at (16) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t16)))
  **  ((&(( &( "vx" ) )->ₛ "s17")) # Float  |-> (sqrt_read_at (17) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t17)))
  **  ((&(( &( "vx" ) )->ₛ "s18")) # Float  |-> (sqrt_read_at (18) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t18)))
  **  ((&(( &( "vx" ) )->ₛ "s19")) # Float  |-> (sqrt_read_at (19) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t19)))
  **  ((&(( &( "vx" ) )->ₛ "s20")) # Float  |-> (sqrt_read_at (20) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t20)))
  **  ((&(( &( "vx" ) )->ₛ "s21")) # Float  |-> (sqrt_read_at (21) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t21)))
  **  ((&(( &( "vx" ) )->ₛ "s22")) # Float  |-> (sqrt_read_at (22) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t22)))
  **  ((&(( &( "vx" ) )->ₛ "s23")) # Float  |-> (sqrt_read_at (23) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t23)))
  **  ((&(( &( "vx" ) )->ₛ "s24")) # Float  |-> (sqrt_read_at (24) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t24)))
  **  ((&(( &( "vx" ) )->ₛ "s25")) # Float  |-> (sqrt_read_at (25) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t25)))
  **  ((&(( &( "vx" ) )->ₛ "s26")) # Float  |-> (sqrt_read_at (26) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t26)))
  **  ((&(( &( "vx" ) )->ₛ "s27")) # Float  |-> (sqrt_read_at (27) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t27)))
  **  ((&(( &( "vx" ) )->ₛ "s28")) # Float  |-> (sqrt_read_at (28) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t28)))
  **  ((&(( &( "vx" ) )->ₛ "s29")) # Float  |-> (sqrt_read_at (29) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t29)))
  **  ((&(( &( "vx" ) )->ₛ "s30")) # Float  |-> (sqrt_read_at (30) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t30)))
  **  ((&(( &( "vx" ) )->ₛ "s31")) # Float  |-> (sqrt_read_at (31) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t31)))
.

Definition test_rvv_partial_solve_wit_18_pure := 
forall (unused_params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (output: Z) (input: Z) (n: Z) (retval: Z) (t31: fp32) (t30: fp32) (t29: fp32) (t28: fp32) (t27: fp32) (t26: fp32) (t25: fp32) (t24: fp32) (t23: fp32) (t22: fp32) (t21: fp32) (t20: fp32) (t19: fp32) (t18: fp32) (t17: fp32) (t16: fp32) (t15: fp32) (t14: fp32) (t13: fp32) (t12: fp32) (t11: fp32) (t10: fp32) (t9: fp32) (t8: fp32) (t7: fp32) (t6: fp32) (t5: fp32) (t4: fp32) (t3: fp32) (t2: fp32) (t1: fp32) (t0: fp32) (t31_2: fp32) (t30_2: fp32) (t29_2: fp32) (t28_2: fp32) (t27_2: fp32) (t26_2: fp32) (t25_2: fp32) (t24_2: fp32) (t23_2: fp32) (t22_2: fp32) (t21_2: fp32) (t20_2: fp32) (t19_2: fp32) (t18_2: fp32) (t17_2: fp32) (t16_2: fp32) (t15_2: fp32) (t14_2: fp32) (t13_2: fp32) (t12_2: fp32) (t11_2: fp32) (t10_2: fp32) (t9_2: fp32) (t8_2: fp32) (t7_2: fp32) (t6_2: fp32) (t5_2: fp32) (t4_2: fp32) (t3_2: fp32) (t2_2: fp32) (t1_2: fp32) (t0_2: fp32) (PreH1 : (0 <= retval)) (PreH2 : (retval <= 32)) (PreH3 : (retval <= n)) (PreH4 : (retval > 0)) (PreH5 : (n <= 32)) (PreH6 : (retval = n)) (PreH7 : (n > 0)) (PreH8 : (sizeof(FLOAT) = 4)) (PreH9 : ((batch_pre % ( 4 ) ) = 0)) (PreH10 : ((batch_pre % ( sizeof(FLOAT) ) ) = 0)) (PreH11 : (0 < (batch_pre ÷ 4 ))) (PreH12 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH13 : (0 <= n)) (PreH14 : (n <= (batch_pre ÷ 4 ))) (PreH15 : (input = (input_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) (PreH16 : (output = (output_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) ,
  ((&(( &( "vy" ) )->ₛ "s31")) # Float  |-> (sqrt_active (31) (retval) ((sqrt_read_at (31) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t31))) (t31_2)))
  **  ((&(( &( "vy" ) )->ₛ "s30")) # Float  |-> (sqrt_active (30) (retval) ((sqrt_read_at (30) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t30))) (t30_2)))
  **  ((&(( &( "vy" ) )->ₛ "s29")) # Float  |-> (sqrt_active (29) (retval) ((sqrt_read_at (29) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t29))) (t29_2)))
  **  ((&(( &( "vy" ) )->ₛ "s28")) # Float  |-> (sqrt_active (28) (retval) ((sqrt_read_at (28) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t28))) (t28_2)))
  **  ((&(( &( "vy" ) )->ₛ "s27")) # Float  |-> (sqrt_active (27) (retval) ((sqrt_read_at (27) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t27))) (t27_2)))
  **  ((&(( &( "vy" ) )->ₛ "s26")) # Float  |-> (sqrt_active (26) (retval) ((sqrt_read_at (26) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t26))) (t26_2)))
  **  ((&(( &( "vy" ) )->ₛ "s25")) # Float  |-> (sqrt_active (25) (retval) ((sqrt_read_at (25) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t25))) (t25_2)))
  **  ((&(( &( "vy" ) )->ₛ "s24")) # Float  |-> (sqrt_active (24) (retval) ((sqrt_read_at (24) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t24))) (t24_2)))
  **  ((&(( &( "vy" ) )->ₛ "s23")) # Float  |-> (sqrt_active (23) (retval) ((sqrt_read_at (23) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t23))) (t23_2)))
  **  ((&(( &( "vy" ) )->ₛ "s22")) # Float  |-> (sqrt_active (22) (retval) ((sqrt_read_at (22) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t22))) (t22_2)))
  **  ((&(( &( "vy" ) )->ₛ "s21")) # Float  |-> (sqrt_active (21) (retval) ((sqrt_read_at (21) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t21))) (t21_2)))
  **  ((&(( &( "vy" ) )->ₛ "s20")) # Float  |-> (sqrt_active (20) (retval) ((sqrt_read_at (20) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t20))) (t20_2)))
  **  ((&(( &( "vy" ) )->ₛ "s19")) # Float  |-> (sqrt_active (19) (retval) ((sqrt_read_at (19) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t19))) (t19_2)))
  **  ((&(( &( "vy" ) )->ₛ "s18")) # Float  |-> (sqrt_active (18) (retval) ((sqrt_read_at (18) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t18))) (t18_2)))
  **  ((&(( &( "vy" ) )->ₛ "s17")) # Float  |-> (sqrt_active (17) (retval) ((sqrt_read_at (17) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t17))) (t17_2)))
  **  ((&(( &( "vy" ) )->ₛ "s16")) # Float  |-> (sqrt_active (16) (retval) ((sqrt_read_at (16) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t16))) (t16_2)))
  **  ((&(( &( "vy" ) )->ₛ "s15")) # Float  |-> (sqrt_active (15) (retval) ((sqrt_read_at (15) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t15))) (t15_2)))
  **  ((&(( &( "vy" ) )->ₛ "s14")) # Float  |-> (sqrt_active (14) (retval) ((sqrt_read_at (14) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t14))) (t14_2)))
  **  ((&(( &( "vy" ) )->ₛ "s13")) # Float  |-> (sqrt_active (13) (retval) ((sqrt_read_at (13) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t13))) (t13_2)))
  **  ((&(( &( "vy" ) )->ₛ "s12")) # Float  |-> (sqrt_active (12) (retval) ((sqrt_read_at (12) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t12))) (t12_2)))
  **  ((&(( &( "vy" ) )->ₛ "s11")) # Float  |-> (sqrt_active (11) (retval) ((sqrt_read_at (11) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t11))) (t11_2)))
  **  ((&(( &( "vy" ) )->ₛ "s10")) # Float  |-> (sqrt_active (10) (retval) ((sqrt_read_at (10) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t10))) (t10_2)))
  **  ((&(( &( "vy" ) )->ₛ "s9")) # Float  |-> (sqrt_active (9) (retval) ((sqrt_read_at (9) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t9))) (t9_2)))
  **  ((&(( &( "vy" ) )->ₛ "s8")) # Float  |-> (sqrt_active (8) (retval) ((sqrt_read_at (8) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t8))) (t8_2)))
  **  ((&(( &( "vy" ) )->ₛ "s7")) # Float  |-> (sqrt_active (7) (retval) ((sqrt_read_at (7) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t7))) (t7_2)))
  **  ((&(( &( "vy" ) )->ₛ "s6")) # Float  |-> (sqrt_active (6) (retval) ((sqrt_read_at (6) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t6))) (t6_2)))
  **  ((&(( &( "vy" ) )->ₛ "s5")) # Float  |-> (sqrt_active (5) (retval) ((sqrt_read_at (5) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t5))) (t5_2)))
  **  ((&(( &( "vy" ) )->ₛ "s4")) # Float  |-> (sqrt_active (4) (retval) ((sqrt_read_at (4) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t4))) (t4_2)))
  **  ((&(( &( "vy" ) )->ₛ "s3")) # Float  |-> (sqrt_active (3) (retval) ((sqrt_read_at (3) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t3))) (t3_2)))
  **  ((&(( &( "vy" ) )->ₛ "s2")) # Float  |-> (sqrt_active (2) (retval) ((sqrt_read_at (2) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t2))) (t2_2)))
  **  ((&(( &( "vy" ) )->ₛ "s1")) # Float  |-> (sqrt_active (1) (retval) ((sqrt_read_at (1) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t1))) (t1_2)))
  **  ((&(( &( "vy" ) )->ₛ "s0")) # Float  |-> (sqrt_active (0) (retval) ((sqrt_read_at (0) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t0))) (t0_2)))
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  ((( &( "vl" ) )) # UInt64  |-> retval)
  **  ((( &( "unused_params" ) )) # Ptr  |-> unused_params_pre)
  **  ((( &( "batch" ) )) # UInt64  |-> batch_pre)
  **  ((( &( "n" ) )) # UInt64  |-> n)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - n ) (sqrt_rvv_values (((batch_pre ÷ 4 ) - n )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - n ) ) )
  **  ((&(( &( "vx" ) )->ₛ "s0")) # Float  |-> (sqrt_read_at (0) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t0)))
  **  ((&(( &( "vx" ) )->ₛ "s1")) # Float  |-> (sqrt_read_at (1) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t1)))
  **  ((&(( &( "vx" ) )->ₛ "s2")) # Float  |-> (sqrt_read_at (2) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t2)))
  **  ((&(( &( "vx" ) )->ₛ "s3")) # Float  |-> (sqrt_read_at (3) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t3)))
  **  ((&(( &( "vx" ) )->ₛ "s4")) # Float  |-> (sqrt_read_at (4) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t4)))
  **  ((&(( &( "vx" ) )->ₛ "s5")) # Float  |-> (sqrt_read_at (5) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t5)))
  **  ((&(( &( "vx" ) )->ₛ "s6")) # Float  |-> (sqrt_read_at (6) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t6)))
  **  ((&(( &( "vx" ) )->ₛ "s7")) # Float  |-> (sqrt_read_at (7) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t7)))
  **  ((&(( &( "vx" ) )->ₛ "s8")) # Float  |-> (sqrt_read_at (8) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t8)))
  **  ((&(( &( "vx" ) )->ₛ "s9")) # Float  |-> (sqrt_read_at (9) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t9)))
  **  ((&(( &( "vx" ) )->ₛ "s10")) # Float  |-> (sqrt_read_at (10) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t10)))
  **  ((&(( &( "vx" ) )->ₛ "s11")) # Float  |-> (sqrt_read_at (11) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t11)))
  **  ((&(( &( "vx" ) )->ₛ "s12")) # Float  |-> (sqrt_read_at (12) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t12)))
  **  ((&(( &( "vx" ) )->ₛ "s13")) # Float  |-> (sqrt_read_at (13) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t13)))
  **  ((&(( &( "vx" ) )->ₛ "s14")) # Float  |-> (sqrt_read_at (14) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t14)))
  **  ((&(( &( "vx" ) )->ₛ "s15")) # Float  |-> (sqrt_read_at (15) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t15)))
  **  ((&(( &( "vx" ) )->ₛ "s16")) # Float  |-> (sqrt_read_at (16) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t16)))
  **  ((&(( &( "vx" ) )->ₛ "s17")) # Float  |-> (sqrt_read_at (17) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t17)))
  **  ((&(( &( "vx" ) )->ₛ "s18")) # Float  |-> (sqrt_read_at (18) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t18)))
  **  ((&(( &( "vx" ) )->ₛ "s19")) # Float  |-> (sqrt_read_at (19) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t19)))
  **  ((&(( &( "vx" ) )->ₛ "s20")) # Float  |-> (sqrt_read_at (20) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t20)))
  **  ((&(( &( "vx" ) )->ₛ "s21")) # Float  |-> (sqrt_read_at (21) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t21)))
  **  ((&(( &( "vx" ) )->ₛ "s22")) # Float  |-> (sqrt_read_at (22) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t22)))
  **  ((&(( &( "vx" ) )->ₛ "s23")) # Float  |-> (sqrt_read_at (23) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t23)))
  **  ((&(( &( "vx" ) )->ₛ "s24")) # Float  |-> (sqrt_read_at (24) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t24)))
  **  ((&(( &( "vx" ) )->ₛ "s25")) # Float  |-> (sqrt_read_at (25) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t25)))
  **  ((&(( &( "vx" ) )->ₛ "s26")) # Float  |-> (sqrt_read_at (26) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t26)))
  **  ((&(( &( "vx" ) )->ₛ "s27")) # Float  |-> (sqrt_read_at (27) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t27)))
  **  ((&(( &( "vx" ) )->ₛ "s28")) # Float  |-> (sqrt_read_at (28) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t28)))
  **  ((&(( &( "vx" ) )->ₛ "s29")) # Float  |-> (sqrt_read_at (29) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t29)))
  **  ((&(( &( "vx" ) )->ₛ "s30")) # Float  |-> (sqrt_read_at (30) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t30)))
  **  ((&(( &( "vx" ) )->ₛ "s31")) # Float  |-> (sqrt_read_at (31) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t31)))
|--
  “ (0 <= retval) ” 
  &&  “ (retval <= 32) ” 
  &&  “ ((rvv_pack32 ((sqrt_active (0) (retval) ((sqrt_read_at (0) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t0))) (t0_2))) ((sqrt_active (1) (retval) ((sqrt_read_at (1) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t1))) (t1_2))) ((sqrt_active (2) (retval) ((sqrt_read_at (2) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t2))) (t2_2))) ((sqrt_active (3) (retval) ((sqrt_read_at (3) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t3))) (t3_2))) ((sqrt_active (4) (retval) ((sqrt_read_at (4) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t4))) (t4_2))) ((sqrt_active (5) (retval) ((sqrt_read_at (5) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t5))) (t5_2))) ((sqrt_active (6) (retval) ((sqrt_read_at (6) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t6))) (t6_2))) ((sqrt_active (7) (retval) ((sqrt_read_at (7) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t7))) (t7_2))) ((sqrt_active (8) (retval) ((sqrt_read_at (8) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t8))) (t8_2))) ((sqrt_active (9) (retval) ((sqrt_read_at (9) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t9))) (t9_2))) ((sqrt_active (10) (retval) ((sqrt_read_at (10) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t10))) (t10_2))) ((sqrt_active (11) (retval) ((sqrt_read_at (11) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t11))) (t11_2))) ((sqrt_active (12) (retval) ((sqrt_read_at (12) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t12))) (t12_2))) ((sqrt_active (13) (retval) ((sqrt_read_at (13) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t13))) (t13_2))) ((sqrt_active (14) (retval) ((sqrt_read_at (14) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t14))) (t14_2))) ((sqrt_active (15) (retval) ((sqrt_read_at (15) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t15))) (t15_2))) ((sqrt_active (16) (retval) ((sqrt_read_at (16) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t16))) (t16_2))) ((sqrt_active (17) (retval) ((sqrt_read_at (17) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t17))) (t17_2))) ((sqrt_active (18) (retval) ((sqrt_read_at (18) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t18))) (t18_2))) ((sqrt_active (19) (retval) ((sqrt_read_at (19) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t19))) (t19_2))) ((sqrt_active (20) (retval) ((sqrt_read_at (20) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t20))) (t20_2))) ((sqrt_active (21) (retval) ((sqrt_read_at (21) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t21))) (t21_2))) ((sqrt_active (22) (retval) ((sqrt_read_at (22) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t22))) (t22_2))) ((sqrt_active (23) (retval) ((sqrt_read_at (23) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t23))) (t23_2))) ((sqrt_active (24) (retval) ((sqrt_read_at (24) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t24))) (t24_2))) ((sqrt_active (25) (retval) ((sqrt_read_at (25) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t25))) (t25_2))) ((sqrt_active (26) (retval) ((sqrt_read_at (26) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t26))) (t26_2))) ((sqrt_active (27) (retval) ((sqrt_read_at (27) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t27))) (t27_2))) ((sqrt_active (28) (retval) ((sqrt_read_at (28) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t28))) (t28_2))) ((sqrt_active (29) (retval) ((sqrt_read_at (29) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t29))) (t29_2))) ((sqrt_active (30) (retval) ((sqrt_read_at (30) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t30))) (t30_2))) ((sqrt_active (31) (retval) ((sqrt_read_at (31) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t31))) (t31_2)))) = (rvv_pack32 ((sqrt_active (0) (retval) ((sqrt_read_at (0) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t0))) (t0_2))) ((sqrt_active (1) (retval) ((sqrt_read_at (1) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t1))) (t1_2))) ((sqrt_active (2) (retval) ((sqrt_read_at (2) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t2))) (t2_2))) ((sqrt_active (3) (retval) ((sqrt_read_at (3) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t3))) (t3_2))) ((sqrt_active (4) (retval) ((sqrt_read_at (4) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t4))) (t4_2))) ((sqrt_active (5) (retval) ((sqrt_read_at (5) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t5))) (t5_2))) ((sqrt_active (6) (retval) ((sqrt_read_at (6) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t6))) (t6_2))) ((sqrt_active (7) (retval) ((sqrt_read_at (7) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t7))) (t7_2))) ((sqrt_active (8) (retval) ((sqrt_read_at (8) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t8))) (t8_2))) ((sqrt_active (9) (retval) ((sqrt_read_at (9) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t9))) (t9_2))) ((sqrt_active (10) (retval) ((sqrt_read_at (10) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t10))) (t10_2))) ((sqrt_active (11) (retval) ((sqrt_read_at (11) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t11))) (t11_2))) ((sqrt_active (12) (retval) ((sqrt_read_at (12) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t12))) (t12_2))) ((sqrt_active (13) (retval) ((sqrt_read_at (13) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t13))) (t13_2))) ((sqrt_active (14) (retval) ((sqrt_read_at (14) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t14))) (t14_2))) ((sqrt_active (15) (retval) ((sqrt_read_at (15) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t15))) (t15_2))) ((sqrt_active (16) (retval) ((sqrt_read_at (16) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t16))) (t16_2))) ((sqrt_active (17) (retval) ((sqrt_read_at (17) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t17))) (t17_2))) ((sqrt_active (18) (retval) ((sqrt_read_at (18) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t18))) (t18_2))) ((sqrt_active (19) (retval) ((sqrt_read_at (19) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t19))) (t19_2))) ((sqrt_active (20) (retval) ((sqrt_read_at (20) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t20))) (t20_2))) ((sqrt_active (21) (retval) ((sqrt_read_at (21) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t21))) (t21_2))) ((sqrt_active (22) (retval) ((sqrt_read_at (22) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t22))) (t22_2))) ((sqrt_active (23) (retval) ((sqrt_read_at (23) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t23))) (t23_2))) ((sqrt_active (24) (retval) ((sqrt_read_at (24) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t24))) (t24_2))) ((sqrt_active (25) (retval) ((sqrt_read_at (25) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t25))) (t25_2))) ((sqrt_active (26) (retval) ((sqrt_read_at (26) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t26))) (t26_2))) ((sqrt_active (27) (retval) ((sqrt_read_at (27) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t27))) (t27_2))) ((sqrt_active (28) (retval) ((sqrt_read_at (28) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t28))) (t28_2))) ((sqrt_active (29) (retval) ((sqrt_read_at (29) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t29))) (t29_2))) ((sqrt_active (30) (retval) ((sqrt_read_at (30) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t30))) (t30_2))) ((sqrt_active (31) (retval) ((sqrt_read_at (31) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t31))) (t31_2))))) ”
.

Definition test_rvv_partial_solve_wit_18_aux := 
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (output: Z) (input: Z) (n: Z) (retval: Z) (t31: fp32) (t30: fp32) (t29: fp32) (t28: fp32) (t27: fp32) (t26: fp32) (t25: fp32) (t24: fp32) (t23: fp32) (t22: fp32) (t21: fp32) (t20: fp32) (t19: fp32) (t18: fp32) (t17: fp32) (t16: fp32) (t15: fp32) (t14: fp32) (t13: fp32) (t12: fp32) (t11: fp32) (t10: fp32) (t9: fp32) (t8: fp32) (t7: fp32) (t6: fp32) (t5: fp32) (t4: fp32) (t3: fp32) (t2: fp32) (t1: fp32) (t0: fp32) (t31_2: fp32) (t30_2: fp32) (t29_2: fp32) (t28_2: fp32) (t27_2: fp32) (t26_2: fp32) (t25_2: fp32) (t24_2: fp32) (t23_2: fp32) (t22_2: fp32) (t21_2: fp32) (t20_2: fp32) (t19_2: fp32) (t18_2: fp32) (t17_2: fp32) (t16_2: fp32) (t15_2: fp32) (t14_2: fp32) (t13_2: fp32) (t12_2: fp32) (t11_2: fp32) (t10_2: fp32) (t9_2: fp32) (t8_2: fp32) (t7_2: fp32) (t6_2: fp32) (t5_2: fp32) (t4_2: fp32) (t3_2: fp32) (t2_2: fp32) (t1_2: fp32) (t0_2: fp32) (PreH1 : (0 <= retval)) (PreH2 : (retval <= 32)) (PreH3 : (retval <= n)) (PreH4 : (retval > 0)) (PreH5 : (n <= 32)) (PreH6 : (retval = n)) (PreH7 : (n > 0)) (PreH8 : (sizeof(FLOAT) = 4)) (PreH9 : ((batch_pre % ( 4 ) ) = 0)) (PreH10 : ((batch_pre % ( sizeof(FLOAT) ) ) = 0)) (PreH11 : (0 < (batch_pre ÷ 4 ))) (PreH12 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH13 : (0 <= n)) (PreH14 : (n <= (batch_pre ÷ 4 ))) (PreH15 : (input = (input_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) (PreH16 : (output = (output_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) ,
  ((&(( &( "vy" ) )->ₛ "s31")) # Float  |-> (sqrt_active (31) (retval) ((sqrt_read_at (31) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t31))) (t31_2)))
  **  ((&(( &( "vy" ) )->ₛ "s30")) # Float  |-> (sqrt_active (30) (retval) ((sqrt_read_at (30) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t30))) (t30_2)))
  **  ((&(( &( "vy" ) )->ₛ "s29")) # Float  |-> (sqrt_active (29) (retval) ((sqrt_read_at (29) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t29))) (t29_2)))
  **  ((&(( &( "vy" ) )->ₛ "s28")) # Float  |-> (sqrt_active (28) (retval) ((sqrt_read_at (28) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t28))) (t28_2)))
  **  ((&(( &( "vy" ) )->ₛ "s27")) # Float  |-> (sqrt_active (27) (retval) ((sqrt_read_at (27) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t27))) (t27_2)))
  **  ((&(( &( "vy" ) )->ₛ "s26")) # Float  |-> (sqrt_active (26) (retval) ((sqrt_read_at (26) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t26))) (t26_2)))
  **  ((&(( &( "vy" ) )->ₛ "s25")) # Float  |-> (sqrt_active (25) (retval) ((sqrt_read_at (25) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t25))) (t25_2)))
  **  ((&(( &( "vy" ) )->ₛ "s24")) # Float  |-> (sqrt_active (24) (retval) ((sqrt_read_at (24) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t24))) (t24_2)))
  **  ((&(( &( "vy" ) )->ₛ "s23")) # Float  |-> (sqrt_active (23) (retval) ((sqrt_read_at (23) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t23))) (t23_2)))
  **  ((&(( &( "vy" ) )->ₛ "s22")) # Float  |-> (sqrt_active (22) (retval) ((sqrt_read_at (22) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t22))) (t22_2)))
  **  ((&(( &( "vy" ) )->ₛ "s21")) # Float  |-> (sqrt_active (21) (retval) ((sqrt_read_at (21) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t21))) (t21_2)))
  **  ((&(( &( "vy" ) )->ₛ "s20")) # Float  |-> (sqrt_active (20) (retval) ((sqrt_read_at (20) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t20))) (t20_2)))
  **  ((&(( &( "vy" ) )->ₛ "s19")) # Float  |-> (sqrt_active (19) (retval) ((sqrt_read_at (19) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t19))) (t19_2)))
  **  ((&(( &( "vy" ) )->ₛ "s18")) # Float  |-> (sqrt_active (18) (retval) ((sqrt_read_at (18) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t18))) (t18_2)))
  **  ((&(( &( "vy" ) )->ₛ "s17")) # Float  |-> (sqrt_active (17) (retval) ((sqrt_read_at (17) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t17))) (t17_2)))
  **  ((&(( &( "vy" ) )->ₛ "s16")) # Float  |-> (sqrt_active (16) (retval) ((sqrt_read_at (16) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t16))) (t16_2)))
  **  ((&(( &( "vy" ) )->ₛ "s15")) # Float  |-> (sqrt_active (15) (retval) ((sqrt_read_at (15) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t15))) (t15_2)))
  **  ((&(( &( "vy" ) )->ₛ "s14")) # Float  |-> (sqrt_active (14) (retval) ((sqrt_read_at (14) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t14))) (t14_2)))
  **  ((&(( &( "vy" ) )->ₛ "s13")) # Float  |-> (sqrt_active (13) (retval) ((sqrt_read_at (13) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t13))) (t13_2)))
  **  ((&(( &( "vy" ) )->ₛ "s12")) # Float  |-> (sqrt_active (12) (retval) ((sqrt_read_at (12) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t12))) (t12_2)))
  **  ((&(( &( "vy" ) )->ₛ "s11")) # Float  |-> (sqrt_active (11) (retval) ((sqrt_read_at (11) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t11))) (t11_2)))
  **  ((&(( &( "vy" ) )->ₛ "s10")) # Float  |-> (sqrt_active (10) (retval) ((sqrt_read_at (10) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t10))) (t10_2)))
  **  ((&(( &( "vy" ) )->ₛ "s9")) # Float  |-> (sqrt_active (9) (retval) ((sqrt_read_at (9) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t9))) (t9_2)))
  **  ((&(( &( "vy" ) )->ₛ "s8")) # Float  |-> (sqrt_active (8) (retval) ((sqrt_read_at (8) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t8))) (t8_2)))
  **  ((&(( &( "vy" ) )->ₛ "s7")) # Float  |-> (sqrt_active (7) (retval) ((sqrt_read_at (7) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t7))) (t7_2)))
  **  ((&(( &( "vy" ) )->ₛ "s6")) # Float  |-> (sqrt_active (6) (retval) ((sqrt_read_at (6) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t6))) (t6_2)))
  **  ((&(( &( "vy" ) )->ₛ "s5")) # Float  |-> (sqrt_active (5) (retval) ((sqrt_read_at (5) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t5))) (t5_2)))
  **  ((&(( &( "vy" ) )->ₛ "s4")) # Float  |-> (sqrt_active (4) (retval) ((sqrt_read_at (4) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t4))) (t4_2)))
  **  ((&(( &( "vy" ) )->ₛ "s3")) # Float  |-> (sqrt_active (3) (retval) ((sqrt_read_at (3) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t3))) (t3_2)))
  **  ((&(( &( "vy" ) )->ₛ "s2")) # Float  |-> (sqrt_active (2) (retval) ((sqrt_read_at (2) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t2))) (t2_2)))
  **  ((&(( &( "vy" ) )->ₛ "s1")) # Float  |-> (sqrt_active (1) (retval) ((sqrt_read_at (1) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t1))) (t1_2)))
  **  ((&(( &( "vy" ) )->ₛ "s0")) # Float  |-> (sqrt_active (0) (retval) ((sqrt_read_at (0) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t0))) (t0_2)))
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - n ) (sqrt_rvv_values (((batch_pre ÷ 4 ) - n )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - n ) ) )
  **  ((&(( &( "vx" ) )->ₛ "s0")) # Float  |-> (sqrt_read_at (0) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t0)))
  **  ((&(( &( "vx" ) )->ₛ "s1")) # Float  |-> (sqrt_read_at (1) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t1)))
  **  ((&(( &( "vx" ) )->ₛ "s2")) # Float  |-> (sqrt_read_at (2) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t2)))
  **  ((&(( &( "vx" ) )->ₛ "s3")) # Float  |-> (sqrt_read_at (3) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t3)))
  **  ((&(( &( "vx" ) )->ₛ "s4")) # Float  |-> (sqrt_read_at (4) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t4)))
  **  ((&(( &( "vx" ) )->ₛ "s5")) # Float  |-> (sqrt_read_at (5) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t5)))
  **  ((&(( &( "vx" ) )->ₛ "s6")) # Float  |-> (sqrt_read_at (6) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t6)))
  **  ((&(( &( "vx" ) )->ₛ "s7")) # Float  |-> (sqrt_read_at (7) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t7)))
  **  ((&(( &( "vx" ) )->ₛ "s8")) # Float  |-> (sqrt_read_at (8) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t8)))
  **  ((&(( &( "vx" ) )->ₛ "s9")) # Float  |-> (sqrt_read_at (9) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t9)))
  **  ((&(( &( "vx" ) )->ₛ "s10")) # Float  |-> (sqrt_read_at (10) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t10)))
  **  ((&(( &( "vx" ) )->ₛ "s11")) # Float  |-> (sqrt_read_at (11) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t11)))
  **  ((&(( &( "vx" ) )->ₛ "s12")) # Float  |-> (sqrt_read_at (12) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t12)))
  **  ((&(( &( "vx" ) )->ₛ "s13")) # Float  |-> (sqrt_read_at (13) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t13)))
  **  ((&(( &( "vx" ) )->ₛ "s14")) # Float  |-> (sqrt_read_at (14) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t14)))
  **  ((&(( &( "vx" ) )->ₛ "s15")) # Float  |-> (sqrt_read_at (15) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t15)))
  **  ((&(( &( "vx" ) )->ₛ "s16")) # Float  |-> (sqrt_read_at (16) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t16)))
  **  ((&(( &( "vx" ) )->ₛ "s17")) # Float  |-> (sqrt_read_at (17) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t17)))
  **  ((&(( &( "vx" ) )->ₛ "s18")) # Float  |-> (sqrt_read_at (18) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t18)))
  **  ((&(( &( "vx" ) )->ₛ "s19")) # Float  |-> (sqrt_read_at (19) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t19)))
  **  ((&(( &( "vx" ) )->ₛ "s20")) # Float  |-> (sqrt_read_at (20) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t20)))
  **  ((&(( &( "vx" ) )->ₛ "s21")) # Float  |-> (sqrt_read_at (21) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t21)))
  **  ((&(( &( "vx" ) )->ₛ "s22")) # Float  |-> (sqrt_read_at (22) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t22)))
  **  ((&(( &( "vx" ) )->ₛ "s23")) # Float  |-> (sqrt_read_at (23) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t23)))
  **  ((&(( &( "vx" ) )->ₛ "s24")) # Float  |-> (sqrt_read_at (24) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t24)))
  **  ((&(( &( "vx" ) )->ₛ "s25")) # Float  |-> (sqrt_read_at (25) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t25)))
  **  ((&(( &( "vx" ) )->ₛ "s26")) # Float  |-> (sqrt_read_at (26) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t26)))
  **  ((&(( &( "vx" ) )->ₛ "s27")) # Float  |-> (sqrt_read_at (27) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t27)))
  **  ((&(( &( "vx" ) )->ₛ "s28")) # Float  |-> (sqrt_read_at (28) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t28)))
  **  ((&(( &( "vx" ) )->ₛ "s29")) # Float  |-> (sqrt_read_at (29) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t29)))
  **  ((&(( &( "vx" ) )->ₛ "s30")) # Float  |-> (sqrt_read_at (30) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t30)))
  **  ((&(( &( "vx" ) )->ₛ "s31")) # Float  |-> (sqrt_read_at (31) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t31)))
|--
  “ (0 <= retval) ” 
  &&  “ (retval <= 32) ” 
  &&  “ ((rvv_pack32 ((sqrt_active (0) (retval) ((sqrt_read_at (0) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t0))) (t0_2))) ((sqrt_active (1) (retval) ((sqrt_read_at (1) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t1))) (t1_2))) ((sqrt_active (2) (retval) ((sqrt_read_at (2) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t2))) (t2_2))) ((sqrt_active (3) (retval) ((sqrt_read_at (3) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t3))) (t3_2))) ((sqrt_active (4) (retval) ((sqrt_read_at (4) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t4))) (t4_2))) ((sqrt_active (5) (retval) ((sqrt_read_at (5) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t5))) (t5_2))) ((sqrt_active (6) (retval) ((sqrt_read_at (6) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t6))) (t6_2))) ((sqrt_active (7) (retval) ((sqrt_read_at (7) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t7))) (t7_2))) ((sqrt_active (8) (retval) ((sqrt_read_at (8) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t8))) (t8_2))) ((sqrt_active (9) (retval) ((sqrt_read_at (9) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t9))) (t9_2))) ((sqrt_active (10) (retval) ((sqrt_read_at (10) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t10))) (t10_2))) ((sqrt_active (11) (retval) ((sqrt_read_at (11) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t11))) (t11_2))) ((sqrt_active (12) (retval) ((sqrt_read_at (12) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t12))) (t12_2))) ((sqrt_active (13) (retval) ((sqrt_read_at (13) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t13))) (t13_2))) ((sqrt_active (14) (retval) ((sqrt_read_at (14) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t14))) (t14_2))) ((sqrt_active (15) (retval) ((sqrt_read_at (15) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t15))) (t15_2))) ((sqrt_active (16) (retval) ((sqrt_read_at (16) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t16))) (t16_2))) ((sqrt_active (17) (retval) ((sqrt_read_at (17) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t17))) (t17_2))) ((sqrt_active (18) (retval) ((sqrt_read_at (18) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t18))) (t18_2))) ((sqrt_active (19) (retval) ((sqrt_read_at (19) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t19))) (t19_2))) ((sqrt_active (20) (retval) ((sqrt_read_at (20) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t20))) (t20_2))) ((sqrt_active (21) (retval) ((sqrt_read_at (21) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t21))) (t21_2))) ((sqrt_active (22) (retval) ((sqrt_read_at (22) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t22))) (t22_2))) ((sqrt_active (23) (retval) ((sqrt_read_at (23) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t23))) (t23_2))) ((sqrt_active (24) (retval) ((sqrt_read_at (24) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t24))) (t24_2))) ((sqrt_active (25) (retval) ((sqrt_read_at (25) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t25))) (t25_2))) ((sqrt_active (26) (retval) ((sqrt_read_at (26) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t26))) (t26_2))) ((sqrt_active (27) (retval) ((sqrt_read_at (27) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t27))) (t27_2))) ((sqrt_active (28) (retval) ((sqrt_read_at (28) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t28))) (t28_2))) ((sqrt_active (29) (retval) ((sqrt_read_at (29) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t29))) (t29_2))) ((sqrt_active (30) (retval) ((sqrt_read_at (30) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t30))) (t30_2))) ((sqrt_active (31) (retval) ((sqrt_read_at (31) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t31))) (t31_2)))) = (rvv_pack32 ((sqrt_active (0) (retval) ((sqrt_read_at (0) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t0))) (t0_2))) ((sqrt_active (1) (retval) ((sqrt_read_at (1) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t1))) (t1_2))) ((sqrt_active (2) (retval) ((sqrt_read_at (2) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t2))) (t2_2))) ((sqrt_active (3) (retval) ((sqrt_read_at (3) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t3))) (t3_2))) ((sqrt_active (4) (retval) ((sqrt_read_at (4) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t4))) (t4_2))) ((sqrt_active (5) (retval) ((sqrt_read_at (5) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t5))) (t5_2))) ((sqrt_active (6) (retval) ((sqrt_read_at (6) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t6))) (t6_2))) ((sqrt_active (7) (retval) ((sqrt_read_at (7) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t7))) (t7_2))) ((sqrt_active (8) (retval) ((sqrt_read_at (8) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t8))) (t8_2))) ((sqrt_active (9) (retval) ((sqrt_read_at (9) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t9))) (t9_2))) ((sqrt_active (10) (retval) ((sqrt_read_at (10) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t10))) (t10_2))) ((sqrt_active (11) (retval) ((sqrt_read_at (11) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t11))) (t11_2))) ((sqrt_active (12) (retval) ((sqrt_read_at (12) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t12))) (t12_2))) ((sqrt_active (13) (retval) ((sqrt_read_at (13) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t13))) (t13_2))) ((sqrt_active (14) (retval) ((sqrt_read_at (14) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t14))) (t14_2))) ((sqrt_active (15) (retval) ((sqrt_read_at (15) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t15))) (t15_2))) ((sqrt_active (16) (retval) ((sqrt_read_at (16) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t16))) (t16_2))) ((sqrt_active (17) (retval) ((sqrt_read_at (17) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t17))) (t17_2))) ((sqrt_active (18) (retval) ((sqrt_read_at (18) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t18))) (t18_2))) ((sqrt_active (19) (retval) ((sqrt_read_at (19) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t19))) (t19_2))) ((sqrt_active (20) (retval) ((sqrt_read_at (20) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t20))) (t20_2))) ((sqrt_active (21) (retval) ((sqrt_read_at (21) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t21))) (t21_2))) ((sqrt_active (22) (retval) ((sqrt_read_at (22) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t22))) (t22_2))) ((sqrt_active (23) (retval) ((sqrt_read_at (23) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t23))) (t23_2))) ((sqrt_active (24) (retval) ((sqrt_read_at (24) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t24))) (t24_2))) ((sqrt_active (25) (retval) ((sqrt_read_at (25) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t25))) (t25_2))) ((sqrt_active (26) (retval) ((sqrt_read_at (26) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t26))) (t26_2))) ((sqrt_active (27) (retval) ((sqrt_read_at (27) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t27))) (t27_2))) ((sqrt_active (28) (retval) ((sqrt_read_at (28) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t28))) (t28_2))) ((sqrt_active (29) (retval) ((sqrt_read_at (29) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t29))) (t29_2))) ((sqrt_active (30) (retval) ((sqrt_read_at (30) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t30))) (t30_2))) ((sqrt_active (31) (retval) ((sqrt_read_at (31) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t31))) (t31_2))))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 32) ” 
  &&  “ (retval <= n) ” 
  &&  “ (retval > 0) ” 
  &&  “ (n <= 32) ” 
  &&  “ (retval = n) ” 
  &&  “ (n > 0) ” 
  &&  “ (sizeof(FLOAT) = 4) ” 
  &&  “ ((batch_pre % ( 4 ) ) = 0) ” 
  &&  “ ((batch_pre % ( sizeof(FLOAT) ) ) = 0) ” 
  &&  “ (0 < (batch_pre ÷ 4 )) ” 
  &&  “ ((batch_pre ÷ 4 ) <= 4611686018427387903) ” 
  &&  “ (0 <= n) ” 
  &&  “ (n <= (batch_pre ÷ 4 )) ” 
  &&  “ (input = (input_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT)))) ”
  &&  ((&(( &( "vy" ) )->ₛ "s0")) # Float  |-> (sqrt_active (0) (retval) ((sqrt_read_at (0) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t0))) (t0_2)))
  **  ((&(( &( "vy" ) )->ₛ "s1")) # Float  |-> (sqrt_active (1) (retval) ((sqrt_read_at (1) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t1))) (t1_2)))
  **  ((&(( &( "vy" ) )->ₛ "s2")) # Float  |-> (sqrt_active (2) (retval) ((sqrt_read_at (2) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t2))) (t2_2)))
  **  ((&(( &( "vy" ) )->ₛ "s3")) # Float  |-> (sqrt_active (3) (retval) ((sqrt_read_at (3) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t3))) (t3_2)))
  **  ((&(( &( "vy" ) )->ₛ "s4")) # Float  |-> (sqrt_active (4) (retval) ((sqrt_read_at (4) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t4))) (t4_2)))
  **  ((&(( &( "vy" ) )->ₛ "s5")) # Float  |-> (sqrt_active (5) (retval) ((sqrt_read_at (5) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t5))) (t5_2)))
  **  ((&(( &( "vy" ) )->ₛ "s6")) # Float  |-> (sqrt_active (6) (retval) ((sqrt_read_at (6) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t6))) (t6_2)))
  **  ((&(( &( "vy" ) )->ₛ "s7")) # Float  |-> (sqrt_active (7) (retval) ((sqrt_read_at (7) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t7))) (t7_2)))
  **  ((&(( &( "vy" ) )->ₛ "s8")) # Float  |-> (sqrt_active (8) (retval) ((sqrt_read_at (8) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t8))) (t8_2)))
  **  ((&(( &( "vy" ) )->ₛ "s9")) # Float  |-> (sqrt_active (9) (retval) ((sqrt_read_at (9) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t9))) (t9_2)))
  **  ((&(( &( "vy" ) )->ₛ "s10")) # Float  |-> (sqrt_active (10) (retval) ((sqrt_read_at (10) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t10))) (t10_2)))
  **  ((&(( &( "vy" ) )->ₛ "s11")) # Float  |-> (sqrt_active (11) (retval) ((sqrt_read_at (11) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t11))) (t11_2)))
  **  ((&(( &( "vy" ) )->ₛ "s12")) # Float  |-> (sqrt_active (12) (retval) ((sqrt_read_at (12) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t12))) (t12_2)))
  **  ((&(( &( "vy" ) )->ₛ "s13")) # Float  |-> (sqrt_active (13) (retval) ((sqrt_read_at (13) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t13))) (t13_2)))
  **  ((&(( &( "vy" ) )->ₛ "s14")) # Float  |-> (sqrt_active (14) (retval) ((sqrt_read_at (14) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t14))) (t14_2)))
  **  ((&(( &( "vy" ) )->ₛ "s15")) # Float  |-> (sqrt_active (15) (retval) ((sqrt_read_at (15) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t15))) (t15_2)))
  **  ((&(( &( "vy" ) )->ₛ "s16")) # Float  |-> (sqrt_active (16) (retval) ((sqrt_read_at (16) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t16))) (t16_2)))
  **  ((&(( &( "vy" ) )->ₛ "s17")) # Float  |-> (sqrt_active (17) (retval) ((sqrt_read_at (17) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t17))) (t17_2)))
  **  ((&(( &( "vy" ) )->ₛ "s18")) # Float  |-> (sqrt_active (18) (retval) ((sqrt_read_at (18) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t18))) (t18_2)))
  **  ((&(( &( "vy" ) )->ₛ "s19")) # Float  |-> (sqrt_active (19) (retval) ((sqrt_read_at (19) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t19))) (t19_2)))
  **  ((&(( &( "vy" ) )->ₛ "s20")) # Float  |-> (sqrt_active (20) (retval) ((sqrt_read_at (20) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t20))) (t20_2)))
  **  ((&(( &( "vy" ) )->ₛ "s21")) # Float  |-> (sqrt_active (21) (retval) ((sqrt_read_at (21) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t21))) (t21_2)))
  **  ((&(( &( "vy" ) )->ₛ "s22")) # Float  |-> (sqrt_active (22) (retval) ((sqrt_read_at (22) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t22))) (t22_2)))
  **  ((&(( &( "vy" ) )->ₛ "s23")) # Float  |-> (sqrt_active (23) (retval) ((sqrt_read_at (23) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t23))) (t23_2)))
  **  ((&(( &( "vy" ) )->ₛ "s24")) # Float  |-> (sqrt_active (24) (retval) ((sqrt_read_at (24) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t24))) (t24_2)))
  **  ((&(( &( "vy" ) )->ₛ "s25")) # Float  |-> (sqrt_active (25) (retval) ((sqrt_read_at (25) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t25))) (t25_2)))
  **  ((&(( &( "vy" ) )->ₛ "s26")) # Float  |-> (sqrt_active (26) (retval) ((sqrt_read_at (26) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t26))) (t26_2)))
  **  ((&(( &( "vy" ) )->ₛ "s27")) # Float  |-> (sqrt_active (27) (retval) ((sqrt_read_at (27) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t27))) (t27_2)))
  **  ((&(( &( "vy" ) )->ₛ "s28")) # Float  |-> (sqrt_active (28) (retval) ((sqrt_read_at (28) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t28))) (t28_2)))
  **  ((&(( &( "vy" ) )->ₛ "s29")) # Float  |-> (sqrt_active (29) (retval) ((sqrt_read_at (29) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t29))) (t29_2)))
  **  ((&(( &( "vy" ) )->ₛ "s30")) # Float  |-> (sqrt_active (30) (retval) ((sqrt_read_at (30) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t30))) (t30_2)))
  **  ((&(( &( "vy" ) )->ₛ "s31")) # Float  |-> (sqrt_active (31) (retval) ((sqrt_read_at (31) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t31))) (t31_2)))
  **  (FloatArray.undef_full output retval )
  **  (FloatArray.undef_full (output + (retval * sizeof(FLOAT))) (((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - n ) ) - retval ) )
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - n ) (sqrt_rvv_values (((batch_pre ÷ 4 ) - n )) (A)) )
  **  ((&(( &( "vx" ) )->ₛ "s0")) # Float  |-> (sqrt_read_at (0) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t0)))
  **  ((&(( &( "vx" ) )->ₛ "s1")) # Float  |-> (sqrt_read_at (1) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t1)))
  **  ((&(( &( "vx" ) )->ₛ "s2")) # Float  |-> (sqrt_read_at (2) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t2)))
  **  ((&(( &( "vx" ) )->ₛ "s3")) # Float  |-> (sqrt_read_at (3) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t3)))
  **  ((&(( &( "vx" ) )->ₛ "s4")) # Float  |-> (sqrt_read_at (4) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t4)))
  **  ((&(( &( "vx" ) )->ₛ "s5")) # Float  |-> (sqrt_read_at (5) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t5)))
  **  ((&(( &( "vx" ) )->ₛ "s6")) # Float  |-> (sqrt_read_at (6) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t6)))
  **  ((&(( &( "vx" ) )->ₛ "s7")) # Float  |-> (sqrt_read_at (7) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t7)))
  **  ((&(( &( "vx" ) )->ₛ "s8")) # Float  |-> (sqrt_read_at (8) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t8)))
  **  ((&(( &( "vx" ) )->ₛ "s9")) # Float  |-> (sqrt_read_at (9) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t9)))
  **  ((&(( &( "vx" ) )->ₛ "s10")) # Float  |-> (sqrt_read_at (10) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t10)))
  **  ((&(( &( "vx" ) )->ₛ "s11")) # Float  |-> (sqrt_read_at (11) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t11)))
  **  ((&(( &( "vx" ) )->ₛ "s12")) # Float  |-> (sqrt_read_at (12) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t12)))
  **  ((&(( &( "vx" ) )->ₛ "s13")) # Float  |-> (sqrt_read_at (13) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t13)))
  **  ((&(( &( "vx" ) )->ₛ "s14")) # Float  |-> (sqrt_read_at (14) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t14)))
  **  ((&(( &( "vx" ) )->ₛ "s15")) # Float  |-> (sqrt_read_at (15) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t15)))
  **  ((&(( &( "vx" ) )->ₛ "s16")) # Float  |-> (sqrt_read_at (16) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t16)))
  **  ((&(( &( "vx" ) )->ₛ "s17")) # Float  |-> (sqrt_read_at (17) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t17)))
  **  ((&(( &( "vx" ) )->ₛ "s18")) # Float  |-> (sqrt_read_at (18) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t18)))
  **  ((&(( &( "vx" ) )->ₛ "s19")) # Float  |-> (sqrt_read_at (19) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t19)))
  **  ((&(( &( "vx" ) )->ₛ "s20")) # Float  |-> (sqrt_read_at (20) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t20)))
  **  ((&(( &( "vx" ) )->ₛ "s21")) # Float  |-> (sqrt_read_at (21) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t21)))
  **  ((&(( &( "vx" ) )->ₛ "s22")) # Float  |-> (sqrt_read_at (22) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t22)))
  **  ((&(( &( "vx" ) )->ₛ "s23")) # Float  |-> (sqrt_read_at (23) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t23)))
  **  ((&(( &( "vx" ) )->ₛ "s24")) # Float  |-> (sqrt_read_at (24) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t24)))
  **  ((&(( &( "vx" ) )->ₛ "s25")) # Float  |-> (sqrt_read_at (25) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t25)))
  **  ((&(( &( "vx" ) )->ₛ "s26")) # Float  |-> (sqrt_read_at (26) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t26)))
  **  ((&(( &( "vx" ) )->ₛ "s27")) # Float  |-> (sqrt_read_at (27) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t27)))
  **  ((&(( &( "vx" ) )->ₛ "s28")) # Float  |-> (sqrt_read_at (28) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t28)))
  **  ((&(( &( "vx" ) )->ₛ "s29")) # Float  |-> (sqrt_read_at (29) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t29)))
  **  ((&(( &( "vx" ) )->ₛ "s30")) # Float  |-> (sqrt_read_at (30) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t30)))
  **  ((&(( &( "vx" ) )->ₛ "s31")) # Float  |-> (sqrt_read_at (31) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t31)))
.

Definition test_rvv_partial_solve_wit_18 := test_rvv_partial_solve_wit_18_pure -> test_rvv_partial_solve_wit_18_aux.

Definition test_rvv_partial_solve_wit_19_pure := 
forall (unused_params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (output: Z) (input: Z) (n: Z) (retval: Z) (t31: fp32) (t30: fp32) (t29: fp32) (t28: fp32) (t27: fp32) (t26: fp32) (t25: fp32) (t24: fp32) (t23: fp32) (t22: fp32) (t21: fp32) (t20: fp32) (t19: fp32) (t18: fp32) (t17: fp32) (t16: fp32) (t15: fp32) (t14: fp32) (t13: fp32) (t12: fp32) (t11: fp32) (t10: fp32) (t9: fp32) (t8: fp32) (t7: fp32) (t6: fp32) (t5: fp32) (t4: fp32) (t3: fp32) (t2: fp32) (t1: fp32) (t0: fp32) (t31_2: fp32) (t30_2: fp32) (t29_2: fp32) (t28_2: fp32) (t27_2: fp32) (t26_2: fp32) (t25_2: fp32) (t24_2: fp32) (t23_2: fp32) (t22_2: fp32) (t21_2: fp32) (t20_2: fp32) (t19_2: fp32) (t18_2: fp32) (t17_2: fp32) (t16_2: fp32) (t15_2: fp32) (t14_2: fp32) (t13_2: fp32) (t12_2: fp32) (t11_2: fp32) (t10_2: fp32) (t9_2: fp32) (t8_2: fp32) (t7_2: fp32) (t6_2: fp32) (t5_2: fp32) (t4_2: fp32) (t3_2: fp32) (t2_2: fp32) (t1_2: fp32) (t0_2: fp32) (PreH1 : (0 <= retval)) (PreH2 : (retval <= 32)) (PreH3 : (retval <= n)) (PreH4 : (retval > 0)) (PreH5 : (32 < n)) (PreH6 : (n < 64)) (PreH7 : (((n + 1 ) ÷ 2 ) <= retval)) (PreH8 : (n > 0)) (PreH9 : (sizeof(FLOAT) = 4)) (PreH10 : ((batch_pre % ( 4 ) ) = 0)) (PreH11 : ((batch_pre % ( sizeof(FLOAT) ) ) = 0)) (PreH12 : (0 < (batch_pre ÷ 4 ))) (PreH13 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH14 : (0 <= n)) (PreH15 : (n <= (batch_pre ÷ 4 ))) (PreH16 : (input = (input_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) (PreH17 : (output = (output_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) ,
  ((&(( &( "vy" ) )->ₛ "s31")) # Float  |-> (sqrt_active (31) (retval) ((sqrt_read_at (31) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t31))) (t31_2)))
  **  ((&(( &( "vy" ) )->ₛ "s30")) # Float  |-> (sqrt_active (30) (retval) ((sqrt_read_at (30) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t30))) (t30_2)))
  **  ((&(( &( "vy" ) )->ₛ "s29")) # Float  |-> (sqrt_active (29) (retval) ((sqrt_read_at (29) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t29))) (t29_2)))
  **  ((&(( &( "vy" ) )->ₛ "s28")) # Float  |-> (sqrt_active (28) (retval) ((sqrt_read_at (28) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t28))) (t28_2)))
  **  ((&(( &( "vy" ) )->ₛ "s27")) # Float  |-> (sqrt_active (27) (retval) ((sqrt_read_at (27) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t27))) (t27_2)))
  **  ((&(( &( "vy" ) )->ₛ "s26")) # Float  |-> (sqrt_active (26) (retval) ((sqrt_read_at (26) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t26))) (t26_2)))
  **  ((&(( &( "vy" ) )->ₛ "s25")) # Float  |-> (sqrt_active (25) (retval) ((sqrt_read_at (25) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t25))) (t25_2)))
  **  ((&(( &( "vy" ) )->ₛ "s24")) # Float  |-> (sqrt_active (24) (retval) ((sqrt_read_at (24) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t24))) (t24_2)))
  **  ((&(( &( "vy" ) )->ₛ "s23")) # Float  |-> (sqrt_active (23) (retval) ((sqrt_read_at (23) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t23))) (t23_2)))
  **  ((&(( &( "vy" ) )->ₛ "s22")) # Float  |-> (sqrt_active (22) (retval) ((sqrt_read_at (22) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t22))) (t22_2)))
  **  ((&(( &( "vy" ) )->ₛ "s21")) # Float  |-> (sqrt_active (21) (retval) ((sqrt_read_at (21) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t21))) (t21_2)))
  **  ((&(( &( "vy" ) )->ₛ "s20")) # Float  |-> (sqrt_active (20) (retval) ((sqrt_read_at (20) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t20))) (t20_2)))
  **  ((&(( &( "vy" ) )->ₛ "s19")) # Float  |-> (sqrt_active (19) (retval) ((sqrt_read_at (19) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t19))) (t19_2)))
  **  ((&(( &( "vy" ) )->ₛ "s18")) # Float  |-> (sqrt_active (18) (retval) ((sqrt_read_at (18) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t18))) (t18_2)))
  **  ((&(( &( "vy" ) )->ₛ "s17")) # Float  |-> (sqrt_active (17) (retval) ((sqrt_read_at (17) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t17))) (t17_2)))
  **  ((&(( &( "vy" ) )->ₛ "s16")) # Float  |-> (sqrt_active (16) (retval) ((sqrt_read_at (16) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t16))) (t16_2)))
  **  ((&(( &( "vy" ) )->ₛ "s15")) # Float  |-> (sqrt_active (15) (retval) ((sqrt_read_at (15) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t15))) (t15_2)))
  **  ((&(( &( "vy" ) )->ₛ "s14")) # Float  |-> (sqrt_active (14) (retval) ((sqrt_read_at (14) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t14))) (t14_2)))
  **  ((&(( &( "vy" ) )->ₛ "s13")) # Float  |-> (sqrt_active (13) (retval) ((sqrt_read_at (13) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t13))) (t13_2)))
  **  ((&(( &( "vy" ) )->ₛ "s12")) # Float  |-> (sqrt_active (12) (retval) ((sqrt_read_at (12) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t12))) (t12_2)))
  **  ((&(( &( "vy" ) )->ₛ "s11")) # Float  |-> (sqrt_active (11) (retval) ((sqrt_read_at (11) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t11))) (t11_2)))
  **  ((&(( &( "vy" ) )->ₛ "s10")) # Float  |-> (sqrt_active (10) (retval) ((sqrt_read_at (10) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t10))) (t10_2)))
  **  ((&(( &( "vy" ) )->ₛ "s9")) # Float  |-> (sqrt_active (9) (retval) ((sqrt_read_at (9) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t9))) (t9_2)))
  **  ((&(( &( "vy" ) )->ₛ "s8")) # Float  |-> (sqrt_active (8) (retval) ((sqrt_read_at (8) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t8))) (t8_2)))
  **  ((&(( &( "vy" ) )->ₛ "s7")) # Float  |-> (sqrt_active (7) (retval) ((sqrt_read_at (7) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t7))) (t7_2)))
  **  ((&(( &( "vy" ) )->ₛ "s6")) # Float  |-> (sqrt_active (6) (retval) ((sqrt_read_at (6) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t6))) (t6_2)))
  **  ((&(( &( "vy" ) )->ₛ "s5")) # Float  |-> (sqrt_active (5) (retval) ((sqrt_read_at (5) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t5))) (t5_2)))
  **  ((&(( &( "vy" ) )->ₛ "s4")) # Float  |-> (sqrt_active (4) (retval) ((sqrt_read_at (4) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t4))) (t4_2)))
  **  ((&(( &( "vy" ) )->ₛ "s3")) # Float  |-> (sqrt_active (3) (retval) ((sqrt_read_at (3) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t3))) (t3_2)))
  **  ((&(( &( "vy" ) )->ₛ "s2")) # Float  |-> (sqrt_active (2) (retval) ((sqrt_read_at (2) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t2))) (t2_2)))
  **  ((&(( &( "vy" ) )->ₛ "s1")) # Float  |-> (sqrt_active (1) (retval) ((sqrt_read_at (1) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t1))) (t1_2)))
  **  ((&(( &( "vy" ) )->ₛ "s0")) # Float  |-> (sqrt_active (0) (retval) ((sqrt_read_at (0) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t0))) (t0_2)))
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  ((( &( "vl" ) )) # UInt64  |-> retval)
  **  ((( &( "unused_params" ) )) # Ptr  |-> unused_params_pre)
  **  ((( &( "batch" ) )) # UInt64  |-> batch_pre)
  **  ((( &( "n" ) )) # UInt64  |-> n)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - n ) (sqrt_rvv_values (((batch_pre ÷ 4 ) - n )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - n ) ) )
  **  ((&(( &( "vx" ) )->ₛ "s0")) # Float  |-> (sqrt_read_at (0) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t0)))
  **  ((&(( &( "vx" ) )->ₛ "s1")) # Float  |-> (sqrt_read_at (1) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t1)))
  **  ((&(( &( "vx" ) )->ₛ "s2")) # Float  |-> (sqrt_read_at (2) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t2)))
  **  ((&(( &( "vx" ) )->ₛ "s3")) # Float  |-> (sqrt_read_at (3) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t3)))
  **  ((&(( &( "vx" ) )->ₛ "s4")) # Float  |-> (sqrt_read_at (4) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t4)))
  **  ((&(( &( "vx" ) )->ₛ "s5")) # Float  |-> (sqrt_read_at (5) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t5)))
  **  ((&(( &( "vx" ) )->ₛ "s6")) # Float  |-> (sqrt_read_at (6) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t6)))
  **  ((&(( &( "vx" ) )->ₛ "s7")) # Float  |-> (sqrt_read_at (7) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t7)))
  **  ((&(( &( "vx" ) )->ₛ "s8")) # Float  |-> (sqrt_read_at (8) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t8)))
  **  ((&(( &( "vx" ) )->ₛ "s9")) # Float  |-> (sqrt_read_at (9) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t9)))
  **  ((&(( &( "vx" ) )->ₛ "s10")) # Float  |-> (sqrt_read_at (10) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t10)))
  **  ((&(( &( "vx" ) )->ₛ "s11")) # Float  |-> (sqrt_read_at (11) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t11)))
  **  ((&(( &( "vx" ) )->ₛ "s12")) # Float  |-> (sqrt_read_at (12) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t12)))
  **  ((&(( &( "vx" ) )->ₛ "s13")) # Float  |-> (sqrt_read_at (13) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t13)))
  **  ((&(( &( "vx" ) )->ₛ "s14")) # Float  |-> (sqrt_read_at (14) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t14)))
  **  ((&(( &( "vx" ) )->ₛ "s15")) # Float  |-> (sqrt_read_at (15) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t15)))
  **  ((&(( &( "vx" ) )->ₛ "s16")) # Float  |-> (sqrt_read_at (16) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t16)))
  **  ((&(( &( "vx" ) )->ₛ "s17")) # Float  |-> (sqrt_read_at (17) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t17)))
  **  ((&(( &( "vx" ) )->ₛ "s18")) # Float  |-> (sqrt_read_at (18) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t18)))
  **  ((&(( &( "vx" ) )->ₛ "s19")) # Float  |-> (sqrt_read_at (19) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t19)))
  **  ((&(( &( "vx" ) )->ₛ "s20")) # Float  |-> (sqrt_read_at (20) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t20)))
  **  ((&(( &( "vx" ) )->ₛ "s21")) # Float  |-> (sqrt_read_at (21) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t21)))
  **  ((&(( &( "vx" ) )->ₛ "s22")) # Float  |-> (sqrt_read_at (22) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t22)))
  **  ((&(( &( "vx" ) )->ₛ "s23")) # Float  |-> (sqrt_read_at (23) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t23)))
  **  ((&(( &( "vx" ) )->ₛ "s24")) # Float  |-> (sqrt_read_at (24) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t24)))
  **  ((&(( &( "vx" ) )->ₛ "s25")) # Float  |-> (sqrt_read_at (25) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t25)))
  **  ((&(( &( "vx" ) )->ₛ "s26")) # Float  |-> (sqrt_read_at (26) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t26)))
  **  ((&(( &( "vx" ) )->ₛ "s27")) # Float  |-> (sqrt_read_at (27) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t27)))
  **  ((&(( &( "vx" ) )->ₛ "s28")) # Float  |-> (sqrt_read_at (28) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t28)))
  **  ((&(( &( "vx" ) )->ₛ "s29")) # Float  |-> (sqrt_read_at (29) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t29)))
  **  ((&(( &( "vx" ) )->ₛ "s30")) # Float  |-> (sqrt_read_at (30) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t30)))
  **  ((&(( &( "vx" ) )->ₛ "s31")) # Float  |-> (sqrt_read_at (31) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t31)))
|--
  “ (0 <= retval) ” 
  &&  “ (retval <= 32) ” 
  &&  “ ((rvv_pack32 ((sqrt_active (0) (retval) ((sqrt_read_at (0) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t0))) (t0_2))) ((sqrt_active (1) (retval) ((sqrt_read_at (1) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t1))) (t1_2))) ((sqrt_active (2) (retval) ((sqrt_read_at (2) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t2))) (t2_2))) ((sqrt_active (3) (retval) ((sqrt_read_at (3) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t3))) (t3_2))) ((sqrt_active (4) (retval) ((sqrt_read_at (4) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t4))) (t4_2))) ((sqrt_active (5) (retval) ((sqrt_read_at (5) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t5))) (t5_2))) ((sqrt_active (6) (retval) ((sqrt_read_at (6) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t6))) (t6_2))) ((sqrt_active (7) (retval) ((sqrt_read_at (7) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t7))) (t7_2))) ((sqrt_active (8) (retval) ((sqrt_read_at (8) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t8))) (t8_2))) ((sqrt_active (9) (retval) ((sqrt_read_at (9) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t9))) (t9_2))) ((sqrt_active (10) (retval) ((sqrt_read_at (10) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t10))) (t10_2))) ((sqrt_active (11) (retval) ((sqrt_read_at (11) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t11))) (t11_2))) ((sqrt_active (12) (retval) ((sqrt_read_at (12) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t12))) (t12_2))) ((sqrt_active (13) (retval) ((sqrt_read_at (13) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t13))) (t13_2))) ((sqrt_active (14) (retval) ((sqrt_read_at (14) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t14))) (t14_2))) ((sqrt_active (15) (retval) ((sqrt_read_at (15) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t15))) (t15_2))) ((sqrt_active (16) (retval) ((sqrt_read_at (16) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t16))) (t16_2))) ((sqrt_active (17) (retval) ((sqrt_read_at (17) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t17))) (t17_2))) ((sqrt_active (18) (retval) ((sqrt_read_at (18) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t18))) (t18_2))) ((sqrt_active (19) (retval) ((sqrt_read_at (19) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t19))) (t19_2))) ((sqrt_active (20) (retval) ((sqrt_read_at (20) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t20))) (t20_2))) ((sqrt_active (21) (retval) ((sqrt_read_at (21) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t21))) (t21_2))) ((sqrt_active (22) (retval) ((sqrt_read_at (22) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t22))) (t22_2))) ((sqrt_active (23) (retval) ((sqrt_read_at (23) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t23))) (t23_2))) ((sqrt_active (24) (retval) ((sqrt_read_at (24) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t24))) (t24_2))) ((sqrt_active (25) (retval) ((sqrt_read_at (25) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t25))) (t25_2))) ((sqrt_active (26) (retval) ((sqrt_read_at (26) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t26))) (t26_2))) ((sqrt_active (27) (retval) ((sqrt_read_at (27) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t27))) (t27_2))) ((sqrt_active (28) (retval) ((sqrt_read_at (28) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t28))) (t28_2))) ((sqrt_active (29) (retval) ((sqrt_read_at (29) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t29))) (t29_2))) ((sqrt_active (30) (retval) ((sqrt_read_at (30) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t30))) (t30_2))) ((sqrt_active (31) (retval) ((sqrt_read_at (31) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t31))) (t31_2)))) = (rvv_pack32 ((sqrt_active (0) (retval) ((sqrt_read_at (0) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t0))) (t0_2))) ((sqrt_active (1) (retval) ((sqrt_read_at (1) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t1))) (t1_2))) ((sqrt_active (2) (retval) ((sqrt_read_at (2) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t2))) (t2_2))) ((sqrt_active (3) (retval) ((sqrt_read_at (3) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t3))) (t3_2))) ((sqrt_active (4) (retval) ((sqrt_read_at (4) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t4))) (t4_2))) ((sqrt_active (5) (retval) ((sqrt_read_at (5) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t5))) (t5_2))) ((sqrt_active (6) (retval) ((sqrt_read_at (6) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t6))) (t6_2))) ((sqrt_active (7) (retval) ((sqrt_read_at (7) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t7))) (t7_2))) ((sqrt_active (8) (retval) ((sqrt_read_at (8) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t8))) (t8_2))) ((sqrt_active (9) (retval) ((sqrt_read_at (9) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t9))) (t9_2))) ((sqrt_active (10) (retval) ((sqrt_read_at (10) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t10))) (t10_2))) ((sqrt_active (11) (retval) ((sqrt_read_at (11) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t11))) (t11_2))) ((sqrt_active (12) (retval) ((sqrt_read_at (12) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t12))) (t12_2))) ((sqrt_active (13) (retval) ((sqrt_read_at (13) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t13))) (t13_2))) ((sqrt_active (14) (retval) ((sqrt_read_at (14) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t14))) (t14_2))) ((sqrt_active (15) (retval) ((sqrt_read_at (15) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t15))) (t15_2))) ((sqrt_active (16) (retval) ((sqrt_read_at (16) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t16))) (t16_2))) ((sqrt_active (17) (retval) ((sqrt_read_at (17) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t17))) (t17_2))) ((sqrt_active (18) (retval) ((sqrt_read_at (18) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t18))) (t18_2))) ((sqrt_active (19) (retval) ((sqrt_read_at (19) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t19))) (t19_2))) ((sqrt_active (20) (retval) ((sqrt_read_at (20) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t20))) (t20_2))) ((sqrt_active (21) (retval) ((sqrt_read_at (21) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t21))) (t21_2))) ((sqrt_active (22) (retval) ((sqrt_read_at (22) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t22))) (t22_2))) ((sqrt_active (23) (retval) ((sqrt_read_at (23) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t23))) (t23_2))) ((sqrt_active (24) (retval) ((sqrt_read_at (24) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t24))) (t24_2))) ((sqrt_active (25) (retval) ((sqrt_read_at (25) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t25))) (t25_2))) ((sqrt_active (26) (retval) ((sqrt_read_at (26) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t26))) (t26_2))) ((sqrt_active (27) (retval) ((sqrt_read_at (27) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t27))) (t27_2))) ((sqrt_active (28) (retval) ((sqrt_read_at (28) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t28))) (t28_2))) ((sqrt_active (29) (retval) ((sqrt_read_at (29) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t29))) (t29_2))) ((sqrt_active (30) (retval) ((sqrt_read_at (30) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t30))) (t30_2))) ((sqrt_active (31) (retval) ((sqrt_read_at (31) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t31))) (t31_2))))) ”
.

Definition test_rvv_partial_solve_wit_19_aux := 
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (output: Z) (input: Z) (n: Z) (retval: Z) (t31: fp32) (t30: fp32) (t29: fp32) (t28: fp32) (t27: fp32) (t26: fp32) (t25: fp32) (t24: fp32) (t23: fp32) (t22: fp32) (t21: fp32) (t20: fp32) (t19: fp32) (t18: fp32) (t17: fp32) (t16: fp32) (t15: fp32) (t14: fp32) (t13: fp32) (t12: fp32) (t11: fp32) (t10: fp32) (t9: fp32) (t8: fp32) (t7: fp32) (t6: fp32) (t5: fp32) (t4: fp32) (t3: fp32) (t2: fp32) (t1: fp32) (t0: fp32) (t31_2: fp32) (t30_2: fp32) (t29_2: fp32) (t28_2: fp32) (t27_2: fp32) (t26_2: fp32) (t25_2: fp32) (t24_2: fp32) (t23_2: fp32) (t22_2: fp32) (t21_2: fp32) (t20_2: fp32) (t19_2: fp32) (t18_2: fp32) (t17_2: fp32) (t16_2: fp32) (t15_2: fp32) (t14_2: fp32) (t13_2: fp32) (t12_2: fp32) (t11_2: fp32) (t10_2: fp32) (t9_2: fp32) (t8_2: fp32) (t7_2: fp32) (t6_2: fp32) (t5_2: fp32) (t4_2: fp32) (t3_2: fp32) (t2_2: fp32) (t1_2: fp32) (t0_2: fp32) (PreH1 : (0 <= retval)) (PreH2 : (retval <= 32)) (PreH3 : (retval <= n)) (PreH4 : (retval > 0)) (PreH5 : (32 < n)) (PreH6 : (n < 64)) (PreH7 : (((n + 1 ) ÷ 2 ) <= retval)) (PreH8 : (n > 0)) (PreH9 : (sizeof(FLOAT) = 4)) (PreH10 : ((batch_pre % ( 4 ) ) = 0)) (PreH11 : ((batch_pre % ( sizeof(FLOAT) ) ) = 0)) (PreH12 : (0 < (batch_pre ÷ 4 ))) (PreH13 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH14 : (0 <= n)) (PreH15 : (n <= (batch_pre ÷ 4 ))) (PreH16 : (input = (input_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) (PreH17 : (output = (output_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) ,
  ((&(( &( "vy" ) )->ₛ "s31")) # Float  |-> (sqrt_active (31) (retval) ((sqrt_read_at (31) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t31))) (t31_2)))
  **  ((&(( &( "vy" ) )->ₛ "s30")) # Float  |-> (sqrt_active (30) (retval) ((sqrt_read_at (30) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t30))) (t30_2)))
  **  ((&(( &( "vy" ) )->ₛ "s29")) # Float  |-> (sqrt_active (29) (retval) ((sqrt_read_at (29) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t29))) (t29_2)))
  **  ((&(( &( "vy" ) )->ₛ "s28")) # Float  |-> (sqrt_active (28) (retval) ((sqrt_read_at (28) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t28))) (t28_2)))
  **  ((&(( &( "vy" ) )->ₛ "s27")) # Float  |-> (sqrt_active (27) (retval) ((sqrt_read_at (27) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t27))) (t27_2)))
  **  ((&(( &( "vy" ) )->ₛ "s26")) # Float  |-> (sqrt_active (26) (retval) ((sqrt_read_at (26) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t26))) (t26_2)))
  **  ((&(( &( "vy" ) )->ₛ "s25")) # Float  |-> (sqrt_active (25) (retval) ((sqrt_read_at (25) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t25))) (t25_2)))
  **  ((&(( &( "vy" ) )->ₛ "s24")) # Float  |-> (sqrt_active (24) (retval) ((sqrt_read_at (24) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t24))) (t24_2)))
  **  ((&(( &( "vy" ) )->ₛ "s23")) # Float  |-> (sqrt_active (23) (retval) ((sqrt_read_at (23) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t23))) (t23_2)))
  **  ((&(( &( "vy" ) )->ₛ "s22")) # Float  |-> (sqrt_active (22) (retval) ((sqrt_read_at (22) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t22))) (t22_2)))
  **  ((&(( &( "vy" ) )->ₛ "s21")) # Float  |-> (sqrt_active (21) (retval) ((sqrt_read_at (21) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t21))) (t21_2)))
  **  ((&(( &( "vy" ) )->ₛ "s20")) # Float  |-> (sqrt_active (20) (retval) ((sqrt_read_at (20) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t20))) (t20_2)))
  **  ((&(( &( "vy" ) )->ₛ "s19")) # Float  |-> (sqrt_active (19) (retval) ((sqrt_read_at (19) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t19))) (t19_2)))
  **  ((&(( &( "vy" ) )->ₛ "s18")) # Float  |-> (sqrt_active (18) (retval) ((sqrt_read_at (18) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t18))) (t18_2)))
  **  ((&(( &( "vy" ) )->ₛ "s17")) # Float  |-> (sqrt_active (17) (retval) ((sqrt_read_at (17) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t17))) (t17_2)))
  **  ((&(( &( "vy" ) )->ₛ "s16")) # Float  |-> (sqrt_active (16) (retval) ((sqrt_read_at (16) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t16))) (t16_2)))
  **  ((&(( &( "vy" ) )->ₛ "s15")) # Float  |-> (sqrt_active (15) (retval) ((sqrt_read_at (15) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t15))) (t15_2)))
  **  ((&(( &( "vy" ) )->ₛ "s14")) # Float  |-> (sqrt_active (14) (retval) ((sqrt_read_at (14) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t14))) (t14_2)))
  **  ((&(( &( "vy" ) )->ₛ "s13")) # Float  |-> (sqrt_active (13) (retval) ((sqrt_read_at (13) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t13))) (t13_2)))
  **  ((&(( &( "vy" ) )->ₛ "s12")) # Float  |-> (sqrt_active (12) (retval) ((sqrt_read_at (12) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t12))) (t12_2)))
  **  ((&(( &( "vy" ) )->ₛ "s11")) # Float  |-> (sqrt_active (11) (retval) ((sqrt_read_at (11) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t11))) (t11_2)))
  **  ((&(( &( "vy" ) )->ₛ "s10")) # Float  |-> (sqrt_active (10) (retval) ((sqrt_read_at (10) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t10))) (t10_2)))
  **  ((&(( &( "vy" ) )->ₛ "s9")) # Float  |-> (sqrt_active (9) (retval) ((sqrt_read_at (9) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t9))) (t9_2)))
  **  ((&(( &( "vy" ) )->ₛ "s8")) # Float  |-> (sqrt_active (8) (retval) ((sqrt_read_at (8) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t8))) (t8_2)))
  **  ((&(( &( "vy" ) )->ₛ "s7")) # Float  |-> (sqrt_active (7) (retval) ((sqrt_read_at (7) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t7))) (t7_2)))
  **  ((&(( &( "vy" ) )->ₛ "s6")) # Float  |-> (sqrt_active (6) (retval) ((sqrt_read_at (6) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t6))) (t6_2)))
  **  ((&(( &( "vy" ) )->ₛ "s5")) # Float  |-> (sqrt_active (5) (retval) ((sqrt_read_at (5) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t5))) (t5_2)))
  **  ((&(( &( "vy" ) )->ₛ "s4")) # Float  |-> (sqrt_active (4) (retval) ((sqrt_read_at (4) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t4))) (t4_2)))
  **  ((&(( &( "vy" ) )->ₛ "s3")) # Float  |-> (sqrt_active (3) (retval) ((sqrt_read_at (3) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t3))) (t3_2)))
  **  ((&(( &( "vy" ) )->ₛ "s2")) # Float  |-> (sqrt_active (2) (retval) ((sqrt_read_at (2) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t2))) (t2_2)))
  **  ((&(( &( "vy" ) )->ₛ "s1")) # Float  |-> (sqrt_active (1) (retval) ((sqrt_read_at (1) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t1))) (t1_2)))
  **  ((&(( &( "vy" ) )->ₛ "s0")) # Float  |-> (sqrt_active (0) (retval) ((sqrt_read_at (0) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t0))) (t0_2)))
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - n ) (sqrt_rvv_values (((batch_pre ÷ 4 ) - n )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - n ) ) )
  **  ((&(( &( "vx" ) )->ₛ "s0")) # Float  |-> (sqrt_read_at (0) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t0)))
  **  ((&(( &( "vx" ) )->ₛ "s1")) # Float  |-> (sqrt_read_at (1) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t1)))
  **  ((&(( &( "vx" ) )->ₛ "s2")) # Float  |-> (sqrt_read_at (2) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t2)))
  **  ((&(( &( "vx" ) )->ₛ "s3")) # Float  |-> (sqrt_read_at (3) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t3)))
  **  ((&(( &( "vx" ) )->ₛ "s4")) # Float  |-> (sqrt_read_at (4) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t4)))
  **  ((&(( &( "vx" ) )->ₛ "s5")) # Float  |-> (sqrt_read_at (5) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t5)))
  **  ((&(( &( "vx" ) )->ₛ "s6")) # Float  |-> (sqrt_read_at (6) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t6)))
  **  ((&(( &( "vx" ) )->ₛ "s7")) # Float  |-> (sqrt_read_at (7) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t7)))
  **  ((&(( &( "vx" ) )->ₛ "s8")) # Float  |-> (sqrt_read_at (8) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t8)))
  **  ((&(( &( "vx" ) )->ₛ "s9")) # Float  |-> (sqrt_read_at (9) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t9)))
  **  ((&(( &( "vx" ) )->ₛ "s10")) # Float  |-> (sqrt_read_at (10) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t10)))
  **  ((&(( &( "vx" ) )->ₛ "s11")) # Float  |-> (sqrt_read_at (11) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t11)))
  **  ((&(( &( "vx" ) )->ₛ "s12")) # Float  |-> (sqrt_read_at (12) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t12)))
  **  ((&(( &( "vx" ) )->ₛ "s13")) # Float  |-> (sqrt_read_at (13) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t13)))
  **  ((&(( &( "vx" ) )->ₛ "s14")) # Float  |-> (sqrt_read_at (14) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t14)))
  **  ((&(( &( "vx" ) )->ₛ "s15")) # Float  |-> (sqrt_read_at (15) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t15)))
  **  ((&(( &( "vx" ) )->ₛ "s16")) # Float  |-> (sqrt_read_at (16) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t16)))
  **  ((&(( &( "vx" ) )->ₛ "s17")) # Float  |-> (sqrt_read_at (17) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t17)))
  **  ((&(( &( "vx" ) )->ₛ "s18")) # Float  |-> (sqrt_read_at (18) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t18)))
  **  ((&(( &( "vx" ) )->ₛ "s19")) # Float  |-> (sqrt_read_at (19) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t19)))
  **  ((&(( &( "vx" ) )->ₛ "s20")) # Float  |-> (sqrt_read_at (20) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t20)))
  **  ((&(( &( "vx" ) )->ₛ "s21")) # Float  |-> (sqrt_read_at (21) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t21)))
  **  ((&(( &( "vx" ) )->ₛ "s22")) # Float  |-> (sqrt_read_at (22) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t22)))
  **  ((&(( &( "vx" ) )->ₛ "s23")) # Float  |-> (sqrt_read_at (23) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t23)))
  **  ((&(( &( "vx" ) )->ₛ "s24")) # Float  |-> (sqrt_read_at (24) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t24)))
  **  ((&(( &( "vx" ) )->ₛ "s25")) # Float  |-> (sqrt_read_at (25) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t25)))
  **  ((&(( &( "vx" ) )->ₛ "s26")) # Float  |-> (sqrt_read_at (26) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t26)))
  **  ((&(( &( "vx" ) )->ₛ "s27")) # Float  |-> (sqrt_read_at (27) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t27)))
  **  ((&(( &( "vx" ) )->ₛ "s28")) # Float  |-> (sqrt_read_at (28) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t28)))
  **  ((&(( &( "vx" ) )->ₛ "s29")) # Float  |-> (sqrt_read_at (29) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t29)))
  **  ((&(( &( "vx" ) )->ₛ "s30")) # Float  |-> (sqrt_read_at (30) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t30)))
  **  ((&(( &( "vx" ) )->ₛ "s31")) # Float  |-> (sqrt_read_at (31) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t31)))
|--
  “ (0 <= retval) ” 
  &&  “ (retval <= 32) ” 
  &&  “ ((rvv_pack32 ((sqrt_active (0) (retval) ((sqrt_read_at (0) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t0))) (t0_2))) ((sqrt_active (1) (retval) ((sqrt_read_at (1) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t1))) (t1_2))) ((sqrt_active (2) (retval) ((sqrt_read_at (2) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t2))) (t2_2))) ((sqrt_active (3) (retval) ((sqrt_read_at (3) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t3))) (t3_2))) ((sqrt_active (4) (retval) ((sqrt_read_at (4) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t4))) (t4_2))) ((sqrt_active (5) (retval) ((sqrt_read_at (5) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t5))) (t5_2))) ((sqrt_active (6) (retval) ((sqrt_read_at (6) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t6))) (t6_2))) ((sqrt_active (7) (retval) ((sqrt_read_at (7) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t7))) (t7_2))) ((sqrt_active (8) (retval) ((sqrt_read_at (8) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t8))) (t8_2))) ((sqrt_active (9) (retval) ((sqrt_read_at (9) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t9))) (t9_2))) ((sqrt_active (10) (retval) ((sqrt_read_at (10) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t10))) (t10_2))) ((sqrt_active (11) (retval) ((sqrt_read_at (11) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t11))) (t11_2))) ((sqrt_active (12) (retval) ((sqrt_read_at (12) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t12))) (t12_2))) ((sqrt_active (13) (retval) ((sqrt_read_at (13) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t13))) (t13_2))) ((sqrt_active (14) (retval) ((sqrt_read_at (14) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t14))) (t14_2))) ((sqrt_active (15) (retval) ((sqrt_read_at (15) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t15))) (t15_2))) ((sqrt_active (16) (retval) ((sqrt_read_at (16) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t16))) (t16_2))) ((sqrt_active (17) (retval) ((sqrt_read_at (17) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t17))) (t17_2))) ((sqrt_active (18) (retval) ((sqrt_read_at (18) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t18))) (t18_2))) ((sqrt_active (19) (retval) ((sqrt_read_at (19) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t19))) (t19_2))) ((sqrt_active (20) (retval) ((sqrt_read_at (20) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t20))) (t20_2))) ((sqrt_active (21) (retval) ((sqrt_read_at (21) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t21))) (t21_2))) ((sqrt_active (22) (retval) ((sqrt_read_at (22) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t22))) (t22_2))) ((sqrt_active (23) (retval) ((sqrt_read_at (23) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t23))) (t23_2))) ((sqrt_active (24) (retval) ((sqrt_read_at (24) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t24))) (t24_2))) ((sqrt_active (25) (retval) ((sqrt_read_at (25) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t25))) (t25_2))) ((sqrt_active (26) (retval) ((sqrt_read_at (26) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t26))) (t26_2))) ((sqrt_active (27) (retval) ((sqrt_read_at (27) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t27))) (t27_2))) ((sqrt_active (28) (retval) ((sqrt_read_at (28) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t28))) (t28_2))) ((sqrt_active (29) (retval) ((sqrt_read_at (29) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t29))) (t29_2))) ((sqrt_active (30) (retval) ((sqrt_read_at (30) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t30))) (t30_2))) ((sqrt_active (31) (retval) ((sqrt_read_at (31) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t31))) (t31_2)))) = (rvv_pack32 ((sqrt_active (0) (retval) ((sqrt_read_at (0) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t0))) (t0_2))) ((sqrt_active (1) (retval) ((sqrt_read_at (1) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t1))) (t1_2))) ((sqrt_active (2) (retval) ((sqrt_read_at (2) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t2))) (t2_2))) ((sqrt_active (3) (retval) ((sqrt_read_at (3) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t3))) (t3_2))) ((sqrt_active (4) (retval) ((sqrt_read_at (4) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t4))) (t4_2))) ((sqrt_active (5) (retval) ((sqrt_read_at (5) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t5))) (t5_2))) ((sqrt_active (6) (retval) ((sqrt_read_at (6) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t6))) (t6_2))) ((sqrt_active (7) (retval) ((sqrt_read_at (7) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t7))) (t7_2))) ((sqrt_active (8) (retval) ((sqrt_read_at (8) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t8))) (t8_2))) ((sqrt_active (9) (retval) ((sqrt_read_at (9) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t9))) (t9_2))) ((sqrt_active (10) (retval) ((sqrt_read_at (10) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t10))) (t10_2))) ((sqrt_active (11) (retval) ((sqrt_read_at (11) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t11))) (t11_2))) ((sqrt_active (12) (retval) ((sqrt_read_at (12) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t12))) (t12_2))) ((sqrt_active (13) (retval) ((sqrt_read_at (13) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t13))) (t13_2))) ((sqrt_active (14) (retval) ((sqrt_read_at (14) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t14))) (t14_2))) ((sqrt_active (15) (retval) ((sqrt_read_at (15) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t15))) (t15_2))) ((sqrt_active (16) (retval) ((sqrt_read_at (16) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t16))) (t16_2))) ((sqrt_active (17) (retval) ((sqrt_read_at (17) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t17))) (t17_2))) ((sqrt_active (18) (retval) ((sqrt_read_at (18) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t18))) (t18_2))) ((sqrt_active (19) (retval) ((sqrt_read_at (19) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t19))) (t19_2))) ((sqrt_active (20) (retval) ((sqrt_read_at (20) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t20))) (t20_2))) ((sqrt_active (21) (retval) ((sqrt_read_at (21) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t21))) (t21_2))) ((sqrt_active (22) (retval) ((sqrt_read_at (22) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t22))) (t22_2))) ((sqrt_active (23) (retval) ((sqrt_read_at (23) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t23))) (t23_2))) ((sqrt_active (24) (retval) ((sqrt_read_at (24) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t24))) (t24_2))) ((sqrt_active (25) (retval) ((sqrt_read_at (25) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t25))) (t25_2))) ((sqrt_active (26) (retval) ((sqrt_read_at (26) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t26))) (t26_2))) ((sqrt_active (27) (retval) ((sqrt_read_at (27) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t27))) (t27_2))) ((sqrt_active (28) (retval) ((sqrt_read_at (28) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t28))) (t28_2))) ((sqrt_active (29) (retval) ((sqrt_read_at (29) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t29))) (t29_2))) ((sqrt_active (30) (retval) ((sqrt_read_at (30) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t30))) (t30_2))) ((sqrt_active (31) (retval) ((sqrt_read_at (31) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t31))) (t31_2))))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 32) ” 
  &&  “ (retval <= n) ” 
  &&  “ (retval > 0) ” 
  &&  “ (32 < n) ” 
  &&  “ (n < 64) ” 
  &&  “ (((n + 1 ) ÷ 2 ) <= retval) ” 
  &&  “ (n > 0) ” 
  &&  “ (sizeof(FLOAT) = 4) ” 
  &&  “ ((batch_pre % ( 4 ) ) = 0) ” 
  &&  “ ((batch_pre % ( sizeof(FLOAT) ) ) = 0) ” 
  &&  “ (0 < (batch_pre ÷ 4 )) ” 
  &&  “ ((batch_pre ÷ 4 ) <= 4611686018427387903) ” 
  &&  “ (0 <= n) ” 
  &&  “ (n <= (batch_pre ÷ 4 )) ” 
  &&  “ (input = (input_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT)))) ”
  &&  ((&(( &( "vy" ) )->ₛ "s0")) # Float  |-> (sqrt_active (0) (retval) ((sqrt_read_at (0) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t0))) (t0_2)))
  **  ((&(( &( "vy" ) )->ₛ "s1")) # Float  |-> (sqrt_active (1) (retval) ((sqrt_read_at (1) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t1))) (t1_2)))
  **  ((&(( &( "vy" ) )->ₛ "s2")) # Float  |-> (sqrt_active (2) (retval) ((sqrt_read_at (2) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t2))) (t2_2)))
  **  ((&(( &( "vy" ) )->ₛ "s3")) # Float  |-> (sqrt_active (3) (retval) ((sqrt_read_at (3) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t3))) (t3_2)))
  **  ((&(( &( "vy" ) )->ₛ "s4")) # Float  |-> (sqrt_active (4) (retval) ((sqrt_read_at (4) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t4))) (t4_2)))
  **  ((&(( &( "vy" ) )->ₛ "s5")) # Float  |-> (sqrt_active (5) (retval) ((sqrt_read_at (5) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t5))) (t5_2)))
  **  ((&(( &( "vy" ) )->ₛ "s6")) # Float  |-> (sqrt_active (6) (retval) ((sqrt_read_at (6) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t6))) (t6_2)))
  **  ((&(( &( "vy" ) )->ₛ "s7")) # Float  |-> (sqrt_active (7) (retval) ((sqrt_read_at (7) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t7))) (t7_2)))
  **  ((&(( &( "vy" ) )->ₛ "s8")) # Float  |-> (sqrt_active (8) (retval) ((sqrt_read_at (8) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t8))) (t8_2)))
  **  ((&(( &( "vy" ) )->ₛ "s9")) # Float  |-> (sqrt_active (9) (retval) ((sqrt_read_at (9) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t9))) (t9_2)))
  **  ((&(( &( "vy" ) )->ₛ "s10")) # Float  |-> (sqrt_active (10) (retval) ((sqrt_read_at (10) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t10))) (t10_2)))
  **  ((&(( &( "vy" ) )->ₛ "s11")) # Float  |-> (sqrt_active (11) (retval) ((sqrt_read_at (11) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t11))) (t11_2)))
  **  ((&(( &( "vy" ) )->ₛ "s12")) # Float  |-> (sqrt_active (12) (retval) ((sqrt_read_at (12) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t12))) (t12_2)))
  **  ((&(( &( "vy" ) )->ₛ "s13")) # Float  |-> (sqrt_active (13) (retval) ((sqrt_read_at (13) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t13))) (t13_2)))
  **  ((&(( &( "vy" ) )->ₛ "s14")) # Float  |-> (sqrt_active (14) (retval) ((sqrt_read_at (14) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t14))) (t14_2)))
  **  ((&(( &( "vy" ) )->ₛ "s15")) # Float  |-> (sqrt_active (15) (retval) ((sqrt_read_at (15) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t15))) (t15_2)))
  **  ((&(( &( "vy" ) )->ₛ "s16")) # Float  |-> (sqrt_active (16) (retval) ((sqrt_read_at (16) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t16))) (t16_2)))
  **  ((&(( &( "vy" ) )->ₛ "s17")) # Float  |-> (sqrt_active (17) (retval) ((sqrt_read_at (17) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t17))) (t17_2)))
  **  ((&(( &( "vy" ) )->ₛ "s18")) # Float  |-> (sqrt_active (18) (retval) ((sqrt_read_at (18) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t18))) (t18_2)))
  **  ((&(( &( "vy" ) )->ₛ "s19")) # Float  |-> (sqrt_active (19) (retval) ((sqrt_read_at (19) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t19))) (t19_2)))
  **  ((&(( &( "vy" ) )->ₛ "s20")) # Float  |-> (sqrt_active (20) (retval) ((sqrt_read_at (20) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t20))) (t20_2)))
  **  ((&(( &( "vy" ) )->ₛ "s21")) # Float  |-> (sqrt_active (21) (retval) ((sqrt_read_at (21) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t21))) (t21_2)))
  **  ((&(( &( "vy" ) )->ₛ "s22")) # Float  |-> (sqrt_active (22) (retval) ((sqrt_read_at (22) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t22))) (t22_2)))
  **  ((&(( &( "vy" ) )->ₛ "s23")) # Float  |-> (sqrt_active (23) (retval) ((sqrt_read_at (23) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t23))) (t23_2)))
  **  ((&(( &( "vy" ) )->ₛ "s24")) # Float  |-> (sqrt_active (24) (retval) ((sqrt_read_at (24) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t24))) (t24_2)))
  **  ((&(( &( "vy" ) )->ₛ "s25")) # Float  |-> (sqrt_active (25) (retval) ((sqrt_read_at (25) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t25))) (t25_2)))
  **  ((&(( &( "vy" ) )->ₛ "s26")) # Float  |-> (sqrt_active (26) (retval) ((sqrt_read_at (26) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t26))) (t26_2)))
  **  ((&(( &( "vy" ) )->ₛ "s27")) # Float  |-> (sqrt_active (27) (retval) ((sqrt_read_at (27) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t27))) (t27_2)))
  **  ((&(( &( "vy" ) )->ₛ "s28")) # Float  |-> (sqrt_active (28) (retval) ((sqrt_read_at (28) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t28))) (t28_2)))
  **  ((&(( &( "vy" ) )->ₛ "s29")) # Float  |-> (sqrt_active (29) (retval) ((sqrt_read_at (29) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t29))) (t29_2)))
  **  ((&(( &( "vy" ) )->ₛ "s30")) # Float  |-> (sqrt_active (30) (retval) ((sqrt_read_at (30) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t30))) (t30_2)))
  **  ((&(( &( "vy" ) )->ₛ "s31")) # Float  |-> (sqrt_active (31) (retval) ((sqrt_read_at (31) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t31))) (t31_2)))
  **  (FloatArray.undef_full output retval )
  **  (FloatArray.undef_full (output + (retval * sizeof(FLOAT))) (((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - n ) ) - retval ) )
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - n ) (sqrt_rvv_values (((batch_pre ÷ 4 ) - n )) (A)) )
  **  ((&(( &( "vx" ) )->ₛ "s0")) # Float  |-> (sqrt_read_at (0) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t0)))
  **  ((&(( &( "vx" ) )->ₛ "s1")) # Float  |-> (sqrt_read_at (1) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t1)))
  **  ((&(( &( "vx" ) )->ₛ "s2")) # Float  |-> (sqrt_read_at (2) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t2)))
  **  ((&(( &( "vx" ) )->ₛ "s3")) # Float  |-> (sqrt_read_at (3) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t3)))
  **  ((&(( &( "vx" ) )->ₛ "s4")) # Float  |-> (sqrt_read_at (4) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t4)))
  **  ((&(( &( "vx" ) )->ₛ "s5")) # Float  |-> (sqrt_read_at (5) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t5)))
  **  ((&(( &( "vx" ) )->ₛ "s6")) # Float  |-> (sqrt_read_at (6) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t6)))
  **  ((&(( &( "vx" ) )->ₛ "s7")) # Float  |-> (sqrt_read_at (7) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t7)))
  **  ((&(( &( "vx" ) )->ₛ "s8")) # Float  |-> (sqrt_read_at (8) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t8)))
  **  ((&(( &( "vx" ) )->ₛ "s9")) # Float  |-> (sqrt_read_at (9) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t9)))
  **  ((&(( &( "vx" ) )->ₛ "s10")) # Float  |-> (sqrt_read_at (10) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t10)))
  **  ((&(( &( "vx" ) )->ₛ "s11")) # Float  |-> (sqrt_read_at (11) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t11)))
  **  ((&(( &( "vx" ) )->ₛ "s12")) # Float  |-> (sqrt_read_at (12) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t12)))
  **  ((&(( &( "vx" ) )->ₛ "s13")) # Float  |-> (sqrt_read_at (13) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t13)))
  **  ((&(( &( "vx" ) )->ₛ "s14")) # Float  |-> (sqrt_read_at (14) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t14)))
  **  ((&(( &( "vx" ) )->ₛ "s15")) # Float  |-> (sqrt_read_at (15) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t15)))
  **  ((&(( &( "vx" ) )->ₛ "s16")) # Float  |-> (sqrt_read_at (16) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t16)))
  **  ((&(( &( "vx" ) )->ₛ "s17")) # Float  |-> (sqrt_read_at (17) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t17)))
  **  ((&(( &( "vx" ) )->ₛ "s18")) # Float  |-> (sqrt_read_at (18) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t18)))
  **  ((&(( &( "vx" ) )->ₛ "s19")) # Float  |-> (sqrt_read_at (19) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t19)))
  **  ((&(( &( "vx" ) )->ₛ "s20")) # Float  |-> (sqrt_read_at (20) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t20)))
  **  ((&(( &( "vx" ) )->ₛ "s21")) # Float  |-> (sqrt_read_at (21) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t21)))
  **  ((&(( &( "vx" ) )->ₛ "s22")) # Float  |-> (sqrt_read_at (22) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t22)))
  **  ((&(( &( "vx" ) )->ₛ "s23")) # Float  |-> (sqrt_read_at (23) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t23)))
  **  ((&(( &( "vx" ) )->ₛ "s24")) # Float  |-> (sqrt_read_at (24) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t24)))
  **  ((&(( &( "vx" ) )->ₛ "s25")) # Float  |-> (sqrt_read_at (25) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t25)))
  **  ((&(( &( "vx" ) )->ₛ "s26")) # Float  |-> (sqrt_read_at (26) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t26)))
  **  ((&(( &( "vx" ) )->ₛ "s27")) # Float  |-> (sqrt_read_at (27) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t27)))
  **  ((&(( &( "vx" ) )->ₛ "s28")) # Float  |-> (sqrt_read_at (28) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t28)))
  **  ((&(( &( "vx" ) )->ₛ "s29")) # Float  |-> (sqrt_read_at (29) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t29)))
  **  ((&(( &( "vx" ) )->ₛ "s30")) # Float  |-> (sqrt_read_at (30) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t30)))
  **  ((&(( &( "vx" ) )->ₛ "s31")) # Float  |-> (sqrt_read_at (31) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t31)))
.

Definition test_rvv_partial_solve_wit_19 := test_rvv_partial_solve_wit_19_pure -> test_rvv_partial_solve_wit_19_aux.

Definition test_rvv_partial_solve_wit_20_pure := 
forall (unused_params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (output: Z) (input: Z) (n: Z) (retval: Z) (t31: fp32) (t30: fp32) (t29: fp32) (t28: fp32) (t27: fp32) (t26: fp32) (t25: fp32) (t24: fp32) (t23: fp32) (t22: fp32) (t21: fp32) (t20: fp32) (t19: fp32) (t18: fp32) (t17: fp32) (t16: fp32) (t15: fp32) (t14: fp32) (t13: fp32) (t12: fp32) (t11: fp32) (t10: fp32) (t9: fp32) (t8: fp32) (t7: fp32) (t6: fp32) (t5: fp32) (t4: fp32) (t3: fp32) (t2: fp32) (t1: fp32) (t0: fp32) (t31_2: fp32) (t30_2: fp32) (t29_2: fp32) (t28_2: fp32) (t27_2: fp32) (t26_2: fp32) (t25_2: fp32) (t24_2: fp32) (t23_2: fp32) (t22_2: fp32) (t21_2: fp32) (t20_2: fp32) (t19_2: fp32) (t18_2: fp32) (t17_2: fp32) (t16_2: fp32) (t15_2: fp32) (t14_2: fp32) (t13_2: fp32) (t12_2: fp32) (t11_2: fp32) (t10_2: fp32) (t9_2: fp32) (t8_2: fp32) (t7_2: fp32) (t6_2: fp32) (t5_2: fp32) (t4_2: fp32) (t3_2: fp32) (t2_2: fp32) (t1_2: fp32) (t0_2: fp32) (PreH1 : (0 <= retval)) (PreH2 : (retval <= 32)) (PreH3 : (retval <= n)) (PreH4 : (retval > 0)) (PreH5 : (64 <= n)) (PreH6 : (retval = 32)) (PreH7 : (n > 0)) (PreH8 : (sizeof(FLOAT) = 4)) (PreH9 : ((batch_pre % ( 4 ) ) = 0)) (PreH10 : ((batch_pre % ( sizeof(FLOAT) ) ) = 0)) (PreH11 : (0 < (batch_pre ÷ 4 ))) (PreH12 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH13 : (0 <= n)) (PreH14 : (n <= (batch_pre ÷ 4 ))) (PreH15 : (input = (input_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) (PreH16 : (output = (output_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) ,
  ((&(( &( "vy" ) )->ₛ "s31")) # Float  |-> (sqrt_active (31) (retval) ((sqrt_read_at (31) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t31))) (t31_2)))
  **  ((&(( &( "vy" ) )->ₛ "s30")) # Float  |-> (sqrt_active (30) (retval) ((sqrt_read_at (30) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t30))) (t30_2)))
  **  ((&(( &( "vy" ) )->ₛ "s29")) # Float  |-> (sqrt_active (29) (retval) ((sqrt_read_at (29) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t29))) (t29_2)))
  **  ((&(( &( "vy" ) )->ₛ "s28")) # Float  |-> (sqrt_active (28) (retval) ((sqrt_read_at (28) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t28))) (t28_2)))
  **  ((&(( &( "vy" ) )->ₛ "s27")) # Float  |-> (sqrt_active (27) (retval) ((sqrt_read_at (27) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t27))) (t27_2)))
  **  ((&(( &( "vy" ) )->ₛ "s26")) # Float  |-> (sqrt_active (26) (retval) ((sqrt_read_at (26) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t26))) (t26_2)))
  **  ((&(( &( "vy" ) )->ₛ "s25")) # Float  |-> (sqrt_active (25) (retval) ((sqrt_read_at (25) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t25))) (t25_2)))
  **  ((&(( &( "vy" ) )->ₛ "s24")) # Float  |-> (sqrt_active (24) (retval) ((sqrt_read_at (24) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t24))) (t24_2)))
  **  ((&(( &( "vy" ) )->ₛ "s23")) # Float  |-> (sqrt_active (23) (retval) ((sqrt_read_at (23) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t23))) (t23_2)))
  **  ((&(( &( "vy" ) )->ₛ "s22")) # Float  |-> (sqrt_active (22) (retval) ((sqrt_read_at (22) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t22))) (t22_2)))
  **  ((&(( &( "vy" ) )->ₛ "s21")) # Float  |-> (sqrt_active (21) (retval) ((sqrt_read_at (21) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t21))) (t21_2)))
  **  ((&(( &( "vy" ) )->ₛ "s20")) # Float  |-> (sqrt_active (20) (retval) ((sqrt_read_at (20) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t20))) (t20_2)))
  **  ((&(( &( "vy" ) )->ₛ "s19")) # Float  |-> (sqrt_active (19) (retval) ((sqrt_read_at (19) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t19))) (t19_2)))
  **  ((&(( &( "vy" ) )->ₛ "s18")) # Float  |-> (sqrt_active (18) (retval) ((sqrt_read_at (18) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t18))) (t18_2)))
  **  ((&(( &( "vy" ) )->ₛ "s17")) # Float  |-> (sqrt_active (17) (retval) ((sqrt_read_at (17) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t17))) (t17_2)))
  **  ((&(( &( "vy" ) )->ₛ "s16")) # Float  |-> (sqrt_active (16) (retval) ((sqrt_read_at (16) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t16))) (t16_2)))
  **  ((&(( &( "vy" ) )->ₛ "s15")) # Float  |-> (sqrt_active (15) (retval) ((sqrt_read_at (15) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t15))) (t15_2)))
  **  ((&(( &( "vy" ) )->ₛ "s14")) # Float  |-> (sqrt_active (14) (retval) ((sqrt_read_at (14) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t14))) (t14_2)))
  **  ((&(( &( "vy" ) )->ₛ "s13")) # Float  |-> (sqrt_active (13) (retval) ((sqrt_read_at (13) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t13))) (t13_2)))
  **  ((&(( &( "vy" ) )->ₛ "s12")) # Float  |-> (sqrt_active (12) (retval) ((sqrt_read_at (12) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t12))) (t12_2)))
  **  ((&(( &( "vy" ) )->ₛ "s11")) # Float  |-> (sqrt_active (11) (retval) ((sqrt_read_at (11) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t11))) (t11_2)))
  **  ((&(( &( "vy" ) )->ₛ "s10")) # Float  |-> (sqrt_active (10) (retval) ((sqrt_read_at (10) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t10))) (t10_2)))
  **  ((&(( &( "vy" ) )->ₛ "s9")) # Float  |-> (sqrt_active (9) (retval) ((sqrt_read_at (9) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t9))) (t9_2)))
  **  ((&(( &( "vy" ) )->ₛ "s8")) # Float  |-> (sqrt_active (8) (retval) ((sqrt_read_at (8) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t8))) (t8_2)))
  **  ((&(( &( "vy" ) )->ₛ "s7")) # Float  |-> (sqrt_active (7) (retval) ((sqrt_read_at (7) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t7))) (t7_2)))
  **  ((&(( &( "vy" ) )->ₛ "s6")) # Float  |-> (sqrt_active (6) (retval) ((sqrt_read_at (6) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t6))) (t6_2)))
  **  ((&(( &( "vy" ) )->ₛ "s5")) # Float  |-> (sqrt_active (5) (retval) ((sqrt_read_at (5) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t5))) (t5_2)))
  **  ((&(( &( "vy" ) )->ₛ "s4")) # Float  |-> (sqrt_active (4) (retval) ((sqrt_read_at (4) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t4))) (t4_2)))
  **  ((&(( &( "vy" ) )->ₛ "s3")) # Float  |-> (sqrt_active (3) (retval) ((sqrt_read_at (3) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t3))) (t3_2)))
  **  ((&(( &( "vy" ) )->ₛ "s2")) # Float  |-> (sqrt_active (2) (retval) ((sqrt_read_at (2) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t2))) (t2_2)))
  **  ((&(( &( "vy" ) )->ₛ "s1")) # Float  |-> (sqrt_active (1) (retval) ((sqrt_read_at (1) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t1))) (t1_2)))
  **  ((&(( &( "vy" ) )->ₛ "s0")) # Float  |-> (sqrt_active (0) (retval) ((sqrt_read_at (0) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t0))) (t0_2)))
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  ((( &( "vl" ) )) # UInt64  |-> retval)
  **  ((( &( "unused_params" ) )) # Ptr  |-> unused_params_pre)
  **  ((( &( "batch" ) )) # UInt64  |-> batch_pre)
  **  ((( &( "n" ) )) # UInt64  |-> n)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - n ) (sqrt_rvv_values (((batch_pre ÷ 4 ) - n )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - n ) ) )
  **  ((&(( &( "vx" ) )->ₛ "s0")) # Float  |-> (sqrt_read_at (0) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t0)))
  **  ((&(( &( "vx" ) )->ₛ "s1")) # Float  |-> (sqrt_read_at (1) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t1)))
  **  ((&(( &( "vx" ) )->ₛ "s2")) # Float  |-> (sqrt_read_at (2) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t2)))
  **  ((&(( &( "vx" ) )->ₛ "s3")) # Float  |-> (sqrt_read_at (3) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t3)))
  **  ((&(( &( "vx" ) )->ₛ "s4")) # Float  |-> (sqrt_read_at (4) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t4)))
  **  ((&(( &( "vx" ) )->ₛ "s5")) # Float  |-> (sqrt_read_at (5) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t5)))
  **  ((&(( &( "vx" ) )->ₛ "s6")) # Float  |-> (sqrt_read_at (6) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t6)))
  **  ((&(( &( "vx" ) )->ₛ "s7")) # Float  |-> (sqrt_read_at (7) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t7)))
  **  ((&(( &( "vx" ) )->ₛ "s8")) # Float  |-> (sqrt_read_at (8) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t8)))
  **  ((&(( &( "vx" ) )->ₛ "s9")) # Float  |-> (sqrt_read_at (9) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t9)))
  **  ((&(( &( "vx" ) )->ₛ "s10")) # Float  |-> (sqrt_read_at (10) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t10)))
  **  ((&(( &( "vx" ) )->ₛ "s11")) # Float  |-> (sqrt_read_at (11) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t11)))
  **  ((&(( &( "vx" ) )->ₛ "s12")) # Float  |-> (sqrt_read_at (12) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t12)))
  **  ((&(( &( "vx" ) )->ₛ "s13")) # Float  |-> (sqrt_read_at (13) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t13)))
  **  ((&(( &( "vx" ) )->ₛ "s14")) # Float  |-> (sqrt_read_at (14) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t14)))
  **  ((&(( &( "vx" ) )->ₛ "s15")) # Float  |-> (sqrt_read_at (15) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t15)))
  **  ((&(( &( "vx" ) )->ₛ "s16")) # Float  |-> (sqrt_read_at (16) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t16)))
  **  ((&(( &( "vx" ) )->ₛ "s17")) # Float  |-> (sqrt_read_at (17) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t17)))
  **  ((&(( &( "vx" ) )->ₛ "s18")) # Float  |-> (sqrt_read_at (18) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t18)))
  **  ((&(( &( "vx" ) )->ₛ "s19")) # Float  |-> (sqrt_read_at (19) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t19)))
  **  ((&(( &( "vx" ) )->ₛ "s20")) # Float  |-> (sqrt_read_at (20) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t20)))
  **  ((&(( &( "vx" ) )->ₛ "s21")) # Float  |-> (sqrt_read_at (21) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t21)))
  **  ((&(( &( "vx" ) )->ₛ "s22")) # Float  |-> (sqrt_read_at (22) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t22)))
  **  ((&(( &( "vx" ) )->ₛ "s23")) # Float  |-> (sqrt_read_at (23) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t23)))
  **  ((&(( &( "vx" ) )->ₛ "s24")) # Float  |-> (sqrt_read_at (24) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t24)))
  **  ((&(( &( "vx" ) )->ₛ "s25")) # Float  |-> (sqrt_read_at (25) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t25)))
  **  ((&(( &( "vx" ) )->ₛ "s26")) # Float  |-> (sqrt_read_at (26) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t26)))
  **  ((&(( &( "vx" ) )->ₛ "s27")) # Float  |-> (sqrt_read_at (27) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t27)))
  **  ((&(( &( "vx" ) )->ₛ "s28")) # Float  |-> (sqrt_read_at (28) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t28)))
  **  ((&(( &( "vx" ) )->ₛ "s29")) # Float  |-> (sqrt_read_at (29) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t29)))
  **  ((&(( &( "vx" ) )->ₛ "s30")) # Float  |-> (sqrt_read_at (30) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t30)))
  **  ((&(( &( "vx" ) )->ₛ "s31")) # Float  |-> (sqrt_read_at (31) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t31)))
|--
  “ (0 <= retval) ” 
  &&  “ (retval <= 32) ” 
  &&  “ ((rvv_pack32 ((sqrt_active (0) (retval) ((sqrt_read_at (0) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t0))) (t0_2))) ((sqrt_active (1) (retval) ((sqrt_read_at (1) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t1))) (t1_2))) ((sqrt_active (2) (retval) ((sqrt_read_at (2) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t2))) (t2_2))) ((sqrt_active (3) (retval) ((sqrt_read_at (3) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t3))) (t3_2))) ((sqrt_active (4) (retval) ((sqrt_read_at (4) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t4))) (t4_2))) ((sqrt_active (5) (retval) ((sqrt_read_at (5) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t5))) (t5_2))) ((sqrt_active (6) (retval) ((sqrt_read_at (6) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t6))) (t6_2))) ((sqrt_active (7) (retval) ((sqrt_read_at (7) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t7))) (t7_2))) ((sqrt_active (8) (retval) ((sqrt_read_at (8) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t8))) (t8_2))) ((sqrt_active (9) (retval) ((sqrt_read_at (9) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t9))) (t9_2))) ((sqrt_active (10) (retval) ((sqrt_read_at (10) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t10))) (t10_2))) ((sqrt_active (11) (retval) ((sqrt_read_at (11) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t11))) (t11_2))) ((sqrt_active (12) (retval) ((sqrt_read_at (12) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t12))) (t12_2))) ((sqrt_active (13) (retval) ((sqrt_read_at (13) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t13))) (t13_2))) ((sqrt_active (14) (retval) ((sqrt_read_at (14) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t14))) (t14_2))) ((sqrt_active (15) (retval) ((sqrt_read_at (15) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t15))) (t15_2))) ((sqrt_active (16) (retval) ((sqrt_read_at (16) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t16))) (t16_2))) ((sqrt_active (17) (retval) ((sqrt_read_at (17) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t17))) (t17_2))) ((sqrt_active (18) (retval) ((sqrt_read_at (18) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t18))) (t18_2))) ((sqrt_active (19) (retval) ((sqrt_read_at (19) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t19))) (t19_2))) ((sqrt_active (20) (retval) ((sqrt_read_at (20) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t20))) (t20_2))) ((sqrt_active (21) (retval) ((sqrt_read_at (21) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t21))) (t21_2))) ((sqrt_active (22) (retval) ((sqrt_read_at (22) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t22))) (t22_2))) ((sqrt_active (23) (retval) ((sqrt_read_at (23) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t23))) (t23_2))) ((sqrt_active (24) (retval) ((sqrt_read_at (24) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t24))) (t24_2))) ((sqrt_active (25) (retval) ((sqrt_read_at (25) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t25))) (t25_2))) ((sqrt_active (26) (retval) ((sqrt_read_at (26) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t26))) (t26_2))) ((sqrt_active (27) (retval) ((sqrt_read_at (27) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t27))) (t27_2))) ((sqrt_active (28) (retval) ((sqrt_read_at (28) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t28))) (t28_2))) ((sqrt_active (29) (retval) ((sqrt_read_at (29) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t29))) (t29_2))) ((sqrt_active (30) (retval) ((sqrt_read_at (30) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t30))) (t30_2))) ((sqrt_active (31) (retval) ((sqrt_read_at (31) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t31))) (t31_2)))) = (rvv_pack32 ((sqrt_active (0) (retval) ((sqrt_read_at (0) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t0))) (t0_2))) ((sqrt_active (1) (retval) ((sqrt_read_at (1) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t1))) (t1_2))) ((sqrt_active (2) (retval) ((sqrt_read_at (2) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t2))) (t2_2))) ((sqrt_active (3) (retval) ((sqrt_read_at (3) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t3))) (t3_2))) ((sqrt_active (4) (retval) ((sqrt_read_at (4) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t4))) (t4_2))) ((sqrt_active (5) (retval) ((sqrt_read_at (5) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t5))) (t5_2))) ((sqrt_active (6) (retval) ((sqrt_read_at (6) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t6))) (t6_2))) ((sqrt_active (7) (retval) ((sqrt_read_at (7) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t7))) (t7_2))) ((sqrt_active (8) (retval) ((sqrt_read_at (8) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t8))) (t8_2))) ((sqrt_active (9) (retval) ((sqrt_read_at (9) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t9))) (t9_2))) ((sqrt_active (10) (retval) ((sqrt_read_at (10) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t10))) (t10_2))) ((sqrt_active (11) (retval) ((sqrt_read_at (11) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t11))) (t11_2))) ((sqrt_active (12) (retval) ((sqrt_read_at (12) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t12))) (t12_2))) ((sqrt_active (13) (retval) ((sqrt_read_at (13) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t13))) (t13_2))) ((sqrt_active (14) (retval) ((sqrt_read_at (14) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t14))) (t14_2))) ((sqrt_active (15) (retval) ((sqrt_read_at (15) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t15))) (t15_2))) ((sqrt_active (16) (retval) ((sqrt_read_at (16) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t16))) (t16_2))) ((sqrt_active (17) (retval) ((sqrt_read_at (17) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t17))) (t17_2))) ((sqrt_active (18) (retval) ((sqrt_read_at (18) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t18))) (t18_2))) ((sqrt_active (19) (retval) ((sqrt_read_at (19) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t19))) (t19_2))) ((sqrt_active (20) (retval) ((sqrt_read_at (20) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t20))) (t20_2))) ((sqrt_active (21) (retval) ((sqrt_read_at (21) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t21))) (t21_2))) ((sqrt_active (22) (retval) ((sqrt_read_at (22) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t22))) (t22_2))) ((sqrt_active (23) (retval) ((sqrt_read_at (23) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t23))) (t23_2))) ((sqrt_active (24) (retval) ((sqrt_read_at (24) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t24))) (t24_2))) ((sqrt_active (25) (retval) ((sqrt_read_at (25) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t25))) (t25_2))) ((sqrt_active (26) (retval) ((sqrt_read_at (26) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t26))) (t26_2))) ((sqrt_active (27) (retval) ((sqrt_read_at (27) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t27))) (t27_2))) ((sqrt_active (28) (retval) ((sqrt_read_at (28) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t28))) (t28_2))) ((sqrt_active (29) (retval) ((sqrt_read_at (29) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t29))) (t29_2))) ((sqrt_active (30) (retval) ((sqrt_read_at (30) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t30))) (t30_2))) ((sqrt_active (31) (retval) ((sqrt_read_at (31) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t31))) (t31_2))))) ”
.

Definition test_rvv_partial_solve_wit_20_aux := 
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (output: Z) (input: Z) (n: Z) (retval: Z) (t31: fp32) (t30: fp32) (t29: fp32) (t28: fp32) (t27: fp32) (t26: fp32) (t25: fp32) (t24: fp32) (t23: fp32) (t22: fp32) (t21: fp32) (t20: fp32) (t19: fp32) (t18: fp32) (t17: fp32) (t16: fp32) (t15: fp32) (t14: fp32) (t13: fp32) (t12: fp32) (t11: fp32) (t10: fp32) (t9: fp32) (t8: fp32) (t7: fp32) (t6: fp32) (t5: fp32) (t4: fp32) (t3: fp32) (t2: fp32) (t1: fp32) (t0: fp32) (t31_2: fp32) (t30_2: fp32) (t29_2: fp32) (t28_2: fp32) (t27_2: fp32) (t26_2: fp32) (t25_2: fp32) (t24_2: fp32) (t23_2: fp32) (t22_2: fp32) (t21_2: fp32) (t20_2: fp32) (t19_2: fp32) (t18_2: fp32) (t17_2: fp32) (t16_2: fp32) (t15_2: fp32) (t14_2: fp32) (t13_2: fp32) (t12_2: fp32) (t11_2: fp32) (t10_2: fp32) (t9_2: fp32) (t8_2: fp32) (t7_2: fp32) (t6_2: fp32) (t5_2: fp32) (t4_2: fp32) (t3_2: fp32) (t2_2: fp32) (t1_2: fp32) (t0_2: fp32) (PreH1 : (0 <= retval)) (PreH2 : (retval <= 32)) (PreH3 : (retval <= n)) (PreH4 : (retval > 0)) (PreH5 : (64 <= n)) (PreH6 : (retval = 32)) (PreH7 : (n > 0)) (PreH8 : (sizeof(FLOAT) = 4)) (PreH9 : ((batch_pre % ( 4 ) ) = 0)) (PreH10 : ((batch_pre % ( sizeof(FLOAT) ) ) = 0)) (PreH11 : (0 < (batch_pre ÷ 4 ))) (PreH12 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH13 : (0 <= n)) (PreH14 : (n <= (batch_pre ÷ 4 ))) (PreH15 : (input = (input_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) (PreH16 : (output = (output_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT))))) ,
  ((&(( &( "vy" ) )->ₛ "s31")) # Float  |-> (sqrt_active (31) (retval) ((sqrt_read_at (31) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t31))) (t31_2)))
  **  ((&(( &( "vy" ) )->ₛ "s30")) # Float  |-> (sqrt_active (30) (retval) ((sqrt_read_at (30) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t30))) (t30_2)))
  **  ((&(( &( "vy" ) )->ₛ "s29")) # Float  |-> (sqrt_active (29) (retval) ((sqrt_read_at (29) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t29))) (t29_2)))
  **  ((&(( &( "vy" ) )->ₛ "s28")) # Float  |-> (sqrt_active (28) (retval) ((sqrt_read_at (28) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t28))) (t28_2)))
  **  ((&(( &( "vy" ) )->ₛ "s27")) # Float  |-> (sqrt_active (27) (retval) ((sqrt_read_at (27) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t27))) (t27_2)))
  **  ((&(( &( "vy" ) )->ₛ "s26")) # Float  |-> (sqrt_active (26) (retval) ((sqrt_read_at (26) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t26))) (t26_2)))
  **  ((&(( &( "vy" ) )->ₛ "s25")) # Float  |-> (sqrt_active (25) (retval) ((sqrt_read_at (25) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t25))) (t25_2)))
  **  ((&(( &( "vy" ) )->ₛ "s24")) # Float  |-> (sqrt_active (24) (retval) ((sqrt_read_at (24) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t24))) (t24_2)))
  **  ((&(( &( "vy" ) )->ₛ "s23")) # Float  |-> (sqrt_active (23) (retval) ((sqrt_read_at (23) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t23))) (t23_2)))
  **  ((&(( &( "vy" ) )->ₛ "s22")) # Float  |-> (sqrt_active (22) (retval) ((sqrt_read_at (22) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t22))) (t22_2)))
  **  ((&(( &( "vy" ) )->ₛ "s21")) # Float  |-> (sqrt_active (21) (retval) ((sqrt_read_at (21) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t21))) (t21_2)))
  **  ((&(( &( "vy" ) )->ₛ "s20")) # Float  |-> (sqrt_active (20) (retval) ((sqrt_read_at (20) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t20))) (t20_2)))
  **  ((&(( &( "vy" ) )->ₛ "s19")) # Float  |-> (sqrt_active (19) (retval) ((sqrt_read_at (19) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t19))) (t19_2)))
  **  ((&(( &( "vy" ) )->ₛ "s18")) # Float  |-> (sqrt_active (18) (retval) ((sqrt_read_at (18) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t18))) (t18_2)))
  **  ((&(( &( "vy" ) )->ₛ "s17")) # Float  |-> (sqrt_active (17) (retval) ((sqrt_read_at (17) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t17))) (t17_2)))
  **  ((&(( &( "vy" ) )->ₛ "s16")) # Float  |-> (sqrt_active (16) (retval) ((sqrt_read_at (16) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t16))) (t16_2)))
  **  ((&(( &( "vy" ) )->ₛ "s15")) # Float  |-> (sqrt_active (15) (retval) ((sqrt_read_at (15) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t15))) (t15_2)))
  **  ((&(( &( "vy" ) )->ₛ "s14")) # Float  |-> (sqrt_active (14) (retval) ((sqrt_read_at (14) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t14))) (t14_2)))
  **  ((&(( &( "vy" ) )->ₛ "s13")) # Float  |-> (sqrt_active (13) (retval) ((sqrt_read_at (13) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t13))) (t13_2)))
  **  ((&(( &( "vy" ) )->ₛ "s12")) # Float  |-> (sqrt_active (12) (retval) ((sqrt_read_at (12) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t12))) (t12_2)))
  **  ((&(( &( "vy" ) )->ₛ "s11")) # Float  |-> (sqrt_active (11) (retval) ((sqrt_read_at (11) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t11))) (t11_2)))
  **  ((&(( &( "vy" ) )->ₛ "s10")) # Float  |-> (sqrt_active (10) (retval) ((sqrt_read_at (10) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t10))) (t10_2)))
  **  ((&(( &( "vy" ) )->ₛ "s9")) # Float  |-> (sqrt_active (9) (retval) ((sqrt_read_at (9) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t9))) (t9_2)))
  **  ((&(( &( "vy" ) )->ₛ "s8")) # Float  |-> (sqrt_active (8) (retval) ((sqrt_read_at (8) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t8))) (t8_2)))
  **  ((&(( &( "vy" ) )->ₛ "s7")) # Float  |-> (sqrt_active (7) (retval) ((sqrt_read_at (7) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t7))) (t7_2)))
  **  ((&(( &( "vy" ) )->ₛ "s6")) # Float  |-> (sqrt_active (6) (retval) ((sqrt_read_at (6) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t6))) (t6_2)))
  **  ((&(( &( "vy" ) )->ₛ "s5")) # Float  |-> (sqrt_active (5) (retval) ((sqrt_read_at (5) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t5))) (t5_2)))
  **  ((&(( &( "vy" ) )->ₛ "s4")) # Float  |-> (sqrt_active (4) (retval) ((sqrt_read_at (4) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t4))) (t4_2)))
  **  ((&(( &( "vy" ) )->ₛ "s3")) # Float  |-> (sqrt_active (3) (retval) ((sqrt_read_at (3) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t3))) (t3_2)))
  **  ((&(( &( "vy" ) )->ₛ "s2")) # Float  |-> (sqrt_active (2) (retval) ((sqrt_read_at (2) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t2))) (t2_2)))
  **  ((&(( &( "vy" ) )->ₛ "s1")) # Float  |-> (sqrt_active (1) (retval) ((sqrt_read_at (1) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t1))) (t1_2)))
  **  ((&(( &( "vy" ) )->ₛ "s0")) # Float  |-> (sqrt_active (0) (retval) ((sqrt_read_at (0) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t0))) (t0_2)))
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - n ) (sqrt_rvv_values (((batch_pre ÷ 4 ) - n )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - n ) ) )
  **  ((&(( &( "vx" ) )->ₛ "s0")) # Float  |-> (sqrt_read_at (0) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t0)))
  **  ((&(( &( "vx" ) )->ₛ "s1")) # Float  |-> (sqrt_read_at (1) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t1)))
  **  ((&(( &( "vx" ) )->ₛ "s2")) # Float  |-> (sqrt_read_at (2) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t2)))
  **  ((&(( &( "vx" ) )->ₛ "s3")) # Float  |-> (sqrt_read_at (3) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t3)))
  **  ((&(( &( "vx" ) )->ₛ "s4")) # Float  |-> (sqrt_read_at (4) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t4)))
  **  ((&(( &( "vx" ) )->ₛ "s5")) # Float  |-> (sqrt_read_at (5) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t5)))
  **  ((&(( &( "vx" ) )->ₛ "s6")) # Float  |-> (sqrt_read_at (6) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t6)))
  **  ((&(( &( "vx" ) )->ₛ "s7")) # Float  |-> (sqrt_read_at (7) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t7)))
  **  ((&(( &( "vx" ) )->ₛ "s8")) # Float  |-> (sqrt_read_at (8) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t8)))
  **  ((&(( &( "vx" ) )->ₛ "s9")) # Float  |-> (sqrt_read_at (9) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t9)))
  **  ((&(( &( "vx" ) )->ₛ "s10")) # Float  |-> (sqrt_read_at (10) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t10)))
  **  ((&(( &( "vx" ) )->ₛ "s11")) # Float  |-> (sqrt_read_at (11) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t11)))
  **  ((&(( &( "vx" ) )->ₛ "s12")) # Float  |-> (sqrt_read_at (12) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t12)))
  **  ((&(( &( "vx" ) )->ₛ "s13")) # Float  |-> (sqrt_read_at (13) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t13)))
  **  ((&(( &( "vx" ) )->ₛ "s14")) # Float  |-> (sqrt_read_at (14) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t14)))
  **  ((&(( &( "vx" ) )->ₛ "s15")) # Float  |-> (sqrt_read_at (15) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t15)))
  **  ((&(( &( "vx" ) )->ₛ "s16")) # Float  |-> (sqrt_read_at (16) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t16)))
  **  ((&(( &( "vx" ) )->ₛ "s17")) # Float  |-> (sqrt_read_at (17) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t17)))
  **  ((&(( &( "vx" ) )->ₛ "s18")) # Float  |-> (sqrt_read_at (18) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t18)))
  **  ((&(( &( "vx" ) )->ₛ "s19")) # Float  |-> (sqrt_read_at (19) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t19)))
  **  ((&(( &( "vx" ) )->ₛ "s20")) # Float  |-> (sqrt_read_at (20) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t20)))
  **  ((&(( &( "vx" ) )->ₛ "s21")) # Float  |-> (sqrt_read_at (21) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t21)))
  **  ((&(( &( "vx" ) )->ₛ "s22")) # Float  |-> (sqrt_read_at (22) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t22)))
  **  ((&(( &( "vx" ) )->ₛ "s23")) # Float  |-> (sqrt_read_at (23) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t23)))
  **  ((&(( &( "vx" ) )->ₛ "s24")) # Float  |-> (sqrt_read_at (24) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t24)))
  **  ((&(( &( "vx" ) )->ₛ "s25")) # Float  |-> (sqrt_read_at (25) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t25)))
  **  ((&(( &( "vx" ) )->ₛ "s26")) # Float  |-> (sqrt_read_at (26) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t26)))
  **  ((&(( &( "vx" ) )->ₛ "s27")) # Float  |-> (sqrt_read_at (27) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t27)))
  **  ((&(( &( "vx" ) )->ₛ "s28")) # Float  |-> (sqrt_read_at (28) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t28)))
  **  ((&(( &( "vx" ) )->ₛ "s29")) # Float  |-> (sqrt_read_at (29) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t29)))
  **  ((&(( &( "vx" ) )->ₛ "s30")) # Float  |-> (sqrt_read_at (30) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t30)))
  **  ((&(( &( "vx" ) )->ₛ "s31")) # Float  |-> (sqrt_read_at (31) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t31)))
|--
  “ (0 <= retval) ” 
  &&  “ (retval <= 32) ” 
  &&  “ ((rvv_pack32 ((sqrt_active (0) (retval) ((sqrt_read_at (0) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t0))) (t0_2))) ((sqrt_active (1) (retval) ((sqrt_read_at (1) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t1))) (t1_2))) ((sqrt_active (2) (retval) ((sqrt_read_at (2) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t2))) (t2_2))) ((sqrt_active (3) (retval) ((sqrt_read_at (3) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t3))) (t3_2))) ((sqrt_active (4) (retval) ((sqrt_read_at (4) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t4))) (t4_2))) ((sqrt_active (5) (retval) ((sqrt_read_at (5) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t5))) (t5_2))) ((sqrt_active (6) (retval) ((sqrt_read_at (6) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t6))) (t6_2))) ((sqrt_active (7) (retval) ((sqrt_read_at (7) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t7))) (t7_2))) ((sqrt_active (8) (retval) ((sqrt_read_at (8) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t8))) (t8_2))) ((sqrt_active (9) (retval) ((sqrt_read_at (9) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t9))) (t9_2))) ((sqrt_active (10) (retval) ((sqrt_read_at (10) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t10))) (t10_2))) ((sqrt_active (11) (retval) ((sqrt_read_at (11) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t11))) (t11_2))) ((sqrt_active (12) (retval) ((sqrt_read_at (12) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t12))) (t12_2))) ((sqrt_active (13) (retval) ((sqrt_read_at (13) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t13))) (t13_2))) ((sqrt_active (14) (retval) ((sqrt_read_at (14) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t14))) (t14_2))) ((sqrt_active (15) (retval) ((sqrt_read_at (15) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t15))) (t15_2))) ((sqrt_active (16) (retval) ((sqrt_read_at (16) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t16))) (t16_2))) ((sqrt_active (17) (retval) ((sqrt_read_at (17) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t17))) (t17_2))) ((sqrt_active (18) (retval) ((sqrt_read_at (18) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t18))) (t18_2))) ((sqrt_active (19) (retval) ((sqrt_read_at (19) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t19))) (t19_2))) ((sqrt_active (20) (retval) ((sqrt_read_at (20) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t20))) (t20_2))) ((sqrt_active (21) (retval) ((sqrt_read_at (21) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t21))) (t21_2))) ((sqrt_active (22) (retval) ((sqrt_read_at (22) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t22))) (t22_2))) ((sqrt_active (23) (retval) ((sqrt_read_at (23) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t23))) (t23_2))) ((sqrt_active (24) (retval) ((sqrt_read_at (24) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t24))) (t24_2))) ((sqrt_active (25) (retval) ((sqrt_read_at (25) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t25))) (t25_2))) ((sqrt_active (26) (retval) ((sqrt_read_at (26) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t26))) (t26_2))) ((sqrt_active (27) (retval) ((sqrt_read_at (27) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t27))) (t27_2))) ((sqrt_active (28) (retval) ((sqrt_read_at (28) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t28))) (t28_2))) ((sqrt_active (29) (retval) ((sqrt_read_at (29) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t29))) (t29_2))) ((sqrt_active (30) (retval) ((sqrt_read_at (30) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t30))) (t30_2))) ((sqrt_active (31) (retval) ((sqrt_read_at (31) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t31))) (t31_2)))) = (rvv_pack32 ((sqrt_active (0) (retval) ((sqrt_read_at (0) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t0))) (t0_2))) ((sqrt_active (1) (retval) ((sqrt_read_at (1) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t1))) (t1_2))) ((sqrt_active (2) (retval) ((sqrt_read_at (2) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t2))) (t2_2))) ((sqrt_active (3) (retval) ((sqrt_read_at (3) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t3))) (t3_2))) ((sqrt_active (4) (retval) ((sqrt_read_at (4) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t4))) (t4_2))) ((sqrt_active (5) (retval) ((sqrt_read_at (5) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t5))) (t5_2))) ((sqrt_active (6) (retval) ((sqrt_read_at (6) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t6))) (t6_2))) ((sqrt_active (7) (retval) ((sqrt_read_at (7) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t7))) (t7_2))) ((sqrt_active (8) (retval) ((sqrt_read_at (8) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t8))) (t8_2))) ((sqrt_active (9) (retval) ((sqrt_read_at (9) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t9))) (t9_2))) ((sqrt_active (10) (retval) ((sqrt_read_at (10) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t10))) (t10_2))) ((sqrt_active (11) (retval) ((sqrt_read_at (11) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t11))) (t11_2))) ((sqrt_active (12) (retval) ((sqrt_read_at (12) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t12))) (t12_2))) ((sqrt_active (13) (retval) ((sqrt_read_at (13) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t13))) (t13_2))) ((sqrt_active (14) (retval) ((sqrt_read_at (14) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t14))) (t14_2))) ((sqrt_active (15) (retval) ((sqrt_read_at (15) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t15))) (t15_2))) ((sqrt_active (16) (retval) ((sqrt_read_at (16) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t16))) (t16_2))) ((sqrt_active (17) (retval) ((sqrt_read_at (17) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t17))) (t17_2))) ((sqrt_active (18) (retval) ((sqrt_read_at (18) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t18))) (t18_2))) ((sqrt_active (19) (retval) ((sqrt_read_at (19) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t19))) (t19_2))) ((sqrt_active (20) (retval) ((sqrt_read_at (20) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t20))) (t20_2))) ((sqrt_active (21) (retval) ((sqrt_read_at (21) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t21))) (t21_2))) ((sqrt_active (22) (retval) ((sqrt_read_at (22) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t22))) (t22_2))) ((sqrt_active (23) (retval) ((sqrt_read_at (23) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t23))) (t23_2))) ((sqrt_active (24) (retval) ((sqrt_read_at (24) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t24))) (t24_2))) ((sqrt_active (25) (retval) ((sqrt_read_at (25) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t25))) (t25_2))) ((sqrt_active (26) (retval) ((sqrt_read_at (26) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t26))) (t26_2))) ((sqrt_active (27) (retval) ((sqrt_read_at (27) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t27))) (t27_2))) ((sqrt_active (28) (retval) ((sqrt_read_at (28) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t28))) (t28_2))) ((sqrt_active (29) (retval) ((sqrt_read_at (29) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t29))) (t29_2))) ((sqrt_active (30) (retval) ((sqrt_read_at (30) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t30))) (t30_2))) ((sqrt_active (31) (retval) ((sqrt_read_at (31) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t31))) (t31_2))))) ” 
  &&  “ (0 <= retval) ” 
  &&  “ (retval <= 32) ” 
  &&  “ (retval <= n) ” 
  &&  “ (retval > 0) ” 
  &&  “ (64 <= n) ” 
  &&  “ (retval = 32) ” 
  &&  “ (n > 0) ” 
  &&  “ (sizeof(FLOAT) = 4) ” 
  &&  “ ((batch_pre % ( 4 ) ) = 0) ” 
  &&  “ ((batch_pre % ( sizeof(FLOAT) ) ) = 0) ” 
  &&  “ (0 < (batch_pre ÷ 4 )) ” 
  &&  “ ((batch_pre ÷ 4 ) <= 4611686018427387903) ” 
  &&  “ (0 <= n) ” 
  &&  “ (n <= (batch_pre ÷ 4 )) ” 
  &&  “ (input = (input_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (((batch_pre ÷ 4 ) - n ) * sizeof(FLOAT)))) ”
  &&  ((&(( &( "vy" ) )->ₛ "s0")) # Float  |-> (sqrt_active (0) (retval) ((sqrt_read_at (0) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t0))) (t0_2)))
  **  ((&(( &( "vy" ) )->ₛ "s1")) # Float  |-> (sqrt_active (1) (retval) ((sqrt_read_at (1) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t1))) (t1_2)))
  **  ((&(( &( "vy" ) )->ₛ "s2")) # Float  |-> (sqrt_active (2) (retval) ((sqrt_read_at (2) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t2))) (t2_2)))
  **  ((&(( &( "vy" ) )->ₛ "s3")) # Float  |-> (sqrt_active (3) (retval) ((sqrt_read_at (3) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t3))) (t3_2)))
  **  ((&(( &( "vy" ) )->ₛ "s4")) # Float  |-> (sqrt_active (4) (retval) ((sqrt_read_at (4) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t4))) (t4_2)))
  **  ((&(( &( "vy" ) )->ₛ "s5")) # Float  |-> (sqrt_active (5) (retval) ((sqrt_read_at (5) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t5))) (t5_2)))
  **  ((&(( &( "vy" ) )->ₛ "s6")) # Float  |-> (sqrt_active (6) (retval) ((sqrt_read_at (6) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t6))) (t6_2)))
  **  ((&(( &( "vy" ) )->ₛ "s7")) # Float  |-> (sqrt_active (7) (retval) ((sqrt_read_at (7) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t7))) (t7_2)))
  **  ((&(( &( "vy" ) )->ₛ "s8")) # Float  |-> (sqrt_active (8) (retval) ((sqrt_read_at (8) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t8))) (t8_2)))
  **  ((&(( &( "vy" ) )->ₛ "s9")) # Float  |-> (sqrt_active (9) (retval) ((sqrt_read_at (9) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t9))) (t9_2)))
  **  ((&(( &( "vy" ) )->ₛ "s10")) # Float  |-> (sqrt_active (10) (retval) ((sqrt_read_at (10) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t10))) (t10_2)))
  **  ((&(( &( "vy" ) )->ₛ "s11")) # Float  |-> (sqrt_active (11) (retval) ((sqrt_read_at (11) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t11))) (t11_2)))
  **  ((&(( &( "vy" ) )->ₛ "s12")) # Float  |-> (sqrt_active (12) (retval) ((sqrt_read_at (12) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t12))) (t12_2)))
  **  ((&(( &( "vy" ) )->ₛ "s13")) # Float  |-> (sqrt_active (13) (retval) ((sqrt_read_at (13) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t13))) (t13_2)))
  **  ((&(( &( "vy" ) )->ₛ "s14")) # Float  |-> (sqrt_active (14) (retval) ((sqrt_read_at (14) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t14))) (t14_2)))
  **  ((&(( &( "vy" ) )->ₛ "s15")) # Float  |-> (sqrt_active (15) (retval) ((sqrt_read_at (15) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t15))) (t15_2)))
  **  ((&(( &( "vy" ) )->ₛ "s16")) # Float  |-> (sqrt_active (16) (retval) ((sqrt_read_at (16) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t16))) (t16_2)))
  **  ((&(( &( "vy" ) )->ₛ "s17")) # Float  |-> (sqrt_active (17) (retval) ((sqrt_read_at (17) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t17))) (t17_2)))
  **  ((&(( &( "vy" ) )->ₛ "s18")) # Float  |-> (sqrt_active (18) (retval) ((sqrt_read_at (18) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t18))) (t18_2)))
  **  ((&(( &( "vy" ) )->ₛ "s19")) # Float  |-> (sqrt_active (19) (retval) ((sqrt_read_at (19) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t19))) (t19_2)))
  **  ((&(( &( "vy" ) )->ₛ "s20")) # Float  |-> (sqrt_active (20) (retval) ((sqrt_read_at (20) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t20))) (t20_2)))
  **  ((&(( &( "vy" ) )->ₛ "s21")) # Float  |-> (sqrt_active (21) (retval) ((sqrt_read_at (21) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t21))) (t21_2)))
  **  ((&(( &( "vy" ) )->ₛ "s22")) # Float  |-> (sqrt_active (22) (retval) ((sqrt_read_at (22) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t22))) (t22_2)))
  **  ((&(( &( "vy" ) )->ₛ "s23")) # Float  |-> (sqrt_active (23) (retval) ((sqrt_read_at (23) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t23))) (t23_2)))
  **  ((&(( &( "vy" ) )->ₛ "s24")) # Float  |-> (sqrt_active (24) (retval) ((sqrt_read_at (24) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t24))) (t24_2)))
  **  ((&(( &( "vy" ) )->ₛ "s25")) # Float  |-> (sqrt_active (25) (retval) ((sqrt_read_at (25) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t25))) (t25_2)))
  **  ((&(( &( "vy" ) )->ₛ "s26")) # Float  |-> (sqrt_active (26) (retval) ((sqrt_read_at (26) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t26))) (t26_2)))
  **  ((&(( &( "vy" ) )->ₛ "s27")) # Float  |-> (sqrt_active (27) (retval) ((sqrt_read_at (27) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t27))) (t27_2)))
  **  ((&(( &( "vy" ) )->ₛ "s28")) # Float  |-> (sqrt_active (28) (retval) ((sqrt_read_at (28) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t28))) (t28_2)))
  **  ((&(( &( "vy" ) )->ₛ "s29")) # Float  |-> (sqrt_active (29) (retval) ((sqrt_read_at (29) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t29))) (t29_2)))
  **  ((&(( &( "vy" ) )->ₛ "s30")) # Float  |-> (sqrt_active (30) (retval) ((sqrt_read_at (30) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t30))) (t30_2)))
  **  ((&(( &( "vy" ) )->ₛ "s31")) # Float  |-> (sqrt_active (31) (retval) ((sqrt_read_at (31) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t31))) (t31_2)))
  **  (FloatArray.undef_full output retval )
  **  (FloatArray.undef_full (output + (retval * sizeof(FLOAT))) (((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - n ) ) - retval ) )
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - n ) (sqrt_rvv_values (((batch_pre ÷ 4 ) - n )) (A)) )
  **  ((&(( &( "vx" ) )->ₛ "s0")) # Float  |-> (sqrt_read_at (0) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t0)))
  **  ((&(( &( "vx" ) )->ₛ "s1")) # Float  |-> (sqrt_read_at (1) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t1)))
  **  ((&(( &( "vx" ) )->ₛ "s2")) # Float  |-> (sqrt_read_at (2) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t2)))
  **  ((&(( &( "vx" ) )->ₛ "s3")) # Float  |-> (sqrt_read_at (3) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t3)))
  **  ((&(( &( "vx" ) )->ₛ "s4")) # Float  |-> (sqrt_read_at (4) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t4)))
  **  ((&(( &( "vx" ) )->ₛ "s5")) # Float  |-> (sqrt_read_at (5) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t5)))
  **  ((&(( &( "vx" ) )->ₛ "s6")) # Float  |-> (sqrt_read_at (6) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t6)))
  **  ((&(( &( "vx" ) )->ₛ "s7")) # Float  |-> (sqrt_read_at (7) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t7)))
  **  ((&(( &( "vx" ) )->ₛ "s8")) # Float  |-> (sqrt_read_at (8) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t8)))
  **  ((&(( &( "vx" ) )->ₛ "s9")) # Float  |-> (sqrt_read_at (9) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t9)))
  **  ((&(( &( "vx" ) )->ₛ "s10")) # Float  |-> (sqrt_read_at (10) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t10)))
  **  ((&(( &( "vx" ) )->ₛ "s11")) # Float  |-> (sqrt_read_at (11) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t11)))
  **  ((&(( &( "vx" ) )->ₛ "s12")) # Float  |-> (sqrt_read_at (12) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t12)))
  **  ((&(( &( "vx" ) )->ₛ "s13")) # Float  |-> (sqrt_read_at (13) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t13)))
  **  ((&(( &( "vx" ) )->ₛ "s14")) # Float  |-> (sqrt_read_at (14) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t14)))
  **  ((&(( &( "vx" ) )->ₛ "s15")) # Float  |-> (sqrt_read_at (15) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t15)))
  **  ((&(( &( "vx" ) )->ₛ "s16")) # Float  |-> (sqrt_read_at (16) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t16)))
  **  ((&(( &( "vx" ) )->ₛ "s17")) # Float  |-> (sqrt_read_at (17) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t17)))
  **  ((&(( &( "vx" ) )->ₛ "s18")) # Float  |-> (sqrt_read_at (18) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t18)))
  **  ((&(( &( "vx" ) )->ₛ "s19")) # Float  |-> (sqrt_read_at (19) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t19)))
  **  ((&(( &( "vx" ) )->ₛ "s20")) # Float  |-> (sqrt_read_at (20) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t20)))
  **  ((&(( &( "vx" ) )->ₛ "s21")) # Float  |-> (sqrt_read_at (21) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t21)))
  **  ((&(( &( "vx" ) )->ₛ "s22")) # Float  |-> (sqrt_read_at (22) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t22)))
  **  ((&(( &( "vx" ) )->ₛ "s23")) # Float  |-> (sqrt_read_at (23) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t23)))
  **  ((&(( &( "vx" ) )->ₛ "s24")) # Float  |-> (sqrt_read_at (24) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t24)))
  **  ((&(( &( "vx" ) )->ₛ "s25")) # Float  |-> (sqrt_read_at (25) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t25)))
  **  ((&(( &( "vx" ) )->ₛ "s26")) # Float  |-> (sqrt_read_at (26) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t26)))
  **  ((&(( &( "vx" ) )->ₛ "s27")) # Float  |-> (sqrt_read_at (27) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t27)))
  **  ((&(( &( "vx" ) )->ₛ "s28")) # Float  |-> (sqrt_read_at (28) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t28)))
  **  ((&(( &( "vx" ) )->ₛ "s29")) # Float  |-> (sqrt_read_at (29) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t29)))
  **  ((&(( &( "vx" ) )->ₛ "s30")) # Float  |-> (sqrt_read_at (30) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t30)))
  **  ((&(( &( "vx" ) )->ₛ "s31")) # Float  |-> (sqrt_read_at (31) (retval) (((batch_pre ÷ 4 ) - n )) (A) (t31)))
.

Definition test_rvv_partial_solve_wit_20 := test_rvv_partial_solve_wit_20_pure -> test_rvv_partial_solve_wit_20_aux.

Module Type VC_Correct.

Include sqrt_arrays_Strategy_Correct.

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
Axiom proof_of_test_rvv_entail_wit_1 : test_rvv_entail_wit_1.
Axiom proof_of_test_rvv_entail_wit_2 : test_rvv_entail_wit_2.
Axiom proof_of_test_rvv_entail_wit_3_1 : test_rvv_entail_wit_3_1.
Axiom proof_of_test_rvv_entail_wit_3_2 : test_rvv_entail_wit_3_2.
Axiom proof_of_test_rvv_entail_wit_3_3 : test_rvv_entail_wit_3_3.
Axiom proof_of_test_rvv_return_wit_1 : test_rvv_return_wit_1.
Axiom proof_of_test_rvv_partial_solve_wit_1_pure : test_rvv_partial_solve_wit_1_pure.
Axiom proof_of_test_rvv_partial_solve_wit_1 : test_rvv_partial_solve_wit_1.
Axiom proof_of_test_rvv_partial_solve_wit_2_pure : test_rvv_partial_solve_wit_2_pure.
Axiom proof_of_test_rvv_partial_solve_wit_2 : test_rvv_partial_solve_wit_2.
Axiom proof_of_test_rvv_partial_solve_wit_3_pure : test_rvv_partial_solve_wit_3_pure.
Axiom proof_of_test_rvv_partial_solve_wit_3 : test_rvv_partial_solve_wit_3.
Axiom proof_of_test_rvv_partial_solve_wit_4_pure : test_rvv_partial_solve_wit_4_pure.
Axiom proof_of_test_rvv_partial_solve_wit_4 : test_rvv_partial_solve_wit_4.
Axiom proof_of_test_rvv_partial_solve_wit_5 : test_rvv_partial_solve_wit_5.
Axiom proof_of_test_rvv_partial_solve_wit_6_pure : test_rvv_partial_solve_wit_6_pure.
Axiom proof_of_test_rvv_partial_solve_wit_6 : test_rvv_partial_solve_wit_6.
Axiom proof_of_test_rvv_partial_solve_wit_7_pure : test_rvv_partial_solve_wit_7_pure.
Axiom proof_of_test_rvv_partial_solve_wit_7 : test_rvv_partial_solve_wit_7.
Axiom proof_of_test_rvv_partial_solve_wit_8_pure : test_rvv_partial_solve_wit_8_pure.
Axiom proof_of_test_rvv_partial_solve_wit_8 : test_rvv_partial_solve_wit_8.
Axiom proof_of_test_rvv_partial_solve_wit_9 : test_rvv_partial_solve_wit_9.
Axiom proof_of_test_rvv_partial_solve_wit_10 : test_rvv_partial_solve_wit_10.
Axiom proof_of_test_rvv_partial_solve_wit_11 : test_rvv_partial_solve_wit_11.
Axiom proof_of_test_rvv_partial_solve_wit_12_pure : test_rvv_partial_solve_wit_12_pure.
Axiom proof_of_test_rvv_partial_solve_wit_12 : test_rvv_partial_solve_wit_12.
Axiom proof_of_test_rvv_partial_solve_wit_13_pure : test_rvv_partial_solve_wit_13_pure.
Axiom proof_of_test_rvv_partial_solve_wit_13 : test_rvv_partial_solve_wit_13.
Axiom proof_of_test_rvv_partial_solve_wit_14_pure : test_rvv_partial_solve_wit_14_pure.
Axiom proof_of_test_rvv_partial_solve_wit_14 : test_rvv_partial_solve_wit_14.
Axiom proof_of_test_rvv_partial_solve_wit_15 : test_rvv_partial_solve_wit_15.
Axiom proof_of_test_rvv_partial_solve_wit_16 : test_rvv_partial_solve_wit_16.
Axiom proof_of_test_rvv_partial_solve_wit_17 : test_rvv_partial_solve_wit_17.
Axiom proof_of_test_rvv_partial_solve_wit_18_pure : test_rvv_partial_solve_wit_18_pure.
Axiom proof_of_test_rvv_partial_solve_wit_18 : test_rvv_partial_solve_wit_18.
Axiom proof_of_test_rvv_partial_solve_wit_19_pure : test_rvv_partial_solve_wit_19_pure.
Axiom proof_of_test_rvv_partial_solve_wit_19 : test_rvv_partial_solve_wit_19.
Axiom proof_of_test_rvv_partial_solve_wit_20_pure : test_rvv_partial_solve_wit_20_pure.
Axiom proof_of_test_rvv_partial_solve_wit_20 : test_rvv_partial_solve_wit_20.

End VC_Correct.
