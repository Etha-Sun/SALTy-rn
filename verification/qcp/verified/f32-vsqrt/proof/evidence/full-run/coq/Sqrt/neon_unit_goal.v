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

(*----- Function test_neon -----*)

Definition test_neon_safety_wit_1 := 
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

Definition test_neon_safety_wit_2 := 
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

Definition test_neon_safety_wit_3 := 
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

Definition test_neon_safety_wit_4 := 
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

Definition test_neon_safety_wit_5 := 
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

Definition test_neon_safety_wit_6 := 
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

Definition test_neon_safety_wit_7 := 
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

Definition test_neon_safety_wit_8 := 
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

Definition test_neon_safety_wit_9 := 
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

Definition test_neon_safety_wit_10 := 
forall (unused_params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (output: Z) (input: Z) (batch: Z) (PreH1 : (sizeof(FLOAT) = 4)) (PreH2 : (batch = (4 * (batch ÷ 4 ) ))) (PreH3 : ((batch % ( 4 ) ) = 0)) (PreH4 : ((batch % ( sizeof(FLOAT) ) ) = 0)) (PreH5 : (0 < (batch_pre ÷ 4 ))) (PreH6 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH7 : (0 <= (batch ÷ 4 ))) (PreH8 : ((batch ÷ 4 ) <= (batch_pre ÷ 4 ))) (PreH9 : (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH10 : (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) ,
  ((( &( "unused_params" ) )) # Ptr  |-> unused_params_pre)
  **  ((( &( "batch" ) )) # UInt64  |-> batch)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) )
|--
  “ (4 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 4) ”
.

Definition test_neon_safety_wit_11 := 
forall (unused_params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (output: Z) (input: Z) (batch: Z) (PreH1 : (batch >= (4 * sizeof(FLOAT) ))) (PreH2 : (sizeof(FLOAT) = 4)) (PreH3 : (batch = (4 * (batch ÷ 4 ) ))) (PreH4 : ((batch % ( 4 ) ) = 0)) (PreH5 : ((batch % ( sizeof(FLOAT) ) ) = 0)) (PreH6 : (0 < (batch_pre ÷ 4 ))) (PreH7 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH8 : (0 <= (batch ÷ 4 ))) (PreH9 : ((batch ÷ 4 ) <= (batch_pre ÷ 4 ))) (PreH10 : (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH11 : (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) ,
  ((&(( &( "vx" ) )->ₛ "s3")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s2")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s1")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s0")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  ((( &( "unused_params" ) )) # Ptr  |-> unused_params_pre)
  **  ((( &( "batch" ) )) # UInt64  |-> batch)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) )
|--
  “ (4 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 4) ”
.

Definition test_neon_safety_wit_12 := 
forall (unused_params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (output: Z) (input: Z) (batch: Z) (PreH1 : (batch >= (4 * sizeof(FLOAT) ))) (PreH2 : (sizeof(FLOAT) = 4)) (PreH3 : (batch = (4 * (batch ÷ 4 ) ))) (PreH4 : ((batch % ( 4 ) ) = 0)) (PreH5 : ((batch % ( sizeof(FLOAT) ) ) = 0)) (PreH6 : (0 < (batch_pre ÷ 4 ))) (PreH7 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH8 : (0 <= (batch ÷ 4 ))) (PreH9 : ((batch ÷ 4 ) <= (batch_pre ÷ 4 ))) (PreH10 : (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH11 : (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) ,
  ((&(( &( "vy" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s2")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s3")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))))
  **  (FloatArray.full output 4 (sqrt_pack4 ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A))))) ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A))))) ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A))))) ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))))) )
  **  (FloatArray.undef_full (output + (4 * sizeof(FLOAT))) (((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) - 4 ) )
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  ((( &( "unused_params" ) )) # Ptr  |-> unused_params_pre)
  **  ((( &( "batch" ) )) # UInt64  |-> batch)
  **  ((( &( "input" ) )) # Ptr  |-> (input + (4 * sizeof(FLOAT))))
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
  **  ((&(( &( "vx" ) )->ₛ "s0")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s1")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s2")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s3")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))
|--
  “ (4 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 4) ”
.

Definition test_neon_safety_wit_13 := 
forall (unused_params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (output: Z) (input: Z) (batch: Z) (PreH1 : (batch >= (4 * sizeof(FLOAT) ))) (PreH2 : (sizeof(FLOAT) = 4)) (PreH3 : (batch = (4 * (batch ÷ 4 ) ))) (PreH4 : ((batch % ( 4 ) ) = 0)) (PreH5 : ((batch % ( sizeof(FLOAT) ) ) = 0)) (PreH6 : (0 < (batch_pre ÷ 4 ))) (PreH7 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH8 : (0 <= (batch ÷ 4 ))) (PreH9 : ((batch ÷ 4 ) <= (batch_pre ÷ 4 ))) (PreH10 : (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH11 : (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) ,
  (FloatArray.full output 4 (sqrt_pack4 ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A))))) ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A))))) ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A))))) ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))))) )
  **  (FloatArray.undef_full (output + (4 * sizeof(FLOAT))) (((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) - 4 ) )
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  ((( &( "unused_params" ) )) # Ptr  |-> unused_params_pre)
  **  ((( &( "batch" ) )) # UInt64  |-> batch)
  **  ((( &( "input" ) )) # Ptr  |-> (input + (4 * sizeof(FLOAT))))
  **  ((( &( "output" ) )) # Ptr  |-> (output + (4 * sizeof(FLOAT))))
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
|--
  “ (4 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 4) ”
.

Definition test_neon_safety_wit_14 := 
forall (unused_params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (output: Z) (input: Z) (batch: Z) (PreH1 : (batch < (4 * sizeof(FLOAT) ))) (PreH2 : (sizeof(FLOAT) = 4)) (PreH3 : (batch = (4 * (batch ÷ 4 ) ))) (PreH4 : ((batch % ( 4 ) ) = 0)) (PreH5 : ((batch % ( sizeof(FLOAT) ) ) = 0)) (PreH6 : (0 < (batch_pre ÷ 4 ))) (PreH7 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH8 : (0 <= (batch ÷ 4 ))) (PreH9 : ((batch ÷ 4 ) <= (batch_pre ÷ 4 ))) (PreH10 : (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH11 : (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) ,
  ((( &( "unused_params" ) )) # Ptr  |-> unused_params_pre)
  **  ((( &( "batch" ) )) # UInt64  |-> batch)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition test_neon_safety_wit_15 := 
forall (unused_params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (batch: Z) (input: Z) (output: Z) (PreH1 : (sizeof(FLOAT) = 4)) (PreH2 : (batch = (4 * (batch ÷ 4 ) ))) (PreH3 : ((batch % ( 4 ) ) = 0)) (PreH4 : ((batch % ( sizeof(FLOAT) ) ) = 0)) (PreH5 : (0 < (batch_pre ÷ 4 ))) (PreH6 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH7 : (0 <= (batch ÷ 4 ))) (PreH8 : ((batch ÷ 4 ) <= (batch_pre ÷ 4 ))) (PreH9 : (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH10 : (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH11 : (batch = 4)) ,
  ((( &( "unused_params" ) )) # Ptr  |-> unused_params_pre)
  **  ((( &( "batch" ) )) # UInt64  |-> batch)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) )
  **  ((&(( &( "vx" ) )->ₛ "s0")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s1")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s2")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s3")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))
  **  ((&(( &( "vy" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s2")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s3")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))))
  **  ((&(( &( "vy_lo" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  ((&(( &( "vy_lo" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition test_neon_safety_wit_16 := 
forall (unused_params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (batch: Z) (input: Z) (output: Z) (PreH1 : (sizeof(FLOAT) = 4)) (PreH2 : (batch = (4 * (batch ÷ 4 ) ))) (PreH3 : ((batch % ( 4 ) ) = 0)) (PreH4 : ((batch % ( sizeof(FLOAT) ) ) = 0)) (PreH5 : (0 < (batch_pre ÷ 4 ))) (PreH6 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH7 : (0 <= (batch ÷ 4 ))) (PreH8 : ((batch ÷ 4 ) <= (batch_pre ÷ 4 ))) (PreH9 : (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH10 : (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH11 : (batch = 8)) ,
  ((( &( "unused_params" ) )) # Ptr  |-> unused_params_pre)
  **  ((( &( "batch" ) )) # UInt64  |-> batch)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) )
  **  ((&(( &( "vx" ) )->ₛ "s0")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s1")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s2")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s3")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))
  **  ((&(( &( "vy" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s2")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s3")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))))
  **  ((&(( &( "vy_lo" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  ((&(( &( "vy_lo" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition test_neon_safety_wit_17 := 
forall (unused_params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (batch: Z) (input: Z) (output: Z) (PreH1 : (sizeof(FLOAT) = 4)) (PreH2 : (batch = (4 * (batch ÷ 4 ) ))) (PreH3 : ((batch % ( 4 ) ) = 0)) (PreH4 : ((batch % ( sizeof(FLOAT) ) ) = 0)) (PreH5 : (0 < (batch_pre ÷ 4 ))) (PreH6 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH7 : (0 <= (batch ÷ 4 ))) (PreH8 : ((batch ÷ 4 ) <= (batch_pre ÷ 4 ))) (PreH9 : (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH10 : (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH11 : (batch = 12)) ,
  ((( &( "unused_params" ) )) # Ptr  |-> unused_params_pre)
  **  ((( &( "batch" ) )) # UInt64  |-> batch)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) )
  **  ((&(( &( "vx" ) )->ₛ "s0")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s1")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s2")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s3")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))
  **  ((&(( &( "vy" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s2")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s3")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))))
  **  ((&(( &( "vy_lo" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  ((&(( &( "vy_lo" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition test_neon_safety_wit_18 := 
forall (unused_params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (batch: Z) (input: Z) (output: Z) (PreH1 : (sizeof(FLOAT) = 4)) (PreH2 : (batch = (4 * (batch ÷ 4 ) ))) (PreH3 : ((batch % ( 4 ) ) = 0)) (PreH4 : ((batch % ( sizeof(FLOAT) ) ) = 0)) (PreH5 : (0 < (batch_pre ÷ 4 ))) (PreH6 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH7 : (0 <= (batch ÷ 4 ))) (PreH8 : ((batch ÷ 4 ) <= (batch_pre ÷ 4 ))) (PreH9 : (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH10 : (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH11 : (batch = 8)) (PreH12 : ((Z.land batch (2 * sizeof(FLOAT) )) = 0)) ,
  ((( &( "unused_params" ) )) # Ptr  |-> unused_params_pre)
  **  ((( &( "batch" ) )) # UInt64  |-> batch)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) )
  **  ((&(( &( "vx" ) )->ₛ "s0")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s1")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s2")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s3")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))
  **  ((&(( &( "vy" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s2")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s3")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))))
  **  ((&(( &( "vy_lo" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  ((&(( &( "vy_lo" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))
|--
  “ False ”
.

Definition test_neon_safety_wit_19 := 
forall (unused_params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (batch: Z) (input: Z) (output: Z) (PreH1 : (sizeof(FLOAT) = 4)) (PreH2 : (batch = (4 * (batch ÷ 4 ) ))) (PreH3 : ((batch % ( 4 ) ) = 0)) (PreH4 : ((batch % ( sizeof(FLOAT) ) ) = 0)) (PreH5 : (0 < (batch_pre ÷ 4 ))) (PreH6 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH7 : (0 <= (batch ÷ 4 ))) (PreH8 : ((batch ÷ 4 ) <= (batch_pre ÷ 4 ))) (PreH9 : (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH10 : (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH11 : (batch = 12)) (PreH12 : ((Z.land batch (2 * sizeof(FLOAT) )) = 0)) ,
  ((( &( "unused_params" ) )) # Ptr  |-> unused_params_pre)
  **  ((( &( "batch" ) )) # UInt64  |-> batch)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) )
  **  ((&(( &( "vx" ) )->ₛ "s0")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s1")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s2")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s3")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))
  **  ((&(( &( "vy" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s2")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s3")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))))
  **  ((&(( &( "vy_lo" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  ((&(( &( "vy_lo" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))
|--
  “ False ”
.

Definition test_neon_safety_wit_20 := 
forall (unused_params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (batch: Z) (input: Z) (output: Z) (PreH1 : (sizeof(FLOAT) = 4)) (PreH2 : (batch = (4 * (batch ÷ 4 ) ))) (PreH3 : ((batch % ( 4 ) ) = 0)) (PreH4 : ((batch % ( sizeof(FLOAT) ) ) = 0)) (PreH5 : (0 < (batch_pre ÷ 4 ))) (PreH6 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH7 : (0 <= (batch ÷ 4 ))) (PreH8 : ((batch ÷ 4 ) <= (batch_pre ÷ 4 ))) (PreH9 : (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH10 : (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH11 : (batch = 4)) (PreH12 : ((Z.land batch (2 * sizeof(FLOAT) )) <> 0)) ,
  ((( &( "unused_params" ) )) # Ptr  |-> unused_params_pre)
  **  ((( &( "batch" ) )) # UInt64  |-> batch)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) )
  **  ((&(( &( "vx" ) )->ₛ "s0")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s1")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s2")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s3")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))
  **  ((&(( &( "vy" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s2")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s3")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))))
  **  ((&(( &( "vy_lo" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  ((&(( &( "vy_lo" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))
|--
  “ False ”
.

Definition test_neon_safety_wit_21 := 
forall (unused_params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (batch: Z) (input: Z) (output: Z) (PreH1 : (sizeof(FLOAT) = 4)) (PreH2 : (batch = (4 * (batch ÷ 4 ) ))) (PreH3 : ((batch % ( 4 ) ) = 0)) (PreH4 : ((batch % ( sizeof(FLOAT) ) ) = 0)) (PreH5 : (0 < (batch_pre ÷ 4 ))) (PreH6 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH7 : (0 <= (batch ÷ 4 ))) (PreH8 : ((batch ÷ 4 ) <= (batch_pre ÷ 4 ))) (PreH9 : (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH10 : (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH11 : (batch = 8)) (PreH12 : ((Z.land batch (2 * sizeof(FLOAT) )) <> 0)) ,
  ((&(( &( "vy_lo" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  ((&(( &( "vy_lo" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))
  **  (FloatArray.full output 2 (sqrt_pack2 ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A))))) ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))) )
  **  (FloatArray.undef_full (output + (2 * sizeof(FLOAT))) (((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) - 2 ) )
  **  ((( &( "unused_params" ) )) # Ptr  |-> unused_params_pre)
  **  ((( &( "batch" ) )) # UInt64  |-> batch)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
  **  ((&(( &( "vx" ) )->ₛ "s0")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s1")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s2")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s3")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))
  **  ((&(( &( "vy" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s2")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s3")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))))
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition test_neon_safety_wit_22 := 
forall (unused_params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (batch: Z) (input: Z) (output: Z) (PreH1 : (sizeof(FLOAT) = 4)) (PreH2 : (batch = (4 * (batch ÷ 4 ) ))) (PreH3 : ((batch % ( 4 ) ) = 0)) (PreH4 : ((batch % ( sizeof(FLOAT) ) ) = 0)) (PreH5 : (0 < (batch_pre ÷ 4 ))) (PreH6 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH7 : (0 <= (batch ÷ 4 ))) (PreH8 : ((batch ÷ 4 ) <= (batch_pre ÷ 4 ))) (PreH9 : (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH10 : (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH11 : (batch = 12)) (PreH12 : ((Z.land batch (2 * sizeof(FLOAT) )) <> 0)) ,
  ((&(( &( "vy_lo" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  ((&(( &( "vy_lo" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))
  **  (FloatArray.full output 2 (sqrt_pack2 ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A))))) ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))) )
  **  (FloatArray.undef_full (output + (2 * sizeof(FLOAT))) (((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) - 2 ) )
  **  ((( &( "unused_params" ) )) # Ptr  |-> unused_params_pre)
  **  ((( &( "batch" ) )) # UInt64  |-> batch)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
  **  ((&(( &( "vx" ) )->ₛ "s0")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s1")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s2")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s3")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))
  **  ((&(( &( "vy" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s2")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s3")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))))
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition test_neon_safety_wit_23 := 
forall (unused_params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (batch: Z) (input: Z) (output: Z) (PreH1 : (sizeof(FLOAT) = 4)) (PreH2 : (batch = (4 * (batch ÷ 4 ) ))) (PreH3 : ((batch % ( 4 ) ) = 0)) (PreH4 : ((batch % ( sizeof(FLOAT) ) ) = 0)) (PreH5 : (0 < (batch_pre ÷ 4 ))) (PreH6 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH7 : (0 <= (batch ÷ 4 ))) (PreH8 : ((batch ÷ 4 ) <= (batch_pre ÷ 4 ))) (PreH9 : (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH10 : (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH11 : (batch = 12)) (PreH12 : ((Z.land batch (2 * sizeof(FLOAT) )) <> 0)) ,
  ((&(( &( "vy_lo" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))))
  **  ((&(( &( "vy_lo" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))))
  **  (FloatArray.full output 2 (sqrt_pack2 ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A))))) ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))) )
  **  (FloatArray.undef_full (output + (2 * sizeof(FLOAT))) (((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) - 2 ) )
  **  ((( &( "unused_params" ) )) # Ptr  |-> unused_params_pre)
  **  ((( &( "batch" ) )) # UInt64  |-> batch)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> (output + (2 * sizeof(FLOAT))))
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
  **  ((&(( &( "vx" ) )->ₛ "s0")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s1")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s2")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s3")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))
  **  ((&(( &( "vy" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s2")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s3")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))))
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition test_neon_safety_wit_24 := 
forall (unused_params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (batch: Z) (input: Z) (output: Z) (PreH1 : (sizeof(FLOAT) = 4)) (PreH2 : (batch = (4 * (batch ÷ 4 ) ))) (PreH3 : ((batch % ( 4 ) ) = 0)) (PreH4 : ((batch % ( sizeof(FLOAT) ) ) = 0)) (PreH5 : (0 < (batch_pre ÷ 4 ))) (PreH6 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH7 : (0 <= (batch ÷ 4 ))) (PreH8 : ((batch ÷ 4 ) <= (batch_pre ÷ 4 ))) (PreH9 : (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH10 : (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH11 : (batch = 8)) (PreH12 : ((Z.land batch (2 * sizeof(FLOAT) )) <> 0)) ,
  ((&(( &( "vy_lo" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))))
  **  ((&(( &( "vy_lo" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))))
  **  (FloatArray.full output 2 (sqrt_pack2 ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A))))) ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))) )
  **  (FloatArray.undef_full (output + (2 * sizeof(FLOAT))) (((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) - 2 ) )
  **  ((( &( "unused_params" ) )) # Ptr  |-> unused_params_pre)
  **  ((( &( "batch" ) )) # UInt64  |-> batch)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> (output + (2 * sizeof(FLOAT))))
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
  **  ((&(( &( "vx" ) )->ₛ "s0")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s1")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s2")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s3")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))
  **  ((&(( &( "vy" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s2")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s3")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))))
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition test_neon_safety_wit_25 := 
forall (unused_params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (batch: Z) (input: Z) (output: Z) (PreH1 : (sizeof(FLOAT) = 4)) (PreH2 : (batch = (4 * (batch ÷ 4 ) ))) (PreH3 : ((batch % ( 4 ) ) = 0)) (PreH4 : ((batch % ( sizeof(FLOAT) ) ) = 0)) (PreH5 : (0 < (batch_pre ÷ 4 ))) (PreH6 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH7 : (0 <= (batch ÷ 4 ))) (PreH8 : ((batch ÷ 4 ) <= (batch_pre ÷ 4 ))) (PreH9 : (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH10 : (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH11 : (batch = 4)) (PreH12 : ((Z.land batch (2 * sizeof(FLOAT) )) = 0)) ,
  ((( &( "unused_params" ) )) # Ptr  |-> unused_params_pre)
  **  ((( &( "batch" ) )) # UInt64  |-> batch)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) )
  **  ((&(( &( "vx" ) )->ₛ "s0")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s1")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s2")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s3")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))
  **  ((&(( &( "vy" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s2")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s3")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))))
  **  ((&(( &( "vy_lo" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  ((&(( &( "vy_lo" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition test_neon_safety_wit_26 := 
forall (unused_params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (batch: Z) (input: Z) (output: Z) (PreH1 : (sizeof(FLOAT) = 4)) (PreH2 : (batch = (4 * (batch ÷ 4 ) ))) (PreH3 : ((batch % ( 4 ) ) = 0)) (PreH4 : ((batch % ( sizeof(FLOAT) ) ) = 0)) (PreH5 : (0 < (batch_pre ÷ 4 ))) (PreH6 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH7 : (0 <= (batch ÷ 4 ))) (PreH8 : ((batch ÷ 4 ) <= (batch_pre ÷ 4 ))) (PreH9 : (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH10 : (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH11 : (batch = 12)) (PreH12 : ((Z.land batch (2 * sizeof(FLOAT) )) <> 0)) (PreH13 : ((Z.land batch (1 * sizeof(FLOAT) )) = 0)) ,
  ((&(( &( "vy_lo" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))))
  **  ((&(( &( "vy_lo" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))))
  **  (FloatArray.full output 2 (sqrt_pack2 ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A))))) ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))) )
  **  (FloatArray.undef_full (output + (2 * sizeof(FLOAT))) (((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) - 2 ) )
  **  ((( &( "unused_params" ) )) # Ptr  |-> unused_params_pre)
  **  ((( &( "batch" ) )) # UInt64  |-> batch)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> (output + (2 * sizeof(FLOAT))))
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
  **  ((&(( &( "vx" ) )->ₛ "s0")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s1")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s2")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s3")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))
  **  ((&(( &( "vy" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s2")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s3")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))))
|--
  “ False ”
.

Definition test_neon_safety_wit_27 := 
forall (unused_params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (batch: Z) (input: Z) (output: Z) (PreH1 : (sizeof(FLOAT) = 4)) (PreH2 : (batch = (4 * (batch ÷ 4 ) ))) (PreH3 : ((batch % ( 4 ) ) = 0)) (PreH4 : ((batch % ( sizeof(FLOAT) ) ) = 0)) (PreH5 : (0 < (batch_pre ÷ 4 ))) (PreH6 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH7 : (0 <= (batch ÷ 4 ))) (PreH8 : ((batch ÷ 4 ) <= (batch_pre ÷ 4 ))) (PreH9 : (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH10 : (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH11 : (batch = 4)) (PreH12 : ((Z.land batch (2 * sizeof(FLOAT) )) = 0)) (PreH13 : ((Z.land batch (1 * sizeof(FLOAT) )) = 0)) ,
  ((( &( "unused_params" ) )) # Ptr  |-> unused_params_pre)
  **  ((( &( "batch" ) )) # UInt64  |-> batch)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) )
  **  ((&(( &( "vx" ) )->ₛ "s0")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s1")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s2")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s3")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))
  **  ((&(( &( "vy" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s2")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s3")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))))
  **  ((&(( &( "vy_lo" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  ((&(( &( "vy_lo" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))
|--
  “ False ”
.

Definition test_neon_safety_wit_28 := 
forall (unused_params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (batch: Z) (input: Z) (output: Z) (PreH1 : (sizeof(FLOAT) = 4)) (PreH2 : (batch = (4 * (batch ÷ 4 ) ))) (PreH3 : ((batch % ( 4 ) ) = 0)) (PreH4 : ((batch % ( sizeof(FLOAT) ) ) = 0)) (PreH5 : (0 < (batch_pre ÷ 4 ))) (PreH6 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH7 : (0 <= (batch ÷ 4 ))) (PreH8 : ((batch ÷ 4 ) <= (batch_pre ÷ 4 ))) (PreH9 : (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH10 : (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH11 : (batch = 8)) (PreH12 : ((Z.land batch (2 * sizeof(FLOAT) )) <> 0)) (PreH13 : ((Z.land batch (1 * sizeof(FLOAT) )) <> 0)) ,
  ((&(( &( "vy_lo" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))))
  **  ((&(( &( "vy_lo" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))))
  **  (FloatArray.full output 2 (sqrt_pack2 ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A))))) ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))) )
  **  (FloatArray.undef_full (output + (2 * sizeof(FLOAT))) (((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) - 2 ) )
  **  ((( &( "unused_params" ) )) # Ptr  |-> unused_params_pre)
  **  ((( &( "batch" ) )) # UInt64  |-> batch)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> (output + (2 * sizeof(FLOAT))))
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
  **  ((&(( &( "vx" ) )->ₛ "s0")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s1")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s2")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s3")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))
  **  ((&(( &( "vy" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s2")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s3")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))))
|--
  “ False ”
.

Definition test_neon_entail_wit_1 := 
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

Definition test_neon_entail_wit_1_split_goal_1 := 
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (PreH1 : (0 < batch_pre)) (PreH2 : (batch_pre <= UINT64_MAX)) (PreH3 : ((batch_pre % ( 4 ) ) = 0)) (PreH4 : (input_pre <> 0)) (PreH5 : (output_pre <> 0)) ,
  ((batch_pre ÷ 4 ) <= 4611686018427387903)
.

Definition test_neon_entail_wit_1_split_goal_2 := 
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (PreH1 : (0 < batch_pre)) (PreH2 : (batch_pre <= UINT64_MAX)) (PreH3 : ((batch_pre % ( 4 ) ) = 0)) (PreH4 : (input_pre <> 0)) (PreH5 : (output_pre <> 0)) ,
  (0 < (batch_pre ÷ 4 ))
.

Definition test_neon_entail_wit_2 := 
(
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (PreH1 : (output_pre <> 0)) (PreH2 : (input_pre <> 0)) (PreH3 : ((batch_pre % ( sizeof(FLOAT) ) ) = 0)) (PreH4 : (batch_pre <> 0)) (PreH5 : (0 < batch_pre)) (PreH6 : (batch_pre <= UINT64_MAX)) (PreH7 : ((batch_pre % ( 4 ) ) = 0)) (PreH8 : (input_pre <> 0)) (PreH9 : (output_pre <> 0)) (PreH10 : (sizeof(FLOAT) = 4)) (PreH11 : ((batch_pre % ( sizeof(FLOAT) ) ) = 0)) (PreH12 : (0 < (batch_pre ÷ 4 ))) (PreH13 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) ,
  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.undef_full output_pre (batch_pre ÷ 4 ) )
|--
  “ (sizeof(FLOAT) = 4) ” 
  &&  “ (batch_pre = (4 * (batch_pre ÷ 4 ) )) ” 
  &&  “ ((batch_pre % ( 4 ) ) = 0) ” 
  &&  “ ((batch_pre % ( sizeof(FLOAT) ) ) = 0) ” 
  &&  “ (0 < (batch_pre ÷ 4 )) ” 
  &&  “ ((batch_pre ÷ 4 ) <= 4611686018427387903) ” 
  &&  “ (0 <= (batch_pre ÷ 4 )) ” 
  &&  “ ((batch_pre ÷ 4 ) <= (batch_pre ÷ 4 )) ” 
  &&  “ (input_pre = (input_pre + (((batch_pre ÷ 4 ) - (batch_pre ÷ 4 ) ) * sizeof(FLOAT)))) ” 
  &&  “ (output_pre = (output_pre + (((batch_pre ÷ 4 ) - (batch_pre ÷ 4 ) ) * sizeof(FLOAT)))) ”
  &&  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch_pre ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch_pre ÷ 4 ) )) (A)) )
  **  (FloatArray.undef_full output_pre ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch_pre ÷ 4 ) ) ) )
) \/
(
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (PreH1 : (output_pre <> 0)) (PreH2 : (input_pre <> 0)) (PreH3 : ((batch_pre % ( sizeof(FLOAT) ) ) = 0)) (PreH4 : (batch_pre <> 0)) (PreH5 : (0 < batch_pre)) (PreH6 : (batch_pre <= UINT64_MAX)) (PreH7 : ((batch_pre % ( 4 ) ) = 0)) (PreH8 : (input_pre <> 0)) (PreH9 : (output_pre <> 0)) (PreH10 : (sizeof(FLOAT) = 4)) (PreH11 : ((batch_pre % ( sizeof(FLOAT) ) ) = 0)) (PreH12 : (0 < (batch_pre ÷ 4 ))) (PreH13 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) ,
  (FloatArray.undef_full (output_pre + (((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch_pre ÷ 4 ) ) ) * sizeof(FLOAT))) ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch_pre ÷ 4 ) ) ) ) )
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
|--
  “ (batch_pre = (4 * (batch_pre ÷ 4 ) )) ”
  &&  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch_pre ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch_pre ÷ 4 ) )) (A)) )
).

Definition test_neon_entail_wit_2_split_goal_1 := 
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (PreH1 : (output_pre <> 0)) (PreH2 : (input_pre <> 0)) (PreH3 : ((batch_pre % ( sizeof(FLOAT) ) ) = 0)) (PreH4 : (batch_pre <> 0)) (PreH5 : (0 < batch_pre)) (PreH6 : (batch_pre <= UINT64_MAX)) (PreH7 : ((batch_pre % ( 4 ) ) = 0)) (PreH8 : (input_pre <> 0)) (PreH9 : (output_pre <> 0)) (PreH10 : (sizeof(FLOAT) = 4)) (PreH11 : ((batch_pre % ( sizeof(FLOAT) ) ) = 0)) (PreH12 : (0 < (batch_pre ÷ 4 ))) (PreH13 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) ,
  (FloatArray.undef_full (output_pre + (((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch_pre ÷ 4 ) ) ) * sizeof(FLOAT))) ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch_pre ÷ 4 ) ) ) ) )
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
|--
  “ (batch_pre = (4 * (batch_pre ÷ 4 ) )) ”
.

Definition test_neon_entail_wit_2_split_goal_spatial := 
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (PreH1 : (output_pre <> 0)) (PreH2 : (input_pre <> 0)) (PreH3 : ((batch_pre % ( sizeof(FLOAT) ) ) = 0)) (PreH4 : (batch_pre <> 0)) (PreH5 : (0 < batch_pre)) (PreH6 : (batch_pre <= UINT64_MAX)) (PreH7 : ((batch_pre % ( 4 ) ) = 0)) (PreH8 : (input_pre <> 0)) (PreH9 : (output_pre <> 0)) (PreH10 : (sizeof(FLOAT) = 4)) (PreH11 : ((batch_pre % ( sizeof(FLOAT) ) ) = 0)) (PreH12 : (0 < (batch_pre ÷ 4 ))) (PreH13 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) ,
  (FloatArray.undef_full (output_pre + (((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch_pre ÷ 4 ) ) ) * sizeof(FLOAT))) ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch_pre ÷ 4 ) ) ) ) )
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
|--
  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch_pre ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch_pre ÷ 4 ) )) (A)) )
.

Definition test_neon_entail_wit_3 := 
(
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (output: Z) (input: Z) (batch: Z) (PreH1 : (batch >= (4 * sizeof(FLOAT) ))) (PreH2 : (sizeof(FLOAT) = 4)) (PreH3 : (batch = (4 * (batch ÷ 4 ) ))) (PreH4 : ((batch % ( 4 ) ) = 0)) (PreH5 : ((batch % ( sizeof(FLOAT) ) ) = 0)) (PreH6 : (0 < (batch_pre ÷ 4 ))) (PreH7 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH8 : (0 <= (batch ÷ 4 ))) (PreH9 : ((batch ÷ 4 ) <= (batch_pre ÷ 4 ))) (PreH10 : (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH11 : (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) ,
  (FloatArray.full output 4 (sqrt_pack4 ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A))))) ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A))))) ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A))))) ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))))) )
  **  (FloatArray.undef_full (output + (4 * sizeof(FLOAT))) (((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) - 4 ) )
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
|--
  “ (sizeof(FLOAT) = 4) ” 
  &&  “ ((batch - (4 * sizeof(FLOAT) ) ) = (4 * ((batch - (4 * sizeof(FLOAT) ) ) ÷ 4 ) )) ” 
  &&  “ (((batch - (4 * sizeof(FLOAT) ) ) % ( 4 ) ) = 0) ” 
  &&  “ (((batch - (4 * sizeof(FLOAT) ) ) % ( sizeof(FLOAT) ) ) = 0) ” 
  &&  “ (0 < (batch_pre ÷ 4 )) ” 
  &&  “ ((batch_pre ÷ 4 ) <= 4611686018427387903) ” 
  &&  “ (0 <= ((batch - (4 * sizeof(FLOAT) ) ) ÷ 4 )) ” 
  &&  “ (((batch - (4 * sizeof(FLOAT) ) ) ÷ 4 ) <= (batch_pre ÷ 4 )) ” 
  &&  “ ((input + (4 * sizeof(FLOAT))) = (input_pre + (((batch_pre ÷ 4 ) - ((batch - (4 * sizeof(FLOAT) ) ) ÷ 4 ) ) * sizeof(FLOAT)))) ” 
  &&  “ ((output + (4 * sizeof(FLOAT))) = (output_pre + (((batch_pre ÷ 4 ) - ((batch - (4 * sizeof(FLOAT) ) ) ÷ 4 ) ) * sizeof(FLOAT)))) ”
  &&  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - ((batch - (4 * sizeof(FLOAT) ) ) ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - ((batch - (4 * sizeof(FLOAT) ) ) ÷ 4 ) )) (A)) )
  **  (FloatArray.undef_full (output + (4 * sizeof(FLOAT))) ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - ((batch - (4 * sizeof(FLOAT) ) ) ÷ 4 ) ) ) )
) \/
(
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (output: Z) (input: Z) (batch: Z) (PreH1 : (batch >= (4 * sizeof(FLOAT) ))) (PreH2 : (sizeof(FLOAT) = 4)) (PreH3 : (batch = (4 * (batch ÷ 4 ) ))) (PreH4 : ((batch % ( 4 ) ) = 0)) (PreH5 : ((batch % ( sizeof(FLOAT) ) ) = 0)) (PreH6 : (0 < (batch_pre ÷ 4 ))) (PreH7 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH8 : (0 <= (batch ÷ 4 ))) (PreH9 : ((batch ÷ 4 ) <= (batch_pre ÷ 4 ))) (PreH10 : (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH11 : (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) ,
  (FloatArray.full output 4 (sqrt_pack4 ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A))))) ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A))))) ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A))))) ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))))) )
  **  (FloatArray.undef_full (output + (4 * sizeof(FLOAT))) (((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) - 4 ) )
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
|--
  “ ((output + (4 * 4)) = (output_pre + (((batch_pre ÷ 4 ) - ((batch - (4 * 4 ) ) ÷ 4 ) ) * 4))) ” 
  &&  “ ((input + (4 * 4)) = (input_pre + (((batch_pre ÷ 4 ) - ((batch - (4 * 4 ) ) ÷ 4 ) ) * 4))) ” 
  &&  “ (((batch - (4 * 4 ) ) ÷ 4 ) <= (batch_pre ÷ 4 )) ” 
  &&  “ (0 <= ((batch - (4 * 4 ) ) ÷ 4 )) ” 
  &&  “ (((batch - (4 * 4 ) ) % ( 4 ) ) = 0) ” 
  &&  “ (((batch - (4 * 4 ) ) % ( 4 ) ) = 0) ” 
  &&  “ ((batch - (4 * 4 ) ) = (4 * ((batch - (4 * 4 ) ) ÷ 4 ) )) ”
  &&  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - ((batch - (4 * sizeof(FLOAT) ) ) ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - ((batch - (4 * sizeof(FLOAT) ) ) ÷ 4 ) )) (A)) )
  **  (FloatArray.undef_full (output + (4 * sizeof(FLOAT))) ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - ((batch - (4 * sizeof(FLOAT) ) ) ÷ 4 ) ) ) )
).

Definition test_neon_entail_wit_3_split_goal_1 := 
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (output: Z) (input: Z) (batch: Z) (PreH1 : (batch >= (4 * sizeof(FLOAT) ))) (PreH2 : (sizeof(FLOAT) = 4)) (PreH3 : (batch = (4 * (batch ÷ 4 ) ))) (PreH4 : ((batch % ( 4 ) ) = 0)) (PreH5 : ((batch % ( sizeof(FLOAT) ) ) = 0)) (PreH6 : (0 < (batch_pre ÷ 4 ))) (PreH7 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH8 : (0 <= (batch ÷ 4 ))) (PreH9 : ((batch ÷ 4 ) <= (batch_pre ÷ 4 ))) (PreH10 : (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH11 : (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) ,
  (FloatArray.full output 4 (sqrt_pack4 ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A))))) ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A))))) ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A))))) ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))))) )
  **  (FloatArray.undef_full (output + (4 * sizeof(FLOAT))) (((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) - 4 ) )
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
|--
  “ ((output + (4 * 4)) = (output_pre + (((batch_pre ÷ 4 ) - ((batch - (4 * 4 ) ) ÷ 4 ) ) * 4))) ”
.

Definition test_neon_entail_wit_3_split_goal_2 := 
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (output: Z) (input: Z) (batch: Z) (PreH1 : (batch >= (4 * sizeof(FLOAT) ))) (PreH2 : (sizeof(FLOAT) = 4)) (PreH3 : (batch = (4 * (batch ÷ 4 ) ))) (PreH4 : ((batch % ( 4 ) ) = 0)) (PreH5 : ((batch % ( sizeof(FLOAT) ) ) = 0)) (PreH6 : (0 < (batch_pre ÷ 4 ))) (PreH7 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH8 : (0 <= (batch ÷ 4 ))) (PreH9 : ((batch ÷ 4 ) <= (batch_pre ÷ 4 ))) (PreH10 : (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH11 : (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) ,
  (FloatArray.full output 4 (sqrt_pack4 ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A))))) ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A))))) ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A))))) ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))))) )
  **  (FloatArray.undef_full (output + (4 * sizeof(FLOAT))) (((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) - 4 ) )
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
|--
  “ ((input + (4 * 4)) = (input_pre + (((batch_pre ÷ 4 ) - ((batch - (4 * 4 ) ) ÷ 4 ) ) * 4))) ”
.

Definition test_neon_entail_wit_3_split_goal_3 := 
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (output: Z) (input: Z) (batch: Z) (PreH1 : (batch >= (4 * sizeof(FLOAT) ))) (PreH2 : (sizeof(FLOAT) = 4)) (PreH3 : (batch = (4 * (batch ÷ 4 ) ))) (PreH4 : ((batch % ( 4 ) ) = 0)) (PreH5 : ((batch % ( sizeof(FLOAT) ) ) = 0)) (PreH6 : (0 < (batch_pre ÷ 4 ))) (PreH7 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH8 : (0 <= (batch ÷ 4 ))) (PreH9 : ((batch ÷ 4 ) <= (batch_pre ÷ 4 ))) (PreH10 : (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH11 : (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) ,
  (FloatArray.full output 4 (sqrt_pack4 ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A))))) ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A))))) ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A))))) ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))))) )
  **  (FloatArray.undef_full (output + (4 * sizeof(FLOAT))) (((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) - 4 ) )
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
|--
  “ (((batch - (4 * 4 ) ) ÷ 4 ) <= (batch_pre ÷ 4 )) ”
.

Definition test_neon_entail_wit_3_split_goal_4 := 
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (output: Z) (input: Z) (batch: Z) (PreH1 : (batch >= (4 * sizeof(FLOAT) ))) (PreH2 : (sizeof(FLOAT) = 4)) (PreH3 : (batch = (4 * (batch ÷ 4 ) ))) (PreH4 : ((batch % ( 4 ) ) = 0)) (PreH5 : ((batch % ( sizeof(FLOAT) ) ) = 0)) (PreH6 : (0 < (batch_pre ÷ 4 ))) (PreH7 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH8 : (0 <= (batch ÷ 4 ))) (PreH9 : ((batch ÷ 4 ) <= (batch_pre ÷ 4 ))) (PreH10 : (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH11 : (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) ,
  (FloatArray.full output 4 (sqrt_pack4 ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A))))) ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A))))) ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A))))) ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))))) )
  **  (FloatArray.undef_full (output + (4 * sizeof(FLOAT))) (((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) - 4 ) )
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
|--
  “ (0 <= ((batch - (4 * 4 ) ) ÷ 4 )) ”
.

Definition test_neon_entail_wit_3_split_goal_5 := 
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (output: Z) (input: Z) (batch: Z) (PreH1 : (batch >= (4 * sizeof(FLOAT) ))) (PreH2 : (sizeof(FLOAT) = 4)) (PreH3 : (batch = (4 * (batch ÷ 4 ) ))) (PreH4 : ((batch % ( 4 ) ) = 0)) (PreH5 : ((batch % ( sizeof(FLOAT) ) ) = 0)) (PreH6 : (0 < (batch_pre ÷ 4 ))) (PreH7 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH8 : (0 <= (batch ÷ 4 ))) (PreH9 : ((batch ÷ 4 ) <= (batch_pre ÷ 4 ))) (PreH10 : (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH11 : (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) ,
  (FloatArray.full output 4 (sqrt_pack4 ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A))))) ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A))))) ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A))))) ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))))) )
  **  (FloatArray.undef_full (output + (4 * sizeof(FLOAT))) (((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) - 4 ) )
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
|--
  “ (((batch - (4 * 4 ) ) % ( 4 ) ) = 0) ”
.

Definition test_neon_entail_wit_3_split_goal_6 := 
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (output: Z) (input: Z) (batch: Z) (PreH1 : (batch >= (4 * sizeof(FLOAT) ))) (PreH2 : (sizeof(FLOAT) = 4)) (PreH3 : (batch = (4 * (batch ÷ 4 ) ))) (PreH4 : ((batch % ( 4 ) ) = 0)) (PreH5 : ((batch % ( sizeof(FLOAT) ) ) = 0)) (PreH6 : (0 < (batch_pre ÷ 4 ))) (PreH7 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH8 : (0 <= (batch ÷ 4 ))) (PreH9 : ((batch ÷ 4 ) <= (batch_pre ÷ 4 ))) (PreH10 : (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH11 : (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) ,
  (FloatArray.full output 4 (sqrt_pack4 ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A))))) ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A))))) ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A))))) ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))))) )
  **  (FloatArray.undef_full (output + (4 * sizeof(FLOAT))) (((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) - 4 ) )
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
|--
  “ (((batch - (4 * 4 ) ) % ( 4 ) ) = 0) ”
.

Definition test_neon_entail_wit_3_split_goal_7 := 
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (output: Z) (input: Z) (batch: Z) (PreH1 : (batch >= (4 * sizeof(FLOAT) ))) (PreH2 : (sizeof(FLOAT) = 4)) (PreH3 : (batch = (4 * (batch ÷ 4 ) ))) (PreH4 : ((batch % ( 4 ) ) = 0)) (PreH5 : ((batch % ( sizeof(FLOAT) ) ) = 0)) (PreH6 : (0 < (batch_pre ÷ 4 ))) (PreH7 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH8 : (0 <= (batch ÷ 4 ))) (PreH9 : ((batch ÷ 4 ) <= (batch_pre ÷ 4 ))) (PreH10 : (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH11 : (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) ,
  (FloatArray.full output 4 (sqrt_pack4 ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A))))) ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A))))) ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A))))) ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))))) )
  **  (FloatArray.undef_full (output + (4 * sizeof(FLOAT))) (((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) - 4 ) )
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
|--
  “ ((batch - (4 * 4 ) ) = (4 * ((batch - (4 * 4 ) ) ÷ 4 ) )) ”
.

Definition test_neon_entail_wit_3_split_goal_spatial := 
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (output: Z) (input: Z) (batch: Z) (PreH1 : (batch >= (4 * sizeof(FLOAT) ))) (PreH2 : (sizeof(FLOAT) = 4)) (PreH3 : (batch = (4 * (batch ÷ 4 ) ))) (PreH4 : ((batch % ( 4 ) ) = 0)) (PreH5 : ((batch % ( sizeof(FLOAT) ) ) = 0)) (PreH6 : (0 < (batch_pre ÷ 4 ))) (PreH7 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH8 : (0 <= (batch ÷ 4 ))) (PreH9 : ((batch ÷ 4 ) <= (batch_pre ÷ 4 ))) (PreH10 : (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH11 : (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) ,
  (FloatArray.full output 4 (sqrt_pack4 ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A))))) ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A))))) ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A))))) ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))))) )
  **  (FloatArray.undef_full (output + (4 * sizeof(FLOAT))) (((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) - 4 ) )
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
|--
  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - ((batch - (4 * sizeof(FLOAT) ) ) ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - ((batch - (4 * sizeof(FLOAT) ) ) ÷ 4 ) )) (A)) )
  **  (FloatArray.undef_full (output + (4 * sizeof(FLOAT))) ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - ((batch - (4 * sizeof(FLOAT) ) ) ÷ 4 ) ) ) )
.

Definition test_neon_entail_wit_4 := 
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (output: Z) (input: Z) (batch: Z) (PreH1 : (batch <> 0)) (PreH2 : (batch < (4 * sizeof(FLOAT) ))) (PreH3 : (sizeof(FLOAT) = 4)) (PreH4 : (batch = (4 * (batch ÷ 4 ) ))) (PreH5 : ((batch % ( 4 ) ) = 0)) (PreH6 : ((batch % ( sizeof(FLOAT) ) ) = 0)) (PreH7 : (0 < (batch_pre ÷ 4 ))) (PreH8 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH9 : (0 <= (batch ÷ 4 ))) (PreH10 : ((batch ÷ 4 ) <= (batch_pre ÷ 4 ))) (PreH11 : (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH12 : (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) ,
  ((&(( &( "vy_lo" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))
  **  ((&(( &( "vy_lo" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) )
  **  ((&(( &( "vx" ) )->ₛ "s0")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s1")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s2")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s3")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))
  **  ((&(( &( "vy" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s2")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s3")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))))
|--
  (“ (sizeof(FLOAT) = 4) ” 
  &&  “ (batch = (4 * (batch ÷ 4 ) )) ” 
  &&  “ ((batch % ( 4 ) ) = 0) ” 
  &&  “ ((batch % ( sizeof(FLOAT) ) ) = 0) ” 
  &&  “ (0 < (batch_pre ÷ 4 )) ” 
  &&  “ ((batch_pre ÷ 4 ) <= 4611686018427387903) ” 
  &&  “ (0 <= (batch ÷ 4 )) ” 
  &&  “ ((batch ÷ 4 ) <= (batch_pre ÷ 4 )) ” 
  &&  “ (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT)))) ” 
  &&  “ (batch = 4) ”
  &&  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) )
  **  ((&(( &( "vx" ) )->ₛ "s0")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s1")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s2")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s3")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))
  **  ((&(( &( "vy" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s2")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s3")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))))
  **  ((&(( &( "vy_lo" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  ((&(( &( "vy_lo" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A))))))
  ||
  (“ (sizeof(FLOAT) = 4) ” 
  &&  “ (batch = (4 * (batch ÷ 4 ) )) ” 
  &&  “ ((batch % ( 4 ) ) = 0) ” 
  &&  “ ((batch % ( sizeof(FLOAT) ) ) = 0) ” 
  &&  “ (0 < (batch_pre ÷ 4 )) ” 
  &&  “ ((batch_pre ÷ 4 ) <= 4611686018427387903) ” 
  &&  “ (0 <= (batch ÷ 4 )) ” 
  &&  “ ((batch ÷ 4 ) <= (batch_pre ÷ 4 )) ” 
  &&  “ (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT)))) ” 
  &&  “ (batch = 8) ”
  &&  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) )
  **  ((&(( &( "vx" ) )->ₛ "s0")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s1")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s2")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s3")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))
  **  ((&(( &( "vy" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s2")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s3")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))))
  **  ((&(( &( "vy_lo" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  ((&(( &( "vy_lo" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A))))))
  ||
  (“ (sizeof(FLOAT) = 4) ” 
  &&  “ (batch = (4 * (batch ÷ 4 ) )) ” 
  &&  “ ((batch % ( 4 ) ) = 0) ” 
  &&  “ ((batch % ( sizeof(FLOAT) ) ) = 0) ” 
  &&  “ (0 < (batch_pre ÷ 4 )) ” 
  &&  “ ((batch_pre ÷ 4 ) <= 4611686018427387903) ” 
  &&  “ (0 <= (batch ÷ 4 )) ” 
  &&  “ ((batch ÷ 4 ) <= (batch_pre ÷ 4 )) ” 
  &&  “ (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT)))) ” 
  &&  “ (batch = 12) ”
  &&  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) )
  **  ((&(( &( "vx" ) )->ₛ "s0")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s1")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s2")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s3")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))
  **  ((&(( &( "vy" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s2")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s3")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))))
  **  ((&(( &( "vy_lo" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  ((&(( &( "vy_lo" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A))))))
.

Definition test_neon_entail_wit_5_1 := 
(
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (batch: Z) (input: Z) (output: Z) (PreH1 : (sizeof(FLOAT) = 4)) (PreH2 : (batch = (4 * (batch ÷ 4 ) ))) (PreH3 : ((batch % ( 4 ) ) = 0)) (PreH4 : ((batch % ( sizeof(FLOAT) ) ) = 0)) (PreH5 : (0 < (batch_pre ÷ 4 ))) (PreH6 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH7 : (0 <= (batch ÷ 4 ))) (PreH8 : ((batch ÷ 4 ) <= (batch_pre ÷ 4 ))) (PreH9 : (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH10 : (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH11 : (batch = 4)) (PreH12 : ((Z.land batch (2 * sizeof(FLOAT) )) = 0)) ,
  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) )
  **  ((&(( &( "vx" ) )->ₛ "s0")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s1")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s2")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s3")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))
  **  ((&(( &( "vy" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s2")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s3")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))))
  **  ((&(( &( "vy_lo" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  ((&(( &( "vy_lo" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))
|--
  “ (sizeof(FLOAT) = 4) ” 
  &&  “ (batch = (4 * (batch ÷ 4 ) )) ” 
  &&  “ ((batch % ( 4 ) ) = 0) ” 
  &&  “ ((batch % ( sizeof(FLOAT) ) ) = 0) ” 
  &&  “ (0 < (batch_pre ÷ 4 )) ” 
  &&  “ ((batch_pre ÷ 4 ) <= 4611686018427387903) ” 
  &&  “ (0 <= (batch ÷ 4 )) ” 
  &&  “ ((batch ÷ 4 ) <= (batch_pre ÷ 4 )) ” 
  &&  “ (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT)))) ” 
  &&  “ (batch = 4) ” 
  &&  “ ((Z.land batch (2 * sizeof(FLOAT) )) = 0) ”
  &&  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) )
  **  ((&(( &( "vx" ) )->ₛ "s0")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s1")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s2")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s3")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))
  **  ((&(( &( "vy" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s2")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s3")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))))
  **  ((&(( &( "vy_lo" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  ((&(( &( "vy_lo" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))
) \/
(
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (batch: Z) (input: Z) (output: Z) (PreH1 : (sizeof(FLOAT) = 4)) (PreH2 : (batch = (4 * (batch ÷ 4 ) ))) (PreH3 : ((batch % ( 4 ) ) = 0)) (PreH4 : ((batch % ( sizeof(FLOAT) ) ) = 0)) (PreH5 : (0 < (batch_pre ÷ 4 ))) (PreH6 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH7 : (0 <= (batch ÷ 4 ))) (PreH8 : ((batch ÷ 4 ) <= (batch_pre ÷ 4 ))) (PreH9 : (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH10 : (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH11 : (batch = 4)) (PreH12 : ((Z.land batch (2 * sizeof(FLOAT) )) = 0)) ,
  (FloatArray.undef_full (output + (((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) * sizeof(FLOAT))) (((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) - ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) ) )
|--
  TT && emp 
).

Definition test_neon_entail_wit_5_1_split_goal_spatial := 
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (batch: Z) (input: Z) (output: Z) (PreH1 : (sizeof(FLOAT) = 4)) (PreH2 : (batch = (4 * (batch ÷ 4 ) ))) (PreH3 : ((batch % ( 4 ) ) = 0)) (PreH4 : ((batch % ( sizeof(FLOAT) ) ) = 0)) (PreH5 : (0 < (batch_pre ÷ 4 ))) (PreH6 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH7 : (0 <= (batch ÷ 4 ))) (PreH8 : ((batch ÷ 4 ) <= (batch_pre ÷ 4 ))) (PreH9 : (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH10 : (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH11 : (batch = 4)) (PreH12 : ((Z.land batch (2 * sizeof(FLOAT) )) = 0)) ,
  (FloatArray.undef_full (output + (((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) * sizeof(FLOAT))) (((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) - ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) ) )
|--
  TT && emp 
.

Definition test_neon_entail_wit_5_2 := 
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (batch: Z) (input: Z) (output: Z) (PreH1 : (sizeof(FLOAT) = 4)) (PreH2 : (batch = (4 * (batch ÷ 4 ) ))) (PreH3 : ((batch % ( 4 ) ) = 0)) (PreH4 : ((batch % ( sizeof(FLOAT) ) ) = 0)) (PreH5 : (0 < (batch_pre ÷ 4 ))) (PreH6 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH7 : (0 <= (batch ÷ 4 ))) (PreH8 : ((batch ÷ 4 ) <= (batch_pre ÷ 4 ))) (PreH9 : (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH10 : (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH11 : (batch = 8)) (PreH12 : ((Z.land batch (2 * sizeof(FLOAT) )) = 0)) ,
  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) )
  **  ((&(( &( "vx" ) )->ₛ "s0")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s1")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s2")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s3")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))
  **  ((&(( &( "vy" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s2")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s3")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))))
  **  ((&(( &( "vy_lo" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  ((&(( &( "vy_lo" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))
|--
  “ (sizeof(FLOAT) = 4) ” 
  &&  “ (batch = (4 * (batch ÷ 4 ) )) ” 
  &&  “ ((batch % ( 4 ) ) = 0) ” 
  &&  “ ((batch % ( sizeof(FLOAT) ) ) = 0) ” 
  &&  “ (0 < (batch_pre ÷ 4 )) ” 
  &&  “ ((batch_pre ÷ 4 ) <= 4611686018427387903) ” 
  &&  “ (0 <= (batch ÷ 4 )) ” 
  &&  “ ((batch ÷ 4 ) <= (batch_pre ÷ 4 )) ” 
  &&  “ (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT)))) ” 
  &&  “ (batch = 4) ” 
  &&  “ ((Z.land batch (2 * sizeof(FLOAT) )) = 0) ”
  &&  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) )
  **  ((&(( &( "vx" ) )->ₛ "s0")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s1")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s2")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s3")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))
  **  ((&(( &( "vy" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s2")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s3")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))))
  **  ((&(( &( "vy_lo" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  ((&(( &( "vy_lo" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))
.

Definition test_neon_entail_wit_5_3 := 
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (batch: Z) (input: Z) (output: Z) (PreH1 : (sizeof(FLOAT) = 4)) (PreH2 : (batch = (4 * (batch ÷ 4 ) ))) (PreH3 : ((batch % ( 4 ) ) = 0)) (PreH4 : ((batch % ( sizeof(FLOAT) ) ) = 0)) (PreH5 : (0 < (batch_pre ÷ 4 ))) (PreH6 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH7 : (0 <= (batch ÷ 4 ))) (PreH8 : ((batch ÷ 4 ) <= (batch_pre ÷ 4 ))) (PreH9 : (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH10 : (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH11 : (batch = 12)) (PreH12 : ((Z.land batch (2 * sizeof(FLOAT) )) = 0)) ,
  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) )
  **  ((&(( &( "vx" ) )->ₛ "s0")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s1")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s2")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s3")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))
  **  ((&(( &( "vy" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s2")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s3")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))))
  **  ((&(( &( "vy_lo" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  ((&(( &( "vy_lo" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))
|--
  “ (sizeof(FLOAT) = 4) ” 
  &&  “ (batch = (4 * (batch ÷ 4 ) )) ” 
  &&  “ ((batch % ( 4 ) ) = 0) ” 
  &&  “ ((batch % ( sizeof(FLOAT) ) ) = 0) ” 
  &&  “ (0 < (batch_pre ÷ 4 )) ” 
  &&  “ ((batch_pre ÷ 4 ) <= 4611686018427387903) ” 
  &&  “ (0 <= (batch ÷ 4 )) ” 
  &&  “ ((batch ÷ 4 ) <= (batch_pre ÷ 4 )) ” 
  &&  “ (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT)))) ” 
  &&  “ (batch = 4) ” 
  &&  “ ((Z.land batch (2 * sizeof(FLOAT) )) = 0) ”
  &&  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) )
  **  ((&(( &( "vx" ) )->ₛ "s0")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s1")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s2")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s3")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))
  **  ((&(( &( "vy" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s2")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s3")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))))
  **  ((&(( &( "vy_lo" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  ((&(( &( "vy_lo" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))
.

Definition test_neon_entail_wit_6_1 := 
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (batch: Z) (input: Z) (output: Z) (PreH1 : (sizeof(FLOAT) = 4)) (PreH2 : (batch = (4 * (batch ÷ 4 ) ))) (PreH3 : ((batch % ( 4 ) ) = 0)) (PreH4 : ((batch % ( sizeof(FLOAT) ) ) = 0)) (PreH5 : (0 < (batch_pre ÷ 4 ))) (PreH6 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH7 : (0 <= (batch ÷ 4 ))) (PreH8 : ((batch ÷ 4 ) <= (batch_pre ÷ 4 ))) (PreH9 : (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH10 : (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH11 : (batch = 4)) (PreH12 : ((Z.land batch (2 * sizeof(FLOAT) )) <> 0)) ,
  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) )
  **  ((&(( &( "vx" ) )->ₛ "s0")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s1")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s2")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s3")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))
  **  ((&(( &( "vy" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s2")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s3")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))))
  **  ((&(( &( "vy_lo" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  ((&(( &( "vy_lo" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))
|--
  (“ (sizeof(FLOAT) = 4) ” 
  &&  “ (batch = (4 * (batch ÷ 4 ) )) ” 
  &&  “ ((batch % ( 4 ) ) = 0) ” 
  &&  “ ((batch % ( sizeof(FLOAT) ) ) = 0) ” 
  &&  “ (0 < (batch_pre ÷ 4 )) ” 
  &&  “ ((batch_pre ÷ 4 ) <= 4611686018427387903) ” 
  &&  “ (0 <= (batch ÷ 4 )) ” 
  &&  “ ((batch ÷ 4 ) <= (batch_pre ÷ 4 )) ” 
  &&  “ (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT)))) ” 
  &&  “ (batch = 8) ” 
  &&  “ ((Z.land batch (2 * sizeof(FLOAT) )) <> 0) ”
  &&  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) )
  **  ((&(( &( "vx" ) )->ₛ "s0")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s1")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s2")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s3")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))
  **  ((&(( &( "vy" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s2")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s3")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))))
  **  ((&(( &( "vy_lo" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  ((&(( &( "vy_lo" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A))))))
  ||
  (“ (sizeof(FLOAT) = 4) ” 
  &&  “ (batch = (4 * (batch ÷ 4 ) )) ” 
  &&  “ ((batch % ( 4 ) ) = 0) ” 
  &&  “ ((batch % ( sizeof(FLOAT) ) ) = 0) ” 
  &&  “ (0 < (batch_pre ÷ 4 )) ” 
  &&  “ ((batch_pre ÷ 4 ) <= 4611686018427387903) ” 
  &&  “ (0 <= (batch ÷ 4 )) ” 
  &&  “ ((batch ÷ 4 ) <= (batch_pre ÷ 4 )) ” 
  &&  “ (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT)))) ” 
  &&  “ (batch = 12) ” 
  &&  “ ((Z.land batch (2 * sizeof(FLOAT) )) <> 0) ”
  &&  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) )
  **  ((&(( &( "vx" ) )->ₛ "s0")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s1")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s2")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s3")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))
  **  ((&(( &( "vy" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s2")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s3")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))))
  **  ((&(( &( "vy_lo" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  ((&(( &( "vy_lo" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A))))))
.

Definition test_neon_entail_wit_6_2 := 
(
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (batch: Z) (input: Z) (output: Z) (PreH1 : (sizeof(FLOAT) = 4)) (PreH2 : (batch = (4 * (batch ÷ 4 ) ))) (PreH3 : ((batch % ( 4 ) ) = 0)) (PreH4 : ((batch % ( sizeof(FLOAT) ) ) = 0)) (PreH5 : (0 < (batch_pre ÷ 4 ))) (PreH6 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH7 : (0 <= (batch ÷ 4 ))) (PreH8 : ((batch ÷ 4 ) <= (batch_pre ÷ 4 ))) (PreH9 : (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH10 : (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH11 : (batch = 8)) (PreH12 : ((Z.land batch (2 * sizeof(FLOAT) )) <> 0)) ,
  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) )
  **  ((&(( &( "vx" ) )->ₛ "s0")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s1")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s2")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s3")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))
  **  ((&(( &( "vy" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s2")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s3")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))))
  **  ((&(( &( "vy_lo" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  ((&(( &( "vy_lo" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))
|--
  “ (sizeof(FLOAT) = 4) ” 
  &&  “ (batch = (4 * (batch ÷ 4 ) )) ” 
  &&  “ ((batch % ( 4 ) ) = 0) ” 
  &&  “ ((batch % ( sizeof(FLOAT) ) ) = 0) ” 
  &&  “ (0 < (batch_pre ÷ 4 )) ” 
  &&  “ ((batch_pre ÷ 4 ) <= 4611686018427387903) ” 
  &&  “ (0 <= (batch ÷ 4 )) ” 
  &&  “ ((batch ÷ 4 ) <= (batch_pre ÷ 4 )) ” 
  &&  “ (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT)))) ” 
  &&  “ (batch = 8) ” 
  &&  “ ((Z.land batch (2 * sizeof(FLOAT) )) <> 0) ”
  &&  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) )
  **  ((&(( &( "vx" ) )->ₛ "s0")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s1")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s2")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s3")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))
  **  ((&(( &( "vy" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s2")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s3")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))))
  **  ((&(( &( "vy_lo" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  ((&(( &( "vy_lo" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))
) \/
(
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (batch: Z) (input: Z) (output: Z) (PreH1 : (sizeof(FLOAT) = 4)) (PreH2 : (batch = (4 * (batch ÷ 4 ) ))) (PreH3 : ((batch % ( 4 ) ) = 0)) (PreH4 : ((batch % ( sizeof(FLOAT) ) ) = 0)) (PreH5 : (0 < (batch_pre ÷ 4 ))) (PreH6 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH7 : (0 <= (batch ÷ 4 ))) (PreH8 : ((batch ÷ 4 ) <= (batch_pre ÷ 4 ))) (PreH9 : (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH10 : (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH11 : (batch = 8)) (PreH12 : ((Z.land batch (2 * sizeof(FLOAT) )) <> 0)) ,
  (FloatArray.undef_full (output + (((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) * sizeof(FLOAT))) (((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) - ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) ) )
|--
  TT && emp 
).

Definition test_neon_entail_wit_6_2_split_goal_spatial := 
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (batch: Z) (input: Z) (output: Z) (PreH1 : (sizeof(FLOAT) = 4)) (PreH2 : (batch = (4 * (batch ÷ 4 ) ))) (PreH3 : ((batch % ( 4 ) ) = 0)) (PreH4 : ((batch % ( sizeof(FLOAT) ) ) = 0)) (PreH5 : (0 < (batch_pre ÷ 4 ))) (PreH6 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH7 : (0 <= (batch ÷ 4 ))) (PreH8 : ((batch ÷ 4 ) <= (batch_pre ÷ 4 ))) (PreH9 : (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH10 : (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH11 : (batch = 8)) (PreH12 : ((Z.land batch (2 * sizeof(FLOAT) )) <> 0)) ,
  (FloatArray.undef_full (output + (((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) * sizeof(FLOAT))) (((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) - ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) ) )
|--
  TT && emp 
.

Definition test_neon_entail_wit_6_3 := 
(
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (batch: Z) (input: Z) (output: Z) (PreH1 : (sizeof(FLOAT) = 4)) (PreH2 : (batch = (4 * (batch ÷ 4 ) ))) (PreH3 : ((batch % ( 4 ) ) = 0)) (PreH4 : ((batch % ( sizeof(FLOAT) ) ) = 0)) (PreH5 : (0 < (batch_pre ÷ 4 ))) (PreH6 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH7 : (0 <= (batch ÷ 4 ))) (PreH8 : ((batch ÷ 4 ) <= (batch_pre ÷ 4 ))) (PreH9 : (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH10 : (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH11 : (batch = 12)) (PreH12 : ((Z.land batch (2 * sizeof(FLOAT) )) <> 0)) ,
  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) )
  **  ((&(( &( "vx" ) )->ₛ "s0")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s1")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s2")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s3")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))
  **  ((&(( &( "vy" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s2")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s3")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))))
  **  ((&(( &( "vy_lo" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  ((&(( &( "vy_lo" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))
|--
  “ (sizeof(FLOAT) = 4) ” 
  &&  “ (batch = (4 * (batch ÷ 4 ) )) ” 
  &&  “ ((batch % ( 4 ) ) = 0) ” 
  &&  “ ((batch % ( sizeof(FLOAT) ) ) = 0) ” 
  &&  “ (0 < (batch_pre ÷ 4 )) ” 
  &&  “ ((batch_pre ÷ 4 ) <= 4611686018427387903) ” 
  &&  “ (0 <= (batch ÷ 4 )) ” 
  &&  “ ((batch ÷ 4 ) <= (batch_pre ÷ 4 )) ” 
  &&  “ (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT)))) ” 
  &&  “ (batch = 12) ” 
  &&  “ ((Z.land batch (2 * sizeof(FLOAT) )) <> 0) ”
  &&  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) )
  **  ((&(( &( "vx" ) )->ₛ "s0")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s1")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s2")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s3")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))
  **  ((&(( &( "vy" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s2")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s3")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))))
  **  ((&(( &( "vy_lo" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  ((&(( &( "vy_lo" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))
) \/
(
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (batch: Z) (input: Z) (output: Z) (PreH1 : (sizeof(FLOAT) = 4)) (PreH2 : (batch = (4 * (batch ÷ 4 ) ))) (PreH3 : ((batch % ( 4 ) ) = 0)) (PreH4 : ((batch % ( sizeof(FLOAT) ) ) = 0)) (PreH5 : (0 < (batch_pre ÷ 4 ))) (PreH6 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH7 : (0 <= (batch ÷ 4 ))) (PreH8 : ((batch ÷ 4 ) <= (batch_pre ÷ 4 ))) (PreH9 : (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH10 : (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH11 : (batch = 12)) (PreH12 : ((Z.land batch (2 * sizeof(FLOAT) )) <> 0)) ,
  (FloatArray.undef_full (output + (((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) * sizeof(FLOAT))) (((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) - ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) ) )
|--
  TT && emp 
).

Definition test_neon_entail_wit_6_3_split_goal_spatial := 
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (batch: Z) (input: Z) (output: Z) (PreH1 : (sizeof(FLOAT) = 4)) (PreH2 : (batch = (4 * (batch ÷ 4 ) ))) (PreH3 : ((batch % ( 4 ) ) = 0)) (PreH4 : ((batch % ( sizeof(FLOAT) ) ) = 0)) (PreH5 : (0 < (batch_pre ÷ 4 ))) (PreH6 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH7 : (0 <= (batch ÷ 4 ))) (PreH8 : ((batch ÷ 4 ) <= (batch_pre ÷ 4 ))) (PreH9 : (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH10 : (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH11 : (batch = 12)) (PreH12 : ((Z.land batch (2 * sizeof(FLOAT) )) <> 0)) ,
  (FloatArray.undef_full (output + (((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) * sizeof(FLOAT))) (((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) - ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) ) )
|--
  TT && emp 
.

Definition test_neon_entail_wit_7_1 := 
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (batch: Z) (input: Z) (output_2: Z) (PreH1 : (sizeof(FLOAT) = 4)) (PreH2 : (batch = (4 * (batch ÷ 4 ) ))) (PreH3 : ((batch % ( 4 ) ) = 0)) (PreH4 : ((batch % ( sizeof(FLOAT) ) ) = 0)) (PreH5 : (0 < (batch_pre ÷ 4 ))) (PreH6 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH7 : (0 <= (batch ÷ 4 ))) (PreH8 : ((batch ÷ 4 ) <= (batch_pre ÷ 4 ))) (PreH9 : (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH10 : (output_2 = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH11 : (batch = 12)) (PreH12 : ((Z.land batch (2 * sizeof(FLOAT) )) <> 0)) (PreH13 : ((Z.land batch (1 * sizeof(FLOAT) )) = 0)) ,
  ((&(( &( "vy_lo" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))))
  **  ((&(( &( "vy_lo" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))))
  **  (FloatArray.full output_2 2 (sqrt_pack2 ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A))))) ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))) )
  **  (FloatArray.undef_full (output_2 + (2 * sizeof(FLOAT))) (((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) - 2 ) )
  **  ((( &( "output" ) )) # Ptr  |-> (output_2 + (2 * sizeof(FLOAT))))
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
  **  ((&(( &( "vx" ) )->ₛ "s0")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s1")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s2")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s3")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))
  **  ((&(( &( "vy" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s2")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s3")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))))
|--
  EX (output: Z) ,
  “ (sizeof(FLOAT) = 4) ” 
  &&  “ (batch = (4 * (batch ÷ 4 ) )) ” 
  &&  “ ((batch % ( 4 ) ) = 0) ” 
  &&  “ ((batch % ( sizeof(FLOAT) ) ) = 0) ” 
  &&  “ (0 < (batch_pre ÷ 4 )) ” 
  &&  “ ((batch_pre ÷ 4 ) <= 4611686018427387903) ” 
  &&  “ (0 <= (batch ÷ 4 )) ” 
  &&  “ ((batch ÷ 4 ) <= (batch_pre ÷ 4 )) ” 
  &&  “ (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT)))) ” 
  &&  “ (batch = 8) ” 
  &&  “ ((Z.land batch (2 * sizeof(FLOAT) )) <> 0) ” 
  &&  “ ((Z.land batch (1 * sizeof(FLOAT) )) = 0) ”
  &&  ((&(( &( "vy_lo" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))))
  **  ((&(( &( "vy_lo" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))))
  **  (FloatArray.full output 2 (sqrt_pack2 ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A))))) ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))) )
  **  (FloatArray.undef_full (output + (2 * sizeof(FLOAT))) (((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) - 2 ) )
  **  ((( &( "output" ) )) # Ptr  |-> (output + (2 * sizeof(FLOAT))))
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
  **  ((&(( &( "vx" ) )->ₛ "s0")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s1")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s2")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s3")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))
  **  ((&(( &( "vy" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s2")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s3")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))))
.

Definition test_neon_entail_wit_7_2 := 
(
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (batch: Z) (input: Z) (output: Z) (PreH1 : (sizeof(FLOAT) = 4)) (PreH2 : (batch = (4 * (batch ÷ 4 ) ))) (PreH3 : ((batch % ( 4 ) ) = 0)) (PreH4 : ((batch % ( sizeof(FLOAT) ) ) = 0)) (PreH5 : (0 < (batch_pre ÷ 4 ))) (PreH6 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH7 : (0 <= (batch ÷ 4 ))) (PreH8 : ((batch ÷ 4 ) <= (batch_pre ÷ 4 ))) (PreH9 : (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH10 : (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH11 : (batch = 8)) (PreH12 : ((Z.land batch (2 * sizeof(FLOAT) )) <> 0)) (PreH13 : ((Z.land batch (1 * sizeof(FLOAT) )) = 0)) ,
  ((&(( &( "vy_lo" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))))
  **  ((&(( &( "vy_lo" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))))
  **  (FloatArray.full output 2 (sqrt_pack2 ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A))))) ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))) )
  **  (FloatArray.undef_full (output + (2 * sizeof(FLOAT))) (((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) - 2 ) )
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
  **  ((&(( &( "vx" ) )->ₛ "s0")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s1")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s2")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s3")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))
  **  ((&(( &( "vy" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s2")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s3")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))))
|--
  “ (sizeof(FLOAT) = 4) ” 
  &&  “ (batch = (4 * (batch ÷ 4 ) )) ” 
  &&  “ ((batch % ( 4 ) ) = 0) ” 
  &&  “ ((batch % ( sizeof(FLOAT) ) ) = 0) ” 
  &&  “ (0 < (batch_pre ÷ 4 )) ” 
  &&  “ ((batch_pre ÷ 4 ) <= 4611686018427387903) ” 
  &&  “ (0 <= (batch ÷ 4 )) ” 
  &&  “ ((batch ÷ 4 ) <= (batch_pre ÷ 4 )) ” 
  &&  “ (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT)))) ” 
  &&  “ (batch = 8) ” 
  &&  “ ((Z.land batch (2 * sizeof(FLOAT) )) <> 0) ” 
  &&  “ ((Z.land batch (1 * sizeof(FLOAT) )) = 0) ”
  &&  ((&(( &( "vy_lo" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))))
  **  ((&(( &( "vy_lo" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))))
  **  (FloatArray.full output 2 (sqrt_pack2 ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A))))) ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))) )
  **  (FloatArray.undef_full (output + (2 * sizeof(FLOAT))) (((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) - 2 ) )
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
  **  ((&(( &( "vx" ) )->ₛ "s0")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s1")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s2")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s3")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))
  **  ((&(( &( "vy" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s2")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s3")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))))
) \/
(
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (batch: Z) (input: Z) (output: Z) (PreH1 : (sizeof(FLOAT) = 4)) (PreH2 : (batch = (4 * (batch ÷ 4 ) ))) (PreH3 : ((batch % ( 4 ) ) = 0)) (PreH4 : ((batch % ( sizeof(FLOAT) ) ) = 0)) (PreH5 : (0 < (batch_pre ÷ 4 ))) (PreH6 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH7 : (0 <= (batch ÷ 4 ))) (PreH8 : ((batch ÷ 4 ) <= (batch_pre ÷ 4 ))) (PreH9 : (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH10 : (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH11 : (batch = 8)) (PreH12 : ((Z.land batch (2 * sizeof(FLOAT) )) <> 0)) (PreH13 : ((Z.land batch (1 * sizeof(FLOAT) )) = 0)) ,
  (FloatArray.undef_full (output + ((2 + (((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) - 2 ) ) * sizeof(FLOAT))) ((((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) - 2 ) - (((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) - 2 ) ) )
|--
  TT && emp 
).

Definition test_neon_entail_wit_7_2_split_goal_spatial := 
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (batch: Z) (input: Z) (output: Z) (PreH1 : (sizeof(FLOAT) = 4)) (PreH2 : (batch = (4 * (batch ÷ 4 ) ))) (PreH3 : ((batch % ( 4 ) ) = 0)) (PreH4 : ((batch % ( sizeof(FLOAT) ) ) = 0)) (PreH5 : (0 < (batch_pre ÷ 4 ))) (PreH6 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH7 : (0 <= (batch ÷ 4 ))) (PreH8 : ((batch ÷ 4 ) <= (batch_pre ÷ 4 ))) (PreH9 : (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH10 : (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH11 : (batch = 8)) (PreH12 : ((Z.land batch (2 * sizeof(FLOAT) )) <> 0)) (PreH13 : ((Z.land batch (1 * sizeof(FLOAT) )) = 0)) ,
  (FloatArray.undef_full (output + ((2 + (((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) - 2 ) ) * sizeof(FLOAT))) ((((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) - 2 ) - (((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) - 2 ) ) )
|--
  TT && emp 
.

Definition test_neon_entail_wit_7_3 := 
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (batch: Z) (input: Z) (output_2: Z) (PreH1 : (sizeof(FLOAT) = 4)) (PreH2 : (batch = (4 * (batch ÷ 4 ) ))) (PreH3 : ((batch % ( 4 ) ) = 0)) (PreH4 : ((batch % ( sizeof(FLOAT) ) ) = 0)) (PreH5 : (0 < (batch_pre ÷ 4 ))) (PreH6 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH7 : (0 <= (batch ÷ 4 ))) (PreH8 : ((batch ÷ 4 ) <= (batch_pre ÷ 4 ))) (PreH9 : (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH10 : (output_2 = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH11 : (batch = 4)) (PreH12 : ((Z.land batch (2 * sizeof(FLOAT) )) = 0)) (PreH13 : ((Z.land batch (1 * sizeof(FLOAT) )) = 0)) ,
  ((( &( "output" ) )) # Ptr  |-> output_2)
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
  **  (FloatArray.undef_full output_2 ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) )
  **  ((&(( &( "vx" ) )->ₛ "s0")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s1")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s2")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s3")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))
  **  ((&(( &( "vy" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s2")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s3")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))))
  **  ((&(( &( "vy_lo" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  ((&(( &( "vy_lo" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))
|--
  EX (output: Z) ,
  “ (sizeof(FLOAT) = 4) ” 
  &&  “ (batch = (4 * (batch ÷ 4 ) )) ” 
  &&  “ ((batch % ( 4 ) ) = 0) ” 
  &&  “ ((batch % ( sizeof(FLOAT) ) ) = 0) ” 
  &&  “ (0 < (batch_pre ÷ 4 )) ” 
  &&  “ ((batch_pre ÷ 4 ) <= 4611686018427387903) ” 
  &&  “ (0 <= (batch ÷ 4 )) ” 
  &&  “ ((batch ÷ 4 ) <= (batch_pre ÷ 4 )) ” 
  &&  “ (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT)))) ” 
  &&  “ (batch = 8) ” 
  &&  “ ((Z.land batch (2 * sizeof(FLOAT) )) <> 0) ” 
  &&  “ ((Z.land batch (1 * sizeof(FLOAT) )) = 0) ”
  &&  ((&(( &( "vy_lo" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))))
  **  ((&(( &( "vy_lo" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))))
  **  (FloatArray.full output 2 (sqrt_pack2 ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A))))) ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))) )
  **  (FloatArray.undef_full (output + (2 * sizeof(FLOAT))) (((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) - 2 ) )
  **  ((( &( "output" ) )) # Ptr  |-> (output + (2 * sizeof(FLOAT))))
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
  **  ((&(( &( "vx" ) )->ₛ "s0")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s1")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s2")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s3")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))
  **  ((&(( &( "vy" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s2")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s3")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))))
.

Definition test_neon_entail_wit_8_1 := 
(
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (batch: Z) (input: Z) (output: Z) (PreH1 : (sizeof(FLOAT) = 4)) (PreH2 : (batch = (4 * (batch ÷ 4 ) ))) (PreH3 : ((batch % ( 4 ) ) = 0)) (PreH4 : ((batch % ( sizeof(FLOAT) ) ) = 0)) (PreH5 : (0 < (batch_pre ÷ 4 ))) (PreH6 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH7 : (0 <= (batch ÷ 4 ))) (PreH8 : ((batch ÷ 4 ) <= (batch_pre ÷ 4 ))) (PreH9 : (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH10 : (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH11 : (batch = 12)) (PreH12 : ((Z.land batch (2 * sizeof(FLOAT) )) <> 0)) (PreH13 : ((Z.land batch (1 * sizeof(FLOAT) )) <> 0)) ,
  ((&(( &( "vy_lo" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))))
  **  ((&(( &( "vy_lo" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))))
  **  (FloatArray.full output 2 (sqrt_pack2 ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A))))) ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))) )
  **  (FloatArray.undef_full (output + (2 * sizeof(FLOAT))) (((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) - 2 ) )
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
  **  ((&(( &( "vx" ) )->ₛ "s0")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s1")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s2")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s3")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))
  **  ((&(( &( "vy" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s2")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s3")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))))
|--
  “ (sizeof(FLOAT) = 4) ” 
  &&  “ (batch = (4 * (batch ÷ 4 ) )) ” 
  &&  “ ((batch % ( 4 ) ) = 0) ” 
  &&  “ ((batch % ( sizeof(FLOAT) ) ) = 0) ” 
  &&  “ (0 < (batch_pre ÷ 4 )) ” 
  &&  “ ((batch_pre ÷ 4 ) <= 4611686018427387903) ” 
  &&  “ (0 <= (batch ÷ 4 )) ” 
  &&  “ ((batch ÷ 4 ) <= (batch_pre ÷ 4 )) ” 
  &&  “ (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT)))) ” 
  &&  “ (batch = 12) ” 
  &&  “ ((Z.land batch (2 * sizeof(FLOAT) )) <> 0) ” 
  &&  “ ((Z.land batch (1 * sizeof(FLOAT) )) <> 0) ”
  &&  ((&(( &( "vy_lo" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))))
  **  ((&(( &( "vy_lo" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))))
  **  (FloatArray.full output 2 (sqrt_pack2 ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A))))) ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))) )
  **  (FloatArray.undef_full (output + (2 * sizeof(FLOAT))) (((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) - 2 ) )
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
  **  ((&(( &( "vx" ) )->ₛ "s0")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s1")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s2")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s3")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))
  **  ((&(( &( "vy" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s2")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s3")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))))
) \/
(
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (batch: Z) (input: Z) (output: Z) (PreH1 : (sizeof(FLOAT) = 4)) (PreH2 : (batch = (4 * (batch ÷ 4 ) ))) (PreH3 : ((batch % ( 4 ) ) = 0)) (PreH4 : ((batch % ( sizeof(FLOAT) ) ) = 0)) (PreH5 : (0 < (batch_pre ÷ 4 ))) (PreH6 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH7 : (0 <= (batch ÷ 4 ))) (PreH8 : ((batch ÷ 4 ) <= (batch_pre ÷ 4 ))) (PreH9 : (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH10 : (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH11 : (batch = 12)) (PreH12 : ((Z.land batch (2 * sizeof(FLOAT) )) <> 0)) (PreH13 : ((Z.land batch (1 * sizeof(FLOAT) )) <> 0)) ,
  (FloatArray.undef_full (output + ((2 + (((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) - 2 ) ) * sizeof(FLOAT))) ((((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) - 2 ) - (((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) - 2 ) ) )
|--
  TT && emp 
).

Definition test_neon_entail_wit_8_1_split_goal_spatial := 
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (batch: Z) (input: Z) (output: Z) (PreH1 : (sizeof(FLOAT) = 4)) (PreH2 : (batch = (4 * (batch ÷ 4 ) ))) (PreH3 : ((batch % ( 4 ) ) = 0)) (PreH4 : ((batch % ( sizeof(FLOAT) ) ) = 0)) (PreH5 : (0 < (batch_pre ÷ 4 ))) (PreH6 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH7 : (0 <= (batch ÷ 4 ))) (PreH8 : ((batch ÷ 4 ) <= (batch_pre ÷ 4 ))) (PreH9 : (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH10 : (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH11 : (batch = 12)) (PreH12 : ((Z.land batch (2 * sizeof(FLOAT) )) <> 0)) (PreH13 : ((Z.land batch (1 * sizeof(FLOAT) )) <> 0)) ,
  (FloatArray.undef_full (output + ((2 + (((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) - 2 ) ) * sizeof(FLOAT))) ((((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) - 2 ) - (((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) - 2 ) ) )
|--
  TT && emp 
.

Definition test_neon_entail_wit_8_2 := 
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (batch: Z) (input: Z) (output_3: Z) (PreH1 : (sizeof(FLOAT) = 4)) (PreH2 : (batch = (4 * (batch ÷ 4 ) ))) (PreH3 : ((batch % ( 4 ) ) = 0)) (PreH4 : ((batch % ( sizeof(FLOAT) ) ) = 0)) (PreH5 : (0 < (batch_pre ÷ 4 ))) (PreH6 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH7 : (0 <= (batch ÷ 4 ))) (PreH8 : ((batch ÷ 4 ) <= (batch_pre ÷ 4 ))) (PreH9 : (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH10 : (output_3 = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH11 : (batch = 8)) (PreH12 : ((Z.land batch (2 * sizeof(FLOAT) )) <> 0)) (PreH13 : ((Z.land batch (1 * sizeof(FLOAT) )) <> 0)) ,
  ((&(( &( "vy_lo" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))))
  **  ((&(( &( "vy_lo" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))))
  **  (FloatArray.full output_3 2 (sqrt_pack2 ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A))))) ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))) )
  **  (FloatArray.undef_full (output_3 + (2 * sizeof(FLOAT))) (((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) - 2 ) )
  **  ((( &( "output" ) )) # Ptr  |-> (output_3 + (2 * sizeof(FLOAT))))
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
  **  ((&(( &( "vx" ) )->ₛ "s0")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s1")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s2")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s3")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))
  **  ((&(( &( "vy" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s2")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s3")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))))
|--
  (EX (output: Z) ,
  “ (sizeof(FLOAT) = 4) ” 
  &&  “ (batch = (4 * (batch ÷ 4 ) )) ” 
  &&  “ ((batch % ( 4 ) ) = 0) ” 
  &&  “ ((batch % ( sizeof(FLOAT) ) ) = 0) ” 
  &&  “ (0 < (batch_pre ÷ 4 )) ” 
  &&  “ ((batch_pre ÷ 4 ) <= 4611686018427387903) ” 
  &&  “ (0 <= (batch ÷ 4 )) ” 
  &&  “ ((batch ÷ 4 ) <= (batch_pre ÷ 4 )) ” 
  &&  “ (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT)))) ” 
  &&  “ (batch = 12) ” 
  &&  “ ((Z.land batch (2 * sizeof(FLOAT) )) <> 0) ” 
  &&  “ ((Z.land batch (1 * sizeof(FLOAT) )) <> 0) ”
  &&  ((&(( &( "vy_lo" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))))
  **  ((&(( &( "vy_lo" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))))
  **  (FloatArray.full output 2 (sqrt_pack2 ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A))))) ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))) )
  **  (FloatArray.undef_full (output + (2 * sizeof(FLOAT))) (((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) - 2 ) )
  **  ((( &( "output" ) )) # Ptr  |-> (output + (2 * sizeof(FLOAT))))
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
  **  ((&(( &( "vx" ) )->ₛ "s0")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s1")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s2")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s3")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))
  **  ((&(( &( "vy" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s2")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s3")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A))))))
  ||
  (EX (output_2: Z) ,
  “ (sizeof(FLOAT) = 4) ” 
  &&  “ (batch = (4 * (batch ÷ 4 ) )) ” 
  &&  “ ((batch % ( 4 ) ) = 0) ” 
  &&  “ ((batch % ( sizeof(FLOAT) ) ) = 0) ” 
  &&  “ (0 < (batch_pre ÷ 4 )) ” 
  &&  “ ((batch_pre ÷ 4 ) <= 4611686018427387903) ” 
  &&  “ (0 <= (batch ÷ 4 )) ” 
  &&  “ ((batch ÷ 4 ) <= (batch_pre ÷ 4 )) ” 
  &&  “ (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT)))) ” 
  &&  “ (output_2 = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT)))) ” 
  &&  “ (batch = 4) ” 
  &&  “ ((Z.land batch (2 * sizeof(FLOAT) )) = 0) ” 
  &&  “ ((Z.land batch (1 * sizeof(FLOAT) )) <> 0) ”
  &&  ((( &( "output" ) )) # Ptr  |-> output_2)
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
  **  (FloatArray.undef_full output_2 ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) )
  **  ((&(( &( "vx" ) )->ₛ "s0")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s1")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s2")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s3")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))
  **  ((&(( &( "vy" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s2")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s3")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))))
  **  ((&(( &( "vy_lo" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  ((&(( &( "vy_lo" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A))))))
.

Definition test_neon_entail_wit_8_3 := 
(
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (batch: Z) (input: Z) (output_2: Z) (PreH1 : (sizeof(FLOAT) = 4)) (PreH2 : (batch = (4 * (batch ÷ 4 ) ))) (PreH3 : ((batch % ( 4 ) ) = 0)) (PreH4 : ((batch % ( sizeof(FLOAT) ) ) = 0)) (PreH5 : (0 < (batch_pre ÷ 4 ))) (PreH6 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH7 : (0 <= (batch ÷ 4 ))) (PreH8 : ((batch ÷ 4 ) <= (batch_pre ÷ 4 ))) (PreH9 : (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH10 : (output_2 = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH11 : (batch = 4)) (PreH12 : ((Z.land batch (2 * sizeof(FLOAT) )) = 0)) (PreH13 : ((Z.land batch (1 * sizeof(FLOAT) )) <> 0)) ,
  ((( &( "output" ) )) # Ptr  |-> output_2)
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
  **  (FloatArray.undef_full output_2 ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) )
  **  ((&(( &( "vx" ) )->ₛ "s0")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s1")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s2")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s3")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))
  **  ((&(( &( "vy" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s2")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s3")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))))
  **  ((&(( &( "vy_lo" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  ((&(( &( "vy_lo" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))
|--
  “ (sizeof(FLOAT) = 4) ” 
  &&  “ (batch = (4 * (batch ÷ 4 ) )) ” 
  &&  “ ((batch % ( 4 ) ) = 0) ” 
  &&  “ ((batch % ( sizeof(FLOAT) ) ) = 0) ” 
  &&  “ (0 < (batch_pre ÷ 4 )) ” 
  &&  “ ((batch_pre ÷ 4 ) <= 4611686018427387903) ” 
  &&  “ (0 <= (batch ÷ 4 )) ” 
  &&  “ ((batch ÷ 4 ) <= (batch_pre ÷ 4 )) ” 
  &&  “ (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT)))) ” 
  &&  “ (output_2 = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT)))) ” 
  &&  “ (batch = 4) ” 
  &&  “ ((Z.land batch (2 * sizeof(FLOAT) )) = 0) ” 
  &&  “ ((Z.land batch (1 * sizeof(FLOAT) )) <> 0) ”
  &&  ((( &( "output" ) )) # Ptr  |-> output_2)
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
  **  (FloatArray.undef_full output_2 ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) )
  **  ((&(( &( "vx" ) )->ₛ "s0")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s1")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s2")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s3")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))
  **  ((&(( &( "vy" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s2")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s3")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))))
  **  ((&(( &( "vy_lo" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  ((&(( &( "vy_lo" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))
) \/
(
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (batch: Z) (input: Z) (output_2: Z) (PreH1 : (sizeof(FLOAT) = 4)) (PreH2 : (batch = (4 * (batch ÷ 4 ) ))) (PreH3 : ((batch % ( 4 ) ) = 0)) (PreH4 : ((batch % ( sizeof(FLOAT) ) ) = 0)) (PreH5 : (0 < (batch_pre ÷ 4 ))) (PreH6 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH7 : (0 <= (batch ÷ 4 ))) (PreH8 : ((batch ÷ 4 ) <= (batch_pre ÷ 4 ))) (PreH9 : (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH10 : (output_2 = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH11 : (batch = 4)) (PreH12 : ((Z.land batch (2 * sizeof(FLOAT) )) = 0)) (PreH13 : ((Z.land batch (1 * sizeof(FLOAT) )) <> 0)) ,
  (FloatArray.undef_full (output_2 + (((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) * sizeof(FLOAT))) (((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) - ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) ) )
|--
  TT && emp 
).

Definition test_neon_entail_wit_8_3_split_goal_spatial := 
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (batch: Z) (input: Z) (output_2: Z) (PreH1 : (sizeof(FLOAT) = 4)) (PreH2 : (batch = (4 * (batch ÷ 4 ) ))) (PreH3 : ((batch % ( 4 ) ) = 0)) (PreH4 : ((batch % ( sizeof(FLOAT) ) ) = 0)) (PreH5 : (0 < (batch_pre ÷ 4 ))) (PreH6 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH7 : (0 <= (batch ÷ 4 ))) (PreH8 : ((batch ÷ 4 ) <= (batch_pre ÷ 4 ))) (PreH9 : (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH10 : (output_2 = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH11 : (batch = 4)) (PreH12 : ((Z.land batch (2 * sizeof(FLOAT) )) = 0)) (PreH13 : ((Z.land batch (1 * sizeof(FLOAT) )) <> 0)) ,
  (FloatArray.undef_full (output_2 + (((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) * sizeof(FLOAT))) (((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) - ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) ) )
|--
  TT && emp 
.

Definition test_neon_return_wit_1 := 
(
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (batch: Z) (input: Z) (output: Z) (PreH1 : (sizeof(FLOAT) = 4)) (PreH2 : (batch = (4 * (batch ÷ 4 ) ))) (PreH3 : ((batch % ( 4 ) ) = 0)) (PreH4 : ((batch % ( sizeof(FLOAT) ) ) = 0)) (PreH5 : (0 < (batch_pre ÷ 4 ))) (PreH6 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH7 : (0 <= (batch ÷ 4 ))) (PreH8 : ((batch ÷ 4 ) <= (batch_pre ÷ 4 ))) (PreH9 : (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH10 : (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH11 : (batch = 12)) (PreH12 : ((Z.land batch (2 * sizeof(FLOAT) )) <> 0)) (PreH13 : ((Z.land batch (1 * sizeof(FLOAT) )) <> 0)) ,
  (FloatArray.full (output + (2 * sizeof(FLOAT))) 1 (sqrt_pack1 ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))))) )
  **  (FloatArray.undef_full (output + ((2 + 1 ) * sizeof(FLOAT))) ((((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) - 2 ) - 1 ) )
  **  (FloatArray.full output 2 (sqrt_pack2 ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A))))) ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))) )
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
|--
  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.full output_pre (batch_pre ÷ 4 ) (sqrt_arm_values ((batch_pre ÷ 4 )) (A)) )
) \/
(
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (batch: Z) (input: Z) (output: Z) (PreH1 : (sizeof(FLOAT) = 4)) (PreH2 : (batch = (4 * (batch ÷ 4 ) ))) (PreH3 : ((batch % ( 4 ) ) = 0)) (PreH4 : ((batch % ( sizeof(FLOAT) ) ) = 0)) (PreH5 : (0 < (batch_pre ÷ 4 ))) (PreH6 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH7 : (0 <= (batch ÷ 4 ))) (PreH8 : ((batch ÷ 4 ) <= (batch_pre ÷ 4 ))) (PreH9 : (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH10 : (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH11 : (batch = 12)) (PreH12 : ((Z.land batch (2 * sizeof(FLOAT) )) <> 0)) (PreH13 : ((Z.land batch (1 * sizeof(FLOAT) )) <> 0)) ,
  (FloatArray.full (output + (2 * sizeof(FLOAT))) 1 (sqrt_pack1 ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))))) )
  **  (FloatArray.undef_full (output + ((2 + 1 ) * sizeof(FLOAT))) ((((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) - 2 ) - 1 ) )
  **  (FloatArray.full output 2 (sqrt_pack2 ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A))))) ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))) )
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
|--
  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.full output_pre (batch_pre ÷ 4 ) (sqrt_arm_values ((batch_pre ÷ 4 )) (A)) )
).

Definition test_neon_return_wit_1_split_goal_spatial := 
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (batch: Z) (input: Z) (output: Z) (PreH1 : (sizeof(FLOAT) = 4)) (PreH2 : (batch = (4 * (batch ÷ 4 ) ))) (PreH3 : ((batch % ( 4 ) ) = 0)) (PreH4 : ((batch % ( sizeof(FLOAT) ) ) = 0)) (PreH5 : (0 < (batch_pre ÷ 4 ))) (PreH6 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH7 : (0 <= (batch ÷ 4 ))) (PreH8 : ((batch ÷ 4 ) <= (batch_pre ÷ 4 ))) (PreH9 : (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH10 : (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH11 : (batch = 12)) (PreH12 : ((Z.land batch (2 * sizeof(FLOAT) )) <> 0)) (PreH13 : ((Z.land batch (1 * sizeof(FLOAT) )) <> 0)) ,
  (FloatArray.full (output + (2 * sizeof(FLOAT))) 1 (sqrt_pack1 ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))))) )
  **  (FloatArray.undef_full (output + ((2 + 1 ) * sizeof(FLOAT))) ((((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) - 2 ) - 1 ) )
  **  (FloatArray.full output 2 (sqrt_pack2 ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A))))) ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))) )
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
|--
  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.full output_pre (batch_pre ÷ 4 ) (sqrt_arm_values ((batch_pre ÷ 4 )) (A)) )
.

Definition test_neon_return_wit_2 := 
(
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (batch: Z) (input: Z) (output: Z) (PreH1 : (sizeof(FLOAT) = 4)) (PreH2 : (batch = (4 * (batch ÷ 4 ) ))) (PreH3 : ((batch % ( 4 ) ) = 0)) (PreH4 : ((batch % ( sizeof(FLOAT) ) ) = 0)) (PreH5 : (0 < (batch_pre ÷ 4 ))) (PreH6 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH7 : (0 <= (batch ÷ 4 ))) (PreH8 : ((batch ÷ 4 ) <= (batch_pre ÷ 4 ))) (PreH9 : (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH10 : (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH11 : (batch = 4)) (PreH12 : ((Z.land batch (2 * sizeof(FLOAT) )) = 0)) (PreH13 : ((Z.land batch (1 * sizeof(FLOAT) )) <> 0)) ,
  (FloatArray.full output 1 (sqrt_pack1 ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))) )
  **  (FloatArray.undef_full (output + (1 * sizeof(FLOAT))) (((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) - 1 ) )
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
|--
  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.full output_pre (batch_pre ÷ 4 ) (sqrt_arm_values ((batch_pre ÷ 4 )) (A)) )
) \/
(
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (batch: Z) (input: Z) (output: Z) (PreH1 : (sizeof(FLOAT) = 4)) (PreH2 : (batch = (4 * (batch ÷ 4 ) ))) (PreH3 : ((batch % ( 4 ) ) = 0)) (PreH4 : ((batch % ( sizeof(FLOAT) ) ) = 0)) (PreH5 : (0 < (batch_pre ÷ 4 ))) (PreH6 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH7 : (0 <= (batch ÷ 4 ))) (PreH8 : ((batch ÷ 4 ) <= (batch_pre ÷ 4 ))) (PreH9 : (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH10 : (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH11 : (batch = 4)) (PreH12 : ((Z.land batch (2 * sizeof(FLOAT) )) = 0)) (PreH13 : ((Z.land batch (1 * sizeof(FLOAT) )) <> 0)) ,
  (FloatArray.full output 1 (sqrt_pack1 ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))) )
  **  (FloatArray.undef_full (output + (1 * sizeof(FLOAT))) (((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) - 1 ) )
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
|--
  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.full output_pre (batch_pre ÷ 4 ) (sqrt_arm_values ((batch_pre ÷ 4 )) (A)) )
).

Definition test_neon_return_wit_2_split_goal_spatial := 
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (batch: Z) (input: Z) (output: Z) (PreH1 : (sizeof(FLOAT) = 4)) (PreH2 : (batch = (4 * (batch ÷ 4 ) ))) (PreH3 : ((batch % ( 4 ) ) = 0)) (PreH4 : ((batch % ( sizeof(FLOAT) ) ) = 0)) (PreH5 : (0 < (batch_pre ÷ 4 ))) (PreH6 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH7 : (0 <= (batch ÷ 4 ))) (PreH8 : ((batch ÷ 4 ) <= (batch_pre ÷ 4 ))) (PreH9 : (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH10 : (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH11 : (batch = 4)) (PreH12 : ((Z.land batch (2 * sizeof(FLOAT) )) = 0)) (PreH13 : ((Z.land batch (1 * sizeof(FLOAT) )) <> 0)) ,
  (FloatArray.full output 1 (sqrt_pack1 ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))) )
  **  (FloatArray.undef_full (output + (1 * sizeof(FLOAT))) (((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) - 1 ) )
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
|--
  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.full output_pre (batch_pre ÷ 4 ) (sqrt_arm_values ((batch_pre ÷ 4 )) (A)) )
.

Definition test_neon_return_wit_3 := 
(
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (batch: Z) (input: Z) (output: Z) (PreH1 : (sizeof(FLOAT) = 4)) (PreH2 : (batch = (4 * (batch ÷ 4 ) ))) (PreH3 : ((batch % ( 4 ) ) = 0)) (PreH4 : ((batch % ( sizeof(FLOAT) ) ) = 0)) (PreH5 : (0 < (batch_pre ÷ 4 ))) (PreH6 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH7 : (0 <= (batch ÷ 4 ))) (PreH8 : ((batch ÷ 4 ) <= (batch_pre ÷ 4 ))) (PreH9 : (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH10 : (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH11 : (batch = 8)) (PreH12 : ((Z.land batch (2 * sizeof(FLOAT) )) <> 0)) (PreH13 : ((Z.land batch (1 * sizeof(FLOAT) )) = 0)) ,
  (FloatArray.full output 2 (sqrt_pack2 ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A))))) ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))) )
  **  (FloatArray.undef_full (output + (2 * sizeof(FLOAT))) (((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) - 2 ) )
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
|--
  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.full output_pre (batch_pre ÷ 4 ) (sqrt_arm_values ((batch_pre ÷ 4 )) (A)) )
) \/
(
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (batch: Z) (input: Z) (output: Z) (PreH1 : (sizeof(FLOAT) = 4)) (PreH2 : (batch = (4 * (batch ÷ 4 ) ))) (PreH3 : ((batch % ( 4 ) ) = 0)) (PreH4 : ((batch % ( sizeof(FLOAT) ) ) = 0)) (PreH5 : (0 < (batch_pre ÷ 4 ))) (PreH6 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH7 : (0 <= (batch ÷ 4 ))) (PreH8 : ((batch ÷ 4 ) <= (batch_pre ÷ 4 ))) (PreH9 : (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH10 : (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH11 : (batch = 8)) (PreH12 : ((Z.land batch (2 * sizeof(FLOAT) )) <> 0)) (PreH13 : ((Z.land batch (1 * sizeof(FLOAT) )) = 0)) ,
  (FloatArray.full output 2 (sqrt_pack2 ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A))))) ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))) )
  **  (FloatArray.undef_full (output + (2 * sizeof(FLOAT))) (((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) - 2 ) )
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
|--
  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.full output_pre (batch_pre ÷ 4 ) (sqrt_arm_values ((batch_pre ÷ 4 )) (A)) )
).

Definition test_neon_return_wit_3_split_goal_spatial := 
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (batch: Z) (input: Z) (output: Z) (PreH1 : (sizeof(FLOAT) = 4)) (PreH2 : (batch = (4 * (batch ÷ 4 ) ))) (PreH3 : ((batch % ( 4 ) ) = 0)) (PreH4 : ((batch % ( sizeof(FLOAT) ) ) = 0)) (PreH5 : (0 < (batch_pre ÷ 4 ))) (PreH6 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH7 : (0 <= (batch ÷ 4 ))) (PreH8 : ((batch ÷ 4 ) <= (batch_pre ÷ 4 ))) (PreH9 : (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH10 : (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH11 : (batch = 8)) (PreH12 : ((Z.land batch (2 * sizeof(FLOAT) )) <> 0)) (PreH13 : ((Z.land batch (1 * sizeof(FLOAT) )) = 0)) ,
  (FloatArray.full output 2 (sqrt_pack2 ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A))))) ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))) )
  **  (FloatArray.undef_full (output + (2 * sizeof(FLOAT))) (((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) - 2 ) )
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
|--
  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.full output_pre (batch_pre ÷ 4 ) (sqrt_arm_values ((batch_pre ÷ 4 )) (A)) )
.

Definition test_neon_return_wit_4 := 
(
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (output: Z) (input: Z) (batch: Z) (PreH1 : (batch = 0)) (PreH2 : (batch < (4 * sizeof(FLOAT) ))) (PreH3 : (sizeof(FLOAT) = 4)) (PreH4 : (batch = (4 * (batch ÷ 4 ) ))) (PreH5 : ((batch % ( 4 ) ) = 0)) (PreH6 : ((batch % ( sizeof(FLOAT) ) ) = 0)) (PreH7 : (0 < (batch_pre ÷ 4 ))) (PreH8 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH9 : (0 <= (batch ÷ 4 ))) (PreH10 : ((batch ÷ 4 ) <= (batch_pre ÷ 4 ))) (PreH11 : (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH12 : (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) ,
  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) )
|--
  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.full output_pre (batch_pre ÷ 4 ) (sqrt_arm_values ((batch_pre ÷ 4 )) (A)) )
) \/
(
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (output: Z) (input: Z) (batch: Z) (PreH1 : (batch = 0)) (PreH2 : (batch < (4 * sizeof(FLOAT) ))) (PreH3 : (sizeof(FLOAT) = 4)) (PreH4 : (batch = (4 * (batch ÷ 4 ) ))) (PreH5 : ((batch % ( 4 ) ) = 0)) (PreH6 : ((batch % ( sizeof(FLOAT) ) ) = 0)) (PreH7 : (0 < (batch_pre ÷ 4 ))) (PreH8 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH9 : (0 <= (batch ÷ 4 ))) (PreH10 : ((batch ÷ 4 ) <= (batch_pre ÷ 4 ))) (PreH11 : (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH12 : (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) ,
  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) )
|--
  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.full output_pre (batch_pre ÷ 4 ) (sqrt_arm_values ((batch_pre ÷ 4 )) (A)) )
).

Definition test_neon_return_wit_4_split_goal_spatial := 
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (output: Z) (input: Z) (batch: Z) (PreH1 : (batch = 0)) (PreH2 : (batch < (4 * sizeof(FLOAT) ))) (PreH3 : (sizeof(FLOAT) = 4)) (PreH4 : (batch = (4 * (batch ÷ 4 ) ))) (PreH5 : ((batch % ( 4 ) ) = 0)) (PreH6 : ((batch % ( sizeof(FLOAT) ) ) = 0)) (PreH7 : (0 < (batch_pre ÷ 4 ))) (PreH8 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH9 : (0 <= (batch ÷ 4 ))) (PreH10 : ((batch ÷ 4 ) <= (batch_pre ÷ 4 ))) (PreH11 : (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH12 : (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) ,
  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) )
|--
  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.full output_pre (batch_pre ÷ 4 ) (sqrt_arm_values ((batch_pre ÷ 4 )) (A)) )
.

Definition test_neon_partial_solve_wit_1_pure := 
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

Definition test_neon_partial_solve_wit_1_aux := 
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

Definition test_neon_partial_solve_wit_1 := test_neon_partial_solve_wit_1_pure -> test_neon_partial_solve_wit_1_aux.

Definition test_neon_partial_solve_wit_2_pure := 
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

Definition test_neon_partial_solve_wit_2_aux := 
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

Definition test_neon_partial_solve_wit_2 := test_neon_partial_solve_wit_2_pure -> test_neon_partial_solve_wit_2_aux.

Definition test_neon_partial_solve_wit_3_pure := 
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

Definition test_neon_partial_solve_wit_3_aux := 
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

Definition test_neon_partial_solve_wit_3 := test_neon_partial_solve_wit_3_pure -> test_neon_partial_solve_wit_3_aux.

Definition test_neon_partial_solve_wit_4_pure := 
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

Definition test_neon_partial_solve_wit_4_aux := 
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

Definition test_neon_partial_solve_wit_4 := test_neon_partial_solve_wit_4_pure -> test_neon_partial_solve_wit_4_aux.

Definition test_neon_partial_solve_wit_5_pure := 
(
forall (unused_params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (output: Z) (input: Z) (batch: Z) (PreH1 : (batch >= (4 * sizeof(FLOAT) ))) (PreH2 : (sizeof(FLOAT) = 4)) (PreH3 : (batch = (4 * (batch ÷ 4 ) ))) (PreH4 : ((batch % ( 4 ) ) = 0)) (PreH5 : ((batch % ( sizeof(FLOAT) ) ) = 0)) (PreH6 : (0 < (batch_pre ÷ 4 ))) (PreH7 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH8 : (0 <= (batch ÷ 4 ))) (PreH9 : ((batch ÷ 4 ) <= (batch_pre ÷ 4 ))) (PreH10 : (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH11 : (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) ,
  (UndefStructPredfloat32x4_t ( &( "vx" ) ) )
  **  ((( &( "unused_params" ) )) # Ptr  |-> unused_params_pre)
  **  ((( &( "batch" ) )) # UInt64  |-> batch)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) )
|--
  “ (0 <= ((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) ” 
  &&  “ ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 4 ) <= ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ (input = (input_pre + (4 * ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) )) ” 
  &&  “ ((input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * 4)) = (input_pre + (4 * ((batch_pre ÷ 4 ) - ((4 * (batch ÷ 4 ) ) ÷ 4 ) ) ) )) ” 
  &&  “ ((((batch_pre ÷ 4 ) - ((4 * (batch ÷ 4 ) ) ÷ 4 ) ) + 4 ) <= ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ (0 <= ((batch_pre ÷ 4 ) - ((4 * (batch ÷ 4 ) ) ÷ 4 ) )) ”
) \/
(
forall (unused_params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (output: Z) (input: Z) (batch: Z) (PreH1 : (batch <= UINT64_MAX)) (PreH2 : (batch >= 0)) (PreH3 : (batch >= (4 * sizeof(FLOAT) ))) (PreH4 : (sizeof(FLOAT) = 4)) (PreH5 : (batch = (4 * (batch ÷ 4 ) ))) (PreH6 : ((batch % ( 4 ) ) = 0)) (PreH7 : ((batch % ( sizeof(FLOAT) ) ) = 0)) (PreH8 : (0 < (batch_pre ÷ 4 ))) (PreH9 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH10 : (0 <= (batch ÷ 4 ))) (PreH11 : ((batch ÷ 4 ) <= (batch_pre ÷ 4 ))) (PreH12 : (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH13 : (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) ,
  (UndefStructPredfloat32x4_t ( &( "vx" ) ) )
  **  ((( &( "unused_params" ) )) # Ptr  |-> unused_params_pre)
  **  ((( &( "batch" ) )) # UInt64  |-> batch)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) )
|--
  “ (0 <= ((batch_pre ÷ 4 ) - ((4 * (batch ÷ 4 ) ) ÷ 4 ) )) ” 
  &&  “ ((((batch_pre ÷ 4 ) - ((4 * (batch ÷ 4 ) ) ÷ 4 ) ) + 4 ) <= ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ ((input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * 4)) = (input_pre + (4 * ((batch_pre ÷ 4 ) - ((4 * (batch ÷ 4 ) ) ÷ 4 ) ) ) )) ”
).

Definition test_neon_partial_solve_wit_5_pure_split_goal_1 := 
forall (unused_params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (output: Z) (input: Z) (batch: Z) (PreH1 : (batch <= UINT64_MAX)) (PreH2 : (batch >= 0)) (PreH3 : (batch >= (4 * sizeof(FLOAT) ))) (PreH4 : (sizeof(FLOAT) = 4)) (PreH5 : (batch = (4 * (batch ÷ 4 ) ))) (PreH6 : ((batch % ( 4 ) ) = 0)) (PreH7 : ((batch % ( sizeof(FLOAT) ) ) = 0)) (PreH8 : (0 < (batch_pre ÷ 4 ))) (PreH9 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH10 : (0 <= (batch ÷ 4 ))) (PreH11 : ((batch ÷ 4 ) <= (batch_pre ÷ 4 ))) (PreH12 : (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH13 : (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) ,
  (UndefStructPredfloat32x4_t ( &( "vx" ) ) )
  **  ((( &( "unused_params" ) )) # Ptr  |-> unused_params_pre)
  **  ((( &( "batch" ) )) # UInt64  |-> batch)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) )
|--
  “ (0 <= ((batch_pre ÷ 4 ) - ((4 * (batch ÷ 4 ) ) ÷ 4 ) )) ”
.

Definition test_neon_partial_solve_wit_5_pure_split_goal_2 := 
forall (unused_params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (output: Z) (input: Z) (batch: Z) (PreH1 : (batch <= UINT64_MAX)) (PreH2 : (batch >= 0)) (PreH3 : (batch >= (4 * sizeof(FLOAT) ))) (PreH4 : (sizeof(FLOAT) = 4)) (PreH5 : (batch = (4 * (batch ÷ 4 ) ))) (PreH6 : ((batch % ( 4 ) ) = 0)) (PreH7 : ((batch % ( sizeof(FLOAT) ) ) = 0)) (PreH8 : (0 < (batch_pre ÷ 4 ))) (PreH9 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH10 : (0 <= (batch ÷ 4 ))) (PreH11 : ((batch ÷ 4 ) <= (batch_pre ÷ 4 ))) (PreH12 : (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH13 : (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) ,
  (UndefStructPredfloat32x4_t ( &( "vx" ) ) )
  **  ((( &( "unused_params" ) )) # Ptr  |-> unused_params_pre)
  **  ((( &( "batch" ) )) # UInt64  |-> batch)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) )
|--
  “ ((((batch_pre ÷ 4 ) - ((4 * (batch ÷ 4 ) ) ÷ 4 ) ) + 4 ) <= ((batch_pre ÷ 4 ) + 3 )) ”
.

Definition test_neon_partial_solve_wit_5_pure_split_goal_3 := 
forall (unused_params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (output: Z) (input: Z) (batch: Z) (PreH1 : (batch <= UINT64_MAX)) (PreH2 : (batch >= 0)) (PreH3 : (batch >= (4 * sizeof(FLOAT) ))) (PreH4 : (sizeof(FLOAT) = 4)) (PreH5 : (batch = (4 * (batch ÷ 4 ) ))) (PreH6 : ((batch % ( 4 ) ) = 0)) (PreH7 : ((batch % ( sizeof(FLOAT) ) ) = 0)) (PreH8 : (0 < (batch_pre ÷ 4 ))) (PreH9 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH10 : (0 <= (batch ÷ 4 ))) (PreH11 : ((batch ÷ 4 ) <= (batch_pre ÷ 4 ))) (PreH12 : (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH13 : (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) ,
  (UndefStructPredfloat32x4_t ( &( "vx" ) ) )
  **  ((( &( "unused_params" ) )) # Ptr  |-> unused_params_pre)
  **  ((( &( "batch" ) )) # UInt64  |-> batch)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) )
|--
  “ ((input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * 4)) = (input_pre + (4 * ((batch_pre ÷ 4 ) - ((4 * (batch ÷ 4 ) ) ÷ 4 ) ) ) )) ”
.

Definition test_neon_partial_solve_wit_5_aux := 
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (output: Z) (input: Z) (batch: Z) (PreH1 : (batch >= (4 * sizeof(FLOAT) ))) (PreH2 : (sizeof(FLOAT) = 4)) (PreH3 : (batch = (4 * (batch ÷ 4 ) ))) (PreH4 : ((batch % ( 4 ) ) = 0)) (PreH5 : ((batch % ( sizeof(FLOAT) ) ) = 0)) (PreH6 : (0 < (batch_pre ÷ 4 ))) (PreH7 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH8 : (0 <= (batch ÷ 4 ))) (PreH9 : ((batch ÷ 4 ) <= (batch_pre ÷ 4 ))) (PreH10 : (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH11 : (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) ,
  (UndefStructPredfloat32x4_t ( &( "vx" ) ) )
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) )
|--
  “ (0 <= ((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) ” 
  &&  “ ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 4 ) <= ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ (input = (input_pre + (4 * ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) )) ” 
  &&  “ ((input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * 4)) = (input_pre + (4 * ((batch_pre ÷ 4 ) - ((4 * (batch ÷ 4 ) ) ÷ 4 ) ) ) )) ” 
  &&  “ ((((batch_pre ÷ 4 ) - ((4 * (batch ÷ 4 ) ) ÷ 4 ) ) + 4 ) <= ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ (0 <= ((batch_pre ÷ 4 ) - ((4 * (batch ÷ 4 ) ) ÷ 4 ) )) ” 
  &&  “ (batch >= (4 * sizeof(FLOAT) )) ” 
  &&  “ (sizeof(FLOAT) = 4) ” 
  &&  “ (batch = (4 * (batch ÷ 4 ) )) ” 
  &&  “ ((batch % ( 4 ) ) = 0) ” 
  &&  “ ((batch % ( sizeof(FLOAT) ) ) = 0) ” 
  &&  “ (0 < (batch_pre ÷ 4 )) ” 
  &&  “ ((batch_pre ÷ 4 ) <= 4611686018427387903) ” 
  &&  “ (0 <= (batch ÷ 4 )) ” 
  &&  “ ((batch ÷ 4 ) <= (batch_pre ÷ 4 )) ” 
  &&  “ (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT)))) ”
  &&  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (UndefStructPredfloat32x4_t ( &( "vx" ) ) )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) )
.

Definition test_neon_partial_solve_wit_5 := test_neon_partial_solve_wit_5_pure -> test_neon_partial_solve_wit_5_aux.

Definition test_neon_partial_solve_wit_6 := 
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (output: Z) (input: Z) (batch: Z) (retval: Z) (PreH1 : (batch >= (4 * sizeof(FLOAT) ))) (PreH2 : (sizeof(FLOAT) = 4)) (PreH3 : (batch = (4 * (batch ÷ 4 ) ))) (PreH4 : ((batch % ( 4 ) ) = 0)) (PreH5 : ((batch % ( sizeof(FLOAT) ) ) = 0)) (PreH6 : (0 < (batch_pre ÷ 4 ))) (PreH7 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH8 : (0 <= (batch ÷ 4 ))) (PreH9 : ((batch ÷ 4 ) <= (batch_pre ÷ 4 ))) (PreH10 : (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH11 : (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) ,
  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  ((&((retval)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))
  **  ((&((retval)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))
  **  ((&((retval)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))
  **  ((&((retval)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))
  **  (UndefStructPredfloat32x4_t ( &( "vx" ) ) )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) )
|--
  “ (batch >= (4 * sizeof(FLOAT) )) ” 
  &&  “ (sizeof(FLOAT) = 4) ” 
  &&  “ (batch = (4 * (batch ÷ 4 ) )) ” 
  &&  “ ((batch % ( 4 ) ) = 0) ” 
  &&  “ ((batch % ( sizeof(FLOAT) ) ) = 0) ” 
  &&  “ (0 < (batch_pre ÷ 4 )) ” 
  &&  “ ((batch_pre ÷ 4 ) <= 4611686018427387903) ” 
  &&  “ (0 <= (batch ÷ 4 )) ” 
  &&  “ ((batch ÷ 4 ) <= (batch_pre ÷ 4 )) ” 
  &&  “ (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT)))) ”
  &&  ((&(( &( "vx" ) )->ₛ "s3")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s2")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s1")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s0")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) )
.

Definition test_neon_partial_solve_wit_7 := 
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (output: Z) (input: Z) (batch: Z) (PreH1 : (batch >= (4 * sizeof(FLOAT) ))) (PreH2 : (sizeof(FLOAT) = 4)) (PreH3 : (batch = (4 * (batch ÷ 4 ) ))) (PreH4 : ((batch % ( 4 ) ) = 0)) (PreH5 : ((batch % ( sizeof(FLOAT) ) ) = 0)) (PreH6 : (0 < (batch_pre ÷ 4 ))) (PreH7 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH8 : (0 <= (batch ÷ 4 ))) (PreH9 : ((batch ÷ 4 ) <= (batch_pre ÷ 4 ))) (PreH10 : (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH11 : (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) ,
  (UndefStructPredfloat32x4_t ( &( "vy" ) ) )
  **  ((&(( &( "vx" ) )->ₛ "s3")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s2")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s1")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s0")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) )
|--
  “ (batch >= (4 * sizeof(FLOAT) )) ” 
  &&  “ (sizeof(FLOAT) = 4) ” 
  &&  “ (batch = (4 * (batch ÷ 4 ) )) ” 
  &&  “ ((batch % ( 4 ) ) = 0) ” 
  &&  “ ((batch % ( sizeof(FLOAT) ) ) = 0) ” 
  &&  “ (0 < (batch_pre ÷ 4 )) ” 
  &&  “ ((batch_pre ÷ 4 ) <= 4611686018427387903) ” 
  &&  “ (0 <= (batch ÷ 4 )) ” 
  &&  “ ((batch ÷ 4 ) <= (batch_pre ÷ 4 )) ” 
  &&  “ (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT)))) ”
  &&  ((&(( &( "vx" ) )->ₛ "s0")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s1")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s2")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s3")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))
  **  (UndefStructPredfloat32x4_t ( &( "vy" ) ) )
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) )
.

Definition test_neon_partial_solve_wit_8 := 
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (output: Z) (input: Z) (batch: Z) (retval: Z) (PreH1 : (batch >= (4 * sizeof(FLOAT) ))) (PreH2 : (sizeof(FLOAT) = 4)) (PreH3 : (batch = (4 * (batch ÷ 4 ) ))) (PreH4 : ((batch % ( 4 ) ) = 0)) (PreH5 : ((batch % ( sizeof(FLOAT) ) ) = 0)) (PreH6 : (0 < (batch_pre ÷ 4 ))) (PreH7 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH8 : (0 <= (batch ÷ 4 ))) (PreH9 : ((batch ÷ 4 ) <= (batch_pre ÷ 4 ))) (PreH10 : (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH11 : (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) ,
  ((&((retval)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  ((&((retval)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))
  **  ((&((retval)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))))
  **  ((&((retval)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))))
  **  (UndefStructPredfloat32x4_t ( &( "vy" ) ) )
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) )
  **  ((&(( &( "vx" ) )->ₛ "s0")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s1")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s2")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s3")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))
|--
  “ (batch >= (4 * sizeof(FLOAT) )) ” 
  &&  “ (sizeof(FLOAT) = 4) ” 
  &&  “ (batch = (4 * (batch ÷ 4 ) )) ” 
  &&  “ ((batch % ( 4 ) ) = 0) ” 
  &&  “ ((batch % ( sizeof(FLOAT) ) ) = 0) ” 
  &&  “ (0 < (batch_pre ÷ 4 )) ” 
  &&  “ ((batch_pre ÷ 4 ) <= 4611686018427387903) ” 
  &&  “ (0 <= (batch ÷ 4 )) ” 
  &&  “ ((batch ÷ 4 ) <= (batch_pre ÷ 4 )) ” 
  &&  “ (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT)))) ”
  &&  ((&(( &( "vy" ) )->ₛ "s3")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s2")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s1")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s0")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) )
  **  ((&(( &( "vx" ) )->ₛ "s0")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s1")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s2")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s3")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))
.

Definition test_neon_partial_solve_wit_9 := 
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (output: Z) (input: Z) (batch: Z) (PreH1 : (batch >= (4 * sizeof(FLOAT) ))) (PreH2 : (sizeof(FLOAT) = 4)) (PreH3 : (batch = (4 * (batch ÷ 4 ) ))) (PreH4 : ((batch % ( 4 ) ) = 0)) (PreH5 : ((batch % ( sizeof(FLOAT) ) ) = 0)) (PreH6 : (0 < (batch_pre ÷ 4 ))) (PreH7 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH8 : (0 <= (batch ÷ 4 ))) (PreH9 : ((batch ÷ 4 ) <= (batch_pre ÷ 4 ))) (PreH10 : (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH11 : (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) ,
  ((&(( &( "vy" ) )->ₛ "s3")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s2")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) )
  **  ((&(( &( "vx" ) )->ₛ "s0")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s1")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s2")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s3")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))
|--
  “ (batch >= (4 * sizeof(FLOAT) )) ” 
  &&  “ (sizeof(FLOAT) = 4) ” 
  &&  “ (batch = (4 * (batch ÷ 4 ) )) ” 
  &&  “ ((batch % ( 4 ) ) = 0) ” 
  &&  “ ((batch % ( sizeof(FLOAT) ) ) = 0) ” 
  &&  “ (0 < (batch_pre ÷ 4 )) ” 
  &&  “ ((batch_pre ÷ 4 ) <= 4611686018427387903) ” 
  &&  “ (0 <= (batch ÷ 4 )) ” 
  &&  “ ((batch ÷ 4 ) <= (batch_pre ÷ 4 )) ” 
  &&  “ (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT)))) ”
  &&  ((&(( &( "vy" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s2")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s3")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))))
  **  (FloatArray.undef_full output 4 )
  **  (FloatArray.undef_full (output + (4 * sizeof(FLOAT))) (((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) - 4 ) )
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
  **  ((&(( &( "vx" ) )->ₛ "s0")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s1")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s2")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s3")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))
.

Definition test_neon_partial_solve_wit_10_pure := 
(
forall (unused_params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (output: Z) (input: Z) (batch: Z) (PreH1 : (batch <> 0)) (PreH2 : (batch < (4 * sizeof(FLOAT) ))) (PreH3 : (sizeof(FLOAT) = 4)) (PreH4 : (batch = (4 * (batch ÷ 4 ) ))) (PreH5 : ((batch % ( 4 ) ) = 0)) (PreH6 : ((batch % ( sizeof(FLOAT) ) ) = 0)) (PreH7 : (0 < (batch_pre ÷ 4 ))) (PreH8 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH9 : (0 <= (batch ÷ 4 ))) (PreH10 : ((batch ÷ 4 ) <= (batch_pre ÷ 4 ))) (PreH11 : (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH12 : (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) ,
  (UndefStructPredfloat32x4_t ( &( "vx" ) ) )
  **  ((( &( "unused_params" ) )) # Ptr  |-> unused_params_pre)
  **  ((( &( "batch" ) )) # UInt64  |-> batch)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) )
|--
  “ (0 <= ((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) ” 
  &&  “ ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 4 ) <= ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ (input = (input_pre + (4 * ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) )) ” 
  &&  “ ((input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * 4)) = (input_pre + (4 * ((batch_pre ÷ 4 ) - ((4 * (batch ÷ 4 ) ) ÷ 4 ) ) ) )) ” 
  &&  “ ((((batch_pre ÷ 4 ) - ((4 * (batch ÷ 4 ) ) ÷ 4 ) ) + 4 ) <= ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ (0 <= ((batch_pre ÷ 4 ) - ((4 * (batch ÷ 4 ) ) ÷ 4 ) )) ”
) \/
(
forall (unused_params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (output: Z) (input: Z) (batch: Z) (PreH1 : (batch <= UINT64_MAX)) (PreH2 : (batch >= 0)) (PreH3 : (batch <> 0)) (PreH4 : (batch < (4 * sizeof(FLOAT) ))) (PreH5 : (sizeof(FLOAT) = 4)) (PreH6 : (batch = (4 * (batch ÷ 4 ) ))) (PreH7 : ((batch % ( 4 ) ) = 0)) (PreH8 : ((batch % ( sizeof(FLOAT) ) ) = 0)) (PreH9 : (0 < (batch_pre ÷ 4 ))) (PreH10 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH11 : (0 <= (batch ÷ 4 ))) (PreH12 : ((batch ÷ 4 ) <= (batch_pre ÷ 4 ))) (PreH13 : (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH14 : (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) ,
  (UndefStructPredfloat32x4_t ( &( "vx" ) ) )
  **  ((( &( "unused_params" ) )) # Ptr  |-> unused_params_pre)
  **  ((( &( "batch" ) )) # UInt64  |-> batch)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) )
|--
  “ (0 <= ((batch_pre ÷ 4 ) - ((4 * (batch ÷ 4 ) ) ÷ 4 ) )) ” 
  &&  “ ((((batch_pre ÷ 4 ) - ((4 * (batch ÷ 4 ) ) ÷ 4 ) ) + 4 ) <= ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ ((input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * 4)) = (input_pre + (4 * ((batch_pre ÷ 4 ) - ((4 * (batch ÷ 4 ) ) ÷ 4 ) ) ) )) ”
).

Definition test_neon_partial_solve_wit_10_pure_split_goal_1 := 
forall (unused_params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (output: Z) (input: Z) (batch: Z) (PreH1 : (batch <= UINT64_MAX)) (PreH2 : (batch >= 0)) (PreH3 : (batch <> 0)) (PreH4 : (batch < (4 * sizeof(FLOAT) ))) (PreH5 : (sizeof(FLOAT) = 4)) (PreH6 : (batch = (4 * (batch ÷ 4 ) ))) (PreH7 : ((batch % ( 4 ) ) = 0)) (PreH8 : ((batch % ( sizeof(FLOAT) ) ) = 0)) (PreH9 : (0 < (batch_pre ÷ 4 ))) (PreH10 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH11 : (0 <= (batch ÷ 4 ))) (PreH12 : ((batch ÷ 4 ) <= (batch_pre ÷ 4 ))) (PreH13 : (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH14 : (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) ,
  (UndefStructPredfloat32x4_t ( &( "vx" ) ) )
  **  ((( &( "unused_params" ) )) # Ptr  |-> unused_params_pre)
  **  ((( &( "batch" ) )) # UInt64  |-> batch)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) )
|--
  “ (0 <= ((batch_pre ÷ 4 ) - ((4 * (batch ÷ 4 ) ) ÷ 4 ) )) ”
.

Definition test_neon_partial_solve_wit_10_pure_split_goal_2 := 
forall (unused_params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (output: Z) (input: Z) (batch: Z) (PreH1 : (batch <= UINT64_MAX)) (PreH2 : (batch >= 0)) (PreH3 : (batch <> 0)) (PreH4 : (batch < (4 * sizeof(FLOAT) ))) (PreH5 : (sizeof(FLOAT) = 4)) (PreH6 : (batch = (4 * (batch ÷ 4 ) ))) (PreH7 : ((batch % ( 4 ) ) = 0)) (PreH8 : ((batch % ( sizeof(FLOAT) ) ) = 0)) (PreH9 : (0 < (batch_pre ÷ 4 ))) (PreH10 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH11 : (0 <= (batch ÷ 4 ))) (PreH12 : ((batch ÷ 4 ) <= (batch_pre ÷ 4 ))) (PreH13 : (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH14 : (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) ,
  (UndefStructPredfloat32x4_t ( &( "vx" ) ) )
  **  ((( &( "unused_params" ) )) # Ptr  |-> unused_params_pre)
  **  ((( &( "batch" ) )) # UInt64  |-> batch)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) )
|--
  “ ((((batch_pre ÷ 4 ) - ((4 * (batch ÷ 4 ) ) ÷ 4 ) ) + 4 ) <= ((batch_pre ÷ 4 ) + 3 )) ”
.

Definition test_neon_partial_solve_wit_10_pure_split_goal_3 := 
forall (unused_params_pre: Z) (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (output: Z) (input: Z) (batch: Z) (PreH1 : (batch <= UINT64_MAX)) (PreH2 : (batch >= 0)) (PreH3 : (batch <> 0)) (PreH4 : (batch < (4 * sizeof(FLOAT) ))) (PreH5 : (sizeof(FLOAT) = 4)) (PreH6 : (batch = (4 * (batch ÷ 4 ) ))) (PreH7 : ((batch % ( 4 ) ) = 0)) (PreH8 : ((batch % ( sizeof(FLOAT) ) ) = 0)) (PreH9 : (0 < (batch_pre ÷ 4 ))) (PreH10 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH11 : (0 <= (batch ÷ 4 ))) (PreH12 : ((batch ÷ 4 ) <= (batch_pre ÷ 4 ))) (PreH13 : (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH14 : (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) ,
  (UndefStructPredfloat32x4_t ( &( "vx" ) ) )
  **  ((( &( "unused_params" ) )) # Ptr  |-> unused_params_pre)
  **  ((( &( "batch" ) )) # UInt64  |-> batch)
  **  ((( &( "input" ) )) # Ptr  |-> input)
  **  ((( &( "output" ) )) # Ptr  |-> output)
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) )
|--
  “ ((input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * 4)) = (input_pre + (4 * ((batch_pre ÷ 4 ) - ((4 * (batch ÷ 4 ) ) ÷ 4 ) ) ) )) ”
.

Definition test_neon_partial_solve_wit_10_aux := 
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (output: Z) (input: Z) (batch: Z) (PreH1 : (batch <> 0)) (PreH2 : (batch < (4 * sizeof(FLOAT) ))) (PreH3 : (sizeof(FLOAT) = 4)) (PreH4 : (batch = (4 * (batch ÷ 4 ) ))) (PreH5 : ((batch % ( 4 ) ) = 0)) (PreH6 : ((batch % ( sizeof(FLOAT) ) ) = 0)) (PreH7 : (0 < (batch_pre ÷ 4 ))) (PreH8 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH9 : (0 <= (batch ÷ 4 ))) (PreH10 : ((batch ÷ 4 ) <= (batch_pre ÷ 4 ))) (PreH11 : (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH12 : (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) ,
  (UndefStructPredfloat32x4_t ( &( "vx" ) ) )
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) )
|--
  “ (0 <= ((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) ” 
  &&  “ ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 4 ) <= ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ (input = (input_pre + (4 * ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) )) ” 
  &&  “ ((input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * 4)) = (input_pre + (4 * ((batch_pre ÷ 4 ) - ((4 * (batch ÷ 4 ) ) ÷ 4 ) ) ) )) ” 
  &&  “ ((((batch_pre ÷ 4 ) - ((4 * (batch ÷ 4 ) ) ÷ 4 ) ) + 4 ) <= ((batch_pre ÷ 4 ) + 3 )) ” 
  &&  “ (0 <= ((batch_pre ÷ 4 ) - ((4 * (batch ÷ 4 ) ) ÷ 4 ) )) ” 
  &&  “ (batch <> 0) ” 
  &&  “ (batch < (4 * sizeof(FLOAT) )) ” 
  &&  “ (sizeof(FLOAT) = 4) ” 
  &&  “ (batch = (4 * (batch ÷ 4 ) )) ” 
  &&  “ ((batch % ( 4 ) ) = 0) ” 
  &&  “ ((batch % ( sizeof(FLOAT) ) ) = 0) ” 
  &&  “ (0 < (batch_pre ÷ 4 )) ” 
  &&  “ ((batch_pre ÷ 4 ) <= 4611686018427387903) ” 
  &&  “ (0 <= (batch ÷ 4 )) ” 
  &&  “ ((batch ÷ 4 ) <= (batch_pre ÷ 4 )) ” 
  &&  “ (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT)))) ”
  &&  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (UndefStructPredfloat32x4_t ( &( "vx" ) ) )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) )
.

Definition test_neon_partial_solve_wit_10 := test_neon_partial_solve_wit_10_pure -> test_neon_partial_solve_wit_10_aux.

Definition test_neon_partial_solve_wit_11 := 
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (output: Z) (input: Z) (batch: Z) (retval: Z) (PreH1 : (batch <> 0)) (PreH2 : (batch < (4 * sizeof(FLOAT) ))) (PreH3 : (sizeof(FLOAT) = 4)) (PreH4 : (batch = (4 * (batch ÷ 4 ) ))) (PreH5 : ((batch % ( 4 ) ) = 0)) (PreH6 : ((batch % ( sizeof(FLOAT) ) ) = 0)) (PreH7 : (0 < (batch_pre ÷ 4 ))) (PreH8 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH9 : (0 <= (batch ÷ 4 ))) (PreH10 : ((batch ÷ 4 ) <= (batch_pre ÷ 4 ))) (PreH11 : (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH12 : (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) ,
  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  ((&((retval)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))
  **  ((&((retval)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))
  **  ((&((retval)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))
  **  ((&((retval)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))
  **  (UndefStructPredfloat32x4_t ( &( "vx" ) ) )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) )
|--
  “ (batch <> 0) ” 
  &&  “ (batch < (4 * sizeof(FLOAT) )) ” 
  &&  “ (sizeof(FLOAT) = 4) ” 
  &&  “ (batch = (4 * (batch ÷ 4 ) )) ” 
  &&  “ ((batch % ( 4 ) ) = 0) ” 
  &&  “ ((batch % ( sizeof(FLOAT) ) ) = 0) ” 
  &&  “ (0 < (batch_pre ÷ 4 )) ” 
  &&  “ ((batch_pre ÷ 4 ) <= 4611686018427387903) ” 
  &&  “ (0 <= (batch ÷ 4 )) ” 
  &&  “ ((batch ÷ 4 ) <= (batch_pre ÷ 4 )) ” 
  &&  “ (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT)))) ”
  &&  ((&(( &( "vx" ) )->ₛ "s3")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s2")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s1")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s0")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) )
.

Definition test_neon_partial_solve_wit_12 := 
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (output: Z) (input: Z) (batch: Z) (PreH1 : (batch <> 0)) (PreH2 : (batch < (4 * sizeof(FLOAT) ))) (PreH3 : (sizeof(FLOAT) = 4)) (PreH4 : (batch = (4 * (batch ÷ 4 ) ))) (PreH5 : ((batch % ( 4 ) ) = 0)) (PreH6 : ((batch % ( sizeof(FLOAT) ) ) = 0)) (PreH7 : (0 < (batch_pre ÷ 4 ))) (PreH8 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH9 : (0 <= (batch ÷ 4 ))) (PreH10 : ((batch ÷ 4 ) <= (batch_pre ÷ 4 ))) (PreH11 : (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH12 : (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) ,
  (UndefStructPredfloat32x4_t ( &( "vy" ) ) )
  **  ((&(( &( "vx" ) )->ₛ "s3")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s2")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s1")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s0")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) )
|--
  “ (batch <> 0) ” 
  &&  “ (batch < (4 * sizeof(FLOAT) )) ” 
  &&  “ (sizeof(FLOAT) = 4) ” 
  &&  “ (batch = (4 * (batch ÷ 4 ) )) ” 
  &&  “ ((batch % ( 4 ) ) = 0) ” 
  &&  “ ((batch % ( sizeof(FLOAT) ) ) = 0) ” 
  &&  “ (0 < (batch_pre ÷ 4 )) ” 
  &&  “ ((batch_pre ÷ 4 ) <= 4611686018427387903) ” 
  &&  “ (0 <= (batch ÷ 4 )) ” 
  &&  “ ((batch ÷ 4 ) <= (batch_pre ÷ 4 )) ” 
  &&  “ (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT)))) ”
  &&  ((&(( &( "vx" ) )->ₛ "s0")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s1")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s2")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s3")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))
  **  (UndefStructPredfloat32x4_t ( &( "vy" ) ) )
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) )
.

Definition test_neon_partial_solve_wit_13 := 
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (output: Z) (input: Z) (batch: Z) (retval: Z) (PreH1 : (batch <> 0)) (PreH2 : (batch < (4 * sizeof(FLOAT) ))) (PreH3 : (sizeof(FLOAT) = 4)) (PreH4 : (batch = (4 * (batch ÷ 4 ) ))) (PreH5 : ((batch % ( 4 ) ) = 0)) (PreH6 : ((batch % ( sizeof(FLOAT) ) ) = 0)) (PreH7 : (0 < (batch_pre ÷ 4 ))) (PreH8 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH9 : (0 <= (batch ÷ 4 ))) (PreH10 : ((batch ÷ 4 ) <= (batch_pre ÷ 4 ))) (PreH11 : (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH12 : (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) ,
  ((&((retval)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  ((&((retval)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))
  **  ((&((retval)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))))
  **  ((&((retval)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))))
  **  (UndefStructPredfloat32x4_t ( &( "vy" ) ) )
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) )
  **  ((&(( &( "vx" ) )->ₛ "s0")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s1")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s2")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s3")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))
|--
  “ (batch <> 0) ” 
  &&  “ (batch < (4 * sizeof(FLOAT) )) ” 
  &&  “ (sizeof(FLOAT) = 4) ” 
  &&  “ (batch = (4 * (batch ÷ 4 ) )) ” 
  &&  “ ((batch % ( 4 ) ) = 0) ” 
  &&  “ ((batch % ( sizeof(FLOAT) ) ) = 0) ” 
  &&  “ (0 < (batch_pre ÷ 4 )) ” 
  &&  “ ((batch_pre ÷ 4 ) <= 4611686018427387903) ” 
  &&  “ (0 <= (batch ÷ 4 )) ” 
  &&  “ ((batch ÷ 4 ) <= (batch_pre ÷ 4 )) ” 
  &&  “ (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT)))) ”
  &&  ((&(( &( "vy" ) )->ₛ "s3")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s3")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s2")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s2")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s1")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s0")) # Float  |->_)
  **  ((&((retval)  # "float32x4_t" ->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) )
  **  ((&(( &( "vx" ) )->ₛ "s0")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s1")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s2")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s3")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))
.

Definition test_neon_partial_solve_wit_14 := 
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (output: Z) (input: Z) (batch: Z) (PreH1 : (batch <> 0)) (PreH2 : (batch < (4 * sizeof(FLOAT) ))) (PreH3 : (sizeof(FLOAT) = 4)) (PreH4 : (batch = (4 * (batch ÷ 4 ) ))) (PreH5 : ((batch % ( 4 ) ) = 0)) (PreH6 : ((batch % ( sizeof(FLOAT) ) ) = 0)) (PreH7 : (0 < (batch_pre ÷ 4 ))) (PreH8 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH9 : (0 <= (batch ÷ 4 ))) (PreH10 : ((batch ÷ 4 ) <= (batch_pre ÷ 4 ))) (PreH11 : (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH12 : (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) ,
  (UndefStructPredfloat32x2_t ( &( "vy_lo" ) ) )
  **  ((&(( &( "vy" ) )->ₛ "s3")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s2")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) )
  **  ((&(( &( "vx" ) )->ₛ "s0")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s1")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s2")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s3")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))
|--
  “ (batch <> 0) ” 
  &&  “ (batch < (4 * sizeof(FLOAT) )) ” 
  &&  “ (sizeof(FLOAT) = 4) ” 
  &&  “ (batch = (4 * (batch ÷ 4 ) )) ” 
  &&  “ ((batch % ( 4 ) ) = 0) ” 
  &&  “ ((batch % ( sizeof(FLOAT) ) ) = 0) ” 
  &&  “ (0 < (batch_pre ÷ 4 )) ” 
  &&  “ ((batch_pre ÷ 4 ) <= 4611686018427387903) ” 
  &&  “ (0 <= (batch ÷ 4 )) ” 
  &&  “ ((batch ÷ 4 ) <= (batch_pre ÷ 4 )) ” 
  &&  “ (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT)))) ”
  &&  ((&(( &( "vy" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s2")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s3")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))))
  **  (UndefStructPredfloat32x2_t ( &( "vy_lo" ) ) )
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) )
  **  ((&(( &( "vx" ) )->ₛ "s0")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s1")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s2")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s3")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))
.

Definition test_neon_partial_solve_wit_15 := 
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (output: Z) (input: Z) (batch: Z) (retval: Z) (PreH1 : (batch <> 0)) (PreH2 : (batch < (4 * sizeof(FLOAT) ))) (PreH3 : (sizeof(FLOAT) = 4)) (PreH4 : (batch = (4 * (batch ÷ 4 ) ))) (PreH5 : ((batch % ( 4 ) ) = 0)) (PreH6 : ((batch % ( sizeof(FLOAT) ) ) = 0)) (PreH7 : (0 < (batch_pre ÷ 4 ))) (PreH8 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH9 : (0 <= (batch ÷ 4 ))) (PreH10 : ((batch ÷ 4 ) <= (batch_pre ÷ 4 ))) (PreH11 : (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH12 : (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) ,
  ((&((retval)  # "float32x2_t" ->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  ((&((retval)  # "float32x2_t" ->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))
  **  (UndefStructPredfloat32x2_t ( &( "vy_lo" ) ) )
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) )
  **  ((&(( &( "vx" ) )->ₛ "s0")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s1")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s2")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s3")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))
  **  ((&(( &( "vy" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s2")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s3")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))))
|--
  “ (batch <> 0) ” 
  &&  “ (batch < (4 * sizeof(FLOAT) )) ” 
  &&  “ (sizeof(FLOAT) = 4) ” 
  &&  “ (batch = (4 * (batch ÷ 4 ) )) ” 
  &&  “ ((batch % ( 4 ) ) = 0) ” 
  &&  “ ((batch % ( sizeof(FLOAT) ) ) = 0) ” 
  &&  “ (0 < (batch_pre ÷ 4 )) ” 
  &&  “ ((batch_pre ÷ 4 ) <= 4611686018427387903) ” 
  &&  “ (0 <= (batch ÷ 4 )) ” 
  &&  “ ((batch ÷ 4 ) <= (batch_pre ÷ 4 )) ” 
  &&  “ (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT)))) ”
  &&  ((&(( &( "vy_lo" ) )->ₛ "s1")) # Float  |->_)
  **  ((&((retval)  # "float32x2_t" ->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))
  **  ((&(( &( "vy_lo" ) )->ₛ "s0")) # Float  |->_)
  **  ((&((retval)  # "float32x2_t" ->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) )
  **  ((&(( &( "vx" ) )->ₛ "s0")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s1")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s2")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s3")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))
  **  ((&(( &( "vy" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s2")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s3")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))))
.

Definition test_neon_partial_solve_wit_16 := 
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (batch: Z) (input: Z) (output: Z) (PreH1 : (sizeof(FLOAT) = 4)) (PreH2 : (batch = (4 * (batch ÷ 4 ) ))) (PreH3 : ((batch % ( 4 ) ) = 0)) (PreH4 : ((batch % ( sizeof(FLOAT) ) ) = 0)) (PreH5 : (0 < (batch_pre ÷ 4 ))) (PreH6 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH7 : (0 <= (batch ÷ 4 ))) (PreH8 : ((batch ÷ 4 ) <= (batch_pre ÷ 4 ))) (PreH9 : (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH10 : (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH11 : (batch = 8)) (PreH12 : ((Z.land batch (2 * sizeof(FLOAT) )) <> 0)) ,
  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) )
  **  ((&(( &( "vx" ) )->ₛ "s0")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s1")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s2")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s3")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))
  **  ((&(( &( "vy" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s2")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s3")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))))
  **  ((&(( &( "vy_lo" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  ((&(( &( "vy_lo" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))
|--
  “ (sizeof(FLOAT) = 4) ” 
  &&  “ (batch = (4 * (batch ÷ 4 ) )) ” 
  &&  “ ((batch % ( 4 ) ) = 0) ” 
  &&  “ ((batch % ( sizeof(FLOAT) ) ) = 0) ” 
  &&  “ (0 < (batch_pre ÷ 4 )) ” 
  &&  “ ((batch_pre ÷ 4 ) <= 4611686018427387903) ” 
  &&  “ (0 <= (batch ÷ 4 )) ” 
  &&  “ ((batch ÷ 4 ) <= (batch_pre ÷ 4 )) ” 
  &&  “ (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT)))) ” 
  &&  “ (batch = 8) ” 
  &&  “ ((Z.land batch (2 * sizeof(FLOAT) )) <> 0) ”
  &&  ((&(( &( "vy_lo" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  ((&(( &( "vy_lo" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))
  **  (FloatArray.undef_full output 2 )
  **  (FloatArray.undef_full (output + (2 * sizeof(FLOAT))) (((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) - 2 ) )
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
  **  ((&(( &( "vx" ) )->ₛ "s0")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s1")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s2")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s3")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))
  **  ((&(( &( "vy" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s2")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s3")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))))
.

Definition test_neon_partial_solve_wit_17 := 
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (batch: Z) (input: Z) (output: Z) (PreH1 : (sizeof(FLOAT) = 4)) (PreH2 : (batch = (4 * (batch ÷ 4 ) ))) (PreH3 : ((batch % ( 4 ) ) = 0)) (PreH4 : ((batch % ( sizeof(FLOAT) ) ) = 0)) (PreH5 : (0 < (batch_pre ÷ 4 ))) (PreH6 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH7 : (0 <= (batch ÷ 4 ))) (PreH8 : ((batch ÷ 4 ) <= (batch_pre ÷ 4 ))) (PreH9 : (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH10 : (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH11 : (batch = 12)) (PreH12 : ((Z.land batch (2 * sizeof(FLOAT) )) <> 0)) ,
  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) )
  **  ((&(( &( "vx" ) )->ₛ "s0")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s1")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s2")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s3")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))
  **  ((&(( &( "vy" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s2")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s3")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))))
  **  ((&(( &( "vy_lo" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  ((&(( &( "vy_lo" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))
|--
  “ (sizeof(FLOAT) = 4) ” 
  &&  “ (batch = (4 * (batch ÷ 4 ) )) ” 
  &&  “ ((batch % ( 4 ) ) = 0) ” 
  &&  “ ((batch % ( sizeof(FLOAT) ) ) = 0) ” 
  &&  “ (0 < (batch_pre ÷ 4 )) ” 
  &&  “ ((batch_pre ÷ 4 ) <= 4611686018427387903) ” 
  &&  “ (0 <= (batch ÷ 4 )) ” 
  &&  “ ((batch ÷ 4 ) <= (batch_pre ÷ 4 )) ” 
  &&  “ (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT)))) ” 
  &&  “ (batch = 12) ” 
  &&  “ ((Z.land batch (2 * sizeof(FLOAT) )) <> 0) ”
  &&  ((&(( &( "vy_lo" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  ((&(( &( "vy_lo" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))
  **  (FloatArray.undef_full output 2 )
  **  (FloatArray.undef_full (output + (2 * sizeof(FLOAT))) (((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) - 2 ) )
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
  **  ((&(( &( "vx" ) )->ₛ "s0")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s1")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s2")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s3")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))
  **  ((&(( &( "vy" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s2")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s3")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))))
.

Definition test_neon_partial_solve_wit_18 := 
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (batch: Z) (input: Z) (output: Z) (PreH1 : (sizeof(FLOAT) = 4)) (PreH2 : (batch = (4 * (batch ÷ 4 ) ))) (PreH3 : ((batch % ( 4 ) ) = 0)) (PreH4 : ((batch % ( sizeof(FLOAT) ) ) = 0)) (PreH5 : (0 < (batch_pre ÷ 4 ))) (PreH6 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH7 : (0 <= (batch ÷ 4 ))) (PreH8 : ((batch ÷ 4 ) <= (batch_pre ÷ 4 ))) (PreH9 : (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH10 : (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH11 : (batch = 8)) (PreH12 : ((Z.land batch (2 * sizeof(FLOAT) )) <> 0)) ,
  ((&(( &( "vy_lo" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  ((&(( &( "vy_lo" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))
  **  (FloatArray.full output 2 (sqrt_pack2 ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A))))) ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))) )
  **  (FloatArray.undef_full (output + (2 * sizeof(FLOAT))) (((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) - 2 ) )
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
  **  ((&(( &( "vx" ) )->ₛ "s0")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s1")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s2")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s3")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))
  **  ((&(( &( "vy" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s2")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s3")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))))
|--
  “ (sizeof(FLOAT) = 4) ” 
  &&  “ (batch = (4 * (batch ÷ 4 ) )) ” 
  &&  “ ((batch % ( 4 ) ) = 0) ” 
  &&  “ ((batch % ( sizeof(FLOAT) ) ) = 0) ” 
  &&  “ (0 < (batch_pre ÷ 4 )) ” 
  &&  “ ((batch_pre ÷ 4 ) <= 4611686018427387903) ” 
  &&  “ (0 <= (batch ÷ 4 )) ” 
  &&  “ ((batch ÷ 4 ) <= (batch_pre ÷ 4 )) ” 
  &&  “ (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT)))) ” 
  &&  “ (batch = 8) ” 
  &&  “ ((Z.land batch (2 * sizeof(FLOAT) )) <> 0) ”
  &&  ((&(( &( "vy" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s2")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s3")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))))
  **  ((&(( &( "vy_lo" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  ((&(( &( "vy_lo" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))
  **  (FloatArray.full output 2 (sqrt_pack2 ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A))))) ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))) )
  **  (FloatArray.undef_full (output + (2 * sizeof(FLOAT))) (((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) - 2 ) )
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
  **  ((&(( &( "vx" ) )->ₛ "s0")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s1")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s2")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s3")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))
.

Definition test_neon_partial_solve_wit_19 := 
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (batch: Z) (input: Z) (output: Z) (retval: Z) (PreH1 : (sizeof(FLOAT) = 4)) (PreH2 : (batch = (4 * (batch ÷ 4 ) ))) (PreH3 : ((batch % ( 4 ) ) = 0)) (PreH4 : ((batch % ( sizeof(FLOAT) ) ) = 0)) (PreH5 : (0 < (batch_pre ÷ 4 ))) (PreH6 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH7 : (0 <= (batch ÷ 4 ))) (PreH8 : ((batch ÷ 4 ) <= (batch_pre ÷ 4 ))) (PreH9 : (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH10 : (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH11 : (batch = 8)) (PreH12 : ((Z.land batch (2 * sizeof(FLOAT) )) <> 0)) ,
  (UndefStructPredfloat32x2_t ( &( "vy_lo" ) ) )
  **  ((&((retval)  # "float32x2_t" ->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))))
  **  ((&((retval)  # "float32x2_t" ->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))))
  **  (FloatArray.full output 2 (sqrt_pack2 ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A))))) ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))) )
  **  (FloatArray.undef_full (output + (2 * sizeof(FLOAT))) (((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) - 2 ) )
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
  **  ((&(( &( "vx" ) )->ₛ "s0")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s1")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s2")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s3")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))
  **  ((&(( &( "vy" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s2")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s3")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))))
|--
  “ (sizeof(FLOAT) = 4) ” 
  &&  “ (batch = (4 * (batch ÷ 4 ) )) ” 
  &&  “ ((batch % ( 4 ) ) = 0) ” 
  &&  “ ((batch % ( sizeof(FLOAT) ) ) = 0) ” 
  &&  “ (0 < (batch_pre ÷ 4 )) ” 
  &&  “ ((batch_pre ÷ 4 ) <= 4611686018427387903) ” 
  &&  “ (0 <= (batch ÷ 4 )) ” 
  &&  “ ((batch ÷ 4 ) <= (batch_pre ÷ 4 )) ” 
  &&  “ (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT)))) ” 
  &&  “ (batch = 8) ” 
  &&  “ ((Z.land batch (2 * sizeof(FLOAT) )) <> 0) ”
  &&  ((&(( &( "vy_lo" ) )->ₛ "s1")) # Float  |->_)
  **  ((&((retval)  # "float32x2_t" ->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))))
  **  ((&(( &( "vy_lo" ) )->ₛ "s0")) # Float  |->_)
  **  ((&((retval)  # "float32x2_t" ->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))))
  **  (FloatArray.full output 2 (sqrt_pack2 ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A))))) ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))) )
  **  (FloatArray.undef_full (output + (2 * sizeof(FLOAT))) (((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) - 2 ) )
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
  **  ((&(( &( "vx" ) )->ₛ "s0")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s1")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s2")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s3")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))
  **  ((&(( &( "vy" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s2")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s3")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))))
.

Definition test_neon_partial_solve_wit_20 := 
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (batch: Z) (input: Z) (output: Z) (PreH1 : (sizeof(FLOAT) = 4)) (PreH2 : (batch = (4 * (batch ÷ 4 ) ))) (PreH3 : ((batch % ( 4 ) ) = 0)) (PreH4 : ((batch % ( sizeof(FLOAT) ) ) = 0)) (PreH5 : (0 < (batch_pre ÷ 4 ))) (PreH6 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH7 : (0 <= (batch ÷ 4 ))) (PreH8 : ((batch ÷ 4 ) <= (batch_pre ÷ 4 ))) (PreH9 : (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH10 : (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH11 : (batch = 12)) (PreH12 : ((Z.land batch (2 * sizeof(FLOAT) )) <> 0)) ,
  ((&(( &( "vy_lo" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  ((&(( &( "vy_lo" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))
  **  (FloatArray.full output 2 (sqrt_pack2 ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A))))) ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))) )
  **  (FloatArray.undef_full (output + (2 * sizeof(FLOAT))) (((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) - 2 ) )
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
  **  ((&(( &( "vx" ) )->ₛ "s0")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s1")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s2")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s3")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))
  **  ((&(( &( "vy" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s2")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s3")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))))
|--
  “ (sizeof(FLOAT) = 4) ” 
  &&  “ (batch = (4 * (batch ÷ 4 ) )) ” 
  &&  “ ((batch % ( 4 ) ) = 0) ” 
  &&  “ ((batch % ( sizeof(FLOAT) ) ) = 0) ” 
  &&  “ (0 < (batch_pre ÷ 4 )) ” 
  &&  “ ((batch_pre ÷ 4 ) <= 4611686018427387903) ” 
  &&  “ (0 <= (batch ÷ 4 )) ” 
  &&  “ ((batch ÷ 4 ) <= (batch_pre ÷ 4 )) ” 
  &&  “ (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT)))) ” 
  &&  “ (batch = 12) ” 
  &&  “ ((Z.land batch (2 * sizeof(FLOAT) )) <> 0) ”
  &&  ((&(( &( "vy" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s2")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s3")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))))
  **  ((&(( &( "vy_lo" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  ((&(( &( "vy_lo" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))
  **  (FloatArray.full output 2 (sqrt_pack2 ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A))))) ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))) )
  **  (FloatArray.undef_full (output + (2 * sizeof(FLOAT))) (((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) - 2 ) )
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
  **  ((&(( &( "vx" ) )->ₛ "s0")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s1")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s2")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s3")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))
.

Definition test_neon_partial_solve_wit_21 := 
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (batch: Z) (input: Z) (output: Z) (retval: Z) (PreH1 : (sizeof(FLOAT) = 4)) (PreH2 : (batch = (4 * (batch ÷ 4 ) ))) (PreH3 : ((batch % ( 4 ) ) = 0)) (PreH4 : ((batch % ( sizeof(FLOAT) ) ) = 0)) (PreH5 : (0 < (batch_pre ÷ 4 ))) (PreH6 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH7 : (0 <= (batch ÷ 4 ))) (PreH8 : ((batch ÷ 4 ) <= (batch_pre ÷ 4 ))) (PreH9 : (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH10 : (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH11 : (batch = 12)) (PreH12 : ((Z.land batch (2 * sizeof(FLOAT) )) <> 0)) ,
  (UndefStructPredfloat32x2_t ( &( "vy_lo" ) ) )
  **  ((&((retval)  # "float32x2_t" ->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))))
  **  ((&((retval)  # "float32x2_t" ->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))))
  **  (FloatArray.full output 2 (sqrt_pack2 ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A))))) ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))) )
  **  (FloatArray.undef_full (output + (2 * sizeof(FLOAT))) (((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) - 2 ) )
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
  **  ((&(( &( "vx" ) )->ₛ "s0")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s1")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s2")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s3")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))
  **  ((&(( &( "vy" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s2")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s3")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))))
|--
  “ (sizeof(FLOAT) = 4) ” 
  &&  “ (batch = (4 * (batch ÷ 4 ) )) ” 
  &&  “ ((batch % ( 4 ) ) = 0) ” 
  &&  “ ((batch % ( sizeof(FLOAT) ) ) = 0) ” 
  &&  “ (0 < (batch_pre ÷ 4 )) ” 
  &&  “ ((batch_pre ÷ 4 ) <= 4611686018427387903) ” 
  &&  “ (0 <= (batch ÷ 4 )) ” 
  &&  “ ((batch ÷ 4 ) <= (batch_pre ÷ 4 )) ” 
  &&  “ (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT)))) ” 
  &&  “ (batch = 12) ” 
  &&  “ ((Z.land batch (2 * sizeof(FLOAT) )) <> 0) ”
  &&  ((&(( &( "vy_lo" ) )->ₛ "s1")) # Float  |->_)
  **  ((&((retval)  # "float32x2_t" ->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))))
  **  ((&(( &( "vy_lo" ) )->ₛ "s0")) # Float  |->_)
  **  ((&((retval)  # "float32x2_t" ->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))))
  **  (FloatArray.full output 2 (sqrt_pack2 ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A))))) ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))) )
  **  (FloatArray.undef_full (output + (2 * sizeof(FLOAT))) (((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) - 2 ) )
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
  **  ((&(( &( "vx" ) )->ₛ "s0")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s1")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s2")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s3")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))
  **  ((&(( &( "vy" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s2")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s3")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))))
.

Definition test_neon_partial_solve_wit_22 := 
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (batch: Z) (input: Z) (output: Z) (PreH1 : (sizeof(FLOAT) = 4)) (PreH2 : (batch = (4 * (batch ÷ 4 ) ))) (PreH3 : ((batch % ( 4 ) ) = 0)) (PreH4 : ((batch % ( sizeof(FLOAT) ) ) = 0)) (PreH5 : (0 < (batch_pre ÷ 4 ))) (PreH6 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH7 : (0 <= (batch ÷ 4 ))) (PreH8 : ((batch ÷ 4 ) <= (batch_pre ÷ 4 ))) (PreH9 : (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH10 : (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH11 : (batch = 12)) (PreH12 : ((Z.land batch (2 * sizeof(FLOAT) )) <> 0)) (PreH13 : ((Z.land batch (1 * sizeof(FLOAT) )) <> 0)) ,
  ((&(( &( "vy_lo" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))))
  **  ((&(( &( "vy_lo" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))))
  **  (FloatArray.full output 2 (sqrt_pack2 ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A))))) ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))) )
  **  (FloatArray.undef_full (output + (2 * sizeof(FLOAT))) (((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) - 2 ) )
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
  **  ((&(( &( "vx" ) )->ₛ "s0")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s1")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s2")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s3")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))
  **  ((&(( &( "vy" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s2")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s3")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))))
|--
  “ (sizeof(FLOAT) = 4) ” 
  &&  “ (batch = (4 * (batch ÷ 4 ) )) ” 
  &&  “ ((batch % ( 4 ) ) = 0) ” 
  &&  “ ((batch % ( sizeof(FLOAT) ) ) = 0) ” 
  &&  “ (0 < (batch_pre ÷ 4 )) ” 
  &&  “ ((batch_pre ÷ 4 ) <= 4611686018427387903) ” 
  &&  “ (0 <= (batch ÷ 4 )) ” 
  &&  “ ((batch ÷ 4 ) <= (batch_pre ÷ 4 )) ” 
  &&  “ (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT)))) ” 
  &&  “ (batch = 12) ” 
  &&  “ ((Z.land batch (2 * sizeof(FLOAT) )) <> 0) ” 
  &&  “ ((Z.land batch (1 * sizeof(FLOAT) )) <> 0) ”
  &&  ((&(( &( "vy_lo" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))))
  **  ((&(( &( "vy_lo" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))))
  **  (FloatArray.undef_full (output + (2 * sizeof(FLOAT))) 1 )
  **  (FloatArray.undef_full (output + ((2 + 1 ) * sizeof(FLOAT))) ((((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) - 2 ) - 1 ) )
  **  (FloatArray.full output 2 (sqrt_pack2 ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A))))) ((sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))) )
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
  **  ((&(( &( "vx" ) )->ₛ "s0")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s1")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s2")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s3")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))
  **  ((&(( &( "vy" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s2")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s3")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))))
.

Definition test_neon_partial_solve_wit_23 := 
forall (output_pre: Z) (input_pre: Z) (batch_pre: Z) (A: (@list fp32)) (batch: Z) (input: Z) (output: Z) (PreH1 : (sizeof(FLOAT) = 4)) (PreH2 : (batch = (4 * (batch ÷ 4 ) ))) (PreH3 : ((batch % ( 4 ) ) = 0)) (PreH4 : ((batch % ( sizeof(FLOAT) ) ) = 0)) (PreH5 : (0 < (batch_pre ÷ 4 ))) (PreH6 : ((batch_pre ÷ 4 ) <= 4611686018427387903)) (PreH7 : (0 <= (batch ÷ 4 ))) (PreH8 : ((batch ÷ 4 ) <= (batch_pre ÷ 4 ))) (PreH9 : (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH10 : (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT))))) (PreH11 : (batch = 4)) (PreH12 : ((Z.land batch (2 * sizeof(FLOAT) )) = 0)) (PreH13 : ((Z.land batch (1 * sizeof(FLOAT) )) <> 0)) ,
  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
  **  (FloatArray.undef_full output ((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) )
  **  ((&(( &( "vx" ) )->ₛ "s0")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s1")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s2")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s3")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))
  **  ((&(( &( "vy" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s2")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s3")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))))
  **  ((&(( &( "vy_lo" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  ((&(( &( "vy_lo" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))
|--
  “ (sizeof(FLOAT) = 4) ” 
  &&  “ (batch = (4 * (batch ÷ 4 ) )) ” 
  &&  “ ((batch % ( 4 ) ) = 0) ” 
  &&  “ ((batch % ( sizeof(FLOAT) ) ) = 0) ” 
  &&  “ (0 < (batch_pre ÷ 4 )) ” 
  &&  “ ((batch_pre ÷ 4 ) <= 4611686018427387903) ” 
  &&  “ (0 <= (batch ÷ 4 )) ” 
  &&  “ ((batch ÷ 4 ) <= (batch_pre ÷ 4 )) ” 
  &&  “ (input = (input_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT)))) ” 
  &&  “ (output = (output_pre + (((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) * sizeof(FLOAT)))) ” 
  &&  “ (batch = 4) ” 
  &&  “ ((Z.land batch (2 * sizeof(FLOAT) )) = 0) ” 
  &&  “ ((Z.land batch (1 * sizeof(FLOAT) )) <> 0) ”
  &&  ((&(( &( "vy_lo" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  ((&(( &( "vy_lo" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))
  **  (FloatArray.undef_full output 1 )
  **  (FloatArray.undef_full (output + (1 * sizeof(FLOAT))) (((batch_pre ÷ 4 ) - ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) ) - 1 ) )
  **  (FloatArray.full input_pre ((batch_pre ÷ 4 ) + 3 ) A )
  **  (FloatArray.seg output_pre 0 ((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) (sqrt_arm_values (((batch_pre ÷ 4 ) - (batch ÷ 4 ) )) (A)) )
  **  ((&(( &( "vx" ) )->ₛ "s0")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s1")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s2")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))
  **  ((&(( &( "vx" ) )->ₛ "s3")) # Float  |-> (sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))
  **  ((&(( &( "vy" ) )->ₛ "s0")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 0 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s1")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 1 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s2")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 2 )) (A)))))
  **  ((&(( &( "vy" ) )->ₛ "s3")) # Float  |-> (sqrt_arm ((sqrt_lane ((((batch_pre ÷ 4 ) - (batch ÷ 4 ) ) + 3 )) (A)))))
.

Module Type VC_Correct.

Include sqrt_arrays_Strategy_Correct.

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
Axiom proof_of_test_neon_entail_wit_1 : test_neon_entail_wit_1.
Axiom proof_of_test_neon_entail_wit_2 : test_neon_entail_wit_2.
Axiom proof_of_test_neon_entail_wit_3 : test_neon_entail_wit_3.
Axiom proof_of_test_neon_entail_wit_4 : test_neon_entail_wit_4.
Axiom proof_of_test_neon_entail_wit_5_1 : test_neon_entail_wit_5_1.
Axiom proof_of_test_neon_entail_wit_5_2 : test_neon_entail_wit_5_2.
Axiom proof_of_test_neon_entail_wit_5_3 : test_neon_entail_wit_5_3.
Axiom proof_of_test_neon_entail_wit_6_1 : test_neon_entail_wit_6_1.
Axiom proof_of_test_neon_entail_wit_6_2 : test_neon_entail_wit_6_2.
Axiom proof_of_test_neon_entail_wit_6_3 : test_neon_entail_wit_6_3.
Axiom proof_of_test_neon_entail_wit_7_1 : test_neon_entail_wit_7_1.
Axiom proof_of_test_neon_entail_wit_7_2 : test_neon_entail_wit_7_2.
Axiom proof_of_test_neon_entail_wit_7_3 : test_neon_entail_wit_7_3.
Axiom proof_of_test_neon_entail_wit_8_1 : test_neon_entail_wit_8_1.
Axiom proof_of_test_neon_entail_wit_8_2 : test_neon_entail_wit_8_2.
Axiom proof_of_test_neon_entail_wit_8_3 : test_neon_entail_wit_8_3.
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
Axiom proof_of_test_neon_partial_solve_wit_10_pure : test_neon_partial_solve_wit_10_pure.
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

End VC_Correct.
