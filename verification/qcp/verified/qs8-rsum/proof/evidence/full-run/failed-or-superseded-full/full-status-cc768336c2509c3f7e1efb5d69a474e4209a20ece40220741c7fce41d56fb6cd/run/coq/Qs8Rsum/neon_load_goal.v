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
Require Import Qs8Rsum.Model.
Require Import Qs8Rsum.Types.
Require Import Qs8Rsum.MemoryModel.
Local Open Scope sac.
From Qs8Rsum Require Import byte_arrays_strategy_goal.
From Qs8Rsum Require Import byte_arrays_strategy_proof.

(*----- Function rsum_read_lane -----*)

Definition rsum_read_lane_safety_wit_1 := 
forall (vl_pre: Z) (i_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 128)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 128)) (PreH6 : (0 <= idx)) (PreH7 : ((idx + vl_pre ) <= count)) (PreH8 : (p_pre = (base + idx ))) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  (CharArray.full base count L )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition rsum_read_lane_entail_wit_1 := 
(
forall (vl_pre: Z) (i_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 128)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 128)) (PreH6 : (0 <= idx)) (PreH7 : ((idx + vl_pre ) <= count)) (PreH8 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
|--
  “ (0 <= i_pre) ” 
  &&  “ (i_pre < 128) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (i_pre < vl_pre) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
  &&  (CharArray.missing_i base (idx + i_pre ) 0 count L )
  **  (((p_pre + (i_pre * sizeof(CHAR)))) # Char  |-> (Znth (idx + i_pre ) L 0))
) \/
(
forall (vl_pre: Z) (i_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 128)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 128)) (PreH6 : (0 <= idx)) (PreH7 : ((idx + vl_pre ) <= count)) (PreH8 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
|--
  (CharArray.missing_i base (idx + i_pre ) 0 count L )
  **  (((p_pre + (i_pre * sizeof(CHAR)))) # Char  |-> (Znth (idx + i_pre ) L 0))
).

Definition rsum_read_lane_entail_wit_1_split_goal_spatial := 
forall (vl_pre: Z) (i_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (PreH1 : (i_pre < vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 128)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 128)) (PreH6 : (0 <= idx)) (PreH7 : ((idx + vl_pre ) <= count)) (PreH8 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
|--
  (CharArray.missing_i base (idx + i_pre ) 0 count L )
  **  (((p_pre + (i_pre * sizeof(CHAR)))) # Char  |-> (Znth (idx + i_pre ) L 0))
.

Definition rsum_read_lane_entail_wit_2 := 
(
forall (vl_pre: Z) (i_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 128)) (PreH3 : (0 <= vl_pre)) (PreH4 : (vl_pre <= 128)) (PreH5 : (i_pre < vl_pre)) (PreH6 : (0 <= idx)) (PreH7 : ((idx + vl_pre ) <= count)) (PreH8 : (p_pre = (base + idx ))) ,
  (CharArray.missing_i base (idx + i_pre ) 0 count L )
  **  (((p_pre + (i_pre * sizeof(CHAR)))) # Char  |-> (Znth (idx + i_pre ) L 0))
|--
  “ (0 <= i_pre) ” 
  &&  “ (i_pre < 128) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (i_pre < vl_pre) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
  &&  (CharArray.full base count L )
) \/
(
forall (vl_pre: Z) (i_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 128)) (PreH3 : (0 <= vl_pre)) (PreH4 : (vl_pre <= 128)) (PreH5 : (i_pre < vl_pre)) (PreH6 : (0 <= idx)) (PreH7 : ((idx + vl_pre ) <= count)) (PreH8 : (p_pre = (base + idx ))) ,
  (CharArray.missing_i base (idx + i_pre ) 0 count L )
  **  (((p_pre + (i_pre * sizeof(CHAR)))) # Char  |-> (Znth (idx + i_pre ) L 0))
|--
  (CharArray.full base count L )
).

Definition rsum_read_lane_entail_wit_2_split_goal_spatial := 
forall (vl_pre: Z) (i_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 128)) (PreH3 : (0 <= vl_pre)) (PreH4 : (vl_pre <= 128)) (PreH5 : (i_pre < vl_pre)) (PreH6 : (0 <= idx)) (PreH7 : ((idx + vl_pre ) <= count)) (PreH8 : (p_pre = (base + idx ))) ,
  (CharArray.missing_i base (idx + i_pre ) 0 count L )
  **  (((p_pre + (i_pre * sizeof(CHAR)))) # Char  |-> (Znth (idx + i_pre ) L 0))
|--
  (CharArray.full base count L )
.

Definition rsum_read_lane_return_wit_1 := 
(
forall (vl_pre: Z) (i_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 128)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 128)) (PreH6 : (0 <= idx)) (PreH7 : ((idx + vl_pre ) <= count)) (PreH8 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
|--
  “ (0 = (rs_read_lane (i_pre) (vl_pre) (idx) (L))) ”
  &&  (CharArray.full base count L )
) \/
(
forall (vl_pre: Z) (i_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 128)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 128)) (PreH6 : (0 <= idx)) (PreH7 : ((idx + vl_pre ) <= count)) (PreH8 : (p_pre = (base + idx ))) ,
  TT && emp 
|--
  “ (0 = (rs_read_lane (i_pre) (vl_pre) (idx) (L))) ”
  &&  emp
).

Definition rsum_read_lane_return_wit_1_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (PreH1 : (i_pre >= vl_pre)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 128)) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 128)) (PreH6 : (0 <= idx)) (PreH7 : ((idx + vl_pre ) <= count)) (PreH8 : (p_pre = (base + idx ))) ,
  (0 = (rs_read_lane (i_pre) (vl_pre) (idx) (L)))
.

Definition rsum_read_lane_return_wit_2 := 
(
forall (vl_pre: Z) (i_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 128)) (PreH3 : (0 <= vl_pre)) (PreH4 : (vl_pre <= 128)) (PreH5 : (i_pre < vl_pre)) (PreH6 : (0 <= idx)) (PreH7 : ((idx + vl_pre ) <= count)) (PreH8 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
|--
  “ ((Znth (idx + i_pre ) L 0) = (rs_read_lane (i_pre) (vl_pre) (idx) (L))) ”
  &&  (CharArray.full base count L )
) \/
(
forall (vl_pre: Z) (i_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 128)) (PreH3 : (0 <= vl_pre)) (PreH4 : (vl_pre <= 128)) (PreH5 : (i_pre < vl_pre)) (PreH6 : (0 <= idx)) (PreH7 : ((idx + vl_pre ) <= count)) (PreH8 : (p_pre = (base + idx ))) ,
  TT && emp 
|--
  “ ((Znth (idx + i_pre ) L 0) = (rs_read_lane (i_pre) (vl_pre) (idx) (L))) ”
  &&  emp
).

Definition rsum_read_lane_return_wit_2_split_goal_1 := 
forall (vl_pre: Z) (i_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 128)) (PreH3 : (0 <= vl_pre)) (PreH4 : (vl_pre <= 128)) (PreH5 : (i_pre < vl_pre)) (PreH6 : (0 <= idx)) (PreH7 : ((idx + vl_pre ) <= count)) (PreH8 : (p_pre = (base + idx ))) ,
  ((Znth (idx + i_pre ) L 0) = (rs_read_lane (i_pre) (vl_pre) (idx) (L)))
.

(*----- Function vld1q_s8 -----*)

Definition vld1q_s8_safety_wit_1 := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (PreH1 : (0 <= idx)) (PreH2 : ((idx + 16 ) <= count)) (PreH3 : (p_pre = (base + idx ))) ,
  (UndefStructPredint8x16_t ( &( "r" ) ) )
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  (CharArray.full base count L )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition vld1q_s8_safety_wit_2 := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (PreH1 : (0 <= idx)) (PreH2 : ((idx + 16 ) <= count)) (PreH3 : (p_pre = (base + idx ))) ,
  (UndefStructPredint8x16_t ( &( "r" ) ) )
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  (CharArray.full base count L )
|--
  “ (16 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 16) ”
.

Definition vld1q_s8_safety_wit_3 := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (PreH1 : (retval = (rs_read_lane (0) (16) (idx) (L)))) (PreH2 : (0 <= idx)) (PreH3 : ((idx + 16 ) <= count)) (PreH4 : (p_pre = (base + idx ))) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
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

Definition vld1q_s8_safety_wit_4 := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (PreH1 : (retval = (rs_read_lane (0) (16) (idx) (L)))) (PreH2 : (0 <= idx)) (PreH3 : ((idx + 16 ) <= count)) (PreH4 : (p_pre = (base + idx ))) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
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
  “ (16 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 16) ”
.

Definition vld1q_s8_safety_wit_5 := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (rs_read_lane (1) (16) (idx) (L)))) (PreH2 : (retval = (rs_read_lane (0) (16) (idx) (L)))) (PreH3 : (0 <= idx)) (PreH4 : ((idx + 16 ) <= count)) (PreH5 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Char  |->_)
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

Definition vld1q_s8_safety_wit_6 := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (rs_read_lane (1) (16) (idx) (L)))) (PreH2 : (retval = (rs_read_lane (0) (16) (idx) (L)))) (PreH3 : (0 <= idx)) (PreH4 : ((idx + 16 ) <= count)) (PreH5 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Char  |->_)
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
  “ (16 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 16) ”
.

Definition vld1q_s8_safety_wit_7 := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = (rs_read_lane (2) (16) (idx) (L)))) (PreH2 : (retval_2 = (rs_read_lane (1) (16) (idx) (L)))) (PreH3 : (retval = (rs_read_lane (0) (16) (idx) (L)))) (PreH4 : (0 <= idx)) (PreH5 : ((idx + 16 ) <= count)) (PreH6 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Char  |->_)
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

Definition vld1q_s8_safety_wit_8 := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = (rs_read_lane (2) (16) (idx) (L)))) (PreH2 : (retval_2 = (rs_read_lane (1) (16) (idx) (L)))) (PreH3 : (retval = (rs_read_lane (0) (16) (idx) (L)))) (PreH4 : (0 <= idx)) (PreH5 : ((idx + 16 ) <= count)) (PreH6 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Char  |->_)
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
  “ (16 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 16) ”
.

Definition vld1q_s8_safety_wit_9 := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_4 = (rs_read_lane (3) (16) (idx) (L)))) (PreH2 : (retval_3 = (rs_read_lane (2) (16) (idx) (L)))) (PreH3 : (retval_2 = (rs_read_lane (1) (16) (idx) (L)))) (PreH4 : (retval = (rs_read_lane (0) (16) (idx) (L)))) (PreH5 : (0 <= idx)) (PreH6 : ((idx + 16 ) <= count)) (PreH7 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Char  |->_)
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

Definition vld1q_s8_safety_wit_10 := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_4 = (rs_read_lane (3) (16) (idx) (L)))) (PreH2 : (retval_3 = (rs_read_lane (2) (16) (idx) (L)))) (PreH3 : (retval_2 = (rs_read_lane (1) (16) (idx) (L)))) (PreH4 : (retval = (rs_read_lane (0) (16) (idx) (L)))) (PreH5 : (0 <= idx)) (PreH6 : ((idx + 16 ) <= count)) (PreH7 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Char  |->_)
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
  “ (16 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 16) ”
.

Definition vld1q_s8_safety_wit_11 := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (PreH1 : (retval_5 = (rs_read_lane (4) (16) (idx) (L)))) (PreH2 : (retval_4 = (rs_read_lane (3) (16) (idx) (L)))) (PreH3 : (retval_3 = (rs_read_lane (2) (16) (idx) (L)))) (PreH4 : (retval_2 = (rs_read_lane (1) (16) (idx) (L)))) (PreH5 : (retval = (rs_read_lane (0) (16) (idx) (L)))) (PreH6 : (0 <= idx)) (PreH7 : ((idx + 16 ) <= count)) (PreH8 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Char  |->_)
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

Definition vld1q_s8_safety_wit_12 := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (PreH1 : (retval_5 = (rs_read_lane (4) (16) (idx) (L)))) (PreH2 : (retval_4 = (rs_read_lane (3) (16) (idx) (L)))) (PreH3 : (retval_3 = (rs_read_lane (2) (16) (idx) (L)))) (PreH4 : (retval_2 = (rs_read_lane (1) (16) (idx) (L)))) (PreH5 : (retval = (rs_read_lane (0) (16) (idx) (L)))) (PreH6 : (0 <= idx)) (PreH7 : ((idx + 16 ) <= count)) (PreH8 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Char  |->_)
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
  “ (16 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 16) ”
.

Definition vld1q_s8_safety_wit_13 := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (PreH1 : (retval_6 = (rs_read_lane (5) (16) (idx) (L)))) (PreH2 : (retval_5 = (rs_read_lane (4) (16) (idx) (L)))) (PreH3 : (retval_4 = (rs_read_lane (3) (16) (idx) (L)))) (PreH4 : (retval_3 = (rs_read_lane (2) (16) (idx) (L)))) (PreH5 : (retval_2 = (rs_read_lane (1) (16) (idx) (L)))) (PreH6 : (retval = (rs_read_lane (0) (16) (idx) (L)))) (PreH7 : (0 <= idx)) (PreH8 : ((idx + 16 ) <= count)) (PreH9 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Char  |->_)
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

Definition vld1q_s8_safety_wit_14 := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (PreH1 : (retval_6 = (rs_read_lane (5) (16) (idx) (L)))) (PreH2 : (retval_5 = (rs_read_lane (4) (16) (idx) (L)))) (PreH3 : (retval_4 = (rs_read_lane (3) (16) (idx) (L)))) (PreH4 : (retval_3 = (rs_read_lane (2) (16) (idx) (L)))) (PreH5 : (retval_2 = (rs_read_lane (1) (16) (idx) (L)))) (PreH6 : (retval = (rs_read_lane (0) (16) (idx) (L)))) (PreH7 : (0 <= idx)) (PreH8 : ((idx + 16 ) <= count)) (PreH9 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Char  |->_)
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
  “ (16 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 16) ”
.

Definition vld1q_s8_safety_wit_15 := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (PreH1 : (retval_7 = (rs_read_lane (6) (16) (idx) (L)))) (PreH2 : (retval_6 = (rs_read_lane (5) (16) (idx) (L)))) (PreH3 : (retval_5 = (rs_read_lane (4) (16) (idx) (L)))) (PreH4 : (retval_4 = (rs_read_lane (3) (16) (idx) (L)))) (PreH5 : (retval_3 = (rs_read_lane (2) (16) (idx) (L)))) (PreH6 : (retval_2 = (rs_read_lane (1) (16) (idx) (L)))) (PreH7 : (retval = (rs_read_lane (0) (16) (idx) (L)))) (PreH8 : (0 <= idx)) (PreH9 : ((idx + 16 ) <= count)) (PreH10 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Char  |->_)
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

Definition vld1q_s8_safety_wit_16 := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (PreH1 : (retval_7 = (rs_read_lane (6) (16) (idx) (L)))) (PreH2 : (retval_6 = (rs_read_lane (5) (16) (idx) (L)))) (PreH3 : (retval_5 = (rs_read_lane (4) (16) (idx) (L)))) (PreH4 : (retval_4 = (rs_read_lane (3) (16) (idx) (L)))) (PreH5 : (retval_3 = (rs_read_lane (2) (16) (idx) (L)))) (PreH6 : (retval_2 = (rs_read_lane (1) (16) (idx) (L)))) (PreH7 : (retval = (rs_read_lane (0) (16) (idx) (L)))) (PreH8 : (0 <= idx)) (PreH9 : ((idx + 16 ) <= count)) (PreH10 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Char  |->_)
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
  “ (16 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 16) ”
.

Definition vld1q_s8_safety_wit_17 := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (PreH1 : (retval_8 = (rs_read_lane (7) (16) (idx) (L)))) (PreH2 : (retval_7 = (rs_read_lane (6) (16) (idx) (L)))) (PreH3 : (retval_6 = (rs_read_lane (5) (16) (idx) (L)))) (PreH4 : (retval_5 = (rs_read_lane (4) (16) (idx) (L)))) (PreH5 : (retval_4 = (rs_read_lane (3) (16) (idx) (L)))) (PreH6 : (retval_3 = (rs_read_lane (2) (16) (idx) (L)))) (PreH7 : (retval_2 = (rs_read_lane (1) (16) (idx) (L)))) (PreH8 : (retval = (rs_read_lane (0) (16) (idx) (L)))) (PreH9 : (0 <= idx)) (PreH10 : ((idx + 16 ) <= count)) (PreH11 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |-> retval_8)
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

Definition vld1q_s8_safety_wit_18 := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (PreH1 : (retval_8 = (rs_read_lane (7) (16) (idx) (L)))) (PreH2 : (retval_7 = (rs_read_lane (6) (16) (idx) (L)))) (PreH3 : (retval_6 = (rs_read_lane (5) (16) (idx) (L)))) (PreH4 : (retval_5 = (rs_read_lane (4) (16) (idx) (L)))) (PreH5 : (retval_4 = (rs_read_lane (3) (16) (idx) (L)))) (PreH6 : (retval_3 = (rs_read_lane (2) (16) (idx) (L)))) (PreH7 : (retval_2 = (rs_read_lane (1) (16) (idx) (L)))) (PreH8 : (retval = (rs_read_lane (0) (16) (idx) (L)))) (PreH9 : (0 <= idx)) (PreH10 : ((idx + 16 ) <= count)) (PreH11 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (16 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 16) ”
.

Definition vld1q_s8_safety_wit_19 := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (PreH1 : (retval_9 = (rs_read_lane (8) (16) (idx) (L)))) (PreH2 : (retval_8 = (rs_read_lane (7) (16) (idx) (L)))) (PreH3 : (retval_7 = (rs_read_lane (6) (16) (idx) (L)))) (PreH4 : (retval_6 = (rs_read_lane (5) (16) (idx) (L)))) (PreH5 : (retval_5 = (rs_read_lane (4) (16) (idx) (L)))) (PreH6 : (retval_4 = (rs_read_lane (3) (16) (idx) (L)))) (PreH7 : (retval_3 = (rs_read_lane (2) (16) (idx) (L)))) (PreH8 : (retval_2 = (rs_read_lane (1) (16) (idx) (L)))) (PreH9 : (retval = (rs_read_lane (0) (16) (idx) (L)))) (PreH10 : (0 <= idx)) (PreH11 : ((idx + 16 ) <= count)) (PreH12 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Char  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (9 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 9) ”
.

Definition vld1q_s8_safety_wit_20 := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (PreH1 : (retval_9 = (rs_read_lane (8) (16) (idx) (L)))) (PreH2 : (retval_8 = (rs_read_lane (7) (16) (idx) (L)))) (PreH3 : (retval_7 = (rs_read_lane (6) (16) (idx) (L)))) (PreH4 : (retval_6 = (rs_read_lane (5) (16) (idx) (L)))) (PreH5 : (retval_5 = (rs_read_lane (4) (16) (idx) (L)))) (PreH6 : (retval_4 = (rs_read_lane (3) (16) (idx) (L)))) (PreH7 : (retval_3 = (rs_read_lane (2) (16) (idx) (L)))) (PreH8 : (retval_2 = (rs_read_lane (1) (16) (idx) (L)))) (PreH9 : (retval = (rs_read_lane (0) (16) (idx) (L)))) (PreH10 : (0 <= idx)) (PreH11 : ((idx + 16 ) <= count)) (PreH12 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Char  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (16 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 16) ”
.

Definition vld1q_s8_safety_wit_21 := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (PreH1 : (retval_10 = (rs_read_lane (9) (16) (idx) (L)))) (PreH2 : (retval_9 = (rs_read_lane (8) (16) (idx) (L)))) (PreH3 : (retval_8 = (rs_read_lane (7) (16) (idx) (L)))) (PreH4 : (retval_7 = (rs_read_lane (6) (16) (idx) (L)))) (PreH5 : (retval_6 = (rs_read_lane (5) (16) (idx) (L)))) (PreH6 : (retval_5 = (rs_read_lane (4) (16) (idx) (L)))) (PreH7 : (retval_4 = (rs_read_lane (3) (16) (idx) (L)))) (PreH8 : (retval_3 = (rs_read_lane (2) (16) (idx) (L)))) (PreH9 : (retval_2 = (rs_read_lane (1) (16) (idx) (L)))) (PreH10 : (retval = (rs_read_lane (0) (16) (idx) (L)))) (PreH11 : (0 <= idx)) (PreH12 : ((idx + 16 ) <= count)) (PreH13 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Char  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Char  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (10 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 10) ”
.

Definition vld1q_s8_safety_wit_22 := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (PreH1 : (retval_10 = (rs_read_lane (9) (16) (idx) (L)))) (PreH2 : (retval_9 = (rs_read_lane (8) (16) (idx) (L)))) (PreH3 : (retval_8 = (rs_read_lane (7) (16) (idx) (L)))) (PreH4 : (retval_7 = (rs_read_lane (6) (16) (idx) (L)))) (PreH5 : (retval_6 = (rs_read_lane (5) (16) (idx) (L)))) (PreH6 : (retval_5 = (rs_read_lane (4) (16) (idx) (L)))) (PreH7 : (retval_4 = (rs_read_lane (3) (16) (idx) (L)))) (PreH8 : (retval_3 = (rs_read_lane (2) (16) (idx) (L)))) (PreH9 : (retval_2 = (rs_read_lane (1) (16) (idx) (L)))) (PreH10 : (retval = (rs_read_lane (0) (16) (idx) (L)))) (PreH11 : (0 <= idx)) (PreH12 : ((idx + 16 ) <= count)) (PreH13 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Char  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Char  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (16 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 16) ”
.

Definition vld1q_s8_safety_wit_23 := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (PreH1 : (retval_11 = (rs_read_lane (10) (16) (idx) (L)))) (PreH2 : (retval_10 = (rs_read_lane (9) (16) (idx) (L)))) (PreH3 : (retval_9 = (rs_read_lane (8) (16) (idx) (L)))) (PreH4 : (retval_8 = (rs_read_lane (7) (16) (idx) (L)))) (PreH5 : (retval_7 = (rs_read_lane (6) (16) (idx) (L)))) (PreH6 : (retval_6 = (rs_read_lane (5) (16) (idx) (L)))) (PreH7 : (retval_5 = (rs_read_lane (4) (16) (idx) (L)))) (PreH8 : (retval_4 = (rs_read_lane (3) (16) (idx) (L)))) (PreH9 : (retval_3 = (rs_read_lane (2) (16) (idx) (L)))) (PreH10 : (retval_2 = (rs_read_lane (1) (16) (idx) (L)))) (PreH11 : (retval = (rs_read_lane (0) (16) (idx) (L)))) (PreH12 : (0 <= idx)) (PreH13 : ((idx + 16 ) <= count)) (PreH14 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Char  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Char  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Char  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (11 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 11) ”
.

Definition vld1q_s8_safety_wit_24 := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (PreH1 : (retval_11 = (rs_read_lane (10) (16) (idx) (L)))) (PreH2 : (retval_10 = (rs_read_lane (9) (16) (idx) (L)))) (PreH3 : (retval_9 = (rs_read_lane (8) (16) (idx) (L)))) (PreH4 : (retval_8 = (rs_read_lane (7) (16) (idx) (L)))) (PreH5 : (retval_7 = (rs_read_lane (6) (16) (idx) (L)))) (PreH6 : (retval_6 = (rs_read_lane (5) (16) (idx) (L)))) (PreH7 : (retval_5 = (rs_read_lane (4) (16) (idx) (L)))) (PreH8 : (retval_4 = (rs_read_lane (3) (16) (idx) (L)))) (PreH9 : (retval_3 = (rs_read_lane (2) (16) (idx) (L)))) (PreH10 : (retval_2 = (rs_read_lane (1) (16) (idx) (L)))) (PreH11 : (retval = (rs_read_lane (0) (16) (idx) (L)))) (PreH12 : (0 <= idx)) (PreH13 : ((idx + 16 ) <= count)) (PreH14 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Char  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Char  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Char  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (16 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 16) ”
.

Definition vld1q_s8_safety_wit_25 := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (PreH1 : (retval_12 = (rs_read_lane (11) (16) (idx) (L)))) (PreH2 : (retval_11 = (rs_read_lane (10) (16) (idx) (L)))) (PreH3 : (retval_10 = (rs_read_lane (9) (16) (idx) (L)))) (PreH4 : (retval_9 = (rs_read_lane (8) (16) (idx) (L)))) (PreH5 : (retval_8 = (rs_read_lane (7) (16) (idx) (L)))) (PreH6 : (retval_7 = (rs_read_lane (6) (16) (idx) (L)))) (PreH7 : (retval_6 = (rs_read_lane (5) (16) (idx) (L)))) (PreH8 : (retval_5 = (rs_read_lane (4) (16) (idx) (L)))) (PreH9 : (retval_4 = (rs_read_lane (3) (16) (idx) (L)))) (PreH10 : (retval_3 = (rs_read_lane (2) (16) (idx) (L)))) (PreH11 : (retval_2 = (rs_read_lane (1) (16) (idx) (L)))) (PreH12 : (retval = (rs_read_lane (0) (16) (idx) (L)))) (PreH13 : (0 <= idx)) (PreH14 : ((idx + 16 ) <= count)) (PreH15 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Char  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Char  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Char  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Char  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (12 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 12) ”
.

Definition vld1q_s8_safety_wit_26 := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (PreH1 : (retval_12 = (rs_read_lane (11) (16) (idx) (L)))) (PreH2 : (retval_11 = (rs_read_lane (10) (16) (idx) (L)))) (PreH3 : (retval_10 = (rs_read_lane (9) (16) (idx) (L)))) (PreH4 : (retval_9 = (rs_read_lane (8) (16) (idx) (L)))) (PreH5 : (retval_8 = (rs_read_lane (7) (16) (idx) (L)))) (PreH6 : (retval_7 = (rs_read_lane (6) (16) (idx) (L)))) (PreH7 : (retval_6 = (rs_read_lane (5) (16) (idx) (L)))) (PreH8 : (retval_5 = (rs_read_lane (4) (16) (idx) (L)))) (PreH9 : (retval_4 = (rs_read_lane (3) (16) (idx) (L)))) (PreH10 : (retval_3 = (rs_read_lane (2) (16) (idx) (L)))) (PreH11 : (retval_2 = (rs_read_lane (1) (16) (idx) (L)))) (PreH12 : (retval = (rs_read_lane (0) (16) (idx) (L)))) (PreH13 : (0 <= idx)) (PreH14 : ((idx + 16 ) <= count)) (PreH15 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Char  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Char  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Char  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Char  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (16 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 16) ”
.

Definition vld1q_s8_safety_wit_27 := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (PreH1 : (retval_13 = (rs_read_lane (12) (16) (idx) (L)))) (PreH2 : (retval_12 = (rs_read_lane (11) (16) (idx) (L)))) (PreH3 : (retval_11 = (rs_read_lane (10) (16) (idx) (L)))) (PreH4 : (retval_10 = (rs_read_lane (9) (16) (idx) (L)))) (PreH5 : (retval_9 = (rs_read_lane (8) (16) (idx) (L)))) (PreH6 : (retval_8 = (rs_read_lane (7) (16) (idx) (L)))) (PreH7 : (retval_7 = (rs_read_lane (6) (16) (idx) (L)))) (PreH8 : (retval_6 = (rs_read_lane (5) (16) (idx) (L)))) (PreH9 : (retval_5 = (rs_read_lane (4) (16) (idx) (L)))) (PreH10 : (retval_4 = (rs_read_lane (3) (16) (idx) (L)))) (PreH11 : (retval_3 = (rs_read_lane (2) (16) (idx) (L)))) (PreH12 : (retval_2 = (rs_read_lane (1) (16) (idx) (L)))) (PreH13 : (retval = (rs_read_lane (0) (16) (idx) (L)))) (PreH14 : (0 <= idx)) (PreH15 : ((idx + 16 ) <= count)) (PreH16 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Char  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Char  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Char  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Char  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Char  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (13 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 13) ”
.

Definition vld1q_s8_safety_wit_28 := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (PreH1 : (retval_13 = (rs_read_lane (12) (16) (idx) (L)))) (PreH2 : (retval_12 = (rs_read_lane (11) (16) (idx) (L)))) (PreH3 : (retval_11 = (rs_read_lane (10) (16) (idx) (L)))) (PreH4 : (retval_10 = (rs_read_lane (9) (16) (idx) (L)))) (PreH5 : (retval_9 = (rs_read_lane (8) (16) (idx) (L)))) (PreH6 : (retval_8 = (rs_read_lane (7) (16) (idx) (L)))) (PreH7 : (retval_7 = (rs_read_lane (6) (16) (idx) (L)))) (PreH8 : (retval_6 = (rs_read_lane (5) (16) (idx) (L)))) (PreH9 : (retval_5 = (rs_read_lane (4) (16) (idx) (L)))) (PreH10 : (retval_4 = (rs_read_lane (3) (16) (idx) (L)))) (PreH11 : (retval_3 = (rs_read_lane (2) (16) (idx) (L)))) (PreH12 : (retval_2 = (rs_read_lane (1) (16) (idx) (L)))) (PreH13 : (retval = (rs_read_lane (0) (16) (idx) (L)))) (PreH14 : (0 <= idx)) (PreH15 : ((idx + 16 ) <= count)) (PreH16 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Char  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Char  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Char  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Char  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Char  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (16 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 16) ”
.

Definition vld1q_s8_safety_wit_29 := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (PreH1 : (retval_14 = (rs_read_lane (13) (16) (idx) (L)))) (PreH2 : (retval_13 = (rs_read_lane (12) (16) (idx) (L)))) (PreH3 : (retval_12 = (rs_read_lane (11) (16) (idx) (L)))) (PreH4 : (retval_11 = (rs_read_lane (10) (16) (idx) (L)))) (PreH5 : (retval_10 = (rs_read_lane (9) (16) (idx) (L)))) (PreH6 : (retval_9 = (rs_read_lane (8) (16) (idx) (L)))) (PreH7 : (retval_8 = (rs_read_lane (7) (16) (idx) (L)))) (PreH8 : (retval_7 = (rs_read_lane (6) (16) (idx) (L)))) (PreH9 : (retval_6 = (rs_read_lane (5) (16) (idx) (L)))) (PreH10 : (retval_5 = (rs_read_lane (4) (16) (idx) (L)))) (PreH11 : (retval_4 = (rs_read_lane (3) (16) (idx) (L)))) (PreH12 : (retval_3 = (rs_read_lane (2) (16) (idx) (L)))) (PreH13 : (retval_2 = (rs_read_lane (1) (16) (idx) (L)))) (PreH14 : (retval = (rs_read_lane (0) (16) (idx) (L)))) (PreH15 : (0 <= idx)) (PreH16 : ((idx + 16 ) <= count)) (PreH17 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Char  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Char  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Char  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Char  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Char  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Char  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (14 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 14) ”
.

Definition vld1q_s8_safety_wit_30 := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (PreH1 : (retval_14 = (rs_read_lane (13) (16) (idx) (L)))) (PreH2 : (retval_13 = (rs_read_lane (12) (16) (idx) (L)))) (PreH3 : (retval_12 = (rs_read_lane (11) (16) (idx) (L)))) (PreH4 : (retval_11 = (rs_read_lane (10) (16) (idx) (L)))) (PreH5 : (retval_10 = (rs_read_lane (9) (16) (idx) (L)))) (PreH6 : (retval_9 = (rs_read_lane (8) (16) (idx) (L)))) (PreH7 : (retval_8 = (rs_read_lane (7) (16) (idx) (L)))) (PreH8 : (retval_7 = (rs_read_lane (6) (16) (idx) (L)))) (PreH9 : (retval_6 = (rs_read_lane (5) (16) (idx) (L)))) (PreH10 : (retval_5 = (rs_read_lane (4) (16) (idx) (L)))) (PreH11 : (retval_4 = (rs_read_lane (3) (16) (idx) (L)))) (PreH12 : (retval_3 = (rs_read_lane (2) (16) (idx) (L)))) (PreH13 : (retval_2 = (rs_read_lane (1) (16) (idx) (L)))) (PreH14 : (retval = (rs_read_lane (0) (16) (idx) (L)))) (PreH15 : (0 <= idx)) (PreH16 : ((idx + 16 ) <= count)) (PreH17 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Char  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Char  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Char  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Char  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Char  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Char  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (16 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 16) ”
.

Definition vld1q_s8_safety_wit_31 := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (PreH1 : (retval_15 = (rs_read_lane (14) (16) (idx) (L)))) (PreH2 : (retval_14 = (rs_read_lane (13) (16) (idx) (L)))) (PreH3 : (retval_13 = (rs_read_lane (12) (16) (idx) (L)))) (PreH4 : (retval_12 = (rs_read_lane (11) (16) (idx) (L)))) (PreH5 : (retval_11 = (rs_read_lane (10) (16) (idx) (L)))) (PreH6 : (retval_10 = (rs_read_lane (9) (16) (idx) (L)))) (PreH7 : (retval_9 = (rs_read_lane (8) (16) (idx) (L)))) (PreH8 : (retval_8 = (rs_read_lane (7) (16) (idx) (L)))) (PreH9 : (retval_7 = (rs_read_lane (6) (16) (idx) (L)))) (PreH10 : (retval_6 = (rs_read_lane (5) (16) (idx) (L)))) (PreH11 : (retval_5 = (rs_read_lane (4) (16) (idx) (L)))) (PreH12 : (retval_4 = (rs_read_lane (3) (16) (idx) (L)))) (PreH13 : (retval_3 = (rs_read_lane (2) (16) (idx) (L)))) (PreH14 : (retval_2 = (rs_read_lane (1) (16) (idx) (L)))) (PreH15 : (retval = (rs_read_lane (0) (16) (idx) (L)))) (PreH16 : (0 <= idx)) (PreH17 : ((idx + 16 ) <= count)) (PreH18 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Char  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Char  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Char  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Char  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Char  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Char  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Char  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (15 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 15) ”
.

Definition vld1q_s8_safety_wit_32 := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (PreH1 : (retval_15 = (rs_read_lane (14) (16) (idx) (L)))) (PreH2 : (retval_14 = (rs_read_lane (13) (16) (idx) (L)))) (PreH3 : (retval_13 = (rs_read_lane (12) (16) (idx) (L)))) (PreH4 : (retval_12 = (rs_read_lane (11) (16) (idx) (L)))) (PreH5 : (retval_11 = (rs_read_lane (10) (16) (idx) (L)))) (PreH6 : (retval_10 = (rs_read_lane (9) (16) (idx) (L)))) (PreH7 : (retval_9 = (rs_read_lane (8) (16) (idx) (L)))) (PreH8 : (retval_8 = (rs_read_lane (7) (16) (idx) (L)))) (PreH9 : (retval_7 = (rs_read_lane (6) (16) (idx) (L)))) (PreH10 : (retval_6 = (rs_read_lane (5) (16) (idx) (L)))) (PreH11 : (retval_5 = (rs_read_lane (4) (16) (idx) (L)))) (PreH12 : (retval_4 = (rs_read_lane (3) (16) (idx) (L)))) (PreH13 : (retval_3 = (rs_read_lane (2) (16) (idx) (L)))) (PreH14 : (retval_2 = (rs_read_lane (1) (16) (idx) (L)))) (PreH15 : (retval = (rs_read_lane (0) (16) (idx) (L)))) (PreH16 : (0 <= idx)) (PreH17 : ((idx + 16 ) <= count)) (PreH18 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Char  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Char  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Char  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Char  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Char  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Char  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Char  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (16 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 16) ”
.

Definition vld1q_s8_return_wit_1 := 
(
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (record_return: Z) (PreH1 : (retval_16 = (rs_read_lane (15) (16) (idx) (L)))) (PreH2 : (retval_15 = (rs_read_lane (14) (16) (idx) (L)))) (PreH3 : (retval_14 = (rs_read_lane (13) (16) (idx) (L)))) (PreH4 : (retval_13 = (rs_read_lane (12) (16) (idx) (L)))) (PreH5 : (retval_12 = (rs_read_lane (11) (16) (idx) (L)))) (PreH6 : (retval_11 = (rs_read_lane (10) (16) (idx) (L)))) (PreH7 : (retval_10 = (rs_read_lane (9) (16) (idx) (L)))) (PreH8 : (retval_9 = (rs_read_lane (8) (16) (idx) (L)))) (PreH9 : (retval_8 = (rs_read_lane (7) (16) (idx) (L)))) (PreH10 : (retval_7 = (rs_read_lane (6) (16) (idx) (L)))) (PreH11 : (retval_6 = (rs_read_lane (5) (16) (idx) (L)))) (PreH12 : (retval_5 = (rs_read_lane (4) (16) (idx) (L)))) (PreH13 : (retval_4 = (rs_read_lane (3) (16) (idx) (L)))) (PreH14 : (retval_3 = (rs_read_lane (2) (16) (idx) (L)))) (PreH15 : (retval_2 = (rs_read_lane (1) (16) (idx) (L)))) (PreH16 : (retval = (rs_read_lane (0) (16) (idx) (L)))) (PreH17 : (0 <= idx)) (PreH18 : ((idx + 16 ) <= count)) (PreH19 : (p_pre = (base + idx ))) ,
  ((&((record_return)  # "int8x16_t" ->ₛ "s15")) # Char  |-> retval_16)
  **  ((&((record_return)  # "int8x16_t" ->ₛ "s14")) # Char  |-> retval_15)
  **  ((&((record_return)  # "int8x16_t" ->ₛ "s13")) # Char  |-> retval_14)
  **  ((&((record_return)  # "int8x16_t" ->ₛ "s12")) # Char  |-> retval_13)
  **  ((&((record_return)  # "int8x16_t" ->ₛ "s11")) # Char  |-> retval_12)
  **  ((&((record_return)  # "int8x16_t" ->ₛ "s10")) # Char  |-> retval_11)
  **  ((&((record_return)  # "int8x16_t" ->ₛ "s9")) # Char  |-> retval_10)
  **  ((&((record_return)  # "int8x16_t" ->ₛ "s8")) # Char  |-> retval_9)
  **  ((&((record_return)  # "int8x16_t" ->ₛ "s7")) # Char  |-> retval_8)
  **  ((&((record_return)  # "int8x16_t" ->ₛ "s6")) # Char  |-> retval_7)
  **  ((&((record_return)  # "int8x16_t" ->ₛ "s5")) # Char  |-> retval_6)
  **  ((&((record_return)  # "int8x16_t" ->ₛ "s4")) # Char  |-> retval_5)
  **  ((&((record_return)  # "int8x16_t" ->ₛ "s3")) # Char  |-> retval_4)
  **  ((&((record_return)  # "int8x16_t" ->ₛ "s2")) # Char  |-> retval_3)
  **  ((&((record_return)  # "int8x16_t" ->ₛ "s1")) # Char  |-> retval_2)
  **  ((&((record_return)  # "int8x16_t" ->ₛ "s0")) # Char  |-> retval)
  **  (CharArray.full base count L )
|--
  (CharArray.full base count L )
  **  ((&((record_return)  # "int8x16_t" ->ₛ "s0")) # Char  |-> (Znth (idx + 0 ) L 0))
  **  ((&((record_return)  # "int8x16_t" ->ₛ "s1")) # Char  |-> (Znth (idx + 1 ) L 0))
  **  ((&((record_return)  # "int8x16_t" ->ₛ "s2")) # Char  |-> (Znth (idx + 2 ) L 0))
  **  ((&((record_return)  # "int8x16_t" ->ₛ "s3")) # Char  |-> (Znth (idx + 3 ) L 0))
  **  ((&((record_return)  # "int8x16_t" ->ₛ "s4")) # Char  |-> (Znth (idx + 4 ) L 0))
  **  ((&((record_return)  # "int8x16_t" ->ₛ "s5")) # Char  |-> (Znth (idx + 5 ) L 0))
  **  ((&((record_return)  # "int8x16_t" ->ₛ "s6")) # Char  |-> (Znth (idx + 6 ) L 0))
  **  ((&((record_return)  # "int8x16_t" ->ₛ "s7")) # Char  |-> (Znth (idx + 7 ) L 0))
  **  ((&((record_return)  # "int8x16_t" ->ₛ "s8")) # Char  |-> (Znth (idx + 8 ) L 0))
  **  ((&((record_return)  # "int8x16_t" ->ₛ "s9")) # Char  |-> (Znth (idx + 9 ) L 0))
  **  ((&((record_return)  # "int8x16_t" ->ₛ "s10")) # Char  |-> (Znth (idx + 10 ) L 0))
  **  ((&((record_return)  # "int8x16_t" ->ₛ "s11")) # Char  |-> (Znth (idx + 11 ) L 0))
  **  ((&((record_return)  # "int8x16_t" ->ₛ "s12")) # Char  |-> (Znth (idx + 12 ) L 0))
  **  ((&((record_return)  # "int8x16_t" ->ₛ "s13")) # Char  |-> (Znth (idx + 13 ) L 0))
  **  ((&((record_return)  # "int8x16_t" ->ₛ "s14")) # Char  |-> (Znth (idx + 14 ) L 0))
  **  ((&((record_return)  # "int8x16_t" ->ₛ "s15")) # Char  |-> (Znth (idx + 15 ) L 0))
) \/
(
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (PreH1 : (retval_16 = (rs_read_lane (15) (16) (idx) (L)))) (PreH2 : (retval_15 = (rs_read_lane (14) (16) (idx) (L)))) (PreH3 : (retval_14 = (rs_read_lane (13) (16) (idx) (L)))) (PreH4 : (retval_13 = (rs_read_lane (12) (16) (idx) (L)))) (PreH5 : (retval_12 = (rs_read_lane (11) (16) (idx) (L)))) (PreH6 : (retval_11 = (rs_read_lane (10) (16) (idx) (L)))) (PreH7 : (retval_10 = (rs_read_lane (9) (16) (idx) (L)))) (PreH8 : (retval_9 = (rs_read_lane (8) (16) (idx) (L)))) (PreH9 : (retval_8 = (rs_read_lane (7) (16) (idx) (L)))) (PreH10 : (retval_7 = (rs_read_lane (6) (16) (idx) (L)))) (PreH11 : (retval_6 = (rs_read_lane (5) (16) (idx) (L)))) (PreH12 : (retval_5 = (rs_read_lane (4) (16) (idx) (L)))) (PreH13 : (retval_4 = (rs_read_lane (3) (16) (idx) (L)))) (PreH14 : (retval_3 = (rs_read_lane (2) (16) (idx) (L)))) (PreH15 : (retval_2 = (rs_read_lane (1) (16) (idx) (L)))) (PreH16 : (retval = (rs_read_lane (0) (16) (idx) (L)))) (PreH17 : (0 <= idx)) (PreH18 : ((idx + 16 ) <= count)) (PreH19 : (p_pre = (base + idx ))) ,
  TT && emp 
|--
  “ (retval_16 = (Znth (idx + 15 ) L 0)) ” 
  &&  “ (retval_15 = (Znth (idx + 14 ) L 0)) ” 
  &&  “ (retval_14 = (Znth (idx + 13 ) L 0)) ” 
  &&  “ (retval_13 = (Znth (idx + 12 ) L 0)) ” 
  &&  “ (retval_12 = (Znth (idx + 11 ) L 0)) ” 
  &&  “ (retval_11 = (Znth (idx + 10 ) L 0)) ” 
  &&  “ (retval_10 = (Znth (idx + 9 ) L 0)) ” 
  &&  “ (retval_9 = (Znth (idx + 8 ) L 0)) ” 
  &&  “ (retval_8 = (Znth (idx + 7 ) L 0)) ” 
  &&  “ (retval_7 = (Znth (idx + 6 ) L 0)) ” 
  &&  “ (retval_6 = (Znth (idx + 5 ) L 0)) ” 
  &&  “ (retval_5 = (Znth (idx + 4 ) L 0)) ” 
  &&  “ (retval_4 = (Znth (idx + 3 ) L 0)) ” 
  &&  “ (retval_3 = (Znth (idx + 2 ) L 0)) ” 
  &&  “ (retval_2 = (Znth (idx + 1 ) L 0)) ” 
  &&  “ (retval = (Znth (idx + 0 ) L 0)) ”
  &&  emp
).

Definition vld1q_s8_return_wit_1_split_goal_1 := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (PreH1 : (retval_16 = (rs_read_lane (15) (16) (idx) (L)))) (PreH2 : (retval_15 = (rs_read_lane (14) (16) (idx) (L)))) (PreH3 : (retval_14 = (rs_read_lane (13) (16) (idx) (L)))) (PreH4 : (retval_13 = (rs_read_lane (12) (16) (idx) (L)))) (PreH5 : (retval_12 = (rs_read_lane (11) (16) (idx) (L)))) (PreH6 : (retval_11 = (rs_read_lane (10) (16) (idx) (L)))) (PreH7 : (retval_10 = (rs_read_lane (9) (16) (idx) (L)))) (PreH8 : (retval_9 = (rs_read_lane (8) (16) (idx) (L)))) (PreH9 : (retval_8 = (rs_read_lane (7) (16) (idx) (L)))) (PreH10 : (retval_7 = (rs_read_lane (6) (16) (idx) (L)))) (PreH11 : (retval_6 = (rs_read_lane (5) (16) (idx) (L)))) (PreH12 : (retval_5 = (rs_read_lane (4) (16) (idx) (L)))) (PreH13 : (retval_4 = (rs_read_lane (3) (16) (idx) (L)))) (PreH14 : (retval_3 = (rs_read_lane (2) (16) (idx) (L)))) (PreH15 : (retval_2 = (rs_read_lane (1) (16) (idx) (L)))) (PreH16 : (retval = (rs_read_lane (0) (16) (idx) (L)))) (PreH17 : (0 <= idx)) (PreH18 : ((idx + 16 ) <= count)) (PreH19 : (p_pre = (base + idx ))) ,
  (retval_16 = (Znth (idx + 15 ) L 0))
.

Definition vld1q_s8_return_wit_1_split_goal_2 := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (PreH1 : (retval_16 = (rs_read_lane (15) (16) (idx) (L)))) (PreH2 : (retval_15 = (rs_read_lane (14) (16) (idx) (L)))) (PreH3 : (retval_14 = (rs_read_lane (13) (16) (idx) (L)))) (PreH4 : (retval_13 = (rs_read_lane (12) (16) (idx) (L)))) (PreH5 : (retval_12 = (rs_read_lane (11) (16) (idx) (L)))) (PreH6 : (retval_11 = (rs_read_lane (10) (16) (idx) (L)))) (PreH7 : (retval_10 = (rs_read_lane (9) (16) (idx) (L)))) (PreH8 : (retval_9 = (rs_read_lane (8) (16) (idx) (L)))) (PreH9 : (retval_8 = (rs_read_lane (7) (16) (idx) (L)))) (PreH10 : (retval_7 = (rs_read_lane (6) (16) (idx) (L)))) (PreH11 : (retval_6 = (rs_read_lane (5) (16) (idx) (L)))) (PreH12 : (retval_5 = (rs_read_lane (4) (16) (idx) (L)))) (PreH13 : (retval_4 = (rs_read_lane (3) (16) (idx) (L)))) (PreH14 : (retval_3 = (rs_read_lane (2) (16) (idx) (L)))) (PreH15 : (retval_2 = (rs_read_lane (1) (16) (idx) (L)))) (PreH16 : (retval = (rs_read_lane (0) (16) (idx) (L)))) (PreH17 : (0 <= idx)) (PreH18 : ((idx + 16 ) <= count)) (PreH19 : (p_pre = (base + idx ))) ,
  (retval_15 = (Znth (idx + 14 ) L 0))
.

Definition vld1q_s8_return_wit_1_split_goal_3 := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (PreH1 : (retval_16 = (rs_read_lane (15) (16) (idx) (L)))) (PreH2 : (retval_15 = (rs_read_lane (14) (16) (idx) (L)))) (PreH3 : (retval_14 = (rs_read_lane (13) (16) (idx) (L)))) (PreH4 : (retval_13 = (rs_read_lane (12) (16) (idx) (L)))) (PreH5 : (retval_12 = (rs_read_lane (11) (16) (idx) (L)))) (PreH6 : (retval_11 = (rs_read_lane (10) (16) (idx) (L)))) (PreH7 : (retval_10 = (rs_read_lane (9) (16) (idx) (L)))) (PreH8 : (retval_9 = (rs_read_lane (8) (16) (idx) (L)))) (PreH9 : (retval_8 = (rs_read_lane (7) (16) (idx) (L)))) (PreH10 : (retval_7 = (rs_read_lane (6) (16) (idx) (L)))) (PreH11 : (retval_6 = (rs_read_lane (5) (16) (idx) (L)))) (PreH12 : (retval_5 = (rs_read_lane (4) (16) (idx) (L)))) (PreH13 : (retval_4 = (rs_read_lane (3) (16) (idx) (L)))) (PreH14 : (retval_3 = (rs_read_lane (2) (16) (idx) (L)))) (PreH15 : (retval_2 = (rs_read_lane (1) (16) (idx) (L)))) (PreH16 : (retval = (rs_read_lane (0) (16) (idx) (L)))) (PreH17 : (0 <= idx)) (PreH18 : ((idx + 16 ) <= count)) (PreH19 : (p_pre = (base + idx ))) ,
  (retval_14 = (Znth (idx + 13 ) L 0))
.

Definition vld1q_s8_return_wit_1_split_goal_4 := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (PreH1 : (retval_16 = (rs_read_lane (15) (16) (idx) (L)))) (PreH2 : (retval_15 = (rs_read_lane (14) (16) (idx) (L)))) (PreH3 : (retval_14 = (rs_read_lane (13) (16) (idx) (L)))) (PreH4 : (retval_13 = (rs_read_lane (12) (16) (idx) (L)))) (PreH5 : (retval_12 = (rs_read_lane (11) (16) (idx) (L)))) (PreH6 : (retval_11 = (rs_read_lane (10) (16) (idx) (L)))) (PreH7 : (retval_10 = (rs_read_lane (9) (16) (idx) (L)))) (PreH8 : (retval_9 = (rs_read_lane (8) (16) (idx) (L)))) (PreH9 : (retval_8 = (rs_read_lane (7) (16) (idx) (L)))) (PreH10 : (retval_7 = (rs_read_lane (6) (16) (idx) (L)))) (PreH11 : (retval_6 = (rs_read_lane (5) (16) (idx) (L)))) (PreH12 : (retval_5 = (rs_read_lane (4) (16) (idx) (L)))) (PreH13 : (retval_4 = (rs_read_lane (3) (16) (idx) (L)))) (PreH14 : (retval_3 = (rs_read_lane (2) (16) (idx) (L)))) (PreH15 : (retval_2 = (rs_read_lane (1) (16) (idx) (L)))) (PreH16 : (retval = (rs_read_lane (0) (16) (idx) (L)))) (PreH17 : (0 <= idx)) (PreH18 : ((idx + 16 ) <= count)) (PreH19 : (p_pre = (base + idx ))) ,
  (retval_13 = (Znth (idx + 12 ) L 0))
.

Definition vld1q_s8_return_wit_1_split_goal_5 := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (PreH1 : (retval_16 = (rs_read_lane (15) (16) (idx) (L)))) (PreH2 : (retval_15 = (rs_read_lane (14) (16) (idx) (L)))) (PreH3 : (retval_14 = (rs_read_lane (13) (16) (idx) (L)))) (PreH4 : (retval_13 = (rs_read_lane (12) (16) (idx) (L)))) (PreH5 : (retval_12 = (rs_read_lane (11) (16) (idx) (L)))) (PreH6 : (retval_11 = (rs_read_lane (10) (16) (idx) (L)))) (PreH7 : (retval_10 = (rs_read_lane (9) (16) (idx) (L)))) (PreH8 : (retval_9 = (rs_read_lane (8) (16) (idx) (L)))) (PreH9 : (retval_8 = (rs_read_lane (7) (16) (idx) (L)))) (PreH10 : (retval_7 = (rs_read_lane (6) (16) (idx) (L)))) (PreH11 : (retval_6 = (rs_read_lane (5) (16) (idx) (L)))) (PreH12 : (retval_5 = (rs_read_lane (4) (16) (idx) (L)))) (PreH13 : (retval_4 = (rs_read_lane (3) (16) (idx) (L)))) (PreH14 : (retval_3 = (rs_read_lane (2) (16) (idx) (L)))) (PreH15 : (retval_2 = (rs_read_lane (1) (16) (idx) (L)))) (PreH16 : (retval = (rs_read_lane (0) (16) (idx) (L)))) (PreH17 : (0 <= idx)) (PreH18 : ((idx + 16 ) <= count)) (PreH19 : (p_pre = (base + idx ))) ,
  (retval_12 = (Znth (idx + 11 ) L 0))
.

Definition vld1q_s8_return_wit_1_split_goal_6 := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (PreH1 : (retval_16 = (rs_read_lane (15) (16) (idx) (L)))) (PreH2 : (retval_15 = (rs_read_lane (14) (16) (idx) (L)))) (PreH3 : (retval_14 = (rs_read_lane (13) (16) (idx) (L)))) (PreH4 : (retval_13 = (rs_read_lane (12) (16) (idx) (L)))) (PreH5 : (retval_12 = (rs_read_lane (11) (16) (idx) (L)))) (PreH6 : (retval_11 = (rs_read_lane (10) (16) (idx) (L)))) (PreH7 : (retval_10 = (rs_read_lane (9) (16) (idx) (L)))) (PreH8 : (retval_9 = (rs_read_lane (8) (16) (idx) (L)))) (PreH9 : (retval_8 = (rs_read_lane (7) (16) (idx) (L)))) (PreH10 : (retval_7 = (rs_read_lane (6) (16) (idx) (L)))) (PreH11 : (retval_6 = (rs_read_lane (5) (16) (idx) (L)))) (PreH12 : (retval_5 = (rs_read_lane (4) (16) (idx) (L)))) (PreH13 : (retval_4 = (rs_read_lane (3) (16) (idx) (L)))) (PreH14 : (retval_3 = (rs_read_lane (2) (16) (idx) (L)))) (PreH15 : (retval_2 = (rs_read_lane (1) (16) (idx) (L)))) (PreH16 : (retval = (rs_read_lane (0) (16) (idx) (L)))) (PreH17 : (0 <= idx)) (PreH18 : ((idx + 16 ) <= count)) (PreH19 : (p_pre = (base + idx ))) ,
  (retval_11 = (Znth (idx + 10 ) L 0))
.

Definition vld1q_s8_return_wit_1_split_goal_7 := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (PreH1 : (retval_16 = (rs_read_lane (15) (16) (idx) (L)))) (PreH2 : (retval_15 = (rs_read_lane (14) (16) (idx) (L)))) (PreH3 : (retval_14 = (rs_read_lane (13) (16) (idx) (L)))) (PreH4 : (retval_13 = (rs_read_lane (12) (16) (idx) (L)))) (PreH5 : (retval_12 = (rs_read_lane (11) (16) (idx) (L)))) (PreH6 : (retval_11 = (rs_read_lane (10) (16) (idx) (L)))) (PreH7 : (retval_10 = (rs_read_lane (9) (16) (idx) (L)))) (PreH8 : (retval_9 = (rs_read_lane (8) (16) (idx) (L)))) (PreH9 : (retval_8 = (rs_read_lane (7) (16) (idx) (L)))) (PreH10 : (retval_7 = (rs_read_lane (6) (16) (idx) (L)))) (PreH11 : (retval_6 = (rs_read_lane (5) (16) (idx) (L)))) (PreH12 : (retval_5 = (rs_read_lane (4) (16) (idx) (L)))) (PreH13 : (retval_4 = (rs_read_lane (3) (16) (idx) (L)))) (PreH14 : (retval_3 = (rs_read_lane (2) (16) (idx) (L)))) (PreH15 : (retval_2 = (rs_read_lane (1) (16) (idx) (L)))) (PreH16 : (retval = (rs_read_lane (0) (16) (idx) (L)))) (PreH17 : (0 <= idx)) (PreH18 : ((idx + 16 ) <= count)) (PreH19 : (p_pre = (base + idx ))) ,
  (retval_10 = (Znth (idx + 9 ) L 0))
.

Definition vld1q_s8_return_wit_1_split_goal_8 := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (PreH1 : (retval_16 = (rs_read_lane (15) (16) (idx) (L)))) (PreH2 : (retval_15 = (rs_read_lane (14) (16) (idx) (L)))) (PreH3 : (retval_14 = (rs_read_lane (13) (16) (idx) (L)))) (PreH4 : (retval_13 = (rs_read_lane (12) (16) (idx) (L)))) (PreH5 : (retval_12 = (rs_read_lane (11) (16) (idx) (L)))) (PreH6 : (retval_11 = (rs_read_lane (10) (16) (idx) (L)))) (PreH7 : (retval_10 = (rs_read_lane (9) (16) (idx) (L)))) (PreH8 : (retval_9 = (rs_read_lane (8) (16) (idx) (L)))) (PreH9 : (retval_8 = (rs_read_lane (7) (16) (idx) (L)))) (PreH10 : (retval_7 = (rs_read_lane (6) (16) (idx) (L)))) (PreH11 : (retval_6 = (rs_read_lane (5) (16) (idx) (L)))) (PreH12 : (retval_5 = (rs_read_lane (4) (16) (idx) (L)))) (PreH13 : (retval_4 = (rs_read_lane (3) (16) (idx) (L)))) (PreH14 : (retval_3 = (rs_read_lane (2) (16) (idx) (L)))) (PreH15 : (retval_2 = (rs_read_lane (1) (16) (idx) (L)))) (PreH16 : (retval = (rs_read_lane (0) (16) (idx) (L)))) (PreH17 : (0 <= idx)) (PreH18 : ((idx + 16 ) <= count)) (PreH19 : (p_pre = (base + idx ))) ,
  (retval_9 = (Znth (idx + 8 ) L 0))
.

Definition vld1q_s8_return_wit_1_split_goal_9 := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (PreH1 : (retval_16 = (rs_read_lane (15) (16) (idx) (L)))) (PreH2 : (retval_15 = (rs_read_lane (14) (16) (idx) (L)))) (PreH3 : (retval_14 = (rs_read_lane (13) (16) (idx) (L)))) (PreH4 : (retval_13 = (rs_read_lane (12) (16) (idx) (L)))) (PreH5 : (retval_12 = (rs_read_lane (11) (16) (idx) (L)))) (PreH6 : (retval_11 = (rs_read_lane (10) (16) (idx) (L)))) (PreH7 : (retval_10 = (rs_read_lane (9) (16) (idx) (L)))) (PreH8 : (retval_9 = (rs_read_lane (8) (16) (idx) (L)))) (PreH9 : (retval_8 = (rs_read_lane (7) (16) (idx) (L)))) (PreH10 : (retval_7 = (rs_read_lane (6) (16) (idx) (L)))) (PreH11 : (retval_6 = (rs_read_lane (5) (16) (idx) (L)))) (PreH12 : (retval_5 = (rs_read_lane (4) (16) (idx) (L)))) (PreH13 : (retval_4 = (rs_read_lane (3) (16) (idx) (L)))) (PreH14 : (retval_3 = (rs_read_lane (2) (16) (idx) (L)))) (PreH15 : (retval_2 = (rs_read_lane (1) (16) (idx) (L)))) (PreH16 : (retval = (rs_read_lane (0) (16) (idx) (L)))) (PreH17 : (0 <= idx)) (PreH18 : ((idx + 16 ) <= count)) (PreH19 : (p_pre = (base + idx ))) ,
  (retval_8 = (Znth (idx + 7 ) L 0))
.

Definition vld1q_s8_return_wit_1_split_goal_10 := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (PreH1 : (retval_16 = (rs_read_lane (15) (16) (idx) (L)))) (PreH2 : (retval_15 = (rs_read_lane (14) (16) (idx) (L)))) (PreH3 : (retval_14 = (rs_read_lane (13) (16) (idx) (L)))) (PreH4 : (retval_13 = (rs_read_lane (12) (16) (idx) (L)))) (PreH5 : (retval_12 = (rs_read_lane (11) (16) (idx) (L)))) (PreH6 : (retval_11 = (rs_read_lane (10) (16) (idx) (L)))) (PreH7 : (retval_10 = (rs_read_lane (9) (16) (idx) (L)))) (PreH8 : (retval_9 = (rs_read_lane (8) (16) (idx) (L)))) (PreH9 : (retval_8 = (rs_read_lane (7) (16) (idx) (L)))) (PreH10 : (retval_7 = (rs_read_lane (6) (16) (idx) (L)))) (PreH11 : (retval_6 = (rs_read_lane (5) (16) (idx) (L)))) (PreH12 : (retval_5 = (rs_read_lane (4) (16) (idx) (L)))) (PreH13 : (retval_4 = (rs_read_lane (3) (16) (idx) (L)))) (PreH14 : (retval_3 = (rs_read_lane (2) (16) (idx) (L)))) (PreH15 : (retval_2 = (rs_read_lane (1) (16) (idx) (L)))) (PreH16 : (retval = (rs_read_lane (0) (16) (idx) (L)))) (PreH17 : (0 <= idx)) (PreH18 : ((idx + 16 ) <= count)) (PreH19 : (p_pre = (base + idx ))) ,
  (retval_7 = (Znth (idx + 6 ) L 0))
.

Definition vld1q_s8_return_wit_1_split_goal_11 := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (PreH1 : (retval_16 = (rs_read_lane (15) (16) (idx) (L)))) (PreH2 : (retval_15 = (rs_read_lane (14) (16) (idx) (L)))) (PreH3 : (retval_14 = (rs_read_lane (13) (16) (idx) (L)))) (PreH4 : (retval_13 = (rs_read_lane (12) (16) (idx) (L)))) (PreH5 : (retval_12 = (rs_read_lane (11) (16) (idx) (L)))) (PreH6 : (retval_11 = (rs_read_lane (10) (16) (idx) (L)))) (PreH7 : (retval_10 = (rs_read_lane (9) (16) (idx) (L)))) (PreH8 : (retval_9 = (rs_read_lane (8) (16) (idx) (L)))) (PreH9 : (retval_8 = (rs_read_lane (7) (16) (idx) (L)))) (PreH10 : (retval_7 = (rs_read_lane (6) (16) (idx) (L)))) (PreH11 : (retval_6 = (rs_read_lane (5) (16) (idx) (L)))) (PreH12 : (retval_5 = (rs_read_lane (4) (16) (idx) (L)))) (PreH13 : (retval_4 = (rs_read_lane (3) (16) (idx) (L)))) (PreH14 : (retval_3 = (rs_read_lane (2) (16) (idx) (L)))) (PreH15 : (retval_2 = (rs_read_lane (1) (16) (idx) (L)))) (PreH16 : (retval = (rs_read_lane (0) (16) (idx) (L)))) (PreH17 : (0 <= idx)) (PreH18 : ((idx + 16 ) <= count)) (PreH19 : (p_pre = (base + idx ))) ,
  (retval_6 = (Znth (idx + 5 ) L 0))
.

Definition vld1q_s8_return_wit_1_split_goal_12 := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (PreH1 : (retval_16 = (rs_read_lane (15) (16) (idx) (L)))) (PreH2 : (retval_15 = (rs_read_lane (14) (16) (idx) (L)))) (PreH3 : (retval_14 = (rs_read_lane (13) (16) (idx) (L)))) (PreH4 : (retval_13 = (rs_read_lane (12) (16) (idx) (L)))) (PreH5 : (retval_12 = (rs_read_lane (11) (16) (idx) (L)))) (PreH6 : (retval_11 = (rs_read_lane (10) (16) (idx) (L)))) (PreH7 : (retval_10 = (rs_read_lane (9) (16) (idx) (L)))) (PreH8 : (retval_9 = (rs_read_lane (8) (16) (idx) (L)))) (PreH9 : (retval_8 = (rs_read_lane (7) (16) (idx) (L)))) (PreH10 : (retval_7 = (rs_read_lane (6) (16) (idx) (L)))) (PreH11 : (retval_6 = (rs_read_lane (5) (16) (idx) (L)))) (PreH12 : (retval_5 = (rs_read_lane (4) (16) (idx) (L)))) (PreH13 : (retval_4 = (rs_read_lane (3) (16) (idx) (L)))) (PreH14 : (retval_3 = (rs_read_lane (2) (16) (idx) (L)))) (PreH15 : (retval_2 = (rs_read_lane (1) (16) (idx) (L)))) (PreH16 : (retval = (rs_read_lane (0) (16) (idx) (L)))) (PreH17 : (0 <= idx)) (PreH18 : ((idx + 16 ) <= count)) (PreH19 : (p_pre = (base + idx ))) ,
  (retval_5 = (Znth (idx + 4 ) L 0))
.

Definition vld1q_s8_return_wit_1_split_goal_13 := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (PreH1 : (retval_16 = (rs_read_lane (15) (16) (idx) (L)))) (PreH2 : (retval_15 = (rs_read_lane (14) (16) (idx) (L)))) (PreH3 : (retval_14 = (rs_read_lane (13) (16) (idx) (L)))) (PreH4 : (retval_13 = (rs_read_lane (12) (16) (idx) (L)))) (PreH5 : (retval_12 = (rs_read_lane (11) (16) (idx) (L)))) (PreH6 : (retval_11 = (rs_read_lane (10) (16) (idx) (L)))) (PreH7 : (retval_10 = (rs_read_lane (9) (16) (idx) (L)))) (PreH8 : (retval_9 = (rs_read_lane (8) (16) (idx) (L)))) (PreH9 : (retval_8 = (rs_read_lane (7) (16) (idx) (L)))) (PreH10 : (retval_7 = (rs_read_lane (6) (16) (idx) (L)))) (PreH11 : (retval_6 = (rs_read_lane (5) (16) (idx) (L)))) (PreH12 : (retval_5 = (rs_read_lane (4) (16) (idx) (L)))) (PreH13 : (retval_4 = (rs_read_lane (3) (16) (idx) (L)))) (PreH14 : (retval_3 = (rs_read_lane (2) (16) (idx) (L)))) (PreH15 : (retval_2 = (rs_read_lane (1) (16) (idx) (L)))) (PreH16 : (retval = (rs_read_lane (0) (16) (idx) (L)))) (PreH17 : (0 <= idx)) (PreH18 : ((idx + 16 ) <= count)) (PreH19 : (p_pre = (base + idx ))) ,
  (retval_4 = (Znth (idx + 3 ) L 0))
.

Definition vld1q_s8_return_wit_1_split_goal_14 := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (PreH1 : (retval_16 = (rs_read_lane (15) (16) (idx) (L)))) (PreH2 : (retval_15 = (rs_read_lane (14) (16) (idx) (L)))) (PreH3 : (retval_14 = (rs_read_lane (13) (16) (idx) (L)))) (PreH4 : (retval_13 = (rs_read_lane (12) (16) (idx) (L)))) (PreH5 : (retval_12 = (rs_read_lane (11) (16) (idx) (L)))) (PreH6 : (retval_11 = (rs_read_lane (10) (16) (idx) (L)))) (PreH7 : (retval_10 = (rs_read_lane (9) (16) (idx) (L)))) (PreH8 : (retval_9 = (rs_read_lane (8) (16) (idx) (L)))) (PreH9 : (retval_8 = (rs_read_lane (7) (16) (idx) (L)))) (PreH10 : (retval_7 = (rs_read_lane (6) (16) (idx) (L)))) (PreH11 : (retval_6 = (rs_read_lane (5) (16) (idx) (L)))) (PreH12 : (retval_5 = (rs_read_lane (4) (16) (idx) (L)))) (PreH13 : (retval_4 = (rs_read_lane (3) (16) (idx) (L)))) (PreH14 : (retval_3 = (rs_read_lane (2) (16) (idx) (L)))) (PreH15 : (retval_2 = (rs_read_lane (1) (16) (idx) (L)))) (PreH16 : (retval = (rs_read_lane (0) (16) (idx) (L)))) (PreH17 : (0 <= idx)) (PreH18 : ((idx + 16 ) <= count)) (PreH19 : (p_pre = (base + idx ))) ,
  (retval_3 = (Znth (idx + 2 ) L 0))
.

Definition vld1q_s8_return_wit_1_split_goal_15 := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (PreH1 : (retval_16 = (rs_read_lane (15) (16) (idx) (L)))) (PreH2 : (retval_15 = (rs_read_lane (14) (16) (idx) (L)))) (PreH3 : (retval_14 = (rs_read_lane (13) (16) (idx) (L)))) (PreH4 : (retval_13 = (rs_read_lane (12) (16) (idx) (L)))) (PreH5 : (retval_12 = (rs_read_lane (11) (16) (idx) (L)))) (PreH6 : (retval_11 = (rs_read_lane (10) (16) (idx) (L)))) (PreH7 : (retval_10 = (rs_read_lane (9) (16) (idx) (L)))) (PreH8 : (retval_9 = (rs_read_lane (8) (16) (idx) (L)))) (PreH9 : (retval_8 = (rs_read_lane (7) (16) (idx) (L)))) (PreH10 : (retval_7 = (rs_read_lane (6) (16) (idx) (L)))) (PreH11 : (retval_6 = (rs_read_lane (5) (16) (idx) (L)))) (PreH12 : (retval_5 = (rs_read_lane (4) (16) (idx) (L)))) (PreH13 : (retval_4 = (rs_read_lane (3) (16) (idx) (L)))) (PreH14 : (retval_3 = (rs_read_lane (2) (16) (idx) (L)))) (PreH15 : (retval_2 = (rs_read_lane (1) (16) (idx) (L)))) (PreH16 : (retval = (rs_read_lane (0) (16) (idx) (L)))) (PreH17 : (0 <= idx)) (PreH18 : ((idx + 16 ) <= count)) (PreH19 : (p_pre = (base + idx ))) ,
  (retval_2 = (Znth (idx + 1 ) L 0))
.

Definition vld1q_s8_return_wit_1_split_goal_16 := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (PreH1 : (retval_16 = (rs_read_lane (15) (16) (idx) (L)))) (PreH2 : (retval_15 = (rs_read_lane (14) (16) (idx) (L)))) (PreH3 : (retval_14 = (rs_read_lane (13) (16) (idx) (L)))) (PreH4 : (retval_13 = (rs_read_lane (12) (16) (idx) (L)))) (PreH5 : (retval_12 = (rs_read_lane (11) (16) (idx) (L)))) (PreH6 : (retval_11 = (rs_read_lane (10) (16) (idx) (L)))) (PreH7 : (retval_10 = (rs_read_lane (9) (16) (idx) (L)))) (PreH8 : (retval_9 = (rs_read_lane (8) (16) (idx) (L)))) (PreH9 : (retval_8 = (rs_read_lane (7) (16) (idx) (L)))) (PreH10 : (retval_7 = (rs_read_lane (6) (16) (idx) (L)))) (PreH11 : (retval_6 = (rs_read_lane (5) (16) (idx) (L)))) (PreH12 : (retval_5 = (rs_read_lane (4) (16) (idx) (L)))) (PreH13 : (retval_4 = (rs_read_lane (3) (16) (idx) (L)))) (PreH14 : (retval_3 = (rs_read_lane (2) (16) (idx) (L)))) (PreH15 : (retval_2 = (rs_read_lane (1) (16) (idx) (L)))) (PreH16 : (retval = (rs_read_lane (0) (16) (idx) (L)))) (PreH17 : (0 <= idx)) (PreH18 : ((idx + 16 ) <= count)) (PreH19 : (p_pre = (base + idx ))) ,
  (retval = (Znth (idx + 0 ) L 0))
.

Definition vld1q_s8_partial_solve_wit_1_pure := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (PreH1 : (0 <= idx)) (PreH2 : ((idx + 16 ) <= count)) (PreH3 : (p_pre = (base + idx ))) ,
  (UndefStructPredint8x16_t ( &( "r" ) ) )
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  (CharArray.full base count L )
|--
  “ (0 <= 0) ” 
  &&  “ (0 < 128) ” 
  &&  “ (0 <= 16) ” 
  &&  “ (16 <= 128) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + 16 ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
.

Definition vld1q_s8_partial_solve_wit_1_aux := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (PreH1 : (0 <= idx)) (PreH2 : ((idx + 16 ) <= count)) (PreH3 : (p_pre = (base + idx ))) ,
  (UndefStructPredint8x16_t ( &( "r" ) ) )
  **  (CharArray.full base count L )
|--
  “ (0 <= 0) ” 
  &&  “ (0 < 128) ” 
  &&  “ (0 <= 16) ” 
  &&  “ (16 <= 128) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + 16 ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + 16 ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
  &&  (CharArray.full base count L )
  **  (UndefStructPredint8x16_t ( &( "r" ) ) )
.

Definition vld1q_s8_partial_solve_wit_1 := vld1q_s8_partial_solve_wit_1_pure -> vld1q_s8_partial_solve_wit_1_aux.

Definition vld1q_s8_partial_solve_wit_2_pure := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (PreH1 : (retval = (rs_read_lane (0) (16) (idx) (L)))) (PreH2 : (0 <= idx)) (PreH3 : ((idx + 16 ) <= count)) (PreH4 : (p_pre = (base + idx ))) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
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
  &&  “ (1 < 128) ” 
  &&  “ (0 <= 16) ” 
  &&  “ (16 <= 128) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + 16 ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
.

Definition vld1q_s8_partial_solve_wit_2_aux := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (PreH1 : (retval = (rs_read_lane (0) (16) (idx) (L)))) (PreH2 : (0 <= idx)) (PreH3 : ((idx + 16 ) <= count)) (PreH4 : (p_pre = (base + idx ))) ,
  ((&(( &( "r" ) )->ₛ "s15")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
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
  &&  “ (1 < 128) ” 
  &&  “ (0 <= 16) ” 
  &&  “ (16 <= 128) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + 16 ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ” 
  &&  “ (retval = (rs_read_lane (0) (16) (idx) (L))) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + 16 ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
  &&  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
.

Definition vld1q_s8_partial_solve_wit_2 := vld1q_s8_partial_solve_wit_2_pure -> vld1q_s8_partial_solve_wit_2_aux.

Definition vld1q_s8_partial_solve_wit_3_pure := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (rs_read_lane (1) (16) (idx) (L)))) (PreH2 : (retval = (rs_read_lane (0) (16) (idx) (L)))) (PreH3 : (0 <= idx)) (PreH4 : ((idx + 16 ) <= count)) (PreH5 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Char  |->_)
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
  &&  “ (2 < 128) ” 
  &&  “ (0 <= 16) ” 
  &&  “ (16 <= 128) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + 16 ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
.

Definition vld1q_s8_partial_solve_wit_3_aux := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (rs_read_lane (1) (16) (idx) (L)))) (PreH2 : (retval = (rs_read_lane (0) (16) (idx) (L)))) (PreH3 : (0 <= idx)) (PreH4 : ((idx + 16 ) <= count)) (PreH5 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Char  |->_)
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
  &&  “ (2 < 128) ” 
  &&  “ (0 <= 16) ” 
  &&  “ (16 <= 128) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + 16 ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ” 
  &&  “ (retval_2 = (rs_read_lane (1) (16) (idx) (L))) ” 
  &&  “ (retval = (rs_read_lane (0) (16) (idx) (L))) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + 16 ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
  &&  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
.

Definition vld1q_s8_partial_solve_wit_3 := vld1q_s8_partial_solve_wit_3_pure -> vld1q_s8_partial_solve_wit_3_aux.

Definition vld1q_s8_partial_solve_wit_4_pure := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = (rs_read_lane (2) (16) (idx) (L)))) (PreH2 : (retval_2 = (rs_read_lane (1) (16) (idx) (L)))) (PreH3 : (retval = (rs_read_lane (0) (16) (idx) (L)))) (PreH4 : (0 <= idx)) (PreH5 : ((idx + 16 ) <= count)) (PreH6 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Char  |->_)
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
  &&  “ (3 < 128) ” 
  &&  “ (0 <= 16) ” 
  &&  “ (16 <= 128) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + 16 ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
.

Definition vld1q_s8_partial_solve_wit_4_aux := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = (rs_read_lane (2) (16) (idx) (L)))) (PreH2 : (retval_2 = (rs_read_lane (1) (16) (idx) (L)))) (PreH3 : (retval = (rs_read_lane (0) (16) (idx) (L)))) (PreH4 : (0 <= idx)) (PreH5 : ((idx + 16 ) <= count)) (PreH6 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Char  |->_)
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
  &&  “ (3 < 128) ” 
  &&  “ (0 <= 16) ” 
  &&  “ (16 <= 128) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + 16 ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ” 
  &&  “ (retval_3 = (rs_read_lane (2) (16) (idx) (L))) ” 
  &&  “ (retval_2 = (rs_read_lane (1) (16) (idx) (L))) ” 
  &&  “ (retval = (rs_read_lane (0) (16) (idx) (L))) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + 16 ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
  &&  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
.

Definition vld1q_s8_partial_solve_wit_4 := vld1q_s8_partial_solve_wit_4_pure -> vld1q_s8_partial_solve_wit_4_aux.

Definition vld1q_s8_partial_solve_wit_5_pure := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_4 = (rs_read_lane (3) (16) (idx) (L)))) (PreH2 : (retval_3 = (rs_read_lane (2) (16) (idx) (L)))) (PreH3 : (retval_2 = (rs_read_lane (1) (16) (idx) (L)))) (PreH4 : (retval = (rs_read_lane (0) (16) (idx) (L)))) (PreH5 : (0 <= idx)) (PreH6 : ((idx + 16 ) <= count)) (PreH7 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Char  |->_)
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
  &&  “ (4 < 128) ” 
  &&  “ (0 <= 16) ” 
  &&  “ (16 <= 128) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + 16 ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
.

Definition vld1q_s8_partial_solve_wit_5_aux := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_4 = (rs_read_lane (3) (16) (idx) (L)))) (PreH2 : (retval_3 = (rs_read_lane (2) (16) (idx) (L)))) (PreH3 : (retval_2 = (rs_read_lane (1) (16) (idx) (L)))) (PreH4 : (retval = (rs_read_lane (0) (16) (idx) (L)))) (PreH5 : (0 <= idx)) (PreH6 : ((idx + 16 ) <= count)) (PreH7 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Char  |->_)
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
  &&  “ (4 < 128) ” 
  &&  “ (0 <= 16) ” 
  &&  “ (16 <= 128) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + 16 ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ” 
  &&  “ (retval_4 = (rs_read_lane (3) (16) (idx) (L))) ” 
  &&  “ (retval_3 = (rs_read_lane (2) (16) (idx) (L))) ” 
  &&  “ (retval_2 = (rs_read_lane (1) (16) (idx) (L))) ” 
  &&  “ (retval = (rs_read_lane (0) (16) (idx) (L))) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + 16 ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
  &&  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
.

Definition vld1q_s8_partial_solve_wit_5 := vld1q_s8_partial_solve_wit_5_pure -> vld1q_s8_partial_solve_wit_5_aux.

Definition vld1q_s8_partial_solve_wit_6_pure := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (PreH1 : (retval_5 = (rs_read_lane (4) (16) (idx) (L)))) (PreH2 : (retval_4 = (rs_read_lane (3) (16) (idx) (L)))) (PreH3 : (retval_3 = (rs_read_lane (2) (16) (idx) (L)))) (PreH4 : (retval_2 = (rs_read_lane (1) (16) (idx) (L)))) (PreH5 : (retval = (rs_read_lane (0) (16) (idx) (L)))) (PreH6 : (0 <= idx)) (PreH7 : ((idx + 16 ) <= count)) (PreH8 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Char  |->_)
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
  &&  “ (5 < 128) ” 
  &&  “ (0 <= 16) ” 
  &&  “ (16 <= 128) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + 16 ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
.

Definition vld1q_s8_partial_solve_wit_6_aux := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (PreH1 : (retval_5 = (rs_read_lane (4) (16) (idx) (L)))) (PreH2 : (retval_4 = (rs_read_lane (3) (16) (idx) (L)))) (PreH3 : (retval_3 = (rs_read_lane (2) (16) (idx) (L)))) (PreH4 : (retval_2 = (rs_read_lane (1) (16) (idx) (L)))) (PreH5 : (retval = (rs_read_lane (0) (16) (idx) (L)))) (PreH6 : (0 <= idx)) (PreH7 : ((idx + 16 ) <= count)) (PreH8 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Char  |->_)
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
  &&  “ (5 < 128) ” 
  &&  “ (0 <= 16) ” 
  &&  “ (16 <= 128) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + 16 ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ” 
  &&  “ (retval_5 = (rs_read_lane (4) (16) (idx) (L))) ” 
  &&  “ (retval_4 = (rs_read_lane (3) (16) (idx) (L))) ” 
  &&  “ (retval_3 = (rs_read_lane (2) (16) (idx) (L))) ” 
  &&  “ (retval_2 = (rs_read_lane (1) (16) (idx) (L))) ” 
  &&  “ (retval = (rs_read_lane (0) (16) (idx) (L))) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + 16 ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
  &&  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
.

Definition vld1q_s8_partial_solve_wit_6 := vld1q_s8_partial_solve_wit_6_pure -> vld1q_s8_partial_solve_wit_6_aux.

Definition vld1q_s8_partial_solve_wit_7_pure := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (PreH1 : (retval_6 = (rs_read_lane (5) (16) (idx) (L)))) (PreH2 : (retval_5 = (rs_read_lane (4) (16) (idx) (L)))) (PreH3 : (retval_4 = (rs_read_lane (3) (16) (idx) (L)))) (PreH4 : (retval_3 = (rs_read_lane (2) (16) (idx) (L)))) (PreH5 : (retval_2 = (rs_read_lane (1) (16) (idx) (L)))) (PreH6 : (retval = (rs_read_lane (0) (16) (idx) (L)))) (PreH7 : (0 <= idx)) (PreH8 : ((idx + 16 ) <= count)) (PreH9 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Char  |->_)
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
  &&  “ (6 < 128) ” 
  &&  “ (0 <= 16) ” 
  &&  “ (16 <= 128) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + 16 ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
.

Definition vld1q_s8_partial_solve_wit_7_aux := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (PreH1 : (retval_6 = (rs_read_lane (5) (16) (idx) (L)))) (PreH2 : (retval_5 = (rs_read_lane (4) (16) (idx) (L)))) (PreH3 : (retval_4 = (rs_read_lane (3) (16) (idx) (L)))) (PreH4 : (retval_3 = (rs_read_lane (2) (16) (idx) (L)))) (PreH5 : (retval_2 = (rs_read_lane (1) (16) (idx) (L)))) (PreH6 : (retval = (rs_read_lane (0) (16) (idx) (L)))) (PreH7 : (0 <= idx)) (PreH8 : ((idx + 16 ) <= count)) (PreH9 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Char  |->_)
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
  &&  “ (6 < 128) ” 
  &&  “ (0 <= 16) ” 
  &&  “ (16 <= 128) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + 16 ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ” 
  &&  “ (retval_6 = (rs_read_lane (5) (16) (idx) (L))) ” 
  &&  “ (retval_5 = (rs_read_lane (4) (16) (idx) (L))) ” 
  &&  “ (retval_4 = (rs_read_lane (3) (16) (idx) (L))) ” 
  &&  “ (retval_3 = (rs_read_lane (2) (16) (idx) (L))) ” 
  &&  “ (retval_2 = (rs_read_lane (1) (16) (idx) (L))) ” 
  &&  “ (retval = (rs_read_lane (0) (16) (idx) (L))) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + 16 ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
  &&  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
.

Definition vld1q_s8_partial_solve_wit_7 := vld1q_s8_partial_solve_wit_7_pure -> vld1q_s8_partial_solve_wit_7_aux.

Definition vld1q_s8_partial_solve_wit_8_pure := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (PreH1 : (retval_7 = (rs_read_lane (6) (16) (idx) (L)))) (PreH2 : (retval_6 = (rs_read_lane (5) (16) (idx) (L)))) (PreH3 : (retval_5 = (rs_read_lane (4) (16) (idx) (L)))) (PreH4 : (retval_4 = (rs_read_lane (3) (16) (idx) (L)))) (PreH5 : (retval_3 = (rs_read_lane (2) (16) (idx) (L)))) (PreH6 : (retval_2 = (rs_read_lane (1) (16) (idx) (L)))) (PreH7 : (retval = (rs_read_lane (0) (16) (idx) (L)))) (PreH8 : (0 <= idx)) (PreH9 : ((idx + 16 ) <= count)) (PreH10 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Char  |->_)
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
  &&  “ (7 < 128) ” 
  &&  “ (0 <= 16) ” 
  &&  “ (16 <= 128) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + 16 ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
.

Definition vld1q_s8_partial_solve_wit_8_aux := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (PreH1 : (retval_7 = (rs_read_lane (6) (16) (idx) (L)))) (PreH2 : (retval_6 = (rs_read_lane (5) (16) (idx) (L)))) (PreH3 : (retval_5 = (rs_read_lane (4) (16) (idx) (L)))) (PreH4 : (retval_4 = (rs_read_lane (3) (16) (idx) (L)))) (PreH5 : (retval_3 = (rs_read_lane (2) (16) (idx) (L)))) (PreH6 : (retval_2 = (rs_read_lane (1) (16) (idx) (L)))) (PreH7 : (retval = (rs_read_lane (0) (16) (idx) (L)))) (PreH8 : (0 <= idx)) (PreH9 : ((idx + 16 ) <= count)) (PreH10 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Char  |->_)
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
  &&  “ (7 < 128) ” 
  &&  “ (0 <= 16) ” 
  &&  “ (16 <= 128) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + 16 ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ” 
  &&  “ (retval_7 = (rs_read_lane (6) (16) (idx) (L))) ” 
  &&  “ (retval_6 = (rs_read_lane (5) (16) (idx) (L))) ” 
  &&  “ (retval_5 = (rs_read_lane (4) (16) (idx) (L))) ” 
  &&  “ (retval_4 = (rs_read_lane (3) (16) (idx) (L))) ” 
  &&  “ (retval_3 = (rs_read_lane (2) (16) (idx) (L))) ” 
  &&  “ (retval_2 = (rs_read_lane (1) (16) (idx) (L))) ” 
  &&  “ (retval = (rs_read_lane (0) (16) (idx) (L))) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + 16 ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
  &&  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
.

Definition vld1q_s8_partial_solve_wit_8 := vld1q_s8_partial_solve_wit_8_pure -> vld1q_s8_partial_solve_wit_8_aux.

Definition vld1q_s8_partial_solve_wit_9_pure := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (PreH1 : (retval_8 = (rs_read_lane (7) (16) (idx) (L)))) (PreH2 : (retval_7 = (rs_read_lane (6) (16) (idx) (L)))) (PreH3 : (retval_6 = (rs_read_lane (5) (16) (idx) (L)))) (PreH4 : (retval_5 = (rs_read_lane (4) (16) (idx) (L)))) (PreH5 : (retval_4 = (rs_read_lane (3) (16) (idx) (L)))) (PreH6 : (retval_3 = (rs_read_lane (2) (16) (idx) (L)))) (PreH7 : (retval_2 = (rs_read_lane (1) (16) (idx) (L)))) (PreH8 : (retval = (rs_read_lane (0) (16) (idx) (L)))) (PreH9 : (0 <= idx)) (PreH10 : ((idx + 16 ) <= count)) (PreH11 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (0 <= 8) ” 
  &&  “ (8 < 128) ” 
  &&  “ (0 <= 16) ” 
  &&  “ (16 <= 128) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + 16 ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
.

Definition vld1q_s8_partial_solve_wit_9_aux := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (PreH1 : (retval_8 = (rs_read_lane (7) (16) (idx) (L)))) (PreH2 : (retval_7 = (rs_read_lane (6) (16) (idx) (L)))) (PreH3 : (retval_6 = (rs_read_lane (5) (16) (idx) (L)))) (PreH4 : (retval_5 = (rs_read_lane (4) (16) (idx) (L)))) (PreH5 : (retval_4 = (rs_read_lane (3) (16) (idx) (L)))) (PreH6 : (retval_3 = (rs_read_lane (2) (16) (idx) (L)))) (PreH7 : (retval_2 = (rs_read_lane (1) (16) (idx) (L)))) (PreH8 : (retval = (rs_read_lane (0) (16) (idx) (L)))) (PreH9 : (0 <= idx)) (PreH10 : ((idx + 16 ) <= count)) (PreH11 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
|--
  “ (0 <= 8) ” 
  &&  “ (8 < 128) ” 
  &&  “ (0 <= 16) ” 
  &&  “ (16 <= 128) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + 16 ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ” 
  &&  “ (retval_8 = (rs_read_lane (7) (16) (idx) (L))) ” 
  &&  “ (retval_7 = (rs_read_lane (6) (16) (idx) (L))) ” 
  &&  “ (retval_6 = (rs_read_lane (5) (16) (idx) (L))) ” 
  &&  “ (retval_5 = (rs_read_lane (4) (16) (idx) (L))) ” 
  &&  “ (retval_4 = (rs_read_lane (3) (16) (idx) (L))) ” 
  &&  “ (retval_3 = (rs_read_lane (2) (16) (idx) (L))) ” 
  &&  “ (retval_2 = (rs_read_lane (1) (16) (idx) (L))) ” 
  &&  “ (retval = (rs_read_lane (0) (16) (idx) (L))) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + 16 ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
  &&  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
.

Definition vld1q_s8_partial_solve_wit_9 := vld1q_s8_partial_solve_wit_9_pure -> vld1q_s8_partial_solve_wit_9_aux.

Definition vld1q_s8_partial_solve_wit_10_pure := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (PreH1 : (retval_9 = (rs_read_lane (8) (16) (idx) (L)))) (PreH2 : (retval_8 = (rs_read_lane (7) (16) (idx) (L)))) (PreH3 : (retval_7 = (rs_read_lane (6) (16) (idx) (L)))) (PreH4 : (retval_6 = (rs_read_lane (5) (16) (idx) (L)))) (PreH5 : (retval_5 = (rs_read_lane (4) (16) (idx) (L)))) (PreH6 : (retval_4 = (rs_read_lane (3) (16) (idx) (L)))) (PreH7 : (retval_3 = (rs_read_lane (2) (16) (idx) (L)))) (PreH8 : (retval_2 = (rs_read_lane (1) (16) (idx) (L)))) (PreH9 : (retval = (rs_read_lane (0) (16) (idx) (L)))) (PreH10 : (0 <= idx)) (PreH11 : ((idx + 16 ) <= count)) (PreH12 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Char  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (0 <= 9) ” 
  &&  “ (9 < 128) ” 
  &&  “ (0 <= 16) ” 
  &&  “ (16 <= 128) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + 16 ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
.

Definition vld1q_s8_partial_solve_wit_10_aux := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (PreH1 : (retval_9 = (rs_read_lane (8) (16) (idx) (L)))) (PreH2 : (retval_8 = (rs_read_lane (7) (16) (idx) (L)))) (PreH3 : (retval_7 = (rs_read_lane (6) (16) (idx) (L)))) (PreH4 : (retval_6 = (rs_read_lane (5) (16) (idx) (L)))) (PreH5 : (retval_5 = (rs_read_lane (4) (16) (idx) (L)))) (PreH6 : (retval_4 = (rs_read_lane (3) (16) (idx) (L)))) (PreH7 : (retval_3 = (rs_read_lane (2) (16) (idx) (L)))) (PreH8 : (retval_2 = (rs_read_lane (1) (16) (idx) (L)))) (PreH9 : (retval = (rs_read_lane (0) (16) (idx) (L)))) (PreH10 : (0 <= idx)) (PreH11 : ((idx + 16 ) <= count)) (PreH12 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Char  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
|--
  “ (0 <= 9) ” 
  &&  “ (9 < 128) ” 
  &&  “ (0 <= 16) ” 
  &&  “ (16 <= 128) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + 16 ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ” 
  &&  “ (retval_9 = (rs_read_lane (8) (16) (idx) (L))) ” 
  &&  “ (retval_8 = (rs_read_lane (7) (16) (idx) (L))) ” 
  &&  “ (retval_7 = (rs_read_lane (6) (16) (idx) (L))) ” 
  &&  “ (retval_6 = (rs_read_lane (5) (16) (idx) (L))) ” 
  &&  “ (retval_5 = (rs_read_lane (4) (16) (idx) (L))) ” 
  &&  “ (retval_4 = (rs_read_lane (3) (16) (idx) (L))) ” 
  &&  “ (retval_3 = (rs_read_lane (2) (16) (idx) (L))) ” 
  &&  “ (retval_2 = (rs_read_lane (1) (16) (idx) (L))) ” 
  &&  “ (retval = (rs_read_lane (0) (16) (idx) (L))) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + 16 ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
  &&  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Char  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
.

Definition vld1q_s8_partial_solve_wit_10 := vld1q_s8_partial_solve_wit_10_pure -> vld1q_s8_partial_solve_wit_10_aux.

Definition vld1q_s8_partial_solve_wit_11_pure := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (PreH1 : (retval_10 = (rs_read_lane (9) (16) (idx) (L)))) (PreH2 : (retval_9 = (rs_read_lane (8) (16) (idx) (L)))) (PreH3 : (retval_8 = (rs_read_lane (7) (16) (idx) (L)))) (PreH4 : (retval_7 = (rs_read_lane (6) (16) (idx) (L)))) (PreH5 : (retval_6 = (rs_read_lane (5) (16) (idx) (L)))) (PreH6 : (retval_5 = (rs_read_lane (4) (16) (idx) (L)))) (PreH7 : (retval_4 = (rs_read_lane (3) (16) (idx) (L)))) (PreH8 : (retval_3 = (rs_read_lane (2) (16) (idx) (L)))) (PreH9 : (retval_2 = (rs_read_lane (1) (16) (idx) (L)))) (PreH10 : (retval = (rs_read_lane (0) (16) (idx) (L)))) (PreH11 : (0 <= idx)) (PreH12 : ((idx + 16 ) <= count)) (PreH13 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Char  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Char  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (0 <= 10) ” 
  &&  “ (10 < 128) ” 
  &&  “ (0 <= 16) ” 
  &&  “ (16 <= 128) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + 16 ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
.

Definition vld1q_s8_partial_solve_wit_11_aux := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (PreH1 : (retval_10 = (rs_read_lane (9) (16) (idx) (L)))) (PreH2 : (retval_9 = (rs_read_lane (8) (16) (idx) (L)))) (PreH3 : (retval_8 = (rs_read_lane (7) (16) (idx) (L)))) (PreH4 : (retval_7 = (rs_read_lane (6) (16) (idx) (L)))) (PreH5 : (retval_6 = (rs_read_lane (5) (16) (idx) (L)))) (PreH6 : (retval_5 = (rs_read_lane (4) (16) (idx) (L)))) (PreH7 : (retval_4 = (rs_read_lane (3) (16) (idx) (L)))) (PreH8 : (retval_3 = (rs_read_lane (2) (16) (idx) (L)))) (PreH9 : (retval_2 = (rs_read_lane (1) (16) (idx) (L)))) (PreH10 : (retval = (rs_read_lane (0) (16) (idx) (L)))) (PreH11 : (0 <= idx)) (PreH12 : ((idx + 16 ) <= count)) (PreH13 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Char  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Char  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
|--
  “ (0 <= 10) ” 
  &&  “ (10 < 128) ” 
  &&  “ (0 <= 16) ” 
  &&  “ (16 <= 128) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + 16 ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ” 
  &&  “ (retval_10 = (rs_read_lane (9) (16) (idx) (L))) ” 
  &&  “ (retval_9 = (rs_read_lane (8) (16) (idx) (L))) ” 
  &&  “ (retval_8 = (rs_read_lane (7) (16) (idx) (L))) ” 
  &&  “ (retval_7 = (rs_read_lane (6) (16) (idx) (L))) ” 
  &&  “ (retval_6 = (rs_read_lane (5) (16) (idx) (L))) ” 
  &&  “ (retval_5 = (rs_read_lane (4) (16) (idx) (L))) ” 
  &&  “ (retval_4 = (rs_read_lane (3) (16) (idx) (L))) ” 
  &&  “ (retval_3 = (rs_read_lane (2) (16) (idx) (L))) ” 
  &&  “ (retval_2 = (rs_read_lane (1) (16) (idx) (L))) ” 
  &&  “ (retval = (rs_read_lane (0) (16) (idx) (L))) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + 16 ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
  &&  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Char  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Char  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
.

Definition vld1q_s8_partial_solve_wit_11 := vld1q_s8_partial_solve_wit_11_pure -> vld1q_s8_partial_solve_wit_11_aux.

Definition vld1q_s8_partial_solve_wit_12_pure := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (PreH1 : (retval_11 = (rs_read_lane (10) (16) (idx) (L)))) (PreH2 : (retval_10 = (rs_read_lane (9) (16) (idx) (L)))) (PreH3 : (retval_9 = (rs_read_lane (8) (16) (idx) (L)))) (PreH4 : (retval_8 = (rs_read_lane (7) (16) (idx) (L)))) (PreH5 : (retval_7 = (rs_read_lane (6) (16) (idx) (L)))) (PreH6 : (retval_6 = (rs_read_lane (5) (16) (idx) (L)))) (PreH7 : (retval_5 = (rs_read_lane (4) (16) (idx) (L)))) (PreH8 : (retval_4 = (rs_read_lane (3) (16) (idx) (L)))) (PreH9 : (retval_3 = (rs_read_lane (2) (16) (idx) (L)))) (PreH10 : (retval_2 = (rs_read_lane (1) (16) (idx) (L)))) (PreH11 : (retval = (rs_read_lane (0) (16) (idx) (L)))) (PreH12 : (0 <= idx)) (PreH13 : ((idx + 16 ) <= count)) (PreH14 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Char  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Char  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Char  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (0 <= 11) ” 
  &&  “ (11 < 128) ” 
  &&  “ (0 <= 16) ” 
  &&  “ (16 <= 128) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + 16 ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
.

Definition vld1q_s8_partial_solve_wit_12_aux := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (PreH1 : (retval_11 = (rs_read_lane (10) (16) (idx) (L)))) (PreH2 : (retval_10 = (rs_read_lane (9) (16) (idx) (L)))) (PreH3 : (retval_9 = (rs_read_lane (8) (16) (idx) (L)))) (PreH4 : (retval_8 = (rs_read_lane (7) (16) (idx) (L)))) (PreH5 : (retval_7 = (rs_read_lane (6) (16) (idx) (L)))) (PreH6 : (retval_6 = (rs_read_lane (5) (16) (idx) (L)))) (PreH7 : (retval_5 = (rs_read_lane (4) (16) (idx) (L)))) (PreH8 : (retval_4 = (rs_read_lane (3) (16) (idx) (L)))) (PreH9 : (retval_3 = (rs_read_lane (2) (16) (idx) (L)))) (PreH10 : (retval_2 = (rs_read_lane (1) (16) (idx) (L)))) (PreH11 : (retval = (rs_read_lane (0) (16) (idx) (L)))) (PreH12 : (0 <= idx)) (PreH13 : ((idx + 16 ) <= count)) (PreH14 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Char  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Char  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Char  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
|--
  “ (0 <= 11) ” 
  &&  “ (11 < 128) ” 
  &&  “ (0 <= 16) ” 
  &&  “ (16 <= 128) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + 16 ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ” 
  &&  “ (retval_11 = (rs_read_lane (10) (16) (idx) (L))) ” 
  &&  “ (retval_10 = (rs_read_lane (9) (16) (idx) (L))) ” 
  &&  “ (retval_9 = (rs_read_lane (8) (16) (idx) (L))) ” 
  &&  “ (retval_8 = (rs_read_lane (7) (16) (idx) (L))) ” 
  &&  “ (retval_7 = (rs_read_lane (6) (16) (idx) (L))) ” 
  &&  “ (retval_6 = (rs_read_lane (5) (16) (idx) (L))) ” 
  &&  “ (retval_5 = (rs_read_lane (4) (16) (idx) (L))) ” 
  &&  “ (retval_4 = (rs_read_lane (3) (16) (idx) (L))) ” 
  &&  “ (retval_3 = (rs_read_lane (2) (16) (idx) (L))) ” 
  &&  “ (retval_2 = (rs_read_lane (1) (16) (idx) (L))) ” 
  &&  “ (retval = (rs_read_lane (0) (16) (idx) (L))) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + 16 ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
  &&  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Char  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Char  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Char  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
.

Definition vld1q_s8_partial_solve_wit_12 := vld1q_s8_partial_solve_wit_12_pure -> vld1q_s8_partial_solve_wit_12_aux.

Definition vld1q_s8_partial_solve_wit_13_pure := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (PreH1 : (retval_12 = (rs_read_lane (11) (16) (idx) (L)))) (PreH2 : (retval_11 = (rs_read_lane (10) (16) (idx) (L)))) (PreH3 : (retval_10 = (rs_read_lane (9) (16) (idx) (L)))) (PreH4 : (retval_9 = (rs_read_lane (8) (16) (idx) (L)))) (PreH5 : (retval_8 = (rs_read_lane (7) (16) (idx) (L)))) (PreH6 : (retval_7 = (rs_read_lane (6) (16) (idx) (L)))) (PreH7 : (retval_6 = (rs_read_lane (5) (16) (idx) (L)))) (PreH8 : (retval_5 = (rs_read_lane (4) (16) (idx) (L)))) (PreH9 : (retval_4 = (rs_read_lane (3) (16) (idx) (L)))) (PreH10 : (retval_3 = (rs_read_lane (2) (16) (idx) (L)))) (PreH11 : (retval_2 = (rs_read_lane (1) (16) (idx) (L)))) (PreH12 : (retval = (rs_read_lane (0) (16) (idx) (L)))) (PreH13 : (0 <= idx)) (PreH14 : ((idx + 16 ) <= count)) (PreH15 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Char  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Char  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Char  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Char  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (0 <= 12) ” 
  &&  “ (12 < 128) ” 
  &&  “ (0 <= 16) ” 
  &&  “ (16 <= 128) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + 16 ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
.

Definition vld1q_s8_partial_solve_wit_13_aux := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (PreH1 : (retval_12 = (rs_read_lane (11) (16) (idx) (L)))) (PreH2 : (retval_11 = (rs_read_lane (10) (16) (idx) (L)))) (PreH3 : (retval_10 = (rs_read_lane (9) (16) (idx) (L)))) (PreH4 : (retval_9 = (rs_read_lane (8) (16) (idx) (L)))) (PreH5 : (retval_8 = (rs_read_lane (7) (16) (idx) (L)))) (PreH6 : (retval_7 = (rs_read_lane (6) (16) (idx) (L)))) (PreH7 : (retval_6 = (rs_read_lane (5) (16) (idx) (L)))) (PreH8 : (retval_5 = (rs_read_lane (4) (16) (idx) (L)))) (PreH9 : (retval_4 = (rs_read_lane (3) (16) (idx) (L)))) (PreH10 : (retval_3 = (rs_read_lane (2) (16) (idx) (L)))) (PreH11 : (retval_2 = (rs_read_lane (1) (16) (idx) (L)))) (PreH12 : (retval = (rs_read_lane (0) (16) (idx) (L)))) (PreH13 : (0 <= idx)) (PreH14 : ((idx + 16 ) <= count)) (PreH15 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Char  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Char  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Char  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Char  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
|--
  “ (0 <= 12) ” 
  &&  “ (12 < 128) ” 
  &&  “ (0 <= 16) ” 
  &&  “ (16 <= 128) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + 16 ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ” 
  &&  “ (retval_12 = (rs_read_lane (11) (16) (idx) (L))) ” 
  &&  “ (retval_11 = (rs_read_lane (10) (16) (idx) (L))) ” 
  &&  “ (retval_10 = (rs_read_lane (9) (16) (idx) (L))) ” 
  &&  “ (retval_9 = (rs_read_lane (8) (16) (idx) (L))) ” 
  &&  “ (retval_8 = (rs_read_lane (7) (16) (idx) (L))) ” 
  &&  “ (retval_7 = (rs_read_lane (6) (16) (idx) (L))) ” 
  &&  “ (retval_6 = (rs_read_lane (5) (16) (idx) (L))) ” 
  &&  “ (retval_5 = (rs_read_lane (4) (16) (idx) (L))) ” 
  &&  “ (retval_4 = (rs_read_lane (3) (16) (idx) (L))) ” 
  &&  “ (retval_3 = (rs_read_lane (2) (16) (idx) (L))) ” 
  &&  “ (retval_2 = (rs_read_lane (1) (16) (idx) (L))) ” 
  &&  “ (retval = (rs_read_lane (0) (16) (idx) (L))) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + 16 ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
  &&  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Char  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Char  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Char  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Char  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
.

Definition vld1q_s8_partial_solve_wit_13 := vld1q_s8_partial_solve_wit_13_pure -> vld1q_s8_partial_solve_wit_13_aux.

Definition vld1q_s8_partial_solve_wit_14_pure := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (PreH1 : (retval_13 = (rs_read_lane (12) (16) (idx) (L)))) (PreH2 : (retval_12 = (rs_read_lane (11) (16) (idx) (L)))) (PreH3 : (retval_11 = (rs_read_lane (10) (16) (idx) (L)))) (PreH4 : (retval_10 = (rs_read_lane (9) (16) (idx) (L)))) (PreH5 : (retval_9 = (rs_read_lane (8) (16) (idx) (L)))) (PreH6 : (retval_8 = (rs_read_lane (7) (16) (idx) (L)))) (PreH7 : (retval_7 = (rs_read_lane (6) (16) (idx) (L)))) (PreH8 : (retval_6 = (rs_read_lane (5) (16) (idx) (L)))) (PreH9 : (retval_5 = (rs_read_lane (4) (16) (idx) (L)))) (PreH10 : (retval_4 = (rs_read_lane (3) (16) (idx) (L)))) (PreH11 : (retval_3 = (rs_read_lane (2) (16) (idx) (L)))) (PreH12 : (retval_2 = (rs_read_lane (1) (16) (idx) (L)))) (PreH13 : (retval = (rs_read_lane (0) (16) (idx) (L)))) (PreH14 : (0 <= idx)) (PreH15 : ((idx + 16 ) <= count)) (PreH16 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Char  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Char  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Char  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Char  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Char  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (0 <= 13) ” 
  &&  “ (13 < 128) ” 
  &&  “ (0 <= 16) ” 
  &&  “ (16 <= 128) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + 16 ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
.

Definition vld1q_s8_partial_solve_wit_14_aux := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (PreH1 : (retval_13 = (rs_read_lane (12) (16) (idx) (L)))) (PreH2 : (retval_12 = (rs_read_lane (11) (16) (idx) (L)))) (PreH3 : (retval_11 = (rs_read_lane (10) (16) (idx) (L)))) (PreH4 : (retval_10 = (rs_read_lane (9) (16) (idx) (L)))) (PreH5 : (retval_9 = (rs_read_lane (8) (16) (idx) (L)))) (PreH6 : (retval_8 = (rs_read_lane (7) (16) (idx) (L)))) (PreH7 : (retval_7 = (rs_read_lane (6) (16) (idx) (L)))) (PreH8 : (retval_6 = (rs_read_lane (5) (16) (idx) (L)))) (PreH9 : (retval_5 = (rs_read_lane (4) (16) (idx) (L)))) (PreH10 : (retval_4 = (rs_read_lane (3) (16) (idx) (L)))) (PreH11 : (retval_3 = (rs_read_lane (2) (16) (idx) (L)))) (PreH12 : (retval_2 = (rs_read_lane (1) (16) (idx) (L)))) (PreH13 : (retval = (rs_read_lane (0) (16) (idx) (L)))) (PreH14 : (0 <= idx)) (PreH15 : ((idx + 16 ) <= count)) (PreH16 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Char  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Char  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Char  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Char  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Char  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
|--
  “ (0 <= 13) ” 
  &&  “ (13 < 128) ” 
  &&  “ (0 <= 16) ” 
  &&  “ (16 <= 128) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + 16 ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ” 
  &&  “ (retval_13 = (rs_read_lane (12) (16) (idx) (L))) ” 
  &&  “ (retval_12 = (rs_read_lane (11) (16) (idx) (L))) ” 
  &&  “ (retval_11 = (rs_read_lane (10) (16) (idx) (L))) ” 
  &&  “ (retval_10 = (rs_read_lane (9) (16) (idx) (L))) ” 
  &&  “ (retval_9 = (rs_read_lane (8) (16) (idx) (L))) ” 
  &&  “ (retval_8 = (rs_read_lane (7) (16) (idx) (L))) ” 
  &&  “ (retval_7 = (rs_read_lane (6) (16) (idx) (L))) ” 
  &&  “ (retval_6 = (rs_read_lane (5) (16) (idx) (L))) ” 
  &&  “ (retval_5 = (rs_read_lane (4) (16) (idx) (L))) ” 
  &&  “ (retval_4 = (rs_read_lane (3) (16) (idx) (L))) ” 
  &&  “ (retval_3 = (rs_read_lane (2) (16) (idx) (L))) ” 
  &&  “ (retval_2 = (rs_read_lane (1) (16) (idx) (L))) ” 
  &&  “ (retval = (rs_read_lane (0) (16) (idx) (L))) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + 16 ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
  &&  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Char  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Char  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Char  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Char  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Char  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
.

Definition vld1q_s8_partial_solve_wit_14 := vld1q_s8_partial_solve_wit_14_pure -> vld1q_s8_partial_solve_wit_14_aux.

Definition vld1q_s8_partial_solve_wit_15_pure := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (PreH1 : (retval_14 = (rs_read_lane (13) (16) (idx) (L)))) (PreH2 : (retval_13 = (rs_read_lane (12) (16) (idx) (L)))) (PreH3 : (retval_12 = (rs_read_lane (11) (16) (idx) (L)))) (PreH4 : (retval_11 = (rs_read_lane (10) (16) (idx) (L)))) (PreH5 : (retval_10 = (rs_read_lane (9) (16) (idx) (L)))) (PreH6 : (retval_9 = (rs_read_lane (8) (16) (idx) (L)))) (PreH7 : (retval_8 = (rs_read_lane (7) (16) (idx) (L)))) (PreH8 : (retval_7 = (rs_read_lane (6) (16) (idx) (L)))) (PreH9 : (retval_6 = (rs_read_lane (5) (16) (idx) (L)))) (PreH10 : (retval_5 = (rs_read_lane (4) (16) (idx) (L)))) (PreH11 : (retval_4 = (rs_read_lane (3) (16) (idx) (L)))) (PreH12 : (retval_3 = (rs_read_lane (2) (16) (idx) (L)))) (PreH13 : (retval_2 = (rs_read_lane (1) (16) (idx) (L)))) (PreH14 : (retval = (rs_read_lane (0) (16) (idx) (L)))) (PreH15 : (0 <= idx)) (PreH16 : ((idx + 16 ) <= count)) (PreH17 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Char  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Char  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Char  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Char  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Char  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Char  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (0 <= 14) ” 
  &&  “ (14 < 128) ” 
  &&  “ (0 <= 16) ” 
  &&  “ (16 <= 128) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + 16 ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
.

Definition vld1q_s8_partial_solve_wit_15_aux := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (PreH1 : (retval_14 = (rs_read_lane (13) (16) (idx) (L)))) (PreH2 : (retval_13 = (rs_read_lane (12) (16) (idx) (L)))) (PreH3 : (retval_12 = (rs_read_lane (11) (16) (idx) (L)))) (PreH4 : (retval_11 = (rs_read_lane (10) (16) (idx) (L)))) (PreH5 : (retval_10 = (rs_read_lane (9) (16) (idx) (L)))) (PreH6 : (retval_9 = (rs_read_lane (8) (16) (idx) (L)))) (PreH7 : (retval_8 = (rs_read_lane (7) (16) (idx) (L)))) (PreH8 : (retval_7 = (rs_read_lane (6) (16) (idx) (L)))) (PreH9 : (retval_6 = (rs_read_lane (5) (16) (idx) (L)))) (PreH10 : (retval_5 = (rs_read_lane (4) (16) (idx) (L)))) (PreH11 : (retval_4 = (rs_read_lane (3) (16) (idx) (L)))) (PreH12 : (retval_3 = (rs_read_lane (2) (16) (idx) (L)))) (PreH13 : (retval_2 = (rs_read_lane (1) (16) (idx) (L)))) (PreH14 : (retval = (rs_read_lane (0) (16) (idx) (L)))) (PreH15 : (0 <= idx)) (PreH16 : ((idx + 16 ) <= count)) (PreH17 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Char  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Char  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Char  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Char  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Char  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Char  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
|--
  “ (0 <= 14) ” 
  &&  “ (14 < 128) ” 
  &&  “ (0 <= 16) ” 
  &&  “ (16 <= 128) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + 16 ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ” 
  &&  “ (retval_14 = (rs_read_lane (13) (16) (idx) (L))) ” 
  &&  “ (retval_13 = (rs_read_lane (12) (16) (idx) (L))) ” 
  &&  “ (retval_12 = (rs_read_lane (11) (16) (idx) (L))) ” 
  &&  “ (retval_11 = (rs_read_lane (10) (16) (idx) (L))) ” 
  &&  “ (retval_10 = (rs_read_lane (9) (16) (idx) (L))) ” 
  &&  “ (retval_9 = (rs_read_lane (8) (16) (idx) (L))) ” 
  &&  “ (retval_8 = (rs_read_lane (7) (16) (idx) (L))) ” 
  &&  “ (retval_7 = (rs_read_lane (6) (16) (idx) (L))) ” 
  &&  “ (retval_6 = (rs_read_lane (5) (16) (idx) (L))) ” 
  &&  “ (retval_5 = (rs_read_lane (4) (16) (idx) (L))) ” 
  &&  “ (retval_4 = (rs_read_lane (3) (16) (idx) (L))) ” 
  &&  “ (retval_3 = (rs_read_lane (2) (16) (idx) (L))) ” 
  &&  “ (retval_2 = (rs_read_lane (1) (16) (idx) (L))) ” 
  &&  “ (retval = (rs_read_lane (0) (16) (idx) (L))) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + 16 ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
  &&  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Char  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Char  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Char  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Char  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Char  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Char  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
.

Definition vld1q_s8_partial_solve_wit_15 := vld1q_s8_partial_solve_wit_15_pure -> vld1q_s8_partial_solve_wit_15_aux.

Definition vld1q_s8_partial_solve_wit_16_pure := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (PreH1 : (retval_15 = (rs_read_lane (14) (16) (idx) (L)))) (PreH2 : (retval_14 = (rs_read_lane (13) (16) (idx) (L)))) (PreH3 : (retval_13 = (rs_read_lane (12) (16) (idx) (L)))) (PreH4 : (retval_12 = (rs_read_lane (11) (16) (idx) (L)))) (PreH5 : (retval_11 = (rs_read_lane (10) (16) (idx) (L)))) (PreH6 : (retval_10 = (rs_read_lane (9) (16) (idx) (L)))) (PreH7 : (retval_9 = (rs_read_lane (8) (16) (idx) (L)))) (PreH8 : (retval_8 = (rs_read_lane (7) (16) (idx) (L)))) (PreH9 : (retval_7 = (rs_read_lane (6) (16) (idx) (L)))) (PreH10 : (retval_6 = (rs_read_lane (5) (16) (idx) (L)))) (PreH11 : (retval_5 = (rs_read_lane (4) (16) (idx) (L)))) (PreH12 : (retval_4 = (rs_read_lane (3) (16) (idx) (L)))) (PreH13 : (retval_3 = (rs_read_lane (2) (16) (idx) (L)))) (PreH14 : (retval_2 = (rs_read_lane (1) (16) (idx) (L)))) (PreH15 : (retval = (rs_read_lane (0) (16) (idx) (L)))) (PreH16 : (0 <= idx)) (PreH17 : ((idx + 16 ) <= count)) (PreH18 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Char  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Char  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Char  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Char  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Char  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Char  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Char  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
|--
  “ (0 <= 15) ” 
  &&  “ (15 < 128) ” 
  &&  “ (0 <= 16) ” 
  &&  “ (16 <= 128) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + 16 ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
.

Definition vld1q_s8_partial_solve_wit_16_aux := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (PreH1 : (retval_15 = (rs_read_lane (14) (16) (idx) (L)))) (PreH2 : (retval_14 = (rs_read_lane (13) (16) (idx) (L)))) (PreH3 : (retval_13 = (rs_read_lane (12) (16) (idx) (L)))) (PreH4 : (retval_12 = (rs_read_lane (11) (16) (idx) (L)))) (PreH5 : (retval_11 = (rs_read_lane (10) (16) (idx) (L)))) (PreH6 : (retval_10 = (rs_read_lane (9) (16) (idx) (L)))) (PreH7 : (retval_9 = (rs_read_lane (8) (16) (idx) (L)))) (PreH8 : (retval_8 = (rs_read_lane (7) (16) (idx) (L)))) (PreH9 : (retval_7 = (rs_read_lane (6) (16) (idx) (L)))) (PreH10 : (retval_6 = (rs_read_lane (5) (16) (idx) (L)))) (PreH11 : (retval_5 = (rs_read_lane (4) (16) (idx) (L)))) (PreH12 : (retval_4 = (rs_read_lane (3) (16) (idx) (L)))) (PreH13 : (retval_3 = (rs_read_lane (2) (16) (idx) (L)))) (PreH14 : (retval_2 = (rs_read_lane (1) (16) (idx) (L)))) (PreH15 : (retval = (rs_read_lane (0) (16) (idx) (L)))) (PreH16 : (0 <= idx)) (PreH17 : ((idx + 16 ) <= count)) (PreH18 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Char  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Char  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Char  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Char  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Char  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Char  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Char  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
|--
  “ (0 <= 15) ” 
  &&  “ (15 < 128) ” 
  &&  “ (0 <= 16) ” 
  &&  “ (16 <= 128) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + 16 ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ” 
  &&  “ (retval_15 = (rs_read_lane (14) (16) (idx) (L))) ” 
  &&  “ (retval_14 = (rs_read_lane (13) (16) (idx) (L))) ” 
  &&  “ (retval_13 = (rs_read_lane (12) (16) (idx) (L))) ” 
  &&  “ (retval_12 = (rs_read_lane (11) (16) (idx) (L))) ” 
  &&  “ (retval_11 = (rs_read_lane (10) (16) (idx) (L))) ” 
  &&  “ (retval_10 = (rs_read_lane (9) (16) (idx) (L))) ” 
  &&  “ (retval_9 = (rs_read_lane (8) (16) (idx) (L))) ” 
  &&  “ (retval_8 = (rs_read_lane (7) (16) (idx) (L))) ” 
  &&  “ (retval_7 = (rs_read_lane (6) (16) (idx) (L))) ” 
  &&  “ (retval_6 = (rs_read_lane (5) (16) (idx) (L))) ” 
  &&  “ (retval_5 = (rs_read_lane (4) (16) (idx) (L))) ” 
  &&  “ (retval_4 = (rs_read_lane (3) (16) (idx) (L))) ” 
  &&  “ (retval_3 = (rs_read_lane (2) (16) (idx) (L))) ” 
  &&  “ (retval_2 = (rs_read_lane (1) (16) (idx) (L))) ” 
  &&  “ (retval = (rs_read_lane (0) (16) (idx) (L))) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + 16 ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
  &&  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Char  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Char  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Char  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Char  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Char  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Char  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Char  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
.

Definition vld1q_s8_partial_solve_wit_16 := vld1q_s8_partial_solve_wit_16_pure -> vld1q_s8_partial_solve_wit_16_aux.

Definition vld1q_s8_partial_solve_wit_17 := 
forall (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (record_return: Z) (PreH1 : (retval_16 = (rs_read_lane (15) (16) (idx) (L)))) (PreH2 : (retval_15 = (rs_read_lane (14) (16) (idx) (L)))) (PreH3 : (retval_14 = (rs_read_lane (13) (16) (idx) (L)))) (PreH4 : (retval_13 = (rs_read_lane (12) (16) (idx) (L)))) (PreH5 : (retval_12 = (rs_read_lane (11) (16) (idx) (L)))) (PreH6 : (retval_11 = (rs_read_lane (10) (16) (idx) (L)))) (PreH7 : (retval_10 = (rs_read_lane (9) (16) (idx) (L)))) (PreH8 : (retval_9 = (rs_read_lane (8) (16) (idx) (L)))) (PreH9 : (retval_8 = (rs_read_lane (7) (16) (idx) (L)))) (PreH10 : (retval_7 = (rs_read_lane (6) (16) (idx) (L)))) (PreH11 : (retval_6 = (rs_read_lane (5) (16) (idx) (L)))) (PreH12 : (retval_5 = (rs_read_lane (4) (16) (idx) (L)))) (PreH13 : (retval_4 = (rs_read_lane (3) (16) (idx) (L)))) (PreH14 : (retval_3 = (rs_read_lane (2) (16) (idx) (L)))) (PreH15 : (retval_2 = (rs_read_lane (1) (16) (idx) (L)))) (PreH16 : (retval = (rs_read_lane (0) (16) (idx) (L)))) (PreH17 : (0 <= idx)) (PreH18 : ((idx + 16 ) <= count)) (PreH19 : (p_pre = (base + idx ))) ,
  (UndefStructPredint8x16_t record_return )
  **  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s15")) # Char  |-> retval_16)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Char  |-> retval_15)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Char  |-> retval_14)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Char  |-> retval_13)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Char  |-> retval_12)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Char  |-> retval_11)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Char  |-> retval_10)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Char  |-> retval_9)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |-> retval_8)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |-> retval_7)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |-> retval_6)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |-> retval_5)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> retval_4)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
|--
  “ (retval_16 = (rs_read_lane (15) (16) (idx) (L))) ” 
  &&  “ (retval_15 = (rs_read_lane (14) (16) (idx) (L))) ” 
  &&  “ (retval_14 = (rs_read_lane (13) (16) (idx) (L))) ” 
  &&  “ (retval_13 = (rs_read_lane (12) (16) (idx) (L))) ” 
  &&  “ (retval_12 = (rs_read_lane (11) (16) (idx) (L))) ” 
  &&  “ (retval_11 = (rs_read_lane (10) (16) (idx) (L))) ” 
  &&  “ (retval_10 = (rs_read_lane (9) (16) (idx) (L))) ” 
  &&  “ (retval_9 = (rs_read_lane (8) (16) (idx) (L))) ” 
  &&  “ (retval_8 = (rs_read_lane (7) (16) (idx) (L))) ” 
  &&  “ (retval_7 = (rs_read_lane (6) (16) (idx) (L))) ” 
  &&  “ (retval_6 = (rs_read_lane (5) (16) (idx) (L))) ” 
  &&  “ (retval_5 = (rs_read_lane (4) (16) (idx) (L))) ” 
  &&  “ (retval_4 = (rs_read_lane (3) (16) (idx) (L))) ” 
  &&  “ (retval_3 = (rs_read_lane (2) (16) (idx) (L))) ” 
  &&  “ (retval_2 = (rs_read_lane (1) (16) (idx) (L))) ” 
  &&  “ (retval = (rs_read_lane (0) (16) (idx) (L))) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + 16 ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
  &&  ((&((record_return)  # "int8x16_t" ->ₛ "s15")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Char  |-> retval_16)
  **  ((&((record_return)  # "int8x16_t" ->ₛ "s14")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Char  |-> retval_15)
  **  ((&((record_return)  # "int8x16_t" ->ₛ "s13")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Char  |-> retval_14)
  **  ((&((record_return)  # "int8x16_t" ->ₛ "s12")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Char  |-> retval_13)
  **  ((&((record_return)  # "int8x16_t" ->ₛ "s11")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Char  |-> retval_12)
  **  ((&((record_return)  # "int8x16_t" ->ₛ "s10")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Char  |-> retval_11)
  **  ((&((record_return)  # "int8x16_t" ->ₛ "s9")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Char  |-> retval_10)
  **  ((&((record_return)  # "int8x16_t" ->ₛ "s8")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Char  |-> retval_9)
  **  ((&((record_return)  # "int8x16_t" ->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |-> retval_8)
  **  ((&((record_return)  # "int8x16_t" ->ₛ "s6")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |-> retval_7)
  **  ((&((record_return)  # "int8x16_t" ->ₛ "s5")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |-> retval_6)
  **  ((&((record_return)  # "int8x16_t" ->ₛ "s4")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |-> retval_5)
  **  ((&((record_return)  # "int8x16_t" ->ₛ "s3")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> retval_4)
  **  ((&((record_return)  # "int8x16_t" ->ₛ "s2")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&((record_return)  # "int8x16_t" ->ₛ "s1")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&((record_return)  # "int8x16_t" ->ₛ "s0")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
  **  (CharArray.full base count L )
.

Module Type VC_Correct.

Include byte_arrays_Strategy_Correct.

Axiom proof_of_rsum_read_lane_safety_wit_1 : rsum_read_lane_safety_wit_1.
Axiom proof_of_rsum_read_lane_entail_wit_1 : rsum_read_lane_entail_wit_1.
Axiom proof_of_rsum_read_lane_entail_wit_2 : rsum_read_lane_entail_wit_2.
Axiom proof_of_rsum_read_lane_return_wit_1 : rsum_read_lane_return_wit_1.
Axiom proof_of_rsum_read_lane_return_wit_2 : rsum_read_lane_return_wit_2.
Axiom proof_of_vld1q_s8_safety_wit_1 : vld1q_s8_safety_wit_1.
Axiom proof_of_vld1q_s8_safety_wit_2 : vld1q_s8_safety_wit_2.
Axiom proof_of_vld1q_s8_safety_wit_3 : vld1q_s8_safety_wit_3.
Axiom proof_of_vld1q_s8_safety_wit_4 : vld1q_s8_safety_wit_4.
Axiom proof_of_vld1q_s8_safety_wit_5 : vld1q_s8_safety_wit_5.
Axiom proof_of_vld1q_s8_safety_wit_6 : vld1q_s8_safety_wit_6.
Axiom proof_of_vld1q_s8_safety_wit_7 : vld1q_s8_safety_wit_7.
Axiom proof_of_vld1q_s8_safety_wit_8 : vld1q_s8_safety_wit_8.
Axiom proof_of_vld1q_s8_safety_wit_9 : vld1q_s8_safety_wit_9.
Axiom proof_of_vld1q_s8_safety_wit_10 : vld1q_s8_safety_wit_10.
Axiom proof_of_vld1q_s8_safety_wit_11 : vld1q_s8_safety_wit_11.
Axiom proof_of_vld1q_s8_safety_wit_12 : vld1q_s8_safety_wit_12.
Axiom proof_of_vld1q_s8_safety_wit_13 : vld1q_s8_safety_wit_13.
Axiom proof_of_vld1q_s8_safety_wit_14 : vld1q_s8_safety_wit_14.
Axiom proof_of_vld1q_s8_safety_wit_15 : vld1q_s8_safety_wit_15.
Axiom proof_of_vld1q_s8_safety_wit_16 : vld1q_s8_safety_wit_16.
Axiom proof_of_vld1q_s8_safety_wit_17 : vld1q_s8_safety_wit_17.
Axiom proof_of_vld1q_s8_safety_wit_18 : vld1q_s8_safety_wit_18.
Axiom proof_of_vld1q_s8_safety_wit_19 : vld1q_s8_safety_wit_19.
Axiom proof_of_vld1q_s8_safety_wit_20 : vld1q_s8_safety_wit_20.
Axiom proof_of_vld1q_s8_safety_wit_21 : vld1q_s8_safety_wit_21.
Axiom proof_of_vld1q_s8_safety_wit_22 : vld1q_s8_safety_wit_22.
Axiom proof_of_vld1q_s8_safety_wit_23 : vld1q_s8_safety_wit_23.
Axiom proof_of_vld1q_s8_safety_wit_24 : vld1q_s8_safety_wit_24.
Axiom proof_of_vld1q_s8_safety_wit_25 : vld1q_s8_safety_wit_25.
Axiom proof_of_vld1q_s8_safety_wit_26 : vld1q_s8_safety_wit_26.
Axiom proof_of_vld1q_s8_safety_wit_27 : vld1q_s8_safety_wit_27.
Axiom proof_of_vld1q_s8_safety_wit_28 : vld1q_s8_safety_wit_28.
Axiom proof_of_vld1q_s8_safety_wit_29 : vld1q_s8_safety_wit_29.
Axiom proof_of_vld1q_s8_safety_wit_30 : vld1q_s8_safety_wit_30.
Axiom proof_of_vld1q_s8_safety_wit_31 : vld1q_s8_safety_wit_31.
Axiom proof_of_vld1q_s8_safety_wit_32 : vld1q_s8_safety_wit_32.
Axiom proof_of_vld1q_s8_return_wit_1 : vld1q_s8_return_wit_1.
Axiom proof_of_vld1q_s8_partial_solve_wit_1_pure : vld1q_s8_partial_solve_wit_1_pure.
Axiom proof_of_vld1q_s8_partial_solve_wit_1 : vld1q_s8_partial_solve_wit_1.
Axiom proof_of_vld1q_s8_partial_solve_wit_2_pure : vld1q_s8_partial_solve_wit_2_pure.
Axiom proof_of_vld1q_s8_partial_solve_wit_2 : vld1q_s8_partial_solve_wit_2.
Axiom proof_of_vld1q_s8_partial_solve_wit_3_pure : vld1q_s8_partial_solve_wit_3_pure.
Axiom proof_of_vld1q_s8_partial_solve_wit_3 : vld1q_s8_partial_solve_wit_3.
Axiom proof_of_vld1q_s8_partial_solve_wit_4_pure : vld1q_s8_partial_solve_wit_4_pure.
Axiom proof_of_vld1q_s8_partial_solve_wit_4 : vld1q_s8_partial_solve_wit_4.
Axiom proof_of_vld1q_s8_partial_solve_wit_5_pure : vld1q_s8_partial_solve_wit_5_pure.
Axiom proof_of_vld1q_s8_partial_solve_wit_5 : vld1q_s8_partial_solve_wit_5.
Axiom proof_of_vld1q_s8_partial_solve_wit_6_pure : vld1q_s8_partial_solve_wit_6_pure.
Axiom proof_of_vld1q_s8_partial_solve_wit_6 : vld1q_s8_partial_solve_wit_6.
Axiom proof_of_vld1q_s8_partial_solve_wit_7_pure : vld1q_s8_partial_solve_wit_7_pure.
Axiom proof_of_vld1q_s8_partial_solve_wit_7 : vld1q_s8_partial_solve_wit_7.
Axiom proof_of_vld1q_s8_partial_solve_wit_8_pure : vld1q_s8_partial_solve_wit_8_pure.
Axiom proof_of_vld1q_s8_partial_solve_wit_8 : vld1q_s8_partial_solve_wit_8.
Axiom proof_of_vld1q_s8_partial_solve_wit_9_pure : vld1q_s8_partial_solve_wit_9_pure.
Axiom proof_of_vld1q_s8_partial_solve_wit_9 : vld1q_s8_partial_solve_wit_9.
Axiom proof_of_vld1q_s8_partial_solve_wit_10_pure : vld1q_s8_partial_solve_wit_10_pure.
Axiom proof_of_vld1q_s8_partial_solve_wit_10 : vld1q_s8_partial_solve_wit_10.
Axiom proof_of_vld1q_s8_partial_solve_wit_11_pure : vld1q_s8_partial_solve_wit_11_pure.
Axiom proof_of_vld1q_s8_partial_solve_wit_11 : vld1q_s8_partial_solve_wit_11.
Axiom proof_of_vld1q_s8_partial_solve_wit_12_pure : vld1q_s8_partial_solve_wit_12_pure.
Axiom proof_of_vld1q_s8_partial_solve_wit_12 : vld1q_s8_partial_solve_wit_12.
Axiom proof_of_vld1q_s8_partial_solve_wit_13_pure : vld1q_s8_partial_solve_wit_13_pure.
Axiom proof_of_vld1q_s8_partial_solve_wit_13 : vld1q_s8_partial_solve_wit_13.
Axiom proof_of_vld1q_s8_partial_solve_wit_14_pure : vld1q_s8_partial_solve_wit_14_pure.
Axiom proof_of_vld1q_s8_partial_solve_wit_14 : vld1q_s8_partial_solve_wit_14.
Axiom proof_of_vld1q_s8_partial_solve_wit_15_pure : vld1q_s8_partial_solve_wit_15_pure.
Axiom proof_of_vld1q_s8_partial_solve_wit_15 : vld1q_s8_partial_solve_wit_15.
Axiom proof_of_vld1q_s8_partial_solve_wit_16_pure : vld1q_s8_partial_solve_wit_16_pure.
Axiom proof_of_vld1q_s8_partial_solve_wit_16 : vld1q_s8_partial_solve_wit_16.
Axiom proof_of_vld1q_s8_partial_solve_wit_17 : vld1q_s8_partial_solve_wit_17.

End VC_Correct.
