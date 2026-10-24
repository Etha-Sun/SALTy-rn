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
Require Import F32F16.Types.
Require Import F32F16.UShortStoreModel.
Require Import QcpVadd.VaddBits.
Require Import QcpNeonLoop.InvariantFacts.
Require Import QcpNeon.NeonBridge.
Require Import QcpNeonLoop.NeonLoopBridge.
Require Import QcpRvv32.RvvLogic.
Require Import QcpRvv32.RvvStoreModel.
Require Import QcpRvv32.RvvLoopModel.
Require Import F32F16.ProgramModel.
Require Import QcpVadd.VaddBits.
Require Import QcpRvv32.RvvLogic.
Require Import QcpRvv32.RvvStoreModel.
Require Import QcpRvv32.RvvLoopModel.
Local Open Scope sac.
From F32F16 Require Import f16_ushort_store_strategy_goal.
From F32F16 Require Import f16_ushort_store_strategy_proof.
From F32F16 Require Import f16_memory_strategy_goal.
From F32F16 Require Import f16_memory_strategy_proof.

(*----- Function qcp_f16_get32 -----*)

Definition qcp_f16_get32_safety_wit_1 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qcp_f16_get32_safety_wit_2 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
|--
  “ (1 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 1) ”
.

Definition qcp_f16_get32_safety_wit_3 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
|--
  “ (2 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 2) ”
.

Definition qcp_f16_get32_safety_wit_4 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
|--
  “ (3 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 3) ”
.

Definition qcp_f16_get32_safety_wit_5 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
|--
  “ (4 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 4) ”
.

Definition qcp_f16_get32_safety_wit_6 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
|--
  “ (5 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 5) ”
.

Definition qcp_f16_get32_safety_wit_7 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
|--
  “ (6 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 6) ”
.

Definition qcp_f16_get32_safety_wit_8 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
|--
  “ (7 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 7) ”
.

Definition qcp_f16_get32_safety_wit_9 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
|--
  “ (8 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 8) ”
.

Definition qcp_f16_get32_safety_wit_10 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
|--
  “ (9 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 9) ”
.

Definition qcp_f16_get32_safety_wit_11 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
|--
  “ (10 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 10) ”
.

Definition qcp_f16_get32_safety_wit_12 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
|--
  “ (11 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 11) ”
.

Definition qcp_f16_get32_safety_wit_13 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
|--
  “ (12 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 12) ”
.

Definition qcp_f16_get32_safety_wit_14 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
|--
  “ (13 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 13) ”
.

Definition qcp_f16_get32_safety_wit_15 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
|--
  “ (14 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 14) ”
.

Definition qcp_f16_get32_safety_wit_16 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
|--
  “ (15 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 15) ”
.

Definition qcp_f16_get32_safety_wit_17 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
|--
  “ (16 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 16) ”
.

Definition qcp_f16_get32_safety_wit_18 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
|--
  “ (17 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 17) ”
.

Definition qcp_f16_get32_safety_wit_19 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
|--
  “ (18 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 18) ”
.

Definition qcp_f16_get32_safety_wit_20 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 <> i_pre)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
|--
  “ (19 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 19) ”
.

Definition qcp_f16_get32_safety_wit_21 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 <> i_pre)) (PreH23 : (19 <> i_pre)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
|--
  “ (20 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 20) ”
.

Definition qcp_f16_get32_safety_wit_22 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 <> i_pre)) (PreH23 : (19 <> i_pre)) (PreH24 : (20 <> i_pre)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
|--
  “ (21 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 21) ”
.

Definition qcp_f16_get32_safety_wit_23 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 <> i_pre)) (PreH23 : (19 <> i_pre)) (PreH24 : (20 <> i_pre)) (PreH25 : (21 <> i_pre)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
|--
  “ (22 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 22) ”
.

Definition qcp_f16_get32_safety_wit_24 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 <> i_pre)) (PreH23 : (19 <> i_pre)) (PreH24 : (20 <> i_pre)) (PreH25 : (21 <> i_pre)) (PreH26 : (22 <> i_pre)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
|--
  “ (23 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 23) ”
.

Definition qcp_f16_get32_safety_wit_25 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 <> i_pre)) (PreH23 : (19 <> i_pre)) (PreH24 : (20 <> i_pre)) (PreH25 : (21 <> i_pre)) (PreH26 : (22 <> i_pre)) (PreH27 : (23 <> i_pre)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
|--
  “ (24 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 24) ”
.

Definition qcp_f16_get32_safety_wit_26 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 <> i_pre)) (PreH23 : (19 <> i_pre)) (PreH24 : (20 <> i_pre)) (PreH25 : (21 <> i_pre)) (PreH26 : (22 <> i_pre)) (PreH27 : (23 <> i_pre)) (PreH28 : (24 <> i_pre)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
|--
  “ (25 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 25) ”
.

Definition qcp_f16_get32_safety_wit_27 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 <> i_pre)) (PreH23 : (19 <> i_pre)) (PreH24 : (20 <> i_pre)) (PreH25 : (21 <> i_pre)) (PreH26 : (22 <> i_pre)) (PreH27 : (23 <> i_pre)) (PreH28 : (24 <> i_pre)) (PreH29 : (25 <> i_pre)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
|--
  “ (26 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 26) ”
.

Definition qcp_f16_get32_safety_wit_28 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 <> i_pre)) (PreH23 : (19 <> i_pre)) (PreH24 : (20 <> i_pre)) (PreH25 : (21 <> i_pre)) (PreH26 : (22 <> i_pre)) (PreH27 : (23 <> i_pre)) (PreH28 : (24 <> i_pre)) (PreH29 : (25 <> i_pre)) (PreH30 : (26 <> i_pre)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
|--
  “ (27 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 27) ”
.

Definition qcp_f16_get32_safety_wit_29 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 <> i_pre)) (PreH23 : (19 <> i_pre)) (PreH24 : (20 <> i_pre)) (PreH25 : (21 <> i_pre)) (PreH26 : (22 <> i_pre)) (PreH27 : (23 <> i_pre)) (PreH28 : (24 <> i_pre)) (PreH29 : (25 <> i_pre)) (PreH30 : (26 <> i_pre)) (PreH31 : (27 <> i_pre)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
|--
  “ (28 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 28) ”
.

Definition qcp_f16_get32_safety_wit_30 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 <> i_pre)) (PreH23 : (19 <> i_pre)) (PreH24 : (20 <> i_pre)) (PreH25 : (21 <> i_pre)) (PreH26 : (22 <> i_pre)) (PreH27 : (23 <> i_pre)) (PreH28 : (24 <> i_pre)) (PreH29 : (25 <> i_pre)) (PreH30 : (26 <> i_pre)) (PreH31 : (27 <> i_pre)) (PreH32 : (28 <> i_pre)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
|--
  “ (29 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 29) ”
.

Definition qcp_f16_get32_safety_wit_31 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 <> i_pre)) (PreH23 : (19 <> i_pre)) (PreH24 : (20 <> i_pre)) (PreH25 : (21 <> i_pre)) (PreH26 : (22 <> i_pre)) (PreH27 : (23 <> i_pre)) (PreH28 : (24 <> i_pre)) (PreH29 : (25 <> i_pre)) (PreH30 : (26 <> i_pre)) (PreH31 : (27 <> i_pre)) (PreH32 : (28 <> i_pre)) (PreH33 : (29 <> i_pre)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
|--
  “ (30 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 30) ”
.

Definition qcp_f16_get32_safety_wit_32 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 <> i_pre)) (PreH23 : (19 <> i_pre)) (PreH24 : (20 <> i_pre)) (PreH25 : (21 <> i_pre)) (PreH26 : (22 <> i_pre)) (PreH27 : (23 <> i_pre)) (PreH28 : (24 <> i_pre)) (PreH29 : (25 <> i_pre)) (PreH30 : (26 <> i_pre)) (PreH31 : (27 <> i_pre)) (PreH32 : (28 <> i_pre)) (PreH33 : (29 <> i_pre)) (PreH34 : (30 <> i_pre)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
|--
  “ (31 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 31) ”
.

Definition qcp_f16_get32_safety_wit_33 := 
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 <> i_pre)) (PreH23 : (19 <> i_pre)) (PreH24 : (20 <> i_pre)) (PreH25 : (21 <> i_pre)) (PreH26 : (22 <> i_pre)) (PreH27 : (23 <> i_pre)) (PreH28 : (24 <> i_pre)) (PreH29 : (25 <> i_pre)) (PreH30 : (26 <> i_pre)) (PreH31 : (27 <> i_pre)) (PreH32 : (28 <> i_pre)) (PreH33 : (29 <> i_pre)) (PreH34 : (30 <> i_pre)) (PreH35 : (31 <> i_pre)) ,
  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
|--
  “ False ”
.

Definition qcp_f16_get32_return_wit_1 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 <> i_pre)) (PreH23 : (19 <> i_pre)) (PreH24 : (20 <> i_pre)) (PreH25 : (21 <> i_pre)) (PreH26 : (22 <> i_pre)) (PreH27 : (23 <> i_pre)) (PreH28 : (24 <> i_pre)) (PreH29 : (25 <> i_pre)) (PreH30 : (26 <> i_pre)) (PreH31 : (27 <> i_pre)) (PreH32 : (28 <> i_pre)) (PreH33 : (29 <> i_pre)) (PreH34 : (30 <> i_pre)) (PreH35 : (31 = i_pre)) ,
  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
|--
  “ (f16_u16_equal x31 (f16_get (i_pre) (L)) ) ”
  &&  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
) \/
(
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 <> i_pre)) (PreH23 : (19 <> i_pre)) (PreH24 : (20 <> i_pre)) (PreH25 : (21 <> i_pre)) (PreH26 : (22 <> i_pre)) (PreH27 : (23 <> i_pre)) (PreH28 : (24 <> i_pre)) (PreH29 : (25 <> i_pre)) (PreH30 : (26 <> i_pre)) (PreH31 : (27 <> i_pre)) (PreH32 : (28 <> i_pre)) (PreH33 : (29 <> i_pre)) (PreH34 : (30 <> i_pre)) (PreH35 : (31 = i_pre)) ,
  TT && emp 
|--
  “ (f16_u16_equal x31 (f16_get (31) (L)) ) ”
  &&  emp
).

Definition qcp_f16_get32_return_wit_1_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 <> i_pre)) (PreH23 : (19 <> i_pre)) (PreH24 : (20 <> i_pre)) (PreH25 : (21 <> i_pre)) (PreH26 : (22 <> i_pre)) (PreH27 : (23 <> i_pre)) (PreH28 : (24 <> i_pre)) (PreH29 : (25 <> i_pre)) (PreH30 : (26 <> i_pre)) (PreH31 : (27 <> i_pre)) (PreH32 : (28 <> i_pre)) (PreH33 : (29 <> i_pre)) (PreH34 : (30 <> i_pre)) (PreH35 : (31 = i_pre)) ,
  (f16_u16_equal x31 (f16_get (31) (L)) )
.

Definition qcp_f16_get32_return_wit_2 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 <> i_pre)) (PreH23 : (19 <> i_pre)) (PreH24 : (20 <> i_pre)) (PreH25 : (21 <> i_pre)) (PreH26 : (22 <> i_pre)) (PreH27 : (23 <> i_pre)) (PreH28 : (24 <> i_pre)) (PreH29 : (25 <> i_pre)) (PreH30 : (26 <> i_pre)) (PreH31 : (27 <> i_pre)) (PreH32 : (28 <> i_pre)) (PreH33 : (29 <> i_pre)) (PreH34 : (30 = i_pre)) ,
  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
|--
  “ (f16_u16_equal x30 (f16_get (i_pre) (L)) ) ”
  &&  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
) \/
(
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 <> i_pre)) (PreH23 : (19 <> i_pre)) (PreH24 : (20 <> i_pre)) (PreH25 : (21 <> i_pre)) (PreH26 : (22 <> i_pre)) (PreH27 : (23 <> i_pre)) (PreH28 : (24 <> i_pre)) (PreH29 : (25 <> i_pre)) (PreH30 : (26 <> i_pre)) (PreH31 : (27 <> i_pre)) (PreH32 : (28 <> i_pre)) (PreH33 : (29 <> i_pre)) (PreH34 : (30 = i_pre)) ,
  TT && emp 
|--
  “ (f16_u16_equal x30 (f16_get (30) (L)) ) ”
  &&  emp
).

Definition qcp_f16_get32_return_wit_2_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 <> i_pre)) (PreH23 : (19 <> i_pre)) (PreH24 : (20 <> i_pre)) (PreH25 : (21 <> i_pre)) (PreH26 : (22 <> i_pre)) (PreH27 : (23 <> i_pre)) (PreH28 : (24 <> i_pre)) (PreH29 : (25 <> i_pre)) (PreH30 : (26 <> i_pre)) (PreH31 : (27 <> i_pre)) (PreH32 : (28 <> i_pre)) (PreH33 : (29 <> i_pre)) (PreH34 : (30 = i_pre)) ,
  (f16_u16_equal x30 (f16_get (30) (L)) )
.

Definition qcp_f16_get32_return_wit_3 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 <> i_pre)) (PreH23 : (19 <> i_pre)) (PreH24 : (20 <> i_pre)) (PreH25 : (21 <> i_pre)) (PreH26 : (22 <> i_pre)) (PreH27 : (23 <> i_pre)) (PreH28 : (24 <> i_pre)) (PreH29 : (25 <> i_pre)) (PreH30 : (26 <> i_pre)) (PreH31 : (27 <> i_pre)) (PreH32 : (28 <> i_pre)) (PreH33 : (29 = i_pre)) ,
  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
|--
  “ (f16_u16_equal x29 (f16_get (i_pre) (L)) ) ”
  &&  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
) \/
(
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 <> i_pre)) (PreH23 : (19 <> i_pre)) (PreH24 : (20 <> i_pre)) (PreH25 : (21 <> i_pre)) (PreH26 : (22 <> i_pre)) (PreH27 : (23 <> i_pre)) (PreH28 : (24 <> i_pre)) (PreH29 : (25 <> i_pre)) (PreH30 : (26 <> i_pre)) (PreH31 : (27 <> i_pre)) (PreH32 : (28 <> i_pre)) (PreH33 : (29 = i_pre)) ,
  TT && emp 
|--
  “ (f16_u16_equal x29 (f16_get (29) (L)) ) ”
  &&  emp
).

Definition qcp_f16_get32_return_wit_3_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 <> i_pre)) (PreH23 : (19 <> i_pre)) (PreH24 : (20 <> i_pre)) (PreH25 : (21 <> i_pre)) (PreH26 : (22 <> i_pre)) (PreH27 : (23 <> i_pre)) (PreH28 : (24 <> i_pre)) (PreH29 : (25 <> i_pre)) (PreH30 : (26 <> i_pre)) (PreH31 : (27 <> i_pre)) (PreH32 : (28 <> i_pre)) (PreH33 : (29 = i_pre)) ,
  (f16_u16_equal x29 (f16_get (29) (L)) )
.

Definition qcp_f16_get32_return_wit_4 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 <> i_pre)) (PreH23 : (19 <> i_pre)) (PreH24 : (20 <> i_pre)) (PreH25 : (21 <> i_pre)) (PreH26 : (22 <> i_pre)) (PreH27 : (23 <> i_pre)) (PreH28 : (24 <> i_pre)) (PreH29 : (25 <> i_pre)) (PreH30 : (26 <> i_pre)) (PreH31 : (27 <> i_pre)) (PreH32 : (28 = i_pre)) ,
  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
|--
  “ (f16_u16_equal x28 (f16_get (i_pre) (L)) ) ”
  &&  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
) \/
(
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 <> i_pre)) (PreH23 : (19 <> i_pre)) (PreH24 : (20 <> i_pre)) (PreH25 : (21 <> i_pre)) (PreH26 : (22 <> i_pre)) (PreH27 : (23 <> i_pre)) (PreH28 : (24 <> i_pre)) (PreH29 : (25 <> i_pre)) (PreH30 : (26 <> i_pre)) (PreH31 : (27 <> i_pre)) (PreH32 : (28 = i_pre)) ,
  TT && emp 
|--
  “ (f16_u16_equal x28 (f16_get (28) (L)) ) ”
  &&  emp
).

Definition qcp_f16_get32_return_wit_4_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 <> i_pre)) (PreH23 : (19 <> i_pre)) (PreH24 : (20 <> i_pre)) (PreH25 : (21 <> i_pre)) (PreH26 : (22 <> i_pre)) (PreH27 : (23 <> i_pre)) (PreH28 : (24 <> i_pre)) (PreH29 : (25 <> i_pre)) (PreH30 : (26 <> i_pre)) (PreH31 : (27 <> i_pre)) (PreH32 : (28 = i_pre)) ,
  (f16_u16_equal x28 (f16_get (28) (L)) )
.

Definition qcp_f16_get32_return_wit_5 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 <> i_pre)) (PreH23 : (19 <> i_pre)) (PreH24 : (20 <> i_pre)) (PreH25 : (21 <> i_pre)) (PreH26 : (22 <> i_pre)) (PreH27 : (23 <> i_pre)) (PreH28 : (24 <> i_pre)) (PreH29 : (25 <> i_pre)) (PreH30 : (26 <> i_pre)) (PreH31 : (27 = i_pre)) ,
  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
|--
  “ (f16_u16_equal x27 (f16_get (i_pre) (L)) ) ”
  &&  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
) \/
(
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 <> i_pre)) (PreH23 : (19 <> i_pre)) (PreH24 : (20 <> i_pre)) (PreH25 : (21 <> i_pre)) (PreH26 : (22 <> i_pre)) (PreH27 : (23 <> i_pre)) (PreH28 : (24 <> i_pre)) (PreH29 : (25 <> i_pre)) (PreH30 : (26 <> i_pre)) (PreH31 : (27 = i_pre)) ,
  TT && emp 
|--
  “ (f16_u16_equal x27 (f16_get (27) (L)) ) ”
  &&  emp
).

Definition qcp_f16_get32_return_wit_5_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 <> i_pre)) (PreH23 : (19 <> i_pre)) (PreH24 : (20 <> i_pre)) (PreH25 : (21 <> i_pre)) (PreH26 : (22 <> i_pre)) (PreH27 : (23 <> i_pre)) (PreH28 : (24 <> i_pre)) (PreH29 : (25 <> i_pre)) (PreH30 : (26 <> i_pre)) (PreH31 : (27 = i_pre)) ,
  (f16_u16_equal x27 (f16_get (27) (L)) )
.

Definition qcp_f16_get32_return_wit_6 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 <> i_pre)) (PreH23 : (19 <> i_pre)) (PreH24 : (20 <> i_pre)) (PreH25 : (21 <> i_pre)) (PreH26 : (22 <> i_pre)) (PreH27 : (23 <> i_pre)) (PreH28 : (24 <> i_pre)) (PreH29 : (25 <> i_pre)) (PreH30 : (26 = i_pre)) ,
  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
|--
  “ (f16_u16_equal x26 (f16_get (i_pre) (L)) ) ”
  &&  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
) \/
(
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 <> i_pre)) (PreH23 : (19 <> i_pre)) (PreH24 : (20 <> i_pre)) (PreH25 : (21 <> i_pre)) (PreH26 : (22 <> i_pre)) (PreH27 : (23 <> i_pre)) (PreH28 : (24 <> i_pre)) (PreH29 : (25 <> i_pre)) (PreH30 : (26 = i_pre)) ,
  TT && emp 
|--
  “ (f16_u16_equal x26 (f16_get (26) (L)) ) ”
  &&  emp
).

Definition qcp_f16_get32_return_wit_6_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 <> i_pre)) (PreH23 : (19 <> i_pre)) (PreH24 : (20 <> i_pre)) (PreH25 : (21 <> i_pre)) (PreH26 : (22 <> i_pre)) (PreH27 : (23 <> i_pre)) (PreH28 : (24 <> i_pre)) (PreH29 : (25 <> i_pre)) (PreH30 : (26 = i_pre)) ,
  (f16_u16_equal x26 (f16_get (26) (L)) )
.

Definition qcp_f16_get32_return_wit_7 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 <> i_pre)) (PreH23 : (19 <> i_pre)) (PreH24 : (20 <> i_pre)) (PreH25 : (21 <> i_pre)) (PreH26 : (22 <> i_pre)) (PreH27 : (23 <> i_pre)) (PreH28 : (24 <> i_pre)) (PreH29 : (25 = i_pre)) ,
  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
|--
  “ (f16_u16_equal x25 (f16_get (i_pre) (L)) ) ”
  &&  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
) \/
(
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 <> i_pre)) (PreH23 : (19 <> i_pre)) (PreH24 : (20 <> i_pre)) (PreH25 : (21 <> i_pre)) (PreH26 : (22 <> i_pre)) (PreH27 : (23 <> i_pre)) (PreH28 : (24 <> i_pre)) (PreH29 : (25 = i_pre)) ,
  TT && emp 
|--
  “ (f16_u16_equal x25 (f16_get (25) (L)) ) ”
  &&  emp
).

Definition qcp_f16_get32_return_wit_7_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 <> i_pre)) (PreH23 : (19 <> i_pre)) (PreH24 : (20 <> i_pre)) (PreH25 : (21 <> i_pre)) (PreH26 : (22 <> i_pre)) (PreH27 : (23 <> i_pre)) (PreH28 : (24 <> i_pre)) (PreH29 : (25 = i_pre)) ,
  (f16_u16_equal x25 (f16_get (25) (L)) )
.

Definition qcp_f16_get32_return_wit_8 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 <> i_pre)) (PreH23 : (19 <> i_pre)) (PreH24 : (20 <> i_pre)) (PreH25 : (21 <> i_pre)) (PreH26 : (22 <> i_pre)) (PreH27 : (23 <> i_pre)) (PreH28 : (24 = i_pre)) ,
  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
|--
  “ (f16_u16_equal x24 (f16_get (i_pre) (L)) ) ”
  &&  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
) \/
(
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 <> i_pre)) (PreH23 : (19 <> i_pre)) (PreH24 : (20 <> i_pre)) (PreH25 : (21 <> i_pre)) (PreH26 : (22 <> i_pre)) (PreH27 : (23 <> i_pre)) (PreH28 : (24 = i_pre)) ,
  TT && emp 
|--
  “ (f16_u16_equal x24 (f16_get (24) (L)) ) ”
  &&  emp
).

Definition qcp_f16_get32_return_wit_8_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 <> i_pre)) (PreH23 : (19 <> i_pre)) (PreH24 : (20 <> i_pre)) (PreH25 : (21 <> i_pre)) (PreH26 : (22 <> i_pre)) (PreH27 : (23 <> i_pre)) (PreH28 : (24 = i_pre)) ,
  (f16_u16_equal x24 (f16_get (24) (L)) )
.

Definition qcp_f16_get32_return_wit_9 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 <> i_pre)) (PreH23 : (19 <> i_pre)) (PreH24 : (20 <> i_pre)) (PreH25 : (21 <> i_pre)) (PreH26 : (22 <> i_pre)) (PreH27 : (23 = i_pre)) ,
  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
|--
  “ (f16_u16_equal x23 (f16_get (i_pre) (L)) ) ”
  &&  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
) \/
(
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 <> i_pre)) (PreH23 : (19 <> i_pre)) (PreH24 : (20 <> i_pre)) (PreH25 : (21 <> i_pre)) (PreH26 : (22 <> i_pre)) (PreH27 : (23 = i_pre)) ,
  TT && emp 
|--
  “ (f16_u16_equal x23 (f16_get (23) (L)) ) ”
  &&  emp
).

Definition qcp_f16_get32_return_wit_9_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 <> i_pre)) (PreH23 : (19 <> i_pre)) (PreH24 : (20 <> i_pre)) (PreH25 : (21 <> i_pre)) (PreH26 : (22 <> i_pre)) (PreH27 : (23 = i_pre)) ,
  (f16_u16_equal x23 (f16_get (23) (L)) )
.

Definition qcp_f16_get32_return_wit_10 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 <> i_pre)) (PreH23 : (19 <> i_pre)) (PreH24 : (20 <> i_pre)) (PreH25 : (21 <> i_pre)) (PreH26 : (22 = i_pre)) ,
  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
|--
  “ (f16_u16_equal x22 (f16_get (i_pre) (L)) ) ”
  &&  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
) \/
(
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 <> i_pre)) (PreH23 : (19 <> i_pre)) (PreH24 : (20 <> i_pre)) (PreH25 : (21 <> i_pre)) (PreH26 : (22 = i_pre)) ,
  TT && emp 
|--
  “ (f16_u16_equal x22 (f16_get (22) (L)) ) ”
  &&  emp
).

Definition qcp_f16_get32_return_wit_10_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 <> i_pre)) (PreH23 : (19 <> i_pre)) (PreH24 : (20 <> i_pre)) (PreH25 : (21 <> i_pre)) (PreH26 : (22 = i_pre)) ,
  (f16_u16_equal x22 (f16_get (22) (L)) )
.

Definition qcp_f16_get32_return_wit_11 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 <> i_pre)) (PreH23 : (19 <> i_pre)) (PreH24 : (20 <> i_pre)) (PreH25 : (21 = i_pre)) ,
  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
|--
  “ (f16_u16_equal x21 (f16_get (i_pre) (L)) ) ”
  &&  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
) \/
(
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 <> i_pre)) (PreH23 : (19 <> i_pre)) (PreH24 : (20 <> i_pre)) (PreH25 : (21 = i_pre)) ,
  TT && emp 
|--
  “ (f16_u16_equal x21 (f16_get (21) (L)) ) ”
  &&  emp
).

Definition qcp_f16_get32_return_wit_11_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 <> i_pre)) (PreH23 : (19 <> i_pre)) (PreH24 : (20 <> i_pre)) (PreH25 : (21 = i_pre)) ,
  (f16_u16_equal x21 (f16_get (21) (L)) )
.

Definition qcp_f16_get32_return_wit_12 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 <> i_pre)) (PreH23 : (19 <> i_pre)) (PreH24 : (20 = i_pre)) ,
  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
|--
  “ (f16_u16_equal x20 (f16_get (i_pre) (L)) ) ”
  &&  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
) \/
(
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 <> i_pre)) (PreH23 : (19 <> i_pre)) (PreH24 : (20 = i_pre)) ,
  TT && emp 
|--
  “ (f16_u16_equal x20 (f16_get (20) (L)) ) ”
  &&  emp
).

Definition qcp_f16_get32_return_wit_12_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 <> i_pre)) (PreH23 : (19 <> i_pre)) (PreH24 : (20 = i_pre)) ,
  (f16_u16_equal x20 (f16_get (20) (L)) )
.

Definition qcp_f16_get32_return_wit_13 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 <> i_pre)) (PreH23 : (19 = i_pre)) ,
  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
|--
  “ (f16_u16_equal x19 (f16_get (i_pre) (L)) ) ”
  &&  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
) \/
(
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 <> i_pre)) (PreH23 : (19 = i_pre)) ,
  TT && emp 
|--
  “ (f16_u16_equal x19 (f16_get (19) (L)) ) ”
  &&  emp
).

Definition qcp_f16_get32_return_wit_13_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 <> i_pre)) (PreH23 : (19 = i_pre)) ,
  (f16_u16_equal x19 (f16_get (19) (L)) )
.

Definition qcp_f16_get32_return_wit_14 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 = i_pre)) ,
  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
|--
  “ (f16_u16_equal x18 (f16_get (i_pre) (L)) ) ”
  &&  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
) \/
(
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 = i_pre)) ,
  TT && emp 
|--
  “ (f16_u16_equal x18 (f16_get (18) (L)) ) ”
  &&  emp
).

Definition qcp_f16_get32_return_wit_14_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 <> i_pre)) (PreH22 : (18 = i_pre)) ,
  (f16_u16_equal x18 (f16_get (18) (L)) )
.

Definition qcp_f16_get32_return_wit_15 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 = i_pre)) ,
  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
|--
  “ (f16_u16_equal x17 (f16_get (i_pre) (L)) ) ”
  &&  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
) \/
(
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 = i_pre)) ,
  TT && emp 
|--
  “ (f16_u16_equal x17 (f16_get (17) (L)) ) ”
  &&  emp
).

Definition qcp_f16_get32_return_wit_15_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 <> i_pre)) (PreH21 : (17 = i_pre)) ,
  (f16_u16_equal x17 (f16_get (17) (L)) )
.

Definition qcp_f16_get32_return_wit_16 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 = i_pre)) ,
  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
|--
  “ (f16_u16_equal x16 (f16_get (i_pre) (L)) ) ”
  &&  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
) \/
(
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 = i_pre)) ,
  TT && emp 
|--
  “ (f16_u16_equal x16 (f16_get (16) (L)) ) ”
  &&  emp
).

Definition qcp_f16_get32_return_wit_16_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 <> i_pre)) (PreH20 : (16 = i_pre)) ,
  (f16_u16_equal x16 (f16_get (16) (L)) )
.

Definition qcp_f16_get32_return_wit_17 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 = i_pre)) ,
  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
|--
  “ (f16_u16_equal x15 (f16_get (i_pre) (L)) ) ”
  &&  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
) \/
(
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 = i_pre)) ,
  TT && emp 
|--
  “ (f16_u16_equal x15 (f16_get (15) (L)) ) ”
  &&  emp
).

Definition qcp_f16_get32_return_wit_17_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 <> i_pre)) (PreH19 : (15 = i_pre)) ,
  (f16_u16_equal x15 (f16_get (15) (L)) )
.

Definition qcp_f16_get32_return_wit_18 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 = i_pre)) ,
  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
|--
  “ (f16_u16_equal x14 (f16_get (i_pre) (L)) ) ”
  &&  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
) \/
(
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 = i_pre)) ,
  TT && emp 
|--
  “ (f16_u16_equal x14 (f16_get (14) (L)) ) ”
  &&  emp
).

Definition qcp_f16_get32_return_wit_18_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 <> i_pre)) (PreH18 : (14 = i_pre)) ,
  (f16_u16_equal x14 (f16_get (14) (L)) )
.

Definition qcp_f16_get32_return_wit_19 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 = i_pre)) ,
  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
|--
  “ (f16_u16_equal x13 (f16_get (i_pre) (L)) ) ”
  &&  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
) \/
(
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 = i_pre)) ,
  TT && emp 
|--
  “ (f16_u16_equal x13 (f16_get (13) (L)) ) ”
  &&  emp
).

Definition qcp_f16_get32_return_wit_19_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 <> i_pre)) (PreH17 : (13 = i_pre)) ,
  (f16_u16_equal x13 (f16_get (13) (L)) )
.

Definition qcp_f16_get32_return_wit_20 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 = i_pre)) ,
  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
|--
  “ (f16_u16_equal x12 (f16_get (i_pre) (L)) ) ”
  &&  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
) \/
(
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 = i_pre)) ,
  TT && emp 
|--
  “ (f16_u16_equal x12 (f16_get (12) (L)) ) ”
  &&  emp
).

Definition qcp_f16_get32_return_wit_20_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 <> i_pre)) (PreH16 : (12 = i_pre)) ,
  (f16_u16_equal x12 (f16_get (12) (L)) )
.

Definition qcp_f16_get32_return_wit_21 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 = i_pre)) ,
  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
|--
  “ (f16_u16_equal x11 (f16_get (i_pre) (L)) ) ”
  &&  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
) \/
(
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 = i_pre)) ,
  TT && emp 
|--
  “ (f16_u16_equal x11 (f16_get (11) (L)) ) ”
  &&  emp
).

Definition qcp_f16_get32_return_wit_21_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 <> i_pre)) (PreH15 : (11 = i_pre)) ,
  (f16_u16_equal x11 (f16_get (11) (L)) )
.

Definition qcp_f16_get32_return_wit_22 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 = i_pre)) ,
  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
|--
  “ (f16_u16_equal x10 (f16_get (i_pre) (L)) ) ”
  &&  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
) \/
(
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 = i_pre)) ,
  TT && emp 
|--
  “ (f16_u16_equal x10 (f16_get (10) (L)) ) ”
  &&  emp
).

Definition qcp_f16_get32_return_wit_22_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 <> i_pre)) (PreH14 : (10 = i_pre)) ,
  (f16_u16_equal x10 (f16_get (10) (L)) )
.

Definition qcp_f16_get32_return_wit_23 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 = i_pre)) ,
  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
|--
  “ (f16_u16_equal x9 (f16_get (i_pre) (L)) ) ”
  &&  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
) \/
(
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 = i_pre)) ,
  TT && emp 
|--
  “ (f16_u16_equal x9 (f16_get (9) (L)) ) ”
  &&  emp
).

Definition qcp_f16_get32_return_wit_23_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 <> i_pre)) (PreH13 : (9 = i_pre)) ,
  (f16_u16_equal x9 (f16_get (9) (L)) )
.

Definition qcp_f16_get32_return_wit_24 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 = i_pre)) ,
  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
|--
  “ (f16_u16_equal x8 (f16_get (i_pre) (L)) ) ”
  &&  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
) \/
(
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 = i_pre)) ,
  TT && emp 
|--
  “ (f16_u16_equal x8 (f16_get (8) (L)) ) ”
  &&  emp
).

Definition qcp_f16_get32_return_wit_24_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 <> i_pre)) (PreH12 : (8 = i_pre)) ,
  (f16_u16_equal x8 (f16_get (8) (L)) )
.

Definition qcp_f16_get32_return_wit_25 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 = i_pre)) ,
  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
|--
  “ (f16_u16_equal x7 (f16_get (i_pre) (L)) ) ”
  &&  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
) \/
(
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 = i_pre)) ,
  TT && emp 
|--
  “ (f16_u16_equal x7 (f16_get (7) (L)) ) ”
  &&  emp
).

Definition qcp_f16_get32_return_wit_25_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 <> i_pre)) (PreH11 : (7 = i_pre)) ,
  (f16_u16_equal x7 (f16_get (7) (L)) )
.

Definition qcp_f16_get32_return_wit_26 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 = i_pre)) ,
  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
|--
  “ (f16_u16_equal x6 (f16_get (i_pre) (L)) ) ”
  &&  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
) \/
(
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 = i_pre)) ,
  TT && emp 
|--
  “ (f16_u16_equal x6 (f16_get (6) (L)) ) ”
  &&  emp
).

Definition qcp_f16_get32_return_wit_26_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 <> i_pre)) (PreH10 : (6 = i_pre)) ,
  (f16_u16_equal x6 (f16_get (6) (L)) )
.

Definition qcp_f16_get32_return_wit_27 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 = i_pre)) ,
  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
|--
  “ (f16_u16_equal x5 (f16_get (i_pre) (L)) ) ”
  &&  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
) \/
(
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 = i_pre)) ,
  TT && emp 
|--
  “ (f16_u16_equal x5 (f16_get (5) (L)) ) ”
  &&  emp
).

Definition qcp_f16_get32_return_wit_27_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 <> i_pre)) (PreH9 : (5 = i_pre)) ,
  (f16_u16_equal x5 (f16_get (5) (L)) )
.

Definition qcp_f16_get32_return_wit_28 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 = i_pre)) ,
  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
|--
  “ (f16_u16_equal x4 (f16_get (i_pre) (L)) ) ”
  &&  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
) \/
(
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 = i_pre)) ,
  TT && emp 
|--
  “ (f16_u16_equal x4 (f16_get (4) (L)) ) ”
  &&  emp
).

Definition qcp_f16_get32_return_wit_28_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 <> i_pre)) (PreH8 : (4 = i_pre)) ,
  (f16_u16_equal x4 (f16_get (4) (L)) )
.

Definition qcp_f16_get32_return_wit_29 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 = i_pre)) ,
  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
|--
  “ (f16_u16_equal x3 (f16_get (i_pre) (L)) ) ”
  &&  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
) \/
(
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 = i_pre)) ,
  TT && emp 
|--
  “ (f16_u16_equal x3 (f16_get (3) (L)) ) ”
  &&  emp
).

Definition qcp_f16_get32_return_wit_29_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 <> i_pre)) (PreH7 : (3 = i_pre)) ,
  (f16_u16_equal x3 (f16_get (3) (L)) )
.

Definition qcp_f16_get32_return_wit_30 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 = i_pre)) ,
  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
|--
  “ (f16_u16_equal x2 (f16_get (i_pre) (L)) ) ”
  &&  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
) \/
(
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 = i_pre)) ,
  TT && emp 
|--
  “ (f16_u16_equal x2 (f16_get (2) (L)) ) ”
  &&  emp
).

Definition qcp_f16_get32_return_wit_30_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 <> i_pre)) (PreH6 : (2 = i_pre)) ,
  (f16_u16_equal x2 (f16_get (2) (L)) )
.

Definition qcp_f16_get32_return_wit_31 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 = i_pre)) ,
  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
|--
  “ (f16_u16_equal x1 (f16_get (i_pre) (L)) ) ”
  &&  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
) \/
(
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 = i_pre)) ,
  TT && emp 
|--
  “ (f16_u16_equal x1 (f16_get (1) (L)) ) ”
  &&  emp
).

Definition qcp_f16_get32_return_wit_31_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 <> i_pre)) (PreH5 : (1 = i_pre)) ,
  (f16_u16_equal x1 (f16_get (1) (L)) )
.

Definition qcp_f16_get32_return_wit_32 := 
(
forall (i_pre: Z) (a_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 = i_pre)) ,
  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
|--
  “ (f16_u16_equal x0 (f16_get (i_pre) (L)) ) ”
  &&  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
) \/
(
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 = i_pre)) ,
  TT && emp 
|--
  “ (f16_u16_equal x0 (f16_get (0) (L)) ) ”
  &&  emp
).

Definition qcp_f16_get32_return_wit_32_split_goal_1 := 
forall (i_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH4 : (0 = i_pre)) ,
  (f16_u16_equal x0 (f16_get (0) (L)) )
.

(*----- Function qcp_f16_store_next -----*)

Definition qcp_f16_store_next_return_wit_1 := 
(
forall (value_pre: Z) (i_pre: Z) (vl_pre: Z) (p_pre: Z) (P: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < vl_pre)) (PreH3 : (vl_pre <= 32)) ,
  (((p_pre + (i_pre * sizeof(USHORT)))) # UShort  |-> value_pre)
  **  (UShortArray.undef_seg p_pre (i_pre + 1 ) vl_pre )
  **  (UShortArray.seg p_pre 0 i_pre P )
|--
  (UShortArray.seg p_pre 0 (i_pre + 1 ) (f16_snoc (P) (value_pre)) )
  **  (UShortArray.undef_seg p_pre (i_pre + 1 ) vl_pre )
) \/
(
forall (value_pre: Z) (i_pre: Z) (vl_pre: Z) (p_pre: Z) (P: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < vl_pre)) (PreH3 : (vl_pre <= 32)) ,
  (((p_pre + (i_pre * sizeof(USHORT)))) # UShort  |-> value_pre)
  **  (UShortArray.seg p_pre 0 i_pre P )
|--
  (UShortArray.seg p_pre 0 (i_pre + 1 ) (f16_snoc (P) (value_pre)) )
).

Definition qcp_f16_store_next_return_wit_1_split_goal_spatial := 
forall (value_pre: Z) (i_pre: Z) (vl_pre: Z) (p_pre: Z) (P: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < vl_pre)) (PreH3 : (vl_pre <= 32)) ,
  (((p_pre + (i_pre * sizeof(USHORT)))) # UShort  |-> value_pre)
  **  (UShortArray.seg p_pre 0 i_pre P )
|--
  (UShortArray.seg p_pre 0 (i_pre + 1 ) (f16_snoc (P) (value_pre)) )
.

Definition qcp_f16_store_next_partial_solve_wit_1_pure := 
forall (value_pre: Z) (i_pre: Z) (vl_pre: Z) (p_pre: Z) (P: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < vl_pre)) (PreH3 : (vl_pre <= 32)) ,
  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "i" ) )) # UInt64  |-> i_pre)
  **  ((( &( "value" ) )) # UShort  |-> value_pre)
  **  (UShortArray.seg p_pre 0 i_pre P )
  **  (UShortArray.undef_seg p_pre i_pre vl_pre )
|--
  “ (0 <= i_pre) ” 
  &&  “ (i_pre < vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
.

Definition qcp_f16_store_next_partial_solve_wit_1_aux := 
forall (i_pre: Z) (vl_pre: Z) (p_pre: Z) (P: (@list Z)) (PreH1 : (0 <= i_pre)) (PreH2 : (i_pre < vl_pre)) (PreH3 : (vl_pre <= 32)) ,
  (UShortArray.seg p_pre 0 i_pre P )
  **  (UShortArray.undef_seg p_pre i_pre vl_pre )
|--
  “ (0 <= i_pre) ” 
  &&  “ (i_pre < vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (0 <= i_pre) ” 
  &&  “ (i_pre < vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
  &&  (UShortArray.undef_seg p_pre i_pre vl_pre )
  **  (UShortArray.seg p_pre 0 i_pre P )
.

Definition qcp_f16_store_next_partial_solve_wit_1 := qcp_f16_store_next_partial_solve_wit_1_pure -> qcp_f16_store_next_partial_solve_wit_1_aux.

Definition qcp_f16_store_next_which_implies_wit_1 := 
forall (i: Z) (vl: Z) (p: Z) (PreH1 : (0 <= i)) (PreH2 : (i < vl)) (PreH3 : (vl <= 32)) ,
  (UShortArray.undef_seg p i vl )
|--
  (((p + (i * sizeof(USHORT)))) # UShort  |->_)
  **  (UShortArray.undef_seg p (i + 1 ) vl )
.

(*----- Function qcp_f16_vse16 -----*)

Definition qcp_f16_vse16_safety_wit_1 := 
forall (vl_pre: Z) (a_pre: Z) (p_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= vl_pre)) (PreH2 : (vl_pre <= 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) ,
  ((( &( "i" ) )) # UInt64  |->_)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
  **  (UShortArray.undef_full p_pre vl_pre )
|--
  “ (0 <= INT_MAX) ” 
  &&  “ ((INT_MIN) <= 0) ”
.

Definition qcp_f16_vse16_entail_wit_1 := 
(
forall (vl_pre: Z) (a_pre: Z) (p_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= vl_pre)) (PreH2 : (vl_pre <= 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) ,
  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
  **  (UShortArray.undef_full p_pre vl_pre )
|--
  “ (0 <= 0) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) ” 
  &&  “ ((f16_length (L)) = 32) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) ”
  &&  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
  **  (UShortArray.seg p_pre 0 0 (f16_take (0) (L)) )
  **  (UShortArray.undef_seg p_pre 0 vl_pre )
) \/
(
forall (vl_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= vl_pre)) (PreH2 : (vl_pre <= 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) ,
  TT && emp 
|--
  “ ((f16_length (L)) = 32) ”
  &&  emp
).

Definition qcp_f16_vse16_entail_wit_1_split_goal_1 := 
forall (vl_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (PreH1 : (0 <= vl_pre)) (PreH2 : (vl_pre <= 32)) (PreH3 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) ,
  ((f16_length (L)) = 32)
.

Definition qcp_f16_vse16_entail_wit_2 := 
(
forall (vl_pre: Z) (a_pre: Z) (p_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (i: Z) (retval: Z) (PreH1 : (f16_u16_equal retval (f16_get (i) ((f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) )) (PreH2 : (i < vl_pre)) (PreH3 : (0 <= i)) (PreH4 : (i <= vl_pre)) (PreH5 : (vl_pre <= 32)) (PreH6 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH7 : ((f16_length (L)) = 32)) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= 32)) (PreH10 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) ,
  (UShortArray.seg p_pre 0 (i + 1 ) (f16_snoc ((f16_take (i) (L))) (retval)) )
  **  (UShortArray.undef_seg p_pre (i + 1 ) vl_pre )
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
|--
  “ (0 <= (i + 1 )) ” 
  &&  “ ((i + 1 ) <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) ” 
  &&  “ ((f16_length (L)) = 32) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) ”
  &&  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
  **  (UShortArray.seg p_pre 0 (i + 1 ) (f16_take ((i + 1 )) (L)) )
  **  (UShortArray.undef_seg p_pre (i + 1 ) vl_pre )
) \/
(
forall (vl_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (i: Z) (retval: Z) (PreH1 : (f16_u16_equal retval (f16_get (i) ((f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) )) (PreH2 : (i < vl_pre)) (PreH3 : (0 <= i)) (PreH4 : (i <= vl_pre)) (PreH5 : (vl_pre <= 32)) (PreH6 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH7 : ((f16_length (L)) = 32)) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= 32)) (PreH10 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) ,
  TT && emp 
|--
  “ ((f16_snoc ((f16_take (i) (L))) (retval)) = (f16_take ((i + 1 )) (L))) ”
  &&  emp
).

Definition qcp_f16_vse16_entail_wit_2_split_goal_1 := 
forall (vl_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (i: Z) (retval: Z) (PreH1 : (f16_u16_equal retval (f16_get (i) ((f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) )) (PreH2 : (i < vl_pre)) (PreH3 : (0 <= i)) (PreH4 : (i <= vl_pre)) (PreH5 : (vl_pre <= 32)) (PreH6 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH7 : ((f16_length (L)) = 32)) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= 32)) (PreH10 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) ,
  ((f16_snoc ((f16_take (i) (L))) (retval)) = (f16_take ((i + 1 )) (L)))
.

Definition qcp_f16_vse16_return_wit_1 := 
(
forall (vl_pre: Z) (a_pre: Z) (p_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (i: Z) (PreH1 : (i >= vl_pre)) (PreH2 : (0 <= i)) (PreH3 : (i <= vl_pre)) (PreH4 : (vl_pre <= 32)) (PreH5 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH6 : ((f16_length (L)) = 32)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 32)) (PreH9 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) ,
  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
  **  (UShortArray.seg p_pre 0 i (f16_take (i) (L)) )
  **  (UShortArray.undef_seg p_pre i vl_pre )
|--
  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
  **  (UShortArray.full p_pre vl_pre (f16_take (vl_pre) (L)) )
) \/
(
forall (vl_pre: Z) (p_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (i: Z) (PreH1 : (i >= vl_pre)) (PreH2 : (0 <= i)) (PreH3 : (i <= vl_pre)) (PreH4 : (vl_pre <= 32)) (PreH5 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH6 : ((f16_length (L)) = 32)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 32)) (PreH9 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) ,
  (UShortArray.seg p_pre 0 i (f16_take (i) (L)) )
|--
  (UShortArray.full p_pre vl_pre (f16_take (vl_pre) (L)) )
).

Definition qcp_f16_vse16_return_wit_1_split_goal_spatial := 
forall (vl_pre: Z) (p_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (i: Z) (PreH1 : (i >= vl_pre)) (PreH2 : (0 <= i)) (PreH3 : (i <= vl_pre)) (PreH4 : (vl_pre <= 32)) (PreH5 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH6 : ((f16_length (L)) = 32)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 32)) (PreH9 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) ,
  (UShortArray.seg p_pre 0 i (f16_take (i) (L)) )
|--
  (UShortArray.full p_pre vl_pre (f16_take (vl_pre) (L)) )
.

Definition qcp_f16_vse16_partial_solve_wit_1_pure := 
forall (vl_pre: Z) (a_pre: Z) (p_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (i: Z) (PreH1 : (i < vl_pre)) (PreH2 : (0 <= i)) (PreH3 : (i <= vl_pre)) (PreH4 : (vl_pre <= 32)) (PreH5 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH6 : ((f16_length (L)) = 32)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 32)) (PreH9 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) ,
  ((( &( "value" ) )) # UShort  |->_)
  **  ((( &( "i" ) )) # UInt64  |-> i)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
  **  (UShortArray.seg p_pre 0 i (f16_take (i) (L)) )
  **  (UShortArray.undef_seg p_pre i vl_pre )
|--
  “ (0 <= i) ” 
  &&  “ (i < 32) ” 
  &&  “ ((f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)) = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) ”
.

Definition qcp_f16_vse16_partial_solve_wit_1_aux := 
forall (vl_pre: Z) (a_pre: Z) (p_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (i: Z) (PreH1 : (i < vl_pre)) (PreH2 : (0 <= i)) (PreH3 : (i <= vl_pre)) (PreH4 : (vl_pre <= 32)) (PreH5 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH6 : ((f16_length (L)) = 32)) (PreH7 : (0 <= vl_pre)) (PreH8 : (vl_pre <= 32)) (PreH9 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) ,
  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
  **  (UShortArray.seg p_pre 0 i (f16_take (i) (L)) )
  **  (UShortArray.undef_seg p_pre i vl_pre )
|--
  “ (0 <= i) ” 
  &&  “ (i < 32) ” 
  &&  “ ((f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)) = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) ” 
  &&  “ (i < vl_pre) ” 
  &&  “ (0 <= i) ” 
  &&  “ (i <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) ” 
  &&  “ ((f16_length (L)) = 32) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) ”
  &&  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
  **  (UShortArray.seg p_pre 0 i (f16_take (i) (L)) )
  **  (UShortArray.undef_seg p_pre i vl_pre )
.

Definition qcp_f16_vse16_partial_solve_wit_1 := qcp_f16_vse16_partial_solve_wit_1_pure -> qcp_f16_vse16_partial_solve_wit_1_aux.

Definition qcp_f16_vse16_partial_solve_wit_2_pure := 
forall (vl_pre: Z) (a_pre: Z) (p_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (i: Z) (retval: Z) (PreH1 : (f16_u16_equal retval (f16_get (i) ((f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) )) (PreH2 : (i < vl_pre)) (PreH3 : (0 <= i)) (PreH4 : (i <= vl_pre)) (PreH5 : (vl_pre <= 32)) (PreH6 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH7 : ((f16_length (L)) = 32)) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= 32)) (PreH10 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) ,
  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
  **  ((( &( "value" ) )) # UShort  |-> retval)
  **  ((( &( "i" ) )) # UInt64  |-> i)
  **  ((( &( "vl" ) )) # UInt64  |-> vl_pre)
  **  ((( &( "p" ) )) # Ptr  |-> p_pre)
  **  ((( &( "a" ) )) # Ptr  |-> a_pre)
  **  (UShortArray.seg p_pre 0 i (f16_take (i) (L)) )
  **  (UShortArray.undef_seg p_pre i vl_pre )
|--
  “ (0 <= i) ” 
  &&  “ (i < vl_pre) ” 
  &&  “ (vl_pre <= 32) ”
.

Definition qcp_f16_vse16_partial_solve_wit_2_aux := 
forall (vl_pre: Z) (a_pre: Z) (p_pre: Z) (x31: Z) (x30: Z) (x29: Z) (x28: Z) (x27: Z) (x26: Z) (x25: Z) (x24: Z) (x23: Z) (x22: Z) (x21: Z) (x20: Z) (x19: Z) (x18: Z) (x17: Z) (x16: Z) (x15: Z) (x14: Z) (x13: Z) (x12: Z) (x11: Z) (x10: Z) (x9: Z) (x8: Z) (x7: Z) (x6: Z) (x5: Z) (x4: Z) (x3: Z) (x2: Z) (x1: Z) (x0: Z) (L: (@list Z)) (i: Z) (retval: Z) (PreH1 : (f16_u16_equal retval (f16_get (i) ((f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) )) (PreH2 : (i < vl_pre)) (PreH3 : (0 <= i)) (PreH4 : (i <= vl_pre)) (PreH5 : (vl_pre <= 32)) (PreH6 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) (PreH7 : ((f16_length (L)) = 32)) (PreH8 : (0 <= vl_pre)) (PreH9 : (vl_pre <= 32)) (PreH10 : (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) ,
  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
  **  (UShortArray.seg p_pre 0 i (f16_take (i) (L)) )
  **  (UShortArray.undef_seg p_pre i vl_pre )
|--
  “ (0 <= i) ” 
  &&  “ (i < vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (f16_u16_equal retval (f16_get (i) ((f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31)))) ) ” 
  &&  “ (i < vl_pre) ” 
  &&  “ (0 <= i) ” 
  &&  “ (i <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) ” 
  &&  “ ((f16_length (L)) = 32) ” 
  &&  “ (0 <= vl_pre) ” 
  &&  “ (vl_pre <= 32) ” 
  &&  “ (L = (f16_pack32 (x0) (x1) (x2) (x3) (x4) (x5) (x6) (x7) (x8) (x9) (x10) (x11) (x12) (x13) (x14) (x15) (x16) (x17) (x18) (x19) (x20) (x21) (x22) (x23) (x24) (x25) (x26) (x27) (x28) (x29) (x30) (x31))) ”
  &&  (UShortArray.seg p_pre 0 i (f16_take (i) (L)) )
  **  (UShortArray.undef_seg p_pre i vl_pre )
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s0")) # UShort  |-> x0)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s1")) # UShort  |-> x1)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s2")) # UShort  |-> x2)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s3")) # UShort  |-> x3)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s4")) # UShort  |-> x4)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s5")) # UShort  |-> x5)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s6")) # UShort  |-> x6)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s7")) # UShort  |-> x7)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s8")) # UShort  |-> x8)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s9")) # UShort  |-> x9)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s10")) # UShort  |-> x10)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s11")) # UShort  |-> x11)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s12")) # UShort  |-> x12)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s13")) # UShort  |-> x13)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s14")) # UShort  |-> x14)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s15")) # UShort  |-> x15)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s16")) # UShort  |-> x16)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s17")) # UShort  |-> x17)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s18")) # UShort  |-> x18)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s19")) # UShort  |-> x19)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s20")) # UShort  |-> x20)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s21")) # UShort  |-> x21)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s22")) # UShort  |-> x22)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s23")) # UShort  |-> x23)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s24")) # UShort  |-> x24)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s25")) # UShort  |-> x25)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s26")) # UShort  |-> x26)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s27")) # UShort  |-> x27)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s28")) # UShort  |-> x28)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s29")) # UShort  |-> x29)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s30")) # UShort  |-> x30)
  **  ((&((a_pre)  # "vuint16m4_t" ->ₛ "s31")) # UShort  |-> x31)
.

Definition qcp_f16_vse16_partial_solve_wit_2 := qcp_f16_vse16_partial_solve_wit_2_pure -> qcp_f16_vse16_partial_solve_wit_2_aux.

Module Type VC_Correct.

Include f16_ushort_store_Strategy_Correct.
Include f16_memory_Strategy_Correct.

Axiom proof_of_qcp_f16_get32_safety_wit_1 : qcp_f16_get32_safety_wit_1.
Axiom proof_of_qcp_f16_get32_safety_wit_2 : qcp_f16_get32_safety_wit_2.
Axiom proof_of_qcp_f16_get32_safety_wit_3 : qcp_f16_get32_safety_wit_3.
Axiom proof_of_qcp_f16_get32_safety_wit_4 : qcp_f16_get32_safety_wit_4.
Axiom proof_of_qcp_f16_get32_safety_wit_5 : qcp_f16_get32_safety_wit_5.
Axiom proof_of_qcp_f16_get32_safety_wit_6 : qcp_f16_get32_safety_wit_6.
Axiom proof_of_qcp_f16_get32_safety_wit_7 : qcp_f16_get32_safety_wit_7.
Axiom proof_of_qcp_f16_get32_safety_wit_8 : qcp_f16_get32_safety_wit_8.
Axiom proof_of_qcp_f16_get32_safety_wit_9 : qcp_f16_get32_safety_wit_9.
Axiom proof_of_qcp_f16_get32_safety_wit_10 : qcp_f16_get32_safety_wit_10.
Axiom proof_of_qcp_f16_get32_safety_wit_11 : qcp_f16_get32_safety_wit_11.
Axiom proof_of_qcp_f16_get32_safety_wit_12 : qcp_f16_get32_safety_wit_12.
Axiom proof_of_qcp_f16_get32_safety_wit_13 : qcp_f16_get32_safety_wit_13.
Axiom proof_of_qcp_f16_get32_safety_wit_14 : qcp_f16_get32_safety_wit_14.
Axiom proof_of_qcp_f16_get32_safety_wit_15 : qcp_f16_get32_safety_wit_15.
Axiom proof_of_qcp_f16_get32_safety_wit_16 : qcp_f16_get32_safety_wit_16.
Axiom proof_of_qcp_f16_get32_safety_wit_17 : qcp_f16_get32_safety_wit_17.
Axiom proof_of_qcp_f16_get32_safety_wit_18 : qcp_f16_get32_safety_wit_18.
Axiom proof_of_qcp_f16_get32_safety_wit_19 : qcp_f16_get32_safety_wit_19.
Axiom proof_of_qcp_f16_get32_safety_wit_20 : qcp_f16_get32_safety_wit_20.
Axiom proof_of_qcp_f16_get32_safety_wit_21 : qcp_f16_get32_safety_wit_21.
Axiom proof_of_qcp_f16_get32_safety_wit_22 : qcp_f16_get32_safety_wit_22.
Axiom proof_of_qcp_f16_get32_safety_wit_23 : qcp_f16_get32_safety_wit_23.
Axiom proof_of_qcp_f16_get32_safety_wit_24 : qcp_f16_get32_safety_wit_24.
Axiom proof_of_qcp_f16_get32_safety_wit_25 : qcp_f16_get32_safety_wit_25.
Axiom proof_of_qcp_f16_get32_safety_wit_26 : qcp_f16_get32_safety_wit_26.
Axiom proof_of_qcp_f16_get32_safety_wit_27 : qcp_f16_get32_safety_wit_27.
Axiom proof_of_qcp_f16_get32_safety_wit_28 : qcp_f16_get32_safety_wit_28.
Axiom proof_of_qcp_f16_get32_safety_wit_29 : qcp_f16_get32_safety_wit_29.
Axiom proof_of_qcp_f16_get32_safety_wit_30 : qcp_f16_get32_safety_wit_30.
Axiom proof_of_qcp_f16_get32_safety_wit_31 : qcp_f16_get32_safety_wit_31.
Axiom proof_of_qcp_f16_get32_safety_wit_32 : qcp_f16_get32_safety_wit_32.
Axiom proof_of_qcp_f16_get32_safety_wit_33 : qcp_f16_get32_safety_wit_33.
Axiom proof_of_qcp_f16_get32_return_wit_1 : qcp_f16_get32_return_wit_1.
Axiom proof_of_qcp_f16_get32_return_wit_2 : qcp_f16_get32_return_wit_2.
Axiom proof_of_qcp_f16_get32_return_wit_3 : qcp_f16_get32_return_wit_3.
Axiom proof_of_qcp_f16_get32_return_wit_4 : qcp_f16_get32_return_wit_4.
Axiom proof_of_qcp_f16_get32_return_wit_5 : qcp_f16_get32_return_wit_5.
Axiom proof_of_qcp_f16_get32_return_wit_6 : qcp_f16_get32_return_wit_6.
Axiom proof_of_qcp_f16_get32_return_wit_7 : qcp_f16_get32_return_wit_7.
Axiom proof_of_qcp_f16_get32_return_wit_8 : qcp_f16_get32_return_wit_8.
Axiom proof_of_qcp_f16_get32_return_wit_9 : qcp_f16_get32_return_wit_9.
Axiom proof_of_qcp_f16_get32_return_wit_10 : qcp_f16_get32_return_wit_10.
Axiom proof_of_qcp_f16_get32_return_wit_11 : qcp_f16_get32_return_wit_11.
Axiom proof_of_qcp_f16_get32_return_wit_12 : qcp_f16_get32_return_wit_12.
Axiom proof_of_qcp_f16_get32_return_wit_13 : qcp_f16_get32_return_wit_13.
Axiom proof_of_qcp_f16_get32_return_wit_14 : qcp_f16_get32_return_wit_14.
Axiom proof_of_qcp_f16_get32_return_wit_15 : qcp_f16_get32_return_wit_15.
Axiom proof_of_qcp_f16_get32_return_wit_16 : qcp_f16_get32_return_wit_16.
Axiom proof_of_qcp_f16_get32_return_wit_17 : qcp_f16_get32_return_wit_17.
Axiom proof_of_qcp_f16_get32_return_wit_18 : qcp_f16_get32_return_wit_18.
Axiom proof_of_qcp_f16_get32_return_wit_19 : qcp_f16_get32_return_wit_19.
Axiom proof_of_qcp_f16_get32_return_wit_20 : qcp_f16_get32_return_wit_20.
Axiom proof_of_qcp_f16_get32_return_wit_21 : qcp_f16_get32_return_wit_21.
Axiom proof_of_qcp_f16_get32_return_wit_22 : qcp_f16_get32_return_wit_22.
Axiom proof_of_qcp_f16_get32_return_wit_23 : qcp_f16_get32_return_wit_23.
Axiom proof_of_qcp_f16_get32_return_wit_24 : qcp_f16_get32_return_wit_24.
Axiom proof_of_qcp_f16_get32_return_wit_25 : qcp_f16_get32_return_wit_25.
Axiom proof_of_qcp_f16_get32_return_wit_26 : qcp_f16_get32_return_wit_26.
Axiom proof_of_qcp_f16_get32_return_wit_27 : qcp_f16_get32_return_wit_27.
Axiom proof_of_qcp_f16_get32_return_wit_28 : qcp_f16_get32_return_wit_28.
Axiom proof_of_qcp_f16_get32_return_wit_29 : qcp_f16_get32_return_wit_29.
Axiom proof_of_qcp_f16_get32_return_wit_30 : qcp_f16_get32_return_wit_30.
Axiom proof_of_qcp_f16_get32_return_wit_31 : qcp_f16_get32_return_wit_31.
Axiom proof_of_qcp_f16_get32_return_wit_32 : qcp_f16_get32_return_wit_32.
Axiom proof_of_qcp_f16_store_next_return_wit_1 : qcp_f16_store_next_return_wit_1.
Axiom proof_of_qcp_f16_store_next_partial_solve_wit_1_pure : qcp_f16_store_next_partial_solve_wit_1_pure.
Axiom proof_of_qcp_f16_store_next_partial_solve_wit_1 : qcp_f16_store_next_partial_solve_wit_1.
Axiom proof_of_qcp_f16_store_next_which_implies_wit_1 : qcp_f16_store_next_which_implies_wit_1.
Axiom proof_of_qcp_f16_vse16_safety_wit_1 : qcp_f16_vse16_safety_wit_1.
Axiom proof_of_qcp_f16_vse16_entail_wit_1 : qcp_f16_vse16_entail_wit_1.
Axiom proof_of_qcp_f16_vse16_entail_wit_2 : qcp_f16_vse16_entail_wit_2.
Axiom proof_of_qcp_f16_vse16_return_wit_1 : qcp_f16_vse16_return_wit_1.
Axiom proof_of_qcp_f16_vse16_partial_solve_wit_1_pure : qcp_f16_vse16_partial_solve_wit_1_pure.
Axiom proof_of_qcp_f16_vse16_partial_solve_wit_1 : qcp_f16_vse16_partial_solve_wit_1.
Axiom proof_of_qcp_f16_vse16_partial_solve_wit_2_pure : qcp_f16_vse16_partial_solve_wit_2_pure.
Axiom proof_of_qcp_f16_vse16_partial_solve_wit_2 : qcp_f16_vse16_partial_solve_wit_2.

End VC_Correct.
