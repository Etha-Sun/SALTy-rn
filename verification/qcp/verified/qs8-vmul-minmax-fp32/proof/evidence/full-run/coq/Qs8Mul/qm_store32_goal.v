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
Require Import Qs8Mul.Types.
Require Import Qs8Mul.IntrinsicModel.
Require Import Qs8Mul.ActiveModel.
Require Import Qs8Mul.VectorValues.
Local Open Scope sac.
From Qs8Mul Require Import byte_store_strategy_goal.
From Qs8Mul Require Import byte_store_strategy_proof.

(*----- Function qm_store32 -----*)

Definition qm_store32_safety_wit_1 := 
forall (vl_pre: Z) (a_pre: Z) (out_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (0 <= vl_pre)) (PreH2 : (vl_pre <= 32)) ,
  ((( &( "i" ) )) # UInt64  |->_)
  **  ((( &( "out" ) )) # Ptr  |-> out_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  (CharArray.undef_full out_pre vl_pre )
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s7")) # Char  |-> x7)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s8")) # Char  |-> x8)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s9")) # Char  |-> x9)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s10")) # Char  |-> x10)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s11")) # Char  |-> x11)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s12")) # Char  |-> x12)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s13")) # Char  |-> x13)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s14")) # Char  |-> x14)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s15")) # Char  |-> x15)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s16")) # Char  |-> x16)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s17")) # Char  |-> x17)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s18")) # Char  |-> x18)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s19")) # Char  |-> x19)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s20")) # Char  |-> x20)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s21")) # Char  |-> x21)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s22")) # Char  |-> x22)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s23")) # Char  |-> x23)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s24")) # Char  |-> x24)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s25")) # Char  |-> x25)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s26")) # Char  |-> x26)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s27")) # Char  |-> x27)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s28")) # Char  |-> x28)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s29")) # Char  |-> x29)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s30")) # Char  |-> x30)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s31")) # Char  |-> x31)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qm_store32_entail_wit_1 := 
forall (vl_pre: Z) (a_pre: Z) (out_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (0 <= vl_pre)) (PreH2 : (vl_pre <= 32)) ,
  (CharArray.undef_full out_pre vl_pre )
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s7")) # Char  |-> x7)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s8")) # Char  |-> x8)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s9")) # Char  |-> x9)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s10")) # Char  |-> x10)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s11")) # Char  |-> x11)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s12")) # Char  |-> x12)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s13")) # Char  |-> x13)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s14")) # Char  |-> x14)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s15")) # Char  |-> x15)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s16")) # Char  |-> x16)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s17")) # Char  |-> x17)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s18")) # Char  |-> x18)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s19")) # Char  |-> x19)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s20")) # Char  |-> x20)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s21")) # Char  |-> x21)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s22")) # Char  |-> x22)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s23")) # Char  |-> x23)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s24")) # Char  |-> x24)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s25")) # Char  |-> x25)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s26")) # Char  |-> x26)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s27")) # Char  |-> x27)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s28")) # Char  |-> x28)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s29")) # Char  |-> x29)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s30")) # Char  |-> x30)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s31")) # Char  |-> x31)
|--
  “ (0 <= 0) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
  &&  (CharArray.full out_pre 0 (qm_take32 (0) ((qm_list32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) )
  **  (CharArray.undef_seg out_pre 0 vl_pre )
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s7")) # Char  |-> x7)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s8")) # Char  |-> x8)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s9")) # Char  |-> x9)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s10")) # Char  |-> x10)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s11")) # Char  |-> x11)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s12")) # Char  |-> x12)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s13")) # Char  |-> x13)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s14")) # Char  |-> x14)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s15")) # Char  |-> x15)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s16")) # Char  |-> x16)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s17")) # Char  |-> x17)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s18")) # Char  |-> x18)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s19")) # Char  |-> x19)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s20")) # Char  |-> x20)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s21")) # Char  |-> x21)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s22")) # Char  |-> x22)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s23")) # Char  |-> x23)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s24")) # Char  |-> x24)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s25")) # Char  |-> x25)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s26")) # Char  |-> x26)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s27")) # Char  |-> x27)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s28")) # Char  |-> x28)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s29")) # Char  |-> x29)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s30")) # Char  |-> x30)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s31")) # Char  |-> x31)
.

Definition qm_store32_entail_wit_2 := 
(
forall (vl_pre: Z) (a_pre: Z) (out_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (i: Z) (retval: Z) (PreH1 : (retval = (qm_vec32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31) (i)))) (PreH2 : (i < vl_pre)) (PreH3 : (0 <= i)) (PreH4 : (i <= vl_pre)) (PreH5 : (vl_pre <= 32)) ,
  (CharArray.full out_pre (i + 1 ) (app ((qm_take32 (i) ((qm_list32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))))) ((cons (retval) ((@nil Z))))) )
  **  (CharArray.undef_seg out_pre (i + 1 ) vl_pre )
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s7")) # Char  |-> x7)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s8")) # Char  |-> x8)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s9")) # Char  |-> x9)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s10")) # Char  |-> x10)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s11")) # Char  |-> x11)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s12")) # Char  |-> x12)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s13")) # Char  |-> x13)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s14")) # Char  |-> x14)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s15")) # Char  |-> x15)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s16")) # Char  |-> x16)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s17")) # Char  |-> x17)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s18")) # Char  |-> x18)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s19")) # Char  |-> x19)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s20")) # Char  |-> x20)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s21")) # Char  |-> x21)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s22")) # Char  |-> x22)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s23")) # Char  |-> x23)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s24")) # Char  |-> x24)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s25")) # Char  |-> x25)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s26")) # Char  |-> x26)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s27")) # Char  |-> x27)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s28")) # Char  |-> x28)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s29")) # Char  |-> x29)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s30")) # Char  |-> x30)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s31")) # Char  |-> x31)
|--
  “ (0 <= (i + 1 )) ” 
  &&  “ ((i + 1 ) <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
  &&  (CharArray.full out_pre (i + 1 ) (qm_take32 ((i + 1 )) ((qm_list32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) )
  **  (CharArray.undef_seg out_pre (i + 1 ) vl_pre )
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s7")) # Char  |-> x7)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s8")) # Char  |-> x8)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s9")) # Char  |-> x9)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s10")) # Char  |-> x10)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s11")) # Char  |-> x11)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s12")) # Char  |-> x12)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s13")) # Char  |-> x13)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s14")) # Char  |-> x14)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s15")) # Char  |-> x15)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s16")) # Char  |-> x16)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s17")) # Char  |-> x17)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s18")) # Char  |-> x18)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s19")) # Char  |-> x19)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s20")) # Char  |-> x20)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s21")) # Char  |-> x21)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s22")) # Char  |-> x22)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s23")) # Char  |-> x23)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s24")) # Char  |-> x24)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s25")) # Char  |-> x25)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s26")) # Char  |-> x26)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s27")) # Char  |-> x27)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s28")) # Char  |-> x28)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s29")) # Char  |-> x29)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s30")) # Char  |-> x30)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s31")) # Char  |-> x31)
) \/
(
forall (vl_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (i: Z) (retval: Z) (PreH1 : (retval = (qm_vec32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31) (i)))) (PreH2 : (i < vl_pre)) (PreH3 : (0 <= i)) (PreH4 : (i <= vl_pre)) (PreH5 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ ((app ((qm_take32 (i) ((qm_list32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))))) ((cons (retval) ((@nil Z))))) = (qm_take32 ((i + 1 )) ((qm_list32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))))) ”
  &&  emp
).

Definition qm_store32_entail_wit_2_split_goal_1 := 
forall (vl_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (i: Z) (retval: Z) (PreH1 : (retval = (qm_vec32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31) (i)))) (PreH2 : (i < vl_pre)) (PreH3 : (0 <= i)) (PreH4 : (i <= vl_pre)) (PreH5 : (vl_pre <= 32)) ,
  ((app ((qm_take32 (i) ((qm_list32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))))) ((cons (retval) ((@nil Z))))) = (qm_take32 ((i + 1 )) ((qm_list32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))))
.

Definition qm_store32_return_wit_1 := 
(
forall (vl_pre: Z) (a_pre: Z) (out_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (i: Z) (PreH1 : (i >= vl_pre)) (PreH2 : (0 <= i)) (PreH3 : (i <= vl_pre)) (PreH4 : (vl_pre <= 32)) ,
  (CharArray.full out_pre i (qm_take32 (i) ((qm_list32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) )
  **  (CharArray.undef_seg out_pre i vl_pre )
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s7")) # Char  |-> x7)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s8")) # Char  |-> x8)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s9")) # Char  |-> x9)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s10")) # Char  |-> x10)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s11")) # Char  |-> x11)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s12")) # Char  |-> x12)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s13")) # Char  |-> x13)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s14")) # Char  |-> x14)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s15")) # Char  |-> x15)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s16")) # Char  |-> x16)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s17")) # Char  |-> x17)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s18")) # Char  |-> x18)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s19")) # Char  |-> x19)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s20")) # Char  |-> x20)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s21")) # Char  |-> x21)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s22")) # Char  |-> x22)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s23")) # Char  |-> x23)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s24")) # Char  |-> x24)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s25")) # Char  |-> x25)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s26")) # Char  |-> x26)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s27")) # Char  |-> x27)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s28")) # Char  |-> x28)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s29")) # Char  |-> x29)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s30")) # Char  |-> x30)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s31")) # Char  |-> x31)
|--
  (CharArray.full out_pre vl_pre (qm_take32 (vl_pre) ((qm_list32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) )
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s7")) # Char  |-> x7)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s8")) # Char  |-> x8)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s9")) # Char  |-> x9)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s10")) # Char  |-> x10)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s11")) # Char  |-> x11)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s12")) # Char  |-> x12)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s13")) # Char  |-> x13)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s14")) # Char  |-> x14)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s15")) # Char  |-> x15)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s16")) # Char  |-> x16)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s17")) # Char  |-> x17)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s18")) # Char  |-> x18)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s19")) # Char  |-> x19)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s20")) # Char  |-> x20)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s21")) # Char  |-> x21)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s22")) # Char  |-> x22)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s23")) # Char  |-> x23)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s24")) # Char  |-> x24)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s25")) # Char  |-> x25)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s26")) # Char  |-> x26)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s27")) # Char  |-> x27)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s28")) # Char  |-> x28)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s29")) # Char  |-> x29)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s30")) # Char  |-> x30)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s31")) # Char  |-> x31)
) \/
(
forall (vl_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (i: Z) (PreH1 : (i >= vl_pre)) (PreH2 : (0 <= i)) (PreH3 : (i <= vl_pre)) (PreH4 : (vl_pre <= 32)) ,
  TT && emp 
|--
  “ ((qm_take32 (i) ((qm_list32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) = (qm_take32 (vl_pre) ((qm_list32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))))) ”
  &&  emp
).

Definition qm_store32_return_wit_1_split_goal_1 := 
forall (vl_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (i: Z) (PreH1 : (i >= vl_pre)) (PreH2 : (0 <= i)) (PreH3 : (i <= vl_pre)) (PreH4 : (vl_pre <= 32)) ,
  ((qm_take32 (i) ((qm_list32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) = (qm_take32 (vl_pre) ((qm_list32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))))
.

Definition qm_store32_partial_solve_wit_1_pure := 
forall (vl_pre: Z) (a_pre: Z) (out_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (i: Z) (PreH1 : (i < vl_pre)) (PreH2 : (0 <= i)) (PreH3 : (i <= vl_pre)) (PreH4 : (vl_pre <= 32)) ,
  ((( &( "x" ) )) # Char  |->_)
  **  ((( &( "i" ) )) # UInt64  |-> i)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "out" ) )) # Ptr  |-> out_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  (CharArray.full out_pre i (qm_take32 (i) ((qm_list32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) )
  **  (CharArray.undef_seg out_pre i vl_pre )
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s7")) # Char  |-> x7)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s8")) # Char  |-> x8)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s9")) # Char  |-> x9)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s10")) # Char  |-> x10)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s11")) # Char  |-> x11)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s12")) # Char  |-> x12)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s13")) # Char  |-> x13)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s14")) # Char  |-> x14)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s15")) # Char  |-> x15)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s16")) # Char  |-> x16)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s17")) # Char  |-> x17)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s18")) # Char  |-> x18)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s19")) # Char  |-> x19)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s20")) # Char  |-> x20)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s21")) # Char  |-> x21)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s22")) # Char  |-> x22)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s23")) # Char  |-> x23)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s24")) # Char  |-> x24)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s25")) # Char  |-> x25)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s26")) # Char  |-> x26)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s27")) # Char  |-> x27)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s28")) # Char  |-> x28)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s29")) # Char  |-> x29)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s30")) # Char  |-> x30)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s31")) # Char  |-> x31)
|--
  “ (0 <= i) ” 
  &&  “ (i < 32) ”
.

Definition qm_store32_partial_solve_wit_1_aux := 
forall (vl_pre: Z) (a_pre: Z) (out_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (i: Z) (PreH1 : (i < vl_pre)) (PreH2 : (0 <= i)) (PreH3 : (i <= vl_pre)) (PreH4 : (vl_pre <= 32)) ,
  (CharArray.full out_pre i (qm_take32 (i) ((qm_list32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) )
  **  (CharArray.undef_seg out_pre i vl_pre )
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s7")) # Char  |-> x7)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s8")) # Char  |-> x8)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s9")) # Char  |-> x9)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s10")) # Char  |-> x10)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s11")) # Char  |-> x11)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s12")) # Char  |-> x12)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s13")) # Char  |-> x13)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s14")) # Char  |-> x14)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s15")) # Char  |-> x15)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s16")) # Char  |-> x16)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s17")) # Char  |-> x17)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s18")) # Char  |-> x18)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s19")) # Char  |-> x19)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s20")) # Char  |-> x20)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s21")) # Char  |-> x21)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s22")) # Char  |-> x22)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s23")) # Char  |-> x23)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s24")) # Char  |-> x24)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s25")) # Char  |-> x25)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s26")) # Char  |-> x26)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s27")) # Char  |-> x27)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s28")) # Char  |-> x28)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s29")) # Char  |-> x29)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s30")) # Char  |-> x30)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s31")) # Char  |-> x31)
|--
  “ (0 <= i) ” 
  &&  “ (i < 32) ” 
  &&  “ (i < vl_pre) ” 
  &&  “ (0 <= i) ” 
  &&  “ (i <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
  &&  ((&((a_pre)  # "vint8m2_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s7")) # Char  |-> x7)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s8")) # Char  |-> x8)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s9")) # Char  |-> x9)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s10")) # Char  |-> x10)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s11")) # Char  |-> x11)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s12")) # Char  |-> x12)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s13")) # Char  |-> x13)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s14")) # Char  |-> x14)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s15")) # Char  |-> x15)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s16")) # Char  |-> x16)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s17")) # Char  |-> x17)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s18")) # Char  |-> x18)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s19")) # Char  |-> x19)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s20")) # Char  |-> x20)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s21")) # Char  |-> x21)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s22")) # Char  |-> x22)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s23")) # Char  |-> x23)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s24")) # Char  |-> x24)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s25")) # Char  |-> x25)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s26")) # Char  |-> x26)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s27")) # Char  |-> x27)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s28")) # Char  |-> x28)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s29")) # Char  |-> x29)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s30")) # Char  |-> x30)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s31")) # Char  |-> x31)
  **  (CharArray.full out_pre i (qm_take32 (i) ((qm_list32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) )
  **  (CharArray.undef_seg out_pre i vl_pre )
.

Definition qm_store32_partial_solve_wit_1 := qm_store32_partial_solve_wit_1_pure -> qm_store32_partial_solve_wit_1_aux.

Definition qm_store32_partial_solve_wit_2 := 
forall (vl_pre: Z) (a_pre: Z) (out_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (i: Z) (retval: Z) (PreH1 : (retval = (qm_vec32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31) (i)))) (PreH2 : (i < vl_pre)) (PreH3 : (0 <= i)) (PreH4 : (i <= vl_pre)) (PreH5 : (vl_pre <= 32)) ,
  ((&((a_pre)  # "vint8m2_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s7")) # Char  |-> x7)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s8")) # Char  |-> x8)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s9")) # Char  |-> x9)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s10")) # Char  |-> x10)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s11")) # Char  |-> x11)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s12")) # Char  |-> x12)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s13")) # Char  |-> x13)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s14")) # Char  |-> x14)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s15")) # Char  |-> x15)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s16")) # Char  |-> x16)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s17")) # Char  |-> x17)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s18")) # Char  |-> x18)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s19")) # Char  |-> x19)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s20")) # Char  |-> x20)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s21")) # Char  |-> x21)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s22")) # Char  |-> x22)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s23")) # Char  |-> x23)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s24")) # Char  |-> x24)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s25")) # Char  |-> x25)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s26")) # Char  |-> x26)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s27")) # Char  |-> x27)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s28")) # Char  |-> x28)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s29")) # Char  |-> x29)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s30")) # Char  |-> x30)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s31")) # Char  |-> x31)
  **  (CharArray.full out_pre i (qm_take32 (i) ((qm_list32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) )
  **  (CharArray.undef_seg out_pre i vl_pre )
|--
  “ (retval = (qm_vec32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31) (i))) ” 
  &&  “ (i < vl_pre) ” 
  &&  “ (0 <= i) ” 
  &&  “ (i <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
  &&  (((out_pre + (i * sizeof(CHAR)))) # Char  |->_)
  **  (CharArray.undef_seg out_pre (i + 1 ) vl_pre )
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s0")) # Char  |-> x0)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s1")) # Char  |-> x1)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s2")) # Char  |-> x2)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s3")) # Char  |-> x3)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s4")) # Char  |-> x4)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s5")) # Char  |-> x5)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s6")) # Char  |-> x6)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s7")) # Char  |-> x7)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s8")) # Char  |-> x8)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s9")) # Char  |-> x9)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s10")) # Char  |-> x10)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s11")) # Char  |-> x11)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s12")) # Char  |-> x12)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s13")) # Char  |-> x13)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s14")) # Char  |-> x14)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s15")) # Char  |-> x15)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s16")) # Char  |-> x16)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s17")) # Char  |-> x17)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s18")) # Char  |-> x18)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s19")) # Char  |-> x19)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s20")) # Char  |-> x20)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s21")) # Char  |-> x21)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s22")) # Char  |-> x22)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s23")) # Char  |-> x23)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s24")) # Char  |-> x24)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s25")) # Char  |-> x25)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s26")) # Char  |-> x26)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s27")) # Char  |-> x27)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s28")) # Char  |-> x28)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s29")) # Char  |-> x29)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s30")) # Char  |-> x30)
  **  ((&((a_pre)  # "vint8m2_t" ->ₛ "s31")) # Char  |-> x31)
  **  (CharArray.full out_pre i (qm_take32 (i) ((qm_list32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) )
.

Module Type VC_Correct.

Include byte_store_Strategy_Correct.

Axiom proof_of_qm_store32_safety_wit_1 : qm_store32_safety_wit_1.
Axiom proof_of_qm_store32_entail_wit_1 : qm_store32_entail_wit_1.
Axiom proof_of_qm_store32_entail_wit_2 : qm_store32_entail_wit_2.
Axiom proof_of_qm_store32_return_wit_1 : qm_store32_return_wit_1.
Axiom proof_of_qm_store32_partial_solve_wit_1_pure : qm_store32_partial_solve_wit_1_pure.
Axiom proof_of_qm_store32_partial_solve_wit_1 : qm_store32_partial_solve_wit_1.
Axiom proof_of_qm_store32_partial_solve_wit_2 : qm_store32_partial_solve_wit_2.

End VC_Correct.
