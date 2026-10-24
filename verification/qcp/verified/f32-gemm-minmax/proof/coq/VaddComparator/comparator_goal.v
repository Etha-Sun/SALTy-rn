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
Local Open Scope sac.
From VaddComparator Require Import comparator_strategy_goal.
From VaddComparator Require Import comparator_strategy_proof.

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

Module Type VC_Correct.

Include comparator_Strategy_Correct.

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

End VC_Correct.
