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
Require Import GemmSpec.FmaModel GemmSpec.IntrinsicModel
 Qd8Phase.IntegerFold Qd8Cast.CastModel.
Require Import Qd8Public.CandidateLogic.
Require Import Qd8IGemm.IGemmModel.
Require Import Qd8Indirect.IndirectionModel.
Require Import Qd8API.ApiModel Qd8API.Layouts.
Require Import Qd8CallerModel.CallerModel.
Local Open Scope sac.

(*----- Function qd8_preserve_float -----*)

Definition qd8_preserve_float_return_wit_1 := 
(
forall (x_pre: fp32) ,
  TT && emp 
|--
  “ (qd8_bit_same x_pre x_pre ) ”
  &&  emp
) \/
(
forall (x_pre: fp32) ,
  TT && emp 
|--
  “ (qd8_bit_same x_pre x_pre ) ”
  &&  emp
).

Definition qd8_preserve_float_return_wit_1_split_goal_1 := 
forall (x_pre: fp32) ,
  (qd8_bit_same x_pre x_pre )
.

(*----- Function qd8_same_lane -----*)

Definition qd8_same_lane_safety_wit_1 := 
forall (y_pre: fp32) (x_pre: fp32) (retval: fp32) (retval_2: fp32) (PreH1 : (fp32_eq x_pre y_pre )) (PreH2 : (qd8_bit_same retval_2 y_pre )) (PreH3 : (qd8_bit_same retval x_pre )) (PreH4 : (qd8_same_value x_pre y_pre )) ,
  ((( &( "yc" ) )) # Float  |-> retval_2)
  **  ((( &( "xc" ) )) # Float  |-> retval)
  **  ((( &( "x" ) )) # Float  |-> x_pre)
  **  ((( &( "y" ) )) # Float  |-> y_pre)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition qd8_same_lane_safety_wit_2 := 
forall (y_pre: fp32) (x_pre: fp32) (retval: fp32) (retval_2: fp32) (PreH1 : (fp32_ne y_pre retval_2 )) (PreH2 : (fp32_ne x_pre retval )) (PreH3 : (fp32_ne x_pre y_pre )) (PreH4 : (qd8_bit_same retval_2 y_pre )) (PreH5 : (qd8_bit_same retval x_pre )) (PreH6 : (qd8_same_value x_pre y_pre )) ,
  ((( &( "yc" ) )) # Float  |-> retval_2)
  **  ((( &( "xc" ) )) # Float  |-> retval)
  **  ((( &( "x" ) )) # Float  |-> x_pre)
  **  ((( &( "y" ) )) # Float  |-> y_pre)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition qd8_same_lane_safety_wit_3 := 
forall (y_pre: fp32) (x_pre: fp32) (retval: fp32) (retval_2: fp32) (PreH1 : (fp32_eq x_pre retval )) (PreH2 : (fp32_ne x_pre y_pre )) (PreH3 : (qd8_bit_same retval_2 y_pre )) (PreH4 : (qd8_bit_same retval x_pre )) (PreH5 : (qd8_same_value x_pre y_pre )) ,
  ((( &( "yc" ) )) # Float  |-> retval_2)
  **  ((( &( "xc" ) )) # Float  |-> retval)
  **  ((( &( "x" ) )) # Float  |-> x_pre)
  **  ((( &( "y" ) )) # Float  |-> y_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qd8_same_lane_safety_wit_4 := 
forall (y_pre: fp32) (x_pre: fp32) (retval: fp32) (retval_2: fp32) (PreH1 : (fp32_eq y_pre retval_2 )) (PreH2 : (fp32_ne x_pre retval )) (PreH3 : (fp32_ne x_pre y_pre )) (PreH4 : (qd8_bit_same retval_2 y_pre )) (PreH5 : (qd8_bit_same retval x_pre )) (PreH6 : (qd8_same_value x_pre y_pre )) ,
  ((( &( "yc" ) )) # Float  |-> retval_2)
  **  ((( &( "xc" ) )) # Float  |-> retval)
  **  ((( &( "x" ) )) # Float  |-> x_pre)
  **  ((( &( "y" ) )) # Float  |-> y_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qd8_same_lane_return_wit_1 := 
(
forall (y_pre: fp32) (x_pre: fp32) (retval: fp32) (retval_2: fp32) (PreH1 : (fp32_eq x_pre retval )) (PreH2 : (fp32_ne x_pre y_pre )) (PreH3 : (qd8_bit_same retval_2 y_pre )) (PreH4 : (qd8_bit_same retval x_pre )) (PreH5 : (qd8_same_value x_pre y_pre )) ,
  TT && emp 
|--
  “ (qd8_ret_one 0 ) ”
  &&  emp
) \/
(
forall (y_pre: fp32) (x_pre: fp32) (retval: fp32) (retval_2: fp32) (PreH1 : (fp32_eq x_pre retval )) (PreH2 : (fp32_ne x_pre y_pre )) (PreH3 : (qd8_bit_same retval_2 y_pre )) (PreH4 : (qd8_bit_same retval x_pre )) (PreH5 : (qd8_same_value x_pre y_pre )) ,
  TT && emp 
|--
  “ (qd8_ret_one 0 ) ”
  &&  emp
).

Definition qd8_same_lane_return_wit_1_split_goal_1 := 
forall (y_pre: fp32) (x_pre: fp32) (retval: fp32) (retval_2: fp32) (PreH1 : (fp32_eq x_pre retval )) (PreH2 : (fp32_ne x_pre y_pre )) (PreH3 : (qd8_bit_same retval_2 y_pre )) (PreH4 : (qd8_bit_same retval x_pre )) (PreH5 : (qd8_same_value x_pre y_pre )) ,
  (qd8_ret_one 0 )
.

Definition qd8_same_lane_return_wit_2 := 
(
forall (y_pre: fp32) (x_pre: fp32) (retval: fp32) (retval_2: fp32) (PreH1 : (fp32_eq y_pre retval_2 )) (PreH2 : (fp32_ne x_pre retval )) (PreH3 : (fp32_ne x_pre y_pre )) (PreH4 : (qd8_bit_same retval_2 y_pre )) (PreH5 : (qd8_bit_same retval x_pre )) (PreH6 : (qd8_same_value x_pre y_pre )) ,
  TT && emp 
|--
  “ (qd8_ret_one 0 ) ”
  &&  emp
) \/
(
forall (y_pre: fp32) (x_pre: fp32) (retval: fp32) (retval_2: fp32) (PreH1 : (fp32_eq y_pre retval_2 )) (PreH2 : (fp32_ne x_pre retval )) (PreH3 : (fp32_ne x_pre y_pre )) (PreH4 : (qd8_bit_same retval_2 y_pre )) (PreH5 : (qd8_bit_same retval x_pre )) (PreH6 : (qd8_same_value x_pre y_pre )) ,
  TT && emp 
|--
  “ (qd8_ret_one 0 ) ”
  &&  emp
).

Definition qd8_same_lane_return_wit_2_split_goal_1 := 
forall (y_pre: fp32) (x_pre: fp32) (retval: fp32) (retval_2: fp32) (PreH1 : (fp32_eq y_pre retval_2 )) (PreH2 : (fp32_ne x_pre retval )) (PreH3 : (fp32_ne x_pre y_pre )) (PreH4 : (qd8_bit_same retval_2 y_pre )) (PreH5 : (qd8_bit_same retval x_pre )) (PreH6 : (qd8_same_value x_pre y_pre )) ,
  (qd8_ret_one 0 )
.

Definition qd8_same_lane_return_wit_3 := 
(
forall (y_pre: fp32) (x_pre: fp32) (retval: fp32) (retval_2: fp32) (PreH1 : (fp32_ne y_pre retval_2 )) (PreH2 : (fp32_ne x_pre retval )) (PreH3 : (fp32_ne x_pre y_pre )) (PreH4 : (qd8_bit_same retval_2 y_pre )) (PreH5 : (qd8_bit_same retval x_pre )) (PreH6 : (qd8_same_value x_pre y_pre )) ,
  TT && emp 
|--
  “ (qd8_ret_one 1 ) ”
  &&  emp
) \/
(
forall (y_pre: fp32) (x_pre: fp32) (retval: fp32) (retval_2: fp32) (PreH1 : (fp32_ne y_pre retval_2 )) (PreH2 : (fp32_ne x_pre retval )) (PreH3 : (fp32_ne x_pre y_pre )) (PreH4 : (qd8_bit_same retval_2 y_pre )) (PreH5 : (qd8_bit_same retval x_pre )) (PreH6 : (qd8_same_value x_pre y_pre )) ,
  TT && emp 
|--
  “ (qd8_ret_one 1 ) ”
  &&  emp
).

Definition qd8_same_lane_return_wit_3_split_goal_1 := 
forall (y_pre: fp32) (x_pre: fp32) (retval: fp32) (retval_2: fp32) (PreH1 : (fp32_ne y_pre retval_2 )) (PreH2 : (fp32_ne x_pre retval )) (PreH3 : (fp32_ne x_pre y_pre )) (PreH4 : (qd8_bit_same retval_2 y_pre )) (PreH5 : (qd8_bit_same retval x_pre )) (PreH6 : (qd8_same_value x_pre y_pre )) ,
  (qd8_ret_one 1 )
.

Definition qd8_same_lane_return_wit_4 := 
(
forall (y_pre: fp32) (x_pre: fp32) (retval: fp32) (retval_2: fp32) (PreH1 : (fp32_eq x_pre y_pre )) (PreH2 : (qd8_bit_same retval_2 y_pre )) (PreH3 : (qd8_bit_same retval x_pre )) (PreH4 : (qd8_same_value x_pre y_pre )) ,
  TT && emp 
|--
  “ (qd8_ret_one 1 ) ”
  &&  emp
) \/
(
forall (y_pre: fp32) (x_pre: fp32) (retval: fp32) (retval_2: fp32) (PreH1 : (fp32_eq x_pre y_pre )) (PreH2 : (qd8_bit_same retval_2 y_pre )) (PreH3 : (qd8_bit_same retval x_pre )) (PreH4 : (qd8_same_value x_pre y_pre )) ,
  TT && emp 
|--
  “ (qd8_ret_one 1 ) ”
  &&  emp
).

Definition qd8_same_lane_return_wit_4_split_goal_1 := 
forall (y_pre: fp32) (x_pre: fp32) (retval: fp32) (retval_2: fp32) (PreH1 : (fp32_eq x_pre y_pre )) (PreH2 : (qd8_bit_same retval_2 y_pre )) (PreH3 : (qd8_bit_same retval x_pre )) (PreH4 : (qd8_same_value x_pre y_pre )) ,
  (qd8_ret_one 1 )
.

Definition qd8_same_lane_partial_solve_wit_1 := 
forall (y_pre: fp32) (x_pre: fp32) (PreH1 : (qd8_same_value x_pre y_pre )) ,
  TT && emp 
|--
  “ (qd8_same_value x_pre y_pre ) ”
  &&  emp
.

Definition qd8_same_lane_partial_solve_wit_2 := 
forall (y_pre: fp32) (x_pre: fp32) (retval: fp32) (PreH1 : (qd8_bit_same retval x_pre )) (PreH2 : (qd8_same_value x_pre y_pre )) ,
  TT && emp 
|--
  “ (qd8_bit_same retval x_pre ) ” 
  &&  “ (qd8_same_value x_pre y_pre ) ”
  &&  emp
.

(*----- Function qd8_compare_outputs -----*)

Definition qd8_compare_outputs_safety_wit_1 := 
forall (right_pre: Z) (left_pre: Z) (n_pre: Z) (R: (@list fp32)) (L: (@list fp32)) (PreH1 : (0 < n_pre)) (PreH2 : (n_pre <= 4611686018427387903)) (PreH3 : (qd8_outputs_related L R )) ,
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

Definition qd8_compare_outputs_safety_wit_2 := 
forall (right_pre: Z) (left_pre: Z) (n_pre: Z) (R: (@list fp32)) (L: (@list fp32)) (i: Z) (retval: Z)  __default_fp32 (PreH1 : (retval = 0)) (PreH2 : (qd8_ret_one retval )) (PreH3 : (0 <= i)) (PreH4 : (i < n_pre)) (PreH5 : (qd8_same_value (Znth i L __default_fp32) (Znth i R __default_fp32) )) (PreH6 : (0 <= i)) (PreH7 : (i < n_pre)) (PreH8 : (i < n_pre)) (PreH9 : (0 < n_pre)) (PreH10 : (n_pre <= 4611686018427387903)) (PreH11 : (0 <= i)) (PreH12 : (i <= n_pre)) (PreH13 : ((Zlength (L)) = n_pre)) (PreH14 : (qd8_outputs_related L R )) (PreH15 : (0 < n_pre)) (PreH16 : (n_pre <= 4611686018427387903)) (PreH17 : (qd8_outputs_related L R )) ,
  ((( &( "i" ) )) # UInt64  |-> i)
  **  ((( &( "n" ) )) # UInt64  |-> n_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  (FloatArray.full left_pre n_pre L )
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  (FloatArray.full right_pre n_pre R )
  **  ((( &( "y" ) )) # Float  |-> (Znth i R __default_fp32))
  **  ((( &( "x" ) )) # Float  |-> (Znth i L __default_fp32))
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qd8_compare_outputs_safety_wit_3 := 
forall (right_pre: Z) (left_pre: Z) (n_pre: Z) (R: (@list fp32)) (L: (@list fp32)) (i: Z) (PreH1 : (i >= n_pre)) (PreH2 : (0 < n_pre)) (PreH3 : (n_pre <= 4611686018427387903)) (PreH4 : (0 <= i)) (PreH5 : (i <= n_pre)) (PreH6 : ((Zlength (L)) = n_pre)) (PreH7 : (qd8_outputs_related L R )) (PreH8 : (0 < n_pre)) (PreH9 : (n_pre <= 4611686018427387903)) (PreH10 : (qd8_outputs_related L R )) ,
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

Definition qd8_compare_outputs_entail_wit_1 := 
(
forall (right_pre: Z) (left_pre: Z) (n_pre: Z) (R: (@list fp32)) (L: (@list fp32)) (PreH1 : (0 < n_pre)) (PreH2 : (n_pre <= 4611686018427387903)) (PreH3 : (qd8_outputs_related L R )) ,
  (FloatArray.full left_pre n_pre L )
  **  (FloatArray.full right_pre n_pre R )
|--
  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 4611686018427387903) ” 
  &&  “ (0 <= 0) ” 
  &&  “ (0 <= n_pre) ” 
  &&  “ ((Zlength (L)) = n_pre) ” 
  &&  “ (qd8_outputs_related L R ) ” 
  &&  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 4611686018427387903) ” 
  &&  “ (qd8_outputs_related L R ) ”
  &&  (FloatArray.full left_pre n_pre L )
  **  (FloatArray.full right_pre n_pre R )
) \/
(
forall (n_pre: Z) (R: (@list fp32)) (L: (@list fp32)) (PreH1 : (0 < n_pre)) (PreH2 : (n_pre <= 4611686018427387903)) (PreH3 : (qd8_outputs_related L R )) ,
  TT && emp 
|--
  “ ((Zlength (L)) = n_pre) ”
  &&  emp
).

Definition qd8_compare_outputs_entail_wit_1_split_goal_1 := 
forall (n_pre: Z) (R: (@list fp32)) (L: (@list fp32)) (PreH1 : (0 < n_pre)) (PreH2 : (n_pre <= 4611686018427387903)) (PreH3 : (qd8_outputs_related L R )) ,
  ((Zlength (L)) = n_pre)
.

Definition qd8_compare_outputs_entail_wit_2 := 
forall (right_pre: Z) (left_pre: Z) (n_pre: Z) (R: (@list fp32)) (L: (@list fp32)) (i: Z) (retval: Z)  __default_fp32 (PreH1 : (retval <> 0)) (PreH2 : (qd8_ret_one retval )) (PreH3 : (0 <= i)) (PreH4 : (i < n_pre)) (PreH5 : (qd8_same_value (Znth i L __default_fp32) (Znth i R __default_fp32) )) (PreH6 : (0 <= i)) (PreH7 : (i < n_pre)) (PreH8 : (i < n_pre)) (PreH9 : (0 < n_pre)) (PreH10 : (n_pre <= 4611686018427387903)) (PreH11 : (0 <= i)) (PreH12 : (i <= n_pre)) (PreH13 : ((Zlength (L)) = n_pre)) (PreH14 : (qd8_outputs_related L R )) (PreH15 : (0 < n_pre)) (PreH16 : (n_pre <= 4611686018427387903)) (PreH17 : (qd8_outputs_related L R )) ,
  (FloatArray.full left_pre n_pre L )
  **  (FloatArray.full right_pre n_pre R )
|--
  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 4611686018427387903) ” 
  &&  “ (0 <= (i + 1 )) ” 
  &&  “ ((i + 1 ) <= n_pre) ” 
  &&  “ ((Zlength (L)) = n_pre) ” 
  &&  “ (qd8_outputs_related L R ) ” 
  &&  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 4611686018427387903) ” 
  &&  “ (qd8_outputs_related L R ) ”
  &&  (FloatArray.full left_pre n_pre L )
  **  (FloatArray.full right_pre n_pre R )
.

Definition qd8_compare_outputs_return_wit_1 := 
(
forall (right_pre: Z) (left_pre: Z) (n_pre: Z) (R: (@list fp32)) (L: (@list fp32)) (i: Z) (PreH1 : (i >= n_pre)) (PreH2 : (0 < n_pre)) (PreH3 : (n_pre <= 4611686018427387903)) (PreH4 : (0 <= i)) (PreH5 : (i <= n_pre)) (PreH6 : ((Zlength (L)) = n_pre)) (PreH7 : (qd8_outputs_related L R )) (PreH8 : (0 < n_pre)) (PreH9 : (n_pre <= 4611686018427387903)) (PreH10 : (qd8_outputs_related L R )) ,
  (FloatArray.full left_pre n_pre L )
  **  (FloatArray.full right_pre n_pre R )
|--
  “ (qd8_ret_one 1 ) ”
  &&  (FloatArray.full left_pre n_pre L )
  **  (FloatArray.full right_pre n_pre R )
) \/
(
forall (n_pre: Z) (R: (@list fp32)) (L: (@list fp32)) (i: Z) (PreH1 : (i >= n_pre)) (PreH2 : (0 < n_pre)) (PreH3 : (n_pre <= 4611686018427387903)) (PreH4 : (0 <= i)) (PreH5 : (i <= n_pre)) (PreH6 : ((Zlength (L)) = n_pre)) (PreH7 : (qd8_outputs_related L R )) (PreH8 : (0 < n_pre)) (PreH9 : (n_pre <= 4611686018427387903)) (PreH10 : (qd8_outputs_related L R )) ,
  TT && emp 
|--
  “ (qd8_ret_one 1 ) ”
  &&  emp
).

Definition qd8_compare_outputs_return_wit_1_split_goal_1 := 
forall (n_pre: Z) (R: (@list fp32)) (L: (@list fp32)) (i: Z) (PreH1 : (i >= n_pre)) (PreH2 : (0 < n_pre)) (PreH3 : (n_pre <= 4611686018427387903)) (PreH4 : (0 <= i)) (PreH5 : (i <= n_pre)) (PreH6 : ((Zlength (L)) = n_pre)) (PreH7 : (qd8_outputs_related L R )) (PreH8 : (0 < n_pre)) (PreH9 : (n_pre <= 4611686018427387903)) (PreH10 : (qd8_outputs_related L R )) ,
  (qd8_ret_one 1 )
.

Definition qd8_compare_outputs_return_wit_2 := 
forall (right_pre: Z) (left_pre: Z) (n_pre: Z) (R: (@list fp32)) (L: (@list fp32)) (i: Z) (retval: Z)  __default_fp32 (PreH1 : (retval = 0)) (PreH2 : (qd8_ret_one retval )) (PreH3 : (0 <= i)) (PreH4 : (i < n_pre)) (PreH5 : (qd8_same_value (Znth i L __default_fp32) (Znth i R __default_fp32) )) (PreH6 : (0 <= i)) (PreH7 : (i < n_pre)) (PreH8 : (i < n_pre)) (PreH9 : (0 < n_pre)) (PreH10 : (n_pre <= 4611686018427387903)) (PreH11 : (0 <= i)) (PreH12 : (i <= n_pre)) (PreH13 : ((Zlength (L)) = n_pre)) (PreH14 : (qd8_outputs_related L R )) (PreH15 : (0 < n_pre)) (PreH16 : (n_pre <= 4611686018427387903)) (PreH17 : (qd8_outputs_related L R )) ,
  (FloatArray.full left_pre n_pre L )
  **  (FloatArray.full right_pre n_pre R )
|--
  “ (qd8_ret_one 0 ) ”
  &&  (FloatArray.full left_pre n_pre L )
  **  (FloatArray.full right_pre n_pre R )
.

Definition qd8_compare_outputs_partial_solve_wit_1_pure := 
forall (right_pre: Z) (left_pre: Z) (n_pre: Z) (R: (@list fp32)) (L: (@list fp32)) (i: Z) (PreH1 : (i < n_pre)) (PreH2 : (0 < n_pre)) (PreH3 : (n_pre <= 4611686018427387903)) (PreH4 : (0 <= i)) (PreH5 : (i <= n_pre)) (PreH6 : ((Zlength (L)) = n_pre)) (PreH7 : (qd8_outputs_related L R )) (PreH8 : (0 < n_pre)) (PreH9 : (n_pre <= 4611686018427387903)) (PreH10 : (qd8_outputs_related L R )) ,
  ((( &( "n" ) )) # UInt64  |-> n_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i)
  **  (FloatArray.full left_pre n_pre L )
  **  (FloatArray.full right_pre n_pre R )
|--
  “ (0 <= i) ” 
  &&  “ (i < n_pre) ” 
  &&  “ (qd8_outputs_related L R ) ”
.

Definition qd8_compare_outputs_partial_solve_wit_1_aux := 
forall (right_pre: Z) (left_pre: Z) (n_pre: Z) (R: (@list fp32)) (L: (@list fp32)) (i: Z) (PreH1 : (i < n_pre)) (PreH2 : (0 < n_pre)) (PreH3 : (n_pre <= 4611686018427387903)) (PreH4 : (0 <= i)) (PreH5 : (i <= n_pre)) (PreH6 : ((Zlength (L)) = n_pre)) (PreH7 : (qd8_outputs_related L R )) (PreH8 : (0 < n_pre)) (PreH9 : (n_pre <= 4611686018427387903)) (PreH10 : (qd8_outputs_related L R )) ,
  (FloatArray.full left_pre n_pre L )
  **  (FloatArray.full right_pre n_pre R )
|--
  “ (0 <= i) ” 
  &&  “ (i < n_pre) ” 
  &&  “ (qd8_outputs_related L R ) ” 
  &&  “ (i < n_pre) ” 
  &&  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 4611686018427387903) ” 
  &&  “ (0 <= i) ” 
  &&  “ (i <= n_pre) ” 
  &&  “ ((Zlength (L)) = n_pre) ” 
  &&  “ (qd8_outputs_related L R ) ” 
  &&  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 4611686018427387903) ” 
  &&  “ (qd8_outputs_related L R ) ”
  &&  (FloatArray.full left_pre n_pre L )
  **  (FloatArray.full right_pre n_pre R )
.

Definition qd8_compare_outputs_partial_solve_wit_1 := qd8_compare_outputs_partial_solve_wit_1_pure -> qd8_compare_outputs_partial_solve_wit_1_aux.

Definition qd8_compare_outputs_partial_solve_wit_2_pure := 
forall (right_pre: Z) (left_pre: Z) (n_pre: Z) (R: (@list fp32)) (L: (@list fp32)) (i: Z)  __default_fp32 (PreH1 : (qd8_same_value (Znth i L __default_fp32) (Znth i R __default_fp32) )) (PreH2 : (0 <= i)) (PreH3 : (i < n_pre)) (PreH4 : (i < n_pre)) (PreH5 : (0 < n_pre)) (PreH6 : (n_pre <= 4611686018427387903)) (PreH7 : (0 <= i)) (PreH8 : (i <= n_pre)) (PreH9 : ((Zlength (L)) = n_pre)) (PreH10 : (qd8_outputs_related L R )) (PreH11 : (0 < n_pre)) (PreH12 : (n_pre <= 4611686018427387903)) (PreH13 : (qd8_outputs_related L R )) ,
  ((( &( "y" ) )) # Float  |-> (Znth i R __default_fp32))
  **  ((( &( "x" ) )) # Float  |-> (Znth i L __default_fp32))
  **  ((( &( "i" ) )) # UInt64  |-> i)
  **  ((( &( "n" ) )) # UInt64  |-> n_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  (FloatArray.missing_i left_pre i 0 n_pre L )
  **  (((left_pre + (i * sizeof(FLOAT)))) # Float  |-> (Znth i L __default_fp32))
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  (FloatArray.missing_i right_pre i 0 n_pre R )
  **  (((right_pre + (i * sizeof(FLOAT)))) # Float  |-> (Znth i R __default_fp32))
|--
  “ (0 <= i) ” 
  &&  “ (i < n_pre) ”
.

Definition qd8_compare_outputs_partial_solve_wit_2_aux := 
forall (right_pre: Z) (left_pre: Z) (n_pre: Z) (R: (@list fp32)) (L: (@list fp32)) (i: Z)  __default_fp32 (PreH1 : (qd8_same_value (Znth i L __default_fp32) (Znth i R __default_fp32) )) (PreH2 : (0 <= i)) (PreH3 : (i < n_pre)) (PreH4 : (i < n_pre)) (PreH5 : (0 < n_pre)) (PreH6 : (n_pre <= 4611686018427387903)) (PreH7 : (0 <= i)) (PreH8 : (i <= n_pre)) (PreH9 : ((Zlength (L)) = n_pre)) (PreH10 : (qd8_outputs_related L R )) (PreH11 : (0 < n_pre)) (PreH12 : (n_pre <= 4611686018427387903)) (PreH13 : (qd8_outputs_related L R )) ,
  (FloatArray.missing_i left_pre i 0 n_pre L )
  **  (((left_pre + (i * sizeof(FLOAT)))) # Float  |-> (Znth i L __default_fp32))
  **  (FloatArray.missing_i right_pre i 0 n_pre R )
  **  (((right_pre + (i * sizeof(FLOAT)))) # Float  |-> (Znth i R __default_fp32))
|--
  “ (0 <= i) ” 
  &&  “ (i < n_pre) ” 
  &&  “ (qd8_same_value (Znth i L __default_fp32) (Znth i R __default_fp32) ) ” 
  &&  “ (0 <= i) ” 
  &&  “ (i < n_pre) ” 
  &&  “ (i < n_pre) ” 
  &&  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 4611686018427387903) ” 
  &&  “ (0 <= i) ” 
  &&  “ (i <= n_pre) ” 
  &&  “ ((Zlength (L)) = n_pre) ” 
  &&  “ (qd8_outputs_related L R ) ” 
  &&  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 4611686018427387903) ” 
  &&  “ (qd8_outputs_related L R ) ”
  &&  (FloatArray.missing_i left_pre i 0 n_pre L )
  **  (((left_pre + (i * sizeof(FLOAT)))) # Float  |-> (Znth i L __default_fp32))
  **  (FloatArray.missing_i right_pre i 0 n_pre R )
  **  (((right_pre + (i * sizeof(FLOAT)))) # Float  |-> (Znth i R __default_fp32))
.

Definition qd8_compare_outputs_partial_solve_wit_2 := qd8_compare_outputs_partial_solve_wit_2_pure -> qd8_compare_outputs_partial_solve_wit_2_aux.

Definition qd8_compare_outputs_partial_solve_wit_3_pure := 
forall (right_pre: Z) (left_pre: Z) (n_pre: Z) (R: (@list fp32)) (L: (@list fp32)) (i: Z)  __default_fp32 (PreH1 : (0 <= i)) (PreH2 : (i < n_pre)) (PreH3 : (qd8_same_value (Znth i L __default_fp32) (Znth i R __default_fp32) )) (PreH4 : (0 <= i)) (PreH5 : (i < n_pre)) (PreH6 : (i < n_pre)) (PreH7 : (0 < n_pre)) (PreH8 : (n_pre <= 4611686018427387903)) (PreH9 : (0 <= i)) (PreH10 : (i <= n_pre)) (PreH11 : ((Zlength (L)) = n_pre)) (PreH12 : (qd8_outputs_related L R )) (PreH13 : (0 < n_pre)) (PreH14 : (n_pre <= 4611686018427387903)) (PreH15 : (qd8_outputs_related L R )) ,
  ((( &( "i" ) )) # UInt64  |-> i)
  **  ((( &( "n" ) )) # UInt64  |-> n_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  (FloatArray.full left_pre n_pre L )
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  (FloatArray.full right_pre n_pre R )
  **  ((( &( "y" ) )) # Float  |-> (Znth i R __default_fp32))
  **  ((( &( "x" ) )) # Float  |-> (Znth i L __default_fp32))
|--
  “ (qd8_same_value (Znth i L __default_fp32) (Znth i R __default_fp32) ) ”
.

Definition qd8_compare_outputs_partial_solve_wit_3_aux := 
forall (right_pre: Z) (left_pre: Z) (n_pre: Z) (R: (@list fp32)) (L: (@list fp32)) (i: Z)  __default_fp32 (PreH1 : (0 <= i)) (PreH2 : (i < n_pre)) (PreH3 : (qd8_same_value (Znth i L __default_fp32) (Znth i R __default_fp32) )) (PreH4 : (0 <= i)) (PreH5 : (i < n_pre)) (PreH6 : (i < n_pre)) (PreH7 : (0 < n_pre)) (PreH8 : (n_pre <= 4611686018427387903)) (PreH9 : (0 <= i)) (PreH10 : (i <= n_pre)) (PreH11 : ((Zlength (L)) = n_pre)) (PreH12 : (qd8_outputs_related L R )) (PreH13 : (0 < n_pre)) (PreH14 : (n_pre <= 4611686018427387903)) (PreH15 : (qd8_outputs_related L R )) ,
  (FloatArray.full left_pre n_pre L )
  **  (FloatArray.full right_pre n_pre R )
|--
  “ (qd8_same_value (Znth i L __default_fp32) (Znth i R __default_fp32) ) ” 
  &&  “ (0 <= i) ” 
  &&  “ (i < n_pre) ” 
  &&  “ (qd8_same_value (Znth i L __default_fp32) (Znth i R __default_fp32) ) ” 
  &&  “ (0 <= i) ” 
  &&  “ (i < n_pre) ” 
  &&  “ (i < n_pre) ” 
  &&  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 4611686018427387903) ” 
  &&  “ (0 <= i) ” 
  &&  “ (i <= n_pre) ” 
  &&  “ ((Zlength (L)) = n_pre) ” 
  &&  “ (qd8_outputs_related L R ) ” 
  &&  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 4611686018427387903) ” 
  &&  “ (qd8_outputs_related L R ) ”
  &&  (FloatArray.full left_pre n_pre L )
  **  (FloatArray.full right_pre n_pre R )
.

Definition qd8_compare_outputs_partial_solve_wit_3 := qd8_compare_outputs_partial_solve_wit_3_pure -> qd8_compare_outputs_partial_solve_wit_3_aux.

Definition qd8_compare_outputs_which_implies_wit_1 := 
(
forall (R: (@list fp32)) (L: (@list fp32)) (i: Z) (n: Z) (left: Z) (right: Z)  __default_fp32 (PreH1 : (0 <= i)) (PreH2 : (i < n)) (PreH3 : (qd8_outputs_related L R )) ,
  (FloatArray.full left n L )
  **  (FloatArray.full right n R )
|--
  “ (qd8_same_value (Znth i L __default_fp32) (Znth i R __default_fp32) ) ” 
  &&  “ (0 <= i) ” 
  &&  “ (i < n) ”
  &&  (FloatArray.missing_i left i 0 n L )
  **  (((left + (i * sizeof(FLOAT)))) # Float  |-> (Znth i L __default_fp32))
  **  (FloatArray.missing_i right i 0 n R )
  **  (((right + (i * sizeof(FLOAT)))) # Float  |-> (Znth i R __default_fp32))
) \/
(
forall (R: (@list fp32)) (L: (@list fp32)) (i: Z) (n: Z) (left: Z) (right: Z)  __default_fp32 (PreH1 : (0 <= i)) (PreH2 : (i < n)) (PreH3 : (qd8_outputs_related L R )) ,
  (FloatArray.full left n L )
  **  (FloatArray.full right n R )
|--
  “ (qd8_same_value (Znth i L __default_fp32) (Znth i R __default_fp32) ) ”
  &&  (FloatArray.missing_i left i 0 n L )
  **  (((left + (i * sizeof(FLOAT)))) # Float  |-> (Znth i L __default_fp32))
  **  (FloatArray.missing_i right i 0 n R )
  **  (((right + (i * sizeof(FLOAT)))) # Float  |-> (Znth i R __default_fp32))
).

Definition qd8_compare_outputs_which_implies_wit_1_split_goal_1 := 
forall (R: (@list fp32)) (L: (@list fp32)) (i: Z) (n: Z) (left: Z) (right: Z)  __default_fp32 (PreH1 : (0 <= i)) (PreH2 : (i < n)) (PreH3 : (qd8_outputs_related L R )) ,
  (FloatArray.full left n L )
  **  (FloatArray.full right n R )
|--
  “ (qd8_same_value (Znth i L __default_fp32) (Znth i R __default_fp32) ) ”
.

Definition qd8_compare_outputs_which_implies_wit_1_split_goal_spatial := 
forall (R: (@list fp32)) (L: (@list fp32)) (i: Z) (n: Z) (left: Z) (right: Z)  __default_fp32 (PreH1 : (0 <= i)) (PreH2 : (i < n)) (PreH3 : (qd8_outputs_related L R )) ,
  (FloatArray.full left n L )
  **  (FloatArray.full right n R )
|--
  (FloatArray.missing_i left i 0 n L )
  **  (((left + (i * sizeof(FLOAT)))) # Float  |-> (Znth i L __default_fp32))
  **  (FloatArray.missing_i right i 0 n R )
  **  (((right + (i * sizeof(FLOAT)))) # Float  |-> (Znth i R __default_fp32))
.

Definition qd8_compare_outputs_which_implies_wit_2 := 
(
forall (R: (@list fp32)) (L: (@list fp32)) (i: Z) (n: Z) (left: Z) (right: Z)  __default_fp32 (PreH1 : (0 <= i)) (PreH2 : (i < n)) ,
  (FloatArray.missing_i left i 0 n L )
  **  (((left + (i * sizeof(FLOAT)))) # Float  |-> (Znth i L __default_fp32))
  **  (FloatArray.missing_i right i 0 n R )
  **  (((right + (i * sizeof(FLOAT)))) # Float  |-> (Znth i R __default_fp32))
|--
  “ (0 <= i) ” 
  &&  “ (i < n) ”
  &&  (FloatArray.full left n L )
  **  (FloatArray.full right n R )
) \/
(
forall (R: (@list fp32)) (L: (@list fp32)) (i: Z) (n: Z) (left: Z) (right: Z)  __default_fp32 (PreH1 : (0 <= i)) (PreH2 : (i < n)) ,
  (FloatArray.missing_i left i 0 n L )
  **  (((left + (i * sizeof(FLOAT)))) # Float  |-> (Znth i L __default_fp32))
  **  (FloatArray.missing_i right i 0 n R )
  **  (((right + (i * sizeof(FLOAT)))) # Float  |-> (Znth i R __default_fp32))
|--
  (FloatArray.full left n L )
  **  (FloatArray.full right n R )
).

Definition qd8_compare_outputs_which_implies_wit_2_split_goal_spatial := 
forall (R: (@list fp32)) (L: (@list fp32)) (i: Z) (n: Z) (left: Z) (right: Z)  __default_fp32 (PreH1 : (0 <= i)) (PreH2 : (i < n)) ,
  (FloatArray.missing_i left i 0 n L )
  **  (((left + (i * sizeof(FLOAT)))) # Float  |-> (Znth i L __default_fp32))
  **  (FloatArray.missing_i right i 0 n R )
  **  (((right + (i * sizeof(FLOAT)))) # Float  |-> (Znth i R __default_fp32))
|--
  (FloatArray.full left n L )
  **  (FloatArray.full right n R )
.

(*----- Function equivalent -----*)

Definition equivalent_safety_wit_1 := 
forall (quantization_params_pre: Z) (params_pre: Z) (zero_data_pre: Z) (zero_pre: Z) (a_offset_pre: Z) (right_pre: Z) (left_pre: Z) (w_pre: Z) (a_pre: Z) (ks_pre: Z) (kc_pre: Z) (nc_pre: Z) (mr_pre: Z) (hi: fp32) (lo: fp32) (inv: fp32) (zp: Z) (Ps: (@list panel_data)) (Blocks: (@list input_block)) (Refs: (@list input_reference)) (Entries: (@list Z)) (PreH1 : (mr_pre = 1)) (PreH2 : (0 < nc_pre)) (PreH3 : (nc_pre <= 4611686018427387903)) (PreH4 : (0 < kc_pre)) (PreH5 : (0 < ks_pre)) (PreH6 : ((ks_pre % ( 8 ) ) = 0)) (PreH7 : (igemm_shape mr_pre nc_pre kc_pre ks_pre Entries Refs Blocks zero_pre zero_data_pre a_offset_pre Ps )) (PreH8 : (igemm_capacity nc_pre kc_pre a_pre w_pre left_pre Blocks Refs )) (PreH9 : (igemm_capacity nc_pre kc_pre a_pre w_pre right_pre Blocks Refs )) (PreH10 : (a_pre <> 0)) (PreH11 : (w_pre <> 0)) (PreH12 : (left_pre <> 0)) (PreH13 : (right_pre <> 0)) (PreH14 : (params_pre <> 0)) (PreH15 : (quantization_params_pre <> 0)) ,
  ((( &( "mr" ) )) # UInt64  |-> mr_pre)
  **  ((( &( "nc" ) )) # UInt64  |-> nc_pre)
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "ks" ) )) # UInt64  |-> ks_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "w" ) )) # Ptr  |-> w_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  ((( &( "a_offset" ) )) # UInt64  |-> a_offset_pre)
  **  ((( &( "zero" ) )) # Ptr  |-> zero_pre)
  **  ((( &( "zero_data" ) )) # Ptr  |-> zero_data_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "quantization_params" ) )) # Ptr  |-> quantization_params_pre)
  **  (PtrArray.full a_pre (ks_pre ÷ 8 ) Entries )
  **  (input_pool Blocks )
  **  (packed_matrix (total_depth (kc_pre) (Refs)) w_pre Ps )
  **  (FloatArray.undef_full left_pre nc_pre )
  **  (FloatArray.undef_full right_pre nc_pre )
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min")) # Float  |-> lo)
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max")) # Float  |-> hi)
  **  ((&((quantization_params_pre)  # "xnn_qd8_quantization_params" ->ₛ "zero_point")) # Int  |-> zp)
  **  ((&((quantization_params_pre)  # "xnn_qd8_quantization_params" ->ₛ "inv_scale")) # Float  |-> inv)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition equivalent_safety_wit_2 := 
forall (quantization_params_pre: Z) (params_pre: Z) (zero_data_pre: Z) (zero_pre: Z) (a_offset_pre: Z) (right_pre: Z) (left_pre: Z) (w_pre: Z) (a_pre: Z) (ks_pre: Z) (kc_pre: Z) (nc_pre: Z) (mr_pre: Z) (hi: fp32) (lo: fp32) (inv: fp32) (zp: Z) (Ps: (@list panel_data)) (Blocks: (@list input_block)) (Refs: (@list input_reference)) (Entries: (@list Z)) (PreH1 : (mr_pre = 1)) (PreH2 : (0 < nc_pre)) (PreH3 : (nc_pre <= 4611686018427387903)) (PreH4 : (0 < kc_pre)) (PreH5 : (0 < ks_pre)) (PreH6 : ((ks_pre % ( 8 ) ) = 0)) (PreH7 : (igemm_shape mr_pre nc_pre kc_pre ks_pre Entries Refs Blocks zero_pre zero_data_pre a_offset_pre Ps )) (PreH8 : (igemm_capacity nc_pre kc_pre a_pre w_pre left_pre Blocks Refs )) (PreH9 : (igemm_capacity nc_pre kc_pre a_pre w_pre right_pre Blocks Refs )) (PreH10 : (a_pre <> 0)) (PreH11 : (w_pre <> 0)) (PreH12 : (left_pre <> 0)) (PreH13 : (right_pre <> 0)) (PreH14 : (params_pre <> 0)) (PreH15 : (quantization_params_pre <> 0)) ,
  ((( &( "mr" ) )) # UInt64  |-> mr_pre)
  **  ((( &( "nc" ) )) # UInt64  |-> nc_pre)
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "ks" ) )) # UInt64  |-> ks_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "w" ) )) # Ptr  |-> w_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  ((( &( "a_offset" ) )) # UInt64  |-> a_offset_pre)
  **  ((( &( "zero" ) )) # Ptr  |-> zero_pre)
  **  ((( &( "zero_data" ) )) # Ptr  |-> zero_data_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "quantization_params" ) )) # Ptr  |-> quantization_params_pre)
  **  (PtrArray.full a_pre (ks_pre ÷ 8 ) Entries )
  **  (input_pool Blocks )
  **  (packed_matrix (total_depth (kc_pre) (Refs)) w_pre Ps )
  **  (FloatArray.undef_full left_pre nc_pre )
  **  (FloatArray.undef_full right_pre nc_pre )
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min")) # Float  |-> lo)
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max")) # Float  |-> hi)
  **  ((&((quantization_params_pre)  # "xnn_qd8_quantization_params" ->ₛ "zero_point")) # Int  |-> zp)
  **  ((&((quantization_params_pre)  # "xnn_qd8_quantization_params" ->ₛ "inv_scale")) # Float  |-> inv)
|--
  “ (32 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 32) ”
.

Definition equivalent_safety_wit_3 := 
forall (quantization_params_pre: Z) (params_pre: Z) (zero_data_pre: Z) (zero_pre: Z) (a_offset_pre: Z) (right_pre: Z) (left_pre: Z) (w_pre: Z) (a_pre: Z) (ks_pre: Z) (kc_pre: Z) (nc_pre: Z) (mr_pre: Z) (hi: fp32) (lo: fp32) (inv: fp32) (zp: Z) (Ps: (@list panel_data)) (Blocks: (@list input_block)) (Refs: (@list input_reference)) (Entries: (@list Z)) (PreH1 : (mr_pre = 1)) (PreH2 : (0 < nc_pre)) (PreH3 : (nc_pre <= 4611686018427387903)) (PreH4 : (0 < kc_pre)) (PreH5 : (0 < ks_pre)) (PreH6 : ((ks_pre % ( 8 ) ) = 0)) (PreH7 : (igemm_shape mr_pre nc_pre kc_pre ks_pre Entries Refs Blocks zero_pre zero_data_pre a_offset_pre Ps )) (PreH8 : (igemm_capacity nc_pre kc_pre a_pre w_pre left_pre Blocks Refs )) (PreH9 : (igemm_capacity nc_pre kc_pre a_pre w_pre right_pre Blocks Refs )) (PreH10 : (a_pre <> 0)) (PreH11 : (w_pre <> 0)) (PreH12 : (left_pre <> 0)) (PreH13 : (right_pre <> 0)) (PreH14 : (params_pre <> 0)) (PreH15 : (quantization_params_pre <> 0)) ,
  (PtrArray.full a_pre (ks_pre ÷ 8 ) Entries )
  **  (input_pool Blocks )
  **  (packed_matrix (total_depth (kc_pre) (Refs)) w_pre Ps )
  **  (qd8_output_ref left_pre (total_depth (kc_pre) (Refs)) nc_pre zp (flat_inputs (Blocks) (Refs) (kc_pre)) Ps inv lo hi )
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min")) # Float  |-> lo)
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max")) # Float  |-> hi)
  **  ((&((quantization_params_pre)  # "xnn_qd8_quantization_params" ->ₛ "zero_point")) # Int  |-> zp)
  **  ((&((quantization_params_pre)  # "xnn_qd8_quantization_params" ->ₛ "inv_scale")) # Float  |-> inv)
  **  ((( &( "mr" ) )) # UInt64  |-> mr_pre)
  **  ((( &( "nc" ) )) # UInt64  |-> nc_pre)
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "ks" ) )) # UInt64  |-> ks_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "w" ) )) # Ptr  |-> w_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  ((( &( "a_offset" ) )) # UInt64  |-> a_offset_pre)
  **  ((( &( "zero" ) )) # Ptr  |-> zero_pre)
  **  ((( &( "zero_data" ) )) # Ptr  |-> zero_data_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "quantization_params" ) )) # Ptr  |-> quantization_params_pre)
  **  (FloatArray.undef_full right_pre nc_pre )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition equivalent_safety_wit_4 := 
forall (quantization_params_pre: Z) (params_pre: Z) (zero_data_pre: Z) (zero_pre: Z) (a_offset_pre: Z) (right_pre: Z) (left_pre: Z) (w_pre: Z) (a_pre: Z) (ks_pre: Z) (kc_pre: Z) (nc_pre: Z) (mr_pre: Z) (hi: fp32) (lo: fp32) (inv: fp32) (zp: Z) (Ps: (@list panel_data)) (Blocks: (@list input_block)) (Refs: (@list input_reference)) (Entries: (@list Z)) (PreH1 : (mr_pre = 1)) (PreH2 : (0 < nc_pre)) (PreH3 : (nc_pre <= 4611686018427387903)) (PreH4 : (0 < kc_pre)) (PreH5 : (0 < ks_pre)) (PreH6 : ((ks_pre % ( 8 ) ) = 0)) (PreH7 : (igemm_shape mr_pre nc_pre kc_pre ks_pre Entries Refs Blocks zero_pre zero_data_pre a_offset_pre Ps )) (PreH8 : (igemm_capacity nc_pre kc_pre a_pre w_pre left_pre Blocks Refs )) (PreH9 : (igemm_capacity nc_pre kc_pre a_pre w_pre right_pre Blocks Refs )) (PreH10 : (a_pre <> 0)) (PreH11 : (w_pre <> 0)) (PreH12 : (left_pre <> 0)) (PreH13 : (right_pre <> 0)) (PreH14 : (params_pre <> 0)) (PreH15 : (quantization_params_pre <> 0)) ,
  (PtrArray.full a_pre (ks_pre ÷ 8 ) Entries )
  **  (input_pool Blocks )
  **  (packed_matrix (total_depth (kc_pre) (Refs)) w_pre Ps )
  **  (qd8_output_ref left_pre (total_depth (kc_pre) (Refs)) nc_pre zp (flat_inputs (Blocks) (Refs) (kc_pre)) Ps inv lo hi )
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min")) # Float  |-> lo)
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max")) # Float  |-> hi)
  **  ((&((quantization_params_pre)  # "xnn_qd8_quantization_params" ->ₛ "zero_point")) # Int  |-> zp)
  **  ((&((quantization_params_pre)  # "xnn_qd8_quantization_params" ->ₛ "inv_scale")) # Float  |-> inv)
  **  ((( &( "mr" ) )) # UInt64  |-> mr_pre)
  **  ((( &( "nc" ) )) # UInt64  |-> nc_pre)
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "ks" ) )) # UInt64  |-> ks_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "w" ) )) # Ptr  |-> w_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  ((( &( "a_offset" ) )) # UInt64  |-> a_offset_pre)
  **  ((( &( "zero" ) )) # Ptr  |-> zero_pre)
  **  ((( &( "zero_data" ) )) # Ptr  |-> zero_data_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "quantization_params" ) )) # Ptr  |-> quantization_params_pre)
  **  (FloatArray.undef_full right_pre nc_pre )
|--
  “ (32 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 32) ”
.

Definition equivalent_return_wit_1 := 
(
forall (quantization_params_pre: Z) (params_pre: Z) (zero_data_pre: Z) (zero_pre: Z) (a_offset_pre: Z) (right_pre: Z) (left_pre: Z) (w_pre: Z) (a_pre: Z) (ks_pre: Z) (kc_pre: Z) (nc_pre: Z) (mr_pre: Z) (hi: fp32) (lo: fp32) (inv: fp32) (zp: Z) (Ps: (@list panel_data)) (Blocks: (@list input_block)) (Refs: (@list input_reference)) (Entries: (@list Z)) (L_2: (@list fp32)) (R_2: (@list fp32)) (retval: Z) (PreH1 : (qd8_ret_one retval )) (PreH2 : (0 < kc_pre)) (PreH3 : (qd8_outputs_related L_2 R_2 )) (PreH4 : (mr_pre = 1)) (PreH5 : (0 < nc_pre)) (PreH6 : (nc_pre <= 4611686018427387903)) (PreH7 : (0 < kc_pre)) (PreH8 : (0 < ks_pre)) (PreH9 : ((ks_pre % ( 8 ) ) = 0)) (PreH10 : (igemm_shape mr_pre nc_pre kc_pre ks_pre Entries Refs Blocks zero_pre zero_data_pre a_offset_pre Ps )) (PreH11 : (igemm_capacity nc_pre kc_pre a_pre w_pre left_pre Blocks Refs )) (PreH12 : (igemm_capacity nc_pre kc_pre a_pre w_pre right_pre Blocks Refs )) (PreH13 : (a_pre <> 0)) (PreH14 : (w_pre <> 0)) (PreH15 : (left_pre <> 0)) (PreH16 : (right_pre <> 0)) (PreH17 : (params_pre <> 0)) (PreH18 : (quantization_params_pre <> 0)) ,
  (FloatArray.full left_pre nc_pre L_2 )
  **  (FloatArray.full right_pre nc_pre R_2 )
  **  (PtrArray.full a_pre (ks_pre ÷ 8 ) Entries )
  **  (input_pool Blocks )
  **  (packed_matrix (total_depth (kc_pre) (Refs)) w_pre Ps )
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min")) # Float  |-> lo)
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max")) # Float  |-> hi)
  **  ((&((quantization_params_pre)  # "xnn_qd8_quantization_params" ->ₛ "zero_point")) # Int  |-> zp)
  **  ((&((quantization_params_pre)  # "xnn_qd8_quantization_params" ->ₛ "inv_scale")) # Float  |-> inv)
|--
  EX (L: (@list fp32))  (R: (@list fp32)) ,
  “ (retval = 1) ” 
  &&  “ (qd8_outputs_related L R ) ”
  &&  (PtrArray.full a_pre (ks_pre ÷ 8 ) Entries )
  **  (input_pool Blocks )
  **  (packed_matrix (total_depth (kc_pre) (Refs)) w_pre Ps )
  **  (FloatArray.full left_pre nc_pre L )
  **  (FloatArray.full right_pre nc_pre R )
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min")) # Float  |-> lo)
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max")) # Float  |-> hi)
  **  ((&((quantization_params_pre)  # "xnn_qd8_quantization_params" ->ₛ "zero_point")) # Int  |-> zp)
  **  ((&((quantization_params_pre)  # "xnn_qd8_quantization_params" ->ₛ "inv_scale")) # Float  |-> inv)
) \/
(
forall (quantization_params_pre: Z) (params_pre: Z) (zero_data_pre: Z) (zero_pre: Z) (a_offset_pre: Z) (right_pre: Z) (left_pre: Z) (w_pre: Z) (a_pre: Z) (ks_pre: Z) (kc_pre: Z) (nc_pre: Z) (mr_pre: Z) (Ps: (@list panel_data)) (Blocks: (@list input_block)) (Refs: (@list input_reference)) (Entries: (@list Z)) (L_2: (@list fp32)) (R_2: (@list fp32)) (retval: Z) (PreH1 : (qd8_ret_one retval )) (PreH2 : (0 < kc_pre)) (PreH3 : (qd8_outputs_related L_2 R_2 )) (PreH4 : (mr_pre = 1)) (PreH5 : (0 < nc_pre)) (PreH6 : (nc_pre <= 4611686018427387903)) (PreH7 : (0 < kc_pre)) (PreH8 : (0 < ks_pre)) (PreH9 : ((ks_pre % ( 8 ) ) = 0)) (PreH10 : (igemm_shape mr_pre nc_pre kc_pre ks_pre Entries Refs Blocks zero_pre zero_data_pre a_offset_pre Ps )) (PreH11 : (igemm_capacity nc_pre kc_pre a_pre w_pre left_pre Blocks Refs )) (PreH12 : (igemm_capacity nc_pre kc_pre a_pre w_pre right_pre Blocks Refs )) (PreH13 : (a_pre <> 0)) (PreH14 : (w_pre <> 0)) (PreH15 : (left_pre <> 0)) (PreH16 : (right_pre <> 0)) (PreH17 : (params_pre <> 0)) (PreH18 : (quantization_params_pre <> 0)) ,
  TT && emp 
|--
  “ (retval = 1) ”
  &&  emp
).

Definition equivalent_return_wit_1_split_goal_1 := 
forall (quantization_params_pre: Z) (params_pre: Z) (zero_data_pre: Z) (zero_pre: Z) (a_offset_pre: Z) (right_pre: Z) (left_pre: Z) (w_pre: Z) (a_pre: Z) (ks_pre: Z) (kc_pre: Z) (nc_pre: Z) (mr_pre: Z) (Ps: (@list panel_data)) (Blocks: (@list input_block)) (Refs: (@list input_reference)) (Entries: (@list Z)) (L_2: (@list fp32)) (R_2: (@list fp32)) (retval: Z) (PreH1 : (qd8_ret_one retval )) (PreH2 : (0 < kc_pre)) (PreH3 : (qd8_outputs_related L_2 R_2 )) (PreH4 : (mr_pre = 1)) (PreH5 : (0 < nc_pre)) (PreH6 : (nc_pre <= 4611686018427387903)) (PreH7 : (0 < kc_pre)) (PreH8 : (0 < ks_pre)) (PreH9 : ((ks_pre % ( 8 ) ) = 0)) (PreH10 : (igemm_shape mr_pre nc_pre kc_pre ks_pre Entries Refs Blocks zero_pre zero_data_pre a_offset_pre Ps )) (PreH11 : (igemm_capacity nc_pre kc_pre a_pre w_pre left_pre Blocks Refs )) (PreH12 : (igemm_capacity nc_pre kc_pre a_pre w_pre right_pre Blocks Refs )) (PreH13 : (a_pre <> 0)) (PreH14 : (w_pre <> 0)) (PreH15 : (left_pre <> 0)) (PreH16 : (right_pre <> 0)) (PreH17 : (params_pre <> 0)) (PreH18 : (quantization_params_pre <> 0)) ,
  (retval = 1)
.

Definition equivalent_partial_solve_wit_1_pure := 
forall (quantization_params_pre: Z) (params_pre: Z) (zero_data_pre: Z) (zero_pre: Z) (a_offset_pre: Z) (right_pre: Z) (left_pre: Z) (w_pre: Z) (a_pre: Z) (ks_pre: Z) (kc_pre: Z) (nc_pre: Z) (mr_pre: Z) (hi: fp32) (lo: fp32) (inv: fp32) (zp: Z) (Ps: (@list panel_data)) (Blocks: (@list input_block)) (Refs: (@list input_reference)) (Entries: (@list Z)) (PreH1 : (mr_pre = 1)) (PreH2 : (0 < nc_pre)) (PreH3 : (nc_pre <= 4611686018427387903)) (PreH4 : (0 < kc_pre)) (PreH5 : (0 < ks_pre)) (PreH6 : ((ks_pre % ( 8 ) ) = 0)) (PreH7 : (igemm_shape mr_pre nc_pre kc_pre ks_pre Entries Refs Blocks zero_pre zero_data_pre a_offset_pre Ps )) (PreH8 : (igemm_capacity nc_pre kc_pre a_pre w_pre left_pre Blocks Refs )) (PreH9 : (igemm_capacity nc_pre kc_pre a_pre w_pre right_pre Blocks Refs )) (PreH10 : (a_pre <> 0)) (PreH11 : (w_pre <> 0)) (PreH12 : (left_pre <> 0)) (PreH13 : (right_pre <> 0)) (PreH14 : (params_pre <> 0)) (PreH15 : (quantization_params_pre <> 0)) ,
  ((( &( "mr" ) )) # UInt64  |-> mr_pre)
  **  ((( &( "nc" ) )) # UInt64  |-> nc_pre)
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "ks" ) )) # UInt64  |-> ks_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "w" ) )) # Ptr  |-> w_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  ((( &( "a_offset" ) )) # UInt64  |-> a_offset_pre)
  **  ((( &( "zero" ) )) # Ptr  |-> zero_pre)
  **  ((( &( "zero_data" ) )) # Ptr  |-> zero_data_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "quantization_params" ) )) # Ptr  |-> quantization_params_pre)
  **  (PtrArray.full a_pre (ks_pre ÷ 8 ) Entries )
  **  (input_pool Blocks )
  **  (packed_matrix (total_depth (kc_pre) (Refs)) w_pre Ps )
  **  (FloatArray.undef_full left_pre nc_pre )
  **  (FloatArray.undef_full right_pre nc_pre )
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min")) # Float  |-> lo)
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max")) # Float  |-> hi)
  **  ((&((quantization_params_pre)  # "xnn_qd8_quantization_params" ->ₛ "zero_point")) # Int  |-> zp)
  **  ((&((quantization_params_pre)  # "xnn_qd8_quantization_params" ->ₛ "inv_scale")) # Float  |-> inv)
|--
  “ (mr_pre = 1) ” 
  &&  “ (0 < nc_pre) ” 
  &&  “ (nc_pre <= 4611686018427387903) ” 
  &&  “ (0 < kc_pre) ” 
  &&  “ (0 < ks_pre) ” 
  &&  “ ((ks_pre % ( 8 ) ) = 0) ” 
  &&  “ (igemm_shape mr_pre nc_pre kc_pre ks_pre Entries Refs Blocks zero_pre zero_data_pre a_offset_pre Ps ) ” 
  &&  “ (igemm_capacity nc_pre kc_pre a_pre w_pre left_pre Blocks Refs ) ” 
  &&  “ (32 = 32) ” 
  &&  “ (a_pre <> 0) ” 
  &&  “ (w_pre <> 0) ” 
  &&  “ (left_pre <> 0) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (quantization_params_pre <> 0) ”
.

Definition equivalent_partial_solve_wit_1_aux := 
forall (quantization_params_pre: Z) (params_pre: Z) (zero_data_pre: Z) (zero_pre: Z) (a_offset_pre: Z) (right_pre: Z) (left_pre: Z) (w_pre: Z) (a_pre: Z) (ks_pre: Z) (kc_pre: Z) (nc_pre: Z) (mr_pre: Z) (hi: fp32) (lo: fp32) (inv: fp32) (zp: Z) (Ps: (@list panel_data)) (Blocks: (@list input_block)) (Refs: (@list input_reference)) (Entries: (@list Z)) (PreH1 : (mr_pre = 1)) (PreH2 : (0 < nc_pre)) (PreH3 : (nc_pre <= 4611686018427387903)) (PreH4 : (0 < kc_pre)) (PreH5 : (0 < ks_pre)) (PreH6 : ((ks_pre % ( 8 ) ) = 0)) (PreH7 : (igemm_shape mr_pre nc_pre kc_pre ks_pre Entries Refs Blocks zero_pre zero_data_pre a_offset_pre Ps )) (PreH8 : (igemm_capacity nc_pre kc_pre a_pre w_pre left_pre Blocks Refs )) (PreH9 : (igemm_capacity nc_pre kc_pre a_pre w_pre right_pre Blocks Refs )) (PreH10 : (a_pre <> 0)) (PreH11 : (w_pre <> 0)) (PreH12 : (left_pre <> 0)) (PreH13 : (right_pre <> 0)) (PreH14 : (params_pre <> 0)) (PreH15 : (quantization_params_pre <> 0)) ,
  (PtrArray.full a_pre (ks_pre ÷ 8 ) Entries )
  **  (input_pool Blocks )
  **  (packed_matrix (total_depth (kc_pre) (Refs)) w_pre Ps )
  **  (FloatArray.undef_full left_pre nc_pre )
  **  (FloatArray.undef_full right_pre nc_pre )
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min")) # Float  |-> lo)
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max")) # Float  |-> hi)
  **  ((&((quantization_params_pre)  # "xnn_qd8_quantization_params" ->ₛ "zero_point")) # Int  |-> zp)
  **  ((&((quantization_params_pre)  # "xnn_qd8_quantization_params" ->ₛ "inv_scale")) # Float  |-> inv)
|--
  “ (mr_pre = 1) ” 
  &&  “ (0 < nc_pre) ” 
  &&  “ (nc_pre <= 4611686018427387903) ” 
  &&  “ (0 < kc_pre) ” 
  &&  “ (0 < ks_pre) ” 
  &&  “ ((ks_pre % ( 8 ) ) = 0) ” 
  &&  “ (igemm_shape mr_pre nc_pre kc_pre ks_pre Entries Refs Blocks zero_pre zero_data_pre a_offset_pre Ps ) ” 
  &&  “ (igemm_capacity nc_pre kc_pre a_pre w_pre left_pre Blocks Refs ) ” 
  &&  “ (32 = 32) ” 
  &&  “ (a_pre <> 0) ” 
  &&  “ (w_pre <> 0) ” 
  &&  “ (left_pre <> 0) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (quantization_params_pre <> 0) ” 
  &&  “ (mr_pre = 1) ” 
  &&  “ (0 < nc_pre) ” 
  &&  “ (nc_pre <= 4611686018427387903) ” 
  &&  “ (0 < kc_pre) ” 
  &&  “ (0 < ks_pre) ” 
  &&  “ ((ks_pre % ( 8 ) ) = 0) ” 
  &&  “ (igemm_shape mr_pre nc_pre kc_pre ks_pre Entries Refs Blocks zero_pre zero_data_pre a_offset_pre Ps ) ” 
  &&  “ (igemm_capacity nc_pre kc_pre a_pre w_pre left_pre Blocks Refs ) ” 
  &&  “ (igemm_capacity nc_pre kc_pre a_pre w_pre right_pre Blocks Refs ) ” 
  &&  “ (a_pre <> 0) ” 
  &&  “ (w_pre <> 0) ” 
  &&  “ (left_pre <> 0) ” 
  &&  “ (right_pre <> 0) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (quantization_params_pre <> 0) ”
  &&  (PtrArray.full a_pre (ks_pre ÷ 8 ) Entries )
  **  (input_pool Blocks )
  **  (packed_matrix (total_depth (kc_pre) (Refs)) w_pre Ps )
  **  (FloatArray.undef_full left_pre nc_pre )
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min")) # Float  |-> lo)
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max")) # Float  |-> hi)
  **  ((&((quantization_params_pre)  # "xnn_qd8_quantization_params" ->ₛ "zero_point")) # Int  |-> zp)
  **  ((&((quantization_params_pre)  # "xnn_qd8_quantization_params" ->ₛ "inv_scale")) # Float  |-> inv)
  **  (FloatArray.undef_full right_pre nc_pre )
.

Definition equivalent_partial_solve_wit_1 := equivalent_partial_solve_wit_1_pure -> equivalent_partial_solve_wit_1_aux.

Definition equivalent_partial_solve_wit_2_pure := 
forall (quantization_params_pre: Z) (params_pre: Z) (zero_data_pre: Z) (zero_pre: Z) (a_offset_pre: Z) (right_pre: Z) (left_pre: Z) (w_pre: Z) (a_pre: Z) (ks_pre: Z) (kc_pre: Z) (nc_pre: Z) (mr_pre: Z) (hi: fp32) (lo: fp32) (inv: fp32) (zp: Z) (Ps: (@list panel_data)) (Blocks: (@list input_block)) (Refs: (@list input_reference)) (Entries: (@list Z)) (PreH1 : (mr_pre = 1)) (PreH2 : (0 < nc_pre)) (PreH3 : (nc_pre <= 4611686018427387903)) (PreH4 : (0 < kc_pre)) (PreH5 : (0 < ks_pre)) (PreH6 : ((ks_pre % ( 8 ) ) = 0)) (PreH7 : (igemm_shape mr_pre nc_pre kc_pre ks_pre Entries Refs Blocks zero_pre zero_data_pre a_offset_pre Ps )) (PreH8 : (igemm_capacity nc_pre kc_pre a_pre w_pre left_pre Blocks Refs )) (PreH9 : (igemm_capacity nc_pre kc_pre a_pre w_pre right_pre Blocks Refs )) (PreH10 : (a_pre <> 0)) (PreH11 : (w_pre <> 0)) (PreH12 : (left_pre <> 0)) (PreH13 : (right_pre <> 0)) (PreH14 : (params_pre <> 0)) (PreH15 : (quantization_params_pre <> 0)) ,
  (PtrArray.full a_pre (ks_pre ÷ 8 ) Entries )
  **  (input_pool Blocks )
  **  (packed_matrix (total_depth (kc_pre) (Refs)) w_pre Ps )
  **  (qd8_output_ref left_pre (total_depth (kc_pre) (Refs)) nc_pre zp (flat_inputs (Blocks) (Refs) (kc_pre)) Ps inv lo hi )
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min")) # Float  |-> lo)
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max")) # Float  |-> hi)
  **  ((&((quantization_params_pre)  # "xnn_qd8_quantization_params" ->ₛ "zero_point")) # Int  |-> zp)
  **  ((&((quantization_params_pre)  # "xnn_qd8_quantization_params" ->ₛ "inv_scale")) # Float  |-> inv)
  **  ((( &( "mr" ) )) # UInt64  |-> mr_pre)
  **  ((( &( "nc" ) )) # UInt64  |-> nc_pre)
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "ks" ) )) # UInt64  |-> ks_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "w" ) )) # Ptr  |-> w_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  ((( &( "a_offset" ) )) # UInt64  |-> a_offset_pre)
  **  ((( &( "zero" ) )) # Ptr  |-> zero_pre)
  **  ((( &( "zero_data" ) )) # Ptr  |-> zero_data_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "quantization_params" ) )) # Ptr  |-> quantization_params_pre)
  **  (FloatArray.undef_full right_pre nc_pre )
|--
  “ (mr_pre = 1) ” 
  &&  “ (0 < nc_pre) ” 
  &&  “ (nc_pre <= 4611686018427387903) ” 
  &&  “ (0 < kc_pre) ” 
  &&  “ (0 < ks_pre) ” 
  &&  “ ((ks_pre % ( 8 ) ) = 0) ” 
  &&  “ (igemm_shape mr_pre nc_pre kc_pre ks_pre Entries Refs Blocks zero_pre zero_data_pre a_offset_pre Ps ) ” 
  &&  “ (igemm_capacity nc_pre kc_pre a_pre w_pre right_pre Blocks Refs ) ” 
  &&  “ (32 = 32) ” 
  &&  “ (a_pre <> 0) ” 
  &&  “ (w_pre <> 0) ” 
  &&  “ (right_pre <> 0) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (quantization_params_pre <> 0) ”
.

Definition equivalent_partial_solve_wit_2_aux := 
forall (quantization_params_pre: Z) (params_pre: Z) (zero_data_pre: Z) (zero_pre: Z) (a_offset_pre: Z) (right_pre: Z) (left_pre: Z) (w_pre: Z) (a_pre: Z) (ks_pre: Z) (kc_pre: Z) (nc_pre: Z) (mr_pre: Z) (hi: fp32) (lo: fp32) (inv: fp32) (zp: Z) (Ps: (@list panel_data)) (Blocks: (@list input_block)) (Refs: (@list input_reference)) (Entries: (@list Z)) (PreH1 : (mr_pre = 1)) (PreH2 : (0 < nc_pre)) (PreH3 : (nc_pre <= 4611686018427387903)) (PreH4 : (0 < kc_pre)) (PreH5 : (0 < ks_pre)) (PreH6 : ((ks_pre % ( 8 ) ) = 0)) (PreH7 : (igemm_shape mr_pre nc_pre kc_pre ks_pre Entries Refs Blocks zero_pre zero_data_pre a_offset_pre Ps )) (PreH8 : (igemm_capacity nc_pre kc_pre a_pre w_pre left_pre Blocks Refs )) (PreH9 : (igemm_capacity nc_pre kc_pre a_pre w_pre right_pre Blocks Refs )) (PreH10 : (a_pre <> 0)) (PreH11 : (w_pre <> 0)) (PreH12 : (left_pre <> 0)) (PreH13 : (right_pre <> 0)) (PreH14 : (params_pre <> 0)) (PreH15 : (quantization_params_pre <> 0)) ,
  (PtrArray.full a_pre (ks_pre ÷ 8 ) Entries )
  **  (input_pool Blocks )
  **  (packed_matrix (total_depth (kc_pre) (Refs)) w_pre Ps )
  **  (qd8_output_ref left_pre (total_depth (kc_pre) (Refs)) nc_pre zp (flat_inputs (Blocks) (Refs) (kc_pre)) Ps inv lo hi )
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min")) # Float  |-> lo)
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max")) # Float  |-> hi)
  **  ((&((quantization_params_pre)  # "xnn_qd8_quantization_params" ->ₛ "zero_point")) # Int  |-> zp)
  **  ((&((quantization_params_pre)  # "xnn_qd8_quantization_params" ->ₛ "inv_scale")) # Float  |-> inv)
  **  (FloatArray.undef_full right_pre nc_pre )
|--
  “ (mr_pre = 1) ” 
  &&  “ (0 < nc_pre) ” 
  &&  “ (nc_pre <= 4611686018427387903) ” 
  &&  “ (0 < kc_pre) ” 
  &&  “ (0 < ks_pre) ” 
  &&  “ ((ks_pre % ( 8 ) ) = 0) ” 
  &&  “ (igemm_shape mr_pre nc_pre kc_pre ks_pre Entries Refs Blocks zero_pre zero_data_pre a_offset_pre Ps ) ” 
  &&  “ (igemm_capacity nc_pre kc_pre a_pre w_pre right_pre Blocks Refs ) ” 
  &&  “ (32 = 32) ” 
  &&  “ (a_pre <> 0) ” 
  &&  “ (w_pre <> 0) ” 
  &&  “ (right_pre <> 0) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (quantization_params_pre <> 0) ” 
  &&  “ (mr_pre = 1) ” 
  &&  “ (0 < nc_pre) ” 
  &&  “ (nc_pre <= 4611686018427387903) ” 
  &&  “ (0 < kc_pre) ” 
  &&  “ (0 < ks_pre) ” 
  &&  “ ((ks_pre % ( 8 ) ) = 0) ” 
  &&  “ (igemm_shape mr_pre nc_pre kc_pre ks_pre Entries Refs Blocks zero_pre zero_data_pre a_offset_pre Ps ) ” 
  &&  “ (igemm_capacity nc_pre kc_pre a_pre w_pre left_pre Blocks Refs ) ” 
  &&  “ (igemm_capacity nc_pre kc_pre a_pre w_pre right_pre Blocks Refs ) ” 
  &&  “ (a_pre <> 0) ” 
  &&  “ (w_pre <> 0) ” 
  &&  “ (left_pre <> 0) ” 
  &&  “ (right_pre <> 0) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (quantization_params_pre <> 0) ”
  &&  (PtrArray.full a_pre (ks_pre ÷ 8 ) Entries )
  **  (input_pool Blocks )
  **  (packed_matrix (total_depth (kc_pre) (Refs)) w_pre Ps )
  **  (FloatArray.undef_full right_pre nc_pre )
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min")) # Float  |-> lo)
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max")) # Float  |-> hi)
  **  ((&((quantization_params_pre)  # "xnn_qd8_quantization_params" ->ₛ "zero_point")) # Int  |-> zp)
  **  ((&((quantization_params_pre)  # "xnn_qd8_quantization_params" ->ₛ "inv_scale")) # Float  |-> inv)
  **  (qd8_output_ref left_pre (total_depth (kc_pre) (Refs)) nc_pre zp (flat_inputs (Blocks) (Refs) (kc_pre)) Ps inv lo hi )
.

Definition equivalent_partial_solve_wit_2 := equivalent_partial_solve_wit_2_pure -> equivalent_partial_solve_wit_2_aux.

Definition equivalent_partial_solve_wit_3_pure := 
forall (quantization_params_pre: Z) (params_pre: Z) (zero_data_pre: Z) (zero_pre: Z) (a_offset_pre: Z) (right_pre: Z) (left_pre: Z) (w_pre: Z) (a_pre: Z) (ks_pre: Z) (kc_pre: Z) (nc_pre: Z) (mr_pre: Z) (hi: fp32) (lo: fp32) (inv: fp32) (zp: Z) (Ps: (@list panel_data)) (Blocks: (@list input_block)) (Refs: (@list input_reference)) (Entries: (@list Z)) (PreH1 : (mr_pre = 1)) (PreH2 : (0 < nc_pre)) (PreH3 : (nc_pre <= 4611686018427387903)) (PreH4 : (0 < kc_pre)) (PreH5 : (0 < ks_pre)) (PreH6 : ((ks_pre % ( 8 ) ) = 0)) (PreH7 : (igemm_shape mr_pre nc_pre kc_pre ks_pre Entries Refs Blocks zero_pre zero_data_pre a_offset_pre Ps )) (PreH8 : (igemm_capacity nc_pre kc_pre a_pre w_pre left_pre Blocks Refs )) (PreH9 : (igemm_capacity nc_pre kc_pre a_pre w_pre right_pre Blocks Refs )) (PreH10 : (a_pre <> 0)) (PreH11 : (w_pre <> 0)) (PreH12 : (left_pre <> 0)) (PreH13 : (right_pre <> 0)) (PreH14 : (params_pre <> 0)) (PreH15 : (quantization_params_pre <> 0)) ,
  (PtrArray.full a_pre (ks_pre ÷ 8 ) Entries )
  **  (input_pool Blocks )
  **  (packed_matrix (total_depth (kc_pre) (Refs)) w_pre Ps )
  **  (qd8_output_ref right_pre (total_depth (kc_pre) (Refs)) nc_pre zp (flat_inputs (Blocks) (Refs) (kc_pre)) Ps inv lo hi )
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min")) # Float  |-> lo)
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max")) # Float  |-> hi)
  **  ((&((quantization_params_pre)  # "xnn_qd8_quantization_params" ->ₛ "zero_point")) # Int  |-> zp)
  **  ((&((quantization_params_pre)  # "xnn_qd8_quantization_params" ->ₛ "inv_scale")) # Float  |-> inv)
  **  (qd8_output_ref left_pre (total_depth (kc_pre) (Refs)) nc_pre zp (flat_inputs (Blocks) (Refs) (kc_pre)) Ps inv lo hi )
  **  ((( &( "mr" ) )) # UInt64  |-> mr_pre)
  **  ((( &( "nc" ) )) # UInt64  |-> nc_pre)
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "ks" ) )) # UInt64  |-> ks_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "w" ) )) # Ptr  |-> w_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  ((( &( "a_offset" ) )) # UInt64  |-> a_offset_pre)
  **  ((( &( "zero" ) )) # Ptr  |-> zero_pre)
  **  ((( &( "zero_data" ) )) # Ptr  |-> zero_data_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "quantization_params" ) )) # Ptr  |-> quantization_params_pre)
|--
  “ (0 < kc_pre) ”
.

Definition equivalent_partial_solve_wit_3_aux := 
forall (quantization_params_pre: Z) (params_pre: Z) (zero_data_pre: Z) (zero_pre: Z) (a_offset_pre: Z) (right_pre: Z) (left_pre: Z) (w_pre: Z) (a_pre: Z) (ks_pre: Z) (kc_pre: Z) (nc_pre: Z) (mr_pre: Z) (hi: fp32) (lo: fp32) (inv: fp32) (zp: Z) (Ps: (@list panel_data)) (Blocks: (@list input_block)) (Refs: (@list input_reference)) (Entries: (@list Z)) (PreH1 : (mr_pre = 1)) (PreH2 : (0 < nc_pre)) (PreH3 : (nc_pre <= 4611686018427387903)) (PreH4 : (0 < kc_pre)) (PreH5 : (0 < ks_pre)) (PreH6 : ((ks_pre % ( 8 ) ) = 0)) (PreH7 : (igemm_shape mr_pre nc_pre kc_pre ks_pre Entries Refs Blocks zero_pre zero_data_pre a_offset_pre Ps )) (PreH8 : (igemm_capacity nc_pre kc_pre a_pre w_pre left_pre Blocks Refs )) (PreH9 : (igemm_capacity nc_pre kc_pre a_pre w_pre right_pre Blocks Refs )) (PreH10 : (a_pre <> 0)) (PreH11 : (w_pre <> 0)) (PreH12 : (left_pre <> 0)) (PreH13 : (right_pre <> 0)) (PreH14 : (params_pre <> 0)) (PreH15 : (quantization_params_pre <> 0)) ,
  (PtrArray.full a_pre (ks_pre ÷ 8 ) Entries )
  **  (input_pool Blocks )
  **  (packed_matrix (total_depth (kc_pre) (Refs)) w_pre Ps )
  **  (qd8_output_ref right_pre (total_depth (kc_pre) (Refs)) nc_pre zp (flat_inputs (Blocks) (Refs) (kc_pre)) Ps inv lo hi )
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min")) # Float  |-> lo)
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max")) # Float  |-> hi)
  **  ((&((quantization_params_pre)  # "xnn_qd8_quantization_params" ->ₛ "zero_point")) # Int  |-> zp)
  **  ((&((quantization_params_pre)  # "xnn_qd8_quantization_params" ->ₛ "inv_scale")) # Float  |-> inv)
  **  (qd8_output_ref left_pre (total_depth (kc_pre) (Refs)) nc_pre zp (flat_inputs (Blocks) (Refs) (kc_pre)) Ps inv lo hi )
|--
  “ (0 < kc_pre) ” 
  &&  “ (mr_pre = 1) ” 
  &&  “ (0 < nc_pre) ” 
  &&  “ (nc_pre <= 4611686018427387903) ” 
  &&  “ (0 < kc_pre) ” 
  &&  “ (0 < ks_pre) ” 
  &&  “ ((ks_pre % ( 8 ) ) = 0) ” 
  &&  “ (igemm_shape mr_pre nc_pre kc_pre ks_pre Entries Refs Blocks zero_pre zero_data_pre a_offset_pre Ps ) ” 
  &&  “ (igemm_capacity nc_pre kc_pre a_pre w_pre left_pre Blocks Refs ) ” 
  &&  “ (igemm_capacity nc_pre kc_pre a_pre w_pre right_pre Blocks Refs ) ” 
  &&  “ (a_pre <> 0) ” 
  &&  “ (w_pre <> 0) ” 
  &&  “ (left_pre <> 0) ” 
  &&  “ (right_pre <> 0) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (quantization_params_pre <> 0) ”
  &&  (qd8_output_ref left_pre (total_depth (kc_pre) (Refs)) nc_pre zp (flat_inputs (Blocks) (Refs) (kc_pre)) Ps inv lo hi )
  **  (qd8_output_ref right_pre (total_depth (kc_pre) (Refs)) nc_pre zp (flat_inputs (Blocks) (Refs) (kc_pre)) Ps inv lo hi )
  **  (PtrArray.full a_pre (ks_pre ÷ 8 ) Entries )
  **  (input_pool Blocks )
  **  (packed_matrix (total_depth (kc_pre) (Refs)) w_pre Ps )
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min")) # Float  |-> lo)
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max")) # Float  |-> hi)
  **  ((&((quantization_params_pre)  # "xnn_qd8_quantization_params" ->ₛ "zero_point")) # Int  |-> zp)
  **  ((&((quantization_params_pre)  # "xnn_qd8_quantization_params" ->ₛ "inv_scale")) # Float  |-> inv)
.

Definition equivalent_partial_solve_wit_3 := equivalent_partial_solve_wit_3_pure -> equivalent_partial_solve_wit_3_aux.

Definition equivalent_partial_solve_wit_4_pure := 
forall (quantization_params_pre: Z) (params_pre: Z) (zero_data_pre: Z) (zero_pre: Z) (a_offset_pre: Z) (right_pre: Z) (left_pre: Z) (w_pre: Z) (a_pre: Z) (ks_pre: Z) (kc_pre: Z) (nc_pre: Z) (mr_pre: Z) (hi: fp32) (lo: fp32) (inv: fp32) (zp: Z) (Ps: (@list panel_data)) (Blocks: (@list input_block)) (Refs: (@list input_reference)) (Entries: (@list Z)) (L: (@list fp32)) (R: (@list fp32)) (PreH1 : (0 < kc_pre)) (PreH2 : (qd8_outputs_related L R )) (PreH3 : (mr_pre = 1)) (PreH4 : (0 < nc_pre)) (PreH5 : (nc_pre <= 4611686018427387903)) (PreH6 : (0 < kc_pre)) (PreH7 : (0 < ks_pre)) (PreH8 : ((ks_pre % ( 8 ) ) = 0)) (PreH9 : (igemm_shape mr_pre nc_pre kc_pre ks_pre Entries Refs Blocks zero_pre zero_data_pre a_offset_pre Ps )) (PreH10 : (igemm_capacity nc_pre kc_pre a_pre w_pre left_pre Blocks Refs )) (PreH11 : (igemm_capacity nc_pre kc_pre a_pre w_pre right_pre Blocks Refs )) (PreH12 : (a_pre <> 0)) (PreH13 : (w_pre <> 0)) (PreH14 : (left_pre <> 0)) (PreH15 : (right_pre <> 0)) (PreH16 : (params_pre <> 0)) (PreH17 : (quantization_params_pre <> 0)) ,
  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "nc" ) )) # UInt64  |-> nc_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  (FloatArray.full left_pre nc_pre L )
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  (FloatArray.full right_pre nc_pre R )
  **  (PtrArray.full a_pre (ks_pre ÷ 8 ) Entries )
  **  (input_pool Blocks )
  **  (packed_matrix (total_depth (kc_pre) (Refs)) w_pre Ps )
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min")) # Float  |-> lo)
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max")) # Float  |-> hi)
  **  ((&((quantization_params_pre)  # "xnn_qd8_quantization_params" ->ₛ "zero_point")) # Int  |-> zp)
  **  ((&((quantization_params_pre)  # "xnn_qd8_quantization_params" ->ₛ "inv_scale")) # Float  |-> inv)
  **  ((( &( "mr" ) )) # UInt64  |-> mr_pre)
  **  ((( &( "ks" ) )) # UInt64  |-> ks_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "w" ) )) # Ptr  |-> w_pre)
  **  ((( &( "a_offset" ) )) # UInt64  |-> a_offset_pre)
  **  ((( &( "zero" ) )) # Ptr  |-> zero_pre)
  **  ((( &( "zero_data" ) )) # Ptr  |-> zero_data_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "quantization_params" ) )) # Ptr  |-> quantization_params_pre)
|--
  “ (0 < nc_pre) ” 
  &&  “ (nc_pre <= 4611686018427387903) ” 
  &&  “ (qd8_outputs_related L R ) ”
.

Definition equivalent_partial_solve_wit_4_aux := 
forall (quantization_params_pre: Z) (params_pre: Z) (zero_data_pre: Z) (zero_pre: Z) (a_offset_pre: Z) (right_pre: Z) (left_pre: Z) (w_pre: Z) (a_pre: Z) (ks_pre: Z) (kc_pre: Z) (nc_pre: Z) (mr_pre: Z) (hi: fp32) (lo: fp32) (inv: fp32) (zp: Z) (Ps: (@list panel_data)) (Blocks: (@list input_block)) (Refs: (@list input_reference)) (Entries: (@list Z)) (L: (@list fp32)) (R: (@list fp32)) (PreH1 : (0 < kc_pre)) (PreH2 : (qd8_outputs_related L R )) (PreH3 : (mr_pre = 1)) (PreH4 : (0 < nc_pre)) (PreH5 : (nc_pre <= 4611686018427387903)) (PreH6 : (0 < kc_pre)) (PreH7 : (0 < ks_pre)) (PreH8 : ((ks_pre % ( 8 ) ) = 0)) (PreH9 : (igemm_shape mr_pre nc_pre kc_pre ks_pre Entries Refs Blocks zero_pre zero_data_pre a_offset_pre Ps )) (PreH10 : (igemm_capacity nc_pre kc_pre a_pre w_pre left_pre Blocks Refs )) (PreH11 : (igemm_capacity nc_pre kc_pre a_pre w_pre right_pre Blocks Refs )) (PreH12 : (a_pre <> 0)) (PreH13 : (w_pre <> 0)) (PreH14 : (left_pre <> 0)) (PreH15 : (right_pre <> 0)) (PreH16 : (params_pre <> 0)) (PreH17 : (quantization_params_pre <> 0)) ,
  (FloatArray.full left_pre nc_pre L )
  **  (FloatArray.full right_pre nc_pre R )
  **  (PtrArray.full a_pre (ks_pre ÷ 8 ) Entries )
  **  (input_pool Blocks )
  **  (packed_matrix (total_depth (kc_pre) (Refs)) w_pre Ps )
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min")) # Float  |-> lo)
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max")) # Float  |-> hi)
  **  ((&((quantization_params_pre)  # "xnn_qd8_quantization_params" ->ₛ "zero_point")) # Int  |-> zp)
  **  ((&((quantization_params_pre)  # "xnn_qd8_quantization_params" ->ₛ "inv_scale")) # Float  |-> inv)
|--
  “ (0 < nc_pre) ” 
  &&  “ (nc_pre <= 4611686018427387903) ” 
  &&  “ (qd8_outputs_related L R ) ” 
  &&  “ (0 < kc_pre) ” 
  &&  “ (qd8_outputs_related L R ) ” 
  &&  “ (mr_pre = 1) ” 
  &&  “ (0 < nc_pre) ” 
  &&  “ (nc_pre <= 4611686018427387903) ” 
  &&  “ (0 < kc_pre) ” 
  &&  “ (0 < ks_pre) ” 
  &&  “ ((ks_pre % ( 8 ) ) = 0) ” 
  &&  “ (igemm_shape mr_pre nc_pre kc_pre ks_pre Entries Refs Blocks zero_pre zero_data_pre a_offset_pre Ps ) ” 
  &&  “ (igemm_capacity nc_pre kc_pre a_pre w_pre left_pre Blocks Refs ) ” 
  &&  “ (igemm_capacity nc_pre kc_pre a_pre w_pre right_pre Blocks Refs ) ” 
  &&  “ (a_pre <> 0) ” 
  &&  “ (w_pre <> 0) ” 
  &&  “ (left_pre <> 0) ” 
  &&  “ (right_pre <> 0) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (quantization_params_pre <> 0) ”
  &&  (FloatArray.full left_pre nc_pre L )
  **  (FloatArray.full right_pre nc_pre R )
  **  (PtrArray.full a_pre (ks_pre ÷ 8 ) Entries )
  **  (input_pool Blocks )
  **  (packed_matrix (total_depth (kc_pre) (Refs)) w_pre Ps )
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "min")) # Float  |-> lo)
  **  ((&((params_pre)  # "xnn_f32_minmax_params" ->ₛ "scalar" .ₛ "max")) # Float  |-> hi)
  **  ((&((quantization_params_pre)  # "xnn_qd8_quantization_params" ->ₛ "zero_point")) # Int  |-> zp)
  **  ((&((quantization_params_pre)  # "xnn_qd8_quantization_params" ->ₛ "inv_scale")) # Float  |-> inv)
.

Definition equivalent_partial_solve_wit_4 := equivalent_partial_solve_wit_4_pure -> equivalent_partial_solve_wit_4_aux.

Definition equivalent_which_implies_wit_1 := 
(
forall (hi: fp32) (lo: fp32) (inv: fp32) (zp: Z) (Ps: (@list panel_data)) (Blocks: (@list input_block)) (Refs: (@list input_reference)) (kc: Z) (nc: Z) (left: Z) (right: Z) (PreH1 : (0 < kc)) ,
  (qd8_output_ref left (total_depth (kc) (Refs)) nc zp (flat_inputs (Blocks) (Refs) (kc)) Ps inv lo hi )
  **  (qd8_output_ref right (total_depth (kc) (Refs)) nc zp (flat_inputs (Blocks) (Refs) (kc)) Ps inv lo hi )
|--
  EX (L: (@list fp32))  (R: (@list fp32)) ,
  “ (0 < kc) ” 
  &&  “ (qd8_outputs_related L R ) ”
  &&  (FloatArray.full left nc L )
  **  (FloatArray.full right nc R )
) \/
(
forall (hi: fp32) (lo: fp32) (inv: fp32) (zp: Z) (Ps: (@list panel_data)) (Blocks: (@list input_block)) (Refs: (@list input_reference)) (kc: Z) (nc: Z) (left: Z) (right: Z) (PreH1 : (0 < kc)) ,
  (qd8_output_ref left (total_depth (kc) (Refs)) nc zp (flat_inputs (Blocks) (Refs) (kc)) Ps inv lo hi )
  **  (qd8_output_ref right (total_depth (kc) (Refs)) nc zp (flat_inputs (Blocks) (Refs) (kc)) Ps inv lo hi )
|--
  EX (L: (@list fp32))  (R: (@list fp32)) ,
  “ (0 < kc) ” 
  &&  “ (qd8_outputs_related L R ) ”
  &&  (FloatArray.full left nc L )
  **  (FloatArray.full right nc R )
).

Module Type VC_Correct.


Axiom proof_of_qd8_preserve_float_return_wit_1 : qd8_preserve_float_return_wit_1.
Axiom proof_of_qd8_same_lane_safety_wit_1 : qd8_same_lane_safety_wit_1.
Axiom proof_of_qd8_same_lane_safety_wit_2 : qd8_same_lane_safety_wit_2.
Axiom proof_of_qd8_same_lane_safety_wit_3 : qd8_same_lane_safety_wit_3.
Axiom proof_of_qd8_same_lane_safety_wit_4 : qd8_same_lane_safety_wit_4.
Axiom proof_of_qd8_same_lane_return_wit_1 : qd8_same_lane_return_wit_1.
Axiom proof_of_qd8_same_lane_return_wit_2 : qd8_same_lane_return_wit_2.
Axiom proof_of_qd8_same_lane_return_wit_3 : qd8_same_lane_return_wit_3.
Axiom proof_of_qd8_same_lane_return_wit_4 : qd8_same_lane_return_wit_4.
Axiom proof_of_qd8_same_lane_partial_solve_wit_1 : qd8_same_lane_partial_solve_wit_1.
Axiom proof_of_qd8_same_lane_partial_solve_wit_2 : qd8_same_lane_partial_solve_wit_2.
Axiom proof_of_qd8_compare_outputs_safety_wit_1 : qd8_compare_outputs_safety_wit_1.
Axiom proof_of_qd8_compare_outputs_safety_wit_2 : qd8_compare_outputs_safety_wit_2.
Axiom proof_of_qd8_compare_outputs_safety_wit_3 : qd8_compare_outputs_safety_wit_3.
Axiom proof_of_qd8_compare_outputs_entail_wit_1 : qd8_compare_outputs_entail_wit_1.
Axiom proof_of_qd8_compare_outputs_entail_wit_2 : qd8_compare_outputs_entail_wit_2.
Axiom proof_of_qd8_compare_outputs_return_wit_1 : qd8_compare_outputs_return_wit_1.
Axiom proof_of_qd8_compare_outputs_return_wit_2 : qd8_compare_outputs_return_wit_2.
Axiom proof_of_qd8_compare_outputs_partial_solve_wit_1_pure : qd8_compare_outputs_partial_solve_wit_1_pure.
Axiom proof_of_qd8_compare_outputs_partial_solve_wit_1 : qd8_compare_outputs_partial_solve_wit_1.
Axiom proof_of_qd8_compare_outputs_partial_solve_wit_2_pure : qd8_compare_outputs_partial_solve_wit_2_pure.
Axiom proof_of_qd8_compare_outputs_partial_solve_wit_2 : qd8_compare_outputs_partial_solve_wit_2.
Axiom proof_of_qd8_compare_outputs_partial_solve_wit_3_pure : qd8_compare_outputs_partial_solve_wit_3_pure.
Axiom proof_of_qd8_compare_outputs_partial_solve_wit_3 : qd8_compare_outputs_partial_solve_wit_3.
Axiom proof_of_qd8_compare_outputs_which_implies_wit_1 : qd8_compare_outputs_which_implies_wit_1.
Axiom proof_of_qd8_compare_outputs_which_implies_wit_2 : qd8_compare_outputs_which_implies_wit_2.
Axiom proof_of_equivalent_safety_wit_1 : equivalent_safety_wit_1.
Axiom proof_of_equivalent_safety_wit_2 : equivalent_safety_wit_2.
Axiom proof_of_equivalent_safety_wit_3 : equivalent_safety_wit_3.
Axiom proof_of_equivalent_safety_wit_4 : equivalent_safety_wit_4.
Axiom proof_of_equivalent_return_wit_1 : equivalent_return_wit_1.
Axiom proof_of_equivalent_partial_solve_wit_1_pure : equivalent_partial_solve_wit_1_pure.
Axiom proof_of_equivalent_partial_solve_wit_1 : equivalent_partial_solve_wit_1.
Axiom proof_of_equivalent_partial_solve_wit_2_pure : equivalent_partial_solve_wit_2_pure.
Axiom proof_of_equivalent_partial_solve_wit_2 : equivalent_partial_solve_wit_2.
Axiom proof_of_equivalent_partial_solve_wit_3_pure : equivalent_partial_solve_wit_3_pure.
Axiom proof_of_equivalent_partial_solve_wit_3 : equivalent_partial_solve_wit_3.
Axiom proof_of_equivalent_partial_solve_wit_4_pure : equivalent_partial_solve_wit_4_pure.
Axiom proof_of_equivalent_partial_solve_wit_4 : equivalent_partial_solve_wit_4.
Axiom proof_of_equivalent_which_implies_wit_1 : equivalent_which_implies_wit_1.

End VC_Correct.
