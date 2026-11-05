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
Local Open Scope sac.
From SimpleC.EE.QCP_demos_human Require Import int_array_strategy_goal.
From SimpleC.EE.QCP_demos_human Require Import int_array_strategy_proof.
From SimpleC.EE.QCP_demos_human Require Import uint_array_strategy_goal.
From SimpleC.EE.QCP_demos_human Require Import uint_array_strategy_proof.
From SimpleC.EE.QCP_demos_human Require Import undef_uint_array_strategy_goal.
From SimpleC.EE.QCP_demos_human Require Import undef_uint_array_strategy_proof.
From SimpleC.EE.QCP_demos_human Require Import array_shape_strategy_goal.
From SimpleC.EE.QCP_demos_human Require Import array_shape_strategy_proof.

(*----- Function vload -----*)

Definition vload_safety_wit_1 := 
forall (vl_pre: Z) (p_pre: Z) (r_pre: Z) (L: (@list Z)) (PreH1 : (0 <= vl_pre)) (PreH2 : (vl_pre <= 1024)) ,
  ((( &( "i" ) )) # Int  |->_)
  **  ((( &( "r" ) )) # Ptr  |-> r_pre)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "vl" ) )) # Int  |-> vl_pre)
  **  (IntArray.full p_pre vl_pre L )
  **  (IntArray.undef_full &((r_pre)  # "vint32m8_t" ->ₛ "s") 1024 )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition vload_safety_wit_2 := 
forall (vl_pre: Z) (p_pre: Z) (r_pre: Z) (L: (@list Z)) (i: Z) (PreH1 : (i < vl_pre)) (PreH2 : (0 <= i)) (PreH3 : (i <= vl_pre)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 1024)) ,
  (IntArray.seg &((r_pre)  # "vint32m8_t" ->ₛ "s") 0 (i + 1 ) (app ((sublist (0) (i) (L))) ((cons ((Znth i L 0)) ((@nil Z))))) )
  **  (IntArray.undef_seg &((r_pre)  # "vint32m8_t" ->ₛ "s") (i + 1 ) 1024 )
  **  (IntArray.full p_pre vl_pre L )
  **  ((( &( "i" ) )) # Int  |-> i)
  **  ((( &( "r" ) )) # Ptr  |-> r_pre)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "vl" ) )) # Int  |-> vl_pre)
|--
  “ ((i + 1 ) <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= (i + 1 )) ”
.

Definition vload_entail_wit_1 := 
(
forall (vl_pre: Z) (p_pre: Z) (r_pre: Z) (L: (@list Z)) (PreH1 : (0 <= vl_pre)) (PreH2 : (vl_pre <= 1024)) ,
  (IntArray.full p_pre vl_pre L )
  **  (IntArray.undef_full &((r_pre)  # "vint32m8_t" ->ₛ "s") 1024 )
|--
  “ (0 <= 0) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 1024) ”
  &&  (IntArray.full p_pre vl_pre L )
  **  (IntArray.seg &((r_pre)  # "vint32m8_t" ->ₛ "s") 0 0 (sublist (0) (0) (L)) )
  **  (IntArray.undef_seg &((r_pre)  # "vint32m8_t" ->ₛ "s") 0 1024 )
) \/
(
forall (vl_pre: Z) (L: (@list Z)) (PreH1 : (0 <= vl_pre)) (PreH2 : (vl_pre <= 1024)) ,
  TT && emp 
|--
  “ ((sublist (0) (0) (L)) = (@nil Z)) ”
  &&  emp
).

Definition vload_entail_wit_1_split_goal_1 := 
forall (vl_pre: Z) (L: (@list Z)) (PreH1 : (0 <= vl_pre)) (PreH2 : (vl_pre <= 1024)) ,
  ((sublist (0) (0) (L)) = (@nil Z))
.

Definition vload_entail_wit_2 := 
(
forall (vl_pre: Z) (p_pre: Z) (r_pre: Z) (L: (@list Z)) (i: Z) (PreH1 : (i < vl_pre)) (PreH2 : (0 <= i)) (PreH3 : (i <= vl_pre)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 1024)) ,
  (IntArray.seg &((r_pre)  # "vint32m8_t" ->ₛ "s") 0 (i + 1 ) (app ((sublist (0) (i) (L))) ((cons ((Znth i L 0)) ((@nil Z))))) )
  **  (IntArray.undef_seg &((r_pre)  # "vint32m8_t" ->ₛ "s") (i + 1 ) 1024 )
  **  (IntArray.full p_pre vl_pre L )
|--
  “ (0 <= (i + 1 )) ” 
  &&  “ ((i + 1 ) <= vl_pre) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 1024) ”
  &&  (IntArray.full p_pre vl_pre L )
  **  (IntArray.seg &((r_pre)  # "vint32m8_t" ->ₛ "s") 0 (i + 1 ) (sublist (0) ((i + 1 )) (L)) )
  **  (IntArray.undef_seg &((r_pre)  # "vint32m8_t" ->ₛ "s") (i + 1 ) 1024 )
) \/
(
forall (vl_pre: Z) (L: (@list Z)) (i: Z) (PreH1 : (i < vl_pre)) (PreH2 : (0 <= i)) (PreH3 : (i <= vl_pre)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 1024)) ,
  TT && emp 
|--
  “ ((app ((sublist (0) (i) (L))) ((cons ((Znth i L 0)) ((@nil Z))))) = (sublist (0) ((i + 1 )) (L))) ”
  &&  emp
).

Definition vload_entail_wit_2_split_goal_1 := 
forall (vl_pre: Z) (L: (@list Z)) (i: Z) (PreH1 : (i < vl_pre)) (PreH2 : (0 <= i)) (PreH3 : (i <= vl_pre)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 1024)) ,
  ((app ((sublist (0) (i) (L))) ((cons ((Znth i L 0)) ((@nil Z))))) = (sublist (0) ((i + 1 )) (L)))
.

Definition vload_return_wit_1 := 
(
forall (vl_pre: Z) (p_pre: Z) (r_pre: Z) (L: (@list Z)) (i: Z) (PreH1 : (i >= vl_pre)) (PreH2 : (0 <= i)) (PreH3 : (i <= vl_pre)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 1024)) ,
  (IntArray.full p_pre vl_pre L )
  **  (IntArray.seg &((r_pre)  # "vint32m8_t" ->ₛ "s") 0 i (sublist (0) (i) (L)) )
  **  (IntArray.undef_seg &((r_pre)  # "vint32m8_t" ->ₛ "s") i 1024 )
|--
  (IntArray.full p_pre vl_pre L )
  **  (IntArray.seg &((r_pre)  # "vint32m8_t" ->ₛ "s") 0 vl_pre L )
  **  (IntArray.undef_seg &((r_pre)  # "vint32m8_t" ->ₛ "s") vl_pre 1024 )
) \/
(
forall (vl_pre: Z) (r_pre: Z) (L: (@list Z)) (i: Z) (PreH1 : (i >= vl_pre)) (PreH2 : (0 <= i)) (PreH3 : (i <= vl_pre)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 1024)) ,
  (IntArray.seg &((r_pre)  # "vint32m8_t" ->ₛ "s") 0 i (sublist (0) (i) (L)) )
|--
  (IntArray.seg &((r_pre)  # "vint32m8_t" ->ₛ "s") 0 vl_pre L )
).

Definition vload_return_wit_1_split_goal_spatial := 
forall (vl_pre: Z) (r_pre: Z) (L: (@list Z)) (i: Z) (PreH1 : (i >= vl_pre)) (PreH2 : (0 <= i)) (PreH3 : (i <= vl_pre)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 1024)) ,
  (IntArray.seg &((r_pre)  # "vint32m8_t" ->ₛ "s") 0 i (sublist (0) (i) (L)) )
|--
  (IntArray.seg &((r_pre)  # "vint32m8_t" ->ₛ "s") 0 vl_pre L )
.

Definition vload_partial_solve_wit_1 := 
forall (vl_pre: Z) (p_pre: Z) (r_pre: Z) (L: (@list Z)) (i: Z) (PreH1 : (i < vl_pre)) (PreH2 : (0 <= i)) (PreH3 : (i <= vl_pre)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 1024)) ,
  (IntArray.full p_pre vl_pre L )
  **  (IntArray.seg &((r_pre)  # "vint32m8_t" ->ₛ "s") 0 i (sublist (0) (i) (L)) )
  **  (IntArray.undef_seg &((r_pre)  # "vint32m8_t" ->ₛ "s") i 1024 )
|--
  “ (i < vl_pre) ” 
  &&  “ (0 <= i) ” 
  &&  “ (i <= vl_pre) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 1024) ”
  &&  (((p_pre + (i * sizeof(INT)))) # Int  |-> (Znth i L 0))
  **  (IntArray.missing_i p_pre i 0 vl_pre L )
  **  (IntArray.seg &((r_pre)  # "vint32m8_t" ->ₛ "s") 0 i (sublist (0) (i) (L)) )
  **  (IntArray.undef_seg &((r_pre)  # "vint32m8_t" ->ₛ "s") i 1024 )
.

Definition vload_partial_solve_wit_2 := 
forall (vl_pre: Z) (p_pre: Z) (r_pre: Z) (L: (@list Z)) (i: Z) (PreH1 : (i < vl_pre)) (PreH2 : (0 <= i)) (PreH3 : (i <= vl_pre)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 1024)) ,
  (IntArray.full p_pre vl_pre L )
  **  (IntArray.seg &((r_pre)  # "vint32m8_t" ->ₛ "s") 0 i (sublist (0) (i) (L)) )
  **  (IntArray.undef_seg &((r_pre)  # "vint32m8_t" ->ₛ "s") i 1024 )
|--
  “ (i < vl_pre) ” 
  &&  “ (0 <= i) ” 
  &&  “ (i <= vl_pre) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 1024) ”
  &&  (((&((r_pre)  # "vint32m8_t" ->ₛ "s") + (i * sizeof(INT)))) # Int  |->_)
  **  (IntArray.undef_seg &((r_pre)  # "vint32m8_t" ->ₛ "s") (i + 1 ) 1024 )
  **  (IntArray.full p_pre vl_pre L )
  **  (IntArray.seg &((r_pre)  # "vint32m8_t" ->ₛ "s") 0 i (sublist (0) (i) (L)) )
.

(*----- Function vstore -----*)

Definition vstore_safety_wit_1 := 
forall (vl_pre: Z) (a_pre: Z) (p_pre: Z) (L: (@list Z)) (PreH1 : (0 <= vl_pre)) (PreH2 : (vl_pre <= 1024)) ,
  ((( &( "i" ) )) # Int  |->_)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "vl" ) )) # Int  |-> vl_pre)
  **  (IntArray.undef_full p_pre vl_pre )
  **  (IntArray.seg &((a_pre)  # "vint32m8_t" ->ₛ "s") 0 vl_pre L )
  **  (IntArray.undef_seg &((a_pre)  # "vint32m8_t" ->ₛ "s") vl_pre 1024 )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition vstore_safety_wit_2 := 
forall (vl_pre: Z) (a_pre: Z) (p_pre: Z) (L: (@list Z)) (i: Z) (PreH1 : (i < vl_pre)) (PreH2 : (0 <= i)) (PreH3 : (i <= vl_pre)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 1024)) ,
  (IntArray.seg p_pre 0 (i + 1 ) (app ((sublist (0) (i) (L))) ((cons ((Znth (i - 0 ) L 0)) ((@nil Z))))) )
  **  (IntArray.undef_seg p_pre (i + 1 ) vl_pre )
  **  (IntArray.seg &((a_pre)  # "vint32m8_t" ->ₛ "s") 0 vl_pre L )
  **  ((( &( "i" ) )) # Int  |-> i)
  **  (IntArray.undef_seg &((a_pre)  # "vint32m8_t" ->ₛ "s") vl_pre 1024 )
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "vl" ) )) # Int  |-> vl_pre)
|--
  “ ((i + 1 ) <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= (i + 1 )) ”
.

Definition vstore_entail_wit_1 := 
(
forall (vl_pre: Z) (a_pre: Z) (p_pre: Z) (L: (@list Z)) (PreH1 : (0 <= vl_pre)) (PreH2 : (vl_pre <= 1024)) ,
  (IntArray.undef_full p_pre vl_pre )
  **  (IntArray.seg &((a_pre)  # "vint32m8_t" ->ₛ "s") 0 vl_pre L )
  **  (IntArray.undef_seg &((a_pre)  # "vint32m8_t" ->ₛ "s") vl_pre 1024 )
|--
  “ (0 <= 0) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 1024) ”
  &&  (IntArray.seg p_pre 0 0 (sublist (0) (0) (L)) )
  **  (IntArray.undef_seg p_pre 0 vl_pre )
  **  (IntArray.seg &((a_pre)  # "vint32m8_t" ->ₛ "s") 0 vl_pre L )
  **  (IntArray.undef_seg &((a_pre)  # "vint32m8_t" ->ₛ "s") vl_pre 1024 )
) \/
(
forall (vl_pre: Z) (L: (@list Z)) (PreH1 : (0 <= vl_pre)) (PreH2 : (vl_pre <= 1024)) ,
  TT && emp 
|--
  “ ((sublist (0) (0) (L)) = (@nil Z)) ”
  &&  emp
).

Definition vstore_entail_wit_1_split_goal_1 := 
forall (vl_pre: Z) (L: (@list Z)) (PreH1 : (0 <= vl_pre)) (PreH2 : (vl_pre <= 1024)) ,
  ((sublist (0) (0) (L)) = (@nil Z))
.

Definition vstore_entail_wit_2 := 
(
forall (vl_pre: Z) (a_pre: Z) (p_pre: Z) (L: (@list Z)) (i: Z) (PreH1 : (i < vl_pre)) (PreH2 : (0 <= i)) (PreH3 : (i <= vl_pre)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 1024)) ,
  (IntArray.seg p_pre 0 (i + 1 ) (app ((sublist (0) (i) (L))) ((cons ((Znth (i - 0 ) L 0)) ((@nil Z))))) )
  **  (IntArray.undef_seg p_pre (i + 1 ) vl_pre )
  **  (IntArray.seg &((a_pre)  # "vint32m8_t" ->ₛ "s") 0 vl_pre L )
  **  (IntArray.undef_seg &((a_pre)  # "vint32m8_t" ->ₛ "s") vl_pre 1024 )
|--
  “ (0 <= (i + 1 )) ” 
  &&  “ ((i + 1 ) <= vl_pre) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 1024) ”
  &&  (IntArray.seg p_pre 0 (i + 1 ) (sublist (0) ((i + 1 )) (L)) )
  **  (IntArray.undef_seg p_pre (i + 1 ) vl_pre )
  **  (IntArray.seg &((a_pre)  # "vint32m8_t" ->ₛ "s") 0 vl_pre L )
  **  (IntArray.undef_seg &((a_pre)  # "vint32m8_t" ->ₛ "s") vl_pre 1024 )
) \/
(
forall (vl_pre: Z) (L: (@list Z)) (i: Z) (PreH1 : (i < vl_pre)) (PreH2 : (0 <= i)) (PreH3 : (i <= vl_pre)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 1024)) ,
  TT && emp 
|--
  “ ((app ((sublist (0) (i) (L))) ((cons ((Znth (i - 0 ) L 0)) ((@nil Z))))) = (sublist (0) ((i + 1 )) (L))) ”
  &&  emp
).

Definition vstore_entail_wit_2_split_goal_1 := 
forall (vl_pre: Z) (L: (@list Z)) (i: Z) (PreH1 : (i < vl_pre)) (PreH2 : (0 <= i)) (PreH3 : (i <= vl_pre)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 1024)) ,
  ((app ((sublist (0) (i) (L))) ((cons ((Znth (i - 0 ) L 0)) ((@nil Z))))) = (sublist (0) ((i + 1 )) (L)))
.

Definition vstore_return_wit_1 := 
(
forall (vl_pre: Z) (a_pre: Z) (p_pre: Z) (L: (@list Z)) (i: Z) (PreH1 : (i >= vl_pre)) (PreH2 : (0 <= i)) (PreH3 : (i <= vl_pre)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 1024)) ,
  (IntArray.seg p_pre 0 i (sublist (0) (i) (L)) )
  **  (IntArray.undef_seg p_pre i vl_pre )
  **  (IntArray.seg &((a_pre)  # "vint32m8_t" ->ₛ "s") 0 vl_pre L )
  **  (IntArray.undef_seg &((a_pre)  # "vint32m8_t" ->ₛ "s") vl_pre 1024 )
|--
  (IntArray.full p_pre vl_pre L )
  **  (IntArray.seg &((a_pre)  # "vint32m8_t" ->ₛ "s") 0 vl_pre L )
  **  (IntArray.undef_seg &((a_pre)  # "vint32m8_t" ->ₛ "s") vl_pre 1024 )
) \/
(
forall (vl_pre: Z) (p_pre: Z) (L: (@list Z)) (i: Z) (PreH1 : (i >= vl_pre)) (PreH2 : (0 <= i)) (PreH3 : (i <= vl_pre)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 1024)) ,
  (IntArray.seg p_pre 0 i (sublist (0) (i) (L)) )
|--
  (IntArray.full p_pre vl_pre L )
).

Definition vstore_return_wit_1_split_goal_spatial := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list Z)) (i: Z) (PreH1 : (i >= vl_pre)) (PreH2 : (0 <= i)) (PreH3 : (i <= vl_pre)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 1024)) ,
  (IntArray.seg p_pre 0 i (sublist (0) (i) (L)) )
|--
  (IntArray.full p_pre vl_pre L )
.

Definition vstore_partial_solve_wit_1 := 
forall (vl_pre: Z) (a_pre: Z) (p_pre: Z) (L: (@list Z)) (i: Z) (PreH1 : (i < vl_pre)) (PreH2 : (0 <= i)) (PreH3 : (i <= vl_pre)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 1024)) ,
  (IntArray.seg p_pre 0 i (sublist (0) (i) (L)) )
  **  (IntArray.undef_seg p_pre i vl_pre )
  **  (IntArray.seg &((a_pre)  # "vint32m8_t" ->ₛ "s") 0 vl_pre L )
  **  (IntArray.undef_seg &((a_pre)  # "vint32m8_t" ->ₛ "s") vl_pre 1024 )
|--
  “ (i < vl_pre) ” 
  &&  “ (0 <= i) ” 
  &&  “ (i <= vl_pre) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 1024) ”
  &&  (((&((a_pre)  # "vint32m8_t" ->ₛ "s") + (i * sizeof(INT)))) # Int  |-> (Znth (i - 0 ) L 0))
  **  (IntArray.missing_i &((a_pre)  # "vint32m8_t" ->ₛ "s") i 0 vl_pre L )
  **  (IntArray.seg p_pre 0 i (sublist (0) (i) (L)) )
  **  (IntArray.undef_seg p_pre i vl_pre )
  **  (IntArray.undef_seg &((a_pre)  # "vint32m8_t" ->ₛ "s") vl_pre 1024 )
.

Definition vstore_partial_solve_wit_2 := 
forall (vl_pre: Z) (a_pre: Z) (p_pre: Z) (L: (@list Z)) (i: Z) (PreH1 : (i < vl_pre)) (PreH2 : (0 <= i)) (PreH3 : (i <= vl_pre)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 1024)) ,
  (IntArray.seg &((a_pre)  # "vint32m8_t" ->ₛ "s") 0 vl_pre L )
  **  (IntArray.seg p_pre 0 i (sublist (0) (i) (L)) )
  **  (IntArray.undef_seg p_pre i vl_pre )
  **  (IntArray.undef_seg &((a_pre)  # "vint32m8_t" ->ₛ "s") vl_pre 1024 )
|--
  “ (i < vl_pre) ” 
  &&  “ (0 <= i) ” 
  &&  “ (i <= vl_pre) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 1024) ”
  &&  (((p_pre + (i * sizeof(INT)))) # Int  |->_)
  **  (IntArray.undef_seg p_pre (i + 1 ) vl_pre )
  **  (IntArray.seg &((a_pre)  # "vint32m8_t" ->ₛ "s") 0 vl_pre L )
  **  (IntArray.seg p_pre 0 i (sublist (0) (i) (L)) )
  **  (IntArray.undef_seg &((a_pre)  # "vint32m8_t" ->ₛ "s") vl_pre 1024 )
.

Module Type VC_Correct.

Include int_array_Strategy_Correct.
Include uint_array_Strategy_Correct.
Include undef_uint_array_Strategy_Correct.
Include array_shape_Strategy_Correct.

Axiom proof_of_vload_safety_wit_1 : vload_safety_wit_1.
Axiom proof_of_vload_safety_wit_2 : vload_safety_wit_2.
Axiom proof_of_vload_entail_wit_1 : vload_entail_wit_1.
Axiom proof_of_vload_entail_wit_2 : vload_entail_wit_2.
Axiom proof_of_vload_return_wit_1 : vload_return_wit_1.
Axiom proof_of_vload_partial_solve_wit_1 : vload_partial_solve_wit_1.
Axiom proof_of_vload_partial_solve_wit_2 : vload_partial_solve_wit_2.
Axiom proof_of_vstore_safety_wit_1 : vstore_safety_wit_1.
Axiom proof_of_vstore_safety_wit_2 : vstore_safety_wit_2.
Axiom proof_of_vstore_entail_wit_1 : vstore_entail_wit_1.
Axiom proof_of_vstore_entail_wit_2 : vstore_entail_wit_2.
Axiom proof_of_vstore_return_wit_1 : vstore_return_wit_1.
Axiom proof_of_vstore_partial_solve_wit_1 : vstore_partial_solve_wit_1.
Axiom proof_of_vstore_partial_solve_wit_2 : vstore_partial_solve_wit_2.

End VC_Correct.
