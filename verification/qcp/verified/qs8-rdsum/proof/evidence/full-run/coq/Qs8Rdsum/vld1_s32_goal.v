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
Require Import Qs8Rdsum.Model.
Require Import Qs8Rdsum.Types.
Require Import Qs8Rdsum.OutputModel.
Local Open Scope sac.

(*----- Function vld1_s32 -----*)

Definition vld1_s32_safety_wit_1 := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (PreH1 : (0 <= idx)) (PreH2 : ((idx + 2 ) <= count)) (PreH3 : (p_pre = (base + (idx * 4 ) ))) ,
  (UndefStructPredint32x2_t ( &( "r" ) ) )
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  (IntArray.full base count L )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition vld1_s32_safety_wit_2 := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (PreH1 : (retval = (Znth (idx + 0 ) L 0))) (PreH2 : ((INT_MIN) <= retval)) (PreH3 : (retval <= INT_MAX)) (PreH4 : (0 <= idx)) (PreH5 : ((idx + 2 ) <= count)) (PreH6 : (p_pre = (base + (idx * 4 ) ))) ,
  ((&(( &( "r" ) )->ₛ "s1")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Int  |-> retval)
  **  (IntArray.full base count L )
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition vld1_s32_return_wit_1 := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (record_return: Z) (PreH1 : (retval_2 = (Znth (idx + 1 ) L 0))) (PreH2 : ((INT_MIN) <= retval_2)) (PreH3 : (retval_2 <= INT_MAX)) (PreH4 : (retval = (Znth (idx + 0 ) L 0))) (PreH5 : ((INT_MIN) <= retval)) (PreH6 : (retval <= INT_MAX)) (PreH7 : (0 <= idx)) (PreH8 : ((idx + 2 ) <= count)) (PreH9 : (p_pre = (base + (idx * 4 ) ))) ,
  ((&((record_return)  # "int32x2_t" ->ₛ "s1")) # Int  |-> retval_2)
  **  ((&((record_return)  # "int32x2_t" ->ₛ "s0")) # Int  |-> retval)
  **  (IntArray.full base count L )
|--
  (IntArray.full base count L )
  **  ((&((record_return)  # "int32x2_t" ->ₛ "s0")) # Int  |-> (Znth (idx + 0 ) L 0))
  **  ((&((record_return)  # "int32x2_t" ->ₛ "s1")) # Int  |-> (Znth (idx + 1 ) L 0))
.

Definition vld1_s32_partial_solve_wit_1_pure := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (PreH1 : (0 <= idx)) (PreH2 : ((idx + 2 ) <= count)) (PreH3 : (p_pre = (base + (idx * 4 ) ))) ,
  (UndefStructPredint32x2_t ( &( "r" ) ) )
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  (IntArray.full base count L )
|--
  “ (0 <= idx) ” 
  &&  “ (0 <= 0) ” 
  &&  “ ((idx + 0 ) < count) ” 
  &&  “ (p_pre = (base + (idx * 4 ) )) ”
.

Definition vld1_s32_partial_solve_wit_1_aux := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (PreH1 : (0 <= idx)) (PreH2 : ((idx + 2 ) <= count)) (PreH3 : (p_pre = (base + (idx * 4 ) ))) ,
  (UndefStructPredint32x2_t ( &( "r" ) ) )
  **  (IntArray.full base count L )
|--
  “ (0 <= idx) ” 
  &&  “ (0 <= 0) ” 
  &&  “ ((idx + 0 ) < count) ” 
  &&  “ (p_pre = (base + (idx * 4 ) )) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + 2 ) <= count) ” 
  &&  “ (p_pre = (base + (idx * 4 ) )) ”
  &&  (IntArray.full base count L )
  **  (UndefStructPredint32x2_t ( &( "r" ) ) )
.

Definition vld1_s32_partial_solve_wit_1 := vld1_s32_partial_solve_wit_1_pure -> vld1_s32_partial_solve_wit_1_aux.

Definition vld1_s32_partial_solve_wit_2_pure := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (PreH1 : (retval = (Znth (idx + 0 ) L 0))) (PreH2 : ((INT_MIN) <= retval)) (PreH3 : (retval <= INT_MAX)) (PreH4 : (0 <= idx)) (PreH5 : ((idx + 2 ) <= count)) (PreH6 : (p_pre = (base + (idx * 4 ) ))) ,
  ((&(( &( "r" ) )->ₛ "s1")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Int  |-> retval)
  **  (IntArray.full base count L )
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (0 <= idx) ” 
  &&  “ (0 <= 1) ” 
  &&  “ ((idx + 1 ) < count) ” 
  &&  “ (p_pre = (base + (idx * 4 ) )) ”
.

Definition vld1_s32_partial_solve_wit_2_aux := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (PreH1 : (retval = (Znth (idx + 0 ) L 0))) (PreH2 : ((INT_MIN) <= retval)) (PreH3 : (retval <= INT_MAX)) (PreH4 : (0 <= idx)) (PreH5 : ((idx + 2 ) <= count)) (PreH6 : (p_pre = (base + (idx * 4 ) ))) ,
  ((&(( &( "r" ) )->ₛ "s1")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Int  |-> retval)
  **  (IntArray.full base count L )
|--
  “ (0 <= idx) ” 
  &&  “ (0 <= 1) ” 
  &&  “ ((idx + 1 ) < count) ” 
  &&  “ (p_pre = (base + (idx * 4 ) )) ” 
  &&  “ (retval = (Znth (idx + 0 ) L 0)) ” 
  &&  “ ((INT_MIN) <= retval) ” 
  &&  “ (retval <= INT_MAX) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + 2 ) <= count) ” 
  &&  “ (p_pre = (base + (idx * 4 ) )) ”
  &&  (IntArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s1")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Int  |-> retval)
.

Definition vld1_s32_partial_solve_wit_2 := vld1_s32_partial_solve_wit_2_pure -> vld1_s32_partial_solve_wit_2_aux.

Definition vld1_s32_partial_solve_wit_3 := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (record_return: Z) (PreH1 : (retval_2 = (Znth (idx + 1 ) L 0))) (PreH2 : ((INT_MIN) <= retval_2)) (PreH3 : (retval_2 <= INT_MAX)) (PreH4 : (retval = (Znth (idx + 0 ) L 0))) (PreH5 : ((INT_MIN) <= retval)) (PreH6 : (retval <= INT_MAX)) (PreH7 : (0 <= idx)) (PreH8 : ((idx + 2 ) <= count)) (PreH9 : (p_pre = (base + (idx * 4 ) ))) ,
  (UndefStructPredint32x2_t record_return )
  **  (IntArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s1")) # Int  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Int  |-> retval)
|--
  “ (retval_2 = (Znth (idx + 1 ) L 0)) ” 
  &&  “ ((INT_MIN) <= retval_2) ” 
  &&  “ (retval_2 <= INT_MAX) ” 
  &&  “ (retval = (Znth (idx + 0 ) L 0)) ” 
  &&  “ ((INT_MIN) <= retval) ” 
  &&  “ (retval <= INT_MAX) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + 2 ) <= count) ” 
  &&  “ (p_pre = (base + (idx * 4 ) )) ”
  &&  ((&((record_return)  # "int32x2_t" ->ₛ "s1")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Int  |-> retval_2)
  **  ((&((record_return)  # "int32x2_t" ->ₛ "s0")) # Int  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Int  |-> retval)
  **  (IntArray.full base count L )
.

Module Type VC_Correct.


Axiom proof_of_vld1_s32_safety_wit_1 : vld1_s32_safety_wit_1.
Axiom proof_of_vld1_s32_safety_wit_2 : vld1_s32_safety_wit_2.
Axiom proof_of_vld1_s32_return_wit_1 : vld1_s32_return_wit_1.
Axiom proof_of_vld1_s32_partial_solve_wit_1_pure : vld1_s32_partial_solve_wit_1_pure.
Axiom proof_of_vld1_s32_partial_solve_wit_1 : vld1_s32_partial_solve_wit_1.
Axiom proof_of_vld1_s32_partial_solve_wit_2_pure : vld1_s32_partial_solve_wit_2_pure.
Axiom proof_of_vld1_s32_partial_solve_wit_2 : vld1_s32_partial_solve_wit_2.
Axiom proof_of_vld1_s32_partial_solve_wit_3 : vld1_s32_partial_solve_wit_3.

End VC_Correct.
