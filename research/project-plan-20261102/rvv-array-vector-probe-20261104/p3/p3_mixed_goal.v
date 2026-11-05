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
forall (vl_pre: Z) (p_pre: Z) (r_pre: Z) (L: (@list Z)) (PreH1 : (0 <= vl_pre)) (PreH2 : (vl_pre <= 128)) ,
  ((( &( "i" ) )) # Int  |->_)
  **  ((( &( "r" ) )) # Ptr  |-> r_pre)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "vl" ) )) # Int  |-> vl_pre)
  **  (IntArray.full p_pre vl_pre L )
  **  (IntArray.undef_full &((r_pre)  # "vint32m8_t" ->ₛ "s") 128 )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition vload_safety_wit_2 := 
forall (vl_pre: Z) (p_pre: Z) (r_pre: Z) (L: (@list Z)) (i: Z) (PreH1 : (0 <= i)) (PreH2 : (i <= 128)) (PreH3 : (0 <= vl_pre)) (PreH4 : (vl_pre <= 128)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 128)) ,
  ((( &( "i" ) )) # Int  |-> i)
  **  (IntArray.full p_pre vl_pre L )
  **  (IntArray.seg &((r_pre)  # "vint32m8_t" ->ₛ "s") 0 i (sublist (0) (i) ((app (L) ((zeros ((128 - vl_pre ))))))) )
  **  (IntArray.undef_seg &((r_pre)  # "vint32m8_t" ->ₛ "s") i 128 )
  **  ((( &( "r" ) )) # Ptr  |-> r_pre)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "vl" ) )) # Int  |-> vl_pre)
|--
  “ (128 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 128) ”
.

Definition vload_safety_wit_3 := 
forall (vl_pre: Z) (p_pre: Z) (r_pre: Z) (L: (@list Z)) (i: Z) (PreH1 : (i >= vl_pre)) (PreH2 : (i < 128)) (PreH3 : (0 <= i)) (PreH4 : (i <= 128)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 128)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 128)) ,
  ((( &( "i" ) )) # Int  |-> i)
  **  (IntArray.full p_pre vl_pre L )
  **  (IntArray.seg &((r_pre)  # "vint32m8_t" ->ₛ "s") 0 i (sublist (0) (i) ((app (L) ((zeros ((128 - vl_pre ))))))) )
  **  (IntArray.undef_seg &((r_pre)  # "vint32m8_t" ->ₛ "s") i 128 )
  **  ((( &( "r" ) )) # Ptr  |-> r_pre)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "vl" ) )) # Int  |-> vl_pre)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition vload_safety_wit_4 := 
forall (vl_pre: Z) (p_pre: Z) (r_pre: Z) (L: (@list Z)) (i: Z) (PreH1 : (i < vl_pre)) (PreH2 : (i < 128)) (PreH3 : (0 <= i)) (PreH4 : (i <= 128)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 128)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 128)) ,
  (IntArray.seg &((r_pre)  # "vint32m8_t" ->ₛ "s") 0 (i + 1 ) (app ((sublist (0) (i) ((app (L) ((zeros ((128 - vl_pre )))))))) ((cons ((Znth i L 0)) ((@nil Z))))) )
  **  (IntArray.undef_seg &((r_pre)  # "vint32m8_t" ->ₛ "s") (i + 1 ) 128 )
  **  (IntArray.full p_pre vl_pre L )
  **  ((( &( "i" ) )) # Int  |-> i)
  **  ((( &( "r" ) )) # Ptr  |-> r_pre)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "vl" ) )) # Int  |-> vl_pre)
|--
  “ ((i + 1 ) <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= (i + 1 )) ”
.

Definition vload_safety_wit_5 := 
forall (vl_pre: Z) (p_pre: Z) (r_pre: Z) (L: (@list Z)) (i: Z) (PreH1 : (i >= vl_pre)) (PreH2 : (i < 128)) (PreH3 : (0 <= i)) (PreH4 : (i <= 128)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 128)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 128)) ,
  (IntArray.seg &((r_pre)  # "vint32m8_t" ->ₛ "s") 0 (i + 1 ) (app ((sublist (0) (i) ((app (L) ((zeros ((128 - vl_pre )))))))) ((cons (0) ((@nil Z))))) )
  **  (IntArray.undef_seg &((r_pre)  # "vint32m8_t" ->ₛ "s") (i + 1 ) 128 )
  **  ((( &( "i" ) )) # Int  |-> i)
  **  (IntArray.full p_pre vl_pre L )
  **  ((( &( "r" ) )) # Ptr  |-> r_pre)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "vl" ) )) # Int  |-> vl_pre)
|--
  “ ((i + 1 ) <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= (i + 1 )) ”
.

Definition vload_entail_wit_1 := 
(
forall (vl_pre: Z) (p_pre: Z) (r_pre: Z) (L: (@list Z)) (PreH1 : (0 <= vl_pre)) (PreH2 : (vl_pre <= 128)) ,
  (IntArray.full p_pre vl_pre L )
  **  (IntArray.undef_full &((r_pre)  # "vint32m8_t" ->ₛ "s") 128 )
|--
  “ (0 <= 0) ” 
  &&  “ (0 <= 128) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 128) ”
  &&  (IntArray.full p_pre vl_pre L )
  **  (IntArray.seg &((r_pre)  # "vint32m8_t" ->ₛ "s") 0 0 (sublist (0) (0) ((app (L) ((zeros ((128 - vl_pre ))))))) )
  **  (IntArray.undef_seg &((r_pre)  # "vint32m8_t" ->ₛ "s") 0 128 )
) \/
(
forall (vl_pre: Z) (L: (@list Z)) (PreH1 : (0 <= vl_pre)) (PreH2 : (vl_pre <= 128)) ,
  TT && emp 
|--
  “ ((sublist (0) (0) ((app (L) ((zeros ((128 - vl_pre ))))))) = (@nil Z)) ”
  &&  emp
).

Definition vload_entail_wit_1_split_goal_1 := 
forall (vl_pre: Z) (L: (@list Z)) (PreH1 : (0 <= vl_pre)) (PreH2 : (vl_pre <= 128)) ,
  ((sublist (0) (0) ((app (L) ((zeros ((128 - vl_pre ))))))) = (@nil Z))
.

Definition vload_entail_wit_2_1 := 
(
forall (vl_pre: Z) (p_pre: Z) (r_pre: Z) (L: (@list Z)) (i: Z) (PreH1 : (i < vl_pre)) (PreH2 : (i < 128)) (PreH3 : (0 <= i)) (PreH4 : (i <= 128)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 128)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 128)) ,
  (IntArray.seg &((r_pre)  # "vint32m8_t" ->ₛ "s") 0 (i + 1 ) (app ((sublist (0) (i) ((app (L) ((zeros ((128 - vl_pre )))))))) ((cons ((Znth i L 0)) ((@nil Z))))) )
  **  (IntArray.undef_seg &((r_pre)  # "vint32m8_t" ->ₛ "s") (i + 1 ) 128 )
  **  (IntArray.full p_pre vl_pre L )
|--
  “ (0 <= (i + 1 )) ” 
  &&  “ ((i + 1 ) <= 128) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 128) ”
  &&  (IntArray.full p_pre vl_pre L )
  **  (IntArray.seg &((r_pre)  # "vint32m8_t" ->ₛ "s") 0 (i + 1 ) (sublist (0) ((i + 1 )) ((app (L) ((zeros ((128 - vl_pre ))))))) )
  **  (IntArray.undef_seg &((r_pre)  # "vint32m8_t" ->ₛ "s") (i + 1 ) 128 )
) \/
(
forall (vl_pre: Z) (L: (@list Z)) (i: Z) (PreH1 : (i < vl_pre)) (PreH2 : (i < 128)) (PreH3 : (0 <= i)) (PreH4 : (i <= 128)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 128)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 128)) ,
  TT && emp 
|--
  “ ((app ((sublist (0) (i) ((app (L) ((zeros ((128 - vl_pre )))))))) ((cons ((Znth i L 0)) ((@nil Z))))) = (sublist (0) ((i + 1 )) ((app (L) ((zeros ((128 - vl_pre )))))))) ”
  &&  emp
).

Definition vload_entail_wit_2_1_split_goal_1 := 
forall (vl_pre: Z) (L: (@list Z)) (i: Z) (PreH1 : (i < vl_pre)) (PreH2 : (i < 128)) (PreH3 : (0 <= i)) (PreH4 : (i <= 128)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 128)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 128)) ,
  ((app ((sublist (0) (i) ((app (L) ((zeros ((128 - vl_pre )))))))) ((cons ((Znth i L 0)) ((@nil Z))))) = (sublist (0) ((i + 1 )) ((app (L) ((zeros ((128 - vl_pre ))))))))
.

Definition vload_entail_wit_2_2 := 
(
forall (vl_pre: Z) (p_pre: Z) (r_pre: Z) (L: (@list Z)) (i: Z) (PreH1 : (i >= vl_pre)) (PreH2 : (i < 128)) (PreH3 : (0 <= i)) (PreH4 : (i <= 128)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 128)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 128)) ,
  (IntArray.seg &((r_pre)  # "vint32m8_t" ->ₛ "s") 0 (i + 1 ) (app ((sublist (0) (i) ((app (L) ((zeros ((128 - vl_pre )))))))) ((cons (0) ((@nil Z))))) )
  **  (IntArray.undef_seg &((r_pre)  # "vint32m8_t" ->ₛ "s") (i + 1 ) 128 )
  **  (IntArray.full p_pre vl_pre L )
|--
  “ (0 <= (i + 1 )) ” 
  &&  “ ((i + 1 ) <= 128) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 128) ”
  &&  (IntArray.full p_pre vl_pre L )
  **  (IntArray.seg &((r_pre)  # "vint32m8_t" ->ₛ "s") 0 (i + 1 ) (sublist (0) ((i + 1 )) ((app (L) ((zeros ((128 - vl_pre ))))))) )
  **  (IntArray.undef_seg &((r_pre)  # "vint32m8_t" ->ₛ "s") (i + 1 ) 128 )
) \/
(
forall (vl_pre: Z) (L: (@list Z)) (i: Z) (PreH1 : (i >= vl_pre)) (PreH2 : (i < 128)) (PreH3 : (0 <= i)) (PreH4 : (i <= 128)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 128)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 128)) ,
  TT && emp 
|--
  “ ((app ((sublist (0) (i) ((app (L) ((zeros ((128 - vl_pre )))))))) ((cons (0) ((@nil Z))))) = (sublist (0) ((i + 1 )) ((app (L) ((zeros ((128 - vl_pre )))))))) ”
  &&  emp
).

Definition vload_entail_wit_2_2_split_goal_1 := 
forall (vl_pre: Z) (L: (@list Z)) (i: Z) (PreH1 : (i >= vl_pre)) (PreH2 : (i < 128)) (PreH3 : (0 <= i)) (PreH4 : (i <= 128)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 128)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 128)) ,
  ((app ((sublist (0) (i) ((app (L) ((zeros ((128 - vl_pre )))))))) ((cons (0) ((@nil Z))))) = (sublist (0) ((i + 1 )) ((app (L) ((zeros ((128 - vl_pre ))))))))
.

Definition vload_return_wit_1 := 
(
forall (vl_pre: Z) (p_pre: Z) (r_pre: Z) (L: (@list Z)) (i: Z) (PreH1 : (i >= 128)) (PreH2 : (0 <= i)) (PreH3 : (i <= 128)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 128)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= 128)) ,
  (IntArray.full p_pre vl_pre L )
  **  (IntArray.seg &((r_pre)  # "vint32m8_t" ->ₛ "s") 0 i (sublist (0) (i) ((app (L) ((zeros ((128 - vl_pre ))))))) )
  **  (IntArray.undef_seg &((r_pre)  # "vint32m8_t" ->ₛ "s") i 128 )
|--
  EX (T: (@list Z)) ,
  “ ((Zlength (T)) = (128 - vl_pre )) ”
  &&  (IntArray.full p_pre vl_pre L )
  **  (IntArray.full &((r_pre)  # "vint32m8_t" ->ₛ "s") 128 (app (L) (T)) )
) \/
(
forall (vl_pre: Z) (r_pre: Z) (L: (@list Z)) (i: Z) (PreH1 : (i >= 128)) (PreH2 : (0 <= i)) (PreH3 : (i <= 128)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 128)) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= 128)) ,
  (IntArray.seg &((r_pre)  # "vint32m8_t" ->ₛ "s") 0 i (sublist (0) (i) ((app (L) ((zeros ((128 - vl_pre ))))))) )
|--
  EX (T: (@list Z)) ,
  “ ((Zlength (T)) = (128 - vl_pre )) ”
  &&  (IntArray.full &((r_pre)  # "vint32m8_t" ->ₛ "s") 128 (app (L) (T)) )
).

Definition vload_partial_solve_wit_1 := 
forall (vl_pre: Z) (p_pre: Z) (r_pre: Z) (L: (@list Z)) (i: Z) (PreH1 : (i < vl_pre)) (PreH2 : (i < 128)) (PreH3 : (0 <= i)) (PreH4 : (i <= 128)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 128)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 128)) ,
  (IntArray.full p_pre vl_pre L )
  **  (IntArray.seg &((r_pre)  # "vint32m8_t" ->ₛ "s") 0 i (sublist (0) (i) ((app (L) ((zeros ((128 - vl_pre ))))))) )
  **  (IntArray.undef_seg &((r_pre)  # "vint32m8_t" ->ₛ "s") i 128 )
|--
  “ (i < vl_pre) ” 
  &&  “ (i < 128) ” 
  &&  “ (0 <= i) ” 
  &&  “ (i <= 128) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 128) ”
  &&  (((p_pre + (i * sizeof(INT)))) # Int  |-> (Znth i L 0))
  **  (IntArray.missing_i p_pre i 0 vl_pre L )
  **  (IntArray.seg &((r_pre)  # "vint32m8_t" ->ₛ "s") 0 i (sublist (0) (i) ((app (L) ((zeros ((128 - vl_pre ))))))) )
  **  (IntArray.undef_seg &((r_pre)  # "vint32m8_t" ->ₛ "s") i 128 )
.

Definition vload_partial_solve_wit_2 := 
forall (vl_pre: Z) (p_pre: Z) (r_pre: Z) (L: (@list Z)) (i: Z) (PreH1 : (i < vl_pre)) (PreH2 : (i < 128)) (PreH3 : (0 <= i)) (PreH4 : (i <= 128)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 128)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 128)) ,
  (IntArray.full p_pre vl_pre L )
  **  (IntArray.seg &((r_pre)  # "vint32m8_t" ->ₛ "s") 0 i (sublist (0) (i) ((app (L) ((zeros ((128 - vl_pre ))))))) )
  **  (IntArray.undef_seg &((r_pre)  # "vint32m8_t" ->ₛ "s") i 128 )
|--
  “ (i < vl_pre) ” 
  &&  “ (i < 128) ” 
  &&  “ (0 <= i) ” 
  &&  “ (i <= 128) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 128) ”
  &&  (((&((r_pre)  # "vint32m8_t" ->ₛ "s") + (i * sizeof(INT)))) # Int  |->_)
  **  (IntArray.undef_seg &((r_pre)  # "vint32m8_t" ->ₛ "s") (i + 1 ) 128 )
  **  (IntArray.full p_pre vl_pre L )
  **  (IntArray.seg &((r_pre)  # "vint32m8_t" ->ₛ "s") 0 i (sublist (0) (i) ((app (L) ((zeros ((128 - vl_pre ))))))) )
.

Definition vload_partial_solve_wit_3 := 
forall (vl_pre: Z) (p_pre: Z) (r_pre: Z) (L: (@list Z)) (i: Z) (PreH1 : (i >= vl_pre)) (PreH2 : (i < 128)) (PreH3 : (0 <= i)) (PreH4 : (i <= 128)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 128)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 128)) ,
  (IntArray.full p_pre vl_pre L )
  **  (IntArray.seg &((r_pre)  # "vint32m8_t" ->ₛ "s") 0 i (sublist (0) (i) ((app (L) ((zeros ((128 - vl_pre ))))))) )
  **  (IntArray.undef_seg &((r_pre)  # "vint32m8_t" ->ₛ "s") i 128 )
|--
  “ (i >= vl_pre) ” 
  &&  “ (i < 128) ” 
  &&  “ (0 <= i) ” 
  &&  “ (i <= 128) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 128) ”
  &&  (((&((r_pre)  # "vint32m8_t" ->ₛ "s") + (i * sizeof(INT)))) # Int  |->_)
  **  (IntArray.undef_seg &((r_pre)  # "vint32m8_t" ->ₛ "s") (i + 1 ) 128 )
  **  (IntArray.full p_pre vl_pre L )
  **  (IntArray.seg &((r_pre)  # "vint32m8_t" ->ₛ "s") 0 i (sublist (0) (i) ((app (L) ((zeros ((128 - vl_pre ))))))) )
.

(*----- Function vstore -----*)

Definition vstore_safety_wit_1 := 
forall (vl_pre: Z) (a_pre: Z) (p_pre: Z) (V: (@list Z)) (PreH1 : (0 <= vl_pre)) (PreH2 : (vl_pre <= 128)) ,
  ((( &( "i" ) )) # Int  |->_)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "vl" ) )) # Int  |-> vl_pre)
  **  (IntArray.undef_full p_pre vl_pre )
  **  (IntArray.full &((a_pre)  # "vint32m8_t" ->ₛ "s") 128 V )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition vstore_safety_wit_2 := 
forall (vl_pre: Z) (a_pre: Z) (p_pre: Z) (V: (@list Z)) (i: Z) (PreH1 : (i < vl_pre)) (PreH2 : (0 <= i)) (PreH3 : (i <= vl_pre)) (PreH4 : (vl_pre <= 128)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 128)) ,
  (IntArray.seg p_pre 0 (i + 1 ) (app ((sublist (0) (i) (V))) ((cons ((Znth i V 0)) ((@nil Z))))) )
  **  (IntArray.undef_seg p_pre (i + 1 ) vl_pre )
  **  (IntArray.full &((a_pre)  # "vint32m8_t" ->ₛ "s") 128 V )
  **  ((( &( "i" ) )) # Int  |-> i)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "vl" ) )) # Int  |-> vl_pre)
|--
  “ ((i + 1 ) <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= (i + 1 )) ”
.

Definition vstore_entail_wit_1 := 
(
forall (vl_pre: Z) (a_pre: Z) (p_pre: Z) (V: (@list Z)) (PreH1 : (0 <= vl_pre)) (PreH2 : (vl_pre <= 128)) ,
  (IntArray.undef_full p_pre vl_pre )
  **  (IntArray.full &((a_pre)  # "vint32m8_t" ->ₛ "s") 128 V )
|--
  “ (0 <= 0) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 128) ”
  &&  (IntArray.seg p_pre 0 0 (sublist (0) (0) (V)) )
  **  (IntArray.undef_seg p_pre 0 vl_pre )
  **  (IntArray.full &((a_pre)  # "vint32m8_t" ->ₛ "s") 128 V )
) \/
(
forall (vl_pre: Z) (V: (@list Z)) (PreH1 : (0 <= vl_pre)) (PreH2 : (vl_pre <= 128)) ,
  TT && emp 
|--
  “ ((sublist (0) (0) (V)) = (@nil Z)) ”
  &&  emp
).

Definition vstore_entail_wit_1_split_goal_1 := 
forall (vl_pre: Z) (V: (@list Z)) (PreH1 : (0 <= vl_pre)) (PreH2 : (vl_pre <= 128)) ,
  ((sublist (0) (0) (V)) = (@nil Z))
.

Definition vstore_entail_wit_2 := 
(
forall (vl_pre: Z) (a_pre: Z) (p_pre: Z) (V: (@list Z)) (i: Z) (PreH1 : (i < vl_pre)) (PreH2 : (0 <= i)) (PreH3 : (i <= vl_pre)) (PreH4 : (vl_pre <= 128)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 128)) ,
  (IntArray.seg p_pre 0 (i + 1 ) (app ((sublist (0) (i) (V))) ((cons ((Znth i V 0)) ((@nil Z))))) )
  **  (IntArray.undef_seg p_pre (i + 1 ) vl_pre )
  **  (IntArray.full &((a_pre)  # "vint32m8_t" ->ₛ "s") 128 V )
|--
  “ (0 <= (i + 1 )) ” 
  &&  “ ((i + 1 ) <= vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 128) ”
  &&  (IntArray.seg p_pre 0 (i + 1 ) (sublist (0) ((i + 1 )) (V)) )
  **  (IntArray.undef_seg p_pre (i + 1 ) vl_pre )
  **  (IntArray.full &((a_pre)  # "vint32m8_t" ->ₛ "s") 128 V )
) \/
(
forall (vl_pre: Z) (V: (@list Z)) (i: Z) (PreH1 : (i < vl_pre)) (PreH2 : (0 <= i)) (PreH3 : (i <= vl_pre)) (PreH4 : (vl_pre <= 128)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 128)) ,
  TT && emp 
|--
  “ ((app ((sublist (0) (i) (V))) ((cons ((Znth i V 0)) ((@nil Z))))) = (sublist (0) ((i + 1 )) (V))) ”
  &&  emp
).

Definition vstore_entail_wit_2_split_goal_1 := 
forall (vl_pre: Z) (V: (@list Z)) (i: Z) (PreH1 : (i < vl_pre)) (PreH2 : (0 <= i)) (PreH3 : (i <= vl_pre)) (PreH4 : (vl_pre <= 128)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 128)) ,
  ((app ((sublist (0) (i) (V))) ((cons ((Znth i V 0)) ((@nil Z))))) = (sublist (0) ((i + 1 )) (V)))
.

Definition vstore_return_wit_1 := 
(
forall (vl_pre: Z) (a_pre: Z) (p_pre: Z) (V: (@list Z)) (i: Z) (PreH1 : (i >= vl_pre)) (PreH2 : (0 <= i)) (PreH3 : (i <= vl_pre)) (PreH4 : (vl_pre <= 128)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 128)) ,
  (IntArray.seg p_pre 0 i (sublist (0) (i) (V)) )
  **  (IntArray.undef_seg p_pre i vl_pre )
  **  (IntArray.full &((a_pre)  # "vint32m8_t" ->ₛ "s") 128 V )
|--
  (IntArray.full p_pre vl_pre (sublist (0) (vl_pre) (V)) )
  **  (IntArray.full &((a_pre)  # "vint32m8_t" ->ₛ "s") 128 V )
) \/
(
forall (vl_pre: Z) (p_pre: Z) (V: (@list Z)) (i: Z) (PreH1 : (i >= vl_pre)) (PreH2 : (0 <= i)) (PreH3 : (i <= vl_pre)) (PreH4 : (vl_pre <= 128)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 128)) ,
  (IntArray.seg p_pre 0 i (sublist (0) (i) (V)) )
|--
  (IntArray.full p_pre vl_pre (sublist (0) (vl_pre) (V)) )
).

Definition vstore_return_wit_1_split_goal_spatial := 
forall (vl_pre: Z) (p_pre: Z) (V: (@list Z)) (i: Z) (PreH1 : (i >= vl_pre)) (PreH2 : (0 <= i)) (PreH3 : (i <= vl_pre)) (PreH4 : (vl_pre <= 128)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 128)) ,
  (IntArray.seg p_pre 0 i (sublist (0) (i) (V)) )
|--
  (IntArray.full p_pre vl_pre (sublist (0) (vl_pre) (V)) )
.

Definition vstore_partial_solve_wit_1 := 
forall (vl_pre: Z) (a_pre: Z) (p_pre: Z) (V: (@list Z)) (i: Z) (PreH1 : (i < vl_pre)) (PreH2 : (0 <= i)) (PreH3 : (i <= vl_pre)) (PreH4 : (vl_pre <= 128)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 128)) ,
  (IntArray.seg p_pre 0 i (sublist (0) (i) (V)) )
  **  (IntArray.undef_seg p_pre i vl_pre )
  **  (IntArray.full &((a_pre)  # "vint32m8_t" ->ₛ "s") 128 V )
|--
  “ (i < vl_pre) ” 
  &&  “ (0 <= i) ” 
  &&  “ (i <= vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 128) ”
  &&  (((&((a_pre)  # "vint32m8_t" ->ₛ "s") + (i * sizeof(INT)))) # Int  |-> (Znth i V 0))
  **  (IntArray.missing_i &((a_pre)  # "vint32m8_t" ->ₛ "s") i 0 128 V )
  **  (IntArray.seg p_pre 0 i (sublist (0) (i) (V)) )
  **  (IntArray.undef_seg p_pre i vl_pre )
.

Definition vstore_partial_solve_wit_2 := 
forall (vl_pre: Z) (a_pre: Z) (p_pre: Z) (V: (@list Z)) (i: Z) (PreH1 : (i < vl_pre)) (PreH2 : (0 <= i)) (PreH3 : (i <= vl_pre)) (PreH4 : (vl_pre <= 128)) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 128)) ,
  (IntArray.full &((a_pre)  # "vint32m8_t" ->ₛ "s") 128 V )
  **  (IntArray.seg p_pre 0 i (sublist (0) (i) (V)) )
  **  (IntArray.undef_seg p_pre i vl_pre )
|--
  “ (i < vl_pre) ” 
  &&  “ (0 <= i) ” 
  &&  “ (i <= vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 128) ”
  &&  (((p_pre + (i * sizeof(INT)))) # Int  |->_)
  **  (IntArray.undef_seg p_pre (i + 1 ) vl_pre )
  **  (IntArray.full &((a_pre)  # "vint32m8_t" ->ₛ "s") 128 V )
  **  (IntArray.seg p_pre 0 i (sublist (0) (i) (V)) )
.

(*----- Function vload_v -----*)

Definition vload_v_return_wit_1 := 
(
forall (vl_pre: Z) (p_pre: Z) (L: (@list Z)) (T_2: (@list Z)) (record_return: Z) (PreH1 : ((Zlength (T_2)) = (128 - vl_pre ))) (PreH2 : (0 <= vl_pre)) (PreH3 : (vl_pre <= 128)) ,
  (IntArray.full &((record_return)  # "vint32m8_t" ->ₛ "s") 128 (app (L) (T_2)) )
  **  (IntArray.full p_pre vl_pre L )
|--
  EX (T: (@list Z)) ,
  “ ((Zlength (T)) = (128 - vl_pre )) ”
  &&  (IntArray.full p_pre vl_pre L )
  **  (IntArray.full &((record_return)  # "vint32m8_t" ->ₛ "s") 128 (app (L) (T)) )
) \/
(
forall (vl_pre: Z) (L: (@list Z)) (T_2: (@list Z)) (PreH1 : ((Zlength (T_2)) = (128 - vl_pre ))) (PreH2 : (0 <= vl_pre)) (PreH3 : (vl_pre <= 128)) ,
  TT && emp 
|--
  EX (T: (@list Z)) ,
  “ ((app (L) (T_2)) = (app (L) (T))) ” 
  &&  “ ((Zlength (T)) = (128 - vl_pre )) ”
  &&  emp
).

Definition vload_v_partial_solve_wit_1_pure := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list Z)) (PreH1 : (0 <= vl_pre)) (PreH2 : (vl_pre <= 128)) ,
  (UndefStructPredvint32m8_t ( &( "r" ) ) )
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "vl" ) )) # Int  |-> vl_pre)
  **  (IntArray.full p_pre vl_pre L )
|--
  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 128) ”
.

Definition vload_v_partial_solve_wit_1_aux := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list Z)) (PreH1 : (0 <= vl_pre)) (PreH2 : (vl_pre <= 128)) ,
  (UndefStructPredvint32m8_t ( &( "r" ) ) )
  **  (IntArray.full p_pre vl_pre L )
|--
  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 128) ”
  &&  (IntArray.full p_pre vl_pre L )
  **  (IntArray.undef_full &(( &( "r" ) )->ₛ "s") 128 )
.

Definition vload_v_partial_solve_wit_1 := vload_v_partial_solve_wit_1_pure -> vload_v_partial_solve_wit_1_aux.

Definition vload_v_partial_solve_wit_2 := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list Z)) (T: (@list Z)) (record_return: Z) (PreH1 : ((Zlength (T)) = (128 - vl_pre ))) (PreH2 : (0 <= vl_pre)) (PreH3 : (vl_pre <= 128)) ,
  (UndefStructPredvint32m8_t record_return )
  **  (IntArray.full p_pre vl_pre L )
  **  (IntArray.full &(( &( "r" ) )->ₛ "s") 128 (app (L) (T)) )
|--
  “ ((Zlength (T)) = (128 - vl_pre )) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 128) ”
  &&  (IntArray.undef_full &((record_return)  # "vint32m8_t" ->ₛ "s") 128 )
  **  (IntArray.full &(( &( "r" ) )->ₛ "s") 128 (app (L) (T)) )
  **  (IntArray.full p_pre vl_pre L )
.

(*----- Function vmax_v -----*)

Definition vmax_v_return_wit_1 := 
forall (R_2: (@list Z)) (record_return: Z) (PreH1 : ((Zlength (R_2)) = 128)) ,
  (IntArray.full &((record_return)  # "vint32m8_t" ->ₛ "s") 128 R_2 )
|--
  EX (R: (@list Z)) ,
  “ ((Zlength (R)) = 128) ”
  &&  (IntArray.full &((record_return)  # "vint32m8_t" ->ₛ "s") 128 R )
.

Definition vmax_v_partial_solve_wit_1 := 
forall (B: (@list Z)) (A: (@list Z)) ,
  (UndefStructPredvint32m8_t ( &( "r" ) ) )
  **  (IntArray.full &(( &( "a" ) )->ₛ "s") 128 A )
  **  (IntArray.full &(( &( "b" ) )->ₛ "s") 128 B )
|--
  (IntArray.full &(( &( "a" ) )->ₛ "s") 128 A )
  **  (IntArray.full &(( &( "b" ) )->ₛ "s") 128 B )
  **  (IntArray.undef_full &(( &( "r" ) )->ₛ "s") 128 )
.

Definition vmax_v_partial_solve_wit_2 := 
forall (B: (@list Z)) (A: (@list Z)) (R: (@list Z)) (record_return: Z) (PreH1 : ((Zlength (R)) = 128)) ,
  (UndefStructPredvint32m8_t record_return )
  **  (IntArray.full &(( &( "a" ) )->ₛ "s") 128 A )
  **  (IntArray.full &(( &( "b" ) )->ₛ "s") 128 B )
  **  (IntArray.full &(( &( "r" ) )->ₛ "s") 128 R )
|--
  “ ((Zlength (R)) = 128) ”
  &&  (IntArray.undef_full &((record_return)  # "vint32m8_t" ->ₛ "s") 128 )
  **  (IntArray.full &(( &( "r" ) )->ₛ "s") 128 R )
  **  (IntArray.full &(( &( "a" ) )->ₛ "s") 128 A )
  **  (IntArray.full &(( &( "b" ) )->ₛ "s") 128 B )
.

(*----- Function max_kernel -----*)

Definition max_kernel_return_wit_1 := 
(
forall (vl_pre: Z) (src_pre: Z) (dst_pre: Z) (L: (@list Z)) (T: (@list Z)) (retval: Z) (T_2: (@list Z)) (retval_2: Z) (R: (@list Z)) (retval_3: Z) (PreH1 : ((Zlength (R)) = 128)) (PreH2 : ((Zlength (T_2)) = (128 - vl_pre ))) (PreH3 : ((Zlength (T)) = (128 - vl_pre ))) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 128)) ,
  (IntArray.full dst_pre vl_pre (sublist (0) (vl_pre) (R)) )
  **  (IntArray.full &((retval_3)  # "vint32m8_t" ->ₛ "s") 128 R )
  **  (IntArray.full &((retval_2)  # "vint32m8_t" ->ₛ "s") 128 (app (L) (T_2)) )
  **  (IntArray.full src_pre vl_pre L )
  **  (IntArray.full &((retval)  # "vint32m8_t" ->ₛ "s") 128 (app (L) (T)) )
|--
  EX (D: (@list Z)) ,
  (IntArray.full src_pre vl_pre L )
  **  (IntArray.full dst_pre vl_pre D )
) \/
(
forall (vl_pre: Z) (L: (@list Z)) (T: (@list Z)) (retval: Z) (T_2: (@list Z)) (retval_2: Z) (R: (@list Z)) (retval_3: Z) (PreH1 : ((Zlength (R)) = 128)) (PreH2 : ((Zlength (T_2)) = (128 - vl_pre ))) (PreH3 : ((Zlength (T)) = (128 - vl_pre ))) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 128)) ,
  (IntArray.full &((retval_3)  # "vint32m8_t" ->ₛ "s") 128 R )
  **  (IntArray.full &((retval_2)  # "vint32m8_t" ->ₛ "s") 128 (app (L) (T_2)) )
  **  (IntArray.full &((retval)  # "vint32m8_t" ->ₛ "s") 128 (app (L) (T)) )
|--
  TT && emp 
).

Definition max_kernel_return_wit_1_split_goal_spatial := 
forall (vl_pre: Z) (L: (@list Z)) (T: (@list Z)) (retval: Z) (T_2: (@list Z)) (retval_2: Z) (R: (@list Z)) (retval_3: Z) (PreH1 : ((Zlength (R)) = 128)) (PreH2 : ((Zlength (T_2)) = (128 - vl_pre ))) (PreH3 : ((Zlength (T)) = (128 - vl_pre ))) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 128)) ,
  (IntArray.full &((retval_3)  # "vint32m8_t" ->ₛ "s") 128 R )
  **  (IntArray.full &((retval_2)  # "vint32m8_t" ->ₛ "s") 128 (app (L) (T_2)) )
  **  (IntArray.full &((retval)  # "vint32m8_t" ->ₛ "s") 128 (app (L) (T)) )
|--
  TT && emp 
.

Definition max_kernel_partial_solve_wit_1_pure := 
forall (vl_pre: Z) (src_pre: Z) (dst_pre: Z) (L: (@list Z)) (PreH1 : (0 <= vl_pre)) (PreH2 : (vl_pre <= 128)) ,
  (UndefStructPredvint32m8_t ( &( "v" ) ) )
  **  ((( &( "dst" ) )) # Ptr  |-> dst_pre)
  **  ((( &( "src" ) )) # Ptr  |-> src_pre)
  **  ((( &( "vl" ) )) # Int  |-> vl_pre)
  **  (IntArray.full src_pre vl_pre L )
  **  (IntArray.undef_full dst_pre vl_pre )
|--
  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 128) ”
.

Definition max_kernel_partial_solve_wit_1_aux := 
forall (vl_pre: Z) (src_pre: Z) (dst_pre: Z) (L: (@list Z)) (PreH1 : (0 <= vl_pre)) (PreH2 : (vl_pre <= 128)) ,
  (UndefStructPredvint32m8_t ( &( "v" ) ) )
  **  (IntArray.full src_pre vl_pre L )
  **  (IntArray.undef_full dst_pre vl_pre )
|--
  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 128) ”
  &&  (IntArray.full src_pre vl_pre L )
  **  (UndefStructPredvint32m8_t ( &( "v" ) ) )
  **  (IntArray.undef_full dst_pre vl_pre )
.

Definition max_kernel_partial_solve_wit_1 := max_kernel_partial_solve_wit_1_pure -> max_kernel_partial_solve_wit_1_aux.

Definition max_kernel_partial_solve_wit_2 := 
forall (vl_pre: Z) (src_pre: Z) (dst_pre: Z) (L: (@list Z)) (T: (@list Z)) (retval: Z) (PreH1 : ((Zlength (T)) = (128 - vl_pre ))) (PreH2 : (0 <= vl_pre)) (PreH3 : (vl_pre <= 128)) ,
  (IntArray.full src_pre vl_pre L )
  **  (IntArray.full &((retval)  # "vint32m8_t" ->ₛ "s") 128 (app (L) (T)) )
  **  (UndefStructPredvint32m8_t ( &( "v" ) ) )
  **  (IntArray.undef_full dst_pre vl_pre )
|--
  “ ((Zlength (T)) = (128 - vl_pre )) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 128) ”
  &&  (IntArray.undef_full &(( &( "v" ) )->ₛ "s") 128 )
  **  (IntArray.full &((retval)  # "vint32m8_t" ->ₛ "s") 128 (app (L) (T)) )
  **  (IntArray.full src_pre vl_pre L )
  **  (IntArray.undef_full dst_pre vl_pre )
.

Definition max_kernel_partial_solve_wit_3_pure := 
forall (vl_pre: Z) (src_pre: Z) (dst_pre: Z) (L: (@list Z)) (T: (@list Z)) (retval: Z) (PreH1 : ((Zlength (T)) = (128 - vl_pre ))) (PreH2 : (0 <= vl_pre)) (PreH3 : (vl_pre <= 128)) ,
  (UndefStructPredvint32m8_t ( &( "u" ) ) )
  **  (IntArray.full &(( &( "v" ) )->ₛ "s") 128 (app (L) (T)) )
  **  (IntArray.full &((retval)  # "vint32m8_t" ->ₛ "s") 128 (app (L) (T)) )
  **  (IntArray.full src_pre vl_pre L )
  **  ((( &( "dst" ) )) # Ptr  |-> dst_pre)
  **  ((( &( "src" ) )) # Ptr  |-> src_pre)
  **  ((( &( "vl" ) )) # Int  |-> vl_pre)
  **  (IntArray.undef_full dst_pre vl_pre )
|--
  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 128) ”
.

Definition max_kernel_partial_solve_wit_3_aux := 
forall (vl_pre: Z) (src_pre: Z) (dst_pre: Z) (L: (@list Z)) (T: (@list Z)) (retval: Z) (PreH1 : ((Zlength (T)) = (128 - vl_pre ))) (PreH2 : (0 <= vl_pre)) (PreH3 : (vl_pre <= 128)) ,
  (UndefStructPredvint32m8_t ( &( "u" ) ) )
  **  (IntArray.full &(( &( "v" ) )->ₛ "s") 128 (app (L) (T)) )
  **  (IntArray.full &((retval)  # "vint32m8_t" ->ₛ "s") 128 (app (L) (T)) )
  **  (IntArray.full src_pre vl_pre L )
  **  (IntArray.undef_full dst_pre vl_pre )
|--
  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ ((Zlength (T)) = (128 - vl_pre )) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 128) ”
  &&  (IntArray.full src_pre vl_pre L )
  **  (UndefStructPredvint32m8_t ( &( "u" ) ) )
  **  (IntArray.full &(( &( "v" ) )->ₛ "s") 128 (app (L) (T)) )
  **  (IntArray.full &((retval)  # "vint32m8_t" ->ₛ "s") 128 (app (L) (T)) )
  **  (IntArray.undef_full dst_pre vl_pre )
.

Definition max_kernel_partial_solve_wit_3 := max_kernel_partial_solve_wit_3_pure -> max_kernel_partial_solve_wit_3_aux.

Definition max_kernel_partial_solve_wit_4 := 
forall (vl_pre: Z) (src_pre: Z) (dst_pre: Z) (L: (@list Z)) (T: (@list Z)) (retval: Z) (T_2: (@list Z)) (retval_2: Z) (PreH1 : ((Zlength (T_2)) = (128 - vl_pre ))) (PreH2 : ((Zlength (T)) = (128 - vl_pre ))) (PreH3 : (0 <= vl_pre)) (PreH4 : (vl_pre <= 128)) ,
  (IntArray.full src_pre vl_pre L )
  **  (IntArray.full &((retval_2)  # "vint32m8_t" ->ₛ "s") 128 (app (L) (T_2)) )
  **  (UndefStructPredvint32m8_t ( &( "u" ) ) )
  **  (IntArray.full &(( &( "v" ) )->ₛ "s") 128 (app (L) (T)) )
  **  (IntArray.full &((retval)  # "vint32m8_t" ->ₛ "s") 128 (app (L) (T)) )
  **  (IntArray.undef_full dst_pre vl_pre )
|--
  “ ((Zlength (T_2)) = (128 - vl_pre )) ” 
  &&  “ ((Zlength (T)) = (128 - vl_pre )) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 128) ”
  &&  (IntArray.undef_full &(( &( "u" ) )->ₛ "s") 128 )
  **  (IntArray.full &((retval_2)  # "vint32m8_t" ->ₛ "s") 128 (app (L) (T_2)) )
  **  (IntArray.full src_pre vl_pre L )
  **  (IntArray.full &(( &( "v" ) )->ₛ "s") 128 (app (L) (T)) )
  **  (IntArray.full &((retval)  # "vint32m8_t" ->ₛ "s") 128 (app (L) (T)) )
  **  (IntArray.undef_full dst_pre vl_pre )
.

Definition max_kernel_partial_solve_wit_5 := 
forall (vl_pre: Z) (src_pre: Z) (dst_pre: Z) (L: (@list Z)) (T: (@list Z)) (retval: Z) (T_2: (@list Z)) (retval_2: Z) (PreH1 : ((Zlength (T_2)) = (128 - vl_pre ))) (PreH2 : ((Zlength (T)) = (128 - vl_pre ))) (PreH3 : (0 <= vl_pre)) (PreH4 : (vl_pre <= 128)) ,
  (UndefStructPredvint32m8_t ( &( "w" ) ) )
  **  (IntArray.full &(( &( "u" ) )->ₛ "s") 128 (app (L) (T_2)) )
  **  (IntArray.full &((retval_2)  # "vint32m8_t" ->ₛ "s") 128 (app (L) (T_2)) )
  **  (IntArray.full src_pre vl_pre L )
  **  (IntArray.full &(( &( "v" ) )->ₛ "s") 128 (app (L) (T)) )
  **  (IntArray.full &((retval)  # "vint32m8_t" ->ₛ "s") 128 (app (L) (T)) )
  **  (IntArray.undef_full dst_pre vl_pre )
|--
  “ ((Zlength (T_2)) = (128 - vl_pre )) ” 
  &&  “ ((Zlength (T)) = (128 - vl_pre )) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 128) ”
  &&  (IntArray.full &(( &( "v" ) )->ₛ "s") 128 (app (L) (T)) )
  **  (IntArray.full &(( &( "u" ) )->ₛ "s") 128 (app (L) (T_2)) )
  **  (UndefStructPredvint32m8_t ( &( "w" ) ) )
  **  (IntArray.full &((retval_2)  # "vint32m8_t" ->ₛ "s") 128 (app (L) (T_2)) )
  **  (IntArray.full src_pre vl_pre L )
  **  (IntArray.full &((retval)  # "vint32m8_t" ->ₛ "s") 128 (app (L) (T)) )
  **  (IntArray.undef_full dst_pre vl_pre )
.

Definition max_kernel_partial_solve_wit_6 := 
forall (vl_pre: Z) (src_pre: Z) (dst_pre: Z) (L: (@list Z)) (T: (@list Z)) (retval: Z) (T_2: (@list Z)) (retval_2: Z) (R: (@list Z)) (retval_3: Z) (PreH1 : ((Zlength (R)) = 128)) (PreH2 : ((Zlength (T_2)) = (128 - vl_pre ))) (PreH3 : ((Zlength (T)) = (128 - vl_pre ))) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 128)) ,
  (IntArray.full &((retval_3)  # "vint32m8_t" ->ₛ "s") 128 R )
  **  (UndefStructPredvint32m8_t ( &( "w" ) ) )
  **  (IntArray.full &((retval_2)  # "vint32m8_t" ->ₛ "s") 128 (app (L) (T_2)) )
  **  (IntArray.full src_pre vl_pre L )
  **  (IntArray.full &((retval)  # "vint32m8_t" ->ₛ "s") 128 (app (L) (T)) )
  **  (IntArray.undef_full dst_pre vl_pre )
  **  (IntArray.full &(( &( "v" ) )->ₛ "s") 128 (app (L) (T)) )
  **  (IntArray.full &(( &( "u" ) )->ₛ "s") 128 (app (L) (T_2)) )
|--
  “ ((Zlength (R)) = 128) ” 
  &&  “ ((Zlength (T_2)) = (128 - vl_pre )) ” 
  &&  “ ((Zlength (T)) = (128 - vl_pre )) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 128) ”
  &&  (IntArray.undef_full &(( &( "w" ) )->ₛ "s") 128 )
  **  (IntArray.full &((retval_3)  # "vint32m8_t" ->ₛ "s") 128 R )
  **  (IntArray.full &((retval_2)  # "vint32m8_t" ->ₛ "s") 128 (app (L) (T_2)) )
  **  (IntArray.full src_pre vl_pre L )
  **  (IntArray.full &((retval)  # "vint32m8_t" ->ₛ "s") 128 (app (L) (T)) )
  **  (IntArray.undef_full dst_pre vl_pre )
  **  (IntArray.full &(( &( "v" ) )->ₛ "s") 128 (app (L) (T)) )
  **  (IntArray.full &(( &( "u" ) )->ₛ "s") 128 (app (L) (T_2)) )
.

Definition max_kernel_partial_solve_wit_7_pure := 
forall (vl_pre: Z) (src_pre: Z) (dst_pre: Z) (L: (@list Z)) (T: (@list Z)) (retval: Z) (T_2: (@list Z)) (retval_2: Z) (R: (@list Z)) (retval_3: Z) (PreH1 : ((Zlength (R)) = 128)) (PreH2 : ((Zlength (T_2)) = (128 - vl_pre ))) (PreH3 : ((Zlength (T)) = (128 - vl_pre ))) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 128)) ,
  (IntArray.full &(( &( "w" ) )->ₛ "s") 128 R )
  **  (IntArray.full &((retval_3)  # "vint32m8_t" ->ₛ "s") 128 R )
  **  (IntArray.full &((retval_2)  # "vint32m8_t" ->ₛ "s") 128 (app (L) (T_2)) )
  **  (IntArray.full src_pre vl_pre L )
  **  (IntArray.full &((retval)  # "vint32m8_t" ->ₛ "s") 128 (app (L) (T)) )
  **  ((( &( "dst" ) )) # Ptr  |-> dst_pre)
  **  ((( &( "src" ) )) # Ptr  |-> src_pre)
  **  ((( &( "vl" ) )) # Int  |-> vl_pre)
  **  (IntArray.undef_full dst_pre vl_pre )
  **  (IntArray.full &(( &( "v" ) )->ₛ "s") 128 (app (L) (T)) )
  **  (IntArray.full &(( &( "u" ) )->ₛ "s") 128 (app (L) (T_2)) )
|--
  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 128) ”
.

Definition max_kernel_partial_solve_wit_7_aux := 
forall (vl_pre: Z) (src_pre: Z) (dst_pre: Z) (L: (@list Z)) (T: (@list Z)) (retval: Z) (T_2: (@list Z)) (retval_2: Z) (R: (@list Z)) (retval_3: Z) (PreH1 : ((Zlength (R)) = 128)) (PreH2 : ((Zlength (T_2)) = (128 - vl_pre ))) (PreH3 : ((Zlength (T)) = (128 - vl_pre ))) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 128)) ,
  (IntArray.full &(( &( "w" ) )->ₛ "s") 128 R )
  **  (IntArray.full &((retval_3)  # "vint32m8_t" ->ₛ "s") 128 R )
  **  (IntArray.full &((retval_2)  # "vint32m8_t" ->ₛ "s") 128 (app (L) (T_2)) )
  **  (IntArray.full src_pre vl_pre L )
  **  (IntArray.full &((retval)  # "vint32m8_t" ->ₛ "s") 128 (app (L) (T)) )
  **  (IntArray.undef_full dst_pre vl_pre )
  **  (IntArray.full &(( &( "v" ) )->ₛ "s") 128 (app (L) (T)) )
  **  (IntArray.full &(( &( "u" ) )->ₛ "s") 128 (app (L) (T_2)) )
|--
  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ ((Zlength (R)) = 128) ” 
  &&  “ ((Zlength (T_2)) = (128 - vl_pre )) ” 
  &&  “ ((Zlength (T)) = (128 - vl_pre )) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 128) ”
  &&  (IntArray.undef_full dst_pre vl_pre )
  **  (IntArray.full &(( &( "w" ) )->ₛ "s") 128 R )
  **  (IntArray.full &((retval_3)  # "vint32m8_t" ->ₛ "s") 128 R )
  **  (IntArray.full &((retval_2)  # "vint32m8_t" ->ₛ "s") 128 (app (L) (T_2)) )
  **  (IntArray.full src_pre vl_pre L )
  **  (IntArray.full &((retval)  # "vint32m8_t" ->ₛ "s") 128 (app (L) (T)) )
  **  (IntArray.full &(( &( "v" ) )->ₛ "s") 128 (app (L) (T)) )
  **  (IntArray.full &(( &( "u" ) )->ₛ "s") 128 (app (L) (T_2)) )
.

Definition max_kernel_partial_solve_wit_7 := max_kernel_partial_solve_wit_7_pure -> max_kernel_partial_solve_wit_7_aux.

Module Type VC_Correct.

Include int_array_Strategy_Correct.
Include uint_array_Strategy_Correct.
Include undef_uint_array_Strategy_Correct.
Include array_shape_Strategy_Correct.

Axiom proof_of_vload_safety_wit_1 : vload_safety_wit_1.
Axiom proof_of_vload_safety_wit_2 : vload_safety_wit_2.
Axiom proof_of_vload_safety_wit_3 : vload_safety_wit_3.
Axiom proof_of_vload_safety_wit_4 : vload_safety_wit_4.
Axiom proof_of_vload_safety_wit_5 : vload_safety_wit_5.
Axiom proof_of_vload_entail_wit_1 : vload_entail_wit_1.
Axiom proof_of_vload_entail_wit_2_1 : vload_entail_wit_2_1.
Axiom proof_of_vload_entail_wit_2_2 : vload_entail_wit_2_2.
Axiom proof_of_vload_return_wit_1 : vload_return_wit_1.
Axiom proof_of_vload_partial_solve_wit_1 : vload_partial_solve_wit_1.
Axiom proof_of_vload_partial_solve_wit_2 : vload_partial_solve_wit_2.
Axiom proof_of_vload_partial_solve_wit_3 : vload_partial_solve_wit_3.
Axiom proof_of_vstore_safety_wit_1 : vstore_safety_wit_1.
Axiom proof_of_vstore_safety_wit_2 : vstore_safety_wit_2.
Axiom proof_of_vstore_entail_wit_1 : vstore_entail_wit_1.
Axiom proof_of_vstore_entail_wit_2 : vstore_entail_wit_2.
Axiom proof_of_vstore_return_wit_1 : vstore_return_wit_1.
Axiom proof_of_vstore_partial_solve_wit_1 : vstore_partial_solve_wit_1.
Axiom proof_of_vstore_partial_solve_wit_2 : vstore_partial_solve_wit_2.
Axiom proof_of_vload_v_return_wit_1 : vload_v_return_wit_1.
Axiom proof_of_vload_v_partial_solve_wit_1_pure : vload_v_partial_solve_wit_1_pure.
Axiom proof_of_vload_v_partial_solve_wit_1 : vload_v_partial_solve_wit_1.
Axiom proof_of_vload_v_partial_solve_wit_2 : vload_v_partial_solve_wit_2.
Axiom proof_of_vmax_v_return_wit_1 : vmax_v_return_wit_1.
Axiom proof_of_vmax_v_partial_solve_wit_1 : vmax_v_partial_solve_wit_1.
Axiom proof_of_vmax_v_partial_solve_wit_2 : vmax_v_partial_solve_wit_2.
Axiom proof_of_max_kernel_return_wit_1 : max_kernel_return_wit_1.
Axiom proof_of_max_kernel_partial_solve_wit_1_pure : max_kernel_partial_solve_wit_1_pure.
Axiom proof_of_max_kernel_partial_solve_wit_1 : max_kernel_partial_solve_wit_1.
Axiom proof_of_max_kernel_partial_solve_wit_2 : max_kernel_partial_solve_wit_2.
Axiom proof_of_max_kernel_partial_solve_wit_3_pure : max_kernel_partial_solve_wit_3_pure.
Axiom proof_of_max_kernel_partial_solve_wit_3 : max_kernel_partial_solve_wit_3.
Axiom proof_of_max_kernel_partial_solve_wit_4 : max_kernel_partial_solve_wit_4.
Axiom proof_of_max_kernel_partial_solve_wit_5 : max_kernel_partial_solve_wit_5.
Axiom proof_of_max_kernel_partial_solve_wit_6 : max_kernel_partial_solve_wit_6.
Axiom proof_of_max_kernel_partial_solve_wit_7_pure : max_kernel_partial_solve_wit_7_pure.
Axiom proof_of_max_kernel_partial_solve_wit_7 : max_kernel_partial_solve_wit_7.

End VC_Correct.
