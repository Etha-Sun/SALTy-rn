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

(*----- Function qm_get32 -----*)

Definition qm_get32_safety_wit_1 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
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

Definition qm_get32_safety_wit_2 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre <> 0)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
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
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition qm_get32_safety_wit_3 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre <> 1)) (PreH2 : (i_pre <> 0)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
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
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition qm_get32_safety_wit_4 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre <> 2)) (PreH2 : (i_pre <> 1)) (PreH3 : (i_pre <> 0)) (PreH4 : (0 <= i_pre)) (PreH5 : (i_pre < 32)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
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
  “ (3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 3) ”
.

Definition qm_get32_safety_wit_5 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre <> 3)) (PreH2 : (i_pre <> 2)) (PreH3 : (i_pre <> 1)) (PreH4 : (i_pre <> 0)) (PreH5 : (0 <= i_pre)) (PreH6 : (i_pre < 32)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
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
  “ (4 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 4) ”
.

Definition qm_get32_safety_wit_6 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre <> 4)) (PreH2 : (i_pre <> 3)) (PreH3 : (i_pre <> 2)) (PreH4 : (i_pre <> 1)) (PreH5 : (i_pre <> 0)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
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
  “ (5 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 5) ”
.

Definition qm_get32_safety_wit_7 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre <> 5)) (PreH2 : (i_pre <> 4)) (PreH3 : (i_pre <> 3)) (PreH4 : (i_pre <> 2)) (PreH5 : (i_pre <> 1)) (PreH6 : (i_pre <> 0)) (PreH7 : (0 <= i_pre)) (PreH8 : (i_pre < 32)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
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
  “ (6 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 6) ”
.

Definition qm_get32_safety_wit_8 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre <> 6)) (PreH2 : (i_pre <> 5)) (PreH3 : (i_pre <> 4)) (PreH4 : (i_pre <> 3)) (PreH5 : (i_pre <> 2)) (PreH6 : (i_pre <> 1)) (PreH7 : (i_pre <> 0)) (PreH8 : (0 <= i_pre)) (PreH9 : (i_pre < 32)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
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
  “ (7 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 7) ”
.

Definition qm_get32_safety_wit_9 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre <> 7)) (PreH2 : (i_pre <> 6)) (PreH3 : (i_pre <> 5)) (PreH4 : (i_pre <> 4)) (PreH5 : (i_pre <> 3)) (PreH6 : (i_pre <> 2)) (PreH7 : (i_pre <> 1)) (PreH8 : (i_pre <> 0)) (PreH9 : (0 <= i_pre)) (PreH10 : (i_pre < 32)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
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
  “ (8 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 8) ”
.

Definition qm_get32_safety_wit_10 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre <> 8)) (PreH2 : (i_pre <> 7)) (PreH3 : (i_pre <> 6)) (PreH4 : (i_pre <> 5)) (PreH5 : (i_pre <> 4)) (PreH6 : (i_pre <> 3)) (PreH7 : (i_pre <> 2)) (PreH8 : (i_pre <> 1)) (PreH9 : (i_pre <> 0)) (PreH10 : (0 <= i_pre)) (PreH11 : (i_pre < 32)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
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
  “ (9 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 9) ”
.

Definition qm_get32_safety_wit_11 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre <> 9)) (PreH2 : (i_pre <> 8)) (PreH3 : (i_pre <> 7)) (PreH4 : (i_pre <> 6)) (PreH5 : (i_pre <> 5)) (PreH6 : (i_pre <> 4)) (PreH7 : (i_pre <> 3)) (PreH8 : (i_pre <> 2)) (PreH9 : (i_pre <> 1)) (PreH10 : (i_pre <> 0)) (PreH11 : (0 <= i_pre)) (PreH12 : (i_pre < 32)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
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
  “ (10 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 10) ”
.

Definition qm_get32_safety_wit_12 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre <> 10)) (PreH2 : (i_pre <> 9)) (PreH3 : (i_pre <> 8)) (PreH4 : (i_pre <> 7)) (PreH5 : (i_pre <> 6)) (PreH6 : (i_pre <> 5)) (PreH7 : (i_pre <> 4)) (PreH8 : (i_pre <> 3)) (PreH9 : (i_pre <> 2)) (PreH10 : (i_pre <> 1)) (PreH11 : (i_pre <> 0)) (PreH12 : (0 <= i_pre)) (PreH13 : (i_pre < 32)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
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
  “ (11 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 11) ”
.

Definition qm_get32_safety_wit_13 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre <> 11)) (PreH2 : (i_pre <> 10)) (PreH3 : (i_pre <> 9)) (PreH4 : (i_pre <> 8)) (PreH5 : (i_pre <> 7)) (PreH6 : (i_pre <> 6)) (PreH7 : (i_pre <> 5)) (PreH8 : (i_pre <> 4)) (PreH9 : (i_pre <> 3)) (PreH10 : (i_pre <> 2)) (PreH11 : (i_pre <> 1)) (PreH12 : (i_pre <> 0)) (PreH13 : (0 <= i_pre)) (PreH14 : (i_pre < 32)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
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
  “ (12 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 12) ”
.

Definition qm_get32_safety_wit_14 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre <> 12)) (PreH2 : (i_pre <> 11)) (PreH3 : (i_pre <> 10)) (PreH4 : (i_pre <> 9)) (PreH5 : (i_pre <> 8)) (PreH6 : (i_pre <> 7)) (PreH7 : (i_pre <> 6)) (PreH8 : (i_pre <> 5)) (PreH9 : (i_pre <> 4)) (PreH10 : (i_pre <> 3)) (PreH11 : (i_pre <> 2)) (PreH12 : (i_pre <> 1)) (PreH13 : (i_pre <> 0)) (PreH14 : (0 <= i_pre)) (PreH15 : (i_pre < 32)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
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
  “ (13 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 13) ”
.

Definition qm_get32_safety_wit_15 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre <> 13)) (PreH2 : (i_pre <> 12)) (PreH3 : (i_pre <> 11)) (PreH4 : (i_pre <> 10)) (PreH5 : (i_pre <> 9)) (PreH6 : (i_pre <> 8)) (PreH7 : (i_pre <> 7)) (PreH8 : (i_pre <> 6)) (PreH9 : (i_pre <> 5)) (PreH10 : (i_pre <> 4)) (PreH11 : (i_pre <> 3)) (PreH12 : (i_pre <> 2)) (PreH13 : (i_pre <> 1)) (PreH14 : (i_pre <> 0)) (PreH15 : (0 <= i_pre)) (PreH16 : (i_pre < 32)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
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
  “ (14 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 14) ”
.

Definition qm_get32_safety_wit_16 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre <> 14)) (PreH2 : (i_pre <> 13)) (PreH3 : (i_pre <> 12)) (PreH4 : (i_pre <> 11)) (PreH5 : (i_pre <> 10)) (PreH6 : (i_pre <> 9)) (PreH7 : (i_pre <> 8)) (PreH8 : (i_pre <> 7)) (PreH9 : (i_pre <> 6)) (PreH10 : (i_pre <> 5)) (PreH11 : (i_pre <> 4)) (PreH12 : (i_pre <> 3)) (PreH13 : (i_pre <> 2)) (PreH14 : (i_pre <> 1)) (PreH15 : (i_pre <> 0)) (PreH16 : (0 <= i_pre)) (PreH17 : (i_pre < 32)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
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
  “ (15 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 15) ”
.

Definition qm_get32_safety_wit_17 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre <> 15)) (PreH2 : (i_pre <> 14)) (PreH3 : (i_pre <> 13)) (PreH4 : (i_pre <> 12)) (PreH5 : (i_pre <> 11)) (PreH6 : (i_pre <> 10)) (PreH7 : (i_pre <> 9)) (PreH8 : (i_pre <> 8)) (PreH9 : (i_pre <> 7)) (PreH10 : (i_pre <> 6)) (PreH11 : (i_pre <> 5)) (PreH12 : (i_pre <> 4)) (PreH13 : (i_pre <> 3)) (PreH14 : (i_pre <> 2)) (PreH15 : (i_pre <> 1)) (PreH16 : (i_pre <> 0)) (PreH17 : (0 <= i_pre)) (PreH18 : (i_pre < 32)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
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
  “ (16 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 16) ”
.

Definition qm_get32_safety_wit_18 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre <> 16)) (PreH2 : (i_pre <> 15)) (PreH3 : (i_pre <> 14)) (PreH4 : (i_pre <> 13)) (PreH5 : (i_pre <> 12)) (PreH6 : (i_pre <> 11)) (PreH7 : (i_pre <> 10)) (PreH8 : (i_pre <> 9)) (PreH9 : (i_pre <> 8)) (PreH10 : (i_pre <> 7)) (PreH11 : (i_pre <> 6)) (PreH12 : (i_pre <> 5)) (PreH13 : (i_pre <> 4)) (PreH14 : (i_pre <> 3)) (PreH15 : (i_pre <> 2)) (PreH16 : (i_pre <> 1)) (PreH17 : (i_pre <> 0)) (PreH18 : (0 <= i_pre)) (PreH19 : (i_pre < 32)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
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
  “ (17 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 17) ”
.

Definition qm_get32_safety_wit_19 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre <> 17)) (PreH2 : (i_pre <> 16)) (PreH3 : (i_pre <> 15)) (PreH4 : (i_pre <> 14)) (PreH5 : (i_pre <> 13)) (PreH6 : (i_pre <> 12)) (PreH7 : (i_pre <> 11)) (PreH8 : (i_pre <> 10)) (PreH9 : (i_pre <> 9)) (PreH10 : (i_pre <> 8)) (PreH11 : (i_pre <> 7)) (PreH12 : (i_pre <> 6)) (PreH13 : (i_pre <> 5)) (PreH14 : (i_pre <> 4)) (PreH15 : (i_pre <> 3)) (PreH16 : (i_pre <> 2)) (PreH17 : (i_pre <> 1)) (PreH18 : (i_pre <> 0)) (PreH19 : (0 <= i_pre)) (PreH20 : (i_pre < 32)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
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
  “ (18 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 18) ”
.

Definition qm_get32_safety_wit_20 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre <> 18)) (PreH2 : (i_pre <> 17)) (PreH3 : (i_pre <> 16)) (PreH4 : (i_pre <> 15)) (PreH5 : (i_pre <> 14)) (PreH6 : (i_pre <> 13)) (PreH7 : (i_pre <> 12)) (PreH8 : (i_pre <> 11)) (PreH9 : (i_pre <> 10)) (PreH10 : (i_pre <> 9)) (PreH11 : (i_pre <> 8)) (PreH12 : (i_pre <> 7)) (PreH13 : (i_pre <> 6)) (PreH14 : (i_pre <> 5)) (PreH15 : (i_pre <> 4)) (PreH16 : (i_pre <> 3)) (PreH17 : (i_pre <> 2)) (PreH18 : (i_pre <> 1)) (PreH19 : (i_pre <> 0)) (PreH20 : (0 <= i_pre)) (PreH21 : (i_pre < 32)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
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
  “ (19 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 19) ”
.

Definition qm_get32_safety_wit_21 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre <> 19)) (PreH2 : (i_pre <> 18)) (PreH3 : (i_pre <> 17)) (PreH4 : (i_pre <> 16)) (PreH5 : (i_pre <> 15)) (PreH6 : (i_pre <> 14)) (PreH7 : (i_pre <> 13)) (PreH8 : (i_pre <> 12)) (PreH9 : (i_pre <> 11)) (PreH10 : (i_pre <> 10)) (PreH11 : (i_pre <> 9)) (PreH12 : (i_pre <> 8)) (PreH13 : (i_pre <> 7)) (PreH14 : (i_pre <> 6)) (PreH15 : (i_pre <> 5)) (PreH16 : (i_pre <> 4)) (PreH17 : (i_pre <> 3)) (PreH18 : (i_pre <> 2)) (PreH19 : (i_pre <> 1)) (PreH20 : (i_pre <> 0)) (PreH21 : (0 <= i_pre)) (PreH22 : (i_pre < 32)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
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
  “ (20 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 20) ”
.

Definition qm_get32_safety_wit_22 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre <> 20)) (PreH2 : (i_pre <> 19)) (PreH3 : (i_pre <> 18)) (PreH4 : (i_pre <> 17)) (PreH5 : (i_pre <> 16)) (PreH6 : (i_pre <> 15)) (PreH7 : (i_pre <> 14)) (PreH8 : (i_pre <> 13)) (PreH9 : (i_pre <> 12)) (PreH10 : (i_pre <> 11)) (PreH11 : (i_pre <> 10)) (PreH12 : (i_pre <> 9)) (PreH13 : (i_pre <> 8)) (PreH14 : (i_pre <> 7)) (PreH15 : (i_pre <> 6)) (PreH16 : (i_pre <> 5)) (PreH17 : (i_pre <> 4)) (PreH18 : (i_pre <> 3)) (PreH19 : (i_pre <> 2)) (PreH20 : (i_pre <> 1)) (PreH21 : (i_pre <> 0)) (PreH22 : (0 <= i_pre)) (PreH23 : (i_pre < 32)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
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
  “ (21 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 21) ”
.

Definition qm_get32_safety_wit_23 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre <> 21)) (PreH2 : (i_pre <> 20)) (PreH3 : (i_pre <> 19)) (PreH4 : (i_pre <> 18)) (PreH5 : (i_pre <> 17)) (PreH6 : (i_pre <> 16)) (PreH7 : (i_pre <> 15)) (PreH8 : (i_pre <> 14)) (PreH9 : (i_pre <> 13)) (PreH10 : (i_pre <> 12)) (PreH11 : (i_pre <> 11)) (PreH12 : (i_pre <> 10)) (PreH13 : (i_pre <> 9)) (PreH14 : (i_pre <> 8)) (PreH15 : (i_pre <> 7)) (PreH16 : (i_pre <> 6)) (PreH17 : (i_pre <> 5)) (PreH18 : (i_pre <> 4)) (PreH19 : (i_pre <> 3)) (PreH20 : (i_pre <> 2)) (PreH21 : (i_pre <> 1)) (PreH22 : (i_pre <> 0)) (PreH23 : (0 <= i_pre)) (PreH24 : (i_pre < 32)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
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
  “ (22 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 22) ”
.

Definition qm_get32_safety_wit_24 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre <> 22)) (PreH2 : (i_pre <> 21)) (PreH3 : (i_pre <> 20)) (PreH4 : (i_pre <> 19)) (PreH5 : (i_pre <> 18)) (PreH6 : (i_pre <> 17)) (PreH7 : (i_pre <> 16)) (PreH8 : (i_pre <> 15)) (PreH9 : (i_pre <> 14)) (PreH10 : (i_pre <> 13)) (PreH11 : (i_pre <> 12)) (PreH12 : (i_pre <> 11)) (PreH13 : (i_pre <> 10)) (PreH14 : (i_pre <> 9)) (PreH15 : (i_pre <> 8)) (PreH16 : (i_pre <> 7)) (PreH17 : (i_pre <> 6)) (PreH18 : (i_pre <> 5)) (PreH19 : (i_pre <> 4)) (PreH20 : (i_pre <> 3)) (PreH21 : (i_pre <> 2)) (PreH22 : (i_pre <> 1)) (PreH23 : (i_pre <> 0)) (PreH24 : (0 <= i_pre)) (PreH25 : (i_pre < 32)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
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
  “ (23 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 23) ”
.

Definition qm_get32_safety_wit_25 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre <> 23)) (PreH2 : (i_pre <> 22)) (PreH3 : (i_pre <> 21)) (PreH4 : (i_pre <> 20)) (PreH5 : (i_pre <> 19)) (PreH6 : (i_pre <> 18)) (PreH7 : (i_pre <> 17)) (PreH8 : (i_pre <> 16)) (PreH9 : (i_pre <> 15)) (PreH10 : (i_pre <> 14)) (PreH11 : (i_pre <> 13)) (PreH12 : (i_pre <> 12)) (PreH13 : (i_pre <> 11)) (PreH14 : (i_pre <> 10)) (PreH15 : (i_pre <> 9)) (PreH16 : (i_pre <> 8)) (PreH17 : (i_pre <> 7)) (PreH18 : (i_pre <> 6)) (PreH19 : (i_pre <> 5)) (PreH20 : (i_pre <> 4)) (PreH21 : (i_pre <> 3)) (PreH22 : (i_pre <> 2)) (PreH23 : (i_pre <> 1)) (PreH24 : (i_pre <> 0)) (PreH25 : (0 <= i_pre)) (PreH26 : (i_pre < 32)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
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
  “ (24 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 24) ”
.

Definition qm_get32_safety_wit_26 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre <> 24)) (PreH2 : (i_pre <> 23)) (PreH3 : (i_pre <> 22)) (PreH4 : (i_pre <> 21)) (PreH5 : (i_pre <> 20)) (PreH6 : (i_pre <> 19)) (PreH7 : (i_pre <> 18)) (PreH8 : (i_pre <> 17)) (PreH9 : (i_pre <> 16)) (PreH10 : (i_pre <> 15)) (PreH11 : (i_pre <> 14)) (PreH12 : (i_pre <> 13)) (PreH13 : (i_pre <> 12)) (PreH14 : (i_pre <> 11)) (PreH15 : (i_pre <> 10)) (PreH16 : (i_pre <> 9)) (PreH17 : (i_pre <> 8)) (PreH18 : (i_pre <> 7)) (PreH19 : (i_pre <> 6)) (PreH20 : (i_pre <> 5)) (PreH21 : (i_pre <> 4)) (PreH22 : (i_pre <> 3)) (PreH23 : (i_pre <> 2)) (PreH24 : (i_pre <> 1)) (PreH25 : (i_pre <> 0)) (PreH26 : (0 <= i_pre)) (PreH27 : (i_pre < 32)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
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
  “ (25 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 25) ”
.

Definition qm_get32_safety_wit_27 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre <> 25)) (PreH2 : (i_pre <> 24)) (PreH3 : (i_pre <> 23)) (PreH4 : (i_pre <> 22)) (PreH5 : (i_pre <> 21)) (PreH6 : (i_pre <> 20)) (PreH7 : (i_pre <> 19)) (PreH8 : (i_pre <> 18)) (PreH9 : (i_pre <> 17)) (PreH10 : (i_pre <> 16)) (PreH11 : (i_pre <> 15)) (PreH12 : (i_pre <> 14)) (PreH13 : (i_pre <> 13)) (PreH14 : (i_pre <> 12)) (PreH15 : (i_pre <> 11)) (PreH16 : (i_pre <> 10)) (PreH17 : (i_pre <> 9)) (PreH18 : (i_pre <> 8)) (PreH19 : (i_pre <> 7)) (PreH20 : (i_pre <> 6)) (PreH21 : (i_pre <> 5)) (PreH22 : (i_pre <> 4)) (PreH23 : (i_pre <> 3)) (PreH24 : (i_pre <> 2)) (PreH25 : (i_pre <> 1)) (PreH26 : (i_pre <> 0)) (PreH27 : (0 <= i_pre)) (PreH28 : (i_pre < 32)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
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
  “ (26 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 26) ”
.

Definition qm_get32_safety_wit_28 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre <> 26)) (PreH2 : (i_pre <> 25)) (PreH3 : (i_pre <> 24)) (PreH4 : (i_pre <> 23)) (PreH5 : (i_pre <> 22)) (PreH6 : (i_pre <> 21)) (PreH7 : (i_pre <> 20)) (PreH8 : (i_pre <> 19)) (PreH9 : (i_pre <> 18)) (PreH10 : (i_pre <> 17)) (PreH11 : (i_pre <> 16)) (PreH12 : (i_pre <> 15)) (PreH13 : (i_pre <> 14)) (PreH14 : (i_pre <> 13)) (PreH15 : (i_pre <> 12)) (PreH16 : (i_pre <> 11)) (PreH17 : (i_pre <> 10)) (PreH18 : (i_pre <> 9)) (PreH19 : (i_pre <> 8)) (PreH20 : (i_pre <> 7)) (PreH21 : (i_pre <> 6)) (PreH22 : (i_pre <> 5)) (PreH23 : (i_pre <> 4)) (PreH24 : (i_pre <> 3)) (PreH25 : (i_pre <> 2)) (PreH26 : (i_pre <> 1)) (PreH27 : (i_pre <> 0)) (PreH28 : (0 <= i_pre)) (PreH29 : (i_pre < 32)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
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
  “ (27 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 27) ”
.

Definition qm_get32_safety_wit_29 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre <> 27)) (PreH2 : (i_pre <> 26)) (PreH3 : (i_pre <> 25)) (PreH4 : (i_pre <> 24)) (PreH5 : (i_pre <> 23)) (PreH6 : (i_pre <> 22)) (PreH7 : (i_pre <> 21)) (PreH8 : (i_pre <> 20)) (PreH9 : (i_pre <> 19)) (PreH10 : (i_pre <> 18)) (PreH11 : (i_pre <> 17)) (PreH12 : (i_pre <> 16)) (PreH13 : (i_pre <> 15)) (PreH14 : (i_pre <> 14)) (PreH15 : (i_pre <> 13)) (PreH16 : (i_pre <> 12)) (PreH17 : (i_pre <> 11)) (PreH18 : (i_pre <> 10)) (PreH19 : (i_pre <> 9)) (PreH20 : (i_pre <> 8)) (PreH21 : (i_pre <> 7)) (PreH22 : (i_pre <> 6)) (PreH23 : (i_pre <> 5)) (PreH24 : (i_pre <> 4)) (PreH25 : (i_pre <> 3)) (PreH26 : (i_pre <> 2)) (PreH27 : (i_pre <> 1)) (PreH28 : (i_pre <> 0)) (PreH29 : (0 <= i_pre)) (PreH30 : (i_pre < 32)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
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
  “ (28 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 28) ”
.

Definition qm_get32_safety_wit_30 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre <> 28)) (PreH2 : (i_pre <> 27)) (PreH3 : (i_pre <> 26)) (PreH4 : (i_pre <> 25)) (PreH5 : (i_pre <> 24)) (PreH6 : (i_pre <> 23)) (PreH7 : (i_pre <> 22)) (PreH8 : (i_pre <> 21)) (PreH9 : (i_pre <> 20)) (PreH10 : (i_pre <> 19)) (PreH11 : (i_pre <> 18)) (PreH12 : (i_pre <> 17)) (PreH13 : (i_pre <> 16)) (PreH14 : (i_pre <> 15)) (PreH15 : (i_pre <> 14)) (PreH16 : (i_pre <> 13)) (PreH17 : (i_pre <> 12)) (PreH18 : (i_pre <> 11)) (PreH19 : (i_pre <> 10)) (PreH20 : (i_pre <> 9)) (PreH21 : (i_pre <> 8)) (PreH22 : (i_pre <> 7)) (PreH23 : (i_pre <> 6)) (PreH24 : (i_pre <> 5)) (PreH25 : (i_pre <> 4)) (PreH26 : (i_pre <> 3)) (PreH27 : (i_pre <> 2)) (PreH28 : (i_pre <> 1)) (PreH29 : (i_pre <> 0)) (PreH30 : (0 <= i_pre)) (PreH31 : (i_pre < 32)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
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
  “ (29 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 29) ”
.

Definition qm_get32_safety_wit_31 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre <> 29)) (PreH2 : (i_pre <> 28)) (PreH3 : (i_pre <> 27)) (PreH4 : (i_pre <> 26)) (PreH5 : (i_pre <> 25)) (PreH6 : (i_pre <> 24)) (PreH7 : (i_pre <> 23)) (PreH8 : (i_pre <> 22)) (PreH9 : (i_pre <> 21)) (PreH10 : (i_pre <> 20)) (PreH11 : (i_pre <> 19)) (PreH12 : (i_pre <> 18)) (PreH13 : (i_pre <> 17)) (PreH14 : (i_pre <> 16)) (PreH15 : (i_pre <> 15)) (PreH16 : (i_pre <> 14)) (PreH17 : (i_pre <> 13)) (PreH18 : (i_pre <> 12)) (PreH19 : (i_pre <> 11)) (PreH20 : (i_pre <> 10)) (PreH21 : (i_pre <> 9)) (PreH22 : (i_pre <> 8)) (PreH23 : (i_pre <> 7)) (PreH24 : (i_pre <> 6)) (PreH25 : (i_pre <> 5)) (PreH26 : (i_pre <> 4)) (PreH27 : (i_pre <> 3)) (PreH28 : (i_pre <> 2)) (PreH29 : (i_pre <> 1)) (PreH30 : (i_pre <> 0)) (PreH31 : (0 <= i_pre)) (PreH32 : (i_pre < 32)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
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
  “ (30 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 30) ”
.

Definition qm_get32_return_wit_1 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre <> 30)) (PreH2 : (i_pre <> 29)) (PreH3 : (i_pre <> 28)) (PreH4 : (i_pre <> 27)) (PreH5 : (i_pre <> 26)) (PreH6 : (i_pre <> 25)) (PreH7 : (i_pre <> 24)) (PreH8 : (i_pre <> 23)) (PreH9 : (i_pre <> 22)) (PreH10 : (i_pre <> 21)) (PreH11 : (i_pre <> 20)) (PreH12 : (i_pre <> 19)) (PreH13 : (i_pre <> 18)) (PreH14 : (i_pre <> 17)) (PreH15 : (i_pre <> 16)) (PreH16 : (i_pre <> 15)) (PreH17 : (i_pre <> 14)) (PreH18 : (i_pre <> 13)) (PreH19 : (i_pre <> 12)) (PreH20 : (i_pre <> 11)) (PreH21 : (i_pre <> 10)) (PreH22 : (i_pre <> 9)) (PreH23 : (i_pre <> 8)) (PreH24 : (i_pre <> 7)) (PreH25 : (i_pre <> 6)) (PreH26 : (i_pre <> 5)) (PreH27 : (i_pre <> 4)) (PreH28 : (i_pre <> 3)) (PreH29 : (i_pre <> 2)) (PreH30 : (i_pre <> 1)) (PreH31 : (i_pre <> 0)) (PreH32 : (0 <= i_pre)) (PreH33 : (i_pre < 32)) ,
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
|--
  “ (x31 = (qm_vec32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31) (i_pre))) ”
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
) \/
(
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre <> 30)) (PreH2 : (i_pre <> 29)) (PreH3 : (i_pre <> 28)) (PreH4 : (i_pre <> 27)) (PreH5 : (i_pre <> 26)) (PreH6 : (i_pre <> 25)) (PreH7 : (i_pre <> 24)) (PreH8 : (i_pre <> 23)) (PreH9 : (i_pre <> 22)) (PreH10 : (i_pre <> 21)) (PreH11 : (i_pre <> 20)) (PreH12 : (i_pre <> 19)) (PreH13 : (i_pre <> 18)) (PreH14 : (i_pre <> 17)) (PreH15 : (i_pre <> 16)) (PreH16 : (i_pre <> 15)) (PreH17 : (i_pre <> 14)) (PreH18 : (i_pre <> 13)) (PreH19 : (i_pre <> 12)) (PreH20 : (i_pre <> 11)) (PreH21 : (i_pre <> 10)) (PreH22 : (i_pre <> 9)) (PreH23 : (i_pre <> 8)) (PreH24 : (i_pre <> 7)) (PreH25 : (i_pre <> 6)) (PreH26 : (i_pre <> 5)) (PreH27 : (i_pre <> 4)) (PreH28 : (i_pre <> 3)) (PreH29 : (i_pre <> 2)) (PreH30 : (i_pre <> 1)) (PreH31 : (i_pre <> 0)) (PreH32 : (0 <= i_pre)) (PreH33 : (i_pre < 32)) ,
  TT && emp 
|--
  “ (x31 = (qm_vec32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31) (i_pre))) ”
  &&  emp
).

Definition qm_get32_return_wit_1_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre <> 30)) (PreH2 : (i_pre <> 29)) (PreH3 : (i_pre <> 28)) (PreH4 : (i_pre <> 27)) (PreH5 : (i_pre <> 26)) (PreH6 : (i_pre <> 25)) (PreH7 : (i_pre <> 24)) (PreH8 : (i_pre <> 23)) (PreH9 : (i_pre <> 22)) (PreH10 : (i_pre <> 21)) (PreH11 : (i_pre <> 20)) (PreH12 : (i_pre <> 19)) (PreH13 : (i_pre <> 18)) (PreH14 : (i_pre <> 17)) (PreH15 : (i_pre <> 16)) (PreH16 : (i_pre <> 15)) (PreH17 : (i_pre <> 14)) (PreH18 : (i_pre <> 13)) (PreH19 : (i_pre <> 12)) (PreH20 : (i_pre <> 11)) (PreH21 : (i_pre <> 10)) (PreH22 : (i_pre <> 9)) (PreH23 : (i_pre <> 8)) (PreH24 : (i_pre <> 7)) (PreH25 : (i_pre <> 6)) (PreH26 : (i_pre <> 5)) (PreH27 : (i_pre <> 4)) (PreH28 : (i_pre <> 3)) (PreH29 : (i_pre <> 2)) (PreH30 : (i_pre <> 1)) (PreH31 : (i_pre <> 0)) (PreH32 : (0 <= i_pre)) (PreH33 : (i_pre < 32)) ,
  (x31 = (qm_vec32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31) (i_pre)))
.

Definition qm_get32_return_wit_2 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre = 30)) (PreH2 : (i_pre <> 29)) (PreH3 : (i_pre <> 28)) (PreH4 : (i_pre <> 27)) (PreH5 : (i_pre <> 26)) (PreH6 : (i_pre <> 25)) (PreH7 : (i_pre <> 24)) (PreH8 : (i_pre <> 23)) (PreH9 : (i_pre <> 22)) (PreH10 : (i_pre <> 21)) (PreH11 : (i_pre <> 20)) (PreH12 : (i_pre <> 19)) (PreH13 : (i_pre <> 18)) (PreH14 : (i_pre <> 17)) (PreH15 : (i_pre <> 16)) (PreH16 : (i_pre <> 15)) (PreH17 : (i_pre <> 14)) (PreH18 : (i_pre <> 13)) (PreH19 : (i_pre <> 12)) (PreH20 : (i_pre <> 11)) (PreH21 : (i_pre <> 10)) (PreH22 : (i_pre <> 9)) (PreH23 : (i_pre <> 8)) (PreH24 : (i_pre <> 7)) (PreH25 : (i_pre <> 6)) (PreH26 : (i_pre <> 5)) (PreH27 : (i_pre <> 4)) (PreH28 : (i_pre <> 3)) (PreH29 : (i_pre <> 2)) (PreH30 : (i_pre <> 1)) (PreH31 : (i_pre <> 0)) (PreH32 : (0 <= i_pre)) (PreH33 : (i_pre < 32)) ,
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
|--
  “ (x30 = (qm_vec32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31) (i_pre))) ”
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
) \/
(
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre = 30)) (PreH2 : (i_pre <> 29)) (PreH3 : (i_pre <> 28)) (PreH4 : (i_pre <> 27)) (PreH5 : (i_pre <> 26)) (PreH6 : (i_pre <> 25)) (PreH7 : (i_pre <> 24)) (PreH8 : (i_pre <> 23)) (PreH9 : (i_pre <> 22)) (PreH10 : (i_pre <> 21)) (PreH11 : (i_pre <> 20)) (PreH12 : (i_pre <> 19)) (PreH13 : (i_pre <> 18)) (PreH14 : (i_pre <> 17)) (PreH15 : (i_pre <> 16)) (PreH16 : (i_pre <> 15)) (PreH17 : (i_pre <> 14)) (PreH18 : (i_pre <> 13)) (PreH19 : (i_pre <> 12)) (PreH20 : (i_pre <> 11)) (PreH21 : (i_pre <> 10)) (PreH22 : (i_pre <> 9)) (PreH23 : (i_pre <> 8)) (PreH24 : (i_pre <> 7)) (PreH25 : (i_pre <> 6)) (PreH26 : (i_pre <> 5)) (PreH27 : (i_pre <> 4)) (PreH28 : (i_pre <> 3)) (PreH29 : (i_pre <> 2)) (PreH30 : (i_pre <> 1)) (PreH31 : (i_pre <> 0)) (PreH32 : (0 <= i_pre)) (PreH33 : (i_pre < 32)) ,
  TT && emp 
|--
  “ (x30 = (qm_vec32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31) (30))) ”
  &&  emp
).

Definition qm_get32_return_wit_2_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre = 30)) (PreH2 : (i_pre <> 29)) (PreH3 : (i_pre <> 28)) (PreH4 : (i_pre <> 27)) (PreH5 : (i_pre <> 26)) (PreH6 : (i_pre <> 25)) (PreH7 : (i_pre <> 24)) (PreH8 : (i_pre <> 23)) (PreH9 : (i_pre <> 22)) (PreH10 : (i_pre <> 21)) (PreH11 : (i_pre <> 20)) (PreH12 : (i_pre <> 19)) (PreH13 : (i_pre <> 18)) (PreH14 : (i_pre <> 17)) (PreH15 : (i_pre <> 16)) (PreH16 : (i_pre <> 15)) (PreH17 : (i_pre <> 14)) (PreH18 : (i_pre <> 13)) (PreH19 : (i_pre <> 12)) (PreH20 : (i_pre <> 11)) (PreH21 : (i_pre <> 10)) (PreH22 : (i_pre <> 9)) (PreH23 : (i_pre <> 8)) (PreH24 : (i_pre <> 7)) (PreH25 : (i_pre <> 6)) (PreH26 : (i_pre <> 5)) (PreH27 : (i_pre <> 4)) (PreH28 : (i_pre <> 3)) (PreH29 : (i_pre <> 2)) (PreH30 : (i_pre <> 1)) (PreH31 : (i_pre <> 0)) (PreH32 : (0 <= i_pre)) (PreH33 : (i_pre < 32)) ,
  (x30 = (qm_vec32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31) (30)))
.

Definition qm_get32_return_wit_3 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre = 29)) (PreH2 : (i_pre <> 28)) (PreH3 : (i_pre <> 27)) (PreH4 : (i_pre <> 26)) (PreH5 : (i_pre <> 25)) (PreH6 : (i_pre <> 24)) (PreH7 : (i_pre <> 23)) (PreH8 : (i_pre <> 22)) (PreH9 : (i_pre <> 21)) (PreH10 : (i_pre <> 20)) (PreH11 : (i_pre <> 19)) (PreH12 : (i_pre <> 18)) (PreH13 : (i_pre <> 17)) (PreH14 : (i_pre <> 16)) (PreH15 : (i_pre <> 15)) (PreH16 : (i_pre <> 14)) (PreH17 : (i_pre <> 13)) (PreH18 : (i_pre <> 12)) (PreH19 : (i_pre <> 11)) (PreH20 : (i_pre <> 10)) (PreH21 : (i_pre <> 9)) (PreH22 : (i_pre <> 8)) (PreH23 : (i_pre <> 7)) (PreH24 : (i_pre <> 6)) (PreH25 : (i_pre <> 5)) (PreH26 : (i_pre <> 4)) (PreH27 : (i_pre <> 3)) (PreH28 : (i_pre <> 2)) (PreH29 : (i_pre <> 1)) (PreH30 : (i_pre <> 0)) (PreH31 : (0 <= i_pre)) (PreH32 : (i_pre < 32)) ,
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
|--
  “ (x29 = (qm_vec32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31) (i_pre))) ”
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
) \/
(
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre = 29)) (PreH2 : (i_pre <> 28)) (PreH3 : (i_pre <> 27)) (PreH4 : (i_pre <> 26)) (PreH5 : (i_pre <> 25)) (PreH6 : (i_pre <> 24)) (PreH7 : (i_pre <> 23)) (PreH8 : (i_pre <> 22)) (PreH9 : (i_pre <> 21)) (PreH10 : (i_pre <> 20)) (PreH11 : (i_pre <> 19)) (PreH12 : (i_pre <> 18)) (PreH13 : (i_pre <> 17)) (PreH14 : (i_pre <> 16)) (PreH15 : (i_pre <> 15)) (PreH16 : (i_pre <> 14)) (PreH17 : (i_pre <> 13)) (PreH18 : (i_pre <> 12)) (PreH19 : (i_pre <> 11)) (PreH20 : (i_pre <> 10)) (PreH21 : (i_pre <> 9)) (PreH22 : (i_pre <> 8)) (PreH23 : (i_pre <> 7)) (PreH24 : (i_pre <> 6)) (PreH25 : (i_pre <> 5)) (PreH26 : (i_pre <> 4)) (PreH27 : (i_pre <> 3)) (PreH28 : (i_pre <> 2)) (PreH29 : (i_pre <> 1)) (PreH30 : (i_pre <> 0)) (PreH31 : (0 <= i_pre)) (PreH32 : (i_pre < 32)) ,
  TT && emp 
|--
  “ (x29 = (qm_vec32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31) (29))) ”
  &&  emp
).

Definition qm_get32_return_wit_3_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre = 29)) (PreH2 : (i_pre <> 28)) (PreH3 : (i_pre <> 27)) (PreH4 : (i_pre <> 26)) (PreH5 : (i_pre <> 25)) (PreH6 : (i_pre <> 24)) (PreH7 : (i_pre <> 23)) (PreH8 : (i_pre <> 22)) (PreH9 : (i_pre <> 21)) (PreH10 : (i_pre <> 20)) (PreH11 : (i_pre <> 19)) (PreH12 : (i_pre <> 18)) (PreH13 : (i_pre <> 17)) (PreH14 : (i_pre <> 16)) (PreH15 : (i_pre <> 15)) (PreH16 : (i_pre <> 14)) (PreH17 : (i_pre <> 13)) (PreH18 : (i_pre <> 12)) (PreH19 : (i_pre <> 11)) (PreH20 : (i_pre <> 10)) (PreH21 : (i_pre <> 9)) (PreH22 : (i_pre <> 8)) (PreH23 : (i_pre <> 7)) (PreH24 : (i_pre <> 6)) (PreH25 : (i_pre <> 5)) (PreH26 : (i_pre <> 4)) (PreH27 : (i_pre <> 3)) (PreH28 : (i_pre <> 2)) (PreH29 : (i_pre <> 1)) (PreH30 : (i_pre <> 0)) (PreH31 : (0 <= i_pre)) (PreH32 : (i_pre < 32)) ,
  (x29 = (qm_vec32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31) (29)))
.

Definition qm_get32_return_wit_4 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre = 28)) (PreH2 : (i_pre <> 27)) (PreH3 : (i_pre <> 26)) (PreH4 : (i_pre <> 25)) (PreH5 : (i_pre <> 24)) (PreH6 : (i_pre <> 23)) (PreH7 : (i_pre <> 22)) (PreH8 : (i_pre <> 21)) (PreH9 : (i_pre <> 20)) (PreH10 : (i_pre <> 19)) (PreH11 : (i_pre <> 18)) (PreH12 : (i_pre <> 17)) (PreH13 : (i_pre <> 16)) (PreH14 : (i_pre <> 15)) (PreH15 : (i_pre <> 14)) (PreH16 : (i_pre <> 13)) (PreH17 : (i_pre <> 12)) (PreH18 : (i_pre <> 11)) (PreH19 : (i_pre <> 10)) (PreH20 : (i_pre <> 9)) (PreH21 : (i_pre <> 8)) (PreH22 : (i_pre <> 7)) (PreH23 : (i_pre <> 6)) (PreH24 : (i_pre <> 5)) (PreH25 : (i_pre <> 4)) (PreH26 : (i_pre <> 3)) (PreH27 : (i_pre <> 2)) (PreH28 : (i_pre <> 1)) (PreH29 : (i_pre <> 0)) (PreH30 : (0 <= i_pre)) (PreH31 : (i_pre < 32)) ,
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
|--
  “ (x28 = (qm_vec32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31) (i_pre))) ”
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
) \/
(
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre = 28)) (PreH2 : (i_pre <> 27)) (PreH3 : (i_pre <> 26)) (PreH4 : (i_pre <> 25)) (PreH5 : (i_pre <> 24)) (PreH6 : (i_pre <> 23)) (PreH7 : (i_pre <> 22)) (PreH8 : (i_pre <> 21)) (PreH9 : (i_pre <> 20)) (PreH10 : (i_pre <> 19)) (PreH11 : (i_pre <> 18)) (PreH12 : (i_pre <> 17)) (PreH13 : (i_pre <> 16)) (PreH14 : (i_pre <> 15)) (PreH15 : (i_pre <> 14)) (PreH16 : (i_pre <> 13)) (PreH17 : (i_pre <> 12)) (PreH18 : (i_pre <> 11)) (PreH19 : (i_pre <> 10)) (PreH20 : (i_pre <> 9)) (PreH21 : (i_pre <> 8)) (PreH22 : (i_pre <> 7)) (PreH23 : (i_pre <> 6)) (PreH24 : (i_pre <> 5)) (PreH25 : (i_pre <> 4)) (PreH26 : (i_pre <> 3)) (PreH27 : (i_pre <> 2)) (PreH28 : (i_pre <> 1)) (PreH29 : (i_pre <> 0)) (PreH30 : (0 <= i_pre)) (PreH31 : (i_pre < 32)) ,
  TT && emp 
|--
  “ (x28 = (qm_vec32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31) (28))) ”
  &&  emp
).

Definition qm_get32_return_wit_4_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre = 28)) (PreH2 : (i_pre <> 27)) (PreH3 : (i_pre <> 26)) (PreH4 : (i_pre <> 25)) (PreH5 : (i_pre <> 24)) (PreH6 : (i_pre <> 23)) (PreH7 : (i_pre <> 22)) (PreH8 : (i_pre <> 21)) (PreH9 : (i_pre <> 20)) (PreH10 : (i_pre <> 19)) (PreH11 : (i_pre <> 18)) (PreH12 : (i_pre <> 17)) (PreH13 : (i_pre <> 16)) (PreH14 : (i_pre <> 15)) (PreH15 : (i_pre <> 14)) (PreH16 : (i_pre <> 13)) (PreH17 : (i_pre <> 12)) (PreH18 : (i_pre <> 11)) (PreH19 : (i_pre <> 10)) (PreH20 : (i_pre <> 9)) (PreH21 : (i_pre <> 8)) (PreH22 : (i_pre <> 7)) (PreH23 : (i_pre <> 6)) (PreH24 : (i_pre <> 5)) (PreH25 : (i_pre <> 4)) (PreH26 : (i_pre <> 3)) (PreH27 : (i_pre <> 2)) (PreH28 : (i_pre <> 1)) (PreH29 : (i_pre <> 0)) (PreH30 : (0 <= i_pre)) (PreH31 : (i_pre < 32)) ,
  (x28 = (qm_vec32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31) (28)))
.

Definition qm_get32_return_wit_5 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre = 27)) (PreH2 : (i_pre <> 26)) (PreH3 : (i_pre <> 25)) (PreH4 : (i_pre <> 24)) (PreH5 : (i_pre <> 23)) (PreH6 : (i_pre <> 22)) (PreH7 : (i_pre <> 21)) (PreH8 : (i_pre <> 20)) (PreH9 : (i_pre <> 19)) (PreH10 : (i_pre <> 18)) (PreH11 : (i_pre <> 17)) (PreH12 : (i_pre <> 16)) (PreH13 : (i_pre <> 15)) (PreH14 : (i_pre <> 14)) (PreH15 : (i_pre <> 13)) (PreH16 : (i_pre <> 12)) (PreH17 : (i_pre <> 11)) (PreH18 : (i_pre <> 10)) (PreH19 : (i_pre <> 9)) (PreH20 : (i_pre <> 8)) (PreH21 : (i_pre <> 7)) (PreH22 : (i_pre <> 6)) (PreH23 : (i_pre <> 5)) (PreH24 : (i_pre <> 4)) (PreH25 : (i_pre <> 3)) (PreH26 : (i_pre <> 2)) (PreH27 : (i_pre <> 1)) (PreH28 : (i_pre <> 0)) (PreH29 : (0 <= i_pre)) (PreH30 : (i_pre < 32)) ,
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
|--
  “ (x27 = (qm_vec32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31) (i_pre))) ”
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
) \/
(
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre = 27)) (PreH2 : (i_pre <> 26)) (PreH3 : (i_pre <> 25)) (PreH4 : (i_pre <> 24)) (PreH5 : (i_pre <> 23)) (PreH6 : (i_pre <> 22)) (PreH7 : (i_pre <> 21)) (PreH8 : (i_pre <> 20)) (PreH9 : (i_pre <> 19)) (PreH10 : (i_pre <> 18)) (PreH11 : (i_pre <> 17)) (PreH12 : (i_pre <> 16)) (PreH13 : (i_pre <> 15)) (PreH14 : (i_pre <> 14)) (PreH15 : (i_pre <> 13)) (PreH16 : (i_pre <> 12)) (PreH17 : (i_pre <> 11)) (PreH18 : (i_pre <> 10)) (PreH19 : (i_pre <> 9)) (PreH20 : (i_pre <> 8)) (PreH21 : (i_pre <> 7)) (PreH22 : (i_pre <> 6)) (PreH23 : (i_pre <> 5)) (PreH24 : (i_pre <> 4)) (PreH25 : (i_pre <> 3)) (PreH26 : (i_pre <> 2)) (PreH27 : (i_pre <> 1)) (PreH28 : (i_pre <> 0)) (PreH29 : (0 <= i_pre)) (PreH30 : (i_pre < 32)) ,
  TT && emp 
|--
  “ (x27 = (qm_vec32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31) (27))) ”
  &&  emp
).

Definition qm_get32_return_wit_5_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre = 27)) (PreH2 : (i_pre <> 26)) (PreH3 : (i_pre <> 25)) (PreH4 : (i_pre <> 24)) (PreH5 : (i_pre <> 23)) (PreH6 : (i_pre <> 22)) (PreH7 : (i_pre <> 21)) (PreH8 : (i_pre <> 20)) (PreH9 : (i_pre <> 19)) (PreH10 : (i_pre <> 18)) (PreH11 : (i_pre <> 17)) (PreH12 : (i_pre <> 16)) (PreH13 : (i_pre <> 15)) (PreH14 : (i_pre <> 14)) (PreH15 : (i_pre <> 13)) (PreH16 : (i_pre <> 12)) (PreH17 : (i_pre <> 11)) (PreH18 : (i_pre <> 10)) (PreH19 : (i_pre <> 9)) (PreH20 : (i_pre <> 8)) (PreH21 : (i_pre <> 7)) (PreH22 : (i_pre <> 6)) (PreH23 : (i_pre <> 5)) (PreH24 : (i_pre <> 4)) (PreH25 : (i_pre <> 3)) (PreH26 : (i_pre <> 2)) (PreH27 : (i_pre <> 1)) (PreH28 : (i_pre <> 0)) (PreH29 : (0 <= i_pre)) (PreH30 : (i_pre < 32)) ,
  (x27 = (qm_vec32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31) (27)))
.

Definition qm_get32_return_wit_6 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre = 26)) (PreH2 : (i_pre <> 25)) (PreH3 : (i_pre <> 24)) (PreH4 : (i_pre <> 23)) (PreH5 : (i_pre <> 22)) (PreH6 : (i_pre <> 21)) (PreH7 : (i_pre <> 20)) (PreH8 : (i_pre <> 19)) (PreH9 : (i_pre <> 18)) (PreH10 : (i_pre <> 17)) (PreH11 : (i_pre <> 16)) (PreH12 : (i_pre <> 15)) (PreH13 : (i_pre <> 14)) (PreH14 : (i_pre <> 13)) (PreH15 : (i_pre <> 12)) (PreH16 : (i_pre <> 11)) (PreH17 : (i_pre <> 10)) (PreH18 : (i_pre <> 9)) (PreH19 : (i_pre <> 8)) (PreH20 : (i_pre <> 7)) (PreH21 : (i_pre <> 6)) (PreH22 : (i_pre <> 5)) (PreH23 : (i_pre <> 4)) (PreH24 : (i_pre <> 3)) (PreH25 : (i_pre <> 2)) (PreH26 : (i_pre <> 1)) (PreH27 : (i_pre <> 0)) (PreH28 : (0 <= i_pre)) (PreH29 : (i_pre < 32)) ,
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
|--
  “ (x26 = (qm_vec32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31) (i_pre))) ”
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
) \/
(
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre = 26)) (PreH2 : (i_pre <> 25)) (PreH3 : (i_pre <> 24)) (PreH4 : (i_pre <> 23)) (PreH5 : (i_pre <> 22)) (PreH6 : (i_pre <> 21)) (PreH7 : (i_pre <> 20)) (PreH8 : (i_pre <> 19)) (PreH9 : (i_pre <> 18)) (PreH10 : (i_pre <> 17)) (PreH11 : (i_pre <> 16)) (PreH12 : (i_pre <> 15)) (PreH13 : (i_pre <> 14)) (PreH14 : (i_pre <> 13)) (PreH15 : (i_pre <> 12)) (PreH16 : (i_pre <> 11)) (PreH17 : (i_pre <> 10)) (PreH18 : (i_pre <> 9)) (PreH19 : (i_pre <> 8)) (PreH20 : (i_pre <> 7)) (PreH21 : (i_pre <> 6)) (PreH22 : (i_pre <> 5)) (PreH23 : (i_pre <> 4)) (PreH24 : (i_pre <> 3)) (PreH25 : (i_pre <> 2)) (PreH26 : (i_pre <> 1)) (PreH27 : (i_pre <> 0)) (PreH28 : (0 <= i_pre)) (PreH29 : (i_pre < 32)) ,
  TT && emp 
|--
  “ (x26 = (qm_vec32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31) (26))) ”
  &&  emp
).

Definition qm_get32_return_wit_6_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre = 26)) (PreH2 : (i_pre <> 25)) (PreH3 : (i_pre <> 24)) (PreH4 : (i_pre <> 23)) (PreH5 : (i_pre <> 22)) (PreH6 : (i_pre <> 21)) (PreH7 : (i_pre <> 20)) (PreH8 : (i_pre <> 19)) (PreH9 : (i_pre <> 18)) (PreH10 : (i_pre <> 17)) (PreH11 : (i_pre <> 16)) (PreH12 : (i_pre <> 15)) (PreH13 : (i_pre <> 14)) (PreH14 : (i_pre <> 13)) (PreH15 : (i_pre <> 12)) (PreH16 : (i_pre <> 11)) (PreH17 : (i_pre <> 10)) (PreH18 : (i_pre <> 9)) (PreH19 : (i_pre <> 8)) (PreH20 : (i_pre <> 7)) (PreH21 : (i_pre <> 6)) (PreH22 : (i_pre <> 5)) (PreH23 : (i_pre <> 4)) (PreH24 : (i_pre <> 3)) (PreH25 : (i_pre <> 2)) (PreH26 : (i_pre <> 1)) (PreH27 : (i_pre <> 0)) (PreH28 : (0 <= i_pre)) (PreH29 : (i_pre < 32)) ,
  (x26 = (qm_vec32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31) (26)))
.

Definition qm_get32_return_wit_7 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre = 25)) (PreH2 : (i_pre <> 24)) (PreH3 : (i_pre <> 23)) (PreH4 : (i_pre <> 22)) (PreH5 : (i_pre <> 21)) (PreH6 : (i_pre <> 20)) (PreH7 : (i_pre <> 19)) (PreH8 : (i_pre <> 18)) (PreH9 : (i_pre <> 17)) (PreH10 : (i_pre <> 16)) (PreH11 : (i_pre <> 15)) (PreH12 : (i_pre <> 14)) (PreH13 : (i_pre <> 13)) (PreH14 : (i_pre <> 12)) (PreH15 : (i_pre <> 11)) (PreH16 : (i_pre <> 10)) (PreH17 : (i_pre <> 9)) (PreH18 : (i_pre <> 8)) (PreH19 : (i_pre <> 7)) (PreH20 : (i_pre <> 6)) (PreH21 : (i_pre <> 5)) (PreH22 : (i_pre <> 4)) (PreH23 : (i_pre <> 3)) (PreH24 : (i_pre <> 2)) (PreH25 : (i_pre <> 1)) (PreH26 : (i_pre <> 0)) (PreH27 : (0 <= i_pre)) (PreH28 : (i_pre < 32)) ,
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
|--
  “ (x25 = (qm_vec32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31) (i_pre))) ”
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
) \/
(
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre = 25)) (PreH2 : (i_pre <> 24)) (PreH3 : (i_pre <> 23)) (PreH4 : (i_pre <> 22)) (PreH5 : (i_pre <> 21)) (PreH6 : (i_pre <> 20)) (PreH7 : (i_pre <> 19)) (PreH8 : (i_pre <> 18)) (PreH9 : (i_pre <> 17)) (PreH10 : (i_pre <> 16)) (PreH11 : (i_pre <> 15)) (PreH12 : (i_pre <> 14)) (PreH13 : (i_pre <> 13)) (PreH14 : (i_pre <> 12)) (PreH15 : (i_pre <> 11)) (PreH16 : (i_pre <> 10)) (PreH17 : (i_pre <> 9)) (PreH18 : (i_pre <> 8)) (PreH19 : (i_pre <> 7)) (PreH20 : (i_pre <> 6)) (PreH21 : (i_pre <> 5)) (PreH22 : (i_pre <> 4)) (PreH23 : (i_pre <> 3)) (PreH24 : (i_pre <> 2)) (PreH25 : (i_pre <> 1)) (PreH26 : (i_pre <> 0)) (PreH27 : (0 <= i_pre)) (PreH28 : (i_pre < 32)) ,
  TT && emp 
|--
  “ (x25 = (qm_vec32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31) (25))) ”
  &&  emp
).

Definition qm_get32_return_wit_7_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre = 25)) (PreH2 : (i_pre <> 24)) (PreH3 : (i_pre <> 23)) (PreH4 : (i_pre <> 22)) (PreH5 : (i_pre <> 21)) (PreH6 : (i_pre <> 20)) (PreH7 : (i_pre <> 19)) (PreH8 : (i_pre <> 18)) (PreH9 : (i_pre <> 17)) (PreH10 : (i_pre <> 16)) (PreH11 : (i_pre <> 15)) (PreH12 : (i_pre <> 14)) (PreH13 : (i_pre <> 13)) (PreH14 : (i_pre <> 12)) (PreH15 : (i_pre <> 11)) (PreH16 : (i_pre <> 10)) (PreH17 : (i_pre <> 9)) (PreH18 : (i_pre <> 8)) (PreH19 : (i_pre <> 7)) (PreH20 : (i_pre <> 6)) (PreH21 : (i_pre <> 5)) (PreH22 : (i_pre <> 4)) (PreH23 : (i_pre <> 3)) (PreH24 : (i_pre <> 2)) (PreH25 : (i_pre <> 1)) (PreH26 : (i_pre <> 0)) (PreH27 : (0 <= i_pre)) (PreH28 : (i_pre < 32)) ,
  (x25 = (qm_vec32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31) (25)))
.

Definition qm_get32_return_wit_8 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre = 24)) (PreH2 : (i_pre <> 23)) (PreH3 : (i_pre <> 22)) (PreH4 : (i_pre <> 21)) (PreH5 : (i_pre <> 20)) (PreH6 : (i_pre <> 19)) (PreH7 : (i_pre <> 18)) (PreH8 : (i_pre <> 17)) (PreH9 : (i_pre <> 16)) (PreH10 : (i_pre <> 15)) (PreH11 : (i_pre <> 14)) (PreH12 : (i_pre <> 13)) (PreH13 : (i_pre <> 12)) (PreH14 : (i_pre <> 11)) (PreH15 : (i_pre <> 10)) (PreH16 : (i_pre <> 9)) (PreH17 : (i_pre <> 8)) (PreH18 : (i_pre <> 7)) (PreH19 : (i_pre <> 6)) (PreH20 : (i_pre <> 5)) (PreH21 : (i_pre <> 4)) (PreH22 : (i_pre <> 3)) (PreH23 : (i_pre <> 2)) (PreH24 : (i_pre <> 1)) (PreH25 : (i_pre <> 0)) (PreH26 : (0 <= i_pre)) (PreH27 : (i_pre < 32)) ,
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
|--
  “ (x24 = (qm_vec32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31) (i_pre))) ”
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
) \/
(
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre = 24)) (PreH2 : (i_pre <> 23)) (PreH3 : (i_pre <> 22)) (PreH4 : (i_pre <> 21)) (PreH5 : (i_pre <> 20)) (PreH6 : (i_pre <> 19)) (PreH7 : (i_pre <> 18)) (PreH8 : (i_pre <> 17)) (PreH9 : (i_pre <> 16)) (PreH10 : (i_pre <> 15)) (PreH11 : (i_pre <> 14)) (PreH12 : (i_pre <> 13)) (PreH13 : (i_pre <> 12)) (PreH14 : (i_pre <> 11)) (PreH15 : (i_pre <> 10)) (PreH16 : (i_pre <> 9)) (PreH17 : (i_pre <> 8)) (PreH18 : (i_pre <> 7)) (PreH19 : (i_pre <> 6)) (PreH20 : (i_pre <> 5)) (PreH21 : (i_pre <> 4)) (PreH22 : (i_pre <> 3)) (PreH23 : (i_pre <> 2)) (PreH24 : (i_pre <> 1)) (PreH25 : (i_pre <> 0)) (PreH26 : (0 <= i_pre)) (PreH27 : (i_pre < 32)) ,
  TT && emp 
|--
  “ (x24 = (qm_vec32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31) (24))) ”
  &&  emp
).

Definition qm_get32_return_wit_8_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre = 24)) (PreH2 : (i_pre <> 23)) (PreH3 : (i_pre <> 22)) (PreH4 : (i_pre <> 21)) (PreH5 : (i_pre <> 20)) (PreH6 : (i_pre <> 19)) (PreH7 : (i_pre <> 18)) (PreH8 : (i_pre <> 17)) (PreH9 : (i_pre <> 16)) (PreH10 : (i_pre <> 15)) (PreH11 : (i_pre <> 14)) (PreH12 : (i_pre <> 13)) (PreH13 : (i_pre <> 12)) (PreH14 : (i_pre <> 11)) (PreH15 : (i_pre <> 10)) (PreH16 : (i_pre <> 9)) (PreH17 : (i_pre <> 8)) (PreH18 : (i_pre <> 7)) (PreH19 : (i_pre <> 6)) (PreH20 : (i_pre <> 5)) (PreH21 : (i_pre <> 4)) (PreH22 : (i_pre <> 3)) (PreH23 : (i_pre <> 2)) (PreH24 : (i_pre <> 1)) (PreH25 : (i_pre <> 0)) (PreH26 : (0 <= i_pre)) (PreH27 : (i_pre < 32)) ,
  (x24 = (qm_vec32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31) (24)))
.

Definition qm_get32_return_wit_9 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre = 23)) (PreH2 : (i_pre <> 22)) (PreH3 : (i_pre <> 21)) (PreH4 : (i_pre <> 20)) (PreH5 : (i_pre <> 19)) (PreH6 : (i_pre <> 18)) (PreH7 : (i_pre <> 17)) (PreH8 : (i_pre <> 16)) (PreH9 : (i_pre <> 15)) (PreH10 : (i_pre <> 14)) (PreH11 : (i_pre <> 13)) (PreH12 : (i_pre <> 12)) (PreH13 : (i_pre <> 11)) (PreH14 : (i_pre <> 10)) (PreH15 : (i_pre <> 9)) (PreH16 : (i_pre <> 8)) (PreH17 : (i_pre <> 7)) (PreH18 : (i_pre <> 6)) (PreH19 : (i_pre <> 5)) (PreH20 : (i_pre <> 4)) (PreH21 : (i_pre <> 3)) (PreH22 : (i_pre <> 2)) (PreH23 : (i_pre <> 1)) (PreH24 : (i_pre <> 0)) (PreH25 : (0 <= i_pre)) (PreH26 : (i_pre < 32)) ,
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
|--
  “ (x23 = (qm_vec32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31) (i_pre))) ”
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
) \/
(
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre = 23)) (PreH2 : (i_pre <> 22)) (PreH3 : (i_pre <> 21)) (PreH4 : (i_pre <> 20)) (PreH5 : (i_pre <> 19)) (PreH6 : (i_pre <> 18)) (PreH7 : (i_pre <> 17)) (PreH8 : (i_pre <> 16)) (PreH9 : (i_pre <> 15)) (PreH10 : (i_pre <> 14)) (PreH11 : (i_pre <> 13)) (PreH12 : (i_pre <> 12)) (PreH13 : (i_pre <> 11)) (PreH14 : (i_pre <> 10)) (PreH15 : (i_pre <> 9)) (PreH16 : (i_pre <> 8)) (PreH17 : (i_pre <> 7)) (PreH18 : (i_pre <> 6)) (PreH19 : (i_pre <> 5)) (PreH20 : (i_pre <> 4)) (PreH21 : (i_pre <> 3)) (PreH22 : (i_pre <> 2)) (PreH23 : (i_pre <> 1)) (PreH24 : (i_pre <> 0)) (PreH25 : (0 <= i_pre)) (PreH26 : (i_pre < 32)) ,
  TT && emp 
|--
  “ (x23 = (qm_vec32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31) (23))) ”
  &&  emp
).

Definition qm_get32_return_wit_9_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre = 23)) (PreH2 : (i_pre <> 22)) (PreH3 : (i_pre <> 21)) (PreH4 : (i_pre <> 20)) (PreH5 : (i_pre <> 19)) (PreH6 : (i_pre <> 18)) (PreH7 : (i_pre <> 17)) (PreH8 : (i_pre <> 16)) (PreH9 : (i_pre <> 15)) (PreH10 : (i_pre <> 14)) (PreH11 : (i_pre <> 13)) (PreH12 : (i_pre <> 12)) (PreH13 : (i_pre <> 11)) (PreH14 : (i_pre <> 10)) (PreH15 : (i_pre <> 9)) (PreH16 : (i_pre <> 8)) (PreH17 : (i_pre <> 7)) (PreH18 : (i_pre <> 6)) (PreH19 : (i_pre <> 5)) (PreH20 : (i_pre <> 4)) (PreH21 : (i_pre <> 3)) (PreH22 : (i_pre <> 2)) (PreH23 : (i_pre <> 1)) (PreH24 : (i_pre <> 0)) (PreH25 : (0 <= i_pre)) (PreH26 : (i_pre < 32)) ,
  (x23 = (qm_vec32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31) (23)))
.

Definition qm_get32_return_wit_10 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre = 22)) (PreH2 : (i_pre <> 21)) (PreH3 : (i_pre <> 20)) (PreH4 : (i_pre <> 19)) (PreH5 : (i_pre <> 18)) (PreH6 : (i_pre <> 17)) (PreH7 : (i_pre <> 16)) (PreH8 : (i_pre <> 15)) (PreH9 : (i_pre <> 14)) (PreH10 : (i_pre <> 13)) (PreH11 : (i_pre <> 12)) (PreH12 : (i_pre <> 11)) (PreH13 : (i_pre <> 10)) (PreH14 : (i_pre <> 9)) (PreH15 : (i_pre <> 8)) (PreH16 : (i_pre <> 7)) (PreH17 : (i_pre <> 6)) (PreH18 : (i_pre <> 5)) (PreH19 : (i_pre <> 4)) (PreH20 : (i_pre <> 3)) (PreH21 : (i_pre <> 2)) (PreH22 : (i_pre <> 1)) (PreH23 : (i_pre <> 0)) (PreH24 : (0 <= i_pre)) (PreH25 : (i_pre < 32)) ,
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
|--
  “ (x22 = (qm_vec32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31) (i_pre))) ”
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
) \/
(
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre = 22)) (PreH2 : (i_pre <> 21)) (PreH3 : (i_pre <> 20)) (PreH4 : (i_pre <> 19)) (PreH5 : (i_pre <> 18)) (PreH6 : (i_pre <> 17)) (PreH7 : (i_pre <> 16)) (PreH8 : (i_pre <> 15)) (PreH9 : (i_pre <> 14)) (PreH10 : (i_pre <> 13)) (PreH11 : (i_pre <> 12)) (PreH12 : (i_pre <> 11)) (PreH13 : (i_pre <> 10)) (PreH14 : (i_pre <> 9)) (PreH15 : (i_pre <> 8)) (PreH16 : (i_pre <> 7)) (PreH17 : (i_pre <> 6)) (PreH18 : (i_pre <> 5)) (PreH19 : (i_pre <> 4)) (PreH20 : (i_pre <> 3)) (PreH21 : (i_pre <> 2)) (PreH22 : (i_pre <> 1)) (PreH23 : (i_pre <> 0)) (PreH24 : (0 <= i_pre)) (PreH25 : (i_pre < 32)) ,
  TT && emp 
|--
  “ (x22 = (qm_vec32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31) (22))) ”
  &&  emp
).

Definition qm_get32_return_wit_10_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre = 22)) (PreH2 : (i_pre <> 21)) (PreH3 : (i_pre <> 20)) (PreH4 : (i_pre <> 19)) (PreH5 : (i_pre <> 18)) (PreH6 : (i_pre <> 17)) (PreH7 : (i_pre <> 16)) (PreH8 : (i_pre <> 15)) (PreH9 : (i_pre <> 14)) (PreH10 : (i_pre <> 13)) (PreH11 : (i_pre <> 12)) (PreH12 : (i_pre <> 11)) (PreH13 : (i_pre <> 10)) (PreH14 : (i_pre <> 9)) (PreH15 : (i_pre <> 8)) (PreH16 : (i_pre <> 7)) (PreH17 : (i_pre <> 6)) (PreH18 : (i_pre <> 5)) (PreH19 : (i_pre <> 4)) (PreH20 : (i_pre <> 3)) (PreH21 : (i_pre <> 2)) (PreH22 : (i_pre <> 1)) (PreH23 : (i_pre <> 0)) (PreH24 : (0 <= i_pre)) (PreH25 : (i_pre < 32)) ,
  (x22 = (qm_vec32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31) (22)))
.

Definition qm_get32_return_wit_11 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre = 21)) (PreH2 : (i_pre <> 20)) (PreH3 : (i_pre <> 19)) (PreH4 : (i_pre <> 18)) (PreH5 : (i_pre <> 17)) (PreH6 : (i_pre <> 16)) (PreH7 : (i_pre <> 15)) (PreH8 : (i_pre <> 14)) (PreH9 : (i_pre <> 13)) (PreH10 : (i_pre <> 12)) (PreH11 : (i_pre <> 11)) (PreH12 : (i_pre <> 10)) (PreH13 : (i_pre <> 9)) (PreH14 : (i_pre <> 8)) (PreH15 : (i_pre <> 7)) (PreH16 : (i_pre <> 6)) (PreH17 : (i_pre <> 5)) (PreH18 : (i_pre <> 4)) (PreH19 : (i_pre <> 3)) (PreH20 : (i_pre <> 2)) (PreH21 : (i_pre <> 1)) (PreH22 : (i_pre <> 0)) (PreH23 : (0 <= i_pre)) (PreH24 : (i_pre < 32)) ,
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
|--
  “ (x21 = (qm_vec32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31) (i_pre))) ”
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
) \/
(
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre = 21)) (PreH2 : (i_pre <> 20)) (PreH3 : (i_pre <> 19)) (PreH4 : (i_pre <> 18)) (PreH5 : (i_pre <> 17)) (PreH6 : (i_pre <> 16)) (PreH7 : (i_pre <> 15)) (PreH8 : (i_pre <> 14)) (PreH9 : (i_pre <> 13)) (PreH10 : (i_pre <> 12)) (PreH11 : (i_pre <> 11)) (PreH12 : (i_pre <> 10)) (PreH13 : (i_pre <> 9)) (PreH14 : (i_pre <> 8)) (PreH15 : (i_pre <> 7)) (PreH16 : (i_pre <> 6)) (PreH17 : (i_pre <> 5)) (PreH18 : (i_pre <> 4)) (PreH19 : (i_pre <> 3)) (PreH20 : (i_pre <> 2)) (PreH21 : (i_pre <> 1)) (PreH22 : (i_pre <> 0)) (PreH23 : (0 <= i_pre)) (PreH24 : (i_pre < 32)) ,
  TT && emp 
|--
  “ (x21 = (qm_vec32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31) (21))) ”
  &&  emp
).

Definition qm_get32_return_wit_11_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre = 21)) (PreH2 : (i_pre <> 20)) (PreH3 : (i_pre <> 19)) (PreH4 : (i_pre <> 18)) (PreH5 : (i_pre <> 17)) (PreH6 : (i_pre <> 16)) (PreH7 : (i_pre <> 15)) (PreH8 : (i_pre <> 14)) (PreH9 : (i_pre <> 13)) (PreH10 : (i_pre <> 12)) (PreH11 : (i_pre <> 11)) (PreH12 : (i_pre <> 10)) (PreH13 : (i_pre <> 9)) (PreH14 : (i_pre <> 8)) (PreH15 : (i_pre <> 7)) (PreH16 : (i_pre <> 6)) (PreH17 : (i_pre <> 5)) (PreH18 : (i_pre <> 4)) (PreH19 : (i_pre <> 3)) (PreH20 : (i_pre <> 2)) (PreH21 : (i_pre <> 1)) (PreH22 : (i_pre <> 0)) (PreH23 : (0 <= i_pre)) (PreH24 : (i_pre < 32)) ,
  (x21 = (qm_vec32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31) (21)))
.

Definition qm_get32_return_wit_12 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre = 20)) (PreH2 : (i_pre <> 19)) (PreH3 : (i_pre <> 18)) (PreH4 : (i_pre <> 17)) (PreH5 : (i_pre <> 16)) (PreH6 : (i_pre <> 15)) (PreH7 : (i_pre <> 14)) (PreH8 : (i_pre <> 13)) (PreH9 : (i_pre <> 12)) (PreH10 : (i_pre <> 11)) (PreH11 : (i_pre <> 10)) (PreH12 : (i_pre <> 9)) (PreH13 : (i_pre <> 8)) (PreH14 : (i_pre <> 7)) (PreH15 : (i_pre <> 6)) (PreH16 : (i_pre <> 5)) (PreH17 : (i_pre <> 4)) (PreH18 : (i_pre <> 3)) (PreH19 : (i_pre <> 2)) (PreH20 : (i_pre <> 1)) (PreH21 : (i_pre <> 0)) (PreH22 : (0 <= i_pre)) (PreH23 : (i_pre < 32)) ,
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
|--
  “ (x20 = (qm_vec32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31) (i_pre))) ”
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
) \/
(
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre = 20)) (PreH2 : (i_pre <> 19)) (PreH3 : (i_pre <> 18)) (PreH4 : (i_pre <> 17)) (PreH5 : (i_pre <> 16)) (PreH6 : (i_pre <> 15)) (PreH7 : (i_pre <> 14)) (PreH8 : (i_pre <> 13)) (PreH9 : (i_pre <> 12)) (PreH10 : (i_pre <> 11)) (PreH11 : (i_pre <> 10)) (PreH12 : (i_pre <> 9)) (PreH13 : (i_pre <> 8)) (PreH14 : (i_pre <> 7)) (PreH15 : (i_pre <> 6)) (PreH16 : (i_pre <> 5)) (PreH17 : (i_pre <> 4)) (PreH18 : (i_pre <> 3)) (PreH19 : (i_pre <> 2)) (PreH20 : (i_pre <> 1)) (PreH21 : (i_pre <> 0)) (PreH22 : (0 <= i_pre)) (PreH23 : (i_pre < 32)) ,
  TT && emp 
|--
  “ (x20 = (qm_vec32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31) (20))) ”
  &&  emp
).

Definition qm_get32_return_wit_12_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre = 20)) (PreH2 : (i_pre <> 19)) (PreH3 : (i_pre <> 18)) (PreH4 : (i_pre <> 17)) (PreH5 : (i_pre <> 16)) (PreH6 : (i_pre <> 15)) (PreH7 : (i_pre <> 14)) (PreH8 : (i_pre <> 13)) (PreH9 : (i_pre <> 12)) (PreH10 : (i_pre <> 11)) (PreH11 : (i_pre <> 10)) (PreH12 : (i_pre <> 9)) (PreH13 : (i_pre <> 8)) (PreH14 : (i_pre <> 7)) (PreH15 : (i_pre <> 6)) (PreH16 : (i_pre <> 5)) (PreH17 : (i_pre <> 4)) (PreH18 : (i_pre <> 3)) (PreH19 : (i_pre <> 2)) (PreH20 : (i_pre <> 1)) (PreH21 : (i_pre <> 0)) (PreH22 : (0 <= i_pre)) (PreH23 : (i_pre < 32)) ,
  (x20 = (qm_vec32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31) (20)))
.

Definition qm_get32_return_wit_13 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre = 19)) (PreH2 : (i_pre <> 18)) (PreH3 : (i_pre <> 17)) (PreH4 : (i_pre <> 16)) (PreH5 : (i_pre <> 15)) (PreH6 : (i_pre <> 14)) (PreH7 : (i_pre <> 13)) (PreH8 : (i_pre <> 12)) (PreH9 : (i_pre <> 11)) (PreH10 : (i_pre <> 10)) (PreH11 : (i_pre <> 9)) (PreH12 : (i_pre <> 8)) (PreH13 : (i_pre <> 7)) (PreH14 : (i_pre <> 6)) (PreH15 : (i_pre <> 5)) (PreH16 : (i_pre <> 4)) (PreH17 : (i_pre <> 3)) (PreH18 : (i_pre <> 2)) (PreH19 : (i_pre <> 1)) (PreH20 : (i_pre <> 0)) (PreH21 : (0 <= i_pre)) (PreH22 : (i_pre < 32)) ,
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
|--
  “ (x19 = (qm_vec32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31) (i_pre))) ”
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
) \/
(
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre = 19)) (PreH2 : (i_pre <> 18)) (PreH3 : (i_pre <> 17)) (PreH4 : (i_pre <> 16)) (PreH5 : (i_pre <> 15)) (PreH6 : (i_pre <> 14)) (PreH7 : (i_pre <> 13)) (PreH8 : (i_pre <> 12)) (PreH9 : (i_pre <> 11)) (PreH10 : (i_pre <> 10)) (PreH11 : (i_pre <> 9)) (PreH12 : (i_pre <> 8)) (PreH13 : (i_pre <> 7)) (PreH14 : (i_pre <> 6)) (PreH15 : (i_pre <> 5)) (PreH16 : (i_pre <> 4)) (PreH17 : (i_pre <> 3)) (PreH18 : (i_pre <> 2)) (PreH19 : (i_pre <> 1)) (PreH20 : (i_pre <> 0)) (PreH21 : (0 <= i_pre)) (PreH22 : (i_pre < 32)) ,
  TT && emp 
|--
  “ (x19 = (qm_vec32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31) (19))) ”
  &&  emp
).

Definition qm_get32_return_wit_13_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre = 19)) (PreH2 : (i_pre <> 18)) (PreH3 : (i_pre <> 17)) (PreH4 : (i_pre <> 16)) (PreH5 : (i_pre <> 15)) (PreH6 : (i_pre <> 14)) (PreH7 : (i_pre <> 13)) (PreH8 : (i_pre <> 12)) (PreH9 : (i_pre <> 11)) (PreH10 : (i_pre <> 10)) (PreH11 : (i_pre <> 9)) (PreH12 : (i_pre <> 8)) (PreH13 : (i_pre <> 7)) (PreH14 : (i_pre <> 6)) (PreH15 : (i_pre <> 5)) (PreH16 : (i_pre <> 4)) (PreH17 : (i_pre <> 3)) (PreH18 : (i_pre <> 2)) (PreH19 : (i_pre <> 1)) (PreH20 : (i_pre <> 0)) (PreH21 : (0 <= i_pre)) (PreH22 : (i_pre < 32)) ,
  (x19 = (qm_vec32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31) (19)))
.

Definition qm_get32_return_wit_14 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre = 18)) (PreH2 : (i_pre <> 17)) (PreH3 : (i_pre <> 16)) (PreH4 : (i_pre <> 15)) (PreH5 : (i_pre <> 14)) (PreH6 : (i_pre <> 13)) (PreH7 : (i_pre <> 12)) (PreH8 : (i_pre <> 11)) (PreH9 : (i_pre <> 10)) (PreH10 : (i_pre <> 9)) (PreH11 : (i_pre <> 8)) (PreH12 : (i_pre <> 7)) (PreH13 : (i_pre <> 6)) (PreH14 : (i_pre <> 5)) (PreH15 : (i_pre <> 4)) (PreH16 : (i_pre <> 3)) (PreH17 : (i_pre <> 2)) (PreH18 : (i_pre <> 1)) (PreH19 : (i_pre <> 0)) (PreH20 : (0 <= i_pre)) (PreH21 : (i_pre < 32)) ,
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
|--
  “ (x18 = (qm_vec32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31) (i_pre))) ”
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
) \/
(
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre = 18)) (PreH2 : (i_pre <> 17)) (PreH3 : (i_pre <> 16)) (PreH4 : (i_pre <> 15)) (PreH5 : (i_pre <> 14)) (PreH6 : (i_pre <> 13)) (PreH7 : (i_pre <> 12)) (PreH8 : (i_pre <> 11)) (PreH9 : (i_pre <> 10)) (PreH10 : (i_pre <> 9)) (PreH11 : (i_pre <> 8)) (PreH12 : (i_pre <> 7)) (PreH13 : (i_pre <> 6)) (PreH14 : (i_pre <> 5)) (PreH15 : (i_pre <> 4)) (PreH16 : (i_pre <> 3)) (PreH17 : (i_pre <> 2)) (PreH18 : (i_pre <> 1)) (PreH19 : (i_pre <> 0)) (PreH20 : (0 <= i_pre)) (PreH21 : (i_pre < 32)) ,
  TT && emp 
|--
  “ (x18 = (qm_vec32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31) (18))) ”
  &&  emp
).

Definition qm_get32_return_wit_14_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre = 18)) (PreH2 : (i_pre <> 17)) (PreH3 : (i_pre <> 16)) (PreH4 : (i_pre <> 15)) (PreH5 : (i_pre <> 14)) (PreH6 : (i_pre <> 13)) (PreH7 : (i_pre <> 12)) (PreH8 : (i_pre <> 11)) (PreH9 : (i_pre <> 10)) (PreH10 : (i_pre <> 9)) (PreH11 : (i_pre <> 8)) (PreH12 : (i_pre <> 7)) (PreH13 : (i_pre <> 6)) (PreH14 : (i_pre <> 5)) (PreH15 : (i_pre <> 4)) (PreH16 : (i_pre <> 3)) (PreH17 : (i_pre <> 2)) (PreH18 : (i_pre <> 1)) (PreH19 : (i_pre <> 0)) (PreH20 : (0 <= i_pre)) (PreH21 : (i_pre < 32)) ,
  (x18 = (qm_vec32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31) (18)))
.

Definition qm_get32_return_wit_15 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre = 17)) (PreH2 : (i_pre <> 16)) (PreH3 : (i_pre <> 15)) (PreH4 : (i_pre <> 14)) (PreH5 : (i_pre <> 13)) (PreH6 : (i_pre <> 12)) (PreH7 : (i_pre <> 11)) (PreH8 : (i_pre <> 10)) (PreH9 : (i_pre <> 9)) (PreH10 : (i_pre <> 8)) (PreH11 : (i_pre <> 7)) (PreH12 : (i_pre <> 6)) (PreH13 : (i_pre <> 5)) (PreH14 : (i_pre <> 4)) (PreH15 : (i_pre <> 3)) (PreH16 : (i_pre <> 2)) (PreH17 : (i_pre <> 1)) (PreH18 : (i_pre <> 0)) (PreH19 : (0 <= i_pre)) (PreH20 : (i_pre < 32)) ,
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
|--
  “ (x17 = (qm_vec32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31) (i_pre))) ”
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
) \/
(
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre = 17)) (PreH2 : (i_pre <> 16)) (PreH3 : (i_pre <> 15)) (PreH4 : (i_pre <> 14)) (PreH5 : (i_pre <> 13)) (PreH6 : (i_pre <> 12)) (PreH7 : (i_pre <> 11)) (PreH8 : (i_pre <> 10)) (PreH9 : (i_pre <> 9)) (PreH10 : (i_pre <> 8)) (PreH11 : (i_pre <> 7)) (PreH12 : (i_pre <> 6)) (PreH13 : (i_pre <> 5)) (PreH14 : (i_pre <> 4)) (PreH15 : (i_pre <> 3)) (PreH16 : (i_pre <> 2)) (PreH17 : (i_pre <> 1)) (PreH18 : (i_pre <> 0)) (PreH19 : (0 <= i_pre)) (PreH20 : (i_pre < 32)) ,
  TT && emp 
|--
  “ (x17 = (qm_vec32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31) (17))) ”
  &&  emp
).

Definition qm_get32_return_wit_15_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre = 17)) (PreH2 : (i_pre <> 16)) (PreH3 : (i_pre <> 15)) (PreH4 : (i_pre <> 14)) (PreH5 : (i_pre <> 13)) (PreH6 : (i_pre <> 12)) (PreH7 : (i_pre <> 11)) (PreH8 : (i_pre <> 10)) (PreH9 : (i_pre <> 9)) (PreH10 : (i_pre <> 8)) (PreH11 : (i_pre <> 7)) (PreH12 : (i_pre <> 6)) (PreH13 : (i_pre <> 5)) (PreH14 : (i_pre <> 4)) (PreH15 : (i_pre <> 3)) (PreH16 : (i_pre <> 2)) (PreH17 : (i_pre <> 1)) (PreH18 : (i_pre <> 0)) (PreH19 : (0 <= i_pre)) (PreH20 : (i_pre < 32)) ,
  (x17 = (qm_vec32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31) (17)))
.

Definition qm_get32_return_wit_16 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre = 16)) (PreH2 : (i_pre <> 15)) (PreH3 : (i_pre <> 14)) (PreH4 : (i_pre <> 13)) (PreH5 : (i_pre <> 12)) (PreH6 : (i_pre <> 11)) (PreH7 : (i_pre <> 10)) (PreH8 : (i_pre <> 9)) (PreH9 : (i_pre <> 8)) (PreH10 : (i_pre <> 7)) (PreH11 : (i_pre <> 6)) (PreH12 : (i_pre <> 5)) (PreH13 : (i_pre <> 4)) (PreH14 : (i_pre <> 3)) (PreH15 : (i_pre <> 2)) (PreH16 : (i_pre <> 1)) (PreH17 : (i_pre <> 0)) (PreH18 : (0 <= i_pre)) (PreH19 : (i_pre < 32)) ,
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
|--
  “ (x16 = (qm_vec32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31) (i_pre))) ”
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
) \/
(
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre = 16)) (PreH2 : (i_pre <> 15)) (PreH3 : (i_pre <> 14)) (PreH4 : (i_pre <> 13)) (PreH5 : (i_pre <> 12)) (PreH6 : (i_pre <> 11)) (PreH7 : (i_pre <> 10)) (PreH8 : (i_pre <> 9)) (PreH9 : (i_pre <> 8)) (PreH10 : (i_pre <> 7)) (PreH11 : (i_pre <> 6)) (PreH12 : (i_pre <> 5)) (PreH13 : (i_pre <> 4)) (PreH14 : (i_pre <> 3)) (PreH15 : (i_pre <> 2)) (PreH16 : (i_pre <> 1)) (PreH17 : (i_pre <> 0)) (PreH18 : (0 <= i_pre)) (PreH19 : (i_pre < 32)) ,
  TT && emp 
|--
  “ (x16 = (qm_vec32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31) (16))) ”
  &&  emp
).

Definition qm_get32_return_wit_16_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre = 16)) (PreH2 : (i_pre <> 15)) (PreH3 : (i_pre <> 14)) (PreH4 : (i_pre <> 13)) (PreH5 : (i_pre <> 12)) (PreH6 : (i_pre <> 11)) (PreH7 : (i_pre <> 10)) (PreH8 : (i_pre <> 9)) (PreH9 : (i_pre <> 8)) (PreH10 : (i_pre <> 7)) (PreH11 : (i_pre <> 6)) (PreH12 : (i_pre <> 5)) (PreH13 : (i_pre <> 4)) (PreH14 : (i_pre <> 3)) (PreH15 : (i_pre <> 2)) (PreH16 : (i_pre <> 1)) (PreH17 : (i_pre <> 0)) (PreH18 : (0 <= i_pre)) (PreH19 : (i_pre < 32)) ,
  (x16 = (qm_vec32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31) (16)))
.

Definition qm_get32_return_wit_17 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre = 15)) (PreH2 : (i_pre <> 14)) (PreH3 : (i_pre <> 13)) (PreH4 : (i_pre <> 12)) (PreH5 : (i_pre <> 11)) (PreH6 : (i_pre <> 10)) (PreH7 : (i_pre <> 9)) (PreH8 : (i_pre <> 8)) (PreH9 : (i_pre <> 7)) (PreH10 : (i_pre <> 6)) (PreH11 : (i_pre <> 5)) (PreH12 : (i_pre <> 4)) (PreH13 : (i_pre <> 3)) (PreH14 : (i_pre <> 2)) (PreH15 : (i_pre <> 1)) (PreH16 : (i_pre <> 0)) (PreH17 : (0 <= i_pre)) (PreH18 : (i_pre < 32)) ,
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
|--
  “ (x15 = (qm_vec32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31) (i_pre))) ”
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
) \/
(
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre = 15)) (PreH2 : (i_pre <> 14)) (PreH3 : (i_pre <> 13)) (PreH4 : (i_pre <> 12)) (PreH5 : (i_pre <> 11)) (PreH6 : (i_pre <> 10)) (PreH7 : (i_pre <> 9)) (PreH8 : (i_pre <> 8)) (PreH9 : (i_pre <> 7)) (PreH10 : (i_pre <> 6)) (PreH11 : (i_pre <> 5)) (PreH12 : (i_pre <> 4)) (PreH13 : (i_pre <> 3)) (PreH14 : (i_pre <> 2)) (PreH15 : (i_pre <> 1)) (PreH16 : (i_pre <> 0)) (PreH17 : (0 <= i_pre)) (PreH18 : (i_pre < 32)) ,
  TT && emp 
|--
  “ (x15 = (qm_vec32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31) (15))) ”
  &&  emp
).

Definition qm_get32_return_wit_17_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre = 15)) (PreH2 : (i_pre <> 14)) (PreH3 : (i_pre <> 13)) (PreH4 : (i_pre <> 12)) (PreH5 : (i_pre <> 11)) (PreH6 : (i_pre <> 10)) (PreH7 : (i_pre <> 9)) (PreH8 : (i_pre <> 8)) (PreH9 : (i_pre <> 7)) (PreH10 : (i_pre <> 6)) (PreH11 : (i_pre <> 5)) (PreH12 : (i_pre <> 4)) (PreH13 : (i_pre <> 3)) (PreH14 : (i_pre <> 2)) (PreH15 : (i_pre <> 1)) (PreH16 : (i_pre <> 0)) (PreH17 : (0 <= i_pre)) (PreH18 : (i_pre < 32)) ,
  (x15 = (qm_vec32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31) (15)))
.

Definition qm_get32_return_wit_18 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre = 14)) (PreH2 : (i_pre <> 13)) (PreH3 : (i_pre <> 12)) (PreH4 : (i_pre <> 11)) (PreH5 : (i_pre <> 10)) (PreH6 : (i_pre <> 9)) (PreH7 : (i_pre <> 8)) (PreH8 : (i_pre <> 7)) (PreH9 : (i_pre <> 6)) (PreH10 : (i_pre <> 5)) (PreH11 : (i_pre <> 4)) (PreH12 : (i_pre <> 3)) (PreH13 : (i_pre <> 2)) (PreH14 : (i_pre <> 1)) (PreH15 : (i_pre <> 0)) (PreH16 : (0 <= i_pre)) (PreH17 : (i_pre < 32)) ,
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
|--
  “ (x14 = (qm_vec32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31) (i_pre))) ”
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
) \/
(
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre = 14)) (PreH2 : (i_pre <> 13)) (PreH3 : (i_pre <> 12)) (PreH4 : (i_pre <> 11)) (PreH5 : (i_pre <> 10)) (PreH6 : (i_pre <> 9)) (PreH7 : (i_pre <> 8)) (PreH8 : (i_pre <> 7)) (PreH9 : (i_pre <> 6)) (PreH10 : (i_pre <> 5)) (PreH11 : (i_pre <> 4)) (PreH12 : (i_pre <> 3)) (PreH13 : (i_pre <> 2)) (PreH14 : (i_pre <> 1)) (PreH15 : (i_pre <> 0)) (PreH16 : (0 <= i_pre)) (PreH17 : (i_pre < 32)) ,
  TT && emp 
|--
  “ (x14 = (qm_vec32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31) (14))) ”
  &&  emp
).

Definition qm_get32_return_wit_18_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre = 14)) (PreH2 : (i_pre <> 13)) (PreH3 : (i_pre <> 12)) (PreH4 : (i_pre <> 11)) (PreH5 : (i_pre <> 10)) (PreH6 : (i_pre <> 9)) (PreH7 : (i_pre <> 8)) (PreH8 : (i_pre <> 7)) (PreH9 : (i_pre <> 6)) (PreH10 : (i_pre <> 5)) (PreH11 : (i_pre <> 4)) (PreH12 : (i_pre <> 3)) (PreH13 : (i_pre <> 2)) (PreH14 : (i_pre <> 1)) (PreH15 : (i_pre <> 0)) (PreH16 : (0 <= i_pre)) (PreH17 : (i_pre < 32)) ,
  (x14 = (qm_vec32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31) (14)))
.

Definition qm_get32_return_wit_19 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre = 13)) (PreH2 : (i_pre <> 12)) (PreH3 : (i_pre <> 11)) (PreH4 : (i_pre <> 10)) (PreH5 : (i_pre <> 9)) (PreH6 : (i_pre <> 8)) (PreH7 : (i_pre <> 7)) (PreH8 : (i_pre <> 6)) (PreH9 : (i_pre <> 5)) (PreH10 : (i_pre <> 4)) (PreH11 : (i_pre <> 3)) (PreH12 : (i_pre <> 2)) (PreH13 : (i_pre <> 1)) (PreH14 : (i_pre <> 0)) (PreH15 : (0 <= i_pre)) (PreH16 : (i_pre < 32)) ,
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
|--
  “ (x13 = (qm_vec32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31) (i_pre))) ”
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
) \/
(
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre = 13)) (PreH2 : (i_pre <> 12)) (PreH3 : (i_pre <> 11)) (PreH4 : (i_pre <> 10)) (PreH5 : (i_pre <> 9)) (PreH6 : (i_pre <> 8)) (PreH7 : (i_pre <> 7)) (PreH8 : (i_pre <> 6)) (PreH9 : (i_pre <> 5)) (PreH10 : (i_pre <> 4)) (PreH11 : (i_pre <> 3)) (PreH12 : (i_pre <> 2)) (PreH13 : (i_pre <> 1)) (PreH14 : (i_pre <> 0)) (PreH15 : (0 <= i_pre)) (PreH16 : (i_pre < 32)) ,
  TT && emp 
|--
  “ (x13 = (qm_vec32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31) (13))) ”
  &&  emp
).

Definition qm_get32_return_wit_19_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre = 13)) (PreH2 : (i_pre <> 12)) (PreH3 : (i_pre <> 11)) (PreH4 : (i_pre <> 10)) (PreH5 : (i_pre <> 9)) (PreH6 : (i_pre <> 8)) (PreH7 : (i_pre <> 7)) (PreH8 : (i_pre <> 6)) (PreH9 : (i_pre <> 5)) (PreH10 : (i_pre <> 4)) (PreH11 : (i_pre <> 3)) (PreH12 : (i_pre <> 2)) (PreH13 : (i_pre <> 1)) (PreH14 : (i_pre <> 0)) (PreH15 : (0 <= i_pre)) (PreH16 : (i_pre < 32)) ,
  (x13 = (qm_vec32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31) (13)))
.

Definition qm_get32_return_wit_20 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre = 12)) (PreH2 : (i_pre <> 11)) (PreH3 : (i_pre <> 10)) (PreH4 : (i_pre <> 9)) (PreH5 : (i_pre <> 8)) (PreH6 : (i_pre <> 7)) (PreH7 : (i_pre <> 6)) (PreH8 : (i_pre <> 5)) (PreH9 : (i_pre <> 4)) (PreH10 : (i_pre <> 3)) (PreH11 : (i_pre <> 2)) (PreH12 : (i_pre <> 1)) (PreH13 : (i_pre <> 0)) (PreH14 : (0 <= i_pre)) (PreH15 : (i_pre < 32)) ,
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
|--
  “ (x12 = (qm_vec32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31) (i_pre))) ”
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
) \/
(
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre = 12)) (PreH2 : (i_pre <> 11)) (PreH3 : (i_pre <> 10)) (PreH4 : (i_pre <> 9)) (PreH5 : (i_pre <> 8)) (PreH6 : (i_pre <> 7)) (PreH7 : (i_pre <> 6)) (PreH8 : (i_pre <> 5)) (PreH9 : (i_pre <> 4)) (PreH10 : (i_pre <> 3)) (PreH11 : (i_pre <> 2)) (PreH12 : (i_pre <> 1)) (PreH13 : (i_pre <> 0)) (PreH14 : (0 <= i_pre)) (PreH15 : (i_pre < 32)) ,
  TT && emp 
|--
  “ (x12 = (qm_vec32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31) (12))) ”
  &&  emp
).

Definition qm_get32_return_wit_20_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre = 12)) (PreH2 : (i_pre <> 11)) (PreH3 : (i_pre <> 10)) (PreH4 : (i_pre <> 9)) (PreH5 : (i_pre <> 8)) (PreH6 : (i_pre <> 7)) (PreH7 : (i_pre <> 6)) (PreH8 : (i_pre <> 5)) (PreH9 : (i_pre <> 4)) (PreH10 : (i_pre <> 3)) (PreH11 : (i_pre <> 2)) (PreH12 : (i_pre <> 1)) (PreH13 : (i_pre <> 0)) (PreH14 : (0 <= i_pre)) (PreH15 : (i_pre < 32)) ,
  (x12 = (qm_vec32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31) (12)))
.

Definition qm_get32_return_wit_21 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre = 11)) (PreH2 : (i_pre <> 10)) (PreH3 : (i_pre <> 9)) (PreH4 : (i_pre <> 8)) (PreH5 : (i_pre <> 7)) (PreH6 : (i_pre <> 6)) (PreH7 : (i_pre <> 5)) (PreH8 : (i_pre <> 4)) (PreH9 : (i_pre <> 3)) (PreH10 : (i_pre <> 2)) (PreH11 : (i_pre <> 1)) (PreH12 : (i_pre <> 0)) (PreH13 : (0 <= i_pre)) (PreH14 : (i_pre < 32)) ,
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
|--
  “ (x11 = (qm_vec32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31) (i_pre))) ”
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
) \/
(
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre = 11)) (PreH2 : (i_pre <> 10)) (PreH3 : (i_pre <> 9)) (PreH4 : (i_pre <> 8)) (PreH5 : (i_pre <> 7)) (PreH6 : (i_pre <> 6)) (PreH7 : (i_pre <> 5)) (PreH8 : (i_pre <> 4)) (PreH9 : (i_pre <> 3)) (PreH10 : (i_pre <> 2)) (PreH11 : (i_pre <> 1)) (PreH12 : (i_pre <> 0)) (PreH13 : (0 <= i_pre)) (PreH14 : (i_pre < 32)) ,
  TT && emp 
|--
  “ (x11 = (qm_vec32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31) (11))) ”
  &&  emp
).

Definition qm_get32_return_wit_21_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre = 11)) (PreH2 : (i_pre <> 10)) (PreH3 : (i_pre <> 9)) (PreH4 : (i_pre <> 8)) (PreH5 : (i_pre <> 7)) (PreH6 : (i_pre <> 6)) (PreH7 : (i_pre <> 5)) (PreH8 : (i_pre <> 4)) (PreH9 : (i_pre <> 3)) (PreH10 : (i_pre <> 2)) (PreH11 : (i_pre <> 1)) (PreH12 : (i_pre <> 0)) (PreH13 : (0 <= i_pre)) (PreH14 : (i_pre < 32)) ,
  (x11 = (qm_vec32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31) (11)))
.

Definition qm_get32_return_wit_22 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre = 10)) (PreH2 : (i_pre <> 9)) (PreH3 : (i_pre <> 8)) (PreH4 : (i_pre <> 7)) (PreH5 : (i_pre <> 6)) (PreH6 : (i_pre <> 5)) (PreH7 : (i_pre <> 4)) (PreH8 : (i_pre <> 3)) (PreH9 : (i_pre <> 2)) (PreH10 : (i_pre <> 1)) (PreH11 : (i_pre <> 0)) (PreH12 : (0 <= i_pre)) (PreH13 : (i_pre < 32)) ,
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
|--
  “ (x10 = (qm_vec32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31) (i_pre))) ”
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
) \/
(
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre = 10)) (PreH2 : (i_pre <> 9)) (PreH3 : (i_pre <> 8)) (PreH4 : (i_pre <> 7)) (PreH5 : (i_pre <> 6)) (PreH6 : (i_pre <> 5)) (PreH7 : (i_pre <> 4)) (PreH8 : (i_pre <> 3)) (PreH9 : (i_pre <> 2)) (PreH10 : (i_pre <> 1)) (PreH11 : (i_pre <> 0)) (PreH12 : (0 <= i_pre)) (PreH13 : (i_pre < 32)) ,
  TT && emp 
|--
  “ (x10 = (qm_vec32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31) (10))) ”
  &&  emp
).

Definition qm_get32_return_wit_22_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre = 10)) (PreH2 : (i_pre <> 9)) (PreH3 : (i_pre <> 8)) (PreH4 : (i_pre <> 7)) (PreH5 : (i_pre <> 6)) (PreH6 : (i_pre <> 5)) (PreH7 : (i_pre <> 4)) (PreH8 : (i_pre <> 3)) (PreH9 : (i_pre <> 2)) (PreH10 : (i_pre <> 1)) (PreH11 : (i_pre <> 0)) (PreH12 : (0 <= i_pre)) (PreH13 : (i_pre < 32)) ,
  (x10 = (qm_vec32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31) (10)))
.

Definition qm_get32_return_wit_23 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre = 9)) (PreH2 : (i_pre <> 8)) (PreH3 : (i_pre <> 7)) (PreH4 : (i_pre <> 6)) (PreH5 : (i_pre <> 5)) (PreH6 : (i_pre <> 4)) (PreH7 : (i_pre <> 3)) (PreH8 : (i_pre <> 2)) (PreH9 : (i_pre <> 1)) (PreH10 : (i_pre <> 0)) (PreH11 : (0 <= i_pre)) (PreH12 : (i_pre < 32)) ,
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
|--
  “ (x9 = (qm_vec32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31) (i_pre))) ”
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
) \/
(
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre = 9)) (PreH2 : (i_pre <> 8)) (PreH3 : (i_pre <> 7)) (PreH4 : (i_pre <> 6)) (PreH5 : (i_pre <> 5)) (PreH6 : (i_pre <> 4)) (PreH7 : (i_pre <> 3)) (PreH8 : (i_pre <> 2)) (PreH9 : (i_pre <> 1)) (PreH10 : (i_pre <> 0)) (PreH11 : (0 <= i_pre)) (PreH12 : (i_pre < 32)) ,
  TT && emp 
|--
  “ (x9 = (qm_vec32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31) (9))) ”
  &&  emp
).

Definition qm_get32_return_wit_23_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre = 9)) (PreH2 : (i_pre <> 8)) (PreH3 : (i_pre <> 7)) (PreH4 : (i_pre <> 6)) (PreH5 : (i_pre <> 5)) (PreH6 : (i_pre <> 4)) (PreH7 : (i_pre <> 3)) (PreH8 : (i_pre <> 2)) (PreH9 : (i_pre <> 1)) (PreH10 : (i_pre <> 0)) (PreH11 : (0 <= i_pre)) (PreH12 : (i_pre < 32)) ,
  (x9 = (qm_vec32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31) (9)))
.

Definition qm_get32_return_wit_24 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre = 8)) (PreH2 : (i_pre <> 7)) (PreH3 : (i_pre <> 6)) (PreH4 : (i_pre <> 5)) (PreH5 : (i_pre <> 4)) (PreH6 : (i_pre <> 3)) (PreH7 : (i_pre <> 2)) (PreH8 : (i_pre <> 1)) (PreH9 : (i_pre <> 0)) (PreH10 : (0 <= i_pre)) (PreH11 : (i_pre < 32)) ,
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
|--
  “ (x8 = (qm_vec32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31) (i_pre))) ”
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
) \/
(
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre = 8)) (PreH2 : (i_pre <> 7)) (PreH3 : (i_pre <> 6)) (PreH4 : (i_pre <> 5)) (PreH5 : (i_pre <> 4)) (PreH6 : (i_pre <> 3)) (PreH7 : (i_pre <> 2)) (PreH8 : (i_pre <> 1)) (PreH9 : (i_pre <> 0)) (PreH10 : (0 <= i_pre)) (PreH11 : (i_pre < 32)) ,
  TT && emp 
|--
  “ (x8 = (qm_vec32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31) (8))) ”
  &&  emp
).

Definition qm_get32_return_wit_24_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre = 8)) (PreH2 : (i_pre <> 7)) (PreH3 : (i_pre <> 6)) (PreH4 : (i_pre <> 5)) (PreH5 : (i_pre <> 4)) (PreH6 : (i_pre <> 3)) (PreH7 : (i_pre <> 2)) (PreH8 : (i_pre <> 1)) (PreH9 : (i_pre <> 0)) (PreH10 : (0 <= i_pre)) (PreH11 : (i_pre < 32)) ,
  (x8 = (qm_vec32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31) (8)))
.

Definition qm_get32_return_wit_25 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre = 7)) (PreH2 : (i_pre <> 6)) (PreH3 : (i_pre <> 5)) (PreH4 : (i_pre <> 4)) (PreH5 : (i_pre <> 3)) (PreH6 : (i_pre <> 2)) (PreH7 : (i_pre <> 1)) (PreH8 : (i_pre <> 0)) (PreH9 : (0 <= i_pre)) (PreH10 : (i_pre < 32)) ,
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
|--
  “ (x7 = (qm_vec32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31) (i_pre))) ”
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
) \/
(
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre = 7)) (PreH2 : (i_pre <> 6)) (PreH3 : (i_pre <> 5)) (PreH4 : (i_pre <> 4)) (PreH5 : (i_pre <> 3)) (PreH6 : (i_pre <> 2)) (PreH7 : (i_pre <> 1)) (PreH8 : (i_pre <> 0)) (PreH9 : (0 <= i_pre)) (PreH10 : (i_pre < 32)) ,
  TT && emp 
|--
  “ (x7 = (qm_vec32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31) (7))) ”
  &&  emp
).

Definition qm_get32_return_wit_25_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre = 7)) (PreH2 : (i_pre <> 6)) (PreH3 : (i_pre <> 5)) (PreH4 : (i_pre <> 4)) (PreH5 : (i_pre <> 3)) (PreH6 : (i_pre <> 2)) (PreH7 : (i_pre <> 1)) (PreH8 : (i_pre <> 0)) (PreH9 : (0 <= i_pre)) (PreH10 : (i_pre < 32)) ,
  (x7 = (qm_vec32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31) (7)))
.

Definition qm_get32_return_wit_26 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre = 6)) (PreH2 : (i_pre <> 5)) (PreH3 : (i_pre <> 4)) (PreH4 : (i_pre <> 3)) (PreH5 : (i_pre <> 2)) (PreH6 : (i_pre <> 1)) (PreH7 : (i_pre <> 0)) (PreH8 : (0 <= i_pre)) (PreH9 : (i_pre < 32)) ,
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
|--
  “ (x6 = (qm_vec32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31) (i_pre))) ”
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
) \/
(
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre = 6)) (PreH2 : (i_pre <> 5)) (PreH3 : (i_pre <> 4)) (PreH4 : (i_pre <> 3)) (PreH5 : (i_pre <> 2)) (PreH6 : (i_pre <> 1)) (PreH7 : (i_pre <> 0)) (PreH8 : (0 <= i_pre)) (PreH9 : (i_pre < 32)) ,
  TT && emp 
|--
  “ (x6 = (qm_vec32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31) (6))) ”
  &&  emp
).

Definition qm_get32_return_wit_26_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre = 6)) (PreH2 : (i_pre <> 5)) (PreH3 : (i_pre <> 4)) (PreH4 : (i_pre <> 3)) (PreH5 : (i_pre <> 2)) (PreH6 : (i_pre <> 1)) (PreH7 : (i_pre <> 0)) (PreH8 : (0 <= i_pre)) (PreH9 : (i_pre < 32)) ,
  (x6 = (qm_vec32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31) (6)))
.

Definition qm_get32_return_wit_27 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre = 5)) (PreH2 : (i_pre <> 4)) (PreH3 : (i_pre <> 3)) (PreH4 : (i_pre <> 2)) (PreH5 : (i_pre <> 1)) (PreH6 : (i_pre <> 0)) (PreH7 : (0 <= i_pre)) (PreH8 : (i_pre < 32)) ,
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
|--
  “ (x5 = (qm_vec32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31) (i_pre))) ”
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
) \/
(
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre = 5)) (PreH2 : (i_pre <> 4)) (PreH3 : (i_pre <> 3)) (PreH4 : (i_pre <> 2)) (PreH5 : (i_pre <> 1)) (PreH6 : (i_pre <> 0)) (PreH7 : (0 <= i_pre)) (PreH8 : (i_pre < 32)) ,
  TT && emp 
|--
  “ (x5 = (qm_vec32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31) (5))) ”
  &&  emp
).

Definition qm_get32_return_wit_27_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre = 5)) (PreH2 : (i_pre <> 4)) (PreH3 : (i_pre <> 3)) (PreH4 : (i_pre <> 2)) (PreH5 : (i_pre <> 1)) (PreH6 : (i_pre <> 0)) (PreH7 : (0 <= i_pre)) (PreH8 : (i_pre < 32)) ,
  (x5 = (qm_vec32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31) (5)))
.

Definition qm_get32_return_wit_28 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre = 4)) (PreH2 : (i_pre <> 3)) (PreH3 : (i_pre <> 2)) (PreH4 : (i_pre <> 1)) (PreH5 : (i_pre <> 0)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) ,
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
|--
  “ (x4 = (qm_vec32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31) (i_pre))) ”
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
) \/
(
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre = 4)) (PreH2 : (i_pre <> 3)) (PreH3 : (i_pre <> 2)) (PreH4 : (i_pre <> 1)) (PreH5 : (i_pre <> 0)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) ,
  TT && emp 
|--
  “ (x4 = (qm_vec32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31) (4))) ”
  &&  emp
).

Definition qm_get32_return_wit_28_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre = 4)) (PreH2 : (i_pre <> 3)) (PreH3 : (i_pre <> 2)) (PreH4 : (i_pre <> 1)) (PreH5 : (i_pre <> 0)) (PreH6 : (0 <= i_pre)) (PreH7 : (i_pre < 32)) ,
  (x4 = (qm_vec32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31) (4)))
.

Definition qm_get32_return_wit_29 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre = 3)) (PreH2 : (i_pre <> 2)) (PreH3 : (i_pre <> 1)) (PreH4 : (i_pre <> 0)) (PreH5 : (0 <= i_pre)) (PreH6 : (i_pre < 32)) ,
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
|--
  “ (x3 = (qm_vec32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31) (i_pre))) ”
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
) \/
(
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre = 3)) (PreH2 : (i_pre <> 2)) (PreH3 : (i_pre <> 1)) (PreH4 : (i_pre <> 0)) (PreH5 : (0 <= i_pre)) (PreH6 : (i_pre < 32)) ,
  TT && emp 
|--
  “ (x3 = (qm_vec32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31) (3))) ”
  &&  emp
).

Definition qm_get32_return_wit_29_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre = 3)) (PreH2 : (i_pre <> 2)) (PreH3 : (i_pre <> 1)) (PreH4 : (i_pre <> 0)) (PreH5 : (0 <= i_pre)) (PreH6 : (i_pre < 32)) ,
  (x3 = (qm_vec32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31) (3)))
.

Definition qm_get32_return_wit_30 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre = 2)) (PreH2 : (i_pre <> 1)) (PreH3 : (i_pre <> 0)) (PreH4 : (0 <= i_pre)) (PreH5 : (i_pre < 32)) ,
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
|--
  “ (x2 = (qm_vec32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31) (i_pre))) ”
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
) \/
(
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre = 2)) (PreH2 : (i_pre <> 1)) (PreH3 : (i_pre <> 0)) (PreH4 : (0 <= i_pre)) (PreH5 : (i_pre < 32)) ,
  TT && emp 
|--
  “ (x2 = (qm_vec32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31) (2))) ”
  &&  emp
).

Definition qm_get32_return_wit_30_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre = 2)) (PreH2 : (i_pre <> 1)) (PreH3 : (i_pre <> 0)) (PreH4 : (0 <= i_pre)) (PreH5 : (i_pre < 32)) ,
  (x2 = (qm_vec32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31) (2)))
.

Definition qm_get32_return_wit_31 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre = 1)) (PreH2 : (i_pre <> 0)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) ,
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
|--
  “ (x1 = (qm_vec32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31) (i_pre))) ”
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
) \/
(
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre = 1)) (PreH2 : (i_pre <> 0)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) ,
  TT && emp 
|--
  “ (x1 = (qm_vec32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31) (1))) ”
  &&  emp
).

Definition qm_get32_return_wit_31_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre = 1)) (PreH2 : (i_pre <> 0)) (PreH3 : (0 <= i_pre)) (PreH4 : (i_pre < 32)) ,
  (x1 = (qm_vec32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31) (1)))
.

Definition qm_get32_return_wit_32 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre = 0)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) ,
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
|--
  “ (x0 = (qm_vec32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31) (i_pre))) ”
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
) \/
(
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre = 0)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) ,
  TT && emp 
|--
  “ (x0 = (qm_vec32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31) (0))) ”
  &&  emp
).

Definition qm_get32_return_wit_32_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (PreH1 : (i_pre = 0)) (PreH2 : (0 <= i_pre)) (PreH3 : (i_pre < 32)) ,
  (x0 = (qm_vec32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31) (0)))
.

Module Type VC_Correct.

Include byte_store_Strategy_Correct.

Axiom proof_of_qm_get32_safety_wit_1 : qm_get32_safety_wit_1.
Axiom proof_of_qm_get32_safety_wit_2 : qm_get32_safety_wit_2.
Axiom proof_of_qm_get32_safety_wit_3 : qm_get32_safety_wit_3.
Axiom proof_of_qm_get32_safety_wit_4 : qm_get32_safety_wit_4.
Axiom proof_of_qm_get32_safety_wit_5 : qm_get32_safety_wit_5.
Axiom proof_of_qm_get32_safety_wit_6 : qm_get32_safety_wit_6.
Axiom proof_of_qm_get32_safety_wit_7 : qm_get32_safety_wit_7.
Axiom proof_of_qm_get32_safety_wit_8 : qm_get32_safety_wit_8.
Axiom proof_of_qm_get32_safety_wit_9 : qm_get32_safety_wit_9.
Axiom proof_of_qm_get32_safety_wit_10 : qm_get32_safety_wit_10.
Axiom proof_of_qm_get32_safety_wit_11 : qm_get32_safety_wit_11.
Axiom proof_of_qm_get32_safety_wit_12 : qm_get32_safety_wit_12.
Axiom proof_of_qm_get32_safety_wit_13 : qm_get32_safety_wit_13.
Axiom proof_of_qm_get32_safety_wit_14 : qm_get32_safety_wit_14.
Axiom proof_of_qm_get32_safety_wit_15 : qm_get32_safety_wit_15.
Axiom proof_of_qm_get32_safety_wit_16 : qm_get32_safety_wit_16.
Axiom proof_of_qm_get32_safety_wit_17 : qm_get32_safety_wit_17.
Axiom proof_of_qm_get32_safety_wit_18 : qm_get32_safety_wit_18.
Axiom proof_of_qm_get32_safety_wit_19 : qm_get32_safety_wit_19.
Axiom proof_of_qm_get32_safety_wit_20 : qm_get32_safety_wit_20.
Axiom proof_of_qm_get32_safety_wit_21 : qm_get32_safety_wit_21.
Axiom proof_of_qm_get32_safety_wit_22 : qm_get32_safety_wit_22.
Axiom proof_of_qm_get32_safety_wit_23 : qm_get32_safety_wit_23.
Axiom proof_of_qm_get32_safety_wit_24 : qm_get32_safety_wit_24.
Axiom proof_of_qm_get32_safety_wit_25 : qm_get32_safety_wit_25.
Axiom proof_of_qm_get32_safety_wit_26 : qm_get32_safety_wit_26.
Axiom proof_of_qm_get32_safety_wit_27 : qm_get32_safety_wit_27.
Axiom proof_of_qm_get32_safety_wit_28 : qm_get32_safety_wit_28.
Axiom proof_of_qm_get32_safety_wit_29 : qm_get32_safety_wit_29.
Axiom proof_of_qm_get32_safety_wit_30 : qm_get32_safety_wit_30.
Axiom proof_of_qm_get32_safety_wit_31 : qm_get32_safety_wit_31.
Axiom proof_of_qm_get32_return_wit_1 : qm_get32_return_wit_1.
Axiom proof_of_qm_get32_return_wit_2 : qm_get32_return_wit_2.
Axiom proof_of_qm_get32_return_wit_3 : qm_get32_return_wit_3.
Axiom proof_of_qm_get32_return_wit_4 : qm_get32_return_wit_4.
Axiom proof_of_qm_get32_return_wit_5 : qm_get32_return_wit_5.
Axiom proof_of_qm_get32_return_wit_6 : qm_get32_return_wit_6.
Axiom proof_of_qm_get32_return_wit_7 : qm_get32_return_wit_7.
Axiom proof_of_qm_get32_return_wit_8 : qm_get32_return_wit_8.
Axiom proof_of_qm_get32_return_wit_9 : qm_get32_return_wit_9.
Axiom proof_of_qm_get32_return_wit_10 : qm_get32_return_wit_10.
Axiom proof_of_qm_get32_return_wit_11 : qm_get32_return_wit_11.
Axiom proof_of_qm_get32_return_wit_12 : qm_get32_return_wit_12.
Axiom proof_of_qm_get32_return_wit_13 : qm_get32_return_wit_13.
Axiom proof_of_qm_get32_return_wit_14 : qm_get32_return_wit_14.
Axiom proof_of_qm_get32_return_wit_15 : qm_get32_return_wit_15.
Axiom proof_of_qm_get32_return_wit_16 : qm_get32_return_wit_16.
Axiom proof_of_qm_get32_return_wit_17 : qm_get32_return_wit_17.
Axiom proof_of_qm_get32_return_wit_18 : qm_get32_return_wit_18.
Axiom proof_of_qm_get32_return_wit_19 : qm_get32_return_wit_19.
Axiom proof_of_qm_get32_return_wit_20 : qm_get32_return_wit_20.
Axiom proof_of_qm_get32_return_wit_21 : qm_get32_return_wit_21.
Axiom proof_of_qm_get32_return_wit_22 : qm_get32_return_wit_22.
Axiom proof_of_qm_get32_return_wit_23 : qm_get32_return_wit_23.
Axiom proof_of_qm_get32_return_wit_24 : qm_get32_return_wit_24.
Axiom proof_of_qm_get32_return_wit_25 : qm_get32_return_wit_25.
Axiom proof_of_qm_get32_return_wit_26 : qm_get32_return_wit_26.
Axiom proof_of_qm_get32_return_wit_27 : qm_get32_return_wit_27.
Axiom proof_of_qm_get32_return_wit_28 : qm_get32_return_wit_28.
Axiom proof_of_qm_get32_return_wit_29 : qm_get32_return_wit_29.
Axiom proof_of_qm_get32_return_wit_30 : qm_get32_return_wit_30.
Axiom proof_of_qm_get32_return_wit_31 : qm_get32_return_wit_31.
Axiom proof_of_qm_get32_return_wit_32 : qm_get32_return_wit_32.

End VC_Correct.
