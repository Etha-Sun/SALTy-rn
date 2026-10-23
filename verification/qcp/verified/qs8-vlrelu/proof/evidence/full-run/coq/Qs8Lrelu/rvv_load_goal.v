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
Require Import Qs8Lrelu.Model.
Require Import Qs8Lrelu.Types.
Require Import Qs8Lrelu.MemoryModel.
Require Import Qs8Lrelu.RvvMemoryModel.
Local Open Scope sac.
From Qs8Lrelu Require Import s8_arrays_strategy_goal.
From Qs8Lrelu Require Import s8_arrays_strategy_proof.

(*----- Function __riscv_vle8_v_i8m2 -----*)

Definition __riscv_vle8_v_i8m2_safety_wit_1 := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (PreH1 : (0 <= vl_pre)) (PreH2 : (vl_pre <= 32)) (PreH3 : (0 <= idx)) (PreH4 : ((idx + vl_pre ) <= count)) (PreH5 : (p_pre = (base + idx ))) ,
  (UndefStructPredvint8m2_t ( &( "r" ) ) )
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  (CharArray.full base count L )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition __riscv_vle8_v_i8m2_safety_wit_2 := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (PreH1 : (retval = (s8_read_lane (0) (vl_pre) (idx) (L)))) (PreH2 : (0 <= vl_pre)) (PreH3 : (vl_pre <= 32)) (PreH4 : (0 <= idx)) (PreH5 : ((idx + vl_pre ) <= count)) (PreH6 : (p_pre = (base + idx ))) ,
  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |->_)
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
  **  (CharArray.full base count L )
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition __riscv_vle8_v_i8m2_safety_wit_3 := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L)))) (PreH2 : (retval = (s8_read_lane (0) (vl_pre) (idx) (L)))) (PreH3 : (0 <= vl_pre)) (PreH4 : (vl_pre <= 32)) (PreH5 : (0 <= idx)) (PreH6 : ((idx + vl_pre ) <= count)) (PreH7 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |->_)
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
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition __riscv_vle8_v_i8m2_safety_wit_4 := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L)))) (PreH2 : (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L)))) (PreH3 : (retval = (s8_read_lane (0) (vl_pre) (idx) (L)))) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) (PreH6 : (0 <= idx)) (PreH7 : ((idx + vl_pre ) <= count)) (PreH8 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |->_)
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
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 3) ”
.

Definition __riscv_vle8_v_i8m2_safety_wit_5 := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L)))) (PreH2 : (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L)))) (PreH3 : (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L)))) (PreH4 : (retval = (s8_read_lane (0) (vl_pre) (idx) (L)))) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) (PreH7 : (0 <= idx)) (PreH8 : ((idx + vl_pre ) <= count)) (PreH9 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |->_)
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
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (4 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 4) ”
.

Definition __riscv_vle8_v_i8m2_safety_wit_6 := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (PreH1 : (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L)))) (PreH2 : (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L)))) (PreH3 : (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L)))) (PreH4 : (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L)))) (PreH5 : (retval = (s8_read_lane (0) (vl_pre) (idx) (L)))) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= 32)) (PreH8 : (0 <= idx)) (PreH9 : ((idx + vl_pre ) <= count)) (PreH10 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |->_)
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
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (5 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 5) ”
.

Definition __riscv_vle8_v_i8m2_safety_wit_7 := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (PreH1 : (retval_6 = (s8_read_lane (5) (vl_pre) (idx) (L)))) (PreH2 : (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L)))) (PreH3 : (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L)))) (PreH4 : (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L)))) (PreH5 : (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L)))) (PreH6 : (retval = (s8_read_lane (0) (vl_pre) (idx) (L)))) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 32)) (PreH9 : (0 <= idx)) (PreH10 : ((idx + vl_pre ) <= count)) (PreH11 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |->_)
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
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (6 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 6) ”
.

Definition __riscv_vle8_v_i8m2_safety_wit_8 := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (PreH1 : (retval_7 = (s8_read_lane (6) (vl_pre) (idx) (L)))) (PreH2 : (retval_6 = (s8_read_lane (5) (vl_pre) (idx) (L)))) (PreH3 : (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L)))) (PreH4 : (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L)))) (PreH5 : (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L)))) (PreH6 : (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L)))) (PreH7 : (retval = (s8_read_lane (0) (vl_pre) (idx) (L)))) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= 32)) (PreH10 : (0 <= idx)) (PreH11 : ((idx + vl_pre ) <= count)) (PreH12 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |->_)
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
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (7 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 7) ”
.

Definition __riscv_vle8_v_i8m2_safety_wit_9 := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (PreH1 : (retval_8 = (s8_read_lane (7) (vl_pre) (idx) (L)))) (PreH2 : (retval_7 = (s8_read_lane (6) (vl_pre) (idx) (L)))) (PreH3 : (retval_6 = (s8_read_lane (5) (vl_pre) (idx) (L)))) (PreH4 : (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L)))) (PreH5 : (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L)))) (PreH6 : (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L)))) (PreH7 : (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L)))) (PreH8 : (retval = (s8_read_lane (0) (vl_pre) (idx) (L)))) (PreH9 : (0 <= vl_pre)) (PreH10 : (vl_pre <= 32)) (PreH11 : (0 <= idx)) (PreH12 : ((idx + vl_pre ) <= count)) (PreH13 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |->_)
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
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (8 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 8) ”
.

Definition __riscv_vle8_v_i8m2_safety_wit_10 := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (PreH1 : (retval_9 = (s8_read_lane (8) (vl_pre) (idx) (L)))) (PreH2 : (retval_8 = (s8_read_lane (7) (vl_pre) (idx) (L)))) (PreH3 : (retval_7 = (s8_read_lane (6) (vl_pre) (idx) (L)))) (PreH4 : (retval_6 = (s8_read_lane (5) (vl_pre) (idx) (L)))) (PreH5 : (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L)))) (PreH6 : (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L)))) (PreH7 : (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L)))) (PreH8 : (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L)))) (PreH9 : (retval = (s8_read_lane (0) (vl_pre) (idx) (L)))) (PreH10 : (0 <= vl_pre)) (PreH11 : (vl_pre <= 32)) (PreH12 : (0 <= idx)) (PreH13 : ((idx + vl_pre ) <= count)) (PreH14 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |->_)
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
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (9 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 9) ”
.

Definition __riscv_vle8_v_i8m2_safety_wit_11 := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (PreH1 : (retval_10 = (s8_read_lane (9) (vl_pre) (idx) (L)))) (PreH2 : (retval_9 = (s8_read_lane (8) (vl_pre) (idx) (L)))) (PreH3 : (retval_8 = (s8_read_lane (7) (vl_pre) (idx) (L)))) (PreH4 : (retval_7 = (s8_read_lane (6) (vl_pre) (idx) (L)))) (PreH5 : (retval_6 = (s8_read_lane (5) (vl_pre) (idx) (L)))) (PreH6 : (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L)))) (PreH7 : (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L)))) (PreH8 : (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L)))) (PreH9 : (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L)))) (PreH10 : (retval = (s8_read_lane (0) (vl_pre) (idx) (L)))) (PreH11 : (0 <= vl_pre)) (PreH12 : (vl_pre <= 32)) (PreH13 : (0 <= idx)) (PreH14 : ((idx + vl_pre ) <= count)) (PreH15 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |->_)
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
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (10 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 10) ”
.

Definition __riscv_vle8_v_i8m2_safety_wit_12 := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (PreH1 : (retval_11 = (s8_read_lane (10) (vl_pre) (idx) (L)))) (PreH2 : (retval_10 = (s8_read_lane (9) (vl_pre) (idx) (L)))) (PreH3 : (retval_9 = (s8_read_lane (8) (vl_pre) (idx) (L)))) (PreH4 : (retval_8 = (s8_read_lane (7) (vl_pre) (idx) (L)))) (PreH5 : (retval_7 = (s8_read_lane (6) (vl_pre) (idx) (L)))) (PreH6 : (retval_6 = (s8_read_lane (5) (vl_pre) (idx) (L)))) (PreH7 : (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L)))) (PreH8 : (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L)))) (PreH9 : (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L)))) (PreH10 : (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L)))) (PreH11 : (retval = (s8_read_lane (0) (vl_pre) (idx) (L)))) (PreH12 : (0 <= vl_pre)) (PreH13 : (vl_pre <= 32)) (PreH14 : (0 <= idx)) (PreH15 : ((idx + vl_pre ) <= count)) (PreH16 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |->_)
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
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (11 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 11) ”
.

Definition __riscv_vle8_v_i8m2_safety_wit_13 := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (PreH1 : (retval_12 = (s8_read_lane (11) (vl_pre) (idx) (L)))) (PreH2 : (retval_11 = (s8_read_lane (10) (vl_pre) (idx) (L)))) (PreH3 : (retval_10 = (s8_read_lane (9) (vl_pre) (idx) (L)))) (PreH4 : (retval_9 = (s8_read_lane (8) (vl_pre) (idx) (L)))) (PreH5 : (retval_8 = (s8_read_lane (7) (vl_pre) (idx) (L)))) (PreH6 : (retval_7 = (s8_read_lane (6) (vl_pre) (idx) (L)))) (PreH7 : (retval_6 = (s8_read_lane (5) (vl_pre) (idx) (L)))) (PreH8 : (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L)))) (PreH9 : (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L)))) (PreH10 : (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L)))) (PreH11 : (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L)))) (PreH12 : (retval = (s8_read_lane (0) (vl_pre) (idx) (L)))) (PreH13 : (0 <= vl_pre)) (PreH14 : (vl_pre <= 32)) (PreH15 : (0 <= idx)) (PreH16 : ((idx + vl_pre ) <= count)) (PreH17 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |->_)
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
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (12 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 12) ”
.

Definition __riscv_vle8_v_i8m2_safety_wit_14 := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (PreH1 : (retval_13 = (s8_read_lane (12) (vl_pre) (idx) (L)))) (PreH2 : (retval_12 = (s8_read_lane (11) (vl_pre) (idx) (L)))) (PreH3 : (retval_11 = (s8_read_lane (10) (vl_pre) (idx) (L)))) (PreH4 : (retval_10 = (s8_read_lane (9) (vl_pre) (idx) (L)))) (PreH5 : (retval_9 = (s8_read_lane (8) (vl_pre) (idx) (L)))) (PreH6 : (retval_8 = (s8_read_lane (7) (vl_pre) (idx) (L)))) (PreH7 : (retval_7 = (s8_read_lane (6) (vl_pre) (idx) (L)))) (PreH8 : (retval_6 = (s8_read_lane (5) (vl_pre) (idx) (L)))) (PreH9 : (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L)))) (PreH10 : (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L)))) (PreH11 : (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L)))) (PreH12 : (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L)))) (PreH13 : (retval = (s8_read_lane (0) (vl_pre) (idx) (L)))) (PreH14 : (0 <= vl_pre)) (PreH15 : (vl_pre <= 32)) (PreH16 : (0 <= idx)) (PreH17 : ((idx + vl_pre ) <= count)) (PreH18 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |->_)
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
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (13 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 13) ”
.

Definition __riscv_vle8_v_i8m2_safety_wit_15 := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (PreH1 : (retval_14 = (s8_read_lane (13) (vl_pre) (idx) (L)))) (PreH2 : (retval_13 = (s8_read_lane (12) (vl_pre) (idx) (L)))) (PreH3 : (retval_12 = (s8_read_lane (11) (vl_pre) (idx) (L)))) (PreH4 : (retval_11 = (s8_read_lane (10) (vl_pre) (idx) (L)))) (PreH5 : (retval_10 = (s8_read_lane (9) (vl_pre) (idx) (L)))) (PreH6 : (retval_9 = (s8_read_lane (8) (vl_pre) (idx) (L)))) (PreH7 : (retval_8 = (s8_read_lane (7) (vl_pre) (idx) (L)))) (PreH8 : (retval_7 = (s8_read_lane (6) (vl_pre) (idx) (L)))) (PreH9 : (retval_6 = (s8_read_lane (5) (vl_pre) (idx) (L)))) (PreH10 : (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L)))) (PreH11 : (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L)))) (PreH12 : (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L)))) (PreH13 : (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L)))) (PreH14 : (retval = (s8_read_lane (0) (vl_pre) (idx) (L)))) (PreH15 : (0 <= vl_pre)) (PreH16 : (vl_pre <= 32)) (PreH17 : (0 <= idx)) (PreH18 : ((idx + vl_pre ) <= count)) (PreH19 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |->_)
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
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (14 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 14) ”
.

Definition __riscv_vle8_v_i8m2_safety_wit_16 := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (PreH1 : (retval_15 = (s8_read_lane (14) (vl_pre) (idx) (L)))) (PreH2 : (retval_14 = (s8_read_lane (13) (vl_pre) (idx) (L)))) (PreH3 : (retval_13 = (s8_read_lane (12) (vl_pre) (idx) (L)))) (PreH4 : (retval_12 = (s8_read_lane (11) (vl_pre) (idx) (L)))) (PreH5 : (retval_11 = (s8_read_lane (10) (vl_pre) (idx) (L)))) (PreH6 : (retval_10 = (s8_read_lane (9) (vl_pre) (idx) (L)))) (PreH7 : (retval_9 = (s8_read_lane (8) (vl_pre) (idx) (L)))) (PreH8 : (retval_8 = (s8_read_lane (7) (vl_pre) (idx) (L)))) (PreH9 : (retval_7 = (s8_read_lane (6) (vl_pre) (idx) (L)))) (PreH10 : (retval_6 = (s8_read_lane (5) (vl_pre) (idx) (L)))) (PreH11 : (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L)))) (PreH12 : (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L)))) (PreH13 : (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L)))) (PreH14 : (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L)))) (PreH15 : (retval = (s8_read_lane (0) (vl_pre) (idx) (L)))) (PreH16 : (0 <= vl_pre)) (PreH17 : (vl_pre <= 32)) (PreH18 : (0 <= idx)) (PreH19 : ((idx + vl_pre ) <= count)) (PreH20 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |->_)
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
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (15 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 15) ”
.

Definition __riscv_vle8_v_i8m2_safety_wit_17 := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (PreH1 : (retval_16 = (s8_read_lane (15) (vl_pre) (idx) (L)))) (PreH2 : (retval_15 = (s8_read_lane (14) (vl_pre) (idx) (L)))) (PreH3 : (retval_14 = (s8_read_lane (13) (vl_pre) (idx) (L)))) (PreH4 : (retval_13 = (s8_read_lane (12) (vl_pre) (idx) (L)))) (PreH5 : (retval_12 = (s8_read_lane (11) (vl_pre) (idx) (L)))) (PreH6 : (retval_11 = (s8_read_lane (10) (vl_pre) (idx) (L)))) (PreH7 : (retval_10 = (s8_read_lane (9) (vl_pre) (idx) (L)))) (PreH8 : (retval_9 = (s8_read_lane (8) (vl_pre) (idx) (L)))) (PreH9 : (retval_8 = (s8_read_lane (7) (vl_pre) (idx) (L)))) (PreH10 : (retval_7 = (s8_read_lane (6) (vl_pre) (idx) (L)))) (PreH11 : (retval_6 = (s8_read_lane (5) (vl_pre) (idx) (L)))) (PreH12 : (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L)))) (PreH13 : (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L)))) (PreH14 : (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L)))) (PreH15 : (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L)))) (PreH16 : (retval = (s8_read_lane (0) (vl_pre) (idx) (L)))) (PreH17 : (0 <= vl_pre)) (PreH18 : (vl_pre <= 32)) (PreH19 : (0 <= idx)) (PreH20 : ((idx + vl_pre ) <= count)) (PreH21 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |->_)
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
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (16 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 16) ”
.

Definition __riscv_vle8_v_i8m2_safety_wit_18 := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (PreH1 : (retval_17 = (s8_read_lane (16) (vl_pre) (idx) (L)))) (PreH2 : (retval_16 = (s8_read_lane (15) (vl_pre) (idx) (L)))) (PreH3 : (retval_15 = (s8_read_lane (14) (vl_pre) (idx) (L)))) (PreH4 : (retval_14 = (s8_read_lane (13) (vl_pre) (idx) (L)))) (PreH5 : (retval_13 = (s8_read_lane (12) (vl_pre) (idx) (L)))) (PreH6 : (retval_12 = (s8_read_lane (11) (vl_pre) (idx) (L)))) (PreH7 : (retval_11 = (s8_read_lane (10) (vl_pre) (idx) (L)))) (PreH8 : (retval_10 = (s8_read_lane (9) (vl_pre) (idx) (L)))) (PreH9 : (retval_9 = (s8_read_lane (8) (vl_pre) (idx) (L)))) (PreH10 : (retval_8 = (s8_read_lane (7) (vl_pre) (idx) (L)))) (PreH11 : (retval_7 = (s8_read_lane (6) (vl_pre) (idx) (L)))) (PreH12 : (retval_6 = (s8_read_lane (5) (vl_pre) (idx) (L)))) (PreH13 : (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L)))) (PreH14 : (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L)))) (PreH15 : (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L)))) (PreH16 : (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L)))) (PreH17 : (retval = (s8_read_lane (0) (vl_pre) (idx) (L)))) (PreH18 : (0 <= vl_pre)) (PreH19 : (vl_pre <= 32)) (PreH20 : (0 <= idx)) (PreH21 : ((idx + vl_pre ) <= count)) (PreH22 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |-> retval_17)
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
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (17 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 17) ”
.

Definition __riscv_vle8_v_i8m2_safety_wit_19 := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (PreH1 : (retval_18 = (s8_read_lane (17) (vl_pre) (idx) (L)))) (PreH2 : (retval_17 = (s8_read_lane (16) (vl_pre) (idx) (L)))) (PreH3 : (retval_16 = (s8_read_lane (15) (vl_pre) (idx) (L)))) (PreH4 : (retval_15 = (s8_read_lane (14) (vl_pre) (idx) (L)))) (PreH5 : (retval_14 = (s8_read_lane (13) (vl_pre) (idx) (L)))) (PreH6 : (retval_13 = (s8_read_lane (12) (vl_pre) (idx) (L)))) (PreH7 : (retval_12 = (s8_read_lane (11) (vl_pre) (idx) (L)))) (PreH8 : (retval_11 = (s8_read_lane (10) (vl_pre) (idx) (L)))) (PreH9 : (retval_10 = (s8_read_lane (9) (vl_pre) (idx) (L)))) (PreH10 : (retval_9 = (s8_read_lane (8) (vl_pre) (idx) (L)))) (PreH11 : (retval_8 = (s8_read_lane (7) (vl_pre) (idx) (L)))) (PreH12 : (retval_7 = (s8_read_lane (6) (vl_pre) (idx) (L)))) (PreH13 : (retval_6 = (s8_read_lane (5) (vl_pre) (idx) (L)))) (PreH14 : (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L)))) (PreH15 : (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L)))) (PreH16 : (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L)))) (PreH17 : (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L)))) (PreH18 : (retval = (s8_read_lane (0) (vl_pre) (idx) (L)))) (PreH19 : (0 <= vl_pre)) (PreH20 : (vl_pre <= 32)) (PreH21 : (0 <= idx)) (PreH22 : ((idx + vl_pre ) <= count)) (PreH23 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |-> retval_17)
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
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (18 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 18) ”
.

Definition __riscv_vle8_v_i8m2_safety_wit_20 := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (PreH1 : (retval_19 = (s8_read_lane (18) (vl_pre) (idx) (L)))) (PreH2 : (retval_18 = (s8_read_lane (17) (vl_pre) (idx) (L)))) (PreH3 : (retval_17 = (s8_read_lane (16) (vl_pre) (idx) (L)))) (PreH4 : (retval_16 = (s8_read_lane (15) (vl_pre) (idx) (L)))) (PreH5 : (retval_15 = (s8_read_lane (14) (vl_pre) (idx) (L)))) (PreH6 : (retval_14 = (s8_read_lane (13) (vl_pre) (idx) (L)))) (PreH7 : (retval_13 = (s8_read_lane (12) (vl_pre) (idx) (L)))) (PreH8 : (retval_12 = (s8_read_lane (11) (vl_pre) (idx) (L)))) (PreH9 : (retval_11 = (s8_read_lane (10) (vl_pre) (idx) (L)))) (PreH10 : (retval_10 = (s8_read_lane (9) (vl_pre) (idx) (L)))) (PreH11 : (retval_9 = (s8_read_lane (8) (vl_pre) (idx) (L)))) (PreH12 : (retval_8 = (s8_read_lane (7) (vl_pre) (idx) (L)))) (PreH13 : (retval_7 = (s8_read_lane (6) (vl_pre) (idx) (L)))) (PreH14 : (retval_6 = (s8_read_lane (5) (vl_pre) (idx) (L)))) (PreH15 : (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L)))) (PreH16 : (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L)))) (PreH17 : (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L)))) (PreH18 : (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L)))) (PreH19 : (retval = (s8_read_lane (0) (vl_pre) (idx) (L)))) (PreH20 : (0 <= vl_pre)) (PreH21 : (vl_pre <= 32)) (PreH22 : (0 <= idx)) (PreH23 : ((idx + vl_pre ) <= count)) (PreH24 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |-> retval_17)
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
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (19 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 19) ”
.

Definition __riscv_vle8_v_i8m2_safety_wit_21 := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (PreH1 : (retval_20 = (s8_read_lane (19) (vl_pre) (idx) (L)))) (PreH2 : (retval_19 = (s8_read_lane (18) (vl_pre) (idx) (L)))) (PreH3 : (retval_18 = (s8_read_lane (17) (vl_pre) (idx) (L)))) (PreH4 : (retval_17 = (s8_read_lane (16) (vl_pre) (idx) (L)))) (PreH5 : (retval_16 = (s8_read_lane (15) (vl_pre) (idx) (L)))) (PreH6 : (retval_15 = (s8_read_lane (14) (vl_pre) (idx) (L)))) (PreH7 : (retval_14 = (s8_read_lane (13) (vl_pre) (idx) (L)))) (PreH8 : (retval_13 = (s8_read_lane (12) (vl_pre) (idx) (L)))) (PreH9 : (retval_12 = (s8_read_lane (11) (vl_pre) (idx) (L)))) (PreH10 : (retval_11 = (s8_read_lane (10) (vl_pre) (idx) (L)))) (PreH11 : (retval_10 = (s8_read_lane (9) (vl_pre) (idx) (L)))) (PreH12 : (retval_9 = (s8_read_lane (8) (vl_pre) (idx) (L)))) (PreH13 : (retval_8 = (s8_read_lane (7) (vl_pre) (idx) (L)))) (PreH14 : (retval_7 = (s8_read_lane (6) (vl_pre) (idx) (L)))) (PreH15 : (retval_6 = (s8_read_lane (5) (vl_pre) (idx) (L)))) (PreH16 : (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L)))) (PreH17 : (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L)))) (PreH18 : (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L)))) (PreH19 : (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L)))) (PreH20 : (retval = (s8_read_lane (0) (vl_pre) (idx) (L)))) (PreH21 : (0 <= vl_pre)) (PreH22 : (vl_pre <= 32)) (PreH23 : (0 <= idx)) (PreH24 : ((idx + vl_pre ) <= count)) (PreH25 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |-> retval_17)
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
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (20 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 20) ”
.

Definition __riscv_vle8_v_i8m2_safety_wit_22 := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (PreH1 : (retval_21 = (s8_read_lane (20) (vl_pre) (idx) (L)))) (PreH2 : (retval_20 = (s8_read_lane (19) (vl_pre) (idx) (L)))) (PreH3 : (retval_19 = (s8_read_lane (18) (vl_pre) (idx) (L)))) (PreH4 : (retval_18 = (s8_read_lane (17) (vl_pre) (idx) (L)))) (PreH5 : (retval_17 = (s8_read_lane (16) (vl_pre) (idx) (L)))) (PreH6 : (retval_16 = (s8_read_lane (15) (vl_pre) (idx) (L)))) (PreH7 : (retval_15 = (s8_read_lane (14) (vl_pre) (idx) (L)))) (PreH8 : (retval_14 = (s8_read_lane (13) (vl_pre) (idx) (L)))) (PreH9 : (retval_13 = (s8_read_lane (12) (vl_pre) (idx) (L)))) (PreH10 : (retval_12 = (s8_read_lane (11) (vl_pre) (idx) (L)))) (PreH11 : (retval_11 = (s8_read_lane (10) (vl_pre) (idx) (L)))) (PreH12 : (retval_10 = (s8_read_lane (9) (vl_pre) (idx) (L)))) (PreH13 : (retval_9 = (s8_read_lane (8) (vl_pre) (idx) (L)))) (PreH14 : (retval_8 = (s8_read_lane (7) (vl_pre) (idx) (L)))) (PreH15 : (retval_7 = (s8_read_lane (6) (vl_pre) (idx) (L)))) (PreH16 : (retval_6 = (s8_read_lane (5) (vl_pre) (idx) (L)))) (PreH17 : (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L)))) (PreH18 : (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L)))) (PreH19 : (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L)))) (PreH20 : (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L)))) (PreH21 : (retval = (s8_read_lane (0) (vl_pre) (idx) (L)))) (PreH22 : (0 <= vl_pre)) (PreH23 : (vl_pre <= 32)) (PreH24 : (0 <= idx)) (PreH25 : ((idx + vl_pre ) <= count)) (PreH26 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |-> retval_17)
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
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (21 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 21) ”
.

Definition __riscv_vle8_v_i8m2_safety_wit_23 := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (PreH1 : (retval_22 = (s8_read_lane (21) (vl_pre) (idx) (L)))) (PreH2 : (retval_21 = (s8_read_lane (20) (vl_pre) (idx) (L)))) (PreH3 : (retval_20 = (s8_read_lane (19) (vl_pre) (idx) (L)))) (PreH4 : (retval_19 = (s8_read_lane (18) (vl_pre) (idx) (L)))) (PreH5 : (retval_18 = (s8_read_lane (17) (vl_pre) (idx) (L)))) (PreH6 : (retval_17 = (s8_read_lane (16) (vl_pre) (idx) (L)))) (PreH7 : (retval_16 = (s8_read_lane (15) (vl_pre) (idx) (L)))) (PreH8 : (retval_15 = (s8_read_lane (14) (vl_pre) (idx) (L)))) (PreH9 : (retval_14 = (s8_read_lane (13) (vl_pre) (idx) (L)))) (PreH10 : (retval_13 = (s8_read_lane (12) (vl_pre) (idx) (L)))) (PreH11 : (retval_12 = (s8_read_lane (11) (vl_pre) (idx) (L)))) (PreH12 : (retval_11 = (s8_read_lane (10) (vl_pre) (idx) (L)))) (PreH13 : (retval_10 = (s8_read_lane (9) (vl_pre) (idx) (L)))) (PreH14 : (retval_9 = (s8_read_lane (8) (vl_pre) (idx) (L)))) (PreH15 : (retval_8 = (s8_read_lane (7) (vl_pre) (idx) (L)))) (PreH16 : (retval_7 = (s8_read_lane (6) (vl_pre) (idx) (L)))) (PreH17 : (retval_6 = (s8_read_lane (5) (vl_pre) (idx) (L)))) (PreH18 : (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L)))) (PreH19 : (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L)))) (PreH20 : (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L)))) (PreH21 : (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L)))) (PreH22 : (retval = (s8_read_lane (0) (vl_pre) (idx) (L)))) (PreH23 : (0 <= vl_pre)) (PreH24 : (vl_pre <= 32)) (PreH25 : (0 <= idx)) (PreH26 : ((idx + vl_pre ) <= count)) (PreH27 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |-> retval_17)
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
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (22 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 22) ”
.

Definition __riscv_vle8_v_i8m2_safety_wit_24 := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (PreH1 : (retval_23 = (s8_read_lane (22) (vl_pre) (idx) (L)))) (PreH2 : (retval_22 = (s8_read_lane (21) (vl_pre) (idx) (L)))) (PreH3 : (retval_21 = (s8_read_lane (20) (vl_pre) (idx) (L)))) (PreH4 : (retval_20 = (s8_read_lane (19) (vl_pre) (idx) (L)))) (PreH5 : (retval_19 = (s8_read_lane (18) (vl_pre) (idx) (L)))) (PreH6 : (retval_18 = (s8_read_lane (17) (vl_pre) (idx) (L)))) (PreH7 : (retval_17 = (s8_read_lane (16) (vl_pre) (idx) (L)))) (PreH8 : (retval_16 = (s8_read_lane (15) (vl_pre) (idx) (L)))) (PreH9 : (retval_15 = (s8_read_lane (14) (vl_pre) (idx) (L)))) (PreH10 : (retval_14 = (s8_read_lane (13) (vl_pre) (idx) (L)))) (PreH11 : (retval_13 = (s8_read_lane (12) (vl_pre) (idx) (L)))) (PreH12 : (retval_12 = (s8_read_lane (11) (vl_pre) (idx) (L)))) (PreH13 : (retval_11 = (s8_read_lane (10) (vl_pre) (idx) (L)))) (PreH14 : (retval_10 = (s8_read_lane (9) (vl_pre) (idx) (L)))) (PreH15 : (retval_9 = (s8_read_lane (8) (vl_pre) (idx) (L)))) (PreH16 : (retval_8 = (s8_read_lane (7) (vl_pre) (idx) (L)))) (PreH17 : (retval_7 = (s8_read_lane (6) (vl_pre) (idx) (L)))) (PreH18 : (retval_6 = (s8_read_lane (5) (vl_pre) (idx) (L)))) (PreH19 : (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L)))) (PreH20 : (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L)))) (PreH21 : (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L)))) (PreH22 : (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L)))) (PreH23 : (retval = (s8_read_lane (0) (vl_pre) (idx) (L)))) (PreH24 : (0 <= vl_pre)) (PreH25 : (vl_pre <= 32)) (PreH26 : (0 <= idx)) (PreH27 : ((idx + vl_pre ) <= count)) (PreH28 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |-> retval_17)
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
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (23 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 23) ”
.

Definition __riscv_vle8_v_i8m2_safety_wit_25 := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (PreH1 : (retval_24 = (s8_read_lane (23) (vl_pre) (idx) (L)))) (PreH2 : (retval_23 = (s8_read_lane (22) (vl_pre) (idx) (L)))) (PreH3 : (retval_22 = (s8_read_lane (21) (vl_pre) (idx) (L)))) (PreH4 : (retval_21 = (s8_read_lane (20) (vl_pre) (idx) (L)))) (PreH5 : (retval_20 = (s8_read_lane (19) (vl_pre) (idx) (L)))) (PreH6 : (retval_19 = (s8_read_lane (18) (vl_pre) (idx) (L)))) (PreH7 : (retval_18 = (s8_read_lane (17) (vl_pre) (idx) (L)))) (PreH8 : (retval_17 = (s8_read_lane (16) (vl_pre) (idx) (L)))) (PreH9 : (retval_16 = (s8_read_lane (15) (vl_pre) (idx) (L)))) (PreH10 : (retval_15 = (s8_read_lane (14) (vl_pre) (idx) (L)))) (PreH11 : (retval_14 = (s8_read_lane (13) (vl_pre) (idx) (L)))) (PreH12 : (retval_13 = (s8_read_lane (12) (vl_pre) (idx) (L)))) (PreH13 : (retval_12 = (s8_read_lane (11) (vl_pre) (idx) (L)))) (PreH14 : (retval_11 = (s8_read_lane (10) (vl_pre) (idx) (L)))) (PreH15 : (retval_10 = (s8_read_lane (9) (vl_pre) (idx) (L)))) (PreH16 : (retval_9 = (s8_read_lane (8) (vl_pre) (idx) (L)))) (PreH17 : (retval_8 = (s8_read_lane (7) (vl_pre) (idx) (L)))) (PreH18 : (retval_7 = (s8_read_lane (6) (vl_pre) (idx) (L)))) (PreH19 : (retval_6 = (s8_read_lane (5) (vl_pre) (idx) (L)))) (PreH20 : (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L)))) (PreH21 : (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L)))) (PreH22 : (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L)))) (PreH23 : (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L)))) (PreH24 : (retval = (s8_read_lane (0) (vl_pre) (idx) (L)))) (PreH25 : (0 <= vl_pre)) (PreH26 : (vl_pre <= 32)) (PreH27 : (0 <= idx)) (PreH28 : ((idx + vl_pre ) <= count)) (PreH29 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |-> retval_17)
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
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (24 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 24) ”
.

Definition __riscv_vle8_v_i8m2_safety_wit_26 := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (PreH1 : (retval_25 = (s8_read_lane (24) (vl_pre) (idx) (L)))) (PreH2 : (retval_24 = (s8_read_lane (23) (vl_pre) (idx) (L)))) (PreH3 : (retval_23 = (s8_read_lane (22) (vl_pre) (idx) (L)))) (PreH4 : (retval_22 = (s8_read_lane (21) (vl_pre) (idx) (L)))) (PreH5 : (retval_21 = (s8_read_lane (20) (vl_pre) (idx) (L)))) (PreH6 : (retval_20 = (s8_read_lane (19) (vl_pre) (idx) (L)))) (PreH7 : (retval_19 = (s8_read_lane (18) (vl_pre) (idx) (L)))) (PreH8 : (retval_18 = (s8_read_lane (17) (vl_pre) (idx) (L)))) (PreH9 : (retval_17 = (s8_read_lane (16) (vl_pre) (idx) (L)))) (PreH10 : (retval_16 = (s8_read_lane (15) (vl_pre) (idx) (L)))) (PreH11 : (retval_15 = (s8_read_lane (14) (vl_pre) (idx) (L)))) (PreH12 : (retval_14 = (s8_read_lane (13) (vl_pre) (idx) (L)))) (PreH13 : (retval_13 = (s8_read_lane (12) (vl_pre) (idx) (L)))) (PreH14 : (retval_12 = (s8_read_lane (11) (vl_pre) (idx) (L)))) (PreH15 : (retval_11 = (s8_read_lane (10) (vl_pre) (idx) (L)))) (PreH16 : (retval_10 = (s8_read_lane (9) (vl_pre) (idx) (L)))) (PreH17 : (retval_9 = (s8_read_lane (8) (vl_pre) (idx) (L)))) (PreH18 : (retval_8 = (s8_read_lane (7) (vl_pre) (idx) (L)))) (PreH19 : (retval_7 = (s8_read_lane (6) (vl_pre) (idx) (L)))) (PreH20 : (retval_6 = (s8_read_lane (5) (vl_pre) (idx) (L)))) (PreH21 : (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L)))) (PreH22 : (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L)))) (PreH23 : (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L)))) (PreH24 : (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L)))) (PreH25 : (retval = (s8_read_lane (0) (vl_pre) (idx) (L)))) (PreH26 : (0 <= vl_pre)) (PreH27 : (vl_pre <= 32)) (PreH28 : (0 <= idx)) (PreH29 : ((idx + vl_pre ) <= count)) (PreH30 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |-> retval_25)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |-> retval_17)
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
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (25 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 25) ”
.

Definition __riscv_vle8_v_i8m2_safety_wit_27 := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (retval_26: Z) (PreH1 : (retval_26 = (s8_read_lane (25) (vl_pre) (idx) (L)))) (PreH2 : (retval_25 = (s8_read_lane (24) (vl_pre) (idx) (L)))) (PreH3 : (retval_24 = (s8_read_lane (23) (vl_pre) (idx) (L)))) (PreH4 : (retval_23 = (s8_read_lane (22) (vl_pre) (idx) (L)))) (PreH5 : (retval_22 = (s8_read_lane (21) (vl_pre) (idx) (L)))) (PreH6 : (retval_21 = (s8_read_lane (20) (vl_pre) (idx) (L)))) (PreH7 : (retval_20 = (s8_read_lane (19) (vl_pre) (idx) (L)))) (PreH8 : (retval_19 = (s8_read_lane (18) (vl_pre) (idx) (L)))) (PreH9 : (retval_18 = (s8_read_lane (17) (vl_pre) (idx) (L)))) (PreH10 : (retval_17 = (s8_read_lane (16) (vl_pre) (idx) (L)))) (PreH11 : (retval_16 = (s8_read_lane (15) (vl_pre) (idx) (L)))) (PreH12 : (retval_15 = (s8_read_lane (14) (vl_pre) (idx) (L)))) (PreH13 : (retval_14 = (s8_read_lane (13) (vl_pre) (idx) (L)))) (PreH14 : (retval_13 = (s8_read_lane (12) (vl_pre) (idx) (L)))) (PreH15 : (retval_12 = (s8_read_lane (11) (vl_pre) (idx) (L)))) (PreH16 : (retval_11 = (s8_read_lane (10) (vl_pre) (idx) (L)))) (PreH17 : (retval_10 = (s8_read_lane (9) (vl_pre) (idx) (L)))) (PreH18 : (retval_9 = (s8_read_lane (8) (vl_pre) (idx) (L)))) (PreH19 : (retval_8 = (s8_read_lane (7) (vl_pre) (idx) (L)))) (PreH20 : (retval_7 = (s8_read_lane (6) (vl_pre) (idx) (L)))) (PreH21 : (retval_6 = (s8_read_lane (5) (vl_pre) (idx) (L)))) (PreH22 : (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L)))) (PreH23 : (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L)))) (PreH24 : (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L)))) (PreH25 : (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L)))) (PreH26 : (retval = (s8_read_lane (0) (vl_pre) (idx) (L)))) (PreH27 : (0 <= vl_pre)) (PreH28 : (vl_pre <= 32)) (PreH29 : (0 <= idx)) (PreH30 : ((idx + vl_pre ) <= count)) (PreH31 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |-> retval_26)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |-> retval_25)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |-> retval_17)
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
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (26 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 26) ”
.

Definition __riscv_vle8_v_i8m2_safety_wit_28 := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (retval_26: Z) (retval_27: Z) (PreH1 : (retval_27 = (s8_read_lane (26) (vl_pre) (idx) (L)))) (PreH2 : (retval_26 = (s8_read_lane (25) (vl_pre) (idx) (L)))) (PreH3 : (retval_25 = (s8_read_lane (24) (vl_pre) (idx) (L)))) (PreH4 : (retval_24 = (s8_read_lane (23) (vl_pre) (idx) (L)))) (PreH5 : (retval_23 = (s8_read_lane (22) (vl_pre) (idx) (L)))) (PreH6 : (retval_22 = (s8_read_lane (21) (vl_pre) (idx) (L)))) (PreH7 : (retval_21 = (s8_read_lane (20) (vl_pre) (idx) (L)))) (PreH8 : (retval_20 = (s8_read_lane (19) (vl_pre) (idx) (L)))) (PreH9 : (retval_19 = (s8_read_lane (18) (vl_pre) (idx) (L)))) (PreH10 : (retval_18 = (s8_read_lane (17) (vl_pre) (idx) (L)))) (PreH11 : (retval_17 = (s8_read_lane (16) (vl_pre) (idx) (L)))) (PreH12 : (retval_16 = (s8_read_lane (15) (vl_pre) (idx) (L)))) (PreH13 : (retval_15 = (s8_read_lane (14) (vl_pre) (idx) (L)))) (PreH14 : (retval_14 = (s8_read_lane (13) (vl_pre) (idx) (L)))) (PreH15 : (retval_13 = (s8_read_lane (12) (vl_pre) (idx) (L)))) (PreH16 : (retval_12 = (s8_read_lane (11) (vl_pre) (idx) (L)))) (PreH17 : (retval_11 = (s8_read_lane (10) (vl_pre) (idx) (L)))) (PreH18 : (retval_10 = (s8_read_lane (9) (vl_pre) (idx) (L)))) (PreH19 : (retval_9 = (s8_read_lane (8) (vl_pre) (idx) (L)))) (PreH20 : (retval_8 = (s8_read_lane (7) (vl_pre) (idx) (L)))) (PreH21 : (retval_7 = (s8_read_lane (6) (vl_pre) (idx) (L)))) (PreH22 : (retval_6 = (s8_read_lane (5) (vl_pre) (idx) (L)))) (PreH23 : (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L)))) (PreH24 : (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L)))) (PreH25 : (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L)))) (PreH26 : (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L)))) (PreH27 : (retval = (s8_read_lane (0) (vl_pre) (idx) (L)))) (PreH28 : (0 <= vl_pre)) (PreH29 : (vl_pre <= 32)) (PreH30 : (0 <= idx)) (PreH31 : ((idx + vl_pre ) <= count)) (PreH32 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |-> retval_27)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |-> retval_26)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |-> retval_25)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |-> retval_17)
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
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (27 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 27) ”
.

Definition __riscv_vle8_v_i8m2_safety_wit_29 := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (retval_26: Z) (retval_27: Z) (retval_28: Z) (PreH1 : (retval_28 = (s8_read_lane (27) (vl_pre) (idx) (L)))) (PreH2 : (retval_27 = (s8_read_lane (26) (vl_pre) (idx) (L)))) (PreH3 : (retval_26 = (s8_read_lane (25) (vl_pre) (idx) (L)))) (PreH4 : (retval_25 = (s8_read_lane (24) (vl_pre) (idx) (L)))) (PreH5 : (retval_24 = (s8_read_lane (23) (vl_pre) (idx) (L)))) (PreH6 : (retval_23 = (s8_read_lane (22) (vl_pre) (idx) (L)))) (PreH7 : (retval_22 = (s8_read_lane (21) (vl_pre) (idx) (L)))) (PreH8 : (retval_21 = (s8_read_lane (20) (vl_pre) (idx) (L)))) (PreH9 : (retval_20 = (s8_read_lane (19) (vl_pre) (idx) (L)))) (PreH10 : (retval_19 = (s8_read_lane (18) (vl_pre) (idx) (L)))) (PreH11 : (retval_18 = (s8_read_lane (17) (vl_pre) (idx) (L)))) (PreH12 : (retval_17 = (s8_read_lane (16) (vl_pre) (idx) (L)))) (PreH13 : (retval_16 = (s8_read_lane (15) (vl_pre) (idx) (L)))) (PreH14 : (retval_15 = (s8_read_lane (14) (vl_pre) (idx) (L)))) (PreH15 : (retval_14 = (s8_read_lane (13) (vl_pre) (idx) (L)))) (PreH16 : (retval_13 = (s8_read_lane (12) (vl_pre) (idx) (L)))) (PreH17 : (retval_12 = (s8_read_lane (11) (vl_pre) (idx) (L)))) (PreH18 : (retval_11 = (s8_read_lane (10) (vl_pre) (idx) (L)))) (PreH19 : (retval_10 = (s8_read_lane (9) (vl_pre) (idx) (L)))) (PreH20 : (retval_9 = (s8_read_lane (8) (vl_pre) (idx) (L)))) (PreH21 : (retval_8 = (s8_read_lane (7) (vl_pre) (idx) (L)))) (PreH22 : (retval_7 = (s8_read_lane (6) (vl_pre) (idx) (L)))) (PreH23 : (retval_6 = (s8_read_lane (5) (vl_pre) (idx) (L)))) (PreH24 : (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L)))) (PreH25 : (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L)))) (PreH26 : (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L)))) (PreH27 : (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L)))) (PreH28 : (retval = (s8_read_lane (0) (vl_pre) (idx) (L)))) (PreH29 : (0 <= vl_pre)) (PreH30 : (vl_pre <= 32)) (PreH31 : (0 <= idx)) (PreH32 : ((idx + vl_pre ) <= count)) (PreH33 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |-> retval_28)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |-> retval_27)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |-> retval_26)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |-> retval_25)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |-> retval_17)
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
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (28 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 28) ”
.

Definition __riscv_vle8_v_i8m2_safety_wit_30 := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (retval_26: Z) (retval_27: Z) (retval_28: Z) (retval_29: Z) (PreH1 : (retval_29 = (s8_read_lane (28) (vl_pre) (idx) (L)))) (PreH2 : (retval_28 = (s8_read_lane (27) (vl_pre) (idx) (L)))) (PreH3 : (retval_27 = (s8_read_lane (26) (vl_pre) (idx) (L)))) (PreH4 : (retval_26 = (s8_read_lane (25) (vl_pre) (idx) (L)))) (PreH5 : (retval_25 = (s8_read_lane (24) (vl_pre) (idx) (L)))) (PreH6 : (retval_24 = (s8_read_lane (23) (vl_pre) (idx) (L)))) (PreH7 : (retval_23 = (s8_read_lane (22) (vl_pre) (idx) (L)))) (PreH8 : (retval_22 = (s8_read_lane (21) (vl_pre) (idx) (L)))) (PreH9 : (retval_21 = (s8_read_lane (20) (vl_pre) (idx) (L)))) (PreH10 : (retval_20 = (s8_read_lane (19) (vl_pre) (idx) (L)))) (PreH11 : (retval_19 = (s8_read_lane (18) (vl_pre) (idx) (L)))) (PreH12 : (retval_18 = (s8_read_lane (17) (vl_pre) (idx) (L)))) (PreH13 : (retval_17 = (s8_read_lane (16) (vl_pre) (idx) (L)))) (PreH14 : (retval_16 = (s8_read_lane (15) (vl_pre) (idx) (L)))) (PreH15 : (retval_15 = (s8_read_lane (14) (vl_pre) (idx) (L)))) (PreH16 : (retval_14 = (s8_read_lane (13) (vl_pre) (idx) (L)))) (PreH17 : (retval_13 = (s8_read_lane (12) (vl_pre) (idx) (L)))) (PreH18 : (retval_12 = (s8_read_lane (11) (vl_pre) (idx) (L)))) (PreH19 : (retval_11 = (s8_read_lane (10) (vl_pre) (idx) (L)))) (PreH20 : (retval_10 = (s8_read_lane (9) (vl_pre) (idx) (L)))) (PreH21 : (retval_9 = (s8_read_lane (8) (vl_pre) (idx) (L)))) (PreH22 : (retval_8 = (s8_read_lane (7) (vl_pre) (idx) (L)))) (PreH23 : (retval_7 = (s8_read_lane (6) (vl_pre) (idx) (L)))) (PreH24 : (retval_6 = (s8_read_lane (5) (vl_pre) (idx) (L)))) (PreH25 : (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L)))) (PreH26 : (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L)))) (PreH27 : (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L)))) (PreH28 : (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L)))) (PreH29 : (retval = (s8_read_lane (0) (vl_pre) (idx) (L)))) (PreH30 : (0 <= vl_pre)) (PreH31 : (vl_pre <= 32)) (PreH32 : (0 <= idx)) (PreH33 : ((idx + vl_pre ) <= count)) (PreH34 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |-> retval_29)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |-> retval_28)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |-> retval_27)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |-> retval_26)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |-> retval_25)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |-> retval_17)
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
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (29 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 29) ”
.

Definition __riscv_vle8_v_i8m2_safety_wit_31 := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (retval_26: Z) (retval_27: Z) (retval_28: Z) (retval_29: Z) (retval_30: Z) (PreH1 : (retval_30 = (s8_read_lane (29) (vl_pre) (idx) (L)))) (PreH2 : (retval_29 = (s8_read_lane (28) (vl_pre) (idx) (L)))) (PreH3 : (retval_28 = (s8_read_lane (27) (vl_pre) (idx) (L)))) (PreH4 : (retval_27 = (s8_read_lane (26) (vl_pre) (idx) (L)))) (PreH5 : (retval_26 = (s8_read_lane (25) (vl_pre) (idx) (L)))) (PreH6 : (retval_25 = (s8_read_lane (24) (vl_pre) (idx) (L)))) (PreH7 : (retval_24 = (s8_read_lane (23) (vl_pre) (idx) (L)))) (PreH8 : (retval_23 = (s8_read_lane (22) (vl_pre) (idx) (L)))) (PreH9 : (retval_22 = (s8_read_lane (21) (vl_pre) (idx) (L)))) (PreH10 : (retval_21 = (s8_read_lane (20) (vl_pre) (idx) (L)))) (PreH11 : (retval_20 = (s8_read_lane (19) (vl_pre) (idx) (L)))) (PreH12 : (retval_19 = (s8_read_lane (18) (vl_pre) (idx) (L)))) (PreH13 : (retval_18 = (s8_read_lane (17) (vl_pre) (idx) (L)))) (PreH14 : (retval_17 = (s8_read_lane (16) (vl_pre) (idx) (L)))) (PreH15 : (retval_16 = (s8_read_lane (15) (vl_pre) (idx) (L)))) (PreH16 : (retval_15 = (s8_read_lane (14) (vl_pre) (idx) (L)))) (PreH17 : (retval_14 = (s8_read_lane (13) (vl_pre) (idx) (L)))) (PreH18 : (retval_13 = (s8_read_lane (12) (vl_pre) (idx) (L)))) (PreH19 : (retval_12 = (s8_read_lane (11) (vl_pre) (idx) (L)))) (PreH20 : (retval_11 = (s8_read_lane (10) (vl_pre) (idx) (L)))) (PreH21 : (retval_10 = (s8_read_lane (9) (vl_pre) (idx) (L)))) (PreH22 : (retval_9 = (s8_read_lane (8) (vl_pre) (idx) (L)))) (PreH23 : (retval_8 = (s8_read_lane (7) (vl_pre) (idx) (L)))) (PreH24 : (retval_7 = (s8_read_lane (6) (vl_pre) (idx) (L)))) (PreH25 : (retval_6 = (s8_read_lane (5) (vl_pre) (idx) (L)))) (PreH26 : (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L)))) (PreH27 : (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L)))) (PreH28 : (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L)))) (PreH29 : (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L)))) (PreH30 : (retval = (s8_read_lane (0) (vl_pre) (idx) (L)))) (PreH31 : (0 <= vl_pre)) (PreH32 : (vl_pre <= 32)) (PreH33 : (0 <= idx)) (PreH34 : ((idx + vl_pre ) <= count)) (PreH35 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |-> retval_30)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |-> retval_29)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |-> retval_28)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |-> retval_27)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |-> retval_26)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |-> retval_25)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |-> retval_17)
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
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (30 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 30) ”
.

Definition __riscv_vle8_v_i8m2_safety_wit_32 := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (retval_26: Z) (retval_27: Z) (retval_28: Z) (retval_29: Z) (retval_30: Z) (retval_31: Z) (PreH1 : (retval_31 = (s8_read_lane (30) (vl_pre) (idx) (L)))) (PreH2 : (retval_30 = (s8_read_lane (29) (vl_pre) (idx) (L)))) (PreH3 : (retval_29 = (s8_read_lane (28) (vl_pre) (idx) (L)))) (PreH4 : (retval_28 = (s8_read_lane (27) (vl_pre) (idx) (L)))) (PreH5 : (retval_27 = (s8_read_lane (26) (vl_pre) (idx) (L)))) (PreH6 : (retval_26 = (s8_read_lane (25) (vl_pre) (idx) (L)))) (PreH7 : (retval_25 = (s8_read_lane (24) (vl_pre) (idx) (L)))) (PreH8 : (retval_24 = (s8_read_lane (23) (vl_pre) (idx) (L)))) (PreH9 : (retval_23 = (s8_read_lane (22) (vl_pre) (idx) (L)))) (PreH10 : (retval_22 = (s8_read_lane (21) (vl_pre) (idx) (L)))) (PreH11 : (retval_21 = (s8_read_lane (20) (vl_pre) (idx) (L)))) (PreH12 : (retval_20 = (s8_read_lane (19) (vl_pre) (idx) (L)))) (PreH13 : (retval_19 = (s8_read_lane (18) (vl_pre) (idx) (L)))) (PreH14 : (retval_18 = (s8_read_lane (17) (vl_pre) (idx) (L)))) (PreH15 : (retval_17 = (s8_read_lane (16) (vl_pre) (idx) (L)))) (PreH16 : (retval_16 = (s8_read_lane (15) (vl_pre) (idx) (L)))) (PreH17 : (retval_15 = (s8_read_lane (14) (vl_pre) (idx) (L)))) (PreH18 : (retval_14 = (s8_read_lane (13) (vl_pre) (idx) (L)))) (PreH19 : (retval_13 = (s8_read_lane (12) (vl_pre) (idx) (L)))) (PreH20 : (retval_12 = (s8_read_lane (11) (vl_pre) (idx) (L)))) (PreH21 : (retval_11 = (s8_read_lane (10) (vl_pre) (idx) (L)))) (PreH22 : (retval_10 = (s8_read_lane (9) (vl_pre) (idx) (L)))) (PreH23 : (retval_9 = (s8_read_lane (8) (vl_pre) (idx) (L)))) (PreH24 : (retval_8 = (s8_read_lane (7) (vl_pre) (idx) (L)))) (PreH25 : (retval_7 = (s8_read_lane (6) (vl_pre) (idx) (L)))) (PreH26 : (retval_6 = (s8_read_lane (5) (vl_pre) (idx) (L)))) (PreH27 : (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L)))) (PreH28 : (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L)))) (PreH29 : (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L)))) (PreH30 : (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L)))) (PreH31 : (retval = (s8_read_lane (0) (vl_pre) (idx) (L)))) (PreH32 : (0 <= vl_pre)) (PreH33 : (vl_pre <= 32)) (PreH34 : (0 <= idx)) (PreH35 : ((idx + vl_pre ) <= count)) (PreH36 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |-> retval_31)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |-> retval_30)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |-> retval_29)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |-> retval_28)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |-> retval_27)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |-> retval_26)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |-> retval_25)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |-> retval_17)
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
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (31 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 31) ”
.

Definition __riscv_vle8_v_i8m2_return_wit_1 := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (retval_26: Z) (retval_27: Z) (retval_28: Z) (retval_29: Z) (retval_30: Z) (retval_31: Z) (retval_32: Z) (record_return: Z) (PreH1 : (retval_32 = (s8_read_lane (31) (vl_pre) (idx) (L)))) (PreH2 : (retval_31 = (s8_read_lane (30) (vl_pre) (idx) (L)))) (PreH3 : (retval_30 = (s8_read_lane (29) (vl_pre) (idx) (L)))) (PreH4 : (retval_29 = (s8_read_lane (28) (vl_pre) (idx) (L)))) (PreH5 : (retval_28 = (s8_read_lane (27) (vl_pre) (idx) (L)))) (PreH6 : (retval_27 = (s8_read_lane (26) (vl_pre) (idx) (L)))) (PreH7 : (retval_26 = (s8_read_lane (25) (vl_pre) (idx) (L)))) (PreH8 : (retval_25 = (s8_read_lane (24) (vl_pre) (idx) (L)))) (PreH9 : (retval_24 = (s8_read_lane (23) (vl_pre) (idx) (L)))) (PreH10 : (retval_23 = (s8_read_lane (22) (vl_pre) (idx) (L)))) (PreH11 : (retval_22 = (s8_read_lane (21) (vl_pre) (idx) (L)))) (PreH12 : (retval_21 = (s8_read_lane (20) (vl_pre) (idx) (L)))) (PreH13 : (retval_20 = (s8_read_lane (19) (vl_pre) (idx) (L)))) (PreH14 : (retval_19 = (s8_read_lane (18) (vl_pre) (idx) (L)))) (PreH15 : (retval_18 = (s8_read_lane (17) (vl_pre) (idx) (L)))) (PreH16 : (retval_17 = (s8_read_lane (16) (vl_pre) (idx) (L)))) (PreH17 : (retval_16 = (s8_read_lane (15) (vl_pre) (idx) (L)))) (PreH18 : (retval_15 = (s8_read_lane (14) (vl_pre) (idx) (L)))) (PreH19 : (retval_14 = (s8_read_lane (13) (vl_pre) (idx) (L)))) (PreH20 : (retval_13 = (s8_read_lane (12) (vl_pre) (idx) (L)))) (PreH21 : (retval_12 = (s8_read_lane (11) (vl_pre) (idx) (L)))) (PreH22 : (retval_11 = (s8_read_lane (10) (vl_pre) (idx) (L)))) (PreH23 : (retval_10 = (s8_read_lane (9) (vl_pre) (idx) (L)))) (PreH24 : (retval_9 = (s8_read_lane (8) (vl_pre) (idx) (L)))) (PreH25 : (retval_8 = (s8_read_lane (7) (vl_pre) (idx) (L)))) (PreH26 : (retval_7 = (s8_read_lane (6) (vl_pre) (idx) (L)))) (PreH27 : (retval_6 = (s8_read_lane (5) (vl_pre) (idx) (L)))) (PreH28 : (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L)))) (PreH29 : (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L)))) (PreH30 : (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L)))) (PreH31 : (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L)))) (PreH32 : (retval = (s8_read_lane (0) (vl_pre) (idx) (L)))) (PreH33 : (0 <= vl_pre)) (PreH34 : (vl_pre <= 32)) (PreH35 : (0 <= idx)) (PreH36 : ((idx + vl_pre ) <= count)) (PreH37 : (p_pre = (base + idx ))) ,
  ((&((record_return)  # "vint8m2_t" ->ₛ "s31")) # Char  |-> retval_32)
  **  ((&((record_return)  # "vint8m2_t" ->ₛ "s30")) # Char  |-> retval_31)
  **  ((&((record_return)  # "vint8m2_t" ->ₛ "s29")) # Char  |-> retval_30)
  **  ((&((record_return)  # "vint8m2_t" ->ₛ "s28")) # Char  |-> retval_29)
  **  ((&((record_return)  # "vint8m2_t" ->ₛ "s27")) # Char  |-> retval_28)
  **  ((&((record_return)  # "vint8m2_t" ->ₛ "s26")) # Char  |-> retval_27)
  **  ((&((record_return)  # "vint8m2_t" ->ₛ "s25")) # Char  |-> retval_26)
  **  ((&((record_return)  # "vint8m2_t" ->ₛ "s24")) # Char  |-> retval_25)
  **  ((&((record_return)  # "vint8m2_t" ->ₛ "s23")) # Char  |-> retval_24)
  **  ((&((record_return)  # "vint8m2_t" ->ₛ "s22")) # Char  |-> retval_23)
  **  ((&((record_return)  # "vint8m2_t" ->ₛ "s21")) # Char  |-> retval_22)
  **  ((&((record_return)  # "vint8m2_t" ->ₛ "s20")) # Char  |-> retval_21)
  **  ((&((record_return)  # "vint8m2_t" ->ₛ "s19")) # Char  |-> retval_20)
  **  ((&((record_return)  # "vint8m2_t" ->ₛ "s18")) # Char  |-> retval_19)
  **  ((&((record_return)  # "vint8m2_t" ->ₛ "s17")) # Char  |-> retval_18)
  **  ((&((record_return)  # "vint8m2_t" ->ₛ "s16")) # Char  |-> retval_17)
  **  ((&((record_return)  # "vint8m2_t" ->ₛ "s15")) # Char  |-> retval_16)
  **  ((&((record_return)  # "vint8m2_t" ->ₛ "s14")) # Char  |-> retval_15)
  **  ((&((record_return)  # "vint8m2_t" ->ₛ "s13")) # Char  |-> retval_14)
  **  ((&((record_return)  # "vint8m2_t" ->ₛ "s12")) # Char  |-> retval_13)
  **  ((&((record_return)  # "vint8m2_t" ->ₛ "s11")) # Char  |-> retval_12)
  **  ((&((record_return)  # "vint8m2_t" ->ₛ "s10")) # Char  |-> retval_11)
  **  ((&((record_return)  # "vint8m2_t" ->ₛ "s9")) # Char  |-> retval_10)
  **  ((&((record_return)  # "vint8m2_t" ->ₛ "s8")) # Char  |-> retval_9)
  **  ((&((record_return)  # "vint8m2_t" ->ₛ "s7")) # Char  |-> retval_8)
  **  ((&((record_return)  # "vint8m2_t" ->ₛ "s6")) # Char  |-> retval_7)
  **  ((&((record_return)  # "vint8m2_t" ->ₛ "s5")) # Char  |-> retval_6)
  **  ((&((record_return)  # "vint8m2_t" ->ₛ "s4")) # Char  |-> retval_5)
  **  ((&((record_return)  # "vint8m2_t" ->ₛ "s3")) # Char  |-> retval_4)
  **  ((&((record_return)  # "vint8m2_t" ->ₛ "s2")) # Char  |-> retval_3)
  **  ((&((record_return)  # "vint8m2_t" ->ₛ "s1")) # Char  |-> retval_2)
  **  ((&((record_return)  # "vint8m2_t" ->ₛ "s0")) # Char  |-> retval)
  **  (CharArray.full base count L )
|--
  (CharArray.full base count L )
  **  ((&((record_return)  # "vint8m2_t" ->ₛ "s0")) # Char  |-> (s8_read_lane (0) (vl_pre) (idx) (L)))
  **  ((&((record_return)  # "vint8m2_t" ->ₛ "s1")) # Char  |-> (s8_read_lane (1) (vl_pre) (idx) (L)))
  **  ((&((record_return)  # "vint8m2_t" ->ₛ "s2")) # Char  |-> (s8_read_lane (2) (vl_pre) (idx) (L)))
  **  ((&((record_return)  # "vint8m2_t" ->ₛ "s3")) # Char  |-> (s8_read_lane (3) (vl_pre) (idx) (L)))
  **  ((&((record_return)  # "vint8m2_t" ->ₛ "s4")) # Char  |-> (s8_read_lane (4) (vl_pre) (idx) (L)))
  **  ((&((record_return)  # "vint8m2_t" ->ₛ "s5")) # Char  |-> (s8_read_lane (5) (vl_pre) (idx) (L)))
  **  ((&((record_return)  # "vint8m2_t" ->ₛ "s6")) # Char  |-> (s8_read_lane (6) (vl_pre) (idx) (L)))
  **  ((&((record_return)  # "vint8m2_t" ->ₛ "s7")) # Char  |-> (s8_read_lane (7) (vl_pre) (idx) (L)))
  **  ((&((record_return)  # "vint8m2_t" ->ₛ "s8")) # Char  |-> (s8_read_lane (8) (vl_pre) (idx) (L)))
  **  ((&((record_return)  # "vint8m2_t" ->ₛ "s9")) # Char  |-> (s8_read_lane (9) (vl_pre) (idx) (L)))
  **  ((&((record_return)  # "vint8m2_t" ->ₛ "s10")) # Char  |-> (s8_read_lane (10) (vl_pre) (idx) (L)))
  **  ((&((record_return)  # "vint8m2_t" ->ₛ "s11")) # Char  |-> (s8_read_lane (11) (vl_pre) (idx) (L)))
  **  ((&((record_return)  # "vint8m2_t" ->ₛ "s12")) # Char  |-> (s8_read_lane (12) (vl_pre) (idx) (L)))
  **  ((&((record_return)  # "vint8m2_t" ->ₛ "s13")) # Char  |-> (s8_read_lane (13) (vl_pre) (idx) (L)))
  **  ((&((record_return)  # "vint8m2_t" ->ₛ "s14")) # Char  |-> (s8_read_lane (14) (vl_pre) (idx) (L)))
  **  ((&((record_return)  # "vint8m2_t" ->ₛ "s15")) # Char  |-> (s8_read_lane (15) (vl_pre) (idx) (L)))
  **  ((&((record_return)  # "vint8m2_t" ->ₛ "s16")) # Char  |-> (s8_read_lane (16) (vl_pre) (idx) (L)))
  **  ((&((record_return)  # "vint8m2_t" ->ₛ "s17")) # Char  |-> (s8_read_lane (17) (vl_pre) (idx) (L)))
  **  ((&((record_return)  # "vint8m2_t" ->ₛ "s18")) # Char  |-> (s8_read_lane (18) (vl_pre) (idx) (L)))
  **  ((&((record_return)  # "vint8m2_t" ->ₛ "s19")) # Char  |-> (s8_read_lane (19) (vl_pre) (idx) (L)))
  **  ((&((record_return)  # "vint8m2_t" ->ₛ "s20")) # Char  |-> (s8_read_lane (20) (vl_pre) (idx) (L)))
  **  ((&((record_return)  # "vint8m2_t" ->ₛ "s21")) # Char  |-> (s8_read_lane (21) (vl_pre) (idx) (L)))
  **  ((&((record_return)  # "vint8m2_t" ->ₛ "s22")) # Char  |-> (s8_read_lane (22) (vl_pre) (idx) (L)))
  **  ((&((record_return)  # "vint8m2_t" ->ₛ "s23")) # Char  |-> (s8_read_lane (23) (vl_pre) (idx) (L)))
  **  ((&((record_return)  # "vint8m2_t" ->ₛ "s24")) # Char  |-> (s8_read_lane (24) (vl_pre) (idx) (L)))
  **  ((&((record_return)  # "vint8m2_t" ->ₛ "s25")) # Char  |-> (s8_read_lane (25) (vl_pre) (idx) (L)))
  **  ((&((record_return)  # "vint8m2_t" ->ₛ "s26")) # Char  |-> (s8_read_lane (26) (vl_pre) (idx) (L)))
  **  ((&((record_return)  # "vint8m2_t" ->ₛ "s27")) # Char  |-> (s8_read_lane (27) (vl_pre) (idx) (L)))
  **  ((&((record_return)  # "vint8m2_t" ->ₛ "s28")) # Char  |-> (s8_read_lane (28) (vl_pre) (idx) (L)))
  **  ((&((record_return)  # "vint8m2_t" ->ₛ "s29")) # Char  |-> (s8_read_lane (29) (vl_pre) (idx) (L)))
  **  ((&((record_return)  # "vint8m2_t" ->ₛ "s30")) # Char  |-> (s8_read_lane (30) (vl_pre) (idx) (L)))
  **  ((&((record_return)  # "vint8m2_t" ->ₛ "s31")) # Char  |-> (s8_read_lane (31) (vl_pre) (idx) (L)))
.

Definition __riscv_vle8_v_i8m2_partial_solve_wit_1_pure := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (PreH1 : (0 <= vl_pre)) (PreH2 : (vl_pre <= 32)) (PreH3 : (0 <= idx)) (PreH4 : ((idx + vl_pre ) <= count)) (PreH5 : (p_pre = (base + idx ))) ,
  (UndefStructPredvint8m2_t ( &( "r" ) ) )
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  (CharArray.full base count L )
|--
  “ (0 <= 0) ” 
  &&  “ (0 < 128) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
.

Definition __riscv_vle8_v_i8m2_partial_solve_wit_1_aux := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (PreH1 : (0 <= vl_pre)) (PreH2 : (vl_pre <= 32)) (PreH3 : (0 <= idx)) (PreH4 : ((idx + vl_pre ) <= count)) (PreH5 : (p_pre = (base + idx ))) ,
  (UndefStructPredvint8m2_t ( &( "r" ) ) )
  **  (CharArray.full base count L )
|--
  “ (0 <= 0) ” 
  &&  “ (0 < 128) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
  &&  (CharArray.full base count L )
  **  (UndefStructPredvint8m2_t ( &( "r" ) ) )
.

Definition __riscv_vle8_v_i8m2_partial_solve_wit_1 := __riscv_vle8_v_i8m2_partial_solve_wit_1_pure -> __riscv_vle8_v_i8m2_partial_solve_wit_1_aux.

Definition __riscv_vle8_v_i8m2_partial_solve_wit_2_pure := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (PreH1 : (retval = (s8_read_lane (0) (vl_pre) (idx) (L)))) (PreH2 : (0 <= vl_pre)) (PreH3 : (vl_pre <= 32)) (PreH4 : (0 <= idx)) (PreH5 : ((idx + vl_pre ) <= count)) (PreH6 : (p_pre = (base + idx ))) ,
  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |->_)
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
  **  (CharArray.full base count L )
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= 1) ” 
  &&  “ (1 < 128) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
.

Definition __riscv_vle8_v_i8m2_partial_solve_wit_2_aux := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (PreH1 : (retval = (s8_read_lane (0) (vl_pre) (idx) (L)))) (PreH2 : (0 <= vl_pre)) (PreH3 : (vl_pre <= 32)) (PreH4 : (0 <= idx)) (PreH5 : ((idx + vl_pre ) <= count)) (PreH6 : (p_pre = (base + idx ))) ,
  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |->_)
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
  **  (CharArray.full base count L )
|--
  “ (0 <= 1) ” 
  &&  “ (1 < 128) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ” 
  &&  “ (retval = (s8_read_lane (0) (vl_pre) (idx) (L))) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
  &&  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |->_)
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

Definition __riscv_vle8_v_i8m2_partial_solve_wit_2 := __riscv_vle8_v_i8m2_partial_solve_wit_2_pure -> __riscv_vle8_v_i8m2_partial_solve_wit_2_aux.

Definition __riscv_vle8_v_i8m2_partial_solve_wit_3_pure := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L)))) (PreH2 : (retval = (s8_read_lane (0) (vl_pre) (idx) (L)))) (PreH3 : (0 <= vl_pre)) (PreH4 : (vl_pre <= 32)) (PreH5 : (0 <= idx)) (PreH6 : ((idx + vl_pre ) <= count)) (PreH7 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |->_)
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
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= 2) ” 
  &&  “ (2 < 128) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
.

Definition __riscv_vle8_v_i8m2_partial_solve_wit_3_aux := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (PreH1 : (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L)))) (PreH2 : (retval = (s8_read_lane (0) (vl_pre) (idx) (L)))) (PreH3 : (0 <= vl_pre)) (PreH4 : (vl_pre <= 32)) (PreH5 : (0 <= idx)) (PreH6 : ((idx + vl_pre ) <= count)) (PreH7 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |->_)
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
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ” 
  &&  “ (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L))) ” 
  &&  “ (retval = (s8_read_lane (0) (vl_pre) (idx) (L))) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
  &&  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |->_)
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

Definition __riscv_vle8_v_i8m2_partial_solve_wit_3 := __riscv_vle8_v_i8m2_partial_solve_wit_3_pure -> __riscv_vle8_v_i8m2_partial_solve_wit_3_aux.

Definition __riscv_vle8_v_i8m2_partial_solve_wit_4_pure := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L)))) (PreH2 : (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L)))) (PreH3 : (retval = (s8_read_lane (0) (vl_pre) (idx) (L)))) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) (PreH6 : (0 <= idx)) (PreH7 : ((idx + vl_pre ) <= count)) (PreH8 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |->_)
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
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= 3) ” 
  &&  “ (3 < 128) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
.

Definition __riscv_vle8_v_i8m2_partial_solve_wit_4_aux := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (PreH1 : (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L)))) (PreH2 : (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L)))) (PreH3 : (retval = (s8_read_lane (0) (vl_pre) (idx) (L)))) (PreH4 : (0 <= vl_pre)) (PreH5 : (vl_pre <= 32)) (PreH6 : (0 <= idx)) (PreH7 : ((idx + vl_pre ) <= count)) (PreH8 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |->_)
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
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ” 
  &&  “ (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L))) ” 
  &&  “ (retval = (s8_read_lane (0) (vl_pre) (idx) (L))) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
  &&  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |->_)
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

Definition __riscv_vle8_v_i8m2_partial_solve_wit_4 := __riscv_vle8_v_i8m2_partial_solve_wit_4_pure -> __riscv_vle8_v_i8m2_partial_solve_wit_4_aux.

Definition __riscv_vle8_v_i8m2_partial_solve_wit_5_pure := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L)))) (PreH2 : (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L)))) (PreH3 : (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L)))) (PreH4 : (retval = (s8_read_lane (0) (vl_pre) (idx) (L)))) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) (PreH7 : (0 <= idx)) (PreH8 : ((idx + vl_pre ) <= count)) (PreH9 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |->_)
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
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= 4) ” 
  &&  “ (4 < 128) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
.

Definition __riscv_vle8_v_i8m2_partial_solve_wit_5_aux := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (PreH1 : (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L)))) (PreH2 : (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L)))) (PreH3 : (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L)))) (PreH4 : (retval = (s8_read_lane (0) (vl_pre) (idx) (L)))) (PreH5 : (0 <= vl_pre)) (PreH6 : (vl_pre <= 32)) (PreH7 : (0 <= idx)) (PreH8 : ((idx + vl_pre ) <= count)) (PreH9 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |->_)
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
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ” 
  &&  “ (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L))) ” 
  &&  “ (retval = (s8_read_lane (0) (vl_pre) (idx) (L))) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
  &&  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |->_)
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

Definition __riscv_vle8_v_i8m2_partial_solve_wit_5 := __riscv_vle8_v_i8m2_partial_solve_wit_5_pure -> __riscv_vle8_v_i8m2_partial_solve_wit_5_aux.

Definition __riscv_vle8_v_i8m2_partial_solve_wit_6_pure := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (PreH1 : (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L)))) (PreH2 : (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L)))) (PreH3 : (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L)))) (PreH4 : (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L)))) (PreH5 : (retval = (s8_read_lane (0) (vl_pre) (idx) (L)))) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= 32)) (PreH8 : (0 <= idx)) (PreH9 : ((idx + vl_pre ) <= count)) (PreH10 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |->_)
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
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= 5) ” 
  &&  “ (5 < 128) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
.

Definition __riscv_vle8_v_i8m2_partial_solve_wit_6_aux := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (PreH1 : (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L)))) (PreH2 : (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L)))) (PreH3 : (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L)))) (PreH4 : (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L)))) (PreH5 : (retval = (s8_read_lane (0) (vl_pre) (idx) (L)))) (PreH6 : (0 <= vl_pre)) (PreH7 : (vl_pre <= 32)) (PreH8 : (0 <= idx)) (PreH9 : ((idx + vl_pre ) <= count)) (PreH10 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |->_)
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
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ” 
  &&  “ (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L))) ” 
  &&  “ (retval = (s8_read_lane (0) (vl_pre) (idx) (L))) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
  &&  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |->_)
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

Definition __riscv_vle8_v_i8m2_partial_solve_wit_6 := __riscv_vle8_v_i8m2_partial_solve_wit_6_pure -> __riscv_vle8_v_i8m2_partial_solve_wit_6_aux.

Definition __riscv_vle8_v_i8m2_partial_solve_wit_7_pure := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (PreH1 : (retval_6 = (s8_read_lane (5) (vl_pre) (idx) (L)))) (PreH2 : (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L)))) (PreH3 : (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L)))) (PreH4 : (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L)))) (PreH5 : (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L)))) (PreH6 : (retval = (s8_read_lane (0) (vl_pre) (idx) (L)))) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 32)) (PreH9 : (0 <= idx)) (PreH10 : ((idx + vl_pre ) <= count)) (PreH11 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |->_)
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
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= 6) ” 
  &&  “ (6 < 128) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
.

Definition __riscv_vle8_v_i8m2_partial_solve_wit_7_aux := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (PreH1 : (retval_6 = (s8_read_lane (5) (vl_pre) (idx) (L)))) (PreH2 : (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L)))) (PreH3 : (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L)))) (PreH4 : (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L)))) (PreH5 : (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L)))) (PreH6 : (retval = (s8_read_lane (0) (vl_pre) (idx) (L)))) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 32)) (PreH9 : (0 <= idx)) (PreH10 : ((idx + vl_pre ) <= count)) (PreH11 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |->_)
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
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ” 
  &&  “ (retval_6 = (s8_read_lane (5) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L))) ” 
  &&  “ (retval = (s8_read_lane (0) (vl_pre) (idx) (L))) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
  &&  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |->_)
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

Definition __riscv_vle8_v_i8m2_partial_solve_wit_7 := __riscv_vle8_v_i8m2_partial_solve_wit_7_pure -> __riscv_vle8_v_i8m2_partial_solve_wit_7_aux.

Definition __riscv_vle8_v_i8m2_partial_solve_wit_8_pure := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (PreH1 : (retval_7 = (s8_read_lane (6) (vl_pre) (idx) (L)))) (PreH2 : (retval_6 = (s8_read_lane (5) (vl_pre) (idx) (L)))) (PreH3 : (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L)))) (PreH4 : (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L)))) (PreH5 : (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L)))) (PreH6 : (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L)))) (PreH7 : (retval = (s8_read_lane (0) (vl_pre) (idx) (L)))) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= 32)) (PreH10 : (0 <= idx)) (PreH11 : ((idx + vl_pre ) <= count)) (PreH12 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |->_)
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
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= 7) ” 
  &&  “ (7 < 128) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
.

Definition __riscv_vle8_v_i8m2_partial_solve_wit_8_aux := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (PreH1 : (retval_7 = (s8_read_lane (6) (vl_pre) (idx) (L)))) (PreH2 : (retval_6 = (s8_read_lane (5) (vl_pre) (idx) (L)))) (PreH3 : (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L)))) (PreH4 : (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L)))) (PreH5 : (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L)))) (PreH6 : (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L)))) (PreH7 : (retval = (s8_read_lane (0) (vl_pre) (idx) (L)))) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= 32)) (PreH10 : (0 <= idx)) (PreH11 : ((idx + vl_pre ) <= count)) (PreH12 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |->_)
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
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ” 
  &&  “ (retval_7 = (s8_read_lane (6) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_6 = (s8_read_lane (5) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L))) ” 
  &&  “ (retval = (s8_read_lane (0) (vl_pre) (idx) (L))) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
  &&  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |->_)
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

Definition __riscv_vle8_v_i8m2_partial_solve_wit_8 := __riscv_vle8_v_i8m2_partial_solve_wit_8_pure -> __riscv_vle8_v_i8m2_partial_solve_wit_8_aux.

Definition __riscv_vle8_v_i8m2_partial_solve_wit_9_pure := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (PreH1 : (retval_8 = (s8_read_lane (7) (vl_pre) (idx) (L)))) (PreH2 : (retval_7 = (s8_read_lane (6) (vl_pre) (idx) (L)))) (PreH3 : (retval_6 = (s8_read_lane (5) (vl_pre) (idx) (L)))) (PreH4 : (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L)))) (PreH5 : (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L)))) (PreH6 : (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L)))) (PreH7 : (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L)))) (PreH8 : (retval = (s8_read_lane (0) (vl_pre) (idx) (L)))) (PreH9 : (0 <= vl_pre)) (PreH10 : (vl_pre <= 32)) (PreH11 : (0 <= idx)) (PreH12 : ((idx + vl_pre ) <= count)) (PreH13 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |->_)
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
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= 8) ” 
  &&  “ (8 < 128) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
.

Definition __riscv_vle8_v_i8m2_partial_solve_wit_9_aux := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (PreH1 : (retval_8 = (s8_read_lane (7) (vl_pre) (idx) (L)))) (PreH2 : (retval_7 = (s8_read_lane (6) (vl_pre) (idx) (L)))) (PreH3 : (retval_6 = (s8_read_lane (5) (vl_pre) (idx) (L)))) (PreH4 : (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L)))) (PreH5 : (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L)))) (PreH6 : (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L)))) (PreH7 : (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L)))) (PreH8 : (retval = (s8_read_lane (0) (vl_pre) (idx) (L)))) (PreH9 : (0 <= vl_pre)) (PreH10 : (vl_pre <= 32)) (PreH11 : (0 <= idx)) (PreH12 : ((idx + vl_pre ) <= count)) (PreH13 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |->_)
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
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ” 
  &&  “ (retval_8 = (s8_read_lane (7) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_7 = (s8_read_lane (6) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_6 = (s8_read_lane (5) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L))) ” 
  &&  “ (retval = (s8_read_lane (0) (vl_pre) (idx) (L))) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
  &&  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |->_)
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

Definition __riscv_vle8_v_i8m2_partial_solve_wit_9 := __riscv_vle8_v_i8m2_partial_solve_wit_9_pure -> __riscv_vle8_v_i8m2_partial_solve_wit_9_aux.

Definition __riscv_vle8_v_i8m2_partial_solve_wit_10_pure := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (PreH1 : (retval_9 = (s8_read_lane (8) (vl_pre) (idx) (L)))) (PreH2 : (retval_8 = (s8_read_lane (7) (vl_pre) (idx) (L)))) (PreH3 : (retval_7 = (s8_read_lane (6) (vl_pre) (idx) (L)))) (PreH4 : (retval_6 = (s8_read_lane (5) (vl_pre) (idx) (L)))) (PreH5 : (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L)))) (PreH6 : (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L)))) (PreH7 : (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L)))) (PreH8 : (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L)))) (PreH9 : (retval = (s8_read_lane (0) (vl_pre) (idx) (L)))) (PreH10 : (0 <= vl_pre)) (PreH11 : (vl_pre <= 32)) (PreH12 : (0 <= idx)) (PreH13 : ((idx + vl_pre ) <= count)) (PreH14 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |->_)
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
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= 9) ” 
  &&  “ (9 < 128) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
.

Definition __riscv_vle8_v_i8m2_partial_solve_wit_10_aux := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (PreH1 : (retval_9 = (s8_read_lane (8) (vl_pre) (idx) (L)))) (PreH2 : (retval_8 = (s8_read_lane (7) (vl_pre) (idx) (L)))) (PreH3 : (retval_7 = (s8_read_lane (6) (vl_pre) (idx) (L)))) (PreH4 : (retval_6 = (s8_read_lane (5) (vl_pre) (idx) (L)))) (PreH5 : (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L)))) (PreH6 : (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L)))) (PreH7 : (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L)))) (PreH8 : (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L)))) (PreH9 : (retval = (s8_read_lane (0) (vl_pre) (idx) (L)))) (PreH10 : (0 <= vl_pre)) (PreH11 : (vl_pre <= 32)) (PreH12 : (0 <= idx)) (PreH13 : ((idx + vl_pre ) <= count)) (PreH14 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |->_)
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
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ” 
  &&  “ (retval_9 = (s8_read_lane (8) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_8 = (s8_read_lane (7) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_7 = (s8_read_lane (6) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_6 = (s8_read_lane (5) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L))) ” 
  &&  “ (retval = (s8_read_lane (0) (vl_pre) (idx) (L))) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
  &&  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |->_)
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

Definition __riscv_vle8_v_i8m2_partial_solve_wit_10 := __riscv_vle8_v_i8m2_partial_solve_wit_10_pure -> __riscv_vle8_v_i8m2_partial_solve_wit_10_aux.

Definition __riscv_vle8_v_i8m2_partial_solve_wit_11_pure := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (PreH1 : (retval_10 = (s8_read_lane (9) (vl_pre) (idx) (L)))) (PreH2 : (retval_9 = (s8_read_lane (8) (vl_pre) (idx) (L)))) (PreH3 : (retval_8 = (s8_read_lane (7) (vl_pre) (idx) (L)))) (PreH4 : (retval_7 = (s8_read_lane (6) (vl_pre) (idx) (L)))) (PreH5 : (retval_6 = (s8_read_lane (5) (vl_pre) (idx) (L)))) (PreH6 : (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L)))) (PreH7 : (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L)))) (PreH8 : (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L)))) (PreH9 : (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L)))) (PreH10 : (retval = (s8_read_lane (0) (vl_pre) (idx) (L)))) (PreH11 : (0 <= vl_pre)) (PreH12 : (vl_pre <= 32)) (PreH13 : (0 <= idx)) (PreH14 : ((idx + vl_pre ) <= count)) (PreH15 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |->_)
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
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= 10) ” 
  &&  “ (10 < 128) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
.

Definition __riscv_vle8_v_i8m2_partial_solve_wit_11_aux := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (PreH1 : (retval_10 = (s8_read_lane (9) (vl_pre) (idx) (L)))) (PreH2 : (retval_9 = (s8_read_lane (8) (vl_pre) (idx) (L)))) (PreH3 : (retval_8 = (s8_read_lane (7) (vl_pre) (idx) (L)))) (PreH4 : (retval_7 = (s8_read_lane (6) (vl_pre) (idx) (L)))) (PreH5 : (retval_6 = (s8_read_lane (5) (vl_pre) (idx) (L)))) (PreH6 : (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L)))) (PreH7 : (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L)))) (PreH8 : (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L)))) (PreH9 : (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L)))) (PreH10 : (retval = (s8_read_lane (0) (vl_pre) (idx) (L)))) (PreH11 : (0 <= vl_pre)) (PreH12 : (vl_pre <= 32)) (PreH13 : (0 <= idx)) (PreH14 : ((idx + vl_pre ) <= count)) (PreH15 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |->_)
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
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ” 
  &&  “ (retval_10 = (s8_read_lane (9) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_9 = (s8_read_lane (8) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_8 = (s8_read_lane (7) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_7 = (s8_read_lane (6) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_6 = (s8_read_lane (5) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L))) ” 
  &&  “ (retval = (s8_read_lane (0) (vl_pre) (idx) (L))) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
  &&  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |->_)
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

Definition __riscv_vle8_v_i8m2_partial_solve_wit_11 := __riscv_vle8_v_i8m2_partial_solve_wit_11_pure -> __riscv_vle8_v_i8m2_partial_solve_wit_11_aux.

Definition __riscv_vle8_v_i8m2_partial_solve_wit_12_pure := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (PreH1 : (retval_11 = (s8_read_lane (10) (vl_pre) (idx) (L)))) (PreH2 : (retval_10 = (s8_read_lane (9) (vl_pre) (idx) (L)))) (PreH3 : (retval_9 = (s8_read_lane (8) (vl_pre) (idx) (L)))) (PreH4 : (retval_8 = (s8_read_lane (7) (vl_pre) (idx) (L)))) (PreH5 : (retval_7 = (s8_read_lane (6) (vl_pre) (idx) (L)))) (PreH6 : (retval_6 = (s8_read_lane (5) (vl_pre) (idx) (L)))) (PreH7 : (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L)))) (PreH8 : (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L)))) (PreH9 : (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L)))) (PreH10 : (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L)))) (PreH11 : (retval = (s8_read_lane (0) (vl_pre) (idx) (L)))) (PreH12 : (0 <= vl_pre)) (PreH13 : (vl_pre <= 32)) (PreH14 : (0 <= idx)) (PreH15 : ((idx + vl_pre ) <= count)) (PreH16 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |->_)
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
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= 11) ” 
  &&  “ (11 < 128) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
.

Definition __riscv_vle8_v_i8m2_partial_solve_wit_12_aux := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (PreH1 : (retval_11 = (s8_read_lane (10) (vl_pre) (idx) (L)))) (PreH2 : (retval_10 = (s8_read_lane (9) (vl_pre) (idx) (L)))) (PreH3 : (retval_9 = (s8_read_lane (8) (vl_pre) (idx) (L)))) (PreH4 : (retval_8 = (s8_read_lane (7) (vl_pre) (idx) (L)))) (PreH5 : (retval_7 = (s8_read_lane (6) (vl_pre) (idx) (L)))) (PreH6 : (retval_6 = (s8_read_lane (5) (vl_pre) (idx) (L)))) (PreH7 : (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L)))) (PreH8 : (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L)))) (PreH9 : (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L)))) (PreH10 : (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L)))) (PreH11 : (retval = (s8_read_lane (0) (vl_pre) (idx) (L)))) (PreH12 : (0 <= vl_pre)) (PreH13 : (vl_pre <= 32)) (PreH14 : (0 <= idx)) (PreH15 : ((idx + vl_pre ) <= count)) (PreH16 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |->_)
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
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ” 
  &&  “ (retval_11 = (s8_read_lane (10) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_10 = (s8_read_lane (9) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_9 = (s8_read_lane (8) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_8 = (s8_read_lane (7) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_7 = (s8_read_lane (6) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_6 = (s8_read_lane (5) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L))) ” 
  &&  “ (retval = (s8_read_lane (0) (vl_pre) (idx) (L))) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
  &&  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |->_)
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

Definition __riscv_vle8_v_i8m2_partial_solve_wit_12 := __riscv_vle8_v_i8m2_partial_solve_wit_12_pure -> __riscv_vle8_v_i8m2_partial_solve_wit_12_aux.

Definition __riscv_vle8_v_i8m2_partial_solve_wit_13_pure := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (PreH1 : (retval_12 = (s8_read_lane (11) (vl_pre) (idx) (L)))) (PreH2 : (retval_11 = (s8_read_lane (10) (vl_pre) (idx) (L)))) (PreH3 : (retval_10 = (s8_read_lane (9) (vl_pre) (idx) (L)))) (PreH4 : (retval_9 = (s8_read_lane (8) (vl_pre) (idx) (L)))) (PreH5 : (retval_8 = (s8_read_lane (7) (vl_pre) (idx) (L)))) (PreH6 : (retval_7 = (s8_read_lane (6) (vl_pre) (idx) (L)))) (PreH7 : (retval_6 = (s8_read_lane (5) (vl_pre) (idx) (L)))) (PreH8 : (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L)))) (PreH9 : (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L)))) (PreH10 : (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L)))) (PreH11 : (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L)))) (PreH12 : (retval = (s8_read_lane (0) (vl_pre) (idx) (L)))) (PreH13 : (0 <= vl_pre)) (PreH14 : (vl_pre <= 32)) (PreH15 : (0 <= idx)) (PreH16 : ((idx + vl_pre ) <= count)) (PreH17 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |->_)
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
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= 12) ” 
  &&  “ (12 < 128) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
.

Definition __riscv_vle8_v_i8m2_partial_solve_wit_13_aux := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (PreH1 : (retval_12 = (s8_read_lane (11) (vl_pre) (idx) (L)))) (PreH2 : (retval_11 = (s8_read_lane (10) (vl_pre) (idx) (L)))) (PreH3 : (retval_10 = (s8_read_lane (9) (vl_pre) (idx) (L)))) (PreH4 : (retval_9 = (s8_read_lane (8) (vl_pre) (idx) (L)))) (PreH5 : (retval_8 = (s8_read_lane (7) (vl_pre) (idx) (L)))) (PreH6 : (retval_7 = (s8_read_lane (6) (vl_pre) (idx) (L)))) (PreH7 : (retval_6 = (s8_read_lane (5) (vl_pre) (idx) (L)))) (PreH8 : (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L)))) (PreH9 : (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L)))) (PreH10 : (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L)))) (PreH11 : (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L)))) (PreH12 : (retval = (s8_read_lane (0) (vl_pre) (idx) (L)))) (PreH13 : (0 <= vl_pre)) (PreH14 : (vl_pre <= 32)) (PreH15 : (0 <= idx)) (PreH16 : ((idx + vl_pre ) <= count)) (PreH17 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |->_)
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
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ” 
  &&  “ (retval_12 = (s8_read_lane (11) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_11 = (s8_read_lane (10) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_10 = (s8_read_lane (9) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_9 = (s8_read_lane (8) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_8 = (s8_read_lane (7) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_7 = (s8_read_lane (6) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_6 = (s8_read_lane (5) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L))) ” 
  &&  “ (retval = (s8_read_lane (0) (vl_pre) (idx) (L))) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
  &&  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |->_)
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

Definition __riscv_vle8_v_i8m2_partial_solve_wit_13 := __riscv_vle8_v_i8m2_partial_solve_wit_13_pure -> __riscv_vle8_v_i8m2_partial_solve_wit_13_aux.

Definition __riscv_vle8_v_i8m2_partial_solve_wit_14_pure := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (PreH1 : (retval_13 = (s8_read_lane (12) (vl_pre) (idx) (L)))) (PreH2 : (retval_12 = (s8_read_lane (11) (vl_pre) (idx) (L)))) (PreH3 : (retval_11 = (s8_read_lane (10) (vl_pre) (idx) (L)))) (PreH4 : (retval_10 = (s8_read_lane (9) (vl_pre) (idx) (L)))) (PreH5 : (retval_9 = (s8_read_lane (8) (vl_pre) (idx) (L)))) (PreH6 : (retval_8 = (s8_read_lane (7) (vl_pre) (idx) (L)))) (PreH7 : (retval_7 = (s8_read_lane (6) (vl_pre) (idx) (L)))) (PreH8 : (retval_6 = (s8_read_lane (5) (vl_pre) (idx) (L)))) (PreH9 : (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L)))) (PreH10 : (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L)))) (PreH11 : (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L)))) (PreH12 : (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L)))) (PreH13 : (retval = (s8_read_lane (0) (vl_pre) (idx) (L)))) (PreH14 : (0 <= vl_pre)) (PreH15 : (vl_pre <= 32)) (PreH16 : (0 <= idx)) (PreH17 : ((idx + vl_pre ) <= count)) (PreH18 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |->_)
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
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= 13) ” 
  &&  “ (13 < 128) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
.

Definition __riscv_vle8_v_i8m2_partial_solve_wit_14_aux := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (PreH1 : (retval_13 = (s8_read_lane (12) (vl_pre) (idx) (L)))) (PreH2 : (retval_12 = (s8_read_lane (11) (vl_pre) (idx) (L)))) (PreH3 : (retval_11 = (s8_read_lane (10) (vl_pre) (idx) (L)))) (PreH4 : (retval_10 = (s8_read_lane (9) (vl_pre) (idx) (L)))) (PreH5 : (retval_9 = (s8_read_lane (8) (vl_pre) (idx) (L)))) (PreH6 : (retval_8 = (s8_read_lane (7) (vl_pre) (idx) (L)))) (PreH7 : (retval_7 = (s8_read_lane (6) (vl_pre) (idx) (L)))) (PreH8 : (retval_6 = (s8_read_lane (5) (vl_pre) (idx) (L)))) (PreH9 : (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L)))) (PreH10 : (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L)))) (PreH11 : (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L)))) (PreH12 : (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L)))) (PreH13 : (retval = (s8_read_lane (0) (vl_pre) (idx) (L)))) (PreH14 : (0 <= vl_pre)) (PreH15 : (vl_pre <= 32)) (PreH16 : (0 <= idx)) (PreH17 : ((idx + vl_pre ) <= count)) (PreH18 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |->_)
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
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ” 
  &&  “ (retval_13 = (s8_read_lane (12) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_12 = (s8_read_lane (11) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_11 = (s8_read_lane (10) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_10 = (s8_read_lane (9) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_9 = (s8_read_lane (8) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_8 = (s8_read_lane (7) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_7 = (s8_read_lane (6) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_6 = (s8_read_lane (5) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L))) ” 
  &&  “ (retval = (s8_read_lane (0) (vl_pre) (idx) (L))) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
  &&  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |->_)
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

Definition __riscv_vle8_v_i8m2_partial_solve_wit_14 := __riscv_vle8_v_i8m2_partial_solve_wit_14_pure -> __riscv_vle8_v_i8m2_partial_solve_wit_14_aux.

Definition __riscv_vle8_v_i8m2_partial_solve_wit_15_pure := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (PreH1 : (retval_14 = (s8_read_lane (13) (vl_pre) (idx) (L)))) (PreH2 : (retval_13 = (s8_read_lane (12) (vl_pre) (idx) (L)))) (PreH3 : (retval_12 = (s8_read_lane (11) (vl_pre) (idx) (L)))) (PreH4 : (retval_11 = (s8_read_lane (10) (vl_pre) (idx) (L)))) (PreH5 : (retval_10 = (s8_read_lane (9) (vl_pre) (idx) (L)))) (PreH6 : (retval_9 = (s8_read_lane (8) (vl_pre) (idx) (L)))) (PreH7 : (retval_8 = (s8_read_lane (7) (vl_pre) (idx) (L)))) (PreH8 : (retval_7 = (s8_read_lane (6) (vl_pre) (idx) (L)))) (PreH9 : (retval_6 = (s8_read_lane (5) (vl_pre) (idx) (L)))) (PreH10 : (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L)))) (PreH11 : (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L)))) (PreH12 : (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L)))) (PreH13 : (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L)))) (PreH14 : (retval = (s8_read_lane (0) (vl_pre) (idx) (L)))) (PreH15 : (0 <= vl_pre)) (PreH16 : (vl_pre <= 32)) (PreH17 : (0 <= idx)) (PreH18 : ((idx + vl_pre ) <= count)) (PreH19 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |->_)
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
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= 14) ” 
  &&  “ (14 < 128) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
.

Definition __riscv_vle8_v_i8m2_partial_solve_wit_15_aux := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (PreH1 : (retval_14 = (s8_read_lane (13) (vl_pre) (idx) (L)))) (PreH2 : (retval_13 = (s8_read_lane (12) (vl_pre) (idx) (L)))) (PreH3 : (retval_12 = (s8_read_lane (11) (vl_pre) (idx) (L)))) (PreH4 : (retval_11 = (s8_read_lane (10) (vl_pre) (idx) (L)))) (PreH5 : (retval_10 = (s8_read_lane (9) (vl_pre) (idx) (L)))) (PreH6 : (retval_9 = (s8_read_lane (8) (vl_pre) (idx) (L)))) (PreH7 : (retval_8 = (s8_read_lane (7) (vl_pre) (idx) (L)))) (PreH8 : (retval_7 = (s8_read_lane (6) (vl_pre) (idx) (L)))) (PreH9 : (retval_6 = (s8_read_lane (5) (vl_pre) (idx) (L)))) (PreH10 : (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L)))) (PreH11 : (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L)))) (PreH12 : (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L)))) (PreH13 : (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L)))) (PreH14 : (retval = (s8_read_lane (0) (vl_pre) (idx) (L)))) (PreH15 : (0 <= vl_pre)) (PreH16 : (vl_pre <= 32)) (PreH17 : (0 <= idx)) (PreH18 : ((idx + vl_pre ) <= count)) (PreH19 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |->_)
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
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ” 
  &&  “ (retval_14 = (s8_read_lane (13) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_13 = (s8_read_lane (12) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_12 = (s8_read_lane (11) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_11 = (s8_read_lane (10) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_10 = (s8_read_lane (9) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_9 = (s8_read_lane (8) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_8 = (s8_read_lane (7) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_7 = (s8_read_lane (6) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_6 = (s8_read_lane (5) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L))) ” 
  &&  “ (retval = (s8_read_lane (0) (vl_pre) (idx) (L))) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
  &&  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |->_)
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

Definition __riscv_vle8_v_i8m2_partial_solve_wit_15 := __riscv_vle8_v_i8m2_partial_solve_wit_15_pure -> __riscv_vle8_v_i8m2_partial_solve_wit_15_aux.

Definition __riscv_vle8_v_i8m2_partial_solve_wit_16_pure := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (PreH1 : (retval_15 = (s8_read_lane (14) (vl_pre) (idx) (L)))) (PreH2 : (retval_14 = (s8_read_lane (13) (vl_pre) (idx) (L)))) (PreH3 : (retval_13 = (s8_read_lane (12) (vl_pre) (idx) (L)))) (PreH4 : (retval_12 = (s8_read_lane (11) (vl_pre) (idx) (L)))) (PreH5 : (retval_11 = (s8_read_lane (10) (vl_pre) (idx) (L)))) (PreH6 : (retval_10 = (s8_read_lane (9) (vl_pre) (idx) (L)))) (PreH7 : (retval_9 = (s8_read_lane (8) (vl_pre) (idx) (L)))) (PreH8 : (retval_8 = (s8_read_lane (7) (vl_pre) (idx) (L)))) (PreH9 : (retval_7 = (s8_read_lane (6) (vl_pre) (idx) (L)))) (PreH10 : (retval_6 = (s8_read_lane (5) (vl_pre) (idx) (L)))) (PreH11 : (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L)))) (PreH12 : (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L)))) (PreH13 : (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L)))) (PreH14 : (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L)))) (PreH15 : (retval = (s8_read_lane (0) (vl_pre) (idx) (L)))) (PreH16 : (0 <= vl_pre)) (PreH17 : (vl_pre <= 32)) (PreH18 : (0 <= idx)) (PreH19 : ((idx + vl_pre ) <= count)) (PreH20 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |->_)
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
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= 15) ” 
  &&  “ (15 < 128) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
.

Definition __riscv_vle8_v_i8m2_partial_solve_wit_16_aux := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (PreH1 : (retval_15 = (s8_read_lane (14) (vl_pre) (idx) (L)))) (PreH2 : (retval_14 = (s8_read_lane (13) (vl_pre) (idx) (L)))) (PreH3 : (retval_13 = (s8_read_lane (12) (vl_pre) (idx) (L)))) (PreH4 : (retval_12 = (s8_read_lane (11) (vl_pre) (idx) (L)))) (PreH5 : (retval_11 = (s8_read_lane (10) (vl_pre) (idx) (L)))) (PreH6 : (retval_10 = (s8_read_lane (9) (vl_pre) (idx) (L)))) (PreH7 : (retval_9 = (s8_read_lane (8) (vl_pre) (idx) (L)))) (PreH8 : (retval_8 = (s8_read_lane (7) (vl_pre) (idx) (L)))) (PreH9 : (retval_7 = (s8_read_lane (6) (vl_pre) (idx) (L)))) (PreH10 : (retval_6 = (s8_read_lane (5) (vl_pre) (idx) (L)))) (PreH11 : (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L)))) (PreH12 : (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L)))) (PreH13 : (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L)))) (PreH14 : (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L)))) (PreH15 : (retval = (s8_read_lane (0) (vl_pre) (idx) (L)))) (PreH16 : (0 <= vl_pre)) (PreH17 : (vl_pre <= 32)) (PreH18 : (0 <= idx)) (PreH19 : ((idx + vl_pre ) <= count)) (PreH20 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |->_)
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
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ” 
  &&  “ (retval_15 = (s8_read_lane (14) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_14 = (s8_read_lane (13) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_13 = (s8_read_lane (12) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_12 = (s8_read_lane (11) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_11 = (s8_read_lane (10) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_10 = (s8_read_lane (9) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_9 = (s8_read_lane (8) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_8 = (s8_read_lane (7) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_7 = (s8_read_lane (6) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_6 = (s8_read_lane (5) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L))) ” 
  &&  “ (retval = (s8_read_lane (0) (vl_pre) (idx) (L))) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
  &&  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |->_)
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

Definition __riscv_vle8_v_i8m2_partial_solve_wit_16 := __riscv_vle8_v_i8m2_partial_solve_wit_16_pure -> __riscv_vle8_v_i8m2_partial_solve_wit_16_aux.

Definition __riscv_vle8_v_i8m2_partial_solve_wit_17_pure := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (PreH1 : (retval_16 = (s8_read_lane (15) (vl_pre) (idx) (L)))) (PreH2 : (retval_15 = (s8_read_lane (14) (vl_pre) (idx) (L)))) (PreH3 : (retval_14 = (s8_read_lane (13) (vl_pre) (idx) (L)))) (PreH4 : (retval_13 = (s8_read_lane (12) (vl_pre) (idx) (L)))) (PreH5 : (retval_12 = (s8_read_lane (11) (vl_pre) (idx) (L)))) (PreH6 : (retval_11 = (s8_read_lane (10) (vl_pre) (idx) (L)))) (PreH7 : (retval_10 = (s8_read_lane (9) (vl_pre) (idx) (L)))) (PreH8 : (retval_9 = (s8_read_lane (8) (vl_pre) (idx) (L)))) (PreH9 : (retval_8 = (s8_read_lane (7) (vl_pre) (idx) (L)))) (PreH10 : (retval_7 = (s8_read_lane (6) (vl_pre) (idx) (L)))) (PreH11 : (retval_6 = (s8_read_lane (5) (vl_pre) (idx) (L)))) (PreH12 : (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L)))) (PreH13 : (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L)))) (PreH14 : (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L)))) (PreH15 : (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L)))) (PreH16 : (retval = (s8_read_lane (0) (vl_pre) (idx) (L)))) (PreH17 : (0 <= vl_pre)) (PreH18 : (vl_pre <= 32)) (PreH19 : (0 <= idx)) (PreH20 : ((idx + vl_pre ) <= count)) (PreH21 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |->_)
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
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= 16) ” 
  &&  “ (16 < 128) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
.

Definition __riscv_vle8_v_i8m2_partial_solve_wit_17_aux := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (PreH1 : (retval_16 = (s8_read_lane (15) (vl_pre) (idx) (L)))) (PreH2 : (retval_15 = (s8_read_lane (14) (vl_pre) (idx) (L)))) (PreH3 : (retval_14 = (s8_read_lane (13) (vl_pre) (idx) (L)))) (PreH4 : (retval_13 = (s8_read_lane (12) (vl_pre) (idx) (L)))) (PreH5 : (retval_12 = (s8_read_lane (11) (vl_pre) (idx) (L)))) (PreH6 : (retval_11 = (s8_read_lane (10) (vl_pre) (idx) (L)))) (PreH7 : (retval_10 = (s8_read_lane (9) (vl_pre) (idx) (L)))) (PreH8 : (retval_9 = (s8_read_lane (8) (vl_pre) (idx) (L)))) (PreH9 : (retval_8 = (s8_read_lane (7) (vl_pre) (idx) (L)))) (PreH10 : (retval_7 = (s8_read_lane (6) (vl_pre) (idx) (L)))) (PreH11 : (retval_6 = (s8_read_lane (5) (vl_pre) (idx) (L)))) (PreH12 : (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L)))) (PreH13 : (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L)))) (PreH14 : (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L)))) (PreH15 : (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L)))) (PreH16 : (retval = (s8_read_lane (0) (vl_pre) (idx) (L)))) (PreH17 : (0 <= vl_pre)) (PreH18 : (vl_pre <= 32)) (PreH19 : (0 <= idx)) (PreH20 : ((idx + vl_pre ) <= count)) (PreH21 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |->_)
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
  “ (0 <= 16) ” 
  &&  “ (16 < 128) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ” 
  &&  “ (retval_16 = (s8_read_lane (15) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_15 = (s8_read_lane (14) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_14 = (s8_read_lane (13) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_13 = (s8_read_lane (12) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_12 = (s8_read_lane (11) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_11 = (s8_read_lane (10) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_10 = (s8_read_lane (9) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_9 = (s8_read_lane (8) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_8 = (s8_read_lane (7) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_7 = (s8_read_lane (6) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_6 = (s8_read_lane (5) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L))) ” 
  &&  “ (retval = (s8_read_lane (0) (vl_pre) (idx) (L))) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
  &&  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |->_)
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
.

Definition __riscv_vle8_v_i8m2_partial_solve_wit_17 := __riscv_vle8_v_i8m2_partial_solve_wit_17_pure -> __riscv_vle8_v_i8m2_partial_solve_wit_17_aux.

Definition __riscv_vle8_v_i8m2_partial_solve_wit_18_pure := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (PreH1 : (retval_17 = (s8_read_lane (16) (vl_pre) (idx) (L)))) (PreH2 : (retval_16 = (s8_read_lane (15) (vl_pre) (idx) (L)))) (PreH3 : (retval_15 = (s8_read_lane (14) (vl_pre) (idx) (L)))) (PreH4 : (retval_14 = (s8_read_lane (13) (vl_pre) (idx) (L)))) (PreH5 : (retval_13 = (s8_read_lane (12) (vl_pre) (idx) (L)))) (PreH6 : (retval_12 = (s8_read_lane (11) (vl_pre) (idx) (L)))) (PreH7 : (retval_11 = (s8_read_lane (10) (vl_pre) (idx) (L)))) (PreH8 : (retval_10 = (s8_read_lane (9) (vl_pre) (idx) (L)))) (PreH9 : (retval_9 = (s8_read_lane (8) (vl_pre) (idx) (L)))) (PreH10 : (retval_8 = (s8_read_lane (7) (vl_pre) (idx) (L)))) (PreH11 : (retval_7 = (s8_read_lane (6) (vl_pre) (idx) (L)))) (PreH12 : (retval_6 = (s8_read_lane (5) (vl_pre) (idx) (L)))) (PreH13 : (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L)))) (PreH14 : (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L)))) (PreH15 : (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L)))) (PreH16 : (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L)))) (PreH17 : (retval = (s8_read_lane (0) (vl_pre) (idx) (L)))) (PreH18 : (0 <= vl_pre)) (PreH19 : (vl_pre <= 32)) (PreH20 : (0 <= idx)) (PreH21 : ((idx + vl_pre ) <= count)) (PreH22 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |-> retval_17)
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
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= 17) ” 
  &&  “ (17 < 128) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
.

Definition __riscv_vle8_v_i8m2_partial_solve_wit_18_aux := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (PreH1 : (retval_17 = (s8_read_lane (16) (vl_pre) (idx) (L)))) (PreH2 : (retval_16 = (s8_read_lane (15) (vl_pre) (idx) (L)))) (PreH3 : (retval_15 = (s8_read_lane (14) (vl_pre) (idx) (L)))) (PreH4 : (retval_14 = (s8_read_lane (13) (vl_pre) (idx) (L)))) (PreH5 : (retval_13 = (s8_read_lane (12) (vl_pre) (idx) (L)))) (PreH6 : (retval_12 = (s8_read_lane (11) (vl_pre) (idx) (L)))) (PreH7 : (retval_11 = (s8_read_lane (10) (vl_pre) (idx) (L)))) (PreH8 : (retval_10 = (s8_read_lane (9) (vl_pre) (idx) (L)))) (PreH9 : (retval_9 = (s8_read_lane (8) (vl_pre) (idx) (L)))) (PreH10 : (retval_8 = (s8_read_lane (7) (vl_pre) (idx) (L)))) (PreH11 : (retval_7 = (s8_read_lane (6) (vl_pre) (idx) (L)))) (PreH12 : (retval_6 = (s8_read_lane (5) (vl_pre) (idx) (L)))) (PreH13 : (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L)))) (PreH14 : (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L)))) (PreH15 : (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L)))) (PreH16 : (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L)))) (PreH17 : (retval = (s8_read_lane (0) (vl_pre) (idx) (L)))) (PreH18 : (0 <= vl_pre)) (PreH19 : (vl_pre <= 32)) (PreH20 : (0 <= idx)) (PreH21 : ((idx + vl_pre ) <= count)) (PreH22 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |-> retval_17)
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
  “ (0 <= 17) ” 
  &&  “ (17 < 128) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ” 
  &&  “ (retval_17 = (s8_read_lane (16) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_16 = (s8_read_lane (15) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_15 = (s8_read_lane (14) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_14 = (s8_read_lane (13) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_13 = (s8_read_lane (12) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_12 = (s8_read_lane (11) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_11 = (s8_read_lane (10) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_10 = (s8_read_lane (9) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_9 = (s8_read_lane (8) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_8 = (s8_read_lane (7) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_7 = (s8_read_lane (6) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_6 = (s8_read_lane (5) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L))) ” 
  &&  “ (retval = (s8_read_lane (0) (vl_pre) (idx) (L))) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
  &&  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |-> retval_17)
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
.

Definition __riscv_vle8_v_i8m2_partial_solve_wit_18 := __riscv_vle8_v_i8m2_partial_solve_wit_18_pure -> __riscv_vle8_v_i8m2_partial_solve_wit_18_aux.

Definition __riscv_vle8_v_i8m2_partial_solve_wit_19_pure := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (PreH1 : (retval_18 = (s8_read_lane (17) (vl_pre) (idx) (L)))) (PreH2 : (retval_17 = (s8_read_lane (16) (vl_pre) (idx) (L)))) (PreH3 : (retval_16 = (s8_read_lane (15) (vl_pre) (idx) (L)))) (PreH4 : (retval_15 = (s8_read_lane (14) (vl_pre) (idx) (L)))) (PreH5 : (retval_14 = (s8_read_lane (13) (vl_pre) (idx) (L)))) (PreH6 : (retval_13 = (s8_read_lane (12) (vl_pre) (idx) (L)))) (PreH7 : (retval_12 = (s8_read_lane (11) (vl_pre) (idx) (L)))) (PreH8 : (retval_11 = (s8_read_lane (10) (vl_pre) (idx) (L)))) (PreH9 : (retval_10 = (s8_read_lane (9) (vl_pre) (idx) (L)))) (PreH10 : (retval_9 = (s8_read_lane (8) (vl_pre) (idx) (L)))) (PreH11 : (retval_8 = (s8_read_lane (7) (vl_pre) (idx) (L)))) (PreH12 : (retval_7 = (s8_read_lane (6) (vl_pre) (idx) (L)))) (PreH13 : (retval_6 = (s8_read_lane (5) (vl_pre) (idx) (L)))) (PreH14 : (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L)))) (PreH15 : (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L)))) (PreH16 : (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L)))) (PreH17 : (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L)))) (PreH18 : (retval = (s8_read_lane (0) (vl_pre) (idx) (L)))) (PreH19 : (0 <= vl_pre)) (PreH20 : (vl_pre <= 32)) (PreH21 : (0 <= idx)) (PreH22 : ((idx + vl_pre ) <= count)) (PreH23 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |-> retval_17)
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
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= 18) ” 
  &&  “ (18 < 128) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
.

Definition __riscv_vle8_v_i8m2_partial_solve_wit_19_aux := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (PreH1 : (retval_18 = (s8_read_lane (17) (vl_pre) (idx) (L)))) (PreH2 : (retval_17 = (s8_read_lane (16) (vl_pre) (idx) (L)))) (PreH3 : (retval_16 = (s8_read_lane (15) (vl_pre) (idx) (L)))) (PreH4 : (retval_15 = (s8_read_lane (14) (vl_pre) (idx) (L)))) (PreH5 : (retval_14 = (s8_read_lane (13) (vl_pre) (idx) (L)))) (PreH6 : (retval_13 = (s8_read_lane (12) (vl_pre) (idx) (L)))) (PreH7 : (retval_12 = (s8_read_lane (11) (vl_pre) (idx) (L)))) (PreH8 : (retval_11 = (s8_read_lane (10) (vl_pre) (idx) (L)))) (PreH9 : (retval_10 = (s8_read_lane (9) (vl_pre) (idx) (L)))) (PreH10 : (retval_9 = (s8_read_lane (8) (vl_pre) (idx) (L)))) (PreH11 : (retval_8 = (s8_read_lane (7) (vl_pre) (idx) (L)))) (PreH12 : (retval_7 = (s8_read_lane (6) (vl_pre) (idx) (L)))) (PreH13 : (retval_6 = (s8_read_lane (5) (vl_pre) (idx) (L)))) (PreH14 : (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L)))) (PreH15 : (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L)))) (PreH16 : (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L)))) (PreH17 : (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L)))) (PreH18 : (retval = (s8_read_lane (0) (vl_pre) (idx) (L)))) (PreH19 : (0 <= vl_pre)) (PreH20 : (vl_pre <= 32)) (PreH21 : (0 <= idx)) (PreH22 : ((idx + vl_pre ) <= count)) (PreH23 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |-> retval_17)
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
  “ (0 <= 18) ” 
  &&  “ (18 < 128) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ” 
  &&  “ (retval_18 = (s8_read_lane (17) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_17 = (s8_read_lane (16) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_16 = (s8_read_lane (15) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_15 = (s8_read_lane (14) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_14 = (s8_read_lane (13) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_13 = (s8_read_lane (12) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_12 = (s8_read_lane (11) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_11 = (s8_read_lane (10) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_10 = (s8_read_lane (9) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_9 = (s8_read_lane (8) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_8 = (s8_read_lane (7) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_7 = (s8_read_lane (6) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_6 = (s8_read_lane (5) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L))) ” 
  &&  “ (retval = (s8_read_lane (0) (vl_pre) (idx) (L))) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
  &&  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |-> retval_17)
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
.

Definition __riscv_vle8_v_i8m2_partial_solve_wit_19 := __riscv_vle8_v_i8m2_partial_solve_wit_19_pure -> __riscv_vle8_v_i8m2_partial_solve_wit_19_aux.

Definition __riscv_vle8_v_i8m2_partial_solve_wit_20_pure := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (PreH1 : (retval_19 = (s8_read_lane (18) (vl_pre) (idx) (L)))) (PreH2 : (retval_18 = (s8_read_lane (17) (vl_pre) (idx) (L)))) (PreH3 : (retval_17 = (s8_read_lane (16) (vl_pre) (idx) (L)))) (PreH4 : (retval_16 = (s8_read_lane (15) (vl_pre) (idx) (L)))) (PreH5 : (retval_15 = (s8_read_lane (14) (vl_pre) (idx) (L)))) (PreH6 : (retval_14 = (s8_read_lane (13) (vl_pre) (idx) (L)))) (PreH7 : (retval_13 = (s8_read_lane (12) (vl_pre) (idx) (L)))) (PreH8 : (retval_12 = (s8_read_lane (11) (vl_pre) (idx) (L)))) (PreH9 : (retval_11 = (s8_read_lane (10) (vl_pre) (idx) (L)))) (PreH10 : (retval_10 = (s8_read_lane (9) (vl_pre) (idx) (L)))) (PreH11 : (retval_9 = (s8_read_lane (8) (vl_pre) (idx) (L)))) (PreH12 : (retval_8 = (s8_read_lane (7) (vl_pre) (idx) (L)))) (PreH13 : (retval_7 = (s8_read_lane (6) (vl_pre) (idx) (L)))) (PreH14 : (retval_6 = (s8_read_lane (5) (vl_pre) (idx) (L)))) (PreH15 : (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L)))) (PreH16 : (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L)))) (PreH17 : (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L)))) (PreH18 : (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L)))) (PreH19 : (retval = (s8_read_lane (0) (vl_pre) (idx) (L)))) (PreH20 : (0 <= vl_pre)) (PreH21 : (vl_pre <= 32)) (PreH22 : (0 <= idx)) (PreH23 : ((idx + vl_pre ) <= count)) (PreH24 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |-> retval_17)
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
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= 19) ” 
  &&  “ (19 < 128) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
.

Definition __riscv_vle8_v_i8m2_partial_solve_wit_20_aux := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (PreH1 : (retval_19 = (s8_read_lane (18) (vl_pre) (idx) (L)))) (PreH2 : (retval_18 = (s8_read_lane (17) (vl_pre) (idx) (L)))) (PreH3 : (retval_17 = (s8_read_lane (16) (vl_pre) (idx) (L)))) (PreH4 : (retval_16 = (s8_read_lane (15) (vl_pre) (idx) (L)))) (PreH5 : (retval_15 = (s8_read_lane (14) (vl_pre) (idx) (L)))) (PreH6 : (retval_14 = (s8_read_lane (13) (vl_pre) (idx) (L)))) (PreH7 : (retval_13 = (s8_read_lane (12) (vl_pre) (idx) (L)))) (PreH8 : (retval_12 = (s8_read_lane (11) (vl_pre) (idx) (L)))) (PreH9 : (retval_11 = (s8_read_lane (10) (vl_pre) (idx) (L)))) (PreH10 : (retval_10 = (s8_read_lane (9) (vl_pre) (idx) (L)))) (PreH11 : (retval_9 = (s8_read_lane (8) (vl_pre) (idx) (L)))) (PreH12 : (retval_8 = (s8_read_lane (7) (vl_pre) (idx) (L)))) (PreH13 : (retval_7 = (s8_read_lane (6) (vl_pre) (idx) (L)))) (PreH14 : (retval_6 = (s8_read_lane (5) (vl_pre) (idx) (L)))) (PreH15 : (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L)))) (PreH16 : (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L)))) (PreH17 : (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L)))) (PreH18 : (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L)))) (PreH19 : (retval = (s8_read_lane (0) (vl_pre) (idx) (L)))) (PreH20 : (0 <= vl_pre)) (PreH21 : (vl_pre <= 32)) (PreH22 : (0 <= idx)) (PreH23 : ((idx + vl_pre ) <= count)) (PreH24 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |-> retval_17)
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
  “ (0 <= 19) ” 
  &&  “ (19 < 128) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ” 
  &&  “ (retval_19 = (s8_read_lane (18) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_18 = (s8_read_lane (17) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_17 = (s8_read_lane (16) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_16 = (s8_read_lane (15) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_15 = (s8_read_lane (14) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_14 = (s8_read_lane (13) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_13 = (s8_read_lane (12) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_12 = (s8_read_lane (11) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_11 = (s8_read_lane (10) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_10 = (s8_read_lane (9) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_9 = (s8_read_lane (8) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_8 = (s8_read_lane (7) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_7 = (s8_read_lane (6) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_6 = (s8_read_lane (5) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L))) ” 
  &&  “ (retval = (s8_read_lane (0) (vl_pre) (idx) (L))) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
  &&  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |-> retval_17)
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
.

Definition __riscv_vle8_v_i8m2_partial_solve_wit_20 := __riscv_vle8_v_i8m2_partial_solve_wit_20_pure -> __riscv_vle8_v_i8m2_partial_solve_wit_20_aux.

Definition __riscv_vle8_v_i8m2_partial_solve_wit_21_pure := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (PreH1 : (retval_20 = (s8_read_lane (19) (vl_pre) (idx) (L)))) (PreH2 : (retval_19 = (s8_read_lane (18) (vl_pre) (idx) (L)))) (PreH3 : (retval_18 = (s8_read_lane (17) (vl_pre) (idx) (L)))) (PreH4 : (retval_17 = (s8_read_lane (16) (vl_pre) (idx) (L)))) (PreH5 : (retval_16 = (s8_read_lane (15) (vl_pre) (idx) (L)))) (PreH6 : (retval_15 = (s8_read_lane (14) (vl_pre) (idx) (L)))) (PreH7 : (retval_14 = (s8_read_lane (13) (vl_pre) (idx) (L)))) (PreH8 : (retval_13 = (s8_read_lane (12) (vl_pre) (idx) (L)))) (PreH9 : (retval_12 = (s8_read_lane (11) (vl_pre) (idx) (L)))) (PreH10 : (retval_11 = (s8_read_lane (10) (vl_pre) (idx) (L)))) (PreH11 : (retval_10 = (s8_read_lane (9) (vl_pre) (idx) (L)))) (PreH12 : (retval_9 = (s8_read_lane (8) (vl_pre) (idx) (L)))) (PreH13 : (retval_8 = (s8_read_lane (7) (vl_pre) (idx) (L)))) (PreH14 : (retval_7 = (s8_read_lane (6) (vl_pre) (idx) (L)))) (PreH15 : (retval_6 = (s8_read_lane (5) (vl_pre) (idx) (L)))) (PreH16 : (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L)))) (PreH17 : (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L)))) (PreH18 : (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L)))) (PreH19 : (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L)))) (PreH20 : (retval = (s8_read_lane (0) (vl_pre) (idx) (L)))) (PreH21 : (0 <= vl_pre)) (PreH22 : (vl_pre <= 32)) (PreH23 : (0 <= idx)) (PreH24 : ((idx + vl_pre ) <= count)) (PreH25 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |-> retval_17)
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
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= 20) ” 
  &&  “ (20 < 128) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
.

Definition __riscv_vle8_v_i8m2_partial_solve_wit_21_aux := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (PreH1 : (retval_20 = (s8_read_lane (19) (vl_pre) (idx) (L)))) (PreH2 : (retval_19 = (s8_read_lane (18) (vl_pre) (idx) (L)))) (PreH3 : (retval_18 = (s8_read_lane (17) (vl_pre) (idx) (L)))) (PreH4 : (retval_17 = (s8_read_lane (16) (vl_pre) (idx) (L)))) (PreH5 : (retval_16 = (s8_read_lane (15) (vl_pre) (idx) (L)))) (PreH6 : (retval_15 = (s8_read_lane (14) (vl_pre) (idx) (L)))) (PreH7 : (retval_14 = (s8_read_lane (13) (vl_pre) (idx) (L)))) (PreH8 : (retval_13 = (s8_read_lane (12) (vl_pre) (idx) (L)))) (PreH9 : (retval_12 = (s8_read_lane (11) (vl_pre) (idx) (L)))) (PreH10 : (retval_11 = (s8_read_lane (10) (vl_pre) (idx) (L)))) (PreH11 : (retval_10 = (s8_read_lane (9) (vl_pre) (idx) (L)))) (PreH12 : (retval_9 = (s8_read_lane (8) (vl_pre) (idx) (L)))) (PreH13 : (retval_8 = (s8_read_lane (7) (vl_pre) (idx) (L)))) (PreH14 : (retval_7 = (s8_read_lane (6) (vl_pre) (idx) (L)))) (PreH15 : (retval_6 = (s8_read_lane (5) (vl_pre) (idx) (L)))) (PreH16 : (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L)))) (PreH17 : (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L)))) (PreH18 : (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L)))) (PreH19 : (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L)))) (PreH20 : (retval = (s8_read_lane (0) (vl_pre) (idx) (L)))) (PreH21 : (0 <= vl_pre)) (PreH22 : (vl_pre <= 32)) (PreH23 : (0 <= idx)) (PreH24 : ((idx + vl_pre ) <= count)) (PreH25 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |-> retval_17)
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
  “ (0 <= 20) ” 
  &&  “ (20 < 128) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ” 
  &&  “ (retval_20 = (s8_read_lane (19) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_19 = (s8_read_lane (18) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_18 = (s8_read_lane (17) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_17 = (s8_read_lane (16) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_16 = (s8_read_lane (15) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_15 = (s8_read_lane (14) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_14 = (s8_read_lane (13) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_13 = (s8_read_lane (12) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_12 = (s8_read_lane (11) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_11 = (s8_read_lane (10) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_10 = (s8_read_lane (9) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_9 = (s8_read_lane (8) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_8 = (s8_read_lane (7) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_7 = (s8_read_lane (6) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_6 = (s8_read_lane (5) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L))) ” 
  &&  “ (retval = (s8_read_lane (0) (vl_pre) (idx) (L))) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
  &&  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |-> retval_17)
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
.

Definition __riscv_vle8_v_i8m2_partial_solve_wit_21 := __riscv_vle8_v_i8m2_partial_solve_wit_21_pure -> __riscv_vle8_v_i8m2_partial_solve_wit_21_aux.

Definition __riscv_vle8_v_i8m2_partial_solve_wit_22_pure := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (PreH1 : (retval_21 = (s8_read_lane (20) (vl_pre) (idx) (L)))) (PreH2 : (retval_20 = (s8_read_lane (19) (vl_pre) (idx) (L)))) (PreH3 : (retval_19 = (s8_read_lane (18) (vl_pre) (idx) (L)))) (PreH4 : (retval_18 = (s8_read_lane (17) (vl_pre) (idx) (L)))) (PreH5 : (retval_17 = (s8_read_lane (16) (vl_pre) (idx) (L)))) (PreH6 : (retval_16 = (s8_read_lane (15) (vl_pre) (idx) (L)))) (PreH7 : (retval_15 = (s8_read_lane (14) (vl_pre) (idx) (L)))) (PreH8 : (retval_14 = (s8_read_lane (13) (vl_pre) (idx) (L)))) (PreH9 : (retval_13 = (s8_read_lane (12) (vl_pre) (idx) (L)))) (PreH10 : (retval_12 = (s8_read_lane (11) (vl_pre) (idx) (L)))) (PreH11 : (retval_11 = (s8_read_lane (10) (vl_pre) (idx) (L)))) (PreH12 : (retval_10 = (s8_read_lane (9) (vl_pre) (idx) (L)))) (PreH13 : (retval_9 = (s8_read_lane (8) (vl_pre) (idx) (L)))) (PreH14 : (retval_8 = (s8_read_lane (7) (vl_pre) (idx) (L)))) (PreH15 : (retval_7 = (s8_read_lane (6) (vl_pre) (idx) (L)))) (PreH16 : (retval_6 = (s8_read_lane (5) (vl_pre) (idx) (L)))) (PreH17 : (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L)))) (PreH18 : (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L)))) (PreH19 : (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L)))) (PreH20 : (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L)))) (PreH21 : (retval = (s8_read_lane (0) (vl_pre) (idx) (L)))) (PreH22 : (0 <= vl_pre)) (PreH23 : (vl_pre <= 32)) (PreH24 : (0 <= idx)) (PreH25 : ((idx + vl_pre ) <= count)) (PreH26 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |-> retval_17)
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
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= 21) ” 
  &&  “ (21 < 128) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
.

Definition __riscv_vle8_v_i8m2_partial_solve_wit_22_aux := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (PreH1 : (retval_21 = (s8_read_lane (20) (vl_pre) (idx) (L)))) (PreH2 : (retval_20 = (s8_read_lane (19) (vl_pre) (idx) (L)))) (PreH3 : (retval_19 = (s8_read_lane (18) (vl_pre) (idx) (L)))) (PreH4 : (retval_18 = (s8_read_lane (17) (vl_pre) (idx) (L)))) (PreH5 : (retval_17 = (s8_read_lane (16) (vl_pre) (idx) (L)))) (PreH6 : (retval_16 = (s8_read_lane (15) (vl_pre) (idx) (L)))) (PreH7 : (retval_15 = (s8_read_lane (14) (vl_pre) (idx) (L)))) (PreH8 : (retval_14 = (s8_read_lane (13) (vl_pre) (idx) (L)))) (PreH9 : (retval_13 = (s8_read_lane (12) (vl_pre) (idx) (L)))) (PreH10 : (retval_12 = (s8_read_lane (11) (vl_pre) (idx) (L)))) (PreH11 : (retval_11 = (s8_read_lane (10) (vl_pre) (idx) (L)))) (PreH12 : (retval_10 = (s8_read_lane (9) (vl_pre) (idx) (L)))) (PreH13 : (retval_9 = (s8_read_lane (8) (vl_pre) (idx) (L)))) (PreH14 : (retval_8 = (s8_read_lane (7) (vl_pre) (idx) (L)))) (PreH15 : (retval_7 = (s8_read_lane (6) (vl_pre) (idx) (L)))) (PreH16 : (retval_6 = (s8_read_lane (5) (vl_pre) (idx) (L)))) (PreH17 : (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L)))) (PreH18 : (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L)))) (PreH19 : (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L)))) (PreH20 : (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L)))) (PreH21 : (retval = (s8_read_lane (0) (vl_pre) (idx) (L)))) (PreH22 : (0 <= vl_pre)) (PreH23 : (vl_pre <= 32)) (PreH24 : (0 <= idx)) (PreH25 : ((idx + vl_pre ) <= count)) (PreH26 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |-> retval_17)
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
  “ (0 <= 21) ” 
  &&  “ (21 < 128) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ” 
  &&  “ (retval_21 = (s8_read_lane (20) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_20 = (s8_read_lane (19) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_19 = (s8_read_lane (18) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_18 = (s8_read_lane (17) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_17 = (s8_read_lane (16) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_16 = (s8_read_lane (15) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_15 = (s8_read_lane (14) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_14 = (s8_read_lane (13) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_13 = (s8_read_lane (12) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_12 = (s8_read_lane (11) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_11 = (s8_read_lane (10) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_10 = (s8_read_lane (9) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_9 = (s8_read_lane (8) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_8 = (s8_read_lane (7) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_7 = (s8_read_lane (6) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_6 = (s8_read_lane (5) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L))) ” 
  &&  “ (retval = (s8_read_lane (0) (vl_pre) (idx) (L))) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
  &&  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |-> retval_17)
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
.

Definition __riscv_vle8_v_i8m2_partial_solve_wit_22 := __riscv_vle8_v_i8m2_partial_solve_wit_22_pure -> __riscv_vle8_v_i8m2_partial_solve_wit_22_aux.

Definition __riscv_vle8_v_i8m2_partial_solve_wit_23_pure := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (PreH1 : (retval_22 = (s8_read_lane (21) (vl_pre) (idx) (L)))) (PreH2 : (retval_21 = (s8_read_lane (20) (vl_pre) (idx) (L)))) (PreH3 : (retval_20 = (s8_read_lane (19) (vl_pre) (idx) (L)))) (PreH4 : (retval_19 = (s8_read_lane (18) (vl_pre) (idx) (L)))) (PreH5 : (retval_18 = (s8_read_lane (17) (vl_pre) (idx) (L)))) (PreH6 : (retval_17 = (s8_read_lane (16) (vl_pre) (idx) (L)))) (PreH7 : (retval_16 = (s8_read_lane (15) (vl_pre) (idx) (L)))) (PreH8 : (retval_15 = (s8_read_lane (14) (vl_pre) (idx) (L)))) (PreH9 : (retval_14 = (s8_read_lane (13) (vl_pre) (idx) (L)))) (PreH10 : (retval_13 = (s8_read_lane (12) (vl_pre) (idx) (L)))) (PreH11 : (retval_12 = (s8_read_lane (11) (vl_pre) (idx) (L)))) (PreH12 : (retval_11 = (s8_read_lane (10) (vl_pre) (idx) (L)))) (PreH13 : (retval_10 = (s8_read_lane (9) (vl_pre) (idx) (L)))) (PreH14 : (retval_9 = (s8_read_lane (8) (vl_pre) (idx) (L)))) (PreH15 : (retval_8 = (s8_read_lane (7) (vl_pre) (idx) (L)))) (PreH16 : (retval_7 = (s8_read_lane (6) (vl_pre) (idx) (L)))) (PreH17 : (retval_6 = (s8_read_lane (5) (vl_pre) (idx) (L)))) (PreH18 : (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L)))) (PreH19 : (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L)))) (PreH20 : (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L)))) (PreH21 : (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L)))) (PreH22 : (retval = (s8_read_lane (0) (vl_pre) (idx) (L)))) (PreH23 : (0 <= vl_pre)) (PreH24 : (vl_pre <= 32)) (PreH25 : (0 <= idx)) (PreH26 : ((idx + vl_pre ) <= count)) (PreH27 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |-> retval_17)
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
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= 22) ” 
  &&  “ (22 < 128) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
.

Definition __riscv_vle8_v_i8m2_partial_solve_wit_23_aux := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (PreH1 : (retval_22 = (s8_read_lane (21) (vl_pre) (idx) (L)))) (PreH2 : (retval_21 = (s8_read_lane (20) (vl_pre) (idx) (L)))) (PreH3 : (retval_20 = (s8_read_lane (19) (vl_pre) (idx) (L)))) (PreH4 : (retval_19 = (s8_read_lane (18) (vl_pre) (idx) (L)))) (PreH5 : (retval_18 = (s8_read_lane (17) (vl_pre) (idx) (L)))) (PreH6 : (retval_17 = (s8_read_lane (16) (vl_pre) (idx) (L)))) (PreH7 : (retval_16 = (s8_read_lane (15) (vl_pre) (idx) (L)))) (PreH8 : (retval_15 = (s8_read_lane (14) (vl_pre) (idx) (L)))) (PreH9 : (retval_14 = (s8_read_lane (13) (vl_pre) (idx) (L)))) (PreH10 : (retval_13 = (s8_read_lane (12) (vl_pre) (idx) (L)))) (PreH11 : (retval_12 = (s8_read_lane (11) (vl_pre) (idx) (L)))) (PreH12 : (retval_11 = (s8_read_lane (10) (vl_pre) (idx) (L)))) (PreH13 : (retval_10 = (s8_read_lane (9) (vl_pre) (idx) (L)))) (PreH14 : (retval_9 = (s8_read_lane (8) (vl_pre) (idx) (L)))) (PreH15 : (retval_8 = (s8_read_lane (7) (vl_pre) (idx) (L)))) (PreH16 : (retval_7 = (s8_read_lane (6) (vl_pre) (idx) (L)))) (PreH17 : (retval_6 = (s8_read_lane (5) (vl_pre) (idx) (L)))) (PreH18 : (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L)))) (PreH19 : (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L)))) (PreH20 : (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L)))) (PreH21 : (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L)))) (PreH22 : (retval = (s8_read_lane (0) (vl_pre) (idx) (L)))) (PreH23 : (0 <= vl_pre)) (PreH24 : (vl_pre <= 32)) (PreH25 : (0 <= idx)) (PreH26 : ((idx + vl_pre ) <= count)) (PreH27 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |-> retval_17)
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
  “ (0 <= 22) ” 
  &&  “ (22 < 128) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ” 
  &&  “ (retval_22 = (s8_read_lane (21) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_21 = (s8_read_lane (20) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_20 = (s8_read_lane (19) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_19 = (s8_read_lane (18) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_18 = (s8_read_lane (17) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_17 = (s8_read_lane (16) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_16 = (s8_read_lane (15) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_15 = (s8_read_lane (14) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_14 = (s8_read_lane (13) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_13 = (s8_read_lane (12) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_12 = (s8_read_lane (11) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_11 = (s8_read_lane (10) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_10 = (s8_read_lane (9) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_9 = (s8_read_lane (8) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_8 = (s8_read_lane (7) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_7 = (s8_read_lane (6) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_6 = (s8_read_lane (5) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L))) ” 
  &&  “ (retval = (s8_read_lane (0) (vl_pre) (idx) (L))) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
  &&  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |-> retval_17)
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
.

Definition __riscv_vle8_v_i8m2_partial_solve_wit_23 := __riscv_vle8_v_i8m2_partial_solve_wit_23_pure -> __riscv_vle8_v_i8m2_partial_solve_wit_23_aux.

Definition __riscv_vle8_v_i8m2_partial_solve_wit_24_pure := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (PreH1 : (retval_23 = (s8_read_lane (22) (vl_pre) (idx) (L)))) (PreH2 : (retval_22 = (s8_read_lane (21) (vl_pre) (idx) (L)))) (PreH3 : (retval_21 = (s8_read_lane (20) (vl_pre) (idx) (L)))) (PreH4 : (retval_20 = (s8_read_lane (19) (vl_pre) (idx) (L)))) (PreH5 : (retval_19 = (s8_read_lane (18) (vl_pre) (idx) (L)))) (PreH6 : (retval_18 = (s8_read_lane (17) (vl_pre) (idx) (L)))) (PreH7 : (retval_17 = (s8_read_lane (16) (vl_pre) (idx) (L)))) (PreH8 : (retval_16 = (s8_read_lane (15) (vl_pre) (idx) (L)))) (PreH9 : (retval_15 = (s8_read_lane (14) (vl_pre) (idx) (L)))) (PreH10 : (retval_14 = (s8_read_lane (13) (vl_pre) (idx) (L)))) (PreH11 : (retval_13 = (s8_read_lane (12) (vl_pre) (idx) (L)))) (PreH12 : (retval_12 = (s8_read_lane (11) (vl_pre) (idx) (L)))) (PreH13 : (retval_11 = (s8_read_lane (10) (vl_pre) (idx) (L)))) (PreH14 : (retval_10 = (s8_read_lane (9) (vl_pre) (idx) (L)))) (PreH15 : (retval_9 = (s8_read_lane (8) (vl_pre) (idx) (L)))) (PreH16 : (retval_8 = (s8_read_lane (7) (vl_pre) (idx) (L)))) (PreH17 : (retval_7 = (s8_read_lane (6) (vl_pre) (idx) (L)))) (PreH18 : (retval_6 = (s8_read_lane (5) (vl_pre) (idx) (L)))) (PreH19 : (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L)))) (PreH20 : (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L)))) (PreH21 : (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L)))) (PreH22 : (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L)))) (PreH23 : (retval = (s8_read_lane (0) (vl_pre) (idx) (L)))) (PreH24 : (0 <= vl_pre)) (PreH25 : (vl_pre <= 32)) (PreH26 : (0 <= idx)) (PreH27 : ((idx + vl_pre ) <= count)) (PreH28 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |-> retval_17)
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
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= 23) ” 
  &&  “ (23 < 128) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
.

Definition __riscv_vle8_v_i8m2_partial_solve_wit_24_aux := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (PreH1 : (retval_23 = (s8_read_lane (22) (vl_pre) (idx) (L)))) (PreH2 : (retval_22 = (s8_read_lane (21) (vl_pre) (idx) (L)))) (PreH3 : (retval_21 = (s8_read_lane (20) (vl_pre) (idx) (L)))) (PreH4 : (retval_20 = (s8_read_lane (19) (vl_pre) (idx) (L)))) (PreH5 : (retval_19 = (s8_read_lane (18) (vl_pre) (idx) (L)))) (PreH6 : (retval_18 = (s8_read_lane (17) (vl_pre) (idx) (L)))) (PreH7 : (retval_17 = (s8_read_lane (16) (vl_pre) (idx) (L)))) (PreH8 : (retval_16 = (s8_read_lane (15) (vl_pre) (idx) (L)))) (PreH9 : (retval_15 = (s8_read_lane (14) (vl_pre) (idx) (L)))) (PreH10 : (retval_14 = (s8_read_lane (13) (vl_pre) (idx) (L)))) (PreH11 : (retval_13 = (s8_read_lane (12) (vl_pre) (idx) (L)))) (PreH12 : (retval_12 = (s8_read_lane (11) (vl_pre) (idx) (L)))) (PreH13 : (retval_11 = (s8_read_lane (10) (vl_pre) (idx) (L)))) (PreH14 : (retval_10 = (s8_read_lane (9) (vl_pre) (idx) (L)))) (PreH15 : (retval_9 = (s8_read_lane (8) (vl_pre) (idx) (L)))) (PreH16 : (retval_8 = (s8_read_lane (7) (vl_pre) (idx) (L)))) (PreH17 : (retval_7 = (s8_read_lane (6) (vl_pre) (idx) (L)))) (PreH18 : (retval_6 = (s8_read_lane (5) (vl_pre) (idx) (L)))) (PreH19 : (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L)))) (PreH20 : (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L)))) (PreH21 : (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L)))) (PreH22 : (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L)))) (PreH23 : (retval = (s8_read_lane (0) (vl_pre) (idx) (L)))) (PreH24 : (0 <= vl_pre)) (PreH25 : (vl_pre <= 32)) (PreH26 : (0 <= idx)) (PreH27 : ((idx + vl_pre ) <= count)) (PreH28 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |-> retval_17)
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
  “ (0 <= 23) ” 
  &&  “ (23 < 128) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ” 
  &&  “ (retval_23 = (s8_read_lane (22) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_22 = (s8_read_lane (21) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_21 = (s8_read_lane (20) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_20 = (s8_read_lane (19) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_19 = (s8_read_lane (18) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_18 = (s8_read_lane (17) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_17 = (s8_read_lane (16) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_16 = (s8_read_lane (15) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_15 = (s8_read_lane (14) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_14 = (s8_read_lane (13) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_13 = (s8_read_lane (12) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_12 = (s8_read_lane (11) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_11 = (s8_read_lane (10) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_10 = (s8_read_lane (9) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_9 = (s8_read_lane (8) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_8 = (s8_read_lane (7) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_7 = (s8_read_lane (6) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_6 = (s8_read_lane (5) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L))) ” 
  &&  “ (retval = (s8_read_lane (0) (vl_pre) (idx) (L))) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
  &&  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |-> retval_17)
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
.

Definition __riscv_vle8_v_i8m2_partial_solve_wit_24 := __riscv_vle8_v_i8m2_partial_solve_wit_24_pure -> __riscv_vle8_v_i8m2_partial_solve_wit_24_aux.

Definition __riscv_vle8_v_i8m2_partial_solve_wit_25_pure := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (PreH1 : (retval_24 = (s8_read_lane (23) (vl_pre) (idx) (L)))) (PreH2 : (retval_23 = (s8_read_lane (22) (vl_pre) (idx) (L)))) (PreH3 : (retval_22 = (s8_read_lane (21) (vl_pre) (idx) (L)))) (PreH4 : (retval_21 = (s8_read_lane (20) (vl_pre) (idx) (L)))) (PreH5 : (retval_20 = (s8_read_lane (19) (vl_pre) (idx) (L)))) (PreH6 : (retval_19 = (s8_read_lane (18) (vl_pre) (idx) (L)))) (PreH7 : (retval_18 = (s8_read_lane (17) (vl_pre) (idx) (L)))) (PreH8 : (retval_17 = (s8_read_lane (16) (vl_pre) (idx) (L)))) (PreH9 : (retval_16 = (s8_read_lane (15) (vl_pre) (idx) (L)))) (PreH10 : (retval_15 = (s8_read_lane (14) (vl_pre) (idx) (L)))) (PreH11 : (retval_14 = (s8_read_lane (13) (vl_pre) (idx) (L)))) (PreH12 : (retval_13 = (s8_read_lane (12) (vl_pre) (idx) (L)))) (PreH13 : (retval_12 = (s8_read_lane (11) (vl_pre) (idx) (L)))) (PreH14 : (retval_11 = (s8_read_lane (10) (vl_pre) (idx) (L)))) (PreH15 : (retval_10 = (s8_read_lane (9) (vl_pre) (idx) (L)))) (PreH16 : (retval_9 = (s8_read_lane (8) (vl_pre) (idx) (L)))) (PreH17 : (retval_8 = (s8_read_lane (7) (vl_pre) (idx) (L)))) (PreH18 : (retval_7 = (s8_read_lane (6) (vl_pre) (idx) (L)))) (PreH19 : (retval_6 = (s8_read_lane (5) (vl_pre) (idx) (L)))) (PreH20 : (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L)))) (PreH21 : (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L)))) (PreH22 : (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L)))) (PreH23 : (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L)))) (PreH24 : (retval = (s8_read_lane (0) (vl_pre) (idx) (L)))) (PreH25 : (0 <= vl_pre)) (PreH26 : (vl_pre <= 32)) (PreH27 : (0 <= idx)) (PreH28 : ((idx + vl_pre ) <= count)) (PreH29 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |-> retval_17)
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
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= 24) ” 
  &&  “ (24 < 128) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
.

Definition __riscv_vle8_v_i8m2_partial_solve_wit_25_aux := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (PreH1 : (retval_24 = (s8_read_lane (23) (vl_pre) (idx) (L)))) (PreH2 : (retval_23 = (s8_read_lane (22) (vl_pre) (idx) (L)))) (PreH3 : (retval_22 = (s8_read_lane (21) (vl_pre) (idx) (L)))) (PreH4 : (retval_21 = (s8_read_lane (20) (vl_pre) (idx) (L)))) (PreH5 : (retval_20 = (s8_read_lane (19) (vl_pre) (idx) (L)))) (PreH6 : (retval_19 = (s8_read_lane (18) (vl_pre) (idx) (L)))) (PreH7 : (retval_18 = (s8_read_lane (17) (vl_pre) (idx) (L)))) (PreH8 : (retval_17 = (s8_read_lane (16) (vl_pre) (idx) (L)))) (PreH9 : (retval_16 = (s8_read_lane (15) (vl_pre) (idx) (L)))) (PreH10 : (retval_15 = (s8_read_lane (14) (vl_pre) (idx) (L)))) (PreH11 : (retval_14 = (s8_read_lane (13) (vl_pre) (idx) (L)))) (PreH12 : (retval_13 = (s8_read_lane (12) (vl_pre) (idx) (L)))) (PreH13 : (retval_12 = (s8_read_lane (11) (vl_pre) (idx) (L)))) (PreH14 : (retval_11 = (s8_read_lane (10) (vl_pre) (idx) (L)))) (PreH15 : (retval_10 = (s8_read_lane (9) (vl_pre) (idx) (L)))) (PreH16 : (retval_9 = (s8_read_lane (8) (vl_pre) (idx) (L)))) (PreH17 : (retval_8 = (s8_read_lane (7) (vl_pre) (idx) (L)))) (PreH18 : (retval_7 = (s8_read_lane (6) (vl_pre) (idx) (L)))) (PreH19 : (retval_6 = (s8_read_lane (5) (vl_pre) (idx) (L)))) (PreH20 : (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L)))) (PreH21 : (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L)))) (PreH22 : (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L)))) (PreH23 : (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L)))) (PreH24 : (retval = (s8_read_lane (0) (vl_pre) (idx) (L)))) (PreH25 : (0 <= vl_pre)) (PreH26 : (vl_pre <= 32)) (PreH27 : (0 <= idx)) (PreH28 : ((idx + vl_pre ) <= count)) (PreH29 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |-> retval_17)
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
  “ (0 <= 24) ” 
  &&  “ (24 < 128) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ” 
  &&  “ (retval_24 = (s8_read_lane (23) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_23 = (s8_read_lane (22) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_22 = (s8_read_lane (21) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_21 = (s8_read_lane (20) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_20 = (s8_read_lane (19) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_19 = (s8_read_lane (18) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_18 = (s8_read_lane (17) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_17 = (s8_read_lane (16) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_16 = (s8_read_lane (15) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_15 = (s8_read_lane (14) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_14 = (s8_read_lane (13) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_13 = (s8_read_lane (12) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_12 = (s8_read_lane (11) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_11 = (s8_read_lane (10) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_10 = (s8_read_lane (9) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_9 = (s8_read_lane (8) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_8 = (s8_read_lane (7) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_7 = (s8_read_lane (6) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_6 = (s8_read_lane (5) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L))) ” 
  &&  “ (retval = (s8_read_lane (0) (vl_pre) (idx) (L))) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
  &&  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |-> retval_17)
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
.

Definition __riscv_vle8_v_i8m2_partial_solve_wit_25 := __riscv_vle8_v_i8m2_partial_solve_wit_25_pure -> __riscv_vle8_v_i8m2_partial_solve_wit_25_aux.

Definition __riscv_vle8_v_i8m2_partial_solve_wit_26_pure := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (PreH1 : (retval_25 = (s8_read_lane (24) (vl_pre) (idx) (L)))) (PreH2 : (retval_24 = (s8_read_lane (23) (vl_pre) (idx) (L)))) (PreH3 : (retval_23 = (s8_read_lane (22) (vl_pre) (idx) (L)))) (PreH4 : (retval_22 = (s8_read_lane (21) (vl_pre) (idx) (L)))) (PreH5 : (retval_21 = (s8_read_lane (20) (vl_pre) (idx) (L)))) (PreH6 : (retval_20 = (s8_read_lane (19) (vl_pre) (idx) (L)))) (PreH7 : (retval_19 = (s8_read_lane (18) (vl_pre) (idx) (L)))) (PreH8 : (retval_18 = (s8_read_lane (17) (vl_pre) (idx) (L)))) (PreH9 : (retval_17 = (s8_read_lane (16) (vl_pre) (idx) (L)))) (PreH10 : (retval_16 = (s8_read_lane (15) (vl_pre) (idx) (L)))) (PreH11 : (retval_15 = (s8_read_lane (14) (vl_pre) (idx) (L)))) (PreH12 : (retval_14 = (s8_read_lane (13) (vl_pre) (idx) (L)))) (PreH13 : (retval_13 = (s8_read_lane (12) (vl_pre) (idx) (L)))) (PreH14 : (retval_12 = (s8_read_lane (11) (vl_pre) (idx) (L)))) (PreH15 : (retval_11 = (s8_read_lane (10) (vl_pre) (idx) (L)))) (PreH16 : (retval_10 = (s8_read_lane (9) (vl_pre) (idx) (L)))) (PreH17 : (retval_9 = (s8_read_lane (8) (vl_pre) (idx) (L)))) (PreH18 : (retval_8 = (s8_read_lane (7) (vl_pre) (idx) (L)))) (PreH19 : (retval_7 = (s8_read_lane (6) (vl_pre) (idx) (L)))) (PreH20 : (retval_6 = (s8_read_lane (5) (vl_pre) (idx) (L)))) (PreH21 : (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L)))) (PreH22 : (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L)))) (PreH23 : (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L)))) (PreH24 : (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L)))) (PreH25 : (retval = (s8_read_lane (0) (vl_pre) (idx) (L)))) (PreH26 : (0 <= vl_pre)) (PreH27 : (vl_pre <= 32)) (PreH28 : (0 <= idx)) (PreH29 : ((idx + vl_pre ) <= count)) (PreH30 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |-> retval_25)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |-> retval_17)
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
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= 25) ” 
  &&  “ (25 < 128) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
.

Definition __riscv_vle8_v_i8m2_partial_solve_wit_26_aux := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (PreH1 : (retval_25 = (s8_read_lane (24) (vl_pre) (idx) (L)))) (PreH2 : (retval_24 = (s8_read_lane (23) (vl_pre) (idx) (L)))) (PreH3 : (retval_23 = (s8_read_lane (22) (vl_pre) (idx) (L)))) (PreH4 : (retval_22 = (s8_read_lane (21) (vl_pre) (idx) (L)))) (PreH5 : (retval_21 = (s8_read_lane (20) (vl_pre) (idx) (L)))) (PreH6 : (retval_20 = (s8_read_lane (19) (vl_pre) (idx) (L)))) (PreH7 : (retval_19 = (s8_read_lane (18) (vl_pre) (idx) (L)))) (PreH8 : (retval_18 = (s8_read_lane (17) (vl_pre) (idx) (L)))) (PreH9 : (retval_17 = (s8_read_lane (16) (vl_pre) (idx) (L)))) (PreH10 : (retval_16 = (s8_read_lane (15) (vl_pre) (idx) (L)))) (PreH11 : (retval_15 = (s8_read_lane (14) (vl_pre) (idx) (L)))) (PreH12 : (retval_14 = (s8_read_lane (13) (vl_pre) (idx) (L)))) (PreH13 : (retval_13 = (s8_read_lane (12) (vl_pre) (idx) (L)))) (PreH14 : (retval_12 = (s8_read_lane (11) (vl_pre) (idx) (L)))) (PreH15 : (retval_11 = (s8_read_lane (10) (vl_pre) (idx) (L)))) (PreH16 : (retval_10 = (s8_read_lane (9) (vl_pre) (idx) (L)))) (PreH17 : (retval_9 = (s8_read_lane (8) (vl_pre) (idx) (L)))) (PreH18 : (retval_8 = (s8_read_lane (7) (vl_pre) (idx) (L)))) (PreH19 : (retval_7 = (s8_read_lane (6) (vl_pre) (idx) (L)))) (PreH20 : (retval_6 = (s8_read_lane (5) (vl_pre) (idx) (L)))) (PreH21 : (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L)))) (PreH22 : (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L)))) (PreH23 : (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L)))) (PreH24 : (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L)))) (PreH25 : (retval = (s8_read_lane (0) (vl_pre) (idx) (L)))) (PreH26 : (0 <= vl_pre)) (PreH27 : (vl_pre <= 32)) (PreH28 : (0 <= idx)) (PreH29 : ((idx + vl_pre ) <= count)) (PreH30 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |-> retval_25)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |-> retval_17)
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
  “ (0 <= 25) ” 
  &&  “ (25 < 128) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ” 
  &&  “ (retval_25 = (s8_read_lane (24) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_24 = (s8_read_lane (23) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_23 = (s8_read_lane (22) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_22 = (s8_read_lane (21) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_21 = (s8_read_lane (20) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_20 = (s8_read_lane (19) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_19 = (s8_read_lane (18) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_18 = (s8_read_lane (17) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_17 = (s8_read_lane (16) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_16 = (s8_read_lane (15) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_15 = (s8_read_lane (14) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_14 = (s8_read_lane (13) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_13 = (s8_read_lane (12) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_12 = (s8_read_lane (11) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_11 = (s8_read_lane (10) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_10 = (s8_read_lane (9) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_9 = (s8_read_lane (8) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_8 = (s8_read_lane (7) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_7 = (s8_read_lane (6) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_6 = (s8_read_lane (5) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L))) ” 
  &&  “ (retval = (s8_read_lane (0) (vl_pre) (idx) (L))) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
  &&  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |-> retval_25)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |-> retval_17)
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
.

Definition __riscv_vle8_v_i8m2_partial_solve_wit_26 := __riscv_vle8_v_i8m2_partial_solve_wit_26_pure -> __riscv_vle8_v_i8m2_partial_solve_wit_26_aux.

Definition __riscv_vle8_v_i8m2_partial_solve_wit_27_pure := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (retval_26: Z) (PreH1 : (retval_26 = (s8_read_lane (25) (vl_pre) (idx) (L)))) (PreH2 : (retval_25 = (s8_read_lane (24) (vl_pre) (idx) (L)))) (PreH3 : (retval_24 = (s8_read_lane (23) (vl_pre) (idx) (L)))) (PreH4 : (retval_23 = (s8_read_lane (22) (vl_pre) (idx) (L)))) (PreH5 : (retval_22 = (s8_read_lane (21) (vl_pre) (idx) (L)))) (PreH6 : (retval_21 = (s8_read_lane (20) (vl_pre) (idx) (L)))) (PreH7 : (retval_20 = (s8_read_lane (19) (vl_pre) (idx) (L)))) (PreH8 : (retval_19 = (s8_read_lane (18) (vl_pre) (idx) (L)))) (PreH9 : (retval_18 = (s8_read_lane (17) (vl_pre) (idx) (L)))) (PreH10 : (retval_17 = (s8_read_lane (16) (vl_pre) (idx) (L)))) (PreH11 : (retval_16 = (s8_read_lane (15) (vl_pre) (idx) (L)))) (PreH12 : (retval_15 = (s8_read_lane (14) (vl_pre) (idx) (L)))) (PreH13 : (retval_14 = (s8_read_lane (13) (vl_pre) (idx) (L)))) (PreH14 : (retval_13 = (s8_read_lane (12) (vl_pre) (idx) (L)))) (PreH15 : (retval_12 = (s8_read_lane (11) (vl_pre) (idx) (L)))) (PreH16 : (retval_11 = (s8_read_lane (10) (vl_pre) (idx) (L)))) (PreH17 : (retval_10 = (s8_read_lane (9) (vl_pre) (idx) (L)))) (PreH18 : (retval_9 = (s8_read_lane (8) (vl_pre) (idx) (L)))) (PreH19 : (retval_8 = (s8_read_lane (7) (vl_pre) (idx) (L)))) (PreH20 : (retval_7 = (s8_read_lane (6) (vl_pre) (idx) (L)))) (PreH21 : (retval_6 = (s8_read_lane (5) (vl_pre) (idx) (L)))) (PreH22 : (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L)))) (PreH23 : (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L)))) (PreH24 : (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L)))) (PreH25 : (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L)))) (PreH26 : (retval = (s8_read_lane (0) (vl_pre) (idx) (L)))) (PreH27 : (0 <= vl_pre)) (PreH28 : (vl_pre <= 32)) (PreH29 : (0 <= idx)) (PreH30 : ((idx + vl_pre ) <= count)) (PreH31 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |-> retval_26)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |-> retval_25)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |-> retval_17)
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
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= 26) ” 
  &&  “ (26 < 128) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
.

Definition __riscv_vle8_v_i8m2_partial_solve_wit_27_aux := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (retval_26: Z) (PreH1 : (retval_26 = (s8_read_lane (25) (vl_pre) (idx) (L)))) (PreH2 : (retval_25 = (s8_read_lane (24) (vl_pre) (idx) (L)))) (PreH3 : (retval_24 = (s8_read_lane (23) (vl_pre) (idx) (L)))) (PreH4 : (retval_23 = (s8_read_lane (22) (vl_pre) (idx) (L)))) (PreH5 : (retval_22 = (s8_read_lane (21) (vl_pre) (idx) (L)))) (PreH6 : (retval_21 = (s8_read_lane (20) (vl_pre) (idx) (L)))) (PreH7 : (retval_20 = (s8_read_lane (19) (vl_pre) (idx) (L)))) (PreH8 : (retval_19 = (s8_read_lane (18) (vl_pre) (idx) (L)))) (PreH9 : (retval_18 = (s8_read_lane (17) (vl_pre) (idx) (L)))) (PreH10 : (retval_17 = (s8_read_lane (16) (vl_pre) (idx) (L)))) (PreH11 : (retval_16 = (s8_read_lane (15) (vl_pre) (idx) (L)))) (PreH12 : (retval_15 = (s8_read_lane (14) (vl_pre) (idx) (L)))) (PreH13 : (retval_14 = (s8_read_lane (13) (vl_pre) (idx) (L)))) (PreH14 : (retval_13 = (s8_read_lane (12) (vl_pre) (idx) (L)))) (PreH15 : (retval_12 = (s8_read_lane (11) (vl_pre) (idx) (L)))) (PreH16 : (retval_11 = (s8_read_lane (10) (vl_pre) (idx) (L)))) (PreH17 : (retval_10 = (s8_read_lane (9) (vl_pre) (idx) (L)))) (PreH18 : (retval_9 = (s8_read_lane (8) (vl_pre) (idx) (L)))) (PreH19 : (retval_8 = (s8_read_lane (7) (vl_pre) (idx) (L)))) (PreH20 : (retval_7 = (s8_read_lane (6) (vl_pre) (idx) (L)))) (PreH21 : (retval_6 = (s8_read_lane (5) (vl_pre) (idx) (L)))) (PreH22 : (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L)))) (PreH23 : (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L)))) (PreH24 : (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L)))) (PreH25 : (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L)))) (PreH26 : (retval = (s8_read_lane (0) (vl_pre) (idx) (L)))) (PreH27 : (0 <= vl_pre)) (PreH28 : (vl_pre <= 32)) (PreH29 : (0 <= idx)) (PreH30 : ((idx + vl_pre ) <= count)) (PreH31 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |-> retval_26)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |-> retval_25)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |-> retval_17)
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
  “ (0 <= 26) ” 
  &&  “ (26 < 128) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ” 
  &&  “ (retval_26 = (s8_read_lane (25) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_25 = (s8_read_lane (24) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_24 = (s8_read_lane (23) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_23 = (s8_read_lane (22) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_22 = (s8_read_lane (21) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_21 = (s8_read_lane (20) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_20 = (s8_read_lane (19) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_19 = (s8_read_lane (18) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_18 = (s8_read_lane (17) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_17 = (s8_read_lane (16) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_16 = (s8_read_lane (15) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_15 = (s8_read_lane (14) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_14 = (s8_read_lane (13) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_13 = (s8_read_lane (12) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_12 = (s8_read_lane (11) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_11 = (s8_read_lane (10) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_10 = (s8_read_lane (9) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_9 = (s8_read_lane (8) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_8 = (s8_read_lane (7) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_7 = (s8_read_lane (6) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_6 = (s8_read_lane (5) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L))) ” 
  &&  “ (retval = (s8_read_lane (0) (vl_pre) (idx) (L))) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
  &&  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |-> retval_26)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |-> retval_25)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |-> retval_17)
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
.

Definition __riscv_vle8_v_i8m2_partial_solve_wit_27 := __riscv_vle8_v_i8m2_partial_solve_wit_27_pure -> __riscv_vle8_v_i8m2_partial_solve_wit_27_aux.

Definition __riscv_vle8_v_i8m2_partial_solve_wit_28_pure := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (retval_26: Z) (retval_27: Z) (PreH1 : (retval_27 = (s8_read_lane (26) (vl_pre) (idx) (L)))) (PreH2 : (retval_26 = (s8_read_lane (25) (vl_pre) (idx) (L)))) (PreH3 : (retval_25 = (s8_read_lane (24) (vl_pre) (idx) (L)))) (PreH4 : (retval_24 = (s8_read_lane (23) (vl_pre) (idx) (L)))) (PreH5 : (retval_23 = (s8_read_lane (22) (vl_pre) (idx) (L)))) (PreH6 : (retval_22 = (s8_read_lane (21) (vl_pre) (idx) (L)))) (PreH7 : (retval_21 = (s8_read_lane (20) (vl_pre) (idx) (L)))) (PreH8 : (retval_20 = (s8_read_lane (19) (vl_pre) (idx) (L)))) (PreH9 : (retval_19 = (s8_read_lane (18) (vl_pre) (idx) (L)))) (PreH10 : (retval_18 = (s8_read_lane (17) (vl_pre) (idx) (L)))) (PreH11 : (retval_17 = (s8_read_lane (16) (vl_pre) (idx) (L)))) (PreH12 : (retval_16 = (s8_read_lane (15) (vl_pre) (idx) (L)))) (PreH13 : (retval_15 = (s8_read_lane (14) (vl_pre) (idx) (L)))) (PreH14 : (retval_14 = (s8_read_lane (13) (vl_pre) (idx) (L)))) (PreH15 : (retval_13 = (s8_read_lane (12) (vl_pre) (idx) (L)))) (PreH16 : (retval_12 = (s8_read_lane (11) (vl_pre) (idx) (L)))) (PreH17 : (retval_11 = (s8_read_lane (10) (vl_pre) (idx) (L)))) (PreH18 : (retval_10 = (s8_read_lane (9) (vl_pre) (idx) (L)))) (PreH19 : (retval_9 = (s8_read_lane (8) (vl_pre) (idx) (L)))) (PreH20 : (retval_8 = (s8_read_lane (7) (vl_pre) (idx) (L)))) (PreH21 : (retval_7 = (s8_read_lane (6) (vl_pre) (idx) (L)))) (PreH22 : (retval_6 = (s8_read_lane (5) (vl_pre) (idx) (L)))) (PreH23 : (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L)))) (PreH24 : (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L)))) (PreH25 : (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L)))) (PreH26 : (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L)))) (PreH27 : (retval = (s8_read_lane (0) (vl_pre) (idx) (L)))) (PreH28 : (0 <= vl_pre)) (PreH29 : (vl_pre <= 32)) (PreH30 : (0 <= idx)) (PreH31 : ((idx + vl_pre ) <= count)) (PreH32 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |-> retval_27)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |-> retval_26)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |-> retval_25)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |-> retval_17)
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
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= 27) ” 
  &&  “ (27 < 128) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
.

Definition __riscv_vle8_v_i8m2_partial_solve_wit_28_aux := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (retval_26: Z) (retval_27: Z) (PreH1 : (retval_27 = (s8_read_lane (26) (vl_pre) (idx) (L)))) (PreH2 : (retval_26 = (s8_read_lane (25) (vl_pre) (idx) (L)))) (PreH3 : (retval_25 = (s8_read_lane (24) (vl_pre) (idx) (L)))) (PreH4 : (retval_24 = (s8_read_lane (23) (vl_pre) (idx) (L)))) (PreH5 : (retval_23 = (s8_read_lane (22) (vl_pre) (idx) (L)))) (PreH6 : (retval_22 = (s8_read_lane (21) (vl_pre) (idx) (L)))) (PreH7 : (retval_21 = (s8_read_lane (20) (vl_pre) (idx) (L)))) (PreH8 : (retval_20 = (s8_read_lane (19) (vl_pre) (idx) (L)))) (PreH9 : (retval_19 = (s8_read_lane (18) (vl_pre) (idx) (L)))) (PreH10 : (retval_18 = (s8_read_lane (17) (vl_pre) (idx) (L)))) (PreH11 : (retval_17 = (s8_read_lane (16) (vl_pre) (idx) (L)))) (PreH12 : (retval_16 = (s8_read_lane (15) (vl_pre) (idx) (L)))) (PreH13 : (retval_15 = (s8_read_lane (14) (vl_pre) (idx) (L)))) (PreH14 : (retval_14 = (s8_read_lane (13) (vl_pre) (idx) (L)))) (PreH15 : (retval_13 = (s8_read_lane (12) (vl_pre) (idx) (L)))) (PreH16 : (retval_12 = (s8_read_lane (11) (vl_pre) (idx) (L)))) (PreH17 : (retval_11 = (s8_read_lane (10) (vl_pre) (idx) (L)))) (PreH18 : (retval_10 = (s8_read_lane (9) (vl_pre) (idx) (L)))) (PreH19 : (retval_9 = (s8_read_lane (8) (vl_pre) (idx) (L)))) (PreH20 : (retval_8 = (s8_read_lane (7) (vl_pre) (idx) (L)))) (PreH21 : (retval_7 = (s8_read_lane (6) (vl_pre) (idx) (L)))) (PreH22 : (retval_6 = (s8_read_lane (5) (vl_pre) (idx) (L)))) (PreH23 : (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L)))) (PreH24 : (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L)))) (PreH25 : (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L)))) (PreH26 : (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L)))) (PreH27 : (retval = (s8_read_lane (0) (vl_pre) (idx) (L)))) (PreH28 : (0 <= vl_pre)) (PreH29 : (vl_pre <= 32)) (PreH30 : (0 <= idx)) (PreH31 : ((idx + vl_pre ) <= count)) (PreH32 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |-> retval_27)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |-> retval_26)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |-> retval_25)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |-> retval_17)
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
  “ (0 <= 27) ” 
  &&  “ (27 < 128) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ” 
  &&  “ (retval_27 = (s8_read_lane (26) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_26 = (s8_read_lane (25) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_25 = (s8_read_lane (24) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_24 = (s8_read_lane (23) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_23 = (s8_read_lane (22) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_22 = (s8_read_lane (21) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_21 = (s8_read_lane (20) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_20 = (s8_read_lane (19) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_19 = (s8_read_lane (18) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_18 = (s8_read_lane (17) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_17 = (s8_read_lane (16) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_16 = (s8_read_lane (15) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_15 = (s8_read_lane (14) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_14 = (s8_read_lane (13) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_13 = (s8_read_lane (12) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_12 = (s8_read_lane (11) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_11 = (s8_read_lane (10) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_10 = (s8_read_lane (9) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_9 = (s8_read_lane (8) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_8 = (s8_read_lane (7) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_7 = (s8_read_lane (6) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_6 = (s8_read_lane (5) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L))) ” 
  &&  “ (retval = (s8_read_lane (0) (vl_pre) (idx) (L))) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
  &&  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |-> retval_27)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |-> retval_26)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |-> retval_25)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |-> retval_17)
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
.

Definition __riscv_vle8_v_i8m2_partial_solve_wit_28 := __riscv_vle8_v_i8m2_partial_solve_wit_28_pure -> __riscv_vle8_v_i8m2_partial_solve_wit_28_aux.

Definition __riscv_vle8_v_i8m2_partial_solve_wit_29_pure := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (retval_26: Z) (retval_27: Z) (retval_28: Z) (PreH1 : (retval_28 = (s8_read_lane (27) (vl_pre) (idx) (L)))) (PreH2 : (retval_27 = (s8_read_lane (26) (vl_pre) (idx) (L)))) (PreH3 : (retval_26 = (s8_read_lane (25) (vl_pre) (idx) (L)))) (PreH4 : (retval_25 = (s8_read_lane (24) (vl_pre) (idx) (L)))) (PreH5 : (retval_24 = (s8_read_lane (23) (vl_pre) (idx) (L)))) (PreH6 : (retval_23 = (s8_read_lane (22) (vl_pre) (idx) (L)))) (PreH7 : (retval_22 = (s8_read_lane (21) (vl_pre) (idx) (L)))) (PreH8 : (retval_21 = (s8_read_lane (20) (vl_pre) (idx) (L)))) (PreH9 : (retval_20 = (s8_read_lane (19) (vl_pre) (idx) (L)))) (PreH10 : (retval_19 = (s8_read_lane (18) (vl_pre) (idx) (L)))) (PreH11 : (retval_18 = (s8_read_lane (17) (vl_pre) (idx) (L)))) (PreH12 : (retval_17 = (s8_read_lane (16) (vl_pre) (idx) (L)))) (PreH13 : (retval_16 = (s8_read_lane (15) (vl_pre) (idx) (L)))) (PreH14 : (retval_15 = (s8_read_lane (14) (vl_pre) (idx) (L)))) (PreH15 : (retval_14 = (s8_read_lane (13) (vl_pre) (idx) (L)))) (PreH16 : (retval_13 = (s8_read_lane (12) (vl_pre) (idx) (L)))) (PreH17 : (retval_12 = (s8_read_lane (11) (vl_pre) (idx) (L)))) (PreH18 : (retval_11 = (s8_read_lane (10) (vl_pre) (idx) (L)))) (PreH19 : (retval_10 = (s8_read_lane (9) (vl_pre) (idx) (L)))) (PreH20 : (retval_9 = (s8_read_lane (8) (vl_pre) (idx) (L)))) (PreH21 : (retval_8 = (s8_read_lane (7) (vl_pre) (idx) (L)))) (PreH22 : (retval_7 = (s8_read_lane (6) (vl_pre) (idx) (L)))) (PreH23 : (retval_6 = (s8_read_lane (5) (vl_pre) (idx) (L)))) (PreH24 : (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L)))) (PreH25 : (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L)))) (PreH26 : (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L)))) (PreH27 : (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L)))) (PreH28 : (retval = (s8_read_lane (0) (vl_pre) (idx) (L)))) (PreH29 : (0 <= vl_pre)) (PreH30 : (vl_pre <= 32)) (PreH31 : (0 <= idx)) (PreH32 : ((idx + vl_pre ) <= count)) (PreH33 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |-> retval_28)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |-> retval_27)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |-> retval_26)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |-> retval_25)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |-> retval_17)
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
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= 28) ” 
  &&  “ (28 < 128) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
.

Definition __riscv_vle8_v_i8m2_partial_solve_wit_29_aux := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (retval_26: Z) (retval_27: Z) (retval_28: Z) (PreH1 : (retval_28 = (s8_read_lane (27) (vl_pre) (idx) (L)))) (PreH2 : (retval_27 = (s8_read_lane (26) (vl_pre) (idx) (L)))) (PreH3 : (retval_26 = (s8_read_lane (25) (vl_pre) (idx) (L)))) (PreH4 : (retval_25 = (s8_read_lane (24) (vl_pre) (idx) (L)))) (PreH5 : (retval_24 = (s8_read_lane (23) (vl_pre) (idx) (L)))) (PreH6 : (retval_23 = (s8_read_lane (22) (vl_pre) (idx) (L)))) (PreH7 : (retval_22 = (s8_read_lane (21) (vl_pre) (idx) (L)))) (PreH8 : (retval_21 = (s8_read_lane (20) (vl_pre) (idx) (L)))) (PreH9 : (retval_20 = (s8_read_lane (19) (vl_pre) (idx) (L)))) (PreH10 : (retval_19 = (s8_read_lane (18) (vl_pre) (idx) (L)))) (PreH11 : (retval_18 = (s8_read_lane (17) (vl_pre) (idx) (L)))) (PreH12 : (retval_17 = (s8_read_lane (16) (vl_pre) (idx) (L)))) (PreH13 : (retval_16 = (s8_read_lane (15) (vl_pre) (idx) (L)))) (PreH14 : (retval_15 = (s8_read_lane (14) (vl_pre) (idx) (L)))) (PreH15 : (retval_14 = (s8_read_lane (13) (vl_pre) (idx) (L)))) (PreH16 : (retval_13 = (s8_read_lane (12) (vl_pre) (idx) (L)))) (PreH17 : (retval_12 = (s8_read_lane (11) (vl_pre) (idx) (L)))) (PreH18 : (retval_11 = (s8_read_lane (10) (vl_pre) (idx) (L)))) (PreH19 : (retval_10 = (s8_read_lane (9) (vl_pre) (idx) (L)))) (PreH20 : (retval_9 = (s8_read_lane (8) (vl_pre) (idx) (L)))) (PreH21 : (retval_8 = (s8_read_lane (7) (vl_pre) (idx) (L)))) (PreH22 : (retval_7 = (s8_read_lane (6) (vl_pre) (idx) (L)))) (PreH23 : (retval_6 = (s8_read_lane (5) (vl_pre) (idx) (L)))) (PreH24 : (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L)))) (PreH25 : (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L)))) (PreH26 : (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L)))) (PreH27 : (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L)))) (PreH28 : (retval = (s8_read_lane (0) (vl_pre) (idx) (L)))) (PreH29 : (0 <= vl_pre)) (PreH30 : (vl_pre <= 32)) (PreH31 : (0 <= idx)) (PreH32 : ((idx + vl_pre ) <= count)) (PreH33 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |-> retval_28)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |-> retval_27)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |-> retval_26)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |-> retval_25)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |-> retval_17)
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
  “ (0 <= 28) ” 
  &&  “ (28 < 128) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ” 
  &&  “ (retval_28 = (s8_read_lane (27) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_27 = (s8_read_lane (26) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_26 = (s8_read_lane (25) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_25 = (s8_read_lane (24) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_24 = (s8_read_lane (23) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_23 = (s8_read_lane (22) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_22 = (s8_read_lane (21) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_21 = (s8_read_lane (20) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_20 = (s8_read_lane (19) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_19 = (s8_read_lane (18) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_18 = (s8_read_lane (17) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_17 = (s8_read_lane (16) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_16 = (s8_read_lane (15) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_15 = (s8_read_lane (14) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_14 = (s8_read_lane (13) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_13 = (s8_read_lane (12) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_12 = (s8_read_lane (11) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_11 = (s8_read_lane (10) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_10 = (s8_read_lane (9) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_9 = (s8_read_lane (8) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_8 = (s8_read_lane (7) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_7 = (s8_read_lane (6) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_6 = (s8_read_lane (5) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L))) ” 
  &&  “ (retval = (s8_read_lane (0) (vl_pre) (idx) (L))) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
  &&  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |-> retval_28)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |-> retval_27)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |-> retval_26)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |-> retval_25)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |-> retval_17)
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
.

Definition __riscv_vle8_v_i8m2_partial_solve_wit_29 := __riscv_vle8_v_i8m2_partial_solve_wit_29_pure -> __riscv_vle8_v_i8m2_partial_solve_wit_29_aux.

Definition __riscv_vle8_v_i8m2_partial_solve_wit_30_pure := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (retval_26: Z) (retval_27: Z) (retval_28: Z) (retval_29: Z) (PreH1 : (retval_29 = (s8_read_lane (28) (vl_pre) (idx) (L)))) (PreH2 : (retval_28 = (s8_read_lane (27) (vl_pre) (idx) (L)))) (PreH3 : (retval_27 = (s8_read_lane (26) (vl_pre) (idx) (L)))) (PreH4 : (retval_26 = (s8_read_lane (25) (vl_pre) (idx) (L)))) (PreH5 : (retval_25 = (s8_read_lane (24) (vl_pre) (idx) (L)))) (PreH6 : (retval_24 = (s8_read_lane (23) (vl_pre) (idx) (L)))) (PreH7 : (retval_23 = (s8_read_lane (22) (vl_pre) (idx) (L)))) (PreH8 : (retval_22 = (s8_read_lane (21) (vl_pre) (idx) (L)))) (PreH9 : (retval_21 = (s8_read_lane (20) (vl_pre) (idx) (L)))) (PreH10 : (retval_20 = (s8_read_lane (19) (vl_pre) (idx) (L)))) (PreH11 : (retval_19 = (s8_read_lane (18) (vl_pre) (idx) (L)))) (PreH12 : (retval_18 = (s8_read_lane (17) (vl_pre) (idx) (L)))) (PreH13 : (retval_17 = (s8_read_lane (16) (vl_pre) (idx) (L)))) (PreH14 : (retval_16 = (s8_read_lane (15) (vl_pre) (idx) (L)))) (PreH15 : (retval_15 = (s8_read_lane (14) (vl_pre) (idx) (L)))) (PreH16 : (retval_14 = (s8_read_lane (13) (vl_pre) (idx) (L)))) (PreH17 : (retval_13 = (s8_read_lane (12) (vl_pre) (idx) (L)))) (PreH18 : (retval_12 = (s8_read_lane (11) (vl_pre) (idx) (L)))) (PreH19 : (retval_11 = (s8_read_lane (10) (vl_pre) (idx) (L)))) (PreH20 : (retval_10 = (s8_read_lane (9) (vl_pre) (idx) (L)))) (PreH21 : (retval_9 = (s8_read_lane (8) (vl_pre) (idx) (L)))) (PreH22 : (retval_8 = (s8_read_lane (7) (vl_pre) (idx) (L)))) (PreH23 : (retval_7 = (s8_read_lane (6) (vl_pre) (idx) (L)))) (PreH24 : (retval_6 = (s8_read_lane (5) (vl_pre) (idx) (L)))) (PreH25 : (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L)))) (PreH26 : (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L)))) (PreH27 : (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L)))) (PreH28 : (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L)))) (PreH29 : (retval = (s8_read_lane (0) (vl_pre) (idx) (L)))) (PreH30 : (0 <= vl_pre)) (PreH31 : (vl_pre <= 32)) (PreH32 : (0 <= idx)) (PreH33 : ((idx + vl_pre ) <= count)) (PreH34 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |-> retval_29)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |-> retval_28)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |-> retval_27)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |-> retval_26)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |-> retval_25)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |-> retval_17)
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
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= 29) ” 
  &&  “ (29 < 128) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
.

Definition __riscv_vle8_v_i8m2_partial_solve_wit_30_aux := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (retval_26: Z) (retval_27: Z) (retval_28: Z) (retval_29: Z) (PreH1 : (retval_29 = (s8_read_lane (28) (vl_pre) (idx) (L)))) (PreH2 : (retval_28 = (s8_read_lane (27) (vl_pre) (idx) (L)))) (PreH3 : (retval_27 = (s8_read_lane (26) (vl_pre) (idx) (L)))) (PreH4 : (retval_26 = (s8_read_lane (25) (vl_pre) (idx) (L)))) (PreH5 : (retval_25 = (s8_read_lane (24) (vl_pre) (idx) (L)))) (PreH6 : (retval_24 = (s8_read_lane (23) (vl_pre) (idx) (L)))) (PreH7 : (retval_23 = (s8_read_lane (22) (vl_pre) (idx) (L)))) (PreH8 : (retval_22 = (s8_read_lane (21) (vl_pre) (idx) (L)))) (PreH9 : (retval_21 = (s8_read_lane (20) (vl_pre) (idx) (L)))) (PreH10 : (retval_20 = (s8_read_lane (19) (vl_pre) (idx) (L)))) (PreH11 : (retval_19 = (s8_read_lane (18) (vl_pre) (idx) (L)))) (PreH12 : (retval_18 = (s8_read_lane (17) (vl_pre) (idx) (L)))) (PreH13 : (retval_17 = (s8_read_lane (16) (vl_pre) (idx) (L)))) (PreH14 : (retval_16 = (s8_read_lane (15) (vl_pre) (idx) (L)))) (PreH15 : (retval_15 = (s8_read_lane (14) (vl_pre) (idx) (L)))) (PreH16 : (retval_14 = (s8_read_lane (13) (vl_pre) (idx) (L)))) (PreH17 : (retval_13 = (s8_read_lane (12) (vl_pre) (idx) (L)))) (PreH18 : (retval_12 = (s8_read_lane (11) (vl_pre) (idx) (L)))) (PreH19 : (retval_11 = (s8_read_lane (10) (vl_pre) (idx) (L)))) (PreH20 : (retval_10 = (s8_read_lane (9) (vl_pre) (idx) (L)))) (PreH21 : (retval_9 = (s8_read_lane (8) (vl_pre) (idx) (L)))) (PreH22 : (retval_8 = (s8_read_lane (7) (vl_pre) (idx) (L)))) (PreH23 : (retval_7 = (s8_read_lane (6) (vl_pre) (idx) (L)))) (PreH24 : (retval_6 = (s8_read_lane (5) (vl_pre) (idx) (L)))) (PreH25 : (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L)))) (PreH26 : (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L)))) (PreH27 : (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L)))) (PreH28 : (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L)))) (PreH29 : (retval = (s8_read_lane (0) (vl_pre) (idx) (L)))) (PreH30 : (0 <= vl_pre)) (PreH31 : (vl_pre <= 32)) (PreH32 : (0 <= idx)) (PreH33 : ((idx + vl_pre ) <= count)) (PreH34 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |-> retval_29)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |-> retval_28)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |-> retval_27)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |-> retval_26)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |-> retval_25)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |-> retval_17)
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
  “ (0 <= 29) ” 
  &&  “ (29 < 128) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ” 
  &&  “ (retval_29 = (s8_read_lane (28) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_28 = (s8_read_lane (27) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_27 = (s8_read_lane (26) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_26 = (s8_read_lane (25) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_25 = (s8_read_lane (24) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_24 = (s8_read_lane (23) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_23 = (s8_read_lane (22) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_22 = (s8_read_lane (21) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_21 = (s8_read_lane (20) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_20 = (s8_read_lane (19) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_19 = (s8_read_lane (18) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_18 = (s8_read_lane (17) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_17 = (s8_read_lane (16) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_16 = (s8_read_lane (15) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_15 = (s8_read_lane (14) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_14 = (s8_read_lane (13) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_13 = (s8_read_lane (12) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_12 = (s8_read_lane (11) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_11 = (s8_read_lane (10) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_10 = (s8_read_lane (9) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_9 = (s8_read_lane (8) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_8 = (s8_read_lane (7) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_7 = (s8_read_lane (6) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_6 = (s8_read_lane (5) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L))) ” 
  &&  “ (retval = (s8_read_lane (0) (vl_pre) (idx) (L))) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
  &&  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |-> retval_29)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |-> retval_28)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |-> retval_27)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |-> retval_26)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |-> retval_25)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |-> retval_17)
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
.

Definition __riscv_vle8_v_i8m2_partial_solve_wit_30 := __riscv_vle8_v_i8m2_partial_solve_wit_30_pure -> __riscv_vle8_v_i8m2_partial_solve_wit_30_aux.

Definition __riscv_vle8_v_i8m2_partial_solve_wit_31_pure := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (retval_26: Z) (retval_27: Z) (retval_28: Z) (retval_29: Z) (retval_30: Z) (PreH1 : (retval_30 = (s8_read_lane (29) (vl_pre) (idx) (L)))) (PreH2 : (retval_29 = (s8_read_lane (28) (vl_pre) (idx) (L)))) (PreH3 : (retval_28 = (s8_read_lane (27) (vl_pre) (idx) (L)))) (PreH4 : (retval_27 = (s8_read_lane (26) (vl_pre) (idx) (L)))) (PreH5 : (retval_26 = (s8_read_lane (25) (vl_pre) (idx) (L)))) (PreH6 : (retval_25 = (s8_read_lane (24) (vl_pre) (idx) (L)))) (PreH7 : (retval_24 = (s8_read_lane (23) (vl_pre) (idx) (L)))) (PreH8 : (retval_23 = (s8_read_lane (22) (vl_pre) (idx) (L)))) (PreH9 : (retval_22 = (s8_read_lane (21) (vl_pre) (idx) (L)))) (PreH10 : (retval_21 = (s8_read_lane (20) (vl_pre) (idx) (L)))) (PreH11 : (retval_20 = (s8_read_lane (19) (vl_pre) (idx) (L)))) (PreH12 : (retval_19 = (s8_read_lane (18) (vl_pre) (idx) (L)))) (PreH13 : (retval_18 = (s8_read_lane (17) (vl_pre) (idx) (L)))) (PreH14 : (retval_17 = (s8_read_lane (16) (vl_pre) (idx) (L)))) (PreH15 : (retval_16 = (s8_read_lane (15) (vl_pre) (idx) (L)))) (PreH16 : (retval_15 = (s8_read_lane (14) (vl_pre) (idx) (L)))) (PreH17 : (retval_14 = (s8_read_lane (13) (vl_pre) (idx) (L)))) (PreH18 : (retval_13 = (s8_read_lane (12) (vl_pre) (idx) (L)))) (PreH19 : (retval_12 = (s8_read_lane (11) (vl_pre) (idx) (L)))) (PreH20 : (retval_11 = (s8_read_lane (10) (vl_pre) (idx) (L)))) (PreH21 : (retval_10 = (s8_read_lane (9) (vl_pre) (idx) (L)))) (PreH22 : (retval_9 = (s8_read_lane (8) (vl_pre) (idx) (L)))) (PreH23 : (retval_8 = (s8_read_lane (7) (vl_pre) (idx) (L)))) (PreH24 : (retval_7 = (s8_read_lane (6) (vl_pre) (idx) (L)))) (PreH25 : (retval_6 = (s8_read_lane (5) (vl_pre) (idx) (L)))) (PreH26 : (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L)))) (PreH27 : (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L)))) (PreH28 : (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L)))) (PreH29 : (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L)))) (PreH30 : (retval = (s8_read_lane (0) (vl_pre) (idx) (L)))) (PreH31 : (0 <= vl_pre)) (PreH32 : (vl_pre <= 32)) (PreH33 : (0 <= idx)) (PreH34 : ((idx + vl_pre ) <= count)) (PreH35 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |-> retval_30)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |-> retval_29)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |-> retval_28)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |-> retval_27)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |-> retval_26)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |-> retval_25)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |-> retval_17)
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
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= 30) ” 
  &&  “ (30 < 128) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
.

Definition __riscv_vle8_v_i8m2_partial_solve_wit_31_aux := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (retval_26: Z) (retval_27: Z) (retval_28: Z) (retval_29: Z) (retval_30: Z) (PreH1 : (retval_30 = (s8_read_lane (29) (vl_pre) (idx) (L)))) (PreH2 : (retval_29 = (s8_read_lane (28) (vl_pre) (idx) (L)))) (PreH3 : (retval_28 = (s8_read_lane (27) (vl_pre) (idx) (L)))) (PreH4 : (retval_27 = (s8_read_lane (26) (vl_pre) (idx) (L)))) (PreH5 : (retval_26 = (s8_read_lane (25) (vl_pre) (idx) (L)))) (PreH6 : (retval_25 = (s8_read_lane (24) (vl_pre) (idx) (L)))) (PreH7 : (retval_24 = (s8_read_lane (23) (vl_pre) (idx) (L)))) (PreH8 : (retval_23 = (s8_read_lane (22) (vl_pre) (idx) (L)))) (PreH9 : (retval_22 = (s8_read_lane (21) (vl_pre) (idx) (L)))) (PreH10 : (retval_21 = (s8_read_lane (20) (vl_pre) (idx) (L)))) (PreH11 : (retval_20 = (s8_read_lane (19) (vl_pre) (idx) (L)))) (PreH12 : (retval_19 = (s8_read_lane (18) (vl_pre) (idx) (L)))) (PreH13 : (retval_18 = (s8_read_lane (17) (vl_pre) (idx) (L)))) (PreH14 : (retval_17 = (s8_read_lane (16) (vl_pre) (idx) (L)))) (PreH15 : (retval_16 = (s8_read_lane (15) (vl_pre) (idx) (L)))) (PreH16 : (retval_15 = (s8_read_lane (14) (vl_pre) (idx) (L)))) (PreH17 : (retval_14 = (s8_read_lane (13) (vl_pre) (idx) (L)))) (PreH18 : (retval_13 = (s8_read_lane (12) (vl_pre) (idx) (L)))) (PreH19 : (retval_12 = (s8_read_lane (11) (vl_pre) (idx) (L)))) (PreH20 : (retval_11 = (s8_read_lane (10) (vl_pre) (idx) (L)))) (PreH21 : (retval_10 = (s8_read_lane (9) (vl_pre) (idx) (L)))) (PreH22 : (retval_9 = (s8_read_lane (8) (vl_pre) (idx) (L)))) (PreH23 : (retval_8 = (s8_read_lane (7) (vl_pre) (idx) (L)))) (PreH24 : (retval_7 = (s8_read_lane (6) (vl_pre) (idx) (L)))) (PreH25 : (retval_6 = (s8_read_lane (5) (vl_pre) (idx) (L)))) (PreH26 : (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L)))) (PreH27 : (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L)))) (PreH28 : (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L)))) (PreH29 : (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L)))) (PreH30 : (retval = (s8_read_lane (0) (vl_pre) (idx) (L)))) (PreH31 : (0 <= vl_pre)) (PreH32 : (vl_pre <= 32)) (PreH33 : (0 <= idx)) (PreH34 : ((idx + vl_pre ) <= count)) (PreH35 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |-> retval_30)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |-> retval_29)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |-> retval_28)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |-> retval_27)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |-> retval_26)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |-> retval_25)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |-> retval_17)
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
  “ (0 <= 30) ” 
  &&  “ (30 < 128) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ” 
  &&  “ (retval_30 = (s8_read_lane (29) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_29 = (s8_read_lane (28) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_28 = (s8_read_lane (27) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_27 = (s8_read_lane (26) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_26 = (s8_read_lane (25) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_25 = (s8_read_lane (24) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_24 = (s8_read_lane (23) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_23 = (s8_read_lane (22) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_22 = (s8_read_lane (21) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_21 = (s8_read_lane (20) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_20 = (s8_read_lane (19) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_19 = (s8_read_lane (18) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_18 = (s8_read_lane (17) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_17 = (s8_read_lane (16) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_16 = (s8_read_lane (15) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_15 = (s8_read_lane (14) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_14 = (s8_read_lane (13) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_13 = (s8_read_lane (12) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_12 = (s8_read_lane (11) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_11 = (s8_read_lane (10) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_10 = (s8_read_lane (9) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_9 = (s8_read_lane (8) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_8 = (s8_read_lane (7) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_7 = (s8_read_lane (6) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_6 = (s8_read_lane (5) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L))) ” 
  &&  “ (retval = (s8_read_lane (0) (vl_pre) (idx) (L))) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
  &&  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |-> retval_30)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |-> retval_29)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |-> retval_28)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |-> retval_27)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |-> retval_26)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |-> retval_25)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |-> retval_17)
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
.

Definition __riscv_vle8_v_i8m2_partial_solve_wit_31 := __riscv_vle8_v_i8m2_partial_solve_wit_31_pure -> __riscv_vle8_v_i8m2_partial_solve_wit_31_aux.

Definition __riscv_vle8_v_i8m2_partial_solve_wit_32_pure := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (retval_26: Z) (retval_27: Z) (retval_28: Z) (retval_29: Z) (retval_30: Z) (retval_31: Z) (PreH1 : (retval_31 = (s8_read_lane (30) (vl_pre) (idx) (L)))) (PreH2 : (retval_30 = (s8_read_lane (29) (vl_pre) (idx) (L)))) (PreH3 : (retval_29 = (s8_read_lane (28) (vl_pre) (idx) (L)))) (PreH4 : (retval_28 = (s8_read_lane (27) (vl_pre) (idx) (L)))) (PreH5 : (retval_27 = (s8_read_lane (26) (vl_pre) (idx) (L)))) (PreH6 : (retval_26 = (s8_read_lane (25) (vl_pre) (idx) (L)))) (PreH7 : (retval_25 = (s8_read_lane (24) (vl_pre) (idx) (L)))) (PreH8 : (retval_24 = (s8_read_lane (23) (vl_pre) (idx) (L)))) (PreH9 : (retval_23 = (s8_read_lane (22) (vl_pre) (idx) (L)))) (PreH10 : (retval_22 = (s8_read_lane (21) (vl_pre) (idx) (L)))) (PreH11 : (retval_21 = (s8_read_lane (20) (vl_pre) (idx) (L)))) (PreH12 : (retval_20 = (s8_read_lane (19) (vl_pre) (idx) (L)))) (PreH13 : (retval_19 = (s8_read_lane (18) (vl_pre) (idx) (L)))) (PreH14 : (retval_18 = (s8_read_lane (17) (vl_pre) (idx) (L)))) (PreH15 : (retval_17 = (s8_read_lane (16) (vl_pre) (idx) (L)))) (PreH16 : (retval_16 = (s8_read_lane (15) (vl_pre) (idx) (L)))) (PreH17 : (retval_15 = (s8_read_lane (14) (vl_pre) (idx) (L)))) (PreH18 : (retval_14 = (s8_read_lane (13) (vl_pre) (idx) (L)))) (PreH19 : (retval_13 = (s8_read_lane (12) (vl_pre) (idx) (L)))) (PreH20 : (retval_12 = (s8_read_lane (11) (vl_pre) (idx) (L)))) (PreH21 : (retval_11 = (s8_read_lane (10) (vl_pre) (idx) (L)))) (PreH22 : (retval_10 = (s8_read_lane (9) (vl_pre) (idx) (L)))) (PreH23 : (retval_9 = (s8_read_lane (8) (vl_pre) (idx) (L)))) (PreH24 : (retval_8 = (s8_read_lane (7) (vl_pre) (idx) (L)))) (PreH25 : (retval_7 = (s8_read_lane (6) (vl_pre) (idx) (L)))) (PreH26 : (retval_6 = (s8_read_lane (5) (vl_pre) (idx) (L)))) (PreH27 : (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L)))) (PreH28 : (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L)))) (PreH29 : (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L)))) (PreH30 : (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L)))) (PreH31 : (retval = (s8_read_lane (0) (vl_pre) (idx) (L)))) (PreH32 : (0 <= vl_pre)) (PreH33 : (vl_pre <= 32)) (PreH34 : (0 <= idx)) (PreH35 : ((idx + vl_pre ) <= count)) (PreH36 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |-> retval_31)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |-> retval_30)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |-> retval_29)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |-> retval_28)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |-> retval_27)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |-> retval_26)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |-> retval_25)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |-> retval_17)
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
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
|--
  “ (0 <= 31) ” 
  &&  “ (31 < 128) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
.

Definition __riscv_vle8_v_i8m2_partial_solve_wit_32_aux := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (retval_26: Z) (retval_27: Z) (retval_28: Z) (retval_29: Z) (retval_30: Z) (retval_31: Z) (PreH1 : (retval_31 = (s8_read_lane (30) (vl_pre) (idx) (L)))) (PreH2 : (retval_30 = (s8_read_lane (29) (vl_pre) (idx) (L)))) (PreH3 : (retval_29 = (s8_read_lane (28) (vl_pre) (idx) (L)))) (PreH4 : (retval_28 = (s8_read_lane (27) (vl_pre) (idx) (L)))) (PreH5 : (retval_27 = (s8_read_lane (26) (vl_pre) (idx) (L)))) (PreH6 : (retval_26 = (s8_read_lane (25) (vl_pre) (idx) (L)))) (PreH7 : (retval_25 = (s8_read_lane (24) (vl_pre) (idx) (L)))) (PreH8 : (retval_24 = (s8_read_lane (23) (vl_pre) (idx) (L)))) (PreH9 : (retval_23 = (s8_read_lane (22) (vl_pre) (idx) (L)))) (PreH10 : (retval_22 = (s8_read_lane (21) (vl_pre) (idx) (L)))) (PreH11 : (retval_21 = (s8_read_lane (20) (vl_pre) (idx) (L)))) (PreH12 : (retval_20 = (s8_read_lane (19) (vl_pre) (idx) (L)))) (PreH13 : (retval_19 = (s8_read_lane (18) (vl_pre) (idx) (L)))) (PreH14 : (retval_18 = (s8_read_lane (17) (vl_pre) (idx) (L)))) (PreH15 : (retval_17 = (s8_read_lane (16) (vl_pre) (idx) (L)))) (PreH16 : (retval_16 = (s8_read_lane (15) (vl_pre) (idx) (L)))) (PreH17 : (retval_15 = (s8_read_lane (14) (vl_pre) (idx) (L)))) (PreH18 : (retval_14 = (s8_read_lane (13) (vl_pre) (idx) (L)))) (PreH19 : (retval_13 = (s8_read_lane (12) (vl_pre) (idx) (L)))) (PreH20 : (retval_12 = (s8_read_lane (11) (vl_pre) (idx) (L)))) (PreH21 : (retval_11 = (s8_read_lane (10) (vl_pre) (idx) (L)))) (PreH22 : (retval_10 = (s8_read_lane (9) (vl_pre) (idx) (L)))) (PreH23 : (retval_9 = (s8_read_lane (8) (vl_pre) (idx) (L)))) (PreH24 : (retval_8 = (s8_read_lane (7) (vl_pre) (idx) (L)))) (PreH25 : (retval_7 = (s8_read_lane (6) (vl_pre) (idx) (L)))) (PreH26 : (retval_6 = (s8_read_lane (5) (vl_pre) (idx) (L)))) (PreH27 : (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L)))) (PreH28 : (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L)))) (PreH29 : (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L)))) (PreH30 : (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L)))) (PreH31 : (retval = (s8_read_lane (0) (vl_pre) (idx) (L)))) (PreH32 : (0 <= vl_pre)) (PreH33 : (vl_pre <= 32)) (PreH34 : (0 <= idx)) (PreH35 : ((idx + vl_pre ) <= count)) (PreH36 : (p_pre = (base + idx ))) ,
  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |-> retval_31)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |-> retval_30)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |-> retval_29)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |-> retval_28)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |-> retval_27)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |-> retval_26)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |-> retval_25)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |-> retval_17)
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
  “ (0 <= 31) ” 
  &&  “ (31 < 128) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 128) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ” 
  &&  “ (retval_31 = (s8_read_lane (30) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_30 = (s8_read_lane (29) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_29 = (s8_read_lane (28) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_28 = (s8_read_lane (27) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_27 = (s8_read_lane (26) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_26 = (s8_read_lane (25) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_25 = (s8_read_lane (24) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_24 = (s8_read_lane (23) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_23 = (s8_read_lane (22) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_22 = (s8_read_lane (21) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_21 = (s8_read_lane (20) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_20 = (s8_read_lane (19) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_19 = (s8_read_lane (18) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_18 = (s8_read_lane (17) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_17 = (s8_read_lane (16) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_16 = (s8_read_lane (15) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_15 = (s8_read_lane (14) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_14 = (s8_read_lane (13) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_13 = (s8_read_lane (12) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_12 = (s8_read_lane (11) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_11 = (s8_read_lane (10) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_10 = (s8_read_lane (9) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_9 = (s8_read_lane (8) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_8 = (s8_read_lane (7) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_7 = (s8_read_lane (6) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_6 = (s8_read_lane (5) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L))) ” 
  &&  “ (retval = (s8_read_lane (0) (vl_pre) (idx) (L))) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
  &&  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |-> retval_31)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |-> retval_30)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |-> retval_29)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |-> retval_28)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |-> retval_27)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |-> retval_26)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |-> retval_25)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |-> retval_17)
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
.

Definition __riscv_vle8_v_i8m2_partial_solve_wit_32 := __riscv_vle8_v_i8m2_partial_solve_wit_32_pure -> __riscv_vle8_v_i8m2_partial_solve_wit_32_aux.

Definition __riscv_vle8_v_i8m2_partial_solve_wit_33 := 
forall (vl_pre: Z) (p_pre: Z) (L: (@list Z)) (idx: Z) (count: Z) (base: Z) (retval: Z) (retval_2: Z) (retval_3: Z) (retval_4: Z) (retval_5: Z) (retval_6: Z) (retval_7: Z) (retval_8: Z) (retval_9: Z) (retval_10: Z) (retval_11: Z) (retval_12: Z) (retval_13: Z) (retval_14: Z) (retval_15: Z) (retval_16: Z) (retval_17: Z) (retval_18: Z) (retval_19: Z) (retval_20: Z) (retval_21: Z) (retval_22: Z) (retval_23: Z) (retval_24: Z) (retval_25: Z) (retval_26: Z) (retval_27: Z) (retval_28: Z) (retval_29: Z) (retval_30: Z) (retval_31: Z) (retval_32: Z) (record_return: Z) (PreH1 : (retval_32 = (s8_read_lane (31) (vl_pre) (idx) (L)))) (PreH2 : (retval_31 = (s8_read_lane (30) (vl_pre) (idx) (L)))) (PreH3 : (retval_30 = (s8_read_lane (29) (vl_pre) (idx) (L)))) (PreH4 : (retval_29 = (s8_read_lane (28) (vl_pre) (idx) (L)))) (PreH5 : (retval_28 = (s8_read_lane (27) (vl_pre) (idx) (L)))) (PreH6 : (retval_27 = (s8_read_lane (26) (vl_pre) (idx) (L)))) (PreH7 : (retval_26 = (s8_read_lane (25) (vl_pre) (idx) (L)))) (PreH8 : (retval_25 = (s8_read_lane (24) (vl_pre) (idx) (L)))) (PreH9 : (retval_24 = (s8_read_lane (23) (vl_pre) (idx) (L)))) (PreH10 : (retval_23 = (s8_read_lane (22) (vl_pre) (idx) (L)))) (PreH11 : (retval_22 = (s8_read_lane (21) (vl_pre) (idx) (L)))) (PreH12 : (retval_21 = (s8_read_lane (20) (vl_pre) (idx) (L)))) (PreH13 : (retval_20 = (s8_read_lane (19) (vl_pre) (idx) (L)))) (PreH14 : (retval_19 = (s8_read_lane (18) (vl_pre) (idx) (L)))) (PreH15 : (retval_18 = (s8_read_lane (17) (vl_pre) (idx) (L)))) (PreH16 : (retval_17 = (s8_read_lane (16) (vl_pre) (idx) (L)))) (PreH17 : (retval_16 = (s8_read_lane (15) (vl_pre) (idx) (L)))) (PreH18 : (retval_15 = (s8_read_lane (14) (vl_pre) (idx) (L)))) (PreH19 : (retval_14 = (s8_read_lane (13) (vl_pre) (idx) (L)))) (PreH20 : (retval_13 = (s8_read_lane (12) (vl_pre) (idx) (L)))) (PreH21 : (retval_12 = (s8_read_lane (11) (vl_pre) (idx) (L)))) (PreH22 : (retval_11 = (s8_read_lane (10) (vl_pre) (idx) (L)))) (PreH23 : (retval_10 = (s8_read_lane (9) (vl_pre) (idx) (L)))) (PreH24 : (retval_9 = (s8_read_lane (8) (vl_pre) (idx) (L)))) (PreH25 : (retval_8 = (s8_read_lane (7) (vl_pre) (idx) (L)))) (PreH26 : (retval_7 = (s8_read_lane (6) (vl_pre) (idx) (L)))) (PreH27 : (retval_6 = (s8_read_lane (5) (vl_pre) (idx) (L)))) (PreH28 : (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L)))) (PreH29 : (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L)))) (PreH30 : (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L)))) (PreH31 : (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L)))) (PreH32 : (retval = (s8_read_lane (0) (vl_pre) (idx) (L)))) (PreH33 : (0 <= vl_pre)) (PreH34 : (vl_pre <= 32)) (PreH35 : (0 <= idx)) (PreH36 : ((idx + vl_pre ) <= count)) (PreH37 : (p_pre = (base + idx ))) ,
  (UndefStructPredvint8m2_t record_return )
  **  (CharArray.full base count L )
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |-> retval_32)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |-> retval_31)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |-> retval_30)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |-> retval_29)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |-> retval_28)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |-> retval_27)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |-> retval_26)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |-> retval_25)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |-> retval_24)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |-> retval_23)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |-> retval_22)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |-> retval_21)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |-> retval_20)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |-> retval_19)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |-> retval_18)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |-> retval_17)
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
  “ (retval_32 = (s8_read_lane (31) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_31 = (s8_read_lane (30) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_30 = (s8_read_lane (29) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_29 = (s8_read_lane (28) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_28 = (s8_read_lane (27) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_27 = (s8_read_lane (26) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_26 = (s8_read_lane (25) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_25 = (s8_read_lane (24) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_24 = (s8_read_lane (23) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_23 = (s8_read_lane (22) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_22 = (s8_read_lane (21) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_21 = (s8_read_lane (20) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_20 = (s8_read_lane (19) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_19 = (s8_read_lane (18) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_18 = (s8_read_lane (17) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_17 = (s8_read_lane (16) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_16 = (s8_read_lane (15) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_15 = (s8_read_lane (14) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_14 = (s8_read_lane (13) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_13 = (s8_read_lane (12) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_12 = (s8_read_lane (11) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_11 = (s8_read_lane (10) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_10 = (s8_read_lane (9) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_9 = (s8_read_lane (8) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_8 = (s8_read_lane (7) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_7 = (s8_read_lane (6) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_6 = (s8_read_lane (5) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_5 = (s8_read_lane (4) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_4 = (s8_read_lane (3) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_3 = (s8_read_lane (2) (vl_pre) (idx) (L))) ” 
  &&  “ (retval_2 = (s8_read_lane (1) (vl_pre) (idx) (L))) ” 
  &&  “ (retval = (s8_read_lane (0) (vl_pre) (idx) (L))) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (0 <= idx) ” 
  &&  “ ((idx + vl_pre ) <= count) ” 
  &&  “ (p_pre = (base + idx )) ”
  &&  ((&((record_return)  # "vint8m2_t" ->ₛ "s31")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s31")) # Char  |-> retval_32)
  **  ((&((record_return)  # "vint8m2_t" ->ₛ "s30")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s30")) # Char  |-> retval_31)
  **  ((&((record_return)  # "vint8m2_t" ->ₛ "s29")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s29")) # Char  |-> retval_30)
  **  ((&((record_return)  # "vint8m2_t" ->ₛ "s28")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s28")) # Char  |-> retval_29)
  **  ((&((record_return)  # "vint8m2_t" ->ₛ "s27")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s27")) # Char  |-> retval_28)
  **  ((&((record_return)  # "vint8m2_t" ->ₛ "s26")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s26")) # Char  |-> retval_27)
  **  ((&((record_return)  # "vint8m2_t" ->ₛ "s25")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s25")) # Char  |-> retval_26)
  **  ((&((record_return)  # "vint8m2_t" ->ₛ "s24")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s24")) # Char  |-> retval_25)
  **  ((&((record_return)  # "vint8m2_t" ->ₛ "s23")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s23")) # Char  |-> retval_24)
  **  ((&((record_return)  # "vint8m2_t" ->ₛ "s22")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s22")) # Char  |-> retval_23)
  **  ((&((record_return)  # "vint8m2_t" ->ₛ "s21")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s21")) # Char  |-> retval_22)
  **  ((&((record_return)  # "vint8m2_t" ->ₛ "s20")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s20")) # Char  |-> retval_21)
  **  ((&((record_return)  # "vint8m2_t" ->ₛ "s19")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s19")) # Char  |-> retval_20)
  **  ((&((record_return)  # "vint8m2_t" ->ₛ "s18")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s18")) # Char  |-> retval_19)
  **  ((&((record_return)  # "vint8m2_t" ->ₛ "s17")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s17")) # Char  |-> retval_18)
  **  ((&((record_return)  # "vint8m2_t" ->ₛ "s16")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s16")) # Char  |-> retval_17)
  **  ((&((record_return)  # "vint8m2_t" ->ₛ "s15")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s15")) # Char  |-> retval_16)
  **  ((&((record_return)  # "vint8m2_t" ->ₛ "s14")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s14")) # Char  |-> retval_15)
  **  ((&((record_return)  # "vint8m2_t" ->ₛ "s13")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s13")) # Char  |-> retval_14)
  **  ((&((record_return)  # "vint8m2_t" ->ₛ "s12")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s12")) # Char  |-> retval_13)
  **  ((&((record_return)  # "vint8m2_t" ->ₛ "s11")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s11")) # Char  |-> retval_12)
  **  ((&((record_return)  # "vint8m2_t" ->ₛ "s10")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s10")) # Char  |-> retval_11)
  **  ((&((record_return)  # "vint8m2_t" ->ₛ "s9")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s9")) # Char  |-> retval_10)
  **  ((&((record_return)  # "vint8m2_t" ->ₛ "s8")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s8")) # Char  |-> retval_9)
  **  ((&((record_return)  # "vint8m2_t" ->ₛ "s7")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s7")) # Char  |-> retval_8)
  **  ((&((record_return)  # "vint8m2_t" ->ₛ "s6")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s6")) # Char  |-> retval_7)
  **  ((&((record_return)  # "vint8m2_t" ->ₛ "s5")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s5")) # Char  |-> retval_6)
  **  ((&((record_return)  # "vint8m2_t" ->ₛ "s4")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s4")) # Char  |-> retval_5)
  **  ((&((record_return)  # "vint8m2_t" ->ₛ "s3")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s3")) # Char  |-> retval_4)
  **  ((&((record_return)  # "vint8m2_t" ->ₛ "s2")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s2")) # Char  |-> retval_3)
  **  ((&((record_return)  # "vint8m2_t" ->ₛ "s1")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s1")) # Char  |-> retval_2)
  **  ((&((record_return)  # "vint8m2_t" ->ₛ "s0")) # Char  |->_)
  **  ((&(( &( "r" ) )->ₛ "s0")) # Char  |-> retval)
  **  (CharArray.full base count L )
.

Module Type VC_Correct.

Include s8_arrays_Strategy_Correct.

Axiom proof_of___riscv_vle8_v_i8m2_safety_wit_1 : __riscv_vle8_v_i8m2_safety_wit_1.
Axiom proof_of___riscv_vle8_v_i8m2_safety_wit_2 : __riscv_vle8_v_i8m2_safety_wit_2.
Axiom proof_of___riscv_vle8_v_i8m2_safety_wit_3 : __riscv_vle8_v_i8m2_safety_wit_3.
Axiom proof_of___riscv_vle8_v_i8m2_safety_wit_4 : __riscv_vle8_v_i8m2_safety_wit_4.
Axiom proof_of___riscv_vle8_v_i8m2_safety_wit_5 : __riscv_vle8_v_i8m2_safety_wit_5.
Axiom proof_of___riscv_vle8_v_i8m2_safety_wit_6 : __riscv_vle8_v_i8m2_safety_wit_6.
Axiom proof_of___riscv_vle8_v_i8m2_safety_wit_7 : __riscv_vle8_v_i8m2_safety_wit_7.
Axiom proof_of___riscv_vle8_v_i8m2_safety_wit_8 : __riscv_vle8_v_i8m2_safety_wit_8.
Axiom proof_of___riscv_vle8_v_i8m2_safety_wit_9 : __riscv_vle8_v_i8m2_safety_wit_9.
Axiom proof_of___riscv_vle8_v_i8m2_safety_wit_10 : __riscv_vle8_v_i8m2_safety_wit_10.
Axiom proof_of___riscv_vle8_v_i8m2_safety_wit_11 : __riscv_vle8_v_i8m2_safety_wit_11.
Axiom proof_of___riscv_vle8_v_i8m2_safety_wit_12 : __riscv_vle8_v_i8m2_safety_wit_12.
Axiom proof_of___riscv_vle8_v_i8m2_safety_wit_13 : __riscv_vle8_v_i8m2_safety_wit_13.
Axiom proof_of___riscv_vle8_v_i8m2_safety_wit_14 : __riscv_vle8_v_i8m2_safety_wit_14.
Axiom proof_of___riscv_vle8_v_i8m2_safety_wit_15 : __riscv_vle8_v_i8m2_safety_wit_15.
Axiom proof_of___riscv_vle8_v_i8m2_safety_wit_16 : __riscv_vle8_v_i8m2_safety_wit_16.
Axiom proof_of___riscv_vle8_v_i8m2_safety_wit_17 : __riscv_vle8_v_i8m2_safety_wit_17.
Axiom proof_of___riscv_vle8_v_i8m2_safety_wit_18 : __riscv_vle8_v_i8m2_safety_wit_18.
Axiom proof_of___riscv_vle8_v_i8m2_safety_wit_19 : __riscv_vle8_v_i8m2_safety_wit_19.
Axiom proof_of___riscv_vle8_v_i8m2_safety_wit_20 : __riscv_vle8_v_i8m2_safety_wit_20.
Axiom proof_of___riscv_vle8_v_i8m2_safety_wit_21 : __riscv_vle8_v_i8m2_safety_wit_21.
Axiom proof_of___riscv_vle8_v_i8m2_safety_wit_22 : __riscv_vle8_v_i8m2_safety_wit_22.
Axiom proof_of___riscv_vle8_v_i8m2_safety_wit_23 : __riscv_vle8_v_i8m2_safety_wit_23.
Axiom proof_of___riscv_vle8_v_i8m2_safety_wit_24 : __riscv_vle8_v_i8m2_safety_wit_24.
Axiom proof_of___riscv_vle8_v_i8m2_safety_wit_25 : __riscv_vle8_v_i8m2_safety_wit_25.
Axiom proof_of___riscv_vle8_v_i8m2_safety_wit_26 : __riscv_vle8_v_i8m2_safety_wit_26.
Axiom proof_of___riscv_vle8_v_i8m2_safety_wit_27 : __riscv_vle8_v_i8m2_safety_wit_27.
Axiom proof_of___riscv_vle8_v_i8m2_safety_wit_28 : __riscv_vle8_v_i8m2_safety_wit_28.
Axiom proof_of___riscv_vle8_v_i8m2_safety_wit_29 : __riscv_vle8_v_i8m2_safety_wit_29.
Axiom proof_of___riscv_vle8_v_i8m2_safety_wit_30 : __riscv_vle8_v_i8m2_safety_wit_30.
Axiom proof_of___riscv_vle8_v_i8m2_safety_wit_31 : __riscv_vle8_v_i8m2_safety_wit_31.
Axiom proof_of___riscv_vle8_v_i8m2_safety_wit_32 : __riscv_vle8_v_i8m2_safety_wit_32.
Axiom proof_of___riscv_vle8_v_i8m2_return_wit_1 : __riscv_vle8_v_i8m2_return_wit_1.
Axiom proof_of___riscv_vle8_v_i8m2_partial_solve_wit_1_pure : __riscv_vle8_v_i8m2_partial_solve_wit_1_pure.
Axiom proof_of___riscv_vle8_v_i8m2_partial_solve_wit_1 : __riscv_vle8_v_i8m2_partial_solve_wit_1.
Axiom proof_of___riscv_vle8_v_i8m2_partial_solve_wit_2_pure : __riscv_vle8_v_i8m2_partial_solve_wit_2_pure.
Axiom proof_of___riscv_vle8_v_i8m2_partial_solve_wit_2 : __riscv_vle8_v_i8m2_partial_solve_wit_2.
Axiom proof_of___riscv_vle8_v_i8m2_partial_solve_wit_3_pure : __riscv_vle8_v_i8m2_partial_solve_wit_3_pure.
Axiom proof_of___riscv_vle8_v_i8m2_partial_solve_wit_3 : __riscv_vle8_v_i8m2_partial_solve_wit_3.
Axiom proof_of___riscv_vle8_v_i8m2_partial_solve_wit_4_pure : __riscv_vle8_v_i8m2_partial_solve_wit_4_pure.
Axiom proof_of___riscv_vle8_v_i8m2_partial_solve_wit_4 : __riscv_vle8_v_i8m2_partial_solve_wit_4.
Axiom proof_of___riscv_vle8_v_i8m2_partial_solve_wit_5_pure : __riscv_vle8_v_i8m2_partial_solve_wit_5_pure.
Axiom proof_of___riscv_vle8_v_i8m2_partial_solve_wit_5 : __riscv_vle8_v_i8m2_partial_solve_wit_5.
Axiom proof_of___riscv_vle8_v_i8m2_partial_solve_wit_6_pure : __riscv_vle8_v_i8m2_partial_solve_wit_6_pure.
Axiom proof_of___riscv_vle8_v_i8m2_partial_solve_wit_6 : __riscv_vle8_v_i8m2_partial_solve_wit_6.
Axiom proof_of___riscv_vle8_v_i8m2_partial_solve_wit_7_pure : __riscv_vle8_v_i8m2_partial_solve_wit_7_pure.
Axiom proof_of___riscv_vle8_v_i8m2_partial_solve_wit_7 : __riscv_vle8_v_i8m2_partial_solve_wit_7.
Axiom proof_of___riscv_vle8_v_i8m2_partial_solve_wit_8_pure : __riscv_vle8_v_i8m2_partial_solve_wit_8_pure.
Axiom proof_of___riscv_vle8_v_i8m2_partial_solve_wit_8 : __riscv_vle8_v_i8m2_partial_solve_wit_8.
Axiom proof_of___riscv_vle8_v_i8m2_partial_solve_wit_9_pure : __riscv_vle8_v_i8m2_partial_solve_wit_9_pure.
Axiom proof_of___riscv_vle8_v_i8m2_partial_solve_wit_9 : __riscv_vle8_v_i8m2_partial_solve_wit_9.
Axiom proof_of___riscv_vle8_v_i8m2_partial_solve_wit_10_pure : __riscv_vle8_v_i8m2_partial_solve_wit_10_pure.
Axiom proof_of___riscv_vle8_v_i8m2_partial_solve_wit_10 : __riscv_vle8_v_i8m2_partial_solve_wit_10.
Axiom proof_of___riscv_vle8_v_i8m2_partial_solve_wit_11_pure : __riscv_vle8_v_i8m2_partial_solve_wit_11_pure.
Axiom proof_of___riscv_vle8_v_i8m2_partial_solve_wit_11 : __riscv_vle8_v_i8m2_partial_solve_wit_11.
Axiom proof_of___riscv_vle8_v_i8m2_partial_solve_wit_12_pure : __riscv_vle8_v_i8m2_partial_solve_wit_12_pure.
Axiom proof_of___riscv_vle8_v_i8m2_partial_solve_wit_12 : __riscv_vle8_v_i8m2_partial_solve_wit_12.
Axiom proof_of___riscv_vle8_v_i8m2_partial_solve_wit_13_pure : __riscv_vle8_v_i8m2_partial_solve_wit_13_pure.
Axiom proof_of___riscv_vle8_v_i8m2_partial_solve_wit_13 : __riscv_vle8_v_i8m2_partial_solve_wit_13.
Axiom proof_of___riscv_vle8_v_i8m2_partial_solve_wit_14_pure : __riscv_vle8_v_i8m2_partial_solve_wit_14_pure.
Axiom proof_of___riscv_vle8_v_i8m2_partial_solve_wit_14 : __riscv_vle8_v_i8m2_partial_solve_wit_14.
Axiom proof_of___riscv_vle8_v_i8m2_partial_solve_wit_15_pure : __riscv_vle8_v_i8m2_partial_solve_wit_15_pure.
Axiom proof_of___riscv_vle8_v_i8m2_partial_solve_wit_15 : __riscv_vle8_v_i8m2_partial_solve_wit_15.
Axiom proof_of___riscv_vle8_v_i8m2_partial_solve_wit_16_pure : __riscv_vle8_v_i8m2_partial_solve_wit_16_pure.
Axiom proof_of___riscv_vle8_v_i8m2_partial_solve_wit_16 : __riscv_vle8_v_i8m2_partial_solve_wit_16.
Axiom proof_of___riscv_vle8_v_i8m2_partial_solve_wit_17_pure : __riscv_vle8_v_i8m2_partial_solve_wit_17_pure.
Axiom proof_of___riscv_vle8_v_i8m2_partial_solve_wit_17 : __riscv_vle8_v_i8m2_partial_solve_wit_17.
Axiom proof_of___riscv_vle8_v_i8m2_partial_solve_wit_18_pure : __riscv_vle8_v_i8m2_partial_solve_wit_18_pure.
Axiom proof_of___riscv_vle8_v_i8m2_partial_solve_wit_18 : __riscv_vle8_v_i8m2_partial_solve_wit_18.
Axiom proof_of___riscv_vle8_v_i8m2_partial_solve_wit_19_pure : __riscv_vle8_v_i8m2_partial_solve_wit_19_pure.
Axiom proof_of___riscv_vle8_v_i8m2_partial_solve_wit_19 : __riscv_vle8_v_i8m2_partial_solve_wit_19.
Axiom proof_of___riscv_vle8_v_i8m2_partial_solve_wit_20_pure : __riscv_vle8_v_i8m2_partial_solve_wit_20_pure.
Axiom proof_of___riscv_vle8_v_i8m2_partial_solve_wit_20 : __riscv_vle8_v_i8m2_partial_solve_wit_20.
Axiom proof_of___riscv_vle8_v_i8m2_partial_solve_wit_21_pure : __riscv_vle8_v_i8m2_partial_solve_wit_21_pure.
Axiom proof_of___riscv_vle8_v_i8m2_partial_solve_wit_21 : __riscv_vle8_v_i8m2_partial_solve_wit_21.
Axiom proof_of___riscv_vle8_v_i8m2_partial_solve_wit_22_pure : __riscv_vle8_v_i8m2_partial_solve_wit_22_pure.
Axiom proof_of___riscv_vle8_v_i8m2_partial_solve_wit_22 : __riscv_vle8_v_i8m2_partial_solve_wit_22.
Axiom proof_of___riscv_vle8_v_i8m2_partial_solve_wit_23_pure : __riscv_vle8_v_i8m2_partial_solve_wit_23_pure.
Axiom proof_of___riscv_vle8_v_i8m2_partial_solve_wit_23 : __riscv_vle8_v_i8m2_partial_solve_wit_23.
Axiom proof_of___riscv_vle8_v_i8m2_partial_solve_wit_24_pure : __riscv_vle8_v_i8m2_partial_solve_wit_24_pure.
Axiom proof_of___riscv_vle8_v_i8m2_partial_solve_wit_24 : __riscv_vle8_v_i8m2_partial_solve_wit_24.
Axiom proof_of___riscv_vle8_v_i8m2_partial_solve_wit_25_pure : __riscv_vle8_v_i8m2_partial_solve_wit_25_pure.
Axiom proof_of___riscv_vle8_v_i8m2_partial_solve_wit_25 : __riscv_vle8_v_i8m2_partial_solve_wit_25.
Axiom proof_of___riscv_vle8_v_i8m2_partial_solve_wit_26_pure : __riscv_vle8_v_i8m2_partial_solve_wit_26_pure.
Axiom proof_of___riscv_vle8_v_i8m2_partial_solve_wit_26 : __riscv_vle8_v_i8m2_partial_solve_wit_26.
Axiom proof_of___riscv_vle8_v_i8m2_partial_solve_wit_27_pure : __riscv_vle8_v_i8m2_partial_solve_wit_27_pure.
Axiom proof_of___riscv_vle8_v_i8m2_partial_solve_wit_27 : __riscv_vle8_v_i8m2_partial_solve_wit_27.
Axiom proof_of___riscv_vle8_v_i8m2_partial_solve_wit_28_pure : __riscv_vle8_v_i8m2_partial_solve_wit_28_pure.
Axiom proof_of___riscv_vle8_v_i8m2_partial_solve_wit_28 : __riscv_vle8_v_i8m2_partial_solve_wit_28.
Axiom proof_of___riscv_vle8_v_i8m2_partial_solve_wit_29_pure : __riscv_vle8_v_i8m2_partial_solve_wit_29_pure.
Axiom proof_of___riscv_vle8_v_i8m2_partial_solve_wit_29 : __riscv_vle8_v_i8m2_partial_solve_wit_29.
Axiom proof_of___riscv_vle8_v_i8m2_partial_solve_wit_30_pure : __riscv_vle8_v_i8m2_partial_solve_wit_30_pure.
Axiom proof_of___riscv_vle8_v_i8m2_partial_solve_wit_30 : __riscv_vle8_v_i8m2_partial_solve_wit_30.
Axiom proof_of___riscv_vle8_v_i8m2_partial_solve_wit_31_pure : __riscv_vle8_v_i8m2_partial_solve_wit_31_pure.
Axiom proof_of___riscv_vle8_v_i8m2_partial_solve_wit_31 : __riscv_vle8_v_i8m2_partial_solve_wit_31.
Axiom proof_of___riscv_vle8_v_i8m2_partial_solve_wit_32_pure : __riscv_vle8_v_i8m2_partial_solve_wit_32_pure.
Axiom proof_of___riscv_vle8_v_i8m2_partial_solve_wit_32 : __riscv_vle8_v_i8m2_partial_solve_wit_32.
Axiom proof_of___riscv_vle8_v_i8m2_partial_solve_wit_33 : __riscv_vle8_v_i8m2_partial_solve_wit_33.

End VC_Correct.
