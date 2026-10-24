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
Require Import VaddComparator.ComparatorLogic.
Require Import FullDomainRvv.FullState FullDomainRvv.MachineDomain FullDomainMemory.OutputFinish FullDomainCaller.FullCallerLogic.
Local Open Scope sac.
From VaddComparator Require Import comparator_strategy_goal.
From VaddComparator Require Import comparator_strategy_proof.

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
forall (right_pre: Z) (left_pre: Z) (n_pre: Z) (R: (@list fp32)) (L: (@list fp32)) (PreH1 : (0 < n_pre)) (PreH2 : (n_pre <= 4611686018427387900)) (PreH3 : (outputs_related L R )) ,
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
forall (right_pre: Z) (left_pre: Z) (n_pre: Z) (R: (@list fp32)) (L: (@list fp32)) (i: Z) (retval: Z)  __default_fp32 (PreH1 : (retval = 0)) (PreH2 : (retval = 1)) (PreH3 : (i < n_pre)) (PreH4 : (0 < n_pre)) (PreH5 : (n_pre <= 4611686018427387900)) (PreH6 : (0 <= i)) (PreH7 : (i <= n_pre)) (PreH8 : ((Zlength (L)) = n_pre)) (PreH9 : (outputs_related L R )) (PreH10 : (0 < n_pre)) (PreH11 : (n_pre <= 4611686018427387900)) (PreH12 : (outputs_related L R )) ,
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
forall (right_pre: Z) (left_pre: Z) (n_pre: Z) (R: (@list fp32)) (L: (@list fp32)) (i: Z) (PreH1 : (i >= n_pre)) (PreH2 : (0 < n_pre)) (PreH3 : (n_pre <= 4611686018427387900)) (PreH4 : (0 <= i)) (PreH5 : (i <= n_pre)) (PreH6 : ((Zlength (L)) = n_pre)) (PreH7 : (outputs_related L R )) (PreH8 : (0 < n_pre)) (PreH9 : (n_pre <= 4611686018427387900)) (PreH10 : (outputs_related L R )) ,
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
forall (right_pre: Z) (left_pre: Z) (n_pre: Z) (R: (@list fp32)) (L: (@list fp32)) (PreH1 : (0 < n_pre)) (PreH2 : (n_pre <= 4611686018427387900)) (PreH3 : (outputs_related L R )) ,
  (FloatArray.full left_pre n_pre L )
  **  (FloatArray.full right_pre n_pre R )
|--
  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 4611686018427387900) ” 
  &&  “ (0 <= 0) ” 
  &&  “ (0 <= n_pre) ” 
  &&  “ ((Zlength (L)) = n_pre) ” 
  &&  “ (outputs_related L R ) ” 
  &&  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 4611686018427387900) ” 
  &&  “ (outputs_related L R ) ”
  &&  (FloatArray.full left_pre n_pre L )
  **  (FloatArray.full right_pre n_pre R )
) \/
(
forall (n_pre: Z) (R: (@list fp32)) (L: (@list fp32)) (PreH1 : (0 < n_pre)) (PreH2 : (n_pre <= 4611686018427387900)) (PreH3 : (outputs_related L R )) ,
  TT && emp 
|--
  “ ((Zlength (L)) = n_pre) ”
  &&  emp
).

Definition compare_outputs_entail_wit_1_split_goal_1 := 
forall (n_pre: Z) (R: (@list fp32)) (L: (@list fp32)) (PreH1 : (0 < n_pre)) (PreH2 : (n_pre <= 4611686018427387900)) (PreH3 : (outputs_related L R )) ,
  ((Zlength (L)) = n_pre)
.

Definition compare_outputs_entail_wit_2 := 
forall (right_pre: Z) (left_pre: Z) (n_pre: Z) (R: (@list fp32)) (L: (@list fp32)) (i: Z) (retval: Z) (PreH1 : (retval <> 0)) (PreH2 : (retval = 1)) (PreH3 : (i < n_pre)) (PreH4 : (0 < n_pre)) (PreH5 : (n_pre <= 4611686018427387900)) (PreH6 : (0 <= i)) (PreH7 : (i <= n_pre)) (PreH8 : ((Zlength (L)) = n_pre)) (PreH9 : (outputs_related L R )) (PreH10 : (0 < n_pre)) (PreH11 : (n_pre <= 4611686018427387900)) (PreH12 : (outputs_related L R )) ,
  (FloatArray.full right_pre n_pre R )
  **  (FloatArray.full left_pre n_pre L )
|--
  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 4611686018427387900) ” 
  &&  “ (0 <= (i + 1 )) ” 
  &&  “ ((i + 1 ) <= n_pre) ” 
  &&  “ ((Zlength (L)) = n_pre) ” 
  &&  “ (outputs_related L R ) ” 
  &&  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 4611686018427387900) ” 
  &&  “ (outputs_related L R ) ”
  &&  (FloatArray.full left_pre n_pre L )
  **  (FloatArray.full right_pre n_pre R )
.

Definition compare_outputs_return_wit_1 := 
forall (right_pre: Z) (left_pre: Z) (n_pre: Z) (R: (@list fp32)) (L: (@list fp32)) (i: Z) (PreH1 : (i >= n_pre)) (PreH2 : (0 < n_pre)) (PreH3 : (n_pre <= 4611686018427387900)) (PreH4 : (0 <= i)) (PreH5 : (i <= n_pre)) (PreH6 : ((Zlength (L)) = n_pre)) (PreH7 : (outputs_related L R )) (PreH8 : (0 < n_pre)) (PreH9 : (n_pre <= 4611686018427387900)) (PreH10 : (outputs_related L R )) ,
  (FloatArray.full left_pre n_pre L )
  **  (FloatArray.full right_pre n_pre R )
|--
  “ (1 = 1) ”
  &&  (FloatArray.full left_pre n_pre L )
  **  (FloatArray.full right_pre n_pre R )
.

Definition compare_outputs_partial_solve_wit_1_pure := 
forall (right_pre: Z) (left_pre: Z) (n_pre: Z) (R: (@list fp32)) (L: (@list fp32)) (i: Z) (PreH1 : (i < n_pre)) (PreH2 : (0 < n_pre)) (PreH3 : (n_pre <= 4611686018427387900)) (PreH4 : (0 <= i)) (PreH5 : (i <= n_pre)) (PreH6 : ((Zlength (L)) = n_pre)) (PreH7 : (outputs_related L R )) (PreH8 : (0 < n_pre)) (PreH9 : (n_pre <= 4611686018427387900)) (PreH10 : (outputs_related L R )) ,
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
forall (right_pre: Z) (left_pre: Z) (n_pre: Z) (R: (@list fp32)) (L: (@list fp32)) (i: Z) (PreH1 : (i < n_pre)) (PreH2 : (0 < n_pre)) (PreH3 : (n_pre <= 4611686018427387900)) (PreH4 : (0 <= i)) (PreH5 : (i <= n_pre)) (PreH6 : ((Zlength (L)) = n_pre)) (PreH7 : (outputs_related L R )) (PreH8 : (0 < n_pre)) (PreH9 : (n_pre <= 4611686018427387900)) (PreH10 : (outputs_related L R )) ,
  (FloatArray.full left_pre n_pre L )
  **  (FloatArray.full right_pre n_pre R )
|--
  “ (0 < n_pre) ” 
  &&  “ (0 <= i) ” 
  &&  “ (i < n_pre) ” 
  &&  “ (i < n_pre) ” 
  &&  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 4611686018427387900) ” 
  &&  “ (0 <= i) ” 
  &&  “ (i <= n_pre) ” 
  &&  “ ((Zlength (L)) = n_pre) ” 
  &&  “ (outputs_related L R ) ” 
  &&  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 4611686018427387900) ” 
  &&  “ (outputs_related L R ) ”
  &&  (FloatArray.full left_pre n_pre L )
  **  (FloatArray.full right_pre n_pre R )
.

Definition compare_outputs_partial_solve_wit_1 := compare_outputs_partial_solve_wit_1_pure -> compare_outputs_partial_solve_wit_1_aux.

Definition compare_outputs_partial_solve_wit_2_pure := 
forall (right_pre: Z) (left_pre: Z) (n_pre: Z) (R: (@list fp32)) (L: (@list fp32)) (i: Z)  __default_fp32 (PreH1 : (i < n_pre)) (PreH2 : (0 < n_pre)) (PreH3 : (n_pre <= 4611686018427387900)) (PreH4 : (0 <= i)) (PreH5 : (i <= n_pre)) (PreH6 : ((Zlength (L)) = n_pre)) (PreH7 : (outputs_related L R )) (PreH8 : (0 < n_pre)) (PreH9 : (n_pre <= 4611686018427387900)) (PreH10 : (outputs_related L R )) ,
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
forall (right_pre: Z) (left_pre: Z) (n_pre: Z) (R: (@list fp32)) (L: (@list fp32)) (i: Z) (PreH1 : (i < n_pre)) (PreH2 : (0 < n_pre)) (PreH3 : (n_pre <= 4611686018427387900)) (PreH4 : (0 <= i)) (PreH5 : (i <= n_pre)) (PreH6 : ((Zlength (L)) = n_pre)) (PreH7 : (outputs_related L R )) (PreH8 : (0 < n_pre)) (PreH9 : (n_pre <= 4611686018427387900)) (PreH10 : (outputs_related L R )) ,
  (FloatArray.seg left_pre 0 n_pre L )
  **  (FloatArray.full right_pre n_pre R )
|--
  “ (0 < n_pre) ” 
  &&  “ (0 <= i) ” 
  &&  “ (i < n_pre) ” 
  &&  “ (i < n_pre) ” 
  &&  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 4611686018427387900) ” 
  &&  “ (0 <= i) ” 
  &&  “ (i <= n_pre) ” 
  &&  “ ((Zlength (L)) = n_pre) ” 
  &&  “ (outputs_related L R ) ” 
  &&  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 4611686018427387900) ” 
  &&  “ (outputs_related L R ) ”
  &&  (FloatArray.full right_pre n_pre R )
  **  (FloatArray.full left_pre n_pre L )
.

Definition compare_outputs_partial_solve_wit_2 := compare_outputs_partial_solve_wit_2_pure -> compare_outputs_partial_solve_wit_2_aux.

Definition compare_outputs_partial_solve_wit_3_pure := 
(
forall (right_pre: Z) (left_pre: Z) (n_pre: Z) (R: (@list fp32)) (L: (@list fp32)) (i: Z)  __default_fp32 (PreH1 : (i < n_pre)) (PreH2 : (0 < n_pre)) (PreH3 : (n_pre <= 4611686018427387900)) (PreH4 : (0 <= i)) (PreH5 : (i <= n_pre)) (PreH6 : ((Zlength (L)) = n_pre)) (PreH7 : (outputs_related L R )) (PreH8 : (0 < n_pre)) (PreH9 : (n_pre <= 4611686018427387900)) (PreH10 : (outputs_related L R )) ,
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
forall (right_pre: Z) (left_pre: Z) (n_pre: Z) (R: (@list fp32)) (L: (@list fp32)) (i: Z)  __default_fp32 (PreH1 : (i <= UINT64_MAX)) (PreH2 : (n_pre <= UINT64_MAX)) (PreH3 : (i >= 0)) (PreH4 : (n_pre >= 0)) (PreH5 : (i < n_pre)) (PreH6 : (0 < n_pre)) (PreH7 : (n_pre <= 4611686018427387900)) (PreH8 : (0 <= i)) (PreH9 : (i <= n_pre)) (PreH10 : ((Zlength (L)) = n_pre)) (PreH11 : (outputs_related L R )) (PreH12 : (0 < n_pre)) (PreH13 : (n_pre <= 4611686018427387900)) (PreH14 : (outputs_related L R )) ,
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
forall (right_pre: Z) (left_pre: Z) (n_pre: Z) (R: (@list fp32)) (L: (@list fp32)) (i: Z)  __default_fp32 (PreH1 : (i <= UINT64_MAX)) (PreH2 : (n_pre <= UINT64_MAX)) (PreH3 : (i >= 0)) (PreH4 : (n_pre >= 0)) (PreH5 : (i < n_pre)) (PreH6 : (0 < n_pre)) (PreH7 : (n_pre <= 4611686018427387900)) (PreH8 : (0 <= i)) (PreH9 : (i <= n_pre)) (PreH10 : ((Zlength (L)) = n_pre)) (PreH11 : (outputs_related L R )) (PreH12 : (0 < n_pre)) (PreH13 : (n_pre <= 4611686018427387900)) (PreH14 : (outputs_related L R )) ,
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
forall (right_pre: Z) (left_pre: Z) (n_pre: Z) (R: (@list fp32)) (L: (@list fp32)) (i: Z)  __default_fp32 (PreH1 : (i < n_pre)) (PreH2 : (0 < n_pre)) (PreH3 : (n_pre <= 4611686018427387900)) (PreH4 : (0 <= i)) (PreH5 : (i <= n_pre)) (PreH6 : ((Zlength (L)) = n_pre)) (PreH7 : (outputs_related L R )) (PreH8 : (0 < n_pre)) (PreH9 : (n_pre <= 4611686018427387900)) (PreH10 : (outputs_related L R )) ,
  (FloatArray.seg right_pre 0 n_pre R )
  **  (FloatArray.full left_pre n_pre L )
|--
  “ (same_value (Znth i L __default_fp32) (Znth i R __default_fp32) ) ” 
  &&  “ (i < n_pre) ” 
  &&  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 4611686018427387900) ” 
  &&  “ (0 <= i) ” 
  &&  “ (i <= n_pre) ” 
  &&  “ ((Zlength (L)) = n_pre) ” 
  &&  “ (outputs_related L R ) ” 
  &&  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 4611686018427387900) ” 
  &&  “ (outputs_related L R ) ”
  &&  (FloatArray.full right_pre n_pre R )
  **  (FloatArray.full left_pre n_pre L )
.

Definition compare_outputs_partial_solve_wit_3 := compare_outputs_partial_solve_wit_3_pure -> compare_outputs_partial_solve_wit_3_aux.

(*----- Function equivalent -----*)

Definition equivalent_safety_wit_1 := 
forall (params_pre: Z) (right_pre: Z) (left_pre: Z) (w_pre: Z) (a_pre: Z) (kc_pre: Z) (nc_pre: Z) (mr_pre: Z) (hi: fp32) (lo: fp32) (W: (@list fp32)) (A: (@list fp32)) (cm_stride: Z) (observed: Z) (PreH1 : (1 <= mr_pre)) (PreH2 : (mr_pre <= 4)) (PreH3 : (0 < nc_pre)) (PreH4 : (4 <= kc_pre)) (PreH5 : (nc_pre <= 1152921504606846975)) (PreH6 : (cm_stride = (4 * nc_pre ))) (PreH7 : (observed = (mr_pre * nc_pre ))) (PreH8 : ((kc_pre % ( 4 ) ) = 0)) (PreH9 : (0 < kc_pre)) (PreH10 : (0 < observed)) (PreH11 : (observed <= 4611686018427387900)) (PreH12 : (a_pre <> 0)) (PreH13 : (w_pre <> 0)) (PreH14 : (left_pre <> 0)) (PreH15 : (right_pre <> 0)) (PreH16 : (params_pre <> 0)) (PreH17 : (machine_capacity a_pre w_pre left_pre params_pre kc_pre nc_pre )) (PreH18 : (machine_capacity a_pre w_pre right_pre params_pre kc_pre nc_pre )) ,
  ((( &( "mr" ) )) # UInt64  |-> mr_pre)
  **  ((( &( "nc" ) )) # UInt64  |-> nc_pre)
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "w" ) )) # Ptr  |-> w_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "cm_stride" ) )) # UInt64  |-> cm_stride)
  **  ((( &( "observed" ) )) # UInt64  |-> observed)
  **  (FloatArray.full a_pre (4 * (kc_pre ÷ 4 ) ) A )
  **  (FloatArray.full w_pre (((panel_count (nc_pre)) * 8 ) * ((kc_pre ÷ 4 ) + 1 ) ) W )
  **  (FloatArray.undef_full left_pre (4 * nc_pre ) )
  **  (FloatArray.undef_full right_pre (4 * nc_pre ) )
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min")) # Float  |-> lo)
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max")) # Float  |-> hi)
|--
  “ (32 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 32) ”
.

Definition equivalent_safety_wit_2 := 
forall (params_pre: Z) (right_pre: Z) (left_pre: Z) (w_pre: Z) (a_pre: Z) (kc_pre: Z) (nc_pre: Z) (mr_pre: Z) (hi: fp32) (lo: fp32) (W: (@list fp32)) (A: (@list fp32)) (cm_stride: Z) (observed: Z) (PreH1 : (1 <= mr_pre)) (PreH2 : (mr_pre <= 4)) (PreH3 : (0 < nc_pre)) (PreH4 : (1 <= mr_pre)) (PreH5 : (mr_pre <= 4)) (PreH6 : (0 < nc_pre)) (PreH7 : (4 <= kc_pre)) (PreH8 : (nc_pre <= 1152921504606846975)) (PreH9 : (cm_stride = (4 * nc_pre ))) (PreH10 : (observed = (mr_pre * nc_pre ))) (PreH11 : ((kc_pre % ( 4 ) ) = 0)) (PreH12 : (0 < kc_pre)) (PreH13 : (0 < observed)) (PreH14 : (observed <= 4611686018427387900)) (PreH15 : (a_pre <> 0)) (PreH16 : (w_pre <> 0)) (PreH17 : (left_pre <> 0)) (PreH18 : (right_pre <> 0)) (PreH19 : (params_pre <> 0)) (PreH20 : (machine_capacity a_pre w_pre left_pre params_pre kc_pre nc_pre )) (PreH21 : (machine_capacity a_pre w_pre right_pre params_pre kc_pre nc_pre )) ,
  ((( &( "mr" ) )) # UInt64  |-> mr_pre)
  **  ((( &( "nc" ) )) # UInt64  |-> nc_pre)
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  (FloatArray.full left_pre (mr_pre * nc_pre ) (completed_values (A) (W) ((kc_pre ÷ 4 )) (mr_pre) (nc_pre) (lo) (hi)) )
  **  (FloatArray.undef_seg left_pre (mr_pre * nc_pre ) (4 * nc_pre ) )
  **  (FloatArray.full a_pre (4 * (kc_pre ÷ 4 ) ) A )
  **  (FloatArray.full w_pre (((panel_count (nc_pre)) * 8 ) * ((kc_pre ÷ 4 ) + 1 ) ) W )
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min")) # Float  |-> lo)
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max")) # Float  |-> hi)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "w" ) )) # Ptr  |-> w_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "cm_stride" ) )) # UInt64  |-> cm_stride)
  **  ((( &( "observed" ) )) # UInt64  |-> observed)
  **  (FloatArray.undef_full right_pre (4 * nc_pre ) )
|--
  “ (32 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 32) ”
.

Definition equivalent_entail_wit_1 := 
(
forall (params_pre: Z) (right_pre: Z) (left_pre: Z) (w_pre: Z) (a_pre: Z) (kc_pre: Z) (nc_pre: Z) (mr_pre: Z) (hi: fp32) (lo: fp32) (W: (@list fp32)) (A: (@list fp32)) (PreH1 : (1 <= mr_pre)) (PreH2 : (mr_pre <= 4)) (PreH3 : (0 < nc_pre)) (PreH4 : (4 <= kc_pre)) (PreH5 : ((kc_pre % ( 4 ) ) = 0)) (PreH6 : (a_pre <> 0)) (PreH7 : (w_pre <> 0)) (PreH8 : (left_pre <> 0)) (PreH9 : (right_pre <> 0)) (PreH10 : (params_pre <> 0)) (PreH11 : (machine_capacity a_pre w_pre left_pre params_pre kc_pre nc_pre )) (PreH12 : (machine_capacity a_pre w_pre right_pre params_pre kc_pre nc_pre )) ,
  (FloatArray.full a_pre (4 * (kc_pre ÷ 4 ) ) A )
  **  (FloatArray.full w_pre (((panel_count (nc_pre)) * 8 ) * ((kc_pre ÷ 4 ) + 1 ) ) W )
  **  (FloatArray.undef_full left_pre (4 * nc_pre ) )
  **  (FloatArray.undef_full right_pre (4 * nc_pre ) )
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min")) # Float  |-> lo)
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max")) # Float  |-> hi)
|--
  “ (1 <= mr_pre) ” 
  &&  “ (mr_pre <= 4) ” 
  &&  “ (0 < nc_pre) ” 
  &&  “ (4 <= kc_pre) ” 
  &&  “ (nc_pre <= 1152921504606846975) ” 
  &&  “ ((unsigned_last_nbits ((nc_pre * sizeof(FLOAT) )) (64)) = (4 * nc_pre )) ” 
  &&  “ ((unsigned_last_nbits ((mr_pre * nc_pre )) (64)) = (mr_pre * nc_pre )) ” 
  &&  “ ((kc_pre % ( 4 ) ) = 0) ” 
  &&  “ (0 < kc_pre) ” 
  &&  “ (0 < (unsigned_last_nbits ((mr_pre * nc_pre )) (64))) ” 
  &&  “ ((unsigned_last_nbits ((mr_pre * nc_pre )) (64)) <= 4611686018427387900) ” 
  &&  “ (a_pre <> 0) ” 
  &&  “ (w_pre <> 0) ” 
  &&  “ (left_pre <> 0) ” 
  &&  “ (right_pre <> 0) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (machine_capacity a_pre w_pre left_pre params_pre kc_pre nc_pre ) ” 
  &&  “ (machine_capacity a_pre w_pre right_pre params_pre kc_pre nc_pre ) ”
  &&  (FloatArray.full a_pre (4 * (kc_pre ÷ 4 ) ) A )
  **  (FloatArray.full w_pre (((panel_count (nc_pre)) * 8 ) * ((kc_pre ÷ 4 ) + 1 ) ) W )
  **  (FloatArray.undef_full left_pre (4 * nc_pre ) )
  **  (FloatArray.undef_full right_pre (4 * nc_pre ) )
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min")) # Float  |-> lo)
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max")) # Float  |-> hi)
) \/
(
forall (params_pre: Z) (right_pre: Z) (left_pre: Z) (w_pre: Z) (a_pre: Z) (kc_pre: Z) (nc_pre: Z) (mr_pre: Z) (PreH1 : (1 <= mr_pre)) (PreH2 : (mr_pre <= 4)) (PreH3 : (0 < nc_pre)) (PreH4 : (4 <= kc_pre)) (PreH5 : ((kc_pre % ( 4 ) ) = 0)) (PreH6 : (a_pre <> 0)) (PreH7 : (w_pre <> 0)) (PreH8 : (left_pre <> 0)) (PreH9 : (right_pre <> 0)) (PreH10 : (params_pre <> 0)) (PreH11 : (machine_capacity a_pre w_pre left_pre params_pre kc_pre nc_pre )) (PreH12 : (machine_capacity a_pre w_pre right_pre params_pre kc_pre nc_pre )) ,
  TT && emp 
|--
  “ ((unsigned_last_nbits ((mr_pre * nc_pre )) (64)) <= 4611686018427387900) ” 
  &&  “ (0 < (unsigned_last_nbits ((mr_pre * nc_pre )) (64))) ” 
  &&  “ ((unsigned_last_nbits ((mr_pre * nc_pre )) (64)) = (mr_pre * nc_pre )) ” 
  &&  “ ((unsigned_last_nbits ((nc_pre * sizeof(FLOAT) )) (64)) = (4 * nc_pre )) ” 
  &&  “ (nc_pre <= 1152921504606846975) ”
  &&  emp
).

Definition equivalent_entail_wit_1_split_goal_1 := 
forall (params_pre: Z) (right_pre: Z) (left_pre: Z) (w_pre: Z) (a_pre: Z) (kc_pre: Z) (nc_pre: Z) (mr_pre: Z) (PreH1 : (1 <= mr_pre)) (PreH2 : (mr_pre <= 4)) (PreH3 : (0 < nc_pre)) (PreH4 : (4 <= kc_pre)) (PreH5 : ((kc_pre % ( 4 ) ) = 0)) (PreH6 : (a_pre <> 0)) (PreH7 : (w_pre <> 0)) (PreH8 : (left_pre <> 0)) (PreH9 : (right_pre <> 0)) (PreH10 : (params_pre <> 0)) (PreH11 : (machine_capacity a_pre w_pre left_pre params_pre kc_pre nc_pre )) (PreH12 : (machine_capacity a_pre w_pre right_pre params_pre kc_pre nc_pre )) ,
  ((unsigned_last_nbits ((mr_pre * nc_pre )) (64)) <= 4611686018427387900)
.

Definition equivalent_entail_wit_1_split_goal_2 := 
forall (params_pre: Z) (right_pre: Z) (left_pre: Z) (w_pre: Z) (a_pre: Z) (kc_pre: Z) (nc_pre: Z) (mr_pre: Z) (PreH1 : (1 <= mr_pre)) (PreH2 : (mr_pre <= 4)) (PreH3 : (0 < nc_pre)) (PreH4 : (4 <= kc_pre)) (PreH5 : ((kc_pre % ( 4 ) ) = 0)) (PreH6 : (a_pre <> 0)) (PreH7 : (w_pre <> 0)) (PreH8 : (left_pre <> 0)) (PreH9 : (right_pre <> 0)) (PreH10 : (params_pre <> 0)) (PreH11 : (machine_capacity a_pre w_pre left_pre params_pre kc_pre nc_pre )) (PreH12 : (machine_capacity a_pre w_pre right_pre params_pre kc_pre nc_pre )) ,
  (0 < (unsigned_last_nbits ((mr_pre * nc_pre )) (64)))
.

Definition equivalent_entail_wit_1_split_goal_3 := 
forall (params_pre: Z) (right_pre: Z) (left_pre: Z) (w_pre: Z) (a_pre: Z) (kc_pre: Z) (nc_pre: Z) (mr_pre: Z) (PreH1 : (1 <= mr_pre)) (PreH2 : (mr_pre <= 4)) (PreH3 : (0 < nc_pre)) (PreH4 : (4 <= kc_pre)) (PreH5 : ((kc_pre % ( 4 ) ) = 0)) (PreH6 : (a_pre <> 0)) (PreH7 : (w_pre <> 0)) (PreH8 : (left_pre <> 0)) (PreH9 : (right_pre <> 0)) (PreH10 : (params_pre <> 0)) (PreH11 : (machine_capacity a_pre w_pre left_pre params_pre kc_pre nc_pre )) (PreH12 : (machine_capacity a_pre w_pre right_pre params_pre kc_pre nc_pre )) ,
  ((unsigned_last_nbits ((mr_pre * nc_pre )) (64)) = (mr_pre * nc_pre ))
.

Definition equivalent_entail_wit_1_split_goal_4 := 
forall (params_pre: Z) (right_pre: Z) (left_pre: Z) (w_pre: Z) (a_pre: Z) (kc_pre: Z) (nc_pre: Z) (mr_pre: Z) (PreH1 : (1 <= mr_pre)) (PreH2 : (mr_pre <= 4)) (PreH3 : (0 < nc_pre)) (PreH4 : (4 <= kc_pre)) (PreH5 : ((kc_pre % ( 4 ) ) = 0)) (PreH6 : (a_pre <> 0)) (PreH7 : (w_pre <> 0)) (PreH8 : (left_pre <> 0)) (PreH9 : (right_pre <> 0)) (PreH10 : (params_pre <> 0)) (PreH11 : (machine_capacity a_pre w_pre left_pre params_pre kc_pre nc_pre )) (PreH12 : (machine_capacity a_pre w_pre right_pre params_pre kc_pre nc_pre )) ,
  ((unsigned_last_nbits ((nc_pre * sizeof(FLOAT) )) (64)) = (4 * nc_pre ))
.

Definition equivalent_entail_wit_1_split_goal_5 := 
forall (params_pre: Z) (right_pre: Z) (left_pre: Z) (w_pre: Z) (a_pre: Z) (kc_pre: Z) (nc_pre: Z) (mr_pre: Z) (PreH1 : (1 <= mr_pre)) (PreH2 : (mr_pre <= 4)) (PreH3 : (0 < nc_pre)) (PreH4 : (4 <= kc_pre)) (PreH5 : ((kc_pre % ( 4 ) ) = 0)) (PreH6 : (a_pre <> 0)) (PreH7 : (w_pre <> 0)) (PreH8 : (left_pre <> 0)) (PreH9 : (right_pre <> 0)) (PreH10 : (params_pre <> 0)) (PreH11 : (machine_capacity a_pre w_pre left_pre params_pre kc_pre nc_pre )) (PreH12 : (machine_capacity a_pre w_pre right_pre params_pre kc_pre nc_pre )) ,
  (nc_pre <= 1152921504606846975)
.

Definition equivalent_return_wit_1 := 
(
forall (params_pre: Z) (right_pre: Z) (left_pre: Z) (w_pre: Z) (a_pre: Z) (kc_pre: Z) (nc_pre: Z) (mr_pre: Z) (hi: fp32) (lo: fp32) (W: (@list fp32)) (A: (@list fp32)) (cm_stride: Z) (observed: Z) (retval: Z) (PreH1 : (retval = 1)) (PreH2 : (1 <= mr_pre)) (PreH3 : (mr_pre <= 4)) (PreH4 : (0 < nc_pre)) (PreH5 : (1 <= mr_pre)) (PreH6 : (mr_pre <= 4)) (PreH7 : (0 < nc_pre)) (PreH8 : (1 <= mr_pre)) (PreH9 : (mr_pre <= 4)) (PreH10 : (0 < nc_pre)) (PreH11 : (4 <= kc_pre)) (PreH12 : (nc_pre <= 1152921504606846975)) (PreH13 : (cm_stride = (4 * nc_pre ))) (PreH14 : (observed = (mr_pre * nc_pre ))) (PreH15 : ((kc_pre % ( 4 ) ) = 0)) (PreH16 : (0 < kc_pre)) (PreH17 : (0 < observed)) (PreH18 : (observed <= 4611686018427387900)) (PreH19 : (a_pre <> 0)) (PreH20 : (w_pre <> 0)) (PreH21 : (left_pre <> 0)) (PreH22 : (right_pre <> 0)) (PreH23 : (params_pre <> 0)) (PreH24 : (machine_capacity a_pre w_pre left_pre params_pre kc_pre nc_pre )) (PreH25 : (machine_capacity a_pre w_pre right_pre params_pre kc_pre nc_pre )) ,
  (FloatArray.full left_pre observed (completed_values (A) (W) ((kc_pre ÷ 4 )) (mr_pre) (nc_pre) (lo) (hi)) )
  **  (FloatArray.full right_pre observed (completed_values (A) (W) ((kc_pre ÷ 4 )) (mr_pre) (nc_pre) (lo) (hi)) )
  **  (FloatArray.undef_seg right_pre (mr_pre * nc_pre ) (4 * nc_pre ) )
  **  (FloatArray.full a_pre (4 * (kc_pre ÷ 4 ) ) A )
  **  (FloatArray.full w_pre (((panel_count (nc_pre)) * 8 ) * ((kc_pre ÷ 4 ) + 1 ) ) W )
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min")) # Float  |-> lo)
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max")) # Float  |-> hi)
  **  (FloatArray.undef_seg left_pre (mr_pre * nc_pre ) (4 * nc_pre ) )
|--
  EX (L: (@list fp32))  (R: (@list fp32)) ,
  “ (retval = 1) ” 
  &&  “ (outputs_related L R ) ”
  &&  (FloatArray.full a_pre (4 * (kc_pre ÷ 4 ) ) A )
  **  (FloatArray.full w_pre (((panel_count (nc_pre)) * 8 ) * ((kc_pre ÷ 4 ) + 1 ) ) W )
  **  (FloatArray.full left_pre (mr_pre * nc_pre ) L )
  **  (FloatArray.undef_seg left_pre (mr_pre * nc_pre ) (4 * nc_pre ) )
  **  (FloatArray.full right_pre (mr_pre * nc_pre ) R )
  **  (FloatArray.undef_seg right_pre (mr_pre * nc_pre ) (4 * nc_pre ) )
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min")) # Float  |-> lo)
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max")) # Float  |-> hi)
) \/
(
forall (params_pre: Z) (right_pre: Z) (left_pre: Z) (w_pre: Z) (a_pre: Z) (kc_pre: Z) (nc_pre: Z) (mr_pre: Z) (hi: fp32) (lo: fp32) (W: (@list fp32)) (A: (@list fp32)) (cm_stride: Z) (observed: Z) (retval: Z) (PreH1 : (retval = 1)) (PreH2 : (1 <= mr_pre)) (PreH3 : (mr_pre <= 4)) (PreH4 : (0 < nc_pre)) (PreH5 : (1 <= mr_pre)) (PreH6 : (mr_pre <= 4)) (PreH7 : (0 < nc_pre)) (PreH8 : (1 <= mr_pre)) (PreH9 : (mr_pre <= 4)) (PreH10 : (0 < nc_pre)) (PreH11 : (4 <= kc_pre)) (PreH12 : (nc_pre <= 1152921504606846975)) (PreH13 : (cm_stride = (4 * nc_pre ))) (PreH14 : (observed = (mr_pre * nc_pre ))) (PreH15 : ((kc_pre % ( 4 ) ) = 0)) (PreH16 : (0 < kc_pre)) (PreH17 : (0 < observed)) (PreH18 : (observed <= 4611686018427387900)) (PreH19 : (a_pre <> 0)) (PreH20 : (w_pre <> 0)) (PreH21 : (left_pre <> 0)) (PreH22 : (right_pre <> 0)) (PreH23 : (params_pre <> 0)) (PreH24 : (machine_capacity a_pre w_pre left_pre params_pre kc_pre nc_pre )) (PreH25 : (machine_capacity a_pre w_pre right_pre params_pre kc_pre nc_pre )) ,
  TT && emp 
|--
  “ (outputs_related (completed_values (A) (W) ((kc_pre ÷ 4 )) (mr_pre) (nc_pre) (lo) (hi)) (completed_values (A) (W) ((kc_pre ÷ 4 )) (mr_pre) (nc_pre) (lo) (hi)) ) ”
  &&  emp
).

Definition equivalent_return_wit_1_split_goal_1 := 
forall (params_pre: Z) (right_pre: Z) (left_pre: Z) (w_pre: Z) (a_pre: Z) (kc_pre: Z) (nc_pre: Z) (mr_pre: Z) (hi: fp32) (lo: fp32) (W: (@list fp32)) (A: (@list fp32)) (cm_stride: Z) (observed: Z) (retval: Z) (PreH1 : (retval = 1)) (PreH2 : (1 <= mr_pre)) (PreH3 : (mr_pre <= 4)) (PreH4 : (0 < nc_pre)) (PreH5 : (1 <= mr_pre)) (PreH6 : (mr_pre <= 4)) (PreH7 : (0 < nc_pre)) (PreH8 : (1 <= mr_pre)) (PreH9 : (mr_pre <= 4)) (PreH10 : (0 < nc_pre)) (PreH11 : (4 <= kc_pre)) (PreH12 : (nc_pre <= 1152921504606846975)) (PreH13 : (cm_stride = (4 * nc_pre ))) (PreH14 : (observed = (mr_pre * nc_pre ))) (PreH15 : ((kc_pre % ( 4 ) ) = 0)) (PreH16 : (0 < kc_pre)) (PreH17 : (0 < observed)) (PreH18 : (observed <= 4611686018427387900)) (PreH19 : (a_pre <> 0)) (PreH20 : (w_pre <> 0)) (PreH21 : (left_pre <> 0)) (PreH22 : (right_pre <> 0)) (PreH23 : (params_pre <> 0)) (PreH24 : (machine_capacity a_pre w_pre left_pre params_pre kc_pre nc_pre )) (PreH25 : (machine_capacity a_pre w_pre right_pre params_pre kc_pre nc_pre )) ,
  (outputs_related (completed_values (A) (W) ((kc_pre ÷ 4 )) (mr_pre) (nc_pre) (lo) (hi)) (completed_values (A) (W) ((kc_pre ÷ 4 )) (mr_pre) (nc_pre) (lo) (hi)) )
.

Definition equivalent_partial_solve_wit_1_pure := 
forall (params_pre: Z) (right_pre: Z) (left_pre: Z) (w_pre: Z) (a_pre: Z) (kc_pre: Z) (nc_pre: Z) (mr_pre: Z) (hi: fp32) (lo: fp32) (W: (@list fp32)) (A: (@list fp32)) (cm_stride: Z) (observed: Z) (PreH1 : (1 <= mr_pre)) (PreH2 : (mr_pre <= 4)) (PreH3 : (0 < nc_pre)) (PreH4 : (4 <= kc_pre)) (PreH5 : (nc_pre <= 1152921504606846975)) (PreH6 : (cm_stride = (4 * nc_pre ))) (PreH7 : (observed = (mr_pre * nc_pre ))) (PreH8 : ((kc_pre % ( 4 ) ) = 0)) (PreH9 : (0 < kc_pre)) (PreH10 : (0 < observed)) (PreH11 : (observed <= 4611686018427387900)) (PreH12 : (a_pre <> 0)) (PreH13 : (w_pre <> 0)) (PreH14 : (left_pre <> 0)) (PreH15 : (right_pre <> 0)) (PreH16 : (params_pre <> 0)) (PreH17 : (machine_capacity a_pre w_pre left_pre params_pre kc_pre nc_pre )) (PreH18 : (machine_capacity a_pre w_pre right_pre params_pre kc_pre nc_pre )) ,
  ((( &( "mr" ) )) # UInt64  |-> mr_pre)
  **  ((( &( "nc" ) )) # UInt64  |-> nc_pre)
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "w" ) )) # Ptr  |-> w_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "cm_stride" ) )) # UInt64  |-> cm_stride)
  **  ((( &( "observed" ) )) # UInt64  |-> observed)
  **  (FloatArray.full a_pre (4 * (kc_pre ÷ 4 ) ) A )
  **  (FloatArray.full w_pre (((panel_count (nc_pre)) * 8 ) * ((kc_pre ÷ 4 ) + 1 ) ) W )
  **  (FloatArray.undef_full left_pre (4 * nc_pre ) )
  **  (FloatArray.undef_full right_pre (4 * nc_pre ) )
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min")) # Float  |-> lo)
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max")) # Float  |-> hi)
|--
  “ (1 <= mr_pre) ” 
  &&  “ (mr_pre <= 4) ” 
  &&  “ (0 < nc_pre) ” 
  &&  “ (0 < kc_pre) ” 
  &&  “ ((kc_pre % ( 4 ) ) = 0) ” 
  &&  “ (kc_pre = kc_pre) ” 
  &&  “ (cm_stride = (4 * nc_pre )) ” 
  &&  “ (32 = 32) ” 
  &&  “ (machine_capacity a_pre w_pre left_pre params_pre kc_pre nc_pre ) ” 
  &&  “ (a_pre <> 0) ” 
  &&  “ (w_pre <> 0) ” 
  &&  “ (left_pre <> 0) ” 
  &&  “ (params_pre <> 0) ”
.

Definition equivalent_partial_solve_wit_1_aux := 
forall (params_pre: Z) (right_pre: Z) (left_pre: Z) (w_pre: Z) (a_pre: Z) (kc_pre: Z) (nc_pre: Z) (mr_pre: Z) (hi: fp32) (lo: fp32) (W: (@list fp32)) (A: (@list fp32)) (cm_stride: Z) (observed: Z) (PreH1 : (1 <= mr_pre)) (PreH2 : (mr_pre <= 4)) (PreH3 : (0 < nc_pre)) (PreH4 : (4 <= kc_pre)) (PreH5 : (nc_pre <= 1152921504606846975)) (PreH6 : (cm_stride = (4 * nc_pre ))) (PreH7 : (observed = (mr_pre * nc_pre ))) (PreH8 : ((kc_pre % ( 4 ) ) = 0)) (PreH9 : (0 < kc_pre)) (PreH10 : (0 < observed)) (PreH11 : (observed <= 4611686018427387900)) (PreH12 : (a_pre <> 0)) (PreH13 : (w_pre <> 0)) (PreH14 : (left_pre <> 0)) (PreH15 : (right_pre <> 0)) (PreH16 : (params_pre <> 0)) (PreH17 : (machine_capacity a_pre w_pre left_pre params_pre kc_pre nc_pre )) (PreH18 : (machine_capacity a_pre w_pre right_pre params_pre kc_pre nc_pre )) ,
  (FloatArray.full a_pre (4 * (kc_pre ÷ 4 ) ) A )
  **  (FloatArray.full w_pre (((panel_count (nc_pre)) * 8 ) * ((kc_pre ÷ 4 ) + 1 ) ) W )
  **  (FloatArray.undef_full left_pre (4 * nc_pre ) )
  **  (FloatArray.undef_full right_pre (4 * nc_pre ) )
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min")) # Float  |-> lo)
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max")) # Float  |-> hi)
|--
  “ (1 <= mr_pre) ” 
  &&  “ (mr_pre <= 4) ” 
  &&  “ (0 < nc_pre) ” 
  &&  “ (0 < kc_pre) ” 
  &&  “ ((kc_pre % ( 4 ) ) = 0) ” 
  &&  “ (kc_pre = kc_pre) ” 
  &&  “ (cm_stride = (4 * nc_pre )) ” 
  &&  “ (32 = 32) ” 
  &&  “ (machine_capacity a_pre w_pre left_pre params_pre kc_pre nc_pre ) ” 
  &&  “ (a_pre <> 0) ” 
  &&  “ (w_pre <> 0) ” 
  &&  “ (left_pre <> 0) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (1 <= mr_pre) ” 
  &&  “ (mr_pre <= 4) ” 
  &&  “ (0 < nc_pre) ” 
  &&  “ (4 <= kc_pre) ” 
  &&  “ (nc_pre <= 1152921504606846975) ” 
  &&  “ (cm_stride = (4 * nc_pre )) ” 
  &&  “ (observed = (mr_pre * nc_pre )) ” 
  &&  “ ((kc_pre % ( 4 ) ) = 0) ” 
  &&  “ (0 < kc_pre) ” 
  &&  “ (0 < observed) ” 
  &&  “ (observed <= 4611686018427387900) ” 
  &&  “ (a_pre <> 0) ” 
  &&  “ (w_pre <> 0) ” 
  &&  “ (left_pre <> 0) ” 
  &&  “ (right_pre <> 0) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (machine_capacity a_pre w_pre left_pre params_pre kc_pre nc_pre ) ” 
  &&  “ (machine_capacity a_pre w_pre right_pre params_pre kc_pre nc_pre ) ”
  &&  (FloatArray.full a_pre (4 * (kc_pre ÷ 4 ) ) A )
  **  (FloatArray.full w_pre (((panel_count (nc_pre)) * 8 ) * ((kc_pre ÷ 4 ) + 1 ) ) W )
  **  (FloatArray.undef_full left_pre (4 * nc_pre ) )
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min")) # Float  |-> lo)
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max")) # Float  |-> hi)
  **  (FloatArray.undef_full right_pre (4 * nc_pre ) )
.

Definition equivalent_partial_solve_wit_1 := equivalent_partial_solve_wit_1_pure -> equivalent_partial_solve_wit_1_aux.

Definition equivalent_partial_solve_wit_2_pure := 
forall (params_pre: Z) (right_pre: Z) (left_pre: Z) (w_pre: Z) (a_pre: Z) (kc_pre: Z) (nc_pre: Z) (mr_pre: Z) (hi: fp32) (lo: fp32) (W: (@list fp32)) (A: (@list fp32)) (cm_stride: Z) (observed: Z) (PreH1 : (1 <= mr_pre)) (PreH2 : (mr_pre <= 4)) (PreH3 : (0 < nc_pre)) (PreH4 : (4 <= kc_pre)) (PreH5 : (nc_pre <= 1152921504606846975)) (PreH6 : (cm_stride = (4 * nc_pre ))) (PreH7 : (observed = (mr_pre * nc_pre ))) (PreH8 : ((kc_pre % ( 4 ) ) = 0)) (PreH9 : (0 < kc_pre)) (PreH10 : (0 < observed)) (PreH11 : (observed <= 4611686018427387900)) (PreH12 : (a_pre <> 0)) (PreH13 : (w_pre <> 0)) (PreH14 : (left_pre <> 0)) (PreH15 : (right_pre <> 0)) (PreH16 : (params_pre <> 0)) (PreH17 : (machine_capacity a_pre w_pre left_pre params_pre kc_pre nc_pre )) (PreH18 : (machine_capacity a_pre w_pre right_pre params_pre kc_pre nc_pre )) ,
  (FloatArray.full a_pre (4 * (kc_pre ÷ 4 ) ) A )
  **  (FloatArray.full w_pre (((panel_count (nc_pre)) * 8 ) * ((kc_pre ÷ 4 ) + 1 ) ) W )
  **  (output_state left_pre mr_pre nc_pre (kc_pre ÷ 4 ) nc_pre A W lo hi )
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min")) # Float  |-> lo)
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max")) # Float  |-> hi)
  **  ((( &( "mr" ) )) # UInt64  |-> mr_pre)
  **  ((( &( "nc" ) )) # UInt64  |-> nc_pre)
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "w" ) )) # Ptr  |-> w_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "cm_stride" ) )) # UInt64  |-> cm_stride)
  **  ((( &( "observed" ) )) # UInt64  |-> observed)
  **  (FloatArray.undef_full right_pre (4 * nc_pre ) )
|--
  “ (1 <= mr_pre) ” 
  &&  “ (mr_pre <= 4) ” 
  &&  “ (0 < nc_pre) ”
.

Definition equivalent_partial_solve_wit_2_aux := 
forall (params_pre: Z) (right_pre: Z) (left_pre: Z) (w_pre: Z) (a_pre: Z) (kc_pre: Z) (nc_pre: Z) (mr_pre: Z) (hi: fp32) (lo: fp32) (W: (@list fp32)) (A: (@list fp32)) (cm_stride: Z) (observed: Z) (PreH1 : (1 <= mr_pre)) (PreH2 : (mr_pre <= 4)) (PreH3 : (0 < nc_pre)) (PreH4 : (4 <= kc_pre)) (PreH5 : (nc_pre <= 1152921504606846975)) (PreH6 : (cm_stride = (4 * nc_pre ))) (PreH7 : (observed = (mr_pre * nc_pre ))) (PreH8 : ((kc_pre % ( 4 ) ) = 0)) (PreH9 : (0 < kc_pre)) (PreH10 : (0 < observed)) (PreH11 : (observed <= 4611686018427387900)) (PreH12 : (a_pre <> 0)) (PreH13 : (w_pre <> 0)) (PreH14 : (left_pre <> 0)) (PreH15 : (right_pre <> 0)) (PreH16 : (params_pre <> 0)) (PreH17 : (machine_capacity a_pre w_pre left_pre params_pre kc_pre nc_pre )) (PreH18 : (machine_capacity a_pre w_pre right_pre params_pre kc_pre nc_pre )) ,
  (FloatArray.full a_pre (4 * (kc_pre ÷ 4 ) ) A )
  **  (FloatArray.full w_pre (((panel_count (nc_pre)) * 8 ) * ((kc_pre ÷ 4 ) + 1 ) ) W )
  **  (output_state left_pre mr_pre nc_pre (kc_pre ÷ 4 ) nc_pre A W lo hi )
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min")) # Float  |-> lo)
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max")) # Float  |-> hi)
  **  (FloatArray.undef_full right_pre (4 * nc_pre ) )
|--
  “ (1 <= mr_pre) ” 
  &&  “ (mr_pre <= 4) ” 
  &&  “ (0 < nc_pre) ” 
  &&  “ (1 <= mr_pre) ” 
  &&  “ (mr_pre <= 4) ” 
  &&  “ (0 < nc_pre) ” 
  &&  “ (4 <= kc_pre) ” 
  &&  “ (nc_pre <= 1152921504606846975) ” 
  &&  “ (cm_stride = (4 * nc_pre )) ” 
  &&  “ (observed = (mr_pre * nc_pre )) ” 
  &&  “ ((kc_pre % ( 4 ) ) = 0) ” 
  &&  “ (0 < kc_pre) ” 
  &&  “ (0 < observed) ” 
  &&  “ (observed <= 4611686018427387900) ” 
  &&  “ (a_pre <> 0) ” 
  &&  “ (w_pre <> 0) ” 
  &&  “ (left_pre <> 0) ” 
  &&  “ (right_pre <> 0) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (machine_capacity a_pre w_pre left_pre params_pre kc_pre nc_pre ) ” 
  &&  “ (machine_capacity a_pre w_pre right_pre params_pre kc_pre nc_pre ) ”
  &&  (output_state left_pre mr_pre nc_pre (kc_pre ÷ 4 ) nc_pre A W lo hi )
  **  (FloatArray.full a_pre (4 * (kc_pre ÷ 4 ) ) A )
  **  (FloatArray.full w_pre (((panel_count (nc_pre)) * 8 ) * ((kc_pre ÷ 4 ) + 1 ) ) W )
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min")) # Float  |-> lo)
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max")) # Float  |-> hi)
  **  (FloatArray.undef_full right_pre (4 * nc_pre ) )
.

Definition equivalent_partial_solve_wit_2 := equivalent_partial_solve_wit_2_pure -> equivalent_partial_solve_wit_2_aux.

Definition equivalent_partial_solve_wit_3_pure := 
forall (params_pre: Z) (right_pre: Z) (left_pre: Z) (w_pre: Z) (a_pre: Z) (kc_pre: Z) (nc_pre: Z) (mr_pre: Z) (hi: fp32) (lo: fp32) (W: (@list fp32)) (A: (@list fp32)) (cm_stride: Z) (observed: Z) (PreH1 : (1 <= mr_pre)) (PreH2 : (mr_pre <= 4)) (PreH3 : (0 < nc_pre)) (PreH4 : (1 <= mr_pre)) (PreH5 : (mr_pre <= 4)) (PreH6 : (0 < nc_pre)) (PreH7 : (4 <= kc_pre)) (PreH8 : (nc_pre <= 1152921504606846975)) (PreH9 : (cm_stride = (4 * nc_pre ))) (PreH10 : (observed = (mr_pre * nc_pre ))) (PreH11 : ((kc_pre % ( 4 ) ) = 0)) (PreH12 : (0 < kc_pre)) (PreH13 : (0 < observed)) (PreH14 : (observed <= 4611686018427387900)) (PreH15 : (a_pre <> 0)) (PreH16 : (w_pre <> 0)) (PreH17 : (left_pre <> 0)) (PreH18 : (right_pre <> 0)) (PreH19 : (params_pre <> 0)) (PreH20 : (machine_capacity a_pre w_pre left_pre params_pre kc_pre nc_pre )) (PreH21 : (machine_capacity a_pre w_pre right_pre params_pre kc_pre nc_pre )) ,
  ((( &( "mr" ) )) # UInt64  |-> mr_pre)
  **  ((( &( "nc" ) )) # UInt64  |-> nc_pre)
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  (FloatArray.full left_pre (mr_pre * nc_pre ) (completed_values (A) (W) ((kc_pre ÷ 4 )) (mr_pre) (nc_pre) (lo) (hi)) )
  **  (FloatArray.undef_seg left_pre (mr_pre * nc_pre ) (4 * nc_pre ) )
  **  (FloatArray.full a_pre (4 * (kc_pre ÷ 4 ) ) A )
  **  (FloatArray.full w_pre (((panel_count (nc_pre)) * 8 ) * ((kc_pre ÷ 4 ) + 1 ) ) W )
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min")) # Float  |-> lo)
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max")) # Float  |-> hi)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "w" ) )) # Ptr  |-> w_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "cm_stride" ) )) # UInt64  |-> cm_stride)
  **  ((( &( "observed" ) )) # UInt64  |-> observed)
  **  (FloatArray.undef_full right_pre (4 * nc_pre ) )
|--
  “ (1 <= mr_pre) ” 
  &&  “ (mr_pre <= 4) ” 
  &&  “ (0 < nc_pre) ” 
  &&  “ (0 < kc_pre) ” 
  &&  “ ((kc_pre % ( 4 ) ) = 0) ” 
  &&  “ (kc_pre = kc_pre) ” 
  &&  “ (cm_stride = (4 * nc_pre )) ” 
  &&  “ (32 = 32) ” 
  &&  “ (machine_capacity a_pre w_pre right_pre params_pre kc_pre nc_pre ) ” 
  &&  “ (a_pre <> 0) ” 
  &&  “ (w_pre <> 0) ” 
  &&  “ (right_pre <> 0) ” 
  &&  “ (params_pre <> 0) ”
.

Definition equivalent_partial_solve_wit_3_aux := 
forall (params_pre: Z) (right_pre: Z) (left_pre: Z) (w_pre: Z) (a_pre: Z) (kc_pre: Z) (nc_pre: Z) (mr_pre: Z) (hi: fp32) (lo: fp32) (W: (@list fp32)) (A: (@list fp32)) (cm_stride: Z) (observed: Z) (PreH1 : (1 <= mr_pre)) (PreH2 : (mr_pre <= 4)) (PreH3 : (0 < nc_pre)) (PreH4 : (1 <= mr_pre)) (PreH5 : (mr_pre <= 4)) (PreH6 : (0 < nc_pre)) (PreH7 : (4 <= kc_pre)) (PreH8 : (nc_pre <= 1152921504606846975)) (PreH9 : (cm_stride = (4 * nc_pre ))) (PreH10 : (observed = (mr_pre * nc_pre ))) (PreH11 : ((kc_pre % ( 4 ) ) = 0)) (PreH12 : (0 < kc_pre)) (PreH13 : (0 < observed)) (PreH14 : (observed <= 4611686018427387900)) (PreH15 : (a_pre <> 0)) (PreH16 : (w_pre <> 0)) (PreH17 : (left_pre <> 0)) (PreH18 : (right_pre <> 0)) (PreH19 : (params_pre <> 0)) (PreH20 : (machine_capacity a_pre w_pre left_pre params_pre kc_pre nc_pre )) (PreH21 : (machine_capacity a_pre w_pre right_pre params_pre kc_pre nc_pre )) ,
  (FloatArray.full left_pre (mr_pre * nc_pre ) (completed_values (A) (W) ((kc_pre ÷ 4 )) (mr_pre) (nc_pre) (lo) (hi)) )
  **  (FloatArray.undef_seg left_pre (mr_pre * nc_pre ) (4 * nc_pre ) )
  **  (FloatArray.full a_pre (4 * (kc_pre ÷ 4 ) ) A )
  **  (FloatArray.full w_pre (((panel_count (nc_pre)) * 8 ) * ((kc_pre ÷ 4 ) + 1 ) ) W )
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min")) # Float  |-> lo)
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max")) # Float  |-> hi)
  **  (FloatArray.undef_full right_pre (4 * nc_pre ) )
|--
  “ (1 <= mr_pre) ” 
  &&  “ (mr_pre <= 4) ” 
  &&  “ (0 < nc_pre) ” 
  &&  “ (0 < kc_pre) ” 
  &&  “ ((kc_pre % ( 4 ) ) = 0) ” 
  &&  “ (kc_pre = kc_pre) ” 
  &&  “ (cm_stride = (4 * nc_pre )) ” 
  &&  “ (32 = 32) ” 
  &&  “ (machine_capacity a_pre w_pre right_pre params_pre kc_pre nc_pre ) ” 
  &&  “ (a_pre <> 0) ” 
  &&  “ (w_pre <> 0) ” 
  &&  “ (right_pre <> 0) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (1 <= mr_pre) ” 
  &&  “ (mr_pre <= 4) ” 
  &&  “ (0 < nc_pre) ” 
  &&  “ (1 <= mr_pre) ” 
  &&  “ (mr_pre <= 4) ” 
  &&  “ (0 < nc_pre) ” 
  &&  “ (4 <= kc_pre) ” 
  &&  “ (nc_pre <= 1152921504606846975) ” 
  &&  “ (cm_stride = (4 * nc_pre )) ” 
  &&  “ (observed = (mr_pre * nc_pre )) ” 
  &&  “ ((kc_pre % ( 4 ) ) = 0) ” 
  &&  “ (0 < kc_pre) ” 
  &&  “ (0 < observed) ” 
  &&  “ (observed <= 4611686018427387900) ” 
  &&  “ (a_pre <> 0) ” 
  &&  “ (w_pre <> 0) ” 
  &&  “ (left_pre <> 0) ” 
  &&  “ (right_pre <> 0) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (machine_capacity a_pre w_pre left_pre params_pre kc_pre nc_pre ) ” 
  &&  “ (machine_capacity a_pre w_pre right_pre params_pre kc_pre nc_pre ) ”
  &&  (FloatArray.full a_pre (4 * (kc_pre ÷ 4 ) ) A )
  **  (FloatArray.full w_pre (((panel_count (nc_pre)) * 8 ) * ((kc_pre ÷ 4 ) + 1 ) ) W )
  **  (FloatArray.undef_full right_pre (4 * nc_pre ) )
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min")) # Float  |-> lo)
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max")) # Float  |-> hi)
  **  (FloatArray.full left_pre (mr_pre * nc_pre ) (completed_values (A) (W) ((kc_pre ÷ 4 )) (mr_pre) (nc_pre) (lo) (hi)) )
  **  (FloatArray.undef_seg left_pre (mr_pre * nc_pre ) (4 * nc_pre ) )
.

Definition equivalent_partial_solve_wit_3 := equivalent_partial_solve_wit_3_pure -> equivalent_partial_solve_wit_3_aux.

Definition equivalent_partial_solve_wit_4_pure := 
forall (params_pre: Z) (right_pre: Z) (left_pre: Z) (w_pre: Z) (a_pre: Z) (kc_pre: Z) (nc_pre: Z) (mr_pre: Z) (hi: fp32) (lo: fp32) (W: (@list fp32)) (A: (@list fp32)) (cm_stride: Z) (observed: Z) (PreH1 : (1 <= mr_pre)) (PreH2 : (mr_pre <= 4)) (PreH3 : (0 < nc_pre)) (PreH4 : (1 <= mr_pre)) (PreH5 : (mr_pre <= 4)) (PreH6 : (0 < nc_pre)) (PreH7 : (4 <= kc_pre)) (PreH8 : (nc_pre <= 1152921504606846975)) (PreH9 : (cm_stride = (4 * nc_pre ))) (PreH10 : (observed = (mr_pre * nc_pre ))) (PreH11 : ((kc_pre % ( 4 ) ) = 0)) (PreH12 : (0 < kc_pre)) (PreH13 : (0 < observed)) (PreH14 : (observed <= 4611686018427387900)) (PreH15 : (a_pre <> 0)) (PreH16 : (w_pre <> 0)) (PreH17 : (left_pre <> 0)) (PreH18 : (right_pre <> 0)) (PreH19 : (params_pre <> 0)) (PreH20 : (machine_capacity a_pre w_pre left_pre params_pre kc_pre nc_pre )) (PreH21 : (machine_capacity a_pre w_pre right_pre params_pre kc_pre nc_pre )) ,
  (FloatArray.full a_pre (4 * (kc_pre ÷ 4 ) ) A )
  **  (FloatArray.full w_pre (((panel_count (nc_pre)) * 8 ) * ((kc_pre ÷ 4 ) + 1 ) ) W )
  **  (output_state right_pre mr_pre nc_pre (kc_pre ÷ 4 ) nc_pre A W lo hi )
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min")) # Float  |-> lo)
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max")) # Float  |-> hi)
  **  ((( &( "mr" ) )) # UInt64  |-> mr_pre)
  **  ((( &( "nc" ) )) # UInt64  |-> nc_pre)
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  (FloatArray.full left_pre (mr_pre * nc_pre ) (completed_values (A) (W) ((kc_pre ÷ 4 )) (mr_pre) (nc_pre) (lo) (hi)) )
  **  (FloatArray.undef_seg left_pre (mr_pre * nc_pre ) (4 * nc_pre ) )
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "w" ) )) # Ptr  |-> w_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "cm_stride" ) )) # UInt64  |-> cm_stride)
  **  ((( &( "observed" ) )) # UInt64  |-> observed)
|--
  “ (1 <= mr_pre) ” 
  &&  “ (mr_pre <= 4) ” 
  &&  “ (0 < nc_pre) ”
.

Definition equivalent_partial_solve_wit_4_aux := 
forall (params_pre: Z) (right_pre: Z) (left_pre: Z) (w_pre: Z) (a_pre: Z) (kc_pre: Z) (nc_pre: Z) (mr_pre: Z) (hi: fp32) (lo: fp32) (W: (@list fp32)) (A: (@list fp32)) (cm_stride: Z) (observed: Z) (PreH1 : (1 <= mr_pre)) (PreH2 : (mr_pre <= 4)) (PreH3 : (0 < nc_pre)) (PreH4 : (1 <= mr_pre)) (PreH5 : (mr_pre <= 4)) (PreH6 : (0 < nc_pre)) (PreH7 : (4 <= kc_pre)) (PreH8 : (nc_pre <= 1152921504606846975)) (PreH9 : (cm_stride = (4 * nc_pre ))) (PreH10 : (observed = (mr_pre * nc_pre ))) (PreH11 : ((kc_pre % ( 4 ) ) = 0)) (PreH12 : (0 < kc_pre)) (PreH13 : (0 < observed)) (PreH14 : (observed <= 4611686018427387900)) (PreH15 : (a_pre <> 0)) (PreH16 : (w_pre <> 0)) (PreH17 : (left_pre <> 0)) (PreH18 : (right_pre <> 0)) (PreH19 : (params_pre <> 0)) (PreH20 : (machine_capacity a_pre w_pre left_pre params_pre kc_pre nc_pre )) (PreH21 : (machine_capacity a_pre w_pre right_pre params_pre kc_pre nc_pre )) ,
  (FloatArray.full a_pre (4 * (kc_pre ÷ 4 ) ) A )
  **  (FloatArray.full w_pre (((panel_count (nc_pre)) * 8 ) * ((kc_pre ÷ 4 ) + 1 ) ) W )
  **  (output_state right_pre mr_pre nc_pre (kc_pre ÷ 4 ) nc_pre A W lo hi )
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min")) # Float  |-> lo)
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max")) # Float  |-> hi)
  **  (FloatArray.full left_pre (mr_pre * nc_pre ) (completed_values (A) (W) ((kc_pre ÷ 4 )) (mr_pre) (nc_pre) (lo) (hi)) )
  **  (FloatArray.undef_seg left_pre (mr_pre * nc_pre ) (4 * nc_pre ) )
|--
  “ (1 <= mr_pre) ” 
  &&  “ (mr_pre <= 4) ” 
  &&  “ (0 < nc_pre) ” 
  &&  “ (1 <= mr_pre) ” 
  &&  “ (mr_pre <= 4) ” 
  &&  “ (0 < nc_pre) ” 
  &&  “ (1 <= mr_pre) ” 
  &&  “ (mr_pre <= 4) ” 
  &&  “ (0 < nc_pre) ” 
  &&  “ (4 <= kc_pre) ” 
  &&  “ (nc_pre <= 1152921504606846975) ” 
  &&  “ (cm_stride = (4 * nc_pre )) ” 
  &&  “ (observed = (mr_pre * nc_pre )) ” 
  &&  “ ((kc_pre % ( 4 ) ) = 0) ” 
  &&  “ (0 < kc_pre) ” 
  &&  “ (0 < observed) ” 
  &&  “ (observed <= 4611686018427387900) ” 
  &&  “ (a_pre <> 0) ” 
  &&  “ (w_pre <> 0) ” 
  &&  “ (left_pre <> 0) ” 
  &&  “ (right_pre <> 0) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (machine_capacity a_pre w_pre left_pre params_pre kc_pre nc_pre ) ” 
  &&  “ (machine_capacity a_pre w_pre right_pre params_pre kc_pre nc_pre ) ”
  &&  (output_state right_pre mr_pre nc_pre (kc_pre ÷ 4 ) nc_pre A W lo hi )
  **  (FloatArray.full a_pre (4 * (kc_pre ÷ 4 ) ) A )
  **  (FloatArray.full w_pre (((panel_count (nc_pre)) * 8 ) * ((kc_pre ÷ 4 ) + 1 ) ) W )
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min")) # Float  |-> lo)
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max")) # Float  |-> hi)
  **  (FloatArray.full left_pre (mr_pre * nc_pre ) (completed_values (A) (W) ((kc_pre ÷ 4 )) (mr_pre) (nc_pre) (lo) (hi)) )
  **  (FloatArray.undef_seg left_pre (mr_pre * nc_pre ) (4 * nc_pre ) )
.

Definition equivalent_partial_solve_wit_4 := equivalent_partial_solve_wit_4_pure -> equivalent_partial_solve_wit_4_aux.

Definition equivalent_partial_solve_wit_5_pure := 
(
forall (params_pre: Z) (right_pre: Z) (left_pre: Z) (w_pre: Z) (a_pre: Z) (kc_pre: Z) (nc_pre: Z) (mr_pre: Z) (hi: fp32) (lo: fp32) (W: (@list fp32)) (A: (@list fp32)) (cm_stride: Z) (observed: Z) (PreH1 : (1 <= mr_pre)) (PreH2 : (mr_pre <= 4)) (PreH3 : (0 < nc_pre)) (PreH4 : (1 <= mr_pre)) (PreH5 : (mr_pre <= 4)) (PreH6 : (0 < nc_pre)) (PreH7 : (1 <= mr_pre)) (PreH8 : (mr_pre <= 4)) (PreH9 : (0 < nc_pre)) (PreH10 : (4 <= kc_pre)) (PreH11 : (nc_pre <= 1152921504606846975)) (PreH12 : (cm_stride = (4 * nc_pre ))) (PreH13 : (observed = (mr_pre * nc_pre ))) (PreH14 : ((kc_pre % ( 4 ) ) = 0)) (PreH15 : (0 < kc_pre)) (PreH16 : (0 < observed)) (PreH17 : (observed <= 4611686018427387900)) (PreH18 : (a_pre <> 0)) (PreH19 : (w_pre <> 0)) (PreH20 : (left_pre <> 0)) (PreH21 : (right_pre <> 0)) (PreH22 : (params_pre <> 0)) (PreH23 : (machine_capacity a_pre w_pre left_pre params_pre kc_pre nc_pre )) (PreH24 : (machine_capacity a_pre w_pre right_pre params_pre kc_pre nc_pre )) ,
  ((( &( "mr" ) )) # UInt64  |-> mr_pre)
  **  ((( &( "nc" ) )) # UInt64  |-> nc_pre)
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  (FloatArray.full right_pre (mr_pre * nc_pre ) (completed_values (A) (W) ((kc_pre ÷ 4 )) (mr_pre) (nc_pre) (lo) (hi)) )
  **  (FloatArray.undef_seg right_pre (mr_pre * nc_pre ) (4 * nc_pre ) )
  **  (FloatArray.full a_pre (4 * (kc_pre ÷ 4 ) ) A )
  **  (FloatArray.full w_pre (((panel_count (nc_pre)) * 8 ) * ((kc_pre ÷ 4 ) + 1 ) ) W )
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min")) # Float  |-> lo)
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max")) # Float  |-> hi)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  (FloatArray.full left_pre (mr_pre * nc_pre ) (completed_values (A) (W) ((kc_pre ÷ 4 )) (mr_pre) (nc_pre) (lo) (hi)) )
  **  (FloatArray.undef_seg left_pre (mr_pre * nc_pre ) (4 * nc_pre ) )
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "w" ) )) # Ptr  |-> w_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "cm_stride" ) )) # UInt64  |-> cm_stride)
  **  ((( &( "observed" ) )) # UInt64  |-> observed)
|--
  “ (0 < observed) ” 
  &&  “ (observed <= 4611686018427387900) ” 
  &&  “ (outputs_related (completed_values (A) (W) ((kc_pre ÷ 4 )) (mr_pre) (nc_pre) (lo) (hi)) (completed_values (A) (W) ((kc_pre ÷ 4 )) (mr_pre) (nc_pre) (lo) (hi)) ) ”
) \/
(
forall (params_pre: Z) (right_pre: Z) (left_pre: Z) (w_pre: Z) (a_pre: Z) (kc_pre: Z) (nc_pre: Z) (mr_pre: Z) (hi: fp32) (lo: fp32) (W: (@list fp32)) (A: (@list fp32)) (cm_stride: Z) (observed: Z) (PreH1 : (observed <= UINT64_MAX)) (PreH2 : (cm_stride <= UINT64_MAX)) (PreH3 : (kc_pre <= UINT64_MAX)) (PreH4 : (nc_pre <= UINT64_MAX)) (PreH5 : (mr_pre <= UINT64_MAX)) (PreH6 : (observed >= 0)) (PreH7 : (cm_stride >= 0)) (PreH8 : (kc_pre >= 0)) (PreH9 : (nc_pre >= 0)) (PreH10 : (mr_pre >= 0)) (PreH11 : (1 <= mr_pre)) (PreH12 : (mr_pre <= 4)) (PreH13 : (0 < nc_pre)) (PreH14 : (1 <= mr_pre)) (PreH15 : (mr_pre <= 4)) (PreH16 : (0 < nc_pre)) (PreH17 : (1 <= mr_pre)) (PreH18 : (mr_pre <= 4)) (PreH19 : (0 < nc_pre)) (PreH20 : (4 <= kc_pre)) (PreH21 : (nc_pre <= 1152921504606846975)) (PreH22 : (cm_stride = (4 * nc_pre ))) (PreH23 : (observed = (mr_pre * nc_pre ))) (PreH24 : ((kc_pre % ( 4 ) ) = 0)) (PreH25 : (0 < kc_pre)) (PreH26 : (0 < observed)) (PreH27 : (observed <= 4611686018427387900)) (PreH28 : (a_pre <> 0)) (PreH29 : (w_pre <> 0)) (PreH30 : (left_pre <> 0)) (PreH31 : (right_pre <> 0)) (PreH32 : (params_pre <> 0)) (PreH33 : (machine_capacity a_pre w_pre left_pre params_pre kc_pre nc_pre )) (PreH34 : (machine_capacity a_pre w_pre right_pre params_pre kc_pre nc_pre )) ,
  ((( &( "mr" ) )) # UInt64  |-> mr_pre)
  **  ((( &( "nc" ) )) # UInt64  |-> nc_pre)
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  (FloatArray.full right_pre (mr_pre * nc_pre ) (completed_values (A) (W) ((kc_pre ÷ 4 )) (mr_pre) (nc_pre) (lo) (hi)) )
  **  (FloatArray.undef_seg right_pre (mr_pre * nc_pre ) (4 * nc_pre ) )
  **  (FloatArray.full a_pre (4 * (kc_pre ÷ 4 ) ) A )
  **  (FloatArray.full w_pre (((panel_count (nc_pre)) * 8 ) * ((kc_pre ÷ 4 ) + 1 ) ) W )
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min")) # Float  |-> lo)
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max")) # Float  |-> hi)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  (FloatArray.full left_pre (mr_pre * nc_pre ) (completed_values (A) (W) ((kc_pre ÷ 4 )) (mr_pre) (nc_pre) (lo) (hi)) )
  **  (FloatArray.undef_seg left_pre (mr_pre * nc_pre ) (4 * nc_pre ) )
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "w" ) )) # Ptr  |-> w_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "cm_stride" ) )) # UInt64  |-> cm_stride)
  **  ((( &( "observed" ) )) # UInt64  |-> observed)
|--
  “ (outputs_related (completed_values (A) (W) ((kc_pre ÷ 4 )) (mr_pre) (nc_pre) (lo) (hi)) (completed_values (A) (W) ((kc_pre ÷ 4 )) (mr_pre) (nc_pre) (lo) (hi)) ) ”
).

Definition equivalent_partial_solve_wit_5_pure_split_goal_1 := 
forall (params_pre: Z) (right_pre: Z) (left_pre: Z) (w_pre: Z) (a_pre: Z) (kc_pre: Z) (nc_pre: Z) (mr_pre: Z) (hi: fp32) (lo: fp32) (W: (@list fp32)) (A: (@list fp32)) (cm_stride: Z) (observed: Z) (PreH1 : (observed <= UINT64_MAX)) (PreH2 : (cm_stride <= UINT64_MAX)) (PreH3 : (kc_pre <= UINT64_MAX)) (PreH4 : (nc_pre <= UINT64_MAX)) (PreH5 : (mr_pre <= UINT64_MAX)) (PreH6 : (observed >= 0)) (PreH7 : (cm_stride >= 0)) (PreH8 : (kc_pre >= 0)) (PreH9 : (nc_pre >= 0)) (PreH10 : (mr_pre >= 0)) (PreH11 : (1 <= mr_pre)) (PreH12 : (mr_pre <= 4)) (PreH13 : (0 < nc_pre)) (PreH14 : (1 <= mr_pre)) (PreH15 : (mr_pre <= 4)) (PreH16 : (0 < nc_pre)) (PreH17 : (1 <= mr_pre)) (PreH18 : (mr_pre <= 4)) (PreH19 : (0 < nc_pre)) (PreH20 : (4 <= kc_pre)) (PreH21 : (nc_pre <= 1152921504606846975)) (PreH22 : (cm_stride = (4 * nc_pre ))) (PreH23 : (observed = (mr_pre * nc_pre ))) (PreH24 : ((kc_pre % ( 4 ) ) = 0)) (PreH25 : (0 < kc_pre)) (PreH26 : (0 < observed)) (PreH27 : (observed <= 4611686018427387900)) (PreH28 : (a_pre <> 0)) (PreH29 : (w_pre <> 0)) (PreH30 : (left_pre <> 0)) (PreH31 : (right_pre <> 0)) (PreH32 : (params_pre <> 0)) (PreH33 : (machine_capacity a_pre w_pre left_pre params_pre kc_pre nc_pre )) (PreH34 : (machine_capacity a_pre w_pre right_pre params_pre kc_pre nc_pre )) ,
  ((( &( "mr" ) )) # UInt64  |-> mr_pre)
  **  ((( &( "nc" ) )) # UInt64  |-> nc_pre)
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  (FloatArray.full right_pre (mr_pre * nc_pre ) (completed_values (A) (W) ((kc_pre ÷ 4 )) (mr_pre) (nc_pre) (lo) (hi)) )
  **  (FloatArray.undef_seg right_pre (mr_pre * nc_pre ) (4 * nc_pre ) )
  **  (FloatArray.full a_pre (4 * (kc_pre ÷ 4 ) ) A )
  **  (FloatArray.full w_pre (((panel_count (nc_pre)) * 8 ) * ((kc_pre ÷ 4 ) + 1 ) ) W )
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min")) # Float  |-> lo)
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max")) # Float  |-> hi)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  (FloatArray.full left_pre (mr_pre * nc_pre ) (completed_values (A) (W) ((kc_pre ÷ 4 )) (mr_pre) (nc_pre) (lo) (hi)) )
  **  (FloatArray.undef_seg left_pre (mr_pre * nc_pre ) (4 * nc_pre ) )
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "w" ) )) # Ptr  |-> w_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "cm_stride" ) )) # UInt64  |-> cm_stride)
  **  ((( &( "observed" ) )) # UInt64  |-> observed)
|--
  “ (outputs_related (completed_values (A) (W) ((kc_pre ÷ 4 )) (mr_pre) (nc_pre) (lo) (hi)) (completed_values (A) (W) ((kc_pre ÷ 4 )) (mr_pre) (nc_pre) (lo) (hi)) ) ”
.

Definition equivalent_partial_solve_wit_5_aux := 
forall (params_pre: Z) (right_pre: Z) (left_pre: Z) (w_pre: Z) (a_pre: Z) (kc_pre: Z) (nc_pre: Z) (mr_pre: Z) (hi: fp32) (lo: fp32) (W: (@list fp32)) (A: (@list fp32)) (cm_stride: Z) (observed: Z) (PreH1 : (1 <= mr_pre)) (PreH2 : (mr_pre <= 4)) (PreH3 : (0 < nc_pre)) (PreH4 : (1 <= mr_pre)) (PreH5 : (mr_pre <= 4)) (PreH6 : (0 < nc_pre)) (PreH7 : (1 <= mr_pre)) (PreH8 : (mr_pre <= 4)) (PreH9 : (0 < nc_pre)) (PreH10 : (4 <= kc_pre)) (PreH11 : (nc_pre <= 1152921504606846975)) (PreH12 : (cm_stride = (4 * nc_pre ))) (PreH13 : (observed = (mr_pre * nc_pre ))) (PreH14 : ((kc_pre % ( 4 ) ) = 0)) (PreH15 : (0 < kc_pre)) (PreH16 : (0 < observed)) (PreH17 : (observed <= 4611686018427387900)) (PreH18 : (a_pre <> 0)) (PreH19 : (w_pre <> 0)) (PreH20 : (left_pre <> 0)) (PreH21 : (right_pre <> 0)) (PreH22 : (params_pre <> 0)) (PreH23 : (machine_capacity a_pre w_pre left_pre params_pre kc_pre nc_pre )) (PreH24 : (machine_capacity a_pre w_pre right_pre params_pre kc_pre nc_pre )) ,
  (FloatArray.full right_pre (mr_pre * nc_pre ) (completed_values (A) (W) ((kc_pre ÷ 4 )) (mr_pre) (nc_pre) (lo) (hi)) )
  **  (FloatArray.undef_seg right_pre (mr_pre * nc_pre ) (4 * nc_pre ) )
  **  (FloatArray.full a_pre (4 * (kc_pre ÷ 4 ) ) A )
  **  (FloatArray.full w_pre (((panel_count (nc_pre)) * 8 ) * ((kc_pre ÷ 4 ) + 1 ) ) W )
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min")) # Float  |-> lo)
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max")) # Float  |-> hi)
  **  (FloatArray.full left_pre (mr_pre * nc_pre ) (completed_values (A) (W) ((kc_pre ÷ 4 )) (mr_pre) (nc_pre) (lo) (hi)) )
  **  (FloatArray.undef_seg left_pre (mr_pre * nc_pre ) (4 * nc_pre ) )
|--
  “ (0 < observed) ” 
  &&  “ (observed <= 4611686018427387900) ” 
  &&  “ (outputs_related (completed_values (A) (W) ((kc_pre ÷ 4 )) (mr_pre) (nc_pre) (lo) (hi)) (completed_values (A) (W) ((kc_pre ÷ 4 )) (mr_pre) (nc_pre) (lo) (hi)) ) ” 
  &&  “ (1 <= mr_pre) ” 
  &&  “ (mr_pre <= 4) ” 
  &&  “ (0 < nc_pre) ” 
  &&  “ (1 <= mr_pre) ” 
  &&  “ (mr_pre <= 4) ” 
  &&  “ (0 < nc_pre) ” 
  &&  “ (1 <= mr_pre) ” 
  &&  “ (mr_pre <= 4) ” 
  &&  “ (0 < nc_pre) ” 
  &&  “ (4 <= kc_pre) ” 
  &&  “ (nc_pre <= 1152921504606846975) ” 
  &&  “ (cm_stride = (4 * nc_pre )) ” 
  &&  “ (observed = (mr_pre * nc_pre )) ” 
  &&  “ ((kc_pre % ( 4 ) ) = 0) ” 
  &&  “ (0 < kc_pre) ” 
  &&  “ (0 < observed) ” 
  &&  “ (observed <= 4611686018427387900) ” 
  &&  “ (a_pre <> 0) ” 
  &&  “ (w_pre <> 0) ” 
  &&  “ (left_pre <> 0) ” 
  &&  “ (right_pre <> 0) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (machine_capacity a_pre w_pre left_pre params_pre kc_pre nc_pre ) ” 
  &&  “ (machine_capacity a_pre w_pre right_pre params_pre kc_pre nc_pre ) ”
  &&  (FloatArray.full left_pre observed (completed_values (A) (W) ((kc_pre ÷ 4 )) (mr_pre) (nc_pre) (lo) (hi)) )
  **  (FloatArray.full right_pre observed (completed_values (A) (W) ((kc_pre ÷ 4 )) (mr_pre) (nc_pre) (lo) (hi)) )
  **  (FloatArray.undef_seg right_pre (mr_pre * nc_pre ) (4 * nc_pre ) )
  **  (FloatArray.full a_pre (4 * (kc_pre ÷ 4 ) ) A )
  **  (FloatArray.full w_pre (((panel_count (nc_pre)) * 8 ) * ((kc_pre ÷ 4 ) + 1 ) ) W )
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min")) # Float  |-> lo)
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max")) # Float  |-> hi)
  **  (FloatArray.undef_seg left_pre (mr_pre * nc_pre ) (4 * nc_pre ) )
.

Definition equivalent_partial_solve_wit_5 := equivalent_partial_solve_wit_5_pure -> equivalent_partial_solve_wit_5_aux.

Definition equivalent_which_implies_wit_1 := 
(
forall (hi: fp32) (lo: fp32) (W: (@list fp32)) (A: (@list fp32)) (mr: Z) (nc: Z) (kc: Z) (left: Z) (PreH1 : (1 <= mr)) (PreH2 : (mr <= 4)) (PreH3 : (0 < nc)) ,
  (output_state left mr nc (kc ÷ 4 ) nc A W lo hi )
|--
  “ (1 <= mr) ” 
  &&  “ (mr <= 4) ” 
  &&  “ (0 < nc) ”
  &&  (FloatArray.full left (mr * nc ) (completed_values (A) (W) ((kc ÷ 4 )) (mr) (nc) (lo) (hi)) )
  **  (FloatArray.undef_seg left (mr * nc ) (4 * nc ) )
) \/
(
forall (hi: fp32) (lo: fp32) (W: (@list fp32)) (A: (@list fp32)) (mr: Z) (nc: Z) (kc: Z) (left: Z) (PreH1 : (1 <= mr)) (PreH2 : (mr <= 4)) (PreH3 : (0 < nc)) ,
  (output_state left mr nc (kc ÷ 4 ) nc A W lo hi )
|--
  (FloatArray.full left (mr * nc ) (completed_values (A) (W) ((kc ÷ 4 )) (mr) (nc) (lo) (hi)) )
  **  (FloatArray.undef_seg left (mr * nc ) (4 * nc ) )
).

Definition equivalent_which_implies_wit_1_split_goal_spatial := 
forall (hi: fp32) (lo: fp32) (W: (@list fp32)) (A: (@list fp32)) (mr: Z) (nc: Z) (kc: Z) (left: Z) (PreH1 : (1 <= mr)) (PreH2 : (mr <= 4)) (PreH3 : (0 < nc)) ,
  (output_state left mr nc (kc ÷ 4 ) nc A W lo hi )
|--
  (FloatArray.full left (mr * nc ) (completed_values (A) (W) ((kc ÷ 4 )) (mr) (nc) (lo) (hi)) )
  **  (FloatArray.undef_seg left (mr * nc ) (4 * nc ) )
.

Definition equivalent_which_implies_wit_2 := 
(
forall (hi: fp32) (lo: fp32) (W: (@list fp32)) (A: (@list fp32)) (mr: Z) (nc: Z) (kc: Z) (right: Z) (PreH1 : (1 <= mr)) (PreH2 : (mr <= 4)) (PreH3 : (0 < nc)) ,
  (output_state right mr nc (kc ÷ 4 ) nc A W lo hi )
|--
  “ (1 <= mr) ” 
  &&  “ (mr <= 4) ” 
  &&  “ (0 < nc) ”
  &&  (FloatArray.full right (mr * nc ) (completed_values (A) (W) ((kc ÷ 4 )) (mr) (nc) (lo) (hi)) )
  **  (FloatArray.undef_seg right (mr * nc ) (4 * nc ) )
) \/
(
forall (hi: fp32) (lo: fp32) (W: (@list fp32)) (A: (@list fp32)) (mr: Z) (nc: Z) (kc: Z) (right: Z) (PreH1 : (1 <= mr)) (PreH2 : (mr <= 4)) (PreH3 : (0 < nc)) ,
  (output_state right mr nc (kc ÷ 4 ) nc A W lo hi )
|--
  (FloatArray.full right (mr * nc ) (completed_values (A) (W) ((kc ÷ 4 )) (mr) (nc) (lo) (hi)) )
  **  (FloatArray.undef_seg right (mr * nc ) (4 * nc ) )
).

Definition equivalent_which_implies_wit_2_split_goal_spatial := 
forall (hi: fp32) (lo: fp32) (W: (@list fp32)) (A: (@list fp32)) (mr: Z) (nc: Z) (kc: Z) (right: Z) (PreH1 : (1 <= mr)) (PreH2 : (mr <= 4)) (PreH3 : (0 < nc)) ,
  (output_state right mr nc (kc ÷ 4 ) nc A W lo hi )
|--
  (FloatArray.full right (mr * nc ) (completed_values (A) (W) ((kc ÷ 4 )) (mr) (nc) (lo) (hi)) )
  **  (FloatArray.undef_seg right (mr * nc ) (4 * nc ) )
.

Module Type VC_Correct.

Include comparator_Strategy_Correct.

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
Axiom proof_of_equivalent_safety_wit_1 : equivalent_safety_wit_1.
Axiom proof_of_equivalent_safety_wit_2 : equivalent_safety_wit_2.
Axiom proof_of_equivalent_entail_wit_1 : equivalent_entail_wit_1.
Axiom proof_of_equivalent_return_wit_1 : equivalent_return_wit_1.
Axiom proof_of_equivalent_partial_solve_wit_1_pure : equivalent_partial_solve_wit_1_pure.
Axiom proof_of_equivalent_partial_solve_wit_1 : equivalent_partial_solve_wit_1.
Axiom proof_of_equivalent_partial_solve_wit_2_pure : equivalent_partial_solve_wit_2_pure.
Axiom proof_of_equivalent_partial_solve_wit_2 : equivalent_partial_solve_wit_2.
Axiom proof_of_equivalent_partial_solve_wit_3_pure : equivalent_partial_solve_wit_3_pure.
Axiom proof_of_equivalent_partial_solve_wit_3 : equivalent_partial_solve_wit_3.
Axiom proof_of_equivalent_partial_solve_wit_4_pure : equivalent_partial_solve_wit_4_pure.
Axiom proof_of_equivalent_partial_solve_wit_4 : equivalent_partial_solve_wit_4.
Axiom proof_of_equivalent_partial_solve_wit_5_pure : equivalent_partial_solve_wit_5_pure.
Axiom proof_of_equivalent_partial_solve_wit_5 : equivalent_partial_solve_wit_5.
Axiom proof_of_equivalent_which_implies_wit_1 : equivalent_which_implies_wit_1.
Axiom proof_of_equivalent_which_implies_wit_2 : equivalent_which_implies_wit_2.

End VC_Correct.
