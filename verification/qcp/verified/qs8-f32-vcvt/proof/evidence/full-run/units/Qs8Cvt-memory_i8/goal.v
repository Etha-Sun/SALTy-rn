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
Local Open Scope sac.
From Qs8Cvt Require Import char_arrays_strategy_goal.
From Qs8Cvt Require Import char_arrays_strategy_proof.

(*----- Function qcp_cvt_read_lane -----*)

Definition qcp_cvt_read_lane_safety_wit_1 := 
forall (vl_pre: Z) (i_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) (PreH6 : (0 <= idx)) (PreH7 : ((idx + vl_pre ) <= count)) (PreH8 : (p_pre = (base + idx ))) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  (CharArray.full base count L )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qcp_cvt_read_lane_entail_wit_1 := 
(
forall (vl_pre: Z) (i_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) (PreH6 : (0 <= idx)) (PreH7 : ((idx + vl_pre ) <= count)) (PreH8 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
|--
  “ (0 <= i_pre) ” 
  &&  “ (i_pre < 32) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (i_pre < vl_pre) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
  &&  (CharArray.missing_i base (idx + i_pre ) 0 count L )
  **  (((p_pre + (i_pre * sizeof(CHAR)))) # Char  |-> (Znth (idx + i_pre ) L 0))
) \/
(
forall (vl_pre: Z) (i_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) (PreH6 : (0 <= idx)) (PreH7 : ((idx + vl_pre ) <= count)) (PreH8 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
|--
  (CharArray.missing_i base (idx + i_pre ) 0 count L )
  **  (((p_pre + (i_pre * sizeof(CHAR)))) # Char  |-> (Znth (idx + i_pre ) L 0))
).

Definition qcp_cvt_read_lane_entail_wit_1_split_goal_spatial := 
forall (vl_pre: Z) (i_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) (PreH6 : (0 <= idx)) (PreH7 : ((idx + vl_pre ) <= count)) (PreH8 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
|--
  (CharArray.missing_i base (idx + i_pre ) 0 count L )
  **  (((p_pre + (i_pre * sizeof(CHAR)))) # Char  |-> (Znth (idx + i_pre ) L 0))
.

Definition qcp_cvt_read_lane_entail_wit_2 := 
(
forall (vl_pre: Z) (i_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (0 <= vl_pre)) (PreH4 : (vl_pre <= 32)) (PreH5 : (i_pre < vl_pre)) (PreH6 : (0 <= idx)) (PreH7 : ((idx + vl_pre ) <= count)) (PreH8 : (p_pre = (base + idx ))) ,
  (CharArray.missing_i base (idx + i_pre ) 0 count L )
  **  (((p_pre + (i_pre * sizeof(CHAR)))) # Char  |-> (Znth (idx + i_pre ) L 0))
|--
  “ (0 <= i_pre) ” 
  &&  “ (i_pre < 32) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (i_pre < vl_pre) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
  &&  (CharArray.full base count L )
) \/
(
forall (vl_pre: Z) (i_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (0 <= vl_pre)) (PreH4 : (vl_pre <= 32)) (PreH5 : (i_pre < vl_pre)) (PreH6 : (0 <= idx)) (PreH7 : ((idx + vl_pre ) <= count)) (PreH8 : (p_pre = (base + idx ))) ,
  (CharArray.missing_i base (idx + i_pre ) 0 count L )
  **  (((p_pre + (i_pre * sizeof(CHAR)))) # Char  |-> (Znth (idx + i_pre ) L 0))
|--
  (CharArray.full base count L )
).

Definition qcp_cvt_read_lane_entail_wit_2_split_goal_spatial := 
forall (vl_pre: Z) (i_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (0 <= vl_pre)) (PreH4 : (vl_pre <= 32)) (PreH5 : (i_pre < vl_pre)) (PreH6 : (0 <= idx)) (PreH7 : ((idx + vl_pre ) <= count)) (PreH8 : (p_pre = (base + idx ))) ,
  (CharArray.missing_i base (idx + i_pre ) 0 count L )
  **  (((p_pre + (i_pre * sizeof(CHAR)))) # Char  |-> (Znth (idx + i_pre ) L 0))
|--
  (CharArray.full base count L )
.

Definition qcp_cvt_read_lane_return_wit_1 := 
(
forall (vl_pre: Z) (i_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) (PreH6 : (0 <= idx)) (PreH7 : ((idx + vl_pre ) <= count)) (PreH8 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
|--
  “ (0 = (cvt_read_lane (i_pre) (vl_pre) (idx) (L))) ”
  &&  (CharArray.full base count L )
) \/
(
forall (vl_pre: Z) (i_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) (PreH6 : (0 <= idx)) (PreH7 : ((idx + vl_pre ) <= count)) (PreH8 : (p_pre = (base + idx ))) ,
  TT && emp 
|--
  “ (0 = (cvt_read_lane (i_pre) (vl_pre) (idx) (L))) ”
  &&  emp
).

Definition qcp_cvt_read_lane_return_wit_1_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) (PreH6 : (0 <= idx)) (PreH7 : ((idx + vl_pre ) <= count)) (PreH8 : (p_pre = (base + idx ))) ,
  (0 = (cvt_read_lane (i_pre) (vl_pre) (idx) (L)))
.

Definition qcp_cvt_read_lane_return_wit_2 := 
(
forall (vl_pre: Z) (i_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (0 <= vl_pre)) (PreH4 : (vl_pre <= 32)) (PreH5 : (i_pre < vl_pre)) (PreH6 : (0 <= idx)) (PreH7 : ((idx + vl_pre ) <= count)) (PreH8 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
|--
  “ ((Znth (idx + i_pre ) L 0) = (cvt_read_lane (i_pre) (vl_pre) (idx) (L))) ”
  &&  (CharArray.full base count L )
) \/
(
forall (vl_pre: Z) (i_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (0 <= vl_pre)) (PreH4 : (vl_pre <= 32)) (PreH5 : (i_pre < vl_pre)) (PreH6 : (0 <= idx)) (PreH7 : ((idx + vl_pre ) <= count)) (PreH8 : (p_pre = (base + idx ))) ,
  TT && emp 
|--
  “ ((Znth (idx + i_pre ) L 0) = (cvt_read_lane (i_pre) (vl_pre) (idx) (L))) ”
  &&  emp
).

Definition qcp_cvt_read_lane_return_wit_2_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (0 <= vl_pre)) (PreH4 : (vl_pre <= 32)) (PreH5 : (i_pre < vl_pre)) (PreH6 : (0 <= idx)) (PreH7 : ((idx + vl_pre ) <= count)) (PreH8 : (p_pre = (base + idx ))) ,
  ((Znth (idx + i_pre ) L 0) = (cvt_read_lane (i_pre) (vl_pre) (idx) (L)))
.

(*----- Function vld1_s8 -----*)

Definition vld1_s8_safety_wit_1 := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (PreH1 : (0 <= idx)) (PreH2 : ((idx + 8 ) <= count)) (PreH3 : (p_pre = (base + idx ))) ,
  (UndefStructPredint8x8_t ( &( "r" ) ) )
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  (CharArray.full base count L )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition vld1_s8_safety_wit_2 := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (PreH1 : (0 <= idx)) (PreH2 : ((idx + 8 ) <= count)) (PreH3 : (p_pre = (base + idx ))) ,
  (UndefStructPredint8x8_t ( &( "r" ) ) )
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  (CharArray.full base count L )
|--
  “ (8 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 8) ”
.

Definition vld1_s8_safety_wit_3 := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (PreH1 : (retval = (cvt_read_lane (0) (8) (idx) (L)))) (PreH2 : (0 <= idx)) (PreH3 : ((idx + 8 ) <= count)) (PreH4 : (p_pre = (base + idx ))) ,
  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
  **  (CharArray.full base count L )
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition vld1_s8_safety_wit_4 := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (PreH1 : (retval = (cvt_read_lane (0) (8) (idx) (L)))) (PreH2 : (0 <= idx)) (PreH3 : ((idx + 8 ) <= count)) (PreH4 : (p_pre = (base + idx ))) ,
  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
  **  (CharArray.full base count L )
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (8 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 8) ”
.

Definition vld1_s8_safety_wit_5 := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (cvt_read_lane (1) (8) (idx) (L)))) (PreH2 : (retval = (cvt_read_lane (0) (8) (idx) (L)))) (PreH3 : (0 <= idx)) (PreH4 : ((idx + 8 ) <= count)) (PreH5 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition vld1_s8_safety_wit_6 := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (cvt_read_lane (1) (8) (idx) (L)))) (PreH2 : (retval = (cvt_read_lane (0) (8) (idx) (L)))) (PreH3 : (0 <= idx)) (PreH4 : ((idx + 8 ) <= count)) (PreH5 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (8 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 8) ”
.

Definition vld1_s8_safety_wit_7 := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = (cvt_read_lane (2) (8) (idx) (L)))) (PreH2 : (retval_2 = (cvt_read_lane (1) (8) (idx) (L)))) (PreH3 : (retval = (cvt_read_lane (0) (8) (idx) (L)))) (PreH4 : (0 <= idx)) (PreH5 : ((idx + 8 ) <= count)) (PreH6 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 3) ”
.

Definition vld1_s8_safety_wit_8 := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = (cvt_read_lane (2) (8) (idx) (L)))) (PreH2 : (retval_2 = (cvt_read_lane (1) (8) (idx) (L)))) (PreH3 : (retval = (cvt_read_lane (0) (8) (idx) (L)))) (PreH4 : (0 <= idx)) (PreH5 : ((idx + 8 ) <= count)) (PreH6 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (8 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 8) ”
.

Definition vld1_s8_safety_wit_9 := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_4 = (cvt_read_lane (3) (8) (idx) (L)))) (PreH2 : (retval_3 = (cvt_read_lane (2) (8) (idx) (L)))) (PreH3 : (retval_2 = (cvt_read_lane (1) (8) (idx) (L)))) (PreH4 : (retval = (cvt_read_lane (0) (8) (idx) (L)))) (PreH5 : (0 <= idx)) (PreH6 : ((idx + 8 ) <= count)) (PreH7 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (4 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 4) ”
.

Definition vld1_s8_safety_wit_10 := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_4 = (cvt_read_lane (3) (8) (idx) (L)))) (PreH2 : (retval_3 = (cvt_read_lane (2) (8) (idx) (L)))) (PreH3 : (retval_2 = (cvt_read_lane (1) (8) (idx) (L)))) (PreH4 : (retval = (cvt_read_lane (0) (8) (idx) (L)))) (PreH5 : (0 <= idx)) (PreH6 : ((idx + 8 ) <= count)) (PreH7 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (8 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 8) ”
.

Definition vld1_s8_safety_wit_11 := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (PreH1 : (retval_5 = (cvt_read_lane (4) (8) (idx) (L)))) (PreH2 : (retval_4 = (cvt_read_lane (3) (8) (idx) (L)))) (PreH3 : (retval_3 = (cvt_read_lane (2) (8) (idx) (L)))) (PreH4 : (retval_2 = (cvt_read_lane (1) (8) (idx) (L)))) (PreH5 : (retval = (cvt_read_lane (0) (8) (idx) (L)))) (PreH6 : (0 <= idx)) (PreH7 : ((idx + 8 ) <= count)) (PreH8 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (5 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 5) ”
.

Definition vld1_s8_safety_wit_12 := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (PreH1 : (retval_5 = (cvt_read_lane (4) (8) (idx) (L)))) (PreH2 : (retval_4 = (cvt_read_lane (3) (8) (idx) (L)))) (PreH3 : (retval_3 = (cvt_read_lane (2) (8) (idx) (L)))) (PreH4 : (retval_2 = (cvt_read_lane (1) (8) (idx) (L)))) (PreH5 : (retval = (cvt_read_lane (0) (8) (idx) (L)))) (PreH6 : (0 <= idx)) (PreH7 : ((idx + 8 ) <= count)) (PreH8 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (8 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 8) ”
.

Definition vld1_s8_safety_wit_13 := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (PreH1 : (retval_6 = (cvt_read_lane (5) (8) (idx) (L)))) (PreH2 : (retval_5 = (cvt_read_lane (4) (8) (idx) (L)))) (PreH3 : (retval_4 = (cvt_read_lane (3) (8) (idx) (L)))) (PreH4 : (retval_3 = (cvt_read_lane (2) (8) (idx) (L)))) (PreH5 : (retval_2 = (cvt_read_lane (1) (8) (idx) (L)))) (PreH6 : (retval = (cvt_read_lane (0) (8) (idx) (L)))) (PreH7 : (0 <= idx)) (PreH8 : ((idx + 8 ) <= count)) (PreH9 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (6 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 6) ”
.

Definition vld1_s8_safety_wit_14 := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (PreH1 : (retval_6 = (cvt_read_lane (5) (8) (idx) (L)))) (PreH2 : (retval_5 = (cvt_read_lane (4) (8) (idx) (L)))) (PreH3 : (retval_4 = (cvt_read_lane (3) (8) (idx) (L)))) (PreH4 : (retval_3 = (cvt_read_lane (2) (8) (idx) (L)))) (PreH5 : (retval_2 = (cvt_read_lane (1) (8) (idx) (L)))) (PreH6 : (retval = (cvt_read_lane (0) (8) (idx) (L)))) (PreH7 : (0 <= idx)) (PreH8 : ((idx + 8 ) <= count)) (PreH9 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (8 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 8) ”
.

Definition vld1_s8_safety_wit_15 := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (PreH1 : (retval_7 = (cvt_read_lane (6) (8) (idx) (L)))) (PreH2 : (retval_6 = (cvt_read_lane (5) (8) (idx) (L)))) (PreH3 : (retval_5 = (cvt_read_lane (4) (8) (idx) (L)))) (PreH4 : (retval_4 = (cvt_read_lane (3) (8) (idx) (L)))) (PreH5 : (retval_3 = (cvt_read_lane (2) (8) (idx) (L)))) (PreH6 : (retval_2 = (cvt_read_lane (1) (8) (idx) (L)))) (PreH7 : (retval = (cvt_read_lane (0) (8) (idx) (L)))) (PreH8 : (0 <= idx)) (PreH9 : ((idx + 8 ) <= count)) (PreH10 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (7 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 7) ”
.

Definition vld1_s8_safety_wit_16 := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (PreH1 : (retval_7 = (cvt_read_lane (6) (8) (idx) (L)))) (PreH2 : (retval_6 = (cvt_read_lane (5) (8) (idx) (L)))) (PreH3 : (retval_5 = (cvt_read_lane (4) (8) (idx) (L)))) (PreH4 : (retval_4 = (cvt_read_lane (3) (8) (idx) (L)))) (PreH5 : (retval_3 = (cvt_read_lane (2) (8) (idx) (L)))) (PreH6 : (retval_2 = (cvt_read_lane (1) (8) (idx) (L)))) (PreH7 : (retval = (cvt_read_lane (0) (8) (idx) (L)))) (PreH8 : (0 <= idx)) (PreH9 : ((idx + 8 ) <= count)) (PreH10 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (8 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 8) ”
.

Definition vld1_s8_return_wit_1 := 
(
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (record_return: Z) (PreH1 : (retval_8 = (cvt_read_lane (7) (8) (idx) (L)))) (PreH2 : (retval_7 = (cvt_read_lane (6) (8) (idx) (L)))) (PreH3 : (retval_6 = (cvt_read_lane (5) (8) (idx) (L)))) (PreH4 : (retval_5 = (cvt_read_lane (4) (8) (idx) (L)))) (PreH5 : (retval_4 = (cvt_read_lane (3) (8) (idx) (L)))) (PreH6 : (retval_3 = (cvt_read_lane (2) (8) (idx) (L)))) (PreH7 : (retval_2 = (cvt_read_lane (1) (8) (idx) (L)))) (PreH8 : (retval = (cvt_read_lane (0) (8) (idx) (L)))) (PreH9 : (0 <= idx)) (PreH10 : ((idx + 8 ) <= count)) (PreH11 : (p_pre = (base + idx ))) ,
  ((&((record_return)  # "int8x8_t" ->ₛ "s7")) # Char  |-> retval_8)
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s6")) # Char  |-> retval_7)
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s5")) # Char  |-> retval_6)
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s4")) # Char  |-> retval_5)
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s3")) # Char  |-> retval_4)
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s2")) # Char  |-> retval_3)
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s1")) # Char  |-> retval_2)
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s0")) # Char  |-> retval)
  **  (CharArray.full base count L )
|--
  (CharArray.full base count L )
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s0")) # Char  |-> (Znth (idx + 0 ) L 0))
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s1")) # Char  |-> (Znth (idx + 1 ) L 0))
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s2")) # Char  |-> (Znth (idx + 2 ) L 0))
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s3")) # Char  |-> (Znth (idx + 3 ) L 0))
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s4")) # Char  |-> (Znth (idx + 4 ) L 0))
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s5")) # Char  |-> (Znth (idx + 5 ) L 0))
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s6")) # Char  |-> (Znth (idx + 6 ) L 0))
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s7")) # Char  |-> (Znth (idx + 7 ) L 0))
) \/
(
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (PreH1 : (retval_8 = (cvt_read_lane (7) (8) (idx) (L)))) (PreH2 : (retval_7 = (cvt_read_lane (6) (8) (idx) (L)))) (PreH3 : (retval_6 = (cvt_read_lane (5) (8) (idx) (L)))) (PreH4 : (retval_5 = (cvt_read_lane (4) (8) (idx) (L)))) (PreH5 : (retval_4 = (cvt_read_lane (3) (8) (idx) (L)))) (PreH6 : (retval_3 = (cvt_read_lane (2) (8) (idx) (L)))) (PreH7 : (retval_2 = (cvt_read_lane (1) (8) (idx) (L)))) (PreH8 : (retval = (cvt_read_lane (0) (8) (idx) (L)))) (PreH9 : (0 <= idx)) (PreH10 : ((idx + 8 ) <= count)) (PreH11 : (p_pre = (base + idx ))) ,
  TT && emp 
|--
  “ (retval_8 = (Znth (idx + 7 ) L 0)) ” 
  &&  “ (retval_7 = (Znth (idx + 6 ) L 0)) ” 
  &&  “ (retval_6 = (Znth (idx + 5 ) L 0)) ” 
  &&  “ (retval_5 = (Znth (idx + 4 ) L 0)) ” 
  &&  “ (retval_4 = (Znth (idx + 3 ) L 0)) ” 
  &&  “ (retval_3 = (Znth (idx + 2 ) L 0)) ” 
  &&  “ (retval_2 = (Znth (idx + 1 ) L 0)) ” 
  &&  “ (retval = (Znth (idx + 0 ) L 0)) ”
  &&  emp
).

Definition vld1_s8_return_wit_1_split_goal_1 := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (PreH1 : (retval_8 = (cvt_read_lane (7) (8) (idx) (L)))) (PreH2 : (retval_7 = (cvt_read_lane (6) (8) (idx) (L)))) (PreH3 : (retval_6 = (cvt_read_lane (5) (8) (idx) (L)))) (PreH4 : (retval_5 = (cvt_read_lane (4) (8) (idx) (L)))) (PreH5 : (retval_4 = (cvt_read_lane (3) (8) (idx) (L)))) (PreH6 : (retval_3 = (cvt_read_lane (2) (8) (idx) (L)))) (PreH7 : (retval_2 = (cvt_read_lane (1) (8) (idx) (L)))) (PreH8 : (retval = (cvt_read_lane (0) (8) (idx) (L)))) (PreH9 : (0 <= idx)) (PreH10 : ((idx + 8 ) <= count)) (PreH11 : (p_pre = (base + idx ))) ,
  (retval_8 = (Znth (idx + 7 ) L 0))
.

Definition vld1_s8_return_wit_1_split_goal_2 := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (PreH1 : (retval_8 = (cvt_read_lane (7) (8) (idx) (L)))) (PreH2 : (retval_7 = (cvt_read_lane (6) (8) (idx) (L)))) (PreH3 : (retval_6 = (cvt_read_lane (5) (8) (idx) (L)))) (PreH4 : (retval_5 = (cvt_read_lane (4) (8) (idx) (L)))) (PreH5 : (retval_4 = (cvt_read_lane (3) (8) (idx) (L)))) (PreH6 : (retval_3 = (cvt_read_lane (2) (8) (idx) (L)))) (PreH7 : (retval_2 = (cvt_read_lane (1) (8) (idx) (L)))) (PreH8 : (retval = (cvt_read_lane (0) (8) (idx) (L)))) (PreH9 : (0 <= idx)) (PreH10 : ((idx + 8 ) <= count)) (PreH11 : (p_pre = (base + idx ))) ,
  (retval_7 = (Znth (idx + 6 ) L 0))
.

Definition vld1_s8_return_wit_1_split_goal_3 := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (PreH1 : (retval_8 = (cvt_read_lane (7) (8) (idx) (L)))) (PreH2 : (retval_7 = (cvt_read_lane (6) (8) (idx) (L)))) (PreH3 : (retval_6 = (cvt_read_lane (5) (8) (idx) (L)))) (PreH4 : (retval_5 = (cvt_read_lane (4) (8) (idx) (L)))) (PreH5 : (retval_4 = (cvt_read_lane (3) (8) (idx) (L)))) (PreH6 : (retval_3 = (cvt_read_lane (2) (8) (idx) (L)))) (PreH7 : (retval_2 = (cvt_read_lane (1) (8) (idx) (L)))) (PreH8 : (retval = (cvt_read_lane (0) (8) (idx) (L)))) (PreH9 : (0 <= idx)) (PreH10 : ((idx + 8 ) <= count)) (PreH11 : (p_pre = (base + idx ))) ,
  (retval_6 = (Znth (idx + 5 ) L 0))
.

Definition vld1_s8_return_wit_1_split_goal_4 := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (PreH1 : (retval_8 = (cvt_read_lane (7) (8) (idx) (L)))) (PreH2 : (retval_7 = (cvt_read_lane (6) (8) (idx) (L)))) (PreH3 : (retval_6 = (cvt_read_lane (5) (8) (idx) (L)))) (PreH4 : (retval_5 = (cvt_read_lane (4) (8) (idx) (L)))) (PreH5 : (retval_4 = (cvt_read_lane (3) (8) (idx) (L)))) (PreH6 : (retval_3 = (cvt_read_lane (2) (8) (idx) (L)))) (PreH7 : (retval_2 = (cvt_read_lane (1) (8) (idx) (L)))) (PreH8 : (retval = (cvt_read_lane (0) (8) (idx) (L)))) (PreH9 : (0 <= idx)) (PreH10 : ((idx + 8 ) <= count)) (PreH11 : (p_pre = (base + idx ))) ,
  (retval_5 = (Znth (idx + 4 ) L 0))
.

Definition vld1_s8_return_wit_1_split_goal_5 := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (PreH1 : (retval_8 = (cvt_read_lane (7) (8) (idx) (L)))) (PreH2 : (retval_7 = (cvt_read_lane (6) (8) (idx) (L)))) (PreH3 : (retval_6 = (cvt_read_lane (5) (8) (idx) (L)))) (PreH4 : (retval_5 = (cvt_read_lane (4) (8) (idx) (L)))) (PreH5 : (retval_4 = (cvt_read_lane (3) (8) (idx) (L)))) (PreH6 : (retval_3 = (cvt_read_lane (2) (8) (idx) (L)))) (PreH7 : (retval_2 = (cvt_read_lane (1) (8) (idx) (L)))) (PreH8 : (retval = (cvt_read_lane (0) (8) (idx) (L)))) (PreH9 : (0 <= idx)) (PreH10 : ((idx + 8 ) <= count)) (PreH11 : (p_pre = (base + idx ))) ,
  (retval_4 = (Znth (idx + 3 ) L 0))
.

Definition vld1_s8_return_wit_1_split_goal_6 := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (PreH1 : (retval_8 = (cvt_read_lane (7) (8) (idx) (L)))) (PreH2 : (retval_7 = (cvt_read_lane (6) (8) (idx) (L)))) (PreH3 : (retval_6 = (cvt_read_lane (5) (8) (idx) (L)))) (PreH4 : (retval_5 = (cvt_read_lane (4) (8) (idx) (L)))) (PreH5 : (retval_4 = (cvt_read_lane (3) (8) (idx) (L)))) (PreH6 : (retval_3 = (cvt_read_lane (2) (8) (idx) (L)))) (PreH7 : (retval_2 = (cvt_read_lane (1) (8) (idx) (L)))) (PreH8 : (retval = (cvt_read_lane (0) (8) (idx) (L)))) (PreH9 : (0 <= idx)) (PreH10 : ((idx + 8 ) <= count)) (PreH11 : (p_pre = (base + idx ))) ,
  (retval_3 = (Znth (idx + 2 ) L 0))
.

Definition vld1_s8_return_wit_1_split_goal_7 := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (PreH1 : (retval_8 = (cvt_read_lane (7) (8) (idx) (L)))) (PreH2 : (retval_7 = (cvt_read_lane (6) (8) (idx) (L)))) (PreH3 : (retval_6 = (cvt_read_lane (5) (8) (idx) (L)))) (PreH4 : (retval_5 = (cvt_read_lane (4) (8) (idx) (L)))) (PreH5 : (retval_4 = (cvt_read_lane (3) (8) (idx) (L)))) (PreH6 : (retval_3 = (cvt_read_lane (2) (8) (idx) (L)))) (PreH7 : (retval_2 = (cvt_read_lane (1) (8) (idx) (L)))) (PreH8 : (retval = (cvt_read_lane (0) (8) (idx) (L)))) (PreH9 : (0 <= idx)) (PreH10 : ((idx + 8 ) <= count)) (PreH11 : (p_pre = (base + idx ))) ,
  (retval_2 = (Znth (idx + 1 ) L 0))
.

Definition vld1_s8_return_wit_1_split_goal_8 := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (PreH1 : (retval_8 = (cvt_read_lane (7) (8) (idx) (L)))) (PreH2 : (retval_7 = (cvt_read_lane (6) (8) (idx) (L)))) (PreH3 : (retval_6 = (cvt_read_lane (5) (8) (idx) (L)))) (PreH4 : (retval_5 = (cvt_read_lane (4) (8) (idx) (L)))) (PreH5 : (retval_4 = (cvt_read_lane (3) (8) (idx) (L)))) (PreH6 : (retval_3 = (cvt_read_lane (2) (8) (idx) (L)))) (PreH7 : (retval_2 = (cvt_read_lane (1) (8) (idx) (L)))) (PreH8 : (retval = (cvt_read_lane (0) (8) (idx) (L)))) (PreH9 : (0 <= idx)) (PreH10 : ((idx + 8 ) <= count)) (PreH11 : (p_pre = (base + idx ))) ,
  (retval = (Znth (idx + 0 ) L 0))
.

Definition vld1_s8_partial_solve_wit_1_pure := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (PreH1 : (0 <= idx)) (PreH2 : ((idx + 8 ) <= count)) (PreH3 : (p_pre = (base + idx ))) ,
  (UndefStructPredint8x8_t ( &( "r" ) ) )
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  (CharArray.full base count L )
|--
  “ (0 <= 0) ” 
  &&  “ (0 < 32) ” 
  &&  “ (0 <= 8) ” 
  &&  “ (8 <= 32) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + 8 ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
.

Definition vld1_s8_partial_solve_wit_1_aux := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (PreH1 : (0 <= idx)) (PreH2 : ((idx + 8 ) <= count)) (PreH3 : (p_pre = (base + idx ))) ,
  (UndefStructPredint8x8_t ( &( "r" ) ) )
  **  (CharArray.full base count L )
|--
  “ (0 <= 0) ” 
  &&  “ (0 < 32) ” 
  &&  “ (0 <= 8) ” 
  &&  “ (8 <= 32) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + 8 ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + 8 ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
  &&  (CharArray.full base count L )
  **  (UndefStructPredint8x8_t ( &( "r" ) ) )
.

Definition vld1_s8_partial_solve_wit_1 := vld1_s8_partial_solve_wit_1_pure -> vld1_s8_partial_solve_wit_1_aux.

Definition vld1_s8_partial_solve_wit_2_pure := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (PreH1 : (retval = (cvt_read_lane (0) (8) (idx) (L)))) (PreH2 : (0 <= idx)) (PreH3 : ((idx + 8 ) <= count)) (PreH4 : (p_pre = (base + idx ))) ,
  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
  **  (CharArray.full base count L )
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (0 <= 1) ” 
  &&  “ (1 < 32) ” 
  &&  “ (0 <= 8) ” 
  &&  “ (8 <= 32) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + 8 ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
.

Definition vld1_s8_partial_solve_wit_2_aux := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (PreH1 : (retval = (cvt_read_lane (0) (8) (idx) (L)))) (PreH2 : (0 <= idx)) (PreH3 : ((idx + 8 ) <= count)) (PreH4 : (p_pre = (base + idx ))) ,
  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
  **  (CharArray.full base count L )
|--
  “ (0 <= 1) ” 
  &&  “ (1 < 32) ” 
  &&  “ (0 <= 8) ” 
  &&  “ (8 <= 32) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + 8 ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ” 
  &&  “ (retval = (cvt_read_lane (0) (8) (idx) (L))) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + 8 ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
  &&  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
.

Definition vld1_s8_partial_solve_wit_2 := vld1_s8_partial_solve_wit_2_pure -> vld1_s8_partial_solve_wit_2_aux.

Definition vld1_s8_partial_solve_wit_3_pure := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (cvt_read_lane (1) (8) (idx) (L)))) (PreH2 : (retval = (cvt_read_lane (0) (8) (idx) (L)))) (PreH3 : (0 <= idx)) (PreH4 : ((idx + 8 ) <= count)) (PreH5 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (0 <= 2) ” 
  &&  “ (2 < 32) ” 
  &&  “ (0 <= 8) ” 
  &&  “ (8 <= 32) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + 8 ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
.

Definition vld1_s8_partial_solve_wit_3_aux := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (cvt_read_lane (1) (8) (idx) (L)))) (PreH2 : (retval = (cvt_read_lane (0) (8) (idx) (L)))) (PreH3 : (0 <= idx)) (PreH4 : ((idx + 8 ) <= count)) (PreH5 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
|--
  “ (0 <= 2) ” 
  &&  “ (2 < 32) ” 
  &&  “ (0 <= 8) ” 
  &&  “ (8 <= 32) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + 8 ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ” 
  &&  “ (retval_2 = (cvt_read_lane (1) (8) (idx) (L))) ” 
  &&  “ (retval = (cvt_read_lane (0) (8) (idx) (L))) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + 8 ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
  &&  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
.

Definition vld1_s8_partial_solve_wit_3 := vld1_s8_partial_solve_wit_3_pure -> vld1_s8_partial_solve_wit_3_aux.

Definition vld1_s8_partial_solve_wit_4_pure := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = (cvt_read_lane (2) (8) (idx) (L)))) (PreH2 : (retval_2 = (cvt_read_lane (1) (8) (idx) (L)))) (PreH3 : (retval = (cvt_read_lane (0) (8) (idx) (L)))) (PreH4 : (0 <= idx)) (PreH5 : ((idx + 8 ) <= count)) (PreH6 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (0 <= 3) ” 
  &&  “ (3 < 32) ” 
  &&  “ (0 <= 8) ” 
  &&  “ (8 <= 32) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + 8 ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
.

Definition vld1_s8_partial_solve_wit_4_aux := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = (cvt_read_lane (2) (8) (idx) (L)))) (PreH2 : (retval_2 = (cvt_read_lane (1) (8) (idx) (L)))) (PreH3 : (retval = (cvt_read_lane (0) (8) (idx) (L)))) (PreH4 : (0 <= idx)) (PreH5 : ((idx + 8 ) <= count)) (PreH6 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
|--
  “ (0 <= 3) ” 
  &&  “ (3 < 32) ” 
  &&  “ (0 <= 8) ” 
  &&  “ (8 <= 32) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + 8 ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ” 
  &&  “ (retval_3 = (cvt_read_lane (2) (8) (idx) (L))) ” 
  &&  “ (retval_2 = (cvt_read_lane (1) (8) (idx) (L))) ” 
  &&  “ (retval = (cvt_read_lane (0) (8) (idx) (L))) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + 8 ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
  &&  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
.

Definition vld1_s8_partial_solve_wit_4 := vld1_s8_partial_solve_wit_4_pure -> vld1_s8_partial_solve_wit_4_aux.

Definition vld1_s8_partial_solve_wit_5_pure := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_4 = (cvt_read_lane (3) (8) (idx) (L)))) (PreH2 : (retval_3 = (cvt_read_lane (2) (8) (idx) (L)))) (PreH3 : (retval_2 = (cvt_read_lane (1) (8) (idx) (L)))) (PreH4 : (retval = (cvt_read_lane (0) (8) (idx) (L)))) (PreH5 : (0 <= idx)) (PreH6 : ((idx + 8 ) <= count)) (PreH7 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (0 <= 4) ” 
  &&  “ (4 < 32) ” 
  &&  “ (0 <= 8) ” 
  &&  “ (8 <= 32) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + 8 ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
.

Definition vld1_s8_partial_solve_wit_5_aux := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_4 = (cvt_read_lane (3) (8) (idx) (L)))) (PreH2 : (retval_3 = (cvt_read_lane (2) (8) (idx) (L)))) (PreH3 : (retval_2 = (cvt_read_lane (1) (8) (idx) (L)))) (PreH4 : (retval = (cvt_read_lane (0) (8) (idx) (L)))) (PreH5 : (0 <= idx)) (PreH6 : ((idx + 8 ) <= count)) (PreH7 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
|--
  “ (0 <= 4) ” 
  &&  “ (4 < 32) ” 
  &&  “ (0 <= 8) ” 
  &&  “ (8 <= 32) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + 8 ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ” 
  &&  “ (retval_4 = (cvt_read_lane (3) (8) (idx) (L))) ” 
  &&  “ (retval_3 = (cvt_read_lane (2) (8) (idx) (L))) ” 
  &&  “ (retval_2 = (cvt_read_lane (1) (8) (idx) (L))) ” 
  &&  “ (retval = (cvt_read_lane (0) (8) (idx) (L))) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + 8 ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
  &&  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
.

Definition vld1_s8_partial_solve_wit_5 := vld1_s8_partial_solve_wit_5_pure -> vld1_s8_partial_solve_wit_5_aux.

Definition vld1_s8_partial_solve_wit_6_pure := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (PreH1 : (retval_5 = (cvt_read_lane (4) (8) (idx) (L)))) (PreH2 : (retval_4 = (cvt_read_lane (3) (8) (idx) (L)))) (PreH3 : (retval_3 = (cvt_read_lane (2) (8) (idx) (L)))) (PreH4 : (retval_2 = (cvt_read_lane (1) (8) (idx) (L)))) (PreH5 : (retval = (cvt_read_lane (0) (8) (idx) (L)))) (PreH6 : (0 <= idx)) (PreH7 : ((idx + 8 ) <= count)) (PreH8 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (0 <= 5) ” 
  &&  “ (5 < 32) ” 
  &&  “ (0 <= 8) ” 
  &&  “ (8 <= 32) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + 8 ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
.

Definition vld1_s8_partial_solve_wit_6_aux := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (PreH1 : (retval_5 = (cvt_read_lane (4) (8) (idx) (L)))) (PreH2 : (retval_4 = (cvt_read_lane (3) (8) (idx) (L)))) (PreH3 : (retval_3 = (cvt_read_lane (2) (8) (idx) (L)))) (PreH4 : (retval_2 = (cvt_read_lane (1) (8) (idx) (L)))) (PreH5 : (retval = (cvt_read_lane (0) (8) (idx) (L)))) (PreH6 : (0 <= idx)) (PreH7 : ((idx + 8 ) <= count)) (PreH8 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
|--
  “ (0 <= 5) ” 
  &&  “ (5 < 32) ” 
  &&  “ (0 <= 8) ” 
  &&  “ (8 <= 32) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + 8 ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ” 
  &&  “ (retval_5 = (cvt_read_lane (4) (8) (idx) (L))) ” 
  &&  “ (retval_4 = (cvt_read_lane (3) (8) (idx) (L))) ” 
  &&  “ (retval_3 = (cvt_read_lane (2) (8) (idx) (L))) ” 
  &&  “ (retval_2 = (cvt_read_lane (1) (8) (idx) (L))) ” 
  &&  “ (retval = (cvt_read_lane (0) (8) (idx) (L))) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + 8 ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
  &&  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
.

Definition vld1_s8_partial_solve_wit_6 := vld1_s8_partial_solve_wit_6_pure -> vld1_s8_partial_solve_wit_6_aux.

Definition vld1_s8_partial_solve_wit_7_pure := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (PreH1 : (retval_6 = (cvt_read_lane (5) (8) (idx) (L)))) (PreH2 : (retval_5 = (cvt_read_lane (4) (8) (idx) (L)))) (PreH3 : (retval_4 = (cvt_read_lane (3) (8) (idx) (L)))) (PreH4 : (retval_3 = (cvt_read_lane (2) (8) (idx) (L)))) (PreH5 : (retval_2 = (cvt_read_lane (1) (8) (idx) (L)))) (PreH6 : (retval = (cvt_read_lane (0) (8) (idx) (L)))) (PreH7 : (0 <= idx)) (PreH8 : ((idx + 8 ) <= count)) (PreH9 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (0 <= 6) ” 
  &&  “ (6 < 32) ” 
  &&  “ (0 <= 8) ” 
  &&  “ (8 <= 32) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + 8 ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
.

Definition vld1_s8_partial_solve_wit_7_aux := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (PreH1 : (retval_6 = (cvt_read_lane (5) (8) (idx) (L)))) (PreH2 : (retval_5 = (cvt_read_lane (4) (8) (idx) (L)))) (PreH3 : (retval_4 = (cvt_read_lane (3) (8) (idx) (L)))) (PreH4 : (retval_3 = (cvt_read_lane (2) (8) (idx) (L)))) (PreH5 : (retval_2 = (cvt_read_lane (1) (8) (idx) (L)))) (PreH6 : (retval = (cvt_read_lane (0) (8) (idx) (L)))) (PreH7 : (0 <= idx)) (PreH8 : ((idx + 8 ) <= count)) (PreH9 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
|--
  “ (0 <= 6) ” 
  &&  “ (6 < 32) ” 
  &&  “ (0 <= 8) ” 
  &&  “ (8 <= 32) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + 8 ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ” 
  &&  “ (retval_6 = (cvt_read_lane (5) (8) (idx) (L))) ” 
  &&  “ (retval_5 = (cvt_read_lane (4) (8) (idx) (L))) ” 
  &&  “ (retval_4 = (cvt_read_lane (3) (8) (idx) (L))) ” 
  &&  “ (retval_3 = (cvt_read_lane (2) (8) (idx) (L))) ” 
  &&  “ (retval_2 = (cvt_read_lane (1) (8) (idx) (L))) ” 
  &&  “ (retval = (cvt_read_lane (0) (8) (idx) (L))) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + 8 ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
  &&  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
.

Definition vld1_s8_partial_solve_wit_7 := vld1_s8_partial_solve_wit_7_pure -> vld1_s8_partial_solve_wit_7_aux.

Definition vld1_s8_partial_solve_wit_8_pure := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (PreH1 : (retval_7 = (cvt_read_lane (6) (8) (idx) (L)))) (PreH2 : (retval_6 = (cvt_read_lane (5) (8) (idx) (L)))) (PreH3 : (retval_5 = (cvt_read_lane (4) (8) (idx) (L)))) (PreH4 : (retval_4 = (cvt_read_lane (3) (8) (idx) (L)))) (PreH5 : (retval_3 = (cvt_read_lane (2) (8) (idx) (L)))) (PreH6 : (retval_2 = (cvt_read_lane (1) (8) (idx) (L)))) (PreH7 : (retval = (cvt_read_lane (0) (8) (idx) (L)))) (PreH8 : (0 <= idx)) (PreH9 : ((idx + 8 ) <= count)) (PreH10 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (0 <= 7) ” 
  &&  “ (7 < 32) ” 
  &&  “ (0 <= 8) ” 
  &&  “ (8 <= 32) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + 8 ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
.

Definition vld1_s8_partial_solve_wit_8_aux := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (PreH1 : (retval_7 = (cvt_read_lane (6) (8) (idx) (L)))) (PreH2 : (retval_6 = (cvt_read_lane (5) (8) (idx) (L)))) (PreH3 : (retval_5 = (cvt_read_lane (4) (8) (idx) (L)))) (PreH4 : (retval_4 = (cvt_read_lane (3) (8) (idx) (L)))) (PreH5 : (retval_3 = (cvt_read_lane (2) (8) (idx) (L)))) (PreH6 : (retval_2 = (cvt_read_lane (1) (8) (idx) (L)))) (PreH7 : (retval = (cvt_read_lane (0) (8) (idx) (L)))) (PreH8 : (0 <= idx)) (PreH9 : ((idx + 8 ) <= count)) (PreH10 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
|--
  “ (0 <= 7) ” 
  &&  “ (7 < 32) ” 
  &&  “ (0 <= 8) ” 
  &&  “ (8 <= 32) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + 8 ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ” 
  &&  “ (retval_7 = (cvt_read_lane (6) (8) (idx) (L))) ” 
  &&  “ (retval_6 = (cvt_read_lane (5) (8) (idx) (L))) ” 
  &&  “ (retval_5 = (cvt_read_lane (4) (8) (idx) (L))) ” 
  &&  “ (retval_4 = (cvt_read_lane (3) (8) (idx) (L))) ” 
  &&  “ (retval_3 = (cvt_read_lane (2) (8) (idx) (L))) ” 
  &&  “ (retval_2 = (cvt_read_lane (1) (8) (idx) (L))) ” 
  &&  “ (retval = (cvt_read_lane (0) (8) (idx) (L))) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + 8 ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
  &&  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
.

Definition vld1_s8_partial_solve_wit_8 := vld1_s8_partial_solve_wit_8_pure -> vld1_s8_partial_solve_wit_8_aux.

Definition vld1_s8_partial_solve_wit_9 := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (record_return: Z) (PreH1 : (retval_8 = (cvt_read_lane (7) (8) (idx) (L)))) (PreH2 : (retval_7 = (cvt_read_lane (6) (8) (idx) (L)))) (PreH3 : (retval_6 = (cvt_read_lane (5) (8) (idx) (L)))) (PreH4 : (retval_5 = (cvt_read_lane (4) (8) (idx) (L)))) (PreH5 : (retval_4 = (cvt_read_lane (3) (8) (idx) (L)))) (PreH6 : (retval_3 = (cvt_read_lane (2) (8) (idx) (L)))) (PreH7 : (retval_2 = (cvt_read_lane (1) (8) (idx) (L)))) (PreH8 : (retval = (cvt_read_lane (0) (8) (idx) (L)))) (PreH9 : (0 <= idx)) (PreH10 : ((idx + 8 ) <= count)) (PreH11 : (p_pre = (base + idx ))) ,
  (UndefStructPredint8x8_t record_return )
  **  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
|--
  “ (retval_8 = (cvt_read_lane (7) (8) (idx) (L))) ” 
  &&  “ (retval_7 = (cvt_read_lane (6) (8) (idx) (L))) ” 
  &&  “ (retval_6 = (cvt_read_lane (5) (8) (idx) (L))) ” 
  &&  “ (retval_5 = (cvt_read_lane (4) (8) (idx) (L))) ” 
  &&  “ (retval_4 = (cvt_read_lane (3) (8) (idx) (L))) ” 
  &&  “ (retval_3 = (cvt_read_lane (2) (8) (idx) (L))) ” 
  &&  “ (retval_2 = (cvt_read_lane (1) (8) (idx) (L))) ” 
  &&  “ (retval = (cvt_read_lane (0) (8) (idx) (L))) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + 8 ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
  &&  ((&((record_return)  # "int8x8_t" ->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |-> retval_8)
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s6")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |-> retval_7)
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s5")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |-> retval_6)
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s4")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |-> retval_5)
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s3")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> retval_4)
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s2")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s1")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&((record_return)  # "int8x8_t" ->ₛ "s0")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
  **  (CharArray.full base count L )
.

Module Type VC_Correct.

Include char_arrays_Strategy_Correct.

Axiom proof_of_qcp_cvt_read_lane_safety_wit_1 : qcp_cvt_read_lane_safety_wit_1.
Axiom proof_of_qcp_cvt_read_lane_entail_wit_1 : qcp_cvt_read_lane_entail_wit_1.
Axiom proof_of_qcp_cvt_read_lane_entail_wit_2 : qcp_cvt_read_lane_entail_wit_2.
Axiom proof_of_qcp_cvt_read_lane_return_wit_1 : qcp_cvt_read_lane_return_wit_1.
Axiom proof_of_qcp_cvt_read_lane_return_wit_2 : qcp_cvt_read_lane_return_wit_2.
Axiom proof_of_vld1_s8_safety_wit_1 : vld1_s8_safety_wit_1.
Axiom proof_of_vld1_s8_safety_wit_2 : vld1_s8_safety_wit_2.
Axiom proof_of_vld1_s8_safety_wit_3 : vld1_s8_safety_wit_3.
Axiom proof_of_vld1_s8_safety_wit_4 : vld1_s8_safety_wit_4.
Axiom proof_of_vld1_s8_safety_wit_5 : vld1_s8_safety_wit_5.
Axiom proof_of_vld1_s8_safety_wit_6 : vld1_s8_safety_wit_6.
Axiom proof_of_vld1_s8_safety_wit_7 : vld1_s8_safety_wit_7.
Axiom proof_of_vld1_s8_safety_wit_8 : vld1_s8_safety_wit_8.
Axiom proof_of_vld1_s8_safety_wit_9 : vld1_s8_safety_wit_9.
Axiom proof_of_vld1_s8_safety_wit_10 : vld1_s8_safety_wit_10.
Axiom proof_of_vld1_s8_safety_wit_11 : vld1_s8_safety_wit_11.
Axiom proof_of_vld1_s8_safety_wit_12 : vld1_s8_safety_wit_12.
Axiom proof_of_vld1_s8_safety_wit_13 : vld1_s8_safety_wit_13.
Axiom proof_of_vld1_s8_safety_wit_14 : vld1_s8_safety_wit_14.
Axiom proof_of_vld1_s8_safety_wit_15 : vld1_s8_safety_wit_15.
Axiom proof_of_vld1_s8_safety_wit_16 : vld1_s8_safety_wit_16.
Axiom proof_of_vld1_s8_return_wit_1 : vld1_s8_return_wit_1.
Axiom proof_of_vld1_s8_partial_solve_wit_1_pure : vld1_s8_partial_solve_wit_1_pure.
Axiom proof_of_vld1_s8_partial_solve_wit_1 : vld1_s8_partial_solve_wit_1.
Axiom proof_of_vld1_s8_partial_solve_wit_2_pure : vld1_s8_partial_solve_wit_2_pure.
Axiom proof_of_vld1_s8_partial_solve_wit_2 : vld1_s8_partial_solve_wit_2.
Axiom proof_of_vld1_s8_partial_solve_wit_3_pure : vld1_s8_partial_solve_wit_3_pure.
Axiom proof_of_vld1_s8_partial_solve_wit_3 : vld1_s8_partial_solve_wit_3.
Axiom proof_of_vld1_s8_partial_solve_wit_4_pure : vld1_s8_partial_solve_wit_4_pure.
Axiom proof_of_vld1_s8_partial_solve_wit_4 : vld1_s8_partial_solve_wit_4.
Axiom proof_of_vld1_s8_partial_solve_wit_5_pure : vld1_s8_partial_solve_wit_5_pure.
Axiom proof_of_vld1_s8_partial_solve_wit_5 : vld1_s8_partial_solve_wit_5.
Axiom proof_of_vld1_s8_partial_solve_wit_6_pure : vld1_s8_partial_solve_wit_6_pure.
Axiom proof_of_vld1_s8_partial_solve_wit_6 : vld1_s8_partial_solve_wit_6.
Axiom proof_of_vld1_s8_partial_solve_wit_7_pure : vld1_s8_partial_solve_wit_7_pure.
Axiom proof_of_vld1_s8_partial_solve_wit_7 : vld1_s8_partial_solve_wit_7.
Axiom proof_of_vld1_s8_partial_solve_wit_8_pure : vld1_s8_partial_solve_wit_8_pure.
Axiom proof_of_vld1_s8_partial_solve_wit_8 : vld1_s8_partial_solve_wit_8.
Axiom proof_of_vld1_s8_partial_solve_wit_9 : vld1_s8_partial_solve_wit_9.

End VC_Correct.
