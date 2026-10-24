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
Require Import QC4W.PublicModel.
Require Import QC4W.PublicModel.
Local Open Scope sac.

(*----- Function qc4_preserve_float -----*)

Definition qc4_preserve_float_return_wit_1 := 
(
forall (x_pre: fp32) ,
  TT && emp 
|--
  “ (qc4_bit_same x_pre x_pre ) ”
  &&  emp
) \/
(
forall (x_pre: fp32) ,
  TT && emp 
|--
  “ (qc4_bit_same x_pre x_pre ) ”
  &&  emp
).

Definition qc4_preserve_float_return_wit_1_split_goal_1 := 
forall (x_pre: fp32) ,
  (qc4_bit_same x_pre x_pre )
.

(*----- Function qc4_same_lane -----*)

Definition qc4_same_lane_safety_wit_1 := 
forall (y_pre: fp32) (x_pre: fp32) (retval: fp32) (retval_2: fp32) (PreH1 : (fp32_eq x_pre y_pre )) (PreH2 : (qc4_bit_same retval_2 y_pre )) (PreH3 : (qc4_bit_same retval x_pre )) (PreH4 : (qc4_same_value x_pre y_pre )) ,
  ((( &( "yc" ) )) # Float  |-> retval_2)
  **  ((( &( "xc" ) )) # Float  |-> retval)
  **  ((( &( "x" ) )) # Float  |-> x_pre)
  **  ((( &( "y" ) )) # Float  |-> y_pre)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition qc4_same_lane_safety_wit_2 := 
forall (y_pre: fp32) (x_pre: fp32) (retval: fp32) (retval_2: fp32) (PreH1 : (fp32_ne y_pre retval_2 )) (PreH2 : (fp32_ne x_pre retval )) (PreH3 : (fp32_ne x_pre y_pre )) (PreH4 : (qc4_bit_same retval_2 y_pre )) (PreH5 : (qc4_bit_same retval x_pre )) (PreH6 : (qc4_same_value x_pre y_pre )) ,
  ((( &( "yc" ) )) # Float  |-> retval_2)
  **  ((( &( "xc" ) )) # Float  |-> retval)
  **  ((( &( "x" ) )) # Float  |-> x_pre)
  **  ((( &( "y" ) )) # Float  |-> y_pre)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition qc4_same_lane_safety_wit_3 := 
forall (y_pre: fp32) (x_pre: fp32) (retval: fp32) (retval_2: fp32) (PreH1 : (fp32_eq x_pre retval )) (PreH2 : (fp32_ne x_pre y_pre )) (PreH3 : (qc4_bit_same retval_2 y_pre )) (PreH4 : (qc4_bit_same retval x_pre )) (PreH5 : (qc4_same_value x_pre y_pre )) ,
  ((( &( "yc" ) )) # Float  |-> retval_2)
  **  ((( &( "xc" ) )) # Float  |-> retval)
  **  ((( &( "x" ) )) # Float  |-> x_pre)
  **  ((( &( "y" ) )) # Float  |-> y_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qc4_same_lane_safety_wit_4 := 
forall (y_pre: fp32) (x_pre: fp32) (retval: fp32) (retval_2: fp32) (PreH1 : (fp32_eq y_pre retval_2 )) (PreH2 : (fp32_ne x_pre retval )) (PreH3 : (fp32_ne x_pre y_pre )) (PreH4 : (qc4_bit_same retval_2 y_pre )) (PreH5 : (qc4_bit_same retval x_pre )) (PreH6 : (qc4_same_value x_pre y_pre )) ,
  ((( &( "yc" ) )) # Float  |-> retval_2)
  **  ((( &( "xc" ) )) # Float  |-> retval)
  **  ((( &( "x" ) )) # Float  |-> x_pre)
  **  ((( &( "y" ) )) # Float  |-> y_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qc4_same_lane_return_wit_1 := 
(
forall (y_pre: fp32) (x_pre: fp32) (retval: fp32) (retval_2: fp32) (PreH1 : (fp32_eq x_pre retval )) (PreH2 : (fp32_ne x_pre y_pre )) (PreH3 : (qc4_bit_same retval_2 y_pre )) (PreH4 : (qc4_bit_same retval x_pre )) (PreH5 : (qc4_same_value x_pre y_pre )) ,
  TT && emp 
|--
  “ (qc4_ret_one 0 ) ”
  &&  emp
) \/
(
forall (y_pre: fp32) (x_pre: fp32) (retval: fp32) (retval_2: fp32) (PreH1 : (fp32_eq x_pre retval )) (PreH2 : (fp32_ne x_pre y_pre )) (PreH3 : (qc4_bit_same retval_2 y_pre )) (PreH4 : (qc4_bit_same retval x_pre )) (PreH5 : (qc4_same_value x_pre y_pre )) ,
  TT && emp 
|--
  “ (qc4_ret_one 0 ) ”
  &&  emp
).

Definition qc4_same_lane_return_wit_1_split_goal_1 := 
forall (y_pre: fp32) (x_pre: fp32) (retval: fp32) (retval_2: fp32) (PreH1 : (fp32_eq x_pre retval )) (PreH2 : (fp32_ne x_pre y_pre )) (PreH3 : (qc4_bit_same retval_2 y_pre )) (PreH4 : (qc4_bit_same retval x_pre )) (PreH5 : (qc4_same_value x_pre y_pre )) ,
  (qc4_ret_one 0 )
.

Definition qc4_same_lane_return_wit_2 := 
(
forall (y_pre: fp32) (x_pre: fp32) (retval: fp32) (retval_2: fp32) (PreH1 : (fp32_eq y_pre retval_2 )) (PreH2 : (fp32_ne x_pre retval )) (PreH3 : (fp32_ne x_pre y_pre )) (PreH4 : (qc4_bit_same retval_2 y_pre )) (PreH5 : (qc4_bit_same retval x_pre )) (PreH6 : (qc4_same_value x_pre y_pre )) ,
  TT && emp 
|--
  “ (qc4_ret_one 0 ) ”
  &&  emp
) \/
(
forall (y_pre: fp32) (x_pre: fp32) (retval: fp32) (retval_2: fp32) (PreH1 : (fp32_eq y_pre retval_2 )) (PreH2 : (fp32_ne x_pre retval )) (PreH3 : (fp32_ne x_pre y_pre )) (PreH4 : (qc4_bit_same retval_2 y_pre )) (PreH5 : (qc4_bit_same retval x_pre )) (PreH6 : (qc4_same_value x_pre y_pre )) ,
  TT && emp 
|--
  “ (qc4_ret_one 0 ) ”
  &&  emp
).

Definition qc4_same_lane_return_wit_2_split_goal_1 := 
forall (y_pre: fp32) (x_pre: fp32) (retval: fp32) (retval_2: fp32) (PreH1 : (fp32_eq y_pre retval_2 )) (PreH2 : (fp32_ne x_pre retval )) (PreH3 : (fp32_ne x_pre y_pre )) (PreH4 : (qc4_bit_same retval_2 y_pre )) (PreH5 : (qc4_bit_same retval x_pre )) (PreH6 : (qc4_same_value x_pre y_pre )) ,
  (qc4_ret_one 0 )
.

Definition qc4_same_lane_return_wit_3 := 
(
forall (y_pre: fp32) (x_pre: fp32) (retval: fp32) (retval_2: fp32) (PreH1 : (fp32_ne y_pre retval_2 )) (PreH2 : (fp32_ne x_pre retval )) (PreH3 : (fp32_ne x_pre y_pre )) (PreH4 : (qc4_bit_same retval_2 y_pre )) (PreH5 : (qc4_bit_same retval x_pre )) (PreH6 : (qc4_same_value x_pre y_pre )) ,
  TT && emp 
|--
  “ (qc4_ret_one 1 ) ”
  &&  emp
) \/
(
forall (y_pre: fp32) (x_pre: fp32) (retval: fp32) (retval_2: fp32) (PreH1 : (fp32_ne y_pre retval_2 )) (PreH2 : (fp32_ne x_pre retval )) (PreH3 : (fp32_ne x_pre y_pre )) (PreH4 : (qc4_bit_same retval_2 y_pre )) (PreH5 : (qc4_bit_same retval x_pre )) (PreH6 : (qc4_same_value x_pre y_pre )) ,
  TT && emp 
|--
  “ (qc4_ret_one 1 ) ”
  &&  emp
).

Definition qc4_same_lane_return_wit_3_split_goal_1 := 
forall (y_pre: fp32) (x_pre: fp32) (retval: fp32) (retval_2: fp32) (PreH1 : (fp32_ne y_pre retval_2 )) (PreH2 : (fp32_ne x_pre retval )) (PreH3 : (fp32_ne x_pre y_pre )) (PreH4 : (qc4_bit_same retval_2 y_pre )) (PreH5 : (qc4_bit_same retval x_pre )) (PreH6 : (qc4_same_value x_pre y_pre )) ,
  (qc4_ret_one 1 )
.

Definition qc4_same_lane_return_wit_4 := 
(
forall (y_pre: fp32) (x_pre: fp32) (retval: fp32) (retval_2: fp32) (PreH1 : (fp32_eq x_pre y_pre )) (PreH2 : (qc4_bit_same retval_2 y_pre )) (PreH3 : (qc4_bit_same retval x_pre )) (PreH4 : (qc4_same_value x_pre y_pre )) ,
  TT && emp 
|--
  “ (qc4_ret_one 1 ) ”
  &&  emp
) \/
(
forall (y_pre: fp32) (x_pre: fp32) (retval: fp32) (retval_2: fp32) (PreH1 : (fp32_eq x_pre y_pre )) (PreH2 : (qc4_bit_same retval_2 y_pre )) (PreH3 : (qc4_bit_same retval x_pre )) (PreH4 : (qc4_same_value x_pre y_pre )) ,
  TT && emp 
|--
  “ (qc4_ret_one 1 ) ”
  &&  emp
).

Definition qc4_same_lane_return_wit_4_split_goal_1 := 
forall (y_pre: fp32) (x_pre: fp32) (retval: fp32) (retval_2: fp32) (PreH1 : (fp32_eq x_pre y_pre )) (PreH2 : (qc4_bit_same retval_2 y_pre )) (PreH3 : (qc4_bit_same retval x_pre )) (PreH4 : (qc4_same_value x_pre y_pre )) ,
  (qc4_ret_one 1 )
.

Definition qc4_same_lane_partial_solve_wit_1 := 
forall (y_pre: fp32) (x_pre: fp32) (PreH1 : (qc4_same_value x_pre y_pre )) ,
  TT && emp 
|--
  “ (qc4_same_value x_pre y_pre ) ”
  &&  emp
.

Definition qc4_same_lane_partial_solve_wit_2 := 
forall (y_pre: fp32) (x_pre: fp32) (retval: fp32) (PreH1 : (qc4_bit_same retval x_pre )) (PreH2 : (qc4_same_value x_pre y_pre )) ,
  TT && emp 
|--
  “ (qc4_bit_same retval x_pre ) ” 
  &&  “ (qc4_same_value x_pre y_pre ) ”
  &&  emp
.

(*----- Function qc4_compare_outputs -----*)

Definition qc4_compare_outputs_safety_wit_1 := 
forall (right_pre: Z) (left_pre: Z) (n_pre: Z) (R: (@list fp32)) (L: (@list fp32)) (PreH1 : (0 < n_pre)) (PreH2 : (n_pre <= 4611686018427387903)) (PreH3 : (qc4_outputs_related L R )) ,
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

Definition qc4_compare_outputs_safety_wit_2 := 
forall (right_pre: Z) (left_pre: Z) (n_pre: Z) (R: (@list fp32)) (L: (@list fp32)) (i: Z) (retval: Z)  __default_fp32 (PreH1 : (retval = 0)) (PreH2 : (qc4_ret_one retval )) (PreH3 : (0 <= i)) (PreH4 : (i < n_pre)) (PreH5 : (qc4_same_value (Znth i L __default_fp32) (Znth i R __default_fp32) )) (PreH6 : (0 <= i)) (PreH7 : (i < n_pre)) (PreH8 : (i < n_pre)) (PreH9 : (0 < n_pre)) (PreH10 : (n_pre <= 4611686018427387903)) (PreH11 : (0 <= i)) (PreH12 : (i <= n_pre)) (PreH13 : ((Zlength (L)) = n_pre)) (PreH14 : (qc4_outputs_related L R )) (PreH15 : (0 < n_pre)) (PreH16 : (n_pre <= 4611686018427387903)) (PreH17 : (qc4_outputs_related L R )) ,
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

Definition qc4_compare_outputs_safety_wit_3 := 
forall (right_pre: Z) (left_pre: Z) (n_pre: Z) (R: (@list fp32)) (L: (@list fp32)) (i: Z) (PreH1 : (i >= n_pre)) (PreH2 : (0 < n_pre)) (PreH3 : (n_pre <= 4611686018427387903)) (PreH4 : (0 <= i)) (PreH5 : (i <= n_pre)) (PreH6 : ((Zlength (L)) = n_pre)) (PreH7 : (qc4_outputs_related L R )) (PreH8 : (0 < n_pre)) (PreH9 : (n_pre <= 4611686018427387903)) (PreH10 : (qc4_outputs_related L R )) ,
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

Definition qc4_compare_outputs_entail_wit_1 := 
(
forall (right_pre: Z) (left_pre: Z) (n_pre: Z) (R: (@list fp32)) (L: (@list fp32)) (PreH1 : (0 < n_pre)) (PreH2 : (n_pre <= 4611686018427387903)) (PreH3 : (qc4_outputs_related L R )) ,
  (FloatArray.full left_pre n_pre L )
  **  (FloatArray.full right_pre n_pre R )
|--
  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 4611686018427387903) ” 
  &&  “ (0 <= 0) ” 
  &&  “ (0 <= n_pre) ” 
  &&  “ ((Zlength (L)) = n_pre) ” 
  &&  “ (qc4_outputs_related L R ) ” 
  &&  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 4611686018427387903) ” 
  &&  “ (qc4_outputs_related L R ) ”
  &&  (FloatArray.full left_pre n_pre L )
  **  (FloatArray.full right_pre n_pre R )
) \/
(
forall (n_pre: Z) (R: (@list fp32)) (L: (@list fp32)) (PreH1 : (0 < n_pre)) (PreH2 : (n_pre <= 4611686018427387903)) (PreH3 : (qc4_outputs_related L R )) ,
  TT && emp 
|--
  “ ((Zlength (L)) = n_pre) ”
  &&  emp
).

Definition qc4_compare_outputs_entail_wit_1_split_goal_1 := 
forall (n_pre: Z) (R: (@list fp32)) (L: (@list fp32)) (PreH1 : (0 < n_pre)) (PreH2 : (n_pre <= 4611686018427387903)) (PreH3 : (qc4_outputs_related L R )) ,
  ((Zlength (L)) = n_pre)
.

Definition qc4_compare_outputs_entail_wit_2 := 
forall (right_pre: Z) (left_pre: Z) (n_pre: Z) (R: (@list fp32)) (L: (@list fp32)) (i: Z) (retval: Z)  __default_fp32 (PreH1 : (retval <> 0)) (PreH2 : (qc4_ret_one retval )) (PreH3 : (0 <= i)) (PreH4 : (i < n_pre)) (PreH5 : (qc4_same_value (Znth i L __default_fp32) (Znth i R __default_fp32) )) (PreH6 : (0 <= i)) (PreH7 : (i < n_pre)) (PreH8 : (i < n_pre)) (PreH9 : (0 < n_pre)) (PreH10 : (n_pre <= 4611686018427387903)) (PreH11 : (0 <= i)) (PreH12 : (i <= n_pre)) (PreH13 : ((Zlength (L)) = n_pre)) (PreH14 : (qc4_outputs_related L R )) (PreH15 : (0 < n_pre)) (PreH16 : (n_pre <= 4611686018427387903)) (PreH17 : (qc4_outputs_related L R )) ,
  (FloatArray.full left_pre n_pre L )
  **  (FloatArray.full right_pre n_pre R )
|--
  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 4611686018427387903) ” 
  &&  “ (0 <= (i + 1 )) ” 
  &&  “ ((i + 1 ) <= n_pre) ” 
  &&  “ ((Zlength (L)) = n_pre) ” 
  &&  “ (qc4_outputs_related L R ) ” 
  &&  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 4611686018427387903) ” 
  &&  “ (qc4_outputs_related L R ) ”
  &&  (FloatArray.full left_pre n_pre L )
  **  (FloatArray.full right_pre n_pre R )
.

Definition qc4_compare_outputs_return_wit_1 := 
(
forall (right_pre: Z) (left_pre: Z) (n_pre: Z) (R: (@list fp32)) (L: (@list fp32)) (i: Z) (PreH1 : (i >= n_pre)) (PreH2 : (0 < n_pre)) (PreH3 : (n_pre <= 4611686018427387903)) (PreH4 : (0 <= i)) (PreH5 : (i <= n_pre)) (PreH6 : ((Zlength (L)) = n_pre)) (PreH7 : (qc4_outputs_related L R )) (PreH8 : (0 < n_pre)) (PreH9 : (n_pre <= 4611686018427387903)) (PreH10 : (qc4_outputs_related L R )) ,
  (FloatArray.full left_pre n_pre L )
  **  (FloatArray.full right_pre n_pre R )
|--
  “ (qc4_ret_one 1 ) ”
  &&  (FloatArray.full left_pre n_pre L )
  **  (FloatArray.full right_pre n_pre R )
) \/
(
forall (n_pre: Z) (R: (@list fp32)) (L: (@list fp32)) (i: Z) (PreH1 : (i >= n_pre)) (PreH2 : (0 < n_pre)) (PreH3 : (n_pre <= 4611686018427387903)) (PreH4 : (0 <= i)) (PreH5 : (i <= n_pre)) (PreH6 : ((Zlength (L)) = n_pre)) (PreH7 : (qc4_outputs_related L R )) (PreH8 : (0 < n_pre)) (PreH9 : (n_pre <= 4611686018427387903)) (PreH10 : (qc4_outputs_related L R )) ,
  TT && emp 
|--
  “ (qc4_ret_one 1 ) ”
  &&  emp
).

Definition qc4_compare_outputs_return_wit_1_split_goal_1 := 
forall (n_pre: Z) (R: (@list fp32)) (L: (@list fp32)) (i: Z) (PreH1 : (i >= n_pre)) (PreH2 : (0 < n_pre)) (PreH3 : (n_pre <= 4611686018427387903)) (PreH4 : (0 <= i)) (PreH5 : (i <= n_pre)) (PreH6 : ((Zlength (L)) = n_pre)) (PreH7 : (qc4_outputs_related L R )) (PreH8 : (0 < n_pre)) (PreH9 : (n_pre <= 4611686018427387903)) (PreH10 : (qc4_outputs_related L R )) ,
  (qc4_ret_one 1 )
.

Definition qc4_compare_outputs_return_wit_2 := 
forall (right_pre: Z) (left_pre: Z) (n_pre: Z) (R: (@list fp32)) (L: (@list fp32)) (i: Z) (retval: Z)  __default_fp32 (PreH1 : (retval = 0)) (PreH2 : (qc4_ret_one retval )) (PreH3 : (0 <= i)) (PreH4 : (i < n_pre)) (PreH5 : (qc4_same_value (Znth i L __default_fp32) (Znth i R __default_fp32) )) (PreH6 : (0 <= i)) (PreH7 : (i < n_pre)) (PreH8 : (i < n_pre)) (PreH9 : (0 < n_pre)) (PreH10 : (n_pre <= 4611686018427387903)) (PreH11 : (0 <= i)) (PreH12 : (i <= n_pre)) (PreH13 : ((Zlength (L)) = n_pre)) (PreH14 : (qc4_outputs_related L R )) (PreH15 : (0 < n_pre)) (PreH16 : (n_pre <= 4611686018427387903)) (PreH17 : (qc4_outputs_related L R )) ,
  (FloatArray.full left_pre n_pre L )
  **  (FloatArray.full right_pre n_pre R )
|--
  “ (qc4_ret_one 0 ) ”
  &&  (FloatArray.full left_pre n_pre L )
  **  (FloatArray.full right_pre n_pre R )
.

Definition qc4_compare_outputs_partial_solve_wit_1_pure := 
forall (right_pre: Z) (left_pre: Z) (n_pre: Z) (R: (@list fp32)) (L: (@list fp32)) (i: Z) (PreH1 : (i < n_pre)) (PreH2 : (0 < n_pre)) (PreH3 : (n_pre <= 4611686018427387903)) (PreH4 : (0 <= i)) (PreH5 : (i <= n_pre)) (PreH6 : ((Zlength (L)) = n_pre)) (PreH7 : (qc4_outputs_related L R )) (PreH8 : (0 < n_pre)) (PreH9 : (n_pre <= 4611686018427387903)) (PreH10 : (qc4_outputs_related L R )) ,
  ((( &( "n" ) )) # UInt64  |-> n_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i)
  **  (FloatArray.full left_pre n_pre L )
  **  (FloatArray.full right_pre n_pre R )
|--
  “ (0 <= i) ” 
  &&  “ (i < n_pre) ” 
  &&  “ (qc4_outputs_related L R ) ”
.

Definition qc4_compare_outputs_partial_solve_wit_1_aux := 
forall (right_pre: Z) (left_pre: Z) (n_pre: Z) (R: (@list fp32)) (L: (@list fp32)) (i: Z) (PreH1 : (i < n_pre)) (PreH2 : (0 < n_pre)) (PreH3 : (n_pre <= 4611686018427387903)) (PreH4 : (0 <= i)) (PreH5 : (i <= n_pre)) (PreH6 : ((Zlength (L)) = n_pre)) (PreH7 : (qc4_outputs_related L R )) (PreH8 : (0 < n_pre)) (PreH9 : (n_pre <= 4611686018427387903)) (PreH10 : (qc4_outputs_related L R )) ,
  (FloatArray.full left_pre n_pre L )
  **  (FloatArray.full right_pre n_pre R )
|--
  “ (0 <= i) ” 
  &&  “ (i < n_pre) ” 
  &&  “ (qc4_outputs_related L R ) ” 
  &&  “ (i < n_pre) ” 
  &&  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 4611686018427387903) ” 
  &&  “ (0 <= i) ” 
  &&  “ (i <= n_pre) ” 
  &&  “ ((Zlength (L)) = n_pre) ” 
  &&  “ (qc4_outputs_related L R ) ” 
  &&  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 4611686018427387903) ” 
  &&  “ (qc4_outputs_related L R ) ”
  &&  (FloatArray.full left_pre n_pre L )
  **  (FloatArray.full right_pre n_pre R )
.

Definition qc4_compare_outputs_partial_solve_wit_1 := qc4_compare_outputs_partial_solve_wit_1_pure -> qc4_compare_outputs_partial_solve_wit_1_aux.

Definition qc4_compare_outputs_partial_solve_wit_2_pure := 
forall (right_pre: Z) (left_pre: Z) (n_pre: Z) (R: (@list fp32)) (L: (@list fp32)) (i: Z)  __default_fp32 (PreH1 : (qc4_same_value (Znth i L __default_fp32) (Znth i R __default_fp32) )) (PreH2 : (0 <= i)) (PreH3 : (i < n_pre)) (PreH4 : (i < n_pre)) (PreH5 : (0 < n_pre)) (PreH6 : (n_pre <= 4611686018427387903)) (PreH7 : (0 <= i)) (PreH8 : (i <= n_pre)) (PreH9 : ((Zlength (L)) = n_pre)) (PreH10 : (qc4_outputs_related L R )) (PreH11 : (0 < n_pre)) (PreH12 : (n_pre <= 4611686018427387903)) (PreH13 : (qc4_outputs_related L R )) ,
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

Definition qc4_compare_outputs_partial_solve_wit_2_aux := 
forall (right_pre: Z) (left_pre: Z) (n_pre: Z) (R: (@list fp32)) (L: (@list fp32)) (i: Z)  __default_fp32 (PreH1 : (qc4_same_value (Znth i L __default_fp32) (Znth i R __default_fp32) )) (PreH2 : (0 <= i)) (PreH3 : (i < n_pre)) (PreH4 : (i < n_pre)) (PreH5 : (0 < n_pre)) (PreH6 : (n_pre <= 4611686018427387903)) (PreH7 : (0 <= i)) (PreH8 : (i <= n_pre)) (PreH9 : ((Zlength (L)) = n_pre)) (PreH10 : (qc4_outputs_related L R )) (PreH11 : (0 < n_pre)) (PreH12 : (n_pre <= 4611686018427387903)) (PreH13 : (qc4_outputs_related L R )) ,
  (FloatArray.missing_i left_pre i 0 n_pre L )
  **  (((left_pre + (i * sizeof(FLOAT)))) # Float  |-> (Znth i L __default_fp32))
  **  (FloatArray.missing_i right_pre i 0 n_pre R )
  **  (((right_pre + (i * sizeof(FLOAT)))) # Float  |-> (Znth i R __default_fp32))
|--
  “ (0 <= i) ” 
  &&  “ (i < n_pre) ” 
  &&  “ (qc4_same_value (Znth i L __default_fp32) (Znth i R __default_fp32) ) ” 
  &&  “ (0 <= i) ” 
  &&  “ (i < n_pre) ” 
  &&  “ (i < n_pre) ” 
  &&  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 4611686018427387903) ” 
  &&  “ (0 <= i) ” 
  &&  “ (i <= n_pre) ” 
  &&  “ ((Zlength (L)) = n_pre) ” 
  &&  “ (qc4_outputs_related L R ) ” 
  &&  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 4611686018427387903) ” 
  &&  “ (qc4_outputs_related L R ) ”
  &&  (FloatArray.missing_i left_pre i 0 n_pre L )
  **  (((left_pre + (i * sizeof(FLOAT)))) # Float  |-> (Znth i L __default_fp32))
  **  (FloatArray.missing_i right_pre i 0 n_pre R )
  **  (((right_pre + (i * sizeof(FLOAT)))) # Float  |-> (Znth i R __default_fp32))
.

Definition qc4_compare_outputs_partial_solve_wit_2 := qc4_compare_outputs_partial_solve_wit_2_pure -> qc4_compare_outputs_partial_solve_wit_2_aux.

Definition qc4_compare_outputs_partial_solve_wit_3_pure := 
forall (right_pre: Z) (left_pre: Z) (n_pre: Z) (R: (@list fp32)) (L: (@list fp32)) (i: Z)  __default_fp32 (PreH1 : (0 <= i)) (PreH2 : (i < n_pre)) (PreH3 : (qc4_same_value (Znth i L __default_fp32) (Znth i R __default_fp32) )) (PreH4 : (0 <= i)) (PreH5 : (i < n_pre)) (PreH6 : (i < n_pre)) (PreH7 : (0 < n_pre)) (PreH8 : (n_pre <= 4611686018427387903)) (PreH9 : (0 <= i)) (PreH10 : (i <= n_pre)) (PreH11 : ((Zlength (L)) = n_pre)) (PreH12 : (qc4_outputs_related L R )) (PreH13 : (0 < n_pre)) (PreH14 : (n_pre <= 4611686018427387903)) (PreH15 : (qc4_outputs_related L R )) ,
  ((( &( "i" ) )) # UInt64  |-> i)
  **  ((( &( "n" ) )) # UInt64  |-> n_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  (FloatArray.full left_pre n_pre L )
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  (FloatArray.full right_pre n_pre R )
  **  ((( &( "y" ) )) # Float  |-> (Znth i R __default_fp32))
  **  ((( &( "x" ) )) # Float  |-> (Znth i L __default_fp32))
|--
  “ (qc4_same_value (Znth i L __default_fp32) (Znth i R __default_fp32) ) ”
.

Definition qc4_compare_outputs_partial_solve_wit_3_aux := 
forall (right_pre: Z) (left_pre: Z) (n_pre: Z) (R: (@list fp32)) (L: (@list fp32)) (i: Z)  __default_fp32 (PreH1 : (0 <= i)) (PreH2 : (i < n_pre)) (PreH3 : (qc4_same_value (Znth i L __default_fp32) (Znth i R __default_fp32) )) (PreH4 : (0 <= i)) (PreH5 : (i < n_pre)) (PreH6 : (i < n_pre)) (PreH7 : (0 < n_pre)) (PreH8 : (n_pre <= 4611686018427387903)) (PreH9 : (0 <= i)) (PreH10 : (i <= n_pre)) (PreH11 : ((Zlength (L)) = n_pre)) (PreH12 : (qc4_outputs_related L R )) (PreH13 : (0 < n_pre)) (PreH14 : (n_pre <= 4611686018427387903)) (PreH15 : (qc4_outputs_related L R )) ,
  (FloatArray.full left_pre n_pre L )
  **  (FloatArray.full right_pre n_pre R )
|--
  “ (qc4_same_value (Znth i L __default_fp32) (Znth i R __default_fp32) ) ” 
  &&  “ (0 <= i) ” 
  &&  “ (i < n_pre) ” 
  &&  “ (qc4_same_value (Znth i L __default_fp32) (Znth i R __default_fp32) ) ” 
  &&  “ (0 <= i) ” 
  &&  “ (i < n_pre) ” 
  &&  “ (i < n_pre) ” 
  &&  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 4611686018427387903) ” 
  &&  “ (0 <= i) ” 
  &&  “ (i <= n_pre) ” 
  &&  “ ((Zlength (L)) = n_pre) ” 
  &&  “ (qc4_outputs_related L R ) ” 
  &&  “ (0 < n_pre) ” 
  &&  “ (n_pre <= 4611686018427387903) ” 
  &&  “ (qc4_outputs_related L R ) ”
  &&  (FloatArray.full left_pre n_pre L )
  **  (FloatArray.full right_pre n_pre R )
.

Definition qc4_compare_outputs_partial_solve_wit_3 := qc4_compare_outputs_partial_solve_wit_3_pure -> qc4_compare_outputs_partial_solve_wit_3_aux.

Definition qc4_compare_outputs_which_implies_wit_1 := 
(
forall (R: (@list fp32)) (L: (@list fp32)) (i: Z) (n: Z) (left: Z) (right: Z)  __default_fp32 (PreH1 : (0 <= i)) (PreH2 : (i < n)) (PreH3 : (qc4_outputs_related L R )) ,
  (FloatArray.full left n L )
  **  (FloatArray.full right n R )
|--
  “ (qc4_same_value (Znth i L __default_fp32) (Znth i R __default_fp32) ) ” 
  &&  “ (0 <= i) ” 
  &&  “ (i < n) ”
  &&  (FloatArray.missing_i left i 0 n L )
  **  (((left + (i * sizeof(FLOAT)))) # Float  |-> (Znth i L __default_fp32))
  **  (FloatArray.missing_i right i 0 n R )
  **  (((right + (i * sizeof(FLOAT)))) # Float  |-> (Znth i R __default_fp32))
) \/
(
forall (R: (@list fp32)) (L: (@list fp32)) (i: Z) (n: Z) (left: Z) (right: Z)  __default_fp32 (PreH1 : (0 <= i)) (PreH2 : (i < n)) (PreH3 : (qc4_outputs_related L R )) ,
  (FloatArray.full left n L )
  **  (FloatArray.full right n R )
|--
  “ (qc4_same_value (Znth i L __default_fp32) (Znth i R __default_fp32) ) ”
  &&  (FloatArray.missing_i left i 0 n L )
  **  (((left + (i * sizeof(FLOAT)))) # Float  |-> (Znth i L __default_fp32))
  **  (FloatArray.missing_i right i 0 n R )
  **  (((right + (i * sizeof(FLOAT)))) # Float  |-> (Znth i R __default_fp32))
).

Definition qc4_compare_outputs_which_implies_wit_1_split_goal_1 := 
forall (R: (@list fp32)) (L: (@list fp32)) (i: Z) (n: Z) (left: Z) (right: Z)  __default_fp32 (PreH1 : (0 <= i)) (PreH2 : (i < n)) (PreH3 : (qc4_outputs_related L R )) ,
  (FloatArray.full left n L )
  **  (FloatArray.full right n R )
|--
  “ (qc4_same_value (Znth i L __default_fp32) (Znth i R __default_fp32) ) ”
.

Definition qc4_compare_outputs_which_implies_wit_1_split_goal_spatial := 
forall (R: (@list fp32)) (L: (@list fp32)) (i: Z) (n: Z) (left: Z) (right: Z)  __default_fp32 (PreH1 : (0 <= i)) (PreH2 : (i < n)) (PreH3 : (qc4_outputs_related L R )) ,
  (FloatArray.full left n L )
  **  (FloatArray.full right n R )
|--
  (FloatArray.missing_i left i 0 n L )
  **  (((left + (i * sizeof(FLOAT)))) # Float  |-> (Znth i L __default_fp32))
  **  (FloatArray.missing_i right i 0 n R )
  **  (((right + (i * sizeof(FLOAT)))) # Float  |-> (Znth i R __default_fp32))
.

Definition qc4_compare_outputs_which_implies_wit_2 := 
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

Definition qc4_compare_outputs_which_implies_wit_2_split_goal_spatial := 
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
forall (quantization_params_pre: Z) (params_pre: Z) (right_pre: Z) (left_pre: Z) (w_pre: Z) (a_pre: Z) (kc_pre: Z) (nc_pre: Z) (mr_pre: Z) (hi: fp32) (lo: fp32) (inv: fp32) (zp: Z) (Ps: (@list qc4_panel)) (A: (@list Z)) (PreH1 : (qc4_domain_shape mr_pre nc_pre kc_pre Ps )) (PreH2 : (qc4_data_capacity nc_pre kc_pre a_pre w_pre left_pre )) (PreH3 : (qc4_data_capacity nc_pre kc_pre a_pre w_pre right_pre )) (PreH4 : (a_pre <> 0)) (PreH5 : (w_pre <> 0)) (PreH6 : (left_pre <> 0)) (PreH7 : (right_pre <> 0)) (PreH8 : (params_pre <> 0)) (PreH9 : (quantization_params_pre <> 0)) ,
  ((( &( "mr" ) )) # UInt64  |-> mr_pre)
  **  ((( &( "nc" ) )) # UInt64  |-> nc_pre)
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "w" ) )) # Ptr  |-> w_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "quantization_params" ) )) # Ptr  |-> quantization_params_pre)
  **  (CharArray.full a_pre (qc4_a_extent (kc_pre)) A )
  **  (qc4_packed kc_pre w_pre Ps )
  **  (FloatArray.undef_full left_pre nc_pre )
  **  (FloatArray.undef_full right_pre nc_pre )
  **  ((&((params_pre)  # "xnn_f32_qc4w_minmax_params" ->ₛ "scalar" .ₛ "min")) # Float  |-> lo)
  **  ((&((params_pre)  # "xnn_f32_qc4w_minmax_params" ->ₛ "scalar" .ₛ "max")) # Float  |-> hi)
  **  ((&(((quantization_params_pre + (0 * sizeof( "xnn_qd8_quantization_params" ))))  # "xnn_qd8_quantization_params" ->ₛ "zero_point")) # Int  |-> zp)
  **  ((&(((quantization_params_pre + (0 * sizeof( "xnn_qd8_quantization_params" ))))  # "xnn_qd8_quantization_params" ->ₛ "inv_scale")) # Float  |-> inv)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition equivalent_safety_wit_2 := 
forall (quantization_params_pre: Z) (params_pre: Z) (right_pre: Z) (left_pre: Z) (w_pre: Z) (a_pre: Z) (kc_pre: Z) (nc_pre: Z) (mr_pre: Z) (hi: fp32) (lo: fp32) (inv: fp32) (zp: Z) (Ps: (@list qc4_panel)) (A: (@list Z)) (PreH1 : (qc4_domain_shape mr_pre nc_pre kc_pre Ps )) (PreH2 : (qc4_data_capacity nc_pre kc_pre a_pre w_pre left_pre )) (PreH3 : (qc4_data_capacity nc_pre kc_pre a_pre w_pre right_pre )) (PreH4 : (a_pre <> 0)) (PreH5 : (w_pre <> 0)) (PreH6 : (left_pre <> 0)) (PreH7 : (right_pre <> 0)) (PreH8 : (params_pre <> 0)) (PreH9 : (quantization_params_pre <> 0)) ,
  ((( &( "mr" ) )) # UInt64  |-> mr_pre)
  **  ((( &( "nc" ) )) # UInt64  |-> nc_pre)
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "w" ) )) # Ptr  |-> w_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "quantization_params" ) )) # Ptr  |-> quantization_params_pre)
  **  (CharArray.full a_pre (qc4_a_extent (kc_pre)) A )
  **  (qc4_packed kc_pre w_pre Ps )
  **  (FloatArray.undef_full left_pre nc_pre )
  **  (FloatArray.undef_full right_pre nc_pre )
  **  ((&((params_pre)  # "xnn_f32_qc4w_minmax_params" ->ₛ "scalar" .ₛ "min")) # Float  |-> lo)
  **  ((&((params_pre)  # "xnn_f32_qc4w_minmax_params" ->ₛ "scalar" .ₛ "max")) # Float  |-> hi)
  **  ((&(((quantization_params_pre + (0 * sizeof( "xnn_qd8_quantization_params" ))))  # "xnn_qd8_quantization_params" ->ₛ "zero_point")) # Int  |-> zp)
  **  ((&(((quantization_params_pre + (0 * sizeof( "xnn_qd8_quantization_params" ))))  # "xnn_qd8_quantization_params" ->ₛ "inv_scale")) # Float  |-> inv)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition equivalent_safety_wit_3 := 
forall (quantization_params_pre: Z) (params_pre: Z) (right_pre: Z) (left_pre: Z) (w_pre: Z) (a_pre: Z) (kc_pre: Z) (nc_pre: Z) (mr_pre: Z) (hi: fp32) (lo: fp32) (inv: fp32) (zp: Z) (Ps: (@list qc4_panel)) (A: (@list Z)) (PreH1 : (qc4_domain_shape mr_pre nc_pre kc_pre Ps )) (PreH2 : (qc4_data_capacity nc_pre kc_pre a_pre w_pre left_pre )) (PreH3 : (qc4_data_capacity nc_pre kc_pre a_pre w_pre right_pre )) (PreH4 : (a_pre <> 0)) (PreH5 : (w_pre <> 0)) (PreH6 : (left_pre <> 0)) (PreH7 : (right_pre <> 0)) (PreH8 : (params_pre <> 0)) (PreH9 : (quantization_params_pre <> 0)) ,
  ((( &( "mr" ) )) # UInt64  |-> mr_pre)
  **  ((( &( "nc" ) )) # UInt64  |-> nc_pre)
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "w" ) )) # Ptr  |-> w_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "quantization_params" ) )) # Ptr  |-> quantization_params_pre)
  **  (CharArray.full a_pre (qc4_a_extent (kc_pre)) A )
  **  (qc4_packed kc_pre w_pre Ps )
  **  (FloatArray.undef_full left_pre nc_pre )
  **  (FloatArray.undef_full right_pre nc_pre )
  **  ((&((params_pre)  # "xnn_f32_qc4w_minmax_params" ->ₛ "scalar" .ₛ "min")) # Float  |-> lo)
  **  ((&((params_pre)  # "xnn_f32_qc4w_minmax_params" ->ₛ "scalar" .ₛ "max")) # Float  |-> hi)
  **  ((&(((quantization_params_pre + (0 * sizeof( "xnn_qd8_quantization_params" ))))  # "xnn_qd8_quantization_params" ->ₛ "zero_point")) # Int  |-> zp)
  **  ((&(((quantization_params_pre + (0 * sizeof( "xnn_qd8_quantization_params" ))))  # "xnn_qd8_quantization_params" ->ₛ "inv_scale")) # Float  |-> inv)
|--
  “ (64 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 64) ”
.

Definition equivalent_safety_wit_4 := 
forall (quantization_params_pre: Z) (params_pre: Z) (right_pre: Z) (left_pre: Z) (w_pre: Z) (a_pre: Z) (kc_pre: Z) (nc_pre: Z) (mr_pre: Z) (hi: fp32) (lo: fp32) (inv: fp32) (zp: Z) (Ps: (@list qc4_panel)) (A: (@list Z)) (PreH1 : (qc4_domain_shape mr_pre nc_pre kc_pre Ps )) (PreH2 : (qc4_data_capacity nc_pre kc_pre a_pre w_pre left_pre )) (PreH3 : (qc4_data_capacity nc_pre kc_pre a_pre w_pre right_pre )) (PreH4 : (a_pre <> 0)) (PreH5 : (w_pre <> 0)) (PreH6 : (left_pre <> 0)) (PreH7 : (right_pre <> 0)) (PreH8 : (params_pre <> 0)) (PreH9 : (quantization_params_pre <> 0)) ,
  (CharArray.full a_pre (qc4_a_extent (kc_pre)) A )
  **  (qc4_packed kc_pre w_pre Ps )
  **  (qc4_output_ref left_pre kc_pre nc_pre zp A Ps inv lo hi )
  **  ((&((params_pre)  # "xnn_f32_qc4w_minmax_params" ->ₛ "scalar" .ₛ "min")) # Float  |-> lo)
  **  ((&((params_pre)  # "xnn_f32_qc4w_minmax_params" ->ₛ "scalar" .ₛ "max")) # Float  |-> hi)
  **  ((&(((quantization_params_pre + (0 * sizeof( "xnn_qd8_quantization_params" ))))  # "xnn_qd8_quantization_params" ->ₛ "zero_point")) # Int  |-> zp)
  **  ((&(((quantization_params_pre + (0 * sizeof( "xnn_qd8_quantization_params" ))))  # "xnn_qd8_quantization_params" ->ₛ "inv_scale")) # Float  |-> inv)
  **  ((( &( "mr" ) )) # UInt64  |-> mr_pre)
  **  ((( &( "nc" ) )) # UInt64  |-> nc_pre)
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "w" ) )) # Ptr  |-> w_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "quantization_params" ) )) # Ptr  |-> quantization_params_pre)
  **  (FloatArray.undef_full right_pre nc_pre )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition equivalent_safety_wit_5 := 
forall (quantization_params_pre: Z) (params_pre: Z) (right_pre: Z) (left_pre: Z) (w_pre: Z) (a_pre: Z) (kc_pre: Z) (nc_pre: Z) (mr_pre: Z) (hi: fp32) (lo: fp32) (inv: fp32) (zp: Z) (Ps: (@list qc4_panel)) (A: (@list Z)) (PreH1 : (qc4_domain_shape mr_pre nc_pre kc_pre Ps )) (PreH2 : (qc4_data_capacity nc_pre kc_pre a_pre w_pre left_pre )) (PreH3 : (qc4_data_capacity nc_pre kc_pre a_pre w_pre right_pre )) (PreH4 : (a_pre <> 0)) (PreH5 : (w_pre <> 0)) (PreH6 : (left_pre <> 0)) (PreH7 : (right_pre <> 0)) (PreH8 : (params_pre <> 0)) (PreH9 : (quantization_params_pre <> 0)) ,
  (CharArray.full a_pre (qc4_a_extent (kc_pre)) A )
  **  (qc4_packed kc_pre w_pre Ps )
  **  (qc4_output_ref left_pre kc_pre nc_pre zp A Ps inv lo hi )
  **  ((&((params_pre)  # "xnn_f32_qc4w_minmax_params" ->ₛ "scalar" .ₛ "min")) # Float  |-> lo)
  **  ((&((params_pre)  # "xnn_f32_qc4w_minmax_params" ->ₛ "scalar" .ₛ "max")) # Float  |-> hi)
  **  ((&(((quantization_params_pre + (0 * sizeof( "xnn_qd8_quantization_params" ))))  # "xnn_qd8_quantization_params" ->ₛ "zero_point")) # Int  |-> zp)
  **  ((&(((quantization_params_pre + (0 * sizeof( "xnn_qd8_quantization_params" ))))  # "xnn_qd8_quantization_params" ->ₛ "inv_scale")) # Float  |-> inv)
  **  ((( &( "mr" ) )) # UInt64  |-> mr_pre)
  **  ((( &( "nc" ) )) # UInt64  |-> nc_pre)
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "w" ) )) # Ptr  |-> w_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "quantization_params" ) )) # Ptr  |-> quantization_params_pre)
  **  (FloatArray.undef_full right_pre nc_pre )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition equivalent_safety_wit_6 := 
forall (quantization_params_pre: Z) (params_pre: Z) (right_pre: Z) (left_pre: Z) (w_pre: Z) (a_pre: Z) (kc_pre: Z) (nc_pre: Z) (mr_pre: Z) (hi: fp32) (lo: fp32) (inv: fp32) (zp: Z) (Ps: (@list qc4_panel)) (A: (@list Z)) (PreH1 : (qc4_domain_shape mr_pre nc_pre kc_pre Ps )) (PreH2 : (qc4_data_capacity nc_pre kc_pre a_pre w_pre left_pre )) (PreH3 : (qc4_data_capacity nc_pre kc_pre a_pre w_pre right_pre )) (PreH4 : (a_pre <> 0)) (PreH5 : (w_pre <> 0)) (PreH6 : (left_pre <> 0)) (PreH7 : (right_pre <> 0)) (PreH8 : (params_pre <> 0)) (PreH9 : (quantization_params_pre <> 0)) ,
  (CharArray.full a_pre (qc4_a_extent (kc_pre)) A )
  **  (qc4_packed kc_pre w_pre Ps )
  **  (qc4_output_ref left_pre kc_pre nc_pre zp A Ps inv lo hi )
  **  ((&((params_pre)  # "xnn_f32_qc4w_minmax_params" ->ₛ "scalar" .ₛ "min")) # Float  |-> lo)
  **  ((&((params_pre)  # "xnn_f32_qc4w_minmax_params" ->ₛ "scalar" .ₛ "max")) # Float  |-> hi)
  **  ((&(((quantization_params_pre + (0 * sizeof( "xnn_qd8_quantization_params" ))))  # "xnn_qd8_quantization_params" ->ₛ "zero_point")) # Int  |-> zp)
  **  ((&(((quantization_params_pre + (0 * sizeof( "xnn_qd8_quantization_params" ))))  # "xnn_qd8_quantization_params" ->ₛ "inv_scale")) # Float  |-> inv)
  **  ((( &( "mr" ) )) # UInt64  |-> mr_pre)
  **  ((( &( "nc" ) )) # UInt64  |-> nc_pre)
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "w" ) )) # Ptr  |-> w_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "quantization_params" ) )) # Ptr  |-> quantization_params_pre)
  **  (FloatArray.undef_full right_pre nc_pre )
|--
  “ (64 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 64) ”
.

Definition equivalent_return_wit_1 := 
(
forall (quantization_params_pre: Z) (params_pre: Z) (right_pre: Z) (left_pre: Z) (w_pre: Z) (a_pre: Z) (kc_pre: Z) (nc_pre: Z) (mr_pre: Z) (hi: fp32) (lo: fp32) (inv: fp32) (zp: Z) (Ps: (@list qc4_panel)) (A: (@list Z)) (L_2: (@list fp32)) (R_2: (@list fp32)) (retval: Z) (PreH1 : (qc4_ret_one retval )) (PreH2 : (0 < kc_pre)) (PreH3 : (qc4_outputs_related L_2 R_2 )) (PreH4 : (qc4_domain_shape mr_pre nc_pre kc_pre Ps )) (PreH5 : (qc4_data_capacity nc_pre kc_pre a_pre w_pre left_pre )) (PreH6 : (qc4_data_capacity nc_pre kc_pre a_pre w_pre right_pre )) (PreH7 : (a_pre <> 0)) (PreH8 : (w_pre <> 0)) (PreH9 : (left_pre <> 0)) (PreH10 : (right_pre <> 0)) (PreH11 : (params_pre <> 0)) (PreH12 : (quantization_params_pre <> 0)) ,
  (FloatArray.full left_pre nc_pre L_2 )
  **  (FloatArray.full right_pre nc_pre R_2 )
  **  (CharArray.full a_pre (qc4_a_extent (kc_pre)) A )
  **  (qc4_packed kc_pre w_pre Ps )
  **  ((&((params_pre)  # "xnn_f32_qc4w_minmax_params" ->ₛ "scalar" .ₛ "min")) # Float  |-> lo)
  **  ((&((params_pre)  # "xnn_f32_qc4w_minmax_params" ->ₛ "scalar" .ₛ "max")) # Float  |-> hi)
  **  ((&(((quantization_params_pre + (0 * sizeof( "xnn_qd8_quantization_params" ))))  # "xnn_qd8_quantization_params" ->ₛ "zero_point")) # Int  |-> zp)
  **  ((&(((quantization_params_pre + (0 * sizeof( "xnn_qd8_quantization_params" ))))  # "xnn_qd8_quantization_params" ->ₛ "inv_scale")) # Float  |-> inv)
|--
  EX (L: (@list fp32))  (R: (@list fp32)) ,
  “ (retval = 1) ” 
  &&  “ (qc4_outputs_related L R ) ”
  &&  (CharArray.full a_pre (qc4_a_extent (kc_pre)) A )
  **  (qc4_packed kc_pre w_pre Ps )
  **  (FloatArray.full left_pre nc_pre L )
  **  (FloatArray.full right_pre nc_pre R )
  **  ((&((params_pre)  # "xnn_f32_qc4w_minmax_params" ->ₛ "scalar" .ₛ "min")) # Float  |-> lo)
  **  ((&((params_pre)  # "xnn_f32_qc4w_minmax_params" ->ₛ "scalar" .ₛ "max")) # Float  |-> hi)
  **  ((&(((quantization_params_pre + (0 * sizeof( "xnn_qd8_quantization_params" ))))  # "xnn_qd8_quantization_params" ->ₛ "zero_point")) # Int  |-> zp)
  **  ((&(((quantization_params_pre + (0 * sizeof( "xnn_qd8_quantization_params" ))))  # "xnn_qd8_quantization_params" ->ₛ "inv_scale")) # Float  |-> inv)
) \/
(
forall (quantization_params_pre: Z) (params_pre: Z) (right_pre: Z) (left_pre: Z) (w_pre: Z) (a_pre: Z) (kc_pre: Z) (nc_pre: Z) (mr_pre: Z) (Ps: (@list qc4_panel)) (L_2: (@list fp32)) (R_2: (@list fp32)) (retval: Z) (PreH1 : (qc4_ret_one retval )) (PreH2 : (0 < kc_pre)) (PreH3 : (qc4_outputs_related L_2 R_2 )) (PreH4 : (qc4_domain_shape mr_pre nc_pre kc_pre Ps )) (PreH5 : (qc4_data_capacity nc_pre kc_pre a_pre w_pre left_pre )) (PreH6 : (qc4_data_capacity nc_pre kc_pre a_pre w_pre right_pre )) (PreH7 : (a_pre <> 0)) (PreH8 : (w_pre <> 0)) (PreH9 : (left_pre <> 0)) (PreH10 : (right_pre <> 0)) (PreH11 : (params_pre <> 0)) (PreH12 : (quantization_params_pre <> 0)) ,
  TT && emp 
|--
  “ (retval = 1) ”
  &&  emp
).

Definition equivalent_return_wit_1_split_goal_1 := 
forall (quantization_params_pre: Z) (params_pre: Z) (right_pre: Z) (left_pre: Z) (w_pre: Z) (a_pre: Z) (kc_pre: Z) (nc_pre: Z) (mr_pre: Z) (Ps: (@list qc4_panel)) (L_2: (@list fp32)) (R_2: (@list fp32)) (retval: Z) (PreH1 : (qc4_ret_one retval )) (PreH2 : (0 < kc_pre)) (PreH3 : (qc4_outputs_related L_2 R_2 )) (PreH4 : (qc4_domain_shape mr_pre nc_pre kc_pre Ps )) (PreH5 : (qc4_data_capacity nc_pre kc_pre a_pre w_pre left_pre )) (PreH6 : (qc4_data_capacity nc_pre kc_pre a_pre w_pre right_pre )) (PreH7 : (a_pre <> 0)) (PreH8 : (w_pre <> 0)) (PreH9 : (left_pre <> 0)) (PreH10 : (right_pre <> 0)) (PreH11 : (params_pre <> 0)) (PreH12 : (quantization_params_pre <> 0)) ,
  (retval = 1)
.

Definition equivalent_partial_solve_wit_1_pure := 
forall (quantization_params_pre: Z) (params_pre: Z) (right_pre: Z) (left_pre: Z) (w_pre: Z) (a_pre: Z) (kc_pre: Z) (nc_pre: Z) (mr_pre: Z) (hi: fp32) (lo: fp32) (inv: fp32) (zp: Z) (Ps: (@list qc4_panel)) (A: (@list Z)) (PreH1 : (qc4_domain_shape mr_pre nc_pre kc_pre Ps )) (PreH2 : (qc4_data_capacity nc_pre kc_pre a_pre w_pre left_pre )) (PreH3 : (qc4_data_capacity nc_pre kc_pre a_pre w_pre right_pre )) (PreH4 : (a_pre <> 0)) (PreH5 : (w_pre <> 0)) (PreH6 : (left_pre <> 0)) (PreH7 : (right_pre <> 0)) (PreH8 : (params_pre <> 0)) (PreH9 : (quantization_params_pre <> 0)) ,
  ((( &( "mr" ) )) # UInt64  |-> mr_pre)
  **  ((( &( "nc" ) )) # UInt64  |-> nc_pre)
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "w" ) )) # Ptr  |-> w_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "quantization_params" ) )) # Ptr  |-> quantization_params_pre)
  **  (CharArray.full a_pre (qc4_a_extent (kc_pre)) A )
  **  (qc4_packed kc_pre w_pre Ps )
  **  (FloatArray.undef_full left_pre nc_pre )
  **  (FloatArray.undef_full right_pre nc_pre )
  **  ((&((params_pre)  # "xnn_f32_qc4w_minmax_params" ->ₛ "scalar" .ₛ "min")) # Float  |-> lo)
  **  ((&((params_pre)  # "xnn_f32_qc4w_minmax_params" ->ₛ "scalar" .ₛ "max")) # Float  |-> hi)
  **  ((&(((quantization_params_pre + (0 * sizeof( "xnn_qd8_quantization_params" ))))  # "xnn_qd8_quantization_params" ->ₛ "zero_point")) # Int  |-> zp)
  **  ((&(((quantization_params_pre + (0 * sizeof( "xnn_qd8_quantization_params" ))))  # "xnn_qd8_quantization_params" ->ₛ "inv_scale")) # Float  |-> inv)
|--
  “ (qc4_domain_shape mr_pre nc_pre kc_pre Ps ) ” 
  &&  “ (qc4_data_capacity nc_pre kc_pre a_pre w_pre left_pre ) ” 
  &&  “ (64 = 64) ” 
  &&  “ (a_pre <> 0) ” 
  &&  “ (w_pre <> 0) ” 
  &&  “ (left_pre <> 0) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (quantization_params_pre <> 0) ”
.

Definition equivalent_partial_solve_wit_1_aux := 
forall (quantization_params_pre: Z) (params_pre: Z) (right_pre: Z) (left_pre: Z) (w_pre: Z) (a_pre: Z) (kc_pre: Z) (nc_pre: Z) (mr_pre: Z) (hi: fp32) (lo: fp32) (inv: fp32) (zp: Z) (Ps: (@list qc4_panel)) (A: (@list Z)) (PreH1 : (qc4_domain_shape mr_pre nc_pre kc_pre Ps )) (PreH2 : (qc4_data_capacity nc_pre kc_pre a_pre w_pre left_pre )) (PreH3 : (qc4_data_capacity nc_pre kc_pre a_pre w_pre right_pre )) (PreH4 : (a_pre <> 0)) (PreH5 : (w_pre <> 0)) (PreH6 : (left_pre <> 0)) (PreH7 : (right_pre <> 0)) (PreH8 : (params_pre <> 0)) (PreH9 : (quantization_params_pre <> 0)) ,
  (CharArray.full a_pre (qc4_a_extent (kc_pre)) A )
  **  (qc4_packed kc_pre w_pre Ps )
  **  (FloatArray.undef_full left_pre nc_pre )
  **  (FloatArray.undef_full right_pre nc_pre )
  **  ((&((params_pre)  # "xnn_f32_qc4w_minmax_params" ->ₛ "scalar" .ₛ "min")) # Float  |-> lo)
  **  ((&((params_pre)  # "xnn_f32_qc4w_minmax_params" ->ₛ "scalar" .ₛ "max")) # Float  |-> hi)
  **  ((&(((quantization_params_pre + (0 * sizeof( "xnn_qd8_quantization_params" ))))  # "xnn_qd8_quantization_params" ->ₛ "zero_point")) # Int  |-> zp)
  **  ((&(((quantization_params_pre + (0 * sizeof( "xnn_qd8_quantization_params" ))))  # "xnn_qd8_quantization_params" ->ₛ "inv_scale")) # Float  |-> inv)
|--
  “ (qc4_domain_shape mr_pre nc_pre kc_pre Ps ) ” 
  &&  “ (qc4_data_capacity nc_pre kc_pre a_pre w_pre left_pre ) ” 
  &&  “ (64 = 64) ” 
  &&  “ (a_pre <> 0) ” 
  &&  “ (w_pre <> 0) ” 
  &&  “ (left_pre <> 0) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (quantization_params_pre <> 0) ” 
  &&  “ (qc4_domain_shape mr_pre nc_pre kc_pre Ps ) ” 
  &&  “ (qc4_data_capacity nc_pre kc_pre a_pre w_pre left_pre ) ” 
  &&  “ (qc4_data_capacity nc_pre kc_pre a_pre w_pre right_pre ) ” 
  &&  “ (a_pre <> 0) ” 
  &&  “ (w_pre <> 0) ” 
  &&  “ (left_pre <> 0) ” 
  &&  “ (right_pre <> 0) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (quantization_params_pre <> 0) ”
  &&  (CharArray.full a_pre (qc4_a_extent (kc_pre)) A )
  **  (qc4_packed kc_pre w_pre Ps )
  **  (FloatArray.undef_full left_pre nc_pre )
  **  ((&((params_pre)  # "xnn_f32_qc4w_minmax_params" ->ₛ "scalar" .ₛ "min")) # Float  |-> lo)
  **  ((&((params_pre)  # "xnn_f32_qc4w_minmax_params" ->ₛ "scalar" .ₛ "max")) # Float  |-> hi)
  **  ((&(((quantization_params_pre + (0 * sizeof( "xnn_qd8_quantization_params" ))))  # "xnn_qd8_quantization_params" ->ₛ "zero_point")) # Int  |-> zp)
  **  ((&(((quantization_params_pre + (0 * sizeof( "xnn_qd8_quantization_params" ))))  # "xnn_qd8_quantization_params" ->ₛ "inv_scale")) # Float  |-> inv)
  **  (FloatArray.undef_full right_pre nc_pre )
.

Definition equivalent_partial_solve_wit_1 := equivalent_partial_solve_wit_1_pure -> equivalent_partial_solve_wit_1_aux.

Definition equivalent_partial_solve_wit_2_pure := 
forall (quantization_params_pre: Z) (params_pre: Z) (right_pre: Z) (left_pre: Z) (w_pre: Z) (a_pre: Z) (kc_pre: Z) (nc_pre: Z) (mr_pre: Z) (hi: fp32) (lo: fp32) (inv: fp32) (zp: Z) (Ps: (@list qc4_panel)) (A: (@list Z)) (PreH1 : (qc4_domain_shape mr_pre nc_pre kc_pre Ps )) (PreH2 : (qc4_data_capacity nc_pre kc_pre a_pre w_pre left_pre )) (PreH3 : (qc4_data_capacity nc_pre kc_pre a_pre w_pre right_pre )) (PreH4 : (a_pre <> 0)) (PreH5 : (w_pre <> 0)) (PreH6 : (left_pre <> 0)) (PreH7 : (right_pre <> 0)) (PreH8 : (params_pre <> 0)) (PreH9 : (quantization_params_pre <> 0)) ,
  (CharArray.full a_pre (qc4_a_extent (kc_pre)) A )
  **  (qc4_packed kc_pre w_pre Ps )
  **  (qc4_output_ref left_pre kc_pre nc_pre zp A Ps inv lo hi )
  **  ((&((params_pre)  # "xnn_f32_qc4w_minmax_params" ->ₛ "scalar" .ₛ "min")) # Float  |-> lo)
  **  ((&((params_pre)  # "xnn_f32_qc4w_minmax_params" ->ₛ "scalar" .ₛ "max")) # Float  |-> hi)
  **  ((&(((quantization_params_pre + (0 * sizeof( "xnn_qd8_quantization_params" ))))  # "xnn_qd8_quantization_params" ->ₛ "zero_point")) # Int  |-> zp)
  **  ((&(((quantization_params_pre + (0 * sizeof( "xnn_qd8_quantization_params" ))))  # "xnn_qd8_quantization_params" ->ₛ "inv_scale")) # Float  |-> inv)
  **  ((( &( "mr" ) )) # UInt64  |-> mr_pre)
  **  ((( &( "nc" ) )) # UInt64  |-> nc_pre)
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "w" ) )) # Ptr  |-> w_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "quantization_params" ) )) # Ptr  |-> quantization_params_pre)
  **  (FloatArray.undef_full right_pre nc_pre )
|--
  “ (qc4_domain_shape mr_pre nc_pre kc_pre Ps ) ” 
  &&  “ (qc4_data_capacity nc_pre kc_pre a_pre w_pre right_pre ) ” 
  &&  “ (64 = 64) ” 
  &&  “ (a_pre <> 0) ” 
  &&  “ (w_pre <> 0) ” 
  &&  “ (right_pre <> 0) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (quantization_params_pre <> 0) ”
.

Definition equivalent_partial_solve_wit_2_aux := 
forall (quantization_params_pre: Z) (params_pre: Z) (right_pre: Z) (left_pre: Z) (w_pre: Z) (a_pre: Z) (kc_pre: Z) (nc_pre: Z) (mr_pre: Z) (hi: fp32) (lo: fp32) (inv: fp32) (zp: Z) (Ps: (@list qc4_panel)) (A: (@list Z)) (PreH1 : (qc4_domain_shape mr_pre nc_pre kc_pre Ps )) (PreH2 : (qc4_data_capacity nc_pre kc_pre a_pre w_pre left_pre )) (PreH3 : (qc4_data_capacity nc_pre kc_pre a_pre w_pre right_pre )) (PreH4 : (a_pre <> 0)) (PreH5 : (w_pre <> 0)) (PreH6 : (left_pre <> 0)) (PreH7 : (right_pre <> 0)) (PreH8 : (params_pre <> 0)) (PreH9 : (quantization_params_pre <> 0)) ,
  (CharArray.full a_pre (qc4_a_extent (kc_pre)) A )
  **  (qc4_packed kc_pre w_pre Ps )
  **  (qc4_output_ref left_pre kc_pre nc_pre zp A Ps inv lo hi )
  **  ((&((params_pre)  # "xnn_f32_qc4w_minmax_params" ->ₛ "scalar" .ₛ "min")) # Float  |-> lo)
  **  ((&((params_pre)  # "xnn_f32_qc4w_minmax_params" ->ₛ "scalar" .ₛ "max")) # Float  |-> hi)
  **  ((&(((quantization_params_pre + (0 * sizeof( "xnn_qd8_quantization_params" ))))  # "xnn_qd8_quantization_params" ->ₛ "zero_point")) # Int  |-> zp)
  **  ((&(((quantization_params_pre + (0 * sizeof( "xnn_qd8_quantization_params" ))))  # "xnn_qd8_quantization_params" ->ₛ "inv_scale")) # Float  |-> inv)
  **  (FloatArray.undef_full right_pre nc_pre )
|--
  “ (qc4_domain_shape mr_pre nc_pre kc_pre Ps ) ” 
  &&  “ (qc4_data_capacity nc_pre kc_pre a_pre w_pre right_pre ) ” 
  &&  “ (64 = 64) ” 
  &&  “ (a_pre <> 0) ” 
  &&  “ (w_pre <> 0) ” 
  &&  “ (right_pre <> 0) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (quantization_params_pre <> 0) ” 
  &&  “ (qc4_domain_shape mr_pre nc_pre kc_pre Ps ) ” 
  &&  “ (qc4_data_capacity nc_pre kc_pre a_pre w_pre left_pre ) ” 
  &&  “ (qc4_data_capacity nc_pre kc_pre a_pre w_pre right_pre ) ” 
  &&  “ (a_pre <> 0) ” 
  &&  “ (w_pre <> 0) ” 
  &&  “ (left_pre <> 0) ” 
  &&  “ (right_pre <> 0) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (quantization_params_pre <> 0) ”
  &&  (CharArray.full a_pre (qc4_a_extent (kc_pre)) A )
  **  (qc4_packed kc_pre w_pre Ps )
  **  (FloatArray.undef_full right_pre nc_pre )
  **  ((&((params_pre)  # "xnn_f32_qc4w_minmax_params" ->ₛ "scalar" .ₛ "min")) # Float  |-> lo)
  **  ((&((params_pre)  # "xnn_f32_qc4w_minmax_params" ->ₛ "scalar" .ₛ "max")) # Float  |-> hi)
  **  ((&(((quantization_params_pre + (0 * sizeof( "xnn_qd8_quantization_params" ))))  # "xnn_qd8_quantization_params" ->ₛ "zero_point")) # Int  |-> zp)
  **  ((&(((quantization_params_pre + (0 * sizeof( "xnn_qd8_quantization_params" ))))  # "xnn_qd8_quantization_params" ->ₛ "inv_scale")) # Float  |-> inv)
  **  (qc4_output_ref left_pre kc_pre nc_pre zp A Ps inv lo hi )
.

Definition equivalent_partial_solve_wit_2 := equivalent_partial_solve_wit_2_pure -> equivalent_partial_solve_wit_2_aux.

Definition equivalent_partial_solve_wit_3_pure := 
(
forall (quantization_params_pre: Z) (params_pre: Z) (right_pre: Z) (left_pre: Z) (w_pre: Z) (a_pre: Z) (kc_pre: Z) (nc_pre: Z) (mr_pre: Z) (hi: fp32) (lo: fp32) (inv: fp32) (zp: Z) (Ps: (@list qc4_panel)) (A: (@list Z)) (PreH1 : (qc4_domain_shape mr_pre nc_pre kc_pre Ps )) (PreH2 : (qc4_data_capacity nc_pre kc_pre a_pre w_pre left_pre )) (PreH3 : (qc4_data_capacity nc_pre kc_pre a_pre w_pre right_pre )) (PreH4 : (a_pre <> 0)) (PreH5 : (w_pre <> 0)) (PreH6 : (left_pre <> 0)) (PreH7 : (right_pre <> 0)) (PreH8 : (params_pre <> 0)) (PreH9 : (quantization_params_pre <> 0)) ,
  (CharArray.full a_pre (qc4_a_extent (kc_pre)) A )
  **  (qc4_packed kc_pre w_pre Ps )
  **  (qc4_output_ref right_pre kc_pre nc_pre zp A Ps inv lo hi )
  **  ((&((params_pre)  # "xnn_f32_qc4w_minmax_params" ->ₛ "scalar" .ₛ "min")) # Float  |-> lo)
  **  ((&((params_pre)  # "xnn_f32_qc4w_minmax_params" ->ₛ "scalar" .ₛ "max")) # Float  |-> hi)
  **  ((&(((quantization_params_pre + (0 * sizeof( "xnn_qd8_quantization_params" ))))  # "xnn_qd8_quantization_params" ->ₛ "zero_point")) # Int  |-> zp)
  **  ((&(((quantization_params_pre + (0 * sizeof( "xnn_qd8_quantization_params" ))))  # "xnn_qd8_quantization_params" ->ₛ "inv_scale")) # Float  |-> inv)
  **  (qc4_output_ref left_pre kc_pre nc_pre zp A Ps inv lo hi )
  **  ((( &( "mr" ) )) # UInt64  |-> mr_pre)
  **  ((( &( "nc" ) )) # UInt64  |-> nc_pre)
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "w" ) )) # Ptr  |-> w_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "quantization_params" ) )) # Ptr  |-> quantization_params_pre)
|--
  “ (0 < kc_pre) ”
) \/
(
forall (quantization_params_pre: Z) (params_pre: Z) (right_pre: Z) (left_pre: Z) (w_pre: Z) (a_pre: Z) (kc_pre: Z) (nc_pre: Z) (mr_pre: Z) (hi: fp32) (lo: fp32) (inv: fp32) (zp: Z) (Ps: (@list qc4_panel)) (A: (@list Z)) (PreH1 : (kc_pre <= UINT64_MAX)) (PreH2 : (nc_pre <= UINT64_MAX)) (PreH3 : (mr_pre <= UINT64_MAX)) (PreH4 : (kc_pre >= 0)) (PreH5 : (nc_pre >= 0)) (PreH6 : (mr_pre >= 0)) (PreH7 : (zp <= INT_MAX)) (PreH8 : (zp >= INT_MIN)) (PreH9 : (qc4_domain_shape mr_pre nc_pre kc_pre Ps )) (PreH10 : (qc4_data_capacity nc_pre kc_pre a_pre w_pre left_pre )) (PreH11 : (qc4_data_capacity nc_pre kc_pre a_pre w_pre right_pre )) (PreH12 : (a_pre <> 0)) (PreH13 : (w_pre <> 0)) (PreH14 : (left_pre <> 0)) (PreH15 : (right_pre <> 0)) (PreH16 : (params_pre <> 0)) (PreH17 : (quantization_params_pre <> 0)) ,
  (CharArray.full a_pre (qc4_a_extent (kc_pre)) A )
  **  (qc4_packed kc_pre w_pre Ps )
  **  (qc4_output_ref right_pre kc_pre nc_pre zp A Ps inv lo hi )
  **  ((&((params_pre)  # "xnn_f32_qc4w_minmax_params" ->ₛ "scalar" .ₛ "min")) # Float  |-> lo)
  **  ((&((params_pre)  # "xnn_f32_qc4w_minmax_params" ->ₛ "scalar" .ₛ "max")) # Float  |-> hi)
  **  ((&(((quantization_params_pre + (0 * sizeof( "xnn_qd8_quantization_params" ))))  # "xnn_qd8_quantization_params" ->ₛ "zero_point")) # Int  |-> zp)
  **  ((&(((quantization_params_pre + (0 * sizeof( "xnn_qd8_quantization_params" ))))  # "xnn_qd8_quantization_params" ->ₛ "inv_scale")) # Float  |-> inv)
  **  (qc4_output_ref left_pre kc_pre nc_pre zp A Ps inv lo hi )
  **  ((( &( "mr" ) )) # UInt64  |-> mr_pre)
  **  ((( &( "nc" ) )) # UInt64  |-> nc_pre)
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "w" ) )) # Ptr  |-> w_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "quantization_params" ) )) # Ptr  |-> quantization_params_pre)
|--
  “ (0 < kc_pre) ”
).

Definition equivalent_partial_solve_wit_3_pure_split_goal_1 := 
forall (quantization_params_pre: Z) (params_pre: Z) (right_pre: Z) (left_pre: Z) (w_pre: Z) (a_pre: Z) (kc_pre: Z) (nc_pre: Z) (mr_pre: Z) (hi: fp32) (lo: fp32) (inv: fp32) (zp: Z) (Ps: (@list qc4_panel)) (A: (@list Z)) (PreH1 : (kc_pre <= UINT64_MAX)) (PreH2 : (nc_pre <= UINT64_MAX)) (PreH3 : (mr_pre <= UINT64_MAX)) (PreH4 : (kc_pre >= 0)) (PreH5 : (nc_pre >= 0)) (PreH6 : (mr_pre >= 0)) (PreH7 : (zp <= INT_MAX)) (PreH8 : (zp >= INT_MIN)) (PreH9 : (qc4_domain_shape mr_pre nc_pre kc_pre Ps )) (PreH10 : (qc4_data_capacity nc_pre kc_pre a_pre w_pre left_pre )) (PreH11 : (qc4_data_capacity nc_pre kc_pre a_pre w_pre right_pre )) (PreH12 : (a_pre <> 0)) (PreH13 : (w_pre <> 0)) (PreH14 : (left_pre <> 0)) (PreH15 : (right_pre <> 0)) (PreH16 : (params_pre <> 0)) (PreH17 : (quantization_params_pre <> 0)) ,
  (CharArray.full a_pre (qc4_a_extent (kc_pre)) A )
  **  (qc4_packed kc_pre w_pre Ps )
  **  (qc4_output_ref right_pre kc_pre nc_pre zp A Ps inv lo hi )
  **  ((&((params_pre)  # "xnn_f32_qc4w_minmax_params" ->ₛ "scalar" .ₛ "min")) # Float  |-> lo)
  **  ((&((params_pre)  # "xnn_f32_qc4w_minmax_params" ->ₛ "scalar" .ₛ "max")) # Float  |-> hi)
  **  ((&(((quantization_params_pre + (0 * sizeof( "xnn_qd8_quantization_params" ))))  # "xnn_qd8_quantization_params" ->ₛ "zero_point")) # Int  |-> zp)
  **  ((&(((quantization_params_pre + (0 * sizeof( "xnn_qd8_quantization_params" ))))  # "xnn_qd8_quantization_params" ->ₛ "inv_scale")) # Float  |-> inv)
  **  (qc4_output_ref left_pre kc_pre nc_pre zp A Ps inv lo hi )
  **  ((( &( "mr" ) )) # UInt64  |-> mr_pre)
  **  ((( &( "nc" ) )) # UInt64  |-> nc_pre)
  **  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "w" ) )) # Ptr  |-> w_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "quantization_params" ) )) # Ptr  |-> quantization_params_pre)
|--
  “ (0 < kc_pre) ”
.

Definition equivalent_partial_solve_wit_3_aux := 
forall (quantization_params_pre: Z) (params_pre: Z) (right_pre: Z) (left_pre: Z) (w_pre: Z) (a_pre: Z) (kc_pre: Z) (nc_pre: Z) (mr_pre: Z) (hi: fp32) (lo: fp32) (inv: fp32) (zp: Z) (Ps: (@list qc4_panel)) (A: (@list Z)) (PreH1 : (qc4_domain_shape mr_pre nc_pre kc_pre Ps )) (PreH2 : (qc4_data_capacity nc_pre kc_pre a_pre w_pre left_pre )) (PreH3 : (qc4_data_capacity nc_pre kc_pre a_pre w_pre right_pre )) (PreH4 : (a_pre <> 0)) (PreH5 : (w_pre <> 0)) (PreH6 : (left_pre <> 0)) (PreH7 : (right_pre <> 0)) (PreH8 : (params_pre <> 0)) (PreH9 : (quantization_params_pre <> 0)) ,
  (CharArray.full a_pre (qc4_a_extent (kc_pre)) A )
  **  (qc4_packed kc_pre w_pre Ps )
  **  (qc4_output_ref right_pre kc_pre nc_pre zp A Ps inv lo hi )
  **  ((&((params_pre)  # "xnn_f32_qc4w_minmax_params" ->ₛ "scalar" .ₛ "min")) # Float  |-> lo)
  **  ((&((params_pre)  # "xnn_f32_qc4w_minmax_params" ->ₛ "scalar" .ₛ "max")) # Float  |-> hi)
  **  ((&(((quantization_params_pre + (0 * sizeof( "xnn_qd8_quantization_params" ))))  # "xnn_qd8_quantization_params" ->ₛ "zero_point")) # Int  |-> zp)
  **  ((&(((quantization_params_pre + (0 * sizeof( "xnn_qd8_quantization_params" ))))  # "xnn_qd8_quantization_params" ->ₛ "inv_scale")) # Float  |-> inv)
  **  (qc4_output_ref left_pre kc_pre nc_pre zp A Ps inv lo hi )
|--
  “ (0 < kc_pre) ” 
  &&  “ (qc4_domain_shape mr_pre nc_pre kc_pre Ps ) ” 
  &&  “ (qc4_data_capacity nc_pre kc_pre a_pre w_pre left_pre ) ” 
  &&  “ (qc4_data_capacity nc_pre kc_pre a_pre w_pre right_pre ) ” 
  &&  “ (a_pre <> 0) ” 
  &&  “ (w_pre <> 0) ” 
  &&  “ (left_pre <> 0) ” 
  &&  “ (right_pre <> 0) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (quantization_params_pre <> 0) ”
  &&  (qc4_output_ref left_pre kc_pre nc_pre zp A Ps inv lo hi )
  **  (qc4_output_ref right_pre kc_pre nc_pre zp A Ps inv lo hi )
  **  (CharArray.full a_pre (qc4_a_extent (kc_pre)) A )
  **  (qc4_packed kc_pre w_pre Ps )
  **  ((&((params_pre)  # "xnn_f32_qc4w_minmax_params" ->ₛ "scalar" .ₛ "min")) # Float  |-> lo)
  **  ((&((params_pre)  # "xnn_f32_qc4w_minmax_params" ->ₛ "scalar" .ₛ "max")) # Float  |-> hi)
  **  ((&(((quantization_params_pre + (0 * sizeof( "xnn_qd8_quantization_params" ))))  # "xnn_qd8_quantization_params" ->ₛ "zero_point")) # Int  |-> zp)
  **  ((&(((quantization_params_pre + (0 * sizeof( "xnn_qd8_quantization_params" ))))  # "xnn_qd8_quantization_params" ->ₛ "inv_scale")) # Float  |-> inv)
.

Definition equivalent_partial_solve_wit_3 := equivalent_partial_solve_wit_3_pure -> equivalent_partial_solve_wit_3_aux.

Definition equivalent_partial_solve_wit_4_pure := 
(
forall (quantization_params_pre: Z) (params_pre: Z) (right_pre: Z) (left_pre: Z) (w_pre: Z) (a_pre: Z) (kc_pre: Z) (nc_pre: Z) (mr_pre: Z) (hi: fp32) (lo: fp32) (inv: fp32) (zp: Z) (Ps: (@list qc4_panel)) (A: (@list Z)) (L: (@list fp32)) (R: (@list fp32)) (PreH1 : (0 < kc_pre)) (PreH2 : (qc4_outputs_related L R )) (PreH3 : (qc4_domain_shape mr_pre nc_pre kc_pre Ps )) (PreH4 : (qc4_data_capacity nc_pre kc_pre a_pre w_pre left_pre )) (PreH5 : (qc4_data_capacity nc_pre kc_pre a_pre w_pre right_pre )) (PreH6 : (a_pre <> 0)) (PreH7 : (w_pre <> 0)) (PreH8 : (left_pre <> 0)) (PreH9 : (right_pre <> 0)) (PreH10 : (params_pre <> 0)) (PreH11 : (quantization_params_pre <> 0)) ,
  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "nc" ) )) # UInt64  |-> nc_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  (FloatArray.full left_pre nc_pre L )
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  (FloatArray.full right_pre nc_pre R )
  **  (CharArray.full a_pre (qc4_a_extent (kc_pre)) A )
  **  (qc4_packed kc_pre w_pre Ps )
  **  ((&((params_pre)  # "xnn_f32_qc4w_minmax_params" ->ₛ "scalar" .ₛ "min")) # Float  |-> lo)
  **  ((&((params_pre)  # "xnn_f32_qc4w_minmax_params" ->ₛ "scalar" .ₛ "max")) # Float  |-> hi)
  **  ((&(((quantization_params_pre + (0 * sizeof( "xnn_qd8_quantization_params" ))))  # "xnn_qd8_quantization_params" ->ₛ "zero_point")) # Int  |-> zp)
  **  ((&(((quantization_params_pre + (0 * sizeof( "xnn_qd8_quantization_params" ))))  # "xnn_qd8_quantization_params" ->ₛ "inv_scale")) # Float  |-> inv)
  **  ((( &( "mr" ) )) # UInt64  |-> mr_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "w" ) )) # Ptr  |-> w_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "quantization_params" ) )) # Ptr  |-> quantization_params_pre)
|--
  “ (qc4_outputs_related L R ) ” 
  &&  “ (nc_pre <= 4611686018427387903) ” 
  &&  “ (0 < nc_pre) ”
) \/
(
forall (quantization_params_pre: Z) (params_pre: Z) (right_pre: Z) (left_pre: Z) (w_pre: Z) (a_pre: Z) (kc_pre: Z) (nc_pre: Z) (mr_pre: Z) (hi: fp32) (lo: fp32) (inv: fp32) (zp: Z) (Ps: (@list qc4_panel)) (A: (@list Z)) (L: (@list fp32)) (R: (@list fp32)) (PreH1 : (mr_pre <= UINT64_MAX)) (PreH2 : (nc_pre <= UINT64_MAX)) (PreH3 : (kc_pre <= UINT64_MAX)) (PreH4 : (mr_pre >= 0)) (PreH5 : (nc_pre >= 0)) (PreH6 : (kc_pre >= 0)) (PreH7 : (zp <= INT_MAX)) (PreH8 : (zp >= INT_MIN)) (PreH9 : (0 < kc_pre)) (PreH10 : (qc4_outputs_related L R )) (PreH11 : (qc4_domain_shape mr_pre nc_pre kc_pre Ps )) (PreH12 : (qc4_data_capacity nc_pre kc_pre a_pre w_pre left_pre )) (PreH13 : (qc4_data_capacity nc_pre kc_pre a_pre w_pre right_pre )) (PreH14 : (a_pre <> 0)) (PreH15 : (w_pre <> 0)) (PreH16 : (left_pre <> 0)) (PreH17 : (right_pre <> 0)) (PreH18 : (params_pre <> 0)) (PreH19 : (quantization_params_pre <> 0)) ,
  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "nc" ) )) # UInt64  |-> nc_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  (FloatArray.full left_pre nc_pre L )
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  (FloatArray.full right_pre nc_pre R )
  **  (CharArray.full a_pre (qc4_a_extent (kc_pre)) A )
  **  (qc4_packed kc_pre w_pre Ps )
  **  ((&((params_pre)  # "xnn_f32_qc4w_minmax_params" ->ₛ "scalar" .ₛ "min")) # Float  |-> lo)
  **  ((&((params_pre)  # "xnn_f32_qc4w_minmax_params" ->ₛ "scalar" .ₛ "max")) # Float  |-> hi)
  **  ((&(((quantization_params_pre + (0 * sizeof( "xnn_qd8_quantization_params" ))))  # "xnn_qd8_quantization_params" ->ₛ "zero_point")) # Int  |-> zp)
  **  ((&(((quantization_params_pre + (0 * sizeof( "xnn_qd8_quantization_params" ))))  # "xnn_qd8_quantization_params" ->ₛ "inv_scale")) # Float  |-> inv)
  **  ((( &( "mr" ) )) # UInt64  |-> mr_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "w" ) )) # Ptr  |-> w_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "quantization_params" ) )) # Ptr  |-> quantization_params_pre)
|--
  “ (0 < nc_pre) ” 
  &&  “ (nc_pre <= 4611686018427387903) ”
).

Definition equivalent_partial_solve_wit_4_pure_split_goal_1 := 
forall (quantization_params_pre: Z) (params_pre: Z) (right_pre: Z) (left_pre: Z) (w_pre: Z) (a_pre: Z) (kc_pre: Z) (nc_pre: Z) (mr_pre: Z) (hi: fp32) (lo: fp32) (inv: fp32) (zp: Z) (Ps: (@list qc4_panel)) (A: (@list Z)) (L: (@list fp32)) (R: (@list fp32)) (PreH1 : (mr_pre <= UINT64_MAX)) (PreH2 : (nc_pre <= UINT64_MAX)) (PreH3 : (kc_pre <= UINT64_MAX)) (PreH4 : (mr_pre >= 0)) (PreH5 : (nc_pre >= 0)) (PreH6 : (kc_pre >= 0)) (PreH7 : (zp <= INT_MAX)) (PreH8 : (zp >= INT_MIN)) (PreH9 : (0 < kc_pre)) (PreH10 : (qc4_outputs_related L R )) (PreH11 : (qc4_domain_shape mr_pre nc_pre kc_pre Ps )) (PreH12 : (qc4_data_capacity nc_pre kc_pre a_pre w_pre left_pre )) (PreH13 : (qc4_data_capacity nc_pre kc_pre a_pre w_pre right_pre )) (PreH14 : (a_pre <> 0)) (PreH15 : (w_pre <> 0)) (PreH16 : (left_pre <> 0)) (PreH17 : (right_pre <> 0)) (PreH18 : (params_pre <> 0)) (PreH19 : (quantization_params_pre <> 0)) ,
  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "nc" ) )) # UInt64  |-> nc_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  (FloatArray.full left_pre nc_pre L )
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  (FloatArray.full right_pre nc_pre R )
  **  (CharArray.full a_pre (qc4_a_extent (kc_pre)) A )
  **  (qc4_packed kc_pre w_pre Ps )
  **  ((&((params_pre)  # "xnn_f32_qc4w_minmax_params" ->ₛ "scalar" .ₛ "min")) # Float  |-> lo)
  **  ((&((params_pre)  # "xnn_f32_qc4w_minmax_params" ->ₛ "scalar" .ₛ "max")) # Float  |-> hi)
  **  ((&(((quantization_params_pre + (0 * sizeof( "xnn_qd8_quantization_params" ))))  # "xnn_qd8_quantization_params" ->ₛ "zero_point")) # Int  |-> zp)
  **  ((&(((quantization_params_pre + (0 * sizeof( "xnn_qd8_quantization_params" ))))  # "xnn_qd8_quantization_params" ->ₛ "inv_scale")) # Float  |-> inv)
  **  ((( &( "mr" ) )) # UInt64  |-> mr_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "w" ) )) # Ptr  |-> w_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "quantization_params" ) )) # Ptr  |-> quantization_params_pre)
|--
  “ (0 < nc_pre) ”
.

Definition equivalent_partial_solve_wit_4_pure_split_goal_2 := 
forall (quantization_params_pre: Z) (params_pre: Z) (right_pre: Z) (left_pre: Z) (w_pre: Z) (a_pre: Z) (kc_pre: Z) (nc_pre: Z) (mr_pre: Z) (hi: fp32) (lo: fp32) (inv: fp32) (zp: Z) (Ps: (@list qc4_panel)) (A: (@list Z)) (L: (@list fp32)) (R: (@list fp32)) (PreH1 : (mr_pre <= UINT64_MAX)) (PreH2 : (nc_pre <= UINT64_MAX)) (PreH3 : (kc_pre <= UINT64_MAX)) (PreH4 : (mr_pre >= 0)) (PreH5 : (nc_pre >= 0)) (PreH6 : (kc_pre >= 0)) (PreH7 : (zp <= INT_MAX)) (PreH8 : (zp >= INT_MIN)) (PreH9 : (0 < kc_pre)) (PreH10 : (qc4_outputs_related L R )) (PreH11 : (qc4_domain_shape mr_pre nc_pre kc_pre Ps )) (PreH12 : (qc4_data_capacity nc_pre kc_pre a_pre w_pre left_pre )) (PreH13 : (qc4_data_capacity nc_pre kc_pre a_pre w_pre right_pre )) (PreH14 : (a_pre <> 0)) (PreH15 : (w_pre <> 0)) (PreH16 : (left_pre <> 0)) (PreH17 : (right_pre <> 0)) (PreH18 : (params_pre <> 0)) (PreH19 : (quantization_params_pre <> 0)) ,
  ((( &( "kc" ) )) # UInt64  |-> kc_pre)
  **  ((( &( "nc" ) )) # UInt64  |-> nc_pre)
  **  ((( &( "left" ) )) # Ptr  |-> left_pre)
  **  (FloatArray.full left_pre nc_pre L )
  **  ((( &( "right" ) )) # Ptr  |-> right_pre)
  **  (FloatArray.full right_pre nc_pre R )
  **  (CharArray.full a_pre (qc4_a_extent (kc_pre)) A )
  **  (qc4_packed kc_pre w_pre Ps )
  **  ((&((params_pre)  # "xnn_f32_qc4w_minmax_params" ->ₛ "scalar" .ₛ "min")) # Float  |-> lo)
  **  ((&((params_pre)  # "xnn_f32_qc4w_minmax_params" ->ₛ "scalar" .ₛ "max")) # Float  |-> hi)
  **  ((&(((quantization_params_pre + (0 * sizeof( "xnn_qd8_quantization_params" ))))  # "xnn_qd8_quantization_params" ->ₛ "zero_point")) # Int  |-> zp)
  **  ((&(((quantization_params_pre + (0 * sizeof( "xnn_qd8_quantization_params" ))))  # "xnn_qd8_quantization_params" ->ₛ "inv_scale")) # Float  |-> inv)
  **  ((( &( "mr" ) )) # UInt64  |-> mr_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "w" ) )) # Ptr  |-> w_pre)
  **  ((( &( "params" ) )) # Ptr  |-> params_pre)
  **  ((( &( "quantization_params" ) )) # Ptr  |-> quantization_params_pre)
|--
  “ (nc_pre <= 4611686018427387903) ”
.

Definition equivalent_partial_solve_wit_4_aux := 
forall (quantization_params_pre: Z) (params_pre: Z) (right_pre: Z) (left_pre: Z) (w_pre: Z) (a_pre: Z) (kc_pre: Z) (nc_pre: Z) (mr_pre: Z) (hi: fp32) (lo: fp32) (inv: fp32) (zp: Z) (Ps: (@list qc4_panel)) (A: (@list Z)) (L: (@list fp32)) (R: (@list fp32)) (PreH1 : (0 < kc_pre)) (PreH2 : (qc4_outputs_related L R )) (PreH3 : (qc4_domain_shape mr_pre nc_pre kc_pre Ps )) (PreH4 : (qc4_data_capacity nc_pre kc_pre a_pre w_pre left_pre )) (PreH5 : (qc4_data_capacity nc_pre kc_pre a_pre w_pre right_pre )) (PreH6 : (a_pre <> 0)) (PreH7 : (w_pre <> 0)) (PreH8 : (left_pre <> 0)) (PreH9 : (right_pre <> 0)) (PreH10 : (params_pre <> 0)) (PreH11 : (quantization_params_pre <> 0)) ,
  (FloatArray.full left_pre nc_pre L )
  **  (FloatArray.full right_pre nc_pre R )
  **  (CharArray.full a_pre (qc4_a_extent (kc_pre)) A )
  **  (qc4_packed kc_pre w_pre Ps )
  **  ((&((params_pre)  # "xnn_f32_qc4w_minmax_params" ->ₛ "scalar" .ₛ "min")) # Float  |-> lo)
  **  ((&((params_pre)  # "xnn_f32_qc4w_minmax_params" ->ₛ "scalar" .ₛ "max")) # Float  |-> hi)
  **  ((&(((quantization_params_pre + (0 * sizeof( "xnn_qd8_quantization_params" ))))  # "xnn_qd8_quantization_params" ->ₛ "zero_point")) # Int  |-> zp)
  **  ((&(((quantization_params_pre + (0 * sizeof( "xnn_qd8_quantization_params" ))))  # "xnn_qd8_quantization_params" ->ₛ "inv_scale")) # Float  |-> inv)
|--
  “ (qc4_outputs_related L R ) ” 
  &&  “ (nc_pre <= 4611686018427387903) ” 
  &&  “ (0 < nc_pre) ” 
  &&  “ (0 < kc_pre) ” 
  &&  “ (qc4_outputs_related L R ) ” 
  &&  “ (qc4_domain_shape mr_pre nc_pre kc_pre Ps ) ” 
  &&  “ (qc4_data_capacity nc_pre kc_pre a_pre w_pre left_pre ) ” 
  &&  “ (qc4_data_capacity nc_pre kc_pre a_pre w_pre right_pre ) ” 
  &&  “ (a_pre <> 0) ” 
  &&  “ (w_pre <> 0) ” 
  &&  “ (left_pre <> 0) ” 
  &&  “ (right_pre <> 0) ” 
  &&  “ (params_pre <> 0) ” 
  &&  “ (quantization_params_pre <> 0) ”
  &&  (FloatArray.full left_pre nc_pre L )
  **  (FloatArray.full right_pre nc_pre R )
  **  (CharArray.full a_pre (qc4_a_extent (kc_pre)) A )
  **  (qc4_packed kc_pre w_pre Ps )
  **  ((&((params_pre)  # "xnn_f32_qc4w_minmax_params" ->ₛ "scalar" .ₛ "min")) # Float  |-> lo)
  **  ((&((params_pre)  # "xnn_f32_qc4w_minmax_params" ->ₛ "scalar" .ₛ "max")) # Float  |-> hi)
  **  ((&(((quantization_params_pre + (0 * sizeof( "xnn_qd8_quantization_params" ))))  # "xnn_qd8_quantization_params" ->ₛ "zero_point")) # Int  |-> zp)
  **  ((&(((quantization_params_pre + (0 * sizeof( "xnn_qd8_quantization_params" ))))  # "xnn_qd8_quantization_params" ->ₛ "inv_scale")) # Float  |-> inv)
.

Definition equivalent_partial_solve_wit_4 := equivalent_partial_solve_wit_4_pure -> equivalent_partial_solve_wit_4_aux.

Definition equivalent_which_implies_wit_1 := 
(
forall (hi: fp32) (lo: fp32) (inv: fp32) (zp: Z) (Ps: (@list qc4_panel)) (A: (@list Z)) (kc: Z) (nc: Z) (left: Z) (right: Z) (PreH1 : (0 < kc)) ,
  (qc4_output_ref left kc nc zp A Ps inv lo hi )
  **  (qc4_output_ref right kc nc zp A Ps inv lo hi )
|--
  EX (L: (@list fp32))  (R: (@list fp32)) ,
  “ (0 < kc) ” 
  &&  “ (qc4_outputs_related L R ) ”
  &&  (FloatArray.full left nc L )
  **  (FloatArray.full right nc R )
) \/
(
forall (hi: fp32) (lo: fp32) (inv: fp32) (zp: Z) (Ps: (@list qc4_panel)) (A: (@list Z)) (kc: Z) (nc: Z) (left: Z) (right: Z) (PreH1 : (0 < kc)) ,
  (qc4_output_ref left kc nc zp A Ps inv lo hi )
  **  (qc4_output_ref right kc nc zp A Ps inv lo hi )
|--
  EX (L: (@list fp32))  (R: (@list fp32)) ,
  “ (0 < kc) ” 
  &&  “ (qc4_outputs_related L R ) ”
  &&  (FloatArray.full left nc L )
  **  (FloatArray.full right nc R )
).

Module Type VC_Correct.


Axiom proof_of_qc4_preserve_float_return_wit_1 : qc4_preserve_float_return_wit_1.
Axiom proof_of_qc4_same_lane_safety_wit_1 : qc4_same_lane_safety_wit_1.
Axiom proof_of_qc4_same_lane_safety_wit_2 : qc4_same_lane_safety_wit_2.
Axiom proof_of_qc4_same_lane_safety_wit_3 : qc4_same_lane_safety_wit_3.
Axiom proof_of_qc4_same_lane_safety_wit_4 : qc4_same_lane_safety_wit_4.
Axiom proof_of_qc4_same_lane_return_wit_1 : qc4_same_lane_return_wit_1.
Axiom proof_of_qc4_same_lane_return_wit_2 : qc4_same_lane_return_wit_2.
Axiom proof_of_qc4_same_lane_return_wit_3 : qc4_same_lane_return_wit_3.
Axiom proof_of_qc4_same_lane_return_wit_4 : qc4_same_lane_return_wit_4.
Axiom proof_of_qc4_same_lane_partial_solve_wit_1 : qc4_same_lane_partial_solve_wit_1.
Axiom proof_of_qc4_same_lane_partial_solve_wit_2 : qc4_same_lane_partial_solve_wit_2.
Axiom proof_of_qc4_compare_outputs_safety_wit_1 : qc4_compare_outputs_safety_wit_1.
Axiom proof_of_qc4_compare_outputs_safety_wit_2 : qc4_compare_outputs_safety_wit_2.
Axiom proof_of_qc4_compare_outputs_safety_wit_3 : qc4_compare_outputs_safety_wit_3.
Axiom proof_of_qc4_compare_outputs_entail_wit_1 : qc4_compare_outputs_entail_wit_1.
Axiom proof_of_qc4_compare_outputs_entail_wit_2 : qc4_compare_outputs_entail_wit_2.
Axiom proof_of_qc4_compare_outputs_return_wit_1 : qc4_compare_outputs_return_wit_1.
Axiom proof_of_qc4_compare_outputs_return_wit_2 : qc4_compare_outputs_return_wit_2.
Axiom proof_of_qc4_compare_outputs_partial_solve_wit_1_pure : qc4_compare_outputs_partial_solve_wit_1_pure.
Axiom proof_of_qc4_compare_outputs_partial_solve_wit_1 : qc4_compare_outputs_partial_solve_wit_1.
Axiom proof_of_qc4_compare_outputs_partial_solve_wit_2_pure : qc4_compare_outputs_partial_solve_wit_2_pure.
Axiom proof_of_qc4_compare_outputs_partial_solve_wit_2 : qc4_compare_outputs_partial_solve_wit_2.
Axiom proof_of_qc4_compare_outputs_partial_solve_wit_3_pure : qc4_compare_outputs_partial_solve_wit_3_pure.
Axiom proof_of_qc4_compare_outputs_partial_solve_wit_3 : qc4_compare_outputs_partial_solve_wit_3.
Axiom proof_of_qc4_compare_outputs_which_implies_wit_1 : qc4_compare_outputs_which_implies_wit_1.
Axiom proof_of_qc4_compare_outputs_which_implies_wit_2 : qc4_compare_outputs_which_implies_wit_2.
Axiom proof_of_equivalent_safety_wit_1 : equivalent_safety_wit_1.
Axiom proof_of_equivalent_safety_wit_2 : equivalent_safety_wit_2.
Axiom proof_of_equivalent_safety_wit_3 : equivalent_safety_wit_3.
Axiom proof_of_equivalent_safety_wit_4 : equivalent_safety_wit_4.
Axiom proof_of_equivalent_safety_wit_5 : equivalent_safety_wit_5.
Axiom proof_of_equivalent_safety_wit_6 : equivalent_safety_wit_6.
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
