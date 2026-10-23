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
Require Import Qs8Cvt.Model.
Require Import Qs8Cvt.Types.
Require Import Qs8Cvt.MemoryModel.
Require Import Qs8Cvt.ProgramModel.
Require Import QcpVadd.VaddBits.
Require Import VaddComparator.ComparatorLogic.
Require Import VaddWrapper.WrapperLogic.
Require Import Qs8Cvt.ProgramModel NanBridge.BridgeLogic.
Local Open Scope sac.
From Qs8Cvt Require Import char_arrays_strategy_goal.
From Qs8Cvt Require Import char_arrays_strategy_proof.
From QcpVadd Require Import float_array_strategy_goal.
From QcpVadd Require Import float_array_strategy_proof.
From VaddComparator Require Import comparator_strategy_goal.
From VaddComparator Require Import comparator_strategy_proof.
From VaddWrapper Require Import wrapper_strategy_goal.
From VaddWrapper Require Import wrapper_strategy_proof.

(*----- Function qcp_vadd_read -----*)

Definition qcp_vadd_read_return_wit_1 := 
(
forall (i_pre: Z) (n_pre: Z) (out_pre: Z) (p_pre: Z) (L: (@list fp32))  __default_fp32 (PreH1 : (0 < n_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < n_pre)) ,
  (((p_pre + (i_pre * sizeof(FLOAT)))) # Float  |-> (Znth i_pre L __default_fp32))
  **  (FloatArray.missing_i p_pre i_pre 0 n_pre L )
  **  ((out_pre) # Float  |-> (Znth i_pre L __default_fp32))
|--
  (FloatArray.seg p_pre 0 n_pre L )
  **  ((out_pre) # Float  |-> (Znth i_pre L __default_fp32))
) \/
(
forall (i_pre: Z) (n_pre: Z) (p_pre: Z) (L: (@list fp32))  __default_fp32 (PreH1 : (0 < n_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < n_pre)) ,
  (((p_pre + (i_pre * sizeof(FLOAT)))) # Float  |-> (Znth i_pre L __default_fp32))
  **  (FloatArray.missing_i p_pre i_pre 0 n_pre L )
|--
  (FloatArray.seg p_pre 0 n_pre L )
).

Definition qcp_vadd_read_return_wit_1_split_goal_spatial := 
forall (i_pre: Z) (n_pre: Z) (p_pre: Z) (L: (@list fp32))  __default_fp32 (PreH1 : (0 < n_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < n_pre)) ,
  (((p_pre + (i_pre * sizeof(FLOAT)))) # Float  |-> (Znth i_pre L __default_fp32))
  **  (FloatArray.missing_i p_pre i_pre 0 n_pre L )
|--
  (FloatArray.seg p_pre 0 n_pre L )
.

Definition qcp_vadd_read_partial_solve_wit_1 := 
forall (i_pre: Z) (n_pre: Z) (out_pre: Z) (p_pre: Z) (L: (@list fp32))  __default_fp32 (PreH1 : (0 < n_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < n_pre)) ,
  (FloatArray.full p_pre n_pre L )
  **  ((out_pre) # Float  |->_)
|--
  “ (0 < n_pre) ” 
  &&  “ (0 <= i_pre) ” 
  &&  “ (i_pre < n_pre) ”
  &&  (((p_pre + (i_pre * sizeof(FLOAT)))) # Float  |-> (Znth i_pre L __default_fp32))
  **  (FloatArray.missing_i p_pre i_pre 0 n_pre L )
  **  ((out_pre) # Float  |->_)
.

(*----- Function preserve_float -----*)

Definition preserve_float_return_wit_1 := 
(
forall (x_pre: fp32) ,
  TT && emp 
|--
  “ (bit_same x_pre x_pre ) ”
  &&  emp
) \/
(
forall (x_pre: fp32) ,
  TT && emp 
|--
  “ (bit_same x_pre x_pre ) ”
  &&  emp
).

Definition preserve_float_return_wit_1_split_goal_1 := 
forall (x_pre: fp32) ,
  (bit_same x_pre x_pre )
.

(*----- Function check_observation -----*)

Definition check_observation_safety_wit_1 := 
forall (y_pre: fp32) (x_pre: fp32) (retval: fp32) (retval_2: fp32) (PreH1 : (fp32_eq x_pre y_pre )) (PreH2 : (bit_same retval_2 y_pre )) (PreH3 : (bit_same retval x_pre )) (PreH4 : (same_value x_pre y_pre )) ,
  ((( &( "yc" ) )) # Float  |-> retval_2)
  **  ((( &( "xc" ) )) # Float  |-> retval)
  **  ((( &( "x" ) )) # Float  |-> x_pre)
  **  ((( &( "y" ) )) # Float  |-> y_pre)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition check_observation_safety_wit_2 := 
forall (y_pre: fp32) (x_pre: fp32) (retval: fp32) (retval_2: fp32) (PreH1 : (fp32_ne y_pre retval_2 )) (PreH2 : (fp32_ne x_pre retval )) (PreH3 : (fp32_ne x_pre y_pre )) (PreH4 : (bit_same retval_2 y_pre )) (PreH5 : (bit_same retval x_pre )) (PreH6 : (same_value x_pre y_pre )) ,
  ((( &( "yc" ) )) # Float  |-> retval_2)
  **  ((( &( "xc" ) )) # Float  |-> retval)
  **  ((( &( "x" ) )) # Float  |-> x_pre)
  **  ((( &( "y" ) )) # Float  |-> y_pre)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition check_observation_safety_wit_3 := 
forall (y_pre: fp32) (x_pre: fp32) (retval: fp32) (retval_2: fp32) (PreH1 : (fp32_eq x_pre retval )) (PreH2 : (fp32_ne x_pre y_pre )) (PreH3 : (bit_same retval_2 y_pre )) (PreH4 : (bit_same retval x_pre )) (PreH5 : (same_value x_pre y_pre )) ,
  ((( &( "yc" ) )) # Float  |-> retval_2)
  **  ((( &( "xc" ) )) # Float  |-> retval)
  **  ((( &( "x" ) )) # Float  |-> x_pre)
  **  ((( &( "y" ) )) # Float  |-> y_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition check_observation_safety_wit_4 := 
forall (y_pre: fp32) (x_pre: fp32) (retval: fp32) (retval_2: fp32) (PreH1 : (fp32_eq y_pre retval_2 )) (PreH2 : (fp32_ne x_pre retval )) (PreH3 : (fp32_ne x_pre y_pre )) (PreH4 : (bit_same retval_2 y_pre )) (PreH5 : (bit_same retval x_pre )) (PreH6 : (same_value x_pre y_pre )) ,
  ((( &( "yc" ) )) # Float  |-> retval_2)
  **  ((( &( "xc" ) )) # Float  |-> retval)
  **  ((( &( "x" ) )) # Float  |-> x_pre)
  **  ((( &( "y" ) )) # Float  |-> y_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition check_observation_return_wit_1 := 
(
forall (y_pre: fp32) (x_pre: fp32) (retval: fp32) (retval_2: fp32) (PreH1 : (fp32_eq x_pre retval )) (PreH2 : (fp32_ne x_pre y_pre )) (PreH3 : (bit_same retval_2 y_pre )) (PreH4 : (bit_same retval x_pre )) (PreH5 : (same_value x_pre y_pre )) ,
  TT && emp 
|--
  “ (returned_one 0 ) ”
  &&  emp
) \/
(
forall (y_pre: fp32) (x_pre: fp32) (retval: fp32) (retval_2: fp32) (PreH1 : (fp32_eq x_pre retval )) (PreH2 : (fp32_ne x_pre y_pre )) (PreH3 : (bit_same retval_2 y_pre )) (PreH4 : (bit_same retval x_pre )) (PreH5 : (same_value x_pre y_pre )) ,
  TT && emp 
|--
  “ (returned_one 0 ) ”
  &&  emp
).

Definition check_observation_return_wit_1_split_goal_1 := 
forall (y_pre: fp32) (x_pre: fp32) (retval: fp32) (retval_2: fp32) (PreH1 : (fp32_eq x_pre retval )) (PreH2 : (fp32_ne x_pre y_pre )) (PreH3 : (bit_same retval_2 y_pre )) (PreH4 : (bit_same retval x_pre )) (PreH5 : (same_value x_pre y_pre )) ,
  (returned_one 0 )
.

Definition check_observation_return_wit_2 := 
(
forall (y_pre: fp32) (x_pre: fp32) (retval: fp32) (retval_2: fp32) (PreH1 : (fp32_eq y_pre retval_2 )) (PreH2 : (fp32_ne x_pre retval )) (PreH3 : (fp32_ne x_pre y_pre )) (PreH4 : (bit_same retval_2 y_pre )) (PreH5 : (bit_same retval x_pre )) (PreH6 : (same_value x_pre y_pre )) ,
  TT && emp 
|--
  “ (returned_one 0 ) ”
  &&  emp
) \/
(
forall (y_pre: fp32) (x_pre: fp32) (retval: fp32) (retval_2: fp32) (PreH1 : (fp32_eq y_pre retval_2 )) (PreH2 : (fp32_ne x_pre retval )) (PreH3 : (fp32_ne x_pre y_pre )) (PreH4 : (bit_same retval_2 y_pre )) (PreH5 : (bit_same retval x_pre )) (PreH6 : (same_value x_pre y_pre )) ,
  TT && emp 
|--
  “ (returned_one 0 ) ”
  &&  emp
).

Definition check_observation_return_wit_2_split_goal_1 := 
forall (y_pre: fp32) (x_pre: fp32) (retval: fp32) (retval_2: fp32) (PreH1 : (fp32_eq y_pre retval_2 )) (PreH2 : (fp32_ne x_pre retval )) (PreH3 : (fp32_ne x_pre y_pre )) (PreH4 : (bit_same retval_2 y_pre )) (PreH5 : (bit_same retval x_pre )) (PreH6 : (same_value x_pre y_pre )) ,
  (returned_one 0 )
.

Definition check_observation_return_wit_3 := 
(
forall (y_pre: fp32) (x_pre: fp32) (retval: fp32) (retval_2: fp32) (PreH1 : (fp32_ne y_pre retval_2 )) (PreH2 : (fp32_ne x_pre retval )) (PreH3 : (fp32_ne x_pre y_pre )) (PreH4 : (bit_same retval_2 y_pre )) (PreH5 : (bit_same retval x_pre )) (PreH6 : (same_value x_pre y_pre )) ,
  TT && emp 
|--
  “ (returned_one 1 ) ”
  &&  emp
) \/
(
forall (y_pre: fp32) (x_pre: fp32) (retval: fp32) (retval_2: fp32) (PreH1 : (fp32_ne y_pre retval_2 )) (PreH2 : (fp32_ne x_pre retval )) (PreH3 : (fp32_ne x_pre y_pre )) (PreH4 : (bit_same retval_2 y_pre )) (PreH5 : (bit_same retval x_pre )) (PreH6 : (same_value x_pre y_pre )) ,
  TT && emp 
|--
  “ (returned_one 1 ) ”
  &&  emp
).

Definition check_observation_return_wit_3_split_goal_1 := 
forall (y_pre: fp32) (x_pre: fp32) (retval: fp32) (retval_2: fp32) (PreH1 : (fp32_ne y_pre retval_2 )) (PreH2 : (fp32_ne x_pre retval )) (PreH3 : (fp32_ne x_pre y_pre )) (PreH4 : (bit_same retval_2 y_pre )) (PreH5 : (bit_same retval x_pre )) (PreH6 : (same_value x_pre y_pre )) ,
  (returned_one 1 )
.

Definition check_observation_return_wit_4 := 
(
forall (y_pre: fp32) (x_pre: fp32) (retval: fp32) (retval_2: fp32) (PreH1 : (fp32_eq x_pre y_pre )) (PreH2 : (bit_same retval_2 y_pre )) (PreH3 : (bit_same retval x_pre )) (PreH4 : (same_value x_pre y_pre )) ,
  TT && emp 
|--
  “ (returned_one 1 ) ”
  &&  emp
) \/
(
forall (y_pre: fp32) (x_pre: fp32) (retval: fp32) (retval_2: fp32) (PreH1 : (fp32_eq x_pre y_pre )) (PreH2 : (bit_same retval_2 y_pre )) (PreH3 : (bit_same retval x_pre )) (PreH4 : (same_value x_pre y_pre )) ,
  TT && emp 
|--
  “ (returned_one 1 ) ”
  &&  emp
).

Definition check_observation_return_wit_4_split_goal_1 := 
forall (y_pre: fp32) (x_pre: fp32) (retval: fp32) (retval_2: fp32) (PreH1 : (fp32_eq x_pre y_pre )) (PreH2 : (bit_same retval_2 y_pre )) (PreH3 : (bit_same retval x_pre )) (PreH4 : (same_value x_pre y_pre )) ,
  (returned_one 1 )
.

Definition check_observation_partial_solve_wit_1 := 
forall (y_pre: fp32) (x_pre: fp32) (PreH1 : (same_value x_pre y_pre )) ,
  TT && emp 
|--
  “ (same_value x_pre y_pre ) ”
  &&  emp
.

Definition check_observation_partial_solve_wit_2 := 
forall (y_pre: fp32) (x_pre: fp32) (retval: fp32) (PreH1 : (bit_same retval x_pre )) (PreH2 : (same_value x_pre y_pre )) ,
  TT && emp 
|--
  “ (bit_same retval x_pre ) ” 
  &&  “ (same_value x_pre y_pre ) ”
  &&  emp
.

(*----- Function same_lane -----*)

Definition same_lane_return_wit_1 := 
(
forall (y_pre: fp32) (x_pre: fp32) (retval: Z) (PreH1 : (returned_one retval )) (PreH2 : (same_value x_pre y_pre )) ,
  TT && emp 
|--
  “ (retval = 1) ”
  &&  emp
) \/
(
forall (y_pre: fp32) (x_pre: fp32) (retval: Z) (PreH1 : (returned_one retval )) (PreH2 : (same_value x_pre y_pre )) ,
  TT && emp 
|--
  “ (retval = 1) ”
  &&  emp
).

Definition same_lane_return_wit_1_split_goal_1 := 
forall (y_pre: fp32) (x_pre: fp32) (retval: Z) (PreH1 : (returned_one retval )) (PreH2 : (same_value x_pre y_pre )) ,
  (retval = 1)
.

Definition same_lane_partial_solve_wit_1_pure := 
forall (y_pre: fp32) (x_pre: fp32) (PreH1 : (same_value x_pre y_pre )) ,
  ((( &( "x" ) )) # Float  |-> x_pre)
  **  ((( &( "y" ) )) # Float  |-> y_pre)
|--
  “ (same_value x_pre y_pre ) ”
.

Definition same_lane_partial_solve_wit_1_aux := 
forall (y_pre: fp32) (x_pre: fp32) (PreH1 : (same_value x_pre y_pre )) ,
  TT && emp 
|--
  “ (same_value x_pre y_pre ) ” 
  &&  “ (same_value x_pre y_pre ) ”
  &&  emp
.

Definition same_lane_partial_solve_wit_1 := same_lane_partial_solve_wit_1_pure -> same_lane_partial_solve_wit_1_aux.

(*----- Function compare_outputs -----*)

Definition compare_outputs_safety_wit_1 := 
forall (right_pre: Z) (left_pre: Z) (n_pre: Z) (R: (@list fp32)) (L: (@list fp32)) (PreH1 : (0 < n_pre)) (PreH2 : (n_pre <= 4611686018427387903)) (PreH3 : (outputs_related L R )) ,
  ((( &( "i" ) )) # UInt64  |->_)
  **  ((( &( "n" ) )) # UInt64  |-> n_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  (FloatArray.full left_pre n_pre L )
  **  (FloatArray.full right_pre n_pre R )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition compare_outputs_safety_wit_2 := 
forall (right_pre: Z) (left_pre: Z) (n_pre: Z) (R: (@list fp32)) (L: (@list fp32)) (i: Z) (retval: Z)  __default_fp32 (PreH1 : (retval = 0)) (PreH2 : (retval = 1)) (PreH3 : (i < n_pre)) (PreH4 : (0 < n_pre)) (PreH5 : (n_pre <= 4611686018427387903)) (PreH6 : (0 <= i)) (PreH7 : (i <= n_pre)) (PreH8 : ((Zlength (L)) = n_pre)) (PreH9 : (outputs_related L R )) (PreH10 : (0 < n_pre)) (PreH11 : (n_pre <= 4611686018427387903)) (PreH12 : (outputs_related L R )) ,
  (FloatArray.full right_pre n_pre R )
  **  ((( &( "y" ) )) # Float  |-> (Znth i R __default_fp32))
  **  (FloatArray.full left_pre n_pre L )
  **  ((( &( "x" ) )) # Float  |-> (Znth i L __default_fp32))
  **  ((( &( "n" ) )) # UInt64  |-> n_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i)
|--
  “ False ”
.

Definition compare_outputs_safety_wit_3 := 
forall (right_pre: Z) (left_pre: Z) (n_pre: Z) (R: (@list fp32)) (L: (@list fp32)) (i: Z) (PreH1 : (i >= n_pre)) (PreH2 : (0 < n_pre)) (PreH3 : (n_pre <= 4611686018427387903)) (PreH4 : (0 <= i)) (PreH5 : (i <= n_pre)) (PreH6 : ((Zlength (L)) = n_pre)) (PreH7 : (outputs_related L R )) (PreH8 : (0 < n_pre)) (PreH9 : (n_pre <= 4611686018427387903)) (PreH10 : (outputs_related L R )) ,
  ((( &( "n" ) )) # UInt64  |-> n_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i)
  **  (FloatArray.full left_pre n_pre L )
  **  (FloatArray.full right_pre n_pre R )
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition compare_outputs_entail_wit_1 := 
(
forall (right_pre: Z) (left_pre: Z) (n_pre: Z) (R: (@list fp32)) (L: (@list fp32)) (PreH1 : (0 < n_pre)) (PreH2 : (n_pre <= 4611686018427387903)) (PreH3 : (outputs_related L R )) ,
  (FloatArray.full left_pre n_pre L )
  **  (FloatArray.full right_pre n_pre R )
|--
  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 4611686018427387903) ” 
  &&  “ (0 <= 0) ” 
  &&  “ (0 <= n_pre) ” 
  &&  “ ((Zlength (L)) = n_pre) ” 
  &&  “ (outputs_related L R ) ” 
  &&  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 4611686018427387903) ” 
  &&  “ (outputs_related L R ) ”
  &&  (FloatArray.full left_pre n_pre L )
  **  (FloatArray.full right_pre n_pre R )
) \/
(
forall (n_pre: Z) (R: (@list fp32)) (L: (@list fp32)) (PreH1 : (0 < n_pre)) (PreH2 : (n_pre <= 4611686018427387903)) (PreH3 : (outputs_related L R )) ,
  TT && emp 
|--
  “ ((Zlength (L)) = n_pre) ”
  &&  emp
).

Definition compare_outputs_entail_wit_1_split_goal_1 := 
forall (n_pre: Z) (R: (@list fp32)) (L: (@list fp32)) (PreH1 : (0 < n_pre)) (PreH2 : (n_pre <= 4611686018427387903)) (PreH3 : (outputs_related L R )) ,
  ((Zlength (L)) = n_pre)
.

Definition compare_outputs_entail_wit_2 := 
forall (right_pre: Z) (left_pre: Z) (n_pre: Z) (R: (@list fp32)) (L: (@list fp32)) (i: Z) (retval: Z) (PreH1 : (retval <> 0)) (PreH2 : (retval = 1)) (PreH3 : (i < n_pre)) (PreH4 : (0 < n_pre)) (PreH5 : (n_pre <= 4611686018427387903)) (PreH6 : (0 <= i)) (PreH7 : (i <= n_pre)) (PreH8 : ((Zlength (L)) = n_pre)) (PreH9 : (outputs_related L R )) (PreH10 : (0 < n_pre)) (PreH11 : (n_pre <= 4611686018427387903)) (PreH12 : (outputs_related L R )) ,
  (FloatArray.full right_pre n_pre R )
  **  (FloatArray.full left_pre n_pre L )
|--
  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 4611686018427387903) ” 
  &&  “ (0 <= (i + 1 )) ” 
  &&  “ ((i + 1 ) <= n_pre) ” 
  &&  “ ((Zlength (L)) = n_pre) ” 
  &&  “ (outputs_related L R ) ” 
  &&  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 4611686018427387903) ” 
  &&  “ (outputs_related L R ) ”
  &&  (FloatArray.full left_pre n_pre L )
  **  (FloatArray.full right_pre n_pre R )
.

Definition compare_outputs_return_wit_1 := 
forall (right_pre: Z) (left_pre: Z) (n_pre: Z) (R: (@list fp32)) (L: (@list fp32)) (i: Z) (PreH1 : (i >= n_pre)) (PreH2 : (0 < n_pre)) (PreH3 : (n_pre <= 4611686018427387903)) (PreH4 : (0 <= i)) (PreH5 : (i <= n_pre)) (PreH6 : ((Zlength (L)) = n_pre)) (PreH7 : (outputs_related L R )) (PreH8 : (0 < n_pre)) (PreH9 : (n_pre <= 4611686018427387903)) (PreH10 : (outputs_related L R )) ,
  (FloatArray.full left_pre n_pre L )
  **  (FloatArray.full right_pre n_pre R )
|--
  “ (1 = 1) ”
  &&  (FloatArray.full left_pre n_pre L )
  **  (FloatArray.full right_pre n_pre R )
.

Definition compare_outputs_partial_solve_wit_1_pure := 
forall (right_pre: Z) (left_pre: Z) (n_pre: Z) (R: (@list fp32)) (L: (@list fp32)) (i: Z) (PreH1 : (i < n_pre)) (PreH2 : (0 < n_pre)) (PreH3 : (n_pre <= 4611686018427387903)) (PreH4 : (0 <= i)) (PreH5 : (i <= n_pre)) (PreH6 : ((Zlength (L)) = n_pre)) (PreH7 : (outputs_related L R )) (PreH8 : (0 < n_pre)) (PreH9 : (n_pre <= 4611686018427387903)) (PreH10 : (outputs_related L R )) ,
  ((( &( "y" ) )) # Float  |->_)
  **  ((( &( "x" ) )) # Float  |->_)
  **  ((( &( "n" ) )) # UInt64  |-> n_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i)
  **  (FloatArray.full left_pre n_pre L )
  **  (FloatArray.full right_pre n_pre R )
|--
  “ (0 < n_pre) ” 
  &&  “ (0 <= i) ” 
  &&  “ (i < n_pre) ”
.

Definition compare_outputs_partial_solve_wit_1_aux := 
forall (right_pre: Z) (left_pre: Z) (n_pre: Z) (R: (@list fp32)) (L: (@list fp32)) (i: Z) (PreH1 : (i < n_pre)) (PreH2 : (0 < n_pre)) (PreH3 : (n_pre <= 4611686018427387903)) (PreH4 : (0 <= i)) (PreH5 : (i <= n_pre)) (PreH6 : ((Zlength (L)) = n_pre)) (PreH7 : (outputs_related L R )) (PreH8 : (0 < n_pre)) (PreH9 : (n_pre <= 4611686018427387903)) (PreH10 : (outputs_related L R )) ,
  (FloatArray.full left_pre n_pre L )
  **  (FloatArray.full right_pre n_pre R )
|--
  “ (0 < n_pre) ” 
  &&  “ (0 <= i) ” 
  &&  “ (i < n_pre) ” 
  &&  “ (i < n_pre) ” 
  &&  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 4611686018427387903) ” 
  &&  “ (0 <= i) ” 
  &&  “ (i <= n_pre) ” 
  &&  “ ((Zlength (L)) = n_pre) ” 
  &&  “ (outputs_related L R ) ” 
  &&  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 4611686018427387903) ” 
  &&  “ (outputs_related L R ) ”
  &&  (FloatArray.full left_pre n_pre L )
  **  (FloatArray.full right_pre n_pre R )
.

Definition compare_outputs_partial_solve_wit_1 := compare_outputs_partial_solve_wit_1_pure -> compare_outputs_partial_solve_wit_1_aux.

Definition compare_outputs_partial_solve_wit_2_pure := 
forall (right_pre: Z) (left_pre: Z) (n_pre: Z) (R: (@list fp32)) (L: (@list fp32)) (i: Z)  __default_fp32 (PreH1 : (i < n_pre)) (PreH2 : (0 < n_pre)) (PreH3 : (n_pre <= 4611686018427387903)) (PreH4 : (0 <= i)) (PreH5 : (i <= n_pre)) (PreH6 : ((Zlength (L)) = n_pre)) (PreH7 : (outputs_related L R )) (PreH8 : (0 < n_pre)) (PreH9 : (n_pre <= 4611686018427387903)) (PreH10 : (outputs_related L R )) ,
  (FloatArray.seg left_pre 0 n_pre L )
  **  ((( &( "x" ) )) # Float  |-> (Znth i L __default_fp32))
  **  ((( &( "y" ) )) # Float  |->_)
  **  ((( &( "n" ) )) # UInt64  |-> n_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i)
  **  (FloatArray.full right_pre n_pre R )
|--
  “ (0 < n_pre) ” 
  &&  “ (0 <= i) ” 
  &&  “ (i < n_pre) ”
.

Definition compare_outputs_partial_solve_wit_2_aux := 
forall (right_pre: Z) (left_pre: Z) (n_pre: Z) (R: (@list fp32)) (L: (@list fp32)) (i: Z) (PreH1 : (i < n_pre)) (PreH2 : (0 < n_pre)) (PreH3 : (n_pre <= 4611686018427387903)) (PreH4 : (0 <= i)) (PreH5 : (i <= n_pre)) (PreH6 : ((Zlength (L)) = n_pre)) (PreH7 : (outputs_related L R )) (PreH8 : (0 < n_pre)) (PreH9 : (n_pre <= 4611686018427387903)) (PreH10 : (outputs_related L R )) ,
  (FloatArray.seg left_pre 0 n_pre L )
  **  (FloatArray.full right_pre n_pre R )
|--
  “ (0 < n_pre) ” 
  &&  “ (0 <= i) ” 
  &&  “ (i < n_pre) ” 
  &&  “ (i < n_pre) ” 
  &&  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 4611686018427387903) ” 
  &&  “ (0 <= i) ” 
  &&  “ (i <= n_pre) ” 
  &&  “ ((Zlength (L)) = n_pre) ” 
  &&  “ (outputs_related L R ) ” 
  &&  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 4611686018427387903) ” 
  &&  “ (outputs_related L R ) ”
  &&  (FloatArray.full right_pre n_pre R )
  **  (FloatArray.full left_pre n_pre L )
.

Definition compare_outputs_partial_solve_wit_2 := compare_outputs_partial_solve_wit_2_pure -> compare_outputs_partial_solve_wit_2_aux.

Definition compare_outputs_partial_solve_wit_3_pure := 
(
forall (right_pre: Z) (left_pre: Z) (n_pre: Z) (R: (@list fp32)) (L: (@list fp32)) (i: Z)  __default_fp32 (PreH1 : (i < n_pre)) (PreH2 : (0 < n_pre)) (PreH3 : (n_pre <= 4611686018427387903)) (PreH4 : (0 <= i)) (PreH5 : (i <= n_pre)) (PreH6 : ((Zlength (L)) = n_pre)) (PreH7 : (outputs_related L R )) (PreH8 : (0 < n_pre)) (PreH9 : (n_pre <= 4611686018427387903)) (PreH10 : (outputs_related L R )) ,
  (FloatArray.seg right_pre 0 n_pre R )
  **  ((( &( "y" ) )) # Float  |-> (Znth i R __default_fp32))
  **  (FloatArray.full left_pre n_pre L )
  **  ((( &( "x" ) )) # Float  |-> (Znth i L __default_fp32))
  **  ((( &( "n" ) )) # UInt64  |-> n_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i)
|--
  “ (same_value (Znth i L __default_fp32) (Znth i R __default_fp32) ) ”
) \/
(
forall (right_pre: Z) (left_pre: Z) (n_pre: Z) (R: (@list fp32)) (L: (@list fp32)) (i: Z)  __default_fp32 (PreH1 : (i <= UINT64_MAX)) (PreH2 : (n_pre <= UINT64_MAX)) (PreH3 : (i >= 0)) (PreH4 : (n_pre >= 0)) (PreH5 : (i < n_pre)) (PreH6 : (0 < n_pre)) (PreH7 : (n_pre <= 4611686018427387903)) (PreH8 : (0 <= i)) (PreH9 : (i <= n_pre)) (PreH10 : ((Zlength (L)) = n_pre)) (PreH11 : (outputs_related L R )) (PreH12 : (0 < n_pre)) (PreH13 : (n_pre <= 4611686018427387903)) (PreH14 : (outputs_related L R )) ,
  (FloatArray.full right_pre n_pre R )
  **  ((( &( "y" ) )) # Float  |-> (Znth i R __default_fp32))
  **  (FloatArray.full left_pre n_pre L )
  **  ((( &( "x" ) )) # Float  |-> (Znth i L __default_fp32))
  **  ((( &( "n" ) )) # UInt64  |-> n_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i)
|--
  “ (same_value (Znth i L __default_fp32) (Znth i R __default_fp32) ) ”
).

Definition compare_outputs_partial_solve_wit_3_pure_split_goal_1 := 
forall (right_pre: Z) (left_pre: Z) (n_pre: Z) (R: (@list fp32)) (L: (@list fp32)) (i: Z)  __default_fp32 (PreH1 : (i <= UINT64_MAX)) (PreH2 : (n_pre <= UINT64_MAX)) (PreH3 : (i >= 0)) (PreH4 : (n_pre >= 0)) (PreH5 : (i < n_pre)) (PreH6 : (0 < n_pre)) (PreH7 : (n_pre <= 4611686018427387903)) (PreH8 : (0 <= i)) (PreH9 : (i <= n_pre)) (PreH10 : ((Zlength (L)) = n_pre)) (PreH11 : (outputs_related L R )) (PreH12 : (0 < n_pre)) (PreH13 : (n_pre <= 4611686018427387903)) (PreH14 : (outputs_related L R )) ,
  (FloatArray.full right_pre n_pre R )
  **  ((( &( "y" ) )) # Float  |-> (Znth i R __default_fp32))
  **  (FloatArray.full left_pre n_pre L )
  **  ((( &( "x" ) )) # Float  |-> (Znth i L __default_fp32))
  **  ((( &( "n" ) )) # UInt64  |-> n_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i)
|--
  “ (same_value (Znth i L __default_fp32) (Znth i R __default_fp32) ) ”
.

Definition compare_outputs_partial_solve_wit_3_aux := 
forall (right_pre: Z) (left_pre: Z) (n_pre: Z) (R: (@list fp32)) (L: (@list fp32)) (i: Z)  __default_fp32 (PreH1 : (i < n_pre)) (PreH2 : (0 < n_pre)) (PreH3 : (n_pre <= 4611686018427387903)) (PreH4 : (0 <= i)) (PreH5 : (i <= n_pre)) (PreH6 : ((Zlength (L)) = n_pre)) (PreH7 : (outputs_related L R )) (PreH8 : (0 < n_pre)) (PreH9 : (n_pre <= 4611686018427387903)) (PreH10 : (outputs_related L R )) ,
  (FloatArray.seg right_pre 0 n_pre R )
  **  (FloatArray.full left_pre n_pre L )
|--
  “ (same_value (Znth i L __default_fp32) (Znth i R __default_fp32) ) ” 
  &&  “ (i < n_pre) ” 
  &&  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 4611686018427387903) ” 
  &&  “ (0 <= i) ” 
  &&  “ (i <= n_pre) ” 
  &&  “ ((Zlength (L)) = n_pre) ” 
  &&  “ (outputs_related L R ) ” 
  &&  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 4611686018427387903) ” 
  &&  “ (outputs_related L R ) ”
  &&  (FloatArray.full right_pre n_pre R )
  **  (FloatArray.full left_pre n_pre L )
.

Definition compare_outputs_partial_solve_wit_3 := compare_outputs_partial_solve_wit_3_pure -> compare_outputs_partial_solve_wit_3_aux.

(*----- Function equivalent -----*)

Definition equivalent_return_wit_1 := 
(
forall (params_pre: Z) (right_pre: Z) (left_pre: Z) (input_pre: Z) (n_pre: Z) (Scale: fp32) (RawZ: Z) (A: (@list Z)) (retval: Z) (PreH1 : (retval = 1)) (PreH2 : (0 < n_pre)) (PreH3 : (n_pre <= 4611686018427387903)) (PreH4 : (input_pre <> 0)) (PreH5 : (left_pre <> 0)) (PreH6 : (right_pre <> 0)) (PreH7 : (params_pre <> 0)) ,
  (FloatArray.full left_pre n_pre (cvt_values (n_pre) (A) (RawZ) (Scale)) )
  **  (FloatArray.full right_pre n_pre (cvt_values (n_pre) (A) (RawZ) (Scale)) )
  **  (CharArray.full input_pre (n_pre + 7 ) A )
  **  ((&((params_pre)  # "xnn_qs8_f32_cvt_params" ->ₛ "scalar" .ₛ "zero_point")) # Int  |-> RawZ)
  **  ((&((params_pre)  # "xnn_qs8_f32_cvt_params" ->ₛ "scalar" .ₛ "scale")) # Float  |-> Scale)
|--
  EX (L: (@list fp32))  (R: (@list fp32)) ,
  “ (retval = 1) ” 
  &&  “ (outputs_related L R ) ”
  &&  (CharArray.full input_pre (n_pre + 7 ) A )
  **  (FloatArray.full left_pre n_pre L )
  **  (FloatArray.full right_pre n_pre R )
  **  ((&((params_pre)  # "xnn_qs8_f32_cvt_params" ->ₛ "scalar" .ₛ "zero_point")) # Int  |-> RawZ)
  **  ((&((params_pre)  # "xnn_qs8_f32_cvt_params" ->ₛ "scalar" .ₛ "scale")) # Float  |-> Scale)
) \/
(
forall (params_pre: Z) (right_pre: Z) (left_pre: Z) (input_pre: Z) (n_pre: Z) (Scale: fp32) (RawZ: Z) (A: (@list Z)) (retval: Z) (PreH1 : (retval = 1)) (PreH2 : (0 < n_pre)) (PreH3 : (n_pre <= 4611686018427387903)) (PreH4 : (input_pre <> 0)) (PreH5 : (left_pre <> 0)) (PreH6 : (right_pre <> 0)) (PreH7 : (params_pre <> 0)) ,
  TT && emp 
|--
  “ (outputs_related (cvt_values (n_pre) (A) (RawZ) (Scale)) (cvt_values (n_pre) (A) (RawZ) (Scale)) ) ”
  &&  emp
).

Definition equivalent_return_wit_1_split_goal_1 := 
forall (params_pre: Z) (right_pre: Z) (left_pre: Z) (input_pre: Z) (n_pre: Z) (Scale: fp32) (RawZ: Z) (A: (@list Z)) (retval: Z) (PreH1 : (retval = 1)) (PreH2 : (0 < n_pre)) (PreH3 : (n_pre <= 4611686018427387903)) (PreH4 : (input_pre <> 0)) (PreH5 : (left_pre <> 0)) (PreH6 : (right_pre <> 0)) (PreH7 : (params_pre <> 0)) ,
  (outputs_related (cvt_values (n_pre) (A) (RawZ) (Scale)) (cvt_values (n_pre) (A) (RawZ) (Scale)) )
.

Definition equivalent_partial_solve_wit_1_pure := 
forall (params_pre: Z) (right_pre: Z) (left_pre: Z) (input_pre: Z) (n_pre: Z) (Scale: fp32) (RawZ: Z) (A: (@list Z)) (PreH1 : (0 < n_pre)) (PreH2 : (n_pre <= 4611686018427387903)) (PreH3 : (input_pre <> 0)) (PreH4 : (left_pre <> 0)) (PreH5 : (right_pre <> 0)) (PreH6 : (params_pre <> 0)) ,
  ((( &( "n" ) )) # UInt64  |-> n_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (CharArray.full input_pre (n_pre + 7 ) A )
  **  (FloatArray.undef_full left_pre n_pre )
  **  (FloatArray.undef_full right_pre n_pre )
  **  ((&((params_pre)  # "xnn_qs8_f32_cvt_params" ->ₛ "scalar" .ₛ "zero_point")) # Int  |-> RawZ)
  **  ((&((params_pre)  # "xnn_qs8_f32_cvt_params" ->ₛ "scalar" .ₛ "scale")) # Float  |-> Scale)
|--
  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 4611686018427387903) ” 
  &&  “ (input_pre <> 0) ” 
  &&  “ (left_pre <> 0) ” 
  &&  “ (params_pre <> 0) ”
.

Definition equivalent_partial_solve_wit_1_aux := 
forall (params_pre: Z) (right_pre: Z) (left_pre: Z) (input_pre: Z) (n_pre: Z) (Scale: fp32) (RawZ: Z) (A: (@list Z)) (PreH1 : (0 < n_pre)) (PreH2 : (n_pre <= 4611686018427387903)) (PreH3 : (input_pre <> 0)) (PreH4 : (left_pre <> 0)) (PreH5 : (right_pre <> 0)) (PreH6 : (params_pre <> 0)) ,
  (CharArray.full input_pre (n_pre + 7 ) A )
  **  (FloatArray.undef_full left_pre n_pre )
  **  (FloatArray.undef_full right_pre n_pre )
  **  ((&((params_pre)  # "xnn_qs8_f32_cvt_params" ->ₛ "scalar" .ₛ "zero_point")) # Int  |-> RawZ)
  **  ((&((params_pre)  # "xnn_qs8_f32_cvt_params" ->ₛ "scalar" .ₛ "scale")) # Float  |-> Scale)
|--
  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 4611686018427387903) ” 
  &&  “ (input_pre <> 0) ” 
  &&  “ (left_pre <> 0) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 4611686018427387903) ” 
  &&  “ (input_pre <> 0) ” 
  &&  “ (left_pre <> 0) ” 
  &&  “ (right_pre <> 0) ” 
  &&  “ (params_pre <> 0) ”
  &&  (CharArray.full input_pre (n_pre + 7 ) A )
  **  (FloatArray.undef_full left_pre n_pre )
  **  ((&((params_pre)  # "xnn_qs8_f32_cvt_params" ->ₛ "scalar" .ₛ "zero_point")) # Int  |-> RawZ)
  **  ((&((params_pre)  # "xnn_qs8_f32_cvt_params" ->ₛ "scalar" .ₛ "scale")) # Float  |-> Scale)
  **  (FloatArray.undef_full right_pre n_pre )
.

Definition equivalent_partial_solve_wit_1 := equivalent_partial_solve_wit_1_pure -> equivalent_partial_solve_wit_1_aux.

Definition equivalent_partial_solve_wit_2_pure := 
forall (params_pre: Z) (right_pre: Z) (left_pre: Z) (input_pre: Z) (n_pre: Z) (Scale: fp32) (RawZ: Z) (A: (@list Z)) (PreH1 : (0 < n_pre)) (PreH2 : (n_pre <= 4611686018427387903)) (PreH3 : (input_pre <> 0)) (PreH4 : (left_pre <> 0)) (PreH5 : (right_pre <> 0)) (PreH6 : (params_pre <> 0)) ,
  (CharArray.full input_pre (n_pre + 7 ) A )
  **  (FloatArray.full left_pre n_pre (cvt_values (n_pre) (A) (RawZ) (Scale)) )
  **  ((&((params_pre)  # "xnn_qs8_f32_cvt_params" ->ₛ "scalar" .ₛ "zero_point")) # Int  |-> RawZ)
  **  ((&((params_pre)  # "xnn_qs8_f32_cvt_params" ->ₛ "scalar" .ₛ "scale")) # Float  |-> Scale)
  **  ((( &( "n" ) )) # UInt64  |-> n_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  (FloatArray.undef_full right_pre n_pre )
|--
  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 4611686018427387903) ” 
  &&  “ (input_pre <> 0) ” 
  &&  “ (right_pre <> 0) ” 
  &&  “ (params_pre <> 0) ”
.

Definition equivalent_partial_solve_wit_2_aux := 
forall (params_pre: Z) (right_pre: Z) (left_pre: Z) (input_pre: Z) (n_pre: Z) (Scale: fp32) (RawZ: Z) (A: (@list Z)) (PreH1 : (0 < n_pre)) (PreH2 : (n_pre <= 4611686018427387903)) (PreH3 : (input_pre <> 0)) (PreH4 : (left_pre <> 0)) (PreH5 : (right_pre <> 0)) (PreH6 : (params_pre <> 0)) ,
  (CharArray.full input_pre (n_pre + 7 ) A )
  **  (FloatArray.full left_pre n_pre (cvt_values (n_pre) (A) (RawZ) (Scale)) )
  **  ((&((params_pre)  # "xnn_qs8_f32_cvt_params" ->ₛ "scalar" .ₛ "zero_point")) # Int  |-> RawZ)
  **  ((&((params_pre)  # "xnn_qs8_f32_cvt_params" ->ₛ "scalar" .ₛ "scale")) # Float  |-> Scale)
  **  (FloatArray.undef_full right_pre n_pre )
|--
  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 4611686018427387903) ” 
  &&  “ (input_pre <> 0) ” 
  &&  “ (right_pre <> 0) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 4611686018427387903) ” 
  &&  “ (input_pre <> 0) ” 
  &&  “ (left_pre <> 0) ” 
  &&  “ (right_pre <> 0) ” 
  &&  “ (params_pre <> 0) ”
  &&  (CharArray.full input_pre (n_pre + 7 ) A )
  **  (FloatArray.undef_full right_pre n_pre )
  **  ((&((params_pre)  # "xnn_qs8_f32_cvt_params" ->ₛ "scalar" .ₛ "zero_point")) # Int  |-> RawZ)
  **  ((&((params_pre)  # "xnn_qs8_f32_cvt_params" ->ₛ "scalar" .ₛ "scale")) # Float  |-> Scale)
  **  (FloatArray.full left_pre n_pre (cvt_values (n_pre) (A) (RawZ) (Scale)) )
.

Definition equivalent_partial_solve_wit_2 := equivalent_partial_solve_wit_2_pure -> equivalent_partial_solve_wit_2_aux.

Definition equivalent_partial_solve_wit_3_pure := 
(
forall (params_pre: Z) (right_pre: Z) (left_pre: Z) (input_pre: Z) (n_pre: Z) (Scale: fp32) (RawZ: Z) (A: (@list Z)) (PreH1 : (0 < n_pre)) (PreH2 : (n_pre <= 4611686018427387903)) (PreH3 : (input_pre <> 0)) (PreH4 : (left_pre <> 0)) (PreH5 : (right_pre <> 0)) (PreH6 : (params_pre <> 0)) ,
  (CharArray.full input_pre (n_pre + 7 ) A )
  **  (FloatArray.full right_pre n_pre (cvt_values (n_pre) (A) (RawZ) (Scale)) )
  **  ((&((params_pre)  # "xnn_qs8_f32_cvt_params" ->ₛ "scalar" .ₛ "zero_point")) # Int  |-> RawZ)
  **  ((&((params_pre)  # "xnn_qs8_f32_cvt_params" ->ₛ "scalar" .ₛ "scale")) # Float  |-> Scale)
  **  (FloatArray.full left_pre n_pre (cvt_values (n_pre) (A) (RawZ) (Scale)) )
  **  ((( &( "n" ) )) # UInt64  |-> n_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
|--
  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 4611686018427387903) ” 
  &&  “ (outputs_related (cvt_values (n_pre) (A) (RawZ) (Scale)) (cvt_values (n_pre) (A) (RawZ) (Scale)) ) ”
) \/
(
forall (params_pre: Z) (right_pre: Z) (left_pre: Z) (input_pre: Z) (n_pre: Z) (Scale: fp32) (RawZ: Z) (A: (@list Z)) (PreH1 : (n_pre <= UINT64_MAX)) (PreH2 : (n_pre >= 0)) (PreH3 : (RawZ <= INT_MAX)) (PreH4 : (RawZ >= INT_MIN)) (PreH5 : (0 < n_pre)) (PreH6 : (n_pre <= 4611686018427387903)) (PreH7 : (input_pre <> 0)) (PreH8 : (left_pre <> 0)) (PreH9 : (right_pre <> 0)) (PreH10 : (params_pre <> 0)) ,
  (CharArray.full input_pre (n_pre + 7 ) A )
  **  (FloatArray.full right_pre n_pre (cvt_values (n_pre) (A) (RawZ) (Scale)) )
  **  ((&((params_pre)  # "xnn_qs8_f32_cvt_params" ->ₛ "scalar" .ₛ "zero_point")) # Int  |-> RawZ)
  **  ((&((params_pre)  # "xnn_qs8_f32_cvt_params" ->ₛ "scalar" .ₛ "scale")) # Float  |-> Scale)
  **  (FloatArray.full left_pre n_pre (cvt_values (n_pre) (A) (RawZ) (Scale)) )
  **  ((( &( "n" ) )) # UInt64  |-> n_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
|--
  “ (outputs_related (cvt_values (n_pre) (A) (RawZ) (Scale)) (cvt_values (n_pre) (A) (RawZ) (Scale)) ) ”
).

Definition equivalent_partial_solve_wit_3_pure_split_goal_1 := 
forall (params_pre: Z) (right_pre: Z) (left_pre: Z) (input_pre: Z) (n_pre: Z) (Scale: fp32) (RawZ: Z) (A: (@list Z)) (PreH1 : (n_pre <= UINT64_MAX)) (PreH2 : (n_pre >= 0)) (PreH3 : (RawZ <= INT_MAX)) (PreH4 : (RawZ >= INT_MIN)) (PreH5 : (0 < n_pre)) (PreH6 : (n_pre <= 4611686018427387903)) (PreH7 : (input_pre <> 0)) (PreH8 : (left_pre <> 0)) (PreH9 : (right_pre <> 0)) (PreH10 : (params_pre <> 0)) ,
  (CharArray.full input_pre (n_pre + 7 ) A )
  **  (FloatArray.full right_pre n_pre (cvt_values (n_pre) (A) (RawZ) (Scale)) )
  **  ((&((params_pre)  # "xnn_qs8_f32_cvt_params" ->ₛ "scalar" .ₛ "zero_point")) # Int  |-> RawZ)
  **  ((&((params_pre)  # "xnn_qs8_f32_cvt_params" ->ₛ "scalar" .ₛ "scale")) # Float  |-> Scale)
  **  (FloatArray.full left_pre n_pre (cvt_values (n_pre) (A) (RawZ) (Scale)) )
  **  ((( &( "n" ) )) # UInt64  |-> n_pre)
  **  ((( &( "input" ) )) # Ptr  |-> input_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
|--
  “ (outputs_related (cvt_values (n_pre) (A) (RawZ) (Scale)) (cvt_values (n_pre) (A) (RawZ) (Scale)) ) ”
.

Definition equivalent_partial_solve_wit_3_aux := 
forall (params_pre: Z) (right_pre: Z) (left_pre: Z) (input_pre: Z) (n_pre: Z) (Scale: fp32) (RawZ: Z) (A: (@list Z)) (PreH1 : (0 < n_pre)) (PreH2 : (n_pre <= 4611686018427387903)) (PreH3 : (input_pre <> 0)) (PreH4 : (left_pre <> 0)) (PreH5 : (right_pre <> 0)) (PreH6 : (params_pre <> 0)) ,
  (CharArray.full input_pre (n_pre + 7 ) A )
  **  (FloatArray.full right_pre n_pre (cvt_values (n_pre) (A) (RawZ) (Scale)) )
  **  ((&((params_pre)  # "xnn_qs8_f32_cvt_params" ->ₛ "scalar" .ₛ "zero_point")) # Int  |-> RawZ)
  **  ((&((params_pre)  # "xnn_qs8_f32_cvt_params" ->ₛ "scalar" .ₛ "scale")) # Float  |-> Scale)
  **  (FloatArray.full left_pre n_pre (cvt_values (n_pre) (A) (RawZ) (Scale)) )
|--
  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 4611686018427387903) ” 
  &&  “ (outputs_related (cvt_values (n_pre) (A) (RawZ) (Scale)) (cvt_values (n_pre) (A) (RawZ) (Scale)) ) ” 
  &&  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 4611686018427387903) ” 
  &&  “ (input_pre <> 0) ” 
  &&  “ (left_pre <> 0) ” 
  &&  “ (right_pre <> 0) ” 
  &&  “ (params_pre <> 0) ”
  &&  (FloatArray.full left_pre n_pre (cvt_values (n_pre) (A) (RawZ) (Scale)) )
  **  (FloatArray.full right_pre n_pre (cvt_values (n_pre) (A) (RawZ) (Scale)) )
  **  (CharArray.full input_pre (n_pre + 7 ) A )
  **  ((&((params_pre)  # "xnn_qs8_f32_cvt_params" ->ₛ "scalar" .ₛ "zero_point")) # Int  |-> RawZ)
  **  ((&((params_pre)  # "xnn_qs8_f32_cvt_params" ->ₛ "scalar" .ₛ "scale")) # Float  |-> Scale)
.

Definition equivalent_partial_solve_wit_3 := equivalent_partial_solve_wit_3_pure -> equivalent_partial_solve_wit_3_aux.

Module Type VC_Correct.

Include char_arrays_Strategy_Correct.
Include float_array_Strategy_Correct.
Include comparator_Strategy_Correct.
Include wrapper_Strategy_Correct.

Axiom proof_of_qcp_vadd_read_return_wit_1 : qcp_vadd_read_return_wit_1.
Axiom proof_of_qcp_vadd_read_partial_solve_wit_1 : qcp_vadd_read_partial_solve_wit_1.
Axiom proof_of_preserve_float_return_wit_1 : preserve_float_return_wit_1.
Axiom proof_of_check_observation_safety_wit_1 : check_observation_safety_wit_1.
Axiom proof_of_check_observation_safety_wit_2 : check_observation_safety_wit_2.
Axiom proof_of_check_observation_safety_wit_3 : check_observation_safety_wit_3.
Axiom proof_of_check_observation_safety_wit_4 : check_observation_safety_wit_4.
Axiom proof_of_check_observation_return_wit_1 : check_observation_return_wit_1.
Axiom proof_of_check_observation_return_wit_2 : check_observation_return_wit_2.
Axiom proof_of_check_observation_return_wit_3 : check_observation_return_wit_3.
Axiom proof_of_check_observation_return_wit_4 : check_observation_return_wit_4.
Axiom proof_of_check_observation_partial_solve_wit_1 : check_observation_partial_solve_wit_1.
Axiom proof_of_check_observation_partial_solve_wit_2 : check_observation_partial_solve_wit_2.
Axiom proof_of_same_lane_return_wit_1 : same_lane_return_wit_1.
Axiom proof_of_same_lane_partial_solve_wit_1_pure : same_lane_partial_solve_wit_1_pure.
Axiom proof_of_same_lane_partial_solve_wit_1 : same_lane_partial_solve_wit_1.
Axiom proof_of_compare_outputs_safety_wit_1 : compare_outputs_safety_wit_1.
Axiom proof_of_compare_outputs_safety_wit_2 : compare_outputs_safety_wit_2.
Axiom proof_of_compare_outputs_safety_wit_3 : compare_outputs_safety_wit_3.
Axiom proof_of_compare_outputs_entail_wit_1 : compare_outputs_entail_wit_1.
Axiom proof_of_compare_outputs_entail_wit_2 : compare_outputs_entail_wit_2.
Axiom proof_of_compare_outputs_return_wit_1 : compare_outputs_return_wit_1.
Axiom proof_of_compare_outputs_partial_solve_wit_1_pure : compare_outputs_partial_solve_wit_1_pure.
Axiom proof_of_compare_outputs_partial_solve_wit_1 : compare_outputs_partial_solve_wit_1.
Axiom proof_of_compare_outputs_partial_solve_wit_2_pure : compare_outputs_partial_solve_wit_2_pure.
Axiom proof_of_compare_outputs_partial_solve_wit_2 : compare_outputs_partial_solve_wit_2.
Axiom proof_of_compare_outputs_partial_solve_wit_3_pure : compare_outputs_partial_solve_wit_3_pure.
Axiom proof_of_compare_outputs_partial_solve_wit_3 : compare_outputs_partial_solve_wit_3.
Axiom proof_of_equivalent_return_wit_1 : equivalent_return_wit_1.
Axiom proof_of_equivalent_partial_solve_wit_1_pure : equivalent_partial_solve_wit_1_pure.
Axiom proof_of_equivalent_partial_solve_wit_1 : equivalent_partial_solve_wit_1.
Axiom proof_of_equivalent_partial_solve_wit_2_pure : equivalent_partial_solve_wit_2_pure.
Axiom proof_of_equivalent_partial_solve_wit_2 : equivalent_partial_solve_wit_2.
Axiom proof_of_equivalent_partial_solve_wit_3_pure : equivalent_partial_solve_wit_3_pure.
Axiom proof_of_equivalent_partial_solve_wit_3 : equivalent_partial_solve_wit_3.

End VC_Correct.
